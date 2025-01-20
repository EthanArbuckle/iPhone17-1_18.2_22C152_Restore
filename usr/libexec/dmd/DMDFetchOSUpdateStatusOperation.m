@interface DMDFetchOSUpdateStatusOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (unint64_t)_downloadStatusAndPercentComplete:(double *)a3 fromStatus:(id)a4;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchOSUpdateStatusOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2D98;
}

- (void)runWithRequest:(id)a3
{
  v4 = DMFOSUpdateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fetch-os-update-status starting", (uint8_t *)v15, 2u);
  }

  v5 = +[DMDSUManagerInstallTask sharedInstallTask];
  id v16 = 0;
  v6 = [v5 currentStatusWithError:&v16];
  id v7 = v16;
  if (v6)
  {
    v8 = [(id)objc_opt_class() productKeyOrDefaultFromStatus:v6];
    v15[0] = 0.0;
    unint64_t v9 = [(DMDFetchOSUpdateStatusOperation *)self _downloadStatusAndPercentComplete:v15 fromStatus:v6];
    id v10 = objc_alloc((Class)DMFFetchOSUpdateStatusResultObject);
    id v11 = [v10 initWithProductKey:v8 status:v9 downloadPercentComplete:v15[0]];
    [(DMDFetchOSUpdateStatusOperation *)self endOperationWithResultObject:v11];

    v12 = DMFOSUpdateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "fetch-os-update-status done", (uint8_t *)v15, 2u);
    }
  }
  else
  {
    v13 = DMFOSUpdateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10008529C((uint64_t)v7, v13);
    }

    if (v7)
    {
      NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
      id v18 = v7;
      v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      v14 = DMFErrorWithCodeAndUserInfo();
      [(DMDFetchOSUpdateStatusOperation *)self endOperationWithError:v14];
    }
    else
    {
      v12 = DMFErrorWithCodeAndUserInfo();
      [(DMDFetchOSUpdateStatusOperation *)self endOperationWithError:v12];
    }
  }
}

- (unint64_t)_downloadStatusAndPercentComplete:(double *)a3 fromStatus:(id)a4
{
  id v5 = a4;
  double v6 = 1.0;
  if ([v5 isInstalling])
  {
    unint64_t v7 = 2;
  }
  else if ([v5 isDownloadComplete])
  {
    unint64_t v7 = 0;
  }
  else if ([v5 isDownloading])
  {
    [v5 downloadPercentComplete];
    double v6 = v8;
    unint64_t v7 = 1;
  }
  else
  {
    unint64_t v7 = 0;
    double v6 = 0.0;
  }
  *a3 = v6;

  return v7;
}

@end