@interface CarAccessoriesOverlay
- (BOOL)_shouldShowHeadingIndicator;
- (BOOL)_shouldShowSpeedSign;
- (BOOL)_wantsHorizontalLayout;
- (BOOL)headingIndicatorIgnoresUserSettings;
- (BOOL)ignoresCollisionConstraints;
- (BOOL)isHidden;
- (BOOL)showHeadingIndicator;
- (BOOL)showSpeedSign;
- (BOOL)speedSignIgnoresUserSettings;
- (BOOL)userPermitsHeadingIndicator;
- (BOOL)userPermitsSpeedSign;
- (CarAccessoriesOverlay)initWithCarSceneType:(int64_t)a3;
- (ChromeOverlayHosting)host;
- (void)dealloc;
- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4;
- (void)reloadAnimated:(BOOL)a3;
- (void)setContentView:(id)a3 layoutGuide:(id)a4;
- (void)setHeadingIndicatorIgnoresUserSettings:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setHost:(id)a3;
- (void)setIgnoresCollisionConstraints:(BOOL)a3;
- (void)setShowHeadingIndicator:(BOOL)a3;
- (void)setShowSpeedSign:(BOOL)a3;
- (void)setSpeedSignIgnoresUserSettings:(BOOL)a3;
- (void)setUserPermitsHeadingIndicator:(BOOL)a3;
- (void)setUserPermitsSpeedSign:(BOOL)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation CarAccessoriesOverlay

- (void)dealloc
{
  v3 = sub_100BDFAD4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(MapsLightLevelController *)self->_lightLevelController removeObserver:self];
  GEOConfigRemoveDelegateListenerForAllKeys();
  [(CarAccessoriesOverlay *)self setContentView:0 layoutGuide:0];
  v4.receiver = self;
  v4.super_class = (Class)CarAccessoriesOverlay;
  [(CarAccessoriesOverlay *)&v4 dealloc];
}

- (CarAccessoriesOverlay)initWithCarSceneType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CarAccessoriesOverlay;
  objc_super v4 = [(CarAccessoriesOverlay *)&v7 init];
  if (v4)
  {
    v5 = sub_100BDFAD4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v4->_sceneType = a3;
    v4->_userPermitsHeadingIndicator = GEOConfigGetBOOL();
    v4->_userPermitsSpeedSign = GEOConfigGetBOOL();
    _GEOConfigAddDelegateListenerForKey();
    _GEOConfigAddDelegateListenerForKey();
  }
  return v4;
}

- (void)setHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_host, v4);
    if (v4)
    {
      v6 = [v4 containingViewController];
      objc_super v7 = [v6 _maps_carSceneDelegate];

      v8 = [MapsLightLevelController alloc];
      v9 = [v7 window];
      v10 = [v9 windowScene];
      v11 = [(MapsLightLevelController *)v8 initWithWindowScene:v10];
      lightLevelController = self->_lightLevelController;
      self->_lightLevelController = v11;

      [(MapsLightLevelController *)self->_lightLevelController addObserver:self];
      v13 = [v4 overlayContentView];
      v14 = [v4 layoutGuideForOverlay:self];
      [(CarAccessoriesOverlay *)self setContentView:v13 layoutGuide:v14];

      accessoryStackView = self->_accessoryStackView;
      if (accessoryStackView)
      {
        v16 = [(UIStackView *)accessoryStackView _maps_leftRHDAnchor];
        v17 = [v4 mapInsetsLayoutGuide];
        v18 = [v17 _maps_rightRHDAnchor];
        LODWORD(v19) = 1148846080;
        v20 = [v16 _maps_constraintWithRHDAnchor:v18 relation:1 constant:8.0 priority:v19];
        v30 = v20;
        v21 = +[NSArray arrayWithObjects:&v30 count:1];
        [v4 setMapInsetsConstraints:v21 forOverlay:self];

        v22 = [(UIStackView *)self->_accessoryStackView _maps_leftRHDAnchor];
        v23 = [v4 viewportLayoutGuide];
        v24 = [v23 _maps_rightRHDAnchor];
        LODWORD(v25) = 1148846080;
        v26 = [v22 _maps_constraintWithRHDAnchor:v24 relation:1 constant:8.0 priority:v25];
        v29 = v26;
        v27 = +[NSArray arrayWithObjects:&v29 count:1];
        [v4 setViewportConstraints:v27 forOverlay:self];
      }
      else
      {
        v22 = sub_100BDFAD4();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
LABEL_9:

          goto LABEL_10;
        }
        v23 = [(CarAccessoriesOverlay *)self host];
        v24 = [v23 overlayContentView];
        v26 = [v24 sceneIdentifierForLogging];
        *(_DWORD *)buf = 134349314;
        v32 = self;
        __int16 v33 = 2112;
        v34 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[%{public}p] [%@] Failed to set up constraints for accessory stackView as it was nil at the time.", buf, 0x16u);
      }

      goto LABEL_9;
    }
    [(MapsLightLevelController *)self->_lightLevelController removeObserver:self];
    v28 = self->_lightLevelController;
    self->_lightLevelController = 0;

    [(CarAccessoriesOverlay *)self setContentView:0 layoutGuide:0];
  }
