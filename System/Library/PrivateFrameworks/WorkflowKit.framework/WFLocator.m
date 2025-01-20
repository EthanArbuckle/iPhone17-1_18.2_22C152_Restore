@interface WFLocator
+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 completion:(id)a4;
+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 desiredAccuracy:(double)a4 completion:(id)a5;
+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 desiredAccuracy:(double)a4 timeout:(double)a5 completion:(id)a6;
- (BOOL)useRequestLocation;
- (CLInUseAssertion)inUseAssertion;
- (CLLocation)bestEffortLocation;
- (CLLocationManager)locationManager;
- (WFLocator)initWithWorkflowEnvironment:(int64_t)a3;
- (double)timeout;
- (id)completionHandler;
- (void)dealloc;
- (void)finishUpdatingLocation;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)requestLocation;
- (void)setBestEffortLocation:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setInUseAssertion:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setTimeout:(double)a3;
- (void)start;
- (void)startUpdatingLocation;
@end

@implementation WFLocator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_bestEffortLocation, 0);
  objc_storeStrong((id *)&self->_inUseAssertion, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setBestEffortLocation:(id)a3
{
}

- (CLLocation)bestEffortLocation
{
  return self->_bestEffortLocation;
}

- (void)setInUseAssertion:(id)a3
{
}

- (CLInUseAssertion)inUseAssertion
{
  return self->_inUseAssertion;
}

- (void)setLocationManager:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 domain];
  v7 = getkCLErrorDomain();
  if (![v6 isEqualToString:v7])
  {

LABEL_7:
    v10 = getWFWFLocatorLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[WFLocator locationManager:didFailWithError:]";
      __int16 v17 = 2112;
      id v18 = v5;
      v12 = "%s Locator failed with unknown location error (%@) — finishing";
      v13 = v10;
      uint32_t v14 = 22;
      goto LABEL_9;
    }
LABEL_10:

    [(WFLocator *)self finishUpdatingLocation];
    goto LABEL_11;
  }
  uint64_t v8 = [v5 code];

  if (v8) {
    goto LABEL_7;
  }
  BOOL v9 = [(WFLocator *)self useRequestLocation];
  v10 = getWFWFLocatorLogObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v15 = 136315138;
      v16 = "-[WFLocator locationManager:didFailWithError:]";
      v12 = "%s Locator failed with unknown location error — since we're using request location, finishing...";
      v13 = v10;
      uint32_t v14 = 12;
LABEL_9:
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, v14);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v11)
  {
    int v15 = 136315138;
    v16 = "-[WFLocator locationManager:didFailWithError:]";
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Locator failed with unknown location error — CoreLocation will continue trying to find a location", (uint8_t *)&v15, 0xCu);
  }

LABEL_11:
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getWFWFLocatorLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 136315394;
    v31 = "-[WFLocator locationManager:didUpdateLocations:]";
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s did update with locations: %@", (uint8_t *)&v30, 0x16u);
  }

  BOOL v9 = [v7 lastObject];
  if ([(WFLocator *)self useRequestLocation])
  {
    [(WFLocator *)self setBestEffortLocation:v9];
LABEL_5:
    [(WFLocator *)self finishUpdatingLocation];
    goto LABEL_25;
  }
  v10 = [v9 timestamp];
  [v10 timeIntervalSinceNow];
  double v12 = -v11;

  [(WFLocator *)self timeout];
  if (v13 < v12)
  {
    uint32_t v14 = getWFWFLocatorLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315138;
      v31 = "-[WFLocator locationManager:didUpdateLocations:]";
      int v15 = "%s Ignoring location update due to stale location age";
LABEL_23:
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v30, 0xCu);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  [v9 horizontalAccuracy];
  if (v16 < 0.0)
  {
    uint32_t v14 = getWFWFLocatorLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315138;
      v31 = "-[WFLocator locationManager:didUpdateLocations:]";
      int v15 = "%s Ignoring location update since horizontal accuracy < 0";
      goto LABEL_23;
    }
LABEL_24:

    goto LABEL_25;
  }
  uint64_t v17 = [(WFLocator *)self bestEffortLocation];
  if (v17)
  {
    id v18 = (void *)v17;
    uint64_t v19 = [(WFLocator *)self bestEffortLocation];
    [v19 horizontalAccuracy];
    double v21 = v20;
    [v9 horizontalAccuracy];
    double v23 = v22;

    if (v21 <= v23)
    {
      uint32_t v14 = getWFWFLocatorLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 136315138;
        v31 = "-[WFLocator locationManager:didUpdateLocations:]";
        int v15 = "%s Dropping due to bad accuracy / not having a best effort location";
        goto LABEL_23;
      }
      goto LABEL_24;
    }
  }
  [(WFLocator *)self setBestEffortLocation:v9];
  [v9 horizontalAccuracy];
  double v25 = v24;
  [v6 desiredAccuracy];
  double v27 = v26;
  v28 = getWFWFLocatorLogObject();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v25 <= v27)
  {
    if (v29)
    {
      int v30 = 136315138;
      v31 = "-[WFLocator locationManager:didUpdateLocations:]";
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s Location is within desired accuracy, will finish", (uint8_t *)&v30, 0xCu);
    }

    goto LABEL_5;
  }
  if (v29)
  {
    int v30 = 136315138;
    v31 = "-[WFLocator locationManager:didUpdateLocations:]";
    _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s Location is not within desired accuracy, dropping", (uint8_t *)&v30, 0xCu);
  }

LABEL_25:
}

