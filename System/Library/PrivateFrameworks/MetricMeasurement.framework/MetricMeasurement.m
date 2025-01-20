void sub_21FA7CF2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FA7D1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_21FA7D3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_21FA7D624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 144), 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21FA7DAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_21FA7DD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21FA7DF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21FA7E0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21FA7F750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_21FA8258C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21FA82740(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FA82B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_21FA82C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_21FA82D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_21FA82E58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FA841F4(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_21FA8420C(void *a1)
{
}

void sub_21FA8432C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FA855EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _MXMGetLog()
{
  if (_MXMGetLog_onceToken != -1) {
    dispatch_once(&_MXMGetLog_onceToken, &__block_literal_global_4);
  }
  return _MXMGetLog__defaultLogger;
}

uint64_t _MXMGetInstrumentsLog()
{
  if (_MXMGetInstrumentsLog_onceToken != -1) {
    dispatch_once(&_MXMGetInstrumentsLog_onceToken, &__block_literal_global_4);
  }
  return _MXMGetInstrumentsLog__instrumentsLogger;
}

void sub_21FA88D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_21FA895E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_21FA89888(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21FA89B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_21FA8B1E0(_Unwind_Exception *a1)
{
  uint64_t v7 = v4;
  objc_destroyWeak(v7);
  objc_destroyWeak(v5);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 104));
  _Unwind_Resume(a1);
}

void sub_21FA9112C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21FA9156C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
}

void sub_21FA91D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MXMRunBlockIteration(uint64_t a1)
{
  v2 = _MXMGetLog();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21FA7B000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Instrument_Iteration", (const char *)&unk_21FA9B047, buf, 2u);
  }

  if (!*(void *)(a1 + 40) && !*(_DWORD *)(a1 + 16))
  {
    if (*(unsigned char *)(a1 + 32)) {
      BOOL v5 = *(void *)(a1 + 24) == 1;
    }
    else {
      BOOL v5 = 0;
    }
    uint64_t v6 = *(void **)(a1 + 128);
    if (!v6) {
      goto LABEL_28;
    }
    if (!*(void *)(a1 + 136)) {
      BOOL v5 = 0;
    }
    if (!v5)
    {
LABEL_28:
      uint64_t v7 = _MXMGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        uint64_t v3 = 2;
        _os_log_impl(&dword_21FA7B000, v7, OS_LOG_TYPE_ERROR, "Bad state detected for iteration structure.", buf, 2u);
      }
      else
      {
        uint64_t v3 = 2;
      }
LABEL_41:

      return v3;
    }
    uint64_t v7 = v6;
    id v8 = *(id *)(a1 + 136);
    uint64_t v9 = *(void **)(a1 + 144);
    if (v9) {
      id v10 = v9;
    }
    uint64_t v11 = (void (**)(void))_Block_copy(v9);
    *(_DWORD *)(a1 + 16) = MEMORY[0x223C57660]();
    if (*(unsigned char *)(a1 + 120))
    {
      *(void *)(a1 + 24) = 2;
      uint64_t v12 = [v7 _transitionWithState:1 iteration:a1 instrumentals:v8];
      dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
    memset(buf, 0, sizeof(buf));
    long long v28 = 0uLL;
    uint64_t v13 = _MXMGetInstrumentsLog();
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_21FA7B000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Instrument_Iteration_User_Work", (const char *)&unk_21FA9B047, v27, 2u);
    }

    uint64_t v14 = (void *)MEMORY[0x223C57710]();
    uint64_t v15 = [MEMORY[0x263EFF910] date];
    uint64_t v16 = mach_continuous_time();
    uint64_t v17 = mach_absolute_time();
    thread_selfcounts();
    if (*(unsigned char *)(a1 + 120))
    {
      *(void *)(a1 + 40) = v17;
      *(_OWORD *)(a1 + 88) = *(_OWORD *)buf;
      *(void *)(a1 + 56) = v16;
      *(void *)(a1 + 72) = v15;
    }
    v11[2](v11);
    thread_selfcounts();
    uint64_t v18 = mach_absolute_time();
    uint64_t v19 = mach_continuous_time();
    v20 = [MEMORY[0x263EFF910] date];
    v21 = _MXMGetInstrumentsLog();
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_21FA7B000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Instrument_Iteration_User_Work", (const char *)&unk_21FA9B047, v27, 2u);
    }

    uint64_t v22 = *(void *)(a1 + 120);
    if (v22)
    {
      if ((v22 & 2) == 0)
      {
        if (*(void *)(a1 + 80)) {
          uint64_t v3 = 0;
        }
        else {
          uint64_t v3 = 5;
        }
        goto LABEL_38;
      }
    }
    else
    {
      if (!*(void *)(a1 + 72))
      {
        uint64_t v3 = 5;
        goto LABEL_38;
      }
      if ((v22 & 2) == 0)
      {
LABEL_36:
        uint64_t v3 = 0;
LABEL_38:

        v26 = _MXMGetLog();
        if (os_signpost_enabled(v26))
        {
          *(_WORD *)v27 = 0;
          _os_signpost_emit_with_name_impl(&dword_21FA7B000, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Instrument_Iteration", (const char *)&unk_21FA9B047, v27, 2u);
        }

        goto LABEL_41;
      }
    }
    *(_OWORD *)(a1 + 104) = v28;
    *(void *)(a1 + 48) = v18;
    *(void *)(a1 + 80) = v20;
    *(void *)(a1 + 64) = v19;
    v23 = [v7 _transitionWithState:2 iteration:a1 instrumentals:v8];
    v24 = [v7 _transitionWithState:3 iteration:a1 instrumentals:v8];
    v25 = [v7 _transitionWithState:4 iteration:a1 instrumentals:v8];
    dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_36;
  }
  return 1;
}