LABEL_10:
}

- (void)setContentView:(id)a3 layoutGuide:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIStackView *)self->_accessoryStackView superview];
  if (v8 != v6)
  {
    [(UIStackView *)self->_accessoryStackView removeFromSuperview];
    accessoryStackView = self->_accessoryStackView;
    self->_accessoryStackView = 0;

    if (v6)
    {
      v10 = sub_100BDFAD4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [(CarAccessoriesOverlay *)self host];
        v12 = [v11 overlayContentView];
        v13 = [v12 sceneIdentifierForLogging];
        *(_DWORD *)buf = 134349314;
        v50 = self;
        __int16 v51 = 2112;
        v52 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will create new accessory container view", buf, 0x16u);
      }
      v14 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:&__NSArray0__struct];
      v15 = self->_accessoryStackView;
      self->_accessoryStackView = v14;

      [(UIStackView *)self->_accessoryStackView setAccessibilityIdentifier:@"CarAccessoryOverlayStackView"];
      [(UIStackView *)self->_accessoryStackView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIStackView *)self->_accessoryStackView setSpacing:8.0];
      [(UIStackView *)self->_accessoryStackView setAlpha:0.0];
      v16 = self->_accessoryStackView;
      v17 = [(UIStackView *)v16 heightAnchor];
      LODWORD(v18) = 1112014848;
      double v19 = [v17 constraintEqualToConstant:0.0 priority:v18];
      v48 = v19;
      v20 = +[NSArray arrayWithObjects:&v48 count:1];
      [(UIStackView *)v16 addConstraints:v20];

      LODWORD(v21) = 1148846080;
      [(UIStackView *)self->_accessoryStackView setContentCompressionResistancePriority:1 forAxis:v21];
      LODWORD(v22) = 1148846080;
      [(UIStackView *)self->_accessoryStackView setContentCompressionResistancePriority:0 forAxis:v22];
      LODWORD(v23) = 1148846080;
      [(UIStackView *)self->_accessoryStackView setContentHuggingPriority:1 forAxis:v23];
      LODWORD(v24) = 1148846080;
      [(UIStackView *)self->_accessoryStackView setContentHuggingPriority:0 forAxis:v24];
      [v6 addSubview:self->_accessoryStackView];
      double v25 = [(UIStackView *)self->_accessoryStackView _maps_leftRHDAnchor];
      v26 = [v7 _maps_leftRHDAnchor];
      LODWORD(v27) = 1148846080;
      [v25 _maps_constraintWithRHDAnchor:v26 relation:0 constant:8.0 priority:v27];
      v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      leadingConstraint = self->_leadingConstraint;
      self->_leadingConstraint = v28;

      v30 = [(UIStackView *)self->_accessoryStackView _maps_rightRHDAnchor];
      v31 = [v7 _maps_rightRHDAnchor];
      LODWORD(v32) = 1148846080;
      [v30 _maps_constraintWithRHDAnchor:v31 relation:0 constant:-8.0 priority:v32];
      __int16 v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      trailingConstraint = self->_trailingConstraint;
      self->_trailingConstraint = v33;

      v35 = [(UIStackView *)self->_accessoryStackView topAnchor];
      v36 = [v7 topAnchor];
      v37 = [v35 constraintEqualToAnchor:v36 constant:8.0];
      v38 = self->_leadingConstraint;
      v39 = self->_trailingConstraint;
      v47[0] = v37;
      v47[1] = v38;
      v47[2] = v39;
      v40 = +[NSArray arrayWithObjects:v47 count:3];
      +[NSLayoutConstraint activateConstraints:v40];

      [(CarAccessoriesOverlay *)self reloadAnimated:0];
    }
    else
    {
      speedSignView = self->_speedSignView;
      self->_speedSignView = 0;

      if (self->_speedSignObserver)
      {
        v42 = +[NSNotificationCenter defaultCenter];
        [v42 removeObserver:self->_speedSignObserver];

        speedSignObserver = self->_speedSignObserver;
        self->_speedSignObserver = 0;
      }
      headingIndicator = self->_headingIndicator;
      self->_headingIndicator = 0;

      if (self->_headingIndicatorObserver)
      {
        v45 = +[NSNotificationCenter defaultCenter];
        [v45 removeObserver:self->_headingIndicatorObserver];

        headingIndicatorObserver = self->_headingIndicatorObserver;
        self->_headingIndicatorObserver = 0;
      }
    }
  }
}

