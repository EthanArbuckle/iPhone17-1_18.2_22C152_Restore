@interface PDCloudStoreCounterpartRecordParserIdentifiers
- (PDCloudStoreCounterpartRecordParserIdentifiers)init;
- (id)allRecords;
- (id)allRecordsWithIdentifier:(id)a3;
- (id)description;
- (void)addRecord:(id)a3 identifier:(id)a4;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)removeIdentifiers:(id)a3;
@end

@implementation PDCloudStoreCounterpartRecordParserIdentifiers

- (PDCloudStoreCounterpartRecordParserIdentifiers)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDCloudStoreCounterpartRecordParserIdentifiers;
  v2 = [(PDCloudStoreCounterpartRecordParserIdentifiers *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifierToParserZones = v2->_identifierToParserZones;
    v2->_identifierToParserZones = v3;
  }
  return v2;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
}

- (void)addRecord:(id)a3 identifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_identifierToParserZones objectForKey:v6];
  if (!v7)
  {
    v7 = objc_alloc_init(PDCloudStoreCounterpartRecordParserZones);
    [(NSMutableDictionary *)self->_identifierToParserZones setObject:v7 forKey:v6];
  }
  [(PDCloudStoreCounterpartRecordParserZones *)v7 addRecord:v8];
}

- (id)allRecordsWithIdentifier:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = [(NSMutableDictionary *)self->_identifierToParserZones objectForKey:v5];

  id v8 = [v7 allRecords];
  [v6 addObjectsFromArray:v8];

  v9 = (void *)[v6 copy];
  return v9;
}

- (id)allRecords
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  identifierToParserZones = self->_identifierToParserZones;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PDCloudStoreCounterpartRecordParserIdentifiers_allRecords__block_invoke;
  v8[3] = &unk_1E56DC258;
  id v9 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)identifierToParserZones enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return v6;
}

void __60__PDCloudStoreCounterpartRecordParserIdentifiers_allRecords__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 allRecords];
  if ([v4 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v4];
  }
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
        [(NSMutableDictionary *)self->_identifierToParserZones removeObjectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)description
{
  return (id)[(NSMutableDictionary *)self->_identifierToParserZones description];
}

- (void).cxx_destruct
{
}

@end