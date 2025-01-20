@interface NavSecondarySignViewController
- (BOOL)_canShowWhileLocked;
- (MUBlurView)backgroundView;
- (NavSecondarySignViewController)init;
- (id)_currentSign;
- (id)_effectiveJunctionForSign:(id)a3;
- (void)_insertBackgroundView;
- (void)_updateSign;
- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4;
- (void)navigationService:(id)a3 showLaneDirections:(id)a4;
- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4;
- (void)setBackgroundView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation NavSecondarySignViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavSecondarySignViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)NavSecondarySignViewController;
  v2 = [(NavSecondarySignViewController *)&v9 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    [(NavSecondarySignViewController *)v2 setAccessibilityIdentifier:v4];

    uint64_t v5 = +[RouteStepListMetrics navSignMetrics];
    metrics = v2->_metrics;
    v2->_metrics = (RouteStepListMetrics *)v5;

    v7 = +[MNNavigationService sharedService];
    [v7 registerObserver:v2];
  }
  return v2;
}

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)NavSecondarySignViewController;
  [(NavSecondarySignViewController *)&v53 viewDidLoad];
  v3 = [(NavSecondarySignViewController *)self view];
  v4 = [v3 layer];
  [v4 setMasksToBounds:1];

  uint64_t v5 = objc_opt_new();
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAccessibilityIdentifier:@"ImageContainerView"];
  v6 = [(NavSecondarySignViewController *)self view];
  [v6 addSubview:v5];

  v7 = -[GuidanceManeuverView initWithFrame:textureProvider:]([GuidanceManeuverView alloc], "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  guidanceManeuverView = self->_guidanceManeuverView;
  self->_guidanceManeuverView = v7;

  [(GuidanceManeuverView *)self->_guidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(GuidanceManeuverView *)self->_guidanceManeuverView setFraming:1];
  [(GuidanceManeuverView *)self->_guidanceManeuverView setAlpha:0.800000012];
  [v5 addSubview:self->_guidanceManeuverView];
  objc_super v9 = (UILabel *)objc_opt_new();
  primaryTextLabel = self->_primaryTextLabel;
  self->_primaryTextLabel = v9;

  [(UILabel *)self->_primaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_primaryTextLabel setAccessibilityIdentifier:@"PrimaryTextLabel"];
  v11 = [(NavSecondarySignViewController *)self view];
  [v11 addSubview:self->_primaryTextLabel];

  v51 = [v5 leadingAnchor];
  v52 = [(NavSecondarySignViewController *)self view];
  v50 = [v52 leadingAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v54[0] = v49;
  v47 = [v5 topAnchor];
  v48 = [(NavSecondarySignViewController *)self view];
  v46 = [v48 topAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v54[1] = v45;
  v43 = [v5 bottomAnchor];
  v44 = [(NavSecondarySignViewController *)self view];
  v42 = [v44 bottomAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v54[2] = v41;
  v40 = [v5 widthAnchor];
  [(RouteStepListMetrics *)self->_metrics imageAreaWidth];
  v39 = [v40 constraintEqualToConstant:];
  v54[3] = v39;
  v37 = [(GuidanceManeuverView *)self->_guidanceManeuverView centerXAnchor];
  v36 = [v5 centerXAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v54[4] = v35;
  v34 = [(GuidanceManeuverView *)self->_guidanceManeuverView centerYAnchor];
  v38 = v5;
  v33 = [v5 centerYAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v54[5] = v32;
  v31 = [(GuidanceManeuverView *)self->_guidanceManeuverView widthAnchor];
  v30 = [v31 constraintEqualToConstant:36.0];
  v54[6] = v30;
  v29 = [(GuidanceManeuverView *)self->_guidanceManeuverView heightAnchor];
  v28 = [v29 constraintEqualToConstant:36.0];
  v54[7] = v28;
  v27 = [(UILabel *)self->_primaryTextLabel leadingAnchor];
  v26 = [v5 trailingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v54[8] = v25;
  v23 = [(UILabel *)self->_primaryTextLabel trailingAnchor];
  v24 = [(NavSecondarySignViewController *)self view];
  v22 = [v24 trailingAnchor];
  [(RouteStepListMetrics *)self->_metrics textTrailingMargin];
  v13 = [v23 constraintEqualToAnchor:v22 constant:-v12];
  v54[9] = v13;
  v14 = [(UILabel *)self->_primaryTextLabel centerYAnchor];
  v15 = [(NavSecondarySignViewController *)self view];
  v16 = [v15 centerYAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  v54[10] = v17;
  v18 = [(NavSecondarySignViewController *)self view];
  v19 = [v18 heightAnchor];
  v20 = [v19 constraintEqualToConstant:52.0];
  v54[11] = v20;
  v21 = +[NSArray arrayWithObjects:v54 count:12];
  +[NSLayoutConstraint activateConstraints:v21];

  [(NavSecondarySignViewController *)self _insertBackgroundView];
}

- (MUBlurView)backgroundView
{
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v4 = (MUBlurView *)[objc_alloc((Class)MUBlurView) initWithBlurEffectStyle:19];
    uint64_t v5 = self->_backgroundView;
    self->_backgroundView = v4;

    v6 = sub_1008263F8();
    [(MUBlurView *)self->_backgroundView setNonBlurredColor:v6];

    [(MUBlurView *)self->_backgroundView setBlurGroupName:@"NavSignBlur"];
    v7 = sub_100826494();
    [(MUBlurView *)self->_backgroundView setOverlayColor:v7];

    [(MUBlurView *)self->_backgroundView setStyle:2];
    [(MUBlurView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    backgroundView = self->_backgroundView;
  }

  return backgroundView;
}

- (void)_insertBackgroundView
{
  [(MUBlurView *)self->_backgroundView removeFromSuperview];
  backgroundView = self->_backgroundView;
  self->_backgroundView = 0;

  v4 = [(NavSecondarySignViewController *)self view];
  uint64_t v5 = [(NavSecondarySignViewController *)self backgroundView];
  [v4 insertSubview:v5 atIndex:0];

  id v10 = [(NavSecondarySignViewController *)self backgroundView];
  v6 = [(NavSecondarySignViewController *)self view];
  LODWORD(v7) = 1148846080;
  v8 = [v10 _maps_constraintsEqualToEdgesOfView:v6 priority:v7];
  objc_super v9 = [v8 allConstraints];
  +[NSLayoutConstraint activateConstraints:v9];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NavSecondarySignViewController;
  id v4 = a3;
  [(NavSecondarySignViewController *)&v11 traitCollectionDidChange:v4];
  uint64_t v5 = [(NavSecondarySignViewController *)self traitCollection];
  int v6 = sub_100045060(v4, v5);

  if (v6)
  {
    double v7 = [(NavSecondarySignViewController *)self traitCollection];
    id v8 = [v7 isLuminanceReduced];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100AAF0B8;
    v9[3] = &unk_1012E6300;
    char v10 = (char)v8;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:v8 animations:v9];
  }
}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5 = a4;
  int v6 = [v5 primarySign];
  double v7 = [v5 secondarySign];

  if (self->_isShowingMidstepLaneGuidance)
  {
    uint64_t v8 = [v6 uniqueID];
    objc_super v9 = (void *)v8;
    if (v8 | (uint64_t)self->_drawnPrimarySignID) {
      char v10 = [v8 isEqual:] ^ 1;
    }
    else {
      char v10 = 0;
    }

    if (self->_isShowingMidstepLaneGuidance)
    {
      unsigned int v11 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    char v10 = 0;
  }
  uint64_t v12 = [v7 uniqueID];
  v13 = (void *)v12;
  if (v12 | (uint64_t)self->_drawnSecondarySignID) {
    unsigned int v11 = [v12 isEqual:] ^ 1;
  }
  else {
    unsigned int v11 = 0;
  }

LABEL_12:
  latestPrimarySign = self->_latestPrimarySign;
  self->_latestPrimarySign = (MNGuidanceSignDescription *)v6;
  id v15 = v6;

  latestSecondarySign = self->_latestSecondarySign;
  self->_latestSecondarySign = (MNGuidanceSignDescription *)v7;

  if ((v10 & 1) != 0 || v11)
  {
    [(NavSecondarySignViewController *)self _updateSign];
  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  int isShowingMidstepLaneGuidance = self->_isShowingMidstepLaneGuidance;
  unsigned int v6 = [a4 isForManeuver:a3];
  self->_int isShowingMidstepLaneGuidance = v6 ^ 1;
  if (isShowingMidstepLaneGuidance != (v6 ^ 1))
  {
    [(NavSecondarySignViewController *)self _updateSign];
  }
}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  BOOL isShowingMidstepLaneGuidance = self->_isShowingMidstepLaneGuidance;
  self->_BOOL isShowingMidstepLaneGuidance = 0;
  if (isShowingMidstepLaneGuidance) {
    [(NavSecondarySignViewController *)self _updateSign];
  }
}

- (id)_currentSign
{
  uint64_t v2 = 7;
  if (!self->_isShowingMidstepLaneGuidance) {
    uint64_t v2 = 8;
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___NavSecondarySignViewController__metrics[v2]));
}

- (void)_updateSign
{
  v3 = [(MNGuidanceSignDescription *)self->_latestPrimarySign uniqueID];
  drawnPrimarySignID = self->_drawnPrimarySignID;
  self->_drawnPrimarySignID = v3;

  id v5 = [(MNGuidanceSignDescription *)self->_latestSecondarySign uniqueID];
  drawnSecondarySignID = self->_drawnSecondarySignID;
  self->_drawnSecondarySignID = v5;

  double v7 = [(NavSecondarySignViewController *)self _currentSign];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_super v9 = [v7 secondaryStrings];
    id v10 = [v9 count];

    if (v10)
    {
      id v11 = objc_alloc((Class)MKServerFormattedString);
      id v12 = [v8 secondaryStrings];
      v13 = [v12 firstObject];
      id v14 = [v11 initWithComposedString:v13];
    }
    else
    {
      id v15 = objc_alloc((Class)MKServerFormattedStringParameters);
      id v16 = [v8 distanceDetailLevel];
      v17 = [v8 variableOverrides];
      id v12 = [v15 initWithInstructionsDistanceDetailLevel:v16 variableOverrides:v17];

      v18 = [v8 details];
      v13 = [v18 firstObject];

      id v14 = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v13 parameters:v12];
    }
    v19 = v14;

    [(RouteStepListMetrics *)self->_metrics displayedAsSecondaryFontPointSize];
    double v21 = v20;
    [(RouteStepListMetrics *)self->_metrics displayedAsSecondaryFontWeight];
    v23 = +[UIFont systemFontOfSize:v21 weight:v22];
    v45[0] = NSForegroundColorAttributeName;
    v24 = [(RouteStepListMetrics *)self->_metrics displayedAsSecondaryTextColor];
    v46[0] = v24;
    v46[1] = v23;
    v45[1] = NSFontAttributeName;
    v45[2] = MKServerFormattedStringArtworkSizeAttributeKey;
    v46[2] = &off_1013AA1C8;
    v25 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
    v26 = [v19 multiPartAttributedStringWithAttributes:v25];
    v27 = [v26 attributedString];
    [(UILabel *)self->_primaryTextLabel setAttributedText:v27];
  }
  else
  {
    [(UILabel *)self->_primaryTextLabel setText:0];
  }
  v28 = [(NavSecondarySignViewController *)self _effectiveJunctionForSign:v8];
  if ([v28 numElements]) {
    id v29 = [objc_alloc((Class)MKJunction) initWithJunction:v28];
  }
  else {
    id v29 = 0;
  }
  v30 = [GuidanceManeuverArtwork alloc];
  id v31 = [v28 maneuverType];
  id v32 = [v28 drivingSide];
  v33 = [v8 artworkOverride];
  v34 = [(GuidanceManeuverArtwork *)v30 initWithManeuver:v31 junction:v29 drivingSide:v32 artworkDataSource:v33];
  [(GuidanceManeuverView *)self->_guidanceManeuverView setManeuverArtwork:v34];

  metrics = self->_metrics;
  if (metrics) {
    [(RouteStepListMetrics *)metrics secondaryArrowMetrics];
  }
  else {
    memset(__src, 0, sizeof(__src));
  }
  guidanceManeuverView = self->_guidanceManeuverView;
  memcpy(__dst, __src, sizeof(__dst));
  [(GuidanceManeuverView *)guidanceManeuverView setArrowMetrics:__dst];
  v37 = self->_metrics;
  if (v37) {
    [(RouteStepListMetrics *)v37 secondaryJunctionArrowMetrics];
  }
  else {
    memset(v42, 0, sizeof(v42));
  }
  v38 = self->_guidanceManeuverView;
  memcpy(v41, v42, sizeof(v41));
  [(GuidanceManeuverView *)v38 setJunctionArrowMetrics:v41];
  v39 = [(RouteStepListMetrics *)self->_metrics arrowColor];
  [(GuidanceManeuverView *)self->_guidanceManeuverView setArrowColor:v39];

  v40 = [(RouteStepListMetrics *)self->_metrics arrowAccentColor];
  [(GuidanceManeuverView *)self->_guidanceManeuverView setAccentColor:v40];
}

- (id)_effectiveJunctionForSign:(id)a3
{
  id v4 = (MNGuidanceSignDescription *)a3;
  latestPrimarySign = self->_latestPrimarySign;
  if (!latestPrimarySign) {
    goto LABEL_8;
  }
  unsigned int v6 = [(MNGuidanceSignDescription *)latestPrimarySign junction];
  unsigned int v7 = [v6 maneuverType];

  BOOL v8 = self->_latestSecondarySign != v4 || v7 - 85 > 1;
  if (!v8
    && ([(MNGuidanceSignDescription *)v4 junction],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 maneuverType],
        v9,
        v10 == v7))
  {
    id v11 = 0;
  }
  else
  {
LABEL_8:
    id v11 = [(MNGuidanceSignDescription *)v4 junction];
  }

  return v11;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_drawnSecondarySignID, 0);
  objc_storeStrong((id *)&self->_drawnPrimarySignID, 0);
  objc_storeStrong((id *)&self->_latestSecondarySign, 0);
  objc_storeStrong((id *)&self->_latestPrimarySign, 0);
  objc_storeStrong((id *)&self->_guidanceManeuverView, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end