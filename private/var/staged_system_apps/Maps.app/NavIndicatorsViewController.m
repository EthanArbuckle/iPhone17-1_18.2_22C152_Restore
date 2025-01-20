@interface NavIndicatorsViewController
- (AudioPreferences)audioPreferences;
- (BOOL)_alwaysShowCompass;
- (BOOL)_canShowWhileLocked;
- (GEOComposedRoute)route;
- (NSLayoutConstraint)speedLimitToCompassBottomConstraint;
- (NSLayoutConstraint)speedLimitToViewTopConstraint;
- (NSLayoutConstraint)ttrButtonTopConstraint;
- (NavIndicatorsViewController)initWithDelegate:(id)a3 pedestrianARSessionStateManager:(id)a4;
- (NavIndicatorsViewControllerDelegate)delegate;
- (NavSpeedLimitView)speedLimitView;
- (double)_compassViewAlpha;
- (double)_speedLimitViewAlpha;
- (double)yaw;
- (unint64_t)_guidanceLevel:(unint64_t)a3 supportingTransportType:(int)a4;
- (unint64_t)currentVoiceGuidanceLevel;
- (unint64_t)indicatorsType;
- (void)_animateInCompassIfNeededWithTimeout:(BOOL)a3;
- (void)_animateOutCompassIfNeeded;
- (void)_animateSpeedLimitViewAnimated:(BOOL)a3;
- (void)_configureForForceWindshield;
- (void)_configureForUnforceWindshield;
- (void)_insertCompassView;
- (void)_pressedCompass;
- (void)_pressedForceWindshield;
- (void)_pressedPedestrianAR;
- (void)_pressedTTR;
- (void)_pressedUnforceWindshield;
- (void)_pressedViewOverview;
- (void)_pressedViewTbT;
- (void)_removeCompassView;
- (void)_scheduleTimerToDismissCompass;
- (void)_setConstraint:(id)a3 active:(BOOL)a4;
- (void)_setIndicatorsType:(unint64_t)a3 route:(id)a4;
- (void)_updateAudioPreferences;
- (void)_updateCompassStyling;
- (void)_updateContent;
- (void)_updateOverviewButton;
- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4;
- (void)dealloc;
- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4;
- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3;
- (void)loadView;
- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3;
- (void)mapViewNavigationCameraHasStartedPanning:(id)a3;
- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAudioPreferences:(id)a3;
- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setCurrentVoiceGuidanceLevel:(unint64_t)a3;
- (void)setIndicatorsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setIndicatorsType:(unint64_t)a3;
- (void)setRoute:(id)a3;
- (void)setSpeedLimitToCompassBottomConstraint:(id)a3;
- (void)setSpeedLimitToViewTopConstraint:(id)a3;
- (void)setTtrButtonTopConstraint:(id)a3;
- (void)setYaw:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
- (void)viewDidLoad;
@end

@implementation NavIndicatorsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NavIndicatorsViewController)initWithDelegate:(id)a3 pedestrianARSessionStateManager:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  v23.receiver = self;
  v23.super_class = (Class)NavIndicatorsViewController;
  v7 = [(NavIndicatorsViewController *)&v23 initWithNibName:0 bundle:0];
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [(NavIndicatorsViewController *)v7 setAccessibilityIdentifier:v9];

    objc_storeWeak((id *)&v7->_delegate, v6);
    v10 = +[MNNavigationService sharedService];
    [v10 registerObserver:v7];

    objc_storeStrong((id *)&v7->_pedestrianARSessionStateManager, a4);
    [(PedestrianARSessionStateManager *)v7->_pedestrianARSessionStateManager addObserver:v7];
    v7->_observingAudioKeys = 1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = [&off_1013AE430 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(&off_1013AE430);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v14);
          v16 = +[NSUserDefaults standardUserDefaults];
          [v16 addObserver:v7 forKeyPath:v15 options:0 context:&off_101318158];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [&off_1013AE430 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }
  }

  return v7;
}

