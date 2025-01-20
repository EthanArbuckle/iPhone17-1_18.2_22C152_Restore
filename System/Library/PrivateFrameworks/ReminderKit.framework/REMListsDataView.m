@interface REMListsDataView
+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5;
+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5 requestedExternalIdentifiers:(id)a6;
+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5 requestedListIDs:(id)a6;
+ (id)listsFromAccounts:(id)a3 listStorages:(id)a4 store:(id)a5;
- (REMListsDataView)initWithStore:(id)a3;
- (REMStore)store;
- (id)debugFetchPhantomListsWithError:(id *)a3;
- (id)fetchAllListsWithExternalIdentifier:(id)a3 inAccount:(id)a4 error:(id *)a5;
- (id)fetchDefaultListRequiringCloudKitWithAccountID:(id)a3 error:(id *)a4;
- (id)fetchDefaultListWithError:(id *)a3;
- (id)fetchEligibleDefaultListsWithError:(id *)a3;
- (id)fetchListIncludingConcealedWithObjectID:(id)a3 includeMarkedForDeletionOnly:(BOOL)a4 error:(id *)a5;
- (id)fetchListIncludingSpecialContainerWithExternalIdentifier:(id)a3 inAccount:(id)a4 error:(id *)a5;
- (id)fetchListIncludingSpecialContainerWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListRepresentationOfTemplateWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListWithObjectID:(id)a3 error:(id *)a4;
- (id)fetchListsAndSublistsInAccount:(id)a3 error:(id *)a4;
- (id)fetchListsInAccount:(id)a3 error:(id *)a4;
- (id)fetchListsInGroup:(id)a3 error:(id *)a4;
- (id)fetchListsIncludingSpecialContainersInAccount:(id)a3 error:(id *)a4;
- (id)fetchListsIncludingSpecialContainersWithObjectIDs:(id)a3 error:(id *)a4;
- (id)fetchListsWithExternalIdentifiers:(id)a3 inAccount:(id)a4 error:(id *)a5;
- (id)fetchListsWithObjectIDs:(id)a3 error:(id *)a4;
@end

@implementation REMListsDataView

- (REMListsDataView)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListsDataView;
  v6 = [(REMListsDataView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

- (id)fetchListsWithObjectIDs:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    v7 = [[REMListsDataViewInvocation_fetchByObjectIDs alloc] initWithObjectIDs:v6];
    v8 = [(REMListsDataView *)self store];
    objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

    uint64_t v10 = objc_opt_class();
    v11 = REMDynamicCast(v10, (uint64_t)v9);
    v12 = [v11 accountStorages];
    v13 = [v11 listStorages];
    v14 = [(REMListsDataView *)self store];
    v15 = +[REMListsDataView listsFromAccountStorages:v12 listStorages:v13 store:v14 requestedListIDs:v6];

    if (v15)
    {
      v25 = v9;
      v26 = v7;
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v23 = objc_msgSend(v22, "objectID", v25, v26, (void)v27);
            [v16 setObject:v22 forKeyedSubscript:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v19);
      }

      objc_super v9 = v25;
      v7 = v26;
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v16;
}

- (void).cxx_destruct
{
}

- (id)fetchListsInAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [REMListsDataViewInvocation_fetchListsInAccount alloc];
  v8 = [v6 objectID];

  objc_super v9 = [(REMListsDataViewInvocation_fetchListsInAccount *)v7 initWithParentAccountObjectID:v8];
  uint64_t v10 = [(REMListsDataView *)self store];
  v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

  uint64_t v12 = objc_opt_class();
  v13 = REMDynamicCast(v12, (uint64_t)v11);
  v14 = [v13 accountStorages];
  v15 = [v13 listStorages];
  v16 = [(REMListsDataView *)self store];
  id v17 = [v13 objectIDs];
  uint64_t v18 = +[REMListsDataView listsFromAccountStorages:v14 listStorages:v15 store:v16 requestedListIDs:v17];

  return v18;
}

- (id)fetchListsAndSublistsInAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [REMListsDataViewInvocation_fetchListsAndSublistsInAccount alloc];
  v8 = [v6 objectID];

  objc_super v9 = [(REMListsDataViewInvocation_fetchListsAndSublistsInAccount *)v7 initWithParentAccountObjectID:v8];
  uint64_t v10 = [(REMListsDataView *)self store];
  v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

  uint64_t v12 = objc_opt_class();
  v13 = REMDynamicCast(v12, (uint64_t)v11);
  v14 = [v13 accountStorages];
  v15 = [v13 listStorages];
  v16 = [(REMListsDataView *)self store];
  id v17 = [v13 objectIDs];
  uint64_t v18 = +[REMListsDataView listsFromAccountStorages:v14 listStorages:v15 store:v16 requestedListIDs:v17];

  return v18;
}

