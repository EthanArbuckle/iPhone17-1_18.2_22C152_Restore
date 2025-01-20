uint64_t photosPreferenceChanged(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t vars8;

  result = objc_opt_respondsToSelector();
  if (result)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a2 selector:sel_photosPreferencesChanged object:0];
    return [a2 photosPreferencesChanged];
  }
  return result;
}

uint64_t FigJPEGIOSurfacePoolGetTypeID()
{
  return sIOSurfacePoolID;
}

uint64_t iosp_registerIOSurfaceMemPool()
{
  sIOSurfacePoolClass = 0;
  *(void *)algn_1EA137B98 = "FigIOSurfaceMemPool";
  qword_1EA137BA0 = (uint64_t)iosp_init;
  unk_1EA137BA8 = 0;
  qword_1EA137BB0 = (uint64_t)iosp_finalize;
  unk_1EA137BB8 = 0;
  qword_1EA137BC0 = 0;
  unk_1EA137BC8 = 0;
  qword_1EA137BD0 = (uint64_t)iosp_copyDebugDesc;
  uint64_t result = _CFRuntimeRegisterClass();
  sIOSurfacePoolID = result;
  return result;
}

CFMutableStringRef iosp_copyDebugDesc(uint64_t a1)
{
  long long context = 0u;
  long long v9 = 0u;
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  CFMutableStringRef Mutable = CFStringCreateMutable(v2, 0);
  CFStringAppendFormat(Mutable, 0, @"<FigJPEGIOSurfacePool %p> {\n  Subpools:\n\n", a1);
  if (*(void *)(a1 + 32) && *(void *)(a1 + 56))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      iosp_poolCollectStats(0, (int64x2_t *)(*(void *)(a1 + 32) + v3), (uint64_t)&context);
      ++v4;
      v3 += 80;
    }
    while (*(void *)(a1 + 56) > v4);
  }
  CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 40);
  if (v5) {
    CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)iosp_poolCollectStats, &context);
  }
  if (*((void *)&context + 1)) {
    double v6 = (double)*((unint64_t *)&context + 1)
  }
       * 100.0
       / (double)(unint64_t)(v9 + *((void *)&context + 1));
  else {
    double v6 = 0.0;
  }
  CFStringAppendFormat(Mutable, 0, @"  Subpool count:         %d\n  Total size:            %d bytes\n  Total IOSurface count: %d\n  Deep cleanup count:    %d\n  One-shot allocations:  %d\n  Allocations:           %d\n  Total hits:            %d\n  Total misses:          %d\n  Total deletes:         %d\n  Hit ratio:             %.2f%%\n}", (void)context, *(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), *(unsigned int *)(a1 + 176), (void)v9 + *((void *)&context + 1), *((void *)&context + 1), v9, *(void *)&v6);
  return Mutable;
}

int64x2_t iosp_poolCollectStats(uint64_t a1, int64x2_t *a2, uint64_t a3)
{
  CFStringAppendFormat(*(CFMutableStringRef *)(a3 + 32), 0, @"    subpool: %d\n", *(void *)a3);
  double v6 = *(__CFString **)(a3 + 32);
  if (a1)
  {
    int v7 = a2[4].i32[2];
    if (v7 <= 1111970368)
    {
      switch(v7)
      {
        case 32:
          v8 = "ARGB";
          goto LABEL_20;
        case 875704422:
          v8 = "420f";
          goto LABEL_20;
        case 875704438:
          v8 = "420v";
          goto LABEL_20;
      }
    }
    else if (v7 > 2037741157)
    {
      if (v7 == 2037741158)
      {
        v8 = "yuvf";
        goto LABEL_20;
      }
      if (v7 == 2037741171)
      {
        v8 = "yuvs";
        goto LABEL_20;
      }
    }
    else
    {
      if (v7 == 1111970369)
      {
        v8 = "BGRA";
        goto LABEL_20;
      }
      if (v7 == 1999843442)
      {
        v8 = "w30r";
LABEL_20:
        CFStringAppendFormat(v6, 0, @"    image:   %d x %d, (%d x %d padded), %s\n", a2[3].u32[2], a2[3].u32[3], a2[4].u32[0], a2[4].u32[1], v8);
        goto LABEL_21;
      }
    }
    v8 = "unknown";
    goto LABEL_20;
  }
  CFStringAppendFormat(v6, 0, @"    size:    %d\n", a2[1].i64[0]);
LABEL_21:
  CFStringAppendFormat(*(CFMutableStringRef *)(a3 + 32), 0, @"    count:   %d\n    hits:    %d\n    misses:  %d\n    deletes: %d\n\n", a2[1].i64[1], a2[2].i64[0], a2[2].i64[1], a2[3].i64[0]);
  ++*(void *)a3;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a3 + 8), a2[2]);
  *(int64x2_t *)(a3 + 8) = result;
  *(void *)(a3 + 24) += a2[3].i64[0];
  return result;
}

uint64_t iosp_finalize(uint64_t a1)
{
  CFAllocatorRef v2 = *(NSObject **)(a1 + 72);
  if (v2)
  {
    dispatch_source_cancel(v2);
    if (*(unsigned char *)(a1 + 180))
    {
      dispatch_resume(*(dispatch_object_t *)(a1 + 72));
      *(unsigned char *)(a1 + 180) = 0;
    }
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 80), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
  }
  uint64_t v3 = *(NSObject **)(a1 + 80);
  if (v3) {
    dispatch_release(v3);
  }
  unint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        iosp_poolDestroySubPool(0, (uint64_t *)(*(void *)(a1 + 32) + v5));
        ++v6;
        v5 += 80;
      }
      while (*(void *)(a1 + 56) > v6);
      unint64_t v4 = *(void **)(a1 + 32);
    }
    free(v4);
  }
  CFDictionaryRef v7 = *(const __CFDictionary **)(a1 + 40);
  if (v7)
  {
    CFDictionaryApplyFunction(v7, (CFDictionaryApplierFunction)iosp_poolDestroySubPool, 0);
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  v8 = *(const void **)(a1 + 184);
  if (v8) {
    CFRelease(v8);
  }
  free(*(void **)(a1 + 48));
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    return MEMORY[0x1F40DE348]();
  }
  return result;
}

void iosp_poolDestroySubPool(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    do
    {
      uint64_t v5 = *(void *)(v4 + 32);
      CFRelease(*(CFTypeRef *)v4);
      free((void *)v4);
      uint64_t v4 = v5;
    }
    while (v5);
  }
  if (a1)
  {
    free(a2);
  }
}

double iosp_init(_OWORD *a1)
{
  double result = 0.0;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t FigJPEGIOSurfaceMemoryPoolCreate(uint64_t a1, const __CFDictionary *a2, uint64_t *a3)
{
  fig_note_initialize_category_with_default_work();
  MEMORY[0x1C189EEC0](&FigJPEGIOSurfacePoolGetTypeID_registerOnce, iosp_registerIOSurfaceMemPool);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 4294954510;
  }
  uint64_t v6 = Instance;
  *(_OWORD *)(Instance + 104) = xmmword_1BEED8940;
  *(_OWORD *)(Instance + 120) = xmmword_1BEED8950;
  *(int64x2_t *)(Instance + 136) = vdupq_n_s64(0xCuLL);
  *(void *)(Instance + 88) = 1000000000;
  *(void *)(Instance + 184) = 0;
  iosp_poolSetOptions((void *)Instance, a2);
  if (*(void *)(v6 + 48))
  {
    size_t v7 = *(void *)(v6 + 56);
    goto LABEL_6;
  }
  v8 = malloc_type_malloc(0x58uLL, 0x1000040931E79F6uLL);
  *(void *)(v6 + 48) = v8;
  if (v8)
  {
    v8[2] = xmmword_1BEED8C68;
    v8[3] = unk_1BEED8C78;
    v8[4] = xmmword_1BEED8C88;
    _OWORD *v8 = kMemSubPoolDefaultBuffSizes;
    v8[1] = unk_1BEED8C58;
    *((void *)v8 + 10) = 10485760;
    size_t v7 = 11;
    *(void *)(v6 + 56) = 11;
LABEL_6:
    long long v9 = malloc_type_calloc(v7, 0x50uLL, 0x10A004002207240uLL);
    *(void *)(v6 + 32) = v9;
    if (v9)
    {
      uint64_t v10 = FigSimpleMutexCreate();
      *(void *)(v6 + 64) = v10;
      if (v10)
      {
        *(void *)(v6 + 16) = 0;
        *(void *)(v6 + 24) = v6 + 16;
        uint64_t v11 = *(void *)(v6 + 56);
        if (v11)
        {
          v12 = *(void **)(v6 + 32);
          v13 = *(uint64_t **)(v6 + 48);
          do
          {
            void *v12 = 0;
            v12[1] = v12;
            uint64_t v14 = *v13++;
            v12[2] = v14;
            v12 += 10;
            --v11;
          }
          while (v11);
        }
        dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
        *(void *)(v6 + 80) = v15;
        if (v15)
        {
          global_queue = dispatch_get_global_queue(0, 0);
          v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
          *(void *)(v6 + 72) = v17;
          if (v17)
          {
            dispatch_set_context(v17, (void *)v6);
            dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v6 + 72), (dispatch_function_t)iosp_poolDeepCleanup);
            v18 = *(NSObject **)(v6 + 72);
            dispatch_time_t v19 = dispatch_time(0, *(void *)(v6 + 88));
            dispatch_source_set_timer(v18, v19, *(void *)(v6 + 88), *(void *)(v6 + 88) / 0xAuLL);
            dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v6 + 72), (dispatch_function_t)iosp_poolCleanupTimerCanceled);
            uint64_t v20 = FigNanosecondsToHostTime();
            uint64_t result = 0;
            *(void *)(v6 + 88) = v20;
            *(unsigned char *)(v6 + 180) = 1;
            *a3 = v6;
            return result;
          }
        }
      }
    }
  }
  CFRelease((CFTypeRef)v6);
  return 4294954510;
}

void *iosp_poolSetOptions(void *result, const __CFDictionary *a2)
{
  int v18 = 0;
  if (a2)
  {
    uint64_t v3 = result;
    if (iosp_getIntValue(a2, @"HighWaterBytes", &v18))
    {
      int v4 = v18;
      if (!v18) {
        int v4 = 0x7FFFFFFF;
      }
      v3[13] = v4;
    }
    if (iosp_getIntValue(a2, @"LowWaterBytes", &v18))
    {
      int v5 = v18;
      if (!v18) {
        int v5 = 0x7FFFFFFF;
      }
      v3[14] = v5;
    }
    if (iosp_getIntValue(a2, @"MinBytes", &v18))
    {
      LODWORD(v6) = v18;
      if (!v18) {
        LODWORD(v6) = 0x7FFFFFFF;
      }
      uint64_t v6 = (int)v6;
    }
    else
    {
      uint64_t v6 = v3[14];
    }
    v3[15] = v6;
    if (iosp_getIntValue(a2, @"HighWaterBufferCount", &v18))
    {
      int v7 = v18;
      if (!v18) {
        int v7 = 0x7FFFFFFF;
      }
      v3[16] = v7;
    }
    if (iosp_getIntValue(a2, @"LowWaterBufferCount", &v18))
    {
      int v8 = v18;
      if (!v18) {
        int v8 = 0x7FFFFFFF;
      }
      v3[17] = v8;
    }
    if (iosp_getIntValue(a2, @"MinCount", &v18))
    {
      LODWORD(v9) = v18;
      if (!v18) {
        LODWORD(v9) = 0x7FFFFFFF;
      }
      uint64_t v9 = (int)v9;
    }
    else
    {
      uint64_t v9 = v3[17];
    }
    v3[18] = v9;
    if (iosp_getIntValue(a2, @"IdleTimeout", &v18))
    {
      if (v18) {
        uint64_t v10 = 1000000 * v18;
      }
      else {
        uint64_t v10 = -1;
      }
      v3[11] = v10;
    }
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a2, @"SizeTable");
    if (Value)
    {
      CFDataRef v12 = Value;
      CFTypeID TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v12))
      {
        size_t Length = CFDataGetLength(v12);
        dispatch_semaphore_t v15 = malloc_type_malloc(Length, 0x8C85384CuLL);
        v3[6] = v15;
        if (v15)
        {
          v16 = v15;
          BytePtr = CFDataGetBytePtr(v12);
          memcpy(v16, BytePtr, Length);
          v3[7] = Length >> 2;
        }
      }
    }
    uint64_t result = CFDictionaryGetValue(a2, (const void *)*MEMORY[0x1E4F2F068]);
    if (result)
    {
      uint64_t result = CFRetain(result);
      v3[23] = result;
    }
  }
  return result;
}

