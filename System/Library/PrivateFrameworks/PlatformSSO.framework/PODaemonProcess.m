@interface PODaemonProcess
+ (BOOL)syncPending;
+ (NSTimer)syncTimer;
+ (id)_prebootSyncQueue;
+ (void)setSyncPending:(BOOL)a3;
+ (void)setSyncTimer:(id)a3;
- (BOOL)_initDataVaultIfNeededWithError:(id *)a3;
- (BOOL)_removeDeviceConfigurationForIdentifer:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5;
- (BOOL)_removeLoginConfigurationForIdentifer:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5;
- (BOOL)_removeUserConfigurationForIdentifier:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5;
- (BOOL)_saveDeviceConfiguration:(id)a3 identifer:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6;
- (BOOL)_saveLoginConfiguration:(id)a3 identifer:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6;
- (BOOL)_saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6;
- (BOOL)_saveUserLoginStateList:(id)a3 error:(id *)a4;
- (BOOL)_updateGroupForRight:(id)a3 newGroup:(id)a4;
- (BOOL)dataVaultInitialized;
- (POConfigurationManager)configurationManager;
- (PODaemonProcess)init;
- (PODaemonProcess)initWithXPCConnection:(id)a3;
- (PODirectoryServices)directoryServices;
- (POUserGroupManager)userGroupManager;
- (SOConfigurationHost)configurationHost;
- (void)_disablePlatformSSORuleForLogin:(id)a3;
- (void)_disablePlatformSSORuleForScreensaver:(id)a3;
- (void)_enablePlatformSSORuleForLogin:(id)a3;
- (void)_enablePlatformSSORuleForScreensaver:(id)a3;
- (void)connectionInvalidated;
- (void)createAppSSOCachePathWithCompletion:(id)a3;
- (void)disablePlatformSSORules:(id)a3;
- (void)enablePlatformSSORules:(id)a3;
- (void)handleAuthRights;
- (void)handleStartup;
- (void)migrateConfiguration:(BOOL)a3 completion:(id)a4;
- (void)removeDeviceConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)removeLoginConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)removeUserConfigurationForIdentifier:(id)a3 completion:(id)a4;
- (void)resetStoredConfigurationWithCompletion:(id)a3;
- (void)saveAppSSOConfiguration:(id)a3 completion:(id)a4;
- (void)saveDeviceConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveDeviceConfigurationSyncAllConfigToPreboot:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveLoginConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveUserConfiguration:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6;
- (void)saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6;
- (void)setConfigurationHost:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDataVaultInitialized:(BOOL)a3;
- (void)setDirectoryServices:(id)a3;
- (void)setUserGroupManager:(id)a3;
@end

@implementation PODaemonProcess

- (PODaemonProcess)init
{
  v13.receiver = self;
  v13.super_class = (Class)PODaemonProcess;
  v2 = [(PODaemonCoreProcess *)&v13 initForBaseSystem:0];
  v3 = v2;
  if (v2)
  {
    v2->_dataVaultInitialized = 0;
    v4 = objc_alloc_init(PODirectoryServices);
    directoryServices = v3->_directoryServices;
    v3->_directoryServices = v4;

    v6 = [POUserGroupManager alloc];
    v7 = [(PODaemonCoreProcess *)v3 _defaultConfigurationPath];
    uint64_t v8 = [(POUserGroupManager *)v6 initWithFilePath:v7];
    userGroupManager = v3->_userGroupManager;
    v3->_userGroupManager = (POUserGroupManager *)v8;

    if (!_syncLock)
    {
      id v10 = objc_alloc_init(MEMORY[0x263F8C6D0]);
      v11 = (void *)_syncLock;
      _syncLock = (uint64_t)v10;
    }
  }
  return v3;
}

- (PODaemonProcess)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess initWithXPCConnection:]();
  }

  v6 = [v4 valueForEntitlement:@"com.apple.private.platformsso.agent"];
  v7 = v6;
  if (v6 && ([v6 BOOLValue] & 1) != 0)
  {
    uint64_t v8 = [(PODaemonProcess *)self init];
    v9 = v8;
    if (v8) {
      objc_storeWeak((id *)&v8->_xpcConnection, v4);
    }
    self = v9;
    id v10 = self;
  }
  else
  {
    id v11 = __41__PODaemonProcess_initWithXPCConnection___block_invoke();
    id v10 = 0;
  }

  return v10;
}

