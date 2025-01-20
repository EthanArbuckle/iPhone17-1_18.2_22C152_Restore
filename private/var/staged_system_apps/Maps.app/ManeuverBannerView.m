@interface ManeuverBannerView
- (BOOL)_isEligibleToShowFindMyButton;
- (BOOL)_isEligibleToShowWalkingButton;
- (BOOL)expanded;
- (BOOL)showsControls;
- (CGSize)sizeThatFits:(CGSize)a3;
- (DistanceAccessoryView)apertureDistanceLabel;
- (ManeuverAccessoryView)detachedMinimalManeuverView;
- (ManeuverAccessoryView)leadingManeuverView;
- (ManeuverAccessoryView)minimalManeuverView;
- (ManeuverBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5;
- (UIActivityIndicatorView)activityView;
- (UIView)leadingConcentricContent;
- (UIView)obstructedArea;
- (UIView)trailingConcentricContent;
- (id)_buttonWithAction:(id)a3;
- (id)_descriptionFont;
- (id)_distanceFont;
- (id)majorText;
- (id)minorText;
- (unint64_t)bannerType;
- (void)_updateConstraints;
- (void)setActivityView:(id)a3;
- (void)setApertureDistanceLabel:(id)a3;
- (void)setDetachedMinimalManeuverView:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setLeadingConcentricContent:(id)a3;
- (void)setLeadingManeuverView:(id)a3;
- (void)setMinimalManeuverView:(id)a3;
- (void)setObstructedArea:(id)a3;
- (void)setShowsControls:(BOOL)a3;
- (void)setTrailingConcentricContent:(id)a3;
- (void)updateFromBannerItem;
- (void)updateLayout;
@end

@implementation ManeuverBannerView

- (ManeuverBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  v189.receiver = self;
  v189.super_class = (Class)ManeuverBannerView;
  v5 = [(MapsBannerView *)&v189 initWithTarget:a3 item:a4 aperturePresentation:a5];
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(ManeuverBannerView *)v5 setAccessibilityIdentifier:v7];

    v8 = [GuidanceManeuverView alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v12 = -[GuidanceManeuverView initWithFrame:textureProvider:](v8, "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
    maneuverImageView = v5->_maneuverImageView;
    v5->_maneuverImageView = v12;

    [(GuidanceManeuverView *)v5->_maneuverImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1148846080;
    [(GuidanceManeuverView *)v5->_maneuverImageView _maps_setAllContentHuggingAndCompressionResistancePriorities:v14];
    [(GuidanceManeuverView *)v5->_maneuverImageView setContentMode:1];
    v15 = [(GuidanceManeuverView *)v5->_maneuverImageView widthAnchor];
    LODWORD(v16) = 1132068864;
    v17 = [v15 constraintEqualToConstant:46.0 priority:v16];
    [v17 setActive:1];

    v18 = [(GuidanceManeuverView *)v5->_maneuverImageView widthAnchor];
    v19 = [v18 constraintGreaterThanOrEqualToConstant:46.0];
    [v19 setActive:1];

    v20 = [(GuidanceManeuverView *)v5->_maneuverImageView heightAnchor];
    v21 = [v20 constraintEqualToConstant:46.0];
    [v21 setActive:1];

    v22 = [(ManeuverBannerView *)v5 theme];
    v23 = [v22 navSignGuidanceManeuverColor];
    [(GuidanceManeuverView *)v5->_maneuverImageView setArrowColor:v23];

    v24 = +[UIColor bannerJunctionColor];
    [(GuidanceManeuverView *)v5->_maneuverImageView setAccentColor:v24];

    [(GuidanceManeuverView *)v5->_maneuverImageView setFraming:1];
    if ([(MapsBannerView *)v5 aperturePresentation])
    {
      v25 = [[ManeuverAccessoryView alloc] initForDetached:0];
      leadingManeuverView = v5->_leadingManeuverView;
      v5->_leadingManeuverView = v25;

      [(ManeuverAccessoryView *)v5->_leadingManeuverView setUsesArrowMetricsReferenceSize:0];
      [(ManeuverAccessoryView *)v5->_leadingManeuverView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(ManeuverBannerView *)v5 addSubview:v5->_leadingManeuverView];
      v27 = [[ManeuverAccessoryView alloc] initForDetached:0];
      minimalManeuverView = v5->_minimalManeuverView;
      v5->_minimalManeuverView = v27;

      [(ManeuverAccessoryView *)v5->_minimalManeuverView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(ManeuverBannerView *)v5 addSubview:v5->_minimalManeuverView];
      v29 = [[ManeuverAccessoryView alloc] initForDetached:1];
      detachedMinimalManeuverView = v5->_detachedMinimalManeuverView;
      v5->_detachedMinimalManeuverView = v29;

      [(ManeuverAccessoryView *)v5->_detachedMinimalManeuverView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(ManeuverBannerView *)v5 addSubview:v5->_detachedMinimalManeuverView];
      v31 = -[DistanceAccessoryView initWithFrame:]([DistanceAccessoryView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      apertureDistanceLabel = v5->_apertureDistanceLabel;
      v5->_apertureDistanceLabel = v31;

      [(DistanceAccessoryView *)v5->_apertureDistanceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(ManeuverBannerView *)v5 addSubview:v5->_apertureDistanceLabel];
      if (GEOConfigGetBOOL())
      {
        v33 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
        leadingConcentricContent = v5->_leadingConcentricContent;
        v5->_leadingConcentricContent = v33;

        v35 = +[UIColor systemDarkGrayColor];
        [(UIView *)v5->_leadingConcentricContent setBackgroundColor:v35];

        [(UIView *)v5->_leadingConcentricContent setTranslatesAutoresizingMaskIntoConstraints:0];
        [(ManeuverAccessoryView *)v5->_leadingManeuverView insertSubview:v5->_leadingConcentricContent atIndex:0];
        v36 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
        obstructedArea = v5->_obstructedArea;
        v5->_obstructedArea = v36;

        v38 = +[UIColor systemDarkGrayColor];
        [(UIView *)v5->_obstructedArea setBackgroundColor:v38];

        [(UIView *)v5->_obstructedArea setTranslatesAutoresizingMaskIntoConstraints:0];
        [(ManeuverAccessoryView *)v5->_leadingManeuverView insertSubview:v5->_obstructedArea atIndex:1];
        v39 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
        trailingConcentricContent = v5->_trailingConcentricContent;
        v5->_trailingConcentricContent = v39;

        v41 = +[UIColor systemDarkGrayColor];
        [(UIView *)v5->_trailingConcentricContent setBackgroundColor:v41];

        [(UIView *)v5->_trailingConcentricContent setTranslatesAutoresizingMaskIntoConstraints:0];
        [(DistanceAccessoryView *)v5->_apertureDistanceLabel insertSubview:v5->_trailingConcentricContent atIndex:0];
      }
      if (GEOConfigGetBOOL())
      {
        id v42 = +[MapsTheme apertureKeyColor];
        id v43 = [v42 CGColor];
        v44 = [(ManeuverAccessoryView *)v5->_leadingManeuverView layer];
        [v44 setBorderColor:v43];

        v45 = [(ManeuverAccessoryView *)v5->_leadingManeuverView layer];
        [v45 setBorderWidth:1.0];

        id v46 = +[MapsTheme apertureKeyColor];
        id v47 = [v46 CGColor];
        v48 = [(DistanceAccessoryView *)v5->_apertureDistanceLabel layer];
        [v48 setBorderColor:v47];

        v49 = [(DistanceAccessoryView *)v5->_apertureDistanceLabel layer];
        [v49 setBorderWidth:1.0];

        id v50 = +[MapsTheme apertureKeyColor];
        id v51 = [v50 CGColor];
        v52 = [(ManeuverAccessoryView *)v5->_minimalManeuverView layer];
        [v52 setBorderColor:v51];

        v53 = [(ManeuverAccessoryView *)v5->_minimalManeuverView layer];
        [v53 setBorderWidth:1.0];

        id v54 = +[MapsTheme apertureKeyColor];
        id v55 = [v54 CGColor];
        v56 = [(ManeuverAccessoryView *)v5->_detachedMinimalManeuverView layer];
        [v56 setBorderColor:v55];

        v57 = [(ManeuverAccessoryView *)v5->_detachedMinimalManeuverView layer];
        [v57 setBorderWidth:1.0];
      }
      v58 = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:CGRectZero.origin.x, y, width, height];
      activityView = v5->_activityView;
      v5->_activityView = v58;

      [(UIActivityIndicatorView *)v5->_activityView setAccessibilityIdentifier:@"ActivityView"];
      [(UIActivityIndicatorView *)v5->_activityView setActivityIndicatorViewStyle:101];
      [(UIActivityIndicatorView *)v5->_activityView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIActivityIndicatorView *)v5->_activityView setHidden:0];
      [(ManeuverBannerView *)v5 addSubview:v5->_activityView];
    }
    v60 = [[NavSignLaneGuidanceView alloc] initWithLaneStyle:0];
    laneGuidanceView = v5->_laneGuidanceView;
    v5->_laneGuidanceView = v60;

    [(NavSignLaneGuidanceView *)v5->_laneGuidanceView setTranslatesAutoresizingMaskIntoConstraints:0];
    v62 = +[UIColor bannerJunctionColor];
    [(NavSignLaneGuidanceView *)v5->_laneGuidanceView setInvalidArrowColor:v62];

    v63 = [(NavSignLaneGuidanceView *)v5->_laneGuidanceView heightAnchor];
    v64 = [v63 constraintLessThanOrEqualToConstant:46.0];
    [v64 setActive:1];

    uint64_t v65 = objc_opt_new();
    distanceLabel = v5->_distanceLabel;
    v5->_distanceLabel = (UILabel *)v65;

    [(UILabel *)v5->_distanceLabel setAccessibilityIdentifier:@"DistanceLabel"];
    [(UILabel *)v5->_distanceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v67) = 1132068864;
    [(UILabel *)v5->_distanceLabel setContentHuggingPriority:0 forAxis:v67];
    LODWORD(v68) = 1148846080;
    [(UILabel *)v5->_distanceLabel setContentHuggingPriority:1 forAxis:v68];
    LODWORD(v69) = 1148846080;
    [(UILabel *)v5->_distanceLabel setContentCompressionResistancePriority:0 forAxis:v69];
    LODWORD(v70) = 1148846080;
    [(UILabel *)v5->_distanceLabel setContentCompressionResistancePriority:1 forAxis:v70];
    [(UILabel *)v5->_distanceLabel setNumberOfLines:2];
    v71 = [(ManeuverBannerView *)v5 _distanceFont];
    [(UILabel *)v5->_distanceLabel setFont:v71];

    uint64_t v72 = objc_opt_new();
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = (UILabel *)v72;

    [(UILabel *)v5->_descriptionLabel setAccessibilityIdentifier:@"DescriptionLabel"];
    [(UILabel *)v5->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v74) = 1148846080;
    [(UILabel *)v5->_descriptionLabel _maps_setAllContentHuggingAndCompressionResistancePriorities:v74];
    [(UILabel *)v5->_descriptionLabel setNumberOfLines:3];
    v75 = [(ManeuverBannerView *)v5 _descriptionFont];
    [(UILabel *)v5->_descriptionLabel setFont:v75];

    uint64_t v76 = objc_opt_new();
    exitShield = v5->_exitShield;
    v5->_exitShield = (UIImageView *)v76;

    [(UIImageView *)v5->_exitShield setAccessibilityIdentifier:@"ExitShield"];
    [(UIImageView *)v5->_exitShield setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v5->_exitShield setContentMode:1];
    LODWORD(v78) = 1148846080;
    [(UIImageView *)v5->_exitShield setContentHuggingPriority:0 forAxis:v78];
    LODWORD(v79) = 1148846080;
    [(UIImageView *)v5->_exitShield setContentHuggingPriority:1 forAxis:v79];
    LODWORD(v80) = 1144750080;
    [(UIImageView *)v5->_exitShield setContentCompressionResistancePriority:0 forAxis:v80];
    LODWORD(v81) = 1144750080;
    [(UIImageView *)v5->_exitShield setContentCompressionResistancePriority:1 forAxis:v81];
    id v82 = 0;
    if ([(MapsBannerView *)v5 aperturePresentation])
    {
      v83 = +[NSBundle mainBundle];
      v84 = [v83 localizedStringForKey:@"[Nav Banner] End Route" value:@"localized string not found" table:0];
      v182 = +[UIAction actionWithTitle:v84 image:0 identifier:0 handler:&stru_1012EBB98];

      [v182 setAttributes:[v182 attributes] | 2];
      uint64_t v85 = [(ManeuverBannerView *)v5 _buttonWithAction:v182];
      endButton = v5->_endButton;
      v5->_endButton = (UIButton *)v85;

      [(UIButton *)v5->_endButton setAccessibilityIdentifier:@"EndButton"];
      [(UIButton *)v5->_endButton setHidden:1];
      v87 = +[NSBundle mainBundle];
      v88 = [v87 localizedStringForKey:@"[Nav Banner] Pause Route" value:@"localized string not found" table:0];
      v181 = +[UIAction actionWithTitle:v88 image:0 identifier:0 handler:&stru_1012EBBB8];

      [v181 setAttributes:([v181 attributes] | 2)];
      uint64_t v89 = [(ManeuverBannerView *)v5 _buttonWithAction:v181];
      pauseButton = v5->_pauseButton;
      v5->_pauseButton = (UIButton *)v89;

      [(UIButton *)v5->_pauseButton setAccessibilityIdentifier:@"PauseButton"];
      [(UIButton *)v5->_pauseButton setHidden:1];
      v91 = +[NSBundle mainBundle];
      v92 = [v91 localizedStringForKey:@"[Nav Banner] Next Stop" value:@"localized string not found" table:0];
      v180 = +[UIAction actionWithTitle:v92 image:0 identifier:0 handler:&stru_1012EBBD8];

      uint64_t v93 = [(ManeuverBannerView *)v5 _buttonWithAction:v180];
      nextButton = v5->_nextButton;
      v5->_nextButton = (UIButton *)v93;

      [(UIButton *)v5->_nextButton setAccessibilityIdentifier:@"NextButton"];
      [(UIButton *)v5->_nextButton setHidden:1];
      v95 = +[MNNavigationService sharedService];
      v179 = [v95 alternateWalkingRouteDisplayETAInfo];

      [v179 remainingMinutesToEndOfRoute];
      v178 = GEOStringForDuration();
      v96 = +[UIImage _systemImageNamed:@"figure.walk"];
      v177 = +[UIAction actionWithTitle:v178 image:v96 identifier:0 handler:&stru_1012EBBF8];

      uint64_t v97 = [(ManeuverBannerView *)v5 _buttonWithAction:v177];
      walkingButton = v5->_walkingButton;
      v5->_walkingButton = (UIButton *)v97;

      [(UIButton *)v5->_walkingButton setAccessibilityIdentifier:@"WalkingButton"];
      [(UIButton *)v5->_walkingButton setHidden:1];
      v99 = +[NSBundle mainBundle];
      v100 = [v99 localizedStringForKey:@"[Nav Banner] Find My" value:@"localized string not found" table:0];
      v101 = +[UIImage _systemImageNamed:@"findmy"];
      v176 = +[UIAction actionWithTitle:v100 image:v101 identifier:0 handler:&stru_1012EBC18];

      uint64_t v102 = [(ManeuverBannerView *)v5 _buttonWithAction:v176];
      findMyButton = v5->_findMyButton;
      v5->_findMyButton = (UIButton *)v102;

      [(UIButton *)v5->_findMyButton setAccessibilityIdentifier:@"FindMyButton"];
      [(UIButton *)v5->_findMyButton setHidden:1];
      v104 = +[NSBundle mainBundle];
      v105 = [v104 localizedStringForKey:@"[Nav Banner] EV Stations" value:@"localized string not found" table:0];
      v106 = +[UIImage _systemImageNamed:@"magnifyingglass"];
      v187[0] = _NSConcreteStackBlock;
      v187[1] = 3221225472;
      v187[2] = sub_10048CF94;
      v187[3] = &unk_1012EBC40;
      v107 = v5;
      v188 = v107;
      v175 = +[UIAction actionWithTitle:v105 image:v106 identifier:0 handler:v187];

      uint64_t v108 = [v107 _buttonWithAction:v175];
      id v109 = v107[19];
      v107[19] = (id)v108;

      [v107[19] setAccessibilityIdentifier:@"EVStationsButton"];
      [v107[19] setHidden:1];
      v110 = -[AxisAdjustingStackView initWithFrame:]([AxisAdjustingStackView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      [(AxisAdjustingStackView *)v110 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(AxisAdjustingStackView *)v110 setDistribution:1];
      [(AxisAdjustingStackView *)v110 setAlignment:0];
      [(AxisAdjustingStackView *)v110 setAccessibilityIdentifier:@"ActionButtonStackView"];
      [(AxisAdjustingStackView *)v110 setSpacing:10.0];
      [(AxisAdjustingStackView *)v110 setDelegate:v107];
      [(AxisAdjustingStackView *)v110 _maps_addArrangedExpandingSubview:v107[19]];
      [(AxisAdjustingStackView *)v110 _maps_addArrangedExpandingSubview:v5->_nextButton];
      [(AxisAdjustingStackView *)v110 _maps_addArrangedExpandingSubview:v5->_findMyButton];
      [(AxisAdjustingStackView *)v110 _maps_addArrangedExpandingSubview:v5->_walkingButton];
      [(AxisAdjustingStackView *)v110 _maps_addArrangedExpandingSubview:v5->_pauseButton];
      [(AxisAdjustingStackView *)v110 _maps_addArrangedExpandingSubview:v5->_endButton];
      [(AxisAdjustingStackView *)v110 addTruncatableView:v107[19]];
      [(AxisAdjustingStackView *)v110 addTruncatableView:v5->_nextButton];
      [(AxisAdjustingStackView *)v110 addTruncatableView:v5->_findMyButton];
      [(AxisAdjustingStackView *)v110 addTruncatableView:v5->_walkingButton];
      [(AxisAdjustingStackView *)v110 addTruncatableView:v5->_pauseButton];
      [(AxisAdjustingStackView *)v110 addTruncatableView:v5->_endButton];
      id v111 = v107[13];
      v107[13] = v110;
      v112 = v110;

      [v107[13] setHidden:1];
      id v82 = v107[13];
    }
    v113 = [[MapsBannerContent alloc] initWithHeaderView:v5->_laneGuidanceView iconView:v5->_maneuverImageView leadingTopView:v5->_distanceLabel trailingTopView:v5->_exitShield bottomView:v5->_descriptionLabel footerView:v82];
    v114 = [(MapsBannerView *)v5 contentView];
    [v114 setContent:v113];

    if ([(MapsBannerView *)v5 aperturePresentation])
    {
      id v186 = v82;
      v115 = [(UILabel *)v5->_distanceLabel _tightBoundingBoxLayoutGuide];
      v116 = [v115 topAnchor];
      v117 = [(ManeuverBannerView *)v5 SBUISA_systemApertureObstructedAreaLayoutGuide];
      v118 = [v117 bottomAnchor];
      uint64_t v119 = [v116 constraintEqualToAnchor:v118];
      distanceLabelTopConstraint = v5->_distanceLabelTopConstraint;
      v5->_distanceLabelTopConstraint = (NSLayoutConstraint *)v119;

      LODWORD(v121) = 1144750080;
      [(NSLayoutConstraint *)v5->_distanceLabelTopConstraint setPriority:v121];
      v122 = [(NavSignLaneGuidanceView *)v5->_laneGuidanceView topAnchor];
      v123 = [(ManeuverBannerView *)v5 SBUISA_systemApertureObstructedAreaLayoutGuide];
      v124 = [v123 bottomAnchor];
      uint64_t v125 = [v122 constraintEqualToAnchor:v124];
      laneGuidanceTopConstraint = v5->_laneGuidanceTopConstraint;
      v5->_laneGuidanceTopConstraint = (NSLayoutConstraint *)v125;

      LODWORD(v127) = 1144750080;
      [(NSLayoutConstraint *)v5->_laneGuidanceTopConstraint setPriority:v127];
      v128 = [(ManeuverAccessoryView *)v5->_leadingManeuverView leadingAnchor];
      v129 = [(ManeuverBannerView *)v5 SBUISA_systemApertureLeadingConcentricContentLayoutGuide];
      v130 = [v129 leadingAnchor];
      [(MapsBannerView *)v5 bannerAccessoryViewLeadingInset];
      uint64_t v131 = [v128 constraintEqualToAnchor:v130];
      leadingViewLeadingConstraint = v5->_leadingViewLeadingConstraint;
      v5->_leadingViewLeadingConstraint = (NSLayoutConstraint *)v131;

      LODWORD(v133) = 1144750080;
      [(NSLayoutConstraint *)v5->_leadingViewLeadingConstraint setPriority:v133];
      v134 = [(ManeuverBannerView *)v5 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];
      v135 = [v134 trailingAnchor];
      v136 = [(DistanceAccessoryView *)v5->_apertureDistanceLabel trailingAnchor];
      [(MapsBannerView *)v5 bannerAccessoryViewTrailingInset];
      v137 = [v135 constraintEqualToAnchor:v136];

      LODWORD(v138) = 1144750080;
      [v137 setPriority:v138];
      v191[0] = v5->_leadingViewLeadingConstraint;
      v191[1] = v137;
      v185 = v137;
      uint64_t v139 = +[NSArray arrayWithObjects:v191 count:2];
      collapsedConstraints = v5->_collapsedConstraints;
      v5->_collapsedConstraints = (NSArray *)v139;

      if (GEOConfigGetBOOL())
      {
        v141 = v5->_leadingConcentricContent;
        v142 = [(ManeuverBannerView *)v5 SBUISA_systemApertureLeadingConcentricContentLayoutGuide];
        LODWORD(v143) = 1144750080;
        v144 = [(UIView *)v141 _maps_constraintsEqualToEdgesOfLayoutGuide:v142 priority:v143];

        v145 = v5->_obstructedArea;
        v146 = [(ManeuverBannerView *)v5 SBUISA_systemApertureObstructedAreaLayoutGuide];
        LODWORD(v147) = 1144750080;
        v148 = [(UIView *)v145 _maps_constraintsEqualToEdgesOfLayoutGuide:v146 priority:v147];

        v149 = v5->_trailingConcentricContent;
        v150 = [(ManeuverBannerView *)v5 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];
        LODWORD(v151) = 1144750080;
        v152 = [(UIView *)v149 _maps_constraintsEqualToEdgesOfLayoutGuide:v150 priority:v151];

        id v153 = objc_alloc_init((Class)NSMutableArray);
        v154 = [v144 allConstraints];
        [v153 addObjectsFromArray:v154];

        v155 = [v148 allConstraints];
        [v153 addObjectsFromArray:v155];

        v156 = [v152 allConstraints];
        [v153 addObjectsFromArray:v156];

        uint64_t v157 = [(NSArray *)v5->_collapsedConstraints arrayByAddingObjectsFromArray:v153];
        v158 = v5->_collapsedConstraints;
        v5->_collapsedConstraints = (NSArray *)v157;
      }
      v184 = [(UIActivityIndicatorView *)v5->_activityView heightAnchor];
      v183 = [v184 constraintEqualToConstant:30.0];
      v190[0] = v183;
      v159 = [(UIActivityIndicatorView *)v5->_activityView widthAnchor];
      v160 = [v159 constraintEqualToConstant:30.0];
      v190[1] = v160;
      v161 = [(UIActivityIndicatorView *)v5->_activityView trailingAnchor];
      v162 = [(MapsBannerView *)v5 contentView];
      v163 = [v162 trailingAnchor];
      v164 = [v161 constraintEqualToAnchor:v163];
      v190[2] = v164;
      v165 = [(UIActivityIndicatorView *)v5->_activityView centerYAnchor];
      v166 = [(UILabel *)v5->_distanceLabel centerYAnchor];
      v167 = [v165 constraintEqualToAnchor:v166];
      v190[3] = v167;
      uint64_t v168 = +[NSArray arrayWithObjects:v190 count:4];
      expandedConstraints = v5->_expandedConstraints;
      v5->_expandedConstraints = (NSArray *)v168;

      id v82 = v186;
    }
    v170 = [(UIImageView *)v5->_exitShield widthAnchor];
    v171 = [(MapsBannerView *)v5 contentView];
    v172 = [v171 widthAnchor];
    v173 = [v170 constraintLessThanOrEqualToAnchor:v172 multiplier:0.349999994];
    [v173 setActive:1];

    [(ManeuverBannerView *)v5 updateFromBannerItem];
    v5->_cachedHeight = -1.0;
    v5->_calculatedWidth = -1.0;
  }
  return v5;
}

- (id)_buttonWithAction:(id)a3
{
  id v3 = a3;
  v4 = +[UIButtonConfiguration sbui_systemApertureTextButtonConfiguration];
  if (([v3 attributes] & 2) != 0)
  {
    v6 = +[UIColor systemRedColor];
    [v4 setBaseBackgroundColor:v6];

    +[UIColor systemRedColor];
  }
  else
  {
    v5 = +[UIColor systemBlueColor];
    [v4 setBaseBackgroundColor:v5];

    +[UIColor systemBlueColor];
  v7 = };
  [v4 setBaseForegroundColor:v7];

  [v4 setTitleLineBreakMode:4];
  v8 = +[SBUISystemApertureButton buttonWithConfiguration:v4 primaryAction:v3];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v9) = 1148846080;
  [v8 setContentCompressionResistancePriority:1 forAxis:v9];
  v10 = [v8 heightAnchor];
  v11 = [v10 constraintEqualToConstant:42.0];
  [v11 setActive:1];

  return v8;
}

- (void)setShowsControls:(BOOL)a3
{
  unsigned int v4 = [(MapsBannerView *)self aperturePresentation] && a3;
  if (self->_showsControls != v4)
  {
    self->_showsControls = v4;
    [(ManeuverBannerView *)self updateLayout];
  }
}

- (BOOL)_isEligibleToShowWalkingButton
{
  v2 = +[MNNavigationService sharedService];
  id v3 = [v2 destination];
  [v3 findMyHandleID];

  return GEOConfigGetBOOL();
}

- (BOOL)_isEligibleToShowFindMyButton
{
  return GEOConfigGetBOOL();
}

- (void)updateLayout
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10048D46C;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (id)majorText
{
  id v3 = [(ManeuverBannerView *)self maneuverItem];
  unsigned int v4 = [v3 maneuverGuidanceInfo];
  v5 = [v4 majorText];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(ManeuverBannerView *)self maneuverItem];
    double v9 = [v8 maneuverGuidanceInfo];
    id v7 = [v9 minorText];
  }

  return v7;
}

- (id)minorText
{
  id v3 = [(ManeuverBannerView *)self maneuverItem];
  unsigned int v4 = [v3 maneuverGuidanceInfo];
  v5 = [v4 majorText];
  if (v5)
  {
    v6 = [(ManeuverBannerView *)self maneuverItem];
    id v7 = [v6 maneuverGuidanceInfo];
    v8 = [v7 minorText];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_distanceFont
{
  return +[UIFont monospacedDigitSystemFontOfSize:26.0 weight:UIFontWeightHeavy];
}

- (id)_descriptionFont
{
  return +[UIFont systemFontOfSize:26.0 weight:UIFontWeightMedium];
}

- (void)updateFromBannerItem
{
  id v3 = [(ManeuverBannerView *)self maneuverItem];
  unsigned int v4 = [v3 guidanceState];
  unsigned int v5 = [v4 isInArrivalState];

  v6 = [(ManeuverBannerView *)self maneuverItem];
  id v7 = [v6 guidanceState];
  unsigned int v8 = [v7 isInParkingState];

  double v9 = [(ManeuverBannerView *)self maneuverItem];
  v10 = [v9 guidanceState];
  unsigned int v11 = [v10 isRerouting];

  v12 = [(ManeuverBannerView *)self maneuverItem];
  v197 = [v12 maneuverGuidanceInfo];

  v13 = +[UIColor labelColor];
  double v14 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  v15 = [v13 resolvedColorWithTraitCollection:v14];

  double v16 = +[UIColor secondaryLabelColor];
  v17 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
  v18 = [v16 resolvedColorWithTraitCollection:v17];

  unsigned int v198 = v5;
  unsigned int v199 = v8;
  unsigned int v200 = v11;
  v195 = v18;
  v196 = v15;
  if (v11)
  {
    id v19 = objc_alloc((Class)NSAttributedString);
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"Rerouting" value:@"localized string not found" table:0];
    v234[0] = v15;
    v233[0] = NSForegroundColorAttributeName;
    v233[1] = NSFontAttributeName;
    v22 = [(ManeuverBannerView *)self _distanceFont];
    v234[1] = v22;
    v23 = +[NSDictionary dictionaryWithObjects:v234 forKeys:v233 count:2];
    id v24 = [v19 initWithString:v21 attributes:v23];
    [(UILabel *)self->_distanceLabel setAttributedText:v24];

    unsigned int v25 = v199;
    [(UILabel *)self->_descriptionLabel setAttributedText:0];
    [(GuidanceManeuverView *)self->_maneuverImageView setManeuverArtwork:0];
    [(NavSignLaneGuidanceView *)self->_laneGuidanceView setLanes:0];
    v26 = v197;
  }
  else if ((v5 | v8) == 1)
  {
    v27 = [(MapsBannerView *)self item];
    v28 = [v27 guidanceState];
    v29 = [v28 arrivalInfo];

    v30 = +[MNNavigationService sharedService];
    v31 = [v30 route];

    v191 = [v29 destination];
    v32 = +[MNNavigationService sharedService];
    v192 = [v32 arrivalChargingStationInfo];

    [(GuidanceManeuverView *)self->_maneuverImageView setManeuverArtwork:0];
    [(NavSignLaneGuidanceView *)self->_laneGuidanceView setLanes:0];
    v33 = +[MNNavigationService sharedService];
    LODWORD(v28) = [v33 isArrivedAtEVCharger];

    v26 = v197;
    objc_super v189 = v31;
    v190 = v29;
    if (v28)
    {
      v34 = +[MNNavigationService sharedService];
      v35 = [v34 activeNavTrayGuidanceEvent];

      v188 = v35;
      if (v35)
      {
        id v36 = objc_alloc((Class)NSAttributedString);
        v37 = [v35 title];
        uint64_t v38 = [v37 stringWithDefaultOptions];
        v39 = (void *)v38;
        if (v38) {
          CFStringRef v40 = (const __CFString *)v38;
        }
        else {
          CFStringRef v40 = &stru_101324E70;
        }
        v232[0] = v18;
        v231[0] = NSForegroundColorAttributeName;
        v231[1] = NSFontAttributeName;
        v41 = [(ManeuverBannerView *)self _descriptionFont];
        v232[1] = v41;
        id v42 = +[NSDictionary dictionaryWithObjects:v232 forKeys:v231 count:2];
        id v43 = [v36 initWithString:v40 attributes:v42];
        [(UILabel *)self->_distanceLabel setAttributedText:v43];

        id v44 = objc_alloc((Class)NSAttributedString);
        v187 = [v35 detail];
        uint64_t v45 = [v187 stringWithDefaultOptions];
        id v46 = (void *)v45;
        v229[1] = NSFontAttributeName;
        v230[0] = v196;
        if (v45) {
          CFStringRef v47 = (const __CFString *)v45;
        }
        else {
          CFStringRef v47 = &stru_101324E70;
        }
        v229[0] = NSForegroundColorAttributeName;
        v48 = [(ManeuverBannerView *)self _distanceFont];
        v230[1] = v48;
        id v49 = +[NSDictionary dictionaryWithObjects:v230 forKeys:v229 count:2];
        id v50 = [v44 initWithString:v47 attributes:v49];
        [(UILabel *)self->_descriptionLabel setAttributedText:v50];
      }
      else
      {
        [v192 chargingTime];
        double v97 = v96;
        id v98 = objc_alloc((Class)NSAttributedString);
        v99 = +[NSBundle mainBundle];
        v100 = v99;
        if (v97 <= 0.0)
        {
          v112 = [v99 localizedStringForKey:@"Charged [Nav Banner Title]" value:@"localized string not found" table:0];
          v113 = +[NSString stringWithFormat:v112];
          v224[0] = v18;
          v223[0] = NSForegroundColorAttributeName;
          v223[1] = NSFontAttributeName;
          v114 = [(ManeuverBannerView *)self _descriptionFont];
          v224[1] = v114;
          v115 = +[NSDictionary dictionaryWithObjects:v224 forKeys:v223 count:2];
          id v116 = [v98 initWithString:v113 attributes:v115];
          [(UILabel *)self->_distanceLabel setAttributedText:v116];

          id v117 = objc_alloc((Class)NSAttributedString);
          v187 = +[NSBundle mainBundle];
          id v46 = [v187 localizedStringForKey:@"Charged [Nav Banner Subtitle]" value:@"localized string not found" table:0];
          v48 = +[MNNavigationService sharedService];
          id v49 = [v48 stopAfterCharging];
          id v50 = [v49 navDisplayName];
          v118 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v50);
          v222[0] = v196;
          v221[0] = NSForegroundColorAttributeName;
          v221[1] = NSFontAttributeName;
          v194 = [(ManeuverBannerView *)self _distanceFont];
          v222[1] = v194;
          uint64_t v119 = +[NSDictionary dictionaryWithObjects:v222 forKeys:v221 count:2];
          id v120 = [v117 initWithString:v118 attributes:v119];
          [(UILabel *)self->_descriptionLabel setAttributedText:v120];
        }
        else
        {
          v101 = [v99 localizedStringForKey:@"Charging [Nav Banner Title]" value:@"localized string not found" table:0];
          [v192 batteryPercentageAfterCharging];
          v103 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v101, (uint64_t)v102);
          v228[0] = v18;
          v227[0] = NSForegroundColorAttributeName;
          v227[1] = NSFontAttributeName;
          v104 = [(ManeuverBannerView *)self _descriptionFont];
          v228[1] = v104;
          v105 = +[NSDictionary dictionaryWithObjects:v228 forKeys:v227 count:2];
          id v106 = [v98 initWithString:v103 attributes:v105];
          [(UILabel *)self->_distanceLabel setAttributedText:v106];

          id v107 = objc_alloc((Class)NSAttributedString);
          v187 = +[NSBundle mainBundle];
          id v46 = [v187 localizedStringForKey:@"Charging [Nav Banner Subtitle]" value:@"localized string not found" table:0];
          [v192 chargingTime];
          v48 = +[NSString _navigation_stringWithSeconds:v108 abbreviated:1];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v46, v48);
          id v49 = (id)objc_claimAutoreleasedReturnValue();
          v226[0] = v196;
          v225[0] = NSForegroundColorAttributeName;
          v225[1] = NSFontAttributeName;
          id v50 = [(ManeuverBannerView *)self _distanceFont];
          v226[1] = v50;
          id v109 = +[NSDictionary dictionaryWithObjects:v226 forKeys:v225 count:2];
          id v110 = [v107 initWithString:v49 attributes:v109];
          [(UILabel *)self->_descriptionLabel setAttributedText:v110];
        }
      }

      unsigned int v5 = v198;
      unsigned int v25 = v199;
      id v111 = v192;
      double v79 = v187;
    }
    else
    {
      double v67 = [(ManeuverBannerView *)self maneuverItem];
      double v68 = [v67 guidanceState];
      unsigned int v69 = [v68 isInParkingState];

      if (v69)
      {
        id v70 = objc_alloc((Class)NSAttributedString);
        v71 = [v191 parkingDisplayName];
        v220[0] = v195;
        v219[0] = NSForegroundColorAttributeName;
        v219[1] = NSFontAttributeName;
        uint64_t v72 = [(ManeuverBannerView *)self _descriptionFont];
        v220[1] = v72;
        v73 = +[NSDictionary dictionaryWithObjects:v220 forKeys:v219 count:2];
        id v74 = [v70 initWithString:v71 attributes:v73];
        [(UILabel *)self->_descriptionLabel setAttributedText:v74];

        v75 = [(ManeuverBannerView *)self maneuverItem];
        uint64_t v76 = [v75 guidanceState];
        LODWORD(v72) = [v76 isParked];

        id v77 = objc_alloc((Class)NSAttributedString);
        double v78 = +[NSBundle mainBundle];
        v188 = v78;
        if (v72)
        {
          double v79 = [v78 localizedStringForKey:@"Parked" value:@"localized string not found" table:0];
          v218[0] = v15;
          v217[0] = NSForegroundColorAttributeName;
          v217[1] = NSFontAttributeName;
          id v46 = [(ManeuverBannerView *)self _distanceFont];
          v218[1] = v46;
          double v80 = v218;
          double v81 = v217;
        }
        else
        {
          double v79 = [v78 localizedStringForKey:@"Parking" value:@"localized string not found" table:0];
          v216[0] = v15;
          v215[0] = NSForegroundColorAttributeName;
          v215[1] = NSFontAttributeName;
          id v46 = [(ManeuverBannerView *)self _distanceFont];
          v216[1] = v46;
          double v80 = v216;
          double v81 = v215;
        }
        v48 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v81 count:2];
        id v49 = [v77 initWithString:v79 attributes:v48];
        [(UILabel *)self->_distanceLabel setAttributedText:v49];
        unsigned int v5 = v198;
        unsigned int v25 = v199;
      }
      else
      {
        uint64_t v82 = [v31 arrivalInstructionStringForLegIndex:[v29 legIndex]];
        v83 = (void *)v82;
        v84 = &stru_101324E70;
        if (v82) {
          v84 = (__CFString *)v82;
        }
        uint64_t v85 = v84;

        id v86 = objc_alloc((Class)NSAttributedString);
        v214[0] = v195;
        v213[0] = NSForegroundColorAttributeName;
        v213[1] = NSFontAttributeName;
        v87 = [(ManeuverBannerView *)self _descriptionFont];
        v214[1] = v87;
        v88 = +[NSDictionary dictionaryWithObjects:v214 forKeys:v213 count:2];
        id v89 = [v86 initWithString:v85 attributes:v88];

        [(UILabel *)self->_descriptionLabel setAttributedText:v89];
        v90 = [(ManeuverBannerView *)self maneuverItem];
        v91 = [v90 guidanceState];
        LODWORD(v87) = [v91 isArrived];

        id v92 = objc_alloc((Class)NSAttributedString);
        uint64_t v93 = +[NSBundle mainBundle];
        v188 = v93;
        if (v87)
        {
          double v79 = [v93 localizedStringForKey:@"Arrived" value:@"localized string not found" table:0];
          v211[1] = NSFontAttributeName;
          v212[0] = v15;
          v211[0] = NSForegroundColorAttributeName;
          id v46 = [(ManeuverBannerView *)self _distanceFont];
          v212[1] = v46;
          v94 = v212;
          v95 = v211;
        }
        else
        {
          double v79 = [v93 localizedStringForKey:@"Arriving" value:@"localized string not found" table:0];
          v209[1] = NSFontAttributeName;
          v210[0] = v15;
          v209[0] = NSForegroundColorAttributeName;
          id v46 = [(ManeuverBannerView *)self _distanceFont];
          v210[1] = v46;
          v94 = v210;
          v95 = v209;
        }
        v48 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v95 count:2];
        id v49 = [v92 initWithString:v79 attributes:v48];
        unsigned int v5 = v198;
        unsigned int v25 = v199;
        [(UILabel *)self->_distanceLabel setAttributedText:v49];
      }
      id v111 = v192;
    }
  }
  else
  {
    id v51 = [(ManeuverBannerView *)self majorText];
    v52 = [(ManeuverBannerView *)self minorText];
    v26 = v197;
    if (!v51)
    {

      goto LABEL_63;
    }
    v193 = v52;
    v53 = [v197 maneuverArtwork];
    [(GuidanceManeuverView *)self->_maneuverImageView setManeuverArtwork:v53];

    id v54 = [(ManeuverBannerView *)self maneuverItem];
    [v54 laneGuidanceInfo];
    v56 = id v55 = v18;
    v57 = [v56 lanes];
    [(NavSignLaneGuidanceView *)self->_laneGuidanceView setLanes:v57];

    v208[0] = v15;
    v207[0] = NSForegroundColorAttributeName;
    v207[1] = NSFontAttributeName;
    v58 = [(ManeuverBannerView *)self _distanceFont];
    uint64_t v59 = MKServerFormattedStringArtworkSizeAttributeKey;
    v207[2] = MKServerFormattedStringArtworkSizeAttributeKey;
    v208[1] = v58;
    v208[2] = &off_1013A7168;
    v60 = +[NSDictionary dictionaryWithObjects:v208 forKeys:v207 count:3];
    v61 = [v51 multiPartAttributedStringWithAttributes:v60];
    v62 = [v61 attributedString];
    [(UILabel *)self->_distanceLabel setAttributedText:v62];

    v206[0] = v55;
    v205[0] = NSForegroundColorAttributeName;
    v205[1] = NSFontAttributeName;
    v63 = [(ManeuverBannerView *)self _descriptionFont];
    v205[2] = v59;
    v206[1] = v63;
    v206[2] = &off_1013A7168;
    v64 = +[NSDictionary dictionaryWithObjects:v206 forKeys:v205 count:3];
    uint64_t v65 = [v193 multiPartAttributedStringWithAttributes:v64];
    v66 = [v65 attributedString];
    [(UILabel *)self->_descriptionLabel setAttributedText:v66];

    unsigned int v25 = v199;
    unsigned int v5 = v198;

    v26 = v197;
  }
  double v121 = [(ManeuverBannerView *)self maneuverItem];
  v122 = [v121 maneuverGuidanceInfo];
  v123 = [v122 shieldInfo];

  int v124 = v200;
  if (!v123) {
    int v124 = 1;
  }
  v15 = v196;
  if ((v124 | v25 | v5))
  {
    exitShield = self->_exitShield;
    long long v126 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v201[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v201[1] = v126;
    v201[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(UIImageView *)exitShield setTransform:v201];
    [(UIImageView *)self->_exitShield setImage:0];
    cachedShieldInfo = self->_cachedShieldInfo;
    self->_cachedShieldInfo = 0;
LABEL_42:

    goto LABEL_43;
  }
  if (([v123 isEqual:self->_cachedShieldInfo] & 1) == 0)
  {
    v128 = +[UIScreen mainScreen];
    [v128 scale];
    double v130 = v129;

    cachedShieldInfo = [v123 shieldImageWithSize:5 scale:0 idiom:v130];
    uint64_t v131 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [cachedShieldInfo image], 0, v130);
    [v131 size];
    if (v132 <= 27.0)
    {
      double v133 = self->_exitShield;
      long long v135 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v202[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v202[1] = v135;
      v202[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v134 = (CGAffineTransform *)v202;
    }
    else
    {
      CGAffineTransformMakeScale(&v204, 27.0 / v132, 27.0 / v132);
      double v133 = self->_exitShield;
      CGAffineTransform v203 = v204;
      v134 = &v203;
    }
    [(UIImageView *)v133 setTransform:v134];
    [(UIImageView *)self->_exitShield setImage:v131];
    objc_storeStrong((id *)&self->_cachedShieldInfo, v123);

    unsigned int v25 = v199;
    goto LABEL_42;
  }
LABEL_43:
  v136 = [v26 maneuverArtwork];
  v137 = [(ManeuverBannerView *)self leadingManeuverView];
  [v137 setManeuverArtwork:v136];

  double v138 = [v26 maneuverArtwork];
  uint64_t v139 = [(ManeuverBannerView *)self minimalManeuverView];
  [v139 setManeuverArtwork:v138];

  v140 = [v26 maneuverArtwork];
  v141 = [(ManeuverBannerView *)self detachedMinimalManeuverView];
  [v141 setManeuverArtwork:v140];

  v142 = [(ManeuverBannerView *)self leadingManeuverView];
  [v142 setIsRerouting:v200];

  double v143 = [(ManeuverBannerView *)self minimalManeuverView];
  [v143 setIsRerouting:v200];

  v144 = [(ManeuverBannerView *)self detachedMinimalManeuverView];
  [v144 setIsRerouting:v200];

  v145 = [(MapsBannerView *)self item];
  v146 = [v145 guidanceState];
  id v147 = [v146 transportType];
  v148 = [(ManeuverBannerView *)self minimalManeuverView];
  [v148 setTransportType:v147];

  v149 = [(MapsBannerView *)self item];
  v150 = [v149 guidanceState];
  id v151 = [v150 transportType];
  v152 = [(ManeuverBannerView *)self detachedMinimalManeuverView];
  [v152 setTransportType:v151];

  id v153 = [(MapsBannerView *)self item];
  v154 = [v153 guidanceState];
  id v155 = [v154 transportType];
  v156 = [(ManeuverBannerView *)self leadingManeuverView];
  [v156 setTransportType:v155];

  if (v200)
  {
    uint64_t v157 = [(ManeuverBannerView *)self apertureDistanceLabel];
    [v157 setDisplayState:3];

    v158 = [(ManeuverBannerView *)self activityView];
    [v158 setHidden:0];

    v159 = [(ManeuverBannerView *)self activityView];
    [v159 startAnimating];
    unsigned int v160 = v198;
  }
  else
  {
    v161 = [(MapsBannerView *)self item];
    v162 = [v161 guidanceState];
    v163 = [v162 distance];
    [v163 doubleValue];
    double v165 = v164;
    v166 = [(ManeuverBannerView *)self apertureDistanceLabel];
    [v166 setDistanceToNextManeuver:v165];

    v167 = +[MNNavigationService sharedService];
    LODWORD(v162) = [v167 navigationState];

    uint64_t v168 = v26;
    if (v162 == 2)
    {
      v169 = [(ManeuverBannerView *)self maneuverItem];
      v170 = [v169 guidanceState];
      if ([v170 isInArrivalState])
      {
        uint64_t v171 = 1;
      }
      else
      {
        v172 = [(ManeuverBannerView *)self maneuverItem];
        v173 = [v172 guidanceState];
        if ([v173 isInParkingState]) {
          uint64_t v171 = 1;
        }
        else {
          uint64_t v171 = 2;
        }
      }
      unsigned int v160 = v198;
    }
    else
    {
      uint64_t v171 = 1;
      unsigned int v160 = v198;
    }
    v174 = [(ManeuverBannerView *)self apertureDistanceLabel];
    [v174 setDisplayState:v171];

    v175 = [(ManeuverBannerView *)self activityView];
    [v175 setHidden:1];

    v159 = [(ManeuverBannerView *)self activityView];
    [v159 stopAnimating];
    v26 = v168;
    unsigned int v25 = v199;
  }

  v176 = +[MNNavigationService sharedService];
  v177 = [v176 alternateWalkingRouteDisplayETAInfo];

  if (v177)
  {
    [v177 remainingMinutesToEndOfRoute];
    v178 = GEOStringForDuration();
    [(UIButton *)self->_walkingButton setTitle:v178 forState:0];
  }
  v179 = [(MapsBannerView *)self contentView];
  unsigned int v180 = [v179 centerBodyContent];

  distanceLabel = self->_distanceLabel;
  if ((v160 | v25) == 1)
  {
    [(UILabel *)distanceLabel setTextAlignment:1];
    [(UILabel *)self->_descriptionLabel setTextAlignment:1];
    [(GuidanceManeuverView *)self->_maneuverImageView setManeuverArtwork:0];
    [(UIImageView *)self->_exitShield setHidden:1];
    v182 = [(MapsBannerView *)self contentView];
    v183 = v182;
    uint64_t v184 = 1;
  }
  else
  {
    [(UILabel *)distanceLabel setTextAlignment:4];
    [(UILabel *)self->_descriptionLabel setTextAlignment:4];
    [(UIImageView *)self->_exitShield setHidden:0];
    v182 = [(MapsBannerView *)self contentView];
    v183 = v182;
    uint64_t v184 = 0;
  }
  [v182 setCenterBodyContent:v184];

  v185 = [(MapsBannerView *)self contentView];
  unsigned int v186 = [v185 centerBodyContent];

  if (v180 != v186) {
    self->_cachedHeight = -1.0;
  }
  [(ManeuverBannerView *)self updateLayout];

  v18 = v195;
LABEL_63:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  double cachedHeight = self->_cachedHeight;
  if (cachedHeight == -1.0 || self->_calculatedWidth != a3.width)
  {
    if ([(MapsBannerView *)self aperturePresentation])
    {
      id v7 = [(ManeuverBannerView *)self SBUISA_systemApertureObstructedAreaLayoutGuide];
      [v7 layoutFrame];
      double MaxY = CGRectGetMaxY(v25);
      double v9 = [(MapsBannerView *)self contentView];
      [v9 _maps_compressedSizeForWidth:0 withBlock:width];
      double v11 = MaxY + v10 + 17.0;
    }
    else
    {
      [(ManeuverBannerView *)self _maps_compressedSizeForWidth:0 withBlock:width];
      double v11 = v12;
    }
    if (v11 <= height)
    {
      self->_double cachedHeight = v11;
      self->_calculatedWidth = width;
      double cachedHeight = self->_cachedHeight;
    }
    else
    {
      v13 = sub_1000AD30C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        double v14 = [(MapsBannerView *)self item];
        v23.CGFloat width = width;
        v23.double height = height;
        v15 = NSStringFromCGSize(v23);
        int v17 = 138412802;
        v18 = v14;
        __int16 v19 = 2112;
        v20 = v15;
        __int16 v21 = 2048;
        double v22 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Banner: %@ wasn't able to draw correctly in the provided space: %@ desired height: %f", (uint8_t *)&v17, 0x20u);
      }
      double cachedHeight = height;
    }
  }
  double v16 = width;
  result.double height = cachedHeight;
  result.CGFloat width = v16;
  return result;
}

