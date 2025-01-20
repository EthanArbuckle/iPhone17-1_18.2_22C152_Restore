@interface SKUINearMeController
+ (id)sharedController;
+ (void)sharedController;
- (BOOL)isNearMeLocationStatusEnabled;
- (NSArray)items;
- (NSDictionary)responseDictionary;
- (SKUIClientContext)clientContext;
- (SKUINearMeController)init;
- (int64_t)status;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_disableNearMe;
- (void)_finishLookupWithItems:(id)a3 response:(id)a4 error:(id)a5;
- (void)_lookupItemsForLocation:(id)a3;
- (void)_monitorLocationTimeout;
- (void)_refreshTimeout;
- (void)_setItems:(id)a3 responseDictionary:(id)a4 error:(id)a5 status:(int64_t)a6;
- (void)_startMonitoringLocation;
- (void)_startRefreshTimer;
- (void)_stopMonitoringLocation;
- (void)_stopRefreshTimer;
- (void)init;
- (void)itemStateCenterRestrictionsChanged:(id)a3;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setClientContext:(id)a3;
@end

@implementation SKUINearMeController

+ (id)sharedController
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUINearMeController sharedController]();
  }
  if (sharedController_sOnce != -1) {
    dispatch_once(&sharedController_sOnce, &__block_literal_global_41);
  }
  v2 = (void *)sharedController_sNearMeController;

  return v2;
}

uint64_t __40__SKUINearMeController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(SKUINearMeController);
  uint64_t v1 = sharedController_sNearMeController;
  sharedController_sNearMeController = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (SKUINearMeController)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUINearMeController init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUINearMeController;
  v3 = [(SKUINearMeController *)&v7 init];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];
    v5 = +[SKUIItemStateCenter defaultCenter];
    [v5 addObserver:v3];
  }
  return v3;
}

