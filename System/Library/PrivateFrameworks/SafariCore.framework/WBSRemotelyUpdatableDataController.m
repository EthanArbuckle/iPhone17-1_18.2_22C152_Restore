@interface WBSRemotelyUpdatableDataController
+ (WBSRemotelyUpdatableDataController)new;
- (BOOL)_shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:(id)a3;
- (BOOL)dataIsUsedByMultipleProcesses;
- (BOOL)shouldAttemptToDownloadConfiguration;
- (BOOL)shouldAttemptToUpdateConfiguration;
- (BOOL)shouldKeepBuiltInSnapshotLoaded;
- (WBSRemotelyUpdatableDataController)init;
- (WBSRemotelyUpdatableDataController)initWithDataFormat:(int64_t)a3 builtInListURL:(id)a4 downloadsDirectoryURL:(id)a5 resourceName:(id)a6 resourceVersion:(id)a7 updateDateDefaultsKey:(id)a8 updateInterval:(double)a9 snapshotClass:(Class)a10 snapshotTransformerClass:(Class)a11;
- (WBSRemotelyUpdatableDataController)initWithDataFormat:(int64_t)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8 snapshotClass:(Class)a9 snapshotTransformerClass:(Class)a10 builtInDataProvider:(id)a11;
- (WBSRemotelyUpdatableDataControllerDelegate)delegate;
- (id)_downloadedListResourceName;
- (id)_fileExtensionForData;
- (id)_lastConfigurationUpdateAttemptDate;
- (id)_urlOfDownloadedList;
- (id)_urlOfInternalOverrideList;
- (id)fetchDataFromRemotelyLoadedSnapshotFallingBackToBuiltInSnapshot:(id)a3;
- (void)_didDownloadSnapshot:(id)a3;
- (void)_loadBuiltInSnapshotIfNeeded;
- (void)_loadDownloadedSnapshotIfNeeded;
- (void)_resetUpdateTimer;
- (void)_setCurrentDateAsLastConfigurationUpdateAttemptDate;
- (void)_setUpDownloadedFileMonitoring;
- (void)_stopDownloadedFileMonitoring;
- (void)_updateDownloadedDataIfNecessary;
- (void)_writeConfigurationData:(id)a3;
- (void)accessBuiltInAndRemotelyLoadedSnapshots:(id)a3;
- (void)accessCurrentSnapshot:(id)a3;
- (void)accessSnapshotLoadingItIfNeeded:(id)a3;
- (void)dealloc;
- (void)prepareForTermination;
- (void)setDataIsUsedByMultipleProcesses:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldAttemptToDownloadConfiguration:(BOOL)a3;
- (void)setShouldAttemptToUpdateConfiguration:(BOOL)a3;
- (void)setShouldKeepBuiltInSnapshotLoaded:(BOOL)a3;
@end

@implementation WBSRemotelyUpdatableDataController

- (void)setShouldAttemptToUpdateConfiguration:(BOOL)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke;
  v4[3] = &unk_1E615CB20;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(internalQueue, v4);
}

- (WBSRemotelyUpdatableDataController)initWithDataFormat:(int64_t)a3 builtInListURL:(id)a4 downloadsDirectoryURL:(id)a5 resourceName:(id)a6 resourceVersion:(id)a7 updateDateDefaultsKey:(id)a8 updateInterval:(double)a9 snapshotClass:(Class)a10 snapshotTransformerClass:(Class)a11
{
  id v18 = a4;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __199__WBSRemotelyUpdatableDataController_initWithDataFormat_builtInListURL_downloadsDirectoryURL_resourceName_resourceVersion_updateDateDefaultsKey_updateInterval_snapshotClass_snapshotTransformerClass___block_invoke;
  v22[3] = &unk_1E615CAF8;
  id v23 = v18;
  id v19 = v18;
  v20 = [(WBSRemotelyUpdatableDataController *)self initWithDataFormat:a3 downloadsDirectoryURL:a5 resourceName:a6 resourceVersion:a7 updateDateDefaultsKey:a8 updateInterval:a10 snapshotClass:a9 snapshotTransformerClass:a11 builtInDataProvider:v22];

  return v20;
}

