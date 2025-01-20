@interface SBSystemNotesManager
- (BOOL)_handleCreateNoteRequestWithMode:(int64_t)a3 presentationSource:(unint64_t)a4;
- (BOOL)_handleCreateNoteRequestWithPresentationContext:(id)a3 error:(id *)a4;
- (BOOL)interactionManager:(id)a3 requestsPresentationWithContext:(id)a4;
- (SBSystemNotesManager)initWithControllerCoordinator:(id)a3 workspace:(id)a4 sceneManager:(id)a5 keyboardArbiterManager:(id)a6 fbSceneManager:(id)a7 sceneDeactivationManager:(id)a8 keyboardSuppressionManager:(id)a9 keyboardDismissalManager:(id)a10 applicationController:(id)a11 systemGestureManager:(id)a12 systemPointerInteractionManager:(id)a13 idleTimerCoordinator:(id)a14 managedProfileConnection:(id)a15;
- (id)_createContentViewControllerForPresentationContext:(id)a3 error:(id *)a4;
- (id)_presentedContainerViewController;
- (id)_presentedNotesContentViewController;
- (id)_sceneBundleIdentifierForNewConfiguration;
- (id)_sceneHandleForApplication:(id)a3 sceneSpecification:(id)a4;
- (id)currentContentViewLayoutSettingsForInteractionManager:(id)a3;
- (id)interactionManager:(id)a3 requestsStashAssertionForReason:(id)a4;
- (id)launchApplicationIdentityForInteractionManager:(id)a3;
- (id)launchBundleIDForInteractionManager:(id)a3;
- (id)presentedPIPContentViewControllerForInteractionManager:(id)a3;
- (id)server:(id)a3 targetForNewClientConnection:(id)a4;
- (int64_t)_currentPresentationMode;
- (void)_addContentViewControllerToPIPHierarchy:(id)a3 contentViewLayoutSettings:(id)a4 animated:(BOOL)a5;
- (void)_dismissNotesWithReason:(unint64_t)a3;
- (void)_dismissNotesWithReason:(unint64_t)a3 animated:(BOOL)a4;
- (void)_reloadLaunchBundleID;
- (void)_setPresentedConnection:(id)a3;
- (void)_tearDownContainerViewControllerForSceneHandle:(id)a3;
- (void)activateConfiguration:(id)a3;
- (void)contentViewController:(id)a3 didChangeToPresentationMode:(int64_t)a4;
- (void)contentViewController:(id)a3 didReceiveScreenshotRequestForDisplays:(id)a4 completion:(id)a5;
- (void)contentViewControllerDidReceiveTapToExpand:(id)a3;
- (void)contentViewControllerWantsDismissal:(id)a3 forReason:(unint64_t)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)interactionManager:(id)a3 requestsNotesDismissalForSource:(unint64_t)a4 animated:(BOOL)a5;
- (void)interactionManager:(id)a3 requestsStartSuppressingKeyboardForReason:(id)a4;
- (void)interactionManager:(id)a3 requestsStopSuppressingKeyboardForReason:(id)a4;
- (void)interactionManager:(id)a3 requestsUpdatePresentationMode:(int64_t)a4;
- (void)presentWithConfiguration:(id)a3 completion:(id)a4;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)server:(id)a3 connectionDidInvalidate:(id)a4;
- (void)showOrHideForKeyCommand:(id)a3;
@end

@implementation SBSystemNotesManager

- (SBSystemNotesManager)initWithControllerCoordinator:(id)a3 workspace:(id)a4 sceneManager:(id)a5 keyboardArbiterManager:(id)a6 fbSceneManager:(id)a7 sceneDeactivationManager:(id)a8 keyboardSuppressionManager:(id)a9 keyboardDismissalManager:(id)a10 applicationController:(id)a11 systemGestureManager:(id)a12 systemPointerInteractionManager:(id)a13 idleTimerCoordinator:(id)a14 managedProfileConnection:(id)a15
{
  id v60 = a3;
  id v51 = a4;
  id v20 = a4;
  id v59 = a5;
  id v52 = a6;
  id v21 = a6;
  id v22 = a7;
  id v58 = v21;
  id v57 = a7;
  id v56 = a8;
  id v55 = a9;
  id v54 = a10;
  id v53 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  id v61 = a15;
  v69.receiver = self;
  v69.super_class = (Class)SBSystemNotesManager;
  v26 = [(SBSystemNotesManager *)&v69 init];
  if (v26)
  {
    v27 = objc_alloc_init(SBSystemNotesPresentationRequestServer);
    systemNotesRequestServer = v26->_systemNotesRequestServer;
    v26->_systemNotesRequestServer = v27;

    [(SBSystemNotesPresentationRequestServer *)v26->_systemNotesRequestServer setDelegate:v26];
    if (SBIsSystemNotesSupported())
    {
      uint64_t v29 = +[SBSystemNotesSettingsDomain rootSettings];
      pipSettings = v26->_pipSettings;
      v26->_pipSettings = (SBSystemNotesSettings *)v29;

      [(PTSettings *)v26->_pipSettings addKeyPathObserver:v26];
      [(SBSystemNotesManager *)v26 _reloadLaunchBundleID];
      uint64_t v31 = [MEMORY[0x1E4FA7C20] specification];
      sceneSpecification = v26->_sceneSpecification;
      v26->_sceneSpecification = (FBSSceneSpecification *)v31;

      objc_storeStrong((id *)&v26->_sceneManager, a5);
      objc_storeStrong((id *)&v26->_fbSceneManager, v22);
      objc_storeStrong((id *)&v26->_applicationController, a11);
      objc_storeStrong((id *)&v26->_managedProfileConnection, a15);
      [(MCProfileConnection *)v26->_managedProfileConnection registerObserver:v26];
      objc_storeStrong((id *)&v26->_workspace, v51);
      objc_storeStrong((id *)&v26->_keyboardArbiterManager, v52);
      objc_storeStrong((id *)&v26->_sceneDeactivationManager, a8);
      objc_storeStrong((id *)&v26->_keyboardSuppressionManager, a9);
      objc_storeStrong((id *)&v26->_keyboardDismissalManager, a10);
      v33 = [[SBPIPSceneContentAdapter alloc] initWithPIPContentType:1 sceneManager:v26->_sceneManager];
      sceneContentAdapter = v26->_sceneContentAdapter;
      v26->_sceneContentAdapter = v33;

      id v35 = v23;
      v36 = [SBPIPController alloc];
      double v37 = *MEMORY[0x1E4F43F20] + 5.0 + 10.0;
      [(SBSystemNotesSettings *)v26->_pipSettings interactionSettings];
      v39 = id v38 = v24;
      uint64_t v40 = [(SBPIPController *)v36 initWithIdleTimerCoordinator:v25 windowLevel:v39 interactionSettings:v26->_sceneContentAdapter adapter:v37];
      pipController = v26->_pipController;
      v26->_pipController = (SBPIPController *)v40;

      [v60 registerController:v26->_pipController forType:1];
      v42 = v35;
      v43 = v38;
      v44 = [[SBSystemNotesInteractionManager alloc] initWithWorkspace:v20 systemGestureManager:v35 systemPointerInteractionManager:v38 dataSource:v26 delegate:v26];
      interactionManager = v26->_interactionManager;
      v26->_interactionManager = v44;

      [(SBSystemNotesPresentationRequestServer *)v26->_systemNotesRequestServer activate];
      objc_initWeak(&location, v26);
      v46 = (void *)MEMORY[0x1E4F94128];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __313__SBSystemNotesManager_initWithControllerCoordinator_workspace_sceneManager_keyboardArbiterManager_fbSceneManager_sceneDeactivationManager_keyboardSuppressionManager_keyboardDismissalManager_applicationController_systemGestureManager_systemPointerInteractionManager_idleTimerCoordinator_managedProfileConnection___block_invoke;
      v65[3] = &unk_1E6AF5AF0;
      objc_copyWeak(&v67, &location);
      v47 = v26;
      v66 = v47;
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __313__SBSystemNotesManager_initWithControllerCoordinator_workspace_sceneManager_keyboardArbiterManager_fbSceneManager_sceneDeactivationManager_keyboardSuppressionManager_keyboardDismissalManager_applicationController_systemGestureManager_systemPointerInteractionManager_idleTimerCoordinator_managedProfileConnection___block_invoke_2;
      v63[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v64, &location);
      uint64_t v48 = [v46 recipeWithTitle:@"Trigger System Notes UI" increaseAction:v65 decreaseAction:v63];
      systemNotesTestRecipe = v47->_systemNotesTestRecipe;
      v47->_systemNotesTestRecipe = (PTTestRecipe *)v48;

      +[PTDomain registerTestRecipe:v47->_systemNotesTestRecipe];
      objc_destroyWeak(&v64);

      objc_destroyWeak(&v67);
      objc_destroyWeak(&location);
      id v23 = v42;
      id v24 = v43;
    }
    v26->_lock._os_unfair_lock_opaque = 0;
  }

  return v26;
}

