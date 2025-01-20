@interface FCPurchaseLookupFetchOperationResult
- (FCPurchaseLookupFetchOperationResult)initWithChannelIDsByPurchaseID:(id)a3 bundleChannelIDsByPurchaseID:(id)a4 bundleChannelIDsVersion:(id)a5 error:(id)a6;
- (NSDictionary)bundleChannelIDsByPurchaseID;
- (NSDictionary)channelIDsByPurchaseID;
- (NSError)error;
- (NSString)bundleChannelIDsVersion;
- (void)setBundleChannelIDsByPurchaseID:(id)a3;
- (void)setBundleChannelIDsVersion:(id)a3;
- (void)setChannelIDsByPurchaseID:(id)a3;
- (void)setError:(id)a3;
@end

@implementation FCPurchaseLookupFetchOperationResult

- (NSString)bundleChannelIDsVersion
{
  return self->_bundleChannelIDsVersion;
}

- (NSDictionary)bundleChannelIDsByPurchaseID
{
  return self->_bundleChannelIDsByPurchaseID;
}

- (FCPurchaseLookupFetchOperationResult)initWithChannelIDsByPurchaseID:(id)a3 bundleChannelIDsByPurchaseID:(id)a4 bundleChannelIDsVersion:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FCPurchaseLookupFetchOperationResult;
  v14 = [(FCPurchaseLookupFetchOperationResult *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    channelIDsByPurchaseID = v14->_channelIDsByPurchaseID;
    v14->_channelIDsByPurchaseID = (NSDictionary *)v15;

    uint64_t v17 = [v11 copy];
    bundleChannelIDsByPurchaseID = v14->_bundleChannelIDsByPurchaseID;
    v14->_bundleChannelIDsByPurchaseID = (NSDictionary *)v17;

    uint64_t v19 = [v12 copy];
    bundleChannelIDsVersion = v14->_bundleChannelIDsVersion;
    v14->_bundleChannelIDsVersion = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    error = v14->_error;
    v14->_error = (NSError *)v21;
  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsVersion, 0);
  objc_storeStrong((id *)&self->_bundleChannelIDsByPurchaseID, 0);
  objc_storeStrong((id *)&self->_channelIDsByPurchaseID, 0);
}

- (NSDictionary)channelIDsByPurchaseID
{
  return self->_channelIDsByPurchaseID;
}

- (void)setChannelIDsByPurchaseID:(id)a3
{
}

- (void)setBundleChannelIDsByPurchaseID:(id)a3
{
}

- (void)setBundleChannelIDsVersion:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

@end