intptr_t iosp_poolCleanupTimerCanceled(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 80));
}

uint64_t iosp_poolDeepCleanup(uint64_t a1)
{
  uint64_t v2 = pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  if ((unint64_t)(MEMORY[0x1C189EE40](v2) - *(void *)(a1 + 96)) > *(void *)(a1 + 88))
  {
    if (dword_1EA137B80 >= 2)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    iosp_poolCleanup((void *)a1, *(void *)(a1 + 120), *(void *)(a1 + 144));
    ++*(void *)(a1 + 168);
    if (!*(unsigned char *)(a1 + 180))
    {
      dispatch_suspend(*(dispatch_object_t *)(a1 + 72));
      *(unsigned char *)(a1 + 180) = 1;
    }
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
}

void iosp_poolCleanup(void *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v18 = a3;
  unint64_t v3 = a2;
  if (a1[19] <= a2)
  {
    unint64_t v5 = a1[20];
    if (v5 <= a3) {
      return;
    }
  }
  else
  {
    if (a1[14] < a2) {
      unint64_t v3 = a1[14];
    }
    unint64_t v5 = a1[20];
  }
  if (v5 > a3)
  {
    unint64_t v6 = a3;
    if (a1[17] < a3) {
      unint64_t v6 = a1[17];
    }
    unint64_t v18 = v6;
  }
  uint64_t v7 = a1[2];
  if (v7)
  {
    do
    {
      uint64_t v8 = *(void *)(v7 + 48);
      if (!IOSurfaceIsInUse(*(IOSurfaceRef *)v7))
      {
        uint64_t v9 = *(void *)(v7 + 48);
        uint64_t v10 = *(void **)(v7 + 56);
        if (v9)
        {
          *(void *)(v9 + 56) = v10;
          uint64_t v10 = *(void **)(v7 + 56);
        }
        else
        {
          a1[3] = v10;
        }
        *uint64_t v10 = v9;
        uint64_t v11 = *(void *)(v7 + 32);
        CFDataRef v12 = *(void **)(v7 + 40);
        if (v11)
        {
          *(void *)(v11 + 40) = v12;
          CFDataRef v12 = *(void **)(v7 + 40);
        }
        else
        {
          *(void *)(*(void *)(v7 + 24) + 8) = v12;
        }
        void *v12 = v11;
        if (dword_1EA137B80 >= 2)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        CFRelease(*(CFTypeRef *)v7);
        int64x2_t v14 = *(int64x2_t *)(a1 + 19);
        v15.i64[1] = -1;
        v15.i64[0] = *(void *)(v7 + 8);
        v15.i64[0] = vsubq_s64(v14, v15).u64[0];
        v16.i64[0] = -1;
        v16.i64[1] = -1;
        v15.i64[1] = vaddq_s64(v14, v16).i64[1];
        *(int64x2_t *)(a1 + 19) = v15;
        uint64_t v17 = *(void *)(v7 + 24);
        --*(void *)(v17 + 24);
        ++*(void *)(v17 + 48);
        free((void *)v7);
        if (a1[19] <= v3 && a1[20] <= v18) {
          break;
        }
      }
      uint64_t v7 = v8;
    }
    while (v8);
  }
}

uint64_t iosp_getIntValue(const __CFDictionary *a1, const void *a2, void *a3)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberRef v5 = (const __CFNumber *)result;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v5))
    {
      CFNumberGetValue(v5, kCFNumberIntType, a3);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t FigJPEGIOSurfaceMemoryPoolCreateIOSurface(uint64_t a1, unint64_t a2, IOSurfaceRef *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3) {
    return 4294954516;
  }
  unint64_t v6 = *(unint64_t **)(a1 + 48);
  if (*v6 >= a2)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = *(void *)(a1 + 56) - 1;
    if (v6[v7] < a2) {
      goto LABEL_4;
    }
    if (v7 >= 2)
    {
      uint64_t v16 = 0;
      do
      {
        if (v6[(v16 + v7) >> 1] >= a2) {
          unint64_t v7 = (v16 + v7) >> 1;
        }
        else {
          uint64_t v16 = (v16 + v7) >> 1;
        }
      }
      while (v7 - v16 > 1);
      if ((v7 & 0x8000000000000000) != 0)
      {
LABEL_4:
        uint64_t result = iosp_createMemIOSurface(a2, a3);
        if (!result)
        {
          IOSurfaceIncrementUseCount(*a3);
          FigAtomicIncrement32();
          return 0;
        }
        return result;
      }
    }
  }
  uint64_t v9 = (uint64_t *)(v3 + 80 * v7);
  uint64_t v10 = pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  *(void *)(a1 + 96) = MEMORY[0x1C189EE40](v10);
  if (*(unsigned char *)(a1 + 180))
  {
    dispatch_resume(*(dispatch_object_t *)(a1 + 72));
    *(unsigned char *)(a1 + 180) = 0;
  }
  iosp_poolCleanup((void *)a1, *(void *)(a1 + 104), *(void *)(a1 + 128));
  uint64_t v11 = *v9;
  if (*v9)
  {
    while (IOSurfaceIsInUse(*(IOSurfaceRef *)v11))
    {
      uint64_t v11 = *(void *)(v11 + 32);
      if (!v11) {
        goto LABEL_12;
      }
    }
    iosp_poolUpdateBuffPosition(a1, v3 + 80 * v7, v11);
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
    uint64_t result = 0;
    *a3 = *(IOSurfaceRef *)v11;
  }
  else
  {
LABEL_12:
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
    uint64_t v12 = v3 + 80 * v7;
    uint64_t v14 = *(void *)(v12 + 16);
    v13 = (uint64_t *)(v12 + 16);
    uint64_t result = iosp_createMemIOSurface(v14, a3);
    if (!result)
    {
      IOSurfaceIncrementUseCount(*a3);
      uint64_t result = (uint64_t)malloc_type_malloc(0x40uLL, 0x10A0040CA53F77BuLL);
      if (result)
      {
        uint64_t v15 = *v13;
        *(void *)uint64_t result = *a3;
        *(void *)(result + 8) = v15;
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v9;
        iosp_poolInsertNewBuff(a1, (void *)(v3 + 80 * v7), result);
        return 0;
      }
    }
  }
  return result;
}

uint64_t iosp_createMemIOSurface(int a1, IOSurfaceRef *a2)
{
  if (dword_1EA137B80 >= 2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  CFMutableStringRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!Mutable) {
    return 4294954510;
  }
  unint64_t v6 = Mutable;
  iosp_setIntValue(Mutable, (const void *)*MEMORY[0x1E4F2EFE8], 1024);
  iosp_setIntValue(v6, (const void *)*MEMORY[0x1E4F2F150], 1246774599);
  iosp_setIntValue(v6, (const void *)*MEMORY[0x1E4F2EFB8], a1);
  IOSurfaceRef v7 = IOSurfaceCreate(v6);
  if (v7)
  {
    uint64_t v8 = 0;
    *a2 = v7;
  }
  else
  {
    uint64_t v8 = 4294954510;
  }
  CFRelease(v6);
  return v8;
}

CFTypeRef iosp_poolUpdateBuffPosition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 32);
  unint64_t v6 = *(void **)(a3 + 40);
  if (v5)
  {
    *(void *)(v5 + 40) = v6;
    unint64_t v6 = *(void **)(a3 + 40);
  }
  else
  {
    *(void *)(a2 + 8) = v6;
  }
  *unint64_t v6 = v5;
  IOSurfaceRef v7 = *(void **)(a2 + 8);
  *(void *)(a3 + 32) = 0;
  *(void *)(a3 + 40) = v7;
  *IOSurfaceRef v7 = a3;
  *(void *)(a2 + 8) = a3 + 32;
  uint64_t v8 = *(void *)(a3 + 48);
  uint64_t v9 = *(void **)(a3 + 56);
  if (v8)
  {
    *(void *)(v8 + 56) = v9;
    uint64_t v9 = *(void **)(a3 + 56);
  }
  else
  {
    *(void *)(a1 + 24) = v9;
  }
  *uint64_t v9 = v8;
  uint64_t v10 = *(void **)(a1 + 24);
  *(void *)(a3 + 48) = 0;
  *(void *)(a3 + 56) = v10;
  *uint64_t v10 = a3;
  *(void *)(a1 + 24) = a3 + 48;
  IOSurfaceIncrementUseCount(*(IOSurfaceRef *)a3);
  CFTypeRef result = CFRetain(*(CFTypeRef *)a3);
  ++*(void *)(a2 + 32);
  return result;
}

uint64_t iosp_poolInsertNewBuff(uint64_t a1, void *a2, uint64_t a3)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  CFRetain(*(CFTypeRef *)a3);
  *(void *)(a3 + 32) = 0;
  unint64_t v6 = (void *)a2[1];
  *(void *)(a3 + 40) = v6;
  *unint64_t v6 = a3;
  a2[1] = a3 + 32;
  *(void *)(a3 + 48) = 0;
  IOSurfaceRef v7 = *(void **)(a1 + 24);
  *(void *)(a3 + 56) = v7;
  *IOSurfaceRef v7 = a3;
  *(void *)(a1 + 24) = a3 + 48;
  int64x2_t v8 = vdupq_n_s64(1uLL);
  v8.i64[0] = *(void *)(a3 + 8);
  *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), v8);
  ++a2[3];
  ++a2[5];
  uint64_t v9 = *(pthread_mutex_t **)(a1 + 64);
  return pthread_mutex_unlock(v9);
}

