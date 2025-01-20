@interface FCNewsPersonalizationConfiguration
+ (id)defaultConfiguration;
- (FCNewsArticleEmbeddingsConfiguration)articleEmbeddingsConfiguration;
- (FCNewsPersonalizationConfiguration)init;
- (FCNewsPersonalizationConfiguration)initWithDictionary:(id)a3;
- (FCNewsPersonalizationFeatureConfiguration)featureConfiguration;
- (FCNewsPersonalizationTrainingConfiguration)trainingConfiguration;
- (FCStatelessPersonalizationConfiguration)statelessPersonalizationConfiguration;
- (FCUserEventHistoryTrackingConfiguration)trackingConfiguration;
- (id)description;
- (void)setArticleEmbeddingsConfiguration:(id)a3;
- (void)setFeatureConfiguration:(id)a3;
- (void)setStatelessPersonalizationConfiguration:(id)a3;
- (void)setTrackingConfiguration:(id)a3;
- (void)setTrainingConfiguration:(id)a3;
@end

@implementation FCNewsPersonalizationConfiguration

- (FCNewsPersonalizationTrainingConfiguration)trainingConfiguration
{
  return self->_trainingConfiguration;
}

- (FCStatelessPersonalizationConfiguration)statelessPersonalizationConfiguration
{
  return self->_statelessPersonalizationConfiguration;
}

- (FCNewsPersonalizationFeatureConfiguration)featureConfiguration
{
  return self->_featureConfiguration;
}

- (FCNewsPersonalizationConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FCNewsPersonalizationConfiguration;
  v5 = [(FCNewsPersonalizationConfiguration *)&v22 init];
  if (v5)
  {
    v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"userEventHistoryTrackingConfiguration", 0);
    v7 = [[FCUserEventHistoryTrackingConfiguration alloc] initWithDictionary:v6];
    trackingConfiguration = v5->_trackingConfiguration;
    v5->_trackingConfiguration = v7;

    v9 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"featureConfiguration", 0);
    v10 = [[FCNewsPersonalizationFeatureConfiguration alloc] initWithDictionary:v9];
    featureConfiguration = v5->_featureConfiguration;
    v5->_featureConfiguration = v10;

    v12 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"statelessPersonalizationConfiguration", 0);
    v13 = [[FCStatelessPersonalizationConfiguration alloc] initWithDictionary:v12];
    statelessPersonalizationConfiguration = v5->_statelessPersonalizationConfiguration;
    v5->_statelessPersonalizationConfiguration = v13;

    v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"trainingConfiguration", 0);
    v16 = [[FCNewsPersonalizationTrainingConfiguration alloc] initWithDictionary:v15];
    trainingConfiguration = v5->_trainingConfiguration;
    v5->_trainingConfiguration = v16;

    v18 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleEmbeddingsConfiguration", 0);
    v19 = [[FCNewsArticleEmbeddingsConfiguration alloc] initWithDictionary:v18];
    articleEmbeddingsConfiguration = v5->_articleEmbeddingsConfiguration;
    v5->_articleEmbeddingsConfiguration = v19;
  }
  return v5;
}

- (FCNewsArticleEmbeddingsConfiguration)articleEmbeddingsConfiguration
{
  return self->_articleEmbeddingsConfiguration;
}

- (FCNewsPersonalizationConfiguration)init
{
  return [(FCNewsPersonalizationConfiguration *)self initWithDictionary:0];
}

- (FCUserEventHistoryTrackingConfiguration)trackingConfiguration
{
  return self->_trackingConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_articleEmbeddingsConfiguration, 0);
  objc_storeStrong((id *)&self->_trainingConfiguration, 0);
  objc_storeStrong((id *)&self->_featureConfiguration, 0);
  objc_storeStrong((id *)&self->_trackingConfiguration, 0);
  objc_storeStrong((id *)&self->_statelessPersonalizationConfiguration, 0);
}

+ (id)defaultConfiguration
{
  v2 = [[FCNewsPersonalizationConfiguration alloc] initWithDictionary:&unk_1EF8D96A0];
  return v2;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationConfiguration *)self statelessPersonalizationConfiguration];
  [v3 appendFormat:@"; statelessPersonalizationConfiguration: %@", v4];

  v5 = [(FCNewsPersonalizationConfiguration *)self trackingConfiguration];
  [v3 appendFormat:@"; trackingConfiguration: %@", v5];

  v6 = [(FCNewsPersonalizationConfiguration *)self featureConfiguration];
  [v3 appendFormat:@"; featureConfiguration: %@", v6];

  v7 = [(FCNewsPersonalizationConfiguration *)self trainingConfiguration];
  [v3 appendFormat:@"; trainingConfiguration: %@", v7];

  v8 = [(FCNewsPersonalizationConfiguration *)self articleEmbeddingsConfiguration];
  [v3 appendFormat:@"; articleEmbeddingsConfiguration: %@", v8];

  [v3 appendString:@">"];
  return v3;
}

- (void)setStatelessPersonalizationConfiguration:(id)a3
{
}

- (void)setTrackingConfiguration:(id)a3
{
}

- (void)setFeatureConfiguration:(id)a3
{
}

- (void)setTrainingConfiguration:(id)a3
{
}

- (void)setArticleEmbeddingsConfiguration:(id)a3
{
}

@end