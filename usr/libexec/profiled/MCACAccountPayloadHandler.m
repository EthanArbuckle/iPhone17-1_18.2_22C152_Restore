@interface MCACAccountPayloadHandler
- (ACAccount)setAsideAccount;
- (BOOL)updatedOverInstalledAccount;
- (id)MCACAccountIdentifier;
- (id)_destructiveDataclassActionsForRemovalOfAccount:(id)a3;
- (id)_installedDAAccount;
- (id)_installedSetAsideACAccount;
- (id)accountTypeIdentifiers;
- (id)installedACAccounts;
- (id)installedAccountWithIdentifier:(id)a3;
- (id)unhashedAccountIdentifier;
- (void)_synchronouslyDeleteAccountAndAssociatedData:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)markIfUpdatingOverInstalledAccount:(id)a3;
- (void)setSetAsideAccount:(id)a3;
- (void)setUpdatedOverInstalledAccount:(BOOL)a3;
@end

@implementation MCACAccountPayloadHandler

- (id)installedAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(MCACAccountPayloadHandler *)self accountTypeIdentifiers];
  id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v27;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v27 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void *)(*((void *)&v26 + 1) + 8 * v5);
      v7 = sharedDAAccountStore();
      v8 = [v7 accountTypeWithAccountTypeIdentifier:v6];

      v9 = sharedDAAccountStore();
      v10 = [v9 accountsWithAccountType:v8];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v16 = [v15 identifier];
            unsigned int v17 = [v16 isEqualToString:v4];

            if (v17)
            {
              id v12 = v15;
              goto LABEL_16;
            }
          }
          id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      if (v12) {
        break;
      }
      if ((id)++v5 == v21)
      {
        id v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v21) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    id v12 = 0;
  }

  return v12;
}

- (void)markIfUpdatingOverInstalledAccount:(id)a3
{
  id v9 = a3;
  id v4 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v5 = [v4 userMode];

  uint64_t v6 = v9;
  if (v5 == 1)
  {
    v7 = [v9 identifier];
    v8 = [(MCACAccountPayloadHandler *)self installedAccountWithIdentifier:v7];

    if (v8) {
      [(MCACAccountPayloadHandler *)self setUpdatedOverInstalledAccount:1];
    }

    uint64_t v6 = v9;
  }
}

- (id)_destructiveDataclassActionsForRemovalOfAccount:(id)a3
{
  id v3 = a3;
  id v4 = sharedDAAccountStore();
  unsigned int v5 = [v4 dataclassActionsForAccountDeletion:v3];

  uint64_t v6 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "ACAccountStore returned the following actions for removal: %{public}@", buf, 0xCu);
  }
  if (v5)
  {
    id v25 = v3;
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v8 = [v5 allKeys];
    id v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    id v28 = v7;
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v34;
      uint64_t v26 = *(void *)v34;
      long long v27 = v8;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v14 = [v5 objectForKeyedSubscript:v13];
          if ([v14 count] == (id)1)
          {
            v15 = [v14 lastObject];
            [v7 setObject:v15 forKey:v13];
          }
          else if ((unint64_t)[v14 count] < 2)
          {
            long long v23 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v40 = v13;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to get possible actions for dataclass %{public}@ during account removal.", buf, 0xCu);
            }
          }
          else
          {
            v16 = v5;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v17 = v14;
            id v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v30;
              while (2)
              {
                for (j = 0; j != v19; j = (char *)j + 1)
                {
                  if (*(void *)v30 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  long long v22 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
                  if ([v22 isDestructive])
                  {
                    id v7 = v28;
                    [v28 setObject:v22 forKey:v13];

                    unsigned int v5 = v16;
                    goto LABEL_24;
                  }
                }
                id v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }

            unsigned int v5 = v16;
            id v7 = v28;
LABEL_24:
            uint64_t v11 = v26;
            v8 = v27;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }

    id v3 = v25;
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (void)_synchronouslyDeleteAccountAndAssociatedData:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MCACAccountPayloadHandler *)self _destructiveDataclassActionsForRemovalOfAccount:v8];
  uint64_t v11 = [v8 identifier];
  id v12 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting to remove account with identifier: %{public}@", buf, 0xCu);
  }
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
  v14 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FF30;
  block[3] = &unk_1000EAEC8;
  id v15 = v8;
  id v23 = v15;
  id v16 = v10;
  id v24 = v16;
  id v17 = v11;
  id v25 = v17;
  id v18 = v9;
  id v27 = v18;
  id v19 = v13;
  uint64_t v26 = v19;
  dispatch_async(v14, block);

  dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  if (dispatch_semaphore_wait(v19, v20))
  {
    id v21 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v29 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Timed out waiting on removing account with identifier: %{public}@", buf, 0xCu);
    }
  }
}

