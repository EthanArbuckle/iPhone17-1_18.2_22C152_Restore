@interface DMDFetchAppsOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
+ (void)_fetchAppsForBundleIdentifier:(id)a3 type:(unint64_t)a4 completion:(id)a5;
+ (void)fetchAppsForRequest:(id)a3 completion:(id)a4;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchAppsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2C78;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000499C8;
  v5[3] = &unk_1000CB110;
  v5[4] = self;
  [(id)objc_opt_class() fetchAppsForRequest:v4 completion:v5];
}

+ (void)fetchAppsForRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"DMDFetchAppsOperation.m", 48, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v26 = +[NSAssertionHandler currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"DMDFetchAppsOperation.m", 49, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  v10 = +[DMDAppController sharedController];
  v11 = [v7 manifestURL];
  v12 = DMFAppLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v14 = [v7 manifestURL];
      v15 = [v14 host];
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fetch app with manifest url from: %{public}@", buf, 0xCu);
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100049D8C;
    v31[3] = &unk_1000CB138;
    v16 = (id *)v33;
    v33[0] = v9;
    v33[1] = a1;
    v17 = &v32;
    id v32 = v7;
    id v18 = v7;
    id v19 = v9;
    [v10 getBundleIdentifierForManifestURL:v11 completion:v31];
  }
  else
  {
    if (v13)
    {
      v20 = [v7 bundleIdentifiers];
      v21 = [v7 storeItemIdentifier];
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      __int16 v36 = 2114;
      v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fetch apps with bundle ids: %{public}@, store item id: %{public}@", buf, 0x16u);
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100049E14;
    v27[3] = &unk_1000CB160;
    v16 = &v30;
    v17 = &v28;
    v30 = v9;
    id v28 = v7;
    id v22 = v10;
    id v29 = v22;
    id v23 = v7;
    id v24 = v9;
    [v22 handleFetchRequest:v23 completion:v27];
  }
}

+ (void)_fetchAppsForBundleIdentifier:(id)a3 type:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_opt_new();
  id v12 = v9;
  v11 = +[NSArray arrayWithObjects:&v12 count:1];

  [v10 setBundleIdentifiers:v11];
  [v10 setType:a4];
  [a1 fetchAppsForRequest:v10 completion:v8];
}

@end