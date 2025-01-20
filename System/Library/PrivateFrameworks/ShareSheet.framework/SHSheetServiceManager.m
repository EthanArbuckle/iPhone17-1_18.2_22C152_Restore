@interface SHSheetServiceManager
- (BOOL)updateAfterConnection;
- (SFShareSheetSlotManager)slotManager;
- (SHSheetServiceManager)init;
- (SHSheetServiceManagerDelegate)delegate;
- (SHSheetSession)session;
- (UISUIActivityViewControllerConfiguration)hostConfiguration;
- (int64_t)connectionState;
- (void)_handleConnectionCompletion;
- (void)_invalidateSlotManagerIfNeeded;
- (void)_sendConfiguration:(id)a3;
- (void)activityViewControllerDidAppear;
- (void)activityViewControllerDidDisappear;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)connectWithSession:(id)a3;
- (void)connectionInterrupted;
- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4;
- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3;
- (void)dealloc;
- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5;
- (void)didPerformInServiceActivityWithIdentifier:(id)a3 completed:(BOOL)a4 items:(id)a5 error:(id)a6;
- (void)didUpdateAirDropTransferWithChange:(id)a3;
- (void)favoriteUserDefaultsActivity:(BOOL)a3 withIdentifier:(id)a4 activityCategory:(int64_t)a5;
- (void)findSupportedActivitiesWithCompletionHandler:(id)a3;
- (void)isShareOwnerForFileURL:(id)a3 share:(id)a4 completionHandler:(id)a5;
- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4;
- (void)longPressShareActivityWithIdentifier:(id)a3;
- (void)performActionActivityWithIdentifier:(id)a3;
- (void)performActivityInHostWithUUID:(id)a3;
- (void)performActivityWithType:(id)a3 completionHandler:(id)a4;
- (void)performAirDropActivityInHostWithNoContentView:(BOOL)a3;
- (void)performEditAction;
- (void)performExtensionActivityInHostWithBundleID:(id)a3 request:(id)a4;
- (void)performPersonSuggestionWithIdentifier:(id)a3;
- (void)performShareActivityWithIdentifier:(id)a3;
- (void)performShortcutActivityInHostWithBundleID:(id)a3 singleUseToken:(id)a4;
- (void)performUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4;
- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6;
- (void)provideFeedbackForPeopleSugestionIdentifier:(id)a3;
- (void)removePersonSuggestionWithIdentifier:(id)a3;
- (void)reportActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7;
- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5;
- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4;
- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4;
- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4;
- (void)setConnectionState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHostConfiguration:(id)a3;
- (void)setUpdateAfterConnection:(BOOL)a3;
- (void)shareStatusForURL:(id)a3 completionHandler:(id)a4;
- (void)toggleUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4;
- (void)update;
- (void)updateUserDefaultsFavorites:(id)a3 activityCategory:(int64_t)a4;
- (void)willPerformInServiceActivityWithRequest:(id)a3 completion:(id)a4;
@end

@implementation SHSheetServiceManager

- (SHSheetServiceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SHSheetServiceManager;
  v2 = [(SHSheetServiceManager *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SFShareSheetSlotManager);
    slotManager = v2->_slotManager;
    v2->_slotManager = v3;

    [(SFShareSheetSlotManager *)v2->_slotManager setDelegate:v2];
    [(SFShareSheetSlotManager *)v2->_slotManager activate];
  }
  return v2;
}

- (void)dealloc
{
  [(SHSheetServiceManager *)self _invalidateSlotManagerIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)SHSheetServiceManager;
  [(SHSheetServiceManager *)&v3 dealloc];
}