void __313__SBSystemNotesManager_initWithControllerCoordinator_workspace_sceneManager_keyboardArbiterManager_fbSceneManager_sceneDeactivationManager_keyboardSuppressionManager_keyboardDismissalManager_applicationController_systemGestureManager_systemPointerInteractionManager_idleTimerCoordinator_managedProfileConnection___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    [v4 _handleCreateNoteRequestWithMode:0 presentationSource:1];
    [*(id *)(a1 + 32) _setPresentedConnection:0];
  }
}

void __313__SBSystemNotesManager_initWithControllerCoordinator_workspace_sceneManager_keyboardArbiterManager_fbSceneManager_sceneDeactivationManager_keyboardSuppressionManager_keyboardDismissalManager_applicationController_systemGestureManager_systemPointerInteractionManager_idleTimerCoordinator_managedProfileConnection___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(v1);
    if ([v3 _currentPresentationMode] == -1) {
      [v3 _handleCreateNoteRequestWithMode:1 presentationSource:0];
    }
    else {
      [v3 _dismissNotesWithReason:1];
    }
  }
}

- (void)dealloc
{
  [(MCProfileConnection *)self->_managedProfileConnection unregisterObserver:self];
  [(BSAbsoluteMachTimer *)self->_interactionLoggingTimer invalidate];
  [(SBSystemNotesManager *)self _setPresentedConnection:0];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesManager;
  [(SBSystemNotesManager *)&v3 dealloc];
}

- (void)_reloadLaunchBundleID
{
  id v5 = [(SBSystemNotesSettings *)self->_pipSettings launchSettings];
  objc_super v3 = [v5 applicationBundleID];
  launchBundleID = self->_launchBundleID;
  self->_launchBundleID = v3;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  char v5 = [a3 isQuickNoteAllowed];
  v6 = [(SBSystemNotesManager *)self _presentedContainerViewController];
  if (v6 && (v5 & 1) == 0)
  {
    id v7 = v6;
    [(SBSystemNotesManager *)self _dismissNotesWithReason:9];
    v6 = v7;
  }
}

- (void)showOrHideForKeyCommand:(id)a3
{
  id v4 = [(SBSystemNotesManager *)self _presentedContainerViewController];
  if (v4) {
    [(SBSystemNotesManager *)self _dismissNotesWithReason:4];
  }
  else {
    [(SBSystemNotesManager *)self _handleCreateNoteRequestWithMode:0 presentationSource:6];
  }
}

- (id)server:(id)a3 targetForNewClientConnection:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_connections = self->_lock_connections;
  if (!lock_connections)
  {
    id v7 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    v8 = self->_lock_connections;
    self->_lock_connections = v7;

    lock_connections = self->_lock_connections;
  }
  [(NSMutableSet *)lock_connections addObject:v5];
  os_unfair_lock_unlock(&self->_lock);

  return self;
}

- (void)server:(id)a3 connectionDidInvalidate:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_lock_connections removeObject:v5];
  if (![(NSMutableSet *)self->_lock_connections count])
  {
    lock_connections = self->_lock_connections;
    self->_lock_connections = 0;
  }
  os_unfair_lock_unlock(&self->_lock);
  id v7 = v5;
  BSDispatchMain();
}

uint64_t __55__SBSystemNotesManager_server_connectionDidInvalidate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 144)];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) _currentPresentationMode];
    if (result == 1)
    {
      objc_super v3 = *(void **)(a1 + 40);
      return [v3 _dismissNotesWithReason:5];
    }
  }
  return result;
}

- (void)activateConfiguration:(id)a3
{
  id v3 = a3;
  [MEMORY[0x1E4F62880] currentContext];
  id v7 = v6 = v3;
  id v4 = v7;
  id v5 = v3;
  BSDispatchMain();
}