- (BOOL)_wantsHorizontalLayout
{
  if (self->_sceneType != 7) {
    return 0;
  }
  v2 = [(UIStackView *)self->_accessoryStackView window];
  BOOL v3 = [v2 _car_hybridInstrumentClusterAlignment] == 0;

  return v3;
}

- (BOOL)_shouldShowHeadingIndicator
{
  if ([(CarAccessoriesOverlay *)self headingIndicatorIgnoresUserSettings]
    || (BOOL v3 = [(CarAccessoriesOverlay *)self userPermitsHeadingIndicator]))
  {
    LOBYTE(v3) = [(CarAccessoriesOverlay *)self showHeadingIndicator];
  }
  return v3;
}

- (void)setShowSpeedSign:(BOOL)a3
{
  if (self->_showSpeedSign != a3)
  {
    BOOL v3 = a3;
    v5 = sub_100BDFAD4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(CarAccessoriesOverlay *)self host];
      id v7 = [v6 overlayContentView];
      id v8 = [v7 sceneIdentifierForLogging];
      BOOL showSpeedSign = self->_showSpeedSign;
      int v10 = 134349826;
      v11 = self;
      __int16 v12 = 2112;
      v13 = v8;
      __int16 v14 = 1024;
      BOOL v15 = showSpeedSign;
      __int16 v16 = 1024;
      BOOL v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] [%@] Updating showSpeedSign %d -> %d", (uint8_t *)&v10, 0x22u);
    }
    self->_BOOL showSpeedSign = v3;
  }
}

- (BOOL)_shouldShowSpeedSign
{
  if ([(CarAccessoriesOverlay *)self speedSignIgnoresUserSettings]
    || (BOOL v3 = [(CarAccessoriesOverlay *)self userPermitsSpeedSign]))
  {
    LOBYTE(v3) = [(CarAccessoriesOverlay *)self showSpeedSign];
  }
  return v3;
}

