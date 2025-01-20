@interface WeatherStackViewController
- (AirQualityConditionsViewController)airQualityConditionsViewController;
- (BOOL)_canShowWhileLocked;
- (BOOL)_viewShown;
- (BOOL)airQualityShown;
- (BOOL)overlayHidden;
- (BOOL)weatherShown;
- (CLLocation)location;
- (NSString)blurGroupName;
- (OS_dispatch_source)updateVisibilityTimer;
- (UIStackView)stackView;
- (UIView)contentView;
- (UIVisualEffectView)blurView;
- (WeatherConditionsViewController)weatherConditionsViewController;
- (WeatherStackViewController)initWithWeatherLocationDataProvider:(id)a3 delegate:(id)a4;
- (WeatherStackViewControllerDelegate)delegate;
- (double)_viewAlpha;
- (double)overlayAlpha;
- (id)_airQualityConditionsPunchOutURL;
- (id)_weatherPunchOutURL;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (int64_t)animationCount;
- (void)_configureSubviews;
- (void)_configureWeatherOrbSupport;
- (void)_openAirQualityConditionsPunchOutURL;
- (void)_openWeatherPunchOutURL;
- (void)_requestVisibilityUpdateAnimated:(BOOL)a3;
- (void)_setCornerRadiusWithMaskedCorners:(unint64_t)a3 withValue:(double)a4;
- (void)_updateVisibilityAnimated:(BOOL)a3;
- (void)airQualityConditionsViewController:(id)a3 makeVisible:(BOOL)a4 animated:(BOOL)a5;
- (void)applyBorderAndShadow;
- (void)clearSavedLocation;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)loadView;
- (void)setAirQualityConditionsViewController:(id)a3;
- (void)setAirQualityShown:(BOOL)a3;
- (void)setAnimationCount:(int64_t)a3;
- (void)setBlurGroupName:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setLocation:(id)a3;
- (void)setOverlayAlpha:(double)a3;
- (void)setOverlayHidden:(BOOL)a3;
- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setStackView:(id)a3;
- (void)setUpdateVisibilityTimer:(id)a3;
- (void)setWeatherConditionsViewController:(id)a3;
- (void)setWeatherShown:(BOOL)a3;
- (void)viewDidLoad;
- (void)weatherConditionsViewController:(id)a3 makeVisible:(BOOL)a4 animated:(BOOL)a5;
- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4;
@end

@implementation WeatherStackViewController

- (void)_configureWeatherOrbSupport
{
  v3 = (UIContextMenuInteraction *)[objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  contextMenuInteraction = self->_contextMenuInteraction;
  self->_contextMenuInteraction = v3;

  id v5 = [(WeatherStackViewController *)self view];
  [v5 addInteraction:self->_contextMenuInteraction];
}

- (void)weatherConditionsViewController:(id)a3 makeVisible:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (self->_weatherShown != v6)
  {
    v10 = sub_10000B290();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = NSStringFromSelector(a2);
      v14 = @"NO";
      if (v6) {
        v14 = @"YES";
      }
      v15 = v14;
      int v16 = 138412802;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v13;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ %@, visible = %@", (uint8_t *)&v16, 0x20u);
    }
    self->_weatherShown = v6;
    if (![(WeatherStackViewController *)self overlayHidden]) {
      [(WeatherStackViewController *)self _requestVisibilityUpdateAnimated:v5];
    }
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)WeatherStackViewController;
  [(WeatherStackViewController *)&v3 viewDidLoad];
  [(WeatherStackViewController *)self _configureSubviews];
  [(WeatherStackViewController *)self _configureWeatherOrbSupport];
  [(WeatherStackViewController *)self _updateVisibilityAnimated:0];
}

