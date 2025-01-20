@interface CarNavigationGuidanceSign
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_shouldForceSecondaryManeuverViewHidden;
- (BOOL)isPointInJunctionView:(CGPoint)a3;
- (BOOL)junctionViewHidden;
- (BOOL)junctionViewTemporarilyHidden;
- (BOOL)secondaryViewHidden;
- (CarGuidanceCardSizeProviding)sizeProvider;
- (CarHairlineView)hairlineView;
- (CarManeuverView)nextPrimaryManeuver;
- (CarManeuverView)nextSecondaryManeuver;
- (CarManeuverView)primaryManeuver;
- (CarManeuverView)primaryManeuverView;
- (CarManeuverView)secondaryManeuver;
- (CarManeuverView)secondaryManeuverView;
- (CarNavigationGuidanceSign)initWithDestination:(unint64_t)a3;
- (GuidanceETA)latestETA;
- (NSArray)junctionViewConstraints;
- (NSArray)primaryManeuverConstraints;
- (NSArray)primaryViewOnlyConstraints;
- (NSArray)secondaryManeuverConstraints;
- (NSArray)secondaryViewConstraints;
- (NSLayoutConstraint)minimumCompressedContentLayoutGuideHeightConstraint;
- (NSLayoutConstraint)secondaryViewHeightConstraint;
- (NSString)description;
- (NSUUID)junctionViewInfoID;
- (NSUUID)laneGuidanceInfoID;
- (NSUUID)primaryGuidanceSignID;
- (NSUUID)secondaryGuidanceSignID;
- (NavJunctionViewController)junctionViewController;
- (NavJunctionViewInfo)junctionViewInfo;
- (NavSignLaneGuidanceInfo)laneGuidanceInfo;
- (NavSignManeuverGuidanceInfo)primaryGuidance;
- (NavSignManeuverGuidanceInfo)secondaryGuidance;
- (UILayoutGuide)minimumCompressedContentLayoutGuide;
- (UIView)junctionView;
- (UIView)primaryView;
- (UIView)secondaryView;
- (double)_heightForCompressionStage:(unint64_t)a3 isMaximumCompression:(BOOL *)a4;
- (double)availableWidth;
- (double)complementarySignHeightForManeuverView:(id)a3;
- (double)desiredHeight;
- (double)dynamicPointScaleValue;
- (double)maxAvailableHeightForJunctionView:(double)a3;
- (int64_t)signStyle;
- (unint64_t)_desiredCompressionStage;
- (unint64_t)_primaryManeuverViewVariant;
- (unint64_t)compressionStage;
- (unint64_t)destination;
- (unint64_t)layoutType;
- (void)_handleCarScreenSizeChange;
- (void)_prepareManeuverView:(id)a3;
- (void)_replacePrimaryViewManeuver:(id)a3 initialConstraints:(id)a4 finalConstraints:(id)a5 slide:(BOOL)a6;
- (void)_replaceSecondaryViewManeuver:(id)a3 initialConstraints:(id)a4 finalConstraints:(id)a5;
- (void)_resetPrecalculatedCompressionSizes;
- (void)_updateCompressionStage;
- (void)dealloc;
- (void)hideJunctionViewAnimated:(BOOL)a3;
- (void)hideJunctionViewTemporarily;
- (void)layoutSubviews;
- (void)refreshJunctionView;
- (void)setBlurMode:(int)a3;
- (void)setCompressionStage:(unint64_t)a3;
- (void)setDesiredHeight:(double)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setHairlineView:(id)a3;
- (void)setJunctionViewConstraints:(id)a3;
- (void)setJunctionViewController:(id)a3;
- (void)setJunctionViewHidden:(BOOL)a3;
- (void)setJunctionViewInfo:(id)a3;
- (void)setJunctionViewInfoID:(id)a3;
- (void)setJunctionViewTemporarilyHidden:(BOOL)a3;
- (void)setLaneGuidanceInfo:(id)a3;
- (void)setLaneGuidanceInfoID:(id)a3;
- (void)setLatestETA:(id)a3;
- (void)setLayoutType:(unint64_t)a3;
- (void)setMinimumCompressedContentLayoutGuideHeightConstraint:(id)a3;
- (void)setNextPrimaryManeuver:(id)a3;
- (void)setNextSecondaryManeuver:(id)a3;
- (void)setPrimaryGuidance:(id)a3;
- (void)setPrimaryGuidanceSignID:(id)a3;
- (void)setPrimaryManeuver:(id)a3;
- (void)setPrimaryManeuverConstraints:(id)a3;
- (void)setPrimaryView:(id)a3;
- (void)setPrimaryViewOnlyConstraints:(id)a3;
- (void)setSecondaryGuidance:(id)a3;
- (void)setSecondaryGuidanceSignID:(id)a3;
- (void)setSecondaryManeuver:(id)a3;
- (void)setSecondaryManeuverConstraints:(id)a3;
- (void)setSecondaryView:(id)a3;
- (void)setSecondaryViewConstraints:(id)a3;
- (void)setSecondaryViewHeightConstraint:(id)a3;
- (void)setSecondaryViewHidden:(BOOL)a3;
- (void)setSignStyle:(int64_t)a3;
- (void)setSizeProvider:(id)a3;
- (void)showJunctionViewAnimated:(BOOL)a3;
- (void)updateWithGroupAnimation:(id)a3;
@end

