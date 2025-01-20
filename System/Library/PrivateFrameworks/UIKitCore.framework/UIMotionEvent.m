@interface UIMotionEvent
- (BOOL)_detectWhenNotActive;
- (BOOL)_isDetectingMotionEvents;
- (float)_determineShakeLevelX:(float)a3 y:(float)a4 z:(float)a5 currentState:(int64_t)a6;
- (float)_highPass:(float)a3;
- (float)_lowPass:(float)a3;
- (id)_allWindows;
- (id)_init;
- (id)description;
- (int)_shakeState;
- (int)shakeState;
- (int64_t)_feedStateMachine:(float)a3 currentState:(int64_t)a4 timestamp:(double)a5;
- (int64_t)subtype;
- (int64_t)type;
- (void)_accelerometerDidDetectMovementWithTimestamp:(double)a3;
- (void)_enablePeakDetectionForScreenBlanked:(id)a3;
- (void)_enablePeakDetectionIfNecessary;
- (void)_idleTimerFired;
- (void)_resetLowPassState;
- (void)_sendEventToResponder:(id)a3;
- (void)_setSubtype:(int64_t)a3;
- (void)_updateAccelerometerEnabled;
- (void)_willResume;
- (void)_willSuspend;
- (void)accelerometer:(id)a3 didAccelerateWithTimeStamp:(double)a4 x:(float)a5 y:(float)a6 z:(float)a7 eventType:(int)a8;
- (void)dealloc;
- (void)setShakeState:(int)a3;
@end

@implementation UIMotionEvent

- (void)_willSuspend
{
  BOOL v3 = [(UIMotionEvent *)self _detectWhenNotActive];
  [(BKSAccelerometer *)self->_motionAccelerometer setAccelerometerEventsEnabled:v3];
  if (!v3)
  {
    [(UIMotionEvent *)self _idleTimerFired];
  }
}

- (void)_updateAccelerometerEnabled
{
  if (([(id)UIApp _isActivated] & 1) == 0)
  {
    int v3 = [(BKSAccelerometer *)self->_motionAccelerometer accelerometerEventsEnabled];
    BOOL v4 = [(UIMotionEvent *)self _detectWhenNotActive];
    if (!v3 || v4)
    {
      if (((v3 | !v4) & 1) == 0)
      {
        [(UIMotionEvent *)self _willResume];
      }
    }
    else
    {
      [(UIMotionEvent *)self _willSuspend];
    }
  }
}

- (BOOL)_detectWhenNotActive
{
  if ([(id)UIApp _supportsShakesWhenNotActive]) {
    return 1;
  }
  int v3 = (void *)UIApp;
  return [v3 _needsShakesWhenInactive];
}

- (void)_willResume
{
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)UIMotionEvent;
  id v2 = [(UIEvent *)&v10 _init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F4F218]);
    BOOL v4 = (void *)*((void *)v2 + 15);
    *((void *)v2 + 15) = v3;

    [*((id *)v2 + 15) setDelegate:v2];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__screenBlanked, @"com.apple.springboard.hasBlankedScreen", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    notify_register_check("com.apple.springboard.hasBlankedScreen", (int *)v2 + 66);
    uint64_t state64 = 0;
    if (!notify_get_state(*((_DWORD *)v2 + 66), &state64))
    {
      v6 = [NSNumber numberWithUnsignedLongLong:state64];
      [v2 _enablePeakDetectionForScreenBlanked:v6];
    }
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel__willResume name:@"UIApplicationDidBecomeActiveNotification" object:UIApp];
    [v7 addObserver:v2 selector:sel__willSuspend name:@"UIApplicationSuspendedNotification" object:UIApp];
    [v7 addObserver:v2 selector:sel__updateAccelerometerEnabled name:@"UIWindowDidBecomeVisibleNotification" object:0];
    [v7 addObserver:v2 selector:sel__updateAccelerometerEnabled name:@"UIWindowDidBecomeHiddenNotification" object:0];
  }
  return v2;
}

- (void)_enablePeakDetectionForScreenBlanked:(id)a3
{
  if ([a3 BOOLValue]) {
    float v5 = 0.0;
  }
  else {
    float v5 = 1.9;
  }
  *(float *)&double v4 = v5;
  [(BKSAccelerometer *)self->_motionAccelerometer setXThreshold:v4];
  *(float *)&double v6 = v5;
  [(BKSAccelerometer *)self->_motionAccelerometer setYThreshold:v6];
  motionAccelerometer = self->_motionAccelerometer;
  *(float *)&double v8 = v5;
  [(BKSAccelerometer *)motionAccelerometer setZThreshold:v8];
}

- (void)_idleTimerFired
{
  CFTimeInterval v3 = self->_lastMovementTime + 3.0;
  if (v3 < CACurrentMediaTime())
  {
    [(NSTimer *)self->_idleTimer invalidate];
    idleTimer = self->_idleTimer;
    self->_idleTimer = 0;

    [(BKSAccelerometer *)self->_motionAccelerometer setUpdateInterval:0.0];
    if (self->_sentMotionBegan)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
      -[UIEventEnvironment _sendMotionCancelled:]((uint64_t)WeakRetained, 1);

      self->_sentMotionBegan = 0;
    }
    [(UIMotionEvent *)self _resetLowPassState];
    self->_stateMachineState = 0;
  }
}