void __46__SBSystemNotesManager_activateConfiguration___block_invoke(id *a1)
{
  if ([a1[4] preferredPresentationMode] == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 3;
  }
  id v3 = [[SBSystemNotesContentPresentationContext alloc] initWithRequestedConfiguration:a1[4] source:v2 positionConfiguration:0];
  id v4 = a1[5];
  id v8 = 0;
  char v5 = [v4 _handleCreateNoteRequestWithPresentationContext:v3 error:&v8];
  id v6 = v8;
  if (v5)
  {
    [a1[5] _setPresentedConnection:a1[6]];
  }
  else
  {
    id v7 = [a1[6] remoteTarget];
    [v7 configuration:a1[4] didInvalidateWithError:v6];
  }
}

- (void)presentWithConfiguration:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  BSDispatchMain();
}

void __60__SBSystemNotesManager_presentWithConfiguration_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) preferredPresentationMode] == 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 3;
  }
  id v3 = [[SBSystemNotesContentPresentationContext alloc] initWithRequestedConfiguration:*(void *)(a1 + 32) source:v2 positionConfiguration:0];
  id v4 = *(void **)(a1 + 40);
  id v8 = 0;
  int v5 = [v4 _handleCreateNoteRequestWithPresentationContext:v3 error:&v8];
  id v6 = v8;
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }
  if (v5) {
    [*(id *)(a1 + 40) _setPresentedConnection:0];
  }
}

- (void)_setPresentedConnection:(id)a3
{
  int v5 = (BSServiceConnection *)a3;
  p_presentedConnection = &self->_presentedConnection;
  presentedConnection = self->_presentedConnection;
  if (presentedConnection != v5)
  {
    v12 = v5;
    if (presentedConnection)
    {
      [(BSServiceConnection *)presentedConnection invalidate];
      os_unfair_lock_lock(&self->_lock);
      [(NSMutableSet *)self->_lock_connections removeObject:self->_presentedConnection];
      os_unfair_lock_unlock(&self->_lock);
    }
    objc_storeStrong((id *)&self->_presentedConnection, a3);
    id v8 = [(SBSystemNotesManager *)self _presentedNotesContentViewController];
    if (v8)
    {
      v9 = [(BSServiceConnection *)*p_presentedConnection remoteTarget];
      v10 = [v8 currentConfiguration];
      v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "presentationMode"));
      [v9 configuration:v10 didChangeToPresentationMode:v11];
    }
    int v5 = v12;
  }
}

- (id)_sceneBundleIdentifierForNewConfiguration
{
  id v3 = self->_launchBundleID;
  if ([(SBSystemNotesManager *)self _currentPresentationMode] != -1)
  {
    id v4 = [(SBSystemNotesManager *)self _presentedNotesContentViewController];
    uint64_t v5 = [v4 bundleIdentifier];

    id v3 = (NSString *)v5;
  }
  return v3;
}

- (BOOL)_handleCreateNoteRequestWithMode:(int64_t)a3 presentationSource:(unint64_t)a4
{
  id v7 = objc_alloc(MEMORY[0x1E4FA6C60]);
  id v8 = [(SBSystemNotesManager *)self _sceneBundleIdentifierForNewConfiguration];
  v9 = (void *)[v7 initWithSceneBundleIdentifier:v8 userActivity:0 preferredPresentationMode:a3];

  v10 = [[SBSystemNotesContentPresentationContext alloc] initWithRequestedConfiguration:v9 source:a4 positionConfiguration:0];
  LOBYTE(self) = [(SBSystemNotesManager *)self _handleCreateNoteRequestWithPresentationContext:v10 error:0];

  return (char)self;
}

- (BOOL)_handleCreateNoteRequestWithPresentationContext:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 requestedConfiguration];
  uint64_t v9 = [v7 source];
  unint64_t v10 = [v8 preferredPresentationMode];
  int64_t v11 = [(SBSystemNotesManager *)self _currentPresentationMode];
  v12 = [(SBSystemNotesManager *)self _presentedContainerViewController];
  int v40 = [v12 isStashed];

  unint64_t v13 = v9 & 0xFFFFFFFFFFFFFFFELL;
  if (v10 >= 2)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    SBSSystemNotesPresentationModeDescription();
    v36 = v39 = a4;
    [v35 handleFailureInMethod:a2, self, @"SBSystemNotesManager.m", 433, @"asked to present in an invalid mode %@", v36 object file lineNumber description];

    a4 = v39;
  }
  if (v13 == 4)
  {
    v14 = [v8 userActivity];

    if (v14)
    {
      double v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2 object:self file:@"SBSystemNotesManager.m" lineNumber:436 description:@"unexpected NSUserActivity for a gesture-originated SBSSystemNotesPresentationConfiguration"];
    }
  }
  id v43 = 0;
  LODWORD(v15) = SBIsSystemNotesEnabled(&v43);
  id v16 = v43;
  if (v15)
  {
    id v38 = a4;
    interactionManager = self->_interactionManager;
    id v42 = v16;
    LODWORD(v15) = [(SBSystemNotesInteractionManager *)interactionManager canHandlePresentationRequests:&v42];
    id v18 = v42;

    if (!v15)
    {
LABEL_41:
      id v16 = v18;
      a4 = v38;
      goto LABEL_42;
    }
    LOBYTE(v15) = v11 == -1;
    if (v11 != -1)
    {
      if (!v11 && v10 == 1)
      {
        v19 = SBLogSystemNotes();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "ignoring SBSSystemNotesPresentationConfiguration for presenting a thumbnail, as we're already showing a full PIP window", buf, 2u);
        }
        goto LABEL_40;
      }
      uint64_t v29 = [(SBSystemNotesManager *)self _presentedNotesContentViewController];
      uint64_t v30 = [v29 updateConfiguration:v8 sendCreateActionIfNecessary:v40 ^ 1u];

      if (v30 == 1)
      {
        if (v9 == 5)
        {
          [MEMORY[0x1E4FA9278] logActivationEvent:*MEMORY[0x1E4FA92C8]];
          uint64_t v31 = SBLogSystemNotes();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:]();
          }
        }
        else
        {
          if (v9 != 4) {
            goto LABEL_33;
          }
          [MEMORY[0x1E4FA9278] logActivationEvent:*MEMORY[0x1E4FA92D0]];
          uint64_t v31 = SBLogSystemNotes();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:]();
          }
        }
      }
