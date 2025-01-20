@interface DPCQuestionGetSubscriber
@end

@implementation DPCQuestionGetSubscriber

BOOL ___DPCQuestionGetSubscriber_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40) == *(_DWORD *)(*(void *)(a2 + 56) + 96)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

@end