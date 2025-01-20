@interface DMDTaskOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
+ (NSArray)requiredEntitlements;
+ (NSSet)whitelistedClassesForRequest;
- (BOOL)isAsynchronous;
- (BOOL)runConcurrently;
- (BOOL)runOnMainThread;
- (DMDConfigurationEngine)configurationEngine;
- (DMDTaskOperation)initWithRequest:(id)a3;
- (DMDTaskOperationContext)context;
- (OS_os_transaction)transaction;
- (unint64_t)queueGroup;
- (void)dealloc;
- (void)endOperationWithDMFErrorCode:(int64_t)a3;
- (void)main;
- (void)operationDidFinish;
- (void)operationWillFinish;
- (void)operationWillStart;
- (void)runWithRequest:(id)a3;
- (void)setConfigurationEngine:(id)a3;
- (void)setContext:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMDTaskOperation

- (void)dealloc
{
  v3 = self->_transaction;
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_4;
  block[3] = &unk_1000CA508;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)DMDTaskOperation;
  [(DMDTaskOperation *)&v6 dealloc];
}

- (DMDTaskOperation)initWithRequest:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMDTaskOperation;
  v3 = [(DMDTaskOperation *)&v8 initWithRequest:a3];
  if (v3)
  {
    id v4 = +[NSString stringWithFormat:@"%p", v3];
    [v4 UTF8String];
    uint64_t v5 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;
  }
  return v3;
}

- (void)operationWillStart
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v5 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Operation will start: %{public}@", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)DMDTaskOperation;
  [(DMDTaskOperation *)&v3 operationWillStart];
}

- (void)operationWillFinish
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v5 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Operation will finish: %{public}@", buf, 0xCu);
  }
  v3.receiver = self;
  v3.super_class = (Class)DMDTaskOperation;
  [(DMDTaskOperation *)&v3 operationWillFinish];
  [(DMDTaskOperation *)self setTransaction:0];
}

- (void)operationDidFinish
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10008830C((uint64_t)self);
  }
  v3.receiver = self;
  v3.super_class = (Class)DMDTaskOperation;
  [(DMDTaskOperation *)&v3 operationDidFinish];
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDTaskOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4)) {
    goto LABEL_6;
  }
  v7 = [a1 whitelistedClassesForRequest];
  unsigned __int8 v8 = [v7 containsObject:objc_opt_class()];

  if ((v8 & 1) == 0)
  {
    if (!a4) {
      goto LABEL_7;
    }
    uint64_t v12 = DMFInvalidParameterErrorKey;
    CFStringRef v13 = @"request";
    v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
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

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  if ([(DMDTaskOperation *)self runOnMainThread]
    && !+[NSThread isMainThread])
  {
    uint64_t v4 = [(DMDTaskOperation *)self isAsynchronous] ^ 1;
    [(DMDTaskOperation *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:v4];
  }
  else
  {
    id v5 = [(DMDTaskOperation *)self request];
    [(DMDTaskOperation *)self runWithRequest:v5];
  }
}

+ (NSArray)requiredEntitlements
{
  return (NSArray *)&__NSArray0__struct;
}

+ (NSSet)whitelistedClassesForRequest
{
  return 0;
}

- (unint64_t)queueGroup
{
  return 0;
}

- (BOOL)runConcurrently
{
  return 0;
}

- (BOOL)runOnMainThread
{
  return 0;
}

- (void)runWithRequest:(id)a3
{
}

- (void)endOperationWithDMFErrorCode:(int64_t)a3
{
  DMFErrorWithCodeAndUserInfo();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(DMDTaskOperation *)self endOperationWithError:v4];
}

- (DMDTaskOperationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (DMDConfigurationEngine)configurationEngine
{
  return self->_configurationEngine;
}

- (void)setConfigurationEngine:(id)a3
{
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
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_configurationEngine, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end