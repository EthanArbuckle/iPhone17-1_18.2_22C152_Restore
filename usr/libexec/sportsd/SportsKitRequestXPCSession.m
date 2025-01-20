@interface SportsKitRequestXPCSession
- (uint64_t)createSessionFor:(int)a3 type:(uint64_t)a4 completion:(void *)aBlock;
- (void)checkForActivityFor:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)checkForSessionFor:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)createActivityFor:(id)a3 type:(int64_t)a4 scheduledDate:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)destroyActivityFor:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)destroySessionFor:(id)a3 type:(int64_t)a4 completion:(id)a5;
- (void)flushMetrics;
- (void)liveActivitiesEnabledWithCompletion:(id)a3;
- (void)refreshCurrentEventStateFor:(id)a3 options:(int64_t)a4 completion:(id)a5;
- (void)signalWithDemand:(NSDictionary *)a3 completionHandler:(id)a4;
- (void)subscribeTo:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5;
- (void)subscribeToEventWithEventId:(id)a3 subscriptionType:(id)a4 context:(id)a5 completion:(id)a6;
- (void)unsubscribeFrom:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5;
- (void)unsubscribeFromAllEventsWithCompletion:(id)a3;
- (void)unsubscribeFromEventWithEventId:(id)a3 completion:(id)a4;
- (void)unsubscribeFromEventsWithEventIds:(id)a3 completion:(id)a4;
@end

@implementation SportsKitRequestXPCSession

- (void)dealloc
{
  v2 = self;
  sub_100064A14();
}

- (void).cxx_destruct
{
  sub_10002A60C((uint64_t)self + OBJC_IVAR____TtC7sportsd26SportsKitRequestXPCSession_subscriptionOperation);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)subscribeToEventWithEventId:(id)a3 subscriptionType:(id)a4 context:(id)a5 completion:(id)a6
{
  v7 = _Block_copy(a6);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;
  uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v7);
  v15 = self;
  sub_100087700(v8, v10, v11, v13, v14, (uint64_t)v15, v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)unsubscribeFromEventWithEventId:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  unint64_t v9 = self;
  sub_100088948(v6, v8, (uint64_t)v9, (void (**)(void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)unsubscribeFromEventsWithEventIds:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  unint64_t v7 = self;
  sub_100089144(v6, (char *)v7, (void (**)(void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)unsubscribeFromAllEventsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_100089A2C((uint64_t)sub_10008E094, v5);

  swift_release();
}

- (void)refreshCurrentEventStateFor:(id)a3 options:(int64_t)a4 completion:(id)a5
{
}

- (void)flushMetrics
{
  v2 = self;
  sub_10008A300();
}

- (uint64_t)createSessionFor:(int)a3 type:(uint64_t)a4 completion:(void *)aBlock
{
  unint64_t v7 = _Block_copy(aBlock);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a1;
  sub_10008AE0C(v8, v10, a4, (uint64_t)v11, v7);
  _Block_release(v7);

  return swift_bridgeObjectRelease();
}

- (void)createActivityFor:(id)a3 type:(int64_t)a4 scheduledDate:(id)a5 completion:(id)a6
{
  uint64_t v10 = sub_100005E5C(&qword_1000FC938);
  __chkstk_darwin(v10 - 8);
  unint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v13 = _Block_copy(a6);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;
  if (a5)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = type metadata accessor for Date();
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v17 = type metadata accessor for Date();
    uint64_t v18 = 1;
  }
  sub_1000082C0((uint64_t)v12, v18, 1, v17);
  _Block_copy(v13);
  v19 = self;
  sub_10008A394(v14, v16, a4, (uint64_t)v12, (uint64_t)v19, (void (**)(void, void))v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  sub_10008DFA8((uint64_t)v12, &qword_1000FC938);
}

- (void)destroySessionFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
}

- (void)destroyActivityFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  uint64_t v11 = self;
  sub_10008B0D4(v7, v9, v12, (uint64_t)sub_10008DC00, v10);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)checkForSessionFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
}

- (void)checkForActivityFor:(id)a3 type:(int64_t)a4 completion:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v6;
  uint64_t v11 = self;
  sub_10008BB4C(v7, v9, v12, (uint64_t)sub_10008DAE8, v10);

  swift_bridgeObjectRelease();

  swift_release();
}

- (void)liveActivitiesEnabledWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10008C11C((uint64_t)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (void)signalWithDemand:(NSDictionary *)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  uint64_t v9 = self;

  sub_10008C764((uint64_t)&unk_1000FEFD0, (uint64_t)v7);
}

- (void)subscribeTo:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)unsubscribeFrom:(NSString *)a3 topic:(NSString *)a4 completionHandler:(id)a5
{
}

@end