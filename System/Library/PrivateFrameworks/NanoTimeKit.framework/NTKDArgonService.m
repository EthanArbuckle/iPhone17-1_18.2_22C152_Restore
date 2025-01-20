@interface NTKDArgonService
+ (id)sharedService;
+ (void)cleanUpStaleBundlesEventually;
- (APSConnection)pushConnection;
- (BOOL)_argonIsComplete;
- (BOOL)_handleDailyQuery;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)keyDescriptorsAwaitingUserNotifications;
- (NSUserDefaults)userDefaults;
- (NTKArgonManager)manager;
- (NTKFaceSupportNotificationActionEventRecorder)actionRecorder;
- (OS_dispatch_queue)pushQueue;
- (OS_dispatch_queue)userNotificationQueue;
- (UNUserNotificationCenter)userNotificationCenter;
- (id)_baseCriteriaForArgonActivities;
- (id)_criteriaForDailyRefreshActiviy;
- (id)_criteriaForFirstQueryActivity;
- (id)_init;
- (int)notifyToken;
- (int)pushToken;
- (void)_addFaceActionTappedFromNotification:(id)a3;
- (void)_argonIsComplete;
- (void)_checkInForDailyQueryActivity;
- (void)_checkInForFirstQueryActivity;
- (void)_handleFirstQuery;
- (void)_push_sendNotificationForContent:(id)a3 requestIdentifier:(id)a4 toNotificationCenter:(id)a5 identifier:(id)a6 bundle:(id)a7 completion:(id)a8;
- (void)_push_userNotification_faceBundleManagerDidUpdate:(id)a3;
- (void)_queue_push_userNotification_processWaitingNotifications;
- (void)_recordEventOfNotification:(id)a3 action:(int64_t)a4;
- (void)_setupUserNotificationCenter;
- (void)_viewFaceActionTappedFromNotification:(id)a3;
- (void)_viewWhatsNewActionTappedFromNotification:(id)a3;
- (void)argonManager:(id)a3 didExtractKeyDescriptor:(id)a4 toPath:(id)a5;
- (void)argonManager:(id)a3 didRemoveExtractedArgonFolderAtPath:(id)a4;
- (void)argonManager:(id)a3 failedToExtractKeyDescriptor:(id)a4 error:(id)a5;
- (void)argonManagerDidRefresh:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)ingestKeyDescriptor:(id)a3 withMethod:(unint64_t)a4 completion:(id)a5;
- (void)knownKeyDescriptors:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)push_postNotificationForKeyDescriptor:(id)a3 completion:(id)a4;
- (void)push_updatePushConnection;
- (void)queryForNewFaces:(id)a3;
- (void)requestCurrentEnvironment:(id)a3;
- (void)requestResetOnNextLaunch:(id)a3;
- (void)setCurrentEnvironment:(int64_t)a3 completion:(id)a4;
- (void)setKeyDescriptorsAwaitingUserNotifications:(id)a3;
- (void)setPushConnection:(id)a3;
- (void)setPushQueue:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserNotificationQueue:(id)a3;
- (void)start;
@end

@implementation NTKDArgonService

- (BOOL)_argonIsComplete
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  v4 = [MEMORY[0x1E4F1CA80] set];
  v5 = [(NTKDArgonService *)self manager];
  v6 = [v5 extractor];
  v7 = [v6 sourcePath];
  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v35 = 0;
  v9 = [v8 contentsOfDirectoryAtPath:v7 error:&v35];
  id v10 = v35;

  if (v9)
  {
    id v24 = v10;
    v25 = v7;
    v26 = v6;
    v27 = v5;
    v28 = v4;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "pathExtension", v24, v25, v26, v27);
          int v18 = [v17 isEqualToString:@"aea"];

          if (v18) {
            [v3 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v13);
    }

    v19 = [MEMORY[0x1E4F19A30] currentDevice];
    v20 = +[NTKFaceBundleManager sharedManager];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __36__NTKDArgonService__argonIsComplete__block_invoke;
    v29[3] = &unk_1E62C0DF8;
    v4 = v28;
    id v21 = v28;
    id v30 = v21;
    [v20 enumerateFaceBundlesOnDevice:v19 withBlock:v29];

    [v3 minusSet:v21];
    BOOL v22 = [v3 count] == 0;

    v6 = v26;
    v5 = v27;
    id v10 = v24;
    v7 = v25;
  }
  else
  {
    v19 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[NTKDArgonService _argonIsComplete]();
    }
    BOOL v22 = 1;
  }

  return v22;
}

- (NTKArgonManager)manager
{
  return self->_manager;
}

void __36__NTKDArgonService__argonIsComplete__block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v5 infoDictionary];
  v3 = [v2 objectForKey:@"Argon"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKey:@"FileName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

- (void)queryForNewFaces:(id)a3
{
  v4 = (void (**)(id, void))a3;
  id v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to query new faces…", v7, 2u);
  }

  if ([(NTKDArgonService *)self _argonIsComplete])
  {
    v4[2](v4, 0);
  }
  else
  {
    v6 = [(NTKDArgonService *)self manager];
    [v6 refreshWithReason:3];

    if (v4) {
      v4[2](v4, 1);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Getting XPC connection request for argon service…", (uint8_t *)buf, 2u);
  }

  v8 = NTKFaceSupportServerInterface();
  [v6 setExportedInterface:v8];

  v9 = +[NTKDArgonServiceXPCWrapper sharedXPCWrapper];
  [v6 setExportedObject:v9];

  objc_initWeak(buf, v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__NTKDArgonService_listener_shouldAcceptNewConnection___block_invoke;
  v11[3] = &unk_1E62C0068;
  objc_copyWeak(&v12, buf);
  [v6 setInvalidationHandler:v11];
  [v6 resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);

  return 1;
}

+ (id)sharedService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NTKDArgonService_sharedService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, block);
  }
  v2 = (void *)sharedService_service;

  return v2;
}

void __33__NTKDArgonService_sharedService__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)sharedService_service;
  sharedService_service = v1;
}

