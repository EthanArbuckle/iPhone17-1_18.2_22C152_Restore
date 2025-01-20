@interface SPUIHomeScreenIconUtility
+ (void)addMenusToBuilder:(id)a3 forFocusEnvironment:(id)a4;
@end

@implementation SPUIHomeScreenIconUtility

+ (void)addMenusToBuilder:(id)a3 forFocusEnvironment:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 system];
  v6 = [MEMORY[0x263F82970] mainSystem];

  if (v5 == v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v7 = objc_msgSend(MEMORY[0x263F792B0], "applicationIconMultitaskingMenus", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      uint64_t v11 = *MEMORY[0x263F83890];
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [v4 insertChildMenu:*(void *)(*((void *)&v13 + 1) + 8 * v12++) atEndOfMenuForIdentifier:v11];
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

@end