- (void)loadView
{
  id v3 = (id)objc_opt_new();
  [(NavIndicatorsViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v158.receiver = self;
  v158.super_class = (Class)NavIndicatorsViewController;
  [(NavIndicatorsViewController *)&v158 viewDidLoad];
  id v3 = (NavSpeedLimitView *)objc_opt_new();
  speedLimitView = self->_speedLimitView;
  self->_speedLimitView = v3;

  [(NavSpeedLimitView *)self->_speedLimitView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v5) = 1148846080;
  [(NavSpeedLimitView *)self->_speedLimitView setContentCompressionResistancePriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [(NavSpeedLimitView *)self->_speedLimitView setContentHuggingPriority:1 forAxis:v6];
  v7 = (MKCompassView *)objc_opt_new();
  compassView = self->_compassView;
  self->_compassView = v7;

  [(MKCompassView *)self->_compassView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKCompassView *)self->_compassView setAlpha:0.0];
  [(MKCompassView *)self->_compassView setAccessibilityIdentifier:@"CompassView"];
  v9 = self->_compassView;
  id v10 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_pressedCompass"];
  [(MKCompassView *)v9 addGestureRecognizer:v10];

  LODWORD(v11) = 1148846080;
  [(MKCompassView *)self->_compassView setContentCompressionResistancePriority:1 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(MKCompassView *)self->_compassView setContentHuggingPriority:1 forAxis:v12];
  [(NavIndicatorsViewController *)self _updateCompassStyling];
  uint64_t v13 = (UIButton *)objc_opt_new();
  toggleForceWindshield = self->_toggleForceWindshield;
  self->_toggleForceWindshield = v13;

  [(UIButton *)self->_toggleForceWindshield setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v15 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  [(UIButton *)self->_toggleForceWindshield setBackgroundColor:v15];

  v16 = [(UIButton *)self->_toggleForceWindshield layer];
  [v16 setCornerRadius:30.0];

  v17 = [(UIButton *)self->_toggleForceWindshield layer];
  LODWORD(v18) = 1045220557;
  [v17 setShadowOpacity:v18];

  long long v19 = [(UIButton *)self->_toggleForceWindshield layer];
  double height = CGSizeZero.height;
  [v19 setShadowOffset:CGSizeZero.width, height];

  long long v21 = [(UIButton *)self->_toggleForceWindshield layer];
  [v21 setShadowRadius:1.0];

  long long v22 = [(UIButton *)self->_toggleForceWindshield layer];
  [v22 setShadowPathIsBounds:1];

  [(UIButton *)self->_toggleForceWindshield setAccessibilityIdentifier:@"ToggleForceWindshield"];
  objc_super v23 = [(NavIndicatorsViewController *)self view];
  [v23 addSubview:self->_toggleForceWindshield];

  v24 = +[VKDebugSettings sharedSettings];
  LODWORD(v10) = [v24 shouldForceWindshieldMode];

  if (v10) {
    [(NavIndicatorsViewController *)self _configureForUnforceWindshield];
  }
  else {
    [(NavIndicatorsViewController *)self _configureForForceWindshield];
  }
  v25 = (UIButton *)objc_opt_new();
  overviewButton = self->_overviewButton;
  self->_overviewButton = v25;

  [(UIButton *)self->_overviewButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  [(UIButton *)self->_overviewButton setBackgroundColor:v27];

  v28 = [(UIButton *)self->_overviewButton layer];
  [v28 setCornerRadius:30.0];

  v29 = [(UIButton *)self->_overviewButton layer];
  LODWORD(v30) = 1045220557;
  [v29 setShadowOpacity:v30];

  v31 = [(UIButton *)self->_overviewButton layer];
  [v31 setShadowOffset:CGSizeZero.width, height];

  v32 = [(UIButton *)self->_overviewButton layer];
  [v32 setShadowRadius:1.0];

  v33 = [(UIButton *)self->_overviewButton layer];
  [v33 setShadowPathIsBounds:1];

  -[UIButton _setTouchInsets:](self->_overviewButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  [(UIButton *)self->_overviewButton setAccessibilityIdentifier:@"OverviewButton"];
  v34 = [(NavIndicatorsViewController *)self view];
  [v34 addSubview:self->_overviewButton];

  v35 = [[NavAudioControlView alloc] initWithDelegate:self];
  audioControl = self->_audioControl;
  self->_audioControl = v35;

  [(NavAudioControlView *)self->_audioControl setAvailableAudioTypes:&off_1013AE688];
  [(NavAudioControlView *)self->_audioControl setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v37) = 1148846080;
  [(NavAudioControlView *)self->_audioControl setContentCompressionResistancePriority:1 forAxis:v37];
  LODWORD(v38) = 1148846080;
  [(NavAudioControlView *)self->_audioControl setContentHuggingPriority:1 forAxis:v38];
  -[NavAudioControlView _setTouchInsets:](self->_audioControl, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  v39 = [(NavIndicatorsViewController *)self view];
  [v39 addSubview:self->_audioControl];

  v40 = (UIButton *)objc_opt_new();
  pedestrianARButton = self->_pedestrianARButton;
  self->_pedestrianARButton = v40;

  [(UIButton *)self->_pedestrianARButton addTarget:self action:"_pressedPedestrianAR" forControlEvents:64];
  v42 = self->_pedestrianARButton;
  v43 = +[NSBundle mainBundle];
  v44 = [v43 localizedStringForKey:@"Pedestrian AR [Accessibility]" value:@"localized string not found" table:0];
  [(UIButton *)v42 setAccessibilityLabel:v44];

  v151 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
  v45 = self->_pedestrianARButton;
  v46 = +[UIImage systemImageNamed:@"arkit" withConfiguration:v151];
  [(UIButton *)v45 setImage:v46 forState:0];

  [(UIButton *)self->_pedestrianARButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v47) = 1148846080;
  [(UIButton *)self->_pedestrianARButton setContentCompressionResistancePriority:1 forAxis:v47];
  v48 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  [(UIButton *)self->_pedestrianARButton setBackgroundColor:v48];

  v49 = [(UIButton *)self->_pedestrianARButton layer];
  [v49 setCornerRadius:30.0];

  v50 = [(UIButton *)self->_pedestrianARButton layer];
  LODWORD(v51) = 1045220557;
  [v50 setShadowOpacity:v51];

  v52 = [(UIButton *)self->_pedestrianARButton layer];
  [v52 setShadowOffset:CGSizeZero.width, height];

  v53 = [(UIButton *)self->_pedestrianARButton layer];
  [v53 setShadowRadius:1.0];

  v54 = [(UIButton *)self->_pedestrianARButton layer];
  [v54 setShadowPathIsBounds:1];

  -[UIButton _setTouchInsets:](self->_pedestrianARButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  [(UIButton *)self->_pedestrianARButton setAccessibilityIdentifier:@"PedestrianARButton"];
  v55 = [(NavIndicatorsViewController *)self view];
  [v55 addSubview:self->_pedestrianARButton];

  v56 = (UIButton *)objc_opt_new();
  ttrButton = self->_ttrButton;
  self->_ttrButton = v56;

  [(UIButton *)self->_ttrButton addTarget:self action:"_pressedTTR" forControlEvents:64];
  v58 = self->_ttrButton;
  v59 = +[NSBundle mainBundle];
  v60 = [v59 localizedStringForKey:@"Tap-to-Radar" value:@"localized string not found" table:0];
  [(UIButton *)v58 setAccessibilityLabel:v60];

  v150 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
  v61 = self->_ttrButton;
  v62 = +[UIImage _maps_radar_symbolCircleFilled];
  v63 = [v62 imageWithConfiguration:v150];
  [(UIButton *)v61 setImage:v63 forState:0];

  [(UIButton *)self->_ttrButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v64) = 1148846080;
  [(UIButton *)self->_ttrButton setContentCompressionResistancePriority:1 forAxis:v64];
  v65 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  [(UIButton *)self->_ttrButton setBackgroundColor:v65];

  v66 = [(UIButton *)self->_ttrButton layer];
  [v66 setCornerRadius:30.0];

  v67 = [(UIButton *)self->_ttrButton layer];
  LODWORD(v68) = 1045220557;
  [v67 setShadowOpacity:v68];

  v69 = [(UIButton *)self->_ttrButton layer];
  [v69 setShadowOffset:CGSizeZero.width, height];

  v70 = [(UIButton *)self->_ttrButton layer];
  [v70 setShadowRadius:1.0];

  v71 = [(UIButton *)self->_ttrButton layer];
  [v71 setShadowPathIsBounds:1];

  -[UIButton _setTouchInsets:](self->_ttrButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  [(UIButton *)self->_ttrButton setAccessibilityIdentifier:@"TTRButton"];
  [(UIButton *)self->_ttrButton setContextMenuInteractionEnabled:1];
  objc_initWeak(&location, self);
  v155[0] = _NSConcreteStackBlock;
  v155[1] = 3221225472;
  v155[2] = sub_100B173F0;
  v155[3] = &unk_1012E8CD0;
  objc_copyWeak(&v156, &location);
  v149 = +[UIAction actionWithTitle:@"Full" image:0 identifier:0 handler:v155];
  v153[0] = _NSConcreteStackBlock;
  v153[1] = 3221225472;
  v153[2] = sub_100B174E0;
  v153[3] = &unk_1012E8CD0;
  objc_copyWeak(&v154, &location);
  uint64_t v72 = +[UIAction actionWithTitle:@"Regular" image:0 identifier:0 handler:v153];
  v169[0] = v149;
  v169[1] = v72;
  v112 = (void *)v72;
  v73 = +[NSArray arrayWithObjects:v169 count:2];
  v142 = +[UIMenu menuWithTitle:@"Log archive type" image:0 identifier:0 options:1 children:v73];

  [(UIButton *)self->_ttrButton setMenu:v142];
  v74 = [(NavIndicatorsViewController *)self view];
  [v74 addSubview:self->_ttrButton];

  v75 = [(UIButton *)self->_ttrButton topAnchor];
  v76 = [(NavAudioControlView *)self->_audioControl bottomAnchor];
  v77 = [v75 constraintEqualToAnchor:v76 constant:16.0];
  ttrButtonTopConstraint = self->_ttrButtonTopConstraint;
  self->_ttrButtonTopConstraint = v77;

  v79 = [(UIButton *)self->_ttrButton topAnchor];
  v80 = [(UIButton *)self->_pedestrianARButton bottomAnchor];
  v81 = [v79 constraintEqualToAnchor:v80 constant:16.0];
  v82 = self->_ttrButtonTopConstraint;
  self->_ttrButtonTopConstraint = v81;

  v145 = [(UIButton *)self->_overviewButton trailingAnchor];
  v147 = [(NavIndicatorsViewController *)self view];
  v143 = [v147 trailingAnchor];
  v140 = [v145 constraintEqualToAnchor:v143 constant:-16.0];
  v168[0] = v140;
  v138 = [(UIButton *)self->_overviewButton widthAnchor];
  v136 = [v138 constraintEqualToConstant:60.0];
  v168[1] = v136;
  v134 = [(UIButton *)self->_overviewButton heightAnchor];
  v133 = [v134 constraintEqualToConstant:60.0];
  v168[2] = v133;
  v131 = [(NavAudioControlView *)self->_audioControl trailingAnchor];
  v132 = [(NavIndicatorsViewController *)self view];
  v130 = [v132 trailingAnchor];
  v129 = [v131 constraintEqualToAnchor:v130 constant:-16.0];
  v168[3] = v129;
  v128 = [(NavAudioControlView *)self->_audioControl topAnchor];
  v127 = [(UIButton *)self->_overviewButton bottomAnchor];
  v126 = [v128 constraintEqualToAnchor:v127 constant:16.0];
  v168[4] = v126;
  v124 = [(UIButton *)self->_pedestrianARButton trailingAnchor];
  v125 = [(NavIndicatorsViewController *)self view];
  v123 = [v125 trailingAnchor];
  v122 = [v124 constraintEqualToAnchor:v123 constant:-16.0];
  v168[5] = v122;
  v121 = [(UIButton *)self->_pedestrianARButton topAnchor];
  v120 = [(NavAudioControlView *)self->_audioControl bottomAnchor];
  v119 = [v121 constraintEqualToAnchor:v120 constant:16.0];
  v168[6] = v119;
  v118 = [(UIButton *)self->_pedestrianARButton widthAnchor];
  v117 = [v118 constraintEqualToConstant:60.0];
  v168[7] = v117;
  v116 = [(UIButton *)self->_pedestrianARButton heightAnchor];
  v115 = [(UIButton *)self->_pedestrianARButton widthAnchor];
  v114 = [v116 constraintEqualToAnchor:v115];
  v168[8] = v114;
  v113 = [(UIButton *)self->_ttrButton trailingAnchor];
  v83 = [(NavIndicatorsViewController *)self view];
  v84 = [v83 trailingAnchor];
  v85 = [v113 constraintEqualToAnchor:v84 constant:-16.0];
  v168[9] = v85;
  v86 = [(UIButton *)self->_ttrButton widthAnchor];
  v87 = [v86 constraintEqualToConstant:60.0];
  v168[10] = v87;
  v88 = [(UIButton *)self->_ttrButton heightAnchor];
  v89 = [(UIButton *)self->_ttrButton widthAnchor];
  v90 = [v88 constraintEqualToAnchor:v89];
  v91 = self->_ttrButtonTopConstraint;
  v168[11] = v90;
  v168[12] = v91;
  v92 = +[NSArray arrayWithObjects:v168 count:13];
  id v152 = [v92 mutableCopy];

  v93 = +[VKDebugSettings sharedSettings];
  if ([v93 enableWindshieldOverrideButton])
  {
    BOOL v94 = sub_100568D90();

    if (v94)
    {
      v95 = [(UIButton *)self->_toggleForceWindshield trailingAnchor];
      v96 = [(NavIndicatorsViewController *)self view];
      v97 = [v96 trailingAnchor];
      v98 = [v95 constraintEqualToAnchor:v97 constant:-16.0];
      v167[0] = v98;
      v146 = [(UIButton *)self->_toggleForceWindshield topAnchor];
      v148 = [(NavIndicatorsViewController *)self view];
      v144 = [v148 topAnchor];
      v141 = [v146 constraintEqualToAnchor:v144 constant:16.0];
      v167[1] = v141;
      v139 = [(UIButton *)self->_toggleForceWindshield widthAnchor];
      v137 = [v139 constraintEqualToConstant:60.0];
      v167[2] = v137;
      v135 = [(UIButton *)self->_toggleForceWindshield heightAnchor];
      v99 = [v135 constraintEqualToConstant:60.0];
      v167[3] = v99;
      v100 = [(UIButton *)self->_overviewButton topAnchor];
      v101 = [(UIButton *)self->_toggleForceWindshield bottomAnchor];
      v102 = [v100 constraintEqualToAnchor:v101 constant:16.0];
      v167[4] = v102;
      v103 = +[NSArray arrayWithObjects:v167 count:5];
      [v152 addObjectsFromArray:v103];

      uint64_t v104 = 0;
      goto LABEL_9;
    }
  }
  else
  {
  }
  v95 = [(UIButton *)self->_overviewButton topAnchor];
  v96 = [(NavIndicatorsViewController *)self view];
  v97 = [v96 topAnchor];
  v98 = [v95 constraintEqualToAnchor:v97 constant:16.0];
  [v152 addObject:v98];
  uint64_t v104 = 1;
LABEL_9:

  [(UIButton *)self->_toggleForceWindshield setHidden:v104];
  +[NSLayoutConstraint activateConstraints:v152];
  [(NavIndicatorsViewController *)self _updateContent];
  v105 = +[MNNavigationService sharedService];
  v106 = [v105 route];

  if (!v106)
  {
    v109 = sub_1005762E4();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v160 = "-[NavIndicatorsViewController viewDidLoad]";
      __int16 v161 = 2080;
      v162 = "NavIndicatorsViewController.m";
      __int16 v163 = 1024;
      int v164 = 292;
      __int16 v165 = 2080;
      v166 = "route != nil";
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v110 = sub_1005762E4();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        v111 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v160 = v111;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v107 = [(NavIndicatorsViewController *)self audioPreferences];
  [self setCurrentVoiceGuidanceLevel:[v107 guidanceLevelForTransportType:[v106 transportType]]];

  [(NavIndicatorsViewController *)self setRoute:v106];
  id v108 = &_dispatch_main_q;
  _GEOConfigAddDelegateListenerForKey();

  _GEOConfigAddDelegateListenerForKey();
  objc_destroyWeak(&v154);

  objc_destroyWeak(&v156);
  objc_destroyWeak(&location);
}

- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  [(NavIndicatorsViewController *)self loadViewIfNeeded];
  double v5 = [(NavIndicatorsViewController *)self view];
  double v6 = v4[2](v4, v5);

  v7 = sub_1005774B4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    speedLimitView = self->_speedLimitView;
    v9 = [(NavSpeedLimitView *)speedLimitView superview];
    int v11 = 138543874;
    double v12 = v6;
    __int16 v13 = 2114;
    v14 = speedLimitView;
    __int16 v15 = 1024;
    BOOL v16 = v9 != 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Inserting %{public}@ below %{public}@ (hasSuperview: %d)", (uint8_t *)&v11, 0x1Cu);
  }
  id v10 = [(NavIndicatorsViewController *)self view];
  [v10 insertSubview:v6 belowSubview:self->_speedLimitView];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NavIndicatorsViewController;
  id v4 = a3;
  [(NavIndicatorsViewController *)&v10 traitCollectionDidChange:v4];
  [(NavIndicatorsViewController *)self _updateCompassStyling];
  double v5 = [(NavIndicatorsViewController *)self traitCollection];
  int v6 = sub_100045060(v4, v5);

  if (v6)
  {
    v7 = [(NavIndicatorsViewController *)self traitCollection];
    id v8 = [v7 isLuminanceReduced];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100B17838;
    v9[3] = &unk_1012E5D08;
    v9[4] = self;
    +[UIView _maps_animateForAndromeda:v8 animations:v9];
  }
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  if (self->_observingAudioKeys)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = &off_1013AE430;
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
          v9 = +[NSUserDefaults standardUserDefaults];
          [v9 removeObserver:self forKeyPath:v8];

          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  [(PedestrianARSessionStateManager *)self->_pedestrianARSessionStateManager removeObserver:self];
  v10.receiver = self;
  v10.super_class = (Class)NavIndicatorsViewController;
  [(NavIndicatorsViewController *)&v10 dealloc];
}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_controlsHidden != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_controlsHidden = a3;
    v7 = sub_1005774B4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (v5) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      v9 = v8;
      if (v4) {
        objc_super v10 = @"YES";
      }
      else {
        objc_super v10 = @"NO";
      }
      long long v11 = v10;
      *(_DWORD *)buf = 138543618;
      BOOL v16 = v9;
      __int16 v17 = 2112;
      double v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setControlsHidden: %{public}@ animated: %@", buf, 0x16u);
    }
    if (v5) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }
    v14[1] = 3221225472;
    double v13 = 0.25;
    v14[0] = _NSConcreteStackBlock;
    v14[2] = sub_100B17BB0;
    v14[3] = &unk_1012E69C0;
    if (!v4) {
      double v13 = 0.0;
    }
    v14[4] = self;
    *(double *)&v14[5] = v12;
    +[UIView animateWithDuration:v14 animations:v13];
  }
}

- (void)setIndicatorsHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_indicatorsHidden != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_indicatorsHidden = a3;
    v7 = sub_1005774B4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (v5) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      v9 = v8;
      if (v4) {
        objc_super v10 = @"YES";
      }
      else {
        objc_super v10 = @"NO";
      }
      long long v11 = v10;
      *(_DWORD *)buf = 138543618;
      __int16 v15 = v9;
      __int16 v16 = 2112;
      __int16 v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "setIndicatorsHidden: %{public}@ animated: %@", buf, 0x16u);
    }
    double v12 = 0.0;
    if (v4) {
      double v12 = 0.25;
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100B17DD4;
    v13[3] = &unk_1012E5D08;
    v13[4] = self;
    +[UIView animateWithDuration:v13 animations:v12];
    [(NavIndicatorsViewController *)self _animateSpeedLimitViewAnimated:v4];
  }
}

