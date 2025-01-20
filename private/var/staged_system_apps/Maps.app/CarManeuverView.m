@interface CarManeuverView
+ (BOOL)requiresConstraintBasedLayout;
- ($3A6EDEE00D58024242533228B225C6E2)primaryMetrics;
- (BOOL)_isDisplayingStartManeuver;
- (BOOL)_shouldShowLaneGuidance;
- (BOOL)_usesLargeScreenLayout;
- (BOOL)secondarySignVisible;
- (BOOL)shouldShowLaneGuidance;
- (BOOL)stopUpdatingCompressionStage;
- (CGSize)sizeForCompressionStage:(unint64_t)a3;
- (CarManeuverView)initWithGuidance:(id)a3 variant:(unint64_t)a4 destination:(unint64_t)a5 layoutType:(unint64_t)a6 sizeDataSource:(id)a7;
- (CarManeuverViewAnalyticsDelegate)analyticsDelegate;
- (CarManeuverViewSizeDataSource)sizeDataSource;
- (CarManeuverViewStyle)configuredStyle;
- (CarManeuverViewStyle)lowGuidanceStyle;
- (CarManeuverViewStyle)style;
- (NSArray)myConstraints;
- (NSDictionary)sizeByCompressionStage;
- (NSMutableDictionary)dynamicConstraints;
- (NavSignLaneGuidanceInfo)laneGuidance;
- (NavSignManeuverGuidanceInfo)guidance;
- (id)_instructionHorizontalPrimaryConstraint;
- (id)_maneuverArtworkForDirection:(int)a3;
- (id)_maneuverVerticalPrimaryConstraint;
- (id)_shieldImage;
- (id)_shieldViewPrimaryLeadingConstraint;
- (id)instructionsLabelLeadingAnchor;
- (id)maneuverViewCenteringAnchor;
- (int)GEOManeuverTypeForGEOLaneDirection:(int)a3;
- (int)_preferredDirectionForLaneGuidance;
- (int64_t)displayedLightLevel;
- (int64_t)labelLineBreakMode;
- (unint64_t)compressionStage;
- (unint64_t)compressionStageForSize:(CGSize)a3;
- (unint64_t)destination;
- (unint64_t)variant;
- (void)_setupConstraints;
- (void)_setupStyling;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)_updateContents;
- (void)_updateLabels;
- (void)_updateManeuverView;
- (void)_updateShield;
- (void)_updateStyling;
- (void)_updateSubviews;
- (void)alignSubviewsTo:(id)a3;
- (void)didMoveToWindow;
- (void)hideLaneGuidance;
- (void)layoutSubviews;
- (void)navSignLabel:(id)a3 didSelectAlternate:(unint64_t)a4;
- (void)resetCompressionSizes;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setBlurMode:(int)a3;
- (void)setCompressionStage:(unint64_t)a3;
- (void)setDisplayedLightLevel:(int64_t)a3;
- (void)setDynamicConstraints:(id)a3;
- (void)setLabelLineBreakMode:(int64_t)a3;
- (void)setLayoutType:(unint64_t)a3;
- (void)setMyConstraints:(id)a3;
- (void)setSecondarySignVisible:(BOOL)a3;
- (void)setSizeByCompressionStage:(id)a3;
- (void)setSizeDataSource:(id)a3;
- (void)setStopUpdatingCompressionStage:(BOOL)a3;
- (void)showLaneGuidance:(id)a3;
- (void)showLaneGuidanceFromManeuver:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLaneGuidance:(id)a3;
@end

@implementation CarManeuverView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarManeuverView)initWithGuidance:(id)a3 variant:(unint64_t)a4 destination:(unint64_t)a5 layoutType:(unint64_t)a6 sizeDataSource:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v34.receiver = self;
  v34.super_class = (Class)CarManeuverView;
  v15 = -[CarManeuverView initWithFrame:](&v34, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v16 = v15;
  if (v15)
  {
    [(CarManeuverView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_storeWeak((id *)&v16->_sizeDataSource, v14);
    uint64_t v17 = objc_opt_new();
    dynamicConstraints = v16->_dynamicConstraints;
    v16->_dynamicConstraints = (NSMutableDictionary *)v17;

    v16->_destination = a5;
    objc_storeStrong((id *)&v16->_guidance, a3);
    uint64_t v19 = +[CarManeuverViewStyle styleWithVariant:a4 destination:a5 layoutType:a6];
    configuredStyle = v16->_configuredStyle;
    v16->_configuredStyle = (CarManeuverViewStyle *)v19;

    uint64_t v21 = +[CarManeuverViewStyle styleWithVariant:1 destination:a5 layoutType:0];
    lowGuidanceStyle = v16->_lowGuidanceStyle;
    v16->_lowGuidanceStyle = (CarManeuverViewStyle *)v21;

    [(NavSignManeuverGuidanceInfo *)v16->_guidance addGuidanceObserver:v16];
    [(CarManeuverView *)v16 _setupSubviews];
    [(CarManeuverView *)v16 _setupStyling];
    [(CarManeuverView *)v16 _setupConstraints];
    [(CarManeuverView *)v16 _updateContents];
    v23 = sub_100577B3C();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      goto LABEL_10;
    }
    v24 = v16;
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    if (objc_opt_respondsToSelector())
    {
      v27 = [(CarManeuverView *)v24 performSelector:"accessibilityIdentifier"];
      v28 = v27;
      if (v27 && ![v27 isEqualToString:v26])
      {
        v29 = +[NSString stringWithFormat:@"%@<%p, %@>", v26, v24, v28];

        goto LABEL_8;
      }
    }
    v29 = +[NSString stringWithFormat:@"%@<%p>", v26, v24];
LABEL_8:

    v30 = sub_100BF4A60([(CarManeuverView *)v24 variant]);
    v31 = sub_1003DA3CC(v16->_destination);
    v32 = [v13 signID];
    *(_DWORD *)buf = 138544386;
    v36 = v29;
    __int16 v37 = 2112;
    v38 = v30;
    __int16 v39 = 2112;
    v40 = v31;
    __int16 v41 = 2112;
    id v42 = v13;
    __int16 v43 = 2114;
    v44 = v32;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}@] Initialized variant: %@, destination: %@, guidance: %@, %{public}@", buf, 0x34u);

    goto LABEL_9;
  }
LABEL_10:

  return v16;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)CarManeuverView;
  [(CarManeuverView *)&v36 layoutSubviews];
  v3 = sub_100577B3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = sub_100BF4A60([(CarManeuverView *)self variant]);
    [(CarManeuverView *)self frame];
    v5 = NSStringFromCGRect(v53);
    unint64_t v6 = [(CarManeuverView *)self compressionStage];
    v7 = [(CarManeuverView *)self style];
    id v8 = [v7 variant];
    int64_t v9 = [(NavSignLabel *)self->_instructionsLabel maxNumberOfTotalLines];
    int64_t v10 = [(CarManeuverView *)self labelLineBreakMode];
    unsigned int v11 = [(CarManeuverView *)self _shouldShowLaneGuidance];
    v12 = @"YES";
    if (!v11) {
      v12 = @"NO";
    }
    id v13 = v12;
    *(_DWORD *)buf = 138414082;
    v38 = v4;
    __int16 v39 = 2048;
    v40 = self;
    __int16 v41 = 2112;
    id v42 = v5;
    __int16 v43 = 2048;
    unint64_t v44 = v6;
    __int16 v45 = 2048;
    id v46 = v8;
    __int16 v47 = 2048;
    int64_t v48 = v9;
    __int16 v49 = 2048;
    int64_t v50 = v10;
    __int16 v51 = 2112;
    v52 = v13;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, layoutSubviews before updating styles, frame: %@, compressionStage: %lu, variant: %lu, instructionMaxLines: %ld, lineBreakMode: %ld, shouldShowLaneGuidance: %@", buf, 0x52u);
  }
  [(CarManeuverView *)self _updateStyling];
  [(CarManeuverView *)self _updateSubviews];
  [(CarManeuverView *)self _updateConstraints];
  [(NavSignLabel *)self->_distanceLabel updateLabelIfNeeded];
  [(NavSignLabel *)self->_instructionsLabel updateLabelIfNeeded];
  id v14 = [(CarManeuverView *)self style];
  if ([v14 variant]) {
    goto LABEL_6;
  }
  uint64_t v26 = [(UIImageView *)self->_shieldView image];
  if (!v26) {
    goto LABEL_6;
  }
  v27 = (void *)v26;
  v28 = [(UIImageView *)self->_shieldView image];
  [v28 size];
  double v30 = v29;

  if (v30 > 0.0)
  {
    [(UIImageView *)self->_shieldView frame];
    double v32 = v31;
    v33 = [(UIImageView *)self->_shieldView image];
    [v33 size];
    [(UIImageView *)self->_shieldView setHidden:v32 / v34 < 0.779999971];

    if ([(UIImageView *)self->_shieldView isHidden])
    {
      id v14 = sub_100577B3C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v35 = sub_100BF4A60([(CarManeuverView *)self variant]);
        *(_DWORD *)buf = 138412546;
        v38 = v35;
        __int16 v39 = 2048;
        v40 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, Hide exit shield because it scaled below the min threshold to fit with content.", buf, 0x16u);
      }
LABEL_6:
    }
  }
  v15 = sub_100577B3C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = sub_100BF4A60([(CarManeuverView *)self variant]);
    [(CarManeuverView *)self frame];
    uint64_t v17 = NSStringFromCGRect(v54);
    unint64_t v18 = [(CarManeuverView *)self compressionStage];
    uint64_t v19 = [(CarManeuverView *)self style];
    id v20 = [v19 variant];
    int64_t v21 = [(NavSignLabel *)self->_instructionsLabel maxNumberOfTotalLines];
    int64_t v22 = [(CarManeuverView *)self labelLineBreakMode];
    unsigned int v23 = [(CarManeuverView *)self _shouldShowLaneGuidance];
    v24 = @"YES";
    if (!v23) {
      v24 = @"NO";
    }
    v25 = v24;
    *(_DWORD *)buf = 138414082;
    v38 = v16;
    __int16 v39 = 2048;
    v40 = self;
    __int16 v41 = 2112;
    id v42 = v17;
    __int16 v43 = 2048;
    unint64_t v44 = v18;
    __int16 v45 = 2048;
    id v46 = v20;
    __int16 v47 = 2048;
    int64_t v48 = v21;
    __int16 v49 = 2048;
    int64_t v50 = v22;
    __int16 v51 = 2112;
    v52 = v25;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, layoutSubviews after updating styles, frame: %@, compressionStage: %lu, variant: %lu, instructionMaxLines: %ld, lineBreakMode: %ld, shouldShowLaneGuidance: %@", buf, 0x52u);
  }
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)CarManeuverView;
  [(CarManeuverView *)&v5 didMoveToWindow];
  v3 = [(CarManeuverView *)self window];
  [self->_configuredStyle setAlignmentStyle:[v3 _car_hybridInstrumentClusterAlignmentStyle]];

  v4 = [(CarManeuverView *)self window];
  [self->_lowGuidanceStyle setAlignmentStyle:[v4 _car_hybridInstrumentClusterAlignmentStyle]];

  [(CarManeuverView *)self resetCompressionSizes];
  [(CarManeuverView *)self _setupConstraints];
  [(CarManeuverView *)self _updateConstraints];
  [(CarManeuverView *)self _setupStyling];
}

