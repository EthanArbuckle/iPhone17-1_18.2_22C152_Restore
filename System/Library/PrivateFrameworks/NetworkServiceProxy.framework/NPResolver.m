@interface NPResolver
- (OS_dispatch_source)resolveTimer;
- (id)resolveCompletionHandler;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resolveWithCompletionHandler:(id)a3;
- (void)setResolveCompletionHandler:(id)a3;
- (void)setResolveTimer:(id)a3;
@end

@implementation NPResolver

- (void)resolveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(NWResolver *)self status] == 2)
  {
    v5 = NPGetInternalQueue();
    dispatch_async(v5, v4);
  }
  else
  {
    [(NPResolver *)self setResolveCompletionHandler:v4];
    [(NPResolver *)self addObserver:self forKeyPath:@"status" options:4 context:0];
    v6 = NPGetInternalQueue();
    dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v6);
    [(NPResolver *)self setResolveTimer:v7];

    v8 = [(NPResolver *)self resolveTimer];
    dispatch_time_t v9 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x2710uLL);

    v10 = [(NPResolver *)self resolveTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__NPResolver_resolveWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E5A3B240;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);

    v5 = [(NPResolver *)self resolveTimer];
    dispatch_resume(v5);
  }
}

uint64_t __43__NPResolver_resolveWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) resolveTimer];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) resolveTimer];
    dispatch_source_cancel(v3);

    [*(id *)(a1 + 32) setResolveTimer:0];
  }
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 32) forKeyPath:@"status" context:0];
  id v4 = [*(id *)(a1 + 32) resolveCompletionHandler];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) resolveCompletionHandler];
    v5[2]();
  }
  v6 = *(void **)(a1 + 32);
  return [v6 setResolveCompletionHandler:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = (NPResolver *)a4;
  id v12 = a5;
  int v13 = [v10 isEqualToString:@"status"];
  if (v11 == self && v13)
  {
    v14 = NPGetInternalQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__NPResolver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5A3B240;
    block[4] = v11;
    dispatch_async(v14, block);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NPResolver;
    [(NPResolver *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __61__NPResolver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) status] == 2)
  {
    v2 = [*(id *)(a1 + 32) resolveCompletionHandler];

    if (v2)
    {
      v3 = [*(id *)(a1 + 32) resolveTimer];

      if (v3)
      {
        id v4 = [*(id *)(a1 + 32) resolveTimer];
        dispatch_source_cancel(v4);

        [*(id *)(a1 + 32) setResolveTimer:0];
      }
      [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 32) forKeyPath:@"status" context:0];
      v5 = [*(id *)(a1 + 32) resolveCompletionHandler];

      if (v5)
      {
        v6 = [*(id *)(a1 + 32) resolveCompletionHandler];
        v6[2]();
      }
      dispatch_source_t v7 = *(void **)(a1 + 32);
      [v7 setResolveCompletionHandler:0];
    }
  }
}

- (id)resolveCompletionHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setResolveCompletionHandler:(id)a3
{
}

- (OS_dispatch_source)resolveTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResolveTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveTimer, 0);
  objc_storeStrong(&self->_resolveCompletionHandler, 0);
}

@end