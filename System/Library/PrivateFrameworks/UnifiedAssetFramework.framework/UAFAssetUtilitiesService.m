@interface UAFAssetUtilitiesService
- (BOOL)_isLegacySiriDevice;
- (BOOL)_updateDictationAvailabilityForLanguage:(id)a3;
- (BOOL)uodAvailable;
- (NSMutableDictionary)dictationStatus;
- (OS_dispatch_group)statusGroup;
- (OS_dispatch_queue)downloadQueue;
- (OS_dispatch_queue)statusQueue;
- (UAFAssetStatus)assetStatus;
- (UAFAssetUtilitiesService)init;
- (id)_getDiskSpaceNeededInBytesForLanguage:(id)a3 isDictation:(BOOL)a4 error:(id *)a5;
- (id)getLanguage;
- (unint64_t)_checkFreeSpaceNeededForLanguage:(id)a3 isDictation:(BOOL)a4;
- (void)_downloadDictationAssetsForLanguage:(id)a3 useCellular:(BOOL)a4;
- (void)_downloadSiriAssetsWithCellular:(BOOL)a3;
- (void)_downloadUnderstandingAssetsForLanguage:(id)a3 useCellular:(BOOL)a4;
- (void)_handleDictationCompletionForLanguage:(id)a3;
- (void)_handleDictationProgress:(unint64_t)a3 status:(unint64_t)a4 language:(id)a5;
- (void)_handleUpdateProgress:(unint64_t)a3 status:(unint64_t)a4 language:(id)a5;
- (void)_postAssetStateChangedNotification;
- (void)_siriDownloadCompleteForLanguage:(id)a3;
- (void)_stopObserver;
- (void)_triggerCompletionTimerForLanguage:(id)a3;
- (void)_updateAssetState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5;
- (void)_updateDictationProgress:(unint64_t)a3 language:(id)a4;
- (void)_updateDictationState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5;
- (void)_updateProgress:(unint64_t)a3 forLanguage:(id)a4;
- (void)_updateSiriAssetAvailability:(id)a3 forLanguage:(id)a4;
- (void)checkAssetStatus:(id)a3;
- (void)dealloc;
- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5;
- (void)downloadDictationAssetsForLanguage:(id)a3;
- (void)downloadSiriAssets;
- (void)downloadSiriAssetsOverCellular;
- (void)postAssetNotificationIfNeeded;
- (void)postDictationAssetNotificationForLanguage:(id)a3;
- (void)setAssetStatus:(id)a3;
- (void)setDictationStatus:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setStatusGroup:(id)a3;
- (void)setStatusQueue:(id)a3;
- (void)setUodAvailable:(BOOL)a3;
- (void)startObserver;
- (void)switchLanguage:(id)a3;
- (void)updateAssetState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5;
- (void)updateSiriAssetAvailabilityForLanguage:(id)a3;
- (void)updateSiriAssetAvailabilityForLanguageSync:(id)a3;
- (void)updateSiriAssetAvailabilityForObserver;
@end

@implementation UAFAssetUtilitiesService

