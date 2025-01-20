@interface RMRelativeMotionManager
+ (BOOL)isAudioListenerPoseAvailable;
- (NSDictionary)audioListenerPoseOptions;
- (RMRelativeMotionManager)initWithQueue:(id)a3;
- (id)getCurrentAudioListenerPoseWithError:(int64_t *)a3;
- (id)getCurrentDummyData;
- (int64_t)getCurrentAudioListenerPose:(id *)a3 timestamp:(double *)a4;
- (os_unfair_lock_s)getCurrentAudioListenerPoseInternal:(os_unfair_lock_s *)a1;
- (uint64_t)audioListenerPoseManager;
- (uint64_t)currentAudioListenerPoseBufferIndex;
- (uint64_t)defaults;
- (uint64_t)dummyDataManager;
- (uint64_t)queue;
- (uint64_t)setCurrentAudioListenerPoseBufferIndex:(uint64_t)result;
- (uint64_t)setShouldReceiveAudioListenerPose:(uint64_t)result;
- (uint64_t)setShouldReceiveDummyData:(uint64_t)result;
- (uint64_t)setVerboseLatencyAnalysisLogging:(uint64_t)result;
- (uint64_t)shouldReceiveAudioListenerPose;
- (uint64_t)shouldReceiveDummyData;
- (uint64_t)startReceivingDummyData;
- (uint64_t)stopReceivingAudioListenerPose;
- (uint64_t)stopReceivingDummyData;
- (uint64_t)verboseLatencyAnalysisLogging;
- (void)dealloc;
- (void)resetAudioListenerPoseTrackingForAllClients;
- (void)setAudioListenerPoseManager:(uint64_t)a1;
- (void)setAudioListenerPoseOptions:(id)a3;
- (void)setDefaults:(uint64_t)a1;
- (void)setDummyDataManager:(uint64_t)a1;
- (void)setQueue:(uint64_t)a1;
- (void)startReceivingAudioListenerPoseWithForceSessionRestart:(void *)a3 statusCallback:;
- (void)startReceivingAudioListenerPoseWithStatusCallback:(id)a3;
- (void)startReceivingDummyData;
- (void)stopReceivingAudioListenerPose;
- (void)stopReceivingDummyData;
@end

@implementation RMRelativeMotionManager

- (RMRelativeMotionManager)initWithQueue:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RMRelativeMotionManager;
  v6 = [(RMRelativeMotionManager *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = [[RMDummyDataManager alloc] initWithQueue:v5];
    dummyDataManager = v7->_dummyDataManager;
    v7->_dummyDataManager = v8;

    v7->_shouldReceiveDummyData = 0;
    v7->_dummyDataBufferLock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.RelativeMotion"];
    defaults = v7->_defaults;
    v7->_defaults = (NSUserDefaults *)v10;

    v12 = [[RMAudioListenerPoseManager alloc] initWithQueue:v5];
    audioListenerPoseManager = v7->_audioListenerPoseManager;
    v7->_audioListenerPoseManager = v12;

    v7->_shouldReceiveAudioListenerPose = 0;
    v7->_audioListenerPoseBufferLock._os_unfair_lock_opaque = 0;
    v14 = v7->_defaults;
    v7->_int verboseLatencyAnalysisLogging = [(NSUserDefaults *)v14 BOOLForKey:@"TempestEnableVerboseLatencyLogging"];

    if (onceToken_RelativeMotionManager_Default != -1) {
      dispatch_once(&onceToken_RelativeMotionManager_Default, &__block_literal_global_0);
    }
    v15 = logObject_RelativeMotionManager_Default;
    if (os_log_type_enabled((os_log_t)logObject_RelativeMotionManager_Default, OS_LOG_TYPE_DEFAULT))
    {
      int verboseLatencyAnalysisLogging = v7->_verboseLatencyAnalysisLogging;
      *(_DWORD *)buf = 67240192;
      int v22 = verboseLatencyAnalysisLogging;
      _os_log_impl(&dword_23673D000, v15, OS_LOG_TYPE_DEFAULT, "[RelativeMotionManager] verbose latency logging: %{public}d", buf, 8u);
    }
    v7->_audioListenerPoseBuffer[0].quaternion.x = 0.0;
    v7->_audioListenerPoseBuffer[0].quaternion.y = 0.0;
    v7->_audioListenerPoseBuffer[0].quaternion.z = 0.0;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[0].quaternion.w = xmmword_236749CB0;
    long long v17 = *(_OWORD *)&v7->_audioListenerPoseBuffer[0].consumedAuxTimestamp;
    v7->_audioListenerPoseBuffer[1].machAbsTimestamp = v7->_audioListenerPoseBuffer[0].machAbsTimestamp;
    long long v18 = *(_OWORD *)&v7->_audioListenerPoseBuffer[0].quaternion.z;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[1].quaternion.x = *(_OWORD *)&v7->_audioListenerPoseBuffer[0].quaternion.x;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[1].quaternion.z = v18;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[1].timestamp = *(_OWORD *)&v7->_audioListenerPoseBuffer[0].timestamp;
    *(_OWORD *)&v7->_audioListenerPoseBuffer[1].consumedAuxTimestamp = v17;
  }

  return v7;
}

