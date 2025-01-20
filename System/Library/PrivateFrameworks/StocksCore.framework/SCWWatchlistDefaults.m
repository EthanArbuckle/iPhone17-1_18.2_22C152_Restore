@interface SCWWatchlistDefaults
+ (SCWWatchlistDefaults)defaultsWithDefaultSymbols:(id)a3;
+ (id)_defaultSymbolsByCountryCode;
+ (id)_iOS10DefaultsForCurrentCountry;
+ (id)_iOS7DefaultsForCurrentCountry;
+ (id)_legacyDefaultSymbolsByCountryCode;
+ (id)defaultsForCurrentCountry;
+ (id)defaultsHistoryForCurrentCountry;
+ (id)emptyDefaults;
- (NSArray)defaultSymbols;
- (SCWWatchlistDefaults)initWithDefaultSymbols:(id)a3;
- (id)defaultsByAppendingDefaults:(id)a3;
@end

@implementation SCWWatchlistDefaults

- (SCWWatchlistDefaults)initWithDefaultSymbols:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWWatchlistDefaults;
  v5 = [(SCWWatchlistDefaults *)&v9 init];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F1C400]];

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
    _os_log_impl(&dword_1AFD01000, v9, OS_LOG_TYPE_DEFAULT, "for country code=%{public}@, found default symbols: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  id v10 = objc_alloc((Class)objc_opt_class());
  if (v6) {
    v11 = v6;
  }
  else {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v12 = (void *)[v10 initWithDefaultSymbols:v11];

  return v12;
}

+ (SCWWatchlistDefaults)defaultsWithDefaultSymbols:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDefaultSymbols:v3];

  return (SCWWatchlistDefaults *)v4;
}

+ (id)emptyDefaults
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDefaultSymbols:MEMORY[0x1E4F1CBF0]];

  return v2;
}

+ (id)defaultsHistoryForCurrentCountry
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [a1 defaultsForCurrentCountry];
  v5 = [a1 _iOS10DefaultsForCurrentCountry];
  uint64_t v6 = [a1 _iOS7DefaultsForCurrentCountry];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v17[0] = v4;
  v17[1] = v5;
  v17[2] = v6;
  v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 3, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [v3 addObject:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }

  return v3;
}

- (id)defaultsByAppendingDefaults:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  uint64_t v6 = [v4 orderedSet];
  v7 = [(SCWWatchlistDefaults *)self defaultSymbols];
  [v6 addObjectsFromArray:v7];

  uint64_t v8 = [v5 defaultSymbols];

  [v6 addObjectsFromArray:v8];
  id v9 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = [v6 array];
  v11 = (void *)[v9 initWithDefaultSymbols:v10];

  return v11;
}

+ (id)_defaultSymbolsByCountryCode
{
  return &unk_1F089A000;
}

+ (id)_iOS10DefaultsForCurrentCountry
{
  id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];

  if (v5)
  {
    uint64_t v6 = [a1 _legacyDefaultSymbolsByCountryCode];
    v7 = [v6 objectForKeyedSubscript:v5];

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
  id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];

  if (v5)
  {
    uint64_t v6 = [a1 _legacyDefaultSymbolsByCountryCode];
    v7 = [v6 objectForKeyedSubscript:v5];

    if ([v5 isEqualToString:@"US"])
    {

      v7 = &unk_1F0899CE8;
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
  return &unk_1F089A028;
}

- (NSArray)defaultSymbols
{
  return self->_defaultSymbols;
}

- (void).cxx_destruct
{
}

@end