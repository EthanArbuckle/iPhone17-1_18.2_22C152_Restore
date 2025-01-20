@interface SHSheetPresenter
- (BOOL)_shouldCompleteAirdropActivity;
- (BOOL)activityViewControllerIsEmbedded;
- (BOOL)activityViewControllerIsPresenting;
- (BOOL)activityViewControllerPresentationDidBegin;
- (BOOL)didReceiveInitialConfiguration;
- (BOOL)didRequestDismissal;
- (BOOL)didRequestInitialConfiguration;
- (BOOL)isCollaborationSelected;
- (BOOL)isContentManaged;
- (BOOL)isPresentingNonUIShareSheet;
- (BOOL)isReportingActivityResult;
- (BOOL)useRemoteUIService;
- (NSArray)selectedAssetIdentifiers;
- (NSString)sessionIdentifier;
- (NSUUID)collaborationItemIdentifier;
- (SFAirDropViewController)airdropViewController;
- (SHSheetActivityPerformerResult)activityResult;
- (SHSheetContentView)mainViewController;
- (SHSheetContentView)secondaryViewController;
- (SHSheetInteractor)interactor;
- (SHSheetPresenter)initWithRouter:(id)a3 interactor:(id)a4;
- (SHSheetPresenterDelegate)delegate;
- (SHSheetRouter)router;
- (UIActivity)currentActivity;
- (UIViewController)collaborationOptionsViewController;
- (UIViewController)collaborationParticipantsViewController;
- (UIViewController)optionsViewController;
- (_UIActivityUserDefaultsViewController)userDefaultsViewController;
- (_UIRemoteSheet)remoteSheet;
- (id)collaborationCreateSharingURLCompletionHandler;
- (id)collaborationParticipantsPresenter;
- (id)createActivityItemsConfiguration;
- (id)customTitleForActivityType:(id)a3;
- (id)interactor:(id)a3 activityPresentationControllerForActivity:(id)a4;
- (id)interactor:(id)a3 linkMetadataForActivity:(id)a4;
- (id)presentationDelayedTestingBlock;
- (id)session;
- (void)_activityViewControllerPresentationDidBegin:(id)a3;
- (void)_completeInitialConfigurationUpdate;
- (void)_didCompleteActivityWithResult:(id)a3;
- (void)_didCompleteCollaborationSharingURLCreationWithResult:(id)a3;
- (void)_didEnterBackground:(id)a3;
- (void)_dismiss;
- (void)_expandSharingContentView;
- (void)_findSupportedActivitiesWithCompletionHandler:(id)a3;
- (void)_finishAirdropActivityPerformer:(id)a3 withSuccess:(BOOL)a4;
- (void)_presentAirDropCollaborationUnsupportedAlert;
- (void)_registerForApplicationStateChangeNotification;
- (void)_showScreenTimeRestrictedAlert;
- (void)_startSessionIfNeeded;
- (void)_unregisterForApplicationStateChangeNotification;
- (void)_updateConfiguration;
- (void)_updateContentView:(id)a3;
- (void)_willEnterForeground:(id)a3;
- (void)activityViewController:(id)a3 traitCollectionDidChange:(id)a4;
- (void)activityViewControllerDidAppear:(id)a3;
- (void)activityViewControllerDidDisappear:(id)a3;
- (void)activityViewControllerDidResignContentViewControllerOfPopover:(id)a3;
- (void)activityViewControllerSizeWillChange:(id)a3;
- (void)activityViewControllerWillAppear:(id)a3;
- (void)activityViewControllerWillBeEmbedded:(id)a3;
- (void)activityViewControllerWillBePresented:(id)a3;
- (void)activityViewControllerWillDisappear:(id)a3;
- (void)addParticipantsViewController:(id)a3 completedSharingWithShareURL:(id)a4 ckShare:(id)a5;
- (void)addParticipantsViewController:(id)a3 failedToSaveShareWithError:(id)a4;
- (void)airDropViewController:(id)a3 didFinishTransferWithSuccess:(BOOL)a4;
- (void)airDropViewController:(id)a3 requestSendingAppBundleIdentifierWithCompletionHandler:(id)a4;
- (void)airDropViewController:(id)a3 requestSharedItemsWithDataRequest:(id)a4 completionHandler:(id)a5;
- (void)airDropViewControllerDidDismiss:(id)a3;
- (void)airDropViewControllerDidStartTransfer:(id)a3;
- (void)airDropViewServiceWillStartTransfer:(id)a3 toRecipient:(id)a4;
- (void)collaborationParticipantsViewController:(id)a3 didCreateURL:(id)a4 error:(id)a5;
- (void)didLongPressShareActivityWithIdentifier:(id)a3;
- (void)didSelectCollaborativeAction;
- (void)didSelectSendCopyAction;
- (void)dismiss;
- (void)handleActionsEdit;
- (void)handleActivity:(id)a3;
- (void)handleClose;
- (void)handleCollaborationOptions;
- (void)handleCustomHeaderButton;
- (void)handleInfoSuggestionPress:(id)a3;
- (void)handleNext;
- (void)handleOptions;
- (void)handlePeopleSuggestion:(id)a3;
- (void)interactor:(id)a3 airDropViewServiceWillStartTransferToRecipient:(id)a4;
- (void)interactor:(id)a3 canManageShareForDocumentInSharedFolderWithCompletionHandler:(id)a4;
- (void)interactor:(id)a3 canShareFolderContainingExistingSharedItemsWithCompletionHandler:(id)a4;
- (void)interactor:(id)a3 createSharingURLWithParticipantsForCollaborationRequest:(id)a4 completionHandler:(id)a5;
- (void)interactor:(id)a3 creatingCollaborationForActivity:(id)a4;
- (void)interactor:(id)a3 didCancelCollaborationForActivity:(id)a4;
- (void)interactor:(id)a3 didChangeMetadata:(id)a4;
- (void)interactor:(id)a3 didCreateCollaborationForActivity:(id)a4;
- (void)interactor:(id)a3 didFailCreatingCollaborationForActivity:(id)a4 error:(id)a5;
- (void)interactor:(id)a3 didPerformActivityWithResult:(id)a4;
- (void)interactor:(id)a3 didPerformAirdropViewActivityWithNoContentView:(BOOL)a4;
- (void)interactor:(id)a3 didPerformUserDefaultsActivityWithContext:(id)a4;
- (void)interactor:(id)a3 didUpdateAirDropTransferWithChange:(id)a4;
- (void)interactor:(id)a3 showingModeRestriction:(id)a4 continueHandler:(id)a5;
- (void)interactor:(id)a3 willPerformActivity:(id)a4;
- (void)interactorDidFailPerformActivityNotCollaborationEligible:(id)a3;
- (void)interactorDidUpdateCollaborationDetails:(id)a3;
- (void)interactorDidUpdateHeaderMetadata:(id)a3;
- (void)interactorDidUpdateObjectManipulationSupport:(id)a3;
- (void)interactorDidUpdateSessionConfiguration:(id)a3;
- (void)performActionActivityProxy:(id)a3;
- (void)performActivity:(id)a3;
- (void)performActivityWithType:(id)a3 completionHandler:(id)a4;
- (void)performPeopleSuggestionProxy:(id)a3;
- (void)performShareActivityProxy:(id)a3;
- (void)performShareActivityProxy:(id)a3 activityIdentifier:(id)a4;
- (void)prepareNonUIShareSheet;
- (void)prepareViewIfNeeded;
- (void)present;
- (void)presentCollaborationParticipantsViewControllerForCloudSharingRequest:(id)a3 completionHandler:(id)a4;
- (void)reloadActivity:(id)a3;
- (void)removePeopleSuggestionProxy:(id)a3;
- (void)requestRefreshedCustomizationGroupForObjectManipulationViewController:(id)a3;
- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (void)setActivityResult:(id)a3;
- (void)setActivityViewControllerIsEmbedded:(BOOL)a3;
- (void)setActivityViewControllerIsPresenting:(BOOL)a3;
- (void)setActivityViewControllerPresentationDidBegin:(BOOL)a3;
- (void)setAirdropViewController:(id)a3;
- (void)setCollaborationCreateSharingURLCompletionHandler:(id)a3;
- (void)setCollaborationItemIdentifier:(id)a3;
- (void)setCollaborationOptionsViewController:(id)a3;
- (void)setCollaborationParticipantsViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidReceiveInitialConfiguration:(BOOL)a3;
- (void)setDidRequestDismissal:(BOOL)a3;
- (void)setDidRequestInitialConfiguration:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setIsPresentingNonUIShareSheet:(BOOL)a3;
- (void)setIsReportingActivityResult:(BOOL)a3;
- (void)setMainViewController:(id)a3;
- (void)setOptionsViewController:(id)a3;
- (void)setPresentationDelayedTestingBlock:(id)a3;
- (void)setSecondaryViewController:(id)a3;
- (void)setSelectedAssetIdentifiers:(id)a3;
- (void)setUserDefaultsViewController:(id)a3;
- (void)updateCustomView;
- (void)updateWithContext:(id)a3;
- (void)userDefaultsViewController:(id)a3 didFavoriteActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6;
- (void)userDefaultsViewController:(id)a3 didSelectActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5 disabled:(BOOL)a6;
- (void)userDefaultsViewController:(id)a3 didToggleActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5;
- (void)userDefaultsViewController:(id)a3 didUpdateFavoritesProxies:(id)a4 activityCategory:(int64_t)a5;
@end

