@interface SSPurchase
+ (BOOL)supportsSecureCoding;
+ (id)newPurchaseWithDatabaseEncoding:(id)a3;
+ (id)newPurchaseWithXPCEncoding:(id)a3;
+ (id)purchaseWithBuyParameters:(id)a3;
- (BOOL)_createsDownloadsWithOverride;
- (BOOL)_createsInstallJobsWithOverride;
- (BOOL)_createsJobsWithOverride;
- (BOOL)createsDownloads;
- (BOOL)createsInstallJobs;
- (BOOL)createsJobs;
- (BOOL)displaysOnLockScreen;
- (BOOL)ignoresForcedPasswordRestriction;
- (BOOL)isBackgroundPurchase;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGratisSoftwareClaim;
- (BOOL)isPlaybackRequest;
- (BOOL)isPreauthenticated;
- (BOOL)skipSoftwareAccountPreflight;
- (BOOL)usesLocalRedownloadParametersIfPossible;
- (NSArray)filteredAssetTypes;
- (NSArray)gratisIdentifiers;
- (NSData)databaseEncoding;
- (NSDictionary)downloadProperties;
- (NSDictionary)tidHeaders;
- (NSNumber)accountIdentifier;
- (NSNumber)enabledServiceType;
- (NSNumber)ownerAccountDSID;
- (NSString)affiliateIdentifier;
- (NSString)buyParameters;
- (SSDownloadPolicy)downloadPolicy;
- (SSNetworkConstraints)networkConstraints;
- (SSPurchase)initWithCoder:(id)a3;
- (SSPurchase)initWithDatabaseEncoding:(id)a3;
- (SSPurchase)initWithItem:(id)a3;
- (SSPurchase)initWithItem:(id)a3 offer:(id)a4;
- (SSPurchase)initWithXPCEncoding:(id)a3;
- (SSURLRequestProperties)requestProperties;
- (id)_buyParametersValueForKey:(id)a3 fromBuyParams:(id)a4;
- (id)_initSSPurchase;
- (id)buyParametersValueForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)downloadMetadata;
- (id)item;
- (id)itemOffer;
- (id)presentingSceneBundleIdentifier;
- (id)presentingSceneIdentifier;
- (id)requiredDeviceCapabilities;
- (id)valueForDownloadProperty:(id)a3;
- (int64_t)batchIdentifier;
- (int64_t)expectedDownloadFileSize;
- (int64_t)placeholderDownloadIdentifier;
- (int64_t)uniqueIdentifier;
- (unint64_t)hash;
- (void)_addEntriesToDatabaseEncoding:(id)a3;
- (void)_setValuesUsingDatabaseEncoding:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setBackgroundPurchase:(BOOL)a3;
- (void)setBatchIdentifier:(int64_t)a3;
- (void)setBuyParameters:(id)a3;
- (void)setCreatesDownloads:(BOOL)a3;
- (void)setCreatesInstallJobs:(BOOL)a3;
- (void)setCreatesJobs:(BOOL)a3;
- (void)setDefaultUserAgent:(id)a3;
- (void)setDisplaysOnLockScreen:(BOOL)a3;
- (void)setDownloadMetadata:(id)a3;
- (void)setDownloadPolicy:(id)a3;
- (void)setDownloadProperties:(id)a3;
- (void)setEnabledServiceType:(id)a3;
- (void)setExpectedDownloadFileSize:(int64_t)a3;
- (void)setFilteredAssetTypes:(id)a3;
- (void)setGratisIdentifiers:(id)a3;
- (void)setIgnoresForcedPasswordRestriction:(BOOL)a3;
- (void)setNetworkConstraints:(id)a3;
- (void)setOwnerAccountDSID:(id)a3;
- (void)setPlaceholderDownloadIdentifier:(int64_t)a3;
- (void)setPlaybackRequest:(BOOL)a3;
- (void)setPreauthenticated:(BOOL)a3;
- (void)setPresentingSceneBundleIdentifier:(id)a3;
- (void)setPresentingSceneIdentifier:(id)a3;
- (void)setRequestProperties:(id)a3;
- (void)setRequiredDeviceCapabilities:(id)a3;
- (void)setSkipSoftwareAccountPreflight:(BOOL)a3;
- (void)setTidHeaders:(id)a3;
- (void)setUniqueIdentifier:(int64_t)a3;
- (void)setUsesLocalRedownloadParametersIfPossible:(BOOL)a3;
- (void)setValue:(id)a3 forDownloadProperty:(id)a4;
@end

@implementation SSPurchase

- (id)_initSSPurchase
{
  v8.receiver = self;
  v8.super_class = (Class)SSPurchase;
  v2 = [(SSPurchase *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_createsDownloads = 257;
    v2->_createsInstallJobs = 1;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.StoreServices.SSPurchase", 0);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    CFUUIDRef v6 = CFUUIDCreate(0);
    v3->_placeholderDownloadIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v6);
    CFRelease(v6);
  }
  return v3;
}

- (SSPurchase)initWithItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 defaultItemOffer];
  CFUUIDRef v6 = [(SSPurchase *)self initWithItem:v4 offer:v5];

  return v6;
}

- (SSPurchase)initWithItem:(id)a3 offer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v8 buyParameters];
  if (![v9 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must provide buy parameters"];
  }
  v10 = [(SSPurchase *)self _initSSPurchase];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    buyParameters = v10->_buyParameters;
    v10->_buyParameters = (NSString *)v11;

    objc_storeStrong((id *)&v10->_item, a3);
    objc_storeStrong((id *)&v10->_itemOffer, a4);
    v13 = [(SSItemOffer *)v10->_itemOffer networkConstraints];
    uint64_t v14 = [v13 copy];
    networkConstraints = v10->_networkConstraints;
    v10->_networkConstraints = (SSNetworkConstraints *)v14;

    v16 = [[SSDownloadMetadata alloc] initWithItem:v7 offer:v8];
    uint64_t v17 = [(SSDownloadMetadata *)v16 newDownloadProperties];
    downloadProperties = v10->_downloadProperties;
    v10->_downloadProperties = (NSMutableDictionary *)v17;
  }
  return v10;
}

+ (id)purchaseWithBuyParameters:(id)a3
{
  id v4 = a3;
  if (![v4 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Must provide buy parameters"];
  }
  id v5 = objc_alloc_init((Class)a1);
  [v5 setBuyParameters:v4];

  return v5;
}

- (NSNumber)accountIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SSPurchase_accountIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __31__SSPurchase_accountIdentifier__block_invoke(uint64_t a1)
{
}

- (NSString)affiliateIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SSPurchase_affiliateIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __33__SSPurchase_affiliateIdentifier__block_invoke(uint64_t a1)
{
}

- (NSString)buyParameters
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__SSPurchase_buyParameters__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __27__SSPurchase_buyParameters__block_invoke(uint64_t a1)
{
}

- (BOOL)createsDownloads
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__SSPurchase_createsDownloads__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__SSPurchase_createsDownloads__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 72);
  return result;
}

- (BOOL)createsJobs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__SSPurchase_createsJobs__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __25__SSPurchase_createsJobs__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 73);
  return result;
}

- (BOOL)createsInstallJobs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_createsInstallJobs__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSPurchase_createsInstallJobs__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 74);
  return result;
}

- (BOOL)displaysOnLockScreen
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSPurchase_displaysOnLockScreen__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SSPurchase_displaysOnLockScreen__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 88);
  return result;
}

- (SSDownloadPolicy)downloadPolicy
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__SSPurchase_downloadPolicy__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSDownloadPolicy *)v3;
}