- (void)setQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 224), a2);
  }
}

- (void)setDummyDataManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

- (uint64_t)setShouldReceiveDummyData:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 208) = a2;
  }
  return result;
}

- (void)setDefaults:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

- (void)setAudioListenerPoseManager:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 248), a2);
  }
}

- (uint64_t)setShouldReceiveAudioListenerPose:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 209) = a2;
  }
  return result;
}

- (uint64_t)defaults
{
  if (result) {
    return *(void *)(result + 240);
  }
  return result;
}

- (uint64_t)setVerboseLatencyAnalysisLogging:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 210) = a2;
  }
  return result;
}

- (uint64_t)verboseLatencyAnalysisLogging
{
  if (result) {
    return *(unsigned char *)(result + 210) & 1;
  }
  return result;
}

- (void)startReceivingDummyData
{
  if (!self) {
    goto LABEL_6;
  }
  if (self->_shouldReceiveDummyData)
  {
    -[RMRelativeMotionManager startReceivingDummyData]();
LABEL_6:
    queue = 0;
    id location = 0;
    goto LABEL_4;
  }
  self->_shouldReceiveDummyData = 1;
  objc_initWeak(&location, self);
  queue = self->_queue;
LABEL_4:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RMRelativeMotionManager_startReceivingDummyData__block_invoke;
  block[3] = &unk_264CAC9E0;
  v4 = queue;
  objc_copyWeak(&v6, &location);
  block[4] = self;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (uint64_t)shouldReceiveDummyData
{
  if (result) {
    return *(unsigned char *)(result + 208) & 1;
  }
  return result;
}

- (uint64_t)queue
{
  if (result) {
    return *(void *)(result + 224);
  }
  return result;
}

void __50__RMRelativeMotionManager_startReceivingDummyData__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained) {
    id v5 = (void *)*((void *)WeakRetained + 29);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__RMRelativeMotionManager_startReceivingDummyData__block_invoke_2;
  v7[3] = &unk_264CAC9B8;
  objc_copyWeak(&v8, v2);
  v7[4] = *(void *)(a1 + 32);
  [v6 startReceivingDummyDataUpdates:v7];

  objc_destroyWeak(&v8);
}

- (uint64_t)dummyDataManager
{
  if (result) {
    return *(void *)(result + 232);
  }
  return result;
}

void __50__RMRelativeMotionManager_startReceivingDummyData__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3)
  {
    id v13 = v6;
    id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = WeakRetained;
    if (WeakRetained && (WeakRetained[52]._os_unfair_lock_opaque & 1) != 0)
    {
      int v9 = *(_DWORD *)(*(void *)(a1 + 32) + 32);
      BOOL v10 = __OFADD__(v9++, 1);
      char v11 = (v9 < 0) ^ v10;
      int v12 = v9 & 1;
      if (v11) {
        int v12 = -v12;
      }
      objc_storeStrong((id *)&WeakRetained[2 * v12 + 2], a2);
      os_unfair_lock_lock(v8 + 7);
      ++v8[8]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v8 + 7);
    }

    id v6 = v13;
  }
}

