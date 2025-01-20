@interface STGenesisStateReactorCoreComponent
+ (id)updateExpiredAwaitingResponseFamilyMemberGenesisStateItemsToPending:(id)a3;
+ (id)updateFamilyMemberGenesisStateItems:(id)a3 receivedMessage:(id)a4;
+ (id)updateFamilyMemberGenesisStateItems:(id)a3 targetableFamilyMembers:(id)a4;
+ (id)updatePendingFamilyMemberGenesisStateItemsToAwaitingResponse:(id)a3;
@end

@implementation STGenesisStateReactorCoreComponent

+ (id)updateFamilyMemberGenesisStateItems:(id)a3 receivedMessage:(id)a4
{
  id v5 = a3;
  v6 = [a4 returnAddress];
  v7 = [v6 userDSID];

  v8 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "userID", (void)v21);
        v16 = [v15 dsid];
        unsigned int v17 = [v16 isEqualToNumber:v7];

        if (v17)
        {
          uint64_t v18 = [v14 itemWithUpdatedState:2];

          id v14 = (id)v18;
        }
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  id v19 = [v8 copy];
  return v19;
}

+ (id)updateFamilyMemberGenesisStateItems:(id)a3 targetableFamilyMembers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000406DC;
  v26[3] = &unk_1002FC928;
  id v8 = (id)objc_opt_new();
  id v27 = v8;
  [v5 enumerateObjectsUsingBlock:v26];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v14 isSignedInMember] & 1) == 0)
        {
          v15 = [v14 dsid];
          v16 = [v8 objectForKeyedSubscript:v15];

          if (!v16)
          {
            id v17 = objc_alloc((Class)STUserID);
            uint64_t v18 = [v14 dsid];
            id v19 = [v17 initWithDSID:v18];

            v16 = [[STFamilyMemberGenesisStateItem alloc] initWithUserID:v19 genesisState:0];
          }
          [v7 addObject:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }

  id v20 = [v7 copy];
  return v20;
}

+ (id)updatePendingFamilyMemberGenesisStateItemsToAwaitingResponse:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v10, "genesisState", (void)v14))
        {
          uint64_t v11 = [v10 itemWithUpdatedState:1];

          id v10 = (id)v11;
        }
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v4 copy];
  return v12;
}

+ (id)updateExpiredAwaitingResponseFamilyMemberGenesisStateItemsToPending:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138543362;
    long long v19 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = (STFamilyMemberGenesisStateItem *)*(id *)(*((void *)&v20 + 1) + 8 * i);
        if ((id)[(STFamilyMemberGenesisStateItem *)v11 genesisState] == (id)1
          && [(STFamilyMemberGenesisStateItem *)v11 expired])
        {
          id v12 = +[STLog familyMemberGenesisStateStore];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = [(STFamilyMemberGenesisStateItem *)v11 userID];
            *(_DWORD *)buf = v19;
            long long v25 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resetting expired state to pending for user: %{public}@", buf, 0xCu);
          }
          long long v14 = [STFamilyMemberGenesisStateItem alloc];
          long long v15 = [(STFamilyMemberGenesisStateItem *)v11 userID];
          long long v16 = [(STFamilyMemberGenesisStateItem *)v14 initWithUserID:v15 genesisState:0];

          uint64_t v11 = v16;
        }
        objc_msgSend(v4, "addObject:", v11, v19, (void)v20);
      }
      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  id v17 = [v4 copy];
  return v17;
}

@end