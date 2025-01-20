@interface PedestrianARFeatureIntroTeachableMomentContaineeViewController
+ (BOOL)hasShownTeachableMoment;
+ (BOOL)shouldShowTeachableMoment;
+ (void)setShownTeachableMoment:(BOOL)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isDarkMode;
- (MapsLoopingVideoPlayerView)playerView;
- (MapsThemeButton)buttonReplica;
- (PedestrianARCoordination)coordinator;
- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)init;
- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithCoder:(id)a3;
- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithCoordinator:(id)a3;
- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIButton)closeButton;
- (UILabel)privacyLabel;
- (UILabel)titleLabel;
- (UIView)animationContainer;
- (UIView)arrowContainerView;
- (double)heightForLayout:(unint64_t)a3;
- (id)_videoNameForCurrentState;
- (int64_t)floatingControlsOptions;
- (void)_configureFloatingButtonHighlightIfNecessary;
- (void)_updateForCurrentState;
- (void)dealloc;
- (void)didResignCurrent;
- (void)enterPedestrianAR:(id)a3;
- (void)setAnimationContainer:(id)a3;
- (void)setArrowContainerView:(id)a3;
- (void)setButtonReplica:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setPrivacyLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)willChangeContainerStyle:(unint64_t)a3;
@end

@implementation PedestrianARFeatureIntroTeachableMomentContaineeViewController

- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)init
{
  result = (PedestrianARFeatureIntroTeachableMomentContaineeViewController *)+[NSException raise:@"MethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (PedestrianARFeatureIntroTeachableMomentContaineeViewController *)+[NSException raise:@"MethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  result = (PedestrianARFeatureIntroTeachableMomentContaineeViewController *)+[NSException raise:@"MethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (PedestrianARFeatureIntroTeachableMomentContaineeViewController)initWithCoordinator:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[PedestrianARFeatureIntroTeachableMomentContaineeViewController initWithCoordinator:]";
      __int16 v18 = 2080;
      v19 = "PedestrianARFeatureIntroTeachableMomentContaineeViewController.m";
      __int16 v20 = 1024;
      int v21 = 79;
      __int16 v22 = 2080;
      v23 = "coordinator != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  id v5 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)&v15 initWithNibName:0 bundle:0];
  if (v5)
  {
    id v6 = sub_100DA4214();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v17 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_coordinator, v4);
    v7 = [(ContaineeViewController *)v5 cardPresentationController];
    [v7 setHideGrabber:1];

    v8 = [(ContaineeViewController *)v5 cardPresentationController];
    [v8 setAllowsSwipeToDismiss:0];

    v9 = [(ContaineeViewController *)v5 cardPresentationController];
    [v9 setPresentedModally:1];

    v10 = [(ContaineeViewController *)v5 cardPresentationController];
    [v10 setEdgeAttachedRegularHeightDimmingBehavior:2];
  }
  return v5;
}

- (void)dealloc
{
  id v3 = sub_100DA4214();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v137.receiver = self;
  v137.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  [(ContaineeViewController *)&v137 viewDidLoad];
  id v3 = [(ContaineeViewController *)self headerView];
  [v3 removeFromSuperview];

  objc_super v4 = [(ContaineeViewController *)self contentView];
  id v5 = [v4 topAnchor];
  id v6 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self view];
  v7 = [v6 topAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  v144 = v8;
  v9 = +[NSArray arrayWithObjects:&v144 count:1];
  +[NSLayoutConstraint activateConstraints:v9];

  v10 = +[UIColor colorNamed:@"TeachableMomentCardBackgoundColor"];
  v11 = [(ContaineeViewController *)self contentView];
  [v11 setBackgroundColor:v10];

  id v12 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v16 = [v12 initWithFrame:CGRectZero.origin.x, y, width, height];
  p_titleLabel = &self->_titleLabel;
  titleLabel = self->_titleLabel;
  self->_titleLabel = v16;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v19) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v19];
  [(UILabel *)self->_titleLabel setNumberOfLines:4];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  __int16 v20 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v20];

  int v21 = +[NSBundle mainBundle];
  __int16 v22 = [v21 localizedStringForKey:@"Pedestrian_AR_feature_intro_teachable_moment_card_title_text" value:@"localized string not found" table:0];
  [(UILabel *)self->_titleLabel setText:v22];

  v23 = [(ContaineeViewController *)self contentView];
  [v23 addSubview:self->_titleLabel];

  if (+[VLFDeviceInfo isNotchDevice]) {
    double v24 = 56.0;
  }
  else {
    double v24 = 50.0;
  }
  v125 = [(UILabel *)*p_titleLabel leadingAnchor];
  v130 = [(ContaineeViewController *)self contentView];
  v120 = [v130 leadingAnchor];
  v115 = [v125 constraintEqualToAnchor:v120 constant:30.0];
  v143[0] = v115;
  v110 = [(UILabel *)*p_titleLabel trailingAnchor];
  v25 = [(ContaineeViewController *)self contentView];
  v26 = [v25 trailingAnchor];
  v27 = [v110 constraintEqualToAnchor:v26 constant:-27.0];
  v143[1] = v27;
  v28 = [(UILabel *)*p_titleLabel firstBaselineAnchor];
  v29 = [(ContaineeViewController *)self contentView];
  v30 = [v29 topAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:v24];
  v143[2] = v31;
  v32 = +[NSArray arrayWithObjects:v143 count:3];
  +[NSLayoutConstraint activateConstraints:v32];

  v33 = (UIView *)objc_alloc_init((Class)UIView);
  animationContainer = self->_animationContainer;
  self->_animationContainer = v33;

  [(UIView *)self->_animationContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  v35 = [(ContaineeViewController *)self contentView];
  [v35 addSubview:self->_animationContainer];

  v126 = [(UIView *)self->_animationContainer leadingAnchor];
  v131 = [(ContaineeViewController *)self contentView];
  v121 = [v131 leadingAnchor];
  v116 = [v126 constraintEqualToAnchor:v121];
  v142[0] = v116;
  v106 = [(UIView *)self->_animationContainer trailingAnchor];
  v111 = [(ContaineeViewController *)self contentView];
  v103 = [v111 trailingAnchor];
  v36 = [v106 constraintEqualToAnchor:v103];
  v142[1] = v36;
  v37 = [(UIView *)self->_animationContainer topAnchor];
  v38 = [(UILabel *)*p_titleLabel bottomAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];
  v142[2] = v39;
  v40 = [(UIView *)self->_animationContainer heightAnchor];
  v41 = [(UIView *)self->_animationContainer widthAnchor];
  v42 = [v40 constraintEqualToAnchor:v41 multiplier:0.597333312 constant:0.0];
  v142[3] = v42;
  v43 = +[NSArray arrayWithObjects:v142 count:4];
  +[NSLayoutConstraint activateConstraints:v43];

  v44 = -[MapsLoopingVideoPlayerView initWithFrame:]([MapsLoopingVideoPlayerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  playerView = self->_playerView;
  self->_playerView = v44;

  [(MapsLoopingVideoPlayerView *)self->_playerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_animationContainer addSubview:self->_playerView];
  v132 = [(MapsLoopingVideoPlayerView *)self->_playerView leadingAnchor];
  v127 = [(UIView *)self->_animationContainer leadingAnchor];
  v122 = [v132 constraintEqualToAnchor:v127];
  v141[0] = v122;
  v117 = [(MapsLoopingVideoPlayerView *)self->_playerView trailingAnchor];
  v112 = [(UIView *)self->_animationContainer trailingAnchor];
  v107 = [v117 constraintEqualToAnchor:v112];
  v141[1] = v107;
  v104 = [(MapsLoopingVideoPlayerView *)self->_playerView topAnchor];
  v101 = [(UIView *)self->_animationContainer topAnchor];
  v99 = [v104 constraintGreaterThanOrEqualToAnchor:v101];
  v141[2] = v99;
  v97 = [(MapsLoopingVideoPlayerView *)self->_playerView bottomAnchor];
  v46 = [(UIView *)self->_animationContainer bottomAnchor];
  v47 = [v97 constraintLessThanOrEqualToAnchor:v46];
  v141[3] = v47;
  v48 = [(MapsLoopingVideoPlayerView *)self->_playerView centerYAnchor];
  v49 = [(UIView *)self->_animationContainer centerYAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  v141[4] = v50;
  v51 = [(MapsLoopingVideoPlayerView *)self->_playerView heightAnchor];
  v52 = [(MapsLoopingVideoPlayerView *)self->_playerView widthAnchor];
  v53 = [v51 constraintEqualToAnchor:v52 multiplier:0.580817044 constant:0.0];
  v141[5] = v53;
  v54 = +[NSArray arrayWithObjects:v141 count:6];
  +[NSLayoutConstraint activateConstraints:v54];

  objc_initWeak(&location, self);
  v134[0] = _NSConcreteStackBlock;
  v134[1] = 3221225472;
  v134[2] = sub_100DA5390;
  v134[3] = &unk_1012E8CD0;
  objc_copyWeak(&v135, &location);
  v55 = +[UIAction actionWithHandler:v134];
  v56 = +[UIButton buttonWithType:1 primaryAction:v55];
  closeButton = self->_closeButton;
  self->_closeButton = v56;

  [(UIButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v58) = 1148846080;
  [(UIButton *)self->_closeButton setContentCompressionResistancePriority:1 forAxis:v58];
  v59 = [(UIButton *)self->_closeButton layer];
  [v59 setCornerRadius:12.0];

  v60 = +[UIColor systemBlueColor];
  [(UIButton *)self->_closeButton setBackgroundColor:v60];

  v61 = self->_closeButton;
  v62 = +[NSBundle mainBundle];
  v63 = [v62 localizedStringForKey:@"Pedestrian_AR_feature_intro_teachable_moment_card_ok_button_text" value:@"localized string not found" table:0];
  [(UIButton *)v61 setTitle:v63 forState:0];

  v64 = self->_closeButton;
  v65 = +[UIColor systemWhiteColor];
  [(UIButton *)v64 setTitleColor:v65 forState:0];

  v66 = [(ContaineeViewController *)self contentView];
  [v66 addSubview:self->_closeButton];

  v123 = [(UIButton *)self->_closeButton leadingAnchor];
  v128 = [(ContaineeViewController *)self contentView];
  v118 = [v128 leadingAnchor];
  v113 = [v123 constraintEqualToAnchor:v118 constant:24.0];
  v140[0] = v113;
  v108 = [(UIButton *)self->_closeButton trailingAnchor];
  v67 = [(ContaineeViewController *)self contentView];
  v68 = [v67 trailingAnchor];
  v69 = [v108 constraintEqualToAnchor:v68 constant:-24.0];
  v140[1] = v69;
  v70 = [(UIButton *)self->_closeButton topAnchor];
  v71 = [(UIView *)self->_animationContainer bottomAnchor];
  v72 = [v70 constraintEqualToAnchor:v71];
  v140[2] = v72;
  v73 = [(UIButton *)self->_closeButton heightAnchor];
  v74 = [v73 constraintEqualToConstant:50.0];
  v140[3] = v74;
  v75 = +[NSArray arrayWithObjects:v140 count:4];
  +[NSLayoutConstraint activateConstraints:v75];

  if (GEOVisualLocalizationCrowdsourcingIsSupported()
    && GEOVisualLocalizationCrowdsourcingIsAllowed()
    && (GEOVisualLocalizationCrowdsourcingIsEnabled() & 1) != 0)
  {
    v119 = [(UIButton *)self->_closeButton bottomAnchor];
    v129 = [(ContaineeViewController *)self contentView];
    v124 = [v129 safeAreaLayoutGuide];
    v114 = [v124 bottomAnchor];
    LODWORD(v76) = 1148829696;
    v105 = [v119 constraintEqualToAnchor:v114 constant:0.0 priority:v76];
    v138[0] = v105;
    v109 = [(UIButton *)self->_closeButton bottomAnchor];
    v102 = [(ContaineeViewController *)self contentView];
    v100 = [v102 bottomAnchor];
    v98 = [v109 constraintLessThanOrEqualToAnchor:v100 constant:-16.0];
    v138[1] = v98;
    v133 = +[NSArray arrayWithObjects:v138 count:2];
    +[NSLayoutConstraint activateConstraints:v133];
  }
  else
  {
    v77 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    privacyLabel = self->_privacyLabel;
    self->_privacyLabel = v77;

    [(UILabel *)self->_privacyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_privacyLabel setTextAlignment:1];
    LODWORD(v79) = 1148846080;
    [(UILabel *)self->_privacyLabel setContentCompressionResistancePriority:1 forAxis:v79];
    [(UILabel *)self->_privacyLabel setNumberOfLines:0];
    v80 = +[NSBundle mainBundle];
    v81 = [v80 localizedStringForKey:@"Pedestrian_AR_feature_intro_teachable_moment_card_privacy_caption_text" value:@"localized string not found" table:0];
    [(UILabel *)self->_privacyLabel setText:v81];

    v82 = +[UIColor systemGrayColor];
    [(UILabel *)self->_privacyLabel setTextColor:v82];

    v83 = [(ContaineeViewController *)self contentView];
    [v83 addSubview:self->_privacyLabel];

    if (+[VLFDeviceInfo isNotchDevice]) {
      double v84 = 20.0;
    }
    else {
      double v84 = 18.0;
    }
    v119 = [(UILabel *)self->_privacyLabel leadingAnchor];
    v129 = [(ContaineeViewController *)self contentView];
    v124 = [v129 leadingAnchor];
    v114 = [v119 constraintEqualToAnchor:v124 constant:24.0];
    v139[0] = v114;
    v105 = [(UILabel *)self->_privacyLabel trailingAnchor];
    v109 = [(ContaineeViewController *)self contentView];
    v102 = [v109 trailingAnchor];
    v100 = [v105 constraintEqualToAnchor:v102 constant:-24.0];
    v139[1] = v100;
    v98 = [(UILabel *)self->_privacyLabel topAnchor];
    v133 = [(UIButton *)self->_closeButton bottomAnchor];
    v96 = [v98 constraintEqualToAnchor:v133 constant:v84];
    v139[2] = v96;
    v95 = [(UILabel *)self->_privacyLabel bottomAnchor];
    v85 = [(ContaineeViewController *)self contentView];
    v86 = [v85 safeAreaLayoutGuide];
    v87 = [v86 bottomAnchor];
    LODWORD(v88) = 1148829696;
    v89 = [v95 constraintEqualToAnchor:v87 constant:0.0 priority:v88];
    v139[3] = v89;
    v90 = [(UILabel *)self->_privacyLabel bottomAnchor];
    v91 = [(ContaineeViewController *)self contentView];
    v92 = [v91 bottomAnchor];
    v93 = [v90 constraintLessThanOrEqualToAnchor:v92 constant:-16.0];
    v139[4] = v93;
    v94 = +[NSArray arrayWithObjects:v139 count:5];
    +[NSLayoutConstraint activateConstraints:v94];
  }
  [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self _updateForCurrentState];
  objc_destroyWeak(&v135);
  objc_destroyWeak(&location);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v8 traitCollectionDidChange:v4];
  id v5 = [v4 userInterfaceStyle];

  id v6 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self _updateForCurrentState];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  -[PedestrianARFeatureIntroTeachableMomentContaineeViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3);
  if (v4)
  {
    [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self _configureFloatingButtonHighlightIfNecessary];
    [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self _updateForCurrentState];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)&v3 viewDidAppear:a3];
  [(id)objc_opt_class() setShownTeachableMoment:1];
  +[GEOAPPortal captureUserAction:21 target:14 value:0];
}

- (void)didResignCurrent
{
  v5.receiver = self;
  v5.super_class = (Class)PedestrianARFeatureIntroTeachableMomentContaineeViewController;
  [(ContaineeViewController *)&v5 didResignCurrent];
  objc_super v3 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
  [v3 removeFromSuperview];

  BOOL v4 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
  [v4 removeFromSuperview];
}

+ (BOOL)hasShownTeachableMoment
{
  objc_super v3 = +[NSUserDefaults standardUserDefaults];
  BOOL v4 = [v3 objectForKey:@"kLastDateShownPedestrianARFeatureIntroTeachableMomentKey"];

  if (v4)
  {
    objc_super v5 = +[NSUserDefaults standardUserDefaults];
    objc_super v6 = (char *)[v5 integerForKey:@"kTimesShownPedestrianARFeatureIntroTeachableMomentKey"];

    if ((unint64_t)(v6 - 1) >= 3)
    {
      v13 = sub_100DA4214();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 134349312;
        id v20 = a1;
        __int16 v21 = 2048;
        double v22 = *(double *)&v6;
        v14 = "[%{public}p] User has been shown the feature intro teachable moment card too many times (%ld)";
        objc_super v15 = v13;
        uint32_t v16 = 22;
        goto LABEL_9;
      }
    }
    else
    {
      GEOConfigGetDouble();
      double v8 = v7;
      v9 = +[NSDate date];
      [v9 timeIntervalSinceDate:v4];
      double v11 = v10;

      id v12 = sub_100DA4214();
      v13 = v12;
      if (v11 >= v8)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v19 = 134349824;
          id v20 = a1;
          __int16 v21 = 2048;
          double v22 = v11;
          __int16 v23 = 2048;
          double v24 = v8;
          __int16 v25 = 2048;
          v26 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Time since the last time the feature intro teachable moment card was shown (%f) is greater than the maximum time interval (%f) based on the number of times it has been shown (%ld); treating as though car"
            "d has never been shown",
            (uint8_t *)&v19,
            0x2Au);
        }
        BOOL v17 = 0;
        goto LABEL_14;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 134349824;
        id v20 = a1;
        __int16 v21 = 2048;
        double v22 = v11;
        __int16 v23 = 2048;
        double v24 = v8;
        __int16 v25 = 2048;
        v26 = v6;
        v14 = "[%{public}p] Time since the last time the feature intro teachable moment card was shown (%f) is less than "
              "the maximum time interval (%f) based on the number of times it has been shown (%ld); treating as though ca"
              "rd has already been shown";
        objc_super v15 = v13;
        uint32_t v16 = 42;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, v14, (uint8_t *)&v19, v16);
      }
    }
    BOOL v17 = 1;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v17 = 0;
