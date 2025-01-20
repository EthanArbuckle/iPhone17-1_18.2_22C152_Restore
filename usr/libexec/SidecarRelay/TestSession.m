@interface TestSession
- (NSString)description;
- (RPRemoteDisplayDevice)destinationDevice;
- (_TtC12SidecarRelay11TestSession)init;
- (void)activateWithCompletion:(id)a3;
- (void)deregisterEventID:(id)a3;
- (void)deregisterRequestID:(id)a3;
- (void)invalidate;
- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5;
- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7;
- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7;
- (void)setDestinationDevice:(id)a3;
@end

@implementation TestSession

- (NSString)description
{
  return (NSString *)sub_10005C470(self, (uint64_t)a2, (void (*)(void))sub_10005B618);
}

- (RPRemoteDisplayDevice)destinationDevice
{
  v2 = sub_10005B76C();

  return (RPRemoteDisplayDevice *)v2;
}

- (void)setDestinationDevice:(id)a3
{
  id v5 = a3;
  v6 = self;
}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  v12 = self;
  sub_10005B7F4(v8, v10, v13, (uint64_t)sub_10005DD2C, v11);

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)deregisterEventID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_10005BA4C(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9 = (void (*)(void))_Block_copy(a7);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a6) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  if (v9)
  {
    *(void *)(swift_allocObject() + 16) = v9;
    uint64_t v9 = (void (*)(void))sub_1000138A4;
  }
  uint64_t v10 = self;
  sub_10005BB20((uint64_t)v10, v11, v12, v13, v14, v15, v9);
  sub_100012A1C((uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)activateWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1000138A4;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  sub_10005C650((uint64_t)v7, v6, (uint64_t)&unk_100097DC0, (uint64_t)sub_10005DC10, (uint64_t)&unk_100097DD8);
  sub_100012A1C((uint64_t)v7);
}

- (void)invalidate
{
  v2 = self;
  sub_10005BDE0();
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  uint64_t v6 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  *(void *)(swift_allocObject() + 16) = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)deregisterRequestID:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  uint64_t v9 = _Block_copy(a7);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  if (a6) {
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v9);
  v17 = self;
  sub_10005C12C(v10, v12, v13, v14, v16, (uint64_t)a6, (uint64_t)v17, (void (**)(void, void, void, void))v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC12SidecarRelay11TestSession)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end