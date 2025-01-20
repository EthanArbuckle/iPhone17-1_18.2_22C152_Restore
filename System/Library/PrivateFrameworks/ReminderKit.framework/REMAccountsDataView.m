@interface REMAccountsDataView
+ (id)accountsFromAccountStorages:(id)a3 store:(id)a4;
- (REMAccountsDataView)initWithStore:(id)a3;
- (REMStore)store;
- (id)accountsFromStorages:(id)a3;
- (id)fetchAccountWithExternalIdentifier:(id)a3 error:(id *)a4;
- (id)fetchAccountWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchAccountsWithExternalIdentifiers:(id)a3 error:(id *)a4;
- (id)fetchAccountsWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchActiveCloudKitAccountObjectIDsWithFetchOption:(int64_t)a3 error:(id *)a4;
- (id)fetchAllAccountsForAccountManagementWithError:(id *)a3;
- (id)fetchAllAccountsForDumpingWithError:(id *)a3;
- (id)fetchAllAccountsWithError:(id *)a3;
- (id)fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:(id *)a3;
- (id)fetchPrimaryActiveCloudKitAccountWithError:(id *)a3;
@end

@implementation REMAccountsDataView

- (REMAccountsDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAccountsDataView;
  v6 = [(REMAccountsDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchAllAccountsWithError:(id *)a3
{
  id v5 = [[REMAccountsDataViewInvocation_fetchAll alloc] initWithPurpose:0];
  v6 = [(REMAccountsDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = REMDynamicCast(v8, (uint64_t)v7);
  v10 = [v9 accountStorages];
  v11 = [(REMAccountsDataView *)self accountsFromStorages:v10];

  return v11;
}

- (id)fetchAllAccountsForAccountManagementWithError:(id *)a3
{
  id v5 = [[REMAccountsDataViewInvocation_fetchAll alloc] initWithPurpose:1];
  v6 = [(REMAccountsDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = REMDynamicCast(v8, (uint64_t)v7);
  v10 = [v9 accountStorages];
  v11 = [(REMAccountsDataView *)self accountsFromStorages:v10];

  return v11;
}

- (id)fetchAllAccountsForDumpingWithError:(id *)a3
{
  id v5 = [[REMAccountsDataViewInvocation_fetchAll alloc] initWithPurpose:2];
  v6 = [(REMAccountsDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = REMDynamicCast(v8, (uint64_t)v7);
  v10 = [v9 accountStorages];
  v11 = [(REMAccountsDataView *)self accountsFromStorages:v10];

  return v11;
}

- (id)fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:(id *)a3
{
  id v5 = [[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount alloc] initWithFetchREMObjectIDOnly:1];
  v6 = [(REMAccountsDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = REMDynamicCast(v8, (uint64_t)v7);
  v10 = [v9 accountIDs];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [v9 accountIDs];
    unint64_t v13 = [v12 count];

    if (v13 >= 2)
    {
      v17 = +[REMLogStore read];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:](v9);
      }
    }
    v14 = [v9 accountIDs];
    v15 = [v14 firstObject];
  }
  else if (a3)
  {
    +[REMError noPrimaryActiveCloudKitAccountError];
    v15 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)fetchPrimaryActiveCloudKitAccountWithError:(id *)a3
{
  id v5 = [[REMAccountsDataViewInvocation_fetchPrimaryActiveCloudKitAccount alloc] initWithFetchREMObjectIDOnly:0];
  v6 = [(REMAccountsDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = REMDynamicCast(v8, (uint64_t)v7);
  v10 = [v9 accountStorages];
  uint64_t v11 = [(REMAccountsDataView *)self accountsFromStorages:v10];

  if ([v11 count])
  {
    if ((unint64_t)[v11 count] >= 2)
    {
      v14 = +[REMLogStore read];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[REMAccountsDataView fetchPrimaryActiveCloudKitAccountWithError:](v11);
      }
    }
    v12 = [v11 firstObject];
  }
  else if (a3)
  {
    +[REMError noPrimaryActiveCloudKitAccountError];
    v12 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)fetchActiveCloudKitAccountObjectIDsWithFetchOption:(int64_t)a3 error:(id *)a4
{
  v6 = [[REMAccountsDataViewInvocation_fetchActiveCloudKitAccountObjectIDs alloc] initWithFetchOption:a3];
  v7 = [(REMAccountsDataView *)self store];
  id v17 = 0;
  uint64_t v8 = [v7 resultFromPerformingInvocation:v6 error:&v17];
  id v9 = v17;

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = REMDynamicCast(v10, (uint64_t)v8);
  v12 = [v11 accountIDs];

  if (v12) {
    BOOL v13 = v9 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    v15 = [v11 accountIDs];
  }
  else if (a4)
  {
    if (v9)
    {
      id v14 = v9;
    }
    else
    {
      id v14 = +[REMError internalErrorWithDebugDescription:@"Unknown error in fetchActiveCloudKitAccountObjectIDsWithOption yielding nil fetchResult.accountIDs"];
    }
    v15 = 0;
    *a4 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)fetchAccountWithObjectID:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v8 = [(REMAccountsDataView *)self fetchAccountsWithObjectIDs:v7 error:a4];

  if (!v8) {
    goto LABEL_7;
  }
  id v9 = [v8 objectForKeyedSubscript:v6];
  if (v9) {
    goto LABEL_8;
  }
  uint64_t v10 = +[REMLogStore read];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "REMAccountsDataView: Requested to fetch non-existent account {objectID: %{public}@}", (uint8_t *)&v12, 0xCu);
  }

  if (a4)
  {
    +[REMError noSuchObjectErrorWithObjectID:v6];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    id v9 = 0;
  }
LABEL_8:

  return v9;
}

- (id)fetchAccountsWithObjectIDs:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    v7 = [[REMAccountsDataViewInvocation_fetchByObjectID alloc] initWithObjectIDs:v6];
    uint64_t v8 = [(REMAccountsDataView *)self store];
    id v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = REMDynamicCast(v10, (uint64_t)v9);
    int v12 = [v11 accountStorages];
    id v13 = [(REMAccountsDataView *)self accountsFromStorages:v12];

    if (v13)
    {
      v23 = v9;
      v24 = v7;
      id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v21 = objc_msgSend(v20, "objectID", v23, v24, (void)v25);
            [v14 setObject:v20 forKeyedSubscript:v21];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);
      }

      id v9 = v23;
      v7 = v24;
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v14;
}

- (id)fetchAccountWithExternalIdentifier:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v8 = [(REMAccountsDataView *)self fetchAccountsWithExternalIdentifiers:v7 error:a4];

  if (!v8) {
    goto LABEL_7;
  }
  id v9 = [v8 objectForKeyedSubscript:v6];
  if (v9) {
    goto LABEL_8;
  }
  uint64_t v10 = +[REMLogStore read];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "REMAccountsDataView: Requested to fetch non-existent account {externalIdentifier: %{public}@}", (uint8_t *)&v12, 0xCu);
  }

  if (a4)
  {
    +[REMError noSuchObjectErrorWithExternalIdentifier:v6];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    id v9 = 0;
  }
LABEL_8:

  return v9;
}

- (id)fetchAccountsWithExternalIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [[REMAccountsDataViewInvocation_fetchByExternalIdentifier alloc] initWithExternalIdentifiers:v6];
  uint64_t v8 = [(REMAccountsDataView *)self store];
  id v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = REMDynamicCast(v10, (uint64_t)v9);
  int v12 = [v11 accountStorages];
  id v13 = [(REMAccountsDataView *)self accountsFromStorages:v12];

  if (!v13)
  {
    id v14 = 0;
    goto LABEL_24;
  }
  uint64_t v30 = v11;
  v31 = v9;
  v32 = v7;
  v33 = v6;
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v29 = v13;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (!v16) {
    goto LABEL_17;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v36 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      v21 = objc_msgSend(v20, "externalIdentifier", v29);
      if (!v21)
      {
        v23 = +[REMLogStore read];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          [(REMAccountsDataView *)v45 fetchAccountsWithExternalIdentifiers:&v46 error:v23];
        }
        goto LABEL_13;
      }
      v22 = [v14 objectForKeyedSubscript:v21];

      if (v22)
      {
        v23 = +[REMLogStore read];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v34 = [v14 objectForKeyedSubscript:v21];
          v24 = [v34 remObjectID];
          long long v25 = [v20 remObjectID];
          *(_DWORD *)buf = 138412802;
          v40 = v21;
          __int16 v41 = 2112;
          v42 = v24;
          __int16 v43 = 2112;
          v44 = v25;
          _os_log_error_impl(&dword_1B9AA2000, v23, OS_LOG_TYPE_ERROR, "REMAccountsDataView -fetchAccountsWithExternalIdentifiers: More than 1 account found for the given external identifier {extID: %@, acctObjID1: %@, acctObjID2: %@}.", buf, 0x20u);
        }
LABEL_13:

        goto LABEL_15;
      }
      [v14 setObject:v20 forKeyedSubscript:v21];
LABEL_15:
    }
    uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v47 count:16];
  }
  while (v17);
