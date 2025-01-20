@interface WLKServerConfigurationResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isActiveUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFavoritesSyncEnabled;
- (BOOL)isFromDiskCache;
- (BOOL)isValid;
- (BOOL)isValidIgnoringExpiration;
- (BOOL)isValidWithinExtendedExpiration:(double)a3;
- (BOOL)naturalLanguageSearchProperty;
- (NSDate)expirationDate;
- (NSDictionary)features;
- (NSDictionary)requiredRequestKeyValuePairsDictionary;
- (NSDictionary)responseDictionary;
- (NSDictionary)searchReportConcernProps;
- (NSNumber)vppaSessionDurationInMillis;
- (NSString)utsk;
- (NSString)vppaStatusString;
- (WLKServerConfigurationResponse)initWithCoder:(id)a3;
- (WLKServerConfigurationResponse)initWithDictionary:(id)a3;
- (WLKServerConfigurationResponse)initWithServerResponseDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5;
- (id)_VPPAInfo;
- (id)_applicationProperties;
- (id)_expirationDateFromResponse:(id)a3;
- (id)_requiredRequestKVPMap;
- (id)_requiredRequestKVPMap:(id)a3;
- (id)_routes;
- (id)_userProperties;
- (id)_utskProperties;
- (id)configurationResponseByReplacingUTSK:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requiredRequestKeyValuePairsDictionary:(id)a3;
- (id)requiredRequestKeyValuePairsForType:(id)a3;
- (id)serverRouteNamed:(id)a3;
- (id)utsc;
- (int64_t)vppaStatus;
- (unint64_t)environmentHash;
- (unint64_t)hash;
- (void)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setFromDiskCache:(BOOL)a3;
@end

@implementation WLKServerConfigurationResponse