- (WBSRemotelyUpdatableDataController)initWithDataFormat:(int64_t)a3 downloadsDirectoryURL:(id)a4 resourceName:(id)a5 resourceVersion:(id)a6 updateDateDefaultsKey:(id)a7 updateInterval:(double)a8 snapshotClass:(Class)a9 snapshotTransformerClass:(Class)a10 builtInDataProvider:(id)a11
{
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a11;
  v41.receiver = self;
  v41.super_class = (Class)WBSRemotelyUpdatableDataController;
  v24 = [(WBSRemotelyUpdatableDataController *)&v41 init];
  v25 = v24;
  if (v24)
  {
    v24->_dataFormat = a3;
    uint64_t v26 = [v23 copy];
    id builtInListDataProvider = v25->_builtInListDataProvider;
    v25->_id builtInListDataProvider = (id)v26;

    objc_storeStrong((id *)&v25->_downloadsDirectoryURL, a4);
    uint64_t v28 = [v20 copy];
    resourceName = v25->_resourceName;
    v25->_resourceName = (NSString *)v28;

    uint64_t v30 = [v21 copy];
    resourceVersion = v25->_resourceVersion;
    v25->_resourceVersion = (NSString *)v30;

    uint64_t v32 = [v22 copy];
    updateDateDefaultsKey = v25->_updateDateDefaultsKey;
    v25->_updateDateDefaultsKey = (NSString *)v32;

    v25->_snapshotClass = a9;
    v25->_snapshotTransformerClass = a10;
    v25->_updateInterval = a8;
    v25->_shouldAttemptToDownloadConfiguration = 1;
    v34 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v35 = dispatch_queue_create("com.apple.SafariCore.RemotelyUpdatableDataController.internalQueue", v34);
    internalQueue = v25->_internalQueue;
    v25->_internalQueue = (OS_dispatch_queue *)v35;

    dispatch_queue_t v37 = dispatch_queue_create("com.apple.SafariCore.RemotelyUpdatableDataController.diskWriteQueue", v34);
    diskWriteQueue = v25->_diskWriteQueue;
    v25->_diskWriteQueue = (OS_dispatch_queue *)v37;

    v39 = v25;
  }

  return v25;
}

- (void)setDelegate:(id)a3
{
}

- (void)setShouldKeepBuiltInSnapshotLoaded:(BOOL)a3
{
  self->_shouldKeepBuiltInSnapshotLoaded = a3;
}

- (void)setDataIsUsedByMultipleProcesses:(BOOL)a3
{
  if (self->_dataIsUsedByMultipleProcesses != a3)
  {
    self->_dataIsUsedByMultipleProcesses = a3;
    if (a3) {
      [(WBSRemotelyUpdatableDataController *)self _setUpDownloadedFileMonitoring];
    }
    else {
      [(WBSRemotelyUpdatableDataController *)self _stopDownloadedFileMonitoring];
    }
  }
}

- (void)_setUpDownloadedFileMonitoring
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  v4 = __error();
  BOOL v5 = strerror(*v4);
  int v6 = 136315394;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  v9 = v5;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Unable to open file (%s) for monitoring: %s", (uint8_t *)&v6, 0x16u);
}

- (BOOL)dataIsUsedByMultipleProcesses
{
  return self->_dataIsUsedByMultipleProcesses;
}

