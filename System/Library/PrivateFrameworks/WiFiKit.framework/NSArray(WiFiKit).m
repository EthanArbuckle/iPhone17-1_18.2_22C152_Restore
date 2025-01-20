@interface NSArray(WiFiKit)
- (__CFString)numberArrayToJsonString;
- (id)_matchingItem:()WiFiKit;
- (id)awdlDiagnosticsResults;
- (id)btDiagnosticsResults;
- (id)congestionDiagnosticsResults;
- (id)displayableHealthRecommendations;
- (id)noInternetDiagnosticsResults;
- (uint64_t)dnsSettings;
- (uint64_t)ipv4Settings;
- (uint64_t)ipv6Settings;
- (uint64_t)proxySettings;
@end

@implementation NSArray(WiFiKit)

- (id)_matchingItem:()WiFiKit
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;

          v4 = v8;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)ipv4Settings
{
  uint64_t v2 = objc_opt_class();
  return [a1 _matchingItem:v2];
}

- (uint64_t)ipv6Settings
{
  uint64_t v2 = objc_opt_class();
  return [a1 _matchingItem:v2];
}

- (uint64_t)dnsSettings
{
  uint64_t v2 = objc_opt_class();
  return [a1 _matchingItem:v2];
}

- (uint64_t)proxySettings
{
  uint64_t v2 = objc_opt_class();
  return [a1 _matchingItem:v2];
}

- (id)btDiagnosticsResults
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "testID", (void)v10) == 19
          || [v8 testID] == 18
          || [v8 testID] == 20)
        {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)awdlDiagnosticsResults
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "testID", (void)v10) == 21 || objc_msgSend(v8, "testID") == 22) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)congestionDiagnosticsResults
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "testID", (void)v10) == 23
          || [v8 testID] == 24
          || [v8 testID] == 25
          || [v8 testID] == 26)
        {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)noInternetDiagnosticsResults
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "testID", (void)v10) == 9 || objc_msgSend(v8, "testID") == 11) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)displayableHealthRecommendations
{
  id v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"subtitleOnlyIssue == NO"];
  id v3 = [a1 filteredArrayUsingPredicate:v2];

  return v3;
}

- (__CFString)numberArrayToJsonString
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([a1 count])
  {
    id v2 = [MEMORY[0x263EFF980] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = a1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = [*(id *)(*((void *)&v14 + 1) + 8 * i) stringValue];
          if (v8) {
            [v2 addObject:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }

    uint64_t v13 = 0;
    v9 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:&v13];
    if (v9) {
      long long v10 = (__CFString *)[[NSString alloc] initWithData:v9 encoding:4];
    }
    else {
      long long v10 = &stru_26D9BFD58;
    }
    long long v11 = v10;
  }
  else
  {
    long long v11 = &stru_26D9BFD58;
  }

  return v11;
}

@end