@interface _UIScrollDynamics
- (BOOL)isRubberBandingAfterDuration:(double)a3;
- (BOOL)shouldRoundCalculations;
- (CGPoint)contentOrigin;
- (CGPoint)decelerationTarget;
- (CGPoint)initialContentOffset;
- (CGPoint)positionAfterDuration:(double)a3;
- (CGRect)contentFrame;
- (CGSize)tolerance;
- (CGSize)viewSize;
- (CGVector)initialVelocity;
- (CGVector)velocityAfterDuration:(double)a3;
- (_UIScrollDynamics)init;
- (_UIScrollDynamics)initWithInitialContentOffset:(CGPoint)a3 velocity:(CGVector)a4 contentFrame:(CGRect)a5 viewSize:(CGSize)a6 screenScale:(double)a7;
- (double)durationUntilStop;
- (double)speedAfterDuration:(double)a3;
- (void)recalculateForDecelerationTarget:(CGPoint)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentOrigin:(CGPoint)a3;
- (void)setDecelerationTarget:(CGPoint)a3;
- (void)setInitialContentOffset:(CGPoint)a3;
- (void)setInitialVelocity:(CGVector)a3;
- (void)setShouldRoundCalculations:(BOOL)a3;
- (void)setViewSize:(CGSize)a3;
@end

@implementation _UIScrollDynamics

- (_UIScrollDynamics)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v5 = (_UIScrollDynamics *)objc_opt_new();

    return v5;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIScrollDynamics;
    return [(_UIScrollDynamics *)&v6 init];
  }
}

- (_UIScrollDynamics)initWithInitialContentOffset:(CGPoint)a3 velocity:(CGVector)a4 contentFrame:(CGRect)a5 viewSize:(CGSize)a6 screenScale:(double)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  ddouble y = a4.dy;
  ddouble x = a4.dx;
  double v13 = a3.y;
  double v14 = a3.x;
  v15 = [(_UIScrollDynamics *)self init];
  v16 = v15;
  if (v15)
  {
    -[_UIScrollDynamics setInitialContentOffset:](v15, "setInitialContentOffset:", v14, v13);
    -[_UIScrollDynamics setInitialVelocity:](v16, "setInitialVelocity:", dx, dy);
    -[_UIScrollDynamics setContentFrame:](v16, "setContentFrame:", x, y, width, height);
    -[_UIScrollDynamics setContentOrigin:](v16, "setContentOrigin:", x, y);
    -[_UIScrollDynamics setViewSize:](v16, "setViewSize:", a7, v18);
    v16->_tolerance.double width = v19;
    v16->_tolerance.double height = v19;
    [(_UIScrollDynamics *)v16 setShouldRoundCalculations:1];
    [(_UIScrollDynamics *)v16 calculateDecelerationTarget];
  }
  return v16;
}

- (double)durationUntilStop
{
  return 0.0;
}

- (double)speedAfterDuration:(double)a3
{
  return 0.0;
}

- (CGVector)velocityAfterDuration:(double)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.ddouble y = v4;
  result.ddouble x = v3;
  return result;
}

- (CGPoint)positionAfterDuration:(double)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (BOOL)isRubberBandingAfterDuration:(double)a3
{
  return 0;
}

- (void)recalculateForDecelerationTarget:(CGPoint)a3
{
  -[_UIScrollDynamics setDecelerationTarget:](self, "setDecelerationTarget:", a3.x, a3.y);
  [(_UIScrollDynamics *)self calculateToReachDecelerationTarget];
}

- (BOOL)shouldRoundCalculations
{
  return self->_shouldRoundCalculations;
}

- (void)setShouldRoundCalculations:(BOOL)a3
{
  self->_shouldRoundCalculations = a3;
}

- (CGSize)tolerance
{
  double width = self->_tolerance.width;
  double height = self->_tolerance.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)decelerationTarget
{
  double x = self->_decelerationTarget.x;
  double y = self->_decelerationTarget.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDecelerationTarget:(CGPoint)a3
{
  self->_decelerationTarget = a3;
}

- (CGPoint)initialContentOffset
{
  double x = self->_initialContentOffset.x;
  double y = self->_initialContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialContentOffset:(CGPoint)a3
{
  self->_initialContentOffset = a3;
}

- (CGVector)initialVelocity
{
  ddouble x = self->_initialVelocity.dx;
  ddouble y = self->_initialVelocity.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (void)setInitialVelocity:(CGVector)a3
{
  self->_initialVelocitdouble y = a3;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (CGPoint)contentOrigin
{
  double x = self->_contentOrigin.x;
  double y = self->_contentOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOrigin:(CGPoint)a3
{
  self->_contentOrigin = a3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
}

@end