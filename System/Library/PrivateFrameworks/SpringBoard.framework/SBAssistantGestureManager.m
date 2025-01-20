@interface SBAssistantGestureManager
+ (BOOL)shouldDismissSiriForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4;
- (BOOL)_noNewTransientOverlaysPresented;
- (BOOL)allowPencilTouches;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gesturesImplyFullscreenContent;
- (SBAssistantContext)context;
- (SBAssistantGestureConfiguration)gestureConfiguration;
- (SBAssistantGestureManager)initWithAssistantWindow:(id)a3 gestureConfiguration:(id)a4 context:(id)a5;
- (SBAssistantGestureManagerDelegate)delegate;
- (SBAssistantWindow)assistantWindow;
- (SBFZStackParticipant)zStackParticipant;
- (SBHomeGesturePanGestureRecognizer)bottomEdgeDismissGestureRecognizer;
- (SBPhysicalButtonZStackPolicyAssistant)physicalButtonPolicyAssistant;
- (SBTransientOverlayViewController)topmostTransientViewControllerAtPresentation;
- (UIPanGestureRecognizer)panToDismissSiriGestureRecognizer;
- (UITapGestureRecognizer)tapToDismissSiriGestureRecognizer;
- (id)_assistantRootViewController;
- (id)_createPanToDismissSiriGestureRecognizer;
- (id)_createTapToDismissSiriGestureRecognizer;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (int64_t)homeAffordanceSuppression;
- (int64_t)touchInterfaceOrientationForGestureRecognizer:(id)a3;
- (void)_commonHandlerForSiriDismissalGesture:(id)a3;
- (void)_configureHomeGesture;
- (void)_configurePanToDismissGestureDependencies;
- (void)_didUpdateHomeGestureSharing:(BOOL)a3;
- (void)_didUpdateSiriHomeAffordanceSuppression:(int64_t)a3;
- (void)_didUpdateTouchesPassThroughToSpringBoard:(BOOL)a3;
- (void)_handleBottomEdgeDismissGesture:(id)a3;
- (void)_notifyInteractionWithGestureRecognizer:(id)a3;
- (void)_pannedToDismissSiri:(id)a3;
- (void)_prototypeSettingsChanged;
- (void)_removeHomeGesture;
- (void)_removeScreenEdgePanGestureRecognizerIfNecessary;
- (void)_resetDismissalSystemGestures;
- (void)_setupSystemDismissalGestures;
- (void)_tappedToDismissSiri:(id)a3;
- (void)_tearDownDismissalSystemGestures;
- (void)_updateRootViewControllerDimsContentBelow;
- (void)_updateRootViewControllerOwnsHomeGesture;
- (void)_updateRootViewControllerShowsHomeAffordance:(BOOL)a3;
- (void)_updateZStackParticipantWithReason:(id)a3;
- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeAffordanceSuppression:(int64_t)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4;
- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldShowHomeAffordance:(BOOL)a4;
- (void)assistantSession:(id)a3 didChangePresentationInWindowScene:(id)a4;
- (void)dealloc;
- (void)homeGrabberViewDidReceiveClick:(id)a3;
- (void)setBottomEdgeDismissGestureRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeAffordanceSuppression:(int64_t)a3;
- (void)setPanToDismissSiriGestureRecognizer:(id)a3;
- (void)setPhysicalButtonPolicyAssistant:(id)a3;
- (void)setTapToDismissSiriGestureRecognizer:(id)a3;
- (void)setTopmostTransientViewControllerAtPresentation:(id)a3;
- (void)setZStackParticipant:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBAssistantGestureManager

- (SBAssistantGestureManager)initWithAssistantWindow:(id)a3 gestureConfiguration:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBAssistantGestureManager;
  v12 = [(SBAssistantGestureManager *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assistantWindow, a3);
    objc_storeStrong((id *)&v13->_gestureConfiguration, a4);
    [(SBAssistantGestureConfiguration *)v13->_gestureConfiguration addObserver:v13];
    objc_storeStrong((id *)&v13->_context, a5);
    uint64_t v14 = +[SBSystemAnimationDomain rootSettings];
    settings = v13->_settings;
    v13->_settings = (SBSystemAnimationSettings *)v14;

    [(PTSettings *)v13->_settings addKeyObserver:v13];
    v13->_allowPencilTouches = _os_feature_enabled_impl();
    v13->_homeAffordanceSuppression = 2;
  }

  return v13;
}

