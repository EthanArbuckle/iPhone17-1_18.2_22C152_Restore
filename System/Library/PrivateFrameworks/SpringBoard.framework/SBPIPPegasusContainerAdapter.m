@interface SBPIPPegasusContainerAdapter
- (BOOL)handleDoubleTapGesture;
- (BOOL)handleTapWhileStashedGesture;
- (BOOL)interactionControllerScalesDuringPanGesture:(id)a3;
- (BOOL)isStashTabHiddenForContainerViewController:(id)a3;
- (BOOL)shouldDisableIdleTimerForContainerViewController:(id)a3;
- (BOOL)shouldPointerInteractionBeginForInteractionController:(id)a3 atLocation:(CGPoint)a4 inView:(id)a5;
- (BOOL)shouldSuppressAssociatedElementsInSystemAperture;
- (NSNumber)overrideResourcesUsageReductionTimeout;
- (PGPictureInPictureViewController)pictureInPictureViewController;
- (SBPIPPegasusContainerAdapter)initWithPictureInPictureViewController:(id)a3;
- (UIEdgeInsets)interactionController:(id)a3 edgeInsetsForWindowScene:(id)a4;
- (UIEdgeInsets)interactionController:(id)a3 stashedPaddingForWindowScene:(id)a4;
- (double)currentCornerRadiusForInteractionController:(id)a3;
- (id)bundleIdentifierForContainerViewController:(id)a3;
- (id)contentViewControllerForContainerViewController:(id)a3;
- (id)debugName;
- (id)defaultPositionHyperregionComposers;
- (id)interactionControllerConnectedWindowScenes:(id)a3;
- (id)layoutSettings;
- (id)morphAnimatorTargetContainerViewForContainerViewController:(id)a3;
- (id)morphAnimatorTargetViewForContainerViewController:(id)a3;
- (id)scenePersistenceIdentifierForContainerViewController:(id)a3;
- (id)systemGestureManagerForInteractionControllerResizing:(id)a3;
- (id)systemPointerInteractionManagerForInteractionController:(id)a3;
- (int)processIdentifierForContainerViewController:(id)a3;
- (void)_acquireVisibilityAssertionIfNeeded;
- (void)_createOrInvalidateStashTabVisibilityPolicyProvider;
- (void)_invalidateVisibilityAssertion;
- (void)_performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)_reloadMenuButton;
- (void)acquireInterfaceOrientationLock;
- (void)containerViewController:(id)a3 didUpdateContentViewFrame:(CGRect)a4 reason:(id)a5;
- (void)containerViewController:(id)a3 didUpdateStashProgress:(double)a4;
- (void)containerViewController:(id)a3 didUpdateStashState:(BOOL)a4 springSettings:(id)a5;
- (void)containerViewController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5 springSettings:(id)a6 completion:(id)a7;
- (void)containerViewController:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4;
- (void)containerViewControllerDidEndInteraction:(id)a3;
- (void)containerViewControllerDidEndSizeChange:(id)a3;
- (void)containerViewControllerStartReducingResourcesUsage:(id)a3;
- (void)containerViewControllerStopReducingResourcesUsage:(id)a3;
- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4;
- (void)dealloc;
- (void)invalidate;
- (void)loadSubviewsForContainerViewController:(id)a3;
- (void)notePictureInPictureViewControllerPrefersHiddenFromClonedDisplayDidChange;
- (void)notePictureInPictureViewControllerTetheringDidUpdate;
- (void)performRotateAnimationWithRotation:(int64_t)a3 completionHandler:(id)a4;
- (void)performStartAnimationWithCompletionHandler:(id)a3;
- (void)performStartInIsolationWithCompletionHandler:(id)a3;
- (void)performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)performStopInIsolationWithCompletionHandler:(id)a3;
- (void)pictureInPictureClientDidRequestStashing;
- (void)preferredContentSizeDidChangeForPictureInPictureViewController;
- (void)prepareStartAnimationWithInitialInterfaceOrientation:(int64_t)a3 initialLayerFrame:(CGRect)a4 completionHandler:(id)a5;
- (void)relinquishInterfaceOrientationLock;
- (void)setContainerViewController:(id)a3;
- (void)stashTabVisibilityPolicyProviderDidUpdatePolicy:(id)a3;
- (void)transitionAnimationDidEndForContainerViewController:(id)a3;
- (void)transitionAnimationWillBeginForContainerViewController:(id)a3;
@end

