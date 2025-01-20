@interface PedestrianARArrowGuidanceView
- (BOOL)_isFirstArrowPosition;
- (PedestrianARArrowGuidanceView)initWithMapViewDelegate:(id)a3 route:(id)a4 activity:(id)a5;
- (PedestrianARVKMapViewMapDelegate)mapViewDelegate;
- (void)_resetState;
- (void)_setupViews;
- (void)_showInstruction;
- (void)_startArrowPulseAnimation;
- (void)_startArrowPulseAnimationTimer;
- (void)_startShowInstructionTimerIfNeeded;
- (void)_stopArrowPulseAnimationTimer;
- (void)_stopShowInstructionTimer;
- (void)_updateDynamicArrow;
- (void)_updateFont;
- (void)dealloc;
- (void)layoutSubviews;
- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4;
- (void)setMapViewDelegate:(id)a3;
- (void)stop;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PedestrianARArrowGuidanceView

- (PedestrianARArrowGuidanceView)initWithMapViewDelegate:(id)a3 route:(id)a4 activity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "-[PedestrianARArrowGuidanceView initWithMapViewDelegate:route:activity:]";
      __int16 v24 = 2080;
      v25 = "PedestrianARArrowGuidanceView.m";
      __int16 v26 = 1024;
      int v27 = 53;
      __int16 v28 = 2080;
      v29 = "mapViewDelegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v19 = sub_1005762E4();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PedestrianARArrowGuidanceView;
  v11 = -[PedestrianARArrowGuidanceView initWithFrame:](&v21, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_mapViewDelegate, v8);
    objc_storeStrong((id *)&v12->_activity, a5);
    v13 = +[PedestrianARSessionUsageTracker sharedInstance];
    v14 = [v9 uniqueRouteID];
    v15 = [v14 UUIDString];
    v12->_isFirstArrowOfRoute = [v13 hasAREverLocalizedForRoute:v15] ^ 1;

    [(PedestrianARArrowGuidanceView *)v12 _setupViews];
    [(PedestrianARArrowGuidanceView *)v12 _resetState];
    id WeakRetained = objc_loadWeakRetained((id *)&v12->_mapViewDelegate);
    [WeakRetained registerObserver:v12];
  }
  return v12;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewDelegate);
  [WeakRetained unregisterObserver:self];

  [(PedestrianARArrowGuidanceView *)self _stopShowInstructionTimer];
  [(PedestrianARArrowGuidanceView *)self _stopArrowPulseAnimationTimer];
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARArrowGuidanceView;
  [(PedestrianARArrowGuidanceView *)&v4 dealloc];
}

- (void)stop
{
  self->_isStopping = 1;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1005448C4;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.2];
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UIImageView);
  objc_super v4 = +[UIImage imageNamed:@"PedestrianAR_feature_arrow_right"];
  v5 = (UIImageView *)[v3 initWithImage:v4];
  dynamicArrowImageView = self->_dynamicArrowImageView;
  self->_dynamicArrowImageView = v5;

  [(UIImageView *)self->_dynamicArrowImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_dynamicArrowImageView setContentMode:1];
  v7 = [(UIImageView *)self->_dynamicArrowImageView layer];
  [v7 setShadowOffset:0.0, 0.0];

  id v8 = +[UIColor systemBlackColor];
  id v9 = [v8 CGColor];
  id v10 = [(UIImageView *)self->_dynamicArrowImageView layer];
  [v10 setShadowColor:v9];

  v11 = [(UIImageView *)self->_dynamicArrowImageView layer];
  LODWORD(v12) = 1053609165;
  [v11 setShadowOpacity:v12];

  v13 = [(UIImageView *)self->_dynamicArrowImageView layer];
  [v13 setShadowRadius:26.0];

  [(PedestrianARArrowGuidanceView *)self addSubview:self->_dynamicArrowImageView];
  v14 = (UILabel *)objc_alloc_init((Class)UILabel);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v14;

  [(UILabel *)self->_instructionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [(UILabel *)self->_instructionLabel layer];
  [v16 setShadowOffset:0.0, 0.0];

  id v17 = +[UIColor systemBlackColor];
  id v18 = [v17 CGColor];
  v19 = [(UILabel *)self->_instructionLabel layer];
  [v19 setShadowColor:v18];

  v20 = [(UILabel *)self->_instructionLabel layer];
  LODWORD(v21) = 1061997773;
  [v20 setShadowOpacity:v21];

  v22 = [(UILabel *)self->_instructionLabel layer];
  [v22 setShadowRadius:26.0];

  [(UILabel *)self->_instructionLabel setNumberOfLines:2];
  v23 = +[UIColor systemWhiteColor];
  [(UILabel *)self->_instructionLabel setTextColor:v23];

  __int16 v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"PedestrianARArrowGuidanceView [instruction]" value:@"localized string not found" table:0];
  [(UILabel *)self->_instructionLabel setText:v25];

  [(PedestrianARArrowGuidanceView *)self addSubview:self->_instructionLabel];
  __int16 v26 = [(UILabel *)self->_instructionLabel widthAnchor];
  int v27 = +[UIScreen mainScreen];
  [v27 bounds];
  v29 = [v26 constraintLessThanOrEqualToConstant:v28 * 0.699999988];
  instructionWidthConstraint = self->_instructionWidthConstraint;
  self->_instructionWidthConstraint = v29;

  v31 = [(UIImageView *)self->_dynamicArrowImageView heightAnchor];
  v32 = [v31 constraintEqualToConstant:57.0];
  v33 = [(UIImageView *)self->_dynamicArrowImageView widthAnchor];
  v34 = [v33 constraintEqualToConstant:57.0];
  v35 = self->_instructionWidthConstraint;
  v37[1] = v34;
  v37[2] = v35;
  v36 = +[NSArray arrayWithObjects:v37 count:3];
  +[NSLayoutConstraint activateConstraints:v36];

  [(PedestrianARArrowGuidanceView *)self _updateFont];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PedestrianARArrowGuidanceView;
  [(PedestrianARArrowGuidanceView *)&v9 traitCollectionDidChange:v4];
  if (!v4) {
    goto LABEL_3;
  }
  v5 = [(PedestrianARArrowGuidanceView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);

  if (v8) {
LABEL_3:
  }
    [(PedestrianARArrowGuidanceView *)self _updateFont];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARArrowGuidanceView;
  [(PedestrianARArrowGuidanceView *)&v4 layoutSubviews];
  [(PedestrianARArrowGuidanceView *)self frame];
  [(NSLayoutConstraint *)self->_instructionWidthConstraint setConstant:v3 * 0.699999988];
  [(UILabel *)self->_instructionLabel setNeedsUpdateConstraints];
}