- (id)_init
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v59.receiver = self;
  v59.super_class = (Class)NTKDArgonService;
  v2 = [(NTKDArgonService *)&v59 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:v2 selector:sel__addFaceActionTappedFromNotification_ name:@"NTKFaceSupportAddFaceNotification" object:0];

    v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 addObserver:v2 selector:sel__viewFaceActionTappedFromNotification_ name:@"NTKFaceSupportViewFaceNotification" object:0];

    id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:v2 selector:sel__viewWhatsNewActionTappedFromNotification_ name:@"NTKFaceSupportViewWhatsNewNotification" object:0];

    v52 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.NanoTimeKit.face"];
    [v52 registerDefaults:&unk_1F16E87A0];
    [(NTKDArgonService *)v2 setUserDefaults:v52];
    id v6 = [(NTKDArgonService *)v2 userDefaults];
    int v7 = [v6 BOOLForKey:@"ResetFaceSupportOnNextLaunch"];

    if (v7)
    {
      v8 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Reset requested.", buf, 2u);
      }

      v9 = [(NTKDArgonService *)v2 userDefaults];
      [v9 removeObjectForKey:@"ResetFaceSupportOnNextLaunch"];
    }
    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanotimekit.facesupport.service.usernotificationqueue", v10);
    [(NTKDArgonService *)v2 setUserNotificationQueue:v11];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NTKDArgonService *)v2 setKeyDescriptorsAwaitingUserNotifications:v12];

    uint64_t v13 = BSCurrentUserDirectory();
    uint64_t v14 = [v13 stringByAppendingPathComponent:@"/Library/NanoTimeKit/FaceSupport/DateDatabase.db"];
    v15 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v14;
      _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_DEFAULT, "Push date storage at %@", buf, 0xCu);
    }

    if (v7)
    {
      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v16 removeItemAtPath:v14 error:0];
    }
    v17 = [[NTKFaceSupportNotificationActionEventRecorder alloc] initWithFilePath:v14];
    actionRecorder = v2->_actionRecorder;
    v2->_actionRecorder = v17;

    v19 = BSCurrentUserDirectory();
    v50 = [v19 stringByAppendingPathComponent:@"/Library/NanoTimeKit/FaceSupport/KeyDatabase"];
    v20 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v50;
      _os_log_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_DEFAULT, "Key storage at %@", buf, 0xCu);
    }

    if (v7)
    {
      id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v21 removeItemAtPath:v50 error:0];
    }
    v49 = NTKFaceSupportArchiveSourceDirectory();
    BOOL v22 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v49;
      _os_log_impl(&dword_1BC5A9000, v22, OS_LOG_TYPE_DEFAULT, "Extracting from %@", buf, 0xCu);
    }

    if (v7)
    {
      v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v23 removeItemAtPath:v49 error:0];
    }
    id v24 = NTKArgonExtractorBasePath();
    v25 = NTKArgonExtractorBuildVersion();
    v48 = [v24 stringByAppendingPathComponent:v25];
    v51 = [v24 stringByAppendingPathComponent:@"ExtractionInProgress"];
    v26 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v26 removeItemAtPath:v51 error:0];

    v27 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v61 = v48;
      __int16 v62 = 2112;
      v63 = v51;
      _os_log_impl(&dword_1BC5A9000, v27, OS_LOG_TYPE_DEFAULT, "Extracting to %@ - using %@ for in-progress extractions", buf, 0x16u);
    }

    if (v7)
    {
      v28 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v28 removeItemAtPath:v48 error:0];
    }
    v29 = BSCurrentUserDirectory();
    v47 = [v29 stringByAppendingPathComponent:@"/Library/NanoTimeKit/FaceSupport/Assets"];

    id v30 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v31 = [v30 removeItemAtPath:v47 error:0];

    if (v31)
    {
      long long v32 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BC5A9000, v32, OS_LOG_TYPE_DEFAULT, "Cleaned up obsolete asset database.", buf, 2u);
      }
    }
    uint64_t v45 = NTKFaceSupportDatabase();
    long long v33 = [[NTKArgonCloudKitClient alloc] initWithCloudKitDatabase:v45 zoneName:@"FaceSupport"];
    long long v34 = [MEMORY[0x1E4F1C978] arrayWithObject:v33];
    if (_os_feature_enabled_impl())
    {
      id v35 = objc_alloc_init(NTKDArgonInternalKeyFetcher);
      uint64_t v36 = [v34 arrayByAddingObject:v35];

      long long v34 = (void *)v36;
    }
    uint64_t v37 = [[NTKArgonLocalKeyDatabase alloc] initWithKeyStoragePath:v50];
    v38 = [[NTKArgonExtractor alloc] initWithSourcePath:v49 inProgressPath:v51 extractionPath:v48];
    v39 = [[NTKArgonManager alloc] initWithKeyDatabase:v37 fetchers:v34 extractor:v38];
    [(NTKArgonManager *)v39 addArgonManagerObserver:v2];
    objc_storeStrong((id *)&v2->_manager, v39);
    [(NTKDArgonService *)v2 _setupUserNotificationCenter];
    if (_os_feature_enabled_impl())
    {
      objc_initWeak((id *)buf, v2);
      if (_init_onceToken_0 != -1) {
        dispatch_once(&_init_onceToken_0, &__block_literal_global_151);
      }
      v40 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v58 = 0;
        _os_log_impl(&dword_1BC5A9000, v40, OS_LOG_TYPE_DEFAULT, "Demo: Setting up pings.", v58, 2u);
      }

      v2->_notifyToken = -1;
      v41 = _init_queue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __25__NTKDArgonService__init__block_invoke_154;
      handler[3] = &unk_1E62C0DD0;
      objc_copyWeak(&v57, (id *)buf);
      notify_register_dispatch("com.apple.nanotimekit.argon.demo.ping", &v2->_notifyToken, v41, handler);
      v2->_pushToken = -1;
      v42 = _init_queue;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __25__NTKDArgonService__init__block_invoke_161;
      v53[3] = &unk_1E62C0E70;
      objc_copyWeak(&v55, (id *)buf);
      v54 = v37;
      notify_register_dispatch("com.apple.nanotimekit.argon.demo.push", &v2->_pushToken, v42, v53);

      objc_destroyWeak(&v55);
      objc_destroyWeak(&v57);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(NTKDArgonService *)v2 _checkInForFirstQueryActivity];
      [(NTKDArgonService *)v2 _checkInForDailyQueryActivity];
    }
    objc_msgSend(v52, "addObserver:forKeyPath:options:context:", v2, @"FaceSupportNotifications", 0, &NTKDArgonServiceKVOContext, v45);
    v43 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v43 addObserver:v2 selector:sel__push_userNotification_faceBundleManagerDidUpdate_ name:@"NTKFaceBundleManagerDidUpdateBundlesNotificationName" object:0];
  }
  return v2;
}

void __25__NTKDArgonService__init__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.nanotimekit.argon.demo", 0);
  uint64_t v1 = (void *)_init_queue;
  _init_queue = (uint64_t)v0;
}

void __25__NTKDArgonService__init__block_invoke_154(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_DEFAULT, "NTKDArgonService: notify ping!", v3, 2u);
    }

    [WeakRetained queryForNewFaces:&__block_literal_global_158];
  }
}

void __25__NTKDArgonService__init__block_invoke_155(uint64_t a1, int a2)
{
  v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      __int16 v8 = 0;
      id v5 = "Demo: Querying for new faces.";
      id v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v7 = 0;
    id v5 = "Demo: NOT querying for new faces.";
    id v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }
}

void __25__NTKDArgonService__init__block_invoke_161(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "NTKDArgonService: push ping!", buf, 2u);
    }

    BOOL v4 = [MEMORY[0x1E4F1CA80] set];
    id v5 = [MEMORY[0x1E4F19A30] currentDevice];
    id v6 = +[NTKFaceBundleManager sharedManager];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __25__NTKDArgonService__init__block_invoke_164;
    v22[3] = &unk_1E62C0DF8;
    id v7 = v4;
    id v23 = v7;
    [v6 enumerateFaceBundlesOnDevice:v5 includingLegacy:1 withBlock:v22];

    __int16 v8 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __25__NTKDArgonService__init__block_invoke_2;
    v20[3] = &unk_1E62C0E20;
    id v9 = v7;
    id v21 = v9;
    [v8 enumerateKeyDescriptors:v20];
    if (![v9 count])
    {
      id v10 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __25__NTKDArgonService__init__block_invoke_161_cold_1(v10);
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    dispatch_queue_t v11 = (void *)[v9 copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(WeakRetained, "push_postNotificationForKeyDescriptor:completion:");
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
      }
      while (v13);
    }
  }
}

