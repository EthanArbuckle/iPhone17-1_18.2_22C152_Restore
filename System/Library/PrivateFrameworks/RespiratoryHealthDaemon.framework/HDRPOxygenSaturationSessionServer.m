@interface HDRPOxygenSaturationSessionServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDRPOxygenSaturationSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (HLOxygenSaturationSession)sensorSession;
- (NSDate)expectedEndDate;
- (OS_dispatch_queue)queue;
- (double)expectedDuration;
- (double)startTime;
- (id)exportedInterface;
- (id)remoteInterface;
- (int64_t)sessionState;
- (void)_queue_abortSensorSession;
- (void)_queue_abortWithCompletion:(id)a3;
- (void)_queue_notifyClientDidEndWithReason:(int64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7 error:(id)a8;
- (void)_queue_notifyClientDidSendFeedback:(unint64_t)a3;
- (void)_queue_notifyClientDidStartWithStartTime:(double)a3 expectedDuration:(double)a4;
- (void)_queue_startWithCompletion:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)oxygenSaturationSession:(id)a3 didBeginWithStartTime:(double)a4 expectedDuration:(double)a5;
- (void)oxygenSaturationSession:(id)a3 didEndForReason:(unint64_t)a4 measurement:(id)a5;
- (void)oxygenSaturationSession:(id)a3 feedbackDidChange:(unint64_t)a4;
- (void)remote_abortWithCompletion:(id)a3;
- (void)remote_startWithCompletion:(id)a3;
- (void)setExpectedDuration:(double)a3;
- (void)setExpectedEndDate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSensorSession:(id)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setStartTime:(double)a3;
@end

@implementation HDRPOxygenSaturationSessionServer

- (HDRPOxygenSaturationSessionServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)HDRPOxygenSaturationSessionServer;
  v6 = [(HDStandardTaskServer *)&v14 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    uint64_t v7 = HKCreateSerialDispatchQueueWithQOSClass();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = [(HDStandardTaskServer *)v6 profile];
    v10 = [v9 respiratoryExtension];
    uint64_t v11 = [v10 oxygenSaturationSessionWithDelegate:v6 queue:v6->_queue];
    sensorSession = v6->_sensorSession;
    v6->_sensorSession = (HLOxygenSaturationSession *)v11;
  }
  return v6;
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x263F64210] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F09BA8];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x263F64210] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F64210] clientInterface];
}

- (void)connectionInvalidated
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HDRPOxygenSaturationSessionServer_connectionInvalidated__block_invoke;
  block[3] = &unk_2647C6970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__HDRPOxygenSaturationSessionServer_connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_abortSensorSession");
}

- (void)connectionInterrupted
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HDRPOxygenSaturationSessionServer_connectionInterrupted__block_invoke;
  block[3] = &unk_2647C6970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__HDRPOxygenSaturationSessionServer_connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_abortSensorSession");
}

- (void)remote_startWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HDRPOxygenSaturationSessionServer_remote_startWithCompletion___block_invoke;
  v7[3] = &unk_2647C6A10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__HDRPOxygenSaturationSessionServer_remote_startWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startWithCompletion:", *(void *)(a1 + 40));
}

- (void)remote_abortWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HDRPOxygenSaturationSessionServer_remote_abortWithCompletion___block_invoke;
  v7[3] = &unk_2647C6A10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __64__HDRPOxygenSaturationSessionServer_remote_abortWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_abortWithCompletion:", *(void *)(a1 + 40));
}

- (void)_queue_startWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v7 = v12;
    _os_log_impl(&dword_226AA6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session start", buf, 0xCu);
  }
  unint64_t sessionState = self->_sessionState;
  if (sessionState)
  {
    if (sessionState > 3) {
      v9 = @"Not Started";
    }
    else {
      v9 = off_2647C6A58[sessionState - 1];
    }
    v10 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 100, @"Cannot start session in state: %@", v9);
    v4[2](v4, 0, v10);
  }
  else
  {
    [(HLOxygenSaturationSession *)self->_sensorSession begin];
    self->_unint64_t sessionState = 1;
    v4[2](v4, 1, 0);
  }
}

- (void)_queue_abortWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, uint64_t, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 138543362;
    id v10 = (id)objc_opt_class();
    id v7 = v10;
    _os_log_impl(&dword_226AA6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session abort", buf, 0xCu);
  }
  if (self->_sessionState)
  {
    [(HDRPOxygenSaturationSessionServer *)self _queue_abortSensorSession];
    self->_unint64_t sessionState = 3;
    v4[2](v4, 1, 0);
  }
  else
  {
    id v8 = objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 100, @"Cannot abort session in state: %@", @"Not Started");
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v8);
  }
}

