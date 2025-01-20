@interface HDSPSyncedDefaultsConfiguration
- (BOOL)shouldPersistKey:(id)a3;
- (BOOL)shouldSyncKey:(id)a3;
- (HDSPSyncedDefaultsConfiguration)initWithInfo:(id)a3 keySets:(id)a4;
- (HDSPSyncedDefaultsInfo)info;
- (NSArray)keySets;
- (NSDictionary)allDefaultValues;
- (NSSet)allKeysToPersist;
- (NSSet)allKeysToSync;
- (NSSet)allPerGizmoKeys;
- (id)_accumulateKeysWithBlock:(id)a3 includeVersionInfo:(BOOL)a4 isForSync:(BOOL)a5;
- (id)_createKeySetMapForKeySets:(id)a3;
- (id)_keySetForKey:(id)a3;
- (id)filteredKeySetsWithKeysToSync:(id)a3;
- (id)keySetForIdentifier:(id)a3;
@end

@implementation HDSPSyncedDefaultsConfiguration

- (HDSPSyncedDefaultsConfiguration)initWithInfo:(id)a3 keySets:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDSPSyncedDefaultsConfiguration;
  v9 = [(HDSPSyncedDefaultsConfiguration *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_info, a3);
    uint64_t v11 = [(HDSPSyncedDefaultsConfiguration *)v10 _createKeySetMapForKeySets:v8];
    keySetMap = v10->_keySetMap;
    v10->_keySetMap = (NSDictionary *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)_createKeySetMapForKeySets:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__HDSPSyncedDefaultsConfiguration__createKeySetMapForKeySets___block_invoke;
  v9[3] = &unk_2645DA3E0;
  id v10 = v5;
  id v6 = v5;
  objc_msgSend(v4, "na_each:", v9);

  id v7 = (void *)[v6 copy];

  return v7;
}

void __62__HDSPSyncedDefaultsConfiguration__createKeySetMapForKeySets___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

- (NSArray)keySets
{
  return [(NSDictionary *)self->_keySetMap allValues];
}

- (id)_accumulateKeysWithBlock:(id)a3 includeVersionInfo:(BOOL)a4 isForSync:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v10 = [(HDSPSyncedDefaultsConfiguration *)self keySets];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __89__HDSPSyncedDefaultsConfiguration__accumulateKeysWithBlock_includeVersionInfo_isForSync___block_invoke;
  v21 = &unk_2645DA5C0;
  id v11 = v9;
  id v22 = v11;
  id v12 = v8;
  id v23 = v12;
  objc_msgSend(v10, "na_each:", &v18);

  if (v6)
  {
    v13 = [(HDSPSyncedDefaultsInfo *)self->_info dataVersionKey];
    [v11 addObject:v13];

    v14 = [(HDSPSyncedDefaultsInfo *)self->_info cloudDataVersionKey];
    [v11 addObject:v14];

    if (!a5)
    {
      objc_super v15 = [(HDSPSyncedDefaultsInfo *)self->_info localDataVersionKey];
      [v11 addObject:v15];
    }
  }
  v16 = objc_msgSend(v11, "copy", v18, v19, v20, v21);

  return v16;
}

void __89__HDSPSyncedDefaultsConfiguration__accumulateKeysWithBlock_includeVersionInfo_isForSync___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 unionSet:v2];
}

- (NSSet)allKeysToPersist
{
  return (NSSet *)[(HDSPSyncedDefaultsConfiguration *)self _accumulateKeysWithBlock:&__block_literal_global_14 includeVersionInfo:1 isForSync:0];
}

uint64_t __51__HDSPSyncedDefaultsConfiguration_allKeysToPersist__block_invoke(uint64_t a1, void *a2)
{
  return [a2 keysToPersist];
}

- (NSSet)allKeysToSync
{
  return (NSSet *)[(HDSPSyncedDefaultsConfiguration *)self _accumulateKeysWithBlock:&__block_literal_global_281 includeVersionInfo:1 isForSync:1];
}

uint64_t __48__HDSPSyncedDefaultsConfiguration_allKeysToSync__block_invoke(uint64_t a1, void *a2)
{
  return [a2 keysToSync];
}

- (NSSet)allPerGizmoKeys
{
  return (NSSet *)[(HDSPSyncedDefaultsConfiguration *)self _accumulateKeysWithBlock:&__block_literal_global_283_0 includeVersionInfo:0 isForSync:0];
}

uint64_t __50__HDSPSyncedDefaultsConfiguration_allPerGizmoKeys__block_invoke(uint64_t a1, void *a2)
{
  return [a2 perGizmoKeys];
}

- (NSDictionary)allDefaultValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(HDSPSyncedDefaultsConfiguration *)self keySets];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HDSPSyncedDefaultsConfiguration_allDefaultValues__block_invoke;
  v8[3] = &unk_2645DA3E0;
  id v9 = v3;
  id v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  BOOL v6 = (void *)[v5 copy];

  return (NSDictionary *)v6;
}

void __51__HDSPSyncedDefaultsConfiguration_allDefaultValues__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 defaultValues];
  [v2 addEntriesFromDictionary:v3];
}

- (BOOL)shouldPersistKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPSyncedDefaultsConfiguration *)self allKeysToPersist];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)shouldSyncKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPSyncedDefaultsConfiguration *)self allKeysToSync];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)_keySetForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSPSyncedDefaultsConfiguration *)self keySets];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__HDSPSyncedDefaultsConfiguration__keySetForKey___block_invoke;
  v9[3] = &unk_2645DA608;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __49__HDSPSyncedDefaultsConfiguration__keySetForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 keysToPersist];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (id)keySetForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_keySetMap objectForKeyedSubscript:a3];
}

- (id)filteredKeySetsWithKeysToSync:(id)a3
{
  id v4 = a3;
  keySetMap = self->_keySetMap;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__HDSPSyncedDefaultsConfiguration_filteredKeySetsWithKeysToSync___block_invoke;
  v13[3] = &unk_2645DA630;
  id v6 = v4;
  id v14 = v6;
  id v7 = [(NSDictionary *)keySetMap na_filter:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__HDSPSyncedDefaultsConfiguration_filteredKeySetsWithKeysToSync___block_invoke_2;
  v11[3] = &unk_2645DA658;
  id v12 = v6;
  id v8 = v6;
  id v9 = objc_msgSend(v7, "na_map:", v11);

  return v9;
}

uint64_t __65__HDSPSyncedDefaultsConfiguration_filteredKeySetsWithKeysToSync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 keysToSync];
  uint64_t v5 = [v4 intersectsSet:*(void *)(a1 + 32)];

  return v5;
}

HDSPSyncedDefaultsKeySet *__65__HDSPSyncedDefaultsConfiguration_filteredKeySetsWithKeysToSync___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [HDSPSyncedDefaultsKeySet alloc];
  id v6 = [v4 identifier];
  id v7 = [v4 modificationDateKey];
  id v8 = [v4 keysToPersist];
  id v9 = [v4 keysToSync];

  id v10 = objc_msgSend(v9, "na_setByIntersectingWithSet:", *(void *)(a1 + 32));
  id v11 = [(HDSPSyncedDefaultsKeySet *)v5 initWithIdentifier:v6 modficationDateKey:v7 keysToPersist:v8 keysToSync:v10];

  return v11;
}

- (HDSPSyncedDefaultsInfo)info
{
  return self->_info;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_keySetMap, 0);
}

@end