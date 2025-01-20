uint64_t PLPlatformEagerlyFetchFaceRegions()
{
  return 0;
}

uint64_t PLPlatformCloudPhotosPrimarySyncSupported()
{
  return 1;
}

double PLSplitToCGRectFromInt64(uint64_t a1, double *a2)
{
  *a2 = (double)(a1 >> 48) / 100.0;
  a2[1] = (double)((int)((unint64_t)a1 >> 16) >> 16) / 100.0;
  double result = (double)(__int16)a1 / 100.0;
  a2[2] = (double)((int)a1 >> 16) / 100.0;
  a2[3] = result;
  return result;
}

uint64_t PLPlatformPhotosAccessLoggingSupported()
{
  return 1;
}

id PLImageManagerGetLog()
{
  if (PLImageManagerGetLog_predicate != -1) {
    dispatch_once(&PLImageManagerGetLog_predicate, &__block_literal_global_66);
  }
  v0 = (void *)PLImageManagerGetLog_log;
  return v0;
}

double PLSplitToDoubleFromInt64(uint64_t a1, double *a2, double *a3, double *a4, double *a5)
{
  *a2 = (double)(a1 >> 48) / 100.0;
  *a3 = (double)((int)((unint64_t)a1 >> 16) >> 16) / 100.0;
  *a4 = (double)((int)a1 >> 16) / 100.0;
  double result = (double)(__int16)a1 / 100.0;
  *a5 = result;
  return result;
}

void sub_19BCFDF58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PLBundleIdentifier()
{
  MEMORY[0x1F4188790]();
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];

  if (!v1)
  {
    pid_t v2 = getpid();
    proc_pidpath(v2, v11, 0x1000u);
    if (strlen(v11) > 1)
    {
      v3 = (void *)MEMORY[0x1E4F1CB10];
      v4 = [NSString stringWithUTF8String:v11];
      v5 = [v3 fileURLWithPath:v4];

      v6 = [v5 path];
      BOOL v7 = +[PLSandboxHelper processCanReadSandboxForPath:v6];

      if (v7)
      {
        CFDictionaryRef v8 = CFBundleCopyInfoDictionaryForURL((CFURLRef)v5);
        v1 = [(__CFDictionary *)v8 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];

        if (v1) {
          goto LABEL_15;
        }
      }
      else
      {
      }
    }
    v9 = [MEMORY[0x1E4F28F80] processInfo];
    v1 = [v9 processName];

    if ([(__CFString *)v1 isEqualToString:@"photolibraryd"])
    {

      v1 = @"com.apple.photolibraryd";
    }
    else if ([(__CFString *)v1 isEqualToString:@"photoanalysisd"])
    {

      v1 = @"com.apple.photoanalysisd";
    }
    else if ([(__CFString *)v1 isEqualToString:@"assetsd"])
    {

      v1 = @"com.apple.assetsd";
    }
    else if ([(__CFString *)v1 isEqualToString:@"replayd"])
    {

      v1 = @"com.apple.replayd";
    }
  }
LABEL_15:
  return v1;
}

void sub_19BCFE1D4(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

void sub_19BCFE218(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2)
  {
    id v10 = objc_begin_catch(exc_buf);
    if (a2 == 2)
    {
      id v11 = v10;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(a9) = 138412290;
        *(void *)((char *)&a9 + 4) = v11;
        _os_log_debug_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Failed to get bundle identifer for process. Exception: %@", (uint8_t *)&a9, 0xCu);
      }
      objc_end_catch();
      JUMPOUT(0x19BCFDFF4);
    }
    JUMPOUT(0x19BCFDFF8);
  }
  JUMPOUT(0x19BCFE210);
}

void sub_19BCFF370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PLResultWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  v3 = a2;
  os_unfair_lock_lock(a1);
  v4 = v3[2](v3);

  os_unfair_lock_unlock(a1);
  return v4;
}

void pl_dispatch_once(dispatch_once_t *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_once_block_invoke;
  block[3] = &unk_1E58A1920;
  id v7 = v3;
  dispatch_once_t v4 = *a1;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(a1, block);
  }
}

uint64_t PLObjectIsEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 == v4)
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    if (v3 && v4) {
      uint64_t v6 = [v3 isEqual:v4];
    }
  }

  return v6;
}

id PLUnderlyingErrorThatHasDomainAndCode(void *a1, void *a2, uint64_t a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v14 = a2;
    id v5 = (void *)MEMORY[0x1E4F28ED0];
    id v6 = a2;
    id v7 = a1;
    CFDictionaryRef v8 = [v5 numberWithInteger:a3];
    v13 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    v15[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

    id v11 = PFUnderlyingErrorThatMatchesCodesByDomain();
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

uint64_t __PLValidatedSavedAssetTypeForEnabledTypesExecuteBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = PLValidatedSavedAssetTypeApplies(*(_DWORD *)(a1 + 40), a2);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v4();
  }
  return result;
}

uint64_t PLValidatedSavedAssetTypeApplies(unsigned int a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  switch((int)a2)
  {
    case 0:
      uint64_t result = a1 & 1;
      break;
    case 1:
      uint64_t result = (a1 >> 1) & 1;
      break;
    case 2:
      uint64_t result = (a1 >> 2) & 1;
      break;
    case 3:
      uint64_t result = (a1 >> 3) & 1;
      break;
    case 4:
      uint64_t result = (a1 >> 4) & 1;
      break;
    case 5:
      uint64_t result = (a1 >> 5) & 1;
      break;
    case 6:
      uint64_t result = (a1 >> 6) & 1;
      break;
    case 7:
      uint64_t result = (a1 >> 7) & 1;
      break;
    case 8:
      uint64_t result = (a1 >> 8) & 1;
      break;
    case 9:
      uint64_t result = (a1 >> 9) & 1;
      break;
    case 10:
      uint64_t result = (a1 >> 10) & 1;
      break;
    case 11:
      uint64_t result = (a1 >> 11) & 1;
      break;
    case 12:
      uint64_t result = (a1 >> 12) & 1;
      break;
    case 13:
      uint64_t result = (a1 >> 13) & 1;
      break;
    case 14:
      uint64_t result = (a1 >> 14) & 1;
      break;
    default:
      if (a2 == 256)
      {
        uint64_t result = (a1 >> 15) & 1;
      }
      else
      {
        id v4 = PLBackendGetLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v6 = a2;
          _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_FAULT, "Unrecognized savedAssetType %d", buf, 8u);
        }

        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unrecognized savedAssetType %d", a2);
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

void PLRunWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);

  os_unfair_lock_unlock(a1);
}

void sub_19BD01210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PLIsAssetsd()
{
  return (PLIsReallyAssetsd_isAssetsd != 0) | __PLIsAssetsdProxyService & 1u;
}

void sub_19BD015D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PLQueryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 2u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 40) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_37;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_37:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_39:
        *(_DWORD *)(a1 + 8) = v19;
        goto LABEL_40;
      case 3u:
        v24 = objc_alloc_init(PLQuery);
        uint64_t v25 = 16;
        goto LABEL_30;
      case 4u:
        v24 = objc_alloc_init(PLQuery);
        uint64_t v25 = 24;
LABEL_30:
        objc_storeStrong((id *)(a1 + v25), v24);
        if (!PBReaderPlaceMark() || (PLQueryReadFrom(v24, a2) & 1) == 0) {
          goto LABEL_42;
        }
        goto LABEL_35;
      case 5u:
        v24 = objc_alloc_init(PLSingleQuery);
        [(id)a1 addSingleQueries:v24];
        if PBReaderPlaceMark() && (PLSingleQueryReadFrom((uint64_t)v24, a2))
        {
LABEL_35:
          PBReaderRecallMark();

LABEL_40:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_42:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_40;
    }
  }
}

id PLChangeHandlingGetLog()
{
  if (PLChangeHandlingGetLog_predicate != -1) {
    dispatch_once(&PLChangeHandlingGetLog_predicate, &__block_literal_global_39);
  }
  v0 = (void *)PLChangeHandlingGetLog_log;
  return v0;
}

id PLFetchPerformanceGetLog()
{
  if (PLFetchPerformanceGetLog_predicate != -1) {
    dispatch_once(&PLFetchPerformanceGetLog_predicate, &__block_literal_global_75_2568);
  }
  v0 = (void *)PLFetchPerformanceGetLog_log;
  return v0;
}

__CFString *DCIM_NSStringFromCGSize(double a1, double a2)
{
  pid_t v2 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2);
  return v2;
}

void __pl_dispatch_async_block_invoke(uint64_t a1)
{
  pid_t v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL PLIsLimitedLibraryClient()
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  BOOL v0 = 0;
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&PLIsLimitedLibraryClient_lock);
    if ((PLIsLimitedLibraryClient_didResolveKnownAllowedResult & 1) == 0)
    {
      char v1 = +[PLPrivacy sharedInstance];
      uint64_t v2 = [v1 photosAccessAllowedWithScope:7];

      if (v2 != 1)
      {
        PLIsLimitedLibraryClient_didResolveKnownAllowedResult = 1;
        PLIsLimitedLibraryClient_limitedLibraryMode = PLIsAllowedResultEffectivelyLimited(v2);
      }
    }
    BOOL v0 = PLIsLimitedLibraryClient_limitedLibraryMode != 0;
    os_unfair_lock_unlock((os_unfair_lock_t)&PLIsLimitedLibraryClient_lock);
  }
  return v0;
}

void PLPrivacyAccountingLogPhotosAccess(_OWORD *a1)
{
  char v1 = (void *)*MEMORY[0x1E4FA9AE0];
  long long v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  id v3 = [MEMORY[0x1E4F93508] accessWithAuditToken:v5 forService:v1];
  id v4 = [MEMORY[0x1E4F934D0] sharedInstance];
  [v4 log:v3];
}

void sub_19BD01E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PLIsAllowedResultEffectivelyLimited(uint64_t a1)
{
  if (a1 == 4) {
    return 1;
  }
  uint64_t v9 = v1;
  uint64_t v10 = v2;
  if (a1) {
    return 0;
  }
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (PLIsReallyAssetsd_isAssetsd) {
    return 0;
  }
  if (__PLIsAssetsdProxyService) {
    return 0;
  }
  id v3 = +[PLPhotoLibraryPathManagerDCIM defaultDCIMPath];
  getpid();
  id v4 = v3;
  [v4 fileSystemRepresentation];
  int v5 = sandbox_check();

  if (!v5) {
    return 0;
  }
  int v6 = PLBackendGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEFAULT, "Capture Session: Forcing Limited Library mode in the client", buf, 2u);
  }

  return 1;
}

uint64_t DCIM_newPLImageWithCGImage(uint64_t a1, uint64_t a2, double a3)
{
  id v6 = objc_alloc(NSClassFromString((NSString *)@"UIImage"));
  return [v6 initWithCGImage:a1 scale:a2 orientation:a3];
}

uint64_t PLDegreesForImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 0;
  }
  else {
    return dword_19BDC6FE8[a1 - 1];
  }
}

void pl_dispatch_async(NSObject *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_async_block_invoke;
  block[3] = &unk_1E58A1920;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(a1, block);
}

id PLSyndicationUIGetLog()
{
  if (PLSyndicationUIGetLog_predicate != -1) {
    dispatch_once(&PLSyndicationUIGetLog_predicate, &__block_literal_global_285);
  }
  BOOL v0 = (void *)PLSyndicationUIGetLog_log;
  return v0;
}

id PLSharedLibraryGetLog()
{
  if (PLSharedLibraryGetLog_predicate != -1) {
    dispatch_once(&PLSharedLibraryGetLog_predicate, &__block_literal_global_282);
  }
  BOOL v0 = (void *)PLSharedLibraryGetLog_log;
  return v0;
}

BOOL PLPhotosAccessAllowed(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

uint64_t PLIsSuppressingLogsForUnitTesting()
{
  return _suppressLogsForUnitTesting;
}

void sub_19BD023FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BD02810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLPrivacyGetLog()
{
  if (PLPrivacyGetLog_predicate != -1) {
    dispatch_once(&PLPrivacyGetLog_predicate, &__block_literal_global_108_2584);
  }
  BOOL v0 = (void *)PLPrivacyGetLog_log;
  return v0;
}

void __PLMobileSlideShowPhotoLibraryTestingMode_block_invoke()
{
  if (PFOSVariantHasInternalUI())
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode = [v3 integerForKey:@"PLMobileSlideShowPhotoLibraryTestingMode"];
    if (!PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode)
    {
      BOOL v0 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v1 = [v0 environment];

      uint64_t v2 = [v1 objectForKeyedSubscript:@"PLMobileSlideShowPhotoLibraryTestingMode"];
      PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode = [v2 integerValue];
    }
  }
}

void __pl_dispatch_once_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___ensureSystemPhotoDataDirectoryPath_block_invoke()
{
  BOOL v0 = +[PLFileUtilities _defaultSystemLibraryPath];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"PhotoData"];

  uint64_t v2 = (void *)sPhotoDataDirectoryPath;
  sPhotoDataDirectoryPath = v1;
}

void __PLIsReallyAssetsd_block_invoke()
{
  BOOL v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"assetsd"];
  PLIsReallyAssetsd_isAssetsd = (char)v0;
}

void ___ensureSystemDCIMDirectoryPath_block_invoke()
{
  BOOL v0 = +[PLFileUtilities _defaultSystemLibraryPath];
  uint64_t v1 = [v0 stringByAppendingPathComponent:@"DCIM"];

  uint64_t v2 = (void *)sDCIMDirectoryPath;
  sDCIMDirectoryPath = v1;
}

void __PLPhysicalScreenScale_block_invoke()
{
  MGGetFloat32Answer();
  *(double *)&PLPhysicalScreenScale_screenScale = v0;
  if (v0 == -1.0)
  {
    uint64_t v1 = [NSClassFromString((NSString *)@"UIScreen") mainScreen];
    [v1 scale];
    PLPhysicalScreenScale_screenScale = v2;

    if (*(double *)&PLPhysicalScreenScale_screenScale == 1.0)
    {
      id v3 = [NSClassFromString((NSString *)@"UIScreen") mainScreen];
      id v9 = [v3 currentMode];

      id v4 = v9;
      if (v9)
      {
        [v9 size];
        id v4 = v9;
        uint64_t v7 = 0;
        while (1)
        {
          double v8 = *(double *)&PLSecureCaptureExtensionIdentifier_block_invoke___HIDPIScreenDimensions[v7];
          if (v8 == v5
            && *(double *)&PLSecureCaptureExtensionIdentifier_block_invoke___HIDPIScreenDimensions[v7 + 1] == v6)
          {
            break;
          }
          if (v8 == v6
            && *(double *)&PLSecureCaptureExtensionIdentifier_block_invoke___HIDPIScreenDimensions[v7 + 1] == v5)
          {
            break;
          }
          v7 += 2;
          if (v7 == 6) {
            goto LABEL_13;
          }
        }
        PLPhysicalScreenScale_screenScale = 0x4000000000000000;
      }
LABEL_13:
    }
  }
}

void __PLIsPhotosReliveWidget_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [(id)v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"PhotosReliveWidget"];
  if (v0)
  {
    char v2 = 1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28F80] processInfo];
    id v4 = [v3 processName];

    char v2 = [v4 isEqualToString:@"PhotosReliveWidgetIntents"];
  }
  PLIsPhotosReliveWidget_isPhotosReliveWidget = v2;
}

void __PLIsPhotosApp_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"Photos"];
  PLIsPhotosApp_isPhotosApp = (char)v0;
}

void __PLIsPhotoPicker_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [(id)v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"PhotoPicker"];
  if ((v0 & 1) != 0
    || ([MEMORY[0x1E4F28F80] processInfo],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [(id)v2 processName],
        id v3 = objc_claimAutoreleasedReturnValue(),
        (id)v2,
        LOBYTE(v2) = [v3 isEqualToString:@"PhotosPicker"],
        v3,
        (v2 & 1) != 0))
  {
    char v4 = 1;
  }
  else
  {
    double v5 = [MEMORY[0x1E4F28F80] processInfo];
    double v6 = [v5 processName];

    char v4 = [v6 isEqualToString:@"PhotosMessagesApp"];
  }
  PLIsPhotoPicker_isPhotoPicker = v4;
}

void __PLIsPTPD_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"ptpd"];
  PLIsPTPD_isPTPD = (char)v0;
}

void __PLIsMobileSlideShow_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"Photos"];
  PLIsMobileSlideShow_isMobileslideshow = (char)v0;
}

void __PLIsCamera_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v1 = [(id)v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"Camera"];
  if (v0)
  {
    char v2 = 1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28F80] processInfo];
    char v4 = [v3 processName];

    char v2 = [v4 isEqualToString:@"LockScreenCamera"];
  }
  PLIsCamera_isCamera = v2;
}

id DCIM_newPLImageWithContentsOfFile(void *a1)
{
  id v1 = a1;
  char v2 = (void *)[objc_alloc(NSClassFromString((NSString *)@"UIImage")) initWithContentsOfFile:v1];

  return v2;
}

void sub_19BD03A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BD041BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void pl_notify_register_dispatch_with_retry(const char *a1, int *a2, void *a3, int a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  unsigned __int8 v11 = atomic_load(sNotifyIsDisabledForShutdown);
  if ((v11 & 1) == 0)
  {
    LODWORD(v12) = 0;
    char v13 = 0;
    do
    {
      if (v13)
      {
        BOOL v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          int v20 = 1000000;
          __int16 v21 = 2080;
          char v22 = a1;
          __int16 v23 = 1024;
          int v24 = v12;
          __int16 v25 = 1024;
          int v26 = a4;
          _os_log_impl(&dword_19BCFB000, v14, OS_LOG_TYPE_ERROR, "Error %d occurred while trying to connect notify handler for %s. (attempt number: %d of %d)", buf, 0x1Eu);
        }

        usleep(0x186A0u);
      }
      uint64_t v15 = pl_notify_register_dispatch(a1, a2, v9, v10);
      uint64_t v12 = (v12 + 1);
      if (v15 != 1000000) {
        break;
      }
      char v13 = 1;
    }
    while ((int)v12 < a4);
    v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109890;
      int v20 = v15;
      __int16 v21 = 2082;
      char v22 = a1;
      __int16 v23 = 1024;
      int v24 = v12;
      __int16 v25 = 1024;
      int v26 = a4;
      _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_DEBUG, "notify_register_dispatch() returned %#x for %{public}s after number %d of %d", buf, 0x1Eu);
    }

    if (v15)
    {
      if (PLIsSecureCaptureExtension())
      {
        char v17 = PLBackendGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          int v20 = v15;
          __int16 v21 = 1024;
          LODWORD(v22) = v12;
          _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_DEFAULT, "notify_register_dispatch() failed for capture extension: (%#x) after %d retries", buf, 0xEu);
        }
      }
      else
      {
        char v17 = [MEMORY[0x1E4F28B00] currentHandler];
        unsigned int v18 = objc_msgSend(NSString, "stringWithUTF8String:", "void pl_notify_register_dispatch_with_retry(const char *, int *, __strong dispatch_queue_t, int, void (^__strong)(int))");
        [v17 handleFailureInFunction:v18, @"PLDispatchHelpers.m", 104, @"notify_register_dispatch() failed: (%#x) after %d retries", v15, v12 file lineNumber description];
      }
    }
  }
}

id PLBackendGetLog()
{
  if (PLBackendGetLog_predicate != -1) {
    dispatch_once(&PLBackendGetLog_predicate, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)PLBackendGetLog_log;
  return v0;
}

uint64_t pl_notify_register_dispatch(const char *a1, int *a2, NSObject *a3, void *a4)
{
  id v7 = a4;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __pl_notify_register_dispatch_block_invoke;
  handler[3] = &unk_1E589F770;
  id v12 = v7;
  id v8 = v7;
  uint64_t v9 = notify_register_dispatch(a1, a2, a3, handler);

  return v9;
}

void sub_19BD046FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BD04794(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

PLPhotoLibraryPathManager *PLPathManagerFromLibraryID(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"PLPhotoLibraryPathManager * _Nonnull PLPathManagerFromLibraryID(__strong PLPhotoLibraryID _Nonnull)"];
    [v7 handleFailureInFunction:v8, @"PLPhotoLibraryPathManagerIdentifier.m", 79, @"Invalid parameter not satisfying: %@", @"libraryID" file lineNumber description];
  }
  char v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [v1 identifier];
  char v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  double v5 = -[PLPhotoLibraryPathManager initWithLibraryURL:bundleScope:libraryFormat:]([PLPhotoLibraryPathManager alloc], "initWithLibraryURL:bundleScope:libraryFormat:", v4, 0, [v1 bundleFormat]);
  return v5;
}

PLPhotoLibraryPathManagerIdentifier *PLLibraryIDFromPathManager(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    char v4 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"PLPhotoLibraryID  _Nonnull PLLibraryIDFromPathManager(PLPhotoLibraryPathManager *__strong _Nonnull)"];
    [v4 handleFailureInFunction:v5, @"PLPhotoLibraryPathManagerIdentifier.m", 87, @"Invalid parameter not satisfying: %@", @"pathManager" file lineNumber description];
  }
  char v2 = [[PLPhotoLibraryPathManagerIdentifier alloc] initWithPathManager:v1];

  return v2;
}

void PLPositionalTableMemoryPool_Free(void **__new)
{
  if (!__new)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    char v4 = [NSString stringWithUTF8String:"void PLPositionalTableMemoryPool_Free(PLPositionalTableMemoryPoolNode *)"];
    [v3 handleFailureInFunction:v4 file:@"PLPositionalTableAllocator.m" lineNumber:83 description:@"no node."];
  }
  if (*((unsigned char *)__new + 16))
  {
    char v2 = (OSQueueHead *)__new[1];
    OSAtomicEnqueue(v2, __new, 0x18uLL);
  }
  else
  {
    free(*__new);
    free(__new);
  }
}

void *PLPositionalTableMemoryPool_Alloc(OSQueueHead *__list, void *a2)
{
  if (!__list || __list[1].opaque1 != a2 || (char v4 = OSAtomicDequeue(__list, 0x18uLL)) == 0)
  {
    char v4 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A0040D921DB92uLL);
    v4[1] = __list;
    void *v4 = malloc_type_malloc((size_t)a2, 0x6119C188uLL);
  }
  return v4;
}

id PLDCIMURLForResourceProperties(uint64_t a1, uint64_t a2, unsigned int a3, int a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id v17 = a5;
  id v18 = a6;
  uint64_t v19 = v18;
  if (!v18)
  {
    id v27 = v17;
    v28 = PLBackendGetLog();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v70 = 0;
    v29 = "PLDCIMURLForResourceProperties: assetDirectory is NULL";
    v30 = (uint8_t *)&v70;
LABEL_13:
    _os_log_impl(&dword_19BCFB000, v28, OS_LOG_TYPE_DEFAULT, v29, v30, 2u);
    goto LABEL_14;
  }
  if (!v17)
  {
    id v27 = 0;
    v28 = PLBackendGetLog();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v69 = 0;
    v29 = "PLDCIMURLForResourceProperties: assetFilename is NULL";
    v30 = (uint8_t *)&v69;
    goto LABEL_13;
  }
  if (!a1)
  {
    id v27 = v17;
    v28 = PLBackendGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "PLDCIMURLForResourceProperties: extension is NULL";
      v30 = buf;
      goto LABEL_13;
    }
LABEL_14:

    v31 = 0;
    int v26 = v27;
    goto LABEL_15;
  }
  uint64_t v62 = a1;
  id v64 = v18;
  [v17 stringByDeletingPathExtension];
  id v20 = v17;
  id v21 = objc_claimAutoreleasedReturnValue();
  uint64_t v63 = [v21 UTF8String];

  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
  __int16 v23 = v22;
  unsigned int v24 = a3;
  unsigned int v25 = HIWORD(a3);
  v65 = v20;
  if (HIWORD(a3) != 4)
  {
    if (a3 == 65749)
    {
      v33 = [NSString stringWithUTF8String:a12];
      v34 = [v33 stringByDeletingLastPathComponent];
      v35 = [v34 stringByAppendingPathComponent:@"VideoKeyFrames"];

      uint64_t v19 = v64;
      int v26 = v65;
      [v23 appendFormat:@"%@/%@/%@/", v35, v64, v65];

      v36 = @"LocalVideoKeyFrame.jpg";
LABEL_39:
      objc_msgSend(v23, "appendFormat:", v36, v56, v58, v59);
      goto LABEL_40;
    }
    uint64_t v19 = v64;
    if (a4 == 14)
    {
      [v22 appendFormat:@"%s/%@/%s/", a11, v64, v63, v61];
    }
    else if ((a2 - 1) < 2)
    {
      [v22 appendFormat:@"%s/%@/%s/%@/", a9, v64, v63, @"Adjustments"];
    }
    else
    {
      if (a2 && a2 != 3)
      {
LABEL_30:
        if (v24)
        {
          if (v25 == 1)
          {
            int v26 = v65;
            switch(v24)
            {
              case 0x10191u:
                v39 = @"SubstandardFullSizeRender.jpg";
                goto LABEL_85;
              case 0x10192u:
                if (a2 == 1)
                {
                  v53 = [MEMORY[0x1E4F28B00] currentHandler];
                  v54 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
                  [v53 handleFailureInFunction:v54 file:@"PLPhotoLibraryPathManagerDCIM.m" lineNumber:1070 description:@"DCIM layout does not support penultimate image resources with a receipID set."];
                }
                objc_msgSend(v23, "appendFormat:", @"FullSizeRender.%s", v62, v57, v59);
                goto LABEL_40;
              case 0x10193u:
              case 0x10194u:
              case 0x10196u:
              case 0x10199u:
              case 0x1019Bu:
              case 0x1019Du:
              case 0x1019Eu:
                goto LABEL_40;
              case 0x10195u:
                v39 = @"AsyncRenderPreview.JPG";
                goto LABEL_85;
              case 0x10197u:
                v49 = @"D";
                goto LABEL_87;
              case 0x10198u:
LABEL_38:
                uint64_t v56 = v63;
                uint64_t v58 = v62;
                v36 = @"%s.%s";
                goto LABEL_39;
              case 0x1019Au:
LABEL_47:
                v40 = [NSString stringWithUTF8String:v63];
                v41 = +[PLPhotoLibraryPathManagerCore basenameForSpatialOverCaptureFromOriginalBasename:v40];
                v42 = [NSString stringWithUTF8String:v62];
                [v23 appendFormat:@"%@.%@", v41, v42];

                goto LABEL_40;
              case 0x1019Cu:
                v39 = @"VideoPosterFramePreview.jpg";
LABEL_85:
                [v23 appendString:v39];
                break;
              case 0x1019Fu:
                v49 = @"X";
LABEL_87:
                objc_msgSend(v23, "appendFormat:", @"%s%s.%s", v63, -[__CFString UTF8String](v49, "UTF8String"), v62);
                break;
              default:
                int v26 = v65;
                switch(v24)
                {
                  case 0x100C9u:
                    objc_msgSend(v23, "appendFormat:", @"%s.full.JPG", v63, v57, v59);
                    break;
                  case 0x100CAu:
                  case 0x100CCu:
                  case 0x100CEu:
                  case 0x100D0u:
                  case 0x100D2u:
                    goto LABEL_40;
                  case 0x100CBu:
                    objc_msgSend(v23, "appendFormat:", @"%s.large.JPG", v63, v57, v59);
                    break;
                  case 0x100CDu:
                    objc_msgSend(v23, "appendFormat:", @"%s.JPG", v63, v57, v59);
                    break;
                  case 0x100CFu:
                    objc_msgSend(v23, "appendFormat:", @"%s.medium.JPG", v63, v57, v59);
                    break;
                  case 0x100D1u:
                    objc_msgSend(v23, "appendFormat:", @"%s_sRGB.JPG", v63, v57, v59);
                    break;
                  case 0x100D3u:
                    v43 = [MEMORY[0x1E4F28B00] currentHandler];
                    v44 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
                    v45 = @"DCIM layout does not support PLImageRecipeID_Pri_SourceColorSpace_1K.";
                    v46 = v43;
                    v47 = v44;
                    uint64_t v48 = 1107;
LABEL_93:
                    objc_msgSend(v46, "handleFailureInFunction:file:lineNumber:description:", v47, @"PLPhotoLibraryPathManagerDCIM.m", v48, v45, v55);
                    goto LABEL_94;
                  default:
                    if (v24 == 66137) {
                      objc_msgSend(v23, "appendFormat:", @"Alchemist.%s", v62, v57, v59);
                    }
                    break;
                }
                break;
            }
          }
          else if (v25 == 2)
          {
            int v26 = v65;
            switch(v24)
            {
              case 0x20000u:
                if (a2 == 1)
                {
                  v51 = [MEMORY[0x1E4F28B00] currentHandler];
                  v52 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
                  [v51 handleFailureInFunction:v52 file:@"PLPhotoLibraryPathManagerDCIM.m" lineNumber:1132 description:@"DCIM layout does not support penultimate video resources with a receipID set."];
                }
                goto LABEL_55;
              case 0x20001u:
              case 0x20002u:
              case 0x20004u:
              case 0x20006u:
              case 0x20008u:
                goto LABEL_40;
              case 0x20003u:
LABEL_55:
                v39 = @"FullSizeRender.mov";
                goto LABEL_85;
              case 0x20005u:
                v50 = @"large.MOV";
                goto LABEL_79;
              case 0x20007u:
                v50 = @"medium.MP4";
                goto LABEL_79;
              case 0x20009u:
                v50 = @"small.MP4";
LABEL_79:
                [v23 appendFormat:@"%s.%@", v63, v50, v59];
                break;
              default:
                JUMPOUT(0);
            }
          }
          else
          {
            BOOL v38 = v25 == 5;
            int v26 = v65;
            if (v38)
            {
              v31 = 0;
              switch(v24)
              {
                case 0x50003u:
                  objc_msgSend(v23, "appendFormat:", @"%s.media.dat", v63, v57, v59);
                  goto LABEL_40;
                case 0x50005u:
                  goto LABEL_42;
                case 0x50007u:
                  v39 = @"WallpaperComputeResources.dat";
                  goto LABEL_85;
                case 0x50009u:
                  v39 = @"ComputeSyncWrapper.dat";
                  goto LABEL_85;
                case 0x5000Bu:
                  v39 = @"ComputeSyncMediaAnalysisPayload.dat";
                  goto LABEL_85;
                case 0x5000Du:
                  v39 = @"GenerativePlaygroundFaceResources.dat";
                  goto LABEL_85;
                default:
                  goto LABEL_40;
              }
            }
          }
          goto LABEL_40;
        }
        goto LABEL_37;
      }
      uint64_t v37 = a7;
      if (((a3 != 131279) & a3 & ((a3 & 0xFFFFFFF7) != 65943)) != 0) {
        uint64_t v37 = a10;
      }
      [v22 appendFormat:@"%s/%@/", v37, v64, v59, v61];
    }
    unsigned int v24 = a3;
    goto LABEL_30;
  }
  id v60 = v20;
  uint64_t v19 = v64;
  [v22 appendFormat:@"%s/%@/%@/", a12, v64, v60];
  if (!a3)
  {
LABEL_37:
    int v26 = v65;
    switch(a4)
    {
      case 0:
        if (a2 != 1) {
          goto LABEL_38;
        }
        objc_msgSend(v23, "appendFormat:", @"PenultimateFullSizeRender.%s", v62, v57, v59);
        goto LABEL_40;
      case 1:
      case 3:
        if (a2 != 1) {
          goto LABEL_38;
        }
        v39 = @"PenultimateFullSizeRender.mov";
        goto LABEL_85;
      case 2:
      case 4:
      case 5:
      case 12:
      case 31:
        goto LABEL_38;
      case 6:
        if (!a2)
        {
          objc_msgSend(v23, "appendFormat:", @"%s.data", v63, v57, v59);
          goto LABEL_40;
        }
        if (a2 == 2)
        {
          v39 = @"Adjustments.data";
          goto LABEL_85;
        }
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        v44 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"PLPhotoLibraryPathManagerDCIM.m", 1008, @"Unexpected resource version (%d) for adjustment resource data (PLResourceTypeAdjustmentData).", a2);
        break;
      case 7:
        v39 = @"AdjustmentsSecondary.data";
        goto LABEL_85;
      case 8:
        v39 = @"Adjustments.plist";
        goto LABEL_85;
      case 9:
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        v44 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
        v45 = @"Resource with type PLResourceTypeMediaMetadata must have a recipeID set.";
        v46 = v43;
        v47 = v44;
        uint64_t v48 = 1016;
        goto LABEL_93;
      case 10:
      case 11:
        goto LABEL_47;
      case 13:
        [v23 appendFormat:@"%s%@.%@", v63, @"videometadata", @"mov"];
        goto LABEL_40;
      case 14:
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        v44 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
        v45 = @"Resource with type PLResourceTypeCompute must have a recipeID set.";
        v46 = v43;
        v47 = v44;
        uint64_t v48 = 1022;
        goto LABEL_93;
      case 15:
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        v44 = objc_msgSend(NSString, "stringWithUTF8String:", "NSURL * _Nullable PLDCIMURLForResourceProperties(const char * _Nonnull, PLResourceVersion, PLResourceRecipeID, PLResourceType, NSString *__strong _Nonnull, NSString *__strong _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull, const char * _Nonnull)");
        v45 = @"Resource with type PLResourceTypeAdjustmentSuggestionImage must have a recipeID set.";
        v46 = v43;
        v47 = v44;
        uint64_t v48 = 1025;
        goto LABEL_93;
      default:
        goto LABEL_40;
    }
LABEL_94:

    goto LABEL_40;
  }
  objc_msgSend(v23, "appendFormat:", @"%s", a13);
  int v26 = v65;
LABEL_40:
  if (v23)
  {
    v31 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23 isDirectory:0];
LABEL_42:
  }
  else
  {
    v31 = 0;
  }
LABEL_15:

  return v31;
}

uint64_t PLIsUBFOnDCIMLibraryURLForSingletonLibraryPath(void *a1, void *a2)
{
  id v3 = a1;
  char v4 = [a2 stringByAppendingPathComponent:@"PhotoData"];
  double v5 = [v4 stringByAppendingPathComponent:@"UBF"];

  double v6 = [v3 path];

  uint64_t v7 = [v6 isEqualToString:v5];
  return v7;
}

id PLPhotosObjectLifecycleGetLog()
{
  if (PLPhotosObjectLifecycleGetLog_predicate != -1) {
    dispatch_once(&PLPhotosObjectLifecycleGetLog_predicate, &__block_literal_global_117);
  }
  uint64_t v0 = (void *)PLPhotosObjectLifecycleGetLog_log;
  return v0;
}

id PLUIGetLog()
{
  if (PLUIGetLog_predicate != -1) {
    dispatch_once(&PLUIGetLog_predicate, &__block_literal_global_246);
  }
  uint64_t v0 = (void *)PLUIGetLog_log;
  return v0;
}

uint64_t __PLSendCoreAnalyticEvent_block_invoke(uint64_t a1)
{
  return MEMORY[0x1F41138A0](*(void *)(a1 + 32), *(void *)(a1 + 40));
}

id PLUserStatusGetLog()
{
  if (PLUserStatusGetLog_predicate != -1) {
    dispatch_once(&PLUserStatusGetLog_predicate, &__block_literal_global_252);
  }
  uint64_t v0 = (void *)PLUserStatusGetLog_log;
  return v0;
}

uint64_t PLIsPhotoPicker()
{
  return PLIsPhotoPicker_isPhotoPicker;
}

id PLServicesLocalizedFrameworkString(void *a1)
{
  id v1 = a1;
  char v2 = PLPhotoLibraryServicesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:&stru_1EEBF74F0 table:@"PhotoLibraryServices"];

  return v3;
}

id PLPhotoLibraryServicesFrameworkBundle()
{
  uint64_t v0 = (void *)__PLPhotoLibraryServicesFrameworkBundle;
  if (!__PLPhotoLibraryServicesFrameworkBundle)
  {
    uint64_t v1 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString((NSString *)@"PLPhotoLibrary")];
    char v2 = (void *)__PLPhotoLibraryServicesFrameworkBundle;
    __PLPhotoLibraryServicesFrameworkBundle = v1;

    uint64_t v0 = (void *)__PLPhotoLibraryServicesFrameworkBundle;
  }
  return v0;
}

OSQueueHead *PLPositionalTableMemoryPool_Create(void *a1, int a2)
{
  unint64_t v4 = ((unint64_t)a1 + 7) & 0xFFFFFFFFFFFFFFF8;
  size_t v5 = a2;
  vm_size_t v6 = (*MEMORY[0x1E4F14B00] + v4 * a2 - 1) & -*MEMORY[0x1E4F14B00];
  vm_address_t address = 0;
  uint64_t v7 = 0;
  if (!vm_allocate(*MEMORY[0x1E4F14960], &address, v6, -117440511))
  {
    uint64_t v7 = (OSQueueHead *)malloc_type_calloc(1uLL, 0x40uLL, 0x1080040D6C77673uLL);
    v7->opaque1 = 0;
    v7->opaque2 = 0;
    LODWORD(v7[1].opaque2) = a2;
    v7[1].opaque1 = a1;
    v7[2].opaque2 = address;
    v7[3].opaque1 = (void *)v6;
    id v8 = malloc_type_calloc(v5, 0x20uLL, 0x10A0040D921DB92uLL);
    v7[2].opaque1 = v8;
    if (SLODWORD(v7[1].opaque2) >= 1)
    {
      uint64_t v9 = (vm_address_t *)v8;
      uint64_t v10 = 0;
      vm_address_t v11 = address;
      do
      {
        vm_address_t *v9 = v11;
        v9[1] = (vm_address_t)v7;
        *((unsigned char *)v9 + 16) = 1;
        OSAtomicEnqueue(v7, v9, 0x18uLL);
        v11 += v4;
        ++v10;
        v9 += 4;
      }
      while (v10 < SLODWORD(v7[1].opaque2));
    }
  }
  return v7;
}

void sub_19BD0A86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLPhotoKitGetLog()
{
  if (PLPhotoKitGetLog_predicate != -1) {
    dispatch_once(&PLPhotoKitGetLog_predicate, &__block_literal_global_105);
  }
  uint64_t v0 = (void *)PLPhotoKitGetLog_log;
  return v0;
}

void pl_dispatch_sync(NSObject *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_sync_block_invoke;
  block[3] = &unk_1E58A1920;
  id v6 = v3;
  id v4 = v3;
  dispatch_sync(a1, block);
}

void pl_dispatch_barrier_sync(NSObject *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_barrier_sync_block_invoke;
  block[3] = &unk_1E58A1920;
  id v6 = v3;
  id v4 = v3;
  dispatch_barrier_sync(a1, block);
}

void __pl_dispatch_barrier_sync_block_invoke(uint64_t a1)
{
  char v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __pl_dispatch_sync_block_invoke(uint64_t a1)
{
  char v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id PLCuratedLibraryGetLog()
{
  if (PLCuratedLibraryGetLog_predicate != -1) {
    dispatch_once(&PLCuratedLibraryGetLog_predicate, &__block_literal_global_174);
  }
  uint64_t v0 = (void *)PLCuratedLibraryGetLog_log;
  return v0;
}

BOOL PLIsPhotosAppAnyPlatform()
{
  if (PLIsPhotosApp_isPhotosApp) {
    return 1;
  }
  pl_dispatch_once(&PLIsMobileSlideShow_didCheck, &__block_literal_global_93_3853);
  if (PLIsMobileSlideShow_isMobileslideshow) {
    return 1;
  }
  pl_dispatch_once(&PLIsTVPhotosApp_didCheck, &__block_literal_global_100_3857);
  return PLIsTVPhotosApp_isTVPhotosApp != 0;
}

BOOL PLIsContentPrivacyEnabled()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (PFProcessIsLaunchedToExecuteTests()) {
    return 0;
  }
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL result = CFPreferencesGetAppBooleanValue(@"ContentPrivacyEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    uint64_t v1 = PLPreferencesGetLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v4 = @"com.apple.mobileslideshow";
      _os_log_impl(&dword_19BCFB000, v1, OS_LOG_TYPE_DEBUG, "Content privacy default not set in domain %@. Defaulting to YES", buf, 0xCu);
    }

    return 1;
  }
  return result;
}

BOOL PLIsFeaturedContentAllowed()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL result = CFPreferencesGetAppBooleanValue(@"FeaturedContentAllowed", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    uint64_t v1 = PLPreferencesGetLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v4 = @"com.apple.mobileslideshow";
      _os_log_impl(&dword_19BCFB000, v1, OS_LOG_TYPE_DEBUG, "Featured content allowed default not set in domain %@. Defaulting to YES", buf, 0xCu);
    }

    return 1;
  }
  return result;
}

id PLPreferencesGetLog()
{
  if (PLPreferencesGetLog_predicate != -1) {
    dispatch_once(&PLPreferencesGetLog_predicate, &__block_literal_global_222);
  }
  uint64_t v0 = (void *)PLPreferencesGetLog_log;
  return v0;
}

id PLPersistentHistoryGetLog()
{
  if (PLPersistentHistoryGetLog_predicate != -1) {
    dispatch_once(&PLPersistentHistoryGetLog_predicate, &__block_literal_global_99);
  }
  uint64_t v0 = (void *)PLPersistentHistoryGetLog_log;
  return v0;
}

uint64_t PLIsSystemLibraryAccessProhibited()
{
  if (PLIsSystemLibraryAccessProhibited_onceToken != -1) {
    dispatch_once(&PLIsSystemLibraryAccessProhibited_onceToken, &__block_literal_global_52);
  }
  return _systemLibraryAccessProhibited;
}

id PLPhotoLibraryGetLog()
{
  if (PLPhotoLibraryGetLog_predicate != -1) {
    dispatch_once(&PLPhotoLibraryGetLog_predicate, &__block_literal_global_144_2604);
  }
  uint64_t v0 = (void *)PLPhotoLibraryGetLog_log;
  return v0;
}

uint64_t PLIsMobileSlideShow()
{
  return PLIsMobileSlideShow_isMobileslideshow;
}

id PLLibraryBundleGetLog()
{
  if (PLLibraryBundleGetLog_predicate != -1) {
    dispatch_once(&PLLibraryBundleGetLog_predicate, &__block_literal_global_81);
  }
  uint64_t v0 = (void *)PLLibraryBundleGetLog_log;
  return v0;
}

uint64_t PLIsCamera()
{
  return PLIsCamera_isCamera;
}

id PLPhotoSharingGetLog()
{
  if (PLPhotoSharingGetLog_predicate != -1) {
    dispatch_once(&PLPhotoSharingGetLog_predicate, &__block_literal_global_114);
  }
  uint64_t v0 = (void *)PLPhotoSharingGetLog_log;
  return v0;
}

id PLWindowSceneDelegateGetLog()
{
  if (PLWindowSceneDelegateGetLog_predicate != -1) {
    dispatch_once(&PLWindowSceneDelegateGetLog_predicate, &__block_literal_global_264);
  }
  uint64_t v0 = (void *)PLWindowSceneDelegateGetLog_log;
  return v0;
}

id PLContentPrivacyUIGetLog()
{
  if (PLContentPrivacyUIGetLog_predicate != -1) {
    dispatch_once(&PLContentPrivacyUIGetLog_predicate, &__block_literal_global_288);
  }
  uint64_t v0 = (void *)PLContentPrivacyUIGetLog_log;
  return v0;
}

id pl_result_with_autoreleasepool(void *a1)
{
  uint64_t v1 = a1;
  char v2 = (void *)MEMORY[0x19F38F510]();
  id v3 = v1[2](v1);

  return v3;
}

void __pl_dispatch_async_without_boost_block_invoke(uint64_t a1)
{
  char v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id PLSafeResultWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  id v4 = v3[2](v3);
  os_unfair_lock_unlock(a1);

  return v4;
}

void sub_19BD0CA44(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_19BD0CA58(_Unwind_Exception *a1)
{
}

BOOL PLIsForegroundApplication()
{
  return qos_class_main() == QOS_CLASS_USER_INTERACTIVE;
}

id PLUserStatusUIGetLog()
{
  if (PLUserStatusUIGetLog_predicate != -1) {
    dispatch_once(&PLUserStatusUIGetLog_predicate, &__block_literal_global_255);
  }
  uint64_t v0 = (void *)PLUserStatusUIGetLog_log;
  return v0;
}

id PLGridInlinePlaybackGetLog()
{
  if (PLGridInlinePlaybackGetLog_predicate != -1) {
    dispatch_once(&PLGridInlinePlaybackGetLog_predicate, &__block_literal_global_180);
  }
  uint64_t v0 = (void *)PLGridInlinePlaybackGetLog_log;
  return v0;
}

uint64_t PLIsPhotosReliveWidget()
{
  return PLIsPhotosReliveWidget_isPhotosReliveWidget;
}

uint64_t PLIsAssetsdProxyService()
{
  return __PLIsAssetsdProxyService;
}

__CFString *DCIM_applicationDidReceiveMemoryWarningNotificationName()
{
  return @"UIApplicationDidReceiveMemoryWarningNotification";
}

__CFString *DCIM_applicationBackgroundedNotificationName()
{
  return @"UIApplicationDidEnterBackgroundNotification";
}

uint64_t PLIsValidStateForMinimumStateRequirement(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 < 8 && a1 >= a2;
  return a1 == a2 || v3;
}

uint64_t PLIsCameraBundleIdentifier(uint64_t a1)
{
  return [&unk_1EEC14F98 containsObject:a1];
}

id PLCacheMetricsCollectorGetLog()
{
  if (PLCacheMetricsCollectorGetLog_predicate != -1) {
    dispatch_once(&PLCacheMetricsCollectorGetLog_predicate, &__block_literal_global_30);
  }
  uint64_t v0 = (void *)PLCacheMetricsCollectorGetLog_log;
  return v0;
}

BOOL PLIsSharedAlbumsAllowed()
{
  if (PLIsEDUMode_onceToken != -1) {
    dispatch_once(&PLIsEDUMode_onceToken, &__block_literal_global_195_3936);
  }
  int v0 = PLIsEDUMode_isEDUMode;
  if (PLIsLockdownMode_onceToken != -1) {
    dispatch_once(&PLIsLockdownMode_onceToken, &__block_literal_global_200);
  }
  return (PLIsLockdownMode_isLockdownMode | v0) == 0;
}

void sub_19BD0CEBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PLPPTGetLog()
{
  if (PLPPTGetLog_predicate != -1) {
    dispatch_once(&PLPPTGetLog_predicate, &__block_literal_global_207);
  }
  int v0 = (void *)PLPPTGetLog_log;
  return v0;
}

id PLLibraryServicesGetLog()
{
  if (PLLibraryServicesGetLog_predicate != -1) {
    dispatch_once(&PLLibraryServicesGetLog_predicate, &__block_literal_global_84_2572);
  }
  int v0 = (void *)PLLibraryServicesGetLog_log;
  return v0;
}

void PLSendCoreAnalyticEvent(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __PLSendCoreAnalyticEvent_block_invoke;
  v7[3] = &unk_1E58A1EF8;
  id v8 = v3;
  id v9 = v4;
  id v5 = v4;
  id v6 = v3;
  pl_dispatch_async_without_boost(v7);
}

void pl_dispatch_async_without_boost(dispatch_block_t block)
{
  dispatch_block_t v1 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, block);
  char v2 = dispatch_get_global_queue(9, 0);
  blocka[0] = MEMORY[0x1E4F143A8];
  blocka[1] = 3221225472;
  blocka[2] = __pl_dispatch_async_without_boost_block_invoke;
  blocka[3] = &unk_1E58A1920;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, blocka);
}

void __PLIsLockdownMode_block_invoke()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  int v0 = (void *)getLockdownModeManagerClass_softClass;
  uint64_t v7 = getLockdownModeManagerClass_softClass;
  if (!getLockdownModeManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getLockdownModeManagerClass_block_invoke;
    v3[3] = &unk_1E58A2238;
    v3[4] = &v4;
    __getLockdownModeManagerClass_block_invoke((uint64_t)v3);
    int v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  char v2 = [v1 shared];
  PLIsLockdownMode_isLockdownMode = [v2 enabled];
}

void sub_19BD0D32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLockdownModeManagerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!LockdownModeLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __LockdownModeLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E589FA60;
    uint64_t v8 = 0;
    LockdownModeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!LockdownModeLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *LockdownModeLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PLHelper.m", 71, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("LockdownModeManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getLockdownModeManagerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PLHelper.m", 72, @"Unable to find class %s", "LockdownModeManager");

LABEL_10:
    __break(1u);
  }
  getLockdownModeManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_19BD0D808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD0DB9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_19BD0EE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

id PLGatekeeperXPCGetLog()
{
  if (PLGatekeeperXPCGetLog_predicate != -1) {
    dispatch_once(&PLGatekeeperXPCGetLog_predicate, &__block_literal_global_63);
  }
  int v0 = (void *)PLGatekeeperXPCGetLog_log;
  return v0;
}

void sub_19BD0F6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,os_signpost_id_t a31,os_activity_scope_state_s a32,SEL sel)
{
  if (a29) {
    os_activity_scope_leave(&a32);
  }
  if (a31)
  {
    v36 = PLRequestGetLog();
    uint64_t v37 = v36;
    if (a31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v34 - 112) = 136446210;
      *(void *)(v33 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v37, OS_SIGNPOST_INTERVAL_END, a31, "PLXPC Sync", "%{public}s", (uint8_t *)(v34 - 112), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD0FAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

id PLRequestGetLog()
{
  if (PLRequestGetLog_predicate != -1) {
    dispatch_once(&PLRequestGetLog_predicate, &__block_literal_global_1251);
  }
  int v0 = (void *)PLRequestGetLog_log;
  return v0;
}

void sub_19BD101A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel)
{
  _Block_object_dispose((const void *)(v30 - 160), 8);
  if (a25) {
    os_activity_scope_leave(&a28);
  }
  if (a27)
  {
    v32 = PLRequestGetLog();
    uint64_t v33 = v32;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v30 - 160) = 136446210;
      *(void *)(v29 + 116) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v33, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)(v30 - 160), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD10578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLSandboxExtensionTokenAsData(void *a1)
{
  id v1 = a1;
  if ([v1 length])
  {
    char v2 = (void *)MEMORY[0x1E4F1C9B8];
    id v3 = v1;
    uint64_t v4 = objc_msgSend(v2, "dataWithBytes:length:", objc_msgSend(v3, "UTF8String"), strlen((const char *)objc_msgSend(v3, "UTF8String")) + 1);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id PLGetSandboxExtensionTokenWithFlags(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (v5
    && (([v5 fileSystemRepresentation], !a4)
      ? (uint64_t v7 = sandbox_extension_issue_file())
      : (uint64_t v7 = sandbox_extension_issue_file_to_process()),
        (uint64_t v8 = (void *)v7) != 0))
  {
    uint64_t v9 = [NSString stringWithUTF8String:v7];
    free(v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

BOOL PLDoesIndicatorFileExistAtPath(void *a1)
{
  int v1 = open((const char *)[a1 fileSystemRepresentation], 4);
  int v2 = v1;
  if ((v1 & 0x80000000) == 0) {
    close(v1);
  }
  return v2 >= 0;
}

id pathKeyForLibraryURL(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = [v1 path];
  id v9 = 0;
  id v3 = +[PLFileUtilities realPathForPath:v2 error:&v9];
  id v4 = v9;

  if (v3)
  {
    if (![v3 hasSuffix:@"/"]) {
      goto LABEL_10;
    }
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"NSString *pathKeyForLibraryURL(NSURL *__strong)"];
    [v5 handleFailureInFunction:v6, @"PLLibraryBookmarkManager.m", 35, @"Invalid parameter not satisfying: %@", @"![path hasSuffix:@\"/\"]" file lineNumber description];

    goto LABEL_8;
  }
  if (v1)
  {
    uint64_t v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v1;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_DEFAULT, "Unable to determine realpath for URL %@ error: %@", buf, 0x16u);
    }

    id v5 = [v1 URLByStandardizingPath];
    id v3 = [v5 path];
LABEL_8:

    goto LABEL_10;
  }
  id v3 = 0;
LABEL_10:

  return v3;
}

void sub_19BD10FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19BD11428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PLPhotosSearchGetLog()
{
  if (PLPhotosSearchGetLog_predicate != -1) {
    dispatch_once(&PLPhotosSearchGetLog_predicate, &__block_literal_global_216);
  }
  int v0 = (void *)PLPhotosSearchGetLog_log;
  return v0;
}

uint64_t __PLPrivacyGetLog_block_invoke()
{
  PLPrivacyGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Privacy");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPhotosObjectLifecycleGetLog_block_invoke()
{
  PLPhotosObjectLifecycleGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "PhotosObjectLifecycle");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPhotoLibraryGetLog_block_invoke()
{
  PLPhotoLibraryGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "PhotoLibrary");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLLibraryBundleGetLog_block_invoke()
{
  PLLibraryBundleGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "LibraryBundle");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLChangeHandlingGetLog_block_invoke()
{
  PLChangeHandlingGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "ChangeHandling");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLBackendGetLog_block_invoke()
{
  PLBackendGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Backend");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLIsChinaSKU_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  PLIsChinaSKU_isChinaSKU = result;
  return result;
}

uint64_t __PLDeviceSupportsASTC_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  PLDeviceSupportsASTC_s_hasSupport = result;
  return result;
}

__CFString *PLStringFromWellKnownPhotoLibraryIdentifier(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"PLWellKnownPhotoLibraryIdentifierNone";
  }
  else {
    return off_1E58A1770[a1 - 1];
  }
}

id PLSearchBackendInitialSuggestionsGetLog()
{
  if (PLSearchBackendInitialSuggestionsGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendInitialSuggestionsGetLog_predicate, &__block_literal_global_390);
  }
  int v0 = (void *)PLSearchBackendInitialSuggestionsGetLog_log;
  return v0;
}

id PLPTPGetLog()
{
  if (PLPTPGetLog_predicate != -1) {
    dispatch_once(&PLPTPGetLog_predicate, &__block_literal_global_96);
  }
  int v0 = (void *)PLPTPGetLog_log;
  return v0;
}

id PLDragAndDropGetLog()
{
  if (PLDragAndDropGetLog_predicate != -1) {
    dispatch_once(&PLDragAndDropGetLog_predicate, &__block_literal_global_177);
  }
  int v0 = (void *)PLDragAndDropGetLog_log;
  return v0;
}

id PLCameraTaskConstraintsGetLog()
{
  if (PLCameraTaskConstraintsGetLog_predicate != -1) {
    dispatch_once(&PLCameraTaskConstraintsGetLog_predicate, &__block_literal_global_36);
  }
  int v0 = (void *)PLCameraTaskConstraintsGetLog_log;
  return v0;
}

id PLBackgroundJobServiceGetLog()
{
  if (PLBackgroundJobServiceGetLog_predicate != -1) {
    dispatch_once(&PLBackgroundJobServiceGetLog_predicate, &__block_literal_global_21);
  }
  int v0 = (void *)PLBackgroundJobServiceGetLog_log;
  return v0;
}

void __PLIsEDUMode_block_invoke()
{
  id v1 = [MEMORY[0x1E4FB36F8] sharedManager];
  if ([v1 isMultiUser])
  {
    int v0 = [v1 currentUser];
    PLIsEDUMode_isEDUMode = [v0 userType] == 1;
  }
  else
  {
    PLIsEDUMode_isEDUMode = 0;
  }
}

uint64_t PLPlatformSearchSupported()
{
  return PLPlatformSearchSupported_searchSupported;
}

uint64_t PLIsPTPD()
{
  return PLIsPTPD_isPTPD;
}

__CFString *PLStringFromQoSClass(int a1)
{
  if (a1 > 16)
  {
    if (a1 > 24)
    {
      if (a1 == 33) {
        return @"QOS_CLASS_USER_INTERACTIVE";
      }
      if (a1 == 25) {
        return @"QOS_CLASS_USER_INITIATED";
      }
    }
    else
    {
      if (a1 == 17) {
        return @"QOS_CLASS_UTILITY";
      }
      if (a1 == 21) {
        return @"QOS_CLASS_DEFAULT";
      }
    }
    return @"UNKNOWN";
  }
  if (!a1) {
    return @"QOS_CLASS_UNSPECIFIED";
  }
  if (a1 != 5)
  {
    if (a1 == 9) {
      return @"QOS_CLASS_BACKGROUND";
    }
    return @"UNKNOWN";
  }
  return @"QOS_CLASS_MAINTENANCE";
}

__CFString *PLShortStringFromQoSClass(int a1)
{
  if (a1 > 16)
  {
    if (a1 > 24)
    {
      if (a1 == 33) {
        return @"UI";
      }
      if (a1 == 25) {
        return @"IN";
      }
    }
    else
    {
      if (a1 == 17) {
        return @"UT";
      }
      if (a1 == 21) {
        return @"DEF";
      }
    }
    return @"UNKNOWN";
  }
  if (!a1) {
    return @"UN";
  }
  if (a1 != 5)
  {
    if (a1 == 9) {
      return @"BG";
    }
    return @"UNKNOWN";
  }
  return @"MAINTENANCE";
}

uint64_t __PLSearchBackendInitialSuggestionsGetLog_block_invoke()
{
  PLSearchBackendInitialSuggestionsGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendInitialSuggestions");
  return MEMORY[0x1F41817F8]();
}

uint64_t PLMobileSlideShowPhotoLibraryTestingMode()
{
  if (PLMobileSlideShowPhotoLibraryTestingMode_onceToken != -1) {
    dispatch_once(&PLMobileSlideShowPhotoLibraryTestingMode_onceToken, &__block_literal_global_3810);
  }
  return PLMobileSlideShowPhotoLibraryTestingMode_sMobileSlideShowPhotoLibraryTestingMode;
}

uint64_t PLIsLockdownMode()
{
  if (PLIsLockdownMode_onceToken != -1) {
    dispatch_once(&PLIsLockdownMode_onceToken, &__block_literal_global_200);
  }
  return PLIsLockdownMode_isLockdownMode;
}

uint64_t PLIsEDUMode()
{
  if (PLIsEDUMode_onceToken != -1) {
    dispatch_once(&PLIsEDUMode_onceToken, &__block_literal_global_195_3936);
  }
  return PLIsEDUMode_isEDUMode;
}

uint64_t PLIsChinaSKU()
{
  if (PLIsChinaSKU_onceToken != -1) {
    dispatch_once(&PLIsChinaSKU_onceToken, &__block_literal_global_485);
  }
  return PLIsChinaSKU_isChinaSKU;
}

__n128 __copy_helper_block_e8_40n18_8_8_t0w1_s8_t16w32(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(id *)(a2 + 48);
  __n128 result = *(__n128 *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a1 + 72) = result;
  return result;
}

uint64_t __PLWindowSceneDelegateGetLog_block_invoke()
{
  PLWindowSceneDelegateGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "WindowSceneDelegate");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLUserStatusUIGetLog_block_invoke()
{
  PLUserStatusUIGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "UserStatusUI");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLUserStatusGetLog_block_invoke()
{
  PLUserStatusGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "UserStatus");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLUserSmartAlbumGetLog_block_invoke()
{
  PLUserSmartAlbumGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "UserSmartAlbum");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLUIGetLog_block_invoke()
{
  PLUIGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "UI");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLSyndicationUIGetLog_block_invoke()
{
  PLSyndicationUIGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "SyndicationUI");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLSharedLibraryGetLog_block_invoke()
{
  PLSharedLibraryGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "SharedLibrary");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLRequestGetLog_block_invoke()
{
  PLRequestGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Request");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPreferencesGetLog_block_invoke()
{
  PLPreferencesGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Preferences");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPhotoSharingGetLog_block_invoke()
{
  PLPhotoSharingGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "PhotoSharing");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPhotoKitGetLog_block_invoke()
{
  PLPhotoKitGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "PhotoKit");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPersistentHistoryGetLog_block_invoke()
{
  PLPersistentHistoryGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "PersistentHistory");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPPTGetLog_block_invoke()
{
  PLPPTGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "PPT");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLOneUpGetLog_block_invoke()
{
  PLOneUpGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "OneUp");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLMigrationGetLog_block_invoke()
{
  PLMigrationGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Migration");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLLemonadeGetLog_block_invoke()
{
  PLLemonadeGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Lemonade");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLImportantFetchGetLog_block_invoke()
{
  PLImportantFetchGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "ImportantFetch");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLImageManagerGetLog_block_invoke()
{
  PLImageManagerGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "ImageManager");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLGridInlinePlaybackGetLog_block_invoke()
{
  PLGridInlinePlaybackGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "GridInlinePlayback");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLGatekeeperXPCGetLog_block_invoke()
{
  PLGatekeeperXPCGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "GatekeeperXPC");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLFetchPerformanceGetLog_block_invoke()
{
  PLFetchPerformanceGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "FetchPerformance");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLDragAndDropGetLog_block_invoke()
{
  PLDragAndDropGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "DragAndDrop");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLCuratedLibraryGetLog_block_invoke()
{
  PLCuratedLibraryGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "CuratedLibrary");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLCacheMetricsCollectorGetLog_block_invoke()
{
  PLCacheMetricsCollectorGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "CacheMetricsCollector");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLAppIntentsGetLog_block_invoke()
{
  PLAppIntentsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "AppIntents");
  return MEMORY[0x1F41817F8]();
}

id PLUserSmartAlbumGetLog()
{
  if (PLUserSmartAlbumGetLog_predicate != -1) {
    dispatch_once(&PLUserSmartAlbumGetLog_predicate, &__block_literal_global_138_2600);
  }
  int v0 = (void *)PLUserSmartAlbumGetLog_log;
  return v0;
}

id PLSearchBackendQueryGetLog()
{
  if (PLSearchBackendQueryGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendQueryGetLog_predicate, &__block_literal_global_375);
  }
  int v0 = (void *)PLSearchBackendQueryGetLog_log;
  return v0;
}

id PLSearchBackendIndexManagerGetLog()
{
  if (PLSearchBackendIndexManagerGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendIndexManagerGetLog_predicate, &__block_literal_global_342);
  }
  int v0 = (void *)PLSearchBackendIndexManagerGetLog_log;
  return v0;
}

id PLOneUpGetLog()
{
  if (PLOneUpGetLog_predicate != -1) {
    dispatch_once(&PLOneUpGetLog_predicate, &__block_literal_global_195);
  }
  int v0 = (void *)PLOneUpGetLog_log;
  return v0;
}

id PLMigrationGetLog()
{
  if (PLMigrationGetLog_predicate != -1) {
    dispatch_once(&PLMigrationGetLog_predicate, &__block_literal_global_87);
  }
  int v0 = (void *)PLMigrationGetLog_log;
  return v0;
}

id PLLemonadeGetLog()
{
  if (PLLemonadeGetLog_predicate != -1) {
    dispatch_once(&PLLemonadeGetLog_predicate, &__block_literal_global_243);
  }
  int v0 = (void *)PLLemonadeGetLog_log;
  return v0;
}

id PLImportantFetchGetLog()
{
  if (PLImportantFetchGetLog_predicate != -1) {
    dispatch_once(&PLImportantFetchGetLog_predicate, &__block_literal_global_72);
  }
  int v0 = (void *)PLImportantFetchGetLog_log;
  return v0;
}

id PLAppIntentsGetLog()
{
  if (PLAppIntentsGetLog_predicate != -1) {
    dispatch_once(&PLAppIntentsGetLog_predicate, &__block_literal_global_276);
  }
  int v0 = (void *)PLAppIntentsGetLog_log;
  return v0;
}

BOOL PLIntegerResultWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  uint64_t v4 = v3[2](v3);

  os_unfair_lock_unlock(a1);
  return v4 != 0;
}

id PLClientBundleIdentifierFromXPCConnection(void *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = v1;
  if (!v1)
  {
    uint64_t v9 = 0;
    goto LABEL_16;
  }
  [v1 auditToken];
  CFStringRef v13 = 0;
  *(_OWORD *)buf = 0u;
  long long v19 = 0u;
  if (!CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    id v3 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v2;
      _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_DEFAULT, "%@ has no bundle identifier. Will fallback on process ID", buf, 0xCu);
    }

    int v4 = [v2 processIdentifier];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    *(_OWORD *)buf = 0u;
    long long v19 = 0u;
    if (proc_name(v4, buf, 0x100u))
    {
      CFStringRef v13 = CFStringCreateWithCString(0, (const char *)buf, 0x8000100u);
      if (v13) {
        goto LABEL_14;
      }
      id v5 = PLGatekeeperXPCGetLog();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_WORD *)uint64_t v14 = 0;
      uint64_t v6 = "Can't decypher process name";
      uint64_t v7 = v5;
      uint32_t v8 = 2;
    }
    else
    {
      id v5 = PLGatekeeperXPCGetLog();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v10 = __error();
      id v11 = strerror(*v10);
      *(_DWORD *)uint64_t v14 = 138412546;
      uint64_t v15 = v2;
      __int16 v16 = 2080;
      id v17 = v11;
      uint64_t v6 = "Can't get process name for %@: %s";
      uint64_t v7 = v5;
      uint32_t v8 = 22;
    }
    _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, v6, v14, v8);
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v9 = (void *)v13;
  if (!v13) {
    uint64_t v9 = (void *)CFRetain(@"anonymous");
  }
LABEL_16:

  return v9;
}

void PLDebugEnableCoreDataMultithreadedAsserts()
{
  if (!PFOSVariantHasInternalDiagnostics()) {
    return;
  }
  int v0 = (void *)MEMORY[0x19F38F510]();
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  int v2 = [v1 arguments];

  uint64_t v3 = [v2 indexOfObjectPassingTest:&__block_literal_global_242];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL || [v2 count] <= (unint64_t)(v3 + 1))
  {
    uint64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v7 removeObjectForKey:@"com.apple.CoreData.ConcurrencyDebug"];
  }
  else
  {
    int v4 = objc_msgSend(v2, "objectAtIndexedSubscript:");
    int v5 = [v4 intValue];

    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 removeObjectForKey:@"com.apple.CoreData.ConcurrencyDebug"];

    if (!v5) {
      goto LABEL_9;
    }
  }
  PLEnableCoreDataMultithreadedAsserts();
LABEL_9:
}

void pl_dispatch_source_set_event_handler(NSObject *a1, void *a2)
{
  id v3 = a2;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __pl_dispatch_source_set_event_handler_block_invoke;
  handler[3] = &unk_1E58A1920;
  id v6 = v3;
  id v4 = v3;
  dispatch_source_set_event_handler(a1, handler);
}

double PLPhysicalScreenSize()
{
  int v0 = MGGetSInt32Answer();
  int v1 = MGGetSInt32Answer();
  if (v0 != -1 && v1 != -1) {
    return (double)v1;
  }
  id v3 = [NSClassFromString((NSString *)@"UIScreen") mainScreen];
  [v3 nativeBounds];
  double v5 = v4;

  return v5;
}

void sub_19BD141A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BD14350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PLSafeRunWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  id v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2]();
  os_unfair_lock_unlock(a1);
}

void sub_19BD143CC(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_lock_unlock(v1);
  objc_exception_rethrow();
}

void sub_19BD143E0(_Unwind_Exception *a1)
{
}

__CFString *PLStringFromLibraryServicesState(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      __n128 result = @"none";
      break;
    case 1:
      __n128 result = @"initializing";
      break;
    case 2:
      __n128 result = @"unobtainable";
      break;
    case 3:
      __n128 result = @"prep-pre-migration";
      break;
    case 4:
      __n128 result = @"prep-migration";
      break;
    case 5:
      __n128 result = @"prep-post-migration";
      break;
    case 6:
      __n128 result = @"prep-accessible";
      break;
    case 7:
      __n128 result = @"running";
      break;
    case 8:
      __n128 result = @"terminating";
      break;
    default:
      if (a1 == 99) {
        __n128 result = @"error";
      }
      else {
        __n128 result = 0;
      }
      break;
  }
  return result;
}

void __destroy_helper_block_e8_48n4_8_s8(uint64_t a1)
{
}

__n128 __copy_helper_block_e8_48n18_8_8_t0w1_s8_t16w32(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(void *)(a1 + 56) = *(id *)(a2 + 56);
  __n128 result = *(__n128 *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t __PLStoryGetLog_block_invoke()
{
  PLStoryGetLog_log = (uint64_t)os_log_create("com.apple.photos.ui.story", "Story");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLContentPrivacyUIGetLog_block_invoke()
{
  PLContentPrivacyUIGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "ContentPrivacyUI");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLBoopGetLog_block_invoke()
{
  PLBoopGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Boop");
  return MEMORY[0x1F41817F8]();
}

id PLStoryGetLog()
{
  if (PLStoryGetLog_predicate != -1) {
    dispatch_once(&PLStoryGetLog_predicate, &__block_literal_global_237);
  }
  int v0 = (void *)PLStoryGetLog_log;
  return v0;
}

__CFString *PLLocalizedCountDescription(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v14 = @"PLLocalizedCountDescriptionVideosCommaItems";
        if (a4) {
          uint64_t v14 = @"PLLocalizedCountDescriptionVideosCommaItemsTitleCase";
        }
        uint64_t v15 = @"PLLocalizedCountDescriptionVideosAndItemsTitleCase";
        if (!a4) {
          uint64_t v15 = @"PLLocalizedCountDescriptionVideosAndItems";
        }
        if (a5) {
          __int16 v16 = v15;
        }
        else {
          __int16 v16 = v14;
        }
        id v17 = PLAssetsLibraryLocalizedFrameworkString(v16);
        uint64_t v37 = 0;
        __int16 v12 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v17, @"%lu %lu", &v37, a2, a3);
        id v18 = v37;
      }
      else
      {
        if (a4) {
          long long v26 = @"PLLocalizedCountDescriptionVideosTitleCase";
        }
        else {
          long long v26 = @"PLLocalizedCountDescriptionVideos";
        }
        id v17 = PLAssetsLibraryLocalizedFrameworkString(v26);
        v40 = 0;
        __int16 v12 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v17, @"%lu", &v40, a2);
        id v18 = v40;
      }
    }
    else
    {
      if (!a3)
      {
        if (a4) {
          uint64_t v34 = @"PLLocalizedCountDescriptionNoItemsTitleCase";
        }
        else {
          uint64_t v34 = @"PLLocalizedCountDescriptionNoItems";
        }
        __int16 v12 = PLAssetsLibraryLocalizedFrameworkString(v34);
        id v27 = 0;
        goto LABEL_54;
      }
      if (a4) {
        long long v25 = @"PLLocalizedCountDescriptionItemsTitleCase";
      }
      else {
        long long v25 = @"PLLocalizedCountDescriptionItems";
      }
      id v17 = PLAssetsLibraryLocalizedFrameworkString(v25);
      v39 = 0;
      __int16 v12 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v17, @"%lu", &v39, a3);
      id v18 = v39;
    }
    id v27 = v18;

    goto LABEL_54;
  }
  if (a2)
  {
    if (a3)
    {
      uint32_t v8 = @"PLLocalizedCountDescriptionPhotosCommaVideosCommaItems";
      if (a4) {
        uint32_t v8 = @"PLLocalizedCountDescriptionPhotosCommaVideosCommaItemsTitleCase";
      }
      uint64_t v9 = @"PLLocalizedCountDescriptionPhotosAndVideosAndItemsTitleCase";
      if (!a4) {
        uint64_t v9 = @"PLLocalizedCountDescriptionPhotosAndVideosAndItems";
      }
      if (a5) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v8;
      }
      id v11 = PLAssetsLibraryLocalizedFrameworkString(v10);
      v35 = 0;
      __int16 v12 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%lu %lu %lu", &v35, a1, a2, a3);
      CFStringRef v13 = v35;
    }
    else
    {
      long long v22 = @"PLLocalizedCountDescriptionPhotosCommaVideos";
      if (a4) {
        long long v22 = @"PLLocalizedCountDescriptionPhotosCommaVideosTitleCase";
      }
      long long v23 = @"PLLocalizedCountDescriptionPhotosAndVideosTitleCase";
      if (!a4) {
        long long v23 = @"PLLocalizedCountDescriptionPhotosAndVideos";
      }
      if (a5) {
        long long v24 = v23;
      }
      else {
        long long v24 = v22;
      }
      id v11 = PLAssetsLibraryLocalizedFrameworkString(v24);
      BOOL v38 = 0;
      __int16 v12 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%lu %lu", &v38, a1, a2);
      CFStringRef v13 = v38;
    }
  }
  else if (a3)
  {
    long long v19 = @"PLLocalizedCountDescriptionPhotosCommaItems";
    if (a4) {
      long long v19 = @"PLLocalizedCountDescriptionPhotosCommaItemsTitleCase";
    }
    long long v20 = @"PLLocalizedCountDescriptionPhotosAndItemsTitleCase";
    if (!a4) {
      long long v20 = @"PLLocalizedCountDescriptionPhotosAndItems";
    }
    if (a5) {
      long long v21 = v20;
    }
    else {
      long long v21 = v19;
    }
    id v11 = PLAssetsLibraryLocalizedFrameworkString(v21);
    v36 = 0;
    __int16 v12 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%lu %lu", &v36, a1, a3);
    CFStringRef v13 = v36;
  }
  else
  {
    if (a4) {
      long long v28 = @"PLLocalizedCountDescriptionPhotosTitleCase";
    }
    else {
      long long v28 = @"PLLocalizedCountDescriptionPhotos";
    }
    id v11 = PLAssetsLibraryLocalizedFrameworkString(v28);
    v41 = 0;
    __int16 v12 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%lu", &v41, a1);
    CFStringRef v13 = v41;
  }
  id v27 = v13;

LABEL_54:
  long long v29 = v12;
  id v30 = v27;
  long long v31 = v29;
  if (!v29)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "PLLocalizedCountDescription";
      __int16 v44 = 2112;
      id v45 = v30;
      _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error making validated localized string in %s: %@", buf, 0x16u);
    }
    long long v31 = &stru_1EEBF74F0;
  }

  long long v32 = v31;
  return v32;
}

id PLBoopGetLog()
{
  if (PLBoopGetLog_predicate != -1) {
    dispatch_once(&PLBoopGetLog_predicate, &__block_literal_global_231);
  }
  int v0 = (void *)PLBoopGetLog_log;
  return v0;
}

id PLAssetsLibraryLocalizedFrameworkString(void *a1)
{
  uint64_t v1 = _AssetsLibraryServicesFrameworkBundle_predicate;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_AssetsLibraryServicesFrameworkBundle_predicate, &__block_literal_global_611);
  }
  id v3 = [(id)_AssetsLibraryServicesFrameworkBundle__AssetsLibraryServicesFrameworkBundle localizedStringForKey:v2 value:&stru_1EEBF74F0 table:@"AssetsLibraryServices"];

  return v3;
}

BOOL setupUIGraphicsFunctions()
{
  if (setupUIGraphicsFunctions_onceToken != -1) {
    dispatch_once(&setupUIGraphicsFunctions_onceToken, &__block_literal_global_100);
  }
  BOOL result = 0;
  if (sUIGraphicsBeginImageContext
    && sUIGraphicsGetCurrentContext
    && sUIGraphicsGetImageFromCurrentImageContext
    && sUIGraphicsEndImageContext
    && sUIGraphicsPushContext
    && sUIGraphicsPopContext
    && s_UIImageJPEGRepresentation)
  {
    if (sUIImagePNGRepresentation) {
      return sUICreateCGImageFromIOSurface != 0;
    }
  }
  return result;
}

__IOSurface *PLCreateCGImageFromIOSurfaceScaledToSize(__IOSurface *a1, CVPixelBufferRef *a2, double a3, double a4)
{
  double v4 = a1;
  if (!a1) {
    return v4;
  }
  if (!setupUIGraphicsFunctions()) {
    return 0;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CVPixelBufferRef texture = 0;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CVReturn v9 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, 0, &pixelBufferOut);
  double v4 = 0;
  if (!v9)
  {
    if (VTPixelTransferSessionCreate(v8, &pixelTransferSessionOut)) {
      goto LABEL_5;
    }
    double v4 = 0;
    if (a3 <= 0.0 || a4 <= 0.0) {
      goto LABEL_6;
    }
    if (FigCreateIOSurfaceBackedCVPixelBuffer()
      || VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, texture))
    {
LABEL_5:
      double v4 = 0;
    }
    else
    {
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(texture);
      double v4 = (__IOSurface *)sUICreateCGImageFromIOSurface(IOSurface);
    }
  }
LABEL_6:
  uint64_t v10 = pixelBufferOut;
  if (a2)
  {
    *a2 = pixelBufferOut;
    CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v10 = 0;
  }
  CVPixelBufferRelease(v10);
  if (pixelTransferSessionOut) {
    CFRelease(pixelTransferSessionOut);
  }
  CVPixelBufferRelease(texture);
  return v4;
}

void __setupUIGraphicsFunctions_block_invoke()
{
  int v0 = [MEMORY[0x1E4F28B50] bundleForClass:NSClassFromString((NSString *)@"UIImage")];
  if (v0)
  {
    CFAllocatorRef v1 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id v4 = v0;
    CFURLRef v2 = [v0 bundleURL];
    id v3 = CFBundleCreate(v1, v2);

    int v0 = v4;
    if (v3)
    {
      sUIGraphicsBeginImageContext = CFBundleGetFunctionPointerForName(v3, @"UIGraphicsBeginImageContext");
      sUIGraphicsGetCurrentContext = CFBundleGetFunctionPointerForName(v3, @"UIGraphicsGetCurrentContext");
      sUIGraphicsGetImageFromCurrentImageContext = CFBundleGetFunctionPointerForName(v3, @"UIGraphicsGetImageFromCurrentImageContext");
      sUIGraphicsEndImageContext = CFBundleGetFunctionPointerForName(v3, @"UIGraphicsEndImageContext");
      sUIGraphicsPushContext = CFBundleGetFunctionPointerForName(v3, @"UIGraphicsPushContext");
      sUIGraphicsPopContext = CFBundleGetFunctionPointerForName(v3, @"UIGraphicsPopContext");
      s_UIImageJPEGRepresentation = CFBundleGetFunctionPointerForName(v3, @"_UIImageJPEGRepresentation");
      sUIImagePNGRepresentation = CFBundleGetFunctionPointerForName(v3, @"UIImagePNGRepresentation");
      sUICreateCGImageFromIOSurfaceRef IOSurface = (uint64_t (*)(void))CFBundleGetFunctionPointerForName(v3, @"UICreateCGImageFromIOSurface");
      CFRelease(v3);
      int v0 = v4;
    }
  }
}

uint64_t PLDeviceOrientationFromImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3) {
    return 1;
  }
  else {
    return (a1 + 1);
  }
}

uint64_t PLImageOrientationFromDeviceOrientation(int a1)
{
  uint64_t v1 = (a1 - 2);
  if (v1 < 3) {
    return v1 + 1;
  }
  else {
    return 0;
  }
}

uint64_t PLSensorOrientationFromCaptureOrientation(int a1, int a2)
{
  if (a2) {
    int v2 = 1;
  }
  else {
    int v2 = 2;
  }
  if (a2) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (a1 == 3) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 4;
  }
  if (a1 == 4) {
    unsigned int v4 = v2;
  }
  if (a1 == 2) {
    return 3;
  }
  else {
    return v4;
  }
}

uint64_t PLImageOrientationFromImageProperties(void *a1)
{
  id v1 = a1;
  uint64_t v2 = *MEMORY[0x1E4F2FCA0];
  int v3 = [v1 objectForKey:*MEMORY[0x1E4F2FCA0]];
  if (v3)
  {
    unsigned int v4 = v3;
    unsigned int v5 = [v3 intValue] - 1;
    if (v5 >= 8)
    {
LABEL_7:
      uint64_t v7 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = [v1 objectForKey:*MEMORY[0x1E4F2FD40]];
    unsigned int v4 = [v6 objectForKey:v2];

    if (!v4) {
      goto LABEL_7;
    }
    unsigned int v5 = [v4 intValue] - 1;
    if (v5 > 7) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = PLImageOrientationFromExifOrientation_orientationMapping[v5];
LABEL_8:

  return v7;
}

uint64_t PLImageOrientationFromExifOrientation(int a1)
{
  if ((a1 - 1) > 7) {
    return 0;
  }
  else {
    return PLImageOrientationFromExifOrientation_orientationMapping[a1 - 1];
  }
}

uint64_t PLExifOrientationFromImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6) {
    return 1;
  }
  else {
    return dword_19BDC6FA0[a1 - 1];
  }
}

uint64_t PLInverseExifOrientationFromImageOrientation(unint64_t a1)
{
  if (a1 > 7) {
    return 1;
  }
  else {
    return dword_19BDC6FBC[a1];
  }
}

BOOL PLExifOrientationSwapsWidthAndHeight(int a1)
{
  return a1 > 4;
}

BOOL PLIsRotatedExifOrientation(int a1)
{
  return a1 > 4;
}

uint64_t PLCaptureOrientationFromImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return 3;
  }
  else {
    return dword_19BDC6FDC[a1 - 1];
  }
}

BOOL PLFlipDimensionsForImageOrientation(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFALL) == 2;
}

CGImageSource *PLImageOrientationFromImageData(const __CFData *a1)
{
  id v1 = CGImageSourceCreateWithData(a1, 0);
  uint64_t v2 = _ImageOrientationFromImageSource(v1);
  if (v1) {
    CFRelease(v1);
  }
  return v2;
}

CGImageSource *_ImageOrientationFromImageSource(CGImageSource *result)
{
  if (result)
  {
    id v1 = result;
    CFDictionaryRef v2 = CGImageSourceCopyPropertiesAtIndex(result, 0, 0);
    if (!v2) {
      CFDictionaryRef v2 = CGImageSourceCopyPropertiesAtIndex(v1, 0, (CFDictionaryRef)&unk_1EEC14DB0);
    }
    uint64_t v3 = PLImageOrientationFromImageProperties(v2);

    return (CGImageSource *)v3;
  }
  return result;
}

BOOL PLImageOrientationIsMirrored(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFCLL) == 4;
}

uint64_t PLUnmirroredImageOrientation(uint64_t result)
{
  if ((unint64_t)(result - 5) >= 3) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = result - 4;
  }
  if ((result & 0xFFFFFFFFFFFFFFFCLL) == 4) {
    return v1;
  }
  return result;
}

uint64_t PLMirroredImageOrientation(uint64_t result)
{
  uint64_t v1 = 4;
  if ((unint64_t)(result - 1) < 3) {
    uint64_t v1 = result + 4;
  }
  if ((result & 0xFFFFFFFFFFFFFFFCLL) != 4) {
    return v1;
  }
  return result;
}

uint64_t PLTransformForImageOrientation@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  switch(result)
  {
    case 1:
      unint64_t v2 = 0xBFF0000000000000;
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      goto LABEL_8;
    case 2:
      _Q0 = xmmword_19BDC6EB0;
      goto LABEL_11;
    case 3:
      _Q0 = xmmword_19BDC6EA0;
      goto LABEL_11;
    case 4:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      unint64_t v2 = 0x3FF0000000000000;
      goto LABEL_8;
    case 5:
      *(void *)a2 = 0x3FF0000000000000;
      *(void *)(a2 + 8) = 0;
      unint64_t v2 = 0xBFF0000000000000;
LABEL_8:
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = v2;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
      return result;
    case 6:
      __asm { FMOV            V0.2D, #1.0; jumptable 000000019BD1624C case 6 }
      goto LABEL_11;
    case 7:
      __asm { FMOV            V0.2D, #-1.0; jumptable 000000019BD1624C case 7 }
LABEL_11:
      *(_OWORD *)(a2 + 8) = _Q0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
      *(void *)(a2 + 24) = 0;
      break;
    default:
      uint64_t v3 = MEMORY[0x1E4F1DAB8];
      long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)a2 = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)(a2 + 16) = v4;
      *(_OWORD *)(a2 + 32) = *(_OWORD *)(v3 + 32);
      break;
  }
  return result;
}

uint64_t PLImageOrientationRotatedByDegrees(uint64_t a1, float a2)
{
  if ((a1 & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    if (a1 != 5)
    {
      if (a1 != 6)
      {
        if (a1 == 7)
        {
          if (a2 < 0.0) {
            a2 = a2 + 360.0;
          }
          int v2 = (int)(a2 / 90.0);
          goto LABEL_13;
        }
        int v3 = 0;
        if (a2 < 0.0) {
          a2 = a2 + 360.0;
        }
        int v2 = (int)(a2 / 90.0);
        goto LABEL_26;
      }
      if (a2 < 0.0) {
        a2 = a2 + 360.0;
      }
      int v2 = (int)(a2 / 90.0);
LABEL_21:
      int v3 = 3;
      goto LABEL_26;
    }
    if (a2 < 0.0) {
      a2 = a2 + 360.0;
    }
    int v2 = (int)(a2 / 90.0);
LABEL_17:
    int v3 = 2;
    goto LABEL_26;
  }
  if (a2 < 0.0) {
    a2 = a2 + 360.0;
  }
  int v2 = (int)(a2 / 90.0);
  switch(a1)
  {
    case 1:
      goto LABEL_17;
    case 2:
      goto LABEL_21;
    case 3:
LABEL_13:
      int v3 = 1;
      goto LABEL_26;
  }
  int v3 = 0;
LABEL_26:
  BOOL v4 = __OFADD__(v3, v2);
  int v5 = v3 + v2;
  if (v5 < 0 != v4) {
    v5 += 4;
  }
  int v6 = v5 & 3;
  int v8 = -v5;
  BOOL v7 = v8 < 0;
  int v9 = v8 & 3;
  if (v7) {
    int v10 = v6;
  }
  else {
    int v10 = -v9;
  }
  uint64_t v11 = PLImageOrientationRotatedByDegrees_orientations[v10];
  uint64_t v12 = 4;
  if ((unint64_t)(v11 - 1) < 3) {
    uint64_t v12 = v11 + 4;
  }
  if ((a1 & 0xFFFFFFFFFFFFFFFCLL) == 4) {
    return v12;
  }
  else {
    return v11;
  }
}

uint64_t PLExifOrientationForSensorOrientation(int a1)
{
  if ((a1 - 2) > 2) {
    return 6;
  }
  else {
    return dword_19BDC7004[a1 - 2];
  }
}

void PLAddTIFFDPIPropertiesToDictionary(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x1E4F28ED0];
  id v2 = a1;
  id v3 = (id)[[v1 alloc] initWithInt:72];
  [v2 setObject:v3 forKey:*MEMORY[0x1E4F2FDA8]];
  [v2 setObject:v3 forKey:*MEMORY[0x1E4F2FDB8]];
}

CFStringRef PLCreateEXIFDateString(void *a1, void *a2)
{
  CFDateRef v3 = a1;
  BOOL v4 = a2;
  int v5 = CFDateFormatterCreate(0, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (v5)
  {
    int v6 = v5;
    CFDateFormatterSetFormat(v5, v4);
    CFStringRef StringWithDate = CFDateFormatterCreateStringWithDate(0, v6, v3);
    CFRelease(v6);
  }
  else
  {
    CFStringRef StringWithDate = 0;
  }

  return StringWithDate;
}

id PLCreationDateFromImageProperties(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];
  CFDateRef v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F2F7F0]];
    int v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F950]];
    if (v4
      || ([v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F7E8]],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2F948]],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          v5,
          int v5 = (void *)v6,
          v4))
    {
LABEL_8:
      if (PLEXIFDateFormatter_onceToken != -1) {
        dispatch_once(&PLEXIFDateFormatter_onceToken, &__block_literal_global_92);
      }
      int v8 = [(id)PLEXIFDateFormatter__dateFormatter dateFromString:v4];
      if (v8 && [v5 length])
      {
        int v10 = [NSString stringWithFormat:@"0.%@", v5];

        [v10 doubleValue];
        if (v11 <= 0.0 || v11 >= 1.0)
        {
          int v9 = (void *)v4;
          int v5 = v10;
        }
        else
        {
          uint64_t v12 = objc_msgSend(v8, "dateByAddingTimeInterval:");

          int v9 = (void *)v4;
          int v5 = v10;
          int v8 = (void *)v12;
        }
      }
      else
      {
        int v9 = (void *)v4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    int v5 = 0;
  }
  BOOL v7 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
  int v8 = v7;
  if (!v7)
  {
    int v9 = 0;
    goto LABEL_18;
  }
  uint64_t v4 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F2FD38]];

  int v5 = 0;
  int v9 = 0;
  int v8 = 0;
  if (v4) {
    goto LABEL_8;
  }
LABEL_18:
  id v13 = v8;

  return v13;
}

void __PLEXIFDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)PLEXIFDateFormatter__dateFormatter;
  PLEXIFDateFormatter__dateFormatter = (uint64_t)v0;

  [(id)PLEXIFDateFormatter__dateFormatter setTimeStyle:0];
  [(id)PLEXIFDateFormatter__dateFormatter setDateStyle:0];
  [(id)PLEXIFDateFormatter__dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
  id v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)PLEXIFDateFormatter__dateFormatter setLocale:v2];

  id v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:@"en_US_POSIX"];
  [(id)PLEXIFDateFormatter__dateFormatter setCalendar:v3];
}

uint64_t PLPhysicalDeviceIsIPad()
{
  return PLPhysicalDeviceIsIPad___isIPad;
}

void __PLPhysicalDeviceIsIPad_block_invoke()
{
  id v0 = (const void *)MGCopyAnswer();
  PLPhysicalDeviceIsIPad___isIPad = CFEqual(v0, @"iPad") != 0;
  if (v0)
  {
    CFRelease(v0);
  }
}

__IOSurface *PLCreateCGImageFromIOSurface(__IOSurface *a1)
{
  double Width = (double)IOSurfaceGetWidth(a1);
  double Height = (double)IOSurfaceGetHeight(a1);
  return PLCreateCGImageFromIOSurfaceScaledToSize(a1, 0, Width, Height);
}

__IOSurface *PLCreateCGImageFromIOSurfaceBackedUIImage(void *a1)
{
  id v1 = (__IOSurface *)[a1 ioSurface];
  return PLCreateCGImageFromIOSurface(v1);
}

uint64_t PLCreateImageFromPreviewImageSurface(__IOSurface *a1)
{
  return PLCreateImageAndJPEGDataFromPreviewImageSurface(a1, 0);
}

uint64_t PLCreateImageAndJPEGDataFromPreviewImageSurface(__IOSurface *a1, uint64_t a2)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = setupUIGraphicsFunctions();
  uint64_t v5 = 0;
  if (!a1 || !v4) {
    return v5;
  }
  CVPixelBufferRef texture = 0;
  size_t Width = IOSurfaceGetWidth(a1);
  +[PLAssetFormatsCore scaledSizeForSize:format:capLength:](PLAssetFormatsCore, "scaledSizeForSize:format:capLength:", +[PLAssetFormatsCore masterThumbnailFormat], 1, (double)Width, (double)IOSurfaceGetHeight(a1));
  if ((double)Width / v7 <= 4.0)
  {
    int v12 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, 0, &texture);
    id v13 = texture;
    goto LABEL_25;
  }
  *(void *)destinationBuffer = 0;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CVReturn v9 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a1, 0, &pixelBufferOut);
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = pixelBufferOut == 0;
  }
  if (v10
    || ((CVReturn v9 = VTPixelTransferSessionCreate(v8, &pixelTransferSessionOut)) == 0
      ? (BOOL v11 = pixelTransferSessionOut == 0)
      : (BOOL v11 = 1),
        v11))
  {
    int v12 = v9;
    id v13 = 0;
    uint64_t v14 = 0;
    goto LABEL_23;
  }
  int IOSurfaceBackedCVPixelBuffer = FigCreateIOSurfaceBackedCVPixelBuffer();
  uint64_t v14 = *(__CVBuffer **)destinationBuffer;
  if (IOSurfaceBackedCVPixelBuffer) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = *(void *)destinationBuffer == 0;
  }
  if (v16)
  {
    int v12 = IOSurfaceBackedCVPixelBuffer;
LABEL_22:
    id v13 = 0;
    goto LABEL_23;
  }
  OSStatus v17 = VTPixelTransferSessionTransferImage(pixelTransferSessionOut, pixelBufferOut, *(CVPixelBufferRef *)destinationBuffer);
  int v12 = v17;
  uint64_t v14 = *(__CVBuffer **)destinationBuffer;
  if (v17) {
    goto LABEL_22;
  }
  id v13 = CVPixelBufferRetain(*(CVPixelBufferRef *)destinationBuffer);
  CVPixelBufferRef texture = v13;
  uint64_t v14 = *(__CVBuffer **)destinationBuffer;
LABEL_23:
  CVPixelBufferRelease(v14);
  CVPixelBufferRelease(pixelBufferOut);
  if (pixelTransferSessionOut) {
    CFRelease(pixelTransferSessionOut);
  }
LABEL_25:
  if (v12) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v13 == 0;
  }
  if (v18)
  {
    long long v19 = 0;
    uint64_t v5 = 0;
    goto LABEL_45;
  }
  *(void *)destinationBuffer = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  int v12 = VTImageRotationSessionCreate();
  long long v19 = 0;
  CVPixelBufferRef v20 = pixelBufferOut;
  if (!v12 && pixelBufferOut)
  {
    VTSessionSetProperty(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F44FF0], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
    int IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
    if (IOSurfaceBackedCVPixelBufferWithAttributes) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = *(void *)destinationBuffer == 0;
    }
    if (v22 || (int IOSurfaceBackedCVPixelBufferWithAttributes = MEMORY[0x19F38EE00](pixelBufferOut, texture)) != 0)
    {
      int v12 = IOSurfaceBackedCVPixelBufferWithAttributes;
      long long v19 = 0;
    }
    else
    {
      long long v25 = CVPixelBufferRetain(*(CVPixelBufferRef *)destinationBuffer);
      long long v19 = v25;
      if (v25)
      {
        IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v25);
        uint64_t v5 = sUICreateCGImageFromIOSurface(IOSurface);
        int v12 = 0;
        if (a2 && IOSurface)
        {
          uint64_t v27 = *MEMORY[0x1E4F56158];
          v40[0] = &unk_1EEC14440;
          uint64_t v28 = *MEMORY[0x1E4F56150];
          v39[0] = v27;
          v39[1] = v28;
          uint64_t v37 = *MEMORY[0x1E4F56358];
          BOOL v38 = &unk_1EEC14DA0;
          long long v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          v40[1] = v29;
          id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];

          int v12 = PFFigJPEGDataFromImage();
        }
LABEL_40:
        CVPixelBufferRef v20 = pixelBufferOut;
        if (!pixelBufferOut) {
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      int v12 = 0;
    }
    uint64_t v5 = 0;
    goto LABEL_40;
  }
  uint64_t v5 = 0;
  if (pixelBufferOut) {
LABEL_43:
  }
    CFRelease(v20);
LABEL_44:
  CVPixelBufferRelease(*(CVPixelBufferRef *)destinationBuffer);
  id v13 = texture;
LABEL_45:
  CVPixelBufferRelease(v13);
  CVPixelBufferRelease(v19);
  if (v12)
  {
    long long v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)destinationBuffer = 136315394;
      *(void *)&destinationBuffer[4] = "CGImageRef PLCreateImageAndJPEGDataFromPreviewImageSurface(CFTypeRef, NSData *_"
                                         "_autoreleasing *, UIImageOrientation)";
      __int16 v35 = 2048;
      uint64_t v36 = v12;
      _os_log_impl(&dword_19BCFB000, v23, OS_LOG_TYPE_DEFAULT, "%s error %ld", destinationBuffer, 0x16u);
    }
  }
  return v5;
}

id PLCreateJPEGDataFromPreviewImageSurface(IOSurfaceRef surface, unint64_t a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (!surface)
  {
    id v6 = 0;
    goto LABEL_33;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v3 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], surface, 0, &pixelBufferOut);
  BOOL v4 = pixelBufferOut;
  if (pixelBufferOut) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    if (a2 > 7) {
      goto LABEL_25;
    }
    if (((1 << a2) & 0x22) != 0)
    {
      int v7 = 1;
    }
    else if (((1 << a2) & 0x44) != 0)
    {
      int v7 = 0;
    }
    else
    {
      if (((1 << a2) & 0x88) == 0) {
        goto LABEL_25;
      }
      int v7 = 0;
    }
    texture[0] = 0;
    CFAllocatorRef v8 = 0;
    if (!VTImageRotationSessionCreate())
    {
      VTSessionSetProperty(0, (CFStringRef)*MEMORY[0x1E4F44FF0], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
      if (v7)
      {
        CVPixelBufferGetWidth(pixelBufferOut);
        CVPixelBufferGetHeight(pixelBufferOut);
      }
      else
      {
        CVPixelBufferGetHeight(pixelBufferOut);
        CVPixelBufferGetWidth(pixelBufferOut);
      }
      CVPixelBufferGetPixelFormatType(pixelBufferOut);
      CFAllocatorRef v8 = 0;
      if (!FigCreateIOSurfaceBackedCVPixelBufferWithAttributes())
      {
        if (MEMORY[0x19F38EE00](0, pixelBufferOut, texture[0])) {
          CFAllocatorRef v8 = 0;
        }
        else {
          CFAllocatorRef v8 = CVPixelBufferRetain(texture[0]);
        }
      }
    }
    CVPixelBufferRelease(texture[0]);
    if (v8) {
      goto LABEL_26;
    }
    BOOL v4 = pixelBufferOut;
LABEL_25:
    CFAllocatorRef v8 = CVPixelBufferRetain(v4);
    if (!v8)
    {
      id v6 = 0;
LABEL_31:
      CVPixelBufferRelease(v8);
      BOOL v4 = pixelBufferOut;
      goto LABEL_32;
    }
LABEL_26:
    uint64_t v9 = *MEMORY[0x1E4F56158];
    v21[0] = &unk_1EEC14440;
    uint64_t v10 = *MEMORY[0x1E4F56150];
    v20[0] = v9;
    v20[1] = v10;
    uint64_t v18 = *MEMORY[0x1E4F56358];
    long long v19 = &unk_1EEC14DA0;
    BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[1] = v11;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    int v13 = PFFigJPEGDataFromImage();
    id v6 = 0;
    if (v13)
    {
      uint64_t v14 = PLBackendGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(texture[0]) = 136315138;
        *(CVPixelBufferRef *)((char *)texture + 4) = (CVPixelBufferRef)"NSData *PLCreateJPEGDataFromPreviewImageSurface(C"
                                                                       "FTypeRef, UIImageOrientation)";
        _os_log_impl(&dword_19BCFB000, v14, OS_LOG_TYPE_ERROR, "Error received from PFFigJPEGDataFromImage() in %s", (uint8_t *)texture, 0xCu);
      }
    }
    goto LABEL_31;
  }
  id v6 = 0;
LABEL_32:
  CVPixelBufferRelease(v4);
LABEL_33:
  return v6;
}

double DCIMScaledSizeForFormat(uint64_t a1, double a2, double a3)
{
  +[PLAssetFormatsCore sizeForFormat:a1];
  return PLScaledSizeWithinSizeCore(a2, a3, v5, v6);
}

id PLCreateScaledImageFromImage(void *a1, void *a2, uint64_t a3, void *a4, CGFloat a5, CGFloat a6)
{
  id v11 = a1;
  id v12 = a2;
  BOOL v13 = setupUIGraphicsFunctions();
  id v14 = 0;
  if (v11 && v13)
  {
    BOOL v15 = a3 == 1;
    if (a3 == 1) {
      int v16 = 2;
    }
    else {
      int v16 = 4;
    }
    if (v15) {
      size_t v17 = 5;
    }
    else {
      size_t v17 = 8;
    }
    if (v15) {
      uint32_t v18 = 4102;
    }
    else {
      uint32_t v18 = 2;
    }
    double v19 = PLScaledImageSizeForPLImage(v11);
    CGFloat v21 = v20;
    int v22 = ((int)(a5 * (double)v16) + 8 * v16 - 1) / (8 * v16) * 8 * v16;
    CGFloat v24 = *MEMORY[0x1E4F1DAD8];
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    long long v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)(a6 * (double)v22)];
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v27 = v25;
    uint64_t v28 = CGBitmapContextCreate((void *)[v27 mutableBytes], (unint64_t)a5, (unint64_t)a6, v17, v22, DeviceRGB, v18);
    CGContextTranslateCTM(v28, 0.0, a6);
    CGContextScaleCTM(v28, 1.0, -1.0);
    CGAffineTransformMakeScale(&v31, 1.0, -1.0);
    CGContextSetBaseCTM();
    sUIGraphicsPushContext(v28);
    id v30 = 0;
    PLCreateCroppedImageInContextFromImageWithQuality(v11, v12, v28, kCGInterpolationHigh, &v30, v24, v23, v19, v21, a5, a6);
    id v14 = v30;
    sUIGraphicsPopContext(v14);
    CGContextRelease(v28);
    CGColorSpaceRelease(DeviceRGB);
    if (a4) {
      *a4 = v27;
    }
  }
  return v14;
}

double PLScaledImageSizeForPLImage(void *a1)
{
  id v1 = a1;
  double v2 = DCIM_sizeFromPLImage(v1);
  double v3 = DCIM_scaleFromPLImage(v1);

  return v2 * v3;
}

void PLCreateCroppedImageInContextFromImageWithQuality(void *a1, void *a2, CGContext *a3, CGInterpolationQuality a4, void *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11)
{
  id v19 = a1;
  id v20 = a2;
  CGContextSaveGState(a3);
  if (a4) {
    CGContextSetInterpolationQuality(a3, a4);
  }
  CGContextTranslateCTM(a3, 0.0, a11);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGFloat v21 = [NSClassFromString((NSString *)@"UIColor") blackColor];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v21 CGColor]);
  v54.origin.x = 0.0;
  v54.origin.y = 0.0;
  v54.size.width = a10;
  v54.size.height = a11;
  CGContextFillRect(a3, v54);
  double v48 = a10 * 0.5;
  CGContextTranslateCTM(a3, a10 * 0.5, a11 * 0.5);
  float v22 = a10 / a8;
  float v23 = a11 / a9;
  CGContextScaleCTM(a3, v22, v23);
  double v52 = a10;
  double v49 = a10 * -0.5;
  CGContextTranslateCTM(a3, a10 * -0.5, a11 * -0.5);
  double v24 = PLScaledImageSizeForPLImage(v19);
  double v26 = v25;
  v55.origin.x = a6;
  v55.origin.y = a7;
  v55.size.width = a8;
  v55.size.height = a9;
  double MidX = CGRectGetMidX(v55);
  v56.origin.x = a6;
  v56.origin.y = a7;
  v56.size.width = a8;
  v56.size.height = a9;
  CGFloat MidY = CGRectGetMidY(v56);
  float v29 = v24 * 0.5 - MidX;
  float v30 = MidY + v26 * -0.5;
  CGContextTranslateCTM(a3, v29, v30);
  unint64_t v31 = [v19 imageOrientation] - 1;
  if (v31 >= 7)
  {
    uint64_t v36 = (CGFloat *)MEMORY[0x1E4F1DAB8];
    uint64_t v34 = (CGFloat *)(MEMORY[0x1E4F1DAB8] + 8);
    long long v33 = (CGFloat *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v32 = (CGFloat *)(MEMORY[0x1E4F1DAB8] + 24);
    CGFloat v35 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
    CGFloat v37 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
  }
  else
  {
    long long v32 = (CGFloat *)((char *)&unk_19BDC7010 + 8 * v31);
    long long v33 = (CGFloat *)((char *)&unk_19BDC7048 + 8 * v31);
    uint64_t v34 = (CGFloat *)((char *)&unk_19BDC7080 + 8 * v31);
    CGFloat v35 = 0.0;
    uint64_t v36 = (CGFloat *)((char *)&unk_19BDC70B8 + 8 * v31);
    CGFloat v37 = 0.0;
  }
  CGFloat v38 = *v36;
  CGFloat v39 = *v34;
  CGFloat v40 = *v33;
  CGFloat v41 = *v32;
  CGContextTranslateCTM(a3, v48, a11 * 0.5);
  transform.a = v38;
  transform.b = v39;
  transform.c = v40;
  transform.d = v41;
  transform.tx = v35;
  transform.ty = v37;
  CGContextConcatCTM(a3, &transform);
  CGContextTranslateCTM(a3, v49, a11 * -0.5);
  id v42 = v19;
  v43 = (CGImage *)[v42 CGImage];
  CGFloat Width = (double)CGImageGetWidth(v43);
  v57.size.height = (double)CGImageGetHeight(v43);
  v57.origin.x = (v52 - Width) * 0.5;
  v57.origin.y = (a11 - v57.size.height) * 0.5;
  v57.size.width = Width;
  CGContextDrawImage(a3, v57, v43);
  CGContextRestoreGState(a3);
  if (v20)
  {
    CGContextSaveGState(a3);
    [v20 frame];
    CGContextTranslateCTM(a3, v45, v46);
    [v20 renderInContext:a3];
    CGContextRestoreGState(a3);
  }
  if (a5)
  {
    Image = CGBitmapContextCreateImage(a3);
    *a5 = (id)[objc_alloc(NSClassFromString((NSString *)@"UIImage")) initWithCGImage:Image scale:0 orientation:1.0];
    CGImageRelease(Image);
  }
}

double DCIM_sizeFromPLImage(void *a1)
{
  id v1 = a1;
  double v2 = v1;
  if (v1)
  {
    [v1 size];
    double v4 = v3;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
  }

  return v4;
}

double DCIM_scaleFromPLImage(void *a1)
{
  id v1 = a1;
  NSClassFromString((NSString *)@"UIImage");
  double v2 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    [v1 scale];
    double v2 = v3;
  }

  return v2;
}

uint64_t PLSubsampleFactorForImageSizeScaledToSize(double a1, double a2, double a3, double a4)
{
  int v4 = (int)a2;
  if ((int)a2 <= (int)a1) {
    int v4 = (int)a1;
  }
  if (a3 >= a4) {
    double v5 = a3;
  }
  else {
    double v5 = a4;
  }
  float v6 = floor(log2((double)(int)((double)v4 / v5)));
  int v7 = (int)exp2f(v6);
  if (v7 >= 32) {
    int v7 = 32;
  }
  if (v7 <= 1) {
    return 1;
  }
  else {
    return v7;
  }
}

id PLCreateImageWithFormatFromImage(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a1;
  double v11 = DCIM_sizeFromPLImage(v10);
  double v13 = v12;
  +[PLAssetFormatsCore sizeForFormat:a3];
  double v16 = PLScaledSizeWithinSizeCore(v11, v13, v14, v15);
  id v18 = PLCreateScaledImageFromImage(v10, v9, a4, a5, v16, v17);

  return v18;
}

double PLSquareCropRectForSize(double a1, double a2)
{
  BOOL v2 = a1 > a2;
  if (a1 >= a2) {
    double v3 = a2;
  }
  else {
    double v3 = a1;
  }
  float v4 = v3;
  float v5 = (a1 - v4) * 0.5;
  double result = rintf(v5);
  if (!v2) {
    return 0.0;
  }
  return result;
}

uint64_t DCIM_CGImageRefFromPLImage(void *a1)
{
  id v1 = a1;
  return [v1 CGImage];
}

id PLCreateCroppedImageFromImageWithQuality(void *a1, CGInterpolationQuality a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7, CGFloat a8)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  if (!v15)
  {
LABEL_7:
    id v18 = 0;
    goto LABEL_8;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGFloat v17 = CGBitmapContextCreate(0, (unint64_t)a7, (unint64_t)a8, 8uLL, vcvtd_n_u64_f64(a7, 2uLL), DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  if (!v17)
  {
    id v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      float v23 = "PLImage *PLCreateCroppedImageFromImageWithQuality(PLImage *__strong, CGRect, CGSize, CGInterpolationQuality)";
      _os_log_impl(&dword_19BCFB000, v19, OS_LOG_TYPE_ERROR, "%s: failed to create context", buf, 0xCu);
    }

    goto LABEL_7;
  }
  CGContextTranslateCTM(v17, 0.0, a8);
  CGContextScaleCTM(v17, 1.0, -1.0);
  id v21 = 0;
  PLCreateCroppedImageInContextFromImageWithQuality(v15, 0, v17, a2, &v21, a3, a4, a5, a6, a7, a8);
  id v18 = v21;
  CGContextRelease(v17);
LABEL_8:

  return v18;
}

id PLCreateCroppedImageFromImage(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, CGFloat a7)
{
  return PLCreateCroppedImageFromImageWithQuality(a1, kCGInterpolationDefault, a2, a3, a4, a5, a6, a7);
}

id DCIM_newPLImageWithContentsOfFileURL(void *a1, int a2)
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    BOOL v2 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v3 = *MEMORY[0x1E4F2FE58];
    v20[0] = *MEMORY[0x1E4F2FE68];
    uint64_t v4 = *MEMORY[0x1E4F2FE60];
    v19[0] = v3;
    v19[1] = v4;
    uint64_t v17 = *MEMORY[0x1E4F2F360];
    uint64_t v18 = MEMORY[0x1E4F1CC38];
    float v5 = (void *)MEMORY[0x1E4F1C9E8];
    CFURLRef v6 = a1;
    int v7 = [v5 dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v20[1] = v7;
    CFAllocatorRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    CFDictionaryRef v9 = [v2 dictionaryWithDictionary:v8];

    id v10 = CGImageSourceCreateWithURL(v6, 0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, v9);
    double v12 = _ImageOrientationFromImageSource(v10);
    double v13 = (void *)[objc_alloc(NSClassFromString((NSString *)@"UIImage")) initWithCGImage:ImageAtIndex scale:v12 orientation:1.0];
    CGImageRelease(ImageAtIndex);
    if (v10) {
      CFRelease(v10);
    }
  }
  else
  {
    id v14 = a1;
    id v15 = [v14 path];

    double v13 = DCIM_newPLImageWithContentsOfFile(v15);
  }
  return v13;
}

uint64_t DCIM_NSStringFromCGAffineTransform(void *a1)
{
  return [NSString stringWithFormat:@"{%0.2f, %0.2f, %0.2f, %0.2f, %0.2f, %0.2f}", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]];
}

double DCIM_sizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double DCIM_sizeScaleToFillSize(double a1, double a2, double a3, double a4)
{
  return fmax(a3 / a1, a4 / a2);
}

double DCIM_sizeScaleToFitSize(double a1, double a2, double a3, double a4)
{
  return fmin(a3 / a1, a4 / a2);
}

id DCIM_scaleImageFromURL(void *a1, double a2, double a3)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (v5)
  {
    uint64_t v23 = *MEMORY[0x1E4F562A8];
    if (a2 >= a3) {
      double v6 = a2;
    }
    else {
      double v6 = a3;
    }
    int v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:v6];
    v24[0] = v7;
    CFAllocatorRef v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

    CFDictionaryRef v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5];
    int CGImageFromImageData = PFFigCreateCGImageFromImageData();
    if (CGImageFromImageData)
    {
      double v11 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v18 = "PLImage *DCIM_scaleImageFromURL(NSURL *__strong, CGSize, UIImageOrientation)";
        __int16 v19 = 2048;
        uint64_t v20 = CGImageFromImageData;
        __int16 v21 = 2112;
        id v22 = v5;
        _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_DEFAULT, "PFFigCreateCGImageFromImageData %s returned %ld from %@", buf, 0x20u);
      }
    }
    double v12 = [v5 path];
    double v13 = DCIM_newPLImageWithContentsOfFile(v12);

    id v14 = DCIM_resizedImage(v13, a2, a3);

    id v15 = v14;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

id DCIM_resizedImage(void *a1, double a2, double a3)
{
  id v5 = a1;
  if (v5 && setupUIGraphicsFunctions())
  {
    double v6 = (void (*)(double, double))sUIGraphicsBeginImageContext;
    id v7 = v5;
    v6(a2, a3);
    objc_msgSend(v7, "drawInRect:", 0.0, 0.0, a2, a3);

    CFAllocatorRef v8 = sUIGraphicsGetImageFromCurrentImageContext();
    sUIGraphicsEndImageContext();
  }
  else
  {
    CFAllocatorRef v8 = 0;
  }

  return v8;
}

uint64_t DCIM_blackColorRef()
{
  id v0 = [NSClassFromString((NSString *)@"UIColor") blackColor];
  uint64_t v1 = [v0 CGColor];

  return v1;
}

uint64_t DCIM_blackColor()
{
  Class v0 = NSClassFromString((NSString *)@"UIColor");
  return [(objc_class *)v0 blackColor];
}

uint64_t DCIM_whiteColor()
{
  Class v0 = NSClassFromString((NSString *)@"UIColor");
  return [(objc_class *)v0 whiteColor];
}

uint64_t DCIM_redColor()
{
  Class v0 = NSClassFromString((NSString *)@"UIColor");
  return [(objc_class *)v0 redColor];
}

uint64_t DCIM_greenColor()
{
  Class v0 = NSClassFromString((NSString *)@"UIColor");
  return [(objc_class *)v0 greenColor];
}

uint64_t DCIM_blueColor()
{
  Class v0 = NSClassFromString((NSString *)@"UIColor");
  return [(objc_class *)v0 blueColor];
}

id DCIM_resolvedPlaceholderImageColor()
{
  Class v0 = [NSClassFromString((NSString *)@"UIScreen") mainScreen];
  uint64_t v1 = [NSClassFromString((NSString *)@"UIColor") systemBackgroundColor];
  BOOL v2 = [NSClassFromString((NSString *)@"UIColor") quaternarySystemFillColor];
  uint64_t v3 = [v1 _colorBlendedWithColor:v2];
  uint64_t v4 = [v0 traitCollection];
  id v5 = [v3 resolvedColorWithTraitCollection:v4];

  return v5;
}

__CFString *DCIM_NSStringFromCGRect(double a1, double a2, double a3, double a4)
{
  uint64_t v4 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{{%.*g, %.*g}, {%.*g, %.*g}}", 17, *(void *)&a1, 17, *(void *)&a2, 17, *(void *)&a3, 17, *(void *)&a4);
  return v4;
}

uint64_t DCIM_newResizablePLImageWithCGImage(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3 = (void *)[objc_alloc(NSClassFromString((NSString *)@"UIImage")) initWithCGImage:a1 scale:a2 orientation:a3];
  uint64_t v4 = objc_msgSend(v3, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);

  return v4;
}

uint64_t DCIM_newPLImageWithData(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [objc_alloc(NSClassFromString((NSString *)@"UIImage")) initWithData:v1];

  return v2;
}

uint64_t DCIM_newPLImageWithIOSurface(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(NSClassFromString((NSString *)@"UIImage"));
  return [v4 _initWithIOSurface:a1 imageOrientation:a2];
}

uint64_t DCIM_boldSystemFontOfSize(double a1)
{
  Class v2 = NSClassFromString((NSString *)@"UIFont");
  return [(objc_class *)v2 boldSystemFontOfSize:a1];
}

double DCIM_boundsFromMainScreen()
{
  Class v0 = [NSClassFromString((NSString *)@"UIScreen") mainScreen];
  id v1 = v0;
  if (v0)
  {
    [v0 bounds];
    double v3 = v2;
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
  }

  return v3;
}

double DCIM_boundsFromScreen(void *a1)
{
  if (!a1) {
    return *MEMORY[0x1E4F1DB28];
  }
  [a1 bounds];
  return result;
}

double DCIM_scaleFromMainScreen()
{
  Class v0 = [NSClassFromString((NSString *)@"UIScreen") mainScreen];
  id v1 = v0;
  if (v0)
  {
    [v0 scale];
    double v3 = v2;
  }
  else
  {
    double v3 = 1.0;
  }

  return v3;
}

double DCIM_scaleFromScreen(void *a1, const char *a2)
{
  if (!a1) {
    return 1.0;
  }
  [a1 scale];
  return result;
}

__CFString *DCIM_applicationWillResignActiveNotificationName()
{
  return @"UIApplicationWillResignActiveNotification";
}

__CFString *DCIM_applicationDidBecomeActiveNotificationName()
{
  return @"UIApplicationDidBecomeActiveNotification";
}

__CFString *DCIM_applicationSuspendedEventsOnlyNotificationName()
{
  return @"UIApplicationSuspendedEventsOnlyNotification";
}

id DCIM_currentDeviceModelName()
{
  Class v0 = [NSClassFromString((NSString *)@"UIDevice") currentDevice];
  id v1 = [v0 model];

  return v1;
}

id DCIM_labelAttributesWithFontAndColor(void *a1, void *a2)
{
  double v2 = 0;
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    v8[0] = @"NSFont";
    v8[1] = @"NSForegroundColor";
    v9[0] = a1;
    v9[1] = a2;
    id v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a2;
    id v6 = a1;
    double v2 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];
  }
  return v2;
}

id DCIM_ASCIIDescriptionForPLImage(void *a1)
{
  id v1 = a1;
  double v2 = DCIM_sizeFromPLImage(v1);
  double v4 = 700.0 / v2;
  if (700.0 / v2 >= 1300.0 / v3) {
    double v4 = 1300.0 / v3;
  }
  id v5 = NSString;
  int64_t v6 = vcvtpd_s64_f64(v2 * v4 / 7.0);
  int64_t v7 = vcvtpd_s64_f64(v3 * v4 / 13.0);
  id v8 = v1;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    double v12 = CGBitmapContextCreate(0, v6, v7, 8uLL, 0, DeviceGray, 0);
    CGColorSpaceRelease(DeviceGray);
    id v13 = v8;
    id v14 = (CGImage *)[v13 CGImage];
    CGContextSaveGState(v12);
    double v15 = (double)v6;
    uint64_t v16 = [v13 imageOrientation];
    if (((v16 - 2) & 0xFFFFFFFFFFFFFFFALL) != 0) {
      double v17 = (double)v7;
    }
    else {
      double v17 = (double)v6;
    }
    if (((v16 - 2) & 0xFFFFFFFFFFFFFFFALL) == 0) {
      double v15 = (double)v7;
    }
    switch([v13 imageOrientation])
    {
      case 1:
        long long v18 = xmmword_19BDC6ED0;
        long long v19 = xmmword_19BDC6EC0;
        CGFloat v20 = v15;
        goto LABEL_21;
      case 2:
        long long v18 = xmmword_19BDC6EC0;
        long long v19 = xmmword_19BDC6EF0;
        CGFloat v21 = 0.0;
        CGFloat v20 = v17;
        break;
      case 3:
        long long v18 = xmmword_19BDC6EE0;
        long long v19 = xmmword_19BDC6ED0;
        CGFloat v20 = 0.0;
        goto LABEL_23;
      case 4:
        long long v18 = xmmword_19BDC6EF0;
        long long v19 = xmmword_19BDC6EC0;
        CGFloat v21 = 0.0;
        CGFloat v20 = v15;
        break;
      case 5:
        long long v18 = xmmword_19BDC6ED0;
        long long v19 = xmmword_19BDC6EE0;
        CGFloat v20 = 0.0;
LABEL_21:
        CGFloat v21 = v17;
        break;
      case 6:
        long long v18 = xmmword_19BDC6EC0;
        long long v19 = xmmword_19BDC6ED0;
        CGFloat v20 = v17;
LABEL_23:
        CGFloat v21 = v15;
        break;
      case 7:
        long long v18 = xmmword_19BDC6EE0;
        long long v19 = xmmword_19BDC6EF0;
        CGFloat v20 = 0.0;
        CGFloat v21 = 0.0;
        break;
      default:
        long long v19 = *MEMORY[0x1E4F1DAB8];
        long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        CGFloat v20 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
        CGFloat v21 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
        break;
    }
    *(_OWORD *)&transform.a = v19;
    *(_OWORD *)&transform.c = v18;
    transform.tx = v20;
    transform.ty = v21;
    CGContextConcatCTM(v12, &transform);
    v37.origin.x = 0.0;
    v37.origin.y = 0.0;
    v37.size.width = v15;
    v37.size.height = v17;
    CGContextDrawImage(v12, v37, v14);
    CGContextRestoreGState(v12);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v12);
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v12);
    uint64_t v24 = malloc_type_malloc(4 * v7 * (v6 + 1), 0x4230AC72uLL);
    double v25 = v24;
    if (v7 >= 1)
    {
      uint64_t v26 = 0;
      id v27 = v24;
      do
      {
        uint64_t v28 = Data;
        float v29 = v27;
        int64_t v30 = v6;
        if (v6 >= 1)
        {
          do
          {
            int v31 = *v28++;
            unsigned int v32 = (171 * (v31 ^ 0xFFu)) >> 9;
            if (v32 >= 0x45) {
              unsigned int v32 = 69;
            }
            *v29++ = CharacterForBrightness_chars[v32];
            --v30;
          }
          while (v30);
        }
        v25[++v26 * (v6 + 1) - 1] = 10;
        v27 += v6 + 1;
        Data += BytesPerRow;
      }
      while (v26 != v7);
    }
    CGContextRelease(v12);
    id v10 = (void *)[[NSString alloc] initWithBytesNoCopy:v25 length:4 * v7 * (v6 + 1) encoding:2617245952 freeWhenDone:1];
  }

  long long v33 = [v5 stringWithFormat:@"\n%@", v10];

  return v33;
}

uint64_t DCIM_NSValueFromCGSize()
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:");
}

uint64_t DCIM_NSValueFromCGPoint()
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:");
}

uint64_t DCIM_NSValueFromCGRect()
{
  return objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
}

uint64_t DCIM_NSValueToCGAffineTransform@<X0>(void *a1@<X0>, _OWORD *x8_0@<X8>)
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return [a1 getValue:x8_0];
}

uint64_t DCIM_newJPEGRepresentationWithPLImage(void *a1, double a2)
{
  id v3 = a1;
  if (setupUIGraphicsFunctions())
  {
    uint64_t v4 = s_UIImageJPEGRepresentation(v3, 1, a2);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t DCIM_newPNGRepresentationWithPLImage(void *a1)
{
  id v1 = a1;
  if ([v1 CGImage] && setupUIGraphicsFunctions())
  {
    uint64_t v2 = sUIImagePNGRepresentation(v1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

id DCIM_imageWithColor(void *a1, double a2, double a3)
{
  id v5 = a1;
  if (v5 && setupUIGraphicsFunctions())
  {
    uint64_t v6 = sUIGraphicsBeginImageContext(a2, a3);
    CurrentContext = (CGContext *)sUIGraphicsGetCurrentContext(v6);
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v5 CGColor]);
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.width = a2;
    v11.size.height = a3;
    CGContextFillRect(CurrentContext, v11);
    id v8 = sUIGraphicsGetImageFromCurrentImageContext();
    sUIGraphicsEndImageContext();
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t DCIM_IS_PAD()
{
  if (DCIM_IS_PAD_onceToken != -1) {
    dispatch_once(&DCIM_IS_PAD_onceToken, &__block_literal_global_75);
  }
  return DCIM_IS_PAD_retval;
}

id DCIM_newPLImageWithStoredJPEGData(void *a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v14 = *MEMORY[0x1E4F56298];
    v15[0] = MEMORY[0x1E4F1CC38];
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    int CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
    if (CVPixelBufferFromImageData)
    {
      int v4 = CVPixelBufferFromImageData;
      id v5 = PLBackendGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        BOOL v9 = @"DCIM_newPLImageWithStoredJPEGData";
        __int16 v10 = 2048;
        uint64_t v11 = v4;
        __int16 v12 = 2048;
        uint64_t v13 = [v1 length];
        _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "PFFigCreateCVPixelBufferFromImageData %@ returned %ld from %lu", buf, 0x20u);
      }
    }
  }
  uint64_t v6 = (void *)DCIM_newPLImageWithData(v1);
  if (v6) {
    objc_setAssociatedObject(v6, @"PLImageJPEGDataKey", v1, (void *)0x301);
  }

  return v6;
}

id DCIM_storedJPEGDataFromImage(void *a1)
{
  return objc_getAssociatedObject(a1, @"PLImageJPEGDataKey");
}

uint64_t DCIM_decorateThumbnailWithTime(CGContext *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  id v29 = a2;
  if (setupUIGraphicsFunctions())
  {
    if ([v29 unsignedIntegerValue] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = 0;
    }
    else
    {
      Class v17 = NSClassFromString((NSString *)@"UIMovieScrubber");
      [v29 doubleValue];
      uint64_t v16 = [(objc_class *)v17 timeStringForSeconds:(int)rint(v18) forceFullWidthComponents:0 isElapsed:1];
    }
    if ([v16 length])
    {
      sUIGraphicsPushContext(a1);
      CGContextScaleCTM(a1, 1.0, -1.0);
      CGContextTranslateCTM(a1, 0.0, -a4);
      double v19 = ceil(a4 - a8 - a6) + -1.0;
      pl_dispatch_once(&PLPhysicalScreenScale_didCheck, &__block_literal_global_202);
      double v20 = a7 + *(double *)&PLPhysicalScreenScale_screenScale * -5.0 * a9;
      CGFloat v21 = [NSClassFromString((NSString *)@"UIColor") whiteColor];
      [v21 set];

      pl_dispatch_once(&PLPhysicalScreenScale_didCheck, &__block_literal_global_202);
      id v22 = [NSClassFromString((NSString *)@"UIFont") boldSystemFontOfSize:*(double *)&PLPhysicalScreenScale_screenScale * 12.0 * a9];
      objc_msgSend(v16, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v22, 2, v20, a8);
      double v24 = round(v19 + (a8 - v23) * 0.5);
      if (v23 >= a8) {
        double v25 = v19;
      }
      else {
        double v25 = v24;
      }
      if (v23 >= a8) {
        double v26 = a8;
      }
      else {
        double v26 = v23;
      }
      uint64_t v27 = objc_msgSend(v16, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", v22, 2, 2, a5, v25, v20, v26);
      sUIGraphicsPopContext(v27);
    }
  }
  return MEMORY[0x1F41817F8]();
}

Class DCIM_isApplicationSuspended()
{
  Class result = NSClassFromString((NSString *)@"UIApplication");
  if (result)
  {
    id v1 = [NSClassFromString((NSString *)@"UIApplication") sharedApplication];
    uint64_t v2 = [v1 isSuspended];

    return (Class)v2;
  }
  return result;
}

char *DCIM_MakeUniqueDirectoryWithPath(void *a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = *MEMORY[0x1E4F28330];
  v14[0] = &unk_1EEC14470;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  if (([v2 fileExistsAtPath:v1] & 1) == 0)
  {
    if ([v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:v3 error:0])
    {
      int v4 = (char *)v1;
      if (v4) {
        goto LABEL_9;
      }
    }
  }
  strcpy(v12, ".tmp.XXXXXX");
  if (![v1 getFileSystemRepresentation:__s maxLength:1023])
  {
    NSLog((NSString *)@"*** Warning: invalid path %@", v1);
LABEL_8:
    int v4 = 0;
    goto LABEL_9;
  }
  char v11 = 0;
  id v5 = &__s[strlen(__s)];
  uint64_t v6 = [MEMORY[0x1E4F29060] currentThread];
  sprintf(v5, "-T%p", v6);

  __strcat_chk();
  int v4 = mkdtemp(__s);
  if (v4)
  {
LABEL_6:
    int v4 = [v2 stringWithFileSystemRepresentation:v4 length:strlen(v4)];
    goto LABEL_9;
  }
  if (*__error() != 2) {
    goto LABEL_8;
  }
  id v8 = [v1 stringByDeletingLastPathComponent];
  char v9 = [v2 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v3 error:0];

  if (v9)
  {
    [v1 getFileSystemRepresentation:__s maxLength:1023];
    char v11 = 0;
    __strcat_chk();
    int v4 = mkdtemp(__s);
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    int v4 = 0;
    *__error() = 2;
  }
LABEL_9:

  return v4;
}

CGImageRef createImageByRemovingBlackBarsFromPreviewImage(CGImage *a1, int a2, int a3)
{
  size_t Width = CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  if (a2 < 1 || a3 < 1 || !Width || !Height) {
    return 0;
  }
  float v8 = (float)a2 / (float)a3;
  float v9 = (float)Width;
  float v10 = (float)Height;
  float v11 = ceilf((float)((float)Height - floorf((float)Width / v8)) * 0.5);
  if (v11 <= 2.0)
  {
    float v17 = ceilf((float)(v9 - floorf(v8 * v10)) * 0.5);
    if (v17 > 2.0)
    {
      float v18 = v9 + (float)(v17 * -2.0);
      if (v18 > 0.0)
      {
        double v16 = v17;
        double v14 = v18;
        double v15 = (double)Height;
        double v13 = 0.0;
        goto LABEL_11;
      }
    }
    return 0;
  }
  float v12 = v10 + (float)(v11 * -2.0);
  if (v12 <= 0.0) {
    return 0;
  }
  double v13 = v11;
  double v14 = (double)Width;
  double v15 = v12;
  double v16 = 0.0;
LABEL_11:
  return CGImageCreateWithImageInRect(a1, *(CGRect *)&v16);
}

Class UIImageClass()
{
  return NSClassFromString((NSString *)@"UIImage");
}

uint64_t PLSingleQueryReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  int v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    int64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          char v17 = 0;
          unsigned int v18 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 2u;
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_53;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_55:
          uint64_t v42 = 24;
          goto LABEL_68;
        case 2u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 8u;
          while (2)
          {
            uint64_t v26 = *v3;
            unint64_t v27 = *(void *)(a2 + v26);
            if (v27 == -1 || v27 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)(a2 + *v7) + v27);
              *(void *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                BOOL v14 = v25++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_59:
          uint64_t v42 = 44;
          goto LABEL_68;
        case 3u:
          uint64_t v29 = PBReaderReadData();
          uint64_t v30 = 16;
          goto LABEL_37;
        case 4u:
          uint64_t v29 = PBReaderReadData();
          uint64_t v30 = 32;
LABEL_37:
          int v31 = *(void **)(a1 + v30);
          *(void *)(a1 + v30) = v29;

          continue;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          while (2)
          {
            uint64_t v34 = *v3;
            unint64_t v35 = *(void *)(a2 + v34);
            if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
            {
              *(unsigned char *)(a2 + *v5) = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)(a2 + *v7) + v35);
              *(void *)(a2 + v34) = v35 + 1;
              v19 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v14 = v33++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_63:
          uint64_t v42 = 8;
          goto LABEL_68;
        case 6u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v19 = 0;
          *(unsigned char *)(a1 + 48) |= 4u;
          break;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v3;
        unint64_t v40 = *(void *)(a2 + v39);
        if (v40 == -1 || v40 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)(a2 + *v7) + v40);
        *(void *)(a2 + v39) = v40 + 1;
        v19 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0) {
          goto LABEL_65;
        }
        v37 += 7;
        BOOL v14 = v38++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_67;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_65:
      if (*(unsigned char *)(a2 + *v5)) {
        LODWORD(v19) = 0;
      }
LABEL_67:
      uint64_t v42 = 40;
LABEL_68:
      *(_DWORD *)(a1 + v42) = v19;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_19BD1DB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1DE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1E124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1E4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1E810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1EAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1EDD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1F0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1F3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD1F6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t PLPlatformSharedAlbumAndiCPLPrefetchSupported()
{
  return 1;
}

uint64_t PLPlatformCloudFeedSupported()
{
  return 1;
}

uint64_t PLPlatformMomentsSupported()
{
  return 1;
}

uint64_t PLPlatformMomentAnalysisSupported()
{
  return 1;
}

uint64_t PLPlatformMediaStreamSupported()
{
  return 1;
}

uint64_t PLPlatformSharedStreamsSupported()
{
  return 1;
}

uint64_t PLPlatformHighlightsSupported()
{
  return 1;
}

void __PLPlatformSearchSupported_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  PLPlatformSearchSupported_searchSupported = [v0 BOOLForKey:@"PLSearchIndexDisabled"] ^ 1;
}

uint64_t PLPlatformUseNanoThumbnailFormats()
{
  return 0;
}

uint64_t PLPlatformMobileCheckpointSupported()
{
  return 1;
}

uint64_t PLPlatformExtendedAttributesSupported()
{
  return 1;
}

uint64_t PLPlatformLimitedLibrarySupported()
{
  return 1;
}

uint64_t PLPlatformComputeSyncSupported()
{
  return 1;
}

uint64_t PLPlatformWaitsForDataMigrator()
{
  return 1;
}

uint64_t PLPlatformCameraCaptureSupported()
{
  return 1;
}

uint64_t PLPlatformIsFrameDropRecoverySupported()
{
  return MGIsDeviceOneOfType();
}

uint64_t PLPlatformGenerativeModelSystemsSupported()
{
  return PLPlatformGenerativeModelSystemsSupported_gmSupported;
}

void __PLPlatformGenerativeModelSystemsSupported_block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int domain_answer = os_eligibility_get_domain_answer();
  if (domain_answer)
  {
    int v1 = domain_answer;
    uint64_t v2 = strerror(domain_answer);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v6 = v1;
      __int16 v7 = 2080;
      char v8 = v2;
      _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "os_eligibility_get_domain_answer failed with errno %d: %s", buf, 0x12u);
    }
  }
  else
  {
    PLPlatformGenerativeModelSystemsSupported_gmSupported = 0;
    if (PFOSVariantHasInternalDiagnostics())
    {
      id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v4 = [v3 BOOLForKey:@"PLPlatformGenerativeModelSystemsSupported"];

      if (v4)
      {
        PLPlatformGenerativeModelSystemsSupported_gmSupported = 1;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "PLPlatformGenerativeModelSystemsSupported is overridden to YES via defaults", buf, 2u);
        }
      }
    }
  }
}

uint64_t PLPlatformIsMachineReadableCodeDataSupported()
{
  return 1;
}

void sub_19BD1FFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
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

void sub_19BD20404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD20838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD20B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD20F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_56n4_8_s8(uint64_t a1)
{
}

__n128 __copy_helper_block_e8_56n18_8_8_t0w1_s8_t16w32(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(id *)(a2 + 64);
  __n128 result = *(__n128 *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(__n128 *)(a1 + 88) = result;
  return result;
}

void sub_19BD2143C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD21A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD21DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD22484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD227C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32n4_8_s8(uint64_t a1)
{
}

__n128 __copy_helper_block_e8_32n18_8_8_t0w1_s8_t16w32(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(void *)(a1 + 40) = *(id *)(a2 + 40);
  __n128 result = *(__n128 *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(__n128 *)(a1 + 64) = result;
  return result;
}

void sub_19BD22CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD230C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD23488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_19BD23B7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD23F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD24768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel,uint64_t a27,uint64_t a28,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD24CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD251C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD25628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD25A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD25E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD27CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj)
{
}

void sub_19BD27E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BD288D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_19BD291E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD2AE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__982(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__983(uint64_t a1)
{
}

void sub_19BD2B38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD2B8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD2BDD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD2C3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD2CAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD2D184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD2D73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD2DDFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD2E490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD2EB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD2F040(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD2F68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD2FB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

uint64_t PUTCreatePathForPersistentURL(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  id v3 = [a1 scheme];
  int v4 = [v3 isEqualToString:@"ipod-library"];

  if (v4)
  {
    uint64_t v14 = 0;
    int v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v5 = (void *)getMPMediaLibraryClass_softClass;
    uint64_t v17 = getMPMediaLibraryClass_softClass;
    if (!getMPMediaLibraryClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getMPMediaLibraryClass_block_invoke;
      v13[3] = &unk_1E58A2238;
      v13[4] = &v14;
      __getMPMediaLibraryClass_block_invoke((uint64_t)v13);
      id v5 = (void *)v15[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v14, 8);
    __int16 v7 = [v6 defaultMediaLibrary];
    if ([v7 isValidAssetURL:a1])
    {
      uint64_t v8 = [v7 pathForAssetURL:a1];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    __int16 v7 = +[PLAssetsdClient sharedSystemLibraryAssetsdClient];
    uint64_t v9 = [v7 resourceClient];
    id v12 = 0;
    [v9 fileURLForAssetURL:a1 withAdjustments:1 fileURL:&v12 error:0];
    id v10 = v12;

    uint64_t v8 = [v10 path];
  }
  return v8;
}

void sub_19BD30024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaLibraryClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __MediaPlayerLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E589F118;
    uint64_t v8 = 0;
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    int v4 = [NSString stringWithUTF8String:"void *MediaPlayerLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PersistentURLTranslator.m", 39, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("MPMediaLibrary");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getMPMediaLibraryClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PersistentURLTranslator.m", 40, @"Unable to find class %s", "MPMediaLibrary");

LABEL_10:
    __break(1u);
  }
  getMPMediaLibraryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __MediaPlayerLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  MediaPlayerLibraryCore_frameworkLibrary = result;
  return result;
}

id PUTCreateSandboxExtensionURLForPersistentURL(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  id v3 = [a1 scheme];
  int v4 = [v3 isEqualToString:@"ipod-library"];

  if (v4)
  {
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Requesting sandbox extension URL for Music URL, which is not supported", buf, 2u);
    }
    id v6 = 0;
  }
  else
  {
    id v5 = +[PLAssetsdClient sharedSystemLibraryAssetsdClient];
    long long v7 = [v5 resourceClient];
    id v9 = 0;
    [v7 sandboxExtensionFileURLForAssetURL:a1 withAdjustments:1 fileURL:&v9 error:0];
    id v6 = v9;
  }
  return v6;
}

uint64_t PUTIsPersistentURL(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  id v3 = [a1 scheme];
  if ([v3 isEqualToString:@"assets-library"]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isEqualToString:@"ipod-library"];
  }

  return v4;
}

uint64_t PUTGetCurrentAccess()
{
  return 2;
}

uint64_t PUTGetCurrentAccessForURLAndToken(void *a1, _OWORD *a2)
{
  uint64_t v4 = (void *)MEMORY[0x19F38F510]();
  id v5 = +[PLPrivacy sharedInstance];
  long long v6 = a2[1];
  v12[0] = *a2;
  v12[1] = v6;
  uint64_t v7 = [v5 photosAccessAllowedWithScope:7 auditToken:v12 clientAuthorization:0];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 0
    && ([a1 scheme],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"ipod-library"],
        v8,
        !v9))
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 2;
  }
  return v10;
}

unint64_t PLSizeMake(unsigned int a1, uint64_t a2)
{
  return a1 | (unint64_t)(a2 << 32);
}

unint64_t PLSizeFromCGSize(double a1, double a2)
{
  return (int)a1 | ((unint64_t)(int)a2 << 32);
}

unint64_t PLScaleDimensionsToShortSide(uint64_t a1, unsigned int a2, signed int a3)
{
  if ((int)a1 >= SHIDWORD(a1)) {
    int v3 = HIDWORD(a1);
  }
  else {
    int v3 = a1;
  }
  if ((int)a1 <= SHIDWORD(a1)) {
    int v4 = HIDWORD(a1);
  }
  else {
    int v4 = a1;
  }
  int v5 = (int)(v4 * a2) / v3;
  if (a3 < 1 || v5 <= a3)
  {
    if (v5 != a3)
    {
      if (v5 >= -1) {
        int v8 = v5 + 1;
      }
      else {
        int v8 = v5 + 2;
      }
      a3 = v8 & 0xFFFFFFFE;
    }
  }
  else
  {
    int v6 = v3 * a3 / v4;
    if (v6 != a2)
    {
      if (v6 >= -1) {
        int v7 = v6 + 1;
      }
      else {
        int v7 = v6 + 2;
      }
      a2 = v7 & 0xFFFFFFFE;
    }
  }
  if ((int)a1 <= SHIDWORD(a1)) {
    return a2 | ((unint64_t)a3 << 32);
  }
  else {
    return a3 | ((unint64_t)a2 << 32);
  }
}

double PLRectByCenteringSquareToFitDimensions(uint64_t a1)
{
  return PLRectByCenteringAndScalingDimensionsToFitDimensions(0x100000001, a1);
}

double PLRectByCenteringAndScalingDimensionsToFitDimensions(uint64_t a1, uint64_t a2)
{
  double v2 = (double)(int)a1 / (double)SHIDWORD(a1);
  double v3 = (double)(int)a2;
  BOOL v4 = v2 <= (double)(int)a2 / (double)SHIDWORD(a2);
  double v5 = v2 * (double)SHIDWORD(a2);
  double v6 = (double)(int)a2 / v2;
  if (v4) {
    double v7 = (double)SHIDWORD(a2);
  }
  else {
    double v7 = v6;
  }
  if (v4) {
    double v8 = v5;
  }
  else {
    double v8 = (double)(int)a2;
  }
  if (v8 == v3)
  {
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = ((double)SHIDWORD(a2) - v7) * 0.5;
  }
  else
  {
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = (v3 - v8) * 0.5;
  }
  CGRect v13 = CGRectIntegral(*(CGRect *)(&v7 - 3));
  if (v13.size.width <= v13.size.height)
  {
    if (v13.size.height > v13.size.width) {
      v13.size.height = v13.size.height + -1.0;
    }
  }
  else
  {
    v13.size.width = v13.size.width + -1.0;
  }
  *(void *)&double result = (unint64_t)CGRectStandardize(v13);
  return result;
}

double PLCGSizeScaledToFitSize(uint64_t a1, uint64_t a2)
{
  double v2 = (double)(int)a1 / (double)SHIDWORD(a1);
  double result = (double)(int)a2;
  if (v2 <= (double)(int)a2 / (double)SHIDWORD(a2)) {
    return v2 * (double)SHIDWORD(a2);
  }
  return result;
}

void sub_19BD32170(_Unwind_Exception *exception_object)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(exception_object);
}

id PLURLForResourceProperties(uint64_t a1, uint64_t a2, unsigned int a3, int a4, unsigned int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11 = PLPathForResourceProperties(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id PLPathForResourceProperties(uint64_t a1, uint64_t a2, unsigned int a3, int a4, unsigned int a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v16 = 31;
  if (a3 <= 0xF)
  {
    if (((1 << a3) & 0x2C38) != 0)
    {
      if (a5 | a4)
      {
        int v16 = 31;
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    if (((1 << a3) & 0xC000) != 0 || a3 == 7 && (int v16 = 31, a4 == 2) && !a5) {
LABEL_6:
    }
      int v16 = a3;
  }
LABEL_7:
  if (a1)
  {
    switch(a4)
    {
      case 0:
        if (a5)
        {
          FileMarker = _createFileMarker(v16, 0, a5);
LABEL_11:
          a7 = a9;
          goto LABEL_43;
        }
        if (v16 == 31)
        {
LABEL_20:
          FileMarker = 0;
        }
        else
        {
          FileMarker = (char *)malloc_type_calloc(1uLL, 3uLL, 0x2D4F4517uLL);
          if (snprintf(FileMarker, 3uLL, "%d", v16) >= 3) {
            goto LABEL_39;
          }
        }
        goto LABEL_43;
      case 1:
        if (v16 == 31)
        {
          FileMarker = (char *)malloc_type_calloc(1uLL, 2uLL, 0x3C36B57DuLL);
          *(_WORD *)FileMarker = 112;
LABEL_27:
          a7 = a8;
          goto LABEL_43;
        }
        FileMarker = (char *)malloc_type_calloc(1uLL, 5uLL, 0x1620EE3EuLL);
        a7 = a8;
        if (snprintf(FileMarker, 5uLL, "%c_%d", 112, v16) >= 5) {
          goto LABEL_39;
        }
        goto LABEL_43;
      case 2:
        if (!a5 && v16 == 31 && (a6 & 1) != 0)
        {
          FileMarker = 0;
          goto LABEL_27;
        }
        FileMarker = _createFileMarker(v16, 2, a5);
        if (a5) {
          a7 = a9;
        }
        else {
          a7 = a8;
        }
        goto LABEL_43;
      case 3:
        if ((a5 & 0xFFFF0000) == 0x40000)
        {
          a7 = a11;
          FileMarker = (char *)malloc_type_calloc(1uLL, 0xBuLL, 0xDA9688A5uLL);
          unsigned int v19 = snprintf(FileMarker, 0xBuLL, "%d_%d_%c", HIWORD(a5), (unsigned __int16)a5 >> 1, 99);
        }
        else
        {
          if ((v16 & 0xFFFFFFFE) == 0xE)
          {
            a7 = a10;
            FileMarker = _createFileMarker(v16, 3, a5);
            goto LABEL_43;
          }
          if (!a5)
          {
            FileMarker = (char *)malloc_type_calloc(1uLL, 2uLL, 0x3C36B57DuLL);
            *(_WORD *)FileMarker = 99;
            goto LABEL_11;
          }
          FileMarker = (char *)malloc_type_calloc(1uLL, 0xBuLL, 0xDA9688A5uLL);
          unsigned int v19 = snprintf(FileMarker, 0xBuLL, "%d_%d_%c", HIWORD(a5), (unsigned __int16)a5 >> 1, 99);
          a7 = a9;
        }
        if (v19 >= 0xB) {
LABEL_39:
        }
          __assert_rtn("_createFileMarker", "PLPhotoLibraryPathManagerUBF.m", 113, "formattedLen < markerLen");
LABEL_43:
        unsigned int v18 = +[PLPhotoLibraryPathManagerCore managedPathWithUuid:a1 base:a7 fileMarker:FileMarker extension:a2];
        if (FileMarker) {
          free(FileMarker);
        }
        goto LABEL_45;
      default:
        a7 = 0;
        goto LABEL_20;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "_pathForResourceProperties uuid is NULL", buf, 2u);
  }
  unsigned int v18 = 0;
LABEL_45:
  return v18;
}

char *_createFileMarker(int a1, int a2, int a3)
{
  char v3 = a2;
  if (!a3 || a1 == 31)
  {
    if (a1 == 31 && a3)
    {
      BOOL v4 = (char *)malloc_type_calloc(1uLL, 0xBuLL, 0xDA9688A5uLL);
      unint64_t v5 = 11;
      int v6 = snprintf(v4, 0xBuLL, "%d_%d_%c");
    }
    else if (a1 == 31 || !a2)
    {
      if (a1 == 31 || a2)
      {
        if (!a2) {
          return 0;
        }
        BOOL v4 = (char *)malloc_type_calloc(1uLL, 2uLL, 0x3C36B57DuLL);
        *(_WORD *)BOOL v4 = (0x6361706Fu >> (8 * v3));
        return v4;
      }
      unint64_t v5 = 3;
      BOOL v4 = (char *)malloc_type_calloc(1uLL, 3uLL, 0x2D4F4517uLL);
      int v6 = snprintf(v4, 3uLL, "%d");
    }
    else
    {
      unint64_t v5 = 5;
      BOOL v4 = (char *)malloc_type_calloc(1uLL, 5uLL, 0x1620EE3EuLL);
      int v6 = snprintf(v4, 5uLL, "%c_%d");
    }
  }
  else
  {
    BOOL v4 = (char *)malloc_type_calloc(1uLL, 0xEuLL, 0x9E52B664uLL);
    unint64_t v5 = 14;
    int v6 = snprintf(v4, 0xEuLL, "%d_%d_%c_%d");
  }
  if (v5 <= v6) {
    __assert_rtn("_createFileMarker", "PLPhotoLibraryPathManagerUBF.m", 113, "formattedLen < markerLen");
  }
  return v4;
}

uint64_t PLResourceVersionDesignatorForResourceVersion(unsigned int a1)
{
  unsigned int v1 = 0x6361706Fu >> (8 * a1);
  if (a1 >= 4) {
    LOBYTE(v1) = 111;
  }
  return v1 & 0x7F;
}

BOOL PLResourceTypeIsAllowedForUseInFilename(unsigned int a1, int a2, int a3)
{
  int v3 = 1 << a1;
  BOOL v5 = a2 == 2 && a3 == 0;
  if (a1 != 7) {
    BOOL v5 = 0;
  }
  int v6 = (v3 & 0xC000) != 0 || v5;
  if ((v3 & 0x2C38) != 0) {
    BOOL v7 = (a3 | a2) == 0;
  }
  else {
    BOOL v7 = v6;
  }
  return a1 <= 0xF && v7;
}

id PLAllowedResourceTypesForOriginalResources()
{
  if (PLAllowedResourceTypesForOriginalResources_onceToken != -1) {
    dispatch_once(&PLAllowedResourceTypesForOriginalResources_onceToken, &__block_literal_global_1390);
  }
  id v0 = (void *)PLAllowedResourceTypesForOriginalResources_allowedResourceTypes;
  return v0;
}

void __PLAllowedResourceTypesForOriginalResources_block_invoke()
{
  id v0 = (void *)PLAllowedResourceTypesForOriginalResources_allowedResourceTypes;
  PLAllowedResourceTypesForOriginalResources_allowedResourceTypes = (uint64_t)&unk_1EEC14E90;
}

id PLResourceDataStoreErrorCreate(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(v5);
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28228]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PLResourceDataStoreErrorDomain" code:a1 userInfo:v8];

  return v9;
}

id PLGuessResourceUTIForResourceType(int a1, int a2, void *a3)
{
  BOOL v5 = [a3 pathExtension];
  if (![v5 length]
    || ([MEMORY[0x1E4F8CDF8] resourceModelTypeForFilenameExtension:v5],
        (id v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = 0;
    switch(a1)
    {
      case 0:
      case 4:
      case 15:
        id v7 = (id *)MEMORY[0x1E4F44400];
        goto LABEL_13;
      case 1:
        id v7 = (id *)MEMORY[0x1E4F44448];
        goto LABEL_13;
      case 2:
        id v7 = (id *)MEMORY[0x1E4F44330];
        goto LABEL_13;
      case 3:
      case 11:
      case 13:
        id v7 = (id *)MEMORY[0x1E4F44490];
        goto LABEL_13;
      case 5:
      case 12:
      case 31:
        id v7 = (id *)MEMORY[0x1E4F44408];
        goto LABEL_13;
      case 6:
      case 8:
        id v7 = (id *)MEMORY[0x1E4F44488];
        goto LABEL_13;
      case 7:
      case 9:
      case 14:
        id v7 = (id *)MEMORY[0x1E4F44378];
        goto LABEL_13;
      case 10:
        id v7 = (id *)MEMORY[0x1E4F44400];
        if (a2) {
          id v7 = (id *)MEMORY[0x1E4F44448];
        }
LABEL_13:
        id v6 = *v7;
        break;
      default:
        break;
    }
  }
  id v8 = [v6 identifier];

  return v8;
}

void sub_19BD3534C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1506(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1507(uint64_t a1)
{
}

BOOL PLIsValidUUIDString(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 length] == 36
    && (double v2 = (const char *)[v1 cStringUsingEncoding:4]) != 0)
  {
    memset(uu, 0, sizeof(uu));
    BOOL v3 = uuid_parse(v2, uu) == 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

void sub_19BD366EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel,int buf)
{
  if (a21) {
    os_activity_scope_leave(&a24);
  }
  if (a23)
  {
    char v28 = PLRequestGetLog();
    uint64_t v29 = v28;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel);
      buf = 136446210;
      *(void *)(v26 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v29, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1622(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1623(uint64_t a1)
{
}

void sub_19BD36C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel,int buf)
{
  if (a21) {
    os_activity_scope_leave(&a24);
  }
  if (a23)
  {
    char v28 = PLRequestGetLog();
    uint64_t v29 = v28;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel);
      buf = 136446210;
      *(void *)(v26 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v29, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD370D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD375C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_40n4_8_s8(uint64_t a1)
{
}

void sub_19BD37E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD382D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3870C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD38A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD38D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3B368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1897(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1898(uint64_t a1)
{
}

void sub_19BD3B7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3BC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3C07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3C4C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3CAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3D008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3D51C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3DA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3DF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3E440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3E854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD3ECDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3F0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD3F578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD3F98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD3FD98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD402A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD40794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD40C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD41288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD4185C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD41E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD42318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD427C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD42C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD43110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD435B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD439D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD43EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD44354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD44720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD44D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  if (a33) {
    os_activity_scope_leave(&a36);
  }
  if (a35)
  {
    unint64_t v40 = PLRequestGetLog();
    char v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 144) = 136446210;
      *(void *)(v37 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 144), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD45418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel)
{
  if (a25) {
    os_activity_scope_leave(&a28);
  }
  if (a27)
  {
    char v32 = PLRequestGetLog();
    unsigned int v33 = v32;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v30 - 144) = 136446210;
      *(void *)(v29 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v33, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)(v30 - 144), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD458D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD45C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD460CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD46544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD469BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD46D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD4726C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_19BD47684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD47A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD47D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19BD48044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19BD4843C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD48944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD48DA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD493E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD49B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,os_signpost_id_t a29,os_activity_scope_state_s a30,SEL sel)
{
  if (a27) {
    os_activity_scope_leave(&a30);
  }
  if (a29)
  {
    uint64_t v34 = PLRequestGetLog();
    unint64_t v35 = v34;
    if (a29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v32 - 160) = 136446210;
      *(void *)(v31 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v35, OS_SIGNPOST_INTERVAL_END, a29, "PLXPC Sync", "%{public}s", (uint8_t *)(v32 - 160), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD4A0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD4A620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD4AC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD4B1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD4B57C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD4B910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD4BD90(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v2 - 144)) {
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 120));
  }
  if (*(void *)(v2 - 128))
  {
    BOOL v4 = PLRequestGetLog();
    BOOL v5 = v4;
    os_signpost_id_t v6 = *(void *)(v2 - 128);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 104));
      *(_DWORD *)(v2 - 96) = 136446210;
      *(void *)(v1 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 96), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD4C390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD4CFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLClientApplicationIdentifierFromXPCConnection(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 auditToken];
    BOOL v3 = PLClientApplicationIdentifierFromAuditToken(&v6, v2);
  }
  else
  {
    BOOL v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      id v8 = "NSString *PLClientApplicationIdentifierFromXPCConnection(NSXPCConnection *__strong)";
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "%{public}s: missing required connection", buf, 0xCu);
    }

    BOOL v3 = 0;
  }

  return v3;
}

__CFString *PLClientApplicationIdentifierFromAuditToken(_OWORD *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = a1[1];
  *(_OWORD *)v12.val = *a1;
  *(_OWORD *)&v12.val[4] = v5;
  long long v6 = SecTaskCreateWithAuditToken(v4, &v12);
  if (v6)
  {
    id v7 = v6;
    id v8 = (__CFString *)SecTaskCopySigningIdentifier(v6, 0);
    CFRelease(v7);
    if (v8) {
      goto LABEL_9;
    }
    uint64_t v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12.val[0] = 136446466;
      *(void *)&v12.val[1] = "NSString *PLClientApplicationIdentifierFromAuditToken(audit_token_t, __strong id)";
      LOWORD(v12.val[3]) = 2114;
      *(void *)((char *)&v12.val[3] + 2) = v3;
      double v10 = "%{public}s: failed to get identifier from %{public}@";
LABEL_7:
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12.val[0] = 136446466;
      *(void *)&v12.val[1] = "NSString *PLClientApplicationIdentifierFromAuditToken(audit_token_t, __strong id)";
      LOWORD(v12.val[3]) = 2114;
      *(void *)((char *)&v12.val[3] + 2) = v3;
      double v10 = "%{public}s: failed to get SecTask from %{public}@";
      goto LABEL_7;
    }
  }

  id v8 = 0;
LABEL_9:

  return v8;
}

id PLDescriptionFromXPCObject()
{
  id v0 = (void *)MEMORY[0x19F38FF10]();
  id v1 = [NSString stringWithUTF8String:v0];
  free(v0);
  return v1;
}

__CFString *PLStringFromXPCChangeSource(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @".Unknown(%d)", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E589F4F8[a1];
  }
  return v1;
}

id PLDescriptionFromXPCErrorDictionary(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E4F145A8])
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E4F14530]);
    if (string)
    {
      long long v6 = [NSString stringWithUTF8String:string];
      goto LABEL_12;
    }
  }
  else
  {
    id v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (v2) {
        Class Class = object_getClass(v2);
      }
      else {
        Class Class = 0;
      }
      int v8 = 134218240;
      uint64_t v9 = v2;
      __int16 v10 = 2048;
      Class v11 = Class;
      _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, error dictionary %p = %p", (uint8_t *)&v8, 0x16u);
    }
  }
  long long v6 = 0;
LABEL_12:

  return v6;
}

id PLStringFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  CFAllocatorRef v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v4, a2);
    if (string)
    {
      int v8 = [NSString stringWithUTF8String:string];
      goto LABEL_12;
    }
  }
  else
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        Class Class = object_getClass(v4);
      }
      else {
        Class Class = 0;
      }
      int v10 = 134218240;
      Class v11 = v4;
      __int16 v12 = 2048;
      Class v13 = Class;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v10, 0x16u);
    }
  }
  int v8 = 0;
LABEL_12:

  return v8;
}

id PLErrorFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLDataFromXPCDictionary(a1, a2);
  if (v2)
  {
    id v7 = 0;
    id v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      long long v5 = PLBackendGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Failed to unarchive NSError, error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id PLDataFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    id v7 = xpc_dictionary_get_value(v4, a2);
    int v8 = (const char *)_PLDataExplicitLengthKey((uint64_t)a2);
    int64_t int64 = xpc_dictionary_get_int64(v4, v8);
    uint64_t v10 = PLDataFromXPCDataObject(v7, int64);
  }
  else
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        Class Class = object_getClass(v4);
      }
      else {
        Class Class = 0;
      }
      int v12 = 134218240;
      Class v13 = v4;
      __int16 v14 = 2048;
      Class v15 = Class;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t _PLDataExplicitLengthKey(uint64_t a1)
{
  id v1 = [NSString stringWithUTF8String:a1];
  uint64_t v2 = [v1 stringByAppendingString:@"__LENGTH"];

  id v3 = v2;
  uint64_t v4 = [v3 UTF8String];

  return v4;
}

id PLDataFromXPCDataObject(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (!v3 || (Class Class = object_getClass(v3), Class == (Class)MEMORY[0x1E4F145D8]))
  {
LABEL_5:
    long long v6 = 0;
    goto LABEL_6;
  }
  if (Class != (Class)MEMORY[0x1E4F14580])
  {
    if (Class == (Class)MEMORY[0x1E4F145E8])
    {
      Class v11 = [PLXPCShMemData alloc];
      if (a2 < 1) {
        uint64_t v12 = [(PLXPCShMemData *)v11 initWithXPCShmem:v4];
      }
      else {
        uint64_t v12 = [(PLXPCShMemData *)v11 initWithXPCShmem:v4 length:a2];
      }
      long long v6 = (void *)v12;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  bytes_ptr = xpc_data_get_bytes_ptr(v4);
  size_t length = xpc_data_get_length(v4);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __PLDataFromXPCDataObject_block_invoke;
  v13[3] = &unk_1E589F408;
  id v14 = v4;
  long long v6 = (void *)[v8 initWithBytesNoCopy:bytes_ptr length:length deallocator:v13];

LABEL_6:
  return v6;
}

id PLURLFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    id v7 = PLStringFromXPCDictionary(v4, a2);
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        Class Class = object_getClass(v4);
      }
      else {
        Class Class = 0;
      }
      int v10 = 134218240;
      Class v11 = v4;
      __int16 v12 = 2048;
      Class v13 = Class;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v10, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

id PLDictionaryFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    id v7 = xpc_dictionary_get_value(v4, a2);
    id v8 = PLDictionaryFromXPCObject(v7);
  }
  else
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        Class Class = object_getClass(v4);
      }
      else {
        Class Class = 0;
      }
      int v10 = 134218240;
      Class v11 = v4;
      __int16 v12 = 2048;
      Class v13 = Class;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v10, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

id PLDictionaryFromXPCObject(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1 || object_getClass(v1) == (Class)MEMORY[0x1E4F145D8])
  {
    id v4 = 0;
    goto LABEL_13;
  }
  id v3 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
  if (!v3)
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "ERROR: PLDictionaryFromXPCDictionary failed to deserialize dictionary", (uint8_t *)&v9, 2u);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      long long v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "ERROR: PLDictionaryFromXPCDictionary failed to deserialize dictionary (root object not a dictionary: %@)", (uint8_t *)&v9, 0xCu);
    }
LABEL_11:

    id v4 = 0;
    goto LABEL_12;
  }
  id v4 = v3;
LABEL_12:

LABEL_13:
  return v4;
}

id PLArrayFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    id v7 = xpc_dictionary_get_value(v4, a2);
    id v8 = PLArrayFromXPCObject(v7);
  }
  else
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        Class Class = object_getClass(v4);
      }
      else {
        Class Class = 0;
      }
      int v10 = 134218240;
      uint64_t v11 = v4;
      __int16 v12 = 2048;
      Class v13 = Class;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v10, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

id PLArrayFromXPCObject(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1 || object_getClass(v1) == (Class)MEMORY[0x1E4F145D8])
  {
    id v4 = 0;
    goto LABEL_13;
  }
  id v3 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
  if (!v3)
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "ERROR: PLArrayFromXPCDictionary failed to deserialize array", (uint8_t *)&v9, 2u);
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      long long v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138412290;
      int v10 = v7;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "ERROR: PLArrayFromXPCDictionary failed to deserialize array (root object not an array: %@)", (uint8_t *)&v9, 0xCu);
    }
LABEL_11:

    id v4 = 0;
    goto LABEL_12;
  }
  id v4 = v3;
LABEL_12:

LABEL_13:
  return v4;
}

id PLDateFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v2 = xpc_dictionary_get_value(a1, a2);
  id v3 = PLDateFromXPCObject(v2);

  return v3;
}

id PLDateFromXPCObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && object_getClass(v1) == (Class)MEMORY[0x1E4F14598])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:xpc_double_get_value(v2)];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id PLManagedObjectIDFromXPCValue(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14580])
  {
    size_t length = xpc_data_get_length(v3);
    if (length + 1 > 0xC7)
    {
      long long v5 = PLBackendGetLog();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_WORD *)buf = 0;
      Class v13 = "Bogus object ID in xpc data.";
      uint64_t v14 = v5;
      uint32_t v15 = 2;
      goto LABEL_13;
    }
    size_t v8 = length;
    xpc_data_get_bytes_ptr(v3);
    __strncpy_chk();
    buf[v8] = 0;
    int v9 = [v4 managedObjectIDFromUTF8String:buf length:v8];
    if (v9) {
      goto LABEL_15;
    }
    int v10 = [v4 persistentStores];
    long long v5 = [v10 valueForKey:@"identifier"];

    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = [v5 componentsJoinedByString:@", "];
      int v17 = 136315394;
      unsigned int v18 = buf;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "Unable to get object ID for %s, persistent store IDs: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      if (v3) {
        Class Class = object_getClass(v3);
      }
      else {
        Class Class = 0;
      }
      *(_DWORD *)buf = 134218240;
      id v22 = v3;
      __int16 v23 = 2048;
      Class v24 = Class;
      Class v13 = "Bogus value type in xpc, data %p = %p";
      uint64_t v14 = v5;
      uint32_t v15 = 22;
LABEL_13:
      _os_log_impl(&dword_19BCFB000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    }
  }
LABEL_14:

  int v9 = 0;
LABEL_15:

  return v9;
}

IOSurfaceRef PLCreateIOSurfaceFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    id v7 = xpc_dictionary_get_value(v4, a2);
    size_t v8 = v7;
    if (v7) {
      IOSurfaceRef v9 = IOSurfaceLookupFromXPCObject(v7);
    }
    else {
      IOSurfaceRef v9 = 0;
    }
  }
  else
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        Class Class = object_getClass(v4);
      }
      else {
        Class Class = 0;
      }
      int v11 = 134218240;
      __int16 v12 = v4;
      __int16 v13 = 2048;
      Class v14 = Class;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", (uint8_t *)&v11, 0x16u);
    }

    IOSurfaceRef v9 = 0;
  }

  return v9;
}

id PLIndexSetFromXPCDictionary(void *a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3 && object_getClass(v3) == (Class)MEMORY[0x1E4F14590])
  {
    long long v5 = xpc_dictionary_get_value(v4, a2);
    if (v5)
    {
      id v7 = [MEMORY[0x1E4F28E60] indexSet];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x2020000000;
      uint64_t v14 = 0;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __PLIndexSetFromXPCDictionary_block_invoke;
      v10[3] = &unk_1E589F430;
      __int16 v12 = buf;
      id v8 = v7;
      id v11 = v8;
      xpc_array_apply(v5, v10);

      _Block_object_dispose(buf, 8);
      goto LABEL_11;
    }
  }
  else
  {
    long long v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        Class Class = object_getClass(v4);
      }
      else {
        Class Class = 0;
      }
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = Class;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Bogus value type in xpc, dictionary %p = %p", buf, 0x16u);
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

void sub_19BD4EAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PLIndexSetFromXPCDictionary_block_invoke(uint64_t a1, char a2, xpc_object_t xuint)
{
  if (a2) {
    objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), xpc_uint64_get_value(xuint));
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_uint64_get_value(xuint);
  }
  return 1;
}

id PLDataFromManagedObjectID(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CFURLRef v1 = [a1 URIRepresentation];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", buffer, CFURLGetBytes(v1, buffer, 250));

  return v2;
}

id PLManagedObjectIDFromData(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 length];
  if ((unint64_t)(v5 + 1) > 0xC8)
  {
    IOSurfaceRef v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v3;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Bogus object ID from data: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = v5;
    [v3 getBytes:buf length:v5];
    buf[v6] = 0;
    id v7 = [v4 managedObjectIDFromUTF8String:buf length:v6];
    if (v7) {
      goto LABEL_9;
    }
    id v8 = [v4 persistentStores];
    IOSurfaceRef v9 = [v8 valueForKey:@"identifier"];

    int v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v9 componentsJoinedByString:@", "];
      int v13 = 136315394;
      uint64_t v14 = buf;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Unable to get object ID for %s, persistent store IDs: %@", (uint8_t *)&v13, 0x16u);
    }
  }

  id v7 = 0;
LABEL_9:

  return v7;
}

void PLXPCDictionarySetString(void *a1, const char *a2, void *a3)
{
  xpc_object_t xdict = a1;
  uint64_t v5 = (const char *)[a3 UTF8String];
  if (v5) {
    xpc_dictionary_set_string(xdict, a2, v5);
  }
}

void PLXPCDictionarySetError(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if (a3)
  {
    id v9 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
    id v7 = v9;
    if (v6)
    {
      PLXPCDictionarySetData(v5, a2, v6);
    }
    else
    {
      id v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "Failed to archive errorData, error: %@", buf, 0xCu);
      }
    }
  }
}

void PLXPCDictionarySetData(void *a1, const char *a2, void *a3)
{
  if (a3)
  {
    id v5 = a1;
    uint64_t v6 = [a3 _createDispatchData];
    xpc_object_t value = xpc_data_create_with_dispatch_data(v6);

    xpc_dictionary_set_value(v5, a2, value);
  }
}

void PLXPCDictionarySetURL(void *a1, const char *a2, void *a3)
{
  xpc_object_t xdict = a1;
  id v5 = [a3 absoluteString];
  uint64_t v6 = v5;
  if (v5) {
    xpc_dictionary_set_string(xdict, a2, (const char *)[v5 UTF8String]);
  }
}

void PLXPCDictionarySetXPCDataWithLength(void *a1, const char *a2, void *a3, void *a4)
{
  id v7 = a4;
  xpc_object_t xdict = a1;
  xpc_dictionary_set_value(xdict, a2, a3);
  int64_t v8 = [v7 longLongValue];

  id v9 = (const char *)_PLDataExplicitLengthKey((uint64_t)a2);
  xpc_dictionary_set_int64(xdict, v9, v8);
}

void PLXPCDictionarySetDictionary(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    id v5 = (id)_CFXPCCreateXPCMessageWithCFObject();
    xpc_dictionary_set_value(v4, a2, v5);
  }
}

void PLXPCDictionarySetArray(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = a1;
    id v5 = (id)_CFXPCCreateXPCMessageWithCFObject();
    xpc_dictionary_set_value(v4, a2, v5);
  }
}

void PLXPCDictionarySetDate(void *a1, const char *a2, void *a3)
{
  if (a3)
  {
    xpc_object_t xdict = a1;
    [a3 timeIntervalSinceReferenceDate];
    xpc_dictionary_set_double(xdict, a2, v5);
  }
}

void PLXPCDictionarySetIOSurface(void *a1, const char *a2, __IOSurface *a3)
{
  id v5 = a1;
  if (a3)
  {
    xpc_object_t xdict = v5;
    xpc_object_t XPCObject = IOSurfaceCreateXPCObject(a3);
    if (XPCObject) {
      xpc_dictionary_set_value(xdict, a2, XPCObject);
    }

    id v5 = xdict;
  }
}

void PLXPCDictionarySetIndexSet(void *a1, const char *a2, void *a3)
{
  if (a3)
  {
    id v5 = a3;
    id v6 = a1;
    xpc_object_t v7 = xpc_array_create(0, 0);
    xpc_dictionary_set_value(v6, a2, v7);

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __PLXPCDictionarySetIndexSet_block_invoke;
    void v9[3] = &unk_1E589F458;
    id v10 = v7;
    id v8 = v7;
    [v5 enumerateRangesUsingBlock:v9];
  }
}

void __PLXPCDictionarySetIndexSet_block_invoke(uint64_t a1, uint64_t value, uint64_t a3, unsigned char *a4)
{
  *a4 = 0;
}

void PLXPCDictionarySetManagedObjectID(void *a1, const char *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  CFURLRef v6 = [a3 URIRepresentation];
  CFURLRef v7 = v6;
  if (v6)
  {
    int64_t v8 = CFURLGetBytes(v6, buffer, 250);
    if (v8 >= 1) {
      xpc_dictionary_set_data(v5, a2, buffer, v8);
    }
  }
}

void PLXPCArrayAppendManagedObjectID(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  CFURLRef v4 = [a2 URIRepresentation];
  CFURLRef v5 = v4;
  if (v4)
  {
    int64_t v6 = CFURLGetBytes(v4, buffer, 250);
    if (v6 >= 1) {
      xpc_array_set_data(v3, 0xFFFFFFFFFFFFFFFFLL, buffer, v6);
    }
  }
}

PLSandboxedURL *PLSandboxedURLFromXPCDictionary(void *a1, const char *a2)
{
  id v3 = a1;
  CFURLRef v4 = PLURLFromXPCDictionary(v3, a2);
  CFURLRef v5 = (const char *)_PLSandboxedURLTokenKey((uint64_t)a2);
  int64_t v6 = PLStringFromXPCDictionary(v3, v5);

  CFURLRef v7 = [[PLSandboxedURL alloc] initWithURL:v4 sandboxExtensionToken:v6 consume:1];
  return v7;
}

uint64_t _PLSandboxedURLTokenKey(uint64_t a1)
{
  CFURLRef v1 = [NSString stringWithUTF8String:a1];
  uint64_t v2 = [v1 stringByAppendingString:@"__TOKEN"];

  id v3 = v2;
  uint64_t v4 = [v3 UTF8String];

  return v4;
}

void PLXPCDictionarySetSandboxedURL(void *a1, const char *a2, void *a3)
{
  id v9 = a3;
  id v5 = a1;
  if ([v9 isFileURL])
  {
    int64_t v6 = [v9 path];
    CFURLRef v7 = PLGetSandboxExtensionTokenWithFlags(v6, *MEMORY[0x1E4F14000], *MEMORY[0x1E4F14120], 0);
  }
  else
  {
    CFURLRef v7 = 0;
  }
  PLXPCDictionarySetURL(v5, a2, v9);
  uint64_t v8 = (const char *)_PLSandboxedURLTokenKey((uint64_t)a2);
  PLXPCDictionarySetString(v5, v8, v7);
}

id PLGetSandboxExtensionToken(void *a1, uint64_t a2)
{
  return PLGetSandboxExtensionTokenWithFlags(a1, a2, *MEMORY[0x1E4F14120], 0);
}

void PLDictionarySetSandboxedURL(void *a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  id v5 = a1;
  if ([v10 isFileURL])
  {
    int64_t v6 = [v10 path];
    CFURLRef v7 = PLGetSandboxExtensionTokenWithFlags(v6, *MEMORY[0x1E4F14000], *MEMORY[0x1E4F14120], 0);
  }
  else
  {
    CFURLRef v7 = 0;
  }
  uint64_t v8 = [NSString stringWithUTF8String:a2];
  [v5 setObject:v10 forKeyedSubscript:v8];

  id v9 = [NSString stringWithUTF8String:_PLSandboxedURLTokenKey(a2)];
  [v5 setObject:v7 forKeyedSubscript:v9];
}

PLSandboxedURL *PLSandboxedURLFromDictionary(void *a1, uint64_t a2)
{
  id v3 = NSString;
  id v4 = a1;
  id v5 = [v3 stringWithUTF8String:a2];
  int64_t v6 = [v4 objectForKeyedSubscript:v5];

  CFURLRef v7 = [NSString stringWithUTF8String:_PLSandboxedURLTokenKey(a2)];
  uint64_t v8 = [v4 objectForKeyedSubscript:v7];

  id v9 = [[PLSandboxedURL alloc] initWithURL:v6 sandboxExtensionToken:v8 consume:1];
  return v9;
}

void PLJobLogDictionary(void *a1, void *a2)
{
}

void _PLJobLogDictionary(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  CFURLRef v7 = (void *)[@"\t" mutableCopy];
  if (a2 >= 1)
  {
    int v8 = a2;
    do
    {
      [v7 appendString:@"\t"];
      --v8;
    }
    while (v8);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = ___PLJobLogDictionary_block_invoke;
  v11[3] = &unk_1E589F4D8;
  id v12 = v6;
  id v13 = v7;
  int v14 = a2;
  id v9 = v7;
  id v10 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];
}

xpc_object_t PLCreateMemoryMappedXPCObjectFromFileURL(void *a1, void *a2, void *a3)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = [v5 path];
  int v8 = open((const char *)[v7 fileSystemRepresentation], 0);

  if (v8 <= 0)
  {
    int v23 = *__error();
    Class v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28798];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    uint64_t v26 = NSString;
    unint64_t v27 = [v5 lastPathComponent];
    char v28 = [v26 stringWithFormat:@"Unable to open '%@' for reading. (%s)", v27, strerror(v23)];
    v51[0] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    id v22 = [v24 errorWithDomain:v25 code:v23 userInfo:v29];
    xpc_object_t v30 = 0;
  }
  else
  {
    uint64_t v42 = a3;
    v43 = v5;
    id v41 = v6;
    size_t v9 = [v6 unsignedLongValue];
    id v10 = mmap(0, v9, 1, 1, v8, 0);
    int v11 = close(v8);
    id v12 = (uint64_t *)MEMORY[0x1E4F28798];
    id v13 = (uint64_t *)MEMORY[0x1E4F28568];
    if (v11)
    {
      int v14 = *__error();
      __int16 v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = v12;
      uint64_t v17 = *v12;
      uint64_t v48 = *v13;
      id v18 = NSString;
      uint64_t v19 = [v43 lastPathComponent];
      uint64_t v20 = [v18 stringWithFormat:@"Error closing file '%@'. (%s)", v19, strerror(v14)];
      double v49 = v20;
      unint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      id v22 = [v15 errorWithDomain:v17 code:v14 userInfo:v21];
    }
    else
    {
      uint64_t v16 = (uint64_t *)MEMORY[0x1E4F28798];
      id v22 = 0;
    }
    if (v10 == (void *)-1)
    {
      int v36 = *__error();
      uint64_t v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *v16;
      uint64_t v46 = *MEMORY[0x1E4F28568];
      uint64_t v39 = NSString;
      id v5 = v43;
      unint64_t v27 = [v43 lastPathComponent];
      char v28 = [v39 stringWithFormat:@"mmap(2) failed for '%@'. (%s)", v27, strerror(v36)];
      v47 = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      uint64_t v35 = [v37 errorWithDomain:v38 code:v36 userInfo:v29];

      xpc_object_t v30 = 0;
    }
    else
    {
      xpc_object_t v30 = xpc_shmem_create(v10, v9);
      if (!munmap(v10, v9))
      {
        id v6 = v41;
        a3 = v42;
        id v5 = v43;
        if (!v42) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
      int v31 = *__error();
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *v16;
      uint64_t v44 = *MEMORY[0x1E4F28568];
      uint64_t v34 = NSString;
      id v5 = v43;
      unint64_t v27 = [v43 lastPathComponent];
      char v28 = [v34 stringWithFormat:@"munmap(2) failed for '%@'. (%s)", v27, strerror(v31)];
      CGFloat v45 = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      uint64_t v35 = [v32 errorWithDomain:v33 code:v31 userInfo:v29];
    }
    id v22 = (void *)v35;
    id v6 = v41;
    a3 = v42;
  }

  if (a3) {
LABEL_12:
  }
    *a3 = v22;
LABEL_13:

  return v30;
}

xpc_object_t PLCreateMemoryMappedXPCObjectFromData(void *a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  size_t v4 = [v3 length];
  if (!v4)
  {
    __int16 v15 = 0;
    xpc_object_t v8 = 0;
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  size_t v5 = v4;
  id v6 = mmap(0, v4, 3, 4097, 1207959552, 0);
  if (v6 == (void *)-1)
  {
    int v16 = *__error();
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28798];
    uint64_t v19 = v16;
    uint64_t v23 = *MEMORY[0x1E4F28568];
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"mmap(2) failed. (%s)", strerror(v16));
    v24[0] = v13;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    __int16 v15 = [v17 errorWithDomain:v18 code:v19 userInfo:v14];
    xpc_object_t v8 = 0;
  }
  else
  {
    id v7 = v6;
    memcpy(v6, (const void *)[v3 bytes], v5);
    xpc_object_t v8 = xpc_shmem_create(v7, v5);
    if (!munmap(v7, v5))
    {
      __int16 v15 = 0;
      if (!a2) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    int v9 = *__error();
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28798];
    uint64_t v12 = v9;
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"munmap(2) failed. (%s)", strerror(v9), v21);
    id v22 = v13;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    __int16 v15 = [v10 errorWithDomain:v11 code:v12 userInfo:v14];
  }

  if (a2) {
LABEL_9:
  }
    *a2 = v15;
LABEL_10:

  return v8;
}

id PLGetSandboxExtensionTokenIfPossible(void *a1, uint64_t a2)
{
  return PLGetSandboxExtensionTokenWithFlags(a1, a2, *MEMORY[0x1E4F14130], 0);
}

id PLGetSandboxExtensionTokenForProcess(void *a1, uint64_t a2, uint64_t a3)
{
  return PLGetSandboxExtensionTokenWithFlags(a1, a2, *MEMORY[0x1E4F14120], a3);
}

void PLXPCActivityRegister(const char *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __PLXPCActivityRegister_block_invoke;
  handler[3] = &unk_1E589F480;
  id v12 = v6;
  id v13 = a1;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  xpc_activity_register(a1, v7, handler);
}

void __PLXPCActivityRegister_block_invoke(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state != 2)
  {
    if (state) {
      goto LABEL_11;
    }
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[6];
      int v10 = 136315138;
      uint64_t v11 = v6;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "registered xpc activity check in for identifier: %s", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = a1[4];
    if (!v7) {
      goto LABEL_11;
    }
LABEL_10:
    (*(void (**)(uint64_t, _xpc_activity_s *))(v7 + 16))(v7, v3);
    goto LABEL_11;
  }
  id v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[6];
    int v10 = 136315138;
    uint64_t v11 = v9;
    _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "registered xpc activity and pushed to run state for identifier: %s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v7 = a1[5];
  if (v7) {
    goto LABEL_10;
  }
LABEL_11:
}

void sub_19BD52224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BD52404(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PLDCIMURLForResourcePropertiesAndPathManager(uint64_t a1, unsigned int a2, unsigned int a3, int a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = [v12 photoDirectoryWithType:1];
  uint64_t v16 = [v15 UTF8String];

  id v17 = [v12 photoDirectoryWithType:4];
  [v17 UTF8String];

  id v18 = [v12 photoDirectoryWithType:9];
  uint64_t v19 = [v18 UTF8String];

  id v20 = [v12 photoDirectoryWithType:10];
  uint64_t v21 = [v20 UTF8String];

  id v22 = [v12 photoDirectoryWithType:18];
  uint64_t v23 = [v22 UTF8String];

  Class v24 = [v12 photoDirectoryWithType:12];

  id v25 = v24;
  uint64_t v26 = [v25 UTF8String];

  char v28 = PLDCIMURLForResourceProperties(a1, a2, a3, a4, v14, v13, v16, v27, v19, v21, v23, v26, a8);

  return v28;
}

id PLAggdGetLog()
{
  if (PLAggdGetLog_predicate != -1) {
    dispatch_once(&PLAggdGetLog_predicate, &__block_literal_global_2527);
  }
  id v0 = (void *)PLAggdGetLog_log;
  return v0;
}

uint64_t __PLAggdGetLog_block_invoke()
{
  PLAggdGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Aggd");
  return MEMORY[0x1F41817F8]();
}

id PLAnalysisCoordinatorGetLog()
{
  if (PLAnalysisCoordinatorGetLog_predicate != -1) {
    dispatch_once(&PLAnalysisCoordinatorGetLog_predicate, &__block_literal_global_3);
  }
  id v0 = (void *)PLAnalysisCoordinatorGetLog_log;
  return v0;
}

uint64_t __PLAnalysisCoordinatorGetLog_block_invoke()
{
  PLAnalysisCoordinatorGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "AnalysisCoordinator");
  return MEMORY[0x1F41817F8]();
}

id PLAssetAnalysisGetLog()
{
  if (PLAssetAnalysisGetLog_predicate != -1) {
    dispatch_once(&PLAssetAnalysisGetLog_predicate, &__block_literal_global_6_2531);
  }
  id v0 = (void *)PLAssetAnalysisGetLog_log;
  return v0;
}

uint64_t __PLAssetAnalysisGetLog_block_invoke()
{
  PLAssetAnalysisGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "AssetAnalysis");
  return MEMORY[0x1F41817F8]();
}

id PLAssetImportGetLog()
{
  if (PLAssetImportGetLog_predicate != -1) {
    dispatch_once(&PLAssetImportGetLog_predicate, &__block_literal_global_9);
  }
  id v0 = (void *)PLAssetImportGetLog_log;
  return v0;
}

uint64_t __PLAssetImportGetLog_block_invoke()
{
  PLAssetImportGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "AssetImport");
  return MEMORY[0x1F41817F8]();
}

id PLAvailabilityRequestGetLog()
{
  if (PLAvailabilityRequestGetLog_predicate != -1) {
    dispatch_once(&PLAvailabilityRequestGetLog_predicate, &__block_literal_global_12_2535);
  }
  id v0 = (void *)PLAvailabilityRequestGetLog_log;
  return v0;
}

uint64_t __PLAvailabilityRequestGetLog_block_invoke()
{
  PLAvailabilityRequestGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "AvailabilityRequest");
  return MEMORY[0x1F41817F8]();
}

id PLPhotoKitIngestGetLog()
{
  if (PLPhotoKitIngestGetLog_predicate != -1) {
    dispatch_once(&PLPhotoKitIngestGetLog_predicate, &__block_literal_global_18_2541);
  }
  id v0 = (void *)PLPhotoKitIngestGetLog_log;
  return v0;
}

uint64_t __PLPhotoKitIngestGetLog_block_invoke()
{
  PLPhotoKitIngestGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "PhotoKitIngest");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLBackgroundJobServiceGetLog_block_invoke()
{
  PLBackgroundJobServiceGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "BackgroundJobService");
  return MEMORY[0x1F41817F8]();
}

id PLCPLGetLog()
{
  if (PLCPLGetLog_predicate != -1) {
    dispatch_once(&PLCPLGetLog_predicate, &__block_literal_global_24_2545);
  }
  id v0 = (void *)PLCPLGetLog_log;
  return v0;
}

uint64_t __PLCPLGetLog_block_invoke()
{
  PLCPLGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "CPL");
  return MEMORY[0x1F41817F8]();
}

id PLCPLSignpostsTelemetryGetLog()
{
  if (PLCPLSignpostsTelemetryGetLog_predicate != -1) {
    dispatch_once(&PLCPLSignpostsTelemetryGetLog_predicate, &__block_literal_global_27);
  }
  id v0 = (void *)PLCPLSignpostsTelemetryGetLog_log;
  return v0;
}

uint64_t __PLCPLSignpostsTelemetryGetLog_block_invoke()
{
  PLCPLSignpostsTelemetryGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "CPLSignpostsTelemetry");
  return MEMORY[0x1F41817F8]();
}

id PLCameraConnectionKitGetLog()
{
  if (PLCameraConnectionKitGetLog_predicate != -1) {
    dispatch_once(&PLCameraConnectionKitGetLog_predicate, &__block_literal_global_33);
  }
  id v0 = (void *)PLCameraConnectionKitGetLog_log;
  return v0;
}

uint64_t __PLCameraConnectionKitGetLog_block_invoke()
{
  PLCameraConnectionKitGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "CameraConnectionKit");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLCameraTaskConstraintsGetLog_block_invoke()
{
  PLCameraTaskConstraintsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "CameraTaskConstraints");
  return MEMORY[0x1F41817F8]();
}

id PLClientServerTransactionsGetLog()
{
  if (PLClientServerTransactionsGetLog_predicate != -1) {
    dispatch_once(&PLClientServerTransactionsGetLog_predicate, &__block_literal_global_42);
  }
  id v0 = (void *)PLClientServerTransactionsGetLog_log;
  return v0;
}

uint64_t __PLClientServerTransactionsGetLog_block_invoke()
{
  PLClientServerTransactionsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "ClientServerTransactions");
  return MEMORY[0x1F41817F8]();
}

id PLCloudResourcePruneGetLog()
{
  if (PLCloudResourcePruneGetLog_predicate != -1) {
    dispatch_once(&PLCloudResourcePruneGetLog_predicate, &__block_literal_global_45);
  }
  id v0 = (void *)PLCloudResourcePruneGetLog_log;
  return v0;
}

uint64_t __PLCloudResourcePruneGetLog_block_invoke()
{
  PLCloudResourcePruneGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "CloudResourcePrune");
  return MEMORY[0x1F41817F8]();
}

id PLDaemonJobsGetLog()
{
  if (PLDaemonJobsGetLog_predicate != -1) {
    dispatch_once(&PLDaemonJobsGetLog_predicate, &__block_literal_global_48);
  }
  id v0 = (void *)PLDaemonJobsGetLog_log;
  return v0;
}

uint64_t __PLDaemonJobsGetLog_block_invoke()
{
  PLDaemonJobsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "DaemonJobs");
  return MEMORY[0x1F41817F8]();
}

id PLDeferredProcessingGetLog()
{
  if (PLDeferredProcessingGetLog_predicate != -1) {
    dispatch_once(&PLDeferredProcessingGetLog_predicate, &__block_literal_global_51);
  }
  id v0 = (void *)PLDeferredProcessingGetLog_log;
  return v0;
}

uint64_t __PLDeferredProcessingGetLog_block_invoke()
{
  PLDeferredProcessingGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "DeferredProcessing");
  return MEMORY[0x1F41817F8]();
}

id PLDupesGetLog()
{
  if (PLDupesGetLog_predicate != -1) {
    dispatch_once(&PLDupesGetLog_predicate, &__block_literal_global_54);
  }
  id v0 = (void *)PLDupesGetLog_log;
  return v0;
}

uint64_t __PLDupesGetLog_block_invoke()
{
  PLDupesGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Dupes");
  return MEMORY[0x1F41817F8]();
}

id PLDuplicateDetectionGetLog()
{
  if (PLDuplicateDetectionGetLog_predicate != -1) {
    dispatch_once(&PLDuplicateDetectionGetLog_predicate, &__block_literal_global_57_2559);
  }
  id v0 = (void *)PLDuplicateDetectionGetLog_log;
  return v0;
}

uint64_t __PLDuplicateDetectionGetLog_block_invoke()
{
  PLDuplicateDetectionGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "DuplicateDetection");
  return MEMORY[0x1F41817F8]();
}

id PLAssetStackGetLog()
{
  if (PLAssetStackGetLog_predicate != -1) {
    dispatch_once(&PLAssetStackGetLog_predicate, &__block_literal_global_60_2562);
  }
  id v0 = (void *)PLAssetStackGetLog_log;
  return v0;
}

uint64_t __PLAssetStackGetLog_block_invoke()
{
  PLAssetStackGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "AssetStack");
  return MEMORY[0x1F41817F8]();
}

id PLImageWriterGetLog()
{
  if (PLImageWriterGetLog_predicate != -1) {
    dispatch_once(&PLImageWriterGetLog_predicate, &__block_literal_global_69);
  }
  id v0 = (void *)PLImageWriterGetLog_log;
  return v0;
}

uint64_t __PLImageWriterGetLog_block_invoke()
{
  PLImageWriterGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "ImageWriter");
  return MEMORY[0x1F41817F8]();
}

id PLInterLibraryTransferGetLog()
{
  if (PLInterLibraryTransferGetLog_predicate != -1) {
    dispatch_once(&PLInterLibraryTransferGetLog_predicate, &__block_literal_global_78);
  }
  id v0 = (void *)PLInterLibraryTransferGetLog_log;
  return v0;
}

uint64_t __PLInterLibraryTransferGetLog_block_invoke()
{
  PLInterLibraryTransferGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "InterLibraryTransfer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLLibraryServicesGetLog_block_invoke()
{
  PLLibraryServicesGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "LibraryServices");
  return MEMORY[0x1F41817F8]();
}

id PLMomentGenerationGetLog()
{
  if (PLMomentGenerationGetLog_predicate != -1) {
    dispatch_once(&PLMomentGenerationGetLog_predicate, &__block_literal_global_90);
  }
  id v0 = (void *)PLMomentGenerationGetLog_log;
  return v0;
}

uint64_t __PLMomentGenerationGetLog_block_invoke()
{
  PLMomentGenerationGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "MomentGeneration");
  return MEMORY[0x1F41817F8]();
}

id PLMyPhotoStreamGetLog()
{
  if (PLMyPhotoStreamGetLog_predicate != -1) {
    dispatch_once(&PLMyPhotoStreamGetLog_predicate, &__block_literal_global_93);
  }
  id v0 = (void *)PLMyPhotoStreamGetLog_log;
  return v0;
}

uint64_t __PLMyPhotoStreamGetLog_block_invoke()
{
  PLMyPhotoStreamGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "MyPhotoStream");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPTPGetLog_block_invoke()
{
  PLPTPGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "PTP");
  return MEMORY[0x1F41817F8]();
}

id PLPhotoAnalysisQueriesGetLog()
{
  if (PLPhotoAnalysisQueriesGetLog_predicate != -1) {
    dispatch_once(&PLPhotoAnalysisQueriesGetLog_predicate, &__block_literal_global_102);
  }
  id v0 = (void *)PLPhotoAnalysisQueriesGetLog_log;
  return v0;
}

uint64_t __PLPhotoAnalysisQueriesGetLog_block_invoke()
{
  PLPhotoAnalysisQueriesGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "photoanalysisd");
  return MEMORY[0x1F41817F8]();
}

id PLImportGetLog()
{
  if (PLImportGetLog_predicate != -1) {
    dispatch_once(&PLImportGetLog_predicate, &__block_literal_global_111_2587);
  }
  id v0 = (void *)PLImportGetLog_log;
  return v0;
}

uint64_t __PLImportGetLog_block_invoke()
{
  PLImportGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Import");
  return MEMORY[0x1F41817F8]();
}

id PLPrefetchGetLog()
{
  if (PLPrefetchGetLog_predicate != -1) {
    dispatch_once(&PLPrefetchGetLog_predicate, &__block_literal_global_120);
  }
  id v0 = (void *)PLPrefetchGetLog_log;
  return v0;
}

uint64_t __PLPrefetchGetLog_block_invoke()
{
  PLPrefetchGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "prefetch");
  return MEMORY[0x1F41817F8]();
}

id PLResourceCachingGetLog()
{
  if (PLResourceCachingGetLog_predicate != -1) {
    dispatch_once(&PLResourceCachingGetLog_predicate, &__block_literal_global_123);
  }
  id v0 = (void *)PLResourceCachingGetLog_log;
  return v0;
}

uint64_t __PLResourceCachingGetLog_block_invoke()
{
  PLResourceCachingGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "ResourceCaching");
  return MEMORY[0x1F41817F8]();
}

id PLSearchIndexGetLog()
{
  if (PLSearchIndexGetLog_predicate != -1) {
    dispatch_once(&PLSearchIndexGetLog_predicate, &__block_literal_global_126);
  }
  id v0 = (void *)PLSearchIndexGetLog_log;
  return v0;
}

uint64_t __PLSearchIndexGetLog_block_invoke()
{
  PLSearchIndexGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "SearchIndex");
  return MEMORY[0x1F41817F8]();
}

id PLSyncGetLog()
{
  if (PLSyncGetLog_predicate != -1) {
    dispatch_once(&PLSyncGetLog_predicate, &__block_literal_global_129);
  }
  id v0 = (void *)PLSyncGetLog_log;
  return v0;
}

uint64_t __PLSyncGetLog_block_invoke()
{
  PLSyncGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Sync");
  return MEMORY[0x1F41817F8]();
}

id PLSyndicationGetLog()
{
  if (PLSyndicationGetLog_predicate != -1) {
    dispatch_once(&PLSyndicationGetLog_predicate, &__block_literal_global_132);
  }
  id v0 = (void *)PLSyndicationGetLog_log;
  return v0;
}

uint64_t __PLSyndicationGetLog_block_invoke()
{
  PLSyndicationGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Syndication");
  return MEMORY[0x1F41817F8]();
}

id PLThumbnailsGetLog()
{
  if (PLThumbnailsGetLog_predicate != -1) {
    dispatch_once(&PLThumbnailsGetLog_predicate, &__block_literal_global_135);
  }
  id v0 = (void *)PLThumbnailsGetLog_log;
  return v0;
}

uint64_t __PLThumbnailsGetLog_block_invoke()
{
  PLThumbnailsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "Thumbnails");
  return MEMORY[0x1F41817F8]();
}

id PLUserFeedbackGetLog()
{
  if (PLUserFeedbackGetLog_predicate != -1) {
    dispatch_once(&PLUserFeedbackGetLog_predicate, &__block_literal_global_141);
  }
  id v0 = (void *)PLUserFeedbackGetLog_log;
  return v0;
}

uint64_t __PLUserFeedbackGetLog_block_invoke()
{
  PLUserFeedbackGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "UserFeedback");
  return MEMORY[0x1F41817F8]();
}

id PLBackendSharingGetLog()
{
  if (PLBackendSharingGetLog_predicate != -1) {
    dispatch_once(&PLBackendSharingGetLog_predicate, &__block_literal_global_147);
  }
  id v0 = (void *)PLBackendSharingGetLog_log;
  return v0;
}

uint64_t __PLBackendSharingGetLog_block_invoke()
{
  PLBackendSharingGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "BackendSharing");
  return MEMORY[0x1F41817F8]();
}

id PLStoreDemoModeGetLog()
{
  if (PLStoreDemoModeGetLog_predicate != -1) {
    dispatch_once(&PLStoreDemoModeGetLog_predicate, &__block_literal_global_150);
  }
  id v0 = (void *)PLStoreDemoModeGetLog_log;
  return v0;
}

uint64_t __PLStoreDemoModeGetLog_block_invoke()
{
  PLStoreDemoModeGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A238], "StoreDemoMode");
  return MEMORY[0x1F41817F8]();
}

id PLAirPlayGetLog()
{
  if (PLAirPlayGetLog_predicate != -1) {
    dispatch_once(&PLAirPlayGetLog_predicate, &__block_literal_global_153);
  }
  id v0 = (void *)PLAirPlayGetLog_log;
  return v0;
}

uint64_t __PLAirPlayGetLog_block_invoke()
{
  PLAirPlayGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "AirPlay");
  return MEMORY[0x1F41817F8]();
}

id PLAmbientPhotoFrameGetLog()
{
  if (PLAmbientPhotoFrameGetLog_predicate != -1) {
    dispatch_once(&PLAmbientPhotoFrameGetLog_predicate, &__block_literal_global_156);
  }
  id v0 = (void *)PLAmbientPhotoFrameGetLog_log;
  return v0;
}

uint64_t __PLAmbientPhotoFrameGetLog_block_invoke()
{
  PLAmbientPhotoFrameGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "AmbientPhotoFrame");
  return MEMORY[0x1F41817F8]();
}

id PLAnimationTelemetryGetLog()
{
  if (PLAnimationTelemetryGetLog_predicate != -1) {
    dispatch_once(&PLAnimationTelemetryGetLog_predicate, &__block_literal_global_159);
  }
  id v0 = (void *)PLAnimationTelemetryGetLog_log;
  return v0;
}

uint64_t __PLAnimationTelemetryGetLog_block_invoke()
{
  PLAnimationTelemetryGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "AnimationTelemetry");
  return MEMORY[0x1F41817F8]();
}

id PLAudioPlaybackGetLog()
{
  if (PLAudioPlaybackGetLog_predicate != -1) {
    dispatch_once(&PLAudioPlaybackGetLog_predicate, &__block_literal_global_162);
  }
  id v0 = (void *)PLAudioPlaybackGetLog_log;
  return v0;
}

uint64_t __PLAudioPlaybackGetLog_block_invoke()
{
  PLAudioPlaybackGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "AudioPlayback");
  return MEMORY[0x1F41817F8]();
}

id PLCloudFeedGetLog()
{
  if (PLCloudFeedGetLog_predicate != -1) {
    dispatch_once(&PLCloudFeedGetLog_predicate, &__block_literal_global_165);
  }
  id v0 = (void *)PLCloudFeedGetLog_log;
  return v0;
}

uint64_t __PLCloudFeedGetLog_block_invoke()
{
  PLCloudFeedGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "CloudFeed");
  return MEMORY[0x1F41817F8]();
}

id PLSharedAlbumsGetLog()
{
  if (PLSharedAlbumsGetLog_predicate != -1) {
    dispatch_once(&PLSharedAlbumsGetLog_predicate, &__block_literal_global_168);
  }
  id v0 = (void *)PLSharedAlbumsGetLog_log;
  return v0;
}

uint64_t __PLSharedAlbumsGetLog_block_invoke()
{
  PLSharedAlbumsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "SharedAlbums");
  return MEMORY[0x1F41817F8]();
}

id PLSharingGetLog()
{
  if (PLSharingGetLog_predicate != -1) {
    dispatch_once(&PLSharingGetLog_predicate, &__block_literal_global_171);
  }
  id v0 = (void *)PLSharingGetLog_log;
  return v0;
}

uint64_t __PLSharingGetLog_block_invoke()
{
  PLSharingGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Sharing");
  return MEMORY[0x1F41817F8]();
}

id PLGridZeroGetLog()
{
  if (PLGridZeroGetLog_predicate != -1) {
    dispatch_once(&PLGridZeroGetLog_predicate, &__block_literal_global_183);
  }
  id v0 = (void *)PLGridZeroGetLog_log;
  return v0;
}

uint64_t __PLGridZeroGetLog_block_invoke()
{
  PLGridZeroGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "GridZero");
  return MEMORY[0x1F41817F8]();
}

id PLLivePhotoPlaybackGetLog()
{
  if (PLLivePhotoPlaybackGetLog_predicate != -1) {
    dispatch_once(&PLLivePhotoPlaybackGetLog_predicate, &__block_literal_global_186);
  }
  id v0 = (void *)PLLivePhotoPlaybackGetLog_log;
  return v0;
}

uint64_t __PLLivePhotoPlaybackGetLog_block_invoke()
{
  PLLivePhotoPlaybackGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "LivePhotoPlayback");
  return MEMORY[0x1F41817F8]();
}

id PLMemoriesGetLog()
{
  if (PLMemoriesGetLog_predicate != -1) {
    dispatch_once(&PLMemoriesGetLog_predicate, &__block_literal_global_189);
  }
  id v0 = (void *)PLMemoriesGetLog_log;
  return v0;
}

uint64_t __PLMemoriesGetLog_block_invoke()
{
  PLMemoriesGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Memories");
  return MEMORY[0x1F41817F8]();
}

id PLMomentsGetLog()
{
  if (PLMomentsGetLog_predicate != -1) {
    dispatch_once(&PLMomentsGetLog_predicate, &__block_literal_global_192);
  }
  id v0 = (void *)PLMomentsGetLog_log;
  return v0;
}

uint64_t __PLMomentsGetLog_block_invoke()
{
  PLMomentsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Moments");
  return MEMORY[0x1F41817F8]();
}

id PLPAImageGetLog()
{
  if (PLPAImageGetLog_predicate != -1) {
    dispatch_once(&PLPAImageGetLog_predicate, &__block_literal_global_198);
  }
  id v0 = (void *)PLPAImageGetLog_log;
  return v0;
}

uint64_t __PLPAImageGetLog_block_invoke()
{
  PLPAImageGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "PAImage");
  return MEMORY[0x1F41817F8]();
}

id PLPALayerGetLog()
{
  if (PLPALayerGetLog_predicate != -1) {
    dispatch_once(&PLPALayerGetLog_predicate, &__block_literal_global_201);
  }
  id v0 = (void *)PLPALayerGetLog_log;
  return v0;
}

uint64_t __PLPALayerGetLog_block_invoke()
{
  PLPALayerGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "PALayer");
  return MEMORY[0x1F41817F8]();
}

id PLPeopleGetLog()
{
  if (PLPeopleGetLog_predicate != -1) {
    dispatch_once(&PLPeopleGetLog_predicate, &__block_literal_global_204);
  }
  id v0 = (void *)PLPeopleGetLog_log;
  return v0;
}

uint64_t __PLPeopleGetLog_block_invoke()
{
  PLPeopleGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "People");
  return MEMORY[0x1F41817F8]();
}

id PLPhotoEditGetLog()
{
  if (PLPhotoEditGetLog_predicate != -1) {
    dispatch_once(&PLPhotoEditGetLog_predicate, &__block_literal_global_210);
  }
  id v0 = (void *)PLPhotoEditGetLog_log;
  return v0;
}

uint64_t __PLPhotoEditGetLog_block_invoke()
{
  PLPhotoEditGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "PhotoEdit");
  return MEMORY[0x1F41817F8]();
}

id PLPhotoPickerGetLog()
{
  if (PLPhotoPickerGetLog_predicate != -1) {
    dispatch_once(&PLPhotoPickerGetLog_predicate, &__block_literal_global_213);
  }
  id v0 = (void *)PLPhotoPickerGetLog_log;
  return v0;
}

uint64_t __PLPhotoPickerGetLog_block_invoke()
{
  PLPhotoPickerGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "PhotoPicker");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLPhotosSearchGetLog_block_invoke()
{
  PLPhotosSearchGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "PhotosSearch");
  return MEMORY[0x1F41817F8]();
}

id PLPickerGetLog()
{
  if (PLPickerGetLog_predicate != -1) {
    dispatch_once(&PLPickerGetLog_predicate, &__block_literal_global_219);
  }
  id v0 = (void *)PLPickerGetLog_log;
  return v0;
}

uint64_t __PLPickerGetLog_block_invoke()
{
  PLPickerGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Picker");
  return MEMORY[0x1F41817F8]();
}

id PLRelatedGetLog()
{
  if (PLRelatedGetLog_predicate != -1) {
    dispatch_once(&PLRelatedGetLog_predicate, &__block_literal_global_225);
  }
  id v0 = (void *)PLRelatedGetLog_log;
  return v0;
}

uint64_t __PLRelatedGetLog_block_invoke()
{
  PLRelatedGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Related");
  return MEMORY[0x1F41817F8]();
}

id PLShareSheetGetLog()
{
  if (PLShareSheetGetLog_predicate != -1) {
    dispatch_once(&PLShareSheetGetLog_predicate, &__block_literal_global_228);
  }
  id v0 = (void *)PLShareSheetGetLog_log;
  return v0;
}

uint64_t __PLShareSheetGetLog_block_invoke()
{
  PLShareSheetGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "ShareSheet");
  return MEMORY[0x1F41817F8]();
}

id PLSidebarGetLog()
{
  if (PLSidebarGetLog_predicate != -1) {
    dispatch_once(&PLSidebarGetLog_predicate, &__block_literal_global_234);
  }
  id v0 = (void *)PLSidebarGetLog_log;
  return v0;
}

uint64_t __PLSidebarGetLog_block_invoke()
{
  PLSidebarGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Sidebar");
  return MEMORY[0x1F41817F8]();
}

id PLHomeGetLog()
{
  if (PLHomeGetLog_predicate != -1) {
    dispatch_once(&PLHomeGetLog_predicate, &__block_literal_global_240);
  }
  id v0 = (void *)PLHomeGetLog_log;
  return v0;
}

uint64_t __PLHomeGetLog_block_invoke()
{
  PLHomeGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Home");
  return MEMORY[0x1F41817F8]();
}

id PLUIActionsGetLog()
{
  if (PLUIActionsGetLog_predicate != -1) {
    dispatch_once(&PLUIActionsGetLog_predicate, &__block_literal_global_249);
  }
  id v0 = (void *)PLUIActionsGetLog_log;
  return v0;
}

uint64_t __PLUIActionsGetLog_block_invoke()
{
  PLUIActionsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "UIActions");
  return MEMORY[0x1F41817F8]();
}

id PLVideoPlaybackGetLog()
{
  if (PLVideoPlaybackGetLog_predicate != -1) {
    dispatch_once(&PLVideoPlaybackGetLog_predicate, &__block_literal_global_258);
  }
  id v0 = (void *)PLVideoPlaybackGetLog_log;
  return v0;
}

uint64_t __PLVideoPlaybackGetLog_block_invoke()
{
  PLVideoPlaybackGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "VideoPlayback");
  return MEMORY[0x1F41817F8]();
}

id PLWallpaperGetLog()
{
  if (PLWallpaperGetLog_predicate != -1) {
    dispatch_once(&PLWallpaperGetLog_predicate, &__block_literal_global_261);
  }
  id v0 = (void *)PLWallpaperGetLog_log;
  return v0;
}

uint64_t __PLWallpaperGetLog_block_invoke()
{
  PLWallpaperGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Wallpaper");
  return MEMORY[0x1F41817F8]();
}

id PLGadgetsGetLog()
{
  if (PLGadgetsGetLog_predicate != -1) {
    dispatch_once(&PLGadgetsGetLog_predicate, &__block_literal_global_267);
  }
  id v0 = (void *)PLGadgetsGetLog_log;
  return v0;
}

uint64_t __PLGadgetsGetLog_block_invoke()
{
  PLGadgetsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Gadgets");
  return MEMORY[0x1F41817F8]();
}

id PLPlacesGetLog()
{
  if (PLPlacesGetLog_predicate != -1) {
    dispatch_once(&PLPlacesGetLog_predicate, &__block_literal_global_270);
  }
  id v0 = (void *)PLPlacesGetLog_log;
  return v0;
}

uint64_t __PLPlacesGetLog_block_invoke()
{
  PLPlacesGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Places");
  return MEMORY[0x1F41817F8]();
}

id PLTipsGetLog()
{
  if (PLTipsGetLog_predicate != -1) {
    dispatch_once(&PLTipsGetLog_predicate, &__block_literal_global_273);
  }
  id v0 = (void *)PLTipsGetLog_log;
  return v0;
}

uint64_t __PLTipsGetLog_block_invoke()
{
  PLTipsGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "Tips");
  return MEMORY[0x1F41817F8]();
}

id PLUserActivityGetLog()
{
  if (PLUserActivityGetLog_predicate != -1) {
    dispatch_once(&PLUserActivityGetLog_predicate, &__block_literal_global_279);
  }
  id v0 = (void *)PLUserActivityGetLog_log;
  return v0;
}

uint64_t __PLUserActivityGetLog_block_invoke()
{
  PLUserActivityGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "UserActivity");
  return MEMORY[0x1F41817F8]();
}

id PLVisualIntelligenceGetLog()
{
  if (PLVisualIntelligenceGetLog_predicate != -1) {
    dispatch_once(&PLVisualIntelligenceGetLog_predicate, &__block_literal_global_291);
  }
  id v0 = (void *)PLVisualIntelligenceGetLog_log;
  return v0;
}

uint64_t __PLVisualIntelligenceGetLog_block_invoke()
{
  PLVisualIntelligenceGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x1E4F8A240], "VisualIntelligence");
  return MEMORY[0x1F41817F8]();
}

id PLAssetExplorerGetLog()
{
  if (PLAssetExplorerGetLog_predicate != -1) {
    dispatch_once(&PLAssetExplorerGetLog_predicate, &__block_literal_global_294);
  }
  id v0 = (void *)PLAssetExplorerGetLog_log;
  return v0;
}

uint64_t __PLAssetExplorerGetLog_block_invoke()
{
  PLAssetExplorerGetLog_log = (uint64_t)os_log_create("com.apple.messages.asset-explorer", "AssetExplorer");
  return MEMORY[0x1F41817F8]();
}

id PLCameraGetLog()
{
  if (PLCameraGetLog_predicate != -1) {
    dispatch_once(&PLCameraGetLog_predicate, &__block_literal_global_298);
  }
  id v0 = (void *)PLCameraGetLog_log;
  return v0;
}

uint64_t __PLCameraGetLog_block_invoke()
{
  PLCameraGetLog_log = (uint64_t)os_log_create("com.apple.photos.camera", "Camera");
  return MEMORY[0x1F41817F8]();
}

id PLTimelineGetLog()
{
  if (PLTimelineGetLog_predicate != -1) {
    dispatch_once(&PLTimelineGetLog_predicate, &__block_literal_global_302);
  }
  id v0 = (void *)PLTimelineGetLog_log;
  return v0;
}

uint64_t __PLTimelineGetLog_block_invoke()
{
  PLTimelineGetLog_log = (uint64_t)os_log_create("com.apple.photos.PhotosReliveWidget", "TimelineGeneration");
  return MEMORY[0x1F41817F8]();
}

id PLUpNextGetLog()
{
  if (PLUpNextGetLog_predicate != -1) {
    dispatch_once(&PLUpNextGetLog_predicate, &__block_literal_global_306);
  }
  id v0 = (void *)PLUpNextGetLog_log;
  return v0;
}

uint64_t __PLUpNextGetLog_block_invoke()
{
  PLUpNextGetLog_log = (uint64_t)os_log_create("com.apple.photos.memories.upNext", "UpNextGeneration");
  return MEMORY[0x1F41817F8]();
}

id PLPhotosSearchCurationGetLog()
{
  if (PLPhotosSearchCurationGetLog_predicate != -1) {
    dispatch_once(&PLPhotosSearchCurationGetLog_predicate, &__block_literal_global_310);
  }
  id v0 = (void *)PLPhotosSearchCurationGetLog_log;
  return v0;
}

uint64_t __PLPhotosSearchCurationGetLog_block_invoke()
{
  PLPhotosSearchCurationGetLog_log = (uint64_t)os_log_create("com.apple.photos.search.curation", "SearchCuration");
  return MEMORY[0x1F41817F8]();
}

id PLPhotosStatusGetLog()
{
  if (PLPhotosStatusGetLog_predicate != -1) {
    dispatch_once(&PLPhotosStatusGetLog_predicate, &__block_literal_global_314);
  }
  id v0 = (void *)PLPhotosStatusGetLog_log;
  return v0;
}

uint64_t __PLPhotosStatusGetLog_block_invoke()
{
  PLPhotosStatusGetLog_log = (uint64_t)os_log_create("com.apple.photos.status", "PhotosStatus");
  return MEMORY[0x1F41817F8]();
}

id PLSearchUIDisplayGetLog()
{
  if (PLSearchUIDisplayGetLog_predicate != -1) {
    dispatch_once(&PLSearchUIDisplayGetLog_predicate, &__block_literal_global_318);
  }
  id v0 = (void *)PLSearchUIDisplayGetLog_log;
  return v0;
}

uint64_t __PLSearchUIDisplayGetLog_block_invoke()
{
  PLSearchUIDisplayGetLog_log = (uint64_t)os_log_create("com.apple.photos.ui.search", "SearchUIDisplay");
  return MEMORY[0x1F41817F8]();
}

id PLSearchUIQueryGetLog()
{
  if (PLSearchUIQueryGetLog_predicate != -1) {
    dispatch_once(&PLSearchUIQueryGetLog_predicate, &__block_literal_global_321);
  }
  id v0 = (void *)PLSearchUIQueryGetLog_log;
  return v0;
}

uint64_t __PLSearchUIQueryGetLog_block_invoke()
{
  PLSearchUIQueryGetLog_log = (uint64_t)os_log_create("com.apple.photos.ui.search", "SearchUIQuery");
  return MEMORY[0x1F41817F8]();
}

id PLSearchUIParsecAnalyticsGetLog()
{
  if (PLSearchUIParsecAnalyticsGetLog_predicate != -1) {
    dispatch_once(&PLSearchUIParsecAnalyticsGetLog_predicate, &__block_literal_global_324);
  }
  id v0 = (void *)PLSearchUIParsecAnalyticsGetLog_log;
  return v0;
}

uint64_t __PLSearchUIParsecAnalyticsGetLog_block_invoke()
{
  PLSearchUIParsecAnalyticsGetLog_log = (uint64_t)os_log_create("com.apple.photos.ui.search", "SearchUIParsecAnalytics");
  return MEMORY[0x1F41817F8]();
}

id PLSearchUIAssetCurationGetLog()
{
  if (PLSearchUIAssetCurationGetLog_predicate != -1) {
    dispatch_once(&PLSearchUIAssetCurationGetLog_predicate, &__block_literal_global_327);
  }
  id v0 = (void *)PLSearchUIAssetCurationGetLog_log;
  return v0;
}

uint64_t __PLSearchUIAssetCurationGetLog_block_invoke()
{
  PLSearchUIAssetCurationGetLog_log = (uint64_t)os_log_create("com.apple.photos.ui.search", "SearchUIAssetCuration");
  return MEMORY[0x1F41817F8]();
}

id PLSearchUISpotlightGetLog()
{
  if (PLSearchUISpotlightGetLog_predicate != -1) {
    dispatch_once(&PLSearchUISpotlightGetLog_predicate, &__block_literal_global_330);
  }
  id v0 = (void *)PLSearchUISpotlightGetLog_log;
  return v0;
}

uint64_t __PLSearchUISpotlightGetLog_block_invoke()
{
  PLSearchUISpotlightGetLog_log = (uint64_t)os_log_create("com.apple.photos.ui.search", "SearchUISpotlight");
  return MEMORY[0x1F41817F8]();
}

id PLSearchUIBiomeGetLog()
{
  if (PLSearchUIBiomeGetLog_predicate != -1) {
    dispatch_once(&PLSearchUIBiomeGetLog_predicate, &__block_literal_global_333);
  }
  id v0 = (void *)PLSearchUIBiomeGetLog_log;
  return v0;
}

uint64_t __PLSearchUIBiomeGetLog_block_invoke()
{
  PLSearchUIBiomeGetLog_log = (uint64_t)os_log_create("com.apple.photos.ui.search", "SearchUIBiome");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendIndexStatusGetLog()
{
  if (PLSearchBackendIndexStatusGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendIndexStatusGetLog_predicate, &__block_literal_global_336);
  }
  id v0 = (void *)PLSearchBackendIndexStatusGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendIndexStatusGetLog_block_invoke()
{
  PLSearchBackendIndexStatusGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendIndexStatus");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendIndexRebuildGetLog()
{
  if (PLSearchBackendIndexRebuildGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendIndexRebuildGetLog_predicate, &__block_literal_global_339);
  }
  id v0 = (void *)PLSearchBackendIndexRebuildGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendIndexRebuildGetLog_block_invoke()
{
  PLSearchBackendIndexRebuildGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendIndexRebuild");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLSearchBackendIndexManagerGetLog_block_invoke()
{
  PLSearchBackendIndexManagerGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendIndexManager");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendIndexingEngineGetLog()
{
  if (PLSearchBackendIndexingEngineGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendIndexingEngineGetLog_predicate, &__block_literal_global_345);
  }
  id v0 = (void *)PLSearchBackendIndexingEngineGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendIndexingEngineGetLog_block_invoke()
{
  PLSearchBackendIndexingEngineGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendIndexingEngine");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendIndexWorkerGetLog()
{
  if (PLSearchBackendIndexWorkerGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendIndexWorkerGetLog_predicate, &__block_literal_global_348);
  }
  id v0 = (void *)PLSearchBackendIndexWorkerGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendIndexWorkerGetLog_block_invoke()
{
  PLSearchBackendIndexWorkerGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendIndexWorker");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendLibraryChangeTrackingGetLog()
{
  if (PLSearchBackendLibraryChangeTrackingGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendLibraryChangeTrackingGetLog_predicate, &__block_literal_global_351);
  }
  id v0 = (void *)PLSearchBackendLibraryChangeTrackingGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendLibraryChangeTrackingGetLog_block_invoke()
{
  PLSearchBackendLibraryChangeTrackingGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendLibraryChangeTracking");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendGraphUpdatesGetLog()
{
  if (PLSearchBackendGraphUpdatesGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendGraphUpdatesGetLog_predicate, &__block_literal_global_354);
  }
  id v0 = (void *)PLSearchBackendGraphUpdatesGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendGraphUpdatesGetLog_block_invoke()
{
  PLSearchBackendGraphUpdatesGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendGraphUpdates");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendDonationsGetLog()
{
  if (PLSearchBackendDonationsGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendDonationsGetLog_predicate, &__block_literal_global_357);
  }
  id v0 = (void *)PLSearchBackendDonationsGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendDonationsGetLog_block_invoke()
{
  PLSearchBackendDonationsGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendDonations");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendDonationProgressGetLog()
{
  if (PLSearchBackendDonationProgressGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendDonationProgressGetLog_predicate, &__block_literal_global_360);
  }
  id v0 = (void *)PLSearchBackendDonationProgressGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendDonationProgressGetLog_block_invoke()
{
  PLSearchBackendDonationProgressGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendDonationProgress");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendModelTranslationGetLog()
{
  if (PLSearchBackendModelTranslationGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendModelTranslationGetLog_predicate, &__block_literal_global_363);
  }
  id v0 = (void *)PLSearchBackendModelTranslationGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendModelTranslationGetLog_block_invoke()
{
  PLSearchBackendModelTranslationGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendModelTranslation");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendStickerSuggestionsGetLog()
{
  if (PLSearchBackendStickerSuggestionsGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendStickerSuggestionsGetLog_predicate, &__block_literal_global_366);
  }
  id v0 = (void *)PLSearchBackendStickerSuggestionsGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendStickerSuggestionsGetLog_block_invoke()
{
  PLSearchBackendStickerSuggestionsGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendStickerSuggestions");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendPhotosDatabaseFetchGetLog()
{
  if (PLSearchBackendPhotosDatabaseFetchGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendPhotosDatabaseFetchGetLog_predicate, &__block_literal_global_369);
  }
  id v0 = (void *)PLSearchBackendPhotosDatabaseFetchGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendPhotosDatabaseFetchGetLog_block_invoke()
{
  PLSearchBackendPhotosDatabaseFetchGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendPhotosDatabaseFetch");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendSceneTaxonomyGetLog()
{
  if (PLSearchBackendSceneTaxonomyGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendSceneTaxonomyGetLog_predicate, &__block_literal_global_372);
  }
  id v0 = (void *)PLSearchBackendSceneTaxonomyGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendSceneTaxonomyGetLog_block_invoke()
{
  PLSearchBackendSceneTaxonomyGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendSceneTaxonomy");
  return MEMORY[0x1F41817F8]();
}

uint64_t __PLSearchBackendQueryGetLog_block_invoke()
{
  PLSearchBackendQueryGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendQuery");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendResultProcessingGetLog()
{
  if (PLSearchBackendResultProcessingGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendResultProcessingGetLog_predicate, &__block_literal_global_378);
  }
  id v0 = (void *)PLSearchBackendResultProcessingGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendResultProcessingGetLog_block_invoke()
{
  PLSearchBackendResultProcessingGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendResultProcessing");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendPSIDatabaseGetLog()
{
  if (PLSearchBackendPSIDatabaseGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendPSIDatabaseGetLog_predicate, &__block_literal_global_381);
  }
  id v0 = (void *)PLSearchBackendPSIDatabaseGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendPSIDatabaseGetLog_block_invoke()
{
  PLSearchBackendPSIDatabaseGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendPSIDatabase");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendIndexStatusMaintenanceTaskGetLog()
{
  if (PLSearchBackendIndexStatusMaintenanceTaskGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendIndexStatusMaintenanceTaskGetLog_predicate, &__block_literal_global_384);
  }
  id v0 = (void *)PLSearchBackendIndexStatusMaintenanceTaskGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendIndexStatusMaintenanceTaskGetLog_block_invoke()
{
  PLSearchBackendIndexStatusMaintenanceTaskGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendIndexStatusMaintenanceTask");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendPhotoKitAPIGetLog()
{
  if (PLSearchBackendPhotoKitAPIGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendPhotoKitAPIGetLog_predicate, &__block_literal_global_387);
  }
  id v0 = (void *)PLSearchBackendPhotoKitAPIGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendPhotoKitAPIGetLog_block_invoke()
{
  PLSearchBackendPhotoKitAPIGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendPhotoKitAPI");
  return MEMORY[0x1F41817F8]();
}

id PLSearchBackendRecentSuggestionsGetLog()
{
  if (PLSearchBackendRecentSuggestionsGetLog_predicate != -1) {
    dispatch_once(&PLSearchBackendRecentSuggestionsGetLog_predicate, &__block_literal_global_393);
  }
  id v0 = (void *)PLSearchBackendRecentSuggestionsGetLog_log;
  return v0;
}

uint64_t __PLSearchBackendRecentSuggestionsGetLog_block_invoke()
{
  PLSearchBackendRecentSuggestionsGetLog_log = (uint64_t)os_log_create("com.apple.photos.backend.search", "SearchBackendRecentSuggestions");
  return MEMORY[0x1F41817F8]();
}

void PLDonateMomentShareURL(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Received moment share donation URL from external client", buf, 2u);
  }

  uint64_t v6 = +[PLAssetsdClient sharedSystemLibraryAssetsdClient];
  uint64_t v7 = [v6 cloudInternalClient];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __PLDonateMomentShareURL_block_invoke;
  void v9[3] = &unk_1E589F688;
  id v10 = v3;
  id v8 = v3;
  [v7 fetchShareFromShareURL:v4 ignoreExistingShare:0 completionHandler:v9];
}

void __PLDonateMomentShareURL_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = PLGatekeeperXPCGetLog();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Error fetching donated moment share from external client: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "Successfully fetched donated moment share %@ from external client", (uint8_t *)&v9, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void pl_dispatch_group_async(NSObject *a1, NSObject *a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_group_async_block_invoke;
  block[3] = &unk_1E58A1920;
  id v8 = v5;
  id v6 = v5;
  dispatch_group_async(a1, a2, block);
}

void __pl_dispatch_group_async_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void pl_dispatch_async_without_boost_on_queue(void *a1, void *a2)
{
  id v3 = a1;
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, a2);
  dispatch_async(v3, v4);
}

void pl_dispatch_group_notify(NSObject *a1, NSObject *a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_group_notify_block_invoke;
  block[3] = &unk_1E58A1920;
  id v8 = v5;
  id v6 = v5;
  dispatch_group_notify(a1, a2, block);
}

void __pl_dispatch_group_notify_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void pl_dispatch_barrier_async(NSObject *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_barrier_async_block_invoke;
  block[3] = &unk_1E58A1920;
  id v6 = v3;
  id v4 = v3;
  dispatch_barrier_async(a1, block);
}

void __pl_dispatch_barrier_async_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void pl_dispatch_after(dispatch_time_t a1, NSObject *a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __pl_dispatch_after_block_invoke;
  block[3] = &unk_1E58A1920;
  id v8 = v5;
  id v6 = v5;
  dispatch_after(a1, a2, block);
}

void __pl_dispatch_after_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __pl_dispatch_source_set_event_handler_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void pl_notify_disable_for_shutdown()
{
  id v0 = PLBackendGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFURLRef v1 = 0;
    _os_log_impl(&dword_19BCFB000, v0, OS_LOG_TYPE_DEFAULT, "Disabling libnotify calls due to shutdown", v1, 2u);
  }

  atomic_store(1u, sNotifyIsDisabledForShutdown);
}

void __pl_notify_register_dispatch_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38F510]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t pl_notify_post_with_retry(char *name, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = atomic_load(sNotifyIsDisabledForShutdown);
  if (v2) {
    return 0;
  }
  char v5 = 0;
  int v6 = 1;
  do
  {
    if (v5)
    {
      uint64_t v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        int v11 = 1000000;
        __int16 v12 = 2080;
        id v13 = name;
        __int16 v14 = 1024;
        int v15 = v6 - 1;
        __int16 v16 = 1024;
        int v17 = a2;
        _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Error %d occurred while trying to call notify_post for: %s. (attempt number: %d of %d)", buf, 0x1Eu);
      }

      usleep(0x186A0u);
    }
    uint64_t result = notify_post(name);
    if (result != 1000000) {
      break;
    }
    char v5 = 1;
  }
  while (v6++ < a2);
  return result;
}

NSObject *pl_dispatch_queue_create_with_fallback_qos(const char *a1, dispatch_queue_attr_t attr)
{
  id v3 = dispatch_queue_attr_make_initially_inactive(attr);
  id v4 = dispatch_queue_create(a1, v3);
  dispatch_set_qos_class_fallback();
  dispatch_activate(v4);

  return v4;
}

NSObject *pl_dispatch_queue_create_with_qos_and_fallback_qos(const char *a1, dispatch_queue_attr_t attr)
{
  id v3 = dispatch_queue_attr_make_initially_inactive(attr);
  id v4 = dispatch_queue_create(a1, v3);
  dispatch_set_qos_class();
  dispatch_set_qos_class_fallback();
  dispatch_activate(v4);

  return v4;
}

uint64_t __Block_byref_object_copy__3167(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3168(uint64_t a1)
{
}

void ALGetPhotosAndVideosCount(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    unsigned __int8 v2 = ALSharedAssetsdClient();
    id v3 = [v2 libraryInternalClient];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __ALGetPhotosAndVideosCount_block_invoke;
    v4[3] = &unk_1E589F748;
    id v5 = v1;
    [v3 getAssetCountsWithReply:v4];
  }
}

id ALSharedAssetsdClient()
{
  if (ALSharedAssetsdClient_onceToken != -1) {
    dispatch_once(&ALSharedAssetsdClient_onceToken, &__block_literal_global_3298);
  }
  id v0 = (void *)ALSharedAssetsdClient_assetsdClient;
  return v0;
}

void __ALGetPhotosAndVideosCount_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    id v5 = *(void (**)(uint64_t, void, void))(v4 + 16);
    uint64_t v6 = *(void *)(a1 + 32);
    v5(v6, 0, 0);
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a2];
    id v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v9, v8);
  }
}

uint64_t __ALSharedAssetsdClient_block_invoke()
{
  ALSharedAssetsdClient_assetsdClient = +[PLAssetsdClient sharedSystemLibraryAssetsdClient];
  return MEMORY[0x1F41817F8]();
}

id ALRegisterForPhotosAndVideosCount(void *a1, NSObject *a2)
{
  id v3 = a1;
  int out_token = 0;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __ALRegisterForPhotosAndVideosCount_block_invoke;
  handler[3] = &unk_1E589F770;
  id v4 = v3;
  id v9 = v4;
  uint64_t v5 = notify_register_dispatch("ALPhotosAndVideosCount", &out_token, a2, handler);
  if (v5)
  {
    NSLog((NSString *)@"notify_register_dispatch() failed for ALRegisterForPhotosAndVideosCount(). (%d)", v5);
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithInt:out_token];
  }

  return v6;
}

uint64_t __ALRegisterForPhotosAndVideosCount_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ALUnregisterForPhotosAndVideosCount(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v4 = v1;
    uint64_t v2 = notify_cancel([v1 intValue]);
    if (v2) {
      NSLog((NSString *)@"notify_cancel() failed for ALUnregisterForPhotosAndVideosCount(). (%d)", v4, v2);
    }
  }
  return MEMORY[0x1F41817F8]();
}

unint64_t ALSecondsNeededToMigrateStore(void *a1)
{
  sqlite3_int64 v1 = PLGenericAssetCountInDatabaseWithPath((const char *)[a1 fileSystemRepresentation]);
  if (v1 == -1) {
    return 30;
  }
  if (v1 >= 100) {
    return v1 / 0x53uLL;
  }
  return 1;
}

void ALGetLibrarySizes(void *a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v18 = a1;
  id v5 = a3;
  uint64_t v6 = ALSharedAssetsdClient();
  uint64_t v7 = [v6 libraryInternalClient];
  id v26 = 0;
  id v27 = 0;
  int v8 = [v7 synchronouslyGetLibrarySizesFromDB:0 sizes:&v27 error:&v26];
  id v9 = v27;
  id v10 = v26;

  if (v8)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x2020000000;
    uint64_t v30 = a2;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __ALGetLibrarySizes_block_invoke;
    v22[3] = &unk_1E589F7C0;
    p_long long buf = &buf;
    int v11 = v18;
    uint64_t v23 = v11;
    id v12 = v5;
    id v24 = v12;
    [v9 enumerateKeysAndObjectsUsingBlock:v22];
    uint64_t v13 = *((void *)&buf + 1);
    unint64_t v14 = *(void *)(*((void *)&buf + 1) + 24);
    if (v14)
    {
      unint64_t v15 = 1;
      do
      {
        if ((v14 & v15) != 0)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __ALGetLibrarySizes_block_invoke_3;
          block[3] = &unk_1E589F7E8;
          id v20 = v12;
          unint64_t v21 = v15;
          dispatch_async(v11, block);

          uint64_t v13 = *((void *)&buf + 1);
        }
        unint64_t v14 = *(void *)(v13 + 24) & ~v15;
        *(void *)(v13 + 24) = v14;
        if (v14) {
          BOOL v16 = v15 >= 8;
        }
        else {
          BOOL v16 = 1;
        }
        v15 *= 2;
      }
      while (!v16);
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    int v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_FAULT, "Failed to get library sizes with error: %@", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, a2, 0);
  }
}

void sub_19BD5ADFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __ALGetLibrarySizes_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [a2 integerValue];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if ((v8 & ~v9) == 0)
  {
    uint64_t v10 = v8;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ALGetLibrarySizes_block_invoke_2;
    block[3] = &unk_1E589F798;
    int v11 = *(NSObject **)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = v10;
    id v13 = v7;
    dispatch_async(v11, block);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) &= ~v10;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (!v9) {
    *a4 = 1;
  }
}

uint64_t __ALGetLibrarySizes_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), -1);
}

uint64_t __ALGetLibrarySizes_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v3 = [*(id *)(a1 + 32) unsignedLongLongValue];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v1, v3);
}

void sub_19BD5B968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3346(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3347(uint64_t a1)
{
}

void sub_19BD5C198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3416(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3417(uint64_t a1)
{
}

void sub_19BD5C74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3520(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3521(uint64_t a1)
{
}

void sub_19BD5CC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD5D0F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD5D604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD5DBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD5E10C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD5E62C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD5EC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD5F014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD5F3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD5F8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD5FCCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD600A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD604A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD609E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD60F9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD614C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD6195C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD61EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD6235C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD62814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD62C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD63184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel)
{
  if (a25) {
    os_activity_scope_leave(&a28);
  }
  if (a27)
  {
    uint64_t v32 = PLRequestGetLog();
    uint64_t v33 = v32;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v30 - 144) = 136446210;
      *(void *)(v29 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v33, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)(v30 - 144), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD63684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD63B78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_19BD64104(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v2 - 160)) {
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 136));
  }
  if (*(void *)(v2 - 144))
  {
    id v4 = PLRequestGetLog();
    id v5 = v4;
    os_signpost_id_t v6 = *(void *)(v2 - 144);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 120));
      *(_DWORD *)(v2 - 112) = 136446210;
      *(void *)(v1 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 112), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD64614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD64C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD652A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD657A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD65E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel)
{
  if (a25) {
    os_activity_scope_leave(&a28);
  }
  if (a27)
  {
    uint64_t v32 = PLRequestGetLog();
    uint64_t v33 = v32;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v30 - 144) = 136446210;
      *(void *)(v29 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v33, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)(v30 - 144), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD66300(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD66768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD66C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel,int buf)
{
  if (a21) {
    os_activity_scope_leave(&a24);
  }
  if (a23)
  {
    char v28 = PLRequestGetLog();
    uint64_t v29 = v28;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel);
      long long buf = 136446210;
      *(void *)(v26 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v29, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD670EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD6772C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,void *a32,os_signpost_id_t a33,os_activity_scope_state_s a34,SEL sel)
{
  if (a31) {
    os_activity_scope_leave(&a34);
  }
  if (a33)
  {
    uint64_t v38 = PLRequestGetLog();
    uint64_t v39 = v38;
    if (a33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v36 - 144) = 136446210;
      *(void *)(v35 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v39, OS_SIGNPOST_INTERVAL_END, a33, "PLXPC Sync", "%{public}s", (uint8_t *)(v36 - 144), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD67D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  if (a33) {
    os_activity_scope_leave(&a36);
  }
  if (a35)
  {
    unint64_t v40 = PLRequestGetLog();
    id v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(void *)(v37 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BD6824C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD68710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD68D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3707(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3708(uint64_t a1)
{
}

void sub_19BD6912C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *build_error_event_string(void *a1)
{
  if (a1)
  {
    uint64_t v1 = NSString;
    id v2 = a1;
    uint64_t v3 = [v2 domain];
    id v4 = [v1 stringWithFormat:@"%@_%ld", v3, objc_msgSend(v2, "code")];

    id v5 = [v2 userInfo];

    os_signpost_id_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v6)
    {
      id v7 = build_error_event_string(v6);
      uint64_t v8 = [(__CFString *)v4 stringByAppendingFormat:@":%@", v7];

      id v4 = (__CFString *)v8;
    }
  }
  else
  {
    id v4 = @"unknown";
  }
  return v4;
}

id PLUUIDDataFromString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = objc_opt_class();
    if (v2 == objc_opt_class())
    {
      uint64_t v4 = [v1 UUIDData];
    }
    else
    {
      v7[0] = PLUUIDBytesFromString(v1);
      v7[1] = v3;
      uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:16];
    }
    id v5 = (void *)v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t PLUUIDBytesFromString(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    goto LABEL_17;
  }
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    uint64_t v20 = [(__CFString *)v1 UUIDBytes];
    goto LABEL_19;
  }
  unint64_t v3 = [(__CFString *)v1 length];
  -[__CFString getCharacters:range:](v1, "getCharacters:range:", v24, 0, v3);
  if (!v3) {
    goto LABEL_15;
  }
  unint64_t v4 = 0;
  unint64_t v5 = 0;
  do
  {
    int v6 = v24[v4];
    if ((v6 - 48) < 0xA
      || ((v6 - 65) <= 0x25
        ? (BOOL v7 = ((1 << (v6 - 65)) & 0x3F0000003FLL) == 0)
        : (BOOL v7 = 1),
          !v7))
    {
      v25[v5++] = v6;
    }
    ++v4;
  }
  while (v4 < v3 && v5 < 0x20);
  if (v5 != 32)
  {
LABEL_15:
    CFUUIDRef v21 = CFUUIDCreateFromString(0, v1);
    if (v21)
    {
      CFUUIDRef v22 = v21;
      uint64_t v20 = *(_OWORD *)&CFUUIDGetUUIDBytes(v21);
      CFAutorelease(v22);
      goto LABEL_19;
    }
LABEL_17:
    uint64_t v20 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = v25;
  int8x16x2_t v27 = vld2q_s8(v8);
  v9.i64[0] = 0xD0D0D0D0D0D0D0D0;
  v9.i64[1] = 0xD0D0D0D0D0D0D0D0;
  int8x16_t v10 = vaddq_s8(v27.val[0], v9);
  v11.i64[0] = 0xA0A0A0A0A0A0A0ALL;
  v11.i64[1] = 0xA0A0A0A0A0A0A0ALL;
  int8x16_t v12 = (int8x16_t)vcgtq_u8(v11, (uint8x16_t)v10);
  v13.i64[0] = 0x9F9F9F9F9F9F9F9FLL;
  v13.i64[1] = 0x9F9F9F9F9F9F9F9FLL;
  v14.i64[0] = 0x606060606060606;
  v14.i64[1] = 0x606060606060606;
  v15.i64[0] = 0xBFBFBFBFBFBFBFBFLL;
  v15.i64[1] = 0xBFBFBFBFBFBFBFBFLL;
  v16.i64[0] = 0xC9C9C9C9C9C9C9C9;
  v16.i64[1] = 0xC9C9C9C9C9C9C9C9;
  v17.i64[0] = 0xA9A9A9A9A9A9A9A9;
  v17.i64[1] = 0xA9A9A9A9A9A9A9A9;
  int8x16_t v18 = vaddq_s8(v27.val[1], v9);
  int8x16_t v19 = (int8x16_t)vcgtq_u8(v11, (uint8x16_t)v18);
  uint64_t v20 = vorrq_s8(vbslq_s8(v19, v18, vbslq_s8(vorrq_s8(v19, (int8x16_t)vcgtq_u8(v14, (uint8x16_t)vaddq_s8(v27.val[1], v13))), vaddq_s8(v27.val[1], v17), vandq_s8(vaddq_s8(v27.val[1], v16), (int8x16_t)vcgtq_u8(v14, (uint8x16_t)vaddq_s8(v27.val[1], v15))))), vshlq_n_s8(vbslq_s8(v12, v10, vbslq_s8(vorrq_s8(v12, (int8x16_t)vcgtq_u8(v14, (uint8x16_t)vaddq_s8(v27.val[0], v13))), vaddq_s8(v27.val[0], v17), vandq_s8(vaddq_s8(v27.val[0], v16), (int8x16_t)vcgtq_u8(v14, (uint8x16_t)vaddq_s8(v27.val[0], v15))))), 4uLL)).u64[0];
LABEL_19:

  return v20;
}

PLUUIDString *PLStringFromUUIDData(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = [[PLUUIDString alloc] initWithUUIDData:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

id PLStringFromUUID(const unsigned __int8 *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, sizeof(v3));
  uuid_unparse(a1, v3);
  id v1 = [NSString stringWithUTF8String:v3];
  return v1;
}

BOOL PLIsMercuryBase64String(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 length] == 22
    && strspn((const char *)[v1 UTF8String], "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+%") == 22;

  return v2;
}

BOOL PLIsCanonicalUUIDString(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  BOOL v3 = [v1 length] == 36
    && (memset(uu, 0, sizeof(uu)),
        BOOL v2 = (const char *)[v1 UTF8String],
        strspn(v2, "-01234567890abcdefABCDEF") == 36)
    && uuid_parse(v2, uu) == 0;

  return v3;
}

id PLConvertMercuryUUIDString(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_9;
  }
  if (PLIsCanonicalUUIDString(v1))
  {
    id v2 = v2;
    BOOL v3 = v2;
    goto LABEL_12;
  }
  if (PLIsMercuryBase64String(v2))
  {
    uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"%"];
    uint64_t v5 = [v2 rangeOfCharacterFromSet:v4 options:0];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:options:range:", @"%", @"/", 0, v5, v6);

      id v2 = (id)v7;
    }
    uint64_t v8 = [v2 stringByAppendingString:@"=="];

    int8x16_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v8 options:0];
    int8x16_t v10 = v9;
    if (v9)
    {
      memset(v12, 0, 37);
      uuid_unparse_upper((const unsigned __int8 *)objc_msgSend(v9, "bytes", 0, 0, 0, 0, *(void *)&v12[32], v13), v12);
      BOOL v3 = (void *)[[NSString alloc] initWithUTF8String:v12];
    }
    else
    {
      BOOL v3 = 0;
    }

    id v2 = (id)v8;
  }
  else
  {
LABEL_9:
    BOOL v3 = 0;
  }
LABEL_12:

  return v3;
}

id PLUUIDFromLocalMercuryLocalIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 length];
  if (v2 == 22)
  {
    id v5 = v1;
  }
  else
  {
    if (v2 != 29 || (uint64_t v3 = [v1 rangeOfString:@"/L0/"], !v4))
    {
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    id v5 = [v1 substringToIndex:v3];
  }
  uint64_t v6 = v5;
LABEL_8:

  return v6;
}

void PLSetIsAssetsdProxyService()
{
  __PLIsAssetsdProxyService = 1;
}

void PLUnSetIsAssetsdProxyService()
{
  __PLIsAssetsdProxyService = 0;
}

void PLSetIsMigrationService()
{
  __PLIsMigrationService = 1;
}

uint64_t PLIsMigrationService()
{
  return __PLIsMigrationService;
}

void PLSetContentPrivacyEnabled(uint64_t a1)
{
  xpc_object_t value = [MEMORY[0x1E4F28ED0] numberWithBool:a1];
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  CFPreferencesSetAppValue(@"ContentPrivacyEnabled", value, @"com.apple.mobileslideshow");
}

void PLSetFeaturedContentAllowed(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F28ED0] numberWithBool:a1];
  CFPreferencesSetAppValue(@"FeaturedContentAllowed", v1, @"com.apple.mobileslideshow");
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
}

BOOL PLShouldExcludeLocationWhenSharing()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
  {
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    Boolean keyExistsAndHasValidFormat = 0;
    BOOL result = CFPreferencesGetAppBooleanValue(@"ExcludeLocationWhenSharing", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
    if (keyExistsAndHasValidFormat) {
      return result;
    }
    id v1 = PLPreferencesGetLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v4 = @"com.apple.mobileslideshow";
      _os_log_impl(&dword_19BCFB000, v1, OS_LOG_TYPE_DEBUG, "Default for excluding location when sharing is not set in domain %@. Defaulting to NO", buf, 0xCu);
    }
  }
  return 0;
}

void PLSetShouldExcludeLocationWhenSharing(uint64_t a1)
{
  xpc_object_t value = [MEMORY[0x1E4F28ED0] numberWithBool:a1];
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  CFPreferencesSetAppValue(@"ExcludeLocationWhenSharing", value, @"com.apple.mobileslideshow");
}

uint64_t PLSetIsSuppressingLogsForUnitTesting(uint64_t result)
{
  _suppressLogsForUnitTesting = result;
  return result;
}

char *PLIsConfiguredForUnitTesting()
{
  BOOL result = getenv("CONFIGURE_FOR_UNIT_TESTING");
  if (result) {
    return (char *)(*result == 49);
  }
  return result;
}

uint64_t PLSetSystemLibraryAccessProhibited(uint64_t result)
{
  _systemLibraryAccessProhibited = result;
  return result;
}

BOOL PLXCTestAllowsProhibitedSystemLibraryAccess()
{
  id v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 environment];
  uint64_t v2 = [v1 objectForKeyedSubscript:@"PHOTOS_TEST_PLAN_ALLOW_SYSTEM_LIBRARY_DESTRUCTIVE_ACTION"];

  return v2 != 0;
}

uint64_t PLIsReallyAssetsd()
{
  return PLIsReallyAssetsd_isAssetsd;
}

uint64_t PLIsInternalTool()
{
  return PLIsInternalTool_isInternalTool;
}

void __PLIsInternalTool_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [(id)v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"photosctl"];
  if (v0) {
    goto LABEL_4;
  }
  uint64_t v2 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v3 = [(id)v2 processName];

  LOBYTE(v2) = [v3 isEqualToString:@"plphotosctl"];
  if ((v2 & 1) != 0
    || ([MEMORY[0x1E4F28F80] processInfo],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [(id)v4 processName],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        (id)v4,
        LOBYTE(v4) = [v5 isEqualToString:@"xctest"],
        v5,
        (v4 & 1) != 0))
  {
LABEL_4:
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = NSClassFromString((NSString *)@"XCTestProbe") != 0;
  }
  PLIsInternalTool_isInternalTool = v6;
}

uint64_t PLIsSpringboard()
{
  return PLIsSpringboard_isSpringBoard;
}

void __PLIsSpringboard_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"SpringBoard"];
  PLIsSpringboard_isSpringBoard = (char)v0;
}

uint64_t PLIsLockScreenCamera()
{
  return PLIsLockScreenCamera_isCamera;
}

void __PLIsLockScreenCamera_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"LockScreenCamera"];
  PLIsLockScreenCamera_isCamera = (char)v0;
}

uint64_t PLIsPhotosApp()
{
  return PLIsPhotosApp_isPhotosApp;
}

uint64_t PLIsTVPhotosApp()
{
  return PLIsTVPhotosApp_isTVPhotosApp;
}

void __PLIsTVPhotosApp_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"TVPhotos"];
  PLIsTVPhotosApp_isTVPhotosApp = (char)v0;
}

uint64_t PLIsPhotosMessagesApp()
{
  return PLIsPhotosMessagesApp_isPhotosMessagesApp;
}

void __PLIsPhotosMessagesApp_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"PhotosMessagesApp"];
  PLIsPhotosMessagesApp_isPhotosMessagesApp = (char)v0;
}

uint64_t PLIsSpotlight()
{
  return PLIsSpotlight_isSpotlight;
}

void __PLIsSpotlight_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"Spotlight"];
  PLIsSpotlight_isSpotlight = (char)v0;
}

uint64_t PLIsPreferences()
{
  return PLIsPreferences_isPreferences;
}

void __PLIsPreferences_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"Preferences"];
  PLIsPreferences_isPreferences = (char)v0;
}

uint64_t PLIsPeopleViewService()
{
  return PLIsPeopleViewService_isPeopleViewService;
}

void __PLIsPeopleViewService_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"PeopleViewService"];
  PLIsPeopleViewService_isPeopleViewService = (char)v0;
}

uint64_t PLIsPhotoanalysisd()
{
  return PLIsPhotoanalysisd_isPhotoanalysisd;
}

void __PLIsPhotoanalysisd_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"photoanalysisd"];
  PLIsPhotoanalysisd_isPhotoanalysisd = (char)v0;
}

uint64_t PLIsNebulad()
{
  return PLIsNebulad_isNebulad;
}

void __PLIsNebulad_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"nebulad"];
  PLIsNebulad_isNebulad = (char)v0;
}

uint64_t PLIsMediaanalysisd()
{
  return PLIsMediaanalysisd_isMAD;
}

void __PLIsMediaanalysisd_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [(id)v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"mediaanalysisd"];
  PLIsMediaanalysisd_isMAD = v0;
  if (v0)
  {
    char v2 = 1;
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v4 = [v3 processName];

    char v2 = [v4 isEqualToString:@"mediaanalysisd-service"];
  }
  PLIsMediaanalysisd_isMAD = v2;
}

uint64_t PLIsDemod()
{
  return PLIsDemod_isDemod;
}

void __PLIsDemod_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"demod"];
  PLIsDemod_isDemod = (char)v0;
}

uint64_t PLIsProcessWithAppleBundleIdentifier()
{
  return PLIsProcessWithAppleBundleIdentifier_isAppleBundleIdentifier;
}

void __PLIsProcessWithAppleBundleIdentifier_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v1 bundleIdentifier];
  PLIsProcessWithAppleBundleIdentifier_isAppleBundleIdentifier = [v0 hasPrefix:@"com.apple."];
}

uint64_t PLShouldPreventAutomaticLimitedAccessAlert()
{
  if (PLShouldPreventAutomaticLimitedAccessAlert_onceToken != -1) {
    dispatch_once(&PLShouldPreventAutomaticLimitedAccessAlert_onceToken, &__block_literal_global_162_3900);
  }
  return PLShouldPreventAutomaticLimitedAccessAlert_shouldPreventAlert;
}

void __PLShouldPreventAutomaticLimitedAccessAlert_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v0 infoDictionary];

  char v2 = [v1 objectForKeyedSubscript:@"PHPhotoLibraryPreventAutomaticLimitedAccessAlert"];
  if (!v2)
  {
    char v2 = [v1 objectForKeyedSubscript:@"NSPhotoLibraryLimitedAccessAPISupport"];
  }
  int v3 = [v2 BOOLValue];
  PLShouldPreventAutomaticLimitedAccessAlert_shouldPreventAlert = v3;
  if (v3)
  {
    uint64_t v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_DEFAULT, "Preventing automatic limited access alert based on info.plist configuration", buf, 2u);
    }
  }
  if (!v2)
  {
    uint64_t v5 = [v1 objectForKeyedSubscript:@"NSExtension"];
    BOOL v6 = [v5 objectForKeyedSubscript:@"NSExtensionPointIdentifier"];

    if (v6 && [@"com.apple.widgetkit-extension" isEqual:v6])
    {
      uint64_t v7 = PLBackendGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_DEFAULT, "Preventing automatic limited access alert for widget extension", v8, 2u);
      }

      PLShouldPreventAutomaticLimitedAccessAlert_shouldPreventAlert = 1;
    }
  }
}

uint64_t PLHasPhotoLibraryAddUsageDescription()
{
  if (PLHasPhotoLibraryAddUsageDescription_onceToken != -1) {
    dispatch_once(&PLHasPhotoLibraryAddUsageDescription_onceToken, &__block_literal_global_179_3919);
  }
  return PLHasPhotoLibraryAddUsageDescription_hasUsageDescription;
}

void __PLHasPhotoLibraryAddUsageDescription_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 infoDictionary];

  id v1 = [v2 objectForKeyedSubscript:@"NSPhotoLibraryAddUsageDescription"];
  PLHasPhotoLibraryAddUsageDescription_hasUsageDescription = v1 != 0;
}

uint64_t PLHasPhotoLibraryUsageDescription()
{
  if (PLHasPhotoLibraryUsageDescription_onceToken != -1) {
    dispatch_once(&PLHasPhotoLibraryUsageDescription_onceToken, &__block_literal_global_184_3924);
  }
  return PLHasPhotoLibraryUsageDescription_hasUsageDescription;
}

void __PLHasPhotoLibraryUsageDescription_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 infoDictionary];

  id v1 = [v2 objectForKeyedSubscript:@"NSPhotoLibraryUsageDescription"];
  PLHasPhotoLibraryUsageDescription_hasUsageDescription = v1 != 0;
}

uint64_t PLIsDeveloperMode()
{
  if (PLIsDeveloperMode_onceToken != -1) {
    dispatch_once(&PLIsDeveloperMode_onceToken, &__block_literal_global_198_3938);
  }
  return PLIsDeveloperMode_isDeveloperMode;
}

void __PLIsDeveloperMode_block_invoke()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = (uint64_t (*)(void))getAMFIIsDeveloperModeEnabledSymbolLoc_ptr;
  uint64_t v7 = getAMFIIsDeveloperModeEnabledSymbolLoc_ptr;
  if (!getAMFIIsDeveloperModeEnabledSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getAMFIIsDeveloperModeEnabledSymbolLoc_block_invoke;
    v3[3] = &unk_1E58A2238;
    v3[4] = &v4;
    __getAMFIIsDeveloperModeEnabledSymbolLoc_block_invoke(v3);
    uint64_t v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
  {
    PLIsDeveloperMode_isDeveloperMode = v0();
  }
  else
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"BOOL PLAMFIIsDeveloperModeEnabled(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PLHelper.m", 45, @"%s", dlerror());

    __break(1u);
  }
}

void sub_19BD6BE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAMFIIsDeveloperModeEnabledSymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!AppleMobileFileIntegrityLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x1E4F143A8];
    _OWORD v5[2] = (void *)3221225472;
    v5[3] = __AppleMobileFileIntegrityLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E589FA48;
    uint64_t v7 = 0;
    AppleMobileFileIntegrityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  id v2 = (void *)AppleMobileFileIntegrityLibraryCore_frameworkLibrary;
  if (!AppleMobileFileIntegrityLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *AppleMobileFileIntegrityLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"PLHelper.m", 44, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  int v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  BOOL result = dlsym(v2, "AMFIIsDeveloperModeEnabled");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getAMFIIsDeveloperModeEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __AppleMobileFileIntegrityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AppleMobileFileIntegrityLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __LockdownModeLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  LockdownModeLibraryCore_frameworkLibrary = result;
  return result;
}

double PLPhysicalScreenScale()
{
  return *(double *)&PLPhysicalScreenScale_screenScale;
}

uint64_t PLIsTallScreen()
{
  return PLIsTallScreen_isTallScreen;
}

void __PLIsTallScreen_block_invoke()
{
  uint64_t v0 = [NSClassFromString((NSString *)@"UIScreen") mainScreen];
  id v4 = [v0 currentMode];

  id v1 = v4;
  if (v4)
  {
    [v4 size];
    id v1 = v4;
  }
  else
  {
    double v2 = *MEMORY[0x1E4F1DB30];
    double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  PLIsTallScreen_isTallScreen = v3 / v2 >= 1.70000005;
}

uint64_t PLIsPadMini()
{
  if (PLIsPadMini_onceToken != -1) {
    dispatch_once(&PLIsPadMini_onceToken, &__block_literal_global_218);
  }
  return PLIsPadMini_isIpadMini;
}

uint64_t __PLIsPadMini_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  if (result == 28) {
    PLIsPadMini_isIpadMini = 1;
  }
  return result;
}

uint64_t PLHasHomeButton()
{
  if (PLHasHomeButton_onceToken != -1) {
    dispatch_once(&PLHasHomeButton_onceToken, &__block_literal_global_223);
  }
  return PLHasHomeButton_hasHomeButton;
}

uint64_t __PLHasHomeButton_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  PLHasHomeButton_hasHomeButton = result != 2;
  return result;
}

id PLPhotoLibraryFrameworkBundle()
{
  uint64_t v0 = (void *)__PLPhotoLibraryFrameworkBundle;
  if (!__PLPhotoLibraryFrameworkBundle)
  {
    Class v1 = NSClassFromString((NSString *)@"PLPhotoTileViewController");
    if (v1)
    {
      uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:v1];
      double v3 = (void *)__PLPhotoLibraryFrameworkBundle;
      __PLPhotoLibraryFrameworkBundle = v2;
    }
    else
    {
      double v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/System/Library/PrivateFrameworks/PhotoLibrary.framework" isDirectory:1];
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:v3];
      uint64_t v5 = (void *)__PLPhotoLibraryFrameworkBundle;
      __PLPhotoLibraryFrameworkBundle = v4;
    }
    uint64_t v0 = (void *)__PLPhotoLibraryFrameworkBundle;
  }
  return v0;
}

void PLEnableCoreDataMultithreadedAsserts()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v2 = @"com.apple.CoreData.ConcurrencyDebug";
  v3[0] = MEMORY[0x1E4F1CC38];
  Class v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  [v0 registerDefaults:v1];
}

uint64_t __PLDebugEnableCoreDataMultithreadedAsserts_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasPrefix:@"-"]) {
    uint64_t v3 = [v2 hasSuffix:@"com.apple.CoreData.ConcurrencyDebug"];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

id PLRelativePrettyDateForDate(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (PLRelativePrettyDateForDate___relativeDateFormatter)
  {
    if (v1)
    {
LABEL_3:
      uint64_t v3 = [(id)PLRelativePrettyDateForDate___relativeDateFormatter stringFromDate:v2];
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    uint64_t v5 = (void *)PLRelativePrettyDateForDate___relativeDateFormatter;
    PLRelativePrettyDateForDate___relativeDateFormatter = (uint64_t)v4;

    [(id)PLRelativePrettyDateForDate___relativeDateFormatter setDateStyle:2];
    [(id)PLRelativePrettyDateForDate___relativeDateFormatter setTimeStyle:1];
    long long v6 = (void *)PLRelativePrettyDateForDate___relativeDateFormatter;
    uint64_t v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v6 setLocale:v7];

    [(id)PLRelativePrettyDateForDate___relativeDateFormatter setDoesRelativeDateFormatting:1];
    if (v2) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
LABEL_6:

  return v3;
}

id PLMillisecondDateFormatter()
{
  if (PLMillisecondDateFormatter_onceToken != -1) {
    dispatch_once(&PLMillisecondDateFormatter_onceToken, &__block_literal_global_250);
  }
  uint64_t v0 = (void *)PLMillisecondDateFormatter_dateFormatter;
  return v0;
}

void __PLMillisecondDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)PLMillisecondDateFormatter_dateFormatter;
  PLMillisecondDateFormatter_dateFormatter = (uint64_t)v0;

  [(id)PLMillisecondDateFormatter_dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss.SS"];
  id v2 = (void *)PLMillisecondDateFormatter_dateFormatter;
  id v3 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v2 setTimeZone:v3];
}

id PLCompleteDateFormatter()
{
  if (PLCompleteDateFormatter_onceToken != -1) {
    dispatch_once(&PLCompleteDateFormatter_onceToken, &__block_literal_global_259);
  }
  id v0 = (void *)PLCompleteDateFormatter_formatter;
  return v0;
}

uint64_t __PLCompleteDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)PLCompleteDateFormatter_formatter;
  PLCompleteDateFormatter_formatter = (uint64_t)v0;

  id v2 = (void *)PLCompleteDateFormatter_formatter;
  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SS ZZZZZ"];
}

id _localizedStringFromTableInBundle(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)__PLPreferredLanguage;
  if (!__PLPreferredLanguage)
  {
    _UpdatePreferredLanguage();
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_UpdatePreferredLanguage, (CFStringRef)*MEMORY[0x1E4F1D200], 0, CFNotificationSuspensionBehaviorDrop);
    uint64_t v8 = (void *)__PLPreferredLanguage;
  }
  id v10 = v8;
  if (![v5 length]) {
    goto LABEL_15;
  }
  if (![v6 length]) {
    goto LABEL_15;
  }
  uint64_t v11 = [v10 length];
  if (!v7 || !v11) {
    goto LABEL_15;
  }
  int8x16_t v12 = [v7 localizations];
  CFArrayRef v13 = [MEMORY[0x1E4F1C978] arrayWithObject:v10];
  CFArrayRef v14 = [v12 count] ? CFBundleCopyLocalizationsForPreferences((CFArrayRef)v12, v13) : 0;
  if ([(__CFArray *)v14 count]
    && ([(__CFArray *)v14 objectAtIndex:0],
        int8x16_t v15 = objc_claimAutoreleasedReturnValue(),
        [v7 pathForResource:v6 ofType:@"strings" inDirectory:0 forLocalization:v15],
        int8x16_t v16 = objc_claimAutoreleasedReturnValue(),
        v15,
        v16))
  {
    int8x16_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v16];
    int8x16_t v18 = [v17 objectForKey:v5];
  }
  else
  {
    int8x16_t v18 = 0;
  }

  if (!v18)
  {
LABEL_15:
    int8x16_t v18 = [v7 localizedStringForKey:v5 value:&stru_1EEBF74F0 table:v6];
  }

  return v18;
}

void _UpdatePreferredLanguage()
{
  CFStringRef v0 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3B8]);
  id v6 = (id)CFPreferencesCopyValue(@"AppleLanguages", v0, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  uint64_t v1 = [v6 objectAtIndex:0];
  id v2 = (void *)__PLPreferredLanguage;
  __PLPreferredLanguage = v1;

  if (!__PLPreferredLanguage)
  {
    id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F1C438]];
    id v5 = (void *)__PLPreferredLanguage;
    __PLPreferredLanguage = v4;

    if (!__PLPreferredLanguage) {
      __PLPreferredLanguage = @"en";
    }
  }
}

id PLServicesLocalizedFrameworkStringForAssetsd(void *a1)
{
  id v1 = a1;
  id v2 = PLPhotoLibraryServicesFrameworkBundle();
  id v3 = _localizedStringFromTableInBundle(v1, @"PhotoLibraryServices", v2);

  return v3;
}

id PLServicesLivePortraitLocalizedFrameworkString(void *a1)
{
  id v1 = a1;
  id v2 = PLPhotoLibraryServicesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:&stru_1EEBF74F0 table:@"PhotoLibraryServicesLivePortrait"];

  return v3;
}

BOOL _PLIsNotificationTypeEnabledForKey(void *a1, BOOL a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v3, @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    a2 = AppBooleanValue != 0;
  }
  else
  {
    id v5 = PLPreferencesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543874;
      int8x16_t v9 = v3;
      __int16 v10 = 2114;
      uint64_t v11 = @"com.apple.mobileslideshow";
      __int16 v12 = 1024;
      BOOL v13 = a2;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEBUG, "Photos notifications default %{public}@ not set in domain %{public}@. Defaulting to %d", buf, 0x1Cu);
    }
  }
  return a2;
}

BOOL PLIsNotificationTypeEnabledForKey(void *a1)
{
  return _PLIsNotificationTypeEnabledForKey(a1, 1);
}

void PLSetNotificationTypeEnabledForKey(void *a1, uint64_t a2)
{
  id v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = a1;
  xpc_object_t value = [v3 numberWithBool:a2];
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  CFPreferencesSetAppValue(v4, value, @"com.apple.mobileslideshow");
}

void _PLResetNotificationTypeEnabledKey(void *a1)
{
  key = a1;
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  CFPreferencesSetAppValue(key, 0, @"com.apple.mobileslideshow");
}

id PLServicesSharedLibraryLocalizedFrameworkString(void *a1)
{
  id v1 = a1;
  id v2 = PLPhotoLibraryServicesFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:&stru_1EEBF74F0 table:@"PhotoLibraryServicesSharedLibrary"];

  return v3;
}

BOOL PLIsSharedLibrarySuggestionsEnabled()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL result = CFPreferencesGetAppBooleanValue(@"SharedLibrarySuggestionsEnabled", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    id v1 = PLPreferencesGetLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v4 = @"com.apple.mobileslideshow";
      _os_log_impl(&dword_19BCFB000, v1, OS_LOG_TYPE_DEBUG, "Shared Library suggestions default not set in domain %@. Defaulting to YES", buf, 0xCu);
    }

    return 1;
  }
  return result;
}

void PLSetSharedLibrarySuggestionsEnabled(uint64_t a1)
{
  xpc_object_t value = [MEMORY[0x1E4F28ED0] numberWithBool:a1];
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  CFPreferencesSetAppValue(@"SharedLibrarySuggestionsEnabled", value, @"com.apple.mobileslideshow");
}

BOOL PLIsSharedLibraryAssetTrashedByParticipantsNotificationEnabled()
{
  return _PLIsNotificationTypeEnabledForKey(@"PhotosNotificationTypeSharedLibraryDeletionNotificationsEnabled", 1);
}

void PLSetSharedLibraryAssetTrashedByParticipantsNotificationEnabled(uint64_t a1)
{
}

void PLResetSharedLibraryAssetTrashedByParticipantsNotificationKey()
{
}

id PLLocalizedFrameworkString(void *a1)
{
  id v1 = a1;
  id v2 = PLPhotoLibraryFrameworkBundle();
  id v3 = [v2 localizedStringForKey:v1 value:&stru_1EEBF74F0 table:@"PhotoLibrary"];
  if ([v3 isEqualToString:v1])
  {
    uint64_t v4 = [v2 localizedStringForKey:v1 value:&stru_1EEBF74F0 table:@"PhotoLibrary-GM"];

    id v3 = (void *)v4;
  }
  if ([v3 isEqualToString:v1])
  {
    uint64_t v5 = [v2 localizedStringForKey:v1 value:&stru_1EEBF74F0 table:@"PhotoLibrary-bravo"];

    id v3 = (void *)v5;
  }

  return v3;
}

uint64_t PLAssetTypeForItems(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v12;
    uint64_t v5 = 3;
    char v6 = 1;
LABEL_3:
    uint64_t v7 = 0;
    uint64_t v8 = v5;
    while (1)
    {
      if (*(void *)v12 != v4) {
        objc_enumerationMutation(v1);
      }
      uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "kind", (void)v11);
      uint64_t v5 = v9;
      if ((v6 & 1) == 0)
      {
        uint64_t v5 = v8;
        if ((unsigned __int16)v8 != (unsigned __int16)v9) {
          break;
        }
      }
      char v6 = 0;
      ++v7;
      uint64_t v8 = v5;
      if (v3 == v7)
      {
        uint64_t v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
        char v6 = 0;
        if (v3) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
  }
  LOWORD(v5) = 3;
LABEL_12:

  return (__int16)v5;
}

__CFString *PLSuffixForItems(void *a1)
{
  int v1 = PLAssetTypeForItems(a1);
  uint64_t v2 = @"ITEM";
  if (v1 == 1) {
    uint64_t v2 = @"VIDEO";
  }
  if (v1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = @"PHOTO";
  }
  return v3;
}

__CFString *PLLocalizedKeyForAssetType(int a1)
{
  int v1 = @"ITEM";
  if (a1 == 1) {
    int v1 = @"VIDEO";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"PHOTO";
  }
}

id PLLocalizedSelectionMessageForItems(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unsigned int v2 = PLAssetTypeForItems(v1);
  if (v2 > 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (void *)*((void *)&off_1E589FA98 + (unsigned __int16)v2);
  }
  uint64_t v4 = NSString;
  uint64_t v5 = PLServicesLocalizedFrameworkString(v3);
  id v12 = 0;
  uint64_t v6 = [v1 count];

  uint64_t v7 = objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, @"%ld", &v12, v6);
  id v8 = v12;

  id v9 = v7;
  id v10 = v8;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v14 = "PLLocalizedSelectionMessageForItems";
    __int16 v15 = 2112;
    id v16 = v10;
    _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error making validated localized string in %s: %@", buf, 0x16u);
  }

  return v9;
}

id PLLocalizedImportantMemoryNotificationTitle()
{
  return PLServicesLocalizedFrameworkStringForAssetsd(@"IMPORTANT_MEMORY_NOTIFICATION_TITLE");
}

id PLLocalizedAddPhotosPickerPromptForItems(void *a1, void *a2)
{
  return PLLocalizedAddPhotosPickerPromptForItemsAndLimit(a1, 0, a2);
}

id PLLocalizedAddPhotosPickerPromptForItemsAndLimit(void *a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (!v7)
  {
    if (!v6)
    {
      long long v11 = PLLocalizedFrameworkString(@"ADD_ITEMS_PICKER_PROMPT_0_NO_ALBUM");
      id v17 = 0;
      goto LABEL_14;
    }
    long long v13 = NSString;
    long long v14 = PLLocalizedFrameworkString(@"ADD_ITEMS_PICKER_PROMPT_0");
    int8x16x2_t v27 = 0;
    long long v11 = [v13 localizedStringWithValidatedFormat:v14, @"%@", &v27, v6 validFormatSpecifiers error];
    __int16 v15 = v27;
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  if (!v6)
  {
    if (a2)
    {
      id v16 = _PLKeyWithSuffixForItems(@"ADD_ITEMS_PICKER_PROMPT_LIMIT_NO_ALBUM_", v5);
      id v10 = PLLocalizedFrameworkString(v16);

      id v24 = 0;
      long long v11 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v10, @"%lu %lu", &v24, v8, a2);
      id v12 = v24;
      goto LABEL_9;
    }
    int8x16_t v19 = _PLKeyWithSuffixForItems(@"ADD_ITEMS_PICKER_PROMPT_NO_ALBUM_", v5);
    long long v14 = PLLocalizedFrameworkString(v19);

    uint64_t v23 = 0;
    long long v11 = objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v14, @"%lu", &v23, v8);
    __int16 v15 = v23;
LABEL_13:
    id v17 = v15;

    goto LABEL_14;
  }
  if (!a2)
  {
    int8x16_t v18 = _PLKeyWithSuffixForItems(@"ADD_ITEMS_PICKER_PROMPT_", v5);
    long long v14 = PLLocalizedFrameworkString(v18);

    id v25 = 0;
    long long v11 = [NSString localizedStringWithValidatedFormat:v14, @"%lu %@", &v25, v8, v6 validFormatSpecifiers error];
    __int16 v15 = v25;
    goto LABEL_13;
  }
  id v9 = _PLKeyWithSuffixForItems(@"ADD_ITEMS_PICKER_PROMPT_LIMIT_", v5);
  id v10 = PLLocalizedFrameworkString(v9);

  uint64_t v26 = 0;
  long long v11 = [NSString localizedStringWithValidatedFormat:v10, @"%lu %lu %@", &v26, v8, a2, v6 validFormatSpecifiers error];
  id v12 = v26;
LABEL_9:
  id v17 = v12;

LABEL_14:
  id v20 = v11;
  id v21 = v17;
  if (!v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v29 = "PLLocalizedAddPhotosPickerPromptForItemsAndLimit";
    __int16 v30 = 2112;
    id v31 = v21;
    _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error making validated localized string in %s: %@", buf, 0x16u);
  }

  return v20;
}

id _PLKeyWithSuffixForItems(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = PLSuffixForItems(a2);
  id v5 = [v3 stringByAppendingString:v4];

  return v5;
}

id PLConvertPathToSRGBPath(void *a1)
{
  id v1 = a1;
  unsigned int v2 = [v1 pathExtension];
  id v3 = [v1 stringByDeletingPathExtension];

  uint64_t v4 = [v3 stringByAppendingString:@"_sRGB"];
  id v5 = [v4 stringByAppendingPathExtension:v2];

  return v5;
}

id PLLocalizedStringForAction(void *a1, void *a2, void (*a3)(void))
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = a3();
  uint64_t v8 = [v6 count];

  if (!v8)
  {
    id v9 = 0;
    goto LABEL_11;
  }
  if (v8 != 1)
  {
    if (v7)
    {
      [NSString stringWithFormat:@"%@_%@S", v5, v7];
      goto LABEL_8;
    }
LABEL_9:
    id v10 = v5;
    goto LABEL_10;
  }
  if (!v7) {
    goto LABEL_9;
  }
  [NSString stringWithFormat:@"%@_%@", v5, v7];
LABEL_8:
  id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  long long v11 = v10;
  id v9 = PLLocalizedFrameworkString(v10);

LABEL_11:
  return v9;
}

id PLLocalizedHidePhotosEverywhereWarning(void *a1, unint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"N_ALBUMS";
  if (a2 == 1) {
    uint64_t v4 = @"1_ALBUM";
  }
  id v5 = v4;
  uint64_t v6 = [a1 count];
  if (v6)
  {
    if (v6 == 1) {
      uint64_t v7 = @"HIDE_EVERYWHERE_CONF_TITLE_1_PHOTO_%@";
    }
    else {
      uint64_t v7 = @"HIDE_EVERYWHERE_CONF_TITLE_N_PHOTOS_%@";
    }
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", v7, v5);
    id v9 = v8;
    if (a2 < 2)
    {
      PLLocalizedFrameworkString(v8);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = NSString;
      long long v11 = PLLocalizedFrameworkString(v8);
      id v17 = 0;
      id v12 = objc_msgSend(v10, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%lu", &v17, a2);
      id v13 = v17;

      id v14 = v12;
      id v15 = v13;
      if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        int8x16_t v19 = "PLLocalizedHidePhotosEverywhereWarning";
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error making validated localized string in %s: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void PLAssetCountsByType(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  *a5 = 0;
  *a4 = 0;
  *a3 = 0;
  *a2 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) kind];
        id v15 = a2;
        switch(v14)
        {
          case 0:
            goto LABEL_10;
          case 1:
            id v15 = a3;
            goto LABEL_10;
          case 2:
            id v15 = a4;
            goto LABEL_10;
          case 3:
            id v15 = a5;
LABEL_10:
            ++*v15;
            break;
          default:
            break;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

id PLSharedCountFormatter()
{
  pl_dispatch_once(&PLSharedCountFormatter_onceToken, &__block_literal_global_448);
  CFStringRef v0 = (void *)PLSharedCountFormatter_sharedCountFormatter;
  return v0;
}

uint64_t __PLSharedCountFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  id v1 = (void *)PLSharedCountFormatter_sharedCountFormatter;
  PLSharedCountFormatter_sharedCountFormatter = (uint64_t)v0;

  unsigned int v2 = (void *)PLSharedCountFormatter_sharedCountFormatter;
  id v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  [(id)PLSharedCountFormatter_sharedCountFormatter setGeneratesDecimalNumbers:1];
  uint64_t v4 = (void *)PLSharedCountFormatter_sharedCountFormatter;
  return [v4 setNumberStyle:1];
}

id PLPersonNameComponentsWithFirstAndLastName(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F28F30];
  id v4 = a2;
  id v5 = a1;
  id v6 = objc_alloc_init(v3);
  [v6 setGivenName:v5];

  [v6 setFamilyName:v4];
  return v6;
}

id PLLocalizedNameWithFirstAndLastName(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F28F38];
  id v4 = a2;
  id v5 = a1;
  id v6 = objc_alloc_init(v3);
  uint64_t v7 = PLPersonNameComponentsWithFirstAndLastName(v5, v4);

  uint64_t v8 = [v6 stringFromPersonNameComponents:v7];

  return v8;
}

uint64_t PLPIDForProcessNamed(const char *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)id v9 = xmmword_19BDC72E8;
  uint64_t v10 = 0;
  size_t size = 0;
  uint64_t v2 = sysctl(v9, 3u, 0, &size, 0, 0);
  if (!v2)
  {
    id v3 = (char *)malloc_type_malloc(size, 0x54AFADFDuLL);
    uint64_t v4 = sysctl(v9, 3u, v3, &size, 0, 0);
    if (v4)
    {
      uint64_t v2 = v4;
    }
    else
    {
      if (size < 0x288)
      {
LABEL_10:
        free(v3);
        return 0xFFFFFFFFLL;
      }
      size_t v5 = size / 0x288;
      id v6 = v3 + 243;
      while (1)
      {
        uint64_t v2 = *(unsigned int *)(v6 - 203);
        if ((int)v2 >= 1 && !strncmp(a1, v6, 0x10uLL)) {
          break;
        }
        v6 += 648;
        if (!--v5) {
          goto LABEL_10;
        }
      }
    }
    free(v3);
  }
  return v2;
}

void PLSimulateCrash(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport" fileSystemRepresentation], 1);
  size_t v5 = (void (*)(uint64_t, uint64_t, id))dlsym(v4, "SimulateCrash");
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = getpid();
    v6(v7, a1, v3);
  }
  else
  {
    uint64_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 134218242;
      uint64_t v10 = a1;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Simulating crash with exception code: 0x%08lx, description %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

sqlite3_int64 PLAbortWithReason(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446210;
    uint64_t v6 = a1;
    _os_log_impl(&dword_19BCFB000, v2, OS_LOG_TYPE_ERROR, "ABORT: %{public}s", (uint8_t *)&v5, 0xCu);
  }

  id v3 = (const char *)abort_with_reason();
  return PLGenericAssetCountInDatabaseWithPath(v3);
}

sqlite3_int64 PLGenericAssetCountInDatabaseWithPath(const char *a1)
{
  ppDb = 0;
  uint64_t v2 = [NSString stringWithUTF8String:a1];
  int v3 = +[PLSQLiteDatabase dataProtectionOpenFlagForPath:v2] | 2;

  int v4 = sqlite3_open_v2(a1, &ppDb, v3, 0);
  if (v4)
  {
    sqlite3_int64 v5 = -1;
  }
  else
  {
    *(void *)&ppStmt.st_dev = 0;
    int v6 = sqlite3_prepare_v2(ppDb, "SELECT count(*) FROM zasset;", -1, (sqlite3_stmt **)&ppStmt, 0);
    if (v6)
    {
      int v7 = v6;
      sqlite3_int64 v5 = -1;
    }
    else
    {
      sqlite3_int64 v5 = -1;
      while (sqlite3_step(*(sqlite3_stmt **)&ppStmt.st_dev) == 100)
      {
        uint64_t v8 = (void *)MEMORY[0x19F38F510]();
        sqlite3_int64 v5 = sqlite3_column_int64(*(sqlite3_stmt **)&ppStmt.st_dev, 0);
      }
      int v9 = sqlite3_finalize(*(sqlite3_stmt **)&ppStmt.st_dev);
      if (!v9) {
        goto LABEL_12;
      }
      int v7 = v9;
    }
    uint64_t v10 = sqlite3_errmsg(ppDb);
    syslog(3, "Failed to %s %d %s", "fetch asset count", v7, v10);
  }
LABEL_12:
  if (v4) {
    BOOL v11 = v5 == -1;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11) {
    goto LABEL_23;
  }
  memset(&ppStmt, 0, sizeof(ppStmt));
  if (stat(a1, &ppStmt))
  {
    int v12 = *__error();
    if (v12 == 2)
    {
      sqlite3_int64 v5 = 0;
      goto LABEL_23;
    }
    strerror(v12);
    syslog(3, "Failed to %s, can't stat %s error=%s");
  }
  else
  {
    syslog(3, "Failed to %s on %s (uid %d, size %d)");
  }
  sqlite3_int64 v5 = -1;
LABEL_23:
  if (ppDb) {
    sqlite3_close(ppDb);
  }
  return v5;
}

id indexSetForManagedObjectsMatchingIDs(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  sqlite3_int64 v5 = [MEMORY[0x1E4F28E60] indexSet];
  if ([v3 count] && objc_msgSend(v4, "count"))
  {
    uint64_t v35 = v5;
    int v6 = [v4 objectAtIndex:0];
    uint64_t v34 = v4;
    unint64_t v7 = [v4 count];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v32 = v3;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v8);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "objectID", v32);
          if ([v15 isEqual:v6])
          {
            [v35 addIndex:v11 + i];
            if (++v12 >= v7)
            {
              sqlite3_int64 v5 = v35;
              id v29 = v35;

              goto LABEL_26;
            }
            uint64_t v16 = [v34 objectAtIndex:v12];

            int v6 = (void *)v16;
          }
        }
        v11 += i;
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    [v35 removeAllIndexes];
    long long v17 = (void *)[v34 mutableCopy];
    uint64_t v18 = [v17 count];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obuint64_t j = v8;
    uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v37;
      while (2)
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(obj);
          }
          id v24 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "objectID", v32);
          uint64_t v25 = objc_msgSend(v17, "indexOfObject:inRange:", v24, 0, v18);
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v26 = v25;
            [v35 addIndex:v21 + j];
            [v17 removeObjectAtIndex:v26];
            if (!--v18)
            {
              sqlite3_int64 v5 = v35;
              id v30 = v35;

              goto LABEL_26;
            }
          }
        }
        v21 += j;
        uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    sqlite3_int64 v5 = v35;
    id v27 = v35;
LABEL_26:

    id v3 = v32;
    id v4 = v34;
  }
  else
  {
    id v28 = v5;
  }

  return v5;
}

unint64_t PLCombineToInt64(double a1, double a2, double a3, double a4)
{
  return ((unint64_t)(int)(a2 * 100.0) << 32) | ((unint64_t)(int)(a1 * 100.0) << 48) | ((uint64_t)(int)(a3 * 100.0) << 16) | (int)(a4 * 100.0);
}

BOOL PLCGRectIsNormalized(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (CGRectGetMinX(*(CGRect *)&a1) < 0.0) {
    return 0;
  }
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  if (CGRectGetMinX(v9) > 1.0) {
    return 0;
  }
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  if (CGRectGetMinY(v10) < 0.0) {
    return 0;
  }
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  if (CGRectGetMinY(v11) > 1.0) {
    return 0;
  }
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  if (CGRectGetMaxX(v12) < 0.0) {
    return 0;
  }
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  if (CGRectGetMaxX(v13) > 1.0) {
    return 0;
  }
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  if (CGRectGetMaxY(v14) < 0.0) {
    return 0;
  }
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  return CGRectGetMaxY(v15) <= 1.0;
}

BOOL PLCopySQLiteDatabase(void *a1, void *a2, int a3, void *a4)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v32 = 0;
  ppDb = 0;
  id v9 = v7;
  if (sqlite3_open_v2((const char *)[v9 UTF8String], &ppDb, 1, 0))
  {
    if (ppDb) {
      sqlite3_close(ppDb);
    }
    CGRect v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
    CGRect v11 = [v10 absoluteString];
    [v11 stringByAppendingString:@"?readonly_shm=1"];
    id v12 = objc_claimAutoreleasedReturnValue();
    int v13 = sqlite3_open_v2((const char *)[v12 UTF8String], &ppDb, 1, 0);

    if (v13)
    {
      if (ppDb) {
        sqlite3_close(ppDb);
      }
      NSLog((NSString *)@"couldn't open source database readonly, trying read/write mode");
      id v14 = v9;
      uint64_t v15 = sqlite3_open_v2((const char *)[v14 UTF8String], &ppDb, 2, 0);
      if (v15)
      {
        uint64_t v16 = v15;
        if (ppDb) {
          sqlite3_close(ppDb);
        }
        if (!a4) {
          goto LABEL_23;
        }
        long long v17 = [NSString stringWithFormat:@"Failed to open src db %@: sqlite error %d\n", v14, v16];
        uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v38 = *MEMORY[0x1E4F28A50];
        v39[0] = v17;
        uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v20 = (void **)v39;
        uint64_t v21 = &v38;
        goto LABEL_22;
      }
    }
  }
  id v22 = v8;
  uint64_t v23 = sqlite3_open_v2((const char *)[v22 UTF8String], &v32, 6, 0);
  BOOL v24 = v23 == 0;
  if (v23)
  {
    uint64_t v25 = v23;
    if (ppDb) {
      sqlite3_close(ppDb);
    }
    if (v32) {
      sqlite3_close(v32);
    }
    if (a4)
    {
      uint64_t v26 = [NSString stringWithFormat:@"Failed to open dst db %@: sqlite error %d\n", v22, v25];
      id v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28A50];
      long long v37 = v26;
      id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a4 = [v27 errorWithDomain:@"PLHelperErrorDomain" code:0 userInfo:v28];
    }
  }
  uint64_t v29 = sqlite3_file_control(v32, 0, 102, ppDb);
  if (v29)
  {
    if (!a4)
    {
LABEL_23:
      BOOL v24 = 0;
      goto LABEL_27;
    }
    long long v17 = [NSString stringWithFormat:@"Failed to replace %@ with %@: sqlite error %d\n", v22, v9, v29];
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28A50];
    uint64_t v35 = v17;
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v20 = &v35;
    uint64_t v21 = &v34;
LABEL_22:
    id v30 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
    *a4 = [v18 errorWithDomain:@"PLHelperErrorDomain" code:0 userInfo:v30];

    goto LABEL_23;
  }
  if (a3) {
    sqlite3_exec(v32, "pragma journal_mode=delete", 0, 0, 0);
  }
  sqlite3_exec(v32, "pragma vacuum", 0, 0, 0);
LABEL_27:
  if (ppDb) {
    sqlite3_close(ppDb);
  }
  if (v32) {
    sqlite3_close(v32);
  }

  return v24;
}

id PLRenderableImageUniformTypeIdentifiers()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  id v0 = [(id)*MEMORY[0x1E4F44410] identifier];
  id v1 = objc_msgSend((id)*MEMORY[0x1E4F44460], "identifier", v0);
  v7[1] = v1;
  uint64_t v2 = [(id)*MEMORY[0x1E4F444E0] identifier];
  void v7[2] = v2;
  id v3 = [(id)*MEMORY[0x1E4F44340] identifier];
  v7[3] = v3;
  id v4 = [(id)*MEMORY[0x1E4F44498] identifier];
  void v7[4] = v4;
  sqlite3_int64 v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];

  return v5;
}

uint64_t PLUniformTypeIdentifierIsRenderableImage(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = PLRenderableImageUniformTypeIdentifiers();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        char v8 = [v2 conformsToType:v7];

        if (v8)
        {
          uint64_t v4 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v4;
}

uint64_t PLSleepUntilNotification()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  PLSleepUntilNotificationWithName_waiting = 1;
  int out_token = 0;
  id v0 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __PLSleepUntilNotificationWithName_block_invoke;
  handler[3] = &__block_descriptor_40_e8_v12__0i8l;
  void handler[4] = "com.apple.photos.debug.go";
  notify_register_dispatch("com.apple.photos.debug.go", &out_token, v0, handler);

  id v1 = (FILE **)MEMORY[0x1E4F143C8];
  if (PLSleepUntilNotificationWithName_waiting)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      if (!(v2 + 5 * (v3 / 5)))
      {
        uint64_t v4 = *v1;
        pid_t v5 = getpid();
        fprintf(v4, "PID %d: Waiting for: notifyutil -p %s\n", v5, "com.apple.photos.debug.go");
        int v6 = PLBackendGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          pid_t v7 = getpid();
          *(_DWORD *)long long buf = 67109378;
          pid_t v14 = v7;
          __int16 v15 = 2080;
          uint64_t v16 = "com.apple.photos.debug.go";
          _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEFAULT, "PID %d: Waiting for: notifyutil -p %s\n", buf, 0x12u);
        }
      }
      sleep(1u);
      ++v3;
      --v2;
    }
    while (PLSleepUntilNotificationWithName_waiting);
  }
  char v8 = *v1;
  pid_t v9 = getpid();
  return fprintf(v8, "PID %d: Running\n", v9);
}

uint64_t __PLSleepUntilNotificationWithName_block_invoke(uint64_t a1)
{
  uint64_t v2 = (FILE *)*MEMORY[0x1E4F143C8];
  pid_t v3 = getpid();
  uint64_t result = fprintf(v2, "PID %d: Got %s\n", v3, *(const char **)(a1 + 32));
  PLSleepUntilNotificationWithName_waiting = 0;
  return result;
}

uint64_t PLIsDeviceClassiPhone()
{
  id v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 isEqualToString:@"iPhone"];

  return v1;
}

uint64_t PLDeviceSupportsASTC()
{
  if (PLDeviceSupportsASTC_s_onceToken != -1) {
    dispatch_once(&PLDeviceSupportsASTC_s_onceToken, &__block_literal_global_496);
  }
  return PLDeviceSupportsASTC_s_hasSupport;
}

uint64_t PLIsCaptureSessionEnabled()
{
  if (PLIsCaptureSessionEnabled_sOnceToken != -1) {
    dispatch_once(&PLIsCaptureSessionEnabled_sOnceToken, &__block_literal_global_501);
  }
  return PLIsCaptureSessionEnabled_sIsCaptureSessionEnabled;
}

void __PLIsCaptureSessionEnabled_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v1 = [v0 BOOLForKey:@"com.apple.photos.asssetd.CaptureSessionDisabled"];

  if (v1)
  {
    PLIsCaptureSessionEnabled_sIsCaptureSessionEnabled = 0;
    uint64_t v2 = PLBackendGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)pid_t v3 = 0;
      _os_log_impl(&dword_19BCFB000, v2, OS_LOG_TYPE_ERROR, "Capture Session: Disabled due to com.apple.photos.asssetd.CaptureSessionDisabled user default", v3, 2u);
    }
  }
  else
  {
    PLIsCaptureSessionEnabled_sIsCaptureSessionEnabled = _os_feature_enabled_impl();
  }
}

uint64_t PLIsSecureCaptureExtension()
{
  id v0 = [MEMORY[0x1E4F22448] extensionPointRecordForCurrentProcess];
  int v1 = v0;
  if (v0)
  {
    uint64_t v2 = [v0 identifier];
    uint64_t v3 = [@"com.apple.securecapture" isEqualToString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void *PLCameraBundleIdentifiers()
{
  return &unk_1EEC14F98;
}

id _MetadataFileExtensions()
{
  pl_dispatch_once(&_InitializeFileExtensions_onceToken, &__block_literal_global_4242);
  id v0 = (void *)__metadataFileExtensions;
  return v0;
}

id _ObsoleteFileExtensions()
{
  pl_dispatch_once(&_InitializeFileExtensions_onceToken, &__block_literal_global_4242);
  id v0 = (void *)__obsoleteFileExtensions;
  return v0;
}

BOOL PLCanMoveFromSourceStateToTargetState(uint64_t a1, uint64_t a2)
{
  return a1 + 1 == a2 || a1 == a2 || a2 == 99;
}

BOOL PLHasPathFromSourceStateToTargetState(uint64_t a1, uint64_t a2)
{
  return a1 <= a2;
}

void PLRunWithLock(void *a1, void *a2)
{
  id v8 = a1;
  uint64_t v3 = a2;
  uint64_t v4 = v8;
  if (!v8)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    pid_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void PLRunWithLock(__strong id<NSLocking> _Nonnull, void (^__strong _Nonnull)(void))");
    [v6 handleFailureInFunction:v7 file:@"PLLockHelpers.m" lineNumber:10 description:@"lock cannot be nil"];

    uint64_t v4 = 0;
  }
  pid_t v5 = (void *)MEMORY[0x19F38F510]([v4 lock]);
  v3[2](v3);
  [v8 unlock];
}

void sub_19BD71804(_Unwind_Exception *a1)
{
}

void sub_19BD71824(void *a1)
{
}

uint64_t PLBoolResultWithUnfairLock(os_unfair_lock_s *a1, void *a2)
{
  uint64_t v3 = a2;
  os_unfair_lock_lock(a1);
  uint64_t v4 = v3[2](v3);

  os_unfair_lock_unlock(a1);
  return v4;
}

BOOL PLPresentLimitedLibraryPickerRepromptForApplication(void *a1, void *a2)
{
  v28[6] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  pid_t v5 = NSString;
  int v6 = PLAssetsLibraryLocalizedFrameworkString(@"PLLocalizedLimitedLibraryRepromptTitle");
  pid_t v7 = [v5 localizedStringWithValidatedFormat:v6, @"%@", 0, v3 validFormatSpecifiers error];

  id v8 = PLAssetsLibraryLocalizedFrameworkString(@"PLLocalizedLimitedLibraryRepromptSelectLabel");
  pid_t v9 = PLAssetsLibraryLocalizedFrameworkString(@"PLLocalizedLimitedLibraryRepromptKeepLabel");
  long long v10 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v11 = *MEMORY[0x1E4F1D9D0];
  v27[0] = *MEMORY[0x1E4F1D990];
  v27[1] = v11;
  v28[0] = v7;
  v28[1] = v8;
  uint64_t v12 = *MEMORY[0x1E4F1D9B8];
  v27[2] = *MEMORY[0x1E4F1DA10];
  v27[3] = v12;
  v28[2] = v9;
  v28[3] = MEMORY[0x1E4F1CC38];
  v27[4] = @"DismissOnLock";
  v27[5] = @"SBUserNotificationDontDismissOnUnlock";
  v28[4] = MEMORY[0x1E4F1CC38];
  v28[5] = MEMORY[0x1E4F1CC38];
  long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];
  pid_t v14 = [v10 dictionaryWithDictionary:v13];

  if ([v4 length]) {
    [v14 setObject:v4 forKey:*MEMORY[0x1E4F1D9A8]];
  }
  __int16 v15 = PLBackendGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v26 = v3;
    _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_DEFAULT, "Presenting library picker alert on behalf of %{public}@", buf, 0xCu);
  }

  uint64_t v16 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0x20uLL, 0, (CFDictionaryRef)v14);
  if (v16)
  {
    uint64_t v17 = v16;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v16, 0.0, &responseFlags);
    CFOptionFlags v18 = responseFlags & 3;
    BOOL v19 = v18 == 1;
    CFRelease(v17);
    uint64_t v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (v18 == 1) {
        uint64_t v21 = v8;
      }
      else {
        uint64_t v21 = v9;
      }
      *(_DWORD *)long long buf = 138543362;
      id v26 = v21;
      _os_log_impl(&dword_19BCFB000, v20, OS_LOG_TYPE_DEFAULT, "User selected: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      id v26 = v3;
      _os_log_impl(&dword_19BCFB000, v22, OS_LOG_TYPE_ERROR, "Failed to present library picker alert on behalf of '%{public}@'", buf, 0xCu);
    }

    BOOL v19 = 0;
  }

  return v19;
}

void PLPresentLimitedLibraryPicker(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v2 = (void *)getPHLimitedLibraryPickerClass_softClass;
  uint64_t v10 = getPHLimitedLibraryPickerClass_softClass;
  if (!getPHLimitedLibraryPickerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v12 = __getPHLimitedLibraryPickerClass_block_invoke;
    long long v13 = &unk_1E58A2238;
    pid_t v14 = &v7;
    __getPHLimitedLibraryPickerClass_block_invoke((uint64_t)&buf);
    uint64_t v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = PLBackendGetLog();
  pid_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = @"async";
      if (a1) {
        int v6 = @"sync";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Presenting limited library picker (%@)", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v3, "presentLimitedLibraryPicker:waitForDismissal:", &stru_1EEBF74F0, a1, v7);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Failed to register limited library picker", (uint8_t *)&buf, 2u);
    }
  }
}

void sub_19BD71D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class __getPHLimitedLibraryPickerClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __PhotosUILibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E589FAF8;
    uint64_t v8 = 0;
    PhotosUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PhotosUILibraryCore_frameworkLibrary)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"void *PhotosUILibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PLPrivacyUserInteraction.m", 18, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("PHLimitedLibraryPicker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    pid_t v5 = [NSString stringWithUTF8String:"Class getPHLimitedLibraryPickerClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PLPrivacyUserInteraction.m", 19, @"Unable to find class %s", "PHLimitedLibraryPicker");

LABEL_10:
    __break(1u);
  }
  getPHLimitedLibraryPickerClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __PhotosUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PhotosUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t PLIsClientApplicationStateReadyForLimitedLibraryPickerReprompt()
{
  Class v0 = NSClassFromString((NSString *)@"UIApplication");
  if (!v0 || (objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  int v1 = [(objc_class *)v0 sharedApplication];
  BOOL v2 = [v1 applicationState] == 0;

  return v2;
}

void sub_19BD7207C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(a1);
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a9) = 138543362;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Encountered exception attempting to determine application state for limited library picker reprompt: %{public}@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x19BD7204CLL);
  }
  _Unwind_Resume(a1);
}

__CFString *PLValidatedSavedAssetTypeDescription(uint64_t a1)
{
  int v3 = a1;
  id v4 = @"PhotoBooth";
  switch(v3)
  {
    case 0:
      id v4 = @"Unknown";
      break;
    case 1:
      goto LABEL_49;
    case 2:
      id v4 = @"PhotoStream";
      break;
    case 3:
      id v4 = @"Camera";
      break;
    case 4:
      id v4 = @"CloudShared";
      break;
    case 5:
      id v4 = @"CameraConnectionKit";
      break;
    case 6:
      id v4 = @"CloudPhotoLibrary";
      break;
    case 7:
      id v4 = @"Wallpaper";
      break;
    case 8:
      id v4 = @"MomentShared";
      break;
    case 9:
      id v4 = @"Placeholder";
      break;
    case 10:
      id v4 = @"Referenced";
      break;
    case 11:
      id v4 = @"Alternate";
      break;
    case 12:
      id v4 = @"Guest";
      break;
    case 13:
      id v4 = @"CompanionSynced";
      break;
    case 14:
      id v4 = @"Recovered";
      break;
    default:
      if (a1 == 256)
      {
        id v4 = @"LegacyImport";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"unrecognized savedAssetType %d", a1);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_49:
      }
      break;
  }
  return v4;
}

void sub_19BD74110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4887(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4888(uint64_t a1)
{
}

id PLUnderlyingPOSIXError(void *a1)
{
  id v1 = a1;
  uint64_t v2 = *MEMORY[0x1E4F28798];
  uint64_t v3 = *MEMORY[0x1E4F28A50];
  id v4 = v1;
  do
  {
    pid_t v5 = [v4 domain];
    char v6 = [v5 isEqual:v2];

    if (v6) {
      break;
    }
    long long v7 = [v4 userInfo];
    uint64_t v8 = [v7 objectForKey:v3];

    id v4 = (void *)v8;
  }
  while (v8);

  return v4;
}

void PLMakeIndicatorFileExistAtPath(void *a1, int a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = (const char *)[v3 fileSystemRepresentation];
  if (a2)
  {
    int v5 = open(v4, 513, 438);
    if ((v5 & 0x80000000) == 0)
    {
      close(v5);
      goto LABEL_21;
    }
    if (*__error() == 2)
    {
      char v6 = [v3 stringByDeletingLastPathComponent];
      uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v21 = 0;
      int v11 = [v10 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v21];
      uint64_t v12 = (__CFString *)v21;

      id v13 = v3;
      int v14 = open((const char *)[v13 fileSystemRepresentation], 513, 438);
      if (v14 < 0)
      {
        uint64_t v17 = PLBackendGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          CFOptionFlags v18 = __error();
          BOOL v19 = strerror(*v18);
          uint64_t v20 = @"succeeded";
          *(_DWORD *)long long buf = 138543874;
          id v23 = v13;
          if (!v11) {
            uint64_t v20 = v12;
          }
          __int16 v24 = 2082;
          uint64_t v25 = v19;
          __int16 v26 = 2114;
          id v27 = v20;
          _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_ERROR, "%{public}@ could not be created, error: %{public}s, dir creation %{public}@", buf, 0x20u);
        }
      }
      else
      {
        close(v14);
      }

      goto LABEL_20;
    }
    char v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = __error();
      uint64_t v16 = strerror(*v15);
      *(_DWORD *)long long buf = 138543618;
      id v23 = v3;
      __int16 v24 = 2082;
      uint64_t v25 = v16;
      id v9 = "%{public}@ could not be created, error: %{public}s";
      goto LABEL_13;
    }
    goto LABEL_20;
  }
  if (unlink(v4) && *__error() != 2)
  {
    char v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      long long v7 = __error();
      uint64_t v8 = strerror(*v7);
      *(_DWORD *)long long buf = 138543618;
      id v23 = v3;
      __int16 v24 = 2082;
      uint64_t v25 = v8;
      id v9 = "%{public}@ could not be removed, error: %{public}s";
LABEL_13:
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);
    }
LABEL_20:
  }
LABEL_21:
}

uint64_t PLQualityOfServiceFromQoSClass(int a1)
{
  if (a1 <= 20)
  {
    if (a1 && a1 != 17) {
      return 9;
    }
    return 17;
  }
  switch(a1)
  {
    case 21:
      return 17;
    case 25:
      return 25;
    case 33:
      return 33;
  }
  return 9;
}

__CFString *PLStringFromQualityOfService(uint64_t a1)
{
  if (a1 <= 16)
  {
    if (a1 == -1) {
      return @"NSQualityOfServiceDefault";
    }
    if (a1 == 9) {
      return @"NSQualityOfServiceBackground";
    }
  }
  else
  {
    switch(a1)
    {
      case 17:
        return @"NSQualityOfServiceUtility";
      case 33:
        return @"NSQualityOfServiceUserInteractive";
      case 25:
        return @"NSQualityOfServiceUserInitiated";
    }
  }
  return @"Unknown";
}

void sub_19BD7A21C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id stringFromData(void *a1)
{
  uint64_t v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithData:v2 encoding:4];

  return v3;
}

id dateFromData(void *a1)
{
  double v5 = 0.0;
  [a1 getBytes:&v5 length:8];
  uint64_t v1 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v5];
  id v3 = [v1 startOfDayForDate:v2];

  return v3;
}

id circularRegionFromData(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F28DC0];
  id v2 = a1;
  id v3 = [v1 unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

id convertToData(void *a1)
{
  id v1 = a1;
  if (!v1) {
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = dataFromDate(v1);
LABEL_8:
    id v3 = (void *)v2;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 dataUsingEncoding:4];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:0];
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [NSString stringWithUTF8String:"NSData * _Nullable convertToData(NSObject * _Nullable __strong)"];
    [v8 handleFailureInFunction:v9, @"PLSingleQuery+Utilities.m", 96, @"Object value must be either date, string, or number but is: <%@:%p>", objc_opt_class(), v1 file lineNumber description];

LABEL_15:
    id v3 = 0;
    goto LABEL_16;
  }
  CFNumberRef v4 = (const __CFNumber *)v1;
  CFNumberType Type = CFNumberGetType(v4);
  if ((unint64_t)Type <= kCFNumberCGFloatType && ((1 << Type) & 0x13060) != 0)
  {
    [(__CFNumber *)v4 doubleValue];
    uint64_t v7 = dataFromDouble(v6);
  }
  else
  {
    uint64_t v7 = dataFromInteger([(__CFNumber *)v4 integerValue]);
  }
  id v3 = (void *)v7;

LABEL_16:
  return v3;
}

id dataFromDate(void *a1)
{
  [a1 timeIntervalSinceReferenceDate];
  uint64_t v4 = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:8];
  return v2;
}

id dataFromDouble(double a1)
{
  double v3 = a1;
  uint64_t v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v3 length:8];
  return v1;
}

id dataFromInteger(uint64_t a1)
{
  uint64_t v3 = a1;
  uint64_t v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v3 length:8];
  return v1;
}

uint64_t integerFromData(void *a1)
{
  uint64_t v2 = 0;
  [a1 getBytes:&v2 length:8];
  return v2;
}

double doubleFromData(void *a1)
{
  double v2 = 0.0;
  [a1 getBytes:&v2 length:8];
  return v2;
}

void sub_19BD7BCAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BD7BDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_19BD7C8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5519(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5520(uint64_t a1)
{
}

void sub_19BD7CEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD7D4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD7DBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD7E18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD7E604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD7ECB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD7EF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19BD7F2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_19BD7F728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BD7FB98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

id PLProgressPercentGroupCheck(void *a1)
{
  id v1 = a1;
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  double v2 = [v1 allValues];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __PLProgressPercentGroupCheck_block_invoke;
  v4[3] = &unk_1E589FEB0;
  void v4[4] = &v5;
  [v2 enumerateObjectsUsingBlock:v4];

  if (v6[3] >= 101) {
    __assert_rtn("PLProgressPercentGroupCheck", "PLLibraryServicesOperationProgress.m", 80, "totalPercent <= 100");
  }
  _Block_object_dispose(&v5, 8);
  return v1;
}

void sub_19BD7FD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PLProgressPercentGroupCheck_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 integerValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id PLProgressPercentGroupForLaunchStateMachine()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Wait for data migration checkpoint";
  v6[1] = @"Prepare for OTA restore if necessary";
  v7[0] = &unk_1EEC148A8;
  v7[1] = &unk_1EEC148C0;
  v6[2] = @"Wait for first unlock";
  v6[3] = @"Migrate or rebuild library if necessary";
  void v7[2] = &unk_1EEC148A8;
  v7[3] = &unk_1EEC148D8;
  v6[4] = @"Initialize CPL manager";
  void v7[4] = &unk_1EEC148A8;
  Class v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v1 addEntriesFromDictionary:v0];
  v4[0] = @"Create constraints director";
  v4[1] = @"Notify library availability";
  v5[0] = &unk_1EEC148F0;
  v5[1] = &unk_1EEC148A8;
  v4[2] = @"Activate TCC";
  v4[3] = @"Initialize change handling";
  _OWORD v5[2] = &unk_1EEC148F0;
  v5[3] = &unk_1EEC148A8;
  void v4[4] = @"Detect and enqueue outstanding transaction crash recovery operations";
  void v4[5] = @"CrashRecovery: Rebuild all moments";
  v5[4] = &unk_1EEC148A8;
  v5[5] = &unk_1EEC148A8;
  v4[6] = @"CrashRecovery: Recalculate album counts";
  v4[7] = @"CrashRecovery: Cloud feed rebuild";
  v5[6] = &unk_1EEC148F0;
  v5[7] = &unk_1EEC148F0;
  v4[8] = @"CrashRecovery: Import from file system";
  v4[9] = @"CrashRecovery: Reset search index";
  v5[8] = &unk_1EEC148F0;
  v5[9] = &unk_1EEC148F0;
  v4[10] = @"CrashRecovery: Restart pending placeholder assets";
  v4[11] = @"File System Import Notify Enter";
  v5[10] = &unk_1EEC148F0;
  v5[11] = &unk_1EEC148F0;
  v4[12] = @"Create singleton albums if required";
  v4[13] = @"Create singleton albums if required";
  v5[12] = &unk_1EEC148F0;
  v5[13] = &unk_1EEC148F0;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:14];
  [v1 addEntriesFromDictionary:v2];

  return v1;
}

id PLProgressPercentGroupForRunningStateMachine()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Camera ingest recovery";
  v6[1] = @"Build quick action items";
  v7[0] = &unk_1EEC148F0;
  v7[1] = &unk_1EEC148F0;
  v6[2] = @"Asset creation recovery";
  v6[3] = @"Register background job service on library";
  void v7[2] = &unk_1EEC148F0;
  v7[3] = &unk_1EEC148F0;
  v6[4] = @"Recovery from Duplicate Merge crash recovery";
  void v7[4] = &unk_1EEC148F0;
  Class v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v1 addEntriesFromDictionary:v0];
  v4[0] = @"Tell photoanalysisd about a newly opened library";
  v4[1] = @"Handle thumbnail rebuild request";
  v5[0] = &unk_1EEC148F0;
  v5[1] = &unk_1EEC148F0;
  v4[2] = @"Start Journal Manager";
  v4[3] = @"Handle locale change if necessary";
  _OWORD v5[2] = &unk_1EEC148F0;
  v5[3] = &unk_1EEC148F0;
  void v4[4] = @"Handle green tea contacts authorization change if necessary";
  void v4[5] = @"File System Import";
  v5[4] = &unk_1EEC148F0;
  v5[5] = &unk_1EEC14908;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];
  [v1 addEntriesFromDictionary:v2];

  return v1;
}

void PLProgressPercentForOperationAddMap(void *a1, void *a2)
{
  id v4 = a2;
  id v3 = a1;
  PLProgressPercentGroupCheck(v4);
  objc_claimAutoreleasedReturnValue();
  [v3 addEntriesFromDictionary:v4];
}

uint64_t PLProgressPercentForOperationName(void *a1)
{
  uint64_t v1 = PLProgressPercentForOperationName_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&PLProgressPercentForOperationName_onceToken, &__block_literal_global_5724);
  }
  id v3 = [(id)PLProgressPercentForOperationName_progressPercentMap objectForKeyedSubscript:v2];

  uint64_t v4 = [v3 intValue];
  return v4;
}

void __PLProgressPercentForOperationName_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = PLProgressPercentGroupForLaunchStateMachine();
  PLProgressPercentForOperationAddMap(v0, v1);

  id v2 = PLProgressPercentGroupForRunningStateMachine();
  PLProgressPercentForOperationAddMap(v0, v2);

  id v3 = (void *)PLProgressPercentForOperationName_progressPercentMap;
  PLProgressPercentForOperationName_progressPercentMap = (uint64_t)v0;
}

uint64_t __Block_byref_object_copy__5778(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5779(uint64_t a1)
{
}

void sub_19BD81114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD814B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD818D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,SEL sel)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6042(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6043(uint64_t a1)
{
}

void sub_19BD81DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD821F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD8277C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD82E68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD83540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD83C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8407C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD84488(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD84BA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD85290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD85888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD85F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD8663C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD86D4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD87444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD87B80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD8829C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD88714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD88E2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD8951C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD89C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD8A32C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD8AAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8B230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8B698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8BAA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BD8C054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8C378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD8C660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD8CA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8CFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD8D324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8D834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD8DD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8E1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8E610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8EA4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8EE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8F270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8F910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD8FE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD902F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD907CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD90B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD91038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BD91560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD91920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_19BD91C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6361(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6362(uint64_t a1)
{
}

id PLAssetFormatsAllKnownFormatIDs()
{
  if (PLAssetFormatsAllKnownFormatIDs_onceToken != -1) {
    dispatch_once(&PLAssetFormatsAllKnownFormatIDs_onceToken, &__block_literal_global_6461);
  }
  id v0 = (void *)PLAssetFormatsAllKnownFormatIDs_formatIDs;
  return v0;
}

void __PLAssetFormatsAllKnownFormatIDs_block_invoke()
{
  id v0 = (void *)PLAssetFormatsAllKnownFormatIDs_formatIDs;
  PLAssetFormatsAllKnownFormatIDs_formatIDs = (uint64_t)&unk_1EEC14FC8;
}

uint64_t __Block_byref_object_copy__6531(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6532(uint64_t a1)
{
}

void sub_19BD94DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BD9516C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7030(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7031(uint64_t a1)
{
}

BOOL PLImageFormatSizeIsMaxSize(double a1, double a2)
{
  return a2 <= 0.0 || a1 <= 0.0;
}

id PLPhotosPickerLogDateFormatter()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v0 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZZZZZ"];
  uint64_t v1 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  [v0 setLocale:v1];

  return v0;
}

__CFString *PLStringFromPhotosAccessScope(uint64_t a1)
{
  if (a1 == 1)
  {
    uint64_t v1 = @"add-only";
    goto LABEL_10;
  }
  char v2 = a1;
  if ((a1 & 7) != 0)
  {
    uint64_t v1 = @"read-write";
    goto LABEL_10;
  }
  id v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = v3;
  if ((v2 & 2) == 0)
  {
    if ((v2 & 4) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    [v4 addObject:@"modify"];
    if ((v2 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [v3 addObject:@"read"];
  if ((v2 & 4) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if (v2) {
LABEL_8:
  }
    [v4 addObject:@"add"];
LABEL_9:
  uint64_t v5 = NSString;
  double v6 = [v4 componentsJoinedByString:@"|"];
  uint64_t v1 = [v5 stringWithFormat:@"read-write (%@)", v6];

LABEL_10:
  return v1;
}

uint64_t TCCLibraryCore()
{
  if (!TCCLibraryCore_frameworkLibrary) {
    TCCLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return TCCLibraryCore_frameworkLibrary;
}

uint64_t gettcc_authorization_audit_token_report_useSymbolLoc()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = gettcc_authorization_audit_token_report_useSymbolLoc_ptr;
  uint64_t v6 = gettcc_authorization_audit_token_report_useSymbolLoc_ptr;
  if (!gettcc_authorization_audit_token_report_useSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __gettcc_authorization_audit_token_report_useSymbolLoc_block_invoke;
    v2[3] = &unk_1E58A2238;
    v2[4] = &v3;
    __gettcc_authorization_audit_token_report_useSymbolLoc_block_invoke(v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_19BD98680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__gettcc_authorization_audit_token_report_useSymbolLoc_block_invoke(void *a1)
{
  uint64_t v2 = TCCLibraryCore();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
  }
  else
  {
    a1 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *TCCLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v3, @"PLPrivacy.m", 31, @"%s", 0);

    __break(1u);
    free(v5);
  }
  uint64_t result = dlsym(v3, "tcc_authorization_audit_token_report_use");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  gettcc_authorization_audit_token_report_useSymbolLoc_ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t __TCCLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TCCLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_19BD99060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __PLTCCAuthorizationRequest_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id _ValidatedClientLogFromDictionary(void *a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    uint64_t v8 = 0;
    goto LABEL_15;
  }
  uint64_t v3 = [v1 objectForKeyedSubscript:@"bundleIdentifier"];
  uint64_t v4 = [v2 objectForKeyedSubscript:@"timestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v2 objectForKeyedSubscript:@"timestamp"];
    uint64_t v6 = PLPhotosPickerLogDateFormatter();
    id v7 = [v6 dateFromString:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v4;
    }
    else {
      id v7 = 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v8 = 0;
  if (![v3 length] || !v7) {
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13[0] = @"bundleIdentifier";
    v13[1] = @"timestamp";
    v14[0] = v3;
    v14[1] = v7;
    v13[2] = @"pickerUsesOptions";
    id v9 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v10 = objc_msgSend(v2, "objectForKeyedSubscript:");
    int v11 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "BOOLValue"));
    void v14[2] = v11;
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  }
  else
  {
LABEL_13:
    uint64_t v8 = 0;
  }
LABEL_14:

LABEL_15:
  return v8;
}

BOOL PLPhotosFullAccessAllowed(uint64_t a1)
{
  return a1 == 0;
}

BOOL PLPhotosLimitedAccessAllowed(uint64_t a1)
{
  return a1 == 4;
}

uint64_t PLPhotosAccessAllowedResultForClientAuditToken()
{
  unint64_t v0 = tcc_authorization_check_audit_token();
  if (v0 >= 5) {
    uint64_t v1 = 1;
  }
  else {
    uint64_t v1 = v0;
  }
  return qword_19BDC73A0[v1];
}

void sub_19BD99BF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7860(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7861(uint64_t a1)
{
}

void sub_19BD9A1D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

__CFString *PLStringFromPLPhotoLibraryPathManagerLibraryFormatShort(int a1)
{
  unint64_t v2 = [@"PLPhotoLibraryPathManagerLibraryFormat" length];
  uint64_t v3 = @"PLPhotoLibraryPathManagerLibraryFormatDefault";
  if (a1 == 1) {
    uint64_t v3 = @"PLPhotoLibraryPathManagerLibraryFormatDCIM";
  }
  if (a1 == 2) {
    uint64_t v3 = @"PLPhotoLibraryPathManagerLibraryFormatUBF";
  }
  uint64_t v4 = v3;
  if ([(__CFString *)v4 length] > v2)
  {
    uint64_t v5 = [(__CFString *)v4 substringFromIndex:v2];

    uint64_t v4 = (__CFString *)v5;
  }
  return v4;
}

__CFString *PLStringFromPLPhotoLibraryPathManagerLibraryFormat(int a1)
{
  uint64_t v1 = @"PLPhotoLibraryPathManagerLibraryFormatDefault";
  if (a1 == 1) {
    uint64_t v1 = @"PLPhotoLibraryPathManagerLibraryFormatDCIM";
  }
  if (a1 == 2) {
    return @"PLPhotoLibraryPathManagerLibraryFormatUBF";
  }
  else {
    return v1;
  }
}

id PLUnarchiveUUIDStringsSetFromData(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unint64_t v2 = [v1 length];
  unint64_t v3 = v2 >> 4;
  id v4 = v1;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [MEMORY[0x1E4F1CA80] setWithCapacity:v2 >> 4];
  if (v2 >= 0x10)
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      memset(v13, 0, sizeof(v13));
      uuid_unparse((const unsigned __int8 *)(v5 + 16 * v7), v13);
      id v9 = [NSString stringWithCString:v13 encoding:4];
      [v6 addObject:v9];

      uint64_t v7 = v8;
    }
    while (v3 > v8++);
  }
  int v11 = [MEMORY[0x1E4F1CAD0] setWithSet:v6];

  return v11;
}

id PLArchiveDataFromUUIDStringsSet(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    uint64_t v3 = 16 * v2;
    id v4 = (char *)malloc_type_malloc(16 * v2, 0x5BE23801uLL);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      int v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          v8 += +[PLUUIDString parseUUIDString:uuidBuffer:](PLUUIDString, "parseUUIDString:uuidBuffer:", *(void *)(*((void *)&v13 + 1) + 8 * i), &v4[16 * v8], (void)v13);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    int v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v4 length:v3 freeWhenDone:1];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

void sub_19BD9F93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,SEL sel)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8849(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8850(uint64_t a1)
{
}

void sub_19BDA000C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BDA0684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BDA0B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

__CFString *PLAdjustmentBaseVersionDescription(uint64_t a1)
{
  id v1 = @"unadjusted";
  if (a1 == 2) {
    id v1 = @"current";
  }
  if (a1 == 1) {
    return @"penultimate";
  }
  else {
    return v1;
  }
}

__CFString *PLStringFromPLQueryConjunction(int a1)
{
  id v1 = @"kPLQueryConjunction_OR";
  if (a1 == 1) {
    id v1 = @"kPLQueryConjunction_AND";
  }
  if (a1 == 2) {
    return @"kPLQueryConjunction_NOT";
  }
  else {
    return v1;
  }
}

__CFString *PLStringFromPLQueryKey(int a1)
{
  uint64_t result = @"kPLQueryKey_unknown";
  if (a1 <= 299)
  {
    if (a1 > 99)
    {
      uint64_t v3 = @"kPLQueryKey_inAlbum";
      id v4 = @"kPLQueryKey_dateCaptured";
      id v5 = @"kPLQueryKey_dateAdded";
      if (a1 != 201) {
        id v5 = @"kPLQueryKey_unknown";
      }
      if (a1 != 200) {
        id v4 = v5;
      }
      BOOL v6 = a1 == 100;
      goto LABEL_24;
    }
    switch(a1)
    {
      case 1:
        uint64_t result = @"kPLQueryKey_isFavorite";
        break;
      case 2:
        uint64_t result = @"kPLQueryKey_isHidden";
        break;
      case 3:
        uint64_t result = @"kPLQueryKey_isAdjusted";
        break;
      case 4:
        uint64_t result = @"kPLQueryKey_isRAW";
        break;
      case 5:
        uint64_t result = @"kPLQueryKey_assetType";
        break;
      case 6:
        uint64_t result = @"kPLQueryKey_isReferenced";
        break;
      case 7:
        uint64_t result = @"kPLQueryKey_isOnline";
        break;
      case 8:
        uint64_t result = @"kPLQueryKey_isMissing";
        break;
      case 9:
        uint64_t result = @"kPLQueryKey_isProRes";
        break;
      default:
        return result;
    }
  }
  else
  {
    if (a1 <= 399)
    {
      switch(a1)
      {
        case 300:
          uint64_t result = @"kPLQueryKey_aperture";
          break;
        case 301:
          uint64_t result = @"kPLQueryKey_cameraModel";
          break;
        case 302:
          uint64_t result = @"kPLQueryKey_flash";
          break;
        case 303:
          uint64_t result = @"kPLQueryKey_focalLength";
          break;
        case 304:
          uint64_t result = @"kPLQueryKey_iso";
          break;
        case 305:
          uint64_t result = @"kPLQueryKey_lensModel";
          break;
        case 306:
          uint64_t result = @"kPLQueryKey_shutterSpeed";
          break;
        case 309:
          uint64_t result = @"kPLQueryKey_bitrate";
          break;
        case 310:
          uint64_t result = @"kPLQueryKey_cameraMake";
          break;
        case 311:
          uint64_t result = @"kPLQueryKey_codec";
          break;
        case 312:
          uint64_t result = @"kPLQueryKey_duration";
          break;
        case 313:
          uint64_t result = @"kPLQueryKey_exposureBias";
          break;
        case 314:
          uint64_t result = @"kPLQueryKey_fps";
          break;
        case 315:
          uint64_t result = @"kPLQueryKey_meteringMode";
          break;
        case 316:
          uint64_t result = @"kPLQueryKey_sampleRate";
          break;
        case 317:
          uint64_t result = @"kPLQueryKey_trackFormat";
          break;
        case 318:
          uint64_t result = @"kPLQueryKey_whiteBalance";
          break;
        case 319:
          uint64_t result = @"kPLQueryKey_hasLocation";
          break;
        default:
          return result;
      }
      return result;
    }
    if (a1 > 549)
    {
      if (a1 <= 599)
      {
        switch(a1)
        {
          case 550:
            uint64_t result = @"kPLQueryKey_personName";
            break;
          case 551:
            uint64_t result = @"kPLQueryKey_personUUID";
            break;
          case 552:
            uint64_t result = @"kPLQueryKey_personUUIDInProximity_unused";
            break;
          case 553:
            uint64_t result = @"kPLQueryKey_personUUIDInMomentForSharedLibrary";
            break;
          default:
            return result;
        }
        return result;
      }
      uint64_t v3 = @"kPLQueryKey_inCircularRegion";
      id v4 = @"kPLQueryKey_notAbleToCPLUpload";
      uint64_t v7 = @"kPLQueryKey_isCPLQuarantine";
      if (a1 != 1001) {
        uint64_t v7 = @"kPLQueryKey_unknown";
      }
      if (a1 != 1000) {
        id v4 = v7;
      }
      BOOL v6 = a1 == 600;
LABEL_24:
      if (v6) {
        return v3;
      }
      else {
        return v4;
      }
    }
    switch(a1)
    {
      case 400:
        uint64_t result = @"kPLQueryKey_filename";
        break;
      case 401:
        uint64_t result = @"kPLQueryKey_title";
        break;
      case 402:
        uint64_t result = @"kPLQueryKey_text";
        break;
      case 403:
        uint64_t result = @"kPLQueryKey_description";
        break;
      default:
        if (a1 == 500) {
          uint64_t result = @"kPLQueryKey_keyword";
        }
        break;
    }
  }
  return result;
}

__CFString *PLStringFromPLQueryValueType(int a1)
{
  if ((a1 - 1) > 4) {
    return @"kPLQueryValueType_unknown";
  }
  else {
    return *(&off_1E58A1318 + (a1 - 1));
  }
}

__CFString *PLStringFromPLQueryComparatorType(int a1)
{
  uint64_t result = @"kPLQueryComparatorType_unknown";
  switch(a1)
  {
    case 1:
      uint64_t result = @"kPLQueryComparatorType_isEqual";
      break;
    case 2:
      uint64_t result = @"kPLQueryComparatorType_isNotEqual";
      break;
    case 3:
      uint64_t result = @"kPLQueryComparatorType_isGreaterThan";
      break;
    case 4:
      uint64_t result = @"kPLQueryComparatorType_isLessThan";
      break;
    case 5:
      uint64_t result = @"kPLQueryComparatorType_isGreaterOrEqualThan";
      break;
    case 6:
      uint64_t result = @"kPLQueryComparatorType_isLessOrEqualThan";
      break;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 26:
    case 27:
    case 28:
    case 29:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
      return result;
    case 20:
      uint64_t result = @"kPLQueryComparatorType_textIncludes";
      break;
    case 21:
      uint64_t result = @"kPLQueryComparatorType_textNotIncludes";
      break;
    case 22:
      uint64_t result = @"kPLQueryComparatorType_textIs";
      break;
    case 23:
      uint64_t result = @"kPLQueryComparatorType_textIsNot";
      break;
    case 24:
      uint64_t result = @"kPLQueryComparatorType_textStartsWith";
      break;
    case 25:
      uint64_t result = @"kPLQueryComparatorType_textEndsWith";
      break;
    case 30:
      uint64_t result = @"kPLQueryComparatorType_isInRange";
      break;
    case 31:
      uint64_t result = @"kPLQueryComparatorType_isIn";
      break;
    case 32:
      uint64_t result = @"kPLQueryComparatorType_isNotIn";
      break;
    case 40:
      uint64_t result = @"kPLQueryComparatorType_isInTheLast";
      break;
    case 41:
      uint64_t result = @"kPLQueryComparatorType_isNotInTheLast";
      break;
    default:
      uint64_t v3 = @"kPLQueryComparatorType_isAny";
      if (a1 != 51) {
        uint64_t v3 = @"kPLQueryComparatorType_unknown";
      }
      if (a1 == 50) {
        uint64_t result = @"kPLQueryComparatorType_isEmpty";
      }
      else {
        uint64_t result = v3;
      }
      break;
  }
  return result;
}

__CFString *PLStringFromPLQueryUnit(int a1)
{
  if ((a1 - 1) > 4) {
    return @"kPLQueryUnit_unused";
  }
  else {
    return *(&off_1E58A1340 + (a1 - 1));
  }
}

__CFString *PLStringFromPLQueryValue(int a1)
{
  if ((a1 - 1) > 0x10) {
    return @"kPLQueryValue_unknown";
  }
  else {
    return *(&off_1E58A1368 + (a1 - 1));
  }
}

void PLUpdateSizeUnit(double *a1, void *a2, double a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [&unk_1EEC14FF8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = a3 * 1000.0;
    uint64_t v9 = *(void *)v14;
    double v10 = 1.0;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(&unk_1EEC14FF8);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v8 < 1000.0
          || [*(id *)(*((void *)&v13 + 1) + 8 * i) isEqualToString:@"TB"])
        {
          if (a1) {
            *a1 = v10 * 1000.0;
          }
          if (a2) {
            *a2 = [v12 UTF8String];
          }
          return;
        }
        double v10 = v10 / 1000.0;
        double v8 = v8 / 1000.0;
      }
      uint64_t v7 = [&unk_1EEC14FF8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

id PLIndentToString(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28E78] string];
  if (a1 >= 1)
  {
    do
    {
      [v2 appendString:PLIndent];
      --a1;
    }
    while (a1);
  }
  return v2;
}

id PLEmptyContainerDescription(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  uint64_t v3 = [v1 stringWithFormat:@"<%@: %p> <empty>", objc_opt_class(), v2];

  return v3;
}

id PLAggregateComparator(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1C978];
  id v2 = a1;
  uint64_t v3 = (void *)[[v1 alloc] initWithArray:v2 copyItems:1];

  id v4 = v3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = ___PLAggregateComparatorFromArray_block_invoke;
  v8[3] = &unk_1E58A14B8;
  id v9 = v4;
  id v5 = (void *)MEMORY[0x19F38F770](v8);
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

id PLNullToNil(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F1CA98] null];
  id v3 = (id)*MEMORY[0x1E4F1D260];

  if (v2 == v1 || v3 == v1) {
    id v5 = 0;
  }
  else {
    id v5 = v1;
  }

  return v5;
}

id PLFullMethodName(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_opt_class();

  id v5 = NSString;
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v7 = 45;
  if ((id)v4 == v3) {
    uint64_t v7 = 43;
  }
  double v8 = [v5 stringWithFormat:@"%c[%@ %@]", v7, v4, v6];

  return v8;
}

id PLAbstractMethodException(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = PLFullMethodName(v3, a2);
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [NSString stringWithFormat:@"%@: must override selector sent to %p", v4, v3];

  double v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

id PLMethodNotImplementedException(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = PLFullMethodName(v3, a2);
  id v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  uint64_t v7 = [NSString stringWithFormat:@"%@: method not implemented sent to %p", v4, v3];

  double v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  return v8;
}

void sub_19BDA31BC(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
}

void sub_19BDA3BBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t PLIsErrorEqualToCode(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5 && [v5 code] == a3)
  {
    uint64_t v7 = [v5 domain];
    uint64_t v8 = [v7 isEqualToString:v6];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

__CFString *NSStringFromPLErrorCode(uint64_t a1)
{
  if (a1 > 46799)
  {
    if (a1 <= 51000)
    {
      if (a1 > 48000)
      {
        if (a1 > 49400)
        {
          switch(a1)
          {
            case 50001:
              id v3 = @"PLPhotosErrorBackgroundJobWorkerCompletionHandlerForcefullyCalled";
              break;
            case 50002:
              id v3 = @"PLPhotosErrorBackgroundJobWorkerNoWorkNeeded";
              break;
            case 50003:
              id v3 = @"PLPhotosErrorBackgroundJobWorkerStopRunningRemainingWorkItems";
              break;
            case 50004:
              id v3 = @"PLPhotosErrorBackgroundJobWorkerRequestedDeferral";
              break;
            case 50005:
              id v3 = @"PLPhotosErrorBackgroundJobWorkerCancelled";
              break;
            case 50006:
              id v3 = @"PLPhotosErrorBackgroundJobWorkerInvalidParameter";
              break;
            case 50007:
              id v3 = @"PLPhotosErrorBackgroundJobWorkerIncorrectWorkItem";
              break;
            default:
              switch(a1)
              {
                case 49501:
                  id v3 = @"PLPhotosErrorSyndicationInvalidContentType";
                  break;
                case 49502:
                  id v3 = @"PLPhotosErrorSyndicationIngestDataTooLarge";
                  break;
                case 49503:
                  id v3 = @"PLPhotosErrorSyndicationIngestDataSizeInvalid";
                  break;
                case 49504:
                  id v3 = @"PLPhotosErrorSyndicationIngestUnknownTypeIdentifier";
                  break;
                default:
                  goto LABEL_529;
              }
              break;
          }
        }
        else
        {
          switch(a1)
          {
            case 48001:
              id v3 = @"PLPhotosErrorFailedToFinalizeDeferredPhotoGeneric";
              break;
            case 48002:
              id v3 = @"PLPhotosErrorDeferredProcessingInvalidated";
              break;
            case 49001:
              id v3 = @"PLPhotosErrorInsufficientResourcesForEdit";
              break;
            default:
              goto LABEL_529;
          }
        }
      }
      else if (a1 <= 47000)
      {
        switch(a1)
        {
          case 46800:
            id v3 = @"PLPhotosErrorFailedToCreateDefaultDirectories";
            break;
          case 46801:
            id v3 = @"PLPhotosErrorInvalidFileIdentifier";
            break;
          case 46802:
            id v3 = @"PLPhotosErrorMissingLibraryBundle";
            break;
          default:
            goto LABEL_529;
        }
      }
      else
      {
        switch(a1)
        {
          case 47001:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourceGeneric";
            break;
          case 47002:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesCallerCancelledError";
            break;
          case 47003:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesMissingIngredients";
            break;
          case 47004:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesNoSupportedVersions";
            break;
          case 47005:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesRecipeNotSupported";
            break;
          case 47006:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesMissingURLsOrUTI";
            break;
          case 47007:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesMediaConversion";
            break;
          case 47008:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesThumbnailGenerationFailed";
            break;
          case 47009:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesStoreFailed";
            break;
          case 47010:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesStoreFailedCantCreateExternalResource";
            break;
          case 47011:
            id v3 = @"PLPhotosErrorFailedToMoveResourceFile";
            break;
          case 47012:
            id v3 = @"PLPhotosErrorFailedToObtainWritePathForResourceFile";
            break;
          case 47013:
            id v3 = @"PLPhotosErrorResourceFileNotFound";
            break;
          case 47014:
            id v3 = @"PLPhotosErrorResourceCannotResolveInode";
            break;
          case 47015:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesMissingAdjustmentData";
            break;
          case 47016:
            id v3 = @"PLPhotosErrorInvalidAdjustmentData";
            break;
          case 47017:
            id v3 = @"PLPhotosErrorResourceNotFound";
            break;
          case 47018:
            id v3 = @"PLPhotosErrorNetworkAccessRequired";
            break;
          case 47019:
            id v3 = @"PLPhotosErrorResourceNotPurgeable";
            break;
          case 47020:
            id v3 = @"PLPhotosErrorInvalidMetadata";
            break;
          case 47021:
            id v3 = @"PLPhotosErrorFailedToGenerateLocalResourcesGenerateAdjustmentFileNotFound";
            break;
          default:
            goto LABEL_529;
        }
      }
    }
    else if (a1 <= 61000)
    {
      switch(a1)
      {
        case 51001:
          id v3 = @"PLPhotosErrorJournalEntryParse";
          break;
        case 51002:
          id v3 = @"PLPhotosErrorJournalEntryWrite";
          break;
        case 51003:
          id v3 = @"PLPhotosErrorJournalFileRead";
          break;
        case 51004:
          id v3 = @"PLPhotosErrorJournalFileWrite";
          break;
        case 51005:
          id v3 = @"PLPhotosErrorJournalFileAtEOF";
          break;
        case 51006:
          id v3 = @"PLPhotosErrorJournalDoesNotExist";
          break;
        case 51007:
          id v3 = @"PLPhotosErrorJournalPayloadTooNew";
          break;
        case 51008:
          id v3 = @"PLPhotosErrorJournalInvalidJournalManagerState";
          break;
        case 51009:
          id v3 = @"PLPhotosErrorJournalManagerNeedsSnapshot";
          break;
        case 51010:
          id v3 = @"PLPhotosErrorJournalManagerHistoryIterate";
          break;
        case 51011:
          id v3 = @"PLPhotosErrorJournalManagerHistoryIterateFromStart";
          break;
        case 51012:
          id v3 = @"PLPhotosErrorJournalSnapshotExists";
          break;
        default:
          JUMPOUT(0);
      }
    }
    else if (a1 > 73000)
    {
      if (a1 <= 82000)
      {
        if (a1 > 81001)
        {
          if (a1 == 81002)
          {
            id v3 = @"PLPhotosErrorLibraryAssetSuggestionStateInvalid";
          }
          else
          {
            if (a1 != 81003) {
              goto LABEL_529;
            }
            id v3 = @"PLPhotosErrorLibraryScopeDoesNotHaveACurrentUser";
          }
        }
        else if (a1 == 73001)
        {
          id v3 = @"PLPhotosErrorPersonMissingKeyFace";
        }
        else
        {
          if (a1 != 81001) {
            goto LABEL_529;
          }
          id v3 = @"PLPhotosErrorLibraryScopeIsOwned";
        }
      }
      else if (a1 <= 82002)
      {
        if (a1 == 82001)
        {
          id v3 = @"PLPhotosErrorFeatureAvailabilityServiceNotAvailable";
        }
        else
        {
          id v3 = @"PLPhotosErrorFeatureAvailabilityInternalError";
        }
      }
      else
      {
        switch(a1)
        {
          case 82003:
            id v3 = @"PLPhotosErrorFeatureAvailabilityRequestFailed";
            break;
          case 500000:
            id v3 = @"PLPhotosErrorReserved01";
            break;
          case 599999:
            id v3 = @"PLPhotosErrorReserved02";
            break;
          default:
            goto LABEL_529;
        }
      }
    }
    else if (a1 <= 71000)
    {
      switch(a1)
      {
        case 61001:
          id v3 = @"PLPhotosErrorThumbnailFailedDownscale";
          break;
        case 61002:
          id v3 = @"PLPhotosErrorThumbnailBadParameters";
          break;
        case 61003:
          id v3 = @"PLPhotosErrorThumbnailFailedEncode";
          break;
        case 61004:
          id v3 = @"PLPhotosErrorThumbnailGenericError";
          break;
        default:
          if (a1 == 70001)
          {
            id v3 = @"PLPhotosErrorTransferCopyObjectFailed";
          }
          else
          {
            if (a1 != 70002) {
              goto LABEL_529;
            }
            id v3 = @"PLPhotosErrorTransferFileURLMissing";
          }
          break;
      }
    }
    else
    {
      switch(a1)
      {
        case 72001:
          id v3 = @"PLPhotosErrorLibraryImportUnknown";
          break;
        case 72002:
          id v3 = @"PLPhotosErrorLibraryImportInvalid";
          break;
        case 72003:
          id v3 = @"PLPhotosErrorLibraryImportNeedsMigration";
          break;
        case 72004:
          id v3 = @"PLPhotosErrorLibraryImportNeedsForceRepair";
          break;
        case 72005:
          id v3 = @"PLPhotosErrorLibraryImportNeedsTimeMachineRestore";
          break;
        case 72006:
          id v3 = @"PLPhotosErrorLibraryImportNeedsDisableCPL";
          break;
        case 72007:
          id v3 = @"PLPhotosErrorLibraryImportNeedsDisabledCPLCleanupCompletion";
          break;
        case 72008:
          id v3 = @"PLPhotosErrorLibraryImportProcessingError";
          break;
        case 72009:
          id v3 = @"PLPhotosErrorLibraryImportIsLegacyLibrary";
          break;
        default:
          if (a1 != 71001) {
            goto LABEL_529;
          }
          id v3 = @"PLPhotosErrorManagedObjectConstraitsError";
          break;
      }
    }
  }
  else if (a1 > 46100)
  {
    if (a1 <= 46500)
    {
      if (a1 > 46300)
      {
        switch(a1)
        {
          case 46301:
            id v3 = @"PLPhotosErrorCoreData";
            break;
          case 46302:
            id v3 = @"PLPhotosErrorDirectoryCreation";
            break;
          case 46303:
            id v3 = @"PLPhotosErrorDirectoryMove";
            break;
          case 46304:
            id v3 = @"PLPhotosErrorFileClone";
            break;
          case 46305:
            id v3 = @"PLPhotosErrorFileCloneUnsupported";
            break;
          case 46306:
            id v3 = @"PLPhotosErrorFileMove";
            break;
          case 46307:
            id v3 = @"PLPhotosErrorModelCreation";
            break;
          case 46308:
            id v3 = @"PLPhotosErrorModelMigration";
            break;
          case 46309:
            id v3 = @"PLPhotosErrorUnsupported";
            break;
          case 46310:
            id v3 = @"PLPhotosErrorLibraryClone";
            break;
          case 46311:
            id v3 = @"PLPhotosErrorPLMUUpgradeCompleted";
            break;
          case 46312:
            id v3 = @"PLPhotosErrorMigrationCancelled";
            break;
          case 46313:
            id v3 = @"PLPhotosErrorUnsupportedLegacyLibrary";
            break;
          default:
            goto LABEL_529;
        }
      }
      else
      {
        switch(a1)
        {
          case 46101:
            id v3 = @"PLPhotosErrorDatabaseOpenError";
            break;
          case 46102:
            id v3 = @"PLPhotosErrorInvalidURL";
            break;
          case 46103:
            id v3 = @"PLPhotosErrorLibraryInTrash";
            break;
          case 46104:
            id v3 = @"PLPhotosErrorNoPermission";
            break;
          case 46105:
            id v3 = @"PLPhotosErrorReadOnlyFilesystem";
            break;
          case 46106:
            id v3 = @"PLPhotosErrorSandboxNoPermission";
            break;
          case 46107:
            id v3 = @"PLPhotosErrorUnsupportedFilesystem";
            break;
          case 46108:
            id v3 = @"PLPhotosErrorSectionData";
            break;
          case 46109:
            id v3 = @"PLPhotosErrorMismatchURL";
            break;
          case 46110:
            id v3 = @"PLPhotosErrorExistingIdentifier";
            break;
          case 46111:
            id v3 = @"PLPhotosErrorIdentifierNotFound";
            break;
          default:
            if (a1 == 46201)
            {
              id v3 = @"PLPhotosErrorUnsupportedIdentifier";
            }
            else
            {
              if (a1 != 46202) {
                goto LABEL_529;
              }
              id v3 = @"PLPhotosErrorIdentifierReservationLimitExceeded";
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 46501:
          id v3 = @"PLPhotosErrorFailedToOpenLibrary";
          break;
        case 46502:
          id v3 = @"PLPhotosErrorInvalidState";
          break;
        case 46503:
          id v3 = @"PLPhotosErrorMigrationPhase";
          break;
        case 46504:
          id v3 = @"PLPhotosErrorNewerSchema";
          break;
        case 46505:
          id v3 = @"PLPhotosErrorNoConnectionInterrupted";
          break;
        case 46506:
          id v3 = @"PLPhotosErrorNoConnectionInvalidated";
          break;
        case 46507:
          id v3 = @"PLPhotosErrorNoDelegate";
          break;
        case 46508:
          id v3 = @"PLPhotosErrorNoURLBookmark";
          break;
        case 46509:
          id v3 = @"PLPhotosErrorObtainPIDLockFail";
          break;
        case 46510:
          id v3 = @"PLPhotosErrorPreMigrationPhase";
          break;
        case 46511:
          id v3 = @"PLPhotosErrorResumeFailed";
          break;
        case 46512:
          id v3 = @"PLPhotosErrorTimeout";
          break;
        case 46513:
          id v3 = @"PLPhotosErrorValidationIssue";
          break;
        case 46514:
          id v3 = @"PLPhotosErrorException";
          break;
        case 46515:
          id v3 = @"PLPhotosErrorDeletionCheck";
          break;
        case 46516:
          id v3 = @"PLPhotosErrorInsufficientDiskSpace";
          break;
        case 46517:
          id v3 = @"PLPhotosErrorLegacyUpgradeFailed";
          break;
        case 46518:
          id v3 = @"PLPhotosErrorMissingDatabaseFiles";
          break;
        case 46519:
          id v3 = @"PLPhotosErrorMigrationInProgress";
          break;
        case 46520:
          id v3 = @"PLPhotosErrorMigrationRebuild";
          break;
        case 46521:
          id v3 = @"PLPhotosErrorMigrationAquireFSReservation";
          break;
        case 46522:
          id v3 = @"PLPhotosErrorMigrationAquirePIDLock";
          break;
        case 46523:
          id v3 = @"PLPhotosErrorMigrationPLMUInternal";
          break;
        case 46524:
          id v3 = @"PLPhotosErrorMigrationLithiumInternal";
          break;
        case 46525:
          id v3 = @"PLPhotosErrorMigrationUnknownLibraryType";
          break;
        case 46526:
          id v3 = @"PLPhotosErrorMigrationDatabaseCorrupt";
          break;
        case 46527:
          id v3 = @"PLPhotosErrorMigrationMissingRebuildData";
          break;
        default:
          goto LABEL_529;
      }
    }
  }
  else
  {
    if (a1 <= 43000)
    {
      id v3 = @"PLAssetsdServiceErrorUnknown";
      switch(a1)
      {
        case 41001:
          goto LABEL_530;
        case 41002:
          id v3 = @"PLAssetsdServiceErrorXPC";
          return v3;
        case 41003:
          id v3 = @"PLAssetsdServiceErrorInternal";
          return v3;
        case 41004:
          id v3 = @"PLAssetsdServiceErrorNotFound";
          return v3;
        case 41005:
          id v3 = @"PLAssetsdServiceErrorForbidden";
          return v3;
        case 41006:
          id v3 = @"PLAssetsdServiceErrorReadFailure";
          return v3;
        case 41007:
          id v3 = @"PLAssetsdServiceErrorWriteFailure";
          return v3;
        case 41008:
          id v3 = @"PLAssetsdServiceErrorInvalidParameter";
          return v3;
        case 41009:
          id v3 = @"PLAssetsdServiceErrorMissingEntitlement";
          return v3;
        case 41010:
          id v3 = @"PLAssetsdServiceErrorAuthorizationFailed";
          return v3;
        case 41011:
          id v3 = @"PLAssetsdServiceErrorTCCAuthorizationDenied";
          return v3;
        case 41012:
          id v3 = @"PLAssetsdServiceErrorRequiresOpenLibrary";
          return v3;
        case 41013:
          id v3 = @"PLAssetsdServiceErrorRequiresLibraryUpgrade";
          return v3;
        case 41014:
          id v3 = @"PLAssetsdServiceErrorBookmarkResolutionFailed";
          return v3;
        case 41015:
          id v3 = @"PLAssetsdServiceErrorLibraryDirectoryNotFound";
          return v3;
        case 41016:
          goto LABEL_529;
        case 41017:
          id v3 = @"PLAssetsdServiceErrorNoSSBAvailble";
          return v3;
        case 41018:
          id v3 = @"PLAssetsdServiceErrorRelinquishingLibraryBundleToWriter";
          return v3;
        case 41019:
          id v3 = @"PLAssetsdServiceErrorSwitchingSystemPhotoLibrary";
          return v3;
        case 41020:
          id v3 = @"PLAssetsdServiceErrorRebuildRequested";
          return v3;
        case 41021:
          id v3 = @"PLAssetsdServiceErrorShutdownRequested";
          return v3;
        case 41022:
          id v3 = @"PLAssetsdServiceErrorNoCloudPhotoLibraryManager";
          return v3;
        case 41023:
          id v3 = @"PLAssetsdServiceErrorClientNormalClose";
          return v3;
        case 41024:
          id v3 = @"PLAssetsdServiceErrorClientDealloc";
          return v3;
        case 41025:
          id v3 = @"PLAssetsdServiceErrorClientRequestedCloseAndDeleteLibrary";
          return v3;
        case 41026:
          id v3 = @"PLAssetsdServiceErrorLibraryFilesystemDeleteFailed";
          return v3;
        case 41027:
          id v3 = @"PLAssetsdServiceErrorSandboxExtensionConsumeFailed";
          return v3;
        case 41028:
          id v3 = @"PLAssetsdServiceErrorSandboxExtensionCreateFailed";
          return v3;
        case 41029:
          id v3 = @"PLAssetsdServiceErrorClientRequestedCloseLibrary";
          return v3;
        case 41030:
          id v3 = @"PLAssetsdServiceErrorDataVaultRequiresClientSandboxOrEntitlement";
          return v3;
        case 41031:
          id v3 = @"PLAssetsdServiceErrorOperationCancelled";
          return v3;
        case 41032:
          id v3 = @"PLAssetsdServiceErrorUnsupportedDeviceLibraryConfigurationChange";
          return v3;
        case 41033:
          id v3 = @"PLAssetsdServiceErrorRegisteringAppLibrary";
          return v3;
        default:
          if (a1 == 42001)
          {
            id v3 = @"PLAssetsdServiceErrorImageWriterNoData";
          }
          else
          {
            if (a1 != 42002) {
              goto LABEL_529;
            }
            id v3 = @"PLAssetsdServiceErrorImageWriterJobQueueFull";
          }
          break;
      }
      return v3;
    }
    if (a1 > 45700)
    {
      switch(a1)
      {
        case 45998:
          id v3 = @"PLPhotosErrorFeatureDisabledServerSide";
          return v3;
        case 45999:
          id v3 = @"PLPhotosErrorPlatformDisabled";
          return v3;
        case 46000:
          goto LABEL_529;
        case 46001:
          id v3 = @"PLPhotosErrorLibraryUnsupported";
          return v3;
        case 46002:
          id v3 = @"PLPhotosErrorUnknownLibraryState";
          return v3;
        case 46003:
          id v3 = @"PLPhotosErrorPostMigration";
          return v3;
        case 46004:
          id v3 = @"PLPhotosErrorLibraryBookmarkResolutionFailed";
          return v3;
        case 46005:
          id v3 = @"PLPhotosErrorNoPersistentStores";
          return v3;
        case 46006:
          id v3 = @"PLPhotosErrorLibraryTooNew";
          return v3;
        case 46007:
          id v3 = @"PLPhotosErrorLibraryRequiresMigration";
          return v3;
        case 46008:
          id v3 = @"PLPhotosErrorLightweightMigrationFailed";
          return v3;
        case 46009:
          id v3 = @"PLPhotosErrorLibraryCannotOpen";
          return v3;
        case 46010:
          id v3 = @"PLPhotosErrorExclusiveLockFailed";
          return v3;
        case 46011:
          id v3 = @"PLPhotosErrorLibraryTooOld";
          return v3;
        case 46012:
          id v3 = @"PLPhotosErrorLibraryVolumeUnmountRequested";
          return v3;
        case 46013:
          id v3 = @"PLPhotosErrorStagedMigrationFailed";
          return v3;
        case 46014:
          id v3 = @"PLPhotosErrorBackgroundMigrationFailed";
          return v3;
        case 46015:
          id v3 = @"PLPhotosErrorLibraryInTimeMachineBackupLocation";
          return v3;
        case 46016:
          id v3 = @"PLPhotosErrorUserPreventedRebuild";
          return v3;
        case 46017:
          id v3 = @"PLPhotosErrorLibraryInFileProviderSyncRoot";
          return v3;
        case 46018:
          id v3 = @"PLPhotosErrorLibraryCreationFailed";
          return v3;
        case 46019:
          id v3 = @"PLPhotosErrorUnsafeLibraryShutdownRequested";
          return v3;
        case 46020:
          id v3 = @"PLPhotosErrorLibraryClientsUninstalled";
          return v3;
        default:
          if (a1 == 45701)
          {
            id v3 = @"PLPhotosErrorMissingData";
          }
          else
          {
            if (a1 != 45702) {
              goto LABEL_529;
            }
            id v3 = @"PLPhotosErrorChangeNotSupported";
          }
          break;
      }
      return v3;
    }
    if (a1 <= 44000)
    {
      switch(a1)
      {
        case 43001:
          id v3 = @"PLLibraryServiceStateUnknownError";
          break;
        case 43002:
          id v3 = @"PLLibraryServiceStateInvalidError";
          break;
        case 43003:
          id v3 = @"PLLibraryServiceStateTerminatingError";
          break;
        default:
          goto LABEL_529;
      }
    }
    else
    {
      if (a1 <= 45000)
      {
        switch(a1)
        {
          case 44001:
            id v3 = @"PLAssetsdClientErrorUnknown";
            break;
          case 44002:
            id v3 = @"PLAssetsdClientErrorInvalidParameter";
            break;
          case 44003:
            id v3 = @"PLAssetsdClientErrorSandboxExtensionConsumeFailed";
            break;
          case 44004:
            id v3 = @"PLAssetsdClientErrorSandboxExtensionCreateFailed";
            break;
          default:
            goto LABEL_529;
        }
        return v3;
      }
      switch(a1)
      {
        case 45001:
          id v3 = @"PLPhotosDatabaseLoadFailed";
          break;
        case 45002:
          id v3 = @"PLPhotosErrorLibraryAccessUserDenied";
          break;
        case 45700:
          id v3 = @"PLPhotosErrorNilParameter";
          return v3;
        default:
LABEL_529:
          objc_msgSend(NSString, "stringWithFormat:", @"Unknown PL error code %td", a1);
          id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_530:
          return v3;
      }
    }
  }
  return v3;
}

BOOL PLIsLowDiskSpaceError(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F28328]];

  if ([v2 length])
  {
    memset(&v13, 0, sizeof(v13));
    id v3 = v2;
    if (!statvfs((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0), &v13))
    {
      unint64_t v11 = v13.f_frsize * v13.f_bavail;
      BOOL v10 = v11 < +[PLFileSystemCapabilities minimumAvailableBytesRequiredForLibraryOpen];
      goto LABEL_8;
    }
    uint64_t v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v3 lastPathComponent];
      uint64_t v6 = [v5 UTF8String];
      int v7 = *__error();
      uint64_t v8 = __error();
      id v9 = strerror(*v8);
      *(_DWORD *)long long buf = 136315650;
      uint64_t v15 = v6;
      __int16 v16 = 1024;
      int v17 = v7;
      __int16 v18 = 2080;
      BOOL v19 = v9;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "failed to stat the filesytem for library: %s. Error (%d) %s", buf, 0x1Cu);
    }
  }
  BOOL v10 = 0;
LABEL_8:

  return v10;
}

uint64_t PLPhotosErrorCodeFromUnderlyingError(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = a2;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __PLPhotosErrorCodeFromUnderlyingError_block_invoke;
  void v20[3] = &unk_1E58A1548;
  v20[4] = &v21;
  v20[5] = &v25;
  uint64_t v4 = (void (**)(void, void))MEMORY[0x19F38F770](v20);
  id v5 = [v3 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (v6)
  {
    uint64_t v7 = [v3 code];
    uint64_t v8 = 46104;
    if (v7 == 257 || v7 == 513) {
      goto LABEL_11;
    }
    if (v7 != 640) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v9 = [v3 domain];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F28798]];

  if (v10)
  {
    uint64_t v11 = [v3 code];
    uint64_t v8 = 46104;
    if (v11 == 1 || v11 == 13) {
      goto LABEL_11;
    }
    if (v11 != 28) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  int v17 = [v3 domain];
  int v18 = [v17 isEqualToString:@"NSSQLiteErrorDomain"];

  if (!v18) {
    goto LABEL_12;
  }
  uint64_t v19 = [v3 code];
  if (v19 == 3)
  {
    uint64_t v8 = 46104;
    goto LABEL_11;
  }
  if (v19 == 11)
  {
    uint64_t v8 = 46526;
    goto LABEL_11;
  }
  if (v19 == 13 && PLIsLowDiskSpaceError(v3))
  {
LABEL_10:
    uint64_t v8 = 46516;
LABEL_11:
    v4[2](v4, v8);
  }
LABEL_12:
  if (!*((unsigned char *)v26 + 24))
  {
    uint64_t v12 = [v3 userInfo];
    statvfs v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v13)
    {
      uint64_t v14 = PLPhotosErrorCodeFromUnderlyingError(v13, a2);
      v22[3] = v14;
    }
  }
  uint64_t v15 = v22[3];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v15;
}

void sub_19BDA634C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __PLPhotosErrorCodeFromUnderlyingError_block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t PLUnderlyingErrorHasOSDomain(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    goto LABEL_4;
  }
  id v3 = [v1 domain];
  if ([v3 isEqualToString:*MEMORY[0x1E4F28798]])
  {

LABEL_4:
    uint64_t HasOSDomain = 1;
    goto LABEL_5;
  }
  int v6 = [v1 domain];
  char v7 = [v6 isEqualToString:@"NSSQLiteErrorDomain"];

  if (v7)
  {
    uint64_t HasOSDomain = 1;
    goto LABEL_6;
  }
  uint64_t v8 = [v1 userInfo];
  uint64_t v2 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v2) {
    uint64_t HasOSDomain = PLUnderlyingErrorHasOSDomain(v2);
  }
  else {
    uint64_t HasOSDomain = 0;
  }
LABEL_5:

LABEL_6:
  return HasOSDomain;
}

uint64_t PLUnderlyingErrorCodeForDomain(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [v4 domain];
  char v6 = [v5 isEqualToString:v3];

  if (v6)
  {
    uint64_t v7 = [v4 code];
  }
  else
  {
    uint64_t v8 = [v4 userInfo];

    id v4 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (!v4)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = PLUnderlyingErrorCodeForDomain(v4, v3);
  }
  uint64_t v9 = v7;
LABEL_7:

  return v9;
}

uint64_t PLIsErrorFileNotFound(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)*MEMORY[0x1E4F281F8];
  if ((PLIsErrorEqualToCode(v1, (void *)*MEMORY[0x1E4F281F8], 260) & 1) != 0
    || (PLIsErrorEqualToCode(v1, v2, 4) & 1) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = PLIsErrorEqualToCode(v1, (void *)*MEMORY[0x1E4F28798], 2);
  }

  return v3;
}

uint64_t PLIsErrorXPCConnectionInvalid(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)*MEMORY[0x1E4F281F8];
  if (PLIsErrorEqualToCode(v1, (void *)*MEMORY[0x1E4F281F8], 4099))
  {
    uint64_t v3 = 1;
  }
  else if (PLIsErrorEqualToCode(v1, @"com.apple.photos.error", 41002))
  {
    id v4 = [v1 userInfo];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    uint64_t v3 = PLIsErrorEqualToCode(v5, v2, 4099);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t PLIsErrorEqualToSQLiteCode(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ((PLIsErrorEqualToCode(v3, @"NSSQLiteErrorDomain", a2) & 1) != 0
    || ([v3 userInfo],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 objectForKeyedSubscript:@"NSSQLiteErrorDomain"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 integerValue],
        v5,
        v4,
        v6 == a2))
  {
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [v3 userInfo];
    uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v9) {
      uint64_t v7 = PLIsErrorEqualToSQLiteCode(v9, a2);
    }
    else {
      uint64_t v7 = 0;
    }
  }
  return v7;
}

uint64_t PLIsErrorSQLiteDiskFull(void *a1)
{
  return PLIsErrorEqualToSQLiteCode(a1, 13);
}

uint64_t PLErrorCreate(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(v5);
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28228]];

  [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.photos.error" code:a1 userInfo:v8];

  return v9;
}

id PLUnderlyingErrorWithDomain(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  id v6 = v5;
  if (v5)
  {
    unint64_t v7 = 0;
    uint64_t v8 = *MEMORY[0x1E4F28A50];
    uint64_t v9 = v5;
    while (1)
    {
      uint64_t v10 = [v9 domain];
      int v11 = [v10 isEqualToString:v4];

      if (v11) {
        break;
      }
      uint64_t v12 = [v9 userInfo];
      statvfs v13 = [v12 objectForKeyedSubscript:v8];

      id v14 = 0;
      if (v13)
      {
        uint64_t v9 = v13;
        if (v7++ < 9) {
          continue;
        }
      }
      goto LABEL_10;
    }
    id v14 = v9;
    statvfs v13 = v14;
  }
  else
  {
    id v14 = 0;
    statvfs v13 = 0;
  }
LABEL_10:

  return v14;
}

BOOL PLErrorOrUnderlyingErrorHasDomainAndCode(void *a1, void *a2, uint64_t a3)
{
  id v3 = PLUnderlyingErrorThatHasDomainAndCode(a1, a2, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

id PLTopLevelErrorAndAllUnderlyingErrors(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  [v3 addObject:v2];
  PLRecursiveAddUnderlyingErrorsToOrderedSet(v2, v3);

  BOOL v4 = [v3 array];

  return v4;
}

void PLRecursiveAddUnderlyingErrorsToOrderedSet(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [a1 underlyingErrors];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        if (([v3 containsObject:v9] & 1) == 0)
        {
          [v3 addObject:v9];
          PLRecursiveAddUnderlyingErrorsToOrderedSet(v9, v3);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

id PLErrorCodeStringOfTopLevelErrorAndAllUnderlyingErrors(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = PLTopLevelErrorAndAllUnderlyingErrors(v1);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    char v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ((v7 & 1) == 0) {
          [v2 appendFormat:@"_"];
        }
        objc_msgSend(v2, "appendFormat:", @"%ld", objc_msgSend(v9, "code"));
        char v7 = 0;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      char v7 = 0;
    }
    while (v5);
  }

  return v2;
}

uint64_t PLIsErrorOrUnderlyingErrorFileExists(void *a1)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *MEMORY[0x1E4F28798];
  v7[0] = *MEMORY[0x1E4F281F8];
  v7[1] = v1;
  v8[0] = &unk_1EEC15010;
  v8[1] = &unk_1EEC15028;
  id v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:v7 count:2];
  uint64_t v5 = PFErrorOrUnderlyingErrorMatchesCodesByDomain();

  return v5;
}

uint64_t PLIsErrorOrUnderlyingErrorFileNotFound()
{
  return MEMORY[0x1F41406F0]();
}

id PLSanitizedErrorForXPC(void *a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    id v42 = v1;
    id v2 = v1;
    id v3 = [v2 userInfo];
    uint64_t v4 = *MEMORY[0x1E4F28A50];
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    long long v41 = (void *)v5;
    if (v5)
    {
      uint64_t v6 = PLSanitizedErrorForXPC(v5);
      if ((void *)v5 != v6)
      {
        char v7 = [v2 userInfo];
        uint64_t v8 = (void *)[v7 mutableCopy];

        [v8 setObject:v6 forKeyedSubscript:v4];
        uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
        long long v10 = [v2 domain];
        uint64_t v11 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v2, "code"), v8);

        id v2 = (id)v11;
      }
    }
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v13 = [v2 userInfo];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v13);
          }
          int v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if (([v18 isEqualToString:v4] & 1) == 0)
          {
            uint64_t v19 = [v2 userInfo];
            uint64_t v20 = [v19 objectForKeyedSubscript:v18];

            if (!_PLErrorUserInfoObjectIsSafeForXPC(v20)
              || [v20 conformsToProtocol:&unk_1EEC335A0]
              && (_PLErrorUserInfoContainerIsSafeForXPC(v20) & 1) == 0)
            {
              [v12 addObject:v18];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v15);
    }

    if ([v12 count])
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v22 = [v2 domain];
      uint64_t v23 = [v22 isEqualToString:*MEMORY[0x1E4F281F8]];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v24 = [v2 userInfo];
      uint64_t v44 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v44)
      {
        uint64_t v25 = *(void *)v46;
        uint64_t v43 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v46 != v25) {
              objc_enumerationMutation(v24);
            }
            uint64_t v27 = *(void *)(*((void *)&v45 + 1) + 8 * j);
            if ([v12 containsObject:v27])
            {
              if (v23)
              {
                char v28 = [NSString stringWithFormat:@"%@_<stripped>", v27];
                [v21 setObject:@"<stripped>" forKeyedSubscript:v28];
              }
              else
              {
                char v28 = [v2 userInfo];
                [v28 objectForKeyedSubscript:v27];
                id v30 = v24;
                id v31 = v12;
                id v32 = v2;
                v34 = uint64_t v33 = v23;
                uint64_t v35 = [v34 description];
                uint64_t v36 = [NSString stringWithFormat:@"%@_description", v27];
                [v21 setObject:v35 forKeyedSubscript:v36];

                uint64_t v23 = v33;
                id v2 = v32;
                id v12 = v31;
                uint64_t v24 = v30;
                uint64_t v25 = v43;
              }
            }
            else
            {
              char v28 = [v2 userInfo];
              uint64_t v29 = [v28 objectForKeyedSubscript:v27];
              [v21 setObject:v29 forKeyedSubscript:v27];
            }
          }
          uint64_t v44 = [v24 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v44);
      }

      long long v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = [v2 domain];
      uint64_t v39 = objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, objc_msgSend(v2, "code"), v21);

      id v2 = (id)v39;
    }

    id v1 = v42;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t _PLErrorUserInfoObjectIsSafeForXPC(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_5;
  }
  if (![v1 conformsToProtocol:&unk_1EEC16E20]) {
    goto LABEL_4;
  }
  id v3 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v4 = v2;
  uint64_t v5 = (void *)[[v3 alloc] initWithArray:&unk_1EEC15040];
  uint64_t v6 = (objc_class *)objc_opt_class();

  char v7 = NSStringFromClass(v6);
  LODWORD(v6) = [v5 containsObject:v7];

  if (v6) {
LABEL_4:
  }
    uint64_t v8 = 0;
  else {
LABEL_5:
  }
    uint64_t v8 = 1;

  return v8;
}

uint64_t _PLErrorUserInfoContainerIsSafeForXPC(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  isKindOfClass Class = objc_opt_isKindOfClass();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!___PLErrorUserInfoContainerIsSafeForXPC_block_invoke(v8)
          || !_PLErrorUserInfoObjectIsSafeForXPC(v8))
        {
          goto LABEL_16;
        }
        if (isKindOfClass)
        {
          uint64_t v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v13);
          if ((___PLErrorUserInfoContainerIsSafeForXPC_block_invoke(v9) & 1) == 0)
          {

LABEL_16:
            uint64_t v11 = 0;
            goto LABEL_17;
          }
          int IsSafeForXPC = _PLErrorUserInfoObjectIsSafeForXPC(v9);

          if (!IsSafeForXPC) {
            goto LABEL_16;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v11 = 1;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }
LABEL_17:

  return v11;
}

double DCIMScaledSizeForFormatCore(uint64_t a1, double a2, double a3)
{
  +[PLAssetFormatsCore sizeForFormat:a1];
  return PLScaledSizeWithinSizeCore(a2, a3, v5, v6);
}

double PLScaledSizeWithinSizeCore(double a1, double a2, double a3, double a4)
{
  if (a2 == 0.0) {
    return *MEMORY[0x1E4F1DB30];
  }
  if (a3 >= a4) {
    double v5 = a3;
  }
  else {
    double v5 = a4;
  }
  float v6 = a1 / a2;
  double result = (double)(int)v5;
  double v8 = v6;
  if (a1 <= a2) {
    return rint(v8 * result);
  }
  return result;
}

double PLScaleDimensionsForThumbnailCore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a5 < 1 || a6 <= 0) {
    return *MEMORY[0x1E4F1DB30];
  }
  if (a5 >= a6) {
    uint64_t v6 = a6;
  }
  else {
    uint64_t v6 = a5;
  }
  if (a5 <= a6) {
    uint64_t v7 = a6;
  }
  else {
    uint64_t v7 = a5;
  }
  if (v7 <= a1)
  {
    uint64_t v8 = v6;
  }
  else
  {
    uint64_t v8 = v6 * a1 / v7;
    if (v8 < a2)
    {
      uint64_t v8 = v6;
      a1 = v7;
      if (v6 > a2)
      {
        uint64_t v9 = v7 * a2;
        uint64_t v10 = v6 * a3 / v7;
        if (v10 <= 1) {
          uint64_t v10 = 1;
        }
        uint64_t v11 = v9 / v6;
        if (v11 > a3) {
          uint64_t v8 = v10;
        }
        else {
          uint64_t v8 = a2;
        }
        if (v11 > a3) {
          a1 = a3;
        }
        else {
          a1 = v11;
        }
      }
    }
    if (a4 >= 2 && v8 > a2) {
      uint64_t v8 = v8 / a4 * a4;
    }
    if (a4 < 2 || a1 <= a2)
    {
      uint64_t v7 = a1;
    }
    else
    {
      uint64_t v12 = a4 - 1;
      if (v8 != a2) {
        uint64_t v12 = 0;
      }
      uint64_t v7 = (a1 + v12) / a4 * a4;
    }
  }
  if (a5 >= (unint64_t)a6) {
    return (double)v7;
  }
  else {
    return (double)v8;
  }
}

id stringWithoutTrailingSlashes(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] >= 2)
  {
    while ([v1 hasSuffix:@"/"])
    {
      id v2 = objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - 1);

      id v1 = v2;
      if ((unint64_t)[v2 length] <= 1) {
        goto LABEL_6;
      }
    }
  }
  id v2 = v1;
LABEL_6:
  return v2;
}

__CFString *PLStringFromPLPhotoLibrarySubPathType(unsigned int a1)
{
  if (a1 < 0x11)
  {
    if (a1 <= 0xA) {
      return off_1E58A1620[a1];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid type %d: %s", a1, "NSString *PLStringFromPLPhotoLibrarySubPathType(PLPhotoLibrarySubPathType)");
  }
  return @"PLPhotoLibrarySubPathTypeLast";
}

__CFString *PLStringFromPLPhotoLibrarySubPathLeafType(unsigned int a1)
{
  if (a1 < 4) {
    return off_1E58A1678[a1];
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid type %d: %s", a1, "NSString *PLStringFromPLPhotoLibrarySubPathLeafType(PLPhotoLibrarySubPathLeafType)");
  return @"PLPhotoLibrarySubPathLeafTypeLast";
}

__CFString *PLStringFromPLPhotoLibraryCacheSubPathType(unsigned int a1)
{
  if (a1 < 0x11) {
    return off_1E58A1698[a1];
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid type %d: %s", a1, "NSString *PLStringFromPLPhotoLibraryCacheSubPathType(PLPhotoLibraryCacheSubPathType)");
  return @"PLPhotoLibraryCacheSubPathTypeLast";
}

__CFString *PLStringFromPLPhotoLibraryExternalPathType(unsigned int a1)
{
  if (a1 < 4) {
    return off_1E58A1720[a1];
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid type %d: %s", a1, "NSString *PLStringFromPLPhotoLibraryExternalPathType(PLPhotoLibraryExternalPathType)");
  return @"PLPhotoLibraryExternalPathTypeLast";
}

__CFString *PLStringFromPLPhotoLibraryInternalPathType(unsigned int a1)
{
  if (a1 < 6) {
    return off_1E58A1740[a1];
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid type %d: %s", a1, "NSString *PLStringFromPLPhotoLibraryInternalPathType(PLPhotoLibraryInternalPathType)");
  return @"PLPhotoLibraryInternalPathTypeLast";
}

void sub_19BDAAC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10973(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10974(uint64_t a1)
{
}

void sub_19BDAB250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_19BDAB808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BDAC11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,void *a44,uint64_t a45,uint64_t a46,uint64_t a47,SEL sel,uint8_t buf)
{
  _Unwind_Resume(a1);
}

void sub_19BDAC690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

BOOL PLPositionalTableIsValidIndexForReading(unint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 20)) {
    return a1 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return *(void *)(a2 + 40) > a1;
  }
}

BOOL PLPositionalTableIndexIsInRangeOfTable(unint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 40) > a1;
}

uint64_t PLDebugAssert(uint64_t a1, unsigned char *a2, const char *a3, const char *a4, const char *a5, uint64_t a6, int a7)
{
  uint64_t v12 = (FILE **)MEMORY[0x1E4F143C8];
  if (a2 && *a2) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "Assertion failed: %s: %s");
  }
  else {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "Check failed: %s:");
  }
  if (a3) {
    fprintf(*v12, " %s", a3);
  }
  if (a4) {
    fprintf(*v12, " %s", a4);
  }
  if (a5)
  {
    fprintf(*v12, " file: %s", a5);
    if (a6 >= 1) {
      fprintf(*v12, ":%ld", a6);
    }
  }
  if (a7) {
    fprintf(*v12, " error: %d", a7);
  }
  long long v13 = *v12;
  return fputc(10, v13);
}

void sub_19BDAE024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19BDAE4A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char *PLPhotoBakedFormatInfoForFormat(int a1)
{
  if (a1 == 1095) {
    return (char *)&_borderedFormatInfos;
  }
  id v2 = &_borderedFormatInfos;
  uint64_t v3 = 39;
  while (--v3)
  {
    uint64_t v1 = (char *)(v2 + 44);
    int v4 = v2[44];
    v2 += 44;
    if (v4 == a1) {
      return v1;
    }
  }
  return 0;
}

BOOL PLPhotoBakedFormatIsDynamicallySized(int a1)
{
  if (a1 == 1095)
  {
    uint64_t v1 = (char *)&_borderedFormatInfos;
    return CGRectIsEmpty(*(CGRect *)(v1 + 24));
  }
  else
  {
    id v2 = &_borderedFormatInfos;
    uint64_t v3 = 39;
    while (--v3)
    {
      uint64_t v1 = (char *)(v2 + 44);
      int v4 = v2[44];
      v2 += 44;
      if (v4 == a1) {
        return CGRectIsEmpty(*(CGRect *)(v1 + 24));
      }
    }
    return 0;
  }
}

void sub_19BDAECA0(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v2 - 192)) {
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 168));
  }
  if (*(void *)(v2 - 176))
  {
    int v4 = PLRequestGetLog();
    double v5 = v4;
    os_signpost_id_t v6 = *(void *)(v2 - 176);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 152));
      *(_DWORD *)(v2 - 144) = 136446210;
      *(void *)(v1 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 144), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDAF644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BDAFC18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BDB0284(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v1 - 176)) {
    os_activity_scope_leave((os_activity_scope_state_t)(v1 - 152));
  }
  if (*(void *)(v1 - 160))
  {
    uint64_t v3 = PLRequestGetLog();
    int v4 = v3;
    os_signpost_id_t v5 = *(void *)(v1 - 160);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      Name = sel_getName(*(SEL *)(v1 - 136));
      *(_DWORD *)(v1 - 12_Block_object_dispose(&a9, 8) = 136446210;
      *(void *)(v1 - 124) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v4, OS_SIGNPOST_INTERVAL_END, v5, "PLXPC Sync", "%{public}s", (uint8_t *)(v1 - 128), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDB0908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BDB0EE8(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v2 - 144)) {
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 120));
  }
  if (*(void *)(v2 - 128))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = v4;
    os_signpost_id_t v6 = *(void *)(v2 - 128);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 104));
      *(_DWORD *)(v2 - 96) = 136446210;
      *(void *)(v1 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 96), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void _freeCGImageDataProviderBuffer(void ***a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      PLPositionalTableMemoryPool_Free(v2);
    }
    uint64_t v3 = a1[1];
    a1[1] = 0;

    free(a1);
  }
}

CGColorSpaceRef ___create5551BGRACGImageFromTableEntryNode_block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateDeviceRGB();
  _create5551BGRACGImageFromTableEntryNode_s_colorSpace = (uint64_t)result;
  return result;
}

void PLPositionalTableMemoryPool_Destroy(OSQueueHead *__list)
{
  if (__list)
  {
    while (1)
    {
      uint64_t v2 = OSAtomicDequeue(__list, 0x18uLL);
      if (!v2) {
        break;
      }
      if (!v2[16])
      {
        uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
        int v4 = [NSString stringWithUTF8String:"void PLPositionalTableMemoryPool_Destroy(PLPositionalTableMemoryPool *)"];
        [v3 handleFailureInFunction:v4 file:@"PLPositionalTableAllocator.m" lineNumber:100 description:@"Expect only pool nodes to be dequeued."];
      }
    }
    if (__list[3].opaque1)
    {
      MEMORY[0x19F38FE70](*MEMORY[0x1E4F14960], __list[2].opaque2);
      __list[2].opaque2 = 0;
      __list[3].opaque1 = 0;
    }
    free(__list[2].opaque1);
    free(__list);
  }
}

void sub_19BDB1EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11538(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11539(uint64_t a1)
{
}

void sub_19BDB3294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11704(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11705(uint64_t a1)
{
}

void sub_19BDB37CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_19BDB3C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,SEL sel)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11756(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11757(uint64_t a1)
{
}

void sub_19BDB42A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,void *a28,os_signpost_id_t a29,os_activity_scope_state_s a30,SEL sel)
{
  if (a27) {
    os_activity_scope_leave(&a30);
  }
  if (a29)
  {
    uint64_t v34 = PLRequestGetLog();
    uint64_t v35 = v34;
    if (a29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v32 - 144) = 136446210;
      *(void *)(v31 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v35, OS_SIGNPOST_INTERVAL_END, a29, "PLXPC Sync", "%{public}s", (uint8_t *)(v32 - 144), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11803(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11804(uint64_t a1)
{
}

void sub_19BDB4758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, void *a18, os_signpost_id_t a19, os_activity_scope_state_s a20,SEL sel)
{
  if (a17) {
    os_activity_scope_leave(&a20);
  }
  if (a19)
  {
    uint64_t v23 = PLRequestGetLog();
    uint64_t v24 = v23;
    if (a19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v21 - 96) = 136446210;
      *(void *)(v21 - 92) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v24, OS_SIGNPOST_INTERVAL_END, a19, "PLXPC Sync", "%{public}s", (uint8_t *)(v21 - 96), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11858(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11859(uint64_t a1)
{
}

void sub_19BDB4E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel,uint64_t a26,uint64_t a27,int buf)
{
  if (a21) {
    os_activity_scope_leave(&a24);
  }
  if (a23)
  {
    id v30 = PLRequestGetLog();
    uint64_t v31 = v30;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      Name = sel_getName(sel);
      long long buf = 136446210;
      *(void *)(v28 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v31, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDB5408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *a22,os_signpost_id_t a23,os_activity_scope_state_s a24,SEL sel)
{
  if (a21) {
    os_activity_scope_leave(&a24);
  }
  if (a23)
  {
    uint64_t v28 = PLRequestGetLog();
    uint64_t v29 = v28;
    if (a23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v26 - 112) = 136446210;
      *(void *)(v25 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v29, OS_SIGNPOST_INTERVAL_END, a23, "PLXPC Sync", "%{public}s", (uint8_t *)(v26 - 112), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDB59A8(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v2 - 160)) {
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 136));
  }
  if (*(void *)(v2 - 144))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = v4;
    os_signpost_id_t v6 = *(void *)(v2 - 144);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 120));
      *(_DWORD *)(v2 - 112) = 136446210;
      *(void *)(v1 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 112), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDB6270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,void *a26,os_signpost_id_t a27,os_activity_scope_state_s a28,SEL sel,long long buf)
{
  if (a25) {
    os_activity_scope_leave(&a28);
  }
  if (a27)
  {
    uint64_t v31 = PLRequestGetLog();
    uint64_t v32 = v31;
    if (a27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      Name = sel_getName(sel);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v32, OS_SIGNPOST_INTERVAL_END, a27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDB678C(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v2 - 144)) {
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 120));
  }
  if (*(void *)(v2 - 128))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = v4;
    os_signpost_id_t v6 = *(void *)(v2 - 128);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 104));
      *(_DWORD *)(v2 - 96) = 136446210;
      *(void *)(v1 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 96), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

id dataWithMappedContentsOfFileDescriptor(int a1)
{
  memset(&v6, 0, sizeof(v6));
  if (fstat(a1, &v6)) {
    st_size_t size = 0;
  }
  else {
    st_size_t size = v6.st_size;
  }
  if (st_size < 1 || (uint64_t v3 = mmap(0, st_size, 1, 1, a1, 0), v3 == (void *)-1)) {
    int v4 = 0;
  }
  else {
    int v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v3 length:st_size deallocator:&__block_literal_global_166];
  }
  return v4;
}

uint64_t __dataWithMappedContentsOfFileDescriptor_block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

void sub_19BDB74F0(_Unwind_Exception *a1)
{
  if (*(unsigned char *)(v2 - 208)) {
    os_activity_scope_leave((os_activity_scope_state_t)(v2 - 184));
  }
  if (*(void *)(v2 - 192))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = v4;
    os_signpost_id_t v6 = *(void *)(v2 - 192);
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(*(SEL *)(v2 - 168));
      *(_DWORD *)(v2 - 160) = 136446210;
      *(void *)(v1 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", (uint8_t *)(v2 - 160), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDB7C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  if (a33) {
    os_activity_scope_leave(&a36);
  }
  if (a35)
  {
    long long v40 = PLRequestGetLog();
    long long v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(void *)(v37 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDB817C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BDB8C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,SEL sel)
{
  _Unwind_Resume(a1);
}

void sub_19BDB943C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  if (a33) {
    os_activity_scope_leave(&a36);
  }
  if (a35)
  {
    long long v40 = PLRequestGetLog();
    long long v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 176) = 136446210;
      *(void *)(v37 + 52) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 176), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDB9B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  if (a33) {
    os_activity_scope_leave(&a36);
  }
  if (a35)
  {
    long long v40 = PLRequestGetLog();
    long long v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(void *)(v37 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDBA2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,void *a34,os_signpost_id_t a35,os_activity_scope_state_s a36,SEL sel)
{
  if (a33) {
    os_activity_scope_leave(&a36);
  }
  if (a35)
  {
    long long v40 = PLRequestGetLog();
    long long v41 = v40;
    if (a35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(sel);
      *(_DWORD *)(v38 - 160) = 136446210;
      *(void *)(v37 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v41, OS_SIGNPOST_INTERVAL_END, a35, "PLXPC Sync", "%{public}s", (uint8_t *)(v38 - 160), 0xCu);
    }
  }
  _Unwind_Resume(a1);
}

void sub_19BDBA8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BDBAF88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19BDBB93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12078(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12079(uint64_t a1)
{
}

uint64_t PLSuppressionContextForMomentShareUUID(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@_%@", @"MomentShareView", a1];
}

uint64_t DiskSpaceDidBecomeLow(uint64_t a1, void *a2)
{
  return [a2 _diskSpaceDidBecomeLow];
}

void sub_19BDBD2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19BDBE330(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BDBE3C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BDBE44C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BDBE64C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_19BDBE7EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7478](url);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7490](locArray, prefArray);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x1F40D7558](bundle, functionName);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1F40D78E0](allocator, formatter, date);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
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

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
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

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1F40D8238](theSet, value);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8900](url, buffer, bufferLength);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D8A90](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AB0](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
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

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1F40DA890](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

CFStringRef CGImageGetUTType(CGImageRef image)
{
  return (CFStringRef)MEMORY[0x1F40DA9B0](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

size_t CGImageSourceGetPrimaryImageIndex(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E9A00](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1F40E9A18](isrc);
}

uint64_t CGImageWriteEXIFJPEGWithMetadata()
{
  return MEMORY[0x1F40E9A78]();
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

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1F40DB598]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x1F40DB5A0](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1F41092C0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1F41096C8]();
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1F40DFD08](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1F40DFD78](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1F40DFE40](texture);
}

uint64_t FigCreateIOSurfaceBackedCVPixelBuffer()
{
  return MEMORY[0x1F4103080]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x1F4103088]();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x1F40E9328](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9440](buffer);
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return MEMORY[0x1F40E94E0]();
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E94F8](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9560](xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1F417CE10]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1F417CE48]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1F40C99E8](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PFAbstractMethodException()
{
  return MEMORY[0x1F413F308]();
}

uint64_t PFErrorOrUnderlyingErrorMatchesCodesByDomain()
{
  return MEMORY[0x1F4140690]();
}

uint64_t PFFigCreateCGImageFromImageData()
{
  return MEMORY[0x1F41406A8]();
}

uint64_t PFFigCreateCVPixelBufferFromImageData()
{
  return MEMORY[0x1F41406B0]();
}

uint64_t PFFigJPEGDataFromImage()
{
  return MEMORY[0x1F41406D8]();
}

uint64_t PFMethodNotImplementedException()
{
  return MEMORY[0x1F413F340]();
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  return MEMORY[0x1F413F348]();
}

uint64_t PFOSVariantHasInternalUI()
{
  return MEMORY[0x1F413F350]();
}

uint64_t PFObjc_implementsClassMethod()
{
  return MEMORY[0x1F413F360]();
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  return MEMORY[0x1F413F368]();
}

uint64_t PFUnderlyingErrorThatMatchesCodesByDomain()
{
  return MEMORY[0x1F41408C8]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return (CFDictionaryRef)MEMORY[0x1F40F7150](task, entitlements, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1F415CC18]();
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x1F4103340]();
}

uint64_t VTImageRotationSessionTransferImage()
{
  return MEMORY[0x1F4103360]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1F41034D0](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1F41034F0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1F4103538](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1F40D91E8]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1F40D92B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1F40D9428]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1F40D9440]();
}

uint64_t _PFAssertContinueHandler()
{
  return MEMORY[0x1F413F3A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1F40C9CC0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1F40C9CD0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1F40C9CE8]();
}

uint64_t _objc_registerTaggedPointerClass()
{
  return MEMORY[0x1F4181438]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  return MEMORY[0x1F40CA1D8]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1F40CA1F8]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int chflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1F40CB398](a1, *(void *)&a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x1F40CB3E0](a1, a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CB9F8](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
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

uint64_t dispatch_set_qos_class()
{
  return MEMORY[0x1F40CBC68]();
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

float exp2f(float a1)
{
  MEMORY[0x1F40CBFF0](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC108](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1F40CC158](*(void *)&fd, namebuff, size, *(void *)&options);
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

int fremovexattr(int fd, const char *name, int options)
{
  return MEMORY[0x1F40CC240](*(void *)&fd, name, *(void *)&options);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1F40CC400](a1, a2);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1F40CC408](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1F4181598](block);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1F40CD2B0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_transaction_get_description()
{
  return MEMORY[0x1F40CD5A8]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

uint64_t pc_session_add_metric()
{
  return MEMORY[0x1F4181BA8]();
}

uint64_t pc_session_begin()
{
  return MEMORY[0x1F4181BC0]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x1F4181BD0]();
}

uint64_t pc_session_destroy()
{
  return MEMORY[0x1F4181BD8]();
}

uint64_t pc_session_end()
{
  return MEMORY[0x1F4181BF0]();
}

uint64_t pc_session_get_value()
{
  return MEMORY[0x1F4181C08]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x1F4181C18]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40CD8A8](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1F40CDB90](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CDBC0](*(void *)&__fd, __buf, __nbyte, a4);
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1F40CDBD0]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1F40CDD70](a1, a2, *(void *)&a3);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40CDD90](a1);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1F4182258](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x1F40CE120](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE250](__s, __charset);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t tcc_authorization_check_audit_token()
{
  return MEMORY[0x1F415CC50]();
}

uint64_t tcc_authorization_preflight()
{
  return MEMORY[0x1F415CC58]();
}

uint64_t tcc_authorization_request()
{
  return MEMORY[0x1F415CC98]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40CE6A8](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40CED38]();
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40CEDA0](ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40CEFF8](xdouble);
  return result;
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1F40CF0D0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CF268](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1F40CF278](xshmem, region);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}