@implementation CarNavigationGuidanceSign

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CarNavigationGuidanceSign)initWithDestination:(unint64_t)a3
{
  v112.receiver = self;
  v112.super_class = (Class)CarNavigationGuidanceSign;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[CarNavigationGuidanceSign initWithFrame:](&v112, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v8 = v7;
  if (v7)
  {
    [(CarNavigationGuidanceSign *)v7 setAccessibilityIdentifier:@"CarNavigationGuidanceSign"];
    v8->_destination = a3;
    +[NSNotificationCenter defaultCenter];
    v9 = unint64_t v104 = a3;
    [v9 addObserver:v8 selector:"_handleCarScreenSizeChange" name:@"CarDisplayDidChangeConnectedNotification" object:0];

    v8->_desiredHeight = UIViewNoIntrinsicMetric;
    v8->_compressionStage = 0;
    v10 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    primaryView = v8->_primaryView;
    v8->_primaryView = v10;

    [(UIView *)v8->_primaryView setAccessibilityIdentifier:@"CarNavigationGuidanceSignPrimaryView"];
    [(UIView *)v8->_primaryView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1148846080;
    [(UIView *)v8->_primaryView setContentHuggingPriority:1 forAxis:v12];
    [(CarNavigationGuidanceSign *)v8 addSubview:v8->_primaryView];
    uint64_t v13 = +[CarHairlineView hairlineViewAlongAxis:0];
    hairlineView = v8->_hairlineView;
    v8->_hairlineView = (CarHairlineView *)v13;

    [(CarHairlineView *)v8->_hairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1148846080;
    [(CarHairlineView *)v8->_hairlineView setContentHuggingPriority:1 forAxis:v15];
    v16 = sub_100D89BDC();
    [(CarHairlineView *)v8->_hairlineView setBackgroundColor:v16];

    [(CarHairlineView *)v8->_hairlineView setHidden:1];
    [(CarNavigationGuidanceSign *)v8 addSubview:v8->_hairlineView];
    v17 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    secondaryView = v8->_secondaryView;
    v8->_secondaryView = v17;

    [(UIView *)v8->_secondaryView setAccessibilityIdentifier:@"CarNavigationGuidanceSignSecondaryView"];
    [(UIView *)v8->_secondaryView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 1148846080;
    [(UIView *)v8->_secondaryView setContentHuggingPriority:1 forAxis:v19];
    v20 = sub_100D89A9C((id)[(CarNavigationGuidanceSign *)v8 destination] == (id)1);
    [(UIView *)v8->_secondaryView setBackgroundColor:v20];

    [(UIView *)v8->_secondaryView setHidden:1];
    [(CarNavigationGuidanceSign *)v8 insertSubview:v8->_secondaryView belowSubview:v8->_primaryView];
    v101 = [(UIView *)v8->_primaryView topAnchor];
    v21 = [(CarNavigationGuidanceSign *)v8 topAnchor];
    v22 = [v101 constraintEqualToAnchor:v21];
    v119[0] = v22;
    v23 = [(UIView *)v8->_primaryView leadingAnchor];
    v24 = [(CarNavigationGuidanceSign *)v8 leadingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v119[1] = v25;
    v26 = [(UIView *)v8->_primaryView trailingAnchor];
    v27 = [(CarNavigationGuidanceSign *)v8 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v119[2] = v28;
    v29 = +[NSArray arrayWithObjects:v119 count:3];
    id v111 = [v29 mutableCopy];

    if (!v104)
    {
      v30 = objc_alloc_init(NavJunctionViewController);
      junctionViewController = v8->_junctionViewController;
      v8->_junctionViewController = v30;

      [(NavJunctionViewController *)v8->_junctionViewController setDelegate:v8];
      [(NavJunctionViewController *)v8->_junctionViewController setLightModeSource:0];
      v32 = [(CarNavigationGuidanceSign *)v8 junctionView];
      [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

      v33 = [(CarNavigationGuidanceSign *)v8 junctionView];
      LODWORD(v34) = 1132068864;
      [v33 setContentCompressionResistancePriority:1 forAxis:v34];

      v35 = [(CarNavigationGuidanceSign *)v8 junctionView];
      LODWORD(v36) = 1132068864;
      [v35 setContentCompressionResistancePriority:0 forAxis:v36];

      v37 = [(CarNavigationGuidanceSign *)v8 junctionView];
      [v37 setHidden:1];

      v38 = [(CarNavigationGuidanceSign *)v8 junctionView];
      [(CarNavigationGuidanceSign *)v8 insertSubview:v38 aboveSubview:v8->_secondaryView];

      v105 = [(CarNavigationGuidanceSign *)v8 junctionView];
      v102 = [v105 leadingAnchor];
      v99 = [(CarNavigationGuidanceSign *)v8 leadingAnchor];
      v97 = [v102 constraintEqualToAnchor:v99];
      v118[0] = v97;
      v39 = [(CarNavigationGuidanceSign *)v8 junctionView];
      v40 = [v39 trailingAnchor];
      v41 = [(CarNavigationGuidanceSign *)v8 trailingAnchor];
      v42 = [v40 constraintEqualToAnchor:v41];
      v118[1] = v42;
      v43 = [(CarNavigationGuidanceSign *)v8 junctionView];
      v44 = [v43 topAnchor];
      v45 = [(UIView *)v8->_primaryView bottomAnchor];
      v46 = [v44 constraintEqualToAnchor:v45];
      v118[2] = v46;
      v47 = +[NSArray arrayWithObjects:v118 count:3];
      [v111 addObjectsFromArray:v47];

      v48 = [(CarNavigationGuidanceSign *)v8 junctionView];
      v49 = [v48 bottomAnchor];
      v50 = [(CarNavigationGuidanceSign *)v8 bottomAnchor];
      v51 = [v49 constraintEqualToAnchor:v50];
      v117 = v51;
      v52 = +[NSArray arrayWithObjects:&v117 count:1];
      [(CarNavigationGuidanceSign *)v8 setJunctionViewConstraints:v52];
    }
    +[NSLayoutConstraint activateConstraints:v111];
    v53 = [(UIView *)v8->_primaryView bottomAnchor];
    v54 = [(CarNavigationGuidanceSign *)v8 bottomAnchor];
    LODWORD(v55) = 1148846080;
    v56 = [v53 constraintEqualToAnchor:v54 constant:0.0 priority:v55];
    v116 = v56;
    v57 = +[NSArray arrayWithObjects:&v116 count:1];
    [(CarNavigationGuidanceSign *)v8 setPrimaryViewOnlyConstraints:v57];

    v58 = [(UIView *)v8->_secondaryView heightAnchor];
    uint64_t v59 = [v58 constraintLessThanOrEqualToConstant:200.0];
    secondaryViewHeightConstraint = v8->_secondaryViewHeightConstraint;
    v8->_secondaryViewHeightConstraint = (NSLayoutConstraint *)v59;

    v61 = [(CarNavigationGuidanceSign *)v8 primaryViewOnlyConstraints];
    +[NSLayoutConstraint activateConstraints:v61];

    v115 = v8->_secondaryViewHeightConstraint;
    v62 = +[NSArray arrayWithObjects:&v115 count:1];
    +[NSLayoutConstraint activateConstraints:v62];

    v108 = [(UIView *)v8->_primaryView bottomAnchor];
    v106 = [(CarHairlineView *)v8->_hairlineView topAnchor];
    LODWORD(v63) = 1148846080;
    v103 = [v108 constraintEqualToAnchor:v106 constant:0.0 priority:v63];
    v114[0] = v103;
    v100 = [(CarHairlineView *)v8->_hairlineView leftAnchor];
    v98 = [(CarNavigationGuidanceSign *)v8 leftAnchor];
    v96 = [v100 constraintEqualToAnchor:v98];
    v114[1] = v96;
    v95 = [(CarHairlineView *)v8->_hairlineView rightAnchor];
    v94 = [(CarNavigationGuidanceSign *)v8 rightAnchor];
    v93 = [v95 constraintEqualToAnchor:v94];
    v114[2] = v93;
    v107 = [(CarHairlineView *)v8->_hairlineView bottomAnchor];
    v92 = [(UIView *)v8->_secondaryView topAnchor];
    LODWORD(v64) = 1148846080;
    v91 = [v107 constraintEqualToAnchor:v92 constant:0.0 priority:v64];
    v114[3] = v91;
    v90 = [(UIView *)v8->_secondaryView leadingAnchor];
    v65 = [(CarNavigationGuidanceSign *)v8 leadingAnchor];
    v66 = [v90 constraintEqualToAnchor:v65];
    v114[4] = v66;
    v67 = [(UIView *)v8->_secondaryView trailingAnchor];
    v68 = [(CarNavigationGuidanceSign *)v8 trailingAnchor];
    v69 = [v67 constraintEqualToAnchor:v68];
    v114[5] = v69;
    v70 = [(UIView *)v8->_secondaryView bottomAnchor];
    v71 = [(CarNavigationGuidanceSign *)v8 bottomAnchor];
    LODWORD(v72) = 1148846080;
    v73 = [v70 constraintEqualToAnchor:v71 constant:0.0 priority:v72];
    v114[6] = v73;
    v74 = +[NSArray arrayWithObjects:v114 count:7];
    [(CarNavigationGuidanceSign *)v8 setSecondaryViewConstraints:v74];

    v75 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    minimumCompressedContentLayoutGuide = v8->_minimumCompressedContentLayoutGuide;
    v8->_minimumCompressedContentLayoutGuide = v75;

    [(CarNavigationGuidanceSign *)v8 addLayoutGuide:v8->_minimumCompressedContentLayoutGuide];
    v77 = [(UILayoutGuide *)v8->_minimumCompressedContentLayoutGuide heightAnchor];
    v78 = [v77 constraintEqualToConstant:0.0];
    [(CarNavigationGuidanceSign *)v8 setMinimumCompressedContentLayoutGuideHeightConstraint:v78];

    v110 = [(UILayoutGuide *)v8->_minimumCompressedContentLayoutGuide leadingAnchor];
    v109 = [(CarNavigationGuidanceSign *)v8 leadingAnchor];
    v79 = [v110 constraintEqualToAnchor:v109];
    v113[0] = v79;
    v80 = [(CarNavigationGuidanceSign *)v8 trailingAnchor];
    v81 = [(UILayoutGuide *)v8->_minimumCompressedContentLayoutGuide trailingAnchor];
    v82 = [v80 constraintEqualToAnchor:v81];
    v113[1] = v82;
    v83 = [(UILayoutGuide *)v8->_minimumCompressedContentLayoutGuide topAnchor];
    v84 = [(CarNavigationGuidanceSign *)v8 topAnchor];
    v85 = [v83 constraintEqualToAnchor:v84];
    v113[2] = v85;
    v86 = [(CarNavigationGuidanceSign *)v8 minimumCompressedContentLayoutGuideHeightConstraint];
    v113[3] = v86;
    v87 = +[NSArray arrayWithObjects:v113 count:4];
    +[NSLayoutConstraint activateConstraints:v87];

    v88 = [(CarNavigationGuidanceSign *)v8 sizeProvider];
    v8->_layoutType = (unint64_t)[v88 maneuverViewLayoutType];
  }
  return v8;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"CarDisplayDidChangeConnectedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)CarNavigationGuidanceSign;
  [(CarNavigationGuidanceSign *)&v4 dealloc];
}

- (void)setSignStyle:(int64_t)a3
{
  if (self->_signStyle != a3) {
    self->_signStyle = a3;
  }
}

- (double)_heightForCompressionStage:(unint64_t)a3 isMaximumCompression:(BOOL *)a4
{
  v7 = [(CarNavigationGuidanceSign *)self secondaryGuidanceSignID];

  v8 = [(CarNavigationGuidanceSign *)self junctionView];
  if (v8)
  {
    v9 = [(CarNavigationGuidanceSign *)self junctionViewInfo];
    BOOL v10 = v9 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  +[CarNavigationGuidanceSignCompression compressionForStage:a3 hasSecondary:v7 != 0 hasJunctionView:v10 forDestination:[(CarNavigationGuidanceSign *)self destination]];
  v11 = [(CarNavigationGuidanceSign *)self primaryManeuverView];
  [v11 sizeForCompressionStage:0];
  double v13 = v12;

  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = v13;
  if (![(CarNavigationGuidanceSign *)self _shouldForceSecondaryManeuverViewHidden])
  {
    v17 = [(CarNavigationGuidanceSign *)self secondaryManeuverView];
    double v16 = v13;
    if (v17)
    {

      v18 = [(CarNavigationGuidanceSign *)self secondaryManeuverView];
      [v18 sizeForCompressionStage:0];
      double v15 = v19;

      double v16 = v13 + v15;
      if (v15 > 0.0)
      {
        v20 = [(CarNavigationGuidanceSign *)self hairlineView];
        [v20 frame];
        double v16 = v16 + CGRectGetHeight(v41);
      }
    }
  }
  if (v10)
  {
    v21 = [(CarNavigationGuidanceSign *)self junctionView];
    [v21 bounds];
    double v14 = CGRectGetWidth(v42) * 0.352657005;

    double v16 = v16 + v14 - v15;
  }
  if (a4) {
    *a4 = 0;
  }
  v22 = sub_100577B3C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
    *(_DWORD *)buf = 138414082;
    v26 = v23;
    __int16 v27 = 2048;
    v28 = self;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    __int16 v31 = 2080;
    v32 = "";
    __int16 v33 = 2048;
    double v34 = v13;
    __int16 v35 = 2048;
    double v36 = v15;
    __int16 v37 = 2048;
    double v38 = v14;
    __int16 v39 = 2048;
    double v40 = v16;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, _heightForCompressionStage %lu%s, primary: %.1f, secondary: %.1f, junctionViewHeight: %.1f, total: %.1f", buf, 0x52u);
  }
  return v16;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CarNavigationGuidanceSign;
  [(CarNavigationGuidanceSign *)&v12 layoutSubviews];
  v3 = [(CarNavigationGuidanceSign *)self primaryManeuverView];

  if (v3)
  {
    objc_super v4 = [(CarNavigationGuidanceSign *)self sizeProvider];
    -[CarNavigationGuidanceSign setLayoutType:](self, "setLayoutType:", [v4 maneuverViewLayoutType]);

    [(CarNavigationGuidanceSign *)self _updateCompressionStage];
    uint64_t v5 = [(CarNavigationGuidanceSign *)self junctionViewInfo];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(CarNavigationGuidanceSign *)self junctionView];
      unsigned __int8 v8 = [v7 isHidden];

      if ((v8 & 1) == 0)
      {
        [(CarNavigationGuidanceSign *)self maxAvailableHeightForJunctionView:0.0];
        double v10 = v9;
        v11 = [(CarNavigationGuidanceSign *)self junctionViewController];
        [v11 setAvailableHeight:v10];
      }
    }
  }
}

- (CarManeuverView)primaryManeuverView
{
  v3 = [(CarNavigationGuidanceSign *)self nextPrimaryManeuver];

  if (v3)
  {
    objc_super v4 = [(CarNavigationGuidanceSign *)self nextPrimaryManeuver];
  }
  else
  {
    uint64_t v5 = [(CarNavigationGuidanceSign *)self primaryManeuver];

    if (v5)
    {
      objc_super v4 = [(CarNavigationGuidanceSign *)self primaryManeuver];
    }
    else
    {
      objc_super v4 = 0;
    }
  }

  return (CarManeuverView *)v4;
}

- (CarManeuverView)secondaryManeuverView
{
  v3 = [(CarNavigationGuidanceSign *)self secondaryGuidanceSignID];

  if (!v3) {
    goto LABEL_6;
  }
  objc_super v4 = [(CarNavigationGuidanceSign *)self nextSecondaryManeuver];

  if (v4)
  {
    uint64_t v5 = [(CarNavigationGuidanceSign *)self nextSecondaryManeuver];
    goto LABEL_7;
  }
  v6 = [(CarNavigationGuidanceSign *)self secondaryManeuver];

  if (v6)
  {
    uint64_t v5 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
  }
  else
  {
LABEL_6:
    uint64_t v5 = 0;
  }
LABEL_7:

  return (CarManeuverView *)v5;
}

- (UIView)junctionView
{
  v2 = [(CarNavigationGuidanceSign *)self junctionViewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (BOOL)isPointInJunctionView:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6 = [(CarNavigationGuidanceSign *)self junctionViewInfo];
  if (v6)
  {
    v7 = [(CarNavigationGuidanceSign *)self junctionView];
    [v7 bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(CarNavigationGuidanceSign *)self junctionView];
    -[CarNavigationGuidanceSign convertRect:fromView:](self, "convertRect:fromView:", v16, v9, v11, v13, v15);
    v19.CGFloat x = x;
    v19.CGFloat y = y;
    BOOL v17 = CGRectContainsPoint(v20, v19);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_shouldForceSecondaryManeuverViewHidden
{
  unint64_t v3 = [(CarNavigationGuidanceSign *)self destination];
  if (v3 == 2)
  {
    return GEOConfigGetBOOL();
  }
  else
  {
    return v3 || (id)[(CarNavigationGuidanceSign *)self signStyle] == (id)1;
  }
}

- (void)setSecondaryViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CarNavigationGuidanceSign *)self _shouldForceSecondaryManeuverViewHidden])
  {
    uint64_t v5 = sub_100577B3C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
      int v22 = 138412546;
      v23 = v6;
      __int16 v24 = 2048;
      v25 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, forcing secondaryViewHidden for nav signs displayed in widgets.", (uint8_t *)&v22, 0x16u);
    }
    BOOL v3 = 1;
  }
  if (self->_secondaryViewHidden != v3)
  {
    v7 = sub_100577B3C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      double v8 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
      unint64_t v9 = [(CarNavigationGuidanceSign *)self compressionStage];
      if (self->_secondaryViewHidden) {
        double v10 = @"YES";
      }
      else {
        double v10 = @"NO";
      }
      double v11 = v10;
      if (v3) {
        double v12 = @"YES";
      }
      else {
        double v12 = @"NO";
      }
      double v13 = v12;
      int v22 = 138413314;
      v23 = v8;
      __int16 v24 = 2048;
      v25 = self;
      __int16 v26 = 2048;
      unint64_t v27 = v9;
      __int16 v28 = 2112;
      __int16 v29 = v11;
      __int16 v30 = 2112;
      __int16 v31 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, compression: %lu. setSecondaryViewHidden: before: %@, after: %@", (uint8_t *)&v22, 0x34u);
    }
    self->_BOOL secondaryViewHidden = v3;
    double v14 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
    [v14 setHidden:v3];

    BOOL secondaryViewHidden = self->_secondaryViewHidden;
    double v16 = [(CarNavigationGuidanceSign *)self nextSecondaryManeuver];
    [v16 setHidden:secondaryViewHidden];

    BOOL v17 = self->_secondaryViewHidden;
    v18 = [(CarNavigationGuidanceSign *)self hairlineView];
    [v18 setHidden:v17];

    LODWORD(v17) = self->_secondaryViewHidden;
    CGPoint v19 = [(CarNavigationGuidanceSign *)self secondaryViewHeightConstraint];
    CGRect v20 = v19;
    double v21 = 200.0;
    if (v17) {
      double v21 = 0.0;
    }
    [v19 setConstant:v21];
  }
}

- (void)setJunctionViewHidden:(BOOL)a3
{
  if (self->_junctionViewHidden != a3)
  {
    self->_junctionViewHidden = a3;
    [(CarNavigationGuidanceSign *)self maxAvailableHeightForJunctionView:0.0];
    double v5 = v4;
    id v6 = [(CarNavigationGuidanceSign *)self junctionViewController];
    [v6 setAvailableHeight:v5];
  }
}

- (void)setJunctionViewTemporarilyHidden:(BOOL)a3
{
  if (self->_junctionViewTemporarilyHidden != a3)
  {
    self->_junctionViewTemporarilyHidden = a3;
    [(CarNavigationGuidanceSign *)self maxAvailableHeightForJunctionView:0.0];
    double v5 = v4;
    id v6 = [(CarNavigationGuidanceSign *)self junctionViewController];
    [v6 setAvailableHeight:v5];
  }
}

- (void)setPrimaryGuidance:(id)a3
{
  double v5 = (NavSignManeuverGuidanceInfo *)a3;
  p_primaryGuidance = &self->_primaryGuidance;
  if (self->_primaryGuidance != v5)
  {
    v7 = sub_100577B3C();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)p_primaryGuidance, a3);
      goto LABEL_10;
    }
    double v8 = self;
    unint64_t v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      double v11 = [(CarNavigationGuidanceSign *)v8 performSelector:"accessibilityIdentifier"];
      double v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        double v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    double v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    double v14 = *p_primaryGuidance;
    *(_DWORD *)buf = 138543874;
    double v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2112;
    CGRect v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Changing primaryGuidance from %@ to %@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:
}

