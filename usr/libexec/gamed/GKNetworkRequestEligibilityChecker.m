@interface GKNetworkRequestEligibilityChecker
- (GKNetworkRequestEligibilityChecker)init;
- (GKNetworkRequestEligibilityChecker)initWithHasAcknowledgedLatestGDPR:(BOOL)a3 alwaysAllowedBagKeysObject:(id)a4 isAppUnlistedAndDisallowed:(BOOL)a5;
- (id)verifyEligibilityWithBagKey:(id)a3;
@end

@implementation GKNetworkRequestEligibilityChecker

- (GKNetworkRequestEligibilityChecker)initWithHasAcknowledgedLatestGDPR:(BOOL)a3 alwaysAllowedBagKeysObject:(id)a4 isAppUnlistedAndDisallowed:(BOOL)a5
{
  if (a4)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  return (GKNetworkRequestEligibilityChecker *)NetworkRequestEligibiltyChecker.init(hasAcknowledgedLatestGDPR:alwaysAllowedBagKeysObject:isAppUnlistedAndDisallowed:)(a3, (uint64_t)v8, a5);
}

- (id)verifyEligibilityWithBagKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  id v8 = NetworkRequestEligibiltyChecker.verifyEligibility(bagKey:)(v4, v6);

  swift_bridgeObjectRelease();
  if (v8)
  {
    v9 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (GKNetworkRequestEligibilityChecker)init
{
}

@end