@interface RTMotionActivityManager
+ (BOOL)supportsNotificationName:(id)a3;
+ (RTMotionActivityManager)allocWithZone:(_NSZone *)a3;
+ (double)ratioOfMotionActivityType:(unint64_t)a3 forActivities:(id)a4 startDate:(id)a5 endDate:(id)a6;
+ (id)activityAlarmTriggerToString:(int64_t)a3;
+ (id)motionActivityVehicleConnectedStateToString:(unint64_t)a3;
+ (id)motionSettledStateToString:(unint64_t)a3;
+ (void)removeActivities:(id)a3 stoppedBeforeDate:(id)a4;
- (RTMotionActivityManager)init;
- (RTMotionActivityManager)initWithPlatform:(id)a3 vehicleStore:(id)a4;
- (RTPlatform)platform;
- (RTVehicleStore)vehicleStore;
- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5;
- (void)_fetchPredominantMotionActivityWithHandler:(id)a3;
- (void)_subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4;
- (void)_unsubscribeForPedometerData:(id)a3;
- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5;
- (void)fetchPredominantMotionActivityWithHandler:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4;
- (void)unsubscribeForPedometerData:(id)a3;
@end

@implementation RTMotionActivityManager

+ (RTMotionActivityManager)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (RTMotionActivityManager *)+[RTMotionActivityManager allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTMotionActivityManager;
    return (RTMotionActivityManager *)[super allocWithZone:a3];
  }
}

- (RTMotionActivityManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlatform_vehicleStore_);
}

- (RTMotionActivityManager)initWithPlatform:(id)a3 vehicleStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RTMotionActivityManager;
  v9 = [(RTNotifier *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_platform, a3);
    objc_storeStrong((id *)&v10->_vehicleStore, a4);
  }

  return v10;
}

+ (id)motionActivityVehicleConnectedStateToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Invalid";
  }
  else {
    return off_1E6B97400[a3];
  }
}

+ (id)motionSettledStateToString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Invalid";
  }
  else {
    return off_1E6B97418[a3];
  }
}

+ (id)activityAlarmTriggerToString:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xB) {
    return @"Invalid";
  }
  else {
    return off_1E6B97430[a3 + 1];
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  if (([(id)objc_opt_class() supportsNotificationName:v4] & 1) == 0)
  {
    v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3 = a3;
  id v4 = +[RTNotification notificationName];
  if ([v3 isEqualToString:v4])
  {
    char v5 = 1;
  }
  else
  {
    int v6 = +[RTNotification notificationName];
    if ([v3 isEqualToString:v6])
    {
      char v5 = 1;
    }
    else
    {
      id v7 = +[RTNotification notificationName];
      if ([v3 isEqualToString:v7])
      {
        char v5 = 1;
      }
      else
      {
        uint64_t v8 = +[RTNotification notificationName];
        if ([v3 isEqualToString:v8])
        {
          char v5 = 1;
        }
        else
        {
          v9 = +[RTNotification notificationName];
          if ([v3 isEqualToString:v9])
          {
            char v5 = 1;
          }
          else
          {
            v10 = +[RTNotification notificationName];
            char v5 = [v3 isEqualToString:v10];
          }
        }
      }
    }
  }
  return v5;
}

- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__RTMotionActivityManager_fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke;
    v12[3] = &unk_1E6B91490;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v11, v12);
  }
}

uint64_t __78__RTMotionActivityManager_fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchMotionActivitiesFromStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Not supported on this platform.";
    char v5 = (void *)MEMORY[0x1E4F1C9E8];
    int v6 = (void (**)(id, void, void *))a5;
    id v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v7];
    v6[2](v6, 0, v8);
  }
}

- (void)fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = [(RTNotifier *)self queue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__RTMotionActivityManager_fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke;
    v12[3] = &unk_1E6B91490;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v11, v12);
  }
}

uint64_t __97__RTMotionActivityManager_fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPredominantMotionActivityTypeFromStartDate:*(void *)(a1 + 40) toEndDate:*(void *)(a1 + 48) withHandler:*(void *)(a1 + 56)];
}

- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = @"Not supported on this platform.";
  char v5 = (void *)MEMORY[0x1E4F1C9E8];
  int v6 = (void (**)(id, void, void *))a5;
  id v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v7];
  v6[2](v6, 0, v8);
}

- (void)fetchPredominantMotionActivityWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69__RTMotionActivityManager_fetchPredominantMotionActivityWithHandler___block_invoke;
    v6[3] = &unk_1E6B90CE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __69__RTMotionActivityManager_fetchPredominantMotionActivityWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPredominantMotionActivityWithHandler:*(void *)(a1 + 40)];
}

- (void)_fetchPredominantMotionActivityWithHandler:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Not supported on this platform.";
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = (void (**)(id, void, void *))a3;
  char v5 = [v3 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v5];
  v4[2](v4, 0, v6);
}

- (void)subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__RTMotionActivityManager_subscribeForPedometerDataWithStartDate_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __74__RTMotionActivityManager_subscribeForPedometerDataWithStartDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _subscribeForPedometerDataWithStartDate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"Not supported on this platform.";
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a4;
  id v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v6];
  (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v7);
}

- (void)unsubscribeForPedometerData:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__RTMotionActivityManager_unsubscribeForPedometerData___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __55__RTMotionActivityManager_unsubscribeForPedometerData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unsubscribeForPedometerData:*(void *)(a1 + 40)];
}

- (void)_unsubscribeForPedometerData:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = @"Not supported on this platform.";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v3];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "error, %@", (uint8_t *)&v6, 0xCu);
  }
}

+ (void)removeActivities:(id)a3 stoppedBeforeDate:(id)a4
{
  id v5 = a3;
  if (v5 && a4)
  {
    int v6 = (objc_class *)MEMORY[0x1E4F28C18];
    id v10 = v5;
    id v7 = a4;
    uint64_t v8 = (void *)[[v6 alloc] initWithStartDate:v7 duration:0.0];

    unint64_t v9 = [v10 indexOfObject:v8 inSortedRange:0 options:1280 usingComparator:&__block_literal_global_194_0];
    if (v9 >= 2) {
      [v10 removeObjectsInRange:0, v9 - 1];
    }

    id v5 = v10;
  }
}

uint64_t __62__RTMotionActivityManager_removeActivities_stoppedBeforeDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  int v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (double)ratioOfMotionActivityType:(unint64_t)a3 forActivities:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = v11;
  double v13 = 0.0;
  if (v10 && v11 && [v10 compare:v11] == -1)
  {
    id v14 = [[RTMotionActivityHistogram alloc] initWithActivites:v9 betweenDate:v10 andDate:v12];
    id v15 = [(RTMotionActivityHistogram *)v14 binForType:a3];
    [v15 interval];
    double v17 = v16;
    [v12 timeIntervalSinceDate:v10];
    double v13 = v17 / v18;
  }
  return v13;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (RTVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleStore, 0);

  objc_storeStrong((id *)&self->_platform, 0);
}

void __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processDominantActivity];
}

void __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke_95(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [[RTMotionActivityManagerNotificationVehicleConnected alloc] initWithVehicleConnectedState:2 deviceId:@"Simulated vehicle"];
  [WeakRetained postNotification:v1];
}

void __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [[RTMotionActivityManagerNotificationVehicleConnected alloc] initWithVehicleConnectedState:1 deviceId:@"Simulated vehicle"];
  [WeakRetained postNotification:v1];
}

uint64_t __68__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _bootstrapDominantActivityWithMotionActivites:a2];
}

void __90__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E016D870]();
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [*(id *)(a1 + 32) stringFromDate];
    id v10 = [*(id *)(a1 + 40) stringFromDate];
    uint64_t v11 = [v5 count];
    +[RTRuntime footprint];
    int v15 = 138413314;
    double v16 = v9;
    __int16 v17 = 2112;
    double v18 = v10;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "Querying CoreMotion for motionActivity between startDate, %@, endDate, %@, returned %lu activities, error, %@, footprint, %.2f MB", (uint8_t *)&v15, 0x34u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    [v5 enumerateObjectsUsingBlock:&__block_literal_global_121];
  }
  double v13 = [[_RTMap alloc] initWithInput:v5];
  id v14 = [(_RTMap *)v13 withBlock:&__block_literal_global_136_0];

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:v14];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __90__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke_130(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "motionActivity %lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

id __90__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke_133(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F5CE50];
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 rtMotionActivityType];
  uint64_t v6 = [v3 rtMotionActivityConfidence];
  uint64_t v7 = [v3 startDate];

  __int16 v8 = (void *)[v4 initWithType:v5 confidence:v6 startDate:v7];

  return v8;
}

