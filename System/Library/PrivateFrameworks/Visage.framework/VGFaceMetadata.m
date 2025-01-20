@interface VGFaceMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGRect)bounds;
- (VGFaceMetadata)initWithCoder:(id)a3;
- (VGFaceMetadata)initWithFaceId:(int64_t)a3 bounds:(CGRect)a4 yawAngle:(double)a5 rollAngle:(double)a6;
- (double)rollAngle;
- (double)yawAngle;
- (int64_t)faceID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VGFaceMetadata

- (VGFaceMetadata)initWithFaceId:(int64_t)a3 bounds:(CGRect)a4 yawAngle:(double)a5 rollAngle:(double)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)VGFaceMetadata;
  result = [(VGFaceMetadata *)&v14 init];
  if (result)
  {
    result->_bounds.origin.CGFloat x = x;
    result->_bounds.origin.CGFloat y = y;
    result->_bounds.size.CGFloat width = width;
    result->_bounds.size.CGFloat height = height;
    result->_faceID = a3;
    result->_rollAngle = a6;
    result->_yawAngle = a5;
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
  objc_msgSend(v7, "encodeInt64:forKey:", -[VGFaceMetadata faceID](self, "faceID"), @"faceID");
  [(VGFaceMetadata *)self bounds];
  objc_msgSend(v7, "encodeDouble:forKey:", @"boundsOriginX");
  [(VGFaceMetadata *)self bounds];
  [v7 encodeDouble:@"boundsOriginY" forKey:v4];
  [(VGFaceMetadata *)self bounds];
  [v7 encodeDouble:@"boundsSizeH" forKey:v5];
  [(VGFaceMetadata *)self bounds];
  [v7 encodeDouble:@"boundsSizeW" forKey:v6];
  [(VGFaceMetadata *)self rollAngle];
  objc_msgSend(v7, "encodeDouble:forKey:", @"rollAngle");
  [(VGFaceMetadata *)self yawAngle];
  objc_msgSend(v7, "encodeDouble:forKey:", @"yawAngle");
}

- (VGFaceMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (int)[v4 decodeIntForKey:@"faceID"];
  [v4 decodeDoubleForKey:@"boundsOriginX"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"boundsOriginY"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"boundsSizeH"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"boundsSizeW"];
  double v13 = v12;
  [v4 decodeDoubleForKey:@"rollAngle"];
  double v15 = v14;
  [v4 decodeDoubleForKey:@"yawAngle"];
  double v17 = v16;

  return -[VGFaceMetadata initWithFaceId:bounds:yawAngle:rollAngle:](self, "initWithFaceId:bounds:yawAngle:rollAngle:", v5, v7, v9, v13, v11, v17, v15);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t faceID = self->_faceID;
    if (faceID == [v5 faceID]
      && ([v5 bounds],
          v17.origin.CGFloat x = v7,
          v17.origin.CGFloat y = v8,
          v17.size.CGFloat width = v9,
          v17.size.CGFloat height = v10,
          CGRectEqualToRect(self->_bounds, v17))
      && (double yawAngle = self->_yawAngle, [v5 yawAngle], yawAngle == v12))
    {
      double rollAngle = self->_rollAngle;
      [v5 rollAngle];
      BOOL v15 = rollAngle == v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)faceID
{
  return self->_faceID;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

@end