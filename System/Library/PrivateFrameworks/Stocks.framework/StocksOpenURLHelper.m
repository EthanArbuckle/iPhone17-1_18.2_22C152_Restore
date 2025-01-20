@interface StocksOpenURLHelper
+ (id)URLForStockComponents:(id)a3;
+ (id)componentDictionaryFromURL:(id)a3;
@end

@implementation StocksOpenURLHelper

+ (id)URLForStockComponents:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  v3 = [a3 objectForKeyedSubscript:@"symbol"];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08BA0]);
    [v4 setScheme:@"stocks"];
    v5 = [MEMORY[0x263F08BD0] queryItemWithName:@"symbol" value:v3];
    v9[0] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [v4 setQueryItems:v6];

    v7 = [v4 URL];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)componentDictionaryFromURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = objc_msgSend(v3, "queryItems", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 value];
        v12 = [v10 name];
        objc_msgSend(v4, "na_safeSetObject:forKey:", v11, v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end