- (void)_queue_abortSensorSession
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(HLOxygenSaturationSession *)self->_sensorSession abort];
  sensorSession = self->_sensorSession;
  self->_sensorSession = 0;
}

- (void)_queue_notifyClientDidSendFeedback:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__HDRPOxygenSaturationSessionServer__queue_notifyClientDidSendFeedback___block_invoke;
  v6[3] = &unk_2647C6A38;
  v6[4] = self;
  v5 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v6];
  objc_msgSend(v5, "clientRemote_didSendFeedback:", a3);
}

void __72__HDRPOxygenSaturationSessionServer__queue_notifyClientDidSendFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
    __72__HDRPOxygenSaturationSessionServer__queue_notifyClientDidSendFeedback___block_invoke_cold_1(a1, v4);
  }
}

- (void)_queue_notifyClientDidStartWithStartTime:(double)a3 expectedDuration:(double)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__HDRPOxygenSaturationSessionServer__queue_notifyClientDidStartWithStartTime_expectedDuration___block_invoke;
  v8[3] = &unk_2647C6A38;
  v8[4] = self;
  id v7 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v8];
  objc_msgSend(v7, "clientRemote_didStartWithStartTime:expectedDuration:", a3, a4);
}

void __95__HDRPOxygenSaturationSessionServer__queue_notifyClientDidStartWithStartTime_expectedDuration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
    __95__HDRPOxygenSaturationSessionServer__queue_notifyClientDidStartWithStartTime_expectedDuration___block_invoke_cold_1(a1, v4);
  }
}

- (void)_queue_notifyClientDidEndWithReason:(int64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7 error:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v28 = a7;
  id v16 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __147__HDRPOxygenSaturationSessionServer__queue_notifyClientDidEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke;
  v30[3] = &unk_2647C6A38;
  v30[4] = self;
  v17 = [(HDStandardTaskServer *)self remoteObjectProxyWithErrorHandler:v30];
  if (v13)
  {
    v18 = (void *)MEMORY[0x263F0A630];
    v19 = [MEMORY[0x263F0A830] percentUnit];
    [v13 doubleValue];
    v21 = [v18 quantityWithUnit:v19 doubleValue:v20 / 100.0];

    if (v14) {
      goto LABEL_3;
    }
LABEL_6:
    v24 = 0;
    if (v15) {
      goto LABEL_4;
    }
LABEL_7:
    v27 = 0;
    goto LABEL_8;
  }
  v21 = 0;
  if (!v14) {
    goto LABEL_6;
  }
LABEL_3:
  v22 = (void *)MEMORY[0x263F0A630];
  v23 = [MEMORY[0x263F0A830] pascalUnitWithMetricPrefix:9];
  [v14 doubleValue];
  v24 = objc_msgSend(v22, "quantityWithUnit:doubleValue:", v23);

  if (!v15) {
    goto LABEL_7;
  }
LABEL_4:
  v25 = (void *)MEMORY[0x263F0A630];
  v26 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  [v15 doubleValue];
  v27 = objc_msgSend(v25, "quantityWithUnit:doubleValue:", v26);

LABEL_8:
  objc_msgSend(v17, "clientRemote_didEndWithReason:saturation:barometricPressure:averageHeartRate:averageHeartRateUUID:error:", a3, v21, v24, v27, v28, v16);
}

void __147__HDRPOxygenSaturationSessionServer__queue_notifyClientDidEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
    __147__HDRPOxygenSaturationSessionServer__queue_notifyClientDidEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke_cold_1(a1, v4);
  }
}

- (void)oxygenSaturationSession:(id)a3 didBeginWithStartTime:(double)a4 expectedDuration:(double)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(HDRPOxygenSaturationSessionServer *)self setStartTime:a3];
  [(HDRPOxygenSaturationSessionServer *)self setExpectedDuration:a5];
  id v8 = [MEMORY[0x263EFF910] now];
  v9 = [v8 dateByAddingTimeInterval:-(CACurrentMediaTime() - a4)];
  id v10 = [v9 dateByAddingTimeInterval:a5];
  [(HDRPOxygenSaturationSessionServer *)self setExpectedEndDate:v10];

  _HKInitializeLogging();
  uint64_t v11 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = objc_opt_class();
    id v14 = v13;
    id v15 = [(HDRPOxygenSaturationSessionServer *)self expectedEndDate];
    int v16 = 138544130;
    v17 = v13;
    __int16 v18 = 2114;
    v19 = v9;
    __int16 v20 = 2050;
    double v21 = a5;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_226AA6000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session did begin with Start date: %{public}@, Duration: %{public}.1f sec, Expected end date: %{public}@", (uint8_t *)&v16, 0x2Au);
  }
  self->_unint64_t sessionState = 2;
  [(HDRPOxygenSaturationSessionServer *)self _queue_notifyClientDidStartWithStartTime:a4 expectedDuration:a5];
}

