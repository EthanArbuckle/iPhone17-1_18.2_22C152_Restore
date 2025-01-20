@interface DMDDeleteUserOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDDeleteUserOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2BE8;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDDeleteUserOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [v6 username];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v11 = DMFInvalidParameterErrorKey;
    CFStringRef v12 = @"request.message";
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
  v5 = +[UMUserManager sharedManager];
  id v6 = [v5 allUsers];
  if (v6)
  {
    v7 = [v4 username];
    v8 = [v5 currentUser];
    v9 = [v8 username];
    unsigned int v10 = [v9 isEqualToString:v7];

    if (v10)
    {
      [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1801];
    }
    else
    {
      v20 = self;
      v21 = v4;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v11 = v6;
      id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v24;
LABEL_7:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * v15);
          v17 = [v16 username];
          unsigned __int8 v18 = [v17 isEqualToString:v7];

          if (v18) {
            break;
          }
          if (v13 == (id)++v15)
          {
            id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v13) {
              goto LABEL_7;
            }
            goto LABEL_13;
          }
        }
        id v19 = v16;

        if (!v19) {
          goto LABEL_18;
        }
        id v4 = v21;
        if ([v19 hasDataToSync]
          && ([v21 forceDeletion] & 1) == 0)
        {
          [(DMDTaskOperation *)v20 endOperationWithDMFErrorCode:1803];
        }
        else
        {
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_10003A87C;
          v22[3] = &unk_1000CADD0;
          v22[4] = v20;
          [v5 deleteUser:v19 completionHandler:v22];
        }
      }
      else
      {
LABEL_13:

LABEL_18:
        [(DMDTaskOperation *)v20 endOperationWithDMFErrorCode:1802];
        id v4 = v21;
      }
    }
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1700];
  }
}

@end