LABEL_15:

  return v17;
}

+ (void)setShownTeachableMoment:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = sub_100DA4214();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v6 = @"NO";
    if (v3) {
      objc_super v6 = @"YES";
    }
    double v7 = v6;
    int v15 = 134349314;
    id v16 = a1;
    __int16 v17 = 2112;
    __int16 v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Setting hasShownTeachableMoment flag: %@", (uint8_t *)&v15, 0x16u);
  }
  if (v3)
  {
    double v8 = +[NSDate date];
    v9 = +[NSUserDefaults standardUserDefaults];
    double v10 = (char *)[v9 integerForKey:@"kTimesShownPedestrianARFeatureIntroTeachableMomentKey"];

    double v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setObject:v8 forKey:@"kLastDateShownPedestrianARFeatureIntroTeachableMomentKey"];

    id v12 = +[NSUserDefaults standardUserDefaults];
    v13 = +[NSNumber numberWithInteger:v10 + 1];
    [v12 setObject:v13 forKey:@"kTimesShownPedestrianARFeatureIntroTeachableMomentKey"];
  }
  else
  {
    v14 = +[NSUserDefaults standardUserDefaults];
    [v14 removeObjectForKey:@"kLastDateShownPedestrianARFeatureIntroTeachableMomentKey"];

    double v8 = +[NSUserDefaults standardUserDefaults];
    [v8 removeObjectForKey:@"kTimesShownPedestrianARFeatureIntroTeachableMomentKey"];
  }
}

