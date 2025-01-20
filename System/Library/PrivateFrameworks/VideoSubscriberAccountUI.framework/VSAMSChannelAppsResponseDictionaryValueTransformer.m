@interface VSAMSChannelAppsResponseDictionaryValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)parseAppData:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSAMSChannelAppsResponseDictionaryValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v4;
    _os_log_impl(&dword_23F9AB000, v5, OS_LOG_TYPE_DEFAULT, "Handling response %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(VSIdentityProviderChannelAppsResponse);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  objc_opt_class();
  unint64_t v9 = 0x263F1E000;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_26;
  }
  v10 = objc_msgSend(v4, "vs_arrayOfDictionariesForKey:", @"data");
  v11 = [v10 firstObject];
  v12 = objc_msgSend(v11, "vs_dictionaryForKey:", @"relationships");

  v13 = objc_msgSend(v12, "vs_dictionaryForKey:", @"subscription-apps");
  v14 = objc_msgSend(v12, "vs_dictionaryForKey:", @"channel-apps");
  uint64_t v15 = objc_msgSend(v12, "vs_dictionaryForKey:", @"apps");
  BOOL v16 = !v12 || v13 == 0;
  v38 = (void *)v15;
  v39 = v14;
  BOOL v17 = v16 || v14 == 0;
  BOOL v18 = v17 || v15 == 0;
  BOOL v19 = !v18;
  BOOL v36 = v19;
  v37 = v13;
  if (v18)
  {
    unint64_t v9 = 0x263F1E000uLL;
    v30 = (void *)MEMORY[0x263F1E208];
    id v20 = [(VSAMSChannelAppsResponseDictionaryValueTransformer *)self parseAppData:v4];
    v29 = [v30 failableWithObject:v20];
  }
  else
  {
    v33 = self;
    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v21 = objc_msgSend(v13, "vs_arrayForKey:", @"data");
    if (v21) {
      [v20 addObjectsFromArray:v21];
    }
    uint64_t v22 = objc_msgSend(v14, "vs_arrayForKey:", @"data");
    if (v22) {
      [v20 addObjectsFromArray:v22];
    }
    v32 = (void *)v22;
    v35 = (void *)v21;
    uint64_t v23 = objc_msgSend(v38, "vs_arrayForKey:", @"data");
    if (v23) {
      [v20 addObjectsFromArray:v23];
    }
    id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v24 setObject:v20 forKey:@"data"];
    v25 = [(VSAMSChannelAppsResponseDictionaryValueTransformer *)v33 parseAppData:v24];
    v26 = [v25 allApps];
    [v7 addObjectsFromArray:v26];

    v27 = [v25 appsByChannelID];
    id v34 = v7;
    v28 = (void *)v23;
    v29 = (void *)[v27 mutableCopy];
    [v8 addEntriesFromDictionary:v29];

    id v7 = v34;
    unint64_t v9 = 0x263F1E000;
  }

  if (v36)
  {
LABEL_26:
    [(VSIdentityProviderChannelAppsResponse *)v6 setAllApps:v7];
    [(VSIdentityProviderChannelAppsResponse *)v6 setAppsByChannelID:v8];
    v29 = [*(id *)(v9 + 520) failableWithObject:v6];
  }

  return v29;
}

- (id)parseAppData:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v27 = objc_alloc_init(VSIdentityProviderChannelAppsResponse);
  id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v31 = [MEMORY[0x263F08D50] valueTransformerForName:@"VSAMSAppsValueTransformer"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v26 = v3;
  objc_msgSend(v3, "vs_arrayOfDictionariesForKey:", @"data");
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v7 = [v31 transformedValue:v6];
        if (v7)
        {
          uint64_t v36 = i;
          id v8 = objc_msgSend(v6, "vs_dictionaryForKey:", @"meta");
          uint64_t v9 = objc_msgSend(v8, "vs_arrayOfStringsForKey:", @"channels");
          v35 = v8;
          uint64_t v10 = objc_msgSend(v8, "vs_arrayOfStringsForKey:", @"subscriptions");
          v33 = (void *)v10;
          id v34 = (void *)v9;
          if (v9) {
            v11 = (void *)v9;
          }
          else {
            v11 = (void *)v10;
          }
          id v12 = v11;
          v13 = v12;
          if (v12)
          {
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v38;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v38 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * j);
                  BOOL v19 = [v4 objectForKey:v18];
                  id v20 = v19;
                  if (v19) {
                    id v21 = v19;
                  }
                  else {
                    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
                  }
                  uint64_t v22 = v21;

                  [v22 addObject:v7];
                  [v4 setObject:v22 forKey:v18];
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v45 count:16];
              }
              while (v15);
            }
          }
          uint64_t v23 = 1;
          if (v33) {
            uint64_t v23 = 2;
          }
          if (v34) {
            uint64_t v24 = 0;
          }
          else {
            uint64_t v24 = v23;
          }
          [v7 setAppType:v24];
          [v29 addObject:v7];

          uint64_t i = v36;
        }
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v32);
  }

  [(VSIdentityProviderChannelAppsResponse *)v27 setAllApps:v29];
  [(VSIdentityProviderChannelAppsResponse *)v27 setAppsByChannelID:v4];

  return v27;
}

@end