- (id)fetchListsInGroup:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [REMListsDataViewInvocation_fetchListsInGroup alloc];
  v8 = [v6 objectID];

  objc_super v9 = [(REMListsDataViewInvocation_fetchListsInGroup *)v7 initWithParentGroupObjectID:v8];
  uint64_t v10 = [(REMListsDataView *)self store];
  v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

  uint64_t v12 = objc_opt_class();
  v13 = REMDynamicCast(v12, (uint64_t)v11);
  v14 = [v13 accountStorages];
  v15 = [v13 listStorages];
  v16 = [(REMListsDataView *)self store];
  id v17 = [v13 objectIDs];
  uint64_t v18 = +[REMListsDataView listsFromAccountStorages:v14 listStorages:v15 store:v16 requestedListIDs:v17];

  return v18;
}

- (id)fetchListWithObjectID:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v12[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v8 = [(REMListsDataView *)self fetchListsWithObjectIDs:v7 error:a4];

  if (!v8) {
    goto LABEL_7;
  }
  objc_super v9 = [v8 objectForKeyedSubscript:v6];
  if (v9) {
    goto LABEL_8;
  }
  uint64_t v10 = +[REMLogStore read];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[REMListsDataView fetchListWithObjectID:error:]((uint64_t)v6, v10);
  }

  if (a4)
  {
    +[REMError noSuchObjectErrorWithObjectID:v6];
    objc_super v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    objc_super v9 = 0;
  }
LABEL_8:

  return v9;
}

- (id)fetchEligibleDefaultListsWithError:(id *)a3
{
  id v5 = [(REMListsDataView *)self store];
  BOOL v6 = [v5 mode] == 4599;

  v7 = [[REMListsDataViewInvocation_fetchUserSelectableDefaultLists alloc] initWithDebugUseInMemoryPreferredDefaultListStorage:v6];
  v8 = [(REMListsDataView *)self store];
  objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a3];

  uint64_t v10 = objc_opt_class();
  v11 = REMDynamicCast(v10, (uint64_t)v9);
  uint64_t v12 = [v11 accountStorages];
  v13 = [v11 listStorages];
  v14 = [(REMListsDataView *)self store];
  v15 = [v11 objectIDs];
  v16 = +[REMListsDataView listsFromAccountStorages:v12 listStorages:v13 store:v14 requestedListIDs:v15];

  return v16;
}

- (id)fetchDefaultListWithError:(id *)a3
{
  id v5 = [(REMListsDataView *)self store];
  BOOL v6 = [v5 mode] == 4599;

  v7 = [[REMListsDataViewInvocation_fetchDefaultList alloc] initWithDebugUseInMemoryPreferredDefaultListStorage:v6];
  v8 = [(REMListsDataView *)self store];
  objc_super v9 = [v8 resultFromPerformingInvocation:v7 error:a3];

  uint64_t v10 = objc_opt_class();
  v11 = REMDynamicCast(v10, (uint64_t)v9);
  uint64_t v12 = [v11 accountStorages];
  v13 = [v11 listStorages];
  v14 = [(REMListsDataView *)self store];
  v15 = [v11 objectIDs];
  v16 = +[REMListsDataView listsFromAccountStorages:v12 listStorages:v13 store:v14 requestedListIDs:v15];

  id v17 = [v16 firstObject];

  return v17;
}

- (id)fetchDefaultListRequiringCloudKitWithAccountID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(REMListsDataView *)self store];
  BOOL v8 = [v7 mode] == 4599;

  objc_super v9 = [[REMListsDataViewInvocation_fetchDefaultListRequiringCloudKit alloc] initWithAccountObjectID:v6 debugUseInMemoryPreferredDefaultListStorage:v8];
  uint64_t v10 = [(REMListsDataView *)self store];
  v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

  uint64_t v12 = objc_opt_class();
  v13 = REMDynamicCast(v12, (uint64_t)v11);
  v14 = [v13 accountStorages];
  v15 = [v13 listStorages];
  v16 = [(REMListsDataView *)self store];
  id v17 = [v13 objectIDs];
  uint64_t v18 = +[REMListsDataView listsFromAccountStorages:v14 listStorages:v15 store:v16 requestedListIDs:v17];

  uint64_t v19 = [v18 firstObject];

  return v19;
}

