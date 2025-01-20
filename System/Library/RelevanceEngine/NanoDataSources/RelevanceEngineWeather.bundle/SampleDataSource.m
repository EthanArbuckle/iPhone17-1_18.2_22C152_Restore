@interface SampleDataSource
+ (NSString)applicationBundleIdentifier;
+ (NSString)bundleIdentifier;
- (NSArray)supportedSections;
- (_TtC22RelevanceEngineWeather16SampleDataSource)init;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation SampleDataSource

+ (NSString)applicationBundleIdentifier
{
  return (NSString *)sub_22F105520();
}

+ (NSString)bundleIdentifier
{
  return (NSString *)sub_22F105520();
}

- (NSArray)supportedSections
{
  sub_22F104BB8(&qword_268694108);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22F10CC50;
  *(void *)(v2 + 32) = sub_22F10BEC0();
  *(void *)(v2 + 40) = v3;
  v4 = (void *)sub_22F10BF30();
  swift_bridgeObjectRelease();

  return (NSArray *)v4;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  v7 = v6;
  if (a3)
  {
    uint64_t v8 = sub_22F10BEC0();
    a3 = v9;
    if (v7)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v7;
      v7 = sub_22F105E1C;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  v11 = self;
  sub_22F105764(v8, (unint64_t)a3, v7, v10);
  sub_22F105DD4((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (_TtC22RelevanceEngineWeather16SampleDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SampleDataSource();
  return [(REElementDataSource *)&v3 init];
}

@end