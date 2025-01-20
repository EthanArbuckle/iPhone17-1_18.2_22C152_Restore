@interface NUANFArticleDataProviderFactory
- (FCContentContext)contentContext;
- (NUANFArticleDataProviderFactory)initWithContentContext:(id)a3 fontRegistration:(id)a4 host:(id)a5 embedDataManager:(id)a6 linkedContentManagerFactory:(id)a7;
- (NUEmbedDataManager)embedDataManager;
- (NUFontRegistration)fontRegistration;
- (NULinkedContentManagerFactory)linkedContentManagerFactory;
- (SXHost)host;
- (id)createArticleDataProviderWithArticle:(id)a3;
@end

@implementation NUANFArticleDataProviderFactory

- (NUANFArticleDataProviderFactory)initWithContentContext:(id)a3 fontRegistration:(id)a4 host:(id)a5 embedDataManager:(id)a6 linkedContentManagerFactory:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)NUANFArticleDataProviderFactory;
  v17 = [(NUANFArticleDataProviderFactory *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentContext, a3);
    objc_storeStrong((id *)&v18->_fontRegistration, a4);
    objc_storeStrong((id *)&v18->_host, a5);
    objc_storeStrong((id *)&v18->_embedDataManager, a6);
    objc_storeStrong((id *)&v18->_linkedContentManagerFactory, a7);
  }

  return v18;
}

- (id)createArticleDataProviderWithArticle:(id)a3
{
  id v4 = a3;
  v5 = [(NUANFArticleDataProviderFactory *)self linkedContentManagerFactory];
  v6 = [v5 createLinkedContentManagerForArticle:v4];

  v7 = [v4 headline];
  int v8 = [v7 isLocalDraft];

  if (v8)
  {
    v9 = [NUBundledArticleDataProvider alloc];
    v10 = [(NUANFArticleDataProviderFactory *)self embedDataManager];
    v11 = [(NUBundledArticleDataProvider *)v9 initWithArticle:v4 embedDataManager:v10 linkedContentManager:v6];
  }
  else
  {
    v12 = [NUANFArticleDataProvider alloc];
    v10 = [(NUANFArticleDataProviderFactory *)self contentContext];
    id v13 = [(NUANFArticleDataProviderFactory *)self fontRegistration];
    id v14 = [(NUANFArticleDataProviderFactory *)self host];
    id v15 = [(NUANFArticleDataProviderFactory *)self embedDataManager];
    v11 = [(NUANFArticleDataProvider *)v12 initWithArticle:v4 contentContext:v10 fontRegistration:v13 host:v14 embedDataManager:v15 linkedContentManager:v6];
  }

  return v11;
}

- (NULinkedContentManagerFactory)linkedContentManagerFactory
{
  return self->_linkedContentManagerFactory;
}

- (SXHost)host
{
  return self->_host;
}

- (NUFontRegistration)fontRegistration
{
  return self->_fontRegistration;
}

- (NUEmbedDataManager)embedDataManager
{
  return self->_embedDataManager;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedContentManagerFactory, 0);
  objc_storeStrong((id *)&self->_embedDataManager, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_fontRegistration, 0);

  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end