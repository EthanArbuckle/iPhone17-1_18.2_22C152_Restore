@interface WLKUserEnvironment
+ (id)currentEnvironment;
+ (void)setCurrentEnvironmentForTesting:(id)a3;
- (BOOL)consented;
- (BOOL)internalBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEnvironment:(id)a3;
- (NSArray)consentedBrands;
- (NSArray)deniedBrands;
- (NSDictionary)entitlements;
- (NSNumber)DSID;
- (NSString)countryIdentifier;
- (NSString)languageIdentifier;
- (NSString)platform;
- (NSString)restrictions;
- (NSString)storeFrontIdentifier;
- (WLKUserEnvironment)init;
- (id)_consentQuery;
- (id)_entitlementsQuery;
- (id)_queryParametersV3;
- (id)_queryPostV3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)protocolVersion;
- (void)setConsented:(BOOL)a3;
- (void)setConsentedBrands:(id)a3;
- (void)setCountryIdentifier:(id)a3;
- (void)setDSID:(id)a3;
- (void)setDeniedBrands:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setInternalBuild:(BOOL)a3;
- (void)setLanguageIdentifier:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setProtocolVersion:(unint64_t)a3;
- (void)setRestrictions:(id)a3;
- (void)setStoreFrontIdentifier:(id)a3;
@end

@implementation WLKUserEnvironment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedBrands, 0);
  objc_storeStrong((id *)&self->_countryIdentifier, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_consentedBrands, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);

  objc_storeStrong((id *)&self->_DSID, 0);
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v4 = [(WLKUserEnvironment *)self _queryParametersV3];
  v5 = [(WLKUserEnvironment *)self _queryPostV3];
  objc_msgSend(v3, "wlk_setObjectUnlessNilOrEmpty:forKey:", v4, @"params");
  objc_msgSend(v3, "wlk_setObjectUnlessNilOrEmpty:forKey:", v5, @"post");
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_DSID, @"account");
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_languageIdentifier, @"language");
  unint64_t v6 = objc_msgSend(v3, "wlk_deepHash");

  return v6;
}

