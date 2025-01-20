@interface PKService
+ (id)defaultService;
+ (int)_defaultRun:(int)a3 arguments:(const char *)a4;
+ (void)main;
- (BOOL)_processDefaultSubsystemName:(id)a3;
- (BOOL)isSystemService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shared;
- (BOOL)unregisterPersonality:(id)a3;
- (NSArray)subsystems;
- (NSMutableDictionary)personalities;
- (NSXPCListener)serviceListener;
- (NSXPCListenerEndpoint)endpoint;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_source)firstHostRequestTimer;
- (OS_dispatch_source)terminationTimer;
- (PKExternalProviders)external;
- (PKService)init;
- (PKService)initWithExternalProviders:(id)a3;
- (PKServiceDelegate)delegate;
- (PKServicePersonality)solePersonality;
- (id)configuredSubsystemList;
- (id)connectionForPlugInNamed:(id)a3;
- (id)defaultsForPlugInNamed:(id)a3;
- (id)discoverSubsystemNamed:(id)a3 options:(id)a4 required:(BOOL)a5;
- (id)embeddedPrincipalForPlugInNamed:(id)a3;
- (id)hostPrincipalForPlugInNamed:(id)a3;
- (id)personalityNamed:(id)a3;
- (id)personalityNamed:(id)a3 forHostPid:(int)a4;
- (id)plugInPrincipalForPlugInNamed:(id)a3;
- (os_unfair_lock_s)personalityLock;
- (unsigned)extensionPointPlatform;
- (void)_prepareToRunUsingServiceListener:(BOOL)a3;
- (void)beganUsingServicePersonality:(id)a3;
- (void)cancelTermination;
- (void)checkEnvironment:(id)a3;
- (void)checkIn;
- (void)discoverSubsystems;
- (void)launchContainingApplicationForPlugInNamed:(id)a3;
- (void)mergeSubsystemList:(id)a3 from:(id)a4;
- (void)mergeSubsystems:(id)a3 from:(id)a4;
- (void)registerPersonality:(id)a3;
- (void)run;
- (void)runUsingServiceListener:(BOOL)a3;
- (void)scheduleTermination:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionPointPlatform:(unsigned int)a3;
- (void)setFirstHostRequestTimer:(id)a3;
- (void)setIsSystemService:(BOOL)a3;
- (void)setPersonalities:(id)a3;
- (void)setServiceListener:(id)a3;
- (void)setShared:(BOOL)a3;
- (void)setSolePersonality:(id)a3;
- (void)setSubsystems:(id)a3;
- (void)setTerminationTimer:(id)a3;
@end

@implementation PKService

- (void)checkIn
{
  if (objc_opt_class())
  {
    id v2 = (id)[MEMORY[0x1E4F963F0] currentProcess];
    v3 = pklog_handle_for_category(7);
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "KernelMemoryStatus", "", buf, 2u);
    }

    getpid();
    memorystatus_control();
    v4 = pklog_handle_for_category(7);
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "KernelMemoryStatus", "", v5, 2u);
    }
  }
}

- (void)beganUsingServicePersonality:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1B38C8B08;
  v7[3] = &unk_1E6058CC8;
  id v8 = v4;
  v9 = self;
  uint64_t v5 = qword_1EB2BE128;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&qword_1EB2BE128, v7);
  }
}

