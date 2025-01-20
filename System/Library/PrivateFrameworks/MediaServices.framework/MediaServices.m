uint64_t MSVDeviceOSIsInternalInstall()
{
  return os_variant_has_internal_content();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return 0;
}

uint64_t MSVDeviceIsAppleTV()
{
  return 0;
}

id _MSVXPCTransactionsGet()
{
  if (_MSVXPCTransactionsGet_onceToken != -1) {
    dispatch_once(&_MSVXPCTransactionsGet_onceToken, &__block_literal_global_2198);
  }
  v0 = (void *)_MSVXPCTransactionsGet___MSVXPCTransactions;
  return v0;
}

uint64_t NSStringFromMSVSignedRange(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"{%ld, %ld}", a1, a2];
}

void sub_1A30D0814(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(exception_object);
    v14 = objc_opt_class();
    a11 = 0;
    int v15 = objc_msgSend(v14, "__categorizeException:intoError:", v13, &a11);
    id v16 = a11;
    if (v15)
    {
      v17 = v16;
      objc_msgSend(v12, "__setError:", v16);
      if (v11) {
        void *v11 = v17;
      }

      objc_end_catch();
      JUMPOUT(0x1A30D077CLL);
    }
    objc_exception_throw(v13);
  }
  _Unwind_Resume(exception_object);
}

void __MSVProcessCopyMediaFrameworksDescriptions_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  id v22 = [NSString stringWithCString:a4 encoding:4];
  v7 = [v22 lastPathComponent];
  if ([(id)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames containsObject:v7])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3];
    if (*(unsigned char *)(a1 + 40)
      && ([(id)MSVProcessCopyMediaFrameworksDescriptions_frameworkUUIDs objectForKeyedSubscript:v22],
          v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isEqual:v8],
          v9,
          (v10 & 1) == 0))
    {
      id v13 = dlopen(a4, 277);
      v14 = dlsym(v13, "_DebugMarker");
      dlclose(v13);
      BOOL v12 = v14 != 0;
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v11 = 0;
      BOOL v12 = 0;
    }
    int v15 = (void *)MEMORY[0x1E4F28B50];
    id v16 = [v22 stringByDeletingLastPathComponent];
    v17 = [v15 bundleWithPath:v16];

    v18 = [v17 infoDictionary];
    v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F1D020]];

    v20 = *(void **)(a1 + 32);
    v21 = [[MSVFrameworkDescription alloc] initWithName:v7 uuid:v8 version:v19 root:v11 debug:v12];
    [v20 addObject:v21];
  }
}

void __MSVProcessCopyMediaFrameworksDescriptions_block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = [NSString stringWithCString:*(void *)(a2 + 40) encoding:4];
  v5 = (void *)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames;
  id v8 = v4;
  v6 = [v4 lastPathComponent];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a2 + 24];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

uint64_t MSVDeviceSupportsVocalAttenuation()
{
  if (MSVDeviceSupportsVocalAttenuation___once != -1) {
    dispatch_once(&MSVDeviceSupportsVocalAttenuation___once, &__block_literal_global_100);
  }
  return MSVDeviceSupportsVocalAttenuation_supportsVocalAttenuation;
}

BOOL msv_dispatch_on_main_queue(void *a1)
{
  v1 = a1;
  int v2 = pthread_main_np();
  if (v2 == 1) {
    v1[2](v1);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v1);
  }

  return v2 == 1;
}

BOOL msv_dispatch_async_on_queue(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v3;
  v6 = (void (**)(void))v4;
  if (v5 == MEMORY[0x1E4F14428] && pthread_main_np() == 1)
  {
    v6[2](v6);
    BOOL v7 = 1;
  }
  else
  {
    key = &key;
    dispatch_queue_set_specific(v5, &key, (void *)1, 0);
    id v8 = key;
    specific = dispatch_get_specific(key);
    dispatch_queue_set_specific(v5, v8, 0, 0);
    BOOL v7 = specific == (void *)1;
    if (specific == (void *)1) {
      v6[2](v6);
    }
    else {
      dispatch_async(v5, v6);
    }
  }

  return v7;
}

id MSVPropertyListDataClasses()
{
  if (MSVPropertyListDataClasses___once != -1) {
    dispatch_once(&MSVPropertyListDataClasses___once, &__block_literal_global_1578);
  }
  v0 = (void *)MSVPropertyListDataClasses___msvPropertyListDataClasses;
  return v0;
}

uint64_t MSVDeviceSupportsExtendedColorDisplay()
{
  if (MSVDeviceSupportsExtendedColorDisplay___once != -1) {
    dispatch_once(&MSVDeviceSupportsExtendedColorDisplay___once, &__block_literal_global_88);
  }
  return MSVDeviceSupportsExtendedColorDisplay___deviceSupportsExtendedColorDisplay;
}

double MSVGetKernelBootTime()
{
  if (MSVGetKernelBootTime_onceToken != -1) {
    dispatch_once(&MSVGetKernelBootTime_onceToken, &__block_literal_global_168);
  }
  return *(double *)&MSVGetKernelBootTime___kernelBootTime;
}

double MSVGetMaximumScreenSize()
{
  if (MSVGetMaximumScreenSize_onceToken != -1) {
    dispatch_once(&MSVGetMaximumScreenSize_onceToken, &__block_literal_global_122_2339);
  }
  return *(double *)&MSVGetMaximumScreenSize_maximumScreenSize_0;
}

void sub_1A30D450C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A30D49CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void sub_1A30D4C1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A30D54F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id MSVTCCIdentityForCurrentProcess()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];

  if (v1)
  {
    id v2 = [v0 bundleIdentifier];
    uint64_t v3 = MSVTCCIdentityForBundleID(v2);
LABEL_5:
    v5 = (void *)v3;

    goto LABEL_6;
  }
  id v4 = [v0 executablePath];

  if (v4)
  {
    id v2 = [v0 executablePath];
    [v2 UTF8String];
    uint64_t v3 = tcc_identity_create();
    goto LABEL_5;
  }
  v5 = 0;
LABEL_6:

  return v5;
}

id MSVTCCIdentityForBundleID(void *a1)
{
  if (a1)
  {
    [a1 UTF8String];
    a1 = (void *)tcc_identity_create();
    uint64_t v1 = vars8;
  }
  return a1;
}

BOOL msv_dispatch_sync_on_queue(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v3;
  v6 = (void (**)(void))v4;
  if (v5 == MEMORY[0x1E4F14428] && pthread_main_np() == 1)
  {
    v6[2](v6);
    BOOL v7 = 1;
  }
  else
  {
    key = &key;
    dispatch_queue_set_specific(v5, &key, (void *)1, 0);
    id v8 = key;
    specific = dispatch_get_specific(key);
    dispatch_queue_set_specific(v5, v8, 0, 0);
    BOOL v7 = specific == (void *)1;
    if (specific == (void *)1) {
      v6[2](v6);
    }
    else {
      dispatch_sync(v5, v6);
    }
  }

  return v7;
}

id MSVNanoIDCreateTaggedPointer()
{
  return MSVNanoIDCreateWithCharacters(@"eilotrmapdnsIcufkMShjTRxgC4013bDNvwyUL2O856PB79AFKEWVzGJHYX", 9);
}

uint64_t MSVLogRemoveStateHandler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t MSVDeviceSupportsMultipleLibraries()
{
  return 0;
}

void sub_1A30D791C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MSVSignedUnionRange(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result >= a3) {
    return a3;
  }
  return result;
}

id MSVTimelineChartPrefix(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = [MEMORY[0x1E4F28E78] stringWithCapacity:a4];
  if (a4 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = (1 << (v9 + 1)) & a3;
      if (a1 - 1 == v9)
      {
        uint64_t v11 = @"┖";
        switch(a2)
        {
          case 1uLL:
            if (v10) {
              goto LABEL_6;
            }
            uint64_t v11 = @"┎";
            break;
          case 2uLL:
LABEL_6:
            uint64_t v11 = @"┠";
            break;
          case 3uLL:
            uint64_t v11 = @"┃";
            break;
          case 4uLL:
            break;
          case 5uLL:
            uint64_t v11 = @" ";
            break;
          default:
            uint64_t v11 = @"X";
            break;
        }
      }
      else
      {
        if (a2 <= 4 && ((1 << a2) & 0x16) != 0 && v9 + 1 > a1)
        {
          BOOL v12 = v10 == 0;
          id v13 = @"╂";
          v14 = @"─";
        }
        else
        {
          BOOL v12 = v10 == 0;
          id v13 = @"┃";
          v14 = @" ";
        }
        if (v12) {
          uint64_t v11 = v14;
        }
        else {
          uint64_t v11 = v13;
        }
      }
      [v8 appendString:v11];
      ++v9;
    }
    while (a4 != v9);
  }
  return v8;
}

id MSVArchivedDataWithRootObject(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"NSData * _Nullable MSVArchivedDataWithRootObject(__strong id _Nonnull)"];
    [v5 handleFailureInFunction:v6, @"MSVSecureCodingUtilities.m", 55, @"Invalid parameter not satisfying: %@", @"object" file lineNumber description];
  }
  id v9 = 0;
  id v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v1 requiringSecureCoding:1 error:&v9];
  id v3 = v9;
  if (v3)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"NSData * _Nullable MSVArchivedDataWithRootObject(__strong id _Nonnull)"];
    [v7 handleFailureInFunction:v8, @"MSVSecureCodingUtilities.m", 59, @"Archiving root object:%@ resulted in error:%@", v1, v3 file lineNumber description];
  }
  return v2;
}

uint64_t MSVDeviceIsWatch()
{
  return 0;
}

id MSVUnarchivedObjectOfClasses(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClasses(NSSet<Class> *__strong _Nonnull, NSData *__strong _Nonnull)");
    [v9 handleFailureInFunction:v10, @"MSVSecureCodingUtilities.m", 44, @"Invalid parameter not satisfying: %@", @"classes" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  BOOL v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClasses(NSSet<Class> *__strong _Nonnull, NSData *__strong _Nonnull)");
  [v11 handleFailureInFunction:v12, @"MSVSecureCodingUtilities.m", 45, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];

LABEL_3:
  id v15 = 0;
  v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v3 fromData:v5 error:&v15];
  id v7 = v15;
  if (v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClasses(NSSet<Class> *__strong _Nonnull, NSData *__strong _Nonnull)");
    [v13 handleFailureInFunction:v14, @"MSVSecureCodingUtilities.m", 49, @"Unarchiving object of classes:%@ resulted in error:%@", v3, v7 file lineNumber description];
  }
  return v6;
}

uint64_t MSVDeviceSupportsDelegatedIdentities()
{
  return 0;
}

uint64_t MSVSignedIntersectionRange(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 > result || result >= a3 + a4)
  {
    if (result <= a3 && a3 < result + a2) {
      return a3;
    }
    else {
      return 0;
    }
  }
  return result;
}

id MSVLogDateFormatter()
{
  if (MSVLogDateFormatter_onceToken != -1) {
    dispatch_once(&MSVLogDateFormatter_onceToken, &__block_literal_global_47);
  }
  v0 = (void *)MSVLogDateFormatter___formatter;
  return v0;
}

uint64_t MSVCopyLocalizedModelName()
{
  return MGCopyAnswer();
}

BOOL MSVDeviceIsInternalCarry()
{
  if (!os_variant_has_internal_content()) {
    return 0;
  }
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.da"];
  id v1 = [v0 objectForKey:@"ExperimentGroup"];
  id v2 = [v1 lowercaseString];

  if (([v2 containsString:@"carry"] & 1) != 0
    || [v2 containsString:@"walkabout"])
  {
    id v3 = [v0 objectForKey:@"AutomatedDeviceGroup"];
    BOOL v4 = [v3 length] == 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t MSVLogAddStateHandler(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v9 = a3;
  id v4 = v9;
  id v5 = v8;
  uint64_t v6 = os_state_add_handler();

  return v6;
}

uint64_t MSVGetCurrentThreadPriority()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  *(_OWORD *)thread_info_out = 0u;
  mach_msg_type_number_t thread_info_outCnt = 28;
  v0 = pthread_self();
  thread_inspect_t v1 = pthread_mach_thread_np(v0);
  if (thread_info(v1, 5u, thread_info_out, &thread_info_outCnt)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return DWORD1(v6);
  }
}

id MSVProcessCopyUUID()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  dlsym((void *)0xFFFFFFFFFFFFFFFBLL, "_mh_execute_header");
  v5[0] = 0;
  v5[1] = 0;
  int image_uuid = _dyld_get_image_uuid();
  id v1 = objc_alloc(MEMORY[0x1E4F29128]);
  if (image_uuid) {
    id v2 = v5;
  }
  else {
    id v2 = &UUID_NULL;
  }
  id v3 = (void *)[v1 initWithUUIDBytes:v2];
  return v3;
}

id MSVGzipCompressData()
{
  v0 = (void *)MEMORY[0x1F4188790]();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = v0;
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = [v1 length];
  id v2 = v1;
  strm.next_in = (Bytef *)[v2 bytes];
  id v3 = 0;
  if (!deflateInit2_(&strm, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    id v4 = [MEMORY[0x1E4F1CA58] data];
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v9;
      unsigned int v5 = deflate(&strm, 4 * (strm.avail_in == 0));
      if (v5 > 1) {
        break;
      }
      unsigned int v6 = v5;
      if (strm.avail_out != 0x4000) {
        [v4 appendBytes:v9 length:0x4000 - strm.avail_out];
      }
      if (v6)
      {
        deflateEnd(&strm);
        id v3 = (void *)[v4 copy];
        goto LABEL_9;
      }
    }
    deflateEnd(&strm);
    id v3 = 0;
LABEL_9:
  }
  return v3;
}

id MSVGzipDecompressData()
{
  v0 = (void *)MEMORY[0x1F4188790]();
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = v0;
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = [v1 length];
  id v2 = v1;
  strm.next_in = (Bytef *)[v2 bytes];
  id v3 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    id v4 = [MEMORY[0x1E4F1CA58] data];
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v9;
      unsigned int v5 = inflate(&strm, 4 * (strm.avail_in == 0));
      if (v5 > 1) {
        break;
      }
      unsigned int v6 = v5;
      if (strm.avail_out != 0x4000) {
        [v4 appendBytes:v9 length:0x4000 - strm.avail_out];
      }
      if (v6)
      {
        inflateEnd(&strm);
        id v3 = (void *)[v4 copy];
        goto LABEL_9;
      }
    }
    inflateEnd(&strm);
    id v3 = 0;
LABEL_9:
  }
  return v3;
}

uint64_t MSVHasherSharedSeed()
{
  if (MSVHasherSharedSeed_onceToken != -1) {
    dispatch_once(&MSVHasherSharedSeed_onceToken, &__block_literal_global_3068);
  }
  return MSVHasherSharedSeed___seed_0;
}

char *_MSV_XXH_XXH64_update(char *result, char *__src, size_t __n)
{
  if (__src)
  {
    int v3 = __n;
    id v4 = __src;
    unsigned int v5 = result;
    *(void *)result += __n;
    uint64_t v6 = *((unsigned int *)result + 18);
    if (v6 + __n <= 0x1F)
    {
      result = (char *)memcpy(&result[v6 + 40], __src, __n);
      LODWORD(v7) = *((_DWORD *)v5 + 18) + v3;
LABEL_12:
      *((_DWORD *)v5 + 18) = v7;
      return result;
    }
    long long v8 = &__src[__n];
    if (v6)
    {
      result = (char *)memcpy(&result[v6 + 40], __src, (32 - v6));
      uint64_t v9 = __ROR8__(*((void *)v5 + 2) - 0x3D4D51C2D82B14B1 * *((void *)v5 + 6), 33);
      *((void *)v5 + 1) = 0x9E3779B185EBCA87
                          * __ROR8__(*((void *)v5 + 1) - 0x3D4D51C2D82B14B1 * *((void *)v5 + 5), 33);
      *((void *)v5 + 2) = 0x9E3779B185EBCA87 * v9;
      unint64_t v10 = 0x9E3779B185EBCA87 * __ROR8__(*((void *)v5 + 4) - 0x3D4D51C2D82B14B1 * *((void *)v5 + 8), 33);
      *((void *)v5 + 3) = 0x9E3779B185EBCA87
                          * __ROR8__(*((void *)v5 + 3) - 0x3D4D51C2D82B14B1 * *((void *)v5 + 7), 33);
      *((void *)v5 + 4) = v10;
      v4 += (32 - *((_DWORD *)v5 + 18));
      *((_DWORD *)v5 + 18) = 0;
    }
    if (v4 + 32 <= v8)
    {
      unint64_t v11 = *((void *)v5 + 1);
      unint64_t v12 = *((void *)v5 + 2);
      unint64_t v14 = *((void *)v5 + 3);
      unint64_t v13 = *((void *)v5 + 4);
      do
      {
        unint64_t v11 = 0x9E3779B185EBCA87 * __ROR8__(v11 - 0x3D4D51C2D82B14B1 * *(void *)v4, 33);
        unint64_t v12 = 0x9E3779B185EBCA87 * __ROR8__(v12 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 1), 33);
        unint64_t v14 = 0x9E3779B185EBCA87 * __ROR8__(v14 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 2), 33);
        unint64_t v13 = 0x9E3779B185EBCA87 * __ROR8__(v13 - 0x3D4D51C2D82B14B1 * *((void *)v4 + 3), 33);
        v4 += 32;
      }
      while (v4 <= v8 - 32);
      *((void *)v5 + 1) = v11;
      *((void *)v5 + 2) = v12;
      *((void *)v5 + 3) = v14;
      *((void *)v5 + 4) = v13;
    }
    if (v4 < v8)
    {
      size_t v7 = v8 - v4;
      result = (char *)memcpy(v5 + 40, v4, v7);
      goto LABEL_12;
    }
  }
  return result;
}

unint64_t _MSV_XXH_XXH64_digest(void *a1)
{
  if (*a1 < 0x20uLL) {
    uint64_t v1 = a1[3] + 0x27D4EB2F165667C5;
  }
  else {
    uint64_t v1 = 0x85EBCA77C2B2AE63
  }
       - 0x61C8864E7A143579
       * ((0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579
         * ((0x85EBCA77C2B2AE63
           - 0x61C8864E7A143579
           * ((0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * ((__ROR8__(a1[2], 57) + __ROR8__(a1[1], 63) + __ROR8__(a1[3], 52) + __ROR8__(a1[4], 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[2], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[3], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[4], 33)));
  unint64_t v2 = v1 + *a1;
  int v3 = a1 + 5;
  unint64_t v4 = *a1 & 0x1FLL;
  if (v4 >= 8)
  {
    do
    {
      uint64_t v5 = *v3++;
      unint64_t v2 = 0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579 * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v5, 33)) ^ v2, 37);
      v4 -= 8;
    }
    while (v4 > 7);
  }
  if (v4 >= 4)
  {
    unsigned int v6 = *(_DWORD *)v3;
    int v3 = (uint64_t *)((char *)v3 + 4);
    unint64_t v2 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v6) ^ v2, 41);
    v4 -= 4;
  }
  for (; v4; --v4)
  {
    unsigned int v7 = *(unsigned __int8 *)v3;
    int v3 = (uint64_t *)((char *)v3 + 1);
    unint64_t v2 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v7) ^ v2, 53);
  }
  unint64_t v8 = 0x165667B19E3779F9
     * ((0xC2B2AE3D27D4EB4FLL * (v2 ^ (v2 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v2 ^ (v2 >> 33))) >> 29));
  return v8 ^ HIDWORD(v8);
}

id MSVNanoIDCreateWithCharacters(void *a1, int64_t a2)
{
  id v3 = a1;
  if (_MSVNanoIDSharedArc4State_onceToken != -1) {
    dispatch_once(&_MSVNanoIDSharedArc4State_onceToken, &__block_literal_global_3944);
  }
  if (__MSVNanoIDTestingArc4State) {
    uint64_t v4 = __MSVNanoIDTestingArc4State;
  }
  else {
    uint64_t v4 = _MSVNanoIDSharedArc4State__state;
  }
  id v5 = v3;
  unsigned int v6 = malloc_type_malloc(a2, 0x1A8D6082uLL);
  unsigned int v7 = v6;
  LODWORD(v9) = *(_DWORD *)v4;
  int v8 = *(_DWORD *)(v4 + 4);
  if (a2)
  {
    uint64_t v10 = *(void *)(v4 + 8);
    unint64_t v11 = v6;
    int64_t v12 = a2;
    do
    {
      uint64_t v9 = (v9 + 1);
      char v13 = *(unsigned char *)(v10 + v9);
      LOBYTE(v8) = v13 + v8;
      *(unsigned char *)(v10 + v9) = *(unsigned char *)(v10 + v8);
      *(unsigned char *)(v10 + v8) = v13;
      *v11++ = *(unsigned char *)(v10 + (*(unsigned char *)(v10 + v9) + v13));
      --v12;
    }
    while (v12);
    int v8 = v8;
  }
  *(_DWORD *)uint64_t v4 = v9;
  *(_DWORD *)(v4 + 4) = v8;
  uint64_t v14 = [v5 length];
  id v15 = v5;
  uint64_t v16 = [v15 cStringUsingEncoding:4];
  if (a2 >= 1)
  {
    v17 = v7;
    int64_t v18 = a2;
    do
    {
      unsigned char *v17 = *(unsigned char *)(v16 + *v17 % v14);
      ++v17;
      --v18;
    }
    while (v18);
  }
  v19 = (void *)[[NSString alloc] initWithBytesNoCopy:v7 length:a2 encoding:4 freeWhenDone:1];

  return v19;
}

id MSVBundleIDForAuditToken(_OWORD *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v3 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v3;
  uint64_t v4 = SecTaskCreateWithAuditToken(v2, &token);
  if (v4)
  {
    long long v5 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v5;
    pid_t v6 = audit_token_to_pid(&token);
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"NSString *MSVBundleIDForAuditToken(audit_token_t)"];
    [v19 handleFailureInFunction:v20 file:@"MSVSystemUtilities.m" lineNumber:61 description:@"Failed to get SecTask from audit_token"];

    long long v21 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v21;
    pid_t v6 = audit_token_to_pid(&token);
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = objc_msgSend(NSString, "stringWithUTF8String:", "NSString *_MSVBundleIDForSecTask(SecTaskRef, pid_t, BOOL)");
    [v22 handleFailureInFunction:v23, @"MSVSystemUtilities.m", 1008, @"Invalid parameter not satisfying: %@", @"task" file lineNumber description];
  }
  unsigned int v7 = (void *)SecTaskCopyValueForEntitlement(v4, @"application-identifier", 0);
  int v8 = os_log_create("com.apple.amp.MediaServices", "Entitlements");
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 138543618;
      *(void *)&token.val[1] = @"application-identifier";
      LOWORD(token.val[3]) = 2114;
      *(void *)((char *)&token.val[3] + 2) = v7;
      _os_log_impl(&dword_1A30CD000, v9, OS_LOG_TYPE_DEFAULT, "Retrieved %{public}@ from SecTask: applicationID=%{public}@", (uint8_t *)&token, 0x16u);
    }

    id v10 = v7;
    if ((unint64_t)[v10 length] >= 0xB
      && [v10 characterAtIndex:10] == 46)
    {
      unint64_t v11 = 0;
      do
      {
        int v12 = [v10 characterAtIndex:v11];
        BOOL v14 = (v12 - 65) < 0x1A || (v12 - 48) < 0xA;
        if (v11 > 8) {
          break;
        }
        ++v11;
      }
      while (v14);
      if (v14)
      {
        uint64_t v15 = objc_msgSend(v10, "substringWithRange:", 11, objc_msgSend(v10, "length") - 11);

        id v10 = (id)v15;
      }
      uint64_t v16 = os_log_create("com.apple.amp.MediaServices", "Entitlements");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138543874;
        *(void *)&token.val[1] = @"application-identifier";
        LOWORD(token.val[3]) = 1024;
        *(unsigned int *)((char *)&token.val[3] + 2) = v14;
        HIWORD(token.val[4]) = 2114;
        *(void *)&token.val[5] = v10;
        _os_log_impl(&dword_1A30CD000, v16, OS_LOG_TYPE_DEFAULT, "Processed teamID from %{public}@: teamIDIsValid=%{BOOL}u bundleID=%{public}@", (uint8_t *)&token, 0x1Cu);
      }
    }
    id v17 = v10;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      token.val[0] = 138543874;
      *(void *)&token.val[1] = @"application-identifier";
      LOWORD(token.val[3]) = 2114;
      *(void *)((char *)&token.val[3] + 2) = @"application-identifier";
      HIWORD(token.val[5]) = 2048;
      *(void *)&token.val[6] = v6;
      _os_log_impl(&dword_1A30CD000, v9, OS_LOG_TYPE_FAULT, "Failed to retrieve %{public}@ from SecTask. This typically indicates that the process is missing the %{public}@ entitlement. It must match the process' bundle identifier. This is a client-issue. Check the crash report for the Coalition process. PID: %lld", (uint8_t *)&token, 0x20u);
    }

    id v17 = 0;
  }

  CFRelease(v4);
  return v17;
}

uint64_t OpenSQLiteConnection(void *a1, sqlite3 **a2, int a3)
{
  id v5 = a1;
  if (!a2) {
    __assert_rtn("OpenSQLiteConnection", "MSVSQLDatabase.m", 1035, "outConnectionHandle");
  }
  ppDb = 0;
  id v6 = v5;
  uint64_t v7 = sqlite3_open_v2((const char *)[v6 UTF8String], &ppDb, a3, 0);
  if (v7) {
    sqlite3_close(ppDb);
  }
  else {
    *a2 = ppDb;
  }

  return v7;
}

id MSVMediaLoggingDirectory()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v0 = MSVMobileHomeDirectory();
  uint64_t v1 = NSString;
  v5[0] = v0;
  v5[1] = @"Library";
  v5[2] = @"Logs";
  void v5[3] = @"MediaServices";
  CFAllocatorRef v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  long long v3 = [v1 pathWithComponents:v2];

  return v3;
}

id MSVMobileHomeDirectory()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v3[0] = @"/";
  v3[1] = @"private";
  v3[2] = @"var";
  v3[3] = @"mobile";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:4];
  uint64_t v1 = [NSString pathWithComponents:v0];

  return v1;
}

uint64_t MSVReplacementRangeForRanges(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 + a2 >= a3 + a4) {
    uint64_t v4 = a3 + a4;
  }
  else {
    uint64_t v4 = a1 + a2;
  }
  if ((a3 > a1 || (uint64_t v5 = a1, a1 >= a3 + a4)) && (a1 > a3 || (uint64_t v5 = a3, a3 >= a1 + a2)) || v4 == v5)
  {
    if (a3 >= a1) {
      return a2;
    }
    else {
      return 0;
    }
  }
  else
  {
    if (a1 >= 0) {
      uint64_t v6 = a1;
    }
    else {
      uint64_t v6 = -a1;
    }
    return v5 + v6;
  }
}

__CFString *MSVSystemRootDirectory()
{
  return @"/";
}

BOOL MSVDeviceSupportsMultiChannelMusic()
{
  if (MSVDeviceIsiPhone___once != -1) {
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_93);
  }
  if (MSVDeviceIsiPhone___deviceIsPhone) {
    return 1;
  }
  if (MSVDeviceIsiPod___once != -1) {
    dispatch_once(&MSVDeviceIsiPod___once, &__block_literal_global_95);
  }
  if (MSVDeviceIsiPod___deviceIsPod) {
    return 1;
  }
  if (MSVDeviceIsiPad___once != -1) {
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2316);
  }
  return MSVDeviceIsiPad___deviceIsiPad != 0;
}

uint64_t MSVDeviceIsiPad()
{
  if (MSVDeviceIsiPad___once != -1) {
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2316);
  }
  return MSVDeviceIsiPad___deviceIsiPad;
}

id _MSVFileExtensionForCoderTypeAndCompressionAlgorithm(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"NSKeyedArchive"])
  {
    CFAllocatorRef v2 = @"keyedArchive";
  }
  else
  {
    if (([v1 isEqualToString:@"MSVOPACKCoder"] & 1) == 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVFileExtensionForCoderTypeAndCompressionAlgorithm(NSString * _Nonnull __strong)"];
      [v5 handleFailureInFunction:v6, @"MSVSegmentedCodingPackage.m", 50, @"Unsupported coder type %@", v1 file lineNumber description];

      abort();
    }
    CFAllocatorRef v2 = @"opackCoder";
  }
  long long v3 = [(__CFString *)v2 stringByAppendingPathExtension:@"gz"];

  return v3;
}

void sub_1A30DE8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A30DF12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MSVGetMaximumScreenSize_block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v7 = 0;
  v0 = (void *)MGCopyAnswerWithError();
  int v6 = 0;
  id v1 = (void *)MGCopyAnswerWithError();
  if ([v0 integerValue] < 1 || objc_msgSend(v1, "integerValue") < 1)
  {
    if (MSVGetMaximumScreenScale_onceToken != -1) {
      dispatch_once(&MSVGetMaximumScreenScale_onceToken, &__block_literal_global_130);
    }
    CGAffineTransformMakeScale(&v5, *(CGFloat *)&MSVGetMaximumScreenScale_deviceScreenScale, *(CGFloat *)&MSVGetMaximumScreenScale_deviceScreenScale);
    *(double *)&MSVGetMaximumScreenSize_maximumScreenSize_0 = v5.c * 1024.0 + v5.a * 1366.0;
    *(double *)&MSVGetMaximumScreenSize_maximumScreenSize_1 = v5.d * 1024.0 + v5.b * 1366.0;
    uint64_t v4 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v9 = v7;
      __int16 v10 = 1024;
      int v11 = v6;
      _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_ERROR, "Failed to get screen size from MobileGestalt (width_error = %d / height_error = %d", buf, 0xEu);
    }
  }
  else
  {
    double v2 = (double)[v0 integerValue];
    uint64_t v3 = [v1 integerValue];
    MSVGetMaximumScreenSize_maximumScreenSize_0 = *(void *)&v2;
    *(double *)&MSVGetMaximumScreenSize_maximumScreenSize_1 = (double)v3;
  }
}

void __MSVDeviceSupportsVocalAttenuation_block_invoke()
{
  MSVGetDeviceProductType();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  id v1 = [v10 stringByTrimmingCharactersInSet:v0];

  double v2 = [v1 componentsSeparatedByString:@","];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = [v3 integerValue];

  if (MSVDeviceIsiPhone___once != -1) {
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_93);
  }
  if (MSVDeviceIsiPhone___deviceIsPhone)
  {
    CGAffineTransform v5 = [v2 lastObject];
    uint64_t v6 = [v5 integerValue];

    BOOL v8 = v4 == 12 && v6 == 8 || v4 <= 11;
    goto LABEL_14;
  }
  if (MSVDeviceIsiPad___once != -1) {
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2316);
  }
  if (MSVDeviceIsiPad___deviceIsiPad)
  {
    BOOL v8 = v4 <= 11;
LABEL_14:
    char v9 = !v8;
    MSVDeviceSupportsVocalAttenuation_supportsVocalAttenuation = v9;
  }
}

id MSVGetDeviceProductType()
{
  if (MSVGetDeviceProductType___once != -1) {
    dispatch_once(&MSVGetDeviceProductType___once, &__block_literal_global_138);
  }
  v0 = (void *)MSVGetDeviceProductType___deviceProductType;
  return v0;
}

uint64_t __MSVDeviceIsiPhone_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  MSVDeviceIsiPhone___deviceIsPhone = result == 1;
  return result;
}

uint64_t __MSVGetDeviceProductType_block_invoke()
{
  MSVGetDeviceProductType___deviceProductType = MGCopyAnswer();
  return MEMORY[0x1F41817F8]();
}

double MSVGetProcessLaunchTime()
{
  if (MSVGetProcessLaunchTime_onceToken != -1) {
    dispatch_once(&MSVGetProcessLaunchTime_onceToken, &__block_literal_global_170);
  }
  return *(double *)&MSVGetProcessLaunchTime___processLaunchTime;
}

uint64_t __MSVDeviceIsiPad_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  MSVDeviceIsiPad___deviceIsiPad = result == 3;
  return result;
}

void sub_1A30DFF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t MSVSignedSubtractedRange(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result + a2 >= a3 + a4) {
    uint64_t v4 = a3 + a4;
  }
  else {
    uint64_t v4 = result + a2;
  }
  if (a3 > result || result >= a3 + a4)
  {
    if (a3 < result) {
      return result;
    }
    if (a3 >= result + a2) {
      return result;
    }
    uint64_t v5 = a3;
    if (v4 == a3) {
      return result;
    }
  }
  else
  {
    uint64_t v5 = result;
    if (v4 == result) {
      return result;
    }
  }
  if (v5 != result || v4 - v5 != a2)
  {
    if (a4 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = a4;
    }
    uint64_t v7 = v6 + a3;
    uint64_t v8 = a3 + v6 - 1;
    if (a2 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = a2;
    }
    BOOL v10 = v8 < result + v9 - 1;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v10) {
      uint64_t v11 = result;
    }
    if (a3 > result) {
      return v11;
    }
    else {
      return v7;
    }
  }
  return result;
}

uint64_t __MSVLogDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)MSVLogDateFormatter___formatter;
  MSVLogDateFormatter___formatter = (uint64_t)v0;

  double v2 = (void *)MSVLogDateFormatter___formatter;
  return [v2 setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSSXX"];
}

double MSVGetMaximumScreenScale()
{
  if (MSVGetMaximumScreenScale_onceToken != -1) {
    dispatch_once(&MSVGetMaximumScreenScale_onceToken, &__block_literal_global_130);
  }
  return *(double *)&MSVGetMaximumScreenScale_deviceScreenScale;
}

uint64_t __MSVPropertyListDataClasses_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  MSVPropertyListDataClasses___msvPropertyListDataClasses = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  return MEMORY[0x1F41817F8]();
}

void __MSVHasherSharedSeed_block_invoke()
{
  if (MSVHasherSharedSeed___seed_0) {
    BOOL v0 = MSVHasherSharedSeed___seed_1 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    do
    {
      MSVHasherSharedSeed___seed_0 = arc4random();
      uint32_t v1 = arc4random();
      MSVHasherSharedSeed___seed_1 = v1;
      if (MSVHasherSharedSeed___seed_0) {
        BOOL v2 = v1 == 0;
      }
      else {
        BOOL v2 = 1;
      }
    }
    while (v2);
  }
}

uint64_t __MSVDeviceSupportsExtendedColorDisplay_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  MSVDeviceSupportsExtendedColorDisplay___deviceSupportsExtendedColorDisplay = result;
  return result;
}

BOOL MSVDeviceSupportsSideLoadedMediaContent()
{
  if (MSVDeviceIsiPhone___once != -1) {
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_93);
  }
  if (MSVDeviceIsiPhone___deviceIsPhone) {
    return 1;
  }
  if (MSVDeviceIsiPod___once != -1) {
    dispatch_once(&MSVDeviceIsiPod___once, &__block_literal_global_95);
  }
  if (MSVDeviceIsiPod___deviceIsPod) {
    return 1;
  }
  if (MSVDeviceIsiPad___once != -1) {
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2316);
  }
  return MSVDeviceIsiPad___deviceIsiPad != 0;
}

void __MSVGetMaximumScreenScale_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v0 = (void *)MGCopyAnswerWithError();
  uint32_t v1 = v0;
  if (v0)
  {
    [v0 floatValue];
    *(double *)&MSVGetMaximumScreenScale_deviceScreenScale = v2;
  }
  else
  {
    uint64_t v3 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v5 = 0;
      _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_ERROR, "Failed to get main screen scale from MobileGestalt (error = %d)", buf, 8u);
    }
  }
}

double __MSVGetKernelBootTime_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  size_t v2 = 16;
  *(void *)int v5 = 0x1500000001;
  if (sysctl(v5, 2u, &v3, &v2, 0, 0) != -1 && v3 != 0)
  {
    double result = (double)(int)v4 / 1000000.0 + (double)v3;
    *(double *)&MSVGetKernelBootTime___kernelBootTime = result;
  }
  return result;
}

void __MSVProcessCopyMediaFrameworksDescriptions_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF651840];
  uint32_t v1 = (void *)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames;
  MSVProcessCopyMediaFrameworksDescriptions_frameworkNames = v0;

  size_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames, "count"));
  if (_dyld_get_shared_cache_uuid())
  {
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __MSVProcessCopyMediaFrameworksDescriptions_block_invoke_2;
    uint64_t v8 = &unk_1E5AD9A88;
    id v9 = v2;
    dyld_shared_cache_iterate_text();
  }
  uint64_t v3 = objc_msgSend(v2, "copy", v5, v6, v7, v8);
  uint64_t v4 = (void *)MSVProcessCopyMediaFrameworksDescriptions_frameworkUUIDs;
  MSVProcessCopyMediaFrameworksDescriptions_frameworkUUIDs = v3;
}

void __MSVGetProcessLaunchTime_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  *(void *)size_t v2 = 0xE00000001;
  int v3 = 1;
  pid_t v4 = getpid();
  size_t v1 = 0;
  if (!sysctl(v2, 4u, 0, &v1, 0, 0))
  {
    uint64_t v0 = (int *)malloc_type_calloc(1uLL, 0x288uLL, 0x10B2040B74D5165uLL);
    if (!sysctl(v2, 4u, v0, &v1, 0, 0)) {
      *(double *)&MSVGetProcessLaunchTime___processLaunchTime = (double)v0[2] / 1000000.0 + (double)*(uint64_t *)v0;
    }
    free(v0);
  }
}

void sub_1A30E0EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_DWORD *__MSVLogAddStateHandler_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(a2 + 16);
  pid_t v4 = MSVNanoIDCreateWithCharacters(@"eilotrmapdnsIcufkMShjTRxgC4013bDNvwyUL2O856PB79AFKEWVzGJHYX", 9);
  if (v3 == 3)
  {
    uint64_t v5 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v20 = 138543618;
      uint64_t v21 = v6;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_1A30CD000, v5, OS_LOG_TYPE_DEFAULT, "MSVStateHandler callout [begin] name=%{public}@ id=%{public}@", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v7 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v8 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v20 = 138543618;
      uint64_t v21 = v9;
      __int16 v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_1A30CD000, v8, OS_LOG_TYPE_DEFAULT, "MSVStateHandler callout [end] name=%{public}@ id=%{public}@", (uint8_t *)&v20, 0x16u);
    }

    if (v7) {
      goto LABEL_7;
    }