void __28__SSPurchase_downloadPolicy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 96) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDictionary)downloadProperties
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_downloadProperties__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __32__SSPurchase_downloadProperties__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 104) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)filteredAssetTypes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_filteredAssetTypes__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __32__SSPurchase_filteredAssetTypes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 128) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)ignoresForcedPasswordRestriction
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__SSPurchase_ignoresForcedPasswordRestriction__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__SSPurchase_ignoresForcedPasswordRestriction__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 144);
  return result;
}

- (BOOL)isBackgroundPurchase
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SSPurchase_isBackgroundPurchase__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__SSPurchase_isBackgroundPurchase__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (BOOL)isPlaybackRequest
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SSPurchase_isPlaybackRequest__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__SSPurchase_isPlaybackRequest__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 192);
  return result;
}

- (SSNetworkConstraints)networkConstraints
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_networkConstraints__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSNetworkConstraints *)v3;
}

void __32__SSPurchase_networkConstraints__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 168) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSNumber)ownerAccountDSID
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__SSPurchase_ownerAccountDSID__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __30__SSPurchase_ownerAccountDSID__block_invoke(uint64_t a1)
{
}

- (int64_t)placeholderDownloadIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SSPurchase_placeholderDownloadIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__SSPurchase_placeholderDownloadIdentifier__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 184);
  return result;
}

- (id)presentingSceneIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SSPurchase_presentingSceneIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __39__SSPurchase_presentingSceneIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 248) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)presentingSceneBundleIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SSPurchase_presentingSceneBundleIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__SSPurchase_presentingSceneBundleIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 256) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SSURLRequestProperties)requestProperties
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SSPurchase_requestProperties__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSURLRequestProperties *)v3;
}

void __31__SSPurchase_requestProperties__block_invoke(uint64_t a1)
{
}

- (void)setAccountIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SSPurchase_setAccountIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __35__SSPurchase_setAccountIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = *(void **)(v2 + 8);
  id v4 = (id *)(v2 + 8);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (void)setAffiliateIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__SSPurchase_setAffiliateIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __37__SSPurchase_setAffiliateIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 16) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
  }
}

- (void)setBackgroundPurchase:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SSPurchase_setBackgroundPurchase___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __36__SSPurchase_setBackgroundPurchase___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setBuyParameters:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__SSPurchase_setBuyParameters___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __31__SSPurchase_setBuyParameters___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 40) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if ([*(id *)(*(void *)(a1 + 32) + 40) containsString:@"createsDownloads"])
    {
      id v7 = *(id **)(a1 + 32);
      id v8 = (void *)[v7[5] copy];
      uint64_t v9 = [v7 _buyParametersValueForKey:@"createsDownloads" fromBuyParams:v8];

      if ([v9 length])
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v9, "isEqualToString:", @"true"));
        uint64_t v11 = *(void *)(a1 + 32);
        v12 = *(void **)(v11 + 48);
        *(void *)(v11 + 48) = v10;
      }
    }
    if ([*(id *)(*(void *)(a1 + 32) + 40) containsString:@"createsJobs"])
    {
      v13 = *(id **)(a1 + 32);
      uint64_t v14 = (void *)[v13[5] copy];
      v15 = [v13 _buyParametersValueForKey:@"createsJobs" fromBuyParams:v14];

      if ([v15 length])
      {
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v15, "isEqualToString:", @"true"));
        uint64_t v17 = *(void *)(a1 + 32);
        v18 = *(void **)(v17 + 64);
        *(void *)(v17 + 64) = v16;
      }
    }
    if ([*(id *)(*(void *)(a1 + 32) + 40) containsString:@"createsInstallJobs"])
    {
      v19 = *(id **)(a1 + 32);
      v20 = (void *)[v19[5] copy];
      id v24 = [v19 _buyParametersValueForKey:@"createsInstallJobs" fromBuyParams:v20];

      if ([v24 length])
      {
        uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v24, "isEqualToString:", @"true"));
        uint64_t v22 = *(void *)(a1 + 32);
        v23 = *(void **)(v22 + 56);
        *(void *)(v22 + 56) = v21;
      }
    }
  }
}

- (void)setCreatesDownloads:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SSPurchase_setCreatesDownloads___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SSPurchase_setCreatesDownloads___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 72) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setCreatesJobs:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__SSPurchase_setCreatesJobs___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __29__SSPurchase_setCreatesJobs___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 73) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setCreatesInstallJobs:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__SSPurchase_setCreatesInstallJobs___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __36__SSPurchase_setCreatesInstallJobs___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 74) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setDisplaysOnLockScreen:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__SSPurchase_setDisplaysOnLockScreen___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __38__SSPurchase_setDisplaysOnLockScreen___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setDownloadPolicy:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__SSPurchase_setDownloadPolicy___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __32__SSPurchase_setDownloadPolicy___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 96) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 96);
    *(void *)(v5 + 96) = v4;
  }
}

- (void)setDownloadProperties:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SSPurchase_setDownloadProperties___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __36__SSPurchase_setDownloadProperties___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 104) != v2)
  {
    uint64_t v4 = [v2 mutableCopy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 104);
    *(void *)(v5 + 104) = v4;
  }
}

- (void)setFilteredAssetTypes:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SSPurchase_setFilteredAssetTypes___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __36__SSPurchase_setFilteredAssetTypes___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 128) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 128);
    *(void *)(v5 + 128) = v4;
  }
}

- (void)setIgnoresForcedPasswordRestriction:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SSPurchase_setIgnoresForcedPasswordRestriction___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __50__SSPurchase_setIgnoresForcedPasswordRestriction___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 144) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setNetworkConstraints:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SSPurchase_setNetworkConstraints___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __36__SSPurchase_setNetworkConstraints___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 168) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 168);
    *(void *)(v5 + 168) = v4;
  }
}

- (void)setOwnerAccountDSID:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SSPurchase_setOwnerAccountDSID___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __34__SSPurchase_setOwnerAccountDSID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(v2 + 176);
  id v4 = (id *)(v2 + 176);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (void)setPlaybackRequest:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SSPurchase_setPlaybackRequest___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __33__SSPurchase_setPlaybackRequest___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 192) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setPresentingSceneIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SSPurchase_setPresentingSceneIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __43__SSPurchase_setPresentingSceneIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 248);
  *(void *)(v3 + 248) = v2;
}

- (void)setPresentingSceneBundleIdentifier:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SSPurchase_setPresentingSceneBundleIdentifier___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __49__SSPurchase_setPresentingSceneBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 256);
  *(void *)(v3 + 256) = v2;
}

- (void)setRequestProperties:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SSPurchase_setRequestProperties___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __35__SSPurchase_setRequestProperties___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 200) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 200);
    *(void *)(v5 + 200) = v4;
  }
}

- (void)setSkipSoftwareAccountPreflight:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__SSPurchase_setSkipSoftwareAccountPreflight___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __46__SSPurchase_setSkipSoftwareAccountPreflight___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 216) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setValue:(id)a3 forDownloadProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SSPurchase_setValue_forDownloadProperty___block_invoke;
  block[3] = &unk_1E5BA7068;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SSPurchase_setValue_forDownloadProperty___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void **)(a1[5] + 104);
  if (v2)
  {
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v5 = a1[5];
      id v6 = *(void **)(v5 + 104);
      *(void *)(v5 + 104) = v4;

      uint64_t v2 = a1[4];
      uint64_t v3 = *(void **)(a1[5] + 104);
    }
    uint64_t v7 = a1[6];
    return [v3 setObject:v2 forKey:v7];
  }
  else
  {
    uint64_t v9 = a1[6];
    return [v3 removeObjectForKey:v9];
  }
}

