void sub_1BF22D2E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF22D4AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF22DACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

CFTypeRef SACFBundleCopyStringForKey(__CFBundle *a1, const __CFString *a2)
{
  CFTypeRef result = CFBundleGetValueForInfoDictionaryKey(a1, a2);
  if (result)
  {
    id v4 = (id)result;
    CFTypeID v3 = CFGetTypeID(result);
    if (v3 == CFStringGetTypeID())
    {
      return v4;
    }
    else
    {
      return (CFTypeRef)[[NSString alloc] initWithFormat:@"%@", v4];
    }
  }
  return result;
}

void sub_1BF22E418(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF22E660(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void saos_printf_frame(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  id v11 = a1;
  _saos_printf_frame_base(v11, a2, a3, a4, a5, a6);
  [v11 appendString:@"\n"];
}

void _saos_printf_frame_base(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  id v11 = a6;
  id v12 = a1;
  _saos_printf_indent_and_count(v12, a2, a3, a4, a5);
  [v12 appendString:v11];
}

void sub_1BF23384C(_Unwind_Exception *a1)
{
}

void sub_1BF23DA48(_Unwind_Exception *a1)
{
}

void sub_1BF23DD14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF23E280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SABinarySearchArray(void *a1, __int16 a2, uint64_t a3)
{
  uint64_t v5 = [a1 count];
  id v6 = (id)[MEMORY[0x1E4F1CA98] null];
  if (!v5)
  {
    if ((a2 & 0x400) != 0) {
      return 0;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  uint64_t v31 = a2 & 0x200;
  id v32 = v6;
  if ((unint64_t)v5 >= 0x101)
  {
    uint64_t v7 = v5 - 1;
    id v8 = [a1 objectAtIndex:v5 - 1];
    v9 = *(uint64_t (**)(uint64_t))(a3 + 16);
    if (v8 == v32)
    {
      uint64_t v10 = v9(a3);
      if ((v10 & 0x8000000000000000) == 0)
      {
LABEL_5:
        if (v10 | a2 & 0x100)
        {
          id v11 = [a1 objectAtIndex:0];

          uint64_t v12 = (*(uint64_t (**)(uint64_t, void *))(a3 + 16))(a3, v11);
          if (v12 < 0)
          {
            uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v13 = v12 | v31;
            if (v12 | v31)
            {

              goto LABEL_9;
            }
          }
          if ((a2 & 0x400) != 0) {
            uint64_t v7 = 0;
          }
          else {
            uint64_t v7 = v13;
          }
          id v8 = v11;
LABEL_54:

          return v7;
        }
LABEL_46:
        if ((a2 & 0x400) != 0) {
          uint64_t v7 = v5;
        }
        goto LABEL_54;
      }
    }
    else
    {
      uint64_t v10 = -((uint64_t (*)(uint64_t, id))v9)(a3, v8);
      if ((v10 & 0x8000000000000000) == 0) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_46;
  }
LABEL_9:
  __int16 v29 = a2;
  uint64_t v30 = a2 & 0x300;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  char v16 = 0;
  uint64_t v17 = 2 << flsl(v5);
  uint64_t v18 = a3;
  v19 = (uint64_t (**)(uint64_t))(a3 + 16);
  do
  {
    if (v17 >= 0) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = v17 + 1;
    }
    uint64_t v7 = v14 + (v20 >> 1);
    if (v7 < v5)
    {
      id v21 = [a1 objectAtIndex:v14 + (v20 >> 1)];
      v22 = *v19;
      if (v21 == v32) {
        uint64_t v15 = v22(v18);
      }
      else {
        uint64_t v15 = -((uint64_t (*)(uint64_t, id))v22)(v18, v21);
      }
      if (!(v15 | v30))
      {

        return v7;
      }
      if (v15) {
        BOOL v23 = 1;
      }
      else {
        BOOL v23 = v31 == 0;
      }
      v16 |= v15 == 0;
      BOOL v24 = !v23 || v15 <= -1;
      if (v24) {
        v14 += v20 >> 1;
      }
    }
    BOOL v24 = v17 <= 1;
    uint64_t v17 = v20 >> 1;
  }
  while (!v24);
  LODWORD(v25) = v31 != 0;
  if (v15) {
    LODWORD(v25) = 0;
  }
  if (v15 < 0) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = v25;
  }
  uint64_t v26 = v14 + v25;
  uint64_t v27 = v14 + ((unint64_t)v15 >> 63);
  if ((v16 & 1) == 0) {
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((v29 & 0x400) != 0) {
    return v26;
  }
  else {
    return v27;
  }
}

void __SACachedNSString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  v1 = (void *)qword_1EB6991E8;
  qword_1EB6991E8 = v0;
}

double SASecondsFromMachTimeUsingTimebase(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = 0;
  if (a2 && HIDWORD(a2))
  {
    if (a2 != HIDWORD(a2)) {
      a1 = __udivti3();
    }
    unint64_t v2 = a1;
  }
  return (double)v2 / 1000000000.0;
}

id SAFormattedSignedBytes(unint64_t a1, int a2, int a3)
{
  id v6 = [NSString alloc];
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t v7 = SAFormattedBytesEx(-(uint64_t)a1, a2, a3, 1, 0);
    uint64_t v8 = [v6 initWithFormat:@"-%@", v7];
  }
  else
  {
    uint64_t v7 = SAFormattedBytesEx(a1, a2, a3, 1, 0);
    uint64_t v8 = [v6 initWithFormat:@"+%@", v7];
  }
  v9 = (void *)v8;

  return v9;
}

void sub_1BF23F7F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t _saos_printf_indent_and_count(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v9 = a1;
  int v10 = _saos_printf_indent_and_kernel_dot(v9, a2, a5, 0);
  LODWORD(a4) = objc_msgSend(v9, "printWithFormat:", @"%-*lu  ", a3, a4);

  return (a4 + v10);
}

uint64_t __SAMachTimebaseForLiveMachine_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&qword_1EB699210);
}

uint64_t SAMachTimeFromNanosecondsUsingTimebase(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a2 && HIDWORD(a2))
  {
    if (HIDWORD(a2) == a2) {
      return a1;
    }
    else {
      return __udivti3();
    }
  }
  return v2;
}

void sub_1BF2411FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF241960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_1BF241C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF242140(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SANanosecondsFromMachTimeUsingTimebase(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a2 && HIDWORD(a2))
  {
    if (a2 == HIDWORD(a2)) {
      return a1;
    }
    else {
      return __udivti3();
    }
  }
  return v2;
}

void sub_1BF242808(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF245620(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose(&STACK[0x228], 8);
  _Block_object_dispose(&STACK[0x248], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x288], 8);
  _Unwind_Resume(a1);
}

id uuidForBytes(uint64_t a1)
{
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a1];
  return v1;
}

void sub_1BF245974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t SAMicrostackshotStateForFlagsTaskAndThreadState(int a1, void *a2, void *a3)
{
  id v5 = a3;
  if ((a1 & 0x40) != 0) {
    int v6 = 16;
  }
  else {
    int v6 = 20;
  }
  if ((a1 & 0x80u) != 0) {
    v6 |= 8u;
  }
  if ((a1 & 0x20) == 0) {
    int v6 = 0;
  }
  int v7 = v6 | ~(8 * a1) & 0x80;
  id v8 = a2;
  if ([v8 isSuppressed]) {
    unsigned int v9 = v7 | 0x20;
  }
  else {
    unsigned int v9 = v7;
  }
  int v10 = [v8 isForeground];

  if (v10) {
    uint64_t v11 = v9 | 2;
  }
  else {
    uint64_t v11 = v9;
  }
  switch([v5 threadQos])
  {
    case 0u:
      uint64_t v11 = v11 | 0x500;
      break;
    case 1u:
      uint64_t v11 = v11 | 0x100;
      break;
    case 2u:
      uint64_t v11 = v11 | 0x200;
      break;
    case 3u:
      uint64_t v11 = v11 | 0x300;
      break;
    case 4u:
      uint64_t v11 = v11 | 0x400;
      break;
    case 5u:
      uint64_t v11 = v11 | 0x600;
      break;
    case 6u:
      uint64_t v11 = v11 | 0x700;
      break;
    default:
      break;
  }
  switch([v5 threadRequestedQos])
  {
    case 0u:
      uint64_t v11 = v11 | 0x2800;
      break;
    case 1u:
      uint64_t v11 = v11 | 0x800;
      break;
    case 2u:
      uint64_t v11 = v11 | 0x1000;
      break;
    case 3u:
      uint64_t v11 = v11 | 0x1800;
      break;
    case 4u:
      uint64_t v11 = v11 | 0x2000;
      break;
    case 5u:
      uint64_t v11 = v11 | 0x3000;
      break;
    case 6u:
      uint64_t v11 = v11 | 0x3800;
      break;
    default:
      break;
  }
  switch([v5 threadRequestedQosOverride])
  {
    case 0u:
      uint64_t v11 = v11 | 0x14000;
      break;
    case 1u:
      uint64_t v11 = v11 | 0x4000;
      break;
    case 2u:
      uint64_t v11 = v11 | 0x8000;
      break;
    case 3u:
      uint64_t v11 = v11 | 0xC000;
      break;
    case 4u:
      uint64_t v11 = v11 | 0x10000;
      break;
    case 5u:
      uint64_t v11 = v11 | 0x18000;
      break;
    case 6u:
      uint64_t v11 = v11 | 0x1C000;
      break;
    default:
      break;
  }

  return v11;
}

void sub_1BF246308(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *_CopyStringForTime(int a1, long double a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  memset(&v38, 0, sizeof(v38));
  time_t v37 = (uint64_t)(*MEMORY[0x1E4F1CF78] + a2);
  localtime_r(&v37, &v38);
  size_t v4 = strftime(v43, 0x40uLL, "%Y-%m-%d %T", &v38);
  if (!v4) {
    return &stru_1F1A80538;
  }
  unint64_t v5 = v4;
  if (v4 >= 0x40)
  {
    int v13 = *__error();
    uint64_t v14 = _sa_logt();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__str = 136315138;
      v42 = v43;
      _os_log_error_impl(&dword_1BF22B000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)__str, 0xCu);
    }

    *__error() = v13;
    _SASetCrashLogMessage(88, "%s", v15, v16, v17, v18, v19, v20, (char)v43);
    _os_crash();
    __break(1u);
    goto LABEL_15;
  }
  if (a1 >= 1)
  {
    long double v6 = fmod(a2, 1.0);
    snprintf(__str, 0x10uLL, "%0.*f", a1, (double)v6);
    v5 += strlcpy(&v43[v5], &__str[1], 64 - v5);
    if (v5 >= 0x40) {
      goto LABEL_18;
    }
  }
  size_t v7 = strftime(&v43[v5], 64 - v5, " %z", &v38);
  if (!v7) {
    v43[v5] = 0;
  }
  if (v7 + v5 >= 0x40)
  {
LABEL_15:
    int v21 = *__error();
    v22 = _sa_logt();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__str = 136315138;
      v42 = v43;
      _os_log_error_impl(&dword_1BF22B000, v22, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)__str, 0xCu);
    }

    *__error() = v21;
    _SASetCrashLogMessage(116, "%s", v23, v24, v25, v26, v27, v28, (char)v43);
    _os_crash();
    __break(1u);
LABEL_18:
    int v29 = *__error();
    uint64_t v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v40 = v43;
      _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    *__error() = v29;
    _SASetCrashLogMessage(100, "%s", v31, v32, v33, v34, v35, v36, (char)v43);
    _os_crash();
    __break(1u);
  }
  uint64_t v8 = SANSStringForCString(v43);
  unsigned int v9 = (void *)v8;
  int v10 = &stru_1F1A80538;
  if (v8) {
    int v10 = (__CFString *)v8;
  }
  uint64_t v11 = v10;

  return v11;
}

BOOL _AvoidSuspendingPid(BOOL result)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (!result)
  {
    proc_name(result, &buffer, 0x21u);
    return buffer == 0x64796669746F6ELL || buffer == 0x676F646863746177 && v3 == 100;
  }
  return result;
}

void sub_1BF246F38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1BF24779C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SAGetStackshotDataFromTailspinStackshotChunk(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1 && (unint64_t)[v1 length] >= 0x10)
  {
    id v5 = v2;
    long double v6 = (void *)[v5 bytes];
    unint64_t v7 = *v6 + 16;
    if (v7 <= [v5 length])
    {
      __int16 v3 = objc_msgSend(v5, "subdataWithRange:", 16, *v6);
    }
    else
    {
      int v8 = *__error();
      unsigned int v9 = _sa_logt();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *v6;
        int v11 = 134218496;
        uint64_t v12 = v10;
        __int16 v13 = 2048;
        uint64_t v14 = 16;
        __int16 v15 = 2048;
        uint64_t v16 = [v5 length];
        _os_log_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Malformed tailspin stackshot chunk: stackshot data is %llu bytes (+ %lu header), but chunk is only %lu bytes", (uint8_t *)&v11, 0x20u);
      }

      __int16 v3 = 0;
      *__error() = v8;
    }
  }
  else
  {
    __int16 v3 = 0;
  }

  return v3;
}

id _sa_logt()
{
  if (qword_1EB698E70 != -1) {
    dispatch_once(&qword_1EB698E70, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)qword_1EB698E68;
  return v0;
}

void ___sa_logt_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.sampleanalysis", "logging");
  id v1 = (void *)qword_1EB698E68;
  qword_1EB698E68 = (uint64_t)v0;
}

void *SANSDictionaryCopyStringForKey(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKey:a2];
  if (!v2) {
    return v2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  uint64_t v4 = [[NSString alloc] initWithFormat:@"%@", v2];

  return (void *)v4;
}

double ReduceToSignificantDigits(int a1, unsigned int *a2, double a3)
{
  double v4 = a3;
  BOOL v5 = a3 < 0.0;
  if (a3 == 0.0)
  {
    if (a2) {
      *a2 = 0;
    }
  }
  else
  {
    double v7 = -a3;
    if (!v5) {
      double v7 = v4;
    }
    unsigned int v8 = vcvtpd_s64_f64(log10(v7));
    if (a2) {
      *a2 = v8;
    }
    double v9 = __exp10((double)(int)(a1 - v8));
    return (double)(uint64_t)round(v9 * v4) / v9;
  }
  return v4;
}

id uuidForString(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, sizeof(uu));
  id v1 = a1;
  if (!uuid_parse((const char *)[v1 UTF8String], uu)) {
    goto LABEL_6;
  }
  id v2 = [NSString alloc];
  __int16 v3 = objc_msgSend(v1, "substringWithRange:", 0, 8);
  double v4 = objc_msgSend(v1, "substringWithRange:", 8, 4);
  BOOL v5 = objc_msgSend(v1, "substringWithRange:", 12, 4);
  long double v6 = objc_msgSend(v1, "substringWithRange:", 16, 4);
  double v7 = objc_msgSend(v1, "substringWithRange:", 20, 12);
  unsigned int v8 = (void *)[v2 initWithFormat:@"%@-%@-%@-%@-%@", v3, v4, v5, v6, v7];

  id v1 = v8;
  if (uuid_parse((const char *)[v1 UTF8String], uu))
  {
    int v9 = *__error();
    uint64_t v10 = _sa_logt();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v1;
      _os_log_error_impl(&dword_1BF22B000, v10, OS_LOG_TYPE_ERROR, "Unable to parse uuid %@", buf, 0xCu);
    }

    int v11 = 0;
    *__error() = v9;
  }
  else
  {
LABEL_6:
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
  }

  return v11;
}

uint64_t is_apple_internal_setting()
{
  if (qword_1EB698E78 != -1) {
    dispatch_once(&qword_1EB698E78, &__block_literal_global_12);
  }
  return _MergedGlobals_2;
}

uint64_t __is_apple_internal_setting_block_invoke()
{
  uint64_t result = os_variant_has_internal_diagnostics();
  _MergedGlobals_2 = result;
  return result;
}

uint64_t _SASetCrashLogMessage(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = snprintf(_SASetCrashLogMessage_crash_string, 0x400uLL, "%d ", a1);
  if ((result - 1) <= 0x3FE) {
    uint64_t result = vsnprintf(&_SASetCrashLogMessage_crash_string[result], 1024 - result, a2, &a9);
  }
  qword_1EA145898 = (uint64_t)_SASetCrashLogMessage_crash_string;
  return result;
}

void sub_1BF24DFC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF24F4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF24F674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF24FF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1BF2501B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1BF25A304(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void KCLogIter(unsigned int *a1, unint64_t a2, int a3)
{
  if (qword_1EB698EE0 != -1) {
    dispatch_once(&qword_1EB698EE0, &__block_literal_global_1668);
  }
  if (byte_1EB698E81 == 1)
  {
    if ((*a1 & 0xFFFFFFF0) == 0x20) {
      uint64_t v6 = 17;
    }
    else {
      uint64_t v6 = *a1;
    }
    if ((v6 - 1) <= 5)
    {
      double v7 = (const char *)(a1 + 4);
      uint64_t v8 = (uint64_t)(a1 + 12);
      unsigned int v9 = a1[1];
      unsigned int v10 = a1[2] & 0xF;
      BOOL v11 = v9 >= v10;
      unsigned int v12 = v9 - v10;
      if (!v11) {
        unsigned int v12 = 0;
      }
      unsigned int v13 = v12 - 32;
LABEL_31:
      if (v6 != 17)
      {
        if (v6 != 19)
        {
          if (v6 == 20)
          {
            int v17 = dword_1EB698E84 - 2;
            if (dword_1EB698E84 < 2)
            {
              int v18 = *__error();
              uint64_t v19 = _sa_logt();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_ERROR, "Invalid kcdata: end container at indent 0", buf, 2u);
              }

              uint64_t v20 = __error();
              int v17 = 0;
              *uint64_t v20 = v18;
            }
            dword_1EB698E84 = v17;
            uint64_t v21 = *((void *)a1 + 1);
            int v22 = *__error();
            uint64_t v23 = " -- skipping";
            if (!a3) {
              uint64_t v23 = "";
            }
            fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: id %llu%s\n", dword_1EB698E84, "", v7, v21, v23);
            *__error() = v22;
          }
          else
          {
            uint64_t v28 = dword_1EB698E84;
            KCLogItem(v6, v13, v8, v7, v28, a3);
          }
          return;
        }
        if ((unint64_t)(a1 + 4) <= a2)
        {
          uint64_t v27 = a1[1];
          if ((unint64_t)a1 + v27 + 16 <= a2 && v27 >= 4 && *a1 == 19)
          {
            uint64_t v29 = *((void *)a1 + 1);
            uint64_t v30 = a1[4];
            int v31 = *__error();
            uint64_t v32 = (FILE *)*MEMORY[0x1E4F143D8];
            int v33 = dword_1EB698E84;
            uint64_t v34 = DescriptionForKCDataType(v30);
            uint64_t v35 = " -- skipping";
            if (!a3) {
              uint64_t v35 = "";
            }
            fprintf(v32, "%*s%s: id %llu, type %s%s\n", v33, "", v7, v29, v34, v35);
            *__error() = v31;
            dword_1EB698E84 += 2;
            return;
          }
        }
        int v26 = *__error();
        fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: (invalid container)%s\n");
LABEL_49:
        *__error() = v26;
        return;
      }
      if ((unint64_t)(a1 + 4) > a2
        || (uint64_t v24 = a1[1], (unint64_t)a1 + v24 + 16 > a2)
        || (int v25 = *a1, *a1 != 17) && (v25 & 0xFFFFFFF0) != 0x20)
      {
LABEL_45:
        int v26 = *__error();
        fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: (invalid array)%s\n");
        goto LABEL_49;
      }
      unint64_t v36 = *((void *)a1 + 1);
      if (v36)
      {
        if (v25 != 17)
        {
          unsigned int v40 = *a1 & 0xF;
          BOOL v11 = v24 >= v40;
          unsigned int v41 = v24 - v40;
          if (!v11) {
            goto LABEL_45;
          }
          if (v41 < v36) {
            goto LABEL_45;
          }
          unsigned int v39 = v41 / v36;
          if (v41 % v36) {
            goto LABEL_45;
          }
          uint64_t v37 = HIDWORD(v36);
          goto LABEL_97;
        }
        uint64_t v37 = HIDWORD(v36);
        if (SHIDWORD(v36) <= 2310)
        {
          switch(HIDWORD(v36))
          {
            case 0x30:
              unsigned int v38 = 20;
              break;
            case 0x31:
              unsigned int v38 = 24;
              break;
            case 0x81A:
LABEL_77:
              unsigned int v38 = 8;
              break;
            default:
              goto LABEL_45;
          }
        }
        else
        {
          switch(HIDWORD(v36))
          {
            case 0x907:
              unsigned int v38 = 4;
              break;
            case 0x908:
            case 0x909:
              goto LABEL_45;
            case 0x90A:
            case 0x90C:
              goto LABEL_77;
            case 0x90B:
            case 0x90D:
              unsigned int v38 = 16;
              break;
            default:
              if (HIDWORD(v36) != 2369) {
                goto LABEL_45;
              }
              unsigned int v38 = 48;
              break;
          }
        }
        if (v24 / v38 < v36 || v24 % v36 >= 0x10) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v24) {
          goto LABEL_45;
        }
        uint64_t v37 = HIDWORD(v36);
        if (v25 != 17) {
          goto LABEL_68;
        }
      }
      if ((int)v37 > 2310)
      {
        switch((int)v37)
        {
          case 2311:
            unsigned int v39 = 4;
            break;
          case 2312:
          case 2313:
            goto LABEL_68;
          case 2314:
          case 2316:
            goto LABEL_91;
          case 2315:
          case 2317:
            unsigned int v39 = 16;
            break;
          default:
            if (v37 != 2369) {
              goto LABEL_68;
            }
            unsigned int v39 = 48;
            break;
        }
        goto LABEL_97;
      }
      switch(v37)
      {
        case 0x30:
          unsigned int v39 = 20;
          goto LABEL_97;
        case 0x31:
          unsigned int v39 = 24;
          goto LABEL_97;
        case 0x81A:
LABEL_91:
          unsigned int v39 = 8;
          goto LABEL_97;
      }
LABEL_68:
      unsigned int v39 = 0;
LABEL_97:
      int v42 = *__error();
      v43 = (FILE *)*MEMORY[0x1E4F143D8];
      int v44 = dword_1EB698E84;
      v45 = DescriptionForKCDataType(v37);
      v46 = " -- skipping";
      if (!a3) {
        v46 = "";
      }
      fprintf(v43, "%*s%s: of type %s, count %u size %u%s\n", v44, "", v7, v45, v36, v39, v46);
      *__error() = v42;
      if (v36)
      {
        unsigned int v47 = 0;
        uint64_t v48 = MEMORY[0x1E4F143A8];
        unint64_t v36 = v36;
        do
        {
          uint64_t v50 = v48;
          uint64_t v51 = 3221225472;
          v52 = __KCLogIter_block_invoke;
          v53 = &__block_descriptor_41_e13_v20__0I8r_v12l;
          int v54 = v37;
          unsigned int v55 = v39;
          char v56 = a3;
          KCLogItem(v37, v39, v8 + v47, 0, (dword_1EB698E84 + 2), a3);
          v47 += v39;
          --v36;
        }
        while (v36);
      }
      return;
    }
    if ((int)v6 > 2309)
    {
      if (v6 == 2310)
      {
        unsigned int v15 = a1[1];
        if (v15 != 112) {
          goto LABEL_27;
        }
        if ((a1[2] & 0x8F) != 0)
        {
          unsigned int v15 = 112;
          goto LABEL_27;
        }
        unsigned int v13 = 104;
      }
      else
      {
        if (v6 != 2312)
        {
LABEL_26:
          unsigned int v15 = a1[1];
LABEL_27:
          BOOL v11 = v15 >= (a1[2] & 0xF);
          unsigned int v16 = v15 - (a1[2] & 0xF);
          if (v11) {
            unsigned int v13 = v16;
          }
          else {
            unsigned int v13 = 0;
          }
          goto LABEL_30;
        }
        unsigned int v15 = a1[1];
        if (v15 != 32) {
          goto LABEL_27;
        }
        if ((a1[2] & 0x8F) != 0)
        {
          unsigned int v15 = 32;
          goto LABEL_27;
        }
        unsigned int v13 = 24;
      }
    }
    else
    {
      if (v6 != 17 && v6 != 19) {
        goto LABEL_26;
      }
      unsigned int v13 = a1[1];
    }
LABEL_30:
    uint64_t v8 = (uint64_t)(a1 + 4);
    double v7 = DescriptionForKCDataType(v6);
    goto LABEL_31;
  }
}

uint64_t SkipToContainerEnd(int **a1, int a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  __int16 v3 = *a1;
  unint64_t v4 = (unint64_t)a1[1];
  unint64_t v5 = (unint64_t)(*a1 + 4);
  if (v5 > v4
    || (uint64_t v6 = v3[1], v5 + v6 > v4)
    || ((int v7 = *v3, v6 >= 4) ? (v8 = v7 == 19) : (v8 = 0), !v8 || (v7 & 0xFFFFFFF0) == 0x20))
  {
    uint64_t v25 = *__error();
    unsigned int v13 = _sa_logt();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "invalid skipped container", buf, 2u);
    }

    *__error() = v25;
    _SASetCrashLogMessage(6545, "invalid skipped container", v28, v29, v30, v31, v32, v33, v36);
    _os_crash();
    __break(1u);
LABEL_28:
    uint64_t v34 = [v13 firstObject];
    uint64_t v35 = [v34 unsignedLongLongValue];
    *(_DWORD *)buf = 134217984;
    uint64_t v38 = v35;
    _os_log_fault_impl(&dword_1BF22B000, (os_log_t)v25, OS_LOG_TYPE_FAULT, "Didn't find endof skipped container %llu", buf, 0xCu);

    goto LABEL_22;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unsigned int v12 = [NSNumber numberWithUnsignedLongLong:*((void *)*a1 + 1)];
  unsigned int v13 = objc_msgSend(v11, "initWithObjects:", v12, 0);

  unint64_t v14 = (unint64_t)a1[1];
  unsigned int v15 = (char *)*a1 + (*a1)[1];
  unsigned int v16 = (unsigned int *)(v15 + 16);
  *a1 = (int *)(v15 + 16);
  unint64_t v17 = (unint64_t)(v15 + 32);
  if (v17 <= v14)
  {
    while (v17 + v16[1] <= v14 && *v16 != -242132755)
    {
      KCLogIter(v16, v14, a2);
      int v18 = *a1;
      int v19 = **a1;
      if ((v19 & 0xFFFFFFF0) == 0x20) {
        int v19 = 17;
      }
      if (v19 == 20)
      {
        uint64_t v21 = *((void *)v18 + 1);
        int v22 = [v13 lastObject];
        uint64_t v23 = [v22 unsignedLongLongValue];

        if (v23 != v21)
        {
          int v2 = *__error();
          uint64_t v25 = _sa_logt();
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v38 = v21;
            __int16 v39 = 2048;
            uint64_t v40 = v23;
            _os_log_fault_impl(&dword_1BF22B000, (os_log_t)v25, OS_LOG_TYPE_FAULT, "Unexpected end container %llu (expected %llu)", buf, 0x16u);
          }
          uint64_t v26 = 1;
          goto LABEL_23;
        }
        if ([v13 count] == 1)
        {
          uint64_t v26 = 0;
          goto LABEL_24;
        }
        [v13 removeLastObject];
      }
      else if (v19 == 19)
      {
        uint64_t v20 = [NSNumber numberWithUnsignedLongLong:*((void *)v18 + 1)];
        [v13 addObject:v20];
      }
      unint64_t v14 = (unint64_t)a1[1];
      uint64_t v24 = (char *)*a1 + (*a1)[1];
      unsigned int v16 = (unsigned int *)(v24 + 16);
      *a1 = (int *)(v24 + 16);
      unint64_t v17 = (unint64_t)(v24 + 32);
      if (v17 > v14) {
        break;
      }
    }
  }
  int v2 = *__error();
  uint64_t v25 = _sa_logt();
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_FAULT)) {
    goto LABEL_28;
  }
LABEL_22:
  uint64_t v26 = 2;
LABEL_23:

  *__error() = v2;
LABEL_24:

  return v26;
}

void sub_1BF261A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF2643F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF266F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPreferredLanguages()
{
  os_log_t v0 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (v0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v1 = v0;
      if (![v1 count])
      {
LABEL_7:

        goto LABEL_12;
      }
      uint64_t v2 = 0;
      char v3 = 1;
      while (1)
      {
        unint64_t v4 = [v1 objectAtIndexedSubscript:v2];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          break;
        }
        char v6 = (v2 + 1 >= (unint64_t)[v1 count]) | ~v3;
        uint64_t v2 = 1;
        char v3 = 0;
        if (v6) {
          goto LABEL_7;
        }
      }
      int v7 = *__error();
      BOOL v8 = _sa_logt();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)unsigned int v10 = 0;
        _os_log_fault_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_FAULT, "Found the preferred languages array but contents are not NSString", v10, 2u);
      }

      *__error() = v7;
    }
  }

  id v1 = [MEMORY[0x1E4F1CA20] preferredLanguages];
LABEL_12:
  return v1;
}

uint64_t __SAProcName_block_invoke()
{
  getpid();
  uint64_t result = sandbox_check();
  if ((result + 1) <= 2) {
    _MergedGlobals_3 = (((_BYTE)result + 1) & 7) == 2;
  }
  return result;
}

void sub_1BF26B5C0(_Unwind_Exception *a1)
{
}

void sub_1BF26F21C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *context, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  if (a2 == 1)
  {
    id v25 = objc_begin_catch(a1);
    if (a20 != 36)
    {
      uint64_t v26 = v25;
      if (*(void *)(a25 + 480) && (uint64_t v27 = *(void **)(a25 + 456)) != 0)
      {
        uint64_t v28 = (FILE *)*MEMORY[0x1E4F143C8];
        [v27 UTF8String];
        [*(id *)(a25 + 480) UTF8String];
        if (a20 < 37) {
          uint64_t v29 = "Unable to decode binary format: Binary version %lu is no longer supported. Try %s build %s\n";
        }
        else {
          uint64_t v29 = "Unable to decode binary format: Binary version %lu is newer than decoder version %lu. Try %s build %s or later\n";
        }
        fprintf(v28, v29);
      }
      else
      {
        uint64_t v30 = (FILE *)*MEMORY[0x1E4F143C8];
        if (a20 < 37) {
          fprintf(v30, "Unable to decode binary format: Binary format version %lu is no longer supported. Try an older build\n");
        }
        else {
          fprintf(v30, "Unable to decode binary format: Binary version %lu is newer than decoder version %lu. Try a newer build\n");
        }
      }
      *a19 = 0;
      *(unsigned char *)gSASerializationEncodedDataIsEmbedded() = 0;

      objc_end_catch();
      JUMPOUT(0x1BF26E144);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_1BF26F840(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

uint64_t __SAKCDataReadAheadDonatingUniquePids_block_invoke(uint64_t result, unsigned int a2, _DWORD *a3)
{
  *(_DWORD *)(*(void *)(result + 32) + 4 * a2) = *a3;
  return result;
}

const char *__IgnoreSlidBaseAddress_block_invoke()
{
  uint64_t result = getenv("SA_WORKAROUND_73965546");
  if (result)
  {
    uint64_t result = (const char *)strcmp(result, "0");
    if (result) {
      byte_1EB698E82 = 1;
    }
  }
  return result;
}

void __SAKCDataReadAheadJetsamCoalitionInfo_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = [NSNumber numberWithUnsignedLongLong:a3[3]];
  unint64_t v5 = *(void **)(a1 + 32);
  char v6 = [NSNumber numberWithUnsignedLongLong:*a3];
  [v5 setObject:v7 forKeyedSubscript:v6];
}

void __SAKCDataReadAheadJetsamCoalitionInfo_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  unint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void __ReadAheadTaskLevelInfo_block_invoke(uint64_t a1, unsigned int a2, unsigned __int8 *src)
{
  uint64_t v3 = *(void *)(a1 + 32) + 24 * a2;
  *(void *)uint64_t v3 = *(unsigned int *)src;
  uuid_copy((unsigned __int8 *)(v3 + 8), src + 4);
}

uint64_t __ReadAheadTaskLevelInfo_block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if ((*(unsigned char *)(a3 + 17) & 0x20) != 0) {
    **(void **)(result + 32) = *(void *)a3;
  }
  return result;
}

uint64_t TrialLibraryCore()
{
  if (!TrialLibraryCore_frameworkLibrary) {
    TrialLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return TrialLibraryCore_frameworkLibrary;
}

uint64_t __TrialLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  TrialLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getTRIAllocationStatusClass_block_invoke(uint64_t a1)
{
  if (!TrialLibraryCore())
  {
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("TRIAllocationStatus");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getTRIAllocationStatusClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = abort_report_np();
    return (Class)DarwinupLibraryCore(v4);
  }
  return result;
}

uint64_t DarwinupLibraryCore()
{
  if (!DarwinupLibraryCore_frameworkLibrary) {
    DarwinupLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return DarwinupLibraryCore_frameworkLibrary;
}

uint64_t __DarwinupLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DarwinupLibraryCore_frameworkLibrary = result;
  return result;
}

void __getDUSessionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("DUSession");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB698EF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    DarwinupLibrary();
  }
}

void DarwinupLibrary()
{
  if (!DarwinupLibraryCore())
  {
    os_log_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getDURootClass_block_invoke(uint64_t a1)
{
  DarwinupLibrary();
  Class result = objc_getClass("DURoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1EB698EF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getAutomatedDeviceGroup_block_invoke(v3);
  }
  return result;
}

void __getAutomatedDeviceGroup_block_invoke()
{
  dispatch_block_t v0 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_1710);
  qos_class_t v1 = qos_class_self();
  uint64_t v2 = dispatch_get_global_queue(v1, 0);
  dispatch_async(v2, v0);

  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  if (dispatch_block_wait(v0, v3))
  {
    int v4 = *__error();
    unint64_t v5 = _sa_logt();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_DEFAULT, "WARNING: Timed out waiting for automated device group", v6, 2u);
    }

    *__error() = v4;
  }
}

void __getAutomatedDeviceGroup_block_invoke_2()
{
  dispatch_block_t v0 = [MEMORY[0x1E4F83948] automatedDeviceGroup];
  qos_class_t v1 = v0;
  if (v0)
  {
    id obj = v0;
    uint64_t v2 = [v0 length];
    qos_class_t v1 = obj;
    if (v2)
    {
      objc_storeStrong((id *)&qword_1EB698F00, obj);
      qos_class_t v1 = obj;
    }
  }
}

