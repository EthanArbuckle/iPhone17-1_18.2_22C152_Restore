@interface DemotedApplication
- (DemotedApplication)initWithApplication:(id)a3;
- (DemotedApplication)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)downloaderIdentifier;
- (NSNumber)externalVersionIdentifier;
- (NSNumber)familyIdentifier;
- (NSNumber)itemIdentifier;
- (NSNumber)purchaserIdentifier;
- (NSNumber)storeFrontIdentifier;
- (NSString)accountIdentifier;
- (NSString)vendorIdentifier;
- (RestoreDownloadItem)restoreDownloadItem;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setDownloaderIdentifier:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setFamilyIdentifier:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setPurchaserIdentifier:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
- (void)setVendorIdentifier:(id)a3;
@end

@implementation DemotedApplication

- (DemotedApplication)initWithApplication:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)DemotedApplication;
  v5 = [(DemotedApplication *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 applicationDSID];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 downloaderDSID];
    downloaderIdentifier = v5->_downloaderIdentifier;
    v5->_downloaderIdentifier = (NSNumber *)v8;

    uint64_t v10 = [v4 externalVersionIdentifier];
    externalVersionIdentifier = v5->_externalVersionIdentifier;
    v5->_externalVersionIdentifier = (NSNumber *)v10;

    uint64_t v12 = [v4 familyID];
    familyIdentifier = v5->_familyIdentifier;
    v5->_familyIdentifier = (NSNumber *)v12;

    uint64_t v14 = [v4 itemID];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSNumber *)v14;

    uint64_t v16 = [v4 purchaserDSID];
    purchaserIdentifier = v5->_purchaserIdentifier;
    v5->_purchaserIdentifier = (NSNumber *)v16;

    uint64_t v18 = [v4 storeFront];
    storeFrontIdentifier = v5->_storeFrontIdentifier;
    v5->_storeFrontIdentifier = (NSNumber *)v18;

    v20 = [v4 deviceIdentifierForVendor];
    uint64_t v21 = [v20 UUIDString];
    vendorIdentifier = v5->_vendorIdentifier;
    v5->_vendorIdentifier = (NSString *)v21;
  }
  return v5;
}

- (DemotedApplication)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DemotedApplication;
  v5 = [(DemotedApplication *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"accountId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_accountIdentifier, v6);
    }
    v7 = [v4 objectForKey:@"downloaderId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_downloaderIdentifier, v7);
    }
    uint64_t v8 = [v4 objectForKey:@"softwareVersionExternalIdentifier"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_externalVersionIdentifier, v8);
    }
    v9 = [v4 objectForKey:@"familyId"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_familyIdentifier, v9);
    }
    uint64_t v10 = [v4 objectForKey:@"itemId"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_itemIdentifier, v10);
    }
    v11 = [v4 objectForKey:@"purchaserId"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_purchaserIdentifier, v11);
    }
    uint64_t v12 = [v4 objectForKey:@"s"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_storeFrontIdentifier, v12);
    }
    v13 = [v4 objectForKey:@"vid"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_vendorIdentifier, v13);
    }
  }
  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  externalVersionIdentifier = self->_externalVersionIdentifier;
  if (externalVersionIdentifier) {
    [v3 setObject:externalVersionIdentifier forKey:@"softwareVersionExternalIdentifier"];
  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier) {
    [v4 setObject:itemIdentifier forKey:@"itemId"];
  }
  storeFrontIdentifier = self->_storeFrontIdentifier;
  if (storeFrontIdentifier) {
    [v4 setObject:storeFrontIdentifier forKey:@"s"];
  }
  vendorIdentifier = self->_vendorIdentifier;
  if (vendorIdentifier) {
    [v4 setObject:vendorIdentifier forKey:@"vid"];
  }
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier) {
    [v4 setObject:accountIdentifier forKey:@"accountId"];
  }
  downloaderIdentifier = self->_downloaderIdentifier;
  if (downloaderIdentifier) {
    [v4 setObject:downloaderIdentifier forKey:@"downloaderId"];
  }
  familyIdentifier = self->_familyIdentifier;
  if (familyIdentifier) {
    [v4 setObject:familyIdentifier forKey:@"familyId"];
  }
  purchaserIdentifier = self->_purchaserIdentifier;
  if (purchaserIdentifier) {
    [v4 setObject:purchaserIdentifier forKey:@"purchaserId"];
  }

  return (NSDictionary *)v4;
}

- (RestoreDownloadItem)restoreDownloadItem
{
  v3 = objc_alloc_init(RestoreDownloadItem);
  [(RestoreDownloadItem *)v3 setDownloadKind:SSDownloadKindSoftwareApplication];
  [(RestoreDownloadItem *)v3 setHasRestoreData:0];
  [(RestoreDownloadItem *)v3 setRestoreDataSize:0];
  id v4 = [(NSNumber *)self->_storeFrontIdentifier stringValue];
  [(RestoreDownloadItem *)v3 setStoreFrontID:v4];

  [(RestoreDownloadItem *)v3 setStoreItemID:self->_itemIdentifier];
  v5 = [(NSNumber *)self->_externalVersionIdentifier stringValue];
  [(RestoreDownloadItem *)v3 setStoreSoftwareVersionID:v5];

  [(RestoreDownloadItem *)v3 setVendorIdentifier:self->_vendorIdentifier];
  if ([(NSNumber *)self->_familyIdentifier longLongValue])
  {
    [(RestoreDownloadItem *)v3 setStoreAccountID:self->_downloaderIdentifier];
    [(RestoreDownloadItem *)v3 setStoreOriginalPurchaserAccountID:self->_purchaserIdentifier];
  }
  else
  {
    uint64_t v6 = SSAccountGetUniqueIdentifierFromValue();
    [(RestoreDownloadItem *)v3 setStoreAccountID:v6];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAccountIdentifier:self->_accountIdentifier];
  [v4 setDownloaderIdentifier:self->_downloaderIdentifier];
  [v4 setExternalVersionIdentifier:self->_externalVersionIdentifier];
  [v4 setFamilyIdentifier:self->_familyIdentifier];
  [v4 setItemIdentifier:self->_itemIdentifier];
  [v4 setPurchaserIdentifier:self->_purchaserIdentifier];
  [v4 setStoreFrontIdentifier:self->_storeFrontIdentifier];
  [v4 setVendorIdentifier:self->_vendorIdentifier];
  return v4;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSNumber)downloaderIdentifier
{
  return self->_downloaderIdentifier;
}

- (void)setDownloaderIdentifier:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (NSNumber)familyIdentifier
{
  return self->_familyIdentifier;
}

- (void)setFamilyIdentifier:(id)a3
{
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSNumber)purchaserIdentifier
{
  return self->_purchaserIdentifier;
}

- (void)setPurchaserIdentifier:(id)a3
{
}

- (NSNumber)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_purchaserIdentifier, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_familyIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_downloaderIdentifier, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end