id __41__PODaemonProcess_initWithXPCConnection___block_invoke()
{
  v0 = [MEMORY[0x263F5E610] errorWithCode:-1002 description:@"missing required entitlement"];
  v1 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[PODaemonProcess connectionInvalidated]";
    __int16 v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_230E51000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }
}

+ (id)_prebootSyncQueue
{
  if (_prebootSyncQueue_onceToken != -1) {
    dispatch_once(&_prebootSyncQueue_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)_prebootSyncQueue_queue;

  return v2;
}

uint64_t __36__PODaemonProcess__prebootSyncQueue__block_invoke()
{
  _prebootSyncQueue_queue = (uint64_t)dispatch_queue_create("com.apple.PlatformSSO.sync-queue", 0);

  return MEMORY[0x270F9A758]();
}

+ (BOOL)syncPending
{
  return _syncPending;
}

+ (void)setSyncPending:(BOOL)a3
{
  _syncPending = a3;
}

+ (NSTimer)syncTimer
{
  return (NSTimer *)(id)_syncTimer;
}

+ (void)setSyncTimer:(id)a3
{
}

- (POConfigurationManager)configurationManager
{
  configurationManager = self->_configurationManager;
  if (!configurationManager)
  {
    int v4 = [POConfigurationManager alloc];
    v5 = [(PODaemonProcess *)self directoryServices];
    __int16 v6 = [(POConfigurationManager *)v4 initWithUserName:0 directoryServices:v5 sharedOnly:1];
    v7 = self->_configurationManager;
    self->_configurationManager = v6;

    configurationManager = self->_configurationManager;
  }

  return configurationManager;
}

- (SOConfigurationHost)configurationHost
{
  configurationHost = self->_configurationHost;
  if (!configurationHost)
  {
    int v4 = (SOConfigurationHost *)objc_alloc_init((Class)getSOConfigurationHostClass());
    v5 = self->_configurationHost;
    self->_configurationHost = v4;

    configurationHost = self->_configurationHost;
  }

  return configurationHost;
}

- (void)handleStartup
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "handleStartup", v2, v3, v4, v5, v6);
}

- (void)migrateConfiguration:(BOOL)a3 completion:(id)a4
{
  uint64_t v4 = (void (**)(id, uint64_t, void))a4;
  uint64_t v5 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess migrateConfiguration:completion:]();
  }

  v4[2](v4, 1, 0);
}

- (void)handleAuthRights
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

void __35__PODaemonProcess_handleAuthRights__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __35__PODaemonProcess_handleAuthRights__block_invoke_cold_1();
    }

    uint64_t v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 setValue:*(void *)(a1 + 32) forKey:@"com.apple.AuthRightCheck"];
  }
}

- (BOOL)_removeDeviceConfigurationForIdentifer:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[PODaemonProcess _removeDeviceConfigurationForIdentifer:syncToPreboot:error:]";
    __int16 v27 = 2114;
    id v28 = v7;
    __int16 v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  v9 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v10 = v9;
  if (v7)
  {
    id v11 = objc_msgSend(NSString, "stringWithFormat:", *MEMORY[0x263F5E6C0], v7);
    v12 = [v10 URLByAppendingPathComponent:v11];
  }
  else
  {
    v12 = [v9 URLByAppendingPathComponent:*MEMORY[0x263F5E6C8]];
  }

  objc_super v13 = [MEMORY[0x263F08850] defaultManager];
  id v24 = 0;
  char v14 = [v13 removeItemAtURL:v12 error:&v24];
  id v15 = v24;

  if (v14) {
    goto LABEL_9;
  }
  v16 = [v15 userInfo];
  v17 = [v16 objectForKeyedSubscript:@"NSUnderlyingError"];

  if ([v17 code] == 2)
  {

LABEL_9:
    [MEMORY[0x263F5E5F8] updateTriggerFile];
    BOOL v18 = 1;
    goto LABEL_13;
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __78__PODaemonProcess__removeDeviceConfigurationForIdentifer_syncToPreboot_error___block_invoke;
  v22[3] = &unk_264BBECA8;
  id v23 = v15;
  v19 = __78__PODaemonProcess__removeDeviceConfigurationForIdentifer_syncToPreboot_error___block_invoke((uint64_t)v22);
  v20 = v19;
  if (a5) {
    *a5 = v19;
  }

  BOOL v18 = 0;
LABEL_13:

  return v18;
}