uint64_t SAHelperLibraryCore()
{
  if (!SAHelperLibraryCore_frameworkLibrary) {
    SAHelperLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SAHelperLibraryCore_frameworkLibrary;
}

uint64_t __SAHelperLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SAHelperLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getSAModelGatherInfoSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)SAHelperLibraryCore();
  if (!v2)
  {
    int v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "SAModelGatherInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1EB698F10 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

const char *DescriptionForKCDataType(uint64_t a1)
{
  if ((int)a1 <= 2304)
  {
    if ((int)a1 <= 18)
    {
      switch(a1)
      {
        case 0xDE17A59A:
          return "Begin delta stackshot";
        case 0xF19158ED:
          return "buffer end";
        case 0x11:
          return "Array";
        default:
LABEL_18:
          id v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"UNKNOWN TYPE (0x%x)", a1);
          uint64_t v3 = [v2 UTF8String];
          if (v3) {
            qos_class_t v1 = (const char *)v3;
          }
          else {
            qos_class_t v1 = "UNKNOWN TYPE";
          }

          break;
      }
    }
    else
    {
      switch((int)a1)
      {
        case '0':
          return "load info 32-bit";
        case '1':
          return "load info 64-bit";
        case '2':
          return "mach timebase";
        case '3':
          return "machabstime";
        case '4':
          return "time val";
        case '5':
          return "usecs since epoch";
        case '6':
        case '7':
        case '8':
          goto LABEL_18;
        case '9':
          return "aot info";
        default:
          if (a1 == 19)
          {
            qos_class_t v1 = "Container begin";
          }
          else
          {
            if (a1 != 20) {
              goto LABEL_18;
            }
            qos_class_t v1 = "Container end";
          }
          break;
      }
    }
  }
  else
  {
    switch((int)a1)
    {
      case 2305:
        qos_class_t v1 = "iostats";
        break;
      case 2306:
        qos_class_t v1 = "memstats";
        break;
      case 2307:
        qos_class_t v1 = "task container";
        break;
      case 2308:
        qos_class_t v1 = "thread container";
        break;
      case 2309:
        qos_class_t v1 = "task snapshot";
        break;
      case 2310:
        qos_class_t v1 = "thread snapshot";
        break;
      case 2311:
        qos_class_t v1 = "donating pids";
        break;
      case 2312:
        qos_class_t v1 = "shared cache load info";
        break;
      case 2313:
        qos_class_t v1 = "thread name";
        break;
      case 2314:
        qos_class_t v1 = "stack kernel 32-bit";
        break;
      case 2315:
        qos_class_t v1 = "stack kernel 64-bit";
        break;
      case 2316:
        qos_class_t v1 = "stack user 32-bit";
        break;
      case 2317:
        qos_class_t v1 = "stack user 64-bit";
        break;
      case 2318:
        qos_class_t v1 = "boot args";
        break;
      case 2319:
        qos_class_t v1 = "os version";
        break;
      case 2320:
        qos_class_t v1 = "kernel page size";
        break;
      case 2321:
        qos_class_t v1 = "jetsam level";
        break;
      case 2322:
        qos_class_t v1 = "delta timestamp used";
        break;
      case 2323:
        qos_class_t v1 = "stack kernel lr 32-bit";
        break;
      case 2324:
        qos_class_t v1 = "stack kernel lr 64-bit";
        break;
      case 2325:
        qos_class_t v1 = "stack user lr 32-bit";
        break;
      case 2326:
        qos_class_t v1 = "stack user lr 64-bit";
        break;
      case 2327:
        qos_class_t v1 = "nonrunnable thread";
        break;
      case 2328:
        qos_class_t v1 = "nonrunnable task";
        break;
      case 2329:
        qos_class_t v1 = "cpu times";
        break;
      case 2330:
        qos_class_t v1 = "stackshot duration";
        break;
      case 2331:
      case 2334:
      case 2335:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2359:
      case 2360:
      case 2361:
      case 2362:
      case 2363:
      case 2364:
      case 2365:
      case 2366:
      case 2367:
        goto LABEL_18;
      case 2332:
        qos_class_t v1 = "kernelcache_loadinfo";
        break;
      case 2333:
        qos_class_t v1 = "thread waitinfo";
        break;
      case 2336:
        qos_class_t v1 = "jetsam coalition snapshot";
        break;
      case 2337:
        qos_class_t v1 = "jetsam coalition";
        break;
      case 2338:
        qos_class_t v1 = "thread policy version";
        break;
      case 2339:
        qos_class_t v1 = "instruction cycles";
        break;
      case 2344:
        qos_class_t v1 = "dispatch queue label";
        break;
      case 2345:
        qos_class_t v1 = "thread turnstileinfo";
        break;
      case 2346:
        qos_class_t v1 = "architecture";
        break;
      case 2347:
        qos_class_t v1 = "latency info";
        break;
      case 2348:
        qos_class_t v1 = "latency info task";
        break;
      case 2349:
        qos_class_t v1 = "latency info thread";
        break;
      case 2350:
        qos_class_t v1 = "text exec load info";
        break;
      case 2351:
        qos_class_t v1 = "aot shared cache load info";
        break;
      case 2352:
        qos_class_t v1 = "task transitioning snapshot";
        break;
      case 2353:
        qos_class_t v1 = "task transitioning container";
        break;
      case 2354:
        qos_class_t v1 = "swift async start index";
        break;
      case 2355:
        qos_class_t v1 = "swift async stack";
        break;
      case 2356:
        qos_class_t v1 = "port label container";
        break;
      case 2357:
        qos_class_t v1 = "port label";
        break;
      case 2358:
        qos_class_t v1 = "port label name";
        break;
      case 2368:
        qos_class_t v1 = "task delta snapshot";
        break;
      case 2369:
        qos_class_t v1 = "thread delta snapshot";
        break;
      case 2370:
        qos_class_t v1 = "shared cache container";
        break;
      case 2371:
        qos_class_t v1 = "shared cache info";
        break;
      case 2372:
        qos_class_t v1 = "aot shared cache info";
        break;
      case 2373:
        qos_class_t v1 = "shared cache id";
        break;
      case 2374:
        qos_class_t v1 = "codesigning info";
        break;
      case 2375:
        qos_class_t v1 = "os build version";
        break;
      case 2376:
        qos_class_t v1 = "exclaves thread info";
        break;
      case 2377:
        qos_class_t v1 = "exclave container";
        break;
      case 2378:
        qos_class_t v1 = "exclaves scresult container";
        break;
      case 2379:
        qos_class_t v1 = "exclaves scresult info";
        break;
      case 2380:
        qos_class_t v1 = "exclaves ipc stack entry container";
        break;
      case 2381:
        qos_class_t v1 = "exclaves ipc stack entry info";
        break;
      case 2382:
        qos_class_t v1 = "exclaves ipc stack entry info ecstack";
        break;
      case 2383:
        qos_class_t v1 = "exclave address space container";
        break;
      case 2384:
        qos_class_t v1 = "exclave address space info";
        break;
      case 2385:
        qos_class_t v1 = "exclave address space name";
        break;
      case 2386:
        qos_class_t v1 = "exclaves text layout container";
        break;
      case 2387:
        qos_class_t v1 = "exclaves text layout info";
        break;
      case 2388:
        qos_class_t v1 = "exclaves text layout segments";
        break;
      default:
        if (a1 != 1503811591) {
          goto LABEL_18;
        }
        qos_class_t v1 = "Begin stackshot";
        break;
    }
  }
  return v1;
}

int *KCLogItem(uint64_t a1, unsigned int a2, uint64_t a3, const char *a4, uint64_t a5, int a6)
{
  BOOL v8 = a4;
  int v11 = a1;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    BOOL v8 = DescriptionForKCDataType(a1);
  }
  switch(v11)
  {
    case 2309:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %s [%d]%s\n");
      goto LABEL_83;
    case 2310:
      int v39 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: thread_v%d 0x%llx dispatch queue %lld%s\n", a5);
      goto LABEL_94;
    case 2311:
LABEL_25:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %d%s\n");
      goto LABEL_83;
    case 2312:
      if (a2 < 0x28) {
        goto LABEL_52;
      }
      if (qword_1EB698EE8 != -1) {
        dispatch_once(&qword_1EB698EE8, &__block_literal_global_1673);
      }
      if (byte_1EB698E82)
      {
LABEL_52:
        int v15 = *__error();
        v53 = (FILE *)*MEMORY[0x1E4F143D8];
        unsigned int v54 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
        int v55 = v54 & 3;
        int v56 = -v54;
        BOOL v20 = v56 < 0;
        int v57 = v56 & 3;
        if (v20) {
          int v58 = v55;
        }
        else {
          int v58 = -v57;
        }
        uuid_unparse((const unsigned __int8 *)(a3 + 8), &uuid_string_string[37 * v58]);
        fprintf(v53, "%*s%s: %s slide 0x%llx%s\n");
      }
      else
      {
        int v15 = *__error();
        v69 = (FILE *)*MEMORY[0x1E4F143D8];
        unsigned int v84 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
        int v85 = v84 & 3;
        int v86 = -v84;
        BOOL v20 = v86 < 0;
        int v87 = v86 & 3;
        if (v20) {
          int v88 = v85;
        }
        else {
          int v88 = -v87;
        }
        v89 = &uuid_string_string[37 * v88];
        uuid_unparse((const unsigned __int8 *)(a3 + 8), v89);
        v90 = " -- skipping";
        if (!a6) {
          v90 = "";
        }
        v94 = *(const char **)a3;
        v95 = v90;
        v92 = v89;
        v93 = *(char **)(a3 + 32);
        v91 = v8;
        v78 = "%*s%s: %s slid base address 0x%llx, slide 0x%llx%s\n";
LABEL_77:
        fprintf(v69, v78, a5, "", v91, v92, v93, v94, v95, v96, v97);
      }
      goto LABEL_90;
    case 2313:
    case 2318:
    case 2319:
    case 2344:
    case 2358:
    case 2375:
    case 2385:
LABEL_4:
      int v12 = *(unsigned __int8 *)(a3 + a2 - 1);
      int v13 = *__error();
      unint64_t v14 = (FILE *)*MEMORY[0x1E4F143D8];
      if (v12) {
        fprintf(v14, "%*s%s: (invalid string)%s\n");
      }
      else {
        fprintf(v14, "%*s%s: %s%s\n");
      }
      goto LABEL_83;
    case 2314:
    case 2316:
    case 2323:
    case 2325:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: 0x%x%s\n");
      goto LABEL_83;
    case 2315:
    case 2317:
    case 2324:
    case 2326:
    case 2327:
    case 2382:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: 0x%llx%s\n");
      goto LABEL_83;
    case 2320:
    case 2321:
    case 2338:
    case 2354:
    case 2373:
LABEL_12:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %u%s\n");
      goto LABEL_83;
    case 2322:
    case 2337:
LABEL_13:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %llu%s\n");
      goto LABEL_83;
    case 2328:
    case 2329:
    case 2330:
    case 2331:
    case 2334:
    case 2335:
    case 2340:
    case 2341:
    case 2342:
    case 2343:
    case 2347:
    case 2348:
    case 2349:
    case 2353:
    case 2355:
    case 2356:
    case 2359:
    case 2360:
    case 2361:
    case 2362:
    case 2363:
    case 2364:
    case 2365:
    case 2366:
    case 2367:
    case 2370:
    case 2377:
    case 2378:
    case 2380:
    case 2383:
    case 2386:
LABEL_26:
      int v36 = *__error();
      uint64_t v37 = " -- skipping";
      if (!a6) {
        uint64_t v37 = "";
      }
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %s\n", a5, "", v8, v37);
      uint64_t result = __error();
      *uint64_t result = v36;
      return result;
    case 2332:
      int v15 = *__error();
      v59 = (const unsigned __int8 *)(a3 + 8);
      v60 = (FILE *)*MEMORY[0x1E4F143D8];
      unsigned int v61 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
      int v62 = v61 & 3;
      int v63 = -v61;
      BOOL v20 = v63 < 0;
      int v64 = v63 & 3;
      if (v20) {
        int v65 = v62;
      }
      else {
        int v65 = -v64;
      }
      uuid_unparse(v59, &uuid_string_string[37 * v65]);
      fprintf(v60, "%*s%s: 0x%llx %s%s\n");
      goto LABEL_90;
    case 2333:
      int v39 = *__error();
      v66 = (FILE *)*MEMORY[0x1E4F143D8];
      if (a2 < 0x1F) {
        fprintf(v66, "%*s%s: type:0x%x owner:0x%llx waiter:0x%llx context:0x%llx%s\n", a5, "");
      }
      else {
        fprintf(v66, "%*s%s: type:0x%x owner:0x%llx waiter:0x%llx context:0x%llx portlabel_id:%d flags:0x%x%s\n", a5, "", v8);
      }
      goto LABEL_94;
    case 2336:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: id %llu, flags 0x%llx, thread_group %llu, leader uniquepid %llu%s\n", a5, "");
      goto LABEL_83;
    case 2339:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %llu instructions, %llu cycles%s\n");
      goto LABEL_83;
    case 2345:
      int v39 = *__error();
      v67 = (FILE *)*MEMORY[0x1E4F143D8];
      if (a2 < 0x1C) {
        fprintf(v67, "%*s%s: flags:0x%llx waiter:0x%llx context:0x%llx priority:%d hops:%d%s\n", a5, "");
      }
      else {
        fprintf(v67, "%*s%s: flags:0x%llx waiter:0x%llx context:0x%llx priority:%d hops:%d portlabel_id:%d%s\n", a5, "", v8);
      }
      goto LABEL_94;
    case 2346:
      int v39 = *__error();
      v68 = (FILE *)*MEMORY[0x1E4F143D8];
      CSArchitectureGetFamilyName();
      fprintf(v68, "%*s%s: %s (0x%x, 0x%x)%s\n", a5);
      goto LABEL_94;
    case 2350:
LABEL_16:
      int v15 = *__error();
      a3 += 8;
      uint64_t v24 = (FILE *)*MEMORY[0x1E4F143D8];
      unsigned int add_explicit = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed);
      goto LABEL_86;
    case 2351:
    case 2372:
      int v100 = *__error();
      v98 = (FILE *)*MEMORY[0x1E4F143D8];
      unsigned int v26 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
      int v27 = v26 & 3;
      int v28 = -v26;
      BOOL v20 = v28 < 0;
      int v29 = v28 & 3;
      if (v20) {
        int v30 = v27;
      }
      else {
        int v30 = -v29;
      }
      uuid_unparse((const unsigned __int8 *)(a3 + 32), &uuid_string_string[37 * v30]);
      unsigned int v31 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
      int v32 = v31 & 3;
      int v33 = -v31;
      BOOL v20 = v33 < 0;
      int v34 = v33 & 3;
      if (v20) {
        int v35 = v32;
      }
      else {
        int v35 = -v34;
      }
      uuid_unparse((const unsigned __int8 *)(a3 + 8), &uuid_string_string[37 * v35]);
      fprintf(v98, "%*s%s: 0x%llx %s -> 0x%llx %s%s\n", a5, "");
LABEL_45:
      uint64_t result = __error();
      *uint64_t result = v100;
      return result;
    case 2352:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %s [%d] (transitioning 0x%llx)%s\n", a5);
      goto LABEL_83;
    case 2357:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: id:%d flags:0x%x domain:%d%s\n", a5);
      goto LABEL_83;
    case 2368:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: [%llu]%s\n");
      goto LABEL_83;
    case 2369:
      int v39 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: thread_delta_v%d 0x%llx%s\n");
LABEL_94:
      uint64_t result = __error();
      *uint64_t result = v39;
      return result;
    case 2371:
      int v15 = *__error();
      v69 = (FILE *)*MEMORY[0x1E4F143D8];
      v70 = (char *)*(unsigned int *)(a3 + 40);
      unsigned int v71 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
      int v72 = v71 & 3;
      int v73 = -v71;
      BOOL v20 = v73 < 0;
      int v74 = v73 & 3;
      if (v20) {
        int v75 = v72;
      }
      else {
        int v75 = -v74;
      }
      v76 = &uuid_string_string[37 * v75];
      uuid_unparse((const unsigned __int8 *)(a3 + 8), v76);
      v77 = " -- skipping";
      if (!a6) {
        v77 = "";
      }
      uint64_t v96 = *(unsigned int *)(a3 + 44);
      v97 = v77;
      v94 = *(const char **)(a3 + 32);
      v95 = *(const char **)a3;
      v92 = v70;
      v93 = v76;
      v91 = v8;
      v78 = "%*s%s: id %d: %s slid base address 0x%llx, slide 0x%llx, flags 0x%x%s\n";
      goto LABEL_77;
    case 2374:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: flags 0x%llx, trust level %u%s\n");
      goto LABEL_83;
    case 2376:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: scid %llu, thread offset %u, flags 0x%x%s\n", a5);
      goto LABEL_83;
    case 2379:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: id %llu, flags 0x%llx%s\n");
      goto LABEL_83;
    case 2381:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: asid 0x%llx, tnid %llu, invocationid %llu, flags 0x%llx%s\n", a5, "");
      goto LABEL_83;
    case 2384:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: id 0x%llx, flags 0x%llx, layoutid %llu, slide 0x%llx, %s\n", a5, "");
      goto LABEL_83;
    case 2387:
      int v13 = *__error();
      fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: layoutid %llu, flags 0x%llx%s\n");
LABEL_83:
      uint64_t result = __error();
      *uint64_t result = v13;
      return result;
    case 2388:
      int v15 = *__error();
      uint64_t v24 = (FILE *)*MEMORY[0x1E4F143D8];
      unsigned int add_explicit = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed);
LABEL_86:
      unsigned int v79 = add_explicit + 1;
      int v80 = v79 & 3;
      int v81 = -v79;
      BOOL v20 = v81 < 0;
      int v82 = v81 & 3;
      if (v20) {
        int v83 = v80;
      }
      else {
        int v83 = -v82;
      }
      uuid_unparse((const unsigned __int8 *)a3, &uuid_string_string[37 * v83]);
      fprintf(v24, "%*s%s: %#18llx %s%s\n");
LABEL_90:
      uint64_t result = __error();
      *uint64_t result = v15;
      return result;
    default:
      switch(v11)
      {
        case '0':
          int v15 = *__error();
          unsigned int v16 = (const unsigned __int8 *)(a3 + 4);
          unint64_t v17 = (FILE *)*MEMORY[0x1E4F143D8];
          unsigned int v18 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
          int v19 = v18 & 3;
          int v21 = -v18;
          BOOL v20 = v21 < 0;
          int v22 = v21 & 3;
          if (v20) {
            int v23 = v19;
          }
          else {
            int v23 = -v22;
          }
          uuid_unparse(v16, &uuid_string_string[37 * v23]);
          fprintf(v17, "%*s%s: %#18x %s%s\n");
          goto LABEL_90;
        case '1':
          goto LABEL_16;
        case '2':
          int v13 = *__error();
          fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %d/%d%s\n");
          goto LABEL_83;
        case '3':
          goto LABEL_13;
        case '4':
          memset(&v102, 0, sizeof(v102));
          time_t v101 = *(void *)a3;
          localtime_r(&v101, &v102);
          if (!strftime(v103, 0x20uLL, "%Y-%m-%d %T", &v102)) {
            v103[0] = 0;
          }
          int v39 = *__error();
          fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %s.%03llu%s\n");
          goto LABEL_94;
        case '5':
          uint64_t v40 = *(const char **)a3;
          memset(&v102, 0, sizeof(v102));
          time_t v101 = (unint64_t)v40 / 0xF4240;
          localtime_r(&v101, &v102);
          if (!strftime(v103, 0x20uLL, "%Y-%m-%d %T", &v102)) {
            v103[0] = 0;
          }
          int v41 = *__error();
          int v42 = " -- skipping";
          if (!a6) {
            int v42 = "";
          }
          fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %s.%03llu%s\n", a5, "", v8, v103, (unint64_t)v40 % 0xF4240 / 0x3E8, v42);
          uint64_t result = __error();
          *uint64_t result = v41;
          return result;
        case '6':
        case '7':
        case '8':
          goto LABEL_26;
        case '9':
          int v100 = *__error();
          v99 = (FILE *)*MEMORY[0x1E4F143D8];
          unsigned int v43 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
          int v44 = v43 & 3;
          int v45 = -v43;
          BOOL v20 = v45 < 0;
          int v46 = v45 & 3;
          if (v20) {
            int v47 = v44;
          }
          else {
            int v47 = -v46;
          }
          uuid_unparse((const unsigned __int8 *)(a3 + 24), &uuid_string_string[37 * v47]);
          unsigned int v48 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
          int v49 = v48 & 3;
          int v50 = -v48;
          BOOL v20 = v50 < 0;
          int v51 = v50 & 3;
          if (v20) {
            int v52 = v49;
          }
          else {
            int v52 = -v51;
          }
          uuid_unparse((const unsigned __int8 *)(a3 + 40), &uuid_string_string[37 * v52]);
          fprintf(v99, "%*s%s: %#18llx - %#18llx -> %#18llx %s-%s%s\n", a5, "", v8);
          goto LABEL_45;
        default:
          switch(v11)
          {
            case 1:
              goto LABEL_4;
            case 2:
              goto LABEL_12;
            case 3:
              goto LABEL_13;
            case 4:
              goto LABEL_25;
            case 5:
              int v13 = *__error();
              fprintf((FILE *)*MEMORY[0x1E4F143D8], "%*s%s: %lld%s\n");
              goto LABEL_83;
            default:
              goto LABEL_26;
          }
      }
  }
}

int *__KCLogIter_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KCLogItem(*(unsigned int *)(a1 + 32), *(_DWORD *)(a1 + 36), a3, 0, (dword_1EB698E84 + 2), *(unsigned __int8 *)(a1 + 40));
}

void sub_1BF271F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF271FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF2720C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF2721B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF272304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF2723E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF2724B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF272668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF272774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF27282C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF2728CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF2729A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF272B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF272FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF274F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,void *a45,uint64_t a46,void *a47,void *a48,void *a49,uint64_t a50,uint64_t a51,uint64_t a52,_Unwind_Exception *exception_object,void *a54,void *a55,uint64_t a56,char a57)
{
  _Unwind_Resume(a1);
}

uint64_t *StringForKPDecodeContentBits(uint64_t *result)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *result;
  if (!*result)
  {
    strcpy((char *)&qword_1EB698F30, "empty");
    return result;
  }
  id v2 = result;
  if (v1)
  {
    strcpy((char *)&qword_1EB698F30, "timestamp");
    uint64_t v1 = *result;
    if ((*result & 2) == 0)
    {
      uint64_t v3 = (char *)&word_1EB698F38 + 1;
      if ((v1 & 4) == 0) {
        goto LABEL_47;
      }
LABEL_43:
      if (v3 == (char *)&qword_1EB698F30) {
        uint64_t v3 = (char *)&qword_1EB698F30;
      }
      else {
        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
      }
      goto LABEL_46;
    }
    uint64_t v3 = (char *)&word_1EB698F38
       + snprintf((char *)&word_1EB698F38 + 1, _MergedGlobals_4 - ((char *)&word_1EB698F38 + 1) + 536, ", ")
       + 1;
LABEL_42:
    uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "cpuno");
    v3 += (int)result;
    uint64_t v1 = *v2;
    if ((*v2 & 4) == 0)
    {
LABEL_47:
      if ((v1 & 8) == 0)
      {
        if ((v1 & 0x10) != 0) {
          goto LABEL_83;
        }
        goto LABEL_49;
      }
      if (v3 == (char *)&qword_1EB698F30) {
        uint64_t v3 = (char *)&qword_1EB698F30;
      }
      else {
        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
      }
LABEL_82:
      uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "threadname");
      v3 += (int)result;
      uint64_t v1 = *v2;
      if ((*v2 & 0x10) != 0)
      {
LABEL_83:
        if (v3 == (char *)&qword_1EB698F30) {
          uint64_t v3 = (char *)&qword_1EB698F30;
        }
        else {
          v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
        }
LABEL_86:
        uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "kevent");
        v3 += (int)result;
        uint64_t v1 = *v2;
        if ((*v2 & 0x20) != 0)
        {
LABEL_87:
          if (v3 == (char *)&qword_1EB698F30) {
            uint64_t v3 = (char *)&qword_1EB698F30;
          }
          else {
            v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
          }
LABEL_90:
          uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "threadinfo");
          v3 += (int)result;
          uint64_t v1 = *v2;
          if ((*v2 & 0x40) != 0)
          {
LABEL_91:
            if (v3 == (char *)&qword_1EB698F30) {
              uint64_t v3 = (char *)&qword_1EB698F30;
            }
            else {
              v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
            }
LABEL_94:
            uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "kstack");
            v3 += (int)result;
            uint64_t v1 = *v2;
            if ((*v2 & 0x80) != 0)
            {
LABEL_95:
              if (v3 == (char *)&qword_1EB698F30) {
                uint64_t v3 = (char *)&qword_1EB698F30;
              }
              else {
                v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
              }
LABEL_98:
              uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "ustack");
              v3 += (int)result;
              uint64_t v1 = *v2;
              if ((*v2 & 0x200000000) != 0)
              {
LABEL_99:
                if (v3 == (char *)&qword_1EB698F30) {
                  uint64_t v3 = (char *)&qword_1EB698F30;
                }
                else {
                  v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                }
LABEL_102:
                uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "exstack");
                v3 += (int)result;
                uint64_t v1 = *v2;
                if ((*v2 & 0x100) != 0)
                {
LABEL_103:
                  if (v3 == (char *)&qword_1EB698F30) {
                    uint64_t v3 = (char *)&qword_1EB698F30;
                  }
                  else {
                    v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                  }
LABEL_106:
                  uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "trigger");
                  v3 += (int)result;
                  uint64_t v1 = *v2;
                  if ((*v2 & 0x200) != 0)
                  {
LABEL_107:
                    if (v3 == (char *)&qword_1EB698F30) {
                      uint64_t v3 = (char *)&qword_1EB698F30;
                    }
                    else {
                      v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                    }
LABEL_110:
                    uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "pmc_thread");
                    v3 += (int)result;
                    uint64_t v1 = *v2;
                    if ((*v2 & 0x400) != 0)
                    {
LABEL_111:
                      if (v3 == (char *)&qword_1EB698F30) {
                        uint64_t v3 = (char *)&qword_1EB698F30;
                      }
                      else {
                        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                      }
LABEL_114:
                      uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "pmc_cpu");
                      v3 += (int)result;
                      uint64_t v1 = *v2;
                      if ((*v2 & 0x800) != 0)
                      {
LABEL_115:
                        if (v3 == (char *)&qword_1EB698F30) {
                          uint64_t v3 = (char *)&qword_1EB698F30;
                        }
                        else {
                          v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                        }
LABEL_118:
                        uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "pmc_config");
                        v3 += (int)result;
                        uint64_t v1 = *v2;
                        if ((*v2 & 0x1000) != 0)
                        {
LABEL_119:
                          if (v3 == (char *)&qword_1EB698F30) {
                            uint64_t v3 = (char *)&qword_1EB698F30;
                          }
                          else {
                            v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                          }
LABEL_122:
                          uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "meminfo");
                          v3 += (int)result;
                          uint64_t v1 = *v2;
                          if ((*v2 & 0x2000) != 0)
                          {
LABEL_123:
                            if (v3 == (char *)&qword_1EB698F30) {
                              uint64_t v3 = (char *)&qword_1EB698F30;
                            }
                            else {
                              v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                            }
LABEL_126:
                            uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "sample");
                            v3 += (int)result;
                            uint64_t v1 = *v2;
                            if ((*v2 & 0x4000) != 0)
                            {
LABEL_127:
                              if (v3 == (char *)&qword_1EB698F30) {
                                uint64_t v3 = (char *)&qword_1EB698F30;
                              }
                              else {
                                v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                              }
LABEL_130:
                              uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "cswitch");
                              v3 += (int)result;
                              uint64_t v1 = *v2;
                              if ((*v2 & 0x8000) != 0)
                              {
LABEL_131:
                                if (v3 == (char *)&qword_1EB698F30) {
                                  uint64_t v3 = (char *)&qword_1EB698F30;
                                }
                                else {
                                  v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                }
LABEL_134:
                                uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "config_ws");
                                v3 += (int)result;
                                uint64_t v1 = *v2;
                                if ((*v2 & 0x10000) != 0)
                                {
LABEL_135:
                                  if (v3 == (char *)&qword_1EB698F30) {
                                    uint64_t v3 = (char *)&qword_1EB698F30;
                                  }
                                  else {
                                    v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                  }
LABEL_138:
                                  uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "lost_evts");
                                  v3 += (int)result;
                                  uint64_t v1 = *v2;
                                  if ((*v2 & 0x20000) != 0)
                                  {
LABEL_139:
                                    if (v3 == (char *)&qword_1EB698F30) {
                                      uint64_t v3 = (char *)&qword_1EB698F30;
                                    }
                                    else {
                                      v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                    }
LABEL_142:
                                    uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "straggler");
                                    v3 += (int)result;
                                    uint64_t v1 = *v2;
                                    if ((*v2 & 0x40000) != 0)
                                    {
LABEL_143:
                                      if (v3 == (char *)&qword_1EB698F30) {
                                        uint64_t v3 = (char *)&qword_1EB698F30;
                                      }
                                      else {
                                        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                      }
LABEL_146:
                                      uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "signpost");
                                      v3 += (int)result;
                                      uint64_t v1 = *v2;
                                      if ((*v2 & 0x80000) != 0)
                                      {
LABEL_147:
                                        if (v3 == (char *)&qword_1EB698F30) {
                                          uint64_t v3 = (char *)&qword_1EB698F30;
                                        }
                                        else {
                                          v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                        }
LABEL_150:
                                        uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "id_string");
                                        v3 += (int)result;
                                        uint64_t v1 = *v2;
                                        if ((*v2 & 0x100000) != 0)
                                        {
LABEL_151:
                                          if (v3 == (char *)&qword_1EB698F30) {
                                            uint64_t v3 = (char *)&qword_1EB698F30;
                                          }
                                          else {
                                            v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                          }
LABEL_154:
                                          uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "tinfo_sched");
                                          v3 += (int)result;
                                          uint64_t v1 = *v2;
                                          if ((*v2 & 0x200000) != 0)
                                          {
LABEL_155:
                                            if (v3 == (char *)&qword_1EB698F30) {
                                              uint64_t v3 = (char *)&qword_1EB698F30;
                                            }
                                            else {
                                              v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                            }
LABEL_158:
                                            uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "task_snapshot");
                                            v3 += (int)result;
                                            uint64_t v1 = *v2;
                                            if ((*v2 & 0x400000) != 0)
                                            {
LABEL_159:
                                              if (v3 == (char *)&qword_1EB698F30) {
                                                uint64_t v3 = (char *)&qword_1EB698F30;
                                              }
                                              else {
                                                v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                              }
LABEL_162:
                                              uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "thread_snapshot");
                                              v3 += (int)result;
                                              uint64_t v1 = *v2;
                                              if ((*v2 & 0x1000000) != 0)
                                              {
LABEL_163:
                                                if (v3 == (char *)&qword_1EB698F30) {
                                                  uint64_t v3 = (char *)&qword_1EB698F30;
                                                }
                                                else {
                                                  v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                }
LABEL_166:
                                                uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "timer_fire");
                                                v3 += (int)result;
                                                uint64_t v1 = *v2;
                                                if ((*v2 & 0x2000000) != 0)
                                                {
LABEL_167:
                                                  if (v3 == (char *)&qword_1EB698F30) {
                                                    uint64_t v3 = (char *)&qword_1EB698F30;
                                                  }
                                                  else {
                                                    v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                  }
LABEL_170:
                                                  uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "system_memory");
                                                  v3 += (int)result;
                                                  uint64_t v1 = *v2;
                                                  if ((*v2 & 0x4000000) != 0)
                                                  {
LABEL_171:
                                                    if (v3 == (char *)&qword_1EB698F30) {
                                                      uint64_t v3 = (char *)&qword_1EB698F30;
                                                    }
                                                    else {
                                                      v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                    }
LABEL_174:
                                                    uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "thread_inscyc");
                                                    v3 += (int)result;
                                                    uint64_t v1 = *v2;
                                                    if ((*v2 & 0x8000000) != 0)
                                                    {
LABEL_175:
                                                      if (v3 == (char *)&qword_1EB698F30) {
                                                        uint64_t v3 = (char *)&qword_1EB698F30;
                                                      }
                                                      else {
                                                        v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                      }
LABEL_178:
                                                      uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "tinfo_sched_v2");
                                                      v3 += (int)result;
                                                      uint64_t v1 = *v2;
                                                      if ((*v2 & 0x10000000) != 0)
                                                      {
LABEL_179:
                                                        if (v3 == (char *)&qword_1EB698F30) {
                                                          uint64_t v3 = (char *)&qword_1EB698F30;
                                                        }
                                                        else {
                                                          v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                        }
LABEL_182:
                                                        uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "thread_dispatch_label");
                                                        v3 += (int)result;
                                                        uint64_t v1 = *v2;
                                                        if ((*v2 & 0x20000000) != 0)
                                                        {
LABEL_183:
                                                          if (v3 == (char *)&qword_1EB698F30) {
                                                            uint64_t v3 = (char *)&qword_1EB698F30;
                                                          }
                                                          else {
                                                            v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                          }
LABEL_186:
                                                          uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "specific_thread_name");
                                                          v3 += (int)result;
                                                          uint64_t v1 = *v2;
                                                          if ((*v2 & 0x40000000) != 0)
                                                          {
LABEL_187:
                                                            if (v3 == (char *)&qword_1EB698F30) {
                                                              uint64_t v3 = (char *)&qword_1EB698F30;
                                                            }
                                                            else {
                                                              v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                            }
LABEL_190:
                                                            uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "pmi");
                                                            v3 += (int)result;
                                                            uint64_t v1 = *v2;
                                                            if ((*v2 & 0x80000000) != 0)
                                                            {
LABEL_191:
                                                              if (v3 == (char *)&qword_1EB698F30) {
                                                                uint64_t v3 = (char *)&qword_1EB698F30;
                                                              }
                                                              else {
                                                                v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
                                                              }
                                                              goto LABEL_194;
                                                            }
LABEL_76:
                                                            if ((v1 & 0x100000000) != 0) {
                                                              goto LABEL_195;
                                                            }
                                                            goto LABEL_77;
                                                          }
LABEL_75:
                                                          if ((v1 & 0x80000000) != 0) {
                                                            goto LABEL_191;
                                                          }
                                                          goto LABEL_76;
                                                        }
LABEL_74:
                                                        if ((v1 & 0x40000000) != 0) {
                                                          goto LABEL_187;
                                                        }
                                                        goto LABEL_75;
                                                      }
LABEL_73:
                                                      if ((v1 & 0x20000000) != 0) {
                                                        goto LABEL_183;
                                                      }
                                                      goto LABEL_74;
                                                    }
LABEL_72:
                                                    if ((v1 & 0x10000000) != 0) {
                                                      goto LABEL_179;
                                                    }
                                                    goto LABEL_73;
                                                  }
LABEL_71:
                                                  if ((v1 & 0x8000000) != 0) {
                                                    goto LABEL_175;
                                                  }
                                                  goto LABEL_72;
                                                }
