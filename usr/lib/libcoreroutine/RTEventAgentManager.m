@interface RTEventAgentManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)pluginConnection;
- (RTEventAgentManager)init;
- (RTEventAgentManager)initWithPlatform:(id)a3;
- (RTPlatform)platform;
- (void)_launchDaemonWithRestorationIdentifier:(id)a3 withReply:(id)a4;
- (void)_setup;
- (void)checkin;
- (void)dealloc;
- (void)launchDaemonWithRestorationIdentifier:(id)a3 withReply:(id)a4;
- (void)onLaunchDaemonWithRestorationIdentifierFromDefaults;
- (void)setPlatform:(id)a3;
- (void)setPluginConnection:(id)a3;
- (void)setup;
@end

@implementation RTEventAgentManager

- (RTEventAgentManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlatform_);
}

- (RTEventAgentManager)initWithPlatform:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTEventAgentManager;
  v6 = [(RTXPCListener *)&v9 initWithMachServiceName:@"com.apple.routined.event"];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platform, a3);
    [(RTEventAgentManager *)v7 setup];
  }

  return v7;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)RTEventAgentManager;
  [(RTEventAgentManager *)&v4 dealloc];
}

- (void)_setup
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(RTXPCListener *)self queue];
  [(RTEventAgentManager *)self _setQueue:v3];

  [(RTEventAgentManager *)self setDelegate:self];
  [(RTEventAgentManager *)self resume];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.routined.event", 0, 0, 1u);
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    id v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)onLaunchDaemonWithRestorationIdentifierFromDefaults, @"LaunchDaemonWithRestorationIdentifier", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    v8 = @"com.apple.routined.event";
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "listening on mach port, %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setup
{
  v3 = [(RTXPCListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__RTEventAgentManager_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __28__RTEventAgentManager_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = +[RTXPC executablePathOfConnection:v5];
    int v8 = [v5 processIdentifier];
    uint64_t v9 = +[RTXPC signingIdentifierOfConnection:v5];
    int v11 = 138412802;
    v12 = v7;
    __int16 v13 = 1024;
    int v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "incoming connetion from %@(%d), signing identifier, %@", (uint8_t *)&v11, 0x1Cu);
  }
  [(RTEventAgentManager *)self setPluginConnection:v5];

  return 1;
}

- (void)setPluginConnection:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_pluginConnection, a3);
  pluginConnection = self->_pluginConnection;
  int v7 = [(RTXPCListener *)self queue];
  [(NSXPCConnection *)pluginConnection _setQueue:v7];

  int v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34F2CA0];
  [(NSXPCConnection *)self->_pluginConnection setRemoteObjectInterface:v8];

  uint64_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34A7C08];
  [(NSXPCConnection *)self->_pluginConnection setExportedInterface:v9];

  [(NSXPCConnection *)self->_pluginConnection setExportedObject:self];
  [(NSXPCConnection *)self->_pluginConnection setInterruptionHandler:&__block_literal_global_102];
  [(NSXPCConnection *)self->_pluginConnection setInvalidationHandler:&__block_literal_global_56];
  [(NSXPCConnection *)self->_pluginConnection resume];
  v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v11 = 0;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "UserEventAgent plugin connected", v11, 2u);
  }
}

void __43__RTEventAgentManager_setPluginConnection___block_invoke()
{
  v0 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D9BFA000, v0, OS_LOG_TYPE_INFO, "handle xpc interruption for UserEventAgent plugin", v1, 2u);
  }
}

void __43__RTEventAgentManager_setPluginConnection___block_invoke_54()
{
  v0 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D9BFA000, v0, OS_LOG_TYPE_INFO, "handle xpc invalidation for UserEventAgent plugin", v1, 2u);
  }
}

- (void)onLaunchDaemonWithRestorationIdentifierFromDefaults
{
  if ([(RTPlatform *)self->_platform internalInstall])
  {
    objc_super v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v5 = [v4 objectForKey:@"LaunchDaemonWithRestorationIdentifier"];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __74__RTEventAgentManager_onLaunchDaemonWithRestorationIdentifierFromDefaults__block_invoke;
      v6[3] = &unk_1E6B9A970;
      SEL v8 = a2;
      id v7 = v5;
      [(RTEventAgentManager *)self launchDaemonWithRestorationIdentifier:v7 withReply:v6];
    }
  }
}

void __74__RTEventAgentManager_onLaunchDaemonWithRestorationIdentifierFromDefaults__block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_super v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = @"NO";
    int v8 = 138412802;
    uint64_t v9 = v5;
    if (a2) {
      id v7 = @"YES";
    }
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = v7;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, restoration identifier, %@, client launched, %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)_launchDaemonWithRestorationIdentifier:(id)a3 withReply:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "launch daemon with restoration identifer, %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v9 = [(RTEventAgentManager *)self pluginConnection];
  __int16 v10 = [v9 remoteObjectProxy];
  [v10 launchDaemonWithRestorationIdentifier:v6 reply:v7];
}

- (void)launchDaemonWithRestorationIdentifier:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(RTXPCListener *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTEventAgentManager_launchDaemonWithRestorationIdentifier_withReply___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __71__RTEventAgentManager_launchDaemonWithRestorationIdentifier_withReply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchDaemonWithRestorationIdentifier:*(void *)(a1 + 40) withReply:*(void *)(a1 + 48)];
}

- (void)checkin
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = NSStringFromSelector(a2);
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "UserEventAgent plugin %@", (uint8_t *)&v5, 0xCu);
  }
}

- (NSXPCConnection)pluginConnection
{
  return self->_pluginConnection;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);

  objc_storeStrong((id *)&self->_pluginConnection, 0);
}

@end