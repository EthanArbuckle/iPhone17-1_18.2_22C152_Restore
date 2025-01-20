@interface FCOngoingPurchaseEntry
+ (id)dummyOngoingPurchaseEntryWithTagID:(id)a3;
- (BOOL)webAccessOptIn;
- (FCOngoingPurchaseEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4;
- (FCOngoingPurchaseEntry)initWithEntryID:(id)a3 tagID:(id)a4 purchaseID:(id)a5 productID:(id)a6 bundleID:(id)a7 webAccessOptIn:(BOOL)a8 appAdamID:(id)a9 storeExternalVersion:(id)a10 vendorIdentifier:(id)a11 purchaseInitiatedTime:(id)a12 price:(id)a13;
- (NSDate)purchaseInitiatedTime;
- (NSNumber)appAdamID;
- (NSNumber)price;
- (NSNumber)storeExternalVersion;
- (NSString)bundleID;
- (NSString)identifier;
- (NSString)productID;
- (NSString)purchaseID;
- (NSString)tagID;
- (NSString)vendorIdentifier;
- (id)dictionaryRepresentation;
- (void)setAppAdamID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPrice:(id)a3;
- (void)setProductID:(id)a3;
- (void)setPurchaseID:(id)a3;
- (void)setPurchaseInitiatedTime:(id)a3;
- (void)setStoreExternalVersion:(id)a3;
- (void)setTagID:(id)a3;
- (void)setVendorIdentifier:(id)a3;
- (void)setWebAccessOptIn:(BOOL)a3;
@end

@implementation FCOngoingPurchaseEntry

- (FCOngoingPurchaseEntry)initWithEntryID:(id)a3 tagID:(id)a4 purchaseID:(id)a5 productID:(id)a6 bundleID:(id)a7 webAccessOptIn:(BOOL)a8 appAdamID:(id)a9 storeExternalVersion:(id)a10 vendorIdentifier:(id)a11 purchaseInitiatedTime:(id)a12 price:(id)a13
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v55 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v49 = (void *)[[NSString alloc] initWithFormat:@"ongoing purchase entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExt"
          "ernalVersion:vendorIdentifier:purchaseInitiatedTime:price:]";
    __int16 v59 = 2080;
    v60 = "FCOngoingPurchaseEntry.m";
    __int16 v61 = 1024;
    int v62 = 53;
    __int16 v63 = 2114;
    v64 = v49;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18) {
      goto LABEL_6;
    }
  }
  else if (v18)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v50 = (void *)[[NSString alloc] initWithFormat:@"ongoing purchase entry must have an tag ID"];
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExt"
          "ernalVersion:vendorIdentifier:purchaseInitiatedTime:price:]";
    __int16 v59 = 2080;
    v60 = "FCOngoingPurchaseEntry.m";
    __int16 v61 = 1024;
    int v62 = 54;
    __int16 v63 = 2114;
    v64 = v50;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v51 = (void *)[[NSString alloc] initWithFormat:@"ongoing purchase entry must have an product identifier"];
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExt"
          "ernalVersion:vendorIdentifier:purchaseInitiatedTime:price:]";
    __int16 v59 = 2080;
    v60 = "FCOngoingPurchaseEntry.m";
    __int16 v61 = 1024;
    int v62 = 55;
    __int16 v63 = 2114;
    v64 = v51;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19) {
      goto LABEL_11;
    }
  }
  else if (v19)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v52 = (void *)[[NSString alloc] initWithFormat:@"ongoing purchase entry must have an purchase ID"];
    *(_DWORD *)buf = 136315906;
    v58 = "-[FCOngoingPurchaseEntry initWithEntryID:tagID:purchaseID:productID:bundleID:webAccessOptIn:appAdamID:storeExt"
          "ernalVersion:vendorIdentifier:purchaseInitiatedTime:price:]";
    __int16 v59 = 2080;
    v60 = "FCOngoingPurchaseEntry.m";
    __int16 v61 = 1024;
    int v62 = 56;
    __int16 v63 = 2114;
    v64 = v52;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
  v56.receiver = self;
  v56.super_class = (Class)FCOngoingPurchaseEntry;
  v26 = [(FCOngoingPurchaseEntry *)&v56 init];
  v27 = v26;
  if (v26)
  {
    if (v17)
    {
      uint64_t v28 = [v17 copy];
      identifier = v27->_identifier;
      v27->_identifier = (NSString *)v28;

      uint64_t v30 = [v18 copy];
      tagID = v27->_tagID;
      v27->_tagID = (NSString *)v30;

      uint64_t v32 = [v19 copy];
      purchaseID = v27->_purchaseID;
      v27->_purchaseID = (NSString *)v32;

      uint64_t v34 = [v20 copy];
      productID = v27->_productID;
      v27->_productID = (NSString *)v34;

      uint64_t v36 = [v55 copy];
      bundleID = v27->_bundleID;
      v27->_bundleID = (NSString *)v36;

      uint64_t v38 = [v21 copy];
      appAdamID = v27->_appAdamID;
      v27->_appAdamID = (NSNumber *)v38;

      v27->_webAccessOptIn = a8;
      uint64_t v40 = [v22 copy];
      storeExternalVersion = v27->_storeExternalVersion;
      v27->_storeExternalVersion = (NSNumber *)v40;

      uint64_t v42 = [v23 copy];
      vendorIdentifier = v27->_vendorIdentifier;
      v27->_vendorIdentifier = (NSString *)v42;

      uint64_t v44 = [v24 copy];
      purchaseInitiatedTime = v27->_purchaseInitiatedTime;
      v27->_purchaseInitiatedTime = (NSDate *)v44;

      uint64_t v46 = [v25 copy];
      price = v27->_price;
      v27->_price = (NSNumber *)v46;
    }
    else
    {
      price = v26;
      v27 = 0;
    }
  }
  return v27;
}