void iosp_setIntValue(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberIntType, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t FigJPEGIOSurfaceImagePoolCreate(const __CFAllocator *a1, const __CFDictionary *a2, uint64_t *a3)
{
  fig_note_initialize_category_with_default_work();
  MEMORY[0x1C189EEC0](&FigJPEGIOSurfacePoolGetTypeID_registerOnce, iosp_registerIOSurfaceMemPool);
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (!Instance) {
    return 4294954510;
  }
  uint64_t v7 = Instance;
  *(_OWORD *)(Instance + 104) = xmmword_1BEED8960;
  *(_OWORD *)(Instance + 120) = xmmword_1BEED8970;
  *(int64x2_t *)(Instance + 136) = vdupq_n_s64(0xC0uLL);
  *(void *)(Instance + 88) = 1000000000;
  *(void *)(Instance + 184) = 0;
  iosp_poolSetOptions((void *)Instance, a2);
  uint64_t v8 = *(void *)(v7 + 48);
  if (v8)
  {
    if (!*(void *)(v7 + 56)) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v9 = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
  *(void *)(v7 + 48) = v9;
  if (v9)
  {
    v9[2] = xmmword_1BEED8CC0;
    v9[3] = unk_1BEED8CD0;
    v9[4] = xmmword_1BEED8CE0;
    v9[5] = unk_1BEED8CF0;
    *uint64_t v9 = kImgSubPoolDefaultDimensions;
    v9[1] = unk_1BEED8CB0;
    *(void *)(v7 + 56) = 12;
    uint64_t v8 = *(void *)(v7 + 48);
LABEL_7:
    unint64_t v10 = 0;
    do
    {
      *(void *)(v8 + 8 * v10) = (*(void *)(v8 + 8 * v10) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      ++v10;
    }
    while (*(void *)(v7 + 56) > v10);
LABEL_9:
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E4F1D530], 0);
    *(void *)(v7 + 40) = Mutable;
    if (Mutable)
    {
      uint64_t v12 = FigSimpleMutexCreate();
      *(void *)(v7 + 64) = v12;
      if (v12)
      {
        *(void *)(v7 + 16) = 0;
        *(void *)(v7 + 24) = v7 + 16;
        dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
        *(void *)(v7 + 80) = v13;
        if (v13)
        {
          global_queue = dispatch_get_global_queue(0, 0);
          uint64_t v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
          *(void *)(v7 + 72) = v15;
          if (v15)
          {
            dispatch_set_context(v15, (void *)v7);
            dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v7 + 72), (dispatch_function_t)iosp_poolDeepCleanup);
            uint64_t v16 = *(NSObject **)(v7 + 72);
            dispatch_time_t v17 = dispatch_time(0, *(void *)(v7 + 88));
            dispatch_source_set_timer(v16, v17, *(void *)(v7 + 88), *(void *)(v7 + 88) / 0xAuLL);
            dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v7 + 72), (dispatch_function_t)iosp_poolCleanupTimerCanceled);
            uint64_t v18 = FigNanosecondsToHostTime();
            uint64_t result = 0;
            *(void *)(v7 + 88) = v18;
            *(unsigned char *)(v7 + 180) = 1;
            *a3 = v7;
            return result;
          }
        }
      }
    }
  }
  CFRelease((CFTypeRef)v7);
  return 4294954510;
}

uint64_t FigJPEGIOSurfaceImagePoolCreateIOSurface(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, unint64_t a6, unint64_t a7, int a8, unint64_t a9, IOSurfaceRef *a10)
{
  uint64_t v18 = iosp_bytesPerPixel(a2);
  if (!*(void *)(a1 + 40)) {
    return 4294954516;
  }
  unint64_t v19 = 1;
  if ((a2 & 0xFFFFFFEF) == 0x34323066) {
    unint64_t v19 = 2;
  }
  if (a6) {
    unint64_t v20 = a6;
  }
  else {
    unint64_t v20 = v19;
  }
  if (a7) {
    unint64_t v19 = a7;
  }
  if (a2 & 0xFFFFFFEF) == 0x34323066 && ((v19 | v20)) {
    return FigSignalErrorAt3();
  }
  uint64_t v48 = v18;
  if (a9) {
    unint64_t v21 = a9;
  }
  else {
    unint64_t v21 = 16;
  }
  v22 = *(unint64_t **)(a1 + 48);
  unint64_t v23 = *(void *)(a1 + 56) - 1;
  unint64_t v24 = v22[v23];
  unint64_t v25 = (a3 + v20 - 1) & -(uint64_t)v20;
  unint64_t v26 = (a4 + v19 - 1) & -(uint64_t)v19;
  if (v25 > v24 || v26 > v24) {
    goto LABEL_67;
  }
  LODWORD(v20) = (a3 + v20 - 1) & -(int)v20;
  LODWORD(v19) = (a4 + v19 - 1) & -(int)v19;
  if (!(a8 | a5))
  {
    unint64_t v19 = *v22;
    if (*v22 >= v25)
    {
      uint64_t v28 = 0;
    }
    else
    {
      uint64_t v28 = *(void *)(a1 + 56) - 1;
      if (v23 >= 2)
      {
        unint64_t v29 = 0;
        uint64_t v28 = *(void *)(a1 + 56) - 1;
        do
        {
          if (v22[(v29 + v28) >> 1] >= v25) {
            uint64_t v28 = (v29 + v28) >> 1;
          }
          else {
            unint64_t v29 = (v29 + v28) >> 1;
          }
        }
        while (v28 - v29 > 1);
        if (v28 < 0) {
          goto LABEL_67;
        }
      }
    }
    unint64_t v20 = v22[v28];
    if (v19 < v26)
    {
      unint64_t v19 = v22[v23];
      if (v19 < v26) {
        goto LABEL_67;
      }
      if (v23 >= 2)
      {
        uint64_t v30 = 0;
        do
        {
          if (v22[(v30 + v23) >> 1] >= v26) {
            unint64_t v23 = (v30 + v23) >> 1;
          }
          else {
            uint64_t v30 = (v30 + v23) >> 1;
          }
        }
        while (v23 - v30 > 1);
        if ((v23 & 0x8000000000000000) != 0) {
          goto LABEL_67;
        }
        unint64_t v19 = v22[v23];
      }
    }
  }
  int v31 = a5 ? a4 : v19;
  int v32 = a5 ? a3 : v20;
  *(_DWORD *)bytes = v32;
  *(_DWORD *)&bytes[4] = v31;
  *(_DWORD *)&bytes[8] = v20;
  *(_DWORD *)&bytes[12] = v19;
  int v50 = a2;
  CFAllocatorRef v33 = CFGetAllocator((CFTypeRef)a1);
  CFDataRef v34 = CFDataCreate(v33, bytes, 20);
  if (!v34) {
    goto LABEL_67;
  }
  CFDataRef v35 = v34;
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  CFDataRef Value = (uint64_t *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), v35);
  if (!Value)
  {
    v37 = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x10A004002207240uLL);
    CFDataRef Value = (uint64_t *)v37;
    if (v37)
    {
      *(void *)v37 = 0;
      *((void *)v37 + 1) = v37;
      *(_OWORD *)(v37 + 56) = *(_OWORD *)bytes;
      *((_DWORD *)v37 + 18) = v50;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), v35, v37);
    }
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
  CFRelease(v35);
  if (!Value)
  {
LABEL_67:
    unint64_t v46 = v48 * v25;
    if (!a8)
    {
      if (v46 % v21) {
        unint64_t v47 = v21 - v46 % v21;
      }
      else {
        LODWORD(v47) = 0;
      }
      LODWORD(v46) = v47 + v46;
    }
    uint64_t result = iosp_createImgIOSurface(a2, a3, a4, v46, v26, *(const void **)(a1 + 184), a10);
    if (!result)
    {
      IOSurfaceIncrementUseCount(*a10);
      FigAtomicIncrement32();
      return 0;
    }
    return result;
  }
  uint64_t v38 = pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  *(void *)(a1 + 96) = MEMORY[0x1C189EE40](v38);
  if (*(unsigned char *)(a1 + 180))
  {
    dispatch_resume(*(dispatch_object_t *)(a1 + 72));
    *(unsigned char *)(a1 + 180) = 0;
  }
  iosp_poolCleanup((void *)a1, *(void *)(a1 + 104), *(void *)(a1 + 128));
  for (uint64_t i = *Value; i; uint64_t i = *(void *)(i + 32))
  {
    if (!IOSurfaceIsInUse(*(IOSurfaceRef *)i))
    {
      unint64_t v40 = *(void *)(i + 16);
      if (a8)
      {
        if (v40 == v48 * *(unsigned int *)(*(void *)(i + 24) + 64)) {
          goto LABEL_76;
        }
      }
      else if (!(v40 % v21))
      {
LABEL_76:
        iosp_poolUpdateBuffPosition(a1, (uint64_t)Value, i);
        pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
        uint64_t result = 0;
        *a10 = *(IOSurfaceRef *)i;
        return result;
      }
    }
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
  unint64_t v41 = v48 * *((unsigned int *)Value + 16);
  if (!a8)
  {
    if (v41 % v21) {
      unint64_t v42 = v21 - v41 % v21;
    }
    else {
      unint64_t v42 = 0;
    }
    v41 += v42;
  }
  uint64_t result = iosp_createImgIOSurface(a2, *((unsigned int *)Value + 14), *((unsigned int *)Value + 15), v41, *((unsigned int *)Value + 17), *(const void **)(a1 + 184), a10);
  if (!result)
  {
    IOSurfaceIncrementUseCount(*a10);
    uint64_t result = (uint64_t)malloc_type_malloc(0x40uLL, 0x10A0040CA53F77BuLL);
    if (result)
    {
      v44 = (void *)result;
      v45 = *a10;
      void *v44 = *a10;
      v44[3] = Value;
      v44[1] = IOSurfaceGetAllocSize(v45);
      v44[2] = v41;
      iosp_poolInsertNewBuff(a1, Value, (uint64_t)v44);
      return 0;
    }
  }
  return result;
}

uint64_t iosp_bytesPerPixel(int a1)
{
  uint64_t result = 4;
  if (a1 > 1278555700)
  {
    if (a1 > 2037741157)
    {
      if (a1 != 2037741171 && a1 != 2037741158) {
        return 1;
      }
    }
    else if (a1 != 1278555701)
    {
      int v3 = 1999843442;
      goto LABEL_10;
    }
    return 2;
  }
  if (a1 > 875704437)
  {
    if (a1 == 875704438) {
      return 1;
    }
    int v3 = 1111970369;
LABEL_10:
    if (a1 == v3) {
      return result;
    }
    return 1;
  }
  if (a1 != 32) {
    return 1;
  }
  return result;
}

uint64_t iosp_createImgIOSurface(int a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, const void *a6, IOSurfaceRef *a7)
{
  uint64_t v7 = a7;
  uint64_t v8 = a6;
  uint64_t v9 = a5;
  uint64_t v12 = a2;
  if (dword_1EA137B80 >= 2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    uint64_t v12 = a2;
    uint64_t v9 = a5;
    uint64_t v8 = a6;
    uint64_t v7 = a7;
  }
  uint64_t v19 = 4294954516;
  if (a1 > 1278555700)
  {
    if (a1 > 2037741157)
    {
      if (a1 != 2037741158 && a1 != 2037741171) {
        return v19;
      }
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (Mutable)
      {
        v22 = Mutable;
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F2F120], @"PurpleGfxMem");
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2EFE8], 1024);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F2C0], v12);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F0E8], a3);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F150], a1);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2EFE0], a4);
        unint64_t v25 = (const void *)*MEMORY[0x1E4F2EFB8];
        unint64_t v26 = v22;
        int v27 = v9 * a4;
LABEL_20:
        iosp_setIntValue(v26, v25, v27);
        IOSurfaceRef v29 = IOSurfaceCreate(v22);
        if (v29)
        {
          *uint64_t v7 = v29;
          CFRelease(v22);
LABEL_22:
          if (*v7) {
            IOSurfaceSetValue(*v7, (CFStringRef)*MEMORY[0x1E4F2F068], v8);
          }
          return 0;
        }
        goto LABEL_35;
      }
      return 4294954510;
    }
    if (a1 == 1278555701)
    {
LABEL_14:
      unint64_t v21 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (v21)
      {
        v22 = v21;
        iosp_setIntValue(v21, (const void *)*MEMORY[0x1E4F2EFE8], 1024);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F2C0], v12);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F0E8], a3);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F150], a1);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2EFE0], a4);
        unint64_t v23 = (const void *)*MEMORY[0x1E4F2EFD8];
        int v24 = iosp_bytesPerPixel(a1);
        iosp_setIntValue(v22, v23, v24);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2EFB8], v9 * a4);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F138], 0);
        iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F0A0], 1);
        unint64_t v25 = (const void *)*MEMORY[0x1E4F2F098];
        unint64_t v26 = v22;
        int v27 = 1;
        goto LABEL_20;
      }
      return 4294954510;
    }
    int v20 = 1999843442;
