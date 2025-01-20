@interface MRDRouteRecommendationDemotionController
+ (id)controller;
- (MRDRouteRecommendationDemotionController)init;
- (id)demotionPolicyWithContext:(id)a3;
@end

@implementation MRDRouteRecommendationDemotionController

+ (id)controller
{
  type metadata accessor for RouteRecommendationDemotionController();
  v4[3] = type metadata accessor for MediaAppInFocusMonitor();
  v4[4] = &off_100424160;
  v4[0] = swift_allocObject();
  id v2 = sub_10030A900((uint64_t)v4);

  return v2;
}

- (id)demotionPolicyWithContext:(id)a3
{
  v4 = a3;
  v5 = self;
  id v6 = sub_10030A998(v4);

  return v6;
}

- (MRDRouteRecommendationDemotionController)init
{
  result = (MRDRouteRecommendationDemotionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end