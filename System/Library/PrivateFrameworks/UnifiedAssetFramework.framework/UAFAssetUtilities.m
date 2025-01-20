@interface UAFAssetUtilities
- (BOOL)_networkIsExpensiveForPath:(id)a3;
- (BOOL)_networkIsSatisfiedForPath:(id)a3;
- (BOOL)assistantEnabled;
- (BOOL)autoRetryEnabled;
- (BOOL)hasSufficientDiskSpaceForClient:(unint64_t)a3;
- (BOOL)hasSufficientDiskSpaceForDownload;
- (BOOL)networkExpensive;
- (BOOL)networkSatisfied;
- (BOOL)showHybridAsUnsupported;
- (BOOL)understandingOnDeviceAssetsAvailable;
- (NSDictionary)assistantUODStatus;
- (NSString)siriLanguage;
- (OS_dispatch_group)assistantGroup;
- (OS_dispatch_queue)assistantQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)downloadQueue;
- (OS_dispatch_queue)statusQueue;
- (UAFAssetStatus)assetStatus;
- (UAFAssetUtilities)init;
- (UAFAssetUtilitiesDelegate)delegate;
- (UAFRetryState)retryState;
- (double)assetAvailableCheckTimeout;
- (double)autoRetryDelayOnFailure;
- (double)autoRetryDelayOnFailureIncrement;
- (double)autoRetryDelayOnSettingsChanged;
- (id)_createConnection;
- (id)currentAssetStatus;
- (id)getAssistantLanguageIfAvailableSync;
- (id)getDiskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4;
- (unint64_t)_checkFreeSpaceNeededForLanguage:(id)a3 forClient:(unint64_t)a4;
- (unsigned)autoRetryLimit;
- (void)_assistantLanguageUpdate;
- (void)_assistantPreferencesUpdate;
- (void)_downloadSiriAssetsOverCellular:(BOOL)a3;
- (void)_downloadSiriAssetsRetry;
- (void)_downloadSiriAssetsWithDelay:(double)a3;
- (void)_handleNetworkPathUpdate:(id)a3;
- (void)_stopObservers;
- (void)_triggerDelegateAssetStatusUpdated;
- (void)_updateDelegateForUODAvailable:(BOOL)a3 uodStatus:(id)a4;
- (void)assetsAreAvailableForLanguage:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)downloadSiriAssets;
- (void)downloadSiriAssetsIfNeeded;
- (void)downloadSiriAssetsOverCellular;
- (void)refreshUAFAssetStatusAsync;
- (void)refreshUnderstandingOnDeviceAssetsAvailableAsync;
- (void)setAssetAvailableCheckTimeout:(double)a3;
- (void)setAssetStatus:(id)a3;
- (void)setAssistantEnabled:(BOOL)a3;
- (void)setAssistantGroup:(id)a3;
- (void)setAssistantQueue:(id)a3;
- (void)setAssistantUODStatus:(id)a3;
- (void)setAutoRetryDelayOnFailure:(double)a3;
- (void)setAutoRetryDelayOnFailureIncrement:(double)a3;
- (void)setAutoRetryDelayOnSettingsChanged:(double)a3;
- (void)setAutoRetryEnabled:(BOOL)a3;
- (void)setAutoRetryLimit:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setNetworkExpensive:(BOOL)a3;
- (void)setNetworkSatisfied:(BOOL)a3;
- (void)setRetryState:(id)a3;
- (void)setShowHybridAsUnsupported:(BOOL)a3;
- (void)setSiriLanguage:(id)a3;
- (void)setStatusQueue:(id)a3;
- (void)setUnderstandingOnDeviceAssetsAvailable:(BOOL)a3;
- (void)startObservers;
- (void)startObserversWithOptions:(unint64_t)a3;
@end

@implementation UAFAssetUtilities

- (UAFAssetUtilities)init
{
  v19.receiver = self;
  v19.super_class = (Class)UAFAssetUtilities;
  v2 = [(UAFAssetUtilities *)&v19 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.UAF.AssetUtilities.DownloadQueue", v3);
    v5 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.UAF.AssetUtilities.StatusQueue", v6);
    v8 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.UAF.AssetUtilities.DelegateQueue", v9);
    v11 = (void *)*((void *)v2 + 16);
    *((void *)v2 + 16) = v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.UAF.AssetUtilities.AssistantQueue", v12);
    v14 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v13;

    dispatch_group_t v15 = dispatch_group_create();
    v16 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v15;

    v17 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = 0;

    *((_DWORD *)v2 + 8) = 3;
    *(_OWORD *)(v2 + 72) = xmmword_2379E2060;
    *(_OWORD *)(v2 + 56) = xmmword_2379E2070;
    v2[29] = 1;
  }
  return (UAFAssetUtilities *)v2;
}

- (void)dealloc
{
  [(UAFAssetUtilities *)self _stopObservers];
  v3.receiver = self;
  v3.super_class = (Class)UAFAssetUtilities;
  [(UAFAssetUtilities *)&v3 dealloc];
}

- (void)startObservers
{
}

- (void)startObserversWithOptions:(unint64_t)a3
{
  v5 = [(UAFAssetUtilities *)self assistantGroup];
  v6 = [(UAFAssetUtilities *)self assistantQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__UAFAssetUtilities_startObserversWithOptions___block_invoke;
  v7[3] = &unk_264CEAB28;
  v7[4] = self;
  v7[5] = a3;
  dispatch_group_async(v5, v6, v7);
}

void __47__UAFAssetUtilities_startObserversWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke";
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s #settings Start observers", buf, 0xCu);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 16);
  if ((v4 & 4) == 0 && (*(unsigned char *)(a1 + 40) & 4) != 0)
  {
    v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke";
      _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings Start preferences observer", buf, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    dispatch_queue_t v7 = *(const void **)(a1 + 32);
    getkAFPreferencesDidChangeDarwinNotification();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_AFPreferencesDidChangeCallback, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    [*(id *)(a1 + 32) _assistantPreferencesUpdate];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 16);
  }
  if ((v4 & 2) == 0 && (*(unsigned char *)(a1 + 40) & 2) != 0)
  {
    v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke";
      _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings Start language observer", buf, 0xCu);
    }

    dispatch_queue_t v10 = CFNotificationCenterGetDarwinNotifyCenter();
    v11 = *(const void **)(a1 + 32);
    getAFLanguageCodeDidChangeDarwinNotification();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v10, v11, (CFNotificationCallback)_AFLanguageDidChangeCallback, v12, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    [*(id *)(a1 + 32) _assistantLanguageUpdate];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 16);
  }
  if (v4 & 1) == 0 && (*(unsigned char *)(a1 + 40))
  {
    dispatch_queue_t v13 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke";
      _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s #settings Start UOD observer", buf, 0xCu);
    }

    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    dispatch_group_t v15 = *(const void **)(a1 + 32);
    getAFSiriXAssetDidChangeDarwinNotification();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v14, v15, (CFNotificationCallback)_SiriXAssetDidChangeCallback, v16, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    [*(id *)(a1 + 32) refreshUnderstandingOnDeviceAssetsAvailableAsync];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 16);
  }
  if ((v4 & 8) == 0 && (*(unsigned char *)(a1 + 40) & 8) != 0)
  {
    v17 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke";
      _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s #settings Start network observer", buf, 0xCu);
    }

    uint64_t default_evaluator = nw_path_create_default_evaluator();
    uint64_t v19 = *(void *)(a1 + 32);
    v20 = *(void **)(v19 + 8);
    *(void *)(v19 + 8) = default_evaluator;

    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 8))
    {
      v21 = (void *)nw_path_evaluator_copy_path();
      uint64_t v22 = a1 + 32;
      *(unsigned char *)(*(void *)v22 + 27) = [*(id *)(a1 + 32) _networkIsSatisfiedForPath:v21];
      *(unsigned char *)(*(void *)v22 + 28) = [*(id *)(a1 + 32) _networkIsExpensiveForPath:v21];
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v23 = [*(id *)(a1 + 32) statusQueue];
      objc_copyWeak(&v27, (id *)buf);
      nw_path_evaluator_set_update_handler();

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);

      uint64_t v3 = *(void *)(a1 + 32);
    }
  }
  uint64_t v24 = *(void *)(v3 + 16);
  if ((v24 & 0x10) == 0 && (*(unsigned char *)(a1 + 40) & 0x10) != 0)
  {
    v25 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[UAFAssetUtilities startObserversWithOptions:]_block_invoke_2";
      _os_log_impl(&dword_23797A000, v25, OS_LOG_TYPE_DEFAULT, "%s #settings Start UAFAssetStatus observer", buf, 0xCu);
    }

    v26 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v26, *(const void **)(a1 + 32), (CFNotificationCallback)_UAFAssetStatusDidChangeCallback, @"kUAFAssetStatusDidChangeDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [*(id *)(a1 + 32) refreshUAFAssetStatusAsync];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(v3 + 16);
  }
  *(void *)(v3 + 16) = *(void *)(a1 + 40) | v24;
}