- (void)airQualityConditionsViewController:(id)a3 makeVisible:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (self->_airQualityShown != v6)
  {
    v10 = sub_10000B290();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = NSStringFromSelector(a2);
      v14 = @"NO";
      if (v6) {
        v14 = @"YES";
      }
      v15 = v14;
      int v16 = 138412802;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v13;
      __int16 v20 = 2112;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ %@, visible = %@", (uint8_t *)&v16, 0x20u);
    }
    self->_airQualityShown = v6;
    if (![(WeatherStackViewController *)self overlayHidden]) {
      [(WeatherStackViewController *)self _requestVisibilityUpdateAnimated:v5];
    }
  }
}

- (void)_setCornerRadiusWithMaskedCorners:(unint64_t)a3 withValue:(double)a4
{
  p_blurView = &self->_blurView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blurView);
  v8 = [WeakRetained subviews];
  id v9 = objc_loadWeakRetained((id *)p_blurView);
  v10 = [v9 contentView];

  if (a4 == 0.0)
  {
    [WeakRetained _setCornerRadius:0.0];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v20 = v8;
    id v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v26 + 1) + 8 * i) layer:v26];
          [v25 setMaskedCorners:0];
        }
        id v22 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v22);
    }
  }
  else
  {
    [WeakRetained _setCornerRadius:a4];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          int v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
          v17 = [v16 layer];
          __int16 v18 = v17;
          if (v16 == v10) {
            unint64_t v19 = 0;
          }
          else {
            unint64_t v19 = a3;
          }
          [v17 setMaskedCorners:v19];
          [v18 setCornerRadius:a4];
        }
        id v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v13);
    }
  }
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(WeatherStackViewController *)self setView:v3];

  v4 = [(WeatherStackViewController *)self view];
  [v4 setHidden:1];

  BOOL v5 = [(WeatherStackViewController *)self view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v6 = [(WeatherStackViewController *)self view];
  [v6 setAccessibilityIdentifier:@"WeatherStackView"];

  id v10 = +[MapsTheme visualEffectViewAllowingBlur:1];
  [v10 setAccessibilityIdentifier:@"WeatherStackBlurView"];
  v7 = [v10 contentView];
  contentView = self->_contentView;
  self->_contentView = v7;

  [(UIView *)self->_contentView setAccessibilityIdentifier:@"WeatherStackContent"];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [(WeatherStackViewController *)self view];
  [v9 addSubview:v10];

  [(WeatherStackViewController *)self setBlurView:v10];
  [(WeatherStackViewController *)self applyBorderAndShadow];
}

