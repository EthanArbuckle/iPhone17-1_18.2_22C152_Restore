@interface ICQQuotaInfoResponse
- (BOOL)hasPurchasedMoreStorage;
- (BOOL)isDetailed;
- (ICQQuotaInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSDictionary)accountStatus;
- (NSString)appDetailsURLString;
- (NSString)availableStorageText;
- (NSString)manageStorageURLString;
- (NSString)totalStorageText;
- (PSQuotaInfo)quotaInfo;
- (id)_sizeStringFromBytes:(id)a3;
- (id)storageFooter:(BOOL)a3;
- (unint64_t)availableStorage;
- (unint64_t)totalStorage;
- (unint64_t)usedStorage;
@end

@implementation ICQQuotaInfoResponse

- (ICQQuotaInfoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)ICQQuotaInfoResponse;
  v4 = [(AAResponse *)&v53 initWithHTTPResponse:a3 data:a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = (int)*MEMORY[0x263F259F8];
    uint64_t v7 = [*(id *)((char *)&v4->super.super.isa + v6) objectForKey:@"entry_points"];
    urls = v5->_urls;
    v5->_urls = (NSDictionary *)v7;

    if (v5->_urls)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = v5->_urls;
        v5->_urls = 0;
      }
    }
    v10 = [*(id *)((char *)&v5->super.super.isa + v6) objectForKey:@"storage_data"];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [v10 objectForKey:@"basicAccount"];
        v5->_basicAccount = [v11 BOOLValue];

        uint64_t v12 = [v10 objectForKey:@"quota_info_in_bytes"];
        quotaInfoDict = v5->_quotaInfoDict;
        v5->_quotaInfoDict = (NSDictionary *)v12;

        if (v5->_quotaInfoDict)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v14 = v5->_quotaInfoDict;
            v5->_quotaInfoDict = 0;
          }
        }
        uint64_t v15 = [v10 objectForKey:@"storage_info_in_bytes"];
        storageInfo = v5->_storageInfo;
        v5->_storageInfo = (NSDictionary *)v15;

        if (v5->_storageInfo)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = v5->_storageInfo;
            v5->_storageInfo = 0;
          }
        }
        uint64_t v18 = [v10 objectForKey:@"account_status_info"];
        accountStatus = v5->_accountStatus;
        v5->_accountStatus = (NSDictionary *)v18;

        if (v5->_accountStatus)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v20 = v5->_accountStatus;
            v5->_accountStatus = 0;
          }
        }
      }
    }
    v21 = objc_opt_new();
    objc_msgSend(v21, "setTotalStorage:", -[ICQQuotaInfoResponse totalStorage](v5, "totalStorage"));
    objc_msgSend(v21, "setUsedStorage:", -[ICQQuotaInfoResponse usedStorage](v5, "usedStorage"));
    v47 = v21;
    objc_storeStrong((id *)&v5->_quotaInfo, v21);
    v22 = [*(id *)((char *)&v5->super.super.isa + v6) objectForKey:@"storage_usage_by_media"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = v10;
      v46 = v5;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v44 = v22;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v50;
        v27 = @"media_key";
        unint64_t v28 = 0x263F08000uLL;
        v29 = &unk_26E01F2A8;
        do
        {
          uint64_t v30 = 0;
          uint64_t v48 = v25;
          do
          {
            if (*(void *)v50 != v26) {
              objc_enumerationMutation(v23);
            }
            v31 = *(void **)(*((void *)&v49 + 1) + 8 * v30);
            v32 = [v31 objectForKeyedSubscript:v27];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v33 = [v29 objectForKeyedSubscript:v32];
              if (v33)
              {
                v34 = [v31 objectForKeyedSubscript:@"usage_in_bytes"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v35 = v26;
                  v36 = v27;
                  unint64_t v37 = v28;
                  id v38 = v23;
                  v39 = v29;
                  uint64_t v40 = [v34 unsignedLongLongValue];
                  uint64_t v41 = [v33 integerValue];
                  uint64_t v42 = v40;
                  v29 = v39;
                  id v23 = v38;
                  unint64_t v28 = v37;
                  v27 = v36;
                  uint64_t v26 = v35;
                  uint64_t v25 = v48;
                  [v47 setStorageInUse:v42 forMediaKind:v41];
                }
              }
            }

            ++v30;
          }
          while (v25 != v30);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v25);
      }

      v10 = v45;
      v5 = v46;
      v22 = v44;
    }
  }
  return v5;
}

