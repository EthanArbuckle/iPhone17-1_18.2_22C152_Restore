@interface SYDClientToDaemonConnection
+ (BOOL)hasPerformedAppLaunchSyncForStoreIdentifier:(id)a3;
+ (BOOL)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3;
+ (id)allStoreIdentifiersWithError:(id *)a3;
+ (id)clientProtocolInterface;
+ (id)daemonProtocolInterface;
+ (id)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:(id)a3;
+ (id)disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier:(id)a3;
+ (id)machServiceName;
+ (id)machServiceNameUsingTestServer:(BOOL)a3;
+ (id)newXPCConnection;
+ (id)shouldSyncOnFirstInitializationOverride;
+ (void)processAccountChangesWithCompletionHandler:(id)a3;
+ (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4;
+ (void)setHasPerformedAppLaunchSyncForStoreIdentifier:(id)a3;
+ (void)setShouldSyncOnFirstInitializationOverride:(id)a3;
+ (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 completionHandler:(id)a5;
+ (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 testConfiguration:(id)a5 completionHandler:(id)a6;
- (BOOL)didLogFaultForEntitlements;
- (BOOL)getObject:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)hasFullCachedDictionary;
- (BOOL)isSyncingWithCloud;
- (BOOL)needsChangeDictionaryFromDaemon;
- (BOOL)removeObjectForKey:(id)a3 error:(id *)a4;
- (BOOL)setObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)validateKey:(id)a3 error:(id *)a4;
- (NSLock)cacheLock;
- (NSMutableDictionary)cachedObjects;
- (NSString)storeIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)analyticsQueue;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)queue;
- (SYDClientToDaemonConnection)init;
- (SYDClientToDaemonConnection)initWithStoreConfiguration:(id)a3;
- (SYDClientToDaemonConnection)initWithStoreIdentifier:(id)a3 type:(int64_t)a4;
- (SYDStoreConfiguration)storeConfiguration;
- (__CFDictionary)copyDictionary;
- (id)asyncDaemonWithErrorHandler:(id)a3;
- (id)changeToken;
- (id)copyDictionaryWithoutNullValues:(id)a3;
- (id)copyExternalChangesWithChangeCount:(int64_t *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithError:(id *)a3;
- (id)machServiceName;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 error:(id *)a4;
- (id)synchronousDaemonWithErrorHandler:(id)a3;
- (int)daemonWakeNotifyToken;
- (int64_t)storeType;
- (unint64_t)syncingWithCloudCounter;
- (unsigned)hasExternalChanges;
- (unsigned)synchronize;
- (unsigned)synchronizeForced:(unsigned __int8)a3;
- (void)___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist___;
- (void)___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:(id)a3;
- (void)___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore___:(id)a3;
- (void)___We_looked_everywhere_but_we_cant_find_your_store_identifier___;
- (void)___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore___;
- (void)___You_are_not_entitled_for_NSUbiquitousKeyValueStore___;
- (void)___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore___;
- (void)___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again___;
- (void)___Your_store_identifier_is_empty___;
- (void)_clearCachedObjects;
- (void)_handleCacheErrorForKey:(id)a3;
- (void)applicationWillEnterForeground;
- (void)changeToken;
- (void)daemonDidWake;
- (void)dealloc;
- (void)logFaultIfNecessaryForError:(id)a3;
- (void)performOpportunisticAppLaunchSyncIfNecessary;
- (void)processChangeDictionary:(id)a3;
- (void)registerForApplicationLifecycleEvents;
- (void)registerForDaemonDidWakeNotifications;
- (void)registerForSynchronizedDefaults;
- (void)removeObjectForKey:(id)a3;
- (void)scheduleRemoteSynchronization;
- (void)setAnalyticsQueue:(id)a3;
- (void)setCacheLock:(id)a3;
- (void)setCachedObjects:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setChangeToken:(id)a3;
- (void)setDaemonWakeNotifyToken:(int)a3;
- (void)setDidLogFaultForEntitlements:(BOOL)a3;
- (void)setHasFullCachedDictionary:(BOOL)a3;
- (void)setNeedsChangeDictionaryFromDaemon:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setQueue:(id)a3;
- (void)setStoreConfiguration:(id)a3;
- (void)setSyncingWithCloudCounter:(unint64_t)a3;
- (void)setXpcConnection:(id)a3;
- (void)storeDidChangeWithStoreID:(id)a3 changeDictionary:(id)a4;
- (void)synchronizationWithCompletionHandler:(id)a3;
@end

@implementation SYDClientToDaemonConnection

- (id)objectForKey:(id)a3
{
  return [(SYDClientToDaemonConnection *)self objectForKey:a3 error:0];
}

- (id)asyncDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(SYDClientToDaemonConnection *)v5 xpcConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__SYDClientToDaemonConnection_asyncDaemonWithErrorHandler___block_invoke;
  v10[3] = &unk_2643295B0;
  id v7 = v4;
  id v11 = v7;
  v8 = [v6 remoteObjectProxyWithErrorHandler:v10];

  objc_sync_exit(v5);
  return v8;
}

- (id)synchronousDaemonWithErrorHandler:(id)a3
{
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  id v7 = [(SYDClientToDaemonConnection *)v6 xpcConnection];
  if (!v7)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:v6 file:@"SYDClientToDaemonConnection.m" lineNumber:1691 description:@"Expected non-nil XPC connection"];
  }
  v8 = [v7 _queue];

  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:v6 file:@"SYDClientToDaemonConnection.m" lineNumber:1692 description:@"Expected non-nil XPC connection queue"];
  }
  v9 = [v7 _queue];
  dispatch_assert_queue_not_V2(v9);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__SYDClientToDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke;
  v15[3] = &unk_2643295B0;
  id v10 = v5;
  id v16 = v10;
  id v11 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v15];

  objc_sync_exit(v6);
  return v11;
}

- (NSXPCConnection)xpcConnection
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_xpcConnection)
  {
    v3 = SYDGetConnectionLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_218588000, v3, OS_LOG_TYPE_INFO, "Creating new XPC connection", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, v2);
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    id v5 = [(SYDClientToDaemonConnection *)v2 machServiceName];
    uint64_t v6 = [v4 initWithMachServiceName:v5 options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v6;

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global_280];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__SYDClientToDaemonConnection_xpcConnection__block_invoke_281;
    v13[3] = &unk_2643296E8;
    objc_copyWeak(&v14, buf);
    [(NSXPCConnection *)v2->_xpcConnection setInvalidationHandler:v13];
    v8 = +[SYDClientToDaemonConnection clientProtocolInterface];
    [(NSXPCConnection *)v2->_xpcConnection setExportedInterface:v8];

    v9 = [[SYDClientProtocolProxy alloc] initWithTarget:v2];
    [(NSXPCConnection *)v2->_xpcConnection setExportedObject:v9];

    id v10 = +[SYDClientToDaemonConnection daemonProtocolInterface];
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v10];

    [(NSXPCConnection *)v2->_xpcConnection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
  objc_sync_exit(v2);

  id v11 = v2->_xpcConnection;
  return v11;
}

- (id)objectForKey:(id)a3 error:(id *)a4
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v40 = _os_activity_create(&dword_218588000, "kvs/get-object", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v40, &state);
  id v7 = SYDGetAccessorSignpostsLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  v9 = SYDGetAccessorSignpostsLog();
  id v10 = v9;
  unint64_t v39 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    id v11 = [(SYDClientToDaemonConnection *)self storeIdentifier];
    uint64_t v12 = [v11 UTF8String];
    uint64_t v13 = [v6 UTF8String];
    *(_DWORD *)buf = 136315394;
    uint64_t v74 = v12;
    __int16 v75 = 2080;
    uint64_t v76 = v13;
    _os_signpost_emit_with_name_impl(&dword_218588000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "GetObject", "StoreIdentifier=%{signpost.description:attribute}s Key=%{signpost.description:attribute}s", buf, 0x16u);
  }
  id v14 = SYDGetConnectionLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    [(SYDClientToDaemonConnection *)self storeIdentifier];
    objc_claimAutoreleasedReturnValue();
    -[SYDClientToDaemonConnection objectForKey:error:]();
  }

  id v71 = 0;
  BOOL v15 = [(SYDClientToDaemonConnection *)self validateKey:v6 error:&v71];
  id v16 = v71;
  if (v15)
  {
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy_;
    v69 = __Block_byref_object_dispose_;
    id v70 = 0;
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x3032000000;
    v62 = __Block_byref_object_copy_;
    v63 = __Block_byref_object_dispose_;
    id v64 = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    char v58 = 0;
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke;
    v51[3] = &unk_2643293F8;
    v51[4] = self;
    v53 = &v59;
    id v17 = v6;
    id v52 = v17;
    v54 = &v55;
    v18 = (void (**)(void))MEMORY[0x21D46D020](v51);
    v18[2]();
    if (!*((unsigned char *)v56 + 24))
    {
      v19 = [(SYDClientToDaemonConnection *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2;
      block[3] = &unk_264329448;
      v47 = v18;
      v48 = &v55;
      block[4] = self;
      v49 = &v65;
      id v46 = v17;
      v50 = &v59;
      dispatch_sync(v19, block);
    }
    [(SYDClientToDaemonConnection *)self logFaultIfNecessaryForError:v66[5]];
    v20 = [(SYDClientToDaemonConnection *)self storeIdentifier];
    v21 = [(SYDClientToDaemonConnection *)self analyticsQueue];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_137;
    v41[3] = &unk_264329498;
    id v22 = v17;
    id v42 = v22;
    id v23 = v20;
    id v43 = v23;
    v44 = &v55;
    dispatch_async(v21, v41);

    v24 = SYDGetConnectionLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v38 = v18;
      id v25 = v6;
      id v26 = v16;
      os_signpost_id_t v27 = v8;
      v28 = a4;
      int v29 = *((unsigned __int8 *)v56 + 24);
      uint64_t v30 = v60[5];
      uint64_t v31 = [(SYDClientToDaemonConnection *)self storeIdentifier];
      v32 = (void *)v31;
      v33 = @" (from cache)";
      *(_DWORD *)buf = 138413571;
      if (!v29) {
        v33 = &stru_26C9AC820;
      }
      uint64_t v74 = (uint64_t)v33;
      __int16 v75 = 2160;
      uint64_t v76 = 1752392040;
      __int16 v77 = 2113;
      id v78 = v22;
      __int16 v79 = 2160;
      uint64_t v80 = 1752392040;
      __int16 v81 = 2113;
      uint64_t v82 = v30;
      __int16 v83 = 2112;
      uint64_t v84 = v31;
      _os_log_impl(&dword_218588000, v24, OS_LOG_TYPE_INFO, "Returning object%@ for key <(%{private, mask.hash}@)> = <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x3Eu);

      a4 = v28;
      os_signpost_id_t v8 = v27;
      id v16 = v26;
      id v6 = v25;
      v18 = v38;
    }

    if (a4) {
      *a4 = (id) v66[5];
    }
    v34 = SYDGetAccessorSignpostsLog();
    v35 = v34;
    if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_218588000, v35, OS_SIGNPOST_INTERVAL_END, v8, "GetObject", (const char *)&unk_21859A1BD, buf, 2u);
    }

    id v36 = (id)v60[5];
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v59, 8);

    _Block_object_dispose(&v65, 8);
  }
  else
  {
    [(SYDClientToDaemonConnection *)self logFaultIfNecessaryForError:v16];
    id v36 = 0;
    if (a4) {
      *a4 = v16;
    }
  }

  os_activity_scope_leave(&state);
  return v36;
}

