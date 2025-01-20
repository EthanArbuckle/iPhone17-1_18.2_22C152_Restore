@interface WFHandoffRunDescriptor
- (WFHandoffRunDescriptor)initWithContext:(id)a3;
- (WFWorkflowRunningContext)context;
@end

@implementation WFHandoffRunDescriptor

- (void).cxx_destruct
{
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (WFHandoffRunDescriptor)initWithContext:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFHandoffRunDescriptor.m", 16, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFHandoffRunDescriptor;
  v7 = [(WFHandoffRunDescriptor *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_context, a3);
    v9 = v8;
  }

  return v8;
}

@end