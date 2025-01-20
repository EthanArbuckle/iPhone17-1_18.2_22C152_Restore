@interface FCNewsArticleEmbeddingsConfiguration
- (FCNewsArticleEmbeddingConfiguration)bodyEmbeddingConfiguration;
- (FCNewsArticleEmbeddingConfiguration)titleEmbeddingConfiguration;
- (FCNewsArticleEmbeddingsConfiguration)init;
- (FCNewsArticleEmbeddingsConfiguration)initWithDictionary:(id)a3;
- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)fittingConfiguration;
- (id)description;
- (int64_t)requiredDimensions;
- (void)setBodyEmbeddingConfiguration:(id)a3;
- (void)setFittingConfiguration:(id)a3;
- (void)setRequiredDimensions:(int64_t)a3;
- (void)setTitleEmbeddingConfiguration:(id)a3;
@end

@implementation FCNewsArticleEmbeddingsConfiguration

- (FCNewsPersonalizationArticleEmbeddingsFittingConfiguration)fittingConfiguration
{
  return self->_fittingConfiguration;
}

- (int64_t)requiredDimensions
{
  return self->_requiredDimensions;
}

- (FCNewsArticleEmbeddingsConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCNewsArticleEmbeddingsConfiguration;
  v5 = [(FCNewsArticleEmbeddingsConfiguration *)&v16 init];
  if (v5)
  {
    v6 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"titleEmbedding", 0);
    v7 = [[FCNewsArticleEmbeddingConfiguration alloc] initWithDictionary:v6];
    titleEmbeddingConfiguration = v5->_titleEmbeddingConfiguration;
    v5->_titleEmbeddingConfiguration = v7;

    v9 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"bodyEmbedding", 0);
    v10 = [[FCNewsArticleEmbeddingConfiguration alloc] initWithDictionary:v9];
    bodyEmbeddingConfiguration = v5->_bodyEmbeddingConfiguration;
    v5->_bodyEmbeddingConfiguration = v10;

    v12 = FCAppConfigurationDictionaryValueWithDefaultValue(v4, @"fittingConfiguration", 0);
    v13 = [[FCNewsPersonalizationArticleEmbeddingsFittingConfiguration alloc] initWithDictionary:v12];
    fittingConfiguration = v5->_fittingConfiguration;
    v5->_fittingConfiguration = v13;

    v5->_requiredDimensions = FCAppConfigurationIntegerValue(v4, @"requiredDimensions", 768);
  }

  return v5;
}

- (FCNewsArticleEmbeddingConfiguration)titleEmbeddingConfiguration
{
  return self->_titleEmbeddingConfiguration;
}

- (FCNewsArticleEmbeddingConfiguration)bodyEmbeddingConfiguration
{
  return self->_bodyEmbeddingConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fittingConfiguration, 0);
  objc_storeStrong((id *)&self->_bodyEmbeddingConfiguration, 0);
  objc_storeStrong((id *)&self->_titleEmbeddingConfiguration, 0);
}

- (FCNewsArticleEmbeddingsConfiguration)init
{
  return [(FCNewsArticleEmbeddingsConfiguration *)self initWithDictionary:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsArticleEmbeddingsConfiguration *)self titleEmbeddingConfiguration];
  [v3 appendFormat:@"; titleEmbeddingConfiguration: %@", v4];

  v5 = [(FCNewsArticleEmbeddingsConfiguration *)self bodyEmbeddingConfiguration];
  [v3 appendFormat:@"; bodyEmbeddingConfiguration: %@", v5];

  v6 = [(FCNewsArticleEmbeddingsConfiguration *)self fittingConfiguration];
  [v3 appendFormat:@"; fittingConfiguration: %@", v6];

  objc_msgSend(v3, "appendFormat:", @"; requiredDimensions: %llu",
    [(FCNewsArticleEmbeddingsConfiguration *)self requiredDimensions]);
  [v3 appendString:@">"];
  return v3;
}

- (void)setTitleEmbeddingConfiguration:(id)a3
{
}

- (void)setBodyEmbeddingConfiguration:(id)a3
{
}

- (void)setFittingConfiguration:(id)a3
{
}

- (void)setRequiredDimensions:(int64_t)a3
{
  self->_requiredDimensions = a3;
}

@end