- (id)debugFetchPhantomListsWithError:(id *)a3
{
  id v5 = objc_alloc_init(REMListsDataViewInvocation_debugFetchPhantomLists);
  id v6 = [(REMListsDataView *)self store];
  v7 = [v6 resultFromPerformingInvocation:v5 error:a3];

  uint64_t v8 = objc_opt_class();
  objc_super v9 = REMDynamicCast(v8, (uint64_t)v7);
  uint64_t v10 = [v9 accountStorages];
  v11 = [v9 listStorages];
  uint64_t v12 = [(REMListsDataView *)self store];
  v13 = [v9 objectIDs];
  v14 = +[REMListsDataView listsFromAccountStorages:v10 listStorages:v11 store:v12 requestedListIDs:v13];

  return v14;
}

+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5 requestedListIDs:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  uint64_t v10 = +[REMListsDataView listsFromAccountStorages:a3 listStorages:a4 store:a5];
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(v10, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
          if (v17) {
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5 requestedExternalIdentifiers:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  uint64_t v10 = +[REMListsDataView listsFromAccountStorages:a3 listStorages:a4 store:a5];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 allValues];
    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
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
          long long v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v20 = [v19 externalIdentifier];
          if (v20) {
            [v13 setObject:v19 forKeyedSubscript:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v16);
    }

    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = objc_msgSend(v13, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * j), (void)v29);
          if (v27) {
            [v21 addObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v24);
    }
  }
  else
  {
    long long v21 = 0;
  }

  return v21;
}

+ (id)listsFromAccounts:(id)a3 listStorages:(id)a4 store:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v30 = v7;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "accountID", v30);
          uint64_t v17 = [v31 objectForKeyedSubscript:v16];

          uint64_t v18 = [[REMList alloc] initWithStore:v8 account:v17 storage:v15];
          long long v19 = [(REMList *)v18 objectID];
          [v9 setObject:v18 forKeyedSubscript:v19];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v12);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v20 = [v9 allKeys];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = objc_msgSend(v9, "objectForKeyedSubscript:", *(void *)(*((void *)&v32 + 1) + 8 * j), v30);
          v26 = [v25 storage];
          long long v27 = [v26 parentListID];

          if (v27)
          {
            long long v28 = [v9 objectForKeyedSubscript:v27];
            [v25 setParentList:v28];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v22);
    }

    id v7 = v30;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)listsFromAccountStorages:(id)a3 listStorages:(id)a4 store:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[REMAccountsDataView accountsFromAccountStorages:a3 store:v7];
  id v10 = +[REMListsDataView listsFromAccounts:v9 listStorages:v8 store:v7];

  return v10;
}

- (REMStore)store
{
  return self->_store;
}

- (id)fetchListsIncludingSpecialContainersInAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [REMListsDataViewInvocation_dataAccessFetchListsInAccount alloc];
  id v8 = [v6 objectID];

  id v9 = [(REMListsDataViewInvocation_dataAccessFetchListsInAccount *)v7 initWithParentAccountObjectID:v8];
  id v10 = [(REMListsDataView *)self store];
  uint64_t v11 = [v10 resultFromPerformingInvocation:v9 error:a4];

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = REMDynamicCast(v12, (uint64_t)v11);
  id v14 = [v13 accountStorages];
  uint64_t v15 = [v13 listStorages];
  uint64_t v16 = [(REMListsDataView *)self store];
  uint64_t v17 = +[REMListsDataView listsFromAccountStorages:v14 listStorages:v15 store:v16];

  return v17;
}

- (id)fetchListIncludingSpecialContainerWithObjectID:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v14[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v8 = [(REMListsDataView *)self fetchListsIncludingSpecialContainersWithObjectIDs:v7 error:a4];

  if (!v8) {
    goto LABEL_7;
  }
  id v9 = [v8 objectForKeyedSubscript:v6];
  if (v9) {
    goto LABEL_8;
  }
  id v10 = +[REMLogStore read];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_1B9AA2000, v10, OS_LOG_TYPE_DEFAULT, "REMListsDataView: Requested to fetch non-existent list {objectID: %{public}@}", (uint8_t *)&v12, 0xCu);
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

