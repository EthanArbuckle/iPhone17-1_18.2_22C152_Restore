@interface SUDownloader
+ (id)purgeOptionsForDescriptor:(id)a3 downloadOptions:(id)a4 completionQueue:(id)a5;
- (BOOL)_isWithinAutoDownloadWindowForPolicy:(id)a3 descriptor:(id)a4;
- (BOOL)_reapplyExistingDownloadPolicyIfDownloadable:(BOOL)a3;
- (BOOL)_shouldSendUpdatedProgressToDelegate;
- (BOOL)cancelDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6;
- (BOOL)downloadStateResetSinceStartup;
- (BOOL)goNonDiscretionaryOnDownload;
- (BOOL)isClearingSpace;
- (BOOL)isDownloadHalted;
- (BOOL)isDownloading;
- (BOOL)isForeground;
- (BOOL)isReadyForDownload:(id)a3 error:(id *)a4;
- (BOOL)isSplatDownload;
- (BOOL)isUpdateDownloaded;
- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6;
- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 forUpdates:(id)a6 error:(id *)a7;
- (BOOL)needToWaitForUnlockForLoadingBrainForDescriptor:(id)a3;
- (BOOL)updateDownloadOptions:(id)a3 error:(id *)a4;
- (MAAsset)downloadAsset;
- (NSDate)downloadProgressSnapshotDate;
- (SUDescriptor)brainLoadedForDescriptor;
- (SUDescriptor)loadBrainForDescriptor;
- (SUDownload)download;
- (SUDownloader)initWithCore:(id)a3;
- (SUManagerCore)core;
- (SUOperationProgress)downloadProgressSnapshot;
- (id)slaVersion;
- (int)_orderForPhase:(id)a3;
- (unint64_t)brainLoadAttemptsForDescriptor;
- (void)_changeDownloadPhase:(id)a3 progress:(float)a4 timeRemaining:(double)a5;
- (void)_downloadFailedWithError:(id)a3;
- (void)_downloadFinished:(BOOL)a3;
- (void)_downloadInvalidatedWithUpdates:(id)a3;
- (void)_loadBrainOnUnlockCallback;
- (void)_notePhaseCompleted:(id)a3;
- (void)_setDownloadDiscretionary:(BOOL)a3;
- (void)_snapshotProgress;
- (void)_updateLastSavedDownloadsOptions:(id)a3;
- (void)_updateNormalizedDownloadProgress;
- (void)_updateNormalizedDownloadProgressAndNotifyDelegate;
- (void)autoUpdateFound:(id)a3 downloadNow:(BOOL)a4;
- (void)cleanupPreviousDownloadState:(BOOL)a3;
- (void)dealloc;
- (void)deviceIsUpToDate;
- (void)downloadCompleted:(id)a3;
- (void)downloadCompleted:(id)a3 informClients:(BOOL)a4;
- (void)downloadProgress:(id)a3;
- (void)endAutoDownloadTasksAndResetState;
- (void)ensureSSOTokenIfNeededForDownload:(id)a3;
- (void)loadBrainOnUnlockForDescriptor:(id)a3;
- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4;
- (void)noteAutoDownloadFailedToStart:(id)a3 withError:(id)a4;
- (void)noteAutoDownloadFailedToStartWithError:(id)a3;
- (void)notifyClientOfClearingSpace:(BOOL)a3;
- (void)operatorBundleChanged;
- (void)resetDownloadStateOnStartup;
- (void)setBrainLoadAttemptsForDescriptor:(unint64_t)a3;
- (void)setBrainLoadedForDescriptor:(id)a3;
- (void)setClearingSpace:(BOOL)a3;
- (void)setCore:(id)a3;
- (void)setDownload:(id)a3;
- (void)setDownloadAsset:(id)a3;
- (void)setDownloadProgressSnapshot:(id)a3;
- (void)setDownloadProgressSnapshotDate:(id)a3;
- (void)setDownloadStateResetSinceStartup:(BOOL)a3;
- (void)setDownloading:(BOOL)a3;
- (void)setForeground:(BOOL)a3;
- (void)setGoNonDiscretionaryOnDownload:(BOOL)a3;
- (void)setLoadBrainForDescriptor:(id)a3;
- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)tryAutoDownload;
@end

@implementation SUDownloader

- (void)setForeground:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUDownloader *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_foreground != v3)
  {
    self->_foreground = v3;
    v14 = @"No";
    if (v3) {
      v14 = @"Yes";
    }
    SULogDebug(@"Foreground status changed: isForeground? %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
    if (self->_downloading && self->_foreground)
    {
      SULogDebug(@"Updating download options for foreground status change if necessary.", v15, v16, v17, v18, v19, v20, v21, v22);
      [(SUDownloader *)self _setDownloadDiscretionary:0];
    }
  }
}

- (SUDownload)download
{
  BOOL v3 = [(SUDownloader *)self core];
  v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  download = self->_download;
  return download;
}

- (SUManagerCore)core
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_core);
  return (SUManagerCore *)WeakRetained;
}

- (SUDownloader)initWithCore:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUDownloader;
  v5 = [(SUDownloader *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_core, v4);
    *(_DWORD *)&v6->_foreground = 0;
    downloadAsset = v6->_downloadAsset;
    v6->_downloadAsset = 0;

    download = v6->_download;
    v6->_download = 0;

    downloadProgressSnapshot = v6->_downloadProgressSnapshot;
    v6->_downloadProgressSnapshot = 0;

    uint64_t v10 = [MEMORY[0x263EFF910] now];
    downloadProgressSnapshotDate = v6->_downloadProgressSnapshotDate;
    v6->_downloadProgressSnapshotDate = (NSDate *)v10;

    uint64_t v12 = +[SUNetworkMonitor sharedInstance];
    [v12 addObserver:v6];

    v6->_goNonDiscretionaryOnDownload = 0;
    brainLoadedForDescriptor = v6->_brainLoadedForDescriptor;
    v6->_brainLoadedForDescriptor = 0;

    v6->_brainLoadAttemptsForDescriptor = 0;
  }

  return v6;
}

- (void)dealloc
{
  BOOL v3 = +[SUNetworkMonitor sharedInstance];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SUDownloader;
  [(SUDownloader *)&v5 dealloc];
}

- (BOOL)isDownloading
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_downloading;
}

- (void)setDownloading:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SUDownloader *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_downloading != v3)
  {
    self->_downloading = v3;
    if (v3)
    {
      id v7 = +[SUTransactionManager sharedInstance];
      [v7 beginTransaction:@"downloading" keepAlive:1];
    }
    else
    {
      self->_downloadStateResetSinceStartup = 1;
      id v7 = +[SUTransactionManager sharedInstance];
      [v7 endTransaction:@"downloading"];
    }
  }
}

- (BOOL)isForeground
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_foreground;
}

- (BOOL)isClearingSpace
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_clearingSpace;
}

- (void)setClearingSpace:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SUDownloader *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_clearingSpace != v3)
  {
    self->_BOOL clearingSpace = v3;
    v14 = @"No";
    if (v3) {
      v14 = @"Yes";
    }
    SULogDebug(@"ClearingSpace status changed: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
    BOOL clearingSpace = self->_clearingSpace;
    [(SUDownloader *)self notifyClientOfClearingSpace:clearingSpace];
  }
}

- (MAAsset)downloadAsset
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  downloadAsset = self->_downloadAsset;
  return downloadAsset;
}