LABEL_70:
                                                if ((v1 & 0x4000000) != 0) {
                                                  goto LABEL_171;
                                                }
                                                goto LABEL_71;
                                              }
LABEL_69:
                                              if ((v1 & 0x2000000) != 0) {
                                                goto LABEL_167;
                                              }
                                              goto LABEL_70;
                                            }
LABEL_68:
                                            if ((v1 & 0x1000000) != 0) {
                                              goto LABEL_163;
                                            }
                                            goto LABEL_69;
                                          }
LABEL_67:
                                          if ((v1 & 0x400000) != 0) {
                                            goto LABEL_159;
                                          }
                                          goto LABEL_68;
                                        }
LABEL_66:
                                        if ((v1 & 0x200000) != 0) {
                                          goto LABEL_155;
                                        }
                                        goto LABEL_67;
                                      }
LABEL_65:
                                      if ((v1 & 0x100000) != 0) {
                                        goto LABEL_151;
                                      }
                                      goto LABEL_66;
                                    }
LABEL_64:
                                    if ((v1 & 0x80000) != 0) {
                                      goto LABEL_147;
                                    }
                                    goto LABEL_65;
                                  }
LABEL_63:
                                  if ((v1 & 0x40000) != 0) {
                                    goto LABEL_143;
                                  }
                                  goto LABEL_64;
                                }
LABEL_62:
                                if ((v1 & 0x20000) != 0) {
                                  goto LABEL_139;
                                }
                                goto LABEL_63;
                              }
LABEL_61:
                              if ((v1 & 0x10000) != 0) {
                                goto LABEL_135;
                              }
                              goto LABEL_62;
                            }
LABEL_60:
                            if ((v1 & 0x8000) != 0) {
                              goto LABEL_131;
                            }
                            goto LABEL_61;
                          }
LABEL_59:
                          if ((v1 & 0x4000) != 0) {
                            goto LABEL_127;
                          }
                          goto LABEL_60;
                        }
LABEL_58:
                        if ((v1 & 0x2000) != 0) {
                          goto LABEL_123;
                        }
                        goto LABEL_59;
                      }
LABEL_57:
                      if ((v1 & 0x1000) != 0) {
                        goto LABEL_119;
                      }
                      goto LABEL_58;
                    }
LABEL_56:
                    if ((v1 & 0x800) != 0) {
                      goto LABEL_115;
                    }
                    goto LABEL_57;
                  }
LABEL_55:
                  if ((v1 & 0x400) != 0) {
                    goto LABEL_111;
                  }
                  goto LABEL_56;
                }
LABEL_54:
                if ((v1 & 0x200) != 0) {
                  goto LABEL_107;
                }
                goto LABEL_55;
              }
LABEL_53:
              if ((v1 & 0x100) != 0) {
                goto LABEL_103;
              }
              goto LABEL_54;
            }
LABEL_52:
            if ((v1 & 0x200000000) != 0) {
              goto LABEL_99;
            }
            goto LABEL_53;
          }
LABEL_51:
          if ((v1 & 0x80) != 0) {
            goto LABEL_95;
          }
          goto LABEL_52;
        }
LABEL_50:
        if ((v1 & 0x40) != 0) {
          goto LABEL_91;
        }
        goto LABEL_51;
      }
LABEL_49:
      if ((v1 & 0x20) != 0) {
        goto LABEL_87;
      }
      goto LABEL_50;
    }
    goto LABEL_43;
  }
  uint64_t v3 = (char *)&qword_1EB698F30;
  if ((v1 & 2) != 0) {
    goto LABEL_42;
  }
  if ((v1 & 4) != 0)
  {
LABEL_46:
    uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "tid");
    v3 += (int)result;
    uint64_t v1 = *v2;
    goto LABEL_47;
  }
  if ((v1 & 8) != 0) {
    goto LABEL_82;
  }
  if ((v1 & 0x10) != 0) {
    goto LABEL_86;
  }
  if ((v1 & 0x20) != 0) {
    goto LABEL_90;
  }
  if ((v1 & 0x40) != 0) {
    goto LABEL_94;
  }
  if ((v1 & 0x80) != 0) {
    goto LABEL_98;
  }
  if ((v1 & 0x200000000) != 0) {
    goto LABEL_102;
  }
  if ((v1 & 0x100) != 0) {
    goto LABEL_106;
  }
  if ((v1 & 0x200) != 0) {
    goto LABEL_110;
  }
  if ((v1 & 0x400) != 0) {
    goto LABEL_114;
  }
  if ((v1 & 0x800) != 0) {
    goto LABEL_118;
  }
  if ((v1 & 0x1000) != 0) {
    goto LABEL_122;
  }
  if ((v1 & 0x2000) != 0) {
    goto LABEL_126;
  }
  if ((v1 & 0x4000) != 0) {
    goto LABEL_130;
  }
  if ((v1 & 0x8000) != 0) {
    goto LABEL_134;
  }
  if ((v1 & 0x10000) != 0) {
    goto LABEL_138;
  }
  if ((v1 & 0x20000) != 0) {
    goto LABEL_142;
  }
  if ((v1 & 0x40000) != 0) {
    goto LABEL_146;
  }
  if ((v1 & 0x80000) != 0) {
    goto LABEL_150;
  }
  if ((v1 & 0x100000) != 0) {
    goto LABEL_154;
  }
  if ((v1 & 0x200000) != 0) {
    goto LABEL_158;
  }
  if ((v1 & 0x400000) != 0) {
    goto LABEL_162;
  }
  if ((v1 & 0x1000000) != 0) {
    goto LABEL_166;
  }
  if ((v1 & 0x2000000) != 0) {
    goto LABEL_170;
  }
  if ((v1 & 0x4000000) != 0) {
    goto LABEL_174;
  }
  if ((v1 & 0x8000000) != 0) {
    goto LABEL_178;
  }
  if ((v1 & 0x10000000) != 0) {
    goto LABEL_182;
  }
  if ((v1 & 0x20000000) != 0) {
    goto LABEL_186;
  }
  if ((v1 & 0x40000000) != 0) {
    goto LABEL_190;
  }
  if ((v1 & 0x80000000) == 0)
  {
    if ((v1 & 0x100000000) == 0)
    {
      if ((v1 & 0x8000000000000000) == 0) {
        goto LABEL_203;
      }
      goto LABEL_202;
    }
    goto LABEL_198;
  }
LABEL_194:
  uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "system_memory_status");
  v3 += (int)result;
  uint64_t v1 = *v2;
  if ((*v2 & 0x100000000) != 0)
  {
LABEL_195:
    if (v3 == (char *)&qword_1EB698F30) {
      uint64_t v3 = (char *)&qword_1EB698F30;
    }
    else {
      v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
    }
LABEL_198:
    uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "async_stack");
    v3 += (int)result;
    uint64_t v1 = *v2;
    if ((*v2 & 0x8000000000000000) == 0) {
      goto LABEL_203;
    }
    goto LABEL_199;
  }
LABEL_77:
  if ((v1 & 0x8000000000000000) == 0) {
    goto LABEL_203;
  }
LABEL_199:
  if (v3 == (char *)&qword_1EB698F30) {
    uint64_t v3 = (char *)&qword_1EB698F30;
  }
  else {
    v3 += snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ");
  }
LABEL_202:
  uint64_t result = (uint64_t *)snprintf(v3, _MergedGlobals_4 - v3 + 536, "malformed");
  v3 += (int)result;
  uint64_t v1 = *v2;
LABEL_203:
  unint64_t v4 = v1 & 0x7FFFFFFC00000000;
  uint64_t v17 = v1 & 0x7FFFFFFC00000000;
  if ((v1 & 0x7FFFFFFC00000000) != 0)
  {
    do
    {
      unint64_t v5 = __clz(__rbit64(v4));
      int v6 = buf[(v5 >> 3) - 8];
      int v7 = 1 << (v5 & 7);
      if ((v7 & v6) == 0)
      {
        int v9 = *__error();
        unsigned int v10 = _sa_logt();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          int v19 = v5;
          __int16 v20 = 2048;
          unint64_t v21 = v4;
          _os_log_error_impl(&dword_1BF22B000, v10, OS_LOG_TYPE_ERROR, "bitNum %d unset, but contents 0x%llx", buf, 0x12u);
        }

        *__error() = v9;
        _SASetCrashLogMessage(567, "bitNum %d unset, but contents 0x%llx", v11, v12, v13, v14, v15, v16, v5);
        _os_crash();
        __break(1u);
      }
      buf[(v5 >> 3) - 8] = v6 & ~(_BYTE)v7;
      if (v3 == (char *)&qword_1EB698F30) {
        BOOL v8 = (char *)&qword_1EB698F30;
      }
      else {
        BOOL v8 = &v3[snprintf(v3, _MergedGlobals_4 - v3 + 536, ", ")];
      }
      uint64_t result = (uint64_t *)snprintf(v8, _MergedGlobals_4 - v8 + 536, "UNKNOWN(%d)", v5);
      uint64_t v3 = &v8[(int)result];
      unint64_t v4 = v17;
    }
    while (v17);
  }
  return result;
}

void sub_1BF27695C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1BF277980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38,void *a39,void *a40,void *a41,void *a42,void *a43,void *a44,void *a45)
{
  _Unwind_Resume(a1);
}

id KTraceStringFromArguments(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int is_kernel_64_bit = ktrace_is_kernel_64_bit();
  uint64_t v6 = 5 - a3;
  if (is_kernel_64_bit)
  {
    uint64_t v7 = 8 * v6;
    BOOL v8 = (_DWORD *)(a2 + 24);
    if (a3 == 1) {
      BOOL v8 = (_DWORD *)(a2 + 8);
    }
    if (a3 == 2) {
      int v9 = (_DWORD *)(a2 + 16);
    }
    else {
      int v9 = v8;
    }
    unsigned int v10 = 0;
    goto LABEL_13;
  }
  uint64_t v7 = 4 * v6;
  uint64_t v11 = malloc_type_calloc(4 * v6, 1uLL, 0xB0F01E6AuLL);
  int v9 = v11;
  if (a3 <= 1)
  {
    *uint64_t v11 = *(void *)(a2 + 8);
    uint64_t v12 = (int32x2_t *)(v11 + 1);
LABEL_11:
    v12->i32[0] = *(void *)(a2 + 16);
    uint64_t v12 = (int32x2_t *)((char *)v12 + 4);
    goto LABEL_12;
  }
  uint64_t v12 = (int32x2_t *)v11;
  if (a3 == 2) {
    goto LABEL_11;
  }
LABEL_12:
  *uint64_t v12 = vmovn_s64(*(int64x2_t *)(a2 + 24));
  unsigned int v10 = v11;
LABEL_13:
  uint64_t v13 = 0;
  while (*((unsigned char *)v9 + v13))
  {
    if (v7 == ++v13)
    {
      uint64_t v13 = v7;
      break;
    }
  }
  if (v13)
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithBytes:v9 length:v13 encoding:4];
    if (!v10) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v14 = 0;
  if (v10) {
LABEL_19:
  }
    free(v10);
LABEL_20:
  return v14;
}

void sub_1BF278180(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF2785E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF278F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,void *a44,void *a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,void *a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,void *a60,uint64_t a61,void *a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v71 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1BF27904C()
{
}

void sub_1BF279054()
{
}

void sub_1BF27905C()
{
}

void sub_1BF279064()
{
}

void sub_1BF27906C()
{
}

void sub_1BF279074()
{
}

void sub_1BF2790C0()
{
}

void sub_1BF2793EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF2794F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF2799CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF279D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF279F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF27A468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF27A868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, id a17)
{
  _Unwind_Resume(a1);
}

void sub_1BF27ABCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF27ADB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF27B7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF27B9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF27BC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF27D524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,uint64_t a42,void *a43)
{
  _Unwind_Resume(a1);
}

void sub_1BF28146C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  _Unwind_Resume(a1);
}

void sub_1BF281B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF283288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,void *a56)
{
  _Block_object_dispose(&STACK[0x520], 8);
  _Block_object_dispose((const void *)(v58 - 256), 8);

  _Block_object_dispose(&STACK[0x410], 8);
  _Block_object_dispose(&STACK[0x440], 8);
  _Block_object_dispose(&STACK[0x460], 8);
  _Block_object_dispose(&STACK[0x480], 8);
  _Block_object_dispose(&STACK[0x4A0], 8);
  _Block_object_dispose(&STACK[0x4C0], 8);

  _Block_object_dispose(&STACK[0x4F0], 8);
  _Unwind_Resume(a1);
}

void sub_1BF283660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF2838DC(_Unwind_Exception *a1)
{
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

void sub_1BF283A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id DictForChunkViaNSPropertyList()
{
  uint64_t v0 = ktrace_chunk_size();
  uint64_t v1 = ktrace_chunk_map_data();
  if (!v1) {
    goto LABEL_5;
  }
  id v2 = (void *)MEMORY[0x1E4F28F98];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v1 length:v0 freeWhenDone:0];
  unint64_t v4 = [v2 propertyListWithData:v3 options:0 format:0 error:0];

  ktrace_chunk_unmap_data();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_5:
      unint64_t v4 = 0;
    }
  }
  return v4;
}

void sub_1BF283AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF284370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF2851C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,uint64_t a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_1BF285494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF285B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF285C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF285DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF285E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id DictForChunkViaNSUnarchiver()
{
  uint64_t v0 = ktrace_chunk_size();
  uint64_t v1 = ktrace_chunk_map_data();
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v13 = (void *)MEMORY[0x1E4F28DC0];
    id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    BOOL v8 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
    int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v2 length:v0 freeWhenDone:0];
    id v14 = 0;
    unsigned int v10 = [v13 unarchivedObjectOfClasses:v8 fromData:v9 error:&v14];
    id v11 = v14;

    ktrace_chunk_unmap_data();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        unsigned int v10 = 0;
      }
    }
  }
  else
  {
    unsigned int v10 = 0;
  }
  return v10;
}

