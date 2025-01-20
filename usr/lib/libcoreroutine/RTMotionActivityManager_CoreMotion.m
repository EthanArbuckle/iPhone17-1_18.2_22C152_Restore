@interface RTMotionActivityManager_CoreMotion
+ (double)durationForTrigger:(unsigned int)a3;
+ (int64_t)activityAlarmTriggerFromCMActivityAlarmTrigger:(unsigned int)a3;
- (BOOL)dominantMotionActivityBootstrapped;
- (BOOL)motionActivityAvailable;
- (CMMotionActivityManager)motionActivityManager;
- (NSDate)lastQueryForMotionActivity;
- (NSMutableArray)motionActivities;
- (NSMutableDictionary)activityAlarms;
- (NSMutableDictionary)uuidToPedometersMap;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_source)dominantMotionActivityTimer;
- (RTMotionActivity)dominantMotionActivity;
- (RTMotionActivityManager_CoreMotion)initWithPlatform:(id)a3 vehicleStore:(id)a4;
- (id)_rtAlarmForTrigger:(unsigned int)a3;
- (int64_t)interestedInActivity;
- (unint64_t)settledState;
- (unint64_t)vehicleConnectedState;
- (void)_bootstrapDominantActivityWithMotionActivites:(id)a3;
- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchMotionActivitiesIfNeeded;
- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5;
- (void)_fetchPredominantMotionActivityWithHandler:(id)a3;
- (void)_invalidateActivityAlarms;
- (void)_invalidateAlarm:(id)a3;
- (void)_onActivity:(id)a3;
- (void)_onVehicleConnectedNotification;
- (void)_onVehicleDisconnectedNotification;
- (void)_processActivityAlarm:(id)a3 error:(id)a4;
- (void)_processDominantActivity;
- (void)_processSettledState;
- (void)_resetMotionActivitiesIfNeeded;
- (void)_resubscribeForActivityAlarms;
- (void)_shutdownWithHandler:(id)a3;
- (void)_subscribeForMotionAlarmTypes:(id)a3;
- (void)_subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4;
- (void)_unsubscribeForPedometerData:(id)a3;
- (void)internalAddObserver:(id)a3 name:(id)a4;
- (void)internalRemoveObserver:(id)a3 name:(id)a4;
- (void)onActivity:(id)a3;
- (void)onVehicleConnectedNotification;
- (void)onVehicleDisconnectedNotification;
- (void)onVehicleExitNotification;
- (void)setActivityAlarms:(id)a3;
- (void)setDominantMotionActivity:(id)a3;
- (void)setDominantMotionActivityBootstrapped:(BOOL)a3;
- (void)setDominantMotionActivityTimer:(id)a3;
- (void)setInterestedInActivity:(int64_t)a3;
- (void)setLastQueryForMotionActivity:(id)a3;
- (void)setMotionActivities:(id)a3;
- (void)setMotionActivityAvailable:(BOOL)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setSettledState:(unint64_t)a3;
- (void)setUuidToPedometersMap:(id)a3;
- (void)setVehicleConnectedState:(unint64_t)a3;
@end

@implementation RTMotionActivityManager_CoreMotion

+ (int64_t)activityAlarmTriggerFromCMActivityAlarmTrigger:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a3 < 0xB && ((0x41Fu >> a3) & 1) != 0) {
    return qword_1DA1008A0[a3];
  }
  v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "unsupported trigger for description %d", (uint8_t *)v6, 8u);
  }

  return -1;
}

- (NSMutableDictionary)activityAlarms
{
  activityAlarms = self->_activityAlarms;
  if (!activityAlarms)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    v5 = self->_activityAlarms;
    self->_activityAlarms = v4;

    activityAlarms = self->_activityAlarms;
  }

  return activityAlarms;
}

- (RTMotionActivityManager_CoreMotion)initWithPlatform:(id)a3 vehicleStore:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v56.receiver = self;
  v56.super_class = (Class)RTMotionActivityManager_CoreMotion;
  id v47 = a3;
  id v48 = a4;
  v5 = -[RTMotionActivityManager initWithPlatform:vehicleStore:](&v56, sel_initWithPlatform_vehicleStore_, v47);
  if (!v5) {
    goto LABEL_21;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F22220]);
  uint64_t v7 = (void *)*((void *)v5 + 13);
  *((void *)v5 + 13) = v6;

  v5[49] = [MEMORY[0x1E4F22220] isActivityAvailable];
  v8 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    if (v5[49]) {
      v9 = @"YES";
    }
    else {
      v9 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    v58 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "activity available, %@", buf, 0xCu);
  }

  uint64_t v10 = objc_opt_new();
  v11 = (void *)*((void *)v5 + 14);
  *((void *)v5 + 14) = v10;

  v12 = [v5 queue];
  [*((id *)v5 + 14) setUnderlyingQueue:v12];

  uint64_t v13 = objc_opt_new();
  v14 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v13;

  v15 = v5 + 72;
  *((void *)v5 + 9) = 0;
  uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-30.0];
  v17 = (void *)*((void *)v5 + 16);
  *((void *)v5 + 16) = v16;

  uint64_t v18 = objc_opt_new();
  v19 = (void *)*((void *)v5 + 17);
  *((void *)v5 + 17) = v18;

  v20 = [v5 queue];
  dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v20);
  v22 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v21;

  dispatch_source_set_timer(*((dispatch_source_t *)v5 + 15), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  objc_initWeak(&location, v5);
  v23 = *((void *)v5 + 15);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke;
  handler[3] = &unk_1E6B91900;
  objc_copyWeak(&v54, &location);
  dispatch_source_set_event_handler(v23, handler);
  dispatch_resume(*((dispatch_object_t *)v5 + 15));
  if (![MEMORY[0x1E4F222C0] isAvailable])
  {
    *((void *)v5 + 12) = 0;
    v24 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "CMVehicleState is unavailable, initializing vehicle connected state to unknown.", buf, 2u);
    }
    goto LABEL_18;
  }
  v24 = [MEMORY[0x1E4F222C0] mostRecentVehicleConnection];
  v25 = [v24 timeRange];
  v26 = [v25 startDate];
  [v26 timeIntervalSinceReferenceDate];
  if (v27 <= 0.0)
  {

    goto LABEL_14;
  }
  v28 = [v24 timeRange];
  v29 = [v28 endDate];
  v30 = [v24 timeRange];
  v31 = [v30 startDate];
  BOOL v32 = [v29 compare:v31] == -1;

  if (!v32)
  {
LABEL_14:
    v15 = v5 + 96;
    goto LABEL_15;
  }
  *((void *)v5 + 12) = 2;