- (id)fetchListsIncludingSpecialContainersWithObjectIDs:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [[REMListsDataViewInvocation_dataAccessFetchByObjectID alloc] initWithObjectIDs:v6];
  id v8 = [(REMListsDataView *)self store];
  id v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = REMDynamicCast(v10, (uint64_t)v9);
  int v12 = [v11 accountStorages];
  id v13 = [v11 listStorages];
  id v14 = [(REMListsDataView *)self store];
  uint64_t v15 = +[REMListsDataView listsFromAccountStorages:v12 listStorages:v13 store:v14 requestedListIDs:v6];

  if (v15)
  {
    uint64_t v25 = v9;
    v26 = v7;
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v23 = objc_msgSend(v22, "objectID", v25, v26, (void)v27);
          [v16 setObject:v22 forKeyedSubscript:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v19);
    }

    id v9 = v25;
    id v7 = v26;
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)fetchListIncludingSpecialContainerWithExternalIdentifier:(id)a3 inAccount:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v18[0] = v8;
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a4;
  uint64_t v11 = [v9 arrayWithObjects:v18 count:1];
  int v12 = [(REMListsDataView *)self fetchListsWithExternalIdentifiers:v11 inAccount:v10 error:a5];

  if (!v12) {
    goto LABEL_7;
  }
  id v13 = [v12 objectForKeyedSubscript:v8];
  if (v13) {
    goto LABEL_8;
  }
  id v14 = +[REMLogStore read];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v8;
    _os_log_impl(&dword_1B9AA2000, v14, OS_LOG_TYPE_DEFAULT, "REMListsDataView: Requested to fetch non-existent list {externalIdentifier: %{public}@}", (uint8_t *)&v16, 0xCu);
  }

  if (a5)
  {
    +[REMError noSuchObjectErrorWithExternalIdentifier:v8];
    id v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    id v13 = 0;
  }
LABEL_8:

  return v13;
}

- (id)fetchListsWithExternalIdentifiers:(id)a3 inAccount:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier alloc];
  uint64_t v11 = [v9 objectID];
  int v12 = [(REMListsDataViewInvocation_dataAccessFetchByExternalIdentifier *)v10 initWithExternalIdentifiers:v8 accountObjectID:v11];

  id v13 = [(REMListsDataView *)self store];
  id v14 = [v13 resultFromPerformingInvocation:v12 error:a5];

  uint64_t v15 = objc_opt_class();
  int v16 = REMDynamicCast(v15, (uint64_t)v14);
  id v17 = [v16 accountStorages];
  uint64_t v18 = [v16 listStorages];
  uint64_t v19 = [(REMListsDataView *)self store];
  uint64_t v20 = +[REMListsDataView listsFromAccountStorages:v17 listStorages:v18 store:v19 requestedExternalIdentifiers:v8];

  if (v20)
  {
    long long v30 = v14;
    id v31 = v12;
    id v32 = v9;
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v20, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v22 = v20;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v28 = [v27 externalIdentifier];
          [v21 setObject:v27 forKeyedSubscript:v28];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v24);
    }

    int v12 = v31;
    id v9 = v32;
    id v14 = v30;
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (id)fetchListIncludingConcealedWithObjectID:(id)a3 includeMarkedForDeletionOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed alloc];
  v46[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  uint64_t v11 = [(REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *)v9 initWithObjectIDs:v10];

  [(REMListsDataViewInvocation_changeTrackingFetchByObjectIDIncludingConcealed *)v11 setIncludeMarkedForDeletionOnly:v6];
  int v12 = [(REMListsDataView *)self store];
  long long v37 = a5;
  id v13 = [v12 resultFromPerformingInvocation:v11 error:a5];

  uint64_t v14 = objc_opt_class();
  uint64_t v15 = REMDynamicCast(v14, (uint64_t)v13);
  int v16 = [v15 accountStorages];
  id v17 = [v15 listStorages];
  uint64_t v18 = [(REMListsDataView *)self store];
  id v45 = v8;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  uint64_t v20 = +[REMListsDataView listsFromAccountStorages:v16 listStorages:v17 store:v18 requestedListIDs:v19];

  if (!v20) {
    goto LABEL_18;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (!v22)
  {

    goto LABEL_14;
  }
  uint64_t v23 = v22;
  long long v34 = v15;
  long long v35 = v13;
  long long v36 = v11;
  uint64_t v24 = 0;
  uint64_t v25 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v23; ++i)
    {
      if (*(void *)v39 != v25) {
        objc_enumerationMutation(v21);
      }
      long long v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      long long v28 = objc_msgSend(v27, "objectID", v34, v35, v36);
      int v29 = [v28 isEqual:v8];

      if (v29)
      {
        id v30 = v27;

        uint64_t v24 = v30;
      }
    }
    uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v44 count:16];
  }
  while (v23);

  id v13 = v35;
  uint64_t v11 = v36;
  uint64_t v15 = v34;
  if (!v24)
  {
LABEL_14:
    id v31 = +[REMLogStore read];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v8;
      _os_log_impl(&dword_1B9AA2000, v31, OS_LOG_TYPE_DEFAULT, "REMListsDataView: Requested to fetch non-existent list {objectID: %{public}@}", buf, 0xCu);
    }

    if (v37)
    {
      +[REMError noSuchObjectErrorWithObjectID:v8];
      uint64_t v24 = 0;
      *long long v37 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v24 = 0;
  }
