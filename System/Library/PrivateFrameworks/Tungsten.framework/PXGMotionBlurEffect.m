@interface PXGMotionBlurEffect
- (PXGMotionBlurEffect)initWithEntityManager:(id)a3;
- (double)intensity;
- (void)setIntensity:(double)a3;
@end

@implementation PXGMotionBlurEffect

- (void)setIntensity:(double)a3
{
  self->_intensity = a3;
}

- (double)intensity
{
  return self->_intensity;
}

- (PXGMotionBlurEffect)initWithEntityManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGMotionBlurEffect;
  result = [(PXGEffect *)&v4 initWithEntityManager:a3];
  if (result) {
    result->_intensity = 0.1;
  }
  return result;
}

@end