LABEL_15:
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!v7) {
    goto LABEL_15;
  }
LABEL_7:
  BOOL v10 = malloc_type_calloc(1uLL, [v7 length] + 200, 0x448D9139uLL);
  uint64_t v11 = v10;
  if (v10)
  {
    *BOOL v10 = 1;
    v10[1] = [v7 length];
    uint64_t v12 = [*(id *)(a1 + 32) dataUsingEncoding:4];
    char v13 = v12;
    if (v12)
    {
      id v14 = v12;
      uint64_t v15 = (const void *)[v14 bytes];
      unint64_t v16 = [v14 length];
      if (v16 >= 0x3F) {
        size_t v17 = 63;
      }
      else {
        size_t v17 = v16;
      }
      memcpy(v11 + 34, v15, v17);
    }
    id v18 = v7;
    memcpy(v11 + 50, (const void *)[v18 bytes], objc_msgSend(v18, "length"));
  }
LABEL_16:

  return v11;
}

id MSVProcessCopyMediaFrameworksDescriptions()
{
  int has_internal_content = os_variant_has_internal_content();
  id v1 = (id)MEMORY[0x1E4F1CBF0];
  if (has_internal_content)
  {
    if (MSVProcessCopyMediaFrameworksDescriptions_onceToken != -1) {
      dispatch_once(&MSVProcessCopyMediaFrameworksDescriptions_onceToken, &__block_literal_global_1931);
    }
    if (_dyld_process_info_create())
    {
      _dyld_process_info_get_state();
      MSVProcessCopyMediaFrameworksDescriptions_lastTimestamp = 0;
      size_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames, "count"));
      if (os_variant_has_internal_content()) {
        dyld_shared_cache_some_image_overridden();
      }
      uint64_t v8 = MEMORY[0x1E4F143A8];
      id v1 = v2;
      _dyld_process_info_for_each_image();
      _dyld_process_info_release();
      os_unfair_lock_lock((os_unfair_lock_t)&MSVProcessCopyMediaFrameworksDescriptions_lock);
      uint64_t v3 = objc_msgSend(v1, "copy", v8, 3221225472, __MSVProcessCopyMediaFrameworksDescriptions_block_invoke_3, &unk_1E5AD9AB0);
      pid_t v4 = (void *)MSVProcessCopyMediaFrameworksDescriptions_frameworkDescriptions;
      MSVProcessCopyMediaFrameworksDescriptions_frameworkDescriptions = v3;

      os_unfair_lock_unlock((os_unfair_lock_t)&MSVProcessCopyMediaFrameworksDescriptions_lock);
      uint64_t v5 = v1;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&MSVProcessCopyMediaFrameworksDescriptions_lock);
      uint64_t v5 = (void *)[(id)MSVProcessCopyMediaFrameworksDescriptions_frameworkDescriptions copy];
      os_unfair_lock_unlock((os_unfair_lock_t)&MSVProcessCopyMediaFrameworksDescriptions_lock);
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = v1;
      }
      id v1 = v6;
    }
  }
  return v1;
}

void sub_1A30E2904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A30E33F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A30E3464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A30E36F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A30E3794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ImageAnalyzerImageColor;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1A30E3A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A30E3C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A30E3F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception a10, std::exception a11)
{
  __cxa_free_exception(v12);
  if (a2 == 1)
  {
    __cxa_get_exception_ptr(a1);
    a11.__vftable = (std::exception_vtbl *)(MEMORY[0x1E4FBA510] + 16);
    __cxa_begin_catch(a1);
    a10.__vftable = (std::exception_vtbl *)(MEMORY[0x1E4FBA510] + 16);
    CPPExceptionToNSErrorOut(&a10, v11);
    std::exception::~exception(&a10);
    std::exception::~exception(&a11);
    __cxa_end_catch();
    JUMPOUT(0x1A30E3ED8);
  }

  _Unwind_Resume(a1);
}

uint64_t ImageAnalyzer::image_analyzer_error::image_analyzer_error(uint64_t a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  std::runtime_error::runtime_error((std::runtime_error *)a1, "")->__vftable = (std::runtime_error_vtbl *)&unk_1EF641EF0;
  va_list v23 = &a9;
  uint64_t v24 = &a9;
  int v12 = vsnprintf(0, 0, a3, &a9);
  size_t v13 = v12;
  std::string::size_type v14 = v12 + 1;
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    uint64_t v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v16 = v14 | 7;
    }
    uint64_t v17 = v16 + 1;
    uint64_t v15 = operator new(v16 + 1);
    v22.__r_.__value_.__l.__size_ = v14;
    v22.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    v22.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
    goto LABEL_8;
  }
  *((unsigned char *)&v22.__r_.__value_.__s + 23) = v12 + 1;
  uint64_t v15 = &v22;
  if (v12 != -1) {
LABEL_8:
  }
    bzero(v15, v14);
  *((unsigned char *)v15 + v14) = 0;
  if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v18 = &v22;
  }
  else {
    id v18 = (std::string *)v22.__r_.__value_.__r.__words[0];
  }
  vsnprintf((char *)v18, v13, a3, v23);
  std::runtime_error::runtime_error(&v20, &v22);
  v20.__vftable = (std::runtime_error_vtbl *)&unk_1EF641EF0;
  int v21 = a2;
  std::runtime_error::operator=((std::runtime_error *)a1, &v20);
  *(_DWORD *)(a1 + 16) = v21;
  std::runtime_error::~runtime_error(&v20);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  return a1;
}

void sub_1A30E418C(_Unwind_Exception *a1)
{
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

void CPPExceptionToNSErrorOut(const std::exception *a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28568];
    pid_t v4 = [NSString stringWithUTF8String:std::exception::what(a1)];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    *a2 = [v3 errorWithDomain:*MEMORY[0x1E4F28798] code:0 userInfo:v5];
  }
}

void sub_1A30E4290(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5AD94D0, MEMORY[0x1E4FBA1C8]);
}

void sub_1A30E4300(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void ImageAnalyzer::image_analyzer_error::~image_analyzer_error(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x1A6241B80);
}

void sub_1A30E4974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::exception a26,char a27)
{
  __cxa_free_exception(v27);
  v31 = *(void **)(v28 - 224);
  if (v31) {
    free(v31);
  }
  final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_1>::~final_act(v28 - 192);
  final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_0>::~final_act(v28 - 176);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    a26.__vftable = (std::exception_vtbl *)(MEMORY[0x1E4FBA510] + 16);
    CPPExceptionToNSErrorOut(&a26, a11);
    std::exception::~exception(&a26);
    __cxa_end_catch();
    JUMPOUT(0x1A30E4798);
  }
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)&a27);
  _Unwind_Resume(a1);
}

uint64_t MSVSignedRangeFromString(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 length] < 5) {
    goto LABEL_37;
  }
  size_t v2 = (__CFString *)v1;
  if (!ParseBracesAndCommas___braceCharacters) {
    ParseBracesAndCommas___braceCharacters = (uint64_t)CFCharacterSetCreateWithCharactersInString(0, @"{[,]}");
  }
  CFIndex v19 = 0;
  CFIndex Length = CFStringGetLength(v2);
  result.CFIndex location = 0;
  result.length = 0;
  if (Length < 1)
  {
    uint64_t v5 = 0;
    CFIndex location = -1;
  }
  else
  {
    CFIndex v4 = Length;
    uint64_t v5 = 0;
    int v6 = 0;
    CFIndex v7 = 0;
    id v18 = &v19;
    CFIndex location = -1;
    CFIndex v9 = Length;
    CFIndex v10 = -1;
    while (1)
    {
      v21.CFIndex location = v7;
      v21.length = v9;
      if (!CFStringFindCharacterFromSet(v2, (CFCharacterSetRef)ParseBracesAndCommas___braceCharacters, v21, 0, &result))break; {
      if (result.location >= v4 || result.length != 1)
      }
        break;
      int CharacterAtIndex = CFStringGetCharacterAtIndex(v2, result.location);
      if ((CharacterAtIndex & 0xFFFFFFDF) == 0x5B)
      {
        if (!v6) {
          CFIndex location = result.location;
        }
        ++v6;
      }
      else if (CharacterAtIndex == 44)
      {
        if (v6 == 1)
        {
          if (v5 <= 0)
          {
            *v18++ = result.location;
            uint64_t v5 = 1;
            int v6 = 1;
          }
          else
          {
            int v6 = 1;
            uint64_t v5 = 1;
          }
        }
      }
      else if ((CharacterAtIndex & 0xFFFFFFDF) == 0x5D && !--v6)
      {
        CFIndex v10 = result.location;
        goto LABEL_29;
      }
      if (result.location + 1 < v4)
      {
        v9 += v7 + ~result.location;
        CFIndex v7 = result.location + 1;
        if (v9 > 0) {
          continue;
        }
      }
      goto LABEL_29;
    }
  }
  CFIndex v10 = -1;
LABEL_29:
  if (location == -1 || v10 == -1 || v5 != 1 || location >= v10 || (CFIndex v13 = v19, v19 <= location + 1) || v19 >= v10 - 1)
  {

LABEL_37:
    uint64_t IntValue = 0;
    goto LABEL_38;
  }
  v22.length = v19 + ~location;
  v22.CFIndex location = location + 1;
  CFStringRef v14 = CFStringCreateWithSubstring(0, v2, v22);
  v23.CFIndex location = v13 + 1;
  v23.length = v10 + ~v13;
  CFStringRef v15 = CFStringCreateWithSubstring(0, v2, v23);

  uint64_t IntValue = CFStringGetIntValue(v14);
  CFStringGetIntValue(v15);
  CFRelease(v14);
  CFRelease(v15);
LABEL_38:

  return IntValue;
}

uint64_t MSVMediaAssetFileExtensions()
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"mp3", @"m4a", @"m4p", @"aa", @"aax", @"mp4", @"m4v", @"mov", @"m4b", @"movpkg", @"m4bpkg", 0);
}

uint64_t MSVArtworkAssetFileExtensions()
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"jpg", @"blob", @"png", @"jpeg", 0);
}

uint64_t MSVOfflineHLSFileExtensions()
{
  return objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"movpkg", @"m4bpkg", 0);
}

double *HSV2RGB(double a1, double a2, double a3, double *result, double *a5, double *a6)
{
  if (a2 > 1.0) {
    a2 = 1.0;
  }
  if (a2 >= 0.0) {
    double v6 = a2;
  }
  else {
    double v6 = 0.0;
  }
  if (a3 <= 1.0) {
    double v7 = a3;
  }
  else {
    double v7 = 1.0;
  }
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  if (v6 == 0.0)
  {
    *CFRange result = v7;
    *a5 = v7;
  }
  else
  {
    if (a1 > 1.0) {
      a1 = 1.0;
    }
    if (a1 >= 0.0) {
      double v8 = a1 * 6.0;
    }
    else {
      double v8 = 0.0;
    }
    int v9 = (int)v8;
    double v10 = v6 * v7 * (v8 - (double)(int)v8);
    double v11 = v7 - v6 * v7;
    double v12 = v11 + v10;
    if (v11 + v10 > 1.0) {
      double v12 = 1.0;
    }
    double v13 = v7 - v10;
    if (v13 > 1.0) {
      double v13 = 1.0;
    }
    double v14 = v11;
    if (v9) {
      double v15 = v13;
    }
    else {
      double v15 = v12;
    }
    if (v14 <= 1.0) {
      double v16 = v14;
    }
    else {
      double v16 = 1.0;
    }
    double v17 = v7;
    switch(v9)
    {
      case 0:
      case 5:
        break;
      case 1:
      case 4:
        double v17 = v15;
        break;
      default:
        double v17 = v16;
        break;
    }
    *CFRange result = v17;
    double v18 = v7;
    if ((v9 - 1) >= 2)
    {
      BOOL v19 = v9 == 3 || v9 == 0;
      double v18 = v15;
      if (!v19) {
        double v18 = v16;
      }
    }
    *a5 = v18;
    if ((v9 - 3) >= 2)
    {
      BOOL v20 = v9 == 5 || v9 == 2;
      double v7 = v15;
      if (!v20) {
        double v7 = v16;
      }
    }
  }
  *a6 = v7;
  return result;
}

double ITColor::CreateFromHSVDoubles(ITColor *this, double a2, double a3, double a4)
{
  double v7 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  HSV2RGB(a2, a3, a4, &v7, &v6, &v5);
  return v7;
}

double ITColor::GetHSVColor(ITColor *this)
{
  __asm { FMOV            V2.2D, #1.0 }
  float64x2_t v6 = (float64x2_t)vbslq_s8((int8x16_t)vcgeq_f64(*(float64x2_t *)&this->var0, _Q2), (int8x16_t)_Q2, *(int8x16_t *)&this->var0);
  int8x16_t v7 = vbicq_s8((int8x16_t)v6, (int8x16_t)vcltzq_f64(v6));
  if (this->var2 < 1.0) {
    double var2 = this->var2;
  }
  else {
    double var2 = 1.0;
  }
  double result = 0.0;
  if (var2 >= 0.0) {
    double v10 = var2;
  }
  else {
    double v10 = 0.0;
  }
  if (*(double *)&v7.i64[1] <= *(double *)v7.i64) {
    double v11 = *(double *)v7.i64;
  }
  else {
    double v11 = *(double *)&v7.i64[1];
  }
  if (*(double *)&v7.i64[1] >= *(double *)v7.i64) {
    double v12 = *(double *)v7.i64;
  }
  else {
    double v12 = *(double *)&v7.i64[1];
  }
  if (v10 <= *(double *)v7.i64) {
    double v13 = *(double *)v7.i64;
  }
  else {
    double v13 = v10;
  }
  if (v10 >= *(double *)v7.i64) {
    double v14 = *(double *)v7.i64;
  }
  else {
    double v14 = v10;
  }
  if (*(double *)&v7.i64[1] <= v10) {
    double v11 = v13;
  }
  if (*(double *)&v7.i64[1] >= v10) {
    double v12 = v14;
  }
  if (v11 != 0.0)
  {
    double v15 = v11 - v12;
    if (v15 / v11 > 1.0 || v15 / v11 != 0.0)
    {
      if (v15 == 0.0)
      {
        double v16 = 0.0;
        double v17 = 0.0;
      }
      else
      {
        double result = (v11 - *(double *)v7.i64) / v15;
        double v16 = (v11 - *(double *)&v7.i64[1]) / v15;
        double v17 = (v11 - v10) / v15;
      }
      if (*(double *)v7.i64 == v11)
      {
        double v18 = v17 - v16;
      }
      else if (*(double *)&v7.i64[1] == v11)
      {
        double v18 = result + 2.0 - v17;
      }
      else
      {
        double v18 = v16 + 4.0 - result;
      }
      double result = v18 / 6.0;
      if (result < 0.0) {
        double result = result + 1.0;
      }
      if (result > 1.0) {
        return 1.0;
      }
    }
  }
  return result;
}

void ITColor::GetLuminance(ITColor *this, __n128 a2, double a3)
{
  uint64_t v3 = 0;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  __n128 v6 = a2;
  double v7 = a3;
  do
  {
    double v4 = v6.n128_f64[v3];
    if (v4 <= 0.0392800011) {
      double v5 = v4 / 12.9200001;
    }
    else {
      double v5 = pow((v4 + 0.0549999997) / 1.05499995, 2.4);
    }
    v6.n128_f64[v3++] = v5;
  }
  while (v3 != 3);
}

void sub_1A30EA398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1A30EAAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
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

os_log_t _MSVLogCategoryStreamReader()
{
  os_log_t v0 = os_log_create("com.apple.amp.MediaServices", "StreamReader");
  return v0;
}

os_log_t _MSVLogCategoryStreamWriter()
{
  os_log_t v0 = os_log_create("com.apple.amp.MediaServices", "StreamWriter");
  return v0;
}

os_log_t _MSVLogCategoryQuickRelay()
{
  os_log_t v0 = os_log_create("com.apple.amp.MediaServices", "QuickRelay");
  return v0;
}

os_log_t _MSVLogCategoryLyricsTTMLParser()
{
  os_log_t v0 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
  return v0;
}

os_log_t _MSVLogCategorySQL()
{
  os_log_t v0 = os_log_create("com.apple.amp.MediaServices", "SQL");
  return v0;
}

__CFString *NSStringFromMSVErrorCode(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      size_t v2 = @"MissingDependency";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
      size_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    size_t v2 = @"Unknown";
  }
  return v2;
}

__CFString *NSStringFromMSVHasherErrorCode(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5AD98A0[a1];
  }
  return v1;
}

__CFString *NSStringFromMSVSQLDatabaseErrorCode(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnknownCode/%lld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5AD98B8[a1];
  }
  return v1;
}

void ___Z19CGColorSpaceGetSRGBv_block_invoke()
{
  os_log_t v0 = ColorSyncProfileCreateWithName((CFStringRef)*MEMORY[0x1E4F1A788]);
  if (v0)
  {
    uint64_t v1 = v0;
    CFDataRef v2 = ColorSyncProfileCopyData(v0, 0);
    if (v2)
    {
      CFDataRef v3 = v2;
      CGColorSpaceGetSRGB(void)::sSpace = MEMORY[0x1A62416E0]();
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

void ImageAnalyzer::~ImageAnalyzer(ImageAnalyzer *this)
{
  CFDataRef v2 = *(void **)this;
  if (v2)
  {
    free(v2);
    *(void *)this = 0;
  }
  CFDataRef v3 = (void *)*((void *)this + 1);
  if (v3)
  {
    free(v3);
    *((void *)this + 1) = 0;
  }
  double v4 = (void *)*((void *)this + 43);
  if (v4)
  {
    *((void *)this + 44) = v4;
    operator delete(v4);
  }
  double v5 = (void *)*((void *)this + 40);
  if (v5)
  {
    *((void *)this + 41) = v5;
    operator delete(v5);
  }
}

void ImageAnalyzer::QuantizeColorMaps(ImageAnalyzer *this)
{
  CFDataRef v2 = malloc_type_calloc(0x190uLL, 8uLL, 0x100004000313F17uLL);
  *((void *)this + 1) = v2;
  if (!v2)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 1, "ImageAnalyzer::QuantizeColorMaps() - failed to allocate mColorCounts.", v61, v62, v63, v64, v65, v71);
    goto LABEL_71;
  }
  CFDataRef v3 = malloc_type_calloc(0x190uLL, 1uLL, 0x100004077774924uLL);
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 1, "ImageAnalyzer::QuantizeColorMaps() - failed to allocate completedIndexes.", v66, v67, v68, v69, v70, v71);
LABEL_71:
  }
  double v4 = v3;
  v72 = 0;
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  for (unint64_t i = 0; i != 400; ++i)
  {
    if (!v4[i])
    {
      uint64_t v8 = *(void *)this + 40 * i;
      long long v9 = *(_OWORD *)(v8 + 16);
      *(_OWORD *)&v83.var0 = *(_OWORD *)v8;
      *(_OWORD *)&v83.double var2 = v9;
      uint64_t v84 = *(void *)(v8 + 32);
      if (*(double *)(v8 + 32) >= 127.0)
      {
        long long v10 = *(_OWORD *)(v8 + 16);
        long long v80 = *(_OWORD *)v8;
        long long v81 = v10;
        uint64_t v82 = *(void *)(v8 + 32);
        double v11 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)(i - 20 * ((unsigned __int16)i / 0x14u)), (unsigned __int16)i / 0x14u);
        if (v6 >= (unint64_t)v72)
        {
          unint64_t v14 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)&v72[-v6] >> 3);
          if (v14 <= 1) {
            unint64_t v14 = 1;
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)&v72[-v6] >> 3)) >= 0x249249249249249) {
            unint64_t v15 = 0x492492492492492;
          }
          else {
            unint64_t v15 = v14;
          }
          double v16 = std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(v15);
          long long v18 = v81;
          *double v16 = v80;
          v16[1] = v18;
          *((void *)v16 + 4) = v82;
          *((void *)v16 + 5) = i;
          *((double *)v16 + 6) = v11;
          if (v6 == v5)
          {
            CFRange v23 = (char *)v16;
          }
          else
          {
            BOOL v19 = v16;
            do
            {
              long long v20 = *(_OWORD *)(v6 - 56);
              long long v21 = *(_OWORD *)(v6 - 40);
              long long v22 = *(_OWORD *)(v6 - 24);
              CFRange v23 = (char *)v19 - 56;
              *((void *)v19 - 1) = *(void *)(v6 - 8);
              *(_OWORD *)((char *)v19 - 24) = v22;
              *(_OWORD *)((char *)v19 - 40) = v21;
              *(_OWORD *)((char *)v19 - 56) = v20;
              v6 -= 56;
              BOOL v19 = (_OWORD *)((char *)v19 - 56);
            }
            while (v6 != v5);
          }
          v72 = (char *)v16 + 56 * v17;
          unint64_t v6 = (unint64_t)v16 + 56;
          if (v5) {
            operator delete((void *)v5);
          }
          unint64_t v5 = (unint64_t)v23;
        }
        else
        {
          long long v12 = *(_OWORD *)(v8 + 16);
          uint64_t v13 = *(void *)(v8 + 32);
          *(_OWORD *)unint64_t v6 = *(_OWORD *)v8;
          *(_OWORD *)(v6 + 16) = v12;
          *(void *)(v6 + 32) = v13;
          *(void *)(v6 + 40) = i;
          *(double *)(v6 + 48) = v11;
          v6 += 56;
        }
        *(double *)(*((void *)this + 1) + 8 * i) = v11;
        v4[i] = 1;
        unint64_t v24 = i;
        if (i <= 0x18E)
        {
          do
          {
            if (!v4[++v24])
            {
              if (*(double *)(*(void *)this + 40 * v24 + 32) >= 127.0)
              {
                uint64_t v25 = *(void *)this + 40 * v24;
                ITColor v78 = v83;
                uint64_t v79 = v84;
                long long v26 = *(_OWORD *)(v25 + 16);
                v76[0] = *(_OWORD *)v25;
                v76[1] = v26;
                uint64_t v77 = *(void *)(v25 + 32);
                if (!isCloseToColor(&v78, (double *)v76, 0, 0.0799999982)) {
                  continue;
                }
                long long v73 = *(_OWORD *)v25;
                long long v74 = *(_OWORD *)(v25 + 16);
                uint64_t v75 = *(void *)(v25 + 32);
                double v27 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)(v24 - 20 * ((unsigned __int16)v24 / 0x14u)), (unsigned __int16)v24 / 0x14u);
                unint64_t v28 = v6;
                if (v6 == v5)
                {
LABEL_34:
                  if (v6 >= (unint64_t)v72)
                  {
                    uint64_t v37 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v28) >> 3);
                    unint64_t v38 = v37 + 1;
                    if ((unint64_t)(v37 + 1) > 0x492492492492492) {
                      std::vector<ITColor>::__throw_length_error[abi:ne180100]();
                    }
                    unint64_t v39 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)&v72[-v28] >> 3);
                    if (2 * v39 > v38) {
                      unint64_t v38 = 2 * v39;
                    }
                    if (v39 >= 0x249249249249249) {
                      unint64_t v40 = 0x492492492492492;
                    }
                    else {
                      unint64_t v40 = v38;
                    }
                    if (v40) {
                      unint64_t v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(v40);
                    }
                    else {
                      uint64_t v41 = 0;
                    }
                    unint64_t v42 = v40 + 56 * v37;
                    *(_OWORD *)unint64_t v42 = v73;
                    *(_OWORD *)(v42 + 16) = v74;
                    *(void *)(v42 + 32) = v75;
                    *(void *)(v42 + 40) = v24;
                    *(double *)(v42 + 48) = v27;
                    if (v6 == v5)
                    {
                      v47 = (void *)v6;
                      unint64_t v5 = v40 + 56 * v37;
                    }
                    else
                    {
                      unint64_t v43 = v40 + 56 * v37;
                      do
                      {
                        long long v44 = *(_OWORD *)(v6 - 56);
                        long long v45 = *(_OWORD *)(v6 - 40);
                        long long v46 = *(_OWORD *)(v6 - 24);
                        *(void *)(v43 - 8) = *(void *)(v6 - 8);
                        *(_OWORD *)(v43 - 24) = v46;
                        *(_OWORD *)(v43 - 40) = v45;
                        *(_OWORD *)(v43 - 56) = v44;
                        v43 -= 56;
                        v6 -= 56;
                      }
                      while (v6 != v5);
                      v47 = (void *)v5;
                      unint64_t v5 = v43;
                    }
                    v72 = (char *)(v40 + 56 * v41);
                    unint64_t v6 = v42 + 56;
                    if (v47) {
                      operator delete(v47);
                    }
                  }
                  else
                  {
                    long long v35 = *(_OWORD *)(v25 + 16);
                    uint64_t v36 = *(void *)(v25 + 32);
                    *(_OWORD *)unint64_t v6 = *(_OWORD *)v25;
                    *(_OWORD *)(v6 + 16) = v35;
                    *(void *)(v6 + 32) = v36;
                    *(void *)(v6 + 40) = v24;
                    *(double *)(v6 + 48) = v27;
                    v6 += 56;
                  }
                }
                else
                {
                  uint64_t v29 = 0;
                  if ((unint64_t)((uint64_t)(v6 - v5) / 56) <= 1) {
                    uint64_t v30 = 1;
                  }
                  else {
                    uint64_t v30 = (uint64_t)(v6 - v5) / 56;
                  }
                  unint64_t v31 = v5;
                  while (1)
                  {
                    long long v32 = *(_OWORD *)(v25 + 16);
                    *(_OWORD *)&v87.var0 = *(_OWORD *)v25;
                    *(_OWORD *)&v87.double var2 = v32;
                    uint64_t v88 = *(void *)(v25 + 32);
                    long long v34 = *(_OWORD *)v31;
                    long long v33 = *(_OWORD *)(v31 + 16);
                    uint64_t v86 = *(void *)(v31 + 32);
                    v85[0] = v34;
                    v85[1] = v33;
                    if (isCloseToColor(&v87, (double *)v85, 0, 0.0799999982)) {
                      break;
                    }
                    ++v29;
                    v31 += 56;
                    if (v30 == v29)
                    {
                      unint64_t v28 = v5;
                      goto LABEL_34;
                    }
                  }
                  *(double *)(v5 + 56 * v29 + 48) = v27 + *(double *)(v5 + 56 * v29 + 48);
                }
              }
              v4[v24] = 1;
            }
          }
          while (v24 != 399);
        }
        int64_t v48 = v6 - v5;
        if (v6 != v5)
        {
          unint64_t v49 = v48 / 56;
          *(void *)&v87.var0 = CompareQuantizeSortcolor;
          std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(v5, v6, (uint64_t (**)(long long *, long long *))&v87, 126 - 2 * __clz(v48 / 56), 1);
          uint64_t v50 = *(void *)(v5 + 40);
          double v51 = *(double *)(v5 + 48);
          if (v49 >= 2)
          {
            unint64_t v52 = v49 - 1;
            v53 = (double *)(v5 + 104);
            do
            {
              uint64_t v54 = *((void *)v53 - 1);
              double v55 = *v53;
              if (!v4[v54]) {
                v4[v54] = 1;
              }
              double v51 = v51 + v55;
              uint64_t v56 = *(void *)this + 40 * v50;
              long long v57 = *(_OWORD *)v56;
              long long v58 = *(_OWORD *)(v56 + 16);
              uint64_t v59 = *(void *)this + 40 * v54;
              *(void *)(v59 + 32) = *(void *)(v56 + 32);
              *(_OWORD *)uint64_t v59 = v57;
              *(_OWORD *)(v59 + 16) = v58;
              v53 += 7;
              --v52;
            }
            while (v52);
          }
          *(double *)(*((void *)this + 1) + 8 * v50) = v51;
          unint64_t v6 = v5;
        }
      }
    }
  }
  if (v5) {
    operator delete((void *)v5);
  }
  free(v4);
}

void sub_1A30EF3FC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ImageAnalyzer::PickBackgroundColor(ImageAnalyzer *this)
{
  double v2 = *((double *)this + 47);
  CFDataRef v3 = ImageAnalyzer::DominantColors((ITColor *)this);
  double v4 = *v3;
  if (v3[1] != *v3)
  {
    unint64_t v5 = v3;
    long long v6 = v4[1];
    *((_OWORD *)this + 2) = *v4;
    *((_OWORD *)this + 3) = v6;
    ITColor::GetLuminance((ITColor *)v3, *((__n128 *)this + 2), *((double *)this + 6));
    double v9 = v8;
    double v10 = v8 + 0.0500000007;
    if (v9 <= 0.180000007) {
      double v11 = 0.230000008;
    }
    else {
      double v11 = v10;
    }
    if (v9 <= 0.180000007) {
      double v12 = v10;
    }
    else {
      double v12 = 0.230000008;
    }
    double v13 = v11 / v12;
    if (v11 / v12 < 1.29999995)
    {
      unint64_t v14 = ((unsigned char *)v5[1] - (unsigned char *)*v5) >> 5;
      if (v14 >= 3) {
        unint64_t v14 = 3;
      }
      if (v14 >= 2)
      {
        uint64_t v15 = 0;
        double v16 = (double *)*((void *)this + 43);
        uint64_t v17 = 8 * v14;
        uint64_t v18 = 8;
        do
        {
          double v19 = v16[(unint64_t)v18 / 8];
          if (v19 <= 0.0) {
            break;
          }
          double v20 = *v16 / v19;
          if (v20 <= 0.9 || v20 >= 1.112) {
            break;
          }
          long long v21 = (__n128 *)((char *)*v5 + v15);
          __n128 v23 = v21[2];
          long long v22 = v21 + 2;
          ITColor::GetLuminance(v7, v23, v22[1].n128_f64[0]);
          double v25 = v24 + 0.0500000007;
          BOOL v26 = v24 <= 0.180000007;
          if (v24 <= 0.180000007) {
            double v27 = 0.230000008;
          }
          else {
            double v27 = v24 + 0.0500000007;
          }
          if (!v26) {
            double v25 = 0.230000008;
          }
          double v28 = v27 / v25;
          if (v28 > v13)
          {
            __n128 v29 = v22[1];
            *((__n128 *)this + 2) = *v22;
            *((__n128 *)this + 3) = v29;
            double v13 = v28;
          }
          v18 += 8;
          v15 += 32;
        }
        while (v17 != v18);
        ITColor::GetLuminance(v7, *((__n128 *)this + 2), *((double *)this + 6));
        double v9 = v30;
        double v10 = v30 + 0.0500000007;
      }
    }
    if (v9 <= 0.180000007) {
      double v31 = 0.230000008;
    }
    else {
      double v31 = v10;
    }
    if (v9 > 0.180000007) {
      double v10 = 0.230000008;
    }
    if (v31 / v10 < 1.29999995)
    {
      BOOL v32 = v2 >= 0.180000007;
      double HSVColor = ITColor::GetHSVColor((ITColor *)this + 1);
      BOOL v36 = v9 >= 0.180000007;
      if (!v32 || !v36) {
        double v34 = v34 * 1.10000002;
      }
      double v40 = 0.0;
      double v41 = 0.0;
      if (!v32 || !v36) {
        double v35 = v35 * 0.800000012;
      }
      double v39 = 0.0;
      HSV2RGB(HSVColor, v34, v35, &v41, &v40, &v39);
      double v37 = v40;
      double v38 = v39;
      *((double *)this + 4) = v41;
      *((double *)this + 5) = v37;
      *((double *)this + 6) = v38;
      *((void *)this + 7) = 0x3FF0000000000000;
    }
  }
}

