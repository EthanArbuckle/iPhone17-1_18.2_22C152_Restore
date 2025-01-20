@interface FCNewsPersonalizationArticleEmbeddingsFittingConfiguration
- (BOOL)haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession;
- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)init;
- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)initWithDictionary:(id)a3;
- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)articleReadRequirements;
- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)articleSeenRequirements;
- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)logisticRegressionClassifierConfiguration;
- (NSNumber)maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings;
- (double)earliestAllowedEmbeddingEventTimestamp;
- (id)description;
- (int64_t)embeddingType;
- (void)setArticleReadRequirements:(id)a3;
- (void)setArticleSeenRequirements:(id)a3;
- (void)setEarliestAllowedEmbeddingEventTimestamp:(double)a3;
- (void)setEmbeddingType:(int64_t)a3;
- (void)setHaltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession:(BOOL)a3;
- (void)setLogisticRegressionClassifierConfiguration:(id)a3;
@end

@implementation FCNewsPersonalizationArticleEmbeddingsFittingConfiguration

- (int64_t)embeddingType
{
  return self->_embeddingType;
}

- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FCNewsPersonalizationArticleEmbeddingsFittingConfiguration;
  v5 = [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)&v21 init];
  if (v5)
  {
    v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleReadRequirements", 0);
    v7 = [[FCNewsPersonalizationArticleEmbeddingsFittingRequirements alloc] initWithDictionary:v6];
    articleReadRequirements = v5->_articleReadRequirements;
    v5->_articleReadRequirements = v7;

    v9 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"articleSeenRequirements", 0);
    v10 = [[FCNewsPersonalizationArticleEmbeddingsFittingRequirements alloc] initWithDictionary:v9];
    articleSeenRequirements = v5->_articleSeenRequirements;
    v5->_articleSeenRequirements = v10;

    uint64_t v12 = FCAppConfigurationNumberValue(v4, @"maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings", &unk_1EF8D7E60);
    maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings = v5->_maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings;
    v5->_maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings = (NSNumber *)v12;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __81__FCNewsPersonalizationArticleEmbeddingsFittingConfiguration_initWithDictionary___block_invoke;
    v19[3] = &unk_1E5B53FE0;
    id v14 = v4;
    id v20 = v14;
    v5->_embeddingType = __81__FCNewsPersonalizationArticleEmbeddingsFittingConfiguration_initWithDictionary___block_invoke((uint64_t)v19);
    v15 = FCAppConfigurationDictionaryValueWithDefaultValue(v14, @"logisticRegressionClassifierConfiguration", 0);
    v16 = [[FCNewsPersonalizationLogisticRegressionClassifierConfiguration alloc] initWithDictionary:v15];
    logisticRegressionClassifierConfiguration = v5->_logisticRegressionClassifierConfiguration;
    v5->_logisticRegressionClassifierConfiguration = v16;

    v5->_earliestAllowedEmbeddingEventTimestamp = FCAppConfigurationDoubleValue(v14, @"earliestAllowedEmbeddingEventTimestamp", 0.0);
    v5->_haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession = FCAppConfigurationBoolValue(v14, @"haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession", 1);
  }
  return v5;
}

uint64_t __81__FCNewsPersonalizationArticleEmbeddingsFittingConfiguration_initWithDictionary___block_invoke(uint64_t a1)
{
  v1 = FCAppConfigurationStringValue(*(void **)(a1 + 32), @"embeddingType", @"title");
  uint64_t v2 = [v1 isEqualToString:@"body"];

  return v2;
}

- (NSNumber)maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings
{
  return self->_maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings;
}

- (FCNewsPersonalizationLogisticRegressionClassifierConfiguration)logisticRegressionClassifierConfiguration
{
  return self->_logisticRegressionClassifierConfiguration;
}

- (BOOL)haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession
{
  return self->_haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession;
}

- (double)earliestAllowedEmbeddingEventTimestamp
{
  return self->_earliestAllowedEmbeddingEventTimestamp;
}

- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)articleSeenRequirements
{
  return self->_articleSeenRequirements;
}

- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)articleReadRequirements
{
  return self->_articleReadRequirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logisticRegressionClassifierConfiguration, 0);
  objc_storeStrong((id *)&self->_maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings, 0);
  objc_storeStrong((id *)&self->_articleSeenRequirements, 0);
  objc_storeStrong((id *)&self->_articleReadRequirements, 0);
}

- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)init
{
  return [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)self initWithDictionary:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)self articleReadRequirements];
  [v3 appendFormat:@"; articleReadRequirements: %@", v4];

  v5 = [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)self articleSeenRequirements];
  [v3 appendFormat:@"; articleSeenRequirements: %@", v5];

  v6 = [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)self maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings];
  [v3 appendFormat:@"; maximumRatioOfArticleSeenEmbeddingsToArticleReadEmbeddings: %@", v6];

  int64_t v7 = [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)self embeddingType];
  v8 = @"title";
  if (v7 == 1) {
    v8 = @"body";
  }
  [v3 appendFormat:@"; embeddingType: %@", v8];
  v9 = [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)self logisticRegressionClassifierConfiguration];
  [v3 appendFormat:@"; logisticRegressionClassifierConfiguration: %@", v9];

  [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)self earliestAllowedEmbeddingEventTimestamp];
  objc_msgSend(v3, "appendFormat:", @"; earliestAllowedEmbeddingEventTimestamp: %f", v10);
  objc_msgSend(v3, "appendFormat:", @"; haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession: %d",
    [(FCNewsPersonalizationArticleEmbeddingsFittingConfiguration *)self haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession]);
  [v3 appendString:@">"];
  return v3;
}

- (void)setArticleReadRequirements:(id)a3
{
}

- (void)setArticleSeenRequirements:(id)a3
{
}

- (void)setEmbeddingType:(int64_t)a3
{
  self->_embeddingType = a3;
}

- (void)setLogisticRegressionClassifierConfiguration:(id)a3
{
}

- (void)setEarliestAllowedEmbeddingEventTimestamp:(double)a3
{
  self->_earliestAllowedEmbeddingEventTimestamp = a3;
}

- (void)setHaltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession:(BOOL)a3
{
  self->_haltEmbeddingProcessingAfterEncounteringNonMatchingEmbeddingsInSession = a3;
}

@end