@interface SIUserDefaults
+ (BOOL)BOOLForKey:(id)a3;
+ (BOOL)BOOLForKey:(id)a3 useCache:(BOOL)a4;
+ (BOOL)shouldUseCache;
+ (double)doubleForKey:(id)a3;
+ (double)doubleForKey:(id)a3 useCache:(BOOL)a4;
+ (float)floatForKey:(id)a3;
+ (float)floatForKey:(id)a3 useCache:(BOOL)a4;
+ (id)_numberForObject:(id)a3;
+ (id)cachedObjectForKey:(id)a3;
+ (id)defaultValues;
+ (id)listForKey:(id)a3;
+ (id)numberForKey:(id)a3;
+ (id)numberForKey:(id)a3 useCache:(BOOL)a4;
+ (id)objectForKey:(id)a3;
+ (id)objectForKey:(id)a3 useCache:(BOOL)a4;
+ (id)objectForKeySlow:(id)a3;
+ (id)resolutionDictionaryForKey:(id)a3;
+ (id)stringForKey:(id)a3;
+ (id)userDefaultsCache;
+ (id)valueForKey:(id)a3;
+ (int64_t)integerForKey:(id)a3;
+ (int64_t)integerForKey:(id)a3 useCache:(BOOL)a4;
+ (void)cacheObject:(id)a3 forKey:(id)a4;
+ (void)clearUserDefaultsCache;
+ (void)removeAllKeys;
+ (void)removeCachedObjectForKey:(id)a3;
+ (void)removeObjectForKey:(id)a3;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
+ (void)setValue:(id)a3 forKey:(id)a4;
+ (void)synchronize;
@end

@implementation SIUserDefaults

+ (id)defaultValues
{
  if (defaultValues_onceToken != -1) {
    dispatch_once(&defaultValues_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)defaultValues_defaultValues;
  return v2;
}

void __31__SIUserDefaults_defaultValues__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.sceneintelligence.useCacheForUserDefaults";
  v2[1] = @"com.apple.sceneintelligence.test.default";
  v3[0] = MEMORY[0x263EFFA88];
  v3[1] = @"test";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)defaultValues_defaultValues;
  defaultValues_defaultValues = v0;
}

+ (id)userDefaultsCache
{
  if (userDefaultsCache_onceToken != -1) {
    dispatch_once(&userDefaultsCache_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)userDefaultsCache_defaultsCache;
  return v2;
}

uint64_t __35__SIUserDefaults_userDefaultsCache__block_invoke()
{
  userDefaultsCache_defaultsCache = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (BOOL)shouldUseCache
{
  if (shouldUseCache_onceToken != -1) {
    dispatch_once(&shouldUseCache_onceToken, &__block_literal_global_24);
  }
  v2 = (void *)shouldUseCache_shouldUseCache;
  return [v2 BOOLValue];
}

uint64_t __32__SIUserDefaults_shouldUseCache__block_invoke()
{
  shouldUseCache_shouldUseCache = +[SIUserDefaults objectForKeySlow:@"com.apple.sceneintelligence.useCacheForUserDefaults"];
  return MEMORY[0x270F9A758]();
}

+ (id)cachedObjectForKey:(id)a3
{
  id v3 = a3;
  v4 = +[SIUserDefaults userDefaultsCache];
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  v5 = [v4 objectForKeyedSubscript:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
  return v5;
}

+ (void)removeCachedObjectForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[SIUserDefaults userDefaultsCache];
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  [v4 removeObjectForKey:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
}

+ (void)cacheObject:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  v6 = +[SIUserDefaults userDefaultsCache];
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  if (v8)
  {
    [v6 setObject:v8 forKeyedSubscript:v5];
  }
  else
  {
    v7 = [MEMORY[0x263EFF9D0] null];
    [v6 setObject:v7 forKeyedSubscript:v5];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
}

+ (void)clearUserDefaultsCache
{
  id v2 = +[SIUserDefaults userDefaultsCache];
  os_unfair_lock_lock((os_unfair_lock_t)&gDefaultsCacheLock);
  [v2 removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&gDefaultsCacheLock);
}

+ (void)removeAllKeys
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(MEMORY[0x263EFFA40], "appleGlobalDomainSIKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = [MEMORY[0x263EFFA40] appleGlobalDomain];
        [v8 removeObjectForKey:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

+ (void)removeObjectForKey:(id)a3
{
  id v3 = a3;
  +[SIUserDefaults removeCachedObjectForKey:v3];
  id v4 = [MEMORY[0x263EFFA40] appleGlobalDomain];
  [v4 removeObjectForKey:v3];
}

+ (id)objectForKeySlow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFFA40] appleGlobalDomain];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v7 = [a1 defaultValues];
    uint64_t v6 = [v7 objectForKeyedSubscript:v4];
  }
  return v6;
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() shouldUseCache]
    && (+[SIUserDefaults cachedObjectForKey:v3],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (id)v4;
    id v6 = [MEMORY[0x263EFF9D0] null];

    if (v5 == v6)
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v5 = v5;
      uint64_t v7 = v5;
    }
  }
  else
  {
    uint64_t v7 = +[SIUserDefaults objectForKeySlow:v3];
    +[SIUserDefaults cacheObject:v7 forKey:v3];
    id v5 = 0;
  }

  return v7;
}

