@interface PXGExposureBlurEffect
- (PXGExposureBlurEffect)initWithEntityManager:(id)a3;
- (double)exposure;
- (double)multiplier;
- (double)radius;
- (id)kernel;
- (void)setExposure:(double)a3;
- (void)setMultiplier:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation PXGExposureBlurEffect

- (void).cxx_destruct
{
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setExposure:(double)a3
{
  self->_exposure = a3;
}

- (double)exposure
{
  return self->_exposure;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)radius
{
  return self->_radius;
}

- (id)kernel
{
  if (!self->_kernel)
  {
    v3 = objc_alloc_init(PXGExposureBlurKernel);
    kernel = self->_kernel;
    self->_kernel = v3;
  }
  [(PXGExposureBlurEffect *)self radius];
  double v6 = v5;
  [(PXGEffect *)self scale];
  [(PXGExposureBlurKernel *)self->_kernel setRadius:v6 * v7];
  [(PXGExposureBlurEffect *)self exposure];
  -[PXGExposureBlurKernel setExposure:](self->_kernel, "setExposure:");
  [(PXGExposureBlurEffect *)self multiplier];
  -[PXGExposureBlurKernel setMultiplier:](self->_kernel, "setMultiplier:");
  v8 = self->_kernel;

  return v8;
}

- (PXGExposureBlurEffect)initWithEntityManager:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXGExposureBlurEffect;
  result = [(PXGEffect *)&v4 initWithEntityManager:a3];
  if (result)
  {
    result->_radius = 20.0;
    result->_exposure = 1.0;
    result->_multiplier = 1.0;
  }
  return result;
}

@end