+ (void)main
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = pklog_handle_for_category(7);
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartup", "", buf, 2u);
  }

  v3 = pklog_handle_for_category(7);
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartupXPCReady", "", buf, 2u);
  }

  long long v41 = 0u;
  memset(v42, 0, sizeof(v42));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  *(_OWORD *)buf = 0u;
  v10 = 0;
  v11 = 0;
  uint64_t current_persona = voucher_get_current_persona();
  int v5 = current_persona;
  *(_OWORD *)buf = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  memset(v42, 0, sizeof(v42));
  *(_DWORD *)buf = 1;
  pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v11, &v10);
  id v6 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uid_t v7 = geteuid();
    uid_t v8 = getuid();
    *(_DWORD *)v12 = 67110146;
    uid_t v13 = v7;
    __int16 v14 = 1024;
    uid_t v15 = v8;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 2080;
    v19 = v11;
    __int16 v20 = 2080;
    v21 = v10;
    _os_log_impl(&dword_1B38B0000, v6, OS_LOG_TYPE_DEFAULT, "Hello, I'm launching as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v12, 0x28u);
  }

  v9 = +[PKService defaultService];
  [v9 run];
}

- (NSXPCListenerEndpoint)endpoint
{
  id v2 = [(PKService *)self serviceListener];
  v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (PKService)init
{
  v3 = objc_opt_new();
  id v4 = [(PKService *)self initWithExternalProviders:v3];

  return v4;
}

- (PKService)initWithExternalProviders:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKService;
  id v6 = [(PKService *)&v14 init];
  uid_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_external, a3);
    uid_t v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    [(PKService *)v7 setPersonalities:v8];

    dispatch_queue_t v9 = dispatch_queue_create("timer queue", 0);
    timerQueue = v7->_timerQueue;
    v7->_timerQueue = (OS_dispatch_queue *)v9;

    v7->_personalityLock._os_unfair_lock_opaque = 0;
    uint64_t active_platform = dyld_get_active_platform();
    v12 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = active_platform;
      _os_log_impl(&dword_1B38B0000, v12, OS_LOG_TYPE_INFO, "setting extensionPointPlatform: %u", buf, 8u);
    }

    [(PKService *)v7 setExtensionPointPlatform:active_platform];
  }

  return v7;
}

+ (id)defaultService
{
  if (qword_1EB2BE120 != -1) {
    dispatch_once(&qword_1EB2BE120, &unk_1F0C15490);
  }
  id v2 = (void *)qword_1EB2BE118;
  return v2;
}

- (void)run
{
}

- (void)runUsingServiceListener:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[PKCapabilities supportsAutoreleasePoolDuringPlugInLaunch])
  {
    id v5 = (void *)MEMORY[0x1B3EBB4E0]();
    [(PKService *)self _prepareToRunUsingServiceListener:v3];
  }
  else
  {
    [(PKService *)self _prepareToRunUsingServiceListener:v3];
  }
  id v6 = [(PKService *)self timerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38C9464;
  block[3] = &unk_1E6058CF0;
  block[4] = self;
  dispatch_sync(v6, block);

  uid_t v7 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B38B0000, v7, OS_LOG_TYPE_DEFAULT, "Bootstrapping; Bootstrap complete. Ready for handshake from host.",
      v10,
      2u);
  }

  uid_t v8 = pklog_handle_for_category(7);
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B38B0000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartupXPCReady", "", v10, 2u);
  }

  dispatch_queue_t v9 = [(PKService *)self serviceListener];
  __PLUGINKIT_HANDING_CONTROL_TO_MAIN_SERVICE_LISTENER__();
}

- (void)_prepareToRunUsingServiceListener:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKService *)self checkEnvironment:0];
  if (v3) {
    [MEMORY[0x1E4F29290] serviceListener];
  }
  else {
  id v5 = [MEMORY[0x1E4F29290] anonymousListener];
  }
  [(PKService *)self setServiceListener:v5];

  id v6 = [(PKService *)self serviceListener];
  [v6 setDelegate:self];

  [(PKService *)self discoverSubsystems];
  uid_t v7 = [(PKService *)self external];
  uid_t v8 = [v7 filesystem];
  dispatch_queue_t v9 = [v8 mainBundle];
  v10 = [v9 infoDictionary];

  v11 = [v10 objectForKeyedSubscript:@"NSExtension"];
  if (!v11)
  {
    v11 = [v10 objectForKeyedSubscript:@"PlugInKit"];
  }
  v12 = [v11 objectForKeyedSubscript:@"Delegate"];
  uid_t v13 = v12;
  if (v12)
  {
    Class v14 = objc_lookUpClass((const char *)[v12 UTF8String]);
    uid_t v15 = v14;
    if (v14)
    {
      if (![(objc_class *)v14 conformsToProtocol:&unk_1F0C29668])
      {
        int v16 = pklog_handle_for_category(7);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1B38D4B30();
        }

        uid_t v15 = 0;
        goto LABEL_15;
      }
      uid_t v15 = (objc_class *)objc_alloc_init(v15);
    }
    if (v15)
    {
      [(PKService *)self setDelegate:v15];
LABEL_18:

      goto LABEL_19;
    }
