@interface AnalyticsEventReporter
- (_TtC12NewsArticles22AnalyticsEventReporter)init;
- (void)reportEvent:(id)a3;
@end

@implementation AnalyticsEventReporter

- (_TtC12NewsArticles22AnalyticsEventReporter)init
{
  result = (_TtC12NewsArticles22AnalyticsEventReporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AnalyticsEventReporter_transformerManager);
  sub_1BF51891C((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AnalyticsEventReporter_articleCoordinator);
  swift_release();
}

- (void)reportEvent:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1BF6CB7C8();
  swift_unknownObjectRelease();
}

@end