- (void)setSecondaryGuidance:(id)a3
{
  id v5 = a3;
  p_secondaryGuidance = (id *)&self->_secondaryGuidance;
  if (*p_secondaryGuidance != v5)
  {
    v7 = sub_100577B3C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *p_secondaryGuidance;
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Changing secondaryGuidance from %@ to %@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong(p_secondaryGuidance, a3);
  }
}

- (void)setPrimaryGuidanceSignID:(id)a3
{
  id v5 = (NSUUID *)a3;
  p_primaryGuidanceSignID = &self->_primaryGuidanceSignID;
  if (self->_primaryGuidanceSignID != v5)
  {
    v7 = sub_100577B3C();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)p_primaryGuidanceSignID, a3);
      goto LABEL_10;
    }
    id v8 = self;
    int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      __int16 v11 = [(CarNavigationGuidanceSign *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        double v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    double v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    double v14 = *p_primaryGuidanceSignID;
    *(_DWORD *)buf = 138543874;
    double v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2112;
    CGRect v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Changing primary sign ID from %@ to %@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:
}

- (void)setSecondaryGuidanceSignID:(id)a3
{
  id v5 = (NSUUID *)a3;
  p_secondaryGuidanceSignID = &self->_secondaryGuidanceSignID;
  if (self->_secondaryGuidanceSignID != v5)
  {
    v7 = sub_100577B3C();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)p_secondaryGuidanceSignID, a3);
      goto LABEL_10;
    }
    id v8 = self;
    int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      __int16 v11 = [(CarNavigationGuidanceSign *)v8 performSelector:"accessibilityIdentifier"];
      id v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        double v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    double v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

    double v14 = *p_secondaryGuidanceSignID;
    *(_DWORD *)buf = 138543874;
    double v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2112;
    CGRect v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Changing secondary sign ID from %@ to %@", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:
}