- (void)logFaultIfNecessaryForError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    id v5 = [v4 domain];
    int v6 = [v5 isEqualToString:@"SyncedDefaults"];

    if (v6)
    {
      uint64_t v7 = [v10 code];
      if (v7 <= 5554)
      {
        if (v7 == 2222)
        {
          [(SYDClientToDaemonConnection *)self ___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:v10];
        }
        else if (v7 == 3333 {
               && ![(SYDClientToDaemonConnection *)self didLogFaultForEntitlements])
        }
        {
          [(SYDClientToDaemonConnection *)self setDidLogFaultForEntitlements:1];
          [(SYDClientToDaemonConnection *)self ___You_are_not_entitled_for_NSUbiquitousKeyValueStore];
        }
      }
      else
      {
        switch(v7)
        {
          case 5555:
            [(SYDClientToDaemonConnection *)self ___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore];
            break;
          case 6666:
            [(SYDClientToDaemonConnection *)self ___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore];
            break;
          case 101010:
            [(SYDClientToDaemonConnection *)self ___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist];
            break;
        }
      }
    }
    else
    {
      os_signpost_id_t v8 = [v10 domain];
      int v9 = [v8 isEqualToString:*MEMORY[0x263F07F70]];

      if (v9 && [v10 code] == 4099) {
        [(SYDClientToDaemonConnection *)self ___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)validateKey:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = v5;
  if (v5 && [v5 length])
  {
    LOBYTE(a4) = 1;
  }
  else if (a4)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Invalid key parameter provided"];
    os_signpost_id_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F08320];
    v12[0] = v7;
    int v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    *a4 = [v8 errorWithDomain:@"SyncedDefaults" code:2222 userInfo:v9];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void)objectForKey:error:.cold.1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_9(&dword_218588000, v6, v4, "Getting object for key <(%{private, mask.hash}@)> in store <(%@)>", v5);
}

id __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_141(uint64_t a1)
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"keyHash";
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "hash"));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v9[0] = v2;
  v9[1] = v3;
  v8[1] = @"storeIdentifier";
  v8[2] = @"objectExistedInCache";
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(v4 + 8) + 24)];
  v9[2] = v5;
  int v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [(SYDClientToDaemonConnection *)self storeConfiguration];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p storeConfiguration=%@>", v5, self, v6];;

  return v7;
}

- (NSString)storeIdentifier
{
  uint64_t v2 = [(SYDClientToDaemonConnection *)self storeConfiguration];
  uint64_t v3 = [v2 storeID];
  uint64_t v4 = [v3 identifier];

  return (NSString *)v4;
}

- (SYDStoreConfiguration)storeConfiguration
{
  return self->_storeConfiguration;
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

+ (id)daemonProtocolInterface
{
  if (daemonProtocolInterface_onceToken != -1) {
    dispatch_once(&daemonProtocolInterface_onceToken, &__block_literal_global_222);
  }
  uint64_t v2 = (void *)daemonProtocolInterface_interface;
  return v2;
}

+ (id)clientProtocolInterface
{
  if (clientProtocolInterface_onceToken != -1) {
    dispatch_once(&clientProtocolInterface_onceToken, &__block_literal_global_274);
  }
  uint64_t v2 = (void *)clientProtocolInterface_interface;
  return v2;
}

- (unsigned)synchronizeForced:(unsigned __int8)a3
{
  uint64_t v4 = _os_activity_create(&dword_218588000, "kvs/synchronize", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v5 = [(SYDClientToDaemonConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke;
  block[3] = &unk_2643294E8;
  block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(v5, block);

  [(SYDClientToDaemonConnection *)self logFaultIfNecessaryForError:v9[5]];
  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  os_activity_scope_leave(&state);

  return self;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)machServiceName
{
  uint64_t v2 = objc_opt_class();
  return (id)[v2 machServiceNameUsingTestServer:0];
}

+ (id)machServiceNameUsingTestServer:(BOOL)a3
{
  return @"com.apple.kvsd";
}

- (id)dictionaryRepresentationWithError:(id *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = [(SYDClientToDaemonConnection *)self cacheLock];
  [v5 lock];

  if ([(SYDClientToDaemonConnection *)self hasFullCachedDictionary])
  {
    int v6 = SYDGetConnectionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SYDClientToDaemonConnection dictionaryRepresentationWithError:](self, v6);
    }

    uint64_t v7 = [(SYDClientToDaemonConnection *)self cachedObjects];
    id v8 = [(SYDClientToDaemonConnection *)self copyDictionaryWithoutNullValues:v7];

    int v9 = [(SYDClientToDaemonConnection *)self cacheLock];
    [v9 unlock];
  }
  else
  {
    uint64_t v10 = [(SYDClientToDaemonConnection *)self cacheLock];
    [v10 unlock];

    int v9 = _os_activity_create(&dword_218588000, "kvs/dictionary-representation", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v9, &state);
    uint64_t v11 = SYDGetAccessorSignpostsLog();
    os_signpost_id_t v12 = os_signpost_id_generate(v11);

    id v13 = SYDGetAccessorSignpostsLog();
    uint64_t v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      id v15 = [(SYDClientToDaemonConnection *)self storeIdentifier];
      uint64_t v16 = [v15 UTF8String];
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v16;
      _os_signpost_emit_with_name_impl(&dword_218588000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "GetDictionaryRepresentation", "StoreIdentifier=%{signpost.description:attribute}s", (uint8_t *)&buf, 0xCu);
    }
    char v17 = SYDGetConnectionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [(SYDClientToDaemonConnection *)self storeIdentifier];
      [(SYDClientToDaemonConnection *)v18 dictionaryRepresentationWithError:v17];
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy_;
    v50 = __Block_byref_object_dispose_;
    id v51 = 0;
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy_;
    unint64_t v39 = __Block_byref_object_dispose_;
    id v40 = 0;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __65__SYDClientToDaemonConnection_dictionaryRepresentationWithError___block_invoke;
    v34[3] = &unk_264329330;
    v34[4] = &v35;
    v19 = [(SYDClientToDaemonConnection *)self synchronousDaemonWithErrorHandler:v34];
    v20 = [(SYDClientToDaemonConnection *)self storeConfiguration];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __65__SYDClientToDaemonConnection_dictionaryRepresentationWithError___block_invoke_2;
    v33[3] = &unk_264329358;
    v33[4] = &v35;
    v33[5] = &buf;
    [v19 dictionaryRepresentationForStoreWithConfiguration:v20 reply:v33];

    uint64_t v21 = v36[5];
    if (!v21)
    {
      id v22 = SYDGetConnectionLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        id v23 = [(SYDClientToDaemonConnection *)self storeIdentifier];
        [(SYDClientToDaemonConnection *)v23 dictionaryRepresentationWithError:v22];
      }

      v24 = [(SYDClientToDaemonConnection *)self cacheLock];
      [v24 lock];

      id v25 = (void *)[*(id *)(*((void *)&buf + 1) + 40) mutableCopy];
      [(SYDClientToDaemonConnection *)self setCachedObjects:v25];

      [(SYDClientToDaemonConnection *)self setHasFullCachedDictionary:1];
      id v26 = [(SYDClientToDaemonConnection *)self cacheLock];
      [v26 unlock];

      uint64_t v21 = v36[5];
    }
    [(SYDClientToDaemonConnection *)self logFaultIfNecessaryForError:v21];
    if (!*(void *)(*((void *)&buf + 1) + 40))
    {
      *(void *)(*((void *)&buf + 1) + 40) = MEMORY[0x263EFFA78];
    }
    os_signpost_id_t v27 = SYDGetConnectionLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = [(SYDClientToDaemonConnection *)self storeIdentifier];
      uint64_t v29 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)id v42 = 138412547;
      id v43 = v28;
      __int16 v44 = 2113;
      uint64_t v45 = v29;
      _os_log_impl(&dword_218588000, v27, OS_LOG_TYPE_INFO, "Returning dictionary representation for store <%@>: %{private}@", v42, 0x16u);
    }
    if (a3) {
      *a3 = (id) v36[5];
    }
    uint64_t v30 = SYDGetAccessorSignpostsLog();
    uint64_t v31 = v30;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)id v42 = 0;
      _os_signpost_emit_with_name_impl(&dword_218588000, v31, OS_SIGNPOST_INTERVAL_END, v12, "GetDictionaryRepresentation", (const char *)&unk_21859A1BD, v42, 2u);
    }

    id v8 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&buf, 8);
    os_activity_scope_leave(&state);
  }

  return v8;
}

- (void)processChangeDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SYDClientToDaemonConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  id v22 = v4;
  int v6 = [v4 objectForKeyedSubscript:@"NSUbiquitousKeyValueStoreDidChangeExternallyNotificationUserInfo"];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F085E0]];
  uint64_t v21 = v6;
  v20 = [v6 objectForKeyedSubscript:*MEMORY[0x263F085D8]];
  if ([v20 integerValue] == 3) {
    [(SYDClientToDaemonConnection *)self _clearCachedObjects];
  }
  id v8 = [(SYDClientToDaemonConnection *)self cacheLock];
  [v8 lock];

  [(SYDClientToDaemonConnection *)self setHasFullCachedDictionary:0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
        id v15 = SYDGetConnectionLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 141558275;
          uint64_t v31 = 1752392040;
          __int16 v32 = 2113;
          uint64_t v33 = v14;
          _os_log_debug_impl(&dword_218588000, v15, OS_LOG_TYPE_DEBUG, "Invalidating cached value for changed key <(%{private, mask.hash}@)>", buf, 0x16u);
        }

        uint64_t v16 = [(SYDClientToDaemonConnection *)self cachedObjects];
        [v16 removeObjectForKey:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v11);
  }

  char v17 = [(SYDClientToDaemonConnection *)self cacheLock];
  [v17 unlock];

  if (v21)
  {
    v18 = [(SYDClientToDaemonConnection *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SYDClientToDaemonConnection_processChangeDictionary___block_invoke;
    block[3] = &unk_264329510;
    block[4] = self;
    id v24 = v21;
    id v25 = v9;
    dispatch_async(v18, block);
  }
  v19 = [v22 objectForKeyedSubscript:@"ChangeToken"];
  if (v19) {
    [(SYDClientToDaemonConnection *)self setChangeToken:v19];
  }
}

void __54__SYDClientToDaemonConnection_daemonProtocolInterface__block_invoke_271(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  int v6 = a2;
  SYDErrorUserInfoClasses();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  SEL v7 = NSSelectorFromString(v6);

  uint64_t v8 = [v5 integerValue];
  [v4 setClasses:v9 forSelector:v7 argumentIndex:v8 ofReply:1];
}

- (void)setHasFullCachedDictionary:(BOOL)a3
{
  self->_hasFullCachedDictionary = a3;
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v3 = (id *)(a1 + 32);
    uint64_t v2 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_3;
    v18[3] = &unk_264329330;
    v18[4] = *(void *)(a1 + 64);
    id v4 = [v2 synchronousDaemonWithErrorHandler:v18];
    id v5 = (void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 40);
    SEL v7 = [*(id *)(a1 + 32) storeConfiguration];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_4;
    v16[3] = &unk_264329420;
    long long v17 = *(_OWORD *)(a1 + 64);
    [v4 objectForKey:v6 inStoreWithConfiguration:v7 reply:v16];

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      id v9 = SYDGetConnectionLog();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8)
      {
        if (v10) {
          __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_cold_2(a1 + 40, a1 + 32);
        }

        uint64_t v11 = [*(id *)(a1 + 32) cacheLock];
        [v11 lock];

        uint64_t v12 = [*(id *)(a1 + 32) cachedObjects];
        [v12 setObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forKey:*(void *)(a1 + 40)];
      }
      else
      {
        if (v10) {
          __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_cold_1(a1 + 40, a1 + 32);
        }

        uint64_t v13 = [*v3 cacheLock];
        [v13 lock];

        uint64_t v12 = [*v3 cachedObjects];
        uint64_t v14 = [MEMORY[0x263EFF9D0] null];
        [v12 setObject:v14 forKey:*v5];
      }
      id v15 = [*v3 cacheLock];
      [v15 unlock];
    }
  }
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cacheLock];
  [v2 lock];

  uint64_t v3 = [*(id *)(a1 + 32) cachedObjects];
  uint64_t v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  SEL v7 = [*(id *)(a1 + 32) cacheLock];
  [v7 unlock];

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v9 = [MEMORY[0x263EFF9D0] null];
    LODWORD(v8) = [v8 isEqual:v9];

    if (v8)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = 0;
    }
  }
}

