@interface WALockscreenWidgetViewController
+ (id)sharedInstanceIfExists;
- (BOOL)_delegateShouldUpdateForecast;
- (BOOL)locationServicesActive;
- (BOOL)shouldFakeWeather;
- (BOOL)todayViewIsVisible;
- (NSDate)updateLastCompletionDate;
- (NSTimer)updateTimer;
- (WAForecastModel)currentForecastModel;
- (WALockscreenWidgetViewController)init;
- (WATodayModel)todayModel;
- (WATodayPadView)todayView;
- (WAWidgetDelegate)delegate;
- (double)updateInterval;
- (id)_conditionsImage;
- (id)_conditionsLine;
- (id)_locationName;
- (id)_temperature;
- (void)_delegateDidUpdate;
- (void)_delegateUpdateDidFailWithError:(id)a3;
- (void)_delegateWillUpdate;
- (void)_scheduleNewTimer;
- (void)_setTodayViewHidden:(BOOL)a3;
- (void)_setupWeatherModel;
- (void)_teardownTimer;
- (void)_teardownWeatherModel;
- (void)_updateTimerFired:(id)a3;
- (void)_updateTodayView;
- (void)_updateWithReason:(id)a3;
- (void)getLocationServicesAuthorizationStatus:(id)a3;
- (void)setCurrentForecastModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationServicesActive:(BOOL)a3;
- (void)setTodayModel:(id)a3;
- (void)setTodayView:(id)a3;
- (void)setUpdateInterval:(double)a3;
- (void)setUpdateLastCompletionDate:(id)a3;
- (void)setUpdateTimer:(id)a3;
- (void)todayModel:(id)a3 forecastWasUpdated:(id)a4;
- (void)todayModelWantsUpdate:(id)a3;
- (void)updateForChangedSettings:(id)a3;
- (void)updateWeather;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WALockscreenWidgetViewController

+ (id)sharedInstanceIfExists
{
  id WeakRetained = objc_loadWeakRetained(&sharedLockscreenWidgetViewControllerIfExists);
  return WeakRetained;
}

- (WALockscreenWidgetViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)WALockscreenWidgetViewController;
  v2 = [(WALockscreenWidgetViewController *)&v12 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(WALockscreenWidgetViewController *)v2 setTodayView:v3];

    v4 = objc_opt_new();
    v5 = [(WALockscreenWidgetViewController *)v2 todayView];
    [v5 setStyle:v4];

    v6 = [(WALockscreenWidgetViewController *)v2 todayView];
    [v6 setHidden:1];

    v7 = [MEMORY[0x263F1C550] clearColor];
    v8 = [(WALockscreenWidgetViewController *)v2 todayView];
    [v8 setBackgroundColor:v7];

    v9 = [(WALockscreenWidgetViewController *)v2 todayView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(WALockscreenWidgetViewController *)v2 setLocationServicesActive:1];
    [(WALockscreenWidgetViewController *)v2 setUpdateInterval:300.0];
    id WeakRetained = objc_loadWeakRetained(&sharedLockscreenWidgetViewControllerIfExists);

    if (!WeakRetained) {
      objc_storeWeak(&sharedLockscreenWidgetViewControllerIfExists, v2);
    }
  }
  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WALockscreenWidgetViewController;
  [(WALockscreenWidgetViewController *)&v4 viewDidLoad];
  v3 = [(WALockscreenWidgetViewController *)self todayView];
  [(WALockscreenWidgetViewController *)self setView:v3];

  [(WALockscreenWidgetViewController *)self _updateTodayView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WALockscreenWidgetViewController;
  [(WALockscreenWidgetViewController *)&v4 viewWillAppear:a3];
  [(WALockscreenWidgetViewController *)self _updateTodayView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WALockscreenWidgetViewController;
  [(WALockscreenWidgetViewController *)&v4 viewDidAppear:a3];
  [(WALockscreenWidgetViewController *)self _updateWithReason:@"viewDidAppear wants an update."];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WALockscreenWidgetViewController;
  [(WALockscreenWidgetViewController *)&v4 viewDidDisappear:a3];
  [(WALockscreenWidgetViewController *)self _teardownWeatherModel];
  [(WALockscreenWidgetViewController *)self _setTodayViewHidden:1];
  [(WALockscreenWidgetViewController *)self _teardownTimer];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)WALockscreenWidgetViewController;
  id v7 = a4;
  -[WALockscreenWidgetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = [(WALockscreenWidgetViewController *)self todayView];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__WALockscreenWidgetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_2647E0588;
  id v11 = v8;
  id v9 = v8;
  [v7 animateAlongsideTransition:v10 completion:0];
}

void __87__WALockscreenWidgetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 orientation];

  objc_super v4 = [*(id *)(a1 + 32) window];
  v5 = [v4 screen];
  [v5 _referenceBounds];
  double v7 = v6;
  double v9 = v8;

  +[WATodayPadViewStyle styleForScreenWithSize:orientation:](WATodayPadViewStyle, "styleForScreenWithSize:orientation:", v3, v7, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setStyle:v10];
}

