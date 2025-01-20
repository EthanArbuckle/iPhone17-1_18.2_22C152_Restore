@interface DMDClearRestrictionsPasswordOperation
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDClearRestrictionsPasswordOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2AE0;
}

- (void)runWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v5 = (void *)qword_1000FB9F0;
  uint64_t v16 = qword_1000FB9F0;
  if (!qword_1000FB9F0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000293E0;
    v12[3] = &unk_1000C9F48;
    v12[4] = &v13;
    sub_1000293E0((uint64_t)v12);
    v5 = (void *)v14[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v13, 8);
  v7 = objc_opt_new();
  v8 = v7;
  if (!v7)
  {
    id v10 = 0;
    goto LABEL_7;
  }
  id v11 = 0;
  unsigned __int8 v9 = [v7 clearRestrictionsPasscodeWithError:&v11];
  id v10 = v11;
  if (v9)
  {
LABEL_7:
    [(DMDClearRestrictionsPasswordOperation *)self endOperationWithResultObject:0];
    goto LABEL_8;
  }
  [(DMDClearRestrictionsPasswordOperation *)self endOperationWithError:v10];
LABEL_8:
}

@end