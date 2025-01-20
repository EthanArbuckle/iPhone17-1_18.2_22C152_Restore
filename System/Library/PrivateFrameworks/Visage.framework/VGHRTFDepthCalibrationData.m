@interface VGHRTFDepthCalibrationData
- (NSData)lensDistortionLut;
- (__n128)intrinsicMatrix;
- (__n128)setIntrinsicMatrix:(__n128)a3;
- (double)intrinsicMatrixReferenceDimension;
- (double)lensDistortionCenter;
- (void)setIntrinsicMatrixReferenceDimension:(VGHRTFDepthCalibrationData *)self;
- (void)setLensDistortionCenter:(VGHRTFDepthCalibrationData *)self;
- (void)setLensDistortionLut:(id)a3;
@end

@implementation VGHRTFDepthCalibrationData

- (NSData)lensDistortionLut
{
  return self->_lensDistortionLut;
}

- (void)setLensDistortionLut:(id)a3
{
}

- (__n128)intrinsicMatrix
{
  return a1[2];
}

- (__n128)setIntrinsicMatrix:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (double)intrinsicMatrixReferenceDimension
{
  return *(double *)(a1 + 16);
}

- (void)setIntrinsicMatrixReferenceDimension:(VGHRTFDepthCalibrationData *)self
{
  *(void *)self->_intrinsicMatrixReferenceDimension = v2;
}

- (double)lensDistortionCenter
{
  return *(double *)(a1 + 24);
}

- (void)setLensDistortionCenter:(VGHRTFDepthCalibrationData *)self
{
  *(void *)self->_lensDistortionCenter = v2;
}

- (void).cxx_destruct
{
}

@end