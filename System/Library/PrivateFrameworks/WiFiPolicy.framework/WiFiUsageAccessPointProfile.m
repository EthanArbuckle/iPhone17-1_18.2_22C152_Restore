@interface WiFiUsageAccessPointProfile
+ (BOOL)_compareBytes:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 With:(id)a6;
+ (BOOL)_isProfileValidForStorage:(id)a3;
+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4;
+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4 onlyIfCurrent:(BOOL)a5;
+ (id)_cachedProfile:(id)a3;
+ (id)_config;
+ (id)_getBinTimeInterval:(double)a3 As:(unint64_t)a4;
+ (id)_getDefaults;
+ (id)_loadFromUserDefaults:(id)a3 withKey:(id)a4 withCachedData:(id)a5;
+ (id)_toMobileAssetsProfile:(id)a3;
+ (id)apNameForBSSID:(id)a3;
+ (id)beaconsAndWPSInfo;
+ (id)longProfileForBSSID:(id)a3;
+ (id)prefixForCA;
+ (id)profileForBSSID:(id)a3;
+ (id)profileForBSSID:(id)a3 onlyIfCurrent:(BOOL)a4;
+ (id)profileFromBeaconData:(id)a3 andParsedIE:(id)a4;
+ (id)shortProfileForBSSID:(id)a3;
+ (void)_applyMask:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 WithMask:(id)a6 AppendTo:(id)a7;
+ (void)_cleanUpStaleProfiles;
+ (void)_defaults;
+ (void)_endPrevAssoc;
+ (void)_extractFieldsFor:(id)a3 From:(id)a4 Into:(id)a5;
+ (void)_saveToUserDefaults:(id)a3 withKey:(id)a4 andValue:(id)a5;
+ (void)_submitProfileFor:(id)a3 withCachedDict:(id)a4 AndEraseWithLog:(id)a5;
+ (void)initialize;
+ (void)setMaxProfiles:(unint64_t)a3;
+ (void)updateConfig;
+ (void)updateWithAssocTime:(double)a3 forBssid:(id)a4;
+ (void)updateWithWPS:(id)a3;
- (NSString)apProfile;
- (NSString)bssid;
- (void)setApProfile:(id)a3;
- (void)setBssid:(id)a3;
@end

@implementation WiFiUsageAccessPointProfile

+ (id)prefixForCA
{
  return @"BeaconInformationElement_";
}

+ (void)initialize
{
  v2 = (void *)_configError;
  _configError = @"Waiting on MobileAssets callback";
}

+ (id)_config
{
  v2 = NSString;
  uint64_t v3 = _apProfileMinAssoc;
  uint64_t v4 = _apProfileMinOccurrencies;
  uint64_t v5 = _apProfileMinSecsBetweenOccurrencies;
  uint64_t v6 = _maxProfiles;
  uint64_t v7 = _profileCacheTimeout;
  uint64_t v8 = _apProfileVersionString;
  uint64_t v9 = _shortProfileBytesLen;
  double v10 = *(double *)&_profileCacheTimeout / 86400.0;
  uint64_t v11 = [(id)_apProfileFields count];
  if (_apProfileListVendorIEs) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  uint64_t v13 = _apProfileListVendorIEsLen;
  uint64_t v14 = [(id)_apProfileVendorFields count];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"apProfileMinAssoc(sec):%f apProfileMinOccurrencies:%lu apProfileMinIntervalBetweenOccurrencies(sec):%f maxProfiles:%lu maxAgeDays:%f (%f sec)\napProfileVersion:%@ shortApProfileBytesLen:%lu { fields:%u ; listVendorIEs:%@ ; listVendorIELen:%u ; vendor fields:%u ; vendor exclude:%u }",
               v3,
               v4,
               v5,
               v6,
               *(void *)&v10,
               v7,
               v8,
               v9,
               v11,
               v12,
               v13,
               v14,
               [(id)_apProfileVendorExcludeFields count]);
}

+ (void)setMaxProfiles:(unint64_t)a3
{
  _maxProfiles = a3;
}

+ (void)_defaults
{
  _apProfileVersion = 0;
  v2 = (void *)_apProfileVersionString;
  _apProfileVersionString = @"profile_AP__UNDEFINED";

  _apProfileMinAssoc = 0;
  _apProfileMinOccurrencies = 1;
  _apProfileMinSecsBetweenOccurrencies = 0;
  _maxProfiles = 0;
  _profileCacheTimeout = 0x4122750000000000;
  _shortProfileBytesLen = 20;
  _apProfileListVendorIEs = 0;
  _apProfileListVendorIEsLen = 0x7FFFFFFFFFFFFFFFLL;
  _apProfileIncludeIELen = 1;
  uint64_t v3 = (void *)_apProfileFields;
  _apProfileFields = 0;

  uint64_t v4 = (void *)_apProfileVendorFields;
  _apProfileVendorFields = 0;

  uint64_t v5 = (void *)_apProfileVendorExcludeFields;
  _apProfileVendorExcludeFields = 0;
}

+ (void)updateConfig
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"apProfileVersion"];
  uint64_t v4 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [NSString stringWithFormat:@"impossible to parse %@. Expected String, found: %@", @"apProfileVersion", v3];
      uint64_t v26 = LABEL_41:;
LABEL_42:
      uint64_t v13 = 0;
LABEL_43:
      v27 = (void *)_configError;
      _configError = v26;

      [a1 _defaults];
      goto LABEL_44;
    }
  }
  else
  {
    [a1 _defaults];
  }
  uint64_t v5 = (void *)_apProfileVersionString;
  _apProfileVersionString = (uint64_t)v3;
  id v6 = v3;

  _apProfileVersion = 1;
  uint64_t v7 = @"apProfileMinAssocSec";
  uint64_t v3 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"apProfileMinAssocSec"];

  if (!v3) {
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  [v3 doubleValue];
  _apProfileMinAssoc = v8;
  uint64_t v9 = @"apProfileMinOccurrencies";
  double v10 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"apProfileMinOccurrencies"];

  if (!v10) {
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_47;
  }
  _apProfileMinOccurrencies = [v10 unsignedIntegerValue];
  uint64_t v7 = @"apProfileMinIntervalBetweenOccurrencies";
  uint64_t v3 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"apProfileMinIntervalBetweenOccurrencies"];

  if (!v3) {
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  [v3 doubleValue];
  _apProfileMinSecsBetweenOccurrencies = v11;
  uint64_t v9 = @"useShortAPProfile";
  double v10 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"useShortAPProfile"];

  if (!v10) {
    goto LABEL_47;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_47;
  }
  _useShortProfile = [v10 BOOLValue];
  uint64_t v7 = @"shortApProfileBytesLen";
  uint64_t v3 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"shortApProfileBytesLen"];

  if (!v3) {
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_40;
  }
  _shortProfileBytesLen = [v3 unsignedIntegerValue];
  uint64_t v9 = @"maxProfilesCount";
  double v10 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"maxProfilesCount"];

  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_47:
    uint64_t v26 = [NSString stringWithFormat:@"impossible to parse %@. Expected Number, found: %@", v9, v10];
    uint64_t v13 = 0;
    uint64_t v3 = v10;
    goto LABEL_43;
  }
  _maxProfiles = [v10 unsignedIntegerValue];
  uint64_t v7 = @"maxAgeDays";
  uint64_t v3 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"maxAgeDays"];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_40:
    [NSString stringWithFormat:@"impossible to parse %@. Expected Number, found: %@", v7, v3];
    goto LABEL_41;
  }
  [v3 doubleValue];
  *(double *)&_profileCacheTimeout = v12 * 86400.0;
  uint64_t v13 = +[WiFiUsageAccessPointProfileConfiguration getConfigForKey:@"apProfileDefinition"];

  if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v26 = [NSString stringWithFormat:@"impossible to parse %@. Expected Dictionary, found: %@", @"apProfileDefinition", v13];
    uint64_t v3 = v13;
    goto LABEL_42;
  }
  uint64_t v14 = [v13 objectForKeyedSubscript:@"includeIELen"];
  if (!v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v26 = [NSString stringWithFormat:@"impossible to parse %@.includeIELen. Expected Number, found: %@", @"apProfileDefinition", 0];
      uint64_t v3 = 0;
      goto LABEL_43;
    }
  }
  _apProfileIncludeIELen = [v14 BOOLValue];
  uint64_t v15 = [v13 objectForKeyedSubscript:@"fields"];

  if (!v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v26 = [NSString stringWithFormat:@"impossible to parse %@.fields. Expected Array, found: %@", @"apProfileDefinition", 0];
      uint64_t v3 = 0;
      goto LABEL_55;
    }
  }
  v16 = (void *)_apProfileFields;
  _apProfileFields = v15;

  uint64_t v3 = [v13 objectForKeyedSubscript:@"listVendorIEs"];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.listVendorIEs. Expected Number, found: %@", @"apProfileDefinition", v3];
    uint64_t v26 = LABEL_50:;
