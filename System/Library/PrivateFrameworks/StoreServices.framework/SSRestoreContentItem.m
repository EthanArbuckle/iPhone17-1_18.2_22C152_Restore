@interface SSRestoreContentItem
- (BOOL)isDRMFree;
- (BOOL)isEligibleForRestore:(id *)a3;
- (NSNumber)cloudItemID;
- (NSNumber)cloudMatchStatus;
- (NSNumber)storeAccountID;
- (NSNumber)storeItemID;
- (NSNumber)storeOriginalPurchaserAccountID;
- (NSString)bundleID;
- (NSString)downloadKind;
- (NSString)podcastEpisodeGUID;
- (NSString)storeAccountAppleID;
- (NSString)storeFlavor;
- (NSString)storeFrontID;
- (NSString)storeSoftwareVersionID;
- (NSString)title;
- (NSString)videoDimensions;
- (SSRestoreContentItem)initWithRestoreDownload:(id)a3;
- (id)_initSSRestoreContentItem;
- (id)_restoreKeyForAssetProperty:(id)a3;
- (id)_restoreKeyForDownloadProperty:(id)a3;
- (id)copyRestoreDictionary;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)dealloc;
- (void)setBundleID:(id)a3;
- (void)setCloudItemID:(id)a3;
- (void)setCloudMatchStatus:(id)a3;
- (void)setDRMFree:(BOOL)a3;
- (void)setDownloadKind:(id)a3;
- (void)setPodcastEpisodeGUID:(id)a3;
- (void)setStoreAccountAppleID:(id)a3;
- (void)setStoreAccountID:(id)a3;
- (void)setStoreFlavor:(id)a3;
- (void)setStoreFrontID:(id)a3;
- (void)setStoreItemID:(id)a3;
- (void)setStoreOriginalPurchaserAccountID:(id)a3;
- (void)setStoreSoftwareVersionID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3 forAssetProperty:(id)a4;
- (void)setValue:(id)a3 forDownloadProperty:(id)a4;
- (void)setVideoDimensions:(id)a3;
@end

@implementation SSRestoreContentItem

- (id)_initSSRestoreContentItem
{
  v4.receiver = self;
  v4.super_class = (Class)SSRestoreContentItem;
  v2 = [(SSRestoreContentItem *)&v4 init];
  if (v2) {
    v2->_properties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (SSRestoreContentItem)initWithRestoreDownload:(id)a3
{
  v11[12] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(SSRestoreContentItem *)self _initSSRestoreContentItem];
  if (v4)
  {
    v11[0] = @"c";
    v11[1] = @"A";
    v11[2] = @"1";
    v11[3] = @"V";
    v11[4] = @"U";
    v11[5] = @"Z";
    v11[6] = @"4";
    v11[7] = @"T";
    v11[8] = @"7";
    v11[9] = @"01";
    v11[10] = @"Y";
    v11[11] = @"R";
    [a3 getValues:v10 forProperties:v11 count:12];
    for (uint64_t i = 0; i != 12; ++i)
      [(SSRestoreContentItem *)v4 setValue:*(void *)&v10[i * 8] forDownloadProperty:v11[i]];
    v9[0] = @"h";
    v9[1] = @"f";
    v9[2] = @"g";
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "assetsForType:", @"media"), "lastObject"), "getValues:forProperties:count:", v8, v9, 3);
    for (uint64_t j = 0; j != 3; ++j)
      [(SSRestoreContentItem *)v4 setValue:*(void *)&v8[j * 8] forAssetProperty:v9[j]];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSRestoreContentItem;
  [(SSRestoreContentItem *)&v3 dealloc];
}

- (NSNumber)cloudItemID
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"cloud-id"];
  return (NSNumber *)v2;
}

- (NSNumber)cloudMatchStatus
{
  id v2 = self->_cloudMatchStatus;
  return v2;
}