- (id)_installedDAAccount
{
  id v3 = self;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = [(MCACAccountPayloadHandler *)self accountTypeIdentifiers];
  id v29 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (!v29)
  {
LABEL_29:

    id v24 = 0;
    id v25 = 0;
    goto LABEL_31;
  }
  uint64_t v28 = *(void *)v49;
  long long v32 = v3;
LABEL_3:
  uint64_t v4 = 0;
  while (2)
  {
    if (*(void *)v49 != v28) {
      objc_enumerationMutation(obj);
    }
    uint64_t v5 = *(void *)(*((void *)&v48 + 1) + 8 * v4);
    uint64_t v6 = sharedDAAccountStore();
    id v7 = [v6 accountTypeWithAccountTypeIdentifier:v5];

    id v8 = sharedDAAccountStore();
    id v9 = [v8 accountsWithAccountType:v7];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v33 = v9;
    id v35 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (!v35)
    {
      id v24 = 0;
      goto LABEL_26;
    }
    long long v30 = v7;
    uint64_t v31 = v4;
    uint64_t v10 = *(void *)v45;
    while (2)
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v33);
        }
        id v12 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        dispatch_semaphore_t v13 = [v12 mcProfileUUID];
        v14 = [(MCNewPayloadHandler *)v3 payload];
        id v15 = [v14 profile];
        v43 = [v15 UUID];
        unsigned int v41 = [v13 isEqualToString:];
        if (v41)
        {
          v2 = [v12 mcPayloadUUID];
          v37 = [(MCNewPayloadHandler *)v3 payload];
          long long v36 = [v37 UUID];
          if (objc_msgSend(v2, "isEqualToString:"))
          {
            unsigned int v42 = 1;
LABEL_18:

            goto LABEL_19;
          }
        }
        v38 = v15;
        v39 = v14;
        v40 = v13;
        id v16 = [v12 mcConfigurationProfileIdentifier];
        id v17 = [(MCNewPayloadHandler *)v3 payload];
        id v18 = [v17 profile];
        id v19 = [v18 identifier];
        dispatch_time_t v20 = v16;
        if ([v16 isEqualToString:v19])
        {
          [v12 mcAccountIdentifier];
          id v21 = v34 = v2;
          long long v22 = [(MCNewPayloadHandler *)v3 payload];
          id v23 = [v22 identifier];
          unsigned int v42 = [v21 isEqualToString:v23];

          id v3 = v32;
          v2 = v34;
        }
        else
        {
          unsigned int v42 = 0;
        }

        dispatch_semaphore_t v13 = v40;
        id v15 = v38;
        v14 = v39;
        if (v41) {
          goto LABEL_18;
        }
LABEL_19:

        if (v42)
        {
          id v24 = v12;
          goto LABEL_24;
        }
      }
      id v35 = [v33 countByEnumeratingWithState:&v44 objects:v52 count:16];
      if (v35) {
        continue;
      }
      break;
    }
    id v24 = 0;
LABEL_24:
    id v7 = v30;
    uint64_t v4 = v31;
LABEL_26:

    if (!v24)
    {
      if ((id)++v4 != v29) {
        continue;
      }
      id v29 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
      if (!v29) {
        goto LABEL_29;
      }
      goto LABEL_3;
    }
    break;
  }

  id v25 = +[DAAccount daAccountSubclassWithBackingAccountInfo:v24];
LABEL_31:

  return v25;
}

- (id)accountTypeIdentifiers
{
  return 0;
}

- (id)unhashedAccountIdentifier
{
  return 0;
}

- (id)MCACAccountIdentifier
{
  v2 = [(MCACAccountPayloadHandler *)self unhashedAccountIdentifier];
  id v3 = [v2 MCHashedIdentifier];

  return v3;
}

