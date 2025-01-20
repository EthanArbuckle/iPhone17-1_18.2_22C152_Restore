@interface ScoringEngine
- (_TtC18NewsScoringService13ScoringEngine)init;
- (void)scoreFeedItems:(id)a3 configurationSet:(int64_t)a4 completion:(id)a5;
- (void)scoreItems:(id)a3 configurationSet:(int64_t)a4 completion:(id)a5;
- (void)scoreNotificationItems:(id)a3 completion:(id)a4;
@end

@implementation ScoringEngine

- (void)scoreItems:(id)a3 configurationSet:(int64_t)a4 completion:(id)a5
{
}

- (void)scoreFeedItems:(id)a3 configurationSet:(int64_t)a4 completion:(id)a5
{
}

- (void)scoreNotificationItems:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_1000084D8(0, &qword_1000169F8);
  unint64_t v6 = sub_10000C210();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  v8 = self;
  sub_1000059A8(v6, (uint64_t)sub_100007508, v7);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC18NewsScoringService13ScoringEngine)init
{
  result = (_TtC18NewsScoringService13ScoringEngine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000056C8((uint64_t)self + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_tabiScoringService);
  sub_1000056C8((uint64_t)self + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_notificationScoringService);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_bundleSubscriptionManager));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18NewsScoringService13ScoringEngine_cooldownQueue);
}

@end