- (id)valueForDownloadProperty:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  uint64_t v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SSPurchase_valueForDownloadProperty___block_invoke;
  block[3] = &unk_1E5BA6F80;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __39__SSPurchase_valueForDownloadProperty___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 104) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SSPurchase)initWithDatabaseEncoding:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(SSPurchase *)self _initSSPurchase];
    id v7 = v6;
    if (v6) {
      [(SSPurchase *)v6 _setValuesUsingDatabaseEncoding:v5];
    }
  }
  else
  {

    id v7 = 0;
  }

  return v7;
}

- (int64_t)batchIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__SSPurchase_batchIdentifier__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __29__SSPurchase_batchIdentifier__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (NSData)databaseEncoding
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  dispatchQueue = self->_dispatchQueue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __30__SSPurchase_databaseEncoding__block_invoke;
  uint64_t v11 = &unk_1E5BA7018;
  uint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(dispatchQueue, &v8);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F98], "dataWithPropertyList:format:options:error:", v5, 200, 0, 0, v8, v9, v10, v11, v12);

  return (NSData *)v6;
}

uint64_t __30__SSPurchase_databaseEncoding__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addEntriesToDatabaseEncoding:*(void *)(a1 + 40)];
}

- (id)buyParametersValueForKey:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SSPurchase *)self buyParameters];
  uint64_t v6 = (void *)[v5 length];

  if (v6)
  {
    id v7 = [(SSPurchase *)self buyParameters];
    uint64_t v8 = [v7 componentsSeparatedByString:@"&"];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "componentsSeparatedByString:", @"=", (void)v19);
          if ([v14 count] == 2)
          {
            v15 = [v14 objectAtIndexedSubscript:0];
            int v16 = [v15 isEqualToString:v4];

            if (v16)
            {
              id v17 = [v14 objectAtIndexedSubscript:1];

              goto LABEL_13;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v17 = 0;
LABEL_13:

    uint64_t v6 = [v17 stringByRemovingPercentEncoding];
  }
  return v6;
}

- (NSNumber)enabledServiceType
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_enabledServiceType__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __32__SSPurchase_enabledServiceType__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)expectedDownloadFileSize
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SSPurchase_expectedDownloadFileSize__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__SSPurchase_expectedDownloadFileSize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 120);
  return result;
}

- (NSArray)gratisIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__SSPurchase_gratisIdentifiers__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __31__SSPurchase_gratisIdentifiers__block_invoke(uint64_t a1)
{
}

- (id)item
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __18__SSPurchase_item__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __18__SSPurchase_item__block_invoke(uint64_t a1)
{
}

- (id)itemOffer
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __23__SSPurchase_itemOffer__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __23__SSPurchase_itemOffer__block_invoke(uint64_t a1)
{
}

- (BOOL)isGratisSoftwareClaim
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SSPurchase_isGratisSoftwareClaim__block_invoke;
  v5[3] = &unk_1E5BA6FC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __35__SSPurchase_isGratisSoftwareClaim__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    id v3 = [v2 firstObject];
    objc_opt_class();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_opt_isKindOfClass() & 1;
  }
}

- (BOOL)isPreauthenticated
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__SSPurchase_isPreauthenticated__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__SSPurchase_isPreauthenticated__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 193);
  return result;
}

- (id)requiredDeviceCapabilities
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__SSPurchase_requiredDeviceCapabilities__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__SSPurchase_requiredDeviceCapabilities__block_invoke(uint64_t a1)
{
}

- (void)setBatchIdentifier:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SSPurchase_setBatchIdentifier___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __33__SSPurchase_setBatchIdentifier___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 32) = *(void *)(result + 40);
  return result;
}

- (void)setDefaultUserAgent:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SSPurchase_setDefaultUserAgent___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __34__SSPurchase_setDefaultUserAgent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 200) HTTPHeaders];
  id v3 = [v2 objectForKey:@"User-Agent"];

  if (!v3)
  {
    id v4 = (SSMutableURLRequestProperties *)[*(id *)(*(void *)(a1 + 32) + 200) mutableCopy];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5 && !v4)
    {
      id v4 = objc_alloc_init(SSMutableURLRequestProperties);
      uint64_t v5 = *(void *)(a1 + 40);
    }
    char v9 = v4;
    [(SSMutableURLRequestProperties *)v4 setValue:v5 forHTTPHeaderField:@"User-Agent"];
    uint64_t v6 = [(SSMutableURLRequestProperties *)v9 copy];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 200);
    *(void *)(v7 + 200) = v6;
  }
}

- (void)setEnabledServiceType:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__SSPurchase_setEnabledServiceType___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __36__SSPurchase_setEnabledServiceType___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 112) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 112);
    *(void *)(v5 + 112) = v4;
  }
}

- (void)setExpectedDownloadFileSize:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__SSPurchase_setExpectedDownloadFileSize___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __42__SSPurchase_setExpectedDownloadFileSize___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 120) = *(void *)(result + 40);
  return result;
}

- (void)setGratisIdentifiers:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__SSPurchase_setGratisIdentifiers___block_invoke;
  v7[3] = &unk_1E5BA7018;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __35__SSPurchase_setGratisIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 136) != v2)
  {
    uint64_t v4 = [v2 copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 136);
    *(void *)(v5 + 136) = v4;
  }
}

- (void)setPlaceholderDownloadIdentifier:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SSPurchase_setPlaceholderDownloadIdentifier___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __47__SSPurchase_setPlaceholderDownloadIdentifier___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 184) = *(void *)(result + 40);
  return result;
}

- (void)setPreauthenticated:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SSPurchase_setPreauthenticated___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SSPurchase_setPreauthenticated___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 193) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setRequiredDeviceCapabilities:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SSPurchase_setRequiredDeviceCapabilities___block_invoke;
  v7[3] = &unk_1E5BA7018;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __44__SSPurchase_setRequiredDeviceCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v2 addObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v2 = 0;
      goto LABEL_16;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__SSPurchase_setRequiredDeviceCapabilities___block_invoke_2;
    v14[3] = &unk_1E5BA8EE8;
    id v2 = v9;
    id v15 = v2;
    [v10 enumerateKeysAndObjectsUsingBlock:v14];
    id v3 = v15;
  }

LABEL_16:
  uint64_t v11 = [v2 copy];
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(v12 + 208);
  *(void *)(v12 + 208) = v11;
}

void __44__SSPurchase_setRequiredDeviceCapabilities___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

- (void)setTidHeaders:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __28__SSPurchase_setTidHeaders___block_invoke;
  v7[3] = &unk_1E5BA7018;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __28__SSPurchase_setTidHeaders___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 224);
  *(void *)(v3 + 224) = v2;
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SSPurchase_setUniqueIdentifier___block_invoke;
  v4[3] = &unk_1E5BA8DA8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __34__SSPurchase_setUniqueIdentifier___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 232) = *(void *)(result + 40);
  return result;
}

- (void)setUsesLocalRedownloadParametersIfPossible:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SSPurchase_setUsesLocalRedownloadParametersIfPossible___block_invoke;
  v4[3] = &unk_1E5BA8060;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __57__SSPurchase_setUsesLocalRedownloadParametersIfPossible___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 240) = *(unsigned char *)(result + 40);
  return result;
}

- (NSDictionary)tidHeaders
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__11;
  uint64_t v10 = __Block_byref_object_dispose__11;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__SSPurchase_tidHeaders__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __24__SSPurchase_tidHeaders__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 224) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)uniqueIdentifier
{
  int64_t result = self->_uniqueIdentifier;
  if (!result)
  {
    CFUUIDRef v4 = CFUUIDCreate(0);
    self->_uniqueIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v4);
    CFRelease(v4);
    return self->_uniqueIdentifier;
  }
  return result;
}

- (BOOL)usesLocalRedownloadParametersIfPossible
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SSPurchase_usesLocalRedownloadParametersIfPossible__block_invoke;
  v5[3] = &unk_1E5BA6F30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SSPurchase_usesLocalRedownloadParametersIfPossible__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 240);
  return result;
}

