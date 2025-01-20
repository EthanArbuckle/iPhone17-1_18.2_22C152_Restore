@interface PDCloudStoreCounterpartRecordParserZones
- (PDCloudStoreCounterpartRecordParserZones)init;
- (id)allRecords;
- (void)addRecord:(id)a3;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeIdentifiers:(id)a3;
@end

@implementation PDCloudStoreCounterpartRecordParserZones

- (PDCloudStoreCounterpartRecordParserZones)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDCloudStoreCounterpartRecordParserZones;
  v2 = [(PDCloudStoreCounterpartRecordParserZones *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    zoneNameToRecords = v2->_zoneNameToRecords;
    v2->_zoneNameToRecords = v3;
  }
  return v2;
}

- (void)addRecord:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    v5 = [v4 recordID];
    objc_super v6 = [v5 zoneID];
    v7 = [v6 zoneName];

    id v8 = [(NSMutableDictionary *)self->_zoneNameToRecords objectForKey:v7];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [(NSMutableDictionary *)self->_zoneNameToRecords setObject:v8 forKey:v7];
    }
    [v8 addObject:v9];

    id v4 = v9;
  }
}

- (id)allRecords
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  zoneNameToRecords = self->_zoneNameToRecords;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__PDCloudStoreCounterpartRecordParserZones_allRecords__block_invoke;
  v8[3] = &unk_1E56DC280;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)zoneNameToRecords enumerateKeysAndObjectsUsingBlock:v8];
  objc_super v6 = (void *)[v5 copy];

  return v6;
}

void __54__PDCloudStoreCounterpartRecordParserZones_allRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a3 allObjects];
  [v3 addObjectsFromArray:v4];
}

- (void)removeIdentifiers:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableDictionary *)self->_zoneNameToRecords removeObjectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  zoneNameToRecords = self->_zoneNameToRecords;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PDCloudStoreCounterpartRecordParserZones_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E56DC2A8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)zoneNameToRecords enumerateKeysAndObjectsUsingBlock:v7];
}

void __78__PDCloudStoreCounterpartRecordParserZones_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  id v8 = [a3 allObjects];
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);
}

- (void).cxx_destruct
{
}

@end