LABEL_33:
      if (v11 == 1 && !v10) {
        [(SBSystemNotesInteractionManager *)self->_interactionManager expandAnimated:1];
      }
      char v32 = v40 ^ 1;
      if (v10) {
        char v32 = 1;
      }
      if (v32)
      {
        LOBYTE(v15) = 0;
        goto LABEL_41;
      }
      LOBYTE(v15) = v11 == -1;
      v19 = [(SBSystemNotesManager *)self _presentedContainerViewController];
      [v19 setStashed:0];
      goto LABEL_40;
    }
    id v20 = SBLogSystemNotes();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = "gesture-originated";
      if (v13 != 4) {
        id v21 = "non-gesture-originated";
      }
      *(_DWORD *)buf = 136315138;
      v45 = v21;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEFAULT, "presenting new PIP thumbnail for %s SBSSystemNotesPresentationConfiguration", buf, 0xCu);
    }

    id v41 = v18;
    v19 = [(SBSystemNotesManager *)self _createContentViewControllerForPresentationContext:v7 error:&v41];
    id v15 = v41;

    id v22 = objc_alloc_init(MEMORY[0x1E4FA60C8]);
    [v22 setLastKnownSize:@"SystemNotes-Thumbnail" contentType:0.0];

    id v23 = [SBPIPContentViewLayoutSettings alloc];
    id v24 = [v7 requestedConfiguration];
    id v25 = +[SBPIPContentViewLayoutMetrics systemNotesMetricsForPresentationMode:](SBPIPContentViewLayoutMetrics, "systemNotesMetricsForPresentationMode:", [v24 preferredPresentationMode]);
    v26 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:](v23, "initWithPlatformMetrics:contentSize:", v25, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    v27 = [v7 positionConfiguration];
    v28 = v27;
    if (v27)
    {
      -[SBPIPContentViewLayoutSettings setContentViewPosition:](v26, "setContentViewPosition:", [v27 position]);
      [(SBSystemNotesManager *)self _addContentViewControllerToPIPHierarchy:v19 contentViewLayoutSettings:v26 animated:v13 != 4];
      if (v13 == 4) {
        goto LABEL_29;
      }
    }
    else
    {
      if (v13 == 4)
      {
        [(SBSystemNotesManager *)self _addContentViewControllerToPIPHierarchy:v19 contentViewLayoutSettings:v26 animated:0];
        goto LABEL_29;
      }
      [(SBPIPContentViewLayoutSettings *)v26 setContentViewPosition:[(SBSystemNotesInteractionManager *)self->_interactionManager startingPositionForExternalPresentationRequest]];
      [(SBSystemNotesManager *)self _addContentViewControllerToPIPHierarchy:v19 contentViewLayoutSettings:v26 animated:1];
    }
    [(SBSystemNotesInteractionManager *)self->_interactionManager peepAnimated:1];
LABEL_29:

    id v18 = v15;
    LOBYTE(v15) = 1;
LABEL_40:

    goto LABEL_41;
  }
LABEL_42:
  if (v16)
  {
    v33 = SBLogSystemNotes();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:]((uint64_t)v16, v33);
    }

    if (a4) {
      *a4 = v16;
    }
  }

  return (char)v15;
}

- (void)contentViewControllerDidReceiveTapToExpand:(id)a3
{
  id v4 = [(SBSystemNotesManager *)self _presentedNotesContentViewController];
  if (v4)
  {
    id v5 = v4;
    [(SBSystemNotesInteractionManager *)self->_interactionManager expandAnimated:1];
    id v4 = v5;
  }
}

- (void)contentViewController:(id)a3 didChangeToPresentationMode:(int64_t)a4
{
  presentedConnection = self->_presentedConnection;
  id v6 = a3;
  id v9 = [(BSServiceConnection *)presentedConnection remoteTarget];
  id v7 = [v6 currentConfiguration];

  id v8 = [NSNumber numberWithInteger:a4];
  [v9 configuration:v7 didChangeToPresentationMode:v8];
}

- (void)contentViewControllerWantsDismissal:(id)a3 forReason:(unint64_t)a4 animated:(BOOL)a5
{
  if (a4 == 1) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = 8 * (a4 == 2);
  }
  [(SBSystemNotesManager *)self _dismissNotesWithReason:v5 animated:a5];
}

- (void)contentViewController:(id)a3 didReceiveScreenshotRequestForDisplays:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = (void *)MEMORY[0x1E4F1CA48];
  id v12 = a3;
  unint64_t v13 = objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v14 = objc_alloc_init(SBSystemNotesScreenshotter);
  id v15 = [v12 view];

  id v16 = [v15 window];
  v17 = [v16 layer];

  LODWORD(v16) = [v17 disableUpdateMask];
  [v17 setDisableUpdateMask:v16 | 2];
  id v18 = (void *)SBApp;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__SBSystemNotesManager_contentViewController_didReceiveScreenshotRequestForDisplays_completion___block_invoke;
  v24[3] = &unk_1E6AFD380;
  v24[4] = self;
  id v25 = v9;
  id v29 = v10;
  SEL v30 = a2;
  v26 = v14;
  id v27 = v13;
  int v31 = (int)v16;
  id v28 = v17;
  id v19 = v10;
  id v20 = v17;
  id v21 = v13;
  id v22 = v14;
  id v23 = v9;
  objc_msgSend(v18, "sb_performBlockAfterCATransactionSynchronizedCommit:", v24);
}

