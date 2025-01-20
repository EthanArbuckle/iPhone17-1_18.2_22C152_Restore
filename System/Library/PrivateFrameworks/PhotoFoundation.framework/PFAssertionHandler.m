@interface PFAssertionHandler
+ (BOOL)runningUnderDebugger;
+ (BOOL)runningUnitTests;
+ (id)currentHandler;
+ (void)install;
- (PFAssertionHandler)init;
- (PFAssertionPolicyHandler)policy;
- (id)defaultPolicy;
- (id)defaultTestingPolicy;
- (id)newAssertionInfoInMethod:(SEL)a3 object:(id)a4 function:(id)a5 file:(id)a6 lineNumber:(int64_t)a7 description:(id)a8 arguments:(char *)a9;
- (void)_install;
- (void)continueAfterAssertInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7;
- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6;
- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7;
- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 description:(id)a7;
- (void)setPolicy:(id)a3;
@end

@implementation PFAssertionHandler

- (void).cxx_destruct
{
}

- (void)setPolicy:(id)a3
{
}

- (PFAssertionPolicyHandler)policy
{
  return (PFAssertionPolicyHandler *)objc_getProperty(self, a2, 8, 1);
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6
{
  id v7 = -[PFAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:", 0, 0, a3, a4, a5, a6, &v9, &v9);
  [v7 setIsFatal:1];
  v8 = [(PFAssertionHandler *)self policy];
  [v8 notifyAssertion:v7];

  abort();
}

- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 description:(id)a7
{
  id v8 = -[PFAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:", a3, a4, 0, a5, a6, a7, &v10, &v10);
  [v8 setIsFatal:1];
  uint64_t v9 = [(PFAssertionHandler *)self policy];
  [v9 notifyAssertion:v8];

  abort();
}

- (void)continueAfterAssertInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7
{
  id v9 = [(PFAssertionHandler *)self newAssertionInfoInMethod:0 object:0 function:a3 file:a4 lineNumber:a5 description:a6 arguments:a7];
  [v9 setIsFatal:0];
  id v8 = [(PFAssertionHandler *)self policy];
  [v8 notifyAssertion:v9];
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7
{
  id v8 = [(PFAssertionHandler *)self newAssertionInfoInMethod:0 object:0 function:a3 file:a4 lineNumber:a5 description:a6 arguments:a7];
  [v8 setIsFatal:1];
  id v9 = [(PFAssertionHandler *)self policy];
  [v9 notifyAssertion:v8];

  abort();
}

- (id)newAssertionInfoInMethod:(SEL)a3 object:(id)a4 function:(id)a5 file:(id)a6 lineNumber:(int64_t)a7 description:(id)a8 arguments:(char *)a9
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = objc_alloc_init(PFAssertionInfo);
  [(PFAssertionInfo *)v18 setSelector:a3];
  [(PFAssertionInfo *)v18 setObjectClass:objc_opt_class()];
  [(PFAssertionInfo *)v18 setFunctionName:v16];

  BOOL v19 = objc_opt_class() == (void)v17;
  [(PFAssertionInfo *)v18 setIsClassMethod:v19];
  [(PFAssertionInfo *)v18 setFileName:v15];

  [(PFAssertionInfo *)v18 setLineNumber:a7];
  v20 = (void *)[[NSString alloc] initWithFormat:v14 arguments:a9];

  [(PFAssertionInfo *)v18 setMessage:v20];
  v21 = [MEMORY[0x1E4F29060] callStackSymbols];
  v22 = objc_msgSend(v21, "subarrayWithRange:", 0, objc_msgSend(v21, "count") - 2);
  [(PFAssertionInfo *)v18 setBacktrace:v22];

  return v18;
}

- (void)_install
{
  v2 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v2, sel_currentHandler);
  v4 = (objc_class *)objc_opt_class();
  v5 = class_getClassMethod(v4, sel_currentHandler);
  Implementation = method_getImplementation(v5);
  method_setImplementation(ClassMethod, Implementation);
}

- (id)defaultTestingPolicy
{
  v2 = objc_alloc_init(PFAssertionPolicyComposite);
  v3 = objc_alloc_init(PFAssertionPolicyLog);
  [(PFAssertionPolicyComposite *)v2 addPolicy:v3];

  v4 = objc_alloc_init(PFAssertionPolicyUnitTest);
  [(PFAssertionPolicyComposite *)v2 addPolicy:v4];

  return v2;
}

- (id)defaultPolicy
{
  if (+[PFAssertionHandler runningUnitTests])
  {
    v3 = [(PFAssertionHandler *)self defaultTestingPolicy];
  }
  else
  {
    v3 = objc_alloc_init(PFAssertionPolicyUnique);
    v4 = objc_alloc_init(PFAssertionPolicyLog);
    [(PFAssertionPolicyComposite *)v3 addPolicy:v4];

    v5 = objc_alloc_init(PFAssertionPolicyDebuggerWarning);
    [(PFAssertionPolicyComposite *)v3 addPolicy:v5];

    v6 = objc_alloc_init(PFAssertionPolicyDebuggerFatal);
    [(PFAssertionPolicyComposite *)v3 addPolicy:v6];

    id v7 = objc_alloc_init(PFAssertionPolicyCrashReport);
    [(PFAssertionPolicyComposite *)v3 addPolicy:v7];

    id v8 = objc_alloc_init(PFAssertionPolicyAbort);
    [(PFAssertionPolicyComposite *)v3 addPolicy:v8];
  }
  return v3;
}

- (PFAssertionHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)PFAssertionHandler;
  v2 = [(PFAssertionHandler *)&v6 init];
  uint64_t v3 = [(PFAssertionHandler *)v2 defaultPolicy];
  policy = v2->_policy;
  v2->_policy = (PFAssertionPolicyHandler *)v3;

  return v2;
}

+ (BOOL)runningUnderDebugger
{
  if (runningUnderDebugger_onceToken != -1) {
    dispatch_once(&runningUnderDebugger_onceToken, &__block_literal_global_2);
  }
  return runningUnderDebugger_runningUnderDebugger;
}

uint64_t __42__PFAssertionHandler_runningUnderDebugger__block_invoke()
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  memset(v2, 0, sizeof(v2));
  LODWORD(v3) = 0;
  *(void *)v33 = 0xE00000001;
  int v34 = 1;
  pid_t v35 = getpid();
  size_t v1 = 648;
  uint64_t result = sysctl(v33, 4u, v2, &v1, 0, 0);
  runningUnderDebugger_runningUnderDebugger = (v3 & 0x800) != 0;
  return result;
}

+ (BOOL)runningUnitTests
{
  if (PFProcessIsLaunchedToExecuteTests_predicate != -1) {
    dispatch_once(&PFProcessIsLaunchedToExecuteTests_predicate, &__block_literal_global_21);
  }
  return PFProcessIsLaunchedToExecuteTests_isLaunchedToExecuteTests;
}

+ (void)install
{
  id v2 = (id)[a1 currentHandler];
}

+ (id)currentHandler
{
  if (currentHandler_onceToken != -1) {
    dispatch_once(&currentHandler_onceToken, &__block_literal_global_41);
  }
  id v2 = (void *)currentHandler_handler;
  return v2;
}

uint64_t __36__PFAssertionHandler_currentHandler__block_invoke()
{
  v0 = objc_alloc_init(PFAssertionHandler);
  size_t v1 = (void *)currentHandler_handler;
  currentHandler_handler = (uint64_t)v0;

  id v2 = (void *)currentHandler_handler;
  return [v2 _install];
}

@end