LABEL_15:
  void *v15 = 1;
  v33 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = [v24 timeRange];
    v35 = [v34 startDate];
    v36 = [v24 timeRange];
    v37 = [v36 endDate];
    v38 = [v24 deviceId];
    uint64_t v39 = *((void *)v5 + 12);
    *(_DWORD *)buf = 138413058;
    v58 = v35;
    __int16 v59 = 2112;
    v60 = v37;
    __int16 v61 = 2112;
    v62 = v38;
    __int16 v63 = 2048;
    uint64_t v64 = v39;
    _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "fetched vehicleStateData, startDate, %@, endDate, %@, deviceId, %@, vehicleConnectedState, %lu", buf, 0x2Au);
  }
LABEL_18:

  v40 = [v5 platform];
  int v41 = [v40 internalInstall];

  if (v41)
  {
    *(_DWORD *)buf = 0;
    v42 = (const char *)[@"MotionActivityVehicleConnected" UTF8String];
    v43 = [v5 queue];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke_95;
    v51[3] = &unk_1E6B954B0;
    objc_copyWeak(&v52, &location);
    notify_register_dispatch(v42, (int *)buf, v43, v51);

    v44 = (const char *)[@"MotionActivityVehicleDisconnected" UTF8String];
    v45 = [v5 queue];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __68__RTMotionActivityManager_CoreMotion_initWithPlatform_vehicleStore___block_invoke_2;
    v49[3] = &unk_1E6B954B0;
    objc_copyWeak(&v50, &location);
    notify_register_dispatch(v44, (int *)buf, v45, v49);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&v52);
  }
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);
LABEL_21:

  return (RTMotionActivityManager_CoreMotion *)v5;
}

- (void)_shutdownWithHandler:(id)a3
{
  id v8 = a3;
  dominantMotionActivityTimer = self->_dominantMotionActivityTimer;
  if (dominantMotionActivityTimer)
  {
    dispatch_source_cancel(dominantMotionActivityTimer);
    v5 = self->_dominantMotionActivityTimer;
    self->_dominantMotionActivityTimer = 0;
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  [(RTMotionActivityManager_CoreMotion *)self _invalidateActivityAlarms];
  uint64_t v7 = v8;
  if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    uint64_t v7 = v8;
  }
}

- (void)_fetchMotionActivitiesIfNeeded
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = [(RTMotionActivityManager_CoreMotion *)self lastQueryForMotionActivity];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  if (v6 >= 15.3)
  {
    uint64_t v7 = [v3 dateByAddingTimeInterval:-30.0];
    id v8 = [(RTMotionActivityManager_CoreMotion *)self motionActivities];
    v9 = [v8 lastObject];
    uint64_t v10 = [v9 startDate];
    v11 = [v10 dateByAddingTimeInterval:15.3];

    if (v11)
    {
      id v12 = [v11 laterDate:v7];
    }
    else
    {
      id v12 = v7;
    }
    uint64_t v13 = v12;
    if ([v12 compare:v3] == -1)
    {
      [(RTMotionActivityManager_CoreMotion *)self setLastQueryForMotionActivity:v3];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __68__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesIfNeeded__block_invoke;
      v14[3] = &unk_1E6B92FA8;
      v14[4] = self;
      [(RTMotionActivityManager_CoreMotion *)self _fetchMotionActivitiesFromStartDate:v13 endDate:v3 handler:v14];
    }
  }
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)RTMotionActivityManager_CoreMotion;
  [(RTMotionActivityManager *)&v22 internalAddObserver:a3 name:v6];
  if ([(RTNotifier *)self getNumberOfObservers:v6] == 1)
  {
    uint64_t v7 = +[RTNotification notificationName];
    int v8 = [v7 isEqualToString:v6];

    if (v8)
    {
      [(RTMotionActivityManager_CoreMotion *)self setInterestedInActivity:[(RTMotionActivityManager_CoreMotion *)self interestedInActivity] + 1];
      goto LABEL_9;
    }
    v9 = +[RTNotification notificationName];
    if (([v9 isEqualToString:v6] & 1) == 0)
    {
      uint64_t v10 = +[RTNotification notificationName];
      if (![v10 isEqualToString:v6])
      {
        v11 = +[RTNotification notificationName];
        char v12 = [v11 isEqualToString:v6];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = +[RTNotification notificationName];
          int v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            [(RTMotionActivityManager_CoreMotion *)self setInterestedInActivity:[(RTMotionActivityManager_CoreMotion *)self interestedInActivity] + 1];
            v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v15 addObserver:self selector:sel_onVehicleConnectedNotification name:*MEMORY[0x1E4F22300] object:0];

            uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v17 = v16;
            uint64_t v18 = sel_onVehicleDisconnectedNotification;
            v19 = (void *)MEMORY[0x1E4F22308];
          }
          else
          {
            v20 = +[RTNotification notificationName];
            int v21 = [v20 isEqualToString:v6];

            if (!v21) {
              goto LABEL_9;
            }
            uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v17 = v16;
            uint64_t v18 = sel_onVehicleExitNotification;
            v19 = (void *)MEMORY[0x1E4F22310];
          }
          [v16 addObserver:self selector:v18 name:*v19 object:0];

          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
LABEL_8:
    [(RTMotionActivityManager_CoreMotion *)self _fetchMotionActivitiesIfNeeded];
    [(RTMotionActivityManager_CoreMotion *)self setInterestedInActivity:[(RTMotionActivityManager_CoreMotion *)self interestedInActivity] + 1];
    [(RTMotionActivityManager_CoreMotion *)self _resubscribeForActivityAlarms];
  }
LABEL_9:
}

