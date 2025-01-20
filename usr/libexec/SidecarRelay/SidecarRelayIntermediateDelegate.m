@interface SidecarRelayIntermediateDelegate
- (BOOL)handleRapportEvent:(id)a3;
- (_TtC12SidecarRelay32SidecarRelayIntermediateDelegate)init;
- (id)overridePresenterLaunchOptions:(id)a3;
- (void)dealloc;
- (void)fetchRemoteDisplaySendingDeviceStatesWithCompletion:(id)a3;
- (void)ignoreDetectionForAnchorIdentifier:(id)a3;
- (void)ignoreDetectionOfAnchorWithIdentifier:(id)a3 completion:(id)a4;
- (void)issueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)issueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4;
- (void)relayInitialized;
- (void)sendDataRequest:(id)a3 completion:(id)a4;
- (void)setDevicesAreNearby:(BOOL)a3;
- (void)setRelayProxy:(id)a3;
- (void)setRemoteDisplaySessionExists:(BOOL)a3;
@end

@implementation SidecarRelayIntermediateDelegate

- (void)dealloc
{
  v2 = self;
  sub_10001FA24();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (_TtC12SidecarRelay32SidecarRelayIntermediateDelegate)init
{
}

- (void)setRelayProxy:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10001FB8C(a3);
  swift_unknownObjectRelease();
}

- (void)relayInitialized
{
  v2 = self;
  sub_10001FFB4();
}

- (void)ignoreDetectionForAnchorIdentifier:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10002011C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setDevicesAreNearby:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100020734(a3);
}

- (void)setRemoteDisplaySessionExists:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1000207A0(a3);
}

- (BOOL)handleRapportEvent:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  char v6 = sub_10002080C(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (void)fetchRemoteDisplaySendingDeviceStatesWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  uint64_t v5 = self;
  sub_100020D14((void (*)(uint64_t, id))sub_100013038);

  swift_release();
}

- (void)issueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)issueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)ignoreDetectionOfAnchorWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v10);
  v11 = self;
  sub_1000210C4((uint64_t)v9, (uint64_t)v11, (void (**)(void, void))v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)sendDataRequest:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  uint64_t v12 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v6;
  sub_10002127C(v8, v10, (uint64_t)sub_100013030, v11);
  swift_release();
  sub_1000048D0(v8, v10);
}

- (id)overridePresenterLaunchOptions:(id)a3
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  sub_100021470();

  swift_bridgeObjectRelease();
  v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

@end