void __47__UAFAssetUtilities_startObserversWithOptions___block_invoke_277(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleNetworkPathUpdate:v5];
  }
}

- (void)_stopObservers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    v14 = "-[UAFAssetUtilities _stopObservers]";
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s #settings Stop observers", (uint8_t *)&v13, 0xCu);
  }

  if (self->_pathEvaluator)
  {
    nw_path_evaluator_cancel();
    pathEvaluator = self->_pathEvaluator;
    self->_pathEvaluator = 0;
  }
  unint64_t observerOptions = self->_observerOptions;
  if ((observerOptions & 2) != 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getAFLanguageCodeDidChangeDarwinNotification();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v8, 0);

    unint64_t observerOptions = self->_observerOptions;
    if ((observerOptions & 4) == 0)
    {
LABEL_7:
      if ((observerOptions & 1) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      v11 = CFNotificationCenterGetDarwinNotifyCenter();
      getAFSiriXAssetDidChangeDarwinNotification();
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFNotificationCenterRemoveObserver(v11, self, v12, 0);

      if ((self->_observerOptions & 0x10) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((observerOptions & 4) == 0)
  {
    goto LABEL_7;
  }
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  getkAFPreferencesDidChangeDarwinNotification();
  dispatch_queue_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v9, self, v10, 0);

  unint64_t observerOptions = self->_observerOptions;
  if (observerOptions) {
    goto LABEL_13;
  }
LABEL_8:
  if ((observerOptions & 0x10) != 0)
  {
LABEL_9:
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v6, self, @"kUAFAssetStatusDidChangeDarwinNotification", 0);
  }
LABEL_10:
  self->_unint64_t observerOptions = 0;
}

- (id)_createConnection
{
  v2 = objc_alloc_init(UAFXPCConnection);

  return v2;
}

- (void)refreshUnderstandingOnDeviceAssetsAvailableAsync
{
  uint64_t v3 = [(UAFAssetUtilities *)self assistantGroup];
  uint64_t v4 = [(UAFAssetUtilities *)self assistantQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UAFAssetUtilities_refreshUnderstandingOnDeviceAssetsAvailableAsync__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_group_async(v3, v4, block);
}

void __69__UAFAssetUtilities_refreshUnderstandingOnDeviceAssetsAvailableAsync__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) getAssistantLanguageIfAvailableSync];
  [*(id *)(a1 + 32) assetsAreAvailableForLanguage:v2 completion:0];
}

- (void)assetsAreAvailableForLanguage:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    BOOL v8 = +[UAFCommonUtilities deviceSupportFullUOD];
    BOOL v9 = +[UAFCommonUtilities deviceSupportAndUseHybridASR];
    if (v8 || v9)
    {
      v17 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
      id location = 0;
      p_id location = &location;
      uint64_t v33 = 0x2050000000;
      id v18 = (id)getAFSettingsConnectionClass_softClass;
      uint64_t v34 = getAFSettingsConnectionClass_softClass;
      if (!getAFSettingsConnectionClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getAFSettingsConnectionClass_block_invoke;
        v40 = &unk_264CEAD58;
        v41 = &location;
        __getAFSettingsConnectionClass_block_invoke((uint64_t)buf);
        id v18 = p_location[3];
      }
      uint64_t v19 = (objc_class *)v18;
      _Block_object_dispose(&location, 8);
      id v20 = objc_alloc_init(v19);
      objc_initWeak(&location, self);
      v21 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[UAFAssetUtilities assetsAreAvailableForLanguage:completion:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_23797A000, v21, OS_LOG_TYPE_DEFAULT, "%s #settings UOD check for language %{public}@", buf, 0x16u);
      }

      uint64_t v22 = [(UAFAssetUtilities *)self assistantGroup];
      dispatch_group_enter(v22);

      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __62__UAFAssetUtilities_assetsAreAvailableForLanguage_completion___block_invoke;
      v24[3] = &unk_264CEAB78;
      id v23 = v20;
      id v25 = v23;
      objc_copyWeak(&v29, &location);
      id v28 = v7;
      v26 = self;
      BOOL v30 = v8;
      id v13 = v17;
      id v27 = v13;
      [v23 getAssetStatusForLanguage:v13 completionHandler:v24];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      dispatch_queue_t v10 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[UAFAssetUtilities assetsAreAvailableForLanguage:completion:]";
        _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s #settings Assets not available due to no UOD support. Return NO.", buf, 0xCu);
      }

      [(UAFAssetUtilities *)self _updateDelegateForUODAvailable:0 uodStatus:0];
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v35 = *MEMORY[0x263F08320];
      v36 = @"UOD not supported";
      v12 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v13 = [v11 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:5000 userInfo:v12];

      if (v7) {
        (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
      }
    }
  }
  else
  {
    v14 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[UAFAssetUtilities assetsAreAvailableForLanguage:completion:]";
      _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assets availability due to nil language. Return NO", buf, 0xCu);
    }

    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v37 = *MEMORY[0x263F08320];
    v38 = @"nil language";
    v16 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v13 = [v15 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:5000 userInfo:v16];

    if (v7) {
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v13);
    }
  }
}