- (void)reloadAnimated:(BOOL)a3
{
  if (self->_accessoryStackView)
  {
    os_log_t log = +[NSMutableArray arrayWithCapacity:2];
    unsigned int v4 = [(CarAccessoriesOverlay *)self _shouldShowHeadingIndicator];
    headingIndicator = self->_headingIndicator;
    if (v4)
    {
      if (!headingIndicator)
      {
        id v6 = [[CarHeadingIndicatorView alloc] initWithCarSceneType:self->_sceneType];
        id v7 = self->_headingIndicator;
        self->_headingIndicator = v6;

        [(CarHeadingIndicatorView *)self->_headingIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
        headingIndicator = self->_headingIndicator;
      }
      [(CarHeadingIndicatorView *)headingIndicator setActive:1];
      if (!self->_headingIndicatorObserver)
      {
        objc_initWeak((id *)location, self);
        id v8 = +[NSNotificationCenter defaultCenter];
        v9 = self->_headingIndicator;
        int v10 = +[NSOperationQueue mainQueue];
        v105[0] = _NSConcreteStackBlock;
        v105[1] = 3221225472;
        v105[2] = sub_100BE14DC;
        v105[3] = &unk_1012F3B68;
        objc_copyWeak(&v106, (id *)location);
        v105[4] = self;
        v11 = [v8 addObserverForName:@"CarHeadingIndicatorViewDidChangeVisibility" object:v9 queue:v10 usingBlock:v105];
        headingIndicatorObserver = self->_headingIndicatorObserver;
        self->_headingIndicatorObserver = v11;

        objc_destroyWeak(&v106);
        objc_destroyWeak((id *)location);
      }
      if (![(CarHeadingIndicatorView *)self->_headingIndicator contentsHidden]) {
        [log addObject:self->_headingIndicator];
      }
    }
    else if (headingIndicator)
    {
      [(CarHeadingIndicatorView *)headingIndicator setActive:0];
      if (self->_headingIndicatorObserver)
      {
        __int16 v16 = +[NSNotificationCenter defaultCenter];
        [v16 removeObserver:self->_headingIndicatorObserver];

        BOOL v17 = self->_headingIndicatorObserver;
        self->_headingIndicatorObserver = 0;
      }
    }
    unsigned int v18 = [(CarAccessoriesOverlay *)self _shouldShowSpeedSign];
    double v19 = sub_100BDFAD4();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v20)
      {
        double v21 = [(CarAccessoriesOverlay *)self host];
        double v22 = [v21 overlayContentView];
        double v23 = [v22 sceneIdentifierForLogging];
        *(_DWORD *)location = 134349314;
        *(void *)&location[4] = self;
        __int16 v109 = 2112;
        v110 = v23;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] [%@] Eligible to show speed sign", location, 0x16u);
      }
      speedSignView = self->_speedSignView;
      if (!speedSignView)
      {
        double v25 = [[CarSpeedSignView alloc] initWithCarSceneType:self->_sceneType];
        v26 = self->_speedSignView;
        self->_speedSignView = v25;

        [(CarSpeedSignView *)self->_speedSignView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(CarSpeedSignView *)self->_speedSignView setDimmed:[(MapsLightLevelController *)self->_lightLevelController shouldUseNightMode] animated:0];
        speedSignView = self->_speedSignView;
      }
      [(CarSpeedSignView *)speedSignView setActive:1];
      if (!self->_speedSignObserver)
      {
        objc_initWeak((id *)location, self);
        double v27 = +[NSNotificationCenter defaultCenter];
        v28 = self->_speedSignView;
        v29 = +[NSOperationQueue mainQueue];
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_100BE1648;
        v103[3] = &unk_1012F3B68;
        objc_copyWeak(&v104, (id *)location);
        v103[4] = self;
        v30 = [v27 addObserverForName:@"CarSpeedSignViewDidChangeVisibility" object:v28 queue:v29 usingBlock:v103];
        speedSignObserver = self->_speedSignObserver;
        self->_speedSignObserver = v30;

        objc_destroyWeak(&v104);
        objc_destroyWeak((id *)location);
      }
      if (![(CarSpeedSignView *)self->_speedSignView contentsHidden]) {
        [log addObject:self->_speedSignView];
      }
    }
    else
    {
      if (v20)
      {
        double v32 = [(CarAccessoriesOverlay *)self host];
        __int16 v33 = [v32 overlayContentView];
        v34 = [v33 sceneIdentifierForLogging];
        if ([(CarAccessoriesOverlay *)self userPermitsSpeedSign]) {
          v35 = @"YES";
        }
        else {
          v35 = @"NO";
        }
        v36 = v35;
        if ([(CarAccessoriesOverlay *)self showSpeedSign]) {
          v37 = @"YES";
        }
        else {
          v37 = @"NO";
        }
        *(_DWORD *)location = 134349826;
        *(void *)&location[4] = self;
        __int16 v109 = 2112;
        v110 = v34;
        __int16 v111 = 2112;
        *(void *)v112 = v35;
        *(_WORD *)&v112[8] = 2112;
        *(void *)&v112[10] = v37;
        v38 = v37;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] [%@] Not eligible to show speed sign; userPermitsSpeedSign:(%@), showSpeedSign:(%@)",
          location,
          0x2Au);
      }
      [(CarSpeedSignView *)self->_speedSignView setActive:0];
      if (self->_speedSignObserver)
      {
        v39 = +[NSNotificationCenter defaultCenter];
        [v39 removeObserver:self->_speedSignObserver];

        v40 = self->_speedSignObserver;
        self->_speedSignObserver = 0;
      }
    }
    unsigned int v41 = [(CarAccessoriesOverlay *)self _wantsHorizontalLayout];
    p_accessoryStackView = &self->_accessoryStackView;
    if (v41) {
      uint64_t v43 = 1;
    }
    else {
      uint64_t v43 = 4;
    }
    if (v41) {
      uint64_t v44 = 3;
    }
    else {
      uint64_t v44 = 2;
    }
    [(UIStackView *)self->_accessoryStackView setAxis:v41 ^ 1];
    [(UIStackView *)*p_accessoryStackView setAlignment:v43];
    [(UIStackView *)*p_accessoryStackView setDistribution:v44];
    v45 = +[MapsExternalDevice sharedInstance];
    id v46 = [v45 rightHandDrive];

    if ([(UIStackView *)*p_accessoryStackView axis])
    {
      [(NSLayoutConstraint *)self->_leadingConstraint setActive:0];
      [(NSLayoutConstraint *)self->_trailingConstraint setActive:1];
    }
    else if ([log count] == (id)1)
    {
      if ([log containsObject:self->_speedSignView])
      {
        [(NSLayoutConstraint *)self->_leadingConstraint setActive:v46];
        [(NSLayoutConstraint *)self->_trailingConstraint setActive:v46 ^ 1];
      }
      else if ([log containsObject:self->_headingIndicator])
      {
        [(NSLayoutConstraint *)self->_leadingConstraint setActive:v46 ^ 1];
        [(NSLayoutConstraint *)self->_trailingConstraint setActive:v46];
      }
      else
      {
        v90 = sub_1005762E4();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)location = 136315650;
          *(void *)&location[4] = "-[CarAccessoriesOverlay reloadAnimated:]";
          __int16 v109 = 2080;
          v110 = "CarAccessoriesOverlay.m";
          __int16 v111 = 1024;
          *(_DWORD *)v112 = 264;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", location, 0x1Cu);
        }

        if (sub_100BB36BC())
        {
          v91 = sub_1005762E4();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          {
            v92 = +[NSThread callStackSymbols];
            *(_DWORD *)location = 138412290;
            *(void *)&location[4] = v92;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
          }
        }
      }
    }
    else
    {
      [(NSLayoutConstraint *)self->_leadingConstraint setActive:1];
      [(NSLayoutConstraint *)self->_trailingConstraint setActive:1];
    }
    if (![(CarAccessoriesOverlay *)self ignoresCollisionConstraints])
    {
      v47 = [(UIStackView *)self->_accessoryStackView window];
      v48 = [v47 screen];
      BOOL v49 = v48 == 0;

      if (v49)
      {
        v98 = sub_1005762E4();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)location = 136315906;
          *(void *)&location[4] = "-[CarAccessoriesOverlay reloadAnimated:]";
          __int16 v109 = 2080;
          v110 = "CarAccessoriesOverlay.m";
          __int16 v111 = 1024;
          *(_DWORD *)v112 = 276;
          *(_WORD *)&v112[4] = 2080;
          *(void *)&v112[6] = "_accessoryStackView.window.screen != nil";
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", location, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v99 = sub_1005762E4();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
          {
            v100 = +[NSThread callStackSymbols];
            *(_DWORD *)location = 138412290;
            *(void *)&location[4] = v100;
            _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);
          }
        }
      }
      v50 = [(UIStackView *)self->_accessoryStackView window];
      if (objc_msgSend(v50, "_car_isHybridInstrumentCluster"))
      {
        __int16 v51 = [(UIStackView *)self->_accessoryStackView window];
        BOOL v52 = [v51 _car_hybridInstrumentClusterAlignment] == 2;
      }
      else
      {
        BOOL v52 = 0;
      }

      v53 = +[MapsExternalDevice sharedInstance];
      if ([v53 rightHandDrive] | v52) {
        uint64_t v54 = 2;
      }
      else {
        uint64_t v54 = 8;
      }

      v55 = [(CarAccessoriesOverlay *)self host];
      v101 = [v55 collisionGuideForEdge:v54];

      v56 = [(CarAccessoriesOverlay *)self host];
      v57 = [v56 collisionGuideForEdge:1];

      v58 = [(CarAccessoriesOverlay *)self host];
      v59 = [(UIStackView *)self->_accessoryStackView bottomAnchor];
      v60 = [v101 topAnchor];
      v61 = [v59 constraintLessThanOrEqualToAnchor:v60];
      v107[0] = v61;
      v62 = [(UIStackView *)self->_accessoryStackView _maps_leftRHDAnchor];
      v63 = [v57 _maps_rightRHDAnchor];
      LODWORD(v64) = 1148846080;
      v65 = [v62 _maps_constraintWithRHDAnchor:v63 relation:1 constant:0.0 priority:v64];
      v107[1] = v65;
      v66 = +[NSArray arrayWithObjects:v107 count:2];
      [v58 setCollisionConstraints:v66 forOverlay:self];
    }
    v67 = [(UIStackView *)self->_accessoryStackView arrangedSubviews];
    unsigned int v68 = [v67 isEqualToArray:log];

    if (v68)
    {
      v69 = sub_100BDFAD4();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        v70 = [(CarAccessoriesOverlay *)self host];
        v71 = [v70 overlayContentView];
        v72 = [v71 sceneIdentifierForLogging];
        v73 = log;
        v74 = v73;
        if (v73)
        {
          if ([v73 count])
          {
            v75 = [v74 componentsJoinedByString:@", "];
            v76 = +[NSString stringWithFormat:@"<%p> [%@]", v74, v75];
          }
          else
          {
            v76 = +[NSString stringWithFormat:@"<%p> (empty)", v74];
          }
        }
        else
        {
          v76 = @"<nil>";
        }

        *(_DWORD *)location = 134349570;
        *(void *)&location[4] = self;
        __int16 v109 = 2112;
        v110 = v72;
        __int16 v111 = 2112;
        *(void *)v112 = v76;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will not reload accessories, nothing has changed: %@", location, 0x20u);
      }
    }
    else
    {
      id v77 = [log count];
      v78 = sub_100BDFAD4();
      BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG);
      if (v77)
      {
        if (v79)
        {
          v80 = [(CarAccessoriesOverlay *)self host];
          v81 = [v80 overlayContentView];
          v82 = [v81 sceneIdentifierForLogging];
          id v83 = [(UIStackView *)self->_accessoryStackView arrangedSubviews];
          v84 = v83;
          if (v83)
          {
            if ([v83 count])
            {
              v85 = [v84 componentsJoinedByString:@", "];
              v86 = +[NSString stringWithFormat:@"<%p> [%@]", v84, v85];
            }
            else
            {
              v86 = +[NSString stringWithFormat:@"<%p> (empty)", v84];
            }
          }
          else
          {
            v86 = @"<nil>";
          }

          v93 = v86;
          v94 = log;
          v95 = v94;
          if (v94)
          {
            if ([v94 count])
            {
              v96 = [v95 componentsJoinedByString:@", "];
              v97 = +[NSString stringWithFormat:@"<%p> [%@]", v95, v96];
            }
            else
            {
              v97 = +[NSString stringWithFormat:@"<%p> (empty)", v95];
            }
          }
          else
          {
            v97 = @"<nil>";
          }

          *(_DWORD *)location = 134349826;
          *(void *)&location[4] = self;
          __int16 v109 = 2112;
          v110 = v82;
          __int16 v111 = 2112;
          *(void *)v112 = v93;
          *(_WORD *)&v112[8] = 2112;
          *(void *)&v112[10] = v97;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will update accessories (%@ => %@)", location, 0x2Au);
        }
        [(UIStackView *)self->_accessoryStackView _maps_setArrangedSubviews:log];
        v69 = [(CarAccessoriesOverlay *)self host];
        [v69 setCollisionConstraintsEnabled:[(CarAccessoriesOverlay *)self isHidden] ^ 1 forOverlay:self];
      }
      else
      {
        if (v79)
        {
          v87 = [(CarAccessoriesOverlay *)self host];
          v88 = [v87 overlayContentView];
          v89 = [v88 sceneIdentifierForLogging];
          *(_DWORD *)location = 134349314;
          *(void *)&location[4] = self;
          __int16 v109 = 2112;
          v110 = v89;
          _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will remove all accessories", location, 0x16u);
        }
        [(UIStackView *)self->_accessoryStackView _maps_setArrangedSubviews:0];
        v69 = [(CarAccessoriesOverlay *)self host];
        [v69 setCollisionConstraintsEnabled:0 forOverlay:self];
      }
    }
  }
  else
  {
    sub_100BDFAD4();
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v13 = [(CarAccessoriesOverlay *)self host];
      __int16 v14 = [v13 overlayContentView];
      BOOL v15 = [v14 sceneIdentifierForLogging];
      *(_DWORD *)location = 134349314;
      *(void *)&location[4] = self;
      __int16 v109 = 2112;
      v110 = v15;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "[%{public}p] [%@] Will not reload accessories, overlay not active", location, 0x16u);
    }
  }
}