+ (BOOL)shouldShowTeachableMoment
{
  BOOL v3 = +[PedestrianARSessionUsageTracker sharedInstance];
  unsigned int v4 = [v3 hasUserEnteredAR];

  if (v4)
  {
    objc_super v5 = sub_100DA4214();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 134349056;
      id v12 = a1;
      objc_super v6 = "[%{public}p] User has entered AR; should NOT show feaure intro teachable moment card";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  unsigned int v7 = [a1 hasShownTeachableMoment];
  objc_super v5 = sub_100DA4214();
  BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v8)
    {
      int v11 = 134349056;
      id v12 = a1;
      objc_super v6 = "[%{public}p] User has seen the TM card within time threshold; should NOT show feaure intro teachable moment card";
      goto LABEL_7;
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  if (v8)
  {
    int v11 = 134349056;
    id v12 = a1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Feature intro teachable moment card is eligible to be shown", (uint8_t *)&v11, 0xCu);
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (BOOL)_isDarkMode
{
  v2 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == (id)2;

  return v3;
}

- (id)_videoNameForCurrentState
{
  if ([(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self _isDarkMode]) {
    v2 = @"PedestrianAR_feature_intro_dark";
  }
  else {
    v2 = @"PedestrianAR_feature_intro_light";
  }

  return v2;
}

- (void)_updateForCurrentState
{
  BOOL v3 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self _videoNameForCurrentState];
  unsigned int v4 = sub_100DA4214();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    double v24 = self;
    __int16 v25 = 2112;
    v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating video: %@", buf, 0x16u);
  }

  id v5 = [objc_alloc((Class)NSDataAsset) initWithName:v3];
  objc_super v6 = [v5 data];
  v21[0] = AVAssetPreferPreciseDurationAndTimingKey;
  v21[1] = AVAssetReferenceRestrictionsKey;
  v22[0] = &__kCFBooleanFalse;
  v22[1] = &off_1013AB9B0;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
  BOOL v8 = +[AVAsset assetWithData:v6 contentType:AVFileTypeAppleM4V options:v7];

  BOOL v9 = +[AVPlayerItem playerItemWithAsset:v8];
  double v10 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self playerView];
  [v10 replaceCurrentItemWithPlayerItem:v9 preserveCurrentTimestamp:1];

  int v11 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self traitCollection];
  id v12 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle1 weight:v11 compatibleWithTraitCollection:UIFontWeightBold];
  v13 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self titleLabel];
  [v13 setFont:v12];

  v14 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self traitCollection];
  int v15 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleBody weight:v14 compatibleWithTraitCollection:UIFontWeightSemibold];
  id v16 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self closeButton];
  __int16 v17 = [v16 titleLabel];
  [v17 setFont:v15];

  __int16 v18 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self traitCollection];
  int v19 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleFootnote weight:v18 compatibleWithTraitCollection:UIFontWeightRegular];
  id v20 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self privacyLabel];
  [v20 setFont:v19];
}