- (void)stopReceivingDummyData
{
  if (self && self->_shouldReceiveDummyData)
  {
    self->_shouldReceiveDummyData = 0;
    v3 = self->_dummyDataManager;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__RMRelativeMotionManager_stopReceivingDummyData__block_invoke;
    block[3] = &unk_264CACA08;
    id v8 = v3;
    id v5 = v3;
    dispatch_async(queue, block);
  }
  else
  {
    uint64_t v6 = -[RMRelativeMotionManager stopReceivingDummyData]();
    __49__RMRelativeMotionManager_stopReceivingDummyData__block_invoke(v6);
  }
}

uint64_t __49__RMRelativeMotionManager_stopReceivingDummyData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopReceivingDummyDataUpdates];
}

- (id)getCurrentDummyData
{
  p_dummyDataBufferLock = &self->_dummyDataBufferLock;
  os_unfair_lock_lock(&self->_dummyDataBufferLock);
  if (self->_currentDummyDataBufferIndex >= 0) {
    int v4 = self->_currentDummyDataBufferIndex & 1;
  }
  else {
    int v4 = -(self->_currentDummyDataBufferIndex & 1);
  }
  id v5 = self->_dummyDataBuffer[v4];
  os_unfair_lock_unlock(p_dummyDataBufferLock);
  return v5;
}

+ (BOOL)isAudioListenerPoseAvailable
{
  return 1;
}

- (void)startReceivingAudioListenerPoseWithStatusCallback:(id)a3
{
}

- (void)startReceivingAudioListenerPoseWithForceSessionRestart:(void *)a3 statusCallback:
{
  id v5 = a3;
  if (!a1) {
    goto LABEL_4;
  }
  if ((*(unsigned char *)(a1 + 209) & 1) == 0)
  {
    *(unsigned char *)(a1 + 209) = 1;
    objc_initWeak(&location, (id)a1);
    uint64_t v6 = *(void **)(a1 + 224);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __97__RMRelativeMotionManager_startReceivingAudioListenerPoseWithForceSessionRestart_statusCallback___block_invoke;
    block[3] = &unk_264CACA58;
    v7 = v6;
    objc_copyWeak(&v11, &location);
    void block[4] = a1;
    char v12 = a2;
    id v10 = v5;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
LABEL_4:

    return;
  }
  uint64_t v8 = -[RMRelativeMotionManager startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:]();
  -[RMRelativeMotionManager shouldReceiveAudioListenerPose](v8);
}

- (uint64_t)shouldReceiveAudioListenerPose
{
  if (result) {
    return *(unsigned char *)(result + 209) & 1;
  }
  return result;
}

void __97__RMRelativeMotionManager_startReceivingAudioListenerPoseWithForceSessionRestart_statusCallback___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) audioListenerPoseOptions];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = (void *)WeakRetained[31];
  }
  [WeakRetained setTempestOptions:v2];

  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = v5;
  if (v5) {
    v7 = (void *)*((void *)v5 + 31);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __97__RMRelativeMotionManager_startReceivingAudioListenerPoseWithForceSessionRestart_statusCallback___block_invoke_2;
  v10[3] = &unk_264CACA30;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  [v8 startReceivingAudioListenerPoseUpdatesWithForceSessionRestart:v9 poseCallbackInternal:v10 statusCallback:*(void *)(a1 + 40)];

  objc_destroyWeak(&v11);
}

- (uint64_t)audioListenerPoseManager
{
  if (result) {
    return *(void *)(result + 248);
  }
  return result;
}