@implementation SBPIPPegasusContainerAdapter

- (SBPIPPegasusContainerAdapter)initWithPictureInPictureViewController:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBPIPPegasusContainerAdapter;
  v6 = [(SBPIPPegasusContainerAdapter *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pictureInPictureViewController, a3);
    [(PGPictureInPictureViewController *)v7->_pictureInPictureViewController setContentContainer:v7];
    v8 = +[SBPIPContentViewLayoutMetrics pegasusMetricsForContentType:](SBPIPContentViewLayoutMetrics, "pegasusMetricsForContentType:", [v5 contentType]);
    [v8 minimumStashedTabSize];
    v7->_minimumStashTabSize.width = v9;
    v7->_minimumStashTabSize.height = v10;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBPIPPegasusContainerAdapter.m", 94, @"Attempting to dealloc %@ without invalidating.", self object file lineNumber description];
  }
  v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = _SBFLoggingMethodProem();
    *(_DWORD *)buf = 138543362;
    CGFloat v9 = v5;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)SBPIPPegasusContainerAdapter;
  [(SBPIPPegasusContainerAdapter *)&v7 dealloc];
}

- (void)invalidate
{
  if (self->_invalidated)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBPIPPegasusContainerAdapter.m" lineNumber:101 description:@"Attempting to -invalidate twice; this is unsupported."];
  }
  self->_invalidated = 1;
  [(SBPIPPegasusContainerAdapter *)self _invalidateVisibilityAssertion];
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController setContentContainer:0];
  [(SBPIPStashTabSuppressionPolicyProvider *)self->_stashTabVisibilityPolicyProvider invalidate];
  stashTabVisibilityPolicyProvider = self->_stashTabVisibilityPolicyProvider;
  self->_stashTabVisibilityPolicyProvider = 0;
}

- (void)setContainerViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containerViewController, obj);
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(obj, "setPrefersHiddenFromClonedDisplay:", -[PGPictureInPictureViewController prefersHiddenFromClonedDisplay](self->_pictureInPictureViewController, "prefersHiddenFromClonedDisplay"));
    }
  }
}

- (void)loadSubviewsForContainerViewController:(id)a3
{
  -[PGPictureInPictureViewController setMinimumStashTabSize:](self->_pictureInPictureViewController, "setMinimumStashTabSize:", a3, self->_minimumStashTabSize.width, self->_minimumStashTabSize.height);
  [(SBPIPPegasusContainerAdapter *)self _reloadMenuButton];
}

- (id)bundleIdentifierForContainerViewController:(id)a3
{
  v3 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController application];
  v4 = [v3 bundleIdentifier];

  return v4;
}

- (id)scenePersistenceIdentifierForContainerViewController:(id)a3
{
  return (id)[(PGPictureInPictureViewController *)self->_pictureInPictureViewController sourceSceneSessionPersistentIdentifier];
}

- (int)processIdentifierForContainerViewController:(id)a3
{
  v3 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController application];
  int v4 = [v3 processIdentifier];

  return v4;
}

- (id)contentViewControllerForContainerViewController:(id)a3
{
  return self->_pictureInPictureViewController;
}

- (BOOL)shouldDisableIdleTimerForContainerViewController:(id)a3
{
  return [(PGPictureInPictureViewController *)self->_pictureInPictureViewController prefersIdleTimerDisabled];
}

- (void)transitionAnimationWillBeginForContainerViewController:(id)a3
{
}

- (void)transitionAnimationDidEndForContainerViewController:(id)a3
{
}

- (id)morphAnimatorTargetViewForContainerViewController:(id)a3
{
  return (id)[(PGPictureInPictureViewController *)self->_pictureInPictureViewController view];
}

- (id)morphAnimatorTargetContainerViewForContainerViewController:(id)a3
{
  return (id)[(PGPictureInPictureViewController *)self->_pictureInPictureViewController contentContainerView];
}

- (void)containerViewController:(id)a3 didUpdateContentViewFrame:(CGRect)a4 reason:(id)a5
{
}

- (void)containerViewController:(id)a3 didUpdateStashState:(BOOL)a4 springSettings:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController setStashed:v5];
  if (!v5) {
    [(PGPictureInPictureViewController *)self->_pictureInPictureViewController setStashTabHidden:1 left:0 withSpringBehavior:v7];
  }
  [(SBPIPPegasusContainerAdapter *)self _createOrInvalidateStashTabVisibilityPolicyProvider];
}

