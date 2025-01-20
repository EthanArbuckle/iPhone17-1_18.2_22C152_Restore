@interface AccountManager
+ (id)sharedInstance;
- (AccountManager)init;
- (NSArray)accounts;
- (NSDictionary)accountToStoreMapping;
- (id)_existingAccountInStore:(id)a3 withUniqueId:(id)a4;
- (id)accountOfType:(Class)a3 withUniqueId:(id)a4;
- (id)activeAccountsOfType:(Class)a3;
- (id)allAccountsOfType:(Class)a3;
- (id)initSingleton;
- (void)addAccount:(id)a3;
- (void)deactivateAccount:(id)a3;
- (void)deactivateAccountOfType:(Class)a3 havingUniqueId:(id)a4;
- (void)deactivateAllAccountsOfType:(Class)a3;
- (void)dealloc;
- (void)loadExistingAccounts;
- (void)providerUpdatedAccount:(id)a3;
- (void)removeInactiveAccount:(id)a3;
- (void)saveUpdatesToAccount:(id)a3;
- (void)setAccountToStoreMapping:(id)a3;
- (void)storeUpdatedAnAccount:(id)a3;
@end

@implementation AccountManager

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100036CAC(self, v4);
  }

  v5 = (void *)qword_10006D5B8;
  qword_10006D5B8 = 0;

  [v3 removeObserver:self name:@"AccountStoreUpdatedAccountNotification" object:0];
  v6.receiver = self;
  v6.super_class = (Class)AccountManager;
  [(AccountManager *)&v6 dealloc];
}

+ (id)sharedInstance
{
  if (qword_10006D5C0 != -1) {
    dispatch_once(&qword_10006D5C0, &stru_100059F20);
  }
  v2 = (void *)qword_10006D5B8;
  if (!qword_10006D5B8)
  {
    v3 = sub_10001B6D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "*** The AccountManager singleton seems to have been deallocated. This is unexpected & damaging.", v5, 2u);
    }

    v2 = (void *)qword_10006D5B8;
  }

  return v2;
}

- (AccountManager)init
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003844C();
  }

  return 0;
}

- (id)initSingleton
{
  v9.receiver = self;
  v9.super_class = (Class)AccountManager;
  v2 = [(AccountManager *)&v9 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v10 = v5;
    objc_super v6 = objc_alloc_init(AccountStoreFMF);
    v11 = v6;
    v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    [(AccountManager *)v2 setAccountToStoreMapping:v7];

    [v3 addObserver:v2 selector:"storeUpdatedAnAccount:" name:@"AccountStoreUpdatedAccountNotification" object:0];
    objc_storeStrong((id *)&qword_10006D5B8, v2);
  }
  return v2;
}

- (void)loadExistingAccounts
{
  id v2 = [(AccountManager *)self accountToStoreMapping];
  [v2 enumerateKeysAndObjectsUsingBlock:&stru_100059F40];
}

- (NSArray)accounts
{
  v3 = +[NSMutableArray array];
  v4 = [(AccountManager *)self accountToStoreMapping];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CD48;
  v7[3] = &unk_100059470;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

- (void)addAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AccountManager *)self accountToStoreMapping];
  objc_super v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = [v5 objectForKeyedSubscript:v7];

  objc_super v9 = [v4 uniqueId];
  v10 = [(AccountManager *)self _existingAccountInStore:v8 withUniqueId:v9];

  [v4 setIsActive:1];
  if (([v4 supportsMultipleActiveAccounts] & 1) == 0)
  {
    v11 = [v8 accounts];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001D00C;
    v16[3] = &unk_100059448;
    id v17 = v10;
    v18 = self;
    [v11 enumerateObjectsUsingBlock:v16];
  }
  if (!v10) {
    goto LABEL_8;
  }
  if (([v10 isActive] & 1) == 0)
  {
    [v8 removeAccount:v10];
LABEL_8:
    [v8 addAccount:v4];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100059F60);
    goto LABEL_9;
  }
  unsigned __int8 v12 = [v10 hasSameRelevantInfoAs:v4];
  [v10 copyInfoFromAccount:v4];
  [v8 saveChanges];
  if ((v12 & 1) == 0)
  {
    CFStringRef v19 = @"account";
    v20 = v10;
    +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001D0F8;
    v14[3] = &unk_100059350;
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
LABEL_9:
}

- (void)deactivateAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AccountManager *)self accountToStoreMapping];
    objc_super v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = [v5 objectForKeyedSubscript:v7];

    objc_super v9 = sub_10001B6D4();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Deactivating account %@", buf, 0xCu);
      }

      [v4 setIsActive:0];
      [v8 saveChanges];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001D340;
      block[3] = &unk_100059350;
      id v13 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v10 = v13;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = (id)objc_opt_class();
      id v11 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Tried to deactivate an account of unknown type : %@", buf, 0xCu);
    }
  }
}