- (void)_configureFloatingButtonHighlightIfNecessary
{
  BOOL v3 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self coordinator];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v5 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self view];
    objc_super v6 = [v5 window];
    unsigned int v7 = [v6 viewWithTag:&off_101323EF0];

    if (v7)
    {
      BOOL v8 = +[MapsThemeButton buttonWithType:0];
      [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self setButtonReplica:v8];

      BOOL v9 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v10 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      [v10 setClipsToBounds:1];

      int v11 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      id v12 = [v11 layer];
      [v12 setMasksToBounds:1];

      v13 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      v14 = [v13 layer];
      [v14 setCornerRadius:8.0];

      int v15 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      id v16 = +[NSBundle mainBundle];
      __int16 v17 = [v16 localizedStringForKey:@"Pedestrian AR [Accessibility]" value:@"localized string not found" table:0];
      [v15 setAccessibilityLabel:v17];

      __int16 v18 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      [v18 addTarget:self action:"enterPedestrianAR:" forControlEvents:64];

      int v19 = +[UIImage systemImageNamed:@"arkit"];
      id v20 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      [v20 setImage:v19 forState:0];

      __int16 v21 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      double v22 = +[MapsTheme floatingControlsTintColor];
      [v21 setTintColor:v22];

      __int16 v23 = +[UIColor systemBackgroundColor];
      double v24 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      [v24 setBackgroundColor:v23];

      __int16 v25 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      v26 = [v7 preferredSymbolConfigurationForImageInState:0];
      [v25 setPreferredSymbolConfiguration:v26 forImageInState:0];

      v27 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self presentationController];
      v28 = [v27 containerView];
      v29 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      [v28 addSubview:v29];

      v30 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
      LODWORD(v31) = 1148846080;
      v32 = [v30 _maps_constraintsEqualToEdgesOfView:v7 priority:v31];
      v33 = [v32 allConstraints];
      +[NSLayoutConstraint activateConstraints:v33];

      if (GEOConfigGetBOOL())
      {
        id v34 = objc_alloc((Class)UIView);
        double y = CGRectZero.origin.y;
        double width = CGRectZero.size.width;
        double height = CGRectZero.size.height;
        id v38 = [v34 initWithFrame:CGRectZero.origin.x, y, width, height];
        [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self setArrowContainerView:v38];

        v39 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

        v40 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self presentationController];
        v41 = [v40 containerView];
        v42 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        [v41 addSubview:v42];

        v107 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        v103 = [v107 trailingAnchor];
        v105 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
        v101 = [v105 leadingAnchor];
        v99 = [v103 constraintLessThanOrEqualToAnchor:v101 constant:-10.0];
        v112[0] = v99;
        v97 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        v93 = [v97 centerYAnchor];
        v95 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
        v91 = [v95 centerYAnchor];
        double v88 = [v93 constraintEqualToAnchor:v91];
        v112[1] = v88;
        v87 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        v85 = [v87 widthAnchor];
        [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
        v43 = v109 = v19;
        v44 = [v43 widthAnchor];
        v45 = [v85 constraintEqualToAnchor:v44];
        v112[2] = v45;
        v46 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        v47 = [v46 heightAnchor];
        v48 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self buttonReplica];
        v49 = [v48 heightAnchor];
        v50 = [v47 constraintEqualToAnchor:v49];
        v112[3] = v50;
        +[NSArray arrayWithObjects:v112 count:4];
        v51 = v110 = v7;
        +[NSLayoutConstraint activateConstraints:v51];

        v52 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self presentationController];
        v53 = [v52 containerView];
        id v54 = [v53 effectiveUserInterfaceLayoutDirection];

        id v55 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
        [v55 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v55 setContentMode:4];
        v56 = +[UIColor systemWhiteColor];
        [v55 setTintColor:v56];

        v108 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleLargeTitle weight:UIFontWeightBold];
        v57 = +[UIImageSymbolConfiguration configurationWithFont:v108];
        [v55 setPreferredSymbolConfiguration:v57];

        if (v54 == (id)1) {
          CFStringRef v58 = @"arrow.left";
        }
        else {
          CFStringRef v58 = @"arrow.right";
        }
        v59 = &off_1013ABA10;
        if (v54 == (id)1) {
          v59 = &off_1013AB9F8;
        }
        v102 = v59;
        v60 = &off_1013ABA28;
        if (v54 != (id)1) {
          v60 = &off_1013ABA40;
        }
        v106 = v60;
        v61 = +[UIImage systemImageNamed:v58];
        [v55 setImage:v61];

        v62 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        [v62 addSubview:v55];

        v98 = [v55 leadingAnchor];
        v100 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        v96 = [v100 leadingAnchor];
        v94 = [v98 constraintEqualToAnchor:v96];
        v111[0] = v94;
        v90 = [v55 trailingAnchor];
        v92 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        v89 = [v92 trailingAnchor];
        v86 = [v90 constraintEqualToAnchor:v89];
        v111[1] = v86;
        v104 = v55;
        v63 = [v55 topAnchor];
        v64 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        v65 = [v64 topAnchor];
        v66 = [v63 constraintEqualToAnchor:v65];
        v111[2] = v66;
        v67 = [v55 bottomAnchor];
        v68 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        v69 = [v68 bottomAnchor];
        v70 = [v67 constraintEqualToAnchor:v69];
        v111[3] = v70;
        v71 = +[NSArray arrayWithObjects:v111 count:4];
        +[NSLayoutConstraint activateConstraints:v71];

        int v19 = v109;
        v72 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
        [v72 setFromValue:&off_1013AB9C8];
        [v72 setToValue:&off_1013AB9E0];
        [v72 setBeginTime:CACurrentMediaTime()];
        [v72 setDuration:0.1];
        [v72 setRemovedOnCompletion:1];
        [v72 setFillMode:kCAFillModeForwards];
        v73 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [v72 setTimingFunction:v73];

        v74 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        [v74 addAnimation:v72 forKey:@"fadeIn"];

        v75 = +[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        [v75 setFromValue:v102];
        [v75 setToValue:&off_1013AB9C8];
        [v75 setBeginTime:CACurrentMediaTime()];
        [v75 setDuration:0.5];
        [v75 setRemovedOnCompletion:1];
        [v75 setFillMode:kCAFillModeForwards];
        double v76 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [v75 setTimingFunction:v76];

        v77 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        [v77 addAnimation:v75 forKey:@"slideIn"];

        v78 = +[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
        [v75 beginTime];
        double v80 = v79;
        [v75 duration];
        [v78 setBeginTime:v80 + v81];
        [v78 setFromValue:&off_1013AB9C8];
        [v78 setToValue:v106];
        [v78 setDuration:0.5];
        [v78 setAutoreverses:1];
        LODWORD(v82) = 2139095039;
        [v78 setRepeatCount:v82];
        [v78 setFillMode:kCAFillModeForwards];
        v83 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [v78 setTimingFunction:v83];

        double v84 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self arrowContainerView];
        [v84 addAnimation:v78 forKey:@"backAndForth"];

        unsigned int v7 = v110;
      }
    }
  }
}

