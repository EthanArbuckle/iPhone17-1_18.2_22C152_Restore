@interface DMDSetDeviceNameOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDSetDeviceNameOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D31E8;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___DMDSetDeviceNameOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4)) {
    goto LABEL_7;
  }
  uint64_t v7 = [v6 name];
  if (!v7
    || (v8 = (void *)v7,
        [v6 name],
        v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 length],
        v9,
        v8,
        !v10))
  {
    if (!a4) {
      goto LABEL_8;
    }
    uint64_t v14 = DMFInvalidParameterErrorKey;
    CFStringRef v15 = @"request.name";
    v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
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

- (void)runWithRequest:(id)a3
{
  v4 = [a3 name];
  id v7 = 0;
  unsigned int v5 = +[DMDLockdownUtilities setDeviceName:v4 outError:&v7];
  id v6 = v7;

  if (v5) {
    [(DMDSetDeviceNameOperation *)self endOperationWithResultObject:0];
  }
  else {
    [(DMDSetDeviceNameOperation *)self endOperationWithError:v6];
  }
}

@end