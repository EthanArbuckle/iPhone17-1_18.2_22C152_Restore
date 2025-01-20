@interface SBHPeopleWidgetPersonDetailInteraction
- (CGRect)_sourceContentFrame;
- (CGRect)_targetContentFrame;
- (CGRect)homeScreenContentFrame;
- (CGRect)sourceContentFrame;
- (CGRect)targetContentFrame;
- (MTMaterialView)backgroundView;
- (PPLPeopleEntityViewController)personViewController;
- (SBHModalInteractionDelegate)modalInteractionDelegate;
- (SBHPeopleWidgetPersonDetailInteraction)initWithInteractionContext:(id)a3;
- (SBHPeopleWidgetPersonDetailInteractionContext)interactionContext;
- (SBHPeopleWidgetPersonDetailInteractionSettings)settings;
- (SBHViewControllerTransition)transition;
- (SBIconView)referenceView;
- (SBIconView)sourceView;
- (UIView)backgroundTintView;
- (UIView)containerView;
- (UIView)homeScreenContentView;
- (UIView)platterView;
- (UIView)targetView;
- (UIView)touchBlockingView;
- (double)sourceContentCornerRadius;
- (double)targetContentCornerRadius;
- (id)animatorForTransition:(id)a3;
- (void)_handleTapToDismiss:(id)a3;
- (void)_setUpMatchMoveAnimationForBackgroundView:(id)a3;
- (void)beginInteractionAnimated:(BOOL)a3;
- (void)endInteractionAnimated:(BOOL)a3;
- (void)iconViewDidBecomeWindowless:(id)a3;
- (void)iconViewWasDiscarded:(id)a3;
- (void)iconViewWasRecycled:(id)a3;
- (void)peopleEntityViewControllerDidRequestDismissal:(id)a3;
- (void)prepareTransition:(id)a3;
- (void)setBackgroundTintView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setModalInteractionDelegate:(id)a3;
- (void)setPersonViewController:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setSourceContentCornerRadius:(double)a3;
- (void)setSourceContentFrame:(CGRect)a3;
- (void)setTargetContentFrame:(CGRect)a3;
- (void)setTargetView:(id)a3;
- (void)setTouchBlockingView:(id)a3;
- (void)setTransition:(id)a3;
- (void)transitionDidProgressToEndState:(id)a3;
- (void)transitionDidReturnToBeginningState:(id)a3;
- (void)transitionWillProgressToEndState:(id)a3;
- (void)transitionWillReturnToBeginningState:(id)a3;
@end

@implementation SBHPeopleWidgetPersonDetailInteraction

- (SBHPeopleWidgetPersonDetailInteraction)initWithInteractionContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBHPeopleWidgetPersonDetailInteraction;
  v5 = [(SBHPeopleWidgetPersonDetailInteraction *)&v15 init];
  if (v5)
  {
    v6 = +[SBHHomeScreenDomain rootSettings];
    v7 = [v6 widgetSettings];
    uint64_t v8 = [v7 personDetailInteractionSettings];
    settings = v5->_settings;
    v5->_settings = (SBHPeopleWidgetPersonDetailInteractionSettings *)v8;

    uint64_t v10 = [v4 copy];
    interactionContext = v5->_interactionContext;
    v5->_interactionContext = (SBHPeopleWidgetPersonDetailInteractionContext *)v10;

    v12 = objc_alloc_init(SBHViewControllerTransition);
    transition = v5->_transition;
    v5->_transition = v12;

    [(SBHViewControllerTransition *)v5->_transition setDelegate:v5];
  }

  return v5;
}

- (UIView)containerView
{
  v2 = [(SBHPeopleWidgetPersonDetailInteraction *)self interactionContext];
  v3 = [v2 containerView];

  return (UIView *)v3;
}

