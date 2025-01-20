@interface CarHeadingIndicatorView
- (BOOL)_canStartLocationUpdates;
- (BOOL)canBecomeFocused;
- (BOOL)contentsHidden;
- (BOOL)isActive;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (BOOL)needsContinuousRoundedCorners;
- (CGSize)intrinsicContentSize;
- (CarHeadingIndicatorView)initWithCarSceneType:(int64_t)a3;
- (int)compassPoint;
- (void)_applyDynamicScaling;
- (void)_setActive:(BOOL)a3;
- (void)_setupConstraints;
- (void)_startLocationUpdates;
- (void)_stopLocationUpdates;
- (void)_updateColors;
- (void)_updateContents;
- (void)_updateDisplayedHeadingWithHeading:(double)a3;
- (void)_updateStyling;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)dynamicBlurViewDidChangeBlurMode:(int)a3;
- (void)locationManager:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setCompassPoint:(int)a3;
- (void)setContentsHidden:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarHeadingIndicatorView

- (CarHeadingIndicatorView)initWithCarSceneType:(int64_t)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CarHeadingIndicatorView;
  v4 = -[CarFocusableBlurControl initWithFrame:](&v21, "initWithFrame:", 0.0, 0.0, 34.0, 34.0);
  v5 = v4;
  if (v4)
  {
    v4->_sceneType = a3;
    [(CarHeadingIndicatorView *)v4 setAccessibilityIdentifier:@"CarHeadingIndicatorView"];
    UIRoundToViewScale();
    -[CarFocusableBlurControl setRoundedCornerRadius:](v5, "setRoundedCornerRadius:");
    uint64_t v6 = +[MKLocationManager sharedLocationManager];
    locationManager = v5->_locationManager;
    v5->_locationManager = (MKLocationManager *)v6;

    [(MKLocationManager *)v5->_locationManager vehicleHeadingOrCourse];
    v5->_compassPoint = MKCompassPointFromLocationDirection();
    id v8 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v12 = [v8 initWithFrame:CGRectZero.origin.x, y, width, height];
    containerView = v5->_containerView;
    v5->_containerView = v12;

    [(UIView *)v5->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5->_containerView setAccessibilityIdentifier:@"ContainerView"];
    [(CarFocusableControl *)v5 addSubview:v5->_containerView];
    v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    headingLabel = v5->_headingLabel;
    v5->_headingLabel = v14;

    [(UILabel *)v5->_headingLabel setAccessibilityIdentifier:@"HeadingLabel"];
    [(UILabel *)v5->_headingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_headingLabel setTextAlignment:1];
    LODWORD(v16) = 1148846080;
    [(UILabel *)v5->_headingLabel setContentHuggingPriority:1 forAxis:v16];
    LODWORD(v17) = 1144750080;
    [(UILabel *)v5->_headingLabel setContentHuggingPriority:0 forAxis:v17];
    LODWORD(v18) = 1148829696;
    [(UILabel *)v5->_headingLabel setContentCompressionResistancePriority:0 forAxis:v18];
    LODWORD(v19) = 1148829696;
    [(UILabel *)v5->_headingLabel setContentCompressionResistancePriority:1 forAxis:v19];
    [(UIView *)v5->_containerView addSubview:v5->_headingLabel];
    [(CarHeadingIndicatorView *)v5 _setupConstraints];
    [(CarHeadingIndicatorView *)v5 _updateStyling];
    [(CarHeadingIndicatorView *)v5 _updateContents];
  }
  return v5;
}