- (UAFAssetUtilitiesService)init
{
  v14.receiver = self;
  v14.super_class = (Class)UAFAssetUtilitiesService;
  v2 = [(UAFAssetUtilitiesService *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.UAF.Asset.download", v4);
    downloadQueue = v2->_downloadQueue;
    v2->_downloadQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.UAF.Asset.status", v8);
    statusQueue = v2->_statusQueue;
    v2->_statusQueue = (OS_dispatch_queue *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    statusGroup = v2->_statusGroup;
    v2->_statusGroup = (OS_dispatch_group *)v11;
  }
  return v2;
}

- (void)dealloc
{
  [(UAFAssetUtilitiesService *)self _stopObserver];
  v3.receiver = self;
  v3.super_class = (Class)UAFAssetUtilitiesService;
  [(UAFAssetUtilitiesService *)&v3 dealloc];
}

- (void)startObserver
{
  if (!self->_observerEnabled)
  {
    self->_observerEnabled = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getAFSiriXAssetDidChangeDarwinNotification_0();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AFSiriXAssetDidChangeCallback, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_stopObserver
{
  if (self->_observerEnabled)
  {
    self->_observerEnabled = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    getAFSiriXAssetDidChangeDarwinNotification_0();
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  }
}

- (void)downloadSiriAssets
{
}

- (void)downloadSiriAssetsOverCellular
{
}

- (void)_downloadSiriAssetsWithCellular:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  dispatch_queue_t v5 = [(UAFAssetUtilitiesService *)self getLanguage];
  if (v5)
  {
    v6 = [(UAFAssetUtilitiesService *)self downloadQueue];
    dispatch_assert_queue_not_V2(v6);

    v7 = [(UAFAssetUtilitiesService *)self downloadQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__UAFAssetUtilitiesService__downloadSiriAssetsWithCellular___block_invoke;
    block[3] = &unk_264CEABC8;
    block[4] = self;
    id v10 = v5;
    BOOL v11 = a3;
    dispatch_async(v7, block);
  }
  else
  {
    v8 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[UAFAssetUtilitiesService _downloadSiriAssetsWithCellular:]";
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s #settings nil language, skipping download...", buf, 0xCu);
    }

    [(UAFAssetUtilitiesService *)self updateAssetState:2 value:0 forLanguage:0];
  }
}

uint64_t __60__UAFAssetUtilitiesService__downloadSiriAssetsWithCellular___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadUnderstandingAssetsForLanguage:*(void *)(a1 + 40) useCellular:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_downloadUnderstandingAssetsForLanguage:(id)a3 useCellular:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(UAFAssetUtilitiesService *)self downloadQueue];
  dispatch_assert_queue_V2(v7);

  unint64_t v8 = [(UAFAssetUtilitiesService *)self _checkFreeSpaceNeededForLanguage:v6 isDictation:0];
  if (v8)
  {
    unint64_t v9 = v8;
    id v10 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v45 = v9;
      _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s #settings Download requested for Siri assets (%{public}@) but hit out of space... %llu bytes needed", buf, 0x20u);
    }

    BOOL v11 = [NSNumber numberWithUnsignedLongLong:v9];
    [(UAFAssetUtilitiesService *)self updateAssetState:6 value:v11 forLanguage:v6];

    goto LABEL_27;
  }
  if (v4
    || +[UAFCommonUtilities isInexpensiveNetworkAvailable])
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v12 addObject:@"UpdateNamespaces"];
    if (v4) {
      [v12 addObject:@"UseCellular"];
    }
    BOOL v13 = [(UAFAssetUtilitiesService *)self _isLegacySiriDevice];
    uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s #settings Download requested for legacy Siri for language %{public}@...", buf, 0x16u);
      }

      [(UAFAssetUtilitiesService *)self updateAssetState:1 value:0 forLanguage:v6];
      v16 = +[UAFAssetSetManager sharedManager];
      [v16 updateAssetsForSubscriber:@"com.apple.siri.assistant" subscriptionName:0 policies:v12 queue:0 progress:0 completion:0];

      goto LABEL_26;
    }
    if (v15)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_23797A000, v14, OS_LOG_TYPE_DEFAULT, "%s #settings Download requested for Siri assets (%{public}@)...", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v45 = 2;
    v17 = [(UAFAssetUtilitiesService *)self statusQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke;
    block[3] = &unk_264CEABF0;
    block[4] = self;
    void block[5] = buf;
    dispatch_sync(v17, block);

    uint64_t v18 = *(void *)(*(void *)&buf[8] + 24);
    if (v18 != 5)
    {
      if (v18 == 3)
      {
        v19 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v40 = 136315394;
          v41 = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
          __int16 v42 = 2114;
          id v43 = v6;
          _os_log_impl(&dword_23797A000, v19, OS_LOG_TYPE_DEFAULT, "%s #settings Download requested for Siri assets skipped due to existing download in progress (%{public}@)...", v40, 0x16u);
        }

        goto LABEL_25;
      }
      [(UAFAssetUtilitiesService *)self updateAssetState:3 value:&unk_26EAA0E58 forLanguage:v6];
    }
    v21 = [(UAFAssetUtilitiesService *)self statusQueue];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_285;
    v37[3] = &unk_264CEAC18;
    v37[4] = self;
    id v22 = v6;
    id v38 = v22;
    dispatch_async(v21, v37);

    objc_initWeak((id *)v40, self);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_2;
    v34[3] = &unk_264CEB3E0;
    objc_copyWeak(&v36, (id *)v40);
    id v23 = v22;
    id v35 = v23;
    v24 = (void *)MEMORY[0x237E26D50](v34);
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    v30 = __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_3;
    v31 = &unk_264CEACE0;
    objc_copyWeak(&v33, (id *)v40);
    id v32 = v23;
    v25 = (void *)MEMORY[0x237E26D50](&v28);
    v26 = +[UAFAssetSetManager sharedManager];
    v27 = [(UAFAssetUtilitiesService *)self statusQueue];
    [v26 updateAssetsForSubscriber:@"com.apple.siri.assistant" subscriptionName:0 policies:v12 queue:v27 progress:v24 completion:v25];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)v40);

LABEL_25:
    _Block_object_dispose(buf, 8);
LABEL_26:

    goto LABEL_27;
  }
  v20 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[UAFAssetUtilitiesService _downloadUnderstandingAssetsForLanguage:useCellular:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_error_impl(&dword_23797A000, v20, OS_LOG_TYPE_ERROR, "%s #settings Cannot download Siri assets for language %{public}@ due to network connectivity...", buf, 0x16u);
  }

  [(UAFAssetUtilitiesService *)self updateAssetState:2 value:0 forLanguage:v6];
LABEL_27:
}

void __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetStatus];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 state];
}

void __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_285(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) uodAvailable];
  if (v2) {
    *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
  }
  id v3 = [*(id *)(a1 + 40) stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  +[UAFInstrumentationProvider logDownloadTriggerEventWithLanguage:hasExistingAssets:retryCount:](UAFInstrumentationProvider, "logDownloadTriggerEventWithLanguage:hasExistingAssets:retryCount:");
  if ((v2 & 1) == 0) {
    ++*(_DWORD *)(*(void *)(a1 + 32) + 16);
  }
}

void __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_2(uint64_t a1, uint64_t a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleUpdateProgress:(unint64_t)a3 status:a2 language:*(void *)(a1 + 32)];
}

void __80__UAFAssetUtilitiesService__downloadUnderstandingAssetsForLanguage_useCellular___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _siriDownloadCompleteForLanguage:*(void *)(a1 + 32)];
}

