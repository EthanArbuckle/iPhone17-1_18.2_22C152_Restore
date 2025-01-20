@interface DataSource
+ (BOOL)wantsReloadForSignificantTimeChange;
+ (NSString)bundleIdentifier;
+ (unint64_t)elementContentMode;
- (NSArray)supportedSections;
- (_TtC29MindRelevanceEngineDataSource10DataSource)init;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
- (void)pause;
- (void)resume;
@end

@implementation DataSource

+ (unint64_t)elementContentMode
{
  return 0;
}

+ (NSString)bundleIdentifier
{
  sub_D27C();
  swift_bridgeObjectRetain();
  NSString v2 = sub_DC10();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSArray)supportedSections
{
  sub_5FF0(&qword_14C30);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_EA30;
  *(void *)(v2 + 32) = sub_DC20();
  *(void *)(v2 + 40) = v3;
  v4.super.isa = sub_DC90().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

+ (BOOL)wantsReloadForSignificantTimeChange
{
  return 1;
}

- (_TtC29MindRelevanceEngineDataSource10DataSource)init
{
  return (_TtC29MindRelevanceEngineDataSource10DataSource *)sub_69DC();
}

- (void)pause
{
  uint64_t v2 = self;
  sub_762C("Mindfulness pause requested.", (uint64_t)&unk_10818, (uint64_t)sub_BF2C, (uint64_t)&unk_10830);
}

- (void)resume
{
  uint64_t v2 = self;
  sub_762C("Mindfulness resume requested.", (uint64_t)&unk_10868, (uint64_t)sub_BFA0, (uint64_t)&unk_10880);
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_DC20();
  unint64_t v8 = v7;
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
  sub_7A88(v6, v8, (uint64_t)v5, v9);
  sub_5D70((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  uint64_t v3 = &self->REElementDataSource_opaque[OBJC_IVAR____TtC29MindRelevanceEngineDataSource10DataSource_mostRecentSessionEndDate];

  sub_6034((uint64_t)v3);
}

@end