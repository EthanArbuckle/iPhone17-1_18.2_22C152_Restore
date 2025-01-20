@interface DMDRemoveManagedBookOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDRemoveManagedBookOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D3038;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDRemoveManagedBookOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4)) {
    goto LABEL_8;
  }
  v7 = [v6 persistentID];
  if (!v7)
  {
    v8 = [v6 iTunesStoreID];

    if (v8) {
      goto LABEL_5;
    }
    if (a4)
    {
      DMFErrorWithCodeAndUserInfo();
      BOOL v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }

LABEL_5:
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  if (MCHasMDMMigrated())
  {
    v5 = +[DMDManagedMediaManager sharedManager];
    +[DMDPowerAssertion assertionForOperation:@"DMDRemoveManagedBookOperation: run"];
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10006D6D0;
    v13 = &unk_1000C9BE0;
    v14 = self;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v6;
    v7 = objc_retainBlock(&v10);
    v8 = [v4 persistentID:v10, v11, v12, v13, v14];

    if (v8)
    {
      BOOL v9 = [v4 persistentID];
      [v5 removeNonStoreBookWithPersistentID:v9 assertion:v6 completionBlock:v7];
    }
    else
    {
      BOOL v9 = [v4 iTunesStoreID];
      [v5 removeStoreBookWithiTunesStoreID:v9 assertion:v6 completionBlock:v7];
    }
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1650];
  }
}

@end