- (double)_compassViewAlpha
{
  id v3 = [(NavIndicatorsViewController *)self traitCollection];
  unsigned __int8 v4 = [v3 isLuminanceReduced];

  double v5 = 0.0;
  if ((v4 & 1) == 0)
  {
    if ((id)[(NavIndicatorsViewController *)self indicatorsType] == (id)1)
    {
      double v5 = 1.0;
      if (self->_temporarilyShowingCompass) {
        return v5;
      }
    }
    else if (self->_indicatorsHidden)
    {
      return v5;
    }
    if ([(NavIndicatorsViewController *)self _alwaysShowCompass]) {
      return 1.0;
    }
    else {
      return 0.0;
    }
  }
  return v5;
}

- (double)_speedLimitViewAlpha
{
  double result = 0.0;
  if (!self->_indicatorsHidden)
  {
    int BOOL = GEOConfigGetBOOL();
    double v5 = [(NavIndicatorsViewController *)self route];
    unsigned int v6 = [v5 transportType];
    if (v6) {
      BOOL v7 = v6 == 3;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;

    double result = 0.0;
    if ((BOOL & v8) != 0) {
      return 1.0;
    }
  }
  return result;
}

- (void)setIndicatorsType:(unint64_t)a3
{
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
  -[MKCompassView setYaw:](self->_compassView, "setYaw:");
}

- (void)setRoute:(id)a3
{
}

- (AudioPreferences)audioPreferences
{
  audioPreferences = self->_audioPreferences;
  if (!audioPreferences)
  {
    unsigned __int8 v4 = [AudioPreferences alloc];
    double v5 = +[NSUserDefaults standardUserDefaults];
    unsigned int v6 = [(AudioPreferences *)v4 initWithDefaults:v5];
    BOOL v7 = self->_audioPreferences;
    self->_audioPreferences = v6;

    audioPreferences = self->_audioPreferences;
  }

  return audioPreferences;
}

- (NSLayoutConstraint)speedLimitToViewTopConstraint
{
  speedLimitToViewTopConstraint = self->_speedLimitToViewTopConstraint;
  if (!speedLimitToViewTopConstraint)
  {
    unsigned __int8 v4 = [(NavSpeedLimitView *)self->_speedLimitView topAnchor];
    double v5 = [(NavIndicatorsViewController *)self view];
    unsigned int v6 = [v5 topAnchor];
    BOOL v7 = [v4 constraintEqualToAnchor:v6 constant:16.0];
    int v8 = self->_speedLimitToViewTopConstraint;
    self->_speedLimitToViewTopConstraint = v7;

    speedLimitToViewTopConstraint = self->_speedLimitToViewTopConstraint;
  }

  return speedLimitToViewTopConstraint;
}

- (NSLayoutConstraint)speedLimitToCompassBottomConstraint
{
  speedLimitToCompassBottomConstraint = self->_speedLimitToCompassBottomConstraint;
  if (!speedLimitToCompassBottomConstraint)
  {
    unsigned __int8 v4 = [(NavSpeedLimitView *)self->_speedLimitView topAnchor];
    double v5 = [(MKCompassView *)self->_compassView bottomAnchor];
    unsigned int v6 = [v4 constraintEqualToAnchor:v5 constant:16.0];
    BOOL v7 = self->_speedLimitToCompassBottomConstraint;
    self->_speedLimitToCompassBottomConstraint = v6;

    speedLimitToCompassBottomConstraint = self->_speedLimitToCompassBottomConstraint;
  }

  return speedLimitToCompassBottomConstraint;
}

- (void)_setIndicatorsType:(unint64_t)a3 route:(id)a4
{
  unint64_t v11 = (unint64_t)a4;
  unint64_t indicatorsType = self->_indicatorsType;
  unint64_t v8 = self->_route;
  v9 = (void *)v8;
  if (v11 | v8) {
    unsigned __int8 v10 = [v8 isEqual:];
  }
  else {
    unsigned __int8 v10 = 1;
  }

  if (indicatorsType != a3 || (v10 & 1) == 0)
  {
    self->_unint64_t indicatorsType = a3;
    objc_storeStrong((id *)&self->_route, a4);
    if (v10) {
      [(NavIndicatorsViewController *)self _updateOverviewButton];
    }
    else {
      [(NavIndicatorsViewController *)self _updateContent];
    }
  }
}

- (BOOL)_alwaysShowCompass
{
  return GEOConfigGetBOOL();
}

- (void)_insertCompassView
{
  id v3 = objc_opt_new();
  [(MKCompassView *)self->_compassView removeFromSuperview];
  unsigned __int8 v4 = [(NavIndicatorsViewController *)self view];
  [v4 addSubview:self->_compassView];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100B18464;
  v16[3] = &unk_1012E5D08;
  v16[4] = self;
  +[UIView performWithoutAnimation:v16];
  double v5 = [(MKCompassView *)self->_compassView leadingAnchor];
  unsigned int v6 = [(NavIndicatorsViewController *)self view];
  BOOL v7 = [v6 leadingAnchor];
  unint64_t v8 = [v5 constraintEqualToAnchor:v7 constant:16.0];
  [v3 addObject:v8];

  v9 = [(MKCompassView *)self->_compassView topAnchor];
  unsigned __int8 v10 = [(NavIndicatorsViewController *)self view];
  unint64_t v11 = [v10 topAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11 constant:16.0];
  [v3 addObject:v12];

  double v13 = [(NavSpeedLimitView *)self->_speedLimitView superview];

  if (v13)
  {
    long long v14 = [(NavIndicatorsViewController *)self speedLimitToViewTopConstraint];
    [(NavIndicatorsViewController *)self _setConstraint:v14 active:0];

    __int16 v15 = [(NavIndicatorsViewController *)self speedLimitToCompassBottomConstraint];
    [(NavIndicatorsViewController *)self _setConstraint:v15 active:1];
  }
  +[NSLayoutConstraint activateConstraints:v3];
}

- (void)_removeCompassView
{
  id v3 = [(NavSpeedLimitView *)self->_speedLimitView superview];

  if (v3)
  {
    unsigned __int8 v4 = [(NavIndicatorsViewController *)self speedLimitToCompassBottomConstraint];
    [(NavIndicatorsViewController *)self _setConstraint:v4 active:0];

    id v5 = [(NavIndicatorsViewController *)self speedLimitToViewTopConstraint];
    [(NavIndicatorsViewController *)self _setConstraint:v5 active:1];
  }
}

- (void)_setConstraint:(id)a3 active:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  unsigned int v6 = v5;
  if (!v4) {
    goto LABEL_8;
  }
  BOOL v7 = [v5 firstItem];
  unint64_t v8 = [v7 superview];
  v9 = [v6 secondItem];
  unsigned __int8 v10 = [v9 superview];
  unint64_t v11 = v8;
  unint64_t v12 = v10;
  if (!(v11 | v12))
  {
    double v13 = 0;
    unint64_t v11 = 0;
LABEL_7:

LABEL_8:
    [v6 setActive:v4];
    goto LABEL_9;
  }
  double v13 = (void *)v12;
  unsigned __int8 v14 = [(id)v11 isEqual:v12];

  if (v14) {
    goto LABEL_7;
  }
  __int16 v15 = [v6 firstItem];
  __int16 v16 = [v6 secondItem];
  if ([v15 isDescendantOfView:v16])
  {

    goto LABEL_7;
  }
  __int16 v17 = [v6 secondItem];
  double v18 = [v6 firstItem];
  unsigned __int8 v20 = [v17 isDescendantOfView:v18];

  if (v20) {
    goto LABEL_8;
  }
  long long v19 = sub_1005774B4();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Misuse of constraint: %@", buf, 0xCu);
  }

