@interface SBCoverSheetPrimarySlidingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_maglevActive;
- (BOOL)_shouldShowGrabberOnFirstSwipe;
- (BOOL)grabberTongueOrPullEnabled:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)hasCommittedCurrentTransition;
- (BOOL)shouldAutorotate;
- (CGRect)_animationTickedWithProgress:(double)a3 velocity:(double)a4 forPresentationValue:(BOOL)a5;
- (PBUIWallpaperAnimatedInvalidating)homescreenWallpaperScaleAssertion;
- (PBUIWallpaperAnimatedInvalidating)lockscreenWallpaperScaleAssertion;
- (SBCoverSheetBlurView)behindCoverSheetBlurView;
- (SBCoverSheetBlurView)panelCoverSheetBlurView;
- (SBCoverSheetGrabberDelegate)grabberDelegate;
- (SBCoverSheetPanelBackgroundContainerView)panelBackgroundContainerView;
- (SBCoverSheetParallaxContainerView)parallaxContainerView;
- (SBFTouchPassThroughView)parallaxClippingView;
- (SBFTouchPassThroughView)unlockedContentOverlayView;
- (SBGrabberTongue)grabberTongue;
- (SBWallpaperEffectView)panelFadeOutWallpaperEffectView;
- (SBWallpaperEffectView)panelWallpaperEffectView;
- (UIGestureRecognizer)edgePullGestureRecognizer;
- (double)defaultPresentGestureEdgeRegionSize;
- (double)presentationProgressAtCommit;
- (id)_visibilityDescriptionForView:(id)a3;
- (id)customGestureRecognizerForGrabberTongue:(id)a3;
- (unint64_t)_panelOptions;
- (void)_beginTransitionFromAppeared:(BOOL)a3;
- (void)_commitTransitionToAppeared:(BOOL)a3 animated:(BOOL)a4;
- (void)_controlCenterWindowSceneDidConnect:(id)a3;
- (void)_createFadeOutWallpaperEffectViewIfNeeded;
- (void)_createPanelWallpaperEffectViewIfNeeded;
- (void)_endTransitionToAppeared:(BOOL)a3;
- (void)_positionSubviewsForContentFrame:(CGRect)a3 forPresentationValue:(BOOL)a4;
- (void)_setupPanelPartsIfNecessary;
- (void)_transitionToViewControllerAppearState:(int)a3 ifNeeded:(BOOL)a4 forUserGesture:(BOOL)a5;
- (void)_updateBackgroundIfNecessary;
- (void)_updateFadeOutWallpaperEffectView;
- (void)_updatePanelWallpaperEffectView;
- (void)_updateWallpaperScaled:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateWindowVisibility;
- (void)dealloc;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6;
- (void)handleDidEndReachabilityAnimation;
- (void)handleReachabilityModeActivated;
- (void)handleReachabilityModeDeactivated;
- (void)handleWillBeginReachabilityAnimation;
- (void)loadView;
- (void)setBehindCoverSheetBlurView:(id)a3;
- (void)setDefaultPresentGestureEdgeRegionSize:(double)a3;
- (void)setGrabberDelegate:(id)a3;
- (void)setGrabberTongue:(id)a3;
- (void)setHasCommittedCurrentTransition:(BOOL)a3;
- (void)setHomescreenWallpaperScaleAssertion:(id)a3;
- (void)setLockscreenWallpaperScaleAssertion:(id)a3;
- (void)setPanelBackgroundContainerView:(id)a3;
- (void)setPanelCoverSheetBlurView:(id)a3;
- (void)setPanelFadeOutWallpaperEffectView:(id)a3;
- (void)setPanelWallpaperEffectView:(id)a3;
- (void)setParallaxClippingView:(id)a3;
- (void)setParallaxContainerView:(id)a3;
- (void)setPresentationProgressAtCommit:(double)a3;
- (void)setTransitionSettings:(id)a3;
- (void)setUnlockedContentOverlayView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBCoverSheetPrimarySlidingViewController

- (void)loadView
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v34 loadView];
  v3 = [(SBCoverSheetPrimarySlidingViewController *)self view];
  v4 = objc_alloc_init(SBCoverSheetPanelBackgroundContainerView);
  panelBackgroundContainerView = self->_panelBackgroundContainerView;
  self->_panelBackgroundContainerView = v4;

  [v3 addSubview:self->_panelBackgroundContainerView];
  [v3 sendSubviewToBack:self->_panelBackgroundContainerView];
  v6 = (SBFTouchPassThroughView *)objc_alloc_init(MEMORY[0x1E4FA6028]);
  parallaxClippingView = self->_parallaxClippingView;
  self->_parallaxClippingView = v6;

  [(SBFTouchPassThroughView *)self->_parallaxClippingView setClipsToBounds:1];
  [(SBCoverSheetPanelBackgroundContainerView *)self->_panelBackgroundContainerView addSubview:self->_parallaxClippingView];
  v8 = objc_alloc_init(SBCoverSheetParallaxContainerView);
  parallaxContainerView = self->_parallaxContainerView;
  self->_parallaxContainerView = v8;

  [(SBFTouchPassThroughView *)self->_parallaxClippingView addSubview:self->_parallaxContainerView];
  id v10 = objc_alloc(MEMORY[0x1E4FA6028]);
  [v3 bounds];
  v11 = (SBFTouchPassThroughView *)objc_msgSend(v10, "initWithFrame:");
  unlockedContentOverlayView = self->_unlockedContentOverlayView;
  self->_unlockedContentOverlayView = v11;

  [(SBFTouchPassThroughView *)self->_unlockedContentOverlayView bs_setHitTestingDisabled:1];
  v13 = self->_unlockedContentOverlayView;
  v14 = [MEMORY[0x1E4F428B8] clearColor];
  [(SBFTouchPassThroughView *)v13 setBackgroundColor:v14];

  [(SBCoverSheetPanelBackgroundContainerView *)self->_panelBackgroundContainerView addSubview:self->_unlockedContentOverlayView];
  [(SBCoverSheetPanelBackgroundContainerView *)self->_panelBackgroundContainerView sendSubviewToBack:self->_unlockedContentOverlayView];
  [(SBCoverSheetPrimarySlidingViewController *)self _updatePanelWallpaperEffectView];
  [(SBCoverSheetPrimarySlidingViewController *)self _updateFadeOutWallpaperEffectView];
  v15 = +[SBCoverSheetPresentationManager sharedInstance];
  v16 = [v15 coverSheetWindow];
  v17 = [v16 _sbWindowScene];

  v18 = [[SBGrabberTongue alloc] initWithDelegate:self edge:1 type:1 windowScene:v17];
  grabberTongue = self->_grabberTongue;
  self->_grabberTongue = v18;

  [(SBGrabberTongue *)self->_grabberTongue setName:@"CoverSheetGrabberTongue"];
  v20 = self->_grabberTongue;
  v21 = [(SBCoverSheetPrimarySlidingViewController *)self view];
  [(SBGrabberTongue *)v20 installInView:v21 withColorStyle:0];

  v22 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  v23 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  [v22 setPresentGestureRecognizer:v23];

  uint64_t v24 = objc_opt_class();
  v25 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  v26 = SBSafeCast(v24, v25);

  [v26 _edgeRegionSize];
  self->_double defaultPresentGestureEdgeRegionSize = v27;
  v28 = SBLogSystemGestureCoverSheet();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    double defaultPresentGestureEdgeRegionSize = self->_defaultPresentGestureEdgeRegionSize;
    *(_DWORD *)buf = 134217984;
    double v36 = defaultPresentGestureEdgeRegionSize;
    _os_log_impl(&dword_1D85BA000, v28, OS_LOG_TYPE_DEFAULT, "_defaultPresentGestureEdgeRegionSize initialized to %g", buf, 0xCu);
  }

  v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v30 addObserver:self selector:sel__controlCenterWindowSceneDidConnect_ name:@"SBControlCenterControllerWindowSceneDidConnect" object:0];

  v31 = +[SBReachabilityManager sharedInstance];
  [v31 addObserver:self];
  v32 = [v31 dismissPanGestureRecognizer];
  v33 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  [v32 requireGestureRecognizerToFail:v33];
}