id __78__PODaemonProcess__removeDeviceConfigurationForIdentifer_syncToPreboot_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1007 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove device configuration"];
  uint64_t v2 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)resetStoredConfigurationWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[PODaemonProcess resetStoredConfigurationWithCompletion:]";
    __int16 v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint8_t v6 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  [(PODaemonProcess *)self setDataVaultInitialized:0];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v17 = 0;
  char v8 = [v7 removeItemAtURL:v6 error:&v17];
  id v9 = v17;

  if ((v8 & 1) == 0)
  {
    id v10 = [v9 userInfo];
    id v11 = [v10 objectForKeyedSubscript:@"NSUnderlyingError"];

    if ([v11 code] != 2)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __58__PODaemonProcess_resetStoredConfigurationWithCompletion___block_invoke;
      v15[3] = &unk_264BBECA8;
      id v16 = v9;
      char v14 = __58__PODaemonProcess_resetStoredConfigurationWithCompletion___block_invoke((uint64_t)v15);
      v4[2](v4, 0, v14);

      goto LABEL_8;
    }
  }
  [(PODaemonProcess *)self _initDataVaultIfNeededWithError:0];
  v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v12 removeObjectForKey:@"com.apple.AuthRightCheck"];

  objc_super v13 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v13 removeObjectForKey:@"com.apple.MigrationCheck"];

  [MEMORY[0x263F5E5F8] updateTriggerFile];
  v4[2](v4, 1, 0);
LABEL_8:
}

id __58__PODaemonProcess_resetStoredConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove platform sso configuration folder"];
  uint64_t v2 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)removeDeviceConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, BOOL, id))a4;
  char v8 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v13 = "-[PODaemonProcess removeDeviceConfigurationForIdentifer:completion:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  id v11 = 0;
  BOOL v9 = [(PODaemonProcess *)self _removeDeviceConfigurationForIdentifer:v6 syncToPreboot:1 error:&v11];
  id v10 = v11;
  v7[2](v7, v9, v10);
}

- (BOOL)_removeLoginConfigurationForIdentifer:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  char v8 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[PODaemonProcess _removeLoginConfigurationForIdentifer:syncToPreboot:error:]";
    __int16 v27 = 2114;
    id v28 = v7;
    __int16 v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  BOOL v9 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v10 = v9;
  if (v7)
  {
    id v11 = objc_msgSend(NSString, "stringWithFormat:", *MEMORY[0x263F5E6D0], v7);
    v12 = [v10 URLByAppendingPathComponent:v11];
  }
  else
  {
    v12 = [v9 URLByAppendingPathComponent:*MEMORY[0x263F5E6D8]];
  }

  objc_super v13 = [MEMORY[0x263F08850] defaultManager];
  id v24 = 0;
  char v14 = [v13 removeItemAtURL:v12 error:&v24];
  id v15 = v24;

  if (v14) {
    goto LABEL_9;
  }
  __int16 v16 = [v15 userInfo];
  id v17 = [v16 objectForKeyedSubscript:@"NSUnderlyingError"];

  if ([v17 code] == 2)
  {

LABEL_9:
    [MEMORY[0x263F5E5F8] updateTriggerFile];
    BOOL v18 = 1;
    goto LABEL_13;
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __77__PODaemonProcess__removeLoginConfigurationForIdentifer_syncToPreboot_error___block_invoke;
  v22[3] = &unk_264BBECA8;
  id v23 = v15;
  v19 = __77__PODaemonProcess__removeLoginConfigurationForIdentifer_syncToPreboot_error___block_invoke((uint64_t)v22);
  __int16 v20 = v19;
  if (a5) {
    *a5 = v19;
  }

  BOOL v18 = 0;
LABEL_13:

  return v18;
}

id __77__PODaemonProcess__removeLoginConfigurationForIdentifer_syncToPreboot_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1007 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove login configuration"];
  uint64_t v2 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)removeLoginConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, BOOL, id))a4;
  char v8 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v13 = "-[PODaemonProcess removeLoginConfigurationForIdentifer:completion:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  id v11 = 0;
  BOOL v9 = [(PODaemonProcess *)self _removeLoginConfigurationForIdentifer:v6 syncToPreboot:1 error:&v11];
  id v10 = v11;
  v7[2](v7, v9, v10);
}