- (void)_updateFont
{
  double v3 = [(PedestrianARArrowGuidanceView *)self traitCollection];
  [v3 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityMedium];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v4 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle2 weight:v5 compatibleWithTraitCollection:UIFontWeightBold];
  [(UILabel *)self->_instructionLabel setFont:v4];
}

- (void)mapLayer:(id)a3 activeARWalkingFeatureDidUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v15);
  if (self->_isStopping)
  {
    NSComparisonResult v8 = sub_10057812C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Pedestrian AR is stopping. No longer updating directional arrows", buf, 2u);
    }
    goto LABEL_4;
  }
  if ([v7 isVisible])
  {
    objc_super v9 = sub_10057812C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v7 feature];
      *(_DWORD *)buf = 138477827;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Feature '%{private}@' should be visible. Hiding directional arrows", buf, 0xCu);
    }
LABEL_14:

    [(PedestrianARArrowGuidanceView *)self _resetState];
    goto LABEL_15;
  }
  v11 = [v7 feature];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    objc_super v9 = sub_10057812C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Feature is nil. Hiding directional arrows", buf, 2u);
    }
    goto LABEL_14;
  }
  if (![v7 isDirectlyBehind]
    || [(PedestrianARArrowGuidanceView *)self _isFirstArrowPosition])
  {
    [v7 screenHeading];
    self->_dynamicArrowAngle = v13;
    [(PedestrianARArrowGuidanceView *)self _updateDynamicArrow];
    goto LABEL_15;
  }
  NSComparisonResult v8 = sub_10057812C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v14 = [v7 feature];
    *(_DWORD *)buf = 138477827;
    id v17 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Feature '%{private}@' is directly behind user.", buf, 0xCu);
  }
LABEL_4:

LABEL_15:
  os_activity_scope_leave(&v15);
}