LABEL_55:
    uint64_t v4 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
    goto LABEL_43;
  }
  _apProfileListVendorIEs = [v3 BOOLValue];
  v17 = [v13 objectForKeyedSubscript:@"listVendorIEsLen"];

  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.listVendorIEsLen. Expected Number, found: %@", @"apProfileDefinition", v17];
    uint64_t v26 = LABEL_54:;
    uint64_t v3 = v17;
    goto LABEL_55;
  }
  _apProfileListVendorIEsLen = [v17 integerValue];
  uint64_t v3 = [v13 objectForKeyedSubscript:@"vendor"];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.vendor. Expected Dictionary, found: %@", @"apProfileDefinition", v3];
    goto LABEL_50;
  }
  v18 = [v13 objectForKeyedSubscript:@"vendor"];
  v17 = [v18 objectForKeyedSubscript:@"fields"];

  if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.vendor.fields. Expected Array, found: %@", @"apProfileDefinition", v17];
    goto LABEL_54;
  }
  v19 = (void *)_apProfileVendorFields;
  _apProfileVendorFields = (uint64_t)v17;

  uint64_t v3 = [v13 objectForKeyedSubscript:@"vendorExclude"];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.vendorExclude. Expected Dictionary, found: %@", @"apProfileDefinition", v3];
    goto LABEL_50;
  }
  v20 = [v13 objectForKeyedSubscript:@"vendorExclude"];
  v21 = [v20 objectForKeyedSubscript:@"fields"];

  uint64_t v3 = v21;
  if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [NSString stringWithFormat:@"impossible to parse %@.vendorExclude.fields. Expected Array, found: %@", @"apProfileDefinition", v21];
    goto LABEL_50;
  }
  objc_storeStrong((id *)&_apProfileVendorExcludeFields, v21);
  v22 = NSString;
  v23 = [a1 _config];
  v24 = [v22 stringWithFormat:@"%s: configParseError:%@ (%@)]\n%@", "+[WiFiUsageAccessPointProfile updateConfig]", @"NO", &stru_1F2B5AC50, v23];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v24, "UTF8String"));
    id v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = [v25 UTF8String];
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v4 = &OBJC_METACLASS___TBCoreDataStoreDescriptor;
LABEL_44:
  if (LOBYTE(v4[43].isa) == 1) {
    [a1 _cleanUpStaleProfiles];
  }
}

+ (id)_getDefaults
{
  return (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
}

+ (BOOL)_isProfileValidForStorage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"apProfileVersion"];
  uint64_t v5 = [v3 objectForKey:@"apProfileCacheTimestampCreated"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [(id)_apProfileVersionString isEqualToString:v4];
LABEL_5:
    BOOL v8 = 0;
    if (v6 && v5)
    {
      [v5 timeIntervalSinceNow];
      BOOL v8 = *(double *)&_profileCacheTimeout >= -v9;
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:_apProfileVersion];
    int v6 = [v7 isEqual:v4];

    goto LABEL_5;
  }
  BOOL v8 = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    double v12 = "+[WiFiUsageAccessPointProfile _isProfileValidForStorage:]";
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: unknown version format: %@", (uint8_t *)&v11, 0x16u);
    BOOL v8 = 0;
  }
LABEL_10:

  return v8;
}

+ (void)_cleanUpStaleProfiles
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D9440170](a1, a2);
  id v3 = [a1 _getDefaults];
  uint64_t v4 = [v3 dictionaryRepresentation];

  v43 = [MEMORY[0x1E4F1CA48] array];
  v42 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        int v11 = +[WiFiUsagePrivacyFilter reformatMACAddress:v10];

        if (v11)
        {
          double v12 = [v4 objectForKey:v10];
          if ([a1 _isProfileValidForStorage:v12])
          {
            __int16 v13 = [v12 objectForKey:@"apProfileCacheTimestamp"];
            [v42 setObject:v10 forKeyedSubscript:v13];
          }
          else
          {
            [v43 addObject:v10];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v7);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v43 count];
    uint64_t v15 = [v42 count];
    *(_DWORD *)buf = 136315906;
    v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
    __int16 v55 = 2048;
    uint64_t v56 = v14;
    __int16 v57 = 2048;
    uint64_t v58 = v15;
    __int16 v59 = 2048;
    uint64_t v60 = _maxProfiles;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - staleEntries:%lu validEntries:%lu _maxProfiles:%lu", buf, 0x2Au);
  }
  unint64_t v16 = [v42 count];
  if (v16 > _maxProfiles)
  {
    v17 = [v42 allKeys];
    v18 = [v17 sortedArrayUsingSelector:sel_compare_];

    v19 = [NSString stringWithFormat:@"%s: sortedEntries:%@", "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]", v18];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"[WiFiPolicy] %s", objc_msgSend(v19, "UTF8String"));
      id v20 = objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 UTF8String];
      *(_DWORD *)buf = 136446210;
      v54 = (const char *)v21;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v22 = [v42 count];
    if (v22 != _maxProfiles)
    {
      unint64_t v23 = 0;
      v24 = MEMORY[0x1E4F14500];
      do
      {
        id v25 = [v18 objectAtIndexedSubscript:v23];
        uint64_t v26 = [v42 objectForKeyedSubscript:v25];
        [v43 addObject:v26];

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [v18 objectAtIndexedSubscript:v23];
          v28 = [v42 objectForKeyedSubscript:v27];
          *(_DWORD *)buf = 136315394;
          v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
          __int16 v55 = 2112;
          uint64_t v56 = (uint64_t)v28;
          _os_log_impl(&dword_1D3CCD000, v24, OS_LOG_TYPE_DEFAULT, "%s - marking %@ as stale", buf, 0x16u);
        }
        ++v23;
        uint64_t v29 = [v42 count];
      }
      while (v29 - _maxProfiles > v23);
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [v43 count];
    uint64_t v31 = [v42 count];
    *(_DWORD *)buf = 136315906;
    v54 = "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]";
    __int16 v55 = 2048;
    uint64_t v56 = v30;
    __int16 v57 = 2048;
    uint64_t v58 = v31;
    __int16 v59 = 2048;
    uint64_t v60 = _maxProfiles;
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - staleEntries:%lu validEntries:%lu _maxProfiles:%lu", buf, 0x2Au);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v32 = v43;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        v38 = [v4 objectForKeyedSubscript:v37];
        v39 = objc_msgSend(NSString, "stringWithFormat:", @"stale (from %s)", "+[WiFiUsageAccessPointProfile _cleanUpStaleProfiles]");
        [a1 _submitProfileFor:v37 withCachedDict:v38 AndEraseWithLog:v39];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v34);
  }

  v40 = [a1 _getDefaults];
  [v40 synchronize];
}

+ (void)_endPrevAssoc
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v2 = [a1 _getDefaults];
  id v3 = [v2 dictionaryRepresentation];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v29 = v3;
  obuint64_t j = [v3 allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    char v7 = 0;
    uint64_t v8 = *(void *)v31;
    *(void *)&long long v5 = 136316162;
    long long v26 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        int v11 = +[WiFiUsagePrivacyFilter reformatMACAddress:](WiFiUsagePrivacyFilter, "reformatMACAddress:", v10, v26);

        if (v11)
        {
          double v12 = [v29 objectForKey:v10];
          __int16 v13 = [v12 objectForKeyedSubscript:@"apProfileMaxAssocTime"];
          unint64_t v14 = [v13 unsignedIntegerValue];

          uint64_t v15 = [v12 objectForKeyedSubscript:@"apProfileCacheTimestamp"];
          unint64_t v16 = [v12 objectForKeyedSubscript:@"apProfileForLatestAssoc"];
          int v17 = [v16 BOOLValue];

          [v15 timeIntervalSinceNow];
          if (v17)
          {
            double v19 = -v18;
            if ((double)v14 >= v19)
            {
              id v22 = a1;
            }
            else
            {
              BOOL v20 = *(double *)&_apProfileMinAssoc > (double)v14;
              if (*(double *)&_apProfileMinAssoc > v19) {
                BOOL v20 = 0;
              }
              v7 |= v20;
              uint64_t v21 = [NSNumber numberWithUnsignedLong:(unint64_t)v19];
              id v22 = a1;
              [a1 _saveToUserDefaults:v10 withKey:@"apProfileMaxAssocTime" andValue:v21];
            }
            [v22 _saveToUserDefaults:v10 withKey:@"apProfileForLatestAssoc" andValue:MEMORY[0x1E4F1CC28]];
            if (v7)
            {
              if ([v22 _isProfileValidForUse:v10 withCachedDict:0])
              {
                unint64_t v23 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  v24 = [v22 profileForBSSID:v10];
                  *(_DWORD *)buf = v26;
                  uint64_t v35 = "+[WiFiUsageAccessPointProfile _endPrevAssoc]";
                  __int16 v36 = 2160;
                  uint64_t v37 = 1752392040;
                  __int16 v38 = 2112;
                  uint64_t v39 = v10;
                  __int16 v40 = 2160;
                  uint64_t v41 = 1752392040;
                  __int16 v42 = 2112;
                  v43 = v24;
                  _os_log_impl(&dword_1D3CCD000, v23, OS_LOG_TYPE_DEFAULT, "%s: profile for %{mask.hash}@ is valid: %{mask.hash}@", buf, 0x34u);
                }
              }
              char v7 = 1;
            }
            else
            {
              char v7 = 0;
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v6);
  }

  id v25 = [a1 _getDefaults];
  [v25 synchronize];
}