@implementation SHSheetPresenter

- (SHSheetPresenter)initWithRouter:(id)a3 interactor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHSheetPresenter;
  v9 = [(SHSheetPresenter *)&v12 init];
  if (v9)
  {
    v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SHSheetPresenter initWithRouter:interactor:]((uint64_t)v7, (uint64_t)v8, v10);
    }

    objc_storeStrong((id *)&v9->_router, a3);
    objc_storeStrong((id *)&v9->_interactor, a4);
    [(SHSheetInteractor *)v9->_interactor setDelegate:v9];
    [(SHSheetInteractor *)v9->_interactor startSession];
  }

  return v9;
}

- (void)_startSessionIfNeeded
{
  v3 = [(SHSheetPresenter *)self interactor];
  char v4 = [v3 hasSessionStarted];

  if ((v4 & 1) == 0)
  {
    interactor = self->_interactor;
    [(SHSheetInteractor *)interactor startSession];
  }
}

- (id)session
{
  v2 = [(SHSheetPresenter *)self interactor];
  v3 = [v2 session];

  return v3;
}

- (BOOL)useRemoteUIService
{
  v2 = [(SHSheetPresenter *)self interactor];
  v3 = [v2 session];
  char v4 = [v3 useRemoteUIService];

  return v4;
}

- (_UIRemoteSheet)remoteSheet
{
  v2 = [(SHSheetPresenter *)self interactor];
  v3 = [v2 session];
  char v4 = [v3 remoteScene];

  if ([v4 conformsToProtocol:&unk_1EF367288]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return (_UIRemoteSheet *)v5;
}

- (UIActivity)currentActivity
{
  v2 = [(SHSheetPresenter *)self interactor];
  v3 = [v2 activityPerformer];
  char v4 = [v3 activity];

  return (UIActivity *)v4;
}

- (void)updateCustomView
{
}

- (void)setSelectedAssetIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetPresenter *)self session];
  [v5 setSelectedAssetIdentifiers:v4];
}

- (NSArray)selectedAssetIdentifiers
{
  v2 = [(SHSheetPresenter *)self session];
  v3 = [v2 selectedAssetIdentifiers];

  return (NSArray *)v3;
}

- (void)setIsContentManaged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SHSheetPresenter *)self session];
  [v4 setIsContentManaged:v3];
}

- (BOOL)isContentManaged
{
  v2 = [(SHSheetPresenter *)self session];
  char v3 = [v2 isContentManaged];

  return v3;
}

- (NSString)sessionIdentifier
{
  v2 = [(SHSheetPresenter *)self session];
  char v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)updateWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetPresenter *)self interactor];
  v6 = [v5 activityPerformer];

  if (v6)
  {
    id v7 = share_sheet_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SHSheetPresenter updateWithContext:](v7);
    }
  }
  else
  {
    id v8 = [(SHSheetPresenter *)self interactor];
    [v8 updateSessionWithContext:v4];

    v9 = [(SHSheetPresenter *)self interactor];
    [v9 invalidateRemoteSession];

    [(SHSheetPresenter *)self _updateContentView:0];
    [(SHSheetPresenter *)self _updateConfiguration];
  }
}

- (void)reloadActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetPresenter *)self mainViewController];
  [v5 reloadActivity:v4];
}

- (void)_updateConfiguration
{
  char v3 = share_sheet_log();
  id v4 = share_sheet_log();
  id v5 = [(SHSheetPresenter *)self session];
  v6 = [v5 activityViewController];
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v4, v6);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UpdateConfiguration", (const char *)&unk_1A0BA1E03, buf, 2u);
  }

  [(SHSheetPresenter *)self _startSessionIfNeeded];
  id v8 = [(SHSheetPresenter *)self interactor];
  [v8 requestServiceUpdate];

  v9 = share_sheet_log();
  v10 = share_sheet_log();
  v11 = [(SHSheetPresenter *)self session];
  objc_super v12 = [v11 activityViewController];
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v10, v12);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v9, OS_SIGNPOST_INTERVAL_END, v13, "UpdateConfiguration", (const char *)&unk_1A0BA1E03, v14, 2u);
  }
}

- (BOOL)isCollaborationSelected
{
  v2 = [(SHSheetPresenter *)self interactor];
  char v3 = [v2 session];
  char v4 = [v3 isCollaborative];

  return v4;
}

- (id)createActivityItemsConfiguration
{
  v2 = [(SHSheetPresenter *)self interactor];
  char v3 = [v2 createActivityItemsConfiguration];

  return v3;
}

- (void)performActivityWithType:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHSheetPresenter *)self interactor];
  [v8 performActivityWithType:v7 completionHandler:v6];
}

- (void)_findSupportedActivitiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetPresenter *)self interactor];
  [v5 findSupportedActivitiesWithCompletionHandler:v4];
}

- (void)activityViewControllerWillBePresented:(id)a3
{
  id v4 = a3;
  [(SHSheetPresenter *)self _startSessionIfNeeded];
  [(SHSheetPresenter *)self setActivityViewControllerIsPresenting:1];
  [(SHSheetPresenter *)self _activityViewControllerPresentationDidBegin:v4];
}

- (void)activityViewControllerWillBeEmbedded:(id)a3
{
  id v4 = a3;
  [(SHSheetPresenter *)self _startSessionIfNeeded];
  [(SHSheetPresenter *)self setActivityViewControllerIsEmbedded:1];
  [(SHSheetPresenter *)self _activityViewControllerPresentationDidBegin:v4];
}

- (void)_activityViewControllerPresentationDidBegin:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(SHSheetPresenter *)self activityViewControllerIsPresenting]
    && ![(SHSheetPresenter *)self activityViewControllerPresentationDidBegin])
  {
    [(SHSheetPresenter *)self setActivityViewControllerPresentationDidBegin:1];
    if ([(SHSheetPresenter *)self useRemoteUIService]) {
      [(SHSheetPresenter *)self present];
    }
    id v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = [(SHSheetPresenter *)self activityViewControllerIsEmbedded];
      id v6 = @"presented";
      if (v5) {
        id v6 = @"embedded";
      }
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Share sheet is being %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)activityViewControllerWillAppear:(id)a3
{
  id v4 = a3;
  [(SHSheetPresenter *)self _registerForApplicationStateChangeNotification];
  [(SHSheetPresenter *)self _startSessionIfNeeded];
  int v5 = [v4 allowsEmbedding];

  if (v5
    && ![(SHSheetPresenter *)self activityViewControllerPresentationDidBegin])
  {
    [(SHSheetPresenter *)self setActivityViewControllerIsPresenting:1];
  }
}

- (void)activityViewControllerDidAppear:(id)a3
{
  id v4 = a3;
  int v5 = [(SHSheetPresenter *)self router];
  id v6 = [v5 rootViewController];
  int v7 = [v6 presentingViewController];

  id v8 = [(SHSheetPresenter *)self router];
  char v9 = [v8 isPresentedWithinPopover];

  v10 = [(SHSheetPresenter *)self session];
  if ([v10 allowsEmbedding] & 1) != 0 || v7 || (v9) {
    goto LABEL_8;
  }
  v11 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v12 = [v11 bundleIdentifier];
  if ([v12 isEqualToString:@"com.apple.facetime"])
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  os_signpost_id_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
  v14 = [v13 bundleIdentifier];
  if ([v14 isEqualToString:@"com.apple.Maps"])
  {

    goto LABEL_7;
  }
  v23 = [MEMORY[0x1E4F28B50] mainBundle];
  v24 = [v23 bundleIdentifier];
  char v25 = [v24 isEqualToString:@"com.apple.mobilecal"];

  if ((v25 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"UIActivityViewController can only be used modally or as contentViewController in popover on iPad."];
  }
LABEL_9:
  if (![(SHSheetPresenter *)self activityViewControllerIsPresenting]) {
    goto LABEL_19;
  }
  int v15 = [v4 allowsEmbedding];
  v16 = share_sheet_log();
  v17 = share_sheet_log();
  os_signpost_id_t v18 = os_signpost_id_make_with_pointer(v17, v4);

  if (v15)
  {
    if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
      goto LABEL_18;
    }
    __int16 v27 = 0;
    v19 = "PresentShareSheetEmbedded";
    v20 = (uint8_t *)&v27;
  }
  else
  {
    if (v18 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16)) {
      goto LABEL_18;
    }
    LOWORD(v26) = 0;
    v19 = " enableTelemetry=YES ";
    v20 = (uint8_t *)&v26;
  }
  _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v16, OS_SIGNPOST_INTERVAL_END, v18, "PresentShareSheet", v19, v20, 2u);