- (void)dealloc
{
  [(PTSettings *)self->_settings removeKeyObserver:self];
  [(SBAssistantGestureConfiguration *)self->_gestureConfiguration removeObserver:self];
  [(SBAssistantGestureManager *)self _tearDownDismissalSystemGestures];
  [(SBAssistantGestureManager *)self _removeHomeGesture];
  v3.receiver = self;
  v3.super_class = (Class)SBAssistantGestureManager;
  [(SBAssistantGestureManager *)&v3 dealloc];
}

+ (BOOL)shouldDismissSiriForGestureTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  long double y = a4.y;
  long double x = a4.x;
  double v6 = hypot(a3.x, a3.y);
  return hypot(x, y) > *(double *)&kSBAssistantBottomEdgeDismissVelocityThreshold
      || v6 > *(double *)&kSBAssistantBottomEdgeDismissTranslationThreshold;
}

- (BOOL)gesturesImplyFullscreenContent
{
  objc_super v3 = [(SBAssistantGestureManager *)self gestureConfiguration];
  if ([v3 shouldDismissForTapsOutsideContent])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(SBAssistantGestureManager *)self gestureConfiguration];
    char v4 = [v5 shouldDismissForSwipesOutsideContent];
  }
  return v4;
}

- (void)_setupSystemDismissalGestures
{
  if (!self->_tapToDismissSiriGestureRecognizer)
  {
    objc_super v3 = [(SBAssistantGestureManager *)self _createTapToDismissSiriGestureRecognizer];
    tapToDismissSiriGestureRecognizer = self->_tapToDismissSiriGestureRecognizer;
    self->_tapToDismissSiriGestureRecognizer = v3;

    v5 = [(SBAssistantGestureManager *)self context];
    double v6 = [v5 systemGestureManager];
    [v6 addGestureRecognizer:self->_tapToDismissSiriGestureRecognizer withType:114];
  }
  if (!self->_panToDismissSiriGestureRecognizer)
  {
    v7 = [(SBAssistantGestureManager *)self _createPanToDismissSiriGestureRecognizer];
    panToDismissSiriGestureRecognizer = self->_panToDismissSiriGestureRecognizer;
    self->_panToDismissSiriGestureRecognizer = v7;

    id v9 = [(SBAssistantGestureManager *)self context];
    id v10 = [v9 systemGestureManager];
    [v10 addGestureRecognizer:self->_panToDismissSiriGestureRecognizer withType:116];

    [(SBAssistantGestureManager *)self _configurePanToDismissGestureDependencies];
  }
}

- (void)_tearDownDismissalSystemGestures
{
  if (self->_tapToDismissSiriGestureRecognizer)
  {
    objc_super v3 = [(SBAssistantGestureManager *)self context];
    char v4 = [v3 systemGestureManager];
    [v4 removeGestureRecognizer:self->_tapToDismissSiriGestureRecognizer];

    tapToDismissSiriGestureRecognizer = self->_tapToDismissSiriGestureRecognizer;
    self->_tapToDismissSiriGestureRecognizer = 0;
  }
  if (self->_panToDismissSiriGestureRecognizer)
  {
    double v6 = [(SBAssistantGestureManager *)self context];
    v7 = [v6 systemGestureManager];
    [v7 removeGestureRecognizer:self->_panToDismissSiriGestureRecognizer];

    panToDismissSiriGestureRecognizer = self->_panToDismissSiriGestureRecognizer;
    self->_panToDismissSiriGestureRecognizer = 0;
  }
}

- (void)_resetDismissalSystemGestures
{
  objc_super v3 = [(SBAssistantGestureManager *)self tapToDismissSiriGestureRecognizer];
  if (v3)
  {
  }
  else
  {
    char v4 = [(SBAssistantGestureManager *)self panToDismissSiriGestureRecognizer];

    if (!v4) {
      return;
    }
  }
  [(SBAssistantGestureManager *)self _tearDownDismissalSystemGestures];
  [(SBAssistantGestureManager *)self _setupSystemDismissalGestures];
}

- (id)_createPanToDismissSiriGestureRecognizer
{
  objc_super v3 = [[SBAssistantDismissPanGestureRecognizer alloc] initWithTarget:self action:sel__pannedToDismissSiri_];
  [(SBAssistantDismissPanGestureRecognizer *)v3 setName:@"assistant.dismiss.pan"];
  [(SBAssistantDismissPanGestureRecognizer *)v3 setCancelsTouchesInView:0];
  [(SBAssistantDismissPanGestureRecognizer *)v3 setDelaysTouchesBegan:0];
  [(SBAssistantDismissPanGestureRecognizer *)v3 setDelaysTouchesEnded:0];
  [(SBAssistantDismissPanGestureRecognizer *)v3 setAllowedTouchTypes:&unk_1F33480C0];
  [(SBAssistantDismissPanGestureRecognizer *)v3 sbf_setPencilTouchesAllowed:self->_allowPencilTouches];
  [(SBAssistantDismissPanGestureRecognizer *)v3 setDelegate:self];
  char v4 = [(SBAssistantGestureManager *)self context];
  v5 = [v4 controlCenterController];
  [v5 _requirePresentGestureRecognizerToFailForGestureRecognizer:v3];

  return v3;
}

