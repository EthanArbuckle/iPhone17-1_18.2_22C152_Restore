@interface ACMBaseLocale
+ (id)createLocaleForIdentifier:(id)a3;
+ (id)localizedString:(id)a3;
+ (id)sharedInstance;
+ (void)initialize;
+ (void)setupRecoveringPreferredLanguages;
+ (void)setupUsingPreferredLanguages;
- (ACMBaseLocale)nextLocale;
- (NSDictionary)localeStrings;
- (id)objectForKey:(id)a3;
- (void)dealloc;
- (void)setLocaleStrings:(id)a3;
- (void)setNextLocale:(id)a3;
@end

@implementation ACMBaseLocale

+ (void)initialize
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___ACMBaseLocale;
  [super initialize];
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  if ([(NSString *)v3 hasPrefix:@"ACMLocale_"])
  {
    v4 = [(NSString *)v3 stringByReplacingOccurrencesOfString:@"ACMLocale_" withString:&stru_26F261788];
    v5 = [(NSString *)v4 componentsSeparatedByString:@"_"];
    if ([(NSArray *)v5 count] >= 3) {
      v4 = -[NSString stringByAppendingString:](-[NSArray componentsJoinedByString:](-[NSArray subarrayWithRange:](v5, "subarrayWithRange:", 0, [(NSArray *)v5 count] - 1), "componentsJoinedByString:", @"-"), "stringByAppendingString:", [(NSArray *)v5 lastObject]);
    }
    if (!s_Locales) {
      s_Locales = objc_opt_new();
    }
    v6 = (void *)[MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
    uint64_t v7 = *MEMORY[0x263EFF500];
    v8 = (void *)[v6 objectForKey:*MEMORY[0x263EFF500]];
    if ([(id)s_Locales objectForKeyedSubscript:v8])
    {
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
          ACFLog(3, (uint64_t)"+[ACMBaseLocale initialize]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMBaseLocale.m", 49, 0, "Duplicate: %@ : %@", v4, [v6 objectForKey:v7]);
        }
      }
    }
    else
    {
      uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
      [(id)s_Locales setObject:objc_opt_class() forKeyedSubscript:v9];
    }
  }
}

+ (id)createLocaleForIdentifier:(id)a3
{
  uint64_t v3 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
  v4 = [[s_Locales objectForKeyedSubscript:v3] new];

  return v4;
}

