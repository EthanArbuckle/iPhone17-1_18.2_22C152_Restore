@interface SBDeviceApplicationSceneClassicAccessoryView
- (BOOL)_isZoomed;
- (BOOL)_rotationButtonShouldBeVisible;
- (BOOL)_zoomButtonShouldBeVisible;
- (SBDeviceApplicationSceneClassicAccessoryView)initWithFrame:(CGRect)a3 sceneHandle:(id)a4;
- (SBDeviceApplicationSceneClassicAccessoryViewDelegate)delegate;
- (SBDeviceApplicationSceneHandle)sceneHandle;
- (int64_t)buttonOrientation;
- (void)_changeZoom:(id)a3;
- (void)_rotateApplicationScene:(id)a3;
- (void)_sceneHandleDidUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4;
- (void)_sceneHandleDidUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4;
- (void)_setupPositioningAndRotationForInterfaceOrientation:(int64_t)a3 offscreen:(BOOL)a4;
- (void)_updateButtonVisibilityAnimated:(BOOL)a3;
- (void)_updateOrientationFrom:(int64_t)a3 toOrientation:(int64_t)a4 animationSettings:(id)a5;
- (void)_updateRotationButton;
- (void)_updateRotationButtonConstraints;
- (void)_updateRotationButtonWithAnimationSettings:(id)a3;
- (void)_updateZoomButton;
- (void)dealloc;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setButtonOrientation:(int64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBDeviceApplicationSceneClassicAccessoryView

- (SBDeviceApplicationSceneClassicAccessoryView)initWithFrame:(CGRect)a3 sceneHandle:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v92[4] = *MEMORY[0x1E4F143B8];
  id v83 = a4;
  v91.receiver = self;
  v91.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryView;
  v10 = -[SBDeviceApplicationSceneClassicAccessoryView initWithFrame:](&v91, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_sceneHandle, a4);
    v12 = [(SBDeviceApplicationSceneHandle *)v11->_sceneHandle sceneIfExists];
    v13 = [v12 uiClientSettings];
    v11->_buttonOrientation = [v13 interfaceOrientation];

    uint64_t v14 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    zoomButton = v11->_zoomButton;
    v11->_zoomButton = (UIButton *)v14;

    [(SBDeviceApplicationSceneClassicAccessoryView *)v11 _updateZoomButton];
    [(UIButton *)v11->_zoomButton sizeToFit];
    [(UIButton *)v11->_zoomButton addTarget:v11 action:sel__changeZoom_ forControlEvents:64];
    uint64_t v16 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    clockWiseRotationButton = v11->_clockWiseRotationButton;
    v11->_clockWiseRotationButton = (UIButton *)v16;

    uint64_t v18 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    counterClockWiseRotationButton = v11->_counterClockWiseRotationButton;
    v11->_counterClockWiseRotationButton = (UIButton *)v18;

    [(SBDeviceApplicationSceneClassicAccessoryView *)v11 _updateRotationButton];
    [(UIButton *)v11->_clockWiseRotationButton sizeToFit];
    [(UIButton *)v11->_counterClockWiseRotationButton sizeToFit];
    [(UIButton *)v11->_clockWiseRotationButton addTarget:v11 action:sel__rotateApplicationScene_ forControlEvents:64];
    [(UIButton *)v11->_counterClockWiseRotationButton addTarget:v11 action:sel__rotateApplicationScene_ forControlEvents:64];
    id v20 = objc_alloc(MEMORY[0x1E4F4F8D0]);
    [(SBDeviceApplicationSceneClassicAccessoryView *)v11 bounds];
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:");
    transformWrapperView = v11->_transformWrapperView;
    v11->_transformWrapperView = (BSUIOrientationTransformWrapperView *)v21;

    [(BSUIOrientationTransformWrapperView *)v11->_transformWrapperView setContentOrientation:v11->_buttonOrientation];
    [(BSUIOrientationTransformWrapperView *)v11->_transformWrapperView setContainerOrientation:v11->_buttonOrientation];
    id v23 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBDeviceApplicationSceneClassicAccessoryView *)v11 bounds];
    uint64_t v24 = objc_msgSend(v23, "initWithFrame:");
    buttonWrapperView = v11->_buttonWrapperView;
    v11->_buttonWrapperView = (UIView *)v24;

    [(UIView *)v11->_buttonWrapperView addSubview:v11->_zoomButton];
    [(UIView *)v11->_buttonWrapperView addSubview:v11->_clockWiseRotationButton];
    [(UIView *)v11->_buttonWrapperView addSubview:v11->_counterClockWiseRotationButton];
    [(BSUIOrientationTransformWrapperView *)v11->_transformWrapperView addContentView:v11->_buttonWrapperView];
    [(SBDeviceApplicationSceneClassicAccessoryView *)v11 addSubview:v11->_transformWrapperView];
    [(UIButton *)v11->_zoomButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(UIButton *)v11->_zoomButton trailingAnchor];
    v27 = [(UIView *)v11->_buttonWrapperView trailingAnchor];
    uint64_t v28 = [v26 constraintEqualToAnchor:v27];
    zoomButtonHorizontalConstraint = v11->_zoomButtonHorizontalConstraint;
    v11->_zoomButtonHorizontalConstraint = (NSLayoutConstraint *)v28;

    v30 = [(UIButton *)v11->_zoomButton bottomAnchor];
    v31 = [(UIView *)v11->_buttonWrapperView bottomAnchor];
    uint64_t v32 = [v30 constraintEqualToAnchor:v31];
    zoomButtonVerticalConstraint = v11->_zoomButtonVerticalConstraint;
    v11->_zoomButtonVerticalConstraint = (NSLayoutConstraint *)v32;

    v34 = [(UIButton *)v11->_zoomButton widthAnchor];
    uint64_t v35 = [v34 constraintEqualToConstant:48.0];
    zoomButtonWidthConstraint = v11->_zoomButtonWidthConstraint;
    v11->_zoomButtonWidthConstraint = (NSLayoutConstraint *)v35;

    v37 = [(UIButton *)v11->_zoomButton heightAnchor];
    uint64_t v38 = [v37 constraintEqualToConstant:48.0];
    zoomButtonHeightConstraint = v11->_zoomButtonHeightConstraint;
    v11->_zoomButtonHeightConstraint = (NSLayoutConstraint *)v38;

    [(NSLayoutConstraint *)v11->_zoomButtonHorizontalConstraint setActive:1];
    [(NSLayoutConstraint *)v11->_zoomButtonVerticalConstraint setActive:1];
    [(NSLayoutConstraint *)v11->_zoomButtonWidthConstraint setActive:1];
    [(NSLayoutConstraint *)v11->_zoomButtonHeightConstraint setActive:1];
    [(UIButton *)v11->_clockWiseRotationButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v11->_counterClockWiseRotationButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = [(UIButton *)v11->_clockWiseRotationButton widthAnchor];
    v41 = [v40 constraintEqualToConstant:48.0];
    [v41 setActive:1];

    v42 = [(UIButton *)v11->_clockWiseRotationButton heightAnchor];
    v43 = [v42 constraintEqualToConstant:48.0];
    [v43 setActive:1];

    v44 = [(UIButton *)v11->_clockWiseRotationButton topAnchor];
    v45 = [(UIButton *)v11->_zoomButton topAnchor];
    uint64_t v46 = [v44 constraintEqualToAnchor:v45];
    rotationButtonTopConstraint = v11->_rotationButtonTopConstraint;
    v11->_rotationButtonTopConstraint = (NSLayoutConstraint *)v46;

    v48 = [(UIButton *)v11->_clockWiseRotationButton bottomAnchor];
    v49 = [(UIButton *)v11->_zoomButton topAnchor];
    uint64_t v50 = [v48 constraintEqualToAnchor:v49 constant:-16.0];
    rotationButtonBottomConstraint = v11->_rotationButtonBottomConstraint;
    v11->_rotationButtonBottomConstraint = (NSLayoutConstraint *)v50;

    v52 = [(UIButton *)v11->_clockWiseRotationButton leadingAnchor];
    v53 = [(UIButton *)v11->_zoomButton leadingAnchor];
    uint64_t v54 = [v52 constraintEqualToAnchor:v53];
    rotationButtonLeadingConstraint = v11->_rotationButtonLeadingConstraint;
    v11->_rotationButtonLeadingConstraint = (NSLayoutConstraint *)v54;

    v56 = [(UIButton *)v11->_clockWiseRotationButton trailingAnchor];
    v57 = [(UIButton *)v11->_zoomButton leadingAnchor];
    uint64_t v58 = [v56 constraintEqualToAnchor:v57 constant:-16.0];
    rotationButtonTrailingConstraint = v11->_rotationButtonTrailingConstraint;
    v11->_rotationButtonTrailingConstraint = (NSLayoutConstraint *)v58;

    v78 = (void *)MEMORY[0x1E4F28DC8];
    v81 = [(UIButton *)v11->_counterClockWiseRotationButton centerYAnchor];
    v82 = [(UIButton *)v11->_clockWiseRotationButton centerYAnchor];
    v80 = [v81 constraintEqualToAnchor:v82];
    v92[0] = v80;
    v79 = [(UIButton *)v11->_counterClockWiseRotationButton centerXAnchor];
    v60 = [(UIButton *)v11->_clockWiseRotationButton centerXAnchor];
    v61 = [v79 constraintEqualToAnchor:v60];
    v92[1] = v61;
    v62 = [(UIButton *)v11->_counterClockWiseRotationButton heightAnchor];
    v63 = [(UIButton *)v11->_clockWiseRotationButton heightAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
    v92[2] = v64;
    v65 = [(UIButton *)v11->_counterClockWiseRotationButton widthAnchor];
    v66 = [(UIButton *)v11->_clockWiseRotationButton heightAnchor];
    v67 = [v65 constraintEqualToAnchor:v66];
    v92[3] = v67;
    v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:4];
    [v78 activateConstraints:v68];

    [(SBDeviceApplicationSceneClassicAccessoryView *)v11 _setupPositioningAndRotationForInterfaceOrientation:v11->_buttonOrientation offscreen:0];
    [(SBDeviceApplicationSceneClassicAccessoryView *)v11 _updateButtonVisibilityAnimated:0];
    objc_initWeak(&location, v11);
    v69 = (SBSceneHandleBlockObserver *)objc_alloc_init(MEMORY[0x1E4FA7978]);
    sceneHandleObserver = v11->_sceneHandleObserver;
    v11->_sceneHandleObserver = v69;

    [v83 addObserver:v11->_sceneHandleObserver];
    v71 = v11->_sceneHandleObserver;
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke;
    v88[3] = &unk_1E6AFF110;
    objc_copyWeak(&v89, &location);
    id v72 = (id)[(SBSceneHandleBlockObserver *)v71 observeCreate:v88];
    v73 = v11->_sceneHandleObserver;
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke_2;
    v86[3] = &unk_1E6AFF138;
    objc_copyWeak(&v87, &location);
    id v74 = (id)[(SBSceneHandleBlockObserver *)v73 observeDidUpdateClientSettings:v86];
    v75 = v11->_sceneHandleObserver;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke_3;
    v84[3] = &unk_1E6AFF160;
    objc_copyWeak(&v85, &location);
    id v76 = (id)[(SBSceneHandleBlockObserver *)v75 observeDidUpdateSettings:v84];
    objc_destroyWeak(&v85);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&location);
  }

  return v11;
}

