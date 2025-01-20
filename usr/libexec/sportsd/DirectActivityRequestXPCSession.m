@interface DirectActivityRequestXPCSession
- (void)createActivityWithCanonicalId:(id)a3 supplementaryData:(id)a4 completion:(id)a5;
- (void)createSessionWithCanonicalId:(id)a3 completion:(id)a4;
- (void)dealloc;
@end

@implementation DirectActivityRequestXPCSession

- (void)dealloc
{
  v2 = self;
  sub_100064A14();
}

- (void).cxx_destruct
{
  sub_10002A60C((uint64_t)self + OBJC_IVAR____TtC7sportsd31DirectActivityRequestXPCSession_subscriptionOperation);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)createSessionWithCanonicalId:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_100064BB4(v6, v8, (uint64_t)v9, (uint64_t)v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)createActivityWithCanonicalId:(id)a3 supplementaryData:(id)a4 completion:(id)a5
{
  unint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;
  if (a4) {
    a4 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  v12 = self;
  sub_100064C48(v8, v10, (uint64_t)a4, (void (*)(void))sub_1000661E8, v11);

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end