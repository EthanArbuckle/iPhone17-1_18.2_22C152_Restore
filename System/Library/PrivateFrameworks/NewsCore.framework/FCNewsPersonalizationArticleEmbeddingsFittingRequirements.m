@interface FCNewsPersonalizationArticleEmbeddingsFittingRequirements
- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)init;
- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)initWithDictionary:(id)a3;
- (NSNumber)maximumNumberOfEmbeddings;
- (NSNumber)minimumDuration;
- (NSNumber)minimumNumberOfEmbeddings;
- (id)description;
- (void)setMaximumNumberOfEmbeddings:(id)a3;
- (void)setMinimumDuration:(id)a3;
- (void)setMinimumNumberOfEmbeddings:(id)a3;
@end

@implementation FCNewsPersonalizationArticleEmbeddingsFittingRequirements

- (NSNumber)minimumNumberOfEmbeddings
{
  return self->_minimumNumberOfEmbeddings;
}

- (NSNumber)minimumDuration
{
  return self->_minimumDuration;
}

- (NSNumber)maximumNumberOfEmbeddings
{
  return self->_maximumNumberOfEmbeddings;
}

- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCNewsPersonalizationArticleEmbeddingsFittingRequirements;
  v5 = [(FCNewsPersonalizationArticleEmbeddingsFittingRequirements *)&v13 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationNumberValue(v4, @"minimumNumberOfEmbeddings", 0);
    minimumNumberOfEmbeddings = v5->_minimumNumberOfEmbeddings;
    v5->_minimumNumberOfEmbeddings = (NSNumber *)v6;

    uint64_t v8 = FCAppConfigurationNumberValue(v4, @"maximumNumberOfEmbeddings", 0);
    maximumNumberOfEmbeddings = v5->_maximumNumberOfEmbeddings;
    v5->_maximumNumberOfEmbeddings = (NSNumber *)v8;

    uint64_t v10 = FCAppConfigurationNumberValue(v4, @"minimumDuration", 0);
    minimumDuration = v5->_minimumDuration;
    v5->_minimumDuration = (NSNumber *)v10;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumDuration, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfEmbeddings, 0);
  objc_storeStrong((id *)&self->_minimumNumberOfEmbeddings, 0);
}

- (FCNewsPersonalizationArticleEmbeddingsFittingRequirements)init
{
  return [(FCNewsPersonalizationArticleEmbeddingsFittingRequirements *)self initWithDictionary:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(FCNewsPersonalizationArticleEmbeddingsFittingRequirements *)self minimumNumberOfEmbeddings];
  [v3 appendFormat:@"; minimumNumberOfEmbeddings: %@", v4];

  v5 = [(FCNewsPersonalizationArticleEmbeddingsFittingRequirements *)self maximumNumberOfEmbeddings];
  [v3 appendFormat:@"; maximumNumberOfEmbeddings: %@", v5];

  uint64_t v6 = [(FCNewsPersonalizationArticleEmbeddingsFittingRequirements *)self minimumDuration];
  [v3 appendFormat:@"; minimumDuration: %@", v6];

  [v3 appendString:@">"];
  return v3;
}

- (void)setMinimumNumberOfEmbeddings:(id)a3
{
}

- (void)setMaximumNumberOfEmbeddings:(id)a3
{
}

- (void)setMinimumDuration:(id)a3
{
}

@end