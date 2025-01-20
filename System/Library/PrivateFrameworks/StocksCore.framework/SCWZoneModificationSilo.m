@interface SCWZoneModificationSilo
- (BOOL)_shouldAssertRecordValidity;
- (BOOL)recordExistsWithName:(id)a3;
- (NSMutableArray)deletedRecordIDs;
- (NSMutableDictionary)originalRecordsByID;
- (NSMutableDictionary)recordsToSaveByID;
- (NSMutableDictionary)workingRecordsByID;
- (SCWZoneDiff)diff;
- (SCWZoneModificationSilo)initWithZoneSchema:(id)a3 contents:(id)a4;
- (SCWZoneSchema)zoneSchema;
- (void)createOrUpdateRecordWithName:(id)a3 recordType:(id)a4 modifyBlock:(id)a5;
- (void)deleteRecordWithName:(id)a3;
- (void)setDeletedRecordIDs:(id)a3;
- (void)setOriginalRecordsByID:(id)a3;
- (void)setRecordsToSaveByID:(id)a3;
- (void)setWorkingRecordsByID:(id)a3;
- (void)setZoneSchema:(id)a3;
@end

@implementation SCWZoneModificationSilo

- (SCWZoneModificationSilo)initWithZoneSchema:(id)a3 contents:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SCWZoneModificationSilo;
  v9 = [(SCWZoneModificationSilo *)&v32 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneSchema, a3);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    originalRecordsByID = v10->_originalRecordsByID;
    v10->_originalRecordsByID = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    workingRecordsByID = v10->_workingRecordsByID;
    v10->_workingRecordsByID = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recordsToSaveByID = v10->_recordsToSaveByID;
    v10->_recordsToSaveByID = v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    deletedRecordIDs = v10->_deletedRecordIDs;
    v10->_deletedRecordIDs = v17;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v8;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v28 + 1) + 8 * v23);
          v25 = [(SCWZoneModificationSilo *)v10 originalRecordsByID];
          v26 = [v24 recordID];
          [v25 setObject:v24 forKeyedSubscript:v26];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v21);
    }
  }
  return v10;
}

- (SCWZoneDiff)diff
{
  v3 = [SCWZoneDiff alloc];
  v4 = [(SCWZoneModificationSilo *)self recordsToSaveByID];
  v5 = [v4 allValues];
  v6 = [(SCWZoneModificationSilo *)self deletedRecordIDs];
  id v7 = [(SCWZoneDiff *)v3 initWithModifiedRecords:v5 deletedRecordIDs:v6];

  return v7;
}