- (NSArray)items
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = +[SKUIItemStateCenter defaultCenter];
  uint64_t v5 = [v4 parentalControlsRank];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_items;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "parentalControlsRank", (void)v13) <= v5) {
          [v3 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (BOOL)isNearMeLocationStatusEnabled
{
  uint64_t v2 = SKUICoreLocationFramework();
  int v3 = objc_msgSend(SKUIWeakLinkedClassForString(&cfstr_Cllocationmana.isa, v2), "authorizationStatus");

  return SKUINearMeIsEnabledForAuthorizationStatus(v3);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (self->_refreshTimer) {
    [(SKUINearMeController *)self _startMonitoringLocation];
  }
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__SKUINearMeController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__SKUINearMeController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setItems:*(void *)(*(void *)(a1 + 32) + 8) responseDictionary:0 error:0 status:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (SKUINearMeIsEnabledForAuthorizationStatus(a4))
  {
    [(SKUINearMeController *)self _startMonitoringLocation];
  }
  else if (a4)
  {
    [(SKUINearMeController *)self _disableNearMe];
  }
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v14 = @"nearMeEnabled";
  uint64_t v7 = [NSNumber numberWithBool:SKUINearMeIsEnabledForAuthorizationStatus(a4)];
  v15[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v6 postNotificationName:@"SKUINearMeLocationStatusDidChangeNotification" object:v8];

  if (a4 == 2 && !self->_authorizationStatus)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1420]);
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"NEAR_ME_LOCATION_ALERT"];
    }
    else {
    v11 = +[SKUIClientContext localizedStringForKey:@"NEAR_ME_LOCATION_ALERT" inBundles:0];
    }
    [v9 setTitle:v11];

    v12 = self->_clientContext;
    if (v12) {
      [(SKUIClientContext *)v12 localizedStringForKey:@"OK"];
    }
    else {
    long long v13 = +[SKUIClientContext localizedStringForKey:@"OK" inBundles:0];
    }
    objc_msgSend(v9, "setCancelButtonIndex:", objc_msgSend(v9, "addButtonWithTitle:", v13));

    [v9 show];
  }
  self->_authorizationStatus = a4;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3) == 1)
  {
    [(SKUINearMeController *)self _disableNearMe];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v9 = a4;
  uint64_t v5 = [v9 count];
  id v6 = v9;
  if (v5)
  {
    uint64_t v7 = [v9 lastObject];
    [v7 horizontalAccuracy];
    if (v8 > 0.00000011920929 && v8 <= 65.0 && SKUILocationIsAccurate(v7)) {
      [(SKUINearMeController *)self _lookupItemsForLocation:v7];
    }

    id v6 = v9;
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_startMonitoringLocation
{
  [(SKUINearMeController *)self _stopRefreshTimer];
  if (!self->_isMonitoring && !self->_lookupRequest)
  {
    if (!self->_locationManager)
    {
      uint64_t v3 = SKUICoreLocationFramework();
      v4 = (CLLocationManager *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Cllocationmana.isa, v3));
      locationManager = self->_locationManager;
      self->_locationManager = v4;

      [(CLLocationManager *)self->_locationManager setDelegate:self];
      id v6 = (void *)SKUICoreLocationFramework();
      uint64_t v7 = (double *)SKUIWeakLinkedSymbolForString("kCLLocationAccuracyBest", v6);
      if (v7) {
        [(CLLocationManager *)self->_locationManager setDesiredAccuracy:*v7];
      }
    }
    int v8 = [(id)objc_opt_class() authorizationStatus];
    self->_authorizationStatus = v8;
    if (!v8) {
      [(CLLocationManager *)self->_locationManager requestWhenInUseAuthorization];
    }
    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
    self->_isMonitoring = 1;
    if (!self->_locationTimeoutTimer)
    {
      objc_initWeak(&location, self);
      id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      locationTimeoutTimer = self->_locationTimeoutTimer;
      self->_locationTimeoutTimer = v9;

      v11 = self->_locationTimeoutTimer;
      dispatch_time_t v12 = dispatch_time(0, 2500000000);
      dispatch_source_set_timer(v11, v12, 0, 0);
      long long v13 = self->_locationTimeoutTimer;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __48__SKUINearMeController__startMonitoringLocation__block_invoke;
      v14[3] = &unk_1E6422250;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v13, v14);
      dispatch_resume((dispatch_object_t)self->_locationTimeoutTimer);
      self->_locationTimeoutCount = 0;
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __48__SKUINearMeController__startMonitoringLocation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _monitorLocationTimeout];
}

- (void)_stopMonitoringLocation
{
  if (self->_isMonitoring)
  {
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    self->_isMonitoring = 0;
  }
  locationTimeoutTimer = self->_locationTimeoutTimer;
  if (locationTimeoutTimer)
  {
    dispatch_source_cancel(locationTimeoutTimer);
    v4 = self->_locationTimeoutTimer;
    self->_locationTimeoutTimer = 0;
  }
}

- (void)_monitorLocationTimeout
{
  uint64_t v3 = [(CLLocationManager *)self->_locationManager location];
  id v7 = v3;
  if (v3 && SKUILocationIsAccurate(v3))
  {
    [(SKUINearMeController *)self _lookupItemsForLocation:v7];
  }
  else
  {
    int64_t locationTimeoutCount = self->_locationTimeoutCount;
    self->_int64_t locationTimeoutCount = locationTimeoutCount + 1;
    if (locationTimeoutCount > 2)
    {
      [(SKUINearMeController *)self _stopMonitoringLocation];
      [(SKUINearMeController *)self _setItems:MEMORY[0x1E4F1CBF0] responseDictionary:0 error:0 status:2];
      [(SKUINearMeController *)self _startRefreshTimer];
    }
    else
    {
      locationTimeoutTimer = self->_locationTimeoutTimer;
      dispatch_time_t v6 = dispatch_time(0, 2500000000);
      dispatch_source_set_timer(locationTimeoutTimer, v6, 0, 0);
    }
  }
}

- (void)_lookupItemsForLocation:(id)a3
{
  id v4 = a3;
  [(SKUINearMeController *)self _stopMonitoringLocation];
  [(SKUINearMeController *)self _stopRefreshTimer];
  if (!self->_lookupRequest)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (SSLookupRequest *)[objc_alloc(MEMORY[0x1E4FA81F0]) initWithLocation:v4];
    lookupRequest = self->_lookupRequest;
    self->_lookupRequest = v5;

    [(SSLookupRequest *)self->_lookupRequest setKeyProfile:*MEMORY[0x1E4FA86D0]];
    id v7 = self->_lookupRequest;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__SKUINearMeController__lookupItemsForLocation___block_invoke;
    v8[3] = &unk_1E64240D8;
    objc_copyWeak(&v9, &location);
    [(SSLookupRequest *)v7 startWithLookupBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __48__SKUINearMeController__lookupItemsForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v18 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_time_t v6 = [v4 allItems];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
        dispatch_time_t v12 = [SKUISearchItem alloc];
        long long v13 = [v11 lookupDictionary];
        long long v14 = [(SKUISearchItem *)v12 initWithLookupDictionary:v13];

        if (v14) {
          [v5 addObject:v14];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SKUINearMeController__lookupItemsForLocation___block_invoke_2;
  block[3] = &unk_1E6422110;
  objc_copyWeak(&v24, (id *)(a1 + 32));
  id v21 = v5;
  id v22 = v4;
  id v23 = v18;
  id v15 = v18;
  id v16 = v4;
  id v17 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v24);
}

void __48__SKUINearMeController__lookupItemsForLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finishLookupWithItems:*(void *)(a1 + 32) response:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_finishLookupWithItems:(id)a3 response:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [a4 responseDictionary];
  [(SKUINearMeController *)self _setItems:v9 responseDictionary:v10 error:v8 status:1];

  [(SKUINearMeController *)self _startRefreshTimer];
  lookupRequest = self->_lookupRequest;
  self->_lookupRequest = 0;
}

- (void)_startRefreshTimer
{
  if (!self->_refreshTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v3;

    id v5 = self->_refreshTimer;
    dispatch_time_t v6 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v5, v6, 0, 0);
    uint64_t v7 = self->_refreshTimer;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__SKUINearMeController__startRefreshTimer__block_invoke;
    v8[3] = &unk_1E6422250;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_refreshTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __42__SKUINearMeController__startRefreshTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshTimeout];
}

