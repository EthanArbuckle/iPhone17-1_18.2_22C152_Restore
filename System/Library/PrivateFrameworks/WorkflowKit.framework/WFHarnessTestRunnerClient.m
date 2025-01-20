@interface WFHarnessTestRunnerClient
- (WFHarnessTestRunnerClient)initWithRunRequest:(id)a3;
- (WFHarnessTestRunnerClientDelegate)testDelegate;
- (id)description;
- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4;
- (void)setTestDelegate:(id)a3;
@end

@implementation WFHarnessTestRunnerClient

- (void)setTestDelegate:(id)a3
{
  self->_testDelegate = (WFHarnessTestRunnerClientDelegate *)a3;
}

- (WFHarnessTestRunnerClientDelegate)testDelegate
{
  return self->_testDelegate;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFWorkflowRunnerClient *)self runRequest];
  v7 = [v3 stringWithFormat:@"<%@: %p, runRequest: %@>", v5, self, v6];

  return v7;
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = v6;
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  id v9 = v8;
  v10 = [v9 testResult];

  v11 = objc_opt_class();
  v12 = [v6 error];
  v13 = [v11 underlyingErrorIfRunnerError:v12];

  v14 = [(WFHarnessTestRunnerClient *)self testDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    v16 = [(WFHarnessTestRunnerClient *)self testDelegate];
    [v16 workflowRunnerClient:self didFinishRunningHarnessTestsWithResult:v10 error:v13];
  }
  else
  {
    v17 = getWFTestingLifecycleLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      v19 = "-[WFHarnessTestRunnerClient handleWorkflowRunResult:completion:]";
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEFAULT, "%s WFHarnessTestRunnerClient skipping callback because testDelegate does not respond to didFinishRunningHarnessTestsWithResult", (uint8_t *)&v18, 0xCu);
    }
  }
  v7[2](v7);
}

- (WFHarnessTestRunnerClient)initWithRunRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFHarnessTestRunnerClient.m", 19, @"Invalid parameter not satisfying: %@", @"runRequest" object file lineNumber description];
  }
  id v6 = [v5 testRunDescriptor];
  v12.receiver = self;
  v12.super_class = (Class)WFHarnessTestRunnerClient;
  v7 = [(WFWorkflowRunnerClient *)&v12 initWithDescriptor:v6 runRequest:v5];
  v8 = v7;
  if (v7) {
    id v9 = v7;
  }

  return v8;
}

@end