void __25__NTKDArgonService__init__block_invoke_164(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:](NTKArgonKeyDescriptor, "unfilteredKeyDescriptorFromBundle:");
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
}

uint64_t __25__NTKDArgonService__init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __25__NTKDArgonService__init__block_invoke_167(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [*(id *)(a1 + 32) fileName];
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "NTKDArgonService: Successful user notification for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __25__NTKDArgonService__init__block_invoke_167_cold_1();
  }
}

- (void)start
{
  id v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Argon service is starting…", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__NTKDArgonService_start__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  if (start_onceToken != -1) {
    dispatch_once(&start_onceToken, block);
  }
  [(NTKDArgonService *)self push_updatePushConnection];
  [(id)objc_opt_class() cleanUpStaleBundlesEventually];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(NTKDArgonService *)self manager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__NTKDArgonService_start__block_invoke_172;
  v7[3] = &unk_1E62BFF20;
  dispatch_semaphore_t v8 = v4;
  id v6 = v4;
  [v5 extractKnownKeyDescriptorsIfNeededWithCompletion:v7];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

void __25__NTKDArgonService_start__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.nanotimekit.facesupportserver"];
  id v3 = (void *)start_listener;
  start_listener = v2;

  [(id)start_listener setDelegate:*(void *)(a1 + 32)];
  [(id)start_listener resume];
  dispatch_semaphore_t v4 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Started XPC listener for argon service…", v5, 2u);
  }
}

intptr_t __25__NTKDArgonService_start__block_invoke_172(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)cleanUpStaleBundlesEventually
{
  if (cleanUpStaleBundlesEventually_token != -1) {
    dispatch_once(&cleanUpStaleBundlesEventually_token, &__block_literal_global_174);
  }
  id v2 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, &__block_literal_global_177);
  dispatch_async((dispatch_queue_t)cleanUpStaleBundlesEventually_fileQueue, v2);
}

void __49__NTKDArgonService_cleanUpStaleBundlesEventually__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.nanotimekit.facesupport.service.files", v2);
  uint64_t v1 = (void *)cleanUpStaleBundlesEventually_fileQueue;
  cleanUpStaleBundlesEventually_fileQueue = (uint64_t)v0;
}

void __49__NTKDArgonService_cleanUpStaleBundlesEventually__block_invoke_2()
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v28 = NTKArgonExtractorBuildVersion();
  uint64_t v0 = NTKArgonExtractorBasePath();
  uint64_t v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v38 = 0;
  uint64_t v26 = (void *)v0;
  id v2 = [v1 contentsOfDirectoryAtPath:v0 error:&v38];
  id v3 = v38;

  if (v2)
  {
    id v24 = v3;
    v27 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v25 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (!v5) {
      goto LABEL_19;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v10 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v9;
          _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Checking %@…", buf, 0xCu);
        }

        if ([v9 isEqualToString:@"ExtractionInProgress"])
        {
          uint64_t v11 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v9;
            _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Skipping scratch directory %@…", buf, 0xCu);
          }
        }
        else
        {
          if ([v9 isEqual:v28]) {
            continue;
          }
          uint64_t v11 = [v26 stringByAppendingPathComponent:v9];
          uint64_t v12 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v9;
            __int16 v42 = 2112;
            v43 = v11;
            _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "Adding stale content for %@ at %@", buf, 0x16u);
          }

          [v27 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (!v6)
      {
LABEL_19:

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v13 = [v27 copy];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v31;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
              long long v19 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v41 = v18;
                _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "Removing stale content at %@", buf, 0xCu);
              }

              v20 = [MEMORY[0x1E4F28CB8] defaultManager];
              id v29 = 0;
              char v21 = [v20 removeItemAtPath:v18 error:&v29];
              BOOL v22 = v29;

              if ((v21 & 1) == 0)
              {
                id v23 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v41 = v18;
                  __int16 v42 = 2112;
                  v43 = v22;
                  _os_log_error_impl(&dword_1BC5A9000, v23, OS_LOG_TYPE_ERROR, "Cleanup of %@ failed - %@", buf, 0x16u);
                }
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
          }
          while (v15);
        }

        id v3 = v24;
        id v2 = v25;
        goto LABEL_35;
      }
    }
  }
  v27 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    __49__NTKDArgonService_cleanUpStaleBundlesEventually__block_invoke_2_cold_1();
  }
LABEL_35:
}

- (void)requestResetOnNextLaunch:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = [(NTKDArgonService *)self userDefaults];
  [v5 setBool:1 forKey:@"ResetFaceSupportOnNextLaunch"];

  uint64_t v6 = NTKArgonExtractorBuildVersion();
  uint64_t v7 = NTKArgonExtractorBasePath();
  dispatch_semaphore_t v8 = [v7 stringByAppendingPathComponent:v6];
  int v9 = NSString;
  id v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];
  uint64_t v12 = [v9 stringWithFormat:@"reset.%@.%@", v6, v11];

  id v13 = [v7 stringByAppendingPathComponent:v12];
  uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  uint64_t v15 = [v14 moveItemAtPath:v8 toPath:v13 error:&v19];
  id v16 = v19;

  uint64_t v17 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  long long v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[NTKDArgonService requestResetOnNextLaunch:]();
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    char v21 = v8;
    __int16 v22 = 2114;
    id v23 = v13;
    __int16 v24 = 2114;
    id v25 = v16;
    _os_log_error_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_ERROR, "Reset: Failed to rename %{public}@ to %{public}@: %{public}@", buf, 0x20u);
  }

  v4[2](v4, v15);
}

- (void)knownKeyDescriptors:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v5 = (void (**)(id, void *))a3;
  uint64_t v6 = [v4 array];
  uint64_t v7 = [(NTKDArgonService *)self manager];
  dispatch_semaphore_t v8 = [v7 keyDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__NTKDArgonService_knownKeyDescriptors___block_invoke;
  v11[3] = &unk_1E62C0E20;
  id v12 = v6;
  id v9 = v6;
  [v8 enumerateKeyDescriptors:v11];

  id v10 = (void *)[v9 copy];
  v5[2](v5, v10);
}

uint64_t __40__NTKDArgonService_knownKeyDescriptors___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)requestCurrentEnvironment:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (CFPreferencesGetAppBooleanValue(@"ArgonSandbox", @"com.apple.NanoTimeKit.face", 0)) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  v4[2](v4, v3, 0);
}

