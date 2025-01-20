@interface WFHarnessActionContext
- (NSString)identifier;
- (WFHarnessActionContext)initWithIdentifier:(id)a3 indexInWorkflow:(unint64_t)a4;
- (unint64_t)indexInWorkflow;
@end

@implementation WFHarnessActionContext

- (void).cxx_destruct
{
}

- (unint64_t)indexInWorkflow
{
  return self->_indexInWorkflow;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFHarnessActionContext)initWithIdentifier:(id)a3 indexInWorkflow:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFHarnessActionSelector.m", 16, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)WFHarnessActionContext;
  v8 = [(WFHarnessActionContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_indexInWorkflow = a4;
    v11 = v8;
  }

  return v8;
}

@end