+ (void)setupRecoveringPreferredLanguages
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] mainBundle preferredLocalizations];
  v31 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v2;
  uint64_t v30 = [v2 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v30)
  {
    uint64_t v3 = 0;
    uint64_t v27 = *MEMORY[0x263EFF540];
    uint64_t v28 = *(void *)v33;
    uint64_t v4 = *MEMORY[0x263EFF508];
    uint64_t v5 = *MEMORY[0x263EFF4D0];
    unint64_t v6 = 0x263EFF000uLL;
    uint64_t v26 = *MEMORY[0x263EFF4D0];
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(obj);
        }
        id v8 = (id)[objc_alloc(*(Class *)(v6 + 2400)) initWithLocaleIdentifier:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        uint64_t v9 = [v8 objectForKey:v27];
        objc_super v10 = (__CFString *)[v8 objectForKey:v4];
        if (v9) {
          objc_super v10 = (__CFString *)[NSString stringWithFormat:@"%@-%@", v10, v9, 0];
        }
        if ([(__CFString *)v10 isEqualToString:@"zh"]) {
          v11 = @"zh-Hant";
        }
        else {
          v11 = v10;
        }
        v12 = [[(id)objc_msgSend(*(id *)(v6 + 2400), "currentLocale") objectForKey:v5];
        if ([v12 length])
        {
          v38[0] = v5;
          v38[1] = v4;
          v39[0] = v12;
          v39[1] = v11;
          v13 = NSDictionary;
          v14 = (__CFString **)v39;
          v15 = v38;
          uint64_t v16 = 2;
        }
        else
        {
          uint64_t v36 = v4;
          v37 = v11;
          v13 = NSDictionary;
          v14 = &v37;
          v15 = &v36;
          uint64_t v16 = 1;
        }
        unint64_t v17 = v6;
        uint64_t v18 = [[*(id *)(v6 + 2400) localeIdentifierFromComponents:[v13 dictionaryWithObjects:v14, v15, v16, count:3]];
        v19 = (void *)[a1 createLocaleForIdentifier:v18];
        uint64_t v20 = [a1 createLocaleForIdentifier:v11];
        v21 = (void *)v20;
        if (!v19)
        {
          if (!v20)
          {
            unint64_t v6 = v17;
            continue;
          }
          char v24 = [v31 containsObject:v11];
LABEL_22:
          unint64_t v6 = v17;
          if (v24) {
            goto LABEL_23;
          }
          goto LABEL_25;
        }
        char v22 = [v31 containsObject:v18];
        char v23 = v22;
        if (!v21)
        {
          v11 = (__CFString *)v18;
          v21 = v19;
          unint64_t v6 = v17;
          if (v22)
          {
LABEL_23:
            uint64_t v5 = v26;
            continue;
          }
          goto LABEL_25;
        }
        char v24 = [v31 containsObject:v11];
        if (v23) {
          goto LABEL_22;
        }
        if ((v24 & 1) == 0)
        {
          [v19 setNextLocale:v21];
          [v31 addObject:v11];
        }
        v11 = (__CFString *)v18;
        v21 = v19;
        unint64_t v6 = v17;
LABEL_25:
        [v31 addObject:v11];
        if (v3) {
          [v3 setNextLocale:v21];
        }
        uint64_t v3 = v21;
        if ([v21 nextLocale])
        {
          uint64_t v3 = v21;
          do
            uint64_t v3 = (void *)[v3 nextLocale];
          while ([v3 nextLocale]);
        }
        uint64_t v5 = v26;
        if (!s_sharedInstance) {
          s_sharedInstance = v21;
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v30);
  }
}

+ (void)setupUsingPreferredLanguages
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [[(id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle") preferredLocalizations];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(__CFString **)(*((void *)&v13 + 1) + 8 * i);
        if ([(__CFString *)v9 isEqualToString:@"zh"]) {
          objc_super v10 = @"zh-Hant";
        }
        else {
          objc_super v10 = v9;
        }
        uint64_t v11 = [a1 createLocaleForIdentifier:v10];
        if (v11)
        {
          v12 = (void *)v11;
          if (v6) {
            [v6 setNextLocale:v11];
          }
          if (!s_sharedInstance) {
            s_sharedInstance = v12;
          }
          unint64_t v6 = v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

+ (id)sharedInstance
{
  if (!s_sharedInstance)
  {
    if ([[[[[[[[[MEMORY[0x263F1C5C0], "currentDevice"], "systemVersion"], "componentsSeparatedByString:", @"."], "objectEnumerator"], "nextObject"], "integerValue"] < 8] setupRecoveringPreferredLanguages]; {
    else
    }
      [a1 setupUsingPreferredLanguages];
    if (!s_sharedInstance) {
      s_sharedInstance = objc_opt_new();
    }
  }
  objc_sync_exit(a1);
  return (id)s_sharedInstance;
}

- (void)dealloc
{
  [(ACMBaseLocale *)self setNextLocale:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMBaseLocale;
  [(ACMBaseLocale *)&v3 dealloc];
}

- (id)objectForKey:(id)a3
{
  id result = [(NSDictionary *)[(ACMBaseLocale *)self localeStrings] objectForKey:a3];
  if (!result)
  {
    if ([(ACMBaseLocale *)self nextLocale])
    {
      unint64_t v6 = [(ACMBaseLocale *)self nextLocale];
      return [(ACMBaseLocale *)v6 objectForKey:a3];
    }
    else
    {
      return a3;
    }
  }
  return result;
}

+ (id)localizedString:(id)a3
{
  id result = [(id)[(id)[a1 sharedInstance] objectForKey:a3];
  if (!result) {
    return a3;
  }
  return result;
}

- (ACMBaseLocale)nextLocale
{
  return self->_nextLocale;
}

- (void)setNextLocale:(id)a3
{
}

- (NSDictionary)localeStrings
{
  return self->_localeStrings;
}

- (void)setLocaleStrings:(id)a3
{
}

@end