- (void)setSecondarySignVisible:(BOOL)a3
{
  if (self->_secondarySignVisible != a3)
  {
    self->_secondarySignVisible = a3;
    [(CarManeuverView *)self setNeedsLayout];
    [(CarManeuverView *)self layoutIfNeeded];
  }
}

- (void)setCompressionStage:(unint64_t)a3
{
  if (self->_compressionStage != a3)
  {
    if ([(CarManeuverView *)self stopUpdatingCompressionStage])
    {
      objc_super v5 = sub_100577B3C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        unint64_t v6 = sub_100BF4A60([(CarManeuverView *)self variant]);
        unint64_t compressionStage = self->_compressionStage;
        int v16 = 138413058;
        uint64_t v17 = v6;
        __int16 v18 = 2048;
        uint64_t v19 = self;
        __int16 v20 = 2048;
        unint64_t v21 = compressionStage;
        __int16 v22 = 2048;
        unint64_t v23 = a3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, Tried to change compressionStage from: %lu to %lu, but stopUpdatingCompressionStage was set, so ignoring the call.", (uint8_t *)&v16, 0x2Au);
      }
    }
    else
    {
      id v8 = [(CarManeuverView *)self configuredStyle];
      BOOL v9 = [v8 variant] != (id)2 && (a3 == 6 || self->_compressionStage == 6);

      self->_unint64_t compressionStage = a3;
      unsigned int v11 = [(CarManeuverView *)self style];
      [v11 setCompressionStage:a3];

      if (v9)
      {
        [(CarManeuverView *)self _setupConstraints];
        [(CarManeuverView *)self _updateConstraints];
      }
      v12 = sub_100577B3C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = sub_100BF4A60([(CarManeuverView *)self variant]);
        id v14 = @"NO";
        if (v9) {
          id v14 = @"YES";
        }
        v15 = v14;
        int v16 = 138413058;
        uint64_t v17 = v13;
        __int16 v18 = 2048;
        uint64_t v19 = self;
        __int16 v20 = 2048;
        unint64_t v21 = a3;
        __int16 v22 = 2112;
        unint64_t v23 = (unint64_t)v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, setCompressionStage %lu. redoingConstraints: %@", (uint8_t *)&v16, 0x2Au);
      }
      [(CarManeuverView *)self setNeedsLayout];
      [(CarManeuverView *)self layoutIfNeeded];
    }
  }
}

- (void)setBlurMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_super v5 = [(CarManeuverView *)self style];
  unsigned int v6 = [v5 blurMode];

  if (v6 != v3)
  {
    v7 = [(CarManeuverView *)self style];
    [v7 setBlurMode:v3];

    [(CarManeuverView *)self _updateStyling];
  }
}

- (CarManeuverViewStyle)style
{
  uint64_t v3 = [(CarManeuverView *)self configuredStyle];
  id v4 = [v3 variant];

  if (v4 == (id)2 || [(CarManeuverView *)self compressionStage] < 6)
  {
    objc_super v5 = [(CarManeuverView *)self configuredStyle];
  }
  else
  {
    objc_super v5 = [(CarManeuverView *)self lowGuidanceStyle];
  }

  return (CarManeuverViewStyle *)v5;
}

- (unint64_t)variant
{
  v2 = [(CarManeuverView *)self configuredStyle];
  id v3 = [v2 variant];

  return (unint64_t)v3;
}

- (unint64_t)compressionStageForSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  unsigned int v6 = [(CarManeuverView *)self style];
  if ([v6 isSecondary]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 6;
  }

  unint64_t v8 = 0;
  while (1)
  {
    BOOL v9 = [(CarManeuverView *)self sizeByCompressionStage];
    int64_t v10 = +[NSNumber numberWithUnsignedInteger:v8];
    unsigned int v11 = [v9 objectForKeyedSubscript:v10];
    [v11 CGSizeValue];
    double v13 = v12;

    if (v13 < height) {
      break;
    }
    if (v7 == ++v8)
    {
      unint64_t v8 = v7;
      break;
    }
  }
  id v14 = sub_100577B3C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = sub_100BF4A60([(CarManeuverView *)self variant]);
    v26.CGFloat width = width;
    v26.double height = height;
    int v16 = NSStringFromCGSize(v26);
    int v18 = 138413058;
    uint64_t v19 = v15;
    __int16 v20 = 2048;
    unint64_t v21 = self;
    __int16 v22 = 2112;
    unint64_t v23 = v16;
    __int16 v24 = 2048;
    unint64_t v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, compressionStageForSize: %@, desiredStage: %lu", (uint8_t *)&v18, 0x2Au);
  }
  return v8;
}

- (void)resetCompressionSizes
{
  id v3 = sub_100577B3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = sub_100BF4A60([(CarManeuverView *)self variant]);
    [(CarManeuverView *)self frame];
    objc_super v5 = NSStringFromCGRect(v13);
    int v7 = 138412802;
    unint64_t v8 = v4;
    __int16 v9 = 2048;
    int64_t v10 = self;
    __int16 v11 = 2112;
    double v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, resetting compression sizes. (current frame: %@)", (uint8_t *)&v7, 0x20u);
  }
  sizeByCompressionStage = self->_sizeByCompressionStage;
  self->_sizeByCompressionStage = 0;
}

- (CGSize)sizeForCompressionStage:(unint64_t)a3
{
  objc_super v5 = [(CarManeuverView *)self sizeByCompressionStage];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    int v7 = [(CarManeuverView *)self sizeByCompressionStage];
    a3 = (unint64_t)[v7 count] - 1;
  }
  unint64_t v8 = [(CarManeuverView *)self sizeByCompressionStage];
  __int16 v9 = +[NSNumber numberWithUnsignedInteger:a3];
  int64_t v10 = [v8 objectForKeyedSubscript:v9];

  [v10 CGSizeValue];
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.CGFloat width = v15;
  return result;
}

- (NSDictionary)sizeByCompressionStage
{
  p_sizeByCompressionStage = &self->_sizeByCompressionStage;
  sizeByCompressionStage = self->_sizeByCompressionStage;
  if (!sizeByCompressionStage)
  {
    v55 = (id *)p_sizeByCompressionStage;
    objc_super v5 = sub_100577B3C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = sub_100BF4A60([(CarManeuverView *)self variant]);
      *(_DWORD *)buf = 138412546;
      v58 = v6;
      __int16 v59 = 2048;
      v60 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, sizing calculations began ----------------------------------", buf, 0x16u);
    }
    int v7 = objc_opt_new();
    id v8 = objc_alloc((Class)UIView);
    __int16 v9 = [(CarManeuverView *)self sizeDataSource];
    [v9 availableWidth];
    id v11 = [v8 initWithFrame:0.0, 0.0, v10, 1.79769313e308];

    double v12 = [CarManeuverView alloc];
    uint64_t v13 = [(CarManeuverView *)self guidance];
    double v14 = [(CarManeuverView *)self configuredStyle];
    id v53 = [v14 variant];
    double v15 = self;
    unint64_t v16 = [(CarManeuverView *)self destination];
    uint64_t v17 = [(CarManeuverView *)self configuredStyle];
    id v18 = [v17 layoutType];
    v56 = self;
    uint64_t v19 = [(CarManeuverView *)self sizeDataSource];
    __int16 v20 = v12;
    unint64_t v21 = (void *)v13;
    __int16 v22 = [(CarManeuverView *)v20 initWithGuidance:v13 variant:v53 destination:v16 layoutType:v18 sizeDataSource:v19];

    [(CarManeuverView *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarManeuverView *)v22 setLabelLineBreakMode:0];
    [(CarManeuverView *)v22 showLaneGuidanceFromManeuver:v15];
    [v11 addSubview:v22];
    CGRect v54 = [(CarManeuverView *)v22 topAnchor];
    v52 = [v11 topAnchor];
    __int16 v51 = [v54 constraintEqualToAnchor:v52];
    v63[0] = v51;
    unint64_t v23 = [(CarManeuverView *)v22 leadingAnchor];
    __int16 v24 = [v11 leadingAnchor];
    unint64_t v25 = [v23 constraintEqualToAnchor:v24];
    v63[1] = v25;
    CGSize v26 = [(CarManeuverView *)v22 trailingAnchor];
    v27 = [v11 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v63[2] = v28;
    double v29 = +[NSArray arrayWithObjects:v63 count:3];
    +[NSLayoutConstraint activateConstraints:v29];

    double v30 = [(CarManeuverView *)v56 style];
    LODWORD(v26) = [v30 isSecondary];

    uint64_t v31 = 0;
    if (v26) {
      uint64_t v32 = 2;
    }
    else {
      uint64_t v32 = 6;
    }
    do
    {
      [(CarManeuverView *)v22 setCompressionStage:v31];
      [v11 setNeedsLayout];
      [v11 layoutIfNeeded];
      [(CarManeuverView *)v22 frame];
      objc_super v36 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", v34, v35);
      __int16 v37 = +[NSNumber numberWithUnsignedInteger:v31];
      [v7 setObject:v36 forKeyedSubscript:v37];

      ++v31;
    }
    while (v32 != v31);
    v38 = [(CarManeuverView *)v56 style];
    unsigned __int8 v39 = [v38 isSecondary];

    if ((v39 & 1) == 0)
    {
      v40 = [(CarManeuverView *)v56 sizeDataSource];
      [v40 availableWidth];
      __int16 v41 = +[NSValue valueWithSize:](NSValue, "valueWithSize:");
      id v42 = +[NSNumber numberWithUnsignedInteger:v32];
      [v7 setObject:v41 forKeyedSubscript:v42];

      v32 |= 1uLL;
    }
    __int16 v43 = +[NSValue valueWithSize:](NSValue, "valueWithSize:", CGSizeZero.width, CGSizeZero.height);
    unint64_t v44 = +[NSNumber numberWithUnsignedInteger:v32];
    [v7 setObject:v43 forKeyedSubscript:v44];

    objc_storeStrong(v55, v7);
    __int16 v45 = sub_100577B3C();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      id v46 = sub_100BF4A60([(CarManeuverView *)v56 variant]);
      __int16 v47 = [v7 description];
      *(_DWORD *)buf = 138412802;
      v58 = v46;
      __int16 v59 = 2048;
      v60 = v56;
      __int16 v61 = 2112;
      v62 = v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, building sizeByCompressionStage: %@", buf, 0x20u);
    }
    int64_t v48 = sub_100577B3C();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      __int16 v49 = sub_100BF4A60([(CarManeuverView *)v56 variant]);
      *(_DWORD *)buf = 138412546;
      v58 = v49;
      __int16 v59 = 2048;
      v60 = v56;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, sizing calculations ended ----------------------------------", buf, 0x16u);
    }
    sizeByCompressionStage = (NSDictionary *)*v55;
  }

  return sizeByCompressionStage;
}

