@interface WLKAppLibraryCore
+ (id)sharedInstance;
- (BOOL)containsAppOfInterest:(id)a3;
- (WLKAppLibraryCore)init;
- (id)_connection;
- (id)_nonConformingBundleList;
- (id)_otherBundlesOfInterest;
- (void)_fetchApplicationsInProcess:(id)a3;
- (void)fetchApplications:(id)a3;
@end

@implementation WLKAppLibraryCore

void __39__WLKAppLibraryCore_fetchApplications___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  NSLog(&cfstr_Wlkapplibraryc_1.isa, v4);

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

- (void)fetchApplications:(id)a3
{
  id v4 = a3;
  if ((WLKIsDaemon() & 1) != 0 || WLKIsRunningTest())
  {
    uint64_t v5 = WLKStartupSignpostLogObject();
    os_signpost_id_t v6 = os_signpost_id_generate(v5);

    v7 = WLKStartupSignpostLogObject();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LibraryCore.fetchApplicationsInProcess", "", buf, 2u);
    }

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __39__WLKAppLibraryCore_fetchApplications___block_invoke;
    v22[3] = &unk_1E620A788;
    v9 = (id *)v23;
    v23[0] = v4;
    v23[1] = v6;
    id v10 = v4;
    [(WLKAppLibraryCore *)self _fetchApplicationsInProcess:v22];
  }
  else
  {
    v11 = [(WLKAppLibraryCore *)self _connection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__WLKAppLibraryCore_fetchApplications___block_invoke_5;
    v20[3] = &unk_1E620A438;
    v9 = &v21;
    id v12 = v4;
    id v21 = v12;
    v13 = [v11 remoteObjectProxyWithErrorHandler:v20];

    v14 = [MEMORY[0x1E4F1C9C8] date];
    NSLog(&cfstr_Wlkapplibraryc_0.isa);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __39__WLKAppLibraryCore_fetchApplications___block_invoke_2;
    v17[3] = &unk_1E620A7B0;
    id v18 = v14;
    id v19 = v12;
    id v15 = v12;
    id v16 = v14;
    [v13 fetchApplications:v17];
  }
}

- (id)_connection
{
  p_xpcLock = &self->_xpcLock;
  os_unfair_lock_lock(&self->_xpcLock);
  if (!self->_connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.watchlistd.xpc" options:0];
    connection = self->_connection;
    self->_connection = v4;

    os_signpost_id_t v6 = self->_connection;
    v7 = WLKConnectionClientInterface();
    [(NSXPCConnection *)v6 setExportedInterface:v7];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v8 = self->_connection;
    v9 = WLKConnectionServerInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_69_0];
    objc_initWeak(&location, self);
    id v10 = self->_connection;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __32__WLKAppLibraryCore__connection__block_invoke_2;
    id v16 = &unk_1E620A550;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:&v13];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_xpcLock);
  v11 = self->_connection;

  return v11;
}

uint64_t __35__WLKAppLibraryCore_sharedInstance__block_invoke()
{
  sharedInstance___singleInstance = objc_alloc_init(WLKAppLibraryCore);

  return MEMORY[0x1F41817F8]();
}

- (WLKAppLibraryCore)init
{
  v9.receiver = self;
  v9.super_class = (Class)WLKAppLibraryCore;
  v2 = [(WLKAppLibraryCore *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.WatchListKit.AppLibraryCore", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    os_signpost_id_t v6 = (PSSSSubscriptionManagerInternal *)objc_alloc_init(MEMORY[0x1E4F83CD0]);
    subscriptionManager = v2->_subscriptionManager;
    v2->_subscriptionManager = v6;

    v2->_xpcLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_2 != -1) {
    dispatch_once(&sharedInstance___once_2, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance___singleInstance;

  return v2;
}

void __39__WLKAppLibraryCore_fetchApplications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = WLKStartupSignpostLogObject();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "LibraryCore.fetchApplicationsInProcess", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__WLKAppLibraryCore_fetchApplications___block_invoke_5(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_Wlkapplibraryc.isa, a2);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    dispatch_queue_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)containsAppOfInterest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v4);
      }
      objc_super v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
      id v10 = objc_msgSend(v9, "entitlementValueForKey:ofClass:", @"com.apple.smoot.subscriptionservice", objc_opt_class(), (void)v16);

      v11 = [(WLKAppLibraryCore *)self _otherBundlesOfInterest];
      id v12 = [v9 bundleIdentifier];
      char v13 = [v11 containsObject:v12];

      BOOL v14 = 1;
      if (v10 || (v13 & 1) != 0) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_nonConformingBundleList
{
  if (_nonConformingBundleList_onceToken != -1) {
    dispatch_once(&_nonConformingBundleList_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)_nonConformingBundleList___nonConformingBundles;

  return v2;
}

void __45__WLKAppLibraryCore__nonConformingBundleList__block_invoke()
{
  v0 = (void *)_nonConformingBundleList___nonConformingBundles;
  _nonConformingBundleList___nonConformingBundles = (uint64_t)&unk_1F13D9AF8;
}

- (id)_otherBundlesOfInterest
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WLKAppLibraryCore__otherBundlesOfInterest__block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  if (_otherBundlesOfInterest_onceToken != -1) {
    dispatch_once(&_otherBundlesOfInterest_onceToken, block);
  }
  return (id)_otherBundlesOfInterest___bundlesOfInterest;
}

