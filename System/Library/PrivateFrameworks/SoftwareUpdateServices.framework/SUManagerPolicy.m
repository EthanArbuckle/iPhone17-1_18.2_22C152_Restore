@interface SUManagerPolicy
- (BOOL)isAutoUpdateEnabled;
- (BOOL)isClearingSpace;
- (BOOL)isCurrentUpdateAutoUpdate;
- (BOOL)isDelayingUpdates;
- (BOOL)isDownloaded;
- (BOOL)isDownloading;
- (BOOL)isForeground;
- (BOOL)isInstallTonight;
- (BOOL)isInstallTonightScheduled;
- (BOOL)isInstalling;
- (BOOL)isRollingBack;
- (BOOL)isScanning;
- (BOOL)isSplatOnlyUpdateRollbackSuggested;
- (BOOL)isUpdateReadyForInstallation:(id *)a3;
- (BOOL)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4;
- (BOOL)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4;
- (BOOL)splatRollbackAllowed:(id *)a3;
- (NSDictionary)mandatoryUpdateDictionary;
- (SUAutoUpdatePasscodePolicy)passcodePolicy;
- (SUManagerCore)core;
- (SUManagerDelegate)delegate;
- (SUManagerPolicy)init;
- (id)alternateLastScannedDescriptor;
- (id)delayEndDate;
- (id)download;
- (id)eligibleRollbackWithOptions:(id)a3;
- (id)installPolicy;
- (id)preferredLastScannedDescriptor;
- (id)previousRollbackWithOptions:(id)a3;
- (id)slaVersion;
- (unint64_t)softwareUpdatePathRestriction;
- (void)addObserver:(id)a3;
- (void)addUnlockCallback:(SEL)a3 forKey:(id)a4;
- (void)autoSUFailedWithError:(id)a3;
- (void)autoScanAndDownloadIfAvailable:(int)a3;
- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5;
- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4;
- (void)badgeSettingsForManualSoftwareUpdate:(id)a3;
- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)createInstallationKeybag:(id)a3 withResult:(id)a4;
- (void)destroyInstallationKeybag;
- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5;
- (void)dismissAutoUpdateBanner;
- (void)endAutoDownloadTasksAndResetState;
- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4;
- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4;
- (void)isUpdateReadyForInstallationWithReplyHandler:(id)a3;
- (void)loadBrainOnUnlock;
- (void)managedInstallRequested;
- (void)networkMonitorDetectOverrides;
- (void)noteAutoDownloadFailedToStartWithError:(id)a3;
- (void)pauseDownload:(id)a3;
- (void)persistStashOnUnlock;
- (void)presentAutoUpdateBanner:(id)a3;
- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)removeObserver:(id)a3;
- (void)removeUnlockCallback:(id)a3;
- (void)reportOTAAutoTriggeredEvent;
- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4;
- (void)reportSimulatedOTAAutoTriggeredEvent;
- (void)resumeDownload:(id)a3;
- (void)resumeOrResetIfNecessary;
- (void)rollbackReadyForReboot;
- (void)scanForUpdates:(id)a3 complete:(id)a4;
- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5;
- (void)setCore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForeground:(BOOL)a3;
- (void)setIsInstallTonight:(BOOL)a3;
- (void)setIsInstallTonightScheduled:(BOOL)a3;
- (void)setMandatoryUpdateDictionary:(id)a3;
- (void)setPasscodePolicy:(id)a3;
- (void)startDownload:(id)a3;
- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4;
- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)tryAutoDownload;
- (void)unbadgeSettingsForManualSoftwareUpdate;
- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4;
- (void)updateDownloadOptions:(id)a3 withResult:(id)a4;
- (void)updateInstallPolicyType:(unint64_t)a3;
- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5;
@end

@implementation SUManagerPolicy

void __33__SUManagerPolicy_setForeground___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 setForeground:*(unsigned __int8 *)(a1 + 40)];
}