- (id)_queryParametersV3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[WLKUserEnvironment protocolVersion](self, "protocolVersion"));
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", v4, @"v");
  v5 = [(WLKUserEnvironment *)self platform];
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", v5, @"pfm");

  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", self->_countryIdentifier, @"region");
  unint64_t v6 = [(WLKUserEnvironment *)self storeFrontIdentifier];
  objc_msgSend(v3, "wlk_setObjectUnlessNil:forKey:", v6, @"sfh");

  if ([(WLKUserEnvironment *)self internalBuild]) {
    [v3 setObject:@"true" forKeyedSubscript:@"ib"];
  }
  v7 = WLKRestrictionsMaximumEffectiveMovieRanking();
  v8 = WLKRestrictionsCountryCode();
  if (v7)
  {
    v9 = [NSString stringWithFormat:@"%@:%lu", v8, objc_msgSend(v7, "longValue")];
    [v3 setObject:v9 forKeyedSubscript:@"mr"];
  }
  v10 = WLKRestrictionsMaximumEffectiveTVShowRanking();
  v11 = v10;
  if (v10)
  {
    v12 = [NSString stringWithFormat:@"%@:%lu", v8, objc_msgSend(v10, "longValue")];
    [v3 setObject:v12 forKeyedSubscript:@"tvr"];
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (WLKUserEnvironment)init
{
  v39.receiver = self;
  v39.super_class = (Class)WLKUserEnvironment;
  v2 = [(WLKUserEnvironment *)&v39 init];
  if (v2)
  {
    v2->_protocolVersion = WLKCurrentProtocolVersion();
    id v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

    if (!v4)
    {
      v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      v4 = objc_msgSend(v5, "ams_localiTunesAccount");
    }
    uint64_t v6 = objc_msgSend(v4, "ams_DSID");
    DSID = v2->_DSID;
    v2->_DSID = (NSNumber *)v6;

    uint64_t v8 = objc_msgSend(v4, "ams_storefront");
    storeFrontIdentifier = v2->_storeFrontIdentifier;
    v2->_storeFrontIdentifier = (NSString *)v8;

    v10 = +[WLKAppLibrary defaultAppLibrary];
    uint64_t v11 = [v10 dictionaryRepresentation];
    entitlements = v2->_entitlements;
    v2->_entitlements = (NSDictionary *)v11;

    v13 = NSString;
    v14 = WLKRestrictionsMaximumEffectiveMovieRanking();
    v15 = WLKRestrictionsMaximumEffectiveTVShowRanking();
    uint64_t v16 = [v13 stringWithFormat:@"%@-%@", v14, v15];
    restrictions = v2->_restrictions;
    v2->_restrictions = (NSString *)v16;

    v18 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v19 = [v18 objectForKey:*MEMORY[0x1E4F1C438]];
    languageIdentifier = v2->_languageIdentifier;
    v2->_languageIdentifier = (NSString *)v19;

    v21 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v22 = [v21 objectForKey:*MEMORY[0x1E4F1C400]];
    countryIdentifier = v2->_countryIdentifier;
    v2->_countryIdentifier = (NSString *)v22;

    if (os_variant_has_internal_content()) {
      v2->_internalBuild = 1;
    }
    if (v2->_DSID)
    {
      v24 = +[WLKSettingsStore sharedSettings];
      uint64_t v25 = [v24 deniedBrands];
      deniedBrands = v2->_deniedBrands;
      v2->_deniedBrands = (NSArray *)v25;

      v27 = +[WLKSettingsStore sharedSettings];
      uint64_t v28 = [v27 consentedBrands];
      consentedBrands = v2->_consentedBrands;
      v2->_consentedBrands = (NSArray *)v28;

      v30 = +[WLKSettingsStore sharedSettings];
      v2->_consented = [v30 optedIn];
    }
    else
    {
      v31 = v2->_deniedBrands;
      v32 = (NSArray *)MEMORY[0x1E4F1CBF0];
      v2->_deniedBrands = (NSArray *)MEMORY[0x1E4F1CBF0];

      v30 = v2->_consentedBrands;
      v2->_consentedBrands = v32;
    }

    v33 = (void *)MGCopyAnswer();
    p_platform = (void **)&v2->_platform;
    objc_storeStrong((id *)&v2->_platform, v33);
    if (([v33 isEqualToString:@"iPhone"] & 1) != 0
      || [v33 isEqualToString:@"iPod"])
    {
      v35 = *p_platform;
      *p_platform = @"iphone";
    }
    if ([v33 isEqualToString:@"iPad"])
    {
      v36 = @"ipad";
    }
    else if ([v33 isEqualToString:@"AppleTV"])
    {
      v36 = @"atv";
    }
    else if ([v33 isEqualToString:@"Watch"])
    {
      v36 = @"watch";
    }
    else
    {
      if (![v33 isEqualToString:@"Mac"])
      {
LABEL_21:

        return v2;
      }
      v36 = @"desktop";
    }
    v37 = *p_platform;
    *p_platform = v36;

    goto LABEL_21;
  }
  return v2;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (unint64_t)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)platform
{
  return self->_platform;
}

- (BOOL)internalBuild
{
  return self->_internalBuild;
}

- (id)_queryPostV3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [(NSDictionary *)self->_entitlements objectForKeyedSubscript:@"Installed"];
  v5 = [(NSDictionary *)self->_entitlements objectForKeyedSubscript:@"Subscribed"];
  uint64_t v6 = [(NSDictionary *)self->_entitlements objectForKeyedSubscript:@"Test"];
  v7 = [(NSDictionary *)self->_entitlements objectForKeyedSubscript:@"SubscriptionInfo"];
  v34 = (void *)v4;
  objc_msgSend(v3, "wlk_setObjectUnlessNilOrEmpty:forKey:", v4, @"ibids");
  v36 = v3;
  v33 = (void *)v6;
  objc_msgSend(v3, "wlk_setObjectUnlessNilOrEmpty:forKey:", v6, @"tbids");
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * v12);
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        objc_msgSend(v14, "wlk_setObjectUnlessNil:forKey:", v13, @"bundleId");
        v15 = [v7 objectForKeyedSubscript:v13];
        if ([v15 length])
        {
          if (_queryPostV3_onceToken != -1) {
            dispatch_once(&_queryPostV3_onceToken, &__block_literal_global_158);
          }
          uint64_t v16 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:_queryPostV3_JSONEscapeSet];

          objc_msgSend(v14, "wlk_setObjectUnlessNil:forKey:", v16, @"subInfo");
          v15 = (void *)v16;
        }
        v17 = (void *)[v14 copy];
        [v8 addObject:v17];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v10);
  }

  v18 = (void *)[v8 copy];
  objc_msgSend(v36, "wlk_setObjectUnlessNilOrEmpty:forKey:", v18, @"sbids");

  uint64_t v19 = (void *)[v36 copy];
  objc_msgSend(v35, "wlk_setObjectUnlessNilOrEmpty:forKey:", v19, @"entitlementInfo");

  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v21 = +[WLKFeatureEnablement tvAppEnabledFeatures];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v23 = v21;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = [*(id *)(*((void *)&v38 + 1) + 8 * i) jsonRepresentation];
        [v22 addObject:v28];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v25);
  }

  v29 = (void *)[v22 copy];
  objc_msgSend(v20, "wlk_setObjectUnlessNilOrEmpty:forKey:", v29, @"clientFeatures");

  v30 = (void *)[v20 copy];
  objc_msgSend(v35, "wlk_setObjectUnlessNilOrEmpty:forKey:", v30, @"featureFlags");

  v31 = (void *)[v35 copy];

  return v31;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