- (void)setLocationServicesActive:(BOOL)a3
{
  if (self->_locationServicesActive != a3)
  {
    BOOL v3 = a3;
    self->_locationServicesActive = a3;
    v5 = [(WALockscreenWidgetViewController *)self todayModel];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      double v7 = [(WALockscreenWidgetViewController *)self todayModel];
      [v7 setLocationServicesActive:v3];
    }
    [(WALockscreenWidgetViewController *)self _updateTodayView];
  }
}

- (void)setUpdateInterval:(double)a3
{
  if (self->_updateInterval != a3)
  {
    [(WALockscreenWidgetViewController *)self _teardownTimer];
    self->_updateInterval = a3;
    [(WALockscreenWidgetViewController *)self _scheduleNewTimer];
  }
}

- (void)updateWeather
{
}

- (void)updateForChangedSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(WALockscreenWidgetViewController *)self todayView];
  [v5 updateForChangedSettings:v4];
}

- (BOOL)todayViewIsVisible
{
  if ([(WALockscreenWidgetViewController *)self isViewLoaded])
  {
    BOOL v3 = [(WALockscreenWidgetViewController *)self todayView];
    int v4 = [v3 isHidden] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_updateWithReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WALockscreenWidgetViewController *)self todayModel];

  if (!v5) {
    [(WALockscreenWidgetViewController *)self _setupWeatherModel];
  }
  if ([(WALockscreenWidgetViewController *)self _delegateShouldUpdateForecast])
  {
    [(WALockscreenWidgetViewController *)self _delegateWillUpdate];
    objc_initWeak(&location, self);
    char v6 = WALogForCategory(3);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_226D1D000, v6, OS_LOG_TYPE_DEFAULT, "Updating with reason: %@", buf, 0xCu);
    }

    id v7 = objc_loadWeakRetained(&location);
    double v8 = [v7 todayModel];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__WALockscreenWidgetViewController__updateWithReason___block_invoke;
    v10[3] = &unk_2647E05B0;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [v8 executeModelUpdateWithCompletion:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    double v9 = WALogForCategory(3);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "Delegate said to not update with reason: %@", buf, 0xCu);
    }
  }
}

void __54__WALockscreenWidgetViewController__updateWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF910] date];
  char v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setUpdateLastCompletionDate:v5];

  if (v4)
  {
    double v8 = WALogForCategory(3);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_3((uint64_t)v4, a1, v8);
    }

    double v9 = objc_loadWeakRetained((id *)(a1 + 40));
    [v9 _delegateUpdateDidFailWithError:v4];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    id v11 = [v10 todayModel];
    id v12 = [v11 forecastModel];
    v13 = [v12 city];
    int v14 = [v13 isLocalWeatherCity];

    double v9 = WALogForCategory(3);
    BOOL v15 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v15) {
        __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_1(a1, v9);
      }

      id v16 = objc_loadWeakRetained((id *)(a1 + 40));
      v17 = [v16 todayModel];
      double v9 = [v17 forecastModel];

      id v18 = objc_loadWeakRetained(v6);
      [v18 setCurrentForecastModel:v9];
    }
    else if (v15)
    {
      __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_2(a1, v9);
    }
  }

  id v19 = objc_loadWeakRetained(v6);
  [v19 _updateTodayView];
}