void __44__WLKAppLibraryCore__otherBundlesOfInterest__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CA48];
  v2 = [*(id *)(a1 + 32) _nonConformingBundleList];
  id v6 = [v1 arrayWithArray:v2];

  id v3 = WLKTVAppBundleID();
  [v6 addObject:v3];

  uint64_t v4 = [v6 copy];
  uint64_t v5 = (void *)_otherBundlesOfInterest___bundlesOfInterest;
  _otherBundlesOfInterest___bundlesOfInterest = v4;
}

- (void)_fetchApplicationsInProcess:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke;
  v7[3] = &unk_1E620A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = WLKStartupSignpostLogObject();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = WLKStartupSignpostLogObject();
  id v8 = v7;
  unint64_t v53 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LibraryCore.fetchApplicationsInProcess.filter", "", buf, 2u);
  }
  os_signpost_id_t spid = v6;

  objc_super v9 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_29;
  v73[3] = &unk_1E620A7F8;
  v73[4] = *(void *)(a1 + 32);
  [v9 setFilter:v73];
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSinceDate:v4];
  NSLog(&cfstr_Wlkapplibraryc_2.isa, v11);

  id v12 = WLKStartupSignpostLogObject();
  char v13 = v12;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v13, OS_SIGNPOST_INTERVAL_END, spid, "LibraryCore.fetchApplicationsInProcess.filter", "", buf, 2u);
  }

  BOOL v14 = WLKStartupSignpostLogObject();
  id v15 = v14;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LibraryCore.fetchApplicationsInProcess.checkAppRecords", "", buf, 2u);
  }
  uint64_t v55 = a1;
  v50 = (void *)v4;
  v51 = v3;

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v16 = v9;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v75 count:16];
  v54 = v16;
  if (v17)
  {
    uint64_t v18 = v17;
    LODWORD(v19) = 0;
    uint64_t v20 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v70 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x1BA9E92A0]();
        v24 = WLKAppProxyForLSApplicationRecord(v22);
        char v25 = [v24 isEntitled];
        v26 = v2;
        if (v25) {
          goto LABEL_18;
        }
        char v27 = [v24 isTVApp];
        v26 = v2;
        if (v27) {
          goto LABEL_18;
        }
        v28 = [*(id *)(v55 + 32) _nonConformingBundleList];
        v29 = [v24 bundleIdentifier];
        int v30 = [v28 containsObject:v29];

        id v16 = v54;
        v26 = v56;
        if (v30) {
LABEL_18:
        }
          [v26 addObject:v24];
      }
      uint64_t v19 = (v19 + v18);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v69 objects:v75 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v19 = 0;
  }

  v31 = [MEMORY[0x1E4F1C9C8] date];
  [v31 timeIntervalSinceDate:v50];
  NSLog(&cfstr_Wlkapplibraryc_3.isa, v32, v19);

  v33 = WLKStartupSignpostLogObject();
  v34 = v33;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v34, OS_SIGNPOST_INTERVAL_END, spid, "LibraryCore.fetchApplicationsInProcess.checkAppRecords", "", buf, 2u);
  }

  v35 = WLKStartupSignpostLogObject();
  v36 = v35;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v36, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LibraryCore.fetchApplicationsInProcess.InstalledAppBundles", "", buf, 2u);
  }

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_37;
  v65[3] = &unk_1E620A820;
  id v37 = v47;
  id v66 = v37;
  id v38 = v49;
  id v67 = v38;
  id v39 = v48;
  id v68 = v39;
  [v2 enumerateObjectsUsingBlock:v65];
  v40 = WLKStartupSignpostLogObject();
  v41 = v40;
  if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v41, OS_SIGNPOST_INTERVAL_END, spid, "LibraryCore.fetchApplicationsInProcess.InstalledAppBundles", "", buf, 2u);
  }

  id v42 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if ([v38 count])
  {
    v43 = WLKStartupSignpostLogObject();
    v44 = v43;
    if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v44, OS_SIGNPOST_INTERVAL_BEGIN, spid, "LibraryCore.fetchApplicationsInProcess.ActiveSubscription", "", buf, 2u);
    }

    v45 = *(void **)(*(void *)(v55 + 32) + 24);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_40;
    v57[3] = &unk_1E620A848;
    os_signpost_id_t v64 = spid;
    id v58 = v38;
    id v59 = v42;
    id v60 = v51;
    id v61 = v37;
    id v63 = *(id *)(v55 + 40);
    id v62 = v56;
    [v45 getActiveSubscriptionServicesMatchingBundleIdentifiers:v39 domainIdentifiers:MEMORY[0x1E4F1CBF0] maximumExpirationLimit:v57 completionHandler:31104000.0];

    v46 = v58;
    goto LABEL_39;
  }
  NSLog(&cfstr_Wlkapplibraryc_5.isa);
  _configureDemoBundles(v38, v51, v37);
  if (*(void *)(v55 + 40))
  {
    v46 = (*((void (**)(uint64_t, void *, void *, void *, void *))fetchedApplicationsCompletion + 2))((uint64_t)fetchedApplicationsCompletion, v38, v51, v37, v56);
    (*(void (**)(void))(*(void *)(v55 + 40) + 16))();
LABEL_39:
  }
}