- (NSLock)cacheLock
{
  return self->_cacheLock;
}

- (NSMutableDictionary)cachedObjects
{
  return self->_cachedObjects;
}

- (void)setChangeToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_218588000, "kvs/save-change-token", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = SYDGetConnectionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SYDClientToDaemonConnection setChangeToken:]();
  }

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__SYDClientToDaemonConnection_setChangeToken___block_invoke;
  v11[3] = &unk_264329330;
  v11[4] = &v12;
  SEL v7 = [(SYDClientToDaemonConnection *)self synchronousDaemonWithErrorHandler:v11];
  uint64_t v8 = [(SYDClientToDaemonConnection *)self storeConfiguration];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__SYDClientToDaemonConnection_setChangeToken___block_invoke_2;
  v10[3] = &unk_264329330;
  void v10[4] = &v12;
  [v7 saveChangeToken:v4 forStoreWithConfiguration:v8 reply:v10];

  if (v13[5])
  {
    id v9 = SYDGetConnectionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SYDClientToDaemonConnection setChangeToken:]();
    }
  }
  else
  {
    id v9 = SYDGetConnectionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SYDClientToDaemonConnection setChangeToken:]();
    }
  }

  _Block_object_dispose(&v12, 8);
  os_activity_scope_leave(&state);
}

void __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_170(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsChangeDictionaryFromDaemon:1];
  [*(id *)(a1 + 40) synchronize];
  uint64_t v2 = [*(id *)(a1 + 40) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_264329538;
  id v7 = *(id *)(a1 + 56);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  id v6 = v3;
  uint64_t v8 = v4;
  dispatch_async(v2, block);
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  char v3 = [*(id *)(a1 + 32) needsChangeDictionaryFromDaemon];
  uint64_t v4 = SYDGetConnectionLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v6 = [*v2 storeIdentifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_218588000, v5, OS_LOG_TYPE_INFO, "Synchronizing for store <(%@)>", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    id v7 = [*v2 changeToken];
    uint64_t v8 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_163;
    v15[3] = &unk_264329330;
    void v15[4] = *(void *)(a1 + 48);
    id v9 = [v8 synchronousDaemonWithErrorHandler:v15];
    uint64_t v10 = [*v2 storeConfiguration];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_2;
    v14[3] = &unk_264329358;
    v14[4] = *(void *)(a1 + 48);
    v14[5] = &buf;
    [v9 changeDictionarySinceChangeToken:v7 inStoreWithConfiguration:v10 reply:v14];

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      uint64_t v11 = SYDGetConnectionLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_2();
      }

      [*v2 setNeedsChangeDictionaryFromDaemon:0];
      [*v2 processChangeDictionary:*(void *)(*((void *)&buf + 1) + 40)];
      char v12 = 1;
    }
    else
    {
      uint64_t v13 = SYDGetConnectionLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_1();
      }

      char v12 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_3();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)setNeedsChangeDictionaryFromDaemon:(BOOL)a3
{
  self->_needsChangeDictionaryFromDaemon = a3;
}

- (BOOL)needsChangeDictionaryFromDaemon
{
  return self->_needsChangeDictionaryFromDaemon;
}

- (unsigned)synchronize
{
  return [(SYDClientToDaemonConnection *)self synchronizeForced:0];
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5(&dword_218588000, v0, v1, "Received change dictionary from daemon for %@", v2, v3, v4, v5, v6);
}

- (id)changeToken
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy_;
  id v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  uint64_t v3 = _os_activity_create(&dword_218588000, "kvs/get-change-token", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SYDClientToDaemonConnection changeToken]();
  }

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__SYDClientToDaemonConnection_changeToken__block_invoke;
  v11[3] = &unk_264329330;
  v11[4] = &v12;
  uint64_t v5 = [(SYDClientToDaemonConnection *)self synchronousDaemonWithErrorHandler:v11];
  uint8_t v6 = [(SYDClientToDaemonConnection *)self storeConfiguration];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__SYDClientToDaemonConnection_changeToken__block_invoke_2;
  v10[3] = &unk_2643294C0;
  void v10[4] = &v12;
  void v10[5] = &v19;
  [v5 changeTokenForStoreWithConfiguration:v6 reply:v10];

  if (v13[5])
  {
    id v7 = SYDGetConnectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SYDClientToDaemonConnection changeToken]();
    }
  }
  else
  {
    id v7 = SYDGetConnectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[SYDClientToDaemonConnection changeToken]();
    }
  }

  id v8 = (id)v20[5];
  _Block_object_dispose(&v12, 8);

  os_activity_scope_leave(&state);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (void)changeToken
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error getting change token from daemon: %@", v2, v3, v4, v5, v6);
}

- (void)setChangeToken:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_218588000, v0, v1, "Saving change token to daemon for %@", v2, v3, v4, v5, v6);
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_11(a1, a2), "storeIdentifier");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_218588000, v3, v4, "Caching object for key <(%{private, mask.hash}@)> from daemon in store <(%@)>", v5, v6, v7, v8, v9);
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_11(a1, a2), "storeIdentifier");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_218588000, v3, v4, "Caching NSNull for key <(%{private, mask.hash}@)> from daemon in store <(%@)>", v5, v6, v7, v8, v9);
}

- (void)synchronizationWithCompletionHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_218588000, "kvs/cloud-sync", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = SYDGetSyncSignpostsLog();
  uint64_t v7 = (char *)os_signpost_id_generate(v6);

  uint64_t v8 = SYDGetSyncSignpostsLog();
  uint8_t v9 = v8;
  if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    id v10 = [(SYDClientToDaemonConnection *)self storeIdentifier];
    uint64_t v11 = [v10 UTF8String];
    *(_DWORD *)long long buf = 136315138;
    uint64_t v28 = v11;
    _os_signpost_emit_with_name_impl(&dword_218588000, v9, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v7, "Sync", "StoreIdentifier=%{signpost.description:attribute}s enableTelemetry=YES ", buf, 0xCu);
  }
  uint64_t v12 = SYDGetConnectionLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = [(SYDClientToDaemonConnection *)self storeIdentifier];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v28 = (uint64_t)v13;
    __int16 v29 = 2112;
    uint64_t v30 = self;
    _os_log_impl(&dword_218588000, v12, OS_LOG_TYPE_INFO, "Synchronizing with cloud for store <(%@)> %@", buf, 0x16u);
  }
  uint64_t v14 = self;
  objc_sync_enter(v14);
  [(SYDClientToDaemonConnection *)v14 setSyncingWithCloudCounter:[(SYDClientToDaemonConnection *)v14 syncingWithCloudCounter] + 1];
  objc_sync_exit(v14);

  objc_initWeak((id *)buf, v14);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke;
  id v22 = &unk_264329588;
  objc_copyWeak(v25, (id *)buf);
  id v23 = v14;
  id v15 = v4;
  id v24 = v15;
  v25[1] = v7;
  uint64_t v16 = (void *)MEMORY[0x21D46D020](&v19);
  id v17 = -[SYDClientToDaemonConnection asyncDaemonWithErrorHandler:](v14, "asyncDaemonWithErrorHandler:", v16, v19, v20, v21, v22, v23);
  v18 = [(SYDClientToDaemonConnection *)v14 storeConfiguration];
  [v17 synchronizeStoreWithConfiguration:v18 completionHandler:v16];

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

- (void)registerForSynchronizedDefaults
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Registering for change notifications", v2, v3, v4, v5, v6);
}

- (void)registerForApplicationLifecycleEvents
{
  uint64_t v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SYDClientToDaemonConnection registerForApplicationLifecycleEvents]();
  }

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_applicationWillEnterForeground name:@"UIApplicationWillEnterForegroundNotification" object:0];
}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_195_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Finished registering for change notifications", v2, v3, v4, v5, v6);
}

- (void)setChangeToken:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Saved change token to daemon", v2, v3, v4, v5, v6);
}

void __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = SYDGetConnectionLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_cold_1(a1, (uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v7 = [WeakRetained storeIdentifier];
    *(_DWORD *)long long buf = 138412290;
    id v23 = v7;
    _os_log_impl(&dword_218588000, v5, OS_LOG_TYPE_INFO, "Done synchronizing with cloud for store <(%@)>", buf, 0xCu);
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  uint8_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
    objc_sync_enter(v10);
    objc_msgSend(v10, "setSyncingWithCloudCounter:", objc_msgSend(v10, "syncingWithCloudCounter") - 1);
    objc_sync_exit(v10);

    uint64_t v11 = [v10 callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_170;
    block[3] = &unk_264329560;
    uint64_t v12 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v10;
    id v20 = v12;
    id v13 = v3;
    uint64_t v14 = *(void *)(a1 + 56);
    id v19 = v13;
    uint64_t v21 = v14;
    dispatch_async(v11, block);
  }
  else
  {
    id v15 = SYDGetSyncSignpostsLog();
    uint64_t v16 = v15;
    os_signpost_id_t v17 = *(void *)(a1 + 56);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_218588000, v16, OS_SIGNPOST_INTERVAL_END, v17, "Sync", (const char *)&unk_21859A1BD, buf, 2u);
    }
  }
}

- (unint64_t)syncingWithCloudCounter
{
  return self->_syncingWithCloudCounter;
}

- (void)setSyncingWithCloudCounter:(unint64_t)a3
{
  self->_syncingWithCloudCounter = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

void __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint8_t v6 = [WeakRetained storeIdentifier];
  OUTLINED_FUNCTION_15();
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_218588000, a3, OS_LOG_TYPE_ERROR, "Error synchronizing with cloud for store <(%@)>: %@", v7, 0x16u);
}

- (void)setCachedObjects:(id)a3
{
}

- (BOOL)hasFullCachedDictionary
{
  return self->_hasFullCachedDictionary;
}

- (void)dictionaryRepresentationWithError:(os_log_t)log .cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_218588000, log, OS_LOG_TYPE_DEBUG, "Getting dictionary representation for store <(%@)>", buf, 0xCu);
}

- (void)dictionaryRepresentationWithError:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_218588000, log, OS_LOG_TYPE_DEBUG, "Caching dictionary representation for store <(%@)>", buf, 0xCu);
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Not getting change dictionary from the daemon because we don't need to", v2, v3, v4, v5, v6);
}

uint64_t __58__SYDClientToDaemonConnection_initWithStoreConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerForSynchronizedDefaults];
}

void __46__SYDClientToDaemonConnection_setChangeToken___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)dictionaryRepresentation
{
  return [(SYDClientToDaemonConnection *)self dictionaryRepresentationWithError:0];
}

uint64_t __54__SYDClientToDaemonConnection_clientProtocolInterface__block_invoke()
{
  clientProtocolInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9AF3C8];
  return MEMORY[0x270F9A758]();
}

