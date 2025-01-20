@interface MPModelForYouRecommendationItem
- (NSString)title;
@end

@implementation MPModelForYouRecommendationItem

- (NSString)title
{
  id v3 = [(MPModelForYouRecommendationItem *)self itemType];
  if (v3 == (id)3)
  {
    v6 = [(MPModelForYouRecommendationItem *)self radioStation];
LABEL_7:
    v4 = v6;
    uint64_t v5 = [v6 name];
    goto LABEL_8;
  }
  if (v3 == (id)2)
  {
    v6 = [(MPModelForYouRecommendationItem *)self playlist];
    goto LABEL_7;
  }
  if (v3 == (id)1)
  {
    v4 = [(MPModelForYouRecommendationItem *)self album];
    uint64_t v5 = [v4 title];
LABEL_8:
    v7 = (void *)v5;

    goto LABEL_10;
  }
  v7 = 0;
LABEL_10:

  return (NSString *)v7;
}

@end