void sub_1BF286058(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF286B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF286F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF287238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF28737C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF2874AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1BF28758C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF287BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF287F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF288330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF288674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF288FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, _Unwind_Exception *exception_object, void *a15, void *a16, void *a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF28A164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF28A88C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF28A9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF28AB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF28AC44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t flatbuffers::Verifier::VerifyOffset(flatbuffers::Verifier *this, unint64_t a2)
{
  if ((a2 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v2 = *((void *)this + 1);
  if (v2 < 5 || v2 - 4 < a2) {
    return 0;
  }
  uint64_t v4 = *(unsigned int *)(*(void *)this + a2);
  if ((int)v4 < 1) {
    return 0;
  }
  if (v2 - 1 >= v4 + a2) {
    return v4;
  }
  return 0;
}

BOOL flatbuffers::Table::VerifyOffset(flatbuffers::Table *this, const flatbuffers::Verifier *a2, unsigned int a3)
{
  id v3 = (unsigned __int16 *)((char *)this - *(int *)this);
  return *v3 <= a3
      || (uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3)) == 0
      || flatbuffers::Verifier::VerifyOffset(a2, (unint64_t)this + v4 - *(void *)a2) != 0;
}

BOOL flatbuffers::Verifier::VerifyTableStart(flatbuffers::Verifier *this, const unsigned __int8 *a2)
{
  uint64_t v2 = *(void *)this;
  unint64_t v3 = (unint64_t)&a2[-*(void *)this];
  if ((v3 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v4 = *((void *)this + 1);
  BOOL v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *(int *)a2;
  unsigned int v7 = *((_DWORD *)this + 5);
  unsigned int v8 = *((_DWORD *)this + 4) + 1;
  *((_DWORD *)this + 4) = v8;
  unsigned int v9 = *((_DWORD *)this + 6) + 1;
  *((_DWORD *)this + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)this + 7)) {
    return 0;
  }
  unint64_t v10 = v3 - v6;
  if (v10)
  {
    uint64_t v11 = 0;
    if (*((unsigned char *)this + 40) || v4 - 2 < v10) {
      return v11;
    }
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  unint64_t v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  BOOL v5 = v4 >= v12;
  unint64_t v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL flatbuffers::Verifier::VerifyVectorOrString(flatbuffers::Verifier *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4)
{
  unint64_t v4 = (unint64_t)&a2[-*(void *)this];
  if ((v4 & 3) != 0 && *((unsigned char *)this + 40)) {
    return 0;
  }
  unint64_t v5 = *((void *)this + 1);
  if (v5 < 5 || v5 - 4 < v4) {
    return 0;
  }
  unint64_t v7 = *(unsigned int *)a2;
  if (0x7FFFFFFF / a3 <= v7) {
    return 0;
  }
  unint64_t v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    unint64_t v5 = *((void *)this + 1);
  }
  BOOL v9 = v5 > v8;
  unint64_t v10 = v5 - v8;
  return v9 && v10 >= v4;
}

BOOL flatbuffers::Verifier::VerifyString(flatbuffers::Verifier *a1, const unsigned __int8 *a2)
{
  if (!a2) {
    return 1;
  }
  unint64_t v6 = 0;
  BOOL result = flatbuffers::Verifier::VerifyVectorOrString(a1, a2, 1uLL, &v6);
  if (result)
  {
    unint64_t v4 = *((void *)a1 + 1);
    return v4 >= 2 && v4 - 1 >= v6 && *(unsigned char *)(*(void *)a1 + v6) == 0;
  }
  return result;
}

BOOL FlatbufferSymbols::MachoMetadata::Verify(FlatbufferSymbols::MachoMetadata *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || (!v11[4]
               || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 9)
               && v13 - 8 >= (unint64_t)this + v11[4] - *(void *)a2)
              && (v12 < 0xB
               || !v11[5]
               || (BOOL result = 0, v14 = *((void *)a2 + 1), v14 >= 9)
               && v14 - 8 >= (unint64_t)this + v11[5] - *(void *)a2))
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
              if (result
                && (v12 < 0xD
                 || !v11[6]
                 || (BOOL result = FlatbufferSymbols::CPUArchitecture::Verify((FlatbufferSymbols::MachoMetadata *)((char *)this+ v11[6]+ *(unsigned int *)((char *)this + v11[6])), a2))))
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                if (result)
                {
                  uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v15 >= 0xFu && (uint64_t v16 = v15[7]) != 0) {
                    uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                  }
                  else {
                    uint64_t v17 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                    if (result)
                    {
                      unsigned int v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v18 >= 0x11u && (uint64_t v19 = v18[8]) != 0) {
                        __int16 v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
                      }
                      else {
                        __int16 v20 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v20);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                        if (result)
                        {
                          unint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v21 >= 0x13u && (uint64_t v22 = v21[9]) != 0) {
                            int v23 = (const unsigned __int8 *)this + v22 + *(unsigned int *)((char *)this + v22);
                          }
                          else {
                            int v23 = 0;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v23);
                          if (result)
                          {
                            BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x14u);
                            if (result)
                            {
                              uint64_t v24 = (unsigned __int16 *)((char *)this - *(int *)this);
                              if (*v24 >= 0x15u && (uint64_t v25 = v24[10]) != 0) {
                                unsigned int v26 = (const unsigned __int8 *)this + v25 + *(unsigned int *)((char *)this + v25);
                              }
                              else {
                                unsigned int v26 = 0;
                              }
                              BOOL result = flatbuffers::Verifier::VerifyString(a2, v26);
                              if (result)
                              {
                                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x16u);
                                if (result)
                                {
                                  int v27 = (unsigned __int16 *)((char *)this - *(int *)this);
                                  if (*v27 >= 0x17u && (uint64_t v28 = v27[11]) != 0) {
                                    int v29 = (const unsigned __int8 *)this + v28 + *(unsigned int *)((char *)this + v28);
                                  }
                                  else {
                                    int v29 = 0;
                                  }
                                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v29);
                                  if (result)
                                  {
                                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x18u);
                                    if (result)
                                    {
                                      int v30 = (unsigned __int16 *)((char *)this - *(int *)this);
                                      if (*v30 >= 0x19u && (uint64_t v31 = v30[12]) != 0) {
                                        int v32 = (const unsigned __int8 *)this
                                      }
                                            + v31
                                            + *(unsigned int *)((char *)this + v31);
                                      else {
                                        int v32 = 0;
                                      }
                                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v32);
                                      if (result)
                                      {
                                        --*((_DWORD *)a2 + 4);
                                        return 1;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL FlatbufferSymbols::CPUArchitecture::Verify(FlatbufferSymbols::CPUArchitecture *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (BOOL result = 0, v7 = *((void *)a2 + 1), v7 >= 5) && v7 - 4 >= (unint64_t)this + v5[2] - *(void *)a2)
      && (v6 < 7
       || (!v5[3]
        || (BOOL result = 0, v8 = *((void *)a2 + 1), v8 >= 5) && v8 - 4 >= (unint64_t)this + v5[3] - *(void *)a2)
       && (v6 < 9
        || (uint64_t v9 = v5[4]) == 0
        || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5) && v10 - 4 >= (unint64_t)this + v9 - *(void *)a2)))
    {
      --*((_DWORD *)a2 + 4);
      return 1;
    }
  }
  return result;
}

BOOL FlatbufferSymbols::DyldSharedCacheMetadata::Verify(FlatbufferSymbols::DyldSharedCacheMetadata *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        unint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        unint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 6u);
        if (result)
        {
          unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
          if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
            unint64_t v10 = (const unsigned __int8 *)this + v9 + *(unsigned int *)((char *)this + v9);
          }
          else {
            unint64_t v10 = 0;
          }
          BOOL result = flatbuffers::Verifier::VerifyString(a2, v10);
          if (result)
          {
            uint64_t v11 = (unsigned __int16 *)((char *)this - *(int *)this);
            unsigned int v12 = *v11;
            if (v12 < 9
              || (!v11[4]
               || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 9)
               && v13 - 8 >= (unint64_t)this + v11[4] - *(void *)a2)
              && (v12 < 0xB
               || !v11[5]
               || (BOOL result = 0, v14 = *((void *)a2 + 1), v14 >= 9)
               && v14 - 8 >= (unint64_t)this + v11[5] - *(void *)a2))
            {
              BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
              if (result
                && (v12 < 0xD
                 || !v11[6]
                 || (BOOL result = FlatbufferSymbols::CPUArchitecture::Verify((FlatbufferSymbols::DyldSharedCacheMetadata *)((char *)this+ v11[6]+ *(unsigned int *)((char *)this + v11[6])), a2))))
              {
                BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                if (result)
                {
                  uint64_t v15 = (unsigned __int16 *)((char *)this - *(int *)this);
                  if (*v15 >= 0xFu && (uint64_t v16 = v15[7]) != 0) {
                    uint64_t v17 = (const unsigned __int8 *)this + v16 + *(unsigned int *)((char *)this + v16);
                  }
                  else {
                    uint64_t v17 = 0;
                  }
                  BOOL result = flatbuffers::Verifier::VerifyString(a2, v17);
                  if (result)
                  {
                    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                    if (result)
                    {
                      unsigned int v18 = (unsigned __int16 *)((char *)this - *(int *)this);
                      if (*v18 >= 0x11u && (uint64_t v19 = v18[8]) != 0) {
                        __int16 v20 = (const unsigned __int8 *)this + v19 + *(unsigned int *)((char *)this + v19);
                      }
                      else {
                        __int16 v20 = 0;
                      }
                      BOOL result = flatbuffers::Verifier::VerifyString(a2, v20);
                      if (result)
                      {
                        BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 0x12u);
                        if (result)
                        {
                          unint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v21 >= 0x13u && (uint64_t v22 = v21[9]) != 0) {
                            int v23 = (const unsigned __int8 *)this + v22 + *(unsigned int *)((char *)this + v22);
                          }
                          else {
                            int v23 = 0;
                          }
                          BOOL result = flatbuffers::Verifier::VerifyString(a2, v23);
                          if (result)
                          {
                            uint64_t v24 = (unsigned __int16 *)((char *)this - *(int *)this);
                            if (*v24 < 0x15u
                              || (uint64_t v25 = v24[10]) == 0
                              || (BOOL result = 0, v26 = *((void *)a2 + 1), v26 >= 9)
                              && v26 - 8 >= (unint64_t)this + v25 - *(void *)a2)
                            {
                              --*((_DWORD *)a2 + 4);
                              return 1;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::SymbolNameEntry>(flatbuffers::Verifier *this, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  uint64_t v6 = a2 + 1;
  while (1)
  {
    uint64_t v7 = a2[v4 + 1];
    unint64_t v8 = (const unsigned __int8 *)&a2[v4] + v7;
    uint64_t result = flatbuffers::Verifier::VerifyTableStart(this, v8 + 4);
    if (!result) {
      break;
    }
    uint64_t v10 = v7 - *((int *)v8 + 1);
    if (*(unsigned __int16 *)((char *)&a2[v4 + 1] + v10) < 5u) {
      return 0;
    }
    uint64_t v11 = *(unsigned __int16 *)((char *)&a2[v4 + 2] + v10);
    if (!v11) {
      return 0;
    }
    uint64_t v12 = v7 + v11;
    uint64_t result = flatbuffers::Verifier::VerifyOffset(this, (unint64_t)&v6[v4] + v7 + v11 - *(void *)this);
    if (!result) {
      return result;
    }
    uint64_t result = flatbuffers::Verifier::VerifyString(this, (const unsigned __int8 *)&a2[v4 + 1] + v12 + *(unsigned int *)((char *)&a2[v4 + 1] + v12));
    if (!result) {
      return result;
    }
    uint64_t result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), this, 6u);
    if (!result) {
      return result;
    }
    unint64_t v13 = (char *)&a2[v4] + v7 - *((int *)v8 + 1);
    if (*((unsigned __int16 *)v13 + 2) >= 7u)
    {
      uint64_t v14 = *((unsigned __int16 *)v13 + 5);
      if (v14)
      {
        if ((FlatbufferSymbols::Symbol::Verify((FlatbufferSymbols::Symbol *)((char *)&a2[v4 + 1]+ v7+ v14+ *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v14)), this) & 1) == 0)return 0; {
      }
        }
    }
    --*((_DWORD *)this + 4);
    ++v5;
    ++v4;
    if (v5 >= *a2) {
      return 1;
    }
  }
  return result;
}

uint64_t FlatbufferSymbols::Symbol::Verify(FlatbufferSymbols::Symbol *this, flatbuffers::Verifier *a2)
{
  uint64_t result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
    unsigned int v6 = *v5;
    if (v6 < 5
      || (!v5[2]
       || (uint64_t result = 0, v7 = *((void *)a2 + 1), v7 >= 9) && v7 - 8 >= (unint64_t)this + v5[2] - *(void *)a2)
      && (v6 < 7
       || !v5[3]
       || (uint64_t result = 0, v8 = *((void *)a2 + 1), v8 >= 9) && v8 - 8 >= (unint64_t)this + v5[3] - *(void *)a2))
    {
      uint64_t result = flatbuffers::Table::VerifyOffset(this, a2, 8u);
      if (result)
      {
        uint64_t v9 = v6 >= 9 && v5[4] ? (const unsigned __int8 *)this + v5[4] + *(unsigned int *)((char *)this + v5[4]) : 0;
        uint64_t result = flatbuffers::Verifier::VerifyString(a2, v9);
        if (result)
        {
          uint64_t result = flatbuffers::Table::VerifyOffset(this, a2, 0xAu);
          if (result)
          {
            uint64_t v10 = (unsigned __int16 *)((char *)this - *(int *)this);
            if (*v10 >= 0xBu && (uint64_t v11 = v10[5]) != 0) {
              uint64_t v12 = (const unsigned __int8 *)this + v11 + *(unsigned int *)((char *)this + v11);
            }
            else {
              uint64_t v12 = 0;
            }
            uint64_t result = flatbuffers::Verifier::VerifyString(a2, v12);
            if (result)
            {
              uint64_t result = flatbuffers::Table::VerifyOffset(this, a2, 0xCu);
              if (result)
              {
                unint64_t v13 = 0;
                uint64_t v14 = *(int *)this;
                if (*(unsigned __int16 *)((char *)this - v14) >= 0xDu)
                {
                  if (!*(_WORD *)((char *)this - v14 + 12)) {
                    goto LABEL_27;
                  }
                  uint64_t result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v14 + 12)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v14 + 12)), 4uLL, 0);
                  if (!result) {
                    return result;
                  }
                  unint64_t v13 = 0;
                  uint64_t v14 = *(int *)this;
                  if (*(unsigned __int16 *)((char *)this - v14) >= 0xDu)
                  {
LABEL_27:
                    uint64_t v15 = *(unsigned __int16 *)((char *)this - v14 + 12);
                    if (v15) {
                      unint64_t v13 = (_DWORD *)((char *)this + v15 + *(unsigned int *)((char *)this + v15));
                    }
                    else {
                      unint64_t v13 = 0;
                    }
                  }
                }
                uint64_t result = flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::SourceInfo>(a2, v13);
                if (result)
                {
                  uint64_t result = flatbuffers::Table::VerifyOffset(this, a2, 0xEu);
                  if (result)
                  {
                    uint64_t v16 = (unsigned __int16 *)((char *)this - *(int *)this);
                    if (*v16 < 0xFu
                      || (uint64_t v17 = v16[7]) == 0
                      || (uint64_t result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this + v17 + *(unsigned int *)((char *)this + v17), 1uLL, 0), result))
                    {
                      uint64_t result = flatbuffers::Table::VerifyOffset(this, a2, 0x10u);
                      if (result)
                      {
                        unsigned int v18 = 0;
                        uint64_t v19 = *(int *)this;
                        if (*(unsigned __int16 *)((char *)this - v19) >= 0x11u)
                        {
                          if (!*(_WORD *)((char *)this - v19 + 16)) {
                            goto LABEL_40;
                          }
                          uint64_t result = flatbuffers::Verifier::VerifyVectorOrString(a2, (const unsigned __int8 *)this+ *(unsigned __int16 *)((char *)this - v19 + 16)+ *(unsigned int *)((char *)this + *(unsigned __int16 *)((char *)this - v19 + 16)), 4uLL, 0);
                          if (!result) {
                            return result;
                          }
                          unsigned int v18 = 0;
                          uint64_t v19 = *(int *)this;
                          if (*(unsigned __int16 *)((char *)this - v19) >= 0x11u)
                          {
LABEL_40:
                            uint64_t v20 = *(unsigned __int16 *)((char *)this - v19 + 16);
                            if (v20) {
                              unsigned int v18 = (_DWORD *)((char *)this + v20 + *(unsigned int *)((char *)this + v20));
                            }
                            else {
                              unsigned int v18 = 0;
                            }
                          }
                        }
                        uint64_t result = flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::InlineSymbol>((uint64_t)a2, v18);
                        if (result)
                        {
                          unint64_t v21 = (unsigned __int16 *)((char *)this - *(int *)this);
                          if (*v21 < 0x13u
                            || (uint64_t v22 = v21[9]) == 0
                            || (uint64_t result = 0, v23 = *((void *)a2 + 1), v23 >= 9)
                            && v23 - 8 >= (unint64_t)this + v22 - *(void *)a2)
                          {
                            --*((_DWORD *)a2 + 4);
                            return 1;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::SourceInfo>(flatbuffers::Verifier *a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = a2 + 1;
  do
  {
    BOOL result = FlatbufferSymbols::SourceInfo::Verify((FlatbufferSymbols::SourceInfo *)((char *)v5 + *v5), a1);
    if (!result) {
      break;
    }
    ++v4;
    ++v5;
  }
  while (v4 < *a2);
  return result;
}

uint64_t flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::InlineSymbol>(uint64_t a1, _DWORD *a2)
{
  if (!a2) {
    return 1;
  }
  if (!*a2) {
    return 1;
  }
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  unsigned int v6 = a2 + 1;
  while (1)
  {
    uint64_t v7 = a2[v4 + 1];
    unint64_t v8 = (const unsigned __int8 *)&a2[v4] + v7;
    uint64_t result = flatbuffers::Verifier::VerifyTableStart((flatbuffers::Verifier *)a1, v8 + 4);
    if (!result) {
      return result;
    }
    uint64_t v10 = v7 - *((int *)v8 + 1);
    unsigned int v11 = *(unsigned __int16 *)((char *)&a2[v4 + 1] + v10);
    if (v11 >= 5)
    {
      if (*(_WORD *)((char *)&a2[v4 + 2] + v10))
      {
        uint64_t result = 0;
        unint64_t v12 = *(void *)(a1 + 8);
        if (v12 < 9
          || v12 - 8 < (unint64_t)&v6[v4] + v7 + *(unsigned __int16 *)((char *)&a2[v4 + 2] + v10) - *(void *)a1)
        {
          return result;
        }
      }
      if (v11 >= 7)
      {
        if (*(_WORD *)((char *)&a2[v4 + 2] + v10 + 2))
        {
          uint64_t result = 0;
          unint64_t v13 = *(void *)(a1 + 8);
          if (v13 < 9
            || v13 - 8 < (unint64_t)&v6[v4]
                       + v7
                       + *(unsigned __int16 *)((char *)&a2[v4 + 2] + v10 + 2)
                       - *(void *)a1)
          {
            return result;
          }
        }
      }
    }
    uint64_t result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), (const flatbuffers::Verifier *)a1, 8u);
    if (!result) {
      return result;
    }
    if (v11 >= 9 && *(_WORD *)((char *)&a2[v4 + 3] + v10))
    {
      uint64_t v14 = v7 + *(unsigned __int16 *)((char *)&a2[v4 + 3] + v10);
      uint64_t v15 = (const unsigned __int8 *)&a2[v4 + 1] + v14 + *(unsigned int *)((char *)&a2[v4 + 1] + v14);
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t result = flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)a1, v15);
    if (!result) {
      return result;
    }
    uint64_t result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), (const flatbuffers::Verifier *)a1, 0xAu);
    if (!result) {
      return result;
    }
    uint64_t v16 = (char *)&a2[v4] + v7 - *((int *)v8 + 1);
    if (*((unsigned __int16 *)v16 + 2) >= 0xBu && (uint64_t v17 = *((unsigned __int16 *)v16 + 7)) != 0) {
      unsigned int v18 = (const unsigned __int8 *)&a2[v4 + 1] + v7 + v17 + *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v17);
    }
    else {
      unsigned int v18 = 0;
    }
    uint64_t result = flatbuffers::Verifier::VerifyString((flatbuffers::Verifier *)a1, v18);
    if (!result) {
      return result;
    }
    uint64_t result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), (const flatbuffers::Verifier *)a1, 0xCu);
    if (!result) {
      return result;
    }
    uint64_t v19 = (char *)&a2[v4] + v7 - *((int *)v8 + 1);
    if (*((unsigned __int16 *)v19 + 2) >= 0xDu)
    {
      uint64_t v20 = *((unsigned __int16 *)v19 + 8);
      if (v20)
      {
        uint64_t result = FlatbufferSymbols::SourceInfo::Verify((FlatbufferSymbols::SourceInfo *)((char *)&a2[v4 + 1]+ v7+ v20+ *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v20)), (flatbuffers::Verifier *)a1);
        if (!result) {
          return result;
        }
      }
    }
    uint64_t result = flatbuffers::Table::VerifyOffset((flatbuffers::Table *)(v8 + 4), (const flatbuffers::Verifier *)a1, 0xEu);
    if (!result) {
      return result;
    }
    uint64_t v21 = 0;
    uint64_t v22 = *((int *)v8 + 1);
    unint64_t v23 = (char *)&a2[v4] + v7 - v22;
    if (*((unsigned __int16 *)v23 + 2) >= 0xFu)
    {
      uint64_t v24 = *((unsigned __int16 *)v23 + 9);
      if (!v24) {
        goto LABEL_34;
      }
      uint64_t result = flatbuffers::Verifier::VerifyVectorOrString((flatbuffers::Verifier *)a1, (const unsigned __int8 *)&a2[v4 + 1] + v7 + v24 + *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v24), 4uLL, 0);
      if (!result) {
        return result;
      }
      uint64_t v21 = 0;
      uint64_t v22 = *((int *)v8 + 1);
      if (*(unsigned __int16 *)((char *)&a2[v4 + 1] + v7 - v22) >= 0xFu)
      {
LABEL_34:
        uint64_t v25 = *(unsigned __int16 *)((char *)a2 + v7 + v4 * 4 - v22 + 18);
        if (v25) {
          uint64_t v21 = (uint64_t)&a2[v4 + 1] + v7 + v25 + *(unsigned int *)((char *)&a2[v4 + 1] + v7 + v25);
        }
        else {
          uint64_t v21 = 0;
        }
      }
    }
    uint64_t result = flatbuffers::Verifier::VerifyVectorOfTables<FlatbufferSymbols::InlineSymbol>(a1, v21);
    if (!result) {
      return result;
    }
    unint64_t v26 = (char *)&a2[v4] + v7 - *((int *)v8 + 1);
    if (*((unsigned __int16 *)v26 + 2) >= 0x11u)
    {
      uint64_t v27 = *((unsigned __int16 *)v26 + 10);
      if (v27)
      {
        uint64_t result = 0;
        unint64_t v28 = *(void *)(a1 + 8);
        if (v28 < 9 || v28 - 8 < (unint64_t)&v6[v4] + v7 + v27 - *(void *)a1) {
          return result;
        }
      }
    }
    --*(_DWORD *)(a1 + 16);
    ++v5;
    ++v4;
    if (v5 >= *a2) {
      return 1;
    }
  }
}

BOOL FlatbufferSymbols::SourceInfo::Verify(FlatbufferSymbols::SourceInfo *this, flatbuffers::Verifier *a2)
{
  BOOL result = flatbuffers::Verifier::VerifyTableStart(a2, (const unsigned __int8 *)this);
  if (result)
  {
    BOOL result = flatbuffers::Table::VerifyOffset(this, a2, 4u);
    if (result)
    {
      unint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
      if (*v5 >= 5u && (uint64_t v6 = v5[2]) != 0) {
        uint64_t v7 = (const unsigned __int8 *)this + v6 + *(unsigned int *)((char *)this + v6);
      }
      else {
        uint64_t v7 = 0;
      }
      BOOL result = flatbuffers::Verifier::VerifyString(a2, v7);
      if (result)
      {
        unint64_t v8 = (unsigned __int16 *)((char *)this - *(int *)this);
        unsigned int v9 = *v8;
        if (v9 < 7) {
          goto LABEL_28;
        }
        if (!v8[3]
          || (BOOL result = 0, v10 = *((void *)a2 + 1), v10 >= 5)
          && v10 - 4 >= (unint64_t)this + v8[3] - *(void *)a2)
        {
          if (v9 < 9) {
            goto LABEL_28;
          }
          if (!v8[4]
            || (BOOL result = 0, v11 = *((void *)a2 + 1), v11 >= 5)
            && v11 - 4 >= (unint64_t)this + v8[4] - *(void *)a2)
          {
            if (v9 < 0xB
              || (!v8[5]
               || (BOOL result = 0, v12 = *((void *)a2 + 1), v12 >= 5)
               && v12 - 4 >= (unint64_t)this + v8[5] - *(void *)a2)
              && (v9 < 0xD
               || (!v8[6]
                || (BOOL result = 0, v13 = *((void *)a2 + 1), v13 >= 9)
                && v13 - 8 >= (unint64_t)this + v8[6] - *(void *)a2)
               && (v9 < 0xF
                || (uint64_t v14 = v8[7]) == 0
                || (BOOL result = 0, v15 = *((void *)a2 + 1), v15 >= 5)
                && v15 - 4 >= (unint64_t)this + v14 - *(void *)a2)))
            {
LABEL_28:
              --*((_DWORD *)a2 + 4);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

id CopyCleanSegmentName(void *a1)
{
  id v1 = a1;
  if ([v1 hasSuffix:@" SEGMENT"])
  {
    os_unfair_lock_lock(&stru_1EB699134);
    uint64_t v2 = (void *)qword_1EB699140;
    if (!qword_1EB699140)
    {
      uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
      uint64_t v4 = (void *)qword_1EB699140;
      qword_1EB699140 = v3;

      uint64_t v2 = (void *)qword_1EB699140;
    }
    unint64_t v5 = [v2 objectForKeyedSubscript:v1];
    if (!v5)
    {
      uint64_t v6 = [v1 stringByReplacingOccurrencesOfString:@" SEGMENT" withString:&stru_1F1A80538];
      unint64_t v5 = SACachedNSString(v6);

      [(id)qword_1EB699140 setObject:v5 forKeyedSubscript:v1];
    }
    os_unfair_lock_unlock(&stru_1EB699134);
  }
  else
  {
    unint64_t v5 = SACachedNSString(v1);
  }

  return v5;
}

void sub_1BF28C3F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF28CAD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF28D944(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF28DE90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BF28E5F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF28E874(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF28EBEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF28EFD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF28F82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  objc_sync_exit(v36);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v37 - 184), 8);
  _Block_object_dispose((const void *)(v37 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1BF29020C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_1BF2905A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF2908F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF2909E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF290CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF290EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF290FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF291264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF2916AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF291960(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF292390(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF292534(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF292624(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF2926AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF29291C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF2937D0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 176), 8);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF293ACC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF293C64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF2940A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF294724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_sync_exit(v31);
  _Unwind_Resume(a1);
}

void sub_1BF2949A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF294C0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF294F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BF2950B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF2958A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19, id obj,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_1BF295B68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF297124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

id _SABinaryCreateLoadInfoArrayFromDyldImageInfos(uint64_t a1, unsigned int a2, void *a3, NSObject *a4, unsigned int a5, int a6)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  if (a1 && a2)
  {
    if (a4 || !a5) {
      goto LABEL_12;
    }
    a6 = *__error();
    a4 = _sa_logt();
    if (os_log_type_enabled(a4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v42 = a5;
      _os_log_error_impl(&dword_1BF22B000, a4, OS_LOG_TYPE_ERROR, "%d text exec load infos, but NULL pointer", buf, 8u);
    }

    *__error() = a6;
    _SASetCrashLogMessage(3133, "%d text exec load infos, but NULL pointer", v11, v12, v13, v14, v15, v16, a5);
    _os_crash();
    __break(1u);
  }
  uint64_t v17 = 0;
  if (!a4 || !a5) {
    goto LABEL_28;
  }
  if (!a1 && a2)
  {
    int v32 = *__error();
    uint64_t v33 = _sa_logt();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v42 = a2;
      _os_log_error_impl(&dword_1BF22B000, v33, OS_LOG_TYPE_ERROR, "%d load infos, but NULL pointer", buf, 8u);
    }

    *__error() = v32;
    _SASetCrashLogMessage(3132, "%d load infos, but NULL pointer", v34, v35, v36, v37, v38, v39, a2);
    _os_crash();
    __break(1u);
  }
LABEL_12:
  unsigned int v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5 + a2];
  if (a2)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 24 * a2;
    do
    {
      uint64_t v21 = uuidForBytes(a1 + v19 + 8);
      id v22 = 0;
      if (!v19 && (a6 & 1) == 0)
      {
        if ([v40 isAbsolutePath]) {
          id v22 = v40;
        }
        else {
          id v22 = 0;
        }
      }
      unint64_t v23 = +[SABinary binaryWithUUID:v21 absolutePath:v22];
      uint64_t v24 = +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v23, *(void *)(a1 + v19), a6, 0);
      [v18 addObject:v24];

      v19 += 24;
    }
    while (v20 != v19);
  }
  if (a5)
  {
    uint64_t v25 = a5;
    uint64_t v26 = (uint64_t)&a4[1];
    do
    {
      uint64_t v27 = uuidForBytes(v26);
      unint64_t v28 = +[SABinary binaryWithUUID:v27 absolutePath:0];
      int v29 = -[SABinary segmentWithCleanName:](v28, @"__TEXT_EXEC");
      if (!v29)
      {
        int v29 = +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v28, @"__TEXT_EXEC", 0);
        -[SABinary addSegment:](v28, v29);
      }
      int v30 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v29, *(void *)(v26 - 8), a6, 0);
      [v18 addObject:v30];

      v26 += 24;
      --v25;
    }
    while (v25);
  }
  if (a6) {
    [v18 sortUsingComparator:&__block_literal_global_771];
  }
  uint64_t v17 = (void *)[v18 copy];

LABEL_28:
  return v17;
}

void sub_1BF297E30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF297FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF298810(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF298910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF298A58(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BF2992C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1BF29948C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BF29A1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BF29AE88(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1BF29C800(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF29C9A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SAFormattedBytes(unint64_t a1, int a2, int a3)
{
  return SAFormattedBytesEx(a1, a2, a3, 1, 0);
}

id SAFormattedBytesEx(unint64_t a1, int a2, int a3, int a4, unint64_t a5)
{
  unint64_t v8 = 1000;
  if (a2)
  {
    unint64_t v8 = 1024;
    unint64_t v9 = 0x100000;
  }
  else
  {
    unint64_t v9 = 1000000;
  }
  if (a2) {
    unint64_t v10 = 0x40000000;
  }
  else {
    unint64_t v10 = 1000000000;
  }
  if (a3) {
    uint64_t v11 = "i";
  }
  else {
    uint64_t v11 = "";
  }
  if (10 * v8 <= a1 || v8 <= a5)
  {
    if (10 * v9 <= a1 || v9 <= a5)
    {
      double v20 = (double)a1;
      id v21 = [NSString alloc];
      id v22 = " ";
      if (!a4) {
        id v22 = "";
      }
      if (10 * v10 <= a1 || v10 <= a5)
      {
        if (floor(v20 / (double)v10) == v20 / (double)v10) {
          uint64_t v16 = objc_msgSend(v21, "initWithFormat:", @"%.0f%sG%sB", v20 / (double)v10, v22, v11);
        }
        else {
          uint64_t v16 = (void *)[v21 initWithFormat:@"%.2f%sG%sB", v20 / (double)v10, v22, v11];
        }
      }
      else if (floor(v20 / (double)v9) == v20 / (double)v9)
      {
        uint64_t v16 = objc_msgSend(v21, "initWithFormat:", @"%.0f%sM%sB", v20 / (double)v9, v22, v11);
      }
      else
      {
        uint64_t v16 = (void *)[v21 initWithFormat:@"%.2f%sM%sB", v20 / (double)v9, v22, v11];
      }
    }
    else
    {
      unint64_t v17 = a1 / v8;
      id v18 = [NSString alloc];
      uint64_t v19 = " ";
      if (!a4) {
        uint64_t v19 = "";
      }
      uint64_t v16 = objc_msgSend(v18, "initWithFormat:", @"%lld%sK%sB", v17, v19, v11);
    }
  }
  else
  {
    id v13 = [NSString alloc];
    uint64_t v14 = "  ";
    if (!a4) {
      uint64_t v14 = "";
    }
    uint64_t v15 = " ";
    if ((a4 & a3) == 0) {
      uint64_t v15 = "";
    }
    uint64_t v16 = objc_msgSend(v13, "initWithFormat:", @"%lld%s%sB", a1, v14, v15);
  }
  return v16;
}

id SAFormattedBytesDouble(int a1, int a2, double a3)
{
  double v4 = 1000.0;
  if (a1)
  {
    double v4 = 1024.0;
    double v5 = 1048576.0;
  }
  else
  {
    double v5 = 1000000.0;
  }
  if (a1) {
    double v6 = 1073741820.0;
  }
  else {
    double v6 = 1000000000.0;
  }
  if (a2) {
    uint64_t v7 = "i";
  }
  else {
    uint64_t v7 = "";
  }
  if (v4 * 10.0 <= a3)
  {
    if (v5 * 10.0 <= a3)
    {
      id v15 = [NSString alloc];
      if (v6 * 10.0 <= a3)
      {
        if (floor(a3 / v6) == a3 / v6) {
          uint64_t v12 = objc_msgSend(v15, "initWithFormat:", @"%.0f G%sB", a3 / v6, v7);
        }
        else {
          uint64_t v12 = (void *)[v15 initWithFormat:@"%.2f G%sB", a3 / v6, v7];
        }
      }
      else if (floor(a3 / v5) == a3 / v5)
      {
        uint64_t v12 = objc_msgSend(v15, "initWithFormat:", @"%.0f M%sB", a3 / v5, v7);
      }
      else
      {
        uint64_t v12 = (void *)[v15 initWithFormat:@"%.2f M%sB", a3 / v5, v7];
      }
    }
    else
    {
      double v13 = a3 / v4;
      id v14 = [NSString alloc];
      if (floor(v13) == v13) {
        uint64_t v12 = objc_msgSend(v14, "initWithFormat:", @"%.0f K%sB", *(void *)&v13, v7);
      }
      else {
        uint64_t v12 = (void *)[v14 initWithFormat:@"%.2f K%sB", *(void *)&v13, v7];
      }
    }
  }
  else
  {
    double v9 = floor(a3);
    id v10 = [NSString alloc];
    uint64_t v11 = " ";
    if (!a2) {
      uint64_t v11 = "";
    }
    if (v9 == a3) {
      uint64_t v12 = objc_msgSend(v10, "initWithFormat:", @"%.0f  %sB", *(void *)&a3, v11);
    }
    else {
      uint64_t v12 = (void *)[v10 initWithFormat:@"%.2f  %sB", *(void *)&a3, v11];
    }
  }
  return v12;
}

uint64_t CopyLoadInfosForLiveProcess(BOOL a1, uint64_t a2, id *a3, void *a4, id *a5, void *a6, uint64_t *a7, int a8)
{
  uint64_t v12 = a3;
  id v14 = (void *)a1;
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (!a1) {
    goto LABEL_27;
  }
  uint64_t v15 = CopyDyldSnapshotForPid(a1);
  if (!v15)
  {
    int v22 = kill((pid_t)v14, 0);
    int v17 = *__error();
    unint64_t v23 = _sa_logt();
    id v18 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        int v104 = (int)v14;
        _os_log_debug_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_DEBUG, "[%d]: Process no longer alive, unable to inspect for load infos", buf, 8u);
      }

      *__error() = v17;
      return 4294967294;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 67109120;
    int v104 = (int)v14;
    uint64_t v19 = "[%d]: Process alive, but unable to inspect for load infos via dyld introspection, trying CoreSymbolication";
    double v20 = v18;
    uint32_t v21 = 8;
    goto LABEL_73;
  }
  int InfosForDyldSnapshot = _CopyLoadInfosForDyldSnapshot(v15, (int)v14, 0, a2, v12, a5, a6, a7);
  dyld_process_snapshot_dispose();
  if (InfosForDyldSnapshot)
  {
    int v17 = *__error();
    id v18 = _sa_logt();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_26:

      *__error() = v17;
LABEL_27:
      uint64_t SymbolicatorForLiveProcess = CreateSymbolicatorForLiveProcess((BOOL)v14, a8);
      uint64_t v33 = v32;
      if (!CSIsNull())
      {
        int v38 = *__error();
        uint64_t v39 = _sa_logt();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v104 = (int)v14;
          _os_log_debug_impl(&dword_1BF22B000, v39, OS_LOG_TYPE_DEBUG, "[%d]: Inspected live process via CS", buf, 8u);
        }

        *__error() = v38;
        if (a5)
        {
          +[SASharedCache sharedCacheWithCSSymbolicator:]();
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (v12)
        {
          uint64_t v40 = self;
          +[SABinaryLoadInfo binaryLoadInfoForSymbolicator:isKernel:dataGatheringOptions:excludeRange:ignoreSharedCache:](v40, SymbolicatorForLiveProcess, v33, v14 == 0, a2);
          *uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (a7) {
          *a7 = CSSymbolicatorGetArchitecture();
        }
        if (a6)
        {
          uint64_t AOutSymbolOwner = CSSymbolicatorGetAOutSymbolOwner();
          uint64_t v43 = v42;
          if ((CSIsNull() & 1) == 0)
          {
            int v44 = +[SABinary binaryWithSymbolOwner:v43 fromDisk:0];
            int v45 = v44;
            if (v44) {
              *a6 = v44;
            }
          }
        }
        goto LABEL_44;
      }
      int v34 = kill((pid_t)v14, 0);
      int v35 = *__error();
      uint64_t v36 = _sa_logt();
      uint64_t v37 = v36;
      if (v34)
      {
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v104 = (int)v14;
          _os_log_debug_impl(&dword_1BF22B000, v37, OS_LOG_TYPE_DEBUG, "[%d]: Process no longer alive, unable to inspect for load infos", buf, 8u);
        }
      }
      else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v104 = (int)v14;
        _os_log_error_impl(&dword_1BF22B000, v37, OS_LOG_TYPE_ERROR, "[%d]: Process alive, but unable to inspect for load infos via CoreSymbolication", buf, 8u);
      }

      *__error() = v35;
      return 0xFFFFFFFFLL;
    }
    *(_DWORD *)buf = 67109376;
    int v104 = (int)v14;
    __int16 v105 = 1024;
    LODWORD(v106) = InfosForDyldSnapshot;
    uint64_t v19 = "[%d]: Failed to get load infos via dyld introspection (%d), trying CoreSymbolication";
    double v20 = v18;
    uint32_t v21 = 14;
LABEL_73:
    _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_26;
  }
  if ((int)SACompareDyldToCSLevel() < 1) {
    return 0;
  }
  uint64_t v91 = CreateSymbolicatorForLiveProcess((BOOL)v14, a8);
  uint64_t v92 = v25;
  char v26 = CSIsNull();
  int v27 = *__error();
  unint64_t v28 = _sa_logt();
  int v29 = v28;
  if (v26)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v104 = (int)v14;
      _os_log_error_impl(&dword_1BF22B000, v29, OS_LOG_TYPE_ERROR, "[%d]: Unable to inspect live process via CS to compare to dyld", buf, 8u);
    }

    int v30 = __error();
    uint64_t result = 0;
    *int v30 = v27;
    return result;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v104 = (int)v14;
    _os_log_debug_impl(&dword_1BF22B000, v29, OS_LOG_TYPE_DEBUG, "[%d]: Inspected live process via CS to compare to dyld", buf, 8u);
  }

  *__error() = v27;
  int v90 = (int)v14;
  if (a5)
  {
    +[SASharedCache sharedCacheWithCSSymbolicator:]();
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    if (v46 != *a5)
    {
      int v79 = *__error();
      int v80 = _sa_logt();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
      {
        int v83 = [v46 debugDescription];
        unsigned int v84 = [*a5 debugDescription];
        *(_DWORD *)buf = 67109634;
        int v104 = (int)v14;
        __int16 v105 = 2112;
        v106 = v83;
        __int16 v107 = 2112;
        v108 = v84;
        _os_log_fault_impl(&dword_1BF22B000, v80, OS_LOG_TYPE_FAULT, "[%d]: CS shared cache %@ vs dyld shared cache %@", buf, 0x1Cu);
      }
      *__error() = v79;
    }
  }
  if (!v12) {
    goto LABEL_44;
  }
  uint64_t v47 = self;
  unsigned int v48 = +[SABinaryLoadInfo binaryLoadInfoForSymbolicator:isKernel:dataGatheringOptions:excludeRange:ignoreSharedCache:](v47, v91, v92, 0, a2);
  uint64_t v49 = [v48 count];
  if (v49 != [*v12 count])
  {
    int v81 = *__error();
    int v82 = _sa_logt();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
    {
      int v85 = [v48 debugDescription];
      int v86 = [*v12 debugDescription];
      *(_DWORD *)buf = 67109634;
      int v104 = (int)v14;
      __int16 v105 = 2112;
      v106 = v85;
      __int16 v107 = 2112;
      v108 = v86;
      _os_log_fault_impl(&dword_1BF22B000, v82, OS_LOG_TYPE_FAULT, "[%d]: CS load infos %@ vs dyld load infos %@", buf, 0x1Cu);
    }
    *__error() = v81;
  }
  uint64_t v50 = [v48 count];
  if (v50 != [*v12 count] || !objc_msgSend(v48, "count")) {
    goto LABEL_78;
  }
  int v51 = 0;
  int v88 = v48;
  while (1)
  {
    int v52 = [v48 objectAtIndexedSubscript:v51];
    uint64_t v53 = [v52 loadAddress];
    unsigned int v54 = [*v12 objectAtIndexedSubscript:v51];
    if (v53 != [v54 loadAddress]) {
      break;
    }
    int v55 = [v48 objectAtIndexedSubscript:v51];
    time_t v101 = [v55 binary];
    int v56 = [v101 uuid];
    int v57 = [*v12 objectAtIndexedSubscript:v51];
    int v100 = [v57 binary];
    v99 = [v100 uuid];
    if (objc_msgSend(v56, "isEqual:"))
    {
      id v14 = [v48 objectAtIndexedSubscript:v51];
      uint64_t v98 = [v14 segment];
      if (v98
        || ([*v12 objectAtIndexedSubscript:v51],
            int v87 = objc_claimAutoreleasedReturnValue(),
            [v87 segment],
            (v89 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v93 = [v48 objectAtIndexedSubscript:v51];
        [v93 segment];
        uint64_t v58 = v96 = v54;
        [v58 name];
        v59 = v95 = v55;
        [*v12 objectAtIndexedSubscript:v51];
        v60 = v94 = v56;
        [v60 segment];
        unsigned int v61 = v14;
        int v62 = v12;
        v64 = int v63 = v52;
        [v64 name];
        v66 = int v65 = v57;
        char v97 = [v59 isEqual:v66];

        int v57 = v65;
        int v52 = v63;
        uint64_t v12 = v62;
        id v14 = v61;

        unsigned int v48 = v88;
        int v56 = v94;

        int v55 = v95;
        unsigned int v54 = v96;

        v67 = (void *)v98;
        if (!v98)
        {
LABEL_66:
          v68 = v48;
          v69 = v67;

          v67 = v69;
          unsigned int v48 = v68;
        }

        LODWORD(v14) = v90;
        char v70 = v97;
        goto LABEL_68;
      }
      v89 = 0;
      char v97 = 1;
      v67 = 0;
      goto LABEL_66;
    }
    char v70 = 0;
LABEL_68:

    if ((v70 & 1) == 0) {
      goto LABEL_75;
    }
    if ((unint64_t)++v51 >= [v48 count]) {
      goto LABEL_78;
    }
  }

LABEL_75:
  int v71 = *__error();
  int v72 = _sa_logt();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
  {
    tm v102 = [v48 objectAtIndexedSubscript:v51];
    int v73 = [v102 debugDescription];
    int v74 = [*v12 objectAtIndexedSubscript:v51];
    int v75 = [v74 debugDescription];
    [v48 debugDescription];
    v77 = v76 = v48;
    v78 = [*v12 debugDescription];
    *(_DWORD *)buf = 67110402;
    int v104 = (int)v14;
    __int16 v105 = 2048;
    v106 = v51;
    __int16 v107 = 2112;
    v108 = v73;
    __int16 v109 = 2112;
    v110 = v75;
    __int16 v111 = 2112;
    v112 = v77;
    __int16 v113 = 2112;
    v114 = v78;
    _os_log_fault_impl(&dword_1BF22B000, v72, OS_LOG_TYPE_FAULT, "[%d]: index %lu CS load info %@ vs dyld %@\n%@\nvs\n%@", buf, 0x3Au);

    unsigned int v48 = v76;
  }

  *__error() = v71;
LABEL_78:

LABEL_44:
  CSRelease();
  return 0;
}

uint64_t CreateSymbolicatorForLiveProcess(BOOL a1, int a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  int v29 = (double *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  if (qword_1EB6991D8 != -1) {
    dispatch_once(&qword_1EB6991D8, &__block_literal_global_5);
  }
  id v4 = (id)qword_1EB6991D0;
  objc_sync_enter(v4);
  uint64_t v5 = qword_1EB6991D0;
  double v6 = [NSNumber numberWithInt:a1];
  LOBYTE(v5) = [(id)v5 containsObject:v6];

  objc_sync_exit(v4);
  if ((v5 & 1) != 0 || _AvoidSuspendingPid(a1))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v22 = 0;
    unint64_t v23 = &v22;
    uint64_t v24 = 0x3010000000;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v25 = &unk_1BF343D4B;
    if (a1)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __CreateSymbolicatorForLiveProcess_block_invoke_2;
      block[3] = &unk_1E63F8C10;
      BOOL v20 = a1;
      int v21 = a2 | 0x80000;
      block[4] = &v22;
      block[5] = &v28;
      unint64_t v8 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
      v8[2]();
    }
    else
    {
      uint64_t v9 = CSSymbolicatorCreateWithMachKernelFlagsAndNotification();
      id v10 = v23;
      v23[4] = v9;
      v10[5] = v11;
    }
    if (CSIsNull())
    {
      id v12 = (id)qword_1EB6991D0;
      objc_sync_enter(v12);
      double v13 = (void *)qword_1EB6991D0;
      id v14 = [NSNumber numberWithInt:a1];
      [v13 addObject:v14];

      objc_sync_exit(v12);
    }
    else if (a1)
    {
      ++_MergedGlobals_6;
      *(double *)&qword_1EB6991E0 = v29[3] + *(double *)&qword_1EB6991E0;
      int v15 = *__error();
      uint64_t v16 = _sa_logt();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *((void *)v29 + 3);
        *(_DWORD *)buf = 67110144;
        BOOL v33 = a1;
        __int16 v34 = 2048;
        uint64_t v35 = v18;
        __int16 v36 = 1024;
        int v37 = _MergedGlobals_6;
        __int16 v38 = 2048;
        uint64_t v39 = qword_1EB6991E0;
        __int16 v40 = 2048;
        double v41 = *(double *)&qword_1EB6991E0 / (double)_MergedGlobals_6;
        _os_log_debug_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_DEBUG, "[%d]: Inspected live process via cs introspection in %fs (%d totaling %fs, %fs avg)", buf, 0x2Cu);
      }

      *__error() = v15;
    }
    uint64_t v7 = v23[4];
    _Block_object_dispose(&v22, 8);
  }
  _Block_object_dispose(&v28, 8);
  return v7;
}

void sub_1BF2A7088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void __CreateSymbolicatorForLiveProcess_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v1 = (void *)qword_1EB6991D0;
  qword_1EB6991D0 = (uint64_t)v0;
}

void __CreateSymbolicatorForLiveProcess_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  double v3 = SASecondsFromMachTimeUsingLiveTimebase(v2);
  uint64_t v4 = CSSymbolicatorCreateWithPidFlagsAndNotification();
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v5 + 32) = v4;
  *(void *)(v5 + 40) = v6;
  if ((CSIsNull() & 1) == 0)
  {
    uint64_t v7 = mach_absolute_time();
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SASecondsFromMachTimeUsingLiveTimebase(v7) - v3;
  }
}

uint64_t CreateSymbolOwnerForUUIDAtPath(void *a1, void *a2, int a3)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v100 = 0uLL;
  [a1 getUUIDBytes:&v100];
  v97[0] = MEMORY[0x1E4F143A8];
  v97[1] = 3221225472;
  v97[2] = __CreateSymbolOwnerForUUIDAtPath_block_invoke;
  v97[3] = &__block_descriptor_52_e32___CSTypeRef_QQ_16__0__NSString_8l;
  int v98 = a3 | 0x80000;
  long long v99 = v100;
  int v73 = (uint64_t (**)(void, void))MEMORY[0x1C18A6C80](v97);
  uint64_t v6 = ((uint64_t (**)(void, id))v73)[2](v73, v5);
  if (CSIsNull())
  {
    if ([v5 isAbsolutePath])
    {
      id v7 = [v5 substringFromIndex:1];
    }
    else
    {
      id v7 = v5;
    }
    int v75 = v7;
    uint64_t v8 = SAGetHomeDirectoryURL();
    int v64 = (void *)v8;
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"Library" relativeToURL:v8];
      uint64_t v10 = [v9 absoluteURL];
    }
    else
    {
      uint64_t v10 = 0;
    }
    int v74 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = [v74 URLsForDirectory:5 inDomains:3];
    uint64_t v12 = v11;
    if (v10)
    {
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v93 objects:v110 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v94;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v94 != v16) {
              objc_enumerationMutation(v13);
            }
            if ([*(id *)(*((void *)&v93 + 1) + 8 * i) isEqual:v10])
            {
              uint64_t v12 = v13;
              goto LABEL_19;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v93 objects:v110 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v13, "count") + 1);
      [v12 addObject:v10];
      [v12 addObjectsFromArray:v13];
LABEL_19:
    }
    int v63 = (void *)v10;
    id v65 = v5;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v18 = v12;
    uint64_t v59 = [v18 countByEnumeratingWithState:&v89 objects:v109 count:16];
    if (v59)
    {
      uint64_t v19 = *(void *)v90;
      uint64_t v20 = *MEMORY[0x1E4F1C6E8];
      uint64_t v76 = *MEMORY[0x1E4F1C628];
      unint64_t v21 = 0x1E4F1C000uLL;
      unint64_t v22 = 0x1E4F1C000uLL;
      uint64_t v61 = *MEMORY[0x1E4F1C6E8];
      int v62 = v18;
      uint64_t v58 = *(void *)v90;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v90 != v19) {
            objc_enumerationMutation(v18);
          }
          uint64_t v60 = v23;
          uint64_t v24 = [*(id *)(v22 + 2832) fileURLWithPath:@"Developer/Xcode" isDirectory:1 relativeToURL:*(void *)(*((void *)&v89 + 1) + 8 * v23)];
          uint64_t v108 = v20;
          uint64_t v25 = [*(id *)(v21 + 2424) arrayWithObjects:&v108 count:1];
          v66 = (void *)v24;
          uint64_t v26 = [v74 enumeratorAtURL:v24 includingPropertiesForKeys:v25 options:1 errorHandler:0];

          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          id v27 = v26;
          uint64_t v72 = [v27 countByEnumeratingWithState:&v85 objects:v107 count:16];
          if (v72)
          {
            uint64_t v71 = *(void *)v86;
            v67 = v27;
            do
            {
              for (uint64_t j = 0; j != v72; ++j)
              {
                if (*(void *)v86 != v71) {
                  objc_enumerationMutation(v27);
                }
                int v29 = *(void **)(*((void *)&v85 + 1) + 8 * j);
                id v83 = 0;
                id v84 = 0;
                char v30 = [v29 getResourceValue:&v84 forKey:v20 error:&v83];
                id v31 = v84;
                id v32 = v83;
                if (v30)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && [v31 containsString:@"DeviceSupport"])
                  {
                    v69 = v31;
                    char v70 = v32;
                    uint64_t v68 = j;
                    uint64_t v102 = v76;
                    BOOL v33 = [*(id *)(v21 + 2424) arrayWithObjects:&v102 count:1];
                    __int16 v34 = [v74 enumeratorAtURL:v29 includingPropertiesForKeys:v33 options:1 errorHandler:0];

                    long long v81 = 0u;
                    long long v82 = 0u;
                    long long v79 = 0u;
                    long long v80 = 0u;
                    id v35 = v34;
                    uint64_t v36 = [v35 countByEnumeratingWithState:&v79 objects:v101 count:16];
                    if (v36)
                    {
                      uint64_t v37 = v36;
                      uint64_t v38 = *(void *)v80;
                      do
                      {
                        uint64_t v39 = 0;
                        do
                        {
                          if (*(void *)v80 != v38) {
                            objc_enumerationMutation(v35);
                          }
                          __int16 v40 = *(void **)(*((void *)&v79 + 1) + 8 * v39);
                          id v77 = 0;
                          id v78 = 0;
                          char v41 = [v40 getResourceValue:&v78 forKey:v76 error:&v77];
                          id v42 = v78;
                          id v43 = v77;
                          if (v41)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0 && [v42 BOOLValue])
                            {
                              int v44 = [*(id *)(v22 + 2832) fileURLWithPath:v75 relativeToURL:v40];
                              int v45 = [v44 path];

                              if (v45 && [v74 fileExistsAtPath:v45])
                              {
                                uint64_t v6 = ((uint64_t (**)(void, void *))v73)[2](v73, v45);
                                if ((CSIsNull() & 1) == 0) {
                                  goto LABEL_68;
                                }
                              }
                              else
                              {
                                unsigned int v48 = (void *)MEMORY[0x1E4F1CB10];
                                uint64_t v49 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"Symbols" relativeToURL:v40];
                                uint64_t v50 = [v48 fileURLWithPath:v75 relativeToURL:v49];
                                uint64_t v51 = [v50 path];

                                if (v51)
                                {
                                  if ([v74 fileExistsAtPath:v51])
                                  {
                                    uint64_t v6 = v73[2](v73, v51);
                                    if (!CSIsNull())
                                    {
                                      int v45 = (void *)v51;
LABEL_68:

                                      id v18 = v62;
                                      goto LABEL_69;
                                    }
                                  }
                                  int v45 = (void *)v51;
                                }
                                else
                                {
                                  int v45 = 0;
                                }
                              }

                              unint64_t v22 = 0x1E4F1C000;
                            }
                          }
                          else
                          {
                            int v46 = *__error();
                            uint64_t v47 = _sa_logt();
                            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 138412546;
                              int v104 = v40;
                              __int16 v105 = 2112;
                              id v106 = v43;
                              _os_log_error_impl(&dword_1BF22B000, v47, OS_LOG_TYPE_ERROR, "Error getting isDir for %@: %@", buf, 0x16u);
                            }

                            *__error() = v46;
                          }

                          ++v39;
                        }
                        while (v37 != v39);
                        uint64_t v52 = [v35 countByEnumeratingWithState:&v79 objects:v101 count:16];
                        uint64_t v37 = v52;
                      }
                      while (v52);
                    }

                    uint64_t v20 = v61;
                    unint64_t v21 = 0x1E4F1C000;
                    id v27 = v67;
                    uint64_t j = v68;
                    id v31 = v69;
                    id v32 = v70;
                  }
                }
                else
                {
                  uint64_t v53 = j;
                  int v54 = *__error();
                  int v55 = _sa_logt();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    int v104 = v29;
                    __int16 v105 = 2112;
                    id v106 = v32;
                    _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "Error getting name for %@: %@", buf, 0x16u);
                  }

                  *__error() = v54;
                  uint64_t j = v53;
                }
              }
              uint64_t v72 = [v27 countByEnumeratingWithState:&v85 objects:v107 count:16];
            }
            while (v72);
          }

          uint64_t v23 = v60 + 1;
          id v18 = v62;
          uint64_t v19 = v58;
        }
        while (v60 + 1 != v59);
        uint64_t v56 = [v62 countByEnumeratingWithState:&v89 objects:v109 count:16];
        uint64_t v19 = v58;
        uint64_t v6 = 0;
        uint64_t v59 = v56;
      }
      while (v56);
    }
    else
    {
      uint64_t v6 = 0;
    }