void __54__SYDClientToDaemonConnection_daemonProtocolInterface__block_invoke()
{
  v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C9B06C0];
  uint64_t v1 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v2 = NSStringFromSelector(sel_setObject_forKey_inStoreWithConfiguration_reply_);
  [v1 setObject:&unk_26C9AD5F8 forKeyedSubscript:v2];

  uint64_t v3 = NSStringFromSelector(sel_objectForKey_inStoreWithConfiguration_reply_);
  [v1 setObject:&unk_26C9AD610 forKeyedSubscript:v3];

  uint64_t v4 = NSStringFromSelector(sel_removeObjectForKey_inStoreWithConfiguration_reply_);
  [v1 setObject:&unk_26C9AD5F8 forKeyedSubscript:v4];

  uint64_t v5 = NSStringFromSelector(sel_dictionaryRepresentationForStoreWithConfiguration_reply_);
  [v1 setObject:&unk_26C9AD610 forKeyedSubscript:v5];

  uint8_t v6 = NSStringFromSelector(sel_registerForChangeNotificationsForStoreWithConfiguration_reply_);
  [v1 setObject:&unk_26C9AD5F8 forKeyedSubscript:v6];

  uint64_t v7 = NSStringFromSelector(sel_changeDictionarySinceChangeToken_inStoreWithConfiguration_reply_);
  [v1 setObject:&unk_26C9AD610 forKeyedSubscript:v7];

  uint64_t v8 = NSStringFromSelector(sel_changeTokenForStoreWithConfiguration_reply_);
  [v1 setObject:&unk_26C9AD610 forKeyedSubscript:v8];

  uint64_t v9 = NSStringFromSelector(sel_saveChangeToken_forStoreWithConfiguration_reply_);
  [v1 setObject:&unk_26C9AD5F8 forKeyedSubscript:v9];

  id v10 = NSStringFromSelector(sel_synchronizeStoreWithConfiguration_completionHandler_);
  [v1 setObject:&unk_26C9AD5F8 forKeyedSubscript:v10];

  uint64_t v11 = NSStringFromSelector(sel_processAccountChangesWithCompletionHandler_);
  [v1 setObject:&unk_26C9AD5F8 forKeyedSubscript:v11];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__SYDClientToDaemonConnection_daemonProtocolInterface__block_invoke_271;
  v14[3] = &unk_2643296C0;
  id v12 = v0;
  id v15 = v12;
  [v1 enumerateKeysAndObjectsUsingBlock:v14];

  id v13 = (void *)daemonProtocolInterface_interface;
  daemonProtocolInterface_interface = (uint64_t)v12;
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_137(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_195(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SYDGetConnectionLog();
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_195_cold_2();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_195_cold_1();
  }
}

void __42__SYDClientToDaemonConnection_changeToken__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  if (!v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (SYDClientToDaemonConnection)initWithStoreIdentifier:(id)a3 type:(int64_t)a4
{
  id v6 = (SYDClientToDaemonConnection *)a3;
  if (v6
    || ([(id)objc_opt_class() defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:0],
        (id v6 = (SYDClientToDaemonConnection *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([(SYDClientToDaemonConnection *)v6 length])
    {
      id v7 = [[SYDStoreID alloc] initWithIdentifier:v6 type:a4];
      id v8 = [[SYDStoreConfiguration alloc] initWithStoreID:v7];
      self = [(SYDClientToDaemonConnection *)self initWithStoreConfiguration:v8];

      id v6 = self;
    }
    else
    {
      [(SYDClientToDaemonConnection *)self ___Your_store_identifier_is_empty];

      id v6 = 0;
    }
  }
  else
  {
    [(SYDClientToDaemonConnection *)self ___We_looked_everywhere_but_we_cant_find_your_store_identifier];
  }

  return v6;
}

- (SYDClientToDaemonConnection)initWithStoreConfiguration:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v30 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v31 = (objc_class *)objc_opt_class();
    __int16 v32 = NSStringFromClass(v31);
    [v30 handleFailureInMethod:a2, self, @"SYDClientToDaemonConnection.m", 114, @"Must specify a store configuration when initializing %@", v32 object file lineNumber description];
  }
  id v7 = SYDGetConnectionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    id v10 = [v6 storeID];
    uint64_t v11 = [v10 identifier];
    *(_DWORD *)long long buf = 138412802;
    uint64_t v37 = v9;
    __int16 v38 = 2112;
    id v39 = v6;
    __int16 v40 = 2112;
    v41 = v11;
    _os_log_impl(&dword_218588000, v7, OS_LOG_TYPE_INFO, "Initializing %@ with configuration %@ store <(%@)>", buf, 0x20u);
  }
  v35.receiver = self;
  v35.super_class = (Class)SYDClientToDaemonConnection;
  id v12 = [(SYDClientToDaemonConnection *)&v35 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storeConfiguration, a3);
    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.kvs.client", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    os_signpost_id_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.kvs.client.callback", v17);
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (OS_dispatch_queue *)v18;

    id v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v21 = dispatch_queue_attr_make_with_qos_class(v20, (dispatch_qos_class_t)0xFFFF8000, -15);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.kvs.client.analytics", v21);
    analyticsQueue = v13->_analyticsQueue;
    v13->_analyticsQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedObjects = v13->_cachedObjects;
    v13->_cachedObjects = v24;

    long long v26 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    cacheLock = v13->_cacheLock;
    v13->_cacheLock = v26;

    v13->_hasFullCachedDictionary = 0;
    v13->_syncingWithCloudCounter = 0;
    v13->_needsChangeDictionaryFromDaemon = 1;
    [(SYDClientToDaemonConnection *)v13 registerForDaemonDidWakeNotifications];
    [(SYDClientToDaemonConnection *)v13 registerForApplicationLifecycleEvents];
    [(SYDClientToDaemonConnection *)v13 performOpportunisticAppLaunchSyncIfNecessary];
    uint64_t v28 = [(SYDClientToDaemonConnection *)v13 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SYDClientToDaemonConnection_initWithStoreConfiguration___block_invoke;
    block[3] = &unk_264329308;
    v34 = v13;
    dispatch_async(v28, block);
  }
  return v13;
}

- (void)registerForDaemonDidWakeNotifications
{
  objc_initWeak(&location, self);
  id v3 = [(SYDClientToDaemonConnection *)self queue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __68__SYDClientToDaemonConnection_registerForDaemonDidWakeNotifications__block_invoke;
  v4[3] = &unk_264329648;
  objc_copyWeak(&v5, &location);
  notify_register_dispatch("com.apple.syncdefaultsd.daemon.wake", &self->_daemonWakeNotifyToken, v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)performOpportunisticAppLaunchSyncIfNecessary
{
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  uint64_t v4 = [(SYDClientToDaemonConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SYDClientToDaemonConnection_performOpportunisticAppLaunchSyncIfNecessary__block_invoke;
  block[3] = &unk_264329308;
  void block[4] = self;
  dispatch_after(v3, v4, block);
}

+ (id)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = [MEMORY[0x263F086E0] mainBundle];
    id v4 = [v5 bundleIdentifier];

    if (!v4)
    {
      id v6 = [MEMORY[0x263F08AB0] processInfo];
      id v4 = [v6 processName];
    }
  }
  id v7 = SYDGetConnectionLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:].cold.5();
  }

  id v8 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = (void *)SecTaskCopyValueForEntitlement(v8, @"com.apple.developer.ubiquity-kvstore-identifier", 0);
    CFRelease(v9);
    uint64_t v11 = SYDGetConnectionLog();
    id v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:].cold.4();
      }
LABEL_18:

      goto LABEL_20;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:]();
    }
  }
  else
  {
    id v12 = SYDGetConnectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:]();
    }
  }

  if (v4)
  {
    id v10 = [a1 disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier:v4];
    if (!v10) {
      goto LABEL_20;
    }
    id v12 = SYDGetConnectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[SYDClientToDaemonConnection defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:]();
    }
    goto LABEL_18;
  }
  id v10 = 0;
LABEL_20:

  return v10;
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.5()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Checking entitlements for KVS store identifier", v2, v3, v4, v5, v6);
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_218588000, v0, v1, "Found entitlement for KVS store: %@", v2, v3, v4, v5, v6);
}

void __68__SYDClientToDaemonConnection_synchronizationWithCompletionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }
  uint64_t v3 = SYDGetSyncSignpostsLog();
  uint64_t v4 = v3;
  os_signpost_id_t v5 = a1[6];
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint8_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_218588000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Sync", (const char *)&unk_21859A1BD, v6, 2u);
  }
}

void __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke_205(uint64_t a1)
{
  uint64_t v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke_205_cold_1(a1, v2);
  }
}

void __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke_205_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)OUTLINED_FUNCTION_13(a1) storeIdentifier];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_218588000, a2, OS_LOG_TYPE_DEBUG, "Completed foreground move triggered sync for store <(%@)>", v4, 0xCu);
}

- (void)applicationWillEnterForeground
{
  uint64_t v3 = [(SYDClientToDaemonConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke;
  block[3] = &unk_264329308;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) storeIdentifier];
    *(_DWORD *)long long buf = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_218588000, v2, OS_LOG_TYPE_INFO, "Performing moved to foreground sync for store <(%@)>", buf, 0xCu);
  }
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__SYDClientToDaemonConnection_applicationWillEnterForeground__block_invoke_205;
  v6[3] = &unk_264329670;
  v6[4] = v4;
  return [v4 synchronizationWithCompletionHandler:v6];
}

void __65__SYDClientToDaemonConnection_dictionaryRepresentationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (SYDClientToDaemonConnection)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithStoreIdentifier_type_);
  [v4 handleFailureInMethod:a2, self, @"SYDClientToDaemonConnection.m", 146, @"Please use -%@", v5 object file lineNumber description];

  return 0;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_218588000, v0, v1, "Deallocating daemon connection %@", v2, v3, v4, v5, v6);
}

- (int64_t)storeType
{
  uint64_t v2 = [(SYDClientToDaemonConnection *)self storeConfiguration];
  uint64_t v3 = [v2 storeID];
  int64_t v4 = [v3 type];

  return v4;
}

- (BOOL)isSyncingWithCloud
{
  return [(SYDClientToDaemonConnection *)self syncingWithCloudCounter] != 0;
}

+ (id)allStoreIdentifiersWithError:(id *)a3
{
  uint64_t v5 = _os_activity_create(&dword_218588000, "kvs/all-store-identifiers", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  dispatch_queue_t v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  uint8_t v6 = (void *)[a1 newXPCConnection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke;
  v17[3] = &unk_264329330;
  v17[4] = &v18;
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v17];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  dispatch_queue_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke_25;
  v10[3] = &unk_264329358;
  void v10[4] = &v11;
  void v10[5] = &v18;
  [v7 allStoreIdentifiersWithCompletionHandler:v10];
  if (a3) {
    *a3 = (id) v19[5];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);

  return v8;
}

void __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint8_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

+ (id)disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier:(id)a3
{
  uint64_t v3 = disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__onceToken, &__block_literal_global_1);
  }
  id v5 = [(id)disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__snowflakeStoreIdentifiersByApplicationIdentifier objectForKeyedSubscript:v4];

  return v5;
}

