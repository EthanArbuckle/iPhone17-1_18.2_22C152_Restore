@interface MRDRouteRecommendationSuppressionContext
- (MRDRouteRecommendationSuppressionContext)init;
- (MRDRouteRecommendationSuppressionContext)initWithLocalEndpoint:(id)a3 activeSystemEndpoint:(id)a4 eligibleToShowRecommendationsOutsideApp:(BOOL)a5 eligibleToShowDeltaBanners:(BOOL)a6;
@end

@implementation MRDRouteRecommendationSuppressionContext

- (MRDRouteRecommendationSuppressionContext)initWithLocalEndpoint:(id)a3 activeSystemEndpoint:(id)a4 eligibleToShowRecommendationsOutsideApp:(BOOL)a5 eligibleToShowDeltaBanners:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (MRDRouteRecommendationSuppressionContext *)sub_10030BC64(a3, a4, a5, a6);

  return v12;
}

- (MRDRouteRecommendationSuppressionContext)init
{
  result = (MRDRouteRecommendationSuppressionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MRDRouteRecommendationSuppressionContext_activeSystemEndpoint);
}

@end