- (void)_handleUpdateProgress:(unint64_t)a3 status:(unint64_t)a4 language:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a5;
  unint64_t v9 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v9);

  id v10 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v12 = UAFSubscriptionDownloadStatusDescription(a4);
    int v13 = 136315394;
    uint64_t v14 = "-[UAFAssetUtilitiesService _handleUpdateProgress:status:language:]";
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_debug_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEBUG, "%s #settings progress status %@", (uint8_t *)&v13, 0x16u);
  }
  if (a4 - 1 >= 3)
  {
    if (a4 != 4)
    {
      if (a4 == 5)
      {
        BOOL v11 = [(UAFAssetUtilitiesService *)self _getDiskSpaceNeededInBytesForLanguage:v8 isDictation:0 error:0];
        [(UAFAssetUtilitiesService *)self _updateAssetState:6 value:v11 forLanguage:v8];
      }
      else
      {
        [(UAFAssetUtilitiesService *)self _updateAssetState:4 value:0 forLanguage:v8];
      }
    }
  }
  else
  {
    [(UAFAssetUtilitiesService *)self _updateProgress:a3 forLanguage:v8];
  }
}

- (void)_updateProgress:(unint64_t)a3 forLanguage:(id)a4
{
  *(void *)&v16[13] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    uint64_t v14 = "-[UAFAssetUtilitiesService _updateProgress:forLanguage:]";
    __int16 v15 = 1024;
    *(_DWORD *)v16 = a3;
    v16[2] = 2114;
    *(void *)&v16[3] = v6;
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Download progress %d%% for language %{public}@", (uint8_t *)&v13, 0x1Cu);
  }

  if (v6)
  {
    unint64_t v9 = [(UAFAssetUtilitiesService *)self assetStatus];
    uint64_t v10 = [v9 state];

    if (v10 == 5)
    {
      BOOL v11 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315394;
        uint64_t v14 = "-[UAFAssetUtilitiesService _updateProgress:forLanguage:]";
        __int16 v15 = 2114;
        *(void *)v16 = v6;
        _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_DEFAULT, "%s #settings UOD available already for %{public}@. Skip updating download progress...", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      if (a3 >= 0x63)
      {
        id v12 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315650;
          uint64_t v14 = "-[UAFAssetUtilitiesService _updateProgress:forLanguage:]";
          __int16 v15 = 1024;
          *(_DWORD *)v16 = 98;
          v16[2] = 2114;
          *(void *)&v16[3] = v6;
          _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s #settings Download progress clamped to %d%% for language %{public}@", (uint8_t *)&v13, 0x1Cu);
        }

        a3 = 98;
      }
      BOOL v11 = [NSNumber numberWithUnsignedInteger:a3];
      [(UAFAssetUtilitiesService *)self _updateAssetState:3 value:v11 forLanguage:v6];
    }
  }
  else
  {
    BOOL v11 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[UAFAssetUtilitiesService _updateProgress:forLanguage:]";
      _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s #settings nil language", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_siriDownloadCompleteForLanguage:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    BOOL v11 = "-[UAFAssetUtilitiesService _siriDownloadCompleteForLanguage:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Download complete for language %{public}@", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    v7 = [(UAFAssetUtilitiesService *)self assetStatus];
    uint64_t v8 = [v7 state];

    if (v8 != 5)
    {
      [(UAFAssetUtilitiesService *)self _updateAssetState:3 value:&unk_26EAA0E70 forLanguage:v4];
      [(UAFAssetUtilitiesService *)self _triggerCompletionTimerForLanguage:v4];
      goto LABEL_11;
    }
    unint64_t v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      BOOL v11 = "-[UAFAssetUtilitiesService _siriDownloadCompleteForLanguage:]";
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings UOD available already for %{public}@. Skip updating download progress...", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    unint64_t v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      BOOL v11 = "-[UAFAssetUtilitiesService _siriDownloadCompleteForLanguage:]";
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s #settings nil language", (uint8_t *)&v10, 0xCu);
    }
  }

LABEL_11:
}

- (void)_triggerCompletionTimerForLanguage:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  dispatch_time_t v6 = dispatch_time(0, 20000000000);
  v7 = [(UAFAssetUtilitiesService *)self statusQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__UAFAssetUtilitiesService__triggerCompletionTimerForLanguage___block_invoke;
  block[3] = &unk_264CEACE0;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v8 = v4;
  dispatch_after(v6, v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __63__UAFAssetUtilitiesService__triggerCompletionTimerForLanguage___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained uodAvailable] & 1) == 0)
  {
    dispatch_queue_t v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v13 = "-[UAFAssetUtilitiesService _triggerCompletionTimerForLanguage:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s #settings UOD status watchdog hit. Fetching status again. Language = %{public}@", buf, 0x16u);
    }

    [v4 updateSiriAssetAvailabilityForLanguageSync:*(void *)(a1 + 32)];
    dispatch_time_t v6 = dispatch_time(0, 20000000000);
    v7 = [v4 statusQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__UAFAssetUtilitiesService__triggerCompletionTimerForLanguage___block_invoke_298;
    v9[3] = &unk_264CEACE0;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 32);
    dispatch_after(v6, v7, v9);

    objc_destroyWeak(&v11);
  }
}

void __63__UAFAssetUtilitiesService__triggerCompletionTimerForLanguage___block_invoke_298(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained uodAvailable] & 1) == 0)
  {
    id v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315394;
      v7 = "-[UAFAssetUtilitiesService _triggerCompletionTimerForLanguage:]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s #settings UOD status watchdog hit. Download failed. Language = %{public}@", (uint8_t *)&v6, 0x16u);
    }

    [v3 _updateAssetState:4 value:0 forLanguage:*(void *)(a1 + 32)];
  }
}

- (BOOL)_isLegacySiriDevice
{
  BOOL v2 = +[UAFCommonUtilities deviceSupportAndUseHybridASR];
  return !+[UAFCommonUtilities deviceSupportFullUOD] && !v2;
}