- (void)deactivateAccountOfType:(Class)a3 havingUniqueId:(id)a4
{
  id v6 = a4;
  v7 = [(AccountManager *)self accountToStoreMapping];
  id v8 = NSStringFromClass(a3);
  objc_super v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v11 = sub_10001B6D4();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    Class v19 = a3;
    id v13 = "Tried to deactivate an account of unknown type : %@";
    v14 = v11;
    uint32_t v15 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_12;
  }
  v10 = sub_10001B6D4();
  id v11 = v10;
  if (!v6)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    id v13 = "Cannot find account to deactivate since uniqueId to search is nil";
    v14 = v11;
    uint32_t v15 = 2;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    Class v19 = a3;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deactivating accounts of type %@ with unique id %@", buf, 0x16u);
  }

  unsigned __int8 v12 = [(AccountManager *)self _existingAccountInStore:v9 withUniqueId:v6];
  id v11 = v12;
  if (v12)
  {
    [v12 setIsActive:0];
    [v9 saveChanges];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D630;
    block[3] = &unk_100059350;
    id v11 = v11;
    id v17 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
LABEL_12:
}

- (void)deactivateAllAccountsOfType:(Class)a3
{
  id v4 = [(AccountManager *)self accountToStoreMapping];
  id v5 = NSStringFromClass(a3);
  id v6 = [v4 objectForKeyedSubscript:v5];

  v7 = sub_10001B6D4();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      Class v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deactivating all accounts of type %@", (uint8_t *)&v10, 0xCu);
    }

    objc_super v9 = [v6 accounts];
    [v9 enumerateObjectsUsingBlock:&stru_100059FA0];

    [v6 saveChanges];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      Class v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Tried to deactivate an account of unknown type : %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)removeInactiveAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AccountManager *)self accountToStoreMapping];
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = [v5 objectForKeyedSubscript:v7];

  if ([v4 isActive])
  {
    objc_super v9 = sub_10001B6D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v4 uniqueId];
      int v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Trying to remove an active account : %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    Class v11 = [v8 accounts];
    unsigned int v12 = [v11 containsObject:v4];

    if (v12) {
      [v8 removeAccount:v4];
    }
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100059FC0);
    [v8 saveChanges];
  }
}

- (id)activeAccountsOfType:(Class)a3
{
  id v4 = [(AccountManager *)self accountToStoreMapping];
  id v5 = NSStringFromClass(a3);
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [v6 accounts];
    +[NSMutableArray array];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001DD24;
    v10[3] = &unk_1000593C0;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v8;
    [v7 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    v7 = sub_10001B6D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      Class v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Tried to fetch accounts of unknown type : %@", buf, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)allAccountsOfType:(Class)a3
{
  id v4 = [(AccountManager *)self accountToStoreMapping];
  id v5 = NSStringFromClass(a3);
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [v6 accounts];
    id v8 = [v7 copy];
  }
  else
  {
    objc_super v9 = sub_10001B6D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      Class v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Tried to fetch accounts of unknown type : %@", (uint8_t *)&v11, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

- (id)accountOfType:(Class)a3 withUniqueId:(id)a4
{
  id v6 = a4;
  v7 = [(AccountManager *)self accountToStoreMapping];
  id v8 = NSStringFromClass(a3);
  objc_super v9 = [v7 objectForKeyedSubscript:v8];

  int v10 = [(AccountManager *)self _existingAccountInStore:v9 withUniqueId:v6];

  return v10;
}

- (id)_existingAccountInStore:(id)a3 withUniqueId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 accounts];
  uint64_t v14 = 0;
  uint32_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_10001E098;
  v18 = sub_10001E0A8;
  id v19 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001E0B0;
  v11[3] = &unk_100059FE8;
  id v8 = v6;
  id v12 = v8;
  Class v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)saveUpdatesToAccount:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(AccountManager *)self accountToStoreMapping];
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = [v5 objectForKeyedSubscript:v7];

    [v8 saveChanges];
    CFStringRef v12 = @"account";
    id v13 = v4;
    +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001E2A0;
    v10[3] = &unk_100059350;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

- (void)providerUpdatedAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(AccountManager *)self accountToStoreMapping];
  id v6 = (objc_class *)objc_opt_class();

  v7 = NSStringFromClass(v6);
  id v8 = [v5 objectForKeyedSubscript:v7];

  [v8 saveChanges];
}

- (void)storeUpdatedAnAccount:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"account"];

  if (v4)
  {
    CFStringRef v8 = @"account";
    id v9 = v4;
    +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001E4D0;
    v6[3] = &unk_100059350;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (NSDictionary)accountToStoreMapping
{
  return self->_accountToStoreMapping;
}

- (void)setAccountToStoreMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

@end