- (void)setCurrentEnvironment:(int64_t)a3 completion:(id)a4
{
  id v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (a3 != 2) {
    id v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  uint64_t v5 = *v4;
  uint64_t v6 = (void (**)(id, uint64_t, void))a4;
  CFPreferencesSetAppValue(@"ArgonSandbox", v5, @"com.apple.NanoTimeKit.face");
  v6[2](v6, 1, 0);
}

- (void)argonManagerDidRefresh:(id)a3
{
  uint64_t v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Argon did refresh", v5, 2u);
  }

  id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v4 postNotificationName:@"NTKArgonManagerDidRefreshNotificationName" object:0];
}

- (void)argonManager:(id)a3 didExtractKeyDescriptor:(id)a4 toPath:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  dispatch_semaphore_t v8 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 fileName];
    *(_DWORD *)buf = 138412546;
    long long v18 = v9;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "Argon extracted descriptor %@ to path %@", buf, 0x16u);
  }
  id v10 = [v6 fileName];
  uint64_t v11 = +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke;
  v15[3] = &unk_1E62C0EA0;
  id v16 = v10;
  id v12 = v10;
  [v11 endRecordingForIdentifier:v12 status:1 errorCode:0 completion:v15];
  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"NTKArgonManagerDidUpdateNotificationName" object:0];

  uint64_t v14 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v14 postNotificationName:@"NTKArgonManagerDidUpdateNotificationName" object:0];
}

void __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke_cold_1();
    }
  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }
}

- (void)argonManager:(id)a3 failedToExtractKeyDescriptor:(id)a4 error:(id)a5
{
  id v6 = a5;
  id v7 = [a4 fileName];
  dispatch_semaphore_t v8 = +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder];
  uint64_t v9 = [v6 code];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__NTKDArgonService_argonManager_failedToExtractKeyDescriptor_error___block_invoke;
  v11[3] = &unk_1E62C0EA0;
  id v12 = v7;
  id v10 = v7;
  [v8 endRecordingForIdentifier:v10 status:3 errorCode:v9 completion:v11];
}

void __68__NTKDArgonService_argonManager_failedToExtractKeyDescriptor_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke_cold_1();
    }
  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }
}

- (void)argonManager:(id)a3 didRemoveExtractedArgonFolderAtPath:(id)a4
{
  id v4 = a4;
  uint64_t v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NTKDArgonService argonManager:didRemoveExtractedArgonFolderAtPath:]();
  }
}

void __55__NTKDArgonService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExportedObject:0];
}

- (void)ingestKeyDescriptor:(id)a3 withMethod:(unint64_t)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v8;
    __int16 v30 = 2048;
    unint64_t v31 = a4;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Ingesting key descriptor %@ with method %lu…", buf, 0x16u);
  }

  uint64_t v11 = [(NTKDArgonService *)self manager];
  id v12 = [v11 keyDatabase];
  id v27 = 0;
  int v13 = [v12 addKeyDescriptor:v8 error:&v27];
  id v14 = v27;
  uint64_t v15 = v14;
  if (v13)
  {
    id v16 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v8;
      _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, "Key was added %@", buf, 0xCu);
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke;
    v25[3] = &unk_1E62C0718;
    id v26 = v9;
    [v11 extractKnownKeyDescriptorsIfNeededWithCompletion:v25];
  }
  else
  {
    uint64_t v17 = [v14 code];
    long long v18 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17 == 1)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v8;
        _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, "Key was already added %@", buf, 0xCu);
      }
    }
    else
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412546;
        id v29 = v8;
        __int16 v30 = 2112;
        unint64_t v31 = (unint64_t)v15;
        _os_log_impl(&dword_1BC5A9000, v18, OS_LOG_TYPE_DEFAULT, "Key was NOT added %@ - %@", buf, 0x16u);
      }

      long long v18 = +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder];
      id v20 = [v8 fileName];
      uint64_t v21 = [v15 code];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke_186;
      v23[3] = &unk_1E62C0EA0;
      id v24 = v20;
      id v22 = v20;
      [v18 endRecordingForIdentifier:v22 status:4 errorCode:v21 completion:v23];
    }
    if (v9) {
      (*((void (**)(id, BOOL, void *))v9 + 2))(v9, v17 == 1, v15);
    }
  }
}

uint64_t __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke_186_cold_1();
    }
  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }
}

- (void)_setupUserNotificationCenter
{
  uint64_t v3 = (UNUserNotificationCenter *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.Bridge"];
  userNotificationCenter = self->_userNotificationCenter;
  self->_userNotificationCenter = v3;
}

- (void)_checkInForFirstQueryActivity
{
  uint64_t v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Checking in for first-run activity…", (uint8_t *)buf, 2u);
  }

  id v4 = [(NTKDArgonService *)self _criteriaForFirstQueryActivity];
  objc_initWeak(buf, self);
  uint64_t v5 = (const char *)[@"com.apple.nanotimekit.facesupport.launchQuery" UTF8String];
  id v6 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __49__NTKDArgonService__checkInForFirstQueryActivity__block_invoke;
  handler[3] = &unk_1E62C0EC8;
  id v9 = @"com.apple.nanotimekit.facesupport.launchQuery";
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v11, buf);
  xpc_activity_register(v5, v6, handler);
  objc_destroyWeak(&v11);

  objc_destroyWeak(buf);
}

void __49__NTKDArgonService__checkInForFirstQueryActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = (void *)MEMORY[0x1C1875BE0]();
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    id v9 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "Running XPC activity %{public}@", (uint8_t *)&v15, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _handleFirstQuery];
    if (!xpc_activity_set_state(v3, 5))
    {
      id v12 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __49__NTKDArgonService__checkInForFirstQueryActivity__block_invoke_cold_1();
      }
    }
  }
  else if (!state)
  {
    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v15 = 138543362;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Checking in for XPC activity %{public}@", (uint8_t *)&v15, 0xCu);
    }

    xpc_object_t v8 = xpc_activity_copy_criteria(v3);
    if (v8)
    {
    }
    else
    {
      int v13 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v14;
        _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "Updating XPC activity criteria for %{public}@", (uint8_t *)&v15, 0xCu);
      }

      xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 40));
    }
  }
}

- (void)_checkInForDailyQueryActivity
{
  uint64_t v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Checking in for first-daily activity…", (uint8_t *)buf, 2u);
  }

  id v4 = [(NTKDArgonService *)self _criteriaForDailyRefreshActiviy];
  objc_initWeak(buf, self);
  uint64_t v5 = (const char *)[@"com.apple.nanotimekit.facesupport.dailyQuery" UTF8String];
  id v6 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __49__NTKDArgonService__checkInForDailyQueryActivity__block_invoke;
  handler[3] = &unk_1E62C0EC8;
  id v9 = @"com.apple.nanotimekit.facesupport.dailyQuery";
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v11, buf);
  xpc_activity_register(v5, v6, handler);
  objc_destroyWeak(&v11);

  objc_destroyWeak(buf);
}