- (int64_t)floatingControlsOptions
{
  return 267;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  if (a3 > 7 || ((1 << a3) & 0xA3) == 0)
  {
    unsigned int v4 = sub_100DA4214();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134349056;
      objc_super v6 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Layout changed to landscape; dismissing",
        (uint8_t *)&v5,
        0xCu);
    }

    [(ContaineeViewController *)self handleDismissAction:0];
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if (a3 == 5)
  {
    int v5 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self view];
    objc_super v6 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self view];
    [v6 frame];
    double v8 = v7;
    LODWORD(v7) = 1148846080;
    LODWORD(v9) = 1112014848;
    [v5 systemLayoutSizeFittingSize:v8 withHorizontalFittingPriority:UILayoutFittingCompressedSize.height verticalFittingPriority:v7 v9];
    double v3 = v10;

    int v11 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self view];
    [v11 safeAreaInsets];
    double v13 = v12;

    if (v13 == 0.0)
    {
      v14 = [(ContaineeViewController *)self cardPresentationController];
      [v14 bottomSafeOffset];
      double v3 = v3 + v15;
    }
  }
  return v3;
}

- (void)enterPedestrianAR:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100DA6EE8;
  v8[3] = &unk_1012E5D08;
  v8[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100DA6F80;
  v6[3] = &unk_1012E6998;
  objc_copyWeak(&v7, &location);
  +[UIView animateWithDuration:v8 animations:v6 completion:0.35];
  int v5 = [(PedestrianARFeatureIntroTeachableMomentContaineeViewController *)self coordinator];
  [v5 enterPedestrianAR];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (PedestrianARCoordination)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (PedestrianARCoordination *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (MapsThemeButton)buttonReplica
{
  return self->_buttonReplica;
}

- (void)setButtonReplica:(id)a3
{
}

- (UIView)arrowContainerView
{
  return self->_arrowContainerView;
}

- (void)setArrowContainerView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)animationContainer
{
  return self->_animationContainer;
}

- (void)setAnimationContainer:(id)a3
{
}

- (MapsLoopingVideoPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (UILabel)privacyLabel
{
  return self->_privacyLabel;
}

- (void)setPrivacyLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLabel, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_arrowContainerView, 0);
  objc_storeStrong((id *)&self->_buttonReplica, 0);

  objc_destroyWeak((id *)&self->_coordinator);
}

@end