- (void)setDownloadAsset:(id)a3
{
  id v4 = (MAAsset *)a3;
  objc_super v5 = [(SUDownloader *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  downloadAsset = self->_downloadAsset;
  self->_downloadAsset = v4;
}

- (void)setDownload:(id)a3
{
  id v4 = (SUDownload *)a3;
  objc_super v5 = [(SUDownloader *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  download = self->_download;
  self->_download = v4;
  uint64_t v8 = v4;

  LODWORD(download) = [(SUDownload *)v8 isPromoted];
  if (download)
  {
    [(SUDownloader *)self setGoNonDiscretionaryOnDownload:1];
  }
}

- (void)_setDownloadDiscretionary:(BOOL)a3
{
  objc_super v5 = [(SUDownloader *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (!a3)
  {
    uint64_t v7 = [(SUDownloader *)self download];

    if (v7)
    {
      uint64_t v8 = [(SUDownloader *)self download];
      [v8 setPromoted:1];

      uint64_t v9 = [(SUDownloader *)self core];
      uint64_t v10 = [v9 state];
      uint64_t v11 = [v10 lastDownload];

      if (v11)
      {
        [v11 setPromoted:1];
        uint64_t v12 = [(SUDownloader *)self core];
        uint64_t v13 = [v12 state];
        [v13 setLastDownload:v11];

        v14 = [(SUDownloader *)self core];
        objc_super v15 = [v14 state];
        [v15 save];
      }
    }
  }
  uint64_t v16 = self->_downloadAsset;
  uint64_t v17 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUDownloader__setDownloadDiscretionary___block_invoke;
  block[3] = &unk_26447CED8;
  BOOL v22 = a3;
  uint64_t v20 = v16;
  uint64_t v21 = self;
  uint64_t v18 = v16;
  dispatch_async(v17, block);
}

void __42__SUDownloader__setDownloadDiscretionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = *(void **)(a1 + 32);
  if (v10)
  {
    if (([v10 refreshState] & 1) == 0) {
      SULogInfo(@"Could not determine state of asset while trying to adjust priority, attempting anyway", v11, v12, v13, v14, v15, v16, v17, v35);
    }
    if ([*(id *)(a1 + 32) state] == 4)
    {
      id v36 = (id)objc_opt_new();
      [v36 setDiscretionary:*(unsigned __int8 *)(a1 + 48)];
      if ([*(id *)(a1 + 32) configDownloadSync:v36]) {
        SULogInfo(@"Attempt to change download priority failed", v18, v19, v20, v21, v22, v23, v24, v35);
      }
    }
    else if (!*(unsigned char *)(a1 + 48))
    {
      v25 = *(void **)(a1 + 32);
      [v25 state];
      SULogInfo(@"Attempt to change download priority for asset:%@, asset state is %ld, postponing to download start", v26, v27, v28, v29, v30, v31, v32, (uint64_t)v25);
      v33 = [*(id *)(a1 + 40) core];
      v34 = [v33 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__SUDownloader__setDownloadDiscretionary___block_invoke_2;
      block[3] = &unk_26447C878;
      void block[4] = *(void *)(a1 + 40);
      dispatch_async(v34, block);
    }
  }
  else
  {
    SULogInfo(@"Attempted to change download priority of a nil asset", a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t __42__SUDownloader__setDownloadDiscretionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"Setting goNonDiscretionaryOnDownload to YES", a2, a3, a4, a5, a6, a7, a8, v11);
  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 setGoNonDiscretionaryOnDownload:1];
}

- (void)resetDownloadStateOnStartup
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  if (self->_downloadStateResetSinceStartup)
  {
    SULogInfo(@"Not resetting download state on start up since it was already reset", v5, v6, v7, v8, v9, v10, v11, v16);
  }
  else
  {
    uint64_t v12 = [(SUDownloader *)self core];
    uint64_t v13 = [v12 state];
    [v13 setLastDownload:0];

    [(SUDownloader *)self setDownload:0];
    [(SUDownloader *)self setDownloading:0];
    [(SUDownloader *)self setDownloadAsset:0];
    [(SUDownloader *)self setGoNonDiscretionaryOnDownload:0];
    id v14 = [(SUDownloader *)self core];
    [v14 clearUnlockCallbacks];
  }
}

- (void)autoUpdateFound:(id)a3 downloadNow:(BOOL)a4
{
  id v42 = a3;
  uint64_t v6 = [(SUDownloader *)self core];
  uint64_t v7 = [v6 workQueue];
  dispatch_assert_queue_V2(v7);

  SULogInfo(@"Auto scan found update available: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v42);
  uint64_t v15 = [(SUDownloader *)self download];
  if (!v15) {
    goto LABEL_16;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = [(SUDownloader *)self download];
  uint64_t v18 = [v17 downloadOptions];
  char v19 = [v18 isAutoDownload];

  if ((v19 & 1) == 0)
  {
    uint64_t v23 = [(SUDownloader *)self download];
    uint64_t v24 = [v23 progress];
    int v25 = [v24 isDone];
    v33 = @"ing";
    if (v25) {
      v33 = @"ed";
    }
    SULogInfo(@"User initiated update download%@. Skipping auto download", v26, v27, v28, v29, v30, v31, v32, (uint64_t)v33);

    uint64_t v22 = +[SUScheduler sharedInstance];
    [v22 cancelAllAutoDownloadTasks];
  }
  else
  {
LABEL_16:
    if (a4
      || (+[SUPreferences sharedInstance],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          char v21 = [v20 disableAutoDownloadJitter],
          v20,
          (v21 & 1) != 0))
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:", (double)+[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 0, 3600));
      SULogInfo(@"Random jittering enabled for this auto download; will start downloading after %@",
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        (uint64_t)v22);
    }
    v41 = +[SUScheduler sharedInstance];
    [v41 scheduleAutoDownloadWithDate:v22 requirePower:0 minimumPowerRquirement:0];

    [(SUDownloader *)self loadBrainOnUnlockForDescriptor:v42];
  }
}

- (BOOL)isReadyForDownload:(id)a3 error:(id *)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(SUDownloader *)self core];
  uint64_t v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(SUDownloader *)self core];
  uint64_t v10 = [v6 descriptor];
  uint64_t v11 = [v9 coreDescriptorForSUDescriptor:v10];

  if (!v11)
  {
    uint64_t v12 = [(SUDownloader *)self core];
    uint64_t v11 = [v12 preferredLastScannedDescriptor];

    if (!v11)
    {
      +[SUUtility assignError:a4 withCode:3];
      goto LABEL_8;
    }
  }
  if ([(SUDownloader *)self isDownloading]) {
    goto LABEL_6;
  }
  if (![(SUDownloader *)self isClearingSpace])
  {
    uint64_t v23 = [(SUDownloader *)self core];
    int v24 = [v23 isInstalling];

    if (v24)
    {
      uint64_t v20 = a4;
      uint64_t v21 = 14;
      goto LABEL_7;
    }
    int v25 = [(SUDownloader *)self core];
    uint64_t v26 = [v25 preferredLastScannedDescriptor];

    if (!v26)
    {
      uint64_t v20 = a4;
      uint64_t v21 = 3;
      goto LABEL_7;
    }
    download = self->_download;
    if (download)
    {
      uint64_t v28 = [(SUDownload *)download descriptor];
      BOOL v29 = +[SUManagerEngine SUDescriptor:v28 matchesSUCoreDescriptor:v11];

      if (v29)
      {
        SULogInfo(@"Attempted to download update that's already on disk and downloaded.", v30, v31, v32, v33, v34, v35, v36, v76);
        uint64_t v20 = a4;
        uint64_t v21 = 41;
        goto LABEL_7;
      }
    }
    uint64_t v37 = [(SUDownloader *)self core];
    uint64_t v38 = [v37 state];
    uint64_t v39 = [v38 failedPatchDescriptors];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v40 = v39;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v79 objects:v85 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v80;
      while (2)
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v80 != v43) {
            objc_enumerationMutation(v40);
          }
          if (+[SUManagerEngine SUDescriptor:*(void *)(*((void *)&v79 + 1) + 8 * i) matchesSUCoreDescriptor:v11])
          {
            char v45 = 1;
            goto LABEL_28;
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v79 objects:v85 count:16];
        if (v42) {
          continue;
        }
        break;
      }
    }
    char v45 = 0;
LABEL_28:

    if ([v6 isAutoDownload])
    {
      v46 = [v11 prerequisiteBuild];

      char v54 = v45 ^ 1;
      if (!v46) {
        char v54 = 1;
      }
      if ((v54 & 1) == 0)
      {
        SULogInfo(@"Auto download attempted to download failed patch descriptor", v47, v48, v49, v50, v51, v52, v53, v76);
        id v78 = 0;
        +[SUUtility assignError:&v78 withCode:53];
        id v55 = v78;
        if (!a4)
        {
LABEL_43:

          goto LABEL_9;
        }
        v83 = @"SUAutoDownloadWillRetry";
        v56 = [NSNumber numberWithBool:1];
        v84 = v56;
        v57 = [NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
        *a4 = +[SUUtility translateError:v55 withAddedUserInfo:v57];

LABEL_40:
        LOBYTE(a4) = 0;
        goto LABEL_43;
      }
    }
    id v55 = [v11 getMASoftwareUpdateAsset];
    if (v55)
    {
      v65 = +[SUNetworkMonitor sharedInstance];
      if ([v65 isCurrentNetworkTypeCellular])
      {
        char v66 = [v6 isEnabledForCellular];

        if ((v66 & 1) == 0)
        {
          v67 = a4;
          uint64_t v68 = 81;
LABEL_39:
          +[SUUtility assignError:v67 withCode:v68];
          goto LABEL_40;
        }
      }
      else
      {
      }
      LOBYTE(a4) = 1;
      goto LABEL_43;
    }
    SULogInfo(@"assetToDownloadFromLastScan is nil, trying to locally find a matching asset for descriptor:%@", v58, v59, v60, v61, v62, v63, v64, (uint64_t)v11);
    SULogInfo(@"Could not find a matching asset, fail with no update found", v69, v70, v71, v72, v73, v74, v75, v77);
    v67 = a4;
    uint64_t v68 = 3;
    goto LABEL_39;
  }
  SULogInfo(@"Another download is already clearing space for download", v13, v14, v15, v16, v17, v18, v19, v76);
LABEL_6:
  uint64_t v20 = a4;
  uint64_t v21 = 11;
LABEL_7:
  +[SUUtility assignError:v20 withCode:v21];

LABEL_8:
  LOBYTE(a4) = 0;
LABEL_9:

  return (char)a4;
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUDownloader *)self core];
  uint64_t v9 = [(id)v8 workQueue];
  dispatch_assert_queue_V2(v9);

  id v50 = 0;
  LOBYTE(v8) = [(SUDownloader *)self isReadyForDownload:v6 error:&v50];
  id v10 = v50;
  if (v8)
  {
    uint64_t v11 = (SUDownloadOptions *)v6;
    uint64_t v12 = v11;
    uint64_t v39 = v7;
    id v40 = v6;
    id v38 = v10;
    if (v11)
    {
      uint64_t v20 = [(SUDownloadOptions *)v11 descriptor];
      if (v20)
      {
        uint64_t v21 = [(SUDownloader *)self core];
        uint64_t v22 = [v21 coreDescriptorForSUDescriptor:v20];

        uint64_t v23 = [v22 getMASoftwareUpdateAsset];
        int v24 = v20;
        int v25 = v22;
        uint64_t v26 = v12;
        if (v23)
        {
LABEL_14:
          [(SUDownloader *)self ensureSSOTokenIfNeededForDownload:v26];
          [(SUDownloader *)self setClearingSpace:1];
          BOOL v29 = [(SUDownloader *)self core];
          uint64_t v30 = [v29 workQueue];
          uint64_t v31 = +[SUDownloader purgeOptionsForDescriptor:v24 downloadOptions:v26 completionQueue:v30];

          uint64_t v32 = +[SUUtility taskQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke;
          block[3] = &unk_26447EF68;
          id v42 = v31;
          id v43 = v24;
          v44 = v26;
          char v45 = self;
          id v7 = v39;
          id v49 = v39;
          v46 = v12;
          id v47 = v23;
          id v48 = v25;
          id v33 = v25;
          id v34 = v23;
          uint64_t v35 = v26;
          id v36 = v24;
          id v37 = v31;
          dispatch_async(v32, block);

          id v6 = v40;
          id v10 = v38;
          goto LABEL_15;
        }
LABEL_11:
        uint64_t v27 = [(SUDownloader *)self core];
        int v25 = [v27 preferredLastScannedDescriptor];

        int v24 = +[SUManagerEngine SUDescriptorFromCoreDescriptor:v25];

        uint64_t v28 = [(SUDownloader *)self core];
        uint64_t v23 = [v28 preferredAssetToDownloadFromLastScan];

        if (v12) {
          uint64_t v26 = v12;
        }
        else {
          uint64_t v26 = [[SUDownloadOptions alloc] initWithDescriptor:v24];
        }
        goto LABEL_14;
      }
      SULogInfo(@"descriptor not found in download options: %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);
    }
    else
    {
      uint64_t v20 = 0;
    }
    uint64_t v22 = 0;
    goto LABEL_11;
  }
  if (v7) {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
  }
LABEL_15:
}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_2;
  v5[3] = &unk_26447EF40;
  uint64_t v2 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v12 = *(id *)(a1 + 88);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  +[SUSpace makeRoomForUpdate:v2 completion:v5];
}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v134[0] = MEMORY[0x263EF8330];
  v134[1] = 3221225472;
  v134[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_3;
  v134[3] = &unk_26447EEF8;
  id v135 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v136 = v6;
  uint64_t v137 = v7;
  id v138 = *(id *)(a1 + 80);
  uint64_t v8 = (void (**)(void, void))MEMORY[0x223C18480](v134);
  [*(id *)(a1 + 48) setClearingSpace:0];
  if (a2)
  {
    id v9 = [*(id *)(a1 + 48) core];
    uint64_t v10 = [v9 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_4;
    block[3] = &unk_26447C8C8;
    void block[4] = *(void *)(a1 + 48);
    id v133 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)v10, block);

    id v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    id v128 = 0;
    LOBYTE(v10) = [v11 isReadyForDownload:v12 error:&v128];
    id v13 = v128;
    if (v10)
    {
      id v14 = *(id *)(a1 + 56);
      if (!*(void *)(a1 + 56))
      {
        uint64_t v15 = [[SUDownloadOptions alloc] initWithDescriptor:*(void *)(a1 + 32)];

        id v14 = v15;
      }
      uint64_t v127 = 0;
      uint64_t v16 = [v14 activeDownloadPolicy];
      if (([v16 isDownloadableForCurrentNetworkConditions:&v127 cellularFeesApply:0] & 1) == 0)
      {
        SULogInfo(@"Download policy prevents download: %ld", v17, v18, v19, v20, v21, v22, v23, v127);
        id v126 = v13;
        +[SUUtility assignError:&v126 withCode:v127];
        id v44 = v126;

        ((void (**)(void, id))v8)[2](v8, v44);
        id v13 = v44;
LABEL_36:

        goto LABEL_37;
      }
      if ([v14 activeDownloadPolicyType] != 1) {
        [*(id *)(a1 + 48) endAutoDownloadTasksAndResetState];
      }
      [*(id *)(a1 + 48) cleanupPreviousDownloadState:0];
      [*(id *)(a1 + 48) setDownloadAsset:*(void *)(a1 + 64)];
      [v14 setActiveDownloadPolicy:v16];
      int v24 = objc_alloc_init(SUDownload);
      int v25 = objc_alloc_init(SUOperationProgress);
      [(SUOperationProgress *)v25 setIsDone:0];
      [(SUOperationProgress *)v25 setPhase:@"SUDownloadPhaseStarting"];
      v111 = v25;
      [(SUDownload *)v24 setProgress:v25];
      [(SUDownload *)v24 setDescriptor:*(void *)(a1 + 32)];
      v116 = v24;
      [(SUDownload *)v24 setDownloadOptions:v14];
      uint64_t v26 = *(unsigned char **)(a1 + 48);
      id v115 = v5;
      v112 = v16;
      uint64_t v113 = (uint64_t)v14;
      if (v26[16])
      {
        if ([v14 isAutoDownload])
        {
          SULogInfo(@"Starting auto download while client in foreground, go non discretionary once download start", v27, v28, v29, v30, v31, v32, v33, v105);
          [*(id *)(a1 + 48) setGoNonDiscretionaryOnDownload:1];
          [(SUDownload *)v24 setPromoted:1];
LABEL_19:
          id v114 = v13;
          [*(id *)(a1 + 48) setDownload:v24];
          char v45 = [*(id *)(a1 + 48) core];
          v46 = [v45 state];
          [v46 setLastDownload:v24];

          id v47 = [*(id *)(a1 + 48) core];
          id v48 = [v47 state];
          [v48 save];

          id v49 = [*(id *)(a1 + 48) core];
          id v50 = [*(id *)(a1 + 48) core];
          objc_msgSend(v49, "updateInstallPolicyAutoUpdateEnabled:", objc_msgSend(v50, "isAutoUpdateEnabled"));

          [*(id *)(a1 + 48) setDownloading:1];
          uint64_t v51 = [*(id *)(a1 + 48) core];
          uint64_t v52 = [v51 delegate];
          char v53 = objc_opt_respondsToSelector();

          if (v53)
          {
            char v54 = [*(id *)(a1 + 48) core];
            id v55 = [v54 externWorkQueue];
            v124[0] = MEMORY[0x263EF8330];
            v124[1] = 3221225472;
            v124[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_6;
            v124[3] = &unk_26447C8C8;
            v124[4] = *(void *)(a1 + 48);
            v125 = v24;
            dispatch_async(v55, v124);
          }
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          v56 = [*(id *)(a1 + 48) core];
          v57 = [v56 observers];
          uint64_t v58 = [v57 allObjects];

          uint64_t v59 = [v58 countByEnumeratingWithState:&v120 objects:v139 count:16];
          if (v59)
          {
            uint64_t v60 = v59;
            uint64_t v61 = *(void *)v121;
            do
            {
              for (uint64_t i = 0; i != v60; ++i)
              {
                if (*(void *)v121 != v61) {
                  objc_enumerationMutation(v58);
                }
                uint64_t v63 = *(void *)(*((void *)&v120 + 1) + 8 * i);
                if (objc_opt_respondsToSelector())
                {
                  uint64_t v64 = [*(id *)(a1 + 48) core];
                  [v64 externWorkQueue];
                  char v66 = v65 = a1;
                  v118[0] = MEMORY[0x263EF8330];
                  v118[1] = 3221225472;
                  v118[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_7;
                  v118[3] = &unk_26447C8C8;
                  v118[4] = v63;
                  v119 = v116;
                  dispatch_async(v66, v118);

                  a1 = v65;
                }
              }
              uint64_t v60 = [v58 countByEnumeratingWithState:&v120 objects:v139 count:16];
            }
            while (v60);
          }

          if ([*(id *)(a1 + 48) _reapplyExistingDownloadPolicyIfDownloadable:0])
          {
            [*(id *)(a1 + 48) core];
            uint64_t v68 = v67 = a1;
            uint64_t v69 = [v68 engine];
            [v69 createBrainLoadLockAssertion:&__block_literal_global_20];

            uint64_t v70 = +[SUPreferences sharedInstance];
            LODWORD(v69) = [v70 skipDownload];

            id v5 = v115;
            id v13 = v114;
            if (v69)
            {
              SULogInfo(@"SUSkipDownload is set, skip the download phase and return YES.", v71, v72, v73, v74, v75, v76, v77, v105);
              dispatch_time_t v78 = dispatch_time(0, 5000000000);
              long long v79 = [*(id *)(v67 + 48) core];
              long long v80 = [v79 workQueue];
              v117[0] = MEMORY[0x263EF8330];
              v117[1] = 3221225472;
              v117[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_9;
              v117[3] = &unk_26447C878;
              v117[4] = *(void *)(v67 + 48);
              dispatch_after(v78, v80, v117);

              v8[2](v8, 0);
              id v14 = (id)v113;
            }
            else
            {
              v109 = [SUManagerEngineDownloadDescriptor alloc];
              uint64_t v107 = *(void *)(v67 + 64);
              v106 = [*(id *)(v67 + 32) releaseDate];
              v108 = [*(id *)(v67 + 48) core];
              v90 = [v108 sessionID];
              v91 = [*(id *)(v67 + 48) core];
              v92 = [v91 lastScannedDescriptorScanOptions];
              v93 = [*(id *)(v67 + 48) core];
              v94 = (void *)[v93 newInstallTonightConfig];
              id v14 = (id)v113;
              v110 = [(SUManagerEngineDownloadDescriptor *)v109 initWithAsset:v107 releaseDate:v106 sessionID:v90 scanOptions:v92 downloadOptions:v113 installTonightConfig:v94 coreDescriptor:*(void *)(v67 + 72) downloadAtPhase:1];

              v95 = [*(id *)(v67 + 48) core];
              [v95 dismissInsufficientDiskSpaceFollowupForUpdate:0 orForce:1];

              SULogInfo(@"Starting SU download with options: %@", v96, v97, v98, v99, v100, v101, v102, v113);
              v103 = [*(id *)(v67 + 48) core];
              v104 = [v103 engine];
              [v104 downloadUpdate:v110];

              v8[2](v8, 0);
            }
          }
          else
          {
            v8[2](v8, 0);
            SULogInfo(@"_reapplyExistingDownloadPolicyIfDownloadable returned NO. Bailing on download", v81, v82, v83, v84, v85, v86, v87, v105);
            v88 = *(void **)(a1 + 48);
            v89 = +[SUUtility errorWithCode:31];
            [v88 _downloadFailedWithError:v89];

            id v5 = v115;
            id v14 = (id)v113;
            id v13 = v114;
          }

          uint64_t v16 = v112;
          goto LABEL_36;
        }
        uint64_t v26 = *(unsigned char **)(a1 + 48);
      }
      [v26 setGoNonDiscretionaryOnDownload:0];
      goto LABEL_19;
    }
    uint64_t v43 = *(void *)(a1 + 80);
    if (v43) {
      (*(void (**)(uint64_t, void, id))(v43 + 16))(v43, 0, v13);
    }
  }
  else
  {
    if ([*(id *)(a1 + 40) isAutoDownload])
    {
      uint64_t v41 = [*(id *)(a1 + 48) core];
      id v42 = [v41 workQueue];
      v130[0] = MEMORY[0x263EF8330];
      v130[1] = 3221225472;
      v130[2] = __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_5;
      v130[3] = &unk_26447C8C8;
      v130[4] = *(void *)(a1 + 48);
      id v131 = *(id *)(a1 + 32);
      dispatch_async(v42, v130);
    }
    SULogInfo(@"Download failed due to insufficient space: %@", v34, v35, v36, v37, v38, v39, v40, (uint64_t)v5);
    id v129 = 0;
    +[SUUtility assignError:withCode:](SUUtility, "assignError:withCode:", &v129, [v5 code]);
    id v13 = v129;
    ((void (**)(void, id))v8)[2](v8, v13);
  }
LABEL_37:
}

uint64_t __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    id v3 = objc_alloc_init(SUDownload);
    [(SUDownload *)v3 setDescriptor:*(void *)(a1 + 32)];
    [(SUDownload *)v3 setDownloadOptions:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) setDownload:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 48) core];
  [v4 reportOTAStartedDownloadingEvent:v9];

  id v5 = [*(id *)(a1 + 48) core];
  [v5 reportCoreAnalyticsOTAStartedDownloadingEvent:v9];

  id v6 = v9;
  if (v9)
  {
    [*(id *)(a1 + 48) setDownload:0];
    id v6 = v9;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, BOOL, id))(v7 + 16))(v7, v6 == 0, v9);
    id v6 = v9;
  }
  return MEMORY[0x270F9A758](v7, v6);
}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 dismissInsufficientDiskSpaceFollowupForUpdate:*(void *)(a1 + 40) orForce:0];
}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_5(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isDownloading] & 1) == 0
    && ([*(id *)(a1 + 32) isUpdateDownloaded] & 1) == 0)
  {
    id v2 = [*(id *)(a1 + 32) core];
    [v2 showInsufficientDiskSpaceFollowupForUpdate:*(void *)(a1 + 40)];
  }
}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_6(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 downloadDidStart:*(void *)(a1 + 40)];
}

