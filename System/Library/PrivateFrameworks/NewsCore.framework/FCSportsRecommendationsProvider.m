@interface FCSportsRecommendationsProvider
- (FCSportsRecommendationsProvider)initWithDictionary:(id)a3;
- (NSDictionary)scoredTagIDs;
@end

@implementation FCSportsRecommendationsProvider

- (FCSportsRecommendationsProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCSportsRecommendationsProvider;
  v5 = [(FCSportsRecommendationsProvider *)&v10 init];
  if (v5
    && (FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"scoredTagIDs", 0),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        scoredTagIDs = v5->_scoredTagIDs,
        v5->_scoredTagIDs = (NSDictionary *)v6,
        scoredTagIDs,
        !v5->_scoredTagIDs))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NSDictionary)scoredTagIDs
{
  return self->_scoredTagIDs;
}

- (void).cxx_destruct
{
}

@end