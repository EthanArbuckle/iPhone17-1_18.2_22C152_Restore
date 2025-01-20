@interface BulkPositionIterator
@end

@implementation BulkPositionIterator

void __BulkPositionIterator_Step_Compressed_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  makeThreadId();
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v61 = *(void *)(a1 + 32);
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v64 = 0;
  char v60 = 1;
  if (*(unsigned char *)(v3 + 8))
  {
    int v4 = atomic_fetch_add_explicit(exceptionSequenceNum, 1u, memory_order_relaxed) + 1;
    unint64_t v5 = setThreadIdAndInfo(-1, (long long *)sIndexExceptionCallbacks, v3, 0, v4);
    unsigned int v58 = HIDWORD(v5);
    unsigned int v59 = v5;
    unsigned int v56 = v7;
    unsigned int v57 = v6;
    uint64_t v8 = *(void *)&threadData[18 * v5 + 2];
    uint64_t v9 = v8 + 320 * HIDWORD(v5);
    *(unsigned char *)(v9 + 216) = 0;
    int v10 = *(_DWORD *)(v9 + 312);
    v11 = *(void (**)(void))(v9 + 224);
    if (v11) {
      v11(*(void *)(v8 + 320 * HIDWORD(v5) + 288));
    }
    if (_setjmp((int *)v9))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BD672000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Caught mach exception", buf, 2u);
      }
      *(_DWORD *)(v9 + 312) = v10;
      CIOnThreadCleanUpReset(v56);
      dropThreadId(v59, 1, v4);
      CICleanUpReset(v59, v57);
    }
    else
    {
      int v12 = atomic_fetch_add_explicit(exceptionSequenceNum, 1u, memory_order_relaxed) + 1;
      unint64_t v13 = setThreadIdAndInfo(-1, sAssertExceptionCallbacks, 0, 0, v12);
      unsigned int v54 = HIDWORD(v13);
      unsigned int v55 = v13;
      unsigned int v52 = v15;
      unsigned int v53 = v14;
      uint64_t v16 = *(void *)&threadData[18 * v13 + 2];
      uint64_t v17 = v16 + 320 * HIDWORD(v13);
      int v18 = *(_DWORD *)(v17 + 312);
      v19 = *(void (**)(void))(v17 + 224);
      if (v19) {
        v19(*(void *)(v16 + 320 * HIDWORD(v13) + 288));
      }
      if (_setjmp((int *)v17))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BD672000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Caught mach exception", buf, 2u);
        }
        *(_DWORD *)(v17 + 312) = v18;
        CIOnThreadCleanUpReset(v52);
        dropThreadId(v55, 1, v12);
        CICleanUpReset(v55, v53);
      }
      else
      {
        int v48 = v18;
        int v49 = v12;
        int v50 = v10;
        int v51 = v4;
        uint64_t v46 = mach_absolute_time();
        unsigned int add_explicit = atomic_fetch_add_explicit(*(atomic_uint *volatile *)(a1 + 48), 1u, memory_order_relaxed);
        if (add_explicit >= *(_DWORD *)(a1 + 160))
        {
          uint64_t v31 = 0;
          uint64_t v32 = 0;
        }
        else
        {
          uint64_t v21 = 0;
          unint64_t v22 = 0;
          unsigned int v23 = add_explicit;
          do
          {
            uint64_t v24 = 0;
            uint64_t v25 = v23;
            uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8 * v23);
            uint64_t v27 = *(void *)(a1 + 120) + 392 * a2 + 24;
            do
            {
              int v28 = PositionIterate_Compressed(v26, &v61, v27, *(_DWORD **)(a1 + 128), *(_DWORD *)(a1 + 164), *(_DWORD *)(a1 + 168), *(unsigned char **)(a1 + 136));
              unint64_t v29 = ++v24;
            }
            while (v28 == 1);
            if (v29 <= v22) {
              uint64_t v30 = v22;
            }
            else {
              uint64_t v30 = v29;
            }
            if (v28 == 2) {
              *(unsigned char *)(*(void *)(a1 + 144) + v25) = 1;
            }
            uint64_t v31 = v29 + v21;
            unint64_t v22 = v30;
            uint64_t v32 = v30;
            uint64_t v21 = v31;
            unsigned int v23 = atomic_fetch_add_explicit(*(atomic_uint *volatile *)(a1 + 48), 1u, memory_order_relaxed);
          }
          while (v23 < *(_DWORD *)(a1 + 160));
        }
        uint64_t v33 = v32;
        char v60 = 0;
        uint64_t v34 = mach_absolute_time();
        if (timingNanosecondsSinceAbsoluteTime_onceToken != -1) {
          dispatch_once(&timingNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_86_10923);
        }
        int v10 = v50;
        int v4 = v51;
        unint64_t v35 = (v34 - v46)
            * timingNanosecondsSinceAbsoluteTime_sTimebaseInfo
            / *(unsigned int *)algn_1E9FE32D4;
        if (v35 > 0x3B9AC9FF)
        {
          int v36 = *__error();
          v37 = _SILogForLogForCategory(0);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            int v38 = **(unsigned __int8 **)(a1 + 136);
            *(_DWORD *)buf = 134219264;
            int v39 = *(_DWORD *)(a1 + 160);
            double v66 = (double)v35 / 1000000000.0;
            __int16 v67 = 2048;
            unint64_t v68 = v35;
            __int16 v69 = 1024;
            int v70 = v39;
            __int16 v71 = 2048;
            uint64_t v72 = v31;
            __int16 v73 = 2048;
            uint64_t v74 = v33;
            __int16 v75 = 1024;
            int v76 = v38;
            _os_log_impl(&dword_1BD672000, v37, OS_LOG_TYPE_DEFAULT, "It took %.1fs(%llu ns) to iterate %u loops with total %llu. maxIterSteps:%llu canceled:%d", buf, 0x36u);
          }
          *__error() = v36;
        }
        uint64_t v40 = *(void *)&threadData[18 * v55 + 2];
        uint64_t v41 = v40 + 320 * v54;
        *(_DWORD *)(v41 + 312) = v48;
        v42 = *(void (**)(void))(v41 + 232);
        if (v42) {
          v42(*(void *)(v40 + 320 * v54 + 288));
        }
        dropThreadId(v55, 0, v49);
      }
      uint64_t v43 = *(void *)&threadData[18 * v59 + 2];
      uint64_t v44 = v43 + 320 * v58;
      *(_DWORD *)(v44 + 312) = v10;
      v45 = *(void (**)(void))(v44 + 232);
      if (v45) {
        v45(*(void *)(v43 + 320 * v58 + 288));
      }
      dropThreadId(v59, 0, v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BD672000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Skipping because index is shut down", buf, 2u);
  }
  if (v60) {
    **(unsigned char **)(a1 + 152) = 1;
  }
  CIIndexSetDisposePerThreadCache(&v61);
}

@end