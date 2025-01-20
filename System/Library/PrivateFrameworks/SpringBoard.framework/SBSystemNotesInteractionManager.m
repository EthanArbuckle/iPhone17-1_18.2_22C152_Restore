@interface SBSystemNotesInteractionManager
- (BOOL)_gestureIsActive;
- (BOOL)_gestureRecognizerIsActive:(id)a3;
- (BOOL)_isSystemNotesForegroundActive;
- (BOOL)_panRecognizerOverFlickThreshold:(id)a3;
- (BOOL)_shouldEdgeProtectGestureRecognizer:(id)a3;
- (BOOL)canHandlePresentationRequests:(id *)a3;
- (BOOL)contentContainerAdapterShouldUpdateUIForStashing:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)initialStashStateForContentContainerAdapter:(id)a3;
- (BOOL)interactionControllerScalesDuringPanGesture:(id)a3;
- (CGPoint)_convertReferenceVelocity:(CGPoint)result toOrientation:(int64_t)a4;
- (CGPoint)_orientedLocationForReferenceLocation:(CGPoint)a3;
- (CGPoint)_pointForGestureCorner:(unint64_t)a3;
- (SBSystemNotesInteractionManager)initWithWorkspace:(id)a3 systemGestureManager:(id)a4 systemPointerInteractionManager:(id)a5 dataSource:(id)a6 delegate:(id)a7;
- (UIEdgeInsets)interactionController:(id)a3 edgeInsetsForWindowScene:(id)a4;
- (UIEdgeInsets)interactionController:(id)a3 stashedPaddingForWindowScene:(id)a4;
- (double)_absoluteScaleForInteractiveSystemNotesGesture:(id)a3;
- (double)_absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:(id)a3;
- (double)_cornerDistanceBeforeScalingForDismissGestureRecognizer:(id)a3;
- (double)_flickVelocityThresholdForGestureRecognizer:(id)a3;
- (double)_panDistanceBeforeScalingForGestureRecognizer:(id)a3;
- (double)_panDistancePer1xScalingForGestureRecognizer:(id)a3;
- (double)_panInitialThumbnailScaleForGestureRecognizer:(id)a3;
- (double)_scaleThresholdBeforeFullSizeForGestureRecognizer:(id)a3;
- (id)_gestureSettingsForRecognizer:(id)a3;
- (id)debugName;
- (id)defaultPositionHyperregionComposers;
- (id)interactionControllerConnectedWindowScenes:(id)a3;
- (id)layoutSettings;
- (id)systemGestureManagerForInteractionControllerResizing:(id)a3;
- (id)systemPointerInteractionManagerForInteractionController:(id)a3;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (int64_t)_presentationModeForGestureBegin;
- (unint64_t)_cornerForGestureRecognizer:(id)a3;
- (unint64_t)_cornersForAllSwipes;
- (unint64_t)_cornersForTouchType:(int64_t)a3;
- (unint64_t)_touchTypeForGestureRecognizer:(id)a3;
- (unint64_t)startingPositionForExternalPresentationRequest;
- (void)_cancelGestureIfNecessary:(id)a3 reason:(id)a4;
- (void)_handleInteractiveSwipeInGesture:(id)a3;
- (void)_handleInteractiveSystemNotesGesture:(id)a3;
- (void)_handleNonInteractiveSwipeInGesture:(id)a3;
- (void)_interactionController:(id)a3 updateScaleInteractorForSwipeToDismiss:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6;
- (void)_interactionController:(id)a3 updateScaleInteractorForSwipeToPresent:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6;
- (void)_setupFingerGestureRecognizers;
- (void)_setupForInteractiveDismissal;
- (void)_setupPencilGestureRecognizers;
- (void)_springBoardBootCompleted:(id)a3;
- (void)_updateFailureRequirements;
- (void)_updateFingerGestureEnablement;
- (void)_updateStashPadding;
- (void)collapseAnimated:(BOOL)a3;
- (void)contentContainerAdapter:(id)a3 handleDestructionRequestForSceneHandle:(id)a4;
- (void)contentContainerAdapter:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4;
- (void)contentContainerAdapter:(id)a3 willUpdateStashState:(BOOL)a4;
- (void)contentContainerAdapterDidEndInteraction:(id)a3 targetWindowScene:(id)a4;
- (void)contentContainerAdapterPanGestureDidEnd:(id)a3;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)expandAnimated:(BOOL)a3;
- (void)interactionController:(id)a3 updateScaleInteractor:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6;
- (void)peepAnimated:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBSystemNotesInteractionManager

- (SBSystemNotesInteractionManager)initWithWorkspace:(id)a3 systemGestureManager:(id)a4 systemPointerInteractionManager:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  v47[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v43 = a5;
  id v14 = a6;
  id v15 = a7;
  v46.receiver = self;
  v46.super_class = (Class)SBSystemNotesInteractionManager;
  v16 = [(SBSystemNotesInteractionManager *)&v46 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_systemGestureManager, a4);
    objc_storeStrong((id *)&v17->_systemPointerInteractionManager, a5);
    objc_storeStrong((id *)&v17->_dataSource, a6);
    objc_storeStrong((id *)&v17->_delegate, a7);
    uint64_t v18 = [v12 pipCoordinator];
    pipCoordinator = v17->_pipCoordinator;
    v17->_pipCoordinator = (SBPIPControllerCoordinator *)v18;

    v20 = [(id)SBApp windowSceneManager];
    v21 = [v20 embeddedDisplayWindowScene];
    v40 = [v21 zStackResolver];

    uint64_t v22 = [v40 acquireParticipantWithIdentifier:4 delegate:v17];
    zStackParticipant = v17->_zStackParticipant;
    v17->_zStackParticipant = (SBFZStackParticipant *)v22;

    [(SBFZStackParticipant *)v17->_zStackParticipant setNeedsUpdatePreferencesWithReason:@"init"];
    uint64_t v24 = +[SBSystemNotesSettingsDomain rootSettings];
    pipSettings = v17->_pipSettings;
    v17->_pipSettings = (SBSystemNotesSettings *)v24;

    [(SBSystemNotesInteractionManager *)v17 _setupPencilGestureRecognizers];
    [(SBSystemNotesInteractionManager *)v17 _setupFingerGestureRecognizers];
    [(SBSystemNotesInteractionManager *)v17 _updateFailureRequirements];
    [(SBSystemNotesInteractionManager *)v17 _updateStashPadding];
    v26 = +[SBDefaults localDefaults];
    v27 = [v26 cornerGestureDefaults];

    id v42 = v12;
    id v28 = v13;
    v29 = [NSString stringWithUTF8String:"bottomLeftCornerGestureFeature"];
    v47[0] = v29;
    [NSString stringWithUTF8String:"bottomLeftCornerGestureTouchTypes"];
    v30 = id v41 = v15;
    v47[1] = v30;
    v31 = [NSString stringWithUTF8String:"bottomRightCornerGestureFeature"];
    v47[2] = v31;
    v32 = [NSString stringWithUTF8String:"bottomRightCornerGestureTouchTypes"];
    v47[3] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:4];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __126__SBSystemNotesInteractionManager_initWithWorkspace_systemGestureManager_systemPointerInteractionManager_dataSource_delegate___block_invoke;
    v44[3] = &unk_1E6AF4AC0;
    id v34 = v14;
    v35 = v17;
    v45 = v35;
    id v36 = (id)[v27 observeDefaults:v33 onQueue:MEMORY[0x1E4F14428] withBlock:v44];

    id v13 = v28;
    id v12 = v42;

    id v15 = v41;
    v37 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v38 = v35;
    id v14 = v34;
    [v37 addObserver:v38 selector:sel__springBoardBootCompleted_ name:@"SBBootCompleteNotification" object:0];
  }
  return v17;
}

uint64_t __126__SBSystemNotesInteractionManager_initWithWorkspace_systemGestureManager_systemPointerInteractionManager_dataSource_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStashPadding];
}

- (void)_springBoardBootCompleted:(id)a3
{
  [(SBSystemNotesInteractionManager *)self _updateFingerGestureEnablement];
  [(SBSystemNotesInteractionManager *)self _updateFailureRequirements];
}

- (void)peepAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = SBLogSystemNotes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBSystemNotesInteractionManager peepAnimated:]();
  }

  [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForSwipesFromCorners:[(SBSystemNotesInteractionManager *)self _cornersForAllSwipes] animated:v3];
  [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForStandardBehavior];
}