- (SBIconView)sourceView
{
  v2 = [(SBHPeopleWidgetPersonDetailInteraction *)self interactionContext];
  v3 = [v2 sourceIconView];

  return (SBIconView *)v3;
}

- (SBIconView)referenceView
{
  v2 = [(SBHPeopleWidgetPersonDetailInteraction *)self interactionContext];
  v3 = [v2 referenceIconView];

  return (SBIconView *)v3;
}

- (double)targetContentCornerRadius
{
  v2 = [(SBHPeopleWidgetPersonDetailInteraction *)self settings];
  if ([v2 usesCardStyle])
  {
    [v2 cardCornerRadius];
  }
  else
  {
    uint64_t v4 = SBHScreenTypeForCurrentDevice();
    double v3 = SBHDisplayCornerRadiusForScreenType(v4);
  }
  double v5 = v3;

  return v5;
}

- (UIView)homeScreenContentView
{
  v2 = [(SBHPeopleWidgetPersonDetailInteraction *)self interactionContext];
  double v3 = [v2 homeScreenContentView];

  return (UIView *)v3;
}

- (CGRect)homeScreenContentFrame
{
  v2 = [(SBHPeopleWidgetPersonDetailInteraction *)self interactionContext];
  [v2 homeScreenContentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)beginInteractionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBHPeopleWidgetPersonDetailInteraction *)self transition];
  [v4 progressToEndStateWithAnimation:v3];
}

- (void)endInteractionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBHPeopleWidgetPersonDetailInteraction *)self transition];
  [v4 returnToBeginningStateWithAnimation:v3];
}

