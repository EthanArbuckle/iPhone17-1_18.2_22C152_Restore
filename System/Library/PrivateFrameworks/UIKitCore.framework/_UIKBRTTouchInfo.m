@interface _UIKBRTTouchInfo
+ (id)createTouchInfoForTouch:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5;
+ (id)touchDict;
+ (id)touchInfoForTouch:(id)a3 withIdentifier:(id)a4;
+ (void)setTouchInfo:(id)a3 forIdentifier:(id)a4;
- (BOOL)willChangeTouchInfo:(id)a3 toState:(char)a4;
- (CGPoint)currentTouchPoint;
- (CGPoint)originalTouchPoint;
- (OS_dispatch_queue)timerQueue;
- (_UIKBRTTimerBlock)timer;
- (_UIKBRTTouchInfo)initWithTouch:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5;
- (char)currentTouchState;
- (char)preRuleTouchState;
- (double)currentTimestamp;
- (double)currentZGradient;
- (double)maximumRadius;
- (double)originalTimestamp;
- (double)originalZGradient;
- (id)setOfTouchesToIgnoreWhenSettingTouchInfo:(id)a3 toState:(char)a4;
- (id)touchIdentifier;
- (void)cleanup;
- (void)dealloc;
- (void)fireTimerNow;
- (void)invalidateTimer;
- (void)setCurrentTouchState:(char)a3;
- (void)setPreRuleTouchState:(char)a3;
- (void)setTimerWithTimeInterval:(double)a3 onQueue:(id)a4 do:(id)a5;
- (void)updateTouch:(id)a3;
@end

@implementation _UIKBRTTouchInfo

+ (id)touchDict
{
  if (qword_1EB25D180 != -1) {
    dispatch_once(&qword_1EB25D180, &__block_literal_global_381);
  }
  v2 = (void *)_MergedGlobals_9_1;
  return v2;
}

+ (void)setTouchInfo:(id)a3 forIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [a1 touchDict];
  v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

+ (id)touchInfoForTouch:(id)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 touchDict];
  id v9 = [v8 objectForKey:v6];

  [v9 updateTouch:v7];
  return v9;
}

+ (id)createTouchInfoForTouch:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[_UIKBRTTouchInfo alloc] initWithTouch:v9 withIdentifier:v8 canLogTouch:v5];

  [a1 setTouchInfo:v10 forIdentifier:v8];
  return v10;
}

- (_UIKBRTTouchInfo)initWithTouch:(id)a3 withIdentifier:(id)a4 canLogTouch:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UIKBRTTouchInfo;
  id v9 = [(_UIKBRTTouchInfo *)&v20 init];
  if (v9)
  {
    [v7 timestamp];
    v9->_originalTimestamp = v10;
    v9->_currentTimestamp = v10;
    v11 = [v7 view];
    [v7 locationInView:v11];
    v9->_originalTouchPoint.x = v12;
    v9->_originalTouchPoint.y = v13;
    v9->_currentTouchPoint = v9->_originalTouchPoint;

    [v7 majorRadius];
    v9->_maximumRadius = v14;
    [v7 _zGradient];
    double v16 = v15;
    v9->_originalZGradient = v16;
    v9->_currentZGradient = v16;
    dispatch_queue_t v17 = dispatch_queue_create("_UIKBRTTouchInfoTimerQueue", 0);
    timerQueue = v9->_timerQueue;
    v9->_timerQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong(&v9->_touchIdentifier, a4);
    v9->_currentTouchState = 0;
    v9->_preRuleTouchState = -1;
  }

  return v9;
}

- (void)dealloc
{
  [(_UIKBRTTouchInfo *)self invalidateTimer];
  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTTouchInfo;
  [(_UIKBRTTouchInfo *)&v3 dealloc];
}

- (void)updateTouch:(id)a3
{
  id v4 = a3;
  [v4 timestamp];
  self->_currentTimestamp = v5;
  id v6 = [v4 view];
  [v4 locationInView:v6];
  self->_currentTouchPoint.x = v7;
  self->_currentTouchPoint.y = v8;

  double maximumRadius = self->_maximumRadius;
  [v4 majorRadius];
  if (maximumRadius >= v10) {
    double v10 = maximumRadius;
  }
  self->_double maximumRadius = v10;
  [v4 _zGradient];
  float v12 = v11;

  self->_currentZGradient = v12;
}

- (void)setTimerWithTimeInterval:(double)a3 onQueue:(id)a4 do:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  timerQueue = self->_timerQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56___UIKBRTTouchInfo_setTimerWithTimeInterval_onQueue_do___block_invoke;
  v13[3] = &unk_1E52FE2B8;
  double v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(timerQueue, v13);
}

- (void)fireTimerNow
{
  [(_UIKBRTTimerBlock *)self->_timer fireNow];
  if (self->_timer)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_UIKBRTTouchInfo.m" lineNumber:232 description:@"_timer is not nil!"];
  }
}

- (void)invalidateTimer
{
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35___UIKBRTTouchInfo_invalidateTimer__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_sync(timerQueue, block);
}

- (void)cleanup
{
  objc_super v3 = [(_UIKBRTObject *)self owner];
  [v3 _uikbrtRemove:self];

  id v4 = objc_opt_class();
  id touchIdentifier = self->_touchIdentifier;
  [v4 setTouchInfo:0 forIdentifier:touchIdentifier];
}