- (void)_resetMotionActivitiesIfNeeded
{
  id v10 = +[RTNotification notificationName];
  if (-[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:"))
  {
LABEL_4:

    return;
  }
  v3 = +[RTNotification notificationName];
  if ([(RTNotifier *)self getNumberOfObservers:v3])
  {

    goto LABEL_4;
  }
  v4 = +[RTNotification notificationName];
  unint64_t v5 = [(RTNotifier *)self getNumberOfObservers:v4];

  if (!v5)
  {
    [(RTMotionActivityManager_CoreMotion *)self setSettledState:0];
    [(RTMotionActivityManager_CoreMotion *)self setDominantMotionActivityBootstrapped:0];
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-30.0];
    [(RTMotionActivityManager_CoreMotion *)self setLastQueryForMotionActivity:v6];

    uint64_t v7 = [(RTMotionActivityManager_CoreMotion *)self motionActivities];
    [v7 removeAllObjects];

    [(RTMotionActivityManager_CoreMotion *)self setDominantMotionActivity:0];
    int v8 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivityTimer];

    if (v8)
    {
      v9 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivityTimer];
      dispatch_source_set_timer(v9, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
    }
    [(RTMotionActivityManager_CoreMotion *)self _invalidateActivityAlarms];
  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v6 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RTMotionActivityManager_CoreMotion;
  [(RTMotionActivityManager *)&v21 internalRemoveObserver:a3 name:v6];
  if (![(RTNotifier *)self getNumberOfObservers:v6])
  {
    uint64_t v7 = +[RTNotification notificationName];
    int v8 = [v7 isEqualToString:v6];

    if (v8)
    {
      [(RTMotionActivityManager_CoreMotion *)self setInterestedInActivity:[(RTMotionActivityManager_CoreMotion *)self interestedInActivity] - 1];
      goto LABEL_9;
    }
    v9 = +[RTNotification notificationName];
    if (([v9 isEqualToString:v6] & 1) == 0)
    {
      id v10 = +[RTNotification notificationName];
      if (![v10 isEqualToString:v6])
      {
        v11 = +[RTNotification notificationName];
        char v12 = [v11 isEqualToString:v6];

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = +[RTNotification notificationName];
          int v14 = [v13 isEqualToString:v6];

          if (v14)
          {
            [(RTMotionActivityManager_CoreMotion *)self setInterestedInActivity:[(RTMotionActivityManager_CoreMotion *)self interestedInActivity] - 1];
            v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v15 removeObserver:self name:*MEMORY[0x1E4F22300] object:0];

            uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v17 = v16;
            uint64_t v18 = (void *)MEMORY[0x1E4F22308];
          }
          else
          {
            v19 = +[RTNotification notificationName];
            int v20 = [v19 isEqualToString:v6];

            if (!v20) {
              goto LABEL_9;
            }
            uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
            v17 = v16;
            uint64_t v18 = (void *)MEMORY[0x1E4F22310];
          }
          [v16 removeObserver:self name:*v18 object:0];

          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
LABEL_8:
    [(RTMotionActivityManager_CoreMotion *)self setInterestedInActivity:[(RTMotionActivityManager_CoreMotion *)self interestedInActivity] - 1];
    [(RTMotionActivityManager_CoreMotion *)self _resetMotionActivitiesIfNeeded];
  }
LABEL_9:
}

- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  v117[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v83 = a4;
  id v9 = a5;
  id v10 = (void (**)(void, void, void))v9;
  v80 = v8;
  if (!v9) {
    goto LABEL_8;
  }
  v78 = (void (**)(id, void, void *))v9;
  if (!v8 || !v83)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v115 = *MEMORY[0x1E4F28568];
    v116 = @"requires valid dates.";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    int v20 = [v18 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v19];
    v78[2](v78, 0, v20);

    goto LABEL_7;
  }
  if ([v8 compare:v83] == 1)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v113 = *MEMORY[0x1E4F28568];
    char v12 = NSString;
    uint64_t v13 = [v8 stringFromDate];
    int v14 = [v83 stringFromDate];
    v15 = [v12 stringWithFormat:@"startDate, %@, postdates endDate, %@", v13, v14];
    v114 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
    v17 = [v11 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v16];
    v78[2](v78, 0, v17);

    goto LABEL_7;
  }
  if (![(RTMotionActivityManager_CoreMotion *)self motionActivityAvailable])
  {
    v10[2](v10, 0, 0);
    goto LABEL_8;
  }
  objc_super v21 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_super v22 = [v8 stringFromDate];
    v23 = [v83 stringFromDate];
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v22;
    __int16 v103 = 2112;
    id v104 = v23;
    __int16 v105 = 2048;
    uint64_t v106 = v24;
    _os_log_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_INFO, "Query CoreMotion for motionActivity between, startDate, %@, endDate, %@, footprint, %.2f MB", buf, 0x20u);
  }
  id v74 = v80;
  uint64_t v96 = 0;
  v97 = &v96;
  uint64_t v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__166;
  v100 = __Block_byref_object_dispose__166;
  id v101 = (id)objc_opt_new();
  uint64_t v90 = 0;
  v91 = &v90;
  uint64_t v92 = 0x3032000000;
  v93 = __Block_byref_object_copy__166;
  v94 = __Block_byref_object_dispose__166;
  id v95 = 0;
  v73 = [MEMORY[0x1E4F1C9C8] date];
  v77 = objc_opt_new();
  v25 = self;
  v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  double v27 = v25;
  v28 = v26;
  v79 = v27;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = (const char *)[(RTMotionActivityManager_CoreMotion *)v79 UTF8String];
  }
  else
  {
    id v30 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v79];
    v29 = (const char *)[v30 UTF8String];
  }
  dispatch_queue_t v31 = dispatch_queue_create(v29, v28);

  [v77 setUnderlyingQueue:v31];
  BOOL v32 = 0;
  uint64_t v75 = *MEMORY[0x1E4F5CFE8];
  uint64_t v76 = *MEMORY[0x1E4F28568];
  id v33 = v74;
  id v82 = v74;
  while (1)
  {
    v34 = [v83 earlierDate:v33];
    char v35 = [v34 isEqualToDate:v83];

    if (v35) {
      break;
    }
    context = (void *)MEMORY[0x1E016D870]();
    v36 = [v82 dateByAddingTimeInterval:3600.0];

    v37 = [v83 earlierDate:v36];

    dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
    uint64_t v39 = [(RTMotionActivityManager_CoreMotion *)v79 motionActivityManager];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __90__RTMotionActivityManager_CoreMotion__fetchMotionActivitiesFromStartDate_endDate_handler___block_invoke;
    v84[3] = &unk_1E6B98F30;
    id v40 = v82;
    id v85 = v40;
    id v33 = v37;
    id v86 = v33;
    v88 = &v90;
    v89 = &v96;
    int v41 = v38;
    v87 = v41;
    id v82 = v40;
    [v39 queryActivityStartingFromDate:v40 toDate:v33 toQueue:v77 withHandler:v84];

    v42 = v41;
    v43 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v44 = dispatch_time(0, 3600000000000);
    id v45 = v32;
    if (dispatch_semaphore_wait(v42, v44))
    {
      v46 = [MEMORY[0x1E4F1C9C8] now];
      [v46 timeIntervalSinceDate:v43];
      double v48 = v47;
      v49 = objc_opt_new();
      id v50 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_296];
      v51 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v52 = [v51 filteredArrayUsingPredicate:v50];
      v53 = [v52 firstObject];

      [v49 submitToCoreAnalytics:v53 type:1 duration:v48];
      id v54 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v54, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v55 = (void *)MEMORY[0x1E4F28C58];
      v117[0] = v76;
      *(void *)buf = @"semaphore wait timeout";
      objc_super v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v117 count:1];
      v57 = [v55 errorWithDomain:v75 code:15 userInfo:v56];

      id v45 = v32;
      if (v57)
      {
        id v45 = v57;
      }
    }

    id v58 = v45;
    BOOL v59 = v58 == 0;
    v60 = v91;
    if (v58)
    {
      id v61 = v58;
      v62 = (void *)v60[5];
      v60[5] = (uint64_t)v61;
    }
    else
    {
      if (v91[5])
      {
        BOOL v59 = 0;
        goto LABEL_28;
      }
      id v63 = v33;
      v62 = v82;
      id v82 = v63;
    }

