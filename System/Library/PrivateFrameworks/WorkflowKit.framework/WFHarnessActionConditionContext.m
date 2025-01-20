@interface WFHarnessActionConditionContext
- (WFHarnessActionConditionContext)initWithVariableDataSource:(id)a3;
- (WFVariableDataSource)variableDataSource;
@end

@implementation WFHarnessActionConditionContext

- (void).cxx_destruct
{
}

- (WFVariableDataSource)variableDataSource
{
  return self->_variableDataSource;
}

- (WFHarnessActionConditionContext)initWithVariableDataSource:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFHarnessActionConditionContext;
  v6 = [(WFHarnessActionConditionContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_variableDataSource, a3);
    v8 = v7;
  }

  return v7;
}

@end