+ (id)objectForKey:(id)a3 useCache:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_opt_class();
  if (v4) {
    [v6 objectForKey:v5];
  }
  else {
  uint64_t v7 = [v6 objectForKeySlow:v5];
  }

  return v7;
}

+ (id)valueForKey:(id)a3
{
  return +[SIUserDefaults objectForKey:a3];
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[SIUserDefaults removeCachedObjectForKey:v5];
  id v7 = [MEMORY[0x263EFFA40] appleGlobalDomain];
  [v7 setObject:v6 forKey:v5];
}

+ (void)setValue:(id)a3 forKey:(id)a4
{
}

+ (BOOL)BOOLForKey:(id)a3
{
  id v3 = +[SIUserDefaults objectForKey:a3];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)BOOLForKey:(id)a3 useCache:(BOOL)a4
{
  char v4 = +[SIUserDefaults objectForKey:a3 useCache:a4];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  char v5 = NSNumber;
  id v6 = a4;
  id v7 = [v5 numberWithBool:v4];
  +[SIUserDefaults setObject:v7 forKey:v6];
}

+ (id)stringForKey:(id)a3
{
  id v3 = +[SIUserDefaults objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    char v5 = v4;
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 stringValue];
    goto LABEL_5;
  }
  char v5 = 0;
LABEL_7:

  return v5;
}

+ (id)numberForKey:(id)a3
{
  id v3 = +[SIUserDefaults objectForKey:a3];
  id v4 = +[SIUserDefaults _numberForObject:v3];

  return v4;
}

+ (id)numberForKey:(id)a3 useCache:(BOOL)a4
{
  id v4 = +[SIUserDefaults objectForKey:a3 useCache:a4];
  char v5 = +[SIUserDefaults _numberForObject:v4];

  return v5;
}

+ (id)_numberForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = (void *)MEMORY[0x263F089C0];
      id v6 = v3;
      id v7 = [v5 decimalDigitCharacterSet];
      [v7 addCharactersInString:@"-."];
      id v8 = [v7 invertedSet];
      long long v9 = [v6 componentsSeparatedByCharactersInSet:v8];

      long long v10 = [v9 firstObject];

      id v11 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v11 setDecimalSeparator:@"."];
      [v11 setNumberStyle:1];
      id v4 = [v11 numberFromString:v10];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

+ (int64_t)integerForKey:(id)a3
{
  id v3 = +[SIUserDefaults numberForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

+ (int64_t)integerForKey:(id)a3 useCache:(BOOL)a4
{
  int64_t v4 = +[SIUserDefaults numberForKey:a3 useCache:a4];
  int64_t v5 = [v4 integerValue];

  return v5;
}

+ (float)floatForKey:(id)a3
{
  id v3 = +[SIUserDefaults numberForKey:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

+ (float)floatForKey:(id)a3 useCache:(BOOL)a4
{
  float v4 = +[SIUserDefaults numberForKey:a3 useCache:a4];
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

+ (double)doubleForKey:(id)a3
{
  id v3 = +[SIUserDefaults numberForKey:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

+ (double)doubleForKey:(id)a3 useCache:(BOOL)a4
{
  double v4 = +[SIUserDefaults numberForKey:a3 useCache:a4];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

+ (id)listForKey:(id)a3
{
  id v3 = +[SIUserDefaults objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 componentsSeparatedByString:@","];
  }
  else
  {
    double v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

+ (id)resolutionDictionaryForKey:(id)a3
{
  v19[2] = *MEMORY[0x263EF8340];
  id v3 = +[SIUserDefaults objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v4 = [v3 componentsSeparatedByString:@"x"];
    if ([v4 count] != 2)
    {
      id v11 = 0;
      goto LABEL_8;
    }
    v18[0] = @"width";
    double v5 = NSNumber;
    double v6 = [v4 objectAtIndexedSubscript:0];
    [v6 floatValue];
    id v7 = objc_msgSend(v5, "numberWithFloat:");
    v18[1] = @"height";
    v19[0] = v7;
    id v8 = NSNumber;
    long long v9 = [v4 objectAtIndexedSubscript:1];
    [v9 floatValue];
    long long v10 = objc_msgSend(v8, "numberWithFloat:");
    v19[1] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

LABEL_6:
LABEL_8:

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16[0] = @"width";
    long long v12 = NSNumber;
    id v13 = v3;
    double v4 = [v13 objectForKeyedSubscript:@"width"];
    [v4 floatValue];
    double v6 = objc_msgSend(v12, "numberWithFloat:");
    v16[1] = @"height";
    v17[0] = v6;
    uint64_t v14 = NSNumber;
    id v7 = objc_msgSend(v13, "objectForKeyedSubscript:");

    [v7 floatValue];
    long long v9 = objc_msgSend(v14, "numberWithFloat:");
    v17[1] = v9;
    id v11 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    goto LABEL_6;
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

+ (void)synchronize
{
  id v2 = [MEMORY[0x263EFFA40] appleGlobalDomain];
  [v2 synchronize];
}

@end