uint64_t __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) downloadDidStart:*(void *)(a1 + 40)];
}

void __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    SULogInfo(@"Failed to create brain load lock assertion: %@", a2, a3, a4, a5, a6, a7, a8, a2);
  }
}

uint64_t __52__SUDownloader_startDownloadWithOptions_withResult___block_invoke_9(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  id v3 = [v2 state];
  uint64_t v4 = [v3 lastDownload];
  id v5 = [v4 progress];
  [v5 setPhase:@"SUDownloadPhasePreparingForInstallation"];

  id v6 = *(void **)(a1 + 32);
  return [v6 downloadCompleted:0];
}

- (void)notifyClientOfClearingSpace:(BOOL)a3
{
  id v5 = [(SUDownloader *)self core];
  id v6 = [v5 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = self->_download;
    id v9 = [(SUDownloader *)self core];
    uint64_t v10 = [v9 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__SUDownloader_notifyClientOfClearingSpace___block_invoke;
    block[3] = &unk_26447CED8;
    void block[4] = self;
    id v13 = v8;
    BOOL v14 = a3;
    id v11 = v8;
    dispatch_async(v10, block);
  }
}

void __44__SUDownloader_notifyClientOfClearingSpace___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 clearingSpaceForDownload:*(void *)(a1 + 40) clearing:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)_reapplyExistingDownloadPolicyIfDownloadable:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUDownloader *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  char v7 = [(SUDownload *)self->_download downloadOptions];
  uint64_t v8 = [v7 activeDownloadPolicy];
  int v9 = [v8 isDownloadable];
  if (v9)
  {
    [v7 setActiveDownloadPolicy:v8];
    if (v3) {
      [(SUDownloader *)self _setDownloadDiscretionary:0];
    }
    [(SUDownloader *)self _updateLastSavedDownloadsOptions:v7];
  }

  return v9;
}

- (void)_updateLastSavedDownloadsOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(SUDownloader *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  char v7 = [(SUDownloader *)self core];
  uint64_t v8 = [v7 state];
  id v13 = [v8 lastDownload];

  [v13 setDownloadOptions:v4];
  int v9 = [(SUDownloader *)self core];
  uint64_t v10 = [v9 state];
  [v10 setLastDownload:v13];

  id v11 = [(SUDownloader *)self core];
  uint64_t v12 = [v11 state];
  [v12 save];
}