void __62__UAFAssetUtilities_assetsAreAvailableForLanguage_completion___block_invoke(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 72)) {
      BOOL v7 = +[UAFCommonUtilities isFullUODSupportedForStatus:v3 language:v6];
    }
    else {
      BOOL v7 = +[UAFCommonUtilities isHybridUODSupportedForStatus:v3 language:v6];
    }
    BOOL v13 = v7;
    uint64_t v14 = *(void *)(a1 + 56);
    if (v14) {
      (*(void (**)(uint64_t, BOOL, void))(v14 + 16))(v14, v13, 0);
    }
    [WeakRetained _updateDelegateForUODAvailable:v13 uodStatus:v3];
    uint64_t v15 = [*(id *)(a1 + 40) assistantGroup];
    dispatch_group_leave(v15);
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = @"self is nil";
    BOOL v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    dispatch_queue_t v10 = [v8 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:5000 userInfo:v9];

    uint64_t v11 = *(void *)(a1 + 56);
    if (v11) {
      (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v10);
    }
    v12 = [*(id *)(a1 + 40) assistantGroup];
    dispatch_group_leave(v12);
  }
}

- (void)_updateDelegateForUODAvailable:(BOOL)a3 uodStatus:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(UAFAssetUtilities *)self assistantGroup];
  BOOL v8 = [(UAFAssetUtilities *)self statusQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke;
  block[3] = &unk_264CEABC8;
  block[4] = self;
  id v11 = v6;
  BOOL v12 = a3;
  id v9 = v6;
  dispatch_group_async(v7, v8, block);
}

void __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setAssistantUODStatus:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke_2;
  block[3] = &unk_264CEAB50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);

  int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 26);
  id v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    BOOL v12 = "-[UAFAssetUtilities _updateDelegateForUODAvailable:uodStatus:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = v5;
    __int16 v15 = 1024;
    int v16 = v3;
    _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings UOD check available:%d prev:%d", buf, 0x18u);
  }

  int v6 = *(unsigned __int8 *)(a1 + 48);
  if (v3 != v6)
  {
    [*(id *)(a1 + 32) setUnderstandingOnDeviceAssetsAvailable:v6 != 0];
    BOOL v7 = [*(id *)(a1 + 32) delegateQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke_302;
    v8[3] = &unk_264CEABA0;
    v8[4] = *(void *)(a1 + 32);
    char v9 = *(unsigned char *)(a1 + 48);
    dispatch_async(v7, v8);
  }
}

void __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 siriUODStatusDidChange];
  }
}

void __62__UAFAssetUtilities__updateDelegateForUODAvailable_uodStatus___block_invoke_302(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 40);
      int v7 = 136315394;
      BOOL v8 = "-[UAFAssetUtilities _updateDelegateForUODAvailable:uodStatus:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = v5;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings siriUODAvailabilityDidChange delegate available:%d", (uint8_t *)&v7, 0x12u);
    }

    int v6 = [*(id *)(a1 + 32) delegate];
    [v6 siriUODAvailabilityDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (NSDictionary)assistantUODStatus
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v3 = [(UAFAssetUtilities *)self assistantGroup];
  [(UAFAssetUtilities *)self assetAvailableCheckTimeout];
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  intptr_t v6 = dispatch_group_wait(v3, v5);

  if (v6)
  {
    int v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[UAFAssetUtilities assistantUODStatus]";
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assistant UOD status due to timeout", (uint8_t *)&buf, 0xCu);
    }
  }
  BOOL v8 = [(UAFAssetUtilities *)self statusQueue];
  dispatch_assert_queue_not_V2(v8);

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy_;
  int v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  __int16 v9 = [(UAFAssetUtilities *)self statusQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__UAFAssetUtilities_assistantUODStatus__block_invoke;
  v12[3] = &unk_264CEABF0;
  v12[4] = self;
  v12[5] = &buf;
  dispatch_sync(v9, v12);

  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return (NSDictionary *)v10;
}

void __39__UAFAssetUtilities_assistantUODStatus__block_invoke(uint64_t a1)
{
}

- (BOOL)understandingOnDeviceAssetsAvailable
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!self->_understandingOnDeviceAssetsAvailable)
  {
    char v3 = [(UAFAssetUtilities *)self assistantGroup];
    [(UAFAssetUtilities *)self assetAvailableCheckTimeout];
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    intptr_t v6 = dispatch_group_wait(v3, v5);

    if (v6)
    {
      int v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v16) = 136315138;
        *(void *)((char *)&v16 + 4) = "-[UAFAssetUtilities understandingOnDeviceAssetsAvailable]";
        _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assistant UOD availability due to timeout", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  BOOL v8 = [(UAFAssetUtilities *)self statusQueue];
  dispatch_assert_queue_not_V2(v8);

  *(void *)&long long v16 = 0;
  *((void *)&v16 + 1) = &v16;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  __int16 v9 = [(UAFAssetUtilities *)self statusQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__UAFAssetUtilities_understandingOnDeviceAssetsAvailable__block_invoke;
  v13[3] = &unk_264CEABF0;
  v13[4] = self;
  v13[5] = &v16;
  dispatch_sync(v9, v13);

  if (*(unsigned char *)(*((void *)&v16 + 1) + 24))
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v15 = "-[UAFAssetUtilities understandingOnDeviceAssetsAvailable]";
      _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s #settings NO returned for UOD", buf, 0xCu);
    }

    BOOL v10 = *(unsigned char *)(*((void *)&v16 + 1) + 24) != 0;
  }
  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __57__UAFAssetUtilities_understandingOnDeviceAssetsAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 26);
  return result;
}

- (void)refreshUAFAssetStatusAsync
{
  char v3 = [(UAFAssetUtilities *)self assistantQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UAFAssetUtilities_refreshUAFAssetStatusAsync__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__UAFAssetUtilities_refreshUAFAssetStatusAsync__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _createConnection];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__UAFAssetUtilities_refreshUAFAssetStatusAsync__block_invoke_2;
  v4[3] = &unk_264CEAC40;
  objc_copyWeak(&v6, &location);
  id v3 = v2;
  id v5 = v3;
  [v3 checkAssetStatus:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__UAFAssetUtilities_refreshUAFAssetStatusAsync__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      __int16 v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        char v18 = "-[UAFAssetUtilities refreshUAFAssetStatusAsync]_block_invoke";
        __int16 v19 = 2112;
        id v20 = v6;
        _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s #settings checkAssetStatus error: %@", buf, 0x16u);
      }
    }
    else if (v5)
    {
      BOOL v10 = [WeakRetained statusQueue];
      uint64_t v11 = MEMORY[0x263EF8330];
      uint64_t v12 = 3221225472;
      __int16 v13 = __47__UAFAssetUtilities_refreshUAFAssetStatusAsync__block_invoke_3;
      uint64_t v14 = &unk_264CEAC18;
      __int16 v15 = v8;
      id v16 = v5;
      dispatch_async(v10, &v11);
    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate", v11, v12, v13, v14, v15);
  }
}

