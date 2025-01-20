@interface PUActivityItemSourceOperation
- (BOOL)_pu_isCancelled;
- (NSString)activityType;
- (OS_dispatch_semaphore)semaphore;
- (PUActivityItemSourceOperation)initWithDelegate:(id)a3 activityType:(id)a4;
- (PUActivityItemSourceOperationDelegate)delegate;
- (void)_pu_setCancelled:(BOOL)a3;
- (void)main;
- (void)pu_cancel;
@end

@implementation PUActivityItemSourceOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_pu_setCancelled:(BOOL)a3
{
  self->__pu_cancelled = a3;
}

- (BOOL)_pu_isCancelled
{
  return self->__pu_cancelled;
}

- (NSString)activityType
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (PUActivityItemSourceOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUActivityItemSourceOperationDelegate *)WeakRetained;
}

- (void)pu_cancel
{
}

- (void)main
{
  id v4 = [(PUActivityItemSourceOperation *)self delegate];
  v3 = [(PUActivityItemSourceOperation *)self activityType];
  [v4 activityItemSourceOperation:self prepareItemForActivityType:v3];
}

- (PUActivityItemSourceOperation)initWithDelegate:(id)a3 activityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUActivityItemSourceOperation;
  v8 = [(PUActivityItemSourceOperation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = [v7 copy];
    activityType = v9->_activityType;
    v9->_activityType = (NSString *)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    semaphore = v9->_semaphore;
    v9->_semaphore = (OS_dispatch_semaphore *)v12;
  }
  return v9;
}

@end