LABEL_69:

    id v5 = v65;
  }

  return v6;
}

uint64_t __CreateSymbolOwnerForUUIDAtPath_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3010000000;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v8 = &unk_1BF343D4B;
  id v2 = a2;
  [v2 UTF8String];
  CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification();
  uint64_t v3 = v6[4];
  _Block_object_dispose(&v5, 8);

  return v3;
}

void sub_1BF2A7B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __CreateSymbolOwnerForUUIDAtPath_block_invoke_2(uint64_t a1)
{
  uint64_t result = CSIsNull();
  if (result)
  {
    CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime();
    uint64_t result = CSIsNull();
    if ((result & 1) == 0)
    {
      uint64_t result = CSRetain();
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
      *(void *)(v3 + 32) = result;
      *(void *)(v3 + 40) = v4;
    }
  }
  return result;
}

id SAGetHomeDirectoryURL()
{
  id v0 = NSHomeDirectoryForUser(&cfstr_Mobile.isa);
  if (v0)
  {
    uint64_t v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v0 isDirectory:1];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

uint64_t CreateSymbolOwnerForArchitectureAtPath(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = v3;
    [v5 UTF8String];
    CSSymbolicatorCreateWithPathArchitectureFlagsAndNotification();
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    if (CSIsNull())
    {
      int v7 = *__error();
      uint64_t v8 = _sa_logt();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = CSSymbolicatorGetSymbolOwnerCountAtTime();
        *(_WORD *)&buf[22] = 2082;
        FamilyName = (void *)CSArchitectureGetFamilyName();
        _os_log_fault_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_FAULT, "No symbol owner at %@: %zu exist for arch %{public}s", buf, 0x20u);
      }

      *__error() = v7;
    }
    else
    {
      uint64_t SymbolOwner = CSRetain();
    }
    CSRelease();
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3010000000;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    FamilyName = &unk_1BF343D4B;
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    int v18 = 0;
    id v9 = v3;
    [v9 UTF8String];
    id v10 = v9;
    CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification();
    if (*((_DWORD *)v16 + 6) != 1)
    {
      int v11 = *__error();
      uint64_t v12 = _sa_logt();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v14 = *((_DWORD *)v16 + 6);
        *(_DWORD *)uint64_t v19 = 138412546;
        id v20 = v10;
        __int16 v21 = 1024;
        int v22 = v14;
        _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "Unable to uniquely identify symbol owner at %@: %d symbol owners exist", v19, 0x12u);
      }

      *__error() = v11;
    }
    uint64_t SymbolOwner = *(void *)(*(void *)&buf[8] + 32);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(buf, 8);
  }

  return SymbolOwner;
}

void sub_1BF2A7F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __CreateSymbolOwnerForArchitectureAtPath_block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t result = CSIsNull();
    if ((result & 1) == 0)
    {
      uint64_t result = CSRelease();
      uint64_t v3 = *(void *)(a1[6] + 8);
      *(void *)(v3 + 32) = 0;
      *(void *)(v3 + 40) = 0;
    }
  }
  else
  {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    uint64_t v5 = *(void *)(a1[6] + 8);
    *(void *)(v5 + 32) = SymbolOwner;
    *(void *)(v5 + 40) = v6;
    if (CSIsNull())
    {
      int v7 = *__error();
      uint64_t v8 = _sa_logt();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        uint64_t v11 = a1[4];
        int v12 = 138412546;
        uint64_t v13 = v11;
        __int16 v14 = 2048;
        uint64_t SymbolOwnerCountAtTime = CSSymbolicatorGetSymbolOwnerCountAtTime();
        _os_log_fault_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_FAULT, "No symbol owner at %@: %zu exist", (uint8_t *)&v12, 0x16u);
      }

      uint64_t result = (uint64_t)__error();
      *(_DWORD *)uint64_t result = v7;
    }
    else
    {
      uint64_t result = CSRetain();
      uint64_t v9 = *(void *)(a1[6] + 8);
      *(void *)(v9 + 32) = result;
      *(void *)(v9 + 40) = v10;
    }
  }
  ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  return result;
}

uint64_t CreateSymbolOwnerForExclaveUUID(void *a1)
{
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  CSSymbolicatorCreateWithExclaveUUIDAndFlags();
  uint64_t SymbolOwner = 0;
  if ((CSIsNull() & 1) == 0)
  {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
    if ((CSIsNull() & 1) == 0) {
      CSRetain();
    }
    CSRelease();
  }
  return SymbolOwner;
}

uint64_t SASpawnPlatformBinary(const char *a1, char *const *a2, char *const *a3, cpu_type_t *a4, int a5, _DWORD *a6, char a7, _DWORD *a8, char a9, _DWORD *a10)
{
  return _SASpawnPlatformBinaryWithSigningIdentifier(a1, 0, a2, a3, a4, 0, a5, a6, a7, a8, a9, a10);
}

uint64_t _SASpawnPlatformBinaryWithSigningIdentifier(const char *a1, void *a2, char *const *a3, char *const *a4, cpu_type_t *a5, void *a6, int a7, _DWORD *a8, char a9, _DWORD *a10, char a11, _DWORD *a12)
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  *(void *)long long v99 = -1;
  *(void *)char v97 = -1;
  *(void *)int v98 = -1;
  if (a8 && a7)
  {
    int v59 = *__error();
    uint64_t v60 = _sa_logt();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v60, OS_LOG_TYPE_ERROR, "Cannot specify inheritStdout and provide stdout_out", buf, 2u);
    }

    *__error() = v59;
    _SASetCrashLogMessage(607, "Cannot specify inheritStdout and provide stdout_out", v61, v62, v63, v64, v65, v66, v87);
    _os_crash();
    __break(1u);
    goto LABEL_112;
  }
  if (a10) {
    BOOL v17 = a9 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
LABEL_112:
    int v67 = *__error();
    uint64_t v68 = _sa_logt();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v68, OS_LOG_TYPE_ERROR, "Cannot specify inheritStderr and provide stderr_out", buf, 2u);
    }

    *__error() = v67;
    _SASetCrashLogMessage(608, "Cannot specify inheritStderr and provide stderr_out", v69, v70, v71, v72, v73, v74, v87);
    _os_crash();
    __break(1u);
    goto LABEL_115;
  }
  if (a12) {
    BOOL v18 = a11 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
LABEL_115:
    int v75 = *__error();
    uint64_t v28 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v28, OS_LOG_TYPE_ERROR, "Cannot specify inheritStdin and provide stdin_out", buf, 2u);
    }

    *__error() = v75;
    _SASetCrashLogMessage(609, "Cannot specify inheritStdin and provide stdin_out", v76, v77, v78, v79, v80, v81, v87);
    _os_crash();
    __break(1u);
    goto LABEL_118;
  }
  posix_spawn_file_actions_t v94 = 0;
  int v19 = posix_spawn_file_actions_init(&v94);
  if (v19)
  {
    int v20 = v19;
    int v21 = *__error();
    int v22 = _sa_logt();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      _os_log_error_impl(&dword_1BF22B000, v22, OS_LOG_TYPE_ERROR, "Unable to create posix file actions: %{errno}d", buf, 8u);
    }

    *__error() = v21;
LABEL_74:
    if ((v99[0] & 0x80000000) == 0) {
      close(v99[0]);
    }
    if ((v99[1] & 0x80000000) == 0) {
      close(v99[1]);
    }
    if ((v98[0] & 0x80000000) == 0) {
      close(v98[0]);
    }
    if ((v98[1] & 0x80000000) == 0) {
      close(v98[1]);
    }
    int v43 = v97[0];
    if (v97[0] < 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
  if (a7)
  {
    int v23 = posix_spawn_file_actions_addinherit_np(&v94, 1);
    if (v23)
    {
      int v20 = v23;
      int v24 = *__error();
      uint64_t v25 = _sa_logt();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v26 = "Unable to inherit stdout: %{errno}d";
LABEL_43:
        _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, v26, buf, 8u);
        goto LABEL_44;
      }
      goto LABEL_44;
    }
LABEL_32:
    LODWORD(v2_Block_object_dispose(&STACK[0x3D0], 8) = -1;
    goto LABEL_33;
  }
  if (a8)
  {
    if (pipe(v99))
    {
      int v20 = *__error();
      int v24 = *__error();
      uint64_t v25 = _sa_logt();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v26 = "Unable to open pipe: %{errno}d";
        goto LABEL_43;
      }
LABEL_44:

      *__error() = v24;
      posix_spawn_file_actions_destroy(&v94);
      goto LABEL_74;
    }
    int v32 = posix_spawn_file_actions_adddup2(&v94, v99[1], 1);
    if (v32)
    {
      int v20 = v32;
      int v24 = *__error();
      uint64_t v25 = _sa_logt();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v26 = "Unable to set posix file dup2: %{errno}d";
        goto LABEL_43;
      }
      goto LABEL_44;
    }
    goto LABEL_32;
  }
  int v27 = open("/dev/null", 1);
  if (v27 < 0)
  {
    int v20 = *__error();
    int v24 = *__error();
    uint64_t v25 = _sa_logt();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      uint64_t v26 = "Unable to open /dev/null: %{errno}d";
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  LODWORD(v2_Block_object_dispose(&STACK[0x3D0], 8) = v27;
  int v29 = posix_spawn_file_actions_adddup2(&v94, v27, 1);
  if (v29)
  {
    int v20 = v29;
    int v30 = *__error();
    id v31 = _sa_logt();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v96) = v20;
    goto LABEL_105;
  }
LABEL_33:
  if (a9)
  {
    int v33 = posix_spawn_file_actions_addinherit_np(&v94, 2);
    if (v33)
    {
      int v20 = v33;
      int v34 = *__error();
      id v35 = _sa_logt();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v36 = "Unable to inherit stderr: %{errno}d";
LABEL_70:
        _os_log_error_impl(&dword_1BF22B000, v35, OS_LOG_TYPE_ERROR, v36, buf, 8u);
        goto LABEL_71;
      }
      goto LABEL_71;
    }
    goto LABEL_53;
  }
  if (!a10)
  {
    if ((v28 & 0x80000000) != 0)
    {
      LODWORD(v2_Block_object_dispose(&STACK[0x3D0], 8) = open("/dev/null", 1);
      if ((v28 & 0x80000000) != 0)
      {
        int v20 = *__error();
        int v24 = *__error();
        uint64_t v25 = _sa_logt();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_44;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v26 = "Unable to open /dev/null: %{errno}d";
        goto LABEL_43;
      }
    }
    int v37 = posix_spawn_file_actions_adddup2(&v94, v28, 2);
    if (!v37) {
      goto LABEL_53;
    }
    int v20 = v37;
    int v30 = *__error();
    id v31 = _sa_logt();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_49:

      *__error() = v30;
      posix_spawn_file_actions_destroy(&v94);
LABEL_73:
      close(v28);
      goto LABEL_74;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v96) = v20;
LABEL_105:
    _os_log_error_impl(&dword_1BF22B000, v31, OS_LOG_TYPE_ERROR, "Unable to set posix file dup2: %{errno}d", buf, 8u);
    goto LABEL_49;
  }
  if (pipe(v98))
  {
    int v20 = *__error();
    int v34 = *__error();
    id v35 = _sa_logt();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      uint64_t v36 = "Unable to open pipe: %{errno}d";
      goto LABEL_70;
    }
LABEL_71:

    *__error() = v34;
    goto LABEL_72;
  }
  int v38 = posix_spawn_file_actions_adddup2(&v94, v98[1], 2);
  if (v38)
  {
    int v20 = v38;
    int v34 = *__error();
    id v35 = _sa_logt();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      uint64_t v36 = "Unable to set posix file dup2: %{errno}d";
      goto LABEL_70;
    }
    goto LABEL_71;
  }
LABEL_53:
  if (a11)
  {
    int v39 = posix_spawn_file_actions_addinherit_np(&v94, 0);
    if (v39)
    {
      int v20 = v39;
      int v34 = *__error();
      id v35 = _sa_logt();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v36 = "Unable to inherit stdin: %{errno}d";
        goto LABEL_70;
      }
      goto LABEL_71;
    }
  }
  else if (a12)
  {
    if (pipe(v97))
    {
      int v20 = *__error();
      int v34 = *__error();
      id v35 = _sa_logt();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v36 = "Unable to open pipe: %{errno}d";
        goto LABEL_70;
      }
      goto LABEL_71;
    }
    int v41 = posix_spawn_file_actions_adddup2(&v94, v97[0], 0);
    if (v41)
    {
      int v20 = v41;
      int v34 = *__error();
      id v35 = _sa_logt();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v36 = "Unable to set posix file dup2: %{errno}d";
        goto LABEL_70;
      }
      goto LABEL_71;
    }
  }
  else
  {
    int v40 = posix_spawn_file_actions_addclose(&v94, 0);
    if (v40)
    {
      int v20 = v40;
      int v34 = *__error();
      id v35 = _sa_logt();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v96) = v20;
        uint64_t v36 = "Unable to set posix close: %{errno}d";
        goto LABEL_70;
      }
      goto LABEL_71;
    }
  }
  posix_spawnattr_t v93 = 0;
  int v42 = posix_spawnattr_init(&v93);
  if (v42)
  {
    int v20 = v42;
    int v34 = *__error();
    id v35 = _sa_logt();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      uint64_t v36 = "Unable to create posix attr: %{errno}d";
      goto LABEL_70;
    }
    goto LABEL_71;
  }
  if (a5)
  {
    int v45 = posix_spawnattr_setbinpref_np(&v93, 1uLL, a5, 0);
    if (v45)
    {
      int v20 = v45;
      int v46 = *__error();
      uint64_t v47 = _sa_logt();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
LABEL_90:

        *__error() = v46;
LABEL_121:
        posix_spawnattr_destroy(&v93);
LABEL_72:
        posix_spawn_file_actions_destroy(&v94);
        if ((v28 & 0x80000000) != 0) {
          goto LABEL_74;
        }
        goto LABEL_73;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      long long v85 = "Unable to set posix arch preference: %{errno}d";
LABEL_143:
      _os_log_error_impl(&dword_1BF22B000, v47, OS_LOG_TYPE_ERROR, v85, buf, 8u);
      goto LABEL_90;
    }
  }
  if (a6) {
    __int16 v48 = 16449;
  }
  else {
    __int16 v48 = 16385;
  }
  a6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", &unk_1F1A9AEF0, @"validation-category", 0);
  if (a2)
  {
    uint64_t v49 = SANSStringForCString(a2);
    if (!v49)
    {
LABEL_118:
      int v82 = *__error();
      id v83 = _sa_logt();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        long long v96 = a2;
        _os_log_error_impl(&dword_1BF22B000, v83, OS_LOG_TYPE_ERROR, "Unable to create NSString for signing identifier %s", buf, 0xCu);
      }

      *__error() = v82;
      int v20 = 22;
      goto LABEL_121;
    }
    uint64_t v50 = (void *)v49;
    [a6 setObject:v49 forKey:@"signing-identifier"];
  }
  id v92 = 0;
  uint64_t v51 = [MEMORY[0x1E4FBA180] withVersion:1 withConstraintCategory:0 withRequirements:a6 withError:&v92];
  id v52 = v92;
  if (!v51)
  {
    int v57 = *__error();
    uint64_t v58 = _sa_logt();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      long long v86 = [v52 description];
      *(_DWORD *)buf = 138412290;
      long long v96 = v86;
      _os_log_error_impl(&dword_1BF22B000, v58, OS_LOG_TYPE_ERROR, "Unable to set code requirement: %@", buf, 0xCu);
    }
    *__error() = v57;

    int v20 = 76;
    goto LABEL_121;
  }
  id v53 = [v51 externalRepresentation];
  [v53 bytes];
  [v53 length];
  int v54 = amfi_launch_constraint_set_spawnattr();
  if (v54)
  {
    int v20 = v54;
    int v55 = *__error();
    uint64_t v56 = _sa_logt();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v96) = v20;
      _os_log_error_impl(&dword_1BF22B000, v56, OS_LOG_TYPE_ERROR, "Unable to set amfi posix launch constraint: %{errno}d", buf, 8u);
    }

    *__error() = v55;
    goto LABEL_121;
  }

  int v84 = posix_spawnattr_setflags(&v93, v48);
  if (v84)
  {
    int v20 = v84;
    int v46 = *__error();
    uint64_t v47 = _sa_logt();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      goto LABEL_90;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v96) = v20;
    long long v85 = "Unable to set posix flags: %{errno}d";
    goto LABEL_143;
  }
  pid_t v91 = -1;
  int v20 = posix_spawn(&v91, a1, &v94, &v93, a3, a4);
  posix_spawnattr_destroy(&v93);
  posix_spawn_file_actions_destroy(&v94);
  if ((v28 & 0x80000000) == 0) {
    close(v28);
  }
  if ((v99[1] & 0x80000000) == 0)
  {
    close(v99[1]);
    v99[1] = -1;
  }
  if ((v98[1] & 0x80000000) == 0)
  {
    close(v98[1]);
    v98[1] = -1;
  }
  if ((v97[0] & 0x80000000) == 0)
  {
    close(v97[0]);
    v97[0] = -1;
  }
  if (v20 || v91 < 1)
  {
    if ((v99[0] & 0x80000000) == 0) {
      close(v99[0]);
    }
    int v43 = v98[0];
    if (v98[0] < 0) {
      goto LABEL_84;
    }
LABEL_83:
    close(v43);
LABEL_84:
    if ((v97[1] & 0x80000000) == 0) {
      close(v97[1]);
    }
    *__error() = v20;
    return 0xFFFFFFFFLL;
  }
  if (a8) {
    *a8 = v99[0];
  }
  if (a10) {
    *a10 = v98[0];
  }
  if (a12) {
    *a12 = v97[1];
  }
  *__error() = 0;
  return v91;
}

uint64_t SASpawnPlatformBinaryWithSigningIdentifier(const char *a1, void *a2, char *const *a3, char *const *a4, cpu_type_t *a5, int a6, _DWORD *a7, char a8, _DWORD *a9, char a10, _DWORD *a11)
{
  if (a2) {
    return _SASpawnPlatformBinaryWithSigningIdentifier(a1, a2, a3, a4, a5, 0, a6, a7, a8, a9, a10, a11);
  }
  int v12 = *__error();
  uint64_t v13 = _sa_logt();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "SASpawnPlatformBinaryWithSigningIdentifier requires a signing identifier", buf, 2u);
  }

  *__error() = v12;
  _SASetCrashLogMessage(901, "SASpawnPlatformBinaryWithSigningIdentifier requires a signing identifier", v14, v15, v16, v17, v18, v19, v20);
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t SAExecPlatformBinaryWithSigningIdentifier(const char *a1, void *a2, char *const *a3, char *const *a4, cpu_type_t *a5)
{
  return *__error();
}

BOOL SAShouldIgnoreSegmentWithCName(char *a1)
{
  return strstr(a1, "PAGEZERO") || strstr(a1, "LINKEDIT") || strstr(a1, "DWARF") || strstr(a1, "UNICODE") != 0;
}

void SASymbolOwnerForeachSegment(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v3 = v4;
  CSSymbolOwnerForeachSegment();
}

uint64_t __SASymbolOwnerForeachSegment_block_invoke(uint64_t a1)
{
  Name = (char *)CSRegionGetName();
  uint64_t result = SACompareDyldToCSLevel();
  if ((int)result >= 2)
  {
    uint64_t Range = CSRegionGetRange();
    uint64_t v6 = v5;
    uint64_t v7 = Range + v5;
    uint64_t v8 = (const char *)CSSymbolOwnerGetName();
    uint64_t result = printf("CS   %#18llx - %#18llx (%#10llx) %16s %s\n", Range, v7, v6, Name, v8);
  }
  if (Name)
  {
    uint64_t result = SAShouldIgnoreSegmentWithCName(Name);
    if ((result & 1) == 0)
    {
      uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
      return v9();
    }
  }
  return result;
}

BOOL SASymbolOwnerIsContiguous(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t BaseAddress = CSSymbolOwnerGetBaseAddress();
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = -1;
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __SASymbolOwnerIsContiguous_block_invoke;
  v18[3] = &unk_1E63F8CD0;
  v18[4] = &v31;
  v18[5] = &v23;
  v18[6] = &v27;
  v18[7] = &v19;
  SASymbolOwnerForeachSegment(a1, a2, v18);
  if (BaseAddress && BaseAddress != v28[3])
  {
    int v9 = *__error();
    uint64_t v10 = _sa_logt();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t Name = CSSymbolOwnerGetName();
      uint64_t v16 = v28[3];
      CSSymbolOwnerGetSegmentWithAddress();
      uint64_t v17 = CSRegionGetName();
      *(_DWORD *)buf = 136315906;
      uint64_t v36 = Name;
      __int16 v37 = 2048;
      uint64_t v38 = BaseAddress;
      __int16 v39 = 2048;
      uint64_t v40 = v16;
      __int16 v41 = 2080;
      uint64_t v42 = v17;
      _os_log_debug_impl(&dword_1BF22B000, v10, OS_LOG_TYPE_DEBUG, "SymbolOwner %s base address 0x%llx != start address 0x%llx for segment %s", buf, 0x2Au);
    }

    *__error() = v9;
  }
  if (a3)
  {
    uint64_t v11 = v28[3];
    uint64_t v12 = v24[3] - v11;
    *a3 = v11;
    a3[1] = v12;
  }
  if (a4) {
    *a4 = v32[3];
  }
  BOOL v13 = BaseAddress == v28[3] && v20[3] == v24[3] - BaseAddress;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  return v13;
}

void sub_1BF2A94A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

unint64_t __SASymbolOwnerIsContiguous_block_invoke(void *a1)
{
  ++*(void *)(*(void *)(a1[4] + 8) + 24);
  unint64_t result = CSRegionGetRange();
  uint64_t v4 = *(void *)(a1[5] + 8);
  if (*(void *)(v4 + 24) < result + v3) {
    *(void *)(v4 + 24) = result + v3;
  }
  uint64_t v5 = *(void *)(a1[6] + 8);
  if (*(void *)(v5 + 24) > result) {
    *(void *)(v5 + 24) = result;
  }
  *(void *)(*(void *)(a1[7] + 8) + 24) += v3;
  return result;
}

id SACopySanitizedString(void *a1, int a2, unint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (v5)
  {
    if (a2 && [v5 rangeOfString:@"[^\\S ]" options:1024] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[^\\S ]", @" ", 1024, 0, objc_msgSend(v6, "length"));

      uint64_t v6 = (void *)v7;
    }
    if (a3 && [v6 length] > a3)
    {
      uint64_t v8 = objc_msgSend(v6, "substringWithRange:", 0, a3);

      uint64_t v6 = (void *)v8;
    }
  }
  return v6;
}

id SACachedNSString(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (qword_1EB6991F0 != -1) {
    dispatch_once(&qword_1EB6991F0, &__block_literal_global_113);
  }
  os_unfair_lock_lock(&stru_1EB6991CC);
  id v2 = [(id)qword_1EB6991E8 member:v1];
  if (!v2)
  {
    uint64_t v3 = [v1 copy];
    if (!v3)
    {
      int v5 = *__error();
      uint64_t v6 = _sa_logt();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v15 = [v1 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v6, OS_LOG_TYPE_ERROR, "Unable to copy %s", buf, 0xCu);
      }

      *__error() = v5;
      char v7 = [v1 UTF8String];
      _SASetCrashLogMessage(1334, "Unable to copy %s", v8, v9, v10, v11, v12, v13, v7);
      _os_crash();
      __break(1u);
    }
    id v2 = (void *)v3;
    [(id)qword_1EB6991E8 addObject:v3];
  }
  os_unfair_lock_unlock(&stru_1EB6991CC);

  return v2;
}

id SANSStringForCString(void *a1)
{
  id v1 = a1;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[[NSString alloc] initWithUTF8String:a1];
  uint64_t v3 = v2;
  if (v2)
  {
    id v1 = SACachedNSString(v2);
  }
  else if (v1)
  {
    int v4 = *__error();
    int v5 = _sa_logt();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      uint64_t v8 = v1;
      _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "Unable to get NSString for cstr '%s'", (uint8_t *)&v7, 0xCu);
    }

    id v1 = 0;
    *__error() = v4;
  }

  return v1;
}

uint64_t SAArchitectureForTranslatedTask(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (CSArchitectureIsArm64())
    {
      return 0x301000007;
    }
    else if ((CSArchitectureIsX86_64() & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __SAArchitectureForTranslatedTask_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = v1;
      if (SAArchitectureForTranslatedTask_onceToken != -1) {
        dispatch_once(&SAArchitectureForTranslatedTask_onceToken, block);
      }
      return 0;
    }
  }
  return v1;
}

int *__SAArchitectureForTranslatedTask_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  uint64_t v1 = _sa_logt();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    Familyuint64_t Name = CSArchitectureGetFamilyName();
    _os_log_error_impl(&dword_1BF22B000, v1, OS_LOG_TYPE_ERROR, "Unknown translation architecture %s", (uint8_t *)&v3, 0xCu);
  }

  unint64_t result = __error();
  *unint64_t result = v0;
  return result;
}

id _DictGet(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKeyedSubscript:a2];
  if (v2 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

id DictGetDict(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  uint64_t v5 = _DictGet(v4, (uint64_t)v3);

  return v5;
}

id DictGetString(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  uint64_t v5 = _DictGet(v4, (uint64_t)v3);

  return v5;
}

id DictGetNumber(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  uint64_t v5 = _DictGet(v4, (uint64_t)v3);

  return v5;
}

id DictGetArray(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  uint64_t v5 = _DictGet(v4, (uint64_t)v3);

  return v5;
}

void __DictDoAllClassesMatch_block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

id DictGetDictOfClasses(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a1;
  objc_opt_class();
  uint64_t v9 = _DictGet(v8, (uint64_t)v7);

  if (!v9) {
    goto LABEL_4;
  }
  id v10 = v9;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __DictDoAllClassesMatch_block_invoke;
  v14[3] = &unk_1E63F8CF8;
  v14[5] = a3;
  v14[6] = a4;
  v14[4] = &v15;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];
  int v11 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  if (v11) {
    id v12 = v10;
  }
  else {
LABEL_4:
  }
    id v12 = 0;

  return v12;
}

void sub_1BF2A9F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DictGetArrayOfClass(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  uint64_t v5 = _DictGet(v4, (uint64_t)v3);

  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v11 = v6;
  }
  else
  {
LABEL_12:
    id v11 = 0;
  }

  return v11;
}

uint64_t SAResampleThreads(pid_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (getpid() != a1)
  {
    if (SAResampleThreads_timedOut)
    {
      uint64_t v7 = 49;
      goto LABEL_22;
    }
    context = (void *)MEMORY[0x1C18A6A20]();
    task_inspect_t target_task = 0;
    uint64_t v7 = task_read_for_pid();
    if (v7)
    {
      if (!kill(a1, 0))
      {
        int v8 = *__error();
        uint64_t v9 = _sa_logt();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)uint64_t v60 = 67109376;
          *(_DWORD *)&v60[4] = a1;
          LOWORD(v61) = 1024;
          *(_DWORD *)((char *)&v61 + 2) = v7;
          _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "[%d] task_read_for_pid failed: %d", v60, 0xEu);
        }

        *__error() = v8;
      }
      goto LABEL_21;
    }
    uint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4FA8AB8]) initWithTask:target_task options:96];
    if (v34)
    {
      thread_act_array_t act_list = 0;
      mach_msg_type_number_t act_listCnt = 0;
      uint64_t v7 = task_threads(target_task, &act_list, &act_listCnt);
      if (!v7)
      {
        if (act_listCnt)
        {
          unint64_t v15 = 0;
          uint64_t v7 = 0;
          char v33 = 1;
          do
          {
            mach_port_name_t v16 = act_list[v15];
            if (SAResampleThreads_timedOut == 1)
            {
              mach_port_deallocate(*MEMORY[0x1E4F14960], act_list[v15]);
            }
            else
            {
              *(void *)thread_info_out = 0;
              uint64_t v48 = 0;
              uint64_t v49 = 0;
              mach_msg_type_number_t thread_info_outCnt = 6;
              if (thread_info(v16, 4u, thread_info_out, &thread_info_outCnt)
                || (uint64_t v17 = *(void *)thread_info_out,
                    [NSNumber numberWithUnsignedLongLong:*(void *)thread_info_out],
                    uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                    int v19 = [v5 containsObject:v18],
                    v18,
                    !v19))
              {
                mach_port_deallocate(*MEMORY[0x1E4F14960], v16);
              }
              else
              {
                *(void *)uint64_t v60 = 0;
                uint64_t v61 = v60;
                uint64_t v62 = 0x3032000000;
                uint64_t v63 = __Block_byref_object_copy__3;
                uint64_t v64 = __Block_byref_object_dispose__3;
                id v65 = 0;
                uint64_t v42 = 0;
                uint64_t v43 = &v42;
                uint64_t v44 = 0x2020000000;
                char v45 = 0;
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __SAResampleThreads_block_invoke;
                block[3] = &unk_1E63F8D20;
                uint64_t v38 = v60;
                id v37 = v34;
                __int16 v39 = &v42;
                mach_port_name_t v40 = v16;
                task_inspect_t v41 = target_task;
                dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
                uint64_t v21 = dispatch_get_global_queue(33, 0);
                dispatch_async(v21, v20);

                dispatch_time_t v22 = dispatch_time(0, 1000000000);
                if (dispatch_block_wait(v20, v22))
                {
                  SAResampleThreads_timedOut = 1;
                  proc_name(a1, buffer, 0x21u);
                  int v23 = *__error();
                  int v24 = _sa_logt();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    int v54 = buffer;
                    __int16 v55 = 1024;
                    pid_t v56 = a1;
                    __int16 v57 = 2048;
                    uint64_t v58 = v17;
                    _os_log_error_impl(&dword_1BF22B000, v24, OS_LOG_TYPE_ERROR, "Timed out resampling %s [%d] thread 0x%llx", buf, 0x1Cu);
                  }

                  *__error() = v23;
                  uint64_t v25 = (unsigned int *)(v43 + 3);
                  __swp(v25, v25);
                  if (v25)
                  {
                    int v28 = *__error();
                    uint64_t v29 = _sa_logt();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_error_impl(&dword_1BF22B000, v29, OS_LOG_TYPE_ERROR, "Timed out sampler, but lost race", buf, 2u);
                    }

                    *__error() = v28;
                    mach_port_deallocate(*MEMORY[0x1E4F14960], v16);
                  }
                  else
                  {
                    char v33 = 0;
                  }
                  uint64_t v7 = 49;
                }
                else
                {
                  if ((v43[3] & 1) == 0)
                  {
                    int v30 = *__error();
                    oslog = _sa_logt();
                    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
                    {
                      *(_WORD *)uint64_t buffer = 0;
                      _os_log_fault_impl(&dword_1BF22B000, oslog, OS_LOG_TYPE_FAULT, "racebit not true", buffer, 2u);
                    }

                    *__error() = v30;
                  }
                  mach_port_deallocate(*MEMORY[0x1E4F14960], v16);
                  uint64_t v26 = [*((id *)v61 + 5) backtrace];
                  uint64_t v27 = [*((id *)v61 + 5) backtraceLength];
                  if (v26 && v27) {
                    v6[2](v6, v17, v26, v27);
                  }
                }

                _Block_object_dispose(&v42, 8);
                _Block_object_dispose(v60, 8);
              }
            }
            ++v15;
          }
          while (v15 < act_listCnt);
          mach_vm_size_t v31 = 4 * act_listCnt;
        }
        else
        {
          uint64_t v7 = 0;
          mach_vm_size_t v31 = 0;
          char v33 = 1;
        }
        mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)act_list, v31);
        if ((v33 & 1) == 0) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
      int v10 = *__error();
      id v11 = _sa_logt();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v60 = 67109376;
        *(_DWORD *)&v60[4] = a1;
        LOWORD(v61) = 1024;
        *(_DWORD *)((char *)&v61 + 2) = v7;
        _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "[%d] task_threads failed: %d", v60, 0xEu);
      }

      id v12 = __error();
    }
    else
    {
      int v10 = *__error();
      long long v13 = _sa_logt();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v60 = 67109120;
        *(_DWORD *)&v60[4] = a1;
        _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "[%d] unable to create VMUSampler", v60, 8u);
      }

      id v12 = __error();
      uint64_t v7 = 0;
    }
    *id v12 = v10;
LABEL_19:
    mach_port_deallocate(*MEMORY[0x1E4F14960], target_task);
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  uint64_t v7 = 16;
LABEL_22:

  return v7;
}

void sub_1BF2AA844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void __SAResampleThreads_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sampleThread:*(unsigned int *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = (unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  __swp(v5, v5);
  if (v5)
  {
    int v6 = *__error();
    uint64_t v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_INFO, "Sampler completed after timeout", v9, 2u);
    }

    *__error() = v6;
    int v8 = (ipc_space_t *)MEMORY[0x1E4F14960];
    mach_port_deallocate(*MEMORY[0x1E4F14960], *(_DWORD *)(a1 + 56));
    mach_port_deallocate(*v8, *(_DWORD *)(a1 + 60));
  }
}

id SAExecutablePath(int a1, const char *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1 < 1)
  {
    id v4 = 0;
    goto LABEL_31;
  }
  if (a2)
  {
    if (*a2) {
      uint64_t v3 = a2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    if (v6) {
      size_t v6 = (2 * v6);
    }
    else {
      size_t v6 = 1024;
    }
    if (v5) {
      free(v5);
    }
    id v5 = malloc_type_calloc(v6, 1uLL, 0x9CE85D66uLL);
    int v7 = proc_pidpath(a1, v5, v6);
  }
  while (v7 >= (int)v6);
  if (!v7)
  {
    if (kill(a1, 0))
    {
      id v4 = 0;
    }
    else
    {
      int v13 = *__error();
      long long v14 = _sa_logt();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v16 = *__error();
        int v17 = 67109376;
        *(_DWORD *)uint64_t v18 = a1;
        *(_WORD *)&v18[4] = 1024;
        *(_DWORD *)&v18[6] = v16;
        _os_log_error_impl(&dword_1BF22B000, v14, OS_LOG_TYPE_ERROR, "unable to get path for %d: %{errno}d", (uint8_t *)&v17, 0xEu);
      }

      id v4 = 0;
      *__error() = v13;
    }
    goto LABEL_30;
  }
  if (v3)
  {
    int v8 = rindex((const char *)v5, 47);
    if (!v8)
    {
      int v11 = *__error();
      id v12 = _sa_logt();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315650;
        *(void *)uint64_t v18 = v3;
        *(_WORD *)&void v18[8] = 1024;
        int v19 = a1;
        __int16 v20 = 2080;
        uint64_t v21 = v5;
        _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "%s [%d] path %s has no path components", (uint8_t *)&v17, 0x1Cu);
      }
      goto LABEL_26;
    }
    uint64_t v9 = v8 + 1;
    size_t v10 = strlen(v3);
    if (strncmp(v3, v9, v10))
    {
      int v11 = *__error();
      id v12 = _sa_logt();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v17 = 136315650;
        *(void *)uint64_t v18 = v3;
        *(_WORD *)&void v18[8] = 1024;
        int v19 = a1;
        __int16 v20 = 2080;
        uint64_t v21 = v5;
        _os_log_debug_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_DEBUG, "%s [%d] exec'ed into %s", (uint8_t *)&v17, 0x1Cu);
      }