- (NSString)manageStorageURLString
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:@"quota.manage_storage_url"];
}

- (NSString)appDetailsURLString
{
  return (NSString *)[(NSDictionary *)self->_urls objectForKey:@"quota.app_details_url"];
}

- (unint64_t)totalStorage
{
  v2 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"total_quota"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (NSString)totalStorageText
{
  if (self->_basicAccount)
  {
    unint64_t v3 = NSString;
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"DATA_MAIL" value:&stru_26DFF2C90 table:@"CloudGroup"];
    uint64_t v6 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"data_quota"];
    uint64_t v7 = [(ICQQuotaInfoResponse *)self _sizeStringFromBytes:v6];
    v8 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"mail_quota"];
    v9 = [(ICQQuotaInfoResponse *)self _sizeStringFromBytes:v8];
    v10 = objc_msgSend(v3, "stringWithFormat:", v5, v7, v9);
  }
  else
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ICQQuotaInfoResponse totalStorage](self, "totalStorage"));
    v10 = [(ICQQuotaInfoResponse *)self _sizeStringFromBytes:v4];
  }

  return (NSString *)v10;
}

- (unint64_t)usedStorage
{
  v2 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"total_used"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = [v2 unsignedLongLongValue];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (unint64_t)availableStorage
{
  v2 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"total_available"];
  unint64_t v3 = [v2 unsignedLongLongValue];

  return v3;
}

- (NSString)availableStorageText
{
  if (self->_basicAccount)
  {
    unint64_t v3 = NSString;
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"DATA_MAIL" value:&stru_26DFF2C90 table:@"CloudGroup"];
    uint64_t v6 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"data_available"];
    uint64_t v7 = [(ICQQuotaInfoResponse *)self _sizeStringFromBytes:v6];
    v8 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"mail_available"];
    v9 = [(ICQQuotaInfoResponse *)self _sizeStringFromBytes:v8];
    v10 = objc_msgSend(v3, "stringWithFormat:", v5, v7, v9);
  }
  else
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[ICQQuotaInfoResponse availableStorage](self, "availableStorage"));
    v10 = [(ICQQuotaInfoResponse *)self _sizeStringFromBytes:v4];
  }

  return (NSString *)v10;
}

- (id)storageFooter:(BOOL)a3
{
  if (!self->_basicAccount)
  {
    p_otherToolbarItems = &self->_otherToolbarItems;
    otherToolbarItems = self->_otherToolbarItems;
    if (otherToolbarItems) {
      goto LABEL_11;
    }
    uint64_t v18 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"total_used"];
    [v18 floatValue];
    float v20 = v19;
    v9 = @"total_quota";
    v21 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"total_quota"];
    [v21 floatValue];
    double v12 = (float)(v20 / v22);

    v13 = NSString;
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"AVAILABLE_OF_ON_CASTLE" value:&stru_26DFF2C90 table:@"CloudGroup"];
    quotaInfoDict = self->_quotaInfoDict;
    v17 = @"total_available";
    goto LABEL_7;
  }
  if (a3)
  {
    p_otherToolbarItems = &self->_otherToolbarItems;
    otherToolbarItems = self->_otherToolbarItems;
    if (otherToolbarItems) {
      goto LABEL_11;
    }
    uint64_t v6 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"data_used"];
    [v6 floatValue];
    float v8 = v7;
    v9 = @"data_quota";
    v10 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"data_quota"];
    [v10 floatValue];
    double v12 = (float)(v8 / v11);

    v13 = NSString;
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"AVAILABLE_OF_ON_CASTLE" value:&stru_26DFF2C90 table:@"CloudGroup"];
    quotaInfoDict = self->_quotaInfoDict;
    v17 = @"data_available";
