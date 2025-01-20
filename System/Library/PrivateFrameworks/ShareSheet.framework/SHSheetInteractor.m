@interface SHSheetInteractor
- (BOOL)hasSessionStarted;
- (SFCollaborationPerformer)collaborationPerformer;
- (SHSheetActivityPerformer)activityPerformer;
- (SHSheetActivityPerformerPresentationInterface)activityPresentationController;
- (SHSheetInteractor)initWithContext:(id)a3;
- (SHSheetInteractorDelegate)delegate;
- (SHSheetServiceManager)serviceManager;
- (SHSheetSession)session;
- (id)_prepareActivityProxyForRequest:(id)a3;
- (id)collaborationSharingResultForActivity:(id)a3;
- (id)createActivityItemsConfiguration;
- (id)linkMetadataForActivityPerformer:(id)a3;
- (id)serviceManager:(id)a3 identificationResultsFromSuggestedImageData:(id)a4;
- (void)_deleteSharingURL:(id)a3;
- (void)_didPerformActivityWithResult:(id)a3;
- (void)_performActivity:(id)a3;
- (void)_recordActivityInteractionForResult:(id)a3;
- (void)_recordActivityViewControllerInteraction;
- (void)_runActivity:(id)a3;
- (void)_setupServiceManagerIfNeeded;
- (void)_startPerformingActivity:(id)a3 collaborationItem:(id)a4 skipCollaborationPerformer:(BOOL)a5;
- (void)_updateRemoteScene;
- (void)activityViewControllerDidAppear;
- (void)activityViewControllerDidDisappear;
- (void)addParticipantsAllowedForCollaborationItem:(id)a3 completionHandler:(id)a4;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)canManageShareForDocumentInSharedFolderWithCompletionHandler:(id)a3;
- (void)canShareFolderContainingExistingSharedItemsWithCompletionHandler:(id)a3;
- (void)clearActivityForResult:(id)a3;
- (void)collaborationFooterViewModelDidChangeForSession:(id)a3;
- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4;
- (void)createSharingURLWithParticipantsForCollaborationRequest:(id)a3 completionHandler:(id)a4;
- (void)didBeginCreationForCollaborationPerformer:(id)a3;
- (void)didCancelCreationForCollaborationPerformer:(id)a3;
- (void)didFailCreationForCollaborationPerformer:(id)a3 error:(id)a4;
- (void)didFinishCreationForCollaborationPerformer:(id)a3;
- (void)favoriteUserDefaultsActivity:(BOOL)a3 withIdentifier:(id)a4 activityCategory:(int64_t)a5;
- (void)findSupportedActivitiesWithCompletionHandler:(id)a3;
- (void)headerMetadataDidChangeForSession:(id)a3;
- (void)invalidateRemoteSession;
- (void)isCollaborativeDidChangeForSession:(id)a3;
- (void)longPressShareActivityWithIdentifier:(id)a3;
- (void)manageShareForDocumentInSharedFolder;
- (void)performActionActivityWithIdentifier:(id)a3;
- (void)performActivity:(id)a3;
- (void)performActivityWithRequest:(id)a3 forExtension:(id)a4 completion:(id)a5;
- (void)performActivityWithType:(id)a3 completionHandler:(id)a4;
- (void)performEditAction;
- (void)performPeopleSuggestion:(id)a3;
- (void)performPersonSuggestionWithIdentifier:(id)a3;
- (void)performShareActivityWithIdentifier:(id)a3;
- (void)performUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4;
- (void)preheatActivitiesIfNeeded;
- (void)provideFeedbackForPeopleSugestionIdentifier:(id)a3;
- (void)removePersonSuggestionWithIdentifier:(id)a3;
- (void)requestServiceUpdate;
- (void)serviceManager:(id)a3 didPerformInServiceActivityWithIdentifier:(id)a4 completed:(BOOL)a5 items:(id)a6 error:(id)a7;
- (void)serviceManager:(id)a3 didUpdateAirDropTransferWithChange:(id)a4;
- (void)serviceManager:(id)a3 performActivity:(id)a4;
- (void)serviceManager:(id)a3 performAirdropViewActivityWithNoContentView:(BOOL)a4;
- (void)serviceManager:(id)a3 performUserDefaultsActivityWithContext:(id)a4;
- (void)serviceManager:(id)a3 willPerformActivityInServiceForRequest:(id)a4 completion:(id)a5;
- (void)session:(id)a3 didChangeMetadata:(id)a4;
- (void)sessionConfigurationDidChangeForSession:(id)a3;
- (void)setActivityPerformer:(id)a3;
- (void)setActivityPresentationController:(id)a3;
- (void)setCollaborationPerformer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServiceManager:(id)a3;
- (void)setSession:(id)a3;
- (void)setWantsCollaborativeSession:(BOOL)a3;
- (void)shareStatusForURL:(id)a3 completionHandler:(id)a4;
- (void)showOptionsDidChangeForSession:(id)a3;
- (void)startSession;
- (void)stopSession;
- (void)toggleUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4;
- (void)updateSessionWithContext:(id)a3;
- (void)updateUserDefaultsFavorites:(id)a3 activityCategory:(int64_t)a4;
@end

@implementation SHSheetInteractor

- (SHSheetInteractor)initWithContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHSheetInteractor;
  v5 = [(SHSheetInteractor *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(SHSheetInteractor *)v5 _setupServiceManagerIfNeeded];
    v7 = [[SHSheetSession alloc] initWithContext:v4 delegate:v6];
    session = v6->_session;
    v6->_session = v7;
  }
  return v6;
}

