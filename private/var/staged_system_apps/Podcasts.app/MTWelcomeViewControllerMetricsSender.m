@interface MTWelcomeViewControllerMetricsSender
- (MTWelcomeViewControllerMetricsSender)init;
- (void)welcomeControllerDidAppear;
- (void)welcomeControllerDidDisappear;
- (void)welcomeControllerWillDisappear;
@end

@implementation MTWelcomeViewControllerMetricsSender

- (void).cxx_destruct
{
}

- (void)welcomeControllerDidAppear
{
  v2 = self;
  sub_1003BBB40();
}

- (void)welcomeControllerWillDisappear
{
  v2 = self;
  swift_retain();
  MetricsController.observe(lifecycleEvent:)();

  swift_release();
}

- (void)welcomeControllerDidDisappear
{
  sub_100054B78(&qword_100607D98);
  __chkstk_darwin();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = self;
  swift_retain();
  MetricsController.observe(lifecycleEvent:)();
  swift_release();
  uint64_t v6 = type metadata accessor for PageMetrics();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v4, 1, 1, v6);
  swift_retain();
  MetricsController.pageMetrics.setter();

  swift_release();
}

- (MTWelcomeViewControllerMetricsSender)init
{
  result = (MTWelcomeViewControllerMetricsSender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end