- (id)getLanguage
{
  id v3 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__1;
  __int16 v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  id v4 = [(UAFAssetUtilitiesService *)self statusQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__UAFAssetUtilitiesService_getLanguage__block_invoke;
  v7[3] = &unk_264CEABF0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __39__UAFAssetUtilitiesService_getLanguage__block_invoke(uint64_t a1)
{
}

- (void)switchLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = [(UAFAssetUtilitiesService *)self statusQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__UAFAssetUtilitiesService_switchLanguage___block_invoke;
  block[3] = &unk_264CEB480;
  void block[4] = self;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = &v10;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v11 + 24)) {
    [(UAFAssetUtilitiesService *)self updateSiriAssetAvailabilityForLanguage:v6];
  }

  _Block_object_dispose(&v10, 8);
}

void __43__UAFAssetUtilitiesService_switchLanguage___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  if (([v2 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 32) _updateAssetState:2 value:0 forLanguage:*(void *)(a1 + 40)];
  }
}

- (void)postAssetNotificationIfNeeded
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    id v4 = "-[UAFAssetUtilitiesService postAssetNotificationIfNeeded]";
    _os_log_error_impl(&dword_23797A000, v2, OS_LOG_TYPE_ERROR, "%s #settings posting Siri notification not supported.", (uint8_t *)&v3, 0xCu);
  }
}

- (void)updateSiriAssetAvailabilityForObserver
{
  int v3 = [(UAFAssetUtilitiesService *)self statusGroup];
  id v4 = [(UAFAssetUtilitiesService *)self statusQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForObserver__block_invoke;
  block[3] = &unk_264CEAB50;
  void block[4] = self;
  dispatch_group_async(v3, v4, block);
}

uint64_t __66__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForObserver__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSiriAssetAvailabilityForLanguageSync:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)updateSiriAssetAvailabilityForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UAFAssetUtilitiesService *)self statusGroup];
  id v6 = [(UAFAssetUtilitiesService *)self statusQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguage___block_invoke;
  v8[3] = &unk_264CEAC18;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async(v5, v6, v8);
}

uint64_t __67__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSiriAssetAvailabilityForLanguageSync:*(void *)(a1 + 40)];
}

- (void)updateSiriAssetAvailabilityForLanguageSync:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    id location = 0;
    p_id location = &location;
    uint64_t v24 = 0x2050000000;
    id v7 = (id)getAFSettingsConnectionClass_softClass_0;
    uint64_t v25 = getAFSettingsConnectionClass_softClass_0;
    if (!getAFSettingsConnectionClass_softClass_0)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAFSettingsConnectionClass_block_invoke_0;
      v27 = &unk_264CEAD58;
      uint64_t v28 = &location;
      __getAFSettingsConnectionClass_block_invoke_0((uint64_t)buf);
      id v7 = p_location[3];
    }
    id v8 = (objc_class *)v7;
    _Block_object_dispose(&location, 8);
    id v9 = objc_alloc_init(v8);
    uint64_t v10 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[UAFAssetUtilitiesService updateSiriAssetAvailabilityForLanguageSync:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_23797A000, v10, OS_LOG_TYPE_DEFAULT, "%s #settings server UOD check for language %{public}@", buf, 0x16u);
    }

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguageSync___block_invoke;
    v17[3] = &unk_264CEB430;
    id v12 = v9;
    id v18 = v12;
    objc_copyWeak(&v21, &location);
    id v13 = v5;
    id v19 = v13;
    __int16 v14 = v11;
    v20 = v14;
    [v12 getAssetStatusForLanguage:v6 completionHandler:v17];
    dispatch_time_t v15 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v14, v15))
    {
      uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[UAFAssetUtilitiesService updateSiriAssetAvailabilityForLanguageSync:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assets availability due to timeout, language = %{public}@", buf, 0x16u);
      }
    }
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }
}

void __71__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguageSync___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained statusGroup];
    id v8 = [v6 statusQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguageSync___block_invoke_2;
    block[3] = &unk_264CEB408;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    id v10 = v3;
    id v11 = *(id *)(a1 + 40);
    dispatch_group_async(v7, v8, block);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    objc_destroyWeak(&v12);
  }
}

void __71__UAFAssetUtilitiesService_updateSiriAssetAvailabilityForLanguageSync___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateSiriAssetAvailability:*(void *)(a1 + 32) forLanguage:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_updateSiriAssetAvailability:(id)a3 forLanguage:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    id v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      id v18 = "-[UAFAssetUtilitiesService _updateSiriAssetAvailability:forLanguage:]";
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings update asset status %@ for language %{public}@", (uint8_t *)&v17, 0x20u);
    }

    if (+[UAFCommonUtilities deviceSupportFullUOD])
    {
      if (!+[UAFCommonUtilities isFullUODSupportedForStatus:v6 language:v7])
      {
LABEL_6:
        id v10 = [(UAFAssetUtilitiesService *)self assetStatus];
        uint64_t v11 = [v10 state];

        if (v11 == 5)
        {
          id v12 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = 136315394;
            id v18 = "-[UAFAssetUtilitiesService _updateSiriAssetAvailability:forLanguage:]";
            __int16 v19 = 2114;
            id v20 = v7;
            _os_log_impl(&dword_23797A000, v12, OS_LOG_TYPE_DEFAULT, "%s #settings forcing state to UAFAssetStateNotStarted due to sudden UOD unavailable for %{public}@...", (uint8_t *)&v17, 0x16u);
          }

          [(UAFAssetUtilitiesService *)self _updateAssetState:2 value:&unk_26EAA0E88 forLanguage:v7];
        }
        uint64_t v13 = 0;
LABEL_17:
        [(UAFAssetUtilitiesService *)self setUodAvailable:v13];
        goto LABEL_18;
      }
    }
    else if (!+[UAFCommonUtilities isHybridUODSupportedForStatus:v6 language:v7])
    {
      goto LABEL_6;
    }
    [(UAFAssetUtilitiesService *)self uodAvailable];
    __int16 v14 = [(UAFAssetUtilitiesService *)self assetStatus];
    uint64_t v15 = [v14 state];

    if (v15 != 5)
    {
      uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315394;
        id v18 = "-[UAFAssetUtilitiesService _updateSiriAssetAvailability:forLanguage:]";
        __int16 v19 = 2114;
        id v20 = v7;
        _os_log_impl(&dword_23797A000, v16, OS_LOG_TYPE_DEFAULT, "%s #settings forcing state to UAFAssetStateFinished due to sudden UOD available for %{public}@...", (uint8_t *)&v17, 0x16u);
      }

      [(UAFAssetUtilitiesService *)self _updateAssetState:5 value:0 forLanguage:v7];
    }
    uint64_t v13 = 1;
    goto LABEL_17;
  }
