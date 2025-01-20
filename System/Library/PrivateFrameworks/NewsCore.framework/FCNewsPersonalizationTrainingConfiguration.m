@interface FCNewsPersonalizationTrainingConfiguration
- (BOOL)disableTrainingLegacyAggregates;
- (FCNewsPersonalizationAggregateModificationConfigurations)aggregateModificationConfigurations;
- (FCNewsPersonalizationEventConditionalsConfigurations)eventConditionalsConfigurations;
- (FCNewsPersonalizationFeaturePriorsConfiguration)priorsConfiguration;
- (FCNewsPersonalizationTrainingBiases)biases;
- (FCNewsPersonalizationTrainingConfiguration)initWithDictionary:(id)a3;
- (FCNewsPersonalizationTrainingFeatureFlags)featureFlags;
- (FCNewsPersonalizationTrainingLegacyBridgeConfiguration)legacyBridgeConfiguration;
- (double)decayRate;
- (id)description;
- (void)setAggregateModificationConfigurations:(id)a3;
- (void)setBiases:(id)a3;
- (void)setDecayRate:(double)a3;
- (void)setDisableTrainingLegacyAggregates:(BOOL)a3;
- (void)setEventConditionalsConfigurations:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setLegacyBridgeConfiguration:(id)a3;
- (void)setPriorsConfiguration:(id)a3;
@end

@implementation FCNewsPersonalizationTrainingConfiguration

- (FCNewsPersonalizationTrainingFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (FCNewsPersonalizationFeaturePriorsConfiguration)priorsConfiguration
{
  return self->_priorsConfiguration;
}

- (FCNewsPersonalizationTrainingLegacyBridgeConfiguration)legacyBridgeConfiguration
{
  return self->_legacyBridgeConfiguration;
}

- (FCNewsPersonalizationEventConditionalsConfigurations)eventConditionalsConfigurations
{
  return self->_eventConditionalsConfigurations;
}

- (FCNewsPersonalizationTrainingConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)FCNewsPersonalizationTrainingConfiguration;
  v5 = [(FCNewsPersonalizationTrainingConfiguration *)&v34 init];
  if (!v5) {
    goto LABEL_14;
  }
  v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"eventConditionals", 0);
  v7 = [[FCNewsPersonalizationEventConditionalsConfigurations alloc] initWithDictionary:v6];
  eventConditionalsConfigurations = v5->_eventConditionalsConfigurations;
  v5->_eventConditionalsConfigurations = v7;

  v9 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"aggregateModificationConfigurations", 0);
  v10 = [[FCNewsPersonalizationAggregateModificationConfigurations alloc] initWithDictionary:v9];
  aggregateModificationConfigurations = v5->_aggregateModificationConfigurations;
  v5->_aggregateModificationConfigurations = v10;

  v12 = FCAppConfigurationNumberValue(v4, @"decayRate", 0);
  v13 = v12;
  if (v12)
  {
    [v12 doubleValue];
    v5->_decayRate = v14;
    v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"featurePriors", 0);
    v16 = [[FCNewsPersonalizationFeaturePriorsConfiguration alloc] initWithDictionary:v15];
    if (v16)
    {
      objc_storeStrong((id *)&v5->_priorsConfiguration, v16);
      v17 = [FCNewsPersonalizationTrainingBiases alloc];
      v18 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"biases", 0);
      uint64_t v19 = [(FCNewsPersonalizationTrainingBiases *)v17 initWithBiases:v18];
      biases = v5->_biases;
      v5->_biases = (FCNewsPersonalizationTrainingBiases *)v19;

      v21 = [FCNewsPersonalizationTrainingFeatureFlags alloc];
      v22 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"featureFlags", 0);
      uint64_t v23 = [(FCNewsPersonalizationTrainingFeatureFlags *)v21 initWithDictionary:v22];
      featureFlags = v5->_featureFlags;
      v5->_featureFlags = (FCNewsPersonalizationTrainingFeatureFlags *)v23;

      v25 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"legacyBridgeConfiguration", 0);
      v26 = [[FCNewsPersonalizationTrainingLegacyBridgeConfiguration alloc] initWithDictionary:v25];
      legacyBridgeConfiguration = v5->_legacyBridgeConfiguration;
      v5->_legacyBridgeConfiguration = v26;

      if (!NFInternalBuild()) {
        goto LABEL_8;
      }
      v28 = NewsCoreUserDefaults();
      int v29 = [v28 BOOLForKey:@"news.news_personalization.enable_training_configuration_override"];

      if (v29)
      {
        v30 = NewsCoreUserDefaults();
        v5->_disableTrainingLegacyAggregates = [v30 BOOLForKey:@"news.news_personalization.disable_training_legacy_aggregates"];
      }
      else
      {
LABEL_8:
        v5->_disableTrainingLegacyAggregates = FCAppConfigurationBoolValue(v4, @"disableTrainingLegacyAggregates", 0);
      }

      int v31 = 0;
    }
    else
    {
      int v31 = 1;
    }
  }
  else
  {
    int v31 = 1;
  }

  if (v31) {
    v32 = 0;
  }
  else {
LABEL_14:
  }
    v32 = v5;

  return v32;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyBridgeConfiguration, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_biases, 0);
  objc_storeStrong((id *)&self->_priorsConfiguration, 0);
  objc_storeStrong((id *)&self->_aggregateModificationConfigurations, 0);
  objc_storeStrong((id *)&self->_eventConditionalsConfigurations, 0);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationTrainingConfiguration *)self eventConditionalsConfigurations];
  [v3 appendFormat:@"; eventConditionalsConfigurations: %@", v4];

  v5 = [(FCNewsPersonalizationTrainingConfiguration *)self aggregateModificationConfigurations];
  [v3 appendFormat:@"; aggregateModificationConfigurations: %@", v5];

  [(FCNewsPersonalizationTrainingConfiguration *)self decayRate];
  objc_msgSend(v3, "appendFormat:", @"; decayRate: %f", v6);
  v7 = [(FCNewsPersonalizationTrainingConfiguration *)self priorsConfiguration];
  [v3 appendFormat:@"; priorsConfiguration: %@", v7];

  v8 = [(FCNewsPersonalizationTrainingConfiguration *)self biases];
  [v3 appendFormat:@"; biases: %@", v8];

  v9 = [(FCNewsPersonalizationTrainingConfiguration *)self featureFlags];
  [v3 appendFormat:@"; featureFlags: %@", v9];

  v10 = [(FCNewsPersonalizationTrainingConfiguration *)self legacyBridgeConfiguration];
  [v3 appendFormat:@"; legacyBridgeConfiguration: %@", v10];

  objc_msgSend(v3, "appendFormat:", @"; disableTrainingLegacyAggregates: %d",
    [(FCNewsPersonalizationTrainingConfiguration *)self disableTrainingLegacyAggregates]);
  [v3 appendString:@">"];
  return v3;
}

- (void)setEventConditionalsConfigurations:(id)a3
{
}

- (FCNewsPersonalizationAggregateModificationConfigurations)aggregateModificationConfigurations
{
  return self->_aggregateModificationConfigurations;
}

- (void)setAggregateModificationConfigurations:(id)a3
{
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (void)setPriorsConfiguration:(id)a3
{
}

- (FCNewsPersonalizationTrainingBiases)biases
{
  return self->_biases;
}

- (void)setBiases:(id)a3
{
}

- (void)setFeatureFlags:(id)a3
{
}

- (void)setLegacyBridgeConfiguration:(id)a3
{
}

- (BOOL)disableTrainingLegacyAggregates
{
  return self->_disableTrainingLegacyAggregates;
}

- (void)setDisableTrainingLegacyAggregates:(BOOL)a3
{
  self->_disableTrainingLegacyAggregates = a3;
}

@end