- (void)_setTodayViewHidden:(BOOL)a3
{
  int v3 = a3;
  id v5 = [(WALockscreenWidgetViewController *)self todayView];
  int v6 = [v5 isHidden];

  if (v6 != v3)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    double v8 = v7;
    if (v3)
    {
      [v7 postNotificationName:@"WALockscreenWidgetWillDisappearNotification" object:self];

      double v9 = [(WALockscreenWidgetViewController *)self todayView];
      [v9 setHidden:1];

      id v10 = [MEMORY[0x263F08A00] defaultCenter];
      id v11 = @"WALockscreenWidgetDidDisappearNotification";
    }
    else
    {
      [v7 postNotificationName:@"WALockscreenWidgetWillAppearNotification" object:self];

      id v12 = [(WALockscreenWidgetViewController *)self todayView];
      [v12 setHidden:0];

      id v10 = [MEMORY[0x263F08A00] defaultCenter];
      id v11 = @"WALockscreenWidgetDidAppearNotification";
    }
    id v13 = v10;
    [v10 postNotificationName:v11 object:self];
  }
}

- (void)_updateTodayView
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = WALogForCategory(10);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "-[WALockscreenWidgetViewController _updateTodayView]";
    _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__WALockscreenWidgetViewController__updateTodayView__block_invoke;
  v4[3] = &unk_2647E05D8;
  v4[4] = self;
  [(WALockscreenWidgetViewController *)self getLocationServicesAuthorizationStatus:v4];
}

void __52__WALockscreenWidgetViewController__updateTodayView__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = WALogForCategory(10);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithInt:a2];
    *(_DWORD *)buf = 138412290;
    v33 = v5;
    _os_log_impl(&dword_226D1D000, v4, OS_LOG_TYPE_DEFAULT, "AuthorizationStatus %@", buf, 0xCu);
  }
  int v6 = [*(id *)(a1 + 32) currentForecastModel];
  uint64_t v7 = [v6 city];
  int v8 = [v7 isLocalWeatherCity];
  int v9 = [*(id *)(a1 + 32) locationServicesActive];
  if (a2 == 3) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  id v11 = [*(id *)(a1 + 32) _locationName];
  if (v11 && v8 && v10 || ([*(id *)(a1 + 32) shouldFakeWeather] & 1) != 0)
  {
    id v12 = [*(id *)(a1 + 32) _temperature];
    id v13 = [*(id *)(a1 + 32) _conditionsLine];
    int v14 = [*(id *)(a1 + 32) _conditionsImage];
    BOOL v15 = [*(id *)(a1 + 32) todayView];
    [v15 setLocationName:v11];

    id v16 = [*(id *)(a1 + 32) todayView];
    [v16 setTemperature:v12];

    v17 = [*(id *)(a1 + 32) todayView];
    [v17 setConditionsImage:v14];

    id v18 = [*(id *)(a1 + 32) todayView];
    [v18 setConditionsLine:v13];

    id v19 = WALogForCategory(3);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) todayView];
      v20 = v31 = v7;
      v21 = [v20 locationName];
      [*(id *)(a1 + 32) todayView];
      v22 = v30 = v13;
      [v22 temperature];
      v23 = v11;
      v25 = v24 = v6;
      *(_DWORD *)buf = 138412546;
      v33 = v21;
      __int16 v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_226D1D000, v19, OS_LOG_TYPE_DEFAULT, "Show Today View: %@ at %@", buf, 0x16u);

      int v6 = v24;
      id v11 = v23;

      id v13 = v30;
      uint64_t v7 = v31;
    }

    [*(id *)(a1 + 32) _setTodayViewHidden:0];
  }
  else
  {
    [*(id *)(a1 + 32) _setTodayViewHidden:1];
    v26 = [*(id *)(a1 + 32) todayView];
    [v26 setConditionsLine:&stru_26DADC2F0];

    v27 = [*(id *)(a1 + 32) todayView];
    [v27 setLocationName:&stru_26DADC2F0];

    v28 = [*(id *)(a1 + 32) todayView];
    [v28 setTemperature:&stru_26DADC2F0];

    id v12 = WALogForCategory(3);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v29 = @"Location Services are disabled.";
      if (v10) {
        v29 = @"Unknown!";
      }
      if (!v8) {
        v29 = @"First Weather Forecast Location; not local weather city";
      }
      *(_DWORD *)buf = 138412290;
      v33 = v29;
      _os_log_impl(&dword_226D1D000, v12, OS_LOG_TYPE_DEFAULT, "Today View Is Hidden: %@", buf, 0xCu);
    }
  }
}

