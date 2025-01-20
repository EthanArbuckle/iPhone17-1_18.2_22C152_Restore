@interface ML3SetValuesForPropertiesOperation
- (BOOL)_execute:(id *)a3;
- (BOOL)_setValues:(id)a3 forProperties:(id)a4 withEntityClass:(Class)a5 usingPersistentID:(int64_t)a6 connection:(id)a7 error:(id *)a8;
- (unint64_t)type;
@end

@implementation ML3SetValuesForPropertiesOperation

- (BOOL)_setValues:(id)a3 forProperties:(id)a4 withEntityClass:(Class)a5 usingPersistentID:(int64_t)a6 connection:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if ([(ML3SetValuesForPropertiesOperation *)self isCancelled])
  {
LABEL_10:
    BOOL v21 = 0;
    goto LABEL_11;
  }
  if ([v14 count])
  {
    uint64_t v17 = [v14 count];
    if (v17 == [v15 count])
    {
      v30 = [(ML3DatabaseOperation *)self library];
      v31 = (void *)-[objc_class newWithPersistentID:inLibrary:](a5, "newWithPersistentID:inLibrary:", a6);
      v18 = [(objc_class *)a5 databaseTable];
      v19 = [(objc_class *)a5 unsettableProperties];
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([(ML3SetValuesForPropertiesOperation *)self isCancelled])
      {
        BOOL v21 = 0;
LABEL_22:

        goto LABEL_11;
      }
      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x2020000000;
      int v61 = 3;
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x3032000000;
      v57 = __Block_byref_object_copy__14506;
      v58 = __Block_byref_object_dispose__14507;
      id v59 = 0;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke;
      v46[3] = &unk_1E5FB5E10;
      v29 = v19;
      Class v53 = a5;
      id v47 = v19;
      v51 = v60;
      id v25 = v18;
      id v48 = v25;
      v52 = &v54;
      id v26 = v20;
      id v49 = v26;
      id v50 = v14;
      [v15 enumerateObjectsUsingBlock:v46];
      v27 = (void *)v55[5];
      if (v27)
      {
        if (a8)
        {
          BOOL v21 = 0;
          *a8 = v27;
LABEL_21:

          _Block_object_dispose(&v54, 8);
          _Block_object_dispose(v60, 8);
          v19 = v29;
          goto LABEL_22;
        }
      }
      else if (([(ML3SetValuesForPropertiesOperation *)self isCancelled] & 1) == 0)
      {
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2020000000;
        char v45 = 0;
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_2;
        v32[3] = &unk_1E5FB5E60;
        id v33 = v26;
        Class v41 = a5;
        id v34 = v25;
        v38 = &v54;
        id v35 = v16;
        id v36 = v31;
        v39 = &v42;
        v40 = v60;
        id v37 = v30;
        [v35 performTransactionWithBlock:v32];
        if (a8)
        {
          v28 = (void *)v55[5];
          if (v28) {
            *a8 = v28;
          }
        }
        BOOL v21 = *((unsigned char *)v43 + 24) != 0;

        _Block_object_dispose(&v42, 8);
        goto LABEL_21;
      }
      BOOL v21 = 0;
      goto LABEL_21;
    }
    v22 = +[ML3MediaLibraryWriter writerErrorWithCode:500 description:@"Values and properties arrays are not equal length."];
    v23 = v22;
    if (a8) {
      *a8 = v22;
    }

    goto LABEL_10;
  }
  BOOL v21 = 1;
LABEL_11:

  return v21;
}

void __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v24 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && ([v24 isEqualToString:@"ROWID"] & 1) == 0)
  {
    int v7 = [*(id *)(a1 + 80) libraryContentsChangeForProperty:v24];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    if (v7)
    {
      *(_DWORD *)(v8 + 24) = 0;
    }
    else
    {
      id v9 = v24;
      if (*(_DWORD *)(v8 + 24) < 2u) {
        goto LABEL_9;
      }
      int v10 = [*(id *)(a1 + 80) libraryDynamicChangeForProperty:v24];
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      if (!v10)
      {
        id v9 = v24;
        if (*(_DWORD *)(v11 + 24) >= 3u) {
          *(_DWORD *)(v11 + 24) = 2;
        }
LABEL_9:
        v12 = [*(id *)(a1 + 80) joinClausesForProperty:v9];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          id v14 = [*(id *)(a1 + 80) foreignDatabaseTableForProperty:v24];
          id v15 = [*(id *)(a1 + 80) foreignColumnForProperty:v24];
        }
        else
        {
          id v14 = *(id *)(a1 + 40);
          id v15 = v24;
        }
        id v16 = v15;
        if (v14)
        {
          if (v15)
          {
            id v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:v14];
            if (!v17)
            {
              id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              [*(id *)(a1 + 48) setObject:v17 forKeyedSubscript:v14];
            }
            v18 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3];
            if (v18)
            {
              [v17 setObject:v18 forKeyedSubscript:v16];
            }
            else
            {
              v23 = [MEMORY[0x1E4F1CA98] null];
              [v17 setObject:v23 forKeyedSubscript:v16];
            }
            goto LABEL_23;
          }
          [NSString stringWithFormat:@"no column for %@ / %@", *(void *)(a1 + 80), v24];
        }
        else
        {
          [NSString stringWithFormat:@"no table for %@ / %@", *(void *)(a1 + 80), v24];
        v19 = };
        uint64_t v20 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:v19];
        uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
        v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;

        *a4 = 1;
