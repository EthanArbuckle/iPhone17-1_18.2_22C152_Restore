@interface SBInteractiveScreenshotGestureRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isGestureStyleDisabled:(int64_t)a3;
- (BOOL)_isGestureStyleReducedMotion:(int64_t)a3;
- (CATransform3D)_anchoredTransformForAnchorPoint:(SEL)a3 bounds:(CGPoint)a4 center:(CGRect)a5 transform:(CGPoint)a6;
- (CATransform3D)_contentTransformForCommitProgress:(SEL)a3 contentInsets:(double)a4 additionalContentTranslation:(UIEdgeInsets)a5;
- (CATransform3D)_inverseContentTransformForCommitProgress:(SEL)a3 contentInsets:(double)a4 additionalContentTranslation:(UIEdgeInsets)a5;
- (SBInteractiveScreenshotGestureRootViewController)initWithWindowScene:(id)a3;
- (SBInteractiveScreenshotGestureRootViewControllerDelegate)delegate;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (double)_currentCommitProgressVelocity;
- (double)_gestureCommitProgressUpdateVelocityOverTimeInterval:(double)a3;
- (id)_createFlashViewWithFrame:(CGRect)a3;
- (id)_createMaterialViewWithFrame:(CGRect)a3 groupName:(id)a4 isCaptureOnly:(BOOL)a5;
- (id)_createScreenshotImageViewWithFrame:(CGRect)a3;
- (int64_t)gestureStyle;
- (unint64_t)flashViewLayerRenderID;
- (unint64_t)supportedInterfaceOrientations;
- (unsigned)flashViewLayerContextID;
- (void)_addGestureUpdateWithCommitProgress:(double)a3 timestamp:(double)a4;
- (void)_cancellationCommitProgressAnimatablePropertyPresentationValueDidChange;
- (void)_getContentTranslation:(CGPoint *)a3 scale:(CGPoint *)a4 forCommitProgress:(double)a5 contentInsets:(UIEdgeInsets)a6 additionalContentTranslation:(CGPoint)a7;
- (void)_getDistanceTraveled:(double *)a3 fullDistance:(double *)a4 commitProgress:(double *)a5 forTranslationFromCorner:(CGPoint)a6 bounds:(CGRect)a7;
- (void)_injectCommitProgressVelocity:(double)a3;
- (void)_prepareViewHierarchyForCommittedScreenshot:(BOOL)a3 gestureStyle:(int64_t)a4;
- (void)_updateContentTransformUsingPresentationValues:(BOOL)a3;
- (void)_updateCropLinesMultiPartAnimationForCropsProgress;
- (void)_updateWithUpdateMode:(int64_t)a3 commitProgress:(double)a4 additionalContentTranslation:(CGPoint)a5 completion:(id)a6;
- (void)_updateWithUpdateMode:(int64_t)a3 contentAnimationSettings:(id)a4 commitProgress:(double)a5 additionalContentTranslation:(CGPoint)a6 completion:(id)a7;
- (void)cancelInteractionWithStyle:(int64_t)a3 settlingCompletionHandler:(id)a4;
- (void)captureScreenshotWithInterfaceOrientation:(int64_t)a3 completion:(id)a4;
- (void)commitInteractionWithScreenshotImage:(id)a3 screenshotInterfaceOrientation:(int64_t)a4 settlingCompletionHandler:(id)a5 flashCompletionHandler:(id)a6;
- (void)handlePanGestureRecognizerAction:(id)a3;
- (void)invalidate;
- (void)removePlaceholderChrome;
- (void)setDelegate:(id)a3;
- (void)setGestureStyle:(int64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SBInteractiveScreenshotGestureRootViewController

- (SBInteractiveScreenshotGestureRootViewController)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBInteractiveScreenshotGestureRootViewController;
  v5 = [(SBInteractiveScreenshotGestureRootViewController *)&v19 initWithNibName:0 bundle:0];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.SpringBoard.SBInteractiveScreenshotGestureRootViewController.accessQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v6;

    v8 = [MEMORY[0x1E4F62490] sharedInstance];
    v9 = [v4 _FBSScene];
    v10 = [v9 identityToken];
    uint64_t v11 = [v8 sceneFromIdentityToken:v10];
    sourceScene = v5->_sourceScene;
    v5->_sourceScene = (FBScene *)v11;

    uint64_t v13 = +[SBInteractiveScreenshotDomain rootSettings];
    settings = v5->_settings;
    v5->_settings = (SBInteractiveScreenshotSettings *)v13;

    v15 = [(SBInteractiveScreenshotSettings *)v5->_settings cropsAnimationSettings];
    uint64_t v16 = [v15 copy];
    trackingCropsAnimationSettings = v5->_trackingCropsAnimationSettings;
    v5->_trackingCropsAnimationSettings = (SBFFluidBehaviorSettings *)v16;
  }
  return v5;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)SBInteractiveScreenshotGestureRootViewController;
  [(SBInteractiveScreenshotGestureRootViewController *)&v2 viewDidLayoutSubviews];
}

- (void)viewDidLoad
{
  v88[4] = *MEMORY[0x1E4F143B8];
  v86.receiver = self;
  v86.super_class = (Class)SBInteractiveScreenshotGestureRootViewController;
  [(SBInteractiveScreenshotGestureRootViewController *)&v86 viewDidLoad];
  v3 = [(SBInteractiveScreenshotGestureRootViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v12];

  uint64_t v13 = (SSChromePlaceholderViewController *)objc_alloc_init(MEMORY[0x1E4F99DC0]);
  chromePlaceholderViewController = self->_chromePlaceholderViewController;
  self->_chromePlaceholderViewController = v13;

  v75 = [(FBScene *)self->_sourceScene identifier];
  v76 = [NSString stringWithFormat:@"SBInteractiveGestureContent-%@", v75];
  v15 = -[_SBInteractiveScreenshotGestureBackdropView initWithFrame:]([_SBInteractiveScreenshotGestureBackdropView alloc], "initWithFrame:", v5, v7, v9, v11);
  contentCapturingView = self->_contentCapturingView;
  self->_contentCapturingView = v15;

  [(_SBInteractiveScreenshotGestureBackdropView *)self->_contentCapturingView bs_setHitTestingDisabled:1];
  v78 = [(_SBInteractiveScreenshotGestureBackdropView *)self->_contentCapturingView backdropLayer];
  [v78 setGroupName:v76];
  [v78 setCaptureOnly:1];
  [v3 addSubview:self->_contentCapturingView];
  -[SBInteractiveScreenshotGestureRootViewController _createMaterialViewWithFrame:groupName:isCaptureOnly:](self, "_createMaterialViewWithFrame:groupName:isCaptureOnly:", 0, 0, v5, v7, v9, v11);
  v17 = (UIView *)objc_claimAutoreleasedReturnValue();
  materialView = self->_materialView;
  self->_materialView = v17;

  [(UIView *)self->_materialView bs_setHitTestingDisabled:1];
  [v3 addSubview:self->_materialView];
  objc_super v19 = (BSUIOrientationTransformWrapperView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F4F8D0]), "initWithFrame:", v5, v7, v9, v11);
  chromePlaceholderOrientationWrapperView = self->_chromePlaceholderOrientationWrapperView;
  self->_chromePlaceholderOrientationWrapperView = v19;

  [(BSUIOrientationTransformWrapperView *)self->_chromePlaceholderOrientationWrapperView setContainerOrientation:1];
  [v3 addSubview:self->_chromePlaceholderOrientationWrapperView];
  [(SBInteractiveScreenshotGestureRootViewController *)self addChildViewController:self->_chromePlaceholderViewController];
  [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController beginAppearanceTransition:1 animated:0];
  v77 = [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController view];
  objc_msgSend(v77, "sb_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  [(BSUIOrientationTransformWrapperView *)self->_chromePlaceholderOrientationWrapperView addContentView:v77];
  [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController endAppearanceTransition];
  [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController didMoveToParentViewController:self];
  if ([(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController _preferredStatusBarVisibility] == 2)
  {
    v21 = [(id)SBApp windowSceneManager];
    v22 = [(FBScene *)self->_sourceScene settings];
    v23 = [v22 displayConfiguration];
    v24 = [v23 identity];
    v25 = [v21 windowSceneForDisplayIdentity:v24];

    v26 = [v25 statusBarManager];
    v27 = [v26 reusePool];
    v28 = [(SBInteractiveScreenshotGestureRootViewController *)self description];
    objc_msgSend(v27, "getReusableStatusBarWithReason:withFrame:", v28, v5, v7, v9, v11);
    v29 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
    chromePlaceholderStatusBar = self->_chromePlaceholderStatusBar;
    self->_chromePlaceholderStatusBar = v29;

    uint64_t v31 = [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController preferredStatusBarStyle];
    v32 = (void *)[objc_alloc(MEMORY[0x1E4FA9970]) initWithResolvedStyle:_SBStatusBarStyleFromLegacyStyle(v31) foregroundColor:0];
    [(UIStatusBar *)self->_chromePlaceholderStatusBar setStyleRequest:v32 animationParameters:0];
    [(BSUIOrientationTransformWrapperView *)self->_chromePlaceholderOrientationWrapperView addContentView:self->_chromePlaceholderStatusBar];
  }
  v33 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v7, v9, v11);
  topContentContainerView = self->_topContentContainerView;
  self->_topContentContainerView = v33;

  [(UIView *)self->_topContentContainerView setClipsToBounds:1];
  v35 = [(UIView *)self->_topContentContainerView layer];
  uint64_t v36 = *MEMORY[0x1E4F39EA8];
  [v35 setCornerCurve:*MEMORY[0x1E4F39EA8]];

  [v3 addSubview:self->_topContentContainerView];
  v37 = [_SBInteractiveScreenshotGestureReplicatorView alloc];
  [(UIView *)self->_topContentContainerView bounds];
  v38 = -[_SBInteractiveScreenshotGestureReplicatorView initWithFrame:](v37, "initWithFrame:");
  replicatorView = self->_replicatorView;
  self->_replicatorView = v38;

  [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView bs_setHitTestingDisabled:1];
  v74 = [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView replicatorLayer];
  [v74 setInstanceCount:2];
  [(UIView *)self->_topContentContainerView addSubview:self->_replicatorView];
  v40 = [_SBInteractiveScreenshotGestureBackdropView alloc];
  [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView bounds];
  v41 = -[_SBInteractiveScreenshotGestureBackdropView initWithFrame:](v40, "initWithFrame:");
  contentBackdropView = self->_contentBackdropView;
  self->_contentBackdropView = v41;

  [(_SBInteractiveScreenshotGestureBackdropView *)self->_contentBackdropView bs_setHitTestingDisabled:1];
  v43 = [(_SBInteractiveScreenshotGestureBackdropView *)self->_contentBackdropView backdropLayer];
  [v43 setGroupName:v76];
  [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView addSubview:self->_contentBackdropView];
  -[SBInteractiveScreenshotGestureRootViewController _createFlashViewWithFrame:](self, "_createFlashViewWithFrame:", v5, v7, v9, v11);
  v44 = (SSFlashView *)objc_claimAutoreleasedReturnValue();
  flashView = self->_flashView;
  self->_flashView = v44;

  [(SSFlashView *)self->_flashView setHidden:1];
  v46 = [(SSFlashView *)self->_flashView layer];
  [v46 setCornerCurve:v36];

  [v3 addSubview:self->_flashView];
  v47 = -[SBInteractiveScreenshotGestureCropsView initWithFrame:]([SBInteractiveScreenshotGestureCropsView alloc], "initWithFrame:", v5, v7, v9, v11);
  cropsView = self->_cropsView;
  self->_cropsView = v47;

  [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView bs_setHitTestingDisabled:1];
  v49 = self->_cropsView;
  v50 = [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController cropsCornerColor];
  [(SBInteractiveScreenshotGestureCropsView *)v49 setCornerColor:v50];

  v51 = self->_cropsView;
  v52 = [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController cropsCornerColor];
  [(SBInteractiveScreenshotGestureCropsView *)v51 setLineColor:v52];

  [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setLineWidth:1.0];
  v53 = self->_cropsView;
  v54 = [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController cropsCornerColor];
  [(SBInteractiveScreenshotGestureCropsView *)v53 setLineGrabberColor:v54];

  v55 = self->_cropsView;
  [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController cropsCornerLineWidth];
  -[SBInteractiveScreenshotGestureCropsView setGrabberLineWidth:](v55, "setGrabberLineWidth:");
  v56 = self->_cropsView;
  [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController cropsCornerEdgeLength];
  -[SBInteractiveScreenshotGestureCropsView setCornerEdgeLength:](v56, "setCornerEdgeLength:");
  v57 = self->_cropsView;
  [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController cropsCornerEdgeLength];
  -[SBInteractiveScreenshotGestureCropsView setLineGrabberEdgeLength:](v57, "setLineGrabberEdgeLength:");
  [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setCornerAlpha:0.0];
  [v3 addSubview:self->_cropsView];
  v58 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  transformProgressAnimatableProperty = self->_transformProgressAnimatableProperty;
  self->_transformProgressAnimatableProperty = v58;

  [(UIViewFloatAnimatableProperty *)self->_transformProgressAnimatableProperty setValue:0.0];
  v60 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  translationXAnimatableProperty = self->_translationXAnimatableProperty;
  self->_translationXAnimatableProperty = v60;

  [(UIViewFloatAnimatableProperty *)self->_translationXAnimatableProperty setValue:0.0];
  v62 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  translationYAnimatableProperty = self->_translationYAnimatableProperty;
  self->_translationYAnimatableProperty = v62;

  [(UIViewFloatAnimatableProperty *)self->_translationYAnimatableProperty setValue:0.0];
  v64 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  cropsProgressSeparatedValuesAnimatableProperty = self->_cropsProgressSeparatedValuesAnimatableProperty;
  self->_cropsProgressSeparatedValuesAnimatableProperty = v64;

  [(UIViewFloatAnimatableProperty *)self->_cropsProgressSeparatedValuesAnimatableProperty setValue:0.0];
  v66 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  cropsProgressPresentationValueAnimatableProperty = self->_cropsProgressPresentationValueAnimatableProperty;
  self->_cropsProgressPresentationValueAnimatableProperty = v66;

  [(UIViewFloatAnimatableProperty *)self->_cropsProgressPresentationValueAnimatableProperty setValue:0.0];
  objc_initWeak(&location, self);
  v68 = (void *)MEMORY[0x1E4F42FF0];
  v69 = self->_transformProgressAnimatableProperty;
  v88[0] = self->_cropsProgressSeparatedValuesAnimatableProperty;
  v88[1] = v69;
  v70 = self->_translationYAnimatableProperty;
  v88[2] = self->_translationXAnimatableProperty;
  v88[3] = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:4];
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke;
  v83[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v84, &location);
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke_2;
  v81[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v82, &location);
  [v68 _createTransformerWithInputAnimatableProperties:v71 modelValueSetter:v83 presentationValueSetter:v81];

  v72 = (void *)MEMORY[0x1E4F42FF0];
  v87 = self->_cropsProgressPresentationValueAnimatableProperty;
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke_3;
  v79[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v80, &location);
  [v72 _createTransformerWithInputAnimatableProperties:v73 presentationValueChangedCallback:v79];

  objc_destroyWeak(&v80);
  objc_destroyWeak(&v82);
  objc_destroyWeak(&v84);
  objc_destroyWeak(&location);
}

