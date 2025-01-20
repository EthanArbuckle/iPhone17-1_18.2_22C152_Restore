@interface CIDocSetIteratorProcessPositionsUpdates
@end

@implementation CIDocSetIteratorProcessPositionsUpdates

void ___CIDocSetIteratorProcessPositionsUpdates_block_invoke(uint64_t a1, uint64_t a2)
{
  makeThreadId();
  char v42 = 0;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8 * a2) + 56);
  if (*(unsigned char *)(v4 + 8))
  {
    int v5 = atomic_fetch_add_explicit(exceptionSequenceNum, 1u, memory_order_relaxed) + 1;
    unint64_t v6 = setThreadIdAndInfo(-1, (long long *)sIndexExceptionCallbacks, v4, 0, v5);
    unsigned int v40 = HIDWORD(v6);
    *(_DWORD *)buf = v6;
    unint64_t v39 = __PAIR64__(v7, v8);
    uint64_t v9 = *(void *)&threadData[18 * v6 + 2];
    uint64_t v10 = v9 + 320 * HIDWORD(v6);
    *(unsigned char *)(v10 + 216) = 0;
    int v11 = *(_DWORD *)(v10 + 312);
    v12 = *(void (**)(void))(v10 + 224);
    if (v12) {
      v12(*(void *)(v9 + 320 * HIDWORD(v6) + 288));
    }
    unsigned int v38 = *(_DWORD *)buf;
    unsigned int v37 = v40;
    unint64_t v36 = v39;
    if (_setjmp((int *)v10))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v35 = 0;
        _os_log_error_impl(&dword_1BD672000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Caught mach exception", v35, 2u);
      }
      *(_DWORD *)(v10 + 312) = v11;
      CIOnThreadCleanUpReset(v36);
      dropThreadId(v38, 1, v5);
      CICleanUpReset(v38, HIDWORD(v36));
    }
    else
    {
      int v13 = atomic_fetch_add_explicit(exceptionSequenceNum, 1u, memory_order_relaxed) + 1;
      unint64_t v14 = setThreadIdAndInfo(-1, sAssertExceptionCallbacks, 0, 0, v13);
      unsigned int v34 = HIDWORD(v14);
      *(_DWORD *)v35 = v14;
      unint64_t v33 = __PAIR64__(v15, v16);
      uint64_t v17 = *(void *)&threadData[18 * v14 + 2];
      uint64_t v18 = v17 + 320 * HIDWORD(v14);
      int v19 = *(_DWORD *)(v18 + 312);
      v20 = *(void (**)(void))(v18 + 224);
      if (v20) {
        v20(*(void *)(v17 + 320 * HIDWORD(v14) + 288));
      }
      unsigned int v32 = *(_DWORD *)v35;
      unsigned int v31 = v34;
      unint64_t v30 = v33;
      if (_setjmp((int *)v18))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v29 = 0;
          _os_log_error_impl(&dword_1BD672000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Caught mach exception", v29, 2u);
        }
        *(_DWORD *)(v18 + 312) = v19;
        CIOnThreadCleanUpReset(v30);
        dropThreadId(v32, 1, v13);
        CICleanUpReset(v32, HIDWORD(v30));
      }
      else
      {
        char v42 = 1;
        _CIDocSetIteratorProcessPositionsUpdatesForNode(*(void *)(*(void *)(a1 + 32) + 8 * a2), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
        char v42 = 0;
        uint64_t v21 = *(void *)&threadData[18 * v32 + 2];
        unsigned int v22 = v31;
        uint64_t v23 = v21 + 320 * v31;
        *(_DWORD *)(v23 + 312) = v19;
        v24 = *(void (**)(void))(v23 + 232);
        if (v24) {
          v24(*(void *)(v21 + 320 * v22 + 288));
        }
        dropThreadId(v32, 0, v13);
      }
      uint64_t v25 = *(void *)&threadData[18 * v38 + 2];
      unsigned int v26 = v37;
      uint64_t v27 = v25 + 320 * v37;
      *(_DWORD *)(v27 + 312) = v11;
      v28 = *(void (**)(void))(v27 + 232);
      if (v28) {
        v28(*(void *)(v25 + 320 * v26 + 288));
      }
      dropThreadId(v38, 0, v5);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD672000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Skipping because index is shut down", buf, 2u);
  }
  if (v42) {
    **(unsigned char **)(a1 + 40) = 1;
  }
}

@end