- (void)expandAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentPresentationModeForInteractionManager:self];
  uint64_t v6 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];
  v7 = (void *)v6;
  if (v5 != -1 && v6 != 0)
  {
    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsStartSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionExpandNotes"];
    v9 = [v7 interactionController];
    v10 = +[SBPIPContentViewLayoutMetrics systemNotesMetricsForPresentationMode:0];
    double v11 = SBSystemNotesDefaultWindowSize();
    if (v3) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    [v9 setPlatformMetrics:v10 contentSize:v12 animationBehavior:v11];

    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsUpdatePresentationMode:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__SBSystemNotesInteractionManager_expandAnimated___block_invoke;
    v14[3] = &unk_1E6AF4AC0;
    v14[4] = self;
    [v7 performAfterInFlightAnimationsComplete:v14];
    id v13 = SBLogSystemNotes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SBSystemNotesInteractionManager peepAnimated:]();
    }
  }
}

uint64_t __50__SBSystemNotesInteractionManager_expandAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) interactionManager:*(void *)(a1 + 32) requestsStopSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionExpandNotes"];
}

- (void)collapseAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentPresentationModeForInteractionManager:self];
  uint64_t v6 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];
  v7 = (void *)v6;
  if (v5 != -1 && v6 != 0)
  {
    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsStartSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionDismiss"];
    v9 = [v7 interactionController];
    v10 = +[SBPIPContentViewLayoutMetrics systemNotesMetricsForPresentationMode:1];
    double v11 = SBSystemNotesThumbnailSize();
    if (v3) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    [v9 setPlatformMetrics:v10 contentSize:v12 animationBehavior:v11];

    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsUpdatePresentationMode:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__SBSystemNotesInteractionManager_collapseAnimated___block_invoke;
    v13[3] = &unk_1E6AF4AC0;
    v13[4] = self;
    [v7 performAfterInFlightAnimationsComplete:v13];
  }
}

uint64_t __52__SBSystemNotesInteractionManager_collapseAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) interactionManager:*(void *)(a1 + 32) requestsStopSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionDismiss"];
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(void))a4;
  v8 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];
  v9 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedPIPContentViewControllerForInteractionManager:self];
  self->_edgeProtectState = 0;
  if (([v8 isStashed] & 1) != 0 || !v4)
  {
    id v14 = SBLogSystemNotes();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SBSystemNotesInteractionManager dismissAnimated:completion:]();
    }

    v7[2](v7);
    self->_cornerDismissState = 0;
    [(BSInvalidatable *)self->_edgeProtectStashAssertion invalidate];
    edgeProtectStashAssertion = self->_edgeProtectStashAssertion;
    self->_edgeProtectStashAssertion = 0;

    id v13 = SBLogSystemNotes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SBSystemNotesInteractionManager dismissAnimated:completion:]();
    }
  }
  else if (v8 && v9)
  {
    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsStartSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionDismiss"];
    self->_isDismissingNonInteractively = 1;
    unsigned int v10 = self->_nonInteractiveDismissGenCount + 1;
    self->_nonInteractiveDismissGenCount = v10;
    double v11 = SBLogSystemNotes();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543618;
      v25 = v16;
      __int16 v26 = 1024;
      unsigned int v27 = v10;
      _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%u][Begin] animated dismiss", buf, 0x12u);
    }
    [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForSwipesFromCorners:[(SBSystemNotesInteractionManager *)self _cornersForAllSwipes] animated:1];
    [v8 setInteractionsEnabled:0];
    uint64_t v12 = (void *)MEMORY[0x1E4F42FF0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke;
    v22[3] = &unk_1E6AF4AC0;
    v23 = v9;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_2;
    v17[3] = &unk_1E6B0DC20;
    v17[4] = self;
    SEL v20 = a2;
    unsigned int v21 = v10;
    id v18 = v8;
    v19 = v7;
    [v12 animateWithDuration:0 delay:v22 options:v17 animations:0.5 completion:0.0];

    id v13 = v23;
  }
  else if (v8)
  {
    if (v9) {
      goto LABEL_13;
    }
    id v13 = SBLogSystemNotes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBSystemNotesInteractionManager dismissAnimated:completion:].cold.4();
    }
  }
  else
  {
    id v13 = SBLogSystemNotes();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SBSystemNotesInteractionManager dismissAnimated:completion:]();
    }
  }

LABEL_13:
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  CGAffineTransformMakeScale(&v4, 0.01, 0.01);
  [v2 setTransform:&v4];

  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 setAlpha:0.0];
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_2(uint64_t a1)
{
  v2 = SBLogSystemNotes();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_2_cold_1();
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_23;
  v6[3] = &unk_1E6B0DBF8;
  BOOL v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  int v8 = *(_DWORD *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  [v3 performAfterInFlightAnimationsComplete:v6];
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_23(uint64_t a1)
{
  v2 = SBLogSystemNotes();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_23_cold_2();
  }

  BOOL v3 = (uint64_t *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 32) + 8) interactionManager:*(void *)(a1 + 32) requestsStopSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionDismiss"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 108) && *(_DWORD *)(a1 + 56) == *(_DWORD *)(v4 + 112))
  {
    *(unsigned char *)(v4 + 108) = 0;
    uint64_t v4 = *v3;
  }
  [*(id *)(v4 + 152) invalidate];
  long long v5 = *(void **)(*v3 + 152);
  *(void *)(*v3 + 152) = 0;

  uint64_t v6 = SBLogSystemNotes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_23_cold_1();
  }
}

- (BOOL)canHandlePresentationRequests:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if ([(SBSystemNotesInteractionManager *)self _isSystemNotesForegroundActive])
  {
    uint64_t v4 = +[SBSetupManager sharedInstance];
    int v5 = [v4 isInSetupMode];

    if (v5)
    {
      if (a3)
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F28568];
        v17 = @"cannot handle presentation as we're in buddy";
        long long v7 = (void *)MEMORY[0x1E4F1C9E8];
        int v8 = &v17;
        v9 = &v16;
LABEL_7:
        unsigned int v10 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];
        *a3 = [v6 errorWithDomain:@"SBPIPSceneContentPresentationErrorDomain" code:7 userInfo:v10];
      }
    }
    else
    {
      uint64_t v12 = +[SBLockScreenManager sharedInstance];
      int v13 = [v12 isUILocked];

      if (!v13) {
        return 1;
      }
      if (a3)
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F28568];
        id v15 = @"cannot handle presentation as we're UI locked";
        long long v7 = (void *)MEMORY[0x1E4F1C9E8];
        int v8 = &v15;
        v9 = &v14;
        goto LABEL_7;
      }
    }
  }
  else if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"cannot handle presentation as we're currently obscured";
    long long v7 = (void *)MEMORY[0x1E4F1C9E8];
    int v8 = (__CFString **)v19;
    v9 = &v18;
    goto LABEL_7;
  }
  return 0;
}

- (void)zStackParticipantDidChange:(id)a3
{
  if (![(SBSystemNotesInteractionManager *)self _isSystemNotesForegroundActive])
  {
    [(SBSystemNotesInteractionManager *)self _cancelGestureIfNecessary:self->_leftFingerSystemCornerGestureRecognizer reason:@"canceling system notes gesture as zStack has marked us as not foreground active"];
    [(SBSystemNotesInteractionManager *)self _cancelGestureIfNecessary:self->_rightFingerSystemCornerGestureRecognizer reason:@"canceling system notes gesture as zStack has marked us as not foreground active"];
    [(SBSystemNotesInteractionManager *)self _cancelGestureIfNecessary:self->_leftPencilSystemCornerGestureRecognizer reason:@"canceling system notes gesture as zStack has marked us as not foreground active"];
    rightPencilSystemCornerGestureRecognizer = self->_rightPencilSystemCornerGestureRecognizer;
    [(SBSystemNotesInteractionManager *)self _cancelGestureIfNecessary:rightPencilSystemCornerGestureRecognizer reason:@"canceling system notes gesture as zStack has marked us as not foreground active"];
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (BOOL)_isSystemNotesForegroundActive
{
  return [(SBFZStackParticipant *)self->_zStackParticipant activationState] == 0;
}

- (BOOL)initialStashStateForContentContainerAdapter:(id)a3
{
  return self->_edgeProtectState == 1;
}

- (void)contentContainerAdapter:(id)a3 willUpdateStashState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v9 = v6;
    [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForStandardBehavior];
  }
  else
  {
    edgeProtectStashAssertion = self->_edgeProtectStashAssertion;
    if (!edgeProtectStashAssertion) {
      goto LABEL_8;
    }
    id v9 = v6;
    ++self->_edgeProtectGenCount;
    if (self->_edgeProtectState == 2)
    {
      [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForStandardBehavior];
      edgeProtectStashAssertion = self->_edgeProtectStashAssertion;
    }
    self->_edgeProtectState = 0;
    [(BSInvalidatable *)edgeProtectStashAssertion invalidate];
    int v8 = self->_edgeProtectStashAssertion;
    self->_edgeProtectStashAssertion = 0;
  }
  id v6 = v9;
LABEL_8:
}