void __49__NTKDArgonService__checkInForDailyQueryActivity__block_invoke(id *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = (void *)MEMORY[0x1C1875BE0]();
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    id v9 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = a1[4];
      int v15 = 138543362;
      id v16 = v10;
      _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "Running XPC daily activity %{public}@", (uint8_t *)&v15, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    if ([WeakRetained _handleDailyQuery])
    {
      if (!xpc_activity_set_state(v3, 5))
      {
        id v12 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __49__NTKDArgonService__checkInForDailyQueryActivity__block_invoke_cold_1();
        }
      }
    }
    else
    {
      xpc_activity_unregister((const char *)[a1[4] UTF8String]);
    }
  }
  else if (!state)
  {
    id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = a1[4];
      int v15 = 138543362;
      id v16 = v7;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Checking in for XPC daily activity %{public}@", (uint8_t *)&v15, 0xCu);
    }

    xpc_object_t v8 = xpc_activity_copy_criteria(v3);
    if (v8)
    {
    }
    else
    {
      int v13 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = a1[4];
        int v15 = 138543362;
        id v16 = v14;
        _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "Updating XPC daily activity criteria for %{public}@", (uint8_t *)&v15, 0xCu);
      }

      xpc_activity_set_criteria(v3, a1[5]);
    }
  }
}

- (id)_baseCriteriaForArgonActivities
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14320], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14308], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14338], 1);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F141D8]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F142F0], 900);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F14260], 10240);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F141A0], *MEMORY[0x1E4F14200]);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);

  return v2;
}

- (id)_criteriaForFirstQueryActivity
{
  xpc_object_t v2 = [(NTKDArgonService *)self _baseCriteriaForArgonActivities];
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14138], 1);

  return v2;
}

- (id)_criteriaForDailyRefreshActiviy
{
  xpc_object_t v2 = [(NTKDArgonService *)self _baseCriteriaForArgonActivities];
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8] != 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14138], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14348], 1);

  return v2;
}

- (void)_handleFirstQuery
{
  uint64_t v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Performing first Argon download…", buf, 2u);
  }

  if ([(NTKDArgonService *)self _argonIsComplete])
  {
    id v4 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Skipping first Argon download - already complete!", v5, 2u);
    }
  }
  else
  {
    id v4 = [(NTKDArgonService *)self manager];
    [v4 refreshWithReason:1];
  }
}

- (BOOL)_handleDailyQuery
{
  uint64_t v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Performing periodic Argon download…", buf, 2u);
  }

  BOOL v4 = [(NTKDArgonService *)self _argonIsComplete];
  if (v4)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Skipping Argon download - it's done!", v9, 2u);
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F19A30] currentDevice];
    if ([v5 isPaired])
    {
      id v6 = [(NTKDArgonService *)self manager];
      [v6 refreshWithReason:2];
    }
    else
    {
      id v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)xpc_object_t v8 = 0;
        _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Skipping Argon download - no device paired!", v8, 2u);
      }
    }
  }
  return !v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &NTKDArgonServiceKVOContext)
  {
    [(NTKDArgonService *)self push_updatePushConnection];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)NTKDArgonService;
    -[NTKDArgonService observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_addFaceActionTappedFromNotification:(id)a3
{
}

- (void)_viewFaceActionTappedFromNotification:(id)a3
{
}

- (void)_viewWhatsNewActionTappedFromNotification:(id)a3
{
}

- (void)_recordEventOfNotification:(id)a3 action:(int64_t)a4
{
  uint64_t v6 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [MEMORY[0x1E4F19A30] currentDevice];
    objc_super v8 = +[NTKFaceBundleManager sharedManager];
    uint64_t v9 = [v8 faceBundleForBundleIdentifier:v6 onDevice:v7];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v11 = +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:v10];
      id v12 = v11;
      if (v11)
      {
        int v13 = [v11 fileName];
        id v14 = [(NTKDArgonService *)self actionRecorder];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __54__NTKDArgonService__recordEventOfNotification_action___block_invoke;
        v16[3] = &unk_1E62C0EF0;
        id v17 = v13;
        id v15 = v13;
        [v14 endPresentationForIdentifier:v15 withAction:a4 completion:v16];
      }
      else
      {
        id v14 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[NTKDArgonService _recordEventOfNotification:action:]();
        }
      }
    }
    else
    {
      uint64_t v10 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[NTKDArgonService _recordEventOfNotification:action:]();
      }
    }
  }
  else
  {
    uint64_t v7 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NTKDArgonService _recordEventOfNotification:action:]();
    }
  }
}

void __54__NTKDArgonService__recordEventOfNotification_action___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__NTKDArgonService__recordEventOfNotification_action___block_invoke_cold_1();
    }
  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Argon received a public token.", v5, 2u);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v5 = a4;
  uint64_t v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Argon recieved a push message.", buf, 2u);
  }

  uint64_t v7 = [v5 userInfo];
  objc_super v8 = [v7 objectForKey:@"d"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [NTKArgonKeyDescriptor alloc];
    uint64_t v10 = [(NTKArgonKeyDescriptor *)v9 argon_initWithJSONRepresentation:v8];

    if (v10)
    {
      id v11 = [v10 fileName];
      id v12 = +[NTKFaceSupportUnlockAttemptEventRecorder sharedRecorder];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke;
      v28[3] = &unk_1E62C0D88;
      int v13 = v11;
      id v29 = v13;
      [v12 beginRecordingForIdentifier:v13 method:1 completion:v28];

      id v14 = +[NTKFaceSupportNotificationPresentationEventRecorder sharedRecorder];
      id v15 = [v10 fileName];
      id v16 = [v7 objectForKey:@"t"];
      [v16 doubleValue];
      id v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_213;
      v26[3] = &unk_1E62C0D88;
      id v27 = v15;
      id v18 = v15;
      [v14 beginPresentationForIdentifier:v18 pushDate:v17 completion:v26];

      BOOL v19 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v10 fileName];
        *(_DWORD *)buf = 138412290;
        unint64_t v31 = v20;
        _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "Argon found a key descriptor in message named %@.", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_214;
      v23[3] = &unk_1E62C0F18;
      id v24 = v10;
      objc_copyWeak(&v25, (id *)buf);
      [(NTKDArgonService *)self ingestKeyDescriptor:v24 withMethod:1 completion:v23];
      objc_destroyWeak(&v25);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v13 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[NTKDArgonService connection:didReceiveIncomingMessage:]();
      }
    }
  }
  else
  {
    uint64_t v10 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NTKDArgonService connection:didReceiveIncomingMessage:]();
    }
  }
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_cold_1();
    }
  }
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_213(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_213_cold_1();
  }
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_214(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  id WeakRetained = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = [*(id *)(a1 + 32) fileName];
      *(_DWORD *)buf = 138412290;
      int v13 = v8;
      _os_log_impl(&dword_1BC5A9000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Argon ingested key descriptor in message named %@.", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_215;
    v10[3] = &unk_1E62C0E48;
    id v11 = v9;
    [WeakRetained push_postNotificationForKeyDescriptor:v11 completion:v10];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_214_cold_1();
  }
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_215(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  uint64_t v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = [*(id *)(a1 + 32) fileName];
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Argon displayed user notification for %@.", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_215_cold_1();
  }
}