- (void)_configurePanToDismissGestureDependencies
{
  objc_super v3 = [(SBAssistantGestureManager *)self context];
  id v11 = [v3 systemGestureManager];

  char v4 = [(SBAssistantGestureManager *)self panToDismissSiriGestureRecognizer];
  [v11 gestureRecognizerOfType:46 shouldBeRequiredToFailByGestureRecognizer:v4];
  v5 = [(SBAssistantGestureManager *)self gestureConfiguration];
  int v6 = [v5 shouldShareHomeGesture];

  if (v6)
  {
    [v11 gestureRecognizerOfType:3 shouldBeRequiredToFailByGestureRecognizer:v4];
    [v11 gestureRecognizerOfType:1 shouldBeRequiredToFailByGestureRecognizer:v4];
  }
  [v11 gestureRecognizerOfType:119 shouldRequireFailureOfGestureRecognizer:v4];
  [v11 gestureRecognizerOfType:120 shouldRequireFailureOfGestureRecognizer:v4];
  [v11 gestureRecognizerOfType:104 shouldRequireFailureOfGestureRecognizer:v4];
  [v11 gestureRecognizerOfType:105 shouldRequireFailureOfGestureRecognizer:v4];
  v7 = [(SBAssistantGestureManager *)self bottomEdgeDismissGestureRecognizer];
  [v11 gestureRecognizerOfType:119 shouldRequireFailureOfGestureRecognizer:v7];
  [v11 gestureRecognizerOfType:120 shouldRequireFailureOfGestureRecognizer:v7];
  [v11 gestureRecognizerOfType:104 shouldRequireFailureOfGestureRecognizer:v7];
  [v11 gestureRecognizerOfType:105 shouldRequireFailureOfGestureRecognizer:v7];
  v8 = [(SBAssistantGestureManager *)self context];
  id v9 = [v8 switcherController];
  id v10 = [v9 homeGestureBottomEdgeRecognizer];
  [v4 requireGestureRecognizerToFail:v10];

  if (v7) {
    [v4 requireGestureRecognizerToFail:v7];
  }
}

- (void)_pannedToDismissSiri:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SBAssistantGestureManager *)self gestureConfiguration];
  int v6 = [v5 shouldDismissForSwipesOutsideContent];

  v7 = SBLogSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = _SBFLoggingMethodProem();
    id v9 = (void *)v8;
    id v10 = @"SHOULDN'T";
    if (v6) {
      id v10 = @"SHOULD";
    }
    int v18 = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Assistant %{public}@ dismiss for pans outside of content", (uint8_t *)&v18, 0x16u);
  }
  id v11 = [(SBAssistantGestureManager *)self context];
  v12 = [v11 controlCenterController];
  char v13 = [v12 isPresented];

  BOOL v14 = [(SBAssistantGestureManager *)self _noNewTransientOverlaysPresented];
  if ((v13 & 1) == 0 && v14)
  {
    if (v6 && [v4 state] == 1)
    {
      [(SBAssistantGestureManager *)self _commonHandlerForSiriDismissalGesture:v4];
    }
    else
    {
      v15 = [(UIWindow *)self->_assistantWindow _sbWindowScene];
      v16 = [v15 assistantController];
      int v17 = [v16 isSystemAssistantExperienceEnabled];

      if (v17) {
        [(SBAssistantGestureManager *)self _notifyInteractionWithGestureRecognizer:v4];
      }
    }
  }
}

- (id)_createTapToDismissSiriGestureRecognizer
{
  objc_super v3 = [[SBAssistantDismissTapGestureRecognizer alloc] initWithTarget:self action:sel__tappedToDismissSiri_];
  [(SBAssistantDismissTapGestureRecognizer *)v3 setName:@"assistant.dismiss.tap"];
  [(SBAssistantDismissTapGestureRecognizer *)v3 setCancelsTouchesInView:0];
  [(SBAssistantDismissTapGestureRecognizer *)v3 setDelaysTouchesBegan:0];
  [(SBAssistantDismissTapGestureRecognizer *)v3 setDelaysTouchesEnded:0];
  [(SBAssistantDismissTapGestureRecognizer *)v3 setAllowedTouchTypes:&unk_1F33480D8];
  [(SBAssistantDismissTapGestureRecognizer *)v3 sbf_setPencilTouchesAllowed:self->_allowPencilTouches];
  [(SBAssistantDismissTapGestureRecognizer *)v3 setDelegate:self];
  return v3;
}