- (FCOngoingPurchaseEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)[[NSString alloc] initWithFormat:@"ongoing purchase entry must have an identifier"];
    *(_DWORD *)buf = 136315906;
    id v23 = "-[FCOngoingPurchaseEntry initWithEntryID:dictionaryRepresentation:]";
    __int16 v24 = 2080;
    id v25 = "FCOngoingPurchaseEntry.m";
    __int16 v26 = 1024;
    int v27 = 84;
    __int16 v28 = 2114;
    v29 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v7 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryTagID"];
  v8 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryPurchaseID"];
  id v17 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryPurchaseAppAdamID"];
  id v19 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryProductID"];
  id v18 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryBundleIDKey"];
  v9 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryStoreExternalVersion"];
  v10 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryVendorIdentifier"];
  v11 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryHasWebOptIn"];
  unsigned int v16 = [v11 BOOLValue];

  v12 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryPurchaseInitiatedTime"];
  v13 = [v6 objectForKeyedSubscript:@"OngoingPurchaseEntryPurchasePrice"];
  id v21 = [(FCOngoingPurchaseEntry *)self initWithEntryID:v5 tagID:v7 purchaseID:v8 productID:v19 bundleID:v18 webAccessOptIn:v16 appAdamID:v17 storeExternalVersion:v9 vendorIdentifier:v10 purchaseInitiatedTime:v12 price:v13];

  return v21;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[FCOngoingPurchaseEntry webAccessOptIn](self, "webAccessOptIn"));
  [v3 setObject:v4 forKey:@"OngoingPurchaseEntryHasWebOptIn"];

  id v5 = [(FCOngoingPurchaseEntry *)self tagID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v5, @"OngoingPurchaseEntryTagID");

  id v6 = [(FCOngoingPurchaseEntry *)self purchaseID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v6, @"OngoingPurchaseEntryPurchaseID");

  v7 = [(FCOngoingPurchaseEntry *)self productID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v7, @"OngoingPurchaseEntryProductID");

  v8 = [(FCOngoingPurchaseEntry *)self bundleID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v8, @"OngoingPurchaseEntryBundleIDKey");

  v9 = [(FCOngoingPurchaseEntry *)self appAdamID];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v9, @"OngoingPurchaseEntryPurchaseAppAdamID");

  v10 = [(FCOngoingPurchaseEntry *)self storeExternalVersion];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v10, @"OngoingPurchaseEntryStoreExternalVersion");

  v11 = [(FCOngoingPurchaseEntry *)self vendorIdentifier];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v11, @"OngoingPurchaseEntryVendorIdentifier");

  v12 = [(FCOngoingPurchaseEntry *)self purchaseInitiatedTime];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v12, @"OngoingPurchaseEntryPurchaseInitiatedTime");

  v13 = [(FCOngoingPurchaseEntry *)self price];
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v13, @"OngoingPurchaseEntryPurchasePrice");

  v14 = (void *)[v3 copy];
  return v14;
}

+ (id)dummyOngoingPurchaseEntryWithTagID:(id)a3
{
  id v3 = a3;
  v4 = [FCOngoingPurchaseEntry alloc];
  id v5 = [NSNumber numberWithInteger:111];
  id v6 = [NSNumber numberWithInteger:111];
  v7 = [NSNumber numberWithInteger:1];
  v8 = [(FCOngoingPurchaseEntry *)v4 initWithEntryID:@"entryID" tagID:v3 purchaseID:@"purchaseID" productID:@"productID" bundleID:@"bundleID" webAccessOptIn:0 appAdamID:v5 storeExternalVersion:v6 vendorIdentifier:@"vendorIdentifier" purchaseInitiatedTime:0 price:v7];

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
}

- (NSString)purchaseID
{
  return self->_purchaseID;
}

- (void)setPurchaseID:(id)a3
{
}

- (NSString)productID
{
  return self->_productID;
}

- (void)setProductID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)webAccessOptIn
{
  return self->_webAccessOptIn;
}

- (void)setWebAccessOptIn:(BOOL)a3
{
  self->_webAccessOptIn = a3;
}

- (NSNumber)appAdamID
{
  return self->_appAdamID;
}

- (void)setAppAdamID:(id)a3
{
}

- (NSNumber)storeExternalVersion
{
  return self->_storeExternalVersion;
}

- (void)setStoreExternalVersion:(id)a3
{
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

- (NSDate)purchaseInitiatedTime
{
  return self->_purchaseInitiatedTime;
}

- (void)setPurchaseInitiatedTime:(id)a3
{
}

- (NSNumber)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_purchaseInitiatedTime, 0);
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_storeExternalVersion, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_purchaseID, 0);
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end