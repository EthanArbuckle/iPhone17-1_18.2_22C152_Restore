@interface DeviceCapability
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9SEService16DeviceCapability)init;
- (_TtC9SEService16DeviceCapability)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DeviceCapability

+ (BOOL)supportsSecureCoding
{
  return byte_26781CFC0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26781CFC0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC9SEService16DeviceCapability_supportsUWB);
  id v5 = a3;
  v6 = self;
  id v7 = (id)sub_2147ACF38();
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);
}

- (_TtC9SEService16DeviceCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = (void *)sub_2147ACF38();
  unsigned __int8 v7 = objc_msgSend(v4, sel_decodeBoolForKey_, v6);

  *((unsigned char *)&v5->super.isa + OBJC_IVAR____TtC9SEService16DeviceCapability_supportsUWB) = v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for DeviceCapability();
  v8 = [(DeviceCapability *)&v10 init];

  return v8;
}

- (_TtC9SEService16DeviceCapability)init
{
  result = (_TtC9SEService16DeviceCapability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end