- (void)containerViewController:(id)a3 willBeginInteractionWithGestureRecognizer:(id)a4
{
  self->_isAnyInteractionGestureActive = 1;
  [(SBPIPPegasusContainerAdapter *)self _createOrInvalidateStashTabVisibilityPolicyProvider];
}

- (void)containerViewControllerDidEndInteraction:(id)a3
{
  self->_isAnyInteractionGestureActive = 0;
  [(SBPIPPegasusContainerAdapter *)self _createOrInvalidateStashTabVisibilityPolicyProvider];
}

- (void)containerViewControllerWillBeginSizeChange:(id)a3 behavior:(int)a4
{
  if (!self->_isChangingSize)
  {
    self->_isChangingSize = 1;
    [(PGPictureInPictureViewController *)self->_pictureInPictureViewController hostedWindowSizeChangeBegan];
    pictureInPictureViewController = self->_pictureInPictureViewController;
    [(PGPictureInPictureViewController *)pictureInPictureViewController setInteractivelyResizing:a4 != 0];
  }
}

- (void)containerViewControllerDidEndSizeChange:(id)a3
{
  if (self->_isChangingSize)
  {
    self->_isChangingSize = 0;
    [(PGPictureInPictureViewController *)self->_pictureInPictureViewController setInteractivelyResizing:0];
    pictureInPictureViewController = self->_pictureInPictureViewController;
    BOOL v5 = [(PGPictureInPictureViewController *)pictureInPictureViewController view];
    [v5 bounds];
    -[PGPictureInPictureViewController updateHostedWindowSize:](pictureInPictureViewController, "updateHostedWindowSize:", v6, v7);

    v8 = self->_pictureInPictureViewController;
    [(PGPictureInPictureViewController *)v8 hostedWindowSizeChangeEnded];
  }
}

- (void)containerViewController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5 springSettings:(id)a6 completion:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a7;
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController setStashTabHidden:v9 left:v8 withSpringBehavior:a6];
  v11 = v12;
  if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
    v11 = v12;
  }
}

- (void)containerViewController:(id)a3 didUpdateStashProgress:(double)a4
{
}

- (BOOL)isStashTabHiddenForContainerViewController:(id)a3
{
  return [(PGPictureInPictureViewController *)self->_pictureInPictureViewController isStashTabHidden];
}

- (void)containerViewControllerStartReducingResourcesUsage:(id)a3
{
}

- (void)containerViewControllerStopReducingResourcesUsage:(id)a3
{
}

- (void)notePictureInPictureViewControllerTetheringDidUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  int v4 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController tetheredViewController];
  BOOL v5 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController tetheringViewController];
  double v6 = +[SBMainWorkspace sharedInstance];
  double v7 = [v6 pipControllerForType:0];

  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"SBPIPPegasusContainerAdapter.m" lineNumber:244 description:@"SBPIPController was expected"];
  }
  uint64_t v8 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController tetheringMode];
  [(id)objc_opt_class() defaultContentCornerRadius];
  if (v5)
  {
    if (v8 == 1) {
      [(PGPictureInPictureViewController *)self->_pictureInPictureViewController setContentCornerRadius:1 animated:v9 + -4.0];
    }
    uint64_t v10 = [v7 containerViewControllerForContentViewController:v5];
    [WeakRetained setTetheringContainerViewController:v10];
    v11 = [WeakRetained view];
    id v12 = [v11 window];

    v13 = [v12 windowScene];
    v14 = [v10 view];
    v15 = [v14 window];
    v16 = [v15 windowScene];

    if (v13 != v16) {
      [v12 setWindowScene:v16];
    }

    if (v4) {
      goto LABEL_9;
    }
  }
  else
  {
    -[PGPictureInPictureViewController setContentCornerRadius:animated:](self->_pictureInPictureViewController, "setContentCornerRadius:animated:", 1);
    if (v4)
    {
LABEL_9:
      v17 = [v7 containerViewControllerForContentViewController:v4];
      goto LABEL_12;
    }
  }
  v17 = 0;
LABEL_12:
  [WeakRetained setTetheredContainerViewController:v17];
  [WeakRetained setIsActivelyTethered:v5 != 0 mode:v8];
  v18 = [WeakRetained _sbWindowScene];
  [v7 bringTetheredContentToFrontOnWindowScene:v18];
}