- (void)setWantsCollaborativeSession:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v5 = [(SHSheetInteractor *)self session];
  int v6 = [v5 isCollaborative];

  if (v6 != v3)
  {
    v7 = [(SHSheetInteractor *)self session];
    v8 = [v7 collaborationModeRestriction];
    if ([v8 disabledMode] == 1 && v3)
    {
      int v9 = 1;
    }
    else
    {
      int v9 = !v3;
      objc_super v10 = [(SHSheetInteractor *)self session];
      v11 = [v10 collaborationModeRestriction];
      if ([v11 disabledMode]) {
        int v9 = 0;
      }
    }
    v12 = [(SHSheetInteractor *)self session];
    v13 = [v12 collaborationItem];

    if (v3 && (SHSheetIsCollaborationItemEligibleForActivity(v13, 0) & 1) == 0)
    {
      v25 = share_sheet_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1A0AD8000, v25, OS_LOG_TYPE_DEFAULT, "Collaboration not supported for URL", (uint8_t *)&v29, 2u);
      }

      v14 = [(SHSheetInteractor *)self delegate];
      [v14 interactorDidFailPerformActivityNotCollaborationEligible:self];
    }
    else
    {
      if (!v9) {
        goto LABEL_21;
      }
      v14 = [(SHSheetInteractor *)self session];
      v15 = [v14 collaborationModeRestriction];
      uint64_t v16 = [v15 alertTitle];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = [(SHSheetInteractor *)self session];
        v19 = [v18 collaborationModeRestriction];
        char v20 = [v19 allowContinueToMode];

        if ((v20 & 1) == 0)
        {
          v21 = [(SHSheetInteractor *)self delegate];
          v22 = [(SHSheetInteractor *)self session];
          v23 = [v22 collaborationModeRestriction];
          [v21 interactor:self showingModeRestriction:v23 continueHandler:0];

          v24 = share_sheet_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v29) = 0;
            _os_log_impl(&dword_1A0AD8000, v24, OS_LOG_TYPE_DEFAULT, "Not changing mode because desired mode is disabled", (uint8_t *)&v29, 2u);
          }

LABEL_26:
          return;
        }
LABEL_21:
        v26 = share_sheet_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = @"Send Copy";
          if (v3) {
            v27 = @"Collaborative";
          }
          int v29 = 138412290;
          v30 = v27;
          _os_log_impl(&dword_1A0AD8000, v26, OS_LOG_TYPE_DEFAULT, "Changing mode to %@", (uint8_t *)&v29, 0xCu);
        }

        v28 = [(SHSheetInteractor *)self session];
        [v28 setIsCollaborative:v3];

        [(SHSheetInteractor *)self requestServiceUpdate];
        goto LABEL_26;
      }
    }
    goto LABEL_21;
  }
}

- (BOOL)hasSessionStarted
{
  v2 = [(SHSheetInteractor *)self serviceManager];
  BOOL v3 = [v2 connectionState] != 0;

  return v3;
}

- (void)updateSessionWithContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Update session with context:%@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(SHSheetInteractor *)self session];
  [v6 updateWithContext:v4];
}

- (void)startSession
{
  BOOL v3 = [(SHSheetInteractor *)self hasSessionStarted];
  id v4 = share_sheet_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Session has already started.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Start session", v9, 2u);
    }

    [(SHSheetInteractor *)self _setupServiceManagerIfNeeded];
    int v6 = [(SHSheetInteractor *)self serviceManager];
    int v7 = [(SHSheetInteractor *)self session];
    [v6 connectWithSession:v7];

    id v4 = [(SHSheetInteractor *)self session];
    id v8 = [v4 remoteScene];
    [v8 activate];
  }
}

- (void)stopSession
{
  BOOL v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Stop session", v4, 2u);
  }

  [(SHSheetInteractor *)self setServiceManager:0];
}

- (void)requestServiceUpdate
{
  BOOL v3 = [(SHSheetInteractor *)self session];
  id v8 = [v3 _createActivityMatchingContext];

  id v4 = [(SHSheetInteractor *)self session];
  BOOL v5 = [v4 activitiesManager];
  [v5 updateActivitiesWithContext:v8];

  int v6 = [(SHSheetInteractor *)self session];
  LODWORD(v5) = [v6 useRemoteUIService];

  if (v5) {
    [(SHSheetInteractor *)self _updateRemoteScene];
  }
  int v7 = [(SHSheetInteractor *)self serviceManager];
  [v7 update];
}

- (void)_updateRemoteScene
{
  BOOL v3 = [(SHSheetInteractor *)self session];
  id v6 = [v3 remoteScene];

  if (v6)
  {
    id v4 = [(SHSheetInteractor *)self session];
    BOOL v5 = [v4 createClientContext];

    [v6 updateWithSessionContext:v5];
  }
}

- (void)invalidateRemoteSession
{
  v2 = [(SHSheetInteractor *)self session];
  BOOL v3 = [v2 remoteScene];

  if (v3)
  {
    id v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v5 = 0;
      _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "invalidate remote session", v5, 2u);
    }

    [v3 resetContext];
  }
}

- (void)clearActivityForResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHSheetInteractor *)self session];
  id v6 = [v5 activityViewController];

  int v7 = [v4 activity];
  uint64_t v8 = [v4 completedState];
  [v6 readyToInteractTimestamp];
  [v6 creationTimestamp];
  uint64_t v9 = UpTicksToMilliseconds();
  mach_continuous_time();
  [v6 creationTimestamp];
  uint64_t v10 = UpTicksToMilliseconds();
  [(SHSheetInteractor *)self _recordActivityInteractionForResult:v4];

  v11 = [(SHSheetInteractor *)self serviceManager];

  if (v11)
  {
    BOOL v12 = v8 == 5;
    v13 = [(SHSheetInteractor *)self serviceManager];
    v14 = [(SHSheetInteractor *)self session];
    v15 = [v14 identifier];
    uint64_t v16 = [v7 activityType];
    [v13 reportActivityWithSessionID:v15 presentationMs:v9 totalShareTimeMs:v10 activityType:v16 success:v12];
  }
  else
  {
    v17 = share_sheet_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v20 = 0;
      _os_log_impl(&dword_1A0AD8000, v17, OS_LOG_TYPE_DEFAULT, "Service manager is nil.", v20, 2u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [(SHSheetInteractor *)self session];
    v19 = [v18 activitiesManager];
    [v19 removeActivity:v7];
  }
}