void __99__SYDClientToDaemonConnection_disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier___block_invoke()
{
  v3[21] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.sbd";
  v2[1] = @"com.apple.security.cloudkeychainproxy3";
  v3[0] = @"com.apple.sbd3";
  v3[1] = @"com.apple.security.cloudkeychainproxy3";
  v2[2] = @"accountsd";
  v2[3] = @"com.apple.finder";
  v3[2] = @"com.apple.accounts";
  v3[3] = @"com.apple.finder";
  v2[4] = @"com.apple.VoiceOverTouch";
  v2[5] = @"com.apple.TextInput.kbd";
  v3[4] = @"com.apple.VoiceOverTouch";
  v3[5] = @"com.apple.inputmethod.kbd";
  v2[6] = @"com.apple.nanoweatherprefsd";
  v2[7] = @"com.apple.springboard";
  v3[6] = @"com.apple.weather";
  v3[7] = @"com.apple.springboard";
  v2[8] = @"com.apple.backboardd";
  v2[9] = @"com.apple.datamigrator";
  v3[8] = @"com.apple.backboardd";
  v3[9] = @"com.apple.datamigrator";
  v2[10] = @"com.apple.CoreSuggestions";
  v2[11] = @"com.apple.cmfsyncagent";
  v3[10] = @"com.apple.CoreSuggestions";
  v3[11] = @"com.apple.cmfsyncagent";
  v2[12] = @"com.apple.accessibility.heard";
  v2[13] = @"wifid";
  v3[12] = @"com.apple.HearingAids";
  v3[13] = @"com.apple.wifid.known-networks";
  v2[14] = @"com.apple.wifi.manager";
  v2[15] = @"com.apple.wifid";
  v3[14] = @"com.apple.wifid.known-networks";
  v3[15] = @"com.apple.wifid.known-networks";
  v2[16] = @"com.apple.wifi.WiFiAgent";
  v2[17] = @"com.apple.coretelephony";
  v3[16] = @"com.apple.wifid.known-networks";
  v3[17] = @"com.apple.coretelephony";
  v2[18] = @"com.apple.mediaaccessibilityd";
  v2[19] = @"com.apple.tipsd";
  v3[18] = @"com.apple.mediaaccessibility";
  v3[19] = @"com.apple.tipsd";
  v2[20] = @"com.apple.touristd";
  v3[20] = @"com.apple.touristd";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:21];
  uint64_t v1 = (void *)disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__snowflakeStoreIdentifiersByApplicationIdentifier;
  disgustingUglyHardcodedKnownStoreIdentifierForApplicationIdentifier__snowflakeStoreIdentifiersByApplicationIdentifier = v0;
}

- (void)_handleCacheErrorForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDClientToDaemonConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SYDClientToDaemonConnection *)self cacheLock];
  [v6 lock];

  uint64_t v7 = [(SYDClientToDaemonConnection *)self cachedObjects];
  [v7 removeObjectForKey:v4];

  id v8 = [(SYDClientToDaemonConnection *)self cacheLock];
  [v8 unlock];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (BOOL)setObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _os_activity_create(&dword_218588000, "kvs/set-object", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  id v10 = SYDGetAccessorSignpostsLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  id v12 = SYDGetAccessorSignpostsLog();
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    id v14 = [(SYDClientToDaemonConnection *)self storeIdentifier];
    uint64_t v15 = [v14 UTF8String];
    uint64_t v16 = [v8 UTF8String];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v16;
    _os_signpost_emit_with_name_impl(&dword_218588000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SetObject", "StoreIdentifier=%{signpost.description:attribute}s Key=%{signpost.description:attribute}s", buf, 0x16u);
  }
  os_signpost_id_t v17 = SYDGetConnectionLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [(SYDClientToDaemonConnection *)self storeIdentifier];
    *(_DWORD *)long long buf = 141559043;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2160;
    uint64_t v64 = 1752392040;
    *(_WORD *)uint64_t v65 = 2113;
    *(void *)&v65[2] = v7;
    *(_WORD *)&v65[10] = 2112;
    *(void *)&v65[12] = v18;
    _os_log_impl(&dword_218588000, v17, OS_LOG_TYPE_INFO, "Setting object for key <(%{private, mask.hash}@)> = <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x34u);
  }
  id v59 = 0;
  BOOL v19 = [(SYDClientToDaemonConnection *)self validateKey:v8 error:&v59];
  id v20 = v59;
  if (v19)
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v64 = (uint64_t)__Block_byref_object_copy_;
    *(void *)uint64_t v65 = __Block_byref_object_dispose_;
    *(void *)&v65[8] = 0;
    unint64_t v21 = [v8 length];
    if (v21 > [(SYDRemotePreferencesSource *)self maximumKeyLength])
    {
      dispatch_queue_t v22 = (void *)MEMORY[0x263EFF940];
      int64_t v23 = [(SYDRemotePreferencesSource *)self maximumKeyLength];
      [v22 raise:*MEMORY[0x263EFF4A0], @"NSUbiquitousKeyValueStore key '%@' is longer than the maximum allowed UTF-16 code units of (%ld)", v8, v23 format];
LABEL_49:
      BOOL v24 = 0;
LABEL_50:
      _Block_object_dispose(buf, 8);

      goto LABEL_51;
    }
    id v25 = [(SYDClientToDaemonConnection *)self storeConfiguration];
    long long v26 = [v25 storeID];
    BOOL v27 = [v26 type] == 0;

    if (v27 && (unint64_t)[v8 lengthOfBytesUsingEncoding:4] >= 0xBE)
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"NSUbiquitousKeyValueStore key '%@' is larger than the maximum allowed UTF-8 code units of (%ld)", v8, 189 format];
      goto LABEL_49;
    }
    if (v7 && ([MEMORY[0x263F08AC0] propertyList:v7 isValidForFormat:200] & 1) == 0)
    {
      __int16 v44 = (void *)MEMORY[0x263F087E8];
      uint64_t v61 = *MEMORY[0x263F08320];
      v62 = @"Tried to set an object that is not a valid plist value.";
      uint64_t v45 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      uint64_t v46 = [v44 errorWithDomain:@"SyncedDefaults" code:2222 userInfo:v45];
      v47 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v46;

      if (a5) {
        *a5 = *(id *)(*(void *)&buf[8] + 40);
      }
      [(SYDClientToDaemonConnection *)self ___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore___:v7];
      goto LABEL_49;
    }
    uint64_t v28 = [(SYDClientToDaemonConnection *)self cacheLock];
    [v28 lock];

    __int16 v29 = [(SYDClientToDaemonConnection *)self cachedObjects];
    v49 = [v29 objectForKey:v8];

    uint64_t v30 = [(SYDClientToDaemonConnection *)self cacheLock];
    [v30 unlock];

    if (v49) {
      BOOL v31 = v7 != 0;
    }
    else {
      BOOL v31 = 0;
    }
    if (v31)
    {
      if ([v49 isEqual:v7])
      {
        __int16 v32 = SYDGetConnectionLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          [(SYDClientToDaemonConnection *)self storeIdentifier];
          objc_claimAutoreleasedReturnValue();
          -[SYDClientToDaemonConnection setObject:forKey:error:]();
        }
LABEL_22:

        goto LABEL_30;
      }
    }
    else if (!v7)
    {
      uint64_t v33 = [MEMORY[0x263EFF9D0] null];
      int v34 = [v49 isEqual:v33];

      if (v34)
      {
        __int16 v32 = SYDGetConnectionLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          [(SYDClientToDaemonConnection *)self storeIdentifier];
          objc_claimAutoreleasedReturnValue();
          -[SYDClientToDaemonConnection setObject:forKey:error:].cold.4();
        }
        goto LABEL_22;
      }
    }
    objc_super v35 = [(SYDClientToDaemonConnection *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke;
    block[3] = &unk_264329380;
    void block[4] = self;
    char v58 = buf;
    id v56 = v7;
    id v57 = v8;
    dispatch_sync(v35, block);

LABEL_30:
    id v36 = *(void **)(*(void *)&buf[8] + 40);
    if (v36)
    {
      uint64_t v37 = [v36 domain];
      if (![v37 isEqualToString:@"SyncedDefaults"])
      {
LABEL_36:

        goto LABEL_37;
      }
      BOOL v38 = [*(id *)(*(void *)&buf[8] + 40) code] == 6666;

      if (v38)
      {
        id v39 = SYDGetConnectionLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          -[SYDClientToDaemonConnection setObject:forKey:error:]();
        }

        __int16 v40 = [(SYDClientToDaemonConnection *)self callbackQueue];
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_133;
        v52[3] = &unk_2643293A8;
        id v53 = v8;
        v54 = self;
        dispatch_async(v40, v52);

        uint64_t v37 = v53;
        goto LABEL_36;
      }
    }
LABEL_37:
    [(SYDClientToDaemonConnection *)self logFaultIfNecessaryForError:*(void *)(*(void *)&buf[8] + 40)];
    if (a5) {
      *a5 = *(id *)(*(void *)&buf[8] + 40);
    }
    v41 = SYDGetConnectionLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      [(SYDClientToDaemonConnection *)self storeIdentifier];
      objc_claimAutoreleasedReturnValue();
      -[SYDClientToDaemonConnection setObject:forKey:error:]();
    }

    uint64_t v42 = SYDGetAccessorSignpostsLog();
    id v43 = v42;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)id v51 = 0;
      _os_signpost_emit_with_name_impl(&dword_218588000, v43, OS_SIGNPOST_INTERVAL_END, v11, "SetObject", (const char *)&unk_21859A1BD, v51, 2u);
    }

    BOOL v24 = *(void *)(*(void *)&buf[8] + 40) == 0;
    goto LABEL_50;
  }
  [(SYDClientToDaemonConnection *)self logFaultIfNecessaryForError:v20];
  BOOL v24 = 0;
  if (a5) {
    *a5 = v20;
  }
LABEL_51:

  os_activity_scope_leave(&state);
  return v24;
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke(uint64_t a1)
{
  uint64_t v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_2;
  v20[3] = &unk_264329330;
  v20[4] = *(void *)(a1 + 56);
  id v4 = [v2 synchronousDaemonWithErrorHandler:v20];
  id v5 = (void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*v3 storeConfiguration];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_3;
  v19[3] = &unk_264329330;
  v19[4] = *(void *)(a1 + 56);
  [v4 setObject:v7 forKey:v6 inStoreWithConfiguration:v8 reply:v19];

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    [*v3 _handleCacheErrorForKey:*v5];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = SYDGetConnectionLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11) {
        __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_cold_2(a1 + 48, (uint64_t)v3);
      }

      DeepCopy = (void *)CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], *(CFPropertyListRef *)(a1 + 40), 0);
      uint64_t v13 = [*(id *)(a1 + 32) cacheLock];
      [v13 lock];

      id v14 = [*(id *)(a1 + 32) cachedObjects];
      [v14 setObject:DeepCopy forKey:*(void *)(a1 + 48)];

      uint64_t v15 = [*(id *)(a1 + 32) cacheLock];
      [v15 unlock];
    }
    else
    {
      if (v11) {
        __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_cold_1(a1 + 48, (uint64_t)v3);
      }

      uint64_t v16 = [*v3 cacheLock];
      [v16 lock];

      os_signpost_id_t v17 = [*v3 cachedObjects];
      uint64_t v18 = [MEMORY[0x263EFF9D0] null];
      [v17 setObject:v18 forKey:*v5];

      DeepCopy = [*v3 cacheLock];
      [DeepCopy unlock];
    }
  }
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_133(uint64_t a1)
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F085D8];
  v9[0] = &unk_26C9AD5E0;
  uint64_t v3 = *MEMORY[0x263F085E0];
  v8[0] = v2;
  v8[1] = v3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  v9[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"SYDUbiquitousKeyValueStoreDidChangeExternallyNotification" object:*(void *)(a1 + 40) userInfo:v5];
}

- (void)removeObjectForKey:(id)a3
{
}