LABEL_18:
}

- (void)downloadDictationAssetsForLanguage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UAFAssetUtilitiesService *)self downloadQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__UAFAssetUtilitiesService_downloadDictationAssetsForLanguage___block_invoke;
  v7[3] = &unk_264CEAC18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __63__UAFAssetUtilitiesService_downloadDictationAssetsForLanguage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _downloadDictationAssetsForLanguage:*(void *)(a1 + 40) useCellular:0];
}

- (void)_downloadDictationAssetsForLanguage:(id)a3 useCellular:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(UAFAssetUtilitiesService *)self downloadQueue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    if (v4
      || +[UAFCommonUtilities isInexpensiveNetworkAvailable])
    {
      unint64_t v8 = [(UAFAssetUtilitiesService *)self _checkFreeSpaceNeededForLanguage:v6 isDictation:1];
      if (v8)
      {
        unint64_t v9 = v8;
        id v10 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v65 = 136315650;
          *(void *)&v65[4] = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
          *(_WORD *)&v65[12] = 2114;
          *(void *)&v65[14] = v6;
          *(_WORD *)&v65[22] = 2048;
          uint64_t v66 = v9;
          _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s #settings Download requested for Dictation assets (%{public}@) but hit out of space... %llu bytes needed", v65, 0x20u);
        }

        uint64_t v11 = [(UAFAssetUtilitiesService *)self statusQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_302;
        block[3] = &unk_264CEB458;
        void block[4] = self;
        unint64_t v53 = v9;
        id v52 = v6;
        dispatch_async(v11, block);
      }
      else
      {
        *(void *)v65 = 0;
        *(void *)&v65[8] = v65;
        *(void *)&v65[16] = 0x2020000000;
        uint64_t v66 = 2;
        uint64_t v13 = [(UAFAssetUtilitiesService *)self statusQueue];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_2;
        v48[3] = &unk_264CEB480;
        v50 = v65;
        v48[4] = self;
        __int16 v14 = v6;
        v49 = v14;
        dispatch_sync(v13, v48);

        if (*(void *)(*(void *)&v65[8] + 24) == 3)
        {
          uint64_t v15 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
            __int16 v63 = 2114;
            v64 = v14;
            _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, "%s #settings Already in progress download for dictation assets language %{public}@... Skipping...", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v15 = [v14 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
          id v18 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
            __int16 v63 = 2114;
            v64 = v15;
            _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s #settings Downloading dictation assets for language %{public}@...", buf, 0x16u);
          }

          v58 = v15;
          v59 = @"com.apple.siri.understanding";
          v57 = @"asr.language";
          __int16 v19 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          v60 = v19;
          id v35 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];

          id v36 = [@"dictation." stringByAppendingString:v15];
          v34 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:2592000.0];
          id v33 = [[UAFAssetSetSubscription alloc] initWithName:v36 assetSets:v35 usageAliases:0 expires:v34];
          dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
          objc_initWeak(&location, self);
          __int16 v21 = +[UAFAssetSetManager sharedManager];
          v56 = v33;
          id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v56 count:1];
          v43[0] = MEMORY[0x263EF8330];
          v43[1] = 3221225472;
          v43[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_313;
          v43[3] = &unk_264CEB4A8;
          objc_copyWeak(&v46, &location);
          uint64_t v23 = v14;
          v44 = v23;
          uint64_t v24 = v20;
          uint64_t v45 = v24;
          [v21 subscribe:@"com.apple.uaf.assetutil" subscriptions:v22 queue:0 completion:v43];

          dispatch_time_t v25 = dispatch_time(0, 3000000000);
          if (dispatch_semaphore_wait(v24, v25))
          {
            v26 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v62 = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
              __int16 v63 = 2114;
              v64 = v23;
              _os_log_error_impl(&dword_23797A000, v26, OS_LOG_TYPE_ERROR, "%s #settings Failed to subscribe to dictation language %{public}@ due to timeout", buf, 0x16u);
            }
          }
          else
          {
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_315;
            v40[3] = &unk_264CEB3E0;
            objc_copyWeak(&v42, &location);
            v27 = v23;
            v41 = v27;
            id v32 = (void *)MEMORY[0x237E26D50](v40);
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_2_316;
            v37[3] = &unk_264CEACE0;
            objc_copyWeak(&v39, &location);
            id v38 = v27;
            uint64_t v28 = (void *)MEMORY[0x237E26D50](v37);
            id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v29 addObject:@"UpdateNamespaces"];
            if (v4) {
              [v29 addObject:@"UseCellular"];
            }
            v30 = +[UAFAssetSetManager sharedManager];
            v31 = [(UAFAssetUtilitiesService *)self statusQueue];
            [v30 updateAssetsForSubscriber:@"com.apple.uaf.assetutil" subscriptionName:v36 policies:v29 queue:v31 progress:v32 completion:v28];

            objc_destroyWeak(&v39);
            objc_destroyWeak(&v42);
          }

          objc_destroyWeak(&v46);
          objc_destroyWeak(&location);
        }
        _Block_object_dispose(v65, 8);
      }
    }
    else
    {
      uint64_t v16 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v65 = 136315394;
        *(void *)&v65[4] = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
        *(_WORD *)&v65[12] = 2114;
        *(void *)&v65[14] = v6;
        _os_log_error_impl(&dword_23797A000, v16, OS_LOG_TYPE_ERROR, "%s #settings Cannot download Dictation assets for %{public}@ due to network connectivity...", v65, 0x16u);
      }

      int v17 = [(UAFAssetUtilitiesService *)self statusQueue];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke;
      v54[3] = &unk_264CEAC18;
      v54[4] = self;
      id v55 = v6;
      dispatch_async(v17, v54);
    }
  }
  else
  {
    id v12 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v65 = 136315138;
      *(void *)&v65[4] = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]";
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s #settings Cannot download Dictation assets due to nil language", v65, 0xCu);
    }
  }
}