- (void)connectWithSession:(id)a3
{
  id v5 = a3;
  if ([(SHSheetServiceManager *)self connectionState])
  {
    objc_super v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Connection to sharingd already happened.", buf, 2u);
    }
  }
  else
  {
    [(SHSheetServiceManager *)self setConnectionState:1];
    v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to sharingd", buf, 2u);
    }

    objc_storeStrong((id *)&self->_session, a3);
    v8 = [(SHSheetServiceManager *)self session];
    objc_super v6 = [v8 identifier];

    v9 = [(SHSheetServiceManager *)self session];
    uint64_t v10 = [v9 createDiscoveryContext];

    v11 = [(SHSheetServiceManager *)self session];
    v12 = [v11 selectedAssetIdentifiers];

    v13 = [(SHSheetServiceManager *)self session];
    v14 = [v13 activityItemsManager];
    v15 = [v14 suggestionAssetIdentifiers];

    if ([v15 count])
    {
      v16 = [MEMORY[0x1E4F1CA80] setWithArray:v15];
      [v16 addObjectsFromArray:v12];
      uint64_t v17 = [v16 allObjects];

      v12 = (void *)v17;
    }
    v18 = [(SHSheetServiceManager *)self session];
    v19 = [v18 excludedActivityTypes];
    if ([v19 containsObject:@"com.apple.UIKit.activity.SharePlay"])
    {
      uint64_t v20 = 0;
    }
    else
    {
      v21 = [(SHSheetServiceManager *)self session];
      uint64_t v20 = [v21 canPerformSharePlay];
    }
    v22 = [(SHSheetServiceManager *)self session];
    v23 = [v22 activityItemsManager];
    uint64_t v24 = [v23 suggestedImageDataFromActivityItem:0];

    id v54 = v5;
    v55 = (void *)v24;
    v52 = v15;
    if (v24)
    {
      v25 = [(SHSheetServiceManager *)self delegate];
      uint64_t v26 = [v25 serviceManager:self identificationResultsFromSuggestedImageData:v24];
    }
    else
    {
      uint64_t v26 = 0;
    }
    v27 = [(SHSheetServiceManager *)self session];
    v28 = [v27 activityItemsManager];
    v29 = [v28 activityItemURLValuesForActivity:0];

    uint64_t v30 = SFSandboxExtensionDataByFileURLPathForURLs();
    v31 = [[SHSheetRemoteConnectionContext alloc] initWithSessionIdentifier:v6];
    v53 = (void *)v10;
    [(SHSheetRemoteConnectionContext *)v31 setDiscoveryContext:v10];
    v56 = v12;
    [(SHSheetRemoteConnectionContext *)v31 setAssetIdentifiers:v12];
    [(SHSheetRemoteConnectionContext *)v31 setUrlsBeingShared:v29];
    v50 = (void *)v30;
    [(SHSheetRemoteConnectionContext *)v31 setSandboxExtensionsByfileURLPath:v30];
    v32 = [(SHSheetServiceManager *)self session];
    -[SHSheetRemoteConnectionContext setShouldSuggestFamilyMembers:](v31, "setShouldSuggestFamilyMembers:", [v32 shouldSuggestFamilyMembers]);

    v33 = [(SHSheetServiceManager *)self session];
    -[SHSheetRemoteConnectionContext setInstantShareSheet:](v31, "setInstantShareSheet:", [v33 instantShareSheet]);

    v34 = [(SHSheetServiceManager *)self session];
    -[SHSheetRemoteConnectionContext setRemoteShareSheet:](v31, "setRemoteShareSheet:", [v34 useRemoteUIService]);

    [(SHSheetRemoteConnectionContext *)v31 setIsSharePlayAvailable:v20];
    v35 = [(SHSheetServiceManager *)self session];
    -[SHSheetRemoteConnectionContext setSupportsCollaboration:](v31, "setSupportsCollaboration:", [v35 supportsCollaboration]);

    v36 = [(SHSheetServiceManager *)self session];
    -[SHSheetRemoteConnectionContext setHideSuggestions:](v31, "setHideSuggestions:", [v36 hideSuggestions]);

    v37 = [(SHSheetServiceManager *)self session];
    v38 = [v37 peopleSuggestionBundleIds];
    [(SHSheetRemoteConnectionContext *)v31 setPeopleSuggestionBundleIds:v38];

    v51 = (void *)v26;
    [(SHSheetRemoteConnectionContext *)v31 setProcessedImageResultsData:v26];
    [MEMORY[0x1E4FB1E80] defaultDurationForTransition:8];
    [(SHSheetRemoteConnectionContext *)v31 setPeopleSuggestionsTimeout:"setPeopleSuggestionsTimeout:"];
    v39 = [(SHSheetServiceManager *)self session];
    -[SHSheetRemoteConnectionContext setXrRenderingMode:](v31, "setXrRenderingMode:", [v39 xrRenderingMode]);

    v40 = [(SHSheetRemoteConnectionContext *)v31 createContextDictionary];
    v41 = share_sheet_log();
    v42 = share_sheet_log();
    v43 = [(SHSheetServiceManager *)self session];
    v44 = [v43 activityViewController];
    os_signpost_id_t v45 = os_signpost_id_make_with_pointer(v42, v44);

    if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v41, OS_SIGNPOST_INTERVAL_END, v45, "InitializeUIAVC", " enableTelemetry=YES ", buf, 2u);
    }

    v46 = share_sheet_log();
    v47 = share_sheet_log();
    os_signpost_id_t v48 = os_signpost_id_make_with_pointer(v47, self);

    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v46, OS_SIGNPOST_INTERVAL_BEGIN, v48, "ConnectToDaemon", " enableTelemetry=YES ", buf, 2u);
    }

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    slotManager = self->_slotManager;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __44__SHSheetServiceManager_connectWithSession___block_invoke;
    v57[3] = &unk_1E5A21998;
    objc_copyWeak(&v58, (id *)buf);
    [(SFShareSheetSlotManager *)slotManager connectToDaemonWithContext:v40 completionHandler:v57];
    objc_destroyWeak(&v58);
    objc_destroyWeak((id *)buf);

    id v5 = v54;
  }
}

