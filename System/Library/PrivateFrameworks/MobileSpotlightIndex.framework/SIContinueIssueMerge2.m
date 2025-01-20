@interface SIContinueIssueMerge2
@end

@implementation SIContinueIssueMerge2

void ___SIContinueIssueMerge2_block_invoke_1764(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, NSObject *a5)
{
  if (a2 && *(unsigned char *)(a2 + 2449))
  {
    *(unsigned char *)(a2 + 2449) = 0;
    unsigned int v17 = -1;
    uint64_t v10 = *(unsigned int *)(*(void *)(a1 + 40) + 32);
    BOOL v11 = v10 == -1 || (fd_setDir(v10, (int *)&v17) & 1) == 0;
    int v12 = *__error();
    v13 = _SILogForLogForCategory(12);
    os_log_type_t v14 = 2 * (dword_1E9FC90D4 < 4);
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1BD672000, v13, v14, "Merge(2) started", v16, 2u);
    }
    *__error() = v12;
    if (!v11)
    {
      int v15 = v17;
      MEMORY[0x1C1882290](v17);
      if ((v15 & 0x80000000) == 0) {
        close(v15);
      }
    }
    si_power_info_init(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 1064, a3, a4, a5);
    si_enqueue_barrier_with_qos(*(void *)(a2 + 1152), 5, (uint64_t)_SIContinueIssueMerge0, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  si_merge_ctx_free(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2 == 0);
}

void ___SIContinueIssueMerge2_block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, NSObject *a5)
{
  if (a2 && *(unsigned char *)(a2 + 2448))
  {
    unsigned int v16 = -1;
    uint64_t v9 = *(unsigned int *)(a2 + 32);
    BOOL v10 = v9 == -1 || (fd_setDir(v9, (int *)&v16) & 1) == 0;
    int v11 = *__error();
    int v12 = _SILogForLogForCategory(12);
    os_log_type_t v13 = 2 * (dword_1E9FC90D4 < 4);
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)int v15 = 0;
      _os_log_impl(&dword_1BD672000, v12, v13, "Vacuum started", v15, 2u);
    }
    *__error() = v11;
    if (!v10)
    {
      int v14 = v16;
      MEMORY[0x1C1882290](v16);
      if ((v14 & 0x80000000) == 0) {
        close(v14);
      }
    }
    *(unsigned char *)(a2 + 2448) = 0;
    si_sync_index_vaccuum_if_needed(a2, 1, a3, a4, a5);
  }
}

@end