- (void)performActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHSheetInteractor *)self activityPerformer];
  int v6 = [v5 isRunning];

  if (v6)
  {
    int v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(SHSheetInteractor *)(uint64_t)v4 performActivity:v7];
    }
  }
  else
  {
    [(SHSheetInteractor *)self _runActivity:v4];
  }
}

- (void)performPeopleSuggestion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 transportBundleIdentifier];
  int v6 = +[_UIActivityHelper activityTypeForBundleIdentifier:v5];
  int v7 = [(SHSheetInteractor *)self session];
  uint64_t v8 = [v7 activitiesManager];
  uint64_t v9 = [v8 activityForActivityType:v6];

  if (v9)
  {
    uint64_t v10 = [(SHSheetInteractor *)self session];
    [v10 setCurrentPeopleSuggestion:v4];

    v11 = [(SHSheetInteractor *)self serviceManager];
    BOOL v12 = [v4 identifier];
    [v11 provideFeedbackForPeopleSugestionIdentifier:v12];

    [(SHSheetInteractor *)self _performActivity:v9];
  }
  else
  {
    v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      v15 = v6;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "activityType:%@ is not available for people suggestion:%@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)performActivityWithRequest:(id)a3 forExtension:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SHSheetInteractor *)self _prepareActivityProxyForRequest:v8];
  id location = 0;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__SHSheetInteractor_performActivityWithRequest_forExtension_completion___block_invoke;
  v15[3] = &unk_1E5A22B38;
  objc_copyWeak(&v19, &location);
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [v11 setDidFinishPreparingForExecution:v15];
  [(SHSheetInteractor *)self _performActivity:v11];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __72__SHSheetInteractor_performActivityWithRequest_forExtension_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    BOOL v3 = [WeakRetained activityPerformer];
    id v4 = [v3 activity];

    BOOL v5 = [v9 session];
    int v6 = [v5 activityItemsManager];
    int v7 = [v6 activityItemValuesForActivity:v4];

    id v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "classForPreparingExtensionItemData"), "preparedActivityExtensionItemDataForActivityItemValues:extensionItemDataRequest:", v7, *(void *)(a1 + 32));
    [v8 prepareForSendingToExtension:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    id WeakRetained = v9;
  }
}

- (void)preheatActivitiesIfNeeded
{
  id v3 = [(SHSheetInteractor *)self session];
  v2 = [v3 activitiesManager];
  [v2 preheatActivitiesIfNeeded];
}

- (void)activityViewControllerDidAppear
{
  id v2 = [(SHSheetInteractor *)self serviceManager];
  [v2 activityViewControllerDidAppear];
}

- (void)activityViewControllerDidDisappear
{
  id v2 = [(SHSheetInteractor *)self serviceManager];
  [v2 activityViewControllerDidDisappear];
}

- (void)applicationDidEnterBackground
{
  id v2 = [(SHSheetInteractor *)self serviceManager];
  [v2 applicationDidEnterBackground];
}

- (void)applicationWillEnterForeground
{
  id v2 = [(SHSheetInteractor *)self serviceManager];
  [v2 applicationWillEnterForeground];
}

- (id)createActivityItemsConfiguration
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1408]) initWithItemProviders:v2];

  return v3;
}

- (void)performShareActivityWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Perform share activity with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(SHSheetInteractor *)self serviceManager];
  [v6 performShareActivityWithIdentifier:v4];
}

- (void)performActionActivityWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Perform action activity with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(SHSheetInteractor *)self serviceManager];
  [v6 performActionActivityWithIdentifier:v4];
}

- (void)performEditAction
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Perform edit action", v5, 2u);
  }

  id v4 = [(SHSheetInteractor *)self serviceManager];
  [v4 performEditAction];
}

- (void)performPersonSuggestionWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Perform person suggestion with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(SHSheetInteractor *)self serviceManager];
  [v6 performPersonSuggestionWithIdentifier:v4];
}

- (void)removePersonSuggestionWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Remove person suggestion with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  int v6 = [(SHSheetInteractor *)self serviceManager];
  [v6 removePersonSuggestionWithIdentifier:v4];
}

- (void)toggleUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Toggle user defaults activity with identifier:%@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(SHSheetInteractor *)self serviceManager];
  [v8 toggleUserDefaultsActivityWithIdentifier:v6 activityCategory:a4];
}

- (void)favoriteUserDefaultsActivity:(BOOL)a3 withIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  BOOL v6 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = share_sheet_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "Favorite user defaults activity with identifier:%@", (uint8_t *)&v11, 0xCu);
  }

  id v10 = [(SHSheetInteractor *)self serviceManager];
  [v10 favoriteUserDefaultsActivity:v6 withIdentifier:v8 activityCategory:a5];
}

- (void)updateUserDefaultsFavorites:(id)a3 activityCategory:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Update user defaults favorites:%@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(SHSheetInteractor *)self serviceManager];
  [v8 updateUserDefaultsFavorites:v6 activityCategory:a4];
}

- (void)performUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Perform user defaults activity with identifier:%@", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(SHSheetInteractor *)self serviceManager];
  [v8 performUserDefaultsActivityWithIdentifier:v6 activityCategory:a4];
}

- (void)longPressShareActivityWithIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Long press share activity with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SHSheetInteractor *)self serviceManager];
  [v6 longPressShareActivityWithIdentifier:v4];
}

- (void)provideFeedbackForPeopleSugestionIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Provide feedback for people suggestion identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SHSheetInteractor *)self serviceManager];
  [v6 provideFeedbackForPeopleSugestionIdentifier:v4];
}

- (void)performActivityWithType:(id)a3 completionHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "Perform activity with type:%@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v9 = [(SHSheetInteractor *)self serviceManager];
  [v9 performActivityWithType:v6 completionHandler:v7];
}

- (void)findSupportedActivitiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Find supported activities", v7, 2u);
  }

  id v6 = [(SHSheetInteractor *)self serviceManager];
  [v6 findSupportedActivitiesWithCompletionHandler:v4];
}

