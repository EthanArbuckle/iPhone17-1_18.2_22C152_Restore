@interface DMDUpdateDeclarationsOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runOnMainThread;
- (unint64_t)queueGroup;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDUpdateDeclarationsOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3338;
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
    v6 = [(DMDTaskOperation *)self configurationEngine];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10007879C;
    v7[3] = &unk_1000CADD0;
    v7[4] = self;
    [v6 handleUpdateDeclarationsRequest:v4 completionHandler:v7];
  }
  else
  {
    v6 = DMFErrorWithCodeAndUserInfo();
    [(DMDUpdateDeclarationsOperation *)self endOperationWithError:v6];
  }
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___DMDUpdateDeclarationsOperation;
  if (!objc_msgSendSuper2(&v13, "validateRequest:error:", v6, a4)) {
    goto LABEL_10;
  }
  v7 = [v6 organizationIdentifier];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v16 = DMFInvalidParameterErrorKey;
    CFStringRef v17 = @"request.organizationIdentifier";
    v9 = &v17;
    v10 = &v16;
    goto LABEL_9;
  }
  v8 = [v6 syncToken];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_11;
    }
    uint64_t v14 = DMFInvalidParameterErrorKey;
    CFStringRef v15 = @"request.syncToken";
    v9 = &v15;
    v10 = &v14;
LABEL_9:
    v11 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v10 count:1];
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