- (void)_addEntriesToDatabaseEncoding:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v4 setObject:accountIdentifier forKey:@"0"];
  }
  affiliateIdentifier = self->_affiliateIdentifier;
  if (affiliateIdentifier) {
    [v5 setObject:affiliateIdentifier forKey:@"1"];
  }
  ownerAccountDSID = self->_ownerAccountDSID;
  if (ownerAccountDSID) {
    [v5 setObject:ownerAccountDSID forKey:@"O"];
  }
  buyParameters = self->_buyParameters;
  if (buyParameters) {
    [v5 setObject:buyParameters forKey:@"3"];
  }
  downloadProperties = self->_downloadProperties;
  if (downloadProperties) {
    [v5 setObject:downloadProperties forKey:@"7"];
  }
  enabledServiceType = self->_enabledServiceType;
  if (enabledServiceType) {
    [v5 setObject:enabledServiceType forKey:@"L"];
  }
  filteredAssetTypes = self->_filteredAssetTypes;
  if (filteredAssetTypes) {
    [v5 setObject:filteredAssetTypes forKey:@"8"];
  }
  gratisIdentifiers = self->_gratisIdentifiers;
  if (gratisIdentifiers) {
    [v5 setObject:gratisIdentifiers forKey:@"G"];
  }
  id requiredDeviceCapabilities = self->_requiredDeviceCapabilities;
  if (requiredDeviceCapabilities) {
    [v5 setObject:requiredDeviceCapabilities forKey:@"F"];
  }
  tidHeaders = self->_tidHeaders;
  if (tidHeaders) {
    [v5 setObject:tidHeaders forKey:@"Q"];
  }
  presentingSceneIdentifier = self->_presentingSceneIdentifier;
  if (presentingSceneIdentifier) {
    [v5 setObject:presentingSceneIdentifier forKey:@"R"];
  }
  long long v17 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_backgroundPurchase];
  [v5 setObject:v17 forKey:@"2"];

  long long v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SSPurchase _createsDownloadsWithOverride](self, "_createsDownloadsWithOverride"));
  [v5 setObject:v18 forKey:@"4"];

  long long v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SSPurchase _createsJobsWithOverride](self, "_createsJobsWithOverride"));
  [v5 setObject:v19 forKey:@"5"];

  long long v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SSPurchase _createsInstallJobsWithOverride](self, "_createsInstallJobsWithOverride"));
  [v5 setObject:v20 forKey:@"N"];

  uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_displaysOnLockScreen];
  [v5 setObject:v21 forKey:@"K"];

  long long v22 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_expectedDownloadFileSize];
  [v5 setObject:v22 forKey:@"E"];

  v23 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_ignoresForcedPasswordRestriction];
  [v5 setObject:v23 forKey:@"9"];

  uint64_t v24 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_placeholderDownloadIdentifier];
  [v5 setObject:v24 forKey:@"C"];

  v25 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_usesLocalRedownloadParametersIfPossible];
  [v5 setObject:v25 forKey:@"H"];

  v26 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_playbackRequest];
  [v5 setObject:v26 forKey:@"M"];

  v27 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_preauthenticated];
  [v5 setObject:v27 forKey:@"I"];

  v28 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_skipSoftwareAccountPreflight];
  [v5 setObject:v28 forKey:@"P"];

  v29 = [(SSItem *)self->_item rawItemDictionary];
  if (v29) {
    [v5 setObject:v29 forKey:@"A"];
  }
  v30 = [(SSItemOffer *)self->_itemOffer offerIdentifier];
  if (v30) {
    [v5 setObject:v30 forKey:@"A"];
  }
  downloadPolicy = self->_downloadPolicy;
  if (downloadPolicy)
  {
    id v66 = 0;
    v32 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:downloadPolicy requiringSecureCoding:1 error:&v66];
    id v33 = v66;
    if (v32)
    {
      [v5 setObject:v32 forKey:@"6"];
LABEL_42:

      goto LABEL_43;
    }
    v34 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v34)
    {
      v34 = +[SSLogConfig sharedConfig];
    }
    int v35 = [v34 shouldLog];
    if ([v34 shouldLogToDisk]) {
      int v36 = v35 | 2;
    }
    else {
      int v36 = v35;
    }
    v37 = [v34 OSLogObject];
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      v36 &= 2u;
    }
    if (v36)
    {
      v38 = objc_opt_class();
      int v67 = 138543618;
      v68 = v38;
      __int16 v69 = 2114;
      id v70 = v33;
      id v39 = v38;
      LODWORD(v64) = 22;
      v63 = &v67;
      v40 = (void *)_os_log_send_and_compose_impl();

      if (!v40)
      {
LABEL_41:

        goto LABEL_42;
      }
      v37 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v67, v64);
      free(v40);
      SSFileLog(v34, @"%@", v41, v42, v43, v44, v45, v46, (uint64_t)v37);
    }

    goto LABEL_41;
  }
LABEL_43:
  requestProperties = self->_requestProperties;
  if (requestProperties)
  {
    id v65 = 0;
    v48 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:requestProperties requiringSecureCoding:1 error:&v65];
    id v49 = v65;
    if (v48)
    {
      [v5 setObject:v48 forKey:@"D"];
LABEL_58:

      goto LABEL_59;
    }
    v50 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v50)
    {
      v50 = +[SSLogConfig sharedConfig];
    }
    int v51 = objc_msgSend(v50, "shouldLog", v63);
    if ([v50 shouldLogToDisk]) {
      int v52 = v51 | 2;
    }
    else {
      int v52 = v51;
    }
    v53 = [v50 OSLogObject];
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      v52 &= 2u;
    }
    if (v52)
    {
      v54 = objc_opt_class();
      int v67 = 138543618;
      v68 = v54;
      __int16 v69 = 2114;
      id v70 = v49;
      id v55 = v54;
      LODWORD(v64) = 22;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (!v56)
      {
LABEL_57:

        goto LABEL_58;
      }
      v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v56, 4, &v67, v64);
      free(v56);
      SSFileLog(v50, @"%@", v57, v58, v59, v60, v61, v62, (uint64_t)v53);
    }

    goto LABEL_57;
  }
LABEL_59:
}

