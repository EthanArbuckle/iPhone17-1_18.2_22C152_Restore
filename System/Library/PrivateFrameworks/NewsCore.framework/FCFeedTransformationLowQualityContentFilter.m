@interface FCFeedTransformationLowQualityContentFilter
+ (id)transformationWithPersonalizer:(id)a3;
- (FCFeedPersonalizing)feedPersonalizer;
- (id)transformFeedItems:(id)a3;
- (void)setFeedPersonalizer:(id)a3;
@end

@implementation FCFeedTransformationLowQualityContentFilter

+ (id)transformationWithPersonalizer:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setFeedPersonalizer:v3];

  return v4;
}

- (id)transformFeedItems:(id)a3
{
  id v4 = a3;
  v5 = NewsCoreUserDefaults();
  int v6 = [v5 BOOLForKey:@"personalization_disabled"];

  if (v6)
  {
    id v7 = v4;
  }
  else
  {
    v8 = [(FCFeedTransformationLowQualityContentFilter *)self feedPersonalizer];
    id v7 = [v8 limitItemsByMinimumItemQuality:v4];
  }
  return v7;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end