uint64_t __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDictationState:2 value:0 forLanguage:*(void *)(a1 + 40)];
}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_302(void *a1)
{
  id v2 = (void *)a1[4];
  id v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v2 _updateDictationState:6 value:v3 forLanguage:a1[5]];
}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) dictationStatus];
  id v2 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 state];
}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_313(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = 136315650;
        unint64_t v8 = "-[UAFAssetUtilitiesService _downloadDictationAssetsForLanguage:useCellular:]_block_invoke";
        __int16 v9 = 2114;
        uint64_t v10 = v6;
        __int16 v11 = 2112;
        id v12 = v3;
        _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s #settings Failed to subscribe to dictation language %{public}@ due to error %@", (uint8_t *)&v7, 0x20u);
      }
    }
    else
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
  }
}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_315(uint64_t a1, uint64_t a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDictationProgress:(unint64_t)a3 status:a2 language:*(void *)(a1 + 32)];
}

void __76__UAFAssetUtilitiesService__downloadDictationAssetsForLanguage_useCellular___block_invoke_2_316(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDictationCompletionForLanguage:*(void *)(a1 + 32)];
}

- (void)_handleDictationProgress:(unint64_t)a3 status:(unint64_t)a4 language:(id)a5
{
  id v8 = a5;
  __int16 v9 = v8;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v11 = v8;
    [(UAFAssetUtilitiesService *)self _updateDictationProgress:a3 language:v8];
  }
  else
  {
    if (a4 == 4) {
      goto LABEL_8;
    }
    id v11 = v8;
    if (a4 == 5)
    {
      uint64_t v10 = [(UAFAssetUtilitiesService *)self _getDiskSpaceNeededInBytesForLanguage:v8 isDictation:1 error:0];
      [(UAFAssetUtilitiesService *)self _updateDictationState:6 value:v10 forLanguage:v11];
    }
    else
    {
      [(UAFAssetUtilitiesService *)self _updateDictationState:4 value:0 forLanguage:v8];
    }
  }
  __int16 v9 = v11;
LABEL_8:
}

- (void)_updateDictationProgress:(unint64_t)a3 language:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[UAFAssetUtilitiesService _updateDictationProgress:language:]";
    __int16 v13 = 1024;
    int v14 = a3;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s #settings Dictation download percent %d for language %{public}@", (uint8_t *)&v11, 0x1Cu);
  }

  if (a3 >= 0x63)
  {
    __int16 v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      id v12 = "-[UAFAssetUtilitiesService _updateDictationProgress:language:]";
      __int16 v13 = 1024;
      int v14 = 98;
      __int16 v15 = 2114;
      id v16 = v6;
      _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s #settings Download progress clamped to %d%% for language %{public}@", (uint8_t *)&v11, 0x1Cu);
    }

    a3 = 98;
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
  [(UAFAssetUtilitiesService *)self _updateDictationState:3 value:v10 forLanguage:v6];
}

- (void)_handleDictationCompletionForLanguage:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v14 = "-[UAFAssetUtilitiesService _handleDictationCompletionForLanguage:]";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl(&dword_23797A000, v6, OS_LOG_TYPE_DEFAULT, "%s #settings Dictation download complete for %{public}@", buf, 0x16u);
  }

  [(UAFAssetUtilitiesService *)self _updateDictationState:3 value:&unk_26EAA0E70 forLanguage:v4];
  objc_initWeak((id *)buf, self);
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  id v8 = [(UAFAssetUtilitiesService *)self statusQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__UAFAssetUtilitiesService__handleDictationCompletionForLanguage___block_invoke;
  v10[3] = &unk_264CEACE0;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v4;
  id v9 = v4;
  dispatch_after(v7, v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __66__UAFAssetUtilitiesService__handleDictationCompletionForLanguage___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained _updateDictationAvailabilityForLanguage:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v5 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[UAFAssetUtilitiesService _handleDictationCompletionForLanguage:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v8;
      _os_log_error_impl(&dword_23797A000, v5, OS_LOG_TYPE_ERROR, "%s #settings Dictation still not available after download completed for language %{public}@", buf, 0x16u);
    }

    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    dispatch_time_t v7 = [v4 statusQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__UAFAssetUtilitiesService__handleDictationCompletionForLanguage___block_invoke_317;
    v9[3] = &unk_264CEACE0;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 32);
    dispatch_after(v6, v7, v9);

    objc_destroyWeak(&v11);
  }
}

