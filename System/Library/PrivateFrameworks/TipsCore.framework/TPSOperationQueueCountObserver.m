@interface TPSOperationQueueCountObserver
- (TPSOperationQueue)operationQueue;
- (TPSOperationQueueCountObserver)init;
- (TPSOperationQueueCountObserver)initWithQueue:(id)a3;
- (id)completionBlock;
- (unint64_t)lastOperationCount;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCompletionBlock:(id)a3;
- (void)setLastOperationCount:(unint64_t)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation TPSOperationQueueCountObserver

- (void)dealloc
{
  if (self->_completionBlock)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_operationQueue);
    [WeakRetained removeObserver:self forKeyPath:@"operationCount"];

    id completionBlock = self->_completionBlock;
    self->_id completionBlock = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TPSOperationQueueCountObserver;
  [(TPSOperationQueueCountObserver *)&v5 dealloc];
}

- (TPSOperationQueueCountObserver)init
{
  return [(TPSOperationQueueCountObserver *)self initWithQueue:0];
}

- (TPSOperationQueueCountObserver)initWithQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TPSOperationQueueCountObserver;
  objc_super v5 = [(TPSOperationQueueCountObserver *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_operationQueue, v4);
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"operationCount"])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__TPSOperationQueueCountObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5906790;
    id v15 = v12;
    v16 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TPSOperationQueueCountObserver;
    [(TPSOperationQueueCountObserver *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __81__TPSOperationQueueCountObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  uint64_t v3 = [v2 unsignedIntegerValue];

  if (!v3)
  {
    if ([*(id *)(a1 + 40) lastOperationCount])
    {
      id v4 = [*(id *)(a1 + 40) completionBlock];

      if (v4)
      {
        objc_super v5 = [*(id *)(a1 + 40) completionBlock];
        v5[2]();
      }
    }
  }
  v6 = *(void **)(a1 + 40);
  return [v6 setLastOperationCount:v3];
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (unint64_t)lastOperationCount
{
  return self->_lastOperationCount;
}

- (void)setLastOperationCount:(unint64_t)a3
{
  self->_lastOperationCount = a3;
}

- (TPSOperationQueue)operationQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operationQueue);
  return (TPSOperationQueue *)WeakRetained;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operationQueue);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end