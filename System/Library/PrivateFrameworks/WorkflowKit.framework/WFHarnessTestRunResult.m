@interface WFHarnessTestRunResult
+ (BOOL)supportsSecureCoding;
- (WFHarnessTestResult)testResult;
- (WFHarnessTestRunResult)initWithCoder:(id)a3;
- (WFHarnessTestRunResult)initWithTestResult:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFHarnessTestRunResult

- (void).cxx_destruct
{
}

- (WFHarnessTestResult)testResult
{
  return self->_testResult;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFHarnessTestRunResult;
  v4 = [(WFWorkflowRunResult *)&v8 description];
  v5 = [(WFHarnessTestRunResult *)self testResult];
  v6 = [v3 stringWithFormat:@"<%@, testResult: %@>", v4, v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFHarnessTestRunResult;
  id v4 = a3;
  [(WFWorkflowRunResult *)&v6 encodeWithCoder:v4];
  v5 = [(WFHarnessTestRunResult *)self testResult];
  [v4 encodeObject:v5 forKey:@"testResult"];
}

- (WFHarnessTestRunResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFHarnessTestRunResult;
  v5 = [(WFWorkflowRunResult *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"testResult"];
    testResult = v5->_testResult;
    v5->_testResult = (WFHarnessTestResult *)v6;

    objc_super v8 = v5;
  }

  return v5;
}

- (WFHarnessTestRunResult)initWithTestResult:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFHarnessTestRunResult.m", 17, @"Invalid parameter not satisfying: %@", @"testResult" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFHarnessTestRunResult;
  v7 = [(WFWorkflowRunResult *)&v12 initWithError:0];
  objc_super v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_testResult, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end