- (void)_setupSubviews
{
  id v3 = [NavSignLaneGuidanceView alloc];
  if ((id)[(CarManeuverView *)self destination] == (id)1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  objc_super v5 = [(NavSignLaneGuidanceView *)v3 initWithLaneStyle:v4];
  laneGuidanceView = self->_laneGuidanceView;
  self->_laneGuidanceView = v5;

  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1148846080;
  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setContentHuggingPriority:1 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setContentCompressionResistancePriority:1 forAxis:v8];
  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setHidden:1];
  [(CarManeuverView *)self addSubview:self->_laneGuidanceView];
  __int16 v9 = [GuidanceManeuverView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  uint64_t v13 = -[GuidanceManeuverView initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  maneuverView = self->_maneuverView;
  self->_maneuverView = v13;

  [(GuidanceManeuverView *)self->_maneuverView setShieldIdiom:1];
  [(GuidanceManeuverView *)self->_maneuverView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v15) = 1144733696;
  [(GuidanceManeuverView *)self->_maneuverView setContentCompressionResistancePriority:0 forAxis:v15];
  LODWORD(v16) = 1148846080;
  [(GuidanceManeuverView *)self->_maneuverView setContentCompressionResistancePriority:1 forAxis:v16];
  LODWORD(v17) = 1148846080;
  [(GuidanceManeuverView *)self->_maneuverView setContentHuggingPriority:0 forAxis:v17];
  id v18 = [(CarManeuverView *)self style];
  id v19 = [v18 variant];

  if (v19 != (id)2)
  {
    LODWORD(v20) = 1148846080;
    [(GuidanceManeuverView *)self->_maneuverView setContentHuggingPriority:1 forAxis:v20];
  }
  [(CarManeuverView *)self addSubview:self->_maneuverView];
  unint64_t v21 = -[NavSignLabel initWithFrame:]([NavSignLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  distanceLabel = self->_distanceLabel;
  self->_distanceLabel = v21;

  [(NavSignLabel *)self->_distanceLabel setAccessibilityIdentifier:@"DistanceLabel"];
  [(NavSignLabel *)self->_distanceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v23) = 1148813312;
  [(NavSignLabel *)self->_distanceLabel setContentCompressionResistancePriority:0 forAxis:v23];
  LODWORD(v24) = 1148846080;
  [(NavSignLabel *)self->_distanceLabel setContentCompressionResistancePriority:1 forAxis:v24];
  LODWORD(v25) = 1144750080;
  [(NavSignLabel *)self->_distanceLabel setContentHuggingPriority:0 forAxis:v25];
  [(NavSignLabel *)self->_distanceLabel setMaxNumberOfLinesWithPreferredFont:1];
  [(NavSignLabel *)self->_distanceLabel setMaxNumberOfLinesWithLongestAlternative:1];
  [(NavSignLabel *)self->_distanceLabel setMaxNumberOfTotalLines:1];
  [(NavSignLabel *)self->_distanceLabel setPerferredFontAdjustsFontSizeToFitWidth:1];
  CGSize v26 = [(NavSignLabel *)self->_distanceLabel font];
  [v26 pointSize];
  v28 = self->_distanceLabel;
  if (10.0 / v27 > 1.0)
  {
    [(NavSignLabel *)v28 setPreferredFontMinimumScaleFactor:1.0];
  }
  else
  {
    double v29 = [(NavSignLabel *)v28 font];
    [v29 pointSize];
    [(NavSignLabel *)self->_distanceLabel setPreferredFontMinimumScaleFactor:10.0 / v30];
  }
  [(NavSignLabel *)self->_distanceLabel setInlineShieldSize:4];
  [(NavSignLabel *)self->_distanceLabel setDelegate:self];
  [(CarManeuverView *)self addSubview:self->_distanceLabel];
  uint64_t v31 = -[NavSignLabel initWithFrame:]([NavSignLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  instructionsLabel = self->_instructionsLabel;
  self->_instructionsLabel = v31;

  [(NavSignLabel *)self->_instructionsLabel setAccessibilityIdentifier:@"InstructionsLabel"];
  [(NavSignLabel *)self->_instructionsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v33) = 1148846080;
  [(NavSignLabel *)self->_instructionsLabel setContentHuggingPriority:1 forAxis:v33];
  LODWORD(v34) = 1132068864;
  [(NavSignLabel *)self->_instructionsLabel setContentCompressionResistancePriority:0 forAxis:v34];
  LODWORD(v35) = 1148846080;
  [(NavSignLabel *)self->_instructionsLabel setContentCompressionResistancePriority:1 forAxis:v35];
  if (self->_destination == 2)
  {
    [(NavSignLabel *)self->_instructionsLabel setMaxNumberOfLinesWithLongestAlternative:1];
    objc_super v36 = [(NavSignLabel *)self->_instructionsLabel font];
    [v36 pointSize];
    v38 = self->_instructionsLabel;
    if (10.0 / v37 > 1.0)
    {
      [(NavSignLabel *)v38 setPreferredFontMinimumScaleFactor:1.0];
    }
    else
    {
      unsigned __int8 v39 = [(NavSignLabel *)v38 font];
      [v39 pointSize];
      [(NavSignLabel *)self->_instructionsLabel setPreferredFontMinimumScaleFactor:10.0 / v40];
    }
  }
  __int16 v41 = [(CarManeuverView *)self style];
  if ([v41 isSecondary]) {
    uint64_t v42 = 3;
  }
  else {
    uint64_t v42 = 4;
  }
  [(NavSignLabel *)self->_instructionsLabel setInlineShieldSize:v42];

  [(NavSignLabel *)self->_instructionsLabel setDelegate:self];
  [(CarManeuverView *)self addSubview:self->_instructionsLabel];
  __int16 v43 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  shieldView = self->_shieldView;
  self->_shieldView = v43;

  [(UIImageView *)self->_shieldView setAccessibilityIdentifier:@"ShieldView"];
  [(UIImageView *)self->_shieldView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_shieldView setContentMode:1];
  LODWORD(v45) = 1132068864;
  [(UIImageView *)self->_shieldView setContentCompressionResistancePriority:1 forAxis:v45];
  LODWORD(v46) = 1132068864;
  [(UIImageView *)self->_shieldView setContentCompressionResistancePriority:0 forAxis:v46];
  LODWORD(v47) = 1144750080;
  [(UIImageView *)self->_shieldView setContentHuggingPriority:0 forAxis:v47];
  int64_t v48 = self->_shieldView;

  [(CarManeuverView *)self addSubview:v48];
}

- (void)_setupStyling
{
  id v3 = [(CarManeuverView *)self style];
  self->_labelLineBreakMode = (int64_t)[v3 labelLineBreakMode];
  uint64_t v4 = [(CarManeuverView *)self sizeDataSource];
  [v4 dynamicPointScaleValue];

  memset(__src, 0, sizeof(__src));
  if (v3)
  {
    [v3 arrowMetrics];
    MKGuidanceManeuverArrowMetricsApplyScale();
    memset(v48, 0, 496);
    [v3 junctionArrowMetrics];
  }
  else
  {
    MKGuidanceManeuverArrowMetricsApplyScale();
    memset(v48, 0, sizeof(v48));
    long long v47 = 0u;
    long long v46 = 0u;
    long long v45 = 0u;
    long long v44 = 0u;
    long long v43 = 0u;
    long long v42 = 0u;
    long long v41 = 0u;
    long long v40 = 0u;
    long long v39 = 0u;
    long long v38 = 0u;
    long long v37 = 0u;
    long long v36 = 0u;
    long long v35 = 0u;
    long long v34 = 0u;
    long long v33 = 0u;
    long long v32 = 0u;
    long long v31 = 0u;
    long long v30 = 0u;
    long long v29 = 0u;
    long long v28 = 0u;
    long long v27 = 0u;
    long long v26 = 0u;
    long long v25 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
  }
  MKGuidanceManeuverArrowMetricsApplyScale();
  memcpy(__dst, __src, sizeof(__dst));
  [(GuidanceManeuverView *)self->_maneuverView setArrowMetrics:__dst];
  memcpy(v15, v48, sizeof(v15));
  [(GuidanceManeuverView *)self->_maneuverView setJunctionArrowMetrics:v15];
  -[GuidanceManeuverView setFraming:](self->_maneuverView, "setFraming:", [v3 desiredFraming]);
  objc_super v5 = [v3 arrowMainColor];
  [(GuidanceManeuverView *)self->_maneuverView setArrowColor:v5];

  id v6 = [v3 arrowAccentColor];
  [(GuidanceManeuverView *)self->_maneuverView setAccentColor:v6];

  double v7 = [(CarManeuverView *)self sizeDataSource];
  [v7 dynamicPointScaleValue];
  double v9 = v8;

  double v10 = [v3 instructionsPreferredFont];
  id v11 = [v10 _maps_scaledFontForScaleFactor:v9];
  [(NavSignLabel *)self->_instructionsLabel setPreferredFont:v11];

  double v12 = [v3 instructionsAlternateFont];
  uint64_t v13 = [v12 _maps_scaledFontForScaleFactor:v9];
  [(NavSignLabel *)self->_instructionsLabel setAlternateFont:v13];

  [v3 instructionsAlternateFontLineSpacing];
  -[NavSignLabel setAlternateFontLineSpacing:](self->_instructionsLabel, "setAlternateFontLineSpacing:");
  -[NavSignLabel setMaxNumberOfLinesWithPreferredFont:](self->_instructionsLabel, "setMaxNumberOfLinesWithPreferredFont:", [v3 instructionsMaxNumberOfLinesWithPreferredFont]);
  -[NavSignLabel setMaxNumberOfTotalLines:](self->_instructionsLabel, "setMaxNumberOfTotalLines:", [v3 instructionsMaxNumberOfTotalLines]);
  double v14 = [v3 instructionsColor];
  [(NavSignLabel *)self->_instructionsLabel setTextColor:v14];

  [(NavSignLabel *)self->_instructionsLabel setParagraphLineBreakMode:[(CarManeuverView *)self labelLineBreakMode]];
  [(NavSignLabel *)self->_instructionsLabel updateLabelIfNeeded];
  [(CarManeuverView *)self _updateStyling];
}

- (void)_setupConstraints
{
  id v3 = sub_100577B3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = sub_100BF4A60([(CarManeuverView *)self variant]);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, _setupConstraints", buf, 0x16u);
  }
  objc_super v5 = NSCollectionLayoutEdgeSpacing_ptr;
  id v6 = [(CarManeuverView *)self myConstraints];
  +[NSLayoutConstraint deactivateConstraints:v6];

  double v7 = [(CarManeuverView *)self dynamicConstraints];
  [v7 enumerateKeysAndObjectsUsingBlock:&stru_101315B50];

  double v8 = [(CarManeuverView *)self dynamicConstraints];
  [v8 removeAllObjects];

  double v9 = objc_opt_new();
  double v10 = [(UIImageView *)self->_shieldView heightAnchor];
  id v11 = [(CarManeuverView *)self sizeDataSource];
  [v11 dynamicPointScaleValue];
  double v13 = v12;

  double v14 = [v10 constraintLessThanOrEqualToConstant:v13 * 16.0];
  v233 = v14;
  BOOL v15 = 1;
  double v16 = +[NSArray arrayWithObjects:&v233 count:1];
  [v9 addObjectsFromArray:v16];

  long long v17 = [(CarManeuverView *)self laneGuidance];
  long long v18 = [v17 midStepTitles];
  if (![v18 count])
  {
    long long v19 = [(CarManeuverView *)self guidance];
    long long v20 = [v19 majorTextAlternatives];
    BOOL v15 = [v20 count] != 0;
  }
  long long v21 = [(CarManeuverView *)self style];
  id v22 = [v21 variant];

  if (v22 == (id)2)
  {
    v200 = [(NavSignLabel *)self->_instructionsLabel firstBaselineAnchor];
    v195 = [v200 maps_uniqueKey];
    v212[0] = v195;
    v191 = [(NavSignLabel *)self->_instructionsLabel firstBaselineAnchor];
    v184 = [(CarManeuverView *)self topAnchor];
    [(NavSignLabel *)self->_instructionsLabel inlineShieldFirstBaselineTopOffset];
    double v78 = 15.0;
    LODWORD(v78) = 1148846080;
    v80 = [v191 constraintEqualToAnchor:v184 constant:v79 + 15.0 priority:v78];
    v213[0] = v80;
    v81 = [(NavSignLabel *)self->_instructionsLabel lastBaselineAnchor];
    v82 = [v81 maps_uniqueKey];
    v212[1] = v82;
    v83 = [(NavSignLabel *)self->_instructionsLabel lastBaselineAnchor];
    v84 = [(CarManeuverView *)self bottomAnchor];
    [(NavSignLabel *)self->_instructionsLabel inlineShieldLastBaselineBottomOffset];
    double v85 = -9.0;
    LODWORD(v85) = 1148846080;
    [v83 constraintEqualToAnchor:v84 constant:v86 + -9.0 priority:v85];
    v87 = v207 = v9;
    v213[1] = v87;
    v88 = +[NSDictionary dictionaryWithObjects:v213 forKeys:v212 count:2];
    v89 = [(CarManeuverView *)self dynamicConstraints];
    [v89 setObject:v88 forKeyedSubscript:@"SecondaryLabelsBaselines"];

    v90 = [(CarManeuverView *)self dynamicConstraints];
    v91 = [v90 objectForKeyedSubscript:@"SecondaryLabelsBaselines"];
    v92 = [v91 allValues];
    [v207 addObjectsFromArray:v92];

    v201 = [(GuidanceManeuverView *)self->_maneuverView centerXAnchor];
    v196 = [v201 maps_uniqueKey];
    v210[0] = v196;
    v192 = [(GuidanceManeuverView *)self->_maneuverView leadingAnchor];
    v185 = [(CarManeuverView *)self leadingAnchor];
    v178 = [v192 constraintEqualToAnchor:v185 constant:9.0];
    v211[0] = v178;
    v93 = [(NavSignLabel *)self->_instructionsLabel leadingAnchor];
    v94 = [v93 maps_uniqueKey];
    v210[1] = v94;
    v95 = [(NavSignLabel *)self->_instructionsLabel leadingAnchor];
    v96 = [(GuidanceManeuverView *)self->_maneuverView trailingAnchor];
    v97 = [v95 constraintEqualToAnchor:v96 constant:9.0];
    v211[1] = v97;
    v98 = +[NSDictionary dictionaryWithObjects:v211 forKeys:v210 count:2];
    v99 = [(CarManeuverView *)self dynamicConstraints];
    [v99 setObject:v98 forKeyedSubscript:@"SecondaryAligningConstraintsSmallScreen"];

    v100 = [(CarManeuverView *)self dynamicConstraints];
    v101 = [v100 objectForKeyedSubscript:@"SecondaryAligningConstraintsSmallScreen"];
    v102 = [v101 allValues];
    [v207 addObjectsFromArray:v102];

    v202 = [(GuidanceManeuverView *)self->_maneuverView heightAnchor];
    v197 = [v202 constraintEqualToConstant:18.0];
    v209[0] = v197;
    v103 = [(GuidanceManeuverView *)self->_maneuverView widthAnchor];
    v104 = [v103 constraintGreaterThanOrEqualToConstant:13.0];
    v209[1] = v104;
    v105 = [(GuidanceManeuverView *)self->_maneuverView centerYAnchor];
    v106 = [(CarManeuverView *)self centerYAnchor];
    v107 = [v105 constraintEqualToAnchor:v106];
    v209[2] = v107;
    v108 = [(NavSignLabel *)self->_instructionsLabel trailingAnchor];
    v109 = [(CarManeuverView *)self trailingAnchor];
    v110 = [v108 constraintEqualToAnchor:v109 constant:-9.0];
    v209[3] = v110;
    v111 = +[NSArray arrayWithObjects:v209 count:4];
    [v207 addObjectsFromArray:v111];

    double v9 = v207;
    objc_super v5 = NSCollectionLayoutEdgeSpacing_ptr;

    v112 = v202;
LABEL_16:

    goto LABEL_17;
  }
  if (v22 == (id)1)
  {
    v208 = [(CarManeuverView *)self widthAnchor];
    v205 = [v208 constraintGreaterThanOrEqualToConstant:100.0];
    v214[0] = v205;
    v203 = [(GuidanceManeuverView *)self->_maneuverView topAnchor];
    v198 = [(CarManeuverView *)self topAnchor];
    v193 = [v203 constraintEqualToAnchor:v198 constant:11.0];
    v214[1] = v193;
    v186 = [(GuidanceManeuverView *)self->_maneuverView leadingAnchor];
    v179 = [(CarManeuverView *)self leadingAnchor];
    v174 = [v186 constraintEqualToAnchor:v179 constant:7.5];
    v214[2] = v174;
    v170 = [(GuidanceManeuverView *)self->_maneuverView trailingAnchor];
    v166 = [(NavSignLabel *)self->_distanceLabel leadingAnchor];
    v162 = [v170 constraintEqualToAnchor:v166 constant:-7.0];
    v214[3] = v162;
    v158 = [(GuidanceManeuverView *)self->_maneuverView heightAnchor];
    v154 = [v158 constraintEqualToConstant:23.0];
    v214[4] = v154;
    v150 = [(GuidanceManeuverView *)self->_maneuverView widthAnchor];
    v147 = [(GuidanceManeuverView *)self->_maneuverView heightAnchor];
    v144 = [v150 constraintEqualToAnchor:v147];
    v214[5] = v144;
    v141 = [(GuidanceManeuverView *)self->_maneuverView bottomAnchor];
    v138 = [(CarManeuverView *)self bottomAnchor];
    v136 = [v141 constraintEqualToAnchor:v138 constant:-11.0];
    v214[6] = v136;
    v134 = [(NavSignLabel *)self->_distanceLabel firstBaselineAnchor];
    v132 = [(CarManeuverView *)self topAnchor];
    v113 = [v134 constraintEqualToAnchor:v132 constant:29.0];
    v214[7] = v113;
    v114 = [(NavSignLabel *)self->_distanceLabel lastBaselineAnchor];
    v115 = [(CarManeuverView *)self bottomAnchor];
    [v114 constraintEqualToAnchor:v115 constant:-16.0];
    v117 = BOOL v116 = v15;
    v214[8] = v117;
    [(NavSignLabel *)self->_distanceLabel trailingAnchor];
    v119 = v118 = v9;
    v120 = [(CarManeuverView *)self trailingAnchor];
    double v121 = -4.0;
    if (v116) {
      double v121 = -11.0;
    }
    v122 = [v119 constraintEqualToAnchor:v120 constant:v121];
    v214[9] = v122;
    v123 = +[NSArray arrayWithObjects:v214 count:10];
    [v118 addObjectsFromArray:v123];

    double v9 = v118;
    objc_super v5 = NSCollectionLayoutEdgeSpacing_ptr;

    v112 = v208;
    goto LABEL_16;
  }
  if (!v22)
  {
    double v232 = 0.0;
    long long v230 = 0u;
    long long v231 = 0u;
    long long v228 = 0u;
    long long v229 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    long long v224 = 0u;
    long long v225 = 0u;
    memset(buf, 0, sizeof(buf));
    [(CarManeuverView *)self primaryMetrics];
    v199 = [(NavSignLaneGuidanceView *)self->_laneGuidanceView leadingAnchor];
    v187 = [(CarManeuverView *)self leadingAnchor];
    v180 = [v199 constraintEqualToAnchor:v187];
    v222[0] = v180;
    long long v23 = [(NavSignLaneGuidanceView *)self->_laneGuidanceView trailingAnchor];
    long long v24 = [(CarManeuverView *)self trailingAnchor];
    long long v25 = [v23 constraintEqualToAnchor:v24];
    v222[1] = v25;
    long long v26 = [(NavSignLaneGuidanceView *)self->_laneGuidanceView topAnchor];
    [(CarManeuverView *)self topAnchor];
    long long v27 = v194 = v15;
    [v26 constraintEqualToAnchor:v27 constant:v232];
    long long v28 = v206 = v9;
    v222[2] = v28;
    long long v29 = [(NavSignLaneGuidanceView *)self->_laneGuidanceView heightAnchor];
    long long v30 = [v29 constraintLessThanOrEqualToConstant:*((double *)&v231 + 1)];
    v222[3] = v30;
    long long v31 = +[NSArray arrayWithObjects:v222 count:4];
    [v206 addObjectsFromArray:v31];

    v188 = [(UIImageView *)self->_shieldView leadingAnchor];
    v181 = [v188 maps_uniqueKey];
    v220[0] = v181;
    v175 = [(CarManeuverView *)self _shieldViewPrimaryLeadingConstraint];
    v221[0] = v175;
    v171 = [(UIImageView *)self->_shieldView trailingAnchor];
    v167 = [v171 maps_uniqueKey];
    v220[1] = v167;
    v163 = [(UIImageView *)self->_shieldView trailingAnchor];
    v159 = [(CarManeuverView *)self trailingAnchor];
    v155 = [v163 constraintEqualToAnchor:v159 constant:*(double *)&v229];
    v221[1] = v155;
    v151 = [(GuidanceManeuverView *)self->_maneuverView topAnchor];
    v148 = [v151 maps_uniqueKey];
    v220[2] = v148;
    v145 = [(CarManeuverView *)self _maneuverVerticalPrimaryConstraint];
    v221[2] = v145;
    v142 = [(GuidanceManeuverView *)self->_maneuverView leadingAnchor];
    v139 = [v142 maps_uniqueKey];
    v220[3] = v139;
    v137 = [(GuidanceManeuverView *)self->_maneuverView leadingAnchor];
    v135 = [(CarManeuverView *)self leadingAnchor];
    v133 = [v137 constraintEqualToAnchor:v135 constant:*(double *)&buf[16]];
    v221[3] = v133;
    v131 = [(GuidanceManeuverView *)self->_maneuverView trailingAnchor];
    v130 = [v131 maps_uniqueKey];
    v220[4] = v130;
    v129 = [(GuidanceManeuverView *)self->_maneuverView trailingAnchor];
    v128 = [(NavSignLabel *)self->_distanceLabel leadingAnchor];
    v127 = [v129 constraintEqualToAnchor:v128 constant:*(double *)&buf[24]];
    v221[4] = v127;
    v126 = [(GuidanceManeuverView *)self->_maneuverView heightAnchor];
    long long v32 = [v126 maps_uniqueKey];
    v220[5] = v32;
    long long v33 = [(GuidanceManeuverView *)self->_maneuverView heightAnchor];
    long long v34 = [v33 constraintEqualToConstant:*(double *)&v224];
    v221[5] = v34;
    long long v35 = [(GuidanceManeuverView *)self->_maneuverView widthAnchor];
    long long v36 = [v35 maps_uniqueKey];
    v220[6] = v36;
    long long v37 = [(GuidanceManeuverView *)self->_maneuverView widthAnchor];
    long long v38 = [v37 constraintGreaterThanOrEqualToConstant:*((double *)&v224 + 1)];
    v221[6] = v38;
    long long v39 = +[NSDictionary dictionaryWithObjects:v221 forKeys:v220 count:7];
    long long v40 = [(CarManeuverView *)self dynamicConstraints];
    [v40 setObject:v39 forKeyedSubscript:@"PrimaryManeuverView"];

    v189 = [(UIImageView *)self->_shieldView leadingAnchor];
    v182 = [v189 maps_uniqueKey];
    v218[0] = v182;
    v172 = [(UIImageView *)self->_shieldView leadingAnchor];
    v176 = [(NavSignLabel *)self->_distanceLabel textTrailingLayoutGuide];
    v168 = [v176 trailingAnchor];
    v164 = [v172 constraintGreaterThanOrEqualToAnchor:v168 constant:*(double *)buf];
    v219[0] = v164;
    v160 = [(UIImageView *)self->_shieldView trailingAnchor];
    v156 = [v160 maps_uniqueKey];
    v218[1] = v156;
    v152 = [(UIImageView *)self->_shieldView trailingAnchor];
    long long v41 = [(CarManeuverView *)self trailingAnchor];
    long long v42 = [v152 constraintEqualToAnchor:v41 constant:*(double *)&v229];
    v219[1] = v42;
    long long v43 = [(NavSignLabel *)self->_distanceLabel leadingAnchor];
    long long v44 = [v43 maps_uniqueKey];
    v218[2] = v44;
    long long v45 = [(NavSignLabel *)self->_distanceLabel leadingAnchor];
    long long v46 = [(CarManeuverView *)self leadingAnchor];
    long long v47 = [v45 constraintEqualToAnchor:v46 constant:*(double *)&v225];
    v219[2] = v47;
    int64_t v48 = +[NSDictionary dictionaryWithObjects:v219 forKeys:v218 count:3];
    __int16 v49 = [(CarManeuverView *)self dynamicConstraints];
    [v49 setObject:v48 forKeyedSubscript:@"PrimaryNoManeuverView"];

    v190 = [(UIImageView *)self->_shieldView topAnchor];
    v183 = [v190 maps_uniqueKey];
    v216[0] = v183;
    v204 = [(UIImageView *)self->_shieldView topAnchor];
    v177 = [(CarManeuverView *)self topAnchor];
    v173 = [v204 constraintEqualToAnchor:v177 constant:*((double *)&v225 + 1)];
    v217[0] = v173;
    v169 = [(NavSignLabel *)self->_distanceLabel firstBaselineAnchor];
    v165 = [v169 maps_uniqueKey];
    v216[1] = v165;
    v161 = [(NavSignLabel *)self->_distanceLabel firstBaselineAnchor];
    v157 = [(CarManeuverView *)self topAnchor];
    v153 = [v161 constraintEqualToAnchor:v157 constant:*((double *)&v226 + 1)];
    v217[1] = v153;
    v149 = [(NavSignLabel *)self->_instructionsLabel firstBaselineAnchor];
    v146 = [v149 maps_uniqueKey];
    v216[2] = v146;
    v143 = [(NavSignLabel *)self->_instructionsLabel firstBaselineAnchor];
    v140 = [(CarManeuverView *)self topAnchor];
    double v50 = *(double *)&v228;
    [(NavSignLabel *)self->_instructionsLabel inlineShieldFirstBaselineTopOffset];
    LODWORD(v52) = 1148846080;
    id v53 = [v143 constraintEqualToAnchor:v140 constant:v50 + v51 priority:v52];
    v217[2] = v53;
    CGRect v54 = [(NavSignLabel *)self->_instructionsLabel lastBaselineAnchor];
    v55 = [v54 maps_uniqueKey];
    v216[3] = v55;
    v56 = [(NavSignLabel *)self->_instructionsLabel lastBaselineAnchor];
    v57 = [(CarManeuverView *)self bottomAnchor];
    double v58 = *((double *)&v230 + 1);
    [(NavSignLabel *)self->_instructionsLabel inlineShieldLastBaselineBottomOffset];
    LODWORD(v60) = 1148846080;
    __int16 v61 = [v56 constraintEqualToAnchor:v57 constant:v58 + v59 priority:v60];
    v217[3] = v61;
    v62 = +[NSDictionary dictionaryWithObjects:v217 forKeys:v216 count:4];
    v63 = [(CarManeuverView *)self dynamicConstraints];
    [v63 setObject:v62 forKeyedSubscript:@"PrimaryLabelsBaselines"];

    double v9 = v206;
    v64 = [(CarManeuverView *)self dynamicConstraints];
    v65 = [v64 objectForKeyedSubscript:@"PrimaryLabelsBaselines"];
    v66 = [v65 allValues];
    [v206 addObjectsFromArray:v66];

    v67 = [(NavSignLabel *)self->_distanceLabel trailingAnchor];
    v68 = [(CarManeuverView *)self trailingAnchor];
    v69 = [v67 constraintEqualToAnchor:v68 constant:*(double *)&v229];
    v215[0] = v69;
    v70 = [(CarManeuverView *)self _instructionHorizontalPrimaryConstraint];
    v215[1] = v70;
    v71 = [(NavSignLabel *)self->_instructionsLabel trailingAnchor];
    v72 = [(CarManeuverView *)self trailingAnchor];
    v73 = [v71 constraintEqualToAnchor:v72 constant:*(double *)&v230];
    v215[2] = v73;
    v74 = +[NSArray arrayWithObjects:v215 count:3];
    [v206 addObjectsFromArray:v74];

    if (!v194 && [(CarManeuverView *)self _usesLargeScreenLayout])
    {
      v75 = [(NavSignLabel *)self->_instructionsLabel centerYAnchor];
      v76 = [(CarManeuverView *)self centerYAnchor];
      v77 = [v75 constraintEqualToAnchor:v76];
      [v206 addObject:v77];
    }
    objc_super v5 = NSCollectionLayoutEdgeSpacing_ptr;
  }
LABEL_17:
  [(CarManeuverView *)self setMyConstraints:v9];
  v124 = v5[33];
  v125 = [(CarManeuverView *)self myConstraints];
  [v124 activateConstraints:v125];
}

- (void)alignSubviewsTo:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CarManeuverView *)self style];
  unsigned __int8 v6 = [v5 isSecondary];

  if (v6)
  {
    if (([v4 shouldShowLaneGuidance] & 1) == 0
      && [(CarManeuverView *)self _usesLargeScreenLayout]
      && ([v4 maneuverViewCenteringAnchor], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
      && (double v8 = (void *)v7,
          [v4 instructionsLabelLeadingAnchor],
          double v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      double v10 = [(CarManeuverView *)self dynamicConstraints];
      id v11 = [v10 objectForKeyedSubscript:@"SecondaryAligningConstraintsLargeScreen"];
      double v12 = [v11 allValues];
      +[NSLayoutConstraint deactivateConstraints:v12];

      double v13 = [(CarManeuverView *)self dynamicConstraints];
      double v14 = [v13 objectForKeyedSubscript:@"SecondaryAligningConstraintsSmallScreen"];
      BOOL v15 = [v14 allValues];
      +[NSLayoutConstraint deactivateConstraints:v15];

      long long v35 = [(GuidanceManeuverView *)self->_maneuverView centerXAnchor];
      long long v34 = [v35 maps_uniqueKey];
      v37[0] = v34;
      long long v33 = [(GuidanceManeuverView *)self->_maneuverView centerXAnchor];
      long long v32 = [v4 maneuverViewCenteringAnchor];
      double v16 = [v33 constraintEqualToAnchor:v32];
      v38[0] = v16;
      long long v17 = [(NavSignLabel *)self->_instructionsLabel leadingAnchor];
      long long v18 = [v17 maps_uniqueKey];
      v37[1] = v18;
      long long v19 = [(NavSignLabel *)self->_instructionsLabel leadingAnchor];
      long long v20 = [v4 instructionsLabelLeadingAnchor];
      long long v21 = [v19 constraintEqualToAnchor:v20];
      v38[1] = v21;
      id v22 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
      long long v23 = [(CarManeuverView *)self dynamicConstraints];
      [v23 setObject:v22 forKeyedSubscript:@"SecondaryAligningConstraintsLargeScreen"];

      long long v24 = [(CarManeuverView *)self dynamicConstraints];
      long long v25 = v24;
      CFStringRef v26 = @"SecondaryAligningConstraintsLargeScreen";
    }
    else
    {
      long long v27 = [(CarManeuverView *)self dynamicConstraints];
      long long v28 = [v27 objectForKeyedSubscript:@"SecondaryAligningConstraintsLargeScreen"];
      long long v29 = [v28 allValues];
      +[NSLayoutConstraint deactivateConstraints:v29];

      long long v24 = [(CarManeuverView *)self dynamicConstraints];
      long long v25 = v24;
      CFStringRef v26 = @"SecondaryAligningConstraintsSmallScreen";
    }
    long long v30 = [v24 objectForKeyedSubscript:v26];
    long long v31 = [v30 allValues];
    +[NSLayoutConstraint activateConstraints:v31];
  }
  else
  {
    long long v25 = sub_100577B3C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Failed to align primary and secondary CarManeuverViews, reason: called on primary view.", buf, 2u);
    }
  }
}

- (BOOL)_isDisplayingStartManeuver
{
  v2 = [(CarManeuverView *)self guidance];
  id v3 = [v2 maneuverArtwork];
  unsigned int v4 = [v3 maneuver];

  return ((v4 - 17) & 0xFFFFFFF7) == 0;
}

- (void)_updateLabels
{
  id v3 = [(CarManeuverView *)self laneGuidance];
  if ([v3 isForMidStep])
  {
    unsigned int v4 = [(CarManeuverView *)self style];
    unsigned __int8 v5 = [v4 isSecondary];

    if ((v5 & 1) == 0)
    {
      unsigned __int8 v6 = [(CarManeuverView *)self laneGuidance];
      uint64_t v7 = [v6 midStepTitles];
      id v8 = [v7 count];

      if (v8)
      {
        double v9 = [(CarManeuverView *)self laneGuidance];
        [v9 midStepTitles];
      }
      else
      {
        double v9 = [(CarManeuverView *)self guidance];
        [v9 majorTextAlternatives];
      long long v32 = };
      [(NavSignLabel *)self->_distanceLabel setTextAlternatives:v32];

      id v34 = [(CarManeuverView *)self laneGuidance];
      long long v33 = [v34 textAlternatives];
      [(NavSignLabel *)self->_instructionsLabel setTextAlternatives:v33];

      return;
    }
  }
  else
  {
  }
  if ([(CarManeuverView *)self _isDisplayingStartManeuver])
  {
    double v10 = [(CarManeuverView *)self style];
    if ([v10 variant] == (id)1)
    {
      id v11 = [(CarManeuverView *)self guidance];
      double v12 = [v11 majorTextAlternatives];
      id v13 = [v12 count];

      if (!v13)
      {
        double v14 = sub_100577D04();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Shown 'Start' instruction in low guidance sign", buf, 2u);
        }

        id v15 = objc_alloc((Class)MKServerFormattedString);
        id v16 = objc_alloc((Class)GEOComposedString);
        long long v17 = +[NSBundle mainBundle];
        long long v18 = [v17 localizedStringForKey:@"CarPlay_MiniSign_Start" value:@"localized string not found" table:0];
        id v19 = [v16 initWithString:v18];
        id v20 = [v15 initWithComposedString:v19];
        id v36 = v20;
        long long v21 = +[NSArray arrayWithObjects:&v36 count:1];
        [(NavSignLabel *)self->_distanceLabel setTextAlternatives:v21];

        return;
      }
    }
    else
    {
    }
  }
  id v22 = [(CarManeuverView *)self guidance];
  long long v23 = [v22 majorTextAlternatives];
  [(NavSignLabel *)self->_distanceLabel setTextAlternatives:v23];

  long long v24 = [(CarManeuverView *)self guidance];
  long long v25 = [v24 minorTextAlternatives];
  [(NavSignLabel *)self->_instructionsLabel setTextAlternatives:v25];

  if (self->_destination == 2)
  {
    CFStringRef v26 = [(NavSignLabel *)self->_distanceLabel text];
    id v27 = [v26 length];

    if (v27)
    {
      long long v28 = [(CarManeuverView *)self style];
      -[NavSignLabel setMaxNumberOfTotalLines:](self->_instructionsLabel, "setMaxNumberOfTotalLines:", [v28 instructionsMaxNumberOfTotalLines]);

      long long v29 = [(CarManeuverView *)self style];
      -[NavSignLabel setMaxNumberOfLinesWithPreferredFont:](self->_instructionsLabel, "setMaxNumberOfLinesWithPreferredFont:", [v29 instructionsMaxNumberOfLinesWithPreferredFont]);

      instructionsLabel = self->_instructionsLabel;
      uint64_t v31 = 1;
    }
    else
    {
      [(NavSignLabel *)self->_instructionsLabel setMaxNumberOfTotalLines:2];
      [(NavSignLabel *)self->_instructionsLabel setMaxNumberOfLinesWithPreferredFont:2];
      instructionsLabel = self->_instructionsLabel;
      uint64_t v31 = 2;
    }
    [(NavSignLabel *)instructionsLabel setMaxNumberOfLinesWithLongestAlternative:v31];
  }
}

- (void)_updateContents
{
  id v3 = [(NavSignLaneGuidanceInfo *)self->_laneGuidance lanes];
  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setLanes:v3];

  [(CarManeuverView *)self _updateManeuverView];
  [(CarManeuverView *)self _updateLabels];
  unsigned int v4 = [(CarManeuverView *)self style];
  id v5 = [v4 variant];

  if (v5 != (id)1)
  {
    [(CarManeuverView *)self _updateShield];
  }
}

