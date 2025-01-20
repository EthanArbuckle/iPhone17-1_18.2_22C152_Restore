@interface DMDRegisterConfigurationSourceOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRegisterConfigurationSourceOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2FF0;
}

- (unint64_t)queueGroup
{
  return 1;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(DMDTaskOperation *)self configurationEngine];

  if (v5)
  {
    v6 = [(DMDTaskOperation *)self context];
    v7 = [v6 clientBundleIdentifier];

    if (v7)
    {
      v8 = [(DMDTaskOperation *)self configurationEngine];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10006B34C;
      v10[3] = &unk_1000CADD0;
      v10[4] = self;
      [v8 handleConfigurationSourceRegistrationRequest:v4 clientIdentifier:v7 completionHandler:v10];
    }
    else
    {
      v9 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000877A4(v9);
      }

      v8 = DMFErrorWithCodeAndUserInfo();
      [(DMDRegisterConfigurationSourceOperation *)self endOperationWithError:v8];
    }
  }
  else
  {
    v7 = DMFErrorWithCodeAndUserInfo();
    [(DMDRegisterConfigurationSourceOperation *)self endOperationWithError:v7];
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___DMDRegisterConfigurationSourceOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4)) {
    goto LABEL_10;
  }
  v7 = [v6 configurationSourceName];
  id v8 = [v7 length];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v18 = DMFInvalidParameterErrorKey;
    CFStringRef v19 = @"request.configurationSourceName";
    v11 = &v19;
    v12 = &v18;
    goto LABEL_9;
  }
  v9 = [v6 organizationIdentifier];
  id v10 = [v9 length];

  if (!v10)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    CFStringRef v17 = @"request.organizationIdentifier";
    v11 = &v17;
    v12 = &v16;
LABEL_9:
    v13 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    LOBYTE(a4) = 0;
    goto LABEL_11;
  }
  LOBYTE(a4) = 1;
LABEL_11:

  return (char)a4;
}

@end