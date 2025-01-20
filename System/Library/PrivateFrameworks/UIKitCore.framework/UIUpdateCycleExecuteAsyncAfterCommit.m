@interface UIUpdateCycleExecuteAsyncAfterCommit
@end

@implementation UIUpdateCycleExecuteAsyncAfterCommit

void ___UIUpdateCycleExecuteAsyncAfterCommit_block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F39CF8] currentState])
  {
    v2 = (void *)UIApp;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___UIUpdateCycleExecuteAsyncAfterCommit_block_invoke_2;
    v5[3] = &unk_1E52DA160;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [v2 _performBlockAfterCATransactionCommits:v5];
  }
  else
  {
    v3 = *(NSObject **)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    dispatch_async(v3, v4);
  }
}

void ___UIUpdateCycleExecuteAsyncAfterCommit_block_invoke_2(uint64_t a1)
{
}

@end