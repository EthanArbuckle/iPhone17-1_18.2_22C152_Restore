@interface PDCloudStoreCounterpartRecordParser
- (PDCloudStoreCounterpartRecordParser)initWithDataSource:(id)a3;
- (id)allRecordsForItemType:(unint64_t)a3;
- (id)allRecordsWithIdentifier:(id)a3 itemType:(unint64_t)a4;
- (id)description;
- (void)addRecords:(id)a3;
- (void)enumerateKeysAndObjectsForItemType:(unint64_t)a3 usingBlock:(id)a4;
- (void)removeIdentifiers:(id)a3 itemType:(unint64_t)a4;
@end

@implementation PDCloudStoreCounterpartRecordParser

- (PDCloudStoreCounterpartRecordParser)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDCloudStoreCounterpartRecordParser;
  v6 = [(PDCloudStoreCounterpartRecordParser *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemTypeToParserIdentifiers = v7->_itemTypeToParserIdentifiers;
    v7->_itemTypeToParserIdentifiers = v8;
  }
  return v7;
}

- (void)addRecords:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [(PDCloudStoreCounterpartRecordParserDataSource *)self->_dataSource itemTypeFromRecord:v9];
        if (v10)
        {
          uint64_t v11 = v10;
          itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
          v13 = [NSNumber numberWithUnsignedInteger:v10];
          v14 = [(NSMutableDictionary *)itemTypeToParserIdentifiers objectForKey:v13];

          if (!v14)
          {
            v14 = objc_alloc_init(PDCloudStoreCounterpartRecordParserIdentifiers);
            v15 = self->_itemTypeToParserIdentifiers;
            v16 = [NSNumber numberWithUnsignedInteger:v11];
            [(NSMutableDictionary *)v15 setObject:v14 forKey:v16];
          }
          v17 = [(PDCloudStoreCounterpartRecordParserDataSource *)self->_dataSource identifierFromRecord:v9];
          [(PDCloudStoreCounterpartRecordParserIdentifiers *)v14 addRecord:v9 identifier:v17];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (void)removeIdentifiers:(id)a3 itemType:(unint64_t)a4
{
  itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
  uint64_t v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithUnsignedInteger:a4];
  id v9 = [(NSMutableDictionary *)itemTypeToParserIdentifiers objectForKey:v8];

  [v9 removeIdentifiers:v7];
}

- (id)allRecordsForItemType:(unint64_t)a3
{
  itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)itemTypeToParserIdentifiers objectForKey:v4];

  uint64_t v6 = [v5 allRecords];

  return v6;
}

- (id)allRecordsWithIdentifier:(id)a3 itemType:(unint64_t)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v11 = [(NSMutableDictionary *)itemTypeToParserIdentifiers objectForKey:v10];

  v12 = [v11 allRecordsWithIdentifier:v7];

  [v8 addObjectsFromArray:v12];
  v13 = (void *)[v8 copy];

  return v13;
}

- (void)enumerateKeysAndObjectsForItemType:(unint64_t)a3 usingBlock:(id)a4
{
  itemTypeToParserIdentifiers = self->_itemTypeToParserIdentifiers;
  uint64_t v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithUnsignedInteger:a3];
  id v9 = [(NSMutableDictionary *)itemTypeToParserIdentifiers objectForKey:v8];

  [v9 enumerateKeysAndObjectsUsingBlock:v7];
}

- (id)description
{
  return (id)[(NSMutableDictionary *)self->_itemTypeToParserIdentifiers description];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_recordNamePrefixes, 0);
  objc_storeStrong((id *)&self->_itemTypeToParserIdentifiers, 0);
}

@end