- (void)_updateManeuverView
{
  if ([(NavSignLaneGuidanceInfo *)self->_laneGuidance isForMidStep])
  {
    id v4 = [(CarManeuverView *)self _maneuverArtworkForDirection:[(CarManeuverView *)self _preferredDirectionForLaneGuidance]];
    -[GuidanceManeuverView setManeuverArtwork:](self->_maneuverView, "setManeuverArtwork:");
  }
  else
  {
    id v4 = [(CarManeuverView *)self guidance];
    id v3 = [v4 maneuverArtwork];
    [(GuidanceManeuverView *)self->_maneuverView setManeuverArtwork:v3];
  }
}

- (void)_updateSubviews
{
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 userInterfaceLayoutDirection];

  id v5 = [(CarManeuverView *)self style];
  id v6 = [v5 variant];

  if (v6 == (id)2)
  {
    double v9 = &OBJC_IVAR___CarManeuverView__instructionsLabel;
    uint64_t v11 = 1;
    [(NavSignLaneGuidanceView *)self->_laneGuidanceView setHidden:1];
    [(NavSignLabel *)self->_distanceLabel setHidden:1];
    uint64_t v13 = 0;
    uint64_t v10 = 0;
    double v12 = &OBJC_IVAR___CarManeuverView__shieldView;
  }
  else if (v6 == (id)1)
  {
    double v9 = &OBJC_IVAR___CarManeuverView__instructionsLabel;
    uint64_t v10 = 1;
    [(NavSignLaneGuidanceView *)self->_laneGuidanceView setHidden:1];
    [(NavSignLabel *)self->_distanceLabel setHidden:0];
    [(NavSignLabel *)self->_distanceLabel setTextAlignment:4];
    uint64_t v13 = 0;
    double v12 = &OBJC_IVAR___CarManeuverView__shieldView;
    uint64_t v11 = 1;
  }
  else
  {
    if (v6) {
      return;
    }
    unsigned int v7 = [(CarManeuverView *)self shouldShowLaneGuidance];
    laneGuidanceView = self->_laneGuidanceView;
    if (v7)
    {
      [(NavSignLaneGuidanceView *)laneGuidanceView setHidden:0];
      double v9 = &OBJC_IVAR___CarManeuverView__instructionsLabel;
      [(NavSignLabel *)self->_distanceLabel setHidden:0];
      [(NavSignLabel *)self->_distanceLabel setTextAlignment:4];
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      double v12 = &OBJC_IVAR___CarManeuverView__shieldView;
      uint64_t v13 = 1;
    }
    else
    {
      [(NavSignLaneGuidanceView *)laneGuidanceView setHidden:1];
      [(NavSignLabel *)self->_distanceLabel setHidden:0];
      if ([(CarManeuverView *)self _usesLargeScreenLayout] && v4 == (id)1)
      {
        uint64_t v14 = 2;
      }
      else
      {
        unsigned int v15 = [(CarManeuverView *)self _usesLargeScreenLayout];
        if (v4 == (id)1) {
          int v16 = 1;
        }
        else {
          int v16 = v15;
        }
        if (v16) {
          uint64_t v14 = 0;
        }
        else {
          uint64_t v14 = 2;
        }
      }
      [(NavSignLabel *)self->_distanceLabel setTextAlignment:v14];
      uint64_t v13 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      double v12 = &OBJC_IVAR___CarManeuverView__instructionsLabel;
      double v9 = &OBJC_IVAR___CarManeuverView__shieldView;
    }
  }
  [(GuidanceManeuverView *)self->_maneuverView setHidden:v13];
  [*(id *)((char *)&self->super.super.super.isa + *v9) setHidden:v10];
  long long v17 = *(Class *)((char *)&self->super.super.super.isa + *v12);

  [v17 setHidden:v11];
}

