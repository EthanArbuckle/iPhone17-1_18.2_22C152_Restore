void sub_25C11D0EC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_25C11E02C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25C11E1E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25C11EBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25C11ED94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25C11F4B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_25C11F7D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25C11FDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  v20 = v18;
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v19 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_25C11FFB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

__CFString *descriptionFromErrorCode(uint64_t a1)
{
  if (a1 >= 4096)
  {
    if (os_variant_has_internal_content())
    {
      if (a1 >= 12288)
      {
        switch(a1)
        {
          case 12288:
            result = @"Writer Not Monitoring";
            break;
          case 12289:
            result = @"Writer Not Authorized";
            break;
          case 12290:
            result = @"Writer Input was invalid";
            break;
          case 12291:
            result = @"No available memory mapped to write sample";
            break;
          case 12292:
            result = @"Provided sample is out of order from previous samples";
            break;
          case 12293:
            result = @"Provided sample is too large";
            break;
          case 12294:
            result = @"Framework datastore state is invalid";
            break;
          case 12295:
            result = @"Writer does not have explicit authorization";
            break;
          case 12296:
            result = @"Provided sample is from the future";
            break;
          default:
            if ((unint64_t)(a1 - 20480) < 5 || a1 != 0x4000) {
              return 0;
            }
            result = @"Sensor Configuration is invalid";
            break;
        }
        return result;
      }
      if (a1 >= 0x2000)
      {
        switch(a1)
        {
          case 8192:
            result = @"No space available to write samples";
            break;
          case 8193:
            result = @"Connection Not Found";
            break;
          case 8194:
            result = @"Internal Error";
            break;
          case 8195:
            result = @"Prompt Busy";
            break;
          case 8196:
            result = @"Prompt is cancelled";
            break;
          case 8198:
            result = @"No device identifier could be found";
            break;
          case 8199:
            result = @"Time synchronization state is invalid";
            break;
          case 8200:
            result = @"The requested bundle authorization is being requested for could not be found";
            break;
          case 8201:
            result = @"No new authorization groups were requested";
            break;
          default:
            return 0;
        }
        return result;
      }
      switch(a1)
      {
        case 4096:
          return @"Required app is not installed";
        case 4097:
          return @"Required onboarding not completed";
        case 4098:
          return @"Global setting not enabled";
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 0:
      v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v4 = @"SRErrorInvalidEntitlement";
      break;
    case 1:
      v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v4 = @"SRErrorNoAuthorization";
      break;
    case 2:
      v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v4 = @"SRErrorDataInaccessible";
      break;
    case 3:
      v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v4 = @"SRErrorFetchRequestInvalid";
      break;
    case 4:
      v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v4 = @"SRErrorPromptDeclined";
      break;
    default:
      return 0;
  }

  return (__CFString *)[v3 localizedStringForKey:v4 value:&stru_270985B88 table:0];
}

uint64_t recoverySuggestionFromErrorCode(uint64_t a1)
{
  if (a1 == 1)
  {
    v1 = @"SRErrorNoAuthorizationRecovery";
  }
  else
  {
    if (a1 != 2) {
      return 0;
    }
    v1 = @"SRErrorDataInaccessibleRecovery";
  }
  uint64_t v2 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return [v2 localizedStringForKey:v1 value:&stru_270985B88 table:0];
}

void sub_25C121D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(v24);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_25C121F48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C1223B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25C12285C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_25C1229B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_25C122D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25C122E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25C123050(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C12310C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C1231C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C1232F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C123380(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C1237C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

SRAbsoluteTime SRAbsoluteTimeGetCurrent(void)
{
  uint64_t v0 = mach_continuous_time();

  return SRAbsoluteTimeFromContinuousTime(v0);
}

SRAbsoluteTime SRAbsoluteTimeFromContinuousTime(uint64_t cont)
{
  if (_syncToken != -1) {
    dispatch_once(&_syncToken, &__block_literal_global_2);
  }
  if (_contStart >= cont) {
    double v2 = -1.0;
  }
  else {
    double v2 = 1.0;
  }
  double v3 = *(double *)&_rtcStart + *(double *)&_remoteRTCOffset;
  TMConvertTicksToSeconds();
  return v3 + v4 * v2;
}

uint64_t __SRAbsoluteTimeFromContinuousTime_block_invoke()
{
  uint64_t v0 = mach_continuous_time();
  _rtcStart = MEMORY[0x26117EC60]();
  uint64_t result = mach_continuous_time();
  _contStart = v0 + ((result - v0) >> 1);
  return result;
}

uint64_t SRAbsoluteTimeGetOffsets(uint64_t result, void *a2)
{
  if (result)
  {
    double v3 = (double *)result;
    double v4 = *(double *)&_rtcStart;
    uint64_t result = TMConvertTicksToSeconds();
    double *v3 = v4 - v5;
  }
  if (a2)
  {
    uint64_t result = mach_get_times();
    *a2 = 0;
  }
  return result;
}

CFAbsoluteTime SRAbsoluteTimeToCFAbsoluteTime(SRAbsoluteTime sr)
{
  return (double)0 / 1000000000.0 + (double)0 - *MEMORY[0x263EFFAF8] - SRAbsoluteTimeFromContinuousTime(0) + sr;
}

SRAbsoluteTime SRAbsoluteTimeFromCFAbsoluteTime(CFAbsoluteTime cf)
{
  mach_get_times();
  double v2 = (double)0 / 1000000000.0 + (double)0 - *MEMORY[0x263EFFAF8];
  return cf - (v2 - SRAbsoluteTimeFromContinuousTime(0));
}

BOOL SRAbsoluteTimeSetSyntheticStartFromRemoteTime(unint64_t a1, unint64_t a2, double a3, uint64_t a4, double *a5)
{
  mach_get_times();
  double v9 = 1.0;
  if (a2 >= a1) {
    double v10 = 1.0;
  }
  else {
    double v10 = -1.0;
  }
  TMConvertTicksToSeconds();
  double v12 = v11 + a3;
  TMConvertTicksToSeconds();
  double v14 = v12 + v10 * v13;
  TMConvertTicksToSeconds();
  double v16 = v14 - v15;
  TMConvertTicksToSeconds();
  double v18 = v16 + v17;
  if (a1 <= _contStart) {
    double v9 = -1.0;
  }
  double v19 = *(double *)&_rtcStart;
  TMConvertTicksToSeconds();
  double v21 = v19 + v20 * v9;
  double v22 = v18 - v21;
  double v23 = v21 + v18 - v21;
  if (v23 > 0.0)
  {
    _remoteRTCOffset = *(void *)&v22;
    if (a5) {
      *a5 = v22;
    }
  }
  return v23 > 0.0;
}

void SRAbsoluteTimeInitWithRemoteRTCOffset(double a1)
{
  _remoteRTCOffset = *(void *)&a1;
}

double SRAbsoluteTimeRoundedDownToNearestInterval(SRAbsoluteTime a1, double a2)
{
  if (a2 == 0.0) {
    double v2 = 1.0;
  }
  else {
    double v2 = a2;
  }
  double v3 = v2 * floor(SRAbsoluteTimeToCFAbsoluteTime(a1) / v2);

  return SRAbsoluteTimeFromCFAbsoluteTime(v3);
}

void sub_25C1246AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25C1256F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,os_activity_scope_state_s state)
{
}

void sub_25C125D60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C125DE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C125E98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C125F18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_25C126FD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void SRRegisterForDarwinNotification(void *a1, int *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v6 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543362;
    double v12 = a1;
    _os_log_debug_impl(&dword_25C11B000, v6, OS_LOG_TYPE_DEBUG, "Registering for darwin notification on %{public}@", (uint8_t *)&v11, 0xCu);
  }
  *a2 = -1;
  v7 = (const char *)[a1 UTF8String];
  uint32_t v8 = notify_register_dispatch(v7, a2, MEMORY[0x263EF83A0], a3);
  if (v8 || *a2 == -1)
  {
    double v9 = SRLogDaemonNotification;
    if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_ERROR))
    {
      int v10 = *a2;
      int v11 = 138543874;
      double v12 = a1;
      __int16 v13 = 1026;
      uint32_t v14 = v8;
      __int16 v15 = 1026;
      int v16 = v10;
      _os_log_error_impl(&dword_25C11B000, v9, OS_LOG_TYPE_ERROR, "Failed to register for darwin notification %{public}@, status %{public}d, registration token %{public}d", (uint8_t *)&v11, 0x18u);
    }
  }
}