void __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [v7 uiClientSettings];
    uint64_t v6 = objc_msgSend(v5, "sb_effectiveInterfaceOrientation");

    [WeakRetained _setupPositioningAndRotationForInterfaceOrientation:v6 offscreen:0];
    WeakRetained[57] = v6;
    [WeakRetained _updateButtonVisibilityAnimated:1];
    [WeakRetained setNeedsLayout];
  }
}

void __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _sceneHandleDidUpdateClientSettingsWithDiff:v7 transitionContext:v6];
}

void __74__SBDeviceApplicationSceneClassicAccessoryView_initWithFrame_sceneHandle___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _sceneHandleDidUpdateSettingsWithDiff:v7 previousSettings:v6];
}

- (void)dealloc
{
  [(SBSceneHandleBlockObserver *)self->_sceneHandleObserver invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryView;
  [(SBDeviceApplicationSceneClassicAccessoryView *)&v3 dealloc];
}

- (void)invalidate
{
  [(SBSceneHandleBlockObserver *)self->_sceneHandleObserver invalidate];
  sceneHandleObserver = self->_sceneHandleObserver;
  self->_sceneHandleObserver = 0;

  [(UIApplicationSceneClientSettingsDiffInspector *)self->_clientSettingsInspector removeAllObservers];
  clientSettingsInspector = self->_clientSettingsInspector;
  self->_clientSettingsInspector = 0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryView;
  [(SBDeviceApplicationSceneClassicAccessoryView *)&v4 layoutSubviews];
  [(BSUIOrientationTransformWrapperView *)self->_transformWrapperView setContentOrientation:self->_buttonOrientation];
  [(BSUIOrientationTransformWrapperView *)self->_transformWrapperView setContainerOrientation:self->_buttonOrientation];
  transformWrapperView = self->_transformWrapperView;
  [(SBDeviceApplicationSceneClassicAccessoryView *)self bounds];
  -[BSUIOrientationTransformWrapperView setFrame:](transformWrapperView, "setFrame:");
  [(SBDeviceApplicationSceneClassicAccessoryView *)self _setupPositioningAndRotationForInterfaceOrientation:self->_buttonOrientation offscreen:0];
}

- (void)_updateButtonVisibilityAnimated:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__SBDeviceApplicationSceneClassicAccessoryView__updateButtonVisibilityAnimated___block_invoke;
  v5[3] = &__block_descriptor_33_e21_v20__0__UIButton_8B16l;
  BOOL v6 = a3;
  objc_super v4 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v5, a2);
  ((void (**)(void, UIButton *, BOOL))v4)[2](v4, self->_zoomButton, [(SBDeviceApplicationSceneClassicAccessoryView *)self _zoomButtonShouldBeVisible]);
  ((void (**)(void, UIButton *, BOOL))v4)[2](v4, self->_clockWiseRotationButton, [(SBDeviceApplicationSceneClassicAccessoryView *)self _rotationButtonShouldBeVisible]);
  ((void (**)(void, UIButton *, BOOL))v4)[2](v4, self->_counterClockWiseRotationButton, [(SBDeviceApplicationSceneClassicAccessoryView *)self _rotationButtonShouldBeVisible]);
}

