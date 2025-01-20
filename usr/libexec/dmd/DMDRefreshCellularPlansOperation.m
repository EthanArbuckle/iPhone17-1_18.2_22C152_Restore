@interface DMDRefreshCellularPlansOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (id)invalidResponseError:(id)a3;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRefreshCellularPlansOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2FA8;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDRefreshCellularPlansOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4)) {
    goto LABEL_7;
  }
  uint64_t v7 = [v6 eSIMServerURL];
  if (!v7) {
    goto LABEL_5;
  }
  v8 = (void *)v7;
  v9 = [v6 eSIMServerURL];
  v10 = [v9 scheme];
  unsigned __int8 v11 = [&off_1000D2FC0 containsObject:v10];

  if ((v11 & 1) == 0)
  {
LABEL_5:
    if (!a4) {
      goto LABEL_8;
    }
    uint64_t v15 = DMFInvalidParameterErrorKey;
    CFStringRef v16 = @"request.eSIMServerURL";
    v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    LOBYTE(a4) = 0;
    goto LABEL_8;
  }
  LOBYTE(a4) = 1;
LABEL_8:

  return (char)a4;
}

- (id)invalidResponseError:(id)a3
{
  uint64_t v7 = DMFCoreTelephonyErrorResponseKey;
  id v8 = a3;
  id v3 = a3;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  v5 = DMFErrorWithCodeAndUserInfo();

  return v5;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v4 eSIMServerURL];
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v11 = "-[DMDRefreshCellularPlansOperation(iOS) runWithRequest:]";
    __int16 v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s with URL: %@", buf, 0x16u);
  }
  if (+[DMDMobileGestalt hasCellularDataCapability])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006AB20;
    v7[3] = &unk_1000CBCF8;
    v7[4] = self;
    id v8 = (id)objc_opt_new();
    id v9 = v4;
    id v6 = v8;
    [v6 fetchCachedVinylInfoWithCompletion:v7];
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:202];
  }
}

@end