void SRUnregisterForNotification(uint64_t a1, int *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v2 = *a2;
  if (*a2 != -1)
  {
    double v5 = SRLogDaemonNotification;
    if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 138543362;
      uint64_t v9 = a1;
      _os_log_debug_impl(&dword_25C11B000, v5, OS_LOG_TYPE_DEBUG, "Unregistering for darwin notification on %{public}@", (uint8_t *)&v8, 0xCu);
      int v2 = *a2;
    }
    if (notify_cancel(v2))
    {
      v6 = SRLogDaemonNotification;
      if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_ERROR))
      {
        int v7 = *a2;
        int v8 = 138543618;
        uint64_t v9 = a1;
        __int16 v10 = 1026;
        int v11 = v7;
        _os_log_error_impl(&dword_25C11B000, v6, OS_LOG_TYPE_ERROR, "Failed to cancel notification %{public}@. status %{public}d", (uint8_t *)&v8, 0x12u);
      }
    }
    *a2 = -1;
  }
}

uint64_t writeMetadataBytesForFrameStore(uint64_t a1, const void *a2, size_t a3, SRError **a4, double a5)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (a1) {
    double v10 = *(double *)(a1 + 48);
  }
  else {
    double v10 = 0.0;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v11 = -[SRFrameStore enumerateFromOffset:]((SRFramesStoreOffsetEnumerator *)a1, 0);
  uint64_t v12 = [(SRFramesStoreOffsetEnumerator *)v11 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (!v12) {
    goto LABEL_22;
  }
  uint64_t v13 = v12;
  size_t v33 = a3;
  uint32_t v14 = 0;
  uint64_t v15 = *(void *)v35;
LABEL_5:
  uint64_t v16 = 0;
  uint64_t v17 = v14;
  while (1)
  {
    if (*(void *)v35 != v15) {
      objc_enumerationMutation(v11);
    }
    uint32_t v14 = *(double **)(*((void *)&v34 + 1) + 8 * v16);
    double v18 = SRLogDatastore;
    if (os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_DEBUG))
    {
      if (a1) {
        uint64_t v19 = *(void *)(a1 + 40);
      }
      else {
        uint64_t v19 = 0;
      }
      double v20 = *v14;
      *(_DWORD *)buf = 138413058;
      uint64_t v39 = v19;
      __int16 v40 = 2048;
      double v41 = v20;
      __int16 v42 = 2048;
      double v43 = v10;
      __int16 v44 = 2048;
      v45 = v17;
      _os_log_debug_impl(&dword_25C11B000, v18, OS_LOG_TYPE_DEBUG, "metadata segment: %@, metadata frame time: %f, sample time: %f, current metadata object: %p", buf, 0x2Au);
    }
    if (*v14 > v10) {
      break;
    }
    ++v16;
    uint64_t v17 = v14;
    if (v13 == v16)
    {
      uint64_t v21 = -[SRFramesStoreOffsetEnumerator countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16, *v14);
      uint64_t v13 = v21;
      if (!v21)
      {
        uint64_t v17 = v14;
        a3 = v33;
        goto LABEL_19;
      }
      goto LABEL_5;
    }
  }
  a3 = v33;
  if (!v17) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v22 = *((unsigned int *)v17 + 4);
  if (v22 && v22 == a3 && !memcmp(a2, (char *)v17 + 20, a3)) {
    return 1;
  }
LABEL_22:
  if (a1)
  {
    uint64_t v23 = *(void *)(a1 + 24);
    if (v23 && (uint64_t v24 = *(void *)(v23 + 16)) != 0)
    {
      uint64_t v25 = *(void *)(v24 + 4);
    }
    else
    {
      uint64_t v27 = *(void *)(a1 + 16);
      if (v27) {
        uint64_t v25 = *(void *)(v27 + 24) - *(void *)(v27 + 16) + 56;
      }
      else {
        uint64_t v25 = 56;
      }
    }
    uint64_t v26 = -[SRFrameStore writeFrameForBytes:length:timestamp:error:](a1, (const Bytef *)a2, a3, a4, a5);
    uint64_t v28 = *(void *)(a1 + 24);
    if (v28 && (uint64_t v29 = *(void *)(v28 + 16)) != 0)
    {
      unint64_t v30 = *(void *)(v29 + 4);
    }
    else
    {
      uint64_t v31 = *(void *)(a1 + 16);
      if (v31) {
        unint64_t v30 = *(void *)(v31 + 24) - *(void *)(v31 + 16) + 56;
      }
      else {
        unint64_t v30 = 56;
      }
    }
    if (v30 >= v25 + a3) {
      -[SRFrameStore sync]((uint64_t *)a1);
    }
  }
  else
  {
    uint64_t v26 = 0;
    if (a4) {
      *a4 = +[SRError errorWithCode:12294];
    }
  }
  return v26;
}