LABEL_18:

LABEL_19:
  -[SHSheetPresenter setActivityViewControllerIsPresenting:](self, "setActivityViewControllerIsPresenting:", 0, v26);
  v21 = [(SHSheetPresenter *)self presentationDelayedTestingBlock];
  [(SHSheetPresenter *)self setPresentationDelayedTestingBlock:0];
  if (v21) {
    v21[2](v21);
  }
  v22 = [(SHSheetPresenter *)self interactor];
  [v22 activityViewControllerDidAppear];
}

- (void)activityViewControllerWillDisappear:(id)a3
{
  id v4 = [(SHSheetPresenter *)self router];
  int v5 = [v4 rootViewController];
  int v6 = [v5 isBeingDismissed];

  if (v6)
  {
    int v7 = [(SHSheetPresenter *)self interactor];
    id v8 = [v7 activityPerformer];
    id v14 = [v8 activity];

    char v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    int IsCamera = _ShareSheetIsCamera();
    int IsSupportedPrintActivity = _ShareSheetIsSupportedPrintActivity(v14);
    if (!v10 && IsCamera && IsSupportedPrintActivity)
    {
      os_signpost_id_t v13 = [MEMORY[0x1E4F934B0] sharedPrintController];
      [v13 dismissAnimated:0];
    }
  }
}

- (void)activityViewControllerDidDisappear:(id)a3
{
  [(SHSheetPresenter *)self _unregisterForApplicationStateChangeNotification];
  [(SHSheetPresenter *)self setDidRequestDismissal:0];
  [(SHSheetPresenter *)self setDidReceiveInitialConfiguration:0];
  id v4 = [(SHSheetPresenter *)self interactor];
  [v4 activityViewControllerDidDisappear];
}

- (void)activityViewControllerSizeWillChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  int v6 = [(SHSheetPresenter *)self interactor];
  int v7 = [v6 session];
  id v8 = [v7 activityViewController];
  char v9 = [v8 customViewController];

  if (v9)
  {
    if (v5 != 1)
    {
      uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
      unint64_t v11 = [v10 orientation] - 1;

      if (v11 <= 1)
      {
        id v12 = [(SHSheetPresenter *)self router];
        [v12 dismissSecondaryViewControllerAnimated:0];
      }
    }
  }
}

- (void)activityViewController:(id)a3 traitCollectionDidChange:(id)a4
{
  id v9 = a4;
  if ([(SHSheetPresenter *)self didRequestInitialConfiguration]
    || [(SHSheetPresenter *)self didReceiveInitialConfiguration])
  {
    uint64_t v5 = [(SHSheetPresenter *)self router];
    int v6 = [v5 rootViewController];
    int v7 = [v6 traitCollection];

    uint64_t v8 = [v9 userInterfaceStyle];
    if (v8 != [v7 userInterfaceStyle]) {
      [(SHSheetPresenter *)self _updateConfiguration];
    }
  }
}

- (void)activityViewControllerDidResignContentViewControllerOfPopover:(id)a3
{
  id v4 = [(SHSheetPresenter *)self interactor];
  id v7 = [v4 activityPerformer];

  if (!v7 || (BOOL v5 = [v7 state] == 1, v6 = v7, v5))
  {
    [(SHSheetPresenter *)self dismiss];
    int v6 = v7;
  }
}

- (void)prepareViewIfNeeded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = NSStringFromBOOL();
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_debug_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_DEBUG, "Prepare view with Airdrop only:%@", (uint8_t *)&v4, 0xCu);
}

- (void)present
{
  char v3 = [(SHSheetPresenter *)self session];
  int v4 = [v3 configuration];

  if (v4
    || [(SHSheetPresenter *)self didRequestInitialConfiguration]
    || [(SHSheetPresenter *)self didReceiveInitialConfiguration])
  {
    BOOL v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Initial configuration was already requested for presentation", buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_signpost_id_t v13 = 0;
      _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Request initial configuration for presentation", v13, 2u);
    }

    [(SHSheetPresenter *)self setDidRequestInitialConfiguration:1];
    id v7 = share_sheet_log();
    uint64_t v8 = share_sheet_log();
    id v9 = [(SHSheetPresenter *)self session];
    uint64_t v10 = [v9 activityViewController];
    os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v8, v10);

    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)id v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SendInitialConfiguration", (const char *)&unk_1A0BA1E03, v12, 2u);
    }

    BOOL v5 = [(SHSheetPresenter *)self interactor];
    [v5 requestServiceUpdate];
  }
}

- (void)prepareNonUIShareSheet
{
  [(SHSheetPresenter *)self setIsPresentingNonUIShareSheet:1];
  [(SHSheetPresenter *)self prepareViewIfNeeded];
  [(SHSheetPresenter *)self present];
}

- (void)performActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetPresenter *)self interactor];
  [v5 performActivity:v4];
}

- (void)dismiss
{
  char v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Request to dismiss Share Sheet", buf, 2u);
  }

  uint64_t v4 = [(SHSheetPresenter *)self mainViewController];
  if (!v4) {
    goto LABEL_11;
  }
  id v5 = (void *)v4;
  uint64_t v6 = [(SHSheetPresenter *)self mainViewController];
  id v7 = [v6 view];
  uint64_t v8 = [v7 window];
  if (v8)
  {
    id v9 = (void *)v8;
    uint64_t v10 = [(SHSheetPresenter *)self mainViewController];
    char v11 = [v10 isBeingDismissed];

    if ((v11 & 1) == 0)
    {
LABEL_11:
      [(SHSheetPresenter *)self setDidRequestDismissal:1];
      os_signpost_id_t v13 = [(SHSheetPresenter *)self interactor];
      id v12 = [v13 activityPerformer];

      if ([v12 isRunning]) {
        [v12 cancel];
      }
      else {
        [(SHSheetPresenter *)self _dismiss];
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  if (![(SHSheetPresenter *)self isReportingActivityResult]) {
    goto LABEL_11;
  }
  id v12 = share_sheet_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "Share Sheet is already dismissed or is currently dismissing, AND it is currently reporting its activity result.", v14, 2u);
  }
LABEL_14:
}

- (void)_dismiss
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SHSheetPresenter *)self setIsReportingActivityResult:1];
  char v3 = [(SHSheetPresenter *)self activityResult];
  [(SHSheetPresenter *)self setActivityResult:0];
  uint64_t v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Report Activity for result:%@", buf, 0xCu);
  }

  id v5 = [(SHSheetPresenter *)self delegate];
  uint64_t v6 = [v3 activity];
  objc_msgSend(v5, "mainPresenter:willCompleteActivity:withSuccess:", self, v6, objc_msgSend(v3, "completedState") == 5);

  id v7 = [(SHSheetPresenter *)self router];
  BOOL v8 = [(SHSheetPresenter *)self isPresentingNonUIShareSheet];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __28__SHSheetPresenter__dismiss__block_invoke;
  v11[3] = &unk_1E5A22A70;
  BOOL v9 = !v8;
  v11[4] = self;
  id v12 = v3;
  id v10 = v3;
  [v7 dismissForActivityPerformerResult:v10 didPresentFromShareSheet:v9 completionHandler:v11];
}

void __28__SHSheetPresenter__dismiss__block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) _didCompleteActivityWithResult:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setIsReportingActivityResult:0];
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) interactor];
    [v4 stopSession];
  }
}

- (void)_completeInitialConfigurationUpdate
{
  char v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Initial configuration update received", buf, 2u);
  }

  [(SHSheetPresenter *)self setDidReceiveInitialConfiguration:1];
  if (![(SHSheetPresenter *)self useRemoteUIService])
  {
    id v4 = [(SHSheetPresenter *)self delegate];
    [v4 mainPresenterIsReadyToInteract:self];
  }
  if ([(SHSheetPresenter *)self activityViewControllerPresentationDidBegin])
  {
    id v5 = (void *)*MEMORY[0x1E4FB2608];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__SHSheetPresenter__completeInitialConfigurationUpdate__block_invoke;
    v6[3] = &unk_1E5A21900;
    v6[4] = self;
    [v5 _performBlockAfterCATransactionCommits:v6];
  }
}

void __55__SHSheetPresenter__completeInitialConfigurationUpdate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) interactor];
  [v1 preheatActivitiesIfNeeded];
}

