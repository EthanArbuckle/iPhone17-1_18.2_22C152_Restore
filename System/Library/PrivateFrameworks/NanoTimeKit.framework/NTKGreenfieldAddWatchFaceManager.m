@interface NTKGreenfieldAddWatchFaceManager
- (BOOL)_canAddFaceWithoutAllCompicationInstalled;
- (BOOL)hasSkippedComplications;
- (NSString)addFaceDescription;
- (NSUUID)addedFaceID;
- (NTKGreenfieldAddWatchFaceManager)init;
- (NTKGreenfieldAddWatchFaceManagerDelegate)delegate;
- (NTKGreenfieldDecodedRecipe)decodedRecipe;
- (id)_addToLibraryOrUpdateFaceInLibrary;
- (id)_analyticsExitScreenNameForCurrentState;
- (id)_analyticsModelForAddFaceEvents;
- (id)_appNameFromItemId:(id)a3;
- (id)_curPendingComplicationItemId;
- (id)_missingAppsDescription;
- (id)_queue_fetchLocallyAvailableAppsWithError:(id *)a3;
- (id)canAddWatchFaceFromDecodedRecipe:(id)a3 toLibrary:(id)a4;
- (id)skippedComplicationsSlots;
- (int64_t)remainingAppsToInstallCount;
- (int64_t)remainingComplicationsToInstallCount;
- (int64_t)totalNonInstalledAppCount;
- (int64_t)viewedNonInstalledAppCount;
- (void)_buildUnavailableComplicationsInformationWithInstalledBundleIds:(id)a3;
- (void)_cancelLibraryTimeoutTimer;
- (void)_cleanUpDownloader;
- (void)_decodeUrl:(id)a3;
- (void)_handleAddWatchFaceManagerDidFinishWithError:(id)a3;
- (void)_libraryTimeoutTimerFired;
- (void)_moveAndNotifyDelegateToStartStateIfPossible;
- (void)_queue_fetchInstalledAppsOnWatchWithithCompletionBlock:(id)a3;
- (void)_refreshInstalledComplicationsWithContinueBlock:(id)a3;
- (void)_startDownloadWirthURL:(id)a3;
- (void)_startLibraryTimeoutTimer;
- (void)_updateUIStateAndNotifyDelegate:(unint64_t)a3;
- (void)dealloc;
- (void)decodeWatchFaceWithURL:(id)a3 sourceApplicationBundleIdentifier:(id)a4;
- (void)faceCollectionDidLoad:(id)a3;
- (void)handleAddToMyFacesAction;
- (void)handleContinueAction;
- (void)handleDidExitAddWatchFaceFlow;
- (void)handleDoneAction;
- (void)handleRevisitSkippedComplicationsAction;
- (void)handleSkipComplicationAction;
- (void)markComplicationAsInstalled;
- (void)openAppStore;
- (void)setDelegate:(id)a3;
@end

@implementation NTKGreenfieldAddWatchFaceManager

- (NTKGreenfieldAddWatchFaceManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)NTKGreenfieldAddWatchFaceManager;
  v2 = [(NTKGreenfieldAddWatchFaceManager *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    skippedPendingComplicationsItemIds = v2->_skippedPendingComplicationsItemIds;
    v2->_skippedPendingComplicationsItemIds = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    installedComplicationIds = v2->_installedComplicationIds;
    v2->_installedComplicationIds = (NSMutableSet *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    locallyAvailableItemIds = v2->_locallyAvailableItemIds;
    v2->_locallyAvailableItemIds = (NSSet *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v9;

    v11 = +[NTKCompanionFaceCollectionsManager sharedInstance];
    v12 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v13 = [v11 sharedFaceCollectionForDevice:v12 forCollectionIdentifier:@"LibraryFaces"];
    library = v2->_library;
    v2->_library = (NTKPersistentFaceCollection *)v13;

    [(NTKFaceCollection *)v2->_library addObserver:v2];
    if (![(NTKPersistentFaceCollection *)v2->_library hasLoaded]) {
      [(NTKGreenfieldAddWatchFaceManager *)v2 _startLibraryTimeoutTimer];
    }
  }
  return v2;
}

- (void)dealloc
{
  [(NTKFaceCollection *)self->_library removeObserver:self];
  [(NTKGreenfieldAddWatchFaceManager *)self _cleanUpDownloader];
  v3.receiver = self;
  v3.super_class = (Class)NTKGreenfieldAddWatchFaceManager;
  [(NTKGreenfieldAddWatchFaceManager *)&v3 dealloc];
}

- (void)decodeWatchFaceWithURL:(id)a3 sourceApplicationBundleIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F19A30] currentDevice];
  dispatch_queue_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"21EB4560-EFA0-46AA-B75C-401D30C5BBF1"];
  char v10 = [v8 supportsCapability:v9];

  if (v10)
  {
    failedError = self->_failedError;
    self->_failedError = 0;

    v12 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "decodeWatchFaceWithURL: %@", (uint8_t *)&v19, 0xCu);
    }

    unint64_t decodingState = self->_decodingState;
    if (decodingState && decodingState != 3) {
      -[NTKGreenfieldAddWatchFaceManager decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:]();
    }
    objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, a4);
    [(NTKGreenfieldAddWatchFaceManager *)self _updateUIStateAndNotifyDelegate:0];
    if (self->_isLibraryTimeout)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 9;
    }
    else
    {
      if ([v6 isFileURL])
      {
        [(NTKGreenfieldAddWatchFaceManager *)self _decodeUrl:v6];
        goto LABEL_10;
      }
      v17 = [v6 scheme];
      int v18 = [v17 isEqualToString:@"watchface"];

      if (v18)
      {
        [(NTKGreenfieldAddWatchFaceManager *)self _startDownloadWirthURL:v6];
        goto LABEL_10;
      }
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 12;
  }
  objc_super v16 = objc_msgSend(v14, "greenfield_addWatchFaceErrorWithCode:", v15);
  [(NTKGreenfieldAddWatchFaceManager *)self _handleAddWatchFaceManagerDidFinishWithError:v16];

LABEL_10:
}

- (void)_decodeUrl:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "_decodeUrl: %@", buf, 0xCu);
  }

  self->_unint64_t decodingState = 2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke;
  v7[3] = &unk_1E62C55D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[NTKGreenfieldUtilities decodeWatchFaceFromUrl:v6 completionBlock:v7];
}

