@interface AccountStatusAdapter
- (ACAccountStore)accountStore;
- (AccountStatusAdapter)init;
- (id)getRemotelyManagedAccountsForStore:(id)a3;
- (id)getStatusInfoFromAccount:(id)a3;
- (id)getStatusKeyPathFromAccount:(id)a3;
- (void)setAccountStore:(id)a3;
@end

@implementation AccountStatusAdapter

- (AccountStatusAdapter)init
{
  v6.receiver = self;
  v6.super_class = (Class)AccountStatusAdapter;
  v2 = [(AccountStatusAdapter *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ACAccountStore rm_defaultStore];
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v3;
  }
  return v2;
}

- (id)getRemotelyManagedAccountsForStore:(id)a3
{
  v4 = [a3 identifier];
  v5 = objc_opt_new();
  objc_super v6 = [(AccountStatusAdapter *)self accountStore];
  v7 = [v6 accounts];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005E80;
  v13[3] = &unk_10001C850;
  id v14 = v4;
  id v8 = v5;
  id v15 = v8;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:v13];

  v10 = v15;
  id v11 = v8;

  return v11;
}

- (id)getStatusKeyPathFromAccount:(id)a3
{
  id v3 = a3;
  v4 = +[AccountStatusHandler handlerForAccount:v3];
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 getStatusKeyPathFromAccount:v3];
  }
  else
  {
    v7 = +[RMLog accountStatusAdapter];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014E14((uint64_t)v3, v7);
    }

    objc_super v6 = 0;
  }

  return v6;
}

- (id)getStatusInfoFromAccount:(id)a3
{
  id v3 = a3;
  v4 = +[AccountStatusHandler handlerForAccount:v3];
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 getStatusInfoFromAccount:v3];
  }
  else
  {
    v7 = +[RMLog accountStatusAdapter];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100014E14((uint64_t)v3, v7);
    }

    objc_super v6 = &__NSDictionary0__struct;
  }

  return v6;
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