LABEL_15:
    uint64_t v17 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4AD4();
    }

    goto LABEL_18;
  }
LABEL_19:
}

+ (int)_defaultRun:(int)a3 arguments:(const char *)a4
{
  return 1;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKService *)self serviceListener];

  if (v8 == v6)
  {
    dispatch_queue_t v9 = [[PKServicePersonality alloc] initWithConnection:v7 service:self];
  }
  else
  {
    pklog_handle_for_category(7);
    dispatch_queue_t v9 = (PKServicePersonality *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4B8C();
    }
  }

  return v8 == v6;
}

- (BOOL)_processDefaultSubsystemName:(id)a3
{
  return 1;
}

- (void)discoverSubsystems
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKService *)self configuredSubsystemList];
  if ([(PKService *)self isSystemService])
  {
    id v4 = 0;
    goto LABEL_15;
  }
  id v5 = (void *)xpc_copy_bootstrap();
  id v6 = v5;
  if (!v5)
  {
    id v4 = 0;
    goto LABEL_12;
  }
  id v7 = xpc_dictionary_get_value(v5, "SubsystemOptions");
  if (!v7) {
    goto LABEL_9;
  }
  id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = pklog_handle_for_category(8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1B38D4BE8(v8);
    }

LABEL_9:
    id v4 = 0;
  }

LABEL_12:
  dispatch_queue_t v9 = pklog_handle_for_category(8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [MEMORY[0x1E4F28B50] mainBundle];
    v11 = [v10 preferredLocalizations];
    *(_DWORD *)buf = 138412290;
    long long v30 = v11;
    _os_log_impl(&dword_1B38B0000, v9, OS_LOG_TYPE_INFO, "Bootstrapping; Preferred localizations: %@", buf, 0xCu);
  }
LABEL_15:
  v12 = [MEMORY[0x1E4F1CA48] array];
  [(PKService *)self checkIn];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v3;
  unint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v25;
    do
    {
      uint64_t v16 = 0;
      if (v14 <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v14;
      }
      do
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = -[PKService discoverSubsystemNamed:options:required:](self, "discoverSubsystemNamed:options:required:", *(void *)(*((void *)&v24 + 1) + 8 * v16), v4, 1, (void)v24);
        if (v18) {
          [v12 addObject:v18];
        }

        ++v16;
      }
      while (v17 != v16);
      unint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  v19 = "NSViewService_PKSubsystem";
  __int16 v20 = &off_1E60594D8;
  do
  {
    v22 = objc_msgSend(NSString, "stringWithUTF8String:", v19, (void)v24);
    if ((!v13 || ([v13 containsObject:v22] & 1) == 0)
      && [(PKService *)self _processDefaultSubsystemName:v22])
    {
      long long v23 = [(PKService *)self discoverSubsystemNamed:v22 options:v4 required:0];
      if (v23) {
        [v12 addObject:v23];
      }
    }
    v21 = *v20++;
    v19 = v21;
  }
  while (v21);
  [(PKService *)self setSubsystems:v12];
}