void __44__SHSheetServiceManager_connectWithSession___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionCompletion];
}

- (void)update
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_DEBUG, "Update failure: Connection to sharingd is not established", v1, 2u);
}

uint64_t __31__SHSheetServiceManager_update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendConfiguration:*(void *)(a1 + 40)];
}

- (void)reportActivityWithSessionID:(id)a3 presentationMs:(unint64_t)a4 totalShareTimeMs:(unint64_t)a5 activityType:(id)a6 success:(BOOL)a7
{
}

- (void)performShareActivityWithIdentifier:(id)a3
{
  slotManager = self->_slotManager;
  id v5 = a3;
  id v7 = [(SHSheetServiceManager *)self session];
  objc_super v6 = [v7 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v6 selectedActivityWithIdentifier:v5];
}

- (void)performActionActivityWithIdentifier:(id)a3
{
  slotManager = self->_slotManager;
  id v5 = a3;
  id v7 = [(SHSheetServiceManager *)self session];
  objc_super v6 = [v7 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v6 selectedActionWithIdentifier:v5];
}

- (void)performEditAction
{
  slotManager = self->_slotManager;
  id v4 = [(SHSheetServiceManager *)self session];
  objc_super v3 = [v4 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerPerformEditActionsWithSessionID:v3];
}

- (void)performPersonSuggestionWithIdentifier:(id)a3
{
  slotManager = self->_slotManager;
  id v5 = a3;
  id v7 = [(SHSheetServiceManager *)self session];
  objc_super v6 = [v7 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v6 selectedPersonWithIdentifier:v5];
}

- (void)removePersonSuggestionWithIdentifier:(id)a3
{
  slotManager = self->_slotManager;
  id v5 = a3;
  id v7 = [(SHSheetServiceManager *)self session];
  objc_super v6 = [v7 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v6 removedPersonWithIdentifier:v5];
}

- (void)longPressShareActivityWithIdentifier:(id)a3
{
  slotManager = self->_slotManager;
  id v5 = a3;
  id v7 = [(SHSheetServiceManager *)self session];
  objc_super v6 = [v7 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v6 didLongPressShareActivityWithIdentifier:v5];
}

- (void)toggleUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4
{
  slotManager = self->_slotManager;
  id v7 = a3;
  id v9 = [(SHSheetServiceManager *)self session];
  v8 = [v9 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v8 toggledActivityWithIdentifier:v7 activityCategory:a4];
}

- (void)favoriteUserDefaultsActivity:(BOOL)a3 withIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  BOOL v6 = a3;
  slotManager = self->_slotManager;
  id v9 = a4;
  id v11 = [(SHSheetServiceManager *)self session];
  uint64_t v10 = [v11 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v10 favoritedActivity:v6 withIdentifier:v9 activityCategory:a5];
}

- (void)updateUserDefaultsFavorites:(id)a3 activityCategory:(int64_t)a4
{
  slotManager = self->_slotManager;
  id v7 = a3;
  id v9 = [(SHSheetServiceManager *)self session];
  v8 = [v9 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v8 updatedFavoritesProxies:v7 activityCategory:a4];
}

