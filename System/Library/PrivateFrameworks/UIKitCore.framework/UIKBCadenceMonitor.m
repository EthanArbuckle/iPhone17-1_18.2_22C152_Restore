@interface UIKBCadenceMonitor
- (BOOL)isUserTyping;
- (UIDelayedAction)touchLogTimer;
- (UIKBCadenceMonitor)init;
- (double)gapAvg;
- (double)prevTouchDown;
- (float)cadence;
- (float)confidence;
- (float)typingAvg;
- (id)recognizer:(id)a3 confidenceWhenPendingTouchInfo:(id)a4;
- (id)recognizer:(id)a3 confidenceWhenSettingTouchInfo:(id)a4;
- (int)touchCount;
- (void)addTypingTouchTime:(double)a3;
- (void)logUserTyping:(id)a3;
- (void)reset;
- (void)setCadence:(float)a3;
- (void)setConfidence:(float)a3;
- (void)setGapAvg:(double)a3;
- (void)setIsUserTyping:(BOOL)a3;
- (void)setPrevTouchDown:(double)a3;
- (void)setTouchCount:(int)a3;
- (void)setTouchLogTimer:(id)a3;
- (void)setTypingAvg:(float)a3;
- (void)typingCadence:(double)a3;
- (void)updateConfidenceWithGap:(double)a3;
@end

@implementation UIKBCadenceMonitor

