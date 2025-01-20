@interface MapsBannerViewController
- (BNBannerSource)target;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldExpandForGuidanceState:(id)a3;
- (BOOL)_useSignificantUpdateSPI;
- (BOOL)preventsInteractiveDismissal;
- (BannerView)alternateBannerView;
- (BannerView)bannerView;
- (GCDTimer)alternateBannerActiveTimer;
- (GCDTimer)apertureExpansionTimer;
- (GCDTimer)timeoutTimer;
- (MapsBannerViewController)initWithRequestId:(id)a3 target:(id)a4 bannerView:(id)a5 delegate:(id)a6 aperturePresentation:(BOOL)a7;
- (MapsBannerViewControllerDelegate)delegate;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)description;
- (NSString)elementIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBUISystemApertureAccessoryView)detachedMinimalView;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (UITapGestureRecognizer)knobSelectRecognizer;
- (double)approximateWidth;
- (double)displayWidth;
- (id)_contentView;
- (id)accessibilityIdentifier;
- (id)systemApertureElementViewController;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)_dismissBannerWithReason:(id)a3;
- (void)_handleBackGesture:(id)a3;
- (void)_handleSwipeGesture:(id)a3;
- (void)_handleTapOnContent:(id)a3;
- (void)_openMaps;
- (void)_performViewWillAppear;
- (void)_requestAlertingAssertionIfNecessary;
- (void)_revertToPrimaryBannerView;
- (void)_revertToPrimaryBannerViewAfterDelay;
- (void)_sceneDidActivate:(id)a3;
- (void)_setApertureExpansionTimeout;
- (void)_setTimeout;
- (void)_updateShowsControls;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)dealloc;
- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (void)loadView;
- (void)postTemporaryAlternateBannerView:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAlternateBannerActiveTimer:(id)a3;
- (void)setApertureExpansionTimer:(id)a3;
- (void)setKnobSelectRecognizer:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)updateFromGuidanceState:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation MapsBannerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MapsBannerViewController)initWithRequestId:(id)a3 target:(id)a4 bannerView:(id)a5 delegate:(id)a6 aperturePresentation:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v36.receiver = self;
  v36.super_class = (Class)MapsBannerViewController;
  v16 = [(MapsBannerViewController *)&v36 initWithNibName:0 bundle:0];
  if (v16)
  {
    if ([v13 destination] == (id)1) {
      +[NSString stringWithFormat:@"CarPlay-%@", v12];
    }
    else {
    uint64_t v17 = +[NSString stringWithFormat:@"iOS-%@", v12];
    }
    requestIdentifier = v16->_requestIdentifier;
    v16->_requestIdentifier = (NSString *)v17;

    objc_storeWeak((id *)&v16->_target, v13);
    p_bannerView = (id *)&v16->_bannerView;
    objc_storeStrong((id *)&v16->_bannerView, a5);
    objc_storeWeak((id *)&v16->_delegate, v15);
    v16->_cachedDisplayWidth = -1.0;
    v16->_aperturePresentation = v7;
    v20 = [(MapsBannerViewController *)v16 view];
    v21 = [v20 widthAnchor];
    uint64_t v22 = [v21 constraintEqualToConstant:0.0];
    widthConstraint = v16->_widthConstraint;
    v16->_widthConstraint = (NSLayoutConstraint *)v22;

    [(MapsBannerViewController *)v16 approximateWidth];
    double v25 = v24;
    -[BannerView sizeThatFits:](v16->_bannerView, "sizeThatFits:");
    [(MapsBannerViewController *)v16 setPreferredContentSize:v25];
    v16->_waitingForDisplay = 1;
    if (v7)
    {
      v16->_waitingForDisplay = 0;
      v26 = [(MapsBannerViewController *)v16 view];
      [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    }
    id v27 = *p_bannerView;
    id v28 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v16 action:"_handleTapOnContent:"];
    [v27 addGestureRecognizer:v28];

    id v29 = [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:v16 action:"_handleSwipeGesture:"];
    [v29 setAllowedTouchTypes:&off_1013AE2B0];
    [v29 setDirection:4];
    [*p_bannerView addGestureRecognizer:v29];
    id v30 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v16 action:"_handleBackGesture:"];
    [v30 setAllowedPressTypes:&off_1013AE2C8];
    [*p_bannerView addGestureRecognizer:v30];
    if ([v13 destination] == (id)1)
    {
      v31 = +[NSNotificationCenter defaultCenter];
      [v31 addObserver:v16 selector:"_sceneDidActivate:" name:UISceneDidActivateNotification object:0];
    }
    v32 = +[GEOPlatform sharedPlatform];
    unsigned int v33 = [v32 isInternalInstall];

    if (v33)
    {
      v34 = +[MapsRadarController sharedInstance];
      [v34 addAttachmentProvider:v16];
    }
  }

  return v16;
}

