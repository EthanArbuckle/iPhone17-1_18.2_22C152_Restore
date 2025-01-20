@interface SIInitSDB
@end

@implementation SIInitSDB

void ___SIInitSDB_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = (unsigned int *)malloc_type_malloc(0x28uLL, 0x10A0040A9CEF559uLL);
    uint64_t v5 = 0;
    atomic_store(1u, v4);
    *((void *)v4 + 2) = a2;
    *((void *)v4 + 3) = 0;
    *((void *)v4 + 4) = dbGCFree;
    do
    {
      v6 = *(void **)(v3 + 1008 + v5);
      if (v6) {
        si_enqueue_cleanup_if_busy(v6, (uint64_t)v4);
      }
      v5 += 8;
    }
    while (v5 != 136);
    long long v8 = 0u;
    long long v9 = 0u;
    v7 = v4;
    si_collect_inner((void **)&v7);
  }
}

uint64_t ___SIInitSDB_block_invoke_4(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 1184);
  if (a2) {
    return si_set_obj_state_locked(v3, v4, 1);
  }
  else {
    return si_set_obj_state((os_unfair_lock_s *)v3, v4);
  }
}

uint64_t ___SIInitSDB_block_invoke_7(uint64_t a1)
{
  return si_set_obj_state(*(os_unfair_lock_s **)(a1 + 32), *(void *)(a1 + 40));
}

void ___SIInitSDB_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = (unsigned int *)malloc_type_malloc(0x28uLL, 0x10A0040A9CEF559uLL);
    uint64_t v7 = 0;
    atomic_store(1u, v6);
    *((void *)v6 + 2) = a2;
    *((void *)v6 + 3) = a3;
    *((void *)v6 + 4) = dbGCUnmap;
    do
    {
      long long v8 = *(void **)(v5 + 1008 + v7);
      if (v8) {
        si_enqueue_cleanup_if_busy(v8, (uint64_t)v6);
      }
      v7 += 8;
    }
    while (v7 != 136);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = v6;
    si_collect_inner((void **)&v9);
  }
}

void ___SIInitSDB_block_invoke_3(uint64_t a1, const void *a2)
{
}

uint64_t ___SIInitSDB_block_invoke_5(uint64_t a1)
{
  return si_set_obj_state(*(os_unfair_lock_s **)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 6616));
}

uint64_t ___SIInitSDB_block_invoke_6(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___SIInitSDB_block_invoke_7;
  v3[3] = &__block_descriptor_tmp_1046;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = a2;
  ContentIndexSetDirtyCallback(a2, v3);
  return 1;
}

@end