void __27__SUManagerPolicy_download__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 download];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setForeground:(BOOL)a3
{
  id v5 = [(SUManagerPolicy *)self core];
  v6 = [v5 workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__SUManagerPolicy_setForeground___block_invoke;
  v7[3] = &unk_26447CD98;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(v6, v7);
}

- (id)download
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __27__SUManagerPolicy_download__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (SUManagerCore)core
{
  return self->_core;
}

- (SUManagerPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUManagerPolicy;
  uint64_t v2 = [(SUManagerPolicy *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(SUManagerCore);
    core = v2->_core;
    v2->_core = v3;

    objc_storeWeak((id *)&v2->_delegate, 0);
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  id v6 = [(SUManagerPolicy *)self core];
  [v6 setDelegate:v5];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SUManagerPolicy *)self core];
    id v6 = [v5 workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__SUManagerPolicy_addObserver___block_invoke;
    v7[3] = &unk_26447C8C8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __31__SUManagerPolicy_addObserver___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(SUManagerPolicy *)self core];
    id v6 = [v5 workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SUManagerPolicy_removeObserver___block_invoke;
    v7[3] = &unk_26447C8C8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

void __34__SUManagerPolicy_removeObserver___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (BOOL)isScanning
{
  uint64_t v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __29__SUManagerPolicy_isScanning__block_invoke;
  v8[3] = &unk_26447C8A0;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __29__SUManagerPolicy_isScanning__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isScanning];
}

- (BOOL)isDownloading
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __32__SUManagerPolicy_isDownloading__block_invoke;
  v8[3] = &unk_26447C8A0;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __32__SUManagerPolicy_isDownloading__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isDownloading];
}

- (BOOL)isDownloaded
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__SUManagerPolicy_isDownloaded__block_invoke;
  v8[3] = &unk_26447C8A0;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __31__SUManagerPolicy_isDownloaded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isUpdateDownloaded];
}

- (BOOL)isInstalling
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__SUManagerPolicy_isInstalling__block_invoke;
  v8[3] = &unk_26447C8A0;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __31__SUManagerPolicy_isInstalling__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInstalling];
}

- (BOOL)isForeground
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__SUManagerPolicy_isForeground__block_invoke;
  v8[3] = &unk_26447C8A0;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __31__SUManagerPolicy_isForeground__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isForeground];
}

- (BOOL)isClearingSpace
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__SUManagerPolicy_isClearingSpace__block_invoke;
  v8[3] = &unk_26447C8A0;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __34__SUManagerPolicy_isClearingSpace__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isClearingSpace];
}

- (BOOL)isInstallTonight
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__SUManagerPolicy_isInstallTonight__block_invoke;
  v8[3] = &unk_26447C8A0;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __35__SUManagerPolicy_isInstallTonight__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInstallTonight];
}

- (void)setIsInstallTonight:(BOOL)a3
{
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SUManagerPolicy_setIsInstallTonight___block_invoke;
  v7[3] = &unk_26447CD98;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(v6, v7);
}

void __39__SUManagerPolicy_setIsInstallTonight___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 setIsInstallTonight:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)isInstallTonightScheduled
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SUManagerPolicy_isInstallTonightScheduled__block_invoke;
  v8[3] = &unk_26447C8A0;
  v8[4] = v2;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __44__SUManagerPolicy_isInstallTonightScheduled__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInstallTonightScheduled];
}

- (void)setIsInstallTonightScheduled:(BOOL)a3
{
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__SUManagerPolicy_setIsInstallTonightScheduled___block_invoke;
  v7[3] = &unk_26447CD98;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_async(v6, v7);
}

void __48__SUManagerPolicy_setIsInstallTonightScheduled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 setIsInstallTonightScheduled:*(unsigned __int8 *)(a1 + 40)];
}

- (SUAutoUpdatePasscodePolicy)passcodePolicy
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  id v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__SUManagerPolicy_passcodePolicy__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (SUAutoUpdatePasscodePolicy *)v7;
}

void __33__SUManagerPolicy_passcodePolicy__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 passcodePolicy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setPasscodePolicy:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__SUManagerPolicy_setPasscodePolicy___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __37__SUManagerPolicy_setPasscodePolicy___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 setPasscodePolicy:*(void *)(a1 + 40)];
}

- (void)resumeOrResetIfNecessary
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerPolicy_resumeOrResetIfNecessary__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_sync(v6, block);
}

void __43__SUManagerPolicy_resumeOrResetIfNecessary__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 resumeOrResetIfNecessary];
}