void __47__UAFAssetUtilities_refreshUAFAssetStatusAsync__block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)nw_path_evaluator_copy_path();
  if (![*(id *)(a1 + 40) state]
    && ([*(id *)(a1 + 32) _networkIsExpensiveForPath:v2] & 1) == 0)
  {
    id v3 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      __int16 v9 = "-[UAFAssetUtilities refreshUAFAssetStatusAsync]_block_invoke_3";
      _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s #settings Forcing unknown server state to not started until WiFi gets enabled", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 40) setState:2];
  }
  [*(id *)(a1 + 32) setAssetStatus:*(void *)(a1 + 40)];
  double v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", [*(id *)(a1 + 40) state]);
    id v6 = [*(id *)(a1 + 40) value];
    int v7 = [v6 unsignedIntegerValue];
    int v8 = 136315650;
    __int16 v9 = "-[UAFAssetUtilities refreshUAFAssetStatusAsync]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Refresh server side asset state %@ with value %d", (uint8_t *)&v8, 0x1Cu);
  }
  [*(id *)(a1 + 32) _triggerDelegateAssetStatusUpdated];
}

- (void)_triggerDelegateAssetStatusUpdated
{
  id v3 = [(UAFAssetUtilities *)self statusQueue];
  dispatch_assert_queue_V2(v3);

  double v4 = [(UAFAssetUtilities *)self delegateQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__UAFAssetUtilities__triggerDelegateAssetStatusUpdated__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(v4, block);
}

void __55__UAFAssetUtilities__triggerDelegateAssetStatusUpdated__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[UAFAssetUtilities _triggerDelegateAssetStatusUpdated]_block_invoke";
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s #settings asset status update requested", (uint8_t *)&v7, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "-[UAFAssetUtilities _triggerDelegateAssetStatusUpdated]_block_invoke";
      _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings asset status delegate", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 handleAssetStatusUpdated];
  }
}

- (UAFAssetStatus)assetStatus
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(UAFAssetUtilities *)self assistantGroup];
  [(UAFAssetUtilities *)self assetAvailableCheckTimeout];
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  intptr_t v6 = dispatch_group_wait(v3, v5);

  if (v6)
  {
    int v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[UAFAssetUtilities assetStatus]";
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s #settings Failed to check UAF asset status due to timeout", (uint8_t *)&buf, 0xCu);
    }
  }
  int v8 = [(UAFAssetUtilities *)self statusQueue];
  dispatch_assert_queue_not_V2(v8);

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v9 = [(UAFAssetUtilities *)self statusQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__UAFAssetUtilities_assetStatus__block_invoke;
  v12[3] = &unk_264CEAC68;
  v12[4] = self;
  v12[5] = &buf;
  dispatch_sync(v9, v12);

  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return (UAFAssetStatus *)v10;
}

void __32__UAFAssetUtilities_assetStatus__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  if (!v2)
  {
    id v3 = objc_alloc_init(UAFAssetStatus);
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_time_t v5 = *(void **)(v4 + 96);
    *(void *)(v4 + 96) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  }
  intptr_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

- (id)currentAssetStatus
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = [(UAFAssetUtilities *)self assetStatus];
  uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", [v3 state]);
    intptr_t v6 = [v3 value];
    *(_DWORD *)long long buf = 136315650;
    v32 = "-[UAFAssetUtilities currentAssetStatus]";
    __int16 v33 = 2112;
    uint64_t v34 = v5;
    __int16 v35 = 1024;
    int v36 = [v6 unsignedIntegerValue];
    _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Current asset state %@ with value %d", buf, 0x1Cu);
  }
  BOOL v7 = +[UAFCommonUtilities isAssistantEnabled];
  BOOL v8 = +[UAFCommonUtilities deviceSupportAndUseHybridASR];
  BOOL v9 = +[UAFCommonUtilities deviceSupportFullUOD];
  if (![v3 state] || objc_msgSend(v3, "state") == 2 || objc_msgSend(v3, "state") == 4)
  {
    BOOL v10 = 0;
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v10 = [v3 state] != 6;
    if (!v7) {
      goto LABEL_11;
    }
  }
  if ([(UAFAssetUtilities *)self autoRetryEnabled] && (v8 || v9) && !v10)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v11 = [(UAFAssetUtilities *)self assistantQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__UAFAssetUtilities_currentAssetStatus__block_invoke;
    block[3] = &unk_264CEAC90;
    objc_copyWeak(&v30, (id *)buf);
    dispatch_async(v11, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
  }
LABEL_11:
  BOOL v12 = [(UAFAssetUtilities *)self showHybridAsUnsupported];
  int v13 = v9 || v8;
  if (v12) {
    int v13 = v9;
  }
  if ((v7 & v13 & 1) == 0)
  {
    [v3 setState:1];
    uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", [v3 state]);
      *(_DWORD *)long long buf = 136316162;
      v32 = "-[UAFAssetUtilities currentAssetStatus]";
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      __int16 v35 = 1024;
      int v36 = v7;
      __int16 v37 = 1024;
      BOOL v38 = v8;
      __int16 v39 = 1024;
      BOOL v40 = v9;
      _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s #settings Forcing display state to %@ (enabled:%d, hybridUOD:%d, fullUOD:%d)", buf, 0x28u);
    }
    goto LABEL_20;
  }
  if (v9 && [(UAFAssetUtilities *)self understandingOnDeviceAssetsAvailable])
  {
    [v3 setState:5];
    uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", [v3 state]);
      *(_DWORD *)long long buf = 136315394;
      v32 = "-[UAFAssetUtilities currentAssetStatus]";
      __int16 v33 = 2112;
      uint64_t v34 = v15;
      _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s #settings Forcing display state to %@ due to UOD available", buf, 0x16u);
    }
LABEL_20:
  }
  id v17 = +[UAFAssetStatus mockAssetStatus];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_msgSend(v3, "setState:", objc_msgSend(v17, "state"));
    __int16 v19 = [v18 value];
    [v3 setValue:v19];

    id v20 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", [v3 state]);
      uint64_t v22 = [v3 value];
      int v23 = [v22 unsignedIntegerValue];
      *(_DWORD *)long long buf = 136315650;
      v32 = "-[UAFAssetUtilities currentAssetStatus]";
      __int16 v33 = 2112;
      uint64_t v34 = v21;
      __int16 v35 = 1024;
      int v36 = v23;
      _os_log_impl(&dword_23797A000, v20, OS_LOG_TYPE_DEFAULT, "%s #settings Using mock asset state %@ with value %d", buf, 0x1Cu);
    }
  }
  uint64_t v24 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = +[UAFAssetStatus stringFromUAFAssetState:](UAFAssetStatus, "stringFromUAFAssetState:", [v3 state]);
    v26 = [v3 value];
    int v27 = [v26 unsignedIntegerValue];
    *(_DWORD *)long long buf = 136315650;
    v32 = "-[UAFAssetUtilities currentAssetStatus]";
    __int16 v33 = 2112;
    uint64_t v34 = v25;
    __int16 v35 = 1024;
    int v36 = v27;
    _os_log_impl(&dword_23797A000, v24, OS_LOG_TYPE_DEFAULT, "%s #settings Returning state %@ with value %d", buf, 0x1Cu);
  }

  return v3;
}

