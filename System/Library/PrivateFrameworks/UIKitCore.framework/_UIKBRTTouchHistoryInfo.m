@interface _UIKBRTTouchHistoryInfo
- (BOOL)ignoreForDrift;
- (BOOL)ignoreTouch;
- (BOOL)isActive;
- (BOOL)isLeftHand;
- (CGPoint)actualLocation;
- (CGPoint)errorVector;
- (_UIKBRTTouchHistoryInfo)init;
- (double)touchTime;
- (id)description;
- (id)touchIdentifier;
- (void)setActualLocation:(CGPoint)a3;
- (void)setErrorVector:(CGPoint)a3;
- (void)setIgnoreForDrift:(BOOL)a3;
- (void)setIgnoreTouch:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsLeftHand:(BOOL)a3;
- (void)setTouchIdentifier:(id)a3;
- (void)setTouchTime:(double)a3;
@end

@implementation _UIKBRTTouchHistoryInfo

- (_UIKBRTTouchHistoryInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIKBRTTouchHistoryInfo;
  result = [(_UIKBRTTouchHistoryInfo *)&v3 init];
  if (result) {
    *(_WORD *)&result->_isLeftHand = 257;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)_UIKBRTTouchHistoryInfo;
  uint64_t v4 = [(_UIKBRTTouchHistoryInfo *)&v12 description];
  v5 = (void *)v4;
  if (self->_isLeftHand) {
    v6 = "left";
  }
  else {
    v6 = "right";
  }
  v7 = "";
  if (self->_isActive) {
    v8 = "";
  }
  else {
    v8 = " (INACTIVE)";
  }
  if (self->_ignoreForDrift) {
    v9 = " (UNKNOWN)";
  }
  else {
    v9 = "";
  }
  if (self->_ignoreTouch) {
    v7 = " (IGNORED)";
  }
  v10 = [v3 stringWithFormat:@"%@ ID=%@, @%.2f, {%.1f%+.1f, %.1f%+.1f}, %s%s%s%s", v4, self->_touchIdentifier, *(_OWORD *)&self->_touchTime, *(void *)&self->_errorVector.x, *(void *)&self->_actualLocation.y, *(void *)&self->_errorVector.y, v6, v8, v9, v7];

  return v10;
}

- (id)touchIdentifier
{
  return self->_touchIdentifier;
}

- (void)setTouchIdentifier:(id)a3
{
}

- (double)touchTime
{
  return self->_touchTime;
}

- (void)setTouchTime:(double)a3
{
  self->_touchTime = a3;
}

- (CGPoint)actualLocation
{
  double x = self->_actualLocation.x;
  double y = self->_actualLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setActualLocation:(CGPoint)a3
{
  self->_actualLocation = a3;
}

- (BOOL)isLeftHand
{
  return self->_isLeftHand;
}

- (void)setIsLeftHand:(BOOL)a3
{
  self->_isLeftHand = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)ignoreForDrift
{
  return self->_ignoreForDrift;
}

- (void)setIgnoreForDrift:(BOOL)a3
{
  self->_ignoreForDrift = a3;
}

- (BOOL)ignoreTouch
{
  return self->_ignoreTouch;
}

- (void)setIgnoreTouch:(BOOL)a3
{
  self->_ignoreTouch = a3;
}

- (CGPoint)errorVector
{
  double x = self->_errorVector.x;
  double y = self->_errorVector.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setErrorVector:(CGPoint)a3
{
  self->_errorVector = a3;
}

- (void).cxx_destruct
{
}

@end