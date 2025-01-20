@interface SpeakerCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (BOOL)matchesWithDescriptions:(id)a3;
- (NSString)key;
- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)init;
- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)initWithCoder:(id)a3;
- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)initWithStatus:(int64_t)a3 qualityScore:(int64_t)a4;
- (int64_t)qualityScore;
- (int64_t)supportStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation SpeakerCapability

- (NSString)key
{
  sub_1C9DD8CB8();
  v2 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setKey:(id)a3
{
  uint64_t v4 = sub_1C9E0D120();
  uint64_t v6 = v5;
  v7 = self;
  sub_1C9DD8D80(v4, v6);
}

- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)initWithStatus:(int64_t)a3 qualityScore:(int64_t)a4
{
  return (_TtC27SiriVirtualDeviceResolution17SpeakerCapability *)SpeakerCapability.init(status:qualityScore:)(a3, a4);
}

- (int64_t)supportStatus
{
  v2 = self;
  int64_t v3 = sub_1C9DD90FC();

  return v3;
}

- (int64_t)qualityScore
{
  v2 = self;
  int64_t v3 = sub_1C9DD91C8();

  return v3;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  id v3 = sub_1C9DD92C4(a3);
  return v3;
}

+ (id)capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4
{
  id v4 = sub_1C9DD9330();
  return v4;
}

- (BOOL)matchesWithDescriptions:(id)a3
{
  type metadata accessor for CapabilityDescription();
  unint64_t v4 = sub_1C9E0D210();
  uint64_t v5 = self;
  char v6 = sub_1C9DD93AC(v4);

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
  sub_1C9DD946C(v4);
}

- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution17SpeakerCapability *)SpeakerCapability.init(coder:)(a3);
}

- (_TtC27SiriVirtualDeviceResolution17SpeakerCapability)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end