void __39__UAFAssetUtilities_currentAssetStatus__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _downloadSiriAssetsRetry];
    id WeakRetained = v2;
  }
}

- (BOOL)_networkIsSatisfiedForPath:(id)a3
{
  return a3 && (nw_path_get_status((nw_path_t)a3) & 0xFFFFFFFD) == 1;
}

- (BOOL)_networkIsExpensiveForPath:(id)a3
{
  return a3 && nw_path_is_expensive((nw_path_t)a3);
}

- (void)_handleNetworkPathUpdate:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_time_t v5 = [(UAFAssetUtilities *)self statusQueue];
  dispatch_assert_queue_V2(v5);

  int networkSatisfied = self->_networkSatisfied;
  BOOL networkExpensive = self->_networkExpensive;
  self->_int networkSatisfied = [(UAFAssetUtilities *)self _networkIsSatisfiedForPath:v4];
  self->_BOOL networkExpensive = [(UAFAssetUtilities *)self _networkIsExpensiveForPath:v4];
  BOOL v8 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = self->_networkSatisfied;
    BOOL v10 = self->_networkExpensive;
    *(_DWORD *)long long buf = 136315650;
    int v27 = "-[UAFAssetUtilities _handleNetworkPathUpdate:]";
    __int16 v28 = 1024;
    BOOL v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = v10;
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Primary network (satisfied:%d, expensive: %d)", buf, 0x18u);
  }

  int v11 = self->_networkSatisfied;
  if (networkSatisfied != v11)
  {
    BOOL v12 = v11 == 0;
    unint64_t v13 = [(UAFAssetStatus *)self->_assetStatus state];
    if (v12)
    {
      if (v13 == 3)
      {
        [(UAFAssetStatus *)self->_assetStatus setState:4];
        [(UAFAssetStatus *)self->_assetStatus setValue:&unk_26EAA0E28];
        id v16 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          int v27 = "-[UAFAssetUtilities _handleNetworkPathUpdate:]";
          _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s #settings Forcing downloading state to failed", buf, 0xCu);
        }

        [(UAFAssetUtilities *)self _triggerDelegateAssetStatusUpdated];
      }
    }
    else if (v13 == 4)
    {
      uint64_t v14 = [(UAFAssetStatus *)self->_assetStatus value];
      int v15 = [v14 isEqualToNumber:&unk_26EAA0E28];

      if (v15) {
        [(UAFAssetUtilities *)self refreshUAFAssetStatusAsync];
      }
    }
    if (networkSatisfied != self->_networkSatisfied) {
      goto LABEL_26;
    }
  }
  if (networkExpensive == self->_networkExpensive)
  {
    id v17 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      int v27 = "-[UAFAssetUtilities _handleNetworkPathUpdate:]";
      _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s #settings Network path nothing changed", buf, 0xCu);
    }
  }
  else
  {
LABEL_26:
    if ([(UAFAssetUtilities *)self autoRetryEnabled]
      && self->_networkSatisfied
      && !self->_networkExpensive)
    {
      objc_initWeak((id *)buf, self);
      uint64_t v18 = [(UAFAssetUtilities *)self assistantQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__UAFAssetUtilities__handleNetworkPathUpdate___block_invoke;
      block[3] = &unk_264CEAC90;
      objc_copyWeak(&v25, (id *)buf);
      dispatch_async(v18, block);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    __int16 v19 = [(UAFAssetUtilities *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      objc_initWeak((id *)buf, self);
      uint64_t v21 = [(UAFAssetUtilities *)self delegateQueue];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __46__UAFAssetUtilities__handleNetworkPathUpdate___block_invoke_313;
      v22[3] = &unk_264CEAC90;
      objc_copyWeak(&v23, (id *)buf);
      dispatch_async(v21, v22);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __46__UAFAssetUtilities__handleNetworkPathUpdate___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      dispatch_time_t v5 = "-[UAFAssetUtilities _handleNetworkPathUpdate:]_block_invoke";
      _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s #settings Auto retry download on network change", (uint8_t *)&v4, 0xCu);
    }

    id v3 = [WeakRetained retryState];
    [v3 setCancelled:1];

    [WeakRetained setRetryState:0];
    [WeakRetained autoRetryDelayOnSettingsChanged];
    objc_msgSend(WeakRetained, "_downloadSiriAssetsWithDelay:");
  }
}

void __46__UAFAssetUtilities__handleNetworkPathUpdate___block_invoke_313(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained delegate];
    [v2 networkPathChangeSatisfied:v3[27] isExpensive:v3[28]];

    id WeakRetained = v3;
  }
}

- (void)downloadSiriAssetsIfNeeded
{
  objc_initWeak(&location, self);
  id v3 = [(UAFAssetUtilities *)self downloadQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UAFAssetUtilities_downloadSiriAssetsIfNeeded__block_invoke;
  block[3] = &unk_264CEACE0;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__UAFAssetUtilities_downloadSiriAssetsIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = [WeakRetained getAssistantLanguageIfAvailableSync];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__UAFAssetUtilities_downloadSiriAssetsIfNeeded__block_invoke_2;
    v5[3] = &unk_264CEACB8;
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v3;
    [v3 assetsAreAvailableForLanguage:v4 completion:v5];
  }
}

void __47__UAFAssetUtilities_downloadSiriAssetsIfNeeded__block_invoke_2(uint64_t a1, char a2)
{
  int v4 = [*(id *)(a1 + 32) downloadQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__UAFAssetUtilities_downloadSiriAssetsIfNeeded__block_invoke_3;
  v5[3] = &unk_264CEABA0;
  char v6 = a2;
  v5[4] = *(void *)(a1 + 40);
  dispatch_async(v4, v5);
}

void __47__UAFAssetUtilities_downloadSiriAssetsIfNeeded__block_invoke_3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 40))
  {
    v1 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      int v4 = "-[UAFAssetUtilities downloadSiriAssetsIfNeeded]_block_invoke_3";
      _os_log_impl(&dword_23797A000, v1, OS_LOG_TYPE_DEFAULT, "%s #settings Skip download due to assets available already", (uint8_t *)&v3, 0xCu);
    }
  }
  else
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _downloadSiriAssetsOverCellular:0];
  }
}

