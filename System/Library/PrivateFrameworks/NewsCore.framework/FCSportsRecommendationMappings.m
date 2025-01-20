@interface FCSportsRecommendationMappings
- (FCSportsRecommendationMappings)initWithDictionary:(id)a3;
- (FCSportsRecommendationsProvider)alternativeRecommendations;
- (FCSportsRecommendationsProvider)defaultRecommendations;
- (void)setAlternativeRecommendations:(id)a3;
- (void)setDefaultRecommendations:(id)a3;
@end

@implementation FCSportsRecommendationMappings

- (FCSportsRecommendationMappings)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCSportsRecommendationMappings;
  v5 = [(FCSportsRecommendationMappings *)&v14 init];
  if (v5)
  {
    v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"defaultRecommendations", 0);
    v7 = [[FCSportsRecommendationsProvider alloc] initWithDictionary:v6];
    defaultRecommendations = v5->_defaultRecommendations;
    v5->_defaultRecommendations = v7;

    v9 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"alternativeRecommendations", 0);
    v10 = [[FCSportsRecommendationsProvider alloc] initWithDictionary:v9];
    alternativeRecommendations = v5->_alternativeRecommendations;
    v5->_alternativeRecommendations = v10;

    if (!v5->_defaultRecommendations && !v5->_alternativeRecommendations)
    {

      v12 = 0;
      goto LABEL_6;
    }
  }
  v12 = v5;
LABEL_6:

  return v12;
}

- (FCSportsRecommendationsProvider)defaultRecommendations
{
  return self->_defaultRecommendations;
}

- (void)setDefaultRecommendations:(id)a3
{
}

- (FCSportsRecommendationsProvider)alternativeRecommendations
{
  return self->_alternativeRecommendations;
}

- (void)setAlternativeRecommendations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeRecommendations, 0);
  objc_storeStrong((id *)&self->_defaultRecommendations, 0);
}

@end