- (void)_updateStyling
{
  id v3 = [(CarManeuverView *)self style];
  [v3 setHasLaneGuidance:[self shouldShowLaneGuidance]];
  id v4 = [(CarManeuverView *)self _shieldImage];
  [v3 setHasShield:v4 != 0];

  [v3 setSecondarySignVisible:[self secondarySignVisible]];
  [v3 setCompressionStage:[self compressionStage]];
  id v5 = [(CarManeuverView *)self style];
  id v6 = [v5 invalidArrowColor];

  [(GuidanceManeuverView *)self->_maneuverView setAccentColor:v6];
  [(NavSignLaneGuidanceView *)self->_laneGuidanceView setInvalidArrowColor:v6];
  unsigned int v7 = [(CarManeuverView *)self sizeDataSource];
  [v7 dynamicPointScaleValue];
  double v9 = v8;

  uint64_t v10 = [v3 distanceFont];
  uint64_t v11 = [v10 _maps_scaledFontForScaleFactor:v9];
  [(NavSignLabel *)self->_distanceLabel setPreferredFont:v11];

  double v12 = [(NavSignLabel *)self->_distanceLabel font];
  [v12 pointSize];
  distanceLabel = self->_distanceLabel;
  if (10.0 / v13 > 1.0)
  {
    [(NavSignLabel *)distanceLabel setPreferredFontMinimumScaleFactor:1.0];
  }
  else
  {
    unsigned int v15 = [(NavSignLabel *)distanceLabel font];
    [v15 pointSize];
    [(NavSignLabel *)self->_distanceLabel setPreferredFontMinimumScaleFactor:10.0 / v16];
  }
  long long v17 = [v3 distanceColor];
  [(NavSignLabel *)self->_distanceLabel setTextColor:v17];

  [(NavSignLabel *)self->_distanceLabel updateLabelIfNeeded];
  -[NavSignLabel setMaxNumberOfTotalLines:](self->_instructionsLabel, "setMaxNumberOfTotalLines:", [v3 instructionsMaxNumberOfTotalLines]);
  [(NavSignLabel *)self->_instructionsLabel setParagraphLineBreakMode:[(CarManeuverView *)self labelLineBreakMode]];
  long long v18 = [v3 instructionsPreferredFont];
  id v19 = [v18 _maps_scaledFontForScaleFactor:v9];
  [(NavSignLabel *)self->_instructionsLabel setPreferredFont:v19];

  id v20 = [v3 instructionsAlternateFont];
  long long v21 = [v20 _maps_scaledFontForScaleFactor:v9];
  [(NavSignLabel *)self->_instructionsLabel setAlternateFont:v21];

  -[NavSignLabel setShouldRemoveTextStartingAtFirstNewline:](self->_instructionsLabel, "setShouldRemoveTextStartingAtFirstNewline:", [v3 isSecondary]);
  -[NavSignLabel setPerferredFontAdjustsFontSizeToFitWidth:](self->_instructionsLabel, "setPerferredFontAdjustsFontSizeToFitWidth:", [v3 shouldScaleInstructionsPreferredFont]);
  [(NavSignLabel *)self->_instructionsLabel updateLabelIfNeeded];
  id v22 = sub_100577B3C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    long long v23 = sub_100BF4A60([(CarManeuverView *)self variant]);
    unint64_t v24 = [(CarManeuverView *)self compressionStage];
    long long v25 = [(CarManeuverView *)self style];
    id v26 = [v25 variant];
    int64_t v27 = [(NavSignLabel *)self->_instructionsLabel maxNumberOfTotalLines];
    int v28 = 138413570;
    long long v29 = v23;
    __int16 v30 = 2048;
    uint64_t v31 = self;
    __int16 v32 = 2048;
    unint64_t v33 = v24;
    __int16 v34 = 2048;
    id v35 = v26;
    __int16 v36 = 2048;
    int64_t v37 = v27;
    __int16 v38 = 2048;
    int64_t v39 = [(CarManeuverView *)self labelLineBreakMode];
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, _updateStyling. compressionStage: %lu, variant: %lu, instructionMaxLines: %ld, lineBreakMode: %ld", (uint8_t *)&v28, 0x3Eu);
  }
}