- (void)_setupServiceManagerIfNeeded
{
  if (!self->_serviceManager)
  {
    id v3 = objc_alloc_init(SHSheetServiceManager);
    serviceManager = self->_serviceManager;
    self->_serviceManager = v3;

    BOOL v5 = self->_serviceManager;
    [(SHSheetServiceManager *)v5 setDelegate:self];
  }
}

- (void)_performActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHSheetInteractor *)self activityPerformer];
  if (([v5 isRunning] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v6 = [(SHSheetInteractor *)self collaborationPerformer];

  if (v6)
  {
LABEL_7:
    id v8 = [(SHSheetInteractor *)self session];
    uint64_t v9 = [v8 activityViewController];
    [v9 _performActivity:v4];

    goto LABEL_8;
  }
  id v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(SHSheetInteractor *)(uint64_t)v4 performActivity:v7];
  }

LABEL_8:
}

- (void)_runActivity:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 activityType];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Perform activity:%@", buf, 0xCu);
  }
  id v7 = [(SHSheetInteractor *)self collaborationPerformer];
  int v8 = [v7 isRunning];

  if (!v8)
  {
    v15 = [(SHSheetInteractor *)self session];
    v63 = [v15 collaborationItem];

    if ([v63 type]) {
      int v16 = 0;
    }
    else {
      int v16 = [v63 isiCloudDrive];
    }
    id v17 = [(SHSheetInteractor *)self collaborationPerformer];
    id v18 = [v17 activityType];
    id v19 = [v4 activityType];
    if ([v18 isEqual:v19])
    {
      char v20 = [(SHSheetInteractor *)self collaborationPerformer];
      v21 = [v20 cloudSharingResult];
      BOOL v22 = v21 != 0;
    }
    else
    {
      BOOL v22 = 0;
    }

    if ([v63 type] == 2) {
      int v23 = [v63 isURLProviderSupported];
    }
    else {
      int v23 = 0;
    }
    if ([v63 type] == 1) {
      int v24 = 1;
    }
    else {
      int v24 = v16 | v23;
    }
    uint64_t v25 = [(id)objc_opt_class() activityCategory];
    v26 = [v4 activityType];
    if ([v26 isEqual:@"com.apple.UIKit.activity.AirDrop"])
    {
      unsigned int v27 = 0;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E4F9F6B8];
      int v29 = [v4 activityType];
      LODWORD(v28) = [v28 isHeroCollaborationActivityType:v29];

      unsigned int v27 = v28 ^ 1;
    }

    v30 = [(SHSheetInteractor *)self session];
    if ([v30 isCollaborative])
    {
      if (v25 == 1) {
        unsigned int v31 = v27;
      }
      else {
        unsigned int v31 = 0;
      }
      int v32 = v22 | v31 & v24 ^ 1;
    }
    else
    {
      int v32 = 1;
    }
    unsigned int v61 = v32;

    v33 = [v4 activityType];
    if (([v33 isEqual:@"com.apple.UIKit.activity.AirDrop"] & 1) == 0)
    {
      v34 = [(SHSheetInteractor *)self session];
      if ([v34 isCollaborative])
      {
        char IsCollaborationItemEligibleForActivity = SHSheetIsCollaborationItemEligibleForActivity(v63, v4);

        if ((IsCollaborationItemEligibleForActivity & 1) == 0)
        {
          v36 = share_sheet_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            v37 = [v4 activityType];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v37;
            _os_log_impl(&dword_1A0AD8000, v36, OS_LOG_TYPE_DEFAULT, "Collaboration not supported for URL - activity:%@", buf, 0xCu);
          }
          v38 = [(SHSheetInteractor *)self delegate];
          [v38 interactorDidFailPerformActivityNotCollaborationEligible:self];

          goto LABEL_57;
        }
LABEL_35:
        v62 = [(SHSheetInteractor *)self session];
        v39 = [v62 collaborationModeRestriction];
        uint64_t v40 = [v39 disabledMode];
        if (v40 == 1)
        {
          v60 = [(SHSheetInteractor *)self session];
          if ([v60 isCollaborative])
          {

            goto LABEL_50;
          }
        }
        v41 = [(SHSheetInteractor *)self session];
        v42 = [v41 collaborationModeRestriction];
        uint64_t v43 = [v42 disabledMode];
        if (v43
          || ([(SHSheetInteractor *)self session],
              v59 = objc_claimAutoreleasedReturnValue(),
              [v59 isCollaborative]))
        {
          v44 = [(SHSheetInteractor *)self session];
          v45 = [v44 collaborationModeRestriction];
          if ([v45 disabledMode])
          {

            int v46 = 0;
            if (!v43)
            {
LABEL_48:

              if (v40 != 1)
              {
LABEL_49:

                if (v46)
                {
LABEL_50:
                  v48 = [(SHSheetInteractor *)self session];
                  v49 = [v48 collaborationModeRestriction];
                  v50 = [v49 alertTitle];
                  if (v50)
                  {
                    v51 = [(SHSheetInteractor *)self session];
                    v52 = [v51 collaborationModeRestriction];
                    int v53 = [v52 allowContinueToMode];

                    if (v53)
                    {
                      v54 = share_sheet_log();
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1A0AD8000, v54, OS_LOG_TYPE_DEFAULT, "Showing mode restriction alert. Waiting for user confirmation...", buf, 2u);
                      }

                      *(void *)buf = 0;
                      objc_initWeak((id *)buf, self);
                      v55 = [(SHSheetInteractor *)self delegate];
                      v56 = [(SHSheetInteractor *)self session];
                      v57 = [v56 collaborationModeRestriction];
                      v64[0] = MEMORY[0x1E4F143A8];
                      v64[1] = 3221225472;
                      v64[2] = __34__SHSheetInteractor__runActivity___block_invoke;
                      v64[3] = &unk_1E5A22B60;
                      objc_copyWeak(&v67, (id *)buf);
                      id v65 = v4;
                      id v66 = v63;
                      char v68 = v61;
                      [v55 interactor:self showingModeRestriction:v57 continueHandler:v64];

                      objc_destroyWeak(&v67);
                      objc_destroyWeak((id *)buf);
                      goto LABEL_57;
                    }
                  }
                  else
                  {
                  }
                }
LABEL_56:
                [(SHSheetInteractor *)self _startPerformingActivity:v4 collaborationItem:v63 skipCollaborationPerformer:v61];
LABEL_57:

                goto LABEL_58;
              }
LABEL_45:

              if (v46) {
                goto LABEL_50;
              }
              goto LABEL_56;
            }
          }
          else
          {
            BOOL v58 = v43 == 0;
            v47 = [v4 activityType];
            int v46 = [v47 isEqual:@"com.apple.UIKit.activity.AirDrop"];

            if (v58) {
              goto LABEL_48;
            }
          }

          if (v40 != 1) {
            goto LABEL_49;
          }
          goto LABEL_45;
        }
        int v46 = 1;
        goto LABEL_48;
      }
    }
    goto LABEL_35;
  }
  uint64_t v9 = [(SHSheetInteractor *)self collaborationPerformer];
  [v9 cancel];

  [(SHSheetInteractor *)self setCollaborationPerformer:0];
  int v10 = [v4 activityType];
  id v11 = [(SHSheetInteractor *)self session];
  uint64_t v12 = [v11 performingActivity];
  uint64_t v13 = [v12 activityType];
  char v14 = [v10 isEqual:v13];

  if ((v14 & 1) == 0) {
    [(SHSheetInteractor *)self _runActivity:v4];
  }
