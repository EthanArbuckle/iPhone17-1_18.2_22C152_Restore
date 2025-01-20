@interface SPCoreSpotlightExtensionsTask
- (id)completionBlock;
- (id)filterBlock;
- (id)performBlock;
- (void)_performWithExtensionsEnumerator:(id)a3 completionBlock:(id)a4;
- (void)setCompletionBlock:(id)a3;
- (void)setFilterBlock:(id)a3;
- (void)setPerformBlock:(id)a3;
- (void)start;
@end

@implementation SPCoreSpotlightExtensionsTask

- (void)_performWithExtensionsEnumerator:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (!v7) {
    -[SPCoreSpotlightExtensionsTask _performWithExtensionsEnumerator:completionBlock:]();
  }
  v8 = v7;
  v9 = [(SPCoreSpotlightExtensionsTask *)self performBlock];
  if (!v9) {
    -[SPCoreSpotlightExtensionsTask _performWithExtensionsEnumerator:completionBlock:]();
  }

  v10 = [v6 nextObject];
  if (v10)
  {
    v11 = dispatch_group_create();
    v12 = [(SPCoreSpotlightExtensionsTask *)self performBlock];
    ((void (**)(void, void *, NSObject *))v12)[2](v12, v10, v11);

    v13 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82__SPCoreSpotlightExtensionsTask__performWithExtensionsEnumerator_completionBlock___block_invoke;
    block[3] = &unk_264507140;
    block[4] = self;
    id v15 = v6;
    v16 = v8;
    dispatch_group_notify(v11, v13, block);
  }
  else
  {
    v8[2](v8);
  }
}

void __82__SPCoreSpotlightExtensionsTask__performWithExtensionsEnumerator_completionBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C480D0]();
  [*(id *)(a1 + 32) _performWithExtensionsEnumerator:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

- (void)start
{
}

void __38__SPCoreSpotlightExtensionsTask_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    v7 = [*(id *)(a1 + 40) filterBlock];
    if (v7)
    {
      v8 = [*(id *)(a1 + 40) filterBlock];
      uint64_t v9 = ((void (**)(void, id))v8)[2](v8, v5);

      id v5 = (id)v9;
    }

    v10 = *(void **)(a1 + 40);
    v11 = [v5 objectEnumerator];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__SPCoreSpotlightExtensionsTask_start__block_invoke_2;
    v12[3] = &unk_2645063F8;
    id v13 = *(id *)(a1 + 32);
    [v10 _performWithExtensionsEnumerator:v11 completionBlock:v12];
  }
}

void __38__SPCoreSpotlightExtensionsTask_start__block_invoke_2(uint64_t a1)
{
}

void __38__SPCoreSpotlightExtensionsTask_start__block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C480D0]();
  v3 = [*(id *)(a1 + 32) completionBlock];
  v3[2](v3, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

  SDTransactionDone(*(void **)(a1 + 40));
  [*(id *)(a1 + 32) setPerformBlock:0];
  [*(id *)(a1 + 32) setFilterBlock:0];
  [*(id *)(a1 + 32) setCompletionBlock:0];
}

- (id)filterBlock
{
  return self->_filterBlock;
}

- (void)setFilterBlock:(id)a3
{
}

- (id)performBlock
{
  return self->_performBlock;
}

- (void)setPerformBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_performBlock, 0);
  objc_storeStrong(&self->_filterBlock, 0);
}

- (void)_performWithExtensionsEnumerator:completionBlock:.cold.1()
{
}

- (void)_performWithExtensionsEnumerator:completionBlock:.cold.2()
{
}

@end