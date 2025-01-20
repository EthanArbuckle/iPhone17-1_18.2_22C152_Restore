@interface SCWatchlistDefaults
+ (id)_defaultSymbolsByCountryCode;
+ (id)_iOS10DefaultsForCurrentCountry;
+ (id)_iOS7DefaultsForCurrentCountry;
+ (id)_legacyDefaultSymbolsByCountryCode;
+ (id)defaultsForCurrentCountry;
+ (id)defaultsFromCarrierBundle;
+ (id)defaultsHistoryForCurrentCountry;
+ (id)defaultsWithDefaultSymbols:(id)a3;
+ (id)emptyDefaults;
+ (void)defaultsFromCarrierBundle;
- (NSArray)defaultSymbols;
- (SCWatchlistDefaults)initWithDefaultSymbols:(id)a3;
- (id)defaultsByAppendingDefaults:(id)a3;
@end

@implementation SCWatchlistDefaults

- (SCWatchlistDefaults)initWithDefaultSymbols:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWatchlistDefaults;
  v5 = [(SCWatchlistDefaults *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    defaultSymbols = v5->_defaultSymbols;
    v5->_defaultSymbols = (NSArray *)v6;
  }
  return v5;
}

+ (id)defaultsForCurrentCountry
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  id v4 = [v3 objectForKey:*MEMORY[0x263EFF4D0]];

  if (v4)
  {
    v5 = [a1 _defaultSymbolsByCountryCode];
    uint64_t v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (![v6 count])
  {
    v7 = [a1 _defaultSymbolsByCountryCode];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"US"];

    uint64_t v6 = (void *)v8;
  }
  objc_super v9 = StocksLogForCategory(4);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    v15 = v4;
    __int16 v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_222ED9000, v9, OS_LOG_TYPE_DEFAULT, "for country code=%{public}@, found default symbols: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  id v10 = objc_alloc((Class)objc_opt_class());
  if (v6) {
    v11 = v6;
  }
  else {
    v11 = (void *)MEMORY[0x263EFFA68];
  }
  v12 = (void *)[v10 initWithDefaultSymbols:v11];

  return v12;
}

+ (id)defaultsFromCarrierBundle
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9B0] orderedSet];
  id v3 = objc_alloc_init(MEMORY[0x263F02D30]);
  v35 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
  id v48 = 0;
  id v4 = [v3 getSubscriptionInfoWithError:&v48];
  id v5 = v48;
  if (v5)
  {
    uint64_t v6 = StocksLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SCWatchlistDefaults defaultsFromCarrierBundle];
    }
  }
  v31 = v4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [v4 subscriptions];
  uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v36)
  {
    uint64_t v7 = *(void *)v45;
    uint64_t v32 = *(void *)v45;
    id v33 = v3;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
        id v43 = 0;
        id v10 = (void *)[v3 copyCarrierBundleValue:v9 key:@"StockSymboli" bundleType:v35 error:&v43];
        id v11 = v43;
        v38 = v10;
        if (v11)
        {
          v12 = StocksLogForCategory(4);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v51 = (uint64_t)v11;
            _os_log_error_impl(&dword_222ED9000, v12, OS_LOG_TYPE_ERROR, "failed to get carrier stocks with error: %{public}@", buf, 0xCu);
          }

          id v10 = v38;
        }
        v37 = v11;
        v13 = StocksLogForCategory(4);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v9 slotID];
          v15 = [v9 uuid];
          *(_DWORD *)buf = 134218498;
          uint64_t v51 = v14;
          id v10 = v38;
          __int16 v52 = 2114;
          v53 = v15;
          __int16 v54 = 2114;
          v55 = v38;
          _os_log_impl(&dword_222ED9000, v13, OS_LOG_TYPE_DEFAULT, "for SIM slot=%ld, id=%{public}@, found stock symbols: %{public}@", buf, 0x20u);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v16 = v10;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v40 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v22 = [v21 objectForKey:@"symbol"];
                  if ([v22 length])
                  {
                    v23 = [v22 uppercaseString];
                    [v2 addObject:v23];
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v49 count:16];
            }
            while (v18);
          }

          uint64_t v7 = v32;
          id v3 = v33;
          id v10 = v38;
        }

        ++v8;
      }
      while (v8 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
    }
    while (v36);
  }

  v24 = StocksLogForCategory(4);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v25 = [v2 count];
    v26 = [v2 array];
    *(_DWORD *)buf = 134218242;
    uint64_t v51 = v25;
    __int16 v52 = 2114;
    v53 = v26;
    _os_log_impl(&dword_222ED9000, v24, OS_LOG_TYPE_DEFAULT, "found %lu carrier symbols: %{public}@", buf, 0x16u);
  }
  id v27 = objc_alloc((Class)objc_opt_class());
  v28 = [v2 array];
  v29 = (void *)[v27 initWithDefaultSymbols:v28];

  return v29;
}

