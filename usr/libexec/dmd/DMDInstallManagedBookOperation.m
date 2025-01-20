@interface DMDInstallManagedBookOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDInstallManagedBookOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2EA0;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___DMDInstallManagedBookOperation;
  if (!objc_msgSendSuper2(&v14, "validateRequest:error:", v6, a4)) {
    goto LABEL_13;
  }
  v7 = [v6 URL];

  if (v7)
  {
    v8 = [v6 persistentID];

    if (!v8)
    {
      if (a4) {
        goto LABEL_10;
      }
      goto LABEL_13;
    }
  }
  else
  {
    v9 = [v6 iTunesStoreID];

    if (!v9)
    {
      if (a4)
      {
LABEL_10:
        DMFErrorWithCodeAndUserInfo();
        BOOL v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
LABEL_13:
      BOOL v11 = 0;
      goto LABEL_14;
    }
    v10 = [v6 originator];

    if (!v10)
    {
      if (a4)
      {
        uint64_t v15 = DMFInvalidParameterErrorKey;
        CFStringRef v16 = @"request.originator";
        v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
        DMFErrorWithCodeAndUserInfo();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_13;
    }
  }
  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  v5 = +[DMDPowerAssertion assertionForOperation:@"DMDInstallManagedBookOperation: run"];
  if (MCHasMDMMigrated())
  {
    id v6 = [v4 iTunesStoreID];
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_1000500F8;
    v21 = &unk_1000CB290;
    v22 = self;
    id v7 = v5;
    id v23 = v7;
    v8 = objc_retainBlock(&v18);
    v9 = +[DMDManagedMediaManager sharedManager];
    if (v6)
    {
      v10 = [v4 originator];
      [v9 installStoreBookWithiTunesStoreID:v6 originator:v10 assertion:v7 completionBlock:v8];
    }
    else
    {
      v10 = objc_opt_new();
      BOOL v11 = [v4 persistentID];
      [v10 setPersistentID:v11];

      v12 = [v4 author];
      [v10 setAuthor:v12];

      v13 = [v4 title];
      [v10 setTitle:v13];

      objc_super v14 = [v4 version];
      [v10 setVersion:v14];

      unint64_t v15 = (unint64_t)[v4 type];
      if (v15 > 2) {
        CFStringRef v16 = 0;
      }
      else {
        CFStringRef v16 = *off_1000CB2B0[v15];
      }
      [v10 setKind:v16];
      v17 = [v4 URL];
      [v9 installNonStoreBook:v10 fileExtension:v16 URL:v17 assertion:v7 completionBlock:v8];
    }
  }
  else
  {
    [(DMDTaskOperation *)self endOperationWithDMFErrorCode:1650];
  }
}

@end