void __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v6;
    __int16 v34 = 2112;
    id v35 = v7;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "_decodeUrl completed: decodedRecipe: %@ decodedError: %@", buf, 0x16u);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (!v6 || v7)
  {
    *(void *)(v9 + 16) = 0;
    [*(id *)(a1 + 32) _handleAddWatchFaceManagerDidFinishWithError:v7];
  }
  else
  {
    objc_storeStrong((id *)(v9 + 8), a2);
    id v10 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v11 = [v10 nrDevice];

    if (v11)
    {
      v12 = [MEMORY[0x1E4F19A30] currentDevice];
      int v13 = [v12 isTinker];

      if (!v13)
      {
        v30 = *(void **)(a1 + 32);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_306;
        v31[3] = &unk_1E62BFF20;
        v31[4] = v30;
        [v30 _refreshInstalledComplicationsWithContinueBlock:v31];
        goto LABEL_16;
      }
      v14 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
      }

      v22 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 13);
      [*(id *)(a1 + 32) _handleAddWatchFaceManagerDidFinishWithError:v22];
    }
    else
    {
      v23 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_cold_1(a1, v23, v24, v25, v26, v27, v28, v29);
      }

      v22 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 3);
      [*(id *)(a1 + 32) _handleAddWatchFaceManagerDidFinishWithError:v22];
      [*(id *)(a1 + 32) _cancelLibraryTimeoutTimer];
    }
  }
LABEL_16:
}

uint64_t __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_306(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = 3;
  return [*(id *)(a1 + 32) _moveAndNotifyDelegateToStartStateIfPossible];
}

- (void)_startDownloadWirthURL:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "_startDownloadWirthURL: %@", buf, 0xCu);
  }

  self->_unint64_t decodingState = 1;
  id v6 = [[NTKGreenfieldDownloader alloc] initWithWatchFaceURL:v4];
  downloader = self->_downloader;
  self->_downloader = v6;

  objc_initWeak((id *)buf, self);
  id v8 = self->_downloader;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__NTKGreenfieldAddWatchFaceManager__startDownloadWirthURL___block_invoke;
  v10[3] = &unk_1E62C5600;
  id v9 = v4;
  id v11 = v9;
  objc_copyWeak(&v13, (id *)buf);
  v12 = self;
  [(NTKGreenfieldDownloader *)v8 downloadWithCompletionBlock:v10];
  objc_destroyWeak(&v13);

  objc_destroyWeak((id *)buf);
}

void __59__NTKGreenfieldAddWatchFaceManager__startDownloadWirthURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v12 = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "_startDownloadWirthURL: %@ completed: %@", (uint8_t *)&v12, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
      [v10 _decodeUrl:v11];
    }
    else
    {
      WeakRetained[2] = 0;
      [WeakRetained _cleanUpDownloader];
      [*(id *)(a1 + 40) _handleAddWatchFaceManagerDidFinishWithError:v6];
    }
  }
}

- (void)_cleanUpDownloader
{
  [(NTKGreenfieldDownloader *)self->_downloader cancelDownload];
  [(NTKGreenfieldDownloader *)self->_downloader downloadCleanUp];
  downloader = self->_downloader;
  self->_downloader = 0;
}

- (void)handleAddToMyFacesAction
{
  if (self->_uiState == 1)
  {
    objc_super v3 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "StartState: handleAddToMyFacesAction", v5, 2u);
    }

    id v4 = [(NTKGreenfieldAddWatchFaceManager *)self _addToLibraryOrUpdateFaceInLibrary];
    [(NTKGreenfieldAddWatchFaceManager *)self _handleAddWatchFaceManagerDidFinishWithError:v4];
  }
}

- (void)handleContinueAction
{
  unint64_t uiState = self->_uiState;
  if (uiState != 2)
  {
    if (uiState != 1) {
      return;
    }
    id v4 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldAddWatchFaceUIStateStart: handleContinueAction", buf, 2u);
    }

    if ([(NSMutableSet *)self->_unavailableComplicationsSlots count])
    {
      id v5 = self;
      uint64_t v6 = 2;
LABEL_14:
      [(NTKGreenfieldAddWatchFaceManager *)v5 _updateUIStateAndNotifyDelegate:v6];
      return;
    }
    if (self->_totalNonInstalledAppCount < 1) {
      return;
    }
LABEL_13:
    id v5 = self;
    uint64_t v6 = 3;
    goto LABEL_14;
  }
  id v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldAddWatchFaceUIStateComplicationsNotAvailable: handleContinueAction", v9, 2u);
  }

  if (self->_totalNonInstalledAppCount >= 1) {
    goto LABEL_13;
  }
  uint64_t v8 = [(NTKGreenfieldAddWatchFaceManager *)self _addToLibraryOrUpdateFaceInLibrary];
  if (v8) {
    [(NTKGreenfieldAddWatchFaceManager *)self _handleAddWatchFaceManagerDidFinishWithError:v8];
  }
  else {
    [(NTKGreenfieldAddWatchFaceManager *)self _updateUIStateAndNotifyDelegate:4];
  }
}

- (void)handleDoneAction
{
  if (self->_uiState == 4)
  {
    objc_super v3 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "CompletedState: handleDoneAction", v4, 2u);
    }

    [(NTKGreenfieldAddWatchFaceManager *)self _handleAddWatchFaceManagerDidFinishWithError:0];
  }
}

- (void)handleRevisitSkippedComplicationsAction
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_uiState == 4)
  {
    objc_super v3 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(NTKGreenfieldAddWatchFaceManager *)self _curPendingComplicationItemId];
      *(_DWORD *)buf = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "handleRevisitSkippedComplicationsAction: current complication id: %@", buf, 0xCu);
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __75__NTKGreenfieldAddWatchFaceManager_handleRevisitSkippedComplicationsAction__block_invoke;
    v5[3] = &unk_1E62BFF20;
    v5[4] = self;
    [(NTKGreenfieldAddWatchFaceManager *)self _refreshInstalledComplicationsWithContinueBlock:v5];
  }
}

uint64_t __75__NTKGreenfieldAddWatchFaceManager_handleRevisitSkippedComplicationsAction__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) remainingComplicationsToInstallCount] > 0) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = 4;
  }
  objc_super v3 = *(void **)(a1 + 32);
  return [v3 _updateUIStateAndNotifyDelegate:v2];
}