- (void)_didCompleteActivityWithResult:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 completedState] == 5;
  uint64_t v6 = [(SHSheetPresenter *)self delegate];
  id v7 = [v4 activity];
  BOOL v8 = [v4 returnedItems];
  BOOL v9 = [v4 error];
  [v6 mainPresenter:self didCompleteActivity:v7 withSuccess:v5 returnedItems:v8 error:v9];

  id v10 = [(SHSheetPresenter *)self interactor];
  [v10 clearActivityForResult:v4];
}

- (void)_registerForApplicationStateChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__didEnterBackground_ name:*MEMORY[0x1E4FB2640] object:0];
  [v3 addObserver:self selector:sel__willEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
}

- (void)_unregisterForApplicationStateChangeNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
}

- (void)_didEnterBackground:(id)a3
{
  id v3 = [(SHSheetPresenter *)self interactor];
  [v3 applicationDidEnterBackground];
}

- (void)_willEnterForeground:(id)a3
{
  id v4 = [(SHSheetPresenter *)self interactor];
  [v4 applicationWillEnterForeground];

  id v5 = [(SHSheetPresenter *)self mainViewController];
  [v5 reloadContent];
}

- (void)interactorDidUpdateSessionConfiguration:(id)a3
{
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "received configuration update", v5, 2u);
  }

  [(SHSheetPresenter *)self _updateContentView:0];
  if ([(SHSheetPresenter *)self didRequestInitialConfiguration])
  {
    [(SHSheetPresenter *)self setDidRequestInitialConfiguration:0];
    [(SHSheetPresenter *)self _completeInitialConfigurationUpdate];
  }
}

- (void)interactorDidUpdateObjectManipulationSupport:(id)a3
{
}

- (void)interactorDidUpdateHeaderMetadata:(id)a3
{
}

- (void)interactorDidUpdateCollaborationDetails:(id)a3
{
}

- (void)_updateContentView:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4
    || ([(SHSheetPresenter *)self secondaryViewController],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || ([(SHSheetPresenter *)self mainViewController],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([(SHSheetPresenter *)self useRemoteUIService]
      || ([(SHSheetPresenter *)self session],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [v5 configuration],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      id v7 = [(SHSheetPresenter *)self session];
      BOOL v8 = [v7 configuration];
      int v9 = [v8 shouldBlockPresentation];

      id v10 = [(SHSheetPresenter *)self router];
      char v11 = v10;
      if (v9)
      {
        [(SHSheetViewModel *)v10 presentPresentationBlockingViewController];
      }
      else
      {
        [(SHSheetViewModel *)v10 dismissPresentationBlockingViewControllerIfNeeded];

        id v12 = share_sheet_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138412290;
          id v18 = v4;
          _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "Update content view:%@", (uint8_t *)&v17, 0xCu);
        }

        os_signpost_id_t v13 = [SHSheetViewModel alloc];
        id v14 = [(SHSheetPresenter *)self session];
        char v11 = [(SHSheetViewModel *)v13 initWithSession:v14];

        id v15 = [(SHSheetPresenter *)self secondaryViewController];

        if (v4 == v15) {
          [(SHSheetViewModel *)v11 setCustomViewController:0];
        }
        [v4 updateWithViewModel:v11];
      }
    }
  }
  else
  {
    v16 = share_sheet_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A0AD8000, v16, OS_LOG_TYPE_DEFAULT, "No content view to update", (uint8_t *)&v17, 2u);
    }

    id v4 = 0;
  }
}

- (void)_presentAirDropCollaborationUnsupportedAlert
{
  SFLocalizedStringForKey();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = SFLocalizedStringForKey();
  id v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v3 preferredStyle:1];
  id v5 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v6 = SFLocalizedStringForKey();
  id v7 = [v5 actionWithTitle:v6 style:1 handler:&__block_literal_global_25];
  [v4 addAction:v7];

  BOOL v8 = [(SHSheetPresenter *)self router];
  [v8 presentAlertController:v4];
}

- (void)interactor:(id)a3 willPerformActivity:(id)a4
{
  id v4 = [(SHSheetPresenter *)self router];
  [v4 dismissUserDefaultsViewControllerAnimated:1];
}

- (void)interactor:(id)a3 didPerformActivityWithResult:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "did perform activity with result:%@", (uint8_t *)&v12, 0xCu);
  }

  [(SHSheetPresenter *)self setActivityResult:v5];
  id v7 = [v5 activity];
  BOOL v8 = [v7 activityType];
  int v9 = [v8 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

  BOOL v10 = [(SHSheetPresenter *)self _shouldCompleteAirdropActivity];
  if (v9 && (BOOL v11 = v10, ![(SHSheetPresenter *)self didRequestDismissal]))
  {
    if (v11) {
      [(SHSheetPresenter *)self _didCompleteActivityWithResult:v5];
    }
  }
  else
  {
    [(SHSheetPresenter *)self _dismiss];
  }
}

- (id)interactor:(id)a3 activityPresentationControllerForActivity:(id)a4
{
  id v4 = [(SHSheetPresenter *)self router];
  id v5 = [v4 activityPresentationController];

  return v5;
}

- (void)interactor:(id)a3 didPerformUserDefaultsActivityWithContext:(id)a4
{
  id v6 = +[SHSheetFactory createUserDefaultsViewControllerWithContext:a4 delegate:self];
  [(SHSheetPresenter *)self setUserDefaultsViewController:v6];
  id v5 = [(SHSheetPresenter *)self router];
  [v5 presentUserDefaultsViewController:v6];
}

- (void)interactor:(id)a3 didPerformAirdropViewActivityWithNoContentView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SHSheetPresenter *)self router];
  [v6 dismissUserDefaultsViewControllerAnimated:1];

  id v8 = +[SHSheetFactory createAirdropViewControllerWithNoContentView:v4 delegate:self];
  [(SHSheetPresenter *)self setAirdropViewController:v8];
  id v7 = [(SHSheetPresenter *)self router];
  [v7 presentAirdropViewController:v8];
}

- (void)interactorDidFailPerformActivityNotCollaborationEligible:(id)a3
{
  BOOL v4 = [a3 session];
  id v5 = [v4 collaborationItem];

  if ([v5 type])
  {
    id v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SHSheetPresenter interactorDidFailPerformActivityNotCollaborationEligible:]((uint64_t)v5, v6);
    }

    id v7 = &stru_1EF308000;
  }
  else
  {
    id v8 = [v5 fileURL];
    int v9 = [v8 URLByDeletingPathExtension];
    id v7 = [v9 lastPathComponent];
  }
  BOOL v10 = [(SHSheetPresenter *)self router];
  BOOL v11 = SHSheetCollaborativeItemNotSupportedAlertController(v7);
  [v10 presentAlertController:v11];
}

- (void)interactor:(id)a3 didUpdateAirDropTransferWithChange:(id)a4
{
  id v5 = a4;
  id v6 = [(SHSheetPresenter *)self interactor];
  id v7 = [v6 activityPerformer];

  id v8 = [v7 activity];
  int v9 = [v8 activityType];
  char v10 = [v9 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

  uint64_t v11 = [v5 state];
  int v12 = [v5 proxyIdentifier];

  if (!v12 && v11 == 7)
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "Collaborate via AirDrop is unsupported on iOS, using the Boop to Collaborate path instead", v16, 2u);
    }
    goto LABEL_19;
  }
  if (v7) {
    char v14 = v10;
  }
  else {
    char v14 = 0;
  }
  if ((v14 & 1) == 0)
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SHSheetPresenter interactor:didUpdateAirDropTransferWithChange:](v11, v7, v13);
    }
    goto LABEL_19;
  }
  if ((unint64_t)(v11 - 4) >= 3)
  {
    if (v11 != 2) {
      goto LABEL_17;
    }
    id v15 = [(SHSheetPresenter *)self airdropViewController];
    [(SHSheetPresenter *)self airDropViewControllerDidStartTransfer:v15];
  }
  else
  {
    [(SHSheetPresenter *)self _finishAirdropActivityPerformer:v7 withSuccess:1];
    if (v11 != 4) {
      goto LABEL_17;
    }
    id v15 = [(SHSheetPresenter *)self airdropViewController];
    [(SHSheetPresenter *)self airDropViewController:v15 didFinishTransferWithSuccess:1];
  }

LABEL_17:
  if (v12)
  {
    id v13 = [(SHSheetPresenter *)self mainViewController];
    [v13 didUpdateAirDropTransferWithChange:v5];
LABEL_19:
  }
}

