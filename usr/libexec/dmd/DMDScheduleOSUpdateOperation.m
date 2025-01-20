@interface DMDScheduleOSUpdateOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)endOperationWithWrongProductKey:(id)a3 action:(unint64_t)a4;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDScheduleOSUpdateOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D30E0;
}

- (void)endOperationWithWrongProductKey:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)DMFScheduleOSUpdateResultObject);
  v8 = DMFErrorWithCodeAndUserInfo();
  id v9 = [v7 initWithAction:a4 productKey:v6 error:v8];

  [(DMDScheduleOSUpdateOperation *)self endOperationWithResultObject:v9];
}

- (void)runWithRequest:(id)a3
{
  id v5 = a3;
  id v6 = DMFOSUpdateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v38 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "schedule-os-update starting, request = %{public}@", buf, 0xCu);
  }

  id v7 = +[DMDSUManagerInstallTask sharedInstallTask];
  id v36 = 0;
  v8 = [v7 currentStatusWithError:&v36];
  id v9 = v36;
  unint64_t v10 = (unint64_t)[v5 action];
  if (v10 == 2) {
    unint64_t v10 = [v8 isDownloadComplete];
  }
  v11 = [v5 productKey];
  id v12 = [(id)objc_opt_class() productKeyFromStatus:v8];
  v13 = [(id)objc_opt_class() defaultProductKey];
  if (!v11
    || ([v11 isEqualToString:v13] & 1) != 0
    || !v12
    || ([v11 isEqualToString:v12] & 1) != 0)
  {
    v32 = [v5 productVersion:v13];
    id v14 = [v5 useDelay];
    v30 = self;
    v31 = v8;
    if (v10 == 1)
    {
      v22 = DMFOSUpdateLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "schedule-os-update install action", buf, 2u);
      }

      id v33 = v9;
      unsigned __int8 v23 = [v7 startInstallWithError:&v33];
      id v21 = v33;

      v17 = 0;
      id v18 = 0;
      id v9 = v21;
      if ((v23 & 1) == 0) {
        goto LABEL_26;
      }
    }
    else if (v10)
    {
      v24 = +[NSAssertionHandler currentHandler];
      v25 = self;
      id v21 = v24;
      [v24 handleFailureInMethod:a2 object:v25 file:@"DMDScheduleOSUpdateOperation.m" lineNumber:115 description:@"unexpected action value"];
      v17 = 0;
      id v18 = v9;
    }
    else
    {
      id v15 = v14;
      v16 = DMFOSUpdateLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "schedule-os-update download action", buf, 2u);
      }

      id v35 = v9;
      v17 = [v7 availableUpdateWithVersion:v32 useDelay:v15 error:&v35];
      id v18 = v35;

      if (v17)
      {
        uint64_t v19 = [v17 productKey];

        id v34 = v18;
        unsigned __int8 v20 = [v7 startDownloadWithError:&v34];
        id v21 = v34;

        if ((v20 & 1) == 0)
        {
          id v12 = (id)v19;
          id v9 = v21;
          goto LABEL_26;
        }
        id v18 = 0;
        id v12 = (id)v19;
      }
      else
      {
        id v21 = v12;
        id v12 = v11;
      }
    }

    id v9 = v18;
LABEL_26:
    id v27 = [objc_alloc((Class)DMFScheduleOSUpdateResultObject) initWithAction:v10 productKey:v12 error:v9];
    [(DMDScheduleOSUpdateOperation *)v30 endOperationWithResultObject:v27];
    v28 = DMFOSUpdateLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v38 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "schedule-os-update done, result = %{public}@", buf, 0xCu);
    }

    v8 = v31;
    v13 = v29;
    goto LABEL_29;
  }
  v26 = DMFOSUpdateLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "schedule-os-update wrong product key", buf, 2u);
  }

  [(DMDScheduleOSUpdateOperation *)self endOperationWithWrongProductKey:v11 action:v10];
LABEL_29:
}

@end