- (id)_buyParametersValueForKey:(id)a3 fromBuyParams:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [a4 componentsSeparatedByString:@"&"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "componentsSeparatedByString:", @"=", (void)v17);
        if ([v11 count] == 2)
        {
          uint64_t v12 = [v11 objectAtIndexedSubscript:0];
          int v13 = [v12 isEqualToString:v5];

          if (v13)
          {
            uint64_t v14 = [v11 objectAtIndexedSubscript:1];

            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_12:

  id v15 = [v14 stringByRemovingPercentEncoding];

  return v15;
}

- (BOOL)_createsDownloadsWithOverride
{
  buyParamsCreatesDownloads = self->_buyParamsCreatesDownloads;
  if (buyParamsCreatesDownloads) {
    LOBYTE(v4) = [(NSNumber *)buyParamsCreatesDownloads BOOLValue];
  }
  else {
    return self->_createsDownloads;
  }
  return v4;
}

- (BOOL)_createsInstallJobsWithOverride
{
  buyParamsCreatesInstallJobs = self->_buyParamsCreatesInstallJobs;
  if (buyParamsCreatesInstallJobs) {
    LOBYTE(v4) = [(NSNumber *)buyParamsCreatesInstallJobs BOOLValue];
  }
  else {
    return self->_createsInstallJobs;
  }
  return v4;
}

- (BOOL)_createsJobsWithOverride
{
  buyParamsCreatesJobs = self->_buyParamsCreatesJobs;
  if (buyParamsCreatesJobs) {
    LOBYTE(v4) = [(NSNumber *)buyParamsCreatesJobs BOOLValue];
  }
  else {
    return self->_createsJobs;
  }
  return v4;
}

- (void)_setValuesUsingDatabaseEncoding:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"0"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_accountIdentifier, v5);
  }
  id v6 = [v4 objectForKey:@"1"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_affiliateIdentifier, v6);
  }
  uint64_t v7 = [v4 objectForKey:@"O"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_ownerAccountDSID, v7);
  }
  uint64_t v8 = [v4 objectForKey:@"2"];

  if (objc_opt_respondsToSelector()) {
    self->_backgroundPurchase = [v8 BOOLValue];
  }
  uint64_t v9 = [v4 objectForKey:@"3"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_buyParameters, v9);
  }
  uint64_t v10 = [v4 objectForKey:@"4"];

  if (objc_opt_respondsToSelector()) {
    self->_createsDownloads = [v10 BOOLValue];
  }
  id v11 = [v4 objectForKey:@"5"];

  if (objc_opt_respondsToSelector()) {
    self->_createsJobs = [v11 BOOLValue];
  }
  uint64_t v12 = [v4 objectForKey:@"N"];

  if (objc_opt_respondsToSelector()) {
    self->_createsInstallJobs = [v12 BOOLValue];
  }
  int v13 = [v4 objectForKey:@"K"];

  if (objc_opt_respondsToSelector()) {
    self->_displaysOnLockScreen = [v13 BOOLValue];
  }
  uint64_t v14 = [v4 objectForKey:@"7"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = (NSMutableDictionary *)[v14 mutableCopy];
    downloadProperties = self->_downloadProperties;
    self->_downloadProperties = v15;
  }
  long long v17 = [v4 objectForKey:@"L"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v18 = (NSNumber *)[v17 copy];
    enabledServiceType = self->_enabledServiceType;
    self->_enabledServiceType = v18;
  }
  long long v20 = [v4 objectForKey:@"E"];

  if (objc_opt_respondsToSelector()) {
    self->_expectedDownloadFileSize = [v20 longLongValue];
  }
  uint64_t v21 = [v4 objectForKey:@"8"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_filteredAssetTypes, v21);
  }
  uint64_t v22 = [v4 objectForKey:@"G"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_gratisIdentifiers, v22);
  }
  v23 = [v4 objectForKey:@"9"];

  if (objc_opt_respondsToSelector()) {
    self->_ignoresForcedPasswordRestriction = [v23 BOOLValue];
  }
  uint64_t v24 = [v4 objectForKey:@"C"];

  if (objc_opt_respondsToSelector()) {
    self->_placeholderDownloadIdentifier = [v24 longLongValue];
  }
  v25 = [v4 objectForKey:@"M"];

  if (objc_opt_respondsToSelector()) {
    self->_playbackRequest = [v25 BOOLValue];
  }
  v26 = [v4 objectForKey:@"F"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    objc_storeStrong(&self->_requiredDeviceCapabilities, v26);
  }
  v27 = [v4 objectForKey:@"H"];

  if (objc_opt_respondsToSelector()) {
    self->_usesLocalRedownloadParametersIfPossible = [v27 BOOLValue];
  }
  v28 = [v4 objectForKey:@"I"];

  if (objc_opt_respondsToSelector()) {
    self->_preauthenticated = [v28 BOOLValue];
  }
  v29 = [v4 objectForKey:@"P"];

  if (objc_opt_respondsToSelector()) {
    self->_skipSoftwareAccountPreflight = [v29 BOOLValue];
  }
  v30 = [v4 objectForKey:@"R"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_presentingSceneIdentifier, v30);
  }
  v31 = [v4 objectForKey:@"A"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v32 = [[SSItem alloc] initWithItemDictionary:v31];
    item = self->_item;
    self->_item = v32;
  }
  v34 = [v4 objectForKey:@"B"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v35 = [(SSItem *)self->_item itemOfferForIdentifier:v34];
    itemOffer = self->_itemOffer;
    self->_itemOffer = v35;

    if (!self->_itemOffer)
    {
      v37 = [(SSItem *)self->_item defaultItemOffer];
      v38 = self->_itemOffer;
      self->_itemOffer = v37;
    }
  }
  id v39 = [v4 objectForKey:@"Q"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v40 = (NSDictionary *)[v39 copy];
    tidHeaders = self->_tidHeaders;
    self->_tidHeaders = v40;
  }
  uint64_t v42 = [v4 objectForKey:@"6"];

  objc_opt_class();
  unint64_t v43 = 0x1E4F28000uLL;
  if (objc_opt_isKindOfClass())
  {
    id v82 = 0;
    uint64_t v44 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v42 error:&v82];
    id v79 = v82;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v45 = v44;
      downloadPolicy = self->_downloadPolicy;
      self->_downloadPolicy = v45;
LABEL_56:
      unint64_t v43 = 0x1E4F28000;
LABEL_67:

      goto LABEL_68;
    }
    v77 = v31;
    downloadPolicy = +[SSLogConfig sharedStoreServicesConfig];
    if (!downloadPolicy)
    {
      downloadPolicy = +[SSLogConfig sharedConfig];
    }
    int v47 = [downloadPolicy shouldLog];
    if ([downloadPolicy shouldLogToDisk]) {
      v47 |= 2u;
    }
    v48 = [downloadPolicy OSLogObject];
    if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      v47 &= 2u;
    }
    if (v47)
    {
      id v49 = objc_opt_class();
      int v83 = 138543618;
      v84 = v49;
      __int16 v85 = 2114;
      id v86 = v79;
      id v50 = v49;
      LODWORD(v76) = 22;
      v75 = &v83;
      int v51 = (void *)_os_log_send_and_compose_impl();

      if (!v51)
      {
        v31 = v77;
        goto LABEL_56;
      }
      v48 = objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, &v83, v76);
      free(v51);
      SSFileLog(downloadPolicy, @"%@", v52, v53, v54, v55, v56, v57, (uint64_t)v48);
    }
    unint64_t v43 = 0x1E4F28000uLL;

    v31 = v77;
    goto LABEL_67;
  }
LABEL_68:
  uint64_t v58 = objc_msgSend(v4, "objectForKey:", @"D", v75);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v59 = *(void **)(v43 + 3520);
    id v81 = 0;
    uint64_t v60 = [v59 unarchivedObjectOfClass:objc_opt_class() fromData:v58 error:&v81];
    id v61 = v81;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v62 = v60;
      requestProperties = self->_requestProperties;
      self->_requestProperties = v62;
LABEL_82:

      goto LABEL_83;
    }
    v78 = v31;
    id v80 = v61;
    requestProperties = +[SSLogConfig sharedStoreServicesConfig];
    if (!requestProperties)
    {
      requestProperties = +[SSLogConfig sharedConfig];
    }
    int v64 = [requestProperties shouldLog];
    if ([requestProperties shouldLogToDisk]) {
      v64 |= 2u;
    }
    id v65 = [requestProperties OSLogObject];
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      v64 &= 2u;
    }
    if (v64)
    {
      id v66 = objc_opt_class();
      int v83 = 138543618;
      v84 = v66;
      __int16 v85 = 2114;
      id v86 = v80;
      id v67 = v66;
      LODWORD(v76) = 22;
      v68 = (void *)_os_log_send_and_compose_impl();

      if (!v68)
      {
LABEL_81:
        v31 = v78;
        id v61 = v80;
        goto LABEL_82;
      }
      id v65 = objc_msgSend(NSString, "stringWithCString:encoding:", v68, 4, &v83, v76);
      free(v68);
      SSFileLog(requestProperties, @"%@", v69, v70, v71, v72, v73, v74, (uint64_t)v65);
    }

    goto LABEL_81;
  }
