@interface NUAssertionHandler
+ (BOOL)runningUnitTests;
+ (id)currentHandler;
- (NUAssertionHandler)init;
- (NUAssertionPolicyHandler)policy;
- (id)defaultPolicy;
- (id)defaultTestingPolicy;
- (id)newAssertionInfoInMethod:(SEL)a3 object:(id)a4 function:(id)a5 file:(id)a6 lineNumber:(unint64_t)a7 currentlyExecutingJobName:(id)a8 description:(id)a9 arguments:(char *)a10;
- (void)continueAfterAssertInFunction:(id)a3 file:(id)a4 lineNumber:(unint64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7 arguments:(char *)a8;
- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7;
- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(unint64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7 arguments:(char *)a8;
- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 currentlyExecutingJobName:(id)a7 description:(id)a8;
- (void)setPolicy:(id)a3;
@end

@implementation NUAssertionHandler

- (void).cxx_destruct
{
}

- (void)setPolicy:(id)a3
{
}

- (NUAssertionPolicyHandler)policy
{
  return (NUAssertionPolicyHandler *)objc_getProperty(self, a2, 8, 1);
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7
{
  id v8 = [(NUAssertionHandler *)self newAssertionInfoInMethod:0 object:0 function:a3 file:a4 lineNumber:a5 currentlyExecutingJobName:a6 description:a7 arguments:&v10];
  [v8 setIsFatal:1];
  v9 = [(NUAssertionHandler *)self policy];
  [v9 notifyAssertion:v8];

  abort();
}

- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 currentlyExecutingJobName:(id)a7 description:(id)a8
{
  id v9 = [(NUAssertionHandler *)self newAssertionInfoInMethod:a3 object:a4 function:0 file:a5 lineNumber:a6 currentlyExecutingJobName:a7 description:a8 arguments:&v11];
  [v9 setIsFatal:1];
  uint64_t v10 = [(NUAssertionHandler *)self policy];
  [v10 notifyAssertion:v9];

  abort();
}

- (void)continueAfterAssertInFunction:(id)a3 file:(id)a4 lineNumber:(unint64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7 arguments:(char *)a8
{
  id v10 = [(NUAssertionHandler *)self newAssertionInfoInMethod:0 object:0 function:a3 file:a4 lineNumber:a5 currentlyExecutingJobName:a6 description:a7 arguments:a8];
  [v10 setIsFatal:0];
  id v9 = [(NUAssertionHandler *)self policy];
  [v9 notifyAssertion:v10];
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(unint64_t)a5 currentlyExecutingJobName:(id)a6 description:(id)a7 arguments:(char *)a8
{
  id v9 = [(NUAssertionHandler *)self newAssertionInfoInMethod:0 object:0 function:a3 file:a4 lineNumber:a5 currentlyExecutingJobName:a6 description:a7 arguments:a8];
  [v9 setIsFatal:1];
  id v10 = [(NUAssertionHandler *)self policy];
  [v10 notifyAssertion:v9];

  abort();
}

- (id)newAssertionInfoInMethod:(SEL)a3 object:(id)a4 function:(id)a5 file:(id)a6 lineNumber:(unint64_t)a7 currentlyExecutingJobName:(id)a8 description:(id)a9 arguments:(char *)a10
{
  id v15 = a8;
  id v16 = a9;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  v20 = objc_alloc_init(NUAssertionInfo);
  [(NUAssertionInfo *)v20 setSelector:a3];
  [(NUAssertionInfo *)v20 setObjectClass:objc_opt_class()];
  [(NUAssertionInfo *)v20 setFunctionName:v18];

  BOOL v21 = objc_opt_class() == (void)v19;
  [(NUAssertionInfo *)v20 setIsClassMethod:v21];
  [(NUAssertionInfo *)v20 setFileName:v17];

  [(NUAssertionInfo *)v20 setLineNumber:a7];
  if (v15)
  {
    v22 = [NSString stringWithFormat:@"job: %@", v15];
    [(NUAssertionInfo *)v20 setCurrentlyExecutingJobName:v22];
  }
  else
  {
    [(NUAssertionInfo *)v20 setCurrentlyExecutingJobName:&stru_1F0017700];
  }
  v23 = (void *)[[NSString alloc] initWithFormat:v16 arguments:a10];

  [(NUAssertionInfo *)v20 setMessage:v23];
  return v20;
}

- (id)defaultTestingPolicy
{
  v2 = objc_alloc_init(NUAssertionPolicyComposite);
  v3 = objc_alloc_init(NUAssertionPolicyUnitTest);
  [(NUAssertionPolicyComposite *)v2 addPolicy:v3];

  return v2;
}

- (id)defaultPolicy
{
  if (+[NUAssertionHandler runningUnitTests])
  {
    v3 = [(NUAssertionHandler *)self defaultTestingPolicy];
  }
  else
  {
    v3 = objc_alloc_init(NUAssertionPolicyUnique);
    v4 = objc_alloc_init(NUAssertionPolicyDebuggerWarning);
    [(NUAssertionPolicyComposite *)v3 addPolicy:v4];

    v5 = objc_alloc_init(NUAssertionPolicyDebuggerFatal);
    [(NUAssertionPolicyComposite *)v3 addPolicy:v5];

    v6 = objc_alloc_init(NUAssertionPolicyCrashReport);
    [(NUAssertionPolicyComposite *)v3 addPolicy:v6];

    v7 = objc_alloc_init(NUAssertionPolicyAbort);
    [(NUAssertionPolicyComposite *)v3 addPolicy:v7];
  }

  return v3;
}

- (NUAssertionHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)NUAssertionHandler;
  v2 = [(NUAssertionHandler *)&v6 init];
  uint64_t v3 = [(NUAssertionHandler *)v2 defaultPolicy];
  policy = v2->_policy;
  v2->_policy = (NUAssertionPolicyHandler *)v3;

  return v2;
}

+ (BOOL)runningUnitTests
{
  return MEMORY[0x1F413F368](a1, a2);
}

+ (id)currentHandler
{
  if (currentHandler_onceToken != -1) {
    dispatch_once(&currentHandler_onceToken, &__block_literal_global_26634);
  }
  v2 = (void *)currentHandler_handler;

  return v2;
}

uint64_t __36__NUAssertionHandler_currentHandler__block_invoke()
{
  currentHandler_handler = objc_alloc_init(NUAssertionHandler);

  return MEMORY[0x1F41817F8]();
}

@end