- (void)_loadBrainOnUnlockCallback
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SUDownloader *)self core];
  [v5 removeUnlockCallback:@"unlockCallbackLoadBrain"];

  id v13 = [(SUDownloader *)self loadBrainForDescriptor];
  if (!v13)
  {
    SULogInfo(@"%s: No descriptor, skip preloading brain on unlock", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
    goto LABEL_12;
  }
  BOOL v14 = +[SUPreferences sharedInstance];
  char v15 = [v14 autoInstallSecurityResponse];

  uint64_t v16 = +[SUPreferences sharedInstance];
  int v17 = [v16 isAutoDownloadDisabled];

  if ([v13 isSplatOnly])
  {
    if ((v15 & 1) == 0)
    {
      SULogInfo(@"%s: Auto install security response disabled. No need to preload brain", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
      goto LABEL_12;
    }
  }
  else if (v17)
  {
    SULogInfo(@"%s: Auto download disabled via preferences. No need to preload brain", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
    goto LABEL_12;
  }
  int v25 = [(SUDownloader *)self download];

  if (v25)
  {
    SULogInfo(@"%s: Found existing download, skip preloading brain", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
  }
  else if ([v13 rampEnabled])
  {
    SULogInfo(@"%s: Ramp is enabled for asset, skip preloading brain", v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
  }
  else
  {
    uint64_t v40 = +[SUNetworkMonitor sharedInstance];
    int v41 = [v40 currentNetworkType];

    if (v41 == 1)
    {
      id v49 = [(SUDownloader *)self core];
      id v50 = [v49 coreDescriptorForSUDescriptor:v13];

      uint64_t v51 = objc_opt_new();
      [v51 setDiscretionary:0];
      [v51 setAllowsCellularAccess:0];
      uint64_t v52 = [(SUDownloader *)self core];
      int v53 = [v52 isManaged];

      if (v53)
      {
        [v51 setSupervised:1];
        char v54 = [v50 productVersion];
        [v51 setRequestedProductVersion:v54];
      }
      id v55 = [v50 assetAudienceUUID];

      if (v55)
      {
        v56 = [v50 assetAudienceUUID];
        v57 = (void *)[v56 copy];
        [v51 setLiveAssetAudienceUUID:v57];
      }
      uint64_t v58 = [v50 getMASoftwareUpdateAsset];
      if (!v58)
      {
        uint64_t v59 = [(SUDownloader *)self core];
        uint64_t v58 = [v59 preferredAssetToDownloadFromLastScan];
      }
      uint64_t v60 = (void *)[objc_alloc(MEMORY[0x263F55A88]) initWithUpdateAsset:v58];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __42__SUDownloader__loadBrainOnUnlockCallback__block_invoke;
      v63[3] = &unk_26447EF90;
      v63[4] = self;
      id v64 = v58;
      id v65 = v13;
      id v61 = v58;
      [v60 loadUpdateBrainWithMAOptions:v51 progressHandler:v63];
    }
    else
    {
      SULogInfo(@"%s: Skip brain preload when not on wifi", v42, v43, v44, v45, v46, v47, v48, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]");
      uint64_t v62 = [(SUDownloader *)self core];
      [v62 addUnlockCallback:sel__loadBrainOnUnlockCallback forKey:@"unlockCallbackLoadBrain"];
    }
  }
LABEL_12:
}

void __42__SUDownloader__loadBrainOnUnlockCallback__block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  SULogInfo(@"%s: Got brain load progress: %@, error: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]_block_invoke");
  uint64_t v12 = [v18 objectForKeyedSubscript:*MEMORY[0x263F55918]];

  int v13 = [v12 isEqualToString:*MEMORY[0x263F55908]];
  if (a3 || v13)
  {
    BOOL v14 = [a1[4] core];
    char v15 = [v14 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__SUDownloader__loadBrainOnUnlockCallback__block_invoke_2;
    block[3] = &unk_26447CD70;
    id v16 = a1[5];
    id v17 = a1[4];
    id v20 = v16;
    id v21 = v17;
    id v22 = a1[6];
    dispatch_async(v15, block);
  }
}

void __42__SUDownloader__loadBrainOnUnlockCallback__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) attributes];
  BOOL v3 = SUCoreBorder_MSUBrainIsLoadable();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setBrainLoadAttemptsForDescriptor:", objc_msgSend(*(id *)(a1 + 40), "brainLoadAttemptsForDescriptor") + 1);
    if ((unint64_t)[*(id *)(a1 + 40) brainLoadAttemptsForDescriptor] < 5)
    {
      [*(id *)(a1 + 40) brainLoadAttemptsForDescriptor];
      SULogInfo(@"%s: brain is not loaded on attempt %lu, add unlock callback", v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]_block_invoke_2");
      id v25 = [*(id *)(a1 + 40) core];
      [v25 addUnlockCallback:sel__loadBrainOnUnlockCallback forKey:@"unlockCallbackLoadBrain"];
    }
    else
    {
      SULogInfo(@"%s: brain is not loaded, but reached max attempts", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]_block_invoke_2");
    }
  }
  else
  {
    [*(id *)(a1 + 40) setBrainLoadedForDescriptor:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) setLoadBrainForDescriptor:0];
    SULogInfo(@"%s: brain is loaded", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUDownloader _loadBrainOnUnlockCallback]_block_invoke_2");
  }
}

- (void)loadBrainOnUnlockForDescriptor:(id)a3
{
  id v22 = a3;
  uint64_t v4 = [(SUDownloader *)self core];
  uint64_t v5 = [v4 workQueue];
  dispatch_assert_queue_V2(v5);

  if (v22)
  {
    uint64_t v13 = [(SUDownloader *)self brainLoadedForDescriptor];
    int v14 = [v13 isEqual:v22];

    if (v14)
    {
      SULogInfo(@"%s: Already loaded brain for this descriptor. No need to preload brain", v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUDownloader loadBrainOnUnlockForDescriptor:]");
    }
    else
    {
      [(SUDownloader *)self setLoadBrainForDescriptor:v22];
      [(SUDownloader *)self setBrainLoadAttemptsForDescriptor:0];
      [(SUDownloader *)self _loadBrainOnUnlockCallback];
    }
  }
  else
  {
    SULogInfo(@"%s: No descriptor, skip preloading brain", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDownloader loadBrainOnUnlockForDescriptor:]");
  }
}

- (BOOL)needToWaitForUnlockForLoadingBrainForDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUDownloader *)self core];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    SULogInfo(@"%s: No descriptor, skip loading brain", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDownloader needToWaitForUnlockForLoadingBrainForDescriptor:]");
    goto LABEL_5;
  }
  int v14 = [(SUDownloader *)self brainLoadedForDescriptor];
  int v15 = [v14 isEqual:v4];

  if (!v15)
  {
    uint64_t v24 = [(SUDownloader *)self core];
    id v25 = [v24 coreDescriptorForSUDescriptor:v4];
    uint64_t v26 = [v25 getMASoftwareUpdateAsset];

    if (!v26)
    {
      uint64_t v27 = [(SUDownloader *)self core];
      uint64_t v26 = [v27 preferredAssetToDownloadFromLastScan];
    }
    uint64_t v28 = [v26 attributes];
    uint64_t v29 = SUCoreBorder_MSUBrainIsLoadable();

    if (v29)
    {
      uint64_t v37 = +[SUKeybagInterface sharedInstance];
      char v38 = [v37 isPasscodeLocked];

      if (v38)
      {
        BOOL v23 = 1;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v39 = @"%s: device is not locked, should be able to load brain";
    }
    else
    {
      uint64_t v39 = @"%s: brain is loadable";
    }
    SULogInfo(v39, v30, v31, v32, v33, v34, v35, v36, (uint64_t)"-[SUDownloader needToWaitForUnlockForLoadingBrainForDescriptor:]");
    BOOL v23 = 0;
    goto LABEL_14;
  }
  SULogInfo(@"%s: Already loaded brain for this descriptor. No need to reload brain", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[SUDownloader needToWaitForUnlockForLoadingBrainForDescriptor:]");
LABEL_5:
  BOOL v23 = 0;
LABEL_15:

  return v23;
}

- (void)tryAutoDownload
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(SUDownloader *)self core];
  uint64_t v6 = [v5 updateToAutoDownload];

  if (!v6)
  {
    uint64_t v18 = @"Unable to autodownload with nil download descriptor";
    goto LABEL_16;
  }
  if ([v6 isSplatOnly])
  {
    int v14 = +[SUPreferences sharedInstance];
    char v15 = [v14 autoInstallSecurityResponse];

    if ((v15 & 1) == 0)
    {
      uint64_t v18 = @"Auto install security response disabled. Skipping auto download attempt";
      goto LABEL_16;
    }
  }
  uint64_t v16 = +[SUPreferences sharedInstance];
  int v17 = [v16 isAutoDownloadDisabled];

  if (!v17)
  {
    uint64_t v19 = +[SUNetworkMonitor sharedInstance];
    int v20 = [v19 currentNetworkType];

    if (v20 != 1)
    {
      uint64_t v18 = @"Auto download only allowed over wifi";
      goto LABEL_16;
    }
    uint64_t v21 = [v6 assetID];
    uint64_t v22 = [(SUDownloader *)self core];
    BOOL v23 = [v22 state];
    uint64_t v24 = [v23 lastDeletedSUAssetID];
    if ([v21 isEqualToString:v24])
    {
      id v25 = +[SUPreferences sharedInstance];
      char v26 = [v25 autoDownloadDeletedBuild];

      if ((v26 & 1) == 0)
      {
        uint64_t v18 = @"Attempting to auto-download previously deleted update. Skipping auto downlaod attempt";
        goto LABEL_16;
      }
    }
    else
    {
    }
    if ([v6 rampEnabled])
    {
      uint64_t v18 = @"Ramp is enabled for asset. Skipping auto downlaod attempt";
      goto LABEL_16;
    }
    uint64_t v27 = [[SUAutoDownloadPolicy alloc] initWithDescriptor:v6];
    if (![(SUDefaultDownloadPolicy *)v27 isDownloadable])
    {
      SULogInfo(@"SUAutoDownloadPolicy prevents SU asset download: %@", v28, v29, v30, v31, v32, v33, v34, (uint64_t)v27);
      uint64_t v51 = +[SUUtility errorWithCode:31];
      [(SUDownloader *)self noteAutoDownloadFailedToStart:v6 withError:v51];
LABEL_23:

LABEL_34:
      goto LABEL_17;
    }
    uint64_t v35 = [(SUDownloader *)self core];
    uint64_t v36 = [v35 download];
    uint64_t v37 = [v36 descriptor];
    int v38 = [v6 isEqual:v37];

    if (v38)
    {
      uint64_t v39 = [(SUDownloader *)self core];
      uint64_t v40 = [v39 download];
      int v41 = [v40 progress];
      int v42 = [v41 isDone];

      if (v42)
      {
        id v50 = @"Background scan found build already downloaded; Skipping auto downlaod attempt";
LABEL_33:
        SULogInfo(v50, v43, v44, v45, v46, v47, v48, v49, v89);
        goto LABEL_34;
      }
    }
    BOOL v52 = [(SUDownloader *)self _isWithinAutoDownloadWindowForPolicy:v27 descriptor:v6];
    if (v52)
    {
      SULogInfo(@"%s: Scheduling a new auto download in 4 hours in case this one fails", v43, v44, v45, v46, v47, v48, v49, (uint64_t)"-[SUDownloader tryAutoDownload]");
      int v53 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:14400.0];
      char v54 = +[SUPreferences sharedInstance];
      char v55 = [v54 disableAutoDownloadJitter];

      if ((v55 & 1) == 0)
      {
        uint64_t v56 = objc_msgSend(v53, "dateByAddingTimeInterval:", (double)+[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 0, 1800));

        v90 = +[SUUtility prettyPrintDate:v56];
        SULogInfo(@"%s: Random jittering enabled to retry the auto download; will retry after %@",
          v57,
          v58,
          v59,
          v60,
          v61,
          v62,
          v63,
          (uint64_t)"-[SUDownloader tryAutoDownload]");

        int v53 = (void *)v56;
      }
      id v64 = +[SUScheduler sharedInstance];
      [v64 scheduleAutoDownloadWithDate:v53 requirePower:0 minimumPowerRquirement:0];
    }
    if (v38)
    {
      id v50 = @"Background scan found build already downloading; Skipping auto downlaod attempt";
      goto LABEL_33;
    }
    if ([(SUDownloader *)self isDownloading]
      || ([(SUDownloader *)self core],
          id v65 = objc_claimAutoreleasedReturnValue(),
          int v66 = [v65 isInstalling],
          v65,
          v66))
    {
      id v50 = @"Currently downloading or installing. Skipping auto download attempt";
      goto LABEL_33;
    }
    uint64_t v67 = [(SUDownloader *)self core];
    uint64_t v68 = [v6 productBuildVersion];
    uint64_t v51 = [v67 fullyUnrampedDateForBuildVersion:v68];

    if (SUHasEnoughBatteryForAutoDownloadForDescriptor(v6, v51))
    {
      if (v52)
      {
        if ([(SUDownloader *)self needToWaitForUnlockForLoadingBrainForDescriptor:v6])
        {
          uint64_t v76 = @"We can't load the brain now, skipping auto download attempt";
LABEL_40:
          SULogInfo(v76, v69, v70, v71, v72, v73, v74, v75, v89);
          goto LABEL_23;
        }
        dispatch_time_t v78 = +[SUTransactionManager sharedInstance];
        [v78 beginTransaction:@"auto-tryDownload"];
        SULogInfo(@"Attempting to autodownload...", v79, v80, v81, v82, v83, v84, v85, v89);
        uint64_t v77 = [[SUDownloadOptions alloc] initWithDescriptor:v6];
        [(SUDownloadOptions *)v77 setAutoDownload:1];
        [(SUDownloadOptions *)v77 setActiveDownloadPolicyType:1];
        uint64_t v86 = +[SUState currentState];
        uint64_t v87 = [MEMORY[0x263EFF910] date];
        [v86 setLastAutoDownloadDate:v87];

        [(SUDownloadOptions *)v77 setClientName:@"com.apple.softwareupdateservicesd.autodownload"];
        v91[0] = MEMORY[0x263EF8330];
        v91[1] = 3221225472;
        v91[2] = __31__SUDownloader_tryAutoDownload__block_invoke;
        v91[3] = &unk_26447DC90;
        v91[4] = self;
        id v92 = v6;
        id v93 = v78;
        id v88 = v78;
        [(SUDownloader *)self startDownloadWithOptions:v77 withResult:v91];
      }
      else
      {
        SULogInfo(@"No longer in auto download window. No longer attempting auto download for this update", v69, v70, v71, v72, v73, v74, v75, v89);
        uint64_t v77 = +[SUUtility autoDownloadExpiredError:0];
        [(SUDownloader *)self noteAutoDownloadFailedToStart:v6 withError:v77];
      }

      goto LABEL_23;
    }
    uint64_t v76 = @"Auto-download power policy not satisfied. Skipping auto download attempt";
    goto LABEL_40;
  }
  uint64_t v18 = @"Auto download disabled via preferences. Skipping auto download attempt";
