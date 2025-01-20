@interface SBInteractiveScreenshotGestureManager
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleRemoteTransientOverlayPresentationRequest:(id)a3 forSession:(id)a4;
- (SBInteractiveScreenshotGestureManager)initWithWindowScene:(id)a3 workspace:(id)a4 appInteractionEventSource:(id)a5;
- (SBInteractiveScreenshotGestureManagerDelegate)delegate;
- (id)_screenshotPresentationOptions;
- (id)acquireDisableGestureAssertionWithReason:(id)a3;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (unint64_t)_touchTypeForGestureRecognizer:(id)a3;
- (void)_handleInteractiveScreenshotGesture:(id)a3;
- (void)_invalidateSessionID:(id)a3;
- (void)_performCommitWorkspaceTransactionBlock:(id)a3;
- (void)_performPendingCommitWorkspaceTransactionBlocksWithTransaction:(id)a3;
- (void)_updateFailureRequirements;
- (void)dealloc;
- (void)eventSource:(id)a3 userTouchedApplication:(id)a4;
- (void)interactiveScreenshotCommitWorkspaceTransactionRequestsGestureWindowInvalidation:(id)a3;
- (void)interactiveScreenshotCommitWorkspaceTransactionRequestsPlaceholderChromeRemoval:(id)a3;
- (void)interactiveScreenshotGestureRootViewController:(id)a3 gestureDidCompleteWithIntent:(int64_t)a4;
- (void)interactiveScreenshotGestureRootViewControllerRequestsGestureRecognizerCancellation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)transactionDidComplete:(id)a3;
@end

@implementation SBInteractiveScreenshotGestureManager