LABEL_28:
    BOOL v32 = v58;
    if (!v59) {
      goto LABEL_32;
    }
  }
  id v58 = v32;
LABEL_32:
  uint64_t v64 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    id v65 = [v74 stringFromDate];
    id v66 = [v83 stringFromDate];
    uint64_t v67 = [(id)v97[5] count];
    uint64_t v68 = v91[5];
    v69 = [MEMORY[0x1E4F1C9C8] date];
    [v69 timeIntervalSinceDate:v73];
    uint64_t v71 = v70;
    +[RTRuntime footprint];
    *(_DWORD *)buf = 138413570;
    *(void *)&uint8_t buf[4] = v65;
    __int16 v103 = 2112;
    id v104 = v66;
    __int16 v105 = 2048;
    uint64_t v106 = v67;
    __int16 v107 = 2112;
    uint64_t v108 = v68;
    __int16 v109 = 2048;
    uint64_t v110 = v71;
    __int16 v111 = 2048;
    uint64_t v112 = v72;
    _os_log_impl(&dword_1D9BFA000, v64, OS_LOG_TYPE_INFO, "Queried CoreMotion for motionActivity between, startDate, %@, endDate, %@, activities count, %lu, error, %@, latency, %.4f sec, footprint, %.2f MB", buf, 0x3Eu);
  }
  v78[2](v78, v97[5], (void *)v91[5]);

  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(&v96, 8);

LABEL_7:
  id v10 = (void (**)(void, void, void))v78;
LABEL_8:
}

- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__RTMotionActivityManager_CoreMotion__fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke;
  v14[3] = &unk_1E6B91508;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(RTMotionActivityManager_CoreMotion *)self _fetchMotionActivitiesFromStartDate:v13 endDate:v12 handler:v14];
}

- (void)_fetchPredominantMotionActivityWithHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, RTMotionActivity *, void))a3;
  unint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self->_dominantMotionActivityBootstrapped) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    int v7 = 136315394;
    id v8 = "-[RTMotionActivityManager_CoreMotion _fetchPredominantMotionActivityWithHandler:]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, _dominantMotionActivityBootstrapped, %@", (uint8_t *)&v7, 0x16u);
  }

  v4[2](v4, self->_dominantMotionActivity, 0);
}

- (void)setDominantMotionActivity:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_dominantMotionActivity = &self->_dominantMotionActivity;
  if (([(RTMotionActivity *)self->_dominantMotionActivity isEqual:v5] & 1) == 0
    && (-[RTMotionActivity type](*p_dominantMotionActivity, "type") != 4 || [v5 type] != 6))
  {
    int v7 = *p_dominantMotionActivity;
    objc_storeStrong((id *)&self->_dominantMotionActivity, a3);
    id v8 = +[RTNotification notificationName];
    unint64_t v9 = [(RTNotifier *)self getNumberOfObservers:v8];

    if (v9)
    {
      id v10 = [[RTMotionActivityManagerNotificationDominantMotionActivityChange alloc] initWithDominantMotionActivity:v5];
      [(RTNotifier *)self postNotification:v10];
    }
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = *p_dominantMotionActivity;
      int v13 = 138412546;
      int v14 = v7;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "dominant motion activity change from, %@, to, %@", (uint8_t *)&v13, 0x16u);
    }

    if (*p_dominantMotionActivity) {
      [(RTMotionActivityManager_CoreMotion *)self _processSettledState];
    }
  }
}

- (void)setSettledState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t settledState = self->_settledState;
  if (settledState == a3)
  {
    if (a3 != 1) {
      return;
    }
    id v5 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivity];
    if ([v5 type] == 4)
    {
    }
    else
    {
      unint64_t v12 = [(RTMotionActivityManager_CoreMotion *)self vehicleConnectedState];

      if (v12 != 2) {
        return;
      }
    }
    [(RTMotionActivityManager_CoreMotion *)self _resubscribeForActivityAlarms];
  }
  else
  {
    self->_unint64_t settledState = a3;
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = +[RTMotionActivityManager motionSettledStateToString:settledState];
      id v8 = +[RTMotionActivityManager motionSettledStateToString:self->_settledState];
      int v13 = 138412546;
      int v14 = v7;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "settled state change from, %@, to, %@", (uint8_t *)&v13, 0x16u);
    }
    unint64_t v9 = +[RTNotification notificationName];
    unint64_t v10 = [(RTNotifier *)self getNumberOfObservers:v9];

    if (v10)
    {
      uint64_t v11 = [[RTMotionActivityManagerNotificationMotionSettledStateChange alloc] initWithSettledState:self->_settledState];
      [(RTNotifier *)self postNotification:v11];
    }
    [(RTMotionActivityManager_CoreMotion *)self _resubscribeForActivityAlarms];
  }
}