- (void)dealloc
{
  v3 = +[GEOPlatform sharedPlatform];
  unsigned int v4 = [v3 isInternalInstall];

  if (v4)
  {
    v5 = +[MapsRadarController sharedInstance];
    [v5 removeAttachmentProvider:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)MapsBannerViewController;
  [(MapsBannerViewController *)&v6 dealloc];
}

- (void)loadView
{
  if (self->_aperturePresentation)
  {
    id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  }
  else
  {
    unsigned int v4 = [(MapsBannerViewController *)self target];
    id v5 = [v4 destination];

    objc_super v6 = &PLPlatterViewStyleNavigationBanner;
    if (v5 == (id)1) {
      objc_super v6 = &PLPlatterViewStyleCarPlayBanner;
    }
    id v3 = +[PLPlatterView platterViewWithStyle:*v6];
  }
  id v7 = v3;
  [(MapsBannerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)MapsBannerViewController;
  [(MapsBannerViewController *)&v21 viewDidLoad];
  id v3 = [(MapsBannerViewController *)self _contentView];
  [v3 setAccessibilityIdentifier:@"MapsBannerViewContent"];
  [(BannerView *)self->_bannerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_bannerView];
  v20 = [(BannerView *)self->_bannerView leadingAnchor];
  v19 = [v3 leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v22[0] = v18;
  uint64_t v17 = [(BannerView *)self->_bannerView trailingAnchor];
  v16 = [v3 trailingAnchor];
  id v15 = [v17 constraintEqualToAnchor:v16];
  v22[1] = v15;
  id v14 = [(BannerView *)self->_bannerView topAnchor];
  id v13 = [v3 topAnchor];
  unsigned int v4 = [v14 constraintEqualToAnchor:v13];
  v22[2] = v4;
  id v5 = [(BannerView *)self->_bannerView bottomAnchor];
  objc_super v6 = [v3 bottomAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v22[3] = v7;
  v8 = [(BannerView *)self->_bannerView widthAnchor];
  v9 = [v3 widthAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  v22[4] = v10;
  v11 = +[NSArray arrayWithObjects:v22 count:5];
  bannerConstraints = self->_bannerConstraints;
  self->_bannerConstraints = v11;

  if (!self->_aperturePresentation) {
    +[NSLayoutConstraint activateConstraints:self->_bannerConstraints];
  }
}

- (id)_contentView
{
  id v3 = [(MapsBannerViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v5 = [(MapsBannerViewController *)self view];
  objc_super v6 = v5;
  if (isKindOfClass)
  {
    id v7 = [v5 customContentView];
  }
  else
  {
    [v5 setAccessibilityIdentifier:@"MapsBannerView"];

    id v7 = [(MapsBannerViewController *)self view];
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsBannerViewController;
  [(MapsBannerViewController *)&v4 viewWillAppear:a3];
  [(MapsBannerViewController *)self _performViewWillAppear];
}

- (void)_sceneDidActivate:(id)a3
{
  objc_super v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 _persistenceIdentifier];

  v8 = [(MapsBannerViewController *)self requestIdentifier];
  unsigned int v9 = [v7 containsString:v8];

  if (v9)
  {
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 removeObserver:self name:UISceneDidActivateNotification object:0];

    [(MapsBannerViewController *)self _performViewWillAppear];
  }
}

- (void)_performViewWillAppear
{
  if (!self->_didViewWillAppear)
  {
    id v3 = sub_1000AD30C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_super v4 = NSStringFromCGSize(self->_deferredContentSize);
      int v10 = 134218242;
      v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "_performViewWillAppear %p, setting preferredContentSize %{public}@", (uint8_t *)&v10, 0x16u);
    }
    self->_didViewWillAppear = 1;
    self->_waitingForDisplay = 0;
    -[MapsBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:", self->_deferredContentSize.width, self->_deferredContentSize.height);
    id v5 = [(MapsBannerViewController *)self view];
    id v6 = [v5 window];
    id v7 = [(MapsBannerViewController *)self knobSelectRecognizer];
    [v6 addGestureRecognizer:v7];

    v8 = [(MapsBannerViewController *)self bannerView];
    id v9 = [v8 bannerType];

    if (v9 == (id)2) {
      AudioServicesPlaySystemSoundWithCompletion(0x55Au, 0);
    }
  }
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009353E4;
  v3[3] = &unk_1012E81F8;
  v3[4] = self;
  [a3 animateAlongsideTransition:v3 completion:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MapsBannerViewController;
  [(MapsBannerViewController *)&v7 viewWillDisappear:a3];
  objc_super v4 = [(MapsBannerViewController *)self knobSelectRecognizer];
  id v5 = [v4 view];
  id v6 = [(MapsBannerViewController *)self knobSelectRecognizer];
  [v5 removeGestureRecognizer:v6];
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)MapsBannerViewController;
  id v3 = [(MapsBannerViewController *)&v7 description];
  objc_super v4 = [(MapsBannerViewController *)self requestIdentifier];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

- (double)displayWidth
{
  double cachedDisplayWidth = self->_cachedDisplayWidth;
  if (cachedDisplayWidth == -1.0)
  {
    p_target = &self->_target;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
    id v13 = 0;
    id v6 = [WeakRetained layoutDescriptionWithError:&v13];
    id v7 = v13;

    if (v6)
    {
      [v6 presentationSize];
      double cachedDisplayWidth = v8;
      self->_double cachedDisplayWidth = v8;
    }
    else
    {
      id v9 = sub_1000AD30C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = objc_loadWeakRetained((id *)p_target);
        *(_DWORD *)buf = 138412546;
        id v15 = v10;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to determine layout for target: %@ error: %@", buf, 0x16u);
      }
      [(MapsBannerViewController *)self approximateWidth];
      double cachedDisplayWidth = v11;
    }
  }
  return cachedDisplayWidth;
}

- (double)approximateWidth
{
  v2 = [(MapsBannerViewController *)self target];
  id v3 = [v2 destination];

  if (v3 == (id)1)
  {
    objc_super v4 = +[CarDisplayController sharedInstance];
    id v5 = [v4 screen];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[UIScreen mainScreen];
    }
    double v8 = v7;
  }
  else
  {
    double v8 = +[UIScreen mainScreen];
  }
  [v8 bounds];
  double Width = CGRectGetWidth(v11);

  return Width;
}

- (void)updateFromGuidanceState:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsBannerViewController *)self alternateBannerView];
  id v6 = [v5 item];
  [v6 updateFromGuidanceState:v4];

  id v7 = [(MapsBannerViewController *)self alternateBannerView];
  [v7 updateFromBannerItem];

  [(MapsBannerViewController *)self displayWidth];
  double v9 = v8;
  id v10 = [(MapsBannerViewController *)self bannerView];
  [v10 sizeThatFits:v9, 400.0];
  double v12 = v11;

  -[MapsBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v12);
  id v13 = [(MapsBannerViewController *)self bannerView];
  id v14 = [v13 item];
  id v15 = [v14 guidanceState];
  __int16 v16 = [(MapsBannerViewController *)self bannerView];
  unsigned int v17 = [v15 shouldExpandForSpokenEventFromGuidanceUpdate:v4 forType:[v16 bannerType]];

  v18 = [(MapsBannerViewController *)self bannerView];
  v19 = [v18 item];
  v20 = [v19 guidanceState];
  objc_super v21 = [(MapsBannerViewController *)self bannerView];
  id v22 = [v21 bannerType];
  v23 = [(MapsBannerViewController *)self target];
  unsigned int v24 = [v20 shouldPresentNextGuidanceUpdate:v4 forType:v22 target:v23];

  int64_t v25 = [(MapsBannerViewController *)self activeLayoutMode];
  v26 = [(MapsBannerViewController *)self systemApertureElementContext];
  id v27 = [v26 transitionContext];

  unsigned int v28 = [(MapsBannerViewController *)self _useSignificantUpdateSPI] & v24;
  if (v25 == 4) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = v28;
  }
  id v30 = sub_1000AD30C();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = [v4 guidanceState];
    uint64_t v45 = v29;
    if ((unint64_t)v31 >= 5)
    {
      v32 = +[NSString stringWithFormat:@"?? - %lu", v31];
    }
    else
    {
      v32 = *(&off_101302970 + (void)v31);
    }
    id v33 = v32;
    id v34 = [v4 maneuver];
    v35 = @"NO_TURN";
    switch((int)v34)
    {
      case 0:
        break;
      case 1:
        v35 = @"LEFT_TURN";
        break;
      case 2:
        v35 = @"RIGHT_TURN";
        break;
      case 3:
        v35 = @"STRAIGHT_AHEAD";
        break;
      case 4:
        v35 = @"U_TURN";
        break;
      case 5:
        v35 = @"FOLLOW_ROAD";
        break;
      case 6:
        v35 = @"ENTER_ROUNDABOUT";
        break;
      case 7:
        v35 = @"EXIT_ROUNDABOUT";
        break;
      case 11:
        v35 = @"OFF_RAMP";
        break;
      case 12:
        v35 = @"ON_RAMP";
        break;
      case 16:
        v35 = @"ARRIVE_END_OF_NAVIGATION";
        break;
      case 17:
        v35 = @"START_ROUTE";
        break;
      case 18:
        v35 = @"ARRIVE_AT_DESTINATION";
        break;
      case 20:
        v35 = @"KEEP_LEFT";
        break;
      case 21:
        v35 = @"KEEP_RIGHT";
        break;
      case 22:
        v35 = @"ENTER_FERRY";
        break;
      case 23:
        v35 = @"EXIT_FERRY";
        break;
      case 24:
        v35 = @"CHANGE_FERRY";
        break;
      case 25:
        v35 = @"START_ROUTE_WITH_U_TURN";
        break;
      case 26:
        v35 = @"U_TURN_AT_ROUNDABOUT";
        break;
      case 27:
        v35 = @"LEFT_TURN_AT_END";
        break;
      case 28:
        v35 = @"RIGHT_TURN_AT_END";
        break;
      case 29:
        v35 = @"HIGHWAY_OFF_RAMP_LEFT";
        break;
      case 30:
        v35 = @"HIGHWAY_OFF_RAMP_RIGHT";
        break;
      case 33:
        v35 = @"ARRIVE_AT_DESTINATION_LEFT";
        break;
      case 34:
        v35 = @"ARRIVE_AT_DESTINATION_RIGHT";
        break;
      case 35:
        v35 = @"U_TURN_WHEN_POSSIBLE";
        break;
      case 39:
        v35 = @"ARRIVE_END_OF_DIRECTIONS";
        break;
      case 41:
        v35 = @"ROUNDABOUT_EXIT_1";
        break;
      case 42:
        v35 = @"ROUNDABOUT_EXIT_2";
        break;
      case 43:
        v35 = @"ROUNDABOUT_EXIT_3";
        break;
      case 44:
        v35 = @"ROUNDABOUT_EXIT_4";
        break;
      case 45:
        v35 = @"ROUNDABOUT_EXIT_5";
        break;
      case 46:
        v35 = @"ROUNDABOUT_EXIT_6";
        break;
      case 47:
        v35 = @"ROUNDABOUT_EXIT_7";
        break;
      case 48:
        v35 = @"ROUNDABOUT_EXIT_8";
        break;
      case 49:
        v35 = @"ROUNDABOUT_EXIT_9";
        break;
      case 50:
        v35 = @"ROUNDABOUT_EXIT_10";
        break;
      case 51:
        v35 = @"ROUNDABOUT_EXIT_11";
        break;
      case 52:
        v35 = @"ROUNDABOUT_EXIT_12";
        break;
      case 53:
        v35 = @"ROUNDABOUT_EXIT_13";
        break;
      case 54:
        v35 = @"ROUNDABOUT_EXIT_14";
        break;
      case 55:
        v35 = @"ROUNDABOUT_EXIT_15";
        break;
      case 56:
        v35 = @"ROUNDABOUT_EXIT_16";
        break;
      case 57:
        v35 = @"ROUNDABOUT_EXIT_17";
        break;
      case 58:
        v35 = @"ROUNDABOUT_EXIT_18";
        break;
      case 59:
        v35 = @"ROUNDABOUT_EXIT_19";
        break;
      case 60:
        v35 = @"SHARP_LEFT_TURN";
        break;
      case 61:
        v35 = @"SHARP_RIGHT_TURN";
        break;
      case 62:
        v35 = @"SLIGHT_LEFT_TURN";
        break;
      case 63:
        v35 = @"SLIGHT_RIGHT_TURN";
        break;
      case 64:
        v35 = @"CHANGE_HIGHWAY";
        break;
      case 65:
        v35 = @"CHANGE_HIGHWAY_LEFT";
        break;
      case 66:
        v35 = @"CHANGE_HIGHWAY_RIGHT";
        break;
      case 80:
        v35 = @"TOLL_STATION";
        break;
      case 81:
        v35 = @"ENTER_TUNNEL";
        break;
      case 82:
        v35 = @"WAYPOINT_STOP";
        break;
      case 83:
        v35 = @"WAYPOINT_STOP_LEFT";
        break;
      case 84:
        v35 = @"WAYPOINT_STOP_RIGHT";
        break;
      case 85:
        v35 = @"RESUME_ROUTE";
        break;
      case 86:
        v35 = @"RESUME_ROUTE_WITH_U_TURN";
        break;
      case 87:
        v35 = @"CUSTOM";
        break;
      case 88:
        v35 = @"TURN_AROUND";
        break;
      default:
        v35 = +[NSString stringWithFormat:@"(unknown: %i)", v34];
        break;
    }
    *(_DWORD *)buf = 138413314;
    id v48 = v33;
    __int16 v49 = 2112;
    v50 = v35;
    __int16 v51 = 1024;
    BOOL v52 = v25 == 4;
    __int16 v53 = 1024;
    BOOL v54 = v27 == 0;
    __int16 v55 = 1024;
    unsigned int v56 = v28;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[Persistent Banners] state:%@, maneuver:%@, isExpanded: %d, notAlreadyAnimating: %d, isSignificantUpdate: %d", buf, 0x28u);

    uint64_t v29 = v45;
  }

  objc_super v36 = [(MapsBannerViewController *)self bannerView];
  v37 = [v36 item];
  [v37 updateFromGuidanceState:v4];

  if (v25 != 4 || v27)
  {
    v39 = [(MapsBannerViewController *)self bannerView];
    [v39 updateFromBannerItem];
  }
  else
  {
    v38 = [(MapsBannerViewController *)self systemApertureElementContext];
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1009361BC;
    v46[3] = &unk_1012E5D08;
    v46[4] = self;
    [v38 setElementNeedsLayoutUpdateWithOptions:v29 coordinatedAnimations:v46];
  }
  int v40 = v17 | v24;
  v41 = [(MapsBannerViewController *)self target];
  id v42 = [v41 destination];

  if (v40 == 1 && v42 != (id)1)
  {
    if (self->_aperturePresentation
      && [(MapsBannerViewController *)self _shouldExpandForGuidanceState:v4])
    {
      v43 = sub_1000AD30C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v44 = [(MapsBannerViewController *)self systemApertureElementContext];
        *(_DWORD *)buf = 138412290;
        id v48 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[Persistent Banners] Will expand on update %@", buf, 0xCu);
      }
      [(MapsBannerViewController *)self _requestAlertingAssertionIfNecessary];
    }
    [(MapsBannerViewController *)self _setTimeout];
  }
}

