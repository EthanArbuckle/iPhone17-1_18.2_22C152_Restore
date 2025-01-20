@interface ICStoreMediaResponseItem
- (BOOL)isPurchasedRedownload;
- (ICStoreFinanceItemMetadata)metadata;
- (ICStoreHLSAssetInfo)hlsAsset;
- (ICStoreMediaResponseItem)initWithItemResponseDictionary:(id)a3 urlBag:(id)a4;
- (NSArray)fileAssets;
- (NSDate)assetExpirationDate;
- (NSDate)purchaseDate;
- (NSString)downloadIdentifier;
- (NSString)redownloadParameters;
- (NSURL)artworkURL;
- (NSURL)cancelDownloadURL;
- (id)downloadableAsset;
- (id)downloadableAssetMatchingFlavorType:(int64_t)a3;
- (id)suzeLeaseID;
- (int64_t)storeAdamID;
- (void)setAssetExpirationDate:(id)a3;
@end

@implementation ICStoreMediaResponseItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetExpirationDate, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);

  objc_storeStrong((id *)&self->_itemResponseDictionary, 0);
}

- (void)setAssetExpirationDate:(id)a3
{
}

- (NSDate)assetExpirationDate
{
  return self->_assetExpirationDate;
}

- (id)downloadableAssetMatchingFlavorType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(ICStoreMediaResponseItem *)self fileAssets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 flavorType] == a3)
        {
          v10 = [v9 assetURL];

          if (v10)
          {
            id v11 = v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

- (id)downloadableAsset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(ICStoreMediaResponseItem *)self fileAssets];
  id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = [v6 assetURL];

        if (v7)
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (ICStoreHLSAssetInfo)hlsAsset
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [[ICStoreHLSAssetInfo alloc] initWithItemResponseDictionary:self->_itemResponseDictionary];
  uint64_t v4 = [(ICStoreHLSAssetInfo *)v3 keyServerURL];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        [(ICStoreHLSAssetInfo *)v3 keyCertificateURL],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    uint64_t v7 = [(ICStoreHLSAssetInfo *)v3 keyServerProtocolType];
    v8 = v7;
    if (v7 == @"simplified") {
      int v9 = 1;
    }
    else {
      int v9 = [(__CFString *)v7 isEqual:@"simplified"];
    }

    long long v10 = [(ICURLBag *)self->_urlBag enhancedAudioConfiguration];
    long long v11 = [(ICStoreHLSAssetInfo *)v3 keyServerURL];

    if (!v11)
    {
      if (v9 && ([v10 keyServerURL], (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        long long v13 = (void *)v12;
        uint64_t v14 = [v10 keyServerURL];
      }
      else
      {
        uint64_t v14 = [(ICURLBag *)self->_urlBag urlForBagKey:@"fps-request"];
      }
      [(ICStoreHLSAssetInfo *)v3 setKeyServerURL:v14];
    }
    long long v15 = [(ICStoreHLSAssetInfo *)v3 keyCertificateURL];

    if (!v15)
    {
      if (v9 && ([v10 certificateURL], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v17 = (void *)v16;
        uint64_t v18 = [v10 certificateURL];
      }
      else
      {
        uint64_t v18 = [(ICURLBag *)self->_urlBag urlForBagKey:@"fps-cert"];
      }
      [(ICStoreHLSAssetInfo *)v3 setKeyCertificateURL:v18];
    }
  }
  if ([(ICStoreMediaResponseItem *)self storeAdamID])
  {
    v19 = objc_msgSend(NSNumber, "numberWithLongLong:", -[ICStoreMediaResponseItem storeAdamID](self, "storeAdamID"));
    [(ICStoreHLSAssetInfo *)v3 setKeyServerAdamID:v19];

    goto LABEL_27;
  }
  v20 = [(ICStoreHLSAssetInfo *)v3 keyServerURL];
  if (v20)
  {
  }
  else
  {
    v21 = [(ICStoreHLSAssetInfo *)v3 keyCertificateURL];

    if (!v21) {
      goto LABEL_27;
    }
  }
  v22 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    itemResponseDictionary = self->_itemResponseDictionary;
    int v25 = 138543618;
    v26 = self;
    __int16 v27 = 2114;
    v28 = itemResponseDictionary;
    _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Payload contains HLS asset without an adam ID, which is unexpected: %{public}@", (uint8_t *)&v25, 0x16u);
  }

LABEL_27:

  return v3;
}

- (NSArray)fileAssets
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"assets"];
  if (_NSIsNSArray())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = v3;
    uint64_t v5 = [(ICStoreFileAssetInfo *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            long long v11 = [ICStoreFileAssetInfo alloc];
            uint64_t v12 = -[ICStoreFileAssetInfo initWithFileAssetResponseDictionary:](v11, "initWithFileAssetResponseDictionary:", v10, (void)v14);
            [(ICStoreFileAssetInfo *)v12 setExpectedProtectionType:2];
            if (v12)
            {
              if (!v7) {
                uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[ICStoreFileAssetInfo count](v4, "count"));
              }
              [v7 addObject:v12];
            }
          }
        }
        uint64_t v6 = [(ICStoreFileAssetInfo *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v4 = [[ICStoreFileAssetInfo alloc] initWithFileAssetResponseDictionary:self->_itemResponseDictionary];
    uint64_t v7 = [(ICStoreFileAssetInfo *)v4 assetURL];

    if (v7)
    {
      uint64_t v18 = v4;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    }
  }

  return (NSArray *)v7;
}

