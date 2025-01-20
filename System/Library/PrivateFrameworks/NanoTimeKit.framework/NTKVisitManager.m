@interface NTKVisitManager
+ (id)fallbackVisit;
+ (id)sharedVisitManager;
- (id)anyVisit;
- (id)currentVisit;
- (id)previousVisit;
- (id)startVisitUpdatesWithIdentifier:(id)a3 handler:(id)a4;
- (void)stopVisitUpdatesForToken:(id)a3;
@end

@implementation NTKVisitManager

+ (id)sharedVisitManager
{
  if (sharedVisitManager_onceToken != -1) {
    dispatch_once(&sharedVisitManager_onceToken, &__block_literal_global_83);
  }
  v2 = (void *)sharedVisitManager_visitManager;
  return v2;
}

void __37__NTKVisitManager_sharedVisitManager__block_invoke()
{
  v0 = objc_alloc_init(NTKSimulatedVisitManager);
  v1 = (void *)sharedVisitManager_visitManager;
  sharedVisitManager_visitManager = (uint64_t)v0;
}

+ (id)fallbackVisit
{
  id v2 = objc_alloc(MEMORY[0x1E4F1E688]);
  CLLocationCoordinate2D v3 = CLLocationCoordinate2DMake(37.3353672, -122.011737);
  double v4 = *MEMORY[0x1E4F1E6D8];
  v5 = +[CLKDate unmodifiedDate];
  v6 = +[CLKDate unmodifiedDate];
  v7 = +[CLKDate unmodifiedDate];
  v8 = objc_msgSend(v2, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:", v5, v6, v7, v3.latitude, v3.longitude, v4);

  return v8;
}

- (id)anyVisit
{
  id v2 = objc_opt_class();
  return (id)[v2 fallbackVisit];
}

- (id)startVisitUpdatesWithIdentifier:(id)a3 handler:(id)a4
{
  return &stru_1F1635E90;
}

- (void)stopVisitUpdatesForToken:(id)a3
{
  OUTLINED_FUNCTION_1_6();
  NSRequestConcreteImplementation();
}

- (id)currentVisit
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1();
  id v2 = objc_opt_class();
  return (id)[v2 fallbackVisit];
}

- (id)previousVisit
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_1();
  id v2 = objc_opt_class();
  return (id)[v2 fallbackVisit];
}

@end