- (id)configuredSubsystemList
{
  BOOL v3 = [(PKService *)self external];
  id v4 = [v3 filesystem];
  id v5 = [v4 mainBundle];
  id v6 = [v5 infoDictionary];

  id v7 = [v6 objectForKeyedSubscript:@"NSExtension"];
  if (!v7)
  {
    id v7 = [v6 objectForKeyedSubscript:@"PlugInKit"];
  }
  id v8 = [MEMORY[0x1E4F1CA48] array];
  [(PKService *)self mergeSubsystems:v8 from:v7];

  return v8;
}

- (void)mergeSubsystems:(id)a3 from:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:@"Subsystems"];
  [(PKService *)self mergeSubsystemList:v16 from:v7];

  id v8 = [v6 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];
  if (!v8)
  {
    id v8 = [v6 objectForKeyedSubscript:@"SDK"];
  }
  if (v8)
  {
    uint64_t v9 = [(PKService *)self extensionPointPlatform];
    v10 = [(PKService *)self external];
    v11 = +[PKPlugInCore readSDKDictionary:v8 forPlatform:v9 externalProviders:v10];

    v12 = [v11 objectForKeyedSubscript:@"NSExtension"];
    id v13 = [v12 objectForKeyedSubscript:@"Subsystems"];
    [(PKService *)self mergeSubsystemList:v16 from:v13];

    unint64_t v14 = [v11 objectForKeyedSubscript:@"XPCService"];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"ServiceType"];

    if ([v15 isEqualToString:@"System"]) {
      [(PKService *)self setIsSystemService:1];
    }
  }
}

- (void)mergeSubsystemList:(id)a3 from:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        if (v8 <= 1) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = v8;
        }
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          if (([v5 containsObject:v12] & 1) == 0) {
            [v5 addObject:v12];
          }
          ++v10;
        }
        while (v11 != v10);
        unint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (id)discoverSubsystemNamed:(id)a3 options:(id)a4 required:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  Class v10 = objc_lookUpClass((const char *)[v9 UTF8String]);
  uint64_t v11 = pklog_handle_for_category(8);
  uint64_t v12 = v11;
  if (v10)
  {
    if (os_signpost_enabled(v11))
    {
      int v17 = 138543362;
      id v18 = v9;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExtensionSubsystemInit", " name=%{public, signpost.description:attribute}@ ", (uint8_t *)&v17, 0xCu);
    }

    long long v13 = pklog_handle_for_category(8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138543362;
      id v18 = v9;
      _os_log_impl(&dword_1B38B0000, v13, OS_LOG_TYPE_INFO, "Bootstrapping; external subsystem [%{public}@] initializing",
        (uint8_t *)&v17,
        0xCu);
    }

    long long v14 = __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_INIT__(v10, v8);
    long long v15 = pklog_handle_for_category(8);
    if (os_signpost_enabled(v15))
    {
      int v17 = 138543618;
      id v18 = v9;
      __int16 v19 = 1026;
      BOOL v20 = v14 != 0;
      _os_signpost_emit_with_name_impl(&dword_1B38B0000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionSubsystemInit", " name=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d ", (uint8_t *)&v17, 0x12u);
    }

    if (v14)
    {
      if ([v14 conformsToProtocol:&unk_1F0C297A8]) {
        goto LABEL_20;
      }

      uint64_t v12 = pklog_handle_for_category(8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1B38D4CF0();
      }
    }
    else
    {
      uint64_t v12 = pklog_handle_for_category(8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1B38D4C94();
      }
    }
  }
  else if (v5)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_1B38D4C2C();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v17 = 138543362;
    id v18 = v9;
    _os_log_impl(&dword_1B38B0000, v12, OS_LOG_TYPE_INFO, "Bootstrapping; external subsystem [%{public}@] not present, skipping",
      (uint8_t *)&v17,
      0xCu);
  }

  long long v14 = 0;
LABEL_20:

  return v14;
}

