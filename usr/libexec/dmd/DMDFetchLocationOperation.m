@interface DMDFetchLocationOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDFetchLocationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2D50;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDFetchLocationOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [v6 originator];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v11 = DMFInvalidParameterErrorKey;
    CFStringRef v12 = @"request.originator";
    v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    DMFErrorWithCodeAndUserInfo();
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[FMDFMIPManager sharedInstance];
  unsigned __int8 v6 = [v5 isManagedLostModeActive];

  if (v6)
  {
    v7 = +[DMDLostDeviceLocationManager sharedManager];
    v8 = [v4 originator];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004BA28;
    v9[3] = &unk_1000CB1B0;
    v9[4] = self;
    [v7 getCurrentLocationForOriginator:v8 completion:v9];
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:601];
  }
}

@end