- (BOOL)isHidden
{
  [(UIStackView *)self->_accessoryStackView alpha];
  return v2 == 0.0;
}

- (void)setHidden:(BOOL)a3
{
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (!self->_accessoryStackView) {
    return;
  }
  BOOL v4 = a3;
  if (!a4) {
    goto LABEL_12;
  }
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    id v6 = sub_100BDFAD4();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_11:

LABEL_12:
      int v13 = 0;
      goto LABEL_14;
    }
    id v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      int v10 = [(CarAccessoriesOverlay *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        __int16 v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_10;
      }
    }
    __int16 v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_10:

    *(_DWORD *)buf = 138543362;
    double v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Reduce motion enabled, running accessory view update without animation", buf, 0xCu);

    goto LABEL_11;
  }
  int v13 = 1;
LABEL_14:
  [(UIStackView *)self->_accessoryStackView alpha];
  if (v14 != (double)!v4)
  {
    BOOL v15 = sub_100BDFAD4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __int16 v16 = [(CarAccessoriesOverlay *)self host];
      BOOL v17 = [v16 overlayContentView];
      unsigned int v18 = [v17 sceneIdentifierForLogging];
      CFStringRef v19 = @"show";
      if (v4) {
        CFStringRef v19 = @"hide";
      }
      CFStringRef v27 = v19;
      id v20 = [(UIStackView *)self->_accessoryStackView arrangedSubviews];
      double v21 = v20;
      if (v20)
      {
        if ([v20 count])
        {
          [v21 componentsJoinedByString:@", "];
          double v22 = v26 = v16;
          double v23 = +[NSString stringWithFormat:@"<%p> [%@]", v21, v22];

          __int16 v16 = v26;
        }
        else
        {
          double v23 = +[NSString stringWithFormat:@"<%p> (empty)", v21];
        }
      }
      else
      {
        double v23 = @"<nil>";
      }

      *(_DWORD *)buf = 134349826;
      double v32 = self;
      __int16 v33 = 2112;
      v34 = v18;
      __int16 v35 = 2112;
      CFStringRef v36 = v27;
      __int16 v37 = 2112;
      v38 = v23;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] Will %@ accessory view using alpha (accessories:%@)", buf, 0x2Au);
    }
    double v24 = 0.0;
    if (v13)
    {
      unsigned int v25 = +[UIView _maps_shouldAdoptImplicitAnimationParameters];
      double v24 = 0.1;
      if (v25) {
        double v24 = 0.0;
      }
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100BE1B98;
    v28[3] = &unk_10131ACB8;
    v28[4] = self;
    float v29 = (float)!v4;
    BOOL v30 = v4;
    +[UIView animateWithDuration:4 delay:v28 options:0 animations:v24 completion:0.0];
  }
}