void __73__WLKServerConfigurationResponse_requiredRequestKeyValuePairsDictionary___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    NSLog(&cfstr_Wlkserverconfi.isa, v8, v9);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)_requiredRequestKVPMap:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  [(WLKServerConfigurationResponse *)self _routes];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v69 objects:v75 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v70;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v70 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9];
        objc_msgSend(v10, "wlk_stringForKey:", @"url");
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if ([v58 isEqualToString:v11])
        {
          v42 = [v4 objectForKeyedSubscript:v9];
          uint64_t v43 = objc_msgSend(v42, "wlk_stringForKey:", @"requiredParamsType");

          v44 = [(WLKServerConfigurationResponse *)self _applicationProperties];
          v45 = objc_msgSend(v44, "wlk_dictionaryForKey:", @"requiredParamsMap");
          v46 = objc_msgSend(v45, "wlk_dictionaryForKey:", v43);
          v29 = v4;
          goto LABEL_37;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v69 objects:v75 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v53 = self;

  id v54 = v4;
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v12 = v4;
  v13 = v58;
  id v57 = v12;
  uint64_t v59 = [v12 countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (v59)
  {
    uint64_t v14 = *(void *)v66;
    v15 = @"url";
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v65 + 1) + 8 * j);
        v18 = [v12 objectForKeyedSubscript:v17];
        v19 = objc_msgSend(v18, "wlk_stringForKey:", v15);

        v20 = [v19 componentsSeparatedByString:@"/"];
        v21 = [v13 componentsSeparatedByString:@"/"];
        if ([v20 count] && objc_msgSend(v21, "count"))
        {
          v22 = v15;
          uint64_t v23 = v14;
          v24 = [v19 componentsSeparatedByString:@"{"];
          if ([v24 count])
          {
            v25 = [v24 objectAtIndexedSubscript:0];
            int v26 = [v58 containsString:v25];

            v13 = v58;
            if (v26) {
              [v55 addObject:v17];
            }
          }

          id v12 = v57;
          uint64_t v14 = v23;
          v15 = v22;
        }
      }
      uint64_t v59 = [v12 countByEnumeratingWithState:&v65 objects:v74 count:16];
    }
    while (v59);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v11 = v55;
  uint64_t v27 = [v11 countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (!v27)
  {
    v29 = 0;
    v46 = 0;
    id v49 = v11;
    self = v53;
    id v4 = v54;
LABEL_38:

    id v11 = v49;
    v41 = v58;
    goto LABEL_39;
  }
  uint64_t v28 = v27;
  v29 = 0;
  uint64_t v56 = *(void *)v62;
  while (2)
  {
    v60 = v29;
    for (uint64_t k = 0; k != v28; ++k)
    {
      if (*(void *)v62 != v56) {
        objc_enumerationMutation(v11);
      }
      v31 = *(void **)(*((void *)&v61 + 1) + 8 * k);
      v32 = [v12 objectForKeyedSubscript:v31];
      v33 = objc_msgSend(v32, "wlk_stringForKey:", @"url");

      v34 = [v33 componentsSeparatedByString:@"/"];
      v35 = [v58 componentsSeparatedByString:@"/"];
      v36 = [v35 lastObject];
      v37 = [v34 lastObject];
      char v38 = [v36 isEqualToString:v37];

      if (v38)
      {
        id v47 = v31;

        v29 = v47;
        id v12 = v57;
        v41 = v58;
        goto LABEL_35;
      }
      uint64_t v39 = [v35 count];
      if (v39 == [v34 count])
      {
        id v40 = v31;

        v60 = v40;
      }
      id v12 = v57;
      v41 = v58;
    }
    uint64_t v28 = [v11 countByEnumeratingWithState:&v61 objects:v73 count:16];
    v29 = v60;
    if (v28) {
      continue;
    }
    break;
  }
LABEL_35:

  if (v29)
  {
    v48 = [v12 objectForKeyedSubscript:v29];
    uint64_t v43 = objc_msgSend(v48, "wlk_stringForKey:", @"requiredParamsType");

    self = v53;
    v44 = [(WLKServerConfigurationResponse *)v53 _applicationProperties];
    v45 = objc_msgSend(v44, "wlk_dictionaryForKey:", @"requiredParamsMap");
    v46 = objc_msgSend(v45, "wlk_dictionaryForKey:", v43);
    id v4 = v54;
LABEL_37:
    id v49 = v11;

    id v11 = (id)v43;
    goto LABEL_38;
  }
  v46 = 0;
  self = v53;
  id v4 = v54;
LABEL_39:

  if (!v46)
  {
    NSLog(&cfstr_Wlkserverconfi_1.isa, v41);
    v50 = [(WLKServerConfigurationResponse *)self _applicationProperties];
    v51 = objc_msgSend(v50, "wlk_dictionaryForKey:", @"requiredParamsMap");
    v46 = objc_msgSend(v51, "wlk_dictionaryForKey:", @"Default");

    v41 = v58;
  }

  return v46;
}

- (BOOL)naturalLanguageSearchProperty
{
  v2 = [(WLKServerConfigurationResponse *)self _applicationProperties];
  char v3 = objc_msgSend(v2, "wlk_BOOLForKey:defaultValue:", @"naturalLanguageSearchEnabled", 0);

  return v3;
}

- (id)_applicationProperties
{
  return [(NSDictionary *)self->_responseDictionary wlk_dictionaryForKey:@"applicationProps"];
}

- (id)_routes
{
  v2 = [(WLKServerConfigurationResponse *)self _applicationProperties];
  char v3 = objc_msgSend(v2, "wlk_dictionaryForKey:", @"routes");

  return v3;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

void __72__WLKServerConfigurationResponse_requiredRequestKeyValuePairsDictionary__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    NSLog(&cfstr_Wlkserverconfi.isa, v8, v9);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)environmentHash
{
  return self->_environmentHash;
}

- (id)requiredRequestKeyValuePairsDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WLKServerConfigurationResponse *)self _requiredRequestKVPMap:v4];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__WLKServerConfigurationResponse_requiredRequestKeyValuePairsDictionary___block_invoke;
  v8[3] = &unk_1E620A0F8;
  v8[4] = &v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];
  if (*((unsigned char *)v10 + 24))
  {
    id v6 = v5;
  }
  else
  {
    NSLog(&cfstr_Wlkserverconfi_0.isa);
    id v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (NSString)utsk
{
  v2 = [(WLKServerConfigurationResponse *)self _utskProperties];
  char v3 = objc_msgSend(v2, "wlk_stringForKey:", @"utsk");

  return (NSString *)v3;
}

- (id)_utskProperties
{
  return [(NSDictionary *)self->_responseDictionary wlk_dictionaryForKey:@"utskProps"];
}

- (BOOL)isValid
{
  responseDictionary = self->_responseDictionary;
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    [(NSDate *)expirationDate timeIntervalSinceNow];
    BOOL v6 = v5 > 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  unint64_t environmentHash = self->_environmentHash;
  uint64_t v8 = +[WLKUserEnvironment currentEnvironment];
  uint64_t v9 = [v8 hash];

  if (!responseDictionary) {
    return 0;
  }
  if (environmentHash == v9) {
    return v6;
  }
  return 0;
}

- (BOOL)isValidWithinExtendedExpiration:(double)a3
{
  responseDictionary = self->_responseDictionary;
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    [(NSDate *)expirationDate timeIntervalSinceNow];
    BOOL v8 = v7 > 0.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  unint64_t environmentHash = self->_environmentHash;
  id v10 = +[WLKUserEnvironment currentEnvironment];
  uint64_t v11 = [v10 hash];

  if (v8)
  {
    return responseDictionary && environmentHash == v11;
  }
  else
  {
    uint64_t v14 = self->_expirationDate;
    if (v14)
    {
      [(NSDate *)v14 timeIntervalSinceNow];
      BOOL v16 = v15 + a3 > 0.0;
    }
    else
    {
      BOOL v16 = 0;
    }
    if (environmentHash != v11) {
      BOOL v16 = 0;
    }
    return responseDictionary && v16;
  }
}

- (BOOL)isValidIgnoringExpiration
{
  responseDictionary = self->_responseDictionary;
  unint64_t environmentHash = self->_environmentHash;
  id v4 = +[WLKUserEnvironment currentEnvironment];
  uint64_t v5 = [v4 hash];

  return responseDictionary && environmentHash == v5;
}

- (BOOL)isFromDiskCache
{
  return self->_fromDiskCache;
}

- (WLKServerConfigurationResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    uint64_t v5 = [(WLKServerConfigurationResponse *)self init];
    if (v5)
    {
      uint64_t v6 = [v4 decodePropertyListForKey:@"response"];
      responseDictionary = v5->_responseDictionary;
      v5->_responseDictionary = (NSDictionary *)v6;

      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
      expirationDate = v5->_expirationDate;
      v5->_expirationDate = (NSDate *)v8;

      id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environmentHash"];
      v5->_unint64_t environmentHash = [v10 unsignedIntegerValue];
    }
    self = v5;
    uint64_t v11 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)utsc
{
  v2 = [(WLKServerConfigurationResponse *)self _userProperties];
  char v3 = objc_msgSend(v2, "wlk_stringForKey:", @"utsc");

  return v3;
}

- (NSDictionary)requiredRequestKeyValuePairsDictionary
{
  v2 = [(WLKServerConfigurationResponse *)self _requiredRequestKVPMap];
  char v3 = objc_msgSend(v2, "wlk_dictionaryForKey:", @"Default");

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__WLKServerConfigurationResponse_requiredRequestKeyValuePairsDictionary__block_invoke;
  v6[3] = &unk_1E620A0F8;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  if (*((unsigned char *)v8 + 24))
  {
    id v4 = v3;
  }
  else
  {
    NSLog(&cfstr_Wlkserverconfi_0.isa);
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (BOOL)isActiveUser
{
  v2 = [(WLKServerConfigurationResponse *)self _userProperties];
  char v3 = objc_msgSend(v2, "wlk_numberForKey:", @"activeUser");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)vppaStatusString
{
  v2 = [(WLKServerConfigurationResponse *)self _VPPAInfo];
  char v3 = objc_msgSend(v2, "wlk_stringForKey:", @"state");

  return (NSString *)v3;
}

- (id)_VPPAInfo
{
  v2 = [(WLKServerConfigurationResponse *)self _userProperties];
  char v3 = objc_msgSend(v2, "wlk_dictionaryForKey:", @"vppa");

  return v3;
}

- (id)_userProperties
{
  return [(NSDictionary *)self->_responseDictionary wlk_dictionaryForKey:@"userProps"];
}

- (id)_requiredRequestKVPMap
{
  v2 = [(WLKServerConfigurationResponse *)self _applicationProperties];
  char v3 = objc_msgSend(v2, "wlk_dictionaryForKey:", @"requiredParamsMap");

  return v3;
}

- (void)setFromDiskCache:(BOOL)a3
{
  self->_fromDiskCache = a3;
}

- (WLKServerConfigurationResponse)initWithDictionary:(id)a3
{
  char v4 = (void *)MEMORY[0x1E4F28D90];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"response"];
  uint64_t v7 = [v4 JSONObjectWithData:v6 options:0 error:0];

  uint64_t v8 = [v5 objectForKeyedSubscript:@"expirationDate"];
  uint64_t v9 = [v5 objectForKeyedSubscript:@"environmentHash"];

  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v9 == 0)
  {
    char v12 = 0;
  }
  else
  {
    self = -[WLKServerConfigurationResponse initWithServerResponseDictionary:expirationDate:environmentHash:](self, "initWithServerResponseDictionary:expirationDate:environmentHash:", v7, v8, [v9 unsignedIntegerValue]);
    char v12 = self;
  }

  return v12;
}

- (WLKServerConfigurationResponse)initWithServerResponseDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WLKServerConfigurationResponse;
  BOOL v10 = [(WLKServerConfigurationResponse *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    responseDictionary = v10->_responseDictionary;
    v10->_responseDictionary = (NSDictionary *)v11;

    v13 = (NSDate *)v9;
    if (!v13)
    {
      v13 = [(WLKServerConfigurationResponse *)v10 _expirationDateFromResponse:v10->_responseDictionary];
    }
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = v13;

    v10->_unint64_t environmentHash = a5;
  }

  return v10;
}

- (id)configurationResponseByReplacingUTSK:(id)a3
{
  id v4 = a3;
  id v5 = [(WLKServerConfigurationResponse *)self responseDictionary];
  uint64_t v6 = objc_msgSend(v5, "wlk_dictionaryByReplacingOccurrencesOfKey:with:", @"utsk", v4);

  uint64_t v7 = [WLKServerConfigurationResponse alloc];
  id v8 = [(WLKServerConfigurationResponse *)self expirationDate];
  id v9 = [(WLKServerConfigurationResponse *)v7 initWithServerResponseDictionary:v6 expirationDate:v8 environmentHash:[(WLKServerConfigurationResponse *)self environmentHash]];

  return v9;
}

- (NSNumber)vppaSessionDurationInMillis
{
  v2 = [(WLKServerConfigurationResponse *)self _VPPAInfo];
  char v3 = objc_msgSend(v2, "wlk_numberForKey:", @"sessionDurationInMillis");

  return (NSNumber *)v3;
}

- (int64_t)vppaStatus
{
  v2 = [(WLKServerConfigurationResponse *)self vppaStatusString];
  char v3 = [v2 lowercaseString];

  if ([v3 isEqualToString:@"reminder"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"grace"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"expired"])
  {
    int64_t v4 = 3;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (NSDictionary)features
{
  v2 = [(WLKServerConfigurationResponse *)self _applicationProperties];
  char v3 = objc_msgSend(v2, "wlk_dictionaryForKey:", @"featureEnablers");

  return (NSDictionary *)v3;
}

- (NSDictionary)searchReportConcernProps
{
  v2 = [(WLKServerConfigurationResponse *)self _applicationProperties];
  char v3 = objc_msgSend(v2, "wlk_dictionaryForKey:", @"searchReportConcernProps");

  return (NSDictionary *)v3;
}

- (BOOL)isFavoritesSyncEnabled
{
  v2 = [(WLKServerConfigurationResponse *)self _userProperties];
  char v3 = objc_msgSend(v2, "wlk_numberForKey:", @"favoritesSyncEnabled");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)requiredRequestKeyValuePairsForType:(id)a3
{
  id v4 = a3;
  id v5 = [(WLKServerConfigurationResponse *)self _requiredRequestKVPMap];
  uint64_t v6 = objc_msgSend(v5, "wlk_dictionaryForKey:", v4);

  return v6;
}

- (id)serverRouteNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(WLKServerConfigurationResponse *)self _routes];
  uint64_t v6 = objc_msgSend(v5, "wlk_dictionaryForKey:", v4);

  if (v6) {
    uint64_t v7 = [[WLKServerRoute alloc] initWithDictionary:v6 routeName:v4];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)dictionaryRepresentation
{
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:self->_responseDictionary])
  {
    char v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    id v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:self->_responseDictionary options:0 error:0];
    if (v4) {
      [v3 setObject:v4 forKeyedSubscript:@"response"];
    }
    [v3 setObject:self->_expirationDate forKeyedSubscript:@"expirationDate"];
    id v5 = [NSNumber numberWithUnsignedInteger:self->_environmentHash];
    [v3 setObject:v5 forKeyedSubscript:@"environmentHash"];

    uint64_t v6 = (void *)[v3 copy];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      -[WLKServerConfigurationResponse dictionaryRepresentation]();
    }
    uint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(WLKServerConfigurationResponse *)self environmentHash];
  id v4 = [(WLKServerConfigurationResponse *)self responseDictionary];
  uint64_t v5 = [v4 hash] ^ v3;

  uint64_t v6 = [(WLKServerConfigurationResponse *)self expirationDate];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WLKServerConfigurationResponse *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        unint64_t v7 = [(WLKServerConfigurationResponse *)self expirationDate];
        id v8 = [(WLKServerConfigurationResponse *)v6 expirationDate];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          uint64_t v11 = v10;
          if (!v9 || !v10) {
            goto LABEL_17;
          }
          char v12 = [v9 isEqual:v10];

          if ((v12 & 1) == 0) {
            goto LABEL_18;
          }
        }
        uint64_t v14 = [(WLKServerConfigurationResponse *)self responseDictionary];
        double v15 = [(WLKServerConfigurationResponse *)v6 responseDictionary];
        id v9 = v14;
        id v16 = v15;
        if (v9 == v16)
        {

LABEL_20:
          unint64_t v18 = [(WLKServerConfigurationResponse *)self environmentHash];
          BOOL v13 = v18 == [(WLKServerConfigurationResponse *)v6 environmentHash];
          goto LABEL_21;
        }
        uint64_t v11 = v16;
        if (v9 && v16)
        {
          char v17 = [v9 isEqual:v16];

          if (v17) {
            goto LABEL_20;
          }
LABEL_18:
          BOOL v13 = 0;
LABEL_21:

          goto LABEL_22;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    BOOL v13 = 0;
  }
