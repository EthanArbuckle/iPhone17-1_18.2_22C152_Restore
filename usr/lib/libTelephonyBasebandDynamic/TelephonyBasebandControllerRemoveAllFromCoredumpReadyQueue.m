@interface TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue
@end

@implementation TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue

void ___TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue_block_invoke(uint64_t a1)
{
  v1 = *(uint64_t **)(*(void *)(a1 + 32) + 104);
  if (v1)
  {
    for (uint64_t i = *v1; *v1; uint64_t i = *v1)
    {
      uint64_t v4 = *(void *)(i + 8);
      v5 = *(void **)(i + 16);
      if (v4)
      {
        *(void *)(v4 + 16) = v5;
        v5 = *(void **)(i + 16);
      }
      else
      {
        v1[1] = (uint64_t)v5;
      }
      void *v5 = v4;
      v6 = *(NSObject **)i;
      *(void *)uint64_t i = 0;
      dispatch_group_leave(v6);
      v1 = *(uint64_t **)(*(void *)(a1 + 32) + 104);
    }
  }
}

@end