- (void)todayModelWantsUpdate:(id)a3
{
}

- (void)todayModel:(id)a3 forecastWasUpdated:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = WALogForCategory(10);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315650;
    v20 = "-[WALockscreenWidgetViewController todayModel:forecastWasUpdated:]";
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v19, 0x20u);
  }

  int v9 = WALogForCategory(10);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(WALockscreenWidgetViewController *)self currentForecastModel];
    id v11 = [(WALockscreenWidgetViewController *)self todayModel];
    id v12 = [v11 forecastModel];
    int v19 = 138412546;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "current %@ todayModel.forcastModel %@", (uint8_t *)&v19, 0x16u);
  }
  id v13 = [(WALockscreenWidgetViewController *)self currentForecastModel];
  int v14 = [(WALockscreenWidgetViewController *)self todayModel];
  BOOL v15 = [v14 forecastModel];

  if (v13 == v15)
  {
    id v18 = WALogForCategory(10);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_226D1D000, v18, OS_LOG_TYPE_DEFAULT, "Not updating today view since currentForcastModel is equal to todayModel.forcastModel", (uint8_t *)&v19, 2u);
    }
  }
  else
  {
    id v16 = [(WALockscreenWidgetViewController *)self todayModel];
    v17 = [v16 forecastModel];
    [(WALockscreenWidgetViewController *)self setCurrentForecastModel:v17];

    [(WALockscreenWidgetViewController *)self _updateTodayView];
  }
}

- (void)_updateTimerFired:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__WALockscreenWidgetViewController__updateTimerFired___block_invoke;
  v3[3] = &unk_2647E0600;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__WALockscreenWidgetViewController__updateTimerFired___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateWithReason:@"Timer Fired!"];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _scheduleNewTimer];
}

- (void)_scheduleNewTimer
{
  id v3 = [(WALockscreenWidgetViewController *)self todayModel];

  if (v3)
  {
    [(WALockscreenWidgetViewController *)self updateInterval];
    if (v4 > 0.0)
    {
      [(WALockscreenWidgetViewController *)self _teardownTimer];
      id v5 = (void *)MEMORY[0x263EFFA20];
      [(WALockscreenWidgetViewController *)self updateInterval];
      id v6 = objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateTimerFired_, 0, 0);
      [(WALockscreenWidgetViewController *)self setUpdateTimer:v6];

      id v7 = [(WALockscreenWidgetViewController *)self updateTimer];
      [v7 setTolerance:60.0];
    }
  }
}

- (void)_teardownTimer
{
  id v3 = [(WALockscreenWidgetViewController *)self updateTimer];
  [v3 invalidate];

  [(WALockscreenWidgetViewController *)self setUpdateTimer:0];
}