- (void)performUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4
{
  slotManager = self->_slotManager;
  id v7 = a3;
  id v9 = [(SHSheetServiceManager *)self session];
  v8 = [v9 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v8 selectedDefaultActivityWithIdentifier:v7 activityCategory:a4];
}

- (void)provideFeedbackForPeopleSugestionIdentifier:(id)a3
{
  slotManager = self->_slotManager;
  id v5 = a3;
  id v7 = [(SHSheetServiceManager *)self session];
  BOOL v6 = [v7 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v6 provideFeedbackForPeopleSuggestionWithIdentifier:v5];
}

- (void)performActivityWithType:(id)a3 completionHandler:(id)a4
{
  slotManager = self->_slotManager;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(SHSheetServiceManager *)self session];
  id v9 = [v10 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v9 performActivityWithType:v8 completionHandler:v7];
}

- (void)findSupportedActivitiesWithCompletionHandler:(id)a3
{
  slotManager = self->_slotManager;
  id v5 = a3;
  id v7 = [(SHSheetServiceManager *)self session];
  BOOL v6 = [v7 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWithSessionID:v6 findSupportedActivitiesWithCompletionHandler:v5];
}

- (void)setConnectionState:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_connectionState != a3)
  {
    self->_unint64_t connectionState = a3;
    id v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t connectionState = self->_connectionState;
      if (connectionState > 2) {
        BOOL v6 = 0;
      }
      else {
        BOOL v6 = off_1E5A22F38[connectionState];
      }
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Connection state changed:%@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(SHSheetServiceManager *)self delegate];
    [v7 serviceManagerDidChangeConnectionState:self];
  }
}

- (void)_handleConnectionCompletion
{
  objc_super v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Connection to sharingd established", buf, 2u);
  }

  [(SHSheetServiceManager *)self setConnectionState:2];
  id v4 = share_sheet_log();
  id v5 = share_sheet_log();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v4, OS_SIGNPOST_INTERVAL_END, v6, "ConnectToDaemon", " enableTelemetry=YES ", v7, 2u);
  }

  if ([(SHSheetServiceManager *)self updateAfterConnection])
  {
    [(SHSheetServiceManager *)self setUpdateAfterConnection:0];
    [(SHSheetServiceManager *)self update];
  }
}

- (void)_sendConfiguration:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Sending configuration %@", buf, 0xCu);
  }

  slotManager = self->_slotManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SHSheetServiceManager__sendConfiguration___block_invoke;
  v7[3] = &unk_1E5A22EA0;
  v7[4] = self;
  [(SFShareSheetSlotManager *)slotManager sendConfiguration:v4 completion:v7];
}

uint64_t __44__SHSheetServiceManager__sendConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dataSourceUpdatedWithSessionConfiguration:a2];
}

- (void)_invalidateSlotManagerIfNeeded
{
  objc_super v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating slot manager", v5, 2u);
  }

  [(SFShareSheetSlotManager *)self->_slotManager setDelegate:0];
  [(SFShareSheetSlotManager *)self->_slotManager invalidate];
  slotManager = self->_slotManager;
  self->_slotManager = 0;
}

- (void)connectionInterrupted
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SHSheetServiceManager_connectionInterrupted__block_invoke;
  block[3] = &unk_1E5A21900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__SHSheetServiceManager_connectionInterrupted__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setConnectionState:0];
  [*(id *)(a1 + 32) _invalidateSlotManagerIfNeeded];
  v2 = *(void **)(a1 + 32);
  objc_super v3 = [v2 session];
  [v2 connectWithSession:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 update];
}

- (void)dataSourceUpdatedWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SHSheetServiceManager_dataSourceUpdatedWithSessionConfiguration___block_invoke;
  v6[3] = &unk_1E5A215A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  sh_dispatch_on_main_queue(v6);
}

void __67__SHSheetServiceManager_dataSourceUpdatedWithSessionConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) session];
  [v2 setConfiguration:v1];
}

- (void)performActivityInHostWithUUID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SHSheetServiceManager_performActivityInHostWithUUID___block_invoke;
  v6[3] = &unk_1E5A215A0;
  id v7 = v4;
  int v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __55__SHSheetServiceManager_performActivityInHostWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "Performing in host %@", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) session];
  id v5 = [v4 activitiesManager];
  os_signpost_id_t v6 = [v5 activityForIdentifier:*(void *)(a1 + 32)];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) delegate];
    [v7 serviceManager:*(void *)(a1 + 40) performActivity:v6];
  }
}