- (void)_updateVisibilityAnimated:(BOOL)a3
{
  BOOL v37 = a3;
  BOOL v5 = [(WeatherStackViewController *)self view];
  BOOL v6 = [(WeatherStackViewController *)self airQualityConditionsViewController];
  v7 = [v6 view];

  v8 = [(WeatherStackViewController *)self weatherConditionsViewController];
  v35 = [v8 view];

  BOOL airQualityShown = self->_airQualityShown;
  BOOL weatherShown = self->_weatherShown;
  unsigned int v36 = [(WeatherStackViewController *)self _viewShown];
  id v11 = sub_10000B290();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v12);
    NSStringFromSelector(a2);
    uint64_t v13 = v33 = v7;
    if (v37) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    v15 = v14;
    if (v36) {
      int v16 = @"NO";
    }
    else {
      int v16 = @"YES";
    }
    v17 = v16;
    if (weatherShown) {
      __int16 v18 = @"NO";
    }
    else {
      __int16 v18 = @"YES";
    }
    unint64_t v19 = v18;
    if (airQualityShown) {
      id v20 = @"NO";
    }
    else {
      id v20 = @"YES";
    }
    id v21 = (void *)v13;
    id v22 = v17;
    uint64_t v23 = v20;
    *(_DWORD *)buf = 138413570;
    v57 = v34;
    __int16 v58 = 2112;
    v59 = v21;
    __int16 v60 = 2112;
    v61 = v15;
    __int16 v62 = 2112;
    v63 = v22;
    __int16 v64 = 2112;
    v65 = v19;
    __int16 v66 = 2112;
    v67 = v23;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ %@, animated = %@, overall view hidden = %@, weather hidden = %@, AQI hidden = %@", buf, 0x3Eu);

    v7 = v33;
  }

  v24 = objc_alloc_init(GroupAnimation);
  [(GroupAnimation *)v24 setAnimated:v37];
  +[GroupAnimation defaultAnimationDuration];
  -[GroupAnimation setDuration:](v24, "setDuration:");
  [(GroupAnimation *)v24 setOptions:4];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10010837C;
  v49[3] = &unk_1012F4908;
  v49[4] = self;
  BOOL v53 = airQualityShown;
  id v25 = v7;
  id v50 = v25;
  BOOL v54 = weatherShown;
  id v26 = v35;
  id v51 = v26;
  char v55 = v36;
  id v27 = v5;
  id v52 = v27;
  [(GroupAnimation *)v24 addPreparation:v49];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100014A58;
  v43[3] = &unk_1012F4930;
  id v28 = v25;
  id v44 = v28;
  BOOL v47 = airQualityShown;
  id v29 = v26;
  BOOL v48 = weatherShown;
  id v45 = v29;
  v46 = self;
  [(GroupAnimation *)v24 addAnimations:v43];
  objc_initWeak((id *)buf, self);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10001D000;
  v38[3] = &unk_1012F4958;
  objc_copyWeak(&v42, (id *)buf);
  id v30 = v28;
  id v39 = v30;
  id v31 = v29;
  id v40 = v31;
  id v32 = v27;
  id v41 = v32;
  [(GroupAnimation *)v24 addCompletion:v38];
  [(GroupAnimation *)v24 runWithCurrentOptions];

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)buf);
}

- (void)applyBorderAndShadow
{
  id v3 = [(WeatherStackViewController *)self traitCollection];
  [v3 userInterfaceStyle];

  id v22 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
  id v4 = [v22 CGColor];
  BOOL v5 = [(WeatherStackViewController *)self blurView];
  BOOL v6 = [v5 layer];
  [v6 setBorderColor:v4];

  v7 = [(WeatherStackViewController *)self blurView];
  v8 = [v7 layer];
  [v8 setCornerRadius:8.0];

  id v9 = [(WeatherStackViewController *)self blurView];
  id v10 = [v9 layer];
  [v10 setBorderWidth:0.5];

  id v11 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
  id v12 = [v11 CGColor];
  uint64_t v13 = [(WeatherStackViewController *)self blurView];
  uint64_t v14 = [v13 layer];
  [v14 setShadowColor:v12];

  v15 = [(WeatherStackViewController *)self blurView];
  int v16 = [v15 layer];
  [v16 setShadowRadius:4.0];

  v17 = [(WeatherStackViewController *)self blurView];
  __int16 v18 = [v17 layer];
  LODWORD(v19) = 1025758986;
  [v18 setShadowOpacity:v19];

  id v20 = [(WeatherStackViewController *)self blurView];
  id v21 = [v20 layer];
  [v21 setShadowPathIsBounds:1];
}

