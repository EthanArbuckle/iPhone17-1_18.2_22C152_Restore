@interface UIPinchGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
+ (BOOL)supportsSecureCoding;
- (BOOL)_endsOnSingleTouch;
- (BOOL)_isGestureType:(int64_t)a3;
- (CGAffineTransform)transform;
- (CGFloat)scale;
- (CGFloat)velocity;
- (CGPoint)anchorPoint;
- (CGPoint)locationInView:(id)a3;
- (double)_hysteresis;
- (double)scaleThreshold;
- (id)_driver;
- (void)_setEndsOnSingleTouch:(BOOL)a3;
- (void)_setHysteresis:(double)a3;
- (void)setScale:(CGFloat)scale;
- (void)setScaleThreshold:(double)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation UIPinchGestureRecognizer

- (id)_driver
{
  driver = self->_driver;
  if (driver) {
    v4 = driver;
  }
  else {
    v4 = (_UIPinchGestureRecognizerDriver *)objc_opt_new();
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

- (void)_setHysteresis:(double)a3
{
  driver = self->_driver;
  if (driver) {
    driver->_hysteresis = a3;
  }
}

- (void)_setEndsOnSingleTouch:(BOOL)a3
{
  driver = self->_driver;
  if (driver) {
    *(unsigned char *)&driver->_flags = *(unsigned char *)&driver->_flags & 0xFE | a3;
  }
}

- (void)setScale:(CGFloat)scale
{
}

- (CGFloat)scale
{
  driver = self->_driver;
  if (driver) {
    return driver->_transform.a;
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

- (void)setScaleThreshold:(double)a3
{
  driver = self->_driver;
  if (driver) {
    driver->_scaleThreshold = a3;
  }
}

- (double)scaleThreshold
{
  driver = self->_driver;
  if (driver) {
    return driver->_scaleThreshold;
  }
  else {
    return 0.0;
  }
}

- (double)_hysteresis
{
  driver = self->_driver;
  if (driver) {
    return driver->_hysteresis;
  }
  else {
    return 0.0;
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  driver = self->_driver;
  if (driver)
  {
    p_a = (_OWORD *)&driver->_transform.a;
    long long v5 = *(_OWORD *)&a3->a;
    long long v6 = *(_OWORD *)&a3->tx;
    p_a[1] = *(_OWORD *)&a3->c;
    p_a[2] = v6;
    _OWORD *p_a = v5;
  }
}

- (CGAffineTransform)transform
{
  CGFloat tx = self[5].tx;
  if (tx == 0.0)
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->CGFloat tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  else
  {
    double v4 = (_OWORD *)(*(void *)&tx + 96);
    long long v5 = v4[1];
    *(_OWORD *)&retstr->a = *v4;
    *(_OWORD *)&retstr->c = v5;
    *(_OWORD *)&retstr->CGFloat tx = v4[2];
  }
  return self;
}

- (BOOL)_endsOnSingleTouch
{
  driver = self->_driver;
  if (driver) {
    return *(unsigned char *)&driver->_flags & 1;
  }
  else {
    return 0;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)locationInView:(id)a3
{
  long long v5 = -[UIGestureRecognizer _activeTouchesEvent](self);

  if (v5)
  {
    v12.receiver = self;
    v12.super_class = (Class)UIPinchGestureRecognizer;
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

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 18;
}

- (void).cxx_destruct
{
}

@end