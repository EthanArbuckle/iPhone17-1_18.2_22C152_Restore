@interface NSSExternalAnalyticsPaneldentifierProvider
- (NSArray)hostNames;
- (NSSExternalAnalyticsPaneldentifierProvider)initWithHostNames:(id)a3;
- (NSString)panelIdentifier;
- (id)panelIdentifierWithHostNames:(id)a3;
@end

@implementation NSSExternalAnalyticsPaneldentifierProvider

- (NSSExternalAnalyticsPaneldentifierProvider)initWithHostNames:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSSExternalAnalyticsPaneldentifierProvider;
  v5 = [(NSSExternalAnalyticsPaneldentifierProvider *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    hostNames = v5->_hostNames;
    v5->_hostNames = (NSArray *)v6;

    uint64_t v8 = [(NSSExternalAnalyticsPaneldentifierProvider *)v5 panelIdentifierWithHostNames:v4];
    panelIdentifier = v5->_panelIdentifier;
    v5->_panelIdentifier = (NSString *)v8;
  }
  return v5;
}

- (id)panelIdentifierWithHostNames:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __75__NSSExternalAnalyticsPaneldentifierProvider_panelIdentifierWithHostNames___block_invoke;
  v32[3] = &unk_1E6D3F9A8;
  id v4 = v3;
  id v33 = v4;
  v5 = (uint64_t (**)(void, void))MEMORY[0x1E01F0A60](v32);
  CFDictionaryRef v6 = CFNetworkCopySystemProxySettings();
  v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"ProxyAutoConfigEnable"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    v9 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"ProxyAutoConfigURLString"];
    v10 = (void *)[v9 copy];
  }
  else
  {
    v9 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"HTTPProxy"];
    objc_super v11 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"HTTPPort"];
    v12 = [v11 stringValue];

    if ([v9 length] && objc_msgSend(v12, "length"))
    {
      v10 = [NSString stringWithFormat:@"%@:%@", v9, v12];
    }
    else
    {
      v10 = 0;
    }
  }
  if (((uint64_t (**)(void, void *))v5)[2](v5, v10))
  {
    if (v10) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  [(__CFDictionary *)v6 objectForKeyedSubscript:@"__SCOPED__"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (!v14)
  {
    v10 = 0;
    goto LABEL_33;
  }
  uint64_t v15 = v14;
  CFDictionaryRef v26 = v6;
  id v27 = v4;
  uint64_t v16 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v29 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if ([v18 hasPrefix:@"pdp"])
      {
        v19 = [v13 objectForKeyedSubscript:v18];
        v20 = [v19 objectForKeyedSubscript:@"HTTPProxy"];

        v21 = [v13 objectForKeyedSubscript:v18];
        v22 = [v21 objectForKeyedSubscript:@"HTTPPort"];
        v23 = [v22 stringValue];

        if ([v20 length]
          && [v23 length]
          && (((uint64_t (**)(void, void *))v5)[2](v5, v20) & 1) != 0)
        {
          v10 = [NSString stringWithFormat:@"%@:%@", v20, v23];

          goto LABEL_31;
        }
      }
      else
      {
        if (![v18 hasPrefix:@"en"]) {
          continue;
        }
        v24 = [v13 objectForKeyedSubscript:v18];
        v20 = [v24 objectForKeyedSubscript:@"ProxyAutoConfigURLString"];

        if (((uint64_t (**)(void, void *))v5)[2](v5, v20))
        {
          v10 = (void *)[v20 copy];
LABEL_31:

          goto LABEL_32;
        }
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v15) {
      continue;
    }
    break;
  }
  v10 = 0;
LABEL_32:
  CFDictionaryRef v6 = v26;
  id v4 = v27;
LABEL_33:

LABEL_34:
  return v10;
}

uint64_t __75__NSSExternalAnalyticsPaneldentifierProvider_panelIdentifierWithHostNames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(v3, "containsString:", *(void *)(*((void *)&v9 + 1) + 8 * i), (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (NSString)panelIdentifier
{
  return self->_panelIdentifier;
}

- (NSArray)hostNames
{
  return self->_hostNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostNames, 0);
  objc_storeStrong((id *)&self->_panelIdentifier, 0);
}

@end