- ($3A6EDEE00D58024242533228B225C6E2)primaryMetrics
{
  id v5 = [(CarManeuverView *)self style];
  id v6 = [v5 layoutType];

  if (v6 == (id)2)
  {
    double v8 = &xmmword_100F73308;
LABEL_6:
    long long v9 = v8[9];
    *(_OWORD *)&retstr->var16 = v8[8];
    *(_OWORD *)&retstr->var18 = v9;
    retstr->var20 = *((double *)v8 + 20);
    long long v10 = v8[5];
    *(_OWORD *)&retstr->var8 = v8[4];
    *(_OWORD *)&retstr->var10 = v10;
    long long v11 = v8[7];
    *(_OWORD *)&retstr->var12 = v8[6];
    *(_OWORD *)&retstr->var14 = v11;
    long long v12 = v8[1];
    *(_OWORD *)&retstr->var0 = *v8;
    *(_OWORD *)&retstr->var2 = v12;
    long long v13 = v8[3];
    *(_OWORD *)&retstr->var4 = v8[2];
    *(_OWORD *)&retstr->var6 = v13;
    return result;
  }
  if (v6 != (id)1)
  {
    if (v6) {
      return result;
    }
    double v8 = &xmmword_100F73260;
    goto LABEL_6;
  }
  uint64_t v14 = [(CarManeuverView *)self sizeDataSource];
  [v14 dynamicPointScaleValue];
  double v19 = v15;

  retstr->var0 = v19 * 12.0;
  int64x2_t v16 = (int64x2_t)vmulq_n_f64((float64x2_t)xmmword_100F73220, v19);
  *(int64x2_t *)&retstr->var1 = vdupq_lane_s64(v16.i64[0], 0);
  int64x2_t v17 = (int64x2_t)vmulq_n_f64((float64x2_t)xmmword_100F73210, v19);
  *(int64x2_t *)&retstr->var3 = v17;
  retstr->var5 = v19 * 28.0;
  *(void *)&retstr->var6 = v16.i64[0];
  *(int64x2_t *)&retstr->var7 = v16;
  float64x2_t v18 = vmulq_n_f64((float64x2_t)xmmword_100F73230, v19);
  *(float64x2_t *)&retstr->var9 = v18;
  retstr->var11 = v18.f64[0];
  *(float64x2_t *)&retstr->var12 = vmulq_n_f64((float64x2_t)xmmword_100F73240, v19);
  *(int64x2_t *)&retstr->var14 = vzip1q_s64(v17, v16);
  *(void *)&retstr->var16 = v17.i64[0];
  *(float64x2_t *)&retstr->var17 = vmulq_n_f64((float64x2_t)xmmword_100F73250, v19);
  retstr->var19 = v19 * 29.0;
  retstr->var20 = v19 * 12.0;
  return result;
}