- (void)setDominantMotionActivityBootstrapped:(BOOL)a3
{
  if (self->_dominantMotionActivityBootstrapped != a3)
  {
    self->_dominantMotionActivityBootstrapped = a3;
    if (a3) {
      [(RTMotionActivityManager_CoreMotion *)self _processDominantActivity];
    }
  }
}

- (void)_bootstrapDominantActivityWithMotionActivites:(id)a3
{
  id v8 = a3;
  v4 = +[RTNotification notificationName];
  if ([(RTNotifier *)self getNumberOfObservers:v4])
  {
  }
  else
  {
    id v5 = +[RTNotification notificationName];
    unint64_t v6 = [(RTNotifier *)self getNumberOfObservers:v5];

    if (!v6) {
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    [v8 enumerateObjectsUsingBlock:&__block_literal_global_142_0];
  }
  if ([v8 count])
  {
    int v7 = [(RTMotionActivityManager_CoreMotion *)self motionActivities];
    [v7 addObjectsFromArray:v8];
  }
  [(RTMotionActivityManager_CoreMotion *)self setDominantMotionActivityBootstrapped:1];
LABEL_9:
}

- (void)_onVehicleConnectedNotification
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *MEMORY[0x1E4F22300];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "received darwin notification, %@", (uint8_t *)&v5, 0xCu);
  }

  [(RTMotionActivityManager_CoreMotion *)self setVehicleConnectedState:2];
}

- (void)onVehicleConnectedNotification
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__RTMotionActivityManager_CoreMotion_onVehicleConnectedNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onVehicleDisconnectedNotification
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = (void *)*MEMORY[0x1E4F22308];
    *(_DWORD *)buf = 138412290;
    v34 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "received darwin notification, %@", buf, 0xCu);
  }

  [(RTMotionActivityManager_CoreMotion *)self setVehicleConnectedState:1];
  if ([MEMORY[0x1E4F222C0] isAvailable])
  {
    int v5 = [MEMORY[0x1E4F222C0] mostRecentVehicleConnection];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 timeRange];
      if (!v7) {
        goto LABEL_7;
      }
      id v8 = (void *)v7;
      unint64_t v9 = [v6 timeRange];
      unint64_t v10 = [v9 startDate];
      uint64_t v11 = [v6 timeRange];
      unint64_t v12 = [v11 endDate];
      int v13 = [v10 isAfterDate:v12];

      if (!v13)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F28C18]);
        uint64_t v17 = [v6 timeRange];
        uint64_t v18 = [v17 startDate];
        v19 = [v6 timeRange];
        int v20 = [v19 endDate];
        int v14 = [v16 initWithStartDate:v18 endDate:v20];

        id v21 = objc_alloc(MEMORY[0x1E4F5CFB8]);
        objc_super v22 = [v6 vehicleName];
        v23 = [v6 vehicleModelName];
        uint64_t v24 = [v6 vehicleBluetoothAddress];
        v25 = (void *)[v21 initWithDateInterval:v14 vehicleName:v22 vehicleModelName:v23 bluetoothAddress:v24];

        v26 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v25;
          _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "vehicle disconnected, %@", buf, 0xCu);
        }

        double v27 = [(RTMotionActivityManager *)self vehicleStore];

        if (v27)
        {
          v28 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            id v30 = [v25 description];
            *(_DWORD *)buf = 138412290;
            v34 = v30;
            _os_log_debug_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_DEBUG, "Storing Vehicle: %@", buf, 0xCu);
          }
          v29 = [(RTMotionActivityManager *)self vehicleStore];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __72__RTMotionActivityManager_CoreMotion__onVehicleDisconnectedNotification__block_invoke;
          v31[3] = &unk_1E6B90840;
          id v32 = v25;
          [v29 storeVehicle:v32 handler:v31];
        }
      }
      else
      {
LABEL_7:
        int v14 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          __int16 v15 = [v6 description];
          *(_DWORD *)buf = 138412290;
          v34 = v15;
          _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Vehicle state data received with invalid date interval: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      int v14 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Error retrieving most recent vehicle connection", buf, 2u);
      }
    }
  }
}

- (void)onVehicleDisconnectedNotification
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTMotionActivityManager_CoreMotion_onVehicleDisconnectedNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setVehicleConnectedState:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t vehicleConnectedState = self->_vehicleConnectedState;
  if (vehicleConnectedState != a3)
  {
    self->_unint64_t vehicleConnectedState = a3;
    int v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = +[RTMotionActivityManager motionActivityVehicleConnectedStateToString:vehicleConnectedState];
      uint64_t v7 = +[RTMotionActivityManager motionActivityVehicleConnectedStateToString:self->_vehicleConnectedState];
      int v11 = 138412546;
      unint64_t v12 = v6;
      __int16 v13 = 2112;
      int v14 = v7;
      _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "vehicle connected state changed from, %@, to %@", (uint8_t *)&v11, 0x16u);
    }
    if (vehicleConnectedState && self->_vehicleConnectedState)
    {
      if ([MEMORY[0x1E4F222C0] isAvailable])
      {
        id v8 = [MEMORY[0x1E4F222C0] mostRecentVehicleConnection];
        unint64_t v9 = [v8 deviceId];
      }
      else
      {
        unint64_t v9 = 0;
      }
      unint64_t v10 = [[RTMotionActivityManagerNotificationVehicleConnected alloc] initWithVehicleConnectedState:self->_vehicleConnectedState deviceId:v9];
      [(RTNotifier *)self postNotification:v10];
      [(RTMotionActivityManager_CoreMotion *)self _processSettledState];
    }
  }
}

