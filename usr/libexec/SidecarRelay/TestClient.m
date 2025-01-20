@interface TestClient
- (void)relayDevicesForServiceIdentifier:(id)a3 completion:(id)a4;
@end

@implementation TestClient

- (void)relayDevicesForServiceIdentifier:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_10005D244(v6, v8, v9, (void (**)(void, void, void))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end