void __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateContentTransformUsingPresentationValues:0];
}

void __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateContentTransformUsingPresentationValues:1];
}

void __63__SBInteractiveScreenshotGestureRootViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCropLinesMultiPartAnimationForCropsProgress];
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  if (self->_chromePlaceholderViewController == a3)
  {
    v14 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo");
    [(UIStatusBar *)self->_chromePlaceholderStatusBar currentHeight];
    v15 = objc_msgSend(v14, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:");

    int64_t v16 = [(BSUIOrientationTransformWrapperView *)self->_chromePlaceholderOrientationWrapperView contentOrientation];
    v17 = [(SBInteractiveScreenshotGestureRootViewController *)self traitCollection];
    objc_msgSend(v15, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", v16, v17);
    double v7 = v18;
    double v9 = v19;
    double v11 = v20;
    double v13 = v21;

    if (a4) {
      *a4 = 1;
    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBInteractiveScreenshotGestureRootViewController;
    -[SBInteractiveScreenshotGestureRootViewController _edgeInsetsForChildViewController:insetsAreAbsolute:](&v26, sel__edgeInsetsForChildViewController_insetsAreAbsolute_);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  double v22 = v7;
  double v23 = v9;
  double v24 = v11;
  double v25 = v13;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)invalidate
{
  self->_hasCrossedCommitThreshold = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBInteractiveScreenshotGestureRootViewController_invalidate__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  [(UIScenePresenter *)self->_sourceScenePresenter invalidate];
  sourceScenePresenter = self->_sourceScenePresenter;
  self->_sourceScenePresenter = 0;

  [(UIViewFloatAnimatableProperty *)self->_transformProgressAnimatableProperty invalidate];
  transformProgressAnimatableProperty = self->_transformProgressAnimatableProperty;
  self->_transformProgressAnimatableProperty = 0;

  [(UIViewFloatAnimatableProperty *)self->_translationXAnimatableProperty invalidate];
  translationXAnimatableProperty = self->_translationXAnimatableProperty;
  self->_translationXAnimatableProperty = 0;

  [(UIViewFloatAnimatableProperty *)self->_translationYAnimatableProperty invalidate];
  translationYAnimatableProperty = self->_translationYAnimatableProperty;
  self->_translationYAnimatableProperty = 0;

  [(UIViewFloatAnimatableProperty *)self->_cropsProgressSeparatedValuesAnimatableProperty invalidate];
  cropsProgressSeparatedValuesAnimatableProperty = self->_cropsProgressSeparatedValuesAnimatableProperty;
  self->_cropsProgressSeparatedValuesAnimatableProperty = 0;

  [(UIViewFloatAnimatableProperty *)self->_cropsProgressPresentationValueAnimatableProperty invalidate];
  cropsProgressPresentationValueAnimatableProperty = self->_cropsProgressPresentationValueAnimatableProperty;
  self->_cropsProgressPresentationValueAnimatableProperty = 0;

  [(UIViewFloatAnimatableProperty *)self->_cancellationCommitProgressAnimatableProperty invalidate];
  cancellationCommitProgressAnimatableProperty = self->_cancellationCommitProgressAnimatableProperty;
  self->_cancellationCommitProgressAnimatableProperty = 0;

  if (self->_chromePlaceholderStatusBar)
  {
    double v11 = [(UIViewController *)self _sbWindowScene];
    double v12 = [v11 statusBarManager];
    double v13 = [v12 reusePool];
    [v13 recycleStatusBar:self->_chromePlaceholderStatusBar];

    chromePlaceholderStatusBar = self->_chromePlaceholderStatusBar;
    self->_chromePlaceholderStatusBar = 0;
  }
}

uint64_t __62__SBInteractiveScreenshotGestureRootViewController_invalidate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1272) = 0;
  return result;
}

- (unsigned)flashViewLayerContextID
{
  objc_super v2 = [(SSFlashView *)self->_flashView layer];
  v3 = [v2 context];
  unsigned int v4 = [v3 contextId];

  return v4;
}

- (unint64_t)flashViewLayerRenderID
{
  objc_super v2 = [(SSFlashView *)self->_flashView layer];
  unint64_t RenderId = CALayerGetRenderId();

  return RenderId;
}

- (int64_t)gestureStyle
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SBInteractiveScreenshotGestureRootViewController_gestureStyle__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __64__SBInteractiveScreenshotGestureRootViewController_gestureStyle__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1256);
  return result;
}

- (void)setGestureStyle:(int64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SBInteractiveScreenshotGestureRootViewController_setGestureStyle___block_invoke;
  v4[3] = &unk_1E6AF4A70;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __68__SBInteractiveScreenshotGestureRootViewController_setGestureStyle___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 1256) = *(void *)(result + 40);
  return result;
}

- (void)cancelInteractionWithStyle:(int64_t)a3 settlingCompletionHandler:(id)a4
{
  id v6 = a4;
  double v7 = [(SBInteractiveScreenshotSettings *)self->_settings contentAnimationSettings];
  if (!a3)
  {
    uint64_t v8 = [(SBInteractiveScreenshotSettings *)self->_settings disabledGestureContentAnimationSettings];

    [(SBInteractiveScreenshotGestureRootViewController *)self _currentCommitProgressVelocity];
    double v10 = v9;
    [(SBInteractiveScreenshotSettings *)self->_settings disabledGestureVelocityScale];
    [(SBInteractiveScreenshotGestureRootViewController *)self _injectCommitProgressVelocity:v10 * v11];
    double v7 = (void *)v8;
  }
  uint64_t v15 = 0;
  int64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  accessQueue = self->_accessQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__SBInteractiveScreenshotGestureRootViewController_cancelInteractionWithStyle_settlingCompletionHandler___block_invoke;
  v14[3] = &unk_1E6AF4B88;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_sync(accessQueue, v14);
  if ([(SBInteractiveScreenshotGestureRootViewController *)self _isGestureStyleReducedMotion:v16[3]])
  {
    uint64_t v13 = 4;
  }
  else
  {
    uint64_t v13 = 3;
  }
  -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:contentAnimationSettings:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:contentAnimationSettings:commitProgress:additionalContentTranslation:completion:", v13, v7, v6, 0.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  _Block_object_dispose(&v15, 8);
}