LABEL_9:
}

- (void)_updateContent
{
  id v3 = objc_opt_new();
  [(NavIndicatorsViewController *)self _compassViewAlpha];
  double v5 = v4;
  [(NavIndicatorsViewController *)self _speedLimitViewAlpha];
  double v7 = v6;
  unint64_t v8 = sub_1005774B4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v43 = 67109376;
    *(_DWORD *)v44 = v5 > 0.0;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v7 > 0.0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Drawing content with compass: %d speed limit: %d", (uint8_t *)&v43, 0xEu);
  }

  compassView = self->_compassView;
  if (v5 <= 0.0)
  {
    [(MKCompassView *)compassView removeFromSuperview];
  }
  else
  {
    unsigned __int8 v10 = [(MKCompassView *)compassView superview];

    if (!v10)
    {
      unint64_t v11 = [(NavIndicatorsViewController *)self view];
      [v11 addSubview:self->_compassView];

      unint64_t v12 = [(MKCompassView *)self->_compassView leadingAnchor];
      double v13 = [(NavIndicatorsViewController *)self view];
      unsigned __int8 v14 = [v13 leadingAnchor];
      __int16 v15 = [v12 constraintEqualToAnchor:v14 constant:16.0];
      [v3 addObject:v15];

      __int16 v16 = [(MKCompassView *)self->_compassView topAnchor];
      __int16 v17 = [(NavIndicatorsViewController *)self view];
      double v18 = [v17 topAnchor];
      long long v19 = [v16 constraintEqualToAnchor:v18 constant:16.0];
      [v3 addObject:v19];
    }
  }
  [(MKCompassView *)self->_compassView setAlpha:v5];
  unsigned __int8 v20 = [(NavSpeedLimitView *)self->_speedLimitView superview];
  long long v21 = v20;
  if (v7 <= 0.0)
  {

    if (v21)
    {
      v29 = sub_1005774B4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LOWORD(v43) = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Removing speedLimitView from the view hierarchy", (uint8_t *)&v43, 2u);
      }

      [(NavSpeedLimitView *)self->_speedLimitView removeFromSuperview];
    }
  }
  else
  {

    if (!v21)
    {
      long long v22 = sub_1005774B4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v43 = 136315394;
        *(void *)v44 = "-[NavIndicatorsViewController _updateContent]";
        *(_WORD *)&v44[8] = 1024;
        BOOL v45 = v5 > 0.0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s: Inserting speedLimitView into the view hierarchy, below compass: %d", (uint8_t *)&v43, 0x12u);
      }

      objc_super v23 = [(NavIndicatorsViewController *)self view];
      [v23 addSubview:self->_speedLimitView];

      v24 = [(NavSpeedLimitView *)self->_speedLimitView leadingAnchor];
      v25 = [(NavIndicatorsViewController *)self view];
      v26 = [v25 leadingAnchor];
      v27 = [v24 constraintEqualToAnchor:v26 constant:16.0];
      [v3 addObject:v27];
    }
    if (v5 <= 0.0)
    {
      double v30 = [(NavIndicatorsViewController *)self speedLimitToCompassBottomConstraint];
      [(NavIndicatorsViewController *)self _setConstraint:v30 active:0];

      [(NavIndicatorsViewController *)self speedLimitToViewTopConstraint];
    }
    else
    {
      v28 = [(NavIndicatorsViewController *)self speedLimitToViewTopConstraint];
      [(NavIndicatorsViewController *)self _setConstraint:v28 active:0];

      [(NavIndicatorsViewController *)self speedLimitToCompassBottomConstraint];
    v31 = };
    [(NavIndicatorsViewController *)self _setConstraint:v31 active:1];
  }
  +[NSLayoutConstraint activateConstraints:v3];
  [(NavIndicatorsViewController *)self _updateOverviewButton];
  v32 = [(NavIndicatorsViewController *)self route];
  unsigned int v33 = [v32 transportType];

  if (v33) {
    v34 = &off_1013AE6B8;
  }
  else {
    v34 = &off_1013AE6A0;
  }
  [(NavAudioControlView *)self->_audioControl setAvailableAudioTypes:v34];
  [(NavAudioControlView *)self->_audioControl setCurrentAudioType:+[NavAudioControlView navAudioTypeForGuidanceLevel:[(NavIndicatorsViewController *)self currentVoiceGuidanceLevel]]];
  if ([(PedestrianARSessionStateManager *)self->_pedestrianARSessionStateManager shouldShowPedestrianAR])
  {
    p_pedestrianARButton = &self->_pedestrianARButton;
    [(UIButton *)self->_pedestrianARButton setHidden:0];
  }
  else
  {
    v36 = +[NSUserDefaults standardUserDefaults];
    p_pedestrianARButton = &self->_pedestrianARButton;
    -[UIButton setHidden:](self->_pedestrianARButton, "setHidden:", [v36 BOOLForKey:@"PedestrianARForceShowAffordanceKey"] ^ 1);
  }
  [(NavIndicatorsViewController *)self _setConstraint:self->_ttrButtonTopConstraint active:0];
  double v37 = [(UIButton *)self->_ttrButton topAnchor];
  if ([(UIButton *)*p_pedestrianARButton isHidden]) {
    p_audioControl = &self->_audioControl;
  }
  else {
    p_audioControl = (NavAudioControlView **)p_pedestrianARButton;
  }
  v39 = [(NavAudioControlView *)*p_audioControl bottomAnchor];
  v40 = [v37 constraintEqualToAnchor:v39 constant:16.0];
  ttrButtonTopConstraint = self->_ttrButtonTopConstraint;
  self->_ttrButtonTopConstraint = v40;

  uint64_t v42 = 1;
  [(NavIndicatorsViewController *)self _setConstraint:self->_ttrButtonTopConstraint active:1];
  if (+[MapsTapToRadarExtras shouldEnableTTRButton]) {
    uint64_t v42 = GEOConfigGetBOOL() ^ 1;
  }
  [(UIButton *)self->_ttrButton setHidden:v42];
}

