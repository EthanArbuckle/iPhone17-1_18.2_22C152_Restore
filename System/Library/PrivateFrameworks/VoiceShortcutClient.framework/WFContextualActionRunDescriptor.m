@interface WFContextualActionRunDescriptor
+ (BOOL)supportsSecureCoding;
- (WFContextualAction)action;
- (WFContextualActionContext)context;
- (WFContextualActionRunDescriptor)initWithAction:(id)a3 context:(id)a4;
- (WFContextualActionRunDescriptor)initWithCoder:(id)a3;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContextualActionRunDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (WFContextualActionContext)context
{
  return self->_context;
}

- (WFContextualAction)action
{
  return self->_action;
}

- (id)kind
{
  v3 = [(WFContextualActionRunDescriptor *)self action];
  v4 = [v3 workflowRunKind];

  if (v4)
  {
    v5 = [(WFContextualActionRunDescriptor *)self action];
    v6 = [v5 workflowRunKind];
  }
  else
  {
    v6 = @"ContextualAction";
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFContextualActionRunDescriptor *)self action];
  [v4 encodeObject:v5 forKey:@"action"];

  id v6 = [(WFContextualActionRunDescriptor *)self context];
  [v4 encodeObject:v6 forKey:@"context"];
}

- (WFContextualActionRunDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(WFContextualActionRunDescriptor *)self initWithAction:v5 context:v6];
    v8 = self;
  }

  return v8;
}

- (WFContextualActionRunDescriptor)initWithAction:(id)a3 context:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFWorkflowRunDescriptors.m", 173, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFContextualActionRunDescriptor;
  v10 = [(WFContextualActionRunDescriptor *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_action, a3);
    objc_storeStrong((id *)&v11->_context, a4);
    v12 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end