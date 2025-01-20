@interface FRFlintDataProviderFactory
- (FCCloudContext)cloudContext;
- (FCFlintResourceManager)resourceManager;
- (FRFlintDataProviderFactory)initWithCloudContext:(id)a3 resourceManager:(id)a4 embedConfigurationManager:(id)a5;
- (FRFlintEmbedConfigurationManager)embedConfigurationManager;
- (id)flintDataProviderForANFContent:(id)a3 headline:(id)a4;
@end

@implementation FRFlintDataProviderFactory

- (FRFlintDataProviderFactory)initWithCloudContext:(id)a3 resourceManager:(id)a4 embedConfigurationManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FRFlintDataProviderFactory;
  v12 = [(FRFlintDataProviderFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cloudContext, a3);
    objc_storeStrong((id *)&v13->_resourceManager, a4);
    objc_storeStrong((id *)&v13->_embedConfigurationManager, a5);
  }

  return v13;
}

- (id)flintDataProviderForANFContent:(id)a3 headline:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [FRFlintDataProvider alloc];
  id v9 = [(FRFlintDataProviderFactory *)self resourceManager];
  id v10 = [(FRFlintDataProviderFactory *)self cloudContext];
  id v11 = [(FRFlintDataProviderFactory *)self embedConfigurationManager];
  v12 = [(FRFlintDataProvider *)v8 initWithANFContent:v7 headline:v6 resourceManager:v9 cloudContext:v10 embedConfigurationManager:v11];

  return v12;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (FCFlintResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (FRFlintEmbedConfigurationManager)embedConfigurationManager
{
  return self->_embedConfigurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedConfigurationManager, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);

  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end