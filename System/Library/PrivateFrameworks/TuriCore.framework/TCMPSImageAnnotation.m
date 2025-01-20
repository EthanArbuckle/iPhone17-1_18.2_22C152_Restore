@interface TCMPSImageAnnotation
- (CGRect)boundingBox;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)identifier;
- (void)setBoundingBox:(CGRect)a3;
- (void)setConfidence:(double)a3;
- (void)setIdentifier:(int64_t)a3;
@end

@implementation TCMPSImageAnnotation

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  if (v4)
  {
    objc_msgSend(v4, "setIdentifier:", -[TCMPSImageAnnotation identifier](self, "identifier"));
    [(TCMPSImageAnnotation *)self boundingBox];
    objc_msgSend(v4, "setBoundingBox:");
    [(TCMPSImageAnnotation *)self confidence];
    objc_msgSend(v4, "setConfidence:");
  }
  return v4;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
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

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

@end