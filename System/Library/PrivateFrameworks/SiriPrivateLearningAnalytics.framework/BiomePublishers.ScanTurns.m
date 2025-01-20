@interface BiomePublishers.ScanTurns
- (_TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns)init;
- (void)subscribe:(id)a3;
@end

@implementation BiomePublishers.ScanTurns

- (void)subscribe:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1D2F89A40();
  swift_unknownObjectRelease();
}

- (_TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns)init
{
  result = (_TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns_upstream));
  v3 = (char *)self + OBJC_IVAR____TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns_turnsStartDateTime;
  uint64_t v4 = sub_1D3001018();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCO28SiriPrivateLearningAnalytics15BiomePublishers9ScanTurns_inner);
}

@end