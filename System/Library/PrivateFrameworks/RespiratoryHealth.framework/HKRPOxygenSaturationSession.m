@interface HKRPOxygenSaturationSession
+ (id)clientInterface;
+ (id)serverInterface;
- (HKHealthStore)healthStore;
- (HKRPOxygenSaturationSession)init;
- (HKRPOxygenSaturationSession)initWithHealthStore:(id)a3;
- (HKRPOxygenSaturationSessionDelegate)delegate;
- (HKTaskServerProxyProvider)proxyProvider;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)abortWithCompletion:(id)a3;
- (void)clientRemote_didEndWithReason:(int64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7 error:(id)a8;
- (void)clientRemote_didSendFeedback:(unint64_t)a3;
- (void)clientRemote_didStartWithStartTime:(double)a3 expectedDuration:(double)a4;
- (void)connectionInterrupted;
- (void)setDelegate:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setProxyProvider:(id)a3;
- (void)startWithCompletion:(id)a3;
@end

@implementation HKRPOxygenSaturationSession

- (HKRPOxygenSaturationSession)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKRPOxygenSaturationSession)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKRPOxygenSaturationSession;
  v6 = [(HKRPOxygenSaturationSession *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    id v8 = objc_alloc(MEMORY[0x263F0A818]);
    healthStore = v7->_healthStore;
    v10 = [(id)objc_opt_class() taskIdentifier];
    v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v8 initWithHealthStore:healthStore taskIdentifier:v10 exportedObject:v7 taskUUID:v11];
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v12;

    [(HKTaskServerProxyProvider *)v7->_proxyProvider setShouldRetryOnInterruption:0];
  }

  return v7;
}

- (void)startWithCompletion:(id)a3
{
  uint64_t v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__HKRPOxygenSaturationSession_startWithCompletion___block_invoke;
  v9[3] = &unk_264447490;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HKRPOxygenSaturationSession_startWithCompletion___block_invoke_2;
  v7[3] = &unk_2644474B8;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __51__HKRPOxygenSaturationSession_startWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __51__HKRPOxygenSaturationSession_startWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)abortWithCompletion:(id)a3
{
  uint64_t v4 = [(HKTaskServerProxyProvider *)self->_proxyProvider clientQueueActionHandlerWithCompletion:a3];
  proxyProvider = self->_proxyProvider;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__HKRPOxygenSaturationSession_abortWithCompletion___block_invoke;
  v9[3] = &unk_264447490;
  id v10 = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__HKRPOxygenSaturationSession_abortWithCompletion___block_invoke_2;
  v7[3] = &unk_2644474B8;
  id v8 = v10;
  id v6 = v10;
  [(HKTaskServerProxyProvider *)proxyProvider fetchProxyWithHandler:v9 errorHandler:v7];
}

uint64_t __51__HKRPOxygenSaturationSession_abortWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_abortWithCompletion:", *(void *)(a1 + 32));
}

uint64_t __51__HKRPOxygenSaturationSession_abortWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clientRemote_didSendFeedback:(unint64_t)a3
{
  id v5 = [(HKHealthStore *)self->_healthStore clientQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__HKRPOxygenSaturationSession_clientRemote_didSendFeedback___block_invoke;
  v6[3] = &unk_2644474E0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __60__HKRPOxygenSaturationSession_clientRemote_didSendFeedback___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 oxygenSaturationSession:*(void *)(a1 + 32) didSendFeedback:*(void *)(a1 + 40)];
  }
}

- (void)clientRemote_didStartWithStartTime:(double)a3 expectedDuration:(double)a4
{
  v7 = [(HKHealthStore *)self->_healthStore clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__HKRPOxygenSaturationSession_clientRemote_didStartWithStartTime_expectedDuration___block_invoke;
  block[3] = &unk_264447508;
  block[4] = self;
  *(double *)&block[5] = a3;
  *(double *)&block[6] = a4;
  dispatch_async(v7, block);
}

void __83__HKRPOxygenSaturationSession_clientRemote_didStartWithStartTime_expectedDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained oxygenSaturationSession:*(void *)(a1 + 32) didStartWithStartTime:*(double *)(a1 + 40) expectedDuration:*(double *)(a1 + 48)];
}

- (void)clientRemote_didEndWithReason:(int64_t)a3 saturation:(id)a4 barometricPressure:(id)a5 averageHeartRate:(id)a6 averageHeartRateUUID:(id)a7 error:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [(HKHealthStore *)self->_healthStore clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __135__HKRPOxygenSaturationSession_clientRemote_didEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke;
  block[3] = &unk_264447530;
  id v30 = v18;
  int64_t v31 = a3;
  block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(v19, block);
}

void __135__HKRPOxygenSaturationSession_clientRemote_didEndWithReason_saturation_barometricPressure_averageHeartRate_averageHeartRateUUID_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  [WeakRetained oxygenSaturationSession:a1[4] didEndWithReason:a1[10] saturation:a1[5] barometricPressure:a1[6] averageHeartRate:a1[7] averageHeartRateUUID:a1[8] error:a1[9]];
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CDD6880];
}

+ (id)serverInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CDD9DE0];
}

- (id)exportedInterface
{
  return +[HKRPOxygenSaturationSession clientInterface];
}

- (id)remoteInterface
{
  return +[HKRPOxygenSaturationSession serverInterface];
}

- (void)connectionInterrupted
{
  char v3 = [(HKHealthStore *)self->_healthStore clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HKRPOxygenSaturationSession_connectionInterrupted__block_invoke;
  block[3] = &unk_264447558;
  block[4] = self;
  dispatch_async(v3, block);
}

void __52__HKRPOxygenSaturationSession_connectionInterrupted__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x263F087E8], "hk_error:description:", 100, @"Connection interrupted");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained oxygenSaturationSession:*(void *)(a1 + 32) didEndWithReason:4 saturation:0 barometricPressure:0 averageHeartRate:0 averageHeartRateUUID:0 error:v3];
}

- (HKRPOxygenSaturationSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HKRPOxygenSaturationSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

- (HKTaskServerProxyProvider)proxyProvider
{
  return self->_proxyProvider;
}

- (void)setProxyProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end