+ (BOOL)_compareBytes:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 With:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  unint64_t v11 = [v9 length];
  if (a5 > 4 || v11 < a5 + a4)
  {
    BOOL v14 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v16 = 136316162;
      *(void *)&v16[4] = "+[WiFiUsageAccessPointProfile _compareBytes:FromStart:WithLen:With:]";
      __int16 v17 = 2048;
      uint64_t v18 = [v9 length];
      __int16 v19 = 2048;
      unint64_t v20 = a4;
      __int16 v21 = 2048;
      unint64_t v22 = a5;
      __int16 v23 = 2048;
      uint64_t v24 = 4;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - fieldData len is %lu but start=%lu and len=%lu (<= %lu) - returning FALSE", v16, 0x34u);
      BOOL v14 = 0;
    }
  }
  else
  {
    uint64_t v12 = [v9 bytes];
    *(void *)unint64_t v16 = [v10 unsignedIntValue];
    if (a5)
    {
      __int16 v13 = (unsigned char *)(v12 + a4);
      BOOL v14 = 1;
      do
        BOOL v14 = v14 && v16[--a5] == *v13++;
      while (a5);
    }
    else
    {
      BOOL v14 = 1;
    }
  }

  return v14;
}

+ (void)_applyMask:(id)a3 FromStart:(unint64_t)a4 WithLen:(unint64_t)a5 WithMask:(id)a6 AppendTo:(id)a7
{
  id v17 = a3;
  id v11 = a6;
  id v12 = a7;
  if ([v17 length] >= a5 + a4)
  {
    uint64_t v13 = [v17 bytes];
    uint64_t v18 = [v11 unsignedIntValue];
    if (a5)
    {
      BOOL v14 = (unsigned char *)(v13 + a4);
      uint64_t v15 = &v18;
      do
      {
        if (v11) {
          uint64_t v16 = (*v14 & *(unsigned char *)v15);
        }
        else {
          uint64_t v16 = *v14;
        }
        objc_msgSend(v12, "appendFormat:", @"%02X", v16);
        ++v14;
        uint64_t v15 = (uint64_t *)((char *)v15 + 1);
        --a5;
      }
      while (a5);
    }
  }
}

+ (void)_extractFieldsFor:(id)a3 From:(id)a4 Into:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 objectForKeyedSubscript:@"subfields"];
  if (v10)
  {
    id v11 = [v7 objectForKeyedSubscript:@"subfields"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v7 objectForKeyedSubscript:@"subfields"];
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  uint64_t v13 = [v7 objectForKeyedSubscript:@"len"];
  if (v13)
  {
    BOOL v14 = [v7 objectForKeyedSubscript:@"len"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v7 objectForKeyedSubscript:@"len"];
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }

  uint64_t v16 = [v7 objectForKeyedSubscript:@"mask"];
  if (v16)
  {
    id v17 = [v7 objectForKeyedSubscript:@"mask"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v7 objectForKeyedSubscript:@"mask"];
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v18 = 0;
  }

  if (v12)
  {
    uint64_t v37 = v18;
    __int16 v38 = v15;
    id v41 = v9;
    uint64_t v39 = v12;
    id v40 = v7;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    obuint64_t j = v12;
    uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v44 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v46 != v44) {
            objc_enumerationMutation(obj);
          }
          unint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          __int16 v23 = objc_msgSend(v22, "objectForKeyedSubscript:", @"start", v37, v38, v39, v40);
          if (v23)
          {
            uint64_t v24 = [v22 objectForKeyedSubscript:@"start"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v25 = [v22 objectForKeyedSubscript:@"start"];
            }
            else
            {
              uint64_t v25 = 0;
            }
          }
          else
          {
            uint64_t v25 = 0;
          }
          long long v26 = v8;

          v27 = [v22 objectForKeyedSubscript:@"len"];
          if (v27)
          {
            v28 = [v22 objectForKeyedSubscript:@"len"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v29 = [v22 objectForKeyedSubscript:@"len"];
            }
            else
            {
              uint64_t v29 = 0;
            }
          }
          else
          {
            uint64_t v29 = 0;
          }

          long long v30 = [v22 objectForKeyedSubscript:@"mask"];
          if (v30)
          {
            long long v31 = [v22 objectForKeyedSubscript:@"mask"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v32 = [v22 objectForKeyedSubscript:@"mask"];
            }
            else
            {
              long long v32 = 0;
            }
          }
          else
          {
            long long v32 = 0;
          }

          id v8 = v26;
          if ([v26 length])
          {
            if (v29 && v25)
            {
              objc_msgSend(a1, "_applyMask:FromStart:WithLen:WithMask:AppendTo:", v26, objc_msgSend(v25, "integerValue"), objc_msgSend(v29, "unsignedIntValue"), v32, v41);
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              int v33 = [v25 unsignedIntValue];
              int v34 = [v29 unsignedIntValue];
              *(_DWORD *)buf = 136315906;
              long long v50 = "+[WiFiUsageAccessPointProfile _extractFieldsFor:From:Into:]";
              __int16 v51 = 1024;
              int v52 = v33;
              __int16 v53 = 1024;
              int v54 = v34;
              __int16 v55 = 2112;
              uint64_t v56 = v22;
              _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Subfield has wrong format (start:%u, len:%u) - ignoring %@", buf, 0x22u);
            }
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v20);
    }

    id v12 = v39;
    id v7 = v40;
    id v9 = v41;
    uint64_t v18 = v37;
    uint64_t v15 = v38;
  }
  else
  {
    unint64_t v35 = [v8 length];
    if (v35 >= [v15 unsignedIntValue]) {
      uint64_t v36 = [v15 unsignedIntValue];
    }
    else {
      uint64_t v36 = [v8 length];
    }
    [a1 _applyMask:v8 FromStart:0 WithLen:v36 WithMask:v18 AppendTo:v9];
  }
}