LABEL_58:
}

void __34__SHSheetInteractor__runActivity___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"did not choose";
    if (a2) {
      id v6 = @"chose";
    }
    int v9 = 138412290;
    int v10 = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "User %@ to continue", (uint8_t *)&v9, 0xCu);
  }

  if (a2)
  {
    [WeakRetained _startPerformingActivity:*(void *)(a1 + 32) collaborationItem:*(void *)(a1 + 40) skipCollaborationPerformer:*(unsigned __int8 *)(a1 + 56)];
  }
  else
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [*(id *)(a1 + 32) activityType];
      int v9 = 138412290;
      int v10 = v8;
      _os_log_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEFAULT, "Canceling perform for activity %@ due to user's choice in mode restriction alert", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_startPerformingActivity:(id)a3 collaborationItem:(id)a4 skipCollaborationPerformer:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [(SHSheetInteractor *)self session];
  [v10 setPerformingActivity:v8];

  if (!v9 || a5)
  {
    int v16 = [(SHSheetInteractor *)self delegate];
    [v16 interactor:self willPerformActivity:v8];

    [(SHSheetInteractor *)self _recordActivityViewControllerInteraction];
    id v17 = [(SHSheetInteractor *)self delegate];
    char v14 = [v17 interactor:self activityPresentationControllerForActivity:v8];

    id v18 = [SHSheetActivityPerformer alloc];
    id v19 = [(SHSheetInteractor *)self session];
    char v20 = [(SHSheetActivityPerformer *)v18 initWithActivity:v8 session:v19];

    [(SHSheetActivityPerformer *)v20 setDelegate:self];
    [(SHSheetActivityPerformer *)v20 setPresentationController:v14];
    [(SHSheetInteractor *)self setActivityPerformer:v20];
    id location = 0;
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__SHSheetInteractor__startPerformingActivity_collaborationItem_skipCollaborationPerformer___block_invoke;
    v21[3] = &unk_1E5A22B88;
    objc_copyWeak(&v22, &location);
    [(SHSheetActivityPerformer *)v20 performWithCompletionHandler:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F9F6B0]);
    uint64_t v12 = [v8 activityType];
    uint64_t v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    char v14 = objc_msgSend(v11, "initWithCollaborationItem:activityType:deviceScreenScale:", v9, v12);

    [v14 setDelegate:self];
    [v14 setCreationDelegate:self];
    [(SHSheetInteractor *)self setCollaborationPerformer:v14];
    v15 = [(SHSheetInteractor *)self collaborationPerformer];
    [v15 perform];
  }
}

void __91__SHSheetInteractor__startPerformingActivity_collaborationItem_skipCollaborationPerformer___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didPerformActivityWithResult:v3];
}

- (void)_deleteSharingURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHSheetInteractor *)self session];
  id v6 = [v5 collaborationItem];
  uint64_t v7 = [v6 type];

  if (v7 == 1)
  {
    id v8 = [(SHSheetInteractor *)self session];
    id v9 = [v8 collaborationItem];

    int v10 = [v9 containerSetupInfo];
  }
  else
  {
    int v10 = 0;
  }
  id v11 = [(SHSheetInteractor *)self serviceManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__SHSheetInteractor__deleteSharingURL___block_invoke;
  v13[3] = &unk_1E5A22BB0;
  id v14 = v4;
  id v12 = v4;
  [v11 deleteSharingURL:v12 containerSetupInfo:v10 completionHandler:v13];
}

