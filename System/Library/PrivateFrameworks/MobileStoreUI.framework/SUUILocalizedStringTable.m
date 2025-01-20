@interface SUUILocalizedStringTable
- (NSBundle)bundle;
- (NSString)tableName;
- (SUUILocalizedStringTable)initWithBundle:(id)a3 localeName:(id)a4 tableName:(id)a5;
- (id)_legacyLanguageNameForLanguageCode:(id)a3;
- (id)localizedStringForKey:(id)a3;
@end

@implementation SUUILocalizedStringTable

- (id)localizedStringForKey:(id)a3
{
  return [(NSDictionary *)self->_strings objectForKey:a3];
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (SUUILocalizedStringTable)initWithBundle:(id)a3 localeName:(id)a4 tableName:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)SUUILocalizedStringTable;
  v12 = [(SUUILocalizedStringTable *)&v38 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bundle, a3);
    uint64_t v14 = [v11 copy];
    tableName = v13->_tableName;
    v13->_tableName = (NSString *)v14;

    v16 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    if ([v16 isEqualToString:@"zh_Hans"])
    {
      v17 = @"zh_CN";
    }
    else
    {
      if (![v16 isEqualToString:@"zh_Hant"])
      {
LABEL_7:
        uint64_t v18 = [v9 pathForResource:v11 ofType:@"strings" inDirectory:0 forLocalization:v16];
        v19 = (void *)v18;
        if (!v16 || v18)
        {
          id v10 = v16;
          if (!v18)
          {
LABEL_32:

            goto LABEL_33;
          }
        }
        else
        {
          v20 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v16];
          id v10 = [v20 objectForKey:*MEMORY[0x263EFF508]];

          v19 = [v9 pathForResource:v11 ofType:@"strings" inDirectory:0 forLocalization:v10];
          if (!v19)
          {
            uint64_t v21 = [(SUUILocalizedStringTable *)v13 _legacyLanguageNameForLanguageCode:v10];
            if (!v21
              || (v22 = (void *)v21,
                  [v9 pathForResource:v11 ofType:@"strings" inDirectory:0 forLocalization:v21], v19 = objc_claimAutoreleasedReturnValue(), v22, !v19))
            {
              [v9 preferredLocalizations];
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v23 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v39 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                v33 = v20;
                uint64_t v26 = *(void *)v35;
                while (2)
                {
                  for (uint64_t i = 0; i != v25; ++i)
                  {
                    if (*(void *)v35 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    v28 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                    if ([v28 hasPrefix:v10])
                    {
                      uint64_t v29 = [v9 pathForResource:v11 ofType:@"strings" inDirectory:0 forLocalization:v28];
                      if (v29)
                      {
                        v19 = (void *)v29;
                        goto LABEL_25;
                      }
                    }
                  }
                  uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v39 count:16];
                  if (v25) {
                    continue;
                  }
                  break;
                }
                v19 = 0;
LABEL_25:
                v20 = v33;
              }
              else
              {
                v19 = 0;
              }
            }
          }

          if (!v19) {
            goto LABEL_32;
          }
        }
        v30 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v19];
        v31 = [MEMORY[0x263F08AC0] propertyListWithData:v30 options:0 format:0 error:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v13->_strings, v31);
        }

        goto LABEL_32;
      }
      v17 = @"zh_TW";
    }

    v16 = v17;
    goto LABEL_7;
  }
LABEL_33:

  return v13;
}

- (id)_legacyLanguageNameForLanguageCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"de"])
  {
    v4 = @"German";
  }
  else if ([v3 isEqualToString:@"en"])
  {
    v4 = @"English";
  }
  else if ([v3 isEqualToString:@"es"])
  {
    v4 = @"Spanish";
  }
  else if ([v3 isEqualToString:@"fr"])
  {
    v4 = @"French";
  }
  else if ([v3 isEqualToString:@"it"])
  {
    v4 = @"Italian";
  }
  else if ([v3 isEqualToString:@"jp"])
  {
    v4 = @"Japanese";
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

@end