- (id)recognizer:(id)a3 confidenceWhenPendingTouchInfo:(id)a4
{
  if ([(UIKBCadenceMonitor *)self touchCount] >= 10)
  {
    v5 = objc_alloc_init(_UIKBRTPendingConfidenceLevels);
    [(UIKBCadenceMonitor *)self confidence];
    -[_UIKBRTConfidenceLevels setTouchConfidence:](v5, "setTouchConfidence:");
    [(_UIKBRTConfidenceLevels *)v5 setRestConfidence:0.0];
    [(_UIKBRTPendingConfidenceLevels *)v5 setConfidenceCheckTimeout:0.0];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)recognizer:(id)a3 confidenceWhenSettingTouchInfo:(id)a4
{
  return 0;
}

- (void)updateConfidenceWithGap:(double)a3
{
  [(UIKBCadenceMonitor *)self gapAvg];
  float v6 = v5 - a3;
  [(UIKBCadenceMonitor *)self gapAvg];
  double v8 = v7 * v7;
  if (v6 <= 0.0)
  {
    float v9 = v8 * 0.2;
    double v10 = 0.200000003;
  }
  else
  {
    float v9 = v8 * 0.8;
    double v10 = 0.800000012;
  }
  double v11 = v6 * v6 * v10;
  *(float *)&double v11 = v11;
  if (*(float *)&v11 > v9) {
    *(float *)&double v11 = v9;
  }
  *(float *)&double v11 = (float)((float)(v9 - *(float *)&v11) / v9) * 100.0;
  [(UIKBCadenceMonitor *)self setConfidence:v11];
}

- (void)typingCadence:(double)a3
{
  if ([(UIKBCadenceMonitor *)self touchCount] < 1)
  {
    double v6 = 30.0;
  }
  else
  {
    [(UIKBCadenceMonitor *)self prevTouchDown];
    double v6 = a3 - v5;
    float v7 = 60.0 / (a3 - v5);
    [(UIKBCadenceMonitor *)self typingAvg];
    if (v8 == 0.0)
    {
      [(UIKBCadenceMonitor *)self gapAvg];
      if (v9 == 0.0)
      {
        *(float *)&double v9 = v7;
        [(UIKBCadenceMonitor *)self setTypingAvg:v9];
        [(UIKBCadenceMonitor *)self setGapAvg:v6];
      }
    }
    [(UIKBCadenceMonitor *)self typingAvg];
    *(float *)&double v11 = (float)(v10 + v7) * 0.5;
    [(UIKBCadenceMonitor *)self setTypingAvg:v11];
    [(UIKBCadenceMonitor *)self gapAvg];
    [(UIKBCadenceMonitor *)self setGapAvg:(v6 + v12) * 0.5];
  }
  [(UIKBCadenceMonitor *)self typingAvg];
  -[UIKBCadenceMonitor setCadence:](self, "setCadence:");
  [(UIKBCadenceMonitor *)self updateConfidenceWithGap:v6];
  v13 = [(UIKBCadenceMonitor *)self touchLogTimer];

  if (v13)
  {
    [(UIKBCadenceMonitor *)self gapAvg];
    double v15 = v14 * 1.5;
    v16 = [(UIKBCadenceMonitor *)self touchLogTimer];
    if (v6 <= v15)
    {
      double v18 = 1.0;
    }
    else
    {
      [(UIKBCadenceMonitor *)self gapAvg];
      double v18 = v17 * 1.5;
    }
    [v16 touchWithDelay:v18];
  }
  else
  {
    v19 = [UIDelayedAction alloc];
    v16 = [NSNumber numberWithBool:0];
    v20 = [(UIDelayedAction *)v19 initWithTarget:self action:sel_logUserTyping_ userInfo:v16 delay:*MEMORY[0x1E4F1C3A0] mode:3.0];
    [(UIKBCadenceMonitor *)self setTouchLogTimer:v20];
  }
  [(UIKBCadenceMonitor *)self setIsUserTyping:v13 != 0];
  [(UIKBCadenceMonitor *)self setPrevTouchDown:a3];
  uint64_t v21 = [(UIKBCadenceMonitor *)self touchCount] + 1;
  [(UIKBCadenceMonitor *)self setTouchCount:v21];
}

- (void)logUserTyping:(id)a3
{
  -[UIKBCadenceMonitor setIsUserTyping:](self, "setIsUserTyping:", [a3 BOOLValue]);
  v4 = [(UIKBCadenceMonitor *)self touchLogTimer];
  [v4 cancel];

  [(UIKBCadenceMonitor *)self setTouchLogTimer:0];
}

- (void)addTypingTouchTime:(double)a3
{
  [(UIKBCadenceMonitor *)self prevTouchDown];
  if (v5 <= a3)
  {
    [(UIKBCadenceMonitor *)self typingCadence:a3];
  }
}

- (void)reset
{
  [(UIKBCadenceMonitor *)self setIsUserTyping:0];
  [(UIKBCadenceMonitor *)self setCadence:0.0];
  [(UIKBCadenceMonitor *)self setConfidence:0.0];
  [(UIKBCadenceMonitor *)self setTypingAvg:0.0];
  [(UIKBCadenceMonitor *)self setGapAvg:0.0];
  [(UIKBCadenceMonitor *)self setPrevTouchDown:0.0];
  [(UIKBCadenceMonitor *)self setTouchCount:0];
}

- (UIKBCadenceMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIKBCadenceMonitor;
  v2 = [(UIKBCadenceMonitor *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UIKBCadenceMonitor *)v2 reset];
  }
  return v3;
}

- (BOOL)isUserTyping
{
  return self->_isUserTyping;
}

- (void)setIsUserTyping:(BOOL)a3
{
  self->_isUserTyping = a3;
}

- (float)cadence
{
  return self->_cadence;
}

- (void)setCadence:(float)a3
{
  self->_cadence = a3;
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (float)typingAvg
{
  return self->_typingAvg;
}

- (void)setTypingAvg:(float)a3
{
  self->_typingAvg = a3;
}

- (double)gapAvg
{
  return self->_gapAvg;
}

- (void)setGapAvg:(double)a3
{
  self->_gapAvg = a3;
}

- (double)prevTouchDown
{
  return self->_prevTouchDown;
}

- (void)setPrevTouchDown:(double)a3
{
  self->_prevTouchDown = a3;
}

- (int)touchCount
{
  return self->_touchCount;
}

- (void)setTouchCount:(int)a3
{
  self->_touchCount = a3;
}

- (UIDelayedAction)touchLogTimer
{
  return self->_touchLogTimer;
}

- (void)setTouchLogTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end