+ (id)currentEnvironment
{
  if (__currentEnvironmentForTesting) {
    v2 = (WLKUserEnvironment *)(id)__currentEnvironmentForTesting;
  }
  else {
    v2 = objc_alloc_init(WLKUserEnvironment);
  }

  return v2;
}

+ (void)setCurrentEnvironmentForTesting:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WLKUserEnvironment *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(WLKUserEnvironment *)self isEqualToEnvironment:v4];
  }

  return v5;
}

- (BOOL)isEqualToEnvironment:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    unint64_t protocolVersion = self->_protocolVersion;
    if (protocolVersion == [v4 protocolVersion])
    {
      DSID = self->_DSID;
      id v8 = [v5 DSID];
      uint64_t v9 = DSID;
      uint64_t v10 = v8;
      uint64_t v11 = v10;
      if (v9 == v10)
      {
      }
      else
      {
        LOBYTE(platform) = 0;
        if (!v9 || !v10)
        {
          p_isa = (NSString *)&v10->super.super.isa;
LABEL_47:

          goto LABEL_48;
        }
        int v13 = [(NSNumber *)v9 isEqual:v10];

        if (!v13)
        {
          LOBYTE(platform) = 0;
LABEL_49:

          goto LABEL_50;
        }
      }
      storeFrontIdentifier = self->_storeFrontIdentifier;
      v15 = [v5 storeFrontIdentifier];
      p_isa = storeFrontIdentifier;
      v17 = v15;
      uint64_t v9 = v17;
      if (p_isa == (NSString *)v17)
      {
      }
      else
      {
        LOBYTE(platform) = 0;
        if (!p_isa || !v17)
        {
          v21 = (NSString *)&v17->super.super.isa;
LABEL_46:

          goto LABEL_47;
        }
        int v18 = [(NSString *)p_isa isEqual:v17];

        if (!v18)
        {
          LOBYTE(platform) = 0;
LABEL_48:

          goto LABEL_49;
        }
      }
      languageIdentifier = self->_languageIdentifier;
      id v20 = [v5 languageIdentifier];
      v21 = languageIdentifier;
      id v22 = v20;
      p_isa = v22;
      if (v21 == v22)
      {
      }
      else
      {
        LOBYTE(platform) = 0;
        if (!v21 || !v22)
        {
          uint64_t v26 = v22;
          goto LABEL_45;
        }
        int v23 = [(NSString *)v21 isEqual:v22];

        if (!v23)
        {
          LOBYTE(platform) = 0;
          goto LABEL_47;
        }
      }
      countryIdentifier = self->_countryIdentifier;
      uint64_t v25 = [v5 countryIdentifier];
      uint64_t v26 = countryIdentifier;
      v27 = v25;
      v21 = v27;
      if (v26 == v27)
      {
      }
      else
      {
        LOBYTE(platform) = 0;
        if (!v26 || !v27)
        {
          v30 = v27;
LABEL_44:

          goto LABEL_45;
        }
        LODWORD(platform) = [(NSString *)v26 isEqual:v27];

        if (!platform) {
          goto LABEL_46;
        }
      }
      entitlements = self->_entitlements;
      uint64_t v26 = [v5 entitlements];
      if (WLKEqualObjects(entitlements, v26))
      {
        restrictions = self->_restrictions;
        v30 = [v5 restrictions];
        if (WLKEqualObjects(restrictions, v30))
        {
          consentedBrands = self->_consentedBrands;
          v32 = [v5 consentedBrands];
          if (WLKEqualObjects(consentedBrands, v32))
          {
            deniedBrands = self->_deniedBrands;
            v37 = [v5 deniedBrands];
            if (WLKEqualObjects(deniedBrands, v37)
              && (int consented = self->_consented, consented == [v5 consented]))
            {
              platform = self->_platform;
              id v35 = [v5 platform];
              LOBYTE(platform) = WLKEqualObjects(platform, v35);
            }
            else
            {
              LOBYTE(platform) = 0;
            }
          }
          else
          {
            LOBYTE(platform) = 0;
          }
        }
        else
        {
          LOBYTE(platform) = 0;
        }
        goto LABEL_44;
      }
      LOBYTE(platform) = 0;
LABEL_45:

      goto LABEL_46;
    }
  }
  LOBYTE(platform) = 0;
