@interface MRDRouteRecommendationDemotionPolicy
- (BOOL)shouldDemote;
- (MRDRouteRecommendationDemotionPolicy)init;
- (NSString)reason;
@end

@implementation MRDRouteRecommendationDemotionPolicy

- (BOOL)shouldDemote
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___MRDRouteRecommendationDemotionPolicy_shouldDemote);
}

- (NSString)reason
{
  if (*(void *)&self->shouldDemote[OBJC_IVAR___MRDRouteRecommendationDemotionPolicy_reason])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (MRDRouteRecommendationDemotionPolicy)init
{
  result = (MRDRouteRecommendationDemotionPolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end