- (void)preferredContentSizeDidChangeForPictureInPictureViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController preferredContentSize];
  objc_msgSend(WeakRetained, "updatePreferredContentSize:");
}

- (void)prepareStartAnimationWithInitialInterfaceOrientation:(int64_t)a3 initialLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  p_containerViewController = &self->_containerViewController;
  id v12 = (void (**)(void))a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  objc_msgSend(WeakRetained, "startAnimationWillBeginWithInitialInterfaceOrientation:initialFrame:", a3, x, y, width, height);

  v12[2](v12);
  [(SBPIPPegasusContainerAdapter *)self _acquireVisibilityAssertionIfNeeded];
}

- (void)performStartAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(SBPIPPegasusContainerAdapter *)self _acquireVisibilityAssertionIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v6 = [WeakRetained windowInterfaceOrientation];
  objc_msgSend(WeakRetained, "startShowingContentWithAnimationSettings:parameters:completion:", 0, 0, 0.0, 0.0, 0.0);
  double v7 = (void *)MEMORY[0x1E4F88578];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__SBPIPPegasusContainerAdapter_performStartAnimationWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E6AF4A70;
  id v15 = WeakRetained;
  uint64_t v16 = v6;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__SBPIPPegasusContainerAdapter_performStartAnimationWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E6B0BA70;
  id v11 = v15;
  id v12 = v4;
  uint64_t v13 = v6;
  id v8 = v15;
  id v9 = v4;
  [v7 animateViewWithAnimationType:0 initialSpringVelocity:v14 animations:v10 completion:0.0];
}

uint64_t __75__SBPIPPegasusContainerAdapter_performStartAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startAnimationDidBeginWithInitialInterfaceOrientation:*(void *)(a1 + 40)];
}

uint64_t __75__SBPIPPegasusContainerAdapter_performStartAnimationWithCompletionHandler___block_invoke_2(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  return [v2 startAnimationDidCompleteWithInitialInterfaceOrientation:v3];
}

- (void)performStartInIsolationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(SBPIPPegasusContainerAdapter *)self _acquireVisibilityAssertionIfNeeded];
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController showChrome:1 animated:0];
  BOOL v5 = +[SBPIPSettingsDomain rootSettings];
  uint64_t v6 = [v5 fadeInOutSettings];
  id v16 = [v6 fadeInOutAnimationSettings];

  double v7 = +[SBPIPSettingsDomain rootSettings];
  id v8 = [v7 fadeInOutSettings];
  [v8 fadeInInitialValues];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "startShowingContentWithAnimationSettings:parameters:completion:", v16, v4, v10, v12, v14);
}

- (void)performStopInIsolationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[SBPIPSettingsDomain rootSettings];
  uint64_t v6 = [v5 fadeInOutSettings];
  double v7 = [v6 fadeInOutAnimationSettings];

  id v8 = +[SBPIPSettingsDomain rootSettings];
  double v9 = [v8 fadeInOutSettings];
  [v9 fadeOutFinalValues];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__SBPIPPegasusContainerAdapter_performStopInIsolationWithCompletionHandler___block_invoke;
  v18[3] = &unk_1E6AF5A78;
  v18[4] = self;
  id v19 = v4;
  id v17 = v4;
  objc_msgSend(WeakRetained, "stopShowingContentWithAnimationSettings:parameters:completion:", v7, v18, v11, v13, v15);
}

uint64_t __76__SBPIPPegasusContainerAdapter_performStopInIsolationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _invalidateVisibilityAssertion];
}