LABEL_83:
}

- (SSPurchase)initWithCoder:(id)a3
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    id v61 = [MEMORY[0x1E4F28B00] currentHandler];
    [v61 handleFailureInMethod:a2 object:self file:@"SSPurchase.m" lineNumber:1016 description:@"Only keyed coding is supported"];
  }
  id v6 = [(SSPurchase *)self _initSSPurchase];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    int v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSNumber *)v14;

    uint64_t v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"affiliate"];
    affiliateIdentifier = v6->_affiliateIdentifier;
    v6->_affiliateIdentifier = (NSString *)v16;

    uint64_t v18 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"ownerAccountDSID"];
    ownerAccountDSID = v6->_ownerAccountDSID;
    v6->_ownerAccountDSID = (NSNumber *)v18;

    v6->_backgroundPurchase = [v5 decodeBoolForKey:@"background"];
    uint64_t v20 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"buyparams"];
    buyParameters = v6->_buyParameters;
    v6->_buyParameters = (NSString *)v20;

    v6->_createsDownloads = [v5 decodeBoolForKey:@"createdl"];
    v6->_createsJobs = [v5 decodeBoolForKey:@"createjb"];
    v6->_createsInstallJobs = [v5 decodeBoolForKey:@"createinstalljb"];
    v6->_displaysOnLockScreen = [v5 decodeBoolForKey:@"dislkscrn"];
    uint64_t v22 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"ensrvtp"];
    enabledServiceType = v6->_enabledServiceType;
    v6->_enabledServiceType = (NSNumber *)v22;

    v6->_expectedDownloadFileSize = [v5 decodeInt64ForKey:@"fsize"];
    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v5 decodeObjectOfClasses:v26 forKey:@"fltassts"];
    filteredAssetTypes = v6->_filteredAssetTypes;
    v6->_filteredAssetTypes = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v5 decodeObjectOfClasses:v31 forKey:@"gratids"];
    gratisIdentifiers = v6->_gratisIdentifiers;
    v6->_gratisIdentifiers = (NSArray *)v32;

    v6->_ignoresForcedPasswordRestriction = [v5 decodeBoolForKey:@"ignfrcpw"];
    v6->_placeholderDownloadIdentifier = [v5 decodeInt64ForKey:@"plchid"];
    v6->_playbackRequest = [v5 decodeBoolForKey:@"plyreq"];
    uint64_t v34 = [v5 decodeObjectOfClasses:v13 forKey:@"reqcap"];
    id requiredDeviceCapabilities = v6->_requiredDeviceCapabilities;
    v6->_id requiredDeviceCapabilities = (id)v34;

    v6->_skipSoftwareAccountPreflight = [v5 decodeBoolForKey:@"skipSoftwareAccountPreflight"];
    v6->_usesLocalRedownloadParametersIfPossible = [v5 decodeBoolForKey:@"usesrdl"];
    uint64_t v36 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneIdentifier"];
    presentingSceneIdentifier = v6->_presentingSceneIdentifier;
    v6->_presentingSceneIdentifier = (NSString *)v36;

    uint64_t v38 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"presentingSceneBundleIdentifier"];
    presentingSceneBundleIdentifier = v6->_presentingSceneBundleIdentifier;
    v6->_presentingSceneBundleIdentifier = (NSString *)v38;

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    uint64_t v42 = [v40 setWithArray:v41];
    unint64_t v43 = [v5 decodeObjectOfClasses:v42 forKey:@"uniqueid"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6->_uniqueIdentifier = [(__CFString *)v43 longLongValue];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFUUIDRef v44 = CFUUIDCreateFromString(0, v43);
        if (v44)
        {
          CFUUIDRef v45 = v44;
          v6->_uniqueIdentifier = *(_OWORD *)&CFUUIDGetUUIDBytes(v44);
          CFRelease(v45);
        }
      }
    }
    if ([v5 containsValueForKey:@"dlprops"])
    {
      uint64_t v46 = [v5 decodeObjectOfClasses:v13 forKey:@"dlprops"];
      uint64_t v47 = [v46 mutableCopy];
    }
    else
    {
      uint64_t v46 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];
      uint64_t v47 = [v46 newDownloadProperties];
    }
    downloadProperties = v6->_downloadProperties;
    v6->_downloadProperties = (NSMutableDictionary *)v47;

    id v49 = [v5 decodeObjectOfClasses:v13 forKey:@"itemdict"];
    if (v49)
    {
      id v50 = [[SSItem alloc] initWithItemDictionary:v49];
      item = v6->_item;
      v6->_item = v50;
    }
    uint64_t v52 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"offerid"];
    if (v52)
    {
      uint64_t v53 = [(SSItem *)v6->_item itemOfferForIdentifier:v52];
      itemOffer = v6->_itemOffer;
      v6->_itemOffer = (SSItemOffer *)v53;

      if (!v6->_itemOffer)
      {
        uint64_t v55 = [(SSItem *)v6->_item defaultItemOffer];
        uint64_t v56 = v6->_itemOffer;
        v6->_itemOffer = (SSItemOffer *)v55;
      }
    }
    uint64_t v57 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"dlpolicy"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v6->_downloadPolicy, v57);
    }
    uint64_t v58 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"netcon"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v6->_networkConstraints, v58);
    }
    uint64_t v59 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"requestp"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v6->_requestProperties, v59);
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SSPurchase.m" lineNumber:1092 description:@"Only keyed coding is supported"];
  }
  dispatchQueue = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__SSPurchase_encodeWithCoder___block_invoke;
  v9[3] = &unk_1E5BA7018;
  id v10 = v5;
  uint64_t v11 = self;
  id v7 = v5;
  dispatch_sync(dispatchQueue, v9);
}

uint64_t __30__SSPurchase_encodeWithCoder___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 8) forKey:@"account"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 16) forKey:@"affiliate"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 176) forKey:@"ownerAccountDSID"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) forKey:@"background"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 40) forKey:@"buyparams"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 72) forKey:@"createdl"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 73) forKey:@"createjb"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 74) forKey:@"createinstalljb"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 88) forKey:@"dislkscrn"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 96) forKey:@"dlpolicy"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 104) forKey:@"dlprops"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 112) forKey:@"ensrvtp"];
  [*(id *)(a1 + 32) encodeInt64:*(void *)(*(void *)(a1 + 40) + 120) forKey:@"fsize"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 128) forKey:@"fltassts"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 136) forKey:@"gratids"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 144) forKey:@"ignfrcpw"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 168) forKey:@"netcon"];
  [*(id *)(a1 + 32) encodeInt64:*(void *)(*(void *)(a1 + 40) + 184) forKey:@"plchid"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 200) forKey:@"requestp"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 192) forKey:@"plyreq"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 208) forKey:@"reqcap"];
  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 216) forKey:@"skipSoftwareAccountPreflight"];
  uint64_t v2 = *(void **)(a1 + 32);
  char v3 = [*(id *)(*(void *)(a1 + 40) + 152) rawItemDictionary];
  [v2 encodeObject:v3 forKey:@"itemdict"];

  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 160) offerIdentifier];
  [v4 encodeObject:v5 forKey:@"offerid"];

  id v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier"));
  [v6 encodeObject:v7 forKey:@"uniqueid"];

  [*(id *)(a1 + 32) encodeBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 240) forKey:@"usesrdl"];
  [*(id *)(a1 + 32) encodeObject:*(void *)(*(void *)(a1 + 40) + 248) forKey:@"presentingSceneIdentifier"];
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 256);
  return [v8 encodeObject:v9 forKey:@"presentingSceneBundleIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SSPurchase_copyWithZone___block_invoke;
  block[3] = &unk_1E5BA86D0;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = self;
  int v13 = a3;
  dispatch_sync(dispatchQueue, block);
  id v8 = v7;

  return v8;
}