- (void)prepareTransition:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 setUserInfo:self];
  double v6 = [(SBHPeopleWidgetPersonDetailInteraction *)self interactionContext];
  id v7 = objc_alloc(MEMORY[0x1E4F89CC0]);
  double v8 = [v6 personURL];
  double v9 = (void *)[v7 initWithURL:v8];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F89CC8]) initWithMetadata:v9];
  [v10 setDelegate:self];
  [(SBHPeopleWidgetPersonDetailInteraction *)self setPersonViewController:v10];
  double v11 = [v6 containerViewController];
  double v12 = [v6 containerView];
  uint64_t v13 = [v6 sourceIconView];
  double v14 = (void *)v13;
  if (v11 && v12 && v13)
  {
    v59 = (void *)v13;
    v56 = v11;
    objc_super v15 = [v6 referenceIconView];
    [v15 setHighlighted:0];
    v54 = v15;
    [v15 addObserver:self];
    [v12 bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v60 = [(SBHPeopleWidgetPersonDetailInteraction *)self settings];
    v24 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v25 = [v24 userInterfaceIdiom];

    v26 = @"personDetailBackground";
    if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1 && ![v60 usesCardStyle]) {
      v26 = @"personDetailBackground-iPad";
    }
    v27 = (void *)MEMORY[0x1E4F743C8];
    v28 = (void *)MEMORY[0x1E4F28B50];
    v29 = v26;
    v30 = [v28 bundleForClass:objc_opt_class()];
    v31 = [v27 materialViewWithRecipeNamed:v29 inBundle:v30 options:0 initialWeighting:0 scaleAdjustment:0.0];

    objc_msgSend(v31, "setFrame:", v17, v19, v21, v23);
    [v31 setAutoresizingMask:18];
    [v31 setGroupNameBase:@"Person-Detail"];
    [v12 addSubview:v31];
    [(SBHPeopleWidgetPersonDetailInteraction *)self setBackgroundView:v31];
    [(SBHPeopleWidgetPersonDetailInteraction *)self _setUpMatchMoveAnimationForBackgroundView:v31];
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v17, v19, v21, v23);
    [v32 setAutoresizingMask:18];
    objc_msgSend(v32, "bs_setHitTestingDisabled:", 1);
    v57 = v9;
    id v58 = v5;
    v55 = v6;
    if ([v60 usesCardStyle]) {
      [v60 cardStyleDarkeningTintAlpha];
    }
    else {
      [v60 fullScreenDarkeningTintAlpha];
    }
    v53 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:v33];
    [v32 setBackgroundColor:v53];
    [v32 setAlpha:0.0];
    [v12 addSubview:v32];
    [(SBHPeopleWidgetPersonDetailInteraction *)self setBackgroundTintView:v32];
    [(SBHPeopleWidgetPersonDetailInteraction *)self _setUpMatchMoveAnimationForBackgroundView:v32];
    v52 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapToDismiss_];
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v17, v19, v21, v23);
    [v35 addGestureRecognizer:v52];
    [(SBHPeopleWidgetPersonDetailInteraction *)self setTouchBlockingView:v35];
    [v12 addSubview:v35];
    v36 = [v59 customIconImageViewController];
    [v36 continuousCornerRadius];
    double v38 = v37;

    [(SBHPeopleWidgetPersonDetailInteraction *)self setSourceContentCornerRadius:v38];
    [(SBHPeopleWidgetPersonDetailInteraction *)self _sourceContentFrame];
    -[SBHPeopleWidgetPersonDetailInteraction setSourceContentFrame:](self, "setSourceContentFrame:");
    [(SBHPeopleWidgetPersonDetailInteraction *)self _targetContentFrame];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    -[SBHPeopleWidgetPersonDetailInteraction setTargetContentFrame:](self, "setTargetContentFrame:");
    v47 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v40, v42, v44, v46);
    [MEMORY[0x1E4F743C8] materialViewWithRecipe:3];
    v49 = v48 = v12;
    [v47 bounds];
    objc_msgSend(v49, "setFrame:");
    [v49 setAutoresizingMask:18];
    [v47 addSubview:v49];
    [v47 setClipsToBounds:1];
    [(SBHPeopleWidgetPersonDetailInteraction *)self setPlatterView:v47];
    v50 = [v10 view];
    objc_msgSend(v50, "setFrame:", v40, v42, v44, v46);
    double v11 = v56;
    objc_msgSend(v56, "bs_addChildViewController:withSuperview:", v10, v48);
    [(SBHPeopleWidgetPersonDetailInteraction *)self setTargetView:v50];

    double v12 = v48;
    double v14 = v59;

    double v9 = v57;
    id v5 = v58;
    double v6 = v55;
  }
  else
  {
    v34 = SBLogIcon();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138544386;
      v62 = self;
      __int16 v63 = 2114;
      v64 = v51;
      __int16 v65 = 2114;
      v66 = v11;
      __int16 v67 = 2114;
      v68 = v12;
      __int16 v69 = 2114;
      v70 = v14;
      _os_log_error_impl(&dword_1D7F0A000, v34, OS_LOG_TYPE_ERROR, "[%{public}@]: %{public}@ failed to create a new presentation for container view controller: %{public}@ -- container view: %{public}@ -- source view: %{public}@", buf, 0x34u);
    }
    [v5 returnToBeginningStateWithAnimation:0];
  }
}

- (id)animatorForTransition:(id)a3
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  id v4 = off_1E6AAB860;
  if (!IsReduceMotionEnabled) {
    id v4 = off_1E6AAB878;
  }
  id v5 = objc_alloc_init(*v4);
  return v5;
}

- (void)transitionWillProgressToEndState:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    double v8 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presenting", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(SBHPeopleWidgetPersonDetailInteraction *)self touchBlockingView];
  [v5 setHidden:0];

  double v6 = [(SBHPeopleWidgetPersonDetailInteraction *)self modalInteractionDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 modalInteractionWillBegin:self];
  }
}

- (void)transitionDidProgressToEndState:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: presentation finished", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(SBHPeopleWidgetPersonDetailInteraction *)self modalInteractionDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 modalInteractionDidBegin:self];
  }
}