LABEL_26:

      id v4 = 0;
      *__error() = v11;
      goto LABEL_30;
    }
  }
  id v4 = SANSStringForCString(v5);
LABEL_30:
  free(v5);
LABEL_31:
  return v4;
}

unsigned char *SAFilepathForCString(unsigned char *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    if (!*a1)
    {
LABEL_11:
      a1 = 0;
      goto LABEL_15;
    }
    if (*a1 == 47 && a1[1]) {
      goto LABEL_10;
    }
    uint64_t v2 = a1 - 1;
    do
    {
      int v4 = *(unsigned __int8 *)++v2;
      int v3 = v4;
    }
    while ((v4 - 48) > 0xFFFFFFFD);
    if (v3)
    {
      if (strcmp(v2, "<unknown>"))
      {
        a1 = v2;
LABEL_10:
        SANSStringForCString(a1);
        a1 = (unsigned char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      goto LABEL_11;
    }
    int v5 = *__error();
    size_t v6 = _sa_logt();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      size_t v10 = v1;
      _os_log_debug_impl(&dword_1BF22B000, v6, OS_LOG_TYPE_DEBUG, "%s is not a filepath", (uint8_t *)&v9, 0xCu);
    }

    int v7 = __error();
    a1 = 0;
    *int v7 = v5;
  }
LABEL_15:
  return a1;
}

uint64_t SAFilepathMatches(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v5)
  {
LABEL_5:
    uint64_t v8 = 1;
    if (a3) {
      *a3 = 1;
    }
    goto LABEL_10;
  }
  if (![v5 isAbsolutePath])
  {
    unint64_t v7 = [v6 length];
    if (v7 > [v5 length])
    {
      if (![v6 hasSuffix:v5])
      {
        uint64_t v8 = 0;
        goto LABEL_10;
      }
      goto LABEL_5;
    }
  }
  if (a3) {
    *a3 = 0;
  }
  uint64_t v8 = [v5 hasSuffix:v6];
LABEL_10:

  return v8;
}

uint64_t SAIsEmbeddedPlatform(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1
    || ([v1 containsString:@"macOS"] & 1) != 0
    || ([v2 containsString:@"Mac"] & 1) != 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v2 containsString:@"OS X"] ^ 1;
  }

  return v3;
}

double SATimeOfBootForLiveMachine()
{
  if (qword_1EB699200 != -1) {
    dispatch_once(&qword_1EB699200, &__block_literal_global_139);
  }
  return *(double *)&qword_1EB6991F8;
}

double __SATimeOfBootForLiveMachine_block_invoke()
{
  double v0 = (double)time(0);
  uint64_t v1 = mach_continuous_time();
  double result = v0 - ceil(SASecondsFromMachTimeUsingLiveTimebase(v1)) - *MEMORY[0x1E4F1CF78];
  qword_1EB6991F8 = *(void *)&result;
  return result;
}

void SAComplainAboutUnknownThreadPolicyVersion(int a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __SAComplainAboutUnknownThreadPolicyVersion_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v2 = a1;
  if (SAComplainAboutUnknownThreadPolicyVersion_onceToken != -1) {
    dispatch_once(&SAComplainAboutUnknownThreadPolicyVersion_onceToken, block);
  }
}

int *__SAComplainAboutUnknownThreadPolicyVersion_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  uint64_t v3 = _sa_logt();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v5 = *(_DWORD *)(a1 + 32);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_fault_impl(&dword_1BF22B000, v3, OS_LOG_TYPE_FAULT, "Unknown thread policy version %d! Thread QoS ipc overrides and promotions will be missing", (uint8_t *)v6, 8u);
  }

  double result = __error();
  *double result = v2;
  return result;
}

uint64_t SASerializableIndexForPointerFromSerializationDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v4)
  {
    unint64_t v15 = @"nil serialization dictionary";
    goto LABEL_11;
  }
  int v5 = v4;
  if (!v3)
  {
    uint64_t v13 = -1;
    goto LABEL_7;
  }
  id v6 = [(id)objc_opt_class() classDictionaryKey];
  uint64_t v7 = [v5 objectForKey:v6];

  id v8 = v7;
  if (!v8)
  {
    unint64_t v15 = @"Invalid pointer-to-index dictionary";
    goto LABEL_11;
  }
  int v9 = v8;
  size_t v10 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:v3];
  uint64_t v11 = [v9 objectForKey:v10];
  if (!v11)
  {
    unint64_t v15 = @"Could not find index for pointer";
LABEL_11:
    id v16 = +[SAException exceptionWithName:@"Encoding failure" reason:v15 userInfo:0];
    objc_exception_throw(v16);
  }
  id v12 = v11;
  uint64_t v13 = [v11 longLongValue];

LABEL_7:
  return v13;
}

char *_pointerInBufferForIndexWithClass(void *a1, unint64_t a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a1;
  if (a2 == -1)
  {
    int v12 = *__error();
    a2 = _sa_logt();
    if (os_log_type_enabled((os_log_t)a2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "null index", buf, 2u);
    }

    *__error() = v12;
    _SASetCrashLogMessage(107, "null index", v13, v14, v15, v16, v17, v18, v37);
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  id v7 = v6;
  id v8 = (unint64_t *)[v7 bytes];
  unint64_t v4 = *v8;
  if (*v8 <= a2)
  {
LABEL_11:
    int v19 = *__error();
    __int16 v20 = _sa_logt();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v39 = a2;
      __int16 v40 = 2048;
      unint64_t v41 = v4;
      _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, "index %llu < numInstances %llu", buf, 0x16u);
    }

    *__error() = v19;
    _SASetCrashLogMessage(112, "index %llu < numInstances %llu", v21, v22, v23, v24, v25, v26, a2);
    _os_crash();
    __break(1u);
    goto LABEL_14;
  }
  id v3 = v8 + 1;
  unint64_t v9 = v8[a2 + 1];
  size_t v10 = (char *)&v8[v4 + 1] + v9;
  if (v4 - 1 > a2)
  {
    unint64_t v2 = a2 + 1;
    if (v3[a2 + 1] > v9) {
      goto LABEL_7;
    }
LABEL_14:
    int v27 = *__error();
    uint64_t v28 = _sa_logt();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      unint64_t v29 = v3[v2];
      uint64_t v30 = v3[a2];
      *(_DWORD *)buf = 134218752;
      unint64_t v39 = v2;
      __int16 v40 = 2048;
      unint64_t v41 = v29;
      __int16 v42 = 2048;
      unint64_t v43 = a2;
      __int16 v44 = 2048;
      uint64_t v45 = v30;
      _os_log_error_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_ERROR, "index %llu (%llu) <= index %llu (%llu)", buf, 0x2Au);
    }

    *__error() = v27;
    _SASetCrashLogMessage(121, "index %llu (%llu) <= index %llu (%llu)", v31, v32, v33, v34, v35, v36, v2);
    _os_crash();
    __break(1u);
  }
  [v7 length];
LABEL_7:

  return v10;
}

BOOL SASerializableAddInstanceToSerializationDictionaryWithClassKey(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v5 || !v6 || (id v8 = v7) == 0)
  {
    uint64_t v22 = @"Invalid arguments";
    goto LABEL_15;
  }
  id v9 = [v5 objectForKey:v7];
  if (!v9)
  {
    id v10 = v8;
    id v11 = v5;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v9 setObject:v12 forKey:@"AddedObjectList"];

    [v11 setObject:v9 forKey:v10];
    if (!v9)
    {
      uint64_t v22 = @"Failed to add new pointer-to-index dictionary";
      goto LABEL_15;
    }
  }
  uint64_t v13 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:v6];
  uint64_t v14 = [v9 objectForKey:v13];

  if (v14) {
    goto LABEL_11;
  }
  uint64_t v15 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedLongLong:", objc_msgSend(v9, "count") - 1);
  [v9 setObject:v15 forKey:v13];
  uint64_t v16 = [v9 objectForKey:@"AddedObjectList"];
  if (!v16)
  {
    uint64_t v22 = @"No ordering list";
LABEL_15:
    id v23 = +[SAException exceptionWithName:@"Encoding failure" reason:v22 userInfo:0];
    objc_exception_throw(v23);
  }
  uint64_t v17 = (void *)v16;
  uint64_t v18 = objc_alloc_init(SAObjectListEntry);
  __int16 v20 = v18;
  if (v18)
  {
    objc_setProperty_atomic(v18, v19, v6, 8);
    v20->_size = [v6 sizeInBytesForSerializedVersion];
  }
  else
  {
    [v6 sizeInBytesForSerializedVersion];
  }
  [v17 addObject:v20];

LABEL_11:
  return v14 == 0;
}

id SASerializableNewDataBufferDictionaryFromSerializationDictionary(void *a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v37 = v1;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [v1 allKeys];
  uint64_t v38 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v38)
  {
    uint64_t v35 = *(void *)v46;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v45 + 1) + 8 * v2);
        id v4 = [v37 objectForKey:v3];
        id v43 = v37;
        if (!v4)
        {
          uint64_t v32 = @"Invalid pointer-to-index dictionary";
          goto LABEL_41;
        }
        id v5 = [v4 objectForKey:@"AddedObjectList"];
        if (!v5)
        {
          uint64_t v32 = @"Could not get order added list";
          goto LABEL_41;
        }
        id v6 = v5;
        if (![v5 count])
        {
          uint64_t v32 = @"No elements in order added list";
          goto LABEL_41;
        }
        uint64_t v7 = [v6 count] + 1;
        if (v7 != [v4 count])
        {
          uint64_t v32 = @"Mismatched order added list length and pointer-to-index dictionary entry count";
          goto LABEL_41;
        }
        uint64_t v39 = v3;
        uint64_t v40 = v2;
        size_t v8 = 8 * [v6 count] + 8;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v9 = v6;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v54 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v53 + 1) + 8 * i);
              if (v14) {
                uint64_t v14 = *(void *)(v14 + 16);
              }
              v8 += v14;
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v53 objects:v59 count:16];
          }
          while (v11);
        }
        unint64_t v41 = v4;

        __int16 v44 = malloc_type_calloc(1uLL, v8, 0x91958CD7uLL);
        *__int16 v44 = [v9 count];
        uint64_t v15 = [v9 count];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v42 = v9;
        uint64_t v16 = [v42 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = 0;
          uint64_t v19 = 0;
          unint64_t v20 = (unint64_t)&v44[v15 + 1];
          uint64_t v21 = *(void *)v50;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v50 != v21) {
                objc_enumerationMutation(v42);
              }
              id v23 = *(void **)(*((void *)&v49 + 1) + 8 * v22);
              uint64_t v24 = MEMORY[0x1C18A6A20]();
              if (v20 >= (unint64_t)v44 + v8)
              {
                free(v44);
                uint64_t v32 = @"Overran the end of the buffer";
                goto LABEL_41;
              }
              uint64_t v26 = (void *)v24;
              v44[v19 + 1] = v18;
              if (v23)
              {
                if (!objc_msgSend(objc_getProperty(v23, v25, 8, 1), "addSelfToBuffer:bufferLength:withCompletedSerializationDictionary:", v20, v23[2], v43))goto LABEL_40; {
                uint64_t v27 = v23[2];
                }
                v20 += v27;
              }
              else
              {
                char v28 = [0 addSelfToBuffer:v20 bufferLength:0 withCompletedSerializationDictionary:v43];
                uint64_t v27 = 0;
                if ((v28 & 1) == 0)
                {
LABEL_40:
                  free(v44);
                  uint64_t v32 = @"Error when trying to serialize";
                  goto LABEL_41;
                }
              }
              v18 += v27;
              ++v19;
              ++v22;
            }
            while (v17 != v22);
            uint64_t v29 = [v42 countByEnumeratingWithState:&v49 objects:v58 count:16];
            uint64_t v17 = v29;
          }
          while (v29);
        }

        uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v44 length:v8 freeWhenDone:1];
        if (!v30)
        {
          uint64_t v32 = @"Ran into error trying to serialize class";
LABEL_41:
          id v33 = +[SAException exceptionWithName:@"Encoding failure" reason:v32 userInfo:0];
          objc_exception_throw(v33);
        }
        [v36 setObject:v30 forKey:v39];

        uint64_t v2 = v40 + 1;
      }
      while (v40 + 1 != v38);
      uint64_t v38 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v38);
  }

  return v36;
}

id _indexToInstanceDictionaryFromDeserializationDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (!v3 || (id v5 = v4) == 0)
  {
    id v8 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Invalid arguments" userInfo:0];
    objc_exception_throw(v8);
  }
  id v6 = [v3 objectForKey:v4];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v3 setObject:v6 forKey:v5];
  }

  return v6;
}

char *SASerializableBufferForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(unint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [a4 classDictionaryKey];
  uint64_t v10 = _indexToInstanceDictionaryFromDeserializationDictionary(v7, v9);

  if (!v10)
  {
    uint64_t v15 = @"Could not get index-to-instance dictionary";
    goto LABEL_6;
  }
  uint64_t v11 = [a4 classDictionaryKey];
  uint64_t v12 = [v8 objectForKey:v11];

  if (!v12)
  {
    uint64_t v15 = @"Could not get buffer for class";
LABEL_6:
    id v16 = +[SAException exceptionWithName:@"Decoding failure" reason:v15 userInfo:0];
    objc_exception_throw(v16);
  }
  uint64_t v13 = _pointerInBufferForIndexWithClass(v12, a1);

  return v13;
}

id _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(unint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  uint64_t v11 = v10;
  if (a1 == -1)
  {
    id v23 = 0;
    goto LABEL_31;
  }
  if (!v9 || !v10 || !a4)
  {
    uint64_t v38 = @"Decoding failure";
    uint64_t v39 = @"Invalid args";
    goto LABEL_39;
  }
  uint64_t v12 = [a4 classDictionaryKey];
  uint64_t v13 = _indexToInstanceDictionaryFromDeserializationDictionary(v9, v12);

  if (!v13)
  {
    uint64_t v38 = @"Decoding failure";
    uint64_t v39 = @"Could not get index-to-instance dictionary";
    goto LABEL_39;
  }
  id v14 = v13;
  uint64_t v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:a1];
  id v16 = [v14 objectForKey:v15];

  if (!v16 || !v16->_populated)
  {
    uint64_t v18 = [a4 classDictionaryKey];
    uint64_t v19 = [v11 objectForKey:v18];

    if (v19)
    {
      uint64_t v21 = _pointerInBufferForIndexWithClass(v19, a1);
      long long v45 = v20;
      if (v16)
      {
LABEL_26:
        if (!v16->_populated && (a5 & 1) == 0)
        {
          uint64_t v35 = (void *)MEMORY[0x1C18A6A20]();
          v16->_populated = 1;
          objc_msgSend(objc_getProperty(v16, v36, 16, 1), "populateReferencesUsingBuffer:bufferLength:andDeserializationDictionary:andDataBufferDictionary:", v21, v45, v9, v11);
        }
        id v23 = objc_getProperty(v16, v20, 16, 1);

        goto LABEL_30;
      }
      context = (void *)MEMORY[0x1C18A6A20]();
      id v42 = v21;
      if (objc_opt_respondsToSelector()) {
        uint64_t v22 = [a4 newInstanceWithoutReferencesFromSerializedBuffer:v21 bufferLength:v45 andDeserializationDictionary:v9 andDataBufferDictionary:v11];
      }
      else {
        uint64_t v22 = [a4 newInstanceWithoutReferencesFromSerializedBuffer:v21 bufferLength:v45];
      }
      uint64_t v24 = (void *)v22;
      uint64_t v25 = [SASerializeableInstance alloc];
      id v44 = v24;
      char v43 = a5;
      if (v25)
      {
        v46.receiver = v25;
        v46.super_class = (Class)SASerializeableInstance;
        uint64_t v26 = (SASerializeableInstance *)objc_msgSendSuper2(&v46, sel_init);
        uint64_t v25 = v26;
        if (v26) {
          objc_storeStrong((id *)&v26->_instance, v24);
        }
      }

      uint64_t v27 = [a4 classDictionaryKey];
      id v28 = v9;
      id v16 = v25;
      id v29 = v27;
      if (v16 && (uint64_t v30 = v29) != 0)
      {
        id v31 = [v28 objectForKey:v29];
        if (!v31)
        {
          id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v28 setObject:v31 forKey:v30];
        }
        uint64_t v32 = (void *)[objc_alloc(NSNumber) initWithUnsignedLongLong:a1];
        id v33 = [v31 objectForKey:v32];

        if (!v33)
        {
          [v31 setObject:v16 forKey:v32];

          objc_getProperty(v16, v34, 16, 1);
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            v16->_populated = 1;
          }

          a5 = v43;
          uint64_t v21 = v42;
          goto LABEL_26;
        }

        uint64_t v38 = @"Decoding failure";
        uint64_t v39 = @"Failed to add new instance to the deserialization dictionary";
      }
      else
      {
        uint64_t v38 = @"Encoding failure";
        uint64_t v39 = @"Invalid arguments";
      }
    }
    else
    {
      uint64_t v38 = @"Decoding failure";
      uint64_t v39 = @"Could not get buffer for class";
    }
LABEL_39:
    id v40 = +[SAException exceptionWithName:v38 reason:v39 userInfo:0];
    objc_exception_throw(v40);
  }
  id v23 = objc_getProperty(v16, v17, 16, 1);
LABEL_30:

LABEL_31:
  return v23;
}

id SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(unint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(a1, v7, v8, a4, 0);
  if (!v9)
  {
    id v12 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Trying to deserialize nonnull index that is null" userInfo:0];
    objc_exception_throw(v12);
  }
  id v10 = (void *)v9;

  return v10;
}

id SASerializablePartiallyDecodedNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(unint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(a1, v7, v8, a4, 1);
  if (!v9)
  {
    id v12 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Trying to partially deserialize nonnull index that is null" userInfo:0];
    objc_exception_throw(v12);
  }
  id v10 = (void *)v9;

  return v10;
}

uint64_t __SASerializationVerifyEverythingIsPopulated_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_108];
}

void __SASerializationVerifyEverythingIsPopulated_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  if (!v4 || (v4[8] & 1) == 0)
  {
    id v5 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Never populated an object" userInfo:0];
    objc_exception_throw(v5);
  }
}

uint64_t SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(void *a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (a2)
  {
    uint64_t v30 = a1;
    if (a1 && v7 && v8)
    {
      id v10 = malloc_type_malloc(8 * a2, 0xEBFA48B9uLL);
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (!v12) {
        goto LABEL_16;
      }
      uint64_t v13 = v12;
      unint64_t v14 = 0;
      uint64_t v15 = *(void *)v32;
      while (1)
      {
        uint64_t v16 = 0;
        if (a2 >= v14) {
          unint64_t v17 = a2 - v14;
        }
        else {
          unint64_t v17 = 0;
        }
        do
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v11);
          }
          if (v17 == v16)
          {
            int v20 = *__error();
            uint64_t v21 = _sa_logt();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              unint64_t v36 = v14;
              __int16 v37 = 2048;
              unint64_t v38 = a2;
              _os_log_error_impl(&dword_1BF22B000, v21, OS_LOG_TYPE_ERROR, "i %llu >= numIndices %llu", buf, 0x16u);
            }

            *__error() = v20;
            _SASetCrashLogMessage(452, "i %llu >= numIndices %llu", v22, v23, v24, v25, v26, v27, v14);
            _os_crash();
            __break(1u);
LABEL_21:
            free(v10);
            id v28 = @"Got bad index";
LABEL_22:
            id v29 = +[SAException exceptionWithName:@"Encoding failure" reason:v28 userInfo:0];
            objc_exception_throw(v29);
          }
          uint64_t v18 = SASerializableIndexForPointerFromSerializationDictionary(*(void **)(*((void *)&v31 + 1) + 8 * v16), v9);
          *((void *)v10 + v14) = v18;
          if (v18 == -1) {
            goto LABEL_21;
          }
          ++v14;
          ++v16;
        }
        while (v13 != v16);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (!v13)
        {
LABEL_16:

          memcpy(v30, v10, 8 * a2);
          free(v10);
          goto LABEL_17;
        }
      }
    }
    id v28 = @"Invalid arguments";
    goto LABEL_22;
  }
LABEL_17:

  return 1;
}

id _newMutableCollectionFromIndexList(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (!a1 || !v11 || (uint64_t v13 = v12) == 0 || !a5)
  {
    id v21 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Invalid args" userInfo:0];
    objc_exception_throw(v21);
  }
  unint64_t v14 = objc_msgSend((id)objc_msgSend(a6, "alloc"), "initWithCapacity:", a2);
  if (a2)
  {
    uint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(*(void *)(a1 + 8 * v15), v11, v13, a5, 0);
      if (!v16) {
        break;
      }
      unint64_t v17 = (void *)v16;
      [v14 addObject:v16];

      if (a2 == ++v15) {
        goto LABEL_13;
      }
    }
    int v18 = *__error();
    uint64_t v19 = _sa_logt();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v22 = 134217984;
      uint64_t v23 = v15;
      _os_log_error_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_ERROR, "Could not deserialize item %llu", (uint8_t *)&v22, 0xCu);
    }

    *__error() = v18;
  }
LABEL_13:

  return v14;
}

id SASerializableNewMutableArrayFromIndexList(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_class();
  id v12 = _newMutableCollectionFromIndexList(a1, a2, v10, v9, a5, v11);

  return v12;
}

id SASerializableNewMutableSetFromIndexList(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_opt_class();
  id v12 = _newMutableCollectionFromIndexList(a1, a2, v10, v9, a5, v11);

  return v12;
}

id SASerializableNewMutableDictionaryFromIndexList(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  if (!a6 || !a5 || (uint64_t v13 = v12) == 0 || !a2 || !a1 || !v11)
  {
    id v21 = @"Invalid args";
LABEL_18:
    id v22 = +[SAException exceptionWithName:@"Decoding failure" reason:v21 userInfo:0];
    objc_exception_throw(v22);
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = (unint64_t *)(a1 + 16);
  do
  {
    if (*(v15 - 2) != 2557891634)
    {
      id v21 = @"Bad SASerializedIndexKeyValuePair magic";
      goto LABEL_18;
    }
    uint64_t v16 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(*(v15 - 1), v11, v13, a5, 0);
    if (!v16)
    {
      id v21 = @"Could not deserialize key";
      goto LABEL_18;
    }
    unint64_t v17 = (void *)v16;
    uint64_t v18 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(*v15, v11, v13, a6, 0);
    if (!v18)
    {
      id v21 = @"Could not deserialize value";
      goto LABEL_18;
    }
    uint64_t v19 = (void *)v18;
    [v14 setObject:v18 forKey:v17];

    v15 += 3;
    --a2;
  }
  while (a2);

  return v14;
}

id SASerializableNewMutableDictionaryOfArraysFromIndexList(void *a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v9 = a3;
  id v10 = a4;
  if (!a6 || !a5 || (id v11 = v10) == 0 || !a2 || !a1 || !v9)
  {
    int v20 = @"Invalid args";
    goto LABEL_19;
  }
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v12 = 0;
  do
  {
    if (*a1 != 4277001967)
    {
      int v20 = @"Bad SASerializedIndexKeyArrayLengthPair magic";
      goto LABEL_19;
    }
    uint64_t v13 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(a1[1], v9, v11, a5, 0);
    if (!v13)
    {
      int v20 = @"Could not deserialize key for header";
      goto LABEL_19;
    }
    id v14 = (void *)v13;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a1[2])
    {
      uint64_t v16 = 0;
      while (1)
      {
        uint64_t v17 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(a1[v16 + 3], v9, v11, a6, 0);
        if (!v17) {
          break;
        }
        uint64_t v18 = (void *)v17;
        [v15 addObject:v17];

        if ((unint64_t)++v16 >= a1[2]) {
          goto LABEL_14;
        }
      }
      int v20 = @"Could not deserialize value";
LABEL_19:
      id v21 = +[SAException exceptionWithName:@"Decoding failure" reason:v20 userInfo:0];
      objc_exception_throw(v21);
    }
LABEL_14:
    [v22 setObject:v15 forKey:v14];
    a1 += a1[2] + 3;

    ++v12;
  }
  while (v12 != a2);

  return v22;
}

id FilterArrayToCallTreeFrames(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) == 0 || ([v6 isTruncatedLeafCallstack])
        {

          id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v1, "count") - 1);
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v9 = v1;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v17;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v17 != v12) {
                  objc_enumerationMutation(v9);
                }
                id v14 = *(void **)(*((void *)&v16 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (objc_msgSend(v14, "isTruncatedLeafCallstack", (void)v16) & 1) == 0)
                {
                  [v8 addObject:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v11);
          }

          id v7 = (void *)[v8 copy];
          goto LABEL_22;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  id v7 = (void *)[v1 copy];
LABEL_22:

  return v7;
}

char *init_io_histograms()
{
  double v0 = (char *)malloc_type_malloc(0xF38uLL, 0x10000403AFA9047uLL);
  id v1 = v0;
  if (v0)
  {
    bzero(v0, 0xF38uLL);
    for (uint64_t i = 0; i != 2912; i += 728)
    {
      *(_DWORD *)&v1[i + 984] = 29;
      bzero(&v1[i + 992], 0x2B8uLL);
      memmove(&v1[i + 992], &io_latency_histogram_template, 0x2B8uLL);
    }
    uint64_t v3 = 0;
    *(_DWORD *)id v1 = 9;
    *(_OWORD *)(v1 + _Block_object_dispose(&STACK[0x3D0], 8) = 0u;
    *(_OWORD *)(v1 + 24) = 0u;
    *(_OWORD *)(v1 + 40) = 0u;
    *(_OWORD *)(v1 + 56) = 0u;
    *(_OWORD *)(v1 + 72) = 0u;
    *(_OWORD *)(v1 + 8_Block_object_dispose(&STACK[0x3D0], 8) = 0u;
    *(_OWORD *)(v1 + 104) = 0u;
    *(_OWORD *)(v1 + 120) = 0u;
    *(_OWORD *)(v1 + 136) = 0u;
    *(_OWORD *)(v1 + 152) = 0u;
    *(_OWORD *)(v1 + 16_Block_object_dispose(&STACK[0x3D0], 8) = 0u;
    *(_OWORD *)(v1 + 184) = 0u;
    *(_OWORD *)(v1 + 200) = 0u;
    *((void *)v1 + 27) = 0;
    uint64_t v4 = 4096;
    *((void *)v1 + 2) = 4096;
    do
    {
      id v5 = &v1[v3];
      *((void *)v5 + 4) = v4;
      v4 *= 2;
      *((void *)v5 + 5) = v4;
      v3 += 24;
    }
    while (v3 != 192);
  }
  return v1;
}

uint64_t print_io_histograms(unsigned int *a1, char *a2, const char *a3)
{
  int v35 = (int)a3;
  long long v34 = a2;
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a3 >= 0x2000)
  {
    if ((safe_snprintf(&v34, a2, a3, &v35, "IO Size Histogram:\n") & 0x80000000) == 0
      && (safe_snprintf(&v34, v5, v6, &v35, "     %s      %s            %s                     %s\n", "Begin", "End", "Frequency", "CDF") & 0x80000000) == 0)
    {
      if (*a1)
      {
        unint64_t v9 = 0;
        uint64_t v10 = 0;
        uint64_t v11 = a1 + 4;
        do
        {
          v10 += v11[1];
          if ((safe_snprintf(&v34, v7, v8, &v35, "%*lluKB%*lluKB\t\t%*llu\t\t%*llu\n", 8, *(v11 - 1) >> 10, 8, *v11 >> 10, 8, v11[1], 8, v10) & 0x80000000) != 0)return 0xFFFFFFFFLL; {
          v11 += 3;
          }
          ++v9;
          unint64_t v12 = *a1;
        }
        while (v9 < v12);
        unsigned int v13 = v12 - 1;
      }
      else
      {
        uint64_t v10 = 0;
        unsigned int v13 = -1;
      }
      if ((safe_snprintf(&v34, v7, v8, &v35, "%*s%*lluKB\t\t%*llu\t\t%*llu\n", 10, ">", 8, *(void *)&a1[6 * v13 + 4] >> 10, 8, *((void *)a1 + 90), 8, *((void *)a1 + 90) + v10) & 0x80000000) == 0)
      {
        uint64_t v16 = 0;
        for (uint64_t i = a1 + 252; ; i += 182)
        {
          if (*(void *)&a1[16 * v16 + 182])
          {
            if ((safe_snprintf(&v34, v14, v15, &v35, "Tier %u Latency Histogram:\n", v16) & 0x80000000) != 0
              || (safe_snprintf(&v34, v18, v19, &v35, "      %s        %s                %s                    %s\n", "Begin", "End", "Freq", "CDF") & 0x80000000) != 0)
            {
              return 0xFFFFFFFFLL;
            }
            long long v22 = &a1[182 * v16 + 246];
            if (*v22)
            {
              unint64_t v23 = 0;
              uint64_t v24 = 0;
              uint64_t v25 = i;
              while (1)
              {
                v24 += *(void *)v25;
                if ((safe_snprintf(&v34, v20, v21, &v35, "%*lluus%*lluus\t\t%*llu\t\t%*llu\n", 9, *((void *)v25 - 2), 9, *((void *)v25 - 1), 9, *(void *)v25, 9, v24) & 0x80000000) != 0)return 0xFFFFFFFFLL; {
                v25 += 6;
                }
                ++v23;
                unint64_t v26 = *v22;
                if (v23 >= v26)
                {
                  unsigned int v27 = v26 - 1;
                  goto LABEL_22;
                }
              }
            }
            uint64_t v24 = 0;
            unsigned int v27 = -1;
LABEL_22:
            if ((safe_snprintf(&v34, v20, v21, &v35, "%*s%*lluus\t\t%*llu\t\t%*llu\n", 10, ">", 9, *(void *)&a1[182 * v16 + 250 + 6 * v27], 9, *(void *)&a1[182 * v16 + 426], 9, *(void *)&a1[182 * v16 + 426] + v24) & 0x80000000) != 0)return 0xFFFFFFFFLL; {
          }
            }
          if (++v16 == 4)
          {
            uint64_t v28 = 0;
            for (uint64_t j = a1 + 182;
                  !*j
               || (safe_snprintf(&v34, v14, v15, &v35, "Tier %u Aggregate Stats:\n", v28) & 0x80000000) == 0
               && (safe_snprintf(&v34, v30, v31, &v35, "\tNum IOs %llu Latency Mean %lluus Max Latency %lluus Latency SD %lluus\n", *j, j[1] / *j, j[3], (unint64_t)sqrt((double)(unint64_t)(j[2] / *j - j[1] / *j * (j[1] / *j)))) & 0x80000000) == 0&& (safe_snprintf(&v34, v32, v33, &v35, "\tReads %llu (%llu KB) Writes %llu (%llu KB)\n", j[4], j[5] >> 10, j[6], j[7] >> 10) & 0x80000000) == 0;
                  j += 8)
            {
              uint64_t result = 0;
              if (++v28 == 4) {
                return result;
              }
            }
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t safe_snprintf(char **a1, _DWORD *a2, const char *a3, ...)
{
  va_start(va, a3);
  unsigned int v4 = vsnprintf(*a1, *a2, a3, va);
  if ((v4 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v5 = v4;
  unsigned int v7 = *a2 - v4;
  BOOL v6 = *a2 > v4;
  if (*a2 < v4) {
    unsigned int v7 = 0;
  }
  *a2 = v7;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *a1 += v5;
  return result;
}

unsigned int *update_histograms_stats(unsigned int *result, unsigned int a2, unint64_t a3, unint64_t a4, int a5)
{
  if (result)
  {
    unsigned int v5 = &result[16 * (unint64_t)a2];
    ++*((void *)v5 + 91);
    *((void *)v5 + 92) += a4;
    *((void *)v5 + 93) += a4 * a4;
    if (*((void *)v5 + 94) < a4) {
      *((void *)v5 + 94) = a4;
    }
    BOOL v6 = &result[16 * (unint64_t)a2];
    if (a5)
    {
      *((void *)v6 + 96) += a3;
      unsigned int v7 = v6 + 190;
    }
    else
    {
      *((void *)v6 + 98) += a3;
      unsigned int v7 = v6 + 194;
    }
    ++*v7;
    uint64_t v8 = result[182 * a2 + 246];
    if (v8)
    {
      uint64_t v9 = 0;
      uint64_t v10 = &result[182 * a2 + 252];
      while (*((void *)v10 - 1) < a4)
      {
        ++v9;
        v10 += 6;
        if (v8 == v9) {
          goto LABEL_15;
        }
      }
      ++*(void *)v10;
    }
    else
    {
      LODWORD(v9) = 0;
    }
    if (v9 == v8) {
LABEL_15:
    }
      ++*(void *)&result[182 * a2 + 426];
    uint64_t v11 = *result;
    if (v11)
    {
      unint64_t v12 = result + 6;
      while (*(v12 - 1) < a3)
      {
        v12 += 3;
        if (!--v11) {
          goto LABEL_20;
        }
      }
    }
    else
    {
LABEL_20:
      unint64_t v12 = result + 180;
    }
    ++*v12;
  }
  return result;
}

double SACFAbsoluteTimeFromTimespec(uint64_t a1)
{
  return (double)*(uint64_t *)a1 - *MEMORY[0x1E4F1CF78] + (double)*(unint64_t *)(a1 + 8) / 1000000000.0;
}

void sub_1BF2C20FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v46 - 232), 8);
  _Block_object_dispose((const void *)(v46 - 200), 8);
  _Unwind_Resume(a1);
}

uint64_t SAMachTimeFromSecondsUsingTimebase(uint64_t a1, double a2)
{
  uint64_t result = 0;
  if (a1 && HIDWORD(a1))
  {
    uint64_t result = (unint64_t)(a2 * 1000000000.0);
    if (HIDWORD(a1) != a1) {
      return __udivti3();
    }
  }
  return result;
}

double SASecondsFromMachTimeUsingLiveTimebase(uint64_t a1)
{
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  }
  if (qword_1EB699210) {
    BOOL v2 = HIDWORD(qword_1EB699210) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    a1 = 0;
  }
  else if (qword_1EB699210 != HIDWORD(qword_1EB699210))
  {
    a1 = __udivti3();
  }
  return (double)(unint64_t)a1 / 1000000000.0;
}

uint64_t SAMachTimeFromSecondsUsingLiveTimebase(double a1)
{
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  }
  if (qword_1EB699210) {
    BOOL v2 = HIDWORD(qword_1EB699210) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  uint64_t result = (unint64_t)(a1 * 1000000000.0);
  if (HIDWORD(qword_1EB699210) != qword_1EB699210) {
    return __udivti3();
  }
  return result;
}

uint64_t SANanosecondsFromMachTimeUsingLiveTimebase(uint64_t a1)
{
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  }
  if (qword_1EB699210) {
    BOOL v2 = HIDWORD(qword_1EB699210) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  if (qword_1EB699210 != HIDWORD(qword_1EB699210)) {
    return __udivti3();
  }
  return a1;
}

uint64_t SAMachTimeFromNanosecondsUsingLiveTimebase(uint64_t a1)
{
  if (_MergedGlobals_7 != -1) {
    dispatch_once(&_MergedGlobals_7, &__block_literal_global_9);
  }
  if (qword_1EB699210) {
    BOOL v2 = HIDWORD(qword_1EB699210) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  if (HIDWORD(qword_1EB699210) != qword_1EB699210) {
    return __udivti3();
  }
  return a1;
}

double SAMachAbsTimeSecondsGetCurrent()
{
  uint64_t v0 = mach_absolute_time();
  return SASecondsFromMachTimeUsingLiveTimebase(v0);
}

double SAMachContTimeSecondsGetCurrent()
{
  uint64_t v0 = mach_continuous_time();
  return SASecondsFromMachTimeUsingLiveTimebase(v0);
}

uint64_t CopyDyldSnapshotForPid(BOOL a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  uint64_t v24 = (double *)&v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  if (getpid() == a1)
  {
    uint64_t v2 = mach_absolute_time();
    double v3 = SASecondsFromMachTimeUsingLiveTimebase(v2);
    if (!dyld_process_create_for_current_task())
    {
      int v7 = *__error();
      uint64_t v8 = _sa_logt();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_FAULT, "Unable to get dyld process for current process", buf, 2u);
      }
      goto LABEL_17;
    }
    BOOL v18 = 0;
    uint64_t v4 = dyld_process_snapshot_create_for_process();
    v20[3] = v4;
    if (v4)
    {
      uint64_t v5 = mach_absolute_time();
      double v6 = SASecondsFromMachTimeUsingLiveTimebase(v5);
      v24[3] = v6 - v3;
    }
    dyld_process_dispose();
    if (!v20[3])
    {
      int v7 = *__error();
      uint64_t v8 = _sa_logt();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v28 = v18;
        _os_log_fault_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_FAULT, "Unable to get dyld process snapshot for current process: %d", buf, 8u);
      }
LABEL_17:

      uint64_t v13 = 0;
      *__error() = v7;
      goto LABEL_18;
    }
  }
  else
  {
    if (_AvoidSuspendingPid(a1)) {
      goto LABEL_14;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CopyDyldSnapshotForPid_block_invoke;
    block[3] = &unk_1E63F9000;
    BOOL v17 = a1;
    void block[4] = &v19;
    void block[5] = &v23;
    uint64_t v9 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    v9[2]();
    BOOL v10 = v20[3] == 0;

    if (v10)
    {
LABEL_14:
      uint64_t v13 = 0;
      goto LABEL_18;
    }
  }
  ++_MergedGlobals_8;
  *(double *)&qword_1EB699220 = v24[3] + *(double *)&qword_1EB699220;
  int v11 = *__error();
  unint64_t v12 = _sa_logt();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *((void *)v24 + 3);
    *(_DWORD *)buf = 67110144;
    BOOL v28 = a1;
    __int16 v29 = 2048;
    uint64_t v30 = v15;
    __int16 v31 = 1024;
    int v32 = _MergedGlobals_8;
    __int16 v33 = 2048;
    uint64_t v34 = qword_1EB699220;
    __int16 v35 = 2048;
    double v36 = *(double *)&qword_1EB699220 / (double)_MergedGlobals_8;
    _os_log_debug_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_DEBUG, "[%d]: Inspected live process via dyld introspection in %fs (%d totaling %fs, %fs avg)", buf, 0x2Cu);
  }

  *__error() = v11;
  uint64_t v13 = v20[3];
LABEL_18:
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v13;
}

void sub_1BF2C467C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

int *__CopyDyldSnapshotForPid_block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (ipc_space_t *)MEMORY[0x1E4F14960];
  int v3 = task_read_for_pid();
  if (v3)
  {
    int v4 = v3;
    int v5 = kill(*(_DWORD *)(a1 + 48), 0);
    int v6 = *__error();
    int v7 = _sa_logt();
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109120;
        int v22 = v9;
        _os_log_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_INFO, "Unable to inspect [%d] since it's no longer alive", buf, 8u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v18 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109376;
      int v22 = v18;
      __int16 v23 = 1024;
      int v24 = v4;
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "Unable to inspect [%d]: %d", buf, 0xEu);
    }

    uint64_t result = __error();
    *uint64_t result = v6;
  }
  else
  {
    uint64_t v10 = mach_absolute_time();
    double v11 = SASecondsFromMachTimeUsingLiveTimebase(v10);
    if (dyld_process_create_for_task())
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = dyld_process_snapshot_create_for_process();
      if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        uint64_t v12 = mach_absolute_time();
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = SASecondsFromMachTimeUsingLiveTimebase(v12) - v11;
      }
      dyld_process_dispose();
      uint64_t result = (int *)mach_port_deallocate(*v2, 0);
      if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
      {
        int v14 = *__error();
        uint64_t v15 = _sa_logt();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v20 = *(_DWORD *)(a1 + 48);
          *(_DWORD *)buf = 67109376;
          int v22 = v20;
          __int16 v23 = 1024;
          int v24 = 0;
          _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "Unable to get dyld process snapshot for [%d]: %d", buf, 0xEu);
        }

        uint64_t result = __error();
        *uint64_t result = v14;
      }
    }
    else
    {
      int v16 = *__error();
      BOOL v17 = _sa_logt();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v19 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109376;
        int v22 = v19;
        __int16 v23 = 1024;
        int v24 = 0;
        _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "Unable to get dyld process for [%d]: %d", buf, 0xEu);
      }

      *__error() = v16;
      return (int *)mach_port_deallocate(*v2, 0);
    }
  }
  return result;
}

