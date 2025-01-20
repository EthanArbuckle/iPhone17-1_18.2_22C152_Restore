@interface MTChangeSet
+ (id)changeSetWithChangesFromObject:(id)a3 toObject:(id)a4;
+ (id)changeSetWithChangesFromObject:(id)a3 toObject:(id)a4 inProperties:(id)a5;
+ (id)dictionaryFromChanges:(id)a3;
- (BOOL)_isEqualToChangeSet:(id)a3 checkOriginalValues:(BOOL)a4;
- (BOOL)hasChangeForProperty:(id)a3;
- (BOOL)hasChangesInCommonWithChangeSet:(id)a3;
- (BOOL)hasChangesInProperties:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToChangeSet:(id)a3;
- (MTChangeSet)initWithChangeDictionary:(id)a3;
- (MTChangeSet)initWithChanges:(id)a3;
- (NSArray)changes;
- (NSDictionary)changeDictionary;
- (NSSet)changedProperties;
- (id)_deserializer;
- (id)changeSetByAddingChangeSet:(id)a3;
- (id)changedValueForProperty:(id)a3 hasProperty:(BOOL *)a4;
- (id)description;
- (id)deserializedChangedValueForProperty:(id)a3 hasProperty:(BOOL *)a4;
- (void)setChangeDictionary:(id)a3;
- (void)setChangedProperties:(id)a3;
@end

@implementation MTChangeSet

+ (id)dictionaryFromChanges:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__MTChangeSet_dictionaryFromChanges___block_invoke;
  v7[3] = &unk_1E59170C0;
  id v5 = v4;
  id v8 = v5;
  objc_msgSend(v3, "na_each:", v7);

  return v5;
}

void __37__MTChangeSet_dictionaryFromChanges___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 property];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (MTChangeSet)initWithChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() dictionaryFromChanges:v4];

  v6 = [(MTChangeSet *)self initWithChangeDictionary:v5];
  return v6;
}

- (MTChangeSet)initWithChangeDictionary:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTChangeSet;
  v6 = [(MTChangeSet *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_changeDictionary, a3);
    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = [v5 allKeys];
    uint64_t v10 = [v8 setWithArray:v9];
    changedProperties = v7->_changedProperties;
    v7->_changedProperties = (NSSet *)v10;
  }
  return v7;
}

- (BOOL)_isEqualToChangeSet:(id)a3 checkOriginalValues:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (MTChangeSet *)a3;
  if (self == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4)
      {
        v7 = [(MTChangeSet *)self changeDictionary];
        id v8 = [(MTChangeSet *)v6 changeDictionary];
        char v9 = [v7 isEqualToDictionary:v8];
      }
      else
      {
        v7 = [(MTChangeSet *)self changedProperties];
        id v8 = [(MTChangeSet *)v6 changedProperties];
        if ([v7 isEqualToSet:v8])
        {
          uint64_t v10 = [(MTChangeSet *)self changeDictionary];
          v11 = [v10 allKeys];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __55__MTChangeSet__isEqualToChangeSet_checkOriginalValues___block_invoke;
          v13[3] = &unk_1E59170E8;
          v13[4] = self;
          v14 = v6;
          char v9 = objc_msgSend(v11, "na_all:", v13);
        }
        else
        {
          char v9 = 0;
        }
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

uint64_t __55__MTChangeSet__isEqualToChangeSet_checkOriginalValues___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 changeDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = [*(id *)(a1 + 40) changeDictionary];
  id v8 = [v7 objectForKeyedSubscript:v4];

  char v9 = [v6 changedValue];
  uint64_t v10 = [v8 changedValue];
  uint64_t v11 = [v9 isEqual:v10];

  return v11;
}

- (BOOL)isEquivalentToChangeSet:(id)a3
{
  return [(MTChangeSet *)self _isEqualToChangeSet:a3 checkOriginalValues:0];
}

- (BOOL)isEqual:(id)a3
{
  return [(MTChangeSet *)self _isEqualToChangeSet:a3 checkOriginalValues:1];
}

- (id)changeSetByAddingChangeSet:(id)a3
{
  id v4 = a3;
  id v5 = [(MTChangeSet *)self changeDictionary];
  v6 = (void *)[v5 mutableCopy];

  v7 = [v4 changeDictionary];

  [v6 addEntriesFromDictionary:v7];
  id v8 = [(MTChangeSet *)self initWithChangeDictionary:v6];

  return v8;
}