LABEL_17:

  unint64_t v26 = [v15 count];
  id v6 = v33;
  if (v26 <= [v33 count])
  {
    id v9 = v31;
    v7 = v32;
    uint64_t v11 = v30;
  }
  else
  {
    long long v27 = +[REMLogStore read];
    uint64_t v11 = v30;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[REMAccountsDataView fetchAccountsWithExternalIdentifiers:error:](v33, v15, v27);
    }

    id v9 = v31;
    v7 = v32;
  }
  id v13 = v29;
LABEL_24:

  return v14;
}

- (id)accountsFromStorages:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          int v12 = [REMAccount alloc];
          id v13 = [(REMAccountsDataView *)self store];
          id v14 = [(REMAccount *)v12 initWithStore:v13 storage:v11];

          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    id v4 = v16;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)accountsFromAccountStorages:(id)a3 store:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          id v14 = [REMAccount alloc];
          id v15 = -[REMAccount initWithStore:storage:](v14, "initWithStore:storage:", v6, v13, (void)v18);
          id v16 = [(REMAccount *)v15 objectID];
          [v7 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
}

- (void)fetchPrimaryActiveCloudKitAccountREMObjectIDWithError:(void *)a1 .cold.1(void *a1)
{
  v1 = NSNumber;
  v2 = [a1 accountIDs];
  v3 = objc_msgSend(v1, "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v4, v5, "rem_log_fault_if (fetchResult.accountIDs.count > 1) -- Unexpectedly fetched more than 1 primary active cloudkit account REMObjectID {count: %@}", v6, v7, v8, v9, 2u);
}

- (void)fetchPrimaryActiveCloudKitAccountWithError:(void *)a1 .cold.1(void *a1)
{
  v1 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  OUTLINED_FUNCTION_4(&dword_1B9AA2000, v2, v3, "rem_log_fault_if (accounts.count > 1) -- Unexpectedly fetched more than 1 primary active cloudkit account {count: %@}", v4, v5, v6, v7, 2u);
}

- (void)fetchAccountsWithExternalIdentifiers:(NSObject *)a3 error:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_fault_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_FAULT, "REMAccountsDataView -fetchAccountsWithExternalIdentifiers: fetched more accounts than the number of external identifiers {expected: %@, actual: %@}.", (uint8_t *)&v7, 0x16u);
}

- (void)fetchAccountsWithExternalIdentifiers:(void *)a3 error:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  int v7 = [a2 remObjectID];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1B9AA2000, a4, OS_LOG_TYPE_ERROR, "Request results with account without externalIdentifier {objectID: %@}", a1, 0xCu);
}

@end