@interface REMListSectionsDataView
- (REMListSectionsDataView)initWithStore:(id)a3;
- (REMStore)store;
- (id)fetchListSectionWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListSectionsCountWithListObjectID:(id)a3 error:(id *)a4;
- (id)fetchListSectionsInList:(id)a3 error:(id *)a4;
- (id)fetchListSectionsWithListObjectID:(id)a3 error:(id *)a4;
- (id)fetchListSectionsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)listSectionsFromAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5 store:(id)a6;
@end

@implementation REMListSectionsDataView

- (REMListSectionsDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSectionsDataView;
  v6 = [(REMListSectionsDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchListSectionsWithListObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [[REMListSectionsDataViewInvocation_fetchListSectionsInList alloc] initWithParentListObjectID:v6];
    v8 = [(REMListSectionsDataView *)self store];
    objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

    uint64_t v10 = objc_opt_class();
    v11 = REMDynamicCast(v10, (uint64_t)v9);
    v12 = [v11 accountStorages];
    v13 = [v11 listStorages];
    v14 = [v11 listSectionStorages];
    v15 = [(REMListSectionsDataView *)self store];
    v16 = [(REMListSectionsDataView *)self listSectionsFromAccountStorages:v12 listStorages:v13 listSectionStorages:v14 store:v15];
  }
  else
  {
    v17 = +[REMLogStore read];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "listObjectID");
    v16 = 0;
  }

  return v16;
}

- (id)fetchListSectionsInList:(id)a3 error:(id *)a4
{
  id v6 = [a3 objectID];
  v7 = [(REMListSectionsDataView *)self fetchListSectionsWithListObjectID:v6 error:a4];

  return v7;
}

- (id)fetchListSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    if ([v6 count])
    {
      v8 = [[REMListSectionsDataViewInvocation_fetchByObjectIDs alloc] initWithObjectIDs:v7];
      objc_super v9 = [(REMListSectionsDataView *)self store];
      uint64_t v10 = [v9 resultFromPerformingInvocation:v8 error:a4];

      uint64_t v11 = objc_opt_class();
      v12 = REMDynamicCast(v11, (uint64_t)v10);
      v13 = [v12 accountStorages];
      v14 = [v12 listStorages];
      v15 = [v12 listSectionStorages];
      v16 = [(REMListSectionsDataView *)self store];
      v17 = [(REMListSectionsDataView *)self listSectionsFromAccountStorages:v13 listStorages:v14 listSectionStorages:v15 store:v16];

      if (v17)
      {
        v28 = v10;
        v29 = v8;
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v17, "count"));
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v19 = v17;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v31 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              v25 = [v24 objectID];
              [v18 setObject:v24 forKeyedSubscript:v25];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v21);
        }

        uint64_t v10 = v28;
        v8 = v29;
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v26 = +[REMLogStore read];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionsWithObjectIDs:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectIDs");
    v18 = 0;
  }

  return v18;
}

- (id)fetchListSectionWithObjectID:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v14[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    objc_super v9 = [(REMListSectionsDataView *)self fetchListSectionsWithObjectIDs:v8 error:a4];

    if (v9)
    {
      uint64_t v10 = [v9 objectForKeyedSubscript:v7];
      if (v10)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v11 = +[REMLogStore read];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[REMListSectionsDataView fetchListSectionWithObjectID:error:]((uint64_t)v7, v11);
      }

      if (a4)
      {
        +[REMError noSuchObjectErrorWithObjectID:v7];
        uint64_t v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  v12 = +[REMLogStore read];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[REMListSectionsDataView fetchListSectionWithObjectID:error:]();
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

- (id)fetchListSectionsCountWithListObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [[REMListSectionsDataViewInvocation_fetchListSectionsCountInList alloc] initWithParentListObjectID:v6];
    v8 = [(REMListSectionsDataView *)self store];
    objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [v9 storedPropertyForKey:@"SectionsCount"];
    v12 = REMDynamicCast(v10, (uint64_t)v11);

    if (!v12)
    {
      v15 = +[REMLogStore read];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[REMListSectionsDataView fetchListSectionsCountWithListObjectID:error:]((uint64_t)v6, v15);
      }

      if (a4 && !*a4)
      {
        *a4 = +[REMError unexpectedError];
      }
    }
  }
  else
  {
    v13 = +[REMLogStore read];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[REMListSectionsDataView fetchListSectionsWithListObjectID:error:]();
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "listObjectID");
    v12 = 0;
  }

  return v12;
}

- (id)listSectionsFromAccountStorages:(id)a3 listStorages:(id)a4 listSectionStorages:(id)a5 store:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = +[REMListsDataView listsFromAccountStorages:a3 listStorages:a4 store:v10];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v18 = [v17 listID];

        if (!v18) {
          NSLog(&cfstr_SIsUnexpectedl.isa, "listSectionStorage.listID");
        }
        id v19 = [v17 listID];
        uint64_t v20 = [v11 objectForKeyedSubscript:v19];
        uint64_t v21 = [[REMListSection alloc] initWithStore:v10 list:v20 storage:v17];
        [v12 addObject:v21];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v14);
  }

  return v12;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

- (void)fetchListSectionsWithListObjectID:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  id v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)fetchListSectionsWithObjectIDs:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  id v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)fetchListSectionWithObjectID:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (const char *)OUTLINED_FUNCTION_4_1();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  id v5 = [v2 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v6, v7, "[%{public}@] Passing in nil '%s'", v8, v9, v10, v11, v12, v13, v14);
}

- (void)fetchListSectionWithObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "REMListSectionsDataView: Requested to fetch non-existent listSection {objectID: %{public}@}", (uint8_t *)&v2, 0xCu);
}

- (void)fetchListSectionsCountWithListObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch Sections count from list with listObjectID {listObjectID: %@}", (uint8_t *)&v2, 0xCu);
}

@end