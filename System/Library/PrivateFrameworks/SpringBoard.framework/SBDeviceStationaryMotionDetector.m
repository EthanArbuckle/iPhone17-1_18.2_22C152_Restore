@interface SBDeviceStationaryMotionDetector
+ (int64_t)stateFromTimeSinceLastStationary:(double)a3 timeSinceLastNonStationary:(double)a4 stationaryThreshold:(double)a5 pickUpBuffer:(double)a6;
- (SBDeviceStationaryMotionDetector)init;
- (void)queryWithStationaryThresholdTime:(double)a3 pickUpBufferTime:(double)a4 callbackOnMainQueue:(id)a5;
@end

@implementation SBDeviceStationaryMotionDetector

- (SBDeviceStationaryMotionDetector)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeviceStationaryMotionDetector;
  v2 = [(SBDeviceStationaryMotionDetector *)&v6 init];
  if (v2)
  {
    v3 = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E4F22220]);
    activityManager = v2->_activityManager;
    v2->_activityManager = v3;
  }
  return v2;
}

- (void)queryWithStationaryThresholdTime:(double)a3 pickUpBufferTime:(double)a4 callbackOnMainQueue:(id)a5
{
  id v9 = a5;
  if (a3 <= 0.0)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBDeviceStationaryMotionDetector.m", 49, @"Invalid parameter not satisfying: %@", @"stationaryThreshold > 0" object file lineNumber description];
  }
  if (a4 <= 0.0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBDeviceStationaryMotionDetector.m", 50, @"Invalid parameter not satisfying: %@", @"pickUpBufferTime > 0" object file lineNumber description];

    if (v9) {
      goto LABEL_5;
    }
LABEL_7:
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBDeviceStationaryMotionDetector.m", 51, @"Invalid parameter not satisfying: %@", @"callback != nil" object file lineNumber description];

    goto LABEL_5;
  }
  if (!v9) {
    goto LABEL_7;
  }
LABEL_5:
  v10 = [MEMORY[0x1E4F1C9C8] now];
  v11 = [v10 dateByAddingTimeInterval:-(a3 + a4 + 1.0)];
  activityManager = self->_activityManager;
  v13 = [MEMORY[0x1E4F28F08] mainQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __106__SBDeviceStationaryMotionDetector_queryWithStationaryThresholdTime_pickUpBufferTime_callbackOnMainQueue___block_invoke;
  v19[3] = &unk_1E6AFC388;
  double v22 = a3;
  double v23 = a4;
  id v20 = v10;
  id v21 = v9;
  id v14 = v9;
  id v15 = v10;
  [(CMMotionActivityManager *)activityManager queryActivityStartingFromDate:v11 toDate:v15 toQueue:v13 withHandler:v19];
}

void __106__SBDeviceStationaryMotionDetector_queryWithStationaryThresholdTime_pickUpBufferTime_callbackOnMainQueue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1C9C8] now];
  [v4 timeIntervalSince1970];
  double v6 = v5;
  [*(id *)(a1 + 32) timeIntervalSince1970];
  double v8 = v7;

  id v9 = SBLogStationaryMotionDetector();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v33 = v6 - v8;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "CMMotionActivityManager responded in %0.2f seconds.", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v10 = [v3 reverseObjectEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    double v14 = 1.79769313e308;
    double v15 = 1.79769313e308;
LABEL_5:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(v10);
      }
      v17 = *(__CFString **)(*((void *)&v27 + 1) + 8 * v16);
      v18 = SBLogStationaryMotionDetector();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        double v33 = *(double *)&v17;
        _os_log_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEFAULT, "Processing Activity %{public}@", buf, 0xCu);
      }

      if (v15 != 1.79769313e308 && v14 != 1.79769313e308) {
        break;
      }
      [*(id *)(a1 + 32) timeIntervalSince1970];
      double v20 = v19;
      id v21 = [(__CFString *)v17 startDate];
      [v21 timeIntervalSince1970];
      double v23 = v20 - v22;

      if (([(__CFString *)v17 stationary] & 1) != 0 || v14 != 1.79769313e308)
      {
        if (([(__CFString *)v17 stationary] & (v15 == 1.79769313e308)) != 0) {
          double v15 = v23;
        }
      }
      else
      {
        double v14 = v23;
      }
      if (v12 == ++v16)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    double v14 = 1.79769313e308;
    double v15 = 1.79769313e308;
  }

  unint64_t v24 = +[SBDeviceStationaryMotionDetector stateFromTimeSinceLastStationary:v15 timeSinceLastNonStationary:v14 stationaryThreshold:*(double *)(a1 + 48) pickUpBuffer:*(double *)(a1 + 56)];
  v25 = SBLogStationaryMotionDetector();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (v24 > 2) {
      *(double *)&v26 = COERCE_DOUBLE(@"No Description");
    }
    else {
      v26 = off_1E6AFC3A8[v24];
    }
    *(_DWORD *)buf = 138543362;
    double v33 = *(double *)&v26;
    _os_log_impl(&dword_1D85BA000, v25, OS_LOG_TYPE_DEFAULT, "Resolved state %{public}@", buf, 0xCu);
  }

  (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(v15, v14);
}

+ (int64_t)stateFromTimeSinceLastStationary:(double)a3 timeSinceLastNonStationary:(double)a4 stationaryThreshold:(double)a5 pickUpBuffer:(double)a6
{
  if (a3 == a4) {
    return 0;
  }
  if (a4 <= a6) {
    return 1;
  }
  if (a3 >= a5 && a3 < a4) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void).cxx_destruct
{
}

@end