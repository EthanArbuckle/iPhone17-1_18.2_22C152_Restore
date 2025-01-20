@interface IISMetricStore
+ (IISMetricStore)sharedInstance;
- (BOOL)sendMessagesWithShouldContinue:(id)a3;
- (BOOL)shouldSendMessages;
- (IISMetricStore)init;
- (id)saveMessage:(id)a3 backend:(unsigned __int8)a4 messageIdentifier:(id)a5;
- (void)registerEnrichmentProvider:(id)a3;
- (void)registerMessageListener:(id)a3;
- (void)removeAllMetricsWithPrefix:(id)a3;
@end

@implementation IISMetricStore

+ (IISMetricStore)sharedInstance
{
  id v2 = static MetricStore.sharedInstance.getter();
  return (IISMetricStore *)v2;
}

- (IISMetricStore)init
{
  return (IISMetricStore *)sub_1CABF4E94((uint64_t (*)(unint64_t, unint64_t))sub_1CABF4518);
}

- (id)saveMessage:(id)a3 backend:(unsigned __int8)a4 messageIdentifier:(id)a5
{
  uint64_t v7 = sub_1CABFC928();
  uint64_t v8 = sub_1CABFC988();
  uint64_t v10 = v9;
  v11 = self;
  MetricStore.saveMessage(_:backend:messageIdentifier:)(v7, a4, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_1CABFC918();
  swift_bridgeObjectRelease();
  return v12;
}

- (void)removeAllMetricsWithPrefix:(id)a3
{
  uint64_t v4 = sub_1CABFC988();
  v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  MetricStore.removeAllMetrics(withPrefix:)(v8);

  swift_bridgeObjectRelease();
}

- (void)registerEnrichmentProvider:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  MetricStore.registerEnrichmentProvider(_:)();
  swift_unknownObjectRelease();
}

- (void)registerMessageListener:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = OUTLINED_FUNCTION_25();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  MetricStore.registerMessageListener(_:)((uint64_t)sub_1CABF9CA0, v5);

  swift_release();
}

- (BOOL)sendMessagesWithShouldContinue:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  *(void *)(OUTLINED_FUNCTION_25() + 16) = v4;
  uint64_t v5 = self;
  MetricStore.sendMessages(shouldContinue:)();
  LOBYTE(self) = v6;

  swift_release();
  return self & 1;
}

- (BOOL)shouldSendMessages
{
  id v2 = self;
  Swift::Bool v3 = MetricStore.shouldSendMessages()();

  return v3;
}

- (void).cxx_destruct
{
  sub_1CABFC808();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_51();
  v2();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end