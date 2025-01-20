@interface NULinkedContentManagerFactory
- (NSMutableArray)factories;
- (NULinkedContentManagerFactory)init;
- (id)createLinkedContentManagerForArticle:(id)a3;
- (void)addLinkedContentProviderFactory:(id)a3;
@end

@implementation NULinkedContentManagerFactory

- (void)addLinkedContentProviderFactory:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_factories, "addObject:");
  }
}

- (id)createLinkedContentManagerForArticle:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = (void *)[(NSMutableArray *)self->_factories copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) createLinkedContentProviderForArticle:v4];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = [[NULinkedContentManager alloc] initWithLinkedContentProviders:v5];

  return v12;
}

- (NULinkedContentManagerFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)NULinkedContentManagerFactory;
  v2 = [(NULinkedContentManagerFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    factories = v2->_factories;
    v2->_factories = (NSMutableArray *)v3;
  }
  return v2;
}

- (NSMutableArray)factories
{
  return self->_factories;
}

- (void).cxx_destruct
{
}

@end