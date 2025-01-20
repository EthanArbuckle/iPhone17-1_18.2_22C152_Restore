@interface BundleConfiguration
- (Class)dataSourceClassForKey:(id)a3;
- (_TtC22RelevanceEngineWeather19BundleConfiguration)init;
@end

@implementation BundleConfiguration

- (Class)dataSourceClassForKey:(id)a3
{
  uint64_t v4 = sub_22F10BEC0();
  unint64_t v6 = v5;
  v7 = self;
  uint64_t v8 = sub_22F109C60(v4, v6);

  swift_bridgeObjectRelease();
  if (!v8) {
    return 0;
  }

  return (Class)MEMORY[0x270FA03D0](v8);
}

- (_TtC22RelevanceEngineWeather19BundleConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BundleConfiguration();
  return [(BundleConfiguration *)&v3 init];
}

@end