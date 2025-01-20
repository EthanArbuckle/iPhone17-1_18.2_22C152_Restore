@interface ContinuousNumericCapabilityPrimitive
+ (BOOL)supportsSecureCoding;
- (_TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive)init;
- (_TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContinuousNumericCapabilityPrimitive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C9DE4064(v4);
}

- (_TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive *)sub_1C9DE413C(a3);
}

- (_TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive)init
{
}

@end