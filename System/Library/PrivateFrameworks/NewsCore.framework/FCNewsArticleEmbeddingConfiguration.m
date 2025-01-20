@interface FCNewsArticleEmbeddingConfiguration
- (BOOL)shouldFetch;
- (BOOL)shouldPersist;
- (FCNewsArticleEmbeddingConfiguration)init;
- (FCNewsArticleEmbeddingConfiguration)initWithDictionary:(id)a3;
- (id)description;
- (void)setShouldFetch:(BOOL)a3;
- (void)setShouldPersist:(BOOL)a3;
@end

@implementation FCNewsArticleEmbeddingConfiguration

- (BOOL)shouldPersist
{
  return self->_shouldPersist;
}

- (FCNewsArticleEmbeddingConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FCNewsArticleEmbeddingConfiguration;
  v5 = [(FCNewsArticleEmbeddingConfiguration *)&v7 init];
  if (v5)
  {
    v5->_shouldFetch = FCAppConfigurationBoolValue(v4, @"fetch", 0);
    v5->_shouldPersist = FCAppConfigurationBoolValue(v4, @"persist", 0);
  }

  return v5;
}

- (BOOL)shouldFetch
{
  return self->_shouldFetch;
}

- (FCNewsArticleEmbeddingConfiguration)init
{
  return [(FCNewsArticleEmbeddingConfiguration *)self initWithDictionary:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; shouldFetch: %d",
    [(FCNewsArticleEmbeddingConfiguration *)self shouldFetch]);
  objc_msgSend(v3, "appendFormat:", @"; shouldPersist: %d",
    [(FCNewsArticleEmbeddingConfiguration *)self shouldPersist]);
  [v3 appendString:@">"];
  return v3;
}

- (void)setShouldFetch:(BOOL)a3
{
  self->_shouldFetch = a3;
}

- (void)setShouldPersist:(BOOL)a3
{
  self->_shouldPersist = a3;
}

@end