- (void)autoScanAndDownloadIfAvailable:(int)a3
{
}

- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = [(SUManagerPolicy *)self core];
  BOOL v8 = [v7 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SUManagerPolicy_autoScanAndDownloadIfAvailable_withResult___block_invoke;
  block[3] = &unk_26447E778;
  int v12 = a3;
  block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __61__SUManagerPolicy_autoScanAndDownloadIfAvailable_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 autoScanAndDownloadIfAvailable:*(unsigned int *)(a1 + 48) withResult:*(void *)(a1 + 40)];
}

- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5
{
  id v8 = a5;
  id v9 = [(SUManagerPolicy *)self core];
  uint64_t v10 = [v9 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__SUManagerPolicy_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke;
  block[3] = &unk_26447E7A0;
  int v14 = a3;
  BOOL v15 = a4;
  block[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(v10, block);
}

void __73__SUManagerPolicy_autoScanAndDownloadIfAvailable_downloadNow_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 autoScanAndDownloadIfAvailable:*(unsigned int *)(a1 + 48) downloadNow:*(unsigned __int8 *)(a1 + 52) withResult:*(void *)(a1 + 40)];
}

- (void)loadBrainOnUnlock
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__SUManagerPolicy_loadBrainOnUnlock__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

void __36__SUManagerPolicy_loadBrainOnUnlock__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 loadBrainOnUnlock];
}

- (void)tryAutoDownload
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SUManagerPolicy_tryAutoDownload__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

void __34__SUManagerPolicy_tryAutoDownload__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 tryAutoDownload];
}

- (void)noteAutoDownloadFailedToStartWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__SUManagerPolicy_noteAutoDownloadFailedToStartWithError___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __58__SUManagerPolicy_noteAutoDownloadFailedToStartWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 noteAutoDownloadFailedToStartWithError:*(void *)(a1 + 40)];
}

- (void)endAutoDownloadTasksAndResetState
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SUManagerPolicy_endAutoDownloadTasksAndResetState__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

void __52__SUManagerPolicy_endAutoDownloadTasksAndResetState__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 endAutoDownloadTasksAndResetState];
}

- (id)preferredLastScannedDescriptor
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__16;
  int v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__SUManagerPolicy_preferredLastScannedDescriptor__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__SUManagerPolicy_preferredLastScannedDescriptor__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 preferredLastScannedDescriptor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)alternateLastScannedDescriptor
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__16;
  int v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__SUManagerPolicy_alternateLastScannedDescriptor__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__SUManagerPolicy_alternateLastScannedDescriptor__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 alternateLastScannedDescriptor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)presentAutoUpdateBanner:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SUManagerPolicy_presentAutoUpdateBanner___block_invoke;
  v8[3] = &unk_26447C940;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __43__SUManagerPolicy_presentAutoUpdateBanner___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 presentAutoUpdateBanner:*(void *)(a1 + 40)];
}

- (void)dismissAutoUpdateBanner
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUManagerPolicy_dismissAutoUpdateBanner__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

void __42__SUManagerPolicy_dismissAutoUpdateBanner__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 dismissAutoUpdateBanner];
}

- (void)unbadgeSettingsForManualSoftwareUpdate
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SUManagerPolicy_unbadgeSettingsForManualSoftwareUpdate__block_invoke;
  block[3] = &unk_26447C878;
  block[4] = self;
  dispatch_async(v4, block);
}

void __57__SUManagerPolicy_unbadgeSettingsForManualSoftwareUpdate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 unbadgeSettingsForManualSoftwareUpdate];
}

- (void)badgeSettingsForManualSoftwareUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__SUManagerPolicy_badgeSettingsForManualSoftwareUpdate___block_invoke;
  v8[3] = &unk_26447C8C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __56__SUManagerPolicy_badgeSettingsForManualSoftwareUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 badgeSettingsForManualSoftwareUpdate:*(void *)(a1 + 40)];
}

- (void)scanForUpdates:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUManagerPolicy_scanForUpdates_complete___block_invoke;
  block[3] = &unk_26447C968;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __43__SUManagerPolicy_scanForUpdates_complete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 scanForUpdates:*(void *)(a1 + 40) complete:*(void *)(a1 + 48)];
}

- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SUManagerPolicy *)self core];
  id v11 = [v10 workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__SUManagerPolicy_scanForUpdates_shouldUseDDMInState_complete___block_invoke;
  v14[3] = &unk_26447D310;
  v14[4] = self;
  id v15 = v8;
  BOOL v17 = a4;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

void __63__SUManagerPolicy_scanForUpdates_shouldUseDDMInState_complete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 scanForUpdates:*(void *)(a1 + 40) shouldUseDDMInState:*(unsigned __int8 *)(a1 + 56) complete:*(void *)(a1 + 48)];
}

- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUManagerPolicy_cancelDownloadWithOptions_withResult___block_invoke;
  block[3] = &unk_26447C968;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __56__SUManagerPolicy_cancelDownloadWithOptions_withResult___block_invoke(id *a1)
{
  id v2 = (SUPurgeOptions *)a1[4];
  if (!v2)
  {
    id v2 = objc_alloc_init(SUPurgeOptions);
    [(SUPurgeOptions *)v2 setNotifyUser:1];
    [(SUPurgeOptions *)v2 setUserRequested:1];
  }
  uint64_t v3 = [a1[5] core];
  id v12 = 0;
  char v4 = objc_msgSend(v3, "cancelDownload:userRequested:keepDocAssets:error:", -[SUPurgeOptions notifyUser](v2, "notifyUser"), -[SUPurgeOptions userRequested](v2, "userRequested"), 0, &v12);
  id v5 = v12;

  if (a1[6])
  {
    id v6 = [a1[5] core];
    id v7 = [v6 externWorkQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __56__SUManagerPolicy_cancelDownloadWithOptions_withResult___block_invoke_2;
    v8[3] = &unk_26447CE88;
    id v10 = a1[6];
    char v11 = v4;
    id v9 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t __56__SUManagerPolicy_cancelDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerPolicy_purgeDownloadWithOptions_withResult___block_invoke;
  block[3] = &unk_26447C968;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __55__SUManagerPolicy_purgeDownloadWithOptions_withResult___block_invoke(id *a1)
{
  id v2 = (SUPurgeOptions *)a1[4];
  if (!v2)
  {
    id v2 = objc_alloc_init(SUPurgeOptions);
    [(SUPurgeOptions *)v2 setNotifyUser:1];
    [(SUPurgeOptions *)v2 setUserRequested:1];
  }
  uint64_t v3 = [a1[5] core];
  id v12 = 0;
  char v4 = objc_msgSend(v3, "killDownload:userRequested:keepDocAssets:error:", -[SUPurgeOptions notifyUser](v2, "notifyUser"), -[SUPurgeOptions userRequested](v2, "userRequested"), 0, &v12);
  id v5 = v12;

  if (a1[6])
  {
    id v6 = [a1[5] core];
    id v7 = [v6 externWorkQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__SUManagerPolicy_purgeDownloadWithOptions_withResult___block_invoke_2;
    v8[3] = &unk_26447CE88;
    id v10 = a1[6];
    char v11 = v4;
    id v9 = v5;
    dispatch_async(v7, v8);
  }
}

uint64_t __55__SUManagerPolicy_purgeDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)pauseDownload:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  +[SUUtility assignError:&v11 withCode:60];
  id v5 = v11;
  if (v4)
  {
    id v6 = [(SUManagerPolicy *)self core];
    id v7 = [v6 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__SUManagerPolicy_pauseDownload___block_invoke;
    block[3] = &unk_26447CFA0;
    id v10 = v4;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __33__SUManagerPolicy_pauseDownload___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)resumeDownload:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  +[SUUtility assignError:&v11 withCode:60];
  id v5 = v11;
  if (v4)
  {
    id v6 = [(SUManagerPolicy *)self core];
    id v7 = [v6 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__SUManagerPolicy_resumeDownload___block_invoke;
    block[3] = &unk_26447CFA0;
    id v10 = v4;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __34__SUManagerPolicy_resumeDownload___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)startDownload:(id)a3
{
}

- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUManagerPolicy_startDownloadWithMetadata_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __56__SUManagerPolicy_startDownloadWithMetadata_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 startDownloadWithMetadata:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerPolicy_startDownloadWithOptions_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __55__SUManagerPolicy_startDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 startDownloadWithOptions:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [SUDownloadOptions alloc];
  id v9 = [(SUManagerPolicy *)self download];
  id v10 = [v9 descriptor];
  id v11 = [(SUDownloadOptions *)v8 initWithMetadata:v7 andDescriptor:v10];

  [(SUManagerPolicy *)self updateDownloadOptions:v11 withResult:v6];
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SUManagerPolicy_updateDownloadOptions_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __52__SUManagerPolicy_updateDownloadOptions_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 updateDownloadOptions:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SUManagerPolicy *)self core];
  id v12 = [v11 workQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __88__SUManagerPolicy_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
  v16[3] = &unk_26447D3B0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);
}

void __88__SUManagerPolicy_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 updatesDownloadableWithOptions:*(void *)(a1 + 40) alternateDownloadOptions:*(void *)(a1 + 48) replyHandler:*(void *)(a1 + 56)];
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(SUManagerPolicy *)self core];
  id v11 = [v10 workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __96__SUManagerPolicy_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_replyHandler___block_invoke;
  v14[3] = &unk_26447D310;
  BOOL v17 = a3;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);
}