void sub_21FA92698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
}

void __MXMQuiesceBeforeIteration_block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 6;
    [*(id *)(a1 + 32) setActive:0];
    id v6 = [MEMORY[0x263EFF940] exceptionWithName:@"MXMInstrumentErrorDomain" reason:@"Did not quiesce within time limit to specified cpu idle percentage." userInfo:0];
    objc_exception_throw(v6);
  }
}

void __MXMUncacheBeforeIteration_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = _MXMGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_21FA7B000, v2, OS_LOG_TYPE_ERROR, "Unable to uncache before iteration. See error logs for more details.", v3, 2u);
    }
  }
}

void __MXMTerminateBeforeIteration_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = _MXMGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_21FA7B000, v2, OS_LOG_TYPE_ERROR, "Unable to terminate processes before iteration. See error logs for more details.", v3, 2u);
    }
  }
}

void __MXMStartPerformanceTraceCollection_block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    uint64_t v12 = _MXMGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v11;
LABEL_10:
      _os_log_impl(&dword_21FA7B000, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (v10)
  {
    uint64_t v12 = _MXMGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v10;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (v9)
  {
    uint64_t v12 = _MXMGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v9;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_12:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 ^ 1u;
}

void __MXMStopPerformanceTraceCollection_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a3);
  uint64_t v23 = *(void *)(a1 + 32);
  if (!*(void *)(v23 + 24) || !*(void *)(v23 + 40))
  {
    if (v21)
    {
      v25 = _MXMGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        id v27 = v21;
LABEL_19:
        _os_log_impl(&dword_21FA7B000, v25, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);
      }
    }
    else if (v19)
    {
      v25 = _MXMGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        id v27 = v19;
        goto LABEL_19;
      }
    }
    else if (v22)
    {
      v25 = _MXMGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        id v27 = v22;
        goto LABEL_19;
      }
    }
    else if (v20)
    {
      v25 = _MXMGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        id v27 = v20;
        goto LABEL_19;
      }
    }
    else
    {
      if (!v18)
      {
LABEL_21:
        uint64_t v24 = 3;
        goto LABEL_22;
      }
      v25 = _MXMGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = 138412290;
        id v27 = v18;
        goto LABEL_19;
      }
    }

    goto LABEL_21;
  }
  uint64_t v24 = 2;
LABEL_22:
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v24;
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

uint64_t CARenderServerGetFrameCounterByIndex()
{
  return MEMORY[0x270EFB8B0]();
}

void CFRelease(CFTypeRef cf)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

kern_return_t host_processor_info(host_t host, processor_flavor_t flavor, natural_t *out_processor_count, processor_info_array_t *out_processor_info, mach_msg_type_number_t *out_processor_infoCnt)
{
  return MEMORY[0x270ED9E28](*(void *)&host, *(void *)&flavor, out_processor_count, out_processor_info, out_processor_infoCnt);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x270ED9E48](*(void *)&host_priv, *(void *)&flavor, host_info64_out, host_info64_outCnt);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

kern_return_t mach_port_space_basic_info(ipc_space_inspect_t task, ipc_info_space_basic_t *basic_info)
{
  return MEMORY[0x270EDA238](*(void *)&task, basic_info);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x270EDA278]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDA298](*(void *)&target, address, size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x270EDA838](__bufp, __sizep);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

uint64_t pdwriter_close()
{
  return MEMORY[0x270F8C628]();
}

uint64_t pdwriter_new_value()
{
  return MEMORY[0x270F8C630]();
}

uint64_t pdwriter_open_stream()
{
  return MEMORY[0x270F8C640]();
}

uint64_t pm_sample_task_and_pid()
{
  return MEMORY[0x270F9ABF8]();
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD58](*(void *)&type, *(void *)&typeinfo, buffer, *(void *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x270EDAD68](*(void *)&pid, *(void *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x270EDADA0]();
}

kern_return_t processor_set_default(host_t host, processor_set_name_t *default_set)
{
  return MEMORY[0x270EDADD8](*(void *)&host, default_set);
}

kern_return_t processor_set_statistics(processor_set_name_t pset, processor_set_flavor_t flavor, processor_set_info_t info_out, mach_msg_type_number_t *info_outCnt)
{
  return MEMORY[0x270EDADE0](*(void *)&pset, *(void *)&flavor, info_out, info_outCnt);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x270EDAE18](__attr, *(void *)&__qos_class, *(void *)&__relative_priority);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE38](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x270EDB840](*(void *)&target_tport, *(void *)&pid, t);
}

uint64_t thread_selfcounts()
{
  return MEMORY[0x270EDB918]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_minvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_normalizeD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, double *__Mean, double *__StandardDeviation, vDSP_Length __N)
{
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}