- (BOOL)_shouldExpandForGuidanceState:(id)a3
{
  id v3 = a3;
  id v4 = +[CarDisplayController sharedInstance];
  unsigned __int8 v5 = [v4 isCurrentlyConnectedToAnyCarScene];

  if (v5)
  {
    BOOL v6 = 0;
    goto LABEL_21;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = +[UIApplication sharedApplication];
  double v8 = [v7 connectedScenes];

  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v9)
  {
LABEL_14:

LABEL_17:
    unsigned int v17 = [v3 lastSceneDeactivationTime];

    if (v17)
    {
      v18 = [v3 lastSceneDeactivationTime];
      [v18 timeIntervalSinceNow];
      double v20 = v19;
      GEOConfigGetDouble();
      BOOL v6 = v20 < -v21;

      id v14 = 0;
    }
    else
    {
      id v14 = 0;
      BOOL v6 = 1;
    }
    goto LABEL_20;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v24;
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v24 != v11) {
      objc_enumerationMutation(v8);
    }
    id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    id v14 = v13;
    if (![v14 activationState])
    {
      id v15 = [v14 delegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
    }

LABEL_12:
    if (v10 == (id)++v12)
    {
      id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_14;
    }
  }

  if (!v14) {
    goto LABEL_17;
  }
  BOOL v6 = 0;
LABEL_20:

LABEL_21:
  return v6;
}

