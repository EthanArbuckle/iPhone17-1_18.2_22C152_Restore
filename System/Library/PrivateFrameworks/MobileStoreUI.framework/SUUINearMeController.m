@interface SUUINearMeController
+ (id)sharedController;
- (BOOL)isNearMeLocationStatusEnabled;
- (NSArray)items;
- (NSDictionary)responseDictionary;
- (SUUIClientContext)clientContext;
- (SUUINearMeController)init;
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
- (void)itemStateCenterRestrictionsChanged:(id)a3;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setClientContext:(id)a3;
@end

@implementation SUUINearMeController

+ (id)sharedController
{
  if (sharedController_sOnce != -1) {
    dispatch_once(&sharedController_sOnce, &__block_literal_global_2);
  }
  v2 = (void *)sharedController_sNearMeController;
  return v2;
}

uint64_t __40__SUUINearMeController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(SUUINearMeController);
  uint64_t v1 = sharedController_sNearMeController;
  sharedController_sNearMeController = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SUUINearMeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUUINearMeController;
  v2 = [(SUUINearMeController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
    v4 = +[SUUIItemStateCenter defaultCenter];
    [v4 addObserver:v2];
  }
  return v2;
}

- (NSArray)items
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = +[SUUIItemStateCenter defaultCenter];
  uint64_t v5 = [v4 parentalControlsRank];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v6 = self->_items;
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
  uint64_t v2 = SUUICoreLocationFramework();
  return objc_msgSend(SUUIWeakLinkedClassForString(&cfstr_Cllocationmana.isa, v2), "authorizationStatus")
       - 3 < 2;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (self->_refreshTimer) {
    [(SUUINearMeController *)self _startMonitoringLocation];
  }
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUUINearMeController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_265400980;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__SUUINearMeController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setItems:*(void *)(*(void *)(a1 + 32) + 8) responseDictionary:0 error:0 status:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((a4 - 3) > 1)
  {
    if (a4) {
      [(SUUINearMeController *)self _disableNearMe];
    }
  }
  else
  {
    [(SUUINearMeController *)self _startMonitoringLocation];
  }
  uint64_t v7 = [MEMORY[0x263F08A00] defaultCenter];
  long long v15 = @"nearMeEnabled";
  uint64_t v8 = [NSNumber numberWithBool:(a4 - 3) < 2];
  v16[0] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v7 postNotificationName:@"SUUINearMeLocationStatusDidChangeNotification" object:v9];

  if (a4 == 2 && !self->_authorizationStatus)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F82420]);
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"NEAR_ME_LOCATION_ALERT"];
    }
    else {
    v12 = +[SUUIClientContext localizedStringForKey:@"NEAR_ME_LOCATION_ALERT" inBundles:0];
    }
    [v10 setTitle:v12];

    long long v13 = self->_clientContext;
    if (v13) {
      [(SUUIClientContext *)v13 localizedStringForKey:@"OK"];
    }
    else {
    long long v14 = +[SUUIClientContext localizedStringForKey:@"OK" inBundles:0];
    }
    objc_msgSend(v10, "setCancelButtonIndex:", objc_msgSend(v10, "addButtonWithTitle:", v14));

    [v10 show];
  }
  self->_authorizationStatus = a4;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3) == 1)
  {
    [(SUUINearMeController *)self _disableNearMe];
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
    if (v8 > 0.00000011920929 && v8 <= 65.0 && SUUILocationIsAccurate(v7)) {
      [(SUUINearMeController *)self _lookupItemsForLocation:v7];
    }

    id v6 = v9;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)_startMonitoringLocation
{
  [(SUUINearMeController *)self _stopRefreshTimer];
  if (!self->_isMonitoring && !self->_lookupRequest)
  {
    if (!self->_locationManager)
    {
      uint64_t v3 = SUUICoreLocationFramework();
      v4 = (CLLocationManager *)objc_alloc_init((Class)SUUIWeakLinkedClassForString(&cfstr_Cllocationmana.isa, v3));
      locationManager = self->_locationManager;
      self->_locationManager = v4;

      [(CLLocationManager *)self->_locationManager setDelegate:self];
      id v6 = (void *)SUUICoreLocationFramework();
      uint64_t v7 = (double *)SUUIWeakLinkedSymbolForString("kCLLocationAccuracyBest", v6);
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
      id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      locationTimeoutTimer = self->_locationTimeoutTimer;
      self->_locationTimeoutTimer = v9;

      v11 = self->_locationTimeoutTimer;
      dispatch_time_t v12 = dispatch_time(0, 2500000000);
      dispatch_source_set_timer(v11, v12, 0, 0);
      long long v13 = self->_locationTimeoutTimer;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __48__SUUINearMeController__startMonitoringLocation__block_invoke;
      v14[3] = &unk_265401538;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v13, v14);
      dispatch_resume((dispatch_object_t)self->_locationTimeoutTimer);
      self->_locationTimeoutCount = 0;
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __48__SUUINearMeController__startMonitoringLocation__block_invoke(uint64_t a1)
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
  if (v3 && SUUILocationIsAccurate(v3))
  {
    [(SUUINearMeController *)self _lookupItemsForLocation:v7];
  }
  else
  {
    int64_t locationTimeoutCount = self->_locationTimeoutCount;
    self->_int64_t locationTimeoutCount = locationTimeoutCount + 1;
    if (locationTimeoutCount > 2)
    {
      [(SUUINearMeController *)self _stopMonitoringLocation];
      [(SUUINearMeController *)self _setItems:MEMORY[0x263EFFA68] responseDictionary:0 error:0 status:2];
      [(SUUINearMeController *)self _startRefreshTimer];
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
  [(SUUINearMeController *)self _stopMonitoringLocation];
  [(SUUINearMeController *)self _stopRefreshTimer];
  if (!self->_lookupRequest)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = (SSLookupRequest *)[objc_alloc(MEMORY[0x263F7B210]) initWithLocation:v4];
    lookupRequest = self->_lookupRequest;
    self->_lookupRequest = v5;

    [(SSLookupRequest *)self->_lookupRequest setKeyProfile:*MEMORY[0x263F7B9B0]];
    id v7 = self->_lookupRequest;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__SUUINearMeController__lookupItemsForLocation___block_invoke;
    v8[3] = &unk_265401588;
    objc_copyWeak(&v9, &location);
    [(SSLookupRequest *)v7 startWithLookupBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __48__SUUINearMeController__lookupItemsForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v18 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
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
        dispatch_time_t v12 = [SUUISearchItem alloc];
        long long v13 = [v11 lookupDictionary];
        long long v14 = [(SUUISearchItem *)v12 initWithLookupDictionary:v13];

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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SUUINearMeController__lookupItemsForLocation___block_invoke_2;
  block[3] = &unk_265401560;
  objc_copyWeak(&v24, (id *)(a1 + 32));
  id v21 = v5;
  id v22 = v4;
  id v23 = v18;
  id v15 = v18;
  id v16 = v4;
  id v17 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v24);
}

void __48__SUUINearMeController__lookupItemsForLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finishLookupWithItems:*(void *)(a1 + 32) response:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_finishLookupWithItems:(id)a3 response:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [a4 responseDictionary];
  [(SUUINearMeController *)self _setItems:v9 responseDictionary:v10 error:v8 status:1];

  [(SUUINearMeController *)self _startRefreshTimer];
  lookupRequest = self->_lookupRequest;
  self->_lookupRequest = 0;
}

- (void)_startRefreshTimer
{
  if (!self->_refreshTimer)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v3;

    id v5 = self->_refreshTimer;
    dispatch_time_t v6 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v5, v6, 0, 0);
    uint64_t v7 = self->_refreshTimer;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__SUUINearMeController__startRefreshTimer__block_invoke;
    v8[3] = &unk_265401538;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_refreshTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __42__SUUINearMeController__startRefreshTimer__block_invoke(uint64_t a1)
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
  [(SUUINearMeController *)self _stopRefreshTimer];
  [(SUUINearMeController *)self _startMonitoringLocation];
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

  id v15 = [MEMORY[0x263F08A00] defaultCenter];

  [v15 postNotificationName:@"SUUINearMeItemsDidChangeNotification" object:self];
}

- (void)_disableNearMe
{
  [(SUUINearMeController *)self _stopMonitoringLocation];
  [(SUUINearMeController *)self _stopRefreshTimer];
  [(SUUINearMeController *)self _setItems:0 responseDictionary:0 error:0 status:0];
}

- (int64_t)status
{
  return self->_status;
}

- (SUUIClientContext)clientContext
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

@end