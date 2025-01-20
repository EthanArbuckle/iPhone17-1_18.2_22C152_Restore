@interface SBPIPContainerViewController
- (BOOL)handleStashingForTransitionContext:(id)a3;
- (BOOL)isActivelyTethered;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isStashed;
- (BOOL)prefersHiddenFromClonedDisplay;
- (BOOL)prefersIdleTimerDisabled;
- (BOOL)requiresMedusaKeyboard;
- (BOOL)shouldSuppressAssociatedElementsInSystemAperture;
- (BOOL)toggleUserPreferredScale;
- (CGRect)_contentViewFrameInDisplayReferenceSpace;
- (CGRect)_frameInFixedCoordinateSpace:(CGRect)a3 transformedToInterfaceOrientation:(int64_t)a4;
- (NSArray)connectedWindowScenes;
- (NSNumber)overrideResourcesUsageReductionTimeout;
- (NSString)bundleIdentifier;
- (NSString)scenePersistenceIdentifier;
- (SBPIPContainerViewController)initWithCoder:(id)a3;
- (SBPIPContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBPIPContainerViewController)initWithPIPController:(id)a3 interactionSettings:(id)a4 adapter:(id)a5;
- (SBPIPContainerViewController)tetheredContainerViewController;
- (SBPIPContainerViewController)tetheringContainerViewController;
- (SBPIPContainerViewControllerInteractionObserver)interactionObserver;
- (SBPIPInteractionController)interactionController;
- (UIEdgeInsets)_resolvedSafeAreaInsetsForWindowScene:(id)a3;
- (UIEdgeInsets)_safeAreaInsetsForScene:(id)a3;
- (UIEdgeInsets)effectiveEdgeInsets;
- (UIEdgeInsets)effectiveEdgeInsetsForWindowScene:(id)a3;
- (UIEdgeInsets)stashedPadding;
- (UIView)morphAnimatorTargetContainerView;
- (UIView)morphAnimatorTargetView;
- (UIViewController)contentViewController;
- (double)contentScale;
- (id)_blackCurtainViewForStopAnimation;
- (id)_blurSpringAnimationWithParameters:(id)a3 fromValue:(id)a4 toValue:(id)a5;
- (id)hostedAppSceneHandle;
- (id)maximumAvailableVerticalPadding;
- (int)processIdentifier;
- (int64_t)contentZOrderPriority;
- (int64_t)requiredInterfaceOrientation;
- (int64_t)windowInterfaceOrientation;
- (unint64_t)currentCanonicalPosition;
- (unint64_t)supportedInterfaceOrientations;
- (void)SB_accessibilityToggleStashed;
- (void)_addBlurFilterToView:(id)a3;
- (void)_handleMicroPiPRotationDisplayLink:(id)a3;
- (void)_layoutWithNonOperationFrame;
- (void)_notifyStashStateChanged:(BOOL)a3;
- (void)_removeBlurFilterFromView:(id)a3;
- (void)_removeMicroPIPMirrorView;
- (void)_requireInterfaceOrientation:(int64_t)a3;
- (void)_setAdapter:(id)a3;
- (void)_setStashTabHidden:(BOOL)a3 left:(BOOL)a4 completion:(id)a5;
- (void)_updateContentPadding;
- (void)_updateContentViewFrame:(CGRect)a3 reason:(id)a4 usingDisplayArrangementSpace:(BOOL)a5;
- (void)_updateDisplayLayoutElementReferenceFrame;
- (void)acquireInterfaceOrientationLock;
- (void)addObserver:(id)a3;
- (void)animateOutLeftStashTabWithCompletion:(id)a3;
- (void)dealloc;
- (void)forcePictureInPictureToFrame:(CGRect)a3;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)handleDestructionRequestForSceneHandle:(id)a3;
- (void)interactionController:(id)a3 didSettleOnStashState:(BOOL)a4;
- (void)interactionController:(id)a3 didUpdateStashProgress:(double)a4;
- (void)interactionController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5;
- (void)interactionControllerDidBeginEdgeResizing:(id)a3;
- (void)interactionControllerDidBeginInteraction:(id)a3 forGestureRecognizer:(id)a4;
- (void)interactionControllerDidBeginSizeChange:(id)a3 behavior:(int)a4;
- (void)interactionControllerDidEndAllInteractions:(id)a3 targetWindowScene:(id)a4;
- (void)interactionControllerDidEndEdgeResizing:(id)a3;
- (void)interactionControllerDidEndSizeChange:(id)a3;
- (void)interactionControllerDidUpdateEdgeInsets:(id)a3;
- (void)interactionControllerPanGestureDidEnd:(id)a3;
- (void)invalidate;
- (void)layoutForTetheringInteractionController:(id)a3 behavior:(int)a4;
- (void)loadView;
- (void)noteWindowSceneDidChange;
- (void)performAfterInFlightAnimationsComplete:(id)a3;
- (void)relinquishInterfaceOrientationLock;
- (void)removeObserver:(id)a3;
- (void)rotationAnimationDidBeginToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4;
- (void)rotationAnimationDidCompleteToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4;
- (void)rotationAnimationWillBeginToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4;
- (void)rotationAnimationWillCompleteToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4;
- (void)setConnectedWindowScenes:(id)a3;
- (void)setContentScale:(double)a3;
- (void)setContentViewPadding:(UIEdgeInsets)a3;
- (void)setContentZOrderPriority:(int64_t)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setEffectiveEdgeInsets:(UIEdgeInsets)a3;
- (void)setInteractionControllerEnabled:(BOOL)a3 stashed:(BOOL)a4 dataSource:(id)a5;
- (void)setInteractionObserver:(id)a3;
- (void)setInteractionsEnabled:(BOOL)a3;
- (void)setIsActivelyTethered:(BOOL)a3 mode:(int64_t)a4;
- (void)setNeedsLayoutForInteractionController:(id)a3 traits:(unint64_t)a4 withReason:(unint64_t)a5 behavior:(int)a6 completion:(id)a7;
- (void)setPrefersHiddenFromClonedDisplay:(BOOL)a3;
- (void)setStashed:(BOOL)a3;
- (void)setStashedPadding:(UIEdgeInsets)a3;
- (void)setTetheredContainerViewController:(id)a3;
- (void)setTetheringContainerViewController:(id)a3;
- (void)startAnimationDidBeginWithInitialInterfaceOrientation:(int64_t)a3;
- (void)startAnimationDidCompleteWithInitialInterfaceOrientation:(int64_t)a3;
- (void)startAnimationWillBeginWithInitialInterfaceOrientation:(int64_t)a3 initialFrame:(CGRect)a4;
- (void)startDisplayLink;
- (void)startResourcesUsageReductionAfterTimeout:(double)a3;
- (void)startShowingContentWithAnimationSettings:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)stopAnimationDidBeginWithFinalInterfaceOrientation:(int64_t)a3 finalFrame:(CGRect)a4;
- (void)stopAnimationDidCompleteWithFinalInterfaceOrientation:(int64_t)a3;
- (void)stopAnimationWillBeginWithFinalInterfaceOrientation:(int64_t)a3 finalFrame:(CGRect)a4;
- (void)stopDisplayLink;
- (void)stopResourcesUsageReduction;
- (void)stopShowingContentWithAnimationSettings:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)transitionAnimationDidEnd;
- (void)transitionAnimationWillBegin;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
- (void)updatePreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBPIPContainerViewController

- (SBPIPContainerViewController)initWithPIPController:(id)a3 interactionSettings:(id)a4 adapter:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = SBLogPIP();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPContainerViewController initWithPIPController:interactionSettings:adapter:]();
  }

  v30.receiver = self;
  v30.super_class = (Class)SBPIPContainerViewController;
  v12 = [(SBPIPContainerViewController *)&v30 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_pipController, v8);
    objc_storeStrong((id *)&v13->_interactionSettings, a4);
    v13->_requiredInterfaceOrientation = 0;
    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observerHashTable = v13->_observerHashTable;
    v13->_observerHashTable = (NSHashTable *)v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    waitInteractionAnimationsCompletionBlocks = v13->_waitInteractionAnimationsCompletionBlocks;
    v13->_waitInteractionAnimationsCompletionBlocks = v16;

    uint64_t v18 = [(SBPIPInteractionSettings *)v13->_interactionSettings interactiveFluidBehavior];
    interactiveAnimationSettings = v13->_interactiveAnimationSettings;
    v13->_interactiveAnimationSettings = (SBFFluidBehaviorSettings *)v18;

    uint64_t v20 = [(SBPIPInteractionSettings *)v13->_interactionSettings stashTabFluidBehavior];
    stashTabAnimationSettings = v13->_stashTabAnimationSettings;
    v13->_stashTabAnimationSettings = (SBFFluidBehaviorSettings *)v20;

    uint64_t v22 = [(SBPIPInteractionSettings *)v13->_interactionSettings regionUpdateFluidBehavior];
    regionUpdateAnimationSettings = v13->_regionUpdateAnimationSettings;
    v13->_regionUpdateAnimationSettings = (SBFFluidBehaviorSettings *)v22;

    [(SBPIPContainerViewController *)v13 _setAdapter:v10];
    id v24 = objc_alloc(MEMORY[0x1E4FA6A68]);
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    uint64_t v27 = [v24 initWithIdentifier:v26];
    displayLayoutElement = v13->_displayLayoutElement;
    v13->_displayLayoutElement = (SBSDisplayLayoutElement *)v27;

    [(SBSDisplayLayoutElement *)v13->_displayLayoutElement setLayoutRole:5];
    [(SBSDisplayLayoutElement *)v13->_displayLayoutElement setUIApplicationElement:1];
  }

  return v13;
}

- (SBPIPContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = _SBFLoggingMethodProem();
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v6 handleFailureInMethod:a2, self, @"SBPIPContainerViewController.m", 203, @"%@ is not a valid initializer. You must call -[%@ initWithPictureInPictureViewController:].", v7, v9 object file lineNumber description];

  return 0;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBPIPContainerViewController.m" lineNumber:208 description:@"Attempting to dealloc without invalidating."];
  }
  v4 = SBLogPIP();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPContainerViewController initWithPIPController:interactionSettings:adapter:]();
  }

  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  [(UIViewFloatAnimatableProperty *)self->_metricsAnimatableProperty invalidate];
  v6.receiver = self;
  v6.super_class = (Class)SBPIPContainerViewController;
  [(SBPIPContainerViewController *)&v6 dealloc];
}

- (void)invalidate
{
  if (self->_invalidated)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBPIPContainerViewController.m" lineNumber:217 description:@"Attempting to -invalidate twice; this is unsupported."];
  }
  self->_invalidated = 1;
  [(BSAbsoluteMachTimer *)self->_stashedStateReduceResourcesUsageTimer invalidate];
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  self->_displayLayoutElementAssertion = 0;

  adapter = self->_adapter;
  [(SBPIPContainerViewControllerAdapter *)adapter invalidate];
}