void __27__SSPurchase_copyWithZone___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[5] + 8) copyWithZone:a1[6]];
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = [*(id *)(a1[5] + 16) copyWithZone:a1[6]];
  uint64_t v6 = a1[4];
  id v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  uint64_t v8 = [*(id *)(a1[5] + 176) copyWithZone:a1[6]];
  uint64_t v9 = a1[4];
  id v10 = *(void **)(v9 + 176);
  *(void *)(v9 + 176) = v8;

  *(unsigned char *)(a1[4] + 24) = *(unsigned char *)(a1[5] + 24);
  *(void *)(a1[4] + 32) = *(void *)(a1[5] + 32);
  uint64_t v11 = [*(id *)(a1[5] + 40) copyWithZone:a1[6]];
  uint64_t v12 = a1[4];
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  *(unsigned char *)(a1[4] + 72) = *(unsigned char *)(a1[5] + 72);
  *(unsigned char *)(a1[4] + 73) = *(unsigned char *)(a1[5] + 73);
  *(unsigned char *)(a1[4] + 74) = *(unsigned char *)(a1[5] + 74);
  *(unsigned char *)(a1[4] + 88) = *(unsigned char *)(a1[5] + 88);
  uint64_t v14 = [*(id *)(a1[5] + 96) copyWithZone:a1[6]];
  uint64_t v15 = a1[4];
  uint64_t v16 = *(void **)(v15 + 96);
  *(void *)(v15 + 96) = v14;

  uint64_t v17 = [*(id *)(a1[5] + 104) mutableCopyWithZone:a1[6]];
  uint64_t v18 = a1[4];
  long long v19 = *(void **)(v18 + 104);
  *(void *)(v18 + 104) = v17;

  uint64_t v20 = [*(id *)(a1[5] + 112) copyWithZone:a1[6]];
  uint64_t v21 = a1[4];
  uint64_t v22 = *(void **)(v21 + 112);
  *(void *)(v21 + 112) = v20;

  *(void *)(a1[4] + 120) = *(void *)(a1[5] + 120);
  uint64_t v23 = [*(id *)(a1[5] + 128) copyWithZone:a1[6]];
  uint64_t v24 = a1[4];
  uint64_t v25 = *(void **)(v24 + 128);
  *(void *)(v24 + 128) = v23;

  uint64_t v26 = [*(id *)(a1[5] + 136) copyWithZone:a1[6]];
  uint64_t v27 = a1[4];
  v28 = *(void **)(v27 + 136);
  *(void *)(v27 + 136) = v26;

  *(unsigned char *)(a1[4] + 144) = *(unsigned char *)(a1[5] + 144);
  objc_storeStrong((id *)(a1[4] + 152), *(id *)(a1[5] + 152));
  objc_storeStrong((id *)(a1[4] + 160), *(id *)(a1[5] + 160));
  uint64_t v29 = [*(id *)(a1[5] + 168) copyWithZone:a1[6]];
  uint64_t v30 = a1[4];
  v31 = *(void **)(v30 + 168);
  *(void *)(v30 + 168) = v29;

  *(void *)(a1[4] + 184) = *(void *)(a1[5] + 184);
  *(unsigned char *)(a1[4] + 192) = *(unsigned char *)(a1[5] + 192);
  uint64_t v32 = [*(id *)(a1[5] + 200) copyWithZone:a1[6]];
  uint64_t v33 = a1[4];
  uint64_t v34 = *(void **)(v33 + 200);
  *(void *)(v33 + 200) = v32;

  uint64_t v35 = [*(id *)(a1[5] + 208) copyWithZone:a1[6]];
  uint64_t v36 = a1[4];
  v37 = *(void **)(v36 + 208);
  *(void *)(v36 + 208) = v35;

  *(unsigned char *)(a1[4] + 216) = *(unsigned char *)(a1[5] + 216);
  uint64_t v38 = [*(id *)(a1[5] + 224) copyWithZone:a1[6]];
  uint64_t v39 = a1[4];
  v40 = *(void **)(v39 + 224);
  *(void *)(v39 + 224) = v38;

  *(void *)(a1[4] + 232) = *(void *)(a1[5] + 232);
  *(unsigned char *)(a1[4] + 240) = *(unsigned char *)(a1[5] + 240);
  *(unsigned char *)(a1[4] + 193) = *(unsigned char *)(a1[5] + 193);
  uint64_t v41 = [*(id *)(a1[5] + 248) copyWithZone:a1[6]];
  uint64_t v42 = a1[4];
  unint64_t v43 = *(void **)(v42 + 248);
  *(void *)(v42 + 248) = v41;

  uint64_t v44 = [*(id *)(a1[5] + 256) copyWithZone:a1[6]];
  uint64_t v45 = a1[4];
  uint64_t v46 = *(void **)(v45 + 256);
  *(void *)(v45 + 256) = v44;
}

- (unint64_t)hash
{
  uint64_t v2 = [(SSPurchase *)self buyParameters];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = [(SSPurchase *)self buyParameters];
    uint64_t v8 = [v4 buyParameters];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__SSPurchase_copyXPCEncoding__block_invoke;
  v8[3] = &unk_1E5BA7018;
  id v5 = v3;
  id v9 = v5;
  id v10 = self;
  dispatch_sync(dispatchQueue, v8);
  id v6 = v5;

  return v6;
}

uint64_t __29__SSPurchase_copyXPCEncoding__block_invoke(uint64_t a1)
{
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "0", *(void *)(*(void *)(a1 + 40) + 8));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "1", *(void *)(*(void *)(a1 + 40) + 16));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "2", *(void *)(*(void *)(a1 + 40) + 176));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "3", *(unsigned char *)(*(void *)(a1 + 40) + 24));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "4", *(void *)(*(void *)(a1 + 40) + 40));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "5", *(unsigned char *)(*(void *)(a1 + 40) + 72));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "6", *(unsigned char *)(*(void *)(a1 + 40) + 73));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "7", *(unsigned char *)(*(void *)(a1 + 40) + 74));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "23", *(unsigned char *)(*(void *)(a1 + 40) + 88));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "8", *(void *)(*(void *)(a1 + 40) + 96));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "9", *(void *)(*(void *)(a1 + 40) + 104));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "24", *(void *)(*(void *)(a1 + 40) + 112));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "10", *(void *)(*(void *)(a1 + 40) + 120));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "11", *(void *)(*(void *)(a1 + 40) + 128));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "20", *(void *)(*(void *)(a1 + 40) + 136));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "12", *(unsigned char *)(*(void *)(a1 + 40) + 144));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "14", *(void *)(*(void *)(a1 + 40) + 168));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "16", *(void *)(*(void *)(a1 + 40) + 184));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "25", *(unsigned char *)(*(void *)(a1 + 40) + 192));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "17", *(void *)(*(void *)(a1 + 40) + 200));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "18", *(void *)(*(void *)(a1 + 40) + 208));
  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "19", [*(id *)(a1 + 40) uniqueIdentifier]);
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_object_t v3 = [*(id *)(*(void *)(a1 + 40) + 152) rawItemDictionary];
  SSXPCDictionarySetObject(v2, "13", v3);

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(*(void *)(a1 + 40) + 160) offerIdentifier];
  SSXPCDictionarySetObject(v4, "15", v5);

  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "26", *(unsigned char *)(*(void *)(a1 + 40) + 216));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "21", *(unsigned char *)(*(void *)(a1 + 40) + 240));
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "22", *(unsigned char *)(*(void *)(a1 + 40) + 193));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "27", *(void *)(*(void *)(a1 + 40) + 224));
  SSXPCDictionarySetObject(*(void *)(a1 + 32), "28", *(void *)(*(void *)(a1 + 40) + 248));
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 256);
  return SSXPCDictionarySetObject(v6, "29", v7);
}

