@interface WFWorkflowDataRunDescriptor
+ (BOOL)supportsSecureCoding;
- (NSData)workflowData;
- (WFWorkflowDataRunDescriptor)initWithCoder:(id)a3;
- (WFWorkflowDataRunDescriptor)initWithWorkflowData:(id)a3;
- (id)description;
- (id)kind;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFWorkflowDataRunDescriptor

- (void).cxx_destruct
{
}

- (NSData)workflowData
{
  return self->_workflowData;
}

- (id)kind
{
  return @"WorkflowFromData";
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowDataRunDescriptor *)self workflowData];
  [v4 encodeObject:v5 forKey:@"workflowData"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(WFWorkflowDataRunDescriptor *)self workflowData];
  v7 = [v3 stringWithFormat:@"<%@: %p, data: %lu bytes>", v5, self, objc_msgSend(v6, "length")];

  return v7;
}

- (WFWorkflowDataRunDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowData"];

  if (v5)
  {
    self = [(WFWorkflowDataRunDescriptor *)self initWithWorkflowData:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WFWorkflowDataRunDescriptor)initWithWorkflowData:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFWorkflowRunDescriptors.m", 102, @"Invalid parameter not satisfying: %@", @"workflowData" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFWorkflowDataRunDescriptor;
  v6 = [(WFWorkflowDataRunDescriptor *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    workflowData = v6->_workflowData;
    v6->_workflowData = (NSData *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end