- (void)performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v12 = [WeakRetained _sbWindowScene];
  objc_initWeak(location, self);
  double v13 = self->_pictureInPictureViewController;
  double v14 = +[SBSceneManagerCoordinator sharedInstance];
  double v15 = [(PGPictureInPictureViewController *)v13 sourceSceneSessionPersistentIdentifier];
  id v16 = [v14 sceneManagerForPersistenceIdentifier:v15];
  v42 = (void *)v12;
  v43 = v10;

  id v17 = [(PGPictureInPictureViewController *)v13 sourceSceneSessionPersistentIdentifier];
  v18 = [v16 existingSceneHandleForPersistenceIdentifier:v17];

  id v19 = [v18 sceneIfExists];
  v20 = [v19 settings];
  int v21 = [v20 isForeground];
  v22 = "@(#)PROGRAM:SpringBoard  PROJECT:SpringBoard-1\n";
  if (!v21)
  {
    v25 = 0;
    goto LABEL_12;
  }
  v23 = [(id)SBApp windowSceneManager];
  v24 = [v20 displayIdentity];
  v25 = [v23 windowSceneForDisplayIdentity:v24];

  v26 = [v25 switcherController];
  v27 = [v18 application];
  if ([v27 isMedusaCapable]) {
    goto LABEL_9;
  }
  int v28 = [v26 isChamoisWindowingUIEnabled];

  if (v28)
  {
    v27 = [v26 layoutState];
    v29 = [v27 appLayout];
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    uint64_t v57 = 0;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke;
    v51[3] = &unk_1E6AFD168;
    id v52 = v18;
    v53 = &v54;
    v41 = v29;
    [v29 enumerate:v51];
    if (v55[3])
    {
      v30 = [(PGPictureInPictureViewController *)v13 view];
      v40 = [v30 window];

      int64_t v31 = a3;
      if (!a3) {
        int64_t v31 = [v40 interfaceOrientation];
      }
      [v26 frameForItemWithRole:v55[3] inMainAppLayout:v41 interfaceOrientation:v31];
      objc_msgSend(v40, "_convertRectToSceneReferenceSpace:");
      CGFloat x = v32;
      CGFloat y = v33;
      CGFloat width = v34;
      CGFloat height = v35;
    }
    _Block_object_dispose(&v54, 8);

LABEL_9:
  }

  v22 = "@(#)PROGRAM:SpringBoard  PROJECT:SpringBoard-1\n";
LABEL_12:
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = *((void *)v22 + 7);
  v45[2] = __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2;
  v45[3] = &unk_1E6B0BAC0;
  id v36 = v25;
  id v46 = v36;
  id v37 = v42;
  id v47 = v37;
  id v38 = WeakRetained;
  id v48 = v38;
  objc_copyWeak(v50, location);
  v50[1] = (id)a3;
  v50[2] = *(id *)&x;
  v50[3] = *(id *)&y;
  v50[4] = *(id *)&width;
  v50[5] = *(id *)&height;
  id v39 = v43;
  id v49 = v39;
  [v38 performAfterInFlightAnimationsComplete:v45];

  objc_destroyWeak(v50);
  objc_destroyWeak(location);
}

void __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  double v7 = [a3 uniqueIdentifier];
  id v8 = [*(id *)(a1 + 32) sceneIdentifier];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
}

void __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && v2 != *(void *)(a1 + 40))
  {
    uint64_t v3 = [*(id *)(a1 + 48) view];
    [v3 setHidden:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = *(void *)(a1 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3;
  v6[3] = &unk_1E6B0BA98;
  id v7 = *(id *)(a1 + 56);
  objc_copyWeak(&v8, (id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_performStopAnimationWithFinalInterfaceOrientation:finalLayerFrame:completionHandler:", v5, v6, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_destroyWeak(&v8);
}

void __116__SBPIPPegasusContainerAdapter_performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invalidateVisibilityAssertion];
}

- (void)_performStopAnimationWithFinalInterfaceOrientation:(int64_t)a3 finalLayerFrame:(CGRect)a4 completionHandler:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  objc_msgSend(WeakRetained, "stopAnimationWillBeginWithFinalInterfaceOrientation:finalFrame:", a3, x, y, width, height);
  objc_initWeak(&location, self);
  double v13 = (void *)MEMORY[0x1E4F88578];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __117__SBPIPPegasusContainerAdapter__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke;
  v20[3] = &unk_1E6AFA388;
  id v21 = WeakRetained;
  int64_t v22 = a3;
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__SBPIPPegasusContainerAdapter__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2;
  v16[3] = &unk_1E6B0BAE8;
  id v14 = v11;
  id v18 = v14;
  id v15 = v21;
  id v17 = v15;
  v19[1] = (id)a3;
  objc_copyWeak(v19, &location);
  [v13 animateViewWithAnimationType:0 initialSpringVelocity:v20 animations:v16 completion:0.0];
  objc_destroyWeak(v19);

  objc_destroyWeak(&location);
}

uint64_t __117__SBPIPPegasusContainerAdapter__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAnimationDidBeginWithFinalInterfaceOrientation:finalFrame:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

void __117__SBPIPPegasusContainerAdapter__performStopAnimationWithFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) stopAnimationDidCompleteWithFinalInterfaceOrientation:*(void *)(a1 + 56)];
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _invalidateVisibilityAssertion];
  }
}