- (void)_resetLowPassState
{
  *(_OWORD *)self->_lowPassState = 0u;
  *(_OWORD *)&self->_lowPassState[4] = 0u;
  *(void *)&self->_lowPassState[8] = 0;
  self->_lowPassStateIndex = 0;
}

- (void)dealloc
{
  v7[4] = *MEMORY[0x1E4F143B8];
  notify_cancel(self->notifyToken);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.springboard.hasBlankedScreen", 0);
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v7[0] = @"UIApplicationDidBecomeActiveNotification";
  v7[1] = @"UIApplicationSuspendedNotification";
  v7[2] = @"UIWindowDidBecomeVisibleNotification";
  v7[3] = @"UIWindowDidBecomeHiddenNotification";
  float v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  v6.receiver = self;
  v6.super_class = (Class)UIMotionEvent;
  [(UIEvent *)&v6 dealloc];
}

- (int64_t)type
{
  return 1;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (void)_setSubtype:(int64_t)a3
{
  self->_subtype = a3;
}

- (id)description
{
  CFTimeInterval v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)UIMotionEvent;
  double v4 = [(UIMotionEvent *)&v8 description];
  [(UIEvent *)self timestamp];
  objc_super v6 = [v3 stringWithFormat:@"%@ timestamp: %g subtype: %ld", v4, v5, -[UIMotionEvent subtype](self, "subtype")];

  return v6;
}

- (id)_allWindows
{
  id v2 = [(id)UIApp _motionKeyWindow];
  if (v2)
  {
    CFTimeInterval v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    CFTimeInterval v3 = 0;
  }

  return v3;
}

- (void)_sendEventToResponder:(id)a3
{
  id v6 = a3;
  int v4 = [(UIMotionEvent *)self shakeState];
  if (v4 == 2)
  {
    objc_msgSend(v6, "motionCancelled:withEvent:", -[UIMotionEvent subtype](self, "subtype"), self);
  }
  else if (v4 == 1)
  {
    objc_msgSend(v6, "motionEnded:withEvent:", -[UIMotionEvent subtype](self, "subtype"), self);
  }
  else
  {
    uint64_t v5 = v6;
    if (v4) {
      goto LABEL_8;
    }
    objc_msgSend(v6, "motionBegan:withEvent:", -[UIMotionEvent subtype](self, "subtype"), self);
  }
  uint64_t v5 = v6;
LABEL_8:
}

- (BOOL)_isDetectingMotionEvents
{
  return [(BKSAccelerometer *)self->_motionAccelerometer accelerometerEventsEnabled];
}

- (void)_accelerometerDidDetectMovementWithTimestamp:(double)a3
{
  self->_lastMovementTime = a3;
  if (!self->_idleTimer)
  {
    int v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__idleTimerFired selector:0 userInfo:1 repeats:3.0];
    idleTimer = self->_idleTimer;
    self->_idleTimer = v4;
  }
  [(BKSAccelerometer *)self->_motionAccelerometer updateInterval];
  if (v6 < 0.1)
  {
    -[BKSAccelerometer setUpdateInterval:](self->_motionAccelerometer, "setUpdateInterval:");
    if (!self->_stateMachineState)
    {
      self->_stateMachineState = 1;
      self->_sentMotionBegan = 0;
    }
  }
}

- (void)accelerometer:(id)a3 didAccelerateWithTimeStamp:(double)a4 x:(float)a5 y:(float)a6 z:(float)a7 eventType:(int)a8
{
  id v14 = a3;
  if (a8)
  {
    if (a8 == 1)
    {
      id v22 = v14;
      [(UIMotionEvent *)self _accelerometerDidDetectMovementWithTimestamp:a4];
LABEL_4:
      id v14 = v22;
    }
  }
  else
  {
    *(float *)&double v15 = a5;
    *(float *)&double v16 = a6;
    *(float *)&double v17 = a7;
    id v22 = v14;
    [(UIMotionEvent *)self _determineShakeLevelX:self->_stateMachineState y:v15 z:v16 currentState:v17];
    int64_t v18 = -[UIMotionEvent _feedStateMachine:currentState:timestamp:](self, "_feedStateMachine:currentState:timestamp:", self->_stateMachineState);
    id v14 = v22;
    self->_stateMachineState = v18;
    switch(v18)
    {
      case 0:
      case 5:
        if (self->_sentMotionBegan)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
          -[UIEventEnvironment _sendMotionCancelled:]((uint64_t)WeakRetained, 1);

          id v14 = v22;
          self->_sentMotionBegan = 0;
        }
        break;
      case 2:
        if (!self->_sentMotionBegan)
        {
          self->_sentMotionBegan = 1;
          id v20 = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
          -[UIEventEnvironment _sendMotionBegan:]((uint64_t)v20, 1);

          goto LABEL_4;
        }
        break;
      case 6:
        [(UIMotionEvent *)self _resetLowPassState];
        id v14 = v22;
        if (self->_sentMotionBegan)
        {
          id v21 = objc_loadWeakRetained((id *)&self->super._eventEnvironment);
          -[UIEventEnvironment _sendMotionEnded:]((uint64_t)v21, 1);

          id v14 = v22;
          self->_stateMachineState = 0;
          self->_sentMotionBegan = 0;
        }
        break;
      default:
        break;
    }
  }
}

