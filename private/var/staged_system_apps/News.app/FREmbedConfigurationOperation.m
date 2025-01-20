@interface FREmbedConfigurationOperation
- (FCFlintResourceManager)resourceManager;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (FREmbedConfigurationOperation)initWithAppConfigManager:(id)a3 andResourceManager:(id)a4;
- (NSData)embedConfigurationData;
- (NSString)embedConfigurationIdentifier;
- (id)embedFetchCompletionBlock;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)setAppConfigurationManager:(id)a3;
- (void)setEmbedConfigurationData:(id)a3;
- (void)setEmbedConfigurationIdentifier:(id)a3;
- (void)setEmbedFetchCompletionBlock:(id)a3;
- (void)setResourceManager:(id)a3;
@end

@implementation FREmbedConfigurationOperation

- (FREmbedConfigurationOperation)initWithAppConfigManager:(id)a3 andResourceManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FREmbedConfigurationOperation;
  v9 = [(FREmbedConfigurationOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_resourceManager, a4);
  }

  return v10;
}

- (void)performOperation
{
  v3 = [(FREmbedConfigurationOperation *)self appConfigurationManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001B168;
  v4[3] = &unk_1000C5770;
  v4[4] = self;
  [v3 fetchAppConfigurationIfNeededWithCompletion:v4];
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4 = a3;
  id v7 = [(FREmbedConfigurationOperation *)self embedFetchCompletionBlock];
  v5 = [(FREmbedConfigurationOperation *)self embedConfigurationData];
  v6 = [(FREmbedConfigurationOperation *)self embedConfigurationIdentifier];
  v7[2](v7, v5, v6, v4);
}

- (id)embedFetchCompletionBlock
{
  return self->_embedFetchCompletionBlock;
}

- (void)setEmbedFetchCompletionBlock:(id)a3
{
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void)setAppConfigurationManager:(id)a3
{
}

- (FCFlintResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (void)setResourceManager:(id)a3
{
}

- (NSData)embedConfigurationData
{
  return self->_embedConfigurationData;
}

- (void)setEmbedConfigurationData:(id)a3
{
}

- (NSString)embedConfigurationIdentifier
{
  return self->_embedConfigurationIdentifier;
}

- (void)setEmbedConfigurationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embedConfigurationIdentifier, 0);
  objc_storeStrong((id *)&self->_embedConfigurationData, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);

  objc_storeStrong(&self->_embedFetchCompletionBlock, 0);
}

@end