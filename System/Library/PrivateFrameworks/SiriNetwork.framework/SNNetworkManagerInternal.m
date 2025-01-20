@interface SNNetworkManagerInternal
+ (SNNetworkManagerInternal)shared;
+ (void)acquireDormancySuspendAssertion:(id *)a3;
+ (void)releaseDormancySuspendAssertion:(id *)a3;
- (SNNetworkManagerInternal)init;
- (int64_t)networkQualityWithNetworkType:(int64_t)a3;
- (void)acquireWiFiAssertionWithWifiAssertionTypeRawValue:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)dealloc;
- (void)forceFastDormancy;
- (void)getSNLinkRecommendationMetrics:(id)a3;
- (void)getSNProximityLinkRecommendationWithRetry:(BOOL)a3 completion:(id)a4;
- (void)preferredDataSimChanged:(id)a3;
- (void)registerClient;
- (void)releaseWiFiAssertion;
- (void)removeObserver:(id)a3;
- (void)resetLinkRecommendationInfo;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)simStatusDidChange:(id)a3 status:(id)a4;
- (void)startMonitoringNetwork:(id)a3;
- (void)stopMonitoringNetwork;
- (void)unregisterClient;
- (void)updateNetworkPerformanceFeed;
@end

@implementation SNNetworkManagerInternal

+ (SNNetworkManagerInternal)shared
{
  id v2 = static NetworkManager.shared.getter();

  return (SNNetworkManagerInternal *)v2;
}

- (void)dealloc
{
  id v2 = self;
  NetworkManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SNNetworkManagerInternal_lockConnectionQuality);
}

- (SNNetworkManagerInternal)init
{
}

- (void)registerClient
{
  id v2 = self;
  NetworkManager.registerClient()();
}

- (void)unregisterClient
{
  id v2 = self;
  NetworkManager.unregisterClient()();
}

- (void)resetLinkRecommendationInfo
{
  id v2 = self;
  NetworkManager.resetLinkRecommendationInfo()();
}

- (void)getSNProximityLinkRecommendationWithRetry:(BOOL)a3 completion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ()partial apply;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  NetworkManager.getSNProximityLinkRecommendation(retry:completion:)(a3, (uint64_t)v6, v7);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v6);
}

- (void)getSNLinkRecommendationMetrics:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ();
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  NetworkManager.getSNLinkRecommendationMetrics(_:)((uint64_t)v7, v6);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v7);
}

- (void)preferredDataSimChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  NetworkManager.preferredDataSimChanged(_:)(v4);
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  NetworkManager.carrierBundleChange(_:)(v4);
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  NetworkManager.simStatusDidChange(_:status:)(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  NetworkManager.signalStrengthChanged(_:info:)(v6, v7);
}

- (void)acquireWiFiAssertionWithWifiAssertionTypeRawValue:(int64_t)a3
{
  id v4 = self;
  NetworkManager.acquireWiFiAssertion(wifiAssertionTypeRawValue:)(a3);
}

- (void)releaseWiFiAssertion
{
  id v2 = self;
  NetworkManager.releaseWiFiAssertion()();
}

- (void)updateNetworkPerformanceFeed
{
  id v2 = self;
  NetworkManager.updateNetworkPerformanceFeed()();
}

- (int64_t)networkQualityWithNetworkType:(int64_t)a3
{
  id v4 = self;
  int64_t v5 = NetworkManager.networkQuality(networkType:)(a3);

  return v5;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)startMonitoringNetwork:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = v5;
  id v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  NetworkManager.startMonitoringNetwork(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)stopMonitoringNetwork
{
  id v2 = self;
  NetworkManager.stopMonitoringNetwork()();
}

- (void)forceFastDormancy
{
  id v2 = self;
  NetworkManager.forceFastDormancy()();
}

+ (void)acquireDormancySuspendAssertion:(id *)a3
{
}

+ (void)releaseDormancySuspendAssertion:(id *)a3
{
}

@end