- (BOOL)_removeUserConfigurationForIdentifier:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  char v8 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[PODaemonProcess _removeUserConfigurationForIdentifier:syncToPreboot:error:]";
    __int16 v26 = 2114;
    id v27 = v7;
    __int16 v28 = 2112;
    __int16 v29 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  BOOL v9 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v10 = objc_msgSend(NSString, "stringWithFormat:", *MEMORY[0x263F5E6F8], v7);
  id v11 = [v9 URLByAppendingPathComponent:v10];

  v12 = [MEMORY[0x263F08850] defaultManager];
  id v23 = 0;
  char v13 = [v12 removeItemAtURL:v11 error:&v23];
  id v14 = v23;

  if (v13) {
    goto LABEL_6;
  }
  id v15 = [v14 userInfo];
  __int16 v16 = [v15 objectForKeyedSubscript:@"NSUnderlyingError"];

  if ([v16 code] == 2)
  {

LABEL_6:
    [MEMORY[0x263F5E5F8] updateTriggerFile];
    BOOL v17 = 1;
    goto LABEL_10;
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__PODaemonProcess__removeUserConfigurationForIdentifier_syncToPreboot_error___block_invoke;
  v21[3] = &unk_264BBECA8;
  id v22 = v14;
  uint64_t v18 = __77__PODaemonProcess__removeUserConfigurationForIdentifier_syncToPreboot_error___block_invoke((uint64_t)v21);
  v19 = v18;
  if (a5) {
    *a5 = v18;
  }

  BOOL v17 = 0;
LABEL_10:

  return v17;
}

id __77__PODaemonProcess__removeUserConfigurationForIdentifier_syncToPreboot_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1007 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove user configuration"];
  uint64_t v2 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)removeUserConfigurationForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, BOOL, id))a4;
  char v8 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    char v13 = "-[PODaemonProcess removeUserConfigurationForIdentifier:completion:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2112;
    BOOL v17 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v11 = 0;
  BOOL v9 = [(PODaemonProcess *)self _removeUserConfigurationForIdentifier:v6 syncToPreboot:1 error:&v11];
  id v10 = v11;
  v7[2](v7, v9, v10);
}

- (BOOL)_saveDeviceConfiguration:(id)a3 identifer:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v30 = "-[PODaemonProcess _saveDeviceConfiguration:identifer:syncToPreboot:error:]";
    __int16 v31 = 2114;
    id v32 = v10;
    __int16 v33 = 2112;
    v34 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  if ([MEMORY[0x263F5E5F8] platformSSODevModeEnabled])
  {
    v12 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    char v13 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonProcess _saveDeviceConfiguration:identifer:syncToPreboot:error:]();
    }
  }
  __int16 v14 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v15 = v14;
  if (v10)
  {
    __int16 v16 = objc_msgSend(NSString, "stringWithFormat:", *MEMORY[0x263F5E6C0], v10);
    BOOL v17 = [v15 URLByAppendingPathComponent:v16];
  }
  else
  {
    BOOL v17 = [v14 URLByAppendingPathComponent:*MEMORY[0x263F5E6C8]];
  }

  id v28 = 0;
  BOOL v18 = [(PODaemonCoreProcess *)self writeData:v9 toPath:v17 saveError:&v28];
  id v19 = v28;
  __int16 v20 = v19;
  if (v18)
  {
    [MEMORY[0x263F5E5F8] updateTriggerFile];
    v21 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v17 path];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v22;
      _os_log_impl(&dword_230E51000, v21, OS_LOG_TYPE_INFO, "device config written to file: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __74__PODaemonProcess__saveDeviceConfiguration_identifer_syncToPreboot_error___block_invoke;
    v26[3] = &unk_264BBECA8;
    id v27 = v19;
    id v23 = __74__PODaemonProcess__saveDeviceConfiguration_identifer_syncToPreboot_error___block_invoke((uint64_t)v26);
    id v24 = v23;
    if (a6) {
      *a6 = v23;
    }

    v21 = v27;
  }

  return v18;
}

id __74__PODaemonProcess__saveDeviceConfiguration_identifer_syncToPreboot_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to write device config to disk"];
  uint64_t v2 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)saveDeviceConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, BOOL, id))a5;
  id v10 = a3;
  id v11 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[PODaemonProcess saveDeviceConfiguration:identifer:completion:]";
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  id v14 = 0;
  BOOL v12 = [(PODaemonProcess *)self _saveDeviceConfiguration:v10 identifer:v8 syncToPreboot:1 error:&v14];

  id v13 = v14;
  v9[2](v9, v12, v13);
}

