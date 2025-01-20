@interface PXSectionedDataSourceWaitingCondition
- (id)completionHandler;
- (id)condition;
- (void)setCompletionHandler:(id)a3;
- (void)setCondition:(id)a3;
@end

@implementation PXSectionedDataSourceWaitingCondition

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong(&self->_condition, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCondition:(id)a3
{
}

- (id)condition
{
  return self->_condition;
}

@end