LABEL_13:
    if (a1 != v20) {
      return v19;
    }
    goto LABEL_14;
  }
  if (a1 > 875704437)
  {
    if (a1 == 875704438) {
      goto LABEL_26;
    }
    int v20 = 1111970369;
    goto LABEL_13;
  }
  if (a1 == 32) {
    goto LABEL_14;
  }
  if (a1 != 875704422) {
    return v19;
  }
LABEL_26:
  CFAllocatorRef v31 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int v32 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v32) {
    return 4294954510;
  }
  v22 = v32;
  CFDictionarySetValue(v32, (const void *)*MEMORY[0x1E4F2F120], @"PurpleGfxMem");
  iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2EFE8], 1024);
  iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F2C0], v12);
  uint64_t v33 = a3;
  iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F0E8], a3);
  iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2F150], a1);
  CFMutableArrayRef v34 = CFArrayCreateMutable(v31, 2, MEMORY[0x1E4F1D510]);
  if (!v34)
  {
LABEL_35:
    CFRelease(v22);
    return 4294954510;
  }
  CFDataRef v35 = v34;
  v36 = CFDictionaryCreateMutable(v31, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v36)
  {
    v37 = v36;
    v51 = v7;
    v52 = v8;
    v49 = (const void *)*MEMORY[0x1E4F2F258];
    iosp_setIntValue(v36, (const void *)*MEMORY[0x1E4F2F258], v12);
    int v50 = (const void *)*MEMORY[0x1E4F2F220];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E4F2F220], v33);
    uint64_t v48 = (const void *)*MEMORY[0x1E4F2F170];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E4F2F170], 1);
    unint64_t v47 = (const void *)*MEMORY[0x1E4F2F240];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E4F2F240], 0);
    uint64_t v38 = (const void *)*MEMORY[0x1E4F2F178];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E4F2F178], a4);
    uint64_t v39 = v12;
    int v40 = v9 * a4;
    uint64_t v46 = v9;
    unint64_t v41 = (const void *)*MEMORY[0x1E4F2F248];
    iosp_setIntValue(v37, (const void *)*MEMORY[0x1E4F2F248], v40);
    CFArrayAppendValue(v35, v37);
    CFRelease(v37);
    unint64_t v42 = CFDictionaryCreateMutable(v31, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v42)
    {
      v43 = v42;
      iosp_setIntValue(v42, v49, (unint64_t)(v39 + 1) >> 1);
      iosp_setIntValue(v43, v50, (unint64_t)(v33 + 1) >> 1);
      iosp_setIntValue(v43, v48, 2);
      iosp_setIntValue(v43, v47, v40);
      iosp_setIntValue(v43, v38, a4);
      int v44 = ((unint64_t)(v46 + 1) >> 1) * a4;
      iosp_setIntValue(v43, v41, v44);
      CFArrayAppendValue(v35, v43);
      CFDictionarySetValue(v22, (const void *)*MEMORY[0x1E4F2F238], v35);
      iosp_setIntValue(v22, (const void *)*MEMORY[0x1E4F2EFB8], v44 + v40);
      IOSurfaceRef v45 = IOSurfaceCreate(v22);
      if (v45)
      {
        uint64_t v19 = 0;
        uint64_t v7 = v51;
        uint64_t v8 = v52;
        IOSurfaceRef *v51 = v45;
      }
      else
      {
        uint64_t v19 = 4294954510;
        uint64_t v7 = v51;
        uint64_t v8 = v52;
      }
      CFRelease(v22);
    }
    else
    {
      uint64_t v19 = 4294954510;
      v43 = v22;
      uint64_t v7 = v51;
      uint64_t v8 = v52;
    }
  }
  else
  {
    uint64_t v19 = 4294954510;
    v43 = v22;
  }
  CFRelease(v43);
  CFRelease(v35);
  if (!v19) {
    goto LABEL_22;
  }
  return v19;
}

uint64_t FigJPEGIOSurfacePoolFlush(uint64_t a1)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
  iosp_poolCleanup((void *)a1, 0, 0);
  uint64_t v2 = *(pthread_mutex_t **)(a1 + 64);
  return pthread_mutex_unlock(v2);
}

void sub_1BEE9DED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CGFloat operator||(double a1, double a2, double a3, double a4, float a5, double a6, double a7)
{
  v8.size.width = a3 * a5;
  v8.size.height = a4 * a5;
  v8.origin.x = a6 - v8.size.width * 0.5;
  v8.origin.y = a7 - v8.size.height * 0.5;
  CGRect v9 = CGRectIntegral(v8);
  return v9.size.width;
}

__CFString *StringFromExpandableViewState(unsigned int a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_1E63D2008[a1];
  }
}

uint64_t MetaStateFromState(int a1)
{
  if ((a1 - 1) > 6) {
    return 0;
  }
  else {
    return dword_1BEED8D00[a1 - 1];
  }
}

uint64_t PLTransformForImageOrientationAndSize@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  switch(result)
  {
    case 1:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0xBFF0000000000000;
      goto LABEL_12;
    case 2:
      *(_OWORD *)(a2 + 8) = xmmword_1BEED8990;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      goto LABEL_9;
    case 3:
      *(_OWORD *)(a2 + 8) = xmmword_1BEED8980;
      goto LABEL_7;
    case 4:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0x3FF0000000000000;
LABEL_7:
      *(double *)(a2 + 32) = a3;
      break;
    case 5:
      *(void *)a2 = 0x3FF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0xBFF0000000000000;
LABEL_9:
      *(double *)(a2 + 40) = a4;
      break;
    case 6:
      __asm { FMOV            V0.2D, #1.0; jumptable 00000001BEEA8368 case 6 }
      *(_OWORD *)(a2 + 8) = _Q0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
      *(void *)(a2 + 24) = 0;
      break;
    case 7:
      __asm { FMOV            V2.2D, #-1.0; jumptable 00000001BEEA8368 case 7 }
      *(_OWORD *)(a2 + 8) = _Q2;
LABEL_12:
      *(double *)(a2 + 32) = a3;
      *(double *)(a2 + 40) = a4;
      break;
    default:
      uint64_t v4 = MEMORY[0x1E4F1DAB8];
      long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)a2 = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
      break;
  }
  return result;
}

uint64_t NewUIImageFromCachedImage(void *a1)
{
  uint64_t v2 = [a1 imageOrientation];
  uint64_t v3 = [a1 CGImage];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = objc_alloc(MEMORY[0x1E4F42A80]);
    return [v5 initWithCGImage:v4 imageOrientation:v2];
  }
  else
  {
    uint64_t result = [a1 ioSurface];
    if (result)
    {
      uint64_t v7 = (CGImage *)PLCreateCGImageFromIOSurface();
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v7 imageOrientation:v2];
      CGImageRelease(v7);
      return v8;
    }
  }
  return result;
}

uint64_t _PLIncrementSharedCountForAssets(void *a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "firstObject"), "photoLibrary");
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___PLIncrementSharedCountForAssets_block_invoke;
  v4[3] = &unk_1E63D2660;
  v4[4] = a1;
  return [v2 performChanges:v4 completionHandler:0];
}

uint64_t _PLIncrementSharedCountForAsset(void *a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend(a1, "pl_PHAssetFromPhotoLibrary:", PLNavigationControllerInterfacePhotoLibrary(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "photoLibrary"), "pathManager"), "libraryURL")));
  if (result)
  {
    v5[0] = result;
    uint64_t v2 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    uint64_t v3 = objc_msgSend((id)objc_msgSend(v2, "firstObject"), "photoLibrary");
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ___PLIncrementSharedCountForAssets_block_invoke;
    v4[3] = &unk_1E63D2660;
    v4[4] = v2;
    return [v3 performChanges:v4 completionHandler:0];
  }
  return result;
}

uint64_t PLNavigationControllerInterfacePhotoLibrary(uint64_t a1)
{
  if ([MEMORY[0x1E4F39228] isMultiLibraryModeEnabled])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __PLNavigationControllerInterfacePhotoLibrary_block_invoke;
    block[3] = &unk_1E63D2660;
    block[4] = a1;
    if (PLNavigationControllerInterfacePhotoLibrary_onceToken != -1) {
      dispatch_once(&PLNavigationControllerInterfacePhotoLibrary_onceToken, block);
    }
    if (([(id)PLNavigationControllerInterfacePhotoLibrary_sPhotoLibraryURL isEqual:a1] & 1) == 0)
    {
      uint64_t v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"PHPhotoLibrary *PLNavigationControllerInterfacePhotoLibrary(NSURL *)"];
      [v4 handleFailureInFunction:v5, @"PLNavigationControllerInterface.m", 175, @"Requested URL %@ does not match previous URL %@", a1, PLNavigationControllerInterfacePhotoLibrary_sPhotoLibraryURL file lineNumber description];
    }
    return PLNavigationControllerInterfacePhotoLibrary_sPhotoLibrary;
  }
  else
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F39228];
    return [v3 sharedPhotoLibrary];
  }
}

void __PLNavigationControllerInterfacePhotoLibrary_block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  PLNavigationControllerInterfacePhotoLibrary_sPhotoLibraryURL = *(void *)(a1 + 32);
  PLNavigationControllerInterfacePhotoLibrary_sPhotoLibrary = [objc_alloc(MEMORY[0x1E4F39228]) initWithPhotoLibraryURL:*(void *)(a1 + 32)];
  uint64_t v2 = 0;
  if (([(id)PLNavigationControllerInterfacePhotoLibrary_sPhotoLibrary openAndWaitWithUpgrade:0 error:&v2] & 1) == 0)
  {
    Log = PLPhotoPickerGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v4 = v2;
      _os_log_error_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_ERROR, "PLNavigationControllerInterface unable to open system photo library: %@", buf, 0xCu);
    }
  }
}

void PLNotifyImagePickerOfImageAvailability(void *a1, void *a2, void *a3, void *a4, int a5)
{
  id InfoForImage = __CreateInfoForImage(a1, a2, a3, a4, a5);
  if (a3) {
    _PLIncrementSharedCountForAsset(a3);
  }
  [a1 _imagePickerDidCompleteWithInfo:InfoForImage];
}

id __CreateInfoForImage(void *a1, void *a2, void *a3, void *a4, int a5)
{
  char v10 = [a1 _imagePickerSavingOptions];
  uint64_t v11 = [a1 sourceType];
  int v12 = objc_msgSend((id)objc_msgSend(a1, "_valueForProperty:", *MEMORY[0x1E4F44080]), "BOOLValue");
  int v13 = [a1 showsCameraControls];
  return __CreateInfoForImageWithProperties(v11, v13, v10, v12, a2, a3, a4, a5);
}