- (SBPIPContainerViewController)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_super v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"SBPIPContainerViewController.m", 228, @"%@ does not support unarchiving from a nib.", v7 object file lineNumber description];

  return 0;
}

- (void)loadView
{
  v3 = [SBPIPContainerViewControllerRootView alloc];
  objc_super v6 = -[SBPIPContainerViewControllerRootView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(SBPIPContainerViewControllerRootView *)v6 setClipsToBounds:1];
  [(SBPIPContainerViewControllerRootView *)v6 setOpaque:0];
  [(SBPIPContainerViewController *)self setView:v6];
  v4 = [(UIViewController *)self->_contentViewController view];
  contentView = self->_contentView;
  self->_contentView = v4;

  [(UIView *)self->_contentView setHidden:1];
  [(SBPIPContainerViewController *)self addChildViewController:self->_contentViewController];
  [(SBPIPContainerViewControllerRootView *)v6 addSubview:self->_contentView];
  [(UIViewController *)self->_contentViewController didMoveToParentViewController:self];
}

- (void)noteWindowSceneDidChange
{
  [(SBPIPContainerViewController *)self setInteractionsEnabled:0];
  [(SBPIPContainerViewController *)self setInteractionsEnabled:1];
  BOOL wantsDisplayLayoutElement = self->_wantsDisplayLayoutElement;
  [(SBPIPContainerViewController *)self setDisplayLayoutElementActive:wantsDisplayLayoutElement];
}

- (void)startShowingContentWithAnimationSettings:(id)a3 parameters:(id)a4 completion:(id)a5
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v10 = a3;
  v11 = (void (**)(void))a5;
  [(UIView *)self->_contentView setHidden:0];
  [(SBMicroPIPTetheringMirrorView *)self->_microPIPTetheringViewMirror setHidden:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  uint64_t v13 = [(SBPIPContainerViewController *)self processIdentifier];
  uint64_t v14 = [(SBPIPContainerViewController *)self scenePersistenceIdentifier];
  v15 = [WeakRetained pictureInPictureMorphAnimatorControllerForProcessIdentifier:v13 scenePersistenceIdentifier:v14];

  if (!v10 || v15)
  {
    if (v11) {
      v11[2](v11);
    }
  }
  else
  {
    [(SBPIPContainerViewController *)self _addBlurFilterToView:self->_contentView];
    v16 = [NSNumber numberWithDouble:var2];
    v17 = [(SBPIPContainerViewController *)self _blurSpringAnimationWithParameters:v10 fromValue:v16 toValue:&unk_1F3348C18];

    uint64_t v18 = [(UIView *)self->_contentView layer];
    [v18 addAnimation:v17 forKey:@"filters.gaussianBlur.inputRadius"];

    [(UIView *)self->_contentView setAlpha:var1];
    contentView = self->_contentView;
    CGAffineTransformMakeScale(&v27, var0, var0);
    [(UIView *)contentView setTransform:&v27];
    uint64_t v20 = (void *)MEMORY[0x1E4F4F898];
    v21 = [v10 BSAnimationSettings];
    uint64_t v22 = [v20 factoryWithSettings:v21];

    v23 = (void *)MEMORY[0x1E4F4F898];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __95__SBPIPContainerViewController_startShowingContentWithAnimationSettings_parameters_completion___block_invoke;
    v26[3] = &unk_1E6AF4AC0;
    v26[4] = self;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __95__SBPIPContainerViewController_startShowingContentWithAnimationSettings_parameters_completion___block_invoke_2;
    v24[3] = &unk_1E6AF5AA0;
    v24[4] = self;
    v25 = v11;
    [v23 animateWithFactory:v22 actions:v26 completion:v24];
  }
}

uint64_t __95__SBPIPContainerViewController_startShowingContentWithAnimationSettings_parameters_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 984);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __95__SBPIPContainerViewController_startShowingContentWithAnimationSettings_parameters_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeBlurFilterFromView:*(void *)(*(void *)(a1 + 32) + 984)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)stopShowingContentWithAnimationSettings:(id)a3 parameters:(id)a4 completion:(id)a5
{
  double var2 = a4.var2;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v10 = a3;
  v11 = (void (**)(void))a5;
  v12 = v11;
  if (v10)
  {
    [(SBPIPContainerViewController *)self _addBlurFilterToView:self->_contentView];
    uint64_t v13 = [NSNumber numberWithDouble:var2];
    uint64_t v14 = [(SBPIPContainerViewController *)self _blurSpringAnimationWithParameters:v10 fromValue:&unk_1F3348C18 toValue:v13];

    v15 = [(UIView *)self->_contentView layer];
    [v15 addAnimation:v14 forKey:@"filters.gaussianBlur.inputRadius"];

    v16 = (void *)MEMORY[0x1E4F4F898];
    v17 = [v10 BSAnimationSettings];
    uint64_t v18 = [v16 factoryWithSettings:v17];

    v19 = (void *)MEMORY[0x1E4F4F898];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__SBPIPContainerViewController_stopShowingContentWithAnimationSettings_parameters_completion___block_invoke;
    v22[3] = &unk_1E6B012E0;
    v22[4] = self;
    *(double *)&v22[5] = var0;
    *(double *)&v22[6] = var1;
    *(double *)&v22[7] = var2;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __94__SBPIPContainerViewController_stopShowingContentWithAnimationSettings_parameters_completion___block_invoke_2;
    v20[3] = &unk_1E6AF5AA0;
    v20[4] = self;
    v21 = v12;
    [v19 animateWithFactory:v18 actions:v22 completion:v20];
  }
  else if (v11)
  {
    [(UIView *)self->_contentView setHidden:1];
    v12[2](v12);
  }
}

uint64_t __94__SBPIPContainerViewController_stopShowingContentWithAnimationSettings_parameters_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) setAlpha:*(double *)(a1 + 48)];
  v2 = *(void **)(*(void *)(a1 + 32) + 984);
  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  return [v2 setTransform:&v4];
}

uint64_t __94__SBPIPContainerViewController_stopShowingContentWithAnimationSettings_parameters_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) setHidden:1];
  [*(id *)(a1 + 32) _removeBlurFilterFromView:*(void *)(*(void *)(a1 + 32) + 984)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    long long v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)animateOutLeftStashTabWithCompletion:(id)a3
{
}

- (id)_blurSpringAnimationWithParameters:(id)a3 fromValue:(id)a4 toValue:(id)a5
{
  v7 = (void *)MEMORY[0x1E4F39C90];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v7 animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v11 setBeginTime:CACurrentMediaTime()];
  [v11 setFillMode:*MEMORY[0x1E4F39F98]];
  [v11 setFromValue:v9];

  [v11 setToValue:v8];
  [v10 mass];
  objc_msgSend(v11, "setMass:");
  [v10 stiffness];
  objc_msgSend(v11, "setStiffness:");
  [v10 damping];
  objc_msgSend(v11, "setDamping:");
  [v10 duration];
  double v13 = v12;

  [v11 setDuration:v13];
  return v11;
}

- (void)_addBlurFilterToView:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  long long v3 = (void *)MEMORY[0x1E4F39BC0];
  uint64_t v4 = *MEMORY[0x1E4F3A0D0];
  id v5 = a3;
  objc_super v6 = [v3 filterWithType:v4];
  [v6 setName:@"gaussianBlur"];
  [v6 setValue:@"default" forKey:@"inputQuality"];
  [v6 setValue:@"default" forKey:@"inputIntermediateBitDepth"];
  [v6 setValue:&unk_1F3348C18 forKey:@"inputRadius"];
  uint64_t v7 = MEMORY[0x1E4F1CC28];
  [v6 setValue:MEMORY[0x1E4F1CC28] forKey:@"inputNormalizeEdges"];
  [v6 setValue:v7 forKey:@"inputHardEdges"];
  id v8 = [v5 layer];

  v10[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v8 setFilters:v9];
}

- (void)_removeBlurFilterFromView:(id)a3
{
  id v3 = [a3 layer];
  [v3 setFilters:0];
}

- (void)setInteractionControllerEnabled:(BOOL)a3 stashed:(BOOL)a4 dataSource:(id)a5
{
  BOOL v5 = a3;
  if (!self->_interactionController)
  {
    BOOL v7 = a4;
    id v8 = a5;
    [(SBPIPContainerViewController *)self loadViewIfNeeded];
    id v9 = [SBPIPInteractionController alloc];
    contentView = self->_contentView;
    [(UIViewController *)self->_contentViewController preferredContentSize];
    v11 = -[SBPIPInteractionController initWithInteractionTargetView:preferredContentSize:interactionSettings:dataSource:delegate:](v9, "initWithInteractionTargetView:preferredContentSize:interactionSettings:dataSource:delegate:", contentView, self->_interactionSettings, v8, self);

    interactionController = self->_interactionController;
    self->_interactionController = v11;

    [(SBPIPContainerViewController *)self _updateContentPadding];
    [(SBPIPInteractionController *)self->_interactionController setStashed:v7];
    [(SBPIPInteractionController *)self->_interactionController initialFrame];
    -[SBPIPContainerViewController _updateContentViewFrame:reason:usingDisplayArrangementSpace:](self, "_updateContentViewFrame:reason:usingDisplayArrangementSpace:", @"Setup Interaction Controller", 1);
  }
  -[SBPIPContainerViewController setInteractionsEnabled:](self, "setInteractionsEnabled:", v5, a4, a5);
}

- (void)setInteractionsEnabled:(BOOL)a3
{
}

- (void)startAnimationWillBeginWithInitialInterfaceOrientation:(int64_t)a3 initialFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(UIView *)self->_contentView setHidden:0];
  -[SBPIPContainerViewController _frameInFixedCoordinateSpace:transformedToInterfaceOrientation:](self, "_frameInFixedCoordinateSpace:transformedToInterfaceOrientation:", a3, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(SBPIPContainerViewController *)self _requireInterfaceOrientation:a3];
  [(SBPIPInteractionController *)self->_interactionController setEnabled:0];
  [(SBPIPContainerViewController *)self _updateContentViewFrame:@"Prepare Start Animation", 0, v11, v13, v15, v17 reason usingDisplayArrangementSpace];
}

- (void)startAnimationDidBeginWithInitialInterfaceOrientation:(int64_t)a3
{
  [(SBPIPContainerViewController *)self _requireInterfaceOrientation:0];
  [(SBPIPInteractionController *)self->_interactionController initialFrame];
  -[SBPIPContainerViewController _updateContentViewFrame:reason:usingDisplayArrangementSpace:](self, "_updateContentViewFrame:reason:usingDisplayArrangementSpace:", @"Perform Start Animation", 1);
}