- (void)_configureSubviews
{
  [(WeatherStackViewController *)self _setCornerRadiusWithMaskedCorners:15 withValue:8.0];
  id v3 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setAxis:1];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAccessibilityIdentifier:@"ContentStackView"];
  [(UIView *)self->_contentView addSubview:v3];
  [(WeatherStackViewController *)self setStackView:v3];
  id v4 = [(WeatherStackViewController *)self weatherConditionsViewController];
  BOOL v5 = [v4 view];
  [v3 addArrangedSubview:v5];

  BOOL v6 = [(WeatherStackViewController *)self airQualityConditionsViewController];
  v7 = [v6 view];
  [v3 addArrangedSubview:v7];

  if (sub_1000BBB44(self) == 5) {
    double v8 = 5.0;
  }
  else {
    double v8 = 4.0;
  }
  v46 = +[NSMutableArray array];
  id v45 = [(WeatherStackViewController *)self blurView];
  v43 = [v45 leadingAnchor];
  id v44 = [(WeatherStackViewController *)self view];
  id v42 = [v44 leadingAnchor];
  id v41 = [v43 constraintEqualToAnchor:v42];
  v47[0] = v41;
  id v40 = [(WeatherStackViewController *)self blurView];
  v38 = [v40 trailingAnchor];
  id v39 = [(WeatherStackViewController *)self view];
  BOOL v37 = [v39 trailingAnchor];
  unsigned int v36 = [v38 constraintEqualToAnchor:v37];
  v47[1] = v36;
  v35 = [(WeatherStackViewController *)self blurView];
  long long v33 = [v35 topAnchor];
  v34 = [(WeatherStackViewController *)self view];
  id v32 = [v34 topAnchor];
  id v31 = [v33 constraintEqualToAnchor:v32];
  v47[2] = v31;
  id v30 = [(WeatherStackViewController *)self blurView];
  id v28 = [v30 bottomAnchor];
  id v29 = [(WeatherStackViewController *)self view];
  id v27 = [v29 bottomAnchor];
  id v26 = [v28 constraintEqualToAnchor:v27];
  v47[3] = v26;
  v24 = [v3 leadingAnchor];
  id v25 = [(WeatherStackViewController *)self blurView];
  uint64_t v23 = [v25 leadingAnchor];
  id v22 = [v24 constraintEqualToAnchor:v23 constant:v8];
  v47[4] = v22;
  id v20 = [v3 trailingAnchor];
  id v21 = [(WeatherStackViewController *)self blurView];
  double v19 = [v21 trailingAnchor];
  __int16 v18 = [v20 constraintEqualToAnchor:v19 constant:-v8];
  v47[5] = v18;
  id v9 = [v3 topAnchor];
  id v10 = [(WeatherStackViewController *)self blurView];
  id v11 = [v10 topAnchor];
  id v12 = [v9 constraintEqualToAnchor:v11 constant:5.0];
  v47[6] = v12;
  uint64_t v13 = [v3 bottomAnchor];
  uint64_t v14 = [(WeatherStackViewController *)self blurView];
  v15 = [v14 bottomAnchor];
  int v16 = [v13 constraintEqualToAnchor:v15 constant:-5.0];
  v47[7] = v16;
  v17 = +[NSArray arrayWithObjects:v47 count:8];
  [v46 addObjectsFromArray:v17];

  +[NSLayoutConstraint activateConstraints:v46];
}

- (UIVisualEffectView)blurView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blurView);

  return (UIVisualEffectView *)WeakRetained;
}

- (WeatherStackViewController)initWithWeatherLocationDataProvider:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WeatherStackViewController;
  double v8 = [(WeatherStackViewController *)&v14 initWithNibName:0 bundle:0];
  if (v8)
  {
    [v6 addObserver:v8];
    id v9 = [[WeatherConditionsViewController alloc] initWithWeatherLocationDataProvider:v6];
    weatherConditionsViewController = v8->_weatherConditionsViewController;
    v8->_weatherConditionsViewController = v9;

    [(WeatherConditionsViewController *)v8->_weatherConditionsViewController setDelegate:v8];
    [(WeatherStackViewController *)v8 addChildViewController:v8->_weatherConditionsViewController];
    id v11 = [[AirQualityConditionsViewController alloc] initWithWeatherLocationDataProvider:v6];
    airQualityConditionsViewController = v8->_airQualityConditionsViewController;
    v8->_airQualityConditionsViewController = v11;

    [(AirQualityConditionsViewController *)v8->_airQualityConditionsViewController setDelegate:v8];
    [(WeatherStackViewController *)v8 addChildViewController:v8->_airQualityConditionsViewController];
    [(WeatherConditionsViewController *)v8->_weatherConditionsViewController didMoveToParentViewController:v8];
    [(AirQualityConditionsViewController *)v8->_airQualityConditionsViewController didMoveToParentViewController:v8];
    v8->_overlayHidden = 0;
    v8->_overlayAlpha = 1.0;
    objc_storeWeak((id *)&v8->_delegate, v7);
  }

  return v8;
}