void ImageAnalyzer::PickTextColors(ImageAnalyzer *this)
{
  double v2 = ImageAnalyzer::DominantColors((ITColor *)this);
  CFDataRef v3 = (__n128 *)*v2;
  unint64_t v4 = (unsigned char *)v2[1] - (unsigned char *)*v2;
  unint64_t v5 = v4 >> 5;
  long long v6 = (double *)&unk_1A312B000;
  double v7 = (double *)&unk_1A312B000;
  if ((v4 >> 5) <= 1)
  {
    BOOL v47 = 0;
    char v48 = 0;
    __n128 v49 = *((__n128 *)this + 2);
    double v41 = *((double *)this + 5);
    goto LABEL_52;
  }
  __n128 v110 = *((__n128 *)this + 2);
  double v109 = *((double *)this + 6);
  ITColor::GetLuminance((ITColor *)v2, v110, v109);
  double v9 = v8;
  ITColor::GetLuminance(v10, v3[2], v3[3].n128_f64[0]);
  uint64_t v13 = 0;
  int v14 = 0;
  if (v12 <= v9) {
    double v15 = v9;
  }
  else {
    double v15 = v12;
  }
  if (v12 > v9) {
    double v12 = v9;
  }
  double v16 = (v15 + 0.0500000007) / (v12 + 0.0500000007);
  unint64_t v17 = (v4 >> 5);
  uint64_t v18 = &v3[1].n128_f64[1];
  unsigned int v19 = 1;
  unsigned int v108 = v5;
  unsigned int v20 = v5;
  unsigned int v21 = 1;
  double v22 = v16;
  do
  {
    __n128 v23 = *(__n128 *)(v18 - 3);
    double v24 = *(v18 - 1);
    if ((v14 & 1) == 0)
    {
      double v25 = *v18;
      long long v112 = *(_OWORD *)(v18 - 3);
      ITColor::GetLuminance(v11, v23, v24);
      if (v26 >= 0.180000007 == v9 >= 0.180000007)
      {
        __n128 v23 = (__n128)v112;
      }
      else
      {
        if (v26 <= v9) {
          double v27 = v9;
        }
        else {
          double v27 = v26;
        }
        if (v26 > v9) {
          double v26 = v9;
        }
        BOOL v28 = (v27 + 0.0500000007) / (v26 + 0.0500000007) < 4.5999999;
        __n128 v23 = (__n128)v112;
        if (!v28)
        {
          v114.double var1 = *((double *)&v112 + 1);
          v121.double var3 = *((double *)this + 7);
          *(void *)&v121.double var0 = v110.n128_u64[0];
          *(void *)&v114.double var0 = v112;
          v114.double var2 = v24;
          v114.double var3 = v25;
          v121.double var2 = v109;
          *(void *)&v121.double var1 = v110.n128_u64[1];
          ImageAnalyzer::EnhanceContrastWithColor(v114, v121, 0.449999988);
          *((void *)this + 8) = v29;
          *((void *)this + 9) = v30;
          __n128 v23 = (__n128)v112;
          *((void *)this + 10) = v31;
          *((void *)this + 11) = v32;
          unsigned int v20 = v13 + 1;
          int v14 = 1;
        }
      }
    }
    ITColor::GetLuminance(v11, v23, v24);
    if (v33 <= v9) {
      double v34 = v9;
    }
    else {
      double v34 = v33;
    }
    if (v33 > v9) {
      double v33 = v9;
    }
    double v35 = (v34 + 0.0500000007) / (v33 + 0.0500000007);
    if (v35 <= v22)
    {
      double v35 = v16;
    }
    else if (v35 <= v16)
    {
      double v22 = v35;
      double v35 = v16;
      unsigned int v21 = v13;
    }
    else
    {
      double v22 = v16;
      unsigned int v21 = v19;
      unsigned int v19 = v13;
    }
    ++v13;
    v18 += 4;
    double v16 = v35;
  }
  while (v17 != v13);
  if (v20 >= v108)
  {
    int v46 = 0;
    double v38 = *((double *)this + 7);
    if (v14)
    {
      long long v6 = (double *)&unk_1A312B000;
      double v40 = v109;
      double v41 = v110.n128_f64[1];
LABEL_47:
      double v7 = (double *)&unk_1A312B000;
      goto LABEL_48;
    }
    LOBYTE(v36) = 1;
    double v40 = v109;
    double v41 = v110.n128_f64[1];
  }
  else
  {
    int v36 = 0;
    uint64_t v37 = v20;
    double v38 = *((double *)this + 7);
    uint64_t v39 = (uint64_t)&v3[2 * v20 + 1];
    double v40 = v109;
    double v41 = v110.n128_f64[1];
    while (1)
    {
      double v42 = *(double *)(v39 - 16);
      double v43 = *(double *)(v39 - 8);
      double v44 = *(double *)v39;
      double v45 = *(double *)(v39 + 8);
      v115.double var0 = v42;
      v115.double var1 = v43;
      v115.double var2 = *(double *)v39;
      v115.double var3 = v45;
      *(__n128 *)&v122.double var0 = v110;
      v122.double var2 = v109;
      v122.double var3 = v38;
      LODWORD(v11) = contrastsEnoughWithColor(v115, v122, v11);
      if (v11) {
        break;
      }
      int v36 = ++v37 >= v17;
      v39 += 32;
      if (v17 == v37)
      {
        int v46 = 0;
        if ((v14 & 1) == 0)
        {
          LOBYTE(v36) = 1;
          goto LABEL_40;
        }
        long long v6 = (double *)&unk_1A312B000;
        goto LABEL_47;
      }
    }
    v116.double var0 = v42;
    v116.double var1 = v43;
    v116.double var2 = v44;
    v116.double var3 = v45;
    *(__n128 *)&v123.double var0 = v110;
    v123.double var2 = v109;
    v123.double var3 = v38;
    ImageAnalyzer::EnhanceContrastWithColor(v116, v123, 0.449999988);
    *((void *)this + 12) = v50;
    *((void *)this + 13) = v51;
    *((void *)this + 14) = v52;
    *((void *)this + 15) = v53;
    if (v14 & ~v36)
    {
      char v48 = 1;
      int v46 = 1;
      long long v6 = (double *)&unk_1A312B000;
      __n128 v49 = v110;
      LODWORD(v5) = v108;
      double v7 = (double *)&unk_1A312B000;
      goto LABEL_51;
    }
    int v46 = 1;
    if (v14) {
      goto LABEL_42;
    }
  }
LABEL_40:
  *(void *)&v124.double var0 = v110.n128_u64[0];
  v124.double var1 = v41;
  v124.double var2 = v40;
  v124.double var3 = v38;
  ImageAnalyzer::EnhanceContrastWithColor(*(ITColor *)v3[2 * v19].n128_u64, v124, 0.200000003);
  double var0 = v117.var0;
  double var1 = v117.var1;
  double var2 = v117.var2;
  double var3 = v117.var3;
  *(void *)&v125.double var0 = v110.n128_u64[0];
  v125.double var1 = v41;
  v125.double var2 = v40;
  v125.double var3 = v38;
  double v2 = (void **)contrastsEnoughWithColor(v117, v125, v58);
  if (v2)
  {
    v118.double var0 = var0;
    v118.double var1 = var1;
    v118.double var2 = var2;
    v118.double var3 = var3;
    *(void *)&v126.double var0 = v110.n128_u64[0];
    v126.double var1 = v41;
    v126.double var2 = v40;
    v126.double var3 = v38;
    ImageAnalyzer::EnhanceContrastWithColor(v118, v126, 0.449999988);
    *((void *)this + 8) = v59;
    *((void *)this + 9) = v60;
    *((void *)this + 10) = v61;
    *((void *)this + 11) = v62;
    LOBYTE(v14) = 1;
  }
LABEL_42:
  long long v6 = (double *)&unk_1A312B000;
  double v7 = (double *)&unk_1A312B000;
  if (v36)
  {
LABEL_48:
    *(void *)&v127.double var0 = v110.n128_u64[0];
    v127.double var1 = v41;
    v127.double var2 = v40;
    v127.double var3 = v38;
    ImageAnalyzer::EnhanceContrastWithColor(*(ITColor *)v3[2 * v21].n128_u64, v127, 0.200000003);
    double v63 = v119.var0;
    double v64 = v119.var1;
    double v65 = v119.var2;
    double v66 = v119.var3;
    *(void *)&v128.double var0 = v110.n128_u64[0];
    v128.double var1 = v41;
    v128.double var2 = v40;
    v128.double var3 = v38;
    double v2 = (void **)contrastsEnoughWithColor(v119, v128, v67);
    if (v2)
    {
      v120.double var0 = v63;
      v120.double var1 = v64;
      v120.double var2 = v65;
      v120.double var3 = v66;
      *(void *)&v129.double var0 = v110.n128_u64[0];
      v129.double var1 = v41;
      v129.double var2 = v40;
      v129.double var3 = v38;
      ImageAnalyzer::EnhanceContrastWithColor(v120, v129, 0.449999988);
      *((void *)this + 12) = v68;
      *((void *)this + 13) = v69;
      *((void *)this + 14) = v70;
      *((void *)this + 15) = v71;
      int v46 = 1;
    }
  }
  char v48 = v14;
  __n128 v49 = v110;
  LODWORD(v5) = v108;
LABEL_51:
  BOOL v47 = v46 != 0;
LABEL_52:
  double v111 = v49.n128_f64[0];
  long long v113 = *((_OWORD *)this + 3);
  ITColor::GetLuminance((ITColor *)v2, v49, *(double *)&v113);
  double v73 = v72;
  long long v74 = (__n128 *)((char *)this + 64);
  double v75 = *((double *)this + 10);
  ITColor::GetLuminance(v76, *((__n128 *)this + 4), v75);
  double v78 = v77;
  uint64_t v79 = (__n128 *)((char *)this + 96);
  double v80 = *((double *)this + 14);
  ITColor::GetLuminance(v81, *((__n128 *)this + 6), v80);
  double v84 = v7[262];
  if (v73 < v84)
  {
    if (v78 >= v84) {
      char v89 = v48;
    }
    else {
      char v89 = 0;
    }
    BOOL v90 = v83 >= v84 && v47;
    if (v89)
    {
      if (v90) {
        goto LABEL_84;
      }
      if (v5)
      {
        double v91 = v111;
        double v92 = *(double *)&v113;
LABEL_78:
        double v94 = v91 * 0.100000001 + 0.899999999;
        double v95 = v41 * 0.100000001 + 0.899999999;
        double v80 = v92 * 0.100000001 + 0.899999999;
        double v96 = *((double *)&v113 + 1) * 0.100000001 + 0.899999999;
        goto LABEL_83;
      }
    }
    else
    {
      if (v5)
      {
        double v97 = v6[283];
        double v91 = v111;
        double v92 = *(double *)&v113;
        double v75 = *(double *)&v113 * v97 + 0.949999999;
        *((double *)this + 8) = v111 * v97 + 0.949999999;
        *((double *)this + 9) = v41 * v97 + 0.949999999;
        *((double *)this + 10) = v75;
        *((double *)this + 11) = *((double *)&v113 + 1) * v97 + 0.949999999;
        if (v90) {
          goto LABEL_84;
        }
        goto LABEL_78;
      }
      *((void *)this + 8) = 0x3FF0000000000000;
      *((void *)this + 9) = 0x3FF0000000000000;
      *((void *)this + 10) = 0x3FF0000000000000;
      *((void *)this + 11) = 0x3FF0000000000000;
      double v75 = 1.0;
      if (v90) {
        goto LABEL_84;
      }
    }
    double v94 = 1.0;
    double v95 = 1.0;
    double v80 = 1.0;
    double v96 = 1.0;
    goto LABEL_83;
  }
  if (v78 < v84) {
    char v85 = v48;
  }
  else {
    char v85 = 0;
  }
  BOOL v86 = v83 < v84 && v47;
  if ((v85 & 1) == 0)
  {
    if (v5)
    {
      double v93 = v6[283];
      double v87 = v111;
      double v88 = *(double *)&v113;
      double v75 = *(double *)&v113 * v93 + 0.0;
      *((double *)this + 8) = v111 * v93 + 0.0;
      *((double *)this + 9) = v41 * v93 + 0.0;
      *((double *)this + 10) = v75;
      *((double *)this + 11) = *((double *)&v113 + 1) * v93 + 0.949999999;
      if (v86) {
        goto LABEL_84;
      }
      goto LABEL_75;
    }
    *((void *)this + 8) = 0;
    *((void *)this + 9) = 0;
    *((void *)this + 10) = 0;
    *((void *)this + 11) = 0x3FF0000000000000;
    double v75 = 0.0;
    if (v86) {
      goto LABEL_84;
    }
LABEL_80:
    double v96 = 1.0;
    double v94 = 0.0;
    double v95 = 0.0;
    double v80 = 0.0;
    goto LABEL_83;
  }
  if (v86) {
    goto LABEL_84;
  }
  if (!v5) {
    goto LABEL_80;
  }
  double v87 = v111;
  double v88 = *(double *)&v113;
LABEL_75:
  double v94 = v87 * 0.100000001 + 0.0;
  double v95 = v41 * 0.100000001 + 0.0;
  double v80 = v88 * 0.100000001 + 0.0;
  double v96 = *((double *)&v113 + 1) * 0.100000001 + 0.899999999;
LABEL_83:
  *((double *)this + 12) = v94;
  *((double *)this + 13) = v95;
  *((double *)this + 14) = v80;
  *((double *)this + 15) = v96;
LABEL_84:
  ITColor::GetLuminance(v82, *v74, v75);
  if (v99 <= v73) {
    double v100 = v73;
  }
  else {
    double v100 = v99;
  }
  if (v99 > v73) {
    double v99 = v73;
  }
  double v101 = v6[283];
  double v102 = (v100 + v101) / (v99 + v101);
  ITColor::GetLuminance(v98, *v79, v80);
  if (v103 <= v73) {
    double v104 = v73;
  }
  else {
    double v104 = v103;
  }
  if (v103 > v73) {
    double v103 = v73;
  }
  if ((v104 + v101) / (v103 + v101) > v102)
  {
    __n128 v106 = *v74;
    long long v105 = *((_OWORD *)this + 5);
    long long v107 = *((_OWORD *)this + 7);
    *long long v74 = *v79;
    *((_OWORD *)this + 5) = v107;
    *uint64_t v79 = v106;
    *((_OWORD *)this + 7) = v105;
  }
}

void ImageAnalyzer::DoPostImageAnalysis(ImageAnalyzer *this, ITColor *a2, ITColor *a3)
{
  CFDataRef v3 = (__n128 *)((char *)this + 32);
  float64x2_t v4 = *((float64x2_t *)this + 2);
  float64x2_t v5 = (float64x2_t)vdupq_n_s64(0x3FE9999998000000uLL);
  float64x2_t v7 = *((float64x2_t *)this + 3);
  __n128 v6 = *((__n128 *)this + 4);
  float64x2_t v8 = (float64x2_t)vdupq_n_s64(0x3FC99999A0000000uLL);
  float64x2_t v9 = *((float64x2_t *)this + 5);
  float64x2_t v10 = *((float64x2_t *)this + 6);
  float64x2_t v11 = vmlaq_f64(vmulq_f64(v9, v5), v8, v7);
  *((float64x2_t *)this + 8) = vmlaq_f64(vmulq_f64((float64x2_t)v6, v5), v8, v4);
  *((float64x2_t *)this + 9) = v11;
  float64x2_t v34 = *((float64x2_t *)this + 7);
  double v35 = v11.f64[0];
  float64x2_t v36 = vmlaq_f64(vmulq_f64(v34, v5), v8, v7);
  *((float64x2_t *)this + 10) = vmlaq_f64(vmulq_f64(v10, v5), v8, v4);
  *((float64x2_t *)this + 11) = v36;
  ImageAnalyzer::CalculateOneShadowColor((ITColor *)this + 1, a2, a3, v6, v9.f64[0]);
  v3[10].n128_u64[0] = v12;
  v3[10].n128_u64[1] = v13;
  v3[11].n128_u64[0] = v14;
  v3[11].n128_u64[1] = v15;
  ImageAnalyzer::CalculateOneShadowColor((ITColor *)v3, v16, v17, v3[4], v34.f64[0]);
  v3[14].n128_u64[0] = v18;
  v3[14].n128_u64[1] = v19;
  v3[15].n128_u64[0] = v20;
  v3[15].n128_u64[1] = v21;
  ImageAnalyzer::CalculateOneShadowColor((ITColor *)v3, v22, v23, v3[6], v35);
  v3[12].n128_u64[0] = v24;
  v3[12].n128_u64[1] = v25;
  v3[13].n128_u64[0] = v26;
  v3[13].n128_u64[1] = v27;
  ImageAnalyzer::CalculateOneShadowColor((ITColor *)v3, v28, v29, v3[8], v36.f64[0]);
  v3[16].n128_u64[0] = v30;
  v3[16].n128_u64[1] = v31;
  v3[17].n128_u64[0] = v32;
  v3[17].n128_u64[1] = v33;
}

void ImageAnalyzer::CalculateOneShadowColor(ITColor *this, ITColor *a2, ITColor *a3, __n128 a4, double a5)
{
  ITColor::GetLuminance(this, a4, a5);
  double v7 = v6;
  ITColor::GetLuminance(v8, *(__n128 *)&this->var0, this->var2);
  if (v7 >= v10) {
    double v11 = 0.0;
  }
  else {
    double v11 = 1.0;
  }
  ITColor::GetLuminance(v9, (__n128)vdupq_lane_s64(*(uint64_t *)&v11, 0), v11);
}

void **ImageAnalyzer::DominantColors(ITColor *this)
{
  uint64_t v1 = (void **)&this[10];
  if (*(void *)&this[10].var1 == *(void *)&this[10].var0)
  {
    double v2 = this;
    CFDataRef v3 = 0;
    n128_f64 = 0;
    float64x2_t v5 = 0;
    uint64_t v6 = 0;
    double v7 = 1.0;
    __asm { FMOV            V0.2D, #1.0 }
    unint64_t v103 = *((void *)&_Q0 + 1);
    do
    {
      double v13 = *(double *)(*(void *)&v2->var1 + 8 * v6);
      if (v13 >= v7 && *(double *)(*(void *)&v2->var0 + 40 * v6 + 32) >= 127.0)
      {
        uint64_t v14 = *(void *)&v2->var0 + 40 * v6;
        v15.n128_f64[0] = ITColor::CreateFromHSVDoubles(this, *(double *)v14, *(double *)(v14 + 8), *(double *)(v14 + 16));
        v15.n128_u64[1] = v17;
        __n128 v107 = v15;
        v15.n128_u64[1] = v103;
        v15.n128_f64[0] = v16;
        __n128 v106 = v15;
        unint64_t v18 = *(void *)(v14 + 24);
        unint64_t v19 = (char *)n128_f64;
        uint64_t v20 = (char *)n128_f64 - v5;
        if (n128_f64 == (double *)v5)
        {
LABEL_13:
          if (n128_f64 >= (double *)v3)
          {
            uint64_t v40 = ((char *)n128_f64 - v19) >> 6;
            unint64_t v41 = v40 + 1;
            if ((unint64_t)(v40 + 1) >> 58) {
              std::vector<ITColor>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v42 = (char *)v3 - v19;
            if (v42 >> 5 > v41) {
              unint64_t v41 = v42 >> 5;
            }
            if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFC0) {
              unint64_t v43 = 0x3FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v43 = v41;
            }
            if (v43)
            {
              if (v43 >> 58) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              this = (ITColor *)operator new(v43 << 6);
            }
            else
            {
              this = 0;
            }
            double v44 = (__n128 *)&this[2 * v40];
            v44->n128_f64[0] = v13;
            v44[1] = v107;
            v44[2] = v106;
            v44[3].n128_u64[0] = v18;
            if (n128_f64 == (double *)v5)
            {
              __n128 v49 = n128_f64;
              float64x2_t v5 = (char *)&this[2 * v40];
            }
            else
            {
              double v45 = &this[2 * v40];
              do
              {
                long long v46 = *((_OWORD *)n128_f64 - 4);
                long long v47 = *((_OWORD *)n128_f64 - 3);
                long long v48 = *((_OWORD *)n128_f64 - 1);
                *(_OWORD *)&v45[-1].double var0 = *((_OWORD *)n128_f64 - 2);
                *(_OWORD *)&v45[-1].double var2 = v48;
                *(_OWORD *)&v45[-2].double var0 = v46;
                *(_OWORD *)&v45[-2].double var2 = v47;
                v45 -= 2;
                n128_f64 -= 8;
              }
              while (n128_f64 != (double *)v5);
              __n128 v49 = v5;
              float64x2_t v5 = (char *)v45;
            }
            CFDataRef v3 = &this[2 * v43];
            n128_f64 = v44[4].n128_f64;
            if (v49) {
              operator delete(v49);
            }
          }
          else
          {
            double *n128_f64 = v13;
            *((__n128 *)n128_f64 + 1) = v107;
            *((__n128 *)n128_f64 + 2) = v106;
            *((void *)n128_f64 + 6) = v18;
            n128_f64 += 8;
          }
        }
        else
        {
          unint64_t v102 = *(void *)(v14 + 24);
          double v104 = v13;
          if ((unint64_t)(v20 >> 6) <= 1) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = v20 >> 6;
          }
          ITColor::GetLuminance(this, v107, v16);
          double v105 = v22;
          __n128 v23 = (double *)v5;
          while (1)
          {
            double v24 = v23[2];
            double v25 = v23[3];
            double v27 = v23[4];
            double v26 = v23[5];
            *(__n128 *)&v109.double var0 = v107;
            *(__n128 *)&v109.double var2 = v106;
            double HSVColor = ITColor::GetHSVColor(&v109);
            double v30 = v29;
            double v32 = v31;
            v109.double var0 = v24;
            v109.double var1 = v25;
            v109.double var2 = v27;
            v109.double var3 = v26;
            double v33 = ITColor::GetHSVColor(&v109);
            double v35 = v34;
            double v37 = v36;
            ITColor::GetLuminance(v38, *(__n128 *)&v109.var0, v27);
            v109.double var0 = HSVColor;
            v109.double var1 = v30;
            v109.double var2 = v32;
            v109.double var3 = v105;
            uint64_t v110 = 0x3FF0000000000000;
            v108[0] = v33;
            v108[1] = v35;
            v108[2] = v37;
            v108[3] = v39;
            v108[4] = v26;
            this = (ITColor *)isCloseToColor(&v109, v108, 1, 0.0700000003);
            if (this) {
              break;
            }
            v23 += 8;
            if (!--v21)
            {
              unint64_t v19 = v5;
              double v7 = 1.0;
              unint64_t v18 = v102;
              double v13 = v104;
              goto LABEL_13;
            }
          }
          double *v23 = v104 + *v23;
          double v7 = 1.0;
        }
      }
      ++v6;
    }
    while (v6 != 400);
    uint64_t v50 = (char *)n128_f64 - v5;
    if (n128_f64 != (double *)v5)
    {
      unint64_t v51 = v50 >> 6;
      *(void *)&v109.double var0 = CompareSortColor;
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>((unint64_t)v5, (__n128 *)n128_f64, (uint64_t (**)(__n128 *, __n128 *))&v109, 126 - 2 * __clz(v50 >> 6), 1);
      double var0 = v2[10].var0;
      if (v50 >> 6 > (unint64_t)((uint64_t)(*(void *)&v2[10].var2 - *(void *)&var0) >> 5))
      {
        if (v50 < 0) {
          std::vector<ITColor>::__throw_length_error[abi:ne180100]();
        }
        double var1 = v2[10].var1;
        uint64_t v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(v50 >> 6);
        double v55 = &v54[(*(void *)&var1 - *(void *)&var0) & 0xFFFFFFFFFFFFFFE0];
        long long v57 = &v54[32 * v56];
        double v59 = v2[10].var0;
        double v58 = v2[10].var1;
        double v60 = *(double *)&v55;
        if (*(void *)&v58 != *(void *)&v59)
        {
          do
          {
            long long v61 = *(_OWORD *)(*(void *)&v58 - 16);
            *(_OWORD *)(*(void *)&v60 - 32) = *(_OWORD *)(*(void *)&v58 - 32);
            *(_OWORD *)(*(void *)&v60 - 16) = v61;
            *(void *)&v60 -= 32;
            *(void *)&v58 -= 32;
          }
          while (*(void *)&v58 != *(void *)&v59);
          double v58 = *(double *)v1;
        }
        v2[10].double var0 = v60;
        *(void *)&v2[10].double var1 = v55;
        *(void *)&v2[10].double var2 = v57;
        if (v58 != 0.0) {
          operator delete(*(void **)&v58);
        }
      }
      double var3 = v2[10].var3;
      if (v51 > (uint64_t)(*(void *)&v2[11].var1 - *(void *)&var3) >> 3)
      {
        if (v50 < 0) {
          std::vector<ITColor>::__throw_length_error[abi:ne180100]();
        }
        double v63 = v2[11].var0;
        double v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v50 >> 6);
        double v65 = &v64[(*(void *)&v63 - *(void *)&var3) & 0xFFFFFFFFFFFFFFF8];
        uint64_t v67 = &v64[8 * v66];
        double v68 = v2[10].var3;
        double v69 = v2[11].var0;
        double v70 = *(double *)&v65;
        if (*(void *)&v69 != *(void *)&v68)
        {
          double v70 = *(double *)&v65;
          do
          {
            uint64_t v71 = *(void *)(*(void *)&v69 - 8);
            *(void *)&v69 -= 8;
            *(void *)(*(void *)&v70 - 8) = v71;
            *(void *)&v70 -= 8;
          }
          while (*(void *)&v69 != *(void *)&v68);
        }
        v2[10].double var3 = v70;
        *(void *)&v2[11].double var0 = v65;
        *(void *)&v2[11].double var1 = v67;
        if (v68 != 0.0) {
          operator delete(*(void **)&v68);
        }
      }
      uint64_t v72 = 0;
      if (v51 <= 1) {
        unint64_t v51 = 1;
      }
      do
      {
        double v73 = &v5[64 * v72 + 16];
        double v74 = v2[10].var1;
        double var2 = v2[10].var2;
        if (*(void *)&v74 >= *(void *)&var2)
        {
          uint64_t v78 = (uint64_t)(*(void *)&v74 - (void)*v1) >> 5;
          unint64_t v79 = v78 + 1;
          if ((unint64_t)(v78 + 1) >> 59) {
            std::vector<ITColor>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v80 = *(void *)&var2 - (void)*v1;
          if (v80 >> 4 > v79) {
            unint64_t v79 = v80 >> 4;
          }
          if ((unint64_t)v80 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v81 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v81 = v79;
          }
          if (v81) {
            unint64_t v81 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(v81);
          }
          else {
            uint64_t v82 = 0;
          }
          double v83 = (_OWORD *)(v81 + 32 * v78);
          long long v84 = *(_OWORD *)&v5[64 * v72 + 32];
          *double v83 = *(_OWORD *)v73;
          v83[1] = v84;
          double v86 = v2[10].var0;
          double v85 = v2[10].var1;
          double v87 = v83;
          if (*(void *)&v85 != *(void *)&v86)
          {
            do
            {
              long long v88 = *(_OWORD *)(*(void *)&v85 - 16);
              *(v87 - 2) = *(_OWORD *)(*(void *)&v85 - 32);
              *(v87 - 1) = v88;
              v87 -= 2;
              *(void *)&v85 -= 32;
            }
            while (*(void *)&v85 != *(void *)&v86);
            double v85 = *(double *)v1;
          }
          double v77 = v83 + 2;
          *(void *)&v2[10].double var0 = v87;
          *(void *)&v2[10].double var1 = v83 + 2;
          *(void *)&v2[10].double var2 = v81 + 32 * v82;
          if (v85 != 0.0) {
            operator delete(*(void **)&v85);
          }
        }
        else
        {
          long long v76 = *(_OWORD *)&v5[64 * v72 + 32];
          **(_OWORD **)&double v74 = *(_OWORD *)v73;
          *(_OWORD *)(*(void *)&v74 + 16) = v76;
          double v77 = (_OWORD *)(*(void *)&v74 + 32);
        }
        *(void *)&v2[10].double var1 = v77;
        char v89 = &v5[64 * v72];
        double v91 = v2[11].var0;
        double v90 = v2[11].var1;
        if (*(void *)&v91 >= *(void *)&v90)
        {
          double v93 = v2[10].var3;
          uint64_t v94 = (uint64_t)(*(void *)&v91 - *(void *)&v93) >> 3;
          unint64_t v95 = v94 + 1;
          if ((unint64_t)(v94 + 1) >> 61) {
            std::vector<ITColor>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v96 = *(void *)&v90 - *(void *)&v93;
          if (v96 >> 2 > v95) {
            unint64_t v95 = v96 >> 2;
          }
          if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v97 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v97 = v95;
          }
          if (v97)
          {
            unint64_t v97 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v97);
            double v93 = v2[10].var3;
            double v91 = v2[11].var0;
          }
          else
          {
            uint64_t v98 = 0;
          }
          double v99 = (void *)(v97 + 8 * v94);
          *double v99 = *(void *)v89;
          double v92 = v99 + 1;
          while (*(void *)&v91 != *(void *)&v93)
          {
            uint64_t v100 = *(void *)(*(void *)&v91 - 8);
            *(void *)&v91 -= 8;
            *--double v99 = v100;
          }
          *(void *)&v2[10].double var3 = v99;
          *(void *)&v2[11].double var0 = v92;
          *(void *)&v2[11].double var1 = v97 + 8 * v98;
          if (v93 != 0.0) {
            operator delete(*(void **)&v93);
          }
        }
        else
        {
          **(void **)&double v91 = *(void *)v89;
          double v92 = (void *)(*(void *)&v91 + 8);
        }
        *(void *)&v2[11].double var0 = v92;
        ++v72;
      }
      while (v72 != v51);
      n128_f64 = (double *)v5;
    }
    if (n128_f64) {
      operator delete(n128_f64);
    }
  }
  return v1;
}

void sub_1A30F0470(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void ImageAnalyzer::EnhanceContrastWithColor(ITColor a1, ITColor a2, double a3)
{
  double var2 = a2.var2;
  double var0 = a2.var0;
  double var1 = a2.var1;
  ITColor v17 = a1;
  double HSVColor = ITColor::GetHSVColor(&v17);
  double v7 = v6;
  double v9 = v8;
  v10.n128_f64[0] = var0;
  v10.n128_f64[1] = var1;
  ITColor::GetLuminance(v11, v10, var2);
  double v13 = 1.0 - (1.0 - v9) * a3;
  if (v14 >= 0.180000007) {
    double v13 = v9 * a3;
  }
  ITColor::CreateFromHSVDoubles(v12, HSVColor, v7, v13);
}

BOOL contrastsEnoughWithColor(ITColor a1, ITColor a2, ITColor *a3)
{
  double var2 = a2.var2;
  double var1 = a1.var1;
  double v5 = a2.var1;
  __n128 v13 = *(__n128 *)&a2.var0;
  ITColor::GetLuminance(a3, *(__n128 *)&a1.var0, a1.var2);
  double v7 = v6;
  BOOL v8 = v6 >= 0.180000007;
  ITColor::GetLuminance(v9, v13, var2);
  if (v8 == v10 >= 0.180000007) {
    return 0;
  }
  if (v7 <= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v7;
  }
  if (v7 <= v10) {
    double v10 = v7;
  }
  return (v11 + 0.0500000007) / (v10 + 0.0500000007) >= 3.0999999;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(unint64_t a1, __n128 *a2, uint64_t (**a3)(__n128 *, __n128 *), uint64_t a4, char a5)
{
  while (2)
  {
    v302 = a2 - 4;
    unint64_t v12 = (__n128 *)a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = (unint64_t)v12;
          uint64_t v13 = (char *)a2 - (char *)v12;
          uint64_t v14 = ((char *)a2 - (char *)v12) >> 6;
          if (v6 || !v5)
          {
            switch(v14)
            {
              case 0:
              case 1:
                return;
              case 2:
                v135 = *a3;
                __n128 v136 = a2[-1];
                __n128 v138 = *v302;
                __n128 v137 = a2[-3];
                v307[2] = a2[-2];
                v307[3] = v136;
                v307[0] = v138;
                v307[1] = v137;
                long long v139 = *(_OWORD *)(a1 + 48);
                __n128 v141 = *(__n128 *)a1;
                long long v140 = *(_OWORD *)(a1 + 16);
                v306[2] = *(_OWORD *)(a1 + 32);
                v306[3] = v139;
                v306[0] = v141;
                v306[1] = v140;
                if (v135((__n128 *)v307, (__n128 *)v306))
                {
                  __n128 v142 = *(__n128 *)a1;
                  __n128 v143 = *(__n128 *)(a1 + 16);
                  __n128 v144 = *(__n128 *)(a1 + 48);
                  __n128 v348 = *(__n128 *)(a1 + 32);
                  __n128 v349 = v144;
                  __n128 v346 = v142;
                  __n128 v347 = v143;
                  __n128 v145 = *v302;
                  __n128 v146 = a2[-3];
                  __n128 v147 = a2[-1];
                  *(__n128 *)(a1 + 32) = a2[-2];
                  *(__n128 *)(a1 + 48) = v147;
                  *(__n128 *)a1 = v145;
                  *(__n128 *)(a1 + 16) = v146;
                  __n128 v148 = v346;
                  __n128 v149 = v347;
                  __n128 v150 = v349;
                  a2[-2] = v348;
                  a2[-1] = v150;
                  __n128 *v302 = v148;
                  a2[-3] = v149;
                }
                break;
              case 3:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), v302, (uint64_t (**)(void, void))a3);
                break;
              case 4:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), v302, (uint64_t (**)(void, void))a3);
                break;
              case 5:
                std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), (__n128 *)(a1 + 192), v302, (uint64_t (**)(void, void))a3);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v13 <= 1535)
          {
            v151 = (__n128 *)(a1 + 64);
            BOOL v153 = (__n128 *)a1 == a2 || v151 == a2;
            if (a5)
            {
              if (!v153)
              {
                uint64_t v154 = 0;
                v155 = (__n128 *)a1;
                do
                {
                  v156 = v155;
                  v155 = v151;
                  v157 = *a3;
                  __n128 v158 = v155[3];
                  __n128 v160 = *v155;
                  __n128 v159 = v155[1];
                  __n128 v348 = v155[2];
                  __n128 v349 = v158;
                  __n128 v346 = v160;
                  __n128 v347 = v159;
                  __n128 v161 = v156[3];
                  __n128 v163 = *v156;
                  __n128 v162 = v156[1];
                  __n128 v344 = v156[2];
                  __n128 v345 = v161;
                  __n128 v342 = v163;
                  __n128 v343 = v162;
                  if (v157(&v346, &v342))
                  {
                    v164 = a2;
                    __n128 v165 = *v155;
                    __n128 v166 = v155[1];
                    __n128 v167 = v155[3];
                    __n128 v340 = v155[2];
                    __n128 v341 = v167;
                    __n128 v338 = v165;
                    __n128 v339 = v166;
                    uint64_t v168 = v154;
                    while (1)
                    {
                      v169 = (__n128 *)(a1 + v168);
                      __n128 v170 = *(__n128 *)(a1 + v168 + 16);
                      v169[4] = *(__n128 *)(a1 + v168);
                      v169[5] = v170;
                      __n128 v171 = *(__n128 *)(a1 + v168 + 48);
                      v169[6] = *(__n128 *)(a1 + v168 + 32);
                      v169[7] = v171;
                      if (!v168) {
                        break;
                      }
                      v172 = *a3;
                      __n128 v334 = v338;
                      __n128 v335 = v339;
                      __n128 v336 = v340;
                      __n128 v337 = v341;
                      __n128 v173 = v169[-1];
                      __n128 v175 = v169[-4];
                      __n128 v174 = v169[-3];
                      __n128 v332 = v169[-2];
                      __n128 v333 = v173;
                      __n128 v330 = v175;
                      __n128 v331 = v174;
                      v168 -= 64;
                      if ((v172(&v334, &v330) & 1) == 0)
                      {
                        v176 = (_OWORD *)(a1 + v168 + 64);
                        goto LABEL_74;
                      }
                    }
                    v176 = (_OWORD *)a1;
LABEL_74:
                    __n128 v177 = v338;
                    __n128 v178 = v339;
                    __n128 v179 = v341;
                    v176[2] = v340;
                    v176[3] = v179;
                    _OWORD *v176 = v177;
                    v176[1] = v178;
                    a2 = v164;
                  }
                  v151 = v155 + 4;
                  v154 += 64;
                }
                while (&v155[4] != a2);
              }
            }
            else if (!v153)
            {
              do
              {
                v278 = (__n128 *)a1;
                a1 = (unint64_t)v151;
                v279 = *a3;
                __n128 v280 = *(__n128 *)(a1 + 48);
                __n128 v282 = *(__n128 *)a1;
                __n128 v281 = *(__n128 *)(a1 + 16);
                __n128 v348 = *(__n128 *)(a1 + 32);
                __n128 v349 = v280;
                __n128 v346 = v282;
                __n128 v347 = v281;
                __n128 v283 = v278[3];
                __n128 v285 = *v278;
                __n128 v284 = v278[1];
                __n128 v344 = v278[2];
                __n128 v345 = v283;
                __n128 v342 = v285;
                __n128 v343 = v284;
                if (v279(&v346, &v342))
                {
                  __n128 v286 = *(__n128 *)a1;
                  __n128 v287 = *(__n128 *)(a1 + 16);
                  __n128 v288 = *(__n128 *)(a1 + 48);
                  __n128 v340 = *(__n128 *)(a1 + 32);
                  __n128 v341 = v288;
                  __n128 v338 = v286;
                  __n128 v339 = v287;
                  v289 = (__n128 *)a1;
                  do
                  {
                    v290 = v289 - 4;
                    __n128 v291 = v289[-3];
                    __n128 *v289 = v289[-4];
                    v289[1] = v291;
                    __n128 v292 = v289[-1];
                    v289[2] = v289[-2];
                    v289[3] = v292;
                    v293 = *a3;
                    __n128 v334 = v338;
                    __n128 v335 = v339;
                    __n128 v336 = v340;
                    __n128 v337 = v341;
                    __n128 v294 = v289[-5];
                    __n128 v296 = v289[-8];
                    __n128 v295 = v289[-7];
                    __n128 v332 = v289[-6];
                    __n128 v333 = v294;
                    __n128 v330 = v296;
                    __n128 v331 = v295;
                    char v297 = v293(&v334, &v330);
                    v289 = v290;
                  }
                  while ((v297 & 1) != 0);
                  __n128 v298 = v338;
                  __n128 v299 = v339;
                  __n128 v300 = v341;
                  v290[2] = v340;
                  v290[3] = v300;
                  __n128 *v290 = v298;
                  v290[1] = v299;
                }
                v151 = (__n128 *)(a1 + 64);
              }
              while ((__n128 *)(a1 + 64) != a2);
            }
            return;
          }
          if (!a4)
          {
            if ((__n128 *)a1 != a2)
            {
              int64_t v180 = (unint64_t)(v14 - 2) >> 1;
              v301 = a2;
              int64_t v303 = v180;
              do
              {
                int64_t v181 = v180;
                if (v303 >= v180)
                {
                  uint64_t v182 = (2 * v180) | 1;
                  v183 = (__n128 *)(a1 + (v182 << 6));
                  if (2 * v180 + 2 < v14)
                  {
                    v184 = *a3;
                    __n128 v185 = v183[3];
                    __n128 v187 = *v183;
                    __n128 v186 = v183[1];
                    __n128 v348 = v183[2];
                    __n128 v349 = v185;
                    __n128 v346 = v187;
                    __n128 v347 = v186;
                    __n128 v188 = v183[7];
                    __n128 v190 = v183[4];
                    __n128 v189 = v183[5];
                    __n128 v344 = v183[6];
                    __n128 v345 = v188;
                    __n128 v342 = v190;
                    __n128 v343 = v189;
                    if (v184(&v346, &v342))
                    {
                      v183 += 4;
                      uint64_t v182 = 2 * v181 + 2;
                    }
                  }
                  v191 = (__n128 *)(a1 + (v181 << 6));
                  v192 = *a3;
                  __n128 v193 = v183[3];
                  __n128 v195 = *v183;
                  __n128 v194 = v183[1];
                  __n128 v340 = v183[2];
                  __n128 v341 = v193;
                  __n128 v338 = v195;
                  __n128 v339 = v194;
                  __n128 v196 = v191[3];
                  __n128 v198 = *v191;
                  __n128 v197 = v191[1];
                  __n128 v336 = v191[2];
                  __n128 v337 = v196;
                  __n128 v334 = v198;
                  __n128 v335 = v197;
                  if ((v192(&v338, &v334) & 1) == 0)
                  {
                    __n128 v199 = *v191;
                    __n128 v200 = v191[1];
                    __n128 v201 = v191[3];
                    __n128 v332 = v191[2];
                    __n128 v333 = v201;
                    __n128 v330 = v199;
                    __n128 v331 = v200;
                    do
                    {
                      v202 = v183;
                      __n128 v203 = *v183;
                      __n128 v204 = v183[1];
                      __n128 v205 = v183[3];
                      v191[2] = v183[2];
                      v191[3] = v205;
                      __n128 *v191 = v203;
                      v191[1] = v204;
                      if (v303 < v182) {
                        break;
                      }
                      uint64_t v206 = (2 * v182) | 1;
                      v183 = (__n128 *)(a1 + (v206 << 6));
                      uint64_t v207 = 2 * v182 + 2;
                      if (v207 < v14)
                      {
                        v208 = *a3;
                        __n128 v209 = v183[3];
                        __n128 v211 = *v183;
                        __n128 v210 = v183[1];
                        __n128 v328 = v183[2];
                        __n128 v329 = v209;
                        __n128 v326 = v211;
                        __n128 v327 = v210;
                        __n128 v212 = v183[7];
                        __n128 v214 = v183[4];
                        __n128 v213 = v183[5];
                        __n128 v324 = v183[6];
                        __n128 v325 = v212;
                        __n128 v322 = v214;
                        __n128 v323 = v213;
                        if (v208(&v326, &v322))
                        {
                          v183 += 4;
                          uint64_t v206 = v207;
                        }
                      }
                      v215 = *a3;
                      __n128 v216 = v183[3];
                      __n128 v218 = *v183;
                      __n128 v217 = v183[1];
                      __n128 v320 = v183[2];
                      __n128 v321 = v216;
                      __n128 v318 = v218;
                      __n128 v319 = v217;
                      __n128 v314 = v330;
                      __n128 v315 = v331;
                      __n128 v316 = v332;
                      __n128 v317 = v333;
                      v191 = v202;
                      uint64_t v182 = v206;
                    }
                    while (!v215(&v318, &v314));
                    __n128 v219 = v330;
                    __n128 v220 = v331;
                    __n128 v221 = v333;
                    v202[2] = v332;
                    v202[3] = v221;
                    __n128 *v202 = v219;
                    v202[1] = v220;
                  }
                }
                int64_t v180 = v181 - 1;
              }
              while (v181);
              uint64_t v222 = (unint64_t)v13 >> 6;
              v223 = v301;
              do
              {
                uint64_t v224 = 0;
                __n128 v225 = *(__n128 *)a1;
                __n128 v226 = *(__n128 *)(a1 + 16);
                __n128 v227 = *(__n128 *)(a1 + 48);
                __n128 v328 = *(__n128 *)(a1 + 32);
                __n128 v329 = v227;
                __n128 v326 = v225;
                __n128 v327 = v226;
                uint64_t v228 = v222 - 2;
                if (v222 < 2) {
                  uint64_t v228 = v222 - 1;
                }
                uint64_t v229 = v228 >> 1;
                v230 = (_OWORD *)a1;
                do
                {
                  v231 = (__n128 *)&v230[4 * v224 + 4];
                  uint64_t v232 = (2 * v224) | 1;
                  uint64_t v233 = 2 * v224 + 2;
                  if (v233 < v222)
                  {
                    v234 = *a3;
                    __n128 v235 = v231[3];
                    __n128 v237 = *v231;
                    __n128 v236 = v231[1];
                    __n128 v348 = v231[2];
                    __n128 v349 = v235;
                    __n128 v346 = v237;
                    __n128 v347 = v236;
                    __n128 v238 = v231[7];
                    __n128 v240 = v231[4];
                    __n128 v239 = v231[5];
                    __n128 v344 = v231[6];
                    __n128 v345 = v238;
                    __n128 v342 = v240;
                    __n128 v343 = v239;
                    if (v234(&v346, &v342))
                    {
                      v231 += 4;
                      uint64_t v232 = v233;
                    }
                  }
                  __n128 v241 = *v231;
                  __n128 v242 = v231[1];
                  __n128 v243 = v231[3];
                  v230[2] = v231[2];
                  v230[3] = v243;
                  _OWORD *v230 = v241;
                  v230[1] = v242;
                  v230 = v231;
                  uint64_t v224 = v232;
                }
                while (v232 <= v229);
                v223 -= 4;
                if (v231 == v223)
                {
                  __n128 v274 = v326;
                  __n128 v275 = v327;
                  __n128 v276 = v329;
                  v231[2] = v328;
                  v231[3] = v276;
                  __n128 *v231 = v274;
                  v231[1] = v275;
                }
                else
                {
                  __n128 v244 = *v223;
                  __n128 v245 = v223[1];
                  __n128 v246 = v223[3];
                  v231[2] = v223[2];
                  v231[3] = v246;
                  __n128 *v231 = v244;
                  v231[1] = v245;
                  __n128 v247 = v326;
                  __n128 v248 = v327;
                  __n128 v249 = v329;
                  v223[2] = v328;
                  v223[3] = v249;
                  __n128 *v223 = v247;
                  v223[1] = v248;
                  uint64_t v250 = (uint64_t)&v231[4] - a1;
                  if (v250 >= 65)
                  {
                    unint64_t v251 = (unint64_t)((v250 >> 6) - 2) >> 1;
                    v252 = (__n128 *)(a1 + (v251 << 6));
                    v253 = *a3;
                    __n128 v254 = v252[3];
                    __n128 v256 = *v252;
                    __n128 v255 = v252[1];
                    __n128 v348 = v252[2];
                    __n128 v349 = v254;
                    __n128 v346 = v256;
                    __n128 v347 = v255;
                    __n128 v257 = v231[3];
                    __n128 v259 = *v231;
                    __n128 v258 = v231[1];
                    __n128 v344 = v231[2];
                    __n128 v345 = v257;
                    __n128 v342 = v259;
                    __n128 v343 = v258;
                    if (v253(&v346, &v342))
                    {
                      __n128 v260 = *v231;
                      __n128 v261 = v231[1];
                      __n128 v262 = v231[3];
                      __n128 v340 = v231[2];
                      __n128 v341 = v262;
                      __n128 v338 = v260;
                      __n128 v339 = v261;
                      do
                      {
                        v263 = v252;
                        __n128 v264 = *v252;
                        __n128 v265 = v252[1];
                        __n128 v266 = v252[3];
                        v231[2] = v252[2];
                        v231[3] = v266;
                        __n128 *v231 = v264;
                        v231[1] = v265;
                        if (!v251) {
                          break;
                        }
                        v267 = *a3;
                        unint64_t v251 = (v251 - 1) >> 1;
                        v252 = (__n128 *)(a1 + (v251 << 6));
                        __n128 v268 = v252[3];
                        __n128 v270 = *v252;
                        __n128 v269 = v252[1];
                        __n128 v336 = v252[2];
                        __n128 v337 = v268;
                        __n128 v334 = v270;
                        __n128 v335 = v269;
                        __n128 v330 = v338;
                        __n128 v331 = v339;
                        __n128 v332 = v340;
                        __n128 v333 = v341;
                        v231 = v263;
                      }
                      while ((v267(&v334, &v330) & 1) != 0);
                      __n128 v271 = v338;
                      __n128 v272 = v339;
                      __n128 v273 = v341;
                      v263[2] = v340;
                      v263[3] = v273;
                      __n128 *v263 = v271;
                      v263[1] = v272;
                    }
                  }
                }
              }
              while (v222-- > 2);
            }
            return;
          }
          unint64_t v15 = (unint64_t)v14 >> 1;
          double v16 = (__n128 *)(a1 + ((unint64_t)v14 >> 1 << 6));
          if ((unint64_t)v13 <= 0x2000)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v16, (_OWORD *)a1, v302, (uint64_t (**)(void, void))a3);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, v16, v302, (uint64_t (**)(void, void))a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)(a1 + 64), (__n128 *)v16[-4].n128_u64, (__n128 *)a2[-8].n128_u64, (uint64_t (**)(void, void))a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)(a1 + 128), (_OWORD *)(a1 + 64 + (v15 << 6)), (__n128 *)a2[-12].n128_u64, (uint64_t (**)(void, void))a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)v16[-4].n128_u64, v16, (_OWORD *)(a1 + 64 + (v15 << 6)), (uint64_t (**)(void, void))a3);
            __n128 v17 = *(__n128 *)a1;
            __n128 v18 = *(__n128 *)(a1 + 16);
            __n128 v19 = *(__n128 *)(a1 + 48);
            __n128 v348 = *(__n128 *)(a1 + 32);
            __n128 v349 = v19;
            __n128 v346 = v17;
            __n128 v347 = v18;
            __n128 v20 = *v16;
            __n128 v21 = v16[1];
            __n128 v22 = v16[3];
            *(__n128 *)(a1 + 32) = v16[2];
            *(__n128 *)(a1 + 48) = v22;
            *(__n128 *)a1 = v20;
            *(__n128 *)(a1 + 16) = v21;
            __n128 v23 = v346;
            __n128 v24 = v347;
            __n128 v25 = v349;
            v16[2] = v348;
            v16[3] = v25;
            *double v16 = v23;
            v16[1] = v24;
          }
          --a4;
          if (a5) {
            break;
          }
          double v26 = *a3;
          long long v27 = *(_OWORD *)(a1 - 16);
          long long v29 = *(_OWORD *)(a1 - 64);
          long long v28 = *(_OWORD *)(a1 - 48);
          v305[2] = *(_OWORD *)(a1 - 32);
          v305[3] = v27;
          v305[0] = v29;
          v305[1] = v28;
          long long v30 = *(_OWORD *)(a1 + 48);
          __n128 v32 = *(__n128 *)a1;
          long long v31 = *(_OWORD *)(a1 + 16);
          v304[2] = *(_OWORD *)(a1 + 32);
          v304[3] = v30;
          v304[0] = v32;
          v304[1] = v31;
          if (v26((__n128 *)v305, (__n128 *)v304)) {
            break;
          }
          __n128 v80 = *(__n128 *)a1;
          __n128 v81 = *(__n128 *)(a1 + 16);
          __n128 v82 = *(__n128 *)(a1 + 48);
          __n128 v344 = *(__n128 *)(a1 + 32);
          __n128 v345 = v82;
          __n128 v342 = v80;
          __n128 v343 = v81;
          double v83 = *a3;
          __n128 v84 = *(__n128 *)(a1 + 48);
          __n128 v86 = *(__n128 *)a1;
          __n128 v85 = *(__n128 *)(a1 + 16);
          __n128 v340 = *(__n128 *)(a1 + 32);
          __n128 v341 = v84;
          __n128 v338 = v86;
          __n128 v339 = v85;
          __n128 v88 = a2[-2];
          __n128 v87 = a2[-1];
          __n128 v89 = a2[-3];
          __n128 v334 = *v302;
          __n128 v335 = v89;
          __n128 v336 = v88;
          __n128 v337 = v87;
          if (v83(&v338, &v334))
          {
            double v90 = (__n128 *)a1;
            do
            {
              unint64_t v12 = v90 + 4;
              double v91 = *a3;
              __n128 v330 = v342;
              __n128 v331 = v343;
              __n128 v332 = v344;
              __n128 v333 = v345;
              __n128 v92 = v90[7];
              __n128 v94 = v90[4];
              __n128 v93 = v90[5];
              __n128 v328 = v90[6];
              __n128 v329 = v92;
              __n128 v326 = v94;
              __n128 v327 = v93;
              char v95 = v91(&v330, &v326);
              double v90 = v12;
            }
            while ((v95 & 1) == 0);
          }
          else
          {
            uint64_t v96 = (__n128 *)(a1 + 64);
            do
            {
              unint64_t v12 = v96;
              if (v96 >= a2) {
                break;
              }
              unint64_t v97 = *a3;
              __n128 v330 = v342;
              __n128 v331 = v343;
              __n128 v332 = v344;
              __n128 v333 = v345;
              __n128 v98 = v12[3];
              __n128 v100 = *v12;
              __n128 v99 = v12[1];
              __n128 v328 = v12[2];
              __n128 v329 = v98;
              __n128 v326 = v100;
              __n128 v327 = v99;
              int v101 = v97(&v330, &v326);
              uint64_t v96 = v12 + 4;
            }
            while (!v101);
          }
          unint64_t v102 = a2;
          if (v12 < a2)
          {
            unint64_t v103 = a2;
            do
            {
              unint64_t v102 = v103 - 4;
              double v104 = *a3;
              __n128 v322 = v342;
              __n128 v323 = v343;
              __n128 v324 = v344;
              __n128 v325 = v345;
              __n128 v105 = v103[-1];
              __n128 v107 = v103[-4];
              __n128 v106 = v103[-3];
              __n128 v320 = v103[-2];
              __n128 v321 = v105;
              __n128 v318 = v107;
              __n128 v319 = v106;
              char v108 = v104(&v322, &v318);
              unint64_t v103 = v102;
            }
            while ((v108 & 1) != 0);
          }
          while (v12 < v102)
          {
            __n128 v109 = *v12;
            __n128 v110 = v12[1];
            __n128 v111 = v12[3];
            __n128 v348 = v12[2];
            __n128 v349 = v111;
            __n128 v346 = v109;
            __n128 v347 = v110;
            __n128 v112 = *v102;
            __n128 v113 = v102[1];
            __n128 v114 = v102[3];
            v12[2] = v102[2];
            v12[3] = v114;
            __n128 *v12 = v112;
            v12[1] = v113;
            __n128 v115 = v346;
            __n128 v116 = v347;
            __n128 v117 = v349;
            v102[2] = v348;
            v102[3] = v117;
            *unint64_t v102 = v115;
            v102[1] = v116;
            do
            {
              __n128 v314 = v342;
              __n128 v315 = v343;
              __n128 v316 = v344;
              __n128 v317 = v345;
              __n128 v118 = v12[6];
              __n128 v119 = v12[7];
              __n128 v121 = v12[4];
              __n128 v120 = v12[5];
              v12 += 4;
              ITColor v122 = *a3;
              __n128 v312 = v118;
              __n128 v313 = v119;
              __n128 v310 = v121;
              __n128 v311 = v120;
            }
            while (!v122(&v314, &v310));
            do
            {
              v309[0] = v342;
              v309[1] = v343;
              v309[2] = v344;
              v309[3] = v345;
              __n128 v123 = v102[-2];
              __n128 v124 = v102[-1];
              __n128 v126 = v102[-4];
              __n128 v125 = v102[-3];
              v102 -= 4;
              ITColor v127 = *a3;
              v308[2] = v123;
              v308[3] = v124;
              v308[0] = v126;
              v308[1] = v125;
            }
            while ((v127((__n128 *)v309, (__n128 *)v308) & 1) != 0);
          }
          ITColor v128 = v12 - 4;
          BOOL v5 = (unint64_t)v12[-4].n128_u64 >= a1;
          BOOL v6 = &v12[-4] == (__n128 *)a1;
          if (&v12[-4] != (__n128 *)a1)
          {
            __n128 v129 = *v128;
            __n128 v130 = v12[-3];
            __n128 v131 = v12[-1];
            *(__n128 *)(a1 + 32) = v12[-2];
            *(__n128 *)(a1 + 48) = v131;
            *(__n128 *)a1 = v129;
            *(__n128 *)(a1 + 16) = v130;
          }
          a5 = 0;
          __n128 v132 = v342;
          __n128 v133 = v343;
          __n128 v134 = v345;
          v12[-2] = v344;
          v12[-1] = v134;
          *ITColor v128 = v132;
          v12[-3] = v133;
        }
        __n128 v33 = *(__n128 *)a1;
        __n128 v34 = *(__n128 *)(a1 + 16);
        __n128 v35 = *(__n128 *)(a1 + 48);
        __n128 v344 = *(__n128 *)(a1 + 32);
        __n128 v345 = v35;
        __n128 v342 = v33;
        __n128 v343 = v34;
        double v36 = (__n128 *)a1;
        do
        {
          double v37 = v36;
          double v38 = *a3;
          v36 += 4;
          __n128 v39 = v37[7];
          __n128 v41 = v37[4];
          __n128 v40 = v37[5];
          __n128 v340 = v37[6];
          __n128 v341 = v39;
          __n128 v338 = v41;
          __n128 v339 = v40;
          __n128 v334 = v342;
          __n128 v335 = v343;
          __n128 v336 = v344;
          __n128 v337 = v345;
        }
        while ((v38(&v338, &v334) & 1) != 0);
        uint64_t v42 = a2;
        if (v37 == (__n128 *)a1)
        {
          __n128 v49 = a2;
          while (v36 < v49)
          {
            uint64_t v50 = *a3;
            unint64_t v43 = v49 - 4;
            __n128 v51 = v49[-1];
            __n128 v53 = v49[-4];
            __n128 v52 = v49[-3];
            __n128 v332 = v49[-2];
            __n128 v333 = v51;
            __n128 v330 = v53;
            __n128 v331 = v52;
            __n128 v326 = v342;
            __n128 v327 = v343;
            __n128 v328 = v344;
            __n128 v329 = v345;
            char v54 = v50(&v330, &v326);
            __n128 v49 = v43;
            if (v54) {
              goto LABEL_21;
            }
          }
          unint64_t v43 = v49;
        }
        else
        {
          do
          {
            unint64_t v43 = v42 - 4;
            double v44 = *a3;
            __n128 v45 = v42[-1];
            __n128 v47 = v42[-4];
            __n128 v46 = v42[-3];
            __n128 v332 = v42[-2];
            __n128 v333 = v45;
            __n128 v330 = v47;
            __n128 v331 = v46;
            __n128 v326 = v342;
            __n128 v327 = v343;
            __n128 v328 = v344;
            __n128 v329 = v345;
            int v48 = v44(&v330, &v326);
            uint64_t v42 = v43;
          }
          while (!v48);
        }