void __97__RMRelativeMotionManager_startReceivingAudioListenerPoseWithForceSessionRestart_statusCallback___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && BYTE1(WeakRetained[52]._os_unfair_lock_opaque))
  {
    if (BYTE2(WeakRetained[52]._os_unfair_lock_opaque))
    {
      if (onceToken_RelativeMotionManager_Default != -1) {
        dispatch_once(&onceToken_RelativeMotionManager_Default, &__block_literal_global_0);
      }
      id v8 = logObject_RelativeMotionManager_Default;
      if (os_log_type_enabled((os_log_t)logObject_RelativeMotionManager_Default, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a2 + 32);
        int v21 = 134349056;
        uint64_t v22 = v9;
        _os_log_impl(&dword_23673D000, v8, OS_LOG_TYPE_INFO, "[RelativeMotionManager] receivingAudioListenerPose %{public}f", (uint8_t *)&v21, 0xCu);
      }
    }
    int os_unfair_lock_opaque = v7[53]._os_unfair_lock_opaque;
    BOOL v11 = __OFADD__(os_unfair_lock_opaque++, 1);
    char v12 = (os_unfair_lock_opaque < 0) ^ v11;
    int v13 = os_unfair_lock_opaque & 1;
    if (v12) {
      int v13 = -v13;
    }
    v14 = &v7[18 * v13];
    *(_OWORD *)&v14[10]._int os_unfair_lock_opaque = *(_OWORD *)a2;
    long long v16 = *(_OWORD *)(a2 + 32);
    long long v15 = *(_OWORD *)(a2 + 48);
    uint64_t v17 = *(void *)(a2 + 64);
    *(_OWORD *)&v14[14]._int os_unfair_lock_opaque = *(_OWORD *)(a2 + 16);
    *(void *)&v14[26]._int os_unfair_lock_opaque = v17;
    *(_OWORD *)&v14[22]._int os_unfair_lock_opaque = v15;
    *(_OWORD *)&v14[18]._int os_unfair_lock_opaque = v16;
    uint64_t v18 = [v5 code];
    int v19 = v7[53]._os_unfair_lock_opaque;
    BOOL v11 = __OFADD__(v19++, 1);
    char v12 = (v19 < 0) ^ v11;
    int v20 = v19 & 1;
    if (v12) {
      int v20 = -v20;
    }
    *(void *)&v7[2 * v20 + 46]._int os_unfair_lock_opaque = v18;
    os_unfair_lock_lock(v7 + 51);
    ++v7[53]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v7 + 51);
  }
}

- (void)stopReceivingAudioListenerPose
{
  if (self && self->_shouldReceiveAudioListenerPose)
  {
    self->_shouldReceiveAudioListenerPose = 0;
    v3 = self->_audioListenerPoseManager;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__RMRelativeMotionManager_stopReceivingAudioListenerPose__block_invoke;
    block[3] = &unk_264CACA08;
    id v10 = v3;
    id v5 = v3;
    dispatch_async(queue, block);
    os_unfair_lock_lock(&self->_audioListenerPoseBufferLock);
    self->_audioListenerPoseBuffer[0].quaternion.y = 0.0;
    self->_audioListenerPoseBuffer[0].quaternion.z = 0.0;
    self->_audioListenerPoseBuffer[0].quaternion.x = 0.0;
    *(_OWORD *)&self->_audioListenerPoseBuffer[0].quaternion.w = xmmword_236749CB0;
    long long v6 = *(_OWORD *)&self->_audioListenerPoseBuffer[0].consumedAuxTimestamp;
    self->_audioListenerPoseBuffer[1].machAbsTimestamp = self->_audioListenerPoseBuffer[0].machAbsTimestamp;
    long long v7 = *(_OWORD *)&self->_audioListenerPoseBuffer[0].quaternion.z;
    *(_OWORD *)&self->_audioListenerPoseBuffer[1].timestamp = *(_OWORD *)&self->_audioListenerPoseBuffer[0].timestamp;
    *(_OWORD *)&self->_audioListenerPoseBuffer[1].consumedAuxTimestamp = v6;
    *(_OWORD *)&self->_audioListenerPoseBuffer[1].quaternion.x = *(_OWORD *)&self->_audioListenerPoseBuffer[0].quaternion.x;
    *(_OWORD *)&self->_audioListenerPoseBuffer[1].quaternion.z = v7;
    os_unfair_lock_unlock(&self->_audioListenerPoseBufferLock);
  }
  else
  {
    uint64_t v8 = -[RMRelativeMotionManager stopReceivingAudioListenerPose]();
    __57__RMRelativeMotionManager_stopReceivingAudioListenerPose__block_invoke(v8);
  }
}

uint64_t __57__RMRelativeMotionManager_stopReceivingAudioListenerPose__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopReceivingAudioListenerPoseUpdates];
}

- (void)resetAudioListenerPoseTrackingForAllClients
{
  if (self && self->_shouldReceiveAudioListenerPose)
  {
    [(RMRelativeMotionManager *)self stopReceivingAudioListenerPose];
    -[RMRelativeMotionManager startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:]((uint64_t)self, 1, 0);
  }
}

