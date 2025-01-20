@interface NUArticleResourceURLTranslator
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (NUArticleResourceURLTranslator)initWithAppConfigurationManager:(id)a3;
- (id)defaultURLForEndpoint:(int64_t)a3;
- (id)translateFileURLForURL:(id)a3;
- (int64_t)endpointForScheme:(id)a3;
@end

@implementation NUArticleResourceURLTranslator

- (NUArticleResourceURLTranslator)initWithAppConfigurationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUArticleResourceURLTranslator;
  v6 = [(NUArticleResourceURLTranslator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);
  }

  return v7;
}

- (id)translateFileURLForURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 scheme];
  int64_t v6 = [(NUArticleResourceURLTranslator *)self endpointForScheme:v5];

  v7 = [(NUArticleResourceURLTranslator *)self appConfigurationManager];
  v8 = [v7 appConfiguration];

  objc_super v9 = [v8 endpointConfigsByEnvironment];
  v10 = [NSNumber numberWithUnsignedInteger:FCDefaultsReadEndpointEnvironment()];
  v11 = [v9 objectForKey:v10];

  if (v6 == 2)
  {
    uint64_t v12 = [v11 remoteDataSourceBaseURLString];
  }
  else
  {
    if (v6 != 1)
    {
LABEL_6:
      v13 = [(NUArticleResourceURLTranslator *)self defaultURLForEndpoint:v6];
      goto LABEL_7;
    }
    uint64_t v12 = [v11 staticAssetBaseURLString];
  }
  v13 = (void *)v12;
  if (!v12) {
    goto LABEL_6;
  }
LABEL_7:
  v14 = [MEMORY[0x263F08BA0] componentsWithString:v13];
  v15 = NSString;
  v16 = [v4 host];
  v17 = [v15 stringWithFormat:@"/%@", v16];

  uint64_t v18 = [v4 path];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v4 path];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      v22 = [v4 path];
      uint64_t v23 = [v17 stringByAppendingString:v22];

      v17 = (void *)v23;
    }
  }
  [v14 setPath:v17];
  v24 = [v14 URL];

  return v24;
}

- (int64_t)endpointForScheme:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"news-static-asset"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"news-remote-data"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)defaultURLForEndpoint:(int64_t)a3
{
  if (a3 == 1)
  {
    unint64_t v3 = FCDefaultsReadEndpointEnvironment() - 1;
    if (v3 < 6)
    {
      int64_t v4 = off_2645FEED0;
      return v4[v3];
    }
  }
  else if (a3 == 2)
  {
    unint64_t v3 = FCDefaultsReadEndpointEnvironment() - 1;
    if (v3 < 6)
    {
      int64_t v4 = off_2645FEEA0;
      return v4[v3];
    }
  }
  return 0;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void).cxx_destruct
{
}

@end