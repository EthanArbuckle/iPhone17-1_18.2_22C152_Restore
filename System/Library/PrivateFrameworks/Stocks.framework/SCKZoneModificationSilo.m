@interface SCKZoneModificationSilo
- (BOOL)_shouldAssertRecordValidity;
- (BOOL)recordExistsWithName:(id)a3;
- (NSMutableArray)deletedRecordIDs;
- (NSMutableDictionary)originalRecordsByID;
- (NSMutableDictionary)recordsToSaveByID;
- (NSMutableDictionary)workingRecordsByID;
- (SCKZoneDiff)diff;
- (SCKZoneModificationSilo)initWithZoneSchema:(id)a3 contents:(id)a4;
- (SCKZoneSchema)zoneSchema;
- (void)createOrUpdateRecordWithName:(id)a3 recordType:(id)a4 modifyBlock:(id)a5;
- (void)deleteRecordWithName:(id)a3;
- (void)setDeletedRecordIDs:(id)a3;
- (void)setOriginalRecordsByID:(id)a3;
- (void)setRecordsToSaveByID:(id)a3;
- (void)setWorkingRecordsByID:(id)a3;
- (void)setZoneSchema:(id)a3;
@end

@implementation SCKZoneModificationSilo

- (SCKZoneModificationSilo)initWithZoneSchema:(id)a3 contents:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"SCKZoneModificationSilo.m" lineNumber:36 description:@"zone modification context requires non-nil zone schema"];
  }
  v34.receiver = self;
  v34.super_class = (Class)SCKZoneModificationSilo;
  v10 = [(SCKZoneModificationSilo *)&v34 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_zoneSchema, a3);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    originalRecordsByID = v11->_originalRecordsByID;
    v11->_originalRecordsByID = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    workingRecordsByID = v11->_workingRecordsByID;
    v11->_workingRecordsByID = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    recordsToSaveByID = v11->_recordsToSaveByID;
    v11->_recordsToSaveByID = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    deletedRecordIDs = v11->_deletedRecordIDs;
    v11->_deletedRecordIDs = v18;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v20 = v9;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v30 + 1) + 8 * v24);
          v26 = [(SCKZoneModificationSilo *)v11 originalRecordsByID];
          v27 = [v25 recordID];
          [v26 setObject:v25 forKeyedSubscript:v27];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v22);
    }
  }
  return v11;
}

- (void)createOrUpdateRecordWithName:(id)a3 recordType:(id)a4 modifyBlock:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  v10 = (objc_class *)MEMORY[0x263EFD7E8];
  id v11 = a3;
  id v12 = [v10 alloc];
  v13 = [(SCKZoneModificationSilo *)self zoneSchema];
  v14 = [v13 zoneID];
  v15 = (void *)[v12 initWithRecordName:v11 zoneID:v14];

  v16 = [(SCKZoneModificationSilo *)self workingRecordsByID];
  v17 = [v16 objectForKeyedSubscript:v15];

  if (v17)
  {
    id v18 = v17;
    goto LABEL_4;
  }
  v19 = [(SCKZoneModificationSilo *)self originalRecordsByID];
  id v20 = [v19 objectForKeyedSubscript:v15];

  id v18 = (id)[v20 copy];
  if (v18)
  {
LABEL_4:
    uint64_t v21 = [(SCKZoneModificationSilo *)self zoneSchema];
    char v22 = [v21 isValidRecord:v18];

    if ((v22 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  id v18 = (id)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:v8 recordID:v15];
LABEL_7:
  v9[2](v9, v18);
  uint64_t v23 = [(SCKZoneModificationSilo *)self zoneSchema];
  int v24 = [v23 isValidRecord:v18];

  if (v24)
  {
    v25 = [(SCKZoneModificationSilo *)self workingRecordsByID];
    v26 = [v18 recordID];
    [v25 setObject:v18 forKeyedSubscript:v26];

    v27 = [(SCKZoneModificationSilo *)self recordsToSaveByID];
    v28 = [v18 recordID];
    [v27 setObject:v18 forKeyedSubscript:v28];

    v29 = [(SCKZoneModificationSilo *)self deletedRecordIDs];
    [v29 removeObject:v15];
  }
  else if ([(SCKZoneModificationSilo *)self _shouldAssertRecordValidity] {
         && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  }
  {
    -[SCKZoneModificationSilo createOrUpdateRecordWithName:recordType:modifyBlock:]((uint64_t)v18);
  }
LABEL_12:
}

- (void)deleteRecordWithName:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFD7E8]);
  v6 = [(SCKZoneModificationSilo *)self zoneSchema];
  v7 = [v6 zoneID];
  id v8 = (void *)[v5 initWithRecordName:v4 zoneID:v7];

  id v9 = [(SCKZoneModificationSilo *)self deletedRecordIDs];
  [v9 addObject:v8];

  v10 = [(SCKZoneModificationSilo *)self recordsToSaveByID];
  [v10 removeObjectForKey:v8];

  id v11 = [(SCKZoneModificationSilo *)self workingRecordsByID];
  id v12 = [v11 objectForKeyedSubscript:v8];

  if (v12)
  {
    v13 = [(SCKZoneModificationSilo *)self zoneSchema];
    v14 = [v12 recordType];
    v15 = [v13 schemaForRecordType:v14];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v16 = objc_msgSend(v15, "fieldNames", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          [v12 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * v20++)];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v18);
    }
  }
}