uint64_t __105__SBInteractiveScreenshotGestureRootViewController_cancelInteractionWithStyle_settlingCompletionHandler___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1256);
  return result;
}

- (void)captureScreenshotWithInterfaceOrientation:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  [(SBInteractiveScreenshotGestureRootViewController *)self loadViewIfNeeded];
  sourceScenePresentationView = self->_sourceScenePresentationView;
  if (sourceScenePresentationView)
  {
    uint64_t v8 = [(UIScenePresentation *)sourceScenePresentationView layer];
    int v9 = [v8 hasBeenCommitted];

    if (v9)
    {
      ImageFromInterfaceOrientedView = (void *)SBInteractiveScreenshotCreateImageFromInterfaceOrientedView(self->_sourceScenePresentationView, a3);
      v6[2](v6, ImageFromInterfaceOrientedView);
    }
    else
    {
      double v11 = (void *)*MEMORY[0x1E4F43630];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __105__SBInteractiveScreenshotGestureRootViewController_captureScreenshotWithInterfaceOrientation_completion___block_invoke;
      v12[3] = &unk_1E6B02FD8;
      v12[4] = self;
      uint64_t v13 = v6;
      int64_t v14 = a3;
      objc_msgSend(v11, "sb_performBlockAfterCATransactionSynchronizedCommit:", v12);
    }
  }
  else
  {
    v6[2](v6, 0);
  }
}

void __105__SBInteractiveScreenshotGestureRootViewController_captureScreenshotWithInterfaceOrientation_completion___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  id ImageFromInterfaceOrientedView = (id)SBInteractiveScreenshotCreateImageFromInterfaceOrientedView(*(void **)(a1[4] + 1168), a1[6]);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, ImageFromInterfaceOrientedView);
}

- (void)commitInteractionWithScreenshotImage:(id)a3 screenshotInterfaceOrientation:(int64_t)a4 settlingCompletionHandler:(id)a5 flashCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  accessQueue = self->_accessQueue;
  uint64_t v54 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke;
  block[3] = &unk_1E6B03000;
  block[4] = self;
  void block[5] = &v55;
  block[6] = &v51;
  dispatch_sync(accessQueue, block);
  if (!*((unsigned char *)v56 + 24)) {
    [(SBInteractiveScreenshotGestureRootViewController *)self _prepareViewHierarchyForCommittedScreenshot:1 gestureStyle:v52[3]];
  }
  [(UIImageView *)self->_screenshotImageView setImage:v10];
  double queue_displayScale = self->_queue_displayScale;
  -[UIImageView sizeThatFits:](self->_screenshotImageView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  [(UIView *)self->_screenshotContainerView bounds];
  UIRectCenteredIntegralRectScale();
  [(UIImageView *)self->_screenshotImageView sb_setBoundsAndPositionFromFrame:*(void *)&queue_displayScale];
  switch(a4)
  {
    case 1:
      double v15 = 0.0;
      break;
    case 3:
      double v15 = 1.57079633;
      break;
    case 4:
      double v15 = -1.57079633;
      break;
    default:
      double v15 = 3.14159265;
      if (a4 != 2) {
        double v15 = 0.0;
      }
      break;
  }
  screenshotImageView = self->_screenshotImageView;
  CATransform3DMakeRotation(&v49, v15, 0.0, 0.0, 1.0);
  [(UIImageView *)screenshotImageView setTransform3D:&v49];
  if ([(SBInteractiveScreenshotGestureRootViewController *)self _isGestureStyleReducedMotion:v52[3]])
  {
    if (v12) {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    }
    uint64_t v17 = [MEMORY[0x1E4F39D18] animation];
    uint64_t v18 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [v17 setTimingFunction:v18];

    [v17 setType:*MEMORY[0x1E4F3A5B8]];
    [v17 setDuration:0.3];
    double v19 = objc_alloc_init(SBCAAnimationBlockDelegate);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_8;
    v36[3] = &unk_1E6B03078;
    id v37 = v11;
    [(SBCAAnimationBlockDelegate *)v19 setAnimationDidStopHandler:v36];
    [v17 setDelegate:v19];
    double v20 = [(SBInteractiveScreenshotGestureRootViewController *)self view];
    double v21 = [v20 layer];
    [v21 addAnimation:v17 forKey:@"crossFade"];

    [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setLineAlpha:1.0];
    [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setLineGrabberAlpha:1.0];
    -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:", 4, 0, 1.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  else
  {
    if ([(SBInteractiveScreenshotSettings *)self->_settings shouldInjectVelocity])
    {
      [(SBInteractiveScreenshotGestureRootViewController *)self _gestureCommitProgressUpdateVelocityOverTimeInterval:0.0416666667];
      double v23 = v22;
      [(SBInteractiveScreenshotSettings *)self->_settings maximumInjectedVelocity];
      if (v23 < v24) {
        double v24 = v23;
      }
      [(SBInteractiveScreenshotGestureRootViewController *)self _injectCommitProgressVelocity:v24];
    }
    double v25 = [SBInteractiveScreenshotGestureMultiPartAnimation alloc];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_2;
    v47[3] = &unk_1E6B03028;
    id v48 = v11;
    objc_super v26 = [(SBInteractiveScreenshotGestureMultiPartAnimation *)v25 initWithCompletionHandler:v47];
    [(SBInteractiveScreenshotGestureMultiPartAnimation *)v26 beginAnimationWithIdentifier:@"cropLinesMultiPartAnimation"];
    [(SBInteractiveScreenshotGestureMultiPartAnimation *)v26 beginAnimationWithIdentifier:@"mainUpdate"];
    objc_initWeak(&location, self);
    v27 = [SBInteractiveScreenshotGestureMultiPartAnimation alloc];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_3;
    v43[3] = &unk_1E6B03050;
    objc_copyWeak(&v45, &location);
    v28 = v26;
    v44 = v28;
    v29 = [(SBInteractiveScreenshotGestureMultiPartAnimation *)v27 initWithCompletionHandler:v43];
    [(SBInteractiveScreenshotGestureMultiPartAnimation *)v29 beginAnimationWithIdentifier:@"cropsProgressThreshold"];
    cropLinesAlphaMultiPartAnimations = self->_cropLinesAlphaMultiPartAnimations;
    if (!cropLinesAlphaMultiPartAnimations)
    {
      uint64_t v31 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      v32 = self->_cropLinesAlphaMultiPartAnimations;
      self->_cropLinesAlphaMultiPartAnimations = v31;

      cropLinesAlphaMultiPartAnimations = self->_cropLinesAlphaMultiPartAnimations;
    }
    [(NSMutableArray *)cropLinesAlphaMultiPartAnimations addObject:v29];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_6;
    v40[3] = &unk_1E6AFA190;
    v33 = v28;
    v41 = v33;
    v34 = v29;
    v42 = v34;
    -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:", 3, v40, 1.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [(SBInteractiveScreenshotGestureRootViewController *)self _updateCropLinesMultiPartAnimationForCropsProgress];
    flashView = self->_flashView;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_7;
    v38[3] = &unk_1E6AF5300;
    id v39 = v12;
    [(SSFlashView *)flashView flashWithCompletion:v38];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);

    uint64_t v17 = v48;
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
}

void *__169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(result[4] + 1272);
  *(unsigned char *)(result[4] + 1272) = 1;
  *(void *)(*(void *)(result[6] + 8) + 24) = *(void *)(result[4] + 1256);
  return result;
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  }
  return result;
}

void __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v9 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_4;
  }
  [WeakRetained[134] removeObject:v7];
  if (![v9[134] count])
  {
    id v10 = v9[134];
    v9[134] = 0;

    if (a4) {
      goto LABEL_4;
    }
LABEL_6:
    id v11 = (void *)MEMORY[0x1E4F42FF0];
    id v12 = [v9[144] cropLinesAlphaAnimationSettings];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E6AF4AC0;
    int64_t v16 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_5;
    v13[3] = &unk_1E6AFA1B8;
    id v14 = *(id *)(a1 + 32);
    objc_msgSend(v11, "sb_animateWithSettings:mode:animations:completion:", v12, 3, v15, v13);

    goto LABEL_7;
  }
  if ((a4 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_4:
  [*(id *)(a1 + 32) completeAnimationWithIdentifier:@"cropLinesMultiPartAnimation" finished:a3 retargeted:a4];
LABEL_7:
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1016) setLineAlpha:1.0];
  objc_super v2 = *(void **)(*(void *)(a1 + 32) + 1016);
  return [v2 setLineGrabberAlpha:1.0];
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeAnimationWithIdentifier:@"cropLinesMultiPartAnimation" finished:a2 retargeted:a3];
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) completeAnimationWithIdentifier:@"mainUpdate" finished:a2 retargeted:a3];
  id v6 = *(void **)(a1 + 40);
  return [v6 completeAnimationWithIdentifier:@"cropsProgressThreshold" finished:a2 retargeted:a3];
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __169__SBInteractiveScreenshotGestureRootViewController_commitInteractionWithScreenshotImage_screenshotInterfaceOrientation_settlingCompletionHandler_flashCompletionHandler___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a3, a3 ^ 1);
  }
  return result;
}

