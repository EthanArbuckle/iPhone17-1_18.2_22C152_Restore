@interface NUEmbedDataManager
- (BOOL)hasLoaded;
- (NUEmbedConfigurationLoader)embedConfigurationLoader;
- (NUEmbedDataManager)initWithEmbedConfigurationLoader:(id)a3;
- (SXJSONDictionary)embedConfiguration;
- (id)embedForType:(id)a3;
- (void)loadEmbedDataWithCompletion:(id)a3;
- (void)setEmbedConfiguration:(id)a3;
@end

@implementation NUEmbedDataManager

- (void)loadEmbedDataWithCompletion:(id)a3
{
  id v6 = a3;
  v4 = [(NUEmbedDataManager *)self embedConfigurationLoader];
  id v5 = (id)[v4 loadEmbededConfigurationWithCompletion:v6];
}

- (NUEmbedConfigurationLoader)embedConfigurationLoader
{
  return self->_embedConfigurationLoader;
}

- (NUEmbedDataManager)initWithEmbedConfigurationLoader:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUEmbedDataManager;
  id v6 = [(NUEmbedDataManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_embedConfigurationLoader, a3);
  }

  return v7;
}

- (id)embedForType:(id)a3
{
  id v4 = a3;
  id v5 = [(NUEmbedDataManager *)self embedConfigurationLoader];
  id v6 = [v5 embedConfiguration];
  v7 = [v6 objectForKey:v4];

  return v7;
}

- (BOOL)hasLoaded
{
  return self->_hasLoaded;
}

- (SXJSONDictionary)embedConfiguration
{
  return self->_embedConfiguration;
}

- (void)setEmbedConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedConfiguration, 0);

  objc_storeStrong((id *)&self->_embedConfigurationLoader, 0);
}

@end