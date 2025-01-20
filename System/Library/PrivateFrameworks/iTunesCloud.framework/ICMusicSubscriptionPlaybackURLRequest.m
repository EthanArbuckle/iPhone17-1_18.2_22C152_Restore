@interface ICMusicSubscriptionPlaybackURLRequest
- (BOOL)isDelegatedPlayback;
- (NSData)leaseAssetIDData;
- (NSData)leaseCertificateData;
- (NSString)assetSourceStorefrontID;
- (NSString)cloudUniversalLibraryID;
- (id)_actionType;
- (id)_analyticSignature;
- (id)description;
- (int64_t)requestType;
- (int64_t)storePurchasedAdamID;
- (int64_t)storeSubscriptionAdamID;
- (unint64_t)storeCloudID;
- (void)_populateItemIdentifiers:(id)a3;
- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5;
- (void)setAssetSourceStorefrontID:(id)a3;
- (void)setCloudUniversalLibraryID:(id)a3;
- (void)setDelegatedPlayback:(BOOL)a3;
- (void)setLeaseAssetIDData:(id)a3;
- (void)setLeaseCertificateData:(id)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setStoreCloudID:(unint64_t)a3;
- (void)setStorePurchasedAdamID:(int64_t)a3;
- (void)setStoreSubscriptionAdamID:(int64_t)a3;
@end

@implementation ICMusicSubscriptionPlaybackURLRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
  objc_storeStrong((id *)&self->_leaseAssetIDData, 0);
  objc_storeStrong((id *)&self->_leaseCertificateData, 0);

  objc_storeStrong((id *)&self->_assetSourceStorefrontID, 0);
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

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setDelegatedPlayback:(BOOL)a3
{
  self->_delegatedPlayback = a3;
}

- (BOOL)isDelegatedPlayback
{
  return self->_delegatedPlayback;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
}

- (NSString)cloudUniversalLibraryID
{
  return self->_cloudUniversalLibraryID;
}

- (void)setLeaseAssetIDData:(id)a3
{
}

- (NSData)leaseAssetIDData
{
  return self->_leaseAssetIDData;
}

- (void)setLeaseCertificateData:(id)a3
{
}

- (NSData)leaseCertificateData
{
  return self->_leaseCertificateData;
}

- (void)setAssetSourceStorefrontID:(id)a3
{
}

- (NSString)assetSourceStorefrontID
{
  return self->_assetSourceStorefrontID;
}

- (id)_analyticSignature
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)ICMusicSubscriptionPlaybackURLRequest;
  v4 = [(ICURLRequest *)&v13 _analyticSignature];
  v5 = [(ICMusicSubscriptionPlaybackURLRequest *)self _actionType];
  v6 = [(ICURLRequest *)self urlRequest];
  v7 = [v6 URL];
  uint64_t v8 = [v7 query];
  v9 = (void *)v8;
  v10 = &stru_1EF5F5C40;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = [v3 stringWithFormat:@"%@?%@ %@", v4, v5, v10];

  return v11;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(ICMusicSubscriptionPlaybackURLRequest *)self _populateItemIdentifiers:v3];
  v8.receiver = self;
  v8.super_class = (Class)ICMusicSubscriptionPlaybackURLRequest;
  v4 = [(ICStoreURLRequest *)&v8 description];
  if ([v3 count])
  {
    v5 = objc_msgSend(v3, "msv_compactDescription");
    uint64_t v6 = [v4 stringByAppendingString:v5];

    v4 = (void *)v6;
  }

  return v4;
}

- (void)_populateItemIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  int64_t storeSubscriptionAdamID = self->_storeSubscriptionAdamID;
  if (!self->_delegatedPlayback)
  {
    if (!storeSubscriptionAdamID) {
      goto LABEL_13;
    }
    v11 = v4;
    v10 = objc_msgSend(NSNumber, "numberWithLongLong:");
    [v11 setObject:v10 forKey:@"salableAdamId"];

    goto LABEL_12;
  }
  v11 = v4;
  if (storeSubscriptionAdamID)
  {
    v7 = objc_msgSend(NSNumber, "numberWithLongLong:");
    [v11 setObject:v7 forKey:@"subscriptionAdamId"];
  }
  if (self->_storePurchasedAdamID)
  {
    objc_super v8 = objc_msgSend(NSNumber, "numberWithLongLong:");
    [v11 setObject:v8 forKey:@"purchaseAdamId"];
  }
  if (self->_storeCloudID)
  {
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    [v11 setObject:v9 forKey:@"sagaId"];
  }
  id v4 = [(NSString *)self->_cloudUniversalLibraryID length];
  id v5 = v11;
  if (v4)
  {
    id v4 = (id)[v11 setObject:self->_cloudUniversalLibraryID forKey:@"universalLibraryId"];
LABEL_12:
    id v5 = v11;
  }
