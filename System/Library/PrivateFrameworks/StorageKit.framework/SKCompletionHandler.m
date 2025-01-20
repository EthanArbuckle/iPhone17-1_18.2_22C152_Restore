@interface SKCompletionHandler
- (OS_dispatch_semaphore)semaphore;
- (SKCompletionHandler)initWithCompletionBlock:(id)a3 progressBlock:(id)a4 function:(const char *)a5;
- (const)functionName;
- (id)completionBlock;
- (id)errorBlock;
- (id)progressBlock;
- (void)setErrorBlock:(id)a3;
- (void)setProgressBlock:(id)a3;
- (void)setSemaphore:(id)a3;
@end

@implementation SKCompletionHandler

- (SKCompletionHandler)initWithCompletionBlock:(id)a3 progressBlock:(id)a4 function:(const char *)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SKCompletionHandler;
  v10 = [(SKCompletionHandler *)&v16 init];
  if (v10)
  {
    v11 = _Block_copy(v8);
    id completionBlock = v10->_completionBlock;
    v10->_id completionBlock = v11;

    v13 = _Block_copy(v9);
    id progressBlock = v10->_progressBlock;
    v10->_id progressBlock = v13;

    v10->_functionName = a5;
  }

  return v10;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (id)errorBlock
{
  return self->_errorBlock;
}

- (void)setErrorBlock:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (const)functionName
{
  return self->_functionName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong(&self->_errorBlock, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

@end