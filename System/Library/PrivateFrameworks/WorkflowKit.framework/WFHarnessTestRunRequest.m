@interface WFHarnessTestRunRequest
+ (BOOL)supportsSecureCoding;
- (WFHarnessTestRunDescriptor)testRunDescriptor;
- (WFHarnessTestRunRequest)initWithCoder:(id)a3;
- (WFHarnessTestRunRequest)initWithTestBundleURL:(id)a3 xcTestClass:(id)a4 xcTestMethodName:(id)a5 testIdentifier:(id)a6 automationType:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)getInputWithCompletionHandler:(id)a3;
@end

@implementation WFHarnessTestRunRequest

- (void).cxx_destruct
{
}

- (WFHarnessTestRunDescriptor)testRunDescriptor
{
  return self->_testRunDescriptor;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFHarnessTestRunDescriptor *)self->_testRunDescriptor xcTestClass];
  v7 = [(WFHarnessTestRunDescriptor *)self->_testRunDescriptor xcTestMethodName];
  v8 = [(WFHarnessTestRunDescriptor *)self->_testRunDescriptor testIdentifier];
  v9 = [v3 stringWithFormat:@"<%@: %p, %@ %@, testIdentifier: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFHarnessTestRunRequest;
  id v4 = a3;
  [(WFWorkflowRunRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFHarnessTestRunRequest *)self testRunDescriptor];
  [v4 encodeObject:v5 forKey:@"testRunDescriptor"];
}

- (WFHarnessTestRunRequest)initWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testRunDescriptor"];
  if (!v5)
  {
    v8 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFHarnessTestRunRequest initWithCoder:]";
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Trying to deserialize a test run request, but there's no run descriptor attached to it. No idea what test case this request wants to run, failing.", buf, 0xCu);
    }

    id v6 = 0;
    goto LABEL_7;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFHarnessTestRunRequest;
  id v6 = [(WFWorkflowRunRequest *)&v10 initWithCoder:v4];
  if (v6)
  {
    id v7 = v5;
    self = (WFHarnessTestRunRequest *)*((void *)v6 + 15);
    *((void *)v6 + 15) = v7;
LABEL_7:
  }
  return (WFHarnessTestRunRequest *)v6;
}

- (void)getInputWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(WFHarnessTestRunRequest *)self testRunDescriptor];
  id v10 = 0;
  id v6 = [v5 loadTestCaseWithError:&v10];
  id v7 = v10;

  if (v6)
  {
    uint64_t v8 = [v6 input];
    v4[2](v4, v8, 0);

    id v4 = (void (**)(id, uint64_t, void))v8;
  }
  else
  {
    v9 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFHarnessTestRunRequest getInputWithCompletionHandler:]";
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Can't load harness test case when getting shortcut input: %@", buf, 0x16u);
    }

    ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v7);
  }
}

- (WFHarnessTestRunRequest)initWithTestBundleURL:(id)a3 xcTestClass:(id)a4 xcTestMethodName:(id)a5 testIdentifier:(id)a6 automationType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(WFWorkflowRunRequest *)self initWithInput:0 presentationMode:3];
  if (v17)
  {
    v18 = [[WFHarnessTestRunDescriptor alloc] initWithTestBundleURL:v12 xcTestClass:v13 xcTestMethodName:v14 testIdentifier:v15];
    testRunDescriptor = v17->_testRunDescriptor;
    v17->_testRunDescriptor = v18;

    v20 = (void *)[v16 copy];
    [(WFWorkflowRunRequest *)v17 setAutomationType:v20];

    [(WFWorkflowRunRequest *)v17 setOutputBehavior:2];
    v21 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end