- (void)_setupWeatherModel
{
  if ([(WALockscreenWidgetViewController *)self shouldFakeWeather])
  {
    id v3 = objc_opt_new();
    double v4 = +[WeatherInternalPreferences sharedInternalPreferences];
    id v5 = [v4 objectForKey:@"FakePadWeatherLatitude"];
    uint64_t v6 = [v4 objectForKey:@"FakePadWeatherLongitude"];
    id v7 = (void *)v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      double v15 = -122.029488;
      double v13 = 37.3333702;
    }
    else
    {
      [v5 floatValue];
      double v13 = v12;
      [v7 floatValue];
      double v15 = v14;
    }
    id v16 = (void *)[objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v13 longitude:v15];
    [v3 setGeoLocation:v16];

    uint64_t v17 = [v4 objectForKey:@"FakePadWeatherDisplayName"];
    id v18 = (void *)v17;
    if (v17) {
      int v19 = (__CFString *)v17;
    }
    else {
      int v19 = @"Cupertino, CA";
    }
    [v3 setDisplayName:v19];

    v20 = +[WATodayModel modelWithLocation:v3];
    [(WALockscreenWidgetViewController *)self setTodayModel:v20];

    [(WALockscreenWidgetViewController *)self _updateWithReason:@"We're faking the weather, so let's just get some data in here"];
  }
  else
  {
    int v9 = objc_opt_new();
    int v10 = +[WATodayModel autoupdatingLocationModelWithPreferences:v9 effectiveBundleIdentifier:0];
    [(WALockscreenWidgetViewController *)self setTodayModel:v10];

    BOOL v11 = [(WALockscreenWidgetViewController *)self locationServicesActive];
    id v3 = [(WALockscreenWidgetViewController *)self todayModel];
    [v3 setLocationServicesActive:v11];
  }

  __int16 v21 = [(WALockscreenWidgetViewController *)self todayModel];
  id v22 = [v21 forecastModel];
  [(WALockscreenWidgetViewController *)self setCurrentForecastModel:v22];

  __int16 v23 = [(WALockscreenWidgetViewController *)self currentForecastModel];

  if (v23) {
    [(WALockscreenWidgetViewController *)self _updateTodayView];
  }
  [(WALockscreenWidgetViewController *)self _scheduleNewTimer];
  id v24 = [(WALockscreenWidgetViewController *)self todayModel];
  [v24 addObserver:self];
}

- (void)_teardownWeatherModel
{
  id v3 = [(WALockscreenWidgetViewController *)self todayModel];
  [v3 removeObserver:self];

  [(WALockscreenWidgetViewController *)self setTodayModel:0];
}

