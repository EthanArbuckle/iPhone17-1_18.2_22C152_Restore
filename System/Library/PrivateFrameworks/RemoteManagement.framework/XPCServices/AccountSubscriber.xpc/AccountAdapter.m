@interface AccountAdapter
- (ACAccountStore)accountStore;
- (AccountAdapter)init;
- (BOOL)_unassignAssetReference:(id)a3 scope:(int64_t)a4 error:(id *)a5;
- (id)_dataclassActionsForRemovalOfAccount:(id)a3;
- (id)accountKeyFromConfiguration:(id)a3;
- (id)combinedServerTokensFromConfiguration:(id)a3;
- (id)createAccountWithTypeIdentifier:(id)a3;
- (id)getRemotelyManagedAccounts;
- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 completionHandler:(id)a5;
- (void)applyProperties:(id)a3 toAccount:(id)a4 configuration:(id)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(id)a3 completionHandler:(id)a4;
- (void)removeAccount:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)setAccountStore:(id)a3;
@end

@implementation AccountAdapter

- (AccountAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)AccountAdapter;
  v2 = [(AccountAdapter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ACAccountStore rm_defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;
  }
  return v2;
}

- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v14 declaration];
  v11 = [v10 declarationType];
  +[AccountTransformer transformerClassForConfigurationType:v11];
  v12 = objc_opt_new();

  if (v12)
  {
    v13 = [(AccountAdapter *)self accountStore];
    [v12 accountPropertiesFromConfiguration:v14 account:v8 accountStore:v13 completionHandler:v9];
  }
  else
  {
    v13 = +[RMErrorUtilities createInternalError];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v13);
  }
}

- (id)getRemotelyManagedAccounts
{
  uint64_t v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  objc_super v6 = [(AccountAdapter *)self accountStore];
  v7 = [v6 accounts];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000031DC;
  v30[3] = &unk_10001C5F8;
  id v23 = v3;
  id v31 = v23;
  id v8 = v4;
  id v32 = v8;
  id v9 = v5;
  id v33 = v9;
  [v7 enumerateObjectsUsingBlock:v30];

  v24 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v15 = [v14 objectForKeyedSubscript:@"RemoteManagementPrimaryAccountIdentifier"];
        unsigned __int8 v16 = [v8 containsObject:v15];

        if ((v16 & 1) == 0)
        {
          id v17 = v14;
          v18 = [v17 objectForKeyedSubscript:@"RemoteManagementSourceIdentifier"];
          v19 = [v17 objectForKeyedSubscript:@"RemoteManagementConfigurationIdentifier"];

          v20 = +[NSString stringWithFormat:@"%@-%@", v18, v19];

          [v24 setObject:v17 forKeyedSubscript:v20];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v11);
  }

  v34[0] = @"Managed";
  v34[1] = @"Orphaned";
  v35[0] = v23;
  v35[1] = v24;
  v21 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

  return v21;
}

- (id)accountKeyFromConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [v3 store];
  v5 = [v4 identifier];
  objc_super v6 = [v3 declaration];

  v7 = [v6 declarationIdentifier];
  id v8 = +[NSString stringWithFormat:@"%@-%@", v5, v7];

  return v8;
}

- (id)combinedServerTokensFromConfiguration:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v4 combinedServerTokensFromConfiguration:v3];

  return v5;
}

- (id)createAccountWithTypeIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(AccountAdapter *)self accountStore];
  objc_super v6 = [v5 accountTypeWithAccountTypeIdentifier:v4];

  id v7 = [objc_alloc((Class)ACAccount) initWithAccountType:v6];

  return v7;
}

- (void)applyProperties:(id)a3 toAccount:(id)a4 configuration:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(id, void *))a6;
  v13 = [a5 declaration];
  id v14 = [v13 declarationType];

  +[AccountTransformer transformerClassForConfigurationType:v14];
  v15 = objc_opt_new();
  if (v15)
  {
    unsigned __int8 v16 = [(AccountAdapter *)self accountStore];
    [v15 applyProperties:v10 toAccount:v11 accountStore:v16 completionHandler:v12];
  }
  else
  {
    id v17 = +[RMLog accountAdapter];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000145F8((uint64_t)v14, v17);
    }

    unsigned __int8 v16 = +[RMErrorUtilities createInternalError];
    v12[2](v12, v16);
  }
}

