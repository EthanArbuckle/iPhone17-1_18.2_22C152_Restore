@interface DMDRemoveOSUpdateOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveOSUpdateOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3050;
}

- (void)runWithRequest:(id)a3
{
  v4 = DMFOSUpdateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "remove-os-update starting", buf, 2u);
  }

  v5 = +[DMDSUManagerInstallTask sharedInstallTask];
  id v13 = 0;
  unsigned int v6 = [v5 removeUpdateWithError:&v13];
  id v7 = v13;
  v8 = DMFOSUpdateLog();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "remove-os-update successful", v12, 2u);
    }

    [(DMDRemoveOSUpdateOperation *)self endOperationWithResultObject:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100087EA8((uint64_t)v7, v9);
    }

    [(DMDRemoveOSUpdateOperation *)self endOperationWithError:v7];
  }
  v10 = DMFOSUpdateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "remove-os-update done", v11, 2u);
  }
}

@end