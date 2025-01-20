@interface VGHRTFCaptureData
- (IOSurface)colorBuffer;
- (IOSurface)depthBuffer;
- (VGHRTFDepthCalibrationData)depthCalibrationData;
- (__n128)colorIntrinsics;
- (__n128)setColorIntrinsics:(__n128)a3;
- (double)timestamp;
- (void)setColorBuffer:(id)a3;
- (void)setDepthBuffer:(id)a3;
- (void)setDepthCalibrationData:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation VGHRTFCaptureData

- (IOSurface)colorBuffer
{
  return self->_colorBuffer;
}

- (void)setColorBuffer:(id)a3
{
}

- (__n128)colorIntrinsics
{
  return a1[3];
}

- (__n128)setColorIntrinsics:(__n128)a3
{
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

- (IOSurface)depthBuffer
{
  return self->_depthBuffer;
}

- (void)setDepthBuffer:(id)a3
{
}

- (VGHRTFDepthCalibrationData)depthCalibrationData
{
  return self->_depthCalibrationData;
}

- (void)setDepthCalibrationData:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthCalibrationData, 0);
  objc_storeStrong((id *)&self->_depthBuffer, 0);

  objc_storeStrong((id *)&self->_colorBuffer, 0);
}

@end