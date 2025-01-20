@interface SSLookupResponse
- (NSArray)allItems;
- (NSDate)expirationDate;
- (NSDictionary)responseDictionary;
- (SSLookupResponse)initWithLocationResponseDictionary:(id)a3;
- (SSLookupResponse)initWithResponseDictionary:(id)a3;
- (SSLookupResponse)initWithXPCEncoding:(id)a3;
- (SSMetricsConfiguration)metricsConfiguration;
- (SSMetricsPageEvent)metricsPageEvent;
- (id)appStoreURLWithReason:(int64_t)a3 initialIndex:(int64_t)a4;
- (id)copyXPCEncoding;
- (id)itemForKey:(id)a3;
- (id)valueForProperty:(id)a3;
- (void)_enumerateItemsWithBlock:(id)a3;
- (void)_setMetricsPageEvent:(id)a3;
- (void)dealloc;
- (void)setExpirationDate:(id)a3;
@end

@implementation SSLookupResponse

- (SSLookupResponse)initWithLocationResponseDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    return 0;
  }
  v32.receiver = self;
  v32.super_class = (Class)SSLookupResponse;
  v26 = [(SSLookupResponse *)&v32 init];
  if (!v26) {
    return 0;
  }
  v5 = (void *)[a3 objectForKey:@"storePlatformData"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((uint64_t v6 = [a3 objectForKey:@"storePlatformPrewarmDataKey"],
         objc_opt_class(),
         (objc_opt_isKindOfClass() & 1) == 0)
      ? (v7 = @"lockup-search")
      : (v7 = (__CFString *)v6),
        v8 = (void *)[v5 objectForKey:v7],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    v24 = (void *)[v8 mutableCopy];
    v25 = objc_msgSend((id)objc_msgSend(v24, "objectForKey:", @"results"), "mutableCopy");
  }
  else
  {
    v24 = 0;
    v25 = 0;
  }
  v9 = (void *)[a3 objectForKey:@"results"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26->_itemOrder = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      v13 = @"id";
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = (void *)[v15 objectForKey:v13];
            if (objc_opt_respondsToSelector())
            {
              v17 = v13;
              v18 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", objc_msgSend(v16, "longLongValue"));
              v19 = (void *)[v15 objectForKey:@"poiBased"];
              if (objc_opt_respondsToSelector())
              {
                if ([v19 BOOLValue])
                {
                  v20 = objc_msgSend((id)objc_msgSend(v25, "objectForKey:", v18), "mutableCopy");
                  if (v20)
                  {
                    v21 = v20;
                    [v20 setObject:v19 forKey:@"poiBased"];
                    [v25 setObject:v21 forKey:v18];
                  }
                }
              }
              [(NSMutableArray *)v26->_itemOrder addObject:v18];

              v13 = v17;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v11);
    }
  }
  if (v25)
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"results", @"storePlatformData", @"storePlatformPrewarmDataKey", 0);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __55__SSLookupResponse_initWithLocationResponseDictionary___block_invoke;
    v27[3] = &unk_1E5BAC2E0;
    v27[4] = v22;
    v27[5] = v24;
    [a3 enumerateKeysAndObjectsUsingBlock:v27];
    [v24 setObject:v25 forKey:@"results"];
  }
  v26->_response = (NSDictionary *)[v24 copy];

  return v26;
}

uint64_t __55__SSLookupResponse_initWithLocationResponseDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if ((result & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    return [v7 setObject:a3 forKey:a2];
  }
  return result;
}

- (SSLookupResponse)initWithResponseDictionary:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)SSLookupResponse;
    v5 = [(SSLookupResponse *)&v7 init];
    if (v5) {
      v5->_response = (NSDictionary *)[a3 copy];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSLookupResponse;
  [(SSLookupResponse *)&v3 dealloc];
}

- (NSArray)allItems
{
  objc_super v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__SSLookupResponse_allItems__block_invoke;
  v5[3] = &unk_1E5BAC308;
  v5[4] = v3;
  [(SSLookupResponse *)self _enumerateItemsWithBlock:v5];
  return v3;
}

uint64_t __28__SSLookupResponse_allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)appStoreURLWithReason:(int64_t)a3 initialIndex:(int64_t)a4
{
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"itms-apps2://?action=lookup&i=%ld&r=%ld", a4, a3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SSLookupResponse_appStoreURLWithReason_initialIndex___block_invoke;
  v8[3] = &unk_1E5BAC308;
  v8[4] = v5;
  [(SSLookupResponse *)self _enumerateItemsWithBlock:v8];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:v5];

  return v6;
}