- (void)dealloc
{
  [(CarHeadingIndicatorView *)self _stopLocationUpdates];
  v3.receiver = self;
  v3.super_class = (Class)CarHeadingIndicatorView;
  [(CarHeadingIndicatorView *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarHeadingIndicatorView;
  [(CarFocusableBlurControl *)&v4 didMoveToWindow];
  objc_super v3 = [(CarHeadingIndicatorView *)self window];

  if (v3)
  {
    [(CarHeadingIndicatorView *)self _updateColors];
    [(CarHeadingIndicatorView *)self _updateStyling];
    [(CarHeadingIndicatorView *)self _applyDynamicScaling];
  }
  [(CarHeadingIndicatorView *)self _setActive:self->_active];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CarHeadingIndicatorView;
  id v4 = a3;
  [(CarFocusableBlurControl *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  uint64_t v6 = [(CarHeadingIndicatorView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(CarHeadingIndicatorView *)self _updateColors];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3) {
    -[CarHeadingIndicatorView _setActive:](self, "_setActive:");
  }
}

- (void)_setActive:(BOOL)a3
{
  self->_active = a3;
  if (a3
    || ([(CarHeadingIndicatorView *)self window],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [(CarHeadingIndicatorView *)self _startLocationUpdates];
  }
  else
  {
    [(CarHeadingIndicatorView *)self _stopLocationUpdates];
  }
}

- (void)_setupConstraints
{
  objc_super v3 = [(CarHeadingIndicatorView *)self widthAnchor];
  if (self->_sceneType == 7)
  {
    [(CarHeadingIndicatorView *)self _car_dynamicPointScaleValue];
    double v5 = v4 * 34.0;
  }
  else
  {
    double v5 = 34.0;
  }
  uint64_t v6 = [v3 constraintEqualToConstant:v5];
  widthConstraint = self->_widthConstraint;
  self->_widthConstraint = v6;

  v36 = [(UIView *)self->_containerView topAnchor];
  v35 = [(CarHeadingIndicatorView *)self topAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v37[0] = v34;
  v33 = [(UIView *)self->_containerView leftAnchor];
  v32 = [(CarHeadingIndicatorView *)self leftAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v37[1] = v31;
  v30 = [(UIView *)self->_containerView bottomAnchor];
  v29 = [(CarHeadingIndicatorView *)self bottomAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v37[2] = v28;
  v27 = [(UIView *)self->_containerView rightAnchor];
  v26 = [(CarHeadingIndicatorView *)self rightAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v37[3] = v25;
  v24 = [(UILabel *)self->_headingLabel widthAnchor];
  v23 = [(UIView *)self->_containerView widthAnchor];
  v22 = [v24 constraintLessThanOrEqualToAnchor:v23];
  v37[4] = v22;
  objc_super v21 = [(UILabel *)self->_headingLabel heightAnchor];
  v20 = [(UIView *)self->_containerView heightAnchor];
  objc_super v8 = [v21 constraintLessThanOrEqualToAnchor:v20];
  v37[5] = v8;
  v9 = [(UILabel *)self->_headingLabel centerXAnchor];
  v10 = [(UIView *)self->_containerView centerXAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v37[6] = v11;
  v12 = [(UILabel *)self->_headingLabel centerYAnchor];
  v13 = [(UIView *)self->_containerView centerYAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v15 = self->_widthConstraint;
  v37[7] = v14;
  v37[8] = v15;
  double v16 = [(CarHeadingIndicatorView *)self heightAnchor];
  double v17 = [(CarHeadingIndicatorView *)self widthAnchor];
  double v18 = [v16 constraintEqualToAnchor:v17];
  v37[9] = v18;
  double v19 = +[NSArray arrayWithObjects:v37 count:10];

  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)_updateStyling
{
  objc_super v3 = +[UIFont _maps_navHeadingFontWithPreferredSize:15.0 diameter:34.0 desiredPadding:4.0];
  double v4 = 1.0;
  if (self->_sceneType == 7) {
    [(CarHeadingIndicatorView *)self _car_dynamicPointScaleValue];
  }
  double v5 = [v3 _maps_scaledFontForScaleFactor:v4];
  [(UILabel *)self->_headingLabel setFont:v5];

  [(UILabel *)self->_headingLabel setTextAlignment:1];
  [(UILabel *)self->_headingLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_headingLabel setMinimumScaleFactor:0.550000012];
  [(UILabel *)self->_headingLabel setBaselineAdjustment:1];
  [(UILabel *)self->_headingLabel setLineBreakMode:2];
  if (self->_sceneType == 7) {
    [(CarHeadingIndicatorView *)self _car_dynamicPointScaleValue];
  }
  UIRoundToViewScale();
  -[CarFocusableBlurControl setRoundedCornerRadius:](self, "setRoundedCornerRadius:");

  [(CarHeadingIndicatorView *)self _updateColors];
}

- (void)_updateContents
{
  unsigned int v3 = [(CarHeadingIndicatorView *)self contentsHidden];
  int compassPoint = self->_compassPoint;
  double v5 = MKLocalizedAbbreviationForCompassPoint();
  [(UILabel *)self->_headingLabel setText:v5];

  [(CarHeadingIndicatorView *)self setContentsHidden:compassPoint == 0];
  if (v3 != [(CarHeadingIndicatorView *)self contentsHidden])
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"CarHeadingIndicatorViewDidChangeVisibility" object:self];
  }
}

- (void)_updateColors
{
  int blurMode = self->_blurMode;
  if ((blurMode - 2) >= 2)
  {
    if (blurMode == 1)
    {
      uint64_t v4 = +[UIColor blackColor];
      goto LABEL_6;
    }
    if (blurMode) {
      return;
    }
  }
  uint64_t v4 = +[UIColor whiteColor];
LABEL_6:
  id v5 = (id)v4;
  [(UILabel *)self->_headingLabel setTextColor:v4];
}

- (void)_applyDynamicScaling
{
  if (self->_sceneType == 7)
  {
    [(CarHeadingIndicatorView *)self _car_dynamicPointScaleValue];
    double v4 = v3 * 34.0;
  }
  else
  {
    double v4 = 34.0;
  }
  widthConstraint = self->_widthConstraint;

  [(NSLayoutConstraint *)widthConstraint setConstant:v4];
}

- (void)_startLocationUpdates
{
  if (!self->_monitoringCourse
    && [(MKLocationManager *)self->_locationManager isLocationServicesApproved]&& [(CarHeadingIndicatorView *)self _canStartLocationUpdates])
  {
    self->_monitoringCourse = 1;
    [(MKLocationManager *)self->_locationManager startLocationUpdateWithObserver:self];
    locationManager = self->_locationManager;
    [(MKLocationManager *)locationManager startVehicleHeadingUpdate];
  }
}

- (void)_stopLocationUpdates
{
  if (self->_monitoringCourse)
  {
    [(MKLocationManager *)self->_locationManager stopLocationUpdateWithObserver:self];
    [(MKLocationManager *)self->_locationManager stopVehicleHeadingUpdate];
    self->_monitoringCourse = 0;
  }
}

- (BOOL)_canStartLocationUpdates
{
  double v3 = [(CarHeadingIndicatorView *)self window];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(CarHeadingIndicatorView *)self isActive];
  }

  return v4;
}

- (CGSize)intrinsicContentSize
{
  if (self->_sceneType == 7)
  {
    [(CarHeadingIndicatorView *)self _car_dynamicPointScaleValue];
    double v3 = 34.0;
    double v5 = v4 * 34.0;
    if (self->_sceneType == 7)
    {
      [(CarHeadingIndicatorView *)self _car_dynamicPointScaleValue];
      double v3 = v6 * 34.0;
    }
  }
  else
  {
    double v5 = 34.0;
    double v3 = 34.0;
  }
  double v7 = v5;
  result.double height = v3;
  result.double width = v7;
  return result;
}

- (void)dynamicBlurViewDidChangeBlurMode:(int)a3
{
  if (self->_blurMode != a3)
  {
    self->_int blurMode = a3;
    [(CarHeadingIndicatorView *)self _updateColors];
  }
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)needsContinuousRoundedCorners
{
  return 0;
}

- (void)_updateDisplayedHeadingWithHeading:(double)a3
{
  uint64_t v4 = MKCompassPointFromLocationDirection();

  [(CarHeadingIndicatorView *)self setCompassPoint:v4];
}

- (void)setCompassPoint:(int)a3
{
  if (self->_compassPoint != a3)
  {
    self->_int compassPoint = a3;
    [(CarHeadingIndicatorView *)self _updateContents];
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  [a3 vehicleHeadingOrCourse];

  -[CarHeadingIndicatorView _updateDisplayedHeadingWithHeading:](self, "_updateDisplayedHeadingWithHeading:");
}

- (void)locationManager:(id)a3 didUpdateVehicleHeading:(double)a4 timestamp:(id)a5
{
  [a3 vehicleHeadingOrCourse:a4];

  -[CarHeadingIndicatorView _updateDisplayedHeadingWithHeading:](self, "_updateDisplayedHeadingWithHeading:");
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (BOOL)contentsHidden
{
  return self->_contentsHidden;
}

- (void)setContentsHidden:(BOOL)a3
{
  self->_contentsHidden = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (int)compassPoint
{
  return self->_compassPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_headingLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end