- (unint64_t)bannerType
{
  return 0;
}

- (void)setExpanded:(BOOL)a3
{
  int v3 = a3;
  int expanded = self->_expanded;
  self->_int expanded = a3;
  v6 = [(ManeuverBannerView *)self leadingView];
  id v7 = v6;
  if (v3)
  {
    [v6 setAlpha:0.0];

    unsigned int v8 = [(ManeuverBannerView *)self trailingView];
    [v8 setAlpha:0.0];

    double v9 = [(ManeuverBannerView *)self minimalView];
    [v9 setAlpha:0.0];

    double v10 = [(ManeuverBannerView *)self detachedMinimalView];
    [v10 setAlpha:0.0];

    double v11 = [(MapsBannerView *)self contentView];
    [v11 setAlpha:1.0];
    double v12 = &OBJC_IVAR___ManeuverBannerView__collapsedConstraints;
    v13 = &OBJC_IVAR___ManeuverBannerView__expandedConstraints;
  }
  else
  {
    [v6 setAlpha:1.0];

    double v14 = [(ManeuverBannerView *)self trailingView];
    [v14 setAlpha:1.0];

    v15 = [(ManeuverBannerView *)self minimalView];
    [v15 setAlpha:1.0];

    double v16 = [(ManeuverBannerView *)self detachedMinimalView];
    [v16 setAlpha:1.0];

    double v11 = [(MapsBannerView *)self contentView];
    [v11 setAlpha:0.0];
    v13 = &OBJC_IVAR___ManeuverBannerView__collapsedConstraints;
    double v12 = &OBJC_IVAR___ManeuverBannerView__expandedConstraints;
  }

  +[NSLayoutConstraint activateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v13)];
  +[NSLayoutConstraint deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v12)];
  [(ManeuverBannerView *)self _updateConstraints];
  if (expanded != v3)
  {
    [(AxisAdjustingStackView *)self->_controlsView invalidateStackViewAxis];
    controlsView = self->_controlsView;
    [(AxisAdjustingStackView *)controlsView updateStackViewAxisIfNeeded];
  }
}

