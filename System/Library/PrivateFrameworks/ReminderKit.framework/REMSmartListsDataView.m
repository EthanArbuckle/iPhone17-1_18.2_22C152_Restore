@interface REMSmartListsDataView
+ (id)smartListsFromSmartListStorages:(id)a3 accountStorages:(id)a4 parentListStorages:(id)a5 store:(id)a6;
- (REMSmartListsDataView)initWithStore:(id)a3;
- (REMStore)store;
- (id)fetchCustomSmartListWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchCustomSmartListsInAccount:(id)a3 error:(id *)a4;
- (id)fetchCustomSmartListsInGroup:(id)a3 error:(id *)a4;
- (id)fetchCustomSmartListsWithError:(id *)a3;
- (id)fetchNonCustomSmartListWithSmartListType:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
@end

@implementation REMSmartListsDataView

- (REMSmartListsDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListsDataView;
  v6 = [(REMSmartListsDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchNonCustomSmartListWithSmartListType:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  objc_super v9 = [[REMSmartListsDataViewInvocation_fetchSmartList alloc] initWithSmartListType:v8 objectID:0 createIfNeeded:v6];

  v10 = [(REMSmartListsDataView *)self store];
  v11 = [v10 resultFromPerformingInvocation:v9 error:a5];

  uint64_t v12 = objc_opt_class();
  v13 = REMDynamicCast(v12, (uint64_t)v11);
  v14 = [v13 smartListStorages];

  if (v14)
  {
    v15 = [v13 smartListStorages];
    v16 = [v13 accountStorages];
    v17 = [v13 parentListStorages];
    v18 = [(REMSmartListsDataView *)self store];
    v19 = +[REMSmartListsDataView smartListsFromSmartListStorages:v15 accountStorages:v16 parentListStorages:v17 store:v18];
    v20 = [v19 firstObject];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)fetchCustomSmartListWithObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[REMSmartListsDataViewInvocation_fetchSmartList alloc] initWithSmartListType:@"com.apple.reminders.smartlist.custom" objectID:v6 createIfNeeded:0];

  id v8 = [(REMSmartListsDataView *)self store];
  objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  v11 = REMDynamicCast(v10, (uint64_t)v9);
  uint64_t v12 = [v11 smartListStorages];

  if (v12)
  {
    v13 = [v11 smartListStorages];
    v14 = [v11 accountStorages];
    v15 = [v11 parentListStorages];
    v16 = [(REMSmartListsDataView *)self store];
    v17 = +[REMSmartListsDataView smartListsFromSmartListStorages:v13 accountStorages:v14 parentListStorages:v15 store:v16];
    v18 = [v17 firstObject];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)fetchCustomSmartListsWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMSmartListsDataViewInvocation_fetchAllCustomSmartLists);
  id v6 = [(REMSmartListsDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = REMDynamicCast(v8, (uint64_t)v7);
  uint64_t v10 = [v9 smartListStorages];

  if (v10)
  {
    v11 = [v9 smartListStorages];
    uint64_t v12 = [v9 accountStorages];
    v13 = [v9 parentListStorages];
    v14 = [(REMSmartListsDataView *)self store];
    v15 = +[REMSmartListsDataView smartListsFromSmartListStorages:v11 accountStorages:v12 parentListStorages:v13 store:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)fetchCustomSmartListsInAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 capabilities];
  char v8 = [v7 supportsCustomSmartLists];

  if (v8)
  {
    objc_super v9 = [REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount alloc];
    uint64_t v10 = [v6 objectID];
    v11 = [(REMSmartListsDataViewInvocation_fetchCustomSmartListsInAccount *)v9 initWithParentAccountObjectID:v10];

    uint64_t v12 = [(REMSmartListsDataView *)self store];
    v13 = [v12 resultFromPerformingInvocation:v11 error:a4];

    uint64_t v14 = objc_opt_class();
    v15 = REMDynamicCast(v14, (uint64_t)v13);
    v16 = [v15 smartListStorages];

    if (v16)
    {
      v17 = [v15 smartListStorages];
      v18 = [v15 accountStorages];
      v19 = [v15 parentListStorages];
      v20 = [(REMSmartListsDataView *)self store];
      v21 = +[REMSmartListsDataView smartListsFromSmartListStorages:v17 accountStorages:v18 parentListStorages:v19 store:v20];
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v22 = +[REMLogStore read];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[REMSmartListsDataView fetchCustomSmartListsInAccount:error:](v6);
    }

    v21 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v21;
}

- (id)fetchCustomSmartListsInGroup:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 account];
  char v8 = [v7 capabilities];
  char v9 = [v8 supportsCustomSmartLists];

  if (v9)
  {
    uint64_t v10 = [REMSmartListsDataViewInvocation_fetchCustomSmartListsInGroup alloc];
    v11 = [v6 objectID];
    uint64_t v12 = [(REMSmartListsDataViewInvocation_fetchCustomSmartListsInGroup *)v10 initWithParentGroupObjectID:v11];

    v13 = [(REMSmartListsDataView *)self store];
    uint64_t v14 = [v13 resultFromPerformingInvocation:v12 error:a4];

    uint64_t v15 = objc_opt_class();
    v16 = REMDynamicCast(v15, (uint64_t)v14);
    v17 = [v16 smartListStorages];

    if (v17)
    {
      v18 = [v16 smartListStorages];
      v19 = [v16 accountStorages];
      v20 = [v16 parentListStorages];
      v21 = [(REMSmartListsDataView *)self store];
      v22 = +[REMSmartListsDataView smartListsFromSmartListStorages:v18 accountStorages:v19 parentListStorages:v20 store:v21];
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v23 = +[REMLogStore read];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[REMSmartListsDataView fetchCustomSmartListsInGroup:error:](v6);
    }

    v22 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v22;
}

+ (id)smartListsFromSmartListStorages:(id)a3 accountStorages:(id)a4 parentListStorages:(id)a5 store:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v31 = a4;
  id v30 = a5;
  id v10 = a6;
  id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v16 = [v15 remObjectID];
        v17 = [v31 objectForKey:v16];

        v18 = [v15 remObjectID];
        v19 = [v30 objectForKey:v18];

        v20 = [v15 smartListType];
        int v21 = [v20 isEqualToString:@"com.apple.reminders.smartlist.custom"];

        if (v21) {
          BOOL v22 = v17 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (v22)
        {
          v23 = [[REMSmartList alloc] initWithStore:v10 storage:v15];
          [v29 addObject:v23];
        }
        else
        {
          v24 = [[REMAccount alloc] initWithStore:v10 storage:v17];
          v23 = (REMSmartList *)v24;
          if (v19) {
            v25 = [[REMList alloc] initWithStore:v10 account:v24 storage:v19];
          }
          else {
            v25 = 0;
          }
          v26 = [[REMSmartList alloc] initWithStore:v10 account:v23 parentList:v25 storage:v15];
          [v29 addObject:v26];
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }

  return v29;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

- (void)fetchCustomSmartListsInAccount:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "The given account does not support CSL fetching {accountID: %{public}@}", v4, v5, v6, v7, 2u);
}

- (void)fetchCustomSmartListsInGroup:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 objectID];
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "The given group is not from an account that supports CSL fetching {groupID: %{public}@}", v4, v5, v6, v7, 2u);
}

@end