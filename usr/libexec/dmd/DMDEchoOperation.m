@interface DMDEchoOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDEchoOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2C18;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___DMDEchoOperation;
  if (!objc_msgSendSuper2(&v17, "validateRequest:error:", v6, a4)) {
    goto LABEL_11;
  }
  v7 = [v6 echo];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_12;
    }
    uint64_t v21 = DMFInvalidParameterErrorKey;
    CFStringRef v22 = @"request.echo";
    v13 = &v22;
    v14 = &v21;
    goto LABEL_10;
  }
  uint64_t v8 = [v6 resultStatus];
  if (v8)
  {
    v9 = (void *)v8;
    v20[0] = DMFRMEchoStatusOK;
    v20[1] = DMFRMEchoStatusPending;
    v20[2] = DMFRMEchoStatusFail;
    v10 = +[NSArray arrayWithObjects:v20 count:3];
    v11 = [v6 resultStatus];
    unsigned __int8 v12 = [v10 containsObject:v11];

    if ((v12 & 1) == 0)
    {
      if (!a4) {
        goto LABEL_12;
      }
      uint64_t v18 = DMFInvalidParameterErrorKey;
      CFStringRef v19 = @"request.resultStatus";
      v13 = &v19;
      v14 = &v18;
LABEL_10:
      v15 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:1];
      DMFErrorWithCodeAndUserInfo();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
      LOBYTE(a4) = 0;
      goto LABEL_12;
    }
  }
  LOBYTE(a4) = 1;
LABEL_12:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v10 = a3;
  v4 = [v10 resultStatus];
  if ([v4 isEqualToString:DMFRMEchoStatusOK])
  {

LABEL_4:
    v7 = objc_opt_new();
    uint64_t v8 = [v10 echo];
    [v7 setEcho:v8];

    v9 = [v10 resultStatus];
    [v7 setResultStatus:v9];

    [(DMDEchoOperation *)self endOperationWithResultObject:v7];
    goto LABEL_6;
  }
  v5 = [v10 resultStatus];
  unsigned int v6 = [v5 isEqualToString:DMFRMEchoStatusPending];

  if (v6) {
    goto LABEL_4;
  }
  [(DMDTaskOperation *)self endOperationWithDMFErrorCode:4];
LABEL_6:
}

@end