- (SSPurchase)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    uint64_t v6 = [(SSPurchase *)self _initSSPurchase];
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
    accountIdentifier = v6->_accountIdentifier;
    v6->_accountIdentifier = (NSNumber *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
    affiliateIdentifier = v6->_affiliateIdentifier;
    v6->_affiliateIdentifier = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
    ownerAccountDSID = v6->_ownerAccountDSID;
    v6->_ownerAccountDSID = (NSNumber *)v15;

    v6->_backgroundPurchase = xpc_dictionary_get_BOOL(v5, "3");
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v17);
    buyParameters = v6->_buyParameters;
    v6->_buyParameters = (NSString *)v18;

    v6->_createsDownloads = xpc_dictionary_get_BOOL(v5, "5");
    v6->_createsJobs = xpc_dictionary_get_BOOL(v5, "6");
    v6->_createsInstallJobs = xpc_dictionary_get_BOOL(v5, "7");
    v6->_displaysOnLockScreen = xpc_dictionary_get_BOOL(v5, "23");
    uint64_t v20 = [SSDownloadPolicy alloc];
    uint64_t v21 = xpc_dictionary_get_value(v5, "8");
    uint64_t v22 = [(SSDownloadPolicy *)v20 initWithXPCEncoding:v21];
    downloadPolicy = v6->_downloadPolicy;
    v6->_downloadPolicy = (SSDownloadPolicy *)v22;

    uint64_t v24 = objc_opt_class();
    uint64_t v25 = SSXPCDictionaryCopyObjectWithClass(v5, "24", v24);
    enabledServiceType = v6->_enabledServiceType;
    v6->_enabledServiceType = (NSNumber *)v25;

    v6->_expectedDownloadFileSize = xpc_dictionary_get_int64(v5, "10");
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v27);
    filteredAssetTypes = v6->_filteredAssetTypes;
    v6->_filteredAssetTypes = (NSArray *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v31 = SSXPCDictionaryCopyObjectWithClass(v5, "20", v30);
    gratisIdentifiers = v6->_gratisIdentifiers;
    v6->_gratisIdentifiers = (NSArray *)v31;

    v6->_ignoresForcedPasswordRestriction = xpc_dictionary_get_BOOL(v5, "12");
    v6->_placeholderDownloadIdentifier = xpc_dictionary_get_int64(v5, "16");
    v6->_playbackRequest = xpc_dictionary_get_BOOL(v5, "25");
    uint64_t v33 = [SSNetworkConstraints alloc];
    uint64_t v34 = xpc_dictionary_get_value(v5, "14");
    uint64_t v35 = [(SSNetworkConstraints *)v33 initWithXPCEncoding:v34];
    networkConstraints = v6->_networkConstraints;
    v6->_networkConstraints = (SSNetworkConstraints *)v35;

    v37 = [SSURLRequestProperties alloc];
    uint64_t v38 = xpc_dictionary_get_value(v5, "17");
    uint64_t v39 = [(SSURLRequestProperties *)v37 initWithXPCEncoding:v38];
    requestProperties = v6->_requestProperties;
    v6->_requestProperties = (SSURLRequestProperties *)v39;

    v6->_uniqueIdentifier = xpc_dictionary_get_int64(v5, "19");
    v6->_usesLocalRedownloadParametersIfPossible = xpc_dictionary_get_BOOL(v5, "21");
    v6->_preauthenticated = xpc_dictionary_get_BOOL(v5, "22");
    v6->_skipSoftwareAccountPreflight = xpc_dictionary_get_BOOL(v5, "26");
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = SSXPCDictionaryCopyObjectWithClass(v5, "27", v41);
    tidHeaders = v6->_tidHeaders;
    v6->_tidHeaders = (NSDictionary *)v42;

    uint64_t v44 = objc_opt_class();
    uint64_t v45 = SSXPCDictionaryCopyObjectWithClass(v5, "29", v44);
    presentingSceneBundleIdentifier = v6->_presentingSceneBundleIdentifier;
    v6->_presentingSceneBundleIdentifier = (NSString *)v45;

    uint64_t v47 = objc_opt_class();
    uint64_t v48 = SSXPCDictionaryCopyObjectWithClass(v5, "28", v47);
    presentingSceneIdentifier = v6->_presentingSceneIdentifier;
    v6->_presentingSceneIdentifier = (NSString *)v48;

    self = (SSPurchase *)SSXPCDictionaryCopyCFObject(v5, "18");
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      objc_storeStrong(&v6->_requiredDeviceCapabilities, self);
    }
    uint64_t v50 = objc_opt_class();
    int v51 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "9", v50);
    uint64_t v52 = [v51 mutableCopy];
    downloadProperties = v6->_downloadProperties;
    v6->_downloadProperties = (NSMutableDictionary *)v52;

    uint64_t v54 = objc_opt_class();
    uint64_t v55 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "13", v54);
    if (v55)
    {
      uint64_t v56 = [[SSItem alloc] initWithItemDictionary:v55];
      item = v6->_item;
      v6->_item = v56;
    }
    uint64_t v58 = objc_opt_class();
    uint64_t v59 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "15", v58);
    if (v59)
    {
      uint64_t v60 = [(SSItem *)v6->_item itemOfferForIdentifier:v59];
      itemOffer = v6->_itemOffer;
      v6->_itemOffer = (SSItemOffer *)v60;

      if (!v6->_itemOffer)
      {
        uint64_t v62 = [(SSItem *)v6->_item defaultItemOffer];
        v63 = v6->_itemOffer;
        v6->_itemOffer = (SSItemOffer *)v62;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)downloadMetadata
{
  return 0;
}

- (void)setDownloadMetadata:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SSPurchase_setDownloadMetadata___block_invoke;
  v7[3] = &unk_1E5BA7018;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __34__SSPurchase_setDownloadMetadata___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) newDownloadProperties];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 104);
  *(void *)(v3 + 104) = v2;
}

- (BOOL)skipSoftwareAccountPreflight
{
  return self->_skipSoftwareAccountPreflight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSceneBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_presentingSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_tidHeaders, 0);
  objc_storeStrong(&self->_requiredDeviceCapabilities, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_ownerAccountDSID, 0);
  objc_storeStrong((id *)&self->_networkConstraints, 0);
  objc_storeStrong((id *)&self->_itemOffer, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_gratisIdentifiers, 0);
  objc_storeStrong((id *)&self->_filteredAssetTypes, 0);
  objc_storeStrong((id *)&self->_enabledServiceType, 0);
  objc_storeStrong((id *)&self->_downloadProperties, 0);
  objc_storeStrong((id *)&self->_downloadPolicy, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_buyParamsCreatesJobs, 0);
  objc_storeStrong((id *)&self->_buyParamsCreatesInstallJobs, 0);
  objc_storeStrong((id *)&self->_buyParamsCreatesDownloads, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_affiliateIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

+ (id)newPurchaseWithDatabaseEncoding:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:0];
  }
  else
  {
    id v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = [v4 objectForKey:@"03"];
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 BOOLValue]) {
      id v5 = (objc_class *)objc_opt_class();
    }
    uint64_t v7 = (void *)[[v5 alloc] _initSSPurchase];
    [v7 _setValuesUsingDatabaseEncoding:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)newPurchaseWithXPCEncoding:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && MEMORY[0x1A62689E0](v3) == MEMORY[0x1E4F14590])
  {
    id v6 = (objc_class *)objc_opt_class();
    if (xpc_dictionary_get_BOOL(v4, "55")) {
      id v6 = (objc_class *)objc_opt_class();
    }
    id v5 = (void *)[[v6 alloc] initWithXPCEncoding:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end