- (void)setPrimaryManeuver:(id)a3
{
  id v5 = a3;
  p_primaryManeuver = (id *)&self->_primaryManeuver;
  if (*p_primaryManeuver != v5)
  {
    v7 = sub_100577B3C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *p_primaryManeuver;
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Changing primaryManeuver from %@ to %@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong(p_primaryManeuver, a3);
  }
}

- (void)setNextPrimaryManeuver:(id)a3
{
  id v5 = a3;
  p_nextPrimaryManeuver = (id *)&self->_nextPrimaryManeuver;
  if (*p_nextPrimaryManeuver != v5)
  {
    v7 = sub_100577B3C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *p_nextPrimaryManeuver;
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Changing nextPrimaryManeuver from %@ to %@", (uint8_t *)&v9, 0x16u);
    }

    objc_storeStrong(p_nextPrimaryManeuver, a3);
  }
}

- (void)setBlurMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(CarNavigationGuidanceSign *)self primaryManeuver];
  [v5 setBlurMode:v3];

  id v6 = [(CarNavigationGuidanceSign *)self nextPrimaryManeuver];
  [v6 setBlurMode:v3];

  v7 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
  [v7 setBlurMode:v3];

  id v8 = [(CarNavigationGuidanceSign *)self nextSecondaryManeuver];
  [v8 setBlurMode:v3];
}

- (void)_resetPrecalculatedCompressionSizes
{
  uint64_t v3 = [(CarNavigationGuidanceSign *)self primaryManeuver];
  [v3 resetCompressionSizes];

  double v4 = [(CarNavigationGuidanceSign *)self nextPrimaryManeuver];
  [v4 resetCompressionSizes];

  id v5 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
  [v5 resetCompressionSizes];

  id v6 = [(CarNavigationGuidanceSign *)self nextSecondaryManeuver];
  [v6 resetCompressionSizes];
}

- (void)_updateCompressionStage
{
  [(CarNavigationGuidanceSign *)self availableWidth];
  if (v3 == 0.0)
  {
    double v4 = sub_100577B3C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
      int v17 = 138412546;
      v18 = v5;
      __int16 v19 = 2048;
      CGRect v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, layoutSubviews, but availableWidth was 0. setting compressionStage to None.", (uint8_t *)&v17, 0x16u);
    }
    id v6 = self;
    unint64_t v7 = 0;
  }
  else
  {
    double v8 = v3;
    if (v3 != self->_widthAtLastCompressionUpdate)
    {
      int v9 = sub_100577B3C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
        double widthAtLastCompressionUpdate = self->_widthAtLastCompressionUpdate;
        int v17 = 138413058;
        v18 = v10;
        __int16 v19 = 2048;
        CGRect v20 = self;
        __int16 v21 = 2048;
        double v22 = widthAtLastCompressionUpdate;
        __int16 v23 = 2048;
        double v24 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, availableWidth has changed from %.1f to %.1f since last layout, we need to recalculate compression stages", (uint8_t *)&v17, 0x2Au);
      }
      [(CarNavigationGuidanceSign *)self _resetPrecalculatedCompressionSizes];
      self->_double widthAtLastCompressionUpdate = v8;
      [(CarNavigationGuidanceSign *)self _heightForCompressionStage:-1 isMaximumCompression:0];
      double v13 = v12;
      double v14 = [(CarNavigationGuidanceSign *)self minimumCompressedContentLayoutGuideHeightConstraint];
      [v14 setConstant:v13];
    }
    double v15 = sub_100577B3C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      double v16 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
      int v17 = 138412802;
      v18 = v16;
      __int16 v19 = 2048;
      CGRect v20 = self;
      __int16 v21 = 2048;
      double v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, layoutSubviews, availableWidth width is %1.f.", (uint8_t *)&v17, 0x20u);
    }
    unint64_t v7 = [(CarNavigationGuidanceSign *)self _desiredCompressionStage];
    id v6 = self;
  }
  [(CarNavigationGuidanceSign *)v6 setCompressionStage:v7];
}