LABEL_21:
        if (v36 < v43)
        {
          double v55 = v36;
          uint64_t v56 = v43;
          do
          {
            __n128 v58 = v55[1];
            __n128 v346 = *v55;
            __n128 v57 = v346;
            __n128 v347 = v58;
            __n128 v60 = v55[3];
            __n128 v348 = v55[2];
            __n128 v59 = v348;
            __n128 v349 = v60;
            __n128 v62 = v56[2];
            __n128 v61 = v56[3];
            __n128 v63 = v56[1];
            *double v55 = *v56;
            v55[1] = v63;
            v55[2] = v62;
            v55[3] = v61;
            v56[2] = v59;
            v56[3] = v60;
            *uint64_t v56 = v57;
            v56[1] = v58;
            do
            {
              double v37 = v55;
              double v64 = *a3;
              v55 += 4;
              __n128 v65 = v37[7];
              __n128 v67 = v37[4];
              __n128 v66 = v37[5];
              __n128 v324 = v37[6];
              __n128 v325 = v65;
              __n128 v322 = v67;
              __n128 v323 = v66;
              __n128 v318 = v342;
              __n128 v319 = v343;
              __n128 v320 = v344;
              __n128 v321 = v345;
            }
            while ((v64(&v322, &v318) & 1) != 0);
            do
            {
              __n128 v68 = v56[-2];
              __n128 v69 = v56[-1];
              __n128 v71 = v56[-4];
              __n128 v70 = v56[-3];
              v56 -= 4;
              uint64_t v72 = *a3;
              __n128 v316 = v68;
              __n128 v317 = v69;
              __n128 v314 = v71;
              __n128 v315 = v70;
              __n128 v310 = v342;
              __n128 v311 = v343;
              __n128 v312 = v344;
              __n128 v313 = v345;
            }
            while (!v72(&v314, &v310));
          }
          while (v55 < v56);
        }
        if (v37 != (__n128 *)a1)
        {
          __n128 v73 = *v37;
          __n128 v74 = v37[1];
          __n128 v75 = v37[3];
          *(__n128 *)(a1 + 32) = v37[2];
          *(__n128 *)(a1 + 48) = v75;
          *(__n128 *)a1 = v73;
          *(__n128 *)(a1 + 16) = v74;
        }
        __n128 v76 = v342;
        __n128 v77 = v343;
        __n128 v78 = v345;
        v37[2] = v344;
        v37[3] = v78;
        *double v37 = v76;
        v37[1] = v77;
        if (v36 >= v43) {
          break;
        }
LABEL_32:
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(a1, v37, a3, a4, a5 & 1);
        a5 = 0;
        unint64_t v12 = v37 + 4;
      }
      BOOL v79 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, v37, (uint64_t (**)(void, void))a3);
      unint64_t v12 = v37 + 4;
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)&v37[4], a2, (uint64_t (**)(void, void))a3))
      {
        break;
      }
      if (!v79) {
        goto LABEL_32;
      }
    }
    a2 = v37;
    if (!v79) {
      continue;
    }
    break;
  }
}