- (void)contentContainerAdapterDidEndInteraction:(id)a3 targetWindowScene:(id)a4
{
  unint64_t cornerDismissState = self->_cornerDismissState;
  if (-[SBSystemNotesInteractionManagerDataSource currentPresentationModeForInteractionManager:](self->_dataSource, "currentPresentationModeForInteractionManager:", self, a4) == 1)
  {
    id v6 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];
    char v7 = [v6 isStashed];

    if ((v7 & 1) == 0 && cornerDismissState <= 1)
    {
LABEL_4:
      positionRegionsComposer = self->_positionRegionsComposer;
      [(SBSystemNotesPositionHyperregionComposer *)positionRegionsComposer setupForStandardBehavior];
      return;
    }
  }
  else if (cornerDismissState < 2)
  {
    goto LABEL_4;
  }
  delegate = self->_delegate;
  [(SBSystemNotesInteractionManagerDelegate *)delegate interactionManager:self requestsNotesDismissalForSource:cornerDismissState > 1 animated:cornerDismissState < 2];
}

- (void)contentContainerAdapterPanGestureDidEnd:(id)a3
{
  if ([(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentPresentationModeForInteractionManager:self] == 1)
  {
    id v6 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];
    if ([v6 isStashed])
    {
    }
    else
    {
      BOOL panGestureIsSystemGesture = self->_panGestureIsSystemGesture;

      if (panGestureIsSystemGesture)
      {
        delegate = self->_delegate;
        [(SBSystemNotesInteractionManagerDelegate *)delegate interactionManager:self requestsNotesDismissalForSource:2 animated:1];
      }
    }
  }
}

- (void)contentContainerAdapter:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4
{
  id v8 = a3;
  id v6 = (SBCornerFingerPanGestureRecognizer *)a4;
  ++self->_edgeProtectGenCount;
  if (self->_edgeProtectState == 2) {
    [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForStandardBehavior];
  }
  self->_edgeProtectState = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_initialInteractorPanPresentationMode = [(SBSystemNotesInteractionManager *)self _presentationModeForGestureBegin];
    BOOL v7 = self->_leftFingerSystemCornerGestureRecognizer == v6
      || self->_rightFingerSystemCornerGestureRecognizer == v6
      || (SBCornerFingerPanGestureRecognizer *)self->_leftPencilSystemCornerGestureRecognizer == v6
      || self->_rightPencilSystemCornerGestureRecognizer == (SBCornerPencilPanGestureRecognizer *)v6;
    self->_BOOL panGestureIsSystemGesture = v7;
  }
}

- (BOOL)contentContainerAdapterShouldUpdateUIForStashing:(id)a3
{
  return self->_initialInteractorPanPresentationMode != 1;
}

- (void)contentContainerAdapter:(id)a3 handleDestructionRequestForSceneHandle:(id)a4
{
  dataSource = self->_dataSource;
  id v6 = a4;
  BOOL v7 = [(SBSystemNotesInteractionManagerDataSource *)dataSource presentedContainerViewControllerForInteractionManager:self];
  id v8 = [v7 hostedAppSceneHandle];
  int v9 = [v6 isEqual:v8];

  if (v9)
  {
    delegate = self->_delegate;
    [(SBSystemNotesInteractionManagerDelegate *)delegate interactionManager:self requestsNotesDismissalForSource:4 animated:1];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v5 shouldReceiveTouch:v6];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SBSystemNotesInteractionManager *)self _cornerForGestureRecognizer:v4];
  unint64_t v6 = [(SBSystemNotesInteractionManager *)self _touchTypeForGestureRecognizer:v4];

  char v7 = +[SBDefaults localDefaults];
  id v8 = [v7 cornerGestureDefaults];

  BOOL v9 = [v8 bottomLeftCornerGestureFeature] == 1
    && (v6 & ~[v8 bottomLeftCornerGestureTouchTypes]) == 0;
  BOOL v10 = [v8 bottomRightCornerGestureFeature] == 1
     && (v6 & ~[v8 bottomRightCornerGestureTouchTypes]) == 0;
  if (v5 == 8)
  {
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
      BOOL v11 = v9;
    }
    else {
      BOOL v11 = v10;
    }
    if (!v11) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  if (v5 != 4)
  {
LABEL_19:
    BOOL v15 = 0;
    goto LABEL_22;
  }
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1)
  {
    if (v9) {
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  if (!v10) {
    goto LABEL_19;
  }
LABEL_16:
  uint64_t v12 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource launchApplicationIdentityForInteractionManager:self];
  int v13 = [(id)SBApp privacyPreflightController];
  char v14 = [v13 requiresPreflightForApplication:v12];

  BOOL v15 = (v14 & 1) == 0
     && [(SBSystemNotesInteractionManager *)self canHandlePresentationRequests:0];

LABEL_22:
  return v15;
}

- (unint64_t)_cornersForAllSwipes
{
  unint64_t v3 = [(SBSystemNotesInteractionManager *)self _cornersForTouchType:0];
  unint64_t v4 = [(SBSystemNotesInteractionManager *)self _cornersForTouchType:2] | v3;
  if (!v4)
  {
    unint64_t v5 = +[SBDefaults localDefaults];
    unint64_t v6 = [v5 cornerGestureDefaults];

    uint64_t v7 = [v6 bottomLeftCornerGestureTouchTypes];
    uint64_t v8 = [v6 bottomRightCornerGestureTouchTypes];
    uint64_t v9 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    uint64_t v10 = 8;
    if (v9 == 1) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 8;
    }
    if (v9 != 1) {
      uint64_t v10 = 4;
    }
    if (v7) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v8 == 0;
    }
    if (v12) {
      unint64_t v4 = v11;
    }
    else {
      unint64_t v4 = v10;
    }
  }
  return v4;
}

- (unint64_t)_cornersForTouchType:(int64_t)a3
{
  if (a3) {
    int v3 = 2 * (a3 == 2);
  }
  else {
    int v3 = 1;
  }
  unint64_t v4 = +[SBDefaults localDefaults];
  unint64_t v5 = [v4 cornerGestureDefaults];

  if ([v5 bottomLeftCornerGestureFeature] != 1
    || (~[v5 bottomLeftCornerGestureTouchTypes] & v3) != 0)
  {
    unint64_t v6 = 0;
  }
  else if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    unint64_t v6 = 8;
  }
  else
  {
    unint64_t v6 = 4;
  }
  if ([v5 bottomRightCornerGestureFeature] == 1
    && (~[v5 bottomRightCornerGestureTouchTypes] & v3) == 0)
  {
    uint64_t v7 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    uint64_t v8 = 8;
    if (v7 == 1) {
      uint64_t v8 = 4;
    }
    v6 |= v8;
  }

  return v6;
}

- (id)_gestureSettingsForRecognizer:(id)a3
{
  return [(SBSystemNotesSettings *)self->_pipSettings cornerSwipeMetricSettings];
}

- (double)_panDistanceBeforeScalingForGestureRecognizer:(id)a3
{
  int v3 = [(SBSystemNotesInteractionManager *)self _gestureSettingsForRecognizer:a3];
  [v3 panDistanceBeforeScaling];
  double v5 = v4;

  return v5;
}

- (double)_cornerDistanceBeforeScalingForDismissGestureRecognizer:(id)a3
{
  int v3 = [(SBSystemNotesInteractionManager *)self _gestureSettingsForRecognizer:a3];
  [v3 cornerDistanceBeforeScalingForDismiss];
  double v5 = v4;

  return v5;
}

- (double)_panInitialThumbnailScaleForGestureRecognizer:(id)a3
{
  int v3 = [(SBSystemNotesInteractionManager *)self _gestureSettingsForRecognizer:a3];
  [v3 panInitialThumbnailScale];
  double v5 = v4;

  return v5;
}

- (double)_panDistancePer1xScalingForGestureRecognizer:(id)a3
{
  int v3 = [(SBSystemNotesInteractionManager *)self _gestureSettingsForRecognizer:a3];
  [v3 panDistancePer1xScaling];
  double v5 = v4;

  return v5;
}