- (id)suzeLeaseID
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"lease-id"];
  if ([v2 isEqual:@"null"])
  {

    v2 = 0;
  }

  return v2;
}

- (NSString)redownloadParameters
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"redownload-parameters"];
  if (_NSIsNSString()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = v3;

  return v4;
}

- (NSDate)purchaseDate
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"purchaseDate"];
  if (v2)
  {
    if (purchaseDate_sOnceToken != -1) {
      dispatch_once(&purchaseDate_sOnceToken, &__block_literal_global_4603);
    }
    id v3 = [(id)purchaseDate_sPurchaseDateFormatter dateFromString:v2];
  }
  else
  {
    id v3 = 0;
  }

  return (NSDate *)v3;
}

void __40__ICStoreMediaResponseItem_purchaseDate__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)purchaseDate_sPurchaseDateFormatter;
  purchaseDate_sPurchaseDateFormatter = (uint64_t)v0;

  [(id)purchaseDate_sPurchaseDateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
  v2 = (void *)purchaseDate_sPurchaseDateFormatter;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)purchaseDate_sPurchaseDateFormatter setLenient:1];
  uint64_t v4 = (void *)purchaseDate_sPurchaseDateFormatter;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v4 setTimeZone:v5];
}

- (ICStoreFinanceItemMetadata)metadata
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"metadata"];
  if (_NSIsNSDictionary()) {
    id v3 = [[ICStoreFinanceItemMetadata alloc] initWithMetadataDictionary:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)isPurchasedRedownload
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"purchased-redownload"];
  if (_NSIsNSNumber()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSString)downloadIdentifier
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"download-id"];
  if (_NSIsNSString()) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  uint64_t v4 = v3;

  return v4;
}

- (NSURL)cancelDownloadURL
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"cancel-download-url"];
  if (_NSIsNSString())
  {
    char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)artworkURL
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"artworkURL"];
  if (_NSIsNSString())
  {
    char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (NSURL *)v3;
}

- (int64_t)storeAdamID
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"songId"];
  if (_NSIsNSNumber()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (ICStoreMediaResponseItem)initWithItemResponseDictionary:(id)a3 urlBag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICStoreMediaResponseItem;
  int v9 = [(ICStoreMediaResponseItem *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemResponseDictionary, a3);
    objc_storeStrong((id *)&v10->_urlBag, a4);
  }

  return v10;
}

@end