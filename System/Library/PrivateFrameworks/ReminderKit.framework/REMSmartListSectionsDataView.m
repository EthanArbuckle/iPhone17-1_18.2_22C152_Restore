@interface REMSmartListSectionsDataView
- (REMSmartListSectionsDataView)initWithStore:(id)a3;
- (REMStore)store;
- (id)fetchSmartListSectionWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchSmartListSectionsInSmartList:(id)a3 error:(id *)a4;
- (id)fetchSmartListSectionsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)smartListSectionsFromAccountStorages:(id)a3 smartListStorages:(id)a4 groupStorages:(id)a5 smartListSectionStorages:(id)a6 store:(id)a7;
@end

@implementation REMSmartListSectionsDataView

- (REMSmartListSectionsDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListSectionsDataView;
  v6 = [(REMSmartListSectionsDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchSmartListSectionsInSmartList:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    v8 = [REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList alloc];
    objc_super v9 = [v7 objectID];
    v10 = [(REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList *)v8 initWithParentSmartListObjectID:v9];

    v11 = [(REMSmartListSectionsDataView *)self store];
    v12 = [v11 resultFromPerformingInvocation:v10 error:a4];

    uint64_t v13 = objc_opt_class();
    v14 = REMDynamicCast(v13, (uint64_t)v12);
    v15 = [v14 accountStorages];
    v16 = [v14 smartListStorages];
    v17 = [v14 groupStorages];
    v18 = [v14 smartListSectionStorages];
    v19 = [(REMSmartListSectionsDataView *)self store];
    v20 = [(REMSmartListSectionsDataView *)self smartListSectionsFromAccountStorages:v15 smartListStorages:v16 groupStorages:v17 smartListSectionStorages:v18 store:v19];
  }
  else
  {
    v21 = +[REMLogStore read];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[REMSmartListSectionsDataView fetchSmartListSectionsInSmartList:error:]((uint64_t)self, a2);
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "smartList");
    v20 = 0;
  }

  return v20;
}

- (id)fetchSmartListSectionsWithObjectIDs:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    if ([v7 count])
    {
      objc_super v9 = [[REMSmartListSectionsDataViewInvocation_fetchByObjectIDs alloc] initWithObjectIDs:v8];
      v10 = [(REMSmartListSectionsDataView *)self store];
      v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

      uint64_t v12 = objc_opt_class();
      uint64_t v13 = REMDynamicCast(v12, (uint64_t)v11);
      v14 = [v13 accountStorages];
      v15 = [v13 smartListStorages];
      v16 = [v13 groupStorages];
      v17 = [v13 smartListSectionStorages];
      v18 = [(REMSmartListSectionsDataView *)self store];
      v19 = [(REMSmartListSectionsDataView *)self smartListSectionsFromAccountStorages:v14 smartListStorages:v15 groupStorages:v16 smartListSectionStorages:v17 store:v18];

      if (v19)
      {
        v30 = v11;
        v31 = v9;
        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v19, "count"));
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v33 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              v27 = [v26 objectID];
              [v20 setObject:v26 forKeyedSubscript:v27];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v23);
        }

        v11 = v30;
        objc_super v9 = v31;
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v28 = +[REMLogStore read];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[REMTemplateSectionsDataView fetchTemplateSectionsWithObjectIDs:error:]((uint64_t)self, a2);
    }

    NSLog(&cfstr_SIsUnexpectedl.isa, "objectIDs");
    v20 = 0;
  }

  return v20;
}