void __109__RTMotionActivityManager_CoreMotion__fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uint64_t v5 = [[RTMotionActivityHistogram alloc] initWithActivites:v9 betweenDate:a1[4] andDate:a1[5]];
    uint64_t v6 = [(RTMotionActivityHistogram *)v5 binsSortedByInterval];
    uint64_t v7 = a1[6];
    __int16 v8 = [v6 firstObject];
    (*(void (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, [v8 type], 0);
  }
}

void __84__RTMotionActivityManager_CoreMotion__bootstrapDominantActivityWithMotionActivites___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_debug_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_DEBUG, "bootstrapping %@, %@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __68__RTMotionActivityManager_CoreMotion_onVehicleConnectedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVehicleConnectedNotification];
}

void __72__RTMotionActivityManager_CoreMotion__onVehicleDisconnectedNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [*(id *)(a1 + 32) description];
      int v5 = 138412290;
      int v6 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_ERROR, "Error storing Vehicle: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

uint64_t __71__RTMotionActivityManager_CoreMotion_onVehicleDisconnectedNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onVehicleDisconnectedNotification];
}

void __63__RTMotionActivityManager_CoreMotion_onVehicleExitNotification__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = objc_opt_new();
  [*(id *)(a1 + 32) postNotification:v2];
  id v3 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *MEMORY[0x1E4F22310];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "received darwin notification, %@", (uint8_t *)&v5, 0xCu);
  }
}

void __62__RTMotionActivityManager_CoreMotion_setInterestedInActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F5CE50];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [v4 rtMotionActivityType];
  uint64_t v7 = [v4 rtMotionActivityConfidence];
  __int16 v8 = [v4 startDate];

  id v10 = (id)[v5 initWithType:v6 confidence:v7 startDate:v8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onActivity:v10];
}

void __62__RTMotionActivityManager_CoreMotion__processDominantActivity__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218242;
    uint64_t v7 = a3 + 1;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%lu, %@", (uint8_t *)&v6, 0x16u);
  }
}

uint64_t __49__RTMotionActivityManager_CoreMotion_onActivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onActivity:*(void *)(a1 + 40)];
}

uint64_t __57__RTMotionActivityManager_CoreMotion__rtAlarmForTrigger___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _processActivityAlarm:a2 error:a3];
}

void __86__RTMotionActivityManager_CoreMotion__subscribeForPedometerDataWithStartDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 startDate];
  __int16 v8 = [v5 endDate];
  uint64_t v9 = [v7 compare:v8];

  if (v9 == -1)
  {
    uint64_t v11 = [RTMotionActivityPedometerData alloc];
    id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
    double v13 = [v5 startDate];
    id v14 = [v5 endDate];
    int v15 = (void *)[v12 initWithStartDate:v13 endDate:v14];
    double v16 = [v5 numberOfSteps];
    uint64_t v17 = [v16 integerValue];
    double v18 = [v5 distance];
    [v18 doubleValue];
    uint64_t v19 = -[RTMotionActivityPedometerData initWithDateInterval:numberOfSteps:distance:](v11, "initWithDateInterval:numberOfSteps:distance:", v15, v17);

    uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      __int16 v23 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v27 = 138413314;
      v28 = v22;
      __int16 v29 = 2112;
      v30 = v23;
      __int16 v31 = 2112;
      uint64_t v32 = v19;
      __int16 v33 = 2112;
      id v34 = v5;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "%@, %@, routine pedometer data, %@, core motion pedometer data, %@, error, %@,", (uint8_t *)&v27, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v5 = (id)v19;
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      v26 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v27 = 138413058;
      v28 = v25;
      __int16 v29 = 2112;
      v30 = v26;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v5;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%@, %@, invalid start and end date, core motion pedometer data, %@, error, %@,", (uint8_t *)&v27, 0x2Au);
    }
  }
}

@end