- (void)_push_userNotification_faceBundleManagerDidUpdate:(id)a3
{
  id v4 = [(NTKDArgonService *)self userNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NTKDArgonService__push_userNotification_faceBundleManagerDidUpdate___block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __70__NTKDArgonService__push_userNotification_faceBundleManagerDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_push_userNotification_processWaitingNotifications");
}

- (void)_queue_push_userNotification_processWaitingNotifications
{
  id v2 = self;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NTKDArgonService *)self userNotificationQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(NTKDArgonService *)v2 keyDescriptorsAwaitingUserNotifications];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Checking key descriptors received via push to see if they have appeared on disk yet to permit user notifications…", buf, 2u);
    }

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_super v8 = +[NTKFaceBundleManager sharedManager];
    uint64_t v9 = [MEMORY[0x1E4F19A30] currentDevice];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke;
    v79[3] = &unk_1E62C0F40;
    v79[4] = v2;
    id v10 = v7;
    id v80 = v10;
    v47 = v8;
    v54 = (void *)v9;
    [v8 enumerateFaceBundlesOnDevice:v9 includingLegacy:1 withBlock:v79];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v11 = v10;
    uint64_t v53 = [v11 countByEnumeratingWithState:&v75 objects:v86 count:16];
    if (v53)
    {
      uint64_t v52 = *(void *)v76;
      uint64_t v48 = *MEMORY[0x1E4F28798];
      uint64_t v49 = *MEMORY[0x1E4F281F8];
      *(void *)&long long v12 = 138543618;
      long long v46 = v12;
      obuint64_t j = v11;
      v51 = v2;
      while (2)
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v76 != v52) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          id v15 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_msgSend(v14, "faceClass", v46));
          id v16 = +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:v15];
          id v17 = [(NTKDArgonService *)v2 keyDescriptorsAwaitingUserNotifications];
          id v18 = [v17 objectForKey:v16];

          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_2;
          aBlock[3] = &unk_1E62C0E48;
          id v19 = v18;
          id v74 = v19;
          id v20 = (void (**)(void *, void, id))_Block_copy(aBlock);
          uint64_t v21 = [(NTKDArgonService *)v2 keyDescriptorsAwaitingUserNotifications];
          [v21 removeObjectForKey:v16];

          uint64_t v22 = [v14 defaultFaceForDevice:v54];
          id v23 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          id v24 = v23;
          id v57 = (void *)v22;
          v58 = v19;
          if (v22)
          {
            v56 = v15;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              id v25 = [v16 fileName];
              *(_DWORD *)buf = 138543362;
              v83 = v25;
              _os_log_impl(&dword_1BC5A9000, v24, OS_LOG_TYPE_DEFAULT, "Attempting to schedule user notification for %{public}@", buf, 0xCu);
            }
            id v26 = [v16 fileName];
            id v27 = [(NTKDArgonService *)v2 userNotificationCenter];
            id v55 = [(NTKDArgonService *)v2 userDefaults];
            if ([v55 BOOLForKey:@"FaceSupportNotifications"]) {
              uint64_t v28 = 0;
            }
            else {
              uint64_t v28 = 2;
            }
            id v29 = [v27 notificationSettings];
            uint64_t v30 = v28 | ([v29 authorizationStatus] == 1);
            if (v30)
            {
              unint64_t v31 = +[NTKFaceSupportNotificationPresentationEventRecorder sharedRecorder];
              v71[0] = MEMORY[0x1E4F143A8];
              v71[1] = 3221225472;
              v71[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_227;
              v71[3] = &unk_1E62C0F68;
              id v72 = v26;
              id v32 = v26;
              [v31 endPresentationForIdentifier:v32 status:3 artworkUsed:3 errorCode:0 optOutStatus:v30 completion:v71];

              id v33 = [MEMORY[0x1E4F28C58] errorWithDomain:v49 code:3072 userInfo:&unk_1F16E87F0];

              v20[2](v20, 0, v33);
              int v34 = 1;
            }
            else
            {
              v63[0] = MEMORY[0x1E4F143A8];
              v63[1] = 3221225472;
              v63[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_236;
              v63[3] = &unk_1E62C0FB8;
              id v64 = v16;
              v65 = v14;
              id v66 = v26;
              uint64_t v70 = 0;
              v69 = v20;
              v67 = v2;
              id v68 = v27;
              id v33 = v26;
              objc_msgSend(v14, "argon_generateNotificationContentWithCompletion:", v63);

              int v34 = 0;
            }

            id v2 = v51;
            id v15 = v56;
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              long long v35 = [v16 fileName];
              [(id)objc_opt_class() identifier];
              long long v37 = v36 = v15;
              *(_DWORD *)buf = v46;
              v83 = v35;
              __int16 v84 = 2114;
              v85 = v37;
              _os_log_error_impl(&dword_1BC5A9000, v24, OS_LOG_TYPE_ERROR, "Couldn't find a face for descriptor %{public}@ - bundle %{public}@", buf, 0x16u);

              id v15 = v36;
            }

            id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:v48 code:3 userInfo:&unk_1F16E87C8];
            v20[2](v20, 0, v27);
            int v34 = 1;
          }

          if (v34)
          {
            id v11 = obj;
            id v38 = obj;
            goto LABEL_36;
          }
        }
        id v11 = obj;
        uint64_t v53 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
        if (v53) {
          continue;
        }
        break;
      }
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v38 = [(NTKDArgonService *)v2 keyDescriptorsAwaitingUserNotifications];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v59 objects:v81 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v60;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v60 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = *(void **)(*((void *)&v59 + 1) + 8 * j);
          v44 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v45 = [v43 fileName];
            *(_DWORD *)buf = 138543362;
            v83 = v45;
            _os_log_impl(&dword_1BC5A9000, v44, OS_LOG_TYPE_DEFAULT, "Key descriptor %{public}@ available for user notification, but still waiting for bundle extraction.", buf, 0xCu);
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v59 objects:v81 count:16];
      }
      while (v40);
    }
LABEL_36:
  }
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_msgSend(v7, "faceClass"));
  id v4 = +[NTKArgonKeyDescriptor unfilteredKeyDescriptorFromBundle:v3];
  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) keyDescriptorsAwaitingUserNotifications];
    uint64_t v6 = [v5 objectForKey:v4];

    if (v6) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_227_cold_1();
    }
  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_236(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  long long v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v26 = v8;
      __int16 v27 = 2114;
      id v28 = v7;
      _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Notification content prepared. Request identifier: %{public}@ - Content %{public}@", buf, 0x16u);
    }

    long long v12 = *(void **)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = [*(id *)(a1 + 32) fileName];
    uint64_t v15 = *(void *)(a1 + 40);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_238;
    v21[3] = &unk_1E62C0F90;
    id v22 = *(id *)(a1 + 72);
    objc_msgSend(v12, "_push_sendNotificationForContent:requestIdentifier:toNotificationCenter:identifier:bundle:completion:", v7, v8, v13, v14, v15, v21);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_236_cold_1();
    }

    uint64_t v16 = objc_msgSend(0, "argon_artworkUsed");
    id v17 = +[NTKFaceSupportNotificationPresentationEventRecorder sharedRecorder];
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = [v9 code];
    uint64_t v20 = *(void *)(a1 + 80);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_237;
    v23[3] = &unk_1E62C0F68;
    id v24 = *(id *)(a1 + 48);
    [v17 endPresentationForIdentifier:v18 status:4 artworkUsed:v16 errorCode:v19 optOutStatus:v20 completion:v23];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_237(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_227_cold_1();
    }
  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }
}