- (void)lightLevelController:(id)a3 didUpdateLightLevel:(int64_t)a4
{
  id v5 = [a3 shouldUseNightMode];
  [(CarSpeedSignView *)self->_speedSignView setDimmed:v5 animated:1];
  id v6 = sub_100BDFAD4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [(CarAccessoriesOverlay *)self host];
    id v8 = [v7 overlayContentView];
    v9 = [v8 sceneIdentifierForLogging];
    int v10 = @"NO";
    if (v5) {
      int v10 = @"YES";
    }
    v11 = v10;
    int v12 = 134349570;
    int v13 = self;
    __int16 v14 = 2112;
    BOOL v15 = v9;
    __int16 v16 = 2112;
    BOOL v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] [%@] carAccessories lightLevelController:didUpdateLightLevel shuldUseNightMode: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  int BOOL = GEOConfigGetBOOL();
  int v5 = GEOConfigGetBOOL();
  if (self->_userPermitsHeadingIndicator == BOOL)
  {
    if (self->_userPermitsSpeedSign == v5) {
      return;
    }
    goto LABEL_9;
  }
  self->_userPermitsHeadingIndicator = BOOL;
  if (self->_userPermitsSpeedSign != v5)
  {
LABEL_9:
    self->_userPermitsSpeedSign = v5;
    if (self->_speedSignIgnoresUserSettings) {
      return;
    }
    goto LABEL_6;
  }
  if (self->_headingIndicatorIgnoresUserSettings) {
    return;
  }
