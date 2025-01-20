@interface BCWorkItemCompletionHandler
+ (id)newCompletionHandlerWithWorkItem:(id)a3 onQueue:(id)a4;
- (BICWorkItem)workItem;
- (BICWorkQueue)workQueue;
- (int64_t)completionCount;
- (void)dealloc;
- (void)setCompletionCount:(int64_t)a3;
- (void)setWorkItem:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)workComplete;
@end

@implementation BCWorkItemCompletionHandler

+ (id)newCompletionHandlerWithWorkItem:(id)a3 onQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(BCWorkItemCompletionHandler);
  [(BCWorkItemCompletionHandler *)v7 setWorkQueue:v5];

  [(BCWorkItemCompletionHandler *)v7 setWorkItem:v6];
  return v7;
}

- (void)dealloc
{
  if (!self->_completionCount)
  {
    v3 = BCImageCacheLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1EB2D4();
    }

    [(BICWorkQueue *)self->_workQueue workComplete:self->_workItem];
  }
  v4.receiver = self;
  v4.super_class = (Class)BCWorkItemCompletionHandler;
  [(BCWorkItemCompletionHandler *)&v4 dealloc];
}

- (void)workComplete
{
  if ([(BCWorkItemCompletionHandler *)self completionCount])
  {
    v3 = BCImageCacheLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1EB34C();
    }
  }
  else
  {
    v3 = [(BCWorkItemCompletionHandler *)self workQueue];
    objc_super v4 = [(BCWorkItemCompletionHandler *)self workItem];
    [v3 workComplete:v4];
  }
  [(BCWorkItemCompletionHandler *)self setCompletionCount:(char *)[(BCWorkItemCompletionHandler *)self completionCount] + 1];
}

- (BICWorkQueue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (BICWorkItem)workItem
{
  return self->_workItem;
}

- (void)setWorkItem:(id)a3
{
}

- (int64_t)completionCount
{
  return self->_completionCount;
}

- (void)setCompletionCount:(int64_t)a3
{
  self->_completionCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workItem, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end