- (void)startAnimationDidCompleteWithInitialInterfaceOrientation:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(SBPIPInteractionController *)self->_interactionController setEnabled:1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v5 = self->_observerHashTable;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "containerViewController:didFinishStartAnimationWithInitialInterfaceOrientation:", self, a3, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ([(SBPIPContainerViewController *)self windowInterfaceOrientation] != a3) {
    [(SBPIPContainerViewController *)self _updateContentPadding];
  }
}

- (id)_blackCurtainViewForStopAnimation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SBPIPContainerViewController *)self view];
  id v3 = [v2 subviews];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)stopAnimationWillBeginWithFinalInterfaceOrientation:(int64_t)a3 finalFrame:(CGRect)a4
{
  -[SBPIPInteractionController setEnabled:](self->_interactionController, "setEnabled:", 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  [(SBPIPContainerViewController *)self setStashed:0];
  [(SBPIPContainerViewController *)self _removeMicroPIPMirrorView];
  id v8 = [(SBPIPContainerViewController *)self _blackCurtainViewForStopAnimation];
  if (!v8
    || (BOOL v6 = [(SBPIPContainerViewController *)self windowInterfaceOrientation] == a3,
        uint64_t v7 = v8,
        !v6))
  {
    [v8 setAlpha:0.0];
    uint64_t v7 = v8;
  }
}

- (void)stopAnimationDidBeginWithFinalInterfaceOrientation:(int64_t)a3 finalFrame:(CGRect)a4
{
  -[SBPIPContainerViewController _frameInFixedCoordinateSpace:transformedToInterfaceOrientation:](self, "_frameInFixedCoordinateSpace:transformedToInterfaceOrientation:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(SBPIPContainerViewController *)self _requireInterfaceOrientation:a3];
  [(SBPIPContainerViewController *)self _updateContentViewFrame:@"Perform Stop Animation", 0, v7, v9, v11, v13 reason usingDisplayArrangementSpace];
  uint64_t v14 = [(SBPIPContainerViewController *)self _blackCurtainViewForStopAnimation];
  if (v14)
  {
    id v16 = v14;
    BOOL v15 = [(SBPIPContainerViewController *)self windowInterfaceOrientation] == a3;
    uint64_t v14 = v16;
    if (v15)
    {
      [v16 setAlpha:0.0];
      uint64_t v14 = v16;
    }
  }
}

- (void)stopAnimationDidCompleteWithFinalInterfaceOrientation:(int64_t)a3
{
  interactionController = self->_interactionController;
  self->_interactionController = 0;

  [(SBPIPContainerViewController *)self _updateDisplayLayoutElementReferenceFrame];
}

- (void)performAfterInFlightAnimationsComplete:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = v4;
  if (self->_inFlightAnimationCounter)
  {
    waitInteractionAnimationsCompletionBlocks = self->_waitInteractionAnimationsCompletionBlocks;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__SBPIPContainerViewController_performAfterInFlightAnimationsComplete___block_invoke;
    v8[3] = &unk_1E6AF5300;
    double v9 = v4;
    double v7 = (void *)MEMORY[0x1D948C7A0](v8);
    [(NSMutableArray *)waitInteractionAnimationsCompletionBlocks addObject:v7];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __71__SBPIPContainerViewController_performAfterInFlightAnimationsComplete___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)toggleUserPreferredScale
{
  interactionController = self->_interactionController;
  if (interactionController) {
    [(SBPIPInteractionController *)self->_interactionController toggleUserPreferredScale];
  }
  return interactionController != 0;
}

- (unint64_t)currentCanonicalPosition
{
  return [(SBPIPInteractionController *)self->_interactionController canonicalPosition];
}

- (void)updatePreferredContentSize:(CGSize)a3
{
  -[SBPIPInteractionController setPreferredContentSize:](self->_interactionController, "setPreferredContentSize:", a3.width, a3.height);
  if (self->_activelyTethered)
  {
    [(SBPIPContainerViewController *)self _layoutWithNonOperationFrame];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBPIPContainerViewController;
  [(SBPIPContainerViewController *)&v3 viewDidLoad];
  if (*((unsigned char *)self + 1208)) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter loadSubviewsForContainerViewController:self];
  }
}

- (void)viewDidLayoutSubviews
{
  if (self->_interactionController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
    char v4 = [WeakRetained isHandlingContextWindowSceneUpdate];

    if ((v4 & 1) == 0)
    {
      int64_t v5 = [(SBPIPContainerViewController *)self windowInterfaceOrientation];
      interactionController = self->_interactionController;
      double v7 = [(SBPIPContainerViewController *)self view];
      [v7 bounds];
      double v9 = v8;
      double v11 = v10;
      double v12 = [(UIViewController *)self _sbWindowScene];
      -[SBPIPInteractionController setContainerSize:withOrientation:scene:](interactionController, "setContainerSize:withOrientation:scene:", v5, v12, v9, v11);

      [(SBPIPContainerViewController *)self _updateContentPadding];
      if ((*((unsigned char *)self + 1208) & 2) != 0)
      {
        adapter = self->_adapter;
        [(SBPIPContainerViewControllerAdapter *)adapter layoutSubviewsForContainerViewController:self];
      }
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPIPContainerViewController;
  [(SBPIPContainerViewController *)&v5 viewDidAppear:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SBPIPContainerViewController_viewDidAppear___block_invoke;
  v4[3] = &unk_1E6B01568;
  v4[4] = self;
  [(SBPIPContainerViewController *)self updateDisplayLayoutElementWithBuilder:v4];
  [(SBPIPContainerViewController *)self setDisplayLayoutElementActive:1];
}

void __46__SBPIPContainerViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = *(void **)(a1 + 32);
  id v5 = a2;
  char v4 = [v3 bundleIdentifier];
  [v5 setBundleIdentifier:v4];

  [*(id *)(a1 + 32) _contentViewFrameInDisplayReferenceSpace];
  objc_msgSend(v5, "setReferenceFrame:");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBPIPContainerViewController;
  [(SBPIPContainerViewController *)&v4 viewWillDisappear:a3];
  [(SBPIPContainerViewController *)self setDisplayLayoutElementActive:0];
}

- (BOOL)handleStashingForTransitionContext:(id)a3
{
  if (*((unsigned char *)self + 1211)) {
    return [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewController:self shouldHandleStashingForTransitionContext:a3];
  }
  else {
    return 0;
  }
}

- (void)_updateContentPadding
{
  id v3 = [(UIViewController *)self _sbWindowScene];
  [(SBPIPContainerViewController *)self effectiveEdgeInsetsForWindowScene:v3];
  -[SBPIPContainerViewController setEffectiveEdgeInsets:](self, "setEffectiveEdgeInsets:");
}

- (UIEdgeInsets)_safeAreaInsetsForScene:(id)a3
{
  id v4 = a3;
  id v5 = [(SBPIPContainerViewController *)self view];
  id v6 = [v5 _sbWindowScene];

  if (v6 == v4)
  {
    double v7 = [(SBPIPContainerViewController *)self view];
    [v7 safeAreaInsets];
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
    double v16 = v20;
  }
  else
  {
    double v7 = [v4 windows];
    double v8 = objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_189);
    [v8 safeAreaInsets];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  double v24 = v16;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

uint64_t __56__SBPIPContainerViewController__safeAreaInsetsForScene___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (UIEdgeInsets)_resolvedSafeAreaInsetsForWindowScene:(id)a3
{
  id v4 = a3;
  id v5 = [v4 screen];
  [v5 _peripheryInsets];
  double v7 = v6;
  double v9 = v8;

  [(SBPIPContainerViewController *)self _safeAreaInsetsForScene:v4];
  double v11 = v10;
  double v13 = v12;
  double v14 = [(SBPIPContainerViewController *)self view];
  id v15 = [v14 _sbWindowScene];
  if (v15 == v4) {
    uint64_t v16 = [(SBPIPContainerViewController *)self windowInterfaceOrientation];
  }
  else {
    uint64_t v16 = [v4 interfaceOrientation];
  }
  uint64_t v17 = v16;

  int v18 = __sb__runningInSpringBoard();
  char v19 = v18;
  if (v18)
  {
    double v20 = 0.0;
    if (SBFEffectiveDeviceClass() == 2) {
      goto LABEL_23;
    }
  }
  else
  {
    double v14 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v14 userInterfaceIdiom] == 1) {
      goto LABEL_16;
    }
  }
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    {
      BOOL v21 = SBFEffectiveHomeButtonType() == 2;
      if (v19) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else
  {
    double v22 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v22 userInterfaceIdiom])
    {
      BOOL v21 = SBFEffectiveHomeButtonType() == 2;

      if (v19) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  double v20 = 0.0;
  if (v19)
  {
LABEL_23:
    double v23 = 0.0;
    goto LABEL_24;
  }
LABEL_16:
  BOOL v21 = 0;
LABEL_17:

LABEL_18:
  double v20 = 0.0;
  if (!v21 || !v17) {
    goto LABEL_23;
  }
  if (v17 == 3)
  {
    +[SBPIPContentViewLayoutMetrics minimumLandscapePadding];
    double v11 = v31;
    +[SBPIPContentViewLayoutMetrics unstashedPeripheryPadding];
    double v23 = v7 + v32;
    +[SBPIPContentViewLayoutMetrics minimumLandscapePadding];
    double v20 = v33;
  }
  else
  {
    double v23 = 0.0;
    if (v17 == 4)
    {
      +[SBPIPContentViewLayoutMetrics minimumLandscapePadding];
      double v11 = v24;
      +[SBPIPContentViewLayoutMetrics minimumLandscapePadding];
      double v23 = v25;
      +[SBPIPContentViewLayoutMetrics unstashedPeripheryPadding];
      double v20 = v9 + v26;
    }
  }
LABEL_24:

  double v27 = v11;
  double v28 = v23;
  double v29 = v13;
  double v30 = v20;
  result.right = v30;
  result.bottom = v29;
  result.left = v28;
  result.top = v27;
  return result;
}

- (void)setEffectiveEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_effectiveEdgeInsets.left != a3.left
    || self->_effectiveEdgeInsets.top != a3.top
    || self->_effectiveEdgeInsets.right != a3.right
    || self->_effectiveEdgeInsets.bottom != a3.bottom)
  {
    self->_effectiveEdgeInsets = a3;
    [(SBPIPInteractionController *)self->_interactionController reloadInsets];
  }
}

- (UIEdgeInsets)effectiveEdgeInsetsForWindowScene:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
  [WeakRetained pictureInPictureWindowMarginsOnWindowScene:v5];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  [(SBPIPContainerViewController *)self _resolvedSafeAreaInsetsForWindowScene:v5];
  id v15 = [(UIViewController *)self _sbWindowScene];
  if (v15 == v5) {
    uint64_t v16 = [(SBPIPContainerViewController *)self windowInterfaceOrientation];
  }
  else {
    uint64_t v16 = [v5 interfaceOrientation];
  }
  uint64_t v17 = v16;

  uint64_t v18 = [(SBPIPInteractionController *)self->_interactionController layoutSettings];
  [(id)v18 contentViewPadding];

  uint64_t v19 = __sb__runningInSpringBoard();
  if (!v19)
  {
    id v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
      [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
    }
    goto LABEL_14;
  }
  uint64_t v18 = v19;
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
  {
    [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
  }
  else
  {
    if (SBFEffectiveHomeButtonType() != 2) {
      [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
    }
    if ((v18 & 1) == 0) {
LABEL_14:
    }
  }
  int v20 = __sb__runningInSpringBoard();
  char v21 = v20;
  if (v20)
  {
    if (SBFEffectiveDeviceClass() == 2) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v18 userInterfaceIdiom] == 1) {
      goto LABEL_30;
    }
  }
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    {
      SBFEffectiveHomeButtonType();
      if (v21) {
        goto LABEL_31;
      }
LABEL_30:

      goto LABEL_31;
    }
LABEL_26:
    if (v21) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  double v22 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v22 userInterfaceIdiom])
  {

    goto LABEL_26;
  }
  SBFEffectiveHomeButtonType();

  if ((v21 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_31:
  UIEdgeInsetsAdd();
  UIEdgeInsetsMax();
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  double v31 = SBLogPIP();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v51.top = v24;
    v51.left = v26;
    v51.bottom = v28;
    v51.right = v30;
    double v32 = NSStringFromUIEdgeInsets(v51);
    double v33 = [(SBPIPContainerViewController *)self view];
    [v33 safeAreaInsets];
    v34 = NSStringFromUIEdgeInsets(v52);
    v53.top = v8;
    v53.left = v10;
    v53.bottom = v12;
    v53.right = v14;
    v35 = NSStringFromUIEdgeInsets(v53);
    *(_DWORD *)buf = 134219010;
    v41 = self;
    __int16 v42 = 2114;
    v43 = v32;
    __int16 v44 = 2114;
    v45 = v34;
    __int16 v46 = 2114;
    v47 = v35;
    __int16 v48 = 2048;
    uint64_t v49 = v17;
    _os_log_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEFAULT, "[%p] [PIP Container] Applying new edge insets: %{public}@. Derived from picking maximum between safeAreaInsets: %{public}@, and our extra content padding: %{public}@, adjusted for interface orientation: %ld", buf, 0x34u);
  }
  double v36 = v24;
  double v37 = v26;
  double v38 = v28;
  double v39 = v30;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SBPIPContainerViewController;
  [(SBPIPContainerViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(SBPIPContainerViewController *)self _updateContentPadding];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBPIPContainerViewController;
  id v7 = a4;
  -[SBPIPContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__SBPIPContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6AF53F8;
  void v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

uint64_t __83__SBPIPContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplayLayoutElementReferenceFrame];
}