- (void)setCompressionStage:(unint64_t)a3
{
  id v5 = [(CarNavigationGuidanceSign *)self primaryManeuver];
  id v6 = [v5 compressionStage];

  unint64_t v7 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
  id v8 = [v7 compressionStage];

  self->_unint64_t compressionStage = a3;
  int v9 = [(CarNavigationGuidanceSign *)self secondaryGuidanceSignID];

  id v10 = [(CarNavigationGuidanceSign *)self junctionView];
  if (v10)
  {
    __int16 v11 = [(CarNavigationGuidanceSign *)self junctionViewInfo];
    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  +[CarNavigationGuidanceSignCompression compressionForStage:a3 hasSecondary:v9 != 0 hasJunctionView:v12 forDestination:[(CarNavigationGuidanceSign *)self destination]];
  double v13 = [(CarNavigationGuidanceSign *)self primaryManeuver];
  [v13 setCompressionStage:0];

  double v14 = [(CarNavigationGuidanceSign *)self nextPrimaryManeuver];
  [v14 setCompressionStage:0];

  double v15 = sub_100577B3C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    double v16 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
    unint64_t compressionStage = self->_compressionStage;
    *(_DWORD *)buf = 138413570;
    double v24 = v16;
    __int16 v25 = 2048;
    __int16 v26 = self;
    __int16 v27 = 2048;
    unint64_t v28 = compressionStage;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    __int16 v31 = 2048;
    uint64_t v32 = 0;
    __int16 v33 = 2048;
    uint64_t v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, setCompressionStage: before: %lu, after: %lu. primaryCompression: %lu, secondaryCompression: %lu", buf, 0x3Eu);
  }
  v18 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
  [v18 setCompressionStage:0];

  __int16 v19 = [(CarNavigationGuidanceSign *)self nextSecondaryManeuver];
  [v19 setCompressionStage:0];

  [(CarNavigationGuidanceSign *)self setSecondaryViewHidden:0];
  [(CarNavigationGuidanceSign *)self setJunctionViewHidden:0];
  CGRect v20 = [(CarNavigationGuidanceSign *)self primaryManeuver];
  if (v6 != [v20 compressionStage])
  {

    goto LABEL_10;
  }
  __int16 v21 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
  id v22 = [v21 compressionStage];

  if (v8 != v22)
  {
LABEL_10:
    [(CarNavigationGuidanceSign *)self setNeedsLayout];
    [(CarNavigationGuidanceSign *)self layoutIfNeeded];
  }
}

- (void)refreshJunctionView
{
  id v2 = [(CarNavigationGuidanceSign *)self junctionView];
  [v2 setNeedsLayout];
}

- (void)setJunctionViewInfo:(id)a3
{
  id v5 = (NavJunctionViewInfo *)a3;
  if (self->_junctionViewController)
  {
    int v9 = v5;
    id v6 = [(CarNavigationGuidanceSign *)self sizeProvider];
    -[CarNavigationGuidanceSign setLayoutType:](self, "setLayoutType:", [v6 maneuverViewLayoutType]);

    id v5 = v9;
    if (self->_junctionViewInfo != v9)
    {
      objc_storeStrong((id *)&self->_junctionViewInfo, a3);
      junctionViewInfo = self->_junctionViewInfo;
      id v8 = [(CarNavigationGuidanceSign *)self junctionViewController];
      [v8 setJunctionViewInfo:junctionViewInfo];

      id v5 = v9;
    }
  }
}

- (void)showJunctionViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100577B3C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
    unint64_t v7 = @"NO";
    if (v3) {
      unint64_t v7 = @"YES";
    }
    id v8 = v7;
    *(_DWORD *)buf = 138412802;
    __int16 v11 = v6;
    __int16 v12 = 2048;
    double v13 = self;
    __int16 v14 = 2112;
    double v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, showJunctionViewAnimated: %@", buf, 0x20u);
  }
  [(CarNavigationGuidanceSign *)self setJunctionViewTemporarilyHidden:0];
  if (v3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100803108;
    v9[3] = &unk_1012E5D08;
    v9[4] = self;
    +[UIView animateWithDuration:v9 animations:0.4];
  }
  else
  {
    [(CarNavigationGuidanceSign *)self layoutIfNeeded];
  }
}

- (void)hideJunctionViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100577B3C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
    unint64_t v7 = @"NO";
    if (v3) {
      unint64_t v7 = @"YES";
    }
    id v8 = v7;
    *(_DWORD *)buf = 138412802;
    __int16 v12 = v6;
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2112;
    double v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, hideJunctionViewAnimated: %@", buf, 0x20u);
  }
  [(CarNavigationGuidanceSign *)self setJunctionViewTemporarilyHidden:1];
  if (v3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008032B0;
    v10[3] = &unk_1012E5D08;
    v10[4] = self;
    +[UIView animateWithDuration:v10 animations:0.4];
  }
  else
  {
    int v9 = [(CarNavigationGuidanceSign *)self junctionView];
    [v9 layoutIfNeeded];

    [(CarNavigationGuidanceSign *)self layoutIfNeeded];
  }
}

- (double)maxAvailableHeightForJunctionView:(double)a3
{
  double v4 = 0.0;
  if ((id)[(CarNavigationGuidanceSign *)self destination] != (id)1
    && (id)[(CarNavigationGuidanceSign *)self destination] != (id)2
    && ![(CarNavigationGuidanceSign *)self junctionViewHidden]
    && ![(CarNavigationGuidanceSign *)self junctionViewTemporarilyHidden])
  {
    id v5 = [(CarNavigationGuidanceSign *)self sizeProvider];
    [v5 availableSize];
    double v7 = v6;

    id v8 = [(CarNavigationGuidanceSign *)self primaryManeuverView];
    [v8 frame];
    double Height = CGRectGetHeight(v14);
    id v10 = [(CarNavigationGuidanceSign *)self hairlineView];
    [v10 frame];
    double v11 = v7 - (Height + CGRectGetHeight(v15));

    double v12 = sub_1005F7D78();
    return v12 * floor(v11 / v12);
  }
  return v4;
}

- (void)hideJunctionViewTemporarily
{
}

- (void)_prepareManeuverView:(id)a3
{
  id v4 = a3;
  id v5 = [(CarNavigationGuidanceSign *)self sizeProvider];
  [v5 availableSize];
  double v7 = v6;
  double v9 = v8;

  id v10 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, v7, 1.79769313e308];
  [v10 addSubview:v4];
  __int16 v26 = [v4 topAnchor];
  __int16 v25 = [v10 topAnchor];
  double v11 = [v26 constraintEqualToAnchor:v25];
  v36[0] = v11;
  double v12 = [v4 leadingAnchor];
  __int16 v13 = [v10 leadingAnchor];
  CGRect v14 = [v12 constraintEqualToAnchor:v13];
  v36[1] = v14;
  CGRect v15 = [v4 trailingAnchor];
  double v16 = [v10 trailingAnchor];
  int v17 = [v15 constraintEqualToAnchor:v16];
  v36[2] = v17;
  v18 = +[NSArray arrayWithObjects:v36 count:3];

  +[NSLayoutConstraint activateConstraints:v18];
  [v10 setNeedsLayout];
  [v10 layoutIfNeeded];
  [(CarNavigationGuidanceSign *)self complementarySignHeightForManeuverView:v4];
  double v20 = v9 - v19;
  [v4 frame];
  if (v21 > v20)
  {
    [v4 setCompressionStage:[v4 compressionStageForSize:v7, v9]];
    [v10 setNeedsLayout];
    [v10 layoutIfNeeded];
  }
  +[NSLayoutConstraint deactivateConstraints:v18];
  id v22 = sub_100577B3C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    __int16 v23 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
    v37.double width = v7;
    v37.double height = v9;
    double v24 = NSStringFromCGSize(v37);
    *(_DWORD *)buf = 138413058;
    __int16 v29 = v23;
    __int16 v30 = 2048;
    __int16 v31 = self;
    __int16 v32 = 2112;
    __int16 v33 = v24;
    __int16 v34 = 2048;
    unint64_t v35 = [(CarNavigationGuidanceSign *)self compressionStage];
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, _prepareManeuverView. for availableSize: %@, with compressionStage: %lu", buf, 0x2Au);
  }
}