- (void)_updateCompassStyling
{
  id v3 = [(NavIndicatorsViewController *)self traitCollection];
  BOOL v4 = [v3 userInterfaceStyle] != (id)2;

  compassView = self->_compassView;

  [(MKCompassView *)compassView setCompassViewSize:2 style:v4];
}

- (void)_updateOverviewButton
{
  id v3 = +[UIButtonConfiguration borderlessButtonConfiguration];
  BOOL v4 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:22.0];
  [v3 setPreferredSymbolConfigurationForImage:v4];

  double v5 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  double v6 = [v3 background];
  [v6 setBackgroundColor:v5];

  double v7 = [v3 background];
  [v7 setCornerRadius:30.0];

  [v3 setCornerStyle:-1];
  if ((id)[(NavIndicatorsViewController *)self indicatorsType] == (id)1)
  {
    unint64_t v8 = +[UIImage systemImageNamed:@"location.north.line.fill"];
    [v3 setImage:v8];

    [v3 contentInsets];
    double v10 = v9;
    [v3 contentInsets];
    double v12 = v11;
    [v3 contentInsets];
    double v14 = v13 + 3.0;
    [v3 contentInsets];
    [v3 setContentInsets:v10, v12, v14];
    p_overviewButton = &self->_overviewButton;
    [(UIButton *)self->_overviewButton removeTarget:self action:"_pressedViewOverview" forControlEvents:64];
    [(UIButton *)self->_overviewButton addTarget:self action:"_pressedViewTbT" forControlEvents:64];
    __int16 v16 = +[NSBundle mainBundle];
    __int16 v17 = v16;
    CFStringRef v18 = @"[Overview] Turn-by-Turn Mode";
  }
  else
  {
    long long v19 = +[UIImage imageNamed:@"CameraModeOverview"];
    [v3 setImage:v19];

    p_overviewButton = &self->_overviewButton;
    [(UIButton *)self->_overviewButton removeTarget:self action:"_pressedViewTbT" forControlEvents:64];
    [(UIButton *)self->_overviewButton addTarget:self action:"_pressedViewOverview" forControlEvents:64];
    __int16 v16 = +[NSBundle mainBundle];
    __int16 v17 = v16;
    CFStringRef v18 = @"[Overview] Overview Mode";
  }
  unsigned __int8 v20 = [v16 localizedStringForKey:v18 value:@"localized string not found" table:0];
  [(UIButton *)*p_overviewButton setAccessibilityLabel:v20];

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100B19078;
  v22[3] = &unk_1012E5D58;
  v22[4] = self;
  id v23 = v3;
  id v21 = v3;
  +[UIView performWithoutAnimation:v22];
}