uint64_t _CopyLoadInfosForDyldSnapshot(uint64_t a1, int a2, int a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  uint64_t shared_cache = dyld_process_snapshot_get_shared_cache();
  if (shared_cache)
  {
    uint64_t v15 = shared_cache;
    MEMORY[0x1C18A6390]();
    MEMORY[0x1C18A63A0](v15);
    if (a6 || a3)
    {
      int v16 = +[SASharedCache sharedCacheWithDyldSharedCache:]((uint64_t)SASharedCache, v15);
      BOOL v17 = v16;
      if (a6) {
        *a6 = v16;
      }
    }
    if (a5) {
      goto LABEL_26;
    }
  }
  else
  {
    if (a2)
    {
      int v18 = *__error();
      int v19 = _sa_logt();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = a2;
        _os_log_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_INFO, "[%d] No shared cache", buf, 8u);
      }

      *__error() = v18;
    }
    if (a5) {
      goto LABEL_26;
    }
  }
  if (!a7 && (a3 & 1) == 0 && !a8) {
    return 0;
  }
LABEL_26:
  if (a5) {
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v21 = 0;
  }
  *(void *)buf = 0;
  __int16 v31 = buf;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  id v22 = v21;
  dyld_process_snapshot_for_each_image();
  uint64_t v20 = *((unsigned int *)v31 + 6);
  if (!v20 && a5)
  {
    if ([v22 count])
    {
      +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v22);
    }
    else
    {
      int v23 = *__error();
      int v24 = _sa_logt();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)BOOL v28 = 67109120;
        int v29 = a2;
        _os_log_fault_impl(&dword_1BF22B000, v24, OS_LOG_TYPE_FAULT, "No non-shared cache load infos for [%d]", v28, 8u);
      }

      *__error() = v23;
    }
    *a5 = (id)[v22 copy];
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

void sub_1BF2C4CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t DyldImageEnumerateSegments(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __DyldImageEnumerateSegments_block_invoke;
  v10[3] = &unk_1E63F9028;
  uint64_t v12 = &v14;
  uint64_t v13 = a1;
  id v4 = v3;
  id v11 = v4;
  int v5 = MEMORY[0x1C18A62C0](a1, v10);
  int v6 = *((_DWORD *)v15 + 6);
  if (v6 > 0) {
    unsigned int v7 = -v6;
  }
  else {
    unsigned int v7 = 0x80000000;
  }
  if (v5) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v7;
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_1BF2C4E08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void __DyldImageEnumerateSegments_block_invoke(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  if (qword_1EB699228 != -1) {
    dispatch_once(&qword_1EB699228, &__block_literal_global_10);
  }
  if (dword_1EB69921C >= 2)
  {
    uint64_t v8 = DyldImagePath(a1[6]);
    printf("dyld %#18llx - %#18llx (%#10llx) %16s %s\n", a3, a4 + a3, a4, a2, v8);
  }
  if (a2)
  {
    if (!SAShouldIgnoreSegmentWithCName(a2))
    {
      ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
      uint64_t v9 = a1[4];
      if (v9)
      {
        uint64_t v10 = *(void (**)(void))(v9 + 16);
        v10();
      }
    }
  }
}

uint64_t SACompareDyldToCSLevel()
{
  if (qword_1EB699228 != -1) {
    dispatch_once(&qword_1EB699228, &__block_literal_global_10);
  }
  return dword_1EB69921C;
}

const char *DyldImagePath(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (const char *)MEMORY[0x1C18A62E0]();
  id v3 = v2;
  if (!v2)
  {
    uint64_t v8 = (const char *)MEMORY[0x1C18A62D0](a1);
    if (v8) {
      goto LABEL_14;
    }
LABEL_20:
    int v6 = *__error();
    unsigned int v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      uint64_t v12 = v3;
      _os_log_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_INFO, "No absolute path from dyld: %s", (uint8_t *)&v11, 0xCu);
    }
LABEL_22:
    uint64_t v8 = v3;
LABEL_23:

    *__error() = v6;
    return v8;
  }
  if (*v2 == 47)
  {
    if (qword_1EB699228 != -1) {
      dispatch_once(&qword_1EB699228, &__block_literal_global_10);
    }
    if (dword_1EB69921C < 2) {
      return v3;
    }
    id v4 = (const char *)MEMORY[0x1C18A62D0](a1);
    if (!v4) {
      return v3;
    }
    int v5 = v4;
    if (!strcmp(v3, v4)) {
      return v3;
    }
    int v6 = *__error();
    unsigned int v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      uint64_t v12 = v3;
      __int16 v13 = 2080;
      uint64_t v14 = v5;
      _os_log_debug_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_DEBUG, "preferring dyld installname %s vs file_path %s", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_22;
  }
  uint64_t v9 = (const char *)MEMORY[0x1C18A62D0](a1);
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v8 = v9;
  if (*v9 != 47) {
    goto LABEL_20;
  }
LABEL_14:
  if (qword_1EB699228 == -1)
  {
    if (!v3) {
      return v8;
    }
  }
  else
  {
    dispatch_once(&qword_1EB699228, &__block_literal_global_10);
    if (!v3) {
      return v8;
    }
  }
  if (dword_1EB69921C >= 2 && strcmp(v3, v8))
  {
    int v6 = *__error();
    unsigned int v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315394;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      uint64_t v14 = v3;
      _os_log_debug_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_DEBUG, "preferring dyld file_path %s vs installname %s", (uint8_t *)&v11, 0x16u);
    }
    goto LABEL_23;
  }
  return v8;
}

const char *__SACompareDyldToCSLevel_block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t result = getenv("SA_COMPARE_DYLD_TO_CS");
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (const char *)strtol(result, 0, 0);
    dword_1EB69921C = (int)result;
    if (result >= 3)
    {
      int v2 = *__error();
      id v3 = _sa_logt();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        int v11 = dword_1EB69921C;
        __int16 v12 = 2080;
        __int16 v13 = v1;
        _os_log_error_impl(&dword_1BF22B000, v3, OS_LOG_TYPE_ERROR, "SA_COMPARE_DYLD_TO_CS of %d invalid (from %s)", buf, 0x12u);
      }

      *__error() = v2;
      _SASetCrashLogMessage(328, "SA_COMPARE_DYLD_TO_CS of %d invalid (from %s)", v4, v5, v6, v7, v8, v9, dword_1EB69921C);
      _os_crash();
      __break(1u);
    }
  }
  return result;
}

void sub_1BF2C55FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _saos_printf_frame_timerange(void *a1, unint64_t a2, unint64_t a3)
{
  id v5 = a1;
  if (a2 <= a3)
  {
    id v6 = v5;
    objc_msgSend(v5, "printWithFormat:", @" %lu", a2);
    id v5 = v6;
    if (a2 != a3)
    {
      objc_msgSend(v6, "printWithFormat:", @"-%lu", a3);
      id v5 = v6;
    }
  }
}

uint64_t _saos_printf_state_appended_noparens(void *a1, uint64_t a2, uint64_t *a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!a3)
  {
    BOOL v11 = v8 != 0;
    if (a2 || v8)
    {
      if (a2)
      {
        uint64_t v13 = [v7 appendString:@"suspended"];
        if ((a2 & 4) == 0) {
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v13 = 0;
        if ((a2 & 4) == 0) {
          goto LABEL_27;
        }
      }
      goto LABEL_20;
    }
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_81;
  }
  uint64_t v10 = *a3;
  BOOL v11 = v8 != 0;
  if (!v8 && v10 == a2) {
    goto LABEL_9;
  }
  LOBYTE(v12) = v10 ^ a2;
  if (((v10 ^ a2) & 1) == 0)
  {
    uint64_t v13 = 0;
    if (((v10 ^ a2) & 4) != 0) {
      goto LABEL_20;
    }
LABEL_17:
    if ((a2 & 4) != 0) {
      goto LABEL_26;
    }
LABEL_25:
    if (!(v10 & 4 | v12 & 2))
    {
LABEL_26:
      unint64_t v15 = a2 & 0x7F8;
      BOOL v16 = v15 != 0;
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  if (a2) {
    uint64_t v14 = @"suspended";
  }
  else {
    uint64_t v14 = @"unsuspended";
  }
  uint64_t v13 = [v7 appendString:v14];
  uint64_t v10 = *a3;
  uint64_t v12 = *a3 ^ a2;
  if ((v12 & 4) == 0) {
    goto LABEL_17;
  }
LABEL_20:
  if ((int)v13 >= 1) {
    LODWORD(v13) = [v7 appendString:@", "] + v13;
  }
  if ((a2 & 4) == 0)
  {
    uint64_t v13 = [v7 appendString:@"not running"] + v13;
    if (a3)
    {
      uint64_t v10 = *a3;
      uint64_t v12 = *a3 ^ a2;
      goto LABEL_25;
    }
LABEL_27:
    if ((a2 & 2) == 0)
    {
      LODWORD(v15) = a2 & 0x7F8;
      if ((a2 & 0x7F8) == 0) {
        goto LABEL_59;
      }
      goto LABEL_45;
    }
LABEL_30:
    if ((int)v13 >= 1) {
      LODWORD(v13) = [v7 appendString:@", "] + v13;
    }
    if ((a2 & 2) != 0) {
      int v17 = @"runnable";
    }
    else {
      int v17 = @"not runnable";
    }
    goto LABEL_36;
  }
  int v17 = @"running";
LABEL_36:
  uint64_t v13 = [v7 appendString:v17] + v13;
  unint64_t v15 = a2 & 0x7F8;
  BOOL v16 = v15 != 0;
  if (!a3)
  {
    if ((a2 & 0x7F8) == 0) {
      goto LABEL_59;
    }
    goto LABEL_45;
  }
  uint64_t v10 = *a3;
LABEL_38:
  if ((v16 ^ ((v10 & 0x7F8) != 0))) {
    goto LABEL_46;
  }
  char v18 = !v16;
  if ((v10 & 0x7F8) == 0) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0 && (v15 >> 3) != (v10 >> 3))
  {
LABEL_45:
    BOOL v16 = 1;
LABEL_46:
    if ((int)v13 >= 1) {
      LODWORD(v13) = [v7 appendString:@", "] + v13;
    }
    if (v16) {
      int v19 = objc_msgSend(v7, "printWithFormat:", @"on cpu %u", ((v15 >> 3) - 1));
    }
    else {
      int v19 = objc_msgSend(v7, "printWithFormat:", @"on cpu UNKNOWN", v22);
    }
    uint64_t v13 = (v19 + v13);
    if (a3)
    {
      uint64_t v10 = *a3;
      goto LABEL_53;
    }
LABEL_59:
    if ((a2 & 0x800) == 0) {
      goto LABEL_70;
    }
    goto LABEL_60;
  }
LABEL_53:
  LOWORD(v10) = v10 ^ a2;
  if ((v10 & 0x800) == 0) {
    goto LABEL_64;
  }
  if ((a2 & 0x800) != 0)
  {
LABEL_60:
    if ((int)v13 >= 1) {
      LODWORD(v13) = [v7 appendString:@", "] + v13;
    }
    uint64_t v13 = [v7 printWithFormat:@"e-core"] + v13;
    if (a3) {
      goto LABEL_63;
    }
LABEL_70:
    if ((a2 & 0x1000) == 0) {
      goto LABEL_71;
    }
LABEL_73:
    if ((int)v13 >= 1) {
      LODWORD(v13) = [v7 appendString:@", "] + v13;
    }
    uint64_t v20 = @"p-core";
    goto LABEL_76;
  }
  if ((a2 & 0x1000) == 0)
  {
    if ((int)v13 >= 1) {
      LODWORD(v13) = [v7 appendString:@", "] + v13;
    }
    uint64_t v13 = [v7 printWithFormat:@"not e-core"] + v13;
  }
LABEL_63:
  uint64_t v10 = *a3 ^ a2;
LABEL_64:
  if ((v10 & 0x1000) == 0) {
    goto LABEL_77;
  }
  if ((a2 & 0x1000) != 0) {
    goto LABEL_73;
  }
  if ((a2 & 0x800) == 0)
  {
    if ((int)v13 >= 1) {
      LODWORD(v13) = [v7 appendString:@", "] + v13;
    }
    uint64_t v20 = @"not p-core";
LABEL_76:
    uint64_t v13 = [v7 printWithFormat:v20] + v13;
LABEL_77:
    if (!v11) {
      goto LABEL_81;
    }
    goto LABEL_78;
  }
LABEL_71:
  if (!v11) {
    goto LABEL_81;
  }
LABEL_78:
  if ((int)v13 >= 1) {
    LODWORD(v13) = [v7 appendString:@", "] + v13;
  }
  uint64_t v13 = [v7 printWithFormat:@"blocked by %@", v9] + v13;
LABEL_81:

  return v13;
}

void _saos_printf_state_appended(void *a1, uint64_t a2, void *a3)
{
  if (a2 || a3)
  {
    id v5 = a3;
    id v6 = a1;
    objc_msgSend(v6, "appendString:", @" (");
    _saos_printf_state_appended_noparens(v6, a2, 0, v5);

    [v6 appendString:@""]);
  }
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1BF2C7910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BF2C9574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1BF2C992C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_shared_cache_display_string(void *a1)
{
  uint64_t v1 = a1;
  if (!v1
    || ([MEMORY[0x1E4F1CA98] null],
        int v2 = (_DWORD *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2 == v1))
  {
    id v3 = @"None";
    goto LABEL_15;
  }
  id v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [v1 slidBaseAddress];
  uint64_t v5 = [v1 slide];
  uint64_t v6 = [v1 uuid];
  id v7 = (void *)v6;
  if (v4 == -1)
  {
    if (v5 == -1) {
      [(__CFString *)v3 appendFormat:@"%@", v6, v11, v12];
    }
    else {
      -[__CFString appendFormat:](v3, "appendFormat:", @"%@ slide 0x%llx", v6, [v1 slide], v12);
    }
  }
  else
  {
    uint64_t v8 = [v1 slidBaseAddress];
    if (v5 == -1) {
      [(__CFString *)v3 appendFormat:@"%@ slid base address 0x%llx", v7, v8, v12];
    }
    else {
      -[__CFString appendFormat:](v3, "appendFormat:", @"%@ slid base address 0x%llx, slide 0x%llx", v7, v8, [v1 slide]);
    }
  }

  int v9 = v1[7];
  if (v9)
  {
    [(__CFString *)v3 appendFormat:@" (System Primary)"];
    int v9 = v1[7];
    if ((v9 & 2) == 0)
    {
LABEL_13:
      if ((v9 & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_13;
  }
  [(__CFString *)v3 appendFormat:@" (DriverKit)"];
  if ((v1[7] & 4) != 0) {
LABEL_14:
  }
    [(__CFString *)v3 appendFormat:@" (Rosetta)"];
LABEL_15:

  return v3;
}

void sub_1BF2CABB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

id seconds_string_for_nanoseconds(unint64_t a1)
{
  if (a1 <= 0x989680) {
    unint64_t v1 = 10000000;
  }
  else {
    unint64_t v1 = a1;
  }
  if (a1 >= 0x989680) {
    int v2 = "";
  }
  else {
    int v2 = "<";
  }
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s%.*fs", v2, 2, (double)v1 / 1000000000.0);
  return v3;
}

uint64_t saos_printf_seconds(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  unint64_t v6 = (unint64_t)__exp10((double)(9 - a3));
  if (v6 <= a2)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = [v5 appendString:@"<"];
    a2 = v6;
  }
  uint64_t v8 = objc_msgSend(v5, "printWithFormat:", @"%.*fs", a3, (double)a2 / 1000000000.0) + v7;

  return v8;
}

uint64_t saos_printf_time_scaled(void *a1, unint64_t a2)
{
  unint64_t v4 = a2 / 0x3B9ACA00;
  if (a2 % 0x3B9ACA00)
  {
    unint64_t v4 = a2 / 0xF4240;
    unint64_t v5 = a2 % 0xF4240;
    unint64_t v6 = a2 / 0x3E8;
    if (a2 % 0x3E8) {
      int v7 = "n";
    }
    else {
      int v7 = "u";
    }
    if (a2 % 0x3E8) {
      unint64_t v6 = a2;
    }
    BOOL v8 = v5 == 0;
    if (v5) {
      int v9 = v7;
    }
    else {
      int v9 = "m";
    }
    if (!v8) {
      unint64_t v4 = v6;
    }
  }
  else
  {
    int v9 = "";
  }
  return objc_msgSend(a1, "printWithFormat:", @"%llu%ss", v4, v9, v2, v3);
}

uint64_t saos_printf_cycles_instructions(void *a1, unint64_t a2, unint64_t a3, int a4)
{
  if (a4)
  {
    if (a3) {
      double v4 = (double)a2 / (double)a3;
    }
    else {
      double v4 = 0.0;
    }
    return [a1 printWithFormat:@" (%llu cycles, %llu instructions, %fc/i)", a2, a3, *(void *)&v4, v15, v16];
  }
  double v5 = (double)a2;
  if (a2 > 0x71AFD498D0000)
  {
    double v6 = 1.0e15;
    int v7 = "P";
LABEL_14:
    double v9 = v5 / v6;
    goto LABEL_15;
  }
  if (a2 > 0x1D1A94A2000)
  {
    double v6 = 1.0e12;
    int v7 = "T";
    goto LABEL_14;
  }
  if (a2 > 0x77359400)
  {
    double v6 = 1000000000.0;
    int v7 = "G";
    goto LABEL_14;
  }
  if (a2 > 0x1E8480)
  {
    double v6 = 1000000.0;
    int v7 = "M";
    goto LABEL_14;
  }
  double v9 = v5 / 1000.0;
  if (a2 <= 0x7D0) {
    double v9 = (double)a2;
  }
  int v7 = "";
  if (a2 > 0x7D0) {
    int v7 = "K";
  }
LABEL_15:
  double v10 = (double)a3;
  if (a3 <= 0x71AFD498D0000)
  {
    if (a3 <= 0x1D1A94A2000)
    {
      if (a3 <= 0x77359400)
      {
        if (a3 <= 0x1E8480)
        {
          double v13 = v10 / 1000.0;
          if (a3 <= 0x7D0) {
            double v13 = (double)a3;
          }
          uint64_t v12 = "";
          if (a3 > 0x7D0) {
            uint64_t v12 = "K";
          }
          goto LABEL_24;
        }
        double v11 = 1000000.0;
        uint64_t v12 = "M";
      }
      else
      {
        double v11 = 1000000000.0;
        uint64_t v12 = "G";
      }
    }
    else
    {
      double v11 = 1.0e12;
      uint64_t v12 = "T";
    }
  }
  else
  {
    double v11 = 1.0e15;
    uint64_t v12 = "P";
  }
  double v13 = v10 / v11;
LABEL_24:
  double v14 = v5 / v10;
  if (!a3) {
    double v14 = 0.0;
  }
  return [a1 printWithFormat:@" (%.1f%s cycles, %.1f%s instructions, %.2fc/i)", *(void *)&v9, v7, *(void *)&v13, v12, *(void *)&v14];
}

void saos_printf_seconds_sigfig(void *a1, double a2)
{
  unsigned int v5 = 0;
  id v3 = a1;
  double v4 = ReduceToSignificantDigits(2, &v5, a2);
  objc_msgSend(v3, "printWithFormat:", @"%.*fs", (2 - v5) & ~((int)(2 - v5) >> 31), *(void *)&v4);
}

void sub_1BF2CF50C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x330], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  _Block_object_dispose(&STACK[0x3C0], 8);
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1BF2CFD94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1BF2D287C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF2D298C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF2D2A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF2D6808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

void sub_1BF2D6CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BF2D9264(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x758], 8);
  _Block_object_dispose(&STACK[0x778], 8);
  _Block_object_dispose(&STACK[0x798], 8);
  _Block_object_dispose(&STACK[0x7C8], 8);
  _Block_object_dispose(&STACK[0x7F8], 8);
  _Block_object_dispose(&STACK[0x818], 8);
  _Block_object_dispose(&STACK[0x838], 8);
  _Block_object_dispose(&STACK[0x858], 8);
  _Block_object_dispose(&STACK[0x878], 8);
  _Block_object_dispose(&STACK[0x898], 8);
  _Block_object_dispose(&STACK[0x8B8], 8);
  _Block_object_dispose(&STACK[0x8D8], 8);
  _Unwind_Resume(a1);
}

uint64_t saos_printf_microstackshot_state(void *a1, uint64_t a2, int a3, int a4, int a5)
{
  id v9 = a1;
  double v10 = v9;
  if (a4)
  {
    uint64_t v11 = objc_msgSend(v9, "printWithFormat:", @"state 0x%x", a2);
    goto LABEL_71;
  }
  if ((a2 & 2) != (a3 & 2))
  {
    if ((a2 & 2) != 0) {
      uint64_t v16 = @"Frontmost App";
    }
    else {
      uint64_t v16 = @"Non-Frontmost App";
    }
    uint64_t v11 = [v9 appendString:v16];
    int v12 = a2 & 0x20;
    if (v12 == (a3 & 0x20)) {
      goto LABEL_18;
    }
    int v17 = [v10 appendString:@", "] + v11;
LABEL_14:
    if (v12) {
      uint64_t v18 = @"Suppressed";
    }
    else {
      uint64_t v18 = @"Non-Suppressed";
    }
    uint64_t v11 = [v10 appendString:v18] + v17;
LABEL_18:
    int v15 = a2 & 0x80;
    if (v15 == (a3 & 0x80)) {
      goto LABEL_24;
    }
    int v13 = [v10 appendString:@", "] + v11;
LABEL_20:
    if (v15) {
      int v19 = @"Kernel mode";
    }
    else {
      int v19 = @"User mode";
    }
    uint64_t v11 = [v10 appendString:v19] + v13;
LABEL_24:
    int v14 = 1;
    if (!a5) {
      goto LABEL_48;
    }
LABEL_25:
    if ((a2 & 0x10) == 0)
    {
      if ((a3 & 0x10) == 0) {
        goto LABEL_48;
      }
      if (v14) {
        LODWORD(v11) = [v10 appendString:@", "] + v11;
      }
      uint64_t v20 = @"Unknown User Activity, Unknown Power Source";
      goto LABEL_46;
    }
    if ((a3 & 0x10) == 0 || ((a3 ^ a2) & 4) != 0)
    {
      if (v14) {
        LODWORD(v11) = [v10 appendString:@", "] + v11;
      }
      if ((a2 & 4) != 0) {
        id v21 = @"User Idle";
      }
      else {
        id v21 = @"User Active";
      }
      uint64_t v11 = [v10 appendString:v21] + v11;
      if ((a3 & 0x10) != 0 && ((a3 ^ a2) & 8) == 0) {
        goto LABEL_47;
      }
    }
    else
    {
      if (((a3 ^ a2) & 8) == 0) {
        goto LABEL_48;
      }
      if (!v14) {
        goto LABEL_43;
      }
    }
    LODWORD(v11) = [v10 appendString:@", "] + v11;
LABEL_43:
    if ((a2 & 8) != 0) {
      uint64_t v20 = @"On Battery";
    }
    else {
      uint64_t v20 = @"On AC";
    }
LABEL_46:
    uint64_t v11 = [v10 appendString:v20] + v11;
LABEL_47:
    int v14 = 1;
    goto LABEL_48;
  }
  int v12 = a2 & 0x20;
  if (v12 != (a3 & 0x20))
  {
    int v17 = 0;
    goto LABEL_14;
  }
  int v13 = 0;
  uint64_t v11 = 0;
  int v14 = 0;
  int v15 = a2 & 0x80;
  if (v15 != (a3 & 0x80)) {
    goto LABEL_20;
  }
  if (a5) {
    goto LABEL_25;
  }
LABEL_48:
  if ((a2 & 0x700) == (a3 & 0x700))
  {
    unsigned int v22 = a2 & 0x3800;
    if (v22 == (a3 & 0x3800)) {
      goto LABEL_64;
    }
    if (!v14) {
      goto LABEL_59;
    }
  }
  else
  {
    if (v14) {
      LODWORD(v11) = [v10 appendString:@", "] + v11;
    }
    uint64_t v23 = ((unsigned __int16)(a2 & 0x700) >> 8) - 1;
    if (v23 >= 7) {
      int v24 = "Thread QoS Unknown";
    }
    else {
      int v24 = off_1E63F9D48[v23];
    }
    uint64_t v11 = objc_msgSend(v10, "printWithFormat:", @"Effective %s", v24) + v11;
    unsigned int v22 = a2 & 0x3800;
    if (v22 == (a3 & 0x3800)) {
      goto LABEL_63;
    }
  }
  LODWORD(v11) = [v10 appendString:@", "] + v11;
LABEL_59:
  uint64_t v25 = (v22 >> 11) - 1;
  if (v25 > 6) {
    uint64_t v26 = "Thread QoS Unknown";
  }
  else {
    uint64_t v26 = off_1E63F9D48[v25];
  }
  uint64_t v11 = objc_msgSend(v10, "printWithFormat:", @"Requested %s", v26) + v11;
LABEL_63:
  int v14 = 1;
LABEL_64:
  unsigned int v27 = a2 & 0x1C000;
  if (v27 != (a3 & 0x1C000))
  {
    if (v14) {
      LODWORD(v11) = [v10 appendString:@", "] + v11;
    }
    uint64_t v28 = (v27 >> 14) - 1;
    if (v28 > 6) {
      uint64_t v29 = "Thread QoS Unknown";
    }
    else {
      uint64_t v29 = off_1E63F9D48[v28];
    }
    uint64_t v11 = objc_msgSend(v10, "printWithFormat:", @"Override %s", v29) + v11;
  }
LABEL_71:

  return v11;
}

void sub_1BF2DF204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF2E17D0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x390], 8);
  _Block_object_dispose(&STACK[0x3B0], 8);
  _Block_object_dispose(&STACK[0x3D0], 8);
  _Block_object_dispose(&STACK[0x3F0], 8);
  _Block_object_dispose(&STACK[0x410], 8);
  _Block_object_dispose(&STACK[0x430], 8);
  _Block_object_dispose(&STACK[0x450], 8);
  _Block_object_dispose(&STACK[0x470], 8);
  _Block_object_dispose(&STACK[0x490], 8);
  _Block_object_dispose(&STACK[0x4B0], 8);
  _Block_object_dispose(&STACK[0x4D0], 8);
  _Block_object_dispose(&STACK[0x4F0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose(&STACK[0x540], 8);
  _Block_object_dispose(&STACK[0x560], 8);
  _Block_object_dispose(&STACK[0x580], 8);
  _Unwind_Resume(a1);
}

void sub_1BF2E5F4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

__CFString *StringForThreadQoS(unsigned int a1)
{
  uint64_t v1 = a1;
  id v3 = @"user interactive";
  switch(a1)
  {
    case 0u:
      id v3 = @"unspecified";
      break;
    case 1u:
      id v3 = @"maintenance";
      break;
    case 2u:
      id v3 = @"background";
      break;
    case 3u:
      id v3 = @"utility";
      break;
    case 4u:
      id v3 = @"default";
      break;
    case 5u:
      id v3 = @"user initiated";
      break;
    case 6u:
      break;
    default:
      if (@"user interactive" == 125) {
        id v3 = @"unavailable";
      }
      else {
        id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"unknown (0x%x)", v1);
      }
      break;
  }
  return v3;
}

