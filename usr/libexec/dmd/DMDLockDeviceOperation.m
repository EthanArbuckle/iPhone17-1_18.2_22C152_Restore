@interface DMDLockDeviceOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDLockDeviceOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2F00;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  +[DMDLockUtilities lockDevice];
  uint64_t v5 = [v4 message];
  uint64_t v6 = [v4 phoneNumber];

  v7 = +[UMUserManager sharedManager];
  if (([v7 isMultiUser] & 1) == 0)
  {

    if (!(v5 | v6)) {
      goto LABEL_4;
    }
    v8 = objc_opt_new();
    [v8 setMessage:v5];
    [v8 setPhoneNumber:v6];
    [v8 setLostModeEnabled:1];
    v9 = +[FMDFMIPManager sharedInstance];
    v10 = [v9 enableLostModeWithInfo:v8];

    if (v10)
    {
      if ([v10 code] == (id)7)
      {
        v11 = self;
        uint64_t v12 = 301;
      }
      else
      {
        if ([v10 code] != (id)8)
        {
          NSErrorUserInfoKey v15 = NSUnderlyingErrorKey;
          v16 = v10;
          v13 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
          v14 = DMFErrorWithCodeAndUserInfo();
          [(DMDLockDeviceOperation *)self endOperationWithError:v14];

          goto LABEL_13;
        }
        v11 = self;
        uint64_t v12 = 302;
      }
      [(DMDTaskOperation *)v11 endOperationWithDMFErrorCode:v12];
    }
    else
    {
      [(DMDLockDeviceOperation *)self endOperationWithResultObject:0];
    }
LABEL_13:

    goto LABEL_14;
  }

LABEL_4:
  [(DMDLockDeviceOperation *)self endOperationWithResultObject:0];
LABEL_14:
}

@end