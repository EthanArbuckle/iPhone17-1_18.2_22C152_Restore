@interface SidecarRelayNullDelegate
- (BOOL)handleRapportEvent:(id)a3;
- (_TtC12SidecarRelay24SidecarRelayNullDelegate)init;
- (id)overridePresenterLaunchOptions:(id)a3;
- (void)fetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4;
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

@implementation SidecarRelayNullDelegate

- (_TtC12SidecarRelay24SidecarRelayNullDelegate)init
{
}

- (void)setDevicesAreNearby:(BOOL)a3
{
  v3 = self;
  sub_100003E80();
}

- (void)setRemoteDisplaySessionExists:(BOOL)a3
{
  v3 = self;
  sub_100003F0C();
}

- (void)setRelayProxy:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_100003F98();
  swift_unknownObjectRelease();
}

- (void)relayInitialized
{
  v2 = self;
  sub_100004034();
}

- (void)ignoreDetectionForAnchorIdentifier:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1000040B8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)handleRapportEvent:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  sub_1000041D8();
  swift_unknownObjectRelease();

  return 0;
}

- (void)fetchRemoteDisplaySendingDeviceStatesWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100004254((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
}

- (void)issueRemoteDisplayConnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)issueRemoteDisplayDisconnectionRequestToSendingDeviceWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)ignoreDetectionOfAnchorWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)fetchDeviceReadinessStatusWithIDSIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_10000456C(v6, v8, (uint64_t)v9, (void (**)(void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)sendDataRequest:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  id v7 = a3;
  v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_100004680(v8, v10, (uint64_t)v11, (void (**)(void, void, void))v6);
  _Block_release(v6);
  sub_1000048D0(v8, v10);
}

- (id)overridePresenterLaunchOptions:(id)a3
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  sub_1000047CC();

  swift_bridgeObjectRelease();
  v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

@end