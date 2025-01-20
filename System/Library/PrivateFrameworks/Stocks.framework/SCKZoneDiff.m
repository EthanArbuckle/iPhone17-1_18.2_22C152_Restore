@interface SCKZoneDiff
- (BOOL)hasSameBaseAsDiff:(id)a3;
- (BOOL)isEmpty;
- (NSArray)deletedRecordIDs;
- (NSArray)modifiedRecords;
- (SCKZoneDiff)initWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4;
- (id)applyToRecords:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)applyToModifyRecordsOperation:(id)a3;
@end

@implementation SCKZoneDiff

- (SCKZoneDiff)initWithModifiedRecords:(id)a3 deletedRecordIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCKZoneDiff;
  v8 = [(SCKZoneDiff *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    modifiedRecords = v8->_modifiedRecords;
    v8->_modifiedRecords = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    deletedRecordIDs = v8->_deletedRecordIDs;
    v8->_deletedRecordIDs = (NSArray *)v11;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(SCKZoneDiff *)self modifiedRecords];
  id v6 = [(SCKZoneDiff *)self deletedRecordIDs];
  id v7 = (void *)[v4 initWithModifiedRecords:v5 deletedRecordIDs:v6];

  return v7;
}

- (BOOL)isEmpty
{
  v3 = [(SCKZoneDiff *)self modifiedRecords];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(SCKZoneDiff *)self deletedRecordIDs];
    BOOL v4 = [v5 count] == 0;
  }
  return v4;
}

- (id)applyToRecords:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v12 = [v11 recordID];
        [v5 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v8);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v13 = [(SCKZoneDiff *)self modifiedRecords];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        v19 = [v18 recordID];
        [v5 setObject:v18 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v15);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v20 = [(SCKZoneDiff *)self deletedRecordIDs];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        [v5 removeObjectForKey:*(void *)(*((void *)&v27 + 1) + 8 * k)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v22);
  }

  v25 = [v5 allValues];

  return v25;
}

- (void)applyToModifyRecordsOperation:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [(SCKZoneDiff *)self modifiedRecords];
  uint64_t v8 = (void *)[v6 initWithArray:v7 copyItems:1];
  [v5 setRecordsToSave:v8];

  id v9 = [(SCKZoneDiff *)self deletedRecordIDs];
  [v5 setRecordIDsToDelete:v9];
}

- (BOOL)hasSameBaseAsDiff:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [(SCKZoneDiff *)self deletedRecordIDs];
  uint64_t v7 = [v5 setWithArray:v6];

  uint64_t v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = [v4 deletedRecordIDs];
  v10 = [v8 setWithArray:v9];

  if ([v7 isEqualToSet:v10])
  {
    v41 = v10;
    uint64_t v42 = v7;
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v12 = [(SCKZoneDiff *)self modifiedRecords];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v53 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v18 = [v17 recordID];
          [v11 setObject:v17 forKey:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v14);
    }

    v19 = [MEMORY[0x263EFF9A0] dictionary];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v20 = [v4 modifiedRecords];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          v26 = [v25 recordID];
          [v19 setObject:v25 forKey:v26];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v22);
    }

    uint64_t v27 = [v11 count];
    if (v27 == [v19 count])
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v28 = v11;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        id v40 = v4;
        uint64_t v43 = *(void *)v45;
        while (2)
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v45 != v43) {
              objc_enumerationMutation(v28);
            }
            uint64_t v32 = *(void *)(*((void *)&v44 + 1) + 8 * k);
            long long v33 = objc_msgSend(v28, "objectForKeyedSubscript:", v32, v40);
            long long v34 = [v19 objectForKeyedSubscript:v32];
            long long v35 = (void *)MEMORY[0x263F8C6D0];
            long long v36 = [v33 recordChangeTag];
            long long v37 = [v34 recordChangeTag];
            LODWORD(v35) = objc_msgSend(v35, "sck_object:isEqualToObject:", v36, v37);

            if (!v35)
            {
              BOOL v38 = 0;
              goto LABEL_29;
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
          if (v30) {
            continue;
          }
          break;
        }
        BOOL v38 = 1;
LABEL_29:
        id v4 = v40;
      }
      else
      {
        BOOL v38 = 1;
      }
    }
    else
    {
      BOOL v38 = 0;
    }
    v10 = v41;

    uint64_t v7 = v42;
  }
  else
  {
    BOOL v38 = 0;
  }

  return v38;
}

- (NSArray)modifiedRecords
{
  return self->_modifiedRecords;
}

- (NSArray)deletedRecordIDs
{
  return self->_deletedRecordIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedRecordIDs, 0);

  objc_storeStrong((id *)&self->_modifiedRecords, 0);
}

@end