uint64_t __55__SSLookupResponse_appStoreURLWithReason_initialIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = objc_msgSend((id)objc_msgSend(a2, "ITunesStoreIdentifier"), "stringValue");
  uint64_t result = [v5 length];
  if (result)
  {
    if (a3) {
      objc_super v7 = @",";
    }
    else {
      objc_super v7 = @"&ids=";
    }
    [*(id *)(a1 + 32) appendString:v7];
    v8 = *(void **)(a1 + 32);
    return [v8 appendString:v5];
  }
  return result;
}

- (id)itemForKey:(id)a3
{
  id v4 = [(NSDictionary *)self->_response objectForKey:@"results"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v5 = [v4 objectForKey:a3], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [[SSLookupItem alloc] initWithLookupDictionary:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (SSMetricsConfiguration)metricsConfiguration
{
  v2 = [[SSMetricsConfiguration alloc] initWithGlobalConfiguration:self->_response];
  return v2;
}

- (id)valueForProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_response objectForKey:a3];
  return v3;
}

- (NSDictionary)responseDictionary
{
  v2 = self->_response;
  return v2;
}

- (void)_enumerateItemsWithBlock:(id)a3
{
  id v5 = [(NSDictionary *)self->_response objectForKey:@"results"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(NSMutableArray *)self->_itemOrder count])
    {
      itemOrder = self->_itemOrder;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __45__SSLookupResponse__enumerateItemsWithBlock___block_invoke;
      v9[3] = &unk_1E5BAC338;
      v9[4] = v5;
      v9[5] = a3;
      [(NSMutableArray *)itemOrder enumerateObjectsUsingBlock:v9];
    }
    else
    {
      v8[0] = 0;
      v8[1] = v8;
      v8[2] = 0x2020000000;
      v8[3] = 0;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __45__SSLookupResponse__enumerateItemsWithBlock___block_invoke_2;
      v7[3] = &unk_1E5BAC360;
      v7[4] = a3;
      v7[5] = v8;
      [v5 enumerateKeysAndObjectsUsingBlock:v7];
      _Block_object_dispose(v8, 8);
    }
  }
}

void __45__SSLookupResponse__enumerateItemsWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [[SSLookupItem alloc] initWithLookupDictionary:v3];
    if (v4)
    {
      id v5 = v4;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __45__SSLookupResponse__enumerateItemsWithBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[SSLookupItem alloc] initWithLookupDictionary:a3];
    if (v5)
    {
      uint64_t v6 = v5;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_expirationDate);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_itemOrder);
  SSXPCDictionarySetCFObject(v3, "3", (__CFString *)[(SSMetricsMutableEvent *)self->_metricsPageEvent bodyDictionary]);
  SSXPCDictionarySetCFObject(v3, "2", (__CFString *)self->_response);
  return v3;
}

- (SSLookupResponse)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v12.receiver = self;
    v12.super_class = (Class)SSLookupResponse;
    id v5 = [(SSLookupResponse *)&v12 init];
    if (v5)
    {
      objc_opt_class();
      v5->_expirationDate = (NSDate *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      v5->_response = (NSDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      xpc_object_t value = xpc_dictionary_get_value(a3, "1");
      if (value)
      {
        v8 = value;
        if (MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14568])
        {
          v5->_itemOrder = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          applier[0] = MEMORY[0x1E4F143A8];
          applier[1] = 3221225472;
          applier[2] = __40__SSLookupResponse_initWithXPCEncoding___block_invoke;
          applier[3] = &unk_1E5BA86F8;
          applier[4] = v5;
          xpc_array_apply(v8, applier);
        }
      }
      objc_opt_class();
      CFArrayRef v9 = SSXPCDictionaryCopyCFObjectWithClass(a3, "3");
      if (v9)
      {
        CFArrayRef v10 = v9;
        v5->_metricsPageEvent = [(SSMetricsMutableEvent *)[SSMetricsPageEvent alloc] initWithBodyDictionary:v9];
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

uint64_t __40__SSLookupResponse_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  if (MEMORY[0x1A62689E0](a3) == MEMORY[0x1E4F145F0])
  {
    CFArrayRef v5 = SSXPCCreateCFObjectFromXPCObject(a3);
    [*(id *)(*(void *)(a1 + 32) + 16) addObject:v5];
  }
  return 1;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (SSMetricsPageEvent)metricsPageEvent
{
  return self->_metricsPageEvent;
}

- (void)_setMetricsPageEvent:(id)a3
{
}

@end