@interface MRDRouteRecommendationSuppressionController
+ (MRDRouteRecommendationSuppressionController)controller;
- (MRDRouteRecommendationSuppressionController)init;
- (id)suppressionPolicyWithContext:(id)a3;
@end

@implementation MRDRouteRecommendationSuppressionController

+ (MRDRouteRecommendationSuppressionController)controller
{
  v2 = (void *)sub_1001A793C();

  return (MRDRouteRecommendationSuppressionController *)v2;
}

- (id)suppressionPolicyWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_100266888((uint64_t)v4);

  return v6;
}

- (MRDRouteRecommendationSuppressionController)init
{
  result = (MRDRouteRecommendationSuppressionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end