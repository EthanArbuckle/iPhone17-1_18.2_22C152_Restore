@interface DMDAppOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
- (void)runWithRequest:(id)a3;
- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4;
@end

@implementation DMDAppOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___DMDAppOperation;
  if (objc_msgSendSuper2(&v17, "validateRequest:error:", v6, a4))
  {
    v7 = [v6 bundleIdentifier];
    v8 = [v6 storeItemIdentifier];
    uint64_t v9 = [v6 manifestURL];
    v10 = (void *)v9;
    uint64_t v11 = v7 != 0;
    uint64_t v12 = 1;
    if (v7) {
      uint64_t v12 = 2;
    }
    if (v8) {
      uint64_t v11 = v12;
    }
    if (v9) {
      ++v11;
    }
    BOOL v13 = v11 == 1;
    if (v11 != 1)
    {
      v14 = DMFAppLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10008000C(v14);
      }

      if (a4)
      {
        uint64_t v18 = DMFInvalidParameterErrorKey;
        CFStringRef v19 = @"request.bundleIdentifier";
        v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        DMFErrorWithCodeAndUserInfo();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[DMDAppController sharedController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027B50;
  v7[3] = &unk_1000CA558;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getBundleIdentifierForAppRequest:v6 completion:v7];
}

- (void)runWithRequest:(id)a3 bundleIdentifier:(id)a4
{
  id v8 = +[NSAssertionHandler currentHandler];
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"DMDAppOperation.m", 68, @"%@ must implement %@", v6, v7 object file lineNumber description];
}

@end