void __80__SBDeviceApplicationSceneClassicAccessoryView__updateButtonVisibilityAnimated___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  [v5 alpha];
  if ((((v6 != 1.0) ^ a3) & 1) == 0)
  {
    if (a3) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.0;
    }
    if (*(unsigned char *)(a1 + 32))
    {
      if (a3) {
        double v8 = 0.3;
      }
      else {
        double v8 = 0.1;
      }
      v9 = (void *)MEMORY[0x1E4F42FF0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __80__SBDeviceApplicationSceneClassicAccessoryView__updateButtonVisibilityAnimated___block_invoke_2;
      v10[3] = &unk_1E6AF4A70;
      id v11 = v5;
      double v12 = v7;
      [v9 animateWithDuration:4 delay:v10 options:0 animations:v8 completion:0.0];
    }
    else
    {
      [v5 setAlpha:v7];
    }
  }
}

uint64_t __80__SBDeviceApplicationSceneClassicAccessoryView__updateButtonVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (BOOL)_isZoomed
{
  v2 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  char v3 = [v2 classicAppZoomedIn];

  return v3;
}

- (void)_updateZoomButton
{
  BOOL v3 = [(SBDeviceApplicationSceneClassicAccessoryView *)self _isZoomed];
  if (v3) {
    objc_super v4 = @"scaleDown";
  }
  else {
    objc_super v4 = @"scaleUp";
  }
  if (v3) {
    id v5 = @"scaleDownHighlight";
  }
  else {
    id v5 = @"scaleUpHighlight";
  }
  id v7 = [MEMORY[0x1E4F42A80] imageNamed:v4];
  double v6 = [MEMORY[0x1E4F42A80] imageNamed:v5];
  [(UIButton *)self->_zoomButton setImage:v7 forState:0];
  [(UIButton *)self->_zoomButton setImage:v6 forState:1];
}