+ (id)changeSetWithChangesFromObject:(id)a3 toObject:(id)a4
{
  return (id)[a1 changeSetWithChangesFromObject:a3 toObject:a4 inProperties:0];
}

+ (id)changeSetWithChangesFromObject:(id)a3 toObject:(id)a4 inProperties:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v42 = (objc_class *)a1;
    uint64_t v11 = objc_opt_new();
    id v45 = v8;
    [v11 encodeObject:v8 forKey:@"fromObject"];
    id v44 = v9;
    [v11 encodeObject:v9 forKey:@"toObject"];
    v43 = v11;
    v12 = [v11 encodedDictionary];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"fromObject"];
    v41 = v12;
    uint64_t v14 = [v12 objectForKeyedSubscript:@"toObject"];
    v40 = (void *)v13;
    v15 = +[MTStorageReader _unwrap:v13];
    v39 = (void *)v14;
    v16 = +[MTStorageReader _unwrap:v14];
    v17 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          if (!v10 || [v10 containsObject:*(void *)(*((void *)&v50 + 1) + 8 * i)])
          {
            v24 = [v18 objectForKeyedSubscript:v23];
            v25 = [v16 objectForKeyedSubscript:v23];
            v26 = v25;
            if (v25 != v24 && ([v25 isEqual:v24] & 1) == 0)
            {
              v27 = [[MTChange alloc] initWithProperty:v23 changedValue:v26 originalValue:v24];
              [v17 addObject:v27];
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v20);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v28 = v16;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          if (!v10 || [v10 containsObject:*(void *)(*((void *)&v46 + 1) + 8 * j)])
          {
            v34 = [v18 objectForKeyedSubscript:v33];

            if (!v34)
            {
              v35 = [v28 objectForKeyedSubscript:v33];
              v36 = [[MTChange alloc] initWithProperty:v33 changedValue:v35 originalValue:0];
              [v17 addObject:v36];
            }
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v30);
    }

    v37 = (void *)[[v42 alloc] initWithChanges:v17];
    id v9 = v44;
    id v8 = v45;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (NSArray)changes
{
  return [(NSDictionary *)self->_changeDictionary allValues];
}

- (BOOL)hasChangesInProperties:(id)a3
{
  return [(NSSet *)self->_changedProperties intersectsSet:a3];
}

- (BOOL)hasChangeForProperty:(id)a3
{
  return [(NSSet *)self->_changedProperties containsObject:a3];
}

- (BOOL)hasChangesInCommonWithChangeSet:(id)a3
{
  changedProperties = self->_changedProperties;
  id v4 = [a3 changedProperties];
  LOBYTE(changedProperties) = [(NSSet *)changedProperties intersectsSet:v4];

  return (char)changedProperties;
}

- (id)changedValueForProperty:(id)a3 hasProperty:(BOOL *)a4
{
  id v5 = [(NSDictionary *)self->_changeDictionary objectForKeyedSubscript:a3];
  v6 = v5;
  if (a4) {
    *a4 = v5 != 0;
  }
  if (v5)
  {
    v7 = [v5 changedValue];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)deserializedChangedValueForProperty:(id)a3 hasProperty:(BOOL *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(MTChangeSet *)self changedValueForProperty:v6 hasProperty:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [MTDictionaryDeserializer alloc];
    id v13 = v6;
    v14[0] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v10 = [(MTStorageReader *)v8 initWithEncodedDictionary:v9];

    id v11 = [(MTStorageReader *)v10 decodeObjectForKey:v6];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

- (id)_deserializer
{
  id v3 = [MTDictionaryDeserializer alloc];
  id v4 = [(NSDictionary *)self->_changeDictionary na_dictionaryByMappingValues:&__block_literal_global_29];
  id v5 = [(MTStorageReader *)v3 initWithEncodedDictionary:v4];

  return v5;
}

uint64_t __28__MTChangeSet__deserializer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 changedValue];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MTChangeSet *)self changes];
  id v6 = [v3 stringWithFormat:@"<%@:%p %@ >", v4, self, v5];

  return v6;
}

- (NSSet)changedProperties
{
  return self->_changedProperties;
}

- (void)setChangedProperties:(id)a3
{
}

- (NSDictionary)changeDictionary
{
  return self->_changeDictionary;
}

- (void)setChangeDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDictionary, 0);
  objc_storeStrong((id *)&self->_changedProperties, 0);
}

@end