id __CreateInfoForImageWithProperties(uint64_t a1, int a2, char a3, int a4, void *a5, void *a6, void *a7, int a8)
{
  unint64_t v54 = a1 & 0xFFFFFFFFFFFFFFFDLL;
  BOOL v15 = (a1 & 0xFFFFFFFFFFFFFFFDLL) == 0;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a6)
  {
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a6, "pl_PHAssetFromPhotoLibrary:", PLNavigationControllerInterfacePhotoLibrary(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a6, "photoLibrary"), "pathManager"), "libraryURL"))), "localIdentifier");
    if (v17) {
      [v16 setObject:v17 forKey:*MEMORY[0x1E4F44078]];
    }
  }
  if (a1 == 1) {
    a8 &= a2 & a4;
  }
  uint64_t v52 = *MEMORY[0x1E4F43980];
  uint64_t v18 = objc_msgSend(a7, "objectForKey:");
  uint64_t v19 = (id *)MEMORY[0x1E4F44400];
  if (v18) {
    uint64_t v19 = (id *)MEMORY[0x1E4F44420];
  }
  uint64_t v20 = [*v19 identifier];
  [v16 setObject:v20 forKey:*MEMORY[0x1E4F43990]];
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  id v64 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v56 = ____CreateInfoForImageWithProperties_block_invoke;
  v57 = &unk_1E63D20C0;
  BOOL v61 = (a3 & 2) != 0;
  BOOL v62 = v15;
  id v58 = v16;
  v59 = &v69;
  BOOL v63 = (a3 & 4) != 0;
  v60 = &v65;
  if (a7 && a8)
  {
    unint64_t v21 = (void *)[a7 objectForKey:*MEMORY[0x1E4F8CAF8]];
    if (v21)
    {
      v22 = (void *)NewUIImageFromCachedImage(v21);
      if (v22)
      {
        uint64_t v23 = [a7 objectForKey:*MEMORY[0x1E4F8CB08]];
        if (v23)
        {
          int v24 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithData:v23];
          if (v24)
          {
            [v16 setObject:v24 forKey:*MEMORY[0x1E4F44060]];
          }
        }
        if ((a3 & 4) == 0)
        {
          if ((a3 & 2) == 0)
          {
            uint64_t v25 = 0;
            unint64_t v26 = a6;
            goto LABEL_63;
          }
          unint64_t v26 = a6;
          goto LABEL_60;
        }
        uint64_t v36 = [a7 objectForKey:*MEMORY[0x1E4F8CB18]];
        if (v36)
        {
          [a5 _imageOrientation];
          uint64_t ImageDataFromJPEGDataAndOrientation = CreateImageDataFromJPEGDataAndOrientation();
          uint64_t v38 = (void *)ImageDataFromJPEGDataAndOrientation;
          if (ImageDataFromJPEGDataAndOrientation) {
            uint64_t v39 = ImageDataFromJPEGDataAndOrientation;
          }
          else {
            uint64_t v39 = v36;
          }
          [v16 setObject:v39 forKey:*MEMORY[0x1E4F44070]];

          *((unsigned char *)v66 + 24) = 1;
          unint64_t v26 = a6;
          if ((a3 & 2) != 0)
          {
LABEL_60:
            if (!v54)
            {
              uint64_t v25 = 0;
              a6 = 0;
              if (v26)
              {
LABEL_73:
                int v40 = (void *)[MEMORY[0x1E4F8A6A0] sharedAssetsSaver];
                uint64_t v41 = [v26 objectID];
                uint64_t v42 = objc_msgSend(v40, "requestSynchronousImageForAssetOID:withFormat:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageDataInfo:outCPLDownloadContext:", v41, objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F8B918], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID"), 1, v54 == 0, 0, 0, &v64, 0);
                ((void (*)(void *, uint64_t, id, void))v56)(v55, v42, v64, 0);
                a6 = v26;
              }
LABEL_74:
              v43 = (void *)[a7 objectForKey:*MEMORY[0x1E4F8CAF0]];
              uint64_t v44 = [v16 objectForKey:*MEMORY[0x1E4F44070]];
              if (v43)
              {
                if (!(v44 | v25)) {
                  goto LABEL_80;
                }
                if (v44) {
                  PLImageSizeFromImageData();
                }
                else {
                  [(id)v25 size];
                }
                objc_msgSend((id)objc_msgSend(a5, "image"), "size");
                [v43 CGRectValue];
                PLScaledCropRect();
                v43 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
                if (v43) {
LABEL_80:
                }
                  [v16 setObject:v43 forKey:*MEMORY[0x1E4F43968]];
              }
              [v16 setObject:v22 forKey:*MEMORY[0x1E4F43970]];
              goto LABEL_82;
            }
LABEL_61:
            uint64_t v25 = [a5 _newOriginalImageForPickerFromCachedData];
            if (v25)
            {
              [v16 setObject:v25 forKey:*MEMORY[0x1E4F439A0]];
              *((unsigned char *)v70 + 24) = 1;
            }
LABEL_63:
            if (!v26)
            {
              a6 = 0;
              goto LABEL_74;
            }
            if (!v54 || (a3 & 4) != 0 && !*((unsigned char *)v66 + 24)) {
              goto LABEL_73;
            }
            if ((a3 & 2) == 0)
            {
              a6 = v26;
              goto LABEL_74;
            }
            a6 = v26;
            if (!*((unsigned char *)v70 + 24)) {
              goto LABEL_73;
            }
            goto LABEL_74;
          }
        }
        else
        {
          unint64_t v26 = objc_msgSend((id)objc_msgSend(a5, "photo"), "pl_managedAsset");
          if ((a3 & 2) != 0) {
            goto LABEL_60;
          }
        }
        uint64_t v25 = 0;
        if (!v54 || *((unsigned char *)v66 + 24)) {
          goto LABEL_63;
        }
        goto LABEL_61;
      }
    }
    else
    {
      v22 = 0;
    }
LABEL_82:

    goto LABEL_83;
  }
  if (a5)
  {
    int v27 = 0;
    if (v54)
    {
      if ((a3 & 2) != 0)
      {
        int v27 = (void *)[a5 _newOriginalImageForPickerFromCachedData];
        if (v27)
        {
          [v16 setObject:v27 forKey:*MEMORY[0x1E4F439A0]];

          *((unsigned char *)v70 + 24) = 1;
        }
      }
    }
    uint64_t v28 = 0;
    if (v54 && (a3 & 4) != 0)
    {
      if (![a7 objectForKey:*MEMORY[0x1E4F8CB18]])
      {
        a6 = objc_msgSend((id)objc_msgSend(a5, "photo"), "pl_managedAsset");
        uint64_t v28 = 0;
        if (!a6) {
          goto LABEL_83;
        }
LABEL_28:
        BOOL v30 = (a3 & 2) == 0 || v27 != 0;
        BOOL v32 = (a3 & 4) == 0 || v28 != 0;
        if (!v54 || !v30 || !v32) {
          goto LABEL_45;
        }
        goto LABEL_83;
      }
      [a5 _imageOrientation];
      uint64_t v28 = (void *)CreateImageDataFromJPEGDataAndOrientation();
      [v16 setObject:v28 forKey:*MEMORY[0x1E4F44070]];

      *((unsigned char *)v66 + 24) = 1;
    }
    if (!a6) {
      goto LABEL_83;
    }
    goto LABEL_28;
  }
  if (a6)
  {
LABEL_45:
    uint64_t v33 = (void *)[MEMORY[0x1E4F8A6A0] sharedAssetsSaver];
    uint64_t v34 = [a6 objectID];
    uint64_t v35 = objc_msgSend(v33, "requestSynchronousImageForAssetOID:withFormat:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageDataInfo:outCPLDownloadContext:", v34, objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F8B918], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID"), 1, v54 == 0, 0, 0, &v64, 0);
    ((void (*)(void *, uint64_t, id, void))v56)(v55, v35, v64, 0);
  }
LABEL_83:
  uint64_t v45 = [a6 fileExtension];
  if ([v64 UTI])
  {
    uint64_t v46 = objc_msgSend(MEMORY[0x1E4F8A950], "preferredFileExtensionForType:", objc_msgSend(v64, "UTI"));
    if ([v46 compare:v45 options:1]) {
      uint64_t v45 = (uint64_t)v46;
    }
  }
  if (a6)
  {
    uint64_t v47 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F8AA78], "systemPhotoLibrary"), "assetURLForPhoto:extension:", a6, v45);
    if (v47) {
      [v16 setObject:v47 forKey:*MEMORY[0x1E4F439B0]];
    }
  }
  uint64_t v48 = [a7 objectForKey:*MEMORY[0x1E4F8CB10]];
  if (v48) {
    [v16 setObject:v48 forKey:*MEMORY[0x1E4F43988]];
  }
  uint64_t v49 = *MEMORY[0x1E4F44068];
  uint64_t v50 = [a7 objectForKey:*MEMORY[0x1E4F44068]];
  if (v50) {
    [v16 setObject:v50 forKey:v49];
  }
  if (v18) {
    [v16 setObject:v18 forKey:v52];
  }
  _AddDebugInfo((uint64_t)v16, a3, a6);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  return v16;
}

void sub_1BEEAD6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

uint64_t CreateImageDataFromJPEGDataAndOrientation()
{
  uint64_t v0 = PLExifOrientationFromImageOrientation();
  id v1 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v2 = [NSNumber numberWithInt:v0];
  uint64_t v3 = objc_msgSend(v1, "initWithObjectsAndKeys:", v2, *MEMORY[0x1E4F2FCA0], 0);
  uint64_t EXIFJPEGData = CGImageCreateEXIFJPEGData();

  return EXIFJPEGData;
}

uint64_t _AddDebugInfo(uint64_t result, char a2, void *a3)
{
  if ((a2 & 8) != 0)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = 0;
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "photoLibrary"), "assetsdClient"), "debugClient"), "debugSidecarFileURLsForAsset:debugSidecarFileURLs:error:", a3, &v4, 0);
    return [v3 setObject:v4 forKeyedSubscript:@"_UIImagePickerDebugSidecarFileURLs"];
  }
  return result;
}

void PLNotifyImagePickerOfVideoAvailability(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id InfoForVideo = __CreateInfoForVideo(a1, a2, a3, a4);
  if (a3) {
    _PLIncrementSharedCountForAsset(a3);
  }
  [a1 _imagePickerDidCompleteWithInfo:InfoForVideo];
}

void *__CreateInfoForVideo(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  char v7 = [a1 _imagePickerSavingOptions];
  if (a3) {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "photoLibrary"), "assetURLForPhoto:", a3);
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = [(id)*MEMORY[0x1E4F44448] identifier];
  uint64_t v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, *MEMORY[0x1E4F43990], 0);
  if (a3)
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "pl_PHAssetFromPhotoLibrary:", PLNavigationControllerInterfacePhotoLibrary(objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "photoLibrary"), "pathManager"), "libraryURL"))), "localIdentifier");
    if (v12) {
      [v11 setObject:v12 forKey:@"_UIImagePickerControllerPHAssetLocalIdentifier"];
    }
  }
  if (a2) {
    [v11 setObject:a2 forKey:*MEMORY[0x1E4F43998]];
  }
  if (v8) {
    [v11 setObject:v8 forKey:*MEMORY[0x1E4F439B0]];
  }
  if (a4) {
    [v11 addEntriesFromDictionary:a4];
  }
  _AddDebugInfo((uint64_t)v11, v7, a3);
  return v11;
}