- (void)saveDeviceConfigurationSyncAllConfigToPreboot:(id)a3 identifer:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, BOOL, id))a5;
  id v10 = a3;
  id v11 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[PODaemonProcess saveDeviceConfigurationSyncAllConfigToPreboot:identifer:completion:]";
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  id v14 = 0;
  BOOL v12 = [(PODaemonProcess *)self _saveDeviceConfiguration:v10 identifer:v8 syncToPreboot:0 error:&v14];

  id v13 = v14;
  v9[2](v9, v12, v13);
}

- (BOOL)_saveLoginConfiguration:(id)a3 identifer:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v30 = "-[PODaemonProcess _saveLoginConfiguration:identifer:syncToPreboot:error:]";
    __int16 v31 = 2114;
    id v32 = v10;
    __int16 v33 = 2112;
    v34 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  if ([MEMORY[0x263F5E5F8] platformSSODevModeEnabled])
  {
    BOOL v12 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    id v13 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonProcess _saveLoginConfiguration:identifer:syncToPreboot:error:]();
    }
  }
  id v14 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v15 = v14;
  if (v10)
  {
    __int16 v16 = objc_msgSend(NSString, "stringWithFormat:", *MEMORY[0x263F5E6D0], v10);
    __int16 v17 = [v15 URLByAppendingPathComponent:v16];
  }
  else
  {
    __int16 v17 = [v14 URLByAppendingPathComponent:*MEMORY[0x263F5E6D8]];
  }

  id v28 = 0;
  BOOL v18 = [(PODaemonCoreProcess *)self writeData:v9 toPath:v17 saveError:&v28];
  id v19 = v28;
  __int16 v20 = v19;
  if (v18)
  {
    [MEMORY[0x263F5E5F8] updateTriggerFile];
    uint64_t v21 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v17 path];
      *(_DWORD *)buf = 138543362;
      uint64_t v30 = v22;
      _os_log_impl(&dword_230E51000, v21, OS_LOG_TYPE_INFO, "login config written to file: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __73__PODaemonProcess__saveLoginConfiguration_identifer_syncToPreboot_error___block_invoke;
    v26[3] = &unk_264BBECA8;
    id v27 = v19;
    id v23 = __73__PODaemonProcess__saveLoginConfiguration_identifer_syncToPreboot_error___block_invoke((uint64_t)v26);
    id v24 = v23;
    if (a6) {
      *a6 = v23;
    }

    uint64_t v21 = v27;
  }

  return v18;
}

id __73__PODaemonProcess__saveLoginConfiguration_identifer_syncToPreboot_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to write login config to disk"];
  uint64_t v2 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)saveLoginConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, BOOL, id))a5;
  id v10 = a3;
  id v11 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[PODaemonProcess saveLoginConfiguration:identifer:completion:]";
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  id v14 = 0;
  BOOL v12 = [(PODaemonProcess *)self _saveLoginConfiguration:v10 identifer:v8 syncToPreboot:1 error:&v14];

  id v13 = v14;
  v9[2](v9, v12, v13);
}

- (void)saveUserConfiguration:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v19 = "-[PODaemonProcess saveUserConfiguration:forIdentifier:syncToPreboot:completion:]";
    __int16 v20 = 2114;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = self;
    _os_log_impl(&dword_230E51000, v13, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v14 = [v12 dataRepresentation];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __80__PODaemonProcess_saveUserConfiguration_forIdentifier_syncToPreboot_completion___block_invoke;
  v16[3] = &unk_264BBEFB8;
  id v17 = v11;
  id v15 = v11;
  [(PODaemonProcess *)self saveUserConfigurationData:v14 forIdentifier:v10 syncToPreboot:v7 completion:v16];
}