- (void)setOverlayAlpha:(double)a3
{
  if (self->_overlayAlpha != a3)
  {
    self->_overlayAlpha = a3;
    [(WeatherStackViewController *)self _viewAlpha];
    double v5 = v4;
    id v6 = [(WeatherStackViewController *)self view];
    [v6 setAlpha:v5];
  }
}

- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4
{
}

- (WeatherConditionsViewController)weatherConditionsViewController
{
  return self->_weatherConditionsViewController;
}

- (void)setStackView:(id)a3
{
}

- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_overlayHidden != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    double v8 = sub_10000B290();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      id v11 = NSStringFromSelector(a2);
      id v12 = @"NO";
      if (v5) {
        id v12 = @"YES";
      }
      uint64_t v13 = v12;
      int v15 = 138412802;
      int v16 = v10;
      __int16 v17 = 2112;
      __int16 v18 = v11;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ %@, hidden = %@", (uint8_t *)&v15, 0x20u);
    }
    self->_overlayHidden = v5;
    BOOL v14 = !v5;
    [(AirQualityConditionsViewController *)self->_airQualityConditionsViewController setEnabled:v14];
    [(WeatherConditionsViewController *)self->_weatherConditionsViewController setEnabled:v14];
    [(WeatherStackViewController *)self _updateVisibilityAnimated:v4];
  }
}

- (void)setLocation:(id)a3
{
}

- (void)setBlurView:(id)a3
{
}

- (BOOL)overlayHidden
{
  return self->_overlayHidden;
}

- (AirQualityConditionsViewController)airQualityConditionsViewController
{
  return self->_airQualityConditionsViewController;
}

- (BOOL)_viewShown
{
  BOOL v2 = self->_airQualityShown || self->_weatherShown;
  return !self->_overlayHidden && v2;
}

- (double)_viewAlpha
{
  unsigned int v3 = [(WeatherStackViewController *)self _viewShown];
  double result = 0.0;
  if (v3) {
    return self->_overlayAlpha;
  }
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)clearSavedLocation
{
  unsigned int v3 = [(WeatherStackViewController *)self airQualityConditionsViewController];
  [v3 clearSavedLocation];

  id v4 = [(WeatherStackViewController *)self weatherConditionsViewController];
  [v4 clearSavedLocation];
}

- (void)setBlurGroupName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

  id v6 = self->_blurGroupName;
  id v7 = [(WeatherStackViewController *)self blurView];
  [v7 _setGroupName:v6];
}

