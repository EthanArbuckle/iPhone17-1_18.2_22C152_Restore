@interface KeychainSyncCountryInfo
+ (id)allCountries;
+ (id)countryInfoForCountryCode:(id)a3 dialingPrefix:(id)a4;
+ (id)countryInfoWithDictionary:(id)a3;
+ (void)_loadCountriesIfNeeded;
- (BOOL)isEqual:(id)a3;
- (NSString)countryCode;
- (NSString)countryName;
- (NSString)dialingPrefix;
- (NSString)localizedCountryName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCountryCode:(id)a3;
- (void)setCountryName:(id)a3;
- (void)setDialingPrefix:(id)a3;
- (void)setLocalizedCountryName:(id)a3;
@end

@implementation KeychainSyncCountryInfo

+ (void)_loadCountriesIfNeeded
{
  if (_loadCountriesIfNeeded_onceToken != -1) {
    dispatch_once(&_loadCountriesIfNeeded_onceToken, &__block_literal_global_15);
  }
}

void __49__KeychainSyncCountryInfo__loadCountriesIfNeeded__block_invoke()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1C978];
  v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v2 = [v1 pathForResource:@"CountryCodes" ofType:@"plist"];
  v3 = [v0 arrayWithContentsOfFile:v2];

  v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v16 = [MEMORY[0x1E4F1CA20] currentLocale];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    uint64_t v8 = *MEMORY[0x1E4F1C400];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = +[KeychainSyncCountryInfo countryInfoWithDictionary:v10];
          v12 = v11;
          if (v11)
          {
            v13 = [v11 countryCode];
            v14 = [v16 displayNameForKey:v8 value:v13];

            [v12 setLocalizedCountryName:v14];
            [v17 addObject:v12];
          }
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  [v17 sortUsingComparator:&__block_literal_global_24];
  v15 = (void *)_countryInfoCountries;
  _countryInfoCountries = (uint64_t)v17;
}

uint64_t __49__KeychainSyncCountryInfo__loadCountriesIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 localizedCountryName];
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = [v4 countryName];
  }
  uint64_t v8 = [v5 localizedCountryName];
  if (v8)
  {
    uint64_t v9 = [v7 localizedCompare:v8];
  }
  else
  {
    uint64_t v10 = [v5 countryName];
    uint64_t v9 = [v7 localizedCompare:v10];
  }
  if (!v6) {

  }
  return v9;
}

+ (id)allCountries
{
  [a1 _loadCountriesIfNeeded];
  v2 = (void *)_countryInfoCountries;

  return v2;
}

+ (id)countryInfoWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"prefix"];
  id v5 = [v3 objectForKey:@"name"];
  uint64_t v6 = [v3 objectForKey:@"code"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 length]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v5 length]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v6 length])
  {
    uint64_t v7 = objc_alloc_init(KeychainSyncCountryInfo);
    [(KeychainSyncCountryInfo *)v7 setCountryCode:v6];
    [(KeychainSyncCountryInfo *)v7 setCountryName:v5];
    [(KeychainSyncCountryInfo *)v7 setDialingPrefix:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)countryInfoForCountryCode:(id)a3 dialingPrefix:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = objc_msgSend(a1, "allCountries", 0);
  id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v13 = [v12 countryCode];
        if ([v13 isEqualToString:v6])
        {
          if (![v7 length])
          {

LABEL_15:
            id v9 = v12;
            goto LABEL_16;
          }
          v14 = [v12 dialingPrefix];
          char v15 = [v14 isEqualToString:v7];

          if (v15) {
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(KeychainSyncCountryInfo *)self countryCode];
    id v6 = [v4 countryCode];
    if ([v5 isEqualToString:v6])
    {
      id v7 = [(KeychainSyncCountryInfo *)self dialingPrefix];
      uint64_t v8 = [v4 dialingPrefix];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(KeychainSyncCountryInfo);
  id v5 = [(KeychainSyncCountryInfo *)self countryCode];
  [(KeychainSyncCountryInfo *)v4 setCountryCode:v5];

  id v6 = [(KeychainSyncCountryInfo *)self countryName];
  [(KeychainSyncCountryInfo *)v4 setCountryName:v6];

  id v7 = [(KeychainSyncCountryInfo *)self localizedCountryName];
  [(KeychainSyncCountryInfo *)v4 setLocalizedCountryName:v7];

  uint64_t v8 = [(KeychainSyncCountryInfo *)self dialingPrefix];
  [(KeychainSyncCountryInfo *)v4 setDialingPrefix:v8];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() description];
  id v5 = [(KeychainSyncCountryInfo *)self dialingPrefix];
  id v6 = [(KeychainSyncCountryInfo *)self countryName];
  id v7 = [v3 stringWithFormat:@"<%@: %p +%@ (%@)>", v4, self, v5, v6];

  return v7;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(id)a3
{
}

- (NSString)localizedCountryName
{
  return self->_localizedCountryName;
}

- (void)setLocalizedCountryName:(id)a3
{
}

- (NSString)dialingPrefix
{
  return self->_dialingPrefix;
}

- (void)setDialingPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialingPrefix, 0);
  objc_storeStrong((id *)&self->_localizedCountryName, 0);
  objc_storeStrong((id *)&self->_countryName, 0);

  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end