- (void)postTemporaryAlternateBannerView:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MapsBannerViewController *)self alternateBannerActiveTimer];

  if (!v5)
  {
    BOOL v6 = [v4 item];
    id v7 = [v6 guidanceState];
    unsigned int v8 = [(MapsBannerViewController *)self _shouldExpandForGuidanceState:v7];

    if (v8)
    {
      id v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      id v15 = sub_10093663C;
      __int16 v16 = &unk_1012E5D58;
      unsigned int v17 = self;
      id v18 = v4;
      id v9 = objc_retainBlock(&v13);
      if ([(MapsBannerViewController *)self _useSignificantUpdateSPI]&& [(SBUISystemApertureAutomaticallyInvalidatable *)self->_alertingAssertion isValid])
      {
        id v10 = [(MapsBannerViewController *)self systemApertureElementContext];
        [v10 setElementNeedsLayoutUpdateWithOptions:1 coordinatedAnimations:v9];
      }
      else
      {
        ((void (*)(void ***))v9[2])(v9);
      }
      uint64_t v11 = sub_1000AD30C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        alternateBannerView = self->_alternateBannerView;
        *(_DWORD *)buf = 138412290;
        double v20 = alternateBannerView;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Persistent Banners] Will expand for alerting view %@", buf, 0xCu);
      }

      [(MapsBannerViewController *)self _requestAlertingAssertionIfNecessary];
      [(MapsBannerViewController *)self _revertToPrimaryBannerViewAfterDelay];
      if ([self->_alternateBannerView bannerType] == (id)2) {
        AudioServicesPlaySystemSoundWithCompletion(0x55Au, 0);
      }
    }
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  self->_deferredContentSize = a3;
  BOOL waitingForDisplay = self->_waitingForDisplay;
  id v7 = sub_1000AD30C();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (waitingForDisplay)
  {
    if (v8)
    {
      v16.double width = width;
      v16.double height = height;
      id v9 = NSStringFromCGSize(v16);
      *(_DWORD *)buf = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Deferring update to size %@ for %@", buf, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      v17.double width = width;
      v17.double height = height;
      id v10 = NSStringFromCGSize(v17);
      *(_DWORD *)buf = 138412546;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting banner size to %@ for %@", buf, 0x16u);
    }
    v11.receiver = self;
    v11.super_class = (Class)MapsBannerViewController;
    -[MapsBannerViewController setPreferredContentSize:](&v11, "setPreferredContentSize:", width, height);
  }
}