- (void)setOverlayHidden:(BOOL)a3
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  +[GEOAPPortal captureUserAction:15001 target:640 value:0];
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006A6A08;
  v8[3] = &unk_1012EA058;
  objc_copyWeak(&v9, &location);
  id v6 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:v8 actionProvider:&stru_1012F48E0];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v6 = objc_opt_new();
  if (sub_1000BBB44(self) == 1)
  {
    id v7 = [(WeatherStackViewController *)self theme];
    double v8 = [v7 dynamicControlBackgroundColor];
    id v9 = [v8 colorWithAlphaComponent:0.75];
    [v6 setBackgroundColor:v9];

    id v10 = [(WeatherStackViewController *)self view];
    [v10 frame];
    double v12 = v11;
    uint64_t v13 = [(WeatherStackViewController *)self view];
    [v13 frame];
    double v15 = v14;

    int v16 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v12, v15, 8.0);
    [v6 setVisiblePath:v16];
  }
  else
  {
    int v16 = +[UIColor clearColor];
    [v6 setBackgroundColor:v16];
  }

  id v17 = objc_alloc((Class)_UITargetedPreview);
  __int16 v18 = [(WeatherStackViewController *)self view];
  id v19 = [v17 initWithView:v18 parameters:v6];

  return v19;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006A6D14;
  v11[3] = &unk_1012E6708;
  objc_copyWeak(&v12, &location);
  [v10 addCompletion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_requestVisibilityUpdateAnimated:(BOOL)a3
{
  updateVisibilityTimer = self->_updateVisibilityTimer;
  if (updateVisibilityTimer
    || (id v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q), v7 = self->_updateVisibilityTimer, self->_updateVisibilityTimer = v6, v7, self->_updateVisibilityTimer))
  {
    dispatch_time_t v8 = dispatch_time(0, 250000000);
    dispatch_source_set_timer((dispatch_source_t)self->_updateVisibilityTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0xEE6B280uLL);
    objc_initWeak(location, self);
    id v9 = self->_updateVisibilityTimer;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1006A6EF4;
    v11[3] = &unk_1012E6830;
    objc_copyWeak(&v12, location);
    BOOL v13 = a3;
    dispatch_source_set_event_handler(v9, v11);
    if (!updateVisibilityTimer) {
      dispatch_resume((dispatch_object_t)self->_updateVisibilityTimer);
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  else
  {
    id v10 = sub_10000B290();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create timer to update WeatherStackViewController visibility", (uint8_t *)location, 2u);
    }
  }
}

- (void)_openWeatherPunchOutURL
{
  unsigned int v3 = [(WeatherStackViewController *)self _weatherPunchOutURL];
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 absoluteString];
    +[GEOAPPortal captureUserAction:6050 target:640 value:v4];

    id v5 = [(WeatherStackViewController *)self delegate];
    [v5 weatherStackViewController:self openURL:v6];

    unsigned int v3 = v6;
  }
}

- (void)_openAirQualityConditionsPunchOutURL
{
  unsigned int v3 = [(WeatherStackViewController *)self _airQualityConditionsPunchOutURL];
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 absoluteString];
    +[GEOAPPortal captureUserAction:6050 target:640 value:v4];

    id v5 = [(WeatherStackViewController *)self delegate];
    [v5 weatherStackViewController:self openURL:v6];

    unsigned int v3 = v6;
  }
}

- (id)_weatherPunchOutURL
{
  BOOL v2 = [(WeatherStackViewController *)self location];
  unsigned int v3 = +[NSURL weatherURLForLocation:v2];

  return v3;
}

- (id)_airQualityConditionsPunchOutURL
{
  BOOL v2 = [(WeatherStackViewController *)self airQualityConditionsViewController];
  unsigned int v3 = [v2 airQualityConditions];
  id v4 = [v3 learnMoreURL];

  return v4;
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (WeatherStackViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (WeatherStackViewControllerDelegate *)WeakRetained;
}

- (double)overlayAlpha
{
  return self->_overlayAlpha;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIStackView)stackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackView);

  return (UIStackView *)WeakRetained;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setAirQualityConditionsViewController:(id)a3
{
}

- (void)setWeatherConditionsViewController:(id)a3
{
}

- (BOOL)airQualityShown
{
  return self->_airQualityShown;
}

- (void)setAirQualityShown:(BOOL)a3
{
  self->_BOOL airQualityShown = a3;
}

- (BOOL)weatherShown
{
  return self->_weatherShown;
}

- (void)setWeatherShown:(BOOL)a3
{
  self->_BOOL weatherShown = a3;
}

- (OS_dispatch_source)updateVisibilityTimer
{
  return self->_updateVisibilityTimer;
}

- (void)setUpdateVisibilityTimer:(id)a3
{
}

- (int64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int64_t)a3
{
  self->_animationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateVisibilityTimer, 0);
  objc_storeStrong((id *)&self->_weatherConditionsViewController, 0);
  objc_storeStrong((id *)&self->_airQualityConditionsViewController, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_destroyWeak((id *)&self->_stackView);
  objc_destroyWeak((id *)&self->_blurView);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
}

@end