LABEL_16:
  SULogInfo(v18, v7, v8, v9, v10, v11, v12, v13, v89);
LABEL_17:
}

void __31__SUDownloader_tryAutoDownload__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) core];
  uint64_t v7 = [v6 workQueue];
  dispatch_assert_queue_V2(v7);

  if ((a2 & 1) == 0)
  {
    if (!v5)
    {
      id v5 = +[SUUtility errorWithCode:-1];
    }
    if ([v5 code] != 41)
    {
      if ([v5 code] == 53)
      {
        dispatch_time_t v15 = dispatch_time(0, 3600000000000);
        uint64_t v16 = [*(id *)(a1 + 32) core];
        int v17 = [v16 workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __31__SUDownloader_tryAutoDownload__block_invoke_2;
        block[3] = &unk_26447C878;
        void block[4] = *(void *)(a1 + 32);
        dispatch_after(v15, v17, block);
      }
      SULogInfo(@"tryAutoDownload: Error starting autodownload: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v5);
      [*(id *)(a1 + 32) noteAutoDownloadFailedToStart:*(void *)(a1 + 40) withError:v5];
    }
  }
  [*(id *)(a1 + 48) endTransaction:@"auto-tryDownload"];
}

void __31__SUDownloader_tryAutoDownload__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 autoScanAndDownloadIfAvailable:0 withResult:0];
}

- (void)endAutoDownloadTasksAndResetState
{
  id v2 = [(SUDownloader *)self core];
  BOOL v3 = [v2 workQueue];
  dispatch_assert_queue_V2(v3);

  SULogInfo(@"Ending/clearing any oustanding autodownload tasks and state", v4, v5, v6, v7, v8, v9, v10, v11);
  id v12 = +[SUScheduler sharedInstance];
  [v12 cancelAllAutoDownloadTasks];
}

- (BOOL)updateDownloadOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SUDownloader *)self core];
  uint64_t v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  if (!self->_downloadAsset || !self->_download)
  {
    id v25 = a4;
    uint64_t v26 = 3;
LABEL_17:
    +[SUUtility assignError:v25 withCode:v26];
    BOOL v24 = 0;
    goto LABEL_18;
  }
  if (![(SUDownloader *)self isDownloading])
  {
    id v25 = a4;
    uint64_t v26 = 12;
    goto LABEL_17;
  }
  if (!v6)
  {
    id v25 = a4;
    uint64_t v26 = 22;
    goto LABEL_17;
  }
  uint64_t v9 = [(SUDownload *)self->_download downloadOptions];
  if ([v9 isAutoDownload]
    && [v6 activeDownloadPolicyType] != 1
    || [v9 isAutoDownload] && (objc_msgSend(v6, "isAutoDownload") & 1) == 0)
  {
    [(SUDownloader *)self endAutoDownloadTasksAndResetState];
    if (([v9 isEqual:v6] & 1) == 0) {
      [(SUDownloader *)self _setDownloadDiscretionary:0];
    }
  }
  [(SUDownload *)self->_download setDownloadOptions:v6];
  SULogInfo(@"Download options changed from: %@ \nto:\n %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  int v17 = [(SUDownloader *)self core];
  uint64_t v18 = [v17 delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    int v20 = self->_download;
    uint64_t v21 = [(SUDownloader *)self core];
    uint64_t v22 = [v21 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__SUDownloader_updateDownloadOptions_error___block_invoke;
    block[3] = &unk_26447C8C8;
    void block[4] = self;
    uint64_t v29 = v20;
    BOOL v23 = v20;
    dispatch_async(v22, block);
  }
  [(SUDownloader *)self _updateLastSavedDownloadsOptions:v6];

  BOOL v24 = 1;
LABEL_18:

  return v24;
}

void __44__SUDownloader_updateDownloadOptions_error___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 downloadProgressDidChange:*(void *)(a1 + 40)];
}

- (void)noteAutoDownloadFailedToStart:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUDownloader *)self core];
  uint64_t v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  [(SUDownloader *)self endAutoDownloadTasksAndResetState];
  SULogInfo(@"Sending autodownload did fail to start notification to clients.", v10, v11, v12, v13, v14, v15, v16, v22);
  int v17 = [(SUDownloader *)self core];
  uint64_t v18 = [v17 delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    int v20 = [(SUDownloader *)self core];
    uint64_t v21 = [v20 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __56__SUDownloader_noteAutoDownloadFailedToStart_withError___block_invoke;
    block[3] = &unk_26447CD70;
    void block[4] = self;
    id v24 = v6;
    id v25 = v7;
    dispatch_async(v21, block);
  }
}

void __56__SUDownloader_noteAutoDownloadFailedToStart_withError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 automaticDownloadDidFailToStartForNewUpdateAvailable:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)noteAutoDownloadFailedToStartWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUDownloader *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(SUDownload *)self->_download descriptor];
  [(SUDownloader *)self noteAutoDownloadFailedToStart:v7 withError:v4];
}

- (void)deviceIsUpToDate
{
  id v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = +[SUScheduler sharedInstance];
  [v5 cancelAllAutoDownloadTasks];

  downloadAsset = self->_downloadAsset;
  if (downloadAsset
    && (![(MAAsset *)downloadAsset refreshState]
     || [(MAAsset *)self->_downloadAsset state] == 3
     || [(MAAsset *)self->_downloadAsset isDownloading]))
  {
    SULogInfo(@"Purging SU asset because server says device is up to date", v7, v8, v9, v10, v11, v12, v13, v17);
    uint64_t v14 = [(SUDownloader *)self core];
    [v14 clearKeybagStash];

    uint64_t v15 = [(SUDownloader *)self core];
    uint64_t v16 = [v15 engine];
    [v16 removeUpdateKeepingDocAssets:0];

    [(SUDownloader *)self cleanupPreviousDownloadState:1];
  }
}

- (BOOL)isDownloadHalted
{
  id v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  if (![(SUDownloader *)self isDownloading]) {
    return 0;
  }
  uint64_t v5 = [(SUDownload *)self->_download progress];
  id v6 = [v5 phase];
  if (SUDownloadPhaseIsHalted(v6))
  {
    char IsStalled = 1;
  }
  else
  {
    uint64_t v8 = [(SUDownload *)self->_download progress];
    uint64_t v9 = [v8 phase];
    char IsStalled = SUDownloadPhaseIsStalled(v9);
  }
  return IsStalled;
}

- (BOOL)isUpdateDownloaded
{
  id v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(SUDownload *)self->_download progress];
  id v6 = [v5 phase];
  if ([v6 isEqualToString:@"SUDownloadPhasePreparingForInstallation"])
  {
    uint64_t v7 = [(SUDownload *)self->_download progress];
    char v8 = [v7 isDone];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isSplatDownload
{
  id v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(SUDownloader *)self download];
  id v6 = [v5 descriptor];
  LOBYTE(v4) = [v6 updateType] == 4;

  return (char)v4;
}

- (BOOL)cancelDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v11 = [(SUDownloader *)self core];
  uint64_t v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  +[SUUtility setCacheable:1];
  if ([(SUDownloader *)self isDownloading])
  {
    return [(SUDownloader *)self killDownload:v9 userRequested:v8 keepDocAssets:v7 error:a6];
  }
  else
  {
    +[SUUtility assignError:a6 withCode:12];
    return 0;
  }
}

- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  uint64_t v11 = [(SUDownloader *)self core];
  uint64_t v12 = [v11 workQueue];
  dispatch_assert_queue_V2(v12);

  return [(SUDownloader *)self killDownload:v9 userRequested:v8 keepDocAssets:v7 forUpdates:0 error:a6];
}

- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 forUpdates:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  v40[2] = *MEMORY[0x263EF8340];
  id v12 = a6;
  uint64_t v13 = [(SUDownloader *)self core];
  uint64_t v14 = [v13 workQueue];
  dispatch_assert_queue_V2(v14);

  if (!self->_downloadAsset || !self->_download)
  {
    uint64_t v17 = a7;
    uint64_t v18 = 3;
    goto LABEL_6;
  }
  uint64_t v15 = [(SUDownloader *)self core];
  int v16 = [v15 isInstalling];

  if (v16)
  {
    uint64_t v17 = a7;
    uint64_t v18 = 14;
LABEL_6:
    +[SUUtility assignError:v17 withCode:v18];
    BOOL v19 = 0;
    goto LABEL_7;
  }
  uint64_t v21 = [(SUDownloader *)self core];
  int v22 = [v21 isInstalled];

  if (v22)
  {
    uint64_t v17 = a7;
    uint64_t v18 = 42;
    goto LABEL_6;
  }
  BOOL v23 = [(SUDownloader *)self isDownloading];
  id v24 = [(SUDownloader *)self core];
  id v25 = [v24 engine];
  [v25 removeUpdateKeepingDocAssets:v8];

  if (v9)
  {
    uint64_t v26 = [(SUDownloader *)self core];
    uint64_t v27 = [v26 state];
    uint64_t v28 = [(SUDownload *)self->_download descriptor];
    uint64_t v29 = [v28 assetID];
    [v27 setLastDeletedSUAssetID:v29];
  }
  uint64_t v30 = [(SUDownload *)self->_download downloadOptions];
  int v31 = [v30 isAutoDownload];

  if (v31) {
    [(SUDownloader *)self endAutoDownloadTasksAndResetState];
  }
  uint64_t v32 = [(SUDownloader *)self core];
  [v32 clearKeybagStash];

  if (v23)
  {
    v39[0] = @"SUUserRequested";
    uint64_t v33 = [NSNumber numberWithBool:v9];
    v40[0] = v33;
    v39[1] = @"SUNotifyUser";
    uint64_t v34 = [NSNumber numberWithBool:v10];
    v40[1] = v34;
    uint64_t v35 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

    uint64_t v36 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.softwareupdateservices.errors" code:16 userInfo:v35];
    [(SUDownloader *)self _downloadFailedWithError:v36];
  }
  else
  {
    [(SUDownloader *)self _downloadInvalidatedWithUpdates:v12];
  }
  uint64_t v37 = [(SUDownloader *)self core];
  int v38 = [(SUDownload *)self->_download descriptor];
  [v37 dismissInsufficientDiskSpaceFollowupForUpdate:v38 orForce:0];

  BOOL v19 = 1;