LABEL_13:

  MEMORY[0x1F41817F8](v4, v5);
}

- (id)_actionType
{
  int64_t requestType = self->_requestType;
  v3 = @"lease-renew";
  if (requestType == 2) {
    v3 = @"lease-start";
  }
  if (requestType == 3) {
    return @"accountless-streaming";
  }
  else {
    return v3;
  }
}

- (void)buildStoreURLRequestWithURLRequest:(id)a3 builderProperties:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __112__ICMusicSubscriptionPlaybackURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke;
  v13[3] = &unk_1E5ACC6C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)ICMusicSubscriptionPlaybackURLRequest;
  id v10 = v9;
  id v11 = v8;
  [(ICStoreURLRequest *)&v12 buildStoreURLRequestWithURLRequest:a3 builderProperties:v11 completionHandler:v13];
}

void __112__ICMusicSubscriptionPlaybackURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    uint64_t v6 = [a1[4] storeRequestContext];
    uint64_t v7 = *((void *)a1[4] + 45);
    if (v7 == 3) {
      unsigned int v8 = 309;
    }
    else {
      unsigned int v8 = 310;
    }
    if (v7 == 2) {
      uint64_t v9 = 308;
    }
    else {
      uint64_t v9 = v8;
    }
    if (v7 == 3)
    {
      uint64_t v10 = -1;
    }
    else
    {
      id v11 = [a1[5] DSID];
      uint64_t v10 = [v11 unsignedLongLongValue];
    }
    objc_super v12 = +[ICMusicSubscriptionFairPlayController sharedController];
    objc_super v13 = a1[4];
    uint64_t v14 = v13[42];
    uint64_t v15 = v13[43];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __112__ICMusicSubscriptionPlaybackURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_2;
    v17[3] = &unk_1E5ACA708;
    v17[4] = v13;
    id v18 = v6;
    id v19 = v5;
    id v20 = a1[6];
    id v16 = v6;
    [v12 generateSubscriptionLeaseRequestWithAccountUniqueID:v10 transactionType:v9 certificateData:v14 assetIDData:v15 completionHandler:v17];
  }
}

void __112__ICMusicSubscriptionPlaybackURLRequest_buildStoreURLRequestWithURLRequest_builderProperties_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v11;
      __int16 v37 = 2114;
      id v38 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to generate subscription lease fairplay data. err=%{public}@", buf, 0x16u);
    }
  }
  objc_super v12 = objc_msgSend(*(id *)(a1 + 32), "_actionType", v9);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v13 setObject:v12 forKey:@"action"];
  if ([*(id *)(*(void *)(a1 + 32) + 328) length]) {
    [v13 setObject:*(void *)(*(void *)(a1 + 32) + 328) forKey:@"assetStoreFront"];
  }
  if (v7)
  {
    uint64_t v14 = [v7 base64EncodedStringWithOptions:0];
    if ([v14 length]) {
      [v13 setObject:v14 forKey:@"spc"];
    }
  }
  if (v8)
  {
    uint64_t v15 = [v8 base64EncodedStringWithOptions:0];
    if ([v15 length]) {
      [v13 setObject:v15 forKey:@"sbsync"];
    }
  }
  id v16 = [*(id *)(a1 + 40) deviceInfo];
  v17 = [v16 deviceGUID];

  if (v17) {
    [v13 setObject:v17 forKey:@"guid"];
  }
  id v18 = [*(id *)(a1 + 40) deviceInfo];
  int v19 = [v18 isWatch];

  if (v19)
  {
    id v20 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
    v21 = [v20 pairedDeviceMediaGUID];

    if (v21) {
      [v13 setObject:v21 forKey:@"companion-guid"];
    }
  }
  [*(id *)(a1 + 32) _populateItemIdentifiers:v13];
  id v32 = 0;
  v22 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v32];
  id v23 = v32;
  v24 = v23;
  if (!v22 || v23)
  {
    v28 = (void *)MEMORY[0x1E4F28C58];
    if (v23)
    {
      uint64_t v33 = *MEMORY[0x1E4F28A50];
      id v34 = v23;
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      v25 = [v28 errorWithDomain:@"ICError" code:-7101 userInfo:v29];
    }
    else
    {
      v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7101 userInfo:0];
    }
    uint64_t v30 = *(void *)(a1 + 56);
    if (v30)
    {
      v27 = *(void (**)(void))(v30 + 16);
      goto LABEL_30;
    }
  }
  else
  {
    v25 = (void *)[*(id *)(a1 + 48) mutableCopy];
    [v25 setHTTPBody:v22];
    [v25 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    uint64_t v26 = *(void *)(a1 + 56);
    if (v26)
    {
      v27 = *(void (**)(void))(v26 + 16);
LABEL_30:
      v27();
    }
  }
}

@end