- (void)downloadSiriAssets
{
  objc_initWeak(&location, self);
  int v3 = [(UAFAssetUtilities *)self assistantGroup];
  int v4 = [(UAFAssetUtilities *)self downloadQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__UAFAssetUtilities_downloadSiriAssets__block_invoke;
  v5[3] = &unk_264CEAC90;
  objc_copyWeak(&v6, &location);
  dispatch_group_notify(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__UAFAssetUtilities_downloadSiriAssets__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _downloadSiriAssetsOverCellular:0];
}

- (void)downloadSiriAssetsOverCellular
{
  objc_initWeak(&location, self);
  int v3 = [(UAFAssetUtilities *)self assistantGroup];
  int v4 = [(UAFAssetUtilities *)self downloadQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__UAFAssetUtilities_downloadSiriAssetsOverCellular__block_invoke;
  v5[3] = &unk_264CEAC90;
  objc_copyWeak(&v6, &location);
  dispatch_group_notify(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__UAFAssetUtilities_downloadSiriAssetsOverCellular__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _downloadSiriAssetsOverCellular:1];
}

- (void)_downloadSiriAssetsRetry
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  int v3 = [(UAFAssetUtilities *)self assistantQueue];
  dispatch_assert_queue_V2(v3);

  if ([(UAFAssetUtilities *)self autoRetryEnabled])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    BOOL v29 = __Block_byref_object_copy_;
    __int16 v30 = __Block_byref_object_dispose_;
    id v31 = [(UAFAssetUtilities *)self retryState];
    unsigned int v4 = [*(id *)(*((void *)&buf + 1) + 40) retryCount];
    if (v4 >= [(UAFAssetUtilities *)self autoRetryLimit])
    {
      uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v23 = 136315394;
        uint64_t v24 = "-[UAFAssetUtilities _downloadSiriAssetsRetry]";
        __int16 v25 = 1024;
        unsigned int v26 = v4;
        id v6 = "%s #settings Skip retry after hitting limit %d";
        BOOL v7 = v5;
        uint32_t v8 = 18;
        goto LABEL_11;
      }
    }
    else
    {
      if (![*(id *)(*((void *)&buf + 1) + 40) pending])
      {
        [*(id *)(*((void *)&buf + 1) + 40) setPending:1];
        unsigned int v10 = [(UAFAssetUtilities *)self autoRetryLimit];
        unsigned int v11 = v10 - v4;
        if (v10 != v4)
        {
          unsigned int v12 = 0;
          do
          {
            [(UAFAssetUtilities *)self autoRetryDelayOnFailure];
            double v14 = v13;
            [(UAFAssetUtilities *)self autoRetryDelayOnFailureIncrement];
            double v16 = v15;
            objc_initWeak((id *)v23, self);
            dispatch_time_t v17 = dispatch_time(0, (uint64_t)((v14 + (double)v12 * v16) * 1000000000.0));
            uint64_t v18 = [(UAFAssetUtilities *)self assistantQueue];
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __45__UAFAssetUtilities__downloadSiriAssetsRetry__block_invoke;
            block[3] = &unk_264CEAD08;
            objc_copyWeak(&v20, (id *)v23);
            void block[4] = &buf;
            unsigned int v21 = v12;
            unsigned int v22 = v11;
            dispatch_after(v17, v18, block);

            objc_destroyWeak(&v20);
            objc_destroyWeak((id *)v23);
            ++v12;
          }
          while (v11 != v12);
        }
        goto LABEL_13;
      }
      uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v23 = 136315138;
        uint64_t v24 = "-[UAFAssetUtilities _downloadSiriAssetsRetry]";
        id v6 = "%s #settings Skip retry attempt on pending execution";
        BOOL v7 = v5;
        uint32_t v8 = 12;
LABEL_11:
        _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, v6, v23, v8);
      }
    }

LABEL_13:
    _Block_object_dispose(&buf, 8);

    return;
  }
  BOOL v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[UAFAssetUtilities _downloadSiriAssetsRetry]";
    _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings Auto retry is disabled", (uint8_t *)&buf, 0xCu);
  }
}

void __45__UAFAssetUtilities__downloadSiriAssetsRetry__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v4 = [WeakRetained assetStatus];
    if (![v3 autoRetryEnabled]
      || ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) cancelled] & 1) != 0
      || (unsigned int v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) retryCount],
          v5 >= [v3 autoRetryLimit])
      || [v4 state] == 5
      || [v4 state] == 3)
    {
      id v6 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(_DWORD *)(a1 + 48);
        int v10 = 136315394;
        unsigned int v11 = "-[UAFAssetUtilities _downloadSiriAssetsRetry]_block_invoke";
        __int16 v12 = 1024;
        int v13 = v7;
        _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Retry attempt %d skipped", (uint8_t *)&v10, 0x12u);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPending:0];
    }
    else
    {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setRetryCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "retryCount") + 1);
      uint32_t v8 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *(_DWORD *)(a1 + 48);
        int v10 = 136315394;
        unsigned int v11 = "-[UAFAssetUtilities _downloadSiriAssetsRetry]_block_invoke";
        __int16 v12 = 1024;
        int v13 = v9;
        _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Retry attempt %d", (uint8_t *)&v10, 0x12u);
      }

      [v3 downloadSiriAssets];
    }
    if (*(_DWORD *)(a1 + 48) + 1 == *(_DWORD *)(a1 + 52)) {
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setPending:0];
    }
  }
}

- (void)_downloadSiriAssetsWithDelay:(double)a3
{
  objc_initWeak(&location, self);
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  id v6 = [(UAFAssetUtilities *)self downloadQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__UAFAssetUtilities__downloadSiriAssetsWithDelay___block_invoke;
  v7[3] = &unk_264CEAC90;
  objc_copyWeak(&v8, &location);
  dispatch_after(v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__UAFAssetUtilities__downloadSiriAssetsWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _downloadSiriAssetsOverCellular:0];
}

- (void)_downloadSiriAssetsOverCellular:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_time_t v5 = [(UAFAssetUtilities *)self downloadQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(UAFAssetUtilities *)self getAssistantLanguageIfAvailableSync];
  if (v6)
  {
    unint64_t v7 = [(UAFAssetUtilities *)self _checkFreeSpaceNeededForLanguage:v6 forClient:0];
    if (v7)
    {
      unint64_t v8 = v7;
      int v9 = [(UAFAssetUtilities *)self statusQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __53__UAFAssetUtilities__downloadSiriAssetsOverCellular___block_invoke;
      block[3] = &unk_264CEAB28;
      void block[4] = self;
      void block[5] = v8;
      dispatch_async(v9, block);

      goto LABEL_21;
    }
    unsigned int v11 = (void *)nw_path_evaluator_copy_path();
    BOOL v12 = [(UAFAssetUtilities *)self _networkIsSatisfiedForPath:v11];
    if (v3 || !v12)
    {
      if (v12) {
        goto LABEL_10;
      }
    }
    else if (![(UAFAssetUtilities *)self _networkIsExpensiveForPath:v11])
    {
LABEL_10:
      int v13 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315650;
        unsigned int v21 = "-[UAFAssetUtilities _downloadSiriAssetsOverCellular:]";
        __int16 v22 = 2114;
        id v23 = v6;
        __int16 v24 = 1024;
        BOOL v25 = v3;
        _os_log_impl(&dword_23797A000, v13, OS_LOG_TYPE_DEFAULT, "%s #settings Download requested for language (%{public}@) (cellular:%d)", buf, 0x1Cu);
      }

      uint64_t v14 = [(UAFAssetUtilities *)self _createConnection];
      double v15 = v14;
      if (v3) {
        [v14 downloadSiriAssetsOverCellular];
      }
      else {
        [v14 downloadSiriAssets];
      }

LABEL_20:
      goto LABEL_21;
    }
    double v16 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned int v21 = "-[UAFAssetUtilities _downloadSiriAssetsOverCellular:]";
      _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s #settings Skip download due to network path", buf, 0xCu);
    }

    dispatch_time_t v17 = [(UAFAssetUtilities *)self statusQueue];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__UAFAssetUtilities__downloadSiriAssetsOverCellular___block_invoke_316;
    v18[3] = &unk_264CEAB50;
    v18[4] = self;
    dispatch_async(v17, v18);

    goto LABEL_20;
  }
  int v10 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    unsigned int v21 = "-[UAFAssetUtilities _downloadSiriAssetsOverCellular:]";
    _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s #settings Skip download due to nil language", buf, 0xCu);
  }