void __96__SUManagerPolicy_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_replyHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 deviceHasSufficientSpaceForDownloadIncludeAppPurging:*(unsigned __int8 *)(a1 + 56) descriptor:*(void *)(a1 + 40) replyHandler:*(void *)(a1 + 48)];
}

- (void)isUpdateReadyForInstallationWithReplyHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke;
  v8[3] = &unk_26447C940;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke_2;
  v4[3] = &unk_26447E7F0;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 isUpdateReadyForInstallationWithOptions:0 replyHandler:v4];
}

void __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke_2(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 40))
  {
    id v8 = [*(id *)(a1 + 32) core];
    id v9 = [v8 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke_3;
    block[3] = &unk_26447E7C8;
    id v12 = *(id *)(a1 + 40);
    char v13 = a2;
    char v14 = a3;
    id v11 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __64__SUManagerPolicy_isUpdateReadyForInstallationWithReplyHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32));
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2;
  v5[3] = &unk_26447E7F0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 isUpdateReadyForInstallationWithOptions:v3 replyHandler:v5];
}

void __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 40))
  {
    id v8 = [*(id *)(a1 + 32) core];
    id v9 = [v8 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_3;
    block[3] = &unk_26447E7C8;
    id v12 = *(id *)(a1 + 40);
    char v13 = a2;
    char v14 = a3;
    id v11 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __70__SUManagerPolicy_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(void *)(a1 + 32));
}

- (BOOL)isUpdateReadyForInstallation:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_not_V2(v6);

  id v7 = [(SUManagerPolicy *)self core];
  id v8 = [v7 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUManagerPolicy_isUpdateReadyForInstallation___block_invoke;
  block[3] = &unk_26447C8F0;
  void block[4] = self;
  void block[5] = &v11;
  block[6] = a3;
  dispatch_sync(v8, block);

  LOBYTE(a3) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)a3;
}

void __48__SUManagerPolicy_isUpdateReadyForInstallation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isUpdateReadyForInstallation:*(void *)(a1 + 48)];
}

- (void)autoSUFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SUManagerPolicy_autoSUFailedWithError___block_invoke;
  v8[3] = &unk_26447C8C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __41__SUManagerPolicy_autoSUFailedWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 autoSUFailedWithError:*(void *)(a1 + 40)];
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SUManagerPolicy_installUpdateWithInstallOptions_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __62__SUManagerPolicy_installUpdateWithInstallOptions_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 installUpdateWithInstallOptions:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

- (id)eligibleRollbackWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__16;
  BOOL v17 = __Block_byref_object_dispose__16;
  id v18 = 0;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUManagerPolicy_eligibleRollbackWithOptions___block_invoke;
  block[3] = &unk_26447D728;
  id v11 = v4;
  id v12 = &v13;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __47__SUManagerPolicy_eligibleRollbackWithOptions___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 eligibleRollbackWithOptions:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SUManagerPolicy_rollbackUpdateWithOptions_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);

  return 0;
}