- (void)setNeedsLayoutForInteractionController:(id)a3 traits:(unint64_t)a4 withReason:(unint64_t)a5 behavior:(int)a6 completion:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  double v13 = (void (**)(id, uint64_t, void))a7;
  CGFloat v14 = SBLogPIP();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    v58 = self;
    __int16 v59 = 2048;
    id v60 = v12;
    __int16 v61 = 2048;
    unint64_t v62 = a4;
    __int16 v63 = 2048;
    unint64_t v64 = a5;
    __int16 v65 = 1024;
    int v66 = a6;
    _os_log_debug_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEBUG, "[%p][Layout] setNeedsLayoutForInteractionController[%p] for traits:%lu reason:%lu behavior:%u.", buf, 0x30u);
  }

  int v15 = [v12 isEnabled];
  if ((a5 & 0x8000) != 0 || v15)
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke;
    v51[3] = &unk_1E6B03AF8;
    unint64_t v54 = a4;
    unint64_t v55 = a5;
    id v52 = v12;
    UIEdgeInsets v53 = self;
    int v56 = a6;
    uint64_t v16 = (void (**)(void))MEMORY[0x1D948C7A0](v51);
    uint64_t v17 = +[SBBacklightController sharedInstance];
    int v18 = [v17 screenIsOn];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_pipController);
    int v20 = [(UIViewController *)self _sbWindowScene];
    int v21 = [WeakRetained isPictureInPictureWindowVisibleOnWindowScene:v20];

    char v22 = 0;
    if (v18 && v21) {
      char v22 = ![(UIView *)self->_contentView isHidden];
    }
    if (!a6 || !((a5 >> 15) & 1 | v22 & 1))
    {
      v16[2](v16);
      if (v13) {
        v13[2](v13, 1, 0);
      }
      goto LABEL_28;
    }
    double v23 = &OBJC_IVAR___SBPIPContainerViewController__stashTabAnimationSettings;
    if ((a5 & 0x800) == 0) {
      double v23 = &OBJC_IVAR___SBPIPContainerViewController__interactiveAnimationSettings;
    }
    BOOL v24 = a6 == 2 && (a5 & 0x5000) != 0;
    if (((a6 == 2) & (a5 >> 13)) != 0) {
      double v23 = &OBJC_IVAR___SBPIPContainerViewController__regionUpdateAnimationSettings;
    }
    metricsAnimationSettings = (SBFFluidBehaviorSettings *)objc_retain(*(id *)((char *)&self->super.super.super.isa
                                                                             + *v23));
    metricsAnimatablePropertdouble y = self->_metricsAnimatableProperty;
    if (v24)
    {
      [(UIViewFloatAnimatableProperty *)metricsAnimatableProperty invalidate];
      double v27 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
      CGFloat v28 = self->_metricsAnimatableProperty;
      self->_metricsAnimatablePropertdouble y = v27;

      [(UIViewFloatAnimatableProperty *)self->_metricsAnimatableProperty setValue:0.0];
      double v29 = metricsAnimationSettings;
      metricsAnimationSettings = self->_metricsAnimationSettings;
      self->_metricsAnimationSettings = v29;
    }
    else
    {
      if (!metricsAnimatableProperty
        || ([(UIViewFloatAnimatableProperty *)metricsAnimatableProperty isInvalidated] & 1) != 0)
      {
        goto LABEL_27;
      }
      [(UIViewFloatAnimatableProperty *)self->_metricsAnimatableProperty presentationValue];
      double v31 = v30;
      double v29 = (SBFFluidBehaviorSettings *)objc_alloc_init(MEMORY[0x1E4FA5F08]);
      [(SBFFluidBehaviorSettings *)metricsAnimationSettings trackingResponse];
      double v33 = v32;
      [(SBFFluidBehaviorSettings *)self->_metricsAnimationSettings response];
      double v35 = v31 * (v33 - v34);
      [(SBFFluidBehaviorSettings *)self->_metricsAnimationSettings response];
      [(SBFFluidBehaviorSettings *)v29 setTrackingResponse:v35 + v36];
      [(SBFFluidBehaviorSettings *)metricsAnimationSettings response];
      double v38 = v37;
      [(SBFFluidBehaviorSettings *)self->_metricsAnimationSettings response];
      double v40 = v31 * (v38 - v39);
      [(SBFFluidBehaviorSettings *)self->_metricsAnimationSettings response];
      [(SBFFluidBehaviorSettings *)v29 setResponse:v40 + v41];
      [(SBFFluidBehaviorSettings *)metricsAnimationSettings trackingDampingRatio];
      -[SBFFluidBehaviorSettings setTrackingDampingRatio:](v29, "setTrackingDampingRatio:");
      [(SBFFluidBehaviorSettings *)metricsAnimationSettings dampingRatio];
      -[SBFFluidBehaviorSettings setDampingRatio:](v29, "setDampingRatio:");
    }

    metricsAnimationSettings = v29;
LABEL_27:
    ++self->_inFlightAnimationCounter;
    unint64_t metricsUpdateGenCount = self->_metricsUpdateGenCount;
    self->_unint64_t metricsUpdateGenCount = metricsUpdateGenCount + 1;
    v43 = (void *)MEMORY[0x1E4F42FF0];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_2;
    v48[3] = &unk_1E6AFCF18;
    BOOL v50 = v24;
    v48[4] = self;
    uint64_t v49 = v16;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_4;
    v44[3] = &unk_1E6B03B20;
    BOOL v47 = v24;
    v44[4] = self;
    unint64_t v46 = metricsUpdateGenCount;
    v45 = v13;
    [v43 _animateUsingSpringBehavior:metricsAnimationSettings tracking:a6 == 1 animations:v48 completion:v44];

LABEL_28:
    goto LABEL_29;
  }
  if (v13) {
    v13[2](v13, 0, 0);
  }
LABEL_29:
}

void __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutInteractedTraits:*(void *)(a1 + 48) withReason:*(void *)(a1 + 56) source:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1248));
  [WeakRetained layoutForTetheringInteractionController:*(void *)(a1 + 32) behavior:*(unsigned int *)(a1 + 64)];
}

void __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F42FF0];
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_3;
  v10[3] = &unk_1E6AFCF18;
  char v12 = *(unsigned char *)(a1 + 48);
  double v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  *(float *)&double v7 = minimum;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114124, v10, v7, v8, v9);
}

uint64_t __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(*(void *)(a1 + 32) + 1112) setValue:1.0];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __109__SBPIPContainerViewController_setNeedsLayoutForInteractionController_traits_withReason_behavior_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  --*(void *)(*(void *)(a1 + 32) + 1088);
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 1120) == *(void *)(a1 + 48))
    {
      [*(id *)(v6 + 1112) invalidate];
      uint64_t v7 = *(void *)(a1 + 32);
      double v8 = *(void **)(v7 + 1112);
      *(void *)(v7 + 1112) = 0;

      uint64_t v9 = *(void *)(a1 + 32);
      CGFloat v10 = *(void **)(v9 + 1104);
      *(void *)(v9 + 1104) = 0;
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, a2, a3);
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (!*(void *)(v12 + 1088) && [*(id *)(v12 + 1096) count])
  {
    CAFrameRateRange v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 1096) copy];
    [*(id *)(*(void *)(a1 + 32) + 1096) removeAllObjects];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v18) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * v18));
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
}

- (void)interactionControllerDidBeginSizeChange:(id)a3 behavior:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  if ((*((unsigned char *)self + 1210) & 2) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewControllerWillBeginSizeChange:self behavior:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  [WeakRetained interactionControllerDidBeginSizeChange:v7 behavior:v4];
}

- (void)interactionControllerDidEndSizeChange:(id)a3
{
  id v5 = a3;
  if ((*((unsigned char *)self + 1210) & 4) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewControllerDidEndSizeChange:self];
  }
  [(SBPIPContainerViewController *)self _updateDisplayLayoutElementReferenceFrame];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  [WeakRetained interactionControllerDidEndSizeChange:v5];
}

