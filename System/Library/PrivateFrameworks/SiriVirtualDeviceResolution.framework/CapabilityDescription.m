@interface CapabilityDescription
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSNumber)valueRangeLowerBound;
- (NSNumber)valueRangeUpperBound;
- (NSSet)valueSet;
- (NSString)capabilityKey;
- (NSString)description;
- (NSString)key;
- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)init;
- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithCoder:(id)a3;
- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithKey:(id)a3 lowerbound:(double)a4 upperbound:(double)a5;
- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithKey:(id)a3 valueSet:(id)a4;
- (id)copyWithZone:(void *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CapabilityDescription

- (NSString)key
{
  CapabilityDescription.key.getter();
  v2 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSSet)valueSet
{
  if (CapabilityDescription.valueSet.getter())
  {
    sub_1C9DD7D6C(0, (unint64_t *)&qword_1EA5C6E30);
    sub_1C9DEC214();
    v2 = (void *)sub_1C9E0D2B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (NSString)capabilityKey
{
  v2 = self;
  CapabilityDescription.capabilityKey.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C9E0D110();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSNumber)valueRangeLowerBound
{
  v2 = self;
  id v3 = CapabilityDescription.valueRangeLowerBound.getter();

  return (NSNumber *)v3;
}

- (NSNumber)valueRangeUpperBound
{
  v2 = self;
  id v3 = CapabilityDescription.valueRangeUpperBound.getter();

  return (NSNumber *)v3;
}

- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithKey:(id)a3 valueSet:(id)a4
{
  return (_TtC27SiriVirtualDeviceResolution21CapabilityDescription *)CapabilityDescription.init(key:valueSet:)();
}

- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithKey:(id)a3 lowerbound:(double)a4 upperbound:(double)a5
{
  v7 = (void *)sub_1C9E0D120();
  return (_TtC27SiriVirtualDeviceResolution21CapabilityDescription *)CapabilityDescription.init(key:lowerbound:upperbound:)(v7, v8, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return static CapabilityDescription.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CapabilityDescription.encode(with:)((NSCoder)v4);
}

- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)initWithCoder:(id)a3
{
  CapabilityDescription.init(coder:)(a3);
  return result;
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  CapabilityDescription.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  id v4 = (void *)sub_1C9E0D7E0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  v2 = self;
  CapabilityDescription.description.getter();

  id v3 = (void *)sub_1C9E0D110();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC27SiriVirtualDeviceResolution21CapabilityDescription)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end