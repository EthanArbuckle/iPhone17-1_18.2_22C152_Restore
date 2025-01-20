@interface SUScriptDictionary
+ (BOOL)isKeyExcludedFromWebScript:(const char *)a3;
+ (BOOL)isSelectorExcludedFromWebScript:(SEL)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSDictionary)dictionary;
- (SUScriptDictionary)init;
- (SUScriptDictionary)initWithDictionary:(id)a3;
- (id)attributeKeys;
- (id)stringRepresentation;
- (id)valueForNotNativelySupportedKey:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation SUScriptDictionary

- (SUScriptDictionary)init
{
  return [(SUScriptDictionary *)self initWithDictionary:0];
}

- (SUScriptDictionary)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUScriptDictionary;
  v5 = [(SUScriptDictionary *)&v25 init];
  if (v5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.iTunesStoreUI.SUScriptDictionary-%p", v5);
    id v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v9;

    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v12 = v5->_dictionary;
    uint64_t v13 = [(NSDictionary *)v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v11 addObject:v17];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSDictionary *)v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v14);
    }

    uint64_t v18 = [v11 copy];
    stringKeys = v5->_stringKeys;
    v5->_stringKeys = (NSArray *)v18;
  }
  return v5;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v4 = (void *)MEMORY[0x263F1FA90];
  id v5 = [NSString stringWithFormat:@"%@ is readonly", a4];
  [v4 throwException:v5];
}

- (id)valueForNotNativelySupportedKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__33;
  uint64_t v16 = __Block_byref_object_dispose__33;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SUScriptDictionary_valueForNotNativelySupportedKey___block_invoke;
  block[3] = &unk_264813E60;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__SUScriptDictionary_valueForNotNativelySupportedKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v5 = [*(id *)(a1[4] + 32) objectForKey:a1[5]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = *(id *)(*(void *)(a1[6] + 8) + 40);
      v8 = [[SUScriptDictionary alloc] initWithDictionary:v15];
      uint64_t v9 = *(void **)(a1[4] + 24);
      if (!v9)
      {
        id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v11 = a1[4];
        uint64_t v12 = *(void **)(v11 + 24);
        *(void *)(v11 + 24) = v10;

        uint64_t v9 = *(void **)(a1[4] + 24);
      }
      [v9 setObject:v8 forKey:a1[5]];
      uint64_t v13 = *(void *)(a1[6] + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v8;
    }
  }
}

- (id)stringRepresentation
{
  dictionary = self->_dictionary;
  if (dictionary)
  {
    uint64_t v3 = [MEMORY[0x263F08900] dataWithJSONObject:dictionary options:1 error:0];
    if (v3) {
      id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)a3
{
  return 0;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)a3
{
  uint64_t v3 = [a1 webScriptNameForSelector:a3];
  BOOL v4 = v3 == 0;

  return v4;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  return (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_36, 2);
}

- (id)attributeKeys
{
  return self->_stringKeys;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_36 = (uint64_t)sel_stringRepresentation;
    *(void *)algn_2681B5208 = @"toString";
    qword_2681B5210 = (uint64_t)sel_valueForNotNativelySupportedKey_;
    unk_2681B5218 = @"get";
  }
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_cachedNestedScriptDictionaries, 0);
  objc_storeStrong((id *)&self->_stringKeys, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end