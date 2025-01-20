@interface IMURLSession
- (BOOL)followsRedirects;
- (BOOL)isUsable;
- (IMURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (int64_t)state;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)_configureProtocolHandler;
- (void)finishTasksAndInvalidate;
- (void)invalidateAndCancel;
- (void)setFollowsRedirects:(BOOL)a3;
@end

@implementation IMURLSession

- (void)setFollowsRedirects:(BOOL)a3
{
  if ([(IMURLSession *)self followsRedirects] != a3)
  {
    self->_followsRedirects = a3;
    [(IMURLSession *)self _configureProtocolHandler];
  }
}

- (IMURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)IMURLSession;
  v5 = [(AMSURLSession *)&v10 initWithConfiguration:a3 delegate:a4 delegateQueue:a5];
  v6 = v5;
  if (v5)
  {
    v5->_followsRedirects = 1;
    dispatch_queue_t v7 = dispatch_queue_create(0, 0);
    syncQueue = v6->_syncQueue;
    v6->_syncQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (BOOL)followsRedirects
{
  return self->_followsRedirects;
}

- (int64_t)state
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__IMURLSession_state__block_invoke;
  v5[3] = &unk_1E5E61CF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__IMURLSession_state__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 88);
  return result;
}

- (BOOL)isUsable
{
  return [(IMURLSession *)self state] == 0;
}

- (void)finishTasksAndInvalidate
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__IMURLSession_finishTasksAndInvalidate__block_invoke;
  block[3] = &unk_1E5E611F0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)IMURLSession;
  [(AMSURLSession *)&v4 finishTasksAndInvalidate];
}

uint64_t __40__IMURLSession_finishTasksAndInvalidate__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88) = 1;
  return result;
}

- (void)invalidateAndCancel
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__IMURLSession_invalidateAndCancel__block_invoke;
  block[3] = &unk_1E5E611F0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)IMURLSession;
  [(AMSURLSession *)&v4 invalidateAndCancel];
}

uint64_t __35__IMURLSession_invalidateAndCancel__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88) = 1;
  return result;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__IMURLSession_URLSession_didBecomeInvalidWithError___block_invoke;
  block[3] = &unk_1E5E611F0;
  block[4] = self;
  dispatch_sync(syncQueue, block);
  if (objc_msgSend((id)-[IMURLSession superclass](self, "superclass"), "instancesRespondToSelector:", sel_URLSession_didBecomeInvalidWithError_))
  {
    v9.receiver = self;
    v9.super_class = (Class)IMURLSession;
    [(IMURLSession *)&v9 URLSession:v6 didBecomeInvalidWithError:v7];
  }
}

uint64_t __53__IMURLSession_URLSession_didBecomeInvalidWithError___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 88) = 2;
  return result;
}

- (void)_configureProtocolHandler
{
  id v4 = [(AMSURLSession *)self protocolHandler];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v3 = objc_alloc_init(IMURLProtocolHandler);

    [(AMSURLSession *)self setProtocolHandler:v3];
    id v4 = v3;
  }
  objc_msgSend(v4, "setFollowsRedirects:", -[IMURLSession followsRedirects](self, "followsRedirects"));
}

- (void).cxx_destruct
{
}

@end