LABEL_6:

  [(CarAccessoriesOverlay *)self reloadAnimated:1];
}

- (ChromeOverlayHosting)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (ChromeOverlayHosting *)WeakRetained;
}

- (BOOL)showHeadingIndicator
{
  return self->_showHeadingIndicator;
}

- (void)setShowHeadingIndicator:(BOOL)a3
{
  self->_showHeadingIndicator = a3;
}

- (BOOL)showSpeedSign
{
  return self->_showSpeedSign;
}

- (BOOL)headingIndicatorIgnoresUserSettings
{
  return self->_headingIndicatorIgnoresUserSettings;
}

- (void)setHeadingIndicatorIgnoresUserSettings:(BOOL)a3
{
  self->_headingIndicatorIgnoresUserSettings = a3;
}

- (BOOL)speedSignIgnoresUserSettings
{
  return self->_speedSignIgnoresUserSettings;
}

- (void)setSpeedSignIgnoresUserSettings:(BOOL)a3
{
  self->_speedSignIgnoresUserSettings = a3;
}

- (BOOL)ignoresCollisionConstraints
{
  return self->_ignoresCollisionConstraints;
}

- (void)setIgnoresCollisionConstraints:(BOOL)a3
{
  self->_ignoresCollisionConstraints = a3;
}

- (BOOL)userPermitsHeadingIndicator
{
  return self->_userPermitsHeadingIndicator;
}

- (void)setUserPermitsHeadingIndicator:(BOOL)a3
{
  self->_userPermitsHeadingIndicator = a3;
}

- (BOOL)userPermitsSpeedSign
{
  return self->_userPermitsSpeedSign;
}

- (void)setUserPermitsSpeedSign:(BOOL)a3
{
  self->_userPermitsSpeedSign = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_speedSignObserver, 0);
  objc_storeStrong((id *)&self->_speedSignView, 0);
  objc_storeStrong((id *)&self->_headingIndicatorObserver, 0);
  objc_storeStrong((id *)&self->_headingIndicator, 0);
  objc_storeStrong((id *)&self->_accessoryStackView, 0);

  objc_storeStrong((id *)&self->_lightLevelController, 0);
}

@end