- (void)oxygenSaturationSession:(id)a3 feedbackDidChange:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(HDRPOxygenSaturationSessionServer *)self startTime];
  double v7 = v6;
  [(HDRPOxygenSaturationSessionServer *)self expectedDuration];
  double v9 = v8;
  double v10 = CACurrentMediaTime();
  _HKInitializeLogging();
  uint64_t v11 = (id)*MEMORY[0x263F09950];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 + v9 - v10 >= 0.0) {
      double v12 = v7 + v9 - v10;
    }
    else {
      double v12 = 0.0;
    }
    id v13 = (id)objc_opt_class();
    if (a4)
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v15 = v14;
      if (a4) {
        [v14 addObject:@"Motion"];
      }
      if ((a4 & 2) != 0) {
        [v15 addObject:@"Posture"];
      }
      int v16 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v15];
    }
    else
    {
      int v16 = @"None";
    }
    int v17 = 138543874;
    id v18 = v13;
    __int16 v19 = 2114;
    __int16 v20 = v16;
    __int16 v21 = 2050;
    double v22 = v12;
    _os_log_impl(&dword_226AA6000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session feedback did change: (%{public}@) at %{public}.1f sec", (uint8_t *)&v17, 0x20u);
  }
  [(HDRPOxygenSaturationSessionServer *)self _queue_notifyClientDidSendFeedback:a4 & 3];
}

- (void)oxygenSaturationSession:(id)a3 didEndForReason:(unint64_t)a4 measurement:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a5;
  _HKInitializeLogging();
  double v8 = (id)*MEMORY[0x263F09950];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = objc_opt_class();
    if (a4 - 1 > 4) {
      double v10 = @"Success";
    }
    else {
      double v10 = off_2647C6A70[a4 - 1];
    }
    *(_DWORD *)__int16 v20 = 138543618;
    *(void *)&v20[4] = v9;
    *(_WORD *)&v20[12] = 2114;
    *(void *)&v20[14] = v10;
    id v11 = v9;
    _os_log_impl(&dword_226AA6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Session did end with reason: %{public}@", v20, 0x16u);
  }
  if (a4 > 4) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = qword_226AADC58[a4];
  }
  self->_unint64_t sessionState = 3;
  id v13 = objc_msgSend(v7, "oxygenSaturationPercentage", *(_OWORD *)v20, *(void *)&v20[16], v21);
  id v14 = [v7 pressureInKilopascals];
  id v15 = NSNumber;
  int v16 = [v7 averageHeartRateData];
  [v16 heartRate];
  int v17 = objc_msgSend(v15, "numberWithDouble:");
  id v18 = [v7 averageHeartRateData];

  __int16 v19 = [v18 uuid];
  [(HDRPOxygenSaturationSessionServer *)self _queue_notifyClientDidEndWithReason:v12 saturation:v13 barometricPressure:v14 averageHeartRate:v17 averageHeartRateUUID:v19 error:0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  self->_unint64_t sessionState = a3;
}

- (HLOxygenSaturationSession)sensorSession
{
  return self->_sensorSession;
}

- (void)setSensorSession:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (void)setExpectedDuration:(double)a3
{
  self->_expectedDuration = a3;
}

- (NSDate)expectedEndDate
{
  return self->_expectedEndDate;
}

- (void)setExpectedEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedEndDate, 0);
  objc_storeStrong((id *)&self->_sensorSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__HDRPOxygenSaturationSessionServer__queue_notifyClientDidSendFeedback___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Error notifying Oxygen Saturation Session client of feedback update: %{public}@", v7, v8, v9, v10, v11);
}

void __95__HDRPOxygenSaturationSessionServer__queue_notifyClientDidStartWithStartTime_expectedDuration___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Error notifying Oxygen Saturation Session client of session start with expected end date: %{public}@", v7, v8, v9, v10, v11);
}

void __147__HDRPOxygenSaturationSessionServer__queue_notifyClientDidEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Error notifying Oxygen Saturation Session client of session end: %{public}@", v7, v8, v9, v10, v11);
}

@end