void std::vector<ITColor>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(unint64_t a1)
{
  if (a1 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(_OWORD *a1, _OWORD *a2, _OWORD *a3, uint64_t (**a4)(void, void))
{
  BOOL v8 = *a4;
  long long v9 = a2[1];
  v78[0] = *a2;
  v78[1] = v9;
  long long v10 = a2[3];
  v78[2] = a2[2];
  v78[3] = v10;
  long long v11 = a1[1];
  v77[0] = *a1;
  v77[1] = v11;
  long long v12 = a1[3];
  v77[2] = a1[2];
  v77[3] = v12;
  char v13 = v8(v78, v77);
  uint64_t v14 = *a4;
  if (v13)
  {
    long long v15 = a3[1];
    v72[0] = *a3;
    v72[1] = v15;
    long long v16 = a3[3];
    v72[2] = a3[2];
    v72[3] = v16;
    long long v17 = a2[1];
    v71[0] = *a2;
    v71[1] = v17;
    long long v18 = a2[3];
    v71[2] = a2[2];
    v71[3] = v18;
    uint64_t result = v14(v72, v71);
    if (result)
    {
      long long v21 = a1[2];
      long long v20 = a1[3];
      long long v23 = *a1;
      long long v22 = a1[1];
      long long v24 = a3[3];
      long long v26 = *a3;
      long long v25 = a3[1];
      a1[2] = a3[2];
      a1[3] = v24;
      *a1 = v26;
      a1[1] = v25;
    }
    else
    {
      long long v53 = a1[2];
      long long v52 = a1[3];
      long long v55 = *a1;
      long long v54 = a1[1];
      long long v56 = a2[3];
      long long v58 = *a2;
      long long v57 = a2[1];
      a1[2] = a2[2];
      a1[3] = v56;
      *a1 = v58;
      a1[1] = v57;
      *a2 = v55;
      a2[1] = v54;
      a2[2] = v53;
      a2[3] = v52;
      __n128 v59 = *a4;
      long long v60 = *a3;
      long long v61 = a3[1];
      long long v62 = a3[3];
      v70[2] = a3[2];
      v70[3] = v62;
      v70[0] = v60;
      v70[1] = v61;
      long long v63 = *a2;
      long long v64 = a2[1];
      long long v65 = a2[3];
      v69[2] = a2[2];
      v69[3] = v65;
      v69[0] = v63;
      v69[1] = v64;
      uint64_t result = v59(v70, v69);
      if (!result) {
        return result;
      }
      long long v21 = a2[2];
      long long v20 = a2[3];
      long long v23 = *a2;
      long long v22 = a2[1];
      long long v66 = a3[3];
      long long v68 = *a3;
      long long v67 = a3[1];
      a2[2] = a3[2];
      a2[3] = v66;
      *a2 = v68;
      a2[1] = v67;
    }
    *a3 = v23;
    a3[1] = v22;
    a3[2] = v21;
    a3[3] = v20;
  }
  else
  {
    long long v27 = a3[1];
    v76[0] = *a3;
    v76[1] = v27;
    long long v28 = a3[3];
    _OWORD v76[2] = a3[2];
    v76[3] = v28;
    long long v29 = a2[1];
    v75[0] = *a2;
    v75[1] = v29;
    long long v30 = a2[3];
    v75[2] = a2[2];
    v75[3] = v30;
    uint64_t result = v14(v76, v75);
    if (result)
    {
      long long v32 = a2[2];
      long long v31 = a2[3];
      long long v34 = *a2;
      long long v33 = a2[1];
      long long v35 = a3[3];
      long long v37 = *a3;
      long long v36 = a3[1];
      a2[2] = a3[2];
      a2[3] = v35;
      *a2 = v37;
      a2[1] = v36;
      *a3 = v34;
      a3[1] = v33;
      a3[2] = v32;
      a3[3] = v31;
      double v38 = *a4;
      long long v39 = *a2;
      long long v40 = a2[1];
      long long v41 = a2[3];
      v74[2] = a2[2];
      v74[3] = v41;
      v74[0] = v39;
      v74[1] = v40;
      long long v42 = *a1;
      long long v43 = a1[1];
      long long v44 = a1[3];
      v73[2] = a1[2];
      v73[3] = v44;
      v73[0] = v42;
      v73[1] = v43;
      uint64_t result = v38(v74, v73);
      if (result)
      {
        long long v46 = a1[2];
        long long v45 = a1[3];
        long long v48 = *a1;
        long long v47 = a1[1];
        long long v49 = a2[3];
        long long v51 = *a2;
        long long v50 = a2[1];
        a1[2] = a2[2];
        a1[3] = v49;
        *a1 = v51;
        a1[1] = v50;
        *a2 = v48;
        a2[1] = v47;
        a2[2] = v46;
        a2[3] = v45;
      }
    }
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, uint64_t (**a5)(void, void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a2, a3, a5);
  long long v10 = *a5;
  __n128 v11 = a4[1];
  v55[0] = *a4;
  v55[1] = v11;
  __n128 v12 = a4[3];
  v55[2] = a4[2];
  v55[3] = v12;
  __n128 v13 = a3[1];
  v54[0] = *a3;
  v54[1] = v13;
  __n128 v14 = a3[3];
  v54[2] = a3[2];
  v54[3] = v14;
  if (v10(v55, v54))
  {
    __n128 v17 = a3[2];
    __n128 v16 = a3[3];
    __n128 v19 = *a3;
    __n128 v18 = a3[1];
    __n128 v20 = a4[3];
    __n128 v22 = *a4;
    __n128 v21 = a4[1];
    a3[2] = a4[2];
    a3[3] = v20;
    *a3 = v22;
    a3[1] = v21;
    *a4 = v19;
    a4[1] = v18;
    a4[2] = v17;
    a4[3] = v16;
    long long v23 = *a5;
    __n128 v24 = *a3;
    __n128 v25 = a3[1];
    __n128 v26 = a3[3];
    v53[2] = a3[2];
    v53[3] = v26;
    v53[0] = v24;
    v53[1] = v25;
    __n128 v27 = *a2;
    __n128 v28 = a2[1];
    __n128 v29 = a2[3];
    v52[2] = a2[2];
    v52[3] = v29;
    v52[0] = v27;
    v52[1] = v28;
    if (v23(v53, v52))
    {
      __n128 v31 = a2[2];
      __n128 v30 = a2[3];
      __n128 v33 = *a2;
      __n128 v32 = a2[1];
      __n128 v34 = a3[3];
      __n128 v36 = *a3;
      __n128 v35 = a3[1];
      a2[2] = a3[2];
      a2[3] = v34;
      *a2 = v36;
      a2[1] = v35;
      *a3 = v33;
      a3[1] = v32;
      a3[2] = v31;
      a3[3] = v30;
      long long v37 = *a5;
      __n128 v38 = *a2;
      __n128 v39 = a2[1];
      __n128 v40 = a2[3];
      v51[2] = a2[2];
      v51[3] = v40;
      v51[0] = v38;
      v51[1] = v39;
      __n128 v41 = *a1;
      __n128 v42 = a1[1];
      __n128 v43 = a1[3];
      v50[2] = a1[2];
      v50[3] = v43;
      v50[0] = v41;
      v50[1] = v42;
      if (v37(v51, v50))
      {
        __n128 v44 = a1[2];
        __n128 result = a1[3];
        __n128 v46 = *a1;
        __n128 v45 = a1[1];
        __n128 v47 = a2[3];
        __n128 v49 = *a2;
        __n128 v48 = a2[1];
        a1[2] = a2[2];
        a1[3] = v47;
        *a1 = v49;
        a1[1] = v48;
        *a2 = v46;
        a2[1] = v45;
        a2[2] = v44;
        a2[3] = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, uint64_t (**a6)(void, void))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, a2, a3, a4, a6);
  __n128 v12 = *a6;
  __n128 v13 = a5[1];
  v73[0] = *a5;
  v73[1] = v13;
  __n128 v14 = a5[3];
  v73[2] = a5[2];
  v73[3] = v14;
  __n128 v15 = a4[1];
  v72[0] = *a4;
  v72[1] = v15;
  __n128 v16 = a4[3];
  v72[2] = a4[2];
  v72[3] = v16;
  if (v12(v73, v72))
  {
    __n128 v19 = a4[2];
    __n128 v18 = a4[3];
    __n128 v21 = *a4;
    __n128 v20 = a4[1];
    __n128 v22 = a5[3];
    __n128 v24 = *a5;
    __n128 v23 = a5[1];
    a4[2] = a5[2];
    a4[3] = v22;
    *a4 = v24;
    a4[1] = v23;
    *a5 = v21;
    a5[1] = v20;
    a5[2] = v19;
    a5[3] = v18;
    __n128 v25 = *a6;
    __n128 v26 = *a4;
    __n128 v27 = a4[1];
    __n128 v28 = a4[3];
    v71[2] = a4[2];
    v71[3] = v28;
    v71[0] = v26;
    v71[1] = v27;
    __n128 v29 = *a3;
    __n128 v30 = a3[1];
    __n128 v31 = a3[3];
    v70[2] = a3[2];
    v70[3] = v31;
    v70[0] = v29;
    v70[1] = v30;
    if (v25(v71, v70))
    {
      __n128 v33 = a3[2];
      __n128 v32 = a3[3];
      __n128 v35 = *a3;
      __n128 v34 = a3[1];
      __n128 v36 = a4[3];
      __n128 v38 = *a4;
      __n128 v37 = a4[1];
      a3[2] = a4[2];
      a3[3] = v36;
      *a3 = v38;
      a3[1] = v37;
      *a4 = v35;
      a4[1] = v34;
      a4[2] = v33;
      a4[3] = v32;
      __n128 v39 = *a6;
      __n128 v40 = *a3;
      __n128 v41 = a3[1];
      __n128 v42 = a3[3];
      v69[2] = a3[2];
      v69[3] = v42;
      v69[0] = v40;
      v69[1] = v41;
      __n128 v43 = *a2;
      __n128 v44 = a2[1];
      __n128 v45 = a2[3];
      v68[2] = a2[2];
      v68[3] = v45;
      v68[0] = v43;
      v68[1] = v44;
      if (v39(v69, v68))
      {
        __n128 v47 = a2[2];
        __n128 v46 = a2[3];
        __n128 v49 = *a2;
        __n128 v48 = a2[1];
        __n128 v50 = a3[3];
        __n128 v52 = *a3;
        __n128 v51 = a3[1];
        a2[2] = a3[2];
        a2[3] = v50;
        *a2 = v52;
        a2[1] = v51;
        *a3 = v49;
        a3[1] = v48;
        a3[2] = v47;
        a3[3] = v46;
        long long v53 = *a6;
        __n128 v54 = *a2;
        __n128 v55 = a2[1];
        __n128 v56 = a2[3];
        v67[2] = a2[2];
        v67[3] = v56;
        v67[0] = v54;
        v67[1] = v55;
        __n128 v57 = *(__n128 *)a1;
        long long v58 = *(_OWORD *)(a1 + 16);
        long long v59 = *(_OWORD *)(a1 + 48);
        v66[2] = *(_OWORD *)(a1 + 32);
        v66[3] = v59;
        v66[0] = v57;
        v66[1] = v58;
        if (v53(v67, v66))
        {
          __n128 v60 = *(__n128 *)(a1 + 32);
          __n128 result = *(__n128 *)(a1 + 48);
          __n128 v62 = *(__n128 *)a1;
          __n128 v61 = *(__n128 *)(a1 + 16);
          __n128 v63 = a2[3];
          __n128 v65 = *a2;
          __n128 v64 = a2[1];
          *(__n128 *)(a1 + 32) = a2[2];
          *(__n128 *)(a1 + 48) = v63;
          *(__n128 *)a1 = v65;
          *(__n128 *)(a1 + 16) = v64;
          *a2 = v62;
          a2[1] = v61;
          a2[2] = v60;
          a2[3] = result;
        }
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, uint64_t (**a3)(void, void))
{
  uint64_t v6 = ((uint64_t)a2 - a1) >> 6;
  BOOL result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      BOOL v8 = *a3;
      __n128 v9 = a2[-3];
      v52[0] = a2[-4];
      v52[1] = v9;
      __n128 v10 = a2[-1];
      v52[2] = a2[-2];
      v52[3] = v10;
      long long v11 = *(_OWORD *)(a1 + 16);
      v51[0] = *(_OWORD *)a1;
      v51[1] = v11;
      long long v12 = *(_OWORD *)(a1 + 48);
      v51[2] = *(_OWORD *)(a1 + 32);
      v51[3] = v12;
      if (!v8(v52, v51)) {
        return 1;
      }
      __n128 v13 = a2 - 4;
      __n128 v15 = *(__n128 *)(a1 + 32);
      __n128 v14 = *(__n128 *)(a1 + 48);
      __n128 v17 = *(__n128 *)a1;
      __n128 v16 = *(__n128 *)(a1 + 16);
      __n128 v18 = a2[-1];
      __n128 v20 = a2[-4];
      __n128 v19 = a2[-3];
      *(__n128 *)(a1 + 32) = a2[-2];
      *(__n128 *)(a1 + 48) = v18;
      *(__n128 *)a1 = v20;
      *(__n128 *)(a1 + 16) = v19;
      *__n128 v13 = v17;
      v13[1] = v16;
      BOOL result = 1;
      v13[2] = v15;
      v13[3] = v14;
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (__n128 *)a2[-4].n128_u64, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), a2 - 4, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), (__n128 *)(a1 + 192), a2 - 4, a3);
      return 1;
    default:
      __n128 v21 = (__n128 *)(a1 + 128);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (_OWORD *)(a1 + 128), a3);
      __n128 v22 = (__n128 *)(a1 + 192);
      if ((__n128 *)(a1 + 192) == a2) {
        return 1;
      }
      uint64_t v23 = 0;
      int v24 = 0;
      break;
  }
  while (1)
  {
    __n128 v25 = *a3;
    __n128 v26 = v22[1];
    v50[0] = *v22;
    v50[1] = v26;
    __n128 v27 = v22[3];
    v50[2] = v22[2];
    v50[3] = v27;
    __n128 v28 = v21[3];
    __n128 v30 = *v21;
    __n128 v29 = v21[1];
    v49[2] = v21[2];
    v49[3] = v28;
    v49[0] = v30;
    v49[1] = v29;
    if (v25(v50, v49))
    {
      __n128 v31 = v22[1];
      __n128 v45 = *v22;
      __n128 v46 = v31;
      __n128 v32 = v22[3];
      __n128 v47 = v22[2];
      __n128 v48 = v32;
      uint64_t v33 = v23;
      while (1)
      {
        __n128 v34 = (_OWORD *)(a1 + v33);
        long long v35 = *(_OWORD *)(a1 + v33 + 144);
        v34[12] = *(_OWORD *)(a1 + v33 + 128);
        v34[13] = v35;
        long long v36 = *(_OWORD *)(a1 + v33 + 176);
        v34[14] = *(_OWORD *)(a1 + v33 + 160);
        v34[15] = v36;
        if (v33 == -128) {
          break;
        }
        __n128 v37 = *a3;
        v44[0] = v45;
        v44[1] = v46;
        v44[2] = v47;
        v44[3] = v48;
        long long v38 = v34[5];
        v43[0] = v34[4];
        v43[1] = v38;
        long long v39 = v34[7];
        v43[2] = v34[6];
        v43[3] = v39;
        v33 -= 64;
        if ((v37(v44, v43) & 1) == 0)
        {
          __n128 v40 = (_OWORD *)(a1 + v33 + 192);
          goto LABEL_12;
        }
      }
      __n128 v40 = (_OWORD *)a1;
LABEL_12:
      __n128 v41 = v46;
      *__n128 v40 = v45;
      v40[1] = v41;
      __n128 v42 = v48;
      v40[2] = v47;
      v40[3] = v42;
      if (++v24 == 8) {
        return &v22[4] == a2;
      }
    }
    __n128 v21 = v22;
    v23 += 64;
    v22 += 4;
    if (v22 == a2) {
      return 1;
    }
  }
}

BOOL CompareSortColor(double *a1, double *a2)
{
  return *a1 > *a2;
}

uint64_t isCloseToColor(ITColor *a1, double *a2, int a3, double a4)
{
  double var1 = a1->var1;
  if (!a3) {
    goto LABEL_13;
  }
  if (var1 >= 0.0500000007 || (double v8 = a2[1], v8 >= 0.0500000007))
  {
    if (a1->var3 >= 0.0149999997 || a2[3] >= 0.0149999997) {
      goto LABEL_13;
    }
    double v8 = a2[1];
  }
  v9.n128_f64[0] = ITColor::CreateFromHSVDoubles(a1, a1->var0, a1->var1, a1->var2);
  double v11 = v10;
  v9.n128_u64[1] = v12;
  __n128 v26 = v9;
  v14.n128_f64[0] = ITColor::CreateFromHSVDoubles(v13, *a2, v8, a2[2]);
  v14.n128_u64[1] = v15;
  ITColor::GetLuminance(v16, v14, v17);
  double v19 = v18;
  ITColor::GetLuminance(v20, v26, v11);
  if (v21 <= v19) {
    double v22 = v19;
  }
  else {
    double v22 = v21;
  }
  if (v21 > v19) {
    double v21 = v19;
  }
  if ((v22 + 0.0500000007) / (v21 + 0.0500000007) <= 1.65999997) {
    return 1;
  }
LABEL_13:
  if (vabdd_f64(var1, a2[1]) <= a4 && vabdd_f64(a1->var2, a2[2]) <= a4)
  {
    double var0 = a1->var0;
    double v24 = *a2;
    if (vabdd_f64(a1->var0, *a2) <= a4) {
      return 1;
    }
    if (var0 < a4) {
      double var0 = var0 + 1.0;
    }
    if (v24 < a4) {
      double v24 = v24 + 1.0;
    }
    if (vabdd_f64(var0, v24) <= a4) {
      return 1;
    }
  }
  return 0;
}

double ImageAnalyzer::WeightForPointOnEdge(ImageAnalyzer *this, unint64_t a2)
{
  double v2 = (double)(unint64_t)this;
  if ((unint64_t)this <= 4 && a2 <= 4)
  {
    double v3 = (double)a2;
    double v4 = 4.00000006 - v2;
    goto LABEL_4;
  }
  if ((unint64_t)this > 4)
  {
    if ((unint64_t)this >= 0x10 && a2 <= 4)
    {
      double v3 = (double)a2;
      double v4 = 15.9999999 - v2;
LABEL_4:
      double v5 = 4.00000006 - v3;
      if (v4 >= 1.0) {
        double v6 = v4 * 0.75;
      }
      else {
        double v6 = 0.75;
      }
      if (v5 >= 1.0) {
        double v7 = v5 * 0.75;
      }
      else {
        double v7 = 0.75;
      }
      if (v7 <= v6) {
        double v7 = v6;
      }
      goto LABEL_22;
    }
    double v7 = 1.0;
    if ((unint64_t)this < 0x10) {
      goto LABEL_22;
    }
    double v8 = 15.9999999;
  }
  else
  {
    double v8 = 4.00000006;
  }
  double v9 = v8 - v2;
  double v7 = 0.75;
  if (v9 >= 1.0) {
    double v7 = v9 * 0.75;
  }
LABEL_22:
  double result = 1.0;
  if (v7 >= 1.0) {
    return v7;
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(unint64_t a1)
{
  if (a1 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(56 * a1);
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(unint64_t a1, unint64_t a2, uint64_t (**a3)(long long *, long long *), uint64_t a4, char a5)
{
  while (2)
  {
    __n128 v300 = (long long *)(a2 - 112);
    unint64_t v303 = a2 - 56;
    __n128 v299 = (long long *)(a2 - 168);
    unint64_t v12 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v12;
          uint64_t v13 = a2 - v12;
          uint64_t v14 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(a2 - v12) >> 3);
          if (v6 || !v5)
          {
            switch(v14)
            {
              case 0:
              case 1:
                return;
              case 2:
                __n128 v137 = *a3;
                long long v139 = *(_OWORD *)(v303 + 16);
                long long v138 = *(_OWORD *)(v303 + 32);
                long long v140 = *(_OWORD *)v303;
                uint64_t v312 = *(void *)(v303 + 48);
                v311[1] = v139;
                v311[2] = v138;
                v311[0] = v140;
                long long v142 = *(_OWORD *)(a1 + 16);
                long long v141 = *(_OWORD *)(a1 + 32);
                long long v143 = *(_OWORD *)a1;
                uint64_t v310 = *(void *)(a1 + 48);
                v309[1] = v142;
                v309[2] = v141;
                v309[0] = v143;
                if (v137(v311, v309))
                {
                  long long v144 = *(_OWORD *)a1;
                  long long v145 = *(_OWORD *)(a1 + 16);
                  long long v146 = *(_OWORD *)(a1 + 32);
                  uint64_t v356 = *(void *)(a1 + 48);
                  long long v354 = v145;
                  long long v355 = v146;
                  long long v353 = v144;
                  long long v147 = *(_OWORD *)v303;
                  long long v148 = *(_OWORD *)(v303 + 16);
                  long long v149 = *(_OWORD *)(v303 + 32);
                  *(void *)(a1 + 48) = *(void *)(v303 + 48);
                  *(_OWORD *)(a1 + 16) = v148;
                  *(_OWORD *)(a1 + 32) = v149;
                  *(_OWORD *)a1 = v147;
                  long long v150 = v353;
                  long long v151 = v354;
                  long long v152 = v355;
                  *(void *)(v303 + 48) = v356;
                  *(_OWORD *)(v303 + 16) = v151;
                  *(_OWORD *)(v303 + 32) = v152;
                  *(_OWORD *)unint64_t v303 = v150;
                }
                break;
              case 3:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)a1, (long long *)(a1 + 56), (long long *)v303, (uint64_t (**)(void, void))a3);
                break;
              case 4:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 56, a1 + 112, (long long *)v303, (uint64_t (**)(void, void))a3);
                break;
              case 5:
                std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 56, a1 + 112, a1 + 168, (long long *)v303, (uint64_t (**)(void, void))a3);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v13 <= 1343)
          {
            unint64_t v153 = a1 + 56;
            BOOL v155 = a1 == a2 || v153 == a2;
            if (a5)
            {
              if (!v155)
              {
                uint64_t v156 = 0;
                unint64_t v157 = a1;
                do
                {
                  unint64_t v158 = v157;
                  unint64_t v157 = v153;
                  __n128 v159 = *a3;
                  long long v161 = *(_OWORD *)(v157 + 16);
                  long long v160 = *(_OWORD *)(v157 + 32);
                  long long v162 = *(_OWORD *)v157;
                  uint64_t v356 = *(void *)(v157 + 48);
                  long long v354 = v161;
                  long long v355 = v160;
                  long long v353 = v162;
                  long long v164 = *(_OWORD *)(v158 + 16);
                  long long v163 = *(_OWORD *)(v158 + 32);
                  long long v165 = *(_OWORD *)v158;
                  uint64_t v352 = *(void *)(v158 + 48);
                  long long v350 = v164;
                  long long v351 = v163;
                  long long v349 = v165;
                  if (v159(&v353, &v349))
                  {
                    long long v166 = *(_OWORD *)v157;
                    long long v167 = *(_OWORD *)(v157 + 16);
                    long long v168 = *(_OWORD *)(v157 + 32);
                    uint64_t v348 = *(void *)(v157 + 48);
                    long long v346 = v167;
                    long long v347 = v168;
                    long long v345 = v166;
                    uint64_t v169 = v156;
                    while (1)
                    {
                      uint64_t v170 = a1 + v169;
                      long long v171 = *(_OWORD *)(a1 + v169 + 16);
                      *(_OWORD *)(v170 + 56) = *(_OWORD *)(a1 + v169);
                      *(_OWORD *)(v170 + 72) = v171;
                      *(_OWORD *)(v170 + 88) = *(_OWORD *)(a1 + v169 + 32);
                      *(void *)(v170 + 104) = *(void *)(a1 + v169 + 48);
                      if (!v169) {
                        break;
                      }
                      v172 = *a3;
                      long long v341 = v345;
                      long long v342 = v346;
                      long long v343 = v347;
                      uint64_t v344 = v348;
                      long long v173 = *(_OWORD *)(v170 - 40);
                      long long v174 = *(_OWORD *)(v170 - 24);
                      long long v175 = *(_OWORD *)(v170 - 56);
                      uint64_t v340 = *(void *)(v170 - 8);
                      long long v338 = v173;
                      long long v339 = v174;
                      long long v337 = v175;
                      v169 -= 56;
                      if ((v172(&v341, &v337) & 1) == 0)
                      {
                        uint64_t v176 = a1 + v169 + 56;
                        goto LABEL_75;
                      }
                    }
                    uint64_t v176 = a1;
LABEL_75:
                    long long v177 = v345;
                    long long v178 = v346;
                    long long v179 = v347;
                    *(void *)(v176 + 48) = v348;
                    *(_OWORD *)(v176 + 16) = v178;
                    *(_OWORD *)(v176 + 32) = v179;
                    *(_OWORD *)uint64_t v176 = v177;
                  }
                  unint64_t v153 = v157 + 56;
                  v156 += 56;
                }
                while (v157 + 56 != a2);
              }
            }
            else if (!v155)
            {
              do
              {
                unint64_t v277 = a1;
                a1 = v153;
                v278 = *a3;
                long long v280 = *(_OWORD *)(a1 + 16);
                long long v279 = *(_OWORD *)(a1 + 32);
                long long v281 = *(_OWORD *)a1;
                uint64_t v356 = *(void *)(a1 + 48);
                long long v354 = v280;
                long long v355 = v279;
                long long v353 = v281;
                long long v283 = *(_OWORD *)(v277 + 16);
                long long v282 = *(_OWORD *)(v277 + 32);
                long long v284 = *(_OWORD *)v277;
                uint64_t v352 = *(void *)(v277 + 48);
                long long v350 = v283;
                long long v351 = v282;
                long long v349 = v284;
                if (v278(&v353, &v349))
                {
                  long long v285 = *(_OWORD *)a1;
                  long long v286 = *(_OWORD *)(a1 + 16);
                  long long v287 = *(_OWORD *)(a1 + 32);
                  uint64_t v348 = *(void *)(a1 + 48);
                  long long v346 = v286;
                  long long v347 = v287;
                  long long v345 = v285;
                  unint64_t v288 = a1;
                  do
                  {
                    unint64_t v289 = v288 - 56;
                    long long v290 = *(_OWORD *)(v288 - 40);
                    *(_OWORD *)unint64_t v288 = *(_OWORD *)(v288 - 56);
                    *(_OWORD *)(v288 + 16) = v290;
                    *(_OWORD *)(v288 + 32) = *(_OWORD *)(v288 - 24);
                    *(void *)(v288 + 48) = *(void *)(v288 - 8);
                    __n128 v291 = *a3;
                    long long v341 = v345;
                    long long v342 = v346;
                    long long v343 = v347;
                    uint64_t v344 = v348;
                    long long v293 = *(_OWORD *)(v288 - 96);
                    long long v292 = *(_OWORD *)(v288 - 80);
                    long long v294 = *(_OWORD *)(v288 - 112);
                    uint64_t v340 = *(void *)(v288 - 64);
                    long long v338 = v293;
                    long long v339 = v292;
                    long long v337 = v294;
                    char v295 = v291(&v341, &v337);
                    unint64_t v288 = v289;
                  }
                  while ((v295 & 1) != 0);
                  long long v296 = v345;
                  long long v297 = v346;
                  long long v298 = v347;
                  *(void *)(v289 + 48) = v348;
                  *(_OWORD *)(v289 + 16) = v297;
                  *(_OWORD *)(v289 + 32) = v298;
                  *(_OWORD *)unint64_t v289 = v296;
                }
                unint64_t v153 = a1 + 56;
              }
              while (a1 + 56 != a2);
            }
            return;
          }
          if (!a4)
          {
            if (a1 != a2)
            {
              int64_t v180 = (unint64_t)(v14 - 2) >> 1;
              v301 = (long long *)a2;
              int64_t v304 = v180;
              do
              {
                int64_t v181 = v180;
                if (v304 >= v180)
                {
                  uint64_t v182 = (2 * v180) | 1;
                  unint64_t v183 = a1 + 56 * v182;
                  if (2 * v180 + 2 < v14)
                  {
                    v184 = *a3;
                    long long v186 = *(_OWORD *)(v183 + 16);
                    long long v185 = *(_OWORD *)(v183 + 32);
                    long long v187 = *(_OWORD *)v183;
                    uint64_t v356 = *(void *)(v183 + 48);
                    long long v354 = v186;
                    long long v355 = v185;
                    long long v353 = v187;
                    long long v188 = *(_OWORD *)(v183 + 72);
                    long long v189 = *(_OWORD *)(v183 + 88);
                    long long v190 = *(_OWORD *)(v183 + 56);
                    uint64_t v352 = *(void *)(v183 + 104);
                    long long v350 = v188;
                    long long v351 = v189;
                    long long v349 = v190;
                    if (v184(&v353, &v349))
                    {
                      v183 += 56;
                      uint64_t v182 = 2 * v181 + 2;
                    }
                  }
                  unint64_t v191 = a1 + 56 * v181;
                  v192 = *a3;
                  long long v194 = *(_OWORD *)(v183 + 16);
                  long long v193 = *(_OWORD *)(v183 + 32);
                  long long v195 = *(_OWORD *)v183;
                  uint64_t v348 = *(void *)(v183 + 48);
                  long long v346 = v194;
                  long long v347 = v193;
                  long long v345 = v195;
                  long long v197 = *(_OWORD *)(v191 + 16);
                  long long v196 = *(_OWORD *)(v191 + 32);
                  long long v198 = *(_OWORD *)v191;
                  uint64_t v344 = *(void *)(v191 + 48);
                  long long v342 = v197;
                  long long v343 = v196;
                  long long v341 = v198;
                  if ((v192(&v345, &v341) & 1) == 0)
                  {
                    long long v199 = *(_OWORD *)v191;
                    long long v200 = *(_OWORD *)(v191 + 16);
                    long long v201 = *(_OWORD *)(v191 + 32);
                    uint64_t v340 = *(void *)(v191 + 48);
                    long long v338 = v200;
                    long long v339 = v201;
                    long long v337 = v199;
                    do
                    {
                      unint64_t v202 = v183;
                      long long v203 = *(_OWORD *)v183;
                      long long v204 = *(_OWORD *)(v183 + 16);
                      long long v205 = *(_OWORD *)(v183 + 32);
                      *(void *)(v191 + 48) = *(void *)(v183 + 48);
                      *(_OWORD *)(v191 + 16) = v204;
                      *(_OWORD *)(v191 + 32) = v205;
                      *(_OWORD *)unint64_t v191 = v203;
                      if (v304 < v182) {
                        break;
                      }
                      uint64_t v206 = (2 * v182) | 1;
                      unint64_t v183 = a1 + 56 * v206;
                      if (2 * v182 + 2 < v14)
                      {
                        uint64_t v207 = *a3;
                        long long v209 = *(_OWORD *)(v183 + 16);
                        long long v208 = *(_OWORD *)(v183 + 32);
                        long long v210 = *(_OWORD *)v183;
                        uint64_t v336 = *(void *)(v183 + 48);
                        long long v334 = v209;
                        long long v335 = v208;
                        long long v333 = v210;
                        long long v211 = *(_OWORD *)(v183 + 72);
                        long long v212 = *(_OWORD *)(v183 + 88);
                        long long v213 = *(_OWORD *)(v183 + 56);
                        uint64_t v332 = *(void *)(v183 + 104);
                        long long v330 = v211;
                        long long v331 = v212;
                        long long v329 = v213;
                        if (v207(&v333, &v329))
                        {
                          v183 += 56;
                          uint64_t v206 = 2 * v182 + 2;
                        }
                      }
                      __n128 v214 = *a3;
                      long long v216 = *(_OWORD *)(v183 + 16);
                      long long v215 = *(_OWORD *)(v183 + 32);
                      long long v217 = *(_OWORD *)v183;
                      uint64_t v328 = *(void *)(v183 + 48);
                      long long v326 = v216;
                      long long v327 = v215;
                      long long v325 = v217;
                      long long v321 = v337;
                      long long v322 = v338;
                      long long v323 = v339;
                      uint64_t v324 = v340;
                      unint64_t v191 = v202;
                      uint64_t v182 = v206;
                    }
                    while (!v214(&v325, &v321));
                    long long v218 = v337;
                    long long v219 = v338;
                    long long v220 = v339;
                    *(void *)(v202 + 48) = v340;
                    *(_OWORD *)(v202 + 16) = v219;
                    *(_OWORD *)(v202 + 32) = v220;
                    *(_OWORD *)unint64_t v202 = v218;
                  }
                }
                int64_t v180 = v181 - 1;
              }
              while (v181);
              int64_t v221 = v13 / 0x38uLL;
              uint64_t v222 = v301;
              do
              {
                uint64_t v223 = 0;
                long long v224 = *(_OWORD *)a1;
                long long v225 = *(_OWORD *)(a1 + 16);
                long long v226 = *(_OWORD *)(a1 + 32);
                uint64_t v336 = *(void *)(a1 + 48);
                long long v334 = v225;
                long long v335 = v226;
                long long v333 = v224;
                uint64_t v227 = v221 - 2;
                v302 = v222;
                if (v221 < 2) {
                  uint64_t v227 = v221 - 1;
                }
                uint64_t v228 = v227 >> 1;
                unint64_t v229 = a1;
                do
                {
                  uint64_t v230 = v229 + 56 * v223 + 56;
                  uint64_t v231 = (2 * v223) | 1;
                  uint64_t v232 = 2 * v223 + 2;
                  if (v232 < v221)
                  {
                    uint64_t v233 = *a3;
                    long long v235 = *(_OWORD *)(v230 + 16);
                    long long v234 = *(_OWORD *)(v230 + 32);
                    long long v236 = *(_OWORD *)v230;
                    uint64_t v356 = *(void *)(v230 + 48);
                    long long v354 = v235;
                    long long v355 = v234;
                    long long v353 = v236;
                    long long v237 = *(_OWORD *)(v230 + 72);
                    long long v238 = *(_OWORD *)(v230 + 88);
                    long long v239 = *(_OWORD *)(v230 + 56);
                    uint64_t v352 = *(void *)(v230 + 104);
                    long long v350 = v237;
                    long long v351 = v238;
                    long long v349 = v239;
                    if (v233(&v353, &v349))
                    {
                      v230 += 56;
                      uint64_t v231 = v232;
                    }
                  }
                  long long v240 = *(_OWORD *)v230;
                  long long v241 = *(_OWORD *)(v230 + 16);
                  long long v242 = *(_OWORD *)(v230 + 32);
                  *(void *)(v229 + 48) = *(void *)(v230 + 48);
                  *(_OWORD *)(v229 + 16) = v241;
                  *(_OWORD *)(v229 + 32) = v242;
                  *(_OWORD *)unint64_t v229 = v240;
                  unint64_t v229 = v230;
                  uint64_t v223 = v231;
                }
                while (v231 <= v228);
                uint64_t v222 = (long long *)((char *)v302 - 56);
                if ((long long *)v230 == (long long *)((char *)v302 - 56))
                {
                  long long v273 = v333;
                  long long v274 = v334;
                  long long v275 = v335;
                  *(void *)(v230 + 48) = v336;
                  *(_OWORD *)(v230 + 16) = v274;
                  *(_OWORD *)(v230 + 32) = v275;
                  *(_OWORD *)uint64_t v230 = v273;
                }
                else
                {
                  long long v243 = *v222;
                  long long v244 = *(long long *)((char *)v302 - 40);
                  long long v245 = *(long long *)((char *)v302 - 24);
                  *(void *)(v230 + 48) = *((void *)v302 - 1);
                  *(_OWORD *)(v230 + 16) = v244;
                  *(_OWORD *)(v230 + 32) = v245;
                  *(_OWORD *)uint64_t v230 = v243;
                  long long v246 = v333;
                  long long v247 = v334;
                  long long v248 = v335;
                  *((void *)v302 - 1) = v336;
                  *(long long *)((char *)v302 - 40) = v247;
                  *(long long *)((char *)v302 - 24) = v248;
                  *uint64_t v222 = v246;
                  uint64_t v249 = v230 - a1 + 56;
                  if (v249 >= 57)
                  {
                    unint64_t v250 = (unint64_t)(0x6DB6DB6DB6DB6DB7 * (v249 >> 3) - 2) >> 1;
                    unint64_t v251 = a1 + 56 * v250;
                    v252 = *a3;
                    long long v254 = *(_OWORD *)(v251 + 16);
                    long long v253 = *(_OWORD *)(v251 + 32);
                    long long v255 = *(_OWORD *)v251;
                    uint64_t v356 = *(void *)(v251 + 48);
                    long long v354 = v254;
                    long long v355 = v253;
                    long long v353 = v255;
                    long long v257 = *(_OWORD *)(v230 + 16);
                    long long v256 = *(_OWORD *)(v230 + 32);
                    long long v258 = *(_OWORD *)v230;
                    uint64_t v352 = *(void *)(v230 + 48);
                    long long v350 = v257;
                    long long v351 = v256;
                    long long v349 = v258;
                    if (v252(&v353, &v349))
                    {
                      long long v259 = *(_OWORD *)v230;
                      long long v260 = *(_OWORD *)(v230 + 16);
                      long long v261 = *(_OWORD *)(v230 + 32);
                      uint64_t v348 = *(void *)(v230 + 48);
                      long long v346 = v260;
                      long long v347 = v261;
                      long long v345 = v259;
                      do
                      {
                        uint64_t v262 = v251;
                        long long v263 = *(_OWORD *)v251;
                        long long v264 = *(_OWORD *)(v251 + 16);
                        long long v265 = *(_OWORD *)(v251 + 32);
                        *(void *)(v230 + 48) = *(void *)(v251 + 48);
                        *(_OWORD *)(v230 + 16) = v264;
                        *(_OWORD *)(v230 + 32) = v265;
                        *(_OWORD *)uint64_t v230 = v263;
                        if (!v250) {
                          break;
                        }
                        unint64_t v250 = (v250 - 1) >> 1;
                        __n128 v266 = *a3;
                        unint64_t v251 = a1 + 56 * v250;
                        long long v268 = *(_OWORD *)(v251 + 16);
                        long long v267 = *(_OWORD *)(v251 + 32);
                        long long v269 = *(_OWORD *)v251;
                        uint64_t v344 = *(void *)(v251 + 48);
                        long long v342 = v268;
                        long long v343 = v267;
                        long long v341 = v269;
                        long long v337 = v345;
                        long long v338 = v346;
                        long long v339 = v347;
                        uint64_t v340 = v348;
                        uint64_t v230 = v262;
                      }
                      while ((v266(&v341, &v337) & 1) != 0);
                      long long v270 = v345;
                      long long v271 = v346;
                      long long v272 = v347;
                      *(void *)(v262 + 48) = v348;
                      *(_OWORD *)(v262 + 16) = v271;
                      *(_OWORD *)(v262 + 32) = v272;
                      *(_OWORD *)uint64_t v262 = v270;
                    }
                  }
                }
              }
              while (v221-- > 2);
            }
            return;
          }
          unint64_t v15 = (unint64_t)v14 >> 1;
          unint64_t v16 = a1 + 56 * ((unint64_t)v14 >> 1);
          if ((unint64_t)v13 < 0x1C01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)v16, (long long *)a1, (long long *)v303, (uint64_t (**)(void, void))a3);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)a1, (long long *)v16, (long long *)v303, (uint64_t (**)(void, void))a3);
            uint64_t v17 = 56 * v15;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)(a1 + 56), (long long *)(v17 + a1 - 56), v300, (uint64_t (**)(void, void))a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)(a1 + 112), (long long *)(a1 + 56 + v17), v299, (uint64_t (**)(void, void))a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)(v17 + a1 - 56), (long long *)v16, (long long *)(a1 + 56 + v17), (uint64_t (**)(void, void))a3);
            long long v18 = *(_OWORD *)a1;
            long long v19 = *(_OWORD *)(a1 + 16);
            long long v20 = *(_OWORD *)(a1 + 32);
            uint64_t v356 = *(void *)(a1 + 48);
            long long v354 = v19;
            long long v355 = v20;
            long long v353 = v18;
            long long v21 = *(_OWORD *)v16;
            long long v22 = *(_OWORD *)(v16 + 16);
            long long v23 = *(_OWORD *)(v16 + 32);
            *(void *)(a1 + 48) = *(void *)(v16 + 48);
            *(_OWORD *)(a1 + 16) = v22;
            *(_OWORD *)(a1 + 32) = v23;
            *(_OWORD *)a1 = v21;
            long long v24 = v353;
            long long v25 = v354;
            long long v26 = v355;
            *(void *)(v16 + 48) = v356;
            *(_OWORD *)(v16 + 16) = v25;
            *(_OWORD *)(v16 + 32) = v26;
            *(_OWORD *)unint64_t v16 = v24;
          }
          --a4;
          if (a5) {
            break;
          }
          __n128 v27 = *a3;
          long long v28 = *(_OWORD *)(a1 - 40);
          long long v29 = *(_OWORD *)(a1 - 24);
          long long v30 = *(_OWORD *)(a1 - 56);
          uint64_t v308 = *(void *)(a1 - 8);
          v307[1] = v28;
          v307[2] = v29;
          v307[0] = v30;
          long long v32 = *(_OWORD *)(a1 + 16);
          long long v31 = *(_OWORD *)(a1 + 32);
          long long v33 = *(_OWORD *)a1;
          uint64_t v306 = *(void *)(a1 + 48);
          v305[1] = v32;
          v305[2] = v31;
          v305[0] = v33;
          if (v27(v307, v305)) {
            break;
          }
          long long v82 = *(_OWORD *)a1;
          long long v83 = *(_OWORD *)(a1 + 16);
          long long v84 = *(_OWORD *)(a1 + 32);
          uint64_t v352 = *(void *)(a1 + 48);
          long long v350 = v83;
          long long v351 = v84;
          long long v349 = v82;
          __n128 v85 = *a3;
          long long v87 = *(_OWORD *)(a1 + 16);
          long long v86 = *(_OWORD *)(a1 + 32);
          long long v88 = *(_OWORD *)a1;
          uint64_t v348 = *(void *)(a1 + 48);
          long long v346 = v87;
          long long v347 = v86;
          long long v345 = v88;
          uint64_t v89 = *(void *)(v303 + 48);
          long long v91 = *(_OWORD *)(v303 + 16);
          long long v90 = *(_OWORD *)(v303 + 32);
          long long v341 = *(_OWORD *)v303;
          long long v342 = v91;
          long long v343 = v90;
          uint64_t v344 = v89;
          if (v85(&v345, &v341))
          {
            unint64_t v92 = a1;
            do
            {
              unint64_t v12 = v92 + 56;
              __n128 v93 = *a3;
              long long v337 = v349;
              long long v338 = v350;
              long long v339 = v351;
              uint64_t v340 = v352;
              long long v94 = *(_OWORD *)(v92 + 72);
              long long v95 = *(_OWORD *)(v92 + 88);
              long long v96 = *(_OWORD *)(v92 + 56);
              uint64_t v336 = *(void *)(v92 + 104);
              long long v334 = v94;
              long long v335 = v95;
              long long v333 = v96;
              char v97 = v93(&v337, &v333);
              unint64_t v92 = v12;
            }
            while ((v97 & 1) == 0);
          }
          else
          {
            unint64_t v98 = a1 + 56;
            do
            {
              unint64_t v12 = v98;
              if (v98 >= a2) {
                break;
              }
              __n128 v99 = *a3;
              long long v337 = v349;
              long long v338 = v350;
              long long v339 = v351;
              uint64_t v340 = v352;
              long long v101 = *(_OWORD *)(v12 + 16);
              long long v100 = *(_OWORD *)(v12 + 32);
              long long v102 = *(_OWORD *)v12;
              uint64_t v336 = *(void *)(v12 + 48);
              long long v334 = v101;
              long long v335 = v100;
              long long v333 = v102;
              int v103 = v99(&v337, &v333);
              unint64_t v98 = v12 + 56;
            }
            while (!v103);
          }
          unint64_t v104 = a2;
          if (v12 < a2)
          {
            unint64_t v105 = a2;
            do
            {
              unint64_t v104 = v105 - 56;
              __n128 v106 = *a3;
              long long v329 = v349;
              long long v330 = v350;
              long long v331 = v351;
              uint64_t v332 = v352;
              long long v107 = *(_OWORD *)(v105 - 40);
              long long v108 = *(_OWORD *)(v105 - 24);
              long long v109 = *(_OWORD *)(v105 - 56);
              uint64_t v328 = *(void *)(v105 - 8);
              long long v326 = v107;
              long long v327 = v108;
              long long v325 = v109;
              char v110 = v106(&v329, &v325);
              unint64_t v105 = v104;
            }
            while ((v110 & 1) != 0);
          }
          while (v12 < v104)
          {
            long long v111 = *(_OWORD *)v12;
            long long v112 = *(_OWORD *)(v12 + 16);
            long long v113 = *(_OWORD *)(v12 + 32);
            uint64_t v356 = *(void *)(v12 + 48);
            long long v354 = v112;
            long long v355 = v113;
            long long v353 = v111;
            long long v114 = *(_OWORD *)v104;
            long long v115 = *(_OWORD *)(v104 + 16);
            long long v116 = *(_OWORD *)(v104 + 32);
            *(void *)(v12 + 48) = *(void *)(v104 + 48);
            *(_OWORD *)(v12 + 16) = v115;
            *(_OWORD *)(v12 + 32) = v116;
            *(_OWORD *)unint64_t v12 = v114;
            long long v117 = v353;
            long long v118 = v354;
            long long v119 = v355;
            *(void *)(v104 + 48) = v356;
            *(_OWORD *)(v104 + 16) = v118;
            *(_OWORD *)(v104 + 32) = v119;
            *(_OWORD *)unint64_t v104 = v117;
            do
            {
              long long v321 = v349;
              long long v322 = v350;
              long long v323 = v351;
              uint64_t v324 = v352;
              long long v120 = *(_OWORD *)(v12 + 72);
              long long v121 = *(_OWORD *)(v12 + 88);
              uint64_t v122 = *(void *)(v12 + 104);
              long long v123 = *(_OWORD *)(v12 + 56);
              v12 += 56;
              __n128 v124 = *a3;
              uint64_t v320 = v122;
              long long v318 = v120;
              long long v319 = v121;
              long long v317 = v123;
            }
            while (!v124(&v321, &v317));
            do
            {
              v315[0] = v349;
              v315[1] = v350;
              v315[2] = v351;
              uint64_t v316 = v352;
              long long v125 = *(_OWORD *)(v104 - 40);
              long long v126 = *(_OWORD *)(v104 - 24);
              uint64_t v127 = *(void *)(v104 - 8);
              long long v128 = *(_OWORD *)(v104 - 56);
              v104 -= 56;
              __n128 v129 = *a3;
              uint64_t v314 = v127;
              v313[1] = v125;
              v313[2] = v126;
              v313[0] = v128;
            }
            while ((v129(v315, v313) & 1) != 0);
          }
          __n128 v130 = (long long *)(v12 - 56);
          BOOL v5 = v12 - 56 >= a1;
          BOOL v6 = v12 - 56 == a1;
          if (v12 - 56 != a1)
          {
            long long v131 = *v130;
            long long v132 = *(_OWORD *)(v12 - 40);
            long long v133 = *(_OWORD *)(v12 - 24);
            *(void *)(a1 + 48) = *(void *)(v12 - 8);
            *(_OWORD *)(a1 + 16) = v132;
            *(_OWORD *)(a1 + 32) = v133;
            *(_OWORD *)a1 = v131;
          }
          a5 = 0;
          long long v134 = v349;
          long long v135 = v350;
          long long v136 = v351;
          *(void *)(v12 - 8) = v352;
          *(_OWORD *)(v12 - 40) = v135;
          *(_OWORD *)(v12 - 24) = v136;
          *__n128 v130 = v134;
        }
        long long v34 = *(_OWORD *)a1;
        long long v35 = *(_OWORD *)(a1 + 16);
        long long v36 = *(_OWORD *)(a1 + 32);
        uint64_t v352 = *(void *)(a1 + 48);
        long long v350 = v35;
        long long v351 = v36;
        long long v349 = v34;
        unint64_t v37 = a1;
        do
        {
          uint64_t v38 = v37;
          long long v39 = *a3;
          v37 += 56;
          long long v40 = *(_OWORD *)(v38 + 72);
          long long v41 = *(_OWORD *)(v38 + 88);
          long long v42 = *(_OWORD *)(v38 + 56);
          uint64_t v348 = *(void *)(v38 + 104);
          long long v346 = v40;
          long long v347 = v41;
          long long v345 = v42;
          long long v341 = v349;
          long long v342 = v350;
          long long v343 = v351;
          uint64_t v344 = v352;
        }
        while ((v39(&v345, &v341) & 1) != 0);
        uint64_t v43 = a2;
        unint64_t v44 = a2;
        if (v38 == a1)
        {
          unint64_t v51 = a2;
          while (v37 < v51)
          {
            __n128 v52 = *a3;
            unint64_t v45 = v51 - 56;
            long long v53 = *(_OWORD *)(v51 - 40);
            long long v54 = *(_OWORD *)(v51 - 24);
            long long v55 = *(_OWORD *)(v51 - 56);
            uint64_t v340 = *(void *)(v51 - 8);
            long long v338 = v53;
            long long v339 = v54;
            long long v337 = v55;
            long long v333 = v349;
            long long v334 = v350;
            long long v335 = v351;
            uint64_t v336 = v352;
            char v56 = v52(&v337, &v333);
            unint64_t v51 = v45;
            if (v56) {
              goto LABEL_21;
            }
          }
          unint64_t v45 = v51;
        }
        else
        {
          do
          {
            unint64_t v45 = v44 - 56;
            __n128 v46 = *a3;
            long long v47 = *(_OWORD *)(v44 - 40);
            long long v48 = *(_OWORD *)(v44 - 24);
            long long v49 = *(_OWORD *)(v44 - 56);
            uint64_t v340 = *(void *)(v44 - 8);
            long long v338 = v47;
            long long v339 = v48;
            long long v337 = v49;
            long long v333 = v349;
            long long v334 = v350;
            long long v335 = v351;
            uint64_t v336 = v352;
            int v50 = v46(&v337, &v333);
            unint64_t v44 = v45;
          }
          while (!v50);
        }
LABEL_21:
        if (v37 < v45)
        {
          unint64_t v57 = v37;
          unint64_t v58 = v45;
          do
          {
            long long v60 = *(_OWORD *)(v57 + 16);
            long long v353 = *(_OWORD *)v57;
            long long v59 = v353;
            long long v354 = v60;
            long long v355 = *(_OWORD *)(v57 + 32);
            long long v61 = v355;
            uint64_t v356 = *(void *)(v57 + 48);
            uint64_t v62 = v356;
            uint64_t v63 = *(void *)(v58 + 48);
            long long v65 = *(_OWORD *)(v58 + 16);
            long long v64 = *(_OWORD *)(v58 + 32);
            *(_OWORD *)unint64_t v57 = *(_OWORD *)v58;
            *(_OWORD *)(v57 + 16) = v65;
            *(_OWORD *)(v57 + 32) = v64;
            *(void *)(v57 + 48) = v63;
            *(_OWORD *)(v58 + 16) = v60;
            *(_OWORD *)(v58 + 32) = v61;
            *(void *)(v58 + 48) = v62;
            *(_OWORD *)unint64_t v58 = v59;
            do
            {
              uint64_t v38 = v57;
              long long v66 = *a3;
              v57 += 56;
              long long v67 = *(_OWORD *)(v38 + 72);
              long long v68 = *(_OWORD *)(v38 + 88);
              long long v69 = *(_OWORD *)(v38 + 56);
              uint64_t v332 = *(void *)(v38 + 104);
              long long v330 = v67;
              long long v331 = v68;
              long long v329 = v69;
              long long v325 = v349;
              long long v326 = v350;
              long long v327 = v351;
              uint64_t v328 = v352;
            }
            while ((v66(&v329, &v325) & 1) != 0);
            do
            {
              long long v70 = *(_OWORD *)(v58 - 40);
              long long v71 = *(_OWORD *)(v58 - 24);
              uint64_t v72 = *(void *)(v58 - 8);
              long long v73 = *(_OWORD *)(v58 - 56);
              v58 -= 56;
              __n128 v74 = *a3;
              uint64_t v324 = v72;
              long long v322 = v70;
              long long v323 = v71;
              long long v321 = v73;
              long long v317 = v349;
              long long v318 = v350;
              long long v319 = v351;
              uint64_t v320 = v352;
            }
            while (!v74(&v321, &v317));
          }
          while (v57 < v58);
        }
        if (v38 != a1)
        {
          long long v75 = *(_OWORD *)v38;
          long long v76 = *(_OWORD *)(v38 + 16);
          long long v77 = *(_OWORD *)(v38 + 32);
          *(void *)(a1 + 48) = *(void *)(v38 + 48);
          *(_OWORD *)(a1 + 16) = v76;
          *(_OWORD *)(a1 + 32) = v77;
          *(_OWORD *)a1 = v75;
        }
        long long v78 = v349;
        long long v79 = v350;
        long long v80 = v351;
        *(void *)(v38 + 48) = v352;
        *(_OWORD *)(v38 + 16) = v79;
        *(_OWORD *)(v38 + 32) = v80;
        *(_OWORD *)uint64_t v38 = v78;
        BOOL v5 = v37 >= v45;
        a2 = v43;
        if (v5) {
          break;
        }