- (os_unfair_lock_s)getCurrentAudioListenerPoseInternal:(os_unfair_lock_s *)a1
{
  v2 = a1;
  if (a1)
  {
    int v4 = a1 + 51;
    os_unfair_lock_lock(a1 + 51);
    if (a2)
    {
      if ((v2[53]._os_unfair_lock_opaque & 0x80000000) == 0) {
        int v5 = v2[53]._os_unfair_lock_opaque & 1;
      }
      else {
        int v5 = -(v2[53]._os_unfair_lock_opaque & 1);
      }
      long long v6 = &v2[18 * v5];
      *(_OWORD *)a2 = *(_OWORD *)&v6[10]._os_unfair_lock_opaque;
      long long v7 = *(_OWORD *)&v6[14]._os_unfair_lock_opaque;
      long long v8 = *(_OWORD *)&v6[18]._os_unfair_lock_opaque;
      long long v9 = *(_OWORD *)&v6[22]._os_unfair_lock_opaque;
      *(void *)(a2 + 64) = *(void *)&v6[26]._os_unfair_lock_opaque;
      *(_OWORD *)(a2 + 32) = v8;
      *(_OWORD *)(a2 + 48) = v9;
      *(_OWORD *)(a2 + 16) = v7;
    }
    if ((v2[53]._os_unfair_lock_opaque & 0x80000000) == 0) {
      int v10 = v2[53]._os_unfair_lock_opaque & 1;
    }
    else {
      int v10 = -(v2[53]._os_unfair_lock_opaque & 1);
    }
    v2 = *(os_unfair_lock_s **)&v2[2 * v10 + 46]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v4);
  }
  return v2;
}