- (double)_scaleThresholdBeforeFullSizeForGestureRecognizer:(id)a3
{
  int v3 = [(SBSystemNotesInteractionManager *)self _gestureSettingsForRecognizer:a3];
  [v3 scaleThresholdBeforeFullSize];
  double v5 = v4;

  return v5;
}

- (double)_absoluteScaleForInteractiveSystemNotesGesture:(id)a3
{
  systemGestureManager = self->_systemGestureManager;
  id v5 = a3;
  unint64_t v6 = [(SBSystemGestureManager *)systemGestureManager windowForSystemGestures];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  -[SBSystemNotesInteractionManager _orientedLocationForReferenceLocation:](self, "_orientedLocationForReferenceLocation:", v8, v10);
  [(SBSystemNotesInteractionManager *)self _pointForGestureCorner:[(SBSystemNotesInteractionManager *)self _cornerForGestureRecognizer:v5]];
  UIDistanceBetweenPoints();
  double v12 = v11;
  [(SBSystemNotesInteractionManager *)self _panDistanceBeforeScalingForGestureRecognizer:v5];
  double v14 = v12 - v13;
  if (v14 >= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = 0.0;
  }
  [(SBSystemNotesInteractionManager *)self _panDistancePer1xScalingForGestureRecognizer:v5];
  double v17 = v15 / v16;
  [(SBSystemNotesInteractionManager *)self _panInitialThumbnailScaleForGestureRecognizer:v5];
  double v19 = v18;

  return v19 + v17;
}

- (double)_absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = SBSystemNotesDefaultWindowSize();
  double v6 = v5 / SBSystemNotesThumbnailSize();
  [(SBSystemNotesInteractionManager *)self _scaleThresholdBeforeFullSizeForGestureRecognizer:v4];
  double v8 = v7;

  return v8 * v6;
}

- (double)_flickVelocityThresholdForGestureRecognizer:(id)a3
{
  int v3 = [(SBSystemNotesInteractionManager *)self _gestureSettingsForRecognizer:a3];
  [v3 flickVelocityThreshold];
  double v5 = v4;

  return v5;
}

- (void)_setupPencilGestureRecognizers
{
  id v7 = [(SBSystemNotesSettings *)self->_pipSettings pencilSwipeGestureTuningSettings];
  int v3 = +[SBCornerPencilPanGestureRecognizer interactiveCornerPanGestureRecognizerWithSettings:v7 corner:4 target:self action:sel__handleInteractiveSystemNotesGesture_];
  leftPencilSystemCornerGestureRecognizer = self->_leftPencilSystemCornerGestureRecognizer;
  self->_leftPencilSystemCornerGestureRecognizer = v3;

  [(SBCornerPencilPanGestureRecognizer *)self->_leftPencilSystemCornerGestureRecognizer setDelegate:self];
  [(SBCornerPencilPanGestureRecognizer *)self->_leftPencilSystemCornerGestureRecognizer setName:@"SBSystemNotesManager.pencil.corner.left"];
  [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:self->_leftPencilSystemCornerGestureRecognizer withType:117];
  double v5 = +[SBCornerPencilPanGestureRecognizer interactiveCornerPanGestureRecognizerWithSettings:v7 corner:8 target:self action:sel__handleInteractiveSystemNotesGesture_];
  rightPencilSystemCornerGestureRecognizer = self->_rightPencilSystemCornerGestureRecognizer;
  self->_rightPencilSystemCornerGestureRecognizer = v5;

  [(SBCornerPencilPanGestureRecognizer *)self->_rightPencilSystemCornerGestureRecognizer setDelegate:self];
  [(SBCornerPencilPanGestureRecognizer *)self->_rightPencilSystemCornerGestureRecognizer setName:@"SBSystemNotesManager.pencil.corner.right"];
  [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:self->_rightPencilSystemCornerGestureRecognizer withType:118];
}

- (void)_setupFingerGestureRecognizers
{
  v16[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(SBSystemNotesSettings *)self->_pipSettings fingerSwipeGestureTuningSettings];
  double v4 = [[SBCornerFingerGestureClassifier alloc] initWithSettings:v3];
  double v5 = [[SBCornerFingerPanGestureRecognizer alloc] initWithTarget:self action:sel__handleInteractiveSystemNotesGesture_ corner:4 classifier:v4];
  leftFingerSystemCornerGestureRecognizer = self->_leftFingerSystemCornerGestureRecognizer;
  self->_leftFingerSystemCornerGestureRecognizer = v5;

  [(SBCornerFingerPanGestureRecognizer *)self->_leftFingerSystemCornerGestureRecognizer setDelegate:self];
  [(SBCornerFingerPanGestureRecognizer *)self->_leftFingerSystemCornerGestureRecognizer setName:@"SBSystemNotesManager.finger.corner.left"];
  id v7 = [[SBCornerFingerGestureClassifier alloc] initWithSettings:v3];
  double v8 = [[SBCornerFingerPanGestureRecognizer alloc] initWithTarget:self action:sel__handleInteractiveSystemNotesGesture_ corner:8 classifier:v7];
  rightFingerSystemCornerGestureRecognizer = self->_rightFingerSystemCornerGestureRecognizer;
  self->_rightFingerSystemCornerGestureRecognizer = v8;

  [(SBCornerFingerPanGestureRecognizer *)self->_rightFingerSystemCornerGestureRecognizer setDelegate:self];
  [(SBCornerFingerPanGestureRecognizer *)self->_rightFingerSystemCornerGestureRecognizer setName:@"SBSystemNotesManager.finger.corner.right"];
  double v10 = +[SBDefaults localDefaults];
  double v11 = [v10 appSwitcherDefaults];

  double v12 = [NSString stringWithUTF8String:"chamoisWindowingEnabled"];
  v16[0] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__SBSystemNotesInteractionManager__setupFingerGestureRecognizers__block_invoke;
  v15[3] = &unk_1E6AF4AC0;
  v15[4] = self;
  id v14 = (id)[v11 observeDefaults:v13 onQueue:MEMORY[0x1E4F14428] withBlock:v15];

  [(SBSystemNotesInteractionManager *)self _updateFingerGestureEnablement];
}

uint64_t __65__SBSystemNotesInteractionManager__setupFingerGestureRecognizers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFingerGestureEnablement];
}

- (void)_updateFingerGestureEnablement
{
  int v3 = [(id)SBApp windowSceneManager];
  double v4 = [v3 embeddedDisplayWindowScene];
  id v9 = [v4 switcherController];

  uint64_t v5 = [v9 windowManagementStyle];
  double v6 = [(SBCornerFingerPanGestureRecognizer *)self->_rightFingerSystemCornerGestureRecognizer view];

  if (v5 == 2)
  {
    if (v6) {
      [(SBSystemGestureManager *)self->_systemGestureManager removeGestureRecognizer:self->_rightFingerSystemCornerGestureRecognizer];
    }
    id v7 = [(SBCornerFingerPanGestureRecognizer *)self->_leftFingerSystemCornerGestureRecognizer view];

    if (v7) {
      [(SBSystemGestureManager *)self->_systemGestureManager removeGestureRecognizer:self->_leftFingerSystemCornerGestureRecognizer];
    }
  }
  else
  {
    if (!v6) {
      [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:self->_rightFingerSystemCornerGestureRecognizer withType:120];
    }
    double v8 = [(SBCornerFingerPanGestureRecognizer *)self->_leftFingerSystemCornerGestureRecognizer view];

    if (!v8) {
      [(SBSystemGestureManager *)self->_systemGestureManager addGestureRecognizer:self->_leftFingerSystemCornerGestureRecognizer withType:119];
    }
  }
}

- (void)_updateStashPadding
{
  unint64_t v3 = [(SBSystemNotesInteractionManager *)self _cornersForTouchType:0];
  unint64_t v4 = [(SBSystemNotesInteractionManager *)self _cornersForTouchType:2];
  double v5 = *MEMORY[0x1E4F437F8];
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  id v22 = [(SBSystemNotesSettings *)self->_pipSettings fingerSwipeGestureTuningSettings];
  [v22 maximumActiveDistance:1];
  double v10 = v9;
  [v22 maximumActiveDistance:0];
  double v12 = ceil(fmax(v10, v11) * SBMainScreenPointsPerMillimeter());
  double v13 = [(SBSystemNotesSettings *)self->_pipSettings pencilSwipeGestureTuningSettings];
  [v13 cornerVerticalEdgeLength];
  double v15 = v14;

  double v16 = fmax(v15, v12);
  if (v3) {
    double v17 = v12;
  }
  else {
    double v17 = v8;
  }
  if (!v3) {
    double v16 = v15;
  }
  if (v4) {
    double v18 = v16;
  }
  else {
    double v18 = v17;
  }
  double v19 = objc_msgSend((id)SBApp, "windowSceneManager", v16);
  SEL v20 = [v19 embeddedDisplayWindowScene];
  unsigned int v21 = [v20 pictureInPictureManager];

  objc_msgSend(v21, "applyStashedPictureInPicturePadding:forPIPSource:", 1, v5, v6, v18, v7);
}