- (void)performRotateAnimationWithRotation:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  if ((unint64_t)(a3 - 1) >= 3) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = a3;
  }
  int v9 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController view];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(WeakRetained, "rotationAnimationWillBeginToRotation:contentViewFrame:", v8, v11, v13, v15, v17);
  id v18 = +[SBPIPSettingsDomain rootSettings];
  id v19 = [v18 interactionSettings];
  v20 = [v19 rotationFluidBehavior];

  id v21 = (void *)MEMORY[0x1E4F42FF0];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke;
  v32[3] = &unk_1E6AFA388;
  id v33 = WeakRetained;
  int64_t v34 = v8;
  double v35 = v11;
  double v36 = v13;
  double v37 = v15;
  double v38 = v17;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke_3;
  v24[3] = &unk_1E6B0BB10;
  id v26 = v6;
  int64_t v27 = v8;
  double v28 = v11;
  double v29 = v13;
  double v30 = v15;
  double v31 = v17;
  id v25 = v33;
  id v22 = v6;
  id v23 = v33;
  [v21 _animateUsingSpringBehavior:v20 tracking:1 animations:v32 completion:v24];
}

void __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v15.minimum;
  float maximum = v15.maximum;
  float preferred = v15.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke_2;
  v10[3] = &unk_1E6AFA388;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v11 = v6;
  uint64_t v12 = v7;
  long long v8 = *(_OWORD *)(a1 + 64);
  long long v13 = *(_OWORD *)(a1 + 48);
  long long v14 = v8;
  *(float *)&long long v8 = maximum;
  *(float *)&double v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114140, v10, COERCE_DOUBLE(__PAIR64__(DWORD1(v13), LODWORD(minimum))), *(double *)&v8, v9);
}

uint64_t __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "rotationAnimationDidBeginToRotation:contentViewFrame:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __85__SBPIPPegasusContainerAdapter_performRotateAnimationWithRotation_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "rotationAnimationWillCompleteToRotation:contentViewFrame:", *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  double v7 = *(double *)(a1 + 80);
  return objc_msgSend(v2, "rotationAnimationDidCompleteToRotation:contentViewFrame:", v3, v4, v5, v6, v7);
}

- (void)acquireInterfaceOrientationLock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained acquireInterfaceOrientationLock];
}

- (void)relinquishInterfaceOrientationLock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained relinquishInterfaceOrientationLock];
}

- (BOOL)handleDoubleTapGesture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  char v3 = [WeakRetained toggleUserPreferredScale];

  return v3;
}

- (BOOL)handleTapWhileStashedGesture
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained setStashed:0];
  char v3 = [WeakRetained isStashed] ^ 1;

  return v3;
}

- (void)notePictureInPictureViewControllerPrefersHiddenFromClonedDisplayDidChange
{
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    objc_msgSend(WeakRetained, "setPrefersHiddenFromClonedDisplay:", -[PGPictureInPictureViewController prefersHiddenFromClonedDisplay](self->_pictureInPictureViewController, "prefersHiddenFromClonedDisplay"));
  }
}

- (void)pictureInPictureClientDidRequestStashing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained setStashed:1];
}

- (NSNumber)overrideResourcesUsageReductionTimeout
{
  char v3 = &unk_1F3348E38;
  if ([(PGPictureInPictureViewController *)self->_pictureInPictureViewController contentType] != 4
    && [(PGPictureInPictureViewController *)self->_pictureInPictureViewController contentType] != 5)
  {
    char v3 = 0;
  }
  return (NSNumber *)v3;
}

- (BOOL)shouldSuppressAssociatedElementsInSystemAperture
{
  if ([(PGPictureInPictureViewController *)self->_pictureInPictureViewController contentType] == 1
    || [(PGPictureInPictureViewController *)self->_pictureInPictureViewController contentType] == 2)
  {
    LOBYTE(v3) = 1;
  }
  else if ([(PGPictureInPictureViewController *)self->_pictureInPictureViewController contentType] == 4)
  {
    double v5 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController application];
    double v6 = [v5 bundleIdentifier];
    int v3 = BSEqualStrings() ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)debugName
{
  uint64_t v2 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController contentType];
  if ((unint64_t)(v2 - 1) > 5) {
    return @"Unknown";
  }
  else {
    return off_1E6B0BB50[v2 - 1];
  }
}