- (void)_updateConstraints
{
  [(MapsBannerView *)self bannerAccessoryViewLeadingInset];
  double v4 = v3;
  unsigned int v5 = [(ManeuverBannerView *)self leadingManeuverView];
  [v5 preferredLeadingPadding];
  [(NSLayoutConstraint *)self->_leadingViewLeadingConstraint setConstant:v4 + v6];

  if ([(ManeuverBannerView *)self expanded])
  {
    id v7 = [(ManeuverBannerView *)self maneuverItem];
    unsigned int v8 = [v7 laneGuidanceInfo];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }
  if ([(ManeuverBannerView *)self expanded])
  {
    double v10 = [(ManeuverBannerView *)self maneuverItem];
    double v11 = [v10 laneGuidanceInfo];
    BOOL v12 = v11 == 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  [(NSLayoutConstraint *)self->_laneGuidanceTopConstraint setActive:v9];
  distanceLabelTopConstraint = self->_distanceLabelTopConstraint;

  [(NSLayoutConstraint *)distanceLabelTopConstraint setActive:v12];
}

- (BOOL)showsControls
{
  return self->_showsControls;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (ManeuverAccessoryView)leadingManeuverView
{
  return self->_leadingManeuverView;
}

- (void)setLeadingManeuverView:(id)a3
{
}

- (ManeuverAccessoryView)minimalManeuverView
{
  return self->_minimalManeuverView;
}

- (void)setMinimalManeuverView:(id)a3
{
}

- (ManeuverAccessoryView)detachedMinimalManeuverView
{
  return self->_detachedMinimalManeuverView;
}

- (void)setDetachedMinimalManeuverView:(id)a3
{
}

- (DistanceAccessoryView)apertureDistanceLabel
{
  return self->_apertureDistanceLabel;
}

- (void)setApertureDistanceLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (UIView)leadingConcentricContent
{
  return self->_leadingConcentricContent;
}

- (void)setLeadingConcentricContent:(id)a3
{
}

- (UIView)trailingConcentricContent
{
  return self->_trailingConcentricContent;
}

- (void)setTrailingConcentricContent:(id)a3
{
}

- (UIView)obstructedArea
{
  return self->_obstructedArea;
}

- (void)setObstructedArea:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obstructedArea, 0);
  objc_storeStrong((id *)&self->_trailingConcentricContent, 0);
  objc_storeStrong((id *)&self->_leadingConcentricContent, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_apertureDistanceLabel, 0);
  objc_storeStrong((id *)&self->_detachedMinimalManeuverView, 0);
  objc_storeStrong((id *)&self->_minimalManeuverView, 0);
  objc_storeStrong((id *)&self->_leadingManeuverView, 0);
  objc_storeStrong((id *)&self->_collapsedConstraints, 0);
  objc_storeStrong((id *)&self->_expandedConstraints, 0);
  objc_storeStrong((id *)&self->_laneGuidanceTopConstraint, 0);
  objc_storeStrong((id *)&self->_distanceLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_leadingViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_evStationsButton, 0);
  objc_storeStrong((id *)&self->_findMyButton, 0);
  objc_storeStrong((id *)&self->_walkingButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_cachedShieldInfo, 0);
  objc_storeStrong((id *)&self->_exitShield, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_laneGuidanceView, 0);

  objc_storeStrong((id *)&self->_maneuverImageView, 0);
}

@end