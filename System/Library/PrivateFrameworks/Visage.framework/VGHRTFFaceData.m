@interface VGHRTFFaceData
- (CGRect)boundingBox;
- (NSNumber)rollAngle;
- (NSNumber)yawAngle;
- (int64_t)trackedId;
- (void)setBoundingBox:(CGRect)a3;
- (void)setRollAngle:(id)a3;
- (void)setTrackedId:(int64_t)a3;
- (void)setYawAngle:(id)a3;
@end

@implementation VGHRTFFaceData

- (int64_t)trackedId
{
  return self->_trackedId;
}

- (void)setTrackedId:(int64_t)a3
{
  self->_trackedId = a3;
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

- (NSNumber)rollAngle
{
  return self->_rollAngle;
}

- (void)setRollAngle:(id)a3
{
}

- (NSNumber)yawAngle
{
  return self->_yawAngle;
}

- (void)setYawAngle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yawAngle, 0);

  objc_storeStrong((id *)&self->_rollAngle, 0);
}

@end