- (void)_changeZoom:(id)a3
{
  BOOL v4 = [(SBDeviceApplicationSceneClassicAccessoryView *)self _isZoomed];
  id v5 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
  [v5 _setClassicAppZoomedIn:!v4];

  [(SBDeviceApplicationSceneClassicAccessoryView *)self _updateZoomButton];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    if (v4) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    double v8 = (void *)MEMORY[0x1E4F42FF0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__SBDeviceApplicationSceneClassicAccessoryView__changeZoom___block_invoke;
    v9[3] = &unk_1E6AF4A70;
    id v10 = WeakRetained;
    uint64_t v11 = v7;
    [v8 _animateUsingSpringWithDuration:0 delay:v9 options:0 mass:0.7 stiffness:0.0 damping:1.0 initialVelocity:158.0 animations:115.0 completion:0.0];
  }
}

uint64_t __60__SBDeviceApplicationSceneClassicAccessoryView__changeZoom___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applicationSceneCompatibilityModeAnimatingChangeTo:*(void *)(a1 + 40)];
}

- (BOOL)_zoomButtonShouldBeVisible
{
  BOOL v3 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  BOOL v4 = [v3 uiSettings];

  int v5 = [v4 isForeground];
  uint64_t v6 = [v4 deactivationReasons] & 0x28;
  char v7 = [v4 isOccluded];
  double v8 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle _windowScene];
  v9 = [v8 switcherController];

  if ([v9 isChamoisWindowingUIEnabled])
  {
    id v10 = [(SBApplicationSceneHandle *)self->_sceneHandle application];
    char v11 = [v10 classicAppPhoneAppRunningOnPad];

    if (v6) {
      int v12 = 0;
    }
    else {
      int v12 = v5;
    }
    if (v12 == 1) {
      char v13 = (v7 | v11) ^ 1;
    }
    else {
      char v13 = 0;
    }
  }
  else
  {
    char v14 = v7 ^ 1;
    if (v6) {
      char v14 = 0;
    }
    if (v5) {
      char v13 = v14;
    }
    else {
      char v13 = 0;
    }
  }

  return v13;
}