- (id)copyRestoreDictionary
{
  objc_super v3 = 0;
  if ([(SSRestoreContentItem *)self isEligibleForRestore:0])
  {
    objc_super v3 = (void *)[(NSMutableDictionary *)self->_properties mutableCopy];
    if ([v3 objectForKey:@"flavor"])
    {
      [v3 removeObjectForKey:@"drm-free"];
      [v3 removeObjectForKey:@"dimensions"];
    }
    objc_super v4 = (void *)[v3 objectForKey:@"store-front-id"];
    if (v4
      || (objc_super v4 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "storeFrontIdentifier")) != 0)
    {
      [v3 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v4, "integerValue")), @"store-front-id" forKey];
    }
    originalPurchaserAccountID = self->_originalPurchaserAccountID;
    if (originalPurchaserAccountID) {
      [v3 setObject:originalPurchaserAccountID forKey:@"ownerDsid"];
    }
  }
  return v3;
}

- (NSString)downloadKind
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"kind"];
  return (NSString *)v2;
}

- (BOOL)isDRMFree
{
  id v2 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:@"drm-free"];
  return [v2 BOOLValue];
}

- (BOOL)isEligibleForRestore:(id *)a3
{
  if (self->_isRestore)
  {
    uint64_t v5 = SSGetItemIdentifierFromValue([(NSMutableDictionary *)self->_properties objectForKey:@"cloud-id"]);
    uint64_t v6 = SSGetItemIdentifierFromValue([(NSMutableDictionary *)self->_properties objectForKey:@"item-id"]);
    v7 = (void *)[(NSMutableDictionary *)self->_properties objectForKey:@"kind"];
    if (SSDownloadKindIsPodcastKind(v7))
    {
      if (!v6 && ![(NSMutableDictionary *)self->_properties objectForKey:@"episode-guid"]) {
        goto LABEL_8;
      }
    }
    else
    {
      if (!(v5 | v6))
      {
LABEL_8:
        uint64_t v8 = 116;
        goto LABEL_24;
      }
      if (!self->_accountID && !self->_appleID)
      {
        uint64_t v8 = 119;
        goto LABEL_24;
      }
      if (!v7)
      {
        uint64_t v8 = 117;
        goto LABEL_24;
      }
      if (SSDownloadKindIsMediaKind(v7))
      {
        if ([(NSMutableDictionary *)self->_properties objectForKey:@"dimensions"]) {
          goto LABEL_20;
        }
      }
      else if ((SSDownloadKindIsEBookKind(v7, v9) & 1) == 0 && !SSDownloadKindIsToneKind(v7))
      {
        BOOL v11 = 0;
        v10 = 0;
        goto LABEL_25;
      }
      if (![(NSMutableDictionary *)self->_properties objectForKey:@"drm-free"]
        && ![(NSMutableDictionary *)self->_properties objectForKey:@"flavor"])
      {
        uint64_t v8 = 118;
        goto LABEL_24;
      }
    }
LABEL_20:
    v10 = 0;
    BOOL v11 = 1;
    goto LABEL_25;
  }
  uint64_t v8 = 100;
LABEL_24:
  v10 = (void *)SSError(@"SSErrorDomain", v8, 0, 0);
  BOOL v11 = 0;
LABEL_25:
  if (a3) {
    *a3 = v10;
  }
  return v11;
}

- (NSString)podcastEpisodeGUID
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"episode-guid"];
  return (NSString *)v2;
}

- (void)setCloudItemID:(id)a3
{
}

- (void)setCloudMatchStatus:(id)a3
{
  cloudMatchStatus = self->_cloudMatchStatus;
  if (cloudMatchStatus != a3)
  {

    self->_cloudMatchStatus = (NSNumber *)a3;
  }
}

- (void)setDownloadKind:(id)a3
{
}

- (void)setDRMFree:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSRestoreContentItem *)self _setValue:v4 forProperty:@"drm-free"];
}

- (void)setStoreOriginalPurchaserAccountID:(id)a3
{
  originalPurchaserAccountID = self->_originalPurchaserAccountID;
  if (originalPurchaserAccountID != a3)
  {

    self->_originalPurchaserAccountID = (NSNumber *)a3;
  }
}

- (void)setPodcastEpisodeGUID:(id)a3
{
}

- (void)setStoreAccountAppleID:(id)a3
{
  appleID = self->_appleID;
  if (appleID != a3)
  {

    self->_appleID = (NSString *)[a3 copy];
  }
}

- (void)setStoreAccountID:(id)a3
{
  accountID = self->_accountID;
  if (accountID != a3)
  {

    self->_accountID = (NSNumber *)a3;
  }
}

