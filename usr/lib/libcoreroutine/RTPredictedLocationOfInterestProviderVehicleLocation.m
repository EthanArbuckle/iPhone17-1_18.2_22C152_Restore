@interface RTPredictedLocationOfInterestProviderVehicleLocation
- (BOOL)parkingEventIsUsualAndNearHome:(id)a3;
- (BOOL)requiresRoutineEnablement;
- (RTDistanceCalculator)distanceCalculator;
- (RTPredictedLocationOfInterestProviderVehicleLocation)init;
- (RTPredictedLocationOfInterestProviderVehicleLocation)initWithVehicleLocationProvider:(id)a3 distanceCalculator:(id)a4;
- (RTVehicleLocationProvider)vehicleLocationProvider;
- (id)locationOfInterestFromVehicleEvent:(id)a3;
- (id)predictedLocationOfInterestFromVehicleEvent:(id)a3;
- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4;
- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4;
- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4;
@end

@implementation RTPredictedLocationOfInterestProviderVehicleLocation

- (BOOL)requiresRoutineEnablement
{
  return 0;
}

- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  vehicleLocationProvider = self->_vehicleLocationProvider;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __114__RTPredictedLocationOfInterestProviderVehicleLocation_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke;
  v11[3] = &unk_1E6B92320;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(RTVehicleLocationProvider *)vehicleLocationProvider fetchLastVehicleEventsWithHandler:v11];
}

void __114__RTPredictedLocationOfInterestProviderVehicleLocation_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [v5 firstObject];
    if ([*(id *)(a1 + 32) parkingEventIsUsualAndNearHome:v7])
    {
      v8 = _rt_log_facility_get_os_log(RTLogFacilityVehicleLocation);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [v7 nearbyLocationOfInterest];
        int v10 = 138412546;
        v11 = v7;
        __int16 v12 = 2112;
        id v13 = v9;
        _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "suppressing vehicle event, %@, nearby location of interest, %@. location of vehicle event is too close to home", (uint8_t *)&v10, 0x16u);
LABEL_9:
      }
    }
    else
    {
      v8 = [*(id *)(a1 + 32) predictedLocationOfInterestFromVehicleEvent:v7];
      if (v8)
      {
        id v9 = (void *)[*(id *)(a1 + 40) copy];
        [v9 setMinimumDistance:0.0];
        [v9 setMaximumDistance:144000.0];
        if ([v9 evaluatePredictedLocationOfInterest:v8]) {
          [v6 addObject:v8];
        }
        goto LABEL_9;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_11;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_11:
}

- (id)predictedLocationOfInterestFromVehicleEvent:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 date];
    [v5 timeIntervalSinceNow];
    double v7 = v6;

    if (v7 <= 432000.0) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
    id v9 = [(RTPredictedLocationOfInterestProviderVehicleLocation *)self locationOfInterestFromVehicleEvent:v4];
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CEF0]) initWithVehicleEvent:v4];

    id v11 = objc_alloc(MEMORY[0x1E4F5CEA0]);
    v15[0] = v10;
    __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v13 = (void *)[v11 initWithLocationOfInterest:v9 confidence:0 nextEntryTime:0 modeOfTransportation:v12 sources:v8];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)parkingEventIsUsualAndNearHome:(id)a3
{
  id v3 = a3;
  id v4 = [v3 nearbyLocationOfInterest];
  int v5 = [v3 usualLocation];

  BOOL v6 = 0;
  if (v5 && v4) {
    BOOL v6 = [v4 type] == 0;
  }

  return v6;
}

- (RTPredictedLocationOfInterestProviderVehicleLocation)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithVehicleLocationProvider_distanceCalculator_);
}

- (RTPredictedLocationOfInterestProviderVehicleLocation)initWithVehicleLocationProvider:(id)a3 distanceCalculator:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTPredictedLocationOfInterestProviderVehicleLocation initWithVehicleLocationProvider:distanceCalculator:]";
      __int16 v19 = 1024;
      int v20 = 33;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: vehicleLocationProvider (in %s:%d)", buf, 0x12u);
    }

    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v8)
  {
LABEL_9:
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTPredictedLocationOfInterestProviderVehicleLocation initWithVehicleLocationProvider:distanceCalculator:]";
      __int16 v19 = 1024;
      int v20 = 34;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    __int16 v12 = 0;
    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTPredictedLocationOfInterestProviderVehicleLocation;
  int v10 = [(RTPredictedLocationOfInterestProviderVehicleLocation *)&v16 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_vehicleLocationProvider, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  __int16 v12 = self;
LABEL_13:

  return v12;
}

- (id)locationOfInterestFromVehicleEvent:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F5CE10];
    id v4 = a3;
    id v5 = [v3 alloc];
    BOOL v6 = [v4 location];
    id v7 = [v4 identifier];
    id v8 = [v4 mapItem];

    id v9 = (void *)[v5 initWithLocation:v6 confidence:v7 identifier:-1 type:0 typeSource:0 visits:0 customLabel:1.0 mapItem:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
}

- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4
{
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);

  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
}

@end