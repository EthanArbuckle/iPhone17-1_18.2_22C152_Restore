@interface DataSource
+ (BOOL)wantsLocationInUseAsserton;
+ (NSString)applicationBundleIdentifier;
+ (NSString)bundleIdentifier;
- (NSArray)supportedSections;
- (_TtC22RelevanceEngineWeather10DataSource)init;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
- (void)pause;
- (void)resume;
@end

@implementation DataSource

+ (NSString)applicationBundleIdentifier
{
  return (NSString *)sub_22F105520();
}

+ (NSString)bundleIdentifier
{
  return (NSString *)sub_22F105520();
}

+ (BOOL)wantsLocationInUseAsserton
{
  return 1;
}

- (NSArray)supportedSections
{
  sub_22F104BB8(&qword_268694108);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22F10CCC0;
  *(void *)(v2 + 32) = sub_22F10BEC0();
  *(void *)(v2 + 40) = v3;
  *(void *)(v2 + 48) = sub_22F10BEC0();
  *(void *)(v2 + 56) = v4;
  *(void *)(v2 + 64) = sub_22F10BEC0();
  *(void *)(v2 + 72) = v5;
  v6 = (void *)sub_22F10BF30();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  v7 = v6;
  if (a3)
  {
    uint64_t v8 = sub_22F10BEC0();
    a3 = v9;
    if (!v7) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  if (v6)
  {
LABEL_3:
    *(void *)(swift_allocObject() + 16) = v7;
    v7 = (void (*)(void))sub_22F105E1C;
  }
LABEL_5:
  v10 = self;
  sub_22F108450(v8, (uint64_t)a3, v7);
  sub_22F105DD4((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)pause
{
}

- (void)resume
{
}

- (_TtC22RelevanceEngineWeather10DataSource)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___model) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___dateFormatter) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___invalidationScheduler) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___morningRoutineRelevanceProvider) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DataSource();
  return [(REElementDataSource *)&v3 init];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___invalidationScheduler));
  objc_super v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC22RelevanceEngineWeather10DataSource____lazy_storage___morningRoutineRelevanceProvider);
}

@end