void __39__SHSheetInteractor__deleteSharingURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __39__SHSheetInteractor__deleteSharingURL___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }
  id v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromBOOL();
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Sharing URL was removed successfully:%@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_didPerformActivityWithResult:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 completedState] == 4 || objc_msgSend(v4, "completedState") == 3;
  id v6 = [(SHSheetInteractor *)self session];
  int v7 = [v6 isCollaborative];

  if (v7 && v5)
  {
    int v8 = (void *)MEMORY[0x1E4F9F6B8];
    id v9 = [(SHSheetInteractor *)self session];
    uint64_t v10 = [v9 collaborationItem];
    LODWORD(v8) = [v8 canDeleteShareForCollaborationItem:v10];

    if (v8)
    {
      id v11 = [(SHSheetInteractor *)self collaborationPerformer];
      id v12 = [v11 cloudSharingResult];
      uint64_t v13 = [v12 sharingURL];

      if (v13)
      {
        id v14 = share_sheet_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = [v4 activity];
          int v16 = [v15 activityType];
          int v36 = 138412546;
          v37 = v16;
          __int16 v38 = 2112;
          v39 = v13;
          _os_log_impl(&dword_1A0AD8000, v14, OS_LOG_TYPE_DEFAULT, "Activity failed:%@ - delete sharing URL:%@", (uint8_t *)&v36, 0x16u);
        }
        [(SHSheetInteractor *)self _deleteSharingURL:v13];
      }
    }
    else
    {
      uint64_t v13 = share_sheet_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = [v4 activity];
        id v18 = [v17 activityType];
        int v36 = 138412290;
        v37 = v18;
        _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "Activity failed:%@ - can't delete post share", (uint8_t *)&v36, 0xCu);
      }
    }
  }
  if (!v5)
  {
    id v19 = [(SHSheetInteractor *)self session];
    char v20 = [v19 collaborationItem];

    v21 = [(SHSheetInteractor *)self serviceManager];
    id v22 = (void *)MEMORY[0x1E4F28ED0];
    int v23 = [(SHSheetInteractor *)self session];
    int v24 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "isCollaborative"));
    uint64_t v25 = [v20 contentIdentifier];
    [v21 saveCollaborativeMode:v24 forContentIdentifier:v25];

    v26 = [v20 additionalContentIdentifier];
    if (v26)
    {
      unsigned int v27 = [(SHSheetInteractor *)self serviceManager];
      v28 = (void *)MEMORY[0x1E4F28ED0];
      int v29 = [(SHSheetInteractor *)self session];
      v30 = objc_msgSend(v28, "numberWithBool:", objc_msgSend(v29, "isCollaborative"));
      [v27 saveCollaborativeMode:v30 forContentIdentifier:v26];
    }
  }
  unsigned int v31 = [(SHSheetInteractor *)self delegate];
  [v31 interactor:self didPerformActivityWithResult:v4];

  [(SHSheetInteractor *)self setActivityPerformer:0];
  [(SHSheetInteractor *)self setCollaborationPerformer:0];
  int v32 = [(SHSheetInteractor *)self session];
  [v32 setPerformingActivity:0];

  v33 = [(SHSheetInteractor *)self session];
  [v33 setCurrentPeopleSuggestion:0];

  v34 = [(SHSheetInteractor *)self session];
  v35 = [v34 collaborationItem];
  [v35 setCloudSharingResult:0];
}

- (id)_prepareActivityProxyForRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHSheetInteractor *)self session];
  id v6 = [v5 activityViewController];
  int v7 = [v4 activityType];
  int v8 = [v4 activitySpecificMetadata];
  [v6 _willPerformInServiceActivityType:v7 activitySpecificMetadata:v8];

  id v9 = +[_UIShareServiceActivityProxy activityProxyForServiceActivityDataRequest:v4];

  uint64_t v10 = [(SHSheetInteractor *)self session];
  id v11 = [v10 activitiesManager];
  [v11 addActivity:v9];

  return v9;
}

- (void)sessionConfigurationDidChangeForSession:(id)a3
{
  id v4 = [(SHSheetInteractor *)self delegate];
  [v4 interactorDidUpdateSessionConfiguration:self];
}

- (void)showOptionsDidChangeForSession:(id)a3
{
  id v4 = [(SHSheetInteractor *)self delegate];
  [v4 interactorDidUpdateObjectManipulationSupport:self];
}

- (void)headerMetadataDidChangeForSession:(id)a3
{
  id v4 = [(SHSheetInteractor *)self delegate];
  [v4 interactorDidUpdateHeaderMetadata:self];
}

- (void)isCollaborativeDidChangeForSession:(id)a3
{
  id v4 = [(SHSheetInteractor *)self delegate];
  [v4 interactorDidUpdateCollaborationDetails:self];
}

- (void)collaborationFooterViewModelDidChangeForSession:(id)a3
{
  id v4 = [(SHSheetInteractor *)self delegate];
  [v4 interactorDidUpdateCollaborationDetails:self];
}

- (id)collaborationSharingResultForActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SHSheetInteractor *)self collaborationPerformer];
  id v6 = [v5 activityType];
  int v7 = [v4 activityType];

  LODWORD(v4) = [v6 isEqual:v7];
  if (v4)
  {
    int v8 = [(SHSheetInteractor *)self collaborationPerformer];
    id v9 = [v8 cloudSharingResult];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void)session:(id)a3 didChangeMetadata:(id)a4
{
  id v5 = a4;
  id v6 = [(SHSheetInteractor *)self delegate];
  [v6 interactor:self didChangeMetadata:v5];
}

- (void)serviceManager:(id)a3 performActivity:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(SHSheetInteractor *)self _performActivity:v5];
}

- (void)serviceManager:(id)a3 performUserDefaultsActivityWithContext:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v6 = [(SHSheetInteractor *)self delegate];
  [v6 interactor:self didPerformUserDefaultsActivityWithContext:v5];
}

- (void)serviceManager:(id)a3 performAirdropViewActivityWithNoContentView:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v6 = [(SHSheetInteractor *)self delegate];
  [v6 interactor:self didPerformAirdropViewActivityWithNoContentView:v4];
}

- (void)serviceManager:(id)a3 didUpdateAirDropTransferWithChange:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v6 = [(SHSheetInteractor *)self delegate];
  [v6 interactor:self didUpdateAirDropTransferWithChange:v5];
}