- (UIGestureRecognizer)edgePullGestureRecognizer
{
  return (UIGestureRecognizer *)[(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
}

- (void)dealloc
{
  v3 = +[SBReachabilityManager sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v4 dealloc];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v52.receiver = self;
  v52.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v52 viewDidLayoutSubviews];
  v3 = [(SBCoverSheetSlidingViewController *)self positionView];
  objc_super v4 = [(SBCoverSheetPrimarySlidingViewController *)self view];
  [v4 bounds];
  double v45 = v6;
  double v46 = v5;
  double v43 = v8;
  double v44 = v7;

  v9 = [v3 contentView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = -v17;
  CGFloat rect = v13;
  if (v13 > -v17) {
    double v18 = v13;
  }
  double v19 = fmin(v18, 0.0);
  uint64_t v20 = [(SBCoverSheetPrimarySlidingViewController *)self interfaceOrientation];
  double MinX = v11;
  double v22 = v19;
  double Width = v15;
  double v24 = v17;
  if (v20 == 2)
  {
    v57.origin.x = v11;
    v57.origin.y = v19;
    v57.size.width = v15;
    v57.size.height = v17;
    double MinX = CGRectGetMinX(v57);
    v58.origin.x = v11;
    v58.origin.y = v19;
    v58.size.width = v15;
    v58.size.height = v17;
    double Height = CGRectGetHeight(v58);
    v59.origin.x = v11;
    v59.origin.y = v19;
    v59.size.width = v15;
    v59.size.height = v17;
    double v22 = Height - CGRectGetMinY(v59);
    v60.origin.x = v11;
    v60.origin.y = v19;
    v60.size.width = v15;
    v60.size.height = v17;
    double Width = CGRectGetWidth(v60);
    v61.origin.x = v11;
    v61.origin.y = v19;
    v61.size.width = v15;
    v61.size.height = v17;
    double v24 = CGRectGetHeight(v61);
  }
  v26 = [(SBCoverSheetPrimarySlidingViewController *)self panelBackgroundContainerView];
  objc_msgSend(v26, "setFrame:", MinX, v22, Width, v24);

  double v27 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  [v27 trackingWallpaperParallaxFactor];
  double v29 = v28;

  v30 = [(SBCoverSheetPrimarySlidingViewController *)self parallaxContainerView];
  objc_msgSend(v30, "setFrame:", v11, -(v29 * v19), v15, v17);

  v31 = [(SBCoverSheetPrimarySlidingViewController *)self behindCoverSheetBlurView];
  objc_msgSend(v31, "setFrame:", v46, v45, v44, v43);

  v32 = [(SBCoverSheetPrimarySlidingViewController *)self panelCoverSheetBlurView];
  objc_msgSend(v32, "setFrame:", v46, v45, v44, v43);

  v33 = [(SBCoverSheetPrimarySlidingViewController *)self parallaxClippingView];
  objc_msgSend(v33, "setFrame:", v46, v45, v44, v43);

  objc_super v34 = [(SBCoverSheetPrimarySlidingViewController *)self panelFadeOutWallpaperEffectView];
  objc_msgSend(v34, "setFrame:", v46, v45, v44, v43);

  v35 = [(SBCoverSheetPrimarySlidingViewController *)self panelWallpaperEffectView];
  objc_msgSend(v35, "setFrame:", v46, v45, v44, v43);

  if ([(SBCoverSheetPrimarySlidingViewController *)self _maglevActive])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v49 = 0u;
    switch(v20)
    {
      case 1:
        double v36 = 0.0;
        break;
      case 3:
        double v36 = 1.57079633;
        break;
      case 4:
        double v36 = -1.57079633;
        break;
      default:
        double v36 = 3.14159265;
        if (v20 != 2) {
          double v36 = 0.0;
        }
        break;
    }
    CGAffineTransformMakeRotation(&v48, -v36);
    UIIntegralTransform();
    panelWallpaperEffectView = self->_panelWallpaperEffectView;
    *(_OWORD *)buf = v49;
    long long v54 = v50;
    long long v55 = v51;
    [(SBWallpaperEffectView *)panelWallpaperEffectView setTransform:buf];
    v40 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController viewDidLayoutSubviews] - _panelWallpaperEffectView transformed for orientation: %ld", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v37 = self->_panelWallpaperEffectView;
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v49 = *MEMORY[0x1E4F1DAB8];
    long long v50 = v38;
    long long v51 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(SBWallpaperEffectView *)v37 setTransform:&v49];
  }
  v62.origin.x = v11;
  v62.origin.y = rect;
  v62.size.width = v15;
  v62.size.height = v17;
  double v41 = CGRectGetHeight(v62);
  v42 = [(SBCoverSheetPrimarySlidingViewController *)self unlockedContentOverlayView];
  objc_msgSend(v42, "setFrame:", v11, v41, v15, v17);
}

- (BOOL)shouldAutorotate
{
  v3 = [(SBCoverSheetSlidingViewController *)self contentViewController];
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleCoverSheet"))
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    int v4 = [v3 shouldAutorotate];
    char v5 = objc_msgSend(v3, "bs_isAppearingOrAppeared");
    if (v4 && (v5 & 1) == 0)
    {
      double v6 = [(SBCoverSheetSlidingViewController *)self delegate];
      LOBYTE(v4) = [v6 coverSheetSlidingViewControllerContentShouldAutoRotateWhenNotVisible:self];
    }
  }

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  id v7 = a4;
  double v6 = [(SBCoverSheetSlidingViewController *)self contentViewController];
  if (objc_opt_respondsToSelector()) {
    [v6 getRotationContentSettings:a3 forWindow:v7];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  id v7 = a4;
  -[SBCoverSheetPrimarySlidingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = self->_panelBackgroundContainerView;
  [(SBCoverSheetPanelBackgroundContainerView *)v8 setClipsToBounds:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__SBCoverSheetPrimarySlidingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E6AF53F8;
  double v11 = v8;
  v9 = v8;
  [v7 animateAlongsideTransition:0 completion:v10];
}

uint64_t __95__SBCoverSheetPrimarySlidingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setClipsToBounds:0];
}

