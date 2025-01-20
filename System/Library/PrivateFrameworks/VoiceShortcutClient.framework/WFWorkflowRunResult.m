@interface WFWorkflowRunResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isCancelled;
- (NSError)error;
- (WFWorkflowRunResult)initWithCoder:(id)a3;
- (WFWorkflowRunResult)initWithError:(id)a3;
- (id)description;
- (id)resultBySettingError:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWorkflowRunResult

- (void).cxx_destruct
{
}

- (NSError)error
{
  if ([(WFWorkflowRunResult *)self isCancelled])
  {
    v3 = 0;
  }
  else
  {
    if (self) {
      internalError = self->_internalError;
    }
    else {
      internalError = 0;
    }
    v3 = internalError;
  }
  return v3;
}

- (BOOL)isCancelled
{
  if (self) {
    internalError = self->_internalError;
  }
  else {
    internalError = 0;
  }
  v4 = internalError;
  v5 = [(NSError *)v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    if (self) {
      v6 = self->_internalError;
    }
    else {
      v6 = 0;
    }
    BOOL v7 = [(NSError *)v6 code] == 3072;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (WFWorkflowRunResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = WFAllowedClassesForDecodingNSError();
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"error"];

  BOOL v7 = [(WFWorkflowRunResult *)self initWithError:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (self && (id v4 = self->_internalError) != 0)
  {
    v5 = v4;
    v6 = self->_internalError;
    BOOL v7 = WFEncodableError(v6);
    [v8 encodeObject:v7 forKey:@"error"];
  }
  else
  {
    [v8 encodeObject:0 forKey:@"error"];
    v5 = 0;
  }
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self) {
    internalError = self->_internalError;
  }
  else {
    internalError = 0;
  }
  id v8 = [v3 stringWithFormat:@"<%@: %p Error: %@>", v5, self, internalError];

  return v8;
}

- (id)resultBySettingError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithError:v3];

  return v4;
}

- (WFWorkflowRunResult)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowRunResult;
  v6 = [(WFWorkflowRunResult *)&v10 init];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_internalError, a3);
    id v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end