- (void)_updateRotationButton
{
  BOOL v3 = [(SBDeviceApplicationSceneClassicAccessoryView *)self sceneHandle];
  uint64_t v4 = [v3 currentInterfaceOrientation];

  if (v4 == 1) {
    int v5 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__clockWiseRotationButton;
  }
  else {
    int v5 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__counterClockWiseRotationButton;
  }
  uint64_t v6 = 2 * (v4 == 1);
  if (v4 == 1) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 3;
  }
  id v20 = *(id *)((char *)&self->super.super.super.isa + *v5);
  id v8 = objc_alloc(MEMORY[0x1E4F42A80]);
  id v9 = [MEMORY[0x1E4F42A80] imageNamed:@"rotateLeft"];
  id v10 = objc_msgSend(v8, "initWithCGImage:imageOrientation:", objc_msgSend(v9, "CGImage"), v6);

  id v11 = objc_alloc(MEMORY[0x1E4F42A80]);
  id v12 = [MEMORY[0x1E4F42A80] imageNamed:@"rotateLeftHighlight"];
  char v13 = objc_msgSend(v11, "initWithCGImage:imageOrientation:", objc_msgSend(v12, "CGImage"), v6);

  id v14 = objc_alloc(MEMORY[0x1E4F42A80]);
  id v15 = [MEMORY[0x1E4F42A80] imageNamed:@"rotateRight"];
  uint64_t v16 = objc_msgSend(v14, "initWithCGImage:imageOrientation:", objc_msgSend(v15, "CGImage"), v7);

  id v17 = objc_alloc(MEMORY[0x1E4F42A80]);
  id v18 = [MEMORY[0x1E4F42A80] imageNamed:@"rotateRightHighlight"];
  v19 = objc_msgSend(v17, "initWithCGImage:imageOrientation:", objc_msgSend(v18, "CGImage"), v7);

  [(UIButton *)self->_clockWiseRotationButton setImage:v16 forState:0];
  [(UIButton *)self->_clockWiseRotationButton setImage:v19 forState:1];
  [(UIButton *)self->_counterClockWiseRotationButton setImage:v10 forState:0];
  [(UIButton *)self->_counterClockWiseRotationButton setImage:v13 forState:1];
  [(UIView *)self->_buttonWrapperView bringSubviewToFront:v20];
}

- (void)_updateRotationButtonConstraints
{
  uint64_t v3 = [(id)SBApp interfaceOrientationForCurrentDeviceOrientation:0];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if ((unint64_t)(v3 - 3) > 1) {
      return;
    }
    uint64_t v4 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonTrailingConstraint;
    int v5 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonTopConstraint;
    uint64_t v6 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonLeadingConstraint;
    uint64_t v7 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonBottomConstraint;
  }
  else
  {
    uint64_t v4 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonLeadingConstraint;
    int v5 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonBottomConstraint;
    uint64_t v6 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonTrailingConstraint;
    uint64_t v7 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__rotationButtonTopConstraint;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v7) setActive:0];
  [*(id *)((char *)&self->super.super.super.isa + *v6) setActive:0];
  [*(id *)((char *)&self->super.super.super.isa + *v5) setActive:1];
  id v8 = *(Class *)((char *)&self->super.super.super.isa + *v4);
  [v8 setActive:1];
}