- (id)defaultPositionHyperregionComposers
{
  v8[1] = *MEMORY[0x1E4F143B8];
  pipPositionHyperregionComposer = self->_pipPositionHyperregionComposer;
  if (!pipPositionHyperregionComposer)
  {
    double v4 = objc_alloc_init(SBPIPMultidisplayHyperregionComposer);
    double v5 = self->_pipPositionHyperregionComposer;
    self->_pipPositionHyperregionComposer = v4;

    pipPositionHyperregionComposer = self->_pipPositionHyperregionComposer;
  }
  v8[0] = pipPositionHyperregionComposer;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  return v6;
}

- (id)layoutSettings
{
  int v3 = [SBPIPContentViewLayoutSettings alloc];
  double v4 = +[SBPIPContentViewLayoutMetrics pegasusMetricsForContentType:[(PGPictureInPictureViewController *)self->_pictureInPictureViewController contentType]];
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController preferredContentSize];
  double v5 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:](v3, "initWithPlatformMetrics:contentSize:", v4);

  return v5;
}

- (id)systemGestureManagerForInteractionControllerResizing:(id)a3
{
  return 0;
}

- (double)currentCornerRadiusForInteractionController:(id)a3
{
  [(PGPictureInPictureViewController *)self->_pictureInPictureViewController currentContentCornerRadius];
  return result;
}

- (id)systemPointerInteractionManagerForInteractionController:(id)a3
{
  int v3 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController _sbWindowScene];
  double v4 = [v3 systemPointerInteractionManager];

  return v4;
}

- (BOOL)interactionControllerScalesDuringPanGesture:(id)a3
{
  return 0;
}

- (UIEdgeInsets)interactionController:(id)a3 edgeInsetsForWindowScene:(id)a4
{
  p_containerViewController = &self->_containerViewController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  [WeakRetained effectiveEdgeInsetsForWindowScene:v5];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)interactionController:(id)a3 stashedPaddingForWindowScene:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained stashedPadding];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)interactionControllerConnectedWindowScenes:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  double v4 = [WeakRetained connectedWindowScenes];

  return v4;
}

- (BOOL)shouldPointerInteractionBeginForInteractionController:(id)a3 atLocation:(CGPoint)a4 inView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  double v9 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController _sbWindowScene];
  double v10 = [v9 pictureInPictureManager];

  if ([v10 isZStackForegroundActive])
  {
    double v11 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController view];
    objc_msgSend(v8, "convertPoint:toView:", v11, x, y);
    double v13 = v12;
    double v15 = v14;

    double v16 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController view];
    double v17 = objc_msgSend(v16, "hitTest:withEvent:", 0, v13, v15);
    uint64_t v18 = objc_opt_class();
    id v19 = v17;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
    id v22 = v20;

    if (v22) {
      int v21 = [v22 isHovered] ^ 1;
    }
    else {
      LOBYTE(v21) = 1;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (void)stashTabVisibilityPolicyProviderDidUpdatePolicy:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [v4 stashTabCanBeHidden];
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[provider stashTabCanBeHidden] %{BOOL}u", (uint8_t *)v6, 8u);
  }

  -[PGPictureInPictureViewController setPrefersStashTabSuppressed:](self->_pictureInPictureViewController, "setPrefersStashTabSuppressed:", [v4 stashTabCanBeHidden]);
}

- (void)_reloadMenuButton
{
  int v3 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController menuItems];
  uint64_t v4 = [v3 count];

  menuButton = self->_menuButton;
  if (v4)
  {
    if (!menuButton)
    {
      double v6 = +[SBPIPMenuButton pipMenuButton];
      uint64_t v7 = self->_menuButton;
      self->_menuButton = v6;
    }
    id v8 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController menuItems];
    uint64_t v12 = objc_msgSend(v8, "bs_map:", &__block_literal_global_360);

    double v9 = self->_menuButton;
    double v10 = [MEMORY[0x1E4F42B80] menuWithChildren:v12];
    [(UIButton *)v9 setMenu:v10];

    double v11 = (UIButton *)v12;
  }
  else
  {
    [(UIButton *)menuButton removeFromSuperview];
    double v11 = self->_menuButton;
    self->_menuButton = 0;
  }
}

