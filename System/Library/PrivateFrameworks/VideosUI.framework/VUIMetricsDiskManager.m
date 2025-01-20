@interface VUIMetricsDiskManager
+ (VUIMetricsDiskManager)sharedInstance;
- (VUIMetricsDiskManager)init;
- (VUIMetricsDiskManager)initWithSessionSuiteName:(id)a3 eventSuiteName:(id)a4;
- (id)allEvents;
- (id)allSessions;
- (id)eventsForSession:(id)a3;
- (id)sessionForEvent:(id)a3;
- (void)clearAllData;
- (void)writeEvent:(id)a3;
- (void)writeSession:(id)a3;
@end

@implementation VUIMetricsDiskManager

+ (VUIMetricsDiskManager)sharedInstance
{
  id v2 = static MetricsDiskManager.shared.getter();
  return (VUIMetricsDiskManager *)v2;
}

- (VUIMetricsDiskManager)initWithSessionSuiteName:(id)a3 eventSuiteName:(id)a4
{
  return (VUIMetricsDiskManager *)sub_1E2C74A4C();
}

- (VUIMetricsDiskManager)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___VUIMetricsDiskManager_eventDefaults);
}

- (void)writeSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_0_25();
  MetricsDiskManager.writeSession(_:)(v6);
}

- (void)writeEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_0_25();
  MetricsDiskManager.writeEvent(_:)(v6);
}

- (id)eventsForSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  MetricsDiskManager.eventsForSession(_:)(v4);

  type metadata accessor for MetricsRenderEvent();
  uint64_t v6 = (void *)sub_1E387CC88();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)sessionForEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)MetricsDiskManager.sessionForEvent(_:)(v4);

  return v6;
}

- (id)allSessions
{
  return sub_1E3208A1C(self, (uint64_t)a2, MetricsDiskManager.allSessions(), (void (*)(void))type metadata accessor for MetricsRenderSession);
}

- (id)allEvents
{
  return sub_1E3208A1C(self, (uint64_t)a2, MetricsDiskManager.allEvents(), (void (*)(void))type metadata accessor for MetricsRenderEvent);
}

- (void)clearAllData
{
  id v2 = self;
  MetricsDiskManager.clearAllData()();
}

@end