@interface SIShutdownIndexBulk
@end

@implementation SIShutdownIndexBulk

uint64_t ___SIShutdownIndexBulk_block_invoke(uint64_t a1, uint64_t a2)
{
  makeThreadId();
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(a1 + 72) != *(_DWORD *)(*(void *)v4 + 1396))
  {
    v31 = __si_assert_copy_extra_625(-1);
    v32 = v31;
    v33 = "";
    if (v31) {
      v33 = v31;
    }
    __message_assert("%s:%u: failed assertion '%s' %s ", "SpotlightIndex.c", 15421, "indexSpindleId==si_indices[0]->indexSpindleId", v33);
    free(v32);
    if (__valid_fs(-1)) {
      uint64_t v34 = 2989;
    }
    else {
      uint64_t v34 = 3072;
    }
    *(_DWORD *)uint64_t v34 = -559038737;
    abort();
  }
  uint64_t result = *(void *)(v4 + 8 * a2);
  if (!*(unsigned char *)(result + 1280))
  {
    *(void *)(*(void *)(a1 + 40) + 8 * a2) = _SIShutdownSetup(result);
    if (*(void *)(*(void *)(a1 + 40) + 8 * a2))
    {
      int v6 = atomic_fetch_add_explicit(exceptionSequenceNum, 1u, memory_order_relaxed) + 1;
      unint64_t v7 = setThreadIdAndInfo(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8 * a2) + 32), sFdExceptionCallbacks, 0, 1, v6);
      unsigned int v48 = HIDWORD(v7);
      unsigned int v49 = v7;
      unsigned int v46 = v9;
      unsigned int v47 = v8;
      uint64_t v10 = *(void *)&threadData[18 * v7 + 2];
      uint64_t v11 = v10 + 320 * HIDWORD(v7);
      *(unsigned char *)(v11 + 216) = 0;
      int v12 = *(_DWORD *)(v11 + 312);
      v13 = *(void (**)(void))(v11 + 224);
      if (v13) {
        v13(*(void *)(v10 + 320 * HIDWORD(v7) + 288));
      }
      unsigned int v45 = v49;
      unsigned int v44 = v48;
      unsigned int v43 = v47;
      unsigned int v42 = v46;
      if (_setjmp((int *)v11))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BD672000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Caught mach exception", buf, 2u);
        }
        *(_DWORD *)(v11 + 312) = v12;
        CIOnThreadCleanUpReset(v42);
        dropThreadId(v45, 1, v6);
        CICleanUpReset(v45, v43);
      }
      else
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8 * a2);
        if (v14)
        {
          if (!_CISyncContextSync(v14, 0))
          {
            v20 = *(uint64_t **)(*(void *)(a1 + 40) + 8 * a2);
            if (v20)
            {
              if (!_CISyncContextCommitData(v20, 0, *(void *)(a1 + 48) + 104 * *(void *)(a1 + 56)))
              {
                uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8 * a2);
                if (v21)
                {
                  if (!_CISyncContextCommitHeader(v21))
                  {
                    uint64_t v22 = *(void *)(a1 + 48) + 104 * a2;
                    if (CIDocCountsNonEmpty((void *)v22))
                    {
                      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8 * a2);
                      v25 = *(void (**)(uint64_t, uint8_t *))(v23 + 72);
                      uint64_t v24 = *(void *)(v23 + 80);
                      long long v26 = *(_OWORD *)v22;
                      long long v27 = *(_OWORD *)(v22 + 32);
                      long long v36 = *(_OWORD *)(v22 + 16);
                      long long v37 = v27;
                      *(_OWORD *)buf = v26;
                      long long v28 = *(_OWORD *)(v22 + 48);
                      long long v29 = *(_OWORD *)(v22 + 64);
                      long long v30 = *(_OWORD *)(v22 + 80);
                      uint64_t v41 = *(void *)(v22 + 96);
                      long long v39 = v29;
                      long long v40 = v30;
                      long long v38 = v28;
                      v25(v24, buf);
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v15 = *(void *)&threadData[18 * v45 + 2];
        unsigned int v16 = v44;
        uint64_t v17 = v15 + 320 * v44;
        *(_DWORD *)(v17 + 312) = v12;
        v18 = *(void (**)(void))(v17 + 232);
        if (v18) {
          v18(*(void *)(v15 + 320 * v16 + 288));
        }
        dropThreadId(v45, 0, v6);
      }
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8 * a2);
      if (v19) {
        _CISyncContextDestroy(v19);
      }
    }
    uint64_t result = _SIShutdownComplete(*(void *)(*(void *)(a1 + 32) + 8 * a2));
    *(_DWORD *)(*(void *)(a1 + 64) + 4 * a2) = 0;
  }
  return result;
}

@end