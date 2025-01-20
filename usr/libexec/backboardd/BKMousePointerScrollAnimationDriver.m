@interface BKMousePointerScrollAnimationDriver
- (BKMousePointerScrollAnimationDriver)initWithRelativeTranslation:(CGPoint)a3 initialVelocity:(CGPoint)a4 decelerationRate:(double)a5;
- (BOOL)isComplete;
- (CGPoint)currentTranslation;
- (void)applyForTime:(double)a3;
@end

@implementation BKMousePointerScrollAnimationDriver

- (CGPoint)currentTranslation
{
  double x = self->_currentTranslation.x;
  double y = self->_currentTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isComplete
{
  int v2 = BSFloatApproximatelyEqualToFloat();
  if (v2)
  {
    LOBYTE(v2) = BSFloatApproximatelyEqualToFloat();
  }
  return v2;
}

- (void)applyForTime:(double)a3
{
  double v4 = (a3 - self->_elapsedTime) * 1000.0;
  self->_elapsedTime = a3;
  if ((BSFloatIsZero() & 1) == 0)
  {
    double v5 = 1.0 - pow(self->_decelerationRate, v4);
    CGPoint v6 = (CGPoint)vmlaq_n_f64((float64x2_t)self->_intermediate, vsubq_f64((float64x2_t)self->_target, (float64x2_t)self->_intermediate), v5);
    self->_currentTranslation = (CGPoint)vmlaq_n_f64((float64x2_t)self->_currentTranslation, vsubq_f64((float64x2_t)v6, (float64x2_t)self->_currentTranslation), v5);
    self->_intermediate = v6;
  }
}

- (BKMousePointerScrollAnimationDriver)initWithRelativeTranslation:(CGPoint)a3 initialVelocity:(CGPoint)a4 decelerationRate:(double)a5
{
  float64_t x = a4.x;
  float64_t y = a4.y;
  CGFloat v5 = a3.y;
  CGFloat v6 = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)BKMousePointerScrollAnimationDriver;
  CGPoint result = -[BKMousePointerAnimationDriver initWithRelativeTranslation:](&v12, "initWithRelativeTranslation:");
  if (result)
  {
    v8.f64[0] = x;
    result->_initialVelocity.float64_t x = x;
    result->_initialVelocity.float64_t y = y;
    v8.f64[1] = y;
    result->_intermediate = (CGPoint)vaddq_f64(vdivq_f64(vmulq_n_f64(vdivq_f64(v8, (float64x2_t)vdupq_n_s64(0x408F400000000000uLL)), a5), (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 - a5), 0)), (float64x2_t)0);
    result->_target.float64_t x = v6;
    result->_target.float64_t y = v5;
    result->_decelerationRate = a5;
  }
  return result;
}

@end