- (void)performExtensionActivityInHostWithBundleID:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SHSheetServiceManager_performExtensionActivityInHostWithBundleID_request___block_invoke;
  block[3] = &unk_1E5A21A28;
  id v11 = v6;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__SHSheetServiceManager_performExtensionActivityInHostWithBundleID_request___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "Performing in host %@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:*(void *)(a1 + 32) error:0];
  if (v4)
  {
    id v5 = +[_UIActivityApplicationExtensionDiscovery extensionBasedActivityForExtension:v4];
    [v5 setExtensionItemDataRequest:*(void *)(a1 + 40)];
    id v6 = [*(id *)(a1 + 48) delegate];
    [v6 serviceManager:*(void *)(a1 + 48) performActivity:v5];
  }
}

- (void)performAirDropActivityInHostWithNoContentView:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__SHSheetServiceManager_performAirDropActivityInHostWithNoContentView___block_invoke;
  v3[3] = &unk_1E5A21CD0;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __71__SHSheetServiceManager_performAirDropActivityInHostWithNoContentView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceManager:*(void *)(a1 + 32) performAirdropViewActivityWithNoContentView:*(unsigned __int8 *)(a1 + 40)];
}

- (void)performShortcutActivityInHostWithBundleID:(id)a3 singleUseToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SHSheetServiceManager_performShortcutActivityInHostWithBundleID_singleUseToken___block_invoke;
  block[3] = &unk_1E5A21A28;
  id v11 = v6;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__SHSheetServiceManager_performShortcutActivityInHostWithBundleID_singleUseToken___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:*(void *)(a1 + 32) error:0];
  if (v8)
  {
    id v2 = [UIShortcutActivity alloc];
    uint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = [*(id *)(a1 + 48) session];
    id v5 = [v4 selectedAssetIdentifiers];
    id v6 = [(UIShortcutActivity *)v2 initWithApplicationExtension:v8 singleUseToken:v3 photosAssetIdentifiers:v5];

    id v7 = [*(id *)(a1 + 48) delegate];
    [v7 serviceManager:*(void *)(a1 + 48) performActivity:v6];
  }
}

- (void)willPerformInServiceActivityWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__SHSheetServiceManager_willPerformInServiceActivityWithRequest_completion___block_invoke;
  block[3] = &unk_1E5A21D20;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__SHSheetServiceManager_willPerformInServiceActivityWithRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceManager:*(void *)(a1 + 32) willPerformActivityInServiceForRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)didPerformInServiceActivityWithIdentifier:(id)a3 completed:(BOOL)a4 items:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__SHSheetServiceManager_didPerformInServiceActivityWithIdentifier_completed_items_error___block_invoke;
  block[3] = &unk_1E5A22EC8;
  void block[4] = self;
  id v17 = v10;
  BOOL v20 = a4;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __89__SHSheetServiceManager_didPerformInServiceActivityWithIdentifier_completed_items_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceManager:*(void *)(a1 + 32) didPerformInServiceActivityWithIdentifier:*(void *)(a1 + 40) completed:*(unsigned __int8 *)(a1 + 64) items:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)performUserDefaultsWithFavoritesProxies:(id)a3 suggestionProxies:(id)a4 orderedUUIDs:(id)a5 activityCategory:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__SHSheetServiceManager_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory___block_invoke;
  block[3] = &unk_1E5A22EF0;
  void block[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  int64_t v20 = a6;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __113__SHSheetServiceManager_performUserDefaultsWithFavoritesProxies_suggestionProxies_orderedUUIDs_activityCategory___block_invoke(uint64_t a1)
{
  id v15 = [SHSheetUserDefaultsContext alloc];
  id v14 = [*(id *)(a1 + 32) session];
  id v13 = [v14 activitiesManager];
  id v2 = [v13 applicationActivityTypes];
  uint64_t v3 = [*(id *)(a1 + 32) session];
  BOOL v4 = [v3 activitiesManager];
  id v5 = [v4 activitiesByUUID];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [*(id *)(a1 + 32) session];
  id v10 = [v9 heroActionActivityTypes];
  LOBYTE(v12) = 1;
  v16 = [(SHSheetUserDefaultsContext *)v15 initWithApplicationActivityTypes:v2 activitiesByUUID:v5 favoritesProxies:v8 suggestionProxies:v6 orderedUUIDs:v7 excludedActivityTypes:v10 activityCategory:*(void *)(a1 + 64) isPresentedModally:v12];

  id v11 = [*(id *)(a1 + 32) delegate];
  [v11 serviceManager:*(void *)(a1 + 32) performUserDefaultsActivityWithContext:v16];
}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__SHSheetServiceManager_didUpdateAirDropTransferWithChange___block_invoke;
  v6[3] = &unk_1E5A215A0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __60__SHSheetServiceManager_didUpdateAirDropTransferWithChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 serviceManager:*(void *)(a1 + 32) didUpdateAirDropTransferWithChange:*(void *)(a1 + 40)];
}

