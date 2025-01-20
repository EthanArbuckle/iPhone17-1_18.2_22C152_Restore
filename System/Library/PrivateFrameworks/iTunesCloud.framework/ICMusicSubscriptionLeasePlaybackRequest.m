@interface ICMusicSubscriptionLeasePlaybackRequest
- (BOOL)isFollowUp;
- (BOOL)isTriggeredByLeasePrevention;
- (BOOL)shouldPreventLeaseAcquisition;
- (BOOL)shouldRequireLeaseAcquisition;
- (ICMusicSubscriptionLeasePlaybackRequest)initWithRequestContext:(id)a3;
- (ICStoreRequestContext)requestContext;
- (NSString)assetSourceStorefrontID;
- (NSString)cloudUniversalLibraryID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)storePurchasedAdamID;
- (int64_t)storeSubscriptionAdamID;
- (unint64_t)storeCloudID;
- (void)setAssetSourceStorefrontID:(id)a3;
- (void)setCloudUniversalLibraryID:(id)a3;
- (void)setFollowUp:(BOOL)a3;
- (void)setShouldPreventLeaseAcquisition:(BOOL)a3;
- (void)setShouldRequireLeaseAcquisition:(BOOL)a3;
- (void)setStoreCloudID:(unint64_t)a3;
- (void)setStorePurchasedAdamID:(int64_t)a3;
- (void)setStoreSubscriptionAdamID:(int64_t)a3;
- (void)setTriggeredByLeasePrevention:(BOOL)a3;
@end

@implementation ICMusicSubscriptionLeasePlaybackRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);

  objc_storeStrong((id *)&self->_assetSourceStorefrontID, 0);
}

- (void)setFollowUp:(BOOL)a3
{
  self->_followUp = a3;
}

- (BOOL)isFollowUp
{
  return self->_followUp;
}

- (void)setTriggeredByLeasePrevention:(BOOL)a3
{
  self->_triggeredByLeasePrevention = a3;
}

- (BOOL)isTriggeredByLeasePrevention
{
  return self->_triggeredByLeasePrevention;
}

- (void)setShouldRequireLeaseAcquisition:(BOOL)a3
{
  self->_shouldRequireLeaseAcquisition = a3;
}

- (BOOL)shouldRequireLeaseAcquisition
{
  return self->_shouldRequireLeaseAcquisition;
}

- (void)setShouldPreventLeaseAcquisition:(BOOL)a3
{
  self->_shouldPreventLeaseAcquisition = a3;
}

- (BOOL)shouldPreventLeaseAcquisition
{
  return self->_shouldPreventLeaseAcquisition;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
}

- (NSString)cloudUniversalLibraryID
{
  return self->_cloudUniversalLibraryID;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_storeSubscriptionAdamID = a3;
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_storePurchasedAdamID = a3;
}

- (int64_t)storePurchasedAdamID
{
  return self->_storePurchasedAdamID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  self->_storeCloudID = a3;
}

- (unint64_t)storeCloudID
{
  return self->_storeCloudID;
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setAssetSourceStorefrontID:(id)a3
{
}

- (NSString)assetSourceStorefrontID
{
  return self->_assetSourceStorefrontID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 16), self->_assetSourceStorefrontID);
    objc_storeStrong((id *)(v5 + 24), self->_requestContext);
    objc_storeStrong((id *)(v5 + 56), self->_cloudUniversalLibraryID);
    *(void *)(v5 + 32) = self->_storeCloudID;
    *(void *)(v5 + 40) = self->_storePurchasedAdamID;
    *(void *)(v5 + 48) = self->_storeSubscriptionAdamID;
    *(unsigned char *)(v5 + 8) = self->_shouldPreventLeaseAcquisition;
    *(unsigned char *)(v5 + 9) = self->_shouldRequireLeaseAcquisition;
    *(unsigned char *)(v5 + 10) = self->_triggeredByLeasePrevention;
    *(unsigned char *)(v5 + 11) = self->_followUp;
  }
  return (id)v5;
}

- (ICMusicSubscriptionLeasePlaybackRequest)initWithRequestContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICMusicSubscriptionLeasePlaybackRequest;
  uint64_t v5 = [(ICMusicSubscriptionLeasePlaybackRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requestContext = v5->_requestContext;
    v5->_requestContext = (ICStoreRequestContext *)v6;
  }
  return v5;
}

@end