- (void)removeAccount:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 objectForKeyedSubscript:@"RemoteManagementDeclarationKey"];
  if (v10) {
    id v11 = +[RMStoreDeclarationKey newDeclarationKey:v10];
  }
  else {
    id v11 = 0;
  }
  uint64_t v12 = [(AccountAdapter *)self _dataclassActionsForRemovalOfAccount:v9];
  v13 = [(AccountAdapter *)self accountStore];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000037A4;
  v16[3] = &unk_10001C620;
  id v17 = v11;
  v18 = self;
  id v19 = v8;
  int64_t v20 = a4;
  id v14 = v8;
  id v15 = v11;
  [v13 removeAccount:v9 withDataclassActions:v12 completion:v16];
}

- (id)_dataclassActionsForRemovalOfAccount:(id)a3
{
  id v4 = a3;
  v5 = [(AccountAdapter *)self accountStore];
  objc_super v6 = [v5 dataclassActionsForAccountDeletion:v4];

  id v7 = +[RMLog accountAdapter];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100014670((uint64_t)v6, v7);
  }

  if (v6)
  {
    id v23 = v4;
    id v8 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = [v6 allKeys];
    id v10 = [v9 countByEnumeratingWithState:&v31 objects:v38 count:16];
    id v26 = v8;
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v32;
      v24 = v9;
      v25 = v6;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v15 = [v6 objectForKeyedSubscript:v14];
          if ([v15 count] == (id)1)
          {
            unsigned __int8 v16 = [v15 lastObject];
            [v8 setObject:v16 forKey:v14];
          }
          else if ((unint64_t)[v15 count] < 2)
          {
            unsigned __int8 v16 = +[RMLog accountAdapter];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v36 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Failed to get possible actions for dataclass %{public}@ during account removal.", buf, 0xCu);
            }
          }
          else
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            unsigned __int8 v16 = v15;
            id v17 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
            if (v17)
            {
              id v18 = v17;
              uint64_t v19 = *(void *)v28;
              while (2)
              {
                for (j = 0; j != v18; j = (char *)j + 1)
                {
                  if (*(void *)v28 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  v21 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
                  if ([v21 isDestructive])
                  {
                    id v8 = v26;
                    [v26 setObject:v21 forKey:v14];
                    id v9 = v24;
                    objc_super v6 = v25;
                    goto LABEL_24;
                  }
                }
                id v18 = [v16 countByEnumeratingWithState:&v27 objects:v37 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
              objc_super v6 = v25;
              id v8 = v26;
              id v9 = v24;
            }
          }
LABEL_24:
        }
        id v11 = [v9 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v11);
    }

    id v4 = v23;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (void)configurationUIForConfiguration:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  objc_super v6 = [v10 declaration];
  id v7 = [v6 declarationType];
  +[AccountTransformer transformerClassForConfigurationType:v7];
  id v8 = objc_opt_new();

  if (v8)
  {
    [v8 configurationUIForConfiguration:v10 completionHandler:v5];
  }
  else
  {
    id v9 = +[RMErrorUtilities createInternalError];
    (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v9);
  }
}

- (BOOL)_unassignAssetReference:(id)a3 scope:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_100003D84;
  v22 = sub_100003D94;
  id v23 = 0;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_100003D9C;
  id v15 = &unk_10001C648;
  id v17 = &v18;
  id v8 = (id)objc_opt_new();
  id v16 = v8;
  +[RMSubscriberStore unassignAssets:v7 scope:a4 completionHandler:&v12];
  objc_msgSend(v8, "waitForCompletion", v12, v13, v14, v15);
  if (a5)
  {
    id v9 = (void *)v19[5];
    if (v9) {
      *a5 = v9;
    }
  }
  BOOL v10 = v19[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end