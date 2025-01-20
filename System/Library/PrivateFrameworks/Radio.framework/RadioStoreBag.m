@interface RadioStoreBag
- (BOOL)isAdFreeRadioEnabled;
- (BOOL)shouldMescalSignRequestWithURL:(id)a3;
- (BOOL)shouldMescalVerifyResponseFromURL:(id)a3;
- (BOOL)shouldSendKBSyncData;
- (NSDictionary)radioConfigurationDictionary;
- (NSString)leaseCertificateURLString;
- (NSString)mescalCertificateURLString;
- (NSString)mescalSetupURLString;
- (NSString)platformLookupURLString;
- (NSString)storeFrontSuffix;
- (NSString)streamingDownloadURLString;
- (NSURL)baseURL;
- (id)_cacheRepresentation;
- (id)_initWithCacheRepresentation:(id)a3;
- (id)_initWithURLBag:(id)a3;
- (id)_platformContext;
@end

@implementation RadioStoreBag

- (NSDictionary)radioConfigurationDictionary
{
  return self->_tiltDictionary;
}

- (id)_initWithURLBag:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)RadioStoreBag;
  v5 = [(RadioStoreBag *)&v38 init];
  if (v5)
  {
    v6 = [v4 dictionaryForBagKey:@"radio"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v6 = 0;
    }
    v37 = [v4 stringForBagKey:@"sRdnld"];
    uint64_t v7 = [v37 copy];
    srdnldURLString = v5->_srdnldURLString;
    v5->_srdnldURLString = (NSString *)v7;

    uint64_t v9 = [v6 copy];
    tiltDictionary = v5->_tiltDictionary;
    v5->_tiltDictionary = (NSDictionary *)v9;

    v11 = [v4 dictionaryForBagKey:@"sign-sap-request"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v11 copy];
      mescalRequestAllowList = v5->_mescalRequestAllowList;
      v5->_mescalRequestAllowList = (NSDictionary *)v12;
    }
    v14 = [v4 dictionaryForBagKey:@"sign-sap-response"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      mescalResponseAllowList = v5->_mescalResponseAllowList;
      v5->_mescalResponseAllowList = (NSDictionary *)v15;
    }
    if (v5->_mescalRequestAllowList || v5->_mescalResponseAllowList)
    {
      v17 = [v4 stringForBagKey:@"sign-sap-setup-cert"];
      v18 = [v4 stringForBagKey:@"sign-sap-setup"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = [v17 copy];
          mescalSetupCertURLString = v5->_mescalSetupCertURLString;
          v5->_mescalSetupCertURLString = (NSString *)v19;

          uint64_t v21 = [v18 copy];
          mescalSetupURLString = v5->_mescalSetupURLString;
          v5->_mescalSetupURLString = (NSString *)v21;
        }
      }
    }
    v23 = [v4 arrayForBagKey:@"amd-domains"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = [v23 copy];
      amdDomains = v5->_amdDomains;
      v5->_amdDomains = (NSArray *)v24;
    }
    v26 = [v4 stringForBagKey:@"storefront-header-suffix"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [v26 copy];
      storeFrontSuffix = v5->_storeFrontSuffix;
      v5->_storeFrontSuffix = (NSString *)v27;
    }
    v29 = [v4 stringForBagKey:*MEMORY[0x263F7BCE8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)&v5->_leaseCertificateURLString, v29);
    }
    uint64_t v30 = [v4 numberForBagKey:@"auth-can-post"];
    shouldSendKBSyncDataValue = v5->_shouldSendKBSyncDataValue;
    v5->_shouldSendKBSyncDataValue = (NSNumber *)v30;

    id v32 = objc_alloc(MEMORY[0x263F7B3B0]);
    v33 = [v4 _allValues];
    uint64_t v34 = [v32 initWithBagDictionary:v33];
    platformContext = v5->_platformContext;
    v5->_platformContext = (SSVPlatformContext *)v34;
  }
  return v5;
}

