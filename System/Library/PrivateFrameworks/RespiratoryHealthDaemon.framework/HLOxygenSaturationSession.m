@interface HLOxygenSaturationSession
- (HLOxygenSaturationSession)initWithDelegate:(id)a3 onQueue:(id)a4;
- (HLOxygenSaturationSessionDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)abort;
- (void)begin;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)unitTesting_deliverFeedback:(unint64_t)a3;
- (void)unitTesting_endSessionWithReason:(unint64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7;
@end

@implementation HLOxygenSaturationSession

- (HLOxygenSaturationSession)initWithDelegate:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HLOxygenSaturationSession;
  v8 = [(HLOxygenSaturationSession *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (void)begin
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HLOxygenSaturationSession_begin__block_invoke;
  block[3] = &unk_2647C6970;
  block[4] = self;
  dispatch_async(queue, block);
}

void __34__HLOxygenSaturationSession_begin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained oxygenSaturationSession:*(void *)(a1 + 32) didBeginWithStartTime:CACurrentMediaTime() expectedDuration:15.0];
}

- (void)abort
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HLOxygenSaturationSession_abort__block_invoke;
  block[3] = &unk_2647C6970;
  block[4] = self;
  dispatch_async(queue, block);
}

void __34__HLOxygenSaturationSession_abort__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained oxygenSaturationSession:*(void *)(a1 + 32) didEndForReason:2 measurement:0];
}

- (void)unitTesting_deliverFeedback:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__HLOxygenSaturationSession_unitTesting_deliverFeedback___block_invoke;
  v4[3] = &unk_2647C6998;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __57__HLOxygenSaturationSession_unitTesting_deliverFeedback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained oxygenSaturationSession:*(void *)(a1 + 32) feedbackDidChange:*(void *)(a1 + 40)];
}

- (void)unitTesting_endSessionWithReason:(unint64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = objc_alloc_init(HLHeartRateData);
  [v13 doubleValue];
  double v18 = v17;

  [(HLHeartRateData *)v16 setHeartRate:v18];
  [(HLHeartRateData *)v16 setUuid:v12];

  v19 = objc_alloc_init(HLOxygenSaturationMeasurement);
  [(HLOxygenSaturationMeasurement *)v19 setOxygenSaturationPercentage:v15];

  [(HLOxygenSaturationMeasurement *)v19 setAverageHeartRateData:v16];
  [(HLOxygenSaturationMeasurement *)v19 setPressureInKilopascals:v14];

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __130__HLOxygenSaturationSession_unitTesting_endSessionWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID___block_invoke;
  block[3] = &unk_2647C69C0;
  v23 = v19;
  unint64_t v24 = a3;
  block[4] = self;
  v21 = v19;
  dispatch_async(queue, block);
}

void __130__HLOxygenSaturationSession_unitTesting_endSessionWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained oxygenSaturationSession:a1[4] didEndForReason:a1[6] measurement:a1[5]];
}

- (HLOxygenSaturationSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HLOxygenSaturationSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end