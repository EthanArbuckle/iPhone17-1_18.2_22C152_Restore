@interface SRStreamBlock
- (NSDictionary)dictionary;
- (_TtC16SensorKitSupport13SRStreamBlock)init;
- (_TtC16SensorKitSupport13SRStreamBlock)initWithBinaryRep:(id)a3;
@end

@implementation SRStreamBlock

- (_TtC16SensorKitSupport13SRStreamBlock)initWithBinaryRep:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_228E9EEE0();
  unint64_t v6 = v5;

  return (_TtC16SensorKitSupport13SRStreamBlock *)SRStreamBlock.init(binaryRep:)(v4, v6);
}

- (NSDictionary)dictionary
{
  v2 = self;
  sub_228E8F234();
  id v3 = (void *)sub_228E9F140();

  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (_TtC16SensorKitSupport13SRStreamBlock)init
{
  result = (_TtC16SensorKitSupport13SRStreamBlock *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end