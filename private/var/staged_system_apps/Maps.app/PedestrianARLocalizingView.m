@interface PedestrianARLocalizingView
- (ARCoachingOverlayView)coachingOverlayView;
- (ARSession)session;
- (BOOL)_isLandscape;
- (BOOL)coachingOverlayViewShouldShowSessionFailure:(id)a3 error:(id)a4;
- (BOOL)isFadingOut;
- (BOOL)isVisible;
- (NSLayoutConstraint)instructionLabelBottomConstraint;
- (NSLayoutConstraint)instructionLabelLeadingConstraint;
- (NSLayoutConstraint)instructionLabelTrailingConstraint;
- (OS_os_activity)activity;
- (PedestrianARLocalizingView)initWithFrame:(CGRect)a3;
- (UILabel)instructionLabel;
- (VLFScanningAnimationManager)animationManager;
- (void)_updateConstraints;
- (void)_updateFonts;
- (void)_updateUI;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)displayCoachingMessage:(id)a3 forCoachingView:(id)a4;
- (void)hideAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)session:(id)a3 willRunWithConfiguration:(id)a4;
- (void)setActivity:(id)a3;
- (void)setAnimationManager:(id)a3;
- (void)setCoachingOverlayView:(id)a3;
- (void)setFadingOut:(BOOL)a3;
- (void)setInstructionLabel:(id)a3;
- (void)setInstructionLabelBottomConstraint:(id)a3;
- (void)setInstructionLabelLeadingConstraint:(id)a3;
- (void)setInstructionLabelTrailingConstraint:(id)a3;
- (void)setSession:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)showAnimated:(BOOL)a3 completion:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PedestrianARLocalizingView

