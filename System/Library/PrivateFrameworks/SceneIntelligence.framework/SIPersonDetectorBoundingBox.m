@interface SIPersonDetectorBoundingBox
- (CGRect)boundingBox;
- (SIPersonDetectorBoundingBox)initWithBoundingBox:(CGRect)a3 confidence:(float)a4;
- (float)confidence;
- (void)setBoundingBox:(CGRect)a3;
- (void)setConfidence:(float)a3;
@end

@implementation SIPersonDetectorBoundingBox

- (SIPersonDetectorBoundingBox)initWithBoundingBox:(CGRect)a3 confidence:(float)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)SIPersonDetectorBoundingBox;
  v9 = [(SIPersonDetectorBoundingBox *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_boundingBox.origin.CGFloat x = x;
    v9->_boundingBox.origin.CGFloat y = y;
    v9->_boundingBox.size.CGFloat width = width;
    v9->_boundingBox.size.CGFloat height = height;
    v9->_confidence = a4;
    v11 = v9;
  }

  return v10;
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

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

@end