+ (id)defaultsWithDefaultSymbols:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDefaultSymbols:v3];

  return v4;
}

+ (id)emptyDefaults
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDefaultSymbols:MEMORY[0x263EFFA68]];

  return v2;
}

+ (id)defaultsHistoryForCurrentCountry
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  id v4 = [a1 defaultsForCurrentCountry];
  id v5 = [a1 _iOS10DefaultsForCurrentCountry];
  uint64_t v6 = [a1 _iOS7DefaultsForCurrentCountry];
  uint64_t v7 = [a1 defaultsFromCarrierBundle];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v20[0] = v4;
  v20[1] = v5;
  v20[2] = v6;
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v20, 3, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v3 addObject:v13];
        uint64_t v14 = [v13 defaultsByAppendingDefaults:v7];
        [v3 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  return v3;
}

- (id)defaultsByAppendingDefaults:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF9B0];
  id v5 = a3;
  uint64_t v6 = [v4 orderedSet];
  uint64_t v7 = [(SCWatchlistDefaults *)self defaultSymbols];
  [v6 addObjectsFromArray:v7];

  uint64_t v8 = [v5 defaultSymbols];

  [v6 addObjectsFromArray:v8];
  id v9 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = [v6 array];
  uint64_t v11 = (void *)[v9 initWithDefaultSymbols:v10];

  return v11;
}

+ (id)_defaultSymbolsByCountryCode
{
  return &unk_26D5E9070;
}

+ (id)_iOS10DefaultsForCurrentCountry
{
  id v3 = [MEMORY[0x263EFF9B0] orderedSet];
  id v4 = [MEMORY[0x263EFF960] currentLocale];
  id v5 = [v4 objectForKey:*MEMORY[0x263EFF4D0]];

  if (v5)
  {
    uint64_t v6 = [a1 _legacyDefaultSymbolsByCountryCode];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];

    [v3 addObjectsFromArray:v7];
  }
  [v3 addObject:@"^DJI"];
  [v3 addObject:@"AAPL"];
  [v3 addObject:@"SBUX"];
  [v3 addObject:@"NKE"];
  [v3 addObject:@"YHOO"];
  id v8 = objc_alloc((Class)objc_opt_class());
  id v9 = [v3 array];
  uint64_t v10 = (void *)[v8 initWithDefaultSymbols:v9];

  return v10;
}

+ (id)_iOS7DefaultsForCurrentCountry
{
  id v3 = [MEMORY[0x263EFF9B0] orderedSet];
  id v4 = [MEMORY[0x263EFF960] currentLocale];
  id v5 = [v4 objectForKey:*MEMORY[0x263EFF4D0]];

  if (v5)
  {
    uint64_t v6 = [a1 _legacyDefaultSymbolsByCountryCode];
    uint64_t v7 = [v6 objectForKeyedSubscript:v5];

    if ([v5 isEqualToString:@"US"])
    {

      uint64_t v7 = &unk_26D5E9438;
    }
    [v3 addObjectsFromArray:v7];
  }
  [v3 addObject:@"AAPL"];
  [v3 addObject:@"GOOG"];
  [v3 addObject:@"YHOO"];
  [v3 addObject:@"^DJI"];
  [v3 addObject:@"^FTSE"];
  [v3 addObject:@"^GDAXI"];
  [v3 addObject:@"^HSI"];
  [v3 addObject:@"^N225"];
  id v8 = objc_alloc((Class)objc_opt_class());
  id v9 = [v3 array];
  uint64_t v10 = (void *)[v8 initWithDefaultSymbols:v9];

  return v10;
}

+ (id)_legacyDefaultSymbolsByCountryCode
{
  return &unk_26D5E9098;
}

- (NSArray)defaultSymbols
{
  return self->_defaultSymbols;
}

- (void).cxx_destruct
{
}

+ (void)defaultsFromCarrierBundle
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222ED9000, a2, OS_LOG_TYPE_ERROR, "failed to get subscription info for carrier stocks with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end