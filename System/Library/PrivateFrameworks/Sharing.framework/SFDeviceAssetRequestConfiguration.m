@interface SFDeviceAssetRequestConfiguration
- (SFDeviceAssetRequestConfiguration)initWithQueryResultHandler:(id)a3;
- (double)timeout;
- (id)description;
- (id)downloadCompletionHandler;
- (id)queryResultHandler;
- (void)setDownloadCompletionHandler:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation SFDeviceAssetRequestConfiguration

- (SFDeviceAssetRequestConfiguration)initWithQueryResultHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDeviceAssetRequestConfiguration;
  v5 = [(SFDeviceAssetRequestConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id queryResultHandler = v5->_queryResultHandler;
    v5->_id queryResultHandler = (id)v6;
  }
  return v5;
}

- (id)description
{
  uint64_t v12 = objc_opt_class();
  NSAppendPrintF();
  id v3 = 0;
  [(SFDeviceAssetRequestConfiguration *)self timeout];
  if (fabs(v4) >= 0.00000011920929)
  {
    [(SFDeviceAssetRequestConfiguration *)self timeout];
    uint64_t v13 = v5;
    NSAppendPrintF();
    id v6 = v3;

    id v3 = v6;
  }
  v7 = [(SFDeviceAssetRequestConfiguration *)self downloadCompletionHandler];

  if (v7)
  {
    v8 = [(SFDeviceAssetRequestConfiguration *)self downloadCompletionHandler];
    NSAppendPrintF();
    id v9 = v3;

    id v3 = v9;
  }
  NSAppendPrintF();
  id v10 = v3;

  return v10;
}

- (id)queryResultHandler
{
  return self->_queryResultHandler;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (id)downloadCompletionHandler
{
  return self->_downloadCompletionHandler;
}

- (void)setDownloadCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_downloadCompletionHandler, 0);

  objc_storeStrong(&self->_queryResultHandler, 0);
}

@end