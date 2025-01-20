@interface SCWZoneSchema
- (BOOL)isAtomic;
- (BOOL)isValidRecord:(id)a3;
- (CKRecordZoneID)zoneID;
- (NSArray)allRecordFieldNames;
- (NSArray)recordSchemas;
- (NSString)zoneName;
- (SCWZoneSchema)initWithName:(id)a3 atomic:(BOOL)a4 recordSchemas:(id)a5;
- (SCWZoneSchema)initWithName:(id)a3 atomic:(BOOL)a4 version:(unint64_t)a5 recordSchemas:(id)a6;
- (id)schemaForRecordType:(id)a3;
- (id)validateRecords:(id)a3;
- (unint64_t)version;
- (void)setRecordSchemas:(id)a3;
@end

@implementation SCWZoneSchema

- (SCWZoneSchema)initWithName:(id)a3 atomic:(BOOL)a4 recordSchemas:(id)a5
{
  return [(SCWZoneSchema *)self initWithName:a3 atomic:a4 version:0 recordSchemas:a5];
}

uint64_t __33__SCWZoneSchema_validateRecords___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isValidRecord:a2];
}

- (id)validateRecords:(id)a3
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__SCWZoneSchema_validateRecords___block_invoke;
  v7[3] = &unk_1E5FA4370;
  v7[4] = self;
  id v3 = a3;
  v4 = [v3 indexesOfObjectsPassingTest:v7];
  v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

- (BOOL)isValidRecord:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 recordID];
  v6 = [v5 zoneID];
  v7 = [v6 zoneName];
  v8 = [(SCWZoneSchema *)self zoneName];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = [(SCWZoneSchema *)self recordSchemas];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = [v14 recordType];
          v16 = [v4 recordType];
          char v17 = [v15 isEqualToString:v16];

          if (v17)
          {
            LOBYTE(v11) = [v14 isValidRecord:v4];
            goto LABEL_13;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSArray)recordSchemas
{
  return self->_recordSchemas;
}

- (id)schemaForRecordType:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(SCWZoneSchema *)self recordSchemas];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 recordType];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (unint64_t)version
{
  return self->_version;
}

- (SCWZoneSchema)initWithName:(id)a3 atomic:(BOOL)a4 version:(unint64_t)a5 recordSchemas:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SCWZoneSchema;
  long long v13 = [(SCWZoneSchema *)&v18 init];
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F1A320]);
    uint64_t v15 = [v14 initWithZoneName:v11 ownerName:*MEMORY[0x1E4F19C08]];
    zoneID = v13->_zoneID;
    v13->_zoneID = (CKRecordZoneID *)v15;

    objc_storeStrong((id *)&v13->_zoneName, a3);
    v13->_version = a5;
    objc_storeStrong((id *)&v13->_recordSchemas, a6);
    v13->_atomic = a4;
  }

  return v13;
}

- (NSArray)allRecordFieldNames
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(SCWZoneSchema *)self recordSchemas];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) fieldNames];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isAtomic
{
  return self->_atomic;
}

- (void)setRecordSchemas:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSchemas, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);

  objc_storeStrong((id *)&self->_zoneID, 0);
}

@end