- (BOOL)recordExistsWithName:(id)a3
{
  v5 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = [(SCWZoneModificationSilo *)self zoneSchema];
  v9 = [v8 zoneID];
  v10 = (void *)[v7 initWithRecordName:v6 zoneID:v9];

  v11 = [(SCWZoneModificationSilo *)self originalRecordsByID];
  v12 = [v11 objectForKeyedSubscript:v10];
  if (!v12)
  {
    v9 = [(SCWZoneModificationSilo *)self workingRecordsByID];
    v3 = [v9 objectForKeyedSubscript:v10];
    if (!v3)
    {
      LOBYTE(v14) = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  v13 = [(SCWZoneModificationSilo *)self deletedRecordIDs];
  int v14 = [v13 containsObject:v10] ^ 1;

  if (!v12) {
    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

- (void)createOrUpdateRecordWithName:(id)a3 recordType:(id)a4 modifyBlock:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v11 = a3;
  id v12 = [v10 alloc];
  v13 = [(SCWZoneModificationSilo *)self zoneSchema];
  int v14 = [v13 zoneID];
  v15 = (void *)[v12 initWithRecordName:v11 zoneID:v14];

  v16 = [(SCWZoneModificationSilo *)self workingRecordsByID];
  v17 = [v16 objectForKeyedSubscript:v15];

  if (v17)
  {
    id v18 = v17;
    goto LABEL_4;
  }
  id v19 = [(SCWZoneModificationSilo *)self originalRecordsByID];
  uint64_t v20 = [v19 objectForKeyedSubscript:v15];

  id v18 = (id)[v20 copy];
  if (v18)
  {
LABEL_4:
    uint64_t v21 = [(SCWZoneModificationSilo *)self zoneSchema];
    char v22 = [v21 isValidRecord:v18];

    if ((v22 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  id v18 = (id)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:v8 recordID:v15];
LABEL_7:
  v9[2](v9, v18);
  uint64_t v23 = [(SCWZoneModificationSilo *)self zoneSchema];
  int v24 = [v23 isValidRecord:v18];

  if (v24)
  {
    v25 = [(SCWZoneModificationSilo *)self workingRecordsByID];
    v26 = [v18 recordID];
    [v25 setObject:v18 forKeyedSubscript:v26];

    v27 = [(SCWZoneModificationSilo *)self recordsToSaveByID];
    long long v28 = [v18 recordID];
    [v27 setObject:v18 forKeyedSubscript:v28];

    long long v29 = [(SCWZoneModificationSilo *)self deletedRecordIDs];
    [v29 removeObject:v15];
  }
  else if ([(SCWZoneModificationSilo *)self _shouldAssertRecordValidity] {
         && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  }
  {
    -[SCWZoneModificationSilo createOrUpdateRecordWithName:recordType:modifyBlock:]((uint64_t)v18);
  }
LABEL_12:
}

- (SCWZoneSchema)zoneSchema
{
  return self->_zoneSchema;
}

- (NSMutableDictionary)workingRecordsByID
{
  return self->_workingRecordsByID;
}

- (NSMutableDictionary)recordsToSaveByID
{
  return self->_recordsToSaveByID;
}

- (NSMutableArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (NSMutableDictionary)originalRecordsByID
{
  return self->_originalRecordsByID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordsToSaveByID, 0);
  objc_storeStrong((id *)&self->_workingRecordsByID, 0);
  objc_storeStrong((id *)&self->_originalRecordsByID, 0);

  objc_storeStrong((id *)&self->_zoneSchema, 0);
}

- (void)deleteRecordWithName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v6 = [(SCWZoneModificationSilo *)self zoneSchema];
  id v7 = [v6 zoneID];
  id v8 = (void *)[v5 initWithRecordName:v4 zoneID:v7];

  v9 = [(SCWZoneModificationSilo *)self deletedRecordIDs];
  [v9 addObject:v8];

  v10 = [(SCWZoneModificationSilo *)self recordsToSaveByID];
  [v10 removeObjectForKey:v8];

  id v11 = [(SCWZoneModificationSilo *)self workingRecordsByID];
  id v12 = [v11 objectForKeyedSubscript:v8];

  if (v12)
  {
    v13 = [(SCWZoneModificationSilo *)self zoneSchema];
    int v14 = [v12 recordType];
    v15 = [v13 schemaForRecordType:v14];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v16 = objc_msgSend(v15, "fieldSchemas", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v21 isEncrypted])
          {
            char v22 = [v12 encryptedValues];
            uint64_t v23 = [v21 name];
            [v22 setObject:0 forKeyedSubscript:v23];
          }
          else
          {
            char v22 = [v21 name];
            [v12 setObject:0 forKeyedSubscript:v22];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }
  }
}

- (BOOL)_shouldAssertRecordValidity
{
  if (_shouldAssertRecordValidity_onceToken[0] != -1) {
    dispatch_once(_shouldAssertRecordValidity_onceToken, &__block_literal_global_1);
  }
  return _shouldAssertRecordValidity_runningTests == 0;
}

Class __54__SCWZoneModificationSilo__shouldAssertRecordValidity__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Xctestcase.isa);
  _shouldAssertRecordValidity_runningTests = result != 0;
  return result;
}

- (void)setZoneSchema:(id)a3
{
}

- (void)setOriginalRecordsByID:(id)a3
{
}

- (void)setWorkingRecordsByID:(id)a3
{
}

- (void)setRecordsToSaveByID:(id)a3
{
}

- (void)setDeletedRecordIDs:(id)a3
{
}

- (void)createOrUpdateRecordWithName:(uint64_t)a1 recordType:modifyBlock:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1AFD01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "record was invalid after modification: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end