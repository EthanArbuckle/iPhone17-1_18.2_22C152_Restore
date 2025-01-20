@interface WATodayModel
+ (id)autoupdatingLocationModelWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4;
+ (id)currentLocationModel;
+ (id)modelWithLocation:(id)a3;
- (BOOL)executeModelUpdateWithCompletion:(id)a3;
- (BOOL)hasCrossedHourlyBoundary;
- (BOOL)hasPendingUpdates;
- (NSDate)lastUpdateDate;
- (WAForecastModel)forecastModel;
- (WATodayModel)init;
- (WATodayModel)initWithLocation:(id)a3;
- (WFServiceConnection)connection;
- (ct_green_tea_logger_s)greenTeaLogger;
- (id)location;
- (void)_executeForecastRetrievalForLocation:(id)a3 completion:(id)a4;
- (void)_executeLocationUpdateWithCompletion:(id)a3;
- (void)_fireTodayModelForecastWasUpdated:(id)a3;
- (void)_fireTodayModelWantsUpdate;
- (void)_forecastUpdateCompleted:(id)a3 forecastModel:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_locationUpdateCompleted:(id)a3 error:(id)a4 completion:(id)a5;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)performDelayedUpdatesForObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setConnection:(id)a3;
- (void)setForecastModel:(id)a3;
- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3;
- (void)setHasPendingUpdates:(BOOL)a3;
- (void)setLastUpdateDate:(id)a3;
@end

@implementation WATodayModel

+ (id)autoupdatingLocationModelWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  v7 = [[WATodayAutoupdatingLocationModel alloc] initWithPreferences:v6 effectiveBundleIdentifier:v5];

  [(WATodayModel *)v7 setHasPendingUpdates:0];
  v8 = WALogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "+[WATodayModel autoupdatingLocationModelWithPreferences:effectiveBundleIdentifier:]";
    _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", (uint8_t *)&v10, 0xCu);
  }

  [(WATodayAutoupdatingLocationModel *)v7 configureWithLocationServicesActive:1];
  return v7;
}

+ (id)currentLocationModel
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = [WATodayAutoupdatingLocationModel alloc];
  v3 = objc_alloc_init(WeatherPreferences);
  v4 = [(WATodayAutoupdatingLocationModel *)v2 initWithPreferences:v3 effectiveBundleIdentifier:0];

  [(WATodayModel *)v4 setHasPendingUpdates:0];
  id v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "+[WATodayModel currentLocationModel]";
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", (uint8_t *)&v7, 0xCu);
  }

  [(WATodayAutoupdatingLocationModel *)v4 configureWithLocationServicesActive:1];
  return v4;
}

+ (id)modelWithLocation:(id)a3
{
  id v3 = a3;
  v4 = [[WATodayModel alloc] initWithLocation:v3];

  return v4;
}

- (WATodayModel)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)WATodayModel;
  v2 = [(WATodayModel *)&v21 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = objc_opt_new();
    modelOperationQueue = v2->_modelOperationQueue;
    v2->_modelOperationQueue = (NSOperationQueue *)v5;

    [(NSOperationQueue *)v2->_modelOperationQueue setMaxConcurrentOperationCount:1];
    v2->_hasPendingUpdates = 0;
    int v7 = WALogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[WATodayModel init]";
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", buf, 0xCu);
    }

    v2->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    v8 = objc_opt_new();
    objc_initWeak((id *)buf, v2);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __20__WATodayModel_init__block_invoke;
    v19[3] = &unk_2647E01E0;
    objc_copyWeak(&v20, (id *)buf);
    [v8 setForecastRequestStartingCallback:v19];
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __20__WATodayModel_init__block_invoke_6;
    v17 = &unk_2647E0208;
    objc_copyWeak(&v18, (id *)buf);
    [v8 setLocationGeocodeForCoordinateRequestStartingCallback:&v14];
    id v9 = objc_alloc(MEMORY[0x263F85FA8]);
    int v10 = objc_msgSend(v9, "initWithStore:", v8, v14, v15, v16, v17);
    v11 = objc_opt_new();
    [v11 setServiceProxy:v10];
    [v10 addClient:v11];
    connection = v2->_connection;
    v2->_connection = (WFServiceConnection *)v11;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __20__WATodayModel_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 32));
  int v7 = objc_loadWeakRetained(&to);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  id v8 = objc_loadWeakRetained(&to);
  id v9 = [v8 forecastModel];
  int v10 = [v9 location];
  int v11 = [v6 isEqual:v10];

  if (v11)
  {
    id v12 = objc_loadWeakRetained(&to);
    [v12 greenTeaLogger];
    int v7 = getCTGreenTeaOsLogHandle();

    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_INFO, "Transmitting current location to %@ for local weather forecast.", buf, 0xCu);
    }
    goto LABEL_6;
  }
LABEL_7:
  objc_destroyWeak(&to);
}

