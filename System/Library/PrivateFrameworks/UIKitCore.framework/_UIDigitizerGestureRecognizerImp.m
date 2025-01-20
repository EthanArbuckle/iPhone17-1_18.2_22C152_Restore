@interface _UIDigitizerGestureRecognizerImp
- (BOOL)_senderOfPressesHasTouchSurface:(id)a3 withEvent:(id)a4;
- (BOOL)_senderOfPressesIsSoftwareRemoteWithEvent:(id)a3;
- (BOOL)_shouldReportDigitizerLocation;
- (CGPoint)defaultDigitizerLocation;
- (CGPoint)digitizerLocation;
- (NSTimer)minimumPressDurationTimer;
- (NSTimer)waitingForTouchesAfterPressTimer;
- (_UIDigitizerGestureRecognizerImpDelegate)delegate;
- (double)lastRecognitionTime;
- (double)maximumPressDuration;
- (double)minimumPressDuration;
- (double)pressBeginTime;
- (double)pressEndTime;
- (double)pressEndToTouchBeginDuration;
- (double)touchEndTime;
- (double)touchEndToPressEndDuration;
- (int64_t)numberOfActiveTouches;
- (void)_minimumPressDurationTimerFired:(id)a3;
- (void)_waitingForTouchesAfterPressTimerFired:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setDigitizerLocation:(CGPoint)a3;
- (void)setLastRecognitionTime:(double)a3;
- (void)setMaximumPressDuration:(double)a3;
- (void)setMinimumPressDuration:(double)a3;
- (void)setMinimumPressDurationTimer:(id)a3;
- (void)setNumberOfActiveTouches:(int64_t)a3;
- (void)setPressBeginTime:(double)a3;
- (void)setPressEndTime:(double)a3;
- (void)setPressEndToTouchBeginDuration:(double)a3;
- (void)setTouchEndTime:(double)a3;
- (void)setTouchEndToPressEndDuration:(double)a3;
- (void)setWaitingForTouchesAfterPressTimer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIDigitizerGestureRecognizerImp

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ([(_UIDigitizerGestureRecognizerImp *)self _shouldReportDigitizerLocation])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v8 = v7 - self->_pressEndTime;
    [a4 _digitizerLocation];
    self->_digitizerLocation.x = v9;
    self->_digitizerLocation.y = v10;
    self->_numberOfActiveTouches += [a3 count];
    if (v8 < self->_pressEndToTouchBeginDuration && self->_lastRecognitionTime != self->_pressEndTime)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_waitingForTouchesAfterPressTimer);
      [WeakRetained invalidate];

      objc_storeWeak((id *)&self->_waitingForTouchesAfterPressTimer, 0);
      id v12 = objc_loadWeakRetained((id *)&self->_delegate);
      [v12 touchesBeganSuccessfully:self];
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if ([(_UIDigitizerGestureRecognizerImp *)self _shouldReportDigitizerLocation])
  {
    [a4 _digitizerLocation];
    self->_digitizerLocation.x = v6;
    self->_digitizerLocation.y = v7;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(_UIDigitizerGestureRecognizerImp *)self _shouldReportDigitizerLocation])
  {
    [a4 _digitizerLocation];
    self->_digitizerLocation.x = v7;
    self->_digitizerLocation.y = v8;
    int64_t numberOfActiveTouches = self->_numberOfActiveTouches;
    uint64_t v10 = [a3 count];
    self->_int64_t numberOfActiveTouches = (numberOfActiveTouches - v10) & ~((numberOfActiveTouches - v10) >> 63);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_touchEndTime = v11;
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(_UIDigitizerGestureRecognizerImp *)self _shouldReportDigitizerLocation])
  {
    [(_UIDigitizerGestureRecognizerImp *)self defaultDigitizerLocation];
    self->_digitizerLocation.x = v6;
    self->_digitizerLocation.y = v7;
    int64_t numberOfActiveTouches = self->_numberOfActiveTouches;
    uint64_t v9 = [a3 count];
    self->_int64_t numberOfActiveTouches = (numberOfActiveTouches - v9) & ~((numberOfActiveTouches - v9) >> 63);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_touchEndTime = v10;
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", a3, a4);
  self->_pressBeginTime = v5;
  CGFloat v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__minimumPressDurationTimerFired_ selector:0 userInfo:0 repeats:self->_minimumPressDuration];
  objc_storeWeak((id *)&self->_minimumPressDurationTimer, v6);

  if ([(_UIDigitizerGestureRecognizerImp *)self _shouldReportDigitizerLocation])
  {
    p_waitingForTouchesAfterPressTimer = &self->_waitingForTouchesAfterPressTimer;
    id WeakRetained = objc_loadWeakRetained((id *)p_waitingForTouchesAfterPressTimer);
    [WeakRetained invalidate];

    objc_storeWeak((id *)p_waitingForTouchesAfterPressTimer, 0);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  double touchEndTime = self->_touchEndTime;
  double v10 = v7 - self->_pressBeginTime;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_minimumPressDurationTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)&self->_minimumPressDurationTimer, 0);
  self->_pressEndTime = v8;
  if (self->_minimumPressDuration > v10 || v10 >= self->_maximumPressDuration) {
    goto LABEL_11;
  }
  if (![(_UIDigitizerGestureRecognizerImp *)self _shouldReportDigitizerLocation])
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 pressesEndedSuccessfully:self];
LABEL_10:

    goto LABEL_11;
  }
  if (self->_numberOfActiveTouches <= 0 && v8 - touchEndTime >= self->_touchEndToPressEndDuration)
  {
    if (!-[_UIDigitizerGestureRecognizerImp _senderOfPressesHasTouchSurface:withEvent:](self, "_senderOfPressesHasTouchSurface:withEvent:", a3, a4, v8 - touchEndTime)|| [(_UIDigitizerGestureRecognizerImp *)self _senderOfPressesIsSoftwareRemoteWithEvent:a4])
    {
      [(_UIDigitizerGestureRecognizerImp *)self defaultDigitizerLocation];
      self->_digitizerLocation.x = v14;
      self->_digitizerLocation.y = v15;
LABEL_22:
      self->_lastRecognitionTime = v8;
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 pressesEndedSuccessfully:self];
      goto LABEL_15;
    }
    id v12 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__waitingForTouchesAfterPressTimerFired_ selector:0 userInfo:0 repeats:self->_pressEndToTouchBeginDuration];
    objc_storeWeak((id *)&self->_waitingForTouchesAfterPressTimer, v12);
    goto LABEL_10;
  }
  if ([(_UIDigitizerGestureRecognizerImp *)self _senderOfPressesHasTouchSurface:a3 withEvent:a4]|| [(_UIDigitizerGestureRecognizerImp *)self _senderOfPressesIsSoftwareRemoteWithEvent:a4])
  {
    goto LABEL_22;
  }