void __66__UAFAssetUtilitiesService__handleDictationCompletionForLanguage___block_invoke_317(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained _updateDictationAvailabilityForLanguage:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v4 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315394;
      dispatch_time_t v7 = "-[UAFAssetUtilitiesService _handleDictationCompletionForLanguage:]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s #settings Dictation still not available after retrying availability check for language %{public}@", (uint8_t *)&v6, 0x16u);
    }

    [v3 _updateDictationState:4 value:0 forLanguage:*(void *)(a1 + 32)];
  }
}

- (BOOL)_updateDictationAvailabilityForLanguage:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = +[UAFAssetStatus dictationAvailableForLanguage:v4];
  int v6 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  dispatch_time_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[UAFAssetUtilitiesService _updateDictationAvailabilityForLanguage:]";
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s #settings Dictation available for %{public}@", (uint8_t *)&v9, 0x16u);
    }

    [(UAFAssetUtilitiesService *)self _updateDictationState:5 value:0 forLanguage:v4];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[UAFAssetUtilitiesService _updateDictationAvailabilityForLanguage:]";
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s #settings Dictation still not available after successful download for language %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v5;
}

- (void)postDictationAssetNotificationForLanguage:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    BOOL v5 = "-[UAFAssetUtilitiesService postDictationAssetNotificationForLanguage:]";
    _os_log_error_impl(&dword_23797A000, v3, OS_LOG_TYPE_ERROR, "%s #settings posting Dictation notification not supported.", (uint8_t *)&v4, 0xCu);
  }
}

- (NSMutableDictionary)dictationStatus
{
  dictationStatus = self->_dictationStatus;
  if (!dictationStatus)
  {
    int v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    BOOL v5 = self->_dictationStatus;
    self->_dictationStatus = v4;

    dictationStatus = self->_dictationStatus;
  }

  return dictationStatus;
}

- (void)_updateDictationState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5
{
  id v18 = a5;
  id v8 = a4;
  int v9 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [(UAFAssetUtilitiesService *)self dictationStatus];
  __int16 v11 = [v10 objectForKeyedSubscript:v18];

  if (!v11)
  {
    id v12 = objc_alloc_init(UAFAssetStatus);
    uint64_t v13 = [(UAFAssetUtilitiesService *)self dictationStatus];
    [v13 setObject:v12 forKeyedSubscript:v18];
  }
  __int16 v14 = [(UAFAssetUtilitiesService *)self dictationStatus];
  uint64_t v15 = [v14 objectForKeyedSubscript:v18];
  [v15 setState:a3];

  uint64_t v16 = [(UAFAssetUtilitiesService *)self dictationStatus];
  uint64_t v17 = [v16 objectForKeyedSubscript:v18];
  [v17 setValue:v8];
}

- (UAFAssetStatus)assetStatus
{
  assetStatus = self->_assetStatus;
  if (!assetStatus)
  {
    int v4 = objc_alloc_init(UAFAssetStatus);
    BOOL v5 = self->_assetStatus;
    self->_assetStatus = v4;

    assetStatus = self->_assetStatus;
  }

  return assetStatus;
}

- (void)checkAssetStatus:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_not_V2(v5);

  if (v4)
  {
    uint64_t v6 = [(UAFAssetUtilitiesService *)self statusQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __45__UAFAssetUtilitiesService_checkAssetStatus___block_invoke;
    v8[3] = &unk_264CEB4D0;
    v8[4] = self;
    int v9 = v4;
    dispatch_async(v6, v8);

    dispatch_time_t v7 = v9;
  }
  else
  {
    dispatch_time_t v7 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v11 = "-[UAFAssetUtilitiesService checkAssetStatus:]";
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s #settings nil completion", buf, 0xCu);
    }
  }
}

void __45__UAFAssetUtilitiesService_checkAssetStatus___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) assetStatus];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)updateAssetState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_not_V2(v10);

  __int16 v11 = [(UAFAssetUtilitiesService *)self statusQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__UAFAssetUtilitiesService_updateAssetState_value_forLanguage___block_invoke;
  v14[3] = &unk_264CEB2E0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

uint64_t __63__UAFAssetUtilitiesService_updateAssetState_value_forLanguage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAssetState:*(void *)(a1 + 56) value:*(void *)(a1 + 40) forLanguage:*(void *)(a1 + 48)];
}