uint64_t __80__PODaemonProcess_saveUserConfiguration_forIdentifier_syncToPreboot_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v29 = "-[PODaemonProcess _saveUserConfigurationData:forIdentifier:syncToPreboot:error:]";
    __int16 v30 = 2114;
    id v31 = v10;
    __int16 v32 = 2112;
    __int16 v33 = self;
    _os_log_impl(&dword_230E51000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  if ([MEMORY[0x263F5E5F8] platformSSODevModeEnabled])
  {
    id v12 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
    id v13 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonProcess _saveUserConfigurationData:forIdentifier:syncToPreboot:error:]();
    }
  }
  id v14 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v15 = objc_msgSend(NSString, "stringWithFormat:", *MEMORY[0x263F5E6F8], v10);
  __int16 v16 = [v14 URLByAppendingPathComponent:v15];

  id v27 = 0;
  BOOL v17 = [(PODaemonCoreProcess *)self writeData:v9 toPath:v16 saveError:&v27];
  id v18 = v27;
  __int16 v19 = v18;
  if (v17)
  {
    [MEMORY[0x263F5E5F8] updateTriggerFile];
    __int16 v20 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v16 path];
      *(_DWORD *)buf = 138543362;
      __int16 v29 = v21;
      _os_log_impl(&dword_230E51000, v20, OS_LOG_TYPE_INFO, "user config written to file: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __80__PODaemonProcess__saveUserConfigurationData_forIdentifier_syncToPreboot_error___block_invoke;
    v25[3] = &unk_264BBECA8;
    __int16 v26 = v18;
    __int16 v22 = __80__PODaemonProcess__saveUserConfigurationData_forIdentifier_syncToPreboot_error___block_invoke((uint64_t)v25);
    id v23 = v22;
    if (a6) {
      *a6 = v22;
    }

    __int16 v20 = v26;
  }

  return v17;
}

id __80__PODaemonProcess__saveUserConfigurationData_forIdentifier_syncToPreboot_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F5E610] errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to write user config to disk"];
  uint64_t v2 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v1;
}

- (void)saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = (void (**)(id, BOOL, id))a6;
  id v12 = a3;
  id v13 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[PODaemonProcess saveUserConfigurationData:forIdentifier:syncToPreboot:completion:]";
    __int16 v19 = 2114;
    id v20 = v10;
    __int16 v21 = 2112;
    __int16 v22 = self;
    _os_log_impl(&dword_230E51000, v13, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v16 = 0;
  BOOL v14 = [(PODaemonProcess *)self _saveUserConfigurationData:v12 forIdentifier:v10 syncToPreboot:v7 error:&v16];

  id v15 = v16;
  v11[2](v11, v14, v15);
}

- (BOOL)_saveUserLoginStateList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess _saveUserLoginStateList:error:]();
  }

  v10.receiver = self;
  v10.super_class = (Class)PODaemonProcess;
  BOOL v8 = [(PODaemonCoreProcess *)&v10 _saveUserLoginStateList:v6 error:a4];

  return v8;
}

- (void)enablePlatformSSORules:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess enablePlatformSSORules:]();
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__PODaemonProcess_enablePlatformSSORules___block_invoke;
  v7[3] = &unk_264BBF610;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PODaemonProcess *)self _enablePlatformSSORuleForLogin:v7];
}

uint64_t __42__PODaemonProcess_enablePlatformSSORules___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _enablePlatformSSORuleForScreensaver:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_enablePlatformSSORuleForScreensaver:(id)a3
{
  id v3 = a3;
  id v4 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess enablePlatformSSORules:]();
  }

  (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
}

- (void)disablePlatformSSORules:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess disablePlatformSSORules:]();
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__PODaemonProcess_disablePlatformSSORules___block_invoke;
  v7[3] = &unk_264BBF610;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PODaemonProcess *)self _disablePlatformSSORuleForLogin:v7];
}

uint64_t __43__PODaemonProcess_disablePlatformSSORules___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _disablePlatformSSORuleForScreensaver:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_disablePlatformSSORuleForScreensaver:(id)a3
{
  id v3 = a3;
  id v4 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess disablePlatformSSORules:]();
  }

  (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
}

- (void)_enablePlatformSSORuleForLogin:(id)a3
{
  id v3 = a3;
  id v4 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess _enablePlatformSSORuleForLogin:]();
  }

  (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
}

- (void)_disablePlatformSSORuleForLogin:(id)a3
{
  id v3 = a3;
  id v4 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess _enablePlatformSSORuleForLogin:]();
  }

  (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
}

- (BOOL)_updateGroupForRight:(id)a3 newGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonProcess _updateGroupForRight:newGroup:]();
  }

  return 1;
}