LABEL_21:
}

uint64_t __53__UAFAssetUtilities__downloadSiriAssetsOverCellular___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) setState:6];
  id v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 96) setValue:v2];

  BOOL v3 = *(void **)(a1 + 32);

  return [v3 _triggerDelegateAssetStatusUpdated];
}

uint64_t __53__UAFAssetUtilities__downloadSiriAssetsOverCellular___block_invoke_316(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) setState:2];
  id v2 = *(void **)(a1 + 32);

  return [v2 _triggerDelegateAssetStatusUpdated];
}

- (id)getDiskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    id v13 = &unk_26EAA0E40;
    goto LABEL_14;
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v28 = 0;
  BOOL v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy_;
  uint64_t v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  unint64_t v8 = [(UAFAssetUtilities *)self _createConnection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __68__UAFAssetUtilities_getDiskSpaceNeededInBytesForLanguage_forClient___block_invoke;
  v18[3] = &unk_264CEAD30;
  id v20 = &v28;
  unsigned int v21 = &v22;
  int v9 = v7;
  __int16 v19 = v9;
  [v8 diskSpaceNeededInBytesForLanguage:v6 forClient:a4 completion:v18];
  [(UAFAssetUtilities *)self assetAvailableCheckTimeout];
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
  if (dispatch_semaphore_wait(v9, v11))
  {
    BOOL v12 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v35 = "-[UAFAssetUtilities getDiskSpaceNeededInBytesForLanguage:forClient:]";
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s #settings Failed to check size due to timeout", buf, 0xCu);
    }

    if (!v23[5]) {
      goto LABEL_12;
    }
  }
  else if (!v23[5])
  {
    double v15 = (id *)(v29 + 5);
    goto LABEL_13;
  }
  uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = v23[5];
    *(_DWORD *)long long buf = 136315394;
    __int16 v35 = "-[UAFAssetUtilities getDiskSpaceNeededInBytesForLanguage:forClient:]";
    __int16 v36 = 2112;
    uint64_t v37 = v17;
    _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s #settings Failed to check size due to error %@", buf, 0x16u);
  }

LABEL_12:
  double v15 = (id *)&kUAFSiriDefaultDiskSpaceNeededSize;
LABEL_13:
  id v13 = *v15;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

LABEL_14:

  return v13;
}

