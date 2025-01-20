@interface SVDBooleanCapabilityPrimitive
+ (BOOL)supportsSecureCoding;
- (SVDBooleanCapabilityPrimitive)init;
- (SVDBooleanCapabilityPrimitive)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDBooleanCapabilityPrimitive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C9DE3D44(v4);
}

- (SVDBooleanCapabilityPrimitive)initWithCoder:(id)a3
{
  return (SVDBooleanCapabilityPrimitive *)sub_1C9DE3E14(a3);
}

- (SVDBooleanCapabilityPrimitive)init
{
}

@end