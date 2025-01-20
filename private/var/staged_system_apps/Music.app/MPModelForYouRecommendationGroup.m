@interface MPModelForYouRecommendationGroup
- (BOOL)shouldDisplayUtterances;
@end

@implementation MPModelForYouRecommendationGroup

- (BOOL)shouldDisplayUtterances
{
  return [(MPModelForYouRecommendationGroup *)self traits] & 1;
}

@end