LABEL_19:
  id v32 = v24;

  return v32;
}

- (id)fetchAllListsWithExternalIdentifier:(id)a3 inAccount:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [REMListsDataViewInvocation_userActivityFetchByExternalIdentifier alloc];
  long long v28 = v9;
  uint64_t v11 = [v9 objectID];
  int v12 = [(REMListsDataViewInvocation_userActivityFetchByExternalIdentifier *)v10 initWithExternalIdentifier:v8 accountObjectID:v11];

  id v13 = [(REMListsDataView *)self store];
  uint64_t v14 = [v13 resultFromPerformingInvocation:v12 error:a5];

  uint64_t v15 = objc_opt_class();
  int v16 = REMDynamicCast(v15, (uint64_t)v14);
  id v17 = [v16 accountStorages];
  uint64_t v18 = [v16 listStorages];
  uint64_t v19 = [(REMListsDataView *)self store];
  uint64_t v20 = +[REMListsDataView listsFromAccountStorages:v17 listStorages:v18 store:v19];

  id v21 = [v20 allValues];
  uint64_t v22 = v21;
  if (v21 && [v21 count])
  {
    id v23 = v22;
    uint64_t v24 = v28;
  }
  else
  {
    uint64_t v25 = +[REMLogStore read];
    uint64_t v24 = v28;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v28 remObjectID];
      *(_DWORD *)buf = 138543618;
      id v30 = v8;
      __int16 v31 = 2114;
      id v32 = v26;
      _os_log_impl(&dword_1B9AA2000, v25, OS_LOG_TYPE_DEFAULT, "REMListsDataView: Requested to fetch non-existent lists in account with {externalIdentifier: %{public}@, account.remObjectID: %{public}@}", buf, 0x16u);
    }
    if (a5)
    {
      +[REMError noSuchObjectErrorWithExternalIdentifier:v8];
      id v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = 0;
    }
  }

  return v23;
}

- (id)fetchListRepresentationOfTemplateWithObjectID:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [[REMListsDataViewInvocation_fetchByTemplateObjectID alloc] initWithTemplateObjectID:v6];
  id v8 = [(REMListsDataView *)self store];
  long long v28 = a4;
  int v29 = v7;
  id v9 = [v8 resultFromPerformingInvocation:v7 error:a4];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = REMDynamicCast(v10, (uint64_t)v9);
  int v12 = [v11 accountStorages];
  id v13 = [v11 listStorages];
  uint64_t v14 = [(REMListsDataView *)self store];
  v35[0] = v6;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  int v16 = +[REMListsDataView listsFromAccountStorages:v12 listStorages:v13 store:v14 requestedListIDs:v15];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v23 = [v22 objectID];
        char v24 = [v23 isEqual:v6];

        if (v24)
        {
          id v26 = v22;

          goto LABEL_14;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  if (v28)
  {
    uint64_t v25 = +[REMLogStore read];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[REMListsDataView(Templates) fetchListRepresentationOfTemplateWithObjectID:error:]((uint64_t)v6, v25);
    }

    +[REMError noSuchObjectErrorWithObjectID:v6];
    id v26 = 0;
    *long long v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v26 = 0;
  }
LABEL_14:

  return v26;
}

- (void)fetchListWithObjectID:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "REMListsDataView: Requested to fetch non-existent list {objectID: %{public}@}", (uint8_t *)&v2, 0xCu);
}

@end