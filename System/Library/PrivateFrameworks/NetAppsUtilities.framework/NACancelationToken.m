@interface NACancelationToken
+ (id)tokenWithCancelationBlock:(id)a3;
+ (id)tokenWrappingCancelable:(id)a3;
- (BOOL)isCanceled;
- (NACancelationToken)init;
- (id)nts_cancel;
- (void)addCancelable:(id)a3;
- (void)addCancelationBlock:(id)a3;
- (void)callCancelationBlocks:(id)a3;
- (void)cancel;
@end

@implementation NACancelationToken

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NACancelationToken *)v2 nts_cancel];
  objc_sync_exit(v2);

  [(NACancelationToken *)v2 callCancelationBlocks:v3];
}

- (void)callCancelationBlocks:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)nts_cancel
{
  if (self->_isCanceled)
  {
    v2 = [MEMORY[0x1E4F1C978] array];
  }
  else
  {
    self->_isCanceled = 1;
    v2 = (void *)[(NSMutableArray *)self->_cancelationBlocks copy];
    cancelationBlocks = self->_cancelationBlocks;
    self->_cancelationBlocks = 0;
  }
  return v2;
}

+ (id)tokenWithCancelationBlock:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(NACancelationToken);
  [(NACancelationToken *)v4 addCancelationBlock:v3];

  return v4;
}

- (NACancelationToken)init
{
  v7.receiver = self;
  v7.super_class = (Class)NACancelationToken;
  v2 = [(NACancelationToken *)&v7 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    cancelationBlocks = v2->_cancelationBlocks;
    v2->_cancelationBlocks = v3;

    uint64_t v5 = v2;
  }

  return v2;
}

- (void)addCancelationBlock:(id)a3
{
  objc_super v7 = (void (**)(void))a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_isCanceled)
  {
    objc_sync_exit(v4);

    v7[2]();
  }
  else
  {
    cancelationBlocks = v4->_cancelationBlocks;
    uint64_t v6 = (void *)[v7 copy];
    [(NSMutableArray *)cancelationBlocks addObject:v6];

    objc_sync_exit(v4);
  }
}

- (void).cxx_destruct
{
}

- (BOOL)isCanceled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isCanceled = v2->_isCanceled;
  objc_sync_exit(v2);

  return isCanceled;
}

+ (id)tokenWrappingCancelable:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__NACancelationToken_tokenWrappingCancelable___block_invoke;
  v8[3] = &unk_1E6109A70;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 tokenWithCancelationBlock:v8];

  return v6;
}

uint64_t __46__NACancelationToken_tokenWrappingCancelable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

- (void)addCancelable:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__NACancelationToken_addCancelable___block_invoke;
  v6[3] = &unk_1E6109A70;
  id v7 = v4;
  id v5 = v4;
  [(NACancelationToken *)self addCancelationBlock:v6];
}

uint64_t __36__NACancelationToken_addCancelable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

@end