@interface VIReducePersonOverTriggerRegionalAnnotation
- (BOOL)isEqual:(id)a3;
- (CGRect)boundingBox;
- (NSString)label;
- (VIReducePersonOverTriggerRegionalAnnotation)initWithLabel:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 faceCount:(int)a6;
- (float)confidence;
- (int)faceCount;
@end

@implementation VIReducePersonOverTriggerRegionalAnnotation

- (VIReducePersonOverTriggerRegionalAnnotation)initWithLabel:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 faceCount:(int)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VIReducePersonOverTriggerRegionalAnnotation;
  v15 = [(VIReducePersonOverTriggerRegionalAnnotation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_label, a3);
    v16->_boundingBox.origin.CGFloat x = x;
    v16->_boundingBox.origin.CGFloat y = y;
    v16->_boundingBox.size.CGFloat width = width;
    v16->_boundingBox.size.CGFloat height = height;
    v16->_confidence = a5;
    v16->_faceCount = a6;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VIReducePersonOverTriggerRegionalAnnotation *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    [(VIReducePersonOverTriggerRegionalAnnotation *)v6 boundingBox];
    v18.origin.CGFloat x = v7;
    v18.origin.CGFloat y = v8;
    v18.size.CGFloat width = v9;
    v18.size.CGFloat height = v10;
    if (CGRectEqualToRect(self->_boundingBox, v18))
    {
      label = self->_label;
      v12 = [(VIReducePersonOverTriggerRegionalAnnotation *)v6 label];
      if (label == v12
        && (float confidence = self->_confidence,
            [(VIReducePersonOverTriggerRegionalAnnotation *)v6 confidence],
            confidence == v15))
      {
        int faceCount = self->_faceCount;
        BOOL v13 = faceCount == [(VIReducePersonOverTriggerRegionalAnnotation *)v6 faceCount];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  return v13;
}

- (NSString)label
{
  return self->_label;
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

- (float)confidence
{
  return self->_confidence;
}

- (int)faceCount
{
  return self->_faceCount;
}

- (void).cxx_destruct
{
}

@end