- (void)launchContainingApplicationForPlugInNamed:(id)a3
{
  BOOL v3 = pklog_handle_for_category(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1B38D4D4C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (id)defaultsForPlugInNamed:(id)a3
{
  BOOL v3 = [(PKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 preferences];

  return v4;
}

- (id)plugInPrincipalForPlugInNamed:(id)a3
{
  BOOL v3 = [(PKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 plugInPrincipal];

  return v4;
}

- (id)hostPrincipalForPlugInNamed:(id)a3
{
  BOOL v3 = [(PKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 hostPrincipal];

  return v4;
}

- (id)embeddedPrincipalForPlugInNamed:(id)a3
{
  BOOL v3 = [(PKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 embeddedPrincipal];

  return v4;
}

- (id)connectionForPlugInNamed:(id)a3
{
  BOOL v3 = [(PKService *)self personalityNamed:a3];
  uint64_t v4 = [v3 connection];

  return v4;
}

- (void)setSolePersonality:(id)a3
{
  uint64_t v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  solePersonality = self->_solePersonality;
  self->_solePersonality = v4;

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (PKServicePersonality)solePersonality
{
  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  uint64_t v4 = self->_solePersonality;
  os_unfair_lock_unlock(p_personalityLock);
  if (!v4)
  {
    uint64_t v5 = pklog_handle_for_category(7);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4DC4(self, v5);
    }
  }
  return v4;
}

- (id)personalityNamed:(id)a3
{
  id v4 = a3;
  p_personalityLock = &self->_personalityLock;
  os_unfair_lock_lock(&self->_personalityLock);
  if (v4)
  {
    uint64_t v6 = [(PKService *)self personalities];
    uint64_t v7 = [v6 objectForKeyedSubscript:v4];

    if ([v7 count] == 1)
    {
      uint64_t v8 = [v7 allValues];
      uint64_t v9 = [v8 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = self->_solePersonality;
  }
  os_unfair_lock_unlock(p_personalityLock);

  return v9;
}

- (id)personalityNamed:(id)a3 forHostPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  p_personalityLock = &self->_personalityLock;
  id v7 = a3;
  os_unfair_lock_lock(p_personalityLock);
  uint64_t v8 = [(PKService *)self personalities];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:v4];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  os_unfair_lock_unlock(p_personalityLock);
  return v11;
}

- (void)registerPersonality:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_personalityLock);
  uint64_t v5 = [(PKService *)self personalities];
  uint64_t v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = [(PKService *)self personalities];
    uint64_t v9 = [v4 identifier];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v11 = [v4 connection];
  uint64_t v12 = objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "processIdentifier"));
  [v7 setObject:v4 forKeyedSubscript:v12];

  long long v13 = [(PKService *)self personalities];
  if ([v13 count] == 1)
  {
    uint64_t v14 = [v7 count];

    if (v14 == 1)
    {
      long long v15 = pklog_handle_for_category(7);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = [v4 uuid];
        int v17 = [v4 identifier];
        id v18 = [v4 version];
        int v22 = 138543874;
        long long v23 = v16;
        __int16 v24 = 2112;
        long long v25 = v17;
        __int16 v26 = 2112;
        long long v27 = v18;
        _os_log_impl(&dword_1B38B0000, v15, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Set sole personality.", (uint8_t *)&v22, 0x20u);
      }
      __int16 v19 = (PKServicePersonality *)v4;
      solePersonality = self->_solePersonality;
      self->_solePersonality = v19;
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v21 = pklog_handle_for_category(7);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_1B38D4E50(v4, self, v21);
  }

  solePersonality = self->_solePersonality;
  self->_solePersonality = 0;
LABEL_12:

  os_unfair_lock_unlock(&self->_personalityLock);
}

- (BOOL)unregisterPersonality:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (PKServicePersonality *)a3;
  os_unfair_lock_lock(&self->_personalityLock);
  uint64_t v5 = [(PKService *)self personalities];
  uint64_t v6 = (void *)[v5 count];

  if (v6)
  {
    id v7 = [(PKService *)self personalities];
    uint64_t v8 = [(PKPlugInCore *)v4 identifier];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v10 = [(PKServicePersonality *)v4 connection];
    uint64_t v11 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v10, "processIdentifier"));

    uint64_t v12 = [v9 objectForKeyedSubscript:v11];
    LOBYTE(v6) = v12 != 0;

    if (v12)
    {
      [v9 removeObjectForKey:v11];
      if (self->_solePersonality == v4)
      {
        long long v13 = pklog_handle_for_category(7);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [(PKPlugInCore *)v4 uuid];
          long long v15 = [(PKPlugInCore *)v4 identifier];
          long long v16 = [(PKPlugInCore *)v4 version];
          int v19 = 138543874;
          BOOL v20 = v14;
          __int16 v21 = 2112;
          int v22 = v15;
          __int16 v23 = 2112;
          __int16 v24 = v16;
          _os_log_impl(&dword_1B38B0000, v13, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] Removed sole personality.", (uint8_t *)&v19, 0x20u);
        }
        solePersonality = self->_solePersonality;
        self->_solePersonality = 0;
      }
    }
  }
  os_unfair_lock_unlock(&self->_personalityLock);

  return (char)v6;
}

