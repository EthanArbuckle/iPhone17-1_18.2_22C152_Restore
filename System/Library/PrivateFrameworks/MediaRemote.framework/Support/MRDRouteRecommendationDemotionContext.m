@interface MRDRouteRecommendationDemotionContext
- (BOOL)isASELocal;
- (BOOL)isSourceEndpointPlaying;
- (BOOL)isTargetEndpointPlaying;
- (BOOL)localOutputContextHasAirPlay;
- (MRDRouteRecommendationDemotionContext)init;
- (MRDRouteRecommendationDemotionContext)initWithPrimaryBundleIdentifier:(id)a3 recommendationType:(int64_t)a4 isASELocal:(BOOL)a5 localOutputContextHasAirPlay:(BOOL)a6 isSourceEndpointPlaying:(BOOL)a7 isTargetEndpointPlaying:(BOOL)a8 targetNowPlayingBundleIdentifier:(id)a9 targetEndpointContainsDiscoverableGroupLeader:(BOOL)a10;
- (NSString)primaryBundleIdentifier;
- (NSString)targetNowPlayingBundleIdentifier;
- (int64_t)recommendationType;
- (void)setIsASELocal:(BOOL)a3;
- (void)setIsSourceEndpointPlaying:(BOOL)a3;
- (void)setIsTargetEndpointPlaying:(BOOL)a3;
- (void)setLocalOutputContextHasAirPlay:(BOOL)a3;
- (void)setPrimaryBundleIdentifier:(id)a3;
- (void)setRecommendationType:(int64_t)a3;
- (void)setTargetNowPlayingBundleIdentifier:(id)a3;
@end

@implementation MRDRouteRecommendationDemotionContext

- (NSString)primaryBundleIdentifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setPrimaryBundleIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_primaryBundleIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)recommendationType
{
  NSString v2 = (int64_t *)((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_recommendationType);
  swift_beginAccess();
  return *v2;
}

- (void)setRecommendationType:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_recommendationType);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)isASELocal
{
  NSString v2 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isASELocal;
  swift_beginAccess();
  return *v2;
}

- (void)setIsASELocal:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isASELocal;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)localOutputContextHasAirPlay
{
  NSString v2 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_localOutputContextHasAirPlay;
  swift_beginAccess();
  return *v2;
}

- (void)setLocalOutputContextHasAirPlay:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_localOutputContextHasAirPlay;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)isSourceEndpointPlaying
{
  NSString v2 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isSourceEndpointPlaying;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSourceEndpointPlaying:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isSourceEndpointPlaying;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)isTargetEndpointPlaying
{
  NSString v2 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isTargetEndpointPlaying;
  swift_beginAccess();
  return *v2;
}

- (void)setIsTargetEndpointPlaying:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_isTargetEndpointPlaying;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSString)targetNowPlayingBundleIdentifier
{
  NSString v2 = (char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_targetNowPlayingBundleIdentifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setTargetNowPlayingBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___MRDRouteRecommendationDemotionContext_targetNowPlayingBundleIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (MRDRouteRecommendationDemotionContext)initWithPrimaryBundleIdentifier:(id)a3 recommendationType:(int64_t)a4 isASELocal:(BOOL)a5 localOutputContextHasAirPlay:(BOOL)a6 isSourceEndpointPlaying:(BOOL)a7 isTargetEndpointPlaying:(BOOL)a8 targetNowPlayingBundleIdentifier:(id)a9 targetEndpointContainsDiscoverableGroupLeader:(BOOL)a10
{
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  if (a9)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v18 = 0;
  }
  return (MRDRouteRecommendationDemotionContext *)sub_10030A4BC(v15, v17, a4, a5, a6, a7, a8, v19, v18, a10);
}

- (MRDRouteRecommendationDemotionContext)init
{
  result = (MRDRouteRecommendationDemotionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end