uint64_t PLNotifyImagePickerOfMultipleMediaAvailability(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(a2);
        }
        int v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "pl_managedAsset");
        if ([v13 isVideo])
        {
          uint64_t v14 = [v13 pathForVideoFile];
          if (v14) {
            uint64_t v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];
          }
          else {
            uint64_t v15 = 0;
          }
          id InfoForVideo = __CreateInfoForVideo(a1, v15, v13, 0);
        }
        else
        {
          id InfoForVideo = __CreateInfoForImage(a1, 0, v13, a3, a4);
        }
        uint64_t v17 = InfoForVideo;
        if (v8) {
          [v8 addObject:InfoForVideo];
        }
      }
      uint64_t v10 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v10);
  }
  uint64_t v18 = objc_msgSend((id)objc_msgSend(a2, "firstObject"), "photoLibrary");
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = ___PLIncrementSharedCountForAssets_block_invoke;
  v24[3] = &unk_1E63D2660;
  v24[4] = a2;
  [v18 performChanges:v24 completionHandler:0];
  return [a1 _imagePickerDidCompleteWithInfoArray:v8];
}

void PLNotifyImagePickerOfMediaAvailability(void *a1, void *a2, void *a3, void *a4, int a5)
{
  if ([a3 isVideo])
  {
    uint64_t v10 = [a3 pathForVideoFile];
    if (v10) {
      uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0];
    }
    else {
      uint64_t v11 = 0;
    }
    PLNotifyImagePickerOfVideoAvailability(a1, v11, a3, 0);
  }
  else
  {
    PLNotifyImagePickerOfImageAvailability(a1, a2, a3, a4, a5);
  }
}

id PLPhotoPickerDictionaryFromVideo(uint64_t a1, void *a2, uint64_t a3)
{
  Log = PLPhotoPickerGetLog();
  os_signpost_id_t v7 = os_signpost_id_generate(Log);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEE94000, Log, OS_SIGNPOST_INTERVAL_BEGIN, v7, "CreateVideoDictionary", (const char *)&unk_1BEEDBE46, buf, 2u);
  }
  id InfoForVideo = __CreateInfoForVideo(0, a1, a2, a3);
  if (a2) {
    _PLIncrementSharedCountForAsset(a2);
  }
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEE94000, Log, OS_SIGNPOST_INTERVAL_END, v7, "CreateVideoDictionary", (const char *)&unk_1BEEDBE46, v10, 2u);
  }

  return InfoForVideo;
}

id PLPhotoPickerDictionaryFromImage(void *a1, void *a2, void *a3, void *a4, int a5)
{
  Log = PLPhotoPickerGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(Log);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEE94000, Log, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CreateImageDictionary", (const char *)&unk_1BEEDBE46, buf, 2u);
  }
  uint64_t v11 = (void *)[a1 objectForKey:@"_UIImagePickerSavingOptions"];
  if (!v11)
  {
    long long v20 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary *PLPhotoPickerDictionaryFromImage(NSDictionary *, PLPhotoTileViewController *, PLManagedAsset *, NSDictionary *, BOOL)"), @"PLNavigationControllerInterface.m", 566, @"PLPhotoPickerDictionaryFromImage - UIImagePickerSavingOptions may not be nil");
  }
  char v12 = [v11 integerValue];
  int v13 = (void *)[a1 objectForKey:@"_UIImagePickerControllerSourceType"];
  if (!v13)
  {
    long long v21 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary *PLPhotoPickerDictionaryFromImage(NSDictionary *, PLPhotoTileViewController *, PLManagedAsset *, NSDictionary *, BOOL)"), @"PLNavigationControllerInterface.m", 570, @"PLPhotoPickerDictionaryFromImage - UIImagePickerControllerSourceType may not be nil");
  }
  uint64_t v14 = [v13 integerValue];
  uint64_t v15 = (void *)[a1 objectForKey:*MEMORY[0x1E4F44080]];
  if (!v15)
  {
    long long v22 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary *PLPhotoPickerDictionaryFromImage(NSDictionary *, PLPhotoTileViewController *, PLManagedAsset *, NSDictionary *, BOOL)"), @"PLNavigationControllerInterface.m", 574, @"PLPhotoPickerDictionaryFromImage - _UIImagePickerControllerReviewCapturedItem may not be nil");
  }
  uint64_t v16 = [v15 integerValue];
  uint64_t v17 = (void *)[a1 objectForKey:*MEMORY[0x1E4F44088]];
  if (!v17)
  {
    long long v23 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary *PLPhotoPickerDictionaryFromImage(NSDictionary *, PLPhotoTileViewController *, PLManagedAsset *, NSDictionary *, BOOL)"), @"PLNavigationControllerInterface.m", 578, @"PLPhotoPickerDictionaryFromImage - _UIImagePickerControllerShowCameraControls may not be nil");
  }
  id InfoForImageWithProperties = __CreateInfoForImageWithProperties(v14, [v17 integerValue] != 0, v12, v16 != 0, a2, a3, a4, a5);
  if (a3) {
    _PLIncrementSharedCountForAsset(a3);
  }
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)uint64_t v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEE94000, Log, OS_SIGNPOST_INTERVAL_END, v10, "CreateImageDictionary", (const char *)&unk_1BEEDBE46, v25, 2u);
  }

  return InfoForImageWithProperties;
}

id PLPhotoPickerDictionaryFromMedia(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  Log = PLPhotoPickerGetLog();
  os_signpost_id_t v13 = os_signpost_id_generate(Log);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEE94000, Log, OS_SIGNPOST_INTERVAL_BEGIN, v13, "CreateMediaDictionary", (const char *)&unk_1BEEDBE46, buf, 2u);
  }
  if ([a3 isVideo])
  {
    uint64_t v14 = [a3 pathForVideoFile];
    if (v14) {
      uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];
    }
    id v15 = PLPhotoPickerDictionaryFromVideo(v14, a3, 0);
  }
  else
  {
    id v15 = PLPhotoPickerDictionaryFromImage(a1, a2, a3, a4, a5);
  }
  id v16 = v15;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    *(_WORD *)uint64_t v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEE94000, Log, OS_SIGNPOST_INTERVAL_END, v13, "CreateMediaDictionary", (const char *)&unk_1BEEDBE46, v18, 2u);
  }

  if ([a6 count])
  {
    id v16 = (id)[v16 mutableCopy];
    [v16 addEntriesFromDictionary:a6];
  }
  return v16;
}

void *PLPhotoPickerDictionariesFromMultipleMediaItems(void *a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  Log = PLPhotoPickerGetLog();
  os_signpost_id_t v11 = os_signpost_id_generate(Log);
  unint64_t v20 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    LODWORD(buf) = 134349056;
    *(void *)((char *)&buf + 4) = [a2 count];
    _os_signpost_emit_with_name_impl(&dword_1BEE94000, Log, OS_SIGNPOST_INTERVAL_BEGIN, v11, "CreateMultipleMediaDictionary", "%{public}ld", (uint8_t *)&buf, 0xCu);
  }
  char v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count", v11));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = [a2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(a2);
        }
        objc_msgSend(v12, "addObject:", PLPhotoPickerDictionaryFromMedia(a1, 0, objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16++), "pl_managedAsset"), a3, a4, a5));
      }
      while (v14 != v16);
      uint64_t v14 = [a2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a2, "firstObject"), "photoLibrary");
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  int v27 = ___PLIncrementSharedCountForAssets_block_invoke;
  uint64_t v28 = &unk_1E63D2660;
  IOSurfaceRef v29 = a2;
  [v17 performChanges:&buf completionHandler:0];
  if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(Log))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BEE94000, Log, OS_SIGNPOST_INTERVAL_END, spid, "CreateMultipleMediaDictionary", (const char *)&unk_1BEEDBE46, (uint8_t *)&buf, 2u);
  }

  return v12;
}

uint64_t __ShouldZoomToFill(uint64_t a1, double a2, double a3)
{
  BOOL v6 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if ([(id)a1 _clientIsWallpaper])
  {
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
      && (PLIsTallScreen() & 1) == 0)
    {
      return *(unsigned char *)(a1 + 1136) != 0;
    }
    return 1;
  }
  if (!*(void *)(a1 + 1144)) {
    return *(char *)(a1 + 1345) >= 0;
  }
  return vabdd_f64(1.0, a2 / a3) < dbl_1BEED89A0[v6];
}

void sub_1BEEB0DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BEEB1F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PLMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(uint64_t a1)
{
  uint64_t v6 = 0;
  os_signpost_id_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_ptr;
  uint64_t v9 = getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_ptr;
  if (!getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_block_invoke;
    v5[3] = &unk_1E63D24C8;
    v5[4] = &v6;
    __getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_block_invoke(v5);
    uint64_t v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2) {
    return v2(a1);
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t result = objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void PLMRMediaRemoteSetNowPlayingApplicationOverrideEnabled(Boolean)"), @"PLPhotosApplication.m", 68, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_1BEEB6618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __MediaRemoteLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E63D2248;
    uint64_t v8 = 0;
    MediaRemoteLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v2 = (void *)MediaRemoteLibraryCore_frameworkLibrary;
  if (!MediaRemoteLibraryCore_frameworkLibrary)
  {
    a1 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"void *MediaRemoteLibrary(void)"];
    uint64_t v3 = objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v5, @"PLPhotosApplication.m", 67, @"%s", v6[0]);
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v3 = v6[0];
  if (v6[0]) {
LABEL_7:
  }
    free(v3);
  uint64_t result = dlsym(v2, "MRMediaRemoteSetNowPlayingApplicationOverrideEnabled");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getMRMediaRemoteSetNowPlayingApplicationOverrideEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __MediaRemoteLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaRemoteLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t myUncaughtExceptionHandler(void *a1)
{
  uint64_t v2 = (void *)[a1 userInfo];
  uint64_t result = [v2 objectForKey:*MEMORY[0x1E4F28A50]];
  if (result) {
    uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F8AA78], "systemPhotoLibrary"), "handlePossibleCoreDataError:", result);
  }
  uint64_t v4 = (uint64_t (*)(void *))originalUncaughtExceptionHandler;
  if (originalUncaughtExceptionHandler)
  {
    return v4(a1);
  }
  return result;
}

uint64_t pl_appPhotoLibrary()
{
  uint64_t v0 = objc_opt_class();
  if (!v0
    || (id v1 = (void *)v0, (objc_opt_respondsToSelector() & 1) == 0)
    || (uint64_t result = objc_msgSend(v1, "px_deprecated_appPhotoLibrary")) == 0
    && ((objc_opt_respondsToSelector() & 1) == 0 || (uint64_t result = objc_msgSend(v1, "px_systemPhotoLibrary")) == 0))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F39228];
    return [v3 sharedPhotoLibrary];
  }
  return result;
}

void sub_1BEEB998C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2510(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2511(uint64_t a1)
{
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  ManagedConfigurationLibrary();
  Class result = objc_getClass("MCProfileConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke"), @"PLPublishingAgent.m", 40, @"Unable to find class %s", "MCProfileConnection");
    __break(1u);
  }
  return result;
}