- (void)checkEnvironment:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  bzero(__s, 0x400uLL);
  __s[0] = 63;
  id v4 = [(PKService *)self external];
  uint64_t v5 = [v4 sandbox];
  uint64_t v6 = [(PKService *)self external];
  id v7 = [v6 sys];
  int v8 = objc_msgSend(v5, "sandbox_container_path_for_pid:buffer:bufsize:", objc_msgSend(v7, "getpid"), __s, 1024);

  if (v8)
  {
    uint64_t v9 = pklog_handle_for_category(4);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1B38D4FB8(v9);
    }
  }
  else if (strlen(__s) > 1)
  {
    return;
  }
  uint64_t v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"plugin has invalid sandbox or container: error %d path %s", *__error(), __s);
  uint64_t v11 = pklog_handle_for_category(4);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_1B38D4F58();
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@", v10 format];
}

- (void)scheduleTermination:(double)a3
{
  uint64_t v5 = [(PKService *)self timerQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1B38CAD6C;
  v6[3] = &unk_1E6058CA0;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_sync(v5, v6);
}

- (void)cancelTermination
{
  BOOL v3 = [(PKService *)self timerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B38CB01C;
  block[3] = &unk_1E6058CF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (unsigned)extensionPointPlatform
{
  return self->_extensionPointPlatform;
}

- (void)setExtensionPointPlatform:(unsigned int)a3
{
  self->_extensionPointPlatform = a3;
}

- (os_unfair_lock_s)personalityLock
{
  return self->_personalityLock;
}

- (OS_dispatch_queue)timerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (PKServiceDelegate)delegate
{
  return (PKServiceDelegate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)serviceListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServiceListener:(id)a3
{
}

- (NSMutableDictionary)personalities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPersonalities:(id)a3
{
}

- (NSArray)subsystems
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSubsystems:(id)a3
{
}

- (BOOL)shared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (BOOL)isSystemService
{
  return self->_isSystemService;
}

- (void)setIsSystemService:(BOOL)a3
{
  self->_isSystemService = a3;
}

- (OS_dispatch_source)terminationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTerminationTimer:(id)a3
{
}

- (OS_dispatch_source)firstHostRequestTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirstHostRequestTimer:(id)a3
{
}

- (PKExternalProviders)external
{
  return self->_external;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_firstHostRequestTimer, 0);
  objc_storeStrong((id *)&self->_terminationTimer, 0);
  objc_storeStrong((id *)&self->_subsystems, 0);
  objc_storeStrong((id *)&self->_personalities, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_solePersonality, 0);
}

@end