- (void)onVehicleExitNotification
{
  v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__RTMotionActivityManager_CoreMotion_onVehicleExitNotification__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setInterestedInActivity:(int64_t)a3
{
  int64_t interestedInActivity = self->_interestedInActivity;
  if (interestedInActivity != a3)
  {
    self->_int64_t interestedInActivity = a3;
    if (a3 < 1 || interestedInActivity)
    {
      if (!a3 && interestedInActivity >= 1)
      {
        id v8 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "stopping activity updates", (uint8_t *)buf, 2u);
        }

        unint64_t v9 = [(RTMotionActivityManager_CoreMotion *)self motionActivityManager];
        [v9 stopActivityUpdates];
      }
    }
    else
    {
      int v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "starting activity updates", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, self);
      uint64_t v6 = [(RTMotionActivityManager_CoreMotion *)self motionActivityManager];
      uint64_t v7 = [(RTMotionActivityManager_CoreMotion *)self operationQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __62__RTMotionActivityManager_CoreMotion_setInterestedInActivity___block_invoke;
      v10[3] = &unk_1E6B9CA70;
      objc_copyWeak(&v11, buf);
      [v6 startActivityUpdatesToQueue:v7 withHandler:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
  }
}

- (void)_processDominantActivity
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ([(RTMotionActivityManager_CoreMotion *)self dominantMotionActivityBootstrapped])
  {
    v3 = [(RTMotionActivityManager_CoreMotion *)self motionActivities];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      int v5 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v5 sinceDate:-30.0];
      uint64_t v7 = [(RTMotionActivityManager_CoreMotion *)self motionActivities];
      +[RTMotionActivityManager removeActivities:v7 stoppedBeforeDate:v6];

      id v8 = [RTMotionActivityHistogram alloc];
      unint64_t v9 = [(RTMotionActivityManager_CoreMotion *)self motionActivities];
      unint64_t v10 = [(RTMotionActivityHistogram *)v8 initWithActivites:v9 betweenDate:v6 andDate:v5];

      id v11 = [(RTMotionActivityHistogram *)v10 binsSortedByInterval];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        unint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v36 = [v11 count];
          [(RTMotionActivityHistogram *)v10 totalInterval];
          int v38 = 134218240;
          uint64_t v39 = v36;
          __int16 v40 = 2048;
          uint64_t v41 = v37;
          _os_log_debug_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_DEBUG, "%lu activites in the last %.2f seconds", (uint8_t *)&v38, 0x16u);
        }

        [v11 enumerateObjectsUsingBlock:&__block_literal_global_150];
      }
      [(RTMotionActivityHistogram *)v10 totalInterval];
      if (v13 >= 30.0)
      {
        int v20 = [v11 firstObject];
        v23 = [objc_alloc(MEMORY[0x1E4F5CE50]) initWithType:-[NSObject type](v20, "type") confidence:-[NSObject confidence](v20, "confidence") startDate:v6];
        [(RTMotionActivityManager_CoreMotion *)self setDominantMotionActivity:v23];

        uint64_t v24 = [(RTMotionActivityManager_CoreMotion *)self motionActivities];
        v25 = [v24 lastObject];

        uint64_t v26 = [v25 type];
        double v27 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivity];
        uint64_t v28 = [v27 type];

        if (v26 != v28)
        {
          v29 = -[RTMotionActivityHistogram binForType:](v10, "binForType:", [v25 type]);
          [v29 interval];
          double v31 = v30;
          id v32 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivityTimer];

          if (v32)
          {
            id v33 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivityTimer];
            double v34 = ((30.0 - v31) * 0.5 + 1.0) * 1000000000.0;
            dispatch_time_t v35 = dispatch_time(0, (uint64_t)v34);
            dispatch_source_set_timer(v33, v35, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v34 * 0.02));
          }
        }
      }
      else
      {
        id v14 = objc_alloc(MEMORY[0x1E4F5CE50]);
        uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
        id v16 = (void *)[v14 initWithType:0 confidence:0 startDate:v15];
        [(RTMotionActivityManager_CoreMotion *)self setDominantMotionActivity:v16];

        [(RTMotionActivityHistogram *)v10 totalInterval];
        double v18 = v17;
        v19 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivityTimer];

        if (!v19)
        {
LABEL_16:

          return;
        }
        int v20 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivityTimer];
        double v21 = (30.0 - v18) * 1000000000.0;
        dispatch_time_t v22 = dispatch_time(0, (uint64_t)v21);
        dispatch_source_set_timer(v20, v22, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v21 * 0.02));
      }

      goto LABEL_16;
    }
  }
}

- (void)_processSettledState
{
  if ([(RTMotionActivityManager_CoreMotion *)self vehicleConnectedState] == 2)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v4 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivity];
    unint64_t v5 = [v4 confidence];

    if (v5 < 2) {
      return;
    }
    uint64_t v6 = [(RTMotionActivityManager_CoreMotion *)self dominantMotionActivity];
    uint64_t v7 = [v6 type];

    if ((unint64_t)(v7 - 1) > 4) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_1DA1008F8[v7 - 1];
    }
  }

  [(RTMotionActivityManager_CoreMotion *)self setSettledState:v3];
}

- (void)_onActivity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = +[RTNotification notificationName];
  unint64_t v6 = [(RTNotifier *)self getNumberOfObservers:v5];

  if (v6)
  {
    uint64_t v7 = [[RTMotionActivityManagerNotificationActivity alloc] initWithActivity:v4];
    [(RTNotifier *)self postNotification:v7];
  }
  id v8 = +[RTNotification notificationName];
  if ([(RTNotifier *)self getNumberOfObservers:v8])
  {
  }
  else
  {
    unint64_t v9 = +[RTNotification notificationName];
    unint64_t v10 = [(RTNotifier *)self getNumberOfObservers:v9];

    if (!v10) {
      goto LABEL_9;
    }
  }
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "caching RTMotionActivity, %@", (uint8_t *)&v13, 0xCu);
  }

  unint64_t v12 = [(RTMotionActivityManager_CoreMotion *)self motionActivities];
  [v12 addObject:v4];

  [(RTMotionActivityManager_CoreMotion *)self _processDominantActivity];
LABEL_9:
}