- (SBInteractiveScreenshotGestureManager)initWithWindowScene:(id)a3 workspace:(id)a4 appInteractionEventSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SBInteractiveScreenshotGestureManager;
  v12 = [(SBInteractiveScreenshotGestureManager *)&v35 init];
  v13 = v12;
  if (v12)
  {
    v12->_lastApplicationTouchTime = -1.79769313e308;
    uint64_t v14 = [v9 screen];
    screen = v13->_screen;
    v13->_screen = (UIScreen *)v14;

    objc_storeStrong((id *)&v13->_appInteractionEventSource, a5);
    objc_storeStrong((id *)&v13->_windowScene, a3);
    uint64_t v16 = [v9 systemGestureManager];
    systemGestureManager = v13->_systemGestureManager;
    v13->_systemGestureManager = (SBSystemGestureManager *)v16;

    objc_storeStrong((id *)&v13->_workspace, a4);
    uint64_t v18 = +[SBInteractiveScreenshotDomain rootSettings];
    settings = v13->_settings;
    v13->_settings = (SBInteractiveScreenshotSettings *)v18;

    v20 = [(SBInteractiveScreenshotSettings *)v13->_settings pencilGestureSettings];
    uint64_t v21 = +[SBCornerPencilPanGestureRecognizer interactiveCornerPanGestureRecognizerWithSettings:v20 corner:4 target:v13 action:sel__handleInteractiveScreenshotGesture_];
    bottomLeftPencilGestureRecognizer = v13->_bottomLeftPencilGestureRecognizer;
    v13->_bottomLeftPencilGestureRecognizer = (SBCornerPencilPanGestureRecognizer *)v21;

    [(SBCornerPencilPanGestureRecognizer *)v13->_bottomLeftPencilGestureRecognizer setDelegate:v13];
    [(SBSystemGestureManager *)v13->_systemGestureManager addGestureRecognizer:v13->_bottomLeftPencilGestureRecognizer withType:102];
    v23 = [(SBInteractiveScreenshotSettings *)v13->_settings pencilGestureSettings];
    uint64_t v24 = +[SBCornerPencilPanGestureRecognizer interactiveCornerPanGestureRecognizerWithSettings:v23 corner:8 target:v13 action:sel__handleInteractiveScreenshotGesture_];
    bottomRightPencilGestureRecognizer = v13->_bottomRightPencilGestureRecognizer;
    v13->_bottomRightPencilGestureRecognizer = (SBCornerPencilPanGestureRecognizer *)v24;

    [(SBCornerPencilPanGestureRecognizer *)v13->_bottomRightPencilGestureRecognizer setDelegate:v13];
    [(SBSystemGestureManager *)v13->_systemGestureManager addGestureRecognizer:v13->_bottomRightPencilGestureRecognizer withType:103];
    v26 = [(SBInteractiveScreenshotSettings *)v13->_settings fingerGestureSettings];
    v27 = [[SBCornerFingerGestureClassifier alloc] initWithSettings:v26];
    v28 = [[SBCornerFingerPanGestureRecognizer alloc] initWithTarget:v13 action:sel__handleInteractiveScreenshotGesture_ corner:4 classifier:v27];
    bottomLeftFingerGestureRecognizer = v13->_bottomLeftFingerGestureRecognizer;
    v13->_bottomLeftFingerGestureRecognizer = v28;

    [(SBCornerFingerPanGestureRecognizer *)v13->_bottomLeftFingerGestureRecognizer setDelegate:v13];
    [(SBSystemGestureManager *)v13->_systemGestureManager addGestureRecognizer:v13->_bottomLeftFingerGestureRecognizer withType:104];
    v30 = [[SBCornerFingerGestureClassifier alloc] initWithSettings:v26];
    v31 = [[SBCornerFingerPanGestureRecognizer alloc] initWithTarget:v13 action:sel__handleInteractiveScreenshotGesture_ corner:8 classifier:v30];
    bottomRightFingerGestureRecognizer = v13->_bottomRightFingerGestureRecognizer;
    v13->_bottomRightFingerGestureRecognizer = v31;

    [(SBCornerFingerPanGestureRecognizer *)v13->_bottomRightFingerGestureRecognizer setDelegate:v13];
    [(SBSystemGestureManager *)v13->_systemGestureManager addGestureRecognizer:v13->_bottomRightFingerGestureRecognizer withType:105];
    [(SBInteractiveScreenshotGestureManager *)v13 _updateFailureRequirements];
    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v13 selector:sel__springBoardBootCompleted_ name:@"SBBootCompleteNotification" object:0];

    [(SBDisplayAppInteractionEventSource *)v13->_appInteractionEventSource addObserver:v13];
  }

  return v13;
}