- (int64_t)_feedStateMachine:(float)a3 currentState:(int64_t)a4 timestamp:(double)a5
{
  switch(a4)
  {
    case 0:
      if (a3 < 0.071243) {
        goto LABEL_14;
      }
      break;
    case 1:
      if (a3 > 0.071243)
      {
        self->_shakeStartTime = a5;
        a4 = 2;
      }
      break;
    case 2:
      double v5 = a3;
      if (v5 < 0.071243) {
        goto LABEL_14;
      }
      if (v5 <= 0.237488) {
        goto LABEL_17;
      }
      self->_highLevelTime = a5;
      a4 = 3;
      break;
    case 3:
      if (a3 >= 0.237488) {
        goto LABEL_17;
      }
      if (self->_highLevelTime + 0.0 >= a5)
      {
LABEL_14:
        a4 = 1;
      }
      else
      {
        self->_lowEndTimeout = a5;
        a4 = 4;
      }
      break;
    case 4:
      if (self->_lowEndTimeout + 0.5 >= a5)
      {
        if (a3 >= 0.071243)
        {
LABEL_17:
          if (self->_shakeStartTime + 2.0 < a5) {
            a4 = 0;
          }
        }
        else
        {
          a4 = 6;
        }
      }
      else
      {
        a4 = 5;
      }
      break;
    default:
      return a4;
  }
  return a4;
}

- (float)_highPass:(float)a3
{
  unint64_t highPassStateIndex = self->_highPassStateIndex;
  self->_highPassState[highPassStateIndex] = a3;
  unint64_t v4 = highPassStateIndex & 1;
  float v5 = self->_highPassState[v4] + 0.0;
  v4 ^= 1uLL;
  float v6 = v5 - self->_highPassState[v4];
  self->_unint64_t highPassStateIndex = v4;
  return v6 * 0.5;
}

- (float)_lowPass:(float)a3
{
  uint64_t v3 = 0;
  unint64_t lowPassStateIndex = self->_lowPassStateIndex;
  self->_lowPassState[lowPassStateIndex] = a3;
  self->_unint64_t lowPassStateIndex = (lowPassStateIndex + 1) % 0xA;
  float v5 = 0.0;
  do
    float v5 = v5 + self->_lowPassState[v3++];
  while (v3 != 10);
  return v5 / 10.0;
}

- (float)_determineShakeLevelX:(float)a3 y:(float)a4 z:(float)a5 currentState:(int64_t)a6
{
  v11 = +[UIDevice currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  double v15 = a5 * 0.65;
  *(float *)&double v15 = v15;
  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    *(float *)&double v15 = 0.0;
  }
  float v13 = a3 * 0.65;
  float v14 = a4 * 0.65;
  float v16 = (float)((float)(v13 * v13) + (float)(v14 * v14)) + (float)(*(float *)&v15 * *(float *)&v15);
  *(float *)&double v15 = (float)(v16 * v16) * 0.5;
  if (a6 == 5)
  {
    [(UIMotionEvent *)self _highPass:v15];
    if (v17 >= 0.0) {
      float v18 = v17;
    }
    else {
      float v18 = -v17;
    }
    double v19 = v18;
    if (v18 < 0.071243)
    {
      [(UIMotionEvent *)self _resetLowPassState];
      self->_stateMachineState = 0;
    }
    *(float *)&double v19 = v18;
    [(UIMotionEvent *)self _lowPass:v19];
  }
  else
  {
    unint64_t v21 = a6 - 3;
    [(UIMotionEvent *)self _highPass:v15];
    if (*(float *)&v22 >= 0.0) {
      float v23 = *(float *)&v22;
    }
    else {
      float v23 = -*(float *)&v22;
    }
    *(float *)&double v22 = v23;
    [(UIMotionEvent *)self _lowPass:v22];
    if (v21 < 2) {
      return v23;
    }
  }
  return result;
}

- (int)_shakeState
{
  return self->_shakeState;
}

- (void)_enablePeakDetectionIfNecessary
{
  uint64_t state64 = 0;
  if (!notify_get_state(self->notifyToken, &state64))
  {
    uint64_t v3 = [NSNumber numberWithUnsignedLongLong:state64];
    [(UIMotionEvent *)self performSelectorOnMainThread:sel__enablePeakDetectionForScreenBlanked_ withObject:v3 waitUntilDone:0];
  }
}

- (int)shakeState
{
  return self->_shakeState;
}

- (void)setShakeState:(int)a3
{
  self->_shakeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_motionAccelerometer, 0);
}

@end