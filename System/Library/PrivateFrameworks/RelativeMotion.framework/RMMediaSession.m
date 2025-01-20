@interface RMMediaSession
+ (BOOL)_isClientModeAvailable:(int64_t)a3;
+ (BOOL)isAvailable;
+ (double)defaultFaceToDevicePitchAngle;
- (BOOL)_start;
- (BOOL)isAXHeadTrackingSettingEnabled;
- (BOOL)sessionStartedWithTracking;
- (RMMediaSession)init;
- (RMRelativeMotionManager)manager;
- (double)sessionStartTimestamp;
- (id)_initWithOptions:(id)a3;
- (int64_t)_currentAudioListenerPose:(id *)a3;
- (int64_t)_currentAudioListenerPose:(id *)a3 timestamp:(double *)a4;
- (int64_t)clientMode;
- (void)_resetTrackingForAllClients;
- (void)_stop;
- (void)axHeadTrackingSettingChanged;
- (void)dealloc;
- (void)setClientMode:(int64_t)a3;
- (void)setManager:(id)a3;
- (void)setSessionStartTimestamp:(double)a3;
- (void)setSessionStartedWithTracking:(BOOL)a3;
- (void)startMonitoringAXHeadTrackingSetting;
- (void)stopMonitoringAXHeadTrackingSetting;
@end

@implementation RMMediaSession

+ (BOOL)isAvailable
{
  return +[RMRelativeMotionManager isAudioListenerPoseAvailable];
}

+ (BOOL)_isClientModeAvailable:(int64_t)a3
{
  BOOL result = +[RMMediaSession isAvailable];
  if ((unint64_t)a3 >= 5) {
    return 0;
  }
  return result;
}

+ (double)defaultFaceToDevicePitchAngle
{
  [MEMORY[0x263F01770] defaultFaceToDevicePitchAngle];
  return result;
}

- (RMMediaSession)init
{
  return (RMMediaSession *)[(RMMediaSession *)self _initWithOptions:0];
}

- (id)_initWithOptions:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RMMediaSession;
  v5 = [(RMMediaSession *)&v13 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("RMMediaSessionQueue", 0);
    v7 = [[RMRelativeMotionManager alloc] initWithQueue:v6];
    [(RMMediaSession *)v5 setManager:v7];

    if (v4)
    {
      v14[0] = *MEMORY[0x263F017E0];
      v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "clientMode"));
      v15[0] = v8;
      v14[1] = *MEMORY[0x263F017E8];
      v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "predictionIntervalMicroseconds"));
      v15[1] = v9;
      v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
      v11 = [(RMMediaSession *)v5 manager];
      [v11 setAudioListenerPoseOptions:v10];

      -[RMMediaSession setClientMode:](v5, "setClientMode:", [v4 clientMode]);
    }
    [(RMMediaSession *)v5 startMonitoringAXHeadTrackingSetting];
    [(RMMediaSession *)v5 setSessionStartTimestamp:0.0];
  }
  return v5;
}

- (void)dealloc
{
  [(RMMediaSession *)self stopMonitoringAXHeadTrackingSetting];
  v3.receiver = self;
  v3.super_class = (Class)RMMediaSession;
  [(RMMediaSession *)&v3 dealloc];
}

- (BOOL)_start
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(RMMediaSession *)v2 isAXHeadTrackingSettingEnabled];
  if (onceToken_ConnectionClient_Default != -1) {
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
  }
  id v4 = (id)logObject_ConnectionClient_Default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67240448;
    v7[1] = [(RMMediaSession *)v2 clientMode];
    __int16 v8 = 1026;
    int v9 = v3;
    _os_log_impl(&dword_23673D000, v4, OS_LOG_TYPE_DEFAULT, "[RMMediaSession] Starting session, clientMode: %{public}d, trackingEnabled: %{public}d", (uint8_t *)v7, 0xEu);
  }

  if (v3)
  {
    v5 = [(RMMediaSession *)v2 manager];
    [v5 startReceivingAudioListenerPoseWithStatusCallback:0];
  }
  [(RMMediaSession *)v2 setSessionStartedWithTracking:v3];
  [(RMMediaSession *)v2 setSessionStartTimestamp:CFAbsoluteTimeGetCurrent()];
  objc_sync_exit(v2);

  return 1;
}

- (void)_stop
{
  v2 = self;
  objc_sync_enter(v2);
  [(RMMediaSession *)v2 sessionStartTimestamp];
  if (v3 != 0.0)
  {
    if ([(RMMediaSession *)v2 sessionStartedWithTracking])
    {
      id v4 = [(RMMediaSession *)v2 manager];
      [v4 stopReceivingAudioListenerPose];

      [(RMMediaSession *)v2 setSessionStartedWithTracking:0];
    }
    else
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(RMMediaSession *)v2 sessionStartTimestamp];
      uint64_t v8 = 3221225472;
      uint64_t v7 = MEMORY[0x263EF8330];
      int v9 = __23__RMMediaSession__stop__block_invoke;
      uint64_t v10 = &unk_264CAC950;
      double v12 = Current - v6;
      v11 = v2;
      AnalyticsSendEventLazy();
    }
    -[RMMediaSession setSessionStartTimestamp:](v2, "setSessionStartTimestamp:", 0.0, v7, v8, v9, v10, v11, *(void *)&v12);
  }
  objc_sync_exit(v2);
}