- (void)_updateAssetState:(unint64_t)a3 value:(id)a4 forLanguage:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(UAFAssetUtilitiesService *)self statusQueue];
  dispatch_assert_queue_V2(v10);

  if (v9
    || (+[UAFCommonUtilities currentAssistantLanguage],
        (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    __int16 v11 = [v9 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    id v12 = [(UAFAssetUtilitiesService *)self assetStatus];
    [v12 setState:a3];

    id v13 = [(UAFAssetUtilitiesService *)self assetStatus];
    [v13 setValue:v8];

    __int16 v14 = [(UAFAssetUtilitiesService *)self assetStatus];
    [v14 setSiriLanguage:v11];

    id v15 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = +[UAFAssetStatus stringFromUAFAssetState:a3];
      int v17 = 136315906;
      id v18 = "-[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:]";
      __int16 v19 = 2114;
      dispatch_semaphore_t v20 = v11;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, "%s #settings Updated Siri asset status for %{public}@ with state %@ and value %@", (uint8_t *)&v17, 0x2Au);
    }
    [(UAFAssetUtilitiesService *)self _postAssetStateChangedNotification];
  }
  else
  {
    id v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      id v18 = "-[UAFAssetUtilitiesService _updateAssetState:value:forLanguage:]";
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s #settings nil language", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)_postAssetStateChangedNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"kUAFAssetStatusDidChangeDarwinNotification", 0, 0, 1u);
}

- (void)diskSpaceNeededInBytesForLanguage:(id)a3 forClient:(unint64_t)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, NSObject *))a5;
  if (v9)
  {
    id v12 = 0;
    uint64_t v10 = [(UAFAssetUtilitiesService *)self _getDiskSpaceNeededInBytesForLanguage:v8 isDictation:a4 == 1 error:&v12];
    __int16 v11 = v12;
    v9[2](v9, v10, v11);
  }
  else
  {
    __int16 v11 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[UAFAssetUtilitiesService diskSpaceNeededInBytesForLanguage:forClient:completion:]";
      __int16 v15 = 2114;
      id v16 = v8;
      _os_log_error_impl(&dword_23797A000, v11, OS_LOG_TYPE_ERROR, "%s #settings diskSpaceNeededInBytesForLanguage with nil completion, language = %{public}@", buf, 0x16u);
    }
  }
}

- (id)_getDiskSpaceNeededInBytesForLanguage:(id)a3 isDictation:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v27[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (v7)
  {
    id v8 = @"com.apple.siri.assistant";
    if (v6) {
      id v8 = @"com.apple.uaf.assetutil";
    }
    id v9 = v8;
    if (v6)
    {
      uint64_t v10 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
      __int16 v11 = [@"dictation." stringByAppendingString:v10];
    }
    else
    {
      __int16 v11 = 0;
    }
    __int16 v15 = +[UAFAssetSetManager sharedManager];
    id v16 = [v15 diskSpaceNeededForSubscriber:v9 subscriptionName:v11 error:a5];

    uint64_t v17 = [v16 unsignedLongLongValue];
    id v18 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      dispatch_semaphore_t v20 = v16;
      if (v19)
      {
        int v22 = 136315394;
        __int16 v23 = "-[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:]";
        __int16 v24 = 2048;
        uint64_t v25 = [v16 unsignedLongLongValue];
        _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s #settings return size %llu", (uint8_t *)&v22, 0x16u);
        dispatch_semaphore_t v20 = v16;
      }
    }
    else
    {
      dispatch_semaphore_t v20 = &unk_26EAA0EA0;
      if (v19)
      {
        int v22 = 136315394;
        __int16 v23 = "-[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:]";
        __int16 v24 = 2048;
        uint64_t v25 = [&unk_26EAA0EA0 unsignedLongLongValue];
        _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s #settings return default size %llu", (uint8_t *)&v22, 0x16u);
      }
    }

    id v14 = v20;
    goto LABEL_17;
  }
  id v12 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v22 = 136315138;
    __int16 v23 = "-[UAFAssetUtilitiesService _getDiskSpaceNeededInBytesForLanguage:isDictation:error:]";
    _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s #settings nil language", (uint8_t *)&v22, 0xCu);
  }

  if (a5)
  {
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08338];
    v27[0] = @"nil language";
    id v9 = [NSDictionary dictionaryWithObjects:v27 forKeys:&v26 count:1];
    *a5 = [v13 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:-1 userInfo:v9];
    id v14 = &unk_26EAA0E58;
LABEL_17:

    goto LABEL_18;
  }
  id v14 = &unk_26EAA0E58;
LABEL_18:

  return v14;
}

- (unint64_t)_checkFreeSpaceNeededForLanguage:(id)a3 isDictation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v14 = 0;
  id v7 = [(UAFAssetUtilitiesService *)self _getDiskSpaceNeededInBytesForLanguage:v6 isDictation:v4 error:&v14];
  id v8 = v14;
  if (v8)
  {
    id v9 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v16 = "-[UAFAssetUtilitiesService _checkFreeSpaceNeededForLanguage:isDictation:]";
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v6;
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s #settings Failed to check assets download size due to error %@, language = %{public}@", buf, 0x20u);
    }
  }
  uint64_t v10 = [v7 unsignedLongLongValue];
  if (v10)
  {
    unint64_t v11 = +[UAFCommonUtilities getFreeDiskSpaceNeededInBytes:v10];
  }
  else
  {
    id v12 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[UAFAssetUtilitiesService _checkFreeSpaceNeededForLanguage:isDictation:]";
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_error_impl(&dword_23797A000, v12, OS_LOG_TYPE_ERROR, "%s #settings Returning enough space for assets even with an unknown size requested, language = %{public}@", buf, 0x16u);
    }

    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)uodAvailable
{
  return self->_uodAvailable;
}

- (void)setUodAvailable:(BOOL)a3
{
  self->_uodAvailable = a3;
}

- (OS_dispatch_group)statusGroup
{
  return self->_statusGroup;
}

- (void)setStatusGroup:(id)a3
{
}

- (OS_dispatch_queue)statusQueue
{
  return self->_statusQueue;
}

- (void)setStatusQueue:(id)a3
{
}

- (OS_dispatch_queue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
}

- (void)setAssetStatus:(id)a3
{
}

- (void)setDictationStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationStatus, 0);
  objc_storeStrong((id *)&self->_assetStatus, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_statusQueue, 0);
  objc_storeStrong((id *)&self->_statusGroup, 0);

  objc_storeStrong((id *)&self->_siriLanguage, 0);
}

@end