- (void)transitionWillReturnToBeginningState:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    uint64_t v8 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [(SBHPeopleWidgetPersonDetailInteraction *)self touchBlockingView];
  [v5 setHidden:1];

  int v6 = [(SBHPeopleWidgetPersonDetailInteraction *)self modalInteractionDelegate];
  if (objc_opt_respondsToSelector()) {
    [v6 modalInteractionWillEnd:self];
  }
}

- (void)transitionDidReturnToBeginningState:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543362;
    double v21 = self;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissal finished", (uint8_t *)&v20, 0xCu);
  }

  [v4 setUserInfo:0];
  int v6 = [(SBHPeopleWidgetPersonDetailInteraction *)self backgroundView];
  [v6 removeFromSuperview];

  int v7 = [(SBHPeopleWidgetPersonDetailInteraction *)self backgroundTintView];
  [v7 removeFromSuperview];

  uint64_t v8 = [(SBHPeopleWidgetPersonDetailInteraction *)self interactionContext];
  uint64_t v9 = [v8 containerViewController];
  double v10 = [(SBHPeopleWidgetPersonDetailInteraction *)self personViewController];
  objc_msgSend(v9, "bs_removeChildViewController:", v10);

  [(SBHPeopleWidgetPersonDetailInteraction *)self setPersonViewController:0];
  double v11 = [(SBHPeopleWidgetPersonDetailInteraction *)self interactionContext];
  double v12 = [v11 sourceIconView];

  [v12 invalidate];
  uint64_t v13 = [(SBHPeopleWidgetPersonDetailInteraction *)self referenceView];
  [v13 setIconLabelAlpha:1.0];
  [v13 setIconImageAlpha:1.0];
  [v13 setAlpha:1.0];
  [v13 setHidden:0];
  [v13 removeObserver:self];
  [(SBHPeopleWidgetPersonDetailInteraction *)self setBackgroundView:0];
  [(SBHPeopleWidgetPersonDetailInteraction *)self setBackgroundTintView:0];
  double v14 = [(SBHPeopleWidgetPersonDetailInteraction *)self touchBlockingView];
  [v14 removeFromSuperview];

  [(SBHPeopleWidgetPersonDetailInteraction *)self setTouchBlockingView:0];
  double v15 = *MEMORY[0x1E4F1DB28];
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  -[SBHPeopleWidgetPersonDetailInteraction setSourceContentFrame:](self, "setSourceContentFrame:", *MEMORY[0x1E4F1DB28], v16, v17, v18);
  -[SBHPeopleWidgetPersonDetailInteraction setTargetContentFrame:](self, "setTargetContentFrame:", v15, v16, v17, v18);
  double v19 = [(SBHPeopleWidgetPersonDetailInteraction *)self modalInteractionDelegate];
  if (objc_opt_respondsToSelector()) {
    [v19 modalInteractionDidEnd:self];
  }
}

- (void)iconViewWasRecycled:(id)a3
{
}

- (void)iconViewDidBecomeWindowless:(id)a3
{
}

- (void)iconViewWasDiscarded:(id)a3
{
}

- (void)peopleEntityViewControllerDidRequestDismissal:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHPeopleWidgetPersonDetailInteraction *)self personViewController];

  if (v5 == v4)
  {
    int v6 = SBLogIcon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      uint64_t v8 = self;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing due to view controller request", (uint8_t *)&v7, 0xCu);
    }

    [(SBHPeopleWidgetPersonDetailInteraction *)self endInteractionAnimated:1];
  }
}

- (void)_handleTapToDismiss:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = SBLogIcon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: dismissing due to user tap", (uint8_t *)&v5, 0xCu);
  }

  [(SBHPeopleWidgetPersonDetailInteraction *)self endInteractionAnimated:1];
}