id __23__RMMediaSession__stop__block_invoke(uint64_t a1)
{
  v10[3] = *MEMORY[0x263EF8340];
  v10[0] = MEMORY[0x263EFFA80];
  v9[0] = @"trackingEnabled";
  v9[1] = @"sessionDuration";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v10[1] = v2;
  v9[2] = @"trackingClientMode";
  double v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "clientMode"));
  v10[2] = v3;
  id v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  if (onceToken_ConnectionClient_Default != -1) {
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
  }
  v5 = logObject_ConnectionClient_Default;
  if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138477827;
    uint64_t v8 = v4;
    _os_log_impl(&dword_23673D000, v5, OS_LOG_TYPE_INFO, "[RMMediaSession] Sending analytics:\n%{private}@", (uint8_t *)&v7, 0xCu);
  }
  return v4;
}

- (void)_resetTrackingForAllClients
{
  if (onceToken_ConnectionClient_Default != -1) {
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
  }
  double v3 = logObject_ConnectionClient_Default;
  if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_23673D000, v3, OS_LOG_TYPE_DEFAULT, "[RMMediaSession] Resetting tracking for all clients", v6, 2u);
  }
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(RMMediaSession *)v4 manager];
  [v5 resetAudioListenerPoseTrackingForAllClients];

  objc_sync_exit(v4);
}

- (int64_t)_currentAudioListenerPose:(id *)a3 timestamp:(double *)a4
{
  int v7 = [(RMMediaSession *)self manager];
  int64_t v8 = [v7 getCurrentAudioListenerPose:a3 timestamp:a4];

  if ([(RMMediaSession *)self sessionStartedWithTracking]) {
    return v8;
  }
  else {
    return 4;
  }
}

- (int64_t)_currentAudioListenerPose:(id *)a3
{
  uint64_t v11 = 0;
  v5 = (void *)MEMORY[0x237E03040](self, a2);
  double v6 = [(RMMediaSession *)self manager];
  int v7 = [v6 getCurrentAudioListenerPoseWithError:&v11];

  id v8 = v7;
  *a3 = v8;
  if ([(RMMediaSession *)self sessionStartedWithTracking])
  {
    int64_t v9 = v11;
  }
  else
  {
    int64_t v9 = 4;
    uint64_t v11 = 4;
  }

  return v9;
}

- (BOOL)isAXHeadTrackingSettingEnabled
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = _AXSSpatialAudioHeadTracking();
  if (onceToken_ConnectionClient_Default != -1) {
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
  }
  id v4 = logObject_ConnectionClient_Default;
  if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67240192;
    v8[1] = v3;
    _os_log_impl(&dword_23673D000, v4, OS_LOG_TYPE_DEFAULT, "[RMMediaSession] _AXSSpatialAudioHeadTracking: %{public}d", (uint8_t *)v8, 8u);
  }
  int64_t v5 = [(RMMediaSession *)self clientMode];
  uint64_t v6 = 1;
  if (v5 != 1) {
    uint64_t v6 = 2;
  }
  return (v6 & v3) != 0;
}

- (void)startMonitoringAXHeadTrackingSetting
{
  uint64_t v3 = [(RMMediaSession *)self axNotificationCenter];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F8B100];
  CFNotificationCenterAddObserver(v3, self, (CFNotificationCallback)axHeadTrackingSettingChanged, v4, 0, (CFNotificationSuspensionBehavior)0);
}

- (void)stopMonitoringAXHeadTrackingSetting
{
  uint64_t v3 = [(RMMediaSession *)self axNotificationCenter];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263F8B100];
  CFNotificationCenterRemoveObserver(v3, self, v4, 0);
}

- (void)axHeadTrackingSettingChanged
{
  v2 = self;
  objc_sync_enter(v2);
  [(RMMediaSession *)v2 sessionStartTimestamp];
  if (v3 != 0.0)
  {
    BOOL v4 = [(RMMediaSession *)v2 sessionStartedWithTracking];
    if (v4 != [(RMMediaSession *)v2 isAXHeadTrackingSettingEnabled])
    {
      if (onceToken_ConnectionClient_Default != -1) {
        dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global);
      }
      int64_t v5 = logObject_ConnectionClient_Default;
      if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_23673D000, v5, OS_LOG_TYPE_DEFAULT, "[RMMediaSession] AX head tracking setting has changed, restarting session", v6, 2u);
      }
      [(RMMediaSession *)v2 _stop];
      [(RMMediaSession *)v2 _start];
    }
  }
  objc_sync_exit(v2);
}

- (RMRelativeMotionManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (double)sessionStartTimestamp
{
  return self->_sessionStartTimestamp;
}

- (void)setSessionStartTimestamp:(double)a3
{
  self->_sessionStartTimestamp = a3;
}

- (BOOL)sessionStartedWithTracking
{
  return self->_sessionStartedWithTracking;
}

- (void)setSessionStartedWithTracking:(BOOL)a3
{
  self->_sessionStartedWithTracking = a3;
}

- (int64_t)clientMode
{
  return self->_clientMode;
}

- (void)setClientMode:(int64_t)a3
{
  self->_clientMode = a3;
}

- (void).cxx_destruct
{
}

@end