- (void)_tappedToDismissSiri:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SBAssistantGestureManager *)self gestureConfiguration];
  int v6 = [v5 shouldDismissForTapsOutsideContent];

  v7 = SBLogSiri();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = _SBFLoggingMethodProem();
    id v9 = (void *)v8;
    id v10 = @"SHOULDN'T";
    if (v6) {
      id v10 = @"SHOULD";
    }
    int v18 = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Assistant %{public}@ dismiss for taps outside of content", (uint8_t *)&v18, 0x16u);
  }
  id v11 = [(SBAssistantGestureManager *)self context];
  v12 = [v11 controlCenterController];
  char v13 = [v12 isPresented];

  BOOL v14 = [(SBAssistantGestureManager *)self _noNewTransientOverlaysPresented];
  if ((v13 & 1) == 0 && v14)
  {
    if (v6)
    {
      [(SBAssistantGestureManager *)self _commonHandlerForSiriDismissalGesture:v4];
    }
    else
    {
      v15 = [(UIWindow *)self->_assistantWindow _sbWindowScene];
      v16 = [v15 assistantController];
      int v17 = [v16 isSystemAssistantExperienceEnabled];

      if (v17) {
        [(SBAssistantGestureManager *)self _notifyInteractionWithGestureRecognizer:v4];
      }
    }
  }
}

