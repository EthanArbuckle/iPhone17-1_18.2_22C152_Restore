@interface WFAnyToolKitVariableContent
+ (BOOL)supportsSecureCoding;
+ (id)objectWithVariableContent:(id)a3;
- (WFAnyToolKitVariableContent)initWithCoder:(id)a3;
- (WFAnyToolKitVariableContent)initWithVariableContent:(id)a3;
- (WFToolKitVariableContent)variableContent;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAnyToolKitVariableContent

- (void).cxx_destruct
{
}

- (WFToolKitVariableContent)variableContent
{
  return self->_variableContent;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAnyToolKitVariableContent *)self variableContent];
  [v4 encodeObject:v5 forKey:@"variableContent"];
}

- (WFAnyToolKitVariableContent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "setWithObjects:", objc_opt_class(), 0);
  v7 = [v5 decodeObjectOfClasses:v6 forKey:@"variableContent"];

  if (v7)
  {
    self = [(WFAnyToolKitVariableContent *)self initWithVariableContent:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (WFAnyToolKitVariableContent)initWithVariableContent:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFSageWorkflowRunnerClient.m", 224, @"Invalid parameter not satisfying: %@", @"variableContent" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFAnyToolKitVariableContent;
  v7 = [(WFAnyToolKitVariableContent *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_variableContent, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithVariableContent:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = (void *)[objc_alloc((Class)a1) initWithVariableContent:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end