void __20__WATodayModel_init__block_invoke_6(uint64_t a1, double a2, double a3)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v5 = objc_loadWeakRetained(&to);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  id v6 = objc_loadWeakRetained(&to);
  int v7 = [v6 forecastModel];
  id v8 = [v7 location];
  id v9 = [v8 geoLocation];
  [v9 coordinate];
  BOOL v12 = CLLocationCoordinate2DEqualToCoordinates(v10, v11, a2, a3);

  if (v12)
  {
    id v13 = objc_loadWeakRetained(&to);
    [v13 greenTeaLogger];
    id v5 = getCTGreenTeaOsLogHandle();

    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_INFO, "Transmitting current location to CoreLocation for reverse geocode request.", v14, 2u);
    }
    goto LABEL_6;
  }
LABEL_7:
  objc_destroyWeak(&to);
}

- (WATodayModel)initWithLocation:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    double v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WATodayModel.m", 111, @"Invalid parameter not satisfying: %@", @"location" object file lineNumber description];
  }
  id v6 = [(WATodayModel *)self init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    forecastModel = v6->_forecastModel;
    v6->_forecastModel = (WAForecastModel *)v7;

    [(WAForecastModel *)v6->_forecastModel setLocation:v5];
    v6->_hasPendingUpdates = 0;
    id v9 = WALogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[WATodayModel initWithLocation:]";
      _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", buf, 0xCu);
    }
  }
  return v6;
}

- (void)dealloc
{
  [(WATodayModel *)self greenTeaLogger];
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)WATodayModel;
  [(WATodayModel *)&v3 dealloc];
}

- (BOOL)executeModelUpdateWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __49__WATodayModel_executeModelUpdateWithCompletion___block_invoke;
    v6[3] = &unk_2647E0230;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    [(WATodayModel *)self _executeLocationUpdateWithCompletion:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v4 != 0;
}

void __49__WATodayModel_executeModelUpdateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _locationUpdateCompleted:v7 error:v6 completion:*(void *)(a1 + 32)];
}

- (void)_locationUpdateCompleted:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = v9;
  if (a4)
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, a4);
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__WATodayModel__locationUpdateCompleted_error_completion___block_invoke;
    v11[3] = &unk_2647E0258;
    v11[4] = self;
    id v12 = v8;
    id v13 = v10;
    [(WATodayModel *)self _executeForecastRetrievalForLocation:v12 completion:v11];
  }
}

uint64_t __58__WATodayModel__locationUpdateCompleted_error_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _forecastUpdateCompleted:*(void *)(a1 + 40) forecastModel:a2 error:a3 completion:*(void *)(a1 + 48)];
}

- (void)_forecastUpdateCompleted:(id)a3 forecastModel:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__WATodayModel__forecastUpdateCompleted_forecastModel_error_completion___block_invoke;
  v15[3] = &unk_2647E0280;
  id v16 = v10;
  v17 = self;
  id v18 = v9;
  id v19 = v11;
  id v12 = v9;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

uint64_t __72__WATodayModel__forecastUpdateCompleted_forecastModel_error_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v2();
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) forecastModel];
    char v5 = [v4 isEqual:*(void *)(a1 + 48)];

    if ((v5 & 1) == 0)
    {
      [*(id *)(a1 + 40) setForecastModel:*(void *)(a1 + 48)];
      [*(id *)(a1 + 40) _willDeliverForecastModel:*(void *)(a1 + 48)];
      [*(id *)(a1 + 40) _fireTodayModelForecastWasUpdated:*(void *)(a1 + 48)];
    }
    id v6 = [MEMORY[0x263EFF910] date];
    [*(id *)(a1 + 40) setLastUpdateDate:v6];

    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
    if ((v5 & 1) == 0)
    {
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      return [v7 _persistStateWithModel:v8];
    }
  }
  return result;
}

- (id)location
{
  v2 = [(WATodayModel *)self forecastModel];
  objc_super v3 = [v2 location];

  return v3;
}

- (WAForecastModel)forecastModel
{
  return self->_forecastModel;
}

- (void)setForecastModel:(id)a3
{
}

- (void)_executeLocationUpdateWithCompletion:(id)a3
{
  if (a3)
  {
    forecastModel = self->_forecastModel;
    id v5 = a3;
    id v6 = [(WAForecastModel *)forecastModel location];
    (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
  }
}

- (void)_executeForecastRetrievalForLocation:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(NSOperationQueue *)self->_modelOperationQueue cancelAllOperations];
    uint64_t v8 = WALogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "Creating WAForecastOperation for %@", buf, 0xCu);
    }

    id v9 = [WAForecastOperation alloc];
    id v10 = [(WATodayModel *)self connection];
    id v11 = [(WAForecastOperation *)v9 initWithLocation:v6 onConnection:v10];

    objc_initWeak((id *)buf, v11);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__WATodayModel__executeForecastRetrievalForLocation_completion___block_invoke;
    v13[3] = &unk_2647E02A8;
    objc_copyWeak(&v16, (id *)buf);
    id v14 = v6;
    id v15 = v7;
    [(WAForecastOperation *)v11 setCompletionBlock:v13];
    [(NSOperationQueue *)self->_modelOperationQueue addOperation:v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = WALogForCategory(4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WATodayModel _executeForecastRetrievalForLocation:completion:](v12);
    }

    id v11 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.errorDomain" code:4 userInfo:0];
    (*((void (**)(id, void, WAForecastOperation *))v7 + 2))(v7, 0, v11);
  }
}

