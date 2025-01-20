@interface SNNetworkWiFiManagerInternal
+ (SNNetworkWiFiManagerInternal)shared;
- (BOOL)isWiFiEnabled;
- (BOOL)registerOneShotPowerStateDidChangeForWiFiInterface:(id)a3;
- (SNNetworkWiFiManagerInternal)init;
- (id)getWiFiRecordRepresentation;
- (void)acquireWiFiAssertionWithWifiAssertionTypeRawValue:(int64_t)a3;
- (void)dealloc;
- (void)powerStateDidChangeForWiFiInterfaceWithName:(id)a3;
- (void)releaseWiFiAssertion;
@end

@implementation SNNetworkWiFiManagerInternal

- (BOOL)registerOneShotPowerStateDidChangeForWiFiInterface:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) () -> ();
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  BOOL v9 = NetworkWiFiManager.registerOneShotPowerStateDidChangeForWiFiInterface(_:)((uint64_t)v7, v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v7);

  return v9;
}

- (void)powerStateDidChangeForWiFiInterfaceWithName:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4._countAndFlagsBits = (uint64_t)self;
  countAndFlagsBits = (void *)v4._countAndFlagsBits;
  NetworkWiFiManager.powerStateDidChangeForWiFiInterface(withName:)(v4);

  swift_bridgeObjectRelease();
}

+ (SNNetworkWiFiManagerInternal)shared
{
  id v2 = static NetworkWiFiManager.shared.getter();

  return (SNNetworkWiFiManagerInternal *)v2;
}

- (SNNetworkWiFiManagerInternal)init
{
  return (SNNetworkWiFiManagerInternal *)NetworkWiFiManager.init()();
}

- (void)dealloc
{
  id v2 = self;
  NetworkWiFiManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SNNetworkWiFiManagerInternal_queueGroup);
}

- (id)getWiFiRecordRepresentation
{
  id v2 = self;
  id v3 = NetworkWiFiManager.getWiFiRecordRepresentation()();

  return v3;
}

- (BOOL)isWiFiEnabled
{
  id v2 = self;
  Swift::Bool v3 = NetworkWiFiManager.isWiFiEnabled()();

  return v3;
}

- (void)acquireWiFiAssertionWithWifiAssertionTypeRawValue:(int64_t)a3
{
  Swift::String v4 = self;
  NetworkWiFiManager.acquireWiFiAssertion(wifiAssertionTypeRawValue:)(a3);
}

- (void)releaseWiFiAssertion
{
  id v2 = self;
  NetworkWiFiManager.releaseWiFiAssertion()();
}

@end