- (double)complementarySignHeightForManeuverView:(id)a3
{
  id v4 = a3;
  id v5 = [(CarNavigationGuidanceSign *)self secondaryManeuverView];
  double Height = 0.0;
  if (!v5)
  {
    double v7 = [(CarNavigationGuidanceSign *)self hairlineView];
    [v7 frame];
    double Height = CGRectGetHeight(v12);
  }
  id v8 = [v4 variant];

  if (v8 == (id)2) {
    [(CarNavigationGuidanceSign *)self primaryManeuverView];
  }
  else {
  double v9 = [(CarNavigationGuidanceSign *)self secondaryManeuverView];
  }
  [v9 frame];
  double v10 = CGRectGetHeight(v13);

  return Height + v10;
}

- (void)_replacePrimaryViewManeuver:(id)a3 initialConstraints:(id)a4 finalConstraints:(id)a5 slide:(BOOL)a6
{
  BOOL v103 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  CGRect v13 = [(CarNavigationGuidanceSign *)self primaryManeuver];
  v110 = self;
  CGRect v14 = [(CarNavigationGuidanceSign *)self primaryView];
  CGRect v15 = sub_100577B3C();
  v109 = v13;
  v106 = v10;
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
    goto LABEL_13;
  }
  double v16 = self;
  if (!v16)
  {
    double v21 = @"<nil>";
    goto LABEL_10;
  }
  int v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  if (objc_opt_respondsToSelector())
  {
    double v19 = [(CarNavigationGuidanceSign *)v16 performSelector:"accessibilityIdentifier"];
    double v20 = v19;
    if (v19 && ![v19 isEqualToString:v18])
    {
      double v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

      goto LABEL_8;
    }
  }
  double v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_8:

LABEL_10:
  id v22 = [v12 guidance];
  __int16 v23 = [v22 signID];
  double v24 = [v13 guidance];
  uint64_t v25 = [v24 signID];
  __int16 v26 = (void *)v25;
  *(_DWORD *)buf = 138544642;
  __int16 v27 = @"NO";
  *(void *)&uint8_t buf[4] = v21;
  if (v103) {
    __int16 v27 = @"YES";
  }
  *(_WORD *)&buf[12] = 2112;
  *(void *)&buf[14] = v12;
  *(_WORD *)&buf[22] = 2112;
  v117 = v23;
  __int16 v118 = 2112;
  v119 = v13;
  __int16 v120 = 2112;
  uint64_t v121 = v25;
  __int16 v122 = 2112;
  v123 = v27;
  unint64_t v28 = v27;
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] _replacePrimaryViewManeuver incoming: %@ (%@) outgoing: %@ (%@) shouldSlide: %@", buf, 0x3Eu);

  CGRect v13 = v109;
  id v10 = v106;
LABEL_13:

  if (v12)
  {
    __int16 v29 = [v14 subviews];
    __int16 v30 = sub_1000AC254(v29, &stru_1012F9B88);

    v101 = v30;
    id v100 = v11;
    v102 = v14;
    if ((unint64_t)[v30 count] >= 2)
    {
      __int16 v31 = sub_1005762E4();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "-[CarNavigationGuidanceSign _replacePrimaryViewManeuver:initialConstraints:finalConstraints:slide:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "CarNavigationGuidanceSign.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v117) = 613;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        __int16 v32 = sub_1005762E4();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      id v98 = v12;
      __int16 v34 = sub_100577B3C();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        unint64_t v35 = sub_1003DA3CC([(CarNavigationGuidanceSign *)v110 destination]);
        double v36 = [(CarNavigationGuidanceSign *)v110 recursiveDescription];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v35;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v110;
        *(_WORD *)&buf[22] = 2112;
        v117 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "%@ navSign: %p, _replacePrimaryViewManeuver found lingering views in primaryView -> will forcefully remove them. view hierarchy: %@", buf, 0x20u);
      }
      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      id v37 = v101;
      id v38 = [v37 countByEnumeratingWithState:&v111 objects:v115 count:16];
      if (v38)
      {
        id v39 = v38;
        uint64_t v40 = *(void *)v112;
        do
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(void *)v112 != v40) {
              objc_enumerationMutation(v37);
            }
            CGRect v42 = *(void **)(*((void *)&v111 + 1) + 8 * i);
            if (v42 != v13)
            {
              v43 = sub_100577B3C();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v44 = sub_1003DA3CC([(CarNavigationGuidanceSign *)v110 destination]);
                *(_DWORD *)buf = 138412802;
                *(void *)&uint8_t buf[4] = v44;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v110;
                *(_WORD *)&buf[22] = 2112;
                v117 = v42;
                _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@ navSign: %p, will remove lingering view: %@", buf, 0x20u);

                CGRect v13 = v109;
              }

              [v42 removeFromSuperview];
            }
          }
          id v39 = [v37 countByEnumeratingWithState:&v111 objects:v115 count:16];
        }
        while (v39);
      }

      id v10 = v106;
      id v12 = v98;
      id v11 = v100;
    }
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarNavigationGuidanceSign *)v110 _prepareManeuverView:v12];
    v45 = [(CarNavigationGuidanceSign *)v110 primaryView];
    [v45 addSubview:v12];

    if (v103)
    {
      id v50 = v14;
      id v51 = v12;
      v107 = [v51 topAnchor];
      unint64_t v104 = [v50 topAnchor];
      v99 = [v107 constraintEqualToAnchor:v104];
      *(void *)buf = v99;
      v52 = [v51 leadingAnchor];
      v53 = [v50 trailingAnchor];
      v54 = [v52 constraintEqualToAnchor:v53];
      *(void *)&buf[8] = v54;
      double v55 = [v51 heightAnchor];
      [v51 bounds];
      v56 = [v55 constraintEqualToConstant:CGRectGetHeight(v124)];
      *(void *)&buf[16] = v56;
      v57 = [v51 widthAnchor];

      [v50 bounds];
      CGFloat v59 = v58;
      CGFloat v61 = v60;
      CGFloat v63 = v62;
      CGFloat v65 = v64;

      v125.origin.CGFloat x = v59;
      v125.origin.CGFloat y = v61;
      v125.size.double width = v63;
      v125.size.double height = v65;
      v66 = [v57 constraintEqualToConstant:CGRectGetWidth(v125)];
      v117 = v66;
      v67 = +[NSArray arrayWithObjects:buf count:4];

      id v10 = v106;
      id v11 = v100;

      [v106 addObjectsFromArray:v67];
      if (!v109)
      {
LABEL_47:
        LODWORD(v68) = 1148846080;
        CGRect v14 = v102;
        LODWORD(v69) = 1148846080;
        LODWORD(v70) = 1148846080;
        LODWORD(v71) = 1148846080;
        v95 = [v12 _maps_constraintsForCenteringInView:v102 edgeInsets:UIEdgeInsetsZero.top priorities:UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v68, v69, v70, v71];
        [(CarNavigationGuidanceSign *)v110 setPrimaryManeuverConstraints:v95];

        v96 = [(CarNavigationGuidanceSign *)v110 primaryManeuverConstraints];
        [v11 addObjectsFromArray:v96];

        v97 = [(CarNavigationGuidanceSign *)v110 primaryManeuver];
        [v97 setStopUpdatingCompressionStage:1];

        CGRect v13 = v109;
        goto LABEL_48;
      }
      id v72 = v50;
      id v73 = v109;
      v74 = [v73 topAnchor];
      v108 = [v72 topAnchor];
      v105 = [v74 constraintEqualToAnchor:v108];
      *(void *)buf = v105;
      v75 = [v73 trailingAnchor];
      v76 = [v72 leadingAnchor];
      v77 = [v75 constraintEqualToAnchor:v76];
      *(void *)&buf[8] = v77;
      v78 = [v73 heightAnchor];
      [v73 bounds];
      v79 = [v78 constraintEqualToConstant:CGRectGetHeight(v126)];
      *(void *)&buf[16] = v79;
      v80 = [v73 widthAnchor];

      [v72 bounds];
      CGFloat v82 = v81;
      CGFloat v84 = v83;
      CGFloat v86 = v85;
      CGFloat v88 = v87;

      v127.origin.CGFloat x = v82;
      v127.origin.CGFloat y = v84;
      v127.size.double width = v86;
      v127.size.double height = v88;
      v89 = [v80 constraintEqualToConstant:CGRectGetWidth(v127)];
      v117 = v89;
      v90 = +[NSArray arrayWithObjects:buf count:4];

      id v10 = v106;
      id v11 = v100;

      v91 = v100;
    }
    else
    {
      LODWORD(v46) = 1148846080;
      LODWORD(v47) = 1148846080;
      LODWORD(v48) = 1148846080;
      LODWORD(v49) = 1148846080;
      v90 = [v12 _maps_constraintsForCenteringInView:v14 edgeInsets:UIEdgeInsetsZero.top priorities:UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v46, v47, v48, v49];
      v91 = v10;
    }
    [v91 addObjectsFromArray:v90];

    goto LABEL_47;
  }
  v92 = sub_1005762E4();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CarNavigationGuidanceSign _replacePrimaryViewManeuver:initialConstraints:finalConstraints:slide:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "CarNavigationGuidanceSign.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v117) = 599;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v93 = sub_1005762E4();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v94;
      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  [v13 setStopUpdatingCompressionStage:1];
  [v13 removeFromSuperview];
