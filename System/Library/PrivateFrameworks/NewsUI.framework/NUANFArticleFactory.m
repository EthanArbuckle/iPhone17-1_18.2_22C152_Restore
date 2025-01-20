@interface NUANFArticleFactory
- (FCArticleController)articleController;
- (NUANFArticleFactory)initWithArticleController:(id)a3;
- (id)createArticleForHeadline:(id)a3;
- (id)createArticlesForArticleIDs:(id)a3;
- (int64_t)qualityOfService;
- (int64_t)relativePriority;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRelativePriority:(int64_t)a3;
@end

@implementation NUANFArticleFactory

- (NUANFArticleFactory)initWithArticleController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUANFArticleFactory;
  v6 = [(NUANFArticleFactory *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_articleController, a3);
    *(_OWORD *)&v7->_qualityOfService = xmmword_2222017C0;
  }

  return v7;
}

- (id)createArticleForHeadline:(id)a3
{
  id v4 = a3;
  id v5 = [(NUANFArticleFactory *)self articleController];
  v6 = [v5 articleWithHeadline:v4];

  return v6;
}

- (FCArticleController)articleController
{
  return self->_articleController;
}

- (id)createArticlesForArticleIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(NUANFArticleFactory *)self articleController];
        v13 = objc_msgSend(v12, "articleWithID:forceArticleUpdate:qualityOfService:relativePriority:", v11, 0, -[NUANFArticleFactory qualityOfService](self, "qualityOfService"), -[NUANFArticleFactory relativePriority](self, "relativePriority"));

        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (void)setRelativePriority:(int64_t)a3
{
  self->_relativePriority = a3;
}

- (void).cxx_destruct
{
}

@end