- (UITapGestureRecognizer)knobSelectRecognizer
{
  knobSelectRecognizer = self->_knobSelectRecognizer;
  if (!knobSelectRecognizer)
  {
    id v4 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTapOnContent:"];
    unsigned __int8 v5 = self->_knobSelectRecognizer;
    self->_knobSelectRecognizer = v4;

    [(UITapGestureRecognizer *)self->_knobSelectRecognizer setAllowedPressTypes:&off_1013AE2E0];
    knobSelectRecognizer = self->_knobSelectRecognizer;
  }

  return knobSelectRecognizer;
}

- (void)_setTimeout
{
  objc_initWeak(&location, self);
  if (!self->_aperturePresentation)
  {
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned __int8 v4 = [v3 BOOLForKey:@"__internal_MapsDebugForceStickyBanners"];

    if ((v4 & 1) == 0)
    {
      unsigned __int8 v5 = [(MapsBannerViewController *)self bannerView];
      BOOL v6 = [v5 item];
      id v7 = [v6 guidanceState];
      if ([v7 isSticky])
      {
        BOOL v8 = [(MapsBannerViewController *)self target];
        BOOL v9 = [v8 destination] == (id)1;

        if (!v9) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      id v10 = sub_1000AD30C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_super v11 = [(MapsBannerViewController *)self requestIdentifier];
        *(_DWORD *)buf = 138412290;
        double v21 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Setting timer to dismiss banner: %@", buf, 0xCu);
      }
      id v12 = &_dispatch_main_q;
      __int16 v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472;
      CGSize v16 = sub_100936D8C;
      CGSize v17 = &unk_1012E7638;
      objc_copyWeak(&v18, &location);
      id v13 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v14 block:10.0];
      -[MapsBannerViewController setTimeoutTimer:](self, "setTimeoutTimer:", v13, v14, v15, v16, v17);

      objc_destroyWeak(&v18);
    }
  }
LABEL_10:
  objc_destroyWeak(&location);
}

- (void)_setApertureExpansionTimeout
{
  objc_initWeak(&location, self);
  id v3 = &_dispatch_main_q;
  unsigned __int8 v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_100936EDC;
  BOOL v8 = &unk_1012E7638;
  objc_copyWeak(&v9, &location);
  unsigned __int8 v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v5 block:7.0];
  -[MapsBannerViewController setApertureExpansionTimer:](self, "setApertureExpansionTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)_useSignificantUpdateSPI
{
  if (qword_101610068 != -1) {
    dispatch_once(&qword_101610068, &stru_101302908);
  }
  return byte_1015EDFD0;
}

- (void)_revertToPrimaryBannerViewAfterDelay
{
  objc_initWeak(&location, self);
  if (self->_aperturePresentation)
  {
    id v3 = &_dispatch_main_q;
    unsigned __int8 v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_100937148;
    BOOL v8 = &unk_1012E7638;
    objc_copyWeak(&v9, &location);
    unsigned __int8 v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:&v5 block:10.0];
    -[MapsBannerViewController setAlternateBannerActiveTimer:](self, "setAlternateBannerActiveTimer:", v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

- (void)_revertToPrimaryBannerView
{
  id v3 = sub_1000AD30C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Persistent Banners] removing alerting expansion reason", buf, 2u);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009372EC;
  v6[3] = &unk_1012E5D08;
  v6[4] = self;
  unsigned __int8 v4 = objc_retainBlock(v6);
  if ([(MapsBannerViewController *)self _useSignificantUpdateSPI]
    && [(SBUISystemApertureAutomaticallyInvalidatable *)self->_alertingAssertion isValid])
  {
    unsigned __int8 v5 = [(MapsBannerViewController *)self systemApertureElementContext];
    [v5 setElementNeedsLayoutUpdateWithOptions:1 coordinatedAnimations:v4];
  }
  else
  {
    ((void (*)(void *))v4[2])(v4);
  }
}

- (void)_dismissBannerWithReason:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000AD30C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(MapsBannerViewController *)self requestIdentifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Revoking banner: %@ with reason: %@", buf, 0x16u);
  }
  id v7 = [(MapsBannerViewController *)self target];
  BOOL v8 = [(MapsBannerViewController *)self requestIdentifier];
  id v13 = 0;
  id v9 = [v7 revokePresentableWithRequestIdentifier:v8 reason:v4 animated:1 userInfo:&__NSDictionary0__struct error:&v13];
  id v10 = v13;

  if (!v9)
  {
    objc_super v11 = sub_1000AD30C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(MapsBannerViewController *)self requestIdentifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to revoke banner %@; error: %@",
        buf,
        0x16u);
    }
  }
  [(MapsBannerViewController *)self setTimeoutTimer:0];
}