+ (id)_toMobileAssetsProfile:(id)a3
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v90 = a3;
  v89 = objc_opt_new();
  id v84 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v84 setNumberStyle:1];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  obuint64_t j = (id)_apProfileFields;
  uint64_t v3 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v97 = *(id *)v116;
    do
    {
      uint64_t v5 = 0;
      uint64_t v91 = v4;
      do
      {
        if (*(id *)v116 != v97) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v115 + 1) + 8 * v5);
        id v7 = [v6 objectForKeyedSubscript:@"name"];
        if (v7)
        {
          id v8 = [v6 objectForKeyedSubscript:@"name"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = [v6 objectForKeyedSubscript:@"name"];
          }
          else
          {
            id v9 = 0;
          }
        }
        else
        {
          id v9 = 0;
        }

        id v10 = [v6 objectForKeyedSubscript:@"len"];
        if (v10)
        {
          id v11 = [v6 objectForKeyedSubscript:@"len"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = [v6 objectForKeyedSubscript:@"len"];
          }
          else
          {
            id v12 = 0;
          }
        }
        else
        {
          id v12 = 0;
        }

        uint64_t v13 = [v6 objectForKeyedSubscript:@"mask"];
        if (v13)
        {
          BOOL v14 = [v6 objectForKeyedSubscript:@"mask"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = [v6 objectForKeyedSubscript:@"mask"];
          }
          else
          {
            uint64_t v15 = 0;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }

        if (v9)
        {
          if ([v9 hasPrefix:@"EL "])
          {
            v96 = v15;
            uint64_t v16 = [v9 substringFromIndex:objc_msgSend(@"EL ", "length")];
            id v17 = [v84 numberFromString:v16];
            uint64_t v18 = [v90 taggedIEList];
            uint64_t v19 = [NSString stringWithFormat:@"%@%@", @"BeaconInformationElement_", v16];
            uint64_t v20 = [v18 objectForKeyedSubscript:v19];

            objc_msgSend(v89, "appendFormat:", @"%02X", objc_msgSend(v17, "unsignedIntValue"));
            if (_apProfileIncludeIELen)
            {
              objc_msgSend(v89, "appendFormat:", @"%02X", objc_msgSend(v20, "length"));
              uint64_t v4 = v91;
            }
            else
            {
              uint64_t v4 = v91;
              if (v20) {
                int v33 = @"1";
              }
              else {
                int v33 = @"0";
              }
              [v89 appendString:v33];
            }
            [a1 _extractFieldsFor:v6 From:v20 Into:v89];
          }
          else
          {
            if (![v9 hasPrefix:@"exEL "])
            {
              long long v26 = [v90 valueForKey:v9];
              uint64_t v27 = [v26 unsignedLongValue];

              v28 = objc_msgSend(NSString, "stringWithFormat:", @"%%0%ulX", 2 * objc_msgSend(v12, "unsignedIntValue"));
              if (v12)
              {
                if ([v12 longValue] < 1 || (unint64_t)objc_msgSend(v12, "longValue") < 9)
                {
                  if (v15) {
                    v27 &= [v15 unsignedLongValue];
                  }
                  if ([v12 longValue] == -1) {
                    objc_msgSend(v89, "appendFormat:", @"%lu", v27);
                  }
                  else {
                    objc_msgSend(v89, "appendFormat:", v28, v27);
                  }
                }
                else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v29 = [v12 longValue];
                  *(_DWORD *)buf = 136315906;
                  v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                  __int16 v125 = 2112;
                  v126 = v6;
                  __int16 v127 = 2048;
                  uint64_t v128 = v29;
                  __int16 v129 = 2048;
                  uint64_t v130 = 8;
                  long long v30 = MEMORY[0x1E4F14500];
                  long long v31 = "%s - Field %@ len (%ld) is too large for non TLV values (max=%lu)";
                  uint32_t v32 = 42;
                  goto LABEL_48;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                __int16 v125 = 2112;
                v126 = v6;
                long long v30 = MEMORY[0x1E4F14500];
                long long v31 = "%s - Field %@ has wrong format (missing len) - ignoring";
                uint32_t v32 = 22;
LABEL_48:
                _os_log_impl(&dword_1D3CCD000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
              }

              goto LABEL_58;
            }
            v96 = v15;
            __int16 v21 = [v9 substringFromIndex:objc_msgSend(@"exEL ", "length")];
            unint64_t v22 = [v84 numberFromString:v21];
            __int16 v23 = [v90 extendedIEList];
            uint64_t v24 = [NSString stringWithFormat:@"%@255_%@", @"BeaconInformationElement_", v21];
            uint64_t v25 = [v23 objectForKeyedSubscript:v24];

            [v89 appendString:@"FF"];
            if (_apProfileIncludeIELen)
            {
              objc_msgSend(v89, "appendFormat:", @"%02X", objc_msgSend(v25, "length"));
              uint64_t v4 = v91;
            }
            else
            {
              uint64_t v4 = v91;
              if (v25) {
                int v34 = @"1";
              }
              else {
                int v34 = @"0";
              }
              [v89 appendString:v34];
            }
            objc_msgSend(v89, "appendFormat:", @"%02X", objc_msgSend(v22, "unsignedIntValue"));
            [a1 _extractFieldsFor:v6 From:v25 Into:v89];
          }
          uint64_t v15 = v96;
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
          __int16 v125 = 2112;
          v126 = v6;
          _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s - Field has wrong format (missing name) - ignoring : %@", buf, 0x16u);
        }
LABEL_58:

        ++v5;
      }
      while (v4 != v5);
      uint64_t v4 = [obj countByEnumeratingWithState:&v115 objects:v131 count:16];
    }
    while (v4);
  }

  v86 = objc_opt_new();
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  unint64_t v35 = [v90 vendorIEList];
  uint64_t v36 = [v35 allKeys];
  uint64_t v37 = objc_msgSend(v36, "sortedArrayUsingSelector:");

  id v85 = v37;
  uint64_t v88 = [v37 countByEnumeratingWithState:&v111 objects:v122 count:16];
  __int16 v38 = v89;
  if (!v88) {
    goto LABEL_128;
  }
  uint64_t v87 = *(void *)v112;
  do
  {
    for (uint64_t i = 0; i != v88; uint64_t i = v75 + 1)
    {
      if (*(void *)v112 != v87) {
        objc_enumerationMutation(v85);
      }
      uint64_t v92 = i;
      uint64_t v40 = *(void *)(*((void *)&v111 + 1) + 8 * i);
      id v41 = [v90 vendorIEList];
      id obja = [v41 objectForKeyedSubscript:v40];

      if (_apProfileListVendorIEs)
      {
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        id v98 = (id)_apProfileVendorExcludeFields;
        uint64_t v42 = [v98 countByEnumeratingWithState:&v107 objects:v121 count:16];
        if (!v42) {
          goto LABEL_93;
        }
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v108;
        while (1)
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v108 != v44) {
              objc_enumerationMutation(v98);
            }
            long long v46 = *(void **)(*((void *)&v107 + 1) + 8 * j);
            long long v47 = [v46 objectForKeyedSubscript:@"match_len"];
            if (v47)
            {
              long long v48 = [v46 objectForKeyedSubscript:@"match_len"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v49 = [v46 objectForKeyedSubscript:@"match_len"];
              }
              else
              {
                long long v49 = 0;
              }
            }
            else
            {
              long long v49 = 0;
            }

            uint64_t v50 = [v46 objectForKeyedSubscript:@"match_value"];
            if (!v50)
            {
              __int16 v53 = 0;
LABEL_88:
              int v54 = MEMORY[0x1E4F14500];
LABEL_89:
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
                __int16 v125 = 2112;
                v126 = v49;
                __int16 v127 = 2112;
                uint64_t v128 = (uint64_t)v53;
                __int16 v129 = 2112;
                uint64_t v130 = (uint64_t)v46;
                _os_log_impl(&dword_1D3CCD000, v54, OS_LOG_TYPE_DEFAULT, "%s - Field has wrong format (missing match_len (%@) and|or match_value (%@) and|or matchLen is larger than 8) - ignoring : %@", buf, 0x2Au);
              }
              goto LABEL_91;
            }
            __int16 v51 = (void *)v50;
            int v52 = [v46 objectForKeyedSubscript:@"match_value"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              __int16 v53 = [v46 objectForKeyedSubscript:@"match_value"];
            }
            else
            {
              __int16 v53 = 0;
            }

            if (!v49) {
              goto LABEL_88;
            }
            int v54 = MEMORY[0x1E4F14500];
            if (!v53 || [v49 unsignedIntValue] >= 9) {
              goto LABEL_89;
            }
            unint64_t v55 = [obja length];
            if (v55 >= [v49 unsignedIntValue]
              && objc_msgSend(a1, "_compareBytes:FromStart:WithLen:With:", obja, 0, objc_msgSend(v49, "unsignedIntValue"), v53))
            {

              __int16 v38 = v89;
              uint64_t v75 = v92;
              v76 = obja;
              goto LABEL_125;
            }
LABEL_91:
          }
          uint64_t v43 = [v98 countByEnumeratingWithState:&v107 objects:v121 count:16];
          if (!v43)
          {
LABEL_93:

            break;
          }
        }
      }
      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v98 = (id)_apProfileVendorFields;
      uint64_t v56 = [v98 countByEnumeratingWithState:&v103 objects:v120 count:16];
      if (!v56) {
        goto LABEL_121;
      }
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v104;
      do
      {
        for (uint64_t k = 0; k != v57; ++k)
        {
          if (*(void *)v104 != v58) {
            objc_enumerationMutation(v98);
          }
          uint64_t v60 = *(void **)(*((void *)&v103 + 1) + 8 * k);
          v61 = [v60 objectForKeyedSubscript:@"match_len"];
          if (v61)
          {
            uint64_t v62 = [v60 objectForKeyedSubscript:@"match_len"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v63 = [v60 objectForKeyedSubscript:@"match_len"];
            }
            else
            {
              v63 = 0;
            }
          }
          else
          {
            v63 = 0;
          }

          uint64_t v64 = [v60 objectForKeyedSubscript:@"match_value"];
          if (!v64)
          {
            v67 = 0;
LABEL_116:
            v68 = MEMORY[0x1E4F14500];
LABEL_117:
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v124 = "+[WiFiUsageAccessPointProfile _toMobileAssetsProfile:]";
              __int16 v125 = 2112;
              v126 = v63;
              __int16 v127 = 2112;
              uint64_t v128 = (uint64_t)v67;
              __int16 v129 = 2112;
              uint64_t v130 = (uint64_t)v60;
              _os_log_impl(&dword_1D3CCD000, v68, OS_LOG_TYPE_DEFAULT, "%s - Field has wrong format (missing match_len (%@) and|or match_value (%@) and|or matchLen is larger than 8) - ignoring : %@", buf, 0x2Au);
            }
            goto LABEL_119;
          }
          v65 = (void *)v64;
          v66 = [v60 objectForKeyedSubscript:@"match_value"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v67 = [v60 objectForKeyedSubscript:@"match_value"];
          }
          else
          {
            v67 = 0;
          }

          if (!v63) {
            goto LABEL_116;
          }
          v68 = MEMORY[0x1E4F14500];
          if (!v67 || [v63 unsignedIntValue] >= 9) {
            goto LABEL_117;
          }
          unint64_t v69 = [obja length];
          if (v69 >= [v63 unsignedIntValue]
            && objc_msgSend(a1, "_compareBytes:FromStart:WithLen:With:", obja, 0, objc_msgSend(v63, "unsignedIntValue"), v67))
          {
            v74 = objc_opt_new();
            v76 = obja;
            [a1 _extractFieldsFor:v60 From:obja Into:v74];
            [v86 addObject:v74];

            __int16 v38 = v89;
            uint64_t v75 = v92;
            goto LABEL_125;
          }
LABEL_119:
        }
        uint64_t v57 = [v98 countByEnumeratingWithState:&v103 objects:v120 count:16];
      }
      while (v57);