LABEL_11:
  if (v10 < self->_minimumPressDuration)
  {
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 pressesNotHeldLongEnough:self];
  }
  if (v10 > self->_maximumPressDuration)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 pressesHeldOverMaximum:self];
LABEL_15:
  }
}

- (BOOL)_shouldReportDigitizerLocation
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 _remoteTouchSurfaceType] != 2;

  return v3;
}

- (CGPoint)digitizerLocation
{
  if ([(_UIDigitizerGestureRecognizerImp *)self _shouldReportDigitizerLocation])
  {
    double x = self->_digitizerLocation.x;
    double y = self->_digitizerLocation.y;
  }
  else
  {
    [(_UIDigitizerGestureRecognizerImp *)self defaultDigitizerLocation];
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)reset
{
  self->_int64_t numberOfActiveTouches = 0;
  p_minimumPressDurationTimer = &self->_minimumPressDurationTimer;
  *(_OWORD *)&self->_double touchEndTime = 0u;
  *(_OWORD *)&self->_pressEndTime = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_minimumPressDurationTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_minimumPressDurationTimer, 0);
  p_waitingForTouchesAfterPressTimer = &self->_waitingForTouchesAfterPressTimer;
  id v6 = objc_loadWeakRetained((id *)p_waitingForTouchesAfterPressTimer);
  [v6 invalidate];

  objc_storeWeak((id *)p_waitingForTouchesAfterPressTimer, 0);
}

- (void)_minimumPressDurationTimerFired:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pressesHeldForMinimum:self];
}

- (void)_waitingForTouchesAfterPressTimerFired:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pressesEndedSuccessfully:self];
}