- (BOOL)removeObjectForKey:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_218588000, "kvs/remove-object", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = SYDGetAccessorSignpostsLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = SYDGetAccessorSignpostsLog();
  BOOL v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    id v12 = [(SYDClientToDaemonConnection *)self storeIdentifier];
    uint64_t v13 = [v12 UTF8String];
    uint64_t v14 = [v6 UTF8String];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v14;
    _os_signpost_emit_with_name_impl(&dword_218588000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "RemoveObject", "StoreIdentifier=%{signpost.description:attribute}s Key=%{signpost.description:attribute}s", buf, 0x16u);
  }
  uint64_t v15 = SYDGetConnectionLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [(SYDClientToDaemonConnection *)self storeIdentifier];
    *(_DWORD *)long long buf = 141558531;
    *(void *)&uint8_t buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    id v39 = v16;
    _os_log_impl(&dword_218588000, v15, OS_LOG_TYPE_INFO, "Removing object for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x20u);
  }
  id v36 = 0;
  BOOL v17 = [(SYDClientToDaemonConnection *)self validateKey:v6 error:&v36];
  id v18 = v36;
  if (v17)
  {
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v39 = __Block_byref_object_copy_;
    __int16 v40 = __Block_byref_object_dispose_;
    id v41 = 0;
    BOOL v19 = [(SYDClientToDaemonConnection *)self cacheLock];
    [v19 lock];

    id v20 = [(SYDClientToDaemonConnection *)self cachedObjects];
    unint64_t v21 = [v20 objectForKey:v6];

    dispatch_queue_t v22 = [(SYDClientToDaemonConnection *)self cacheLock];
    [v22 unlock];

    int64_t v23 = [MEMORY[0x263EFF9D0] null];
    int v24 = [v21 isEqual:v23];

    if (v24)
    {
      id v25 = SYDGetConnectionLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        [(SYDClientToDaemonConnection *)self storeIdentifier];
        objc_claimAutoreleasedReturnValue();
        -[SYDClientToDaemonConnection removeObjectForKey:error:]();
      }
    }
    else
    {
      BOOL v27 = [(SYDClientToDaemonConnection *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke;
      block[3] = &unk_2643293D0;
      void block[4] = self;
      objc_super v35 = buf;
      id v34 = v6;
      dispatch_sync(v27, block);
    }
    [(SYDClientToDaemonConnection *)self logFaultIfNecessaryForError:*(void *)(*(void *)&buf[8] + 40)];
    if (a4) {
      *a4 = *(id *)(*(void *)&buf[8] + 40);
    }
    uint64_t v28 = SYDGetConnectionLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      [(SYDClientToDaemonConnection *)self storeIdentifier];
      objc_claimAutoreleasedReturnValue();
      -[SYDClientToDaemonConnection removeObjectForKey:error:]();
    }

    __int16 v29 = SYDGetAccessorSignpostsLog();
    uint64_t v30 = v29;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)__int16 v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_218588000, v30, OS_SIGNPOST_INTERVAL_END, v9, "RemoveObject", (const char *)&unk_21859A1BD, v32, 2u);
    }

    BOOL v26 = *(void *)(*(void *)&buf[8] + 40) == 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(SYDClientToDaemonConnection *)self logFaultIfNecessaryForError:v18];
    BOOL v26 = 0;
    if (a4) {
      *a4 = v18;
    }
  }

  os_activity_scope_leave(&state);
  return v26;
}

void __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke(void *a1)
{
  uint64_t v3 = (id *)(a1 + 4);
  uint64_t v2 = (void *)a1[4];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_2;
  v14[3] = &unk_264329330;
  void v14[4] = a1[6];
  id v4 = [v2 synchronousDaemonWithErrorHandler:v14];
  id v5 = a1 + 5;
  uint64_t v6 = a1[5];
  uint64_t v7 = [*v3 storeConfiguration];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_3;
  v13[3] = &unk_264329330;
  void v13[4] = a1[6];
  [v4 removeObjectForKey:v6 inStoreWithConfiguration:v7 reply:v13];

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    [*v3 _handleCacheErrorForKey:*v5];
  }
  else
  {
    id v8 = SYDGetConnectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_cold_1((uint64_t)v5, (uint64_t)v3);
    }

    os_signpost_id_t v9 = [*v3 cacheLock];
    [v9 lock];

    id v10 = [*v3 cachedObjects];
    BOOL v11 = [MEMORY[0x263EFF9D0] null];
    [v10 setObject:v11 forKey:*v5];

    id v12 = [*v3 cacheLock];
    [v12 unlock];
  }
}

void __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_2(uint64_t a1, void *a2)
{
}

void __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

void __50__SYDClientToDaemonConnection_objectForKey_error___block_invoke_3(uint64_t a1, void *a2)
{
}

- (BOOL)getObject:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  id v10 = 0;
  uint64_t v7 = [(SYDClientToDaemonConnection *)self objectForKey:a4 error:&v10];
  id v8 = v10;
  if (a3) {
    *a3 = v7;
  }
  if (a5) {
    *a5 = v8;
  }

  return v8 == 0;
}

- (void)_clearCachedObjects
{
  uint64_t v3 = [(SYDClientToDaemonConnection *)self cacheLock];
  [v3 lock];

  [(SYDClientToDaemonConnection *)self setHasFullCachedDictionary:0];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(SYDClientToDaemonConnection *)self setCachedObjects:v4];

  id v5 = [(SYDClientToDaemonConnection *)self cacheLock];
  [v5 unlock];
}

void __65__SYDClientToDaemonConnection_dictionaryRepresentationWithError___block_invoke(uint64_t a1, void *a2)
{
}

- (id)copyDictionaryWithoutNullValues:(id)a3
{
  uint64_t v3 = (void *)[a3 mutableCopy];
  id v4 = [MEMORY[0x263EFF9D0] null];
  id v5 = [v3 allKeysForObject:v4];

  [v3 removeObjectsForKeys:v5];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

- (__CFDictionary)copyDictionary
{
  id v2 = [(SYDClientToDaemonConnection *)self dictionaryRepresentation];
  return (__CFDictionary *)CFRetain(v2);
}

void __46__SYDClientToDaemonConnection_setChangeToken___block_invoke(uint64_t a1, void *a2)
{
}

void __42__SYDClientToDaemonConnection_changeToken__block_invoke(uint64_t a1, void *a2)
{
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_163(uint64_t a1, void *a2)
{
}

void __55__SYDClientToDaemonConnection_processChangeDictionary___block_invoke(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __55__SYDClientToDaemonConnection_processChangeDictionary___block_invoke_cold_1(a1);
  }

  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"SYDUbiquitousKeyValueStoreDidChangeExternallyNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)scheduleRemoteSynchronization
{
}

+ (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
}

+ (void)synchronizeStoresWithIdentifiers:(id)a3 type:(int64_t)a4 testConfiguration:(id)a5 completionHandler:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = _os_activity_create(&dword_218588000, "kvs/cloud-sync-multiple", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  uint64_t v14 = SYDGetSyncSignpostsLog();
  uint64_t v15 = (char *)os_signpost_id_generate(v14);

  uint64_t v16 = SYDGetSyncSignpostsLog();
  BOOL v17 = v16;
  if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    id v18 = [v10 componentsJoinedByString:@","];
    uint64_t v19 = [v18 UTF8String];
    *(_DWORD *)long long buf = 136315138;
    uint64_t v35 = v19;
    _os_signpost_emit_with_name_impl(&dword_218588000, v17, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v15, "SyncMultiple", "Stores=%{signpost.description:attribute}s enableTelemetry=YES ", buf, 0xCu);
  }
  id v20 = SYDGetConnectionLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    unint64_t v21 = SYDStringForStoreType(a4);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v35 = (uint64_t)v21;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_impl(&dword_218588000, v20, OS_LOG_TYPE_INFO, "Synchronizing stores of type %@ with the cloud: %@", buf, 0x16u);
  }
  dispatch_queue_t v22 = (void *)[a1 newXPCConnection];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke;
  v31[3] = &unk_2643295B0;
  id v23 = v12;
  id v32 = v23;
  int v24 = [v22 remoteObjectProxyWithErrorHandler:v31];
  objc_initWeak((id *)buf, v22);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_174;
  v27[3] = &unk_264329588;
  objc_copyWeak(v30, (id *)buf);
  id v25 = v10;
  id v28 = v25;
  id v26 = v23;
  id v29 = v26;
  v30[1] = v15;
  [v24 synchronizeStoresWithIdentifiers:v25 type:a4 testConfiguration:v11 completionHandler:v27];

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);

  os_activity_scope_leave(&state);
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_174(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = SYDGetConnectionLog();
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_174_cold_1();
    }

    uint64_t v6 = [v3 domain];
    if ([v6 isEqual:@"SyncedDefaults"])
    {
      uint64_t v7 = [v3 code];

      if (v7 != 3333) {
        goto LABEL_12;
      }
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_175;
      v17[3] = &unk_264329308;
      id v18 = *(id *)(a1 + 32);
      if (_block_invoke_onceToken != -1) {
        dispatch_once(&_block_invoke_onceToken, v17);
      }
      uint64_t v6 = v18;
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v20 = v8;
    _os_log_impl(&dword_218588000, v6, OS_LOG_TYPE_INFO, "Done synchronizing with cloud for stores: %@", buf, 0xCu);
  }

LABEL_12:
  os_signpost_id_t v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_176;
    block[3] = &unk_2643295D8;
    id v16 = v9;
    id v15 = v3;
    dispatch_async(v10, block);
  }
  id v11 = SYDGetSyncSignpostsLog();
  id v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 56);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_218588000, v12, OS_SIGNPOST_INTERVAL_END, v13, "SyncMultiple", (const char *)&unk_21859A1BD, buf, 2u);
  }

  [WeakRetained setInvalidationHandler:0];
  [WeakRetained setInterruptionHandler:0];
  [WeakRetained invalidate];
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_175(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_264329308;
  id v2 = *(id *)(a1 + 32);
  if (_block_invoke_2_innerOnceToken != -1) {
    dispatch_once(&_block_invoke_2_innerOnceToken, block);
  }
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_2_cold_1(a1);
  }
}

uint64_t __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_176(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (BOOL)isCloudSyncUserDefaultEnabledForStoreIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_218588000, "kvs/is-cloud-sync-enabled", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = (void *)[a1 newXPCConnection];
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_178];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke_179;
  v10[3] = &unk_264329620;
  void v10[4] = &v11;
  [v7 isCloudSyncUserDefaultEnabledForStoreIdentifier:v4 completionHandler:v10];
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  os_activity_scope_leave(&state);
  return v8;
}

void __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke_cold_1();
  }
}

uint64_t __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke_179(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)setCloudSyncUserDefaultEnabled:(BOOL)a3 storeIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_218588000, "kvs/is-cloud-sync-enabled", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v7, &v11);
  if (v4)
  {
    char v8 = SYDGetConnectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[SYDClientToDaemonConnection setCloudSyncUserDefaultEnabled:storeIdentifier:]();
    }
  }
  else
  {
    char v8 = SYDGetConnectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[SYDClientToDaemonConnection setCloudSyncUserDefaultEnabled:storeIdentifier:]();
    }
  }

  os_signpost_id_t v9 = (void *)[a1 newXPCConnection];
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_182];
  [v10 setCloudSyncUserDefaultEnabled:v4 storeIdentifier:v6];

  os_activity_scope_leave(&v11);
}

void __78__SYDClientToDaemonConnection_setCloudSyncUserDefaultEnabled_storeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __78__SYDClientToDaemonConnection_setCloudSyncUserDefaultEnabled_storeIdentifier___block_invoke_cold_1();
  }
}