- (BOOL)_rotationButtonShouldBeVisible
{
  uint64_t v3 = [(SBDeviceApplicationSceneHandle *)self->_sceneHandle sceneIfExists];
  uint64_t v4 = v3;
  BOOL v7 = v3
    && ([v3 uiClientSettings],
        int v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = ~[v5 supportedInterfaceOrientations],
        v5,
        (v6 & 0x1A) == 0)
    && [(SBDeviceApplicationSceneClassicAccessoryView *)self _zoomButtonShouldBeVisible];

  return v7;
}

- (void)_rotateApplicationScene:(id)a3
{
  sceneHandle = self->_sceneHandle;
  id v5 = a3;
  [(SBDeviceApplicationSceneHandle *)self->_sceneHandle _setClassicAppPhoneOnPadPrefersLandscape:[(SBDeviceApplicationSceneHandle *)sceneHandle _classicAppPhoneOnPadPrefersLandscape] ^ 1];

  self->_rotatingFromButtonTap = v5 != 0;
  id v6 = [(SBDeviceApplicationSceneClassicAccessoryView *)self delegate];
  [v6 noteApplicationClassicPhoneSceneOrientationPreferenceChangingForUserAction:self->_rotatingFromButtonTap];
}

- (void)_sceneHandleDidUpdateClientSettingsWithDiff:(id)a3 transitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = [NSString stringWithUTF8String:"-[SBDeviceApplicationSceneClassicAccessoryView _sceneHandleDidUpdateClientSettingsWithDiff:transitionContext:]"];
    [v13 handleFailureInFunction:v14 file:@"SBDeviceApplicationSceneClassicAccessoryView.m" lineNumber:327 description:@"this call must be made on the main thread"];
  }
  clientSettingsInspector = self->_clientSettingsInspector;
  if (!clientSettingsInspector)
  {
    id v9 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42768]);
    id v10 = self->_clientSettingsInspector;
    self->_clientSettingsInspector = v9;

    objc_initWeak(&location, self);
    id v11 = self->_clientSettingsInspector;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke;
    v17[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v18, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v11 observeInterfaceOrientationWithBlock:v17];
    id v12 = self->_clientSettingsInspector;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __110__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2;
    v15[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v16, &location);
    [(UIApplicationSceneClientSettingsDiffInspector *)v12 observeSupportedInterfaceOrientationsWithBlock:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    clientSettingsInspector = self->_clientSettingsInspector;
  }
  [(UIApplicationSceneClientSettingsDiffInspector *)clientSettingsInspector inspectDiff:v6 withContext:v7];
}

void __110__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[472])
  {
    id v14 = WeakRetained;
    uint64_t v4 = [WeakRetained sceneHandle];
    id v5 = [v4 sceneIfExists];

    id v6 = [v5 uiClientSettings];
    uint64_t v7 = [v6 interfaceOrientation];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = v14[57];
      if (v9 != v7)
      {
        id v10 = a2;
        id v11 = [v10 animationSettings];
        [v14 _updateOrientationFrom:v9 toOrientation:v8 animationSettings:v11];
        [v14 setNeedsLayout];
        id v12 = (void *)MEMORY[0x1E4F42D58];
        char v13 = [v10 animationFence];

        [v12 _synchronizeDrawingWithFence:v13];
      }
    }

    id WeakRetained = v14;
  }
}

void __110__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateClientSettingsWithDiff_transitionContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateButtonVisibilityAnimated:1];
  if (([WeakRetained _rotationButtonShouldBeVisible] & 1) == 0)
  {
    v1 = [WeakRetained sceneHandle];
    [v1 _setClassicAppPhoneOnPadPrefersLandscape:0];
  }
}

- (void)_sceneHandleDidUpdateSettingsWithDiff:(id)a3 previousSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = [NSString stringWithUTF8String:"-[SBDeviceApplicationSceneClassicAccessoryView _sceneHandleDidUpdateSettingsWithDiff:previousSettings:]"];
    [v14 handleFailureInFunction:v15 file:@"SBDeviceApplicationSceneClassicAccessoryView.m" lineNumber:364 description:@"this call must be made on the main thread"];
  }
  sceneSettingsInspector = self->_sceneSettingsInspector;
  if (!sceneSettingsInspector)
  {
    uint64_t v9 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E4F42780]);
    id v10 = self->_sceneSettingsInspector;
    self->_sceneSettingsInspector = v9;

    objc_initWeak(&location, self);
    id v11 = self->_sceneSettingsInspector;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke;
    v23[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v24, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v11 observeDeactivationReasonsWithBlock:v23];
    id v12 = self->_sceneSettingsInspector;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke_2;
    v21[3] = &unk_1E6AF85E0;
    objc_copyWeak(&v22, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v12 observeIsForegroundWithBlock:v21];
    char v13 = self->_sceneSettingsInspector;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke_3;
    v19 = &unk_1E6AF85E0;
    objc_copyWeak(&v20, &location);
    [(UIApplicationSceneSettingsDiffInspector *)v13 observeInterfaceOrientationWithBlock:&v16];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
    sceneSettingsInspector = self->_sceneSettingsInspector;
  }
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](sceneSettingsInspector, "inspectDiff:withContext:", v6, 0, v16, v17, v18, v19);
}