void __56__SUManagerPolicy_rollbackUpdateWithOptions_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 rollbackUpdateWithOptions:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

- (id)previousRollbackWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__16;
  BOOL v17 = __Block_byref_object_dispose__16;
  id v18 = 0;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SUManagerPolicy_previousRollbackWithOptions___block_invoke;
  block[3] = &unk_26447D728;
  id v11 = v4;
  id v12 = &v13;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __47__SUManagerPolicy_previousRollbackWithOptions___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 previousRollbackWithOptions:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isRollingBack
{
  uint64_t v2 = self;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SUManagerPolicy_isRollingBack__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = v8[3] != 0;
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __32__SUManagerPolicy_isRollingBack__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isRollingBack];
}

- (void)rollbackReadyForReboot
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SUManagerPolicy_rollbackReadyForReboot__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __41__SUManagerPolicy_rollbackReadyForReboot__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 rollbackReadyForReboot];
}

- (BOOL)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  uint64_t v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SUManagerPolicy_securityResponseRollbackSuggested_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);

  return 0;
}

void __64__SUManagerPolicy_securityResponseRollbackSuggested_withResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 securityResponseRollbackSuggested:*(void *)(a1 + 40) withResult:*(void *)(a1 + 48)];
}

- (id)slaVersion
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__16;
  id v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __29__SUManagerPolicy_slaVersion__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __29__SUManagerPolicy_slaVersion__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 slaVersion];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)createInstallationKeybag:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  uint64_t v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke;
  block[3] = &unk_26447C968;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) core];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke_2;
  v5[3] = &unk_26447E818;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 createInstallationKeybag:v3 withResult:v5];
}

void __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) core];
    id v7 = [v6 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke_3;
    block[3] = &unk_26447CE88;
    id v10 = *(id *)(a1 + 40);
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __55__SUManagerPolicy_createInstallationKeybag_withResult___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)destroyInstallationKeybag
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUManagerPolicy_destroyInstallationKeybag__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __44__SUManagerPolicy_destroyInstallationKeybag__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 clearKeybagStash];
}

- (BOOL)isAutoUpdateEnabled
{
  uint64_t v2 = self;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__SUManagerPolicy_isAutoUpdateEnabled__block_invoke;
  v8[3] = &unk_26447C8A0;
  void v8[4] = v2;
  void v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __38__SUManagerPolicy_isAutoUpdateEnabled__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isAutoUpdateEnabled];
}

- (BOOL)isCurrentUpdateAutoUpdate
{
  id v2 = self;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__SUManagerPolicy_isCurrentUpdateAutoUpdate__block_invoke;
  v8[3] = &unk_26447C8A0;
  void v8[4] = v2;
  void v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __44__SUManagerPolicy_isCurrentUpdateAutoUpdate__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  if ([v5 isAutoUpdateEnabled])
  {
    id v2 = [*(id *)(a1 + 32) core];
    uint64_t v3 = [v2 download];
    id v4 = [v3 downloadOptions];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 isAutoDownload];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (unint64_t)softwareUpdatePathRestriction
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__SUManagerPolicy_softwareUpdatePathRestriction__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __48__SUManagerPolicy_softwareUpdatePathRestriction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 softwareUpdatePathRestriction];
}

- (BOOL)isDelayingUpdates
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__SUManagerPolicy_isDelayingUpdates__block_invoke;
  v8[3] = &unk_26447C8A0;
  void v8[4] = v2;
  void v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __36__SUManagerPolicy_isDelayingUpdates__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isDelayingUpdates];
}

- (id)delayEndDate
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__16;
  id v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __31__SUManagerPolicy_delayEndDate__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __31__SUManagerPolicy_delayEndDate__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 delayEndDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)splatRollbackAllowed:(id *)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_not_V2(v6);

  id v7 = [(SUManagerPolicy *)self core];
  id v8 = [v7 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUManagerPolicy_splatRollbackAllowed___block_invoke;
  block[3] = &unk_26447C8F0;
  void block[4] = self;
  void block[5] = &v11;
  block[6] = a3;
  dispatch_sync(v8, block);

  LOBYTE(a3) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)a3;
}

void __40__SUManagerPolicy_splatRollbackAllowed___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isSplatRollbackAllowed:*(void *)(a1 + 48)];
}

