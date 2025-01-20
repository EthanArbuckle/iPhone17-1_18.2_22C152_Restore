@interface BundleConfiguration
- (Class)dataSourceClassForKey:(id)a3;
- (_TtC29MindRelevanceEngineDataSource19BundleConfiguration)init;
@end

@implementation BundleConfiguration

- (Class)dataSourceClassForKey:(id)a3
{
  uint64_t v4 = sub_DC20();
  uint64_t v6 = v5;
  if (v4 == sub_DC20() && v6 == v7)
  {
    v12 = self;
    swift_bridgeObjectRelease();
  }
  else
  {
    char v9 = sub_DE30();
    v10 = self;
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {

      swift_bridgeObjectRelease();
      return 0;
    }
  }

  swift_bridgeObjectRelease();
  type metadata accessor for SampleDataSource();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC29MindRelevanceEngineDataSource19BundleConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BundleConfiguration();
  return [(BundleConfiguration *)&v3 init];
}

@end