- (void)setStoreFlavor:(id)a3
{
}

- (void)setStoreFrontID:(id)a3
{
}

- (void)setStoreItemID:(id)a3
{
}

- (void)setStoreSoftwareVersionID:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setValue:(id)a3 forAssetProperty:(id)a4
{
  id v6 = [(SSRestoreContentItem *)self _restoreKeyForAssetProperty:a4];
  [(SSRestoreContentItem *)self _setValue:a3 forProperty:v6];
}

- (void)setValue:(id)a3 forDownloadProperty:(id)a4
{
  id v7 = [(SSRestoreContentItem *)self _restoreKeyForDownloadProperty:a4];
  if (v7)
  {
    [(SSRestoreContentItem *)self _setValue:a3 forProperty:v7];
  }
  else if ([a4 isEqualToString:@"c"])
  {
    [(SSRestoreContentItem *)self setBundleID:a3];
  }
  else if ([a4 isEqualToString:@"V"])
  {
    self->_isRestore = [a3 BOOLValue];
  }
  else if ([a4 isEqualToString:@"Z"])
  {
    [(SSRestoreContentItem *)self setStoreAccountAppleID:a3];
  }
  else if ([a4 isEqualToString:@"U"])
  {
    [(SSRestoreContentItem *)self setStoreAccountID:a3];
  }
  else if ([a4 isEqualToString:@"01"])
  {
    [(SSRestoreContentItem *)self setCloudMatchStatus:a3];
  }
  else if ([a4 isEqualToString:@"2"])
  {
    [(SSRestoreContentItem *)self setTitle:a3];
  }
}

- (void)setVideoDimensions:(id)a3
{
}

- (NSString)storeAccountAppleID
{
  id v2 = self->_appleID;
  return v2;
}

- (NSNumber)storeAccountID
{
  id v2 = self->_accountID;
  return v2;
}

- (NSString)storeFlavor
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"flavor"];
  return (NSString *)v2;
}

- (NSString)storeFrontID
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"store-front-id"];
  return (NSString *)v2;
}

- (NSNumber)storeItemID
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"item-id"];
  return (NSNumber *)v2;
}

- (NSNumber)storeOriginalPurchaserAccountID
{
  id v2 = self->_originalPurchaserAccountID;
  return v2;
}

- (NSString)storeSoftwareVersionID
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"software-external-version-identifier"];
  return (NSString *)v2;
}

- (NSString)title
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"title"];
  return (NSString *)v2;
}

- (NSString)videoDimensions
{
  id v2 = (id)[(NSMutableDictionary *)self->_properties objectForKey:@"dimensions"];
  return (NSString *)v2;
}

- (id)_restoreKeyForAssetProperty:(id)a3
{
  uint64_t v4 = 0;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = @"f";
  id v7 = @"g";
  uint64_t v8 = @"h";
  while (!-[__CFString isEqualToString:](*(__CFString **)((char *)&v6 + v4 * 8), "isEqualToString:", a3, v6, v7, v8, v9))
  {
    if (++v4 == 3) {
      return 0;
    }
  }
  return off_1E5BABBD0[v4];
}

- (id)_restoreKeyForDownloadProperty:(id)a3
{
  uint64_t v4 = 0;
  v6[6] = *MEMORY[0x1E4F143B8];
  v6[0] = @"1";
  v6[1] = @"A";
  v6[2] = @"7";
  v6[3] = @"4";
  v6[4] = @"T";
  v6[5] = @"R";
  while (![(id)v6[v4] isEqualToString:a3])
  {
    if (++v4 == 6) {
      return 0;
    }
  }
  return off_1E5BABBE8[v4];
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  if (a4)
  {
    if (a3)
    {
      if ([a3 conformsToProtocol:&unk_1EF9AC4F0])
      {
        id v9 = (id)[a3 copy];
        [(NSMutableDictionary *)self->_properties setObject:v9 forKey:a4];
      }
      else
      {
        properties = self->_properties;
        [(NSMutableDictionary *)properties setObject:a3 forKey:a4];
      }
    }
    else
    {
      id v7 = self->_properties;
      [(NSMutableDictionary *)v7 removeObjectForKey:a4];
    }
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

@end