- (id)interactor:(id)a3 linkMetadataForActivity:(id)a4
{
  id v5 = [(SHSheetPresenter *)self session];
  id v6 = [v5 activityItemsManager];
  char v7 = [v6 linkMetadataValuesNeedsUpdate];

  if ((v7 & 1) != 0
    || ([(SHSheetPresenter *)self mainViewController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 headerMetadata],
        int v9 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    char v10 = [(SHSheetPresenter *)self session];
    uint64_t v11 = [v10 metadataCollection];
    int v12 = [v11 metadatas];
    int v9 = [v12 firstObject];
  }
  return v9;
}

- (void)interactor:(id)a3 airDropViewServiceWillStartTransferToRecipient:(id)a4
{
  p_airdropViewController = &self->_airdropViewController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_airdropViewController);
  [(SHSheetPresenter *)self airDropViewServiceWillStartTransfer:WeakRetained toRecipient:v6];
}

- (void)interactor:(id)a3 didChangeMetadata:(id)a4
{
  id v5 = a4;
  id v6 = [(SHSheetPresenter *)self mainViewController];
  [v6 reloadMetadata:v5];

  id v7 = [(SHSheetPresenter *)self secondaryViewController];
  [v7 reloadMetadata:v5];
}

- (void)interactor:(id)a3 showingModeRestriction:(id)a4 continueHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v13 = [(SHSheetPresenter *)self router];
  int v9 = [(SHSheetPresenter *)self interactor];
  char v10 = [v9 session];
  uint64_t v11 = [v10 activityViewController];
  int v12 = SHSheetModeRestrictionAlertController(v8, v11, v7);

  [v13 presentAlertController:v12];
}

- (void)addParticipantsViewController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F9F6A0];
  id v6 = a4;
  id v7 = [v5 alloc];
  id v8 = [(SHSheetPresenter *)self collaborationItemIdentifier];
  id v9 = (id)[v7 initWithCollaborationItemIdentifier:v8 sharingURL:0 share:0 error:v6 mailResult:0];

  [(SHSheetPresenter *)self _didCompleteCollaborationSharingURLCreationWithResult:v9];
}

- (void)addParticipantsViewController:(id)a3 completedSharingWithShareURL:(id)a4 ckShare:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F9F6A0];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 alloc];
  uint64_t v11 = [(SHSheetPresenter *)self collaborationItemIdentifier];
  id v12 = (id)[v10 initWithCollaborationItemIdentifier:v11 sharingURL:v9 share:v8 error:0 mailResult:0];

  [(SHSheetPresenter *)self _didCompleteCollaborationSharingURLCreationWithResult:v12];
}

- (void)collaborationParticipantsViewController:(id)a3 didCreateURL:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SHSheetPresenter *)self router];
  [v9 dismissCollaborationParticipantsViewController];

  id v10 = objc_alloc(MEMORY[0x1E4F9F690]);
  uint64_t v11 = [v8 absoluteString];
  id v15 = (id)[v10 initWithSubject:0 body:v11 containerID:0 canEdit:0 allowOthersToInvite:0 error:v7];

  id v12 = objc_alloc(MEMORY[0x1E4F9F6A0]);
  id v13 = [(SHSheetPresenter *)self collaborationItemIdentifier];
  char v14 = (void *)[v12 initWithCollaborationItemIdentifier:v13 sharingURL:v8 share:0 error:v7 mailResult:v15];

  [(SHSheetPresenter *)self _didCompleteCollaborationSharingURLCreationWithResult:v14];
}

- (void)presentCollaborationParticipantsViewControllerForCloudSharingRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(SHSheetPresenter *)self session];
  id v9 = [v8 activityViewController];

  id v10 = [v9 collaborationDelegate];
  uint64_t v11 = [v10 activityViewController:v9 collaborationParticipantsViewControllerWithDelegate:self];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    char v14 = 0;
  }
  else
  {
    char v14 = +[SHSheetCollaborationParticipantsContext defaultContext];
    uint64_t v15 = +[SHSheetFactory createCollaborationParticipantsViewControllerWithContext:v14 request:v6 delegate:self];
    if (!v15)
    {
      int v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.sharesheet.addParticipantViewController" code:42 userInfo:0];
      id v18 = objc_alloc(MEMORY[0x1E4F9F6A0]);
      uint64_t v19 = [v6 collaborationItemIdentifier];
      v20 = (void *)[v18 initWithCollaborationItemIdentifier:v19 sharingURL:0 share:0 error:v17 mailResult:0];

      v7[2](v7, v20);
      goto LABEL_6;
    }
    id v13 = (id)v15;
  }
  id location = 0;
  objc_initWeak(&location, self);
  v16 = [(SHSheetPresenter *)self router];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __107__SHSheetPresenter_presentCollaborationParticipantsViewControllerForCloudSharingRequest_completionHandler___block_invoke;
  v24 = &unk_1E5A21998;
  objc_copyWeak(&v25, &location);
  [v16 presentCollaborationParticipantsViewController:v13 dismissalHandler:&v21];

  -[SHSheetPresenter setCollaborationParticipantsViewController:](self, "setCollaborationParticipantsViewController:", v13, v21, v22, v23, v24);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

LABEL_6:
}

void __107__SHSheetPresenter_presentCollaborationParticipantsViewControllerForCloudSharingRequest_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained collaborationItemIdentifier];

  if (v1)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F9F6A0]);
    id v3 = [WeakRetained collaborationItemIdentifier];
    BOOL v4 = (void *)[v2 initWithCollaborationItemIdentifier:v3 sharingURL:0 share:0 error:0 mailResult:0];

    [WeakRetained _didCompleteCollaborationSharingURLCreationWithResult:v4];
  }
}

- (id)collaborationParticipantsPresenter
{
  id v3 = [(SHSheetPresenter *)self session];
  BOOL v4 = [v3 activityViewController];

  id v5 = [v4 collaborationDelegate];
  id v6 = [v5 activityViewController:v4 collaborationParticipantsViewControllerWithDelegate:self];
  id v7 = [(SHSheetPresenter *)self session];
  if [v7 useRemoteUIService] && (_ShareSheetPlatformWantsRemoteOptions())
  {
    id v8 = [(SHSheetPresenter *)self session];
    id v9 = [v8 remoteScene];
    int v10 = [v9 conformsToProtocol:&unk_1EF358B28];

    if (v10 && !v6)
    {
      uint64_t v11 = [(SHSheetPresenter *)self session];
      id v12 = [v11 remoteScene];

      goto LABEL_8;
    }
  }
  else
  {
  }
  id v12 = self;
LABEL_8:

  return v12;
}

- (void)_didCompleteCollaborationSharingURLCreationWithResult:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetPresenter *)self collaborationCreateSharingURLCompletionHandler];
  [(SHSheetPresenter *)self setCollaborationCreateSharingURLCompletionHandler:0];
  [(SHSheetPresenter *)self setCollaborationItemIdentifier:0];
  [(SHSheetPresenter *)self setCollaborationParticipantsViewController:0];
  v5[2](v5, v4);
}

- (void)interactor:(id)a3 createSharingURLWithParticipantsForCollaborationRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SHSheetPresenter *)self collaborationParticipantsPresenter];
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __105__SHSheetPresenter_interactor_createSharingURLWithParticipantsForCollaborationRequest_completionHandler___block_invoke;
  v16 = &unk_1E5A22A98;
  objc_copyWeak(&v17, &location);
  [v11 presentCollaborationParticipantsViewControllerForCloudSharingRequest:v9 completionHandler:&v13];
  -[SHSheetPresenter setCollaborationCreateSharingURLCompletionHandler:](self, "setCollaborationCreateSharingURLCompletionHandler:", v10, v13, v14, v15, v16);
  id v12 = [v9 collaborationItemIdentifier];
  [(SHSheetPresenter *)self setCollaborationItemIdentifier:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __105__SHSheetPresenter_interactor_createSharingURLWithParticipantsForCollaborationRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didCompleteCollaborationSharingURLCreationWithResult:v3];
}

- (void)interactor:(id)a3 creatingCollaborationForActivity:(id)a4
{
  id v11 = a4;
  id v5 = [v11 activityType];
  if ([v5 isEqual:@"com.apple.UIKit.activity.Mail"])
  {
  }
  else
  {
    id v6 = [v11 activityType];
    int v7 = [v6 isEqual:@"com.apple.UIKit.activity.CollaborationInviteWithLink"];

    if (!v7) {
      goto LABEL_5;
    }
  }
  id v8 = _ShareSheetBundle();
  id v9 = [v8 localizedStringForKey:@"WAITING_TEXT" value:@"Waiting…" table:@"Localizable"];

  id v10 = [(SHSheetPresenter *)self mainViewController];
  [v10 startPulsingActivity:v11 localizedTitle:v9];

LABEL_5:
}

- (void)interactor:(id)a3 didCreateCollaborationForActivity:(id)a4
{
  id v9 = a4;
  id v5 = [v9 activityType];
  if ([v5 isEqual:@"com.apple.UIKit.activity.Mail"])
  {
  }
  else
  {
    id v6 = [v9 activityType];
    int v7 = [v6 isEqual:@"com.apple.UIKit.activity.CollaborationInviteWithLink"];

    if (!v7) {
      goto LABEL_5;
    }
  }
  id v8 = [(SHSheetPresenter *)self mainViewController];
  [v8 stopPulsingActivity:v9];

LABEL_5:
}