- (PedestrianARLocalizingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v54.receiver = self;
  v54.super_class = (Class)PedestrianARLocalizingView;
  id v7 = -[PedestrianARLocalizingView initWithFrame:](&v54, "initWithFrame:");
  if (v7)
  {
    os_activity_t v8 = _os_activity_create((void *)&_mh_execute_header, "Visual Localization", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    [v7 setActivity:v8];

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(*((os_activity_t *)v7 + 9), &state);
    v9 = sub_100582700();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v58 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    id v10 = [objc_alloc((Class)ARCoachingOverlayView) initWithFrame:x, y, width, height];
    v11 = (void *)*((void *)v7 + 3);
    *((void *)v7 + 3) = v10;

    [*((id *)v7 + 3) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)v7 + 3) setGoal:4];
    [*((id *)v7 + 3) setHideCoachingMessageLabel:1];
    [*((id *)v7 + 3) setDelegate:v7];
    [*((id *)v7 + 3) setActivatesAutomatically:0];
    v12 = [*((id *)v7 + 3) layer];
    [v12 setOpacity:0.0];

    [v7 addSubview:*((void *)v7 + 3)];
    v52 = [*((id *)v7 + 3) leadingAnchor];
    v51 = [v7 leadingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v56[0] = v50;
    v49 = [*((id *)v7 + 3) trailingAnchor];
    v13 = [v7 trailingAnchor];
    v14 = [v49 constraintEqualToAnchor:v13];
    v56[1] = v14;
    v15 = [*((id *)v7 + 3) topAnchor];
    v16 = [v7 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v56[2] = v17;
    v18 = [*((id *)v7 + 3) bottomAnchor];
    v19 = [v7 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v56[3] = v20;
    v21 = +[NSArray arrayWithObjects:v56 count:4];
    +[NSLayoutConstraint activateConstraints:v21];

    id v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v23 = (void *)*((void *)v7 + 4);
    *((void *)v7 + 4) = v22;

    [*((id *)v7 + 4) setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [*((id *)v7 + 4) layer];
    [v24 setOpacity:0.0];

    [*((id *)v7 + 4) setNumberOfLines:0];
    v25 = +[UIColor labelColor];
    [*((id *)v7 + 4) setTextColor:v25];

    v26 = [*((id *)v7 + 4) layer];
    [v26 setOpacity:0.0];

    [v7 addSubview:*((void *)v7 + 4)];
    v27 = [*((id *)v7 + 4) leadingAnchor];
    v28 = [v7 safeAreaLayoutGuide];
    v29 = [v28 leadingAnchor];
    uint64_t v30 = [v27 constraintEqualToAnchor:v29];
    v31 = (void *)*((void *)v7 + 5);
    *((void *)v7 + 5) = v30;

    v32 = [*((id *)v7 + 4) trailingAnchor];
    v33 = [v7 safeAreaLayoutGuide];
    v34 = [v33 trailingAnchor];
    uint64_t v35 = [v32 constraintEqualToAnchor:v34];
    v36 = (void *)*((void *)v7 + 6);
    *((void *)v7 + 6) = v35;

    v37 = [*((id *)v7 + 4) bottomAnchor];
    v38 = [v7 safeAreaLayoutGuide];
    v39 = [v38 bottomAnchor];
    uint64_t v40 = [v37 constraintEqualToAnchor:v39];
    v41 = (void *)*((void *)v7 + 7);
    *((void *)v7 + 7) = v40;

    v55[0] = *((void *)v7 + 5);
    v55[1] = *((void *)v7 + 6);
    v55[2] = *((void *)v7 + 7);
    v42 = +[NSArray arrayWithObjects:v55 count:3];
    +[NSLayoutConstraint activateConstraints:v42];

    v43 = [VLFScanningAnimationManager alloc];
    v44 = [*((id *)v7 + 4) layer];
    v45 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    v46 = [(VLFScanningAnimationManager *)v43 initWithLayer:v44 animationDuration:v45 timingFunction:0.2];
    v47 = (void *)*((void *)v7 + 8);
    *((void *)v7 + 8) = v46;

    [v7 _updateUI];
    os_activity_scope_leave(&state);
  }
  return (PedestrianARLocalizingView *)v7;
}

- (void)dealloc
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = [(PedestrianARLocalizingView *)self activity];
  os_activity_scope_enter(v3, &state);

  v4 = sub_100582700();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    os_activity_t v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(ARCoachingOverlayView *)self->_coachingOverlayView setActive:0 animated:0];
  [(ARSession *)self->_session _removeObserver:self];
  os_activity_scope_leave(&state);
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARLocalizingView;
  [(PedestrianARLocalizingView *)&v5 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_super v5 = [(PedestrianARLocalizingView *)self activity];
  os_activity_scope_enter(v5, &state);

  v9.receiver = self;
  v9.super_class = (Class)PedestrianARLocalizingView;
  [(PedestrianARLocalizingView *)&v9 willMoveToWindow:v4];
  v6 = sub_100582700();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Moving to window: %@", buf, 0x16u);
  }

  if (!v4)
  {
    id v7 = [(PedestrianARLocalizingView *)self instructionLabel];
    os_activity_t v8 = [v7 layer];
    [v8 removeAllAnimations];
  }
  os_activity_scope_leave(&state);
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARLocalizingView;
  [(PedestrianARLocalizingView *)&v4 didMoveToWindow];
  v3 = [(PedestrianARLocalizingView *)self coachingOverlayView];
  [v3 setActive:1 animated:0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARLocalizingView;
  [(PedestrianARLocalizingView *)&v3 layoutSubviews];
  [(PedestrianARLocalizingView *)self _updateUI];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARLocalizingView;
  [(PedestrianARLocalizingView *)&v9 traitCollectionDidChange:v4];
  if (!v4) {
    goto LABEL_3;
  }
  objc_super v5 = [(PedestrianARLocalizingView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

  if (v8) {
LABEL_3:
  }
    [(PedestrianARLocalizingView *)self _updateUI];
}

- (void)setSession:(id)a3
{
  objc_super v5 = (ARSession *)a3;
  p_session = &self->_session;
  if (self->_session != v5)
  {
    id v7 = [(PedestrianARLocalizingView *)self activity];
    os_activity_scope_enter(v7, &v21);

    NSComparisonResult v8 = sub_100582700();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Setting session: %@", buf, 0x16u);
    }

    [(ARSession *)*p_session _removeObserver:self];
    objc_storeStrong((id *)&self->_session, a3);
    objc_super v9 = [(ARSession *)*p_session configuration];
    if (v9
      && ([(ARSession *)*p_session configuration],
          id v10 = objc_claimAutoreleasedReturnValue(),
          unsigned int v11 = [v10 isPedestrianAR],
          v10,
          v9,
          !v11))
    {
      v17 = sub_100582700();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = [(ARSession *)*p_session configuration];
        *(_DWORD *)buf = 134349314;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Session is NOT configured with a Pedestrian AR configuration (%@); will wait until it is",
          buf,
          0x16u);
      }
      v19 = [(PedestrianARLocalizingView *)self coachingOverlayView];
      [v19 setSession:0];

      v20 = [(PedestrianARLocalizingView *)self coachingOverlayView];
      [v20 setActive:0 animated:0];

      [(ARSession *)*p_session _addObserver:self];
    }
    else
    {
      v12 = sub_100582700();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = [(ARSession *)*p_session configuration];
        *(_DWORD *)buf = 134349314;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Session is configured with a nil or Pedestrian AR configuration (%@); activating coaching overlay",
          buf,
          0x16u);
      }
      id v14 = *p_session;
      v15 = [(PedestrianARLocalizingView *)self coachingOverlayView];
      [v15 setSession:v14];

      v16 = [(PedestrianARLocalizingView *)self coachingOverlayView];
      [v16 setActive:1 animated:0];
    }
    os_activity_scope_leave(&v21);
  }
}

