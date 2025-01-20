@interface UIInputSwitcherGestureState
- (BOOL)didMoveBeyondThreshold;
- (BOOL)gestureConflictsWithTypingWindow;
- (BOOL)hideSwitcher;
- (CGPoint)firstReferencePoint;
- (double)lastSeenKeyboardTouchDown;
- (double)touchDown;
- (void)setDidMoveBeyondThreshold:(BOOL)a3;
- (void)setFirstReferencePoint:(CGPoint)a3;
- (void)setHideSwitcher:(BOOL)a3;
- (void)setLastSeenKeyboardTouchDown:(double)a3;
- (void)setTouchDown:(double)a3;
@end

@implementation UIInputSwitcherGestureState

- (BOOL)gestureConflictsWithTypingWindow
{
  v3 = +[UIKeyboardImpl activeInstance];
  [v3 lastTouchDownTimestamp];
  double v5 = v4;

  BOOL v6 = CFAbsoluteTimeGetCurrent() - v5 < 0.325;
  [(UIInputSwitcherGestureState *)self lastSeenKeyboardTouchDown];
  return vabdd_f64(v5, v7) > 0.00000011920929 || v6;
}

- (BOOL)didMoveBeyondThreshold
{
  return self->_didMoveBeyondThreshold;
}

- (void)setDidMoveBeyondThreshold:(BOOL)a3
{
  self->_didMoveBeyondThreshold = a3;
}

- (BOOL)hideSwitcher
{
  return self->_hideSwitcher;
}

- (void)setHideSwitcher:(BOOL)a3
{
  self->_hideSwitcher = a3;
}

- (CGPoint)firstReferencePoint
{
  double x = self->_firstReferencePoint.x;
  double y = self->_firstReferencePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFirstReferencePoint:(CGPoint)a3
{
  self->_firstReferencePoint = a3;
}

- (double)touchDown
{
  return self->_touchDown;
}

- (void)setTouchDown:(double)a3
{
  self->_touchDown = a3;
}

- (double)lastSeenKeyboardTouchDown
{
  return self->_lastSeenKeyboardTouchDown;
}

- (void)setLastSeenKeyboardTouchDown:(double)a3
{
  self->_lastSeenKeyboardTouchDown = a3;
}

@end