- (void)_configureHomeGesture
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (SBHomeGestureEnabled())
  {
    objc_super v3 = [(SBAssistantGestureManager *)self gestureConfiguration];
    if ([v3 shouldShareHomeGesture])
    {
      id v4 = [(SBAssistantGestureManager *)self bottomEdgeDismissGestureRecognizer];

      if (!v4)
      {
        v5 = [MEMORY[0x1E4F4F7D0] sharedInstance];
        uint64_t v6 = [v5 homeButtonType];

        if (v6 == 2) {
          uint64_t v7 = 5;
        }
        else {
          uint64_t v7 = 3;
        }
        uint64_t v8 = [[SBHomeGesturePanGestureRecognizer alloc] initWithTarget:self action:sel__handleBottomEdgeDismissGesture_ type:v7 options:self->_allowPencilTouches];
        bottomEdgeDismissGestureRecognizer = self->_bottomEdgeDismissGestureRecognizer;
        self->_bottomEdgeDismissGestureRecognizer = v8;

        [(SBHomeGesturePanGestureRecognizer *)self->_bottomEdgeDismissGestureRecognizer setDelegate:self];
        [(SBHomeGesturePanGestureRecognizer *)self->_bottomEdgeDismissGestureRecognizer setInterfaceDelegate:self];
        [(SBHomeGesturePanGestureRecognizer *)self->_bottomEdgeDismissGestureRecognizer setCancelsTouchesInView:0];
        [(SBHomeGesturePanGestureRecognizer *)self->_bottomEdgeDismissGestureRecognizer setDelaysTouchesEnded:0];
        [(SBHomeGesturePanGestureRecognizer *)self->_bottomEdgeDismissGestureRecognizer setDelaysTouchesBegan:0];
        [(UIScreenEdgePanGestureRecognizer *)self->_bottomEdgeDismissGestureRecognizer setEdges:4];
        [(UIScreenEdgePanGestureRecognizer *)self->_bottomEdgeDismissGestureRecognizer _setBottomEdgeAngleWindow:*(double *)&kSBAssistantBottomEdgeAngleWindow];
        id v10 = self->_bottomEdgeDismissGestureRecognizer;
        id v11 = [(SBAssistantGestureManager *)self context];
        v12 = [v11 switcherController];
        char v13 = [v12 homeGestureBottomEdgeRecognizer];
        [(SBHomeGesturePanGestureRecognizer *)v10 requireGestureRecognizerToFail:v13];

        [(UIPanGestureRecognizer *)self->_panToDismissSiriGestureRecognizer requireGestureRecognizerToFail:self->_bottomEdgeDismissGestureRecognizer];
        BOOL v14 = [(SBAssistantGestureManager *)self context];
        v15 = [v14 systemGestureManager];
        [v15 addGestureRecognizer:self->_bottomEdgeDismissGestureRecognizer withType:115];

        [(SBAssistantGestureManager *)self _configurePanToDismissGestureDependencies];
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  v16 = [(SBAssistantGestureManager *)self gestureConfiguration];
  if ([v16 shouldShareHomeGesture])
  {
  }
  else
  {
    int v17 = [(SBAssistantGestureManager *)self bottomEdgeDismissGestureRecognizer];

    if (v17) {
      [(SBAssistantGestureManager *)self _removeScreenEdgePanGestureRecognizerIfNecessary];
    }
  }
LABEL_13:
  int v18 = [(SBAssistantGestureManager *)self zStackParticipant];

  if (!v18)
  {
    uint64_t v19 = [(SBAssistantGestureManager *)self context];
    __int16 v20 = [v19 zStackResolver];
    v21 = [v20 acquireParticipantWithIdentifier:17 delegate:self];
    [(SBAssistantGestureManager *)self setZStackParticipant:v21];

    uint64_t v22 = [(SBZStackForegroundSceneOrderedPolicyAssistant *)[SBPhysicalButtonZStackPolicyAssistant alloc] initWithParticipant:self->_zStackParticipant];
    physicalButtonPolicyAssistant = self->_physicalButtonPolicyAssistant;
    self->_physicalButtonPolicyAssistant = v22;

    v24 = [MEMORY[0x1E4F62490] sharedInstance];
    v25 = [(UIWindow *)self->_assistantWindow _sbWindowScene];
    v26 = [v25 _FBSScene];
    v27 = [v26 identityToken];
    v28 = [v24 sceneFromIdentityToken:v27];

    if (v28)
    {
      v29 = self->_physicalButtonPolicyAssistant;
      v31[0] = v28;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
      [(SBZStackForegroundSceneOrderedPolicyAssistant *)v29 setForegroundScenes:v30];
    }
  }
  [(SBAssistantGestureManager *)self _updateZStackParticipantWithReason:@"configuring home gesture"];
}

- (void)_handleBottomEdgeDismissGesture:(id)a3
{
  id v4 = a3;
  v5 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  id v15 = [v5 view];

  [v4 translationInView:v15];
  double v7 = v6;
  double v9 = v8;
  [v4 velocityInView:v15];
  double v11 = v10;
  double v13 = v12;

  if (+[SBAssistantGestureManager shouldDismissSiriForGestureTranslation:velocity:](SBAssistantGestureManager, "shouldDismissSiriForGestureTranslation:velocity:", v7, v9, v11, v13))
  {
    BOOL v14 = [(SBAssistantGestureManager *)self delegate];
    [v14 assistantGestureManagerDidRecognizeDismissGesture:self preferredDismissalOptions:0];
  }
}

- (void)_removeHomeGesture
{
  physicalButtonPolicyAssistant = self->_physicalButtonPolicyAssistant;
  self->_physicalButtonPolicyAssistant = 0;

  id v4 = [(SBAssistantGestureManager *)self zStackParticipant];
  [v4 invalidate];

  [(SBAssistantGestureManager *)self setZStackParticipant:0];
  [(SBAssistantGestureManager *)self _removeScreenEdgePanGestureRecognizerIfNecessary];
}

- (void)_removeScreenEdgePanGestureRecognizerIfNecessary
{
  id v5 = [(SBAssistantGestureManager *)self bottomEdgeDismissGestureRecognizer];
  if (v5)
  {
    objc_super v3 = [(SBAssistantGestureManager *)self context];
    id v4 = [v3 systemGestureManager];
    [v4 removeGestureRecognizer:v5];

    [(SBAssistantGestureManager *)self setBottomEdgeDismissGestureRecognizer:0];
  }
}

- (void)_commonHandlerForSiriDismissalGesture:(id)a3
{
  id v5 = a3;
  double v6 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  double v7 = [v6 view];
  _UISystemGestureLocationInView();
  double v9 = v8;
  double v11 = v10;

  objc_initWeak(&location, self);
  double v12 = [(SBAssistantGestureManager *)self delegate];
  objc_initWeak(&from, v12);

  double v13 = [(SBAssistantGestureManager *)self gestureConfiguration];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__SBAssistantGestureManager__commonHandlerForSiriDismissalGesture___block_invoke;
  v14[3] = &unk_1E6B04FB0;
  v14[4] = self;
  v16[1] = (id)a2;
  objc_copyWeak(&v15, &from);
  objc_copyWeak(v16, &location);
  objc_msgSend(v13, "shouldDismissForGestureAtLocation:completion:", v14, v9, v11);

  objc_destroyWeak(v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __67__SBAssistantGestureManager__commonHandlerForSiriDismissalGesture___block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogSiri();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = _SBFLoggingMethodProem();
    double v6 = (void *)v5;
    double v7 = @"SHOULD NOT";
    if (a2) {
      double v7 = @"SHOULD";
    }
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    BOOL v14 = v7;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ -  %{public}@ dismiss for gesture at location", (uint8_t *)&v11, 0x16u);
  }
  if (a2)
  {
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F9F958]) initWithDeactivationOptions:0 animated:1 dismissalReason:23];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v10 = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained assistantGestureManagerDidRecognizeDismissGesture:v10 preferredDismissalOptions:v8];
  }
}