uint64_t __70__WBSRemotelyUpdatableDataController_accessSnapshotLoadingItIfNeeded___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _loadDownloadedSnapshotIfNeeded];
  [*(id *)(a1 + 32) _loadBuiltInSnapshotIfNeeded];
  [*(id *)(a1 + 32) _updateDownloadedDataIfNecessary];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_updateDownloadedDataIfNecessary
{
  if (self->_shouldAttemptToDownloadConfiguration)
  {
    v3 = [(WBSRemotelyUpdatableDataController *)self _lastConfigurationUpdateAttemptDate];
    BOOL v4 = [(WBSRemotelyUpdatableDataController *)self _shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:v3];

    if (v4)
    {
      [(WBSConfigurationDownloader *)self->_configurationDownloader cancel];
      BOOL v5 = [WBSConfigurationDownloader alloc];
      int v6 = [(WBSRemotelyUpdatableDataController *)self _downloadedListResourceName];
      id v7 = objc_alloc_init(self->_snapshotTransformerClass);
      __int16 v8 = [(WBSConfigurationDownloader *)v5 initWithFileName:v6 dataTransformer:v7];
      configurationDownloader = self->_configurationDownloader;
      self->_configurationDownloader = v8;

      [(WBSRemotelyUpdatableDataController *)self _setCurrentDateAsLastConfigurationUpdateAttemptDate];
      objc_initWeak(&location, self);
      uint64_t v10 = self->_configurationDownloader;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __70__WBSRemotelyUpdatableDataController__updateDownloadedDataIfNecessary__block_invoke;
      v11[3] = &unk_1E615CB70;
      objc_copyWeak(&v12, &location);
      [(WBSConfigurationDownloader *)v10 downloadConfigurationWithCompletionHandler:v11];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)_shouldUpdateConfigurationGivenLastConfigurationUpdateAttemptDate:(id)a3
{
  if (!a3) {
    return 1;
  }
  [a3 timeIntervalSinceNow];
  return self->_updateInterval < -v4;
}

- (void)_loadDownloadedSnapshotIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a2;
  int v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1B728F000, v5, OS_LOG_TYPE_ERROR, "The downloaded data file (%@) could not be loaded: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (id)_urlOfInternalOverrideList
{
  v3 = NSString;
  double v4 = [(WBSRemotelyUpdatableDataController *)self _fileExtensionForData];
  BOOL v5 = [v3 stringWithFormat:@"Override%@.%@", v4, self->_resourceName];

  int v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = objc_msgSend(v6, "safari_settingsDirectoryURL");
  uint64_t v8 = [v7 URLByAppendingPathComponent:v5 isDirectory:0];

  return v8;
}

- (id)_urlOfDownloadedList
{
  downloadsDirectoryURL = self->_downloadsDirectoryURL;
  resourceName = self->_resourceName;
  double v4 = [(WBSRemotelyUpdatableDataController *)self _fileExtensionForData];
  BOOL v5 = [(NSString *)resourceName stringByAppendingPathExtension:v4];
  int v6 = [(NSURL *)downloadsDirectoryURL URLByAppendingPathComponent:v5 isDirectory:0];

  return v6;
}

- (id)_fileExtensionForData
{
  if (self->_dataFormat) {
    return @"json";
  }
  else {
    return @"plist";
  }
}

- (void)_loadBuiltInSnapshotIfNeeded
{
  id v3 = a1;
  double v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "The built-in data could not be loaded into current snapshot: %{public}@", v7, v8, v9, v10, 2u);
}

- (id)_lastConfigurationUpdateAttemptDate
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v4 = objc_msgSend(v3, "safari_dateForKey:", self->_updateDateDefaultsKey);

  return v4;
}

id __199__WBSRemotelyUpdatableDataController_initWithDataFormat_builtInListURL_downloadsDirectoryURL_resourceName_resourceVersion_updateDateDefaultsKey_updateInterval_snapshotClass_snapshotTransformerClass___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v6 = 0;
  v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v1 options:0 error:&v6];
  id v3 = v6;
  if (!v2)
  {
    double v4 = WBS_LOG_CHANNEL_PREFIXRemotelyUpdatableDataController();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __199__WBSRemotelyUpdatableDataController_initWithDataFormat_builtInListURL_downloadsDirectoryURL_resourceName_resourceVersion_updateDateDefaultsKey_updateInterval_snapshotClass_snapshotTransformerClass___block_invoke_cold_1(v4, v3);
    }
  }

  return v2;
}

void __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = *(unsigned char *)(a1 + 40);
  uint64_t v1 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    if (!v1[16])
    {
      objc_initWeak(&location, v1);
      id v3 = (void *)MEMORY[0x1E4F1CB00];
      double v4 = *(double *)(*(void *)(a1 + 32) + 88);
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      id v12 = __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_2;
      v13 = &unk_1E615B1B0;
      objc_copyWeak(&v14, &location);
      uint64_t v5 = [v3 timerWithTimeInterval:1 repeats:&v10 block:v4];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(v6 + 128);
      *(void *)(v6 + 128) = v5;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 128), "setTolerance:", *(double *)(*(void *)(a1 + 32) + 88) * 0.1, v10, v11, v12, v13);
      uint64_t v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v8 addTimer:*(void *)(*(void *)(a1 + 32) + 128) forMode:*MEMORY[0x1E4F1C3A0]];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v9 = *(void **)(a1 + 32);
    [v9 _resetUpdateTimer];
  }
}

- (void)accessSnapshotLoadingItIfNeeded:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WBSRemotelyUpdatableDataController_accessSnapshotLoadingItIfNeeded___block_invoke;
  v7[3] = &unk_1E615A6A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (WBSRemotelyUpdatableDataController)init
{
  return 0;
}