- (BOOL)shouldFakeWeather
{
  v2 = +[WeatherInternalPreferences sharedInternalPreferences];
  id v3 = [v2 objectForKey:@"FakePadWeather"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)_locationName
{
  id v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  if ([(WALockscreenWidgetViewController *)self shouldFakeWeather]
    && ([v3 objectForKey:@"FakePadWeatherDisplayName"],
        char v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    id v5 = [v3 objectForKey:@"FakePadWeatherDisplayName"];
  }
  else
  {
    uint64_t v6 = [(WALockscreenWidgetViewController *)self currentForecastModel];
    id v7 = [v6 city];
    BOOL v8 = [v7 name];
    int v9 = v8;
    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      int v10 = [v6 location];
      id v5 = [v10 displayName];
    }
  }

  return v5;
}

- (id)_temperature
{
  if (_temperature_onceToken != -1) {
    dispatch_once(&_temperature_onceToken, &__block_literal_global_6);
  }
  id v3 = [MEMORY[0x263F85F88] sharedObserver];
  uint64_t v4 = [v3 temperatureUnit];
  [(id)_temperature_temperatureFormatter setOutputUnit:v4];

  [(id)_temperature_temperatureFormatter setSymbolType:!WAIsChinaSKUAndSimplifiedChinese()];
  id v5 = +[WeatherInternalPreferences sharedInternalPreferences];
  if ([(WALockscreenWidgetViewController *)self shouldFakeWeather]
    && ([v5 objectForKey:@"FakePadWeatherConditionTemperature"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = (void *)_temperature_temperatureFormatter;
    BOOL v8 = [v5 objectForKey:@"FakePadWeatherConditionTemperature"];
    int v9 = [v7 stringForObjectValue:v8];
  }
  else
  {
    BOOL v8 = [(WALockscreenWidgetViewController *)self currentForecastModel];
    int v10 = [v8 currentConditions];
    BOOL v11 = (void *)_temperature_temperatureFormatter;
    float v12 = [v10 temperature];
    int v9 = [v11 stringForObjectValue:v12];
  }
  return v9;
}

uint64_t __48__WALockscreenWidgetViewController__temperature__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _temperature_temperatureFormatter;
  _temperature_temperatureFormatter = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_conditionsLine
{
  id v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  int v4 = [v3 isV3Enabled];

  id v5 = +[WeatherInternalPreferences sharedInternalPreferences];
  BOOL v6 = [(WALockscreenWidgetViewController *)self shouldFakeWeather];
  if (!v4)
  {
    if (!v6
      || ([v5 objectForKey:@"FakePadWeatherConditionDescription"],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          !v17))
    {
      int v19 = [(WALockscreenWidgetViewController *)self currentForecastModel];
      v20 = [v19 currentConditions];
      __int16 v21 = [v19 airQualityConditions];
      uint64_t v22 = WAAirQualityCategoryFromConditions();

      __int16 v23 = [(WALockscreenWidgetViewController *)self currentForecastModel];
      id v24 = [v23 location];
      uint64_t v25 = [v24 countryAbbreviation];
      int IsSignificantForCategory = WAAirQualityIsSignificantForCategory(v22, v25);

      if (IsSignificantForCategory)
      {
        v27 = [(WALockscreenWidgetViewController *)self currentForecastModel];
        v28 = [v27 location];
        v29 = [v28 countryAbbreviation];
        id v18 = WAAirQualityDescriptionForCategory(v22, v29);
      }
      else
      {
        id v18 = WAConditionsLineStringFromCurrentForecasts(v20);
      }

      goto LABEL_16;
    }
    goto LABEL_9;
  }
  if (v6)
  {
    id v7 = [v5 objectForKey:@"FakePadWeatherConditionDescription"];

    if (v7)
    {
LABEL_9:
      id v18 = [v5 objectForKey:@"FakePadWeatherConditionDescription"];
      goto LABEL_16;
    }
  }
  BOOL v8 = [(WALockscreenWidgetViewController *)self currentForecastModel];
  int v9 = [v8 currentConditions];
  int v10 = [v8 city];
  BOOL v11 = [v10 airQualityScaleCategory];

  uint64_t v12 = [v11 longDescription];
  if (v12
    && (double v13 = (void *)v12,
        unint64_t v14 = [v11 categoryIndex],
        unint64_t v15 = [v11 warningLevel],
        v13,
        v14 > v15))
  {
    uint64_t v16 = [v11 longDescription];
  }
  else
  {
    uint64_t v16 = WAConditionsLineStringFromCurrentForecasts(v9);
  }
  id v18 = (void *)v16;

LABEL_16:
  return v18;
}

- (id)_conditionsImage
{
  id v3 = +[WeatherInternalPreferences sharedInternalPreferences];
  if ([(WALockscreenWidgetViewController *)self shouldFakeWeather]
    && ([v3 objectForKey:@"FakePadWeatherCondition"],
        int v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    id v5 = [v3 objectForKey:@"FakePadWeatherCondition"];
    uint64_t v6 = (int)[v5 intValue];

    id v7 = WAImageForLegacyConditionCode(v6, 0);
  }
  else
  {
    BOOL v8 = [(WALockscreenWidgetViewController *)self currentForecastModel];
    int v9 = [v8 currentConditions];
    id v7 = WAImageForLegacyConditionCode([v9 conditionCode], 0);
  }
  return v7;
}

- (BOOL)_delegateShouldUpdateForecast
{
  objc_initWeak(&location, self);
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__WALockscreenWidgetViewController__delegateShouldUpdateForecast__block_invoke;
  v5[3] = &unk_2647E0628;
  objc_copyWeak(&v6, &location);
  v5[4] = &v7;
  v2 = (void (**)(void))MEMORY[0x22A668850](v5);
  if ([MEMORY[0x263F08B88] isMainThread]) {
    v2[2](v2);
  }
  else {
    dispatch_sync(MEMORY[0x263EF83A0], v2);
  }
  char v3 = *((unsigned char *)v8 + 24);

  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&location);
  return v3;
}

void __65__WALockscreenWidgetViewController__delegateShouldUpdateForecast__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v8 = objc_loadWeakRetained(v2);
    id v6 = [v8 delegate];
    id v7 = objc_loadWeakRetained(v2);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 widgetViewControllerShouldUpdateForecast:v7];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (void)_delegateWillUpdate
{
  char v3 = [(WALockscreenWidgetViewController *)self delegate];
  if (v3)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__WALockscreenWidgetViewController__delegateWillUpdate__block_invoke;
    block[3] = &unk_2647E0650;
    id v5 = v3;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
}

void __55__WALockscreenWidgetViewController__delegateWillUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 widgetViewControllerWillUpdate:WeakRetained];
}

