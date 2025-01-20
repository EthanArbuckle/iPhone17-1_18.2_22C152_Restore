@interface SNTestChain
- (NSMutableArray)linkBlocks;
- (SNTestChain)init;
- (void)addLink:(id)a3;
- (void)popAndRunWithCompletion:(id)a3 testFailure:(id)a4;
- (void)runWithCompletion:(id)a3;
@end

@implementation SNTestChain

- (void).cxx_destruct
{
}

- (void)runWithCompletion:(id)a3
{
}

- (SNTestChain)init
{
  v6.receiver = self;
  v6.super_class = (Class)SNTestChain;
  v2 = [(SNTestChain *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    linkBlocks = v2->_linkBlocks;
    v2->_linkBlocks = v3;
  }
  return v2;
}

- (void)addLink:(id)a3
{
  id v4 = a3;
  id v6 = [(SNTestChain *)self linkBlocks];
  v5 = _Block_copy(v4);

  [v6 addObject:v5];
}

- (void)popAndRunWithCompletion:(id)a3 testFailure:(id)a4
{
  id v6 = (void (**)(id, id))a3;
  id v7 = a4;
  v8 = [(SNTestChain *)self linkBlocks];
  uint64_t v9 = [v8 count];

  if (v7 || !v9)
  {
    if (v6) {
      v6[2](v6, v7);
    }
  }
  else
  {
    v10 = [(SNTestChain *)self linkBlocks];
    v11 = [v10 objectAtIndex:0];

    v12 = [(SNTestChain *)self linkBlocks];
    [v12 removeObjectAtIndex:0];

    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke;
      v17[3] = &unk_1E6D22510;
      v17[4] = self;
      v18 = v6;
      ((void (**)(void, void *))v11)[2](v11, v17);
      v13 = v18;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke_2;
      block[3] = &unk_1E6D22538;
      block[4] = self;
      v15 = v11;
      v16 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);

      v13 = v15;
    }
  }
}

- (NSMutableArray)linkBlocks
{
  return self->_linkBlocks;
}

uint64_t __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) popAndRunWithCompletion:*(void *)(a1 + 40) testFailure:a2];
}

void __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke_3;
  v2[3] = &unk_1E6D22510;
  uint64_t v1 = *(void *)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t __51__SNTestChain_popAndRunWithCompletion_testFailure___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) popAndRunWithCompletion:*(void *)(a1 + 40) testFailure:a2];
}

@end