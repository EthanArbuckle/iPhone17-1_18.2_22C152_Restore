@interface SYDRemotePreferencesSource
+ (id)SYDRemotePreferencesSourceConfigurationDidChangeNotification;
+ (id)SYDRemotePreferencesSourceDidChangeNotification;
+ (id)SYDUbiquitousKeyValueStoreDidChangeExternallyNotification;
- (BOOL)removeObjectForKey:(id)a3 error:(id *)a4;
- (BOOL)setObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 shared:(BOOL)a4;
- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5;
- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6;
- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6 containerPath:(__CFString *)a7;
- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6 containerPath:(__CFString *)a7 storeType:(int64_t)a8;
- (__CFDictionary)copyDictionary;
- (id)copyExternalChangesWithChangeCount:(int64_t *)a3;
- (id)dictionaryRepresentationWithError:(id *)a3;
- (id)objectForKey:(id)a3 error:(id *)a4;
- (int64_t)maximumDataLengthPerKey;
- (int64_t)maximumKeyCount;
- (int64_t)maximumKeyLength;
- (int64_t)maximumTotalDataLength;
- (unsigned)_synchronizeForced:(unsigned __int8)a3;
- (unsigned)hasExternalChanges;
- (unsigned)synchronize;
- (unsigned)synchronizeForced:(unsigned __int8)a3;
- (void)dealloc;
- (void)getValueForKey:(__CFString *)a3;
- (void)ping;
- (void)registerForSynchronizedDefaults;
- (void)scheduleRemoteSynchronization;
- (void)setDefaultsConfiguration:(id)a3;
- (void)setValue:(void *)a3 forKey:(__CFString *)a4;
- (void)synchronizationWithCompletionHandler:(id)a3;
- (void)unregisterForSynchronizedDefaults;
- (void)updateConfiguration;
@end

@implementation SYDRemotePreferencesSource

+ (id)SYDUbiquitousKeyValueStoreDidChangeExternallyNotification
{
  return @"SYDUbiquitousKeyValueStoreDidChangeExternallyNotification";
}

- (int64_t)maximumKeyCount
{
  return 1024;
}

- (int64_t)maximumKeyLength
{
  return 128;
}

- (int64_t)maximumDataLengthPerKey
{
  return 0x100000;
}

- (int64_t)maximumTotalDataLength
{
  return 0x100000;
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 shared:(BOOL)a4
{
  return [(SYDRemotePreferencesSource *)self initWithApplicationID:a3 storeID:0 shared:a4 additionalSource:0 containerPath:0];
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5
{
  return [(SYDRemotePreferencesSource *)self initWithApplicationID:a3 storeID:a4 shared:a5 additionalSource:0 containerPath:0];
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6
{
  return [(SYDRemotePreferencesSource *)self initWithApplicationID:a3 storeID:a4 shared:a5 additionalSource:a6 containerPath:0];
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6 containerPath:(__CFString *)a7
{
  return [(SYDRemotePreferencesSource *)self initWithApplicationID:a3 storeID:a4 shared:a5 additionalSource:a6 containerPath:a7 storeType:0];
}

- (SYDRemotePreferencesSource)initWithApplicationID:(__CFString *)a3 storeID:(__CFString *)a4 shared:(BOOL)a5 additionalSource:(BOOL)a6 containerPath:(__CFString *)a7 storeType:(int64_t)a8
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v12 = SYDGetConnectionLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    int v18 = 138412802;
    v19 = v17;
    __int16 v20 = 2112;
    v21 = a3;
    __int16 v22 = 2112;
    v23 = a4;
    _os_log_debug_impl(&dword_218588000, v12, OS_LOG_TYPE_DEBUG, "Initializing %@ with applicationID=%@ storeID=%@", (uint8_t *)&v18, 0x20u);
  }
  v13 = a4;
  if (v13
    || (+[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:a3], (v13 = (__CFString *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v14 = [[SYDClientToDaemonConnection alloc] initWithStoreIdentifier:v13 type:a8];
  }
  else
  {
    if (initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType__onceToken != -1) {
      dispatch_once(&initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType__onceToken, &__block_literal_global_0);
    }
    v14 = 0;
  }

  return &v14->super;
}

void __108__SYDRemotePreferencesSource_initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType___block_invoke()
{
  v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __108__SYDRemotePreferencesSource_initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType___block_invoke_cold_1(v0);
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)SYDRemotePreferencesSource;
  [(SYDRemotePreferencesSource *)&v4 dealloc];
}

- (id)objectForKey:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 87, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource objectForKey:error:]", v8 object file lineNumber description];

  return 0;
}

- (void)getValueForKey:(__CFString *)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 92, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource getValueForKey:]", v7 object file lineNumber description];

  return 0;
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4, a5);
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 97, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource setObject:forKey:error:]", v9 object file lineNumber description];

  return 0;
}