- (void)showAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v7 = [(PedestrianARLocalizingView *)self activity];
  os_activity_scope_enter(v7, &state);

  NSComparisonResult v8 = sub_100582700();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = @"NO";
    if (v4) {
      objc_super v9 = @"YES";
    }
    id v10 = v9;
    *(_DWORD *)buf = 134349314;
    os_activity_scope_state_s v21 = self;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Will show animated: %@", buf, 0x16u);
  }
  [(PedestrianARLocalizingView *)self setVisible:1];
  [(PedestrianARLocalizingView *)self setFadingOut:0];
  if (v4)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1005830C0;
    v18[3] = &unk_1012E5D08;
    v18[4] = self;
    +[UIView animateWithDuration:0x10000 delay:v18 options:0 animations:0.3 completion:0.0];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100583120;
    v17[3] = &unk_1012E5D08;
    v17[4] = self;
    +[UIView animateWithDuration:0x10000 delay:v17 options:v6 animations:0.75 completion:0.0];
  }
  else
  {
    unsigned int v11 = [(PedestrianARLocalizingView *)self coachingOverlayView];
    v12 = [v11 layer];
    LODWORD(v13) = 1.0;
    [v12 setOpacity:v13];

    id v14 = [(PedestrianARLocalizingView *)self instructionLabel];
    v15 = [v14 layer];
    LODWORD(v16) = 1.0;
    [v15 setOpacity:v16];

    if (v6) {
      v6[2](v6, 1);
    }
  }
  os_activity_scope_leave(&state);
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v7 = [(PedestrianARLocalizingView *)self activity];
  os_activity_scope_enter(v7, &state);

  NSComparisonResult v8 = sub_100582700();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = @"NO";
    if (v4) {
      objc_super v9 = @"YES";
    }
    id v10 = v9;
    *(_DWORD *)buf = 134349314;
    v29 = self;
    __int16 v30 = 2112;
    v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Will hide animated: %@", buf, 0x16u);
  }
  if (v4)
  {
    unsigned int v11 = [(PedestrianARLocalizingView *)self instructionLabel];
    v12 = [v11 layer];
    [v12 removeAllAnimations];

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100583500;
    v26[3] = &unk_1012E5D08;
    v26[4] = self;
    +[UIView animateWithDuration:0x10000 delay:v26 options:0 animations:0.5 completion:0.1];
    objc_initWeak((id *)buf, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100583560;
    v25[3] = &unk_1012E5D08;
    v25[4] = self;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    os_activity_scope_state_s v21 = sub_1005835C0;
    __int16 v22 = &unk_1012E7DB8;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v6;
    +[UIView animateWithDuration:0x10000 delay:v25 options:&v19 animations:0.75 completion:0.0];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    double v13 = [(PedestrianARLocalizingView *)self instructionLabel];
    id v14 = [v13 layer];
    [v14 removeAllAnimations];

    v15 = [(PedestrianARLocalizingView *)self instructionLabel];
    double v16 = [v15 layer];
    [v16 setOpacity:0.0];

    v17 = [(PedestrianARLocalizingView *)self coachingOverlayView];
    v18 = [v17 layer];
    [v18 setOpacity:0.0];

    if (v6) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
  -[PedestrianARLocalizingView setVisible:](self, "setVisible:", 0, v19, v20, v21, v22);
  [(PedestrianARLocalizingView *)self setFadingOut:v4];
  os_activity_scope_leave(&state);
}

- (void)_updateUI
{
  [(PedestrianARLocalizingView *)self _updateFonts];

  [(PedestrianARLocalizingView *)self _updateConstraints];
}

- (void)_updateFonts
{
  unsigned int v3 = [(PedestrianARLocalizingView *)self _isLandscape];
  BOOL v4 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  if (!v3) {
    BOOL v4 = (id *)&UIContentSizeCategoryAccessibilityLarge;
  }
  id v5 = *v4;
  id v6 = [(PedestrianARLocalizingView *)self traitCollection];
  [v6 _maps_traitCollectionWithMaximumContentSizeCategory:v5];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle1 weight:v9 compatibleWithTraitCollection:UIFontWeightBold];
  NSComparisonResult v8 = [(PedestrianARLocalizingView *)self instructionLabel];
  [v8 setFont:v7];
}

