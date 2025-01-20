@interface STUIStatusBarTestData
+ (id)dependentDataKeyForDisplayItemIdentifier:(id)a3;
+ (id)dependentDataKeyForItemIdentifier:(id)a3;
+ (id)emptyTestData;
+ (id)fullTestData;
+ (id)testDataWithUpdatedKeys:(id)a3 enabledKeys:(id)a4;
- (BOOL)isEmpty;
- (NSMutableDictionary)testEntries;
- (NSSet)enabledKeys;
- (NSSet)updatedKeys;
- (STUIStatusBarTestData)init;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)existingEntryKeys;
- (id)valueForKey:(id)a3;
- (void)applyUpdate:(id)a3;
- (void)setDataEntry:(id)a3 forKey:(id)a4;
- (void)setEnabledKeys:(id)a3;
- (void)setTestEntries:(id)a3;
- (void)setUpdatedKeys:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation STUIStatusBarTestData

+ (id)testDataWithUpdatedKeys:(id)a3 enabledKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (v6)
  {
    v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    [v9 setUpdatedKeys:v10];

    if (v7)
    {
LABEL_3:
      v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
      [v9 setEnabledKeys:v11];

      goto LABEL_6;
    }
  }
  else
  {
    [v8 setUpdatedKeys:0];
    if (v7) {
      goto LABEL_3;
    }
  }
  [v9 setEnabledKeys:0];
LABEL_6:

  return v9;
}

+ (id)fullTestData
{
  return (id)[a1 testDataWithUpdatedKeys:0 enabledKeys:0];
}

+ (id)emptyTestData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)dependentDataKeyForItemIdentifier:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = NSStringFromClass((Class)[v4 object]);
  id v6 = [v4 string];

  id v7 = [v3 stringWithFormat:@"%@/%@", v5, v6];

  return v7;
}

+ (id)dependentDataKeyForDisplayItemIdentifier:(id)a3
{
  id v4 = +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:a3];
  v5 = [a1 dependentDataKeyForItemIdentifier:v4];

  return v5;
}

- (STUIStatusBarTestData)init
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarTestData;
  id v2 = [(STUIStatusBarTestData *)&v7 init];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(STUIStatusBarTestData *)v2 setTestEntries:v3];

  id v4 = [MEMORY[0x1E4F1CAD0] set];
  [(STUIStatusBarTestData *)v2 setUpdatedKeys:v4];

  v5 = [MEMORY[0x1E4F1CAD0] set];
  [(STUIStatusBarTestData *)v2 setEnabledKeys:v5];

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarTestData;
  id v4 = [(STStatusBarData *)&v9 copyWithZone:a3];
  v5 = (void *)[(NSSet *)self->_updatedKeys copy];
  [v4 setUpdatedKeys:v5];

  id v6 = (void *)[(NSSet *)self->_enabledKeys copy];
  [v4 setEnabledKeys:v6];

  objc_super v7 = (void *)[(NSMutableDictionary *)self->_testEntries mutableCopy];
  [v4 setTestEntries:v7];

  return v4;
}

- (BOOL)isEmpty
{
  if ([(NSMutableDictionary *)self->_testEntries count])
  {
    LOBYTE(updatedKeys) = 0;
  }
  else
  {
    updatedKeys = self->_updatedKeys;
    if (updatedKeys) {
      LOBYTE(updatedKeys) = [(NSSet *)updatedKeys count] == 0;
    }
  }
  return (char)updatedKeys;
}

- (void)setDataEntry:(id)a3 forKey:(id)a4
{
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_testEntries objectForKey:v4];
  if (!v5)
  {
    updatedKeys = self->_updatedKeys;
    if (updatedKeys && ![(NSSet *)updatedKeys containsObject:v4])
    {
      v5 = 0;
    }
    else
    {
      enabledKeys = self->_enabledKeys;
      if (enabledKeys && ![(NSSet *)enabledKeys containsObject:v4])
      {
        id v8 = +[STStatusBarDataTestEntry disabledEntry];
      }
      else
      {
        id v8 = objc_alloc_init(STStatusBarDataTestEntry);
      }
      v5 = v8;
    }
  }

  return v5;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (a3)
  {
    v10 = (NSSet *)a4;
    [(STUIStatusBarTestData *)self setDataEntry:a3 forKey:v10];
    updatedKeys = v10;
  }
  else
  {
    testEntries = self->_testEntries;
    id v8 = a4;
    [(NSMutableDictionary *)testEntries removeObjectForKey:v8];
    objc_super v9 = (NSSet *)[(NSSet *)self->_updatedKeys mutableCopy];
    [(NSSet *)v9 removeObject:v8];

    updatedKeys = self->_updatedKeys;
    self->_updatedKeys = v9;
  }
}

- (id)existingEntryKeys
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = [(NSMutableDictionary *)self->_testEntries allKeys];
  [v3 addObjectsFromArray:v4];

  if (self->_updatedKeys) {
    objc_msgSend(v3, "unionSet:");
  }
  return v3;
}

- (void)applyUpdate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STUIStatusBarTestData;
  [(STUIStatusBarTestData *)&v23 applyUpdate:v4];
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 testEntries];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __37__STUIStatusBarTestData_applyUpdate___block_invoke;
    v22[3] = &unk_1E6AA3A68;
    v22[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v22];

    objc_super v7 = [(NSMutableDictionary *)self->_testEntries allKeys];
    id v8 = (void *)[v7 copy];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v15 = objc_msgSend(v5, "valueForKey:", v14, (void)v18);
          if (v15) {
            [(NSMutableDictionary *)self->_testEntries setObject:v15 forKeyedSubscript:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v11);
    }

    v16 = [v5 updatedKeys];
    [(STUIStatusBarTestData *)self setUpdatedKeys:v16];

    v17 = [v5 enabledKeys];
    [(STUIStatusBarTestData *)self setEnabledKeys:v17];
  }
}

uint64_t __37__STUIStatusBarTestData_applyUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 344) setObject:a3 forKeyedSubscript:a2];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarTestData;
  id v5 = [(STStatusBarData *)&v13 _descriptionBuilderWithMultilinePrefix:a3 forDebug:a4];
  id v6 = [v5 activeMultilinePrefix];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__STUIStatusBarTestData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v10[3] = &unk_1E6AA39F0;
  id v7 = v5;
  id v11 = v7;
  uint64_t v12 = self;
  [v7 appendBodySectionWithName:@"testing" multilinePrefix:v6 block:v10];

  id v8 = v7;
  return v8;
}

void __73__STUIStatusBarTestData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) updatedKeys];
  id v4 = [v3 allObjects];
  [v2 appendArraySection:v4 withName:@"updatedKeys" skipIfEmpty:1];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) enabledKeys];
  id v7 = [v6 allObjects];
  [v5 appendArraySection:v7 withName:@"enabledKeys" skipIfEmpty:1];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) testEntries];
  [v8 appendDictionarySection:v9 withName:@"testEntries" skipIfEmpty:1];
}

- (NSSet)updatedKeys
{
  return self->_updatedKeys;
}

- (void)setUpdatedKeys:(id)a3
{
}

- (NSSet)enabledKeys
{
  return self->_enabledKeys;
}

- (void)setEnabledKeys:(id)a3
{
}

- (NSMutableDictionary)testEntries
{
  return self->_testEntries;
}

- (void)setTestEntries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testEntries, 0);
  objc_storeStrong((id *)&self->_enabledKeys, 0);
  objc_storeStrong((id *)&self->_updatedKeys, 0);
}

@end