@interface FCNewsTabiRecommendedTagsInputOutputConfiguration
- (FCNewsTabiRecommendedTagsInputOutputConfiguration)init;
- (FCNewsTabiRecommendedTagsInputOutputConfiguration)initWithDictionary:(id)a3;
- (NSString)contextFeatureKey;
- (NSString)recommendationsOutputName;
- (NSString)recommendationsScoreOutputName;
- (id)description;
- (void)setContextFeatureKey:(id)a3;
- (void)setRecommendationsOutputName:(id)a3;
- (void)setRecommendationsScoreOutputName:(id)a3;
@end

@implementation FCNewsTabiRecommendedTagsInputOutputConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(FCNewsTabiRecommendedTagsInputOutputConfiguration *)self contextFeatureKey];
  [v3 appendFormat:@"\n\tcontextFeatureKey: %@;", v4];

  v5 = [(FCNewsTabiRecommendedTagsInputOutputConfiguration *)self recommendationsOutputName];
  [v3 appendFormat:@"\n\trecommendationsOutputName: %@;", v5];

  v6 = [(FCNewsTabiRecommendedTagsInputOutputConfiguration *)self recommendationsScoreOutputName];
  [v3 appendFormat:@"\n\trecommendationsScoreOutputName: %@;", v6];

  [v3 appendString:@"\n>"];
  return v3;
}

- (NSString)recommendationsScoreOutputName
{
  return self->_recommendationsScoreOutputName;
}

- (NSString)recommendationsOutputName
{
  return self->_recommendationsOutputName;
}

- (NSString)contextFeatureKey
{
  return self->_contextFeatureKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationsScoreOutputName, 0);
  objc_storeStrong((id *)&self->_recommendationsOutputName, 0);
  objc_storeStrong((id *)&self->_contextFeatureKey, 0);
}

- (FCNewsTabiRecommendedTagsInputOutputConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = FCAppConfigurationStringValue(v4, @"contextFeatureKey", 0);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = FCAppConfigurationStringValue(v4, @"recommendationsOutputName", 0);
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
      v11 = FCAppConfigurationStringValue(v4, @"recommendationsScoreOutputName", 0);
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
        v18.receiver = self;
        v18.super_class = (Class)FCNewsTabiRecommendedTagsInputOutputConfiguration;
        v14 = [(FCNewsTabiRecommendedTagsInputOutputConfiguration *)&v18 init];
        p_isa = (id *)&v14->super.isa;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_contextFeatureKey, v6);
          objc_storeStrong(p_isa + 2, v9);
          objc_storeStrong(p_isa + 3, v12);
        }
        self = p_isa;

        v16 = self;
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (FCNewsTabiRecommendedTagsInputOutputConfiguration)init
{
  return [(FCNewsTabiRecommendedTagsInputOutputConfiguration *)self initWithDictionary:0];
}

- (void)setContextFeatureKey:(id)a3
{
}

- (void)setRecommendationsOutputName:(id)a3
{
}

- (void)setRecommendationsScoreOutputName:(id)a3
{
}

@end