LABEL_23:

        goto LABEL_24;
      }
      *(_DWORD *)(v11 + 24) = 1;
    }
    id v9 = v24;
    goto LABEL_9;
  }
LABEL_24:
}

uint64_t __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_3;
  uint64_t v13 = &unk_1E5FB5E38;
  uint64_t v19 = *(void *)(a1 + 96);
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 72);
  id v14 = v3;
  uint64_t v17 = v4;
  id v15 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 80);
  id v16 = v5;
  uint64_t v18 = v6;
  [v2 enumerateKeysAndObjectsUsingBlock:&v10];
  uint64_t v7 = *(void *)(a1 + 80);
  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)
    && *(unsigned char *)(*(void *)(v7 + 8) + 24)
    && *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) <= 1u)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = objc_msgSend(*(id *)(a1 + 96), "incrementRevisionWithLibrary:persistentID:deletionType:revisionType:usingConnection:", *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 56), "persistentID", v10, v11, v12, v13, v14, v15), 0, *(unsigned int *)(*(void *)(*(void *)(a1 + 88)+ 8)+ 24), *(void *)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 80);
  }
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v7 + 8) + 24);

  return v8;
}

void __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 72) persistentIDColumnForTable:v7];
  if ([*(id *)(a1 + 32) isEqualToString:v7])
  {
    v31 = a4;
    uint64_t v10 = @"ROWID";

    id v9 = @"ROWID";
LABEL_6:
    uint64_t v16 = [v8 count];
    uint64_t v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
    uint64_t v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_4;
    v33[3] = &unk_1E5FB7A70;
    id v34 = v17;
    id v35 = v18;
    id v19 = v18;
    id v20 = v17;
    [v8 enumerateKeysAndObjectsUsingBlock:v33];
    uint64_t v21 = [v20 componentsJoinedByString:@", "];
    v22 = [NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE %@ = ?", v7, v21, v9];;
    v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "persistentID"));
    [v19 addObject:v23];

    id v24 = *(void **)(a1 + 40);
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v25 + 40);
    char v26 = [v24 executeUpdate:v22 withParameters:v19 error:&obj];
    objc_storeStrong((id *)(v25 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v26;

    a4 = v31;
    goto LABEL_7;
  }
  if (!v9)
  {
    v27 = [NSString stringWithFormat:@"no pidColumn for %@ / %@", *(void *)(a1 + 72), v7];
    uint64_t v28 = +[ML3MediaLibraryWriter writerErrorWithCode:200 description:v27];
    uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    id v9 = 0;
LABEL_10:
    *a4 = 1;
    goto LABEL_11;
  }
  uint64_t v11 = [NSString stringWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1", v7, v9];;
  v12 = *(void **)(a1 + 40);
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 48), "persistentID"));
  v36[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  id v15 = [v12 executeQuery:v11 withParameters:v14];

  LODWORD(v13) = [v15 hasAtLeastOneRow];
  if (v13)
  {
    v31 = a4;
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 72), "insertValues:intoTable:persistentID:connection:", v8, v7, objc_msgSend(*(id *)(a1 + 48), "persistentID"), *(void *)(a1 + 40));
LABEL_7:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    goto LABEL_10;
  }
LABEL_11:
}

void __114__ML3SetValuesForPropertiesOperation__setValues_forProperties_withEntityClass_usingPersistentID_connection_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = NSString;
  id v8 = a3;
  id v7 = [v6 stringWithFormat:@"%@ = ?", a2];
  [v5 addObject:v7];

  [*(id *)(a1 + 40) addObject:v8];
}