- (void)serviceManager:(id)a3 willPerformActivityInServiceForRequest:(id)a4 completion:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v10 = [(SHSheetInteractor *)self session];
  id v11 = [v10 performingActivity];
  if (v11)
  {
    id v12 = [(SHSheetInteractor *)self session];
    uint64_t v13 = [v12 performingActivity];
    id v14 = [v13 activityType];
    char v15 = [v14 isEqual:@"com.apple.UIKit.activity.AirDrop"];

    if ((v15 & 1) == 0)
    {
      int v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      v36[0] = @"An other activity is currently performing.";
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      id v18 = [v16 errorWithDomain:@"com.apple.sharesheet.activity-request" code:-1 userInfo:v17];

      (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v18);
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v18 = [(SHSheetInteractor *)self _prepareActivityProxyForRequest:v8];
  id location = 0;
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke;
  v30[3] = &unk_1E5A22180;
  objc_copyWeak(&v33, &location);
  id v31 = v8;
  id v32 = v9;
  [v18 setDidFinishPreparingForExecution:v30];
  id v19 = [(SHSheetInteractor *)self session];
  char v20 = [v19 activityViewController];

  v21 = [v20 airDropDelegate];
  if (objc_opt_respondsToSelector()) {
    int v22 = 1;
  }
  else {
    int v22 = objc_opt_respondsToSelector();
  }
  int v23 = [v18 activityType];
  int v24 = [v23 isEqual:@"com.apple.UIKit.activity.AirDrop"];

  if ((v24 & v22) != 0)
  {
    uint64_t v25 = [(SHSheetInteractor *)self session];
    v26 = [v25 identifier];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_3;
    v28[3] = &unk_1E5A22C00;
    v28[4] = self;
    id v29 = v18;
    +[_UIActivityRecipientManager requestRecipientsV2ForSessionID:v26 completionHandler:v28];
  }
  else
  {
    [(SHSheetInteractor *)self _performActivity:v18];
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
LABEL_12:
}

void __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained activityPerformer];
    id v5 = [v4 activity];

    id v6 = [v3 session];
    int v7 = [v6 activityItemsManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_2;
    v9[3] = &unk_1E5A22BD8;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v7 loadItemProvidersForRequest:v8 activity:v5 completion:v9];
  }
}

uint64_t __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_4;
  block[3] = &unk_1E5A21A28;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) firstObject];
  if (v3)
  {
    id v2 = [*(id *)(a1 + 40) delegate];
    [v2 interactor:*(void *)(a1 + 40) airDropViewServiceWillStartTransferToRecipient:v3];
  }
  [*(id *)(a1 + 40) _performActivity:*(void *)(a1 + 48)];
}

- (void)serviceManager:(id)a3 didPerformInServiceActivityWithIdentifier:(id)a4 completed:(BOOL)a5 items:(id)a6 error:(id)a7
{
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(SHSheetInteractor *)self activityPerformer];
  char v15 = [v14 activity];
  int v16 = [v15 activityUUID];

  if (v16 && ([v11 isEqual:v16] & 1) != 0)
  {
    id v17 = [(SHSheetInteractor *)self activityPerformer];
    id v18 = [v17 activity];
    [v18 activityDidFinish:v9 items:v12 error:v13];
  }
  else
  {
    id v19 = share_sheet_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SHSheetInteractor serviceManager:didPerformInServiceActivityWithIdentifier:completed:items:error:]((uint64_t)v11, (uint64_t)v16, v19);
    }
  }
}

- (id)serviceManager:(id)a3 identificationResultsFromSuggestedImageData:(id)a4
{
  return +[SHSheetImageIdentificationUtilities personIdResultsFromImage:a4];
}

- (void)_recordActivityViewControllerInteraction
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(SHSheetInteractor *)self activityPerformer];
  uint64_t v4 = [v3 activity];

  id v5 = [(SHSheetInteractor *)self session];
  id v6 = [v5 activityViewController];

  if ([v6 readyToInteractTimestamp])
  {
    int v7 = share_sheet_log();
    id v8 = share_sheet_log();
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v4);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      int v21 = 134349056;
      uint64_t v22 = [v6 readyToInteractTimestamp];
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Interact", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v21, 0xCu);
    }

    id v10 = share_sheet_log();
    id v11 = share_sheet_log();
    os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v4);

    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v10, OS_SIGNPOST_INTERVAL_END, v12, "Interact", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }

    id v13 = share_sheet_log();
    id v14 = share_sheet_log();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v4);

    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      uint64_t v16 = [v6 readyToInteractTimestamp];
      id v17 = [v4 activityType];
      int v21 = 134349314;
      uint64_t v22 = v16;
      __int16 v23 = 2114;
      int v24 = v17;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "InteractWithType", "%{public, signpost.description:begin_time}llu activityType=%{public, signpost.telemetry:string1}@", (uint8_t *)&v21, 0x16u);
    }
    id v18 = share_sheet_log();
    id v19 = share_sheet_log();
    os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v19, v4);

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v18, OS_SIGNPOST_INTERVAL_END, v20, "InteractWithType", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }

    [v6 setReadyToInteractTimestamp:0];
  }
}

- (void)_recordActivityInteractionForResult:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 completedState];
  id v6 = [(SHSheetInteractor *)self session];
  int v7 = [v6 activityViewController];

  if ([v7 viewWillAppearTimestamp])
  {
    if (v5 == 5)
    {
      id v8 = share_sheet_log();
      if (os_signpost_enabled(v8))
      {
        int v14 = 134349056;
        uint64_t v15 = [v7 viewWillAppearTimestamp];
        _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserShare.Success", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0xCu);
      }

      os_signpost_id_t v9 = share_sheet_log();
      if (!os_signpost_enabled(v9)) {
        goto LABEL_17;
      }
      LOWORD(v14) = 0;
      id v10 = "UserShare.Success";
    }
    else
    {
      id v11 = [v4 error];

      os_signpost_id_t v12 = share_sheet_log();
      BOOL v13 = os_signpost_enabled(v12);
      if (v11)
      {
        if (v13)
        {
          int v14 = 134349056;
          uint64_t v15 = [v7 viewWillAppearTimestamp];
          _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserShare.Error", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0xCu);
        }

        os_signpost_id_t v9 = share_sheet_log();
        if (!os_signpost_enabled(v9)) {
          goto LABEL_17;
        }
        LOWORD(v14) = 0;
        id v10 = "UserShare.Error";
      }
      else
      {
        if (v13)
        {
          int v14 = 134349056;
          uint64_t v15 = [v7 viewWillAppearTimestamp];
          _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserShare.Cancel", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0xCu);
        }

        os_signpost_id_t v9 = share_sheet_log();
        if (!os_signpost_enabled(v9)) {
          goto LABEL_17;
        }
        LOWORD(v14) = 0;
        id v10 = "UserShare.Cancel";
      }
    }
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES ", (uint8_t *)&v14, 2u);
LABEL_17:

    [v7 setViewWillAppearTimestamp:0];
  }
}