- (NSURL)baseURL
{
  v2 = [(NSDictionary *)self->_tiltDictionary objectForKey:@"base-url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = NSURL;
    id v4 = [v2 stringByAppendingString:@"/"];
    v5 = [v3 URLWithString:v4];
  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiltDictionary, 0);
  objc_storeStrong((id *)&self->_storeFrontSuffix, 0);
  objc_storeStrong((id *)&self->_srdnldURLString, 0);
  objc_storeStrong((id *)&self->_shouldSendKBSyncDataValue, 0);
  objc_storeStrong((id *)&self->_platformContext, 0);
  objc_storeStrong((id *)&self->_mescalSetupURLString, 0);
  objc_storeStrong((id *)&self->_mescalSetupCertURLString, 0);
  objc_storeStrong((id *)&self->_mescalResponseAllowList, 0);
  objc_storeStrong((id *)&self->_mescalRequestAllowList, 0);
  objc_storeStrong((id *)&self->_leaseCertificateURLString, 0);
  objc_storeStrong((id *)&self->_amdDomains, 0);
}

- (NSString)leaseCertificateURLString
{
  return self->_leaseCertificateURLString;
}

- (NSString)streamingDownloadURLString
{
  return self->_srdnldURLString;
}

- (NSString)storeFrontSuffix
{
  return self->_storeFrontSuffix;
}

- (NSString)mescalSetupURLString
{
  return self->_mescalSetupURLString;
}

- (NSString)mescalCertificateURLString
{
  return self->_mescalSetupCertURLString;
}

- (id)_platformContext
{
  v2 = (void *)[(SSVPlatformContext *)self->_platformContext copy];
  return v2;
}

- (id)_cacheRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  srdnldURLString = self->_srdnldURLString;
  if (srdnldURLString) {
    [v3 setObject:srdnldURLString forKey:@"sRdnld"];
  }
  tiltDictionary = self->_tiltDictionary;
  if (tiltDictionary) {
    [v4 setObject:tiltDictionary forKey:@"radio"];
  }
  mescalRequestAllowList = self->_mescalRequestAllowList;
  if (mescalRequestAllowList) {
    [v4 setObject:mescalRequestAllowList forKey:@"sign-sap-request"];
  }
  mescalResponseAllowList = self->_mescalResponseAllowList;
  if (mescalResponseAllowList) {
    [v4 setObject:mescalResponseAllowList forKey:@"sign-sap-response"];
  }
  mescalSetupCertURLString = self->_mescalSetupCertURLString;
  if (mescalSetupCertURLString) {
    [v4 setObject:mescalSetupCertURLString forKey:@"sign-sap-setup-cert"];
  }
  mescalSetupURLString = self->_mescalSetupURLString;
  if (mescalSetupURLString) {
    [v4 setObject:mescalSetupURLString forKey:@"sign-sap-setup"];
  }
  shouldSendKBSyncDataValue = self->_shouldSendKBSyncDataValue;
  if (shouldSendKBSyncDataValue) {
    [v4 setObject:shouldSendKBSyncDataValue forKey:@"auth-can-post"];
  }
  amdDomains = self->_amdDomains;
  if (amdDomains) {
    [v4 setObject:amdDomains forKey:@"amd-domains"];
  }
  storeFrontSuffix = self->_storeFrontSuffix;
  if (storeFrontSuffix) {
    [v4 setObject:storeFrontSuffix forKey:@"storefront-header-suffix"];
  }
  leaseCertificateURLString = self->_leaseCertificateURLString;
  if (leaseCertificateURLString) {
    [v4 setObject:leaseCertificateURLString forKey:*MEMORY[0x263F7BCE8]];
  }
  uint64_t v15 = [(SSVPlatformContext *)self->_platformContext bagDictionary];
  if (v15) {
    [v4 addEntriesFromDictionary:v15];
  }

  return v4;
}