uint64_t __96__SBSystemNotesManager_contentViewController_didReceiveScreenshotRequestForDisplays_completion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F99DD8] playScreenshotSound];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 200))
  {
    uint64_t v3 = [MEMORY[0x1E4F28BD0] set];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 200);
    *(void *)(v4 + 200) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (!*(void *)(v2 + 208))
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 208);
    *(void *)(v7 + 208) = v6;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v33 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v37;
    SEL v30 = @"SBTraitsParticipantRoleScreenFlash";
    double v9 = *MEMORY[0x1E4F43958];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(obj);
        }
        int64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1D948C4D0]();
        unint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 208) objectForKey:v11];
        v14 = [(SBSecureWindow *)v13 rootViewController];
        id v15 = [v14 view];
        if (!v13)
        {
          if ([*(id *)(*(void *)(a1 + 32) + 200) countForObject:v11])
          {
            id v28 = [MEMORY[0x1E4F28B00] currentHandler];
            [v28 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 32) file:@"SBSystemNotesManager.m" lineNumber:569 description:@"not tracking a window but apparently tracking work"];
          }
          id v16 = [SBSecureWindow alloc];
          v17 = [(id)SBApp windowSceneManager];
          id v18 = [v17 windowSceneForDisplayIdentity:v11];
          unint64_t v13 = [(SBWindow *)v16 initWithWindowScene:v18 role:v30 debugName:@"NotesScreenshotFlash"];

          [(SBSecureWindow *)v13 setWindowLevel:v9];
          [(SBSecureWindow *)v13 setUserInteractionEnabled:0];
          id v19 = (void *)[objc_alloc(MEMORY[0x1E4F42FF8]) initWithNibName:0 bundle:0];

          [(SBSecureWindow *)v13 setRootViewController:v19];
          [*(id *)(*(void *)(a1 + 32) + 208) setObject:v13 forKey:v11];
          uint64_t v20 = [MEMORY[0x1E4F99DC8] flashViewForStyle:2];

          [v19 setView:v20];
          id v15 = (void *)v20;
          v14 = v19;
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 200), "addObject:", v11, v30);
        [(SBWindow *)v13 setHidden:0];
        [v15 setNeedsLayout];
        [v15 layoutIfNeeded];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __96__SBSystemNotesManager_contentViewController_didReceiveScreenshotRequestForDisplays_completion___block_invoke_2;
        v34[3] = &unk_1E6AF4E00;
        v34[4] = *(void *)(a1 + 32);
        v34[5] = v11;
        id v35 = v13;
        id v21 = v13;
        [v15 flashWithCompletion:v34];
        id v22 = [*(id *)(a1 + 48) takeScreenshotOfDisplay:v11];
        id v23 = (void *)[objc_alloc(MEMORY[0x1E4F4F770]) initWithPort:IOSurfaceCreateMachPort(v22)];
        id v24 = [v11 UIScreen];
        [v24 scale];
        double v26 = v25;

        id v27 = (void *)[objc_alloc(MEMORY[0x1E4FA6C78]) initWithDisplay:v11 sendRight:v23 scale:v26];
        [*(id *)(a1 + 56) addObject:v27];

        ++v10;
      }
      while (v33 != v10);
      uint64_t v33 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v33);
  }

  [*(id *)(a1 + 64) setDisableUpdateMask:*(unsigned int *)(a1 + 88)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __96__SBSystemNotesManager_contentViewController_didReceiveScreenshotRequestForDisplays_completion___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 200) removeObject:a1[5]];
  uint64_t result = [*(id *)(a1[4] + 200) countForObject:a1[5]];
  if (!result)
  {
    [*(id *)(a1[4] + 208) removeObjectForKey:a1[5]];
    uint64_t v3 = (void *)a1[6];
    return [v3 setHidden:1];
  }
  return result;
}

- (id)_sceneHandleForApplication:(id)a3 sceneSpecification:(id)a4
{
  sceneManager = self->_sceneManager;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SBSceneManager *)sceneManager newSceneIdentityForApplication:v8];
  uint64_t v10 = [(SBSceneManager *)self->_sceneManager displayIdentity];
  int64_t v11 = +[SBApplicationSceneHandleRequest defaultRequestForApplication:v8 sceneIdentity:v9 displayIdentity:v10];

  id v12 = [v11 sceneDefinition];
  unint64_t v13 = (void *)[v12 mutableCopy];

  [v13 setSpecification:v7];
  [v11 setSceneDefinition:v13];
  v14 = [(SBMainDisplaySceneManager *)self->_sceneManager fetchOrCreateApplicationSceneHandleForRequest:v11];
  [v14 setDefaultBackgroundStyle:3];
  [v14 setKeyboardContextMaskStyle:2];

  return v14;
}

- (id)_createContentViewControllerForPresentationContext:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 requestedConfiguration];
  id v8 = [v7 sceneBundleIdentifier];

  id v9 = [(SBApplicationController *)self->_applicationController applicationWithBundleIdentifier:v8];
  if (v9)
  {
    uint64_t v10 = [(SBSystemNotesManager *)self _sceneHandleForApplication:v9 sceneSpecification:self->_sceneSpecification];
    if (v10)
    {
      SEL v30 = a4;
      int64_t v11 = [(id)SBApp windowSceneManager];
      [(SBSceneManager *)self->_sceneManager displayIdentity];
      unint64_t v13 = v12 = v6;
      v14 = [v11 windowSceneForDisplayIdentity:v13];

      id v15 = [v14 switcherController];
      objc_msgSend(v10, "setWantsEnhancedWindowingEnabled:", objc_msgSend(v15, "isChamoisWindowingUIEnabled"));

      id v16 = [SBSystemNotesContentViewController alloc];
      workspace = self->_workspace;
      id v18 = [v14 transientUIInteractionManager];
      id v19 = [(SBSystemNotesSettings *)self->_pipSettings interactionSettings];
      int v31 = v12;
      uint64_t v20 = [(SBSystemNotesContentViewController *)v16 initWithSceneHandle:v10 workspace:workspace transientUIInteractionManager:v18 notesInteractionSettings:v19 presentationContext:v12];

      id v21 = SBLogSystemNotes();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        id v29 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543618;
        long long v39 = v29;
        __int16 v40 = 2114;
        uint64_t v41 = v20;
        _os_log_debug_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] created contentVC: %{public}@", buf, 0x16u);
      }
      [(SBSystemNotesContentViewController *)v20 setDelegate:self];
      a4 = v30;
      id v6 = v31;
    }
    else
    {
      if (!a4)
      {
        uint64_t v20 = 0;
        goto LABEL_11;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"failed to create SBSystemNotesContentViewController; scene handle creation failed. bundleID: %@",
      v14 = v8);
      id v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      long long v37 = v14;
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a4 = [v23 errorWithDomain:@"SBPIPSceneContentPresentationErrorDomain" code:2 userInfo:v24];

      uint64_t v20 = 0;
    }
  }
  else
  {
    if (!a4)
    {
LABEL_15:
      uint64_t v20 = 0;
      goto LABEL_16;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"failed to create SBSystemNotesContentViewController; couldn't find application bundleID: %@",
    uint64_t v10 = v8);
    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    id v35 = v10;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    [v22 errorWithDomain:@"SBPIPSceneContentPresentationErrorDomain" code:1 userInfo:v14];
    uint64_t v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  if (a4 && !v20)
  {
    if (!*a4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"failed to create SBSystemNotesContentViewController; bundleID: %@",
      double v25 = v8);
      double v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      uint64_t v33 = v25;
      id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      *a4 = [v26 errorWithDomain:@"SBPIPSceneContentPresentationErrorDomain" code:0 userInfo:v27];
    }
    goto LABEL_15;
  }