- (void)dealloc
{
  [(SBInteractiveScreenshotCommitWorkspaceTransaction *)self->_commitTransaction removeObserver:self];
  [(SBDisplayAppInteractionEventSource *)self->_appInteractionEventSource removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBInteractiveScreenshotGestureManager;
  [(SBInteractiveScreenshotGestureManager *)&v3 dealloc];
}

- (void)_updateFailureRequirements
{
  SBCornerFingerGestureUpdateFailureRequirements(self->_bottomLeftFingerGestureRecognizer, self->_systemGestureManager);
  bottomRightFingerGestureRecognizer = self->_bottomRightFingerGestureRecognizer;
  systemGestureManager = self->_systemGestureManager;
  SBCornerFingerGestureUpdateFailureRequirements(bottomRightFingerGestureRecognizer, systemGestureManager);
}

- (void)transactionDidComplete:(id)a3
{
  if (self->_commitTransaction == a3)
  {
    self->_hasInitiatedCommit = 0;
    [(BSInvalidatable *)self->_commitTransactionDisableGestureAssertion invalidate];
    commitTransactionDisableGestureAssertion = self->_commitTransactionDisableGestureAssertion;
    self->_commitTransactionDisableGestureAssertion = 0;

    commitTransaction = self->_commitTransaction;
    self->_commitTransaction = 0;
  }
}

- (void)interactiveScreenshotCommitWorkspaceTransactionRequestsPlaceholderChromeRemoval:(id)a3
{
  if (self->_commitTransaction == a3)
  {
    sessionIDToSession = self->_sessionIDToSession;
    v4 = [a3 gestureSessionID];
    id v6 = [(NSMutableDictionary *)sessionIDToSession objectForKey:v4];

    v5 = [v6 rootViewController];
    [v5 removePlaceholderChrome];
  }
}

- (void)interactiveScreenshotCommitWorkspaceTransactionRequestsGestureWindowInvalidation:(id)a3
{
  if (self->_commitTransaction == a3)
  {
    id v4 = [a3 gestureSessionID];
    [(SBInteractiveScreenshotGestureManager *)self _invalidateSessionID:v4];
  }
}

- (void)interactiveScreenshotGestureRootViewController:(id)a3 gestureDidCompleteWithIntent:(int64_t)a4
{
  id v6 = a3;
  v7 = [(SBWorkspace *)self->_workspace eventQueue];
  [v7 cancelEventsWithName:@"BInteractiveScreenshotGestureCommit"];

  activeGestureSessionID = self->_activeGestureSessionID;
  if (activeGestureSessionID)
  {
    id v9 = activeGestureSessionID;
    id v10 = [(NSMutableDictionary *)self->_sessionIDToSession objectForKey:v9];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke;
    v31[3] = &unk_1E6B00330;
    v31[4] = self;
    id v11 = v6;
    id v32 = v11;
    v12 = v9;
    v33 = v12;
    v13 = (void *)MEMORY[0x1D948C7A0](v31);
    screen = self->_screen;
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    if ([(UIScreen *)screen isEqual:v15]) {
      unint64_t v16 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
    }
    else {
      unint64_t v16 = 0;
    }

    if (v16 <= 1) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = v16;
    }
    if (a4 == 1)
    {
      uint64_t v19 = [v11 gestureStyle];
      uint64_t v18 = (void (*)(void *, uint64_t))v13[2];
      if (v19 != 1)
      {
        v20 = v13;
        uint64_t v21 = 1;
        goto LABEL_14;
      }
    }
    else
    {
      if (a4 == 2 && !self->_hasInitiatedCommit)
      {
        v22 = self->_activeGestureSessionID;
        self->_activeGestureSessionID = 0;

        *(_WORD *)&self->_hasInitiatedCommit = 257;
        v23 = [(SBInteractiveScreenshotGestureManager *)self acquireDisableGestureAssertionWithReason:@"CommitTransaction"];
        commitTransactionDisableGestureAssertion = self->_commitTransactionDisableGestureAssertion;
        self->_commitTransactionDisableGestureAssertion = v23;

        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_3;
        v25[3] = &unk_1E6B076F8;
        v25[4] = self;
        v29 = v13;
        id v26 = v11;
        uint64_t v30 = v17;
        id v27 = v10;
        v28 = v12;
        [v26 captureScreenshotWithInterfaceOrientation:v17 completion:v25];

        goto LABEL_15;
      }
      uint64_t v18 = (void (*)(void *, uint64_t))v13[2];
    }
    v20 = v13;
    uint64_t v21 = 0;
LABEL_14:
    v18(v20, v21);
LABEL_15:
  }
}

void __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _performPendingCommitWorkspaceTransactionBlocksWithTransaction:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_2;
  v5[3] = &unk_1E6AFA190;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v4 cancelInteractionWithStyle:a2 settlingCompletionHandler:v5];
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_2(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0) {
    return [*(id *)(result + 32) _invalidateSessionID:*(void *)(result + 40)];
  }
  return result;
}