- (void)saveAppSSOConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[PODaemonProcess saveAppSSOConfiguration:completion:]";
    __int16 v16 = 2114;
    id v17 = v6;
    __int16 v18 = 2112;
    __int16 v19 = self;
    _os_log_impl(&dword_230E51000, v8, OS_LOG_TYPE_DEFAULT, "%s configuration = %{public}@ on %@", buf, 0x20u);
  }

  id v9 = [getSOConfigurationManagerClass() defaultManager];
  if (v9)
  {
    objc_super v10 = [getSOConfigurationManagerClass() defaultManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke_69;
    v12[3] = &unk_264BBEFB8;
    id v13 = v7;
    [v10 saveConfigurationData:v6 completion:v12];

    id v11 = v13;
  }
  else
  {
    id v11 = __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

id __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke()
{
  os_log_t v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"missing configuration manager"];
  uint64_t v1 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

void __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke_69(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke_2();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230E51000, v4, OS_LOG_TYPE_INFO, "configuration saved", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke_2()
{
  os_log_t v0 = [MEMORY[0x263F5E610] errorWithCode:-1001 description:@"Failed to save configuration"];
  uint64_t v1 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();
  }

  return v0;
}

- (void)createAppSSOCachePathWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v14 = "-[PODaemonProcess createAppSSOCachePathWithCompletion:]";
    __int16 v15 = 2112;
    __int16 v16 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = objc_alloc_init((Class)getSOConfigurationHostClass());
  id v7 = [v6 _defaultCacheFile];
  id v8 = [v7 stringByDeletingLastPathComponent];

  id v12 = 0;
  char v9 = [v6 _initCachePath:v8 ifNeededWithError:&v12];
  id v10 = v12;
  if (v9)
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    id v11 = PO_LOG_PODaemonProcess();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PODaemonProcess createAppSSOCachePathWithCompletion:]();
    }

    ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v10);
  }
}

- (BOOL)_initDataVaultIfNeededWithError:(id *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = PO_LOG_PODaemonProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[PODaemonProcess _initDataVaultIfNeededWithError:]";
    __int16 v51 = 2112;
    v52 = self;
    _os_log_impl(&dword_230E51000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v7 = self;
  objc_sync_enter(v7);
  if (![(PODaemonProcess *)v7 dataVaultInitialized])
  {
    uint64_t v9 = *MEMORY[0x263F08028];
    v47[0] = *MEMORY[0x263F08060];
    v47[1] = v9;
    v48[0] = @"mobile";
    v48[1] = @"mobile";
    v47[2] = *MEMORY[0x263F08078];
    v48[2] = &unk_26E5D33E8;
    id v10 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
    id v11 = [MEMORY[0x263F08850] defaultManager];
    id v12 = [v6 path];
    char v13 = [v11 fileExistsAtPath:v12 isDirectory:0];

    if ((v13 & 1) == 0)
    {
      BOOL v14 = [MEMORY[0x263F08850] defaultManager];
      id v46 = 0;
      char v15 = [v14 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:v10 error:&v46];
      id v16 = v46;

      if (v16) {
        char v15 = 0;
      }
      uint64_t v17 = PO_LOG_PODaemonProcess();
      __int16 v18 = v17;
      if ((v15 & 1) == 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[PODaemonProcess _initDataVaultIfNeededWithError:]();
        }

        if (!a3) {
          goto LABEL_35;
        }
        id v32 = v16;
        id v16 = v32;
        goto LABEL_25;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = [v6 path];
        *(_DWORD *)buf = 138543362;
        v50 = v19;
        _os_log_impl(&dword_230E51000, v18, OS_LOG_TYPE_DEFAULT, "created configuration directory at %{public}@", buf, 0xCu);
      }
    }
    uint64_t v20 = [MEMORY[0x263F08850] defaultManager];
    __int16 v21 = [v6 path];
    id v45 = 0;
    char v22 = [v20 setAttributes:v10 ofItemAtPath:v21 error:&v45];
    id v16 = v45;

    if (v22)
    {
      id v23 = v6;
      [v23 fileSystemRepresentation];
      int v24 = rootless_check_datavault_flag();
      if (v24)
      {
        if (v24 == -1)
        {
          v25 = PO_LOG_PODaemonProcess();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            __int16 v26 = __error();
            id v27 = strerror(*v26);
            [(PODaemonProcess *)(uint64_t)v27 _initDataVaultIfNeededWithError:v25];
          }

          if (a3)
          {
            id v28 = (void *)MEMORY[0x263F5E610];
            __int16 v29 = NSString;
            __int16 v30 = __error();
            id v31 = objc_msgSend(v29, "stringWithFormat:", @"Failed to check the state of datavault: %s", strerror(*v30));
            *a3 = [v28 internalErrorWithMessage:v31];
          }
          goto LABEL_35;
        }
        id v33 = v23;
        [v33 fileSystemRepresentation];
        int v34 = rootless_convert_to_datavault();
        uint64_t v35 = PO_LOG_PODaemonProcess();
        v36 = v35;
        if (v34 == -1)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v38 = __error();
            v39 = strerror(*v38);
            [(PODaemonProcess *)(uint64_t)v39 _initDataVaultIfNeededWithError:v36];
          }

          if (a3)
          {
            v40 = (void *)MEMORY[0x263F5E610];
            v41 = NSString;
            v42 = __error();
            v43 = objc_msgSend(v41, "stringWithFormat:", @"Failed to convert to datavault: %s", strerror(*v42));
            *a3 = [v40 internalErrorWithMessage:v43];
          }
          goto LABEL_35;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v37 = [v33 path];
          *(_DWORD *)buf = 138543362;
          v50 = v37;
          _os_log_impl(&dword_230E51000, v36, OS_LOG_TYPE_DEFAULT, "successfully created datavault at %{public}@", buf, 0xCu);
        }
      }
      BOOL v8 = 1;
      [(PODaemonProcess *)v7 setDataVaultInitialized:1];