+ (id)machServiceName
{
  return (id)[a1 machServiceNameUsingTestServer:0];
}

+ (id)newXPCConnection
{
  id v3 = objc_alloc(MEMORY[0x263F08D68]);
  BOOL v4 = [a1 machServiceName];
  uint64_t v5 = (void *)[v3 initWithMachServiceName:v4 options:0];

  [v5 setInterruptionHandler:&__block_literal_global_188];
  [v5 setInvalidationHandler:&__block_literal_global_191];
  id v6 = +[SYDClientToDaemonConnection daemonProtocolInterface];
  [v5 setRemoteObjectInterface:v6];

  [v5 resume];
  return v5;
}

void __47__SYDClientToDaemonConnection_newXPCConnection__block_invoke()
{
  uint64_t v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_218588000, v0, OS_LOG_TYPE_INFO, "XPC connection was interrupted", v1, 2u);
  }
}

void __47__SYDClientToDaemonConnection_newXPCConnection__block_invoke_189()
{
  uint64_t v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __47__SYDClientToDaemonConnection_newXPCConnection__block_invoke_189_cold_1();
  }
}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_cold_1();
  }
}

void __68__SYDClientToDaemonConnection_registerForDaemonDidWakeNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained daemonDidWake];
}

- (void)daemonDidWake
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Pinged from daemon. IT'S ALIVE!!!", v2, v3, v4, v5, v6);
}

uint64_t __44__SYDClientToDaemonConnection_daemonDidWake__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerForSynchronizedDefaults];
}

void __75__SYDClientToDaemonConnection_performOpportunisticAppLaunchSyncIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) storeIdentifier];
  uint64_t v3 = [MEMORY[0x263F08AB0] processInfo];
  uint64_t v4 = [v3 processName];
  char v5 = [v4 isEqualToString:@"cfprefsd"];

  if ((v5 & 1) == 0)
  {
    uint8_t v6 = [MEMORY[0x263F64570] currentProcess];
    int v7 = [v6 isApplication];

    if (v7)
    {
      if (([(id)objc_opt_class() hasPerformedAppLaunchSyncForStoreIdentifier:v2] & 1) == 0)
      {
        [(id)objc_opt_class() setHasPerformedAppLaunchSyncForStoreIdentifier:v2];
        char v8 = SYDGetConnectionLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __75__SYDClientToDaemonConnection_performOpportunisticAppLaunchSyncIfNecessary__block_invoke_cold_1();
        }

        [*(id *)(a1 + 32) synchronizationWithCompletionHandler:0];
      }
    }
  }
}

+ (void)setHasPerformedAppLaunchSyncForStoreIdentifier:(id)a3
{
  id v8 = a3;
  id v4 = a1;
  objc_sync_enter(v4);
  char v5 = (void *)sAppLaunchSyncStoreIdentifiers;
  if (!sAppLaunchSyncStoreIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x263EFF9C0] set];
    int v7 = (void *)sAppLaunchSyncStoreIdentifiers;
    sAppLaunchSyncStoreIdentifiers = v6;

    char v5 = (void *)sAppLaunchSyncStoreIdentifiers;
  }
  [v5 addObject:v8];
  objc_sync_exit(v4);
}

+ (BOOL)hasPerformedAppLaunchSyncForStoreIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  char v6 = [(id)sAppLaunchSyncStoreIdentifiers containsObject:v4];
  objc_sync_exit(v5);

  return v6;
}

+ (void)setShouldSyncOnFirstInitializationOverride:(id)a3
{
}

+ (id)shouldSyncOnFirstInitializationOverride
{
  return (id)_shouldSyncOnFirstInitializationOverride;
}

- (void)___You_are_not_entitled_for_NSUbiquitousKeyValueStore___
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__SYDClientToDaemonConnection____You_are_not_entitled_for_NSUbiquitousKeyValueStore_____block_invoke;
  block[3] = &unk_264329308;
  void block[4] = self;
  if (___You_are_not_entitled_for_NSUbiquitousKeyValueStore____onceToken != -1) {
    dispatch_once(&___You_are_not_entitled_for_NSUbiquitousKeyValueStore____onceToken, block);
  }
}

void __87__SYDClientToDaemonConnection____You_are_not_entitled_for_NSUbiquitousKeyValueStore_____block_invoke(uint64_t a1)
{
  uint64_t v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __87__SYDClientToDaemonConnection____You_are_not_entitled_for_NSUbiquitousKeyValueStore_____block_invoke_cold_1(a1);
  }
}

- (void)___We_looked_everywhere_but_we_cant_find_your_store_identifier___
{
  if (___We_looked_everywhere_but_we_cant_find_your_store_identifier____onceToken != -1) {
    dispatch_once(&___We_looked_everywhere_but_we_cant_find_your_store_identifier____onceToken, &__block_literal_global_212);
  }
}

void __96__SYDClientToDaemonConnection____We_looked_everywhere_but_we_cant_find_your_store_identifier_____block_invoke()
{
  uint64_t v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __96__SYDClientToDaemonConnection____We_looked_everywhere_but_we_cant_find_your_store_identifier_____block_invoke_cold_1(v0, v1, v2);
  }
}

- (void)___Your_store_identifier_is_empty___
{
  if (___Your_store_identifier_is_empty____onceToken != -1) {
    dispatch_once(&___Your_store_identifier_is_empty____onceToken, &__block_literal_global_214);
  }
}

void __67__SYDClientToDaemonConnection____Your_store_identifier_is_empty_____block_invoke()
{
  uint64_t v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __67__SYDClientToDaemonConnection____Your_store_identifier_is_empty_____block_invoke_cold_1(v0, v1, v2);
  }
}

- (void)___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore___
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__SYDClientToDaemonConnection____You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore_____block_invoke;
  block[3] = &unk_264329308;
  void block[4] = self;
  if (___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore____onceToken != -1) {
    dispatch_once(&___You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore____onceToken, block);
  }
}

void __92__SYDClientToDaemonConnection____You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore_____block_invoke(uint64_t a1)
{
  uint64_t v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __92__SYDClientToDaemonConnection____You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore_____block_invoke_cold_1(a1);
  }
}

- (void)___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist___
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke;
  block[3] = &unk_264329308;
  void block[4] = self;
  if (___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist____onceToken != -1) {
    dispatch_once(&___For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist____onceToken, block);
  }
}

void __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke(uint64_t a1)
{
  int has_internal_content = os_variant_has_internal_content();
  uint64_t v3 = SYDGetConnectionLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_FAULT);
  if (has_internal_content)
  {
    if (v4) {
      __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke_cold_1(a1);
    }
  }
  else if (v4)
  {
    __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke_cold_2(a1);
  }
}

- (void)___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:(id)a3
{
  id v3 = a3;
  BOOL v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[SYDClientToDaemonConnection ___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:]();
  }
}

- (void)___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again___
{
  if (___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again____onceToken != -1) {
    dispatch_once(&___You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again____onceToken, &__block_literal_global_217);
  }
}

void __113__SYDClientToDaemonConnection____You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again_____block_invoke()
{
  uint64_t v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __113__SYDClientToDaemonConnection____You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again_____block_invoke_cold_1();
  }
}

- (void)___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore___
{
  if (___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore____onceToken[0] != -1) {
    dispatch_once(___You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore____onceToken, &__block_literal_global_219);
  }
}

void __95__SYDClientToDaemonConnection____You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore_____block_invoke()
{
  uint64_t v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __95__SYDClientToDaemonConnection____You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore_____block_invoke_cold_1();
  }
}

- (void)___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore___:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__SYDClientToDaemonConnection____Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore______block_invoke;
  block[3] = &unk_264329308;
  id v7 = v3;
  uint64_t v4 = ___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore_____onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&___Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore_____onceToken, block);
  }
}

void __94__SYDClientToDaemonConnection____Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore______block_invoke()
{
  uint64_t v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __94__SYDClientToDaemonConnection____Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore______block_invoke_cold_1();
  }
}

- (void)storeDidChangeWithStoreID:(id)a3 changeDictionary:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_218588000, "kvs/store-did-change", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_signpost_id_t v9 = [(SYDClientToDaemonConnection *)self storeConfiguration];
  id v10 = [v9 storeID];
  int v11 = [v10 isEqual:v6];

  if (v11)
  {
    id v12 = SYDGetConnectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [(SYDClientToDaemonConnection *)self storeIdentifier];
      *(_DWORD *)long long buf = 138412290;
      dispatch_queue_t v22 = v13;
      _os_log_impl(&dword_218588000, v12, OS_LOG_TYPE_INFO, "Received storeDidChange for store <(%@)>", buf, 0xCu);
    }
    if ([(SYDClientToDaemonConnection *)self isSyncingWithCloud])
    {
      char v14 = SYDGetConnectionLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SYDClientToDaemonConnection storeDidChangeWithStoreID:changeDictionary:]();
      }
    }
    else
    {
      BOOL v17 = [(SYDClientToDaemonConnection *)self queue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __74__SYDClientToDaemonConnection_storeDidChangeWithStoreID_changeDictionary___block_invoke;
      v18[3] = &unk_2643293A8;
      v18[4] = self;
      id v19 = v7;
      dispatch_async(v17, v18);
    }
  }
  else
  {
    id v15 = SYDGetConnectionLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v16 = [(SYDClientToDaemonConnection *)self storeConfiguration];
      [(SYDClientToDaemonConnection *)v16 storeDidChangeWithStoreID:buf changeDictionary:v15];
    }
  }
  os_activity_scope_leave(&state);
}

uint64_t __74__SYDClientToDaemonConnection_storeDidChangeWithStoreID_changeDictionary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) processChangeDictionary:*(void *)(a1 + 40)];
}

- (unsigned)hasExternalChanges
{
  return 0;
}

- (id)copyExternalChangesWithChangeCount:(int64_t *)a3
{
  return 0;
}

+ (void)processAccountChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_218588000, "kvs/process-account-changes", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = SYDGetConnectionLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[SYDClientToDaemonConnection processAccountChangesWithCompletionHandler:]();
  }

  id v7 = (void *)[a1 newXPCConnection];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke;
  v15[3] = &unk_2643295B0;
  id v8 = v4;
  id v16 = v8;
  os_signpost_id_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v15];
  objc_initWeak(&location, v7);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_220;
  v11[3] = &unk_264329698;
  objc_copyWeak(&v13, &location);
  id v10 = v8;
  id v12 = v10;
  [v9 processAccountChangesWithCompletionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  os_activity_scope_leave(&state);
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_220(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = SYDGetConnectionLog();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_220_cold_2();
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_220_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained setInterruptionHandler:0];
  [WeakRetained invalidate];
}

void __44__SYDClientToDaemonConnection_xpcConnection__block_invoke()
{
  uint64_t v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_218588000, v0, OS_LOG_TYPE_INFO, "XPC connection was interrupted", v1, 2u);
  }
}

void __44__SYDClientToDaemonConnection_xpcConnection__block_invoke_281(uint64_t a1)
{
  uint64_t v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_218588000, v2, OS_LOG_TYPE_INFO, "XPC connection was invalidated", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    [v5 setXpcConnection:0];
    objc_sync_exit(v5);
  }
}

void __65__SYDClientToDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__SYDClientToDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __59__SYDClientToDaemonConnection_asyncDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__SYDClientToDaemonConnection_asyncDaemonWithErrorHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setStoreConfiguration:(id)a3
{
}

- (void)setXpcConnection:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void)setCallbackQueue:(id)a3
{
}

- (void)setAnalyticsQueue:(id)a3
{
}