void __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 89) = 0;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F99DF0]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F99DE8]);
    [v5 setPreparedImage:v3];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v5, "setExternalFlashLayerRenderID:", objc_msgSend(*(id *)(a1 + 40), "flashViewLayerRenderID"));
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v5, "setExternalFlashLayerContextID:", objc_msgSend(*(id *)(a1 + 40), "flashViewLayerContextID"));
    }
    [v4 setScreenshotOptions:v5 forScreen:*(void *)(*(void *)(a1 + 32) + 112)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    v7 = *(void **)(a1 + 32);
    v8 = [v7 _screenshotPresentationOptions];
    [WeakRetained interactiveScreenshotGestureManager:v7 requestsScreenshotWithOptionsCollection:v4 presentationOptions:v8];

    uint64_t v9 = *(void *)(a1 + 72);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_4;
    v30[3] = &unk_1E6AFA1B8;
    id v10 = *(void **)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 32);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_6;
    v29[3] = &unk_1E6AFA1B8;
    v29[4] = v31;
    [v10 commitInteractionWithScreenshotImage:v3 screenshotInterfaceOrientation:v9 settlingCompletionHandler:v30 flashCompletionHandler:v29];
    id v11 = [*(id *)(a1 + 48) hostWindow];

    if (!v11)
    {
      v12 = [[SBInteractiveScreenshotGestureHostRootViewController alloc] initWithScreen:*(void *)(*(void *)(a1 + 32) + 112)];
      v13 = [SBInteractiveScreenshotGestureHostWindow alloc];
      uint64_t v14 = *(void **)(a1 + 32);
      uint64_t v15 = v14[20];
      unint64_t v16 = [v14 description];
      uint64_t v17 = [(SBWindow *)v13 initWithWindowScene:v15 rootViewController:v12 role:@"SBTraitsParticipantRoleInteractiveScreenshotGesture" debugName:v16];

      [(SBInteractiveScreenshotGestureHostWindow *)v17 setWindowLevel:*MEMORY[0x1E4F43958] + 2.0];
      [*(id *)(a1 + 48) setHostWindow:v17];
    }
    uint64_t v18 = [*(id *)(a1 + 48) hostRootViewController];
    uint64_t v19 = [*(id *)(a1 + 48) rootWindow];
    objc_msgSend(v18, "setHostingContextID:pid:", objc_msgSend(v19, "_contextId"), getpid());

    v20 = [*(id *)(a1 + 48) hostWindow];
    [v20 setHidden:0];

    uint64_t v21 = *(void **)(*(void *)(a1 + 32) + 152);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_9;
    v26[3] = &unk_1E6AFF260;
    id v22 = *(id *)(a1 + 56);
    uint64_t v23 = *(void *)(a1 + 32);
    id v27 = v22;
    uint64_t v28 = v23;
    [v21 requestTransitionWithOptions:0 builder:&__block_literal_global_30_4 validator:v26];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    uint64_t v24 = *(void *)(a1 + 32);
    v25 = *(void **)(v24 + 72);
    *(void *)(v24 + 72) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 0;
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCommitWorkspaceTransactionBlock:&__block_literal_global_257];
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setHasFinishedSettlingAnimation:1];
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCommitWorkspaceTransactionBlock:&__block_literal_global_25];
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 setHasFinishedFlashAnimation:1];
}

void __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setSource:11];
  [v2 setEventLabel:@"BInteractiveScreenshotGestureCommit"];
}

uint64_t __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_9(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_10;
  v7[3] = &unk_1E6AFF610;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  [a2 setTransactionProvider:v7];

  return 1;
}

SBInteractiveScreenshotCommitWorkspaceTransaction *__117__SBInteractiveScreenshotGestureManager_interactiveScreenshotGestureRootViewController_gestureDidCompleteWithIntent___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[SBInteractiveScreenshotCommitWorkspaceTransaction alloc] initWithTransitionRequest:v3 gestureSessionID:*(void *)(a1 + 32)];

  [(SBInteractiveScreenshotCommitWorkspaceTransaction *)v4 addObserver:*(void *)(a1 + 40)];
  [(SBInteractiveScreenshotCommitWorkspaceTransaction *)v4 setInteractiveScreenshotCommitDelegate:*(void *)(a1 + 40)];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 64), v4);
  [*(id *)(a1 + 40) _performPendingCommitWorkspaceTransactionBlocksWithTransaction:*(void *)(*(void *)(a1 + 40) + 64)];
  return v4;
}

