@interface AMSBagValue
@end

@implementation AMSBagValue

uint64_t __61__AMSBagValue_MTAdditions__asyncValueOnQueue_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__AMSBagValue_MTAdditions__asyncValueOnQueue_withCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__AMSBagValue_MTAdditions__asyncValueOnQueue_withCompletion___block_invoke_2;
  v2[3] = &unk_1E5E61D80;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 valueWithCompletion:v2];
}

void __53__AMSBagValue_MTAdditions__asyncValuePromiseOnQueue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) valuePromise];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__AMSBagValue_MTAdditions__asyncValuePromiseOnQueue___block_invoke_2;
  v3[3] = &unk_1E5E61DA8;
  id v4 = *(id *)(a1 + 40);
  [v2 addFinishBlock:v3];
}

uint64_t __53__AMSBagValue_MTAdditions__asyncValuePromiseOnQueue___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

@end