- (void)onActivity:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__RTMotionActivityManager_CoreMotion_onActivity___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_resubscribeForActivityAlarms
{
  if ([(RTMotionActivityManager_CoreMotion *)self interestedInActivity]
    && ([MEMORY[0x1E4F22190] activityAlarmAvailable] & 1) != 0)
  {
    unint64_t v3 = [(RTMotionActivityManager_CoreMotion *)self settledState];
    if (v3)
    {
      if (v3 != 2)
      {
        if (v3 == 1)
        {
          id v8 = [(id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&unk_1F3452730, 0];
          if ([(RTMotionActivityManager_CoreMotion *)self vehicleConnectedState] == 2
            || ([(RTMotionActivityManager_CoreMotion *)self dominantMotionActivity],
                id v4 = objc_claimAutoreleasedReturnValue(),
                uint64_t v5 = [v4 type],
                v4,
                v5 == 4))
          {
            [v8 addObject:&unk_1F3452748];
          }
          [(RTMotionActivityManager_CoreMotion *)self _subscribeForMotionAlarmTypes:v8];
        }
        return;
      }
      uint64_t v7 = &unk_1F34535D0;
    }
    else
    {
      uint64_t v7 = &unk_1F34535E8;
    }
    [(RTMotionActivityManager_CoreMotion *)self _subscribeForMotionAlarmTypes:v7];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "Bail from resubscribing to motion alarms", buf, 2u);
    }
  }
}

- (void)_subscribeForMotionAlarmTypes:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F22190] activityAlarmAvailable])
  {
    aSelector = a2;
    id v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v5 count]];
    uint64_t v7 = [MEMORY[0x1E4F1CA80] setWithCapacity:[v5 count]];
    if ([v5 count])
    {
      unint64_t v9 = 0;
      *(void *)&long long v8 = 138412290;
      long long v38 = v8;
      do
      {
        unint64_t v10 = [v5 objectAtIndexedSubscript:v9];
        uint64_t v11 = [v10 unsignedIntValue];

        unint64_t v12 = [NSNumber numberWithUnsignedInt:v11];
        [v7 addObject:v12];

        int v13 = [(RTMotionActivityManager_CoreMotion *)self activityAlarms];
        id v14 = [NSNumber numberWithUnsignedInt:v11];
        uint64_t v15 = [v13 objectForKeyedSubscript:v14];

        if (v15)
        {
          id v16 = [MEMORY[0x1E4F22190] triggerToString:v11];
          [v6 addObject:v16];
        }
        else
        {
          id v16 = [(RTMotionActivityManager_CoreMotion *)self _rtAlarmForTrigger:v11];
          if (v16)
          {
            double v17 = [(RTMotionActivityManager_CoreMotion *)self activityAlarms];
            double v18 = [NSNumber numberWithUnsignedInt:v11];
            [v17 setObject:v16 forKeyedSubscript:v18];

            v19 = [MEMORY[0x1E4F22190] triggerToString:v11];
            [v6 addObject:v19];
          }
          else
          {
            v19 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              int v20 = [MEMORY[0x1E4F22190] triggerToString:v11];
              *(_DWORD *)buf = v38;
              double v47 = v20;
              _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "failed to subscribe for motion activity alarm %@", buf, 0xCu);
            }
          }
        }
        ++v9;
      }
      while (v9 < [v5 count]);
    }
    dispatch_time_t v22 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = NSStringFromSelector(aSelector);
      uint64_t v24 = [v6 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412546;
      double v47 = v23;
      __int16 v48 = 2112;
      v49 = v24;
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%@, subscribed for motion activity alarms, %@", buf, 0x16u);
    }
    SEL aSelectora = (SEL)v6;

    v25 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v26 = [(RTMotionActivityManager_CoreMotion *)self activityAlarms];
    double v27 = [v26 allKeys];
    uint64_t v28 = [v25 setWithArray:v27];

    [v28 minusSet:v7];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v29 = v28;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          dispatch_time_t v35 = [(RTMotionActivityManager_CoreMotion *)self activityAlarms];
          uint64_t v36 = [v35 objectForKeyedSubscript:v34];
          [(RTMotionActivityManager_CoreMotion *)self _invalidateAlarm:v36];

          uint64_t v37 = [(RTMotionActivityManager_CoreMotion *)self activityAlarms];
          [v37 setObject:0 forKeyedSubscript:v34];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v31);
    }

    double v21 = aSelectora;
  }
  else
  {
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEBUG, "Bail from subscribing to motion alarms", buf, 2u);
    }
  }
}

+ (double)durationForTrigger:(unsigned int)a3
{
  double result = 180.0;
  double v4 = 60.0;
  if (a3 == 3) {
    double v4 = 10.0;
  }
  if (a3 != 4) {
    double result = v4;
  }
  if (a3 == 10) {
    return 10.0;
  }
  return result;
}

- (id)_rtAlarmForTrigger:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(id)objc_opt_class() durationForTrigger:*(void *)&a3];
  double v6 = v5;
  id v7 = objc_alloc(MEMORY[0x1E4F22190]);
  long long v8 = [(RTNotifier *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__RTMotionActivityManager_CoreMotion__rtAlarmForTrigger___block_invoke;
  v11[3] = &unk_1E6B9CA98;
  v11[4] = self;
  unint64_t v9 = (void *)[v7 initWithTrigger:v3 duration:v8 onQueue:v11 withHandler:v6];

  return v9;
}

- (void)_processActivityAlarm:(id)a3 error:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    unint64_t v9 = (RTMotionActivityManagerNotificationActivityAlarm *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_error_impl(&dword_1D9BFA000, &v9->super.super, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_4;
  }
  if (v7)
  {
    unint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = NSStringFromSelector(a2);
      int v16 = 138412546;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%@, received %@", (uint8_t *)&v16, 0x16u);
    }
    [(RTMotionActivityManager_CoreMotion *)self _invalidateAlarm:v7];
    unint64_t v12 = [(RTMotionActivityManager_CoreMotion *)self activityAlarms];
    int v13 = [NSNumber numberWithUnsignedInt:[v7 trigger]];
    [v12 setObject:0 forKeyedSubscript:v13];

    [(RTMotionActivityManager_CoreMotion *)self _fetchMotionActivitiesIfNeeded];
    id v14 = +[RTNotification notificationName];
    unint64_t v15 = [(RTNotifier *)self getNumberOfObservers:v14];

    if (v15)
    {
      unint64_t v9 = [[RTMotionActivityManagerNotificationActivityAlarm alloc] initWithActivityAlarmTrigger:objc_msgSend((id)objc_opt_class(), "activityAlarmTriggerFromCMActivityAlarmTrigger:", objc_msgSend(v7, "trigger"))];
      [(RTNotifier *)self postNotification:v9];
LABEL_4:
    }
  }
}

