@interface ABSAccountsManager
+ (BOOL)localContainerEnabled;
+ (id)_ensureAccountExistsWithExternalIdentifier:(id)a3 store:(id)a4;
+ (id)_localContainer;
+ (id)primaryiCloudCardDAVAccountIdentifier;
+ (id)setupContainerConfiguredWithAttributes:(id)a3 store:(id)a4;
+ (void)setPrimaryiCloudCardDAVAccountIdentifier:(id)a3;
@end

@implementation ABSAccountsManager

+ (id)_ensureAccountExistsWithExternalIdentifier:(id)a3 store:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[CNAccount predicateForAccountWithExternalIdentifier:v5];
  id v20 = 0;
  v8 = [v6 accountsMatchingPredicate:v7 error:&v20];
  id v9 = v20;
  if (v9)
  {
    id v10 = v9;
    v11 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000383A0((uint64_t)v5, (uint64_t)v10, v11);
    }
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = [v8 firstObject];
    if (v13)
    {
      id v12 = (id)v13;
      id v10 = 0;
    }
    else
    {
      id v12 = [objc_alloc((Class)CNAccount) initWithExternalIdentifier:v5];
      v14 = +[CNSaveRequest abs_new];
      [v14 addAccount:v12];
      v15 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v22 = v5;
        __int16 v23 = 2112;
        id v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Didn't find an account for account external ID [%{public}@]; created one: %@",
          buf,
          0x16u);
      }
      id v19 = 0;
      unsigned __int8 v16 = [v6 ABSexecuteSaveRequest:v14 error:&v19];
      id v10 = v19;
      if ((v16 & 1) == 0)
      {
        v17 = *(NSObject **)(qword_100069D78 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100038328((uint64_t)v10, v17);
        }
      }
    }
  }

  return v12;
}

+ (id)setupContainerConfiguredWithAttributes:(id)a3 store:(id)a4
{
  return 0;
}

+ (id)primaryiCloudCardDAVAccountIdentifier
{
  v2 = +[ACAccountStore defaultStore];
  v3 = [v2 aa_primaryAppleAccount];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 childCardDAVAccountIdentifier];
    if (!v5)
    {
      id v6 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100038460(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  else
  {
    v14 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100038428(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    id v5 = 0;
  }

  return v5;
}

+ (void)setPrimaryiCloudCardDAVAccountIdentifier:(id)a3
{
  v3 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100038498(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

+ (id)_localContainer
{
  id v2 = objc_alloc_init((Class)CNContactStore);
  v3 = +[CNContainer predicateForLocalContainerIncludingDisabled:1];
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10002CE20;
  v26 = sub_10002CE30;
  id v27 = 0;
  uint64_t v19 = 0;
  v20[0] = &v19;
  v20[1] = 0x3032000000;
  v20[2] = sub_10002CE20;
  v20[3] = sub_10002CE30;
  id v21 = 0;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10002CE38;
  v14 = &unk_100055800;
  uint64_t v17 = &v22;
  id v4 = v2;
  id v15 = v4;
  id v5 = v3;
  id v16 = v5;
  uint64_t v18 = &v19;
  id v6 = sub_100005874((uint64_t)&v11);
  uint64_t v7 = (void *)v23[5];
  if (v7 && objc_msgSend(v7, "count", v11, v12, v13, v14, v15) == (id)1)
  {
    uint64_t v8 = [(id)v23[5] firstObject];
  }
  else
  {
    uint64_t v9 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000384D0((uint64_t)v20, v9);
    }
    uint64_t v8 = 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v22, 8);

  return v8;
}

+ (BOOL)localContainerEnabled
{
  id v2 = [a1 _localContainer];
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

@end