void *__getMCFeatureCellularHDUploadsAllowedSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = ManagedConfigurationLibrary();
  Class result = dlsym(v2, "MCFeatureCellularHDUploadsAllowed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *ManagedConfigurationLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E63D22E0;
    uint64_t v6 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *ManagedConfigurationLibrary(void)"];
    id v1 = objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLPublishingAgent.m", 39, @"%s", v4[0]);
    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BEEBAB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__2694(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2695(uint64_t a1)
{
}

IOSurfaceRef createDecodeSurfaceFromPool(uint64_t a1, int a2, unsigned int a3, unsigned int a4)
{
  IOSurfaceRef v8 = 0;
  int v4 = FigJPEGIOSurfaceImagePoolCreateIOSurface(a1, a2, a3, a4, 1, 0x10uLL, 0x10uLL, 1, 0, &v8);
  if (v4 && gPLTiledLayerTrace)
  {
    int v5 = v4;
    uint64_t v6 = (FILE **)MEMORY[0x1E4F143C8];
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "Error in %s: ", "createDecodeSurfaceFromPool");
    fprintf(*v6, "FigJPEGIOSurfaceImagePoolCreateIOSurface: error: %d", v5);
    fputc(10, *v6);
  }
  return v8;
}

void sub_1BEEBF0A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void *AccelerateLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AccelerateLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __AccelerateLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E63D2550;
    uint64_t v6 = 0;
    AccelerateLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)AccelerateLibraryCore_frameworkLibrary;
  if (!AccelerateLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *AccelerateLibrary(void)"];
    uint64_t v1 = objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLTiledLayer.m", 77, @"%s", v4[0]);
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __AccelerateLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccelerateLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t getMTLTextureDescriptorClass()
{
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__3051;
  uint64_t v7 = __Block_byref_object_dispose__3052;
  uint64_t v0 = getMTLTextureDescriptorClass_softClass;
  uint64_t v8 = getMTLTextureDescriptorClass_softClass;
  if (!getMTLTextureDescriptorClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getMTLTextureDescriptorClass_block_invoke;
    v2[3] = &unk_1E63D24C8;
    v2[4] = &v3;
    __getMTLTextureDescriptorClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BEEBF634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__3051(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__3052(uint64_t a1)
{
}

Class __getMTLTextureDescriptorClass_block_invoke(uint64_t a1)
{
  MetalLibrary();
  Class result = objc_getClass("MTLTextureDescriptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    getMTLTextureDescriptorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    Class result = (Class)objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getMTLTextureDescriptorClass(void)_block_invoke"), @"PLTiledLayer.m", 71, @"Unable to find class %s", "MTLTextureDescriptor");
    __break(1u);
  }
  return result;
}

void *MetalLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!MetalLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __MetalLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E63D24E8;
    uint64_t v6 = 0;
    MetalLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)MetalLibraryCore_frameworkLibrary;
  if (!MetalLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *MetalLibrary(void)"];
    uint64_t v1 = objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLTiledLayer.m", 70, @"%s", v4[0]);
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __MetalLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MetalLibraryCore_frameworkLibrary = result;
  return result;
}

BOOL getShowTilePreferences()
{
  CFStringRef v0 = (const __CFString *)CFPreferencesCopyAppValue(@"ajtiledlayer_show_tiles", @"com.apple.coremedia");
  if (v0)
  {
    CFStringRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFStringGetTypeID())
    {
      BOOL v3 = CFStringGetIntValue(v1) == 0;
    }
    else
    {
      CFTypeID v5 = CFGetTypeID(v1);
      if (v5 != CFNumberGetTypeID())
      {
        CFTypeID v7 = CFGetTypeID(v1);
        BOOL v4 = v7 == CFBooleanGetTypeID() && v1 == (const __CFString *)*MEMORY[0x1E4F1CFD0];
        goto LABEL_10;
      }
      int valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v1, kCFNumberIntType, &valuePtr);
      BOOL v3 = valuePtr == 0;
    }
    BOOL v4 = !v3;
LABEL_10:
    CFRelease(v1);
    return v4;
  }
  return 0;
}

void at_free(void *a1)
{
  if (a1) {
    free(a1);
  }
}

void *at_malloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xC28E03B4uLL);
}

void sub_1BEEC16D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void *__getMTLCreateSystemDefaultDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = MetalLibrary();
  uint64_t result = dlsym(v2, "MTLCreateSystemDefaultDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getMTLCreateSystemDefaultDeviceSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMPSImageConversionClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!MetalPerformanceShadersLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __MetalPerformanceShadersLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E63D2520;
    uint64_t v8 = 0;
    MetalPerformanceShadersLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MetalPerformanceShadersLibraryCore_frameworkLibrary)
  {
    BOOL v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *MetalPerformanceShadersLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PLTiledLayer.m", 74, @"%s", v6[0]);
    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MPSImageConversion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    CFTypeID v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getMPSImageConversionClass(void)_block_invoke"), @"PLTiledLayer.m", 75, @"Unable to find class %s", "MPSImageConversion");
LABEL_10:
    __break(1u);
  }
  getMPSImageConversionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t PL_ColorSyncProfileCreate(uint64_t a1)
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  CFTypeID v2 = (uint64_t (*)(uint64_t, void))getColorSyncProfileCreateSymbolLoc_ptr;
  uint64_t v9 = getColorSyncProfileCreateSymbolLoc_ptr;
  if (!getColorSyncProfileCreateSymbolLoc_ptr)
  {
    BOOL v3 = ColorSyncLibrary();
    v7[3] = (uint64_t)dlsym(v3, "ColorSyncProfileCreate");
    getColorSyncProfileCreateSymbolLoc_ptr = (_UNKNOWN *)v7[3];
    CFTypeID v2 = (uint64_t (*)(uint64_t, void))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (v2) {
    return v2(a1, 0);
  }
  CFTypeID v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t result = objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "ColorSyncProfileRef PL_ColorSyncProfileCreate(CFDataRef, CFErrorRef *)"), @"PLTiledLayer.m", 83, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_1BEEC1A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkColorSyncProfile()
{
  uint64_t v4 = 0;
  CFTypeID v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkColorSyncProfileSymbolLoc_ptr;
  uint64_t v7 = getkColorSyncProfileSymbolLoc_ptr;
  if (!getkColorSyncProfileSymbolLoc_ptr)
  {
    CFStringRef v1 = ColorSyncLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kColorSyncProfile");
    getkColorSyncProfileSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0) {
    return *(void *)v0;
  }
  BOOL v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getkColorSyncProfile(void)"), @"PLTiledLayer.m", 91, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_1BEEC1BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkColorSyncRenderingIntent()
{
  uint64_t v4 = 0;
  CFTypeID v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkColorSyncRenderingIntentSymbolLoc_ptr;
  uint64_t v7 = getkColorSyncRenderingIntentSymbolLoc_ptr;
  if (!getkColorSyncRenderingIntentSymbolLoc_ptr)
  {
    CFStringRef v1 = ColorSyncLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kColorSyncRenderingIntent");
    getkColorSyncRenderingIntentSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0) {
    return *(void *)v0;
  }
  BOOL v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getkColorSyncRenderingIntent(void)"), @"PLTiledLayer.m", 89, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_1BEEC1D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkColorSyncRenderingIntentPerceptual()
{
  uint64_t v4 = 0;
  CFTypeID v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr;
  uint64_t v7 = getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr;
  if (!getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr)
  {
    CFStringRef v1 = ColorSyncLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kColorSyncRenderingIntentPerceptual");
    getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0) {
    return *(void *)v0;
  }
  BOOL v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getkColorSyncRenderingIntentPerceptual(void)"), @"PLTiledLayer.m", 90, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_1BEEC1E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkColorSyncTransformTag()
{
  uint64_t v4 = 0;
  CFTypeID v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getkColorSyncTransformTagSymbolLoc_ptr;
  uint64_t v7 = getkColorSyncTransformTagSymbolLoc_ptr;
  if (!getkColorSyncTransformTagSymbolLoc_ptr)
  {
    CFStringRef v1 = ColorSyncLibrary();
    v5[3] = (uint64_t)dlsym(v1, "kColorSyncTransformTag");
    getkColorSyncTransformTagSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0) {
    return *(void *)v0;
  }
  BOOL v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t result = objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getkColorSyncTransformTag(void)"), @"PLTiledLayer.m", 85, @"%s", dlerror());
  __break(1u);
  return result;
}

void sub_1BEEC1F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkColorSyncTransformDeviceToPCSSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "kColorSyncTransformDeviceToPCS");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkColorSyncTransformDeviceToPCSSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *ColorSyncLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ColorSyncLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __ColorSyncLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E63D2538;
    uint64_t v6 = 0;
    ColorSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = (void *)ColorSyncLibraryCore_frameworkLibrary;
  if (!ColorSyncLibraryCore_frameworkLibrary)
  {
    uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *ColorSyncLibrary(void)"];
    CFStringRef v1 = objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLTiledLayer.m", 81, @"%s", v4[0]);
    __break(1u);
    goto LABEL_7;
  }
  CFStringRef v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *__getkColorSyncTransformPCSToDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "kColorSyncTransformPCSToDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkColorSyncTransformPCSToDeviceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getColorSyncTransformCreateSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "ColorSyncTransformCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getColorSyncTransformCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkColorSyncTransformFullConversionDataSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "kColorSyncTransformFullConversionData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkColorSyncTransformFullConversionDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getColorSyncTransformCopyPropertySymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "ColorSyncTransformCopyProperty");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getColorSyncTransformCopyPropertySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ColorSyncLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ColorSyncLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getkColorSyncTransformTagSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "kColorSyncTransformTag");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkColorSyncTransformTagSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkColorSyncRenderingIntentPerceptualSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "kColorSyncRenderingIntentPerceptual");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkColorSyncRenderingIntentPerceptualSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkColorSyncRenderingIntentSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "kColorSyncRenderingIntent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkColorSyncRenderingIntentSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkColorSyncProfileSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "kColorSyncProfile");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkColorSyncProfileSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getColorSyncProfileCreateSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = ColorSyncLibrary();
  uint64_t result = dlsym(v2, "ColorSyncProfileCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getColorSyncProfileCreateSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MetalPerformanceShadersLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MetalPerformanceShadersLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1BEEC6D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t AVAssetExportPresetForRemakerMode(int a1)
{
  switch(a1)
  {
    case 0:
    case 2:
      CFStringRef v1 = (uint64_t *)MEMORY[0x1E4F15738];
      goto LABEL_11;
    case 1:
      CFStringRef v1 = (uint64_t *)MEMORY[0x1E4F15758];
      goto LABEL_11;
    case 3:
      CFStringRef v1 = (uint64_t *)MEMORY[0x1E4F15730];
      goto LABEL_11;
    case 4:
      CFStringRef v1 = (uint64_t *)MEMORY[0x1E4F15778];
      goto LABEL_11;
    case 5:
      CFStringRef v1 = (uint64_t *)MEMORY[0x1E4F15780];
      goto LABEL_11;
    case 6:
      CFStringRef v1 = (uint64_t *)MEMORY[0x1E4F156D0];
      goto LABEL_11;
    case 7:
      CFStringRef v1 = (uint64_t *)MEMORY[0x1E4F15740];
      goto LABEL_11;
    case 8:
      CFStringRef v1 = (uint64_t *)MEMORY[0x1E4F15728];
LABEL_11:
      uint64_t result = *v1;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

void sub_1BEEC74BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PLVideoRemakerModeForAVAssetExportPreset(const void *a1)
{
  pl_dispatch_once();
  LODWORD(value) = 0;
  if (CFDictionaryGetValueIfPresent((CFDictionaryRef)PLVideoRemakerModeForAVAssetExportPreset___map, a1, (const void **)&value))
  {
    return value;
  }
  else
  {
    return 7;
  }
}

void __PLVideoRemakerModeForAVAssetExportPreset_block_invoke()
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D048], 0);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F15758], (const void *)1);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F15738], (const void *)2);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F15730], (const void *)3);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F15778], (const void *)4);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F15780], (const void *)5);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F156D0], (const void *)6);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F15740], (const void *)7);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F15728], (const void *)8);
  PLVideoRemakerModeForAVAssetExportPreset___map = (uint64_t)Mutable;
}

