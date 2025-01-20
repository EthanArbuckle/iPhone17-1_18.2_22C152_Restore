@interface VKLabelExclusionRegion
+ (BOOL)supportsSecureCoding;
- (CGRect)rect;
- (VKLabelExclusionRegion)initWithCoder:(id)a3;
- (VKLabelExclusionRegion)initWithRect:(CGRect)a3;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VKLabelExclusionRegion

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unsigned)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v9 = a3;
  [v9 encodeInt32:type forKey:@"type"];
  CGFloat x = self->_rect.origin.x;
  *(float *)&CGFloat x = x;
  [v9 encodeFloat:@"rect.origin.x" forKey:x];
  CGFloat y = self->_rect.origin.y;
  *(float *)&CGFloat y = y;
  [v9 encodeFloat:@"rect.origin.y" forKey:y];
  CGFloat width = self->_rect.size.width;
  *(float *)&CGFloat width = width;
  [v9 encodeFloat:@"rect.size.width" forKey:width];
  CGFloat height = self->_rect.size.height;
  *(float *)&CGFloat height = height;
  [v9 encodeFloat:@"rect.size.height" forKey:height];
}

- (VKLabelExclusionRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VKLabelExclusionRegion;
  v5 = [(VKLabelExclusionRegion *)&v11 init];
  if (v5)
  {
    v5->_uint64_t type = [v4 decodeInt32ForKey:@"type"];
    [v4 decodeFloatForKey:@"rect.origin.x"];
    v5->_rect.origin.CGFloat x = v6;
    [v4 decodeFloatForKey:@"rect.origin.y"];
    v5->_rect.origin.CGFloat y = v7;
    [v4 decodeFloatForKey:@"rect.size.width"];
    v5->_rect.size.CGFloat width = v8;
    [v4 decodeFloatForKey:@"rect.size.height"];
    v5->_rect.size.CGFloat height = v9;
  }

  return v5;
}

- (VKLabelExclusionRegion)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)VKLabelExclusionRegion;
  CGRect result = [(VKLabelExclusionRegion *)&v8 init];
  if (result)
  {
    result->_uint64_t type = 0;
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end