void __68__UAFAssetUtilities_getDiskSpaceNeededInBytesForLanguage_forClient___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  double v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)_checkFreeSpaceNeededForLanguage:(id)a3 forClient:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unsigned int v4 = [(UAFAssetUtilities *)self getDiskSpaceNeededInBytesForLanguage:a3 forClient:a4];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (v5)
  {
    return +[UAFCommonUtilities getFreeDiskSpaceNeededInBytes:v5];
  }
  else
  {
    uint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[UAFAssetUtilities _checkFreeSpaceNeededForLanguage:forClient:]";
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s #settings Returning enough space for assets even with an unknown size requested", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (BOOL)hasSufficientDiskSpaceForDownload
{
  BOOL v3 = [(UAFAssetUtilities *)self getAssistantLanguageIfAvailableSync];
  if (v3) {
    BOOL v4 = [(UAFAssetUtilities *)self _checkFreeSpaceNeededForLanguage:v3 forClient:0] == 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)hasSufficientDiskSpaceForClient:(unint64_t)a3
{
  uint64_t v5 = [(UAFAssetUtilities *)self getAssistantLanguageIfAvailableSync];
  if (v5) {
    BOOL v6 = [(UAFAssetUtilities *)self _checkFreeSpaceNeededForLanguage:v5 forClient:a3] == 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (NSString)siriLanguage
{
  BOOL v3 = [(UAFAssetUtilities *)self assistantQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  id v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  BOOL v4 = [(UAFAssetUtilities *)self assistantQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__UAFAssetUtilities_siriLanguage__block_invoke;
  v7[3] = &unk_264CEABF0;
  void v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

void __33__UAFAssetUtilities_siriLanguage__block_invoke(uint64_t a1)
{
}

- (BOOL)assistantEnabled
{
  id v2 = self;
  BOOL v3 = [(UAFAssetUtilities *)self assistantQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  BOOL v4 = [(UAFAssetUtilities *)v2 assistantQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__UAFAssetUtilities_assistantEnabled__block_invoke;
  v6[3] = &unk_264CEABF0;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __37__UAFAssetUtilities_assistantEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 25);
  return result;
}

- (UAFRetryState)retryState
{
  BOOL v3 = [(UAFAssetUtilities *)self assistantQueue];
  dispatch_assert_queue_V2(v3);

  retryState = self->_retryState;
  if (!retryState)
  {
    id v5 = objc_alloc_init(UAFRetryState);
    BOOL v6 = self->_retryState;
    self->_retryState = v5;

    retryState = self->_retryState;
  }

  return retryState;
}

- (void)setRetryState:(id)a3
{
  BOOL v4 = (UAFRetryState *)a3;
  id v5 = [(UAFAssetUtilities *)self assistantQueue];
  dispatch_assert_queue_V2(v5);

  retryState = self->_retryState;
  self->_retryState = v4;
}

- (id)getAssistantLanguageIfAvailableSync
{
  if (+[UAFCommonUtilities isAssistantEnabled])
  {
    id v2 = +[UAFCommonUtilities currentAssistantLanguage];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void)_assistantLanguageUpdate
{
  BOOL v3 = [(UAFAssetUtilities *)self assistantQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__UAFAssetUtilities__assistantLanguageUpdate__block_invoke;
  block[3] = &unk_264CEAB50;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __45__UAFAssetUtilities__assistantLanguageUpdate__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  BOOL v3 = [*(id *)(a1 + 32) getAssistantLanguageIfAvailableSync];
  if (([v3 isEqualToString:v2] & 1) == 0)
  {
    BOOL v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v13 = "-[UAFAssetUtilities _assistantLanguageUpdate]_block_invoke";
      __int16 v14 = 2114;
      double v15 = v3;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Siri language changed to : %{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setSiriLanguage:v3];
    int v5 = [*(id *)(a1 + 32) autoRetryEnabled];
    if (v3 && v5)
    {
      BOOL v6 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        id v13 = "-[UAFAssetUtilities _assistantLanguageUpdate]_block_invoke";
        __int16 v14 = 2114;
        double v15 = v3;
        _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Auto retry download on language change, language = %{public}@", buf, 0x16u);
      }

      uint64_t v7 = [*(id *)(a1 + 32) retryState];
      [v7 setCancelled:1];

      [*(id *)(a1 + 32) setRetryState:0];
      uint64_t v8 = *(void **)(a1 + 32);
      [v8 autoRetryDelayOnSettingsChanged];
      objc_msgSend(v8, "_downloadSiriAssetsWithDelay:");
    }
    uint64_t v9 = [*(id *)(a1 + 32) delegateQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__UAFAssetUtilities__assistantLanguageUpdate__block_invoke_321;
    v10[3] = &unk_264CEAC18;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v3;
    dispatch_async(v9, v10);
  }
}

void __45__UAFAssetUtilities__assistantLanguageUpdate__block_invoke_321(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    BOOL v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 136315394;
      uint64_t v8 = "-[UAFAssetUtilities _assistantLanguageUpdate]_block_invoke";
      __int16 v9 = 2114;
      uint64_t v10 = v5;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Calling delegate assistantLanguageDidChange : %{public}@", (uint8_t *)&v7, 0x16u);
    }

    BOOL v6 = [*(id *)(a1 + 32) delegate];
    [v6 assistantLanguageDidChange:*(void *)(a1 + 40)];
  }
}

- (void)_assistantPreferencesUpdate
{
  char v3 = [(UAFAssetUtilities *)self assistantQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__UAFAssetUtilities__assistantPreferencesUpdate__block_invoke;
  block[3] = &unk_264CEAB50;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __48__UAFAssetUtilities__assistantPreferencesUpdate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 25);
  BOOL v3 = +[UAFCommonUtilities isAssistantEnabled];
  if (v2 != v3)
  {
    BOOL v4 = v3;
    uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = "disabled";
      if (v4) {
        BOOL v6 = "enabled";
      }
      *(_DWORD *)long long buf = 136315394;
      double v15 = "-[UAFAssetUtilities _assistantPreferencesUpdate]_block_invoke";
      __int16 v16 = 2080;
      uint64_t v17 = v6;
      _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, "%s #settings Assistant preferences changed to : %s", buf, 0x16u);
    }

    [*(id *)(a1 + 32) setAssistantEnabled:v4];
    int v7 = [*(id *)(a1 + 32) autoRetryEnabled];
    if (v4 && v7)
    {
      uint64_t v8 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        double v15 = "-[UAFAssetUtilities _assistantPreferencesUpdate]_block_invoke";
        _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Auto retry download on enablement change", buf, 0xCu);
      }

      __int16 v9 = [*(id *)(a1 + 32) retryState];
      [v9 setCancelled:1];

      [*(id *)(a1 + 32) setRetryState:0];
      uint64_t v10 = *(void **)(a1 + 32);
      [v10 autoRetryDelayOnSettingsChanged];
      objc_msgSend(v10, "_downloadSiriAssetsWithDelay:");
    }
    uint64_t v11 = [*(id *)(a1 + 32) delegateQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__UAFAssetUtilities__assistantPreferencesUpdate__block_invoke_326;
    v12[3] = &unk_264CEABA0;
    v12[4] = *(void *)(a1 + 32);
    BOOL v13 = v4;
    dispatch_async(v11, v12);
  }
}

void __48__UAFAssetUtilities__assistantPreferencesUpdate__block_invoke_326(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    BOOL v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = "enabled";
      if (!*(unsigned char *)(a1 + 40)) {
        uint64_t v5 = "disabled";
      }
      int v7 = 136315394;
      uint64_t v8 = "-[UAFAssetUtilities _assistantPreferencesUpdate]_block_invoke";
      __int16 v9 = 2080;
      uint64_t v10 = v5;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s #settings Calling delegate assistantEnabledDidChange : %s", (uint8_t *)&v7, 0x16u);
    }

    BOOL v6 = [*(id *)(a1 + 32) delegate];
    [v6 assistantEnabledDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (UAFAssetUtilitiesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UAFAssetUtilitiesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)autoRetryEnabled
{
  return self->_autoRetryEnabled;
}

- (void)setAutoRetryEnabled:(BOOL)a3
{
  self->_autoRetryEnabled = a3;
}

- (unsigned)autoRetryLimit
{
  return self->_autoRetryLimit;
}

- (void)setAutoRetryLimit:(unsigned int)a3
{
  self->_autoRetryLimit = a3;
}

- (double)autoRetryDelayOnFailure
{
  return self->_autoRetryDelayOnFailure;
}

- (void)setAutoRetryDelayOnFailure:(double)a3
{
  self->_autoRetryDelayOnFailure = a3;
}

- (double)autoRetryDelayOnFailureIncrement
{
  return self->_autoRetryDelayOnFailureIncrement;
}

- (void)setAutoRetryDelayOnFailureIncrement:(double)a3
{
  self->_autoRetryDelayOnFailureIncrement = a3;
}

- (double)autoRetryDelayOnSettingsChanged
{
  return self->_autoRetryDelayOnSettingsChanged;
}

- (void)setAutoRetryDelayOnSettingsChanged:(double)a3
{
  self->_autoRetryDelayOnSettingsChanged = a3;
}

- (double)assetAvailableCheckTimeout
{
  return self->_assetAvailableCheckTimeout;
}

- (void)setAssetAvailableCheckTimeout:(double)a3
{
  self->_assetAvailableCheckTimeout = a3;
}

- (void)setAssistantEnabled:(BOOL)a3
{
  self->_assistantEnabled = a3;
}

- (void)setSiriLanguage:(id)a3
{
}

- (void)setAssetStatus:(id)a3
{
}

- (void)setUnderstandingOnDeviceAssetsAvailable:(BOOL)a3
{
  self->_understandingOnDeviceAssetsAvailable = a3;
}

- (void)setAssistantUODStatus:(id)a3
{
}

- (BOOL)networkSatisfied
{
  return self->_networkSatisfied;
}

- (void)setNetworkSatisfied:(BOOL)a3
{
  self->_int networkSatisfied = a3;
}

- (BOOL)networkExpensive
{
  return self->_networkExpensive;
}

- (void)setNetworkExpensive:(BOOL)a3
{
  self->_BOOL networkExpensive = a3;
}

- (BOOL)showHybridAsUnsupported
{
  return self->_showHybridAsUnsupported;
}

- (void)setShowHybridAsUnsupported:(BOOL)a3
{
  self->_showHybridAsUnsupported = a3;
}

- (OS_dispatch_queue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
}

- (OS_dispatch_queue)statusQueue
{
  return self->_statusQueue;
}

- (void)setStatusQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (OS_dispatch_queue)assistantQueue
{
  return self->_assistantQueue;
}

- (void)setAssistantQueue:(id)a3
{
}

- (OS_dispatch_group)assistantGroup
{
  return self->_assistantGroup;
}

- (void)setAssistantGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantGroup, 0);
  objc_storeStrong((id *)&self->_assistantQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_assistantUODStatus, 0);
  objc_storeStrong((id *)&self->_assetStatus, 0);
  objc_storeStrong((id *)&self->_siriLanguage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_retryState, 0);

  objc_storeStrong((id *)&self->_pathEvaluator, 0);
}

@end