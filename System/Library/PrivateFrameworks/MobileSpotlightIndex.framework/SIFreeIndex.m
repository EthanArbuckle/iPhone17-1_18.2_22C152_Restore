@interface SIFreeIndex
@end

@implementation SIFreeIndex

void ___SIFreeIndex_block_invoke_3(uint64_t a1)
{
  si_cancel_activectx(*(void **)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  free(v2);
}

uint64_t ___SIFreeIndex_block_invoke_4(uint64_t a1)
{
  pthread_mutex_lock(&schlock);
  if (global_schedulers[0])
  {
    value = 0;
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)global_schedulers[0], *(const void **)(a1 + 32), (const void **)&value))
    {
      if (!atomic_load((unsigned int *)value + 23)) {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)global_schedulers[0], *(const void **)(a1 + 32));
      }
    }
  }
  return pthread_mutex_unlock(&schlock);
}

dispatch_queue_t ___SIFreeIndex_block_invoke_2()
{
  dispatch_queue_t result = dispatch_queue_create("index flush suspend queue", 0);
  gFlushSuspendQueue = (uint64_t)result;
  return result;
}

@end