- (void)_cancelGestureIfNecessary:(id)a3 reason:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)([v4 state] - 1) <= 1)
  {
    double v5 = SBLogSystemNotes();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v6, 0xCu);
    }

    [v4 setState:4];
  }
}

- (void)_updateFailureRequirements
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__SBSystemNotesInteractionManager__updateFailureRequirements__block_invoke;
  v4[3] = &unk_1E6B0DC48;
  v4[4] = self;
  unint64_t v3 = (void (**)(void, void))MEMORY[0x1D948C7A0](v4, a2);
  ((void (**)(void, SBCornerFingerPanGestureRecognizer *))v3)[2](v3, self->_leftFingerSystemCornerGestureRecognizer);
  ((void (**)(void, SBCornerFingerPanGestureRecognizer *))v3)[2](v3, self->_rightFingerSystemCornerGestureRecognizer);
}

void __61__SBSystemNotesInteractionManager__updateFailureRequirements__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  id v4 = a2;
  SBCornerFingerGestureUpdateFailureRequirements(v4, v3);
  [*(id *)(*(void *)(a1 + 32) + 80) gestureRecognizerOfType:117 shouldBeRequiredToFailByGestureRecognizer:v4];
  [*(id *)(*(void *)(a1 + 32) + 80) gestureRecognizerOfType:118 shouldBeRequiredToFailByGestureRecognizer:v4];
}

- (CGPoint)_orientedLocationForReferenceLocation:(CGPoint)a3
{
  [(id)SBApp activeInterfaceOrientation];
  id v4 = [(SBSystemGestureManager *)self->_systemGestureManager windowForSystemGestures];
  [v4 bounds];

  _UIWindowConvertPointFromOrientationToOrientation();
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)_pointForGestureCorner:(unint64_t)a3
{
  [(id)SBApp activeInterfaceOrientation];
  double v5 = [(SBSystemGestureManager *)self->_systemGestureManager windowForSystemGestures];
  [v5 bounds];

  _UIWindowConvertRectFromOrientationToOrientation();
  double v8 = v7;
  if (a3 == 8 || (double v9 = 0.0, a3 == 2)) {
    double v9 = v6;
  }
  result.y = v8;
  result.x = v9;
  return result;
}

- (void)_handleInteractiveSystemNotesGesture:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  unint64_t v6 = [(SBSystemNotesInteractionManager *)self _touchTypeForGestureRecognizer:v4];
  double v7 = +[SBDefaults localDefaults];
  double v8 = [v7 cornerGestureDefaults];

  if (([v8 cornerGestureRequiresEducation] & v6) != 0)
  {
    if (v5 == 1)
    {
      unint64_t v9 = [(SBSystemNotesInteractionManager *)self _cornerForGestureRecognizer:v4];
      double v10 = SBLogSystemGesture();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134217984;
        unint64_t v18 = v9;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_DEFAULT, "System notes gesture recognized for corner %lu that requires education", (uint8_t *)&v17, 0xCu);
      }

      if (v9 == 8)
      {
        BOOL v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
        uint64_t v12 = 10;
        uint64_t v13 = 8;
      }
      else
      {
        if (v9 != 4)
        {
          uint64_t v15 = 0;
LABEL_20:
          double v16 = [(id)SBApp productivityGestureEducationController];
          [v16 gestureActivatedForType:v15];

          goto LABEL_22;
        }
        BOOL v11 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
        uint64_t v12 = 8;
        uint64_t v13 = 10;
      }
      if (v11) {
        uint64_t v15 = v13;
      }
      else {
        uint64_t v15 = v12;
      }
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t edgeProtectState = self->_edgeProtectState;
    if (edgeProtectState != 3)
    {
      if (v5 == 1)
      {
        self->_initialInteractorPanPresentationMode = [(SBSystemNotesInteractionManager *)self _presentationModeForGestureBegin];
        unint64_t edgeProtectState = self->_edgeProtectState;
        if (!edgeProtectState)
        {
          unint64_t edgeProtectState = [(SBSystemNotesInteractionManager *)self _shouldEdgeProtectGestureRecognizer:v4];
          self->_unint64_t edgeProtectState = edgeProtectState;
        }
      }
      if (!self->_initialInteractorPanPresentationMode || edgeProtectState) {
        [(SBSystemNotesInteractionManager *)self _handleNonInteractiveSwipeInGesture:v4];
      }
      else {
        [(SBSystemNotesInteractionManager *)self _handleInteractiveSwipeInGesture:v4];
      }
    }
  }
LABEL_22:
}

- (void)_handleInteractiveSwipeInGesture:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = (SBCornerFingerPanGestureRecognizer *)a3;
  uint64_t v5 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedPIPContentViewControllerForInteractionManager:self];
  unint64_t v6 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];
  uint64_t v7 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentPresentationModeForInteractionManager:self];
  uint64_t v8 = [(SBCornerFingerPanGestureRecognizer *)v4 state];
  if (v8 == 2) {
    goto LABEL_2;
  }
  unint64_t v10 = v8;
  BOOL v11 = SBLogSystemNotes();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    double v14 = _SBFLoggingMethodProem();
    uint64_t v15 = SBSystemGestureRecognizerStateDescription(v10);
    int v26 = 138543618;
    unsigned int v27 = v14;
    __int16 v28 = 2114;
    v29 = v15;
    _os_log_debug_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] state: %{public}@", (uint8_t *)&v26, 0x16u);
  }
  if (v10 - 4 < 2)
  {
    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsStopSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionGesture"];
    uint64_t v13 = [v6 interactionController];
    [v13 handleExternalPanGesture:v4];

    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsNotesDismissalForSource:2 animated:1];
    goto LABEL_27;
  }
  if (v10 == 3)
  {
    [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForInteractiveCornerGestureEnd];
    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsStopSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionGesture"];
LABEL_2:
    unint64_t v9 = [v6 interactionController];
    [v9 handleExternalPanGesture:v4];

    goto LABEL_27;
  }
  if (v10 == 1)
  {
    if (v7 != 1)
    {
      if (self->_leftFingerSystemCornerGestureRecognizer == v4)
      {
        uint64_t v12 = 5;
      }
      else if (self->_rightFingerSystemCornerGestureRecognizer == v4)
      {
        uint64_t v12 = 5;
      }
      else
      {
        uint64_t v12 = 4;
      }
      double v16 = [SBSystemNotesPositionConfiguration alloc];
      if (self->_leftFingerSystemCornerGestureRecognizer == v4)
      {
        uint64_t v17 = 1;
      }
      else if ((SBCornerFingerPanGestureRecognizer *)self->_leftPencilSystemCornerGestureRecognizer == v4)
      {
        uint64_t v17 = 1;
      }
      else
      {
        uint64_t v17 = 2;
      }
      unint64_t v18 = [(SBSystemNotesPositionConfiguration *)v16 initWithEdgeProtectEnabled:0 position:v17];
      uint64_t v19 = [SBSystemNotesContentPresentationContext alloc];
      SEL v20 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource launchBundleIDForInteractionManager:self];
      unsigned int v21 = [(SBSystemNotesContentPresentationContext *)v19 initWithLaunchBundleID:v20 presentationMode:1 source:v12 positionConfiguration:v18];

      if (![(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsPresentationWithContext:v21])
      {
        [(SBCornerFingerPanGestureRecognizer *)v4 setState:4];

        goto LABEL_27;
      }
      id v22 = SBLogSystemNotes();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[SBSystemNotesInteractionManager _handleInteractiveSwipeInGesture:]();
      }

      uint64_t v23 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];

      uint64_t v24 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedPIPContentViewControllerForInteractionManager:self];

      [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentPresentationModeForInteractionManager:self];
      unint64_t v6 = (void *)v23;
      uint64_t v5 = (void *)v24;
    }
    v25 = [v6 interactionController];
    [v25 handleExternalPanGesture:v4];

    [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForInteractiveCornerGesture];
    [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsStartSuppressingKeyboardForReason:@"SBSystemNotesKeyboardSuppressionGesture"];
  }
LABEL_27:
}