LABEL_33:
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(a1, v38, a3, a4, a5 & 1);
        a5 = 0;
        unint64_t v12 = v38 + 56;
      }
      BOOL v81 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, v38, (uint64_t (**)(void, void))a3);
      unint64_t v12 = v38 + 56;
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v38 + 56, v43, (uint64_t (**)(void, void))a3))
      {
        break;
      }
      if (!v81) {
        goto LABEL_33;
      }
    }
    a2 = v38;
    if (!v81) {
      continue;
    }
    break;
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(long long *a1, long long *a2, long long *a3, uint64_t (**a4)(void, void))
{
  double v8 = *a4;
  long long v9 = a2[1];
  v81[0] = *a2;
  v81[1] = v9;
  v81[2] = a2[2];
  uint64_t v82 = *((void *)a2 + 6);
  long long v10 = a1[1];
  v79[0] = *a1;
  v79[1] = v10;
  v79[2] = a1[2];
  uint64_t v80 = *((void *)a1 + 6);
  char v11 = v8(v81, v79);
  unint64_t v12 = *a4;
  if (v11)
  {
    long long v13 = a3[1];
    v69[0] = *a3;
    v69[1] = v13;
    v69[2] = a3[2];
    uint64_t v70 = *((void *)a3 + 6);
    long long v14 = a2[1];
    v67[0] = *a2;
    v67[1] = v14;
    v67[2] = a2[2];
    uint64_t v68 = *((void *)a2 + 6);
    uint64_t result = v12(v69, v67);
    if (result)
    {
      uint64_t v16 = *((void *)a1 + 6);
      long long v18 = a1[1];
      long long v17 = a1[2];
      long long v19 = *a1;
      long long v21 = a3[1];
      long long v20 = a3[2];
      long long v22 = *a3;
      *((void *)a1 + 6) = *((void *)a3 + 6);
      a1[1] = v21;
      a1[2] = v20;
      *a1 = v22;
    }
    else
    {
      uint64_t v46 = *((void *)a1 + 6);
      long long v48 = a1[1];
      long long v47 = a1[2];
      long long v49 = *a1;
      long long v51 = a2[1];
      long long v50 = a2[2];
      long long v52 = *a2;
      *((void *)a1 + 6) = *((void *)a2 + 6);
      a1[1] = v51;
      a1[2] = v50;
      *a1 = v52;
      *a2 = v49;
      a2[1] = v48;
      a2[2] = v47;
      *((void *)a2 + 6) = v46;
      long long v53 = *a4;
      long long v54 = *a3;
      long long v55 = a3[1];
      long long v56 = a3[2];
      uint64_t v66 = *((void *)a3 + 6);
      v65[1] = v55;
      v65[2] = v56;
      v65[0] = v54;
      long long v57 = *a2;
      long long v58 = a2[1];
      long long v59 = a2[2];
      uint64_t v64 = *((void *)a2 + 6);
      v63[1] = v58;
      v63[2] = v59;
      v63[0] = v57;
      uint64_t result = v53(v65, v63);
      if (!result) {
        return result;
      }
      uint64_t v16 = *((void *)a2 + 6);
      long long v18 = a2[1];
      long long v17 = a2[2];
      long long v19 = *a2;
      long long v61 = a3[1];
      long long v60 = a3[2];
      long long v62 = *a3;
      *((void *)a2 + 6) = *((void *)a3 + 6);
      a2[1] = v61;
      a2[2] = v60;
      *a2 = v62;
    }
    *a3 = v19;
    a3[1] = v18;
    a3[2] = v17;
    *((void *)a3 + 6) = v16;
  }
  else
  {
    long long v23 = a3[1];
    v77[0] = *a3;
    v77[1] = v23;
    v77[2] = a3[2];
    uint64_t v78 = *((void *)a3 + 6);
    long long v24 = a2[1];
    v75[0] = *a2;
    v75[1] = v24;
    v75[2] = a2[2];
    uint64_t v76 = *((void *)a2 + 6);
    uint64_t result = v12(v77, v75);
    if (result)
    {
      uint64_t v25 = *((void *)a2 + 6);
      long long v27 = a2[1];
      long long v26 = a2[2];
      long long v28 = *a2;
      long long v30 = a3[1];
      long long v29 = a3[2];
      long long v31 = *a3;
      *((void *)a2 + 6) = *((void *)a3 + 6);
      a2[1] = v30;
      a2[2] = v29;
      *a2 = v31;
      *a3 = v28;
      a3[1] = v27;
      a3[2] = v26;
      *((void *)a3 + 6) = v25;
      long long v32 = *a4;
      long long v33 = *a2;
      long long v34 = a2[1];
      long long v35 = a2[2];
      uint64_t v74 = *((void *)a2 + 6);
      v73[1] = v34;
      v73[2] = v35;
      v73[0] = v33;
      long long v36 = *a1;
      long long v37 = a1[1];
      long long v38 = a1[2];
      uint64_t v72 = *((void *)a1 + 6);
      v71[1] = v37;
      v71[2] = v38;
      v71[0] = v36;
      uint64_t result = v32(v73, v71);
      if (result)
      {
        uint64_t v39 = *((void *)a1 + 6);
        long long v41 = a1[1];
        long long v40 = a1[2];
        long long v42 = *a1;
        long long v44 = a2[1];
        long long v43 = a2[2];
        long long v45 = *a2;
        *((void *)a1 + 6) = *((void *)a2 + 6);
        a1[1] = v44;
        a1[2] = v43;
        *a1 = v45;
        *a2 = v42;
        a2[1] = v41;
        a2[2] = v40;
        *((void *)a2 + 6) = v39;
      }
    }
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4, uint64_t (**a5)(void, void))
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)a1, (long long *)a2, (long long *)a3, a5);
  long long v10 = *a5;
  long long v11 = a4[1];
  v58[0] = *a4;
  v58[1] = v11;
  v58[2] = a4[2];
  uint64_t v59 = *((void *)a4 + 6);
  long long v12 = *(_OWORD *)(a3 + 16);
  v56[0] = *(_OWORD *)a3;
  v56[1] = v12;
  v56[2] = *(_OWORD *)(a3 + 32);
  uint64_t v57 = *(void *)(a3 + 48);
  if (v10(v58, v56))
  {
    uint64_t v14 = *(void *)(a3 + 48);
    long long v16 = *(_OWORD *)(a3 + 16);
    long long v15 = *(_OWORD *)(a3 + 32);
    long long v17 = *(_OWORD *)a3;
    long long v19 = a4[1];
    long long v18 = a4[2];
    long long v20 = *a4;
    *(void *)(a3 + 48) = *((void *)a4 + 6);
    *(_OWORD *)(a3 + 16) = v19;
    *(_OWORD *)(a3 + 32) = v18;
    *(_OWORD *)a3 = v20;
    *a4 = v17;
    a4[1] = v16;
    a4[2] = v15;
    *((void *)a4 + 6) = v14;
    long long v21 = *a5;
    long long v22 = *(_OWORD *)a3;
    long long v23 = *(_OWORD *)(a3 + 16);
    long long v24 = *(_OWORD *)(a3 + 32);
    uint64_t v55 = *(void *)(a3 + 48);
    v54[1] = v23;
    v54[2] = v24;
    v54[0] = v22;
    long long v25 = *(_OWORD *)a2;
    long long v26 = *(_OWORD *)(a2 + 16);
    long long v27 = *(_OWORD *)(a2 + 32);
    uint64_t v53 = *(void *)(a2 + 48);
    v52[1] = v26;
    v52[2] = v27;
    v52[0] = v25;
    if (v21(v54, v52))
    {
      uint64_t v28 = *(void *)(a2 + 48);
      long long v30 = *(_OWORD *)(a2 + 16);
      long long v29 = *(_OWORD *)(a2 + 32);
      long long v31 = *(_OWORD *)a2;
      long long v33 = *(_OWORD *)(a3 + 16);
      long long v32 = *(_OWORD *)(a3 + 32);
      long long v34 = *(_OWORD *)a3;
      *(void *)(a2 + 48) = *(void *)(a3 + 48);
      *(_OWORD *)(a2 + 16) = v33;
      *(_OWORD *)(a2 + 32) = v32;
      *(_OWORD *)a2 = v34;
      *(_OWORD *)a3 = v31;
      *(_OWORD *)(a3 + 16) = v30;
      *(_OWORD *)(a3 + 32) = v29;
      *(void *)(a3 + 48) = v28;
      long long v35 = *a5;
      long long v36 = *(_OWORD *)a2;
      long long v37 = *(_OWORD *)(a2 + 16);
      long long v38 = *(_OWORD *)(a2 + 32);
      uint64_t v51 = *(void *)(a2 + 48);
      v50[1] = v37;
      v50[2] = v38;
      v50[0] = v36;
      long long v39 = *(_OWORD *)a1;
      long long v40 = *(_OWORD *)(a1 + 16);
      long long v41 = *(_OWORD *)(a1 + 32);
      uint64_t v49 = *(void *)(a1 + 48);
      v48[1] = v40;
      v48[2] = v41;
      v48[0] = v39;
      if (v35(v50, v48))
      {
        uint64_t v42 = *(void *)(a1 + 48);
        long long v43 = *(_OWORD *)(a1 + 16);
        __n128 result = *(__n128 *)(a1 + 32);
        long long v44 = *(_OWORD *)a1;
        long long v46 = *(_OWORD *)(a2 + 16);
        long long v45 = *(_OWORD *)(a2 + 32);
        long long v47 = *(_OWORD *)a2;
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(_OWORD *)(a1 + 16) = v46;
        *(_OWORD *)(a1 + 32) = v45;
        *(_OWORD *)a1 = v47;
        *(_OWORD *)a2 = v44;
        *(_OWORD *)(a2 + 16) = v43;
        *(__n128 *)(a2 + 32) = result;
        *(void *)(a2 + 48) = v42;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t (**a6)(void, void))
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a2, a3, (long long *)a4, a6);
  long long v12 = *a6;
  long long v13 = a5[1];
  v78[0] = *a5;
  v78[1] = v13;
  v78[2] = a5[2];
  uint64_t v79 = *((void *)a5 + 6);
  long long v14 = *(_OWORD *)(a4 + 16);
  v76[0] = *(_OWORD *)a4;
  v76[1] = v14;
  _OWORD v76[2] = *(_OWORD *)(a4 + 32);
  uint64_t v77 = *(void *)(a4 + 48);
  if (v12(v78, v76))
  {
    uint64_t v16 = *(void *)(a4 + 48);
    long long v18 = *(_OWORD *)(a4 + 16);
    long long v17 = *(_OWORD *)(a4 + 32);
    long long v19 = *(_OWORD *)a4;
    long long v21 = a5[1];
    long long v20 = a5[2];
    long long v22 = *a5;
    *(void *)(a4 + 48) = *((void *)a5 + 6);
    *(_OWORD *)(a4 + 16) = v21;
    *(_OWORD *)(a4 + 32) = v20;
    *(_OWORD *)a4 = v22;
    *a5 = v19;
    a5[1] = v18;
    a5[2] = v17;
    *((void *)a5 + 6) = v16;
    long long v23 = *a6;
    long long v24 = *(_OWORD *)a4;
    long long v25 = *(_OWORD *)(a4 + 16);
    long long v26 = *(_OWORD *)(a4 + 32);
    uint64_t v75 = *(void *)(a4 + 48);
    v74[1] = v25;
    v74[2] = v26;
    v74[0] = v24;
    long long v27 = *(_OWORD *)a3;
    long long v28 = *(_OWORD *)(a3 + 16);
    long long v29 = *(_OWORD *)(a3 + 32);
    uint64_t v73 = *(void *)(a3 + 48);
    v72[1] = v28;
    v72[2] = v29;
    v72[0] = v27;
    if (v23(v74, v72))
    {
      uint64_t v30 = *(void *)(a3 + 48);
      long long v32 = *(_OWORD *)(a3 + 16);
      long long v31 = *(_OWORD *)(a3 + 32);
      long long v33 = *(_OWORD *)a3;
      long long v35 = *(_OWORD *)(a4 + 16);
      long long v34 = *(_OWORD *)(a4 + 32);
      long long v36 = *(_OWORD *)a4;
      *(void *)(a3 + 48) = *(void *)(a4 + 48);
      *(_OWORD *)(a3 + 16) = v35;
      *(_OWORD *)(a3 + 32) = v34;
      *(_OWORD *)a3 = v36;
      *(_OWORD *)a4 = v33;
      *(_OWORD *)(a4 + 16) = v32;
      *(_OWORD *)(a4 + 32) = v31;
      *(void *)(a4 + 48) = v30;
      long long v37 = *a6;
      long long v38 = *(_OWORD *)a3;
      long long v39 = *(_OWORD *)(a3 + 16);
      long long v40 = *(_OWORD *)(a3 + 32);
      uint64_t v71 = *(void *)(a3 + 48);
      v70[1] = v39;
      v70[2] = v40;
      v70[0] = v38;
      long long v41 = *(_OWORD *)a2;
      long long v42 = *(_OWORD *)(a2 + 16);
      long long v43 = *(_OWORD *)(a2 + 32);
      uint64_t v69 = *(void *)(a2 + 48);
      v68[1] = v42;
      v68[2] = v43;
      v68[0] = v41;
      if (v37(v70, v68))
      {
        uint64_t v44 = *(void *)(a2 + 48);
        long long v46 = *(_OWORD *)(a2 + 16);
        long long v45 = *(_OWORD *)(a2 + 32);
        long long v47 = *(_OWORD *)a2;
        long long v49 = *(_OWORD *)(a3 + 16);
        long long v48 = *(_OWORD *)(a3 + 32);
        long long v50 = *(_OWORD *)a3;
        *(void *)(a2 + 48) = *(void *)(a3 + 48);
        *(_OWORD *)(a2 + 16) = v49;
        *(_OWORD *)(a2 + 32) = v48;
        *(_OWORD *)a2 = v50;
        *(_OWORD *)a3 = v47;
        *(_OWORD *)(a3 + 16) = v46;
        *(_OWORD *)(a3 + 32) = v45;
        *(void *)(a3 + 48) = v44;
        uint64_t v51 = *a6;
        long long v52 = *(_OWORD *)a2;
        long long v53 = *(_OWORD *)(a2 + 16);
        long long v54 = *(_OWORD *)(a2 + 32);
        uint64_t v67 = *(void *)(a2 + 48);
        v66[1] = v53;
        v66[2] = v54;
        v66[0] = v52;
        long long v55 = *(_OWORD *)a1;
        long long v56 = *(_OWORD *)(a1 + 16);
        long long v57 = *(_OWORD *)(a1 + 32);
        uint64_t v65 = *(void *)(a1 + 48);
        v64[1] = v56;
        v64[2] = v57;
        v64[0] = v55;
        if (v51(v66, v64))
        {
          uint64_t v58 = *(void *)(a1 + 48);
          long long v59 = *(_OWORD *)(a1 + 16);
          __n128 result = *(__n128 *)(a1 + 32);
          long long v60 = *(_OWORD *)a1;
          long long v62 = *(_OWORD *)(a2 + 16);
          long long v61 = *(_OWORD *)(a2 + 32);
          long long v63 = *(_OWORD *)a2;
          *(void *)(a1 + 48) = *(void *)(a2 + 48);
          *(_OWORD *)(a1 + 16) = v62;
          *(_OWORD *)(a1 + 32) = v61;
          *(_OWORD *)a1 = v63;
          *(_OWORD *)a2 = v60;
          *(_OWORD *)(a2 + 16) = v59;
          *(__n128 *)(a2 + 32) = result;
          *(void *)(a2 + 48) = v58;
        }
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(void, void))
{
  uint64_t v6 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0x6DB6DB6DB6DB6DB7 * v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      double v8 = *a3;
      long long v9 = *(_OWORD *)(a2 - 40);
      v50[0] = *(_OWORD *)(a2 - 56);
      v50[1] = v9;
      v50[2] = *(_OWORD *)(a2 - 24);
      uint64_t v51 = *(void *)(a2 - 8);
      long long v10 = *(_OWORD *)(a1 + 16);
      v48[0] = *(_OWORD *)a1;
      v48[1] = v10;
      v48[2] = *(_OWORD *)(a1 + 32);
      uint64_t v49 = *(void *)(a1 + 48);
      if (!v8(v50, v48)) {
        return 1;
      }
      uint64_t v11 = a2 - 56;
      uint64_t v12 = *(void *)(a1 + 48);
      long long v14 = *(_OWORD *)(a1 + 16);
      long long v13 = *(_OWORD *)(a1 + 32);
      long long v15 = *(_OWORD *)a1;
      long long v17 = *(_OWORD *)(a2 - 40);
      long long v16 = *(_OWORD *)(a2 - 24);
      long long v18 = *(_OWORD *)(a2 - 56);
      *(void *)(a1 + 48) = *(void *)(a2 - 8);
      *(_OWORD *)(a1 + 16) = v17;
      *(_OWORD *)(a1 + 32) = v16;
      *(_OWORD *)a1 = v18;
      *(_OWORD *)uint64_t v11 = v15;
      *(_OWORD *)(v11 + 16) = v14;
      *(_OWORD *)(v11 + 32) = v13;
      BOOL result = 1;
      *(void *)(v11 + 48) = v12;
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)a1, (long long *)(a1 + 56), (long long *)(a2 - 56), a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 56, a1 + 112, (long long *)(a2 - 56), a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 56, a1 + 112, a1 + 168, (long long *)(a2 - 56), a3);
      return 1;
    default:
      uint64_t v19 = a1 + 112;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((long long *)a1, (long long *)(a1 + 56), (long long *)(a1 + 112), a3);
      uint64_t v20 = a1 + 168;
      if (a1 + 168 == a2) {
        return 1;
      }
      uint64_t v21 = 0;
      int v22 = 0;
      break;
  }
  while (1)
  {
    long long v23 = *a3;
    long long v24 = *(_OWORD *)(v20 + 16);
    v46[0] = *(_OWORD *)v20;
    v46[1] = v24;
    v46[2] = *(_OWORD *)(v20 + 32);
    uint64_t v47 = *(void *)(v20 + 48);
    long long v26 = *(_OWORD *)(v19 + 16);
    long long v25 = *(_OWORD *)(v19 + 32);
    long long v27 = *(_OWORD *)v19;
    uint64_t v45 = *(void *)(v19 + 48);
    v44[1] = v26;
    v44[2] = v25;
    v44[0] = v27;
    if (v23(v46, v44))
    {
      long long v28 = *(_OWORD *)(v20 + 16);
      long long v40 = *(_OWORD *)v20;
      long long v41 = v28;
      long long v42 = *(_OWORD *)(v20 + 32);
      uint64_t v43 = *(void *)(v20 + 48);
      uint64_t v29 = v21;
      while (1)
      {
        uint64_t v30 = a1 + v29;
        long long v31 = *(_OWORD *)(a1 + v29 + 128);
        *(_OWORD *)(v30 + 168) = *(_OWORD *)(a1 + v29 + 112);
        *(_OWORD *)(v30 + 184) = v31;
        *(_OWORD *)(v30 + 200) = *(_OWORD *)(a1 + v29 + 144);
        *(void *)(v30 + 216) = *(void *)(a1 + v29 + 160);
        if (v29 == -112) {
          break;
        }
        long long v32 = *a3;
        v38[0] = v40;
        v38[1] = v41;
        v38[2] = v42;
        uint64_t v39 = v43;
        long long v33 = *(_OWORD *)(v30 + 72);
        v36[0] = *(_OWORD *)(v30 + 56);
        v36[1] = v33;
        v36[2] = *(_OWORD *)(v30 + 88);
        uint64_t v37 = *(void *)(v30 + 104);
        v29 -= 56;
        if ((v32(v38, v36) & 1) == 0)
        {
          uint64_t v34 = a1 + v29 + 168;
          goto LABEL_12;
        }
      }
      uint64_t v34 = a1;
LABEL_12:
      long long v35 = v41;
      *(_OWORD *)uint64_t v34 = v40;
      *(_OWORD *)(v34 + 16) = v35;
      *(_OWORD *)(v34 + 32) = v42;
      *(void *)(v34 + 48) = v43;
      if (++v22 == 8) {
        return v20 + 56 == a2;
      }
    }
    uint64_t v19 = v20;
    v21 += 56;
    v20 += 56;
    if (v20 == a2) {
      return 1;
    }
  }
}

BOOL CompareQuantizeSortcolor(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 48) > *(double *)(a2 + 48);
}

uint64_t final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_1>::~final_act(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    double v2 = *(CGImage **)a1;
    if (*(void *)a1) {
      CGImageRelease(v2);
    }
  }
  return a1;
}

uint64_t final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_0>::~final_act(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    CGContextRelease(*(CGContextRef *)a1);
  }
  return a1;
}

void AnalyzeImagePlease(CGContext *a1, AnalyzedImageColors *a2)
{
  __n128 v72 = 0uLL;
  double v73 = 0.0;
  long long v74 = 0x3FF0000000000000uLL;
  long long v75 = 0uLL;
  long long v76 = 0x3FF0000000000000uLL;
  long long v77 = 0uLL;
  long long v78 = 0x3FF0000000000000uLL;
  long long v79 = 0uLL;
  long long v80 = 0x3FF0000000000000uLL;
  long long v81 = 0uLL;
  long long v82 = 0x3FF0000000000000uLL;
  long long v83 = 0uLL;
  uint64_t v84 = 0x3FF0000000000000;
  long long v85 = 0uLL;
  *(void *)&long long v86 = 0;
  *((void *)&v86 + 1) = 0x3FF0000000000000;
  long long v87 = 0uLL;
  *(void *)&long long v88 = 0;
  *((void *)&v88 + 1) = 0x3FF0000000000000;
  long long v89 = 0uLL;
  *(void *)&long long v90 = 0;
  *((void *)&v90 + 1) = 0x3FF0000000000000;
  v71[0] = 0;
  v71[1] = 0;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(a1);
  int Width = CGBitmapContextGetWidth(a1);
  int Height = CGBitmapContextGetHeight(a1);
  char v7 = Height;
  if (Height != 22 || Width != 22)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 5, "ImageAnalyzer::GenerateColorMaps() - invalid height (%ud) or width (%ud) parameter", v50, v51, v52, v53, v54, v7);
    goto LABEL_21;
  }
  __int16 BitmapInfo = CGBitmapContextGetBitmapInfo(a1);
  Data = (char *)CGBitmapContextGetData(a1);
  if (!Data)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 3, "ImageAnalyzer::GenerateColorMaps() - Failed to obtain bitmap image data", v55, v56, v57, v58, v59, v65);
    goto LABEL_21;
  }
  long long v10 = (char *)malloc_type_calloc(0x1E4uLL, 0x28uLL, 0x10000400A747E1EuLL);
  uint64_t v67 = a2;
  if (!v10)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 1, "ImageAnalyzer::getHSVMap() - failed to allocate memory for imageHSVMap.", v60, v61, v62, v63, v64, v65);
LABEL_21:
  }
  int v12 = BitmapInfo & 0x3000;
  double v13 = *((double *)&v94 + 1);
  uint64_t v66 = v10;
  long long v14 = (double *)(v10 + 16);
  uint64_t v15 = 1;
  int64x2_t v16 = vdupq_lane_s64(0x406FE00000000000, 0);
  uint64_t v68 = v16.i64[1];
  do
  {
    uint64_t v17 = 0;
    long long v18 = &Data[v15 * BytesPerRow];
    uint64_t v19 = v14;
    do
    {
      uint64_t v20 = &v18[v17];
      uint64_t v21 = &v18[v17 + 4];
      if (v12) {
        uint64_t v22 = 6;
      }
      else {
        uint64_t v22 = 5;
      }
      if (v12) {
        uint64_t v23 = 5;
      }
      else {
        uint64_t v23 = 6;
      }
      if (!v12) {
        uint64_t v21 = &v18[v17 + 7];
      }
      v16.i8[0] = v20[v22];
      *(double *)&unint64_t v24 = (double)v16.u64[0];
      v25.n128_f64[0] = *(double *)&v24 / 255.0;
      LOBYTE(v24) = v20[v23];
      LOBYTE(v11) = *v21;
      v25.n128_f64[1] = (double)v24 / 255.0;
      __n128 v69 = v25;
      double v70 = (double)v11 / 255.0;
      *((void *)&v26 + 1) = v68;
      *(double *)&long long v26 = v70;
      *(__n128 *)&v95.double var0 = v25;
      *(_OWORD *)&v95.double var2 = v26;
      double HSVColor = ITColor::GetHSVColor(&v95);
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      ITColor::GetLuminance(v32, v69, v70);
      *(v19 - 2) = HSVColor;
      *((void *)v19 - 1) = v29;
      *(void *)uint64_t v19 = v31;
      v19[1] = *(double *)v16.i64;
      v19[2] = 255.0;
      double v13 = *(double *)v16.i64 + v13;
      *((double *)&v94 + 1) = v13;
      v17 += 4;
      v19 += 5;
    }
    while (v17 != 80);
    ++v15;
    v14 += 100;
  }
  while (v15 != 21);
  *((double *)&v94 + 1) = v13 / 400.0;
  v71[0] = v66;
  ImageAnalyzer::QuantizeColorMaps((ImageAnalyzer *)v71);
  long long v33 = (__n128 *)v67;
  ImageAnalyzer::PickBackgroundColor((ImageAnalyzer *)v71);
  ImageAnalyzer::PickTextColors((ImageAnalyzer *)v71);
  ImageAnalyzer::DoPostImageAnalysis((ImageAnalyzer *)v71, v34, v35);
  double v36 = v73;
  __n128 v37 = v72;
  *(__n128 *)&v67->var0.double var0 = v72;
  v67->var0.double var2 = v36;
  *(_OWORD *)&v67->var0.double var3 = v74;
  *(_OWORD *)&v67->var1.double var1 = v75;
  *(_OWORD *)&v67->var1.double var3 = v76;
  *(_OWORD *)&v67->var2.double var1 = v77;
  *(_OWORD *)&v67->var2.double var3 = v78;
  *(_OWORD *)&v67->var3.double var1 = v79;
  *(_OWORD *)&v67->var3.double var3 = v80;
  *(_OWORD *)&v67->var4.double var1 = v81;
  uint64_t v38 = v84;
  *(_OWORD *)&v67->var4.double var3 = v82;
  *(_OWORD *)&v67->var5.double var1 = v83;
  *(void *)&v67->var5.double var3 = v38;
  long long v39 = v86;
  *(_OWORD *)&v67->var7.double var0 = v85;
  *(_OWORD *)&v67->var7.double var2 = v39;
  long long v40 = v88;
  *(_OWORD *)&v67->var6.double var0 = v87;
  *(_OWORD *)&v67->var6.double var2 = v40;
  long long v41 = v90;
  *(_OWORD *)&v67->var8.double var0 = v89;
  *(_OWORD *)&v67->var8.double var2 = v41;
  v67->var10 = 1;
  ITColor::GetLuminance(v42, v37, v36);
  v67->var11 = v43 >= 0.180000007;
  ITColor::GetLuminance(v44, v33[2], v33[3].n128_f64[0]);
  v67->var12 = v45 >= 0.180000007;
  ITColor::GetLuminance(v46, v33[4], v33[5].n128_f64[0]);
  v67->var13 = v47 >= 0.180000007;
  double v48 = *(double *)&v94;
  v67->var14 = *(double *)&v94 > 0.0;
  v67->var9 = v48;
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v71);
}

void sub_1A30F3910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  __cxa_free_exception(v21);
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)&a21);
  _Unwind_Resume(a1);
}

void sub_1A30F4CD4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

id MSVUnarchivedObjectOfClass(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClass(__unsafe_unretained Class _Nonnull, NSData *__strong _Nonnull)");
    [v8 handleFailureInFunction:v9, @"MSVSecureCodingUtilities.m", 33, @"Invalid parameter not satisfying: %@", @"cls" file lineNumber description];

    if (v4) {
      goto LABEL_3;
    }
  }
  long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
  unint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClass(__unsafe_unretained Class _Nonnull, NSData *__strong _Nonnull)");
  [v10 handleFailureInFunction:v11, @"MSVSecureCodingUtilities.m", 34, @"Invalid parameter not satisfying: %@", @"data" file lineNumber description];

LABEL_3:
  id v14 = 0;
  BOOL v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:v4 error:&v14];
  id v6 = v14;
  if (v6)
  {
    int v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClass(__unsafe_unretained Class _Nonnull, NSData *__strong _Nonnull)");
    [v12 handleFailureInFunction:v13, @"MSVSecureCodingUtilities.m", 38, @"Unarchiving object of class:%@ resulted in error:%@", a1, v6 file lineNumber description];
  }
  return v5;
}

void sub_1A30F60CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A30F6260(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A30F661C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A30F66D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A30F6860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A30F694C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A30F6FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1728(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1729(uint64_t a1)
{
}

void sub_1A30F79B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
}

id MSVCryptoDigestForString(void *a1, uint64_t a2)
{
  id v3 = [a1 dataUsingEncoding:4];
  double v4 = MSVCryptoDigestForData(v3, a2);

  return v4;
}

id MSVCryptoDigestForData(void *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  double v4 = v3;
  switch(a2)
  {
    case 2:
      id v7 = v3;
      CC_SHA256((const void *)[v7 bytes], objc_msgSend(v7, "length"), md);
      uint64_t v6 = 2;
      goto LABEL_7;
    case 1:
      id v8 = v3;
      CC_SHA1((const void *)[v8 bytes], objc_msgSend(v8, "length"), md);
      uint64_t v6 = 1;
      goto LABEL_7;
    case 0:
      id v5 = v3;
      CC_MD5((const void *)[v5 bytes], objc_msgSend(v5, "length"), md);
      uint64_t v6 = 0;
LABEL_7:
      long long v9 = MSVCryptoUtilitiesHexStringFromDigest(md, v6);
      goto LABEL_9;
  }
  long long v9 = 0;
LABEL_9:

  return v9;
}

id MSVCryptoUtilitiesHexStringFromDigest(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 2:
      __sprintf_chk(v4, 0, 0x41uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13]);
      goto LABEL_7;
    case 1:
      __sprintf_chk(v4, 0, 0x29uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
      goto LABEL_7;
    case 0:
      __sprintf_chk(v4, 0, 0x21uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
LABEL_7:
      uint64_t v2 = [NSString stringWithUTF8String:v4];
      goto LABEL_9;
  }
  uint64_t v2 = 0;
LABEL_9:
  return v2;
}

id MSVCryptoDigestForContentsOfFile(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:a1];
  double v4 = MSVCryptoDigestForContentsOfInputStream(v3, a2);

  return v4;
}

id MSVCryptoDigestForContentsOfInputStream(void *a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  double v36 = __Block_byref_object_copy__1812;
  __n128 v37 = __Block_byref_object_dispose__1813;
  id v38 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = [[MSVStreamReader alloc] initWithInputStream:v3 queue:0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke;
  v31[3] = &unk_1E5AD9A18;
  uint64_t v6 = v4;
  long long v32 = v6;
  [(MSVStreamReader *)v5 setDidEncounterErrorBlock:v31];
  if (a2 == 2)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_6;
    v18[3] = &__block_descriptor_40_e16_v16__0__NSData_8l;
    v18[4] = &c;
    [(MSVStreamReader *)v5 setDidReadDataBlock:v18];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __MSVCryptoDigestForContentsOfInputStream_block_invoke_7;
    double v13 = &unk_1E5AD9A60;
    uint64_t v15 = &v33;
    p_CC_SHA256_CTX c = &c;
    uint64_t v17 = 2;
    id v14 = v6;
    [(MSVStreamReader *)v5 setDidFinishReadingBlock:&v10];
  }
  else if (a2 == 1)
  {
    memset(&c, 0, 96);
    CC_SHA1_Init((CC_SHA1_CTX *)&c);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_4;
    v24[3] = &__block_descriptor_40_e16_v16__0__NSData_8l;
    v24[4] = &c;
    [(MSVStreamReader *)v5 setDidReadDataBlock:v24];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_5;
    v19[3] = &unk_1E5AD9A60;
    uint64_t v21 = &v33;
    uint64_t v22 = &c;
    uint64_t v23 = 1;
    uint64_t v20 = v6;
    [(MSVStreamReader *)v5 setDidFinishReadingBlock:v19];
  }
  else if (a2)
  {
    id v7 = os_log_create("com.apple.amp.MediaServices", "CryptoUtil");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      c.count[0] = 67109120;
      c.count[1] = a2;
      _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_ERROR, "Invalid crypto format: %d", (uint8_t *)&c, 8u);
    }

    dispatch_semaphore_signal(v6);
  }
  else
  {
    memset(&c, 0, 92);
    CC_MD5_Init((CC_MD5_CTX *)&c);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_2;
    v30[3] = &__block_descriptor_40_e16_v16__0__NSData_8l;
    v30[4] = &c;
    [(MSVStreamReader *)v5 setDidReadDataBlock:v30];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_3;
    v25[3] = &unk_1E5AD9A60;
    long long v27 = &v33;
    uint64_t v28 = &c;
    uint64_t v29 = 0;
    long long v26 = v6;
    [(MSVStreamReader *)v5 setDidFinishReadingBlock:v25];
  }
  [(MSVStreamReader *)v5 start];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v8;
}

void sub_1A30F8480(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1812(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1813(uint64_t a1)
{
}

intptr_t __MSVCryptoDigestForContentsOfInputStream_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_2(uint64_t a1, id a2)
{
  uint64_t v2 = *(CC_MD5_CTX **)(a1 + 32);
  id v3 = a2;
  dispatch_semaphore_t v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];

  return CC_MD5_Update(v2, v4, v5);
}

intptr_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CC_MD5_Final(md, *(CC_MD5_CTX **)(a1 + 48));
  uint64_t v2 = MSVCryptoUtilitiesHexStringFromDigest(md, *(void *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_4(uint64_t a1, id a2)
{
  uint64_t v2 = *(CC_SHA1_CTX **)(a1 + 32);
  id v3 = a2;
  dispatch_semaphore_t v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];

  return CC_SHA1_Update(v2, v4, v5);
}

intptr_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_5(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CC_SHA1_Final(md, *(CC_SHA1_CTX **)(a1 + 48));
  uint64_t v2 = MSVCryptoUtilitiesHexStringFromDigest(md, *(void *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_6(uint64_t a1, id a2)
{
  uint64_t v2 = *(CC_SHA256_CTX **)(a1 + 32);
  id v3 = a2;
  dispatch_semaphore_t v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];

  return CC_SHA256_Update(v2, v4, v5);
}

intptr_t __MSVCryptoDigestForContentsOfInputStream_block_invoke_7(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CC_SHA256_Final(md, *(CC_SHA256_CTX **)(a1 + 48));
  uint64_t v2 = MSVCryptoUtilitiesHexStringFromDigest(md, *(void *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id MSVCryptoUtilitiesDigestDataFromHexString(void *a1, uint64_t a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  uint64_t v5 = 32;
  if (a2 == 1) {
    uint64_t v5 = 40;
  }
  if (a2 == 2) {
    uint64_t v6 = 64;
  }
  else {
    uint64_t v6 = v5;
  }
  v18[0] = 0;
  MEMORY[0x1F4188790]();
  id v8 = &v14[-v7];
  if (objc_msgSend(v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v14[-v7], v6, v18, 1, 0, 0, objc_msgSend(v3, "length"), 0))BOOL v9 = v18[0] == v6; {
  else
  }
    BOOL v9 = 0;
  if (v9 && v18[0] != 0)
  {
    unint64_t v11 = 0;
    do
    {
      *(_WORD *)__str = *(_WORD *)&v8[v11];
      char v17 = 0;
      uint64_t v12 = strtol(__str, 0, 16);
      if (v12 <= 255)
      {
        char v15 = v12;
        [v4 appendBytes:&v15 length:1];
      }
      v11 += 2;
    }
    while (v11 < v18[0]);
  }

  return v4;
}

uint64_t MSVProcessIsDebugging()
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  memset(v2, 0, sizeof(v2));
  LODWORD(v3) = 0;
  *(void *)uint64_t v33 = 0xE00000001;
  int v34 = 1;
  pid_t v35 = getpid();
  size_t v1 = 648;
  if (sysctl(v33, 4u, v2, &v1, 0, 0)) {
    __assert_rtn("MSVProcessIsDebugging", "MSVDebugUtilities.m", 64, "junk == 0");
  }
  return (v3 >> 11) & 1;
}

void _MSVEnumerateClassHierarchy(void *a1, uint64_t a2, void *a3)
{
  long long v7 = a3;
  uint64_t v5 = [a1 superclass];
  uint64_t v6 = v5;
  if (a2) {
    v7[2](v7, a1, v5 == 0);
  }
  if (v6) {
    _MSVEnumerateClassHierarchy(v6, a2, v7);
  }
  if ((a2 & 1) == 0) {
    v7[2](v7, a1, v6 == 0);
  }
}

void _MSVEnumerateClassProtocols(objc_class *a1, void *a2)
{
  long long v3 = a2;
  unsigned int outCount = 0;
  long long v4 = class_copyProtocolList(a1, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ((void (**)(id, Protocol *))v3)[2](v3, v4[i++]))
      ;
  }
  free(v4);
}

id _MSVDescribeMethod(objc_method *a1, int a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v3 = [MEMORY[0x1E4F28E78] string];
  long long v4 = v3;
  if (a2) {
    uint64_t v5 = @"+";
  }
  else {
    uint64_t v5 = @"-";
  }
  [v3 appendString:v5];
  uint64_t v6 = method_copyReturnType(a1);
  long long v7 = _MSVObjCTypeDescription(v6);
  [v4 appendFormat:@" (%@)", v7];

  free(v6);
  Name = method_getName(a1);
  long long v9 = NSStringFromSelector(Name);
  long long v10 = [v9 componentsSeparatedByString:@":"];
  long long v11 = [MEMORY[0x1E4F1CA48] array];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = ___MSVMethodComponents_block_invoke;
  v31[3] = &unk_1E5AD9C88;
  int v34 = v35;
  id v12 = v11;
  id v32 = v12;
  uint64_t v33 = @":";
  [v10 enumerateObjectsUsingBlock:v31];
  long long v13 = v33;
  id v14 = v12;

  _Block_object_dispose(v35, 8);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v16)
  {
    unsigned int v17 = 2;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v4 appendFormat:@"%@", v20];
        if ([v20 hasSuffix:@":"])
        {
          long long v21 = method_copyArgumentType(a1, v17);
          long long v22 = _MSVObjCTypeDescription(v21);
          [v4 appendFormat:@"(%@)arg%ld", v22, v17 - 1];

          free(v21);
        }
        if (++v17 >= 3)
        {
          long long v23 = [v15 lastObject];
          BOOL v24 = v20 == v23;

          if (!v24) {
            [v4 appendString:@" "];
          }
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v16);
  }

  [v4 appendString:@";"];
  return v4;
}

void sub_1A30F9F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

__CFString *_MSVObjCTypeDescription(const char *a1)
{
  if (!strcmp(a1, "@"))
  {
    long long v4 = @"id";
    goto LABEL_80;
  }
  if (!strcmp(a1, "v"))
  {
    long long v4 = @"void";
    goto LABEL_80;
  }
  if (!strcmp(a1, "^v"))
  {
    long long v4 = @"void *";
    goto LABEL_80;
  }
  if (!strcmp(a1, ":"))
  {
    long long v4 = @"SEL";
    goto LABEL_80;
  }
  if (!strcmp(a1, "B"))
  {
    long long v4 = @"BOOL";
    goto LABEL_80;
  }
  if (!strcmp(a1, "c"))
  {
    long long v4 = @"char";
    goto LABEL_80;
  }
  if (!strcmp(a1, "i"))
  {
    long long v4 = @"int";
    goto LABEL_80;
  }
  if (!strcmp(a1, "s"))
  {
    long long v4 = @"short";
    goto LABEL_80;
  }
  if (!strcmp(a1, "q"))
  {
    long long v4 = @"long";
    goto LABEL_80;
  }
  if (!strcmp(a1, "C"))
  {
    long long v4 = @"unsigned char";
    goto LABEL_80;
  }
  if (!strcmp(a1, "I"))
  {
    long long v4 = @"unsigned int";
    goto LABEL_80;
  }
  if (!strcmp(a1, "S"))
  {
    long long v4 = @"unsigned short";
    goto LABEL_80;
  }
  if (!strcmp(a1, "Q"))
  {
    long long v4 = @"unsigned long";
    goto LABEL_80;
  }
  if (!strcmp(a1, "f"))
  {
    long long v4 = @"float";
    goto LABEL_80;
  }
  if (!strcmp(a1, "d"))
  {
    long long v4 = @"double";
    goto LABEL_80;
  }
  if (!strcmp(a1, "*"))
  {
    long long v4 = @"char *";
    goto LABEL_80;
  }
  if (!strcmp(a1, "#"))
  {
    long long v4 = @"Class";
    goto LABEL_80;
  }
  if (!strcmp(a1, "@?"))
  {
    long long v4 = @"^";
    goto LABEL_80;
  }
  unsigned int v2 = *(unsigned __int8 *)a1;
  int v3 = (char)v2;
  if (v2 > 0x5A)
  {
    if (v2 == 91) {
      goto LABEL_56;
    }
    if (v2 == 94)
    {
LABEL_54:
      if (strlen(a1) < 2) {
        goto LABEL_61;
      }
      long long v9 = NSString;
      long long v10 = _MSVObjCTypeDescription(a1 + 1);
      long long v4 = [v9 stringWithFormat:@"%@ *", v10];
      goto LABEL_60;
    }
    if (v2 != 123) {
      goto LABEL_61;
    }
LABEL_46:
    if (strlen(a1) >= 4)
    {
      uint64_t v5 = (void *)[[NSString alloc] initWithBytes:a1 + 1 length:strlen(a1) - 2 encoding:1];
      uint64_t v6 = [v5 componentsSeparatedByString:@"="];
      if ((unint64_t)[v6 count] < 2)
      {
        long long v4 = v5;
      }
      else
      {
        long long v7 = [v6 objectAtIndex:0];
        if (*a1 == 123) {
          long long v8 = @"struct";
        }
        else {
          long long v8 = @"union";
        }
        long long v4 = [NSString stringWithFormat:@"%@ %@", v8, v7];
      }
      goto LABEL_79;
    }
    if (v3 != 91)
    {
      if (v3 != 94) {
        goto LABEL_61;
      }
      goto LABEL_54;
    }
LABEL_56:
    size_t v11 = strlen(a1);
    if (v11 < 4) {
      goto LABEL_61;
    }
    uint64_t v12 = 1;
    long long v13 = (char *)malloc_type_calloc(1uLL, v11 + 1, 0x86D38055uLL);
    do
    {
      uint64_t v14 = v12;
      unsigned int v15 = a1[v12++] - 48;
    }
    while (v15 < 0xA);
    uint64_t v16 = v14 - 1;
    unsigned int v17 = &a1[v14];
    long long v10 = (void *)[[NSString alloc] initWithBytes:a1 + 1 length:v14 - 1 encoding:1];
    size_t v18 = strlen(a1);
    long long v19 = strncpy(v13, v17, v18 - v16 - 2);
    long long v20 = _MSVObjCTypeDescription(v19);
    free(v13);
    long long v4 = [NSString stringWithFormat:@"%@[%@]", v20, v10];

LABEL_60:
    goto LABEL_80;
  }
  if (v2 == 40) {
    goto LABEL_46;
  }
  if (v2 != 64 || strlen(a1) < 4)
  {
LABEL_61:
    if (strlen(a1) >= 2)
    {
      if (v3 <= 109)
      {
        switch(v3)
        {
          case 'N':
            long long v21 = @"inout";
            goto LABEL_77;
          case 'O':
            long long v21 = @"bycopy";
            goto LABEL_77;
          case 'R':
            long long v21 = @"byref";
            goto LABEL_77;
          case 'V':
            long long v21 = @"oneway";
            goto LABEL_77;
          default:
            goto LABEL_69;
        }
      }
      switch(v3)
      {
        case 'r':
          long long v21 = @"const";
          goto LABEL_77;
        case 'o':
          long long v21 = @"out";
          goto LABEL_77;
        case 'n':
          long long v21 = @"in";
LABEL_77:
          uint64_t v5 = _MSVObjCTypeDescription(a1 + 1);
          [NSString stringWithFormat:@"%@ %@", v21, v5];
          goto LABEL_78;
      }
    }
LABEL_69:
    objc_msgSend(NSString, "stringWithFormat:", @"%s", a1);
    long long v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_80;
  }
  uint64_t v5 = (void *)[[NSString alloc] initWithBytes:a1 + 2 length:strlen(a1) - 3 encoding:1];
  [NSString stringWithFormat:@"%@ *", v5, v23];
LABEL_78:
  long long v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_79:

LABEL_80:
  return v4;
}

__CFString *_MSVDebugIvarValue(unsigned int *a1, char *__s, int a3)
{
  size_t v6 = strlen(__s);
  long long v7 = (const char *)malloc_type_calloc(v6 + 1, 1uLL, 0x6E06EADDuLL);
  long long v8 = (char *)v7;
  char v9 = 0;
  long long v10 = __s;
  size_t v11 = (char *)v7;
  while (1)
  {
    int v12 = *v10;
    if (v12 == 34)
    {
      v9 ^= 1u;
      goto LABEL_8;
    }
    if (!*v10) {
      break;
    }
    if (v9)
    {
      char v9 = 1;
    }
    else
    {
      char v9 = 0;
      *v11++ = v12;
    }
LABEL_8:
    ++v10;
  }
  int v13 = *__s;
  if (v13 != 64)
  {
    if (!strcmp(v7, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
    {
      id v14 = [MEMORY[0x1E4F29238] valueWithBytes:a1 objCType:__s];
      objc_msgSend(v14, "bs_CGRectValue");
      uint64_t v17 = BSNSStringFromCGRect();
      goto LABEL_32;
    }
    if (!strcmp(v8, "{CGPoint=dd}"))
    {
      id v14 = [MEMORY[0x1E4F29238] valueWithBytes:a1 objCType:__s];
      objc_msgSend(v14, "bs_CGPointValue");
      uint64_t v17 = BSNSStringFromCGPoint();
      goto LABEL_32;
    }
    if (!strcmp(v8, "{CGSize=dd}"))
    {
      id v14 = [MEMORY[0x1E4F29238] valueWithBytes:a1 objCType:__s];
      objc_msgSend(v14, "bs_CGSizeValue");
      uint64_t v17 = BSNSStringFromCGSize();
      goto LABEL_32;
    }
    if (!strcmp(v8, "{_NSRange=QQ}"))
    {
      id v14 = [MEMORY[0x1E4F29238] valueWithBytes:a1 objCType:__s];
      v24.CFIndex location = [v14 rangeValue];
      uint64_t v17 = NSStringFromRange(v24);
      goto LABEL_32;
    }
    if (!strcmp(v8, "^v"))
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)a1, v22);
LABEL_37:
      long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_38:
      size_t v18 = v20;
      goto LABEL_33;
    }
    if (v13 > 82)
    {
      switch(v13)
      {
        case '^':
          uint64_t v16 = NSString;
          if (a3) {
            goto LABEL_66;
          }
          objc_msgSend(NSString, "stringWithFormat:", @"%p -> %p", a1, *(void *)a1);
          goto LABEL_37;
        case '_':
        case 'a':
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_68;
        case 'b':
          objc_msgSend(NSString, "stringWithFormat:", @"%i (?)", *a1 & ~(-1 << atoi(__s + 1)), v22);
          goto LABEL_37;
        case 'c':
          long long v20 = [NSNumber numberWithChar:*(char *)a1];
          goto LABEL_38;
        case 'd':
          long long v20 = [NSNumber numberWithDouble:*(double *)a1];
          goto LABEL_38;
        case 'f':
          LODWORD(v15) = *a1;
          long long v20 = [NSNumber numberWithFloat:v15];
          goto LABEL_38;
        case 'i':
          long long v20 = [NSNumber numberWithInt:*a1];
          goto LABEL_38;
        case 'l':
          long long v20 = [NSNumber numberWithLong:*(void *)a1];
          goto LABEL_38;
        case 'q':
          long long v20 = [NSNumber numberWithLongLong:*(void *)a1];
          goto LABEL_38;
        case 's':
          long long v20 = [NSNumber numberWithShort:*(__int16 *)a1];
          goto LABEL_38;
        default:
          if (v13 == 83)
          {
            long long v20 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)a1];
            goto LABEL_38;
          }
          if (v13 != 123) {
            goto LABEL_68;
          }
          break;
      }
      goto LABEL_60;
    }
    if (v13 > 66)
    {
      if (v13 > 75)
      {
        if (v13 == 76)
        {
          long long v20 = [NSNumber numberWithUnsignedLong:*(void *)a1];
          goto LABEL_38;
        }
        if (v13 == 81)
        {
          long long v20 = [NSNumber numberWithUnsignedLongLong:*(void *)a1];
          goto LABEL_38;
        }
      }
      else
      {
        if (v13 == 67)
        {
          long long v20 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)a1];
          goto LABEL_38;
        }
        if (v13 == 73)
        {
          long long v20 = [NSNumber numberWithUnsignedInt:*a1];
          goto LABEL_38;
        }
      }
      goto LABEL_68;
    }
    if (v13 > 57)
    {
      if (v13 != 58)
      {
        if (v13 == 66)
        {
          if (*(unsigned char *)a1) {
            long long v21 = @"YES";
          }
          else {
            long long v21 = @"NO";
          }
          long long v20 = v21;
          goto LABEL_38;
        }
LABEL_68:
        [NSString stringWithFormat:@"Value not representable, %s", v8, v22];
        goto LABEL_37;
      }
      if ((a3 & 1) == 0)
      {
        NSStringFromSelector(*(SEL *)a1);
        long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
    }
    else
    {
      if (v13 != 35)
      {
        if (v13 == 40)
        {
LABEL_60:
          _MSVStructDescription(a1, __s);
          long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_38;
        }
        goto LABEL_68;
      }
      if ((a3 & 1) == 0)
      {
        long long v20 = a1;
        goto LABEL_38;
      }
    }
    uint64_t v16 = NSString;
LABEL_66:
    objc_msgSend(v16, "stringWithFormat:", @"%p", a1, v22);
    goto LABEL_37;
  }
  id v14 = *(id *)a1;
  if (a3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%p", v14);
    goto LABEL_26;
  }
  if (_NSIsNSString())
  {
    [NSString stringWithFormat:@"@\"%@\"", v14];
    goto LABEL_26;
  }
  if (_NSIsNSNumber())
  {
    [NSString stringWithFormat:@"@(%@)", v14];
    uint64_t v17 = LABEL_26:;
LABEL_32:
    size_t v18 = (__CFString *)v17;
  }
  else
  {
    if (v14)
    {
      uint64_t v17 = objc_msgSend(v14, "__msv_objectDescription");
      goto LABEL_32;
    }
    size_t v18 = @"nil";
  }