LABEL_121:

      __int16 v38 = v89;
      uint64_t v75 = v92;
      v76 = obja;
      if (_apProfileListVendorIEs)
      {
        id v70 = obja;
        uint64_t v71 = [v70 bytes];
        unint64_t v72 = [v70 length];
        uint64_t v73 = _apProfileListVendorIEsLen;
        if (v72 < _apProfileListVendorIEsLen) {
          uint64_t v73 = [v70 length];
        }
        id v98 = +[WiFiUsagePrivacyFilter toHEXString:v71 length:v73];
        objc_msgSend(v86, "addObject:");
LABEL_125:
      }
    }
    uint64_t v88 = [v85 countByEnumeratingWithState:&v111 objects:v122 count:16];
  }
  while (v88);
LABEL_128:

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v77 = [v86 allObjects];
  v78 = [v77 sortedArrayUsingSelector:sel_compare_];

  uint64_t v79 = [v78 countByEnumeratingWithState:&v99 objects:v119 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v100;
    do
    {
      for (uint64_t m = 0; m != v80; ++m)
      {
        if (*(void *)v100 != v81) {
          objc_enumerationMutation(v78);
        }
        [v38 appendFormat:@"DD%@", *(void *)(*((void *)&v99 + 1) + 8 * m)];
      }
      uint64_t v80 = [v78 countByEnumeratingWithState:&v99 objects:v119 count:16];
    }
    while (v80);
  }

  return v38;
}