- (void)activityViewControllerDidAppear
{
  slotManager = self->_slotManager;
  id v4 = [(SHSheetServiceManager *)self session];
  uint64_t v3 = [v4 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerDidAppearWithSessionID:v3];
}

- (void)activityViewControllerDidDisappear
{
  slotManager = self->_slotManager;
  id v4 = [(SHSheetServiceManager *)self session];
  uint64_t v3 = [v4 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerDidDisappearWithSessionID:v3];
}

- (void)applicationDidEnterBackground
{
  slotManager = self->_slotManager;
  id v4 = [(SHSheetServiceManager *)self session];
  uint64_t v3 = [v4 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerDidEnterBackgroundWithSessionID:v3];
}

- (void)applicationWillEnterForeground
{
  slotManager = self->_slotManager;
  id v4 = [(SHSheetServiceManager *)self session];
  uint64_t v3 = [v4 identifier];
  [(SFShareSheetSlotManager *)slotManager activityViewControllerWillEnterForegroundWithSessionID:v3];
}

- (void)requestDefaultShareModeCollaborationForURL:(id)a3 completionHandler:(id)a4
{
}

- (void)requestSharedURLForFileOrFolderURL:(id)a3 completionHandler:(id)a4
{
}

- (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
}

- (void)deleteSharingURL:(id)a3 containerSetupInfo:(id)a4 completionHandler:(id)a5
{
}

- (void)requestAddParticipantsAllowedForURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
}

- (void)isShareOwnerForFileURL:(id)a3 share:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void))v10;
  if (v9)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F9F6B8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__SHSheetServiceManager_isShareOwnerForFileURL_share_completionHandler___block_invoke;
    v17[3] = &unk_1E5A22F18;
    id v18 = v10;
    [v12 isShareOwnerOrAdminForShare:v9 completionHandler:v17];
    id v13 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v8)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__SHSheetServiceManager_isShareOwnerForFileURL_share_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5A22F18;
    id v16 = v10;
    [(SHSheetServiceManager *)self isShareOwnerOrAdminForFileURL:v8 completionHandler:v15];
    id v13 = v16;
    goto LABEL_5;
  }
  id v14 = share_sheet_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SHSheetServiceManager isShareOwnerForFileURL:share:completionHandler:](v14);
  }

  v11[2](v11, 0);
LABEL_6:
}

uint64_t __72__SHSheetServiceManager_isShareOwnerForFileURL_share_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__SHSheetServiceManager_isShareOwnerForFileURL_share_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isShareOwnerOrAdminForFileURL:(id)a3 completionHandler:(id)a4
{
}

- (void)shareStatusForURL:(id)a3 completionHandler:(id)a4
{
}

- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
}

- (SHSheetSession)session
{
  return self->_session;
}

- (SHSheetServiceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetServiceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (SFShareSheetSlotManager)slotManager
{
  return self->_slotManager;
}

- (UISUIActivityViewControllerConfiguration)hostConfiguration
{
  return self->_hostConfiguration;
}

- (void)setHostConfiguration:(id)a3
{
}

- (BOOL)updateAfterConnection
{
  return self->_updateAfterConnection;
}

- (void)setUpdateAfterConnection:(BOOL)a3
{
  self->_updateAfterConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostConfiguration, 0);
  objc_storeStrong((id *)&self->_slotManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)isShareOwnerForFileURL:(os_log_t)log share:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "no fileURL or share provided to figure out if it's the owner.", v1, 2u);
}

@end