- (BOOL)_execute:(id *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v44 = [(ML3DatabaseOperation *)self attributes];
  id v34 = [v44 objectForKeyedSubscript:@"MLDatabaseOperationAttributePersistentIDsArrayKey"];
  uint64_t v4 = [v44 objectForKeyedSubscript:@"MLDatabaseOperationAttributeApplyDifferentValuesToPIDs"];
  id v35 = v4;
  if (v4) {
    int v5 = [v4 BOOLValue];
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = [v44 objectForKeyedSubscript:@"MLDatabaseOperationAttributeEntityClassKey"];
  Class v42 = NSClassFromString(v6);

  v43 = [v44 objectForKeyedSubscript:@"MLDatabaseOperationAttributeValuesKey"];
  if (v5)
  {
    long long v54 = 0uLL;
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    long long v51 = 0uLL;
    id obj = v34;
    uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v40)
    {
      int v7 = 0;
      id v8 = 0;
      uint64_t v37 = *(void *)v52;
      while (2)
      {
        uint64_t v9 = 0;
        id v38 = (id)v7;
        uint64_t v10 = v8;
        do
        {
          if (*(void *)v52 != v37) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v51 + 1) + 8 * v9);
          uint64_t v12 = [v11 longLongValue];
          uint64_t v13 = [v43 objectAtIndexedSubscript:(char *)v38 + v9];
          id v14 = [v44 objectForKeyedSubscript:@"MLDatabaseOperationAttributePropertiesKey"];
          uint64_t v15 = [(ML3DatabaseOperation *)self transaction];
          uint64_t v16 = [(id)v15 connection];

          id v50 = v10;
          LOBYTE(v15) = [(ML3SetValuesForPropertiesOperation *)self _setValues:v13 forProperties:v14 withEntityClass:v42 usingPersistentID:v12 connection:v16 error:&v50];
          id v8 = v50;

          if ((v15 & 1) == 0)
          {
            uint64_t v29 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = [v11 longLongValue];
              *(_DWORD *)buf = 134217984;
              uint64_t v57 = v30;
              _os_log_impl(&dword_1B022D000, v29, OS_LOG_TYPE_DEFAULT, "[ML3SetValuesForPropertiesOperation] Failed to set values for persistent ID %lld", buf, 0xCu);
            }

            int v17 = 0;
            goto LABEL_31;
          }

          ++v9;
          int v17 = 1;
          uint64_t v10 = v8;
        }
        while (v40 != v9);
        uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
        int v7 = v38 + v9;
        if (v40) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v8 = 0;
      int v17 = 0;
    }
LABEL_31:

    BOOL v18 = v17 != 0;
  }
  else
  {
    long long v48 = 0uLL;
    long long v49 = 0uLL;
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    id v39 = v34;
    id v8 = 0;
    BOOL v18 = 0;
    uint64_t v19 = [v39 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v19)
    {
      uint64_t v41 = *(void *)v47;
      while (2)
      {
        uint64_t v20 = 0;
        uint64_t v21 = v8;
        do
        {
          if (*(void *)v47 != v41) {
            objc_enumerationMutation(v39);
          }
          v22 = *(void **)(*((void *)&v46 + 1) + 8 * v20);
          uint64_t v23 = [v22 longLongValue];
          id v24 = [v44 objectForKeyedSubscript:@"MLDatabaseOperationAttributePropertiesKey"];
          uint64_t v25 = [(ML3DatabaseOperation *)self transaction];
          char v26 = [(id)v25 connection];

          id v45 = v21;
          LOBYTE(v25) = [(ML3SetValuesForPropertiesOperation *)self _setValues:v43 forProperties:v24 withEntityClass:v42 usingPersistentID:v23 connection:v26 error:&v45];
          id v8 = v45;

          if ((v25 & 1) == 0)
          {
            v27 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = [v22 longLongValue];
              *(_DWORD *)buf = 134217984;
              uint64_t v57 = v28;
              _os_log_impl(&dword_1B022D000, v27, OS_LOG_TYPE_DEFAULT, "[ML3SetValuesForPropertiesOperation] Failed to set values for persistent ID %lld", buf, 0xCu);
            }

            BOOL v18 = 0;
            goto LABEL_26;
          }

          ++v20;
          BOOL v18 = 1;
          uint64_t v21 = v8;
        }
        while (v19 != v20);
        uint64_t v19 = [v39 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
  id v31 = v8;
  *a3 = v31;

  return v18;
}

- (unint64_t)type
{
  return 1;
}

@end