- (void)_notifyInteractionWithGestureRecognizer:(id)a3
{
  id v11 = a3;
  id v4 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  uint64_t v5 = [v4 view];
  _UISystemGestureLocationInView();
  double v7 = v6;
  double v9 = v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 state] == 1)
  {
    id v10 = [(SBAssistantGestureManager *)self gestureConfiguration];
    objc_msgSend(v10, "notifyPanBeganAtPoint:", v7, v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    id v10 = [(SBAssistantGestureManager *)self gestureConfiguration];
    objc_msgSend(v10, "notifyTapAtPoint:", v7, v9);
  }

LABEL_7:
}

- (void)_updateRootViewControllerOwnsHomeGesture
{
  objc_super v3 = [(SBAssistantGestureManager *)self zStackParticipant];
  if ([v3 ownsHomeGesture])
  {
    id v4 = [(SBAssistantGestureManager *)self gestureConfiguration];
    uint64_t v5 = [v4 shouldShareHomeGesture] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  id v6 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  [v6 setOwnsHomeGesture:v5];
}

- (void)_updateRootViewControllerShowsHomeAffordance:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBAssistantGestureManager *)self zStackParticipant];
  int v6 = [v5 homeAffordanceDrawingSuppressed];

  double v7 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  double v8 = v7;
  uint64_t v9 = v3 & ~v6;
  if ((v3 & ~v6) != 0) {
    id v10 = self;
  }
  else {
    id v10 = 0;
  }
  [v7 setShowsHomeAffordance:v9];

  id v11 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  [v11 setHomeGrabberPointerClickDelegate:v10];
}

- (void)_updateRootViewControllerDimsContentBelow
{
  BOOL v3 = [(UIWindow *)self->_assistantWindow _sbWindowScene];
  id v8 = [v3 assistantController];

  if ([v8 isSystemAssistantExperienceEnabled])
  {
    id v4 = [v8 presentationContext];
    if ([v4 modality] == 2)
    {
      uint64_t v5 = [v8 presentationContext];
      if ([v5 isKeyboardVisible]) {
        uint64_t v6 = [(SBFZStackParticipant *)self->_zStackParticipant participantBelowAllowsDimming];
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v7 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  [v7 setDimsContentBelow:v6];
}

- (void)_updateZStackParticipantWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(SBAssistantGestureManager *)self zStackParticipant];
  [v5 setNeedsUpdatePreferencesWithReason:v4];
}

- (BOOL)_noNewTransientOverlaysPresented
{
  v2 = self;
  BOOL v3 = [(SBAssistantGestureManager *)self context];
  id v4 = [v3 transientOverlayPresenter];
  id v5 = [v4 topmostPresentedViewController];

  LOBYTE(v2) = v5 == v2->_topmostTransientViewControllerAtPresentation;
  return (char)v2;
}

- (id)_assistantRootViewController
{
  v2 = [(SBAssistantGestureManager *)self assistantWindow];
  BOOL v3 = [v2 assistantRootViewController];

  return v3;
}

- (void)zStackParticipantDidChange:(id)a3
{
  [(SBAssistantGestureManager *)self _updateRootViewControllerOwnsHomeGesture];
  id v4 = [(SBAssistantGestureManager *)self gestureConfiguration];
  -[SBAssistantGestureManager _updateRootViewControllerShowsHomeAffordance:](self, "_updateRootViewControllerShowsHomeAffordance:", [v4 shouldShowHomeAffordance]);

  [(SBAssistantGestureManager *)self _updateRootViewControllerDimsContentBelow];
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v10 = a4;
  id v5 = [(SBAssistantGestureManager *)self gestureConfiguration];
  int v6 = [v5 shouldShareHomeGesture];

  [v10 setActivationPolicyForParticipantsBelow:v6 ^ 1u];
  objc_msgSend(v10, "setHomeAffordanceDrawingSuppression:", -[SBAssistantGestureManager homeAffordanceSuppression](self, "homeAffordanceSuppression"));
  double v7 = -[SBPhysicalButtonZStackPolicyAssistant physicalButtonSceneTargets]((uint64_t)self->_physicalButtonPolicyAssistant);
  [v10 setPhysicalButtonSceneTargets:v7];

  id v8 = -[SBPhysicalButtonZStackPolicyAssistant captureButtonFullFidelityEventRequestingScenes]((uint64_t)self->_physicalButtonPolicyAssistant);
  [v10 setCaptureButtonFullFidelityEventRequestingScenes:v8];

  uint64_t v9 = -[SBPhysicalButtonZStackPolicyAssistant foregroundCaptureSceneTargets]((uint64_t)self->_physicalButtonPolicyAssistant);
  [v10 setForegroundCaptureSceneTargets:v9];
}

- (void)homeGrabberViewDidReceiveClick:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogSiri();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = _SBFLoggingMethodProem();
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: %@", (uint8_t *)&v10, 0x16u);
  }
  double v7 = [(SBAssistantGestureManager *)self zStackParticipant];
  int v8 = [v7 ownsHomeGesture];

  if (v8)
  {
    uint64_t v9 = [(SBAssistantGestureManager *)self delegate];
    [v9 assistantGestureManagerDidRecognizeDismissGesture:self preferredDismissalOptions:0];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBAssistantGestureManager *)self panToDismissSiriGestureRecognizer];

  if (v8 == v6)
  {
    BOOL v12 = 0;
  }
  else
  {
    id v9 = [(SBAssistantGestureManager *)self bottomEdgeDismissGestureRecognizer];
    if (v9 == v6)
    {
      BOOL v12 = 1;
    }
    else
    {
      id v10 = [(SBAssistantGestureManager *)self bottomEdgeDismissGestureRecognizer];
      if (v10 == v7)
      {
        BOOL v12 = 1;
      }
      else
      {
        id v11 = [(SBAssistantGestureManager *)self tapToDismissSiriGestureRecognizer];
        BOOL v12 = v11 == v6;
      }
    }
  }
  return v12;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(SBAssistantGestureManager *)self bottomEdgeDismissGestureRecognizer];

  if (v5 == v4)
  {
    id v7 = [(SBAssistantGestureManager *)self zStackParticipant];
    if ([v7 ownsHomeGesture])
    {
      id v8 = [(SBAssistantGestureManager *)self gestureConfiguration];
      char v6 = [v8 shouldShareHomeGesture];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }
  uint64_t v9 = [(SBAssistantGestureManager *)self panToDismissSiriGestureRecognizer];
  if ((id)v9 == v4)
  {

LABEL_11:
    BOOL v12 = [(SBAssistantGestureManager *)self zStackParticipant];
    char v6 = [v12 ownsHomeGesture];

    goto LABEL_12;
  }
  id v10 = (void *)v9;
  id v11 = [(SBAssistantGestureManager *)self tapToDismissSiriGestureRecognizer];

  if (v11 == v4) {
    goto LABEL_11;
  }
LABEL_12:

  return v6;
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  BOOL v3 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  id v4 = [v3 contentView];

  return v4;
}

