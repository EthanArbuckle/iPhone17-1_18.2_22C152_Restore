@interface DMDFetchAvailableOSUpdatesOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchAvailableOSUpdatesOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2C90;
}

- (void)runWithRequest:(id)a3
{
  id v5 = a3;
  v6 = DMFOSUpdateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "fetch-available-os-updates starting", buf, 2u);
  }

  v7 = +[DMDSUManagerInstallTask sharedInstallTask];
  v8 = [v5 productVersion];
  id v9 = [v5 useDelay];

  v10 = DMFOSUpdateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    CFStringRef v11 = @"default";
    CFStringRef v12 = @"NO";
    if (v8) {
      CFStringRef v11 = v8;
    }
    if (v9) {
      CFStringRef v12 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v21 = v11;
    __int16 v22 = 2112;
    CFStringRef v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetch-available-os-updates: product version = %@, use delay = %@", buf, 0x16u);
  }

  id v19 = 0;
  v13 = [v7 availableUpdateWithVersion:v8 useDelay:v9 error:&v19];
  id v14 = v19;
  v15 = v14;
  if (v13)
  {
    id v16 = [objc_alloc((Class)DMFFetchAvailableOSUpdatesResultObject) initWithUpdate:v13];
    [(DMDFetchAvailableOSUpdatesOperation *)self endOperationWithResultObject:v16];
  }
  else
  {
    if (!v14)
    {
      v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"DMDFetchAvailableOSUpdatesOperation.m" lineNumber:45 description:@"DMDFetchAvailableOSUpdatesOperation: no update returned"];
    }
    [(DMDFetchAvailableOSUpdatesOperation *)self endOperationWithError:v15];
  }
  v17 = DMFOSUpdateLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "fetch-available-os-updates done", buf, 2u);
  }
}

@end