+ (id)_loadFromUserDefaults:(id)a3 withKey:(id)a4 withCachedData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[WiFiUsagePrivacyFilter reformatMACAddress:v8];
  if (!v11)
  {
    id v13 = 0;
    goto LABEL_17;
  }
  if (v10)
  {
    id v12 = v10;
    if (!v9)
    {
LABEL_11:
      if (v12)
      {
        uint64_t v15 = (void *)[v12 mutableCopy];
        uint64_t v16 = [v12 objectForKeyedSubscript:@"apProfileBeaconInfo"];
        [v15 addEntriesFromDictionary:v16];

        id v17 = [v12 objectForKeyedSubscript:@"apProfileWPSInfo"];
        [v15 addEntriesFromDictionary:v17];

        [v15 setValue:0 forKey:@"apProfileBeaconInfo"];
        [v15 setValue:0 forKey:@"apProfileWPSInfo"];
        uint64_t v18 = [v15 objectForKeyedSubscript:@"apProfileCacheTimestampCreated"];
        [v18 timeIntervalSinceNow];
        double v20 = -v19;

        __int16 v21 = [a1 _getBinTimeInterval:1 As:v20];
        [v15 setValue:v21 forKey:@"ageAtRemoval"];

        [v15 setValue:0 forKey:@"apProfileCacheTimestampCreated"];
        unint64_t v22 = [v15 objectForKeyedSubscript:@"apProfileCacheTimestamp"];
        [v22 timeIntervalSinceNow];
        double v24 = -v23;

        uint64_t v25 = [a1 _getBinTimeInterval:1 As:v24];
        [v15 setValue:v25 forKey:@"timeSinceLastRefresh"];

        [v15 setValue:0 forKey:@"apProfileCacheTimestamp"];
        [v15 setValue:0 forKey:@"submittedToCA"];
        long long v26 = [v12 objectForKey:@"apProfileBeaconInfoParsingSuccessful"];
        int v27 = [v26 BOOLValue];

        if (v27) {
          [v15 setValue:0 forKey:@"apProfileBeaconRaw"];
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v14 = [a1 _getDefaults];
    id v12 = [v14 dictionaryForKey:v11];

    if (!v9) {
      goto LABEL_11;
    }
  }
  if (!v12) {
    goto LABEL_11;
  }
  if ([v9 isEqualToString:@"apProfileID"]
    && ![a1 _isProfileValidForStorage:v12])
  {
    v28 = objc_msgSend(NSString, "stringWithFormat:", @"stale (from %s)", "+[WiFiUsageAccessPointProfile _loadFromUserDefaults:withKey:withCachedData:]");
    [a1 _submitProfileFor:v8 withCachedDict:v12 AndEraseWithLog:v28];

LABEL_15:
    uint64_t v15 = 0;
    goto LABEL_16;
  }
  uint64_t v15 = [v12 objectForKey:v9];
LABEL_16:
  id v13 = v15;

LABEL_17:

  return v13;
}

+ (void)_saveToUserDefaults:(id)a3 withKey:(id)a4 andValue:(id)a5
{
  id v19 = a3;
  id v8 = (void *)MEMORY[0x1E4F1CA60];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 dictionary];
  id v12 = [a1 _getDefaults];
  id v13 = +[WiFiUsagePrivacyFilter reformatMACAddress:v19];
  BOOL v14 = [v12 dictionaryForKey:v13];

  if (v14)
  {
    [v11 addEntriesFromDictionary:v14];
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    [v11 setValue:v15 forKey:@"apProfileCacheTimestampCreated"];

    [v11 setValue:_apProfileVersionString forKey:@"apProfileVersion"];
  }
  [v11 setValue:v9 forKey:v10];

  uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
  [v11 setValue:v16 forKey:@"apProfileCacheTimestamp"];

  id v17 = [a1 _getDefaults];
  uint64_t v18 = +[WiFiUsagePrivacyFilter reformatMACAddress:v19];
  [v17 setObject:v11 forKey:v18];
}

+ (id)_cachedProfile:(id)a3
{
  return +[WiFiUsageAccessPointProfile _loadFromUserDefaults:a3 withKey:@"apProfileID" withCachedData:0];
}

+ (id)profileFromBeaconData:(id)a3 andParsedIE:(id)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7
    || ([v7 objectForKeyedSubscript:@"BSSID"],
        (id v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: no BSSID in ParsedIE", buf, 0xCu);
    }
    id v9 = 0;
  }
  if (_apProfileVersion != 1)
  {
    id v19 = 0;
    goto LABEL_66;
  }
  [a1 _endPrevAssoc];
  id v10 = objc_alloc_init((Class)a1);
  [v10 setBssid:0];
  [v10 setApProfile:0];
  if (!v6)
  {
    int v20 = 0;
LABEL_59:
    if (v8) {
      [a1 updateWithWPS:v8];
    }
    if (v20) {
      [a1 _cleanUpStaleProfiles];
    }
    id v19 = v10;
    goto LABEL_65;
  }
  id v92 = a1;
  id v11 = [[WiFiUsageParsedBeacon alloc] initWithBeaconData:v6 andAdditionalMetadata:v8];
  id v12 = [(WiFiUsageParsedBeacon *)v11 bssid];
  [v10 setBssid:v12];

  id v13 = [(WiFiUsageParsedBeacon *)v11 vendorIEList];
  BOOL v14 = [v13 allKeys];
  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF BEGINSWITH[c] '00:17:F2-6' OR SELF BEGINSWITH[c] '00:17:F2-9'"];
  uint64_t v16 = [v14 filteredArrayUsingPredicate:v15];

  if ([(__CFString *)v16 count])
  {
    id v17 = v11;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [v10 bssid];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040;
      __int16 v95 = 2112;
      v96 = v18;
      __int16 v97 = 2112;
      id v98 = v16;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: (%{mask.hash}@) contains PersonalHotspotIEs:%@ -- skip", buf, 0x2Au);
    }
    goto LABEL_64;
  }
  __int16 v21 = [(WiFiUsageParsedBeacon *)v11 taggedIEList];
  uint64_t v22 = MEMORY[0x1E4F1CC28];
  uint64_t v91 = [v21 allKeysForObject:MEMORY[0x1E4F1CC28]];

  double v23 = [(WiFiUsageParsedBeacon *)v11 extendedIEList];
  double v24 = [v23 allKeysForObject:v22];

  BOOL v25 = [(WiFiUsageParsedBeacon *)v11 parsingSuccessful];
  long long v26 = v11;
  a1 = v92;
  if (!v25 || [v91 count] || objc_msgSend(v24, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v27 = [v10 bssid];
      BOOL v28 = [(WiFiUsageParsedBeacon *)v26 parsingSuccessful];
      *(_DWORD *)buf = 136316418;
      uint64_t v29 = @"NO";
      *(void *)&uint8_t buf[4] = "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]";
      *(_WORD *)&buf[12] = 2160;
      *(void *)&buf[14] = 1752392040;
      __int16 v95 = 2112;
      if (v28) {
        uint64_t v29 = @"YES";
      }
      v96 = v27;
      __int16 v97 = 2112;
      id v98 = v29;
      __int16 v99 = 2112;
      long long v100 = v91;
      __int16 v101 = 2112;
      long long v102 = v24;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: (%{mask.hash}@) parsingSuccessful: %@ invalidElements:%@ invalidExtElements:%@ -- skip", buf, 0x3Eu);
    }
    if (!+[WiFiUsagePrivacyFilter isInternalInstall])
    {
      int v45 = 0;
      int v20 = 0;
      goto LABEL_58;
    }
  }
  v86 = v24;
  long long v30 = [v10 bssid];
  uint64_t v87 = +[WiFiUsageAccessPointProfile _cachedProfile:v30];

  [v10 bssid];
  long long v31 = v90 = v26;
  uint32_t v32 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v31 withKey:@"apProfileBeaconInfoOccurrencies" withCachedData:0];
  uint64_t v33 = [v32 unsignedIntegerValue];

  int v34 = [v10 bssid];
  v89 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v34 withKey:@"apProfileCacheTimestamp" withCachedData:0];

  unint64_t v35 = [v10 bssid];
  uint64_t v88 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v35 withKey:@"apProfile_shortID" withCachedData:0];

  long long v26 = v90;
  if (_apProfileVersion == 1)
  {
    uint64_t v36 = +[WiFiUsageAccessPointProfile _toMobileAssetsProfile:v90];
    [v10 setApProfile:v36];
  }
  uint64_t v37 = [v10 apProfile];
  if (v37)
  {
    __int16 v38 = v37;
    if (v89)
    {
      [v89 timeIntervalSinceNow];
      double v40 = -v39;
      double v41 = *(double *)&_apProfileMinSecsBetweenOccurrencies;

      if (v41 >= v40) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    long long v46 = [v10 apProfile];
    unsigned int v47 = [v46 isEqualToString:v87];

    if (v33
      && (uint64_t v48 = v33 + v47) != 0
      && v47
      && v88
      && (uint64_t v49 = [v88 length], v49 == 2 * _shortProfileBytesLen))
    {
      uint64_t v82 = v48;
      int v20 = 0;
    }
    else
    {
      uint64_t v50 = [v10 bssid];
      __int16 v51 = objc_msgSend(NSString, "stringWithFormat:", @"replaced (from %s)", "+[WiFiUsageAccessPointProfile profileFromBeaconData:andParsedIE:]");
      [v92 _submitProfileFor:v50 withCachedDict:0 AndEraseWithLog:v51];

      int v52 = [v10 bssid];
      __int16 v53 = [v10 apProfile];
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v52 withKey:@"apProfileID" andValue:v53];

      v83 = [v10 bssid];
      int v54 = [v10 apProfile];
      uint64_t v55 = _shortProfileBytesLen;
      id v56 = v54;
      memset(buf, 0, 20);
      id v84 = v56;
      if (v56)
      {
        uint64_t v57 = (void *)MEMORY[0x1E4F1C9B8];
        id v58 = v56;
        objc_msgSend(v57, "dataWithBytes:length:", objc_msgSend(v58, "cStringUsingEncoding:", 4), objc_msgSend(v58, "length"));
        id v56 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v59 = v56;
      if (CC_SHA1((const void *)[v59 bytes], objc_msgSend(v59, "length"), buf) == buf)
      {
        uint64_t v60 = +[WiFiUsagePrivacyFilter toHEXString:buf length:20];
      }
      else
      {
        uint64_t v60 = 0;
      }
      unint64_t v61 = 2 * v55;
      if (v61 < [v60 length])
      {
        uint64_t v62 = objc_msgSend(v60, "substringFromIndex:", objc_msgSend(v60, "length") - v61);

        uint64_t v60 = (void *)v62;
      }

      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v83 withKey:@"apProfile_shortID" andValue:v60];
      v63 = [v10 bssid];
      uint64_t v64 = [(WiFiUsageParsedBeacon *)v90 dictionaryRepresentation];
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v63 withKey:@"apProfileBeaconInfo" andValue:v64];

      v65 = [v10 bssid];
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v65 withKey:@"apProfileBeaconRaw" andValue:v6];

      uint64_t v82 = 1;
      int v20 = 1;
      a1 = v92;
    }
    v66 = [v10 bssid];
    v67 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v66 withKey:@"apProfileBeaconInfo" withCachedData:0];

    id v85 = v67;
    v93 = [v67 objectForKey:@"apName"];
    v68 = [(WiFiUsageParsedBeacon *)v90 apName];
    if (v68)
    {
      unint64_t v69 = v68;
      if (v93)
      {
        id v70 = [(WiFiUsageParsedBeacon *)v90 apName];
        char v71 = [v70 isEqualToString:v93];

        if (v71) {
          goto LABEL_52;
        }
      }
      else
      {
      }
      unint64_t v72 = [v10 bssid];
      uint64_t v73 = [(WiFiUsageParsedBeacon *)v90 dictionaryRepresentation];
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v72 withKey:@"apProfileBeaconInfo" andValue:v73];

      v74 = [v10 bssid];
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v74 withKey:@"apProfileBeaconRaw" andValue:v6];
    }
LABEL_52:
    uint64_t v75 = [v10 bssid];
    v76 = NSNumber;
    BOOL v77 = [(WiFiUsageParsedBeacon *)v90 parsingSuccessful]
       && ![v91 count]
       && [v86 count] == 0;
    v78 = [v76 numberWithBool:v77];
    +[WiFiUsageAccessPointProfile _saveToUserDefaults:v75 withKey:@"apProfileBeaconInfoParsingSuccessful" andValue:v78];

    uint64_t v79 = [v10 bssid];
    uint64_t v80 = [NSNumber numberWithUnsignedInteger:v82];
    +[WiFiUsageAccessPointProfile _saveToUserDefaults:v79 withKey:@"apProfileBeaconInfoOccurrencies" andValue:v80];

    long long v26 = v90;
    uint64_t v44 = v85;
    goto LABEL_56;
  }
LABEL_27:
  uint64_t v42 = [v10 bssid];
  int v43 = [v42 isEqualToString:v9];

  if (v43)
  {
    uint64_t v44 = [v10 bssid];
    +[WiFiUsageAccessPointProfile _saveToUserDefaults:v44 withKey:@"apProfileForLatestAssoc" andValue:MEMORY[0x1E4F1CC38]];
    int v20 = 0;
LABEL_56:

    goto LABEL_57;
  }
  int v20 = 0;