- (void)handlePanGestureRecognizerAction:(id)a3
{
  id v4 = a3;
  double v5 = [(SBInteractiveScreenshotGestureRootViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(SBInteractiveScreenshotGestureRootViewController *)self traitCollection];
  [v14 displayScale];
  uint64_t v16 = v15;
  if (BSFloatLessThanOrEqualToFloat())
  {
    uint64_t v17 = [MEMORY[0x1E4F42D90] mainScreen];
    [v17 scale];
    uint64_t v16 = v18;
  }
  uint64_t v19 = [v4 state];
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x2020000000;
  uint64_t v108 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke;
  block[3] = &unk_1E6AF4B88;
  block[4] = self;
  void block[5] = &v105;
  dispatch_sync(accessQueue, block);
  if (v19 == 1)
  {
    [(SBInteractiveScreenshotGestureRootViewController *)self _prepareViewHierarchyForCommittedScreenshot:0 gestureStyle:v106[3]];
    -[SBInteractiveScreenshotGestureCropsView sb_setBoundsAndPositionFromFrame:](self->_cropsView, "sb_setBoundsAndPositionFromFrame:", v7, v9, v11, v13);
  }
  uint64_t v100 = 0;
  v101 = &v100;
  uint64_t v102 = 0x2020000000;
  uint64_t v103 = 0;
  [v4 locationInView:v5];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  if (v19 == 1)
  {
    uint64_t v25 = [v4 _touchInterfaceOrientation];
    objc_super v26 = v101;
    v101[3] = v25;
    self->_gesturePortraitAnchorPoint.x = v22;
    self->_gesturePortraitAnchorPoint.y = v24;
    [(UIStatusBar *)self->_chromePlaceholderStatusBar setOrientation:v26[3]];
    [(BSUIOrientationTransformWrapperView *)self->_chromePlaceholderOrientationWrapperView setContentOrientation:v101[3]];
    [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController _updateContentOverlayInsetsFromParentIfNecessary];
    [v14 displayCornerRadius];
    uint64_t v93 = v27;
    uint64_t v91 = v16;
    [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController screenshotContentFrame];
    uint64_t v89 = v29;
    uint64_t v90 = v28;
    uint64_t v87 = v31;
    uint64_t v88 = v30;
    [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController cropsCornerLineWidth];
    uint64_t v33 = v32;
    [(SSChromePlaceholderViewController *)self->_chromePlaceholderViewController cropsCornerContentPadding];
    v34 = self->_accessQueue;
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke_2;
    v99[3] = &unk_1E6B030A0;
    *(double *)&v99[6] = v7;
    *(double *)&v99[7] = v9;
    *(double *)&v99[8] = v11;
    *(double *)&v99[9] = v13;
    v99[10] = v90;
    v99[11] = v89;
    v99[12] = v88;
    v99[13] = v87;
    v99[14] = v91;
    v99[15] = v93;
    v99[16] = v33;
    v99[17] = v35;
    v99[4] = self;
    v99[5] = &v100;
    dispatch_sync(v34, v99);
    -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:", 1, 0, 0.0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  else
  {
    uint64_t v36 = self->_accessQueue;
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke_3;
    v98[3] = &unk_1E6AF4B88;
    v98[4] = self;
    v98[5] = &v100;
    dispatch_sync(v36, v98);
  }
  _UIWindowConvertPointFromOrientationToOrientation();
  double v38 = v37;
  double v40 = v39;
  _UIWindowConvertRectFromOrientationToOrientation();
  double v94 = v41;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  uint64_t v48 = [v4 edges];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  _UIWindowConvertPointFromOrientationToOrientation();
  if (v19 == 4)
  {
    uint64_t v59 = 0;
LABEL_18:
    [WeakRetained interactiveScreenshotGestureRootViewController:self gestureDidCompleteWithIntent:v59];
    goto LABEL_53;
  }
  double v52 = v50;
  double v53 = v51;
  if (v19 == 3)
  {
    if ([(SBInteractiveScreenshotGestureRootViewController *)self _isGestureStyleDisabled:v106[3]])
    {
      uint64_t v59 = 1;
      goto LABEL_18;
    }
    [v4 velocityInView:v5];
    double v62 = v60;
    uint64_t v63 = v101[3];
    double v92 = v47;
    if (v63 == 4)
    {
      double v64 = v60;
      double v62 = -v61;
    }
    else if (v63 == 3)
    {
      double v64 = -v60;
      double v62 = v61;
    }
    else
    {
      double v64 = v61;
      if (v63 == 2)
      {
        double v62 = -v60;
        double v64 = -v61;
      }
    }
    [(SBInteractiveScreenshotSettings *)self->_settings projectionDecelerationRate];
    double v79 = v38 + v62 / 1000.0 * v78 / (1.0 - v78);
    double v80 = v40 + v64 / 1000.0 * v78 / (1.0 - v78);
    if (v48 == 12)
    {
      double v82 = v79 - v52;
      double v83 = v80 - v53;
      BOOL v86 = v82 < 0.00000011920929 && v83 < 0.00000011920929;
      double v81 = v92;
      if (!v86) {
        goto LABEL_43;
      }
    }
    else
    {
      double v81 = v92;
      if (v48 != 6
        || ((double v82 = v79 - v52, v83 = v80 - v53, v82 > 0.00000011920929) ? (v84 = v83 < 0.00000011920929) : (v84 = 0), !v84))
      {
LABEL_43:
        uint64_t v85 = 1;
LABEL_52:
        [WeakRetained interactiveScreenshotGestureRootViewController:self gestureDidCompleteWithIntent:v85];
        goto LABEL_53;
      }
    }
    double v97 = 0.0;
    -[SBInteractiveScreenshotGestureRootViewController _getDistanceTraveled:fullDistance:commitProgress:forTranslationFromCorner:bounds:](self, "_getDistanceTraveled:fullDistance:commitProgress:forTranslationFromCorner:bounds:", 0, 0, &v97, fabs(v82), fabs(v83), v43, v45, v81, v94);
    if (BSFloatGreaterThanOrEqualToFloat()) {
      uint64_t v85 = 2;
    }
    else {
      uint64_t v85 = 1;
    }
    goto LABEL_52;
  }
  if (v19 == 2)
  {
    double v54 = vabdd_f64(v38, v50);
    uint64_t v96 = 0;
    double v97 = 0.0;
    double v55 = vabdd_f64(v40, v51);
    double v95 = 0.0;
    -[SBInteractiveScreenshotGestureRootViewController _getDistanceTraveled:fullDistance:commitProgress:forTranslationFromCorner:bounds:](self, "_getDistanceTraveled:fullDistance:commitProgress:forTranslationFromCorner:bounds:", &v97, &v96, &v95, v54, v55, v43, v45, v47, v94);
    [(SBInteractiveScreenshotGestureRootViewController *)self _addGestureUpdateWithCommitProgress:v95 timestamp:CACurrentMediaTime()];
    [(SBInteractiveScreenshotSettings *)self->_settings baseCornerTranslationDegrees];
    BSDegreesToRadians();
    __double2 v57 = __sincos_stret(v56);
    double v58 = v97;
    if ([(SBInteractiveScreenshotGestureRootViewController *)self _isGestureStyleReducedMotion:v106[3]])
    {
      if (![(SBInteractiveScreenshotGestureRootViewController *)self _isGestureStyleDisabled:v106[3]]&& BSFloatGreaterThanOrEqualToFloat())
      {
        [WeakRetained interactiveScreenshotGestureRootViewController:self gestureDidCompleteWithIntent:2];
      }
    }
    else
    {
      BSUIConstrainValueWithRubberBand();
      double v66 = v65;
      [(SBInteractiveScreenshotSettings *)self->_settings horizontalTranslationFactor];
      double v68 = v67;
      [(SBInteractiveScreenshotSettings *)self->_settings verticalTranslationFactor];
      double v69 = (v57.__cosval * v58 - v54) * (1.0 - v66) * v68;
      double v71 = (v57.__sinval * v58 - v55) * (1.0 - v66) * v70;
      uint64_t v72 = v101[3];
      double v73 = -v69;
      double v74 = -v71;
      if (v72 == 2) {
        double v75 = -v71;
      }
      else {
        double v75 = v71;
      }
      if (v72 == 2) {
        double v76 = -v69;
      }
      else {
        double v76 = (v57.__cosval * v58 - v54) * (1.0 - v66) * v68;
      }
      if (v72 != 3)
      {
        double v69 = v75;
        double v74 = v76;
      }
      if (v72 == 4)
      {
        double v77 = v71;
      }
      else
      {
        double v73 = v69;
        double v77 = v74;
      }
      -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:commitProgress:additionalContentTranslation:completion:", 5, 0, v95, v77, v73, v74);
    }
  }
LABEL_53:

  _Block_object_dispose(&v100, 8);
  _Block_object_dispose(&v105, 8);
}

uint64_t __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1256);
  return result;
}

double __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (_OWORD *)(*(void *)(a1 + 32) + 1280);
  long long v2 = *(_OWORD *)(a1 + 64);
  *uint64_t v1 = *(_OWORD *)(a1 + 48);
  v1[1] = v2;
  int64_t v3 = (_OWORD *)(*(void *)(a1 + 32) + 1312);
  long long v4 = *(_OWORD *)(a1 + 96);
  _OWORD *v3 = *(_OWORD *)(a1 + 80);
  v3[1] = v4;
  *(void *)(*(void *)(a1 + 32) + 1248) = *(void *)(a1 + 112);
  *(void *)(*(void *)(a1 + 32) + 1240) = *(void *)(a1 + 120);
  *(void *)(*(void *)(a1 + 32) + 1232) = *(void *)(a1 + 128);
  double result = *(double *)(a1 + 136);
  *(double *)(*(void *)(a1 + 32) + 1224) = result;
  *(void *)(*(void *)(a1 + 32) + 1264) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __85__SBInteractiveScreenshotGestureRootViewController_handlePanGestureRecognizerAction___block_invoke_3(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1264);
  return result;
}

- (void)removePlaceholderChrome
{
  [(_SBInteractiveScreenshotGestureBackdropView *)self->_contentCapturingView setHidden:1];
  [(_SBInteractiveScreenshotGestureBackdropView *)self->_contentBackdropView setHidden:1];
  [(UIView *)self->_topContentContainerView setHidden:1];
  [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setHidden:1];
  [(UIView *)self->_materialView setHidden:1];
  [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView setHidden:1];
  [(UIScenePresentation *)self->_sourceScenePresentationView setHidden:1];
  [(UIView *)self->_screenshotContainerView setHidden:1];
  chromePlaceholderOrientationWrapperView = self->_chromePlaceholderOrientationWrapperView;
  [(BSUIOrientationTransformWrapperView *)chromePlaceholderOrientationWrapperView setHidden:1];
}

- (CATransform3D)_anchoredTransformForAnchorPoint:(SEL)a3 bounds:(CGPoint)a4 center:(CGRect)a5 transform:(CGPoint)a6
{
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  long long v8 = *(_OWORD *)&a7->m33;
  *(_OWORD *)&v17.m31 = *(_OWORD *)&a7->m31;
  *(_OWORD *)&v17.m33 = v8;
  long long v9 = *(_OWORD *)&a7->m43;
  *(_OWORD *)&v17.m41 = *(_OWORD *)&a7->m41;
  *(_OWORD *)&v17.m43 = v9;
  long long v10 = *(_OWORD *)&a7->m13;
  *(_OWORD *)&v17.m11 = *(_OWORD *)&a7->m11;
  *(_OWORD *)&v17.m13 = v10;
  long long v11 = *(_OWORD *)&a7->m23;
  *(_OWORD *)&v17.m21 = *(_OWORD *)&a7->m21;
  *(_OWORD *)&v17.m23 = v11;
  CATransform3DTranslate(retstr, &v17, -(a4.x * a5.size.width), -(a4.y * a5.size.height), 0.0);
  double result = (CATransform3D *)CATransform3DTranslateRight();
  long long v13 = *(_OWORD *)&v17.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v17.m31;
  *(_OWORD *)&retstr->m33 = v13;
  long long v14 = *(_OWORD *)&v17.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v17.m41;
  *(_OWORD *)&retstr->m43 = v14;
  long long v15 = *(_OWORD *)&v17.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v17.m11;
  *(_OWORD *)&retstr->m13 = v15;
  long long v16 = *(_OWORD *)&v17.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v17.m21;
  *(_OWORD *)&retstr->m23 = v16;
  return result;
}