- (void)_handleNonInteractiveSwipeInGesture:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = (SBCornerFingerPanGestureRecognizer *)a3;
  uint64_t v5 = [(SBCornerFingerPanGestureRecognizer *)v4 state];
  if (v5 != 2)
  {
    unint64_t v6 = v5;
    uint64_t v7 = SBLogSystemNotes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = _SBFLoggingMethodProem();
      double v16 = SBSystemGestureRecognizerStateDescription(v6);
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      __int16 v30 = 2114;
      v31 = v16;
      _os_log_debug_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] state: %{public}@", buf, 0x16u);
    }
    if (v6 == 3)
    {
      [(SBSystemNotesInteractionManager *)self _absoluteScaleForInteractiveSystemNotesGesture:v4];
      double v9 = v8;
      [(SBSystemNotesInteractionManager *)self _absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:v4];
      if (v9 > v10
        || [(SBSystemNotesInteractionManager *)self _panRecognizerOverFlickThreshold:v4])
      {
        leftFingerSystemCornerGestureRecognizer = self->_leftFingerSystemCornerGestureRecognizer;
        if (leftFingerSystemCornerGestureRecognizer == v4)
        {
          uint64_t v12 = 5;
        }
        else if (self->_rightFingerSystemCornerGestureRecognizer == v4)
        {
          uint64_t v12 = 5;
        }
        else
        {
          uint64_t v12 = 4;
        }
        if (self->_edgeProtectState)
        {
          if (self->_rightFingerSystemCornerGestureRecognizer != v4
            && (SBCornerFingerPanGestureRecognizer *)self->_rightPencilSystemCornerGestureRecognizer != v4
            && (leftFingerSystemCornerGestureRecognizer == v4
             || (SBCornerFingerPanGestureRecognizer *)self->_leftPencilSystemCornerGestureRecognizer == v4))
          {
            uint64_t v13 = 1;
          }
          else
          {
            uint64_t v13 = 2;
          }
          double v14 = [[SBSystemNotesPositionConfiguration alloc] initWithEdgeProtectEnabled:1 position:v13];
        }
        else
        {
          double v14 = 0;
        }
        uint64_t v17 = [SBSystemNotesContentPresentationContext alloc];
        unint64_t v18 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource launchBundleIDForInteractionManager:self];
        uint64_t v19 = [(SBSystemNotesContentPresentationContext *)v17 initWithLaunchBundleID:v18 presentationMode:0 source:v12 positionConfiguration:v14];

        if (self->_edgeProtectState == 1)
        {
          SEL v20 = [(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsStashAssertionForReason:@"edgelord"];
          edgeProtectStashAssertion = self->_edgeProtectStashAssertion;
          self->_edgeProtectStashAssertion = v20;
        }
        if ([(SBSystemNotesInteractionManagerDelegate *)self->_delegate interactionManager:self requestsPresentationWithContext:v19])
        {
          unsigned int v22 = self->_edgeProtectGenCount + 1;
          self->_edgeProtectGenCount = v22;
          unint64_t edgeProtectState = self->_edgeProtectState;
          if (edgeProtectState)
          {
            if (edgeProtectState == 1)
            {
              self->_unint64_t edgeProtectState = 2;
              dispatch_time_t v24 = dispatch_time(0, 2000000000);
              v26[0] = MEMORY[0x1E4F143A8];
              v26[1] = 3221225472;
              v26[2] = __71__SBSystemNotesInteractionManager__handleNonInteractiveSwipeInGesture___block_invoke;
              v26[3] = &unk_1E6AF7E00;
              unsigned int v27 = v22;
              v26[4] = self;
              dispatch_after(v24, MEMORY[0x1E4F14428], v26);
              [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForStandardBehavior];
              [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForEdgeProtectCornerSwipe];
            }
          }
          else
          {
            [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForSwipesFromCorners:[(SBSystemNotesInteractionManager *)self _cornersForAllSwipes] animated:0];
            [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForStandardBehavior];
          }
        }
        else
        {
          self->_unint64_t edgeProtectState = 0;
          [(BSInvalidatable *)self->_edgeProtectStashAssertion invalidate];
          v25 = self->_edgeProtectStashAssertion;
          self->_edgeProtectStashAssertion = 0;
        }
      }
    }
  }
}

uint64_t __71__SBSystemNotesInteractionManager__handleNonInteractiveSwipeInGesture___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(_DWORD *)(result + 40) == *(_DWORD *)(v1 + 144) && *(void *)(v1 + 136) == 2)
  {
    *(void *)(v1 + 136) = 3;
    return [*(id *)(*(void *)(result + 32) + 8) interactionManager:*(void *)(result + 32) requestsNotesDismissalForSource:3 animated:1];
  }
  return result;
}

- (int64_t)_presentationModeForGestureBegin
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentPresentationModeForInteractionManager:self];
  uint64_t v4 = v3;
  if (v3 == -1 || self->_cornerDismissState > 1 || (int64_t v5 = v3, self->_isDismissingNonInteractively)) {
    int64_t v5 = 1;
  }
  unint64_t v6 = SBLogSystemNotes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    double v8 = _SBFLoggingMethodProem();
    unint64_t cornerDismissState = self->_cornerDismissState;
    BOOL isDismissingNonInteractively = self->_isDismissingNonInteractively;
    int v11 = 138544386;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    int64_t v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    unint64_t v18 = cornerDismissState;
    __int16 v19 = 1024;
    BOOL v20 = isDismissingNonInteractively;
    _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] result: %lu {currentPresentationMode: %lu; cornerDismissState: %lu; isDismissingNonInteractively: %{BOOL}u}",
      (uint8_t *)&v11,
      0x30u);
  }
  return v5;
}

- (BOOL)_shouldEdgeProtectGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentPresentationModeForInteractionManager:self] == -1)
  {
    unint64_t v6 = [(id)SBApp windowSceneManager];
    uint64_t v7 = [v6 embeddedDisplayWindowScene];
    double v8 = [v7 switcherController];

    uint64_t v9 = objc_opt_class();
    id v10 = v4;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        int v11 = v10;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    id v12 = v11;

    __int16 v13 = [v8 layoutStatePrimaryElement];
    int64_t v14 = [v13 workspaceEntity];
    __int16 v15 = [v14 applicationSceneEntity];
    uint64_t v16 = [v15 sceneHandle];
    uint64_t v17 = [v16 screenEdgesDeferringSystemGestures];

    uint64_t v18 = [v12 edges];
    BOOL v5 = (v18 & v17) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  return 0;
}

- (id)debugName
{
  return @"System Notes";
}

- (id)layoutSettings
{
  return (id)[(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentContentViewLayoutSettingsForInteractionManager:self];
}

- (id)defaultPositionHyperregionComposers
{
  v14[2] = *MEMORY[0x1E4F143B8];
  [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer invalidate];
  positionRegionsComposer = self->_positionRegionsComposer;
  self->_positionRegionsComposer = 0;

  id v4 = objc_alloc_init(SBPIPDefaultPositionHyperregionComposer);
  BOOL v5 = objc_alloc_init(SBSystemNotesPositionHyperregionComposer);
  unint64_t v6 = self->_positionRegionsComposer;
  self->_positionRegionsComposer = v5;

  if ([(SBSystemNotesInteractionManager *)self _cornersForTouchType:0]) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = [(SBSystemNotesInteractionManager *)self _cornersForTouchType:2] == 0;
  }
  unint64_t edgeProtectState = self->_edgeProtectState;
  if (edgeProtectState != 1 && !v7)
  {
    uint64_t v9 = self->_positionRegionsComposer;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__SBSystemNotesInteractionManager_defaultPositionHyperregionComposers__block_invoke;
    v13[3] = &unk_1E6AF4AC0;
    v13[4] = self;
    [(SBSystemNotesPositionHyperregionComposer *)v9 performActionsWithTransientStateChange:v13];
    unint64_t edgeProtectState = self->_edgeProtectState;
  }
  if (edgeProtectState == 1) {
    [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForEdgeProtectCornerSwipe];
  }
  id v10 = self->_positionRegionsComposer;
  v14[0] = v4;
  v14[1] = v10;
  int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  return v11;
}

uint64_t __70__SBSystemNotesInteractionManager_defaultPositionHyperregionComposers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[3];
  uint64_t v3 = [v1 _cornersForAllSwipes];
  return [v2 setupForSwipesFromCorners:v3 animated:0];
}