- (void)_configureForForceWindshield
{
  [(UIButton *)self->_toggleForceWindshield removeTarget:self action:"_pressedUnforceWindshield" forControlEvents:64];
  [(UIButton *)self->_toggleForceWindshield addTarget:self action:"_pressedForceWindshield" forControlEvents:64];
  id v5 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
  toggleForceWindshield = self->_toggleForceWindshield;
  BOOL v4 = +[UIImage systemImageNamed:@"w.circle" withConfiguration:v5];
  [(UIButton *)toggleForceWindshield setImage:v4 forState:0];
}

- (void)_configureForUnforceWindshield
{
  [(UIButton *)self->_toggleForceWindshield removeTarget:self action:"_pressedForceWindshield" forControlEvents:64];
  [(UIButton *)self->_toggleForceWindshield addTarget:self action:"_pressedUnforceWindshield" forControlEvents:64];
  id v5 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
  toggleForceWindshield = self->_toggleForceWindshield;
  BOOL v4 = +[UIImage systemImageNamed:@"w.circle.fill" withConfiguration:v5];
  [(UIButton *)toggleForceWindshield setImage:v4 forState:0];
}

- (void)_pressedForceWindshield
{
  [(NavIndicatorsViewController *)self _configureForUnforceWindshield];
  id v2 = +[VKDebugSettings sharedSettings];
  [v2 setShouldForceWindshieldMode:1];
}

- (void)_pressedUnforceWindshield
{
  [(NavIndicatorsViewController *)self _configureForForceWindshield];
  id v2 = +[VKDebugSettings sharedSettings];
  [v2 setShouldForceWindshieldMode:0];
}

