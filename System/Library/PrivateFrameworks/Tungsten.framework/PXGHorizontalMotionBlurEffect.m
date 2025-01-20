@interface PXGHorizontalMotionBlurEffect
- (id)kernel;
@end

@implementation PXGHorizontalMotionBlurEffect

- (void).cxx_destruct
{
}

- (id)kernel
{
  if (!self->_motionBlur)
  {
    v3 = objc_alloc_init(PXGMotionBlurKernel);
    motionBlur = self->_motionBlur;
    self->_motionBlur = v3;

    [(PXGMotionBlurKernel *)self->_motionBlur setDirection:0];
  }
  [(PXGMotionBlurEffect *)self intensity];
  -[PXGMotionBlurKernel setSize:](self->_motionBlur, "setSize:");
  v5 = self->_motionBlur;

  return v5;
}

@end