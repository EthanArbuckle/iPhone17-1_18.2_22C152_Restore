@interface PRProximityEstimator
- (BOOL)addRssiSample:(double)a3 channel:(unsigned int)a4 forPeer:(id)a5 withError:(id *)a6;
- (BOOL)startEstimatingProximityFor:(id)a3 peerDeviceModel:(id)a4 withError:(id *)a5;
- (BOOL)stopEstimatingProximityFor:(id)a3 withError:(id *)a4;
- (PRProximityEstimator)init;
- (PRProximityEstimator)initWithDelegate:(id)a3 delegateQueue:(id)a4;
- (PRProximityEstimatorDelegate)delegate;
- (id)initSingleThresholdEstmatorWithDelegate:(id)a3 delegateQueue:(id)a4;
- (void)invokeDelegateBlock:(id)a3;
@end

@implementation PRProximityEstimator

- (PRProximityEstimator)init
{
  return 0;
}

- (PRProximityEstimator)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PRProximityEstimator.mm", 321, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PRProximityEstimator;
  v9 = [(PRProximityEstimator *)&v16 init];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.nearbyd", "PRProximityEstimator");
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    devicesMonitered = v9->devicesMonitered;
    v9->devicesMonitered = v12;

    v9->usingST = 0;
  }

  return v9;
}

- (id)initSingleThresholdEstmatorWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    objc_super v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PRProximityEstimator.mm", 337, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)PRProximityEstimator;
  v9 = [(PRProximityEstimator *)&v17 init];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.nearbyd", "PRProximityEstimator");
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    devicesMonitered = v9->devicesMonitered;
    v9->devicesMonitered = v12;

    v9->usingST = 1;
    v14 = v9->_logger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PRProximityEstimator initSingleThresholdEstmatorWithDelegate:delegateQueue:](v14);
    }
  }

  return v9;
}

- (BOOL)startEstimatingProximityFor:(id)a3 peerDeviceModel:(id)a4 withError:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  os_log_t v10 = [(NSMutableDictionary *)self->devicesMonitered objectForKeyedSubscript:v8];
  if (!v10)
  {
    if (self->usingST)
    {
      uint64_t v24 = 0;
      v14 = (id *)&v24;
      v15 = [[PRProximitySingleThresholdDevice alloc] initWithPeer:v8 andPeerModel:v9 withError:&v24];
    }
    else
    {
      uint64_t v23 = 0;
      v14 = (id *)&v23;
      v15 = [[PRProximityDevice alloc] initWithPeer:v8 andPeerModel:v9 withError:&v23];
    }
    os_log_t v10 = v15;
    id v16 = *v14;
    v12 = v16;
    if (v10)
    {
      objc_super v17 = self;
      objc_sync_enter(v17);
      [(NSMutableDictionary *)self->devicesMonitered setObject:v10 forKeyedSubscript:v8];
      objc_sync_exit(v17);

      BOOL v13 = 1;
    }
    else
    {
      if (v16)
      {
        v18 = (void *)MEMORY[0x1E4F28C58];
        v19 = [v16 userInfo];
        *a5 = [v18 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:200 userInfo:v19];
      }
      else if (a5)
      {
        v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        v28[0] = @"Memeory Allocation failure";
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        *a5 = [v20 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:200 userInfo:v21];
      }
      BOOL v13 = 0;
    }
    goto LABEL_15;
  }
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26 = @"Peer Already being monitored";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [v11 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:200 userInfo:v12];
    BOOL v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

- (BOOL)stopEstimatingProximityFor:(id)a3 withError:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->devicesMonitered objectForKeyedSubscript:v6];
  if (v7)
  {
    id v8 = self;
    objc_sync_enter(v8);
    [(NSMutableDictionary *)self->devicesMonitered removeObjectForKey:v6];
    objc_sync_exit(v8);
  }
  else if (a4)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Peer not being monitored";
    os_log_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a4 = [v9 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:201 userInfo:v10];
  }
  return v7 != 0;
}

- (BOOL)addRssiSample:(double)a3 channel:(unsigned int)a4 forPeer:(id)a5 withError:(id *)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  v11 = [(NSMutableDictionary *)self->devicesMonitered objectForKeyedSubscript:v10];
  if (v11)
  {
    uint64_t v12 = self;
    objc_sync_enter(v12);
    v21[0] = PRCommonGetMachContinuousTimeSeconds();
    *(double *)&v21[1] = a3;
    unsigned int v22 = a4;
    [v11 addSample:v21];
    if ([v11 proxReady])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v12->_delegate);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __64__PRProximityEstimator_addRssiSample_channel_forPeer_withError___block_invoke;
      v17[3] = &unk_1E599A218;
      id v18 = WeakRetained;
      v19 = v12;
      id v20 = v11;
      id v14 = WeakRetained;
      [(PRProximityEstimator *)v12 invokeDelegateBlock:v17];
    }
    objc_sync_exit(v12);
    goto LABEL_7;
  }
  if (a6)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Peer not being monitored";
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a6 = [v15 errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:202 userInfo:v12];
LABEL_7:
  }
  return v11 != 0;
}

void __64__PRProximityEstimator_addRssiSample_channel_forPeer_withError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 48) deviceProximity];
  id v5 = [*(id *)(a1 + 48) peer];
  objc_msgSend(v2, "estimator:didEstimateProximity:toPeer:", v3, v4);
}

- (void)invokeDelegateBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  delegateQueue = self->_delegateQueue;
  id v6 = v4;
  if (delegateQueue) {
    dispatch_async(delegateQueue, v4);
  }
  else {
    v4[2](v4);
  }
}

- (PRProximityEstimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRProximityEstimatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->devicesMonitered, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)initSingleThresholdEstmatorWithDelegate:(os_log_t)log delegateQueue:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19DFF5000, log, OS_LOG_TYPE_DEBUG, "Using Single Threshold estimator.", v1, 2u);
}

@end