LABEL_7:

  return v19;
}

- (BOOL)_isWithinAutoDownloadWindowForPolicy:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = [MEMORY[0x263EFF910] date];
    BOOL v9 = [(SUDownloader *)self core];
    BOOL v10 = [v7 productBuildVersion];
    uint64_t v11 = [v9 discoveryDateForBuildVersion:v10];
    id v12 = [v6 computAutoDownloadEndDateFromDate:v11];

    if (v12)
    {
      uint64_t v13 = [v12 laterDate:v8];
      BOOL v14 = v13 == v12;
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
    BOOL v8 = 0;
  }

  return v14;
}

- (void)_changeDownloadPhase:(id)a3 progress:(float)a4 timeRemaining:(double)a5
{
  id v41 = a3;
  BOOL v8 = [(SUDownloader *)self core];
  BOOL v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  id v11 = v41;
  if (v41)
  {
    BOOL v10 = [(SUDownloader *)self isDownloading];
    id v11 = v41;
    if (v10)
    {
      id v12 = [(SUDownload *)self->_download progress];
      uint64_t v13 = [v12 phase];
      if (([v13 isEqualToString:v41] & 1) == 0)
      {
        BOOL v14 = [(SUDownload *)self->_download progress];
        uint64_t v15 = [v14 phase];
        SULogInfo(@"Software update download phase changed from %@ to %@.", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);

        [v12 setPercentComplete:0.0];
      }
      [v12 setPhase:v41];
      if (a4 == 0.0) {
        a4 = 0.0;
      }
      double v23 = a4;
      if (a4 > 0.001 || (SUDownloadPhaseIsFetchingAnything(v41, 1) & 1) == 0)
      {
        *(float *)&double v23 = fminf(fmaxf(a4, 0.0), 1.0);
        [v12 setPercentComplete:v23];
      }
      double v24 = -1.0;
      if (a5 != 0.0) {
        double v24 = a5;
      }
      [v12 setTimeRemaining:v24];
      id v25 = [(SUDownload *)self->_download downloadOptions];
      if ([v25 isAutoDownload])
      {
        uint64_t v26 = [(SUDownload *)self->_download downloadOptions];
        if ([v26 activeDownloadPolicyType] == 1
          && [(SUDownloader *)self isDownloadHalted])
        {
          uint64_t v27 = [(SUDownload *)self->_download downloadOptions];
          uint64_t v28 = [v27 activeDownloadPolicy];
          uint64_t v29 = [(SUDownload *)self->_download descriptor];
          BOOL v30 = [(SUDownloader *)self _isWithinAutoDownloadWindowForPolicy:v28 descriptor:v29];

          if (!v30)
          {
            SULogDebug(@"Download halted after wifi window; attempting to cancel download silently.",
              v31,
              v32,
              v33,
              v34,
              v35,
              v36,
              v37,
              v40);
            if ([(SUDownloader *)self cancelDownload:0 userRequested:0 keepDocAssets:1 error:0])
            {
              int v38 = [(SUDownload *)self->_download descriptor];
              uint64_t v39 = +[SUUtility autoDownloadExpiredError:0];
              [(SUDownloader *)self noteAutoDownloadFailedToStart:v38 withError:v39];

LABEL_21:
              id v11 = v41;
              goto LABEL_22;
            }
          }
LABEL_20:
          [(SUDownloader *)self _updateNormalizedDownloadProgressAndNotifyDelegate];
          goto LABEL_21;
        }
      }
      goto LABEL_20;
    }
  }
LABEL_22:
  MEMORY[0x270F9A758](v10, v11);
}

- (void)_notePhaseCompleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUDownloader *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  id v20 = [(SUDownload *)self->_download progress];
  [v20 setPhase:v4];

  LODWORD(v7) = 1.0;
  [v20 setPercentComplete:v7];
  [v20 setTimeRemaining:0.0];
  [(SUDownloader *)self _updateNormalizedDownloadProgress];
  BOOL v8 = [(SUDownloader *)self core];
  BOOL v9 = [v8 state];
  [v9 setLastDownload:self->_download];

  BOOL v10 = [(SUDownloader *)self core];
  id v11 = [v10 state];
  [v11 save];

  id v12 = [v20 phase];
  SULogInfo(@"Download %@ phase completed.", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);
}

- (void)_updateNormalizedDownloadProgressAndNotifyDelegate
{
  id v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  if (self->_download)
  {
    [(SUDownloader *)self _updateNormalizedDownloadProgress];
    id v9 = [(SUDownloader *)self core];
    uint64_t v5 = [v9 delegate];
    if (objc_opt_respondsToSelector())
    {
      BOOL v6 = [(SUDownloader *)self _shouldSendUpdatedProgressToDelegate];

      if (v6)
      {
        [(SUDownloader *)self _snapshotProgress];
        double v7 = [(SUDownloader *)self core];
        BOOL v8 = [v7 externWorkQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __66__SUDownloader__updateNormalizedDownloadProgressAndNotifyDelegate__block_invoke;
        block[3] = &unk_26447C878;
        void block[4] = self;
        dispatch_async(v8, block);
      }
    }
    else
    {
    }
  }
}

void __66__SUDownloader__updateNormalizedDownloadProgressAndNotifyDelegate__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 downloadProgressDidChange:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (BOOL)_shouldSendUpdatedProgressToDelegate
{
  id v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = self->_downloadProgressSnapshot;
  BOOL v6 = [(SUDownload *)self->_download progress];
  [v6 normalizedPercentComplete];
  if (v7 >= 1.0) {
    goto LABEL_8;
  }
  BOOL v8 = [(SUOperationProgress *)v5 phase];
  id v9 = [v6 phase];
  int v10 = [v8 isEqualToString:v9];

  if (!v10) {
    goto LABEL_8;
  }
  [(SUOperationProgress *)v5 percentComplete];
  float v12 = v11;
  [v6 percentComplete];
  if ((float)(v13 - v12) < 0.01)
  {
    if ([(SUDownloader *)self isForeground]) {
      double v14 = 10.0;
    }
    else {
      double v14 = 60.0;
    }
    uint64_t v15 = [MEMORY[0x263EFF910] now];
    [v15 timeIntervalSinceDate:self->_downloadProgressSnapshotDate];
    BOOL v17 = v16 > v14;
  }
  else
  {
LABEL_8:
    BOOL v17 = 1;
  }

  return v17;
}

- (void)_updateNormalizedDownloadProgress
{
  id v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  id v31 = [(SUDownload *)self->_download progress];
  uint64_t v5 = [v31 phase];
  int v6 = [(SUDownloader *)self _orderForPhase:v5];
  float v7 = [(SUDownload *)self->_download descriptor];
  int v8 = [v7 _isStreamingZipCapable];

  if (v31 && v6 >= 1 && v6 <= 7)
  {
    id v9 = (float *)&_SUDownloadPhaseOrderWeightsNonStreamable;
    if (v8) {
      id v9 = (float *)&_SUDownloadPhaseOrderWeightsStreamable;
    }
    uint64_t v10 = v6;
    float v11 = v9[v6];
    float v12 = 0.0;
    do
    {
      float v13 = *v9++;
      float v12 = v12 + v13;
      --v10;
    }
    while (v10);
    [v31 percentComplete];
    *(float *)&double v15 = v12 + fminf(v11 * v14, v11);
    [v31 setNormalizedPercentComplete:v15];
    double v16 = (void *)MEMORY[0x263F08A30];
    BOOL v17 = NSNumber;
    [v31 percentComplete];
    uint64_t v18 = objc_msgSend(v17, "numberWithFloat:");
    uint64_t v19 = [v16 localizedStringFromNumber:v18 numberStyle:3];
    id v20 = (void *)MEMORY[0x263F08A30];
    uint64_t v21 = NSNumber;
    [v31 normalizedPercentComplete];
    uint64_t v22 = objc_msgSend(v21, "numberWithFloat:");
    BOOL v30 = [v20 localizedStringFromNumber:v22 numberStyle:3];
    SULogDebug(@"Download Phase: %@, Phase Progress: %@, Overall Progress: %@", v23, v24, v25, v26, v27, v28, v29, (uint64_t)v5);
  }
}

- (int)_orderForPhase:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUDownloader *)self core];
  int v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (_orderForPhase____onceToken != -1) {
    dispatch_once(&_orderForPhase____onceToken, &__block_literal_global_533);
  }
  float v7 = [(id)_orderForPhase____downloadPhaseOrderMap objectForKey:v4];

  if (v7) {
    int v8 = [v7 intValue];
  }
  else {
    int v8 = -1;
  }

  return v8;
}

void __31__SUDownloader__orderForPhase___block_invoke()
{
  v13[10] = *MEMORY[0x263EF8340];
  v0 = objc_msgSend(NSNumber, "numberWithInt:", 0, @"SUDownloadPhaseStarting");
  v13[0] = v0;
  v12[1] = @"SUDownloadPhaseBrainFetching";
  id v1 = [NSNumber numberWithInt:1];
  v13[1] = v1;
  v12[2] = @"SUDownloadPhaseBrainFetchingQueuedLocal";
  id v2 = [NSNumber numberWithInt:1];
  v13[2] = v2;
  v12[3] = @"SUDownloadPhaseBrainFetchingQueuedRemote";
  id v3 = [NSNumber numberWithInt:1];
  v13[3] = v3;
  v12[4] = @"SUDownloadPhaseBrainFetchingStalled";
  id v4 = [NSNumber numberWithInt:1];
  v13[4] = v4;
  v12[5] = @"SUDownloadPhaseBrainVerifying";
  uint64_t v5 = [NSNumber numberWithInt:2];
  v13[5] = v5;
  v12[6] = @"SUDownloadPhaseBrainExtracting";
  int v6 = [NSNumber numberWithInt:3];
  v13[6] = v6;
  v12[7] = @"SUDownloadPhaseFetching";
  float v7 = [NSNumber numberWithInt:4];
  v13[7] = v7;
  v12[8] = @"SUDownloadPhaseFetchingStalled";
  int v8 = [NSNumber numberWithInt:4];
  v13[8] = v8;
  v12[9] = @"SUDownloadPhasePreparingForInstallation";
  id v9 = [NSNumber numberWithInt:7];
  v13[9] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:10];
  float v11 = (void *)_orderForPhase____downloadPhaseOrderMap;
  _orderForPhase____downloadPhaseOrderMap = v10;
}