- (void)_positionSubviewsForContentFrame:(CGRect)a3 forPresentationValue:(BOOL)a4
{
  BOOL v4 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _positionSubviewsForContentFrame:forPresentationValue:](&v22, sel__positionSubviewsForContentFrame_forPresentationValue_);
  UIRectGetCenter();
  double v7 = v6;
  double v9 = v8;
  double v10 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  [v10 trackingWallpaperParallaxFactor];

  UIRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  double v15 = [(SBCoverSheetPrimarySlidingViewController *)self panelBackgroundContainerView];
  double v16 = v15;
  if (v4)
  {
    *(double *)v21 = v7;
    *(double *)&v21[1] = v9;
    double v17 = [MEMORY[0x1E4F29238] valueWithBytes:v21 objCType:"{CGPoint=dd}"];
    [v16 _setPresentationValue:v17 forKey:@"position"];

    double v18 = [(SBCoverSheetPrimarySlidingViewController *)self parallaxContainerView];
    *(double *)uint64_t v20 = v12;
    *(double *)&v20[1] = v14;
    double v19 = [MEMORY[0x1E4F29238] valueWithBytes:v20 objCType:"{CGPoint=dd}"];
    [v18 _setPresentationValue:v19 forKey:@"position"];
  }
  else
  {
    objc_msgSend(v15, "setCenter:", v7, v9);

    double v18 = [(SBCoverSheetPrimarySlidingViewController *)self parallaxContainerView];
    objc_msgSend(v18, "setCenter:", v12, v14);
  }
}

- (void)setTransitionSettings:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v4 setTransitionSettings:a3];
  [(SBCoverSheetPrimarySlidingViewController *)self _updateBackgroundIfNecessary];
  [(SBCoverSheetPrimarySlidingViewController *)self _setupPanelPartsIfNecessary];
  [(SBCoverSheetPrimarySlidingViewController *)self _updatePanelWallpaperEffectView];
  [(SBCoverSheetPrimarySlidingViewController *)self _updateFadeOutWallpaperEffectView];
}

- (void)_transitionToViewControllerAppearState:(int)a3 ifNeeded:(BOOL)a4 forUserGesture:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  [(SBCoverSheetSlidingViewController *)&v9 _transitionToViewControllerAppearState:*(void *)&a3 ifNeeded:a4 forUserGesture:a5];
  double v7 = [(SBCoverSheetSlidingViewController *)self delegate];
  double v8 = v7;
  if (a3 <= 3) {
    [v7 coverSheetSlidingViewController:self isTransitioning:a3 & 1];
  }
}

- (void)_beginTransitionFromAppeared:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _beginTransitionFromAppeared:](&v32, sel__beginTransitionFromAppeared_);
  [(SBCoverSheetPrimarySlidingViewController *)self setHasCommittedCurrentTransition:0];
  [(SBCoverSheetPrimarySlidingViewController *)self setPresentationProgressAtCommit:-1.0];
  char v5 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  if ([(SBCoverSheetSlidingViewController *)self dismissalSlidingMode] != 2)
  {
    if ([v5 blursPanel]
      && ([(SBCoverSheetSlidingViewController *)self contentViewController],
          double v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 contentOccludesBackground],
          v10,
          (v11 & 1) == 0))
    {
      [(SBCoverSheetBlurView *)self->_panelCoverSheetBlurView setAlpha:1.0];
      double v12 = 0.0;
      if (!v3) {
        double v12 = 1.0;
      }
      [(SBCoverSheetBlurView *)self->_panelCoverSheetBlurView setWeighting:v12];
    }
    else
    {
      [(SBCoverSheetBlurView *)self->_panelCoverSheetBlurView setAlpha:0.0];
    }
    int v13 = [v5 blursBehindCoverSheet];
    behindCoverSheetBlurView = self->_behindCoverSheetBlurView;
    if (v13)
    {
      [(SBCoverSheetBlurView *)behindCoverSheetBlurView setAlpha:1.0];
      [(SBCoverSheetBlurView *)self->_behindCoverSheetBlurView setHidden:0];
      double v15 = 0.0;
      if (v3) {
        double v15 = 1.0;
      }
      [(SBCoverSheetBlurView *)self->_behindCoverSheetBlurView setWeighting:v15];
    }
    else
    {
      [(SBCoverSheetBlurView *)behindCoverSheetBlurView setHidden:1];
    }
    int v16 = [v5 panelWallpaper];
    panelWallpaperEffectView = self->_panelWallpaperEffectView;
    if (v16)
    {
      [(SBWallpaperEffectView *)panelWallpaperEffectView setAlpha:1.0];
      [(PBUIWallpaperEffectViewBase *)self->_panelWallpaperEffectView setHidden:0];
      -[PBUIWallpaperEffectViewBase setFullscreen:](self->_panelWallpaperEffectView, "setFullscreen:", [v5 trackingWallpaper]);
      double v18 = SBLogSystemGestureCoverSheet();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        double v19 = [(SBCoverSheetPrimarySlidingViewController *)self _visibilityDescriptionForView:self->_panelWallpaperEffectView];
        *(_DWORD *)buf = 67109378;
        BOOL v34 = v3;
        __int16 v35 = 2114;
        double v36 = v19;
        uint64_t v20 = "-[SBCoverSheetPrimarySlidingViewController _beginTransitionFromAppeared:%{BOOL}i] - _panelWallpaperEffectV"
              "iew visible: %{public}@; ";
LABEL_21:
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0x12u);
      }
    }
    else
    {
      [(PBUIWallpaperEffectViewBase *)panelWallpaperEffectView setHidden:1];
      double v18 = SBLogSystemGestureCoverSheet();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        double v19 = [(SBCoverSheetPrimarySlidingViewController *)self _visibilityDescriptionForView:self->_panelWallpaperEffectView];
        *(_DWORD *)buf = 67109378;
        BOOL v34 = v3;
        __int16 v35 = 2114;
        double v36 = v19;
        uint64_t v20 = "-[SBCoverSheetPrimarySlidingViewController _beginTransitionFromAppeared:%{BOOL}i] - _panelWallpaperEffectV"
              "iew NOT visible: %{public}@";
        goto LABEL_21;
      }
    }

    -[PBUIWallpaperEffectViewBase setHidden:](self->_panelFadeOutWallpaperEffectView, "setHidden:", [v5 fadesContent] ^ 1);
    if ([v5 fadesCoverSheetContent])
    {
      int v21 = [v5 alwaysFadesCoverSheetContent];
      objc_super v22 = [(SBCoverSheetSlidingViewController *)self contentViewController];
      v23 = [v22 view];
      double v24 = v23;
      double v25 = 0.0;
      if (v3 | v21) {
        double v25 = 1.0;
      }
      [v23 setAlpha:v25];
    }
    int v26 = [v5 darkensContent];
    double v27 = (void *)MEMORY[0x1E4F428B8];
    if (v26)
    {
      [v5 darkeningColorWhite];
      double v29 = v28;
      [v5 darkeningColorAlpha];
      double v8 = [v27 colorWithWhite:v29 alpha:v30];
      if (v3) {
        double v31 = 1.0;
      }
      else {
        double v31 = 0.0;
      }
    }
    else
    {
      double v8 = [MEMORY[0x1E4F428B8] clearColor];
      double v31 = 0.0;
    }
    [(SBFTouchPassThroughView *)self->_unlockedContentOverlayView setBackgroundColor:v8];
    [(SBFTouchPassThroughView *)self->_unlockedContentOverlayView setAlpha:v31];
    goto LABEL_32;
  }
  unlockedContentOverlayView = self->_unlockedContentOverlayView;
  double v7 = [MEMORY[0x1E4F428B8] blackColor];
  [(SBFTouchPassThroughView *)unlockedContentOverlayView setBackgroundColor:v7];

  [(SBFTouchPassThroughView *)self->_unlockedContentOverlayView setAlpha:1.0];
  if ([v5 panelWallpaper])
  {
    [(PBUIWallpaperEffectViewBase *)self->_panelWallpaperEffectView setHidden:0];
    double v8 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v9 = [(SBCoverSheetPrimarySlidingViewController *)self _visibilityDescriptionForView:self->_panelWallpaperEffectView];
      *(_DWORD *)buf = 67109378;
      BOOL v34 = v3;
      __int16 v35 = 2114;
      double v36 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _beginTransitionFromAppeared:%{BOOL}i] - _panelWallpaperEffectView visible (rubberBanding): %{public}@", buf, 0x12u);
    }