LABEL_50:

  return (char)platform;
}

- (id)description
{
  v22[12] = *MEMORY[0x1E4F143B8];
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  v21[0] = @"protocol version:";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_protocolVersion];
  DSID = self->_DSID;
  storeFrontIdentifier = self->_storeFrontIdentifier;
  v22[0] = v6;
  v22[1] = DSID;
  v21[1] = @"dsid";
  v21[2] = @"storefront";
  languageIdentifier = (__CFString *)self->_languageIdentifier;
  countryIdentifier = self->_countryIdentifier;
  if (!languageIdentifier) {
    languageIdentifier = &stru_1F13BCF18;
  }
  v22[2] = storeFrontIdentifier;
  v22[3] = languageIdentifier;
  v21[3] = @"language";
  v21[4] = @"country";
  if (countryIdentifier) {
    uint64_t v11 = (__CFString *)countryIdentifier;
  }
  else {
    uint64_t v11 = &stru_1F13BCF18;
  }
  entitlements = self->_entitlements;
  restrictions = self->_restrictions;
  v22[4] = v11;
  v22[5] = entitlements;
  v21[5] = @"entitlements";
  v21[6] = @"restrictions";
  consentedBrands = self->_consentedBrands;
  v22[6] = restrictions;
  v22[7] = consentedBrands;
  v21[7] = @"cbrids";
  v21[8] = @"dbrids";
  v22[8] = self->_deniedBrands;
  v21[9] = @"gac";
  v15 = [NSNumber numberWithBool:self->_consented];
  platform = self->_platform;
  v22[9] = v15;
  v22[10] = platform;
  v21[10] = @"platform";
  v21[11] = @"hash";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WLKUserEnvironment hash](self, "hash"));
  v22[11] = v17;
  int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:12];
  uint64_t v19 = [v3 stringWithFormat:@"<%@: %p %@>", v5, self, v18];

  return v19;
}