- (BOOL)recordExistsWithName:(id)a3
{
  id v5 = (objc_class *)MEMORY[0x263EFD7E8];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = [(SCKZoneModificationSilo *)self zoneSchema];
  id v9 = [v8 zoneID];
  v10 = (void *)[v7 initWithRecordName:v6 zoneID:v9];

  id v11 = [(SCKZoneModificationSilo *)self originalRecordsByID];
  id v12 = [v11 objectForKeyedSubscript:v10];
  if (!v12)
  {
    id v9 = [(SCKZoneModificationSilo *)self workingRecordsByID];
    v3 = [v9 objectForKeyedSubscript:v10];
    if (!v3)
    {
      LOBYTE(v14) = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  v13 = [(SCKZoneModificationSilo *)self deletedRecordIDs];
  int v14 = [v13 containsObject:v10] ^ 1;

  if (!v12) {
    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

- (SCKZoneDiff)diff
{
  v3 = [SCKZoneDiff alloc];
  id v4 = [(SCKZoneModificationSilo *)self recordsToSaveByID];
  id v5 = [v4 allValues];
  id v6 = [(SCKZoneModificationSilo *)self deletedRecordIDs];
  id v7 = [(SCKZoneDiff *)v3 initWithModifiedRecords:v5 deletedRecordIDs:v6];

  return v7;
}

- (BOOL)_shouldAssertRecordValidity
{
  if (_shouldAssertRecordValidity_onceToken != -1) {
    dispatch_once(&_shouldAssertRecordValidity_onceToken, &__block_literal_global_0);
  }
  return _shouldAssertRecordValidity_runningTests == 0;
}

Class __54__SCKZoneModificationSilo__shouldAssertRecordValidity__block_invoke()
{
  Class result = NSClassFromString(&cfstr_Xctestcase.isa);
  _shouldAssertRecordValidity_runningTests = result != 0;
  return result;
}

- (SCKZoneSchema)zoneSchema
{
  return self->_zoneSchema;
}

- (void)setZoneSchema:(id)a3
{
}

- (NSMutableDictionary)originalRecordsByID
{
  return self->_originalRecordsByID;
}

- (void)setOriginalRecordsByID:(id)a3
{
}

- (NSMutableDictionary)workingRecordsByID
{
  return self->_workingRecordsByID;
}

- (void)setWorkingRecordsByID:(id)a3
{
}

- (NSMutableDictionary)recordsToSaveByID
{
  return self->_recordsToSaveByID;
}

- (void)setRecordsToSaveByID:(id)a3
{
}

- (NSMutableArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (void)setDeletedRecordIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_recordsToSaveByID, 0);
  objc_storeStrong((id *)&self->_workingRecordsByID, 0);
  objc_storeStrong((id *)&self->_originalRecordsByID, 0);

  objc_storeStrong((id *)&self->_zoneSchema, 0);
}

- (void)createOrUpdateRecordWithName:(uint64_t)a1 recordType:modifyBlock:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_222ED9000, &_os_log_internal, OS_LOG_TYPE_ERROR, "record was invalid after modification: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end