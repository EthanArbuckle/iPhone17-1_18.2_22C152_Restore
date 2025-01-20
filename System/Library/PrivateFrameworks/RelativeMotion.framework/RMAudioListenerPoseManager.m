@interface RMAudioListenerPoseManager
- (BOOL)isReceivingRelatveData;
- (NSDictionary)tempestOptions;
- (RMAudioListenerPoseManager)initWithQueue:(id)a3;
- (id)audioListenerPoseConfigurationWithForceSessionRestart:(void *)a1;
- (uint64_t)connectionClient;
- (uint64_t)poseCallbackInternal;
- (uint64_t)queue;
- (uint64_t)setIsReceivingRelatveData:(uint64_t)result;
- (uint64_t)statusCallback;
- (void)invalidate;
- (void)setConnectionClient:(uint64_t)a1;
- (void)setPoseCallbackInternal:(void *)a1;
- (void)setQueue:(uint64_t)a1;
- (void)setStatusCallback:(void *)a1;
- (void)setTempestOptions:(id)a3;
- (void)startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:(BOOL)a3 poseCallback:(id)a4 statusCallback:(id)a5;
- (void)startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:(BOOL)a3 poseCallbackInternal:(id)a4 statusCallback:(id)a5;
- (void)stopReceivingAudioListenerPoseUpdates;
@end

@implementation RMAudioListenerPoseManager

- (RMAudioListenerPoseManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMAudioListenerPoseManager;
  v6 = [(RMAudioListenerPoseManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = -[RMConnectionClient initWithQueue:serviceName:messageHandler:]((id *)[RMConnectionClient alloc], v5, @"com.apple.relatived.tempest", &__block_literal_global_1);
    connectionClient = v7->_connectionClient;
    v7->_connectionClient = (RMConnectionClient *)v8;
  }
  return v7;
}

- (void)setQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setConnectionClient:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)invalidate
{
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (self->_isReceivingRelatveData) {
      [(RMAudioListenerPoseManager *)self stopReceivingAudioListenerPoseUpdates];
    }
    connectionClient = self->_connectionClient;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    connectionClient = 0;
  }
  -[RMConnectionClient invalidate]((uint64_t)connectionClient);
  -[RMAudioListenerPoseManager setConnectionClient:]((uint64_t)self, 0);
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v4, 0, 32);
  }
}

- (uint64_t)queue
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (BOOL)isReceivingRelatveData
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (uint64_t)connectionClient
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (void)setPoseCallbackInternal:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
  }
}

- (id)audioListenerPoseConfigurationWithForceSessionRestart:(void *)a1
{
  if (a1)
  {
    v4 = objc_opt_new();
    [v4 setObject:@"ABC0BF2F-620E-4ADF-8291-7624B6B0889A" forKeyedSubscript:@"Identifier"];
    [v4 setObject:&unk_26E9B0688 forKeyedSubscript:@"Interval"];
    id v5 = [a1 tempestOptions];

    if (v5)
    {
      v6 = [a1 tempestOptions];
      [v4 setObject:v6 forKeyedSubscript:@"TempestOptions"];
    }
    v7 = [NSNumber numberWithBool:a2];
    [v4 setObject:v7 forKeyedSubscript:@"ForceSessionRestart"];

    id v13 = 0;
    v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v13];
    id v9 = v13;
    if (!v8)
    {
      if (onceToken_TempestDataManager_Default != -1) {
        dispatch_once(&onceToken_TempestDataManager_Default, &__block_literal_global_65);
      }
      v10 = logObject_TempestDataManager_Default;
      if (os_log_type_enabled((os_log_t)logObject_TempestDataManager_Default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_23673D000, v10, OS_LOG_TYPE_ERROR, "failed to archive configurations\n", v12, 2u);
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:(BOOL)a3 poseCallbackInternal:(id)a4 statusCallback:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_setProperty_nonatomic_copy(self, v10, v8, 32);
    objc_setProperty_nonatomic_copy(self, v11, v9, 40);
    connectionClient = self->_connectionClient;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    connectionClient = 0;
  }
  -[RMConnectionClient connect]((uint64_t)connectionClient);
  id v13 = -[RMAudioListenerPoseManager audioListenerPoseConfigurationWithForceSessionRestart:](self, v6);
  if (self) {
    v14 = self->_connectionClient;
  }
  else {
    v14 = 0;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __128__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallbackInternal_statusCallback___block_invoke;
  v18[3] = &unk_264CACAC8;
  v18[4] = self;
  -[RMConnectionClient requestStreamingWithMessage:data:callback:]((uint64_t)v14, @"kRMStartStreamingAudioListenerPose", v13, v18);
  if (onceToken_TempestDataReceiver_Default != -1) {
    dispatch_once(&onceToken_TempestDataReceiver_Default, &__block_literal_global_69);
  }
  v15 = logObject_TempestDataReceiver_Default;
  if (os_log_type_enabled((os_log_t)logObject_TempestDataReceiver_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_23673D000, v15, OS_LOG_TYPE_DEFAULT, "Sending message for relatived to hold onto priority.", v17, 2u);
  }
  if (self) {
    v16 = self->_connectionClient;
  }
  else {
    v16 = 0;
  }
  -[RMConnectionClient sendMessage:withData:reply:]((uint64_t)v16, @"kRMConnectionMessagePriorityBoost", 0, &__block_literal_global_33);
}

- (void)setStatusCallback:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
  }
}

