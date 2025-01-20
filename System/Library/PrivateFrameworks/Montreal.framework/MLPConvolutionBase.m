@interface MLPConvolutionBase
- (unint64_t)computeOutputLengthWithInputLength:(int64_t)a3 kernelWidth:(int64_t)a4 kernelStride:(int64_t)a5;
- (unint64_t)kernelHeight;
- (unint64_t)kernelStride;
- (unint64_t)kernelWidth;
- (void)setKernelHeight:(unint64_t)a3;
- (void)setKernelStride:(unint64_t)a3;
- (void)setKernelWidth:(unint64_t)a3;
@end

@implementation MLPConvolutionBase

- (unint64_t)computeOutputLengthWithInputLength:(int64_t)a3 kernelWidth:(int64_t)a4 kernelStride:(int64_t)a5
{
  uint64_t v8 = vcvtps_s32_f32((float)(a3 - a4 + 1) / (float)a5);
  if (v8 <= 0) {
    sub_19E15DB6C(@"Output from convolution layer is not valid: %ld", (uint64_t)a2, a3, a4, a5, v5, v6, v7, v8);
  }
  return v8;
}

- (unint64_t)kernelWidth
{
  return self->_kernelWidth;
}

- (void)setKernelWidth:(unint64_t)a3
{
  self->_kernelWidth = a3;
}

- (unint64_t)kernelHeight
{
  return self->_kernelHeight;
}

- (void)setKernelHeight:(unint64_t)a3
{
  self->_kernelHeight = a3;
}

- (unint64_t)kernelStride
{
  return self->_kernelStride;
}

- (void)setKernelStride:(unint64_t)a3
{
  self->_kernelStride = a3;
}

@end