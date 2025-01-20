@interface AMSPromise
@end

@implementation AMSPromise

void __47__AMSPromise_PassKit__pk_addQueue_finishBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AMSPromise_PassKit__pk_addQueue_finishBlock___block_invoke_2;
  block[3] = &unk_1E56D8428;
  v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __47__AMSPromise_PassKit__pk_addQueue_finishBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end