- (void)_updateConstraints
{
  id v3 = sub_100577B3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = sub_100BF4A60([(CarManeuverView *)self variant]);
    id v5 = [(CarManeuverView *)self style];
    id v6 = [v5 variant];
    unsigned int v7 = [(CarManeuverView *)self shouldShowLaneGuidance];
    double v8 = @"NO";
    if (v7) {
      double v8 = @"YES";
    }
    long long v9 = v8;
    *(_DWORD *)v92 = 138413058;
    *(void *)&v92[4] = v4;
    *(_WORD *)&v92[12] = 2048;
    *(void *)&v92[14] = self;
    __int16 v93 = 2048;
    id v94 = v6;
    __int16 v95 = 2112;
    v96 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, _updateConstraints. variant: %lu, shouldShowLaneGuidance: %@", v92, 0x2Au);
  }
  long long v10 = [(CarManeuverView *)self style];
  id v11 = [v10 variant];

  if (v11 == (id)2)
  {
    LODWORD(v12) = 1148829696;
    [(CarManeuverView *)self setContentCompressionResistancePriority:1 forAxis:v12];
    unint64_t v42 = [(NavSignLabel *)self->_instructionsLabel lineCount];
    instructionsLabel = self->_instructionsLabel;
    if (v42 == 1)
    {
      double v44 = 19.0;
      double v45 = -11.0;
    }
    else
    {
      [(NavSignLabel *)instructionsLabel inlineShieldFirstBaselineTopOffset];
      double v44 = v46 + 15.0;
      instructionsLabel = self->_instructionsLabel;
      double v45 = -9.0;
    }
    [(NavSignLabel *)instructionsLabel inlineShieldLastBaselineBottomOffset];
    double v48 = v45 + v47;
    __int16 v49 = [(CarManeuverView *)self dynamicConstraints];
    double v50 = [v49 objectForKeyedSubscript:@"SecondaryLabelsBaselines"];
    double v51 = [(NavSignLabel *)self->_instructionsLabel firstBaselineAnchor];
    double v52 = [v51 maps_uniqueKey];
    id v53 = [v50 objectForKeyedSubscript:v52];
    [v53 setConstant:v44];

    CGRect v54 = [(CarManeuverView *)self dynamicConstraints];
    v55 = [v54 objectForKeyedSubscript:@"SecondaryLabelsBaselines"];
    v56 = [(NavSignLabel *)self->_instructionsLabel lastBaselineAnchor];
    v57 = [v56 maps_uniqueKey];
    double v58 = [v55 objectForKeyedSubscript:v57];
    [v58 setConstant:v48];
  }
  else if (v11 == (id)1)
  {
    LODWORD(v12) = 1148846080;
    [(CarManeuverView *)self setContentCompressionResistancePriority:1 forAxis:v12];
  }
  else if (!v11)
  {
    LODWORD(v12) = 1148829696;
    [(CarManeuverView *)self setContentCompressionResistancePriority:1 forAxis:v12];
    uint64_t v104 = 0;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v97 = 0u;
    [(CarManeuverView *)self primaryMetrics];
    unsigned int v13 = [(CarManeuverView *)self shouldShowLaneGuidance];
    uint64_t v14 = [(CarManeuverView *)self dynamicConstraints];
    double v15 = v14;
    if (v13)
    {
      int64x2_t v16 = [v14 objectForKeyedSubscript:@"PrimaryManeuverView"];
      int64x2_t v17 = [v16 allValues];
      +[NSLayoutConstraint deactivateConstraints:v17];

      float64x2_t v18 = [(CarManeuverView *)self dynamicConstraints];
      double v19 = [v18 objectForKeyedSubscript:@"PrimaryNoManeuverView"];
      id v20 = [v19 allValues];
      +[NSLayoutConstraint activateConstraints:v20];

      double v21 = *(double *)&v98;
      id v22 = [(CarManeuverView *)self dynamicConstraints];
      long long v23 = [v22 objectForKeyedSubscript:@"PrimaryLabelsBaselines"];
      unint64_t v24 = [(UIImageView *)self->_shieldView topAnchor];
      long long v25 = [v24 maps_uniqueKey];
      id v26 = [v23 objectForKeyedSubscript:v25];
      [v26 setConstant:v21];

      double v27 = *(double *)&v99;
      int v28 = [(CarManeuverView *)self dynamicConstraints];
      long long v29 = [v28 objectForKeyedSubscript:@"PrimaryLabelsBaselines"];
      __int16 v30 = [(NavSignLabel *)self->_distanceLabel firstBaselineAnchor];
      uint64_t v31 = [v30 maps_uniqueKey];
      __int16 v32 = [v29 objectForKeyedSubscript:v31];
      [v32 setConstant:v27];

      double v33 = *((double *)&v100 + 1);
      [(NavSignLabel *)self->_instructionsLabel inlineShieldFirstBaselineTopOffset];
      double v35 = v33 + v34;
      __int16 v36 = [(CarManeuverView *)self dynamicConstraints];
      int64_t v37 = [v36 objectForKeyedSubscript:@"PrimaryLabelsBaselines"];
      __int16 v38 = [(NavSignLabel *)self->_instructionsLabel firstBaselineAnchor];
      int64_t v39 = [v38 maps_uniqueKey];
      long long v40 = [v37 objectForKeyedSubscript:v39];
      [v40 setConstant:v35];

      double v41 = *(double *)&v103;
    }
    else
    {
      double v59 = [v14 objectForKeyedSubscript:@"PrimaryNoManeuverView"];
      double v60 = [v59 allValues];
      +[NSLayoutConstraint deactivateConstraints:v60];

      __int16 v61 = [(CarManeuverView *)self dynamicConstraints];
      v62 = [v61 objectForKeyedSubscript:@"PrimaryManeuverView"];
      v63 = [v62 allValues];
      +[NSLayoutConstraint activateConstraints:v63];

      double v64 = *((double *)&v97 + 1);
      v65 = [(CarManeuverView *)self dynamicConstraints];
      v66 = [v65 objectForKeyedSubscript:@"PrimaryLabelsBaselines"];
      v67 = [(UIImageView *)self->_shieldView topAnchor];
      v68 = [v67 maps_uniqueKey];
      v69 = [v66 objectForKeyedSubscript:v68];
      [v69 setConstant:v64];

      v70 = [(CarManeuverView *)self _shieldImage];
      v71 = (double *)&v99 + 1;
      if (!v70) {
        v71 = (double *)&v98 + 1;
      }
      double v72 = *v71;
      v73 = [(CarManeuverView *)self dynamicConstraints];
      v74 = [v73 objectForKeyedSubscript:@"PrimaryLabelsBaselines"];
      v75 = [(NavSignLabel *)self->_distanceLabel firstBaselineAnchor];
      v76 = [v75 maps_uniqueKey];
      v77 = [v74 objectForKeyedSubscript:v76];
      [v77 setConstant:v72];

      [(NavSignLabel *)self->_instructionsLabel inlineShieldFirstBaselineTopOffset];
      double v79 = v78 + *(double *)&v100;
      v80 = [(CarManeuverView *)self dynamicConstraints];
      v81 = [v80 objectForKeyedSubscript:@"PrimaryLabelsBaselines"];
      v82 = [(NavSignLabel *)self->_instructionsLabel firstBaselineAnchor];
      v83 = [v82 maps_uniqueKey];
      v84 = [v81 objectForKeyedSubscript:v83];
      [v84 setConstant:v79];

      double v41 = *((double *)&v102 + 1);
    }
    [(NavSignLabel *)self->_instructionsLabel inlineShieldLastBaselineBottomOffset];
    double v86 = v41 + v85;
    v87 = [(CarManeuverView *)self dynamicConstraints];
    v88 = [v87 objectForKeyedSubscript:@"PrimaryLabelsBaselines"];
    v89 = [(NavSignLabel *)self->_instructionsLabel lastBaselineAnchor];
    v90 = [v89 maps_uniqueKey];
    v91 = [v88 objectForKeyedSubscript:v90];
    [v91 setConstant:v86];
  }
}

- (void)_updateShield
{
  id v5 = [(CarManeuverView *)self _shieldImage];
  id v3 = [(UIImageView *)self->_shieldView image];
  unsigned __int8 v4 = +[MNComparison isValue:v3 equalTo:v5];

  if ((v4 & 1) == 0) {
    [(UIImageView *)self->_shieldView setImage:v5];
  }
}

- (id)_shieldImage
{
  id v3 = [(CarManeuverView *)self guidance];
  unsigned __int8 v4 = [v3 signID];

  if (!+[MNComparison isValue:v4 equalTo:self->_lastRenderedShieldSignID])
  {
    objc_storeStrong((id *)&self->_lastRenderedShieldSignID, v4);
    id v5 = [(CarManeuverView *)self _screen];
    [v5 scale];
    double v7 = v6;

    double v8 = [(CarManeuverView *)self sizeDataSource];
    [v8 dynamicPointScaleValue];
    double v10 = v9;

    unint64_t v11 = [(CarManeuverView *)self destination];
    if (v11 == 1)
    {
      double v12 = [(CarManeuverView *)self traitCollection];
      BOOL v13 = [v12 userInterfaceStyle] == (id)2;
    }
    else
    {
      double v12 = [(CarManeuverView *)self style];
      BOOL v13 = [v12 blurMode] == 3;
    }
    uint64_t v14 = v13;

    double v15 = [(CarManeuverView *)self guidance];
    int64x2_t v16 = [v15 shieldInfo];
    int64x2_t v17 = [v16 _car_shieldImageWithSize:3 scale:v11 == 1 displayedInDashboard:v14 nightMode:v7];

    if (v17)
    {
      float64x2_t v18 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v17 image], 0, v7 / v10);
    }
    else
    {
      float64x2_t v18 = 0;
    }
    objc_storeStrong((id *)&self->_shieldImage, v18);
    if (v17) {
  }
    }
  double v19 = self->_shieldImage;

  return v19;
}