- (void)_pressedViewOverview
{
  id v3 = sub_1005774B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Switching to overview mode", v5, 2u);
  }

  +[GEOAPPortal captureUserAction:9017 target:505 value:0];
  BOOL v4 = [(NavIndicatorsViewController *)self delegate];
  [v4 switchToOverviewMode];

  [(NavIndicatorsViewController *)self _animateInCompassIfNeededWithTimeout:1];
  [(NavIndicatorsViewController *)self _animateSpeedLimitViewAnimated:1];
}

- (void)_pressedViewTbT
{
  id v3 = sub_1005774B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Switching to zoomed in mode", v5, 2u);
  }

  +[GEOAPPortal captureUserAction:9018 target:505 value:0];
  BOOL v4 = [(NavIndicatorsViewController *)self delegate];
  [v4 switchToZoomedInMode];

  [(NavIndicatorsViewController *)self _animateOutCompassIfNeeded];
  [(NavIndicatorsViewController *)self _animateSpeedLimitViewAnimated:1];
}

- (void)_pressedPedestrianAR
{
  id v2 = [(NavIndicatorsViewController *)self delegate];
  [v2 enterPedestrianAR];

  +[GEOAPPortal captureUserAction:126 target:402 value:0];
}

- (void)_pressedTTR
{
  id v3 = sub_1005774B4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = self;
    if (!v4)
    {
      double v9 = @"<nil>";
      goto LABEL_10;
    }
    id v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    if (objc_opt_respondsToSelector())
    {
      double v7 = [(NavIndicatorsViewController *)v4 performSelector:"accessibilityIdentifier"];
      unint64_t v8 = v7;
      if (v7 && ![v7 isEqualToString:v6])
      {
        double v9 = +[NSString stringWithFormat:@"%@<%p, %@>", v6, v4, v8];

        goto LABEL_8;
      }
    }
    double v9 = +[NSString stringWithFormat:@"%@<%p>", v6, v4];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    double v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR from nav indicators", buf, 0xCu);
  }
  double v10 = +[MapsRadarController sharedInstance];
  [v10 launchTTR];
}

- (void)_pressedCompass
{
  if ((id)[(NavIndicatorsViewController *)self indicatorsType] == (id)1)
  {
    id v3 = [(NavIndicatorsViewController *)self delegate];
    [v3 toggleHeadingMode];

    [(NavIndicatorsViewController *)self _animateOutCompassIfNeeded];
    +[GEOAPPortal captureUserAction:1040 target:505 value:0];
  }
}

- (void)_updateAudioPreferences
{
  id v3 = [(NavIndicatorsViewController *)self audioPreferences];
  [v3 loadValuesFromDefaults];

  BOOL v4 = [(NavIndicatorsViewController *)self audioPreferences];
  id v5 = [(NavIndicatorsViewController *)self route];
  [self setCurrentVoiceGuidanceLevel:[v4 guidanceLevelForTransportType:[v5 transportType]]];

  double v6 = sub_1005774B4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = [(NavIndicatorsViewController *)self currentVoiceGuidanceLevel];
    if (v7 + 1 >= 4)
    {
      unint64_t v8 = +[NSString stringWithFormat:@"UNKNOWN: %lu", v7];
    }
    else
    {
      unint64_t v8 = *(&off_101318198 + v7 + 1);
    }
    *(_DWORD *)buf = 138412290;
    double v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updated voice guidance level from audio preferences: %@", buf, 0xCu);
  }
  [(NavIndicatorsViewController *)self _updateContent];
}

- (unint64_t)_guidanceLevel:(unint64_t)a3 supportingTransportType:(int)a4
{
  if (a3 == 1) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = a3;
  }
  if (a4) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = a3;
  }
  if ((a4 - 2) >= 2) {
    return v5;
  }
  else {
    return v4;
  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  speedLimitView = self->_speedLimitView;
  id v6 = a4;
  LODWORD(speedLimitView) = [(NavSpeedLimitView *)speedLimitView isVisible];
  uint64_t v7 = [v6 speedLimitIsMPH] ^ 1;
  unint64_t v8 = self->_speedLimitView;
  id v9 = [v6 speedLimit];
  id v10 = [v6 speedLimitShieldType];

  [(NavSpeedLimitView *)v8 setSpeedLimit:v9 units:v7 shieldType:v10];
  if (speedLimitView != [(NavSpeedLimitView *)self->_speedLimitView isVisible])
  {
    [(NavIndicatorsViewController *)self _updateContent];
  }
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a5;
  id v9 = [(NavIndicatorsViewController *)self audioPreferences];
  id v10 = [v9 guidanceLevelForTransportType:v6];

  double v11 = [(NavIndicatorsViewController *)self audioPreferences];
  double v12 = [(NavIndicatorsViewController *)self route];
  id v13 = [v11 guidanceLevelForTransportType:[v12 transportType]];

  unint64_t v14 = [(NavIndicatorsViewController *)self _guidanceLevel:v13 supportingTransportType:v6];
  __int16 v15 = sub_1005774B4();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v10 == (id)v14)
  {
    if (!v16) {
      goto LABEL_22;
    }
    if (v6 >= 7)
    {
      __int16 v17 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
    }
    else
    {
      __int16 v17 = *(&off_101318160 + (int)v6);
    }
    id v19 = v17;
    if ((unint64_t)v10 + 1 >= 4)
    {
      id v20 = +[NSString stringWithFormat:@"UNKNOWN: %lu", v10];
    }
    else
    {
      id v20 = *(&off_101318198 + (void)v10 + 1);
    }
    *(_DWORD *)buf = 138412546;
    id v26 = v19;
    __int16 v27 = 2112;
    id v28 = v20;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Transport type changed. Guidance level for '%@' is '%@'", buf, 0x16u);
  }
  else
  {
    if (!v16) {
      goto LABEL_22;
    }
    if (v6 >= 7)
    {
      CFStringRef v18 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
    }
    else
    {
      CFStringRef v18 = *(&off_101318160 + (int)v6);
    }
    id v19 = v18;
    if ((unint64_t)v10 + 1 >= 4)
    {
      id v21 = +[NSString stringWithFormat:@"UNKNOWN: %lu", v10];
    }
    else
    {
      id v21 = *(&off_101318198 + (void)v10 + 1);
    }
    id v20 = v21;
    if (v14 + 1 >= 4)
    {
      long long v22 = +[NSString stringWithFormat:@"UNKNOWN: %lu", v14];
    }
    else
    {
      long long v22 = *(&off_101318198 + v14 + 1);
    }
    *(_DWORD *)buf = 138412802;
    id v26 = v19;
    __int16 v27 = 2112;
    id v28 = v20;
    __int16 v29 = 2112;
    double v30 = v22;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Transport type changed. Updating guidance level for '%@' from '%@' to '%@'", buf, 0x20u);
  }
