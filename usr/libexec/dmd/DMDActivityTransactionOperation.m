@interface DMDActivityTransactionOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)whitelistedClassesForRequest;
- (BOOL)runConcurrently;
- (BOOL)runOnMainThread;
- (OS_os_transaction)transaction;
- (void)cancel;
- (void)endOperationIfNeeded;
- (void)runWithRequest:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMDActivityTransactionOperation

- (BOOL)runConcurrently
{
  return 1;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___DMDActivityTransactionOperation;
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
  return &off_1000D2A80;
}

- (BOOL)runOnMainThread
{
  return 1;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)DMDActivityTransactionOperation;
  [(DMDActivityTransactionOperation *)&v3 cancel];
  [(DMDActivityTransactionOperation *)self performSelectorOnMainThread:"endOperationIfNeeded" withObject:0 waitUntilDone:0];
}

- (void)endOperationIfNeeded
{
  if ([(DMDActivityTransactionOperation *)self isExecuting])
  {
    [(DMDActivityTransactionOperation *)self endOperationWithResultObject:0];
  }
}

- (void)runWithRequest:(id)a3
{
  id v5 = [a3 name];
  [v5 UTF8String];
  v4 = (void *)os_transaction_create();
  [(DMDActivityTransactionOperation *)self setTransaction:v4];
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end