- (void)interactionController:(id)a3 didUpdateStashProgress:(double)a4
{
  id v7 = a3;
  if ((*((unsigned char *)self + 1210) & 8) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewController:self didUpdateStashProgress:a4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  [WeakRetained interactionController:v7 didUpdateStashProgress:a4];
}

- (void)interactionController:(id)a3 wantsStashTabHidden:(BOOL)a4 left:(BOOL)a5
{
}

- (void)interactionController:(id)a3 didSettleOnStashState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SBPIPContainerViewController *)self _notifyStashStateChanged:v4];
  if ((*((unsigned char *)self + 1209) & 0x10) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewController:self didSettleOnStashState:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  [WeakRetained interactionController:v6 didSettleOnStashState:v4];
}

- (void)interactionControllerDidBeginInteraction:(id)a3 forGestureRecognizer:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ((*((unsigned char *)self + 1209) & 0x20) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewController:self willBeginInteractionWithGestureRecognizer:v6];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionObserver);
  [WeakRetained containerViewControllerDidBeginInteraction:self];

  id v8 = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  [v8 interactionControllerDidBeginInteraction:v9 forGestureRecognizer:v6];
}

- (void)interactionControllerDidEndAllInteractions:(id)a3 targetWindowScene:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  [(SBPIPContainerViewController *)self _updateDisplayLayoutElementReferenceFrame];
  if ((*((unsigned char *)self + 1209) & 0x40) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewControllerDidEndInteraction:self targetWindowScene:v9];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionObserver);
  [WeakRetained containerViewControllerDidEndInteraction:self targetWindowScene:v9];

  id v8 = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  [v8 interactionControllerDidEndAllInteractions:v6 targetWindowScene:v9];

  [(SBPIPContainerViewController *)self _updateDisplayLayoutElementReferenceFrame];
  [(SBPIPContainerViewController *)self _updateContentPadding];
}

- (void)interactionControllerPanGestureDidEnd:(id)a3
{
  id v5 = a3;
  if (*((char *)self + 1209) < 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewControllerPanGestureDidEnd:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  [WeakRetained interactionControllerPanGestureDidEnd:v5];
}

- (void)interactionControllerDidUpdateEdgeInsets:(id)a3
{
  id v4 = a3;
  [(SBPIPContainerViewController *)self _updateDisplayLayoutElementReferenceFrame];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  [WeakRetained interactionControllerDidUpdateEdgeInsets:v4];
}

- (void)interactionControllerDidBeginEdgeResizing:(id)a3
{
  if ((*((unsigned char *)self + 1211) & 4) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewControllerDidBeginEdgeResize:self];
  }
}

- (void)interactionControllerDidEndEdgeResizing:(id)a3
{
  if ((*((unsigned char *)self + 1211) & 8) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewControllerDidEndEdgeResize:self];
  }
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  if (self->_displayLayoutElementAssertion)
  {
    id v5 = (void (**)(id, SBSDisplayLayoutElement *))a3;
    id v6 = [(UIViewController *)self _sbWindowScene];
    if (!v6)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBPIPContainerViewController.m", 785, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    id v16 = [v6 displayLayoutPublisher];
    if (!v16)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBPIPContainerViewController.m", 785, @"No publisher for window scene: %@; self: %@",
        v6,
        self);
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = [v16 transitionAssertionWithReason:v8];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v5[2](v5, self->_displayLayoutElement);
    uint64_t v11 = [v16 addElement:self->_displayLayoutElement];
    uint64_t v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    [v9 invalidate];
  }
  else
  {
    CAFrameRateRange v13 = (void (*)(void))*((void *)a3 + 2);
    id v16 = a3;
    v13();
  }
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  self->_BOOL wantsDisplayLayoutElement = a3;
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (displayLayoutElementAssertion) {
      return;
    }
    uint64_t v6 = [(UIViewController *)self _sbWindowScene];
    if (!v6) {
      return;
    }
    id v7 = (void *)v6;
    id v8 = [(UIViewController *)self _sbWindowScene];
    id v9 = [v8 delegate];

    if (!v9) {
      return;
    }
    CGFloat v10 = [(UIViewController *)self _sbWindowScene];
    if (!v10)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBPIPContainerViewController.m", 803, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    id v16 = [v10 displayLayoutPublisher];
    if (!v16)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBPIPContainerViewController.m", 803, @"No publisher for window scene: %@; self: %@",
        v10,
        self);
    }
    uint64_t v11 = [v16 addElement:self->_displayLayoutElement];
    uint64_t v12 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v11;

    CAFrameRateRange v13 = (BSInvalidatable *)v16;
  }
  else
  {
    if (!displayLayoutElementAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutElementAssertion invalidate];
    CAFrameRateRange v13 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (void)setIsActivelyTethered:(BOOL)a3 mode:(int64_t)a4
{
  if (self->_activelyTethered == a3) {
    return;
  }
  BOOL v5 = a3;
  self->_activelyTethered = a3;
  preTetheringLayoutSettings = self->_preTetheringLayoutSettings;
  if (a3)
  {
    if (preTetheringLayoutSettings)
    {
      CGFloat v26 = 0;
    }
    else
    {
      id v9 = [(SBPIPInteractionController *)self->_interactionController layoutSettings];
      CGFloat v10 = self->_preTetheringLayoutSettings;
      self->_preTetheringLayoutSettings = v9;

      [(SBPIPInteractionController *)self->_interactionController preferredNormalizedScale];
      self->_preTetheringNormalizedContentScale = v11;
      CGFloat v26 = self->_preTetheringLayoutSettings;
    }
  }
  else
  {
    CGFloat v26 = preTetheringLayoutSettings;
    id v8 = self->_preTetheringLayoutSettings;
    self->_preTetheringLayoutSettings = 0;
  }
  if (self->_activelyTethered)
  {
    if (a4 == 1)
    {
      if (!self->_microPIPLayoutSettings)
      {
        uint64_t v12 = +[SBPIPContentViewLayoutMetrics pegasusDefaultMicroPIPMetrics];
        CAFrameRateRange v13 = -[SBPIPContentViewLayoutSettings initWithPlatformMetrics:contentSize:]([SBPIPContentViewLayoutSettings alloc], "initWithPlatformMetrics:contentSize:", v12, 1.0, 1.0);
        microPIPLayoutSettings = self->_microPIPLayoutSettings;
        self->_microPIPLayoutSettings = v13;
      }
      if ([(UIView *)self->_contentView isHidden]) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = 2;
      }
      self->_tetheredInMicroPIPMode = 1;
      id v16 = self->_microPIPLayoutSettings;

      if (!self->_microPIPTetheringViewMirror)
      {
        uint64_t v17 = [SBMicroPIPTetheringMirrorView alloc];
        uint64_t v18 = -[SBMicroPIPTetheringMirrorView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        microPIPTetheringViewMirror = self->_microPIPTetheringViewMirror;
        self->_microPIPTetheringViewMirror = v18;

        [(SBMicroPIPTetheringMirrorView *)self->_microPIPTetheringViewMirror setHidden:[(UIView *)self->_contentView isHidden]];
        long long v20 = [(SBPIPContainerViewController *)self view];
        [v20 addSubview:self->_microPIPTetheringViewMirror];
      }
      CGFloat v26 = v16;
      goto LABEL_20;
    }
  }
  else if (self->_tetheredInMicroPIPMode)
  {
    self->_tetheredInMicroPIPMode = 0;
    [(SBPIPContainerViewController *)self _removeMicroPIPMirrorView];
  }
  uint64_t v15 = 2;
  if (!a4)
  {
LABEL_21:
    [(SBPIPInteractionController *)self->_interactionController setStashed:0];
    if (!v5) {
      [(SBPIPInteractionController *)self->_interactionController setEnabled:1];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringContainerViewController);
    interactionController = self->_interactionController;
    double v23 = [WeakRetained interactionController];
    [v23 currentNormalizedScale];
    -[SBPIPInteractionController setPreferredNormalizedScale:additionalReasons:animationBehavior:](interactionController, "setPreferredNormalizedScale:additionalReasons:animationBehavior:", 0, 2);

    [(SBPIPInteractionController *)self->_interactionController setContentLayoutSettings:v26 animationBehavior:v15];
    uint64_t v24 = self->_interactionController;
    if (v5)
    {
      [(SBPIPInteractionController *)v24 setEnabled:0];
      double v25 = [WeakRetained interactionController];
      [v25 setTargetOverlayView:self->_microPIPTetheringViewMirror];
    }
    else
    {
      [(SBPIPInteractionController *)v24 setPreferredNormalizedScale:self->_preTetheringNormalizedContentScale];
    }

    goto LABEL_27;
  }
LABEL_20:
  if (v5) {
    goto LABEL_21;
  }
LABEL_27:
}

- (void)layoutForTetheringInteractionController:(id)a3 behavior:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (self->_activelyTethered)
  {
    if (self->_tetheredInMicroPIPMode)
    {
      id v7 = [(SBMicroPIPTetheringMirrorView *)self->_microPIPTetheringViewMirror contentPlaceholderView];
      interactionController = self->_interactionController;
      [v6 currentNormalizedScale];
      -[SBPIPInteractionController setPreferredNormalizedScale:additionalReasons:animationBehavior:](interactionController, "setPreferredNormalizedScale:additionalReasons:animationBehavior:", 0, v4);
      [(SBPIPInteractionController *)self->_interactionController nonoperationalFrame];
      objc_msgSend(v7, "setBounds:", 0.0, 0.0);
      [v7 layoutIfNeeded];
      [(SBMicroPIPTetheringMirrorView *)self->_microPIPTetheringViewMirror layoutIfNeeded];
      id v9 = [(UIView *)self->_contentView superview];
      CGFloat v10 = [(SBPIPContainerViewController *)self view];

      if (v9 == v10)
      {
        uint64_t v12 = [v7 superview];
        [v7 frame];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        long long v21 = [(SBPIPContainerViewController *)self view];
        objc_msgSend(v12, "convertRect:toView:", v21, v14, v16, v18, v20);
        double v23 = v22;
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;

        -[UIView setFrame:](self->_contentView, "setFrame:", v23, v25, v27, v29);
        uint64_t v30 = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        double v32 = __81__SBPIPContainerViewController_layoutForTetheringInteractionController_behavior___block_invoke;
        double v33 = &unk_1E6AF5290;
        double v34 = self;
        id v35 = v7;
        [(SBPIPContainerViewController *)self performAfterInFlightAnimationsComplete:&v30];
      }
      else
      {
        contentView = self->_contentView;
        [v7 bounds];
        -[UIView setFrame:](contentView, "setFrame:");
      }
    }
    [(UIView *)self->_contentView layoutIfNeeded];
  }
}

void __81__SBPIPContainerViewController_layoutForTetheringInteractionController_behavior___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 984) superview];
  objc_super v3 = [*(id *)(a1 + 32) view];

  if (v2 == v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F42FF0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__SBPIPContainerViewController_layoutForTetheringInteractionController_behavior___block_invoke_2;
    v7[3] = &unk_1E6AF5290;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    [v4 _performWithoutRetargetingAnimations:v7];
  }
}