- (void)interactionController:(id)a3 updateScaleInteractor:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6
{
  if (self->_initialInteractorPanPresentationMode == 1) {
    -[SBSystemNotesInteractionManager _interactionController:updateScaleInteractorForSwipeToPresent:pipSize:forPanGesture:](self, "_interactionController:updateScaleInteractorForSwipeToPresent:pipSize:forPanGesture:", a3, a4, a6, a5.width, a5.height);
  }
  else {
    -[SBSystemNotesInteractionManager _interactionController:updateScaleInteractorForSwipeToDismiss:pipSize:forPanGesture:](self, "_interactionController:updateScaleInteractorForSwipeToDismiss:pipSize:forPanGesture:", a3, a4, a6, a5.width, a5.height);
  }
}

- (UIEdgeInsets)interactionController:(id)a3 edgeInsetsForWindowScene:(id)a4
{
  double v4 = *MEMORY[0x1E4F437F8];
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)interactionController:(id)a3 stashedPaddingForWindowScene:(id)a4
{
  double v4 = *MEMORY[0x1E4F437F8];
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)interactionControllerConnectedWindowScenes:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];
  uint64_t v4 = [v3 _sbWindowScene];
  double v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)_interactionController:(id)a3 updateScaleInteractorForSwipeToPresent:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource currentPresentationModeForInteractionManager:self];
  uint64_t v13 = [v11 state];
  if ((unint64_t)(v13 - 3) >= 3)
  {
    if (v13 == 2)
    {
      [(SBSystemNotesInteractionManager *)self _absoluteScaleThresholdBeforeFullSizeForGestureRecognizer:v11];
      double v17 = v16;
      [(SBSystemNotesInteractionManager *)self _absoluteScaleForInteractiveSystemNotesGesture:v11];
      if (v18 <= v17)
      {
        double v20 = v18;
        if (v12 != 1 && v18 <= v17 && !v12) {
          [(SBSystemNotesInteractionManager *)self collapseAnimated:1];
        }
      }
      else
      {
        [v9 preferredScale];
        double v20 = v19;
        if (v12 == 1) {
          [(SBSystemNotesInteractionManager *)self expandAnimated:1];
        }
      }
      [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForInteractiveCornerGesture];
      double v21 = v20 + -1.0;
      [v10 _copyTranslation:&v21];
    }
  }
  else
  {
    double v21 = 0.0;
    [v10 _copyTranslation:&v21];
    [v9 setPreferredNormalizedScale:1.0];
    if (v12 == 1)
    {
      int64_t v14 = [v9 targetView];
      [v14 bounds];
      if (v15 > SBSystemNotesThumbnailSize() * 1.5
        || [(SBSystemNotesInteractionManager *)self _panRecognizerOverFlickThreshold:v11])
      {
        [(SBSystemNotesInteractionManager *)self expandAnimated:1];
      }
    }
  }
}

- (CGPoint)_convertReferenceVelocity:(CGPoint)result toOrientation:(int64_t)a4
{
  double y = result.y;
  double x = result.x;
  switch(a4)
  {
    case 0:
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"SBSystemNotesInteractionManager.m" lineNumber:930 description:@"dealing with unknown orientation"];

      goto LABEL_3;
    case 1:
      break;
    case 2:
      result.double x = -result.x;
      double y = -result.y;
      break;
    case 3:
      result.double x = result.y;
      double y = -x;
      break;
    case 4:
      result.double x = -result.y;
      double y = x;
      break;
    default:
LABEL_3:
      result.double x = x;
      break;
  }
  double v9 = y;
  result.double y = v9;
  return result;
}

- (unint64_t)_cornerForGestureRecognizer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v7 corner];
  if (!v8)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v5;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = v11;

    unint64_t v8 = [v12 corner];
  }

  return v8;
}

- (unint64_t)_touchTypeForGestureRecognizer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = (uint64_t)v5;
    }
    else {
      uint64_t v4 = 0;
    }
  }

  if (v4)
  {
    unint64_t v6 = 2;
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v5;
    if (v7)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = (uint64_t)v8;
      }
      else {
        uint64_t v7 = 0;
      }
    }

    unint64_t v6 = v7 != 0;
  }

  return v6;
}

- (BOOL)_panRecognizerOverFlickThreshold:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(SBSystemNotesInteractionManager *)self _cornerForGestureRecognizer:v4];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = [(SBSystemGestureManager *)self->_systemGestureManager windowForSystemGestures];
    [v4 velocityInView:v7];
    double v9 = v8;
    double v11 = v10;

    -[SBSystemNotesInteractionManager _convertReferenceVelocity:toOrientation:](self, "_convertReferenceVelocity:toOrientation:", [(id)SBApp activeInterfaceOrientation], v9, v11);
    double v14 = v13 * dbl_1D8FD3540[v6 == 4] * 0.5 + v12 * -1.41421356 * 0.5;
    [(SBSystemNotesInteractionManager *)self _flickVelocityThresholdForGestureRecognizer:v4];
    BOOL v16 = v14 > v15;
  }
  else
  {
    double v17 = SBLogSystemNotes();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      double v19 = _SBFLoggingMethodProem();
      int v20 = 138543618;
      double v21 = v19;
      __int16 v22 = 2114;
      id v23 = v4;
      _os_log_error_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_ERROR, "%{public}@ unexpected recognizer type: %{public}@", (uint8_t *)&v20, 0x16u);
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_setupForInteractiveDismissal
{
  if (_setupForInteractiveDismissal_onceToken != -1) {
    dispatch_once(&_setupForInteractiveDismissal_onceToken, &__block_literal_global_397);
  }
  self->_unint64_t cornerDismissState = 1;
  positionRegionsComposer = self->_positionRegionsComposer;
  double v4 = *(double *)&_setupForInteractiveDismissal___toSize_0;
  double v5 = *(double *)&_setupForInteractiveDismissal___toSize_1;
  -[SBSystemNotesPositionHyperregionComposer setupForInteractiveDismissalToSize:](positionRegionsComposer, "setupForInteractiveDismissalToSize:", v4, v5);
}

void __64__SBSystemNotesInteractionManager__setupForInteractiveDismissal__block_invoke()
{
  id v3 = +[SBPIPContentViewLayoutMetrics systemNotesMetricsForPresentationMode:1];
  v0 = [[SBPIPContentViewLayoutSettings alloc] initWithPlatformMetrics:v3 contentSize:SBSystemNotesThumbnailSize()];
  [(SBPIPContentViewLayoutSettings *)v0 minimumPossibleContentViewSizeForAspectRatio:SBSystemNotesThumbnailSize()];
  _setupForInteractiveDismissal___toSize_0 = v1;
  _setupForInteractiveDismissal___toSize_1 = v2;
}