+ (WBSRemotelyUpdatableDataController)new
{
  return 0;
}

- (void)dealloc
{
  [(WBSRemotelyUpdatableDataController *)self _stopDownloadedFileMonitoring];
  v3.receiver = self;
  v3.super_class = (Class)WBSRemotelyUpdatableDataController;
  [(WBSRemotelyUpdatableDataController *)&v3 dealloc];
}

void __68__WBSRemotelyUpdatableDataController__setUpDownloadedFileMonitoring__block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained[18];
    if (v3) {
      dispatch_source_cancel(v3);
    }
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v2[2]);
    dispatch_queue_t v5 = v2[18];
    v2[18] = v4;

    id v6 = v2[18];
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    id v8 = v2[18];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__WBSRemotelyUpdatableDataController__setUpDownloadedFileMonitoring__block_invoke_2;
    handler[3] = &unk_1E615A768;
    handler[4] = v2;
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(v2[18]);
  }
}

void __68__WBSRemotelyUpdatableDataController__setUpDownloadedFileMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  dispatch_queue_t v5 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = 0;

  [*(id *)(a1 + 32) _loadDownloadedSnapshotIfNeeded];
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 didDownloadDataForRemotelyUpdatableDataController:*(void *)(a1 + 32)];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 144);
  *(void *)(v7 + 144) = 0;
}

- (void)_stopDownloadedFileMonitoring
{
  downloadedFileChangedSource = self->_downloadedFileChangedSource;
  if (downloadedFileChangedSource)
  {
    dispatch_source_cancel(downloadedFileChangedSource);
    downloadedFileChangedSource = self->_downloadedFileChangedSource;
  }
  self->_downloadedFileChangedSource = 0;
}

- (id)_downloadedListResourceName
{
  return (id)[NSString stringWithFormat:@"%@-%@", self->_resourceName, self->_resourceVersion];
}

void __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)WeakRetained + 20);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v3 shouldRemotelyUpdatableDataControllerUpdateOnSchedule:v2] & 1) == 0)
    {
      dispatch_queue_t v5 = v2[2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_3;
      block[3] = &unk_1E615A768;
      block[4] = v2;
      dispatch_sync(v5, block);
    }
    else
    {
      uint64_t v4 = v2[2];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_4;
      v6[3] = &unk_1E615A768;
      v6[4] = v2;
      dispatch_async(v4, v6);
    }
  }
}

uint64_t __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetUpdateTimer];
}

uint64_t __76__WBSRemotelyUpdatableDataController_setShouldAttemptToUpdateConfiguration___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDownloadedDataIfNecessary];
}

- (void)_resetUpdateTimer
{
  [(NSTimer *)self->_updateTimer invalidate];
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;
}

void __70__WBSRemotelyUpdatableDataController__updateDownloadedDataIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (v3 && WeakRetained)
  {
    uint64_t v7 = WeakRetained[2];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__WBSRemotelyUpdatableDataController__updateDownloadedDataIfNecessary__block_invoke_2;
    v8[3] = &unk_1E615CB48;
    objc_copyWeak(&v10, v4);
    id v9 = v3;
    dispatch_async(v7, v8);

    objc_destroyWeak(&v10);
  }
}

void __70__WBSRemotelyUpdatableDataController__updateDownloadedDataIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    [WeakRetained _didDownloadSnapshot:*(void *)(a1 + 32)];
    id v3 = objc_loadWeakRetained(v4 + 20);
    if (objc_opt_respondsToSelector()) {
      [v3 didDownloadDataForRemotelyUpdatableDataController:v4];
    }

    id WeakRetained = v4;
  }
}

- (void)_didDownloadSnapshot:(id)a3
{
  id v7 = a3;
  dispatch_queue_t v5 = [(WBSRemotelyUpdatableDataController *)self _urlOfDownloadedList];

  if (v5 && ([v7 isEqual:self->_currentSnapshot] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_remotelyLoadedSnapshot, a3);
    objc_storeStrong((id *)&self->_currentSnapshot, a3);
    id v6 = [(WBSRemotelyUpdatableDataSnapshot *)self->_currentSnapshot snapshotData];
    [(WBSRemotelyUpdatableDataController *)self _writeConfigurationData:v6];
  }
}

