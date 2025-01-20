@interface AssistantEnabledCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (BOOL)matchesWithDescriptions:(id)a3;
- (NSString)key;
- (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability)init;
- (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability)initWithCoder:(id)a3;
- (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability)initWithStatus:(int64_t)a3;
- (int64_t)supportsAssistantEnabled;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation AssistantEnabledCapability

- (NSString)key
{
  sub_1C9E03320();
  v2 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setKey:(id)a3
{
  uint64_t v4 = sub_1C9E0D120();
  uint64_t v6 = v5;
  v7 = self;
  sub_1C9E033E8(v4, v6);
}

- (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability)initWithStatus:(int64_t)a3
{
  return (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability *)AssistantEnabledCapability.init(status:)(a3);
}

- (int64_t)supportsAssistantEnabled
{
  v2 = self;
  int64_t v3 = sub_1C9E036D0();

  return v3;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  id v3 = sub_1C9E03768(a3);
  return v3;
}

- (BOOL)matchesWithDescriptions:(id)a3
{
  type metadata accessor for CapabilityDescription();
  unint64_t v4 = sub_1C9E0D210();
  uint64_t v5 = self;
  char v6 = sub_1C9E037D4(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability *)AssistantEnabledCapability.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C9E039C8(v4);
}

- (_TtC27SiriVirtualDeviceResolution26AssistantEnabledCapability)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end