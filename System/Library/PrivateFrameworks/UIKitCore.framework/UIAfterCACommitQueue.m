@interface UIAfterCACommitQueue
@end

@implementation UIAfterCACommitQueue

uint64_t __57___UIAfterCACommitQueue__enqueueCommitResponse_forPhase___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) flush];
}

void __57___UIAfterCACommitQueue__enqueueCommitResponse_forPhase___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    char v2 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(v1 + 24), (unsigned __int8 *)&v2, 1u, memory_order_relaxed, memory_order_relaxed);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___UIAfterCACommitQueue__enqueueCommitResponse_forPhase___block_invoke_2;
  block[3] = &unk_1E52D9F70;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

@end