- (int64_t)touchInterfaceOrientationForGestureRecognizer:(id)a3
{
  BOOL v3 = [(SBAssistantGestureManager *)self _assistantRootViewController];
  int64_t v4 = [v3 interfaceOrientation];

  return v4;
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    BOOL v12 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(SBAssistantGestureManager *)self _didUpdateHomeGestureSharing:v4];
}

- (void)_didUpdateHomeGestureSharing:(BOOL)a3
{
  [(SBAssistantGestureManager *)self _updateZStackParticipantWithReason:@"Siri changed shareHomeGesture"];
  [(SBAssistantGestureManager *)self _resetDismissalSystemGestures];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    BOOL v12 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(SBAssistantGestureManager *)self _didUpdateShouldDismissForTapsOutsideContent:v4];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    BOOL v12 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(SBAssistantGestureManager *)self _didUpdateShouldDismissForSwipesOutsideContent:v4];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    BOOL v12 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(SBAssistantGestureManager *)self _didUpdateTouchesPassThroughToSpringBoard:v4];
}

- (void)_didUpdateTouchesPassThroughToSpringBoard:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBAssistantGestureManager *)self assistantWindow];
  [v4 setAllowsTouchPassThrough:v3];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldShowHomeAffordance:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = _SBFLoggingMethodProem();
    id v8 = NSStringFromBOOL();
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    BOOL v12 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(SBAssistantGestureManager *)self _didUpdateSiriHomeAffordanceSuppression:v4];
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeAffordanceSuppression:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v6 = SBLogSiri();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = _SBFLoggingMethodProem();
    id v8 = [NSString stringWithSiriHomeAffordanceSuppression:a4];
    int v9 = 138543618;
    id v10 = v7;
    __int16 v11 = 2114;
    BOOL v12 = v8;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "%{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(SBAssistantGestureManager *)self _didUpdateSiriHomeAffordanceSuppression:a4];
}