- (void)_writeConfigurationData:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [(WBSRemotelyUpdatableDataController *)self _stopDownloadedFileMonitoring];
  diskWriteQueue = self->_diskWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSRemotelyUpdatableDataController__writeConfigurationData___block_invoke;
  block[3] = &unk_1E615CB48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(diskWriteQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__WBSRemotelyUpdatableDataController__writeConfigurationData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = [WeakRetained _urlOfDownloadedList];
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    dispatch_queue_t v5 = [v3 URLByDeletingLastPathComponent];
    id v6 = (id)objc_msgSend(v4, "safari_ensureDirectoryExists:", v5);

    [*(id *)(a1 + 32) writeToURL:v3 atomically:1];
    [v7 _setUpDownloadedFileMonitoring];

    id WeakRetained = v7;
  }
}

- (void)prepareForTermination
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WBSRemotelyUpdatableDataController_prepareForTermination__block_invoke;
  block[3] = &unk_1E615A768;
  void block[4] = self;
  dispatch_sync(internalQueue, block);
}

void __59__WBSRemotelyUpdatableDataController_prepareForTermination__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetUpdateTimer];
  [*(id *)(*(void *)(a1 + 32) + 120) cancel];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;
}

- (void)accessCurrentSnapshot:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__WBSRemotelyUpdatableDataController_accessCurrentSnapshot___block_invoke;
  v7[3] = &unk_1E615A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __60__WBSRemotelyUpdatableDataController_accessCurrentSnapshot___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 112));
}

- (void)accessBuiltInAndRemotelyLoadedSnapshots:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WBSRemotelyUpdatableDataController_accessBuiltInAndRemotelyLoadedSnapshots___block_invoke;
  v7[3] = &unk_1E615A870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

uint64_t __78__WBSRemotelyUpdatableDataController_accessBuiltInAndRemotelyLoadedSnapshots___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 96), *(void *)(*(void *)(a1 + 32) + 104));
}

- (id)fetchDataFromRemotelyLoadedSnapshotFallingBackToBuiltInSnapshot:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__WBSRemotelyUpdatableDataController_fetchDataFromRemotelyLoadedSnapshotFallingBackToBuiltInSnapshot___block_invoke;
  v8[3] = &unk_1E615CB98;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(WBSRemotelyUpdatableDataController *)self accessBuiltInAndRemotelyLoadedSnapshots:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __102__WBSRemotelyUpdatableDataController_fetchDataFromRemotelyLoadedSnapshotFallingBackToBuiltInSnapshot___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = v3;
  if (!v3)
  {
    id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  if (!v3) {
}
  }

- (void)_setCurrentDateAsLastConfigurationUpdateAttemptDate
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setObject:v3 forKey:self->_updateDateDefaultsKey];
}

- (WBSRemotelyUpdatableDataControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSRemotelyUpdatableDataControllerDelegate *)WeakRetained;
}

- (BOOL)shouldAttemptToUpdateConfiguration
{
  return self->_shouldAttemptToUpdateConfiguration;
}

- (BOOL)shouldAttemptToDownloadConfiguration
{
  return self->_shouldAttemptToDownloadConfiguration;
}

- (void)setShouldAttemptToDownloadConfiguration:(BOOL)a3
{
  self->_shouldAttemptToDownloadConfiguration = a3;
}

- (BOOL)shouldKeepBuiltInSnapshotLoaded
{
  return self->_shouldKeepBuiltInSnapshotLoaded;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_downloadedFileChangedCoalescingSource, 0);
  objc_storeStrong((id *)&self->_downloadedFileChangedSource, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_configurationDownloader, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_remotelyLoadedSnapshot, 0);
  objc_storeStrong((id *)&self->_builtInSnapshot, 0);
  objc_storeStrong((id *)&self->_updateDateDefaultsKey, 0);
  objc_storeStrong((id *)&self->_resourceVersion, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_downloadsDirectoryURL, 0);
  objc_storeStrong(&self->_builtInListDataProvider, 0);
  objc_storeStrong((id *)&self->_diskWriteQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __199__WBSRemotelyUpdatableDataController_initWithDataFormat_builtInListURL_downloadsDirectoryURL_resourceName_resourceVersion_updateDateDefaultsKey_updateInterval_snapshotClass_snapshotTransformerClass___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v5, v6, "The built-in data file could not be loaded: %{public}@", v7, v8, v9, v10, 2u);
}

@end