LABEL_48:
}

- (void)_replaceSecondaryViewManeuver:(id)a3 initialConstraints:(id)a4 finalConstraints:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_100577B3C();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  id v12 = self;
  if (!v12)
  {
    int v17 = @"<nil>";
    goto LABEL_10;
  }
  CGRect v13 = (objc_class *)objc_opt_class();
  CGRect v14 = NSStringFromClass(v13);
  if (objc_opt_respondsToSelector())
  {
    CGRect v15 = [(CarNavigationGuidanceSign *)v12 performSelector:"accessibilityIdentifier"];
    double v16 = v15;
    if (v15 && ![v15 isEqualToString:v14])
    {
      int v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

      goto LABEL_8;
    }
  }
  int v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543362;
  double v36 = v17;
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] _replaceSecondaryViewManeuver.", buf, 0xCu);

LABEL_11:
  v18 = objc_opt_new();
  if (v8)
  {
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarNavigationGuidanceSign *)self _prepareManeuverView:v8];
    double v19 = [(CarNavigationGuidanceSign *)self secondaryView];
    [v19 setHidden:0];

    BOOL v20 = [(CarNavigationGuidanceSign *)self secondaryViewHidden];
    double v21 = [(CarNavigationGuidanceSign *)self hairlineView];
    [v21 setHidden:v20];

    [v8 setHidden:[self secondaryViewHidden]];
    id v22 = [(CarNavigationGuidanceSign *)self secondaryView];
    [v22 addSubview:v8];

    __int16 v23 = [(CarNavigationGuidanceSign *)self secondaryView];
    LODWORD(v24) = 1148846080;
    LODWORD(v25) = 1148846080;
    LODWORD(v26) = 1148846080;
    LODWORD(v27) = 1148846080;
    unint64_t v28 = [v8 _maps_constraintsForCenteringInView:v23 edgeInsets:UIEdgeInsetsZero.top priorities:UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, v24, v25, v26, v27];
    [v18 addObjectsFromArray:v28];

    __int16 v29 = [(CarNavigationGuidanceSign *)self secondaryViewConstraints];
    +[NSLayoutConstraint activateConstraints:v29];
  }
  else
  {
    __int16 v30 = [(CarNavigationGuidanceSign *)self secondaryView];
    [v30 setHidden:1];

    __int16 v31 = [(CarNavigationGuidanceSign *)self hairlineView];
    [v31 setHidden:1];

    __int16 v29 = [(CarNavigationGuidanceSign *)self secondaryViewConstraints];
    +[NSLayoutConstraint deactivateConstraints:v29];
  }

  if ([(CarNavigationGuidanceSign *)self secondaryViewHidden]) {
    double v32 = 0.0;
  }
  else {
    double v32 = 200.0;
  }
  __int16 v33 = [(CarNavigationGuidanceSign *)self secondaryViewHeightConstraint];
  [v33 setConstant:v32];

  [v10 addObjectsFromArray:v18];
  [v9 addObjectsFromArray:v18];

  __int16 v34 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
  [v34 setStopUpdatingCompressionStage:1];
}

- (unint64_t)_desiredCompressionStage
{
  if ((id)[(CarNavigationGuidanceSign *)self signStyle] == (id)1)
  {
    BOOL v3 = sub_100577B3C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
      *(_DWORD *)buf = 138412546;
      id v22 = v4;
      __int16 v23 = 2048;
      double v24 = self;
      id v5 = "%@ navSign: %p, _desiredCompressionStage isLowGuidance, because signStyle is .Mini.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, v5, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  double v6 = [(CarNavigationGuidanceSign *)self sizeProvider];
  [v6 availableSize];
  double v8 = v7;
  double v10 = v9;

  if (v8 < 125.0)
  {
    BOOL v3 = sub_100577B3C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
      *(_DWORD *)buf = 138412546;
      id v22 = v4;
      __int16 v23 = 2048;
      double v24 = self;
      id v5 = "%@ navSign: %p, _desiredCompressionStage isLowGuidance, because availableWidth is < MinWidthSupportingFullGuidanceView";
      goto LABEL_7;
    }
LABEL_8:

    return 9;
  }
  char v20 = 0;
  [(CarNavigationGuidanceSign *)self _heightForCompressionStage:0 isMaximumCompression:&v20];
  double v13 = v12;
  unint64_t v11 = 0;
  do
  {
    if (v13 < v10) {
      break;
    }
    [(CarNavigationGuidanceSign *)self _heightForCompressionStage:++v11 isMaximumCompression:&v20];
    double v13 = v14;
  }
  while (!v20);
  CGRect v15 = sub_100577B3C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    double v16 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
    unint64_t v17 = [(CarNavigationGuidanceSign *)self compressionStage];
    v33.double width = v8;
    v33.double height = v10;
    v18 = NSStringFromCGSize(v33);
    *(_DWORD *)buf = 138413570;
    id v22 = v16;
    __int16 v23 = 2048;
    double v24 = self;
    __int16 v25 = 2048;
    unint64_t v26 = v17;
    __int16 v27 = 2048;
    unint64_t v28 = v11;
    __int16 v29 = 2112;
    __int16 v30 = v18;
    __int16 v31 = 2048;
    double v32 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, _desiredCompressionStage. before: %lu, after: %lu. availableSize: %@, final used height: %.1f", buf, 0x3Eu);
  }
  return v11;
}

- (void)setLayoutType:(unint64_t)a3
{
  if ([(CarNavigationGuidanceSign *)self layoutType] != a3)
  {
    self->_layoutType = a3;
    id v5 = sub_100577B3C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v6 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
      double v7 = sub_100BF4A84([(CarNavigationGuidanceSign *)self layoutType]);
      int v14 = 138412546;
      CGRect v15 = v6;
      __int16 v16 = 2112;
      unint64_t v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ navSign layoutType changed to %@. Updating carManeuver views.", (uint8_t *)&v14, 0x16u);
    }
    double v8 = [(CarNavigationGuidanceSign *)self primaryManeuver];
    [v8 setLayoutType:[self layoutType]];

    double v9 = [(CarNavigationGuidanceSign *)self nextPrimaryManeuver];
    [v9 setLayoutType:[self layoutType]];

    double v10 = [(CarNavigationGuidanceSign *)self secondaryManeuver];
    [v10 setLayoutType:[self layoutType]];

    unint64_t v11 = [(CarNavigationGuidanceSign *)self nextSecondaryManeuver];
    [v11 setLayoutType:[self layoutType]];

    if ((id)[(CarNavigationGuidanceSign *)self layoutType] == (id)1)
    {
      double v12 = [(CarNavigationGuidanceSign *)self secondaryManeuverView];
      double v13 = [(CarNavigationGuidanceSign *)self primaryManeuverView];
      [v12 alignSubviewsTo:v13];
    }
  }
}