LABEL_57:
  double v24 = v86;

  int v45 = 1;
LABEL_58:

  if (v45) {
    goto LABEL_59;
  }
LABEL_64:
  id v19 = 0;
LABEL_65:

LABEL_66:

  return v19;
}

+ (void)updateWithWPS:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3
    && ([v3 objectForKeyedSubscript:@"BSSID"], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    id v7 = [v4 objectForKeyedSubscript:@"WPS_PROB_RESP_IE"];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      id v9 = [v7 objectForKeyedSubscript:@"IE_KEY_WPS_PRIMARY_DEV_TYPE"];
      id v10 = v9;
      if (v9)
      {
        id v11 = [v9 objectForKeyedSubscript:@"WPS_DEV_TYPE_CAT"];
        [v8 setObject:v11 forKeyedSubscript:@"apProfileWPSDeviceCategory"];

        id v12 = [v10 objectForKeyedSubscript:@"WPS_DEV_TYPE_SUB_CAT"];
        [v8 setObject:v12 forKeyedSubscript:@"apProfileWPSDeviceSubcategory"];
      }
      id v13 = [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MODEL_NAME"];
      BOOL v14 = +[WiFiUsagePrivacyFilter reformatMACAddress:v13];
      if (v14)
      {
        [v8 setObject:@"dropped" forKeyedSubscript:@"apProfileWPSDeviceModelName"];
      }
      else
      {
        uint64_t v15 = [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MODEL_NAME"];
        [v8 setObject:v15 forKeyedSubscript:@"apProfileWPSDeviceModelName"];
      }
      uint64_t v16 = [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MODEL_NUM"];
      id v17 = +[WiFiUsagePrivacyFilter reformatMACAddress:v16];
      if (v17)
      {
        [v8 setObject:@"dropped" forKeyedSubscript:@"apProfileWPSDeviceModelNumber"];
      }
      else
      {
        uint64_t v18 = [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MODEL_NUM"];
        [v8 setObject:v18 forKeyedSubscript:@"apProfileWPSDeviceModelNumber"];
      }
      id v19 = [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MANUFACTURER"];
      int v20 = +[WiFiUsagePrivacyFilter reformatMACAddress:v19];
      if (v20)
      {
        [v8 setObject:@"dropped" forKeyedSubscript:@"apProfileWPSDeviceManufacturer"];
      }
      else
      {
        __int16 v21 = [v7 objectForKeyedSubscript:@"IE_KEY_WPS_MANUFACTURER"];
        [v8 setObject:v21 forKeyedSubscript:@"apProfileWPSDeviceManufacturer"];
      }
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v6 withKey:@"apProfileWPSInfo" andValue:v8];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315138;
    double v23 = "+[WiFiUsageAccessPointProfile updateWithWPS:]";
    _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: no BSSID in ParsedIE", (uint8_t *)&v22, 0xCu);
  }
}

+ (void)updateWithAssocTime:(double)a3 forBssid:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v6 withKey:@"apProfileVersion" withCachedData:0];
  if (v7)
  {
    id v8 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v6 withKey:@"apProfileMaxAssocTime" withCachedData:0];
    unint64_t v9 = [v8 unsignedIntegerValue];

    id v10 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v6 withKey:@"apProfileForLatestAssoc" withCachedData:0];
    int v11 = [v10 BOOLValue];

    if (v11 && (double v12 = (double)v9, (double)v9 <= a3))
    {
      double v13 = *(double *)&_apProfileMinAssoc;
      BOOL v14 = [NSNumber numberWithUnsignedLong:(unint64_t)a3];
      [a1 _saveToUserDefaults:v6 withKey:@"apProfileMaxAssocTime" andValue:v14];

      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v6 withKey:@"apProfileForLatestAssoc" andValue:MEMORY[0x1E4F1CC28]];
      BOOL v15 = v13 <= v12 || v13 > a3;
      if (!v15
        && [a1 _isProfileValidForUse:v6 withCachedDict:0]
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [a1 profileForBSSID:v6];
        int v17 = 136316162;
        uint64_t v18 = "+[WiFiUsageAccessPointProfile updateWithAssocTime:forBssid:]";
        __int16 v19 = 2160;
        uint64_t v20 = 1752392040;
        __int16 v21 = 2112;
        id v22 = v6;
        __int16 v23 = 2160;
        uint64_t v24 = 1752392040;
        __int16 v25 = 2112;
        long long v26 = v16;
        _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: profile for %{mask.hash}@ is valid: %{mask.hash}@", (uint8_t *)&v17, 0x34u);
      }
    }
    else
    {
      +[WiFiUsageAccessPointProfile _saveToUserDefaults:v6 withKey:@"apProfileForLatestAssoc" andValue:MEMORY[0x1E4F1CC28]];
    }
  }
}

+ (void)_submitProfileFor:(id)a3 withCachedDict:(id)a4 AndEraseWithLog:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (__CFString *)a5;
  int v11 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v8 withKey:@"apProfileVersion" withCachedData:v9];
  if (v11)
  {
    int v12 = [a1 _isProfileValidForUse:v8 withCachedDict:v9];
    double v13 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v8 withKey:@"submittedToCA" withCachedData:v9];
    int v14 = [v13 BOOLValue];

    BOOL v15 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
    int v17 = &off_1E69BC000;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (v12) {
        uint64_t v18 = &stru_1F2B5AC50;
      }
      else {
        uint64_t v18 = @"NOT ";
      }
      if (v14) {
        __int16 v19 = &stru_1F2B5AC50;
      }
      else {
        __int16 v19 = @"NOT ";
      }
      if (v14) {
        uint64_t v20 = &stru_1F2B5AC50;
      }
      else {
        uint64_t v20 = @"-- skip";
      }
      if (((v14 | v12) & 1) == 0)
      {
        if (+[WiFiUsagePrivacyFilter isInternalInstall]) {
          uint64_t v20 = @"-- skip";
        }
        else {
          uint64_t v20 = &stru_1F2B5AC50;
        }
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v29 = "+[WiFiUsageAccessPointProfile _submitProfileFor:withCachedDict:AndEraseWithLog:]";
      __int16 v30 = 2112;
      uint64_t v31 = (uint64_t)v8;
      __int16 v32 = 2112;
      uint64_t v33 = v18;
      __int16 v34 = 2112;
      unint64_t v35 = v19;
      __int16 v36 = 2112;
      uint64_t v37 = v20;
      __int16 v38 = 2112;
      double v39 = v10;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: profile for %@ is %@valid and %@already sentToCA%@ (%@)", buf, 0x3Eu);
      int v17 = &off_1E69BC000;
    }

    if ((v14 & 1) == 0 && ((v12 & 1) != 0 || [v17[161] isInternalInstall]))
    {
      id v21 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v8 withKey:0 withCachedData:v9];
      if (v21)
      {
        id v22 = [NSNumber numberWithBool:1];
        [a1 _saveToUserDefaults:v8 withKey:@"submittedToCA" andValue:v22];

        if (v10)
        {
          __int16 v23 = -[__CFString componentsSeparatedByString:](v10, "componentsSeparatedByString:", @"(");
          uint64_t v24 = [v23 objectAtIndexedSubscript:0];
          [v21 setValue:v24 forKey:@"reasonForSending"];
        }
        id v21 = v21;
        AnalyticsSendEventLazy();
      }
    }
    else
    {
      id v21 = 0;
    }
    __int16 v25 = [a1 _getDefaults];
    long long v26 = [v17[161] reformatMACAddress:v8];
    [v25 removeObjectForKey:v26];

    if (v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [v17[161] reformatMACAddress:v8];
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = "+[WiFiUsageAccessPointProfile _submitProfileFor:withCachedDict:AndEraseWithLog:]";
      __int16 v30 = 2160;
      uint64_t v31 = 1752392040;
      __int16 v32 = 2112;
      uint64_t v33 = v27;
      __int16 v34 = 2112;
      unint64_t v35 = v10;
      _os_log_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: removed %{mask.hash}@ from defaults: %@", buf, 0x2Au);
    }
  }
  else
  {
    id v21 = 0;
  }
}

id __80__WiFiUsageAccessPointProfile__submitProfileFor_withCachedDict_AndEraseWithLog___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)_getBinTimeInterval:(double)a3 As:(unint64_t)a4
{
  return +[WiFiUsagePrivacyFilter getBinFor:(unint64_t)a3 In:&unk_1F2B95638 WithLowestEdge:@"0" As:a4];
}