- (void)interactiveScreenshotGestureRootViewControllerRequestsGestureRecognizerCancellation:(id)a3
{
  [(SBCornerPencilPanGestureRecognizer *)self->_bottomLeftPencilGestureRecognizer setEnabled:0];
  [(SBCornerPencilPanGestureRecognizer *)self->_bottomRightPencilGestureRecognizer setEnabled:0];
  [(SBCornerFingerPanGestureRecognizer *)self->_bottomLeftFingerGestureRecognizer setEnabled:0];
  [(SBCornerFingerPanGestureRecognizer *)self->_bottomRightFingerGestureRecognizer setEnabled:0];
  [(SBCornerPencilPanGestureRecognizer *)self->_bottomLeftPencilGestureRecognizer setEnabled:1];
  [(SBCornerPencilPanGestureRecognizer *)self->_bottomRightPencilGestureRecognizer setEnabled:1];
  [(SBCornerFingerPanGestureRecognizer *)self->_bottomLeftFingerGestureRecognizer setEnabled:1];
  bottomRightFingerGestureRecognizer = self->_bottomRightFingerGestureRecognizer;
  [(SBCornerFingerPanGestureRecognizer *)bottomRightFingerGestureRecognizer setEnabled:1];
}

- (void)eventSource:(id)a3 userTouchedApplication:(id)a4
{
  if (a4)
  {
    BSContinuousMachTimeNow();
    self->_lastApplicationTouchTime = v5;
  }
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3 = a3;
  id v4 = +[SBDefaults localDefaults];
  double v5 = [v4 cornerGestureDefaults];

  uint64_t v6 = objc_opt_class();
  id v7 = v3;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = +[SBDefaults localDefaults];
    id v11 = [v10 appSwitcherDefaults];
    uint64_t v12 = [v11 chamoisWindowingEnabled] ^ 1;

    uint64_t v13 = [v9 corner];
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    id v15 = v7;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = 0;
      }
    }
    else
    {
      unint64_t v16 = 0;
    }
    id v17 = v16;

    uint64_t v13 = [v17 corner];
    uint64_t v12 = 2;
  }
  if ([v5 bottomLeftCornerGestureFeature]) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = ([v5 bottomLeftCornerGestureTouchTypes] & v12) != 0;
  }
  if ([v5 bottomRightCornerGestureFeature]) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = ([v5 bottomRightCornerGestureTouchTypes] & v12) != 0;
  }
  if (v13 != 8)
  {
    if (v13 == 4)
    {
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
      {
        if (!v19) {
          goto LABEL_24;
        }
      }
      else if (!v18)
      {
        goto LABEL_24;
      }
      BOOL v20 = 1;
      goto LABEL_30;
    }
LABEL_24:
    BOOL v20 = 0;
    goto LABEL_30;
  }
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    BOOL v20 = v18;
  }
  else {
    BOOL v20 = v19;
  }
LABEL_30:

  return v20;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SBInteractiveScreenshotSettings *)self->_settings isEnabled]
    && !self->_isCapturingScreenshot
    && (self->_lastApplicationTouchTime == -1.79769313e308
     || (BSContinuousMachTimeNow(),
         double v11 = v10 - self->_lastApplicationTouchTime,
         [(SBInteractiveScreenshotSettings *)self->_settings applicationTouchDelayHysteresis], v11 > v12)))
  {
    uint64_t v13 = objc_opt_class();
    id v14 = v6;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        id v15 = v14;
      }
      else {
        id v15 = 0;
      }
    }
    else
    {
      id v15 = 0;
    }
    id v16 = v15;

    if (v16 && ![v16 shouldReceiveTouch:v7])
    {
      char v8 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v18 = [WeakRetained interactiveScreenshotGestureManagerShouldPreventGestureRecognition:self];

      char v8 = v18 ^ 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)handleRemoteTransientOverlayPresentationRequest:(id)a3 forSession:(id)a4
{
  id v5 = a3;
  if ([v5 isScreenshotMarkup] && self->_hasInitiatedCommit)
  {
    id v6 = [v5 viewController];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__SBInteractiveScreenshotGestureManager_handleRemoteTransientOverlayPresentationRequest_forSession___block_invoke;
    v10[3] = &unk_1E6B07720;
    id v11 = v6;
    id v7 = v6;
    [(SBInteractiveScreenshotGestureManager *)self _performCommitWorkspaceTransactionBlock:v10];

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __100__SBInteractiveScreenshotGestureManager_handleRemoteTransientOverlayPresentationRequest_forSession___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setScreenshotMarkupTransientOverlayViewController:*(void *)(a1 + 32)];
}