- (NSString)requesterIdentifier
{
  return (NSString *)MapsAppBundleId;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000AD30C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[MapsBannerViewController presentableWillAppearAsBanner:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  bannerView = self->_bannerView;
  uint64_t v7 = [(MapsBannerViewController *)self view];
  [(id)v7 frame];
  -[BannerView sizeThatFits:](bannerView, "sizeThatFits:", v8, 400.0);
  -[MapsBannerViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  id v9 = [(MapsBannerViewController *)self delegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v10 = [(MapsBannerViewController *)self delegate];
    [v10 presentableWillAppearAsBanner:self];
  }
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000AD30C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[MapsBannerViewController presentableDidAppearAsBanner:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v6 = [(MapsBannerViewController *)self bannerView];
  id v7 = [v6 bannerType];

  if (v7 == (id)2) {
    +[GEOAPPortal captureUserAction:9002 target:38 value:0];
  }
  [(MapsBannerViewController *)self _setTimeout];
  double v8 = [(MapsBannerViewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MapsBannerViewController *)self delegate];
    [v10 presentableDidAppearAsBanner:self];
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = sub_1000AD30C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    __int16 v13 = "-[MapsBannerViewController presentableWillDisappearAsBanner:withReason:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v12, 0x20u);
  }

  [(MapsBannerViewController *)self setTimeoutTimer:0];
  char v9 = [(MapsBannerViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int v11 = [(MapsBannerViewController *)self delegate];
    [v11 presentableWillDisappearAsBanner:self withReason:v7];
  }
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = sub_1000AD30C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    __int16 v14 = "-[MapsBannerViewController presentableDidDisappearAsBanner:withReason:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v13, 0x20u);
  }

  char v9 = [(MapsBannerViewController *)self bannerView];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (([v7 isEqualToString:@"BNBannerRevocationReasonDragDismissal"] & 1) != 0
     || [v7 isEqualToString:@"DismissInteraction"]))
  {
    [v9 wasDismissedByUser];
  }
  char v10 = [(MapsBannerViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int v12 = [(MapsBannerViewController *)self delegate];
    [v12 presentableDidDisappearAsBanner:self withReason:v7];
  }
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = sub_1000AD30C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    int v13 = "-[MapsBannerViewController presentableWillNotAppearAsBanner:withReason:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@ %@", (uint8_t *)&v12, 0x20u);
  }

  char v9 = [(MapsBannerViewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    char v11 = [(MapsBannerViewController *)self delegate];
    [v11 presentableDidDisappearAsBanner:self withReason:v7];
  }
}

- (void)_requestAlertingAssertionIfNecessary
{
  uint64_t v3 = [(MapsBannerViewController *)self activeLayoutMode];
  unsigned __int8 v4 = [(SBUISystemApertureAutomaticallyInvalidatable *)self->_alertingAssertion isValid];
  if (v3 < 4)
  {
LABEL_6:
    unsigned int v9 = [(SBUISystemApertureAutomaticallyInvalidatable *)self->_alertingAssertion isValid];
    char v10 = sub_1000AD30C();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Persistent Banners] Resetting alerting assertion invalidation timer", buf, 2u);
      }

      [(MapsBannerViewController *)self _setApertureExpansionTimeout];
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[Persistent Banners] Taking alerting assertion", buf, 2u);
      }

      int v12 = [(MapsBannerViewController *)self systemApertureElementContext];
      int v13 = [v12 requestAlertingAssertion];
      alertingAssertion = self->_alertingAssertion;
      self->_alertingAssertion = v13;

      [(SBUISystemApertureAutomaticallyInvalidatable *)self->_alertingAssertion setAutomaticallyInvalidatable:0];
      [(MapsBannerViewController *)self _setApertureExpansionTimeout];
      objc_initWeak((id *)buf, self);
      id v15 = self->_alertingAssertion;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100937F48;
      v17[3] = &unk_101302930;
      v17[4] = self;
      objc_copyWeak(&v18, (id *)buf);
      [(SBUISystemApertureAutomaticallyInvalidatable *)v15 addInvalidationBlock:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
    return;
  }
  unsigned __int8 v5 = v4;
  id v6 = sub_1000AD30C();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      double v8 = sub_100937EE0(v3);
      *(_DWORD *)buf = 138412290;
      double v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Persistent Banners] Already expanded (%@); will use alerting assertion anyway.",
        buf,
        0xCu);
    }
    goto LABEL_6;
  }
  if (v7)
  {
    __int16 v16 = sub_100937EE0(v3);
    *(_DWORD *)buf = 138412290;
    double v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Persistent Banners] User expanded (%@); will not use alerting assertion.",
      buf,
      0xCu);
  }
}