uint64_t __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_238(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)push_postNotificationForKeyDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NTKDArgonService *)self userNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__NTKDArgonService_push_postNotificationForKeyDescriptor_completion___block_invoke;
  block[3] = &unk_1E62C0FE0;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __69__NTKDArgonService_push_postNotificationForKeyDescriptor_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4FB1438] isRunningInStoreDemoMode];
  uint64_t v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) fileName];
      int v15 = 138543362;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Skipping user notification for %{public}@ - store demo mode", (uint8_t *)&v15, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:&unk_1F16E8818];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    if (v4)
    {
      id v8 = [*(id *)(a1 + 32) fileName];
      int v15 = 138543362;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Will attempt user notification for %{public}@ shortly", (uint8_t *)&v15, 0xCu);
    }
    id v9 = [*(id *)(a1 + 40) keyDescriptorsAwaitingUserNotifications];
    id v7 = [v9 objectForKey:*(void *)(a1 + 32)];

    if (!v7)
    {
      id v10 = [*(id *)(a1 + 40) keyDescriptorsAwaitingUserNotifications];
      long long v11 = [MEMORY[0x1E4F1CA48] array];
      [v10 setObject:v11 forKey:*(void *)(a1 + 32)];
    }
    id v12 = [*(id *)(a1 + 40) keyDescriptorsAwaitingUserNotifications];
    uint64_t v13 = [v12 objectForKey:*(void *)(a1 + 32)];
    id v14 = _Block_copy(*(const void **)(a1 + 48));
    [v13 addObject:v14];

    objc_msgSend(*(id *)(a1 + 40), "_queue_push_userNotification_processWaitingNotifications");
  }
}

- (void)push_updatePushConnection
{
  v25[1] = *MEMORY[0x1E4F143B8];
  int v2 = self;
  objc_sync_enter(v2);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NTKDArgonService_push_updatePushConnection__block_invoke;
  block[3] = &unk_1E62BFF20;
  void block[4] = v2;
  if (push_updatePushConnection_onceToken != -1) {
    dispatch_once(&push_updatePushConnection_onceToken, block);
  }
  uint64_t v3 = [(NTKDArgonService *)v2 pushQueue];
  if (!v3)
  {
    BOOL v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v3 = dispatch_queue_create("com.apple.nanotimekit.facesupport.service.push", v4);

    [(NTKDArgonService *)v2 setPushQueue:v3];
  }
  id v5 = [(NTKDArgonService *)v2 pushConnection];
  if (!v5)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ArgonSandbox", @"com.apple.NanoTimeKit.face", 0);
    id v7 = (id *)MEMORY[0x1E4F4E1D0];
    if (AppBooleanValue) {
      id v7 = (id *)MEMORY[0x1E4F4E1C8];
    }
    id v8 = *v7;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4E1E8]) initWithEnvironmentName:v8 namedDelegatePort:@"com.apple.aps.nanotimekit.facesupport" queue:v3];
    [v5 setDelegate:v2];
    [(NTKDArgonService *)v2 setPushConnection:v5];
  }
  id v9 = +[NTKArgonChannelID currentChannelID];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F39AA8]) initWithChannelID:v9];
  v25[0] = @"com.apple.aps.nanotimekit.facesupport";
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v5 setEnabledTopics:v11 ignoredTopics:MEMORY[0x1E4F1CBF0]];

  id v12 = [MEMORY[0x1E4F19A30] currentDevice];
  if ([v12 isPaired])
  {
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F405E6BC-C306-4B65-B1D7-439AB5A152CC"];
    int v14 = [v12 supportsCapability:v13];
  }
  else
  {
    int v14 = 0;
  }
  int v15 = [(NTKDArgonService *)v2 userDefaults];
  char v16 = [v15 BOOLForKey:@"FaceSupportNotifications"];
  if (v14)
  {
    [v5 subscribeToChannel:v10 forTopic:@"com.apple.aps.nanotimekit.facesupport"];
    uint64_t v17 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = @"com.apple.aps.nanotimekit.facesupport";
      __int16 v23 = 2114;
      id v24 = v10;
      uint64_t v18 = "Started push listener for Argon service on topic %{public}@ and channel %{public}@…";
LABEL_20:
      _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
    }
  }
  else
  {
    char v19 = v16;
    [v5 unsubscribeFromChannel:v10 forTopic:@"com.apple.aps.nanotimekit.facesupport"];
    if (v19)
    {
      uint64_t v17 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v22 = @"com.apple.aps.nanotimekit.facesupport";
        __int16 v23 = 2114;
        id v24 = v10;
        uint64_t v18 = "Pausing push listener for Argon service on topic %{public}@ and channel %{public}@ - unpaired";
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v17 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v22 = @"com.apple.aps.nanotimekit.facesupport";
        __int16 v23 = 2114;
        id v24 = v10;
        uint64_t v18 = "Pausing push listener for Argon service on topic %{public}@ and channel %{public}@ - opt out";
        goto LABEL_20;
      }
    }
  }

  objc_sync_exit(v2);
}

void __45__NTKDArgonService_push_updatePushConnection__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_push_deviceChanged_ name:*MEMORY[0x1E4F19620] object:0];
}

- (void)_push_sendNotificationForContent:(id)a3 requestIdentifier:(id)a4 toNotificationCenter:(id)a5 identifier:(id)a6 bundle:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  char v19 = (void *)[a3 mutableCopy];
  uint64_t v20 = [(id)objc_opt_class() identifier];
  uint64_t v21 = [v19 userInfo];
  id v22 = v21;
  if (!v21) {
    uint64_t v21 = (void *)MEMORY[0x1E4F1CC08];
  }
  __int16 v23 = (void *)[v21 mutableCopy];

  [v23 setObject:v20 forKey:@"bid"];
  id v24 = objc_opt_class();

  uint64_t v25 = objc_msgSend(v24, "argon_defaultNotificationAction");
  if (v25)
  {
    if (v25 != 1) {
      goto LABEL_8;
    }
    id v26 = @"whatsnew";
  }
  else
  {
    id v26 = @"detail";
  }
  [v23 setObject:v26 forKey:@"defaultaction"];