LABEL_33:
  free(v8);
  return v18;
}

id _MSVStructDescription(_DWORD *a1, char *__s1)
{
  long long v4 = strdup(__s1);
  int v5 = *__s1;
  size_t v6 = @"{";
  if (v5 == 40) {
    size_t v6 = CFSTR("[values are interpreted] (");
  }
  char v36 = v4;
  long long v7 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n", v6];
  v4[strlen(v4) - 1] = 0;
  do
    int v8 = *v4++;
  while (v8 != 61);
  uint64_t v9 = 0;
  do
  {
    while (1)
    {
      uint64_t v10 = (uint64_t)(*v4 == 34 ? v4 + 1 : v4);
      size_t v11 = (char *)v10;
      do
      {
        int v12 = v11;
        int v13 = *v11++;
      }
      while (v13 != 34);
      int v14 = 0;
      char *v12 = 0;
      double v15 = v11;
      do
      {
        int v16 = *v15;
        if (v16 == 40 || v16 == 123 || v16 == 91) {
          ++v14;
        }
        if (v16 == 41 || v16 == 125 || v16 == 93) {
          --v14;
        }
        ++v15;
      }
      while (v14 > 0);
      while (*v15)
      {
        if (*v15 == 34)
        {
          *double v15 = 0;
          long long v4 = v15 + 1;
          goto LABEL_27;
        }
        ++v15;
      }
      long long v4 = 0;
LABEL_27:
      if (*v11 != 98) {
        break;
      }
      int v17 = atoi(v12 + 2);
      int v18 = v17;
      long long v19 = a1 + 1;
      if (v5 == 40) {
        long long v19 = a1;
      }
      if ((unint64_t)(v9 + v17) > 0x20)
      {
        uint64_t v9 = 0;
        a1 = v19;
      }
      uint64_t v20 = (*a1 >> v9) & ~(-1 << v17);
      if (v17 == 1)
      {
        BOOL v21 = v20 == 0;
        uint64_t v22 = @"YES";
        if (v21) {
          uint64_t v22 = @"NO";
        }
        [v7 appendFormat:@"\t\t.%s (%s): %@\n", v10, v11, v22];
      }
      else
      {
        objc_msgSend(v7, "appendFormat:", @"\t\t.%s (%s): %u\n", v10, v11, v20);
      }
      uint64_t v33 = v18;
      if (v5 == 40) {
        uint64_t v33 = 0;
      }
      v9 += v33;
      if (!v4) {
        goto LABEL_52;
      }
    }
    NSUInteger alignp = 0;
    NSUInteger sizep = 0;
    NSGetSizeAndAlignment(v11, &sizep, &alignp);
    uint64_t v23 = a1 + 1;
    if (v9) {
      BOOL v24 = v5 == 40;
    }
    else {
      BOOL v24 = 1;
    }
    if (v24) {
      uint64_t v23 = a1;
    }
    NSUInteger v25 = ((unint64_t)v23 + alignp - 1) & -(uint64_t)alignp;
    long long v26 = _MSVDebugIvarValue((v23 + alignp - 1) & -(int)alignp, v11);
    long long v27 = v26;
    int v28 = *v11;
    if (v28 == 123 || v28 == 40)
    {
      long long v29 = [v26 componentsSeparatedByString:@"\n"];
      uint64_t v30 = [v29 componentsJoinedByString:@"\n\t"];

      long long v27 = (void *)v30;
    }
    long long v31 = _MSVObjCTypeDescription(v11);
    [v7 appendFormat:@"\t\t.%s (%@): %@\n", v10, v31, v27];

    NSUInteger v32 = sizep;
    if (v5 == 40) {
      NSUInteger v32 = 0;
    }
    a1 = (_DWORD *)(v32 + v25);

    uint64_t v9 = 0;
  }
  while (v4);
LABEL_52:
  int v34 = @"}";
  if (v5 == 40) {
    int v34 = @"");
  }
  [v7 appendFormat:@"\t%@", v34];
  free(v36);
  return v7;
}

void sub_1A30FB6EC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1A30FB6B0);
  }
  free(a12);
  objc_exception_rethrow();
}

void sub_1A30FB72C(_Unwind_Exception *a1)
{
}

uint64_t MSVProcessIsUsingRoots()
{
  uint64_t result = os_variant_has_internal_content();
  if (result)
  {
    return dyld_shared_cache_some_image_overridden();
  }
  return result;
}

uint64_t MSVProcessHasInjectedFrameworks()
{
  return MEMORY[0x1F40CBE38]();
}

void *MSVProcessLinkMediaFrameworks()
{
  dlopen("/System/Library/Frameworks/MediaPlayer.framework/MediaPlayer", 1);
  dlopen("/System/Library/PrivateFrameworks/AirTraffic.framework/AirTraffic", 1);
  dlopen("/System/Library/PrivateFrameworks/DAAPKit.framework/DAAPKit", 1);
  dlopen("/System/Library/PrivateFrameworks/HomeSharing.framework/HomeSharing", 1);
  dlopen("/System/Library/PrivateFrameworks/iTunesCloud.framework/iTunesCloud", 1);
  dlopen("/System/Library/PrivateFrameworks/MediaLibraryCore.framework/MediaLibraryCore", 1);
  dlopen("/System/Library/PrivateFrameworks/MediaPlaybackCore.framework/MediaPlaybackCore", 1);
  dlopen("/System/Library/PrivateFrameworks/MusicLibrary.framework/MusicLibrary", 1);
  return dlopen("/System/Library/PrivateFrameworks/MediaFoundation.framework/MediaFoundation", 1);
}

uint64_t MSVGetDiskUsageForPath(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unsigned int v2 = v1;
  if (v1)
  {
    id v3 = v1;
    [v3 UTF8String];
    if (dirstat_np() == -1)
    {
      long long v4 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v5 = __error();
        size_t v6 = strerror(*v5);
        *(_DWORD *)buf = 138543618;
        id v9 = v3;
        __int16 v10 = 2080;
        size_t v11 = v6;
        _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_ERROR, "MSVGetUsageForPath encountered error. path=%{public}@ err=%s", buf, 0x16u);
      }
    }
  }

  return 0;
}

uint64_t MSVEnableDirStatsForDirectory(void *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
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
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)buf = 0u;
  id v1 = a1;
  if (fsctl((const char *)[v1 UTF8String], 0xC1104A71uLL, buf, 0))
  {
    unsigned int v2 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = __error();
      long long v4 = strerror(*v3);
      int v13 = 138478083;
      id v14 = v1;
      __int16 v15 = 2080;
      int v16 = v4;
      _os_log_impl(&dword_1A30CD000, v2, OS_LOG_TYPE_ERROR, "Unable to check dirstats for directory %{private}@, error %s", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    uint64_t v11 = v19;

    if (v11)
    {
LABEL_12:
      uint64_t v10 = 1;
      goto LABEL_13;
    }
  }
  int v5 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v1;
    _os_log_impl(&dword_1A30CD000, v5, OS_LOG_TYPE_DEFAULT, "MSVEnableDirStatsForDirectory - Enabling dirstat for path %{public}@", buf, 0xCu);
  }

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
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)buf = 0u;
  *(_DWORD *)&uint8_t buf[4] = 1;
  id v6 = v1;
  if (!fsctl((const char *)[v6 UTF8String], 0xC1104A71uLL, buf, 0)) {
    goto LABEL_12;
  }
  long long v7 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = __error();
    id v9 = strerror(*v8);
    int v13 = 138478083;
    id v14 = v6;
    __int16 v15 = 2080;
    int v16 = v9;
    _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_ERROR, "Unable to enable dirstats for directory %{private}@, error %s", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

id _MSVSanitizedPropertyListValue(void *a1)
{
  id v1 = a1;
  if (_NSIsNSArray())
  {
    unsigned int v2 = objc_msgSend(v1, "msv_compactMap:", &__block_literal_global_120);
LABEL_5:
    id v3 = v2;
    if ([v2 count]) {
      long long v4 = v3;
    }
    else {
      long long v4 = 0;
    }
    id v5 = v4;

    goto LABEL_9;
  }
  if (_NSIsNSDictionary())
  {
    unsigned int v2 = objc_msgSend(v1, "msv_compactMapValues:", &__block_literal_global_122);
    goto LABEL_5;
  }
  if ([MEMORY[0x1E4F28F98] propertyList:v1 isValidForFormat:200]) {
    id v5 = v1;
  }
  else {
    id v5 = 0;
  }
LABEL_9:

  return v5;
}

id MSVBundleIDForTCCIdentity(uint64_t a1)
{
  if (a1)
  {
    id v1 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
  }
  else
  {
    unsigned int v2 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v4 = 0;
      _os_log_impl(&dword_1A30CD000, v2, OS_LOG_TYPE_ERROR, "MSVBundleIDForTCCIdentity() invalid input - returning nil. [clientIdentity=nil]", v4, 2u);
    }

    id v1 = 0;
  }
  return v1;
}

void MSVAuditTokenForCurrentProcess(uint64_t a1@<X8>)
{
  kern_return_t v2;
  mach_error_t v3;
  NSObject *v4;
  char *v5;
  mach_msg_type_number_t task_info_outCnt;
  uint8_t buf[4];
  char *v8;
  __int16 v9;
  mach_error_t v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = -1;
  *((void *)&v1 + 1) = -1;
  *(_OWORD *)a1 = v1;
  *(_OWORD *)(a1 + 16) = v1;
  task_info_outCnt = 8;
  unsigned int v2 = task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)a1, &task_info_outCnt);
  if (v2)
  {
    id v3 = v2;
    long long v4 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = mach_error_string(v3);
      *(_DWORD *)buf = 136446466;
      int v8 = v5;
      id v9 = 1024;
      uint64_t v10 = v3;
      _os_log_impl(&dword_1A30CD000, v4, OS_LOG_TYPE_ERROR, "MSVAuditTokenForCurrentProcess() failed: %{public}s (0x%x)", buf, 0x12u);
    }
  }
}

id MSVTCCIdentityForAuditToken()
{
  os_log_t v0 = (void *)tcc_server_create();
  long long v1 = (void *)tcc_credential_create_for_process_with_audit_token();
  unsigned int v2 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  id v3 = 0;
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2264;
  uint64_t v11 = __Block_byref_object_dispose__2265;
  id v12 = 0;
  if (v1 && v0)
  {
    id v6 = v0;
    tcc_server_message_get_identity_for_credential();

    id v3 = (void *)v8[5];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_1A30FF338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2264(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2265(uint64_t a1)
{
}

void __MSVTCCIdentityForAuditToken_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      uint64_t v9 = a3;
      _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_ERROR, "MSVTCCIdentityForAuditToken failed. error=%@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void MSVLaunchApplication(void *a1, void *a2, void *a3)
{
}

void MSVLaunchApplicationWithOptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!v7)
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v22 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVLaunchApplicationWithOptions(NSString *__strong, NSDictionary *__strong, __strong dispatch_queue_t, void (^__strong)(NSError *__strong))");
    [v21 handleFailureInFunction:v22, @"MSVSystemUtilities.m", 147, @"Invalid parameter not satisfying: %@", @"bundleID" file lineNumber description];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F625F8]];
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F62670]];
  }
  id v12 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v11];
  int v13 = dispatch_get_global_queue(0, 0);
  id v14 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v13);
  dispatch_time_t v15 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __MSVLaunchApplicationWithOptions_block_invoke;
  v25[3] = &unk_1E5AD9D90;
  long long v26 = v14;
  id v27 = v10;
  id v16 = v10;
  int v17 = v14;
  long long v18 = (void *)MEMORY[0x1A62426F0](v25);
  long long v19 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  [v19 openApplication:v7 withOptions:v12 completion:v18];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __MSVLaunchApplicationWithOptions_block_invoke_2;
  handler[3] = &unk_1E5ADAA28;
  id v24 = v18;
  id v20 = v18;
  dispatch_source_set_event_handler(v17, handler);
  dispatch_resume(v17);
}

void __MSVLaunchApplicationWithOptions_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

void __MSVLaunchApplicationWithOptions_block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F283E0];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Launch timed out";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = [v2 errorWithDomain:v3 code:-1 userInfo:v4];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id MSVHomeSharingCacheDirectory()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  long long v1 = [v0 lastObject];

  v6[0] = v1;
  v6[1] = @"com.apple.mobileipod";
  v6[2] = @"HomeSharingLibraries";
  unsigned int v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  uint64_t v3 = [NSString pathWithComponents:v2];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"unable to create cache directory"];
    id v4 = 0;
  }

  return v4;
}

uint64_t MSVDeviceOSHasInternalDiagnostics()
{
  return MEMORY[0x1F40CD650]("com.apple.amp");
}

uint64_t MSVCopyDeviceUniqueIdentifier()
{
  return MGCopyAnswer();
}

uint64_t MSVCopySystemBuildVersion()
{
  return MGCopyAnswer();
}

id MSVCreateTemporaryFileHandle(void *a1, void *a2)
{
  id v3 = a1;
  if (!v3)
  {
    id v4 = NSTemporaryDirectory();
    id v3 = [v4 stringByAppendingPathComponent:@"tmp.XXXXXX"];
  }
  id v5 = v3;
  uint64_t v6 = (const char *)[v5 fileSystemRepresentation];
  size_t v7 = strlen(v6);
  id v8 = strndup(v6, v7);
  uint64_t v9 = mkstemp(v8);
  if ((int)v9 < 1)
  {
    id v12 = 0;
  }
  else
  {
    uint64_t v10 = v9;
    if (a2)
    {
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      *a2 = [v11 stringWithFileSystemRepresentation:v8 length:v7];
    }
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v10 closeOnDealloc:1];
  }
  free(v8);

  return v12;
}

uint64_t MSVGzipCompressFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  id v5 = [v4 path];
  uint64_t v6 = gzopen((const char *)[v5 UTF8String], "w9");

  if (v6)
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [MSVStreamReader alloc];
    uint64_t v9 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v3];
    uint64_t v10 = [(MSVStreamReader *)v8 initWithInputStream:v9 queue:0];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __MSVGzipCompressFile_block_invoke;
    v21[3] = &unk_1E5AD9DB8;
    v21[4] = &v22;
    v21[5] = v6;
    [(MSVStreamReader *)v10 setDidReadDataBlock:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __MSVGzipCompressFile_block_invoke_2;
    v19[3] = &unk_1E5ADA860;
    id v11 = v7;
    id v20 = v11;
    [(MSVStreamReader *)v10 setDidFinishReadingBlock:v19];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __MSVGzipCompressFile_block_invoke_3;
    v16[3] = &unk_1E5AD9DE0;
    long long v18 = &v22;
    id v12 = v11;
    int v17 = v12;
    [(MSVStreamReader *)v10 setDidEncounterErrorBlock:v16];
    [(MSVStreamReader *)v10 start];
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    int v13 = gzclose(v6);
    if (*((unsigned char *)v23 + 24)) {
      *((unsigned char *)v23 + 24) = v13 == 0;
    }
  }
  uint64_t v14 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v22, 8);

  return v14;
}

void sub_1A30FFD28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __MSVGzipCompressFile_block_invoke(uint64_t a1, id a2)
{
  id v3 = *(gzFile_s **)(a1 + 40);
  id v4 = a2;
  id v5 = (const void *)[v4 bytes];
  unsigned int v6 = [v4 length];

  uint64_t result = gzwrite(v3, v5, v6);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 0;
  return result;
}

intptr_t __MSVGzipCompressFile_block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __MSVGzipCompressFile_block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL MSVGzipDecompressFile()
{
  os_log_t v0 = (void *)MEMORY[0x1F4188790]();
  unsigned int v2 = v1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = v0;
  id v4 = v2;
  id v5 = [v3 path];
  unsigned int v6 = gzopen((const char *)[v5 UTF8String], "r");

  if (v6)
  {
    dispatch_semaphore_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [v4 path];
    char v9 = [v7 fileExistsAtPath:v8];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [v4 path];
      [v7 createFileAtPath:v10 contents:0 attributes:0];
    }
    uint64_t v11 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:v4 error:0];
    if (v11)
    {
      id v12 = (void *)v11;
      while (1)
      {
        int v13 = gzread(v6, buf, 0x4000u);
        if (v13 <= 0) {
          break;
        }
        uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:buf length:v13 freeWhenDone:0];
        [v12 writeData:v14];
      }
      if (v13)
      {
        int v15 = 0;
      }
      else
      {
        [v12 closeFile];

        id v12 = 0;
        int v15 = 1;
      }
    }
    else
    {
      int v15 = 0;
    }

    BOOL v16 = v15 != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

uint64_t MSVDeviceIsHomePod()
{
  return 0;
}

uint64_t MSVDeviceIsHomePodMini()
{
  return 0;
}

uint64_t MSVDeviceHasCellularBaseband()
{
  if (MSVDeviceHasCellularBaseband___once != -1) {
    dispatch_once(&MSVDeviceHasCellularBaseband___once, &__block_literal_global_83);
  }
  return MSVDeviceHasCellularBaseband___deviceHasCellularBaseband;
}

uint64_t __MSVDeviceHasCellularBaseband_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  MSVDeviceHasCellularBaseband___deviceHasCellularBaseband = result;
  return result;
}

uint64_t MSVDeviceIsiPhone()
{
  if (MSVDeviceIsiPhone___once != -1) {
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_93);
  }
  return MSVDeviceIsiPhone___deviceIsPhone;
}

uint64_t MSVDeviceIsiPod()
{
  if (MSVDeviceIsiPod___once != -1) {
    dispatch_once(&MSVDeviceIsiPod___once, &__block_literal_global_95);
  }
  return MSVDeviceIsiPod___deviceIsPod;
}

uint64_t __MSVDeviceIsiPod_block_invoke()
{
  uint64_t result = MGGetSInt32Answer();
  MSVDeviceIsiPod___deviceIsPod = result == 2;
  return result;
}

uint64_t MSVDeviceIsROSDevice()
{
  return 0;
}

BOOL MSVDeviceSupportsEnhancedMusic()
{
  if (MSVDeviceSupportsLosslessMusic()) {
    return 1;
  }
  return MSVDeviceSupportsMultiChannelMusic();
}

BOOL MSVDeviceSupportsLosslessMusic()
{
  if (MSVDeviceIsiPhone___once != -1) {
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_93);
  }
  if (MSVDeviceIsiPhone___deviceIsPhone) {
    return 1;
  }
  if (MSVDeviceIsiPod___once != -1) {
    dispatch_once(&MSVDeviceIsiPod___once, &__block_literal_global_95);
  }
  if (MSVDeviceIsiPod___deviceIsPod) {
    return 1;
  }
  if (MSVDeviceIsiPad___once != -1) {
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2316);
  }
  return MSVDeviceIsiPad___deviceIsiPad != 0;
}

id MSVGetDeviceHardwarePlatform()
{
  if (MSVGetDeviceHardwarePlatform_onceToken != -1) {
    dispatch_once(&MSVGetDeviceHardwarePlatform_onceToken, &__block_literal_global_143);
  }
  os_log_t v0 = (void *)MSVGetDeviceHardwarePlatform___hardwarePlatform;
  return v0;
}

uint64_t __MSVGetDeviceHardwarePlatform_block_invoke()
{
  MSVGetDeviceHardwarePlatform___hardwarePlatform = MGCopyAnswer();
  return MEMORY[0x1F41817F8]();
}

uint64_t MSVCurrentProcessIsNonUIPlaybackService()
{
  if (MSVCurrentProcessIsNonUIPlaybackService_onceToken != -1) {
    dispatch_once(&MSVCurrentProcessIsNonUIPlaybackService_onceToken, &__block_literal_global_148);
  }
  return MSVCurrentProcessIsNonUIPlaybackService_isNonUIPlaybackService;
}

uint64_t __MSVCurrentProcessIsNonUIPlaybackService_block_invoke()
{
  os_log_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v2 = [v0 bundleIdentifier];

  if (v2) {
    MSVCurrentProcessIsNonUIPlaybackService_isNonUIPlaybackService = [&unk_1EF651870 containsObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

void sub_1A31023E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1A310285C(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1A3102868);
  }
  _Unwind_Resume(a1);
}

void sub_1A3102878(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_1A3102890(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1A310289CLL);
}

void sub_1A3102B1C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1A3102E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2808(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2809(uint64_t a1)
{
}

void sub_1A31034D4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_1A3103AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSDRDiagnosticReporterClass_block_invoke(uint64_t a1)
{
  SymptomDiagnosticReporterLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SDRDiagnosticReporter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getSDRDiagnosticReporterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getSDRDiagnosticReporterClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MSVAutoBugCapture.m", 31, @"Unable to find class %s", "SDRDiagnosticReporter");

    __break(1u);
  }
}

void sub_1A310467C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkSymptomDiagnosticReplySuccessSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticReplySuccess");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticReplySuccessSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *SymptomDiagnosticReporterLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __SymptomDiagnosticReporterLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5AD9FE0;
    uint64_t v6 = 0;
    SymptomDiagnosticReporterLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  os_log_t v0 = (void *)SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
  if (!SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
  {
    os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *SymptomDiagnosticReporterLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"MSVAutoBugCapture.m", 30, @"%s", v4[0]);

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

void *__getkSymptomDiagnosticReplySessionIDSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticReplySessionID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticReplySessionIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomDiagnosticReplyReasonSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticReplyReason");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticReplyReasonSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomDiagnosticReplyReasonStringSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticReplyReasonString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticReplyReasonStringSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomDiagnosticErrorDisabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticErrorDisabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticErrorDisabledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticErrorHourlyLimitExceeded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticErrorHourlyLimitExceededSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticErrorDailyLimitExceeded");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticErrorDailyLimitExceededSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = SymptomDiagnosticReporterLibrary();
  uint64_t result = dlsym(v2, "kSymptomDiagnosticErrorRandomizedSuppression");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkSymptomDiagnosticErrorRandomizedSuppressionSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

uint64_t __SymptomDiagnosticReporterLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SymptomDiagnosticReporterLibraryCore_frameworkLibrary = result;
  return result;
}

void *MSVWeakLinkSymbol(const char *a1, void *a2)
{
  uint64_t result = (void *)_MSVDYLDHandle(a2);
  if (result)
  {
    return dlsym(result, a1);
  }
  return result;
}

uint64_t _MSVDYLDHandle(void *a1)
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v2 fileExistsAtPath:v1])
  {
    id v3 = v1;
  }
  else
  {
    uint64_t v4 = @"/";
    long long v5 = NSString;
    v36[0] = @"/";
    v36[1] = @"System";
    v36[2] = @"Library";
    _OWORD v36[3] = @"PrivateFrameworks";
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    uint64_t v6 = [v5 pathWithComponents:v22];
    v37[0] = v6;
    uint64_t v7 = NSString;
    v35[0] = @"/";
    v35[1] = @"System";
    v35[2] = @"Library";
    void v35[3] = @"Frameworks";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    uint64_t v9 = [v7 pathWithComponents:v8];
    v37[1] = v9;
    uint64_t v10 = NSString;
    v34[0] = @"/";
    v34[1] = @"AppleInternal";
    v34[2] = @"Library";
    v34[3] = @"Frameworks";
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
    id v12 = [v10 pathWithComponents:v11];
    v37[2] = v12;
    int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v13;
    id v3 = (id)[v14 countByEnumeratingWithState:&v26 objects:&v30 count:16];
    if (v3)
    {
      uint64_t v15 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v14);
          }
          int v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) stringByAppendingPathComponent:v1];
          long long v18 = [v17 stringByAppendingPathExtension:@"framework"];

          if ([v2 fileExistsAtPath:v18])
          {
            id v3 = [v18 stringByAppendingPathComponent:v1];

            goto LABEL_13;
          }
        }
        id v3 = (id)[v14 countByEnumeratingWithState:&v26 objects:&v30 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  if (_MSVDYLDHandle___once != -1)
  {
    dispatch_once(&_MSVDYLDHandle___once, &__block_literal_global_3036);
    if (v3) {
      goto LABEL_16;
    }
LABEL_18:
    NSLog(&cfstr_FrameworkCould.isa, v1);
    goto LABEL_19;
  }
  if (!v3) {
    goto LABEL_18;
  }
LABEL_16:
  uint64_t v19 = __handlesQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___MSVDYLDHandle_block_invoke_2;
  block[3] = &unk_1E5ADAAC8;
  char v25 = &v30;
  id v24 = v3;
  dispatch_sync(v19, block);

LABEL_19:
  uint64_t v20 = v31[3];
  _Block_object_dispose(&v30, 8);

  return v20;
}

void sub_1A3105D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

id *MSVWeakLinkStringConstant(const char *a1, void *a2)
{
  id v3 = (id *)_MSVDYLDHandle(a2);
  if (v3)
  {
    id v3 = (id *)dlsym(v3, a1);
    if (v3) {
      id v3 = (id *)*v3;
    }
  }
  return v3;
}

id MSVWeakLinkClass(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)_MSVDYLDHandle(a2);
  if (v4) {
    uint64_t v4 = NSClassFromString(v3);
  }
  id v5 = v4;

  return v5;
}

double MSVHasherCreate@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = MSVHasherSharedSeed();
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(void *)a1 = 1000;
  *(void *)(a1 + 8) = v2 ^ 0x736F6D6570736575;
  *(void *)(a1 + 16) = v4 ^ 0x646F72616E646F6DLL;
  *(void *)(a1 + 24) = v2 ^ 0x6C7967656E657261;
  *(void *)(a1 + 32) = v4 ^ 0x7465646279746573;
  return result;
}

id MSVHasherDigestDataBlocksFromURL(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28F90]);
  uint64_t v9 = [[MSVBlockGuard alloc] initWithDeallocHandler:&__block_literal_global_3];
  if ([v5 isFileURL])
  {
    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = [v5 path];
    id v12 = [v10 attributesOfItemAtPath:v11 error:0];

    objc_msgSend(v8, "setTotalUnitCount:", objc_msgSend(v12, "fileSize"));
  }
  else
  {
    [v8 setTotalUnitCount:-1];
  }
  int v13 = [MEMORY[0x1E4F1CA10] inputStreamWithURL:v5];
  id v14 = [[MSVStreamReader alloc] initWithInputStream:v13 queue:0];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __MSVHasherDigestDataBlocksFromURL_block_invoke_2;
  v41[3] = &unk_1E5ADA020;
  id v15 = v8;
  id v42 = v15;
  id v43 = v6;
  id v16 = v6;
  [(MSVStreamReader *)v14 setDidReadDataBlock:v41];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __MSVHasherDigestDataBlocksFromURL_block_invoke_3;
  v37[3] = &unk_1E5ADA048;
  id v17 = v15;
  id v38 = v17;
  long long v18 = v9;
  long long v39 = v18;
  id v19 = v7;
  id v40 = v19;
  [(MSVStreamReader *)v14 setDidFinishReadingBlock:v37];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  int v33[2] = __MSVHasherDigestDataBlocksFromURL_block_invoke_4;
  v33[3] = &unk_1E5ADA4C8;
  id v20 = v17;
  id v34 = v20;
  long long v21 = v18;
  pid_t v35 = v21;
  id v22 = v19;
  id v36 = v22;
  [(MSVStreamReader *)v14 setDidEncounterErrorBlock:v33];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __MSVHasherDigestDataBlocksFromURL_block_invoke_5;
  v29[3] = &unk_1E5ADA048;
  uint64_t v30 = v14;
  long long v31 = v21;
  id v32 = v22;
  id v23 = v22;
  id v24 = v21;
  char v25 = v14;
  [v20 setCancellationHandler:v29];
  [(MSVStreamReader *)v25 start];
  long long v26 = v32;
  id v27 = v20;

  return v27;
}

void __MSVHasherDigestDataBlocksFromURL_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v4, "length") + objc_msgSend(v3, "completedUnitCount"));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __MSVHasherDigestDataBlocksFromURL_block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setCompletedUnitCount:1];
  uint64_t result = [*(id *)(a1 + 40) disarm];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

void __MSVHasherDigestDataBlocksFromURL_block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setCompletedUnitCount:1];
  if ([*(id *)(a1 + 40) disarm])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"MSVHasherError", 2, v5, @"Unexpected IO error while reading data");
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

void __MSVHasherDigestDataBlocksFromURL_block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) stop];
  if ([*(id *)(a1 + 40) disarm])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MSVHasherError", 1, @"NSProgress cancel method was called");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void __MSVHasherDigestDataBlocksFromURL_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v0 = objc_msgSend(NSString, "stringWithUTF8String:", "NSProgress * _Nonnull MSVHasherDigestDataBlocksFromURL(NSURL *__strong _Nonnull, void (^__strong _Nonnull)(NSData *__strong), void (^__strong _Nonnull)(NSError * _Nullable __strong))_block_invoke");
  [v1 handleFailureInFunction:v0 file:@"MSVHasher.m" lineNumber:48 description:@"MSVHasherDigestURL completion was not called."];
}

void sub_1A3106824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A31069C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3106C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3124(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3125(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__45(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A62426F0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__46(uint64_t a1)
{
}

uint64_t MSVKeychainCopyKeychainValue(void *a1, void *a2)
{
  uint64_t v2 = _MSVCreateKeychainQuery(a1, a2);
  if (!v2) {
    return 0;
  }
  CFDictionaryRef v3 = v2;
  CFDictionarySetValue(v2, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching(v3, &result);
  id v5 = (id)result;
  id v6 = v5;
  uint64_t v7 = 0;
  if (!v4)
  {
    if ([v5 length]) {
      uint64_t v7 = [[NSString alloc] initWithData:v6 encoding:4];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  CFRelease(v3);

  return v7;
}

__CFDictionary *_MSVCreateKeychainQuery(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v3);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v4);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3BD20], (const void *)*MEMORY[0x1E4F1CFD0]);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

void MSVKeychainSetKeychainValue(void *a1, void *a2, void *a3)
{
  id v12 = a1;
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _MSVCreateKeychainQuery(v5, v6);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    if ([v12 length])
    {
      uint64_t v9 = [v12 dataUsingEncoding:4];
      uint64_t v10 = (void *)MSVKeychainCopyKeychainValue(v5, v6);
      if (v10)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v9);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B5B0]);
        SecItemUpdate(v8, Mutable);
        CFRelease(Mutable);
      }
      else
      {
        CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F3BD38], v9);
        CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F3B558], (const void *)*MEMORY[0x1E4F3B5B0]);
        SecItemAdd(v8, 0);
      }
    }
    else
    {
      SecItemDelete(v8);
    }
    CFRelease(v8);
  }
}