- (void)_updateShowsControls
{
  uint64_t v3 = [(MapsBannerViewController *)self bannerView];
  unsigned __int8 v4 = [(id)v3 item];
  unsigned __int8 v5 = [v4 guidanceState];

  unsigned int v6 = [v5 isInArrivalState];
  LODWORD(v3) = [v5 isInParkingState];
  id v31 = (char *)[v5 currentLegIndex];
  v32 = (char *)[v5 numberOfLegs];
  int v34 = v3;
  int v7 = v6 | v3;
  if (self->_didShowControlsForArrival && (v7 & 1) == 0)
  {
    double v8 = [(MapsBannerViewController *)self systemApertureElementContext];
    [v8 requestTransitionToPreferredLayoutMode];
  }
  self->_didShowControlsForArrival = v7;
  uint64_t v9 = [(MapsBannerViewController *)self activeLayoutMode];
  unsigned int v10 = [(SBUISystemApertureAutomaticallyInvalidatable *)self->_alertingAssertion isValid];
  if (v9 > 3) {
    int v11 = v10 ^ 1;
  }
  else {
    int v11 = 0;
  }
  int v12 = [(MapsBannerViewController *)self bannerView];
  unsigned int v13 = [v12 showsControls];

  uint64_t v14 = v7 | v11;
  if ((v7 | v11) != v13)
  {
    id v15 = sub_1000AD30C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v14) {
        __int16 v16 = @"YES";
      }
      else {
        __int16 v16 = @"NO";
      }
      id v30 = v16;
      if (v6) {
        id v17 = @"YES";
      }
      else {
        id v17 = @"NO";
      }
      uint64_t v29 = v17;
      if (v34) {
        id v18 = @"YES";
      }
      else {
        id v18 = @"NO";
      }
      v35 = v18;
      if (v31 + 1 >= v32) {
        double v19 = @"YES";
      }
      else {
        double v19 = @"NO";
      }
      id v33 = v19;
      if (v7) {
        double v20 = @"YES";
      }
      else {
        double v20 = @"NO";
      }
      unsigned int v28 = v20;
      if (v9 <= 3) {
        double v21 = @"NO";
      }
      else {
        double v21 = @"YES";
      }
      id v27 = v21;
      if (v10) {
        id v22 = @"NO";
      }
      else {
        id v22 = @"YES";
      }
      long long v23 = v22;
      if (v11) {
        long long v24 = @"YES";
      }
      else {
        long long v24 = @"NO";
      }
      uint64_t v14 = v14;
      long long v25 = v24;
      *(_DWORD *)buf = 138545154;
      v37 = v30;
      __int16 v38 = 2114;
      v39 = v29;
      __int16 v40 = 2114;
      v41 = v35;
      __int16 v42 = 2114;
      v43 = v33;
      __int16 v44 = 2114;
      uint64_t v45 = v28;
      __int16 v46 = 2114;
      v47 = v27;
      __int16 v48 = 2114;
      __int16 v49 = v23;
      __int16 v50 = 2114;
      __int16 v51 = v25;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[Persistent Banners] Setting showsControls = %{public}@ (isArrived:%{public}@, isParked: %{public}@, currentLegIsLast:%{public}@, shouldShowControlsForArrival:%{public}@, isExpanded:%{public}@, userExpanded:%{public}@, shouldShowControlsForUserExpansion:%{public}@)", buf, 0x52u);
    }
  }
  long long v26 = [(MapsBannerViewController *)self bannerView];
  [v26 setShowsControls:v14];
}

- (id)systemApertureElementViewController
{
  uint64_t v3 = sub_1000AD30C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned __int8 v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[Persistent Banners] Returning self from systemApertureElementViewController", v5, 2u);
  }

  return self;
}

- (int64_t)contentRole
{
  return 2;
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (int64_t)preferredLayoutMode
{
  return 3;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(BannerView *)self->_bannerView leadingView];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(BannerView *)self->_bannerView trailingView];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(BannerView *)self->_bannerView minimalView];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(BannerView *)self->_bannerView detachedMinimalView];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (SBUISystemApertureAccessoryView *)v3;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return +[NSSet setWithObject:STBackgroundActivityIdentifierNavigation];
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  unsigned __int8 v5 = sub_1000AD30C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v6 = sub_100937EE0(self->_activeLayoutMode);
    int v7 = sub_100937EE0(a3);
    int v13 = 138412546;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[Persistent Banners] Active Layout Mode %@ -> %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v8 = 12;
  if (!self->_alternateBannerView) {
    uint64_t v8 = 8;
  }
  uint64_t v9 = [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___MapsBannerViewController__requestIdentifier[v8]) arrayByAddingObject:self->_widthConstraint];
  int64_t activeLayoutMode = self->_activeLayoutMode;
  if (a3 > 3 || activeLayoutMode == a3)
  {
    if (a3 == 4 && activeLayoutMode != 4)
    {
      int v11 = [(MapsBannerViewController *)self view];
      int v12 = [v11 window];
      [v12 frame];
      [(NSLayoutConstraint *)self->_widthConstraint setConstant:CGRectGetWidth(v17)];

      +[NSLayoutConstraint activateConstraints:v9];
    }
  }
  else
  {
    +[NSLayoutConstraint deactivateConstraints:v9];
  }
  self->_int64_t activeLayoutMode = a3;
}

- (NSString)elementIdentifier
{
  return (NSString *)SBUISystemApertureElementIdentifierTurnByTurn;
}

- (UIColor)keyColor
{
  return +[MapsTheme apertureKeyColor];
}