- (void)handleSkipComplicationAction
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_uiState == 3)
  {
    objc_super v3 = [(NTKGreenfieldAddWatchFaceManager *)self _curPendingComplicationItemId];
    if (v3)
    {
      [(NSMutableSet *)self->_skippedPendingComplicationsItemIds addObject:v3];
      [(NSMutableArray *)self->_orderedPendingComplicationsItemIds removeObject:v3];
      ++self->_viewedNonInstalledAppCount;
    }
    id v4 = [(NTKGreenfieldAddWatchFaceManager *)self _curPendingComplicationItemId];
    id v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "handleSkipComplicationAction current complication id: %@, nextComplication id: %@", (uint8_t *)&v7, 0x16u);
    }

    if (v4)
    {
      [(NTKGreenfieldAddWatchFaceManager *)self _updateUIStateAndNotifyDelegate:3];
    }
    else
    {
      uint64_t v6 = [(NTKGreenfieldAddWatchFaceManager *)self _addToLibraryOrUpdateFaceInLibrary];
      if (v6) {
        [(NTKGreenfieldAddWatchFaceManager *)self _handleAddWatchFaceManagerDidFinishWithError:v6];
      }
      else {
        [(NTKGreenfieldAddWatchFaceManager *)self _updateUIStateAndNotifyDelegate:4];
      }
    }
  }
}

- (id)skippedComplicationsSlots
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (void *)[(NSMutableSet *)self->_skippedPendingComplicationsItemIds copy];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe complicationSlotToItemIdMapping];
        uint64_t v11 = [v10 allKeysForObject:v9];

        if (v11) {
          [v3 addObjectsFromArray:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  int v12 = [(NSMutableSet *)self->_unavailableComplicationsSlots allObjects];
  [v3 addObjectsFromArray:v12];

  uint64_t v13 = [v3 allObjects];

  return v13;
}

- (void)openAppStore
{
  int64_t totalNonInstalledAppCount = self->_totalNonInstalledAppCount;
  if (totalNonInstalledAppCount)
  {
    if (totalNonInstalledAppCount == 1
      && [(NSMutableArray *)self->_orderedPendingComplicationsItemIds count] == 1)
    {
      id v8 = [(NSMutableArray *)self->_orderedPendingComplicationsItemIds firstObject];
      id v4 = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@", v8];
      uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v6 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
      [v5 openURL:v6 options:MEMORY[0x1E4F1CC08] completionHandler:0];
    }
    else
    {
      serialQueue = self->_serialQueue;
      dispatch_async(serialQueue, &__block_literal_global_99);
    }
  }
}

void __48__NTKGreenfieldAddWatchFaceManager_openAppStore__block_invoke()
{
  id v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openApplicationWithBundleID:@"com.apple.AppStore"];
}

- (NSString)addFaceDescription
{
  objc_super v3 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
  id v4 = [(NTKGreenfieldAddWatchFaceManager *)self _missingAppsDescription];
  if (([v3 isUsingConfigurationModifiedForThisDevice] & 1) != 0
    || [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe wasModifiedForThisDevice])
  {
    if (v4)
    {
      uint64_t v5 = NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_CONFIGURATION_WAS_MODIFIED_AND_HAS_MISSING_APPS", 0);
      uint64_t v6 = objc_msgSend(NSString, "localizedStringWithFormat:", v5, v4);

      goto LABEL_9;
    }
    NTKClockFaceLocalizedString(@"GREENFIELD_ADD_WATCH_FACE_CONFIGURATION_WAS_MODIFIED", 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (v4)
  {
    id v7 = v4;
LABEL_8:
    uint64_t v6 = v7;
    goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_9:

  return (NSString *)v6;
}

- (id)_missingAppsDescription
{
  objc_super v3 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
  if (self->_totalNonInstalledSlotCount == 1)
  {
    id v4 = @"GREENFIELD_ADD_WATCH_FACE_A_COMPLICATION";
    uint64_t v5 = @"a complication";
  }
  else
  {
    id v4 = @"GREENFIELD_ADD_WATCH_FACE_COMPLICATIONS";
    uint64_t v5 = @"complications";
  }
  uint64_t v6 = NTKClockFaceLocalizedString(v4, v5);
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"GREENFIELD_MISSING_APP_COUNT_DESCRIPTION_%ld", self->_totalNonInstalledAppCount);
  id v8 = NTKClockFaceLocalizedString(v7, @"one app");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NTKGreenfieldAddWatchFaceManager__missingAppsDescription__block_invoke;
  aBlock[3] = &unk_1E62C5628;
  aBlock[4] = self;
  id v9 = v6;
  id v20 = v9;
  id v10 = v8;
  id v21 = v10;
  uint64_t v11 = (void (**)(void *, uint64_t, __CFString *))_Block_copy(aBlock);
  if ([v3 faceStyle] == 22)
  {
    if (NTKPhotosIsCustomPhotosFace(v3))
    {
      int v12 = [v3 resourceDirectory];
      uint64_t v13 = +[NTKPhotosReader readerForResourceDirectory:v12];

      __int16 v14 = v11[2](v11, [v13 count], @"GREENFIELD_ADD_WATCH_FACE_PHOTOS_COUNT");

      goto LABEL_17;
    }
  }
  else
  {
    if ([v3 faceStyle] == 23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v3 isUsingCustomAsset])
        {
          __int16 v14 = v11[2](v11, 1, @"GREENFIELD_ADD_WATCH_FACE_KALEIDOSCOPE_COUNT");
          goto LABEL_17;
        }
      }
    }
    int64_t totalNonInstalledAppCount = self->_totalNonInstalledAppCount;
    if (totalNonInstalledAppCount)
    {
      if (totalNonInstalledAppCount == 1) {
        long long v16 = @"GREENFIELD_MISSING_APP_DEFAULT_MISSING_SINGULAR";
      }
      else {
        long long v16 = @"GREENFIELD_MISSING_APP_DEFAULT_MISSING_PLURAL";
      }
      long long v17 = NTKClockFaceLocalizedString(v16, @"This face includes %@ from %@ in the App Store.");
      __int16 v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v17, v9, v10);

      goto LABEL_17;
    }
  }
  __int16 v14 = 0;
LABEL_17:

  return v14;
}

id __59__NTKGreenfieldAddWatchFaceManager__missingAppsDescription__block_invoke(void *a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1[4] + 176))
  {
    uint64_t v5 = NTKClockFaceLocalizedString(a3, @"a photo");
    uint64_t v6 = objc_msgSend(NSString, "localizedStringWithFormat:", v5, a2);
    id v7 = NTKClockFaceLocalizedString(@"GREENFIELD_MISSING_APP_PHOTOS_APP_MISSING_IOS", @"This face contains %@ and %@ from %@ in the App Store.");
    id v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v7, v6, a1[5], a1[6]);
  }
  else
  {
    uint64_t v5 = NTKClockFaceLocalizedString(@"GREENFIELD_PHOTOS_COUNT_DESCRIPTION", @"nil");
    id v8 = objc_msgSend(NSString, "localizedStringWithFormat:", v5, a2);
  }

  return v8;
}