void sub_1A3108BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3651(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3652(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__3695(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3696(uint64_t a1)
{
}

_DWORD *_MSV_XXH_XXH32_update(_DWORD *result, char *__src, size_t __n)
{
  if (__src)
  {
    int v3 = __n;
    id v4 = __src;
    id v5 = result;
    int v6 = result[1];
    unsigned int v7 = *result + __n;
    BOOL v9 = __n > 0xF || v7 > 0xF;
    *CFTypeRef result = v7;
    result[1] = v6 | v9;
    uint64_t v10 = result[10];
    if (v10 + __n <= 0xF)
    {
      CFTypeRef result = memcpy((char *)result + v10 + 24, __src, __n);
      LODWORD(v11) = v5[10] + v3;
LABEL_18:
      v5[10] = v11;
      return result;
    }
    id v12 = &__src[__n];
    if (v10)
    {
      CFTypeRef result = memcpy((char *)result + v10 + 24, __src, (16 - v10));
      HIDWORD(v13) = v5[2] - 2048144777 * v5[6];
      LODWORD(v13) = HIDWORD(v13);
      int v14 = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[3] - 2048144777 * v5[7];
      LODWORD(v13) = HIDWORD(v13);
      int v5[2] = v14;
      void v5[3] = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[4] - 2048144777 * v5[8];
      LODWORD(v13) = HIDWORD(v13);
      v5[4] = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[5] - 2048144777 * v5[9];
      LODWORD(v13) = HIDWORD(v13);
      void v5[5] = -1640531535 * (v13 >> 19);
      v4 += (16 - v5[10]);
      v5[10] = 0;
    }
    if (v4 <= v12 - 16)
    {
      int v15 = v5[2];
      int v16 = v5[3];
      int v17 = v5[4];
      int v18 = v5[5];
      do
      {
        HIDWORD(v19) = v15 - 2048144777 * *(_DWORD *)v4;
        LODWORD(v19) = HIDWORD(v19);
        int v15 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v16 - 2048144777 * *((_DWORD *)v4 + 1);
        LODWORD(v19) = HIDWORD(v19);
        int v16 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v17 - 2048144777 * *((_DWORD *)v4 + 2);
        LODWORD(v19) = HIDWORD(v19);
        int v17 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v18 - 2048144777 * *((_DWORD *)v4 + 3);
        LODWORD(v19) = HIDWORD(v19);
        int v18 = -1640531535 * (v19 >> 19);
        v4 += 16;
      }
      while (v4 <= v12 - 16);
      int v5[2] = v15;
      void v5[3] = v16;
      v5[4] = v17;
      void v5[5] = v18;
    }
    if (v4 < v12)
    {
      size_t v11 = v12 - v4;
      CFTypeRef result = memcpy(v5 + 6, v4, v11);
      goto LABEL_18;
    }
  }
  return result;
}

void _aggregateFunctionFinal(sqlite3_context *a1)
{
  _aggregateFunctionValue(a1);
  uint64_t v2 = *(void **)sqlite3_aggregate_context(a1, 8);
  if (v2)
  {
  }
}

void _aggregateFunctionValue(sqlite3_context *a1)
{
  uint64_t v2 = sqlite3_user_data(a1);
  int v3 = [_MSVSQLDatabaseFunctionContext alloc];
  if (v3)
  {
    v11.receiver = v3;
    v11.super_class = (Class)_MSVSQLDatabaseFunctionContext;
    id v4 = [(sqlite3_context *)&v11 init];
    id v5 = v4;
    if (v4)
    {
      *((void *)v4 + 1) = a1;
      *((_DWORD *)v4 + 4) = 0;
      *((void *)v4 + 3) = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = *(id *)sqlite3_aggregate_context(a1, 8);
  if (v2) {
    uint64_t v7 = v2[7];
  }
  else {
    uint64_t v7 = 0;
  }
  CFDictionaryRef v8 = (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v5, v6);
  if (v8 != v5)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"void _aggregateFunctionValue(sqlite3_context *)"];
    [v9 handleFailureInFunction:v10 file:@"MSVSQLDatabase.m" lineNumber:1303 description:@"function did not return any result"];
  }
}

void _aggregateFunctionStep(sqlite3_context *a1, int a2, uint64_t a3)
{
  id v6 = sqlite3_user_data(a1);
  uint64_t v7 = [_MSVSQLDatabaseFunctionContext alloc];
  if (v7)
  {
    v19.receiver = v7;
    v19.super_class = (Class)_MSVSQLDatabaseFunctionContext;
    id v8 = [(sqlite3_context *)&v19 init];
    BOOL v9 = v8;
    if (v8)
    {
      *((void *)v8 + 1) = a1;
      *((_DWORD *)v8 + 4) = a2;
      *((void *)v8 + 3) = a3;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v10 = (void **)sqlite3_aggregate_context(a1, 8);
  objc_super v11 = *v10;
  if (!*v10)
  {
    if (v6) {
      id v12 = (void *)v6[4];
    }
    else {
      id v12 = 0;
    }
    unint64_t v13 = (void (*)(void))v12[2];
    int v14 = v12;
    objc_super v11 = v13();

    *uint64_t v10 = v11;
  }
  if (v6) {
    int v15 = (void *)v6[5];
  }
  else {
    int v15 = 0;
  }
  int v16 = (void (*)(void))v15[2];
  int v17 = v15;
  uint64_t v18 = v16();

  *uint64_t v10 = (void *)v18;
}

void _aggregateFunctionInverse(sqlite3_context *a1, int a2, uint64_t a3)
{
  id v6 = sqlite3_user_data(a1);
  uint64_t v7 = [_MSVSQLDatabaseFunctionContext alloc];
  if (v7)
  {
    v16.receiver = v7;
    v16.super_class = (Class)_MSVSQLDatabaseFunctionContext;
    id v8 = [(sqlite3_context *)&v16 init];
    BOOL v9 = v8;
    if (v8)
    {
      *((void *)v8 + 1) = a1;
      *((_DWORD *)v8 + 4) = a2;
      *((void *)v8 + 3) = a3;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v10 = (void **)sqlite3_aggregate_context(a1, 8);
  objc_super v11 = *v10;
  if (v6) {
    id v12 = (void *)v6[6];
  }
  else {
    id v12 = 0;
  }
  unint64_t v13 = (void (*)(void))v12[2];
  int v14 = v12;
  uint64_t v15 = v13();

  *uint64_t v10 = (void *)v15;
}

void _scalarFunctionImplementation(sqlite3_context *a1, int a2, uint64_t a3)
{
  sqlite3_user_data(a1);
  id v6 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [_MSVSQLDatabaseFunctionContext alloc];
  if (v7)
  {
    v13.receiver = v7;
    v13.super_class = (Class)_MSVSQLDatabaseFunctionContext;
    id v8 = [(sqlite3_context *)&v13 init];
    BOOL v9 = v8;
    if (v8)
    {
      *((void *)v8 + 1) = a1;
      *((_DWORD *)v8 + 4) = a2;
      *((void *)v8 + 3) = a3;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v10 = ((void (**)(void, void *))v6)[2](v6, v9);
  if (v10 != v9)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void _scalarFunctionImplementation(sqlite3_context *, int, sqlite3_value **)");
    [v11 handleFailureInFunction:v12 file:@"MSVSQLDatabase.m" lineNumber:1270 description:@"function did not return any result"];
  }
}

uint64_t _MSV_XXH_XXH32_digest(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 4)) {
    int v1 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 8), (uint32x4_t)xmmword_1A312BAA0), (int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 8), (uint32x4_t)xmmword_1A312BA90)));
  }
  else {
    int v1 = *(_DWORD *)(a1 + 16) + 374761393;
  }
  unsigned int v2 = *(_DWORD *)a1 + v1;
  int v3 = (int *)(a1 + 24);
  unint64_t v4 = *(_DWORD *)(a1 + 40) & 0xF;
  if ((*(_DWORD *)(a1 + 40) & 0xFu) >= 4)
  {
    do
    {
      int v5 = *v3++;
      HIDWORD(v6) = v2 - 1028477379 * v5;
      LODWORD(v6) = HIDWORD(v6);
      unsigned int v2 = 668265263 * (v6 >> 15);
      v4 -= 4;
    }
    while (v4 > 3);
  }
  for (; v4; --v4)
  {
    int v7 = *(unsigned __int8 *)v3;
    int v3 = (int *)((char *)v3 + 1);
    HIDWORD(v8) = v2 + 374761393 * v7;
    LODWORD(v8) = HIDWORD(v8);
    unsigned int v2 = -1640531535 * (v8 >> 21);
  }
  unsigned int v9 = -1028477379 * ((-2048144777 * (v2 ^ (v2 >> 15))) ^ ((-2048144777 * (v2 ^ (v2 >> 15))) >> 13));
  return v9 ^ HIWORD(v9);
}

void *__MSVNanoIDSetTestingArc4StateSeed(uint64_t a1, unint64_t a2)
{
  if (__MSVNanoIDTestingArc4State)
  {
    free((void *)__MSVNanoIDTestingArc4State);
    __MSVNanoIDTestingArc4State = 0;
  }
  CFTypeRef result = malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
  __MSVNanoIDTestingArc4State = (uint64_t)result;
  if (result)
  {
    int v5 = result;
    *CFTypeRef result = 0;
    CFTypeRef result = malloc_type_malloc(0x100uLL, 0xE14FBD05uLL);
    uint64_t v6 = 0;
    v5[1] = result;
    do
    {
      *(unsigned char *)(v5[1] + v6) = v6;
      ++v6;
    }
    while (v6 != 256);
    uint64_t v7 = __MSVNanoIDTestingArc4State;
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = 0;
  int v9 = 0;
  uint64_t v10 = *(void *)(v7 + 8);
  do
  {
    int v11 = *(unsigned __int8 *)(v10 + v8);
    v9 += v11 + *(unsigned __int8 *)(a1 + v8 % a2);
    *(unsigned char *)(v10 + v8) = *(unsigned char *)(v10 + v9);
    *(unsigned char *)(v10 + v9) = v11;
    ++v8;
  }
  while (v8 != 255);
  uint64_t v12 = *(void *)(v7 + 8);
  int v13 = 768;
  LODWORD(v15) = *(_DWORD *)v7;
  int v14 = *(_DWORD *)(v7 + 4);
  do
  {
    uint64_t v15 = (v15 + 1);
    char v16 = *(unsigned char *)(v12 + v15);
    LOBYTE(v14) = v16 + v14;
    *(unsigned char *)(v12 + v15) = *(unsigned char *)(v12 + v14);
    *(unsigned char *)(v12 + v14) = v16;
    --v13;
  }
  while (v13);
  *(_DWORD *)uint64_t v7 = v15;
  *(_DWORD *)(v7 + 4) = v14;
  return result;
}

id MSVNanoIDCreate()
{
  return MSVNanoIDCreateWithCharacters(@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-", 21);
}

id MSVNanoIDCreateWithRandomSource(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [a3 mutableBytesWithLength:a2];
  uint64_t v7 = [v5 length];
  id v8 = v5;
  uint64_t v9 = [v8 cStringUsingEncoding:4];
  id v10 = v6;
  uint64_t v11 = [v10 mutableBytes];
  if (a2 >= 1)
  {
    uint64_t v12 = (unsigned char *)v11;
    uint64_t v13 = a2;
    do
    {
      unsigned char *v12 = *(unsigned char *)(v9 + (char)*v12 % v7);
      ++v12;
      --v13;
    }
    while (v13);
  }
  int v14 = (void *)[[NSString alloc] initWithBytes:v11 length:a2 encoding:4];

  return v14;
}

BOOL msv_dispatch_sync_on_main_queue(void *a1)
{
  int v1 = a1;
  int v2 = pthread_main_np();
  if (v2 == 1) {
    v1[2](v1);
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], v1);
  }

  return v2 == 1;
}

uint64_t msv_dispatch_sync_BOOL(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_BOOL_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  uint64_t v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t msv_dispatch_sync_int64(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_int64_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  uint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_int64_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_uint64(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_uint64_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  uint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_uint64_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_int32(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_int32_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  uint64_t v5 = *((unsigned int *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_int32_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_uint32(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_uint32_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  uint64_t v5 = *((unsigned int *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_uint32_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_int(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_int_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  uint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_int_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_uint(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_uint_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  uint64_t v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_uint_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

float msv_dispatch_sync_float(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = (float *)&v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_float_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  float v5 = v11[6];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __msv_dispatch_sync_float_block_invoke(uint64_t a1)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(float (**)(void))(*(void *)(a1 + 32) + 16))();
}

double msv_dispatch_sync_double(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_double_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  double v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __msv_dispatch_sync_double_block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(double (**)(void))(*(void *)(a1 + 32) + 16))();
}

id msv_dispatch_sync_object(NSObject *a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__3953;
  int v14 = __Block_byref_object_dispose__3954;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __msv_dispatch_sync_object_block_invoke;
  v7[3] = &unk_1E5ADA278;
  id v8 = v3;
  uint64_t v9 = &v10;
  id v4 = v3;
  dispatch_sync(a1, v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __Block_byref_object_copy__3953(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3954(uint64_t a1)
{
}

uint64_t __msv_dispatch_sync_object_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return MEMORY[0x1F41817F8]();
}

void sub_1A31107FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void *__getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = SpringBoardServicesLibrary();
  uint64_t result = dlsym(v2, "SBUserNotificationForcesModalAlertAppearance");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  return result;
}

void *SpringBoardServicesLibrary()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __SpringBoardServicesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5ADA338;
    uint64_t v6 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  os_log_t v0 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"void *SpringBoardServicesLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"MSVSystemDialog.m", 18, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  int v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *__getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = SpringBoardServicesLibrary();
  uint64_t result = dlsym(v2, "SBUserNotificationDisplayActionButtonOnLockScreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

void *__getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = SpringBoardServicesLibrary();
  uint64_t result = dlsym(v2, "SBUserNotificationDismissesOverlaysInLockScreen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 24);
  return result;
}

void *__getSBUserNotificationAllowedApplicationsKeySymbolLoc_block_invoke(uint64_t a1)
{
  int v2 = SpringBoardServicesLibrary();
  uint64_t result = dlsym(v2, "SBUserNotificationAllowedApplicationsKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void _MSVSystemDialogUserNotificationCallback(__CFUserNotification *a1, char a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = +[MSVSystemDialogManager sharedManager];
  long long v5 = [v4 systemDialogForUserNotification:a1];
  if (!v5) {
    goto LABEL_17;
  }
  if ((a2 & 3) != 0) {
    uint64_t v6 = 2 * ((a2 & 3) == 1);
  }
  else {
    uint64_t v6 = 1;
  }
  CFDictionaryRef ResponseDictionary = CFUserNotificationGetResponseDictionary(a1);
  if (ResponseDictionary)
  {
    id v8 = CFDictionaryGetValue(ResponseDictionary, (const void *)*MEMORY[0x1E4F1DA28]);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v10 = 0;
        goto LABEL_13;
      }
      id v9 = v8;
    }
    uint64_t v10 = v9;
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v10 = 0;
LABEL_14:
  uint64_t v11 = [[MSVSystemDialogResponse alloc] initWithIdentifier:v6 textFieldValues:v10];
  uint64_t v12 = [v5 pendingCompletion];
  uint64_t v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, MSVSystemDialogResponse *))(v12 + 16))(v12, v11);
  }
  [v4 unregisterSystemDialogWithUserNotification:a1];
  [v5 setPresentedUserNotification:0];
  [v5 setPendingCompletion:0];
  [v5 setActiveRunLoopSource:0];

LABEL_17:
}

uint64_t __Block_byref_object_copy__4087(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4088(uint64_t a1)
{
}

uint64_t __SpringBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SpringBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1A3113A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4230(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4231(uint64_t a1)
{
}

void sub_1A3113BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3113CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3113E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3113F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3114098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A31141CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3114304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3114434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3114568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A3114694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A31169DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 136));
  _Unwind_Resume(a1);
}

void sub_1A3116B4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3117014(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A3117218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3117A04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3117AA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3117CA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A311831C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1A311890C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A3118E04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A3119248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_1A3119384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A3119508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1A3119BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t __Block_byref_object_copy__4497(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4498(uint64_t a1)
{
}

void _MSVPropertyListEncoderAppendCharacters(void *a1, unsigned __int16 *a2, unint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  unint64_t v6 = 0;
  uint64_t v7 = a2 + 1;
  while (1)
  {
    if (v6 == 0 || v6 >= 0xFFFFFFFFFFFFFE71)
    {
      uint64_t v8 = a3 - 1 >= v6 + 399 ? v6 + 399 : a3 - 1;
      unsigned int v9 = *a2;
      if (v9 <= 0x7F)
      {
        unint64_t v10 = 0;
        unint64_t v11 = v8 + 1;
        while (1)
        {
          v20[v10] = v9;
          if (v8 == v10) {
            break;
          }
          unsigned int v12 = v7[v10];
          LOBYTE(v9) = v7[v10++];
          if (v12 > 0x7F)
          {
            unint64_t v11 = v10;
            goto LABEL_12;
          }
        }
        ++v10;
LABEL_12:
        if (v11 > v6)
        {
          [v5 appendBytes:v20 length:v10 - v6];
          unint64_t v6 = v11;
        }
      }
    }
    CFIndex v13 = a3 - v6;
    if (a3 <= v6) {
      break;
    }
    if (a2[v6] >= 0x80u)
    {
      CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
      CFStringRef v15 = CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], &a2[v6], v13, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
      if (v15)
      {
        CFStringRef v16 = v15;
        CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(v14, v15, 0x8000100u, 0);
        if (ExternalRepresentation)
        {
          CFDataRef v18 = ExternalRepresentation;
          BytePtr = CFDataGetBytePtr(ExternalRepresentation);
          [v5 appendBytes:BytePtr length:CFDataGetLength(v18)];
          CFRelease(v18);
        }
        CFRelease(v16);
      }
      break;
    }
  }
}

id MSVImageUtilitiesCopyUTTypeForImageFormat(unint64_t a1)
{
  if (a1 >= 3)
  {
    int v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"NSString *MSVImageUtilitiesCopyUTTypeForImageFormat(MSVImageFormat)"];
    [v2 handleFailureInFunction:v3 file:@"MSVImageUtilities.m" lineNumber:33 description:@"Unsupported MSVImageFormat"];

    int v1 = 0;
  }
  else
  {
    int v1 = off_1E5ADA720[a1];
  }
  id v4 = (void *)[(__CFString *)v1 copy];
  return v4;
}

id MSVImageUtilitiesCopyUTTypeForImage()
{
  Property = (void *)CGImageGetProperty();
  if (Property)
  {
    int v1 = Property;
    CFTypeID v2 = CFGetTypeID(Property);
    if (v2 == CFStringGetTypeID()) {
      Property = v1;
    }
    else {
      Property = 0;
    }
  }
  return Property;
}

BOOL MSVImageUtilitiesImageFormatSupportsTransparency(uint64_t a1)
{
  return a1 == 1;
}

CGImageSourceRef MSVImageUtilitiesCreateImageSource(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"CGImageSourceRef MSVImageUtilitiesCreateImageSource(NSURL *__strong)"];
    [v7 handleFailureInFunction:v8 file:@"MSVImageUtilities.m" lineNumber:53 description:@"MSVImageUtilitiesCreateImageSource: imageURL cannot be NULL"];
  }
  CFTypeID v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = [v1 path];
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4) {
    CGImageSourceRef v5 = CGImageSourceCreateWithURL((CFURLRef)v1, 0);
  }
  else {
    CGImageSourceRef v5 = 0;
  }

  return v5;
}

CGImageRef MSVImageUtilitiesCreateImageFromSource(CGImageSource *a1, size_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef MSVImageUtilitiesCreateImageFromSource(CGImageSourceRef, size_t)");
    [v7 handleFailureInFunction:v8 file:@"MSVImageUtilities.m" lineNumber:64 description:@"MSVImageUtilitiesCreateImageFromSource: imageSource cannot be NULL"];
  }
  uint64_t v9 = *MEMORY[0x1E4F2FF08];
  v10[0] = MEMORY[0x1E4F1CC28];
  CFDictionaryRef v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, a2, v4);

  return ImageAtIndex;
}

CGImageDestinationRef MSVImageUtilitiesCreateDataImageDestination(unint64_t a1, void *a2, size_t a3)
{
  CGImageSourceRef v5 = a2;
  CFStringRef v6 = (const __CFString *)MSVImageUtilitiesCopyUTTypeForImageFormat(a1);
  CGImageDestinationRef v7 = CGImageDestinationCreateWithData(v5, v6, a3, 0);

  return v7;
}

CGImageDestinationRef MSVImageUtilitiesCreateFileImageDestination(unint64_t a1, void *a2, size_t a3)
{
  CFURLRef v5 = a2;
  CFStringRef v6 = (const __CFString *)MSVImageUtilitiesCopyUTTypeForImageFormat(a1);
  CGImageDestinationRef v7 = CGImageDestinationCreateWithURL(v5, v6, a3, 0);

  return v7;
}

BOOL MSVImageUtilitiesResizeSourceImageToDestination(CGImageSource *a1, size_t a2, uint64_t a3, CGImageDestination *a4, double a5)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    CFStringRef v15 = [MEMORY[0x1E4F28B00] currentHandler];
    CFStringRef v16 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL MSVImageUtilitiesResizeSourceImageToDestination(CGImageSourceRef, size_t, MSVImageFormat, CGImageDestinationRef, CGFloat)");
    [v15 handleFailureInFunction:v16 file:@"MSVImageUtilities.m" lineNumber:83 description:@"MSVImageUtilitiesResizeSourceImageToDestination: imageSource cannot be NULL"];

    if (a4) {
      goto LABEL_3;
    }
  }
  int v17 = [MEMORY[0x1E4F28B00] currentHandler];
  CFDataRef v18 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL MSVImageUtilitiesResizeSourceImageToDestination(CGImageSourceRef, size_t, MSVImageFormat, CGImageDestinationRef, CGFloat)");
  [v17 handleFailureInFunction:v18 file:@"MSVImageUtilities.m" lineNumber:84 description:@"MSVImageUtilitiesResizeSourceImageToDestination: imageDestination cannot be NULL"];

LABEL_3:
  v19[0] = *MEMORY[0x1E4F2FF68];
  unint64_t v10 = [NSNumber numberWithDouble:a5];
  v19[1] = *MEMORY[0x1E4F2FE28];
  v20[0] = v10;
  v20[1] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a1, a2, v11);
  if (ThumbnailAtIndex)
  {
    _MSVImageUtilitiesCreateImageProperties(a3, 0.0, a5);
    CFDictionaryRef v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGImageDestinationAddImage(a4, ThumbnailAtIndex, v13);
    CFRelease(ThumbnailAtIndex);
  }
  return ThumbnailAtIndex != 0;
}

id _MSVImageUtilitiesCreateImageProperties(uint64_t a1, double a2, double a3)
{
  CFStringRef v6 = [MEMORY[0x1E4F1CA60] dictionary];
  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F2FF08]];
  if (a3 > 0.00000011920929)
  {
    CGImageDestinationRef v7 = [NSNumber numberWithDouble:a3];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2F428]];
  }
  if (a1 == 2)
  {
    [v6 setObject:*MEMORY[0x1E4F2F4F0] forKeyedSubscript:*MEMORY[0x1E4F2F6C8]];
    [v6 setObject:&unk_1EF6519F0 forKeyedSubscript:*MEMORY[0x1E4F2F4E0]];
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2F500]];
    [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F2F508]];
    uint64_t v9 = &unk_1EF651A08;
    unint64_t v10 = (void *)MEMORY[0x1E4F2F430];
  }
  else
  {
    if (a1) {
      goto LABEL_10;
    }
    if (a2 > 0.00000011920929)
    {
      uint64_t v8 = [NSNumber numberWithDouble:a2];
      [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2F430]];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CC38];
    unint64_t v10 = (void *)MEMORY[0x1E4F2F470];
  }
  [v6 setObject:v9 forKeyedSubscript:*v10];
LABEL_10:
  return v6;
}

BOOL MSVImageUtilitiesResizeSourceImageToJPEGDestination(CGImageSource *a1, size_t a2, CGImageDestination *a3, double a4, double a5)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    CFStringRef v15 = [MEMORY[0x1E4F28B00] currentHandler];
    CFStringRef v16 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL MSVImageUtilitiesResizeSourceImageToJPEGDestination(CGImageSourceRef, size_t, CGImageDestinationRef, CGFloat, CGFloat)");
    [v15 handleFailureInFunction:v16 file:@"MSVImageUtilities.m" lineNumber:102 description:@"MSVImageUtilitiesResizeSourceImageToJPEGDestination: imageSource cannot be NULL"];

    if (a3) {
      goto LABEL_3;
    }
  }
  int v17 = [MEMORY[0x1E4F28B00] currentHandler];
  CFDataRef v18 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL MSVImageUtilitiesResizeSourceImageToJPEGDestination(CGImageSourceRef, size_t, CGImageDestinationRef, CGFloat, CGFloat)");
  [v17 handleFailureInFunction:v18 file:@"MSVImageUtilities.m" lineNumber:103 description:@"MSVImageUtilitiesResizeSourceImageToJPEGDestination: imageDestination cannot be NULL"];

LABEL_3:
  v19[0] = *MEMORY[0x1E4F2FF68];
  unint64_t v10 = [NSNumber numberWithDouble:a5];
  v19[1] = *MEMORY[0x1E4F2FE28];
  v20[0] = v10;
  v20[1] = MEMORY[0x1E4F1CC38];
  CFDictionaryRef v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a1, a2, v11);
  if (ThumbnailAtIndex)
  {
    _MSVImageUtilitiesCreateImageProperties(0, a4, a5);
    CFDictionaryRef v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGImageDestinationAddImage(a3, ThumbnailAtIndex, v13);
    CFRelease(ThumbnailAtIndex);
  }
  return ThumbnailAtIndex != 0;
}

void MSVImageUtilitiesAddSourceImageToDestination(CGImageSource *a1, size_t a2, uint64_t a3, CGImageDestination *a4)
{
  if (a1)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVImageUtilitiesAddSourceImageToDestination(CGImageSourceRef, size_t, MSVImageFormat, CGImageDestinationRef)");
    [v8 handleFailureInFunction:v9 file:@"MSVImageUtilities.m" lineNumber:121 description:@"MSVImageUtilitiesAddSourceImageToDestination: imageSource cannot be NULL"];

    if (a4) {
      goto LABEL_3;
    }
  }
  unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  CFDictionaryRef v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVImageUtilitiesAddSourceImageToDestination(CGImageSourceRef, size_t, MSVImageFormat, CGImageDestinationRef)");
  [v10 handleFailureInFunction:v11 file:@"MSVImageUtilities.m" lineNumber:122 description:@"MSVImageUtilitiesAddSourceImageToDestination: imageDestination cannot be NULL"];

LABEL_3:
  _MSVImageUtilitiesCreateImageProperties(a3, 0.0, 0.0);
  CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImageFromSource(a4, a1, a2, v12);
}

void MSVImageUtilitiesAddSourceImageToJPEGDestination(CGImageSource *a1, size_t a2, CGImageDestination *a3, double a4)
{
  if (a1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVImageUtilitiesAddSourceImageToJPEGDestination(CGImageSourceRef, size_t, CGImageDestinationRef, CGFloat)");
    [v8 handleFailureInFunction:v9 file:@"MSVImageUtilities.m" lineNumber:129 description:@"MSVImageUtilitiesAddSourceImageToJPEGDestination: imageSource cannot be NULL"];

    if (a3) {
      goto LABEL_3;
    }
  }
  unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
  CFDictionaryRef v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVImageUtilitiesAddSourceImageToJPEGDestination(CGImageSourceRef, size_t, CGImageDestinationRef, CGFloat)");
  [v10 handleFailureInFunction:v11 file:@"MSVImageUtilities.m" lineNumber:130 description:@"MSVImageUtilitiesAddSourceImageToJPEGDestination: imageDestination cannot be NULL"];

LABEL_3:
  _MSVImageUtilitiesCreateImageProperties(0, a4, 0.0);
  CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImageFromSource(a3, a1, a2, v12);
}

void MSVImageUtilitiesAddImageToDestination(CGImage *a1, uint64_t a2, CGImageDestination *a3)
{
  if (a1)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    CFStringRef v6 = [MEMORY[0x1E4F28B00] currentHandler];
    CGImageDestinationRef v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVImageUtilitiesAddImageToDestination(CGImageRef, MSVImageFormat, CGImageDestinationRef)");
    [v6 handleFailureInFunction:v7 file:@"MSVImageUtilities.m" lineNumber:137 description:@"MSVImageUtilitiesAddImageToDestination: image cannot be NULL"];

    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVImageUtilitiesAddImageToDestination(CGImageRef, MSVImageFormat, CGImageDestinationRef)");
  [v8 handleFailureInFunction:v9 file:@"MSVImageUtilities.m" lineNumber:138 description:@"MSVImageUtilitiesAddImageToDestination: imageDestination cannot be NULL"];

LABEL_3:
  _MSVImageUtilitiesCreateImageProperties(a2, 0.0, 0.0);
  CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImage(a3, a1, v10);
}

void MSVImageUtilitiesAddJPEGToDestination(CGImage *a1, CGImageDestination *a2, double a3)
{
  if (a1)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    CFStringRef v6 = [MEMORY[0x1E4F28B00] currentHandler];
    CGImageDestinationRef v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVImageUtilitiesAddJPEGToDestination(CGImageRef, CGFloat, CGImageDestinationRef)");
    [v6 handleFailureInFunction:v7 file:@"MSVImageUtilities.m" lineNumber:145 description:@"MSVImageUtilitiesAddJPEGToDestination: image cannot be NULL"];

    if (a2) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void MSVImageUtilitiesAddJPEGToDestination(CGImageRef, CGFloat, CGImageDestinationRef)");
  [v8 handleFailureInFunction:v9 file:@"MSVImageUtilities.m" lineNumber:146 description:@"MSVImageUtilitiesAddJPEGToDestination: imageDestination cannot be NULL"];

LABEL_3:
  _MSVImageUtilitiesCreateImageProperties(0, a3, 0.0);
  CFDictionaryRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImage(a2, a1, v10);
}

double MSVImageUtilitiesMakeBoundingBoxSize(double a1, double a2, double a3, double a4)
{
  if (a1 == 0.0 || a2 == 0.0) {
    return *MEMORY[0x1E4F1DB30];
  }
  double v4 = a3 / a1;
  double v5 = a4 / a2;
  if (v4 >= v5) {
    double v4 = v5;
  }
  return a1 * v4;
}

id _MSVTransformStateValue(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (_NSIsNSArray())
  {
    id v2 = v1;
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = _MSVTransformStateValue(*(void *)(*((void *)&v17 + 1) + 8 * i));
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
  }
  else
  {
    if (_NSIsNSDictionary())
    {
      CFDictionaryRef v10 = (void *)MEMORY[0x1E4F1CA60];
      id v11 = v1;
      CFDictionaryRef v12 = objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = ___MSVTransformStateValue_block_invoke;
      v15[3] = &unk_1E5ADA798;
      id v3 = v12;
      id v16 = v3;
      [v11 enumerateKeysAndObjectsUsingBlock:v15];

      goto LABEL_15;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [v1 UUIDString];
      }
      else if ([MEMORY[0x1E4F28F98] propertyList:v1 isValidForFormat:200])
      {
        id v14 = v1;
      }
      else
      {
        id v14 = [v1 debugDescription];
      }
      id v3 = v14;
      goto LABEL_15;
    }
    id v4 = [v1 _stateDumpObject];
    _MSVTransformStateValue(v4);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_15:
  return v3;
}

uint64_t __MSVLogAddStateHandler_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _MSVTransformStateValue(v2);
  id v12 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:&v12];
  id v5 = v12;
  uint64_t v6 = v5;
  if (v3 && v2 && v5)
  {
    uint64_t v7 = os_log_create("com.apple.amp.MediaServices", "Default_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v13[0] = @"0:value";
      v13[1] = @"1:transformedValue";
      v14[0] = v2;
      v14[1] = v3;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      *(_DWORD *)buf = 138543362;
      id v16 = v8;
      _os_log_impl(&dword_1A30CD000, v7, OS_LOG_TYPE_FAULT, "Failure to serialize state dump: %{public}@", buf, 0xCu);
    }
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  CFDictionaryRef v10 = objc_msgSend(NSString, "stringWithUTF8String:", "MSVLogStateHandle MSVLogAddStateHandler(__strong dispatch_queue_t _Nonnull, NSString *__strong _Nonnull, _MSVLogState  _Nullable (^__strong _Nonnull)(MSVLogStateHints, __strong _MSVLogStateEncode))_block_invoke");
  [v9 handleFailureInFunction:v10, @"OSLog+MSVAdditions.m", 65, @"Error serializing state capture: %@", v6 file lineNumber description];

LABEL_9:
  return v4;
}

void sub_1A311EABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5239(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5240(uint64_t a1)
{
}

void sub_1A311ECF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A311EF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A31205F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  objc_destroyWeak(v24);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)(v25 - 104));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5635(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1A62426F0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5636(uint64_t a1)
{
}

void sub_1A3121784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1A3121B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A3121BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5996(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5997(uint64_t a1)
{
}

uint64_t BKSProcessAssertionBackgroundTimeRemaining()
{
  return MEMORY[0x1F410ABC8]();
}

uint64_t BSNSStringFromCGPoint()
{
  return MEMORY[0x1F410C480]();
}

uint64_t BSNSStringFromCGRect()
{
  return MEMORY[0x1F410C488]();
}

uint64_t BSNSStringFromCGSize()
{
  return MEMORY[0x1F410C490]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFBitVectorRef CFBitVectorCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex numBits)
{
  return (CFBitVectorRef)MEMORY[0x1F40D73A8](allocator, bytes, numBits);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1F40D73B8](allocator, capacity);
}

CFMutableBitVectorRef CFBitVectorCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBitVectorRef bv)
{
  return (CFMutableBitVectorRef)MEMORY[0x1F40D73C0](allocator, capacity, bv);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x1F40D73C8](bv, idx);
}

void CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8 *bytes)
{
}

CFIndex CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1F40D73E0](bv, range.location, range.length, *(void *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
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

CFStringRef CFHTTPMessageCopyVersion(CFHTTPMessageRef message)
{
  return (CFStringRef)MEMORY[0x1F40D52C0](message);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
}

uint64_t CFReadStreamSignalEvent()
{
  return MEMORY[0x1F40D8028]();
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

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8470](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return MEMORY[0x1F40D54F8]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
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

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x1F40D8A58](userNotification);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
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

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1F40D9840](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1F40D9858](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1F40D9868](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1F40D9870](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1F40D9878](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1F40D99A8](red, green, blue, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1F40D99D0](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B48](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9C58](space);
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

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1F40DA880](image, space);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9758](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D8](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1F40DA980]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9988](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

CFDataRef ColorSyncProfileCopyData(ColorSyncProfileRef prof, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D6560](prof, error);
}

ColorSyncProfileRef ColorSyncProfileCreateWithName(CFStringRef name)
{
  return (ColorSyncProfileRef)MEMORY[0x1F40D65A0](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1F417CE28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x1F41167A0]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
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

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1F41168C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1F41168D0]();
}

uint64_t PBDataWriterWriteBareVarint()
{
  return MEMORY[0x1F41471A0]();
}

uint64_t PBReaderReadVarIntBuf()
{
  return MEMORY[0x1F4147290]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1F40D94A8]();
}

uint64_t _NSIsNSDate()
{
  return MEMORY[0x1F40D94B0]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1F40D94D8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x1F417E430](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4D8](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::runtime_error *__cdecl std::runtime_error::operator=(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4F8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1F417EF70](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1F40C9E20]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1F40C9E48]();
}

uint64_t _dyld_process_info_create()
{
  return MEMORY[0x1F40C9EA8]();
}

uint64_t _dyld_process_info_for_each_image()
{
  return MEMORY[0x1F40C9EB0]();
}

uint64_t _dyld_process_info_get_state()
{
  return MEMORY[0x1F40C9ED0]();
}

uint64_t _dyld_process_info_release()
{
  return MEMORY[0x1F40C9EF0]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

void bzero(void *a1, size_t a2)
{
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x1F41814E8](cls, outCount);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181508](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BF0](strm, *(void *)&level, version, *(void *)&stream_size);
}

uint64_t dirstat_np()
{
  return MEMORY[0x1F40CB918]();
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

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
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

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1F40CBF08]();
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return MEMORY[0x1F40CBF10]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x1F4182C20](file);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x1F4182C60](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1F4182C78](file, buf, *(void *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x1F4182CA0](file, buf, *(void *)&len);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CD8](strm, version, *(void *)&stream_size);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1F41815B8](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1F41815C0](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1F41815C8](v);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC810](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC850](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x1F41815D0](m, *(void *)&index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x1F41815D8](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CCE08](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x1F40F2AD0](connection, definition);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1F40F2C60]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return (nw_protocol_metadata_t)MEMORY[0x1F40F2CF0](context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x1F40F2CF8](context_identifier);
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3120](identifier, *(void *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x1F40F3128](framer_definition);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x1F40F3130](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

id nw_framer_message_copy_object_value(nw_framer_message_t message, const char *key)
{
  return (id)MEMORY[0x1F40F3148](message, key);
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return (nw_framer_message_t)MEMORY[0x1F40F3150](framer);
}

void nw_framer_message_set_object_value(nw_framer_message_t message, const char *key, id value)
{
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x1F40F3160](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

nw_framer_message_t nw_framer_protocol_create_message(nw_protocol_definition_t definition)
{
  return (nw_framer_message_t)MEMORY[0x1F40F3178](definition);
}

void nw_framer_set_cleanup_handler(nw_framer_t framer, nw_framer_cleanup_handler_t cleanup_handler)
{
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
}

void nw_framer_set_stop_handler(nw_framer_t framer, nw_framer_stop_handler_t stop_handler)
{
}

void nw_framer_set_wakeup_handler(nw_framer_t framer, nw_framer_wakeup_handler_t wakeup_handler)
{
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return MEMORY[0x1F40F31B0](framer, output_length);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1F40F3418](parameters);
}

uint64_t nw_parameters_create_quic_stream()
{
  return MEMORY[0x1F40F34C8]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x1F40F3A28]();
}

void nw_protocol_stack_clear_application_protocols(nw_protocol_stack_t stack)
{
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

uint64_t nw_quic_connection_copy_sec_protocol_options()
{
  return MEMORY[0x1F40F3CE0]();
}

uint64_t nw_quic_connection_set_initial_max_streams_bidirectional()
{
  return MEMORY[0x1F40F3D30]();
}

uint64_t nw_quic_connection_set_initial_max_streams_unidirectional()
{
  return MEMORY[0x1F40F3D38]();
}

uint64_t nw_quic_connection_set_keepalive()
{
  return MEMORY[0x1F40F3D40]();
}

uint64_t nw_quic_connection_set_max_datagram_frame_size()
{
  return MEMORY[0x1F40F3D50]();
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

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x1F4181740](name);
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

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1F4181AB8](property, outCount);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1F4181AC0](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA60](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
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

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1F4181B30](str);
}

void *__cdecl sqlite3_aggregate_context(sqlite3_context *a1, int nBytes)
{
  return (void *)MEMORY[0x1F4181F60](a1, *(void *)&nBytes);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE0](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_text64(sqlite3_stmt *a1, int a2, const char *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *), unsigned __int8 encoding)
{
  return MEMORY[0x1F4181FF8](a1, *(void *)&a2, a3, a4, a5, encoding);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1F4182048](a1, *(void *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1F4182120](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_window_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xValue)(sqlite3_context *), void (__cdecl *xInverse)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1F4182138](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xStep, xFinal, xValue);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1F41821B8](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void *__cdecl sqlite3_get_auxdata(sqlite3_context *a1, int N)
{
  return (void *)MEMORY[0x1F41821F8](a1, *(void *)&N);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_blob64(sqlite3_context *a1, const void *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_error_code(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_error_nomem(sqlite3_context *a1)
{
}

void sqlite3_result_error_toobig(sqlite3_context *a1)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_pointer(sqlite3_context *a1, void *a2, const char *a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_text64(sqlite3_context *a1, const char *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *), unsigned __int8 encoding)
{
}

void sqlite3_set_auxdata(sqlite3_context *a1, int N, void *a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41823C0](pStmt);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1F4182408](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182410](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1F4182418](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  MEMORY[0x1F4182428](a1);
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1F4182440](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x1F4182450](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1F4182468](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1F415CCA8]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1F415CCF0]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1F415CD00]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1F415CD08]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1F415CD20]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1F415CD50]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1F415CD80]();
}

uint64_t tcc_server_message_get_identity_for_credential()
{
  return MEMORY[0x1F415CDA0]();
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1F40D22B8](buf, format, backgroundColor, image, *(void *)&flags);
}

vImage_Error vImageUnpremultiplyData_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D60](src, dest, *(void *)&flags);
}

vImage_Error vImageUnpremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D78](src, dest, *(void *)&flags);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}