- (void)setLayoutType:(unint64_t)a3
{
  id v5 = [(CarManeuverView *)self configuredStyle];
  id v6 = [v5 layoutType];

  if (v6 != (id)a3)
  {
    double v7 = [(CarManeuverView *)self configuredStyle];
    [v7 setLayoutType:a3];

    double v8 = [(CarManeuverView *)self lowGuidanceStyle];
    [v8 setLayoutType:a3];

    [(CarManeuverView *)self resetCompressionSizes];
    [(CarManeuverView *)self _setupConstraints];
    [(CarManeuverView *)self _updateConstraints];
    [(CarManeuverView *)self _updateStyling];
    [(CarManeuverView *)self _updateSubviews];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CarManeuverView;
  id v4 = a3;
  [(CarManeuverView *)&v10 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  id v6 = [(CarManeuverView *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    lastRenderedShieldSignID = self->_lastRenderedShieldSignID;
    self->_lastRenderedShieldSignID = 0;

    double v9 = [(CarManeuverView *)self _shieldImage];
    [(UIImageView *)self->_shieldView setImage:v9];
  }
}

- (id)_shieldViewPrimaryLeadingConstraint
{
  unsigned __int8 v3 = [(CarManeuverView *)self _usesLargeScreenLayout];
  id v4 = [(UIImageView *)self->_shieldView leadingAnchor];
  if (v3)
  {
    id v5 = [(NavSignLabel *)self->_distanceLabel textTrailingLayoutGuide];
    id v6 = [v5 trailingAnchor];
    id v7 = [v4 constraintGreaterThanOrEqualToAnchor:v6 constant:12.0];
  }
  else
  {
    id v5 = [(GuidanceManeuverView *)self->_maneuverView trailingAnchor];
    id v7 = [v4 constraintGreaterThanOrEqualToAnchor:v5 constant:12.0];
  }

  return v7;
}

- (id)_maneuverVerticalPrimaryConstraint
{
  unsigned __int8 v3 = [(CarManeuverView *)self _usesLargeScreenLayout];
  maneuverView = self->_maneuverView;
  if (v3)
  {
    id v5 = [(GuidanceManeuverView *)maneuverView centerYAnchor];
    id v6 = [(CarManeuverView *)self centerYAnchor];
    [v5 constraintEqualToAnchor:v6];
  }
  else
  {
    id v5 = [(GuidanceManeuverView *)maneuverView topAnchor];
    id v6 = [(CarManeuverView *)self topAnchor];
    [v5 constraintEqualToAnchor:v6 constant:9.0];
  id v7 = };

  return v7;
}

- (id)_instructionHorizontalPrimaryConstraint
{
  unsigned __int8 v3 = [(CarManeuverView *)self _usesLargeScreenLayout];
  id v4 = [(NavSignLabel *)self->_instructionsLabel leadingAnchor];
  if (v3)
  {
    id v5 = [(NavSignLabel *)self->_distanceLabel leadingAnchor];
    [v4 constraintEqualToAnchor:v5];
  }
  else
  {
    id v5 = [(CarManeuverView *)self leadingAnchor];
    [v4 constraintEqualToAnchor:v5 constant:9.0];
  id v6 = };

  return v6;
}

- (id)maneuverViewCenteringAnchor
{
  return [(GuidanceManeuverView *)self->_maneuverView centerXAnchor];
}

- (id)instructionsLabelLeadingAnchor
{
  return [(NavSignLabel *)self->_instructionsLabel leadingAnchor];
}

- (BOOL)_usesLargeScreenLayout
{
  v2 = [(CarManeuverView *)self style];
  BOOL v3 = [v2 layoutType] == (id)1;

  return v3;
}

- (void)showLaneGuidance:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [(CarManeuverView *)self style];
    unsigned __int8 v7 = [v6 isSecondary];

    if ((v7 & 1) == 0)
    {
      double v8 = [v5 laneInfoId];
      double v9 = [(NavSignLaneGuidanceInfo *)self->_laneGuidance laneInfoId];
      unsigned __int8 v10 = [v8 isEqual:v9];

      if ((v10 & 1) == 0)
      {
        unint64_t v11 = sub_100577B3C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          double v12 = sub_100BF4A60([(CarManeuverView *)self variant]);
          int v14 = 138412546;
          double v15 = v12;
          __int16 v16 = 2048;
          int64x2_t v17 = self;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, showLaneGuidance", (uint8_t *)&v14, 0x16u);
        }
        BOOL v13 = [(CarManeuverView *)self sizeByCompressionStage];

        if (v13) {
          [(CarManeuverView *)self setSizeByCompressionStage:0];
        }
        objc_storeStrong((id *)&self->_laneGuidance, a3);
        [(CarManeuverView *)self _updateContents];
      }
    }
  }
}

- (void)updateLaneGuidance:(id)a3
{
  objc_storeStrong((id *)&self->_laneGuidance, a3);

  [(CarManeuverView *)self _updateLabels];
}

- (void)hideLaneGuidance
{
  BOOL v3 = [(CarManeuverView *)self style];
  id v4 = [v3 variant];

  if (v4 != (id)2 && self->_laneGuidance)
  {
    id v5 = sub_100577B3C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = sub_100BF4A60([(CarManeuverView *)self variant]);
      int v9 = 138412546;
      unsigned __int8 v10 = v6;
      __int16 v11 = 2048;
      double v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ maneuverView: %p, hideLaneGuidance", (uint8_t *)&v9, 0x16u);
    }
    unsigned __int8 v7 = [(CarManeuverView *)self sizeByCompressionStage];

    if (v7) {
      [(CarManeuverView *)self setSizeByCompressionStage:0];
    }
    laneGuidance = self->_laneGuidance;
    self->_laneGuidance = 0;

    [(CarManeuverView *)self _updateContents];
  }
}

- (void)showLaneGuidanceFromManeuver:(id)a3
{
  id v6 = a3;
  id v4 = [v6 laneGuidance];

  if (v4)
  {
    id v5 = [v6 laneGuidance];
    [(CarManeuverView *)self showLaneGuidance:v5];
  }
}

- (BOOL)shouldShowLaneGuidance
{
  if ([(CarManeuverView *)self compressionStage] > 4) {
    return 0;
  }

  return [(CarManeuverView *)self _shouldShowLaneGuidance];
}

- (BOOL)_shouldShowLaneGuidance
{
  BOOL v3 = [(CarManeuverView *)self laneGuidance];
  if (v3) {
    unsigned int v4 = ![(NavSignLaneGuidanceView *)self->_laneGuidanceView highlightedLanesNotInVisibleRange];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (int)_preferredDirectionForLaneGuidance
{
  BOOL v3 = [(NavSignLaneGuidanceInfo *)self->_laneGuidance highlightedLanes];
  unsigned int v4 = [v3 firstObject];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NavSignLaneGuidanceInfo *)self->_laneGuidance highlightedLanes];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v10 isPreferredLaneForManeuver])
        {
          id v11 = v10;

          unsigned int v4 = v11;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  double v12 = [v4 directions];
  id v13 = [v12 count];

  if (v13)
  {
    int v14 = [v4 directions];
    double v15 = [v14 firstObject];
    int v16 = [v15 direction];
  }
  else
  {
    int v16 = 0;
  }

  return v16;
}

- (id)_maneuverArtworkForDirection:(int)a3
{
  uint64_t v3 = [(CarManeuverView *)self GEOManeuverTypeForGEOLaneDirection:*(void *)&a3];

  return +[GuidanceManeuverArtwork artworkWithManeuver:v3];
}

- (int)GEOManeuverTypeForGEOLaneDirection:(int)a3
{
  int result = 3;
  if (a3 > 31)
  {
    if (a3 == 256) {
      int v4 = 4;
    }
    else {
      int v4 = 3;
    }
    if (a3 == 128) {
      int v5 = 62;
    }
    else {
      int v5 = v4;
    }
    if (a3 == 64) {
      int v6 = 1;
    }
    else {
      int v6 = 3;
    }
    if (a3 == 32) {
      int v7 = 60;
    }
    else {
      int v7 = v6;
    }
    if (a3 <= 127) {
      return v7;
    }
    else {
      return v5;
    }
  }
  else
  {
    switch(a3)
    {
      case 0:
        int result = 0;
        break;
      case 1:
      case 3:
      case 5:
      case 6:
      case 7:
        return result;
      case 2:
        int result = 63;
        break;
      case 4:
        int result = 2;
        break;
      case 8:
        int result = 61;
        break;
      default:
        if (a3 == 16) {
          int result = 4;
        }
        else {
          int result = 3;
        }
        break;
    }
  }
  return result;
}

- (void)navSignLabel:(id)a3 didSelectAlternate:(unint64_t)a4
{
  int v6 = (NavSignLabel *)a3;
  if (self->_distanceLabel == v6)
  {
    int v14 = v6;
    int v7 = [(CarManeuverView *)self analyticsDelegate];
    uint64_t v8 = [(CarManeuverView *)self guidance];
    int v9 = [v8 signID];
    unsigned __int8 v10 = v7;
    id v11 = self;
    unint64_t v12 = a4;
    uint64_t v13 = 1;
  }
  else
  {
    if (self->_instructionsLabel != v6) {
      goto LABEL_6;
    }
    int v14 = v6;
    int v7 = [(CarManeuverView *)self analyticsDelegate];
    uint64_t v8 = [(CarManeuverView *)self guidance];
    int v9 = [v8 signID];
    unsigned __int8 v10 = v7;
    id v11 = self;
    unint64_t v12 = a4;
    uint64_t v13 = 0;
  }
  [v10 carManeuverView:v11 didSelectAlternate:v12 forPrimaryString:v13 inSign:v9];

  int v6 = v14;
LABEL_6:
}

- (int64_t)displayedLightLevel
{
  return self->_displayedLightLevel;
}

- (void)setDisplayedLightLevel:(int64_t)a3
{
  self->_displayedLightLevel = a3;
}

- (NavSignManeuverGuidanceInfo)guidance
{
  return self->_guidance;
}

- (NavSignLaneGuidanceInfo)laneGuidance
{
  return self->_laneGuidance;
}

- (BOOL)secondarySignVisible
{
  return self->_secondarySignVisible;
}

- (BOOL)stopUpdatingCompressionStage
{
  return self->_stopUpdatingCompressionStage;
}

- (void)setStopUpdatingCompressionStage:(BOOL)a3
{
  self->_stopUpdatingCompressionStage = a3;
}

- (unint64_t)compressionStage
{
  return self->_compressionStage;
}

- (CarManeuverViewAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (CarManeuverViewAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void)setSizeByCompressionStage:(id)a3
{
}

- (CarManeuverViewStyle)configuredStyle
{
  return self->_configuredStyle;
}

- (CarManeuverViewStyle)lowGuidanceStyle
{
  return self->_lowGuidanceStyle;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (NSMutableDictionary)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
}

- (NSArray)myConstraints
{
  return self->_myConstraints;
}

- (void)setMyConstraints:(id)a3
{
}

- (int64_t)labelLineBreakMode
{
  return self->_labelLineBreakMode;
}

- (void)setLabelLineBreakMode:(int64_t)a3
{
  self->_labelLineBreakMode = a3;
}

- (CarManeuverViewSizeDataSource)sizeDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeDataSource);

  return (CarManeuverViewSizeDataSource *)WeakRetained;
}

- (void)setSizeDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sizeDataSource);
  objc_storeStrong((id *)&self->_myConstraints, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_lowGuidanceStyle, 0);
  objc_storeStrong((id *)&self->_configuredStyle, 0);
  objc_storeStrong((id *)&self->_sizeByCompressionStage, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_laneGuidance, 0);
  objc_storeStrong((id *)&self->_guidance, 0);
  objc_storeStrong((id *)&self->_lastRenderedShieldSignID, 0);
  objc_storeStrong((id *)&self->_shieldImage, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_maneuverView, 0);

  objc_storeStrong((id *)&self->_laneGuidanceView, 0);
}

@end