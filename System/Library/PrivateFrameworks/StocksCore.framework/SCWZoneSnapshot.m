@interface SCWZoneSnapshot
- (BOOL)isEqualToSnapshot:(id)a3;
- (NSArray)records;
- (SCWZoneSchema)zoneSchema;
- (SCWZoneSnapshot)initWithZoneSchema:(id)a3 records:(id)a4;
- (id)descriptionOfContents;
- (id)recordOfType:(id)a3;
- (id)recordOfType:(id)a3 passingTest:(id)a4;
- (id)recordWithName:(id)a3;
- (id)recordsOfType:(id)a3;
- (void)setRecords:(id)a3;
- (void)setZoneSchema:(id)a3;
@end

@implementation SCWZoneSnapshot

uint64_t __34__SCWZoneSnapshot_recordWithName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 recordID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (SCWZoneSnapshot)initWithZoneSchema:(id)a3 records:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWZoneSnapshot;
  v9 = [(SCWZoneSnapshot *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_zoneSchema, a3);
    if (v8)
    {
      uint64_t v11 = [v8 copy];
      records = v10->_records;
      v10->_records = (NSArray *)v11;
    }
    else
    {
      records = v10->_records;
      v10->_records = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v10;
}

- (BOOL)isEqualToSnapshot:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SCWZoneSnapshot *)self records];
  v6 = objc_msgSend(v5, "scw_dictionaryWithKeyBlock:", &__block_literal_global_3);

  id v7 = [v4 records];
  id v8 = objc_msgSend(v7, "scw_dictionaryWithKeyBlock:", &__block_literal_global_2);

  uint64_t v9 = [v6 count];
  if (v9 == [v8 count])
  {
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = [v6 allKeys];
    v12 = [v10 setWithArray:v11];

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v14 = [v8 allKeys];
    v15 = [v13 setWithArray:v14];

    if ([v12 isEqualToSet:v15])
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v16 = v6;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        id v36 = v4;
        uint64_t v37 = *(void *)v39;
        v34 = v15;
        v35 = v12;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v39 != v37) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            v21 = objc_msgSend(v16, "objectForKeyedSubscript:", v20, v34, v35, v36);
            v22 = [v8 objectForKeyedSubscript:v20];
            v23 = (void *)MEMORY[0x1E4FBA8A8];
            v24 = [v21 recordChangeTag];
            v25 = [v22 recordChangeTag];
            LODWORD(v23) = objc_msgSend(v23, "scw_object:isEqualToObject:", v24, v25);

            if (!v23
              || ([v21 valuesByKey],
                  v26 = objc_claimAutoreleasedReturnValue(),
                  [v22 valuesByKey],
                  v27 = objc_claimAutoreleasedReturnValue(),
                  int v28 = __37__SCWZoneSnapshot_isEqualToSnapshot___block_invoke_6((uint64_t)v27, v26, v27),
                  v27,
                  v26,
                  !v28))
            {

LABEL_17:
              BOOL v32 = 0;
              v12 = v35;
              id v4 = v36;
              v15 = v34;
              goto LABEL_19;
            }
            v29 = [v21 encryptedValues];
            v30 = [v22 encryptedValues];
            int v31 = __37__SCWZoneSnapshot_isEqualToSnapshot___block_invoke_6((uint64_t)v30, v29, v30);

            if (!v31) {
              goto LABEL_17;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
          BOOL v32 = 1;
          v12 = v35;
          id v4 = v36;
          v15 = v34;
          if (v18) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v32 = 1;
      }
LABEL_19:
    }
    else
    {
      BOOL v32 = 0;
    }
  }
  else
  {
    BOOL v32 = 0;
  }

  return v32;
}

uint64_t __37__SCWZoneSnapshot_isEqualToSnapshot___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