uint64_t __81__SBPIPContainerViewController_layoutForTetheringInteractionController_behavior___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 40) + 984)];
  v2 = *(void **)(a1 + 32);
  objc_super v3 = *(void **)(*(void *)(a1 + 40) + 984);
  [v2 bounds];
  return objc_msgSend(v3, "setFrame:");
}

- (void)_removeMicroPIPMirrorView
{
  microPIPTetheringViewMirror = self->_microPIPTetheringViewMirror;
  if (microPIPTetheringViewMirror)
  {
    uint64_t v4 = [(SBMicroPIPTetheringMirrorView *)microPIPTetheringViewMirror contentPlaceholderView];
    [(UIView *)self->_contentView center];
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = [(SBPIPContainerViewController *)self view];
    objc_msgSend(v4, "convertPoint:toView:", v9, v6, v8);
    double v11 = v10;
    double v13 = v12;

    double v14 = [(SBPIPContainerViewController *)self view];
    [v14 addSubview:self->_contentView];

    -[UIView setCenter:](self->_contentView, "setCenter:", v11, v13);
    [(UIView *)self->_contentView layoutIfNeeded];
    [(SBMicroPIPTetheringMirrorView *)self->_microPIPTetheringViewMirror removeFromSuperview];
    double v15 = self->_microPIPTetheringViewMirror;
    self->_microPIPTetheringViewMirror = 0;
  }
}

- (void)setTetheredContainerViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tetheredContainerViewController, obj);
    [(SBPIPInteractionController *)self->_interactionController setStashed:0];
    double v5 = obj;
  }
}

- (void)rotationAnimationWillBeginToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  unint64_t v10 = [(SBPIPContainerViewController *)self currentCanonicalPosition];
  [(UIView *)self->_contentView bounds];
  double v13 = v11;
  double v14 = v12;
  double v15 = 0.5;
  double v16 = 0.5;
  if (!self->_activelyTethered)
  {
    if (a3 == 1)
    {
      switch(v10)
      {
        case 0uLL:
LABEL_11:
          double v20 = v12 * 0.5;
          goto LABEL_13;
        case 1uLL:
LABEL_15:
          double v21 = v12 + v11 * -0.5;
          goto LABEL_16;
        case 2uLL:
LABEL_12:
          double v20 = v11 + v12 * -0.5;
LABEL_13:
          double v15 = v20 / v11;
          break;
        case 3uLL:
LABEL_14:
          double v21 = v11 * 0.5;
LABEL_16:
          double v16 = v21 / v12;
          break;
        default:
          break;
      }
    }
    else if (!a3)
    {
      switch(v10)
      {
        case 0uLL:
          goto LABEL_14;
        case 1uLL:
          goto LABEL_11;
        case 2uLL:
          goto LABEL_15;
        case 3uLL:
          goto LABEL_12;
        default:
          break;
      }
    }
  }
  self->_wasInteractionEnabledPreRotationAnimation = [(SBPIPInteractionController *)self->_interactionController isEnabled];
  [(SBPIPInteractionController *)self->_interactionController setEnabled:0];
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v23);
  v24.size.CGFloat height = height;
  double v18 = MidX;
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  double MidY = CGRectGetMidY(v24);
  -[UIView setAnchorPoint:](self->_contentView, "setAnchorPoint:", v15, v16);
  -[UIView setCenter:](self->_contentView, "setCenter:", v18 + (v15 + -0.5) * v13, MidY + (v16 + -0.5) * v14);
  if (self->_activelyTethered)
  {
    [(SBPIPContainerViewController *)self startDisplayLink];
  }
}

- (void)rotationAnimationDidBeginToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4
{
  if ((unint64_t)(a3 - 1) > 2) {
    CGFloat v5 = -1.57079633;
  }
  else {
    CGFloat v5 = dbl_1D8FD1AE8[a3 - 1];
  }
  if (self->_activelyTethered && BSFloatEqualToFloat())
  {
    contentView = self->_contentView;
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v11[0] = *MEMORY[0x1E4F1DAB8];
    v11[1] = v7;
    v11[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v8 = (CGAffineTransform *)v11;
  }
  else
  {
    uint64_t v9 = self->_contentView;
    CGAffineTransformMakeRotation(&v10, v5);
    double v8 = &v10;
    contentView = v9;
  }
  [(UIView *)contentView setTransform:v8];
}

- (void)rotationAnimationWillCompleteToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  contentView = self->_contentView;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v15[0] = *MEMORY[0x1E4F1DAB8];
  v15[1] = v11;
  v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)contentView setTransform:v15];
  -[UIView setAnchorPoint:](self->_contentView, "setAnchorPoint:", 0.5, 0.5);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  -[UIView setCenter:](self->_contentView, "setCenter:", MidX, CGRectGetMidY(v17));
  if ((unint64_t)a3 <= 1)
  {
    [(SBPIPInteractionController *)self->_interactionController preferredContentSize];
    -[SBPIPInteractionController setPreferredContentSize:](self->_interactionController, "setPreferredContentSize:", v14, v13);
  }
}

- (void)rotationAnimationDidCompleteToRotation:(int64_t)a3 contentViewFrame:(CGRect)a4
{
  if (self->_activelyTethered) {
    [(SBPIPContainerViewController *)self _layoutWithNonOperationFrame];
  }
  [(SBPIPContainerViewController *)self stopDisplayLink];
  [(SBPIPInteractionController *)self->_interactionController setEnabled:self->_wasInteractionEnabledPreRotationAnimation];
  [(SBPIPContainerViewController *)self _updateDisplayLayoutElementReferenceFrame];
}

- (void)_layoutWithNonOperationFrame
{
  [(SBPIPInteractionController *)self->_interactionController nonoperationalFrame];
  [(SBPIPContainerViewController *)self _updateContentViewFrame:@"Rotation end", 0, 0.0, 0.0 reason usingDisplayArrangementSpace];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringContainerViewController);
  objc_super v3 = [WeakRetained interactionController];
  [(SBPIPContainerViewController *)self layoutForTetheringInteractionController:v3 behavior:0];
}

- (void)startDisplayLink
{
  objc_super v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__handleMicroPiPRotationDisplayLink_];
  microPiPRotationDisplayLink = self->_microPiPRotationDisplayLink;
  self->_microPiPRotationDisplayLink = v3;

  CGFloat v5 = self->_microPiPRotationDisplayLink;
  id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)_handleMicroPiPRotationDisplayLink:(id)a3
{
  uint64_t v4 = [(UIView *)self->_contentView layer];
  CGFloat v5 = [v4 presentationLayer];
  [v5 frame];

  id v6 = [(UIView *)self->_contentView superview];
  [v6 bounds];
  long long v7 = [(UIView *)self->_contentView superview];
  [v7 bounds];

  UIRectGetCenter();
  contentView = self->_contentView;
  -[UIView setCenter:](contentView, "setCenter:");
}

- (void)stopDisplayLink
{
  [(CADisplayLink *)self->_microPiPRotationDisplayLink invalidate];
  microPiPRotationDisplayLink = self->_microPiPRotationDisplayLink;
  self->_microPiPRotationDisplayLink = 0;
}

- (void)_setStashTabHidden:(BOOL)a3 left:(BOOL)a4 completion:(id)a5
{
  uint64_t v5 = a4;
  BOOL v6 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v8 = (void (**)(void))a5;
  if ([(SBPIPInteractionController *)self->_interactionController isEnabled])
  {
    int v9 = (*((unsigned char *)self + 1210) & 0x10) != 0
       ? [(SBPIPContainerViewControllerAdapter *)self->_adapter isStashTabHiddenForContainerViewController:self]: 1;
    if (v9 != v6)
    {
      unsigned int v16 = v5;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      CGAffineTransform v10 = self->_observerHashTable;
      uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            double v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
            if (objc_opt_respondsToSelector()) {
              [v15 containerViewControllerUserMayUpdateStashState:self];
            }
            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }

      uint64_t v5 = v16;
    }
  }
  if (*((unsigned char *)self + 1210))
  {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewController:self wantsStashTabHidden:v6 left:v5 springSettings:self->_stashTabAnimationSettings completion:v8];
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

