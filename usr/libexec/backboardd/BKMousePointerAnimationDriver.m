@interface BKMousePointerAnimationDriver
- (BKMousePointerAnimationDriver)initWithRelativeTranslation:(CGPoint)a3;
- (BOOL)isComplete;
- (CGPoint)currentTranslation;
- (CGPoint)relativeTranslation;
- (void)applyForTime:(double)a3;
@end

@implementation BKMousePointerAnimationDriver

- (CGPoint)currentTranslation
{
  double x = self->_currentTranslation.x;
  double y = self->_currentTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)relativeTranslation
{
  double x = self->_relativeTranslation.x;
  double y = self->_relativeTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isComplete
{
  return 1;
}

- (void)applyForTime:(double)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (BKMousePointerAnimationDriver)initWithRelativeTranslation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)BKMousePointerAnimationDriver;
  CGPoint result = [(BKMousePointerAnimationDriver *)&v6 init];
  if (result)
  {
    result->_relativeTranslation.CGFloat x = x;
    result->_relativeTranslation.CGFloat y = y;
    result->_currentTranslation = CGPointZero;
  }
  return result;
}

@end