- (id)_initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v37.receiver = self;
    v37.super_class = (Class)RadioStoreBag;
    v5 = [(RadioStoreBag *)&v37 init];
    if (v5)
    {
      v6 = [v4 objectForKey:@"radio"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v6 = 0;
      }
      uint64_t v7 = [v4 objectForKey:@"sRdnld"];
      uint64_t v8 = [v7 copy];
      srdnldURLString = v5->_srdnldURLString;
      v5->_srdnldURLString = (NSString *)v8;

      uint64_t v10 = [v6 copy];
      tiltDictionary = v5->_tiltDictionary;
      v5->_tiltDictionary = (NSDictionary *)v10;

      uint64_t v12 = [v4 objectForKey:@"sign-sap-request"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v12 copy];
        mescalRequestAllowList = v5->_mescalRequestAllowList;
        v5->_mescalRequestAllowList = (NSDictionary *)v13;
      }
      uint64_t v15 = [v4 objectForKey:@"sign-sap-response"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = [v15 copy];
        mescalResponseAllowList = v5->_mescalResponseAllowList;
        v5->_mescalResponseAllowList = (NSDictionary *)v16;
      }
      if (v5->_mescalRequestAllowList || v5->_mescalResponseAllowList)
      {
        v18 = [v4 objectForKey:@"sign-sap-setup-cert"];
        uint64_t v19 = [v4 objectForKey:@"sign-sap-setup"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v20 = [v18 copy];
            mescalSetupCertURLString = v5->_mescalSetupCertURLString;
            v5->_mescalSetupCertURLString = (NSString *)v20;

            uint64_t v22 = [v19 copy];
            mescalSetupURLString = v5->_mescalSetupURLString;
            v5->_mescalSetupURLString = (NSString *)v22;
          }
        }
      }
      uint64_t v24 = [v4 objectForKey:@"amd-domains"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v25 = [v24 copy];
        amdDomains = v5->_amdDomains;
        v5->_amdDomains = (NSArray *)v25;
      }
      uint64_t v27 = [v4 objectForKey:@"storefront-header-suffix"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = [v27 copy];
        storeFrontSuffix = v5->_storeFrontSuffix;
        v5->_storeFrontSuffix = (NSString *)v28;
      }
      uint64_t v30 = [v4 objectForKey:*MEMORY[0x263F7BCE8]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_storeStrong((id *)&v5->_leaseCertificateURLString, v30);
      }
      uint64_t v31 = [v4 objectForKey:@"auth-can-post"];
      shouldSendKBSyncDataValue = v5->_shouldSendKBSyncDataValue;
      v5->_shouldSendKBSyncDataValue = (NSNumber *)v31;

      uint64_t v33 = [objc_alloc(MEMORY[0x263F7B3B0]) initWithBagDictionary:v4];
      platformContext = v5->_platformContext;
      v5->_platformContext = (SSVPlatformContext *)v33;
    }
    self = v5;
    v35 = self;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (BOOL)shouldSendKBSyncData
{
  if (!self->_shouldSendKBSyncDataValue) {
    return 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  shouldSendKBSyncDataValue = self->_shouldSendKBSyncDataValue;
  return [(NSNumber *)shouldSendKBSyncDataValue BOOLValue];
}

- (BOOL)shouldMescalVerifyResponseFromURL:(id)a3
{
  if (!self->_mescalResponseAllowList) {
    return 0;
  }
  v3 = [a3 path];
  if (v3) {
    char v4 = SSVURLPathMatchesActionDictionary();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)shouldMescalSignRequestWithURL:(id)a3
{
  if (!self->_mescalRequestAllowList) {
    return 0;
  }
  v3 = [a3 path];
  if (v3) {
    char v4 = SSVURLPathMatchesActionDictionary();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NSString)platformLookupURLString
{
  return (NSString *)[(SSVPlatformContext *)self->_platformContext lookupURLString];
}

- (BOOL)isAdFreeRadioEnabled
{
  v2 = [(NSDictionary *)self->_tiltDictionary objectForKey:@"ad-free-radio-enabled"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

@end