+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4 onlyIfCurrent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7 && _apProfileVersion == 1)
  {
    id v9 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v7 withKey:@"apProfileVersion" withCachedData:v8];
    id v10 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v7 withKey:@"apProfileBeaconInfoOccurrencies" withCachedData:v8];
    unint64_t v11 = [v10 unsignedIntegerValue];

    int v12 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v7 withKey:@"apProfileMaxAssocTime" withCachedData:v8];
    unint64_t v13 = [v12 unsignedIntegerValue];

    int v14 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v7 withKey:@"apProfileCacheTimestamp" withCachedData:v8];
    BOOL v15 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v7 withKey:@"apProfileForLatestAssoc" withCachedData:v8];
    int v16 = [v15 BOOLValue];

    int v17 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v7 withKey:@"apProfileBeaconInfoParsingSuccessful" withCachedData:v8];
    int v18 = [v17 BOOLValue];

    if (!v5 || (v16 & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([(id)_apProfileVersionString isEqualToString:v9] & v18) == 1
        && v11 >= _apProfileMinOccurrencies
        && (*(double *)&_apProfileMinAssoc <= (double)v13
         || v16
         && (objc_msgSend(v14, "timeIntervalSinceNow", (double)v13, *(double *)&_apProfileMinAssoc),
             *(double *)&_apProfileMinAssoc < -v23)))
      {
        BOOL v19 = 1;
      }
      else
      {
        if (!v9)
        {
LABEL_25:
          BOOL v19 = 0;
          goto LABEL_26;
        }
        BOOL v19 = 0;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = _apProfileVersionString;
          if (v18) {
            __int16 v25 = @"YES";
          }
          else {
            __int16 v25 = @"NO";
          }
          uint64_t v26 = _apProfileMinOccurrencies;
          uint64_t v30 = _apProfileMinAssoc;
          if (v16) {
            uint64_t v27 = @"YES";
          }
          else {
            uint64_t v27 = @"NO";
          }
          [v14 timeIntervalSinceNow];
          *(_DWORD *)buf = 136317698;
          __int16 v32 = "+[WiFiUsageAccessPointProfile _isProfileValidForUse:withCachedDict:onlyIfCurrent:]";
          __int16 v33 = 2112;
          uint64_t v34 = (uint64_t)v7;
          __int16 v35 = 2112;
          id v36 = v9;
          __int16 v37 = 2112;
          uint64_t v38 = v24;
          __int16 v39 = 2112;
          uint64_t v40 = v25;
          __int16 v41 = 2048;
          unint64_t v42 = v11;
          __int16 v43 = 2048;
          uint64_t v44 = v26;
          __int16 v45 = 2048;
          unint64_t v46 = v13;
          __int16 v47 = 2048;
          uint64_t v48 = v30;
          __int16 v49 = 2112;
          uint64_t v50 = v27;
          __int16 v51 = 2048;
          double v52 = -v28;
          uint64_t v20 = MEMORY[0x1E4F14500];
          id v21 = "%s: Profile for bssid: %@ is NOT valid: version:%@ (current:%@) parsingSuccessful:%@ occurrencies:%lu (>"
                "=%lu) maxAssocTime(sec):%lu (>=%f) isCurrent:%@ lastUpdated/currentAssocTime(sec):%f";
          uint32_t v22 = 112;
          goto LABEL_24;
        }
      }
    }
    else
    {
      BOOL v19 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        __int16 v32 = "+[WiFiUsageAccessPointProfile _isProfileValidForUse:withCachedDict:onlyIfCurrent:]";
        __int16 v33 = 2160;
        uint64_t v34 = 1752392040;
        __int16 v35 = 2112;
        id v36 = v7;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v14;
        uint64_t v20 = MEMORY[0x1E4F14500];
        id v21 = "%s: bssid %{mask.hash}@ has not been derived from a beacon retrieved after the current association (last updated: %@)";
        uint32_t v22 = 42;
LABEL_24:
        _os_log_impl(&dword_1D3CCD000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
        goto LABEL_25;
      }
    }
LABEL_26:

    goto LABEL_27;
  }
  BOOL v19 = 0;
LABEL_27:

  return v19;
}

+ (BOOL)_isProfileValidForUse:(id)a3 withCachedDict:(id)a4
{
  return [a1 _isProfileValidForUse:a3 withCachedDict:a4 onlyIfCurrent:0];
}

+ (id)profileForBSSID:(id)a3
{
  return (id)[a1 profileForBSSID:a3 onlyIfCurrent:0];
}

+ (id)profileForBSSID:(id)a3 onlyIfCurrent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if (_useShortProfile) {
      id v7 = @"apProfile_shortID";
    }
    else {
      id v7 = @"apProfileID";
    }
    id v8 = v7;
    int v9 = [a1 _isProfileValidForUse:v6 withCachedDict:0 onlyIfCurrent:v4];
    id v10 = 0;
    if (v9)
    {
      unint64_t v11 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v6 withKey:v8 withCachedData:0];
      id v10 = [NSString stringWithFormat:@"%@:%@", _apProfileVersionString, v11];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)longProfileForBSSID:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _isProfileValidForUse:v4 withCachedDict:0];
  id v6 = 0;
  if (v5)
  {
    id v7 = +[WiFiUsageAccessPointProfile _cachedProfile:v4];
    id v6 = [NSString stringWithFormat:@"%@:%@", _apProfileVersionString, v7];
  }

  return v6;
}

+ (id)shortProfileForBSSID:(id)a3
{
  id v4 = a3;
  int v5 = [a1 _isProfileValidForUse:v4 withCachedDict:0];
  id v6 = 0;
  if (v5)
  {
    id v7 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:v4 withKey:@"apProfile_shortID" withCachedData:0];
    id v6 = [NSString stringWithFormat:@"%@:%@", _apProfileVersionString, v7];
  }

  return v6;
}

+ (id)beaconsAndWPSInfo
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 _getDefaults];
  id v4 = [v3 dictionaryRepresentation];

  id v29 = (id)objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = [v4 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v10 = +[WiFiUsagePrivacyFilter reformatMACAddress:v9];

        if (v10)
        {
          unint64_t v11 = objc_opt_new();
          int v12 = [v4 objectForKeyedSubscript:v9];
          unint64_t v13 = [a1 _loadFromUserDefaults:v9 withKey:@"apProfileBeaconInfo" withCachedData:v12];
          int v14 = [v13 objectForKey:@"BeaconInformationElement_0"];

          [v11 setBssid:v9];
          BOOL v15 = [v4 objectForKeyedSubscript:v9];
          int v16 = [a1 _loadFromUserDefaults:v9 withKey:@"apProfileBeaconRaw" withCachedData:v15];
          [v11 setBeacon:v16];

          if (v14)
          {
            int v17 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
            [v11 setSsid:v17];
          }
          int v18 = [v4 objectForKeyedSubscript:v9];
          BOOL v19 = [a1 _loadFromUserDefaults:v9 withKey:@"apProfileWPSInfo" withCachedData:v18];
          [v11 setApProfileWPSInfo:v19];

          uint64_t v20 = [v4 objectForKeyedSubscript:v9];
          id v21 = [a1 _loadFromUserDefaults:v9 withKey:@"apProfileVersion" withCachedData:v20];
          [v11 setApProfileVersion:v21];

          uint32_t v22 = [v4 objectForKeyedSubscript:v9];
          double v23 = [a1 _loadFromUserDefaults:v9 withKey:@"apProfileID" withCachedData:v22];
          [v11 setApProfileID:v23];

          uint64_t v24 = [v4 objectForKeyedSubscript:v9];
          __int16 v25 = [a1 _loadFromUserDefaults:v9 withKey:@"apProfile_shortID" withCachedData:v24];
          objc_msgSend(v11, "setApProfile_shortID:", v25);

          uint64_t v26 = [v4 objectForKeyedSubscript:v9];
          uint64_t v27 = [a1 _loadFromUserDefaults:v9 withKey:@"apProfileCacheTimestampCreated" withCachedData:v26];

          if (v11 && v27) {
            [v29 setObject:v11 forKey:v27];
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v6);
  }

  return v29;
}

+ (id)apNameForBSSID:(id)a3
{
  id v3 = +[WiFiUsageAccessPointProfile _loadFromUserDefaults:a3 withKey:@"apProfileBeaconInfo" withCachedData:0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"apName"];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)apProfile
{
  return self->_apProfile;
}

- (void)setApProfile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apProfile, 0);

  objc_storeStrong((id *)&self->_bssid, 0);
}

@end