- (void)_cancellationCommitProgressAnimatablePropertyPresentationValueDidChange
{
  [(UIViewFloatAnimatableProperty *)self->_cancellationCommitProgressAnimatableProperty presentationValue];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4010000000;
  v11[3] = &unk_1D90ED3C6;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v12 = *MEMORY[0x1E4F1DB28];
  long long v13 = v3;
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x2020000000;
  accessQueue = self->_accessQueue;
  uint64_t v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__SBInteractiveScreenshotGestureRootViewController__cancellationCommitProgressAnimatablePropertyPresentationValueDidChange__block_invoke;
  block[3] = &unk_1E6B03000;
  block[4] = self;
  void block[5] = &v7;
  void block[6] = v11;
  dispatch_sync(accessQueue, block);
  if ([(SBInteractiveScreenshotGestureRootViewController *)self _isGestureStyleDisabled:v8[3]])
  {
    [(SBInteractiveScreenshotSettings *)self->_settings normalizedDistanceForCommitThreshold];
    [(SBInteractiveScreenshotSettings *)self->_settings disabledGestureCancellationDistance];
    if (BSFloatGreaterThanOrEqualToFloat())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained interactiveScreenshotGestureRootViewControllerRequestsGestureRecognizerCancellation:self];
    }
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);
}

__n128 __123__SBInteractiveScreenshotGestureRootViewController__cancellationCommitProgressAnimatablePropertyPresentationValueDidChange__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 1256);
  uint64_t v1 = *(void *)(a1[6] + 8);
  __n128 result = *(__n128 *)(a1[4] + 1296);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(a1[4] + 1280);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

- (CATransform3D)_contentTransformForCommitProgress:(SEL)a3 contentInsets:(double)a4 additionalContentTranslation:(UIEdgeInsets)a5
{
  double y = a6.y;
  double x = a6.x;
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  long long v15 = *MEMORY[0x1E4F1DAD8];
  __asm { FMOV            V0.2D, #1.0 }
  long long v32 = _Q0;
  long long v33 = v15;
  -[SBInteractiveScreenshotGestureRootViewController _getContentTranslation:scale:forCommitProgress:contentInsets:additionalContentTranslation:](self, "_getContentTranslation:scale:forCommitProgress:contentInsets:additionalContentTranslation:", &v33, &v32, a4, top, left, bottom, right, x, y);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3DMakeTranslation(retstr, *(CGFloat *)&v33, *((CGFloat *)&v33 + 1), 0.0);
  long long v21 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v30.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v30.m33 = v21;
  long long v22 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v30.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v30.m43 = v22;
  long long v23 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v30.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v30.m13 = v23;
  long long v24 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v30.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v30.m23 = v24;
  __n128 result = CATransform3DScale(&v31, &v30, *(CGFloat *)&v32, *((CGFloat *)&v32 + 1), 1.0);
  long long v26 = *(_OWORD *)&v31.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v31.m31;
  *(_OWORD *)&retstr->m33 = v26;
  long long v27 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v31.m41;
  *(_OWORD *)&retstr->m43 = v27;
  long long v28 = *(_OWORD *)&v31.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v31.m11;
  *(_OWORD *)&retstr->m13 = v28;
  long long v29 = *(_OWORD *)&v31.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v31.m21;
  *(_OWORD *)&retstr->m23 = v29;
  return result;
}

- (CATransform3D)_inverseContentTransformForCommitProgress:(SEL)a3 contentInsets:(double)a4 additionalContentTranslation:(UIEdgeInsets)a5
{
  double y = a6.y;
  double x = a6.x;
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  long long v15 = *MEMORY[0x1E4F1DAD8];
  __asm { FMOV            V0.2D, #1.0 }
  long long v32 = _Q0;
  long long v33 = v15;
  -[SBInteractiveScreenshotGestureRootViewController _getContentTranslation:scale:forCommitProgress:contentInsets:additionalContentTranslation:](self, "_getContentTranslation:scale:forCommitProgress:contentInsets:additionalContentTranslation:", &v33, &v32, a4, top, left, bottom, right, x, y);
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CATransform3DMakeScale(retstr, 1.0 / *(double *)&v32, 1.0 / *((double *)&v32 + 1), 0.0);
  long long v21 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v30.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v30.m33 = v21;
  long long v22 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v30.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v30.m43 = v22;
  long long v23 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v30.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v30.m13 = v23;
  long long v24 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v30.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v30.m23 = v24;
  __n128 result = CATransform3DTranslate(&v31, &v30, -*(double *)&v33, -*((double *)&v33 + 1), 1.0);
  long long v26 = *(_OWORD *)&v31.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v31.m31;
  *(_OWORD *)&retstr->m33 = v26;
  long long v27 = *(_OWORD *)&v31.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v31.m41;
  *(_OWORD *)&retstr->m43 = v27;
  long long v28 = *(_OWORD *)&v31.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v31.m11;
  *(_OWORD *)&retstr->m13 = v28;
  long long v29 = *(_OWORD *)&v31.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v31.m21;
  *(_OWORD *)&retstr->m23 = v29;
  return result;
}

- (id)_createFlashViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  long long v8 = [MEMORY[0x1E4F99DC8] flashViewForStyle:v7];
  objc_msgSend(v8, "bs_setHitTestingDisabled:", 1);
  [v8 setClipsToBounds:1];
  objc_msgSend(v8, "setFrame:", x, y, width, height);
  return v8;
}

- (id)_createMaterialViewWithFrame:(CGRect)a3 groupName:(id)a4 isCaptureOnly:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  chromePlaceholderViewController = self->_chromePlaceholderViewController;
  id v11 = a4;
  if ([(SSChromePlaceholderViewController *)chromePlaceholderViewController backgroundBlurEffectStyle] == 2)
  {
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F430A8]) initWithPrivateStyle:2030];
    [v12 setGroupName:v11];

    if (v5)
    {
      uint64_t v13 = objc_opt_class();
      long long v14 = [v12 effectView];
      long long v15 = [v14 layer];
      long long v16 = SBSafeCast(v13, v15);

      [v16 setCaptureOnly:1];
    }
  }
  else
  {
    CATransform3D v17 = (void *)MEMORY[0x1E4F743C8];
    uint64_t v18 = _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle();
    long long v12 = [v17 materialViewWithRecipeNamed:v18];

    [v12 setGroupName:v11];
    if (v5) {
      [v12 setCaptureOnly:1];
    }
  }
  objc_msgSend(v12, "setFrame:", x, y, width, height);
  return v12;
}

- (id)_createScreenshotImageViewWithFrame:(CGRect)a3
{
  long long v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v3 setContentMode:4];
  long long v4 = [v3 layer];
  [v4 setMinificationFilter:*MEMORY[0x1E4F3A340]];

  return v3;
}

- (double)_currentCommitProgressVelocity
{
  [(UIViewFloatAnimatableProperty *)self->_transformProgressAnimatableProperty velocity];
  return result;
}

- (void)_addGestureUpdateWithCommitProgress:(double)a3 timestamp:(double)a4
{
  gestureCommitProgressUpdates = self->_gestureCommitProgressUpdates;
  if (gestureCommitProgressUpdates)
  {
    if ([(NSMutableArray *)gestureCommitProgressUpdates count] == 32) {
      [(NSMutableArray *)self->_gestureCommitProgressUpdates removeObjectAtIndex:[(NSMutableArray *)self->_gestureCommitProgressUpdates count] - 1];
    }
  }
  else
  {
    long long v8 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
    uint64_t v9 = self->_gestureCommitProgressUpdates;
    self->_gestureCommitProgressUpdates = v8;
  }
  gestureCommitProgressUpdateTimestamps = self->_gestureCommitProgressUpdateTimestamps;
  if (gestureCommitProgressUpdateTimestamps)
  {
    if ([(NSMutableArray *)gestureCommitProgressUpdateTimestamps count] == 32) {
      [(NSMutableArray *)self->_gestureCommitProgressUpdateTimestamps removeObjectAtIndex:[(NSMutableArray *)self->_gestureCommitProgressUpdateTimestamps count] - 1];
    }
  }
  else
  {
    id v11 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
    long long v12 = self->_gestureCommitProgressUpdateTimestamps;
    self->_gestureCommitProgressUpdateTimestamps = v11;
  }
  uint64_t v13 = self->_gestureCommitProgressUpdates;
  long long v14 = [NSNumber numberWithDouble:a3];
  [(NSMutableArray *)v13 insertObject:v14 atIndex:0];

  long long v15 = self->_gestureCommitProgressUpdateTimestamps;
  id v16 = [NSNumber numberWithDouble:a4];
  [(NSMutableArray *)v15 insertObject:v16 atIndex:0];
}