LABEL_22:

  [(NavIndicatorsViewController *)self setCurrentVoiceGuidanceLevel:v10];
  [(NavIndicatorsViewController *)self setRoute:v8];

  if (v10 != (id)v14)
  {
    id v23 = [(NavIndicatorsViewController *)self audioPreferences];
    [v23 setGuidanceLevel:v14 forTransportType:v6];

    v24 = [(NavIndicatorsViewController *)self audioPreferences];
    [v24 synchronize];
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  BOOL v3 = a3.var0 == MapsConfig_NavigationShowSpeedLimit && a3.var1 == off_1015EEEF8;
  if (v3 || (a3.var0 == MapsConfig_NavigationShowHeading ? (BOOL v4 = a3.var1 == off_1015EEEE8) : (BOOL v4 = 0), v4)) {
    [(NavIndicatorsViewController *)self _updateContent];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10 && a6 == &off_101318158 && [&off_1013AE430 containsObject:v10])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B19DA0;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)NavIndicatorsViewController;
    [(NavIndicatorsViewController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)audioControlView:(id)a3 didSelectAudioType:(unint64_t)a4
{
  uint64_t v5 = 1;
  if (a4 != 1) {
    uint64_t v5 = 2;
  }
  if (a4 == 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = [(NavIndicatorsViewController *)self audioPreferences];
  id v8 = [(NavIndicatorsViewController *)self route];
  [v7 setGuidanceLevel:v6 forTransportType:[v8 transportType]];

  id v9 = [(NavIndicatorsViewController *)self audioPreferences];
  [v9 synchronize];
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  if ((id)[(NavIndicatorsViewController *)self indicatorsType] == (id)1)
  {
    [(NavIndicatorsViewController *)self _animateInCompassIfNeededWithTimeout:1];
  }
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  if ((id)[(NavIndicatorsViewController *)self indicatorsType] == (id)1)
  {
    [(NavIndicatorsViewController *)self _animateInCompassIfNeededWithTimeout:0];
  }
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  if ((id)[(NavIndicatorsViewController *)self indicatorsType] == (id)1)
  {
    [(NavIndicatorsViewController *)self _animateInCompassIfNeededWithTimeout:0];
  }
}

- (void)_animateInCompassIfNeededWithTimeout:(BOOL)a3
{
  self->_temporarilyShowingCompass = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B1A0C0;
  v9[3] = &unk_1012E6300;
  BOOL v10 = a3;
  v9[4] = self;
  BOOL v4 = objc_retainBlock(v9);
  ((void (*)(void))v4[2])();
  uint64_t v5 = [(MKCompassView *)self->_compassView superview];

  if (!v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100B1A0E4;
    v8[3] = &unk_1012E5D08;
    v8[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B1A168;
    v6[3] = &unk_1012EAFC0;
    uint64_t v7 = v4;
    +[UIView animateWithDuration:v8 animations:v6 completion:0.25];
  }
}

- (void)_scheduleTimerToDismissCompass
{
  objc_initWeak(&location, self);
  GEOConfigGetDouble();
  double v4 = v3;
  id v5 = &_dispatch_main_q;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100B1A2A4;
  v8[3] = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  uint64_t v6 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v8 block:v4];
  compassDismissTimer = self->_compassDismissTimer;
  self->_compassDismissTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_animateOutCompassIfNeeded
{
  self->_temporarilyShowingCompass = 0;
  compassDismissTimer = self->_compassDismissTimer;
  self->_compassDismissTimer = 0;

  if (![(NavIndicatorsViewController *)self _alwaysShowCompass])
  {
    v4[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100B1A3DC;
    v5[3] = &unk_1012E5D08;
    v5[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100B1A460;
    v4[3] = &unk_1012E7D28;
    +[UIView animateWithDuration:4 delay:v5 options:v4 animations:0.25 completion:0.0];
  }
}

- (void)_animateSpeedLimitViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(NavIndicatorsViewController *)self _speedLimitViewAlpha];
  double v6 = v5;
  if (v5 > 0.0)
  {
    uint64_t v7 = [(NavSpeedLimitView *)self->_speedLimitView superview];

    if (!v7)
    {
      [(NavIndicatorsViewController *)self _compassViewAlpha];
      double v9 = v8;
      BOOL v10 = sub_1005774B4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v20 = "-[NavIndicatorsViewController _animateSpeedLimitViewAnimated:]";
        __int16 v21 = 1024;
        BOOL v22 = v9 > 0.0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s: Inserting speedLimitView into the view hierarchy, below compass: %d", buf, 0x12u);
      }

      id v11 = [(NavIndicatorsViewController *)self view];
      [v11 addSubview:self->_speedLimitView];

      id v12 = [(NavSpeedLimitView *)self->_speedLimitView leadingAnchor];
      objc_super v13 = [(NavIndicatorsViewController *)self view];
      unint64_t v14 = [v13 leadingAnchor];
      __int16 v15 = [v12 constraintEqualToAnchor:v14 constant:16.0];
      [v15 setActive:1];

      if (v9 <= 0.0) {
        [(NavIndicatorsViewController *)self speedLimitToViewTopConstraint];
      }
      else {
      BOOL v16 = [(NavIndicatorsViewController *)self speedLimitToCompassBottomConstraint];
      }
      [(NavIndicatorsViewController *)self _setConstraint:v16 active:1];
    }
  }
  double v17 = 0.0;
  v18[1] = 3221225472;
  v18[0] = _NSConcreteStackBlock;
  v18[2] = sub_100B1A6B4;
  v18[3] = &unk_1012E69C0;
  if (v3) {
    double v17 = 0.25;
  }
  v18[4] = self;
  *(double *)&v18[5] = v6;
  +[UIView animateWithDuration:4 delay:v18 options:0 animations:v17 completion:0.0];
}

- (NavIndicatorsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavIndicatorsViewControllerDelegate *)WeakRetained;
}

- (unint64_t)indicatorsType
{
  return self->_indicatorsType;
}

- (NavSpeedLimitView)speedLimitView
{
  return self->_speedLimitView;
}

- (double)yaw
{
  return self->_yaw;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setAudioPreferences:(id)a3
{
}

- (unint64_t)currentVoiceGuidanceLevel
{
  return self->_currentVoiceGuidanceLevel;
}

- (void)setCurrentVoiceGuidanceLevel:(unint64_t)a3
{
  self->_currentVoiceGuidanceLevel = a3;
}

- (void)setSpeedLimitToViewTopConstraint:(id)a3
{
}

- (void)setSpeedLimitToCompassBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)ttrButtonTopConstraint
{
  return self->_ttrButtonTopConstraint;
}

- (void)setTtrButtonTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttrButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_speedLimitToCompassBottomConstraint, 0);
  objc_storeStrong((id *)&self->_speedLimitToViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_audioPreferences, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_speedLimitView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_toggleForceWindshield, 0);
  objc_storeStrong((id *)&self->_compassDismissTimer, 0);
  objc_storeStrong((id *)&self->_ttrButton, 0);
  objc_storeStrong((id *)&self->_pedestrianARSessionStateManager, 0);
  objc_storeStrong((id *)&self->_pedestrianARButton, 0);
  objc_storeStrong((id *)&self->_audioControl, 0);
  objc_storeStrong((id *)&self->_overviewButton, 0);

  objc_storeStrong((id *)&self->_compassView, 0);
}

@end