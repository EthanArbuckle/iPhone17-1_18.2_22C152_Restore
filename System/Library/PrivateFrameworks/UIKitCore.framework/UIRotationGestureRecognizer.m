@interface UIRotationGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
+ (BOOL)supportsSecureCoding;
- (BOOL)_isGestureType:(int64_t)a3;
- (CGFloat)rotation;
- (CGFloat)velocity;
- (CGPoint)anchorPoint;
- (CGPoint)locationInView:(id)a3;
- (double)_postRecognitionWeight;
- (double)_preRecognitionWeight;
- (id)_driver;
- (void)_setPostRecognitionWeight:(double)a3;
- (void)_setPreRecognitionWeight:(double)a3;
- (void)setRotation:(CGFloat)rotation;
@end

@implementation UIRotationGestureRecognizer

- (id)_driver
{
  driver = self->_driver;
  if (driver) {
    v4 = driver;
  }
  else {
    v4 = (_UIRotationGestureRecognizerDriver *)objc_opt_new();
  }
  v5 = self->_driver;
  self->_driver = v4;

  v6 = self->_driver;
  return v6;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (void)_setPreRecognitionWeight:(double)a3
{
}

- (CGPoint)anchorPoint
{
  driver = self->_driver;
  if (driver)
  {
    p_x = &driver->_anchorPoint.x;
    double v4 = *p_x;
    double v5 = p_x[1];
  }
  else
  {
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)setRotation:(CGFloat)rotation
{
}

- (CGFloat)rotation
{
  driver = self->_driver;
  if (driver) {
    return driver->_initialTouchAngle - driver->_currentTouchAngle + (double)driver->_currentRotationCount * 6.28318531;
  }
  else {
    return 0.0;
  }
}

- (CGFloat)velocity
{
  driver = self->_driver;
  if (!driver) {
    return 0.0;
  }
  double previousVelocity = driver->_previousVelocity;
  CGFloat result = driver->_velocity;
  if (previousVelocity != 0.0) {
    return previousVelocity * 0.75 + result * 0.25;
  }
  return result;
}

- (double)_preRecognitionWeight
{
  driver = self->_driver;
  if (driver) {
    return driver->_preRecognitionWeight;
  }
  else {
    return 0.0;
  }
}

- (double)_postRecognitionWeight
{
  driver = self->_driver;
  if (driver) {
    return driver->_postRecognitionWeight;
  }
  else {
    return 0.0;
  }
}

- (void)_setPostRecognitionWeight:(double)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 20;
}

- (CGPoint)locationInView:(id)a3
{
  double v5 = -[UIGestureRecognizer _activeTouchesEvent](self);

  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)UIRotationGestureRecognizer;
    [(UIGestureRecognizer *)&v12 locationInView:a3];
  }
  else
  {
    driver = self->_driver;
    if (driver)
    {
      p_x = &driver->_anchorPoint.x;
      double v10 = *p_x;
      double v11 = p_x[1];
    }
    else
    {
      double v11 = 0.0;
      double v10 = 0.0;
    }
    -[UIGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", a3, v10, v11);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (void).cxx_destruct
{
}

@end