void __64__WATodayModel__executeForecastRetrievalForLocation_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained forecastModel];

  id v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "WAForecastOperation completed for %@, %@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = objc_loadWeakRetained(v2);
  id v9 = [v8 error];
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v4, v9);
}

- (BOOL)hasCrossedHourlyBoundary
{
  objc_super v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(WATodayModel *)self lastUpdateDate];
  BOOL v5 = DatesAreNotWithinSameHour(v3, v4);

  return v5;
}

- (void)addObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "-[WATodayModel addObserver:]";
    __int16 v11 = 2112;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "%s self=%@, adding observer: %@", (uint8_t *)&v9, 0x20u);
  }

  [(NSHashTable *)self->_observers addObject:v4];
  if ([(WATodayModel *)self hasPendingUpdates])
  {
    uint64_t v6 = WALogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_226D1D000, v6, OS_LOG_TYPE_DEFAULT, "Has pending updates, start updating location", (uint8_t *)&v9, 2u);
    }

    [(WATodayModel *)self performDelayedUpdatesForObserver:v4];
    [(WATodayModel *)self setHasPendingUpdates:0];
    uint64_t v7 = WALogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = "-[WATodayModel addObserver:]";
      _os_log_impl(&dword_226D1D000, v7, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", (uint8_t *)&v9, 0xCu);
    }
  }
  id v8 = WALogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_226D1D000, v8, OS_LOG_TYPE_DEFAULT, "Does not have pending updates, do nothing", (uint8_t *)&v9, 2u);
  }
}

- (void)removeObserver:(id)a3
{
}

- (void)_fireTodayModelWantsUpdate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = WALogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    observers = self->_observers;
    *(_DWORD *)buf = 136315394;
    id v14 = (WATodayModel *)"-[WATodayModel _fireTodayModelWantsUpdate]";
    __int16 v15 = 2112;
    id v16 = observers;
    _os_log_impl(&dword_226D1D000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  BOOL v5 = WALogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(WATodayModel *)self hasPendingUpdates];
    *(_DWORD *)buf = 138412546;
    id v14 = self;
    __int16 v15 = 1024;
    LODWORD(v16) = v6;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "I am a WATodayModel: %@, current pending update status is %d", buf, 0x12u);
  }

  uint64_t v7 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    int v9 = WALogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = self->_observers;
      *(_DWORD *)buf = 138412290;
      id v14 = (WATodayModel *)v10;
      _os_log_impl(&dword_226D1D000, v9, OS_LOG_TYPE_DEFAULT, "Has observers:%@, update location now", buf, 0xCu);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__WATodayModel__fireTodayModelWantsUpdate__block_invoke;
    block[3] = &unk_2647E02D0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [(WATodayModel *)self setHasPendingUpdates:1];
    __int16 v11 = WALogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226D1D000, v11, OS_LOG_TYPE_DEFAULT, "Do not have observers, flag pending update to yes", buf, 2u);
    }
  }
}

void __42__WATodayModel__fireTodayModelWantsUpdate__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "todayModelWantsUpdate:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_fireTodayModelForecastWasUpdated:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = WALogForCategory(4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    observers = self->_observers;
    *(_DWORD *)buf = 136315394;
    long long v11 = "-[WATodayModel _fireTodayModelForecastWasUpdated:]";
    __int16 v12 = 2112;
    uint64_t v13 = observers;
    _os_log_impl(&dword_226D1D000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__WATodayModel__fireTodayModelForecastWasUpdated___block_invoke;
  v8[3] = &unk_2647E02F8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __50__WATodayModel__fireTodayModelForecastWasUpdated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "todayModel:forecastWasUpdated:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)performDelayedUpdatesForObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__WATodayModel_performDelayedUpdatesForObserver___block_invoke;
  v6[3] = &unk_2647E02F8;
  id v7 = v4;
  long long v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __49__WATodayModel_performDelayedUpdatesForObserver___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 todayModelWantsUpdate:v4];
  }
  return result;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
}

- (WFServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (BOOL)hasPendingUpdates
{
  return self->_hasPendingUpdates;
}

- (void)setHasPendingUpdates:(BOOL)a3
{
  self->_hasPendingUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_forecastModel, 0);
  objc_storeStrong((id *)&self->_modelOperationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_executeForecastRetrievalForLocation:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226D1D000, log, OS_LOG_TYPE_ERROR, "Tried executing a forecast retrieval for a NIL location.", v1, 2u);
}

@end