uint64_t __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 entitlements];
  uint64_t v5 = [v4 objectForKey:@"com.apple.smoot.subscriptionservice" ofClass:objc_opt_class()];

  if (v5)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _otherBundlesOfInterest];
    id v8 = [v3 bundleIdentifier];
    uint64_t v6 = [v7 containsObject:v8];
  }
  return v6;
}

void __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_37(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 isAppStoreVendable] & 1) == 0 && (objc_msgSend(v5, "isSystemApp") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v5];
  }
  [*(id *)(a1 + 40) addObject:v5];
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = [v5 bundleIdentifier];
  [v3 addObject:v4];
}

void __49__WLKAppLibraryCore__fetchApplicationsInProcess___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v32 = a2;
  id v5 = a3;
  uint64_t v6 = WLKStartupSignpostLogObject();
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "LibraryCore.fetchApplicationsInProcess.ActiveSubscription", "", buf, 2u);
  }

  objc_super v9 = WLKStartupSignpostLogObject();
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 80);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LibraryCore.fetchApplicationsInProcess.SubscribedAppBundle", "", buf, 2u);
  }

  if (v5) {
    NSLog(&cfstr_Wlkapplibraryc_4.isa, v5);
  }
  v31 = v5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v12 = [v32 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if ([*(id *)(a1 + 32) count])
        {
          uint64_t v18 = 0;
          while (1)
          {
            uint64_t v19 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v18];
            uint64_t v20 = [v19 bundleIdentifier];
            int v21 = [v20 isEqualToString:v17];

            if (v21) {
              break;
            }

            if (++v18 >= (unint64_t)[*(id *)(a1 + 32) count]) {
              goto LABEL_20;
            }
          }
          [*(id *)(a1 + 40) addIndex:v18];
          v22 = [v19 dictionaryRepresentation];
          v23 = (void *)[v22 mutableCopy];

          v24 = [v32 objectForKeyedSubscript:v17];
          char v25 = [v24 objectForKeyedSubscript:@"type"];

          [v23 setObject:v25 forKeyedSubscript:@"WLKAppProxy.subscriptionInfo"];
          v26 = [[WLKAppProxy alloc] initWithDictionary:v23];
          [*(id *)(a1 + 48) addObject:v26];
        }
LABEL_20:
        ;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v14);
  }

  char v27 = WLKStartupSignpostLogObject();
  v28 = v27;
  os_signpost_id_t v29 = *(void *)(a1 + 80);
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v28, OS_SIGNPOST_INTERVAL_END, v29, "LibraryCore.fetchApplicationsInProcess.SubscribedAppBundle", "", buf, 2u);
  }

  [*(id *)(a1 + 32) removeObjectsAtIndexes:*(void *)(a1 + 40)];
  _configureDemoBundles(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
  if (*(void *)(a1 + 72))
  {
    int v30 = (*((void (**)(uint64_t, void *, void *, void *, void *))fetchedApplicationsCompletion + 2))((uint64_t)fetchedApplicationsCompletion, *(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64));
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __32__WLKAppLibraryCore__connection__block_invoke()
{
}

void __32__WLKAppLibraryCore__connection__block_invoke_2(uint64_t a1)
{
  NSLog(&cfstr_Wlkapplibraryc_7.isa);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained + 8;
    id v5 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 8);
    uint64_t v4 = *(void **)&v5[4]._os_unfair_lock_opaque;
    *(void *)&v5[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v3);
    WeakRetained = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end