- (void)_interactionController:(id)a3 updateScaleInteractorForSwipeToDismiss:(id)a4 pipSize:(CGSize)a5 forPanGesture:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v11 state];
  if ((unint64_t)(v12 - 3) >= 3)
  {
    if (v12 != 2 || ([v9 isStashed] & 1) != 0) {
      goto LABEL_41;
    }
    if ([v9 isPinching]) {
      int v14 = 1;
    }
    else {
      int v14 = [v9 isRotating];
    }
    double v17 = [(SBSystemGestureManager *)self->_systemGestureManager windowForSystemGestures];
    [v11 locationInView:v17];
    double v19 = v18;
    double v21 = v20;

    -[SBSystemNotesInteractionManager _orientedLocationForReferenceLocation:](self, "_orientedLocationForReferenceLocation:", v19, v21);
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v47 = 0;
    v48 = (double *)&v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0x47EFFFFFE0000000;
    int8x8_t v26 = [(SBSystemNotesInteractionManager *)self _cornersForAllSwipes];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    id v41 = __119__SBSystemNotesInteractionManager__interactionController_updateScaleInteractorForSwipeToDismiss_pipSize_forPanGesture___block_invoke;
    id v42 = &unk_1E6B0DC70;
    uint64_t v45 = v23;
    uint64_t v46 = v25;
    id v43 = self;
    v44 = &v47;
    unsigned int v27 = v40;
    if (v26)
    {
      int v37 = v14;
      LOBYTE(v39) = 0;
      uint8x8_t v28 = (uint8x8_t)vcnt_s8(v26);
      v28.i16[0] = vaddlv_u8(v28);
      int v29 = v28.i32[0];
      if (v28.i32[0])
      {
        unint64_t v30 = 0;
        do
        {
          if (((1 << v30) & *(void *)&v26) != 0)
          {
            ((void (*)(void *))v41)(v27);
            --v29;
          }
          if (v30 > 0x3E) {
            break;
          }
          ++v30;
        }
        while (v29 > 0);
      }
      int v14 = v37;
    }

    if (v14)
    {
      BOOL v31 = 0;
    }
    else
    {
      double v32 = v48[3];
      [(SBSystemNotesInteractionManager *)self _cornerDistanceBeforeScalingForDismissGestureRecognizer:v11];
      BOOL v31 = v32 < v33;
      double v39 = 0.0;
      if (v32 < v33)
      {
        [(SBSystemNotesInteractionManager *)self _cornerDistanceBeforeScalingForDismissGestureRecognizer:v11];
        double v39 = (v34 - v48[3]) / -50.0;
      }
      [v10 _copyTranslation:&v39];
    }
    double v35 = v48[3];
    unint64_t cornerDismissState = self->_cornerDismissState;
    if (cornerDismissState == 2)
    {
      if (!v14)
      {
        if (v35 >= 100.0)
        {
LABEL_36:
          [(SBSystemNotesInteractionManager *)self _setupForInteractiveDismissal];
          goto LABEL_40;
        }
        goto LABEL_40;
      }
    }
    else
    {
      if (cornerDismissState != 1)
      {
        if (!cornerDismissState)
        {
          if ((v14 & 1) == 0)
          {
            if (!v31) {
              goto LABEL_40;
            }
            goto LABEL_36;
          }
LABEL_39:
          [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForStandardBehavior];
        }
LABEL_40:
        _Block_object_dispose(&v47, 8);
        goto LABEL_41;
      }
      if ((v14 & 1) == 0)
      {
        if (v35 < 100.0)
        {
          self->_unint64_t cornerDismissState = 2;
          [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForSwipesFromCorners:[(SBSystemNotesInteractionManager *)self _cornersForAllSwipes] animated:1];
        }
        goto LABEL_40;
      }
    }
    self->_unint64_t cornerDismissState = 0;
    goto LABEL_39;
  }
  if (([v9 isStashed] & 1) == 0)
  {
    unint64_t v13 = self->_cornerDismissState;
    switch(v13)
    {
      case 2uLL:
        self->_unint64_t cornerDismissState = 3;
        uint64_t v15 = self->_cornerDismissGenCount + 1;
        self->_cornerDismissGenCount = v15;
        BOOL v16 = [(SBSystemNotesInteractionManagerDataSource *)self->_dataSource presentedContainerViewControllerForInteractionManager:self];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __119__SBSystemNotesInteractionManager__interactionController_updateScaleInteractorForSwipeToDismiss_pipSize_forPanGesture___block_invoke_2;
        v38[3] = &unk_1E6AF4A70;
        v38[4] = self;
        v38[5] = v15;
        [v16 performAfterInFlightAnimationsComplete:v38];

        break;
      case 1uLL:
        uint64_t v47 = 0;
        [v10 _copyTranslation:&v47];
        self->_unint64_t cornerDismissState = 0;
        [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForInteractiveCornerGestureEnd];
        break;
      case 0uLL:
        self->_unint64_t cornerDismissState = 0;
        [(SBSystemNotesPositionHyperregionComposer *)self->_positionRegionsComposer setupForStandardBehavior];
        break;
    }
  }
LABEL_41:
}

uint64_t __119__SBSystemNotesInteractionManager__interactionController_updateScaleInteractorForSwipeToDismiss_pipSize_forPanGesture___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _pointForGestureCorner:a2];
  double v7 = *(double *)(a1 + 48);
  if (a2 == 4)
  {
    if (v7 <= v5) {
      goto LABEL_7;
    }
  }
  else if (v7 >= v5)
  {
LABEL_7:
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    double v10 = fmin(*(double *)(v11 + 24), 0.0);
    goto LABEL_8;
  }
  if (*(double *)(a1 + 56) >= v6) {
    goto LABEL_7;
  }
  double v8 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t result = UIDistanceBetweenPoints();
  double v10 = fmin(v8, v9);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
LABEL_8:
  *(double *)(v11 + 24) = v10;
  return result;
}

uint64_t __119__SBSystemNotesInteractionManager__interactionController_updateScaleInteractorForSwipeToDismiss_pipSize_forPanGesture___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 96) == 3 && *(void *)(result + 40) == *(_DWORD *)(v1 + 104))
  {
    *(void *)(v1 + 96) = 0;
    return [*(id *)(*(void *)(result + 32) + 8) interactionManager:*(void *)(result + 32) requestsNotesDismissalForSource:1 animated:0];
  }
  return result;
}

- (BOOL)interactionControllerScalesDuringPanGesture:(id)a3
{
  return 1;
}

- (id)systemGestureManagerForInteractionControllerResizing:(id)a3
{
  return self->_systemGestureManager;
}

- (id)systemPointerInteractionManagerForInteractionController:(id)a3
{
  return self->_systemPointerInteractionManager;
}

- (BOOL)_gestureRecognizerIsActive:(id)a3
{
  return (unint64_t)([a3 state] - 1) < 2;
}

- (BOOL)_gestureIsActive
{
  if ([(SBSystemNotesInteractionManager *)self _gestureRecognizerIsActive:self->_leftPencilSystemCornerGestureRecognizer]|| [(SBSystemNotesInteractionManager *)self _gestureRecognizerIsActive:self->_rightPencilSystemCornerGestureRecognizer]|| [(SBSystemNotesInteractionManager *)self _gestureRecognizerIsActive:self->_leftFingerSystemCornerGestureRecognizer])
  {
    return 1;
  }
  rightFingerSystemCornerGestureRecognizer = self->_rightFingerSystemCornerGestureRecognizer;
  return [(SBSystemNotesInteractionManager *)self _gestureRecognizerIsActive:rightFingerSystemCornerGestureRecognizer];
}

- (unint64_t)startingPositionForExternalPresentationRequest
{
  unint64_t v4 = [(SBSystemNotesInteractionManager *)self _cornersForAllSwipes];
  if (!v4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBSystemNotesInteractionManager.m" lineNumber:1140 description:@"_cornersForAllSwipes should never return empty result"];
  }
  double v5 = (id *)MEMORY[0x1E4F43630];
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 8;
  }
  uint64_t v7 = [*v5 userInterfaceLayoutDirection];
  unint64_t v8 = 1;
  if (v7 == 1) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = 2;
  }
  if (v7 == 1) {
    unint64_t v8 = 2;
  }
  if ((v6 & v4) != 0) {
    return v9;
  }
  else {
    return v8;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeProtectStashAssertion, 0);
  objc_storeStrong((id *)&self->_pipCoordinator, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionManager, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_pipSettings, 0);
  objc_storeStrong((id *)&self->_leftFingerSystemCornerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightFingerSystemCornerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_leftPencilSystemCornerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rightPencilSystemCornerGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_positionRegionsComposer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)peepAnimated:.cold.1()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_26();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}@][Gesture]", v3, v4, v5, v6, v7);
}

- (void)dismissAnimated:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_26();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_8(&dword_1D85BA000, v1, v2, "[%{public}@][%u][Gesture][End] stashed or non-animated dismiss", v3, v4, v5, v6, v7);
}

- (void)dismissAnimated:completion:.cold.2()
{
  OUTLINED_FUNCTION_1_26();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_8(&dword_1D85BA000, v1, v2, "[%{public}@][%u][Gesture][Begin] stashed or non-animated dismiss", v3, v4, v5, v6, v7);
}

- (void)dismissAnimated:completion:.cold.3()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_26();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "[%{public}@][Gesture] nil container!", v3, v4, v5, v6, v7);
}

- (void)dismissAnimated:completion:.cold.4()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_26();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_1D85BA000, v1, v2, "[%{public}@][Gesture] nil content!", v3, v4, v5, v6, v7);
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_2_cold_1()
{
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_8(&dword_1D85BA000, v1, v2, "[%{public}@][%u][Gesture] animation completed. waiting for inflight to settle", v3, v4, v5, v6, v7);
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_23_cold_1()
{
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_8(&dword_1D85BA000, v1, v2, "[%{public}@][Gesture][%u][End] animated dismiss", v3, v4, v5, v6, v7);
}

void __62__SBSystemNotesInteractionManager_dismissAnimated_completion___block_invoke_23_cold_2()
{
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_1_8(&dword_1D85BA000, v1, v2, "[%{public}@][%u][Gesture] inflight settled. calling completion", v3, v4, v5, v6, v7);
}

- (void)_handleInteractiveSwipeInGesture:.cold.1()
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_26();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_8(&dword_1D85BA000, v1, v2, "[%{public}@][Gesture] presented?: %{BOOL}u", v3, v4, v5, v6, v7);
}

@end