void __128__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallbackInternal_statusCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 32);
    }
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        uint64_t v9 = *(void *)(v8 + 32);
      }
      else {
        uint64_t v9 = 0;
      }
      SEL v10 = *(void (**)(uint64_t, long long *, id))(v9 + 16);
      uint64_t v32 = 0;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v10(v9, &v28, v6);
    }
  }
  else
  {
    uint64_t v11 = [v5 length];
    if (v11 == 8)
    {
      uint64_t v15 = [v5 bytes];
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16) {
        uint64_t v16 = *(void *)(v16 + 40);
      }
      if (v16)
      {
        v17 = [[RMMediaSessionStatus alloc] initWithInternal:v15];
        uint64_t v18 = *(void *)(a1 + 32);
        if (v18) {
          uint64_t v19 = *(void *)(v18 + 40);
        }
        else {
          uint64_t v19 = 0;
        }
        (*(void (**)(uint64_t, RMMediaSessionStatus *))(v19 + 16))(v19, v17);
      }
    }
    else
    {
      uint64_t v12 = v11;
      if (v11 == 72)
      {
        uint64_t v13 = [v5 bytes];
        if (*(void *)(v13 + 40) == 2) {
          v14 = 0;
        }
        else {
          v14 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"kRMErrorDomain" code:*(void *)(v13 + 40) userInfo:0];
        }
        uint64_t v21 = *(void *)(a1 + 32);
        if (v21) {
          uint64_t v21 = *(void *)(v21 + 32);
        }
        if (v21)
        {
          uint64_t v22 = *(void *)(a1 + 32);
          if (v22) {
            uint64_t v23 = *(void *)(v22 + 32);
          }
          else {
            uint64_t v23 = 0;
          }
          v24 = *(void (**)(uint64_t, long long *, void *))(v23 + 16);
          long long v28 = *(_OWORD *)v13;
          long long v25 = *(_OWORD *)(v13 + 16);
          long long v26 = *(_OWORD *)(v13 + 32);
          long long v27 = *(_OWORD *)(v13 + 48);
          uint64_t v32 = *(void *)(v13 + 64);
          long long v30 = v26;
          long long v31 = v27;
          long long v29 = v25;
          v24(v23, &v28, v14);
        }
      }
      else
      {
        if (onceToken_TempestDataReceiver_Default != -1) {
          dispatch_once(&onceToken_TempestDataReceiver_Default, &__block_literal_global_69);
        }
        v20 = logObject_TempestDataReceiver_Default;
        if (os_log_type_enabled((os_log_t)logObject_TempestDataReceiver_Default, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v28) = 134217984;
          *(void *)((char *)&v28 + 4) = v12;
          _os_log_impl(&dword_23673D000, v20, OS_LOG_TYPE_DEFAULT, "invalid data size %lu", (uint8_t *)&v28, 0xCu);
        }
      }
    }
  }
}

- (uint64_t)poseCallbackInternal
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)statusCallback
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

void __128__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallbackInternal_statusCallback___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (onceToken_TempestDataReceiver_Default != -1) {
    dispatch_once(&onceToken_TempestDataReceiver_Default, &__block_literal_global_69);
  }
  id v6 = logObject_TempestDataReceiver_Default;
  if (os_log_type_enabled((os_log_t)logObject_TempestDataReceiver_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_23673D000, v6, OS_LOG_TYPE_DEFAULT, "Received reply for priority message.", v7, 2u);
  }
}

- (void)startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:(BOOL)a3 poseCallback:(id)a4 statusCallback:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __120__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallback_statusCallback___block_invoke;
  v10[3] = &unk_264CACB10;
  id v11 = v8;
  id v9 = v8;
  [(RMAudioListenerPoseManager *)self startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:v6 poseCallbackInternal:v10 statusCallback:a5];
}

void __120__RMAudioListenerPoseManager_startReceivingAudioListenerPoseUpdatesWithForceSessionRestart_poseCallback_statusCallback___block_invoke(uint64_t a1, double *a2, void *a3)
{
  id v5 = a3;
  id v7 = -[RMAttitude _initWithQuaternion:timestamp:]([RMAttitude alloc], "_initWithQuaternion:timestamp:", *a2, a2[1], a2[2], a2[3], a2[4]);
  id v6 = [[RMPose alloc] _initWithAttitude:v7 consumedAuxTimestamp:a2[6] receivedAuxTimestamp:a2[7] machAbsTimestamp:a2[8]];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopReceivingAudioListenerPoseUpdates
{
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    connectionClient = self->_connectionClient;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    connectionClient = 0;
  }
  -[RMConnectionClient stopStreaming]((uint64_t)connectionClient);
  if (self)
  {
    self->_isReceivingRelatveData = 0;
    objc_setProperty_nonatomic_copy(self, v4, 0, 32);
    objc_setProperty_nonatomic_copy(self, v5, 0, 40);
  }
}

- (uint64_t)setIsReceivingRelatveData:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

- (NSDictionary)tempestOptions
{
  return self->_tempestOptions;
}

- (void)setTempestOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionClient, 0);
  objc_storeStrong(&self->_statusCallback, 0);
  objc_storeStrong(&self->_poseCallbackInternal, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tempestOptions, 0);
}

@end