@interface VGHumanBBox
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)bbox;
- (VGHumanBBox)initWithBBox:(CGRect)a3 confidence:(double)a4;
- (VGHumanBBox)initWithCoder:(id)a3;
- (double)confidence;
- (void)encodeWithCoder:(id)a3;
- (void)setBbox:(CGRect)a3;
- (void)setConfidence:(double)a3;
@end

@implementation VGHumanBBox

- (VGHumanBBox)initWithBBox:(CGRect)a3 confidence:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)VGHumanBBox;
  result = [(VGHumanBBox *)&v10 init];
  if (result)
  {
    result->_bbox.origin.CGFloat y = y;
    result->_bbox.size.CGFloat width = width;
    result->_bbox.size.CGFloat height = height;
    result->_confidence = a4;
    result->_bbox.origin.CGFloat x = x;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [(VGHumanBBox *)self bbox];
  objc_msgSend(v7, "encodeDouble:forKey:", @"bboxOriginX");
  [(VGHumanBBox *)self bbox];
  [v7 encodeDouble:@"bboxOriginY" forKey:v4];
  [(VGHumanBBox *)self bbox];
  [v7 encodeDouble:@"bboxSizeH" forKey:v5];
  [(VGHumanBBox *)self bbox];
  [v7 encodeDouble:@"bboxSizeW" forKey:v6];
  [(VGHumanBBox *)self confidence];
  objc_msgSend(v7, "encodeDouble:forKey:", @"confidence");
}

- (VGHumanBBox)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"bboxOriginX"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"bboxOriginY"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"bboxSizeH"];
  double v10 = v9;
  [v4 decodeDoubleForKey:@"bboxSizeW"];
  double v12 = v11;
  [v4 decodeDoubleForKey:@"confidence"];
  double v14 = v13;

  return -[VGHumanBBox initWithBBox:confidence:](self, "initWithBBox:confidence:", v6, v8, v12, v10, v14);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 bbox];
    v14.origin.CGFloat x = v6;
    v14.origin.CGFloat y = v7;
    v14.size.CGFloat width = v8;
    v14.size.CGFloat height = v9;
    if (CGRectEqualToRect(self->_bbox, v14))
    {
      double confidence = self->_confidence;
      [v5 confidence];
      BOOL v12 = confidence == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (CGRect)bbox
{
  double x = self->_bbox.origin.x;
  double y = self->_bbox.origin.y;
  double width = self->_bbox.size.width;
  double height = self->_bbox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBbox:(CGRect)a3
{
  self->_bbodouble x = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_double confidence = a3;
}

@end