@interface MRDRouteRecommendationSuppressionPolicy
- (BOOL)shouldSuppress;
- (MRDRouteRecommendationSuppressionPolicy)init;
- (NSString)reason;
@end

@implementation MRDRouteRecommendationSuppressionPolicy

- (BOOL)shouldSuppress
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___MRDRouteRecommendationSuppressionPolicy_shouldSuppress);
}

- (NSString)reason
{
  if (*(void *)&self->shouldSuppress[OBJC_IVAR___MRDRouteRecommendationSuppressionPolicy_reason])
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

- (MRDRouteRecommendationSuppressionPolicy)init
{
  result = (MRDRouteRecommendationSuppressionPolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end