LABEL_32:
  }
}

- (void)_commitTransitionToAppeared:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _commitTransitionToAppeared:animated:](&v10, sel__commitTransitionToAppeared_animated_);
  double v7 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  double v8 = v7;
  if (v5) {
    uint64_t v9 = [v7 scaleWallpaper];
  }
  else {
    uint64_t v9 = 0;
  }
  [(SBCoverSheetPrimarySlidingViewController *)self _updateWallpaperScaled:v9 animated:v4];
  [(SBCoverSheetPrimarySlidingViewController *)self setHasCommittedCurrentTransition:1];
}

- (void)_endTransitionToAppeared:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _endTransitionToAppeared:](&v17, sel__endTransitionToAppeared_);
  BOOL v5 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  if ([v5 blursPanel])
  {
    double v6 = 1.0;
    if (v3) {
      double v6 = 0.0;
    }
    [(SBCoverSheetBlurView *)self->_panelCoverSheetBlurView setWeighting:v6];
    [(SBCoverSheetBlurView *)self->_panelCoverSheetBlurView setAlpha:0.0];
  }
  if ([v5 blursBehindCoverSheet])
  {
    double v7 = 0.0;
    if (v3) {
      double v7 = 1.0;
    }
    [(SBCoverSheetBlurView *)self->_behindCoverSheetBlurView setWeighting:v7];
    [(SBCoverSheetBlurView *)self->_behindCoverSheetBlurView setHidden:1];
  }
  if ([v5 panelWallpaper])
  {
    [(PBUIWallpaperEffectViewBase *)self->_panelWallpaperEffectView setHidden:1];
    double v8 = SBLogSystemGestureCoverSheet();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v9 = [(SBCoverSheetPrimarySlidingViewController *)self _visibilityDescriptionForView:self->_panelWallpaperEffectView];
    *(_DWORD *)buf = 67109378;
    BOOL v19 = v3;
    __int16 v20 = 2114;
    int v21 = v9;
    objc_super v10 = "-[SBCoverSheetPrimarySlidingViewController _endTransitionToAppeared:%{BOOL}i] - _panelWallpaperEffectView was "
          "visible with final alpha: %{public}@";
  }
  else
  {
    double v8 = SBLogSystemGestureCoverSheet();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v9 = [(SBCoverSheetPrimarySlidingViewController *)self _visibilityDescriptionForView:self->_panelWallpaperEffectView];
    *(_DWORD *)buf = 67109378;
    BOOL v19 = v3;
    __int16 v20 = 2114;
    int v21 = v9;
    objc_super v10 = "-[SBCoverSheetPrimarySlidingViewController _endTransitionToAppeared:%{BOOL}i] - _panelWallpaperEffectView was "
          "hidden: %{public}@";
  }
  _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0x12u);

LABEL_15:
  if ([v5 fadesContent]) {
    [(PBUIWallpaperEffectViewBase *)self->_panelFadeOutWallpaperEffectView setHidden:1];
  }
  if ([v5 fadesCoverSheetContent])
  {
    int v11 = [v5 alwaysFadesCoverSheetContent];
    double v12 = [(SBCoverSheetSlidingViewController *)self contentViewController];
    int v13 = [v12 view];
    double v14 = v13;
    double v15 = 0.0;
    if (v3 | v11) {
      double v15 = 1.0;
    }
    [v13 setAlpha:v15];
  }
  int v16 = [(SBCoverSheetSlidingViewController *)self delegate];
  [v16 coverSheetSlidingViewControllerDidEndTransition:self];
}

