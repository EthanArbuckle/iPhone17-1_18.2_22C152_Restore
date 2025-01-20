@interface FCHCZoneContentsExpectation
- (CKDatabase)database;
- (CKRecordZoneID)zoneID;
- (NSArray)recordTests;
- (void)setDatabase:(id)a3;
- (void)setRecordTests:(id)a3;
- (void)setZoneID:(id)a3;
- (void)validate;
@end

@implementation FCHCZoneContentsExpectation

- (void)validate
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1A070]);
  v19 = self;
  v3 = [(FCHCZoneContentsExpectation *)self zoneID];
  v36[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  [v18 setRecordZoneIDs:v4];

  [v18 setFetchAllChanges:1];
  v5 = [MEMORY[0x1E4F1CA48] array];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __39__FCHCZoneContentsExpectation_validate__block_invoke;
  v33[3] = &unk_1E5B4D0C8;
  id v6 = v5;
  id v34 = v6;
  [v18 setRecordChangedBlock:v33];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __39__FCHCZoneContentsExpectation_validate__block_invoke_2;
  v26[3] = &unk_1E5B4D0F0;
  v26[4] = &v27;
  [v18 setFetchRecordZoneChangesCompletionBlock:v26];
  v7 = [(FCHCZoneContentsExpectation *)self database];
  [v7 addOperation:v18];

  [v18 waitUntilFinished];
  [MEMORY[0x1E4F29060] isMainThread];
  v8 = (uint64_t *)MEMORY[0x1E4F1C3A8];
  if (v28[5]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"error fetching zone changes from database: %@", v28[5] format];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = [(FCHCZoneContentsExpectation *)self recordTests];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v35 count:16];
  id obj = v9;
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    uint64_t v12 = *v8;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __39__FCHCZoneContentsExpectation_validate__block_invoke_3;
        v21[3] = &unk_1E5B4D118;
        v21[4] = v14;
        char v15 = objc_msgSend(v6, "fc_containsObjectPassingTest:", v21);
        [MEMORY[0x1E4F29060] isMainThread];
        if ((v15 & 1) == 0)
        {
          v16 = (void *)MEMORY[0x1E4F1CA00];
          v17 = [(FCHCZoneContentsExpectation *)v19 zoneID];
          [v16 raise:v12, @"missing records in zone: %@\nfound: %@", v17, v6 format];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v35 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(&v27, 8);
}

uint64_t __39__FCHCZoneContentsExpectation_validate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __39__FCHCZoneContentsExpectation_validate__block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __39__FCHCZoneContentsExpectation_validate__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 recordType];
  v5 = [*(id *)(a1 + 32) recordType];
  uint64_t v6 = [v4 isEqualToString:v5];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = a1;
  v8 = [*(id *)(a1 + 32) unencryptedFields];
  v9 = [v7 setWithArray:v8];

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v51;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v50 + 1) + 8 * v14);
        v16 = [v3 encryptedValuesByKey];
        v17 = [v16 objectForKeyedSubscript:v15];

        uint64_t v6 = (v17 == 0) & v6;
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v12);
  }

  id v18 = (void *)MEMORY[0x1E4F1CAD0];
  v19 = [*(id *)(v41 + 32) encryptedFields];
  v20 = [v18 setWithArray:v19];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v47;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * v25);
        uint64_t v27 = [v3 valuesByKey];
        v28 = [v27 objectForKeyedSubscript:v26];

        uint64_t v6 = (v28 == 0) & v6;
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v23);
  }
  v40 = v10;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v29 = [*(id *)(v41 + 32) expectedValues];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v43;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v43 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v42 + 1) + 8 * v33);
        v35 = objc_msgSend(*(id *)(v41 + 32), "expectedValues", v40);
        v36 = [v35 objectForKeyedSubscript:v34];

        if ([v21 containsObject:v34]) {
          [v3 encryptedValuesByKey];
        }
        else {
        v37 = [v3 valuesByKey];
        }
        v38 = [v37 objectForKeyedSubscript:v34];

        uint64_t v6 = [v38 isEqual:v36] & v6;
        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v31);
  }

  return v6;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (NSArray)recordTests
{
  return self->_recordTests;
}

- (void)setRecordTests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordTests, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end