- (BOOL)isSplatOnlyUpdateRollbackSuggested
{
  id v2 = self;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)v2 core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SUManagerPolicy_isSplatOnlyUpdateRollbackSuggested__block_invoke;
  v8[3] = &unk_26447C8A0;
  void v8[4] = v2;
  void v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v2) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v2;
}

void __53__SUManagerPolicy_isSplatOnlyUpdateRollbackSuggested__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isSplatOnlyUpdateRollbackSuggested];
}

- (void)managedInstallRequested
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUManagerPolicy_managedInstallRequested__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v6, block);
}

void __42__SUManagerPolicy_managedInstallRequested__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 managedInstallRequested];
}

- (NSDictionary)mandatoryUpdateDictionary
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__16;
  char v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__SUManagerPolicy_mandatoryUpdateDictionary__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSDictionary *)v7;
}

void __44__SUManagerPolicy_mandatoryUpdateDictionary__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 mandatoryUpdateDictionary];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setMandatoryUpdateDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__SUManagerPolicy_setMandatoryUpdateDictionary___block_invoke;
  v8[3] = &unk_26447C8C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __48__SUManagerPolicy_setMandatoryUpdateDictionary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 setMandatoryUpdateDictionary:*(void *)(a1 + 40)];
}

- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUManagerPolicy *)self core];
  id v9 = [v8 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SUManagerPolicy_reportPostponedEvent_withStatus___block_invoke;
  block[3] = &unk_26447CD70;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __51__SUManagerPolicy_reportPostponedEvent_withStatus___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 reportPostponedEvent:*(void *)(a1 + 40) withStatus:*(void *)(a1 + 48)];
}

- (void)reportSimulatedOTAAutoTriggeredEvent
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SUManagerPolicy_reportSimulatedOTAAutoTriggeredEvent__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __55__SUManagerPolicy_reportSimulatedOTAAutoTriggeredEvent__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 reportSimulatedOTAAutoTriggeredEvent];
}

- (void)reportOTAAutoTriggeredEvent
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUManagerPolicy_reportOTAAutoTriggeredEvent__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __46__SUManagerPolicy_reportOTAAutoTriggeredEvent__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 reportOTAAutoTriggeredEvent];
}

- (id)installPolicy
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__16;
  id v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_not_V2(v4);

  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__SUManagerPolicy_installPolicy__block_invoke;
  v9[3] = &unk_26447C8A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __32__SUManagerPolicy_installPolicy__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v5 installPolicy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)updateInstallPolicyType:(unint64_t)a3
{
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SUManagerPolicy_updateInstallPolicyType___block_invoke;
  v7[3] = &unk_26447CA30;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_async(v6, v7);
}

void __43__SUManagerPolicy_updateInstallPolicyType___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 updateInstallPolicyType:*(void *)(a1 + 40)];
}

- (void)addUnlockCallback:(SEL)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(SUManagerPolicy *)self core];
  id v8 = [v7 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SUManagerPolicy_addUnlockCallback_forKey___block_invoke;
  block[3] = &unk_26447C918;
  id v11 = v6;
  SEL v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __44__SUManagerPolicy_addUnlockCallback_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 addUnlockCallback:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
}

- (void)removeUnlockCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(SUManagerPolicy *)self core];
  id v6 = [v5 workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__SUManagerPolicy_removeUnlockCallback___block_invoke;
  v8[3] = &unk_26447C8C8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __40__SUManagerPolicy_removeUnlockCallback___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) core];
  [v2 removeUnlockCallback:*(void *)(a1 + 40)];
}

- (void)persistStashOnUnlock
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SUManagerPolicy_persistStashOnUnlock__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __39__SUManagerPolicy_persistStashOnUnlock__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 persistStashOnUnlock];
}

- (void)networkMonitorDetectOverrides
{
  uint64_t v3 = [(SUManagerPolicy *)self core];
  id v4 = [v3 workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUManagerPolicy_networkMonitorDetectOverrides__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __48__SUManagerPolicy_networkMonitorDetectOverrides__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) core];
  [v1 networkMonitorDetectOverrides];
}

- (void)setCore:(id)a3
{
}

- (SUManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_core, 0);
}

@end