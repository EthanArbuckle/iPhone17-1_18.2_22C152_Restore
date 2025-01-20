@interface SECServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC10seserviced9SECServer)init;
- (_TtC10seserviced9SECServer)initWithMachServiceName:(id)a3;
- (void)acquirePresentmentIntentAssertionWithReply:(id)a3;
- (void)computeEligibilityWithReply:(id)a3;
- (void)deleteApplicationWithIdentifier:(id)a3 reply:(id)a4;
- (void)deleteCredentialWithUuid:(id)a3 reply:(id)a4;
- (void)listCredentialsInternalWithReply:(id)a3;
- (void)queueSessionWithCallbackProxy:(id)a3 reply:(id)a4;
@end

@implementation SECServer

- (_TtC10seserviced9SECServer)initWithMachServiceName:(id)a3
{
  return (_TtC10seserviced9SECServer *)SECServer.init(machServiceName:)();
}

- (_TtC10seserviced9SECServer)init
{
  NSString v3 = String._bridgeToObjectiveC()();
  v4 = [(SECServer *)self initWithMachServiceName:v3];

  return v4;
}

- (void)acquirePresentmentIntentAssertionWithReply:(id)a3
{
}

- (void)computeEligibilityWithReply:(id)a3
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100128908(v7);

  return v9 & 1;
}

- (void)queueSessionWithCallbackProxy:(id)a3 reply:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  swift_unknownObjectRetain();
  id v7 = self;
  sub_100129274((uint64_t)a3, (uint64_t)v7, (void (**)(void, void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();

  swift_release();
}

- (void)listCredentialsInternalWithReply:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10029B438((void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)deleteCredentialWithUuid:(id)a3 reply:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v11);
  v12 = self;
  sub_10029B798((uint64_t)v10, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)deleteApplicationWithIdentifier:(id)a3 reply:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_10029BBD8(v6, v8, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

@end