- (CGRect)_animationTickedWithProgress:(double)a3 velocity:(double)a4 forPresentationValue:(BOOL)a5
{
  BOOL v5 = a5;
  v42.receiver = self;
  v42.super_class = (Class)SBCoverSheetPrimarySlidingViewController;
  -[SBCoverSheetSlidingViewController _animationTickedWithProgress:velocity:forPresentationValue:](&v42, sel__animationTickedWithProgress_velocity_forPresentationValue_);
  double v40 = v8;
  double v41 = v7;
  double v39 = v9;
  double v11 = v10;
  double v12 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  double v13 = 0.0;
  double v14 = 0.0;
  if ([v12 blursPanel])
  {
    if (UIAccessibilityIsReduceTransparencyEnabled()) {
      [v12 blurEndReducedTransparency];
    }
    else {
      [v12 blurEnd];
    }
    [v12 blurStart];
    BSIntervalSubIntervalValueForValue();
    double v14 = v15;
  }
  if ([v12 blursBehindCoverSheet])
  {
    [v12 behindCoverSheetBlurStart];
    [v12 behindCoverSheetBlurEnd];
    BSIntervalSubIntervalValueForValue();
    double v13 = 1.0 - v16;
  }
  double v17 = 0.0;
  if ([v12 darkensContent])
  {
    [v12 darkeningStart];
    [v12 darkeningEnd];
    BSIntervalSubIntervalValueForValue();
    double v17 = 1.0 - v18;
  }
  double v19 = 1.0;
  if ([v12 fadePanelWallpaper])
  {
    [v12 fadePanelWallpaperStart];
    [v12 fadePanelWallpaperEnd];
    BSIntervalSubIntervalValueForValue();
    double v19 = 1.0 - v20;
  }
  double v21 = 0.0;
  if ([v12 fadesContent])
  {
    [v12 maxContentAlpha];
    [v12 contentFadeStart];
    [v12 contentFadeEnd];
    BSIntervalSubIntervalValueForValue();
    double v21 = 1.0 - v22;
  }
  BOOL v23 = [(SBCoverSheetPrimarySlidingViewController *)self hasCommittedCurrentTransition];
  double v24 = 1.0;
  if ([v12 fadesCoverSheetContent] && v23)
  {
    if (v5 && ([v12 alwaysFadesCoverSheetContent] & 1) == 0)
    {
      [v12 fadesCoverSheetContentStart];
      [v12 fadesCoverSheetContentEnd];
    }
    BSIntervalSubIntervalValueForValue();
    double v24 = 1.0 - v25;
  }
  unlockedContentOverlayView = self->_unlockedContentOverlayView;
  if (v5)
  {
    double v27 = [NSNumber numberWithDouble:v17];
    [(SBFTouchPassThroughView *)unlockedContentOverlayView _setPresentationValue:v27 forKey:@"opacity"];

    panelWallpaperEffectView = self->_panelWallpaperEffectView;
    double v29 = [NSNumber numberWithDouble:v19];
    [(SBWallpaperEffectView *)panelWallpaperEffectView _setPresentationValue:v29 forKey:@"opacity"];

    panelFadeOutWallpaperEffectView = self->_panelFadeOutWallpaperEffectView;
    double v31 = [NSNumber numberWithDouble:v21];
    [(SBWallpaperEffectView *)panelFadeOutWallpaperEffectView _setPresentationValue:v31 forKey:@"opacity"];

    if (v23)
    {
      objc_super v32 = [(SBCoverSheetSlidingViewController *)self contentViewController];
      v33 = [v32 view];
      BOOL v34 = [NSNumber numberWithDouble:v24];
      [v33 _setPresentationValue:v34 forKey:@"opacity"];

LABEL_26:
    }
  }
  else
  {
    [(SBFTouchPassThroughView *)self->_unlockedContentOverlayView setAlpha:v17];
    [(SBWallpaperEffectView *)self->_panelWallpaperEffectView setAlpha:v19];
    [(SBWallpaperEffectView *)self->_panelFadeOutWallpaperEffectView setAlpha:v21];
    if (v23)
    {
      objc_super v32 = [(SBCoverSheetSlidingViewController *)self contentViewController];
      v33 = [v32 view];
      [v33 setAlpha:v24];
      goto LABEL_26;
    }
  }
  [(SBCoverSheetBlurView *)self->_behindCoverSheetBlurView setWeighting:v5 forPresentationValue:v13];
  [(SBCoverSheetBlurView *)self->_panelCoverSheetBlurView setWeighting:v5 forPresentationValue:v14];

  double v36 = v40;
  double v35 = v41;
  double v37 = v39;
  double v38 = v11;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)handleReachabilityModeActivated
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  BOOL v5 = SBSafeCast(v3, v4);

  if (v5)
  {
    double v6 = +[SBReachabilityManager sharedInstance];
    [v6 reachabilityYOffset];
    double v8 = v7;

    [v5 _setEdgeRegionSize:v8];
    double v9 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      double v14 = v8;
      double v10 = "reachability activated - setting edgeRegionSize to %g";
      double v11 = v9;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, v12);
    }
  }
  else
  {
    double v9 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      double v10 = "reachability activated - missing recognizer";
      double v11 = v9;
      uint32_t v12 = 2;
      goto LABEL_6;
    }
  }
}

- (void)handleReachabilityModeDeactivated
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  BOOL v4 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
  BOOL v5 = SBSafeCast(v3, v4);

  double v6 = SBLogSystemGestureCoverSheet();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      double defaultPresentGestureEdgeRegionSize = self->_defaultPresentGestureEdgeRegionSize;
      int v9 = 134217984;
      double v10 = defaultPresentGestureEdgeRegionSize;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "reachability deactivated - setting edgeRegionSize to %g", (uint8_t *)&v9, 0xCu);
    }

    [v5 _setEdgeRegionSize:self->_defaultPresentGestureEdgeRegionSize];
  }
  else
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "reachability deactivated - missing recognizer", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)handleWillBeginReachabilityAnimation
{
  id v3 = [(SBCoverSheetSlidingViewController *)self delegate];
  [v3 coverSheetSlidingViewControllerReachabilityAnimationWillBegin:self];
}

- (void)handleDidEndReachabilityAnimation
{
  id v3 = [(SBCoverSheetSlidingViewController *)self delegate];
  [v3 coverSheetSlidingViewControllerReachabilityAnimationDidEnd:self];
}

- (id)customGestureRecognizerForGrabberTongue:(id)a3
{
  id v3 = [(SBScreenEdgePanGestureRecognizer *)[SBCoverSheetPresentationGestureRecognizer alloc] initWithTarget:0 action:0 type:6 options:0];
  [(SBCoverSheetPresentationGestureRecognizer *)v3 setName:@"CSPresent"];
  [(UIScreenEdgePanGestureRecognizer *)v3 setEdges:1];
  [(SBCoverSheetPresentationGestureRecognizer *)v3 setAllowedTouchTypes:&unk_1F33480F0];
  [(SBCoverSheetPresentationGestureRecognizer *)v3 sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
  uint64_t v4 = SBFEffectiveArtworkSubtype();
  if (v4 <= 2795)
  {
    if (v4 != 2556 && v4 != 2622) {
      goto LABEL_8;
    }
LABEL_7:
    [(UIScreenEdgePanGestureRecognizer *)v3 _setEdgeRegionSize:15.0];
    goto LABEL_8;
  }
  if (v4 == 2868 || v4 == 2796) {
    goto LABEL_7;
  }
LABEL_8:
  return v3;
}

- (BOOL)grabberTongueOrPullEnabled:(id)a3 forGestureRecognizer:(id)a4
{
  id v5 = a4;
  double v6 = +[SBSystemGestureManager mainDisplayManager];
  char v7 = [v6 isGestureWithTypeAllowed:1];

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = 0;
      uint32_t v12 = "Not allowing the present gesture to begin because system gestures aren't allowed.";
      int v13 = (uint8_t *)&v16;
LABEL_8:
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
LABEL_9:

    BOOL v10 = 0;
    goto LABEL_10;
  }
  double v8 = [(SBCoverSheetSlidingViewController *)self systemGesturesDelegate];
  char v9 = [v8 gestureRecognizerShouldBegin:v5];

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      uint32_t v12 = "SystemGesturesDelegate says gesture recognizer should not begin.";
      int v13 = (uint8_t *)&v15;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (void)grabberTongueBeganPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  id v7 = a3;
  [v7 dismissWithStyle:0 animated:1];
  id v8 = [v7 edgePullGestureRecognizer];

  [(SBCoverSheetSlidingViewController *)self _handlePresentGesture:v8];
}