LABEL_16:

  return v20;
}

- (void)_addContentViewControllerToPIPHierarchy:(id)a3 contentViewLayoutSettings:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  if (a3)
  {
    BOOL v40 = v5;
    id v43 = v9;
    objc_storeStrong((id *)&self->_contentViewLayoutSettings, a4);
    id v10 = a3;
    int64_t v11 = [(id)SBApp windowSceneManager];
    id v12 = [(SBSceneManager *)self->_sceneManager displayIdentity];
    unint64_t v13 = [v11 windowSceneForDisplayIdentity:v12];

    uint64_t v14 = [v13 layoutStateTransitionCoordinator];
    uint64_t v41 = v13;
    id v15 = [v13 pictureInPictureManager];
    id v16 = [SBPIPSceneContentContainerAdapter alloc];
    v17 = [(SBSystemNotesSettings *)self->_pipSettings stashVisualSettings];
    id v18 = [(SBSystemNotesSettings *)self->_pipSettings shadowSettings];
    id v19 = [(SBSystemNotesSettings *)self->_pipSettings interactionSettings];
    keyboardArbiterManager = self->_keyboardArbiterManager;
    id v21 = [(SBMainWorkspace *)self->_workspace keyboardFocusController];
    uint64_t v42 = (void *)v14;
    id v22 = [(SBPIPSceneContentContainerAdapter *)v16 initWithSceneContentViewController:v10 contentViewLayoutSettings:v43 stashSettings:v17 shadowSettings:v18 interactionSettings:v19 keyboardArbiterManager:keyboardArbiterManager keyboardFocusController:v21 keyboardSuppressionManager:self->_keyboardSuppressionManager keyboardDismissalManager:self->_keyboardDismissalManager deactivationManager:self->_sceneDeactivationManager transitionCoordinator:v14 delegate:self->_interactionManager];

    id v23 = [SBPIPContainerViewController alloc];
    pipController = self->_pipController;
    double v25 = [(SBSystemNotesSettings *)self->_pipSettings interactionSettings];
    double v26 = [(SBPIPContainerViewController *)v23 initWithPIPController:pipController interactionSettings:v25 adapter:v22];

    if (v26)
    {
      [(SBPIPController *)self->_pipController addContainerViewController:v26 dataSource:self->_interactionManager];
      id v27 = [v15 acquireWindowLevelOverrideAssertionForControllerWithContentType:0 toWindowLevel:(unint64_t)(*MEMORY[0x1E4F43F20] + 5.0 + 10.0 + -1.0) withReason:9 identifier:@"SBSystemNotesManager-ActivePresentation"];
      pegasusWindowLevelAssertion = self->_pegasusWindowLevelAssertion;
      self->_pegasusWindowLevelAssertion = v27;
    }
    if (v40)
    {
      id v29 = +[SBPIPSettingsDomain rootSettings];
      SEL v30 = [v29 fadeInOutSettings];
      int v31 = [v30 fadeInOutAnimationSettings];

      uint64_t v32 = +[SBPIPSettingsDomain rootSettings];
      uint64_t v33 = [v32 fadeInOutSettings];
      [v33 fadeInInitialValues];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
    }
    else
    {
      int v31 = 0;
      double v35 = 0.0;
      double v37 = 0.0;
      double v39 = 0.0;
    }
    -[SBPIPContainerViewController startShowingContentWithAnimationSettings:parameters:completion:](v26, "startShowingContentWithAnimationSettings:parameters:completion:", v31, 0, v35, v37, v39);
    objc_storeWeak((id *)&self->_presentedContainerAdapter, v22);

    id v9 = v43;
  }
}

- (id)_presentedNotesContentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedContainerAdapter);
  BOOL v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained sceneContentViewController];
    if (v6) {
      goto LABEL_5;
    }
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBSystemNotesManager.m" lineNumber:723 description:@"we have a presentedContainerAdapter but the sceneContentVC is nil"];
  }
  id v6 = 0;
LABEL_5:

  return v6;
}

- (void)_dismissNotesWithReason:(unint64_t)a3
{
}

- (void)_dismissNotesWithReason:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = SBLogSystemNotes();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBSystemNotesManager _dismissNotesWithReason:animated:](a3, v7);
  }

  self->_interactionRequests = 0;
  [(BSAbsoluteMachTimer *)self->_interactionLoggingTimer invalidate];
  interactionLoggingTimer = self->_interactionLoggingTimer;
  self->_interactionLoggingTimer = 0;

  id v9 = [(SBSystemNotesManager *)self _presentedContainerViewController];
  id v10 = [v9 hostedAppSceneHandle];

  int64_t v11 = [(SBSystemNotesManager *)self _presentedNotesContentViewController];
  id v12 = [v11 currentConfiguration];
  unint64_t v13 = [(SBSystemNotesManager *)self _presentedContainerViewController];
  [v11 setDelegate:0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke;
  v31[3] = &unk_1E6AF5770;
  v31[4] = self;
  BOOL v33 = v4;
  id v14 = v10;
  id v32 = v14;
  id v15 = (void (**)(void))MEMORY[0x1D948C7A0](v31);
  id v16 = v15;
  if (a3 != 7 || !v4)
  {
    v15[2](v15);
    if (!v12) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_3;
  v29[3] = &unk_1E6AF5300;
  SEL v30 = v15;
  [v13 animateOutLeftStashTabWithCompletion:v29];

  if (v12)
  {
LABEL_8:
    v17 = [(BSServiceConnection *)self->_presentedConnection remoteTarget];
    [v17 configuration:v12 didChangeToPresentationMode:&unk_1F3349D88];
  }
LABEL_9:
  [(SBSystemNotesManager *)self _setPresentedConnection:0];
  switch(a3)
  {
    case 2uLL:
      id v18 = (void *)MEMORY[0x1E4FA92E0];
      break;
    case 6uLL:
      id v18 = (void *)MEMORY[0x1E4FA92E8];
      break;
    case 4uLL:
      id v18 = (void *)MEMORY[0x1E4FA92D8];
      break;
    default:
      goto LABEL_16;
  }
  [MEMORY[0x1E4FA9278] logDismissEvent:*v18];
LABEL_16:
  id v19 = SBLogSystemNotes();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 - 1 > 8) {
      uint64_t v20 = @"undefined";
    }
    else {
      uint64_t v20 = off_1E6AFD3C8[a3 - 1];
    }
    *(_DWORD *)buf = 138543362;
    double v35 = v20;
    _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Dismissed Notes PIP for reason: %{public}@", buf, 0xCu);
  }

  id v21 = [v14 sceneIdentifier];
  id v22 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  int v23 = [v22 isEnabled];

  if (v23)
  {
    id v24 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_88;
    v25[3] = &unk_1E6AFD3A8;
    id v26 = v21;
    unint64_t v27 = a3;
    BOOL v28 = v4;
    [v24 logBlock:v25];
  }
}