LABEL_22:

  return v13;
}

- (id)description
{
  v13[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)WLKServerConfigurationResponse;
  id v4 = [(WLKServerConfigurationResponse *)&v11 description];
  expirationDate = self->_expirationDate;
  unint64_t environmentHash = self->_environmentHash;
  v12[0] = @"expiration";
  v12[1] = @"environment hash";
  v13[0] = expirationDate;
  unint64_t v7 = [NSNumber numberWithUnsignedInteger:environmentHash];
  v13[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = [v3 stringWithFormat:@"%@ %@", v4, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSDictionary *)self->_responseDictionary copy];
  uint64_t v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [(NSDate *)self->_expirationDate copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  v4[4] = self->_environmentHash;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_responseDictionary forKey:@"response"];
  [v4 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_environmentHash];
  [v4 encodeObject:v5 forKey:@"environmentHash"];
}

- (id)_expirationDateFromResponse:(id)a3
{
  unint64_t v3 = [(WLKServerConfigurationResponse *)self _utskProperties];
  id v4 = objc_msgSend(v3, "wlk_numberForKey:", @"expirationInSeconds");

  id v5 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"));

  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

- (void)dictionaryRepresentation
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1BA2E8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[WLKServerConfigurationResponse]: Attempted to serialize an invalid JSON object.", v0, 2u);
}

@end