- (void)grabberTongueUpdatedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  objc_msgSend(a3, "edgePullGestureRecognizer", a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(SBCoverSheetSlidingViewController *)self _handlePresentGesture:v7];
}

- (void)grabberTongueEndedPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  objc_msgSend(a3, "edgePullGestureRecognizer", a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(SBCoverSheetSlidingViewController *)self _handlePresentGesture:v7];
}

- (void)grabberTongueCanceledPulling:(id)a3 withDistance:(double)a4 andVelocity:(double)a5 andGesture:(id)a6
{
  objc_msgSend(a3, "edgePullGestureRecognizer", a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(SBCoverSheetSlidingViewController *)self _handlePresentGesture:v7];
}

- (BOOL)_shouldShowGrabberOnFirstSwipe
{
  id v3 = +[SBControlCenterController sharedInstance];
  uint64_t v4 = [v3 presentingEdge];

  if (v4 == 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    double v6 = [(SBCoverSheetPrimarySlidingViewController *)self grabberDelegate];
    int v7 = [v6 hasFirstSwipeShowGrabberOverride];
    int v5 = (v7 ^ 1) & [v6 screenEdgesDeferringSystemGestures];
  }
  return v5;
}

- (void)_updateWindowVisibility
{
  id v3 = [(SBCoverSheetPrimarySlidingViewController *)self grabberDelegate];
  objc_msgSend(v3, "updateVisibilityForGrabberVisible:", -[SBGrabberTongue isVisible](self->_grabberTongue, "isVisible"));
}

- (void)_controlCenterWindowSceneDidConnect:(id)a3
{
  id v5 = +[SBControlCenterController sharedInstance];
  if ([v5 presentingEdge] == 1)
  {
    uint64_t v4 = [(SBGrabberTongue *)self->_grabberTongue edgePullGestureRecognizer];
    [v5 _requirePresentGestureRecognizerToFailForGestureRecognizer:v4];
  }
  else
  {
    uint64_t v4 = [(SBCoverSheetSlidingViewController *)self dismissGestureRecognizer];
    [v5 _requireGestureRecognizerToFailForPresentGestureRecognizer:v4];
  }
}

- (id)_visibilityDescriptionForView:(id)a3
{
  id v3 = NSString;
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  if ([v4 isHidden]) {
    int v7 = @"YES";
  }
  else {
    int v7 = @"NO";
  }
  [v4 alpha];
  char v9 = [v3 stringWithFormat:@"<%@: %p hidden = %@; alpha = %f>", v6, v4, v7, v8];;

  return v9;
}

- (void)_updatePanelWallpaperEffectView
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  if ([v3 panelWallpaper])
  {
    [(SBCoverSheetPrimarySlidingViewController *)self _createPanelWallpaperEffectViewIfNeeded];
    id v4 = [(SBCoverSheetPrimarySlidingViewController *)self _visibilityDescriptionForView:self->_panelWallpaperEffectView];
    id v5 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      __int16 v15 = v4;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _updatePanelWallpaperEffectView] - _panelWallpaperEffectView %{public}@ will be visible", (uint8_t *)&v14, 0xCu);
    }

    double v6 = [(SBWallpaperEffectView *)self->_panelWallpaperEffectView superview];
    parallaxContainerView = self->_parallaxContainerView;

    if (v6 != parallaxContainerView)
    {
      uint64_t v8 = SBLogSystemGestureCoverSheet();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        char v9 = [(SBWallpaperEffectView *)self->_panelWallpaperEffectView superview];
        BOOL v10 = [(SBCoverSheetPrimarySlidingViewController *)self _visibilityDescriptionForView:v9];
        uint64_t v11 = [(SBCoverSheetPrimarySlidingViewController *)self _visibilityDescriptionForView:self->_parallaxContainerView];
        int v14 = 138543874;
        __int16 v15 = v4;
        __int16 v16 = 2114;
        double v17 = v10;
        __int16 v18 = 2114;
        double v19 = v11;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _updatePanelWallpaperEffectView] - moving _panelWallpaperEffectView %{public}@ from %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);
      }
      [(SBWallpaperEffectView *)self->_panelWallpaperEffectView removeFromSuperview];
      [(SBCoverSheetParallaxContainerView *)self->_parallaxContainerView addSubview:self->_panelWallpaperEffectView];
      [(SBCoverSheetParallaxContainerView *)self->_parallaxContainerView sendSubviewToBack:self->_panelWallpaperEffectView];
      uint32_t v12 = [(SBCoverSheetPrimarySlidingViewController *)self viewIfLoaded];
      [v12 setNeedsLayout];
    }
  }
  else
  {
    int v13 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _updatePanelWallpaperEffectView] - _panelWallpaperEffectView will NOT be visible", (uint8_t *)&v14, 2u);
    }

    [(SBWallpaperEffectView *)self->_panelWallpaperEffectView removeFromSuperview];
  }
}

- (unint64_t)_panelOptions
{
  id v3 = [(SBCoverSheetPrimarySlidingViewController *)self view];
  id v4 = [v3 window];
  unint64_t v5 = [v4 interfaceOrientation] - 5;

  BOOL v6 = [(SBCoverSheetPrimarySlidingViewController *)self _maglevActive];
  int v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v5 < 0xFFFFFFFFFFFFFFFELL)
  {
    BOOL v10 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
    char v11 = [v10 orientPanelWallpaper];
    if (v6)
    {
      if (v5 < 0xFFFFFFFFFFFFFFFELL) {
        char v12 = 1;
      }
      else {
        char v12 = v11;
      }
      if ((v12 & 1) == 0)
      {
        if (_os_feature_enabled_impl()) {
          unint64_t v13 = 19;
        }
        else {
          unint64_t v13 = 17;
        }
        goto LABEL_21;
      }
    }
    else if ((v11 & 1) != 0 {
           || ([MEMORY[0x1E4F42948] currentDevice],
    }
               int v14 = objc_claimAutoreleasedReturnValue(),
               uint64_t v15 = [v14 userInterfaceIdiom],
               v14,
               (v15 & 0xFFFFFFFFFFFFFFFBLL) != 1)
           || !SBReduceMotion())
    {
      unint64_t v13 = 19;
      goto LABEL_21;
    }
    unint64_t v13 = 17;
LABEL_21:

    return v13;
  }
  if (v6) {
    return 17;
  }
  else {
    return 81;
  }
}

- (BOOL)_maglevActive
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

- (void)_createPanelWallpaperEffectViewIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SBCoverSheetPrimarySlidingViewController *)self _panelOptions];
  panelWallpaperEffectView = self->_panelWallpaperEffectView;
  if (!panelWallpaperEffectView) {
    goto LABEL_7;
  }
  if ([(PBUIWallpaperEffectViewBase *)panelWallpaperEffectView transformOptions] == v3) {
    return;
  }
  if (self->_panelWallpaperEffectView)
  {
    unint64_t v5 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = v3;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _createPanelWallpaperEffectViewIfNeeded] - REPLACING _panelWallpaperEffectView. New panel options 0x%lX", (uint8_t *)&v9, 0xCu);
    }

    [(SBWallpaperEffectView *)self->_panelWallpaperEffectView removeFromSuperview];
  }
  else
  {
LABEL_7:
    BOOL v6 = SBLogSystemGestureCoverSheet();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      unint64_t v10 = v3;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "-[SBCoverSheetPrimarySlidingViewController _createPanelWallpaperEffectViewIfNeeded] - CREATING _panelWallpaperEffectView with panel options 0x%lX", (uint8_t *)&v9, 0xCu);
    }
  }
  int v7 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:0 transformOptions:v3];
  uint64_t v8 = self->_panelWallpaperEffectView;
  self->_panelWallpaperEffectView = v7;

  [(PBUIWallpaperEffectViewBase *)self->_panelWallpaperEffectView setForcesOpaque:1];
  [(PBUIWallpaperEffectViewBase *)self->_panelWallpaperEffectView setFullscreen:0];
  [(PBUIWallpaperEffectViewBase *)self->_panelWallpaperEffectView setStyle:0];
}

- (void)_updateFadeOutWallpaperEffectView
{
  id v4 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  if ([v4 fadesContent])
  {
    [(SBCoverSheetPrimarySlidingViewController *)self _createFadeOutWallpaperEffectViewIfNeeded];
    [(PBUIWallpaperEffectViewBase *)self->_panelFadeOutWallpaperEffectView setStyle:0];
    [(SBCoverSheetPanelBackgroundContainerView *)self->_panelBackgroundContainerView addSubview:self->_panelFadeOutWallpaperEffectView];
    [(SBCoverSheetPanelBackgroundContainerView *)self->_panelBackgroundContainerView sendSubviewToBack:self->_panelFadeOutWallpaperEffectView];
    unint64_t v3 = [(SBCoverSheetPrimarySlidingViewController *)self view];
    [v3 setNeedsLayout];
  }
  else
  {
    [(SBWallpaperEffectView *)self->_panelFadeOutWallpaperEffectView removeFromSuperview];
  }
}

- (void)_createFadeOutWallpaperEffectViewIfNeeded
{
  panelFadeOutWallpaperEffectView = self->_panelFadeOutWallpaperEffectView;
  if (panelFadeOutWallpaperEffectView) {
    [(SBWallpaperEffectView *)panelFadeOutWallpaperEffectView removeFromSuperview];
  }
  if ([(SBCoverSheetPrimarySlidingViewController *)self _maglevActive])
  {
    uint64_t v4 = 19;
  }
  else
  {
    int v5 = _os_feature_enabled_impl();
    int v6 = _os_feature_enabled_impl();
    uint64_t v7 = 19;
    if (v6) {
      uint64_t v7 = 17;
    }
    if (v5) {
      uint64_t v4 = v7;
    }
    else {
      uint64_t v4 = 17;
    }
  }
  uint64_t v8 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1 transformOptions:v4];
  int v9 = self->_panelFadeOutWallpaperEffectView;
  self->_panelFadeOutWallpaperEffectView = v8;

  [(PBUIWallpaperEffectViewBase *)self->_panelFadeOutWallpaperEffectView setForcesOpaque:1];
  unint64_t v10 = self->_panelFadeOutWallpaperEffectView;
  [(PBUIWallpaperEffectViewBase *)v10 setFullscreen:0];
}

- (void)_updateBackgroundIfNecessary
{
  unint64_t v3 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  uint64_t v4 = v3;
  id v13 = v3;
  if (self->_behindCoverSheetBlurView || (v5 = [v3 blursBehindCoverSheet], uint64_t v4 = v13, !v5))
  {
    if ([v4 blursBehindCoverSheet]) {
      goto LABEL_7;
    }
    [(SBCoverSheetBlurView *)self->_behindCoverSheetBlurView removeFromSuperview];
    behindCoverSheetBlurView = self->_behindCoverSheetBlurView;
    self->_behindCoverSheetBlurView = 0;
  }
  else
  {
    int v6 = [SBCoverSheetBlurView alloc];
    uint64_t v7 = -[SBCoverSheetBlurView initWithFrame:scaleAdjustment:alphaAdjustment:](v6, "initWithFrame:scaleAdjustment:alphaAdjustment:", &__block_literal_global_218, &__block_literal_global_68_2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v8 = self->_behindCoverSheetBlurView;
    self->_behindCoverSheetBlurView = v7;

    int v9 = self->_behindCoverSheetBlurView;
    unint64_t v10 = [MEMORY[0x1E4F428B8] blackColor];
    [(SBCoverSheetBlurView *)v9 setDimmingColor:v10];

    [(SBCoverSheetBlurView *)self->_behindCoverSheetBlurView setHidden:1];
    behindCoverSheetBlurView = [(SBCoverSheetPrimarySlidingViewController *)self view];
    [behindCoverSheetBlurView addSubview:self->_behindCoverSheetBlurView];
    [behindCoverSheetBlurView sendSubviewToBack:self->_behindCoverSheetBlurView];
  }

LABEL_7:
  char v12 = self->_behindCoverSheetBlurView;
  [v13 behindCoverSheetBlurRadius];
  -[SBCoverSheetBlurView setBlurRadius:](v12, "setBlurRadius:");
}

double __72__SBCoverSheetPrimarySlidingViewController__updateBackgroundIfNecessary__block_invoke()
{
  return 0.5;
}

uint64_t __72__SBCoverSheetPrimarySlidingViewController__updateBackgroundIfNecessary__block_invoke_2()
{
  return BSIntervalSubIntervalValueForValue();
}

- (void)_setupPanelPartsIfNecessary
{
  unint64_t v3 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  uint64_t v4 = v3;
  if (!self->_panelCoverSheetBlurView)
  {
    int v9 = v3;
    int v5 = [v3 blursPanel];
    uint64_t v4 = v9;
    if (v5)
    {
      int v6 = [SBCoverSheetBlurView alloc];
      uint64_t v7 = -[SBCoverSheetBlurView initWithFrame:scaleAdjustment:alphaAdjustment:](v6, "initWithFrame:scaleAdjustment:alphaAdjustment:", &__block_literal_global_70_2, &__block_literal_global_72, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      panelCoverSheetBlurView = self->_panelCoverSheetBlurView;
      self->_panelCoverSheetBlurView = v7;

      [(SBCoverSheetBlurView *)self->_panelCoverSheetBlurView setBlurRadius:10.0];
      [(SBCoverSheetPanelBackgroundContainerView *)self->_panelBackgroundContainerView addSubview:self->_panelCoverSheetBlurView];
      uint64_t v4 = v9;
    }
  }
}

double __71__SBCoverSheetPrimarySlidingViewController__setupPanelPartsIfNecessary__block_invoke()
{
  int v0 = MEMORY[0x1D9489F40]();
  double result = 0.5;
  if (v0) {
    return 0.25;
  }
  return result;
}

uint64_t __71__SBCoverSheetPrimarySlidingViewController__setupPanelPartsIfNecessary__block_invoke_2()
{
  return BSIntervalSubIntervalValueForValue();
}

- (void)_updateWallpaperScaled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    int v14 = [NSString stringWithUTF8String:"-[SBCoverSheetPrimarySlidingViewController _updateWallpaperScaled:animated:]"];
    [v13 handleFailureInFunction:v14 file:@"SBCoverSheetPrimarySlidingViewController.m" lineNumber:784 description:@"this call must be made on the main thread"];
  }
  uint64_t v7 = [(SBCoverSheetSlidingViewController *)self transitionSettings];
  uint64_t v8 = v7;
  if (v4) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 1;
  }
  unint64_t v10 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v11 = [v7 wallpaperScaleSettings];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__SBCoverSheetPrimarySlidingViewController__updateWallpaperScaled_animated___block_invoke;
  v15[3] = &unk_1E6AF5770;
  BOOL v17 = a3;
  v15[4] = self;
  id v16 = v8;
  id v12 = v8;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v11, v9, v15, 0);
}