- (double)_gestureCommitProgressUpdateVelocityOverTimeInterval:(double)a3
{
  if (![(NSMutableArray *)self->_gestureCommitProgressUpdates count]) {
    return 0.0;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  double v7 = 0.0;
  double v8 = 0.0;
  do
  {
    if (v6 >= [(NSMutableArray *)self->_gestureCommitProgressUpdates count] - 1) {
      break;
    }
    uint64_t v9 = [(NSMutableArray *)self->_gestureCommitProgressUpdates objectAtIndex:v6];
    [v9 doubleValue];
    double v11 = v10;

    long long v12 = [(NSMutableArray *)self->_gestureCommitProgressUpdateTimestamps objectAtIndex:v6];
    [v12 doubleValue];
    double v14 = v13;

    if (!v6) {
      double v8 = v14;
    }
    long long v15 = [(NSMutableArray *)self->_gestureCommitProgressUpdates objectAtIndex:++v6];
    [v15 doubleValue];
    double v17 = v16;

    uint64_t v18 = [(NSMutableArray *)self->_gestureCommitProgressUpdateTimestamps objectAtIndex:v6];
    [v18 doubleValue];
    double v20 = v19;

    if (v14 - v20 > 0.00000011920929)
    {
      double v7 = v7 + (v11 - v17) / (v14 - v20);
      ++v5;
    }
  }
  while (v8 - v20 <= a3);
  if (v5) {
    return v7 / (double)v5;
  }
  else {
    return 0.0;
  }
}

- (void)_getContentTranslation:(CGPoint *)a3 scale:(CGPoint *)a4 forCommitProgress:(double)a5 contentInsets:(UIEdgeInsets)a6 additionalContentTranslation:(CGPoint)a7
{
  double right = a6.right;
  double bottom = a6.bottom;
  double left = a6.left;
  double top = a6.top;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  double width = self->_queue_portraitBounds.size.width;
  double height = self->_queue_portraitBounds.size.height;
  _UIWindowConvertRectFromOrientationToOrientation();
  double v18 = v17 - (left + right);
  double v20 = v19 - (top + bottom);
  UIRectGetCenter();
  double v22 = v21;
  double v24 = v23;
  UIRectGetCenter();
  if (a3)
  {
    a3->double x = a7.x + (v22 - v25) * a5 + 0.0;
    a3->double y = a7.y + (v24 - v26) * a5 + 0.0;
  }
  if (a4)
  {
    a4->double x = (v18 / width + -1.0) * a5 + 1.0;
    a4->double y = (v20 / height + -1.0) * a5 + 1.0;
  }
}

- (void)_getDistanceTraveled:(double *)a3 fullDistance:(double *)a4 commitProgress:(double *)a5 forTranslationFromCorner:(CGPoint)a6 bounds:(CGRect)a7
{
  double v11 = sqrt(a6.y * a6.y + a6.x * a6.x);
  double v12 = sqrt(a7.size.height * a7.size.height + a7.size.width * a7.size.width);
  [(SBInteractiveScreenshotSettings *)self->_settings normalizedDistanceForCommitThreshold];
  [(SBInteractiveScreenshotSettings *)self->_settings rubberbandingRange];
  BSUIConstrainValueToIntervalWithRubberBand();
  if (a3) {
    *a3 = v11;
  }
  if (a4) {
    *a4 = v12;
  }
  if (a5) {
    *(void *)a5 = v13;
  }
}

- (void)_prepareViewHierarchyForCommittedScreenshot:(BOOL)a3 gestureStyle:(int64_t)a4
{
  BOOL v5 = a3;
  v45[1] = *MEMORY[0x1E4F143B8];
  double v7 = [(SBInteractiveScreenshotGestureRootViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  BOOL v16 = [(SBInteractiveScreenshotGestureRootViewController *)self _isGestureStyleDisabled:a4];
  cancellationCommitProgressAnimatablePropertdouble y = self->_cancellationCommitProgressAnimatableProperty;
  if (v16)
  {
    if (!cancellationCommitProgressAnimatableProperty)
    {
      double v18 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
      double v19 = self->_cancellationCommitProgressAnimatableProperty;
      self->_cancellationCommitProgressAnimatablePropertdouble y = v18;

      [(UIViewFloatAnimatableProperty *)self->_cancellationCommitProgressAnimatableProperty setValue:0.0];
      objc_initWeak(&location, self);
      double v20 = (void *)MEMORY[0x1E4F42FF0];
      v45[0] = self->_cancellationCommitProgressAnimatableProperty;
      double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      double v41 = __109__SBInteractiveScreenshotGestureRootViewController__prepareViewHierarchyForCommittedScreenshot_gestureStyle___block_invoke;
      double v42 = &unk_1E6AF4B10;
      objc_copyWeak(&v43, &location);
      [v20 _createTransformerWithInputAnimatableProperties:v21 presentationValueChangedCallback:&v39];

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(UIViewFloatAnimatableProperty *)cancellationCommitProgressAnimatableProperty invalidate];
    double v22 = self->_cancellationCommitProgressAnimatableProperty;
    self->_cancellationCommitProgressAnimatablePropertdouble y = 0;
  }
  if (v5)
  {
    [(UIScenePresentation *)self->_sourceScenePresentationView removeFromSuperview];
    sourceScenePresentationView = self->_sourceScenePresentationView;
    self->_sourceScenePresentationView = 0;

    [(UIScenePresenter *)self->_sourceScenePresenter invalidate];
    sourceScenePresenter = self->_sourceScenePresenter;
    self->_sourceScenePresenter = 0;

    screenshotContainerView = self->_screenshotContainerView;
    if (screenshotContainerView)
    {
      -[UIView sb_setBoundsAndPositionFromFrame:](screenshotContainerView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
    }
    else
    {
      long long v33 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v11, v13, v15);
      v34 = self->_screenshotContainerView;
      self->_screenshotContainerView = v33;

      [(UIView *)self->_screenshotContainerView bounds];
      -[SBInteractiveScreenshotGestureRootViewController _createScreenshotImageViewWithFrame:](self, "_createScreenshotImageViewWithFrame:");
      uint64_t v35 = (UIImageView *)objc_claimAutoreleasedReturnValue();
      screenshotImageView = self->_screenshotImageView;
      self->_screenshotImageView = v35;

      [(UIView *)self->_screenshotContainerView addSubview:self->_screenshotImageView];
      [v7 insertSubview:self->_screenshotContainerView atIndex:0];
    }
    -[UIView setHidden:](self->_screenshotContainerView, "setHidden:", 0, v39, v40, v41, v42);
    p_flashView = &self->_flashView;
    -[SSFlashView sb_setBoundsAndPositionFromFrame:](self->_flashView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  }
  else
  {
    if (!self->_sourceScenePresenter)
    {
      double v26 = [(FBScene *)self->_sourceScene uiPresentationManager];
      long long v27 = [v26 createPresenterWithIdentifier:@"SBInteractiveScreenshotGestureRootViewController" priority:5000];
      long long v28 = self->_sourceScenePresenter;
      self->_sourceScenePresenter = v27;

      [(UIScenePresenter *)self->_sourceScenePresenter activate];
    }
    long long v29 = self->_sourceScenePresentationView;
    if (!v29)
    {
      CATransform3D v30 = [(UIScenePresenter *)self->_sourceScenePresenter presentationView];
      CATransform3D v31 = self->_sourceScenePresentationView;
      self->_sourceScenePresentationView = v30;

      long long v32 = self->_sourceScenePresentationView;
      if (v32)
      {
        [v7 insertSubview:v32 atIndex:0];
        long long v29 = self->_sourceScenePresentationView;
      }
      else
      {
        long long v29 = 0;
      }
    }
    -[UIScenePresentation bs_setHitTestingDisabled:](v29, "bs_setHitTestingDisabled:", -[SBInteractiveScreenshotGestureRootViewController _isGestureStyleDisabled:](self, "_isGestureStyleDisabled:", a4, v39, v40, v41, v42) ^ 1);
    -[UIScenePresentation sb_setBoundsAndPositionFromFrame:](self->_sourceScenePresentationView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
    [(UIScenePresentation *)self->_sourceScenePresentationView setHidden:0];
    [(UIView *)self->_screenshotContainerView setHidden:1];
    [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setLineGrabberAlpha:0.0];
    [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setLineAlpha:0.0];
    p_flashView = &self->_flashView;
  }
  [(SSFlashView *)*p_flashView setHidden:!v5];
  -[UIView sb_setBoundsAndPositionFromFrame:](self->_materialView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  [(UIView *)self->_materialView setHidden:0];
  -[_SBInteractiveScreenshotGestureBackdropView sb_setBoundsAndPositionFromFrame:](self->_contentCapturingView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  [(_SBInteractiveScreenshotGestureBackdropView *)self->_contentCapturingView setHidden:0];
  -[BSUIOrientationTransformWrapperView sb_setBoundsAndPositionFromFrame:](self->_chromePlaceholderOrientationWrapperView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  [(BSUIOrientationTransformWrapperView *)self->_chromePlaceholderOrientationWrapperView setHidden:[(SBInteractiveScreenshotGestureRootViewController *)self _isGestureStyleDisabled:a4]];
  -[_SBInteractiveScreenshotGestureReplicatorView sb_setBoundsAndPositionFromFrame:](self->_replicatorView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView setHidden:0];
  -[UIView sb_setBoundsAndPositionFromFrame:](self->_topContentContainerView, "sb_setBoundsAndPositionFromFrame:", v9, v11, v13, v15);
  [(UIView *)self->_topContentContainerView setHidden:0];
  contentBackdropView = self->_contentBackdropView;
  [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView bounds];
  -[_SBInteractiveScreenshotGestureBackdropView sb_setBoundsAndPositionFromFrame:](contentBackdropView, "sb_setBoundsAndPositionFromFrame:");
  [(_SBInteractiveScreenshotGestureBackdropView *)self->_contentBackdropView setHidden:0];
  [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setHidden:0];
}

void __109__SBInteractiveScreenshotGestureRootViewController__prepareViewHierarchyForCommittedScreenshot_gestureStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancellationCommitProgressAnimatablePropertyPresentationValueDidChange];
}

- (void)_updateContentTransformUsingPresentationValues:(BOOL)a3
{
  BOOL v3 = a3;
  transformProgressAnimatablePropertdouble y = self->_transformProgressAnimatableProperty;
  if (a3)
  {
    [(UIViewFloatAnimatableProperty *)transformProgressAnimatableProperty presentationValue];
    uint64_t v7 = v6;
    [(UIViewFloatAnimatableProperty *)self->_translationXAnimatableProperty presentationValue];
    double v9 = v8;
    [(UIViewFloatAnimatableProperty *)self->_translationYAnimatableProperty presentationValue];
    double v11 = v10;
    [(UIViewFloatAnimatableProperty *)self->_cropsProgressSeparatedValuesAnimatableProperty presentationValue];
  }
  else
  {
    [(UIViewFloatAnimatableProperty *)transformProgressAnimatableProperty value];
    uint64_t v7 = v13;
    [(UIViewFloatAnimatableProperty *)self->_translationXAnimatableProperty value];
    double v9 = v14;
    [(UIViewFloatAnimatableProperty *)self->_translationYAnimatableProperty value];
    double v11 = v15;
    [(UIViewFloatAnimatableProperty *)self->_cropsProgressSeparatedValuesAnimatableProperty value];
  }
  uint64_t v137 = 0;
  v138 = (float64x2_t *)&v137;
  uint64_t v139 = 0x4010000000;
  v140 = &unk_1D90ED3C6;
  BOOL v16 = (double *)MEMORY[0x1E4F1DB28];
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v141 = *MEMORY[0x1E4F1DB28];
  long long v142 = v17;
  uint64_t v133 = 0;
  v134 = (double *)&v133;
  uint64_t v135 = 0x2020000000;
  uint64_t v136 = 0;
  uint64_t v129 = 0;
  v130 = (double *)&v129;
  uint64_t v131 = 0x2020000000;
  uint64_t v132 = 0;
  uint64_t v117 = 0;
  v118 = &v117;
  uint64_t v119 = 0xA010000000;
  v120 = &unk_1D90ED3C6;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v125 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v126 = v18;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v127 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v128 = v19;
  long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v121 = *MEMORY[0x1E4F39B10];
  long long v122 = v20;
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v123 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v124 = v21;
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0xA010000000;
  uint64_t v108 = &unk_1D90ED3C6;
  long long v113 = v125;
  long long v114 = v18;
  long long v115 = v127;
  long long v116 = v19;
  long long v109 = v121;
  long long v110 = v20;
  long long v111 = v123;
  long long v112 = v21;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0xA010000000;
  v96[3] = &unk_1D90ED3C6;
  long long v101 = v125;
  long long v102 = v18;
  long long v103 = v127;
  long long v104 = v19;
  long long v97 = v121;
  long long v98 = v20;
  long long v99 = v123;
  long long v100 = v21;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__SBInteractiveScreenshotGestureRootViewController__updateContentTransformUsingPresentationValues___block_invoke;
  block[3] = &unk_1E6B030C8;
  block[4] = self;
  void block[5] = &v117;
  block[11] = v7;
  *(double *)&block[12] = v9;
  void block[6] = &v105;
  void block[7] = v96;
  *(double *)&block[13] = v11;
  *(double *)&block[14] = v12;
  *(double *)&block[15] = v9 * v12;
  *(double *)&block[16] = v11 * v12;
  block[8] = &v137;
  block[9] = &v129;
  block[10] = &v133;
  dispatch_sync(accessQueue, block);
  BSRectWithSize();
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  __asm { FMOV            V1.2D, #0.5 }
  float64x2_t v82 = vmlaq_f64(v138[2], _Q1, v138[3]);
  if (v3)
  {
    long long v36 = *((_OWORD *)v118 + 7);
    long long v91 = *((_OWORD *)v118 + 6);
    long long v92 = v36;
    long long v37 = *((_OWORD *)v118 + 9);
    long long v93 = *((_OWORD *)v118 + 8);
    long long v94 = v37;
    long long v38 = *((_OWORD *)v118 + 3);
    long long v87 = *((_OWORD *)v118 + 2);
    long long v88 = v38;
    long long v39 = *((_OWORD *)v118 + 5);
    long long v89 = *((_OWORD *)v118 + 4);
    long long v90 = v39;
    uint64_t v40 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v87];
    [(UIView *)self->_topContentContainerView _setPresentationValue:v40 forKey:@"transform"];
    [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView _setPresentationValue:v40 forKey:@"instanceTransform"];
    [(SSFlashView *)self->_flashView _setPresentationValue:v40 forKey:@"transform"];
    long long v41 = *((_OWORD *)v106 + 7);
    long long v91 = *((_OWORD *)v106 + 6);
    long long v92 = v41;
    long long v42 = *((_OWORD *)v106 + 9);
    long long v93 = *((_OWORD *)v106 + 8);
    long long v94 = v42;
    long long v43 = *((_OWORD *)v106 + 3);
    long long v87 = *((_OWORD *)v106 + 2);
    long long v88 = v43;
    long long v44 = *((_OWORD *)v106 + 5);
    long long v89 = *((_OWORD *)v106 + 4);
    long long v90 = v44;
    double v45 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v87];
    [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView _setPresentationValue:v45 forKey:@"transform"];
    cropsView = self->_cropsView;
    *(double *)BOOL v86 = v24;
    *(double *)&v86[1] = v26;
    *(double *)&v86[2] = v28;
    *(double *)&v86[3] = v30;
    double v47 = [MEMORY[0x1E4F29238] valueWithBytes:v86 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [(SBInteractiveScreenshotGestureCropsView *)cropsView _setPresentationValue:v47 forKey:@"bounds"];

    uint64_t v48 = self->_cropsView;
    float64x2_t v85 = v82;
    CATransform3D v49 = [MEMORY[0x1E4F29238] valueWithBytes:&v85 objCType:"{CGPoint=dd}"];
    [(SBInteractiveScreenshotGestureCropsView *)v48 _setPresentationValue:v49 forKey:@"position"];

    double v50 = self->_cropsView;
    double v51 = [NSNumber numberWithDouble:v130[3]];
    [(SBInteractiveScreenshotGestureCropsView *)v50 _setPresentationValue:v51 forKey:@"cornerAlpha"];

    flashView = self->_flashView;
    double v53 = [NSNumber numberWithDouble:v134[3]];
    [(SSFlashView *)flashView _setPresentationValue:v53 forKey:@"cornerRadius"];

    topContentContainerView = self->_topContentContainerView;
    double v55 = [NSNumber numberWithDouble:v134[3]];
    [(UIView *)topContentContainerView _setPresentationValue:v55 forKey:@"cornerRadius"];

    screenshotImageView = self->_screenshotImageView;
    __double2 v57 = [NSNumber numberWithDouble:v134[3]];
    [(UIImageView *)screenshotImageView _setPresentationValue:v57 forKey:@"cornerRadius"];
  }
  else
  {
    double v58 = self->_topContentContainerView;
    long long v59 = *((_OWORD *)v118 + 7);
    long long v91 = *((_OWORD *)v118 + 6);
    long long v92 = v59;
    long long v60 = *((_OWORD *)v118 + 9);
    long long v93 = *((_OWORD *)v118 + 8);
    long long v94 = v60;
    long long v61 = *((_OWORD *)v118 + 3);
    long long v87 = *((_OWORD *)v118 + 2);
    long long v88 = v61;
    long long v62 = *((_OWORD *)v118 + 5);
    long long v89 = *((_OWORD *)v118 + 4);
    long long v90 = v62;
    [(UIView *)v58 setTransform3D:&v87];
    uint64_t v63 = [(_SBInteractiveScreenshotGestureReplicatorView *)self->_replicatorView replicatorLayer];
    long long v64 = *((_OWORD *)v118 + 7);
    long long v91 = *((_OWORD *)v118 + 6);
    long long v92 = v64;
    long long v65 = *((_OWORD *)v118 + 9);
    long long v93 = *((_OWORD *)v118 + 8);
    long long v94 = v65;
    long long v66 = *((_OWORD *)v118 + 3);
    long long v87 = *((_OWORD *)v118 + 2);
    long long v88 = v66;
    long long v67 = *((_OWORD *)v118 + 5);
    long long v89 = *((_OWORD *)v118 + 4);
    long long v90 = v67;
    [v63 setInstanceTransform:&v87];

    double v68 = self->_flashView;
    long long v69 = *((_OWORD *)v118 + 7);
    long long v91 = *((_OWORD *)v118 + 6);
    long long v92 = v69;
    long long v70 = *((_OWORD *)v118 + 9);
    long long v93 = *((_OWORD *)v118 + 8);
    long long v94 = v70;
    long long v71 = *((_OWORD *)v118 + 3);
    long long v87 = *((_OWORD *)v118 + 2);
    long long v88 = v71;
    long long v72 = *((_OWORD *)v118 + 5);
    long long v89 = *((_OWORD *)v118 + 4);
    long long v90 = v72;
    [(SSFlashView *)v68 setTransform3D:&v87];
    replicatorView = self->_replicatorView;
    long long v74 = *((_OWORD *)v106 + 7);
    long long v91 = *((_OWORD *)v106 + 6);
    long long v92 = v74;
    long long v75 = *((_OWORD *)v106 + 9);
    long long v93 = *((_OWORD *)v106 + 8);
    long long v94 = v75;
    long long v76 = *((_OWORD *)v106 + 3);
    long long v87 = *((_OWORD *)v106 + 2);
    long long v88 = v76;
    long long v77 = *((_OWORD *)v106 + 5);
    long long v89 = *((_OWORD *)v106 + 4);
    long long v90 = v77;
    [(_SBInteractiveScreenshotGestureReplicatorView *)replicatorView setTransform3D:&v87];
    double v78 = [(SSFlashView *)self->_flashView layer];
    [v78 setCornerRadius:v134[3]];

    double v79 = [(UIView *)self->_topContentContainerView layer];
    [v79 setCornerRadius:v134[3]];

    double v80 = [(UIImageView *)self->_screenshotImageView layer];
    [v80 setCornerRadius:v134[3]];

    [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView bounds];
    if (BSRectEqualToRect()) {
      -[SBInteractiveScreenshotGestureCropsView setBounds:](self->_cropsView, "setBounds:", *v16, v16[1], v16[2], v16[3]);
    }
    -[SBInteractiveScreenshotGestureCropsView setBounds:](self->_cropsView, "setBounds:", v24, v26, v28, v30, *(_OWORD *)&v82);
    [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView center];
    if (BSPointEqualToPoint()) {
      -[SBInteractiveScreenshotGestureCropsView setCenter:](self->_cropsView, "setCenter:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    -[SBInteractiveScreenshotGestureCropsView setCenter:](self->_cropsView, "setCenter:", v83, v84);
    [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView cornerAlpha];
    if (BSFloatEqualToFloat())
    {
      double v81 = v130[3] + -0.1;
      if (v81 < -0.00000011920929) {
        double v81 = v81 + 1.0;
      }
      [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setCornerAlpha:v81];
    }
    [(SBInteractiveScreenshotGestureCropsView *)self->_cropsView setCornerAlpha:v130[3]];
  }
  _Block_object_dispose(v96, 8);
  _Block_object_dispose(&v105, 8);
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v137, 8);
}

double __99__SBInteractiveScreenshotGestureRootViewController__updateContentTransformUsingPresentationValues___block_invoke(uint64_t a1)
{
  long long v2 = *(double **)(a1 + 32);
  double v3 = v2[161];
  double v4 = v2[163];
  double v50 = v2[162];
  double v51 = v2[160];
  double v53 = v2[153];
  double v54 = v2[155];
  double v52 = v2[154];
  double v5 = *MEMORY[0x1E4F437F8];
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  objc_msgSend(v2, "_contentTransformForCommitProgress:contentInsets:additionalContentTranslation:", *(double *)(a1 + 88), *MEMORY[0x1E4F437F8], v6, v7, v8, *(double *)(a1 + 96), *(double *)(a1 + 104));
  double v9 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  long long v11 = v55[34];
  long long v10 = v55[35];
  long long v12 = v55[33];
  v9[2] = v55[32];
  v9[3] = v12;
  long long v14 = v55[38];
  long long v13 = v55[39];
  long long v15 = v55[37];
  v9[6] = v55[36];
  v9[7] = v15;
  v9[8] = v14;
  v9[9] = v13;
  v9[4] = v11;
  v9[5] = v10;
  BOOL v16 = *(void **)(a1 + 32);
  double v17 = *(double *)(a1 + 88);
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v16, "_inverseContentTransformForCommitProgress:contentInsets:additionalContentTranslation:", v17, v18, v19, v20, v21, *(double *)(a1 + 96), *(double *)(a1 + 104));
  double v22 = *(_OWORD **)(*(void *)(a1 + 48) + 8);
  long long v24 = v55[26];
  long long v23 = v55[27];
  long long v25 = v55[25];
  v22[2] = v55[24];
  v22[3] = v25;
  long long v27 = v55[30];
  long long v26 = v55[31];
  long long v28 = v55[29];
  v22[6] = v55[28];
  v22[7] = v28;
  v22[8] = v27;
  v22[9] = v26;
  v22[4] = v24;
  v22[5] = v23;
  objc_msgSend(*(id *)(a1 + 32), "_contentTransformForCommitProgress:contentInsets:additionalContentTranslation:", *(double *)(a1 + 112) * *(double *)(a1 + 88), v5, v6, v7, v8, *(double *)(a1 + 120), *(double *)(a1 + 128));
  double v29 = *(_OWORD **)(*(void *)(a1 + 56) + 8);
  long long v31 = v55[18];
  long long v30 = v55[19];
  long long v32 = v55[17];
  v29[2] = v55[16];
  v29[3] = v32;
  long long v34 = v55[22];
  long long v33 = v55[23];
  long long v35 = v55[21];
  v29[6] = v55[20];
  v29[7] = v35;
  v29[8] = v34;
  v29[9] = v33;
  v29[4] = v31;
  v29[5] = v30;
  long long v36 = *(void **)(a1 + 32);
  UIRectGetCenter();
  if (v36)
  {
    double v39 = v38;
    uint64_t v40 = *(_OWORD **)(*(void *)(a1 + 56) + 8);
    long long v41 = v40[7];
    v55[4] = v40[6];
    v55[5] = v41;
    long long v42 = v40[9];
    v55[6] = v40[8];
    v55[7] = v42;
    long long v43 = v40[3];
    v55[0] = v40[2];
    v55[1] = v43;
    long long v44 = v40[5];
    v55[2] = v40[4];
    v55[3] = v44;
    objc_msgSend(v36, "_anchoredTransformForAnchorPoint:bounds:center:transform:", v55, 0.5, 0.5, v51, v3, v50, v4, v37, v39);
  }
  else
  {
    memset(&v55[8], 0, 128);
  }
  CA_CGRectApplyTransform();
  *(CGRect *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = CGRectInset(v56, -(v53 + v52), -(v53 + v52));
  [*(id *)(*(void *)(a1 + 32) + 1152) cropCornersVisibleProgressThreshold];
  double v46 = *(double *)(a1 + 112);
  if (v45 >= v46) {
    double v46 = v45;
  }
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (fmin(v46, 1.0) - v45) / (1.0 - v45) + 0.0;
  [*(id *)(*(void *)(a1 + 32) + 1152) cornerRadiusVisibleProgressThreshold];
  double v48 = *(double *)(a1 + 112);
  if (v47 >= v48) {
    double v48 = v47;
  }
  double result = v54 + (0.0 - v54) * (fmin(v48, 1.0) - v47) / (1.0 - v47);
  *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = result;
  return result;
}

- (void)_injectCommitProgressVelocity:(double)a3
{
}

- (BOOL)_isGestureStyleDisabled:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (BOOL)_isGestureStyleReducedMotion:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_updateCropLinesMultiPartAnimationForCropsProgress
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(UIViewFloatAnimatableProperty *)self->_cropsProgressPresentationValueAnimatableProperty presentationValue];
  double v4 = v3;
  [(SBInteractiveScreenshotSettings *)self->_settings cropLinesVisibleProgressThreshold];
  if (v4 >= v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    double v6 = self->_cropLinesAlphaMultiPartAnimations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "completeAnimationWithIdentifier:finished:retargeted:", @"cropsProgressThreshold", 1, 0, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_updateWithUpdateMode:(int64_t)a3 commitProgress:(double)a4 additionalContentTranslation:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  settings = self->_settings;
  id v12 = a6;
  id v13 = [(SBInteractiveScreenshotSettings *)settings contentAnimationSettings];
  -[SBInteractiveScreenshotGestureRootViewController _updateWithUpdateMode:contentAnimationSettings:commitProgress:additionalContentTranslation:completion:](self, "_updateWithUpdateMode:contentAnimationSettings:commitProgress:additionalContentTranslation:completion:", a3, v13, v12, a4, x, y);
}

- (void)_updateWithUpdateMode:(int64_t)a3 contentAnimationSettings:(id)a4 commitProgress:(double)a5 additionalContentTranslation:(CGPoint)a6 completion:(id)a7
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v13 = a4;
  id v14 = a7;
  int v15 = BSFloatGreaterThanOrEqualToFloat();
  BOOL v16 = v15;
  if (v15)
  {
    if (!self->_hasCrossedCommitThreshold && !self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty)
    {
      double v17 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
      cropsTrackingDiscreteAnimationProgressAnimatablePropertCGFloat y = self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty;
      self->_cropsTrackingDiscreteAnimationProgressAnimatablePropertCGFloat y = v17;

      [(UIViewFloatAnimatableProperty *)self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty setValue:0.0];
      objc_initWeak(location, self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty);
      objc_initWeak(&from, self);
      long long v23 = (void *)MEMORY[0x1E4F42FF0];
      double v19 = [(SBInteractiveScreenshotSettings *)self->_settings cropsAnimationSettings];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke;
      v34[3] = &unk_1E6AF4AC0;
      v34[4] = self;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_2;
      v31[3] = &unk_1E6B030F0;
      objc_copyWeak(&v32, &from);
      objc_copyWeak(&v33, location);
      objc_msgSend(v23, "sb_animateWithSettings:mode:animations:completion:", v19, 3, v34, v31);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);
    }
  }
  else if (self->_hasCrossedCommitThreshold)
  {
    [(UIViewFloatAnimatableProperty *)self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty invalidate];
    double v20 = self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty;
    self->_cropsTrackingDiscreteAnimationProgressAnimatablePropertCGFloat y = 0;
  }
  self->_hasCrossedCommitThreshold = v16;
  double v21 = (void *)MEMORY[0x1E4FA5E48];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_3;
  v24[3] = &unk_1E6B03118;
  long long v26 = self;
  int64_t v27 = a3;
  id v25 = v13;
  double v28 = a5;
  CGFloat v29 = x;
  CGFloat v30 = y;
  id v22 = v13;
  [v21 perform:v24 finalCompletion:v14];
}

uint64_t __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1080) setValue:1.0];
}

void __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v2 && (id)WeakRetained[135] == v2)
  {
    [v2 invalidate];
    double v3 = (void *)WeakRetained[135];
    WeakRetained[135] = 0;
  }
}

