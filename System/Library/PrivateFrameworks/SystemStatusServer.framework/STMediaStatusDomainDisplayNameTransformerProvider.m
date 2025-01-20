@interface STMediaStatusDomainDisplayNameTransformerProvider
- (NSArray)dynamicAttributions;
- (STMediaStatusDomainDisplayNameTransformerProvider)init;
- (id)dataTransformerForClient:(id)a3;
- (void)setDynamicAttributions:(id)a3;
@end

@implementation STMediaStatusDomainDisplayNameTransformerProvider

- (id)dataTransformerForClient:(id)a3
{
  v4 = [a3 preferredLocalizations];
  if (self) {
    transformersByLocalization = self->_transformersByLocalization;
  }
  else {
    transformersByLocalization = 0;
  }
  v6 = transformersByLocalization;
  v7 = [(NSMutableDictionary *)v6 objectForKey:v4];
  if (!v7)
  {
    v8 = [[STAttributedEntityResolver alloc] initWithPreferredLocalizations:v4];
    v9 = [(STMediaStatusDomainDisplayNameTransformerProvider *)self dynamicAttributions];
    [(STAttributedEntityResolver *)v8 setDynamicAttributions:v9];

    if (self) {
      entityResolversByLocalization = self->_entityResolversByLocalization;
    }
    else {
      entityResolversByLocalization = 0;
    }
    [(NSMutableDictionary *)entityResolversByLocalization setObject:v8 forKey:v4];
    v11 = [STMediaStatusDomainDisplayNameTransformer alloc];
    v12 = [(STAttributedEntityResolver *)v8 beginBatchResolutionSession];
    v7 = [(STMediaStatusDomainDisplayNameTransformer *)v11 initWithEntityResolver:v12];

    if (self) {
      v13 = self->_transformersByLocalization;
    }
    else {
      v13 = 0;
    }
    [(NSMutableDictionary *)v13 setObject:v7 forKey:v4];
  }
  return v7;
}

- (STMediaStatusDomainDisplayNameTransformerProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)STMediaStatusDomainDisplayNameTransformerProvider;
  v2 = [(STMediaStatusDomainDisplayNameTransformerProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    entityResolversByLocalization = v2->_entityResolversByLocalization;
    v2->_entityResolversByLocalization = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    transformersByLocalization = v2->_transformersByLocalization;
    v2->_transformersByLocalization = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (void)setDynamicAttributions:(id)a3
{
  id v4 = a3;
  if (![(NSArray *)self->_dynamicAttributions isEqualToArray:v4])
  {
    uint64_t v5 = (NSArray *)[v4 copy];
    dynamicAttributions = self->_dynamicAttributions;
    self->_dynamicAttributions = v5;

    entityResolversByLocalization = self->_entityResolversByLocalization;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__STMediaStatusDomainDisplayNameTransformerProvider_setDynamicAttributions___block_invoke;
    v8[3] = &unk_1E6AD29D8;
    id v9 = v4;
    [(NSMutableDictionary *)entityResolversByLocalization enumerateKeysAndObjectsUsingBlock:v8];
  }
}

uint64_t __76__STMediaStatusDomainDisplayNameTransformerProvider_setDynamicAttributions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setDynamicAttributions:*(void *)(a1 + 32)];
}

- (NSArray)dynamicAttributions
{
  return self->_dynamicAttributions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformersByLocalization, 0);
  objc_storeStrong((id *)&self->_entityResolversByLocalization, 0);
  objc_storeStrong((id *)&self->_dynamicAttributions, 0);
}

@end