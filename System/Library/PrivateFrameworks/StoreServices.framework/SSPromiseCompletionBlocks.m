@interface SSPromiseCompletionBlocks
- (SSPromiseCompletionBlocks)init;
- (void)addCompletionBlock:(id)a3;
- (void)addErrorBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)callCompletionBlock:(id)a3 withPromiseResult:(id)a4;
- (void)callErrorBlock:(id)a3 withPromiseResult:(id)a4;
- (void)callSuccessBlock:(id)a3 withPromiseResult:(id)a4;
- (void)flushCompletionBlocksWithPromiseResult:(id)a3;
@end

@implementation SSPromiseCompletionBlocks

- (void).cxx_destruct
{
}

- (SSPromiseCompletionBlocks)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSPromiseCompletionBlocks;
  v2 = [(SSPromiseCompletionBlocks *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;
  }
  return v2;
}

- (void)callCompletionBlock:(id)a3 withPromiseResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = [v5 result];
  v7 = [v5 error];

  (*((void (**)(id, id, void *))a3 + 2))(v6, v8, v7);
}

- (void)flushCompletionBlocksWithPromiseResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)[(NSMutableArray *)v5->_completionBlocks copy];
  [(NSMutableArray *)v5->_completionBlocks removeAllObjects];
  objc_sync_exit(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = objc_msgSend(v4, "result", (void)v14);
        v13 = [v4 error];
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

uint64_t __45__SSPromiseCompletionBlocks_addSuccessBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __64__SSPromiseCompletionBlocks_callSuccessBlock_withPromiseResult___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __62__SSPromiseCompletionBlocks_callErrorBlock_withPromiseResult___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __43__SSPromiseCompletionBlocks_addErrorBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)callSuccessBlock:(id)a3 withPromiseResult:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__SSPromiseCompletionBlocks_callSuccessBlock_withPromiseResult___block_invoke;
  v8[3] = &unk_1E5BA9278;
  id v9 = v6;
  id v7 = v6;
  [(SSPromiseCompletionBlocks *)self callCompletionBlock:v8 withPromiseResult:a4];
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SSPromiseCompletionBlocks_addErrorBlock___block_invoke;
  v6[3] = &unk_1E5BA9278;
  id v7 = v4;
  id v5 = v4;
  [(SSPromiseCompletionBlocks *)self addCompletionBlock:v6];
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__SSPromiseCompletionBlocks_addSuccessBlock___block_invoke;
  v6[3] = &unk_1E5BA9278;
  id v7 = v4;
  id v5 = v4;
  [(SSPromiseCompletionBlocks *)self addCompletionBlock:v6];
}

- (void)addCompletionBlock:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  completionBlocks = v4->_completionBlocks;
  id v6 = (void *)[v7 copy];
  [(NSMutableArray *)completionBlocks addObject:v6];

  objc_sync_exit(v4);
}

- (void)callErrorBlock:(id)a3 withPromiseResult:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__SSPromiseCompletionBlocks_callErrorBlock_withPromiseResult___block_invoke;
  v8[3] = &unk_1E5BA9278;
  id v9 = v6;
  id v7 = v6;
  [(SSPromiseCompletionBlocks *)self callCompletionBlock:v8 withPromiseResult:a4];
}

@end