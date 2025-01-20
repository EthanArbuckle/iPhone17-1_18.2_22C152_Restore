@interface WFHarnessTestResult
+ (BOOL)supportsSecureCoding;
+ (id)failureWithReason:(id)a3;
+ (id)failureWithReason:(id)a3 filePath:(id)a4 line:(int64_t)a5;
+ (id)successWithOutput:(id)a3;
- (BOOL)failed;
- (NSString)failureFilePath;
- (NSString)failureReason;
- (WFHarnessTestResult)initWithCoder:(id)a3;
- (WFHarnessTestResult)initWithFailure:(BOOL)a3 output:(id)a4 reason:(id)a5 failureFilePath:(id)a6 failureLine:(int64_t)a7;
- (WFWorkflowOutputRunResult)output;
- (id)description;
- (id)errorRepresentation;
- (int64_t)failureLine;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFHarnessTestResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureFilePath, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_output, 0);
}

- (int64_t)failureLine
{
  return self->_failureLine;
}

- (NSString)failureFilePath
{
  return self->_failureFilePath;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (WFWorkflowOutputRunResult)output
{
  return self->_output;
}

- (BOOL)failed
{
  return self->_failed;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if ([(WFHarnessTestResult *)self failed]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(WFHarnessTestResult *)self failureReason];
  v8 = [v3 stringWithFormat:@"<%@: %p failed: %@, failureReason: %@>", v5, self, v6, v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeBool:forKey:", -[WFHarnessTestResult failed](self, "failed"), @"failed");
  v4 = [(WFHarnessTestResult *)self output];
  [v7 encodeObject:v4 forKey:@"output"];

  v5 = [(WFHarnessTestResult *)self failureReason];
  [v7 encodeObject:v5 forKey:@"failureReason"];

  v6 = [(WFHarnessTestResult *)self failureFilePath];
  [v7 encodeObject:v6 forKey:@"failureFilePath"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[WFHarnessTestResult failureLine](self, "failureLine"), @"failureLine");
}

- (WFHarnessTestResult)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"failed"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"output"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"failureReason"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"failureFilePath"];
  uint64_t v9 = [v4 decodeIntegerForKey:@"failureLine"];

  v10 = [(WFHarnessTestResult *)self initWithFailure:v5 output:v6 reason:v7 failureFilePath:v8 failureLine:v9];
  return v10;
}

- (id)errorRepresentation
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ([(WFHarnessTestResult *)self failed])
  {
    v3 = [(WFHarnessTestResult *)self failureReason];

    id v4 = (void *)MEMORY[0x1E4F28C58];
    if (v3)
    {
      v13[0] = self;
      uint64_t v5 = *MEMORY[0x1E4F28568];
      v12[0] = @"WFHarnessTestErrorResult";
      v12[1] = v5;
      v6 = [(WFHarnessTestResult *)self failureReason];
      v13[1] = v6;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
      v8 = [v4 errorWithDomain:@"WFHarnessTestErrorDomain" code:1 userInfo:v7];
    }
    else
    {
      v10 = @"WFHarnessTestErrorResult";
      v11 = self;
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      v8 = [v4 errorWithDomain:@"WFHarnessTestErrorDomain" code:0 userInfo:v6];
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (WFHarnessTestResult)initWithFailure:(BOOL)a3 output:(id)a4 reason:(id)a5 failureFilePath:(id)a6 failureLine:(int64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)WFHarnessTestResult;
  v16 = [(WFHarnessTestResult *)&v24 init];
  v17 = v16;
  if (v16)
  {
    v16->_failed = a3;
    objc_storeStrong((id *)&v16->_output, a4);
    uint64_t v18 = [v14 copy];
    failureReason = v17->_failureReason;
    v17->_failureReason = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    failureFilePath = v17->_failureFilePath;
    v17->_failureFilePath = (NSString *)v20;

    v17->_failureLine = a7;
    v22 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)failureWithReason:(id)a3 filePath:(id)a4 line:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"WFHarnessTestResult.m", 49, @"Invalid parameter not satisfying: %@", @"failureReason" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"WFHarnessTestResult.m", 50, @"Invalid parameter not satisfying: %@", @"filePath" object file lineNumber description];

LABEL_3:
  v12 = [[WFHarnessTestResult alloc] initWithFailure:1 output:0 reason:v9 failureFilePath:v11 failureLine:a5];

  return v12;
}

+ (id)failureWithReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFHarnessTestResult.m", 42, @"Invalid parameter not satisfying: %@", @"failureReason" object file lineNumber description];
  }
  v6 = [[WFHarnessTestResult alloc] initWithFailure:1 output:0 reason:v5 failureFilePath:0 failureLine:0];

  return v6;
}

+ (id)successWithOutput:(id)a3
{
  id v3 = a3;
  id v4 = [WFHarnessTestResult alloc];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB4A68]) initWithOutput:v3];

  v6 = [(WFHarnessTestResult *)v4 initWithFailure:0 output:v5 reason:0 failureFilePath:0 failureLine:0];
  return v6;
}

@end