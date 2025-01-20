@interface NUANFRenderingConfigurationProvider
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (NUANFRenderingConfigurationProvider)initWithAppConfigurationManager:(id)a3;
- (SXRenderingConfiguration)configuration;
@end

@implementation NUANFRenderingConfigurationProvider

- (NUANFRenderingConfigurationProvider)initWithAppConfigurationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUANFRenderingConfigurationProvider;
  v6 = [(NUANFRenderingConfigurationProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);
  }

  return v7;
}

- (SXRenderingConfiguration)configuration
{
  configuration = self->_configuration;
  if (!configuration)
  {
    v4 = [(FCNewsAppConfigurationManager *)self->_appConfigurationManager possiblyUnfetchedAppConfiguration];
    id v5 = [v4 anfRenderingConfiguration];

    id v12 = 0;
    v6 = objc_msgSend(NSDictionary, "fc_dictionaryFromJSON:error:", v5, &v12);
    id v7 = v12;
    if (!v7 && v6)
    {
      id v8 = objc_alloc(MEMORY[0x263F6C640]);
      objc_super v9 = (SXRenderingConfiguration *)[v8 initWithJSONObject:v6 andVersion:*MEMORY[0x263F6C678]];
      v10 = self->_configuration;
      self->_configuration = v9;
    }
    configuration = self->_configuration;
  }

  return configuration;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end