LABEL_7:
    id v23 = [(NSDictionary *)quotaInfoDict objectForKey:v17];
    [v23 floatValue];
    uint64_t v24 = CPFSSizeStrings();
    uint64_t v25 = [(NSDictionary *)self->_quotaInfoDict objectForKey:v9];
    [v25 floatValue];
    uint64_t v26 = CPFSSizeStrings();
    v27 = objc_msgSend(v13, "stringWithFormat:", v15, v24, v26);

    id v28 = objc_alloc(MEMORY[0x263EFF8C0]);
    v29 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    uint64_t v30 = +[ICQCloudStorageMeteredBarButtonView barButtonItemWithString:v27 andPercentUsed:v12];
    v31 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    uint64_t v32 = objc_msgSend(v28, "initWithObjects:", v29, v30, v31, 0);
    v33 = *p_otherToolbarItems;
    *p_otherToolbarItems = (NSArray *)v32;
    goto LABEL_10;
  }
  p_otherToolbarItems = &self->_topToolbarItems;
  otherToolbarItems = self->_topToolbarItems;
  if (otherToolbarItems) {
    goto LABEL_11;
  }
  v34 = NSString;
  uint64_t v35 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v36 = [v35 localizedStringForKey:@"AVAILABLE_OF" value:&stru_26DFF2C90 table:@"CloudGroup"];
  unint64_t v37 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"data_available"];
  [v37 floatValue];
  id v38 = CPFSSizeStrings();
  v39 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"data_quota"];
  [v39 floatValue];
  uint64_t v40 = CPFSSizeStrings();
  uint64_t v52 = objc_msgSend(v34, "stringWithFormat:", v36, v38, v40);

  uint64_t v41 = NSString;
  uint64_t v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v43 = [v42 localizedStringForKey:@"AVAILABLE_OF" value:&stru_26DFF2C90 table:@"CloudGroup"];
  v44 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"mail_available"];
  [v44 floatValue];
  v45 = CPFSSizeStrings();
  v46 = [(NSDictionary *)self->_quotaInfoDict objectForKey:@"mail_quota"];
  [v46 floatValue];
  v47 = CPFSSizeStrings();
  v29 = objc_msgSend(v41, "stringWithFormat:", v43, v45, v47);

  v27 = (void *)v52;
  id v48 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v31 = +[ICQCloudStorageDataAndMailBarButtonView barButtonItemWithData:v52 andMail:v29];
  v33 = (NSArray *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  uint64_t v49 = objc_msgSend(v48, "initWithObjects:", v30, v31, v33, 0);
  long long v50 = *p_otherToolbarItems;
  *p_otherToolbarItems = (NSArray *)v49;

LABEL_10:
  otherToolbarItems = *p_otherToolbarItems;
LABEL_11:
  return otherToolbarItems;
}

- (BOOL)hasPurchasedMoreStorage
{
  v2 = [(NSDictionary *)self->_storageInfo objectForKey:@"commerce_storage_in_bytes"];
  BOOL v3 = [v2 unsignedLongLongValue] != 0;

  return v3;
}

- (id)_sizeStringFromBytes:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F086F0];
  uint64_t v4 = [a3 longLongValue];
  return (id)[v3 stringFromByteCount:v4 countStyle:3];
}

- (NSDictionary)accountStatus
{
  return self->_accountStatus;
}

- (BOOL)isDetailed
{
  return self->_detailed;
}

- (PSQuotaInfo)quotaInfo
{
  return self->_quotaInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quotaInfo, 0);
  objc_storeStrong((id *)&self->_otherToolbarItems, 0);
  objc_storeStrong((id *)&self->_topToolbarItems, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_accountStatus, 0);
  objc_storeStrong((id *)&self->_storageInfo, 0);
  objc_storeStrong((id *)&self->_quotaInfoDict, 0);
}

@end