- (id)linkMetadataForActivityPerformer:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(SHSheetInteractor *)self delegate];
  id v6 = [v4 activity];

  int v7 = [v5 interactor:self linkMetadataForActivity:v6];

  return v7;
}

- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHSheetInteractor *)self serviceManager];
  [v8 createSharingURLForCollaborationRequest:v7 completionHandler:v6];
}

- (void)createSharingURLWithParticipantsForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHSheetInteractor *)self delegate];
  [v8 interactor:self createSharingURLWithParticipantsForCollaborationRequest:v7 completionHandler:v6];
}

- (void)addParticipantsAllowedForCollaborationItem:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F9F6B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SHSheetInteractor *)self serviceManager];
  [v6 addParticipantsAllowedForCollaborationItem:v8 collaborationService:v9 completionHandler:v7];
}

- (void)shareStatusForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHSheetInteractor *)self serviceManager];
  [v8 shareStatusForURL:v7 completionHandler:v6];
}

- (void)canShareFolderContainingExistingSharedItemsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetInteractor *)self delegate];
  [v5 interactor:self canShareFolderContainingExistingSharedItemsWithCompletionHandler:v4];
}

- (void)canManageShareForDocumentInSharedFolderWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetInteractor *)self delegate];
  [v5 interactor:self canManageShareForDocumentInSharedFolderWithCompletionHandler:v4];
}

- (void)manageShareForDocumentInSharedFolder
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 fileURL];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Unable to perform Manage Share because canPerform returned NO for file collaboration item with URL %@", (uint8_t *)&v4, 0xCu);
}

- (void)didBeginCreationForCollaborationPerformer:(id)a3
{
  if (([a3 requiresParticipants] & 1) == 0)
  {
    id v6 = [(SHSheetInteractor *)self delegate];
    int v4 = [(SHSheetInteractor *)self session];
    id v5 = [v4 performingActivity];
    [v6 interactor:self creatingCollaborationForActivity:v5];
  }
}

- (void)didFinishCreationForCollaborationPerformer:(id)a3
{
  id v16 = a3;
  if (([v16 requiresParticipants] & 1) == 0)
  {
    int v4 = [(SHSheetInteractor *)self delegate];
    id v5 = [(SHSheetInteractor *)self session];
    id v6 = [v5 performingActivity];
    [v4 interactor:self didCreateCollaborationForActivity:v6];
  }
  id v7 = [v16 cloudSharingResult];
  id v8 = [v7 sharingURL];

  if (v8)
  {
    id v9 = [(SHSheetInteractor *)self session];
    id v10 = [v9 performingActivity];
    [(SHSheetInteractor *)self _runActivity:v10];
  }
  else
  {
    id v11 = [(SHSheetInteractor *)self delegate];
    os_signpost_id_t v12 = [(SHSheetInteractor *)self session];
    BOOL v13 = [v12 performingActivity];
    int v14 = [v16 cloudSharingResult];
    uint64_t v15 = [v14 error];
    [v11 interactor:self didFailCreatingCollaborationForActivity:v13 error:v15];

    [(SHSheetInteractor *)self setCollaborationPerformer:0];
  }
}

- (void)didCancelCreationForCollaborationPerformer:(id)a3
{
  if (([a3 requiresParticipants] & 1) == 0)
  {
    id v6 = [(SHSheetInteractor *)self delegate];
    int v4 = [(SHSheetInteractor *)self session];
    id v5 = [v4 performingActivity];
    [v6 interactor:self didCancelCollaborationForActivity:v5];
  }
}

- (void)didFailCreationForCollaborationPerformer:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v8 = [(SHSheetInteractor *)self delegate];
  id v6 = [(SHSheetInteractor *)self session];
  id v7 = [v6 performingActivity];
  [v8 interactor:self didFailCreatingCollaborationForActivity:v7 error:v5];
}

- (SHSheetInteractorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetInteractorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHSheetActivityPerformerPresentationInterface)activityPresentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityPresentationController);
  return (SHSheetActivityPerformerPresentationInterface *)WeakRetained;
}

- (void)setActivityPresentationController:(id)a3
{
}

- (SHSheetSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (SHSheetServiceManager)serviceManager
{
  return self->_serviceManager;
}

- (void)setServiceManager:(id)a3
{
}

- (SHSheetActivityPerformer)activityPerformer
{
  return self->_activityPerformer;
}

- (void)setActivityPerformer:(id)a3
{
}

- (SFCollaborationPerformer)collaborationPerformer
{
  return self->_collaborationPerformer;
}

- (void)setCollaborationPerformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationPerformer, 0);
  objc_storeStrong((id *)&self->_activityPerformer, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_activityPresentationController);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)performActivity:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = [a2 activityPerformer];
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_3(&dword_1A0AD8000, a3, v5, "Trying to perform %@ but there is already an activity performing:%@", v6);
}

void __39__SHSheetInteractor__deleteSharingURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  OUTLINED_FUNCTION_1_3(&dword_1A0AD8000, a3, (uint64_t)a3, "error while removing sharingURL:%@ error:%@", (uint8_t *)&v4);
}

- (void)serviceManager:(NSObject *)a3 didPerformInServiceActivityWithIdentifier:completed:items:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_1_3(&dword_1A0AD8000, a3, (uint64_t)a3, "Attempted to call didPerformInServiceActivity for identifier %@ when current activity has identifier %@", (uint8_t *)&v3);
}

@end