- (unint64_t)_primaryManeuverViewVariant
{
  return (id)[(CarNavigationGuidanceSign *)self signStyle] == (id)1;
}

- (void)updateWithGroupAnimation:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  double v6 = objc_opt_new();
  double v7 = objc_opt_new();
  double v8 = sub_100577B3C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    double v9 = [(CarNavigationGuidanceSign *)self primaryManeuver];
    double v10 = [(CarNavigationGuidanceSign *)self primaryManeuver];
    unint64_t v11 = [v10 guidance];
    double v12 = [v11 signID];
    *(_DWORD *)buf = 134218498;
    unint64_t v26 = self;
    __int16 v27 = 2112;
    unint64_t v28 = v9;
    __int16 v29 = 2112;
    __int16 v30 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%p: updateWithGroupAnimation in primary sign %@ (%@)", buf, 0x20u);
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100804D80;
  v21[3] = &unk_1012E85E0;
  v21[4] = self;
  id v22 = v7;
  id v23 = v5;
  id v24 = v6;
  v16[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100805D54;
  v17[3] = &unk_1012E85E0;
  v17[4] = self;
  id v18 = v23;
  id v19 = v24;
  id v20 = v22;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100805EFC;
  v16[3] = &unk_1012E7D28;
  id v13 = v22;
  id v14 = v24;
  id v15 = v23;
  [v4 addPreparation:v21 animations:v17 completion:v16];
}

- (double)availableWidth
{
  id v2 = [(CarNavigationGuidanceSign *)self sizeProvider];
  [v2 availableSize];
  double v4 = v3;

  return v4;
}

- (double)dynamicPointScaleValue
{
  if ((id)[(CarNavigationGuidanceSign *)self destination] != (id)2) {
    return 1.0;
  }

  [(CarNavigationGuidanceSign *)self _car_dynamicPointScaleValue];
  return result;
}

- (void)_handleCarScreenSizeChange
{
  double v3 = sub_100577B3C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    double v4 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
    int v6 = 138412546;
    double v7 = v4;
    __int16 v8 = 2048;
    double v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@ navSign: %p, _handleCarScreenSizeChange", (uint8_t *)&v6, 0x16u);
  }
  id v5 = [(CarNavigationGuidanceSign *)self sizeProvider];
  -[CarNavigationGuidanceSign setLayoutType:](self, "setLayoutType:", [v5 maneuverViewLayoutType]);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CarNavigationGuidanceSign;
  double v3 = [(CarNavigationGuidanceSign *)&v7 description];
  double v4 = sub_1003DA3CC([(CarNavigationGuidanceSign *)self destination]);
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

- (UILayoutGuide)minimumCompressedContentLayoutGuide
{
  return self->_minimumCompressedContentLayoutGuide;
}

- (CarGuidanceCardSizeProviding)sizeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeProvider);

  return (CarGuidanceCardSizeProviding *)WeakRetained;
}

- (void)setSizeProvider:(id)a3
{
}

- (int64_t)signStyle
{
  return self->_signStyle;
}

- (NavSignManeuverGuidanceInfo)primaryGuidance
{
  return self->_primaryGuidance;
}

- (NavSignManeuverGuidanceInfo)secondaryGuidance
{
  return self->_secondaryGuidance;
}

- (NavSignLaneGuidanceInfo)laneGuidanceInfo
{
  return self->_laneGuidanceInfo;
}

- (void)setLaneGuidanceInfo:(id)a3
{
}

- (NavJunctionViewInfo)junctionViewInfo
{
  return self->_junctionViewInfo;
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (void)setLatestETA:(id)a3
{
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (void)setPrimaryView:(id)a3
{
}

- (NSArray)primaryViewOnlyConstraints
{
  return self->_primaryViewOnlyConstraints;
}

- (void)setPrimaryViewOnlyConstraints:(id)a3
{
}

- (CarHairlineView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
}

- (NSArray)secondaryViewConstraints
{
  return self->_secondaryViewConstraints;
}

- (void)setSecondaryViewConstraints:(id)a3
{
}

- (NSLayoutConstraint)secondaryViewHeightConstraint
{
  return self->_secondaryViewHeightConstraint;
}

- (void)setSecondaryViewHeightConstraint:(id)a3
{
}

- (CarManeuverView)primaryManeuver
{
  return self->_primaryManeuver;
}

- (NSArray)primaryManeuverConstraints
{
  return self->_primaryManeuverConstraints;
}

- (void)setPrimaryManeuverConstraints:(id)a3
{
}

- (CarManeuverView)secondaryManeuver
{
  return self->_secondaryManeuver;
}

- (void)setSecondaryManeuver:(id)a3
{
}

- (NSArray)secondaryManeuverConstraints
{
  return self->_secondaryManeuverConstraints;
}

- (void)setSecondaryManeuverConstraints:(id)a3
{
}

- (NavJunctionViewController)junctionViewController
{
  return self->_junctionViewController;
}

- (void)setJunctionViewController:(id)a3
{
}

- (NSArray)junctionViewConstraints
{
  return self->_junctionViewConstraints;
}

- (void)setJunctionViewConstraints:(id)a3
{
}

- (CarManeuverView)nextPrimaryManeuver
{
  return self->_nextPrimaryManeuver;
}

- (CarManeuverView)nextSecondaryManeuver
{
  return self->_nextSecondaryManeuver;
}

- (void)setNextSecondaryManeuver:(id)a3
{
}

- (NSUUID)primaryGuidanceSignID
{
  return self->_primaryGuidanceSignID;
}

- (NSUUID)secondaryGuidanceSignID
{
  return self->_secondaryGuidanceSignID;
}

- (NSUUID)laneGuidanceInfoID
{
  return self->_laneGuidanceInfoID;
}

- (void)setLaneGuidanceInfoID:(id)a3
{
}

- (NSUUID)junctionViewInfoID
{
  return self->_junctionViewInfoID;
}

- (void)setJunctionViewInfoID:(id)a3
{
}

- (double)desiredHeight
{
  return self->_desiredHeight;
}

- (void)setDesiredHeight:(double)a3
{
  self->_desireddouble Height = a3;
}

- (unint64_t)compressionStage
{
  return self->_compressionStage;
}

- (BOOL)secondaryViewHidden
{
  return self->_secondaryViewHidden;
}

- (BOOL)junctionViewHidden
{
  return self->_junctionViewHidden;
}

- (BOOL)junctionViewTemporarilyHidden
{
  return self->_junctionViewTemporarilyHidden;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (NSLayoutConstraint)minimumCompressedContentLayoutGuideHeightConstraint
{
  return self->_minimumCompressedContentLayoutGuideHeightConstraint;
}

- (void)setMinimumCompressedContentLayoutGuideHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumCompressedContentLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_junctionViewInfoID, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfoID, 0);
  objc_storeStrong((id *)&self->_secondaryGuidanceSignID, 0);
  objc_storeStrong((id *)&self->_primaryGuidanceSignID, 0);
  objc_storeStrong((id *)&self->_nextSecondaryManeuver, 0);
  objc_storeStrong((id *)&self->_nextPrimaryManeuver, 0);
  objc_storeStrong((id *)&self->_junctionViewConstraints, 0);
  objc_storeStrong((id *)&self->_junctionViewController, 0);
  objc_storeStrong((id *)&self->_secondaryManeuverConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryManeuver, 0);
  objc_storeStrong((id *)&self->_primaryManeuverConstraints, 0);
  objc_storeStrong((id *)&self->_primaryManeuver, 0);
  objc_storeStrong((id *)&self->_secondaryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryViewConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_primaryViewOnlyConstraints, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_junctionViewInfo, 0);
  objc_storeStrong((id *)&self->_laneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_secondaryGuidance, 0);
  objc_storeStrong((id *)&self->_primaryGuidance, 0);
  objc_destroyWeak((id *)&self->_sizeProvider);

  objc_storeStrong((id *)&self->_minimumCompressedContentLayoutGuide, 0);
}

@end