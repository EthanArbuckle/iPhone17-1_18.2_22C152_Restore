@interface REExpectation
- (REExpectation)init;
- (int64_t)outstandingOperations;
- (void)beginOperation;
- (void)endOperation;
- (void)notifyOperationsCompleteOnQueue:(id)a3 block:(id)a4;
- (void)notifyOperationsCompleteOrPerformUsingQueue:(id)a3 block:(id)a4;
@end

@implementation REExpectation

- (void).cxx_destruct
{
}

- (void)notifyOperationsCompleteOrPerformUsingQueue:(id)a3 block:(id)a4
{
  id v7 = a3;
  v6 = (void (**)(void))a4;
  if ([(REExpectation *)self outstandingOperations]) {
    [(REExpectation *)self notifyOperationsCompleteOnQueue:v7 block:v6];
  }
  else {
    v6[2](v6);
  }
}

- (int64_t)outstandingOperations
{
  return (int)atomic_fetch_or(&self->_count, 0);
}

- (void)endOperation
{
}

- (void)beginOperation
{
}

- (REExpectation)init
{
  v6.receiver = self;
  v6.super_class = (Class)REExpectation;
  v2 = [(REExpectation *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v3;
  }
  return v2;
}

- (void)notifyOperationsCompleteOnQueue:(id)a3 block:(id)a4
{
}

@end