void __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 104);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_2;
  v4[3] = &unk_1E6AF5290;
  v4[4] = v1;
  id v5 = *(id *)(a1 + 40);
  [v2 dismissAnimated:v3 completion:v4];
}

uint64_t __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tearDownContainerViewControllerForSceneHandle:*(void *)(a1 + 40)];
}

uint64_t __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __57__SBSystemNotesManager__dismissNotesWithReason_animated___block_invoke_88(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v10 = @"[SBSystemNotesManager _dismissNotesContentForReason:animated:]";
  uint64_t v1 = @"Unknown";
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = *(__CFString **)(a1 + 32);
  }
  v9[0] = v1;
  v8[0] = @"SceneID";
  v8[1] = @"Reason";
  if ((unint64_t)(v2 - 1) > 8) {
    uint64_t v3 = @"undefined";
  }
  else {
    uint64_t v3 = off_1E6AFD3C8[v2 - 1];
  }
  v9[1] = v3;
  v8[2] = @"Animated";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v9[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  return v6;
}

- (void)_tearDownContainerViewControllerForSceneHandle:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = [(SBSystemNotesManager *)self _presentedContainerViewController];
    id v7 = [v6 hostedAppSceneHandle];

    int v8 = [v7 isEqual:v5];
    pegasusWindowLevelAssertion = SBLogSystemNotes();
    BOOL v10 = os_log_type_enabled(pegasusWindowLevelAssertion, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        [(SBSystemNotesManager *)self _tearDownContainerViewControllerForSceneHandle:pegasusWindowLevelAssertion];
      }

      pipController = self->_pipController;
      id v12 = [(SBSystemNotesManager *)self _presentedContainerViewController];
      [(SBPIPController *)pipController removeContainerViewController:v12];

      objc_storeWeak((id *)&self->_presentedContainerAdapter, 0);
      [(BSInvalidatable *)self->_pegasusWindowLevelAssertion invalidate];
      pegasusWindowLevelAssertion = self->_pegasusWindowLevelAssertion;
      self->_pegasusWindowLevelAssertion = 0;
    }
    else if (v10)
    {
      id v18 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543874;
      id v22 = v18;
      __int16 v23 = 2114;
      id v24 = v5;
      __int16 v25 = 2114;
      id v26 = v7;
      _os_log_debug_impl(&dword_1D85BA000, pegasusWindowLevelAssertion, OS_LOG_TYPE_DEBUG, "[%{public}@] not tearing down contentVC as it's not tracking sceneHandle: %{public}@; tracked handle: %{public}@",
        buf,
        0x20u);
    }
    unint64_t v13 = [v5 sceneIdentifier];
    id v14 = [(FBSceneManager *)self->_fbSceneManager sceneWithIdentifier:v13];

    if (v14) {
      [(FBSceneManager *)self->_fbSceneManager destroyScene:v13 withTransitionContext:0];
    }
    id v15 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    int v16 = [v15 isEnabled];

    if (v16)
    {
      v17 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __71__SBSystemNotesManager__tearDownContainerViewControllerForSceneHandle___block_invoke;
      v19[3] = &unk_1E6AF5180;
      id v20 = v13;
      [v17 logBlock:v19];
    }
  }
  else
  {
    id v7 = SBLogSystemNotes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(SBSystemNotesManager *)self _tearDownContainerViewControllerForSceneHandle:v7];
    }
  }
}

id __71__SBSystemNotesManager__tearDownContainerViewControllerForSceneHandle___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"SceneID";
  uint64_t v1 = @"Unknown";
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = *(__CFString **)(a1 + 32);
  }
  id v6 = v1;
  id v7 = @"[SBSystemNotesManager _tearDownContainerViewControllerForSceneHandle:]";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  v8[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v3;
}

- (int64_t)_currentPresentationMode
{
  BOOL v4 = [(SBSystemNotesManager *)self _presentedNotesContentViewController];
  id v5 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  int64_t v6 = [v4 presentationMode];
  if (v6 == -1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SBSystemNotesManager.m" lineNumber:847 description:@"we have a presented contentVC but our presentationMode is invalid"];

LABEL_4:
    int64_t v6 = -1;
  }

  return v6;
}

- (id)_presentedContainerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedContainerAdapter);
  uint64_t v3 = [WeakRetained containerViewController];

  return v3;
}

- (id)presentedPIPContentViewControllerForInteractionManager:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedContainerAdapter);
  id v5 = [(SBSystemNotesManager *)self _presentedContainerViewController];
  int64_t v6 = [WeakRetained contentViewControllerForContainerViewController:v5];

  return v6;
}

- (id)launchBundleIDForInteractionManager:(id)a3
{
  return self->_launchBundleID;
}

- (id)launchApplicationIdentityForInteractionManager:(id)a3
{
  uint64_t v3 = [(SBApplicationController *)self->_applicationController applicationWithBundleIdentifier:self->_launchBundleID];
  BOOL v4 = [v3 info];
  id v5 = [v4 applicationIdentity];

  return v5;
}

- (id)currentContentViewLayoutSettingsForInteractionManager:(id)a3
{
  return self->_contentViewLayoutSettings;
}

