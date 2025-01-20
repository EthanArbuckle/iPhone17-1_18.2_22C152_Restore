@interface TelephonyBasebandControllerRemoveFromCoredumpReadyQueue
@end

@implementation TelephonyBasebandControllerRemoveFromCoredumpReadyQueue

void ___TelephonyBasebandControllerRemoveFromCoredumpReadyQueue_block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (*v1)
  {
    uint64_t v3 = v1[1];
    uint64_t v2 = v1[2];
    if (v3) {
      v4 = (void *)(v3 + 16);
    }
    else {
      v4 = (void *)(*(void *)(*(void *)(a1 + 40) + 104) + 8);
    }
    void *v4 = v2;
    **(void **)(*(void *)(a1 + 32) + 16) = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(NSObject ***)(a1 + 32);
    v6 = *v5;
    *v5 = 0;
    dispatch_group_leave(v6);
  }
}

@end