- (id)acquireDisableGestureAssertionWithReason:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __82__SBInteractiveScreenshotGestureManager_acquireDisableGestureAssertionWithReason___block_invoke;
  id v15 = &unk_1E6AF4FB8;
  objc_copyWeak(&v16, &location);
  id v6 = (void *)[v5 initWithIdentifier:@"com.apple.SpringBoard.SBInteractiveScreenshotGestureManager.disableGesture" forReason:v4 invalidationBlock:&v12];
  disableGestureAssertions = self->_disableGestureAssertions;
  if (!disableGestureAssertions)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v9 = (NSMutableSet *)objc_msgSend(v8, "initWithCapacity:", 1, v12, v13, v14, v15);
    double v10 = self->_disableGestureAssertions;
    self->_disableGestureAssertions = v9;

    disableGestureAssertions = self->_disableGestureAssertions;
  }
  -[NSMutableSet addObject:](disableGestureAssertions, "addObject:", v6, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

void __82__SBInteractiveScreenshotGestureManager_acquireDisableGestureAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[10] removeObject:v6];
    if (![v4[10] count])
    {
      id v5 = v4[10];
      v4[10] = 0;
    }
  }
}

- (void)_handleInteractiveScreenshotGesture:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  id v6 = +[SBDefaults localDefaults];
  id v7 = [v6 cornerGestureDefaults];

  unint64_t v8 = [(SBInteractiveScreenshotGestureManager *)self _touchTypeForGestureRecognizer:v4];
  if (([v7 cornerGestureRequiresEducation] & v8) != 0)
  {
    if (v5 == 1)
    {
      uint64_t v9 = [v4 corner];
      double v10 = SBLogSystemGesture();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v41 = 134217984;
        uint64_t v42 = v9;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "Interactive screenshot gesture recognized for corner %lu that requires education", (uint8_t *)&v41, 0xCu);
      }

      if (v9 == 8)
      {
        BOOL v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
        uint64_t v12 = 9;
        uint64_t v13 = 7;
      }
      else
      {
        if (v9 != 4)
        {
          uint64_t v22 = 0;
LABEL_24:
          uint64_t v23 = [(id)SBApp productivityGestureEducationController];
          [v23 gestureActivatedForType:v22];

          goto LABEL_45;
        }
        BOOL v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
        uint64_t v12 = 7;
        uint64_t v13 = 9;
      }
      if (v11) {
        uint64_t v22 = v13;
      }
      else {
        uint64_t v22 = v12;
      }
      goto LABEL_24;
    }
  }
  else
  {
    if (v5 == 1)
    {
      if (!self->_asynchronousRenderingAssertion
        && [(SBInteractiveScreenshotSettings *)self->_settings shouldAsynchronouslyRender])
      {
        id v14 = [[SBAsynchronousRenderingAssertion alloc] initWithReason:@"SBInteractiveScreenshotGestureManager"];
        asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
        self->_asynchronousRenderingAssertion = v14;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (!self->_activeGestureSessionID
        && ([MEMORY[0x1E4F29128] UUID],
            id v17 = (NSUUID *)objc_claimAutoreleasedReturnValue(),
            activeGestureSessionID = self->_activeGestureSessionID,
            self->_activeGestureSessionID = v17,
            activeGestureSessionID,
            !self->_activeGestureSessionID)
        || (-[NSMutableDictionary objectForKey:](self->_sessionIDToSession, "objectForKey:"),
            (BOOL v19 = (_SBInteractiveScreenshotGestureSession *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        BOOL v20 = [(NSHashTable *)self->_weakReusableGestureRootWindows anyObject];
        if (v20)
        {
          [(NSHashTable *)self->_weakReusableGestureRootWindows removeObject:v20];
          uint64_t v21 = v20;
        }
        else
        {
          uint64_t v21 = [(_UIRootWindow *)[SBInteractiveScreenshotGestureRootWindow alloc] initWithScreen:self->_screen];
        }
        uint64_t v24 = v21;
        if (![(NSHashTable *)self->_weakReusableGestureRootWindows count])
        {
          weakReusableGestureRootWindows = self->_weakReusableGestureRootWindows;
          self->_weakReusableGestureRootWindows = 0;
        }
        id v26 = [(SBInteractiveScreenshotGestureRootWindow *)v24 rootViewController];

        if (!v26)
        {
          id v27 = [[SBInteractiveScreenshotGestureRootViewController alloc] initWithWindowScene:self->_windowScene];
          [(SBInteractiveScreenshotGestureRootViewController *)v27 setDelegate:self];
          [(SBInteractiveScreenshotGestureRootWindow *)v24 setRootViewController:v27];
        }
        BOOL v19 = [[_SBInteractiveScreenshotGestureSession alloc] initWithSessionID:self->_activeGestureSessionID];
        [(_SBInteractiveScreenshotGestureSession *)v19 setRootWindow:v24];
        sessionIDToSession = self->_sessionIDToSession;
        if (!sessionIDToSession)
        {
          v29 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
          uint64_t v30 = self->_sessionIDToSession;
          self->_sessionIDToSession = v29;

          sessionIDToSession = self->_sessionIDToSession;
        }
        [(NSMutableDictionary *)sessionIDToSession setObject:v19 forKey:self->_activeGestureSessionID];
      }
      uint64_t v31 = [(NSMutableSet *)self->_disableGestureAssertions count];
      BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
      uint64_t v33 = 2;
      if (v31)
      {
        uint64_t v33 = 3;
        int v34 = IsReduceMotionEnabled;
      }
      else
      {
        int v34 = 1;
      }
      if (IsReduceMotionEnabled) {
        BOOL v35 = v33;
      }
      else {
        BOOL v35 = v31 != 0;
      }
      v36 = [(_SBInteractiveScreenshotGestureSession *)v19 rootViewController];
      [v36 setGestureStyle:v35];

      v37 = [(_SBInteractiveScreenshotGestureSession *)v19 rootWindow];
      [v37 setHidden:0];
      [v37 layoutIfNeeded];
      BOOL v38 = [(SBInteractiveScreenshotSettings *)self->_settings shouldPreheat];
      if (v34 == 1 && v38)
      {
        v39 = [(SBInteractiveScreenshotGestureManager *)self _screenshotPresentationOptions];
        [WeakRetained interactiveScreenshotGestureManager:self requestsScreenshotPreheatWithPresentationOptions:v39];
      }
    }
    else if (self->_activeGestureSessionID)
    {
      -[NSMutableDictionary objectForKey:](self->_sessionIDToSession, "objectForKey:");
      BOOL v19 = (_SBInteractiveScreenshotGestureSession *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v19 = 0;
    }
    v40 = [(_SBInteractiveScreenshotGestureSession *)v19 rootViewController];
    [v40 handlePanGestureRecognizerAction:v4];
  }
LABEL_45:
}

- (void)_invalidateSessionID:(id)a3
{
  if (a3)
  {
    activeGestureSessionID = self->_activeGestureSessionID;
    id v5 = a3;
    if ([(NSUUID *)activeGestureSessionID isEqual:v5])
    {
      id v6 = self->_activeGestureSessionID;
      self->_activeGestureSessionID = 0;
    }
    id v18 = [(NSMutableDictionary *)self->_sessionIDToSession objectForKey:v5];
    [(NSMutableDictionary *)self->_sessionIDToSession removeObjectForKey:v5];

    id v7 = [v18 rootViewController];
    [v7 invalidate];

    unint64_t v8 = [v18 hostRootViewController];
    [v8 invalidate];

    uint64_t v9 = [v18 rootWindow];
    double v10 = v9;
    if (v9)
    {
      [v9 setHidden:1];
      [v10 setRootViewController:0];
      weakReusableGestureRootWindows = self->_weakReusableGestureRootWindows;
      if (!weakReusableGestureRootWindows)
      {
        uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        uint64_t v13 = self->_weakReusableGestureRootWindows;
        self->_weakReusableGestureRootWindows = v12;

        weakReusableGestureRootWindows = self->_weakReusableGestureRootWindows;
      }
      [(NSHashTable *)weakReusableGestureRootWindows addObject:v10];
    }
    id v14 = [v18 hostWindow];
    id v15 = v14;
    if (v14)
    {
      [v14 setHidden:1];
      [v15 setRootViewController:0];
    }
    if (![(NSMutableDictionary *)self->_sessionIDToSession count])
    {
      sessionIDToSession = self->_sessionIDToSession;
      self->_sessionIDToSession = 0;

      [(BSSimpleAssertion *)self->_asynchronousRenderingAssertion invalidate];
      asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
      self->_asynchronousRenderingAssertion = 0;
    }
  }
}

- (void)_performCommitWorkspaceTransactionBlock:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_hasInitiatedCommit)
  {
    commitTransaction = self->_commitTransaction;
    if (commitTransaction)
    {
      (*((void (**)(id, SBInteractiveScreenshotCommitWorkspaceTransaction *))v4 + 2))(v4, commitTransaction);
    }
    else
    {
      pendingCommitWorkspaceTransactionBlocks = self->_pendingCommitWorkspaceTransactionBlocks;
      if (!pendingCommitWorkspaceTransactionBlocks)
      {
        id v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
        unint64_t v8 = self->_pendingCommitWorkspaceTransactionBlocks;
        self->_pendingCommitWorkspaceTransactionBlocks = v7;

        pendingCommitWorkspaceTransactionBlocks = self->_pendingCommitWorkspaceTransactionBlocks;
      }
      uint64_t v9 = (void *)MEMORY[0x1D948C7A0](v10);
      [(NSMutableArray *)pendingCommitWorkspaceTransactionBlocks addObject:v9];
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_performPendingCommitWorkspaceTransactionBlocksWithTransaction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSMutableArray *)self->_pendingCommitWorkspaceTransactionBlocks copy];
  pendingCommitWorkspaceTransactionBlocks = self->_pendingCommitWorkspaceTransactionBlocks;
  self->_pendingCommitWorkspaceTransactionBlocks = 0;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_screenshotPresentationOptions
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F99DE0]);
  [v2 setPresentationMode:2];
  return v2;
}

- (unint64_t)_touchTypeForGestureRecognizer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    unint64_t v8 = 1;
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v5;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = (uint64_t)v10;
      }
      else {
        uint64_t v9 = 0;
      }
    }

    unint64_t v8 = 2 * (v9 != 0);
  }

  return v8;
}

- (SBInteractiveScreenshotGestureManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBInteractiveScreenshotGestureManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_weakReusableGestureRootWindows, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sessionIDToSession, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_storeStrong((id *)&self->_pendingCommitWorkspaceTransactionBlocks, 0);
  objc_storeStrong((id *)&self->_disableGestureAssertions, 0);
  objc_storeStrong((id *)&self->_commitTransactionDisableGestureAssertion, 0);
  objc_storeStrong((id *)&self->_commitTransaction, 0);
  objc_storeStrong((id *)&self->_bottomRightFingerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomRightPencilGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomLeftFingerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomLeftPencilGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, 0);
  objc_storeStrong((id *)&self->_appInteractionEventSource, 0);
  objc_storeStrong((id *)&self->_activeGestureSessionID, 0);
}

@end