void __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_3(uint64_t a1, void (**a2)(id, __CFString *))
{
  double v3 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v4 = *(void *)(a1 + 48);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_4;
  v30[3] = &unk_1E6B012E0;
  uint64_t v5 = *(void *)(a1 + 32);
  v30[4] = *(void *)(a1 + 40);
  v30[5] = *(void *)(a1 + 56);
  long long v31 = *(_OWORD *)(a1 + 64);
  uint64_t v7 = a2 + 2;
  double v6 = (void (*)(void))a2[2];
  uint64_t v8 = a2;
  uint64_t v9 = v6();
  objc_msgSend(v3, "sb_animateWithSettings:mode:animations:completion:", v5, v4, v30, v9);

  id v10 = *(id *)(*(void *)(a1 + 40) + 1192);
  long long v11 = [*(id *)(*(void *)(a1 + 40) + 1152) cropsAnimationSettings];
  id v12 = *(void **)(*(void *)(a1 + 40) + 1080);
  double v13 = 0.0;
  if (v12)
  {
    [v12 presentationValue];
    double v13 = fmin(fmax(v14, 0.0), 1.0);
  }
  [*(id *)(a1 + 32) trackingResponse];
  double v16 = v15;
  [v11 response];
  double v18 = v13 * (v16 - v17);
  [v11 response];
  [v10 setTrackingResponse:v19 + v18];
  [*(id *)(a1 + 32) trackingDampingRatio];
  double v21 = v20;
  [v11 dampingRatio];
  double v23 = v13 * (v21 - v22);
  [v11 dampingRatio];
  [v10 setTrackingDampingRatio:v24 + v23];
  if (BSFloatGreaterThanOrEqualToFloat()) {
    double v25 = 1.0;
  }
  else {
    double v25 = 0.0;
  }
  long long v26 = (void *)MEMORY[0x1E4F42FF0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_5;
  v29[3] = &unk_1E6AF4A70;
  uint64_t v27 = *(void *)(a1 + 48);
  v29[4] = *(void *)(a1 + 40);
  *(double *)&v29[5] = v25;
  double v28 = (*v7)(v8, @"crops");

  objc_msgSend(v26, "sb_animateWithSettings:mode:animations:completion:", v10, v27, v29, v28);
}

uint64_t __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1104) setValue:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1064) setValue:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1112) setValue:*(double *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 1120) setValue:*(double *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 984) setContentAlpha:*(double *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1000);
  double v3 = *(double *)(a1 + 40);
  return [v2 setAlpha:v3];
}