- (void)_stopRefreshTimer
{
  refreshTimer = self->_refreshTimer;
  if (refreshTimer)
  {
    dispatch_source_cancel(refreshTimer);
    id v4 = self->_refreshTimer;
    self->_refreshTimer = 0;
  }
}

- (void)_refreshTimeout
{
  [(SKUINearMeController *)self _stopRefreshTimer];

  [(SKUINearMeController *)self _startMonitoringLocation];
}

- (void)_setItems:(id)a3 responseDictionary:(id)a4 error:(id)a5 status:(int64_t)a6
{
  id v9 = (NSArray *)a3;
  uint64_t v10 = (NSDictionary *)a4;
  items = self->_items;
  self->_items = v9;
  dispatch_time_t v12 = v9;

  self->_status = a6;
  responseDictionary = self->_responseDictionary;
  self->_responseDictionary = v10;
  long long v14 = v10;

  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];

  [v15 postNotificationName:@"SKUINearMeItemsDidChangeNotification" object:self];
}

- (void)_disableNearMe
{
  [(SKUINearMeController *)self _stopMonitoringLocation];
  [(SKUINearMeController *)self _stopRefreshTimer];

  [(SKUINearMeController *)self _setItems:0 responseDictionary:0 error:0 status:0];
}

- (int64_t)status
{
  return self->_status;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_locationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lookupRequest, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

+ (void)sharedController
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "+[SKUINearMeController sharedController]";
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUINearMeController init]";
}

@end