- (void)finishUpdatingLocation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = getWFWFLocatorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(WFLocator *)self completionHandler];
    id v5 = _Block_copy(v4);
    *(_DWORD *)buf = 136315394;
    double v22 = "-[WFLocator finishUpdatingLocation]";
    __int16 v23 = 2112;
    double v24 = v5;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s finishing with completion handler: %@", buf, 0x16u);
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_finishUpdatingLocation object:0];
  id v6 = [(WFLocator *)self locationManager];
  [v6 stopUpdatingLocation];

  id v7 = [(WFLocator *)self locationManager];
  [v7 setDelegate:0];

  [(WFLocator *)self setLocationManager:0];
  uint64_t v8 = [(WFLocator *)self completionHandler];

  if (v8)
  {
    BOOL v9 = [(WFLocator *)self bestEffortLocation];
    if (v9)
    {
      v10 = [(WFLocator *)self completionHandler];
      ((void (**)(void, void *, void))v10)[2](v10, v9, 0);
    }
    else
    {
      double v11 = [MEMORY[0x1E4FB46B8] currentDevice];
      if ([v11 hasCapability:*MEMORY[0x1E4FB4C90]]) {
        double v12 = @"Make sure your device isn’t in Airplane Mode and try again; turning WLAN on may help.";
      }
      else {
        double v12 = @"Make sure your device isn’t in Airplane Mode and try again; turning Wi-Fi on may help.";
      }
      WFLocalizedString(v12);
      v10 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();

      double v13 = [(WFLocator *)self completionHandler];
      uint32_t v14 = (void *)MEMORY[0x1E4F28C58];
      int v15 = getkCLErrorDomain();
      v19[0] = *MEMORY[0x1E4F28588];
      double v16 = WFLocalizedString(@"Shortcuts was unable to find your current location.");
      v19[1] = *MEMORY[0x1E4F28568];
      v20[0] = v16;
      v20[1] = v10;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      id v18 = objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 0, v17, v19[0]);
      ((void (**)(void, void, void *))v13)[2](v13, 0, v18);
    }
  }
}

- (void)startUpdatingLocation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = getWFWFLocatorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[WFLocator startUpdatingLocation]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s startUpdatingLocation", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(WFLocator *)self locationManager];
  [v4 startUpdatingLocation];

  [(WFLocator *)self timeout];
  -[WFLocator performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_finishUpdatingLocation, 0);
}

- (void)requestLocation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = getWFWFLocatorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[WFLocator requestLocation]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s requestLocation", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(WFLocator *)self locationManager];
  [v4 requestLocation];
}

- (void)start
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = getWFWFLocatorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[WFLocator start]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting locator...", (uint8_t *)&v4, 0xCu);
  }

  if ([(WFLocator *)self useRequestLocation]) {
    [(WFLocator *)self requestLocation];
  }
  else {
    [(WFLocator *)self startUpdatingLocation];
  }
}

- (BOOL)useRequestLocation
{
  return 1;
}

- (void)dealloc
{
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  [(CLInUseAssertion *)self->_inUseAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WFLocator;
  [(WFLocator *)&v3 dealloc];
}

- (WFLocator)initWithWorkflowEnvironment:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)WFLocator;
  int v4 = [(WFLocator *)&v13 init];
  if (v4)
  {
    uint64_t v5 = WFCLLocationManagerWithOptions(a3, v4, MEMORY[0x1E4F14428]);
    locationManager = v4->_locationManager;
    v4->_locationManager = (CLLocationManager *)v5;

    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = WFCLInUseAssertionWithOptions(a3, v8);
    inUseAssertion = v4->_inUseAssertion;
    v4->_inUseAssertion = (CLInUseAssertion *)v9;

    double v11 = v4;
  }

  return v4;
}

+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 desiredAccuracy:(double)a4 timeout:(double)a5 completion:(id)a6
{
  id v9 = a6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__WFLocator_determineLocationWithWorkflowEnvironment_desiredAccuracy_timeout_completion___block_invoke;
  v11[3] = &unk_1E65559E0;
  double v14 = a4;
  double v15 = a5;
  id v12 = v9;
  int64_t v13 = a3;
  id v10 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __89__WFLocator_determineLocationWithWorkflowEnvironment_desiredAccuracy_timeout_completion___block_invoke(uint64_t a1)
{
  v2 = [[WFLocator alloc] initWithWorkflowEnvironment:*(void *)(a1 + 40)];
  double v3 = *(double *)(a1 + 48);
  int v4 = [(WFLocator *)v2 locationManager];
  [v4 setDesiredAccuracy:v3];

  [(WFLocator *)v2 setTimeout:*(double *)(a1 + 56)];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__57453;
  v12[4] = __Block_byref_object_dispose__57454;
  uint64_t v5 = v2;
  int64_t v13 = v5;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __89__WFLocator_determineLocationWithWorkflowEnvironment_desiredAccuracy_timeout_completion___block_invoke_18;
  id v9 = &unk_1E65559B8;
  id v10 = *(id *)(a1 + 32);
  double v11 = v12;
  [(WFLocator *)v5 setCompletionHandler:&v6];
  [(WFLocator *)v5 start];

  _Block_object_dispose(v12, 8);
}

void __89__WFLocator_determineLocationWithWorkflowEnvironment_desiredAccuracy_timeout_completion___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 desiredAccuracy:(double)a4 completion:(id)a5
{
}

+ (void)determineLocationWithWorkflowEnvironment:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  getkCLLocationAccuracyNearestTenMeters();
  objc_msgSend(a1, "determineLocationWithWorkflowEnvironment:desiredAccuracy:completion:", a3, v6);
}

@end