@interface GKMetricsPipeline
- (_TtC14GameDaemonCore17GKMetricsPipeline)init;
- (_TtC14GameDaemonCore17GKMetricsPipeline)initWithBag:(id)a3;
- (void)processEventWithTopic:(NSString *)a3 shouldFlush:(BOOL)a4 metricsFields:(NSDictionary *)a5 hostAppBundleId:(NSString *)a6 completionHandler:(id)a7;
- (void)processMultiplayerActivityEventWithMetricsFields:(NSDictionary *)a3 hostAppBundleId:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation GKMetricsPipeline

- (_TtC14GameDaemonCore17GKMetricsPipeline)initWithBag:(id)a3
{
  return (_TtC14GameDaemonCore17GKMetricsPipeline *)GKMetricsPipeline.init(bag:)();
}

- (void)processEventWithTopic:(NSString *)a3 shouldFlush:(BOOL)a4 metricsFields:(NSDictionary *)a5 hostAppBundleId:(NSString *)a6 completionHandler:(id)a7
{
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = a5;
  *(void *)(v13 + 40) = a6;
  *(void *)(v13 + 48) = v12;
  *(void *)(v13 + 56) = self;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = self;

  sub_10000D83C((uint64_t)&unk_100327F38, v13);
}

- (void)processMultiplayerActivityEventWithMetricsFields:(NSDictionary *)a3 hostAppBundleId:(NSString *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;

  sub_10000D83C((uint64_t)&unk_100327F28, (uint64_t)v9);
}

- (_TtC14GameDaemonCore17GKMetricsPipeline)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14GameDaemonCore17GKMetricsPipeline_bag;
  uint64_t v4 = type metadata accessor for Bag();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC14GameDaemonCore17GKMetricsPipeline____lazy_storage___metricsPipeline;

  sub_1001C87FC((uint64_t)v5);
}

@end