- (void)_invalidateAlarm:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    double v4 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      double v6 = [MEMORY[0x1E4F22190] triggerToString:[v3 trigger]];
      int v8 = 138412290;
      unint64_t v9 = v6;
      _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "invalidate alarm type %@", (uint8_t *)&v8, 0xCu);
    }
    [v3 invalidate];
    double v5 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [MEMORY[0x1E4F22190] triggerToString:[v3 trigger]];
      int v8 = 138412290;
      unint64_t v9 = v7;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "invalidated alarm type %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_invalidateActivityAlarms
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(RTMotionActivityManager_CoreMotion *)self activityAlarms];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        unint64_t v9 = [(RTMotionActivityManager_CoreMotion *)self activityAlarms];
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];
        [(RTMotionActivityManager_CoreMotion *)self _invalidateAlarm:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  [(RTMotionActivityManager_CoreMotion *)self setActivityAlarms:0];
}

- (void)_subscribeForPedometerDataWithStartDate:(id)a3 handler:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
      unint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = (objc_class *)objc_opt_class();
        long long v11 = NSStringFromClass(v10);
        long long v12 = NSStringFromSelector(a2);
        int v13 = [MEMORY[0x1E4F22258] isStepCountingAvailable];
        long long v14 = @"NO";
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&unsigned char buf[12] = 2112;
        if (v13) {
          long long v14 = @"YES";
        }
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v46 = (uint64_t (*)(uint64_t, uint64_t))v14;
        _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, %@, isStepCountingAvailable, %@", buf, 0x20u);
      }
      if ([MEMORY[0x1E4F22258] isStepCountingAvailable])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000;
        v46 = __Block_byref_object_copy__166;
        double v47 = __Block_byref_object_dispose__166;
        id v48 = [MEMORY[0x1E4F29128] UUID];
        id v15 = objc_alloc_init(MEMORY[0x1E4F22258]);
        uint64_t v16 = [(RTMotionActivityManager_CoreMotion *)self uuidToPedometersMap];
        [v16 setObject:v15 forKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];

        id v17 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          __int16 v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
          dispatch_time_t v22 = [v7 stringFromDate];
          *(_DWORD *)uint64_t v37 = 138413058;
          id v38 = v19;
          __int16 v39 = 2112;
          id v40 = v20;
          __int16 v41 = 2112;
          uint64_t v42 = v21;
          __int16 v43 = 2112;
          long long v44 = v22;
          _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, %@, starting pedometer updates with UUID, %@, startDate, %@", v37, 0x2Au);
        }
        v23 = (void *)MEMORY[0x1E016D870]();
        uint64_t v24 = [(RTMotionActivityManager_CoreMotion *)self uuidToPedometersMap];
        v25 = [v24 objectForKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __86__RTMotionActivityManager_CoreMotion__subscribeForPedometerDataWithStartDate_handler___block_invoke;
        v33[3] = &unk_1E6B9CAC0;
        v33[4] = self;
        SEL v36 = a2;
        id v26 = v8;
        id v34 = v26;
        dispatch_time_t v35 = buf;
        [v25 startPedometerUpdatesFromDate:v7 withHandler:v33];

        (*((void (**)(id, void, void, void))v26 + 2))(v26, *(void *)(*(void *)&buf[8] + 40), 0, 0);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v49 = *MEMORY[0x1E4F28568];
        uint64_t v50 = @"step counting is not supported";
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        uint64_t v32 = [v30 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:1 userInfo:v31];

        (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v32);
      }
    }
    else
    {
      double v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52[0] = @"startDate is nil";
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      id v29 = [v27 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v28];

      (*((void (**)(id, void, void, void *))v8 + 2))(v8, 0, 0, v29);
    }
  }
}

- (void)_unsubscribeForPedometerData:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    unint64_t v9 = NSStringFromSelector(a2);
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = v9;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, stopping pedometer updates for UUID, %@", (uint8_t *)&v18, 0x20u);
  }
  if (v5
    && ([(RTMotionActivityManager_CoreMotion *)self uuidToPedometersMap],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:v5],
        long long v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    long long v12 = [(RTMotionActivityManager_CoreMotion *)self uuidToPedometersMap];
    int v13 = [v12 objectForKeyedSubscript:v5];
    [v13 stopPedometerUpdates];

    long long v14 = [(RTMotionActivityManager_CoreMotion *)self uuidToPedometersMap];
    [v14 setObject:0 forKeyedSubscript:v5];
  }
  else
  {
    long long v14 = _rt_log_facility_get_os_log(RTLogFacilityMotionActivity);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(a2);
      int v18 = 138412802;
      id v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, %@, pedometer for UUID, %@, not found in dictionary", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (BOOL)dominantMotionActivityBootstrapped
{
  return self->_dominantMotionActivityBootstrapped;
}

- (NSMutableArray)motionActivities
{
  return self->_motionActivities;
}

- (void)setMotionActivities:(id)a3
{
}

- (RTMotionActivity)dominantMotionActivity
{
  return self->_dominantMotionActivity;
}

- (unint64_t)settledState
{
  return self->_settledState;
}

- (void)setActivityAlarms:(id)a3
{
}

- (int64_t)interestedInActivity
{
  return self->_interestedInActivity;
}

- (unint64_t)vehicleConnectedState
{
  return self->_vehicleConnectedState;
}

- (CMMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (BOOL)motionActivityAvailable
{
  return self->_motionActivityAvailable;
}

- (void)setMotionActivityAvailable:(BOOL)a3
{
  self->_motionActivityAvailable = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_source)dominantMotionActivityTimer
{
  return self->_dominantMotionActivityTimer;
}

- (void)setDominantMotionActivityTimer:(id)a3
{
}

- (NSDate)lastQueryForMotionActivity
{
  return self->_lastQueryForMotionActivity;
}

- (void)setLastQueryForMotionActivity:(id)a3
{
}

- (NSMutableDictionary)uuidToPedometersMap
{
  return self->_uuidToPedometersMap;
}

- (void)setUuidToPedometersMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidToPedometersMap, 0);
  objc_storeStrong((id *)&self->_lastQueryForMotionActivity, 0);
  objc_storeStrong((id *)&self->_dominantMotionActivityTimer, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_activityAlarms, 0);
  objc_storeStrong((id *)&self->_dominantMotionActivity, 0);

  objc_storeStrong((id *)&self->_motionActivities, 0);
}

@end