- (void)_updateConstraints
{
  unsigned int v3 = [(PedestrianARLocalizingView *)self _isLandscape];
  BOOL v4 = [(PedestrianARLocalizingView *)self instructionLabelLeadingConstraint];
  id v5 = v4;
  if (v3)
  {
    [v4 setConstant:0.0];

    id v6 = [(PedestrianARLocalizingView *)self instructionLabelTrailingConstraint];
    [v6 setConstant:0.0];

    id v7 = [(PedestrianARLocalizingView *)self traitCollection];
    NSComparisonResult v8 = [v7 preferredContentSizeCategory];
    uint64_t v9 = sub_1000E93B0(v8, UIContentSizeCategoryExtraExtraExtraLarge);

    id v10 = [(PedestrianARLocalizingView *)self instructionLabelBottomConstraint];
    unsigned int v11 = v10;
    double v12 = -18.0;
    if (v9 == 1) {
      double v12 = -16.0;
    }
    [v10 setConstant:v12];

    double v13 = [(PedestrianARLocalizingView *)self instructionLabel];
    [v13 setNumberOfLines:2];

    id v14 = [(PedestrianARLocalizingView *)self instructionLabel];
    id v19 = v14;
    uint64_t v15 = 1;
  }
  else
  {
    [v4 setConstant:26.0];

    double v16 = [(PedestrianARLocalizingView *)self instructionLabelTrailingConstraint];
    [v16 setConstant:-26.0];

    v17 = [(PedestrianARLocalizingView *)self instructionLabelBottomConstraint];
    [v17 setConstant:-24.0];

    v18 = [(PedestrianARLocalizingView *)self instructionLabel];
    [v18 setNumberOfLines:0];

    id v14 = [(PedestrianARLocalizingView *)self instructionLabel];
    id v19 = v14;
    uint64_t v15 = 0;
  }
  [v14 setAdjustsFontSizeToFitWidth:v15];
}

- (BOOL)_isLandscape
{
  [(PedestrianARLocalizingView *)self frame];
  double Width = CGRectGetWidth(v5);
  [(PedestrianARLocalizingView *)self frame];
  return Width > CGRectGetHeight(v6);
}

- (void)displayCoachingMessage:(id)a3 forCoachingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  NSComparisonResult v8 = [(PedestrianARLocalizingView *)self activity];
  os_activity_scope_enter(v8, &state);

  unsigned int v9 = [(PedestrianARLocalizingView *)self isFadingOut];
  id v10 = sub_100582700();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134349314;
      id v23 = self;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Got a coaching message (%@) while fading out; ignoring it",
        buf,
        0x16u);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134349314;
      id v23 = self;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Updating coaching message: '%@'", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100583C30;
    v17[3] = &unk_1012E6690;
    objc_copyWeak(&v19, &location);
    id v18 = v6;
    double v12 = objc_retainBlock(v17);
    unsigned __int8 v13 = [(PedestrianARLocalizingView *)self isVisible];
    id v14 = sub_100582700();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 134349056;
        id v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating text with animation", buf, 0xCu);
      }

      double v16 = [(PedestrianARLocalizingView *)self animationManager];
      [v16 fadeWithFadeOutCompletion:v12];
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 134349056;
        id v23 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating text without animation", buf, 0xCu);
      }

      ((void (*)(void *))v12[2])(v12);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  os_activity_scope_leave(&state);
}

- (BOOL)coachingOverlayViewShouldShowSessionFailure:(id)a3 error:(id)a4
{
  return 0;
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [v7 isPedestrianAR];
  unsigned int v9 = sub_100582700();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      id v14 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] ARSession will run with PedestrianAR configuration", buf, 0xCu);
    }

    [v6 _removeObserver:self];
    objc_initWeak((id *)buf, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100583E54;
    block[3] = &unk_1012E6708;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349314;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[%{public}p] ARSession will run with a non-pedestrianAR configuration: %@", buf, 0x16u);
    }
  }
}

- (ARSession)session
{
  return self->_session;
}

- (ARCoachingOverlayView)coachingOverlayView
{
  return self->_coachingOverlayView;
}

- (void)setCoachingOverlayView:(id)a3
{
}

- (UILabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)isFadingOut
{
  return self->_fadingOut;
}

- (void)setFadingOut:(BOOL)a3
{
  self->_fadingOut = a3;
}

- (NSLayoutConstraint)instructionLabelLeadingConstraint
{
  return self->_instructionLabelLeadingConstraint;
}

- (void)setInstructionLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)instructionLabelTrailingConstraint
{
  return self->_instructionLabelTrailingConstraint;
}

- (void)setInstructionLabelTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)instructionLabelBottomConstraint
{
  return self->_instructionLabelBottomConstraint;
}

- (void)setInstructionLabelBottomConstraint:(id)a3
{
}

- (VLFScanningAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_instructionLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_instructionLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_instructionLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_coachingOverlayView, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end