- (id)installedACAccounts
{
  long long v34 = +[NSMutableArray array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [(MCACAccountPayloadHandler *)self accountTypeIdentifiers];
  id v30 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v51;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v4;
        uint64_t v5 = *(void *)(*((void *)&v50 + 1) + 8 * v4);
        uint64_t v6 = sharedDAAccountStore();
        uint64_t v7 = [v6 accountTypeWithAccountTypeIdentifier:v5];

        id v8 = sharedDAAccountStore();
        uint64_t v31 = (void *)v7;
        id v9 = [v8 accountsWithAccountType:v7];

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v35 = v9;
        id v37 = [v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
        if (v37)
        {
          uint64_t v10 = *(void *)v47;
          uint64_t v33 = *(void *)v47;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v47 != v10) {
                objc_enumerationMutation(v35);
              }
              id v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              dispatch_semaphore_t v13 = [v12 mcProfileUUID];
              v14 = [(MCNewPayloadHandler *)self payload];
              id v15 = [v14 profile];
              long long v45 = [v15 UUID];
              unsigned int v43 = [v13 isEqualToString:x0];
              if (v43)
              {
                id v16 = [v12 mcPayloadUUID];
                v2 = [(MCNewPayloadHandler *)self payload];
                [v2 UUID];
                v39 = v38 = v16;
                if (objc_msgSend(v16, "isEqualToString:"))
                {
                  unsigned int v44 = 1;
LABEL_18:

                  goto LABEL_19;
                }
              }
              v40 = v15;
              unsigned int v41 = v14;
              unsigned int v42 = v13;
              id v17 = [v12 mcConfigurationProfileIdentifier];
              id v18 = [(MCNewPayloadHandler *)self payload];
              id v19 = [v18 profile];
              dispatch_time_t v20 = [v19 identifier];
              id v21 = v17;
              if ([v17 isEqualToString:v20])
              {
                [v12 mcAccountIdentifier];
                long long v22 = v36 = v2;
                id v23 = [(MCNewPayloadHandler *)self payload];
                [v23 identifier];
                v25 = id v24 = self;
                unsigned int v44 = [v22 isEqualToString:v25];

                self = v24;
                uint64_t v10 = v33;

                v2 = v36;
              }
              else
              {
                unsigned int v44 = 0;
              }

              dispatch_semaphore_t v13 = v42;
              id v15 = v40;
              v14 = v41;
              if (v43) {
                goto LABEL_18;
              }
LABEL_19:

              if (v44) {
                [v34 addObject:v12];
              }
            }
            id v37 = [v35 countByEnumeratingWithState:&v46 objects:v54 count:16];
          }
          while (v37);
        }

        uint64_t v4 = v32 + 1;
      }
      while ((id)(v32 + 1) != v30);
      id v30 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v30);
  }

  id v26 = [v34 copy];

  return v26;
}

- (id)_installedSetAsideACAccount
{
  id v3 = +[MDMCloudConfiguration sharedConfiguration];
  unsigned int v33 = [v3 userMode];

  uint64_t v4 = [(MCACAccountPayloadHandler *)self setAsideAccount];
  id v37 = [v4 mcAccountIdentifier];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(MCACAccountPayloadHandler *)self accountTypeIdentifiers];
  id v29 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v44;
    uint64_t v32 = self;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v44 != v28) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void *)(*((void *)&v43 + 1) + 8 * v5);
      uint64_t v7 = sharedDAAccountStore();
      id v8 = [v7 accountTypeWithAccountTypeIdentifier:v6];

      id v9 = sharedDAAccountStore();
      uint64_t v10 = [v9 accountsWithAccountType:v8];

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v36 = v10;
      id v11 = [v36 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v11)
      {
        id v30 = v8;
        uint64_t v31 = v5;
        uint64_t v12 = *(void *)v40;
        uint64_t v34 = *(void *)v40;
        do
        {
          dispatch_semaphore_t v13 = 0;
          id v35 = v11;
          do
          {
            if (*(void *)v40 != v12) {
              objc_enumerationMutation(v36);
            }
            v14 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v13);
            id v15 = [v14 mcProfileUUID];
            id v16 = [(MCNewPayloadHandler *)self payload];
            id v17 = [v16 profile];
            id v18 = [v17 UUID];
            if ([v15 isEqualToString:v18])
            {
              id v19 = [v14 mcPayloadUUID];
              dispatch_time_t v20 = [(MCNewPayloadHandler *)self payload];
              id v21 = [v20 UUID];
              v38 = v19;
              unsigned int v22 = [v19 isEqualToString:v21];
              if (v22) {
                BOOL v23 = v33 == 1;
              }
              else {
                BOOL v23 = 0;
              }
              if (v23 && v37 != 0)
              {
                id v25 = [v14 mcAccountIdentifier];
                unsigned int v22 = [v25 isEqualToString:v37];

                self = v32;
              }

              uint64_t v12 = v34;
              id v11 = v35;
              if (v22)
              {
                id v11 = v14;
                goto LABEL_25;
              }
            }
            else
            {
            }
            dispatch_semaphore_t v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v36 countByEnumeratingWithState:&v39 objects:v47 count:16];
        }
        while (v11);
LABEL_25:
        id v8 = v30;
        uint64_t v5 = v31;
      }

      if (v11) {
        break;
      }
      if ((id)++v5 == v29)
      {
        id v29 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (v29) {
          goto LABEL_3;
        }
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    id v11 = 0;
  }

  return v11;
}

- (ACAccount)setAsideAccount
{
  return self->_setAsideAccount;
}

- (void)setSetAsideAccount:(id)a3
{
}

- (BOOL)updatedOverInstalledAccount
{
  return self->_updatedOverInstalledAccount;
}

- (void)setUpdatedOverInstalledAccount:(BOOL)a3
{
  self->_updatedOverInstalledAccount = a3;
}

- (void).cxx_destruct
{
}

@end