void SRMakeSegmentHeader(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)a1 = 1195725633;
  *(void *)(a1 + 4) = a2;
  *(void *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 20) = a4;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v4 = (_OWORD *)(a1 + 24);
  if (a3)
  {
    uint64_t v5 = [a3 UTF8String];
    size_t v6 = strlen((const char *)v5);
    if (v6 >= 0x21)
    {
      size_t v7 = v6;
      int v8 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134349312;
        size_t v12 = v7;
        __int16 v13 = 2050;
        uint64_t v14 = 32;
        _os_log_error_impl(&dword_25C11B000, v8, OS_LOG_TYPE_ERROR, "Segment name is too large to store in the segment header. Truncating the segment name of %{public}zu to %{public}lu", (uint8_t *)&v11, 0x16u);
      }
    }
    long long v9 = *(_OWORD *)(v5 + 16);
    _OWORD *v4 = *(_OWORD *)v5;
    v4[1] = v9;
  }
  else
  {
    double v10 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_25C11B000, v10, OS_LOG_TYPE_INFO, "No segment name provided for the segment header", (uint8_t *)&v11, 2u);
    }
  }
}

uint64_t memoryMappingsForPermission(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a4;
  v16[1] = *MEMORY[0x263EF8340];
  switch(a1)
  {
    case 2:
      id v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], a4 - 56, 2, 1, 56);
      id v15 = v6;
      size_t v7 = (void *)MEMORY[0x263EFF8C0];
      int v8 = &v15;
      goto LABEL_6;
    case 1:
      id v11 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], 56, 2, 1, 0);
      uint64_t v12 = a3 - v5;
      if (!*(void *)(a2 + 4)) {
        uint64_t v5 = 56;
      }
      id v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], v12, 2, 2, v5);
      v14[0] = v11;
      v14[1] = v6;
      uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

      goto LABEL_10;
    case 0:
      id v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], a4 - 56, 1, 1, 56);
      v16[0] = v6;
      size_t v7 = (void *)MEMORY[0x263EFF8C0];
      int v8 = (id *)v16;
LABEL_6:
      uint64_t v4 = [v7 arrayWithObjects:v8 count:1];
LABEL_10:

      break;
  }
  return v4;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x270EF2B78]();
}

NSUInteger NSRoundDownToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x270EF2BC8](bytes);
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x270EF2BD0](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x270F795A8]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x270F795B0]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x270F795B8]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x270F795D8]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x270F795E8]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x270F79600]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x270F79628]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x270F79638]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x270F79660]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x270F79670]();
}

uint64_t TMConvertTicksToSeconds()
{
  return MEMORY[0x270F23978]();
}

uint64_t TMGetKernelMonotonicClock()
{
  return MEMORY[0x270F23988]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C668](adler, buf, *(void *)&len);
}

uLong adler32_z(uLong adler, const Bytef *buf, z_size_t len)
{
  return MEMORY[0x270F9C670](adler, buf, len);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5E0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x270EDAB30]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}