- (BOOL)interactionManager:(id)a3 requestsPresentationWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t interactionRequests = self->_interactionRequests;
  self->_unint64_t interactionRequests = interactionRequests + 1;
  if (interactionRequests == 2)
  {
    id v9 = SBLogSystemNotes();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[SBSystemNotesManager interactionManager:requestsPresentationWithContext:]((uint64_t *)&self->_interactionRequests, v9);
    }
  }
  else if (!interactionRequests)
  {
    BOOL v10 = SBLogSystemNotes();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SBSystemNotesManager interactionManager:requestsPresentationWithContext:]();
    }

    if (!self->_interactionLoggingTimer)
    {
      int64_t v11 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBSystemNotesManager.interactionLoggingTimer"];
      interactionLoggingTimer = self->_interactionLoggingTimer;
      self->_interactionLoggingTimer = v11;
    }
    objc_initWeak(&location, self);
    unint64_t v13 = self->_interactionLoggingTimer;
    uint64_t v14 = MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __75__SBSystemNotesManager_interactionManager_requestsPresentationWithContext___block_invoke;
    id v21 = &unk_1E6AF5838;
    objc_copyWeak(&v22, &location);
    [(BSAbsoluteMachTimer *)v13 scheduleWithFireInterval:v14 leewayInterval:&v18 queue:3.0 handler:0.1];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  BOOL v16 = -[SBSystemNotesManager _handleCreateNoteRequestWithPresentationContext:error:](self, "_handleCreateNoteRequestWithPresentationContext:error:", v7, 0, v18, v19, v20, v21);

  return v16;
}

void __75__SBSystemNotesManager_interactionManager_requestsPresentationWithContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = SBLogSystemNotes();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __75__SBSystemNotesManager_interactionManager_requestsPresentationWithContext___block_invoke_cold_1();
    }

    WeakRetained[23] = 0;
  }
}

- (void)interactionManager:(id)a3 requestsNotesDismissalForSource:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 - 1 > 3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_1D8FD1230[a4 - 1];
  }
  int v8 = SBLogSystemNotes();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = _SBFLoggingMethodProem();
    BOOL v10 = (void *)v9;
    if ((unint64_t)(v7 - 1) > 7) {
      int64_t v11 = @"undefined";
    }
    else {
      int64_t v11 = off_1E6AFD410[v7 - 1];
    }
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v11;
    _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] reason: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  [(SBSystemNotesManager *)self _dismissNotesWithReason:v7 animated:v5];
}

- (void)interactionManager:(id)a3 requestsUpdatePresentationMode:(int64_t)a4
{
  id v5 = [(SBSystemNotesManager *)self _presentedNotesContentViewController];
  [v5 setPresentationMode:a4];
}

- (void)interactionManager:(id)a3 requestsStartSuppressingKeyboardForReason:(id)a4
{
  keyboardSuppressionManager = self->_keyboardSuppressionManager;
  sceneManager = self->_sceneManager;
  id v6 = a4;
  id v7 = [(SBSceneManager *)sceneManager displayIdentity];
  [(SBKeyboardSuppressionManager *)keyboardSuppressionManager startSuppressingKeyboardWithReason:v6 predicate:0 displayIdentity:v7];
}

- (void)interactionManager:(id)a3 requestsStopSuppressingKeyboardForReason:(id)a4
{
}

- (id)interactionManager:(id)a3 requestsStashAssertionForReason:(id)a4
{
  id v5 = (void *)SBApp;
  id v6 = a4;
  id v7 = [v5 windowSceneManager];
  int v8 = [v7 embeddedDisplayWindowScene];

  uint64_t v9 = [(SBPIPController *)self->_pipController acquireStashAssertionForWindowScene:v8 withReason:9 identifier:v6];

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedContainerAdapter);
  objc_storeStrong((id *)&self->_displaysToScreenshotFlashWindows, 0);
  objc_storeStrong((id *)&self->_displaysWithPendingScreenshots, 0);
  objc_storeStrong((id *)&self->_managedProfileConnection, 0);
  objc_storeStrong((id *)&self->_interactionLoggingTimer, 0);
  objc_storeStrong((id *)&self->_pegasusWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_lock_connections, 0);
  objc_storeStrong((id *)&self->_presentedConnection, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationManager, 0);
  objc_storeStrong((id *)&self->_keyboardArbiterManager, 0);
  objc_storeStrong((id *)&self->_contentViewLayoutSettings, 0);
  objc_storeStrong((id *)&self->_keyboardDismissalManager, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
  objc_storeStrong((id *)&self->_keyboardSuppressionManager, 0);
  objc_storeStrong((id *)&self->_pipSettings, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_systemNotesTestRecipe, 0);
  objc_storeStrong((id *)&self->_systemNotesRequestServer, 0);
  objc_storeStrong((id *)&self->_fbSceneManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_sceneContentAdapter, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_launchBundleID, 0);
  objc_storeStrong((id *)&self->_sceneSpecification, 0);
}

- (void)_handleCreateNoteRequestWithPresentationContext:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to create note: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_handleCreateNoteRequestWithPresentationContext:error:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Metrics] SYSystemPaperActivationMethodSwipeWithPIPPencil", v2, v3, v4, v5, v6);
}

- (void)_handleCreateNoteRequestWithPresentationContext:error:.cold.3()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "[Metrics] SYSystemPaperActivationMethodSwipeWithPIPFinger", v2, v3, v4, v5, v6);
}

- (void)_dismissNotesWithReason:(uint64_t)a1 animated:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a1 - 1) > 8) {
    uint64_t v2 = @"undefined";
  }
  else {
    uint64_t v2 = off_1E6AFD3C8[a1 - 1];
  }
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Dismissing Notes PIP for reason: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_tearDownContainerViewControllerForSceneHandle:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _SBFLoggingMethodProem();
  uint8_t v6 = [a1 _presentedNotesContentViewController];
  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] asked to tear down but no scene handle to tear: %{public}@", v7, 0x16u);
}

- (void)_tearDownContainerViewControllerForSceneHandle:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _SBFLoggingMethodProem();
  uint8_t v6 = [a1 _presentedNotesContentViewController];
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@] tearing down contentVC: %{public}@", v7, 0x16u);
}

- (void)interactionManager:(uint64_t *)a1 requestsPresentationWithContext:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134218240;
  uint64_t v4 = v2;
  __int16 v5 = 2048;
  uint64_t v6 = 0x4008000000000000;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "user swiped %lu times within %g seconds. is PIP not showing?", (uint8_t *)&v3, 0x16u);
}

- (void)interactionManager:requestsPresentationWithContext:.cold.2()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "starting interactionLoggingTimer for new interval", v2, v3, v4, v5, v6);
}

void __75__SBSystemNotesManager_interactionManager_requestsPresentationWithContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "interactionLoggingTimer expired -- resetting", v2, v3, v4, v5, v6);
}

@end