- (BOOL)_canAddFaceWithoutAllCompicationInstalled
{
  return 1;
}

- (void)_buildUnavailableComplicationsInformationWithInstalledBundleIds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
  uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [v5 device];
  id v9 = NTKRestrictedComplicationsForDevice(v8);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__NTKGreenfieldAddWatchFaceManager__buildUnavailableComplicationsInformationWithInstalledBundleIds___block_invoke;
  v19[3] = &unk_1E62C5650;
  id v20 = v5;
  id v21 = v9;
  v22 = self;
  id v23 = v4;
  id v10 = v6;
  uint64_t v24 = v10;
  uint64_t v11 = v7;
  uint64_t v25 = v11;
  id v12 = v4;
  id v13 = v9;
  id v14 = v5;
  [v14 enumerateComplicationSlotsWithBlock:v19];
  unavailableComplicationsSlots = self->_unavailableComplicationsSlots;
  self->_unavailableComplicationsSlots = v10;
  long long v16 = v10;

  unavailableComplicationsNames = self->_unavailableComplicationsNames;
  self->_unavailableComplicationsNames = v11;
  long long v18 = v11;
}

void __100__NTKGreenfieldAddWatchFaceManager__buildUnavailableComplicationsInformationWithInstalledBundleIds___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  objc_super v3 = objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 complication];

    objc_super v3 = (void *)v4;
  }
  if ([v3 complicationType])
  {
    uint64_t v5 = [v3 appIdentifier];
    int v6 = NTKCanAddInternalComplicationWithBundleId(v5);

    if (!v6 || (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v3, "complicationType")) & 1) != 0)
    {
LABEL_6:
      [*(id *)(a1 + 64) addObject:v17];
      id v7 = [*(id *)(*(void *)(a1 + 48) + 8) complicationSlotToNameMapping];
      id v8 = [v7 objectForKeyedSubscript:v17];

      if (v8) {
        [*(id *)(a1 + 72) addObject:v8];
      }
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [*(id *)(a1 + 32) preferredComplicationFamilyForComplication:v3 withSlot:v17];
      id v10 = +[NTKBundleComplicationManager sharedManager];
      uint64_t v11 = [*(id *)(a1 + 32) device];
      uint64_t v12 = [v10 dataSourceClassForBundleComplication:v3 withFamily:v9 andDevice:v11 factorInMigration:1];

      if (!v12) {
        goto LABEL_6;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v13 = [*(id *)(*(void *)(a1 + 48) + 8) complicationSlotToItemIdMapping];
        id v8 = [v13 objectForKeyedSubscript:v17];

        if (v8 && [v8 intValue])
        {
LABEL_8:

          goto LABEL_9;
        }
        id v14 = [*(id *)(*(void *)(a1 + 48) + 8) complicationSlotToBundleIdMapping];
        long long v15 = [v14 objectForKeyedSubscript:v17];

        if (!v15)
        {

          goto LABEL_6;
        }
        char v16 = [*(id *)(a1 + 56) containsObject:v15];

        if ((v16 & 1) == 0) {
          goto LABEL_6;
        }
      }
    }
  }
LABEL_9:
}

- (void)_refreshInstalledComplicationsWithContinueBlock:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke;
  v7[3] = &unk_1E62C2290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__29;
  v63 = __Block_byref_object_dispose__29;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__29;
  v57 = __Block_byref_object_dispose__29;
  id v58 = 0;
  uint64_t v50 = 0;
  v51[0] = &v50;
  v51[1] = 0x3032000000;
  v51[2] = __Block_byref_object_copy__29;
  v51[3] = __Block_byref_object_dispose__29;
  id v52 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  objc_super v3 = *(void **)(a1 + 32);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_378;
  v45[3] = &unk_1E62C5678;
  v47 = &v59;
  v48 = &v53;
  v49 = &v50;
  id v4 = v2;
  v46 = v4;
  objc_msgSend(v3, "_queue_fetchInstalledAppsOnWatchWithithCompletionBlock:", v45);
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v4, v5);
  id v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)v60[5];
    uint64_t v8 = v54[5];
    uint64_t v9 = *(void *)(v51[0] + 40);
    *(_DWORD *)buf = 138412802;
    id v66 = v7;
    __int16 v67 = 2112;
    uint64_t v68 = v8;
    __int16 v69 = 2112;
    uint64_t v70 = v9;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "_queue_fetchInstalledAppsOnWatchWithError: itemIds: %@  bundleIds:%@ error:%@", buf, 0x20u);
  }

  id v10 = (id *)(v51[0] + 40);
  if (*(void *)(v51[0] + 40))
  {
    uint64_t v11 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_cold_1((uint64_t)v51, v11, v12, v13, v14, v15, v16, v17);
    }

    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    long long v18 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_380;
    block[3] = &unk_1E62C09C0;
    block[4] = *(void *)(a1 + 32);
    id v44 = v18;
    id v19 = v18;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v20 = *(void **)(a1 + 32);
    id obj = 0;
    objc_msgSend(v20, "_queue_fetchLocallyAvailableAppsWithError:", &obj);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, obj);
    id v21 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(v51[0] + 40);
      *(_DWORD *)buf = 138412546;
      id v66 = v19;
      __int16 v67 = 2112;
      uint64_t v68 = v22;
      _os_log_impl(&dword_1BC5A9000, v21, OS_LOG_TYPE_DEFAULT, "_queue_fetchLocallyAvailableAppsWithError: itemIds: %@ error:%@", buf, 0x16u);
    }

    if (*(void *)(v51[0] + 40))
    {
      *(void *)(*(void *)(a1 + 32) + 16) = 0;
      id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 0);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_381;
      v40[3] = &unk_1E62C09C0;
      v40[4] = *(void *)(a1 + 32);
      id v41 = v23;
      id v24 = v23;
      dispatch_async(MEMORY[0x1E4F14428], v40);
    }
    else
    {
      uint64_t v25 = objc_opt_new();
      dispatch_semaphore_t v26 = dispatch_semaphore_create(0);

      uint64_t v27 = [MEMORY[0x1E4F4BD00] defaultService];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_2;
      v37[3] = &unk_1E62C56A0;
      id v28 = v25;
      id v38 = v28;
      id v4 = v26;
      v39 = v4;
      [v27 getUpdatesWithCompletionBlock:v37];

      dispatch_time_t v29 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v4, v29);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_3;
      v31[3] = &unk_1E62C56C8;
      uint64_t v30 = *(void *)(a1 + 32);
      id v35 = &v53;
      v31[4] = v30;
      id v32 = v19;
      id v33 = v28;
      uint64_t v36 = &v59;
      id v34 = *(id *)(a1 + 40);
      id v24 = v28;
      dispatch_async(MEMORY[0x1E4F14428], v31);
    }
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_378(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v18 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_380(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAddWatchFaceManagerDidFinishWithError:*(void *)(a1 + 40)];
}