LABEL_8:
  __int16 v27 = (void *)[v23 copy];
  [v19 setUserInfo:v27];

  id v28 = [MEMORY[0x1E4F44670] triggerWithTimeInterval:0 repeats:1.0];
  if (!v14)
  {
    uint64_t v29 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[NTKDArgonService _push_sendNotificationForContent:requestIdentifier:toNotificationCenter:identifier:bundle:completion:](v29);
    }

    uint64_t v30 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [v30 UUIDString];
  }
  unint64_t v31 = [MEMORY[0x1E4F44628] requestWithIdentifier:v14 content:v19 trigger:v28];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke;
  v35[3] = &unk_1E62C1008;
  id v36 = v15;
  id v37 = v19;
  id v38 = self;
  id v39 = v16;
  id v32 = v16;
  id v33 = v19;
  id v34 = v15;
  [v18 addNotificationRequest:v31 withCompletionHandler:v35];
}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = v6;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Scheduled user notification for %@", buf, 0xCu);
  }
  uint64_t v29 = v3;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v28 = a1;
  id v7 = [*(id *)(a1 + 40) attachments];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) URL];
        id v35 = 0;
        char v13 = NTKMarkFileAtURLAsPurgeable(v12, &v35);
        id v14 = v35;
        if ((v13 & 1) == 0)
        {
          id v15 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v41 = v12;
            __int16 v42 = 2112;
            id v43 = v14;
            _os_log_error_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_ERROR, "Couldn't cache delete mark file at %@ - %@", buf, 0x16u);
          }
        }
        id v16 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v34 = 0;
        char v17 = [v16 removeItemAtURL:v12 error:&v34];
        id v18 = v34;

        if ((v17 & 1) == 0)
        {
          char v19 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v41 = v12;
            __int16 v42 = 2112;
            id v43 = v18;
            _os_log_error_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_ERROR, "Couldn't remove file at %@ - %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v9);
  }

  if (v29) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 1;
  }
  uint64_t v21 = objc_msgSend(*(id *)(v28 + 40), "argon_artworkUsed");
  id v22 = +[NTKFaceSupportNotificationPresentationEventRecorder sharedRecorder];
  uint64_t v23 = *(void *)(v28 + 32);
  uint64_t v24 = [v29 code];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_271;
  v32[3] = &unk_1E62C0F68;
  id v33 = *(id *)(v28 + 32);
  [v22 endPresentationForIdentifier:v23 status:v20 artworkUsed:v21 errorCode:v24 optOutStatus:0 completion:v32];

  uint64_t v25 = [*(id *)(v28 + 48) actionRecorder];
  id v26 = *(void **)(v28 + 32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_272;
  v30[3] = &unk_1E62C0D88;
  id v31 = v26;
  [v25 beginPresentationForIdentifier:v31 completion:v30];

  uint64_t v27 = *(void *)(v28 + 56);
  if (v27) {
    (*(void (**)(uint64_t, BOOL, void *))(v27 + 16))(v27, v29 == 0, v29);
  }
}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_271(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_227_cold_1();
    }
  }
  else
  {
    NTKSubmitFaceSupportMessage(a2);
  }
}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_272(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_272_cold_1();
  }
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (APSConnection)pushConnection
{
  return self->_pushConnection;
}

- (void)setPushConnection:(id)a3
{
}

- (OS_dispatch_queue)pushQueue
{
  return self->_pushQueue;
}

- (void)setPushQueue:(id)a3
{
}

- (OS_dispatch_queue)userNotificationQueue
{
  return self->_userNotificationQueue;
}

- (void)setUserNotificationQueue:(id)a3
{
}

- (NSMutableDictionary)keyDescriptorsAwaitingUserNotifications
{
  return self->_keyDescriptorsAwaitingUserNotifications;
}

- (void)setKeyDescriptorsAwaitingUserNotifications:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (int)pushToken
{
  return self->_pushToken;
}

- (NTKFaceSupportNotificationActionEventRecorder)actionRecorder
{
  return self->_actionRecorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionRecorder, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_keyDescriptorsAwaitingUserNotifications, 0);
  objc_storeStrong((id *)&self->_userNotificationQueue, 0);
  objc_storeStrong((id *)&self->_pushQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

void __25__NTKDArgonService__init__block_invoke_161_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_DEBUG, "NTKDArgonService: New bundles not found. It won't post notification", v1, 2u);
}

void __25__NTKDArgonService__init__block_invoke_167_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v1 = [*(id *)(v0 + 32) fileName];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "NTKDArgonService: Failed to display user notification for %@: %@", v4, v5, v6, v7, v8);
}

void __49__NTKDArgonService_cleanUpStaleBundlesEventually__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't get paths of directory %@ to remove: %@");
}

- (void)requestResetOnNextLaunch:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1BC5A9000, v1, OS_LOG_TYPE_DEBUG, "Reset: Renamed %{public}@ to %{public}@ to trigger stale content removal on next launch", v2, 0x16u);
}

void __64__NTKDArgonService_argonManager_didExtractKeyDescriptor_toPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Failed to record success for %@ - %@");
}

- (void)argonManager:didRemoveExtractedArgonFolderAtPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Argon removed folder at path %@", v2, v3, v4, v5, v6);
}

void __62__NTKDArgonService_ingestKeyDescriptor_withMethod_completion___block_invoke_186_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Event failure for %@ - %@");
}

void __49__NTKDArgonService__checkInForFirstQueryActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Failed to finish XPC activity %{public}@", v2, v3, v4, v5, 2u);
}

void __49__NTKDArgonService__checkInForDailyQueryActivity__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Failed to finish XPC daily activity %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_argonIsComplete
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Cannot determine complete-ness at path %@: %@");
}

- (void)_recordEventOfNotification:action:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Face Action %lu Notification bundle is nil for identifier %@");
}

- (void)_recordEventOfNotification:action:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Face Action %lu Notification key descriptor is nil for identifier %@");
}

- (void)_recordEventOfNotification:action:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Face Action %lu Notification object %@ is not a string");
}

void __54__NTKDArgonService__recordEventOfNotification_action___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Face action not made for %@ - %@");
}

- (void)connection:didReceiveIncomingMessage:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Argon missing key descriptor in payload %@.", v2, v3, v4, v5, v6);
}

- (void)connection:didReceiveIncomingMessage:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1BC5A9000, v0, v1, "Argon missing descriptor JSON in payload %@.", v2, v3, v4, v5, v6);
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't record push event for %@ - %@");
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_213_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't record presentation event for %@ - %@");
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_214_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [*(id *)(v0 + 32) fileName];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "Argon failed to ingest key descriptor in message named %@ - %@", v4, v5, v6, v7, v8);
}

void __57__NTKDArgonService_connection_didReceiveIncomingMessage___block_invoke_215_cold_1()
{
  OUTLINED_FUNCTION_9();
  os_log_t v1 = [*(id *)(v0 + 32) fileName];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "Argon failed to display user notification for %@: %@.", v4, v5, v6, v7, v8);
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_227_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't record end presentation for %@ - %@");
}

void __76__NTKDArgonService__queue_push_userNotification_processWaitingNotifications__block_invoke_236_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(v2 + 32) fileName];
  OUTLINED_FUNCTION_0();
  __int16 v6 = 2114;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1BC5A9000, v0, OS_LOG_TYPE_ERROR, "No notification found for key %{public}@ and matching bundle %{public}@ - %{public}@", v5, 0x20u);
}

- (void)_push_sendNotificationForContent:(os_log_t)log requestIdentifier:toNotificationCenter:identifier:bundle:completion:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Request identifier is nil. Generating random identifier.", v1, 2u);
}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't schedule user notification for %@ - %@");
}

void __121__NTKDArgonService__push_sendNotificationForContent_requestIdentifier_toNotificationCenter_identifier_bundle_completion___block_invoke_272_cold_1()
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Couldn't record begin action for %@ - %@");
}

@end