- (void)_setAdapter:(id)a3
{
  uint64_t v5 = (SBPIPContainerViewControllerAdapter *)a3;
  if (self->_adapter != v5)
  {
    double v32 = v5;
    *((unsigned char *)self + 1208) = *((unsigned char *)self + 1208) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 1208) = *((unsigned char *)self + 1208) & 0xFD | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)self + 1208) = *((unsigned char *)self + 1208) & 0xFB | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)self + 1208) = *((unsigned char *)self + 1208) & 0xF7 | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 16;
    }
    else {
      char v9 = 0;
    }
    *((unsigned char *)self + 1208) = *((unsigned char *)self + 1208) & 0xEF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 32;
    }
    else {
      char v10 = 0;
    }
    *((unsigned char *)self + 1208) = *((unsigned char *)self + 1208) & 0xDF | v10;
    if (objc_opt_respondsToSelector()) {
      char v11 = 64;
    }
    else {
      char v11 = 0;
    }
    *((unsigned char *)self + 1208) = *((unsigned char *)self + 1208) & 0xBF | v11;
    if (objc_opt_respondsToSelector()) {
      char v12 = 0x80;
    }
    else {
      char v12 = 0;
    }
    *((unsigned char *)self + 1208) = v12 & 0x80 | *((unsigned char *)self + 1208) & 0x7F;
    *((unsigned char *)self + 1209) = *((unsigned char *)self + 1209) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    *((unsigned char *)self + 1209) = *((unsigned char *)self + 1209) & 0xFD | v13;
    if (objc_opt_respondsToSelector()) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    *((unsigned char *)self + 1209) = *((unsigned char *)self + 1209) & 0xFB | v14;
    if (objc_opt_respondsToSelector()) {
      char v15 = 8;
    }
    else {
      char v15 = 0;
    }
    *((unsigned char *)self + 1209) = *((unsigned char *)self + 1209) & 0xF7 | v15;
    if (objc_opt_respondsToSelector()) {
      char v16 = 16;
    }
    else {
      char v16 = 0;
    }
    *((unsigned char *)self + 1209) = *((unsigned char *)self + 1209) & 0xEF | v16;
    if (objc_opt_respondsToSelector()) {
      char v17 = 32;
    }
    else {
      char v17 = 0;
    }
    *((unsigned char *)self + 1209) = *((unsigned char *)self + 1209) & 0xDF | v17;
    if (objc_opt_respondsToSelector()) {
      char v18 = 64;
    }
    else {
      char v18 = 0;
    }
    *((unsigned char *)self + 1209) = *((unsigned char *)self + 1209) & 0xBF | v18;
    if (objc_opt_respondsToSelector()) {
      char v19 = 0x80;
    }
    else {
      char v19 = 0;
    }
    *((unsigned char *)self + 1209) = v19 & 0x80 | *((unsigned char *)self + 1209) & 0x7F;
    if (objc_opt_respondsToSelector()) {
      char v20 = 4;
    }
    else {
      char v20 = 0;
    }
    *((unsigned char *)self + 1211) = *((unsigned char *)self + 1211) & 0xFB | v20;
    if (objc_opt_respondsToSelector()) {
      char v21 = 8;
    }
    else {
      char v21 = 0;
    }
    *((unsigned char *)self + 1211) = *((unsigned char *)self + 1211) & 0xF7 | v21;
    *((unsigned char *)self + 1210) = *((unsigned char *)self + 1210) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v22 = 2;
    }
    else {
      char v22 = 0;
    }
    *((unsigned char *)self + 1210) = *((unsigned char *)self + 1210) & 0xFD | v22;
    if (objc_opt_respondsToSelector()) {
      char v23 = 4;
    }
    else {
      char v23 = 0;
    }
    *((unsigned char *)self + 1210) = *((unsigned char *)self + 1210) & 0xFB | v23;
    if (objc_opt_respondsToSelector()) {
      char v24 = 8;
    }
    else {
      char v24 = 0;
    }
    *((unsigned char *)self + 1210) = *((unsigned char *)self + 1210) & 0xF7 | v24;
    if (objc_opt_respondsToSelector()) {
      char v25 = 16;
    }
    else {
      char v25 = 0;
    }
    *((unsigned char *)self + 1210) = *((unsigned char *)self + 1210) & 0xEF | v25;
    if (objc_opt_respondsToSelector()) {
      char v26 = 32;
    }
    else {
      char v26 = 0;
    }
    *((unsigned char *)self + 1210) = *((unsigned char *)self + 1210) & 0xDF | v26;
    if (objc_opt_respondsToSelector()) {
      char v27 = 64;
    }
    else {
      char v27 = 0;
    }
    *((unsigned char *)self + 1210) = *((unsigned char *)self + 1210) & 0xBF | v27;
    if (objc_opt_respondsToSelector()) {
      char v28 = 0x80;
    }
    else {
      char v28 = 0;
    }
    *((unsigned char *)self + 1210) = v28 & 0x80 | *((unsigned char *)self + 1210) & 0x7F;
    *((unsigned char *)self + 1211) = *((unsigned char *)self + 1211) & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v29 = 2;
    }
    else {
      char v29 = 0;
    }
    *((unsigned char *)self + 1211) = *((unsigned char *)self + 1211) & 0xFD | v29;
    uint64_t v30 = [(SBPIPContainerViewControllerAdapter *)v32 contentViewControllerForContainerViewController:self];
    contentViewController = self->_contentViewController;
    self->_contentViewController = v30;

    objc_storeStrong((id *)&self->_adapter, a3);
    [(SBPIPContainerViewControllerAdapter *)self->_adapter setContainerViewController:self];
    uint64_t v5 = v32;
  }
}

- (int)processIdentifier
{
  adapter = self->_adapter;
  if (adapter) {
    return [(SBPIPContainerViewControllerAdapter *)adapter processIdentifierForContainerViewController:self];
  }
  else {
    return -1;
  }
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(SBPIPContainerViewControllerAdapter *)self->_adapter bundleIdentifierForContainerViewController:self];
}

- (NSString)scenePersistenceIdentifier
{
  return (NSString *)[(SBPIPContainerViewControllerAdapter *)self->_adapter scenePersistenceIdentifierForContainerViewController:self];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (id)maximumAvailableVerticalPadding
{
  objc_super v3 = [(SBPIPContainerViewController *)self viewIfLoaded];
  [v3 bounds];
  double v5 = v4;

  char v6 = [(SBPIPContainerViewController *)self contentViewController];
  char v7 = [v6 viewIfLoaded];
  [v7 bounds];
  double v9 = v8;

  if (v5 <= 0.0)
  {
    char v16 = 0;
    goto LABEL_16;
  }
  char v10 = [(SBPIPInteractionController *)self->_interactionController layoutSettings];
  [v10 contentViewPadding];
  double v12 = v11;

  int v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    char v14 = v13;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
      double v15 = v20;
      goto LABEL_15;
    }
    if (SBFEffectiveHomeButtonType() == 2)
    {
      double v15 = v12;
    }
    else
    {
      [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
      double v15 = v18;
    }
    if (v14) {
      goto LABEL_15;
    }
  }
  else
  {
    char v10 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v10 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2)
    {
      [MEMORY[0x1E4F42E28] heightForStyle:0 orientation:1];
      double v15 = v17;
    }
    else
    {
      double v15 = v12;
    }
  }

LABEL_15:
  char v16 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(v5 - (v12 + v9 + v15), 0.0));
LABEL_16:
  return v16;
}

- (void)setContentViewPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentViewPadding.left
    || a3.top != self->_contentViewPadding.top
    || a3.right != self->_contentViewPadding.right
    || a3.bottom != self->_contentViewPadding.bottom)
  {
    self->_contentViewPadding = a3;
    [(SBPIPContainerViewController *)self _updateContentPadding];
  }
}

- (void)setStashedPadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_stashedPadding.left
    || a3.top != self->_stashedPadding.top
    || a3.right != self->_stashedPadding.right
    || a3.bottom != self->_stashedPadding.bottom)
  {
    self->_stashedPadding = a3;
    [(SBPIPInteractionController *)self->_interactionController reloadInsets];
  }
}

- (void)setStashed:(BOOL)a3
{
  interactionController = self->_interactionController;
  if (interactionController)
  {
    BOOL v5 = a3;
    if ((*((unsigned char *)self + 1209) & 4) != 0)
    {
      [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewController:self willUpdateStashState:a3];
      interactionController = self->_interactionController;
    }
    [(SBPIPInteractionController *)interactionController setStashed:v5];
    [(SBPIPContainerViewController *)self _notifyStashStateChanged:v5];
  }
}

- (BOOL)isStashed
{
  return [(SBPIPInteractionController *)self->_interactionController isStashed];
}

- (void)setConnectedWindowScenes:(id)a3
{
  id v6 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    double v4 = (NSArray *)[v6 copy];
    connectedWindowScenes = self->_connectedWindowScenes;
    self->_connectedWindowScenes = v4;
  }
}

- (void)_notifyStashStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 1209) & 8) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewController:self didUpdateStashState:a3 springSettings:self->_stashTabAnimationSettings];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v5 = self->_observerHashTable;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "containerViewController:userDidUpdateStashState:", self, v3, (void)v11);
        }
      }
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(SBPIPContainerViewController *)self _updateDisplayLayoutElementReferenceFrame];
}

- (void)acquireInterfaceOrientationLock
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_interfaceOrientationLockAcquired)
  {
    self->_interfaceOrientationLockAcquired = 1;
    BOOL v3 = SBLogPIP();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v6 = self;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%p][PIP Container] acquireInterfaceOrientationLock", buf, 0xCu);
    }

    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__SBPIPContainerViewController_acquireInterfaceOrientationLock__block_invoke;
    v4[3] = &unk_1E6AF4AC0;
    v4[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v4];
  }
}

uint64_t __63__SBPIPContainerViewController_acquireInterfaceOrientationLock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)relinquishInterfaceOrientationLock
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (self->_interfaceOrientationLockAcquired)
  {
    self->_interfaceOrientationLockAcquired = 0;
    BOOL v3 = SBLogTraitsArbiter();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      BOOL v5 = self;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%p][PIP Container] relinquishInterfaceOrientationLock", (uint8_t *)&v4, 0xCu);
    }

    [(UIViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (void)_requireInterfaceOrientation:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_requiredInterfaceOrientation != a3)
  {
    self->_requiredInterfaceOrientation = a3;
    int v4 = SBLogTraitsArbiter();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = SBFStringForBSInterfaceOrientation();
      int v6 = 134218242;
      uint64_t v7 = self;
      __int16 v8 = 2114;
      double v9 = v5;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "[%p][PIP Container] requireInterfaceOrientation:%{public}@", (uint8_t *)&v6, 0x16u);
    }
    [(UIViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL interfaceOrientationLockAcquired = self->_interfaceOrientationLockAcquired;
  int64_t requiredInterfaceOrientation = self->_requiredInterfaceOrientation;
  if (interfaceOrientationLockAcquired)
  {
    if (!requiredInterfaceOrientation) {
      LOBYTE(requiredInterfaceOrientation) = [(SBPIPContainerViewController *)self windowInterfaceOrientation];
    }
    goto LABEL_5;
  }
  if (requiredInterfaceOrientation)
  {
LABEL_5:
    unint64_t v5 = 1 << requiredInterfaceOrientation;
    goto LABEL_6;
  }
  unint64_t v5 = 30;
LABEL_6:
  int v6 = SBLogTraitsArbiter();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = MEMORY[0x1D948A420](v5);
    int v9 = 134218242;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    long long v12 = v7;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%p][PIP Container] current supported orientations: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  return v5;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3) {
    a3->var6 = 0;
  }
}

- (void)startResourcesUsageReductionAfterTimeout:(double)a3
{
  objc_initWeak(&location, self);
  [(BSAbsoluteMachTimer *)self->_stashedStateReduceResourcesUsageTimer invalidate];
  unint64_t v5 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBPIPContainerViewController.stashedStateReduceResourcesUsageTimer"];
  stashedStateReduceResourcesUsageTimer = self->_stashedStateReduceResourcesUsageTimer;
  self->_stashedStateReduceResourcesUsageTimer = v5;

  uint64_t v7 = self->_stashedStateReduceResourcesUsageTimer;
  uint64_t v8 = MEMORY[0x1E4F14428];
  id v9 = MEMORY[0x1E4F14428];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __73__SBPIPContainerViewController_startResourcesUsageReductionAfterTimeout___block_invoke;
  v10[3] = &unk_1E6AF5838;
  objc_copyWeak(&v11, &location);
  [(BSAbsoluteMachTimer *)v7 scheduleWithFireInterval:v8 leewayInterval:v10 queue:a3 handler:0.0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __73__SBPIPContainerViewController_startResourcesUsageReductionAfterTimeout___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[135] invalidate];
    id v3 = v2[135];
    v2[135] = 0;

    if ((*((unsigned char *)v2 + 1210) & 0x20) != 0) {
      [v2[149] containerViewControllerStartReducingResourcesUsage:v2];
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v2[122];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v9, "containerViewControllerStartReducingResourcesUsage:", v2, (void)v10);
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)stopResourcesUsageReduction
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(BSAbsoluteMachTimer *)self->_stashedStateReduceResourcesUsageTimer invalidate];
  stashedStateReduceResourcesUsageTimer = self->_stashedStateReduceResourcesUsageTimer;
  self->_stashedStateReduceResourcesUsageTimer = 0;

  if ((*((unsigned char *)self + 1210) & 0x40) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewControllerStopReducingResourcesUsage:self];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_observerHashTable;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "containerViewControllerStopReducingResourcesUsage:", self, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)forcePictureInPictureToFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBPIPInteractionController *)self->_interactionController setEnabled:0];
  [(SBPIPContainerViewController *)self _updateContentViewFrame:@"Force PIP To Frame", 0, x, y, width, height reason usingDisplayArrangementSpace];
}