- (int64_t)getCurrentAudioListenerPose:(id *)a3 timestamp:(double *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v7 = -[RMRelativeMotionManager getCurrentAudioListenerPoseInternal:]((os_unfair_lock_s *)self, (uint64_t)&v11);
  if (a3)
  {
    long long v8 = v12;
    *(_OWORD *)&a3->var0 = v11;
    *(_OWORD *)&a3->var2 = v8;
  }
  if (a4) {
    *(void *)a4 = v13;
  }
  if (self && self->_verboseLatencyAnalysisLogging)
  {
    if (onceToken_RelativeMotionManager_Default != -1) {
      dispatch_once(&onceToken_RelativeMotionManager_Default, &__block_literal_global_0);
    }
    long long v9 = logObject_RelativeMotionManager_Default;
    if (os_log_type_enabled((os_log_t)logObject_RelativeMotionManager_Default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134285313;
      uint64_t v17 = v11;
      __int16 v18 = 2049;
      uint64_t v19 = *((void *)&v11 + 1);
      __int16 v20 = 2049;
      uint64_t v21 = v12;
      __int16 v22 = 2049;
      uint64_t v23 = *((void *)&v12 + 1);
      __int16 v24 = 2049;
      uint64_t v25 = v14;
      __int16 v26 = 2049;
      uint64_t v27 = *((void *)&v14 + 1);
      __int16 v28 = 2049;
      uint64_t v29 = v15;
      __int16 v30 = 2049;
      uint64_t v31 = v13;
      _os_log_impl(&dword_23673D000, v9, OS_LOG_TYPE_INFO, "[RelativeMotionManager] currentAudioListenerPose RMPose,q.x,%{private}f,q.y,%{private}f,q.z,%{private}f,q.w,%{private}f,consumedAuxTimestamp,%{private}f,receivedAuxTimestamp,%{private}f,machAbsTimestamp,%{private}f,timestamp,%{private}f", buf, 0x52u);
    }
  }
  return (int64_t)v7;
}

- (id)getCurrentAudioListenerPoseWithError:(int64_t *)a3
{
  double v14 = 0.0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v4 = -[RMRelativeMotionManager getCurrentAudioListenerPoseInternal:]((os_unfair_lock_s *)self, (uint64_t)&v10);
  if (a3) {
    *a3 = (int64_t)v4;
  }
  int v5 = [RMAttitude alloc];
  id v6 = -[RMAttitude _initWithQuaternion:timestamp:](v5, "_initWithQuaternion:timestamp:", v10, v11, *(double *)&v12);
  long long v7 = [RMPose alloc];
  id v8 = -[RMPose _initWithAttitude:consumedAuxTimestamp:receivedAuxTimestamp:machAbsTimestamp:](v7, "_initWithAttitude:consumedAuxTimestamp:receivedAuxTimestamp:machAbsTimestamp:", v6, v13, v14);

  return v8;
}

- (void)dealloc
{
  v2 = self;
  if (self)
  {
    v3 = self->_dummyDataManager;
    self = v2->_audioListenerPoseManager;
    queue = v2->_queue;
  }
  else
  {
    v3 = 0;
    queue = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__RMRelativeMotionManager_dealloc__block_invoke;
  block[3] = &unk_264CACA80;
  long long v9 = v3;
  long long v10 = self;
  int v5 = self;
  id v6 = v3;
  dispatch_async(queue, block);

  v7.receiver = v2;
  v7.super_class = (Class)RMRelativeMotionManager;
  [(RMRelativeMotionManager *)&v7 dealloc];
}

uint64_t __34__RMRelativeMotionManager_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = *(void **)(a1 + 40);
  return [v2 invalidate];
}

- (NSDictionary)audioListenerPoseOptions
{
  return self->_audioListenerPoseOptions;
}

- (void)setAudioListenerPoseOptions:(id)a3
{
}

- (uint64_t)currentAudioListenerPoseBufferIndex
{
  if (result) {
    return *(unsigned int *)(result + 212);
  }
  return result;
}

- (uint64_t)setCurrentAudioListenerPoseBufferIndex:(uint64_t)result
{
  if (result) {
    *(_DWORD *)(result + 212) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioListenerPoseManager, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_dummyDataManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioListenerPoseOptions, 0);
  uint64_t v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (uint64_t)startReceivingDummyData
{
  v1 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_23673D000, v2, v3, "{\"msg%{public}.0s\":\"Called startReceivingDummyData while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v22, v23, v24, v25, v26);
  }

  id v8 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (os_signpost_enabled(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_23673D000, v9, v10, v11, "Called startReceivingDummyData while already registered to receive data", "{\"msg%{public}.0s\":\"Called startReceivingDummyData while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v22, v23, v24, v25, v26);
  }

  double v14 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_23673D000, v15, v16, "{\"msg%{public}.0s\":\"Called startReceivingDummyData while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v22, v23, v24, v25, v26);
  }

  uint64_t result = abort_report_np();
  __break(1u);
  return result;
}

- (uint64_t)stopReceivingDummyData
{
  v1 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_23673D000, v2, v3, "{\"msg%{public}.0s\":\"Called stopReceivingDummyData while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (os_signpost_enabled(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_23673D000, v9, v10, v11, "Called stopReceivingDummyData while not registered to receive data", "{\"msg%{public}.0s\":\"Called stopReceivingDummyData while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  double v14 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_23673D000, v15, v16, "{\"msg%{public}.0s\":\"Called stopReceivingDummyData while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return -[RMRelativeMotionManager startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:](v21);
}

- (uint64_t)startReceivingAudioListenerPoseWithForceSessionRestart:statusCallback:.cold.1()
{
  v1 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_23673D000, v2, v3, "{\"msg%{public}.0s\":\"Called startReceivingAudioListenerPose while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v22, v23, v24, v25, v26);
  }

  id v8 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (os_signpost_enabled(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_23673D000, v9, v10, v11, "Called startReceivingAudioListenerPose while already registered to receive data", "{\"msg%{public}.0s\":\"Called startReceivingAudioListenerPose while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v22, v23, v24, v25, v26);
  }

  double v14 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_23673D000, v15, v16, "{\"msg%{public}.0s\":\"Called startReceivingAudioListenerPose while already registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v22, v23, v24, v25, v26);
  }

  uint64_t result = abort_report_np();
  __break(1u);
  return result;
}

- (uint64_t)stopReceivingAudioListenerPose
{
  v1 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_23673D000, v2, v3, "{\"msg%{public}.0s\":\"Called stopReceivingAudioListenerPose while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (os_signpost_enabled(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_23673D000, v9, v10, v11, "Called stopReceivingAudioListenerPose while not registered to receive data", "{\"msg%{public}.0s\":\"Called stopReceivingAudioListenerPose while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  double v14 = _CLLogObjectForCategory_RelativeMotionManager_Default();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_23673D000, v15, v16, "{\"msg%{public}.0s\":\"Called stopReceivingAudioListenerPose while not registered to receive data\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return -[RMConnectionEndpoint handleXpcMessage:replyBlock:](v21);
}

@end