- (void)interactor:(id)a3 didFailCreatingCollaborationForActivity:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v23 = 0;
  id v24 = 0;
  [MEMORY[0x1E4F9F6B8] getFailureTitle:&v24 message:&v23 error:v10];
  id v11 = v24;
  id v12 = v23;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v13 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v12 preferredStyle:1];
  uint64_t v14 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v15 = SFLocalizedStringForKey();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__SHSheetPresenter_interactor_didFailCreatingCollaborationForActivity_error___block_invoke;
  v19[3] = &unk_1E5A22AC0;
  id v16 = v10;
  id v20 = v16;
  objc_copyWeak(&v21, &location);
  id v17 = [v14 actionWithTitle:v15 style:1 handler:v19];
  [v13 addAction:v17];

  id v18 = [(SHSheetPresenter *)self router];
  [v18 presentAlertController:v13];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __77__SHSheetPresenter_interactor_didFailCreatingCollaborationForActivity_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v5 = 0;
  if ([MEMORY[0x1E4F9F6B8] isOplockError:v2 updatedShare:&v5]) {
    BOOL v3 = v5 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained dismiss];
  }
}

- (void)interactor:(id)a3 didCancelCollaborationForActivity:(id)a4
{
  id v9 = a4;
  uint64_t v5 = [v9 activityType];
  if ([v5 isEqual:@"com.apple.UIKit.activity.Mail"])
  {
  }
  else
  {
    id v6 = [v9 activityType];
    int v7 = [v6 isEqual:@"com.apple.UIKit.activity.CollaborationInviteWithLink"];

    if (!v7) {
      goto LABEL_5;
    }
  }
  id v8 = [(SHSheetPresenter *)self mainViewController];
  [v8 stopPulsingActivity:v9];

LABEL_5:
}

- (void)interactor:(id)a3 canShareFolderContainingExistingSharedItemsWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = _ShareSheetBundle();
  int v7 = [v6 localizedStringForKey:@"FOLDER_SHARED_SUBITEMS_TITLE" value:@"Are you sure you want to share this folder?" table:@"Localizable"];

  id v8 = _ShareSheetBundle();
  id v9 = [v8 localizedStringForKey:@"FOLDER_SHARED_SUBITEMS_MESSAGE", @"This folder includes items that are already shared. If you share this folder, only people you add to it will be able to access items inside it.", @"Localizable" value table];

  id v10 = _ShareSheetBundle();
  id v11 = [v10 localizedStringForKey:@"FOLDER_SHARED_SUBITEMS_SHARE_ANYWAY" value:@"Share Anyway" table:@"Localizable"];

  id v12 = _ShareSheetBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];

  uint64_t v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v9 preferredStyle:1];
  uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __96__SHSheetPresenter_interactor_canShareFolderContainingExistingSharedItemsWithCompletionHandler___block_invoke;
  v27[3] = &unk_1E5A21648;
  id v16 = v5;
  id v28 = v16;
  id v17 = [v15 actionWithTitle:v11 style:0 handler:v27];
  [v14 addAction:v17];

  id v18 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __96__SHSheetPresenter_interactor_canShareFolderContainingExistingSharedItemsWithCompletionHandler___block_invoke_2;
  id v25 = &unk_1E5A21648;
  id v26 = v16;
  id v19 = v16;
  id v20 = [v18 actionWithTitle:v13 style:1 handler:&v22];
  objc_msgSend(v14, "addAction:", v20, v22, v23, v24, v25);

  id v21 = [(SHSheetPresenter *)self mainViewController];
  [v21 presentViewController:v14 animated:1 completion:0];
}

uint64_t __96__SHSheetPresenter_interactor_canShareFolderContainingExistingSharedItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__SHSheetPresenter_interactor_canShareFolderContainingExistingSharedItemsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)interactor:(id)a3 canManageShareForDocumentInSharedFolderWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = _ShareSheetBundle();
  int v7 = [v6 localizedStringForKey:@"DOCUMENT_IN_SHARED_FOLDER_TITLE" value:@"Add People to Shared Folder" table:@"Localizable"];

  id v8 = _ShareSheetBundle();
  id v9 = [v8 localizedStringForKey:@"DOCUMENT_IN_SHARED_FOLDER_MESSAGE" value:@"Add new participants to the shared folder to collaborate on this document." table:@"Localizable"];

  id v10 = _ShareSheetBundle();
  id v11 = [v10 localizedStringForKey:@"Manage Shared Folder" value:@"Manage Shared Folder" table:@"Localizable"];

  id v12 = _ShareSheetBundle();
  uint64_t v13 = [v12 localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];

  uint64_t v14 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v9 preferredStyle:1];
  uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__SHSheetPresenter_interactor_canManageShareForDocumentInSharedFolderWithCompletionHandler___block_invoke;
  v27[3] = &unk_1E5A21648;
  id v16 = v5;
  id v28 = v16;
  id v17 = [v15 actionWithTitle:v11 style:0 handler:v27];
  [v14 addAction:v17];

  id v18 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __92__SHSheetPresenter_interactor_canManageShareForDocumentInSharedFolderWithCompletionHandler___block_invoke_2;
  id v25 = &unk_1E5A21648;
  id v26 = v16;
  id v19 = v16;
  id v20 = [v18 actionWithTitle:v13 style:1 handler:&v22];
  objc_msgSend(v14, "addAction:", v20, v22, v23, v24, v25);

  id v21 = [(SHSheetPresenter *)self mainViewController];
  [v21 presentViewController:v14 animated:1 completion:0];
}

uint64_t __92__SHSheetPresenter_interactor_canManageShareForDocumentInSharedFolderWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__SHSheetPresenter_interactor_canManageShareForDocumentInSharedFolderWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performPeopleSuggestionProxy:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v12 = 138412290;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Perform people suggestion:%@", (uint8_t *)&v12, 0xCu);
  }
  if ([v4 isDisabled])
  {
    [(SHSheetPresenter *)self _showScreenTimeRestrictedAlert];
  }
  else
  {
    int v7 = [v4 peopleSuggestion];
    id v8 = [(SHSheetPresenter *)self interactor];
    id v9 = [v8 session];
    [v9 setCurrentPeopleSuggestion:v7];

    id v10 = [(SHSheetPresenter *)self interactor];
    id v11 = [v4 identifier];
    [v10 performPersonSuggestionWithIdentifier:v11];
  }
}

- (void)removePeopleSuggestionProxy:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Remove people suggestion:%@", (uint8_t *)&v9, 0xCu);
  }
  int v7 = [(SHSheetPresenter *)self interactor];
  id v8 = [v4 identifier];
  [v7 removePersonSuggestionWithIdentifier:v8];
}

- (void)performShareActivityProxy:(id)a3
{
}

- (void)performShareActivityProxy:(id)a3 activityIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 identifier];
    int v16 = 138412546;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "Perform share activity:%@ activityIdentifier:%@", (uint8_t *)&v16, 0x16u);
  }
  if ([v6 isDisabled])
  {
    [(SHSheetPresenter *)self _showScreenTimeRestrictedAlert];
  }
  else
  {
    if (!v7)
    {
      id v7 = [v6 identifier];
    }
    id v10 = [(SHSheetPresenter *)self interactor];
    [v10 performShareActivityWithIdentifier:v7];

    uint64_t v11 = [(SHSheetPresenter *)self interactor];
    int v12 = [v11 session];
    uint64_t v13 = [v12 activitiesManager];
    uint64_t v14 = [v13 activityForIdentifier:v7];

    uint64_t v15 = [v14 activityType];

    if (v15 == @"com.apple.UIKit.activity.Share") {
      [(SHSheetPresenter *)self _expandSharingContentView];
    }
  }
}

- (void)performActionActivityProxy:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v15 = 138412290;
    int v16 = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Perform action activity:%@", (uint8_t *)&v15, 0xCu);
  }
  if ([v4 isDisabled])
  {
    [(SHSheetPresenter *)self _showScreenTimeRestrictedAlert];
  }
  else
  {
    id v7 = [(SHSheetPresenter *)self interactor];
    id v8 = [v4 identifier];
    [v7 performActionActivityWithIdentifier:v8];

    int v9 = [(SHSheetPresenter *)self interactor];
    id v10 = [v9 session];
    uint64_t v11 = [v10 activitiesManager];
    int v12 = [v4 identifier];
    uint64_t v13 = [v11 activityForIdentifier:v12];

    uint64_t v14 = [v13 activityType];

    if (v14 == @"com.apple.UIKit.activity.Share") {
      [(SHSheetPresenter *)self _expandSharingContentView];
    }
  }
}