- (id)setOfTouchesToIgnoreWhenSettingTouchInfo:(id)a3 toState:(char)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  char currentTouchState = self->_currentTouchState;
  id v8 = [(_UIKBRTTouchInfo *)self nextTouch];

  if (v8 == v5)
  {
    while (currentTouchState == 3)
      char currentTouchState = self->_preRuleTouchState;
    switch(currentTouchState)
    {
      case 0:
        [v5 originalTimestamp];
        double v19 = v18 - self->_originalTimestamp;
        if (v19 <= _UIGet_UIKBRT_SetDownTapInterval())
        {
          objc_super v20 = [(_UIKBRTTouchInfo *)self previousTouch];
          id v14 = [v20 setOfTouchesToIgnoreWhenSettingTouchInfo:self toState:1];

          if ([v14 count])
          {
            [v6 unionSet:v14];
          }
          else
          {
            self->_char currentTouchState = 1;
            [v5 setCurrentTouchState:1];
          }
LABEL_12:
        }
        break;
      case 1:
        id v12 = v5;
        uint64_t v13 = 1;
        goto LABEL_20;
      case 2:
        id v12 = v5;
        uint64_t v13 = 2;
        goto LABEL_20;
      case 4:
      case 5:
        [v5 originalTimestamp];
        double v11 = v10 - self->_originalTimestamp;
        if (v11 > _UIGet_UIKBRT_SetDownTapInterval()) {
          break;
        }
        id v12 = v5;
        uint64_t v13 = 4;
LABEL_20:
        [v12 setCurrentTouchState:v13];
        break;
      case 6:
        [v5 originalTimestamp];
        double v23 = v22 - self->_originalTimestamp;
        if (v23 <= _UIGet_UIKBRT_SetDownTapInterval())
        {
          v27[0] = self;
          v27[1] = v5;
          v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
          [v6 addObjectsFromArray:v24];
        }
        break;
      default:
        break;
    }
  }
  else
  {
    id v9 = [(_UIKBRTTouchInfo *)self previousTouch];

    if (v9 == v5)
    {
      while (currentTouchState == 3)
        char currentTouchState = self->_preRuleTouchState;
      switch(currentTouchState)
      {
        case 0:
          double originalTimestamp = self->_originalTimestamp;
          [v5 originalTimestamp];
          if (originalTimestamp - v26 <= _UIGet_UIKBRT_SetDownTapInterval())
          {
            [v5 setCurrentTouchState:1];
            self->_char currentTouchState = 1;
          }
          break;
        case 1:
        case 2:
        case 6:
          [v6 addObject:self];
          id v14 = [(_UIKBRTTouchInfo *)self nextTouch];
          id v15 = [v14 setOfTouchesToIgnoreWhenSettingTouchInfo:self toState:6];
          [v6 unionSet:v15];

          goto LABEL_12;
        case 4:
        case 5:
          double v16 = self->_originalTimestamp;
          [v5 originalTimestamp];
          if (v16 - v17 > _UIGet_UIKBRT_SetDownTapInterval()) {
            [v6 addObject:self];
          }
          break;
        default:
          break;
      }
    }
  }

  return v6;
}

- (BOOL)willChangeTouchInfo:(id)a3 toState:(char)a4
{
  int v4 = a4;
  id v6 = a3;
  if (v4 != 8) {
    goto LABEL_14;
  }
  id v7 = [(_UIKBRTTouchInfo *)self nextTouch];

  if (v7 == v6)
  {
    id v12 = &OBJC_IVAR____UIKBRTTouchInfo__currentTouchState;
    do
    {
      uint64_t v10 = *v12;
      int v11 = *((char *)&self->super.super.isa + v10);
      id v12 = &OBJC_IVAR____UIKBRTTouchInfo__preRuleTouchState;
    }
    while (v11 == 3);
  }
  else
  {
    id v8 = [(_UIKBRTTouchInfo *)self previousTouch];

    if (v8 != v6)
    {
LABEL_14:
      BOOL v13 = 0;
      goto LABEL_15;
    }
    id v9 = &OBJC_IVAR____UIKBRTTouchInfo__currentTouchState;
    do
    {
      uint64_t v10 = *v9;
      int v11 = *((char *)&self->super.super.isa + v10);
      id v9 = &OBJC_IVAR____UIKBRTTouchInfo__preRuleTouchState;
    }
    while (v11 == 3);
  }
  if (v11 == 6)
  {
    [v6 originalTimestamp];
    double v15 = v14 - self->_originalTimestamp;
    if (v15 > _UIGet_UIKBRT_SetDownTapInterval()) {
      goto LABEL_14;
    }
LABEL_16:
    BOOL v13 = 1;
    *((unsigned char *)&self->super.super.isa + v10) = 1;
    goto LABEL_15;
  }
  if (v11 == 2) {
    goto LABEL_16;
  }
  if (v11 != 1) {
    goto LABEL_14;
  }
  *((unsigned char *)&self->super.super.isa + v10) = 0;
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

- (double)originalTimestamp
{
  return self->_originalTimestamp;
}

- (CGPoint)originalTouchPoint
{
  double x = self->_originalTouchPoint.x;
  double y = self->_originalTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)currentTouchPoint
{
  double x = self->_currentTouchPoint.x;
  double y = self->_currentTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)maximumRadius
{
  return self->_maximumRadius;
}

- (double)currentTimestamp
{
  return self->_currentTimestamp;
}

- (double)originalZGradient
{
  return self->_originalZGradient;
}

- (double)currentZGradient
{
  return self->_currentZGradient;
}

- (char)currentTouchState
{
  return self->_currentTouchState;
}

- (void)setCurrentTouchState:(char)a3
{
  self->_char currentTouchState = a3;
}

- (char)preRuleTouchState
{
  return self->_preRuleTouchState;
}

- (void)setPreRuleTouchState:(char)a3
{
  self->_preRuleTouchState = a3;
}

- (id)touchIdentifier
{
  return self->_touchIdentifier;
}

- (_UIKBRTTimerBlock)timer
{
  return self->_timer;
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_touchIdentifier, 0);
}

@end