LABEL_36:

      goto LABEL_37;
    }
    if (!a3)
    {
LABEL_35:
      BOOL v8 = 0;
      goto LABEL_36;
    }
    id v32 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to set data vault attributes"];
LABEL_25:
    BOOL v8 = 0;
    *a3 = v32;
    goto LABEL_36;
  }
  BOOL v8 = 1;
LABEL_37:
  objc_sync_exit(v7);

  return v8;
}

- (void)setConfigurationManager:(id)a3
{
}

- (void)setConfigurationHost:(id)a3
{
}

- (BOOL)dataVaultInitialized
{
  return self->_dataVaultInitialized;
}

- (void)setDataVaultInitialized:(BOOL)a3
{
  self->_dataVaultInitialized = a3;
}

- (PODirectoryServices)directoryServices
{
  return (PODirectoryServices *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDirectoryServices:(id)a3
{
}

- (POUserGroupManager)userGroupManager
{
  return (POUserGroupManager *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUserGroupManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userGroupManager, 0);
  objc_storeStrong((id *)&self->_directoryServices, 0);
  objc_storeStrong((id *)&self->_configurationHost, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (void)migrateConfiguration:completion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "migrating data", v2, v3, v4, v5, v6);
}

void __35__PODaemonProcess_handleAuthRights__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "Rule successfully checked", v2, v3, v4, v5, v6);
}

- (void)_saveDeviceConfiguration:identifer:syncToPreboot:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_230E51000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_saveLoginConfiguration:identifer:syncToPreboot:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_230E51000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_saveUserConfigurationData:forIdentifier:syncToPreboot:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_230E51000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_saveUserLoginStateList:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "saving user state", v2, v3, v4, v5, v6);
}

- (void)enablePlatformSSORules:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "updating rules database", v2, v3, v4, v5, v6);
}

- (void)disablePlatformSSORules:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "restoring rules database if needed", v2, v3, v4, v5, v6);
}

- (void)_enablePlatformSSORuleForLogin:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_230E51000, v0, v1, "updating rules database for login", v2, v3, v4, v5, v6);
}

- (void)_updateGroupForRight:newGroup:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "updating group for right: %{public}@, %{public}@", v1, 0x16u);
}

- (void)createAppSSOCachePathWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_230E51000, v0, v1, "failed to create cache directory at %{public}@: %{public}@");
}

- (void)_initDataVaultIfNeededWithError:(os_log_t)log .cold.1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_230E51000, log, OS_LOG_TYPE_ERROR, "Failed to convert to datavault: %{public}s", buf, 0xCu);
}

- (void)_initDataVaultIfNeededWithError:(os_log_t)log .cold.2(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_230E51000, log, OS_LOG_TYPE_ERROR, "Failed to check the state of datavault: %{public}s", buf, 0xCu);
}

- (void)_initDataVaultIfNeededWithError:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1(&dword_230E51000, v0, v1, "Failed to create configuration directory at %{public}@: %{public}@");
}

@end