- (void)_didUpdateSiriHomeAffordanceSuppression:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    [(SBAssistantGestureManager *)self _didUpdateShouldShowHomeAffordance:(a3 & 1) == 0];
    [(SBAssistantGestureManager *)self setHomeAffordanceSuppression:a3];
  }
  [(SBAssistantGestureManager *)self _updateRootViewControllerOwnsHomeGesture];
  [(SBAssistantGestureManager *)self _updateZStackParticipantWithReason:@"siri updated home affordance suppression"];
}

- (void)assistantSession:(id)a3 didChangePresentationInWindowScene:(id)a4
{
  id v5 = [a3 presentationContext];
  int v6 = [v5 isAssistantPresented];

  if (v6)
  {
    [(SBAssistantGestureManager *)self _setupSystemDismissalGestures];
    [(SBAssistantGestureManager *)self _configureHomeGesture];
  }
  else
  {
    [(SBAssistantGestureManager *)self _tearDownDismissalSystemGestures];
    [(SBAssistantGestureManager *)self _removeHomeGesture];
  }
  id v7 = [(SBAssistantGestureManager *)self gestureConfiguration];
  -[SBAssistantGestureManager _didUpdateTouchesPassThroughToSpringBoard:](self, "_didUpdateTouchesPassThroughToSpringBoard:", [v7 shouldPassTouchesThroughToSpringBoard]);

  id v8 = [(SBAssistantGestureManager *)self gestureConfiguration];
  -[SBAssistantGestureManager _didUpdateSiriHomeAffordanceSuppression:](self, "_didUpdateSiriHomeAffordanceSuppression:", [v8 homeAffordanceSuppression]);

  int v9 = [(SBAssistantGestureManager *)self gestureConfiguration];
  -[SBAssistantGestureManager _didUpdateHomeGestureSharing:](self, "_didUpdateHomeGestureSharing:", [v9 shouldShareHomeGesture]);

  [(SBAssistantGestureManager *)self _updateRootViewControllerDimsContentBelow];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:@"assistantAnimationDuration"] & 1) != 0
    || [v5 isEqualToString:@"assistantDismissAnimationDurationOverApp"])
  {
    [(SBAssistantGestureManager *)self _prototypeSettingsChanged];
  }
}

- (void)_prototypeSettingsChanged
{
  [(SBSystemAnimationSettings *)self->_settings assistantBottomEdgeDismissThreshold];
  *(double *)&kSBAssistantBottomEdgeDismissTranslationThreshold = v3;
  [(SBSystemAnimationSettings *)self->_settings assistantBottomEdgeDismissVelocity];
  *(double *)&kSBAssistantBottomEdgeDismissVelocityThreshold = v4;
  id v6 = +[SBHomeGestureDomain rootSettings];
  [v6 edgeAngleWindow];
  kSBAssistantBottomEdgeAngleWindow = v5;
}

- (SBAssistantGestureManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAssistantGestureManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBTransientOverlayViewController)topmostTransientViewControllerAtPresentation
{
  return self->_topmostTransientViewControllerAtPresentation;
}

- (void)setTopmostTransientViewControllerAtPresentation:(id)a3
{
}

- (SBAssistantGestureConfiguration)gestureConfiguration
{
  return self->_gestureConfiguration;
}

- (SBAssistantWindow)assistantWindow
{
  return self->_assistantWindow;
}

- (SBAssistantContext)context
{
  return self->_context;
}

- (SBHomeGesturePanGestureRecognizer)bottomEdgeDismissGestureRecognizer
{
  return self->_bottomEdgeDismissGestureRecognizer;
}

- (void)setBottomEdgeDismissGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapToDismissSiriGestureRecognizer
{
  return self->_tapToDismissSiriGestureRecognizer;
}

- (void)setTapToDismissSiriGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)panToDismissSiriGestureRecognizer
{
  return self->_panToDismissSiriGestureRecognizer;
}

- (void)setPanToDismissSiriGestureRecognizer:(id)a3
{
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (int64_t)homeAffordanceSuppression
{
  return self->_homeAffordanceSuppression;
}

- (void)setHomeAffordanceSuppression:(int64_t)a3
{
  self->_homeAffordanceSuppression = a3;
}

- (SBPhysicalButtonZStackPolicyAssistant)physicalButtonPolicyAssistant
{
  return self->_physicalButtonPolicyAssistant;
}

- (void)setPhysicalButtonPolicyAssistant:(id)a3
{
}

- (BOOL)allowPencilTouches
{
  return self->_allowPencilTouches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonPolicyAssistant, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_panToDismissSiriGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToDismissSiriGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_bottomEdgeDismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_assistantWindow, 0);
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_topmostTransientViewControllerAtPresentation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end