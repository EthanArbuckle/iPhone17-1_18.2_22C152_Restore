@interface PKCloudStoreRecord
- (NSArray)records;
- (NSDictionary)cloudStoreSpecificKeys;
- (PKCloudStoreRecord)initWithRecords:(id)a3;
- (id)description;
- (id)recordsWithRecordType:(id)a3;
- (void)addRecord:(id)a3;
- (void)setCloudStoreSpecificKeys:(id)a3;
@end

@implementation PKCloudStoreRecord

- (PKCloudStoreRecord)initWithRecords:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKCloudStoreRecord;
  v5 = [(PKCloudStoreRecord *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    records = v5->_records;
    v5->_records = (NSMutableDictionary *)v6;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          -[PKCloudStoreRecord addRecord:](v5, "addRecord:", *(void *)(*((void *)&v14 + 1) + 8 * v12++), (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v10);
    }
  }
  return v5;
}

- (id)recordsWithRecordType:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_records objectForKey:a3];
}

- (NSArray)records
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_records;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = -[NSMutableDictionary objectForKey:](self->_records, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (void)addRecord:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 recordType];
  id v6 = [(NSMutableDictionary *)self->_records objectForKey:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(NSMutableDictionary *)self->_records setObject:v6 forKey:v5];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "recordID", (void)v18);
        long long v14 = [v4 recordID];
        long long v15 = v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16)
        {

          if (v13 == v15) {
            goto LABEL_19;
          }
        }
        else
        {
          char v17 = [v13 isEqual:v14];

          if (v17)
          {
LABEL_19:
            [v7 removeObject:v12];
            goto LABEL_20;
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  [v7 addObject:v4];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"records: '%@'; ", self->_records];
  [v3 appendFormat:@">"];
  return v3;
}

- (NSDictionary)cloudStoreSpecificKeys
{
  return self->_cloudStoreSpecificKeys;
}

- (void)setCloudStoreSpecificKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudStoreSpecificKeys, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

@end