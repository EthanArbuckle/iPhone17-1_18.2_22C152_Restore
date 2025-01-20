@interface ProfileSwitchingCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (BOOL)matchesWithDescriptions:(id)a3;
- (NSString)key;
- (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability)init;
- (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability)initWithCoder:(id)a3;
- (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability)initWithStatus:(int64_t)a3;
- (int64_t)supportsProfileSwitching;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation ProfileSwitchingCapability

- (NSString)key
{
  sub_1C9DDA3E8();
  v2 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setKey:(id)a3
{
  uint64_t v4 = sub_1C9E0D120();
  uint64_t v6 = v5;
  v7 = self;
  sub_1C9DDA4B0(v4, v6);
}

- (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability)initWithStatus:(int64_t)a3
{
  return (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability *)ProfileSwitchingCapability.init(status:)(a3);
}

- (int64_t)supportsProfileSwitching
{
  v2 = self;
  int64_t v3 = sub_1C9DDA7CC();

  return v3;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  id v3 = sub_1C9DDA864(a3);
  return v3;
}

- (BOOL)matchesWithDescriptions:(id)a3
{
  type metadata accessor for CapabilityDescription();
  unint64_t v4 = sub_1C9E0D210();
  uint64_t v5 = self;
  char v6 = sub_1C9DDA8D0(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C9DDA990(v4);
}

- (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability *)ProfileSwitchingCapability.init(coder:)(a3);
}

- (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end