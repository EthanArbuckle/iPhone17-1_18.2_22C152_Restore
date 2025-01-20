@interface VGHRTFFaceCaptureProcessedData
- (IOSurface)rectifiedColorBuffer;
- (IOSurface)rectifiedDepthBuffer;
- (NSNumber)pitchAngle;
- (NSNumber)yawAngle;
- (id)initEmpty;
- (void)setPitchAngle:(id)a3;
- (void)setRectifiedColorBuffer:(id)a3;
- (void)setRectifiedDepthBuffer:(id)a3;
- (void)setYawAngle:(id)a3;
@end

@implementation VGHRTFFaceCaptureProcessedData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFFaceCaptureProcessedData;
  v2 = [(VGHRTFFaceCaptureProcessedData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (IOSurface)rectifiedColorBuffer
{
  return self->_rectifiedColorBuffer;
}

- (void)setRectifiedColorBuffer:(id)a3
{
}

- (IOSurface)rectifiedDepthBuffer
{
  return self->_rectifiedDepthBuffer;
}

- (void)setRectifiedDepthBuffer:(id)a3
{
}

- (NSNumber)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(id)a3
{
}

- (NSNumber)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pitchAngle, 0);
  objc_storeStrong((id *)&self->_yawAngle, 0);
  objc_storeStrong((id *)&self->_rectifiedDepthBuffer, 0);

  objc_storeStrong((id *)&self->_rectifiedColorBuffer, 0);
}

@end