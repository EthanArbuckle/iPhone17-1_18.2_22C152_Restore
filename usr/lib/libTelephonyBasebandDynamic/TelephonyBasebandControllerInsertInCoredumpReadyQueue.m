@interface TelephonyBasebandControllerInsertInCoredumpReadyQueue
@end

@implementation TelephonyBasebandControllerInsertInCoredumpReadyQueue

void ___TelephonyBasebandControllerInsertInCoredumpReadyQueue_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = 0;
  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(*(void *)(*(void *)(a1 + 40) + 104) + 8);
  **(void **)(*(void *)(*(void *)(a1 + 40) + 104) + 8) = *(void *)(a1 + 32);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 104) + 8) = *(void *)(a1 + 32) + 8;
}

@end