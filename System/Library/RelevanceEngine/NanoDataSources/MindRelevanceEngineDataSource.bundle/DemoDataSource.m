@interface DemoDataSource
- (_TtC29MindRelevanceEngineDataSource14DemoDataSource)init;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation DemoDataSource

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_DC20();
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v5;
    v5 = sub_5FE8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  sub_5698(v6, v8, (uint64_t)v5, v9);
  sub_5D70((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (_TtC29MindRelevanceEngineDataSource14DemoDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DemoDataSource();
  return [(SampleDataSource *)&v3 init];
}

@end