uint64_t __154__SBInteractiveScreenshotGestureRootViewController__updateWithUpdateMode_contentAnimationSettings_commitProgress_additionalContentTranslation_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1096) setValue:*(double *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1088);
  double v3 = *(double *)(a1 + 40);
  return [v2 setValue:v3];
}

- (SBInteractiveScreenshotGestureRootViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBInteractiveScreenshotGestureRootViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_gestureCommitProgressUpdateTimestamps, 0);
  objc_storeStrong((id *)&self->_gestureCommitProgressUpdates, 0);
  objc_storeStrong((id *)&self->_trackingCropsAnimationSettings, 0);
  objc_storeStrong((id *)&self->_topContentContainerView, 0);
  objc_storeStrong((id *)&self->_sourceScenePresenter, 0);
  objc_storeStrong((id *)&self->_sourceScenePresentationView, 0);
  objc_storeStrong((id *)&self->_sourceScene, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_screenshotContainerView, 0);
  objc_storeStrong((id *)&self->_screenshotImageView, 0);
  objc_storeStrong((id *)&self->_replicatorView, 0);
  objc_storeStrong((id *)&self->_translationYAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_translationXAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_transformProgressAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cropsProgressSeparatedValuesAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cropsProgressPresentationValueAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cropsTrackingDiscreteAnimationProgressAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_cropLinesAlphaMultiPartAnimations, 0);
  objc_storeStrong((id *)&self->_cancellationCommitProgressAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_flashView, 0);
  objc_storeStrong((id *)&self->_cropsView, 0);
  objc_storeStrong((id *)&self->_contentBackdropView, 0);
  objc_storeStrong((id *)&self->_chromePlaceholderStatusBar, 0);
  objc_storeStrong((id *)&self->_chromePlaceholderOrientationWrapperView, 0);
  objc_storeStrong((id *)&self->_chromePlaceholderViewController, 0);
  objc_storeStrong((id *)&self->_contentCapturingView, 0);
}

@end