- (id)_entitlementsQuery
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v20 = [(NSDictionary *)self->_entitlements objectForKeyedSubscript:@"Installed"];
  id v3 = [(NSDictionary *)self->_entitlements objectForKeyedSubscript:@"Subscribed"];
  uint64_t v19 = [(NSDictionary *)self->_entitlements objectForKeyedSubscript:@"Test"];
  id v4 = [(NSDictionary *)self->_entitlements objectForKeyedSubscript:@"SubscriptionInfo"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * v9);
        uint64_t v11 = [v4 objectForKeyedSubscript:v10];
        if ([v11 length])
        {
          if (_entitlementsQuery_onceToken != -1) {
            dispatch_once(&_entitlementsQuery_onceToken, &__block_literal_global_29);
          }
          uint64_t v12 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:_entitlementsQuery_JSONEscapeSet];

          int v13 = [NSString stringWithFormat:@"%@:%@", v10, v12];
          [v5 addObject:v13];

          uint64_t v11 = (void *)v12;
        }
        else
        {
          [v5 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([v20 count])
  {
    v15 = [v20 componentsJoinedByString:@","];
    [v14 setObject:v15 forKeyedSubscript:@"ibids"];
  }
  if ([obj count])
  {
    uint64_t v16 = [v5 componentsJoinedByString:@","];
    [v14 setObject:v16 forKeyedSubscript:@"sbids"];
  }
  if ([v19 count])
  {
    v17 = [v19 componentsJoinedByString:@","];
    [v14 setObject:v17 forKeyedSubscript:@"tbids"];
  }

  return v14;
}

void __40__WLKUserEnvironment__entitlementsQuery__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  v1 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  [v0 removeCharactersInString:@":,"];
  v2 = (void *)_entitlementsQuery_JSONEscapeSet;
  _entitlementsQuery_JSONEscapeSet = (uint64_t)v0;
}

- (id)_consentQuery
{
  id v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v6 = [(WLKUserEnvironment *)self consented];
    if (v6) {
      uint64_t v7 = @"true";
    }
    else {
      uint64_t v7 = @"false";
    }
    [v5 setObject:v7 forKeyedSubscript:@"gac"];
    if (v6)
    {
      uint64_t v8 = [(WLKUserEnvironment *)self consentedBrands];
      if ([v8 count])
      {
        uint64_t v9 = [v8 componentsJoinedByString:@","];
        [v5 setObject:v9 forKeyedSubscript:@"cbrids"];
      }
      uint64_t v10 = [(WLKUserEnvironment *)self deniedBrands];
      if ([v10 count])
      {
        uint64_t v11 = [v10 componentsJoinedByString:@","];
        [v5 setObject:v11 forKeyedSubscript:@"dbrids"];
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __34__WLKUserEnvironment__queryPostV3__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E58]);
  v1 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  [v0 removeCharactersInString:@":,"];
  v2 = (void *)_queryPostV3_JSONEscapeSet;
  _queryPostV3_JSONEscapeSet = (uint64_t)v0;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (void)setStoreFrontIdentifier:(id)a3
{
}

- (void)setEntitlements:(id)a3
{
}

- (NSString)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
}

- (NSArray)consentedBrands
{
  return self->_consentedBrands;
}

- (void)setConsentedBrands:(id)a3
{
}

- (BOOL)consented
{
  return self->_consented;
}

- (void)setConsented:(BOOL)a3
{
  self->_int consented = a3;
}

- (void)setPlatform:(id)a3
{
}

- (void)setProtocolVersion:(unint64_t)a3
{
  self->_unint64_t protocolVersion = a3;
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (void)setLanguageIdentifier:(id)a3
{
}

- (NSString)countryIdentifier
{
  return self->_countryIdentifier;
}

- (void)setCountryIdentifier:(id)a3
{
}

- (NSArray)deniedBrands
{
  return self->_deniedBrands;
}

- (void)setDeniedBrands:(id)a3
{
}

- (void)setInternalBuild:(BOOL)a3
{
  self->_internalBuild = a3;
}

@end