- (void)_delegateDidUpdate
{
  char v3 = [(WALockscreenWidgetViewController *)self delegate];
  if (v3)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__WALockscreenWidgetViewController__delegateDidUpdate__block_invoke;
    block[3] = &unk_2647E0650;
    id v5 = v3;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
}

void __54__WALockscreenWidgetViewController__delegateDidUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 widgetViewControllerDidUpdate:WeakRetained];
}

- (void)_delegateUpdateDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(WALockscreenWidgetViewController *)self delegate];
  if (v5)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __68__WALockscreenWidgetViewController__delegateUpdateDidFailWithError___block_invoke;
    v6[3] = &unk_2647E0678;
    id v7 = v5;
    objc_copyWeak(&v9, &location);
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __68__WALockscreenWidgetViewController__delegateUpdateDidFailWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v2 widgetViewController:WeakRetained failedToUpdateWithError:*(void *)(a1 + 40)];
}

- (void)getLocationServicesAuthorizationStatus:(id)a3
{
  id v3 = a3;
  id v4 = __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_3;
  block[3] = &unk_2647E06C8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

id __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke()
{
  if (WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_token_12 != -1) {
    dispatch_once(&WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_token_12, &__block_literal_global_100);
  }
  uint64_t v0 = (void *)WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_object_12;
  return v0;
}

uint64_t __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_2()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.weather.location-auth-status", 0);
  uint64_t v1 = WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_object_12;
  WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_object_12 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_3(uint64_t a1)
{
  int v2 = +[WeatherLocationManager locationManagerAuthorizationWithEffectiveBundleId:0];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_4;
  v3[3] = &unk_2647E06A0;
  id v4 = *(id *)(a1 + 32);
  int v5 = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (WATodayPadView)todayView
{
  return self->_todayView;
}

- (void)setTodayView:(id)a3
{
}

- (BOOL)locationServicesActive
{
  return self->_locationServicesActive;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (WAWidgetDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WAWidgetDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WATodayModel)todayModel
{
  return self->_todayModel;
}

- (void)setTodayModel:(id)a3
{
}

- (WAForecastModel)currentForecastModel
{
  return self->_currentForecastModel;
}

- (void)setCurrentForecastModel:(id)a3
{
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
}

- (NSDate)updateLastCompletionDate
{
  return self->_updateLastCompletionDate;
}

- (void)setUpdateLastCompletionDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateLastCompletionDate, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_currentForecastModel, 0);
  objc_storeStrong((id *)&self->_todayModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_todayView, 0);
}

void __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_226D1D000, a2, OS_LOG_TYPE_DEBUG, "Update Received (Update Reason: %@)", (uint8_t *)&v3, 0xCu);
}

void __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_226D1D000, a2, OS_LOG_TYPE_DEBUG, "Update Ignored (not local weather city) (Update Reason: %@)", (uint8_t *)&v3, 0xCu);
}

void __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "Update Error: %@ (Update Reason: %@)", (uint8_t *)&v4, 0x16u);
}

@end