- (void)didLongPressShareActivityWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Long press activity", v7, 2u);
  }

  id v6 = [(SHSheetPresenter *)self interactor];
  [v6 longPressShareActivityWithIdentifier:v4];
}

- (void)handlePeopleSuggestion:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Handle people suggestion:%@", (uint8_t *)&v7, 0xCu);
  }

  if ([v4 isRestricted])
  {
    [(SHSheetPresenter *)self _showScreenTimeRestrictedAlert];
  }
  else
  {
    id v6 = [(SHSheetPresenter *)self interactor];
    [v6 performPeopleSuggestion:v4];
  }
}

- (void)handleInfoSuggestionPress:(id)a3
{
  id v4 = a3;
  id v5 = _ShareSheetBundle();
  id v10 = [v5 localizedStringForKey:@"RESTRICTED_ALERT_SCREEN_TIME_DISMISS_BUTTON_TITLE" value:@"Dismiss" table:@"Localizable"];

  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:0 preferredStyle:1];

  int v7 = [MEMORY[0x1E4FB1410] actionWithTitle:v10 style:1 handler:0];
  [v6 addAction:v7];

  id v8 = v6;
  uint64_t v9 = [(SHSheetPresenter *)self router];
  [v9 presentAlertController:v8];
}

- (void)handleActivity:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Handle activity:%@", (uint8_t *)&v16, 0xCu);
  }

  id v6 = [(SHSheetPresenter *)self session];
  int v7 = [v6 configuration];
  id v8 = [v7 restrictedActivityTypes];

  uint64_t v9 = [v4 activityType];
  LODWORD(v7) = [v8 containsObject:v9];

  if (v7)
  {
    [(SHSheetPresenter *)self _showScreenTimeRestrictedAlert];
  }
  else
  {
    id v10 = [v4 activityType];
    int v11 = [v10 isEqual:@"com.apple.UIKit.activity.AirDrop"];

    int v12 = [(SHSheetPresenter *)self interactor];
    uint64_t v13 = v12;
    if (v11)
    {
      [(SHSheetPresenter *)self interactor:v12 didPerformAirdropViewActivityWithNoContentView:0];
    }
    else
    {
      uint64_t v14 = [v12 session];
      int v15 = [v14 activityViewController];
      [v15 _performActivity:v4];
    }
  }
}

- (void)handleOptions
{
  BOOL v3 = [(SHSheetPresenter *)self session];
  int v4 = [v3 supportsCollaboration];

  if (v4)
  {
    [(SHSheetPresenter *)self handleCollaborationOptions];
  }
  else
  {
    id v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Handle options", v13, 2u);
    }

    id v6 = [(SHSheetPresenter *)self session];
    int v7 = [v6 customOptionsViewController];

    if (!v7)
    {
      id v8 = [SHSheetOptionsViewContext alloc];
      uint64_t v9 = [(SHSheetPresenter *)self session];
      id v10 = [v9 customizationGroups];
      int v11 = [(SHSheetOptionsViewContext *)v8 initWithCustomizationGroups:v10];

      int v7 = +[SHSheetFactory createOptionsViewControllerWithContext:v11 delegate:self];
    }
    [(SHSheetPresenter *)self setOptionsViewController:v7];
    int v12 = [(SHSheetPresenter *)self router];
    [v12 presentOptionsViewController:v7 dismissalHandler:0];
  }
}

- (void)handleCollaborationOptions
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Collaboration Options View Controller is already presented.", v1, 2u);
}

uint64_t __46__SHSheetPresenter_handleCollaborationOptions__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setShareOptions:a2];
}

- (void)didSelectCollaborativeAction
{
  id v2 = [(SHSheetPresenter *)self interactor];
  [v2 setWantsCollaborativeSession:1];
}

- (void)didSelectSendCopyAction
{
  id v2 = [(SHSheetPresenter *)self interactor];
  [v2 setWantsCollaborativeSession:0];
}

- (void)handleCustomHeaderButton
{
  BOOL v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Custom header button tapped", v9, 2u);
  }

  int v4 = [(SHSheetPresenter *)self interactor];
  id v5 = [v4 session];
  int v6 = [v5 showSharePlayProminently];

  if (v6)
  {
    int v7 = [(SHSheetPresenter *)self interactor];
    id v8 = objc_alloc_init(UISharePlayActivity);
    [v7 performActivity:v8];
  }
}

- (void)handleClose
{
  BOOL v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Handle close", v4, 2u);
  }

  [(SHSheetPresenter *)self dismiss];
}

- (void)handleNext
{
  BOOL v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Present secondary view", v7, 2u);
  }

  int v4 = [(SHSheetPresenter *)self session];
  id v5 = +[SHSheetFactory createContentViewControllerWithSession:v4 presenter:self];

  [(SHSheetPresenter *)self setSecondaryViewController:v5];
  int v6 = [(SHSheetPresenter *)self router];
  [v6 presentSecondaryViewController:v5];

  [(SHSheetPresenter *)self _updateContentView:v5];
}

- (void)handleActionsEdit
{
  BOOL v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Handle actions edit", v5, 2u);
  }

  int v4 = [(SHSheetPresenter *)self interactor];
  [v4 performEditAction];
}

- (id)customTitleForActivityType:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetPresenter *)self interactor];
  int v6 = [v5 session];
  int v7 = [v6 activityViewController];

  id v8 = [v7 _titleForActivity:v4];

  return v8;
}

- (void)_expandSharingContentView
{
  BOOL v3 = [(SHSheetPresenter *)self session];
  [v3 setDidExpand:1];

  id v4 = [(SHSheetPresenter *)self session];
  id v6 = [v4 activityViewController];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"UIActivityViewControllerSharingExpandedNotification" object:v6 userInfo:0];

  [(SHSheetPresenter *)self _updateContentView:0];
}

- (void)_showScreenTimeRestrictedAlert
{
  id v4 = +[SHSheetFactory createScreenTimeAlertViewController];
  BOOL v3 = [(SHSheetPresenter *)self router];
  [v3 presentAlertController:v4];
}

- (void)userDefaultsViewController:(id)a3 didToggleActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  id v7 = a4;
  id v8 = [(SHSheetPresenter *)self interactor];
  [v8 toggleUserDefaultsActivityWithIdentifier:v7 activityCategory:a5];
}

- (void)userDefaultsViewController:(id)a3 didFavoriteActivity:(BOOL)a4 withIdentifier:(id)a5 activityCategory:(int64_t)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = [(SHSheetPresenter *)self interactor];
  [v10 favoriteUserDefaultsActivity:v7 withIdentifier:v9 activityCategory:a6];
}

- (void)userDefaultsViewController:(id)a3 didUpdateFavoritesProxies:(id)a4 activityCategory:(int64_t)a5
{
  id v7 = a4;
  id v8 = [(SHSheetPresenter *)self interactor];
  [v8 updateUserDefaultsFavorites:v7 activityCategory:a5];
}

- (void)userDefaultsViewController:(id)a3 didSelectActivityWithIdentifier:(id)a4 activityCategory:(int64_t)a5 disabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  if (v6)
  {
    [(SHSheetPresenter *)self _showScreenTimeRestrictedAlert];
  }
  else
  {
    id v9 = [(SHSheetPresenter *)self interactor];
    [v9 performUserDefaultsActivityWithIdentifier:v10 activityCategory:a5];
  }
}

- (void)airDropViewControllerDidDismiss:(id)a3
{
  id v4 = [(SHSheetPresenter *)self interactor];
  id v5 = [v4 activityPerformer];
  int v6 = [v5 isRunning];

  if (v6)
  {
    id v10 = [(SHSheetPresenter *)self interactor];
    id v7 = [v10 activityPerformer];
    [(SHSheetPresenter *)self _finishAirdropActivityPerformer:v7 withSuccess:1];
  }
  else
  {
    id v8 = [(SHSheetPresenter *)self session];
    id v9 = [v8 activitiesManager];
    id v10 = [v9 activityForActivityType:@"com.apple.UIKit.activity.AirDrop"];

    id v7 = [[SHSheetActivityPerformerResult alloc] initWithActivity:v10 completedState:5 returnedItems:0 error:0];
    [(SHSheetPresenter *)self setActivityResult:v7];
    if ([(SHSheetPresenter *)self _shouldCompleteAirdropActivity]) {
      [(SHSheetPresenter *)self _didCompleteActivityWithResult:v7];
    }
  }
}