- (void)_updateDynamicArrow
{
  [(UIImageView *)self->_dynamicArrowImageView setHidden:0];
  unsigned int v3 = [(PedestrianARArrowGuidanceView *)self _isFirstArrowPosition];
  if (v3)
  {
    double dynamicArrowAngle = self->_dynamicArrowAngle;
  }
  else
  {
    double dynamicArrowAngle = self->_dynamicArrowAngle;
    double v5 = self->_dynamicArrowLastAngle - dynamicArrowAngle;
    if (v5 < 0.0) {
      double v5 = -v5;
    }
    if (v5 > 45.0)
    {
      self->_dynamicArrowLastAngle = dynamicArrowAngle;
      return;
    }
  }
  self->_dynamicArrowLastAngle = dynamicArrowAngle;
  [(PedestrianARArrowGuidanceView *)self frame];
  double v7 = v6 * 0.5 + -28.5;
  [(PedestrianARArrowGuidanceView *)self frame];
  double v9 = v8 * 0.5 + -28.5;
  [(PedestrianARArrowGuidanceView *)self frame];
  double v11 = v10 * 0.5;
  [(PedestrianARArrowGuidanceView *)self frame];
  double v13 = v12 * 0.5;
  double v14 = (self->_dynamicArrowAngle + -90.0) * 0.0174532925;
  __double2 v15 = __sincos_stret(v14);
  double v16 = v11 + v15.__cosval * v7;
  double v17 = v13 + v15.__sinval * v9;
  [(UILabel *)self->_instructionLabel bounds];
  double v19 = v18 * 0.5 + 28.5 + 8.0;
  [(UILabel *)self->_instructionLabel bounds];
  double v21 = self->_dynamicArrowAngle;
  if (v21 > 45.0 && v21 <= 135.0)
  {
    double x = v16 - v19;
    goto LABEL_17;
  }
  double v23 = v20 * 0.5 + 28.5 + 4.0;
  if (v21 <= 135.0 || v21 > 225.0)
  {
    if (v21 > 225.0 && v21 <= 315.0)
    {
      double x = v16 + v19;
LABEL_17:
      double y = v17;
      if (!v3) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    BOOL v26 = v21 <= 315.0;
    BOOL v27 = v21 > 45.0;
    if (v26 && v27) {
      double y = CGPointZero.y;
    }
    else {
      double y = v17 + v23;
    }
    if (v26 && v27) {
      double x = CGPointZero.x;
    }
    else {
      double x = v16;
    }
    if (!v3) {
      goto LABEL_19;
    }
LABEL_18:
    -[UIImageView setCenter:](self->_dynamicArrowImageView, "setCenter:", v16, v17);
    -[UILabel setCenter:](self->_instructionLabel, "setCenter:", x, y);
    CGAffineTransformMakeRotation(&v30, v14);
    dynamicArrowImageView = self->_dynamicArrowImageView;
    CGAffineTransform v29 = v30;
    [(UIImageView *)dynamicArrowImageView setTransform:&v29];
    [(PedestrianARArrowGuidanceView *)self _startArrowPulseAnimationTimer];
    goto LABEL_19;
  }
  double y = v17 - v23;
  double x = v16;
  if (v3) {
    goto LABEL_18;
  }
LABEL_19:
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100545454;
  v28[3] = &unk_1012EE768;
  v28[4] = self;
  *(double *)&v28[5] = v14;
  *(double *)&v28[6] = v16;
  *(double *)&v28[7] = v17;
  *(double *)&v28[8] = x;
  *(double *)&v28[9] = y;
  +[UIView animateWithDuration:v28 animations:0.600000024];
  if (self->_isFirstArrowOfRoute)
  {
    self->_isFirstArrowOfRoute = 0;
    [(PedestrianARArrowGuidanceView *)self _showInstruction];
  }
  else
  {
    [(PedestrianARArrowGuidanceView *)self _startShowInstructionTimerIfNeeded];
  }
}

- (void)_startShowInstructionTimerIfNeeded
{
  if ([(UILabel *)self->_instructionLabel isHidden])
  {
    if (!self->_showInstructionTimer)
    {
      objc_initWeak(&location, self);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1005455EC;
      v5[3] = &unk_1012E73C8;
      objc_copyWeak(&v6, &location);
      unsigned int v3 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v5 block:3.0];
      showInstructionTimer = self->_showInstructionTimer;
      self->_showInstructionTimer = v3;

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_stopShowInstructionTimer
{
  [(NSTimer *)self->_showInstructionTimer invalidate];
  showInstructionTimer = self->_showInstructionTimer;
  self->_showInstructionTimer = 0;
}

- (void)_showInstruction
{
  if (([(UIImageView *)self->_dynamicArrowImageView isHidden] & 1) == 0)
  {
    instructionLabel = self->_instructionLabel;
    [(UILabel *)instructionLabel setHidden:0];
  }
}

- (void)_resetState
{
  self->_double dynamicArrowAngle = 2.22507386e-308;
  self->_dynamicArrowLastAngle = 2.22507386e-308;
  [(PedestrianARArrowGuidanceView *)self _stopShowInstructionTimer];
  [(PedestrianARArrowGuidanceView *)self _stopArrowPulseAnimationTimer];
  [(UIImageView *)self->_dynamicArrowImageView setHidden:1];
  instructionLabel = self->_instructionLabel;

  [(UILabel *)instructionLabel setHidden:1];
}

- (BOOL)_isFirstArrowPosition
{
  return self->_dynamicArrowLastAngle == 2.22507386e-308;
}

- (void)_startArrowPulseAnimationTimer
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10054585C;
  v5[3] = &unk_1012E73C8;
  objc_copyWeak(&v6, &location);
  unsigned int v3 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v5 block:0.6];
  arrowPulseAnimationTimer = self->_arrowPulseAnimationTimer;
  self->_arrowPulseAnimationTimer = v3;

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_stopArrowPulseAnimationTimer
{
  [(NSTimer *)self->_arrowPulseAnimationTimer invalidate];
  arrowPulseAnimationTimer = self->_arrowPulseAnimationTimer;
  self->_arrowPulseAnimationTimer = 0;
}

- (void)_startArrowPulseAnimation
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100545970;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView animateWithDuration:0 delay:v2 options:0 animations:0.600000024 completion:0.0];
}

- (PedestrianARVKMapViewMapDelegate)mapViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapViewDelegate);

  return (PedestrianARVKMapViewMapDelegate *)WeakRetained;
}

- (void)setMapViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapViewDelegate);
  objc_storeStrong((id *)&self->_instructionWidthConstraint, 0);
  objc_storeStrong((id *)&self->_arrowPulseAnimationTimer, 0);
  objc_storeStrong((id *)&self->_showInstructionTimer, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_dynamicArrowImageView, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

@end