- (void)downloadProgress:(id)a3
{
  id v27 = a3;
  id v4 = [(SUDownloader *)self core];
  uint64_t v5 = [v4 workQueue];
  dispatch_assert_queue_V2(v5);

  int v6 = [v27 phase];
  LODWORD(v5) = [v6 isEqualToString:@"SUDownloadPhaseStarting"];

  if (v5) {
    notify_post((const char *)[(id)*MEMORY[0x263F77C10] UTF8String]);
  }
  float v7 = [v27 phase];
  [v27 percentComplete];
  int v9 = v8;
  [v27 timeRemaining];
  double v11 = v10;
  LODWORD(v10) = v9;
  [(SUDownloader *)self _changeDownloadPhase:v7 progress:v10 timeRemaining:v11];

  if ([(SUDownloader *)self goNonDiscretionaryOnDownload])
  {
    if ([(SUDownloader *)self isDownloading])
    {
      float v12 = [v27 phase];
      int IsUpdateDownloading = SUDownloadPhaseIsUpdateDownloading(v12);

      if (IsUpdateDownloading)
      {
        SULogInfo(@"Download in progress and we need to go non-discretionary", v14, v15, v16, v17, v18, v19, v20, v26);
        [(SUDownloader *)self setGoNonDiscretionaryOnDownload:0];
        [(SUDownloader *)self _setDownloadDiscretionary:0];
      }
    }
  }
  if ([v27 isDone])
  {
    uint64_t v21 = [v27 phase];
    [(SUDownloader *)self _notePhaseCompleted:v21];

    uint64_t v22 = [v27 phase];
    if ([v22 isEqualToString:@"SUDownloadPhaseBrainExtracting"])
    {
    }
    else
    {
      uint64_t v23 = [v27 phase];
      int v24 = [v23 isEqualToString:@"SUDownloadPhaseFetching"];

      if (!v24) {
        goto LABEL_12;
      }
    }
    uint64_t v25 = [(SUDownloader *)self core];
    [v25 reporterFlushEvent];
  }
LABEL_12:
}

- (void)downloadCompleted:(id)a3
{
}

- (void)downloadCompleted:(id)a3 informClients:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  float v7 = [(SUDownloader *)self core];
  int v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  notify_post((const char *)[(id)*MEMORY[0x263F77C10] UTF8String]);
  int v9 = [(SUDownloader *)self core];
  double v10 = [v9 state];
  double v11 = v10;
  if (v6)
  {
    float v12 = [v6 description];
    [v11 setDdmPersistedErrorDescription:v12];

    notify_post((const char *)[(id)*MEMORY[0x263F77C08] UTF8String]);
    id v13 = v6;
    uint64_t v14 = *MEMORY[0x263EFFB40];
    uint64_t v15 = *MEMORY[0x263F08608];
    id v49 = v13;
    id v16 = v13;
    while (1)
    {
      uint64_t v17 = [v16 userInfo];
      uint64_t v18 = [v17 valueForKey:@"MSUFullReplacementRecommened"];

      if (v18 == v14) {
        break;
      }
      uint64_t v19 = [v16 userInfo];
      uint64_t v20 = [v19 objectForKey:v15];

      id v16 = (id)v20;
      if (!v20)
      {
        uint64_t v21 = v49;
        goto LABEL_13;
      }
    }
    uint64_t v39 = +[SUUtility errorWithCode:53 originalError:v49];

    uint64_t v40 = [(SUDownloader *)self core];
    id v41 = [v40 state];
    int v42 = [(SUDownload *)self->_download descriptor];
    [v41 addFailedPatchDescriptor:v42];

    uint64_t v43 = [(SUDownloader *)self core];
    uint64_t v44 = [v43 state];
    [v44 save];

    uint64_t v21 = (void *)v39;
LABEL_13:
    id v50 = v21;
    uint64_t v45 = [v21 domain];
    int v46 = [v45 isEqualToString:@"com.apple.softwareupdateservices.errors"];

    if (!v46 || (unint64_t v47 = [v50 code], v47 > 0x2A) || ((1 << v47) & 0x40000004800) == 0) {
      [(SUDownloader *)self _downloadFailedWithError:v50];
    }
  }
  else
  {
    [v10 setDdmPersistedError:0];

    uint64_t v22 = [(SUDownloader *)self core];
    uint64_t v23 = [v22 state];
    int v24 = [v23 lastDownload];
    uint64_t v25 = [v24 progress];
    uint64_t v26 = [v25 phase];

    if (v26 != @"SUDownloadPhasePreparingForInstallation")
    {
      id v27 = [(SUDownloader *)self core];
      uint64_t v28 = v27;
      if (v4) {
        uint64_t v29 = 0;
      }
      else {
        uint64_t v29 = @"followup event";
      }
      [v27 reportOTADownloadedEvent:v29];

      BOOL v30 = [(SUDownloader *)self core];
      [v30 reportCoreAnalyticsOTADownloadedEvent];
    }
    [(SUDownloader *)self _notePhaseCompleted:@"SUDownloadPhasePreparingForInstallation"];
    [(SUDownloader *)self _downloadFinished:v4];
    SULogInfo(@"Update is prepared. Re-registering for RecordDataForBrain unlock callback", v31, v32, v33, v34, v35, v36, v37, v48);
    int v38 = [(SUDownloader *)self core];
    [v38 removeUnlockCallback:@"unlockCallbackRecordDataForBrain"];

    id v50 = [(SUDownloader *)self core];
    [v50 addUnlockCallback:sel__recordLastUnlockTimePostPrepare forKey:@"unlockCallbackRecordDataForBrain"];
  }
}

- (void)_downloadFinished:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SUDownloader *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  float v7 = [(SUDownloader *)self core];
  uint64_t v8 = [v7 passcodePolicy];
  if (v8)
  {
    int v9 = (void *)v8;
    double v10 = [(SUDownloader *)self core];
    if ([v10 isAutoUpdateEnabled])
    {
      double v11 = [(SUDownload *)self->_download downloadOptions];
      int v12 = [v11 isAutoDownload];

      if (!v12) {
        goto LABEL_11;
      }
      id v13 = [(SUDownloader *)self download];
      uint64_t v14 = [v13 descriptor];
      int v15 = [v14 updateType];

      float v7 = [(SUDownloader *)self core];
      id v16 = [v7 passcodePolicy];
      int v9 = v16;
      if (v15 == 4) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 1;
      }
      [v16 setCurrentPolicyType:v17];
    }
    else
    {
    }
  }

LABEL_11:
  uint64_t v18 = [(SUDownloader *)self core];
  uint64_t v19 = [(SUDownload *)self->_download descriptor];
  uint64_t v20 = [v18 coreDescriptorForSUDescriptor:v19];

  SULogInfo(@"%s: Found SUCoreDescriptor: %@", v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[SUDownloader _downloadFinished:]");
  if (v20)
  {
    uint64_t v28 = [(SUDownload *)self->_download descriptor];
    [v28 installationSize];
    SULogInfo(@"%s: Old installationSize: %llu", v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[SUDownloader _downloadFinished:]");

    [v20 refreshInstallationSize];
    uint64_t v36 = [(SUDownload *)self->_download descriptor];
    objc_msgSend(v36, "setInstallationSize:", objc_msgSend(v20, "installationSize"));

    uint64_t v37 = [(SUDownload *)self->_download descriptor];
    [v37 installationSize];
    SULogInfo(@"%s: Refreshed installationSize: %llu", v38, v39, v40, v41, v42, v43, v44, (uint64_t)"-[SUDownloader _downloadFinished:]");
  }
  uint64_t v45 = [(SUDownload *)self->_download progress];
  [v45 setIsDone:1];

  int v46 = [(SUDownloader *)self core];
  unint64_t v47 = [v46 state];
  [v47 setLastDownload:self->_download];

  uint64_t v48 = [(SUDownloader *)self core];
  id v49 = [v48 state];
  [v49 save];

  SULogInfo(@"%s: Download finished, cancel the recommended notification UI", v50, v51, v52, v53, v54, v55, v56, (uint64_t)"-[SUDownloader _downloadFinished:]");
  uint64_t v57 = [(SUDownloader *)self core];
  [v57 unscheduleRecommendedUpdateNotification];

  if (v3)
  {
    uint64_t v74 = v20;
    uint64_t v58 = [(SUDownloader *)self core];
    uint64_t v75 = [v58 installPolicy];

    uint64_t v59 = [(SUDownloader *)self core];
    uint64_t v60 = [v59 delegate];
    char v61 = objc_opt_respondsToSelector();

    if (v61)
    {
      uint64_t v62 = [(SUDownloader *)self core];
      uint64_t v63 = [v62 externWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __34__SUDownloader__downloadFinished___block_invoke;
      block[3] = &unk_26447C8C8;
      void block[4] = self;
      id v83 = v75;
      dispatch_async(v63, block);
    }
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v64 = [(SUDownloader *)self core];
    id v65 = [v64 observers];
    int v66 = [v65 allObjects];

    uint64_t v67 = [v66 countByEnumeratingWithState:&v78 objects:v84 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v68; ++i)
        {
          if (*(void *)v79 != v69) {
            objc_enumerationMutation(v66);
          }
          uint64_t v71 = *(void *)(*((void *)&v78 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v72 = [(SUDownloader *)self core];
            uint64_t v73 = [v72 externWorkQueue];
            v76[0] = MEMORY[0x263EF8330];
            v76[1] = 3221225472;
            v76[2] = __34__SUDownloader__downloadFinished___block_invoke_2;
            v76[3] = &unk_26447CD70;
            v76[4] = v71;
            v76[5] = self;
            id v77 = v75;
            dispatch_async(v73, v76);
          }
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v78 objects:v84 count:16];
      }
      while (v68);
    }

    uint64_t v20 = v74;
  }
  [(SUDownloader *)self endAutoDownloadTasksAndResetState];
  +[SUUtility setCacheable:1];
  [(SUDownloader *)self setDownloading:0];
}

void __34__SUDownloader__downloadFinished___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 downloadDidFinish:*(void *)(*(void *)(a1 + 32) + 32) withInstallPolicy:*(void *)(a1 + 40)];
}

uint64_t __34__SUDownloader__downloadFinished___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) downloadDidFinish:*(void *)(*(void *)(a1 + 40) + 32) withInstallPolicy:*(void *)(a1 + 48)];
}

- (void)_downloadFailedWithError:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(SUDownloader *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  SULogInfo(@"Download failed with error: %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v4);
  uint64_t v21 = off_26447C000;
  if (self->_download)
  {
    if (!v4)
    {
      id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:-1 userInfo:0];
    }
    id v42 = v4;
    uint64_t v43 = +[SUUtility translateError:v4];
    uint64_t v22 = [(SUDownloader *)self core];
    uint64_t v23 = [v22 delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      uint64_t v25 = [(SUDownloader *)self core];
      uint64_t v26 = [v25 externWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __41__SUDownloader__downloadFailedWithError___block_invoke;
      block[3] = &unk_26447C8C8;
      void block[4] = self;
      id v51 = v43;
      dispatch_async(v26, block);
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v27 = [(SUDownloader *)self core];
    uint64_t v28 = [v27 observers];
    uint64_t v29 = [v28 allObjects];

    uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v47 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v35 = [(SUDownloader *)self core];
            uint64_t v36 = [v35 externWorkQueue];
            v44[0] = MEMORY[0x263EF8330];
            v44[1] = 3221225472;
            v44[2] = __41__SUDownloader__downloadFailedWithError___block_invoke_2;
            v44[3] = &unk_26447CD70;
            v44[4] = v34;
            v44[5] = self;
            id v45 = v43;
            dispatch_async(v36, v44);
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v31);
    }

    id v4 = v42;
    uint64_t v21 = off_26447C000;
  }
  else
  {
    SULogError(@"[ANOMALY] Download faild but the download object is nil", v14, v15, v16, v17, v18, v19, v20, v41);
  }
  uint64_t v37 = [(SUDownloader *)self core];
  [v37 reportOTAAbandonedEventWithError:v4];

  uint64_t v38 = [(SUDownloader *)self core];
  [v38 reportCoreAnalyticsOTAAbandonedEvent:v4];

  uint64_t v39 = [(SUDownloader *)self core];
  [v39 clearUnlockCallbacks];

  [(__objc2_class *)v21[83] setCacheable:1];
  [(SUDownloader *)self cleanupPreviousDownloadState:1];
  uint64_t v40 = [(SUDownloader *)self core];
  [v40 clearKeybagStash];

  [(SUDownloader *)self setDownloading:0];
}

void __41__SUDownloader__downloadFailedWithError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 downloadDidFail:*(void *)(*(void *)(a1 + 32) + 32) withError:*(void *)(a1 + 40)];
}

