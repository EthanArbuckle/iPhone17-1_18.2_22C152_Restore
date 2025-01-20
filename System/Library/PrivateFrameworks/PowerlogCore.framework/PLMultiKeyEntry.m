@interface PLMultiKeyEntry
+ (void)load;
- (NSMutableDictionary)multiKeys;
- (PLMultiKeyEntry)init;
- (id)keysForSubKey:(id)a3 ofSubKeyType:(id)a4;
- (id)objectsForSubKey:(id)a3 ofSubKeyType:(id)a4;
- (id)serializedForJSON;
- (void)setMultiKeys:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation PLMultiKeyEntry

- (PLMultiKeyEntry)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLMultiKeyEntry;
  v2 = [(PLEntry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    multiKeys = v2->_multiKeys;
    v2->_multiKeys = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PLMultiKeyEntry;
  [(PLEntry *)&v10 setObject:a3 forKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__PLMultiKeyEntry_setObject_forKey___block_invoke;
    v8[3] = &unk_1E6254330;
    v8[4] = self;
    id v9 = v7;
    [v7 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __36__PLMultiKeyEntry_setObject_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) multiKeys];
  id v7 = [v6 objectForKeyedSubscript:v19];

  if (!v7)
  {
    v8 = objc_opt_new();
    id v9 = [*(id *)(a1 + 32) multiKeys];
    [v9 setObject:v8 forKeyedSubscript:v19];
  }
  objc_super v10 = [*(id *)(a1 + 32) multiKeys];
  v11 = [v10 objectForKeyedSubscript:v19];
  v12 = [v11 objectForKeyedSubscript:v5];

  if (!v12)
  {
    v13 = objc_opt_new();
    v14 = [*(id *)(a1 + 32) multiKeys];
    v15 = [v14 objectForKeyedSubscript:v19];
    [v15 setObject:v13 forKeyedSubscript:v5];
  }
  v16 = [*(id *)(a1 + 32) multiKeys];
  v17 = [v16 objectForKeyedSubscript:v19];
  v18 = [v17 objectForKeyedSubscript:v5];
  [v18 addObject:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)multiKeys
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLMultiKeyEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)keysForSubKey:(id)a3 ofSubKeyType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PLMultiKeyEntry *)self multiKeys];
  id v9 = [v8 objectForKeyedSubscript:v6];

  objc_super v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

- (id)objectsForSubKey:(id)a3 ofSubKeyType:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = [(PLMultiKeyEntry *)self keysForSubKey:a3 ofSubKeyType:a4];
  id v6 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = -[PLEntry objectForKey:](self, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)serializedForJSON
{
  uint64_t v3 = objc_opt_new();
  v4 = [(PLEntry *)self dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__PLMultiKeyEntry_serializedForJSON__block_invoke;
  v10[3] = &unk_1E62540E8;
  id v5 = v3;
  id v11 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  id v6 = NSNumber;
  id v7 = [(PLEntry *)self entryDate];
  [v7 timeIntervalSince1970];
  uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setObject:v8 forKeyedSubscript:@"timestamp"];

  return v5;
}

void __36__PLMultiKeyEntry_serializedForJSON__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v11 allValues];
    id v7 = [v6 componentsJoinedByString:@"__"];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v11;
    }
    else
    {
      id v8 = [v11 description];
    }
    id v7 = v8;
  }
  if (([v5 isNil] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = NSNumber;
      [v5 timeIntervalSince1970];
      uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
      [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v7];
    }
    else
    {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
    }
  }
}

- (void)setMultiKeys:(id)a3
{
}

@end