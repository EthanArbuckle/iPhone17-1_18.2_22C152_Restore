@interface SIShutdownIndexSchedulers
@end

@implementation SIShutdownIndexSchedulers

void ___SIShutdownIndexSchedulers_block_invoke(uint64_t a1)
{
  for (uint64_t i = 0; i != 160; i += 8)
    si_workqueue_destroy(*(void *)(*(void *)(a1 + 32) + i));
  free(*(void **)(a1 + 32));
  for (uint64_t j = 40; j != 176; j += 8)
  {
    uint64_t v4 = *(void *)(a1 + j);
    if (v4) {
      si_scheduler_drain_locked(v4, *(dispatch_group_t *)(a1 + 352));
    }
  }
  for (uint64_t k = 40; k != 176; k += 8)
  {
    uint64_t v6 = *(void *)(a1 + k);
    if (v6 && atomic_fetch_add((atomic_uint *volatile)(v6 + 88), 0xFFFFFFFF) == 1) {
      _si_scheduler_destroy(v6);
    }
  }
  v7 = *(NSObject **)(a1 + 352);
  v8 = *(NSObject **)(a1 + 360);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___SIShutdownIndexSchedulers_block_invoke_2;
  block[3] = &__block_descriptor_tmp_1091;
  int v13 = *(_DWORD *)(a1 + 384);
  long long v10 = *(_OWORD *)(a1 + 368);
  v11 = v8;
  v12 = v7;
  dispatch_group_notify(v7, v8, block);
}

void ___SIShutdownIndexSchedulers_block_invoke_2(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 64))
  {
    pthread_mutex_lock(&schlock);
    uint64_t v2 = 0;
    v3 = &byte_1F1812E11;
    do
    {
      CFDictionaryRef v4 = (const __CFDictionary *)global_schedulers[v2];
      if (v4)
      {
        if (*v3) {
          uint64_t v5 = 32;
        }
        else {
          uint64_t v5 = 40;
        }
        uint64_t v6 = *(const void **)(a1 + v5);
        value = 0;
        if (CFDictionaryGetValueIfPresent(v4, v6, (const void **)&value))
        {
          if (!atomic_load((unsigned int *)value + 23)) {
            CFDictionaryRemoveValue((CFMutableDictionaryRef)global_schedulers[v2], v6);
          }
        }
      }
      ++v2;
      v3 += 56;
    }
    while (v2 != 12);
    pthread_mutex_unlock(&schlock);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 0x40000000;
  v9[2] = ___SIShutdownIndexSchedulers_block_invoke_3;
  v9[3] = &__block_descriptor_tmp_1090;
  v8 = *(NSObject **)(a1 + 48);
  v9[4] = *(void *)(a1 + 56);
  dispatch_async(v8, v9);
}

void ___SIShutdownIndexSchedulers_block_invoke_3(uint64_t a1)
{
}

@end