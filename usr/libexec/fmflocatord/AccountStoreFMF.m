@interface AccountStoreFMF
- (BOOL)refreshAuthTokens;
- (FMFAccount)currentActiveAccount;
- (NSMutableArray)accountsList;
- (id)_accountFromACAccount:(id)a3;
- (id)accounts;
- (void)_fetchAppAuthToken:(id)a3;
- (void)_fetchInternalAuthToken:(id)a3;
- (void)_tokensForAccount:(id)a3;
- (void)addAccount:(id)a3;
- (void)dealloc;
- (void)loadExistingAccounts;
- (void)removeAccount:(id)a3;
- (void)setAccountsList:(id)a3;
- (void)setCurrentActiveAccount:(id)a3;
- (void)setRefreshAuthTokens:(BOOL)a3;
@end

@implementation AccountStoreFMF

- (void)dealloc
{
  [(AccountStoreFMF *)self setCurrentActiveAccount:0];
  v3.receiver = self;
  v3.super_class = (Class)AccountStoreFMF;
  [(AccountStoreFMF *)&v3 dealloc];
}

- (void)loadExistingAccounts
{
  objc_super v3 = [(AccountStoreFMF *)self accountsList];

  if (!v3)
  {
    v4 = +[NSMutableArray array];
    [(AccountStoreFMF *)self setAccountsList:v4];

    v5 = +[AppleAccountManager sharedInstance];
    v6 = [v5 fmfACAccount];

    v7 = [(AccountStoreFMF *)self _accountFromACAccount:v6];
    if (v7)
    {
      v8 = [(AccountStoreFMF *)self accountsList];
      [v8 addObject:v7];

      [(AccountStoreFMF *)self setCurrentActiveAccount:v7];
    }
    v9 = sub_10001B6D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = [(AccountStoreFMF *)self accountsList];
      int v14 = 134217984;
      id v15 = [v10 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Found %ld FMF accounts in store", (uint8_t *)&v14, 0xCu);
    }
    v11 = [(AccountStoreFMF *)self currentActiveAccount];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      v13 = [(AccountStoreFMF *)self currentActiveAccount];
      [(AccountStoreFMF *)self _tokensForAccount:v13];
    }
  }
}

- (id)accounts
{
  objc_super v3 = [(AccountStoreFMF *)self accountsList];
  id v4 = [v3 copy];

  if ([(AccountStoreFMF *)self refreshAuthTokens])
  {
    v5 = sub_10001B6D4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Looks like some auth tokens were not read successfully the last time. Re-reading them...", buf, 2u);
    }

    [(AccountStoreFMF *)self setRefreshAuthTokens:0];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100012690;
    v7[3] = &unk_1000593C0;
    v7[4] = self;
    [v4 enumerateObjectsUsingBlock:v7];
  }

  return v4;
}

- (void)addAccount:(id)a3
{
  id v4 = a3;
  v5 = [(AccountStoreFMF *)self accountsList];
  [v5 addObject:v4];

  [(AccountStoreFMF *)self saveChanges];
}

- (void)removeAccount:(id)a3
{
  id v4 = a3;
  v5 = [(AccountStoreFMF *)self accountsList];
  [v5 removeObject:v4];

  [(AccountStoreFMF *)self saveChanges];
}

- (void)_tokensForAccount:(id)a3
{
  id v4 = a3;
  [(AccountStoreFMF *)self _fetchAppAuthToken:v4];
  [(AccountStoreFMF *)self _fetchInternalAuthToken:v4];
}

- (void)_fetchAppAuthToken:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ACAccountStore);
  v6 = +[AppleAccountManager sharedInstance];
  v7 = [v6 fmfACAccount];

  id v16 = 0;
  v8 = [v5 credentialForAccount:v7 error:&v16];
  id v9 = v16;
  if (!v8)
  {
    v10 = sub_10001B6D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100037310((uint64_t)v7, v10);
    }
  }
  uint64_t v11 = [v8 credentialItemForKey:ACFindMyFriendsAppTokenKey];
  BOOL v12 = (void *)v11;
  if (v9 || !v11)
  {
    v13 = sub_10001B6D4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v4 username];
      id v15 = [v4 appAuthTokenStatus];
      *(_DWORD *)buf = 138412802;
      v18 = v14;
      __int16 v19 = 2048;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not retrieve app token for FMF account %@(%ld). Error : %@", buf, 0x20u);
    }
    [v4 setAppAuthTokenStatus:1];
    [(AccountStoreFMF *)self setRefreshAuthTokens:1];
  }
  else
  {
    [v4 setAppAuthToken:v11];
    [v4 setAppAuthTokenStatus:0];
  }
}

- (void)_fetchInternalAuthToken:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)ACAccountStore);
  v6 = +[AppleAccountManager sharedInstance];
  v7 = [v6 fmfACAccount];

  id v15 = 0;
  v8 = [v5 credentialForAccount:v7 error:&v15];
  id v9 = v15;
  uint64_t v10 = [v8 credentialItemForKey:ACFindMyFriendsTokenKey];
  uint64_t v11 = (void *)v10;
  if (v9 || !v10)
  {
    BOOL v12 = sub_10001B6D4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v4 username];
      id v14 = [v4 appAuthTokenStatus];
      *(_DWORD *)buf = 138412802;
      v17 = v13;
      __int16 v18 = 2048;
      id v19 = v14;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not retrieve internal token for FMF account %@ (%ld) Error : %@", buf, 0x20u);
    }
    [v4 setInternalAuthTokenStatus:2];
    [(AccountStoreFMF *)self setRefreshAuthTokens:1];
  }
  else
  {
    [v4 setInternalAuthToken:v10];
    [v4 setInternalAuthTokenStatus:0];
  }
}

- (id)_accountFromACAccount:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(FMFAccount);
    id v5 = [v3 parentAccount];

    [(FMFAccount *)v4 applyPropertiesFromACAccount:v5 includingTokens:0];
    [(Account *)v4 setIsActive:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSMutableArray)accountsList
{
  return self->_accountsList;
}

- (void)setAccountsList:(id)a3
{
}

- (BOOL)refreshAuthTokens
{
  return self->_refreshAuthTokens;
}

- (void)setRefreshAuthTokens:(BOOL)a3
{
  self->_refreshAuthTokens = a3;
}

- (FMFAccount)currentActiveAccount
{
  return self->_currentActiveAccount;
}

- (void)setCurrentActiveAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActiveAccount, 0);

  objc_storeStrong((id *)&self->_accountsList, 0);
}

@end