id __49__SBPIPPegasusContainerAdapter__reloadMenuButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_initWeak(&location, v2);
  int v3 = (void *)MEMORY[0x1E4F42A30];
  [MEMORY[0x1E4F42A30] buttonFontSize];
  uint64_t v4 = objc_msgSend(v3, "systemFontOfSize:weight:");
  double v5 = [MEMORY[0x1E4F42A98] configurationWithFont:v4];
  double v6 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v7 = [v2 symbolName];
  id v8 = [v6 systemImageNamed:v7 withConfiguration:v5];

  double v9 = (void *)MEMORY[0x1E4F426E8];
  double v10 = [v2 title];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__SBPIPPegasusContainerAdapter__reloadMenuButton__block_invoke_2;
  v13[3] = &unk_1E6AF9818;
  objc_copyWeak(&v14, &location);
  double v11 = [v9 actionWithTitle:v10 image:v8 identifier:0 handler:v13];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return v11;
}

void __49__SBPIPPegasusContainerAdapter__reloadMenuButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invokeAction];
}

- (void)_createOrInvalidateStashTabVisibilityPolicyProvider
{
  if (!self->_isAnyInteractionGestureActive
    && [(PGPictureInPictureViewController *)self->_pictureInPictureViewController stashed]
    && [(PGPictureInPictureViewController *)self->_pictureInPictureViewController wantsStashTabSuppression])
  {
    if (!self->_stashTabVisibilityPolicyProvider)
    {
      id v14 = [(PGPictureInPictureViewController *)self->_pictureInPictureViewController _sbWindowScene];
      double v5 = [v14 sceneManager];
      uint64_t v6 = [v14 pictureInPictureManager];
      uint64_t v7 = (void *)v6;
      if (v5 && v6)
      {
        id v8 = [SBPIPStashTabSuppressionPolicyProvider alloc];
        double v9 = [(id)SBApp bannerManager];
        double v10 = [v14 sceneManager];
        double v11 = [v14 pictureInPictureManager];
        uint64_t v12 = [(SBPIPStashTabSuppressionPolicyProvider *)v8 initWithObserver:self bannerManager:v9 sceneManager:v10 pipManager:v11];
        stashTabVisibilityPolicyProvider = self->_stashTabVisibilityPolicyProvider;
        self->_stashTabVisibilityPolicyProvider = v12;
      }
    }
  }
  else
  {
    [(SBPIPStashTabSuppressionPolicyProvider *)self->_stashTabVisibilityPolicyProvider invalidate];
    int v3 = self->_stashTabVisibilityPolicyProvider;
    self->_stashTabVisibilityPolicyProvider = 0;

    pictureInPictureViewController = self->_pictureInPictureViewController;
    [(PGPictureInPictureViewController *)pictureInPictureViewController setPrefersStashTabSuppressed:0];
  }
}

- (void)_acquireVisibilityAssertionIfNeeded
{
  if (!self->_visibilityAssertion)
  {
    int v3 = self->_pictureInPictureViewController;
    uint64_t v4 = +[SBSceneManagerCoordinator sharedInstance];
    double v5 = [(PGPictureInPictureViewController *)v3 sourceSceneSessionPersistentIdentifier];
    id v16 = [v4 sceneManagerForPersistenceIdentifier:v5];

    uint64_t v6 = [(PGPictureInPictureViewController *)v3 sourceSceneSessionPersistentIdentifier];
    uint64_t v7 = [v16 existingSceneHandleForPersistenceIdentifier:v6];

    id v8 = [v7 application];
    double v9 = [v8 appProtectionAssistant];
    double v10 = NSString;
    double v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    double v13 = [v10 stringWithFormat:@"%@ - p", v12, v3];
    id v14 = [v9 acquireVisibilityAssertionForReason:v13];
    visibilityAssertion = self->_visibilityAssertion;
    self->_visibilityAssertion = v14;
  }
}

- (void)_invalidateVisibilityAssertion
{
  visibilityAssertion = self->_visibilityAssertion;
  self->_visibilityAssertion = 0;
  int v3 = visibilityAssertion;

  [(BSInvalidatable *)v3 invalidate];
}

- (PGPictureInPictureViewController)pictureInPictureViewController
{
  return self->_pictureInPictureViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureInPictureViewController, 0);
  objc_storeStrong((id *)&self->_visibilityAssertion, 0);
  objc_storeStrong((id *)&self->_offScreenHyperregionComposers, 0);
  objc_storeStrong((id *)&self->_pipPositionHyperregionComposer, 0);
  objc_storeStrong((id *)&self->_stashTabVisibilityPolicyProvider, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
}

@end