void __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateButtonVisibilityAnimated:1];
}

void __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateButtonVisibilityAnimated:1];
}

void __103__SBDeviceApplicationSceneClassicAccessoryView__sceneHandleDidUpdateSettingsWithDiff_previousSettings___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained && WeakRetained[472])
  {
    WeakRetained[472] = 0;
    uint64_t v4 = [WeakRetained sceneHandle];
    id v5 = [v4 sceneIfExists];
    id v6 = [v5 uiSettings];
    v8[57] = [v6 interfaceOrientation];

    [v8 setNeedsLayout];
    [v8 layoutIfNeeded];
    id v7 = [a2 animationSettings];
    [v8 _updateRotationButtonWithAnimationSettings:v7];
  }
  else
  {
    [WeakRetained _updateRotationButton];
  }
}

- (void)_updateRotationButtonWithAnimationSettings:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:1 toInterfaceOrientation:3];
  }
  id v5 = [(SBDeviceApplicationSceneClassicAccessoryView *)self sceneHandle];
  uint64_t v6 = [v5 currentInterfaceOrientation];

  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v31.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v31.c = v7;
  *(_OWORD *)&v31.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGFloat v8 = dbl_1D8FD1380[v6 == 1];
  if (v6 == 1) {
    uint64_t v9 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__clockWiseRotationButton;
  }
  else {
    uint64_t v9 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__counterClockWiseRotationButton;
  }
  if (v6 == 1) {
    id v10 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__counterClockWiseRotationButton;
  }
  else {
    id v10 = &OBJC_IVAR___SBDeviceApplicationSceneClassicAccessoryView__clockWiseRotationButton;
  }
  CGAffineTransformMakeRotation(&v31, v8);
  id v11 = *(id *)((char *)&self->super.super.super.isa + *v9);
  id v12 = *(id *)((char *)&self->super.super.super.isa + *v10);
  char v13 = (void *)MEMORY[0x1E4F42FF0];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke;
  v28[3] = &unk_1E6AF5290;
  id v14 = v11;
  id v29 = v14;
  v30 = self;
  [v13 performWithoutAnimation:v28];
  id v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  uint64_t v16 = [MEMORY[0x1E4F4F898] factoryWithSettings:v4 timingFunction:v15];
  [v16 setAllowsAdditiveAnimations:1];
  uint64_t v17 = (void *)MEMORY[0x1E4F4F898];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke_2;
  v24[3] = &unk_1E6AFA4F0;
  id v25 = v14;
  CGAffineTransform v27 = v31;
  id v26 = v12;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke_3;
  v20[3] = &unk_1E6AF5860;
  id v21 = v25;
  id v22 = v26;
  id v23 = self;
  id v18 = v26;
  id v19 = v25;
  [v17 animateWithFactory:v16 actions:v24 completion:v20];
}

uint64_t __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 424);
  return [v3 bringSubviewToFront:v2];
}

uint64_t __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v3;
  long long v9 = *(_OWORD *)(a1 + 80);
  [v2 setTransform:&v7];
  id v4 = *(void **)(a1 + 40);
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 48);
  long long v8 = v5;
  long long v9 = *(_OWORD *)(a1 + 80);
  return [v4 setTransform:&v7];
}

uint64_t __91__SBDeviceApplicationSceneClassicAccessoryView__updateRotationButtonWithAnimationSettings___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v8 = *MEMORY[0x1E4F1DAB8];
  long long v6 = v8;
  long long v9 = v7;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v5 = v10;
  [v2 setTransform:&v8];
  long long v3 = *(void **)(a1 + 40);
  long long v8 = v6;
  long long v9 = v7;
  long long v10 = v5;
  [v3 setTransform:&v8];
  return [*(id *)(a1 + 48) _updateRotationButton];
}