- (id)fetchSmartListSectionWithObjectID:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    v15[0] = v7;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v10 = [(REMSmartListSectionsDataView *)self fetchSmartListSectionsWithObjectIDs:v9 error:a4];

    if (v10)
    {
      v11 = [v10 objectForKeyedSubscript:v8];
      if (v11)
      {
LABEL_12:

        goto LABEL_13;
      }
      uint64_t v12 = +[REMLogStore read];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[REMSmartListSectionsDataView fetchSmartListSectionWithObjectID:error:]((uint64_t)v8, v12);
      }

      if (a4)
      {
        +[REMError noSuchObjectErrorWithObjectID:v8];
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    v11 = 0;
    goto LABEL_12;
  }
  uint64_t v13 = +[REMLogStore read];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[REMTemplateSectionsDataView fetchTemplateSectionWithObjectID:error:]((uint64_t)self, a2);
  }

  NSLog(&cfstr_SIsUnexpectedl.isa, "objectID");
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)smartListSectionsFromAccountStorages:(id)a3 smartListStorages:(id)a4 groupStorages:(id)a5 smartListSectionStorages:(id)a6 store:(id)a7
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v57 = a4;
  id v12 = a5;
  id v55 = a6;
  id v13 = a7;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = v11;
  uint64_t v15 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v75 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = [[REMAccount alloc] initWithStore:v13 storage:*(void *)(*((void *)&v74 + 1) + 8 * i)];
        v20 = [(REMAccount *)v19 objectID];
        [v14 setObject:v19 forKeyedSubscript:v20];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v74 objects:v81 count:16];
    }
    while (v16);
  }

  v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count"));
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v59 = v12;
  uint64_t v21 = [v59 countByEnumeratingWithState:&v70 objects:v80 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v71;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v71 != v23) {
          objc_enumerationMutation(v59);
        }
        v25 = *(void **)(*((void *)&v70 + 1) + 8 * j);
        v26 = [v25 accountID];

        if (!v26) {
          NSLog(&cfstr_SIsUnexpectedl.isa, "groupStorage.accountID");
        }
        v27 = [v25 accountID];
        v28 = [v14 objectForKeyedSubscript:v27];

        v29 = [[REMList alloc] initWithStore:v13 account:v28 storage:v25];
        v30 = [(REMList *)v29 objectID];
        [v61 setObject:v29 forKeyedSubscript:v30];
      }
      uint64_t v22 = [v59 countByEnumeratingWithState:&v70 objects:v80 count:16];
    }
    while (v22);
  }

  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v57, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v58 = v57;
  uint64_t v32 = [v58 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v67;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v67 != v34) {
          objc_enumerationMutation(v58);
        }
        v36 = *(void **)(*((void *)&v66 + 1) + 8 * k);
        uint64_t v37 = [v36 accountID];

        if (!v37) {
          NSLog(&cfstr_SIsUnexpectedl.isa, "smartListStorage.accountID");
        }
        v38 = [v36 accountID];
        v39 = [v14 objectForKeyedSubscript:v38];

        v40 = [v36 parentListID];

        if (v40)
        {
          v41 = [v36 parentListID];
          v40 = [v61 objectForKeyedSubscript:v41];
        }
        v42 = [[REMSmartList alloc] initWithStore:v13 account:v39 parentList:v40 storage:v36];
        v43 = [(REMSmartList *)v42 objectID];
        [v31 setObject:v42 forKeyedSubscript:v43];
      }
      uint64_t v33 = [v58 countByEnumeratingWithState:&v66 objects:v79 count:16];
    }
    while (v33);
  }

  v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v55, "count"));
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v56 = v55;
  uint64_t v45 = [v56 countByEnumeratingWithState:&v62 objects:v78 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v46; ++m)
      {
        if (*(void *)v63 != v47) {
          objc_enumerationMutation(v56);
        }
        v49 = *(void **)(*((void *)&v62 + 1) + 8 * m);
        v50 = [v49 smartListID];

        if (!v50) {
          NSLog(&cfstr_SIsUnexpectedl.isa, "smartListSectionStorage.smartListID");
        }
        v51 = [v49 smartListID];
        v52 = [v31 objectForKeyedSubscript:v51];
        v53 = [[REMSmartListSection alloc] initWithStore:v13 smartList:v52 storage:v49];
        [v44 addObject:v53];
      }
      uint64_t v46 = [v56 countByEnumeratingWithState:&v62 objects:v78 count:16];
    }
    while (v46);
  }

  return v44;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

- (void)fetchSmartListSectionsInSmartList:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  id v7 = [v3 stringWithFormat:@"%@.%@"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9AA2000, v8, v9, "[%{public}@] Passing in nil '%s'", v10, v11, v12, v13, (uint64_t)v5, (uint64_t)v6, v14);
}

- (void)fetchSmartListSectionWithObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "REMSmartListSectionsDataView: Requested to fetch non-existent smartListSection {objectID: %{public}@}", (uint8_t *)&v2, 0xCu);
}

@end