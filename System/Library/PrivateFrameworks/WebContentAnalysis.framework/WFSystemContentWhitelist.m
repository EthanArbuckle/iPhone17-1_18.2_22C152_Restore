@interface WFSystemContentWhitelist
+ (id)defaultSystemWhitelist;
+ (id)newWhitelistItemFromPlistEntry:(id)a3;
- (BOOL)isURLWhitelisted:(id)a3;
- (WFSystemContentWhitelist)initWithWhitelistURL:(id)a3;
- (void)dealloc;
@end

@implementation WFSystemContentWhitelist

+ (id)newWhitelistItemFromPlistEntry:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"WFSystemContentWhitelistDomainGlob"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v4 = [WFSystemContentWhitelistItem alloc];
  return [(WFSystemContentWhitelistItem *)v4 initWithDomainGlob:v3];
}

+ (id)defaultSystemWhitelist
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__WFSystemContentWhitelist_defaultSystemWhitelist__block_invoke;
  block[3] = &unk_26429C860;
  block[4] = a1;
  if (defaultSystemWhitelist_onceToken != -1) {
    dispatch_once(&defaultSystemWhitelist_onceToken, block);
  }
  return (id)defaultSystemWhitelist_defaultWhitelist;
}

WFSystemContentWhitelist *__50__WFSystemContentWhitelist_defaultSystemWhitelist__block_invoke(uint64_t a1)
{
  result = -[WFSystemContentWhitelist initWithWhitelistURL:]([WFSystemContentWhitelist alloc], "initWithWhitelistURL:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", *(void *)(a1 + 32)), "URLForResource:withExtension:", @"SystemContentWhitelist", @"plist"));
  defaultSystemWhitelist_defaultWhitelist = (uint64_t)result;
  return result;
}

- (WFSystemContentWhitelist)initWithWhitelistURL:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)WFSystemContentWhitelist;
  v4 = [(WFSystemContentWhitelist *)&v24 init];
  if (v4)
  {
    uint64_t v23 = 0;
    uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:0 error:&v23];
    if (v5
      && (uint64_t v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:0 format:0 error:&v23]) != 0)
    {
      v7 = (void *)v6;
      v8 = (NSArray *)objc_opt_new();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 valueForKey:@"WFSystemContentWhitelistItems"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          v9 = objc_msgSend(v7, "valueForKey:", @"WFSystemContentWhitelistItems", 0);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v20;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v20 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v15 = +[WFSystemContentWhitelist newWhitelistItemFromPlistEntry:v14];
                  if (v15)
                  {
                    v16 = v15;
                    [(NSArray *)v8 addObject:v15];
                  }
                }
                ++v13;
              }
              while (v11 != v13);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v25 count:16];
            }
            while (v11);
          }
        }
      }
      v4->_whitelistItems = v8;
    }
    else
    {
      v17 = __WFDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        [(WFSystemContentWhitelist *)(uint64_t)a3 initWithWhitelistURL:v17];
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFSystemContentWhitelist;
  [(WFSystemContentWhitelist *)&v3 dealloc];
}

- (BOOL)isURLWhitelisted:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  whitelistItems = self->_whitelistItems;
  uint64_t v5 = [(NSArray *)whitelistItems countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(whitelistItems);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v8) matchesURL:a3])
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [(NSArray *)whitelistItems countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (void)initWithWhitelistURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "Couldn't read plist from url %@: %@", (uint8_t *)&v4, 0x16u);
}

@end