uint64_t __41__SUDownloader__downloadFailedWithError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) downloadDidFail:*(void *)(*(void *)(a1 + 40) + 32) withError:*(void *)(a1 + 48)];
}

- (void)_downloadInvalidatedWithUpdates:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = (SUCoreScanResults *)a3;
  if (!v4)
  {
    uint64_t v5 = [SUCoreScanResults alloc];
    id v6 = [(SUDownloader *)self core];
    uint64_t v7 = [v6 preferredLastScannedDescriptor];
    uint64_t v8 = [(SUDownloader *)self core];
    uint64_t v9 = [v8 alternateLastScannedDescriptor];
    id v4 = [(SUCoreScanResults *)v5 initWithPreferredDescriptor:v7 alternateDescriptor:v9];
  }
  uint64_t v10 = [(SUDownloader *)self core];
  uint64_t v11 = [v10 delegate];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = [(SUDownloader *)self core];
    uint64_t v14 = [v13 delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      uint64_t v16 = [(SUDownloader *)self core];
      uint64_t v17 = [v16 externWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__SUDownloader__downloadInvalidatedWithUpdates___block_invoke;
      block[3] = &unk_26447C8C8;
      void block[4] = self;
      uint64_t v34 = v4;
      dispatch_async(v17, block);
    }
  }
  else
  {
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v18 = [(SUDownloader *)self core];
  uint64_t v19 = [v18 observers];
  uint64_t v20 = [v19 allObjects];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v26 = [(SUDownloader *)self core];
          uint64_t v27 = [v26 externWorkQueue];
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __48__SUDownloader__downloadInvalidatedWithUpdates___block_invoke_2;
          v28[3] = &unk_26447C8C8;
          v28[4] = v25;
          v28[5] = self;
          dispatch_async(v27, v28);
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v22);
  }

  [(SUDownloader *)self cleanupPreviousDownloadState:1];
  [(SUDownloader *)self setDownloading:0];
}

void __48__SUDownloader__downloadInvalidatedWithUpdates___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  id v2 = [v3 delegate];
  [v2 downloadWasInvalidatedForNewUpdatesAvailable:*(void *)(a1 + 40)];
}

uint64_t __48__SUDownloader__downloadInvalidatedWithUpdates___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) downloadWasInvalidated:*(void *)(*(void *)(a1 + 40) + 32)];
}

- (void)cleanupPreviousDownloadState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SUDownloader *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  SULogInfo(@"Cleaning up previous download state", v7, v8, v9, v10, v11, v12, v13, v19);
  [(SUDownloader *)self setDownloadAsset:0];
  uint64_t v14 = [(SUDownloader *)self core];
  [v14 clearBadgeAndBanner];

  [(SUDownloader *)self setGoNonDiscretionaryOnDownload:0];
  [(SUDownloader *)self setDownloading:0];
  [(SUDownloader *)self setDownload:0];
  [(SUDownloader *)self _snapshotProgress];
  char v15 = [(SUDownloader *)self core];
  uint64_t v16 = [v15 state];
  [v16 setLastDownload:0];

  uint64_t v17 = [(SUDownloader *)self core];
  [v17 removeUnlockCallback:@"unlockCallbackRecordDataForBrain"];

  if (v3)
  {
    id v20 = [(SUDownloader *)self core];
    uint64_t v18 = [v20 state];
    [v18 save];
  }
}

- (void)_snapshotProgress
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(SUDownload *)self->_download progress];
  id v6 = (SUOperationProgress *)[v5 copy];
  downloadProgressSnapshot = self->_downloadProgressSnapshot;
  self->_downloadProgressSnapshot = v6;

  uint64_t v8 = [MEMORY[0x263EFF910] now];
  downloadProgressSnapshotDate = self->_downloadProgressSnapshotDate;
  self->_downloadProgressSnapshotDate = v8;
  MEMORY[0x270F9A758](v8, downloadProgressSnapshotDate);
}

- (void)operatorBundleChanged
{
  BOOL v3 = [(SUDownloader *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SUDownloader_operatorBundleChanged__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __37__SUDownloader_operatorBundleChanged__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isDownloading])
  {
    id v2 = *(id **)(a1 + 32);
    BOOL v3 = [v2[4] progress];
    id v4 = [v3 phase];
    LODWORD(v2) = [v2 _orderForPhase:v4];

    if ((int)v2 <= 4)
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) downloadOptions];
      if ([v5 activeDownloadPolicyType] != 2
        && ([*(id *)(a1 + 32) _reapplyExistingDownloadPolicyIfDownloadable:1] & 1) == 0)
      {
        SULogInfo(@"Cellular operator status changed, and now the download is not downloadable.  Attempting to cancel the download.", v6, v7, v8, v9, v10, v11, v12, v24);
        uint64_t v13 = *(void **)(a1 + 32);
        id v25 = 0;
        char v14 = [v13 cancelDownload:1 userRequested:0 keepDocAssets:1 error:&v25];
        id v15 = v25;
        uint64_t v23 = v15;
        if ((v14 & 1) == 0) {
          SULogInfo(@"Unable to cancel download for cellular bundle change: %@", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v15);
        }
      }
    }
  }
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  uint64_t v6 = [(SUDownloader *)self core];
  uint64_t v7 = [v6 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__SUDownloader_networkChangedFromNetworkType_toNetworkType___block_invoke;
  v8[3] = &unk_26447CD48;
  v8[4] = self;
  int v9 = a4;
  dispatch_async(v7, v8);
}

void __60__SUDownloader_networkChangedFromNetworkType_toNetworkType___block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) isDownloading]) {
    return;
  }
  if (*(_DWORD *)(a1 + 40) == 1) {
    goto LABEL_5;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 32) allowCellularDownload])
  {
    if (*(_DWORD *)(a1 + 40) != 1) {
      return;
    }
LABEL_5:
    id v2 = [*(id *)(*(void *)(a1 + 32) + 32) progress];
    BOOL v3 = [v2 phase];
    int v4 = [v3 isEqualToString:@"SUDownloadPhaseFetchingStalled"];

    if (v4)
    {
      uint64_t v5 = *(id **)(a1 + 32);
      id v12 = [v5[4] progress];
      [v12 percentComplete];
      int v7 = v6;
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 32) progress];
      [v8 timeRemaining];
      double v10 = v9;
      LODWORD(v9) = v7;
      [v5 _changeDownloadPhase:@"SUDownloadPhaseFetching" progress:v9 timeRemaining:v10];
    }
    return;
  }
  uint64_t v11 = *(void **)(a1 + 32);
  [v11 _changeDownloadPhase:@"SUDownloadPhaseFetchingStalled" progress:0.0 timeRemaining:0.0];
}

- (id)slaVersion
{
  uint64_t v3 = [(SUDownloader *)self download];
  if (!v3) {
    goto LABEL_5;
  }
  int v4 = (void *)v3;
  uint64_t v5 = [(SUDownloader *)self download];
  uint64_t v6 = [v5 descriptor];
  if (!v6)
  {
    id v12 = 0;
    goto LABEL_7;
  }
  int v7 = (void *)v6;
  uint64_t v8 = [(SUDownloader *)self download];
  double v9 = [v8 descriptor];
  double v10 = [v9 documentation];

  if (!v10)
  {
LABEL_5:
    id v12 = 0;
    goto LABEL_8;
  }
  int v4 = [(SUDownloader *)self download];
  uint64_t v5 = [v4 descriptor];
  uint64_t v11 = [v5 documentation];
  id v12 = [v11 slaVersion];

LABEL_7:
LABEL_8:
  return v12;
}

- (void)ensureSSOTokenIfNeededForDownload:(id)a3
{
  id v29 = a3;
  if (+[SUUtility currentReleaseTypeIsInternal])
  {
    uint64_t v3 = +[SUPreferences sharedInstance];
    int v4 = [v3 suppressSSOTokenInDownload];

    if (v4)
    {
      SULogInfo(@"%s: Suppressing SSO Token in download.", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDownloader ensureSSOTokenIfNeededForDownload:]");
    }
    else if ([v29 isAutoDownload])
    {
      SULogInfo(@"%s: Autodownload operation - not getting SSO Token.", v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUDownloader ensureSSOTokenIfNeededForDownload:]");
    }
    else
    {
      uint64_t v19 = [v29 descriptor];
      uint64_t v20 = [v19 upgradeType];

      if (v20 == 2)
      {
        SULogInfo(@"%s: Software update is major upgrade, getting SSO token.", v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[SUDownloader ensureSSOTokenIfNeededForDownload:]");
        uint64_t v28 = +[SUAuthSSO sharedInstance];
        [v28 invokeSSOAuth];
      }
      else
      {
        SULogInfo(@"%s: Software update is not major upgrade, not getting SSO token.", v21, v22, v23, v24, v25, v26, v27, (uint64_t)"-[SUDownloader ensureSSOTokenIfNeededForDownload:]");
      }
    }
  }
}

+ (id)purgeOptionsForDescriptor:(id)a3 downloadOptions:(id)a4 completionQueue:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(SUSpacePurgeOptions);
  unint64_t v11 = +[SUUtility totalDiskSpaceForUpdate:v9];

  [(SUSpacePurgeOptions *)v10 setNeededBytes:v11];
  [(SUSpacePurgeOptions *)v10 setEnableCacheDelete:1];
  if ([v7 isAutoDownload]) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [v7 isAppOffloadEnabled];
  }
  [(SUSpacePurgeOptions *)v10 setEnableAppOffload:v12];
  [(SUSpacePurgeOptions *)v10 setCacheDeleteUrgency:4];
  [(SUSpacePurgeOptions *)v10 setAppOffloadUrgency:4];
  [(SUSpacePurgeOptions *)v10 setCompletionQueue:v8];

  return v10;
}

- (void)setCore:(id)a3
{
}

- (BOOL)downloadStateResetSinceStartup
{
  return self->_downloadStateResetSinceStartup;
}

- (void)setDownloadStateResetSinceStartup:(BOOL)a3
{
  self->_downloadStateResetSinceStartup = a3;
}

- (SUOperationProgress)downloadProgressSnapshot
{
  return self->_downloadProgressSnapshot;
}

- (void)setDownloadProgressSnapshot:(id)a3
{
}

- (NSDate)downloadProgressSnapshotDate
{
  return self->_downloadProgressSnapshotDate;
}

- (void)setDownloadProgressSnapshotDate:(id)a3
{
}

- (BOOL)goNonDiscretionaryOnDownload
{
  return self->_goNonDiscretionaryOnDownload;
}

- (void)setGoNonDiscretionaryOnDownload:(BOOL)a3
{
  self->_goNonDiscretionaryOnDownload = a3;
}

- (SUDescriptor)loadBrainForDescriptor
{
  return self->_loadBrainForDescriptor;
}

- (void)setLoadBrainForDescriptor:(id)a3
{
}

- (SUDescriptor)brainLoadedForDescriptor
{
  return self->_brainLoadedForDescriptor;
}

- (void)setBrainLoadedForDescriptor:(id)a3
{
}

- (unint64_t)brainLoadAttemptsForDescriptor
{
  return self->_brainLoadAttemptsForDescriptor;
}

- (void)setBrainLoadAttemptsForDescriptor:(unint64_t)a3
{
  self->_brainLoadAttemptsForDescriptor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brainLoadedForDescriptor, 0);
  objc_storeStrong((id *)&self->_loadBrainForDescriptor, 0);
  objc_storeStrong((id *)&self->_downloadProgressSnapshotDate, 0);
  objc_storeStrong((id *)&self->_downloadProgressSnapshot, 0);
  objc_storeStrong((id *)&self->_download, 0);
  objc_storeStrong((id *)&self->_downloadAsset, 0);
  objc_destroyWeak((id *)&self->_core);
}

@end