- (id)descriptionOfContents
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1CA48] array];
  v29 = int v28 = self;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(SCWZoneSnapshot *)self records];
  uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v30)
  {
    uint64_t v27 = *(void *)v38;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v3;
        id v4 = *(void **)(*((void *)&v37 + 1) + 8 * v3);
        v5 = [MEMORY[0x1E4F1CA60] dictionary];
        v6 = [v4 recordID];
        id v7 = [v6 recordName];
        [v5 setObject:v7 forKeyedSubscript:@"recordName"];

        id v8 = [v4 recordChangeTag];
        [v5 setObject:v8 forKeyedSubscript:@"changeTag"];

        uint64_t v9 = [v4 creationDate];
        [v5 setObject:v9 forKeyedSubscript:@"creationDate"];

        v10 = [v4 modificationDate];
        [v5 setObject:v10 forKeyedSubscript:@"modificationDate"];

        uint64_t v11 = [(SCWZoneSnapshot *)v28 zoneSchema];
        v12 = [v4 recordType];
        v13 = [v11 schemaForRecordType:v12];

        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        int v31 = v13;
        objc_super v14 = [v13 fieldSchemas];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if ([v19 isEncrypted]) {
                [v4 encryptedValues];
              }
              else {
              uint64_t v20 = [v4 valuesByKey];
              }
              v21 = [v19 name];
              v22 = [v20 objectForKeyedSubscript:v21];

              if (v22)
              {
                v23 = [v19 name];
                [v5 setObject:v22 forKeyedSubscript:v23];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v16);
        }

        [v29 addObject:v5];
        uint64_t v3 = v32 + 1;
      }
      while (v32 + 1 != v30);
      uint64_t v30 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v30);
  }

  v24 = [v29 description];

  return v24;
}

- (id)recordWithName:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(SCWZoneSnapshot *)self zoneSchema];
  id v8 = [v7 zoneID];
  uint64_t v9 = (void *)[v6 initWithRecordName:v5 zoneID:v8];

  v10 = [(SCWZoneSnapshot *)self records];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__SCWZoneSnapshot_recordWithName___block_invoke;
  v16[3] = &unk_1E5FA4370;
  id v11 = v9;
  id v17 = v11;
  uint64_t v12 = [v10 indexOfObjectPassingTest:v16];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    objc_super v14 = [(SCWZoneSnapshot *)self records];
    v13 = [v14 objectAtIndex:v12];
  }

  return v13;
}

- (NSArray)records
{
  return self->_records;
}

- (SCWZoneSchema)zoneSchema
{
  return self->_zoneSchema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);

  objc_storeStrong((id *)&self->_zoneSchema, 0);
}

uint64_t __37__SCWZoneSnapshot_isEqualToSnapshot___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recordID];
}

uint64_t __37__SCWZoneSnapshot_isEqualToSnapshot___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [v4 changedKeys];
  id v8 = [v6 setWithArray:v7];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  v10 = [v5 changedKeys];
  id v11 = [v9 setWithArray:v10];

  if ([v8 isEqualToSet:v11])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v23 = v11;
      v24 = v8;
      uint64_t v15 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v4, "objectForKey:", v17, v23, v24, (void)v25);
          v19 = [v5 objectForKey:v17];
          int v20 = objc_msgSend(MEMORY[0x1E4FBA8A8], "scw_object:isEqualToObject:", v18, v19);

          if (!v20)
          {
            uint64_t v21 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      uint64_t v21 = 1;
LABEL_13:
      id v11 = v23;
      id v8 = v24;
    }
    else
    {
      uint64_t v21 = 1;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)recordsOfType:(id)a3
{
  id v4 = a3;
  id v5 = [(SCWZoneSnapshot *)self records];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__SCWZoneSnapshot_recordsOfType___block_invoke;
  v11[3] = &unk_1E5FA4370;
  id v12 = v4;
  id v6 = v4;
  id v7 = [v5 indexesOfObjectsPassingTest:v11];

  id v8 = [(SCWZoneSnapshot *)self records];
  uint64_t v9 = [v8 objectsAtIndexes:v7];

  return v9;
}

uint64_t __33__SCWZoneSnapshot_recordsOfType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 recordType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)recordOfType:(id)a3
{
  return [(SCWZoneSnapshot *)self recordOfType:a3 passingTest:&__block_literal_global_25];
}

uint64_t __32__SCWZoneSnapshot_recordOfType___block_invoke()
{
  return 1;
}

- (id)recordOfType:(id)a3 passingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCWZoneSnapshot *)self records];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __44__SCWZoneSnapshot_recordOfType_passingTest___block_invoke;
  uint64_t v18 = &unk_1E5FA4798;
  id v19 = v6;
  id v20 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = [v8 indexOfObjectPassingTest:&v15];

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = [(SCWZoneSnapshot *)self records];
    id v12 = [v13 objectAtIndex:v11];
  }

  return v12;
}

uint64_t __44__SCWZoneSnapshot_recordOfType_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 recordType];
  if ([v4 isEqualToString:*(void *)(a1 + 32)]) {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setZoneSchema:(id)a3
{
}

- (void)setRecords:(id)a3
{
}

@end