- (CGRect)_sourceContentFrame
{
  BOOL v3 = [(SBHPeopleWidgetPersonDetailInteraction *)self referenceView];
  [v3 iconImageFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(SBHPeopleWidgetPersonDetailInteraction *)self containerView];
  objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_targetContentFrame
{
  BOOL v3 = [(SBHPeopleWidgetPersonDetailInteraction *)self settings];
  double v4 = [(SBHPeopleWidgetPersonDetailInteraction *)self containerView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  if ([v3 usesCardStyle])
  {
    double v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];

    [(SBHPeopleWidgetPersonDetailInteraction *)self sourceContentFrame];
    UIRectGetCenter();
    double v14 = [(SBHPeopleWidgetPersonDetailInteraction *)self containerView];
    double v15 = [v14 window];
    uint64_t v16 = [v15 interfaceOrientation];

    [v3 cardWidth];
    if ((unint64_t)(v16 - 1) > 1) {
      [v3 cardHeightLandscape];
    }
    else {
      [v3 cardHeightPortrait];
    }
    UIRectCenteredAboutPointScale();
    [v3 fractionBetweenSourceAndContainerX];
    [v3 fractionBetweenSourceAndContainerY];
    UIRectGetCenter();
    UIRectCenteredAboutPointScale();
    [v3 percentMargin];
    UICeilToScale();
    UICeilToScale();
    UIRectContainInRect();
    double v6 = v17;
    double v8 = v18;
    double v10 = v19;
    double v12 = v20;
  }

  double v21 = v6;
  double v22 = v8;
  double v23 = v10;
  double v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_setUpMatchMoveAnimationForBackgroundView:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4FA5E88];
  id v5 = a3;
  double v6 = [(SBHPeopleWidgetPersonDetailInteraction *)self containerView];
  double v7 = [v6 window];
  id v8 = [v4 matchMoveAnimationForPinningToView:v7];

  [v5 addAnimation:v8 forKey:@"SBHPersonDetailInteractionBackgroundMatchMoveAnimation"];
}

- (SBHModalInteractionDelegate)modalInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->modalInteractionDelegate);
  return (SBHModalInteractionDelegate *)WeakRetained;
}

- (void)setModalInteractionDelegate:(id)a3
{
}

- (SBHPeopleWidgetPersonDetailInteractionContext)interactionContext
{
  return self->_interactionContext;
}

- (SBHPeopleWidgetPersonDetailInteractionSettings)settings
{
  return self->_settings;
}

- (PPLPeopleEntityViewController)personViewController
{
  return self->_personViewController;
}

- (void)setPersonViewController:(id)a3
{
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
}

- (CGRect)sourceContentFrame
{
  double x = self->_sourceContentFrame.origin.x;
  double y = self->_sourceContentFrame.origin.y;
  double width = self->_sourceContentFrame.size.width;
  double height = self->_sourceContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceContentFrame:(CGRect)a3
{
  self->_sourceContentFrame = a3;
}

- (double)sourceContentCornerRadius
{
  return self->_sourceContentCornerRadius;
}

- (void)setSourceContentCornerRadius:(double)a3
{
  self->_sourceContentCornerRadius = a3;
}

- (CGRect)targetContentFrame
{
  double x = self->_targetContentFrame.origin.x;
  double y = self->_targetContentFrame.origin.y;
  double width = self->_targetContentFrame.size.width;
  double height = self->_targetContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetContentFrame:(CGRect)a3
{
  self->_targetContentFrame = a3;
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundTintView
{
  return self->_backgroundTintView;
}

- (void)setBackgroundTintView:(id)a3
{
}

- (UIView)touchBlockingView
{
  return self->_touchBlockingView;
}

- (void)setTouchBlockingView:(id)a3
{
}

- (SBHViewControllerTransition)transition
{
  return self->_transition;
}

- (void)setTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transition, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);
  objc_storeStrong((id *)&self->_backgroundTintView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_personViewController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_interactionContext, 0);
  objc_destroyWeak((id *)&self->modalInteractionDelegate);
}

@end