- (int)daemonWakeNotifyToken
{
  return self->_daemonWakeNotifyToken;
}

- (void)setDaemonWakeNotifyToken:(int)a3
{
  self->_daemonWakeNotifyToken = a3;
}

- (BOOL)didLogFaultForEntitlements
{
  return self->_didLogFaultForEntitlements;
}

- (void)setDidLogFaultForEntitlements:(BOOL)a3
{
  self->_didLogFaultForEntitlements = a3;
}

- (void)setCacheLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheLock, 0);
  objc_storeStrong((id *)&self->_cachedObjects, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_storeConfiguration, 0);
}

void __60__SYDClientToDaemonConnection_allStoreIdentifiersWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error obtaining synchronous remote object proxy to get all store identifiers: %@", v2, v3, v4, v5, v6);
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.1()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_15();
  uint64_t v4 = v0;
  __int16 v5 = v1;
  uint8_t v6 = @"com.apple.developer.ubiquity-kvstore-identifier";
  _os_log_error_impl(&dword_218588000, v2, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF KVS: KVS store identifier (%@) for (%@) was inferred from a hardcoded list. Please specify a store identifier in your NSUbiquitousKeyValueStore initializer or in the %@ entitlement.", v3, 0x20u);
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_218588000, v0, OS_LOG_TYPE_ERROR, "Unable to get a SecTaskRef to check for KVS store entitlement", v1, 2u);
}

+ (void)defaultStoreIdentifierForCurrentProcessWithApplicationIdentifier:.cold.3()
{
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_218588000, v0, OS_LOG_TYPE_ERROR, "Unable to find entitlement for KVS store", v1, 2u);
}

- (void)setObject:forKey:error:.cold.1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_9(&dword_218588000, v6, v4, "Did set object for key <(%{private, mask.hash}@)> in store <(%@)>", v5);
}

- (void)setObject:forKey:error:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_218588000, v1, OS_LOG_TYPE_ERROR, "Quota error saving (%{private}@)): %@", v2, 0x16u);
}

- (void)setObject:forKey:error:.cold.3()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_9(&dword_218588000, v6, v4, "Not setting identical object for key <(%{private, mask.hash}@)> in store <(%@)>", v5);
}

- (void)setObject:forKey:error:.cold.4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_9(&dword_218588000, v6, v4, "Not setting identical nil value for key <(%{private, mask.hash}@)> in store <(%@)>", v5);
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_11(a1, a2), "storeIdentifier");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_218588000, v3, v4, "Caching NSNull key <(%{private, mask.hash}@)> after setting to nil in store <(%@)>", v5, v6, v7, v8, v9);
}

void __54__SYDClientToDaemonConnection_setObject_forKey_error___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_11(a1, a2), "storeIdentifier");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_218588000, v3, v4, "Caching object for key <(%{private, mask.hash}@)> after setting in store <(%@)>", v5, v6, v7, v8, v9);
}

- (void)removeObjectForKey:error:.cold.1()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_9(&dword_218588000, v6, v4, "Did remove object for key <(%{private, mask.hash}@)> in store <(%@)>", v5);
}

- (void)removeObjectForKey:error:.cold.2()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(v1, v2, v3, 7.2226e-34);
  OUTLINED_FUNCTION_9(&dword_218588000, v6, v4, "Not removing already-nil object for key <(%{private, mask.hash}@)> from store <(%@)>", v5);
}

void __56__SYDClientToDaemonConnection_removeObjectForKey_error___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_11(a1, a2), "storeIdentifier");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6(&dword_218588000, v3, v4, "Caching NSNull for key <(%{private, mask.hash}@)> after removing it for store <(%@)>", v5, v6, v7, v8, v9);
}

- (void)dictionaryRepresentationWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 storeIdentifier];
  uint64_t v5 = [a1 cachedObjects];
  int v6 = 138412547;
  uint64_t v7 = v4;
  __int16 v8 = 2113;
  uint8_t v9 = v5;
  _os_log_debug_impl(&dword_218588000, a2, OS_LOG_TYPE_DEBUG, "Returning cached dictionary representation for store <(%@)>: %{private}@", (uint8_t *)&v6, 0x16u);
}

- (void)setChangeToken:.cold.2()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error saving change token to daemon: %@", v2, v3, v4, v5, v6);
}

void __49__SYDClientToDaemonConnection_synchronizeForced___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5(&dword_218588000, v0, v1, "Did not receive change dictionary from daemon for %@", v2, v3, v4, v5, v6);
}

void __55__SYDClientToDaemonConnection_processChangeDictionary___block_invoke_cold_1(uint64_t a1)
{
  __int16 v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x263F085D8]];
  [*(id *)(a1 + 48) count];
  OUTLINED_FUNCTION_6(&dword_218588000, v2, v3, "On queue posting change notification for %@ with reason=%@ and %ld changed key(s)", v4, v5, v6, v7, 2u);
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error obtaining remote object proxy for syncing multiple stores: %@", v2, v3, v4, v5, v6);
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_174_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error synchronizing multiple stores with cloud: %@", v2, v3, v4, v5, v6);
}

void __105__SYDClientToDaemonConnection_synchronizeStoresWithIdentifiers_type_testConfiguration_completionHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(a1) componentsJoinedByString:@","];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218588000, v2, v3, "BUG IN CLIENT OF KVS: Tried to sync multiple stores, but not entitled for all of them: %@", v4, v5, v6, v7, v8);
}

void __79__SYDClientToDaemonConnection_isCloudSyncUserDefaultEnabledForStoreIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error obtaining synchronous remote object proxy to check cloud sync enablement: %@", v2, v3, v4, v5, v6);
}

+ (void)setCloudSyncUserDefaultEnabled:storeIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_218588000, v0, v1, "Setting cloud sync to enabled for store: %@", v2, v3, v4, v5, v6);
}

+ (void)setCloudSyncUserDefaultEnabled:storeIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_218588000, v0, v1, "Setting cloud sync to disabled for store: %@", v2, v3, v4, v5, v6);
}

void __78__SYDClientToDaemonConnection_setCloudSyncUserDefaultEnabled_storeIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error obtaining synchronous remote object proxy to set cloud sync enablement: %@", v2, v3, v4, v5, v6);
}

void __47__SYDClientToDaemonConnection_newXPCConnection__block_invoke_189_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "XPC connection was invalidated", v2, v3, v4, v5, v6);
}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error getting proxy to register: %@", v2, v3, v4, v5, v6);
}

void __62__SYDClientToDaemonConnection_registerForSynchronizedDefaults__block_invoke_195_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error registering for change notifications: %@", v2, v3, v4, v5, v6);
}

void __75__SYDClientToDaemonConnection_performOpportunisticAppLaunchSyncIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_218588000, v0, v1, "Performing opportunistic app launch sync for store <(%@)>", v2, v3, v4, v5, v6);
}

void __87__SYDClientToDaemonConnection____You_are_not_entitled_for_NSUbiquitousKeyValueStore_____block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(a1) storeIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218588000, v2, v3, "BUG IN CLIENT OF KVS: Tried to access NSUbiquitousKeyValueStore '%@' without the proper entitlements. If your process is not entitled to access this store, then any attempts to get data will return nil, and any attempts to set data will be ignored. Please add the proper entitlements to access this store, or stop trying to access it in an unentitled process.", v4, v5, v6, v7, v8);
}

void __96__SYDClientToDaemonConnection____We_looked_everywhere_but_we_cant_find_your_store_identifier_____block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = @"com.apple.developer.ubiquity-kvstore-identifier";
  OUTLINED_FUNCTION_12(&dword_218588000, a1, a3, "BUG IN CLIENT OF KVS: Trying to initialize NSUbiquitousKeyValueStore without a store identifier. Please specify your store identifier in the '%@' entitlement.", (uint8_t *)&v3);
}

void __67__SYDClientToDaemonConnection____Your_store_identifier_is_empty_____block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = @"com.apple.developer.ubiquity-kvstore-identifier";
  OUTLINED_FUNCTION_12(&dword_218588000, a1, a3, "BUG IN CLIENT OF KVS: Trying to initialize NSUbiquitousKeyValueStore with a zero-length store identifier. Please specify a real store identifier in the '%@' entitlement.", (uint8_t *)&v3);
}

void __92__SYDClientToDaemonConnection____You_are_about_to_lose_data_in_NSUbiquitousKeyValueStore_____block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(a1) storeIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218588000, v2, v3, "BUG IN CLIENT OF KVS: Tried to access encrypted store '%@' before first unlock. When this fault occurs, NSUbiquitousKeyValueStore is about to return a nil value for any key you just asked for, even if there’s data in the store for that key. Depending on what might be done with that return value, this could result in data loss.", v4, v5, v6, v7, v8);
}

void __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(a1) storeIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218588000, v2, v3, "BUG IN KVS: Tried to access store that is unknown to the system (%{public}@). Please file a bug with a sysdiagnose on NSUbiquitousKeyValueStore.", v4, v5, v6, v7, v8);
}

void __100__SYDClientToDaemonConnection____For_some_reason_NSUbiquitousKeyValueStore_thinks_you_dont_exist_____block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13(a1) storeIdentifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8(&dword_218588000, v2, v3, "BUG IN KVS: Tried to access store that is unknown to the system (%{public}@). Please submit a bug report with a sysdiagnose.", v4, v5, v6, v7, v8);
}

- (void)___NSUbiquitousKeyValueStore_isnt_sure_exactly_what_you_did_but_it_was_invalid___:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12(&dword_218588000, v0, v1, "BUG IN CLIENT OF KVS: %{public}@", v2);
}

void __113__SYDClientToDaemonConnection____You_think_you_can_just_XPC_into_any_process_all_willy_nilly_well_think_again_____block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
}

void __95__SYDClientToDaemonConnection____You_exceeded_the_quota_limit_for_NSUbiquitousKeyValueStore_____block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_218588000, v0, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF KVS: Exceeded the maximum amount of data in NSUbiquitousKeyValueStore. This new data will not be saved, which means that you are likely experiencing data loss.", v1, 2u);
}

void __94__SYDClientToDaemonConnection____Tried_to_set_invalid_object_in_NSUbiquitousKeyValueStore______block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_218588000, v0, v1, "BUG IN CLIENT OF KVS: Tried to set an invalid object. Objects must be valid plist values. %@", v2);
}

- (void)storeDidChangeWithStoreID:changeDictionary:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Waiting to process change dictionary until the end of the cloud sync", v2, v3, v4, v5, v6);
}

- (void)storeDidChangeWithStoreID:(uint8_t *)buf changeDictionary:(os_log_t)log .cold.2(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_218588000, log, OS_LOG_TYPE_DEBUG, "Received storeDidChange for store that is not our store: self.configuration=%@ configuration=%@", buf, 0x16u);
}

+ (void)processAccountChangesWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Telling daemon to process account changes", v2, v3, v4, v5, v6);
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error obtaining asynchronous remote object proxy to process account changes: %@", v2, v3, v4, v5, v6);
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_220_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4(&dword_218588000, v0, v1, "Finished telling daemon to process account changes", v2, v3, v4, v5, v6);
}

void __74__SYDClientToDaemonConnection_processAccountChangesWithCompletionHandler___block_invoke_220_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Failed to tell daemon to process account changes: %@", v2, v3, v4, v5, v6);
}

void __65__SYDClientToDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error obtaining synchronous remote object proxy: %@", v2, v3, v4, v5, v6);
}

void __59__SYDClientToDaemonConnection_asyncDaemonWithErrorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_218588000, v0, v1, "Error obtaining asynchronous remote object proxy: %@", v2, v3, v4, v5, v6);
}

@end