- (CGPoint)defaultDigitizerLocation
{
  double v2 = 0.5;
  double v3 = 0.5;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (BOOL)_senderOfPressesHasTouchSurface:(id)a3 withEvent:(id)a4
{
  if ([a4 _hidEvent])
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v8 = IOHIDEventGetIntegerValue();
    if (IntegerValue == 12 && v8 == 65)
    {
      char v9 = 0;
    }
    else
    {
      BOOL v11 = v8 != 158 && v8 != 40;
      char v9 = IntegerValue != 7 || v11;
    }
  }
  else
  {
    char v9 = 1;
  }
  id v12 = [a3 anyObject];
  if ([v12 type] != 4)
  {
    CGFloat v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"UIDigitizerGestureRecognizers.m" lineNumber:322 description:&stru_1ED0E84C0];
  }
  char v13 = v9 & ~[v12 _isSynthetic];

  return v13;
}

- (BOOL)_senderOfPressesIsSoftwareRemoteWithEvent:(id)a3
{
  if (![a3 _hidEvent]) {
    return 0;
  }
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v4 = IOHIDEventGetIntegerValue();
  BOOL v5 = 0;
  if (IntegerValue != 12 || v4 != 128) {
    return v5;
  }
  uint64_t Children = IOHIDEventGetChildren();
  if (!Children) {
    return 0;
  }
  CFArrayRef v7 = (const __CFArray *)Children;
  CFIndex v8 = 0;
  do
  {
    CFIndex Count = CFArrayGetCount(v7);
    BOOL v5 = v8 < Count;
    if (v8 >= Count) {
      break;
    }
    CFArrayGetValueAtIndex(v7, v8);
    uint64_t v10 = IOHIDEventGetIntegerValue();
    uint64_t v11 = IOHIDEventGetIntegerValue();
    ++v8;
  }
  while (v10 != 65299 || v11 != 16);
  return v5;
}

- (_UIDigitizerGestureRecognizerImpDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDigitizerGestureRecognizerImpDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (double)maximumPressDuration
{
  return self->_maximumPressDuration;
}

- (void)setMaximumPressDuration:(double)a3
{
  self->_maximumPressDuration = a3;
}

- (void)setDigitizerLocation:(CGPoint)a3
{
  self->_digitizerLocation = a3;
}

- (int64_t)numberOfActiveTouches
{
  return self->_numberOfActiveTouches;
}

- (void)setNumberOfActiveTouches:(int64_t)a3
{
  self->_int64_t numberOfActiveTouches = a3;
}

- (double)pressEndToTouchBeginDuration
{
  return self->_pressEndToTouchBeginDuration;
}

- (void)setPressEndToTouchBeginDuration:(double)a3
{
  self->_pressEndToTouchBeginDuration = a3;
}

- (double)touchEndToPressEndDuration
{
  return self->_touchEndToPressEndDuration;
}

- (void)setTouchEndToPressEndDuration:(double)a3
{
  self->_touchEndToPressEndDuration = a3;
}

- (double)touchEndTime
{
  return self->_touchEndTime;
}

- (void)setTouchEndTime:(double)a3
{
  self->_double touchEndTime = a3;
}

- (double)pressBeginTime
{
  return self->_pressBeginTime;
}

- (void)setPressBeginTime:(double)a3
{
  self->_pressBeginTime = a3;
}

- (double)pressEndTime
{
  return self->_pressEndTime;
}

- (void)setPressEndTime:(double)a3
{
  self->_pressEndTime = a3;
}

- (double)lastRecognitionTime
{
  return self->_lastRecognitionTime;
}

- (void)setLastRecognitionTime:(double)a3
{
  self->_lastRecognitionTime = a3;
}

- (NSTimer)minimumPressDurationTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_minimumPressDurationTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setMinimumPressDurationTimer:(id)a3
{
}

- (NSTimer)waitingForTouchesAfterPressTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_waitingForTouchesAfterPressTimer);
  return (NSTimer *)WeakRetained;
}

- (void)setWaitingForTouchesAfterPressTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_waitingForTouchesAfterPressTimer);
  objc_destroyWeak((id *)&self->_minimumPressDurationTimer);
  objc_destroyWeak((id *)&self->_delegate);
}

@end