- (BOOL)prefersIdleTimerDisabled
{
  if ((*((unsigned char *)self + 1208) & 4) != 0) {
    return [(SBPIPContainerViewControllerAdapter *)self->_adapter shouldDisableIdleTimerForContainerViewController:self];
  }
  else {
    return 0;
  }
}

- (UIView)morphAnimatorTargetView
{
  if (*((char *)self + 1208) < 0)
  {
    v2 = [(SBPIPContainerViewControllerAdapter *)self->_adapter morphAnimatorTargetViewForContainerViewController:self];
  }
  else
  {
    v2 = 0;
  }
  return (UIView *)v2;
}

- (UIView)morphAnimatorTargetContainerView
{
  if (*((unsigned char *)self + 1209))
  {
    v2 = [(SBPIPContainerViewControllerAdapter *)self->_adapter morphAnimatorTargetContainerViewForContainerViewController:self];
  }
  else
  {
    v2 = 0;
  }
  return (UIView *)v2;
}

- (void)transitionAnimationWillBegin
{
  if ((*((unsigned char *)self + 1208) & 8) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter transitionAnimationWillBeginForContainerViewController:self];
  }
}

- (void)transitionAnimationDidEnd
{
  if ((*((unsigned char *)self + 1208) & 0x10) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter transitionAnimationDidEndForContainerViewController:self];
  }
}

- (void)handleDestructionRequestForSceneHandle:(id)a3
{
  if ((*((unsigned char *)self + 1208) & 0x20) != 0) {
    [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewController:self handleDestructionRequestForSceneHandle:a3];
  }
}

- (void)_updateContentViewFrame:(CGRect)a3 reason:(id)a4 usingDisplayArrangementSpace:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  [(SBPIPInteractionController *)self->_interactionController layoutWithFrame:x reason:y source:width usingDisplayArrangementSpace:height];
  if ((*((unsigned char *)self + 1209) & 2) != 0) {
    -[SBPIPContainerViewControllerAdapter containerViewController:didUpdateContentViewFrame:reason:](self->_adapter, "containerViewController:didUpdateContentViewFrame:reason:", self, v10, x, y, width, height);
  }
}

- (void)_updateDisplayLayoutElementReferenceFrame
{
  [(SBSDisplayLayoutElement *)self->_displayLayoutElement referenceFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SBPIPContainerViewController *)self _contentViewFrameInDisplayReferenceSpace];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  int v19 = [(SBPIPContainerViewController *)self isStashed];
  if (v19 != [(SBSDisplayLayoutElement *)self->_displayLayoutElement sb_isStashedPIP]) {
    goto LABEL_3;
  }
  v21.origin.double x = v4;
  v21.origin.double y = v6;
  v21.size.double width = v8;
  v21.size.double height = v10;
  v22.origin.double x = v12;
  v22.origin.double y = v14;
  v22.size.double width = v16;
  v22.size.double height = v18;
  if (!CGRectEqualToRect(v21, v22))
  {
LABEL_3:
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __73__SBPIPContainerViewController__updateDisplayLayoutElementReferenceFrame__block_invoke;
    v20[3] = &unk_1E6B02E40;
    *(CGFloat *)&void v20[5] = v12;
    *(CGFloat *)&v20[6] = v14;
    *(CGFloat *)&v20[7] = v16;
    *(CGFloat *)&v20[8] = v18;
    v20[4] = self;
    [(SBPIPContainerViewController *)self updateDisplayLayoutElementWithBuilder:v20];
  }
}

void __73__SBPIPContainerViewController__updateDisplayLayoutElementReferenceFrame__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  id v7 = a2;
  objc_msgSend(v7, "setReferenceFrame:", v3, v4, v5, v6);
  objc_msgSend(v7, "sb_setStashedPIP:", objc_msgSend(*(id *)(a1 + 32), "isStashed"));
}

- (id)hostedAppSceneHandle
{
  if ((*((unsigned char *)self + 1208) & 0x40) != 0)
  {
    v2 = [(SBPIPContainerViewControllerAdapter *)self->_adapter hostedAppSceneHandleForContainerViewController:self];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (int64_t)windowInterfaceOrientation
{
  v2 = [(SBPIPContainerViewController *)self view];
  double v3 = [v2 window];
  int64_t v4 = [v3 interfaceOrientation];

  return v4;
}

- (CGRect)_contentViewFrameInDisplayReferenceSpace
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if ([(SBPIPContainerViewController *)self isViewLoaded])
  {
    id v7 = [(SBPIPContainerViewController *)self view];
    CGFloat v8 = [v7 window];

    if (v8)
    {
      contentView = self->_contentView;
      [(UIView *)contentView bounds];
      -[UIView convertRect:toView:](contentView, "convertRect:toView:", 0);
      objc_msgSend(v8, "_convertRectToSceneReferenceSpace:");
      double v3 = v10;
      double v4 = v11;
      double v5 = v12;
      double v6 = v13;
    }
  }
  double v14 = v3;
  double v15 = v4;
  double v16 = v5;
  double v17 = v6;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_frameInFixedCoordinateSpace:(CGRect)a3 transformedToInterfaceOrientation:(int64_t)a4
{
  double v6 = [(SBPIPContainerViewController *)self view];
  id v7 = [v6 window];

  CGFloat v8 = [v7 screen];
  double v9 = [v8 fixedCoordinateSpace];
  [v9 bounds];

  if (!a4) {
    [(SBPIPContainerViewController *)self windowInterfaceOrientation];
  }
  _UIWindowConvertRectFromOrientationToOrientation();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (void)setContentScale:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
  {
    CGFloat v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = _SBFLoggingMethodProem();
    [v8 handleFailureInMethod:a2, self, @"SBPIPContainerViewController.m", 1383, @"%@ expects scale in range [0..1]. Content scale given in input: %.2f", v9, *(void *)&a3 object file lineNumber description];
  }
  interactionController = self->_interactionController;
  [(SBPIPInteractionController *)interactionController setPreferredNormalizedScale:a3];
}

- (double)contentScale
{
  [(SBPIPInteractionController *)self->_interactionController currentNormalizedScale];
  return result;
}

- (BOOL)requiresMedusaKeyboard
{
  if (*((char *)self + 1210) < 0) {
    return [(SBPIPContainerViewControllerAdapter *)self->_adapter containerViewControllerShouldRequireMedusaKeyboard:self];
  }
  else {
    return 0;
  }
}

- (void)setPrefersHiddenFromClonedDisplay:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_prefersHiddenFromClonedDisplay != a3)
  {
    self->_prefersHiddenFromClonedDispladouble y = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = [(NSHashTable *)self->_observerHashTable allObjects];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 containerViewControllerDidUpdatePrefersHiddenFromClonedDisplays:self];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (NSNumber)overrideResourcesUsageReductionTimeout
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(SBPIPContainerViewControllerAdapter *)self->_adapter overrideResourcesUsageReductionTimeout];
  }
  else
  {
    double v3 = 0;
  }
  return (NSNumber *)v3;
}

- (BOOL)shouldSuppressAssociatedElementsInSystemAperture
{
  if ((*((unsigned char *)self + 1211) & 2) != 0) {
    return [(SBPIPContainerViewControllerAdapter *)self->_adapter shouldSuppressAssociatedElementsInSystemAperture];
  }
  else {
    return 0;
  }
}

- (int64_t)requiredInterfaceOrientation
{
  return self->_requiredInterfaceOrientation;
}

- (SBPIPInteractionController)interactionController
{
  return self->_interactionController;
}

- (SBPIPContainerViewControllerInteractionObserver)interactionObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionObserver);
  return (SBPIPContainerViewControllerInteractionObserver *)WeakRetained;
}

- (void)setInteractionObserver:(id)a3
{
}

- (NSArray)connectedWindowScenes
{
  return self->_connectedWindowScenes;
}

- (BOOL)isActivelyTethered
{
  return self->_activelyTethered;
}

- (SBPIPContainerViewController)tetheredContainerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheredContainerViewController);
  return (SBPIPContainerViewController *)WeakRetained;
}

- (SBPIPContainerViewController)tetheringContainerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tetheringContainerViewController);
  return (SBPIPContainerViewController *)WeakRetained;
}

- (void)setTetheringContainerViewController:(id)a3
{
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (int64_t)contentZOrderPriority
{
  return self->_contentZOrderPriority;
}

- (void)setContentZOrderPriority:(int64_t)a3
{
  self->_contentZOrderPrioritdouble y = a3;
}

- (BOOL)prefersHiddenFromClonedDisplay
{
  return self->_prefersHiddenFromClonedDisplay;
}

- (UIEdgeInsets)effectiveEdgeInsets
{
  double top = self->_effectiveEdgeInsets.top;
  double left = self->_effectiveEdgeInsets.left;
  double bottom = self->_effectiveEdgeInsets.bottom;
  double right = self->_effectiveEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)stashedPadding
{
  double top = self->_stashedPadding.top;
  double left = self->_stashedPadding.left;
  double bottom = self->_stashedPadding.bottom;
  double right = self->_stashedPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tetheringContainerViewController);
  objc_destroyWeak((id *)&self->_tetheredContainerViewController);
  objc_storeStrong((id *)&self->_connectedWindowScenes, 0);
  objc_destroyWeak((id *)&self->_interactionObserver);
  objc_storeStrong((id *)&self->_interactionController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_adapter, 0);
  objc_destroyWeak((id *)&self->_pipController);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong((id *)&self->_microPIPLayoutSettings, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_microPiPRotationDisplayLink, 0);
  objc_storeStrong((id *)&self->_metricsAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_metricsAnimationSettings, 0);
  objc_storeStrong((id *)&self->_waitInteractionAnimationsCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_stashedStateReduceResourcesUsageTimer, 0);
  objc_storeStrong((id *)&self->_regionUpdateAnimationSettings, 0);
  objc_storeStrong((id *)&self->_stashTabAnimationSettings, 0);
  objc_storeStrong((id *)&self->_interactiveAnimationSettings, 0);
  objc_storeStrong((id *)&self->_preTetheringLayoutSettings, 0);
  objc_storeStrong((id *)&self->_microPIPTetheringViewMirror, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_observerHashTable, 0);
}

- (void)SB_accessibilityToggleStashed
{
  uint64_t v3 = [(SBPIPContainerViewController *)self isStashed] ^ 1;
  [(SBPIPContainerViewController *)self setStashed:v3];
}

- (void)initWithPIPController:interactionSettings:adapter:.cold.1()
{
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);
}

@end