- (void)_openMaps
{
  uint64_t v3 = sub_1000AD30C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v4 = [(MapsBannerViewController *)self requestIdentifier];
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Pressed banner: %@", buf, 0xCu);
  }
  unsigned __int8 v5 = objc_opt_new();
  unsigned int v6 = [(MapsBannerViewController *)self view];
  int v7 = [v6 window];
  uint64_t v8 = [v7 windowScene];
  uint64_t v9 = [v8 _currentOpenApplicationEndpoint];
  [v5 setTargetConnectionEndpoint:v9];

  unsigned int v10 = +[LSApplicationWorkspace defaultWorkspace];
  [v10 openApplicationWithBundleIdentifier:@"com.apple.Maps" configuration:v5 completionHandler:&stru_101302950];

  int v11 = [(MapsBannerViewController *)self target];
  id v16 = 0;
  int v12 = [v11 revokeAllPresentablesWithReason:@"Entering Maps" userInfo:&__NSDictionary0__struct error:&v16];
  id v13 = v16;

  if (!v12)
  {
    uint64_t v14 = sub_1000AD30C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = [(MapsBannerViewController *)self requestIdentifier];
      *(_DWORD *)buf = 138412546;
      id v18 = v15;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to revoke banner %@; error: %@",
        buf,
        0x16u);
    }
  }
}

- (void)_handleTapOnContent:(id)a3
{
  unsigned __int8 v4 = [(MapsBannerViewController *)self bannerView];
  id v5 = [v4 bannerType];

  if (v5 == (id)2) {
    +[GEOAPPortal captureUserAction:9003 target:38 value:0];
  }

  [(MapsBannerViewController *)self _openMaps];
}

- (void)_handleSwipeGesture:(id)a3
{
  if ([a3 direction] == (id)4)
  {
    [(MapsBannerViewController *)self _dismissBannerWithReason:@"DismissInteraction"];
  }
}

- (void)_handleBackGesture:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(MapsBannerViewController *)self _dismissBannerWithReason:@"DismissInteraction"];
  }
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == (id)7 && (char *)objc_msgSend(v4, "subtype") - 200 <= (char *)2)
  {
    [(MapsBannerViewController *)self _dismissBannerWithReason:@"DismissInteraction"];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MapsBannerViewController;
    [(MapsBannerViewController *)&v5 _wheelChangedWithEvent:v4];
  }
}

- (void)generateAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  if (!v7)
  {
    long long v26 = sub_1005762E4();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      int v34 = (MapsBannerViewController *)"-[MapsBannerViewController generateAttachmentsForRadarDraft:withCompletion:]";
      __int16 v35 = 2080;
      objc_super v36 = "MapsBannerViewController.m";
      __int16 v37 = 1024;
      int v38 = 815;
      __int16 v39 = 2080;
      __int16 v40 = "completion != nil";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      id v27 = sub_1005762E4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        unsigned int v28 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        int v34 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      double v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        long long v23 = dispatch_queue_get_label(0);
        *(_DWORD *)buf = 136316418;
        int v34 = (MapsBannerViewController *)"-[MapsBannerViewController generateAttachmentsForRadarDraft:withCompletion:]";
        __int16 v35 = 2080;
        objc_super v36 = "MapsBannerViewController.m";
        __int16 v37 = 1024;
        int v38 = 816;
        __int16 v39 = 2080;
        __int16 v40 = "dispatch_get_main_queue()";
        __int16 v41 = 2080;
        __int16 v42 = v22;
        __int16 v43 = 2080;
        __int16 v44 = v23;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        long long v24 = sub_1005762E4();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          long long v25 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          int v34 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  int v11 = [(MapsBannerViewController *)self viewIfLoaded];

  if (v11)
  {
    int v12 = [(MapsBannerViewController *)self view];
    id v13 = [v12 window];
    uint64_t v14 = [v13 windowScene];

    if (v14)
    {
      __int16 v15 = [(MapsBannerViewController *)self view];
      id v16 = [v15 window];
      CGRect v17 = [v16 windowScene];
      id v18 = [v17 activationState];

      if (!v18)
      {
        objc_initWeak((id *)buf, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1009390E0;
        block[3] = &unk_1012E96B8;
        objc_copyWeak(&v32, (id *)buf);
        id v30 = v6;
        id v31 = v7;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

        objc_destroyWeak(&v32);
        objc_destroyWeak((id *)buf);
        goto LABEL_19;
      }
      __int16 v19 = sub_1000AD30C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        int v34 = self;
        id v20 = "[%{public}p] Activation state is not foreground active; not generating radar attachments";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v20, buf, 0xCu);
      }
    }
    else
    {
      __int16 v19 = sub_1000AD30C();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        int v34 = self;
        id v20 = "[%{public}p] No window scene; not generating radar attachments";
        goto LABEL_17;
      }
    }
  }
  else
  {
    __int16 v19 = sub_1000AD30C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      int v34 = self;
      id v20 = "[%{public}p] View is not loaded yet; not generating radar attachments";
      goto LABEL_17;
    }
  }

  v7[2](v7);
LABEL_19:
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (BannerView)bannerView
{
  return self->_bannerView;
}

- (BannerView)alternateBannerView
{
  return self->_alternateBannerView;
}

- (BNBannerSource)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (BNBannerSource *)WeakRetained;
}

- (MapsBannerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsBannerViewControllerDelegate *)WeakRetained;
}

- (GCDTimer)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
}

- (GCDTimer)apertureExpansionTimer
{
  return self->_apertureExpansionTimer;
}

- (void)setApertureExpansionTimer:(id)a3
{
}

- (GCDTimer)alternateBannerActiveTimer
{
  return self->_alternateBannerActiveTimer;
}

- (void)setAlternateBannerActiveTimer:(id)a3
{
}

- (void)setKnobSelectRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobSelectRecognizer, 0);
  objc_storeStrong((id *)&self->_alternateBannerActiveTimer, 0);
  objc_storeStrong((id *)&self->_apertureExpansionTimer, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_alternateBannerView, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_alternateBannerConstraints, 0);
  objc_storeStrong((id *)&self->_bannerConstraints, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);

  objc_storeStrong((id *)&self->_alertingAssertion, 0);
}

@end