void __76__SBCoverSheetPrimarySlidingViewController__updateWallpaperScaled_animated___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) homescreenWallpaperScaleAssertion];
  v2 = [*(id *)(a1 + 32) lockscreenWallpaperScaleAssertion];
  unint64_t v3 = +[SBWallpaperController sharedInstance];
  if (*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 40) wallpaperScale];
    double v5 = v4;
    int v6 = objc_msgSend(v3, "setHomescreenWallpaperScale:withAnimationFactory:", 0);
    if (v8) {
      [v8 invalidate];
    }
    [*(id *)(a1 + 32) setHomescreenWallpaperScaleAssertion:v6];
    uint64_t v7 = [v3 setLockscreenWallpaperScale:0 withAnimationFactory:v5];
    if (v2) {
      [v2 invalidate];
    }
    [*(id *)(a1 + 32) setLockscreenWallpaperScaleAssertion:v7];
  }
  else
  {
    if (v8)
    {
      [v8 invalidate];
      [*(id *)(a1 + 32) setHomescreenWallpaperScaleAssertion:0];
    }
    if (v2)
    {
      [v2 invalidate];
      [*(id *)(a1 + 32) setLockscreenWallpaperScaleAssertion:0];
    }
  }
}

- (SBCoverSheetGrabberDelegate)grabberDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_grabberDelegate);
  return (SBCoverSheetGrabberDelegate *)WeakRetained;
}

- (void)setGrabberDelegate:(id)a3
{
}

- (SBFTouchPassThroughView)unlockedContentOverlayView
{
  return self->_unlockedContentOverlayView;
}

- (void)setUnlockedContentOverlayView:(id)a3
{
}

- (SBCoverSheetPanelBackgroundContainerView)panelBackgroundContainerView
{
  return self->_panelBackgroundContainerView;
}

- (void)setPanelBackgroundContainerView:(id)a3
{
}

- (SBFTouchPassThroughView)parallaxClippingView
{
  return self->_parallaxClippingView;
}

- (void)setParallaxClippingView:(id)a3
{
}

- (SBCoverSheetParallaxContainerView)parallaxContainerView
{
  return self->_parallaxContainerView;
}

- (void)setParallaxContainerView:(id)a3
{
}

- (SBGrabberTongue)grabberTongue
{
  return self->_grabberTongue;
}

- (void)setGrabberTongue:(id)a3
{
}

- (SBCoverSheetBlurView)behindCoverSheetBlurView
{
  return self->_behindCoverSheetBlurView;
}

- (void)setBehindCoverSheetBlurView:(id)a3
{
}

- (SBCoverSheetBlurView)panelCoverSheetBlurView
{
  return self->_panelCoverSheetBlurView;
}

- (void)setPanelCoverSheetBlurView:(id)a3
{
}

- (SBWallpaperEffectView)panelWallpaperEffectView
{
  return self->_panelWallpaperEffectView;
}

- (void)setPanelWallpaperEffectView:(id)a3
{
}

- (SBWallpaperEffectView)panelFadeOutWallpaperEffectView
{
  return self->_panelFadeOutWallpaperEffectView;
}

- (void)setPanelFadeOutWallpaperEffectView:(id)a3
{
}

- (PBUIWallpaperAnimatedInvalidating)homescreenWallpaperScaleAssertion
{
  return self->_homescreenWallpaperScaleAssertion;
}

- (void)setHomescreenWallpaperScaleAssertion:(id)a3
{
}

- (PBUIWallpaperAnimatedInvalidating)lockscreenWallpaperScaleAssertion
{
  return self->_lockscreenWallpaperScaleAssertion;
}

- (void)setLockscreenWallpaperScaleAssertion:(id)a3
{
}

- (double)defaultPresentGestureEdgeRegionSize
{
  return self->_defaultPresentGestureEdgeRegionSize;
}

- (void)setDefaultPresentGestureEdgeRegionSize:(double)a3
{
  self->_double defaultPresentGestureEdgeRegionSize = a3;
}

- (double)presentationProgressAtCommit
{
  return self->_presentationProgressAtCommit;
}

- (void)setPresentationProgressAtCommit:(double)a3
{
  self->_presentationProgressAtCommit = a3;
}

- (BOOL)hasCommittedCurrentTransition
{
  return self->_hasCommittedCurrentTransition;
}

- (void)setHasCommittedCurrentTransition:(BOOL)a3
{
  self->_hasCommittedCurrentTransition = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenWallpaperScaleAssertion, 0);
  objc_storeStrong((id *)&self->_homescreenWallpaperScaleAssertion, 0);
  objc_storeStrong((id *)&self->_panelFadeOutWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_panelWallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_panelCoverSheetBlurView, 0);
  objc_storeStrong((id *)&self->_behindCoverSheetBlurView, 0);
  objc_storeStrong((id *)&self->_grabberTongue, 0);
  objc_storeStrong((id *)&self->_parallaxContainerView, 0);
  objc_storeStrong((id *)&self->_parallaxClippingView, 0);
  objc_storeStrong((id *)&self->_panelBackgroundContainerView, 0);
  objc_storeStrong((id *)&self->_unlockedContentOverlayView, 0);
  objc_destroyWeak((id *)&self->_grabberDelegate);
}

@end