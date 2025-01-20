@interface DMDBeginTransactionOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)UUIDsToTransactions;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (void)runWithRequest:(id)a3;
@end

@implementation DMDBeginTransactionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDBeginTransactionOperation;
  if (!objc_msgSendSuper2(&v10, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [v6 name];

  if (!v7)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v11 = DMFInvalidParameterErrorKey;
    CFStringRef v12 = @"request.name";
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

+ (id)whitelistedClassesForRequest
{
  uint64_t v2 = objc_opt_class();

  return +[NSSet setWithObject:v2];
}

+ (id)requiredEntitlements
{
  return &off_1000D2AB0;
}

- (void)runWithRequest:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100080454();
  }
  v4 = objc_opt_new();
  id v5 = [objc_alloc((Class)DMFBeginTransactionResultObject) initWithUUID:v4];
  [(DMDBeginTransactionOperation *)self endOperationWithResultObject:v5];
}

+ (id)UUIDsToTransactions
{
  if (qword_1000FB9D8 != -1) {
    dispatch_once(&qword_1000FB9D8, &stru_1000CA5F0);
  }
  uint64_t v2 = (void *)qword_1000FB9D0;

  return v2;
}

@end