void sub_1BEEC8738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEECC790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEECE7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__4168(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__4169(uint64_t a1)
{
}

uint64_t _SetBundlePropertiesOnPropertiesDictionary(void *a1)
{
  CFTypeID v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if ([v2 length]) {
    [a1 setObject:v2 forKey:*MEMORY[0x1E4F8C880]];
  }
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "localizedInfoDictionary"), "objectForKey:", *MEMORY[0x1E4F1CC48]);
  uint64_t result = [v3 length];
  if (result)
  {
    uint64_t v5 = *MEMORY[0x1E4F8C878];
    return [a1 setObject:v3 forKey:v5];
  }
  return result;
}

uint64_t PLSaveImageToCameraRoll(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)pl_appPhotoLibrary();
  return [v8 legacySaveImageToCameraRoll:a1 completionTarget:a2 completionSelector:a3 contextInfo:a4];
}

uint64_t PLSaveImageDataToCameraRoll(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)pl_appPhotoLibrary();
  return [v8 legacySaveImageDataToCameraRoll:a1 completionTarget:a2 completionSelector:a3 contextInfo:a4];
}

uint64_t PLSaveImageToCameraRollWithTypeAndExtension(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  os_signpost_id_t v10 = (void *)pl_appPhotoLibrary();
  return [v10 legacySaveScreenshotToCameraRoll:a1 completionTarget:a4 completionSelector:a5 contextInfo:a6];
}

uint64_t PLSaveVideoToCameraRoll(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)pl_appPhotoLibrary();
  return [v8 legacySaveVideoToCameraRoll:a1 completionTarget:a2 completionSelector:a3 contextInfo:a4];
}

uint64_t PLCanSaveVideoToCameraRoll(uint64_t a1)
{
  return [MEMORY[0x1E4F8AA78] canSaveVideoToLibrary:a1];
}

void PLCleanupForStoreDemoMode()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F8B968]);
  Log = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_DEFAULT, "Requesting cleanupForStoreDemoMode", buf, 2u);
  }
  CFTypeID v2 = (void *)[v0 demoClient];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __PLCleanupForStoreDemoMode_block_invoke;
  v4[3] = &unk_1E63D2908;
  v4[4] = v0;
  [v2 cleanupForStoreDemoModeWithCompletion:v4];
  uint64_t v3 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1BEE94000, v3, OS_LOG_TYPE_DEBUG, "Sent cleanupForStoreDemoMode", buf, 2u);
  }
}

id __PLCleanupForStoreDemoMode_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  Log = PLStoreDemoModeGetLog();
  uint64_t v7 = Log;
  if (a2)
  {
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      uint64_t v8 = "Completed cleanupForStoreDemoMode successfully";
      uint64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl(&dword_1BEE94000, v9, v10, v8, (uint8_t *)&v13, v11);
    }
  }
  else if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138543362;
    uint64_t v14 = a3;
    uint64_t v8 = "Failed to perform cleanupForStoreDemoMode: %{public}@";
    uint64_t v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 12;
    goto LABEL_6;
  }
  return *(id *)(a1 + 32);
}

CGFloat PLIntegralRect(CGFloat a1, CGFloat a2, double a3, double a4)
{
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat rect = *MEMORY[0x1E4F1DB28];
  CGFloat v9 = round(a3);
  CGFloat v10 = round(a4);
  double MidX = CGRectGetMidX(*(CGRect *)&a1);
  v15.origin.x = rect;
  v15.origin.y = v8;
  v15.size.width = v9;
  v15.size.height = v10;
  CGFloat v12 = round(MidX + CGRectGetWidth(v15) * -0.5);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  CGRectGetMidY(v16);
  v17.origin.x = v12;
  v17.origin.y = v8;
  v17.size.width = v9;
  v17.size.height = v10;
  CGRectGetHeight(v17);
  return v12;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1F40F4D10](retstr, m);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x1F40D8548](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1F40D97B0](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97C8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x1F40D9948](options, a2, *(void *)&a3, *(void *)&a4);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return (CFDataRef)MEMORY[0x1F40D9A98](space);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x1F40D9AC0](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1F40D9B78]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9C50](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
}

void CGContextEOClip(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

uint64_t CGContextGetBaseCTM()
{
  return MEMORY[0x1F40D9F58]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x1F40DA0D8]();
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithURL(CFURLRef url)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA320](url);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

uint64_t CGImageCreateEXIFJPEGData()
{
  return MEMORY[0x1F40E96D0]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageRef CGImageCreateWithPNGDataProvider(CGDataProviderRef source, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA8B8](source, decode, shouldInterpolate, *(void *)&intent);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x1F40DB178](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1F40DC0D0](retstr, time, *(void *)&newTimescale, *(void *)&method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

uint64_t FigAtomicIncrement32()
{
  return MEMORY[0x1F40DC5A8]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x1F40DD8C8]();
}

uint64_t FigNanosecondsToHostTime()
{
  return MEMORY[0x1F40DDCC8]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x1F40DE328]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x1F40DE340]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x1F40DE350]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x1F40DE360]();
}

uint64_t FigThreadGetMaxLogicalCoreCount()
{
  return MEMORY[0x1F40DE5C8]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x1F40DE5F0]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40E9380](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E93A8](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1F40E93B8](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9480](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9488](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9530](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MPTVOutCapabledAndPreferred()
{
  return MEMORY[0x1F40ED0A0]();
}

uint64_t MPTVOutScreen()
{
  return MEMORY[0x1F40ED0A8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSUncaughtExceptionHandler *NSGetUncaughtExceptionHandler(void)
{
  return (NSUncaughtExceptionHandler *)MEMORY[0x1F40E70E0]();
}

void NSLog(NSString *format, ...)
{
}

void NSSetUncaughtExceptionHandler(NSUncaughtExceptionHandler *a1)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x1F413F390]();
}

uint64_t PHFullScreenSizeForScreen()
{
  return MEMORY[0x1F40F47B0]();
}

uint64_t PLBackendGetLog()
{
  return MEMORY[0x1F413FB40]();
}

uint64_t PLCreateCGImageFromIOSurface()
{
  return MEMORY[0x1F413FC18]();
}

uint64_t PLCreateCGImageFromIOSurfaceBackedUIImage()
{
  return MEMORY[0x1F413FC20]();
}

uint64_t PLCreateCroppedImageFromImage()
{
  return MEMORY[0x1F413FC28]();
}

uint64_t PLCreateImageFromDataWithFormat()
{
  return MEMORY[0x1F413F4B0]();
}

uint64_t PLDebugEnableCoreDataMultithreadedAsserts()
{
  return MEMORY[0x1F413FCA8]();
}

uint64_t PLDeviceOrientationFromImageOrientation()
{
  return MEMORY[0x1F413FCC0]();
}

uint64_t PLExifOrientationFromImageOrientation()
{
  return MEMORY[0x1F413FD20]();
}

uint64_t PLGetOrientationAndUntransformedSizeFromImageData()
{
  return MEMORY[0x1F413F530]();
}

uint64_t PLGetPhotoLibraryClient()
{
  return MEMORY[0x1F413F540]();
}

uint64_t PLHasInternalUI()
{
  return MEMORY[0x1F413FD90]();
}

uint64_t PLImageOrientationFromExifOrientation()
{
  return MEMORY[0x1F413FDB8]();
}

uint64_t PLImageSizeFromImageData()
{
  return MEMORY[0x1F413F550]();
}

uint64_t PLIsAssetsd()
{
  return MEMORY[0x1F413FE00]();
}

uint64_t PLIsCamera()
{
  return MEMORY[0x1F413FE10]();
}

uint64_t PLIsTallScreen()
{
  return MEMORY[0x1F413FF68]();
}

uint64_t PLLocalizedFrameworkString()
{
  return MEMORY[0x1F413FFC8]();
}

uint64_t PLOrientationTransformImageSize()
{
  return MEMORY[0x1F413F690]();
}

uint64_t PLPhotoKitGetLog()
{
  return MEMORY[0x1F41400C0]();
}

uint64_t PLPhotoLibraryFrameworkBundle()
{
  return MEMORY[0x1F41400D0]();
}

uint64_t PLPhotoPickerGetLog()
{
  return MEMORY[0x1F41400E8]();
}

uint64_t PLPhotoSharingGetLog()
{
  return MEMORY[0x1F41400F0]();
}

uint64_t PLPhysicalScreenScale()
{
  return MEMORY[0x1F4140138]();
}

uint64_t PLPreviewImageAndDurationForVideoAtPath()
{
  return MEMORY[0x1F413F6D0]();
}

uint64_t PLRunningFromPhotosApplication()
{
  return MEMORY[0x1F413F788]();
}

uint64_t PLScaledCropRect()
{
  return MEMORY[0x1F413F7E0]();
}

uint64_t PLSetShouldCacheIOSurfaces()
{
  return MEMORY[0x1F413F890]();
}

uint64_t PLSetShouldLogImageDecodeTime()
{
  return MEMORY[0x1F413F898]();
}

uint64_t PLStoreDemoModeGetLog()
{
  return MEMORY[0x1F41403D8]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1F4102BD0]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1F4102C40]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1F4102C48]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1F4102C78](image, compressionQuality);
}

uint64_t UIImagePickerEnsureViewIsInsidePopover()
{
  return MEMORY[0x1F4102C88]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1F4102D60]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1F4102D68]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1F4102D78]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1F4102D88]();
}

void UIRectFill(CGRect rect)
{
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1F4102DB8]();
}

uint64_t UISystemFontBoldForSize()
{
  return MEMORY[0x1F4102E28]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

uint64_t _UIAccessibilityZoomTouchEnabled()
{
  return MEMORY[0x1F4102EA0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _signal_nobind()
{
  return MEMORY[0x1F40CA140]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t applejpeg_decode_build_index_table()
{
  return MEMORY[0x1F410A1A0]();
}

uint64_t applejpeg_decode_clone_session()
{
  return MEMORY[0x1F410A1B0]();
}

uint64_t applejpeg_decode_create()
{
  return MEMORY[0x1F410A1B8]();
}

uint64_t applejpeg_decode_destroy()
{
  return MEMORY[0x1F410A1C0]();
}

uint64_t applejpeg_decode_get_image_info()
{
  return MEMORY[0x1F410A1D8]();
}

uint64_t applejpeg_decode_image_all()
{
  return MEMORY[0x1F410A218]();
}

uint64_t applejpeg_decode_open_mem()
{
  return MEMORY[0x1F410A230]();
}

uint64_t applejpeg_decode_options_init()
{
  return MEMORY[0x1F410A238]();
}

uint64_t applejpeg_decode_set_options()
{
  return MEMORY[0x1F410A298]();
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x1F40DED58]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x1F40DED60]();
}

uint64_t fig_note_initialize_category_with_default_work()
{
  return MEMORY[0x1F40DED78]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1F40CC1E8](*(void *)&a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uint64_t imageDataFromImageWithFormat()
{
  return MEMORY[0x1F413F910]();
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pl_dispatch_after()
{
  return MEMORY[0x1F41405A0]();
}

uint64_t pl_dispatch_async()
{
  return MEMORY[0x1F41405A8]();
}

uint64_t pl_dispatch_once()
{
  return MEMORY[0x1F41405D0]();
}

uint64_t pl_dispatch_source_set_event_handler()
{
  return MEMORY[0x1F41405E8]();
}

uint64_t pl_dispatch_sync()
{
  return MEMORY[0x1F41405F0]();
}

uint64_t pl_notify_register_dispatch()
{
  return MEMORY[0x1F4140600]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

void srandomdev(void)
{
}