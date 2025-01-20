@interface VUIMetricsJetEngine
+ (VUIMetricsJetEngine)sharedInstance;
+ (id)convertClickDataToImpressionsData:(id)a3 index:(int64_t)a4 ignoreHosted:(BOOL)a5;
+ (id)convertClickDataToLocationData:(id)a3 index:(int64_t)a4;
- (BOOL)isSharedContent:(id)a3;
- (NSObject)wrappedPipeline;
- (VUIMetricsJetEngine)init;
- (id)recordEventWithTopic:(id)a3 eventType:(id)a4 eventData:(id)a5 pageData:(id)a6;
- (void)flushMetrics;
- (void)flushMetricsWithCompletion:(id)a3;
- (void)setMonitorsLifecycleEvents:(BOOL)a3;
- (void)setWrappedPipeline:(id)a3;
@end

@implementation VUIMetricsJetEngine

+ (VUIMetricsJetEngine)sharedInstance
{
  id v2 = static MetricsJetEngine.shared.getter();
  return (VUIMetricsJetEngine *)v2;
}

- (VUIMetricsJetEngine)init
{
  sub_1E2C6E6F4();
  return result;
}

- (id)recordEventWithTopic:(id)a3 eventType:(id)a4 eventData:(id)a5 pageData:(id)a6
{
  sub_1E387C928();
  sub_1E387C928();
  sub_1E387C678();
  sub_1E387C678();
  v6 = self;
  MetricsJetEngine.recordEvent(topic:eventType:eventData:pageData:)();
  v8 = v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

- (NSObject)wrappedPipeline
{
  id v2 = MetricsJetEngine.wrappedPipeline.getter();
  return v2;
}

- (void)setWrappedPipeline:(id)a3
{
  id v4 = a3;
  v5 = self;
  MetricsJetEngine.wrappedPipeline.setter(v4);
}

- (void)flushMetrics
{
  id v2 = self;
  MetricsJetEngine.flushMetrics()();
}

- (BOOL)isSharedContent:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1E387C928();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  Swift::Bool v9 = MetricsJetEngine.isSharedContent(_:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)flushMetricsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  MetricsJetEngine.flushMetricsWithCompletion(_:)((uint64_t)sub_1E3070BA0, v5);

  swift_release();
}

- (void)setMonitorsLifecycleEvents:(BOOL)a3
{
  uint64_t v4 = self;
  MetricsJetEngine.setMonitorsLifecycleEvents(_:)(a3);
}

+ (id)convertClickDataToLocationData:(id)a3 index:(int64_t)a4
{
  sub_1E387C678();
  static MetricsJetEngine.convertClickDataToLocationData(_:index:)();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)sub_1E387C668();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)convertClickDataToImpressionsData:(id)a3 index:(int64_t)a4 ignoreHosted:(BOOL)a5
{
  sub_1E387C678();
  static MetricsJetEngine.convertClickDataToImpressionsData(_:index:ignoreHosted:)();
  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_1E387C668();
  swift_bridgeObjectRelease();
  return v5;
}

- (void).cxx_destruct
{
  sub_1E387B348();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_47();
  v3();
  swift_release();
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUIMetricsJetEngine_wrappedPipeline);
}

@end