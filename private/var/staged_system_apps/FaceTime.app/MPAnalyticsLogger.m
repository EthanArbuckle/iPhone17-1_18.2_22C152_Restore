@interface MPAnalyticsLogger
- (MPAnalyticsLogger)init;
- (void)logCustomGreetingUpdated;
- (void)logEvent:(id)a3;
- (void)logEvent:(id)a3 withCoreAnalyticsDictionary:(id)a4;
@end

@implementation MPAnalyticsLogger

- (void)logEvent:(id)a3 withCoreAnalyticsDictionary:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  sub_1000175C8(0, &qword_1000BAFA0);
  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_10000C308(v5, v7, v8);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (MPAnalyticsLogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MPAnalyticsLogger();
  return [(MPAnalyticsLogger *)&v3 init];
}

- (void)logEvent:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000175C8(0, (unint64_t *)&qword_1000BA8E8);
  v4 = self;
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  NSString v6 = String._bridgeToObjectiveC()();
  v8[4] = variable initialization expression of ClarityUISceneDelegate.window;
  v8[5] = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_1000088F0;
  v8[3] = &unk_1000A2D98;
  uint64_t v7 = _Block_copy(v8);
  AnalyticsSendEventLazy();
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)logCustomGreetingUpdated
{
  sub_100017E2C(qword_1000BAE88);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10007E140;
  *(void *)(inited + 32) = 0xD000000000000017;
  *(void *)(inited + 40) = 0x8000000100081E00;
  sub_1000175C8(0, (unint64_t *)&qword_1000BAF88);
  v4 = self;
  *(NSNumber *)(inited + 48) = NSNumber.init(BOOLeanLiteral:)(1);
  unint64_t v5 = sub_1000640E8(inited);
  sub_1000645B8(v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  sub_10000C308(0xD00000000000002FLL, 0x8000000100081E20, v7);

  swift_bridgeObjectRelease();
}

@end