uint64_t __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_381(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAddWatchFaceManagerDidFinishWithError:*(void *)(a1 + 40)];
}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 updateState] != 1)
        {
          id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "storeItemIdentifier"));
          [*(id *)(a1 + 32) addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = (void *)MEMORY[0x1E4F1CA80];
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) allObjects];
  uint64_t v4 = [v2 setWithArray:v3];

  v37 = (void *)v4;
  [*(id *)(a1 + 32) _buildUnavailableComplicationsInformationWithInstalledBundleIds:v4];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(a1 + 40));
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = [*(id *)(a1 + 32) decodedRecipe];
  id v8 = [v7 complicationSlotToItemIdMapping];
  id v9 = [v8 allKeys];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v43 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        if (([*(id *)(*(void *)(a1 + 32) + 136) containsObject:v14] & 1) == 0)
        {
          uint64_t v15 = [*(id *)(a1 + 32) decodedRecipe];
          uint64_t v16 = [v15 complicationSlotToItemIdMapping];
          id v17 = [v16 objectForKey:v14];

          if ([v17 intValue])
          {
            if ([*(id *)(a1 + 48) containsObject:v17])
            {
              [v5 addObject:v17];
              goto LABEL_12;
            }
            if (([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) containsObject:v17] & 1) == 0
              && ([*(id *)(*(void *)(a1 + 32) + 96) containsObject:v17] & 1) == 0)
            {
LABEL_12:
              [v6 addObject:v17];
            }
          }

          continue;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v11);
  }

  *(void *)(*(void *)(a1 + 32) + 168) = 1;
  *(void *)(*(void *)(a1 + 32) + 176) = [v6 count];
  uint64_t v36 = v5;
  uint64_t v18 = [v5 copy];
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = *(void **)(v19 + 112);
  *(void *)(v19 + 112) = v18;

  *(void *)(*(void *)(a1 + 32) + 128) = 0;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v22 = [*(id *)(a1 + 32) decodedRecipe];
  id v23 = [v22 watchFace];
  id v24 = [v23 orderedComplicationSlots];

  uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v38 + 1) + 8 * j);
        if (([*(id *)(*(void *)(a1 + 32) + 136) containsObject:v29] & 1) == 0)
        {
          uint64_t v30 = [*(id *)(a1 + 32) decodedRecipe];
          v31 = [v30 complicationSlotToItemIdMapping];
          id v32 = [v31 objectForKeyedSubscript:v29];

          if (v32 && [v6 containsObject:v32])
          {
            [v21 addObject:v32];
            ++*(void *)(*(void *)(a1 + 32) + 128);
          }
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v26);
  }

  uint64_t v33 = *(void *)(a1 + 32);
  id v34 = *(void **)(v33 + 80);
  *(void *)(v33 + 80) = v21;
  id v35 = v21;

  [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_curPendingComplicationItemId
{
  if (self->_uiState == 3)
  {
    dispatch_semaphore_t v2 = [(NSMutableArray *)self->_orderedPendingComplicationsItemIds firstObject];
  }
  else
  {
    dispatch_semaphore_t v2 = 0;
  }
  return v2;
}

- (int64_t)remainingComplicationsToInstallCount
{
  return [(NSMutableArray *)self->_orderedPendingComplicationsItemIds count];
}

- (BOOL)hasSkippedComplications
{
  return [(NSMutableSet *)self->_skippedPendingComplicationsItemIds count] != 0;
}

- (void)markComplicationAsInstalled
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKGreenfieldAddWatchFaceManager *)self _curPendingComplicationItemId];
  if (v3)
  {
    [(NSMutableArray *)self->_orderedPendingComplicationsItemIds removeObject:v3];
    [(NSMutableSet *)self->_installedComplicationIds addObject:v3];
    ++self->_viewedNonInstalledAppCount;
  }
  uint64_t v4 = [(NTKGreenfieldAddWatchFaceManager *)self _curPendingComplicationItemId];
  uint64_t v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "markComplicationAsInstalled current complication id: %@, nextComplication id: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v4)
  {
    [(NTKGreenfieldAddWatchFaceManager *)self _updateUIStateAndNotifyDelegate:3];
  }
  else
  {
    uint64_t v6 = [(NTKGreenfieldAddWatchFaceManager *)self _addToLibraryOrUpdateFaceInLibrary];
    if (v6) {
      [(NTKGreenfieldAddWatchFaceManager *)self _handleAddWatchFaceManagerDidFinishWithError:v6];
    }
    else {
      [(NTKGreenfieldAddWatchFaceManager *)self _updateUIStateAndNotifyDelegate:4];
    }
  }
}

- (void)_startLibraryTimeoutTimer
{
  id v3 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "_startLibraryTimeoutTimer", (uint8_t *)buf, 2u);
  }

  [(NSTimer *)self->_libraryTimeoutTimer invalidate];
  objc_initWeak(buf, self);
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB00];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__NTKGreenfieldAddWatchFaceManager__startLibraryTimeoutTimer__block_invoke;
  v7[3] = &unk_1E62C0628;
  objc_copyWeak(&v8, buf);
  uint64_t v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v7 block:5.0];
  libraryTimeoutTimer = self->_libraryTimeoutTimer;
  self->_libraryTimeoutTimer = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __61__NTKGreenfieldAddWatchFaceManager__startLibraryTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _libraryTimeoutTimerFired];
}

- (void)_libraryTimeoutTimerFired
{
}

- (void)_cancelLibraryTimeoutTimer
{
  [(NSTimer *)self->_libraryTimeoutTimer invalidate];
  libraryTimeoutTimer = self->_libraryTimeoutTimer;
  self->_libraryTimeoutTimer = 0;
}

