@interface VGHRTFEarCaptureDetectionData
- (CGRect)boundingBox;
- (NSArray)landmarkPoints;
- (double)pitchAngle;
- (double)yawAngle;
- (id)initEmpty;
- (unint64_t)earSide;
- (void)setBoundingBox:(CGRect)a3;
- (void)setEarSide:(unint64_t)a3;
- (void)setLandmarkPoints:(id)a3;
- (void)setPitchAngle:(double)a3;
- (void)setYawAngle:(double)a3;
@end

@implementation VGHRTFEarCaptureDetectionData

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)VGHRTFEarCaptureDetectionData;
  v2 = [(VGHRTFEarCaptureDetectionData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (unint64_t)earSide
{
  return self->_earSide;
}

- (void)setEarSide:(unint64_t)a3
{
  self->_earSide = a3;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(double)a3
{
  self->_yawAngle = a3;
}

- (double)pitchAngle
{
  return self->_pitchAngle;
}

- (void)setPitchAngle:(double)a3
{
  self->_pitchAngle = a3;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

- (NSArray)landmarkPoints
{
  return self->_landmarkPoints;
}

- (void)setLandmarkPoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end