- (void)airDropViewServiceWillStartTransfer:(id)a3 toRecipient:(id)a4
{
  id v12 = a4;
  id v5 = [(SHSheetPresenter *)self session];
  int v6 = [v5 activityViewController];

  id v7 = [v6 airDropDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_7;
    }
    id v8 = [v12 displayName];
    id v9 = [v12 contactIdentifier];
    [v7 activityViewController:v6 willStartAirdropTransferToRecipient:v8 contactIdentifier:v9];

    goto LABEL_6;
  }
  id v8 = [v12 contactIdentifier];
  if (v8
    || ([v12 displayName],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char IsSuspicious = SFAirDropDeviceNameIsSuspicious(),
        v10,
        (IsSuspicious & 1) == 0)
    && ([v12 displayName], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v7 activityViewController:v6 willStartAirdropTransferToRecipient:v8];
LABEL_6:
  }
LABEL_7:
}

- (void)airDropViewControllerDidStartTransfer:(id)a3
{
  BOOL v3 = [(SHSheetPresenter *)self session];
  id v5 = [v3 activityViewController];

  id v4 = [v5 airDropDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 activityViewControllerWillStartAirdropTransfer:v5];
  }
}

- (void)airDropViewController:(id)a3 didFinishTransferWithSuccess:(BOOL)a4
{
  if (a4)
  {
    id v4 = [(SHSheetPresenter *)self session];
    id v6 = [v4 activityViewController];

    id v5 = [v6 airDropDelegate];
    if (objc_opt_respondsToSelector()) {
      [v5 activityViewControllerDidFinishAirdropTransfer:v6];
    }
  }
}

- (void)airDropViewController:(id)a3 requestSharedItemsWithDataRequest:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(SHSheetPresenter *)self interactor];
  int v11 = [v10 extension];

  [v12 performActivityWithRequest:v9 forExtension:v11 completion:v8];
}

- (void)airDropViewController:(id)a3 requestSendingAppBundleIdentifierWithCompletionHandler:(id)a4
{
  memset(v6, 0, sizeof(v6));
  id v4 = (void (**)(id, void *))a4;
  _SharingUIAuditTokenForCurrentProcess((uint64_t)v6);
  id v5 = _ShareSheetBundleIDFromAuditToken();
  v4[2](v4, v5);
}

- (void)_finishAirdropActivityPerformer:(id)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v5 = [v8 activity];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 activityType];
    [v7 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

    [v8 finishWithSuccess:v4];
  }
}

- (BOOL)_shouldCompleteAirdropActivity
{
  id v2 = [(SHSheetPresenter *)self session];
  char v3 = [v2 isAirdropOnly];

  return v3;
}

- (void)requestRefreshedCustomizationGroupForObjectManipulationViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SHSheetPresenter *)self session];
  id v6 = [v5 customizationGroups];

  [v4 updateWithCustomizationGroups:v6];
}

- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(SHSheetPresenter *)self activityViewControllerIsPresenting])
  {
    id location = 0;
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__SHSheetPresenter_runScrollingTestWithName_type_completionHandler___block_invoke;
    v13[3] = &unk_1E5A22B10;
    objc_copyWeak(v16, &location);
    id v14 = v8;
    v16[1] = (id)a4;
    id v15 = v9;
    [(SHSheetPresenter *)self setPresentationDelayedTestingBlock:v13];

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = [(SHSheetPresenter *)self mainViewController];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(SHSheetPresenter *)self mainViewController];
      [v12 runScrollingTestWithName:v8 type:a4 completionHandler:v9];
    }
  }
}

void __68__SHSheetPresenter_runScrollingTestWithName_type_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained runScrollingTestWithName:*(void *)(a1 + 32) type:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 40)];
}

- (SHSheetPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHSheetRouter)router
{
  return self->_router;
}

- (SHSheetInteractor)interactor
{
  return self->_interactor;
}

- (BOOL)didRequestInitialConfiguration
{
  return self->_didRequestInitialConfiguration;
}

- (void)setDidRequestInitialConfiguration:(BOOL)a3
{
  self->_didRequestInitialConfiguration = a3;
}

- (BOOL)didReceiveInitialConfiguration
{
  return self->_didReceiveInitialConfiguration;
}

- (void)setDidReceiveInitialConfiguration:(BOOL)a3
{
  self->_didReceiveInitialConfiguration = a3;
}

- (BOOL)didRequestDismissal
{
  return self->_didRequestDismissal;
}

- (void)setDidRequestDismissal:(BOOL)a3
{
  self->_didRequestDismissal = a3;
}

- (BOOL)isReportingActivityResult
{
  return self->_isReportingActivityResult;
}

- (void)setIsReportingActivityResult:(BOOL)a3
{
  self->_isReportingActivityResult = a3;
}

- (BOOL)isPresentingNonUIShareSheet
{
  return self->_isPresentingNonUIShareSheet;
}

- (void)setIsPresentingNonUIShareSheet:(BOOL)a3
{
  self->_isPresentingNonUIShareSheet = a3;
}

- (SHSheetActivityPerformerResult)activityResult
{
  return self->_activityResult;
}

- (void)setActivityResult:(id)a3
{
}

- (BOOL)activityViewControllerIsPresenting
{
  return self->_activityViewControllerIsPresenting;
}

- (void)setActivityViewControllerIsPresenting:(BOOL)a3
{
  self->_activityViewControllerIsPresenting = a3;
}

- (BOOL)activityViewControllerPresentationDidBegin
{
  return self->_activityViewControllerPresentationDidBegin;
}

- (void)setActivityViewControllerPresentationDidBegin:(BOOL)a3
{
  self->_activityViewControllerPresentationDidBegin = a3;
}

- (BOOL)activityViewControllerIsEmbedded
{
  return self->_activityViewControllerIsEmbedded;
}

- (void)setActivityViewControllerIsEmbedded:(BOOL)a3
{
  self->_activityViewControllerIsEmbedded = a3;
}

- (SHSheetContentView)mainViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainViewController);
  return (SHSheetContentView *)WeakRetained;
}

- (void)setMainViewController:(id)a3
{
}

- (SHSheetContentView)secondaryViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondaryViewController);
  return (SHSheetContentView *)WeakRetained;
}

- (void)setSecondaryViewController:(id)a3
{
}

- (SFAirDropViewController)airdropViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_airdropViewController);
  return (SFAirDropViewController *)WeakRetained;
}

- (void)setAirdropViewController:(id)a3
{
}

- (_UIActivityUserDefaultsViewController)userDefaultsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userDefaultsViewController);
  return (_UIActivityUserDefaultsViewController *)WeakRetained;
}

- (void)setUserDefaultsViewController:(id)a3
{
}

- (UIViewController)optionsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_optionsViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setOptionsViewController:(id)a3
{
}

- (UIViewController)collaborationOptionsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaborationOptionsViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setCollaborationOptionsViewController:(id)a3
{
}

- (UIViewController)collaborationParticipantsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaborationParticipantsViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setCollaborationParticipantsViewController:(id)a3
{
}

- (NSUUID)collaborationItemIdentifier
{
  return self->_collaborationItemIdentifier;
}

- (void)setCollaborationItemIdentifier:(id)a3
{
}

- (id)collaborationCreateSharingURLCompletionHandler
{
  return self->_collaborationCreateSharingURLCompletionHandler;
}

- (void)setCollaborationCreateSharingURLCompletionHandler:(id)a3
{
}

- (id)presentationDelayedTestingBlock
{
  return self->_presentationDelayedTestingBlock;
}

- (void)setPresentationDelayedTestingBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationDelayedTestingBlock, 0);
  objc_storeStrong(&self->_collaborationCreateSharingURLCompletionHandler, 0);
  objc_storeStrong((id *)&self->_collaborationItemIdentifier, 0);
  objc_destroyWeak((id *)&self->_collaborationParticipantsViewController);
  objc_destroyWeak((id *)&self->_collaborationOptionsViewController);
  objc_destroyWeak((id *)&self->_optionsViewController);
  objc_destroyWeak((id *)&self->_userDefaultsViewController);
  objc_destroyWeak((id *)&self->_airdropViewController);
  objc_destroyWeak((id *)&self->_secondaryViewController);
  objc_destroyWeak((id *)&self->_mainViewController);
  objc_storeStrong((id *)&self->_activityResult, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_router, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithRouter:(os_log_t)log interactor:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_DEBUG, "New presenter with router:%@ interactor:%@", (uint8_t *)&v3, 0x16u);
}

- (void)updateWithContext:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "update requested after selecting an activity. skipping.", v1, 2u);
}

- (void)interactorDidFailPerformActivityNotCollaborationEligible:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "Current collaboration item is not file URL: %@", (uint8_t *)&v2, 0xCu);
}

- (void)interactor:(NSObject *)a3 didUpdateAirDropTransferWithChange:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  __int16 v5 = SFAirDropTransferChangeStateDescription();
  uint64_t v6 = [a2 activity];
  int v7 = 138412546;
  id v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_ERROR, "did receive airdrop transfer update:%@ for no active airdrop activity:%@", (uint8_t *)&v7, 0x16u);
}

@end