void sub_1BF2EE484(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void saos_printf_timeline_frame(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, unint64_t a7)
{
  id v13 = a1;
  _saos_printf_frame_base(v13, a2, a3, a4, a5, a6);
  _saos_printf_frame_timerange(v13, a7 - a4 + 1, a7);
  [v13 appendString:@"\n"];
}

void saos_printf_frame_noindent(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v9 = a1;
  _saos_printf_frame_base_noindent(v9, a2, a3, a4, a5);
  [v9 appendString:@"\n"];
}

void saos_printf_timeline_frame_noindent(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5, unint64_t a6)
{
  id v11 = a1;
  _saos_printf_frame_base_noindent(v11, a2, a3, a4, a5);
  _saos_printf_frame_timerange(v11, a6 - a3 + 1, a6);
  [v11 appendString:@"\n"];
}

BOOL _microstackshot_state_has_change_to_display(int a1, int a2, char a3, int a4)
{
  BOOL v5 = a1 == a2;
  BOOL result = a1 != a2;
  if (v5 || (a3 & 1) != 0) {
    return result;
  }
  int v7 = a2 ^ a1;
  if (!a4)
  {
    if ((v7 & 0x3FA2) == 0) {
      return (v7 & 0x1C000) != 0;
    }
    return 1;
  }
  if ((v7 & 0x10) != 0) {
    return 1;
  }
  BOOL v8 = (a1 & a2 & 0x10) == 0;
  if ((v7 & 0xC) == 0) {
    BOOL v8 = 1;
  }
  BOOL result = 1;
  if ((v7 & 0x3FA2) == 0 && v8) {
    return (v7 & 0x1C000) != 0;
  }
  return result;
}

void saos_printf_frame_with_state(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, uint64_t a7, void *a8)
{
  id v15 = a8;
  id v16 = a1;
  _saos_printf_frame_base(v16, a2, a3, a4, a5, a6);
  _saos_printf_state_appended(v16, a7, v15);

  [v16 appendString:@"\n"];
}

void saos_printf_microstackshot_state_as_frame(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t *a7, unsigned int a8, int a9, char a10, unsigned __int8 a11, char a12, void *a13)
{
  id v20 = a1;
  _saos_printf_microstackshot_state_as_frame_base(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
  [v20 appendString:@"\n"];
}

void saos_printf_timeline_frame_with_state(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, uint64_t a7, void *a8, unint64_t a9)
{
  id v16 = a8;
  id v17 = a1;
  _saos_printf_frame_base(v17, a2, a3, a4, a5, a6);
  _saos_printf_state_appended(v17, a7, v16);

  _saos_printf_frame_timerange(v17, a9 - a4 + 1, a9);
  [v17 appendString:@"\n"];
}

void saos_printf_microstackshot_state_as_timeline_frame(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t *a7, unsigned int a8, int a9, char a10, unsigned __int8 a11, unint64_t a12, char a13, void *a14)
{
  id v21 = a1;
  _saos_printf_microstackshot_state_as_frame_base(v21, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a13, a14);
  _saos_printf_frame_timerange(v21, a12 - a4 + 1, a12);
  [v21 appendString:@"\n"];
}

void saos_printf_call_tree_node_noindent(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a1;
  _saos_printf_indent_and_count_noindent(v8, a2, a3, 0);
  [v8 printWithFormat:@"%@\n", v7];
}

void saos_printf_call_tree_node_without_count(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a1;
  _saos_printf_indent_and_kernel_dot(v8, a2, 0, 0);
  objc_msgSend(v8, "printWithFormat:", @"%*s  ", a3, "");
  [v8 printWithFormat:@"<%@>\n", v7];
}

uint64_t _saos_printf_indent_and_kernel_dot(void *a1, uint64_t a2, int a3, int a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  if (a2 >= 0x7FFFFFFF)
  {
    int v14 = *__error();
    id v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v23 = a2;
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "indent %u", buf, 8u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(282, "indent %u", v16, v17, v18, v19, v20, v21, a2);
    _os_crash();
    __break(1u);
  }
  id v8 = v7;
  if (a4)
  {
    id v9 = "";
    if (a3) {
      id v9 = "*";
    }
    uint64_t v10 = objc_msgSend(v7, "printWithFormat:", @"%d%s ", (a2 >> 1) - 1, v9);
  }
  else
  {
    id v11 = "";
    if (a3) {
      id v11 = "*";
    }
    uint64_t v10 = objc_msgSend(v7, "printWithFormat:", @"%*s", a2, v11);
  }
  uint64_t v12 = v10;

  return v12;
}

void _saos_printf_frame_base_noindent(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v9 = a5;
  id v10 = a1;
  _saos_printf_indent_and_count_noindent(v10, a2, a3, a4);
  [v10 appendString:v9];
}

uint64_t _saos_printf_indent_and_count_noindent(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  id v7 = a1;
  int v8 = _saos_printf_indent_and_kernel_dot(v7, a2, a4, 1);
  LODWORD(a3) = objc_msgSend(v7, "printWithFormat:", @"%lu ", a3);

  return (a3 + v8);
}

void _saos_printf_microstackshot_state_as_frame_base(void *a1, uint64_t a2, unsigned int a3, uint64_t a4, int a5, uint64_t a6, uint64_t *a7, uint64_t a8, int a9, char a10, unsigned __int8 a11, char a12, void *a13)
{
  id v33 = a1;
  id v18 = a13;
  uint64_t v29 = a8;
  BOOL v19 = _microstackshot_state_has_change_to_display(a8, a9, a10, a11);
  BOOL v20 = v19;
  uint64_t v28 = a7;
  uint64_t v31 = a6;
  if (a10)
  {
    int v21 = 0;
  }
  else
  {
    if (a7) {
      BOOL v22 = *a7 == a6;
    }
    else {
      BOOL v22 = a6 == 0;
    }
    int v21 = !v22;
  }
  if (v18) {
    int v23 = 1;
  }
  else {
    int v23 = v19;
  }
  if ((v23 & 1) != 0 || v21)
  {
    if (a12) {
      int v24 = _saos_printf_indent_and_count_noindent(v33, a2, a4, a5);
    }
    else {
      int v24 = _saos_printf_indent_and_count(v33, a2, a3, a4, a5);
    }
    if (a10)
    {
      if (v23)
      {
        objc_msgSend(v33, "printWithFormat:", @"state 0x%x", v29);
        if (v18) {
          [v33 printWithFormat:@", on behalf of %@", v18];
        }
      }
    }
    else
    {
      int v25 = [v33 appendString:@"<"] + v24;
      if (v18) {
        int v26 = [v33 printWithFormat:@"on behalf of %@", v18] + v25;
      }
      else {
        int v26 = v25;
      }
      if (v20)
      {
        if (v26 > v25) {
          v26 += [v33 appendString:@", "];
        }
        v26 += saos_printf_microstackshot_state(v33, v29, a9, 0, a11);
      }
      if (v21)
      {
        unsigned int v27 = v33;
        if (v26 > v25)
        {
          [v33 appendString:@", "];
          unsigned int v27 = v33;
        }
        _saos_printf_state_appended_noparens(v27, v31, v28, 0);
      }
      [v33 appendString:@">"];
    }
  }
}

void sub_1BF2F45BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1BF2F4A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void FreeMountStatusData(char *a1)
{
  if (a1)
  {
    uint64_t v2 = *(void ***)a1;
    if (v2)
    {
      id v3 = (void ***)(a1 + 8);
      do
      {
        if (v2[1])
        {
          free(v2[1]);
          uint64_t v2 = *(v3 - 1);
        }
        free(v2);
        double v4 = *v3++;
        uint64_t v2 = v4;
      }
      while (v4);
    }
    free(a1);
  }
}

char *CopyMountStatusData()
{
  if (qword_1EB699250 != -1) {
    dispatch_once(&qword_1EB699250, &__block_literal_global_51);
  }
  if (!_MergedGlobals_9) {
    return 0;
  }
  uint64_t v0 = 0;
  if (!dispatch_semaphore_wait((dispatch_semaphore_t)qword_1EB699240, 0))
  {
    uint64_t v0 = (char *)malloc_type_malloc((8 * (_MergedGlobals_9 + 1)) | 4, 0x5764AB8FuLL);
    uint64_t v1 = (_MergedGlobals_9 + 1);
    bzero(v0, 8 * v1);
    uint64_t v2 = (atomic_uint *)&v0[8 * v1];
    *uint64_t v2 = 2;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    double v4 = qword_1EB699248;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CopyMountStatusData_block_invoke_53;
    block[3] = &unk_1E63F9DD8;
    id v10 = v0;
    id v11 = v2;
    BOOL v5 = v3;
    id v9 = v5;
    dispatch_async(v4, block);
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      if (atomic_fetch_add_explicit(v2, 0xFFFFFFFF, memory_order_relaxed) == 1) {
        free(v0);
      }
      uint64_t v0 = 0;
    }
  }
  return v0;
}

void __CopyMountStatusData_block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  unsigned int v0 = getmntinfo(&v10, 2);
  _MergedGlobals_9 = v0;
  if (v0)
  {
    qword_1EB699238 = (uint64_t)malloc_type_calloc(v0, 0x878uLL, 0x100004087E0324AuLL);
    memcpy((void *)qword_1EB699238, v10, 2168 * _MergedGlobals_9);
  }
  else
  {
    int v1 = *__error();
    uint64_t v2 = _sa_logt();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *__error();
      double v4 = __error();
      BOOL v5 = strerror(*v4);
      *(_DWORD *)buf = 67109378;
      int v12 = v3;
      __int16 v13 = 2080;
      int v14 = v5;
      _os_log_impl(&dword_1BF22B000, v2, OS_LOG_TYPE_DEFAULT, "WARNING: getmntinfo failed: %d %s", buf, 0x12u);
    }

    *__error() = v1;
    qword_1EB699238 = 0;
    _MergedGlobals_9 = 0;
  }
  dispatch_semaphore_t v6 = dispatch_semaphore_create(1);
  id v7 = (void *)qword_1EB699240;
  qword_1EB699240 = (uint64_t)v6;

  dispatch_queue_t v8 = dispatch_queue_create("Network mount sysctl", 0);
  id v9 = (void *)qword_1EB699248;
  qword_1EB699248 = (uint64_t)v8;
}

intptr_t __CopyMountStatusData_block_invoke_53(uint64_t a1)
{
  *(void *)&v21[5] = *MEMORY[0x1E4F143B8];
  if (_MergedGlobals_9)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    unsigned int v4 = 0;
    do
    {
      uint64_t v5 = qword_1EB699238;
      size_t size = 0;
      if ((sysctl_fsid((void *)(qword_1EB699238 + v2 + 48), 0, &size) & 0x80000000) == 0)
      {
        size_t v6 = size;
        if (size >= 0x611)
        {
          int v7 = *__error();
          dispatch_queue_t v8 = _sa_logt();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)int v21 = (size - 528) >> 3;
            _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "network mount status sizing check says %ld threads are blocked, ignoring", buf, 0xCu);
          }

          *__error() = v7;
          goto LABEL_18;
        }
        id v9 = (unsigned int *)malloc_type_calloc(1uLL, size, 0x109DBD91uLL);
        if ((sysctl_fsid((void *)(v5 + v2 + 48), v9, &size) & 0x80000000) != 0)
        {
          int v12 = *__error();
          __int16 v13 = _sa_logt();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            int v14 = *__error();
            uint64_t v15 = __error();
            uint64_t v16 = strerror(*v15);
            *(_DWORD *)buf = 67109378;
            v21[0] = v14;
            LOWORD(v21[1]) = 2080;
            *(void *)((char *)&v21[1] + 2) = v16;
            _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "Unable to get netfs_status: %d %s", buf, 0x12u);
          }

          *__error() = v12;
        }
        else
        {
          if (&v9[2 * v9[130] + 132] <= (unsigned int *)((char *)v9 + v6))
          {
            *(void *)(*(void *)(a1 + 40) + 8 * v4) = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
            *(void *)(*(void *)(*(void *)(a1 + 40) + 8 * v4) + _Block_object_dispose(&STACK[0x2C0], 8) = v9;
            **(void **)(*(void *)(a1 + 40) + 8 * v4++) = v5 + v2;
            goto LABEL_18;
          }
          int v10 = *__error();
          id v11 = _sa_logt();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            unsigned int v17 = v9[130];
            *(_DWORD *)buf = 67109376;
            v21[0] = v17;
            LOWORD(v21[1]) = 2048;
            *(void *)((char *)&v21[1] + 2) = v6;
            _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "network mount status says %u threads are blocked, which is more than fits in the allocated status structure (%zu bytes), ignoring", buf, 0x12u);
          }

          *__error() = v10;
        }
        free(v9);
      }
LABEL_18:
      ++v3;
      v2 += 2168;
    }
    while (v3 < _MergedGlobals_9);
  }
  if (atomic_fetch_add_explicit(*(atomic_uint *volatile *)(a1 + 48), 0xFFFFFFFF, memory_order_relaxed) == 1) {
    free(*(void **)(a1 + 40));
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1EB699240);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sysctl_fsid(void *a1, void *a2, size_t *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  size_t v13 = 14;
  if (sysctlnametomib("vfs.generic.ctlbyfsid", v19, &v13) == -1)
  {
    int v8 = *__error();
    id v9 = _sa_logt();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = *__error();
      id v11 = __error();
      int v12 = strerror(*v11);
      *(_DWORD *)buf = 136315650;
      *(void *)uint64_t v15 = "vfs.generic.ctlbyfsid";
      *(_WORD *)&v15[8] = 1024;
      *(_DWORD *)&v15[10] = v10;
      *(_WORD *)&v15[14] = 2080;
      *(void *)&v15[16] = v12;
      _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "sysctlnametomib %s failed: %d %s", buf, 0x1Cu);
    }

    *__error() = v8;
    return 0xFFFFFFFFLL;
  }
  else
  {
    int v6 = v13;
    v19[v13] = 65546;
    memset(&v15[4], 0, 32);
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v18 = 0;
    *(_DWORD *)buf = 1;
    *(void *)uint64_t v15 = *a1;
    *(void *)&v15[12] = 0;
    *(void *)&v15[20] = 0;
    return sysctl(v19, v6 + 1, a2, a3, buf, 0x50uLL);
  }
}

void sub_1BF2FB1D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF2FC95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1BF2FF860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BF30020C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1BF306438(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF306D20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SAJSONWriteDictionaryEntry(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  [v7 appendString:@","];
  SAJSONWriteDictionaryFirstEntry(v7, (uint64_t)v6, v5);
}

void SAJSONWriteDictionaryFirstEntry(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  [v6 printWithFormat:@"\"%@\":", a2];
  SAJSONWriteItem(v6, v5);
}

void SAJSONWriteItem(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1A9C8D8])
  {
    [v15 appendString:@"{"];
    [v3 writeJSONDictionaryEntriesToStream:v15];
    unsigned int v4 = @"}";
LABEL_3:
    [v15 appendString:v4];
LABEL_11:

    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    SAJSONWriteArray(v15, v3);
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    [v15 printWithFormat:@"\"%@\"", v5];
LABEL_10:

    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v3 description];
    [v15 appendString:v5];
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = @"null";
    goto LABEL_3;
  }
  int v6 = *__error();
  id v7 = _sa_logt();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    Classuint64_t Name = object_getClassName(v3);
    _os_log_error_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_ERROR, "Not a json-compatible type: %s", buf, 0xCu);
  }

  *__error() = v6;
  char v8 = object_getClassName(v3);
  _SASetCrashLogMessage(50, "Not a json-compatible type: %s", v9, v10, v11, v12, v13, v14, v8);
  _os_crash();
  __break(1u);
}

void SAJSONWriteArray(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  [v3 appendString:@"["];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    char v9 = 1;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
        if ((v9 & 1) == 0) {
          objc_msgSend(v3, "appendString:", @",", (void)v12);
        }
        SAJSONWriteItem(v3, v11);
        char v9 = 0;
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      char v9 = 0;
    }
    while (v7);
  }

  [v3 appendString:@"]"];
}

void sub_1BF307728(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t HIDEventTimestampForKTraceEvent(uint64_t a1)
{
  uint64_t result = 0;
  int v3 = *(_DWORD *)(a1 + 48);
  if (v3 > 736428035)
  {
    if ((v3 - 736428036) <= 0x1C && ((1 << (v3 - 4)) & 0x11111111) != 0) {
      goto LABEL_24;
    }
    unsigned int v5 = v3 - 736493572;
    BOOL v6 = v5 > 0xC;
    int v7 = (1 << v5) & 0x1111;
    if (!v6 && v7 != 0) {
      goto LABEL_24;
    }
    return result;
  }
  if (v3 <= 730268055)
  {
    if (v3 != 730267892 && v3 != 730267896)
    {
      if (v3 != 730267908) {
        return result;
      }
      uint64_t v10 = a1 + 32;
      return *(void *)v10;
    }
LABEL_23:
    uint64_t v10 = a1 + 16;
    return *(void *)v10;
  }
  if ((v3 - 735576101) < 2)
  {
LABEL_24:
    uint64_t v10 = a1 + 8;
    return *(void *)v10;
  }
  if (v3 == 730268056 || v3 == 730268060) {
    goto LABEL_23;
  }
  return result;
}

const char *EventTypeString(int a1)
{
  if ((a1 - 1) > 0xB) {
    return "???";
  }
  else {
    return off_1E63FA280[a1 - 1];
  }
}

const char *TracePointString(int a1)
{
  if (a1 > 736428047)
  {
    if (a1 <= 736428063)
    {
      if (a1 > 736428055)
      {
        if (a1 == 736428056) {
          return "CGXFilterEventToConnection";
        }
        if (a1 == 736428060) {
          return "post_event_tap_data";
        }
      }
      else
      {
        if (a1 == 736428048) {
          return "sPostContinuation";
        }
        if (a1 == 736428052) {
          return "sAnnotatedContinuation";
        }
      }
    }
    else if (a1 <= 736493575)
    {
      if (a1 == 736428064) {
        return "decode_and_forward";
      }
      if (a1 == 736493572) {
        return "PushToCGEventQueue";
      }
    }
    else
    {
      switch(a1)
      {
        case 736493576:
          return "CreateAndPostEventWithCGEvent";
        case 736493580:
          return "PullEventsFromWindowServerOnConnection";
        case 736493584:
          return "ReceiveNextEventCommon (for the next event)";
      }
    }
  }
  else if (a1 <= 735576100)
  {
    if (a1 > 730268055)
    {
      if (a1 == 730268056) {
        return "Keyboard event start";
      }
      if (a1 == 730268060) {
        return "Keyboard event stop";
      }
    }
    else
    {
      if (a1 == 730267892) {
        return "Event dispatch begin";
      }
      if (a1 == 730267896) {
        return "Event dispatch end";
      }
    }
  }
  else if (a1 <= 736428035)
  {
    if (a1 == 735576101) {
      return "Entry to NSApplication sendEvent";
    }
    if (a1 == 735576102) {
      return "Return from NSApplication sendEvent";
    }
  }
  else
  {
    switch(a1)
    {
      case 736428036:
        return "hid_translation_state_append_wrapped_nxevent";
      case 736428040:
        return "CGXGetNextEvent";
      case 736428044:
        return "sHIDContinuation";
    }
  }
  return "???";
}

void _getIndexRangeForTimestamps(unint64_t *a1, void *a2, void *a3, unint64_t a4, double a5, double a6)
{
  uint64_t v11 = [a3 sampleTimestamps];
  long long v12 = v11;
  *a1 = -1;
  *a2 = 0;
  if (a5 < a6 && v11 != 0)
  {
    int v26 = v11;
    uint64_t v14 = [v11 count];
    long long v12 = v26;
    if (v14)
    {
      if (a4 == -1) {
        a4 = 0;
      }
      while (1)
      {
        unint64_t v15 = [v12 count];
        long long v12 = v26;
        if (a4 >= v15) {
          break;
        }
        long long v16 = [v26 objectAtIndexedSubscript:a4];
        [v16 machAbsTimeSeconds];
        if (v17 >= a5)
        {

          unint64_t v20 = [v26 count];
          long long v12 = v26;
          if (a4 < v20)
          {
            uint64_t v21 = 0;
            while (1)
            {
              BOOL v22 = [v12 objectAtIndexedSubscript:a4 + v21];
              [v22 machAbsTimeSeconds];
              double v24 = v23;

              if (v24 >= a6) {
                break;
              }
              ++v21;
              unint64_t v25 = [v26 count];
              long long v12 = v26;
              if (v21 + a4 >= v25) {
                goto LABEL_18;
              }
            }
            long long v12 = v26;
LABEL_18:
            if (v21)
            {
              *a1 = a4;
              *a2 = v21;
            }
          }
          break;
        }
        [v16 machAbsTimeSeconds];
        double v19 = v18;

        long long v12 = v26;
        if (v19 >= a6) {
          break;
        }
        ++a4;
      }
    }
  }
}

void _printSampleRangeForIndices(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  [v7 appendString:@"["];
  if ((a2 == -1 || a3) && (a2 != -1 || !a3))
  {
    if (a2 == -1 || (uint64_t v10 = a4 + a2, a4 + a2 + a3 <= 0))
    {
      objc_msgSend(v7, "printWithFormat:", @"%11s", "No samples", v12);
    }
    else
    {
      if (v10 <= 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = a4 + a2;
      }
      if (a3 == 1) {
        objc_msgSend(v7, "printWithFormat:", @"%7lu%4s", v11, "");
      }
      else {
        objc_msgSend(v7, "printWithFormat:", @"%5lu-%-5lu", v11, a3 + v10 - 1);
      }
    }
  }
  else
  {
    int v8 = *__error();
    char v9 = _sa_logt();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_DEFAULT, "WARNING: Non-sensical indices.", buf, 2u);
    }

    *__error() = v8;
    [v7 appendString:@"ERROR"];
  }
  [v7 appendString:@"]"];
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
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

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7450](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1F40D7470](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1F40D75D0](bundle, key);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1F40D77D0](type_id);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CSArchitectureGetArchitectureForName()
{
  return MEMORY[0x1F4115590]();
}

uint64_t CSArchitectureGetCurrent()
{
  return MEMORY[0x1F4115598]();
}

uint64_t CSArchitectureGetFamily()
{
  return MEMORY[0x1F41155A0]();
}

uint64_t CSArchitectureGetFamilyName()
{
  return MEMORY[0x1F41155A8]();
}

uint64_t CSArchitectureIs32Bit()
{
  return MEMORY[0x1F41155B8]();
}

uint64_t CSArchitectureIs64Bit()
{
  return MEMORY[0x1F41155C0]();
}

uint64_t CSArchitectureIsArm64()
{
  return MEMORY[0x1F41155D8]();
}

uint64_t CSArchitectureIsX86_64()
{
  return MEMORY[0x1F41155E8]();
}

uint64_t CSArchitectureMatchesArchitecture()
{
  return MEMORY[0x1F41155F8]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x1F4115608]();
}

uint64_t CSRangeContainsRange()
{
  return MEMORY[0x1F4115620]();
}

uint64_t CSRangeIntersectsRange()
{
  return MEMORY[0x1F4115628]();
}

uint64_t CSRegionForeachSymbol()
{
  return MEMORY[0x1F4115630]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x1F4115640]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x1F4115650]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1F4115668]();
}

uint64_t CSRetain()
{
  return MEMORY[0x1F4115678]();
}

uint64_t CSSourceInfoGetColumn()
{
  return MEMORY[0x1F4115680]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x1F41156A0]();
}

uint64_t CSSourceInfoGetPath()
{
  return MEMORY[0x1F41156A8]();
}

uint64_t CSSourceInfoGetRange()
{
  return MEMORY[0x1F41156B0]();
}

uint64_t CSSymbolForeachInlineRange()
{
  return MEMORY[0x1F41156B8]();
}

uint64_t CSSymbolForeachSourceInfo()
{
  return MEMORY[0x1F41156C0]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x1F41156D0]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x1F41156E0]();
}

uint64_t CSSymbolIsUnnamed()
{
  return MEMORY[0x1F41156F8]();
}

uint64_t CSSymbolOwnerForEachStackFrameAtAddress()
{
  return MEMORY[0x1F4115710]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x1F4115728]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x1F4115750]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x1F4115760]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x1F4115780]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x1F4115788]();
}

uint64_t CSSymbolOwnerGetSegmentWithAddress()
{
  return MEMORY[0x1F41157A0]();
}

uint64_t CSSymbolOwnerGetVersion()
{
  return MEMORY[0x1F41157D8]();
}

uint64_t CSSymbolOwnerIsDsym()
{
  return MEMORY[0x1F41157E8]();
}

uint64_t CSSymbolOwnerIsDyldSharedCache()
{
  return MEMORY[0x1F41157F8]();
}

uint64_t CSSymbolicatorCreateWithExclaveUUIDAndFlags()
{
  return MEMORY[0x1F4115848]();
}

uint64_t CSSymbolicatorCreateWithMachKernelFlagsAndNotification()
{
  return MEMORY[0x1F4115860]();
}

uint64_t CSSymbolicatorCreateWithPathArchitectureFlagsAndNotification()
{
  return MEMORY[0x1F4115870]();
}

uint64_t CSSymbolicatorCreateWithPidFlagsAndNotification()
{
  return MEMORY[0x1F4115888]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x1F41158D0]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPathFlagsAndNotification()
{
  return MEMORY[0x1F4115900]();
}

uint64_t CSSymbolicatorGetAOutSymbolOwner()
{
  return MEMORY[0x1F4115910]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x1F4115918]();
}

uint64_t CSSymbolicatorGetSharedCacheUUID()
{
  return MEMORY[0x1F4115948]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x1F4115960]();
}

uint64_t CSSymbolicatorGetSymbolOwnerCountAtTime()
{
  return MEMORY[0x1F4115978]();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithCFUUIDBytesAtTime()
{
  return MEMORY[0x1F4115988]();
}

CFDictionaryRef IOCopySystemLoadAdvisoryDetailed(void)
{
  return (CFDictionaryRef)MEMORY[0x1F40E8740]();
}

uint64_t IOPMGetLastWakeTime()
{
  return MEMORY[0x1F40E9028]();
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x1F417A738]();
}

uint64_t IOReportChannelGetFormat()
{
  return MEMORY[0x1F417A740]();
}

uint64_t IOReportChannelGetGroup()
{
  return MEMORY[0x1F417A748]();
}

uint64_t IOReportCopyChannelsForDrivers()
{
  return MEMORY[0x1F417A770]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1F417A798]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x1F417A7A8]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x1F417A7B0]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1F417A7D0]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x1F417A7F8]();
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1F40E7118](userName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t OSLogLookupPathWithUUID()
{
  return MEMORY[0x1F412AB68]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1F40D8C38]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1F40D8D08]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
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

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t __udivti3()
{
  return MEMORY[0x1F40C9D08]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint64_t amfi_launch_constraint_set_spawnattr()
{
  return MEMORY[0x1F410AA48]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int compress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x1F4182BA8](dest, destLen, source, sourceLen);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x1F4182BB8](sourceLen);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dscsym_iterate()
{
  return MEMORY[0x1F417F5E8]();
}

uint64_t dscsym_iterate_buffer()
{
  return MEMORY[0x1F417F5F0]();
}

uint64_t dyld_for_each_installed_shared_cache()
{
  return MEMORY[0x1F40CBE08]();
}

uint64_t dyld_image_content_for_segment()
{
  return MEMORY[0x1F40CBE40]();
}

uint64_t dyld_image_copy_uuid()
{
  return MEMORY[0x1F40CBE48]();
}

uint64_t dyld_image_for_each_segment_info()
{
  return MEMORY[0x1F40CBE50]();
}

uint64_t dyld_image_get_file_path()
{
  return MEMORY[0x1F40CBE58]();
}

uint64_t dyld_image_get_installname()
{
  return MEMORY[0x1F40CBE60]();
}

uint64_t dyld_process_create_for_current_task()
{
  return MEMORY[0x1F40CBE80]();
}

uint64_t dyld_process_create_for_task()
{
  return MEMORY[0x1F40CBE88]();
}

uint64_t dyld_process_dispose()
{
  return MEMORY[0x1F40CBE90]();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return MEMORY[0x1F40CBEA0]();
}

uint64_t dyld_process_snapshot_dispose()
{
  return MEMORY[0x1F40CBEA8]();
}

uint64_t dyld_process_snapshot_for_each_image()
{
  return MEMORY[0x1F40CBEB0]();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return MEMORY[0x1F40CBEB8]();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return MEMORY[0x1F40CBED0]();
}

uint64_t dyld_shared_cache_file_path()
{
  return MEMORY[0x1F40CBED8]();
}

uint64_t dyld_shared_cache_for_each_image()
{
  return MEMORY[0x1F40CBEE8]();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return MEMORY[0x1F40CBEF0]();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return MEMORY[0x1F40CBEF8]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CC070](*(void *)&a1, a2);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1F40CC100](a1, *(void *)&a2, a3);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1F40CC180](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1F40CC2E0](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
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

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x1F40CC440](a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x1F4182C20](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1F4182C30](*(void *)&fd, mode);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x1F4182C48](file, errnum);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1F4182C78](file, buf, *(void *)&len);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40CC728](*(void *)&a1, *(void *)&a2);
}

uint64_t ktrace_chunk_copy_cfdata()
{
  return MEMORY[0x1F4177E30]();
}

uint64_t ktrace_chunk_map_data()
{
  return MEMORY[0x1F4177E48]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x1F4177E60]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x1F4177E70]();
}

uint64_t ktrace_chunk_unmap_data()
{
  return MEMORY[0x1F4177E80]();
}

uint64_t ktrace_chunks()
{
  return MEMORY[0x1F4177E88]();
}

uint64_t ktrace_config_create()
{
  return MEMORY[0x1F4177E98]();
}

uint64_t ktrace_config_destroy()
{
  return MEMORY[0x1F4177EB0]();
}

uint64_t ktrace_config_get_reason()
{
  return MEMORY[0x1F4177EC0]();
}

uint64_t ktrace_config_kperf_get_action_samplers()
{
  return MEMORY[0x1F4177ED0]();
}

uint64_t ktrace_config_kperf_get_pet_mode()
{
  return MEMORY[0x1F4177ED8]();
}

uint64_t ktrace_config_kperf_get_pet_timer_id()
{
  return MEMORY[0x1F4177EE0]();
}

uint64_t ktrace_config_kperf_get_timer_action_id()
{
  return MEMORY[0x1F4177EE8]();
}

uint64_t ktrace_config_kperf_get_timer_count()
{
  return MEMORY[0x1F4177EF0]();
}

uint64_t ktrace_config_kperf_get_timer_period_ns()
{
  return MEMORY[0x1F4177EF8]();
}

uint64_t ktrace_convert_absolute_to_walltime()
{
  return MEMORY[0x1F4177F08]();
}

uint64_t ktrace_convert_timestamp_to_walltime()
{
  return MEMORY[0x1F4177F10]();
}

uint64_t ktrace_dumpbuffer_address_space_pid()
{
  return MEMORY[0x1F4177F18]();
}

uint64_t ktrace_end()
{
  return MEMORY[0x1F4177F28]();
}

uint64_t ktrace_events_all()
{
  return MEMORY[0x1F4177F30]();
}

uint64_t ktrace_events_range()
{
  return MEMORY[0x1F4177F38]();
}

uint64_t ktrace_events_single()
{
  return MEMORY[0x1F4177F40]();
}

uint64_t ktrace_get_absolute_from_timestamp()
{
  return MEMORY[0x1F4177F98]();
}

uint64_t ktrace_get_continuous_from_absolute()
{
  return MEMORY[0x1F4177FA0]();
}

uint64_t ktrace_get_continuous_from_timestamp()
{
  return MEMORY[0x1F4177FA8]();
}

uint64_t ktrace_get_execname_for_pid()
{
  return MEMORY[0x1F4177FB0]();
}

uint64_t ktrace_get_execname_for_thread()
{
  return MEMORY[0x1F4177FB8]();
}

uint64_t ktrace_get_machine()
{
  return MEMORY[0x1F4177FC0]();
}

uint64_t ktrace_get_name_for_thread()
{
  return MEMORY[0x1F4177FC8]();
}

uint64_t ktrace_get_ns_from_timestamp()
{
  return MEMORY[0x1F4177FD0]();
}

uint64_t ktrace_get_pid_for_thread()
{
  return MEMORY[0x1F4177FD8]();
}

uint64_t ktrace_is_kernel_64_bit()
{
  return MEMORY[0x1F4177FE8]();
}

uint64_t ktrace_kperf()
{
  return MEMORY[0x1F4177FF0]();
}

uint64_t ktrace_machine_active_cpus()
{
  return MEMORY[0x1F4178000]();
}

uint64_t ktrace_machine_cluster_flags()
{
  return MEMORY[0x1F4178008]();
}

uint64_t ktrace_machine_cpu_cluster()
{
  return MEMORY[0x1F4178010]();
}

uint64_t ktrace_machine_cpu_subtype()
{
  return MEMORY[0x1F4178018]();
}

uint64_t ktrace_machine_cpu_type()
{
  return MEMORY[0x1F4178020]();
}

uint64_t ktrace_machine_create_current()
{
  return MEMORY[0x1F4178028]();
}

uint64_t ktrace_machine_destroy()
{
  return MEMORY[0x1F4178030]();
}

uint64_t ktrace_machine_hw_page_size()
{
  return MEMORY[0x1F4178038]();
}

uint64_t ktrace_machine_model()
{
  return MEMORY[0x1F4178040]();
}

uint64_t ktrace_machine_os_build()
{
  return MEMORY[0x1F4178048]();
}

uint64_t ktrace_machine_os_name()
{
  return MEMORY[0x1F4178050]();
}

uint64_t ktrace_machine_os_version()
{
  return MEMORY[0x1F4178058]();
}

uint64_t ktrace_machine_os_version_extra()
{
  return MEMORY[0x1F4178060]();
}

uint64_t ktrace_machine_vm_page_size()
{
  return MEMORY[0x1F4178068]();
}

uint64_t ktrace_session_create()
{
  return MEMORY[0x1F4178070]();
}

uint64_t ktrace_session_destroy()
{
  return MEMORY[0x1F4178080]();
}

uint64_t ktrace_session_set_event_names_enabled()
{
  return MEMORY[0x1F4178098]();
}

uint64_t ktrace_set_collection_qos()
{
  return MEMORY[0x1F41780A0]();
}

uint64_t ktrace_set_completion_handler()
{
  return MEMORY[0x1F41780B0]();
}

uint64_t ktrace_set_execnames_enabled()
{
  return MEMORY[0x1F41780C8]();
}

uint64_t ktrace_set_file()
{
  return MEMORY[0x1F41780D0]();
}

uint64_t ktrace_start()
{
  return MEMORY[0x1F4178128]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40CC948]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40CCA78](*(void *)&target, address, size);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x1F40CCD50](__base, __nel, __width, __compar);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
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

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1F4181A60](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
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

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1F40CD790](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1F40CD798](a1, *(void *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1F40CD7A0](a1, *(void *)&a2, *(void *)&a3);
}

int posix_spawn_file_actions_addinherit_np(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1F40CD7A8](a1, *(void *)&a2);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40CD7B8](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1F40CD7C0](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x1F40CD7C8](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1F40CD7D0](a1);
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  return MEMORY[0x1F40CD7E0](a1, a2, a3, a4);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1F40CD7E8](a1, a2);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int proc_get_dirty(pid_t pid, uint32_t *flags)
{
  return MEMORY[0x1F40CD860](*(void *)&pid, flags);
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

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CDD88](a1, *(void *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
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

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int sysctlnametomib(const char *a1, int *a2, size_t *a3)
{
  return MEMORY[0x1F40CE3E0](a1, a2, a3);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1F40CE490]();
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1F40CE4D8](*(void *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1F40CE530](*(void *)&target_act, *(void *)&flavor, thread_info_out, thread_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int uname(utsname *a1)
{
  return MEMORY[0x1F40CE5C8](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x1F4182CF8](dest, destLen, source, sourceLen);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CE630](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1F40CE660](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CE790](__str, __size, __format, a4);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1F40CE7C8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x1F40CEB60]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}