- (void)faceCollectionDidLoad:(id)a3
{
  uint64_t v4 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "faceCollectionDidLoad", v5, 2u);
  }

  [(NTKGreenfieldAddWatchFaceManager *)self _cancelLibraryTimeoutTimer];
  [(NTKGreenfieldAddWatchFaceManager *)self _moveAndNotifyDelegateToStartStateIfPossible];
}

- (void)_moveAndNotifyDelegateToStartStateIfPossible
{
  if ([(NTKPersistentFaceCollection *)self->_library hasLoaded] && self->_decodingState == 3)
  {
    uint64_t v3 = [(NTKGreenfieldAddWatchFaceManager *)self canAddWatchFaceFromDecodedRecipe:self->_decodedRecipe toLibrary:self->_library];
    id v4 = (id)v3;
    if (v3)
    {
      self->_unint64_t decodingState = 0;
      [(NTKGreenfieldAddWatchFaceManager *)self _handleAddWatchFaceManagerDidFinishWithError:v3];
    }
    else
    {
      [(NTKGreenfieldAddWatchFaceManager *)self _updateUIStateAndNotifyDelegate:1];
    }
  }
}

- (void)_updateUIStateAndNotifyDelegate:(unint64_t)a3
{
  unint64_t uiState = self->_uiState;
  self->_unint64_t uiState = a3;
  switch(a3)
  {
    case 0uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained didStartLoadingInAddWatchFaceManager:self];
      goto LABEL_25;
    case 1uLL:
      if ([(NTKGreenfieldAddWatchFaceManager *)self totalNonInstalledAppCount]) {
        BOOL v5 = 0;
      }
      else {
        BOOL v5 = [(NSMutableSet *)self->_unavailableComplicationsSlots count] == 0;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained addWatchFaceManager:self updateStateToWelcomeWithCanAddFaceDirectly:v5];
      goto LABEL_25;
    case 2uLL:
      if ([(NSMutableSet *)self->_unavailableComplicationsNames count] == 1)
      {
        uint64_t v6 = @"GREENFIELD_COMPLICATION_NOT_AVAILABLE_TITLE";
        int v7 = @"Complication Not Available";
      }
      else
      {
        uint64_t v6 = @"GREENFIELD_COMPLICATIONS_NOT_AVAILABLE_TITLE";
        int v7 = @"Complications Not Available";
      }
      NTKClockFaceLocalizedString(v6, v7);
      id WeakRetained = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [(NSMutableSet *)self->_unavailableComplicationsNames allObjects];
      id v8 = [v17 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

      if ([v8 count] == 1)
      {
        uint64_t v18 = NTKClockFaceLocalizedString(@"GREENFIELD_COMPLICATIONS_NOT_AVAILABLE_DESCRIPTION_ONE", 0);
        uint64_t v19 = NSString;
        id v20 = [v8 objectAtIndexedSubscript:0];
        id v21 = objc_msgSend(v19, "stringWithFormat:", v18, v20);
      }
      else
      {
        uint64_t v18 = NTKClockFaceLocalizedString(@"GREENFIELD_COMPLICATIONS_NOT_AVAILABLE_DESCRIPTION_OTHER", 0);
        id v20 = (void *)[v8 mutableCopy];
        [v20 removeLastObject];
        uint64_t v22 = [v20 componentsJoinedByString:@", "];
        id v23 = [v8 lastObject];
        id v21 = objc_msgSend(NSString, "stringWithFormat:", v18, v22, v23);
      }
      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      [v24 addWatchFaceManager:self updateStateToComplicationsNotAvailableWithSlots:self->_unavailableComplicationsSlots unavailableTitle:WeakRetained unavailableDescription:v21];

      goto LABEL_22;
    case 3uLL:
      id WeakRetained = [(NTKGreenfieldAddWatchFaceManager *)self _curPendingComplicationItemId];
      id v8 = [(NTKGreenfieldAddWatchFaceManager *)self skippedComplicationsSlots];
      BOOL v9 = [(NSSet *)self->_locallyAvailableItemIds containsObject:WeakRetained];
      BOOL v10 = [(NSSet *)self->_appsThatRequireUpdatesItemIds containsObject:WeakRetained];
      uint64_t v11 = 2;
      if (!v10 || !v9) {
        uint64_t v11 = 3;
      }
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9;
      }
      long long v13 = [(NTKGreenfieldAddWatchFaceManager *)self delegate];
      uint64_t v14 = v13;
      if (uiState == 4) {
        [v13 addWatchFaceManager:self updateStateToRevisitComplicationWithItemId:WeakRetained installMode:v12 skippedComplicationSlots:v8];
      }
      else {
        [v13 addWatchFaceManager:self updateStateToAddComplicationWithItemId:WeakRetained installMode:v12 skippedComplicationSlots:v8];
      }

LABEL_22:
      goto LABEL_25;
    case 4uLL:
      id WeakRetained = [(NTKGreenfieldAddWatchFaceManager *)self skippedComplicationsSlots];
      BOOL v15 = [(NSMutableSet *)self->_skippedPendingComplicationsItemIds count] != 0;
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 addWatchFaceManager:self updateStateToCompletedWithSkippedComplicationSlots:WeakRetained canRevisit:v15];

LABEL_25:

      break;
    default:
      return;
  }
}