- (BOOL)removeObjectForKey:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 102, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource removeObjectForKey:error:]", v8 object file lineNumber description];

  return 0;
}

- (void)setValue:(void *)a3 forKey:(__CFString *)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v8 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 107, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource setValue:forKey:]", v7 object file lineNumber description];
}

- (void)setDefaultsConfiguration:(id)a3
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v7 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 111, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource setDefaultsConfiguration:]", v6 object file lineNumber description];
}

- (void)scheduleRemoteSynchronization
{
  id v6 = [MEMORY[0x263F08690] currentHandler];
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v6 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 115, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource scheduleRemoteSynchronization]", v5 object file lineNumber description];
}

- (void)synchronizationWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F08690] currentHandler];
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 119, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource synchronizationWithCompletionHandler:]", v8 object file lineNumber description];

  v9 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SYDRemotePreferencesSource_synchronizationWithCompletionHandler___block_invoke;
  block[3] = &unk_2643292C0;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(v9, block);
}

void __67__SYDRemotePreferencesSource_synchronizationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = *MEMORY[0x263F08320];
  v6[0] = @"Trying to call a method on an invalid object.";
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
  objc_super v4 = [v2 errorWithDomain:@"SyncedDefaults" code:1040 userInfo:v3];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

- (unsigned)synchronize
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 126, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource synchronize]", v6 object file lineNumber description];

  return 0;
}

- (unsigned)synchronizeForced:(unsigned __int8)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 131, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource synchronizeForced:]", v7 object file lineNumber description];

  return 0;
}

- (unsigned)_synchronizeForced:(unsigned __int8)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 136, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource _synchronizeForced:]", v7 object file lineNumber description];

  return 0;
}

- (unsigned)hasExternalChanges
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 141, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource hasExternalChanges]", v6 object file lineNumber description];

  return 0;
}

- (id)copyExternalChangesWithChangeCount:(int64_t *)a3
{
  return 0;
}

- (id)dictionaryRepresentationWithError:(id *)a3
{
  v3 = [(SYDRemotePreferencesSource *)self copyDictionary];
  return v3;
}

- (__CFDictionary)copyDictionary
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 156, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource copyDictionary]", v6 object file lineNumber description];

  return 0;
}

- (void)registerForSynchronizedDefaults
{
  id v6 = [MEMORY[0x263F08690] currentHandler];
  objc_super v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v6 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 161, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource registerForSynchronizedDefaults]", v5 object file lineNumber description];
}

- (void)unregisterForSynchronizedDefaults
{
  id v6 = [MEMORY[0x263F08690] currentHandler];
  objc_super v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v6 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 165, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource unregisterForSynchronizedDefaults]", v5 object file lineNumber description];
}

- (void)updateConfiguration
{
  id v6 = [MEMORY[0x263F08690] currentHandler];
  objc_super v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v6 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 169, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource updateConfiguration]", v5 object file lineNumber description];
}

- (void)ping
{
  id v6 = [MEMORY[0x263F08690] currentHandler];
  objc_super v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  [v6 handleFailureInMethod:a2, self, @"SYDRemotePreferencesSource.m", 173, @"Trying to call %s on invalid class %@", "-[SYDRemotePreferencesSource ping]", v5 object file lineNumber description];
}

+ (id)SYDRemotePreferencesSourceDidChangeNotification
{
  return @"SYDRemotePreferencesSourceDidChangeNotification";
}

+ (id)SYDRemotePreferencesSourceConfigurationDidChangeNotification
{
  return @"SYDRemotePreferencesSourceConfigurationDidChangeNotification";
}

void __108__SYDRemotePreferencesSource_initWithApplicationID_storeID_shared_additionalSource_containerPath_storeType___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_218588000, log, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF KVS: Trying to initialize NSUbiquitousKeyValueStore without a store identifier. Please specify a store identifier in your entitlements or initializer.", v1, 2u);
}

@end