- (void)_updateOrientationFrom:(int64_t)a3 toOrientation:(int64_t)a4 animationSettings:(id)a5
{
  id v8 = a5;
  [v8 duration];
  double v10 = v9 * 0.5;
  [v8 delay];
  double v12 = v11;

  [(BSUIOrientationTransformWrapperView *)self->_transformWrapperView setContentOrientation:a3];
  [(BSUIOrientationTransformWrapperView *)self->_transformWrapperView setContainerOrientation:a4];
  transformWrapperView = self->_transformWrapperView;
  [(SBDeviceApplicationSceneClassicAccessoryView *)self bounds];
  -[BSUIOrientationTransformWrapperView setFrame:](transformWrapperView, "setFrame:");
  [(SBDeviceApplicationSceneClassicAccessoryView *)self layoutBelowIfNeeded];
  if (v10 <= 0.0)
  {
    [(SBDeviceApplicationSceneClassicAccessoryView *)self _setupPositioningAndRotationForInterfaceOrientation:a4 offscreen:0];
    self->_buttonOrientation = a4;
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke;
    v15[3] = &unk_1E6AF4A70;
    void v15[4] = self;
    v15[5] = a3;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_2;
    v14[3] = &unk_1E6AFF1D0;
    v14[4] = self;
    v14[5] = a4;
    *(double *)&v14[6] = v10;
    [MEMORY[0x1E4F42FF0] animateWithDuration:0x10000 delay:v15 options:v14 animations:v10 completion:v12];
  }
}

uint64_t __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupPositioningAndRotationForInterfaceOrientation:*(void *)(a1 + 40) offscreen:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutBelowIfNeeded];
}

uint64_t __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 464) setContentOrientation:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 464) setContainerOrientation:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) layoutBelowIfNeeded];
  double v2 = *(double *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_3;
  v6[3] = &unk_1E6AF4A70;
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = v3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_4;
  v5[3] = &unk_1E6AFF1A8;
  void v5[4] = v7;
  v5[5] = v3;
  return [MEMORY[0x1E4F42FF0] animateWithDuration:0x20000 delay:v6 options:v5 animations:v2 completion:0.0];
}

uint64_t __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupPositioningAndRotationForInterfaceOrientation:*(void *)(a1 + 40) offscreen:0];
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutBelowIfNeeded];
}

uint64_t __103__SBDeviceApplicationSceneClassicAccessoryView__updateOrientationFrom_toOrientation_animationSettings___block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 456) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)_setupPositioningAndRotationForInterfaceOrientation:(int64_t)a3 offscreen:(BOOL)a4
{
  double v5 = 16.0;
  double v6 = -16.0;
  if ((unint64_t)(a3 - 3) >= 2) {
    double v7 = 16.0;
  }
  else {
    double v7 = -16.0;
  }
  if ((unint64_t)(a3 - 3) < 2) {
    double v6 = 16.0;
  }
  if (a4) {
    double v8 = v7;
  }
  else {
    double v8 = 16.0;
  }
  if (a4) {
    double v5 = v6;
  }
  [(NSLayoutConstraint *)self->_zoomButtonVerticalConstraint setConstant:-v5];
  [(NSLayoutConstraint *)self->_zoomButtonHorizontalConstraint setConstant:-v8];
  [(SBDeviceApplicationSceneClassicAccessoryView *)self _updateRotationButtonConstraints];
}

- (SBDeviceApplicationSceneClassicAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDeviceApplicationSceneClassicAccessoryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (int64_t)buttonOrientation
{
  return self->_buttonOrientation;
}

- (void)setButtonOrientation:(int64_t)a3
{
  self->_buttonOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_rotationButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_rotationButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_rotationButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_zoomButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_zoomButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_zoomButtonVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_zoomButtonHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_sceneSettingsInspector, 0);
  objc_storeStrong((id *)&self->_clientSettingsInspector, 0);
  objc_storeStrong((id *)&self->_sceneHandleObserver, 0);
  objc_storeStrong((id *)&self->_transformWrapperView, 0);
  objc_storeStrong((id *)&self->_counterClockWiseRotationButton, 0);
  objc_storeStrong((id *)&self->_clockWiseRotationButton, 0);
  objc_storeStrong((id *)&self->_zoomButton, 0);
  objc_storeStrong((id *)&self->_buttonWrapperView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end