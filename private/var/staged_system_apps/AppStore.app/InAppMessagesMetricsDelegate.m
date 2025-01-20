@interface InAppMessagesMetricsDelegate
- (_TtC8AppStore28InAppMessagesMetricsDelegate)init;
- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4;
@end

@implementation InAppMessagesMetricsDelegate

- (void)messageDidReportMetricsEvent:(id)a3 eventProperties:(id)a4
{
  uint64_t v20 = type metadata accessor for MetricsFieldsContext();
  uint64_t v6 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for MetricsPipeline();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for MetricsData();
  uint64_t v13 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v18 = a3;
  v16 = self;
  swift_bridgeObjectRetain();
  MetricsData.init(fields:includingFields:excludingFields:shouldFlush:)();
  v17 = (char *)v16 + OBJC_IVAR____TtC8AppStore28InAppMessagesMetricsDelegate_metricsPipeline;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v17, v9);
  static MetricsFieldsContext.emptyContext.getter();
  MetricsPipeline.process(_:using:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v20);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v19);

  swift_bridgeObjectRelease();
}

- (_TtC8AppStore28InAppMessagesMetricsDelegate)init
{
  result = (_TtC8AppStore28InAppMessagesMetricsDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8AppStore28InAppMessagesMetricsDelegate_metricsPipeline;
  uint64_t v3 = type metadata accessor for MetricsPipeline();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end