- (id)_addToLibraryOrUpdateFaceInLibrary
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!self->_addedFaceID)
  {
    uint64_t v22 = [(NTKGreenfieldAddWatchFaceManager *)self canAddWatchFaceFromDecodedRecipe:self->_decodedRecipe toLibrary:self->_library];
    if (v22) {
      goto LABEL_30;
    }
    if (!self->_addedFaceID)
    {
      id v24 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
      uint64_t v25 = [v24 deepCopy];

      if (![v25 origin]) {
        [v25 setOrigin:12];
      }
      [(NTKFaceCollection *)self->_library appendFace:v25 suppressingCallbackToObserver:0];
      [(NTKFaceCollection *)self->_library setSelectedFace:v25 suppressingCallbackToObserver:0];
      uint64_t v26 = [(NTKFaceCollection *)self->_library selectedUUID];
      addedFaceID = self->_addedFaceID;
      self->_addedFaceID = v26;
    }
  }
  id v28 = [(NTKFaceCollection *)self->_library facesByUUID];
  id v32 = [v28 objectForKey:self->_addedFaceID];
  uint64_t v3 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v41 = v32;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "_addFace: face in the decoded recipe: %@", buf, 0xCu);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
  BOOL v5 = [v4 orderedComplicationSlots];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    v31 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if ([(NSMutableSet *)self->_unavailableComplicationsSlots containsObject:v10])
        {
          uint64_t v11 = +[NTKComplication nullComplication];
          [v32 setComplication:v11 forSlot:v10];
          goto LABEL_21;
        }
        uint64_t v12 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
        uint64_t v11 = [v12 complicationForSlot:v10];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe complicationSlotToItemIdMapping];
          uint64_t v14 = [v13 objectForKeyedSubscript:v10];

          if ([(NSMutableSet *)self->_skippedPendingComplicationsItemIds containsObject:v14])
          {
            id v15 = +[NTKComplication nullComplication];
            [v32 setComplication:v15 forSlot:v10];
            goto LABEL_19;
          }
          if ([(NSMutableSet *)self->_installedComplicationIds containsObject:v14])
          {
            id v15 = v11;
            uint64_t v30 = [(NTKGreenfieldAddWatchFaceManager *)self _appNameFromItemId:v14];
            if (v30)
            {
              uint64_t v29 = [v15 complication];
              id v16 = +[NTKGreenfieldPlaceholderComplication placeholderWithComplication:v29 appStoreItemId:v14 appName:v30];
            }
            else
            {
              id v16 = +[NTKComplication nullComplication];
            }
            [v32 setComplication:v16 forSlot:v10];

LABEL_19:
            BOOL v5 = v31;
          }
        }
LABEL_21:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v7);
  }

  id v17 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v41 = v32;
    _os_log_impl(&dword_1BC5A9000, v17, OS_LOG_TYPE_DEFAULT, "_addFace: face we are going to add: %@", buf, 0xCu);
  }

  if ([v32 editedState] == 2)
  {
    uint64_t v18 = [v32 lastEditedDate];
    [v32 setCreationDate:v18];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
    [v32 setCreationDate:v19];

    [v32 setEditedState:1];
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __70__NTKGreenfieldAddWatchFaceManager__addToLibraryOrUpdateFaceInLibrary__block_invoke;
  v33[3] = &unk_1E62C3800;
  id v34 = v32;
  id v20 = v32;
  [v20 enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:v33];
  id v21 = +[NTKGreenfieldCompanionAppInstallationMonitor sharedMonitor];
  [v21 handleAddFaceManagerDidUpdateFaceLibrary];

  uint64_t v22 = 0;
LABEL_30:
  return v22;
}

void __70__NTKGreenfieldAddWatchFaceManager__addToLibraryOrUpdateFaceInLibrary__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) complicationForSlot:a2];
  [v2 handleAddedFromFaceSharing];
}

- (id)canAddWatchFaceFromDecodedRecipe:(id)a3 toLibrary:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 watchFace];
  id v30 = 0;
  char v8 = NTKCanAddWatchFace(v7, v6, &v30);
  id v9 = v30;

  if ((v8 & 1) == 0)
  {
    if (v9) {
      uint64_t v15 = [v9 code];
    }
    else {
      uint64_t v15 = 0;
    }
    id v14 = v9;
    goto LABEL_9;
  }
  uint64_t v10 = [v5 watchFace];
  int v11 = [v10 shouldSanitizeFaceConfigurationWhenAddingSharedFace];

  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v12 = [v5 watchFace];
  id v29 = v9;
  char v13 = [v12 sanitizeFaceConfiguration:&v29];
  id v14 = v29;

  if (v13)
  {
    id v9 = v14;
    goto LABEL_10;
  }
  uint64_t v18 = [v14 domain];
  uint64_t v19 = v18;
  if (v18 == @"com.apple.nanotimekit.photos")
  {
    uint64_t v20 = [v14 code];

    if (v20 == 1006)
    {
      uint64_t v15 = 7;
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v21 = [v14 domain];
  uint64_t v22 = v21;
  if (v21 != @"com.apple.nanotimekit.resourceDirectory")
  {

LABEL_25:
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  uint64_t v23 = [v14 code];

  if (v23 != 2004) {
    goto LABEL_25;
  }
  uint64_t v15 = 12;
LABEL_9:
  objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", v15);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (v9)
  {
    id v16 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v24 = [v5 watchFace];
      uint64_t v25 = [v9 localizedDescription];
      uint64_t v26 = [v9 code];
      uint64_t v27 = [v5 watchFace];
      id v28 = [v27 device];
      *(_DWORD *)buf = 138413570;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = v25;
      __int16 v35 = 2048;
      uint64_t v36 = v26;
      __int16 v37 = 2112;
      id v38 = v6;
      __int16 v39 = 2112;
      id v40 = v5;
      __int16 v41 = 2112;
      uint64_t v42 = v28;
      _os_log_error_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_ERROR, "Failed to add watch face %@, errorMessage %@, errorCode %ld, library %@, decodedRecipe %@, device %@", buf, 0x3Eu);
    }
  }

  return v9;
}

- (id)_appNameFromItemId:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v25 = 0;
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F223C8]), "initWithStoreItemIdentifier:error:", objc_msgSend(v3, "longLongValue"), &v25);
    id v5 = v25;
    if (!v4)
    {
      id v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[NTKGreenfieldAddWatchFaceManager _appNameFromItemId:]((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    uint64_t v13 = [v4 localizedName];
    id v14 = (void *)v13;
    uint64_t v15 = &stru_1F1635E90;
    if (v13) {
      uint64_t v15 = (__CFString *)v13;
    }
    id v16 = v15;
  }
  else
  {
    id v5 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NTKGreenfieldAddWatchFaceManager _appNameFromItemId:](v5, v17, v18, v19, v20, v21, v22, v23);
    }
    id v16 = 0;
  }

  return v16;
}

- (void)_queue_fetchInstalledAppsOnWatchWithithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__29;
  id v29 = __Block_byref_object_dispose__29;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__29;
  uint64_t v23 = __Block_byref_object_dispose__29;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__29;
  uint64_t v17 = __Block_byref_object_dispose__29;
  id v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = +[NTKGreenfieldCompanionAppInstallationMonitor sharedMonitor];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__NTKGreenfieldAddWatchFaceManager__queue_fetchInstalledAppsOnWatchWithithCompletionBlock___block_invoke;
  v8[3] = &unk_1E62C5678;
  uint64_t v10 = &v25;
  uint64_t v11 = &v19;
  uint64_t v12 = &v13;
  uint64_t v7 = v5;
  uint64_t v9 = v7;
  [v6 fetchInstalledAppsOnWatchWithCompletionBlock:v8];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v4[2](v4, v26[5], v20[5], v14[5]);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
}

void __91__NTKGreenfieldAddWatchFaceManager__queue_fetchInstalledAppsOnWatchWithithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v18 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v9;
  id v17 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_queue_fetchLocallyAvailableAppsWithError:(id *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__29;
  uint64_t v25 = __Block_byref_object_dispose__29;
  id v26 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__29;
  uint64_t v19 = __Block_byref_object_dispose__29;
  id v20 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v5 = [MEMORY[0x1E4F4AC68] sharedDeviceConnection];
  id v6 = [MEMORY[0x1E4F19A30] currentDevice];
  id v7 = [v6 nrDevice];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__NTKGreenfieldAddWatchFaceManager__queue_fetchLocallyAvailableAppsWithError___block_invoke;
  v11[3] = &unk_1E62C56F0;
  id v8 = v4;
  uint64_t v12 = v8;
  uint64_t v13 = &v15;
  id v14 = &v21;
  [v5 enumerateLocallyAvailableApplicationsForPairedDevice:v7 options:3 withBlock:v11];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v16[5];
  }
  id v9 = (void *)[(id)v22[5] copy];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

uint64_t __78__NTKGreenfieldAddWatchFaceManager__queue_fetchLocallyAvailableAppsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  unint64_t v6 = a3;
  id v7 = (void *)v6;
  if (!(v5 | v6))
  {
LABEL_6:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    uint64_t v9 = 0;
    goto LABEL_7;
  }
  if (v6)
  {
    id v8 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __78__NTKGreenfieldAddWatchFaceManager__queue_fetchLocallyAvailableAppsWithError___block_invoke_cold_1((uint64_t)v7, v5, v8);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    goto LABEL_6;
  }
  uint64_t v11 = [(id)v5 storeMetadata];
  uint64_t v12 = [v11 itemID];

  if (v12) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v12];
  }

  uint64_t v9 = 1;
LABEL_7:

  return v9;
}

- (void)_handleAddWatchFaceManagerDidFinishWithError:(id)a3
{
  objc_storeStrong((id *)&self->_failedError, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained addWatchFaceManager:self didFinishAddingFaceWithError:v5];
}

- (id)_analyticsExitScreenNameForCurrentState
{
  unint64_t v2 = self->_uiState - 1;
  if (v2 > 3) {
    return @"Loading";
  }
  else {
    return off_1E62C5710[v2];
  }
}

- (void)handleDidExitAddWatchFaceFlow
{
  failedError = self->_failedError;
  dispatch_semaphore_t v4 = [(NTKGreenfieldAddWatchFaceManager *)self _analyticsModelForAddFaceEvents];
  id v6 = v4;
  if (failedError)
  {
    [v4 setError:self->_failedError];
    NTKSubmitAnalyticsForErrorAddFaceFlow(v6);
  }
  else if (self->_addedFaceID)
  {
    NTKSubmitAnalyticsForAddSharedFace(v4);
  }
  else
  {
    id v5 = [(NTKGreenfieldAddWatchFaceManager *)self _analyticsExitScreenNameForCurrentState];
    [v6 setAddFaceFlowExitScreenName:v5];

    NTKSubmitAnalyticsForExitAddSharedFaceFlow(v6);
  }
}

- (id)_analyticsModelForAddFaceEvents
{
  id v3 = objc_alloc_init(NTKGreenfieldAnalyticsModel);
  dispatch_semaphore_t v4 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe watchFace];
  [(NTKGreenfieldAnalyticsModel *)v3 setWatchFace:v4];

  [(NTKGreenfieldAnalyticsModel *)v3 setPurchasedComplicationsItemIds:self->_installedComplicationIds];
  [(NTKGreenfieldAnalyticsModel *)v3 setSkippedComplicationsItemIds:self->_skippedPendingComplicationsItemIds];
  id v5 = [(NTKGreenfieldDecodedRecipe *)self->_decodedRecipe complicationSlotToItemIdMapping];
  [(NTKGreenfieldAnalyticsModel *)v3 setComplicationSlotToIdMapping:v5];

  [(NTKGreenfieldAnalyticsModel *)v3 setDistributionMechanism:self->_sourceApplicationBundleIdentifier];
  return v3;
}

- (NTKGreenfieldDecodedRecipe)decodedRecipe
{
  return self->_decodedRecipe;
}

- (NTKGreenfieldAddWatchFaceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKGreenfieldAddWatchFaceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)remainingAppsToInstallCount
{
  return self->_remainingAppsToInstallCount;
}

- (int64_t)viewedNonInstalledAppCount
{
  return self->_viewedNonInstalledAppCount;
}

- (int64_t)totalNonInstalledAppCount
{
  return self->_totalNonInstalledAppCount;
}

- (NSUUID)addedFaceID
{
  return self->_addedFaceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedFaceID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unavailableComplicationsNames, 0);
  objc_storeStrong((id *)&self->_unavailableComplicationsSlots, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_appsThatRequireUpdatesItemIds, 0);
  objc_storeStrong((id *)&self->_locallyAvailableItemIds, 0);
  objc_storeStrong((id *)&self->_installedComplicationIds, 0);
  objc_storeStrong((id *)&self->_skippedPendingComplicationsItemIds, 0);
  objc_storeStrong((id *)&self->_orderedPendingComplicationsItemIds, 0);
  objc_storeStrong((id *)&self->_failedError, 0);
  objc_storeStrong((id *)&self->_libraryTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_decodedRecipe, 0);
}

- (void)decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:.cold.1()
{
  __assert_rtn("-[NTKGreenfieldAddWatchFaceManager decodeWatchFaceWithURL:sourceApplicationBundleIdentifier:]", "NTKGreenfieldAddWatchFaceManager.m", 188, "_decodingState == NTKGreenfieldAddWatchFaceDecodingStateIdle || _decodingState == NTKGreenfieldAddWatchFaceDecodingStateCompleted");
}

void __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__NTKGreenfieldAddWatchFaceManager__decodeUrl___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__NTKGreenfieldAddWatchFaceManager__refreshInstalledComplicationsWithContinueBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_appNameFromItemId:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_appNameFromItemId:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__NTKGreenfieldAddWatchFaceManager__queue_fetchLocallyAvailableAppsWithError___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "_queue_fetchLocallyAvailableAppsWithError: error: %@, app: %@", (uint8_t *)&v3, 0x16u);
}

@end