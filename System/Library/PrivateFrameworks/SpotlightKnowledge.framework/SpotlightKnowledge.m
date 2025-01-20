id csimport_xpc_dictionary_decode_status_with_error(void *a1)
{
  id v1;
  void *v2;
  void *int64;
  const char *string;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t vars8;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    int64 = (void *)xpc_dictionary_get_int64(v1, "status");
    if (!int64) {
      goto LABEL_8;
    }
    string = xpc_dictionary_get_string(v2, "ed");
    v5 = (void *)MEMORY[0x263F087E8];
    if (string)
    {
      v6 = [NSString stringWithCString:string encoding:4];
      int64 = [v5 errorWithDomain:v6 code:int64 userInfo:0];

      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x263F087E8];
    v8 = -1;
  }
  else
  {
    v7 = (void *)MEMORY[0x263F087E8];
    v8 = 1;
  }
  int64 = [v7 errorWithDomain:@"SKGAttributeProcessorErrorDomain" code:v8 userInfo:0];
LABEL_8:

  return int64;
}

void *getValueForKey(CFDictionaryRef theDict, const void *a2)
{
  result = 0;
  value = 0;
  if (theDict && a2)
  {
    if (CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value))
    {
      if (value == (void *)*MEMORY[0x263EFFD08]) {
        return 0;
      }
      else {
        return value;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t typeToEventDataType(uint64_t result)
{
  switch((int)result)
  {
    case 1:
    case 2:
    case 3:
      return result;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 18:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 39:
    case 43:
    case 44:
    case 45:
    case 54:
      return 4;
    case 15:
    case 16:
    case 37:
    case 38:
    case 40:
    case 41:
    case 42:
    case 48:
    case 49:
    case 52:
    case 53:
      return 5;
    case 17:
    case 51:
      return 10;
    case 19:
      return 7;
    case 20:
    case 47:
      return 8;
    case 28:
      return 0;
    case 46:
      return 11;
    case 50:
      return 9;
    default:
      if ((result - 200) >= 0xB) {
        return 0;
      }
      else {
        return 4;
      }
  }
}

BOOL isVerboseEvent(int a1)
{
  return (a1 - 200) < 0xB || a1 == 19;
}

unint64_t v2_readVInt64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a2 + 1;
  int v5 = *(char *)(a1 + *a2);
  unint64_t result = *(unsigned __int8 *)(a1 + *a2);
  if (v5 < 0)
  {
    if (v5 > 0xBFu)
    {
      if (v5 > 0xDFu)
      {
        if (v5 > 0xEFu)
        {
          if (v5 > 0xF7u)
          {
            if (v5 > 0xFBu)
            {
              if (v5 > 0xFDu)
              {
                if (v5 == 255)
                {
                  unint64_t result = *(void *)(a1 + v4);
                  uint64_t v4 = v3 + 9;
                }
                else
                {
                  unint64_t v9 = (unint64_t)*(unsigned __int8 *)(a1 + v4) << 48;
                  v10 = (unsigned __int8 *)(v3 + a1);
                  unint64_t result = v9 | ((unint64_t)v10[2] << 40) | ((unint64_t)v10[3] << 32) | ((unint64_t)v10[4] << 24) | ((unint64_t)v10[5] << 16) | ((unint64_t)v10[6] << 8) | v10[7];
                  uint64_t v4 = v3 + 8;
                }
              }
              else
              {
                unint64_t v7 = ((result & 1) << 48) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 40);
                v8 = (unsigned __int8 *)(v3 + a1);
                unint64_t result = v7 | ((unint64_t)v8[2] << 32) | ((unint64_t)v8[3] << 24) | ((unint64_t)v8[4] << 16) | ((unint64_t)v8[5] << 8) | v8[6];
                uint64_t v4 = v3 + 7;
              }
            }
            else
            {
              unint64_t result = ((result & 3) << 40) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 32) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 4) << 8) | *(unsigned __int8 *)(v3 + a1 + 5);
              uint64_t v4 = v3 + 6;
            }
          }
          else
          {
            unint64_t result = ((result & 7) << 32) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 24) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 3) << 8) | *(unsigned __int8 *)(v3 + a1 + 4);
            uint64_t v4 = v3 + 5;
          }
        }
        else
        {
          unint64_t result = ((result & 0xF) << 24) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 16) | ((unint64_t)*(unsigned __int8 *)(v3 + a1 + 2) << 8) | *(unsigned __int8 *)(v3 + a1 + 3);
          uint64_t v4 = v3 + 4;
        }
      }
      else
      {
        unint64_t result = ((result & 0x1F) << 16) | ((unint64_t)*(unsigned __int8 *)(a1 + v4) << 8) | *(unsigned __int8 *)(v3 + a1 + 2);
        uint64_t v4 = v3 + 3;
      }
    }
    else
    {
      unint64_t result = *(unsigned __int8 *)(a1 + v4) | ((result & 0x3F) << 8);
      uint64_t v4 = v3 + 2;
    }
  }
  *a2 = v4;
  return result;
}

void sub_25E34C0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a56, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Unwind_Resume(a1);
}

uint64_t createReportLine(uint64_t a1, char *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  Calendar = getCalendar();
  bzero(v15, 0x400uLL);
  bzero(v14, 0x400uLL);
  double v5 = *(double *)(a1 + 48);
  if (v5 == 0.0) {
    __sprintf_chk(v15, 0, 0x400uLL, "unknown");
  }
  else {
    getDateString(Calendar, v15, 0x400uLL, v5);
  }
  double v6 = *(double *)(a1 + 56);
  if (v6 == 0.0) {
    __sprintf_chk(v14, 0, 0x400uLL, "unknown");
  }
  else {
    getDateString(Calendar, v14, 0x400uLL, v6);
  }
  double v7 = *(double *)(a1 + 48);
  if (v7 == 0.0)
  {
    double v10 = 0.0;
  }
  else
  {
    double v8 = *(double *)(a1 + 56);
    BOOL v9 = v8 <= v7 || v8 == 0.0;
    double v10 = v8 - v7;
    if (v9) {
      double v10 = 0.0;
    }
  }
  if (*(unsigned char *)(a1 + 64)) {
    v11 = "BG";
  }
  else {
    v11 = "PRI";
  }
  uint64_t v12 = 89;
  if (!*(unsigned char *)(a1 + 65)) {
    uint64_t v12 = 78;
  }
  return sprintf(a2, "%-4s %-20s %-20s %6.1f %5llu %5llu %5llu %5llu %5llu %5llu %8.2f%% %c", v11, v15, v14, v10, *(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 72) / 36000.0 * 100.0, v12);
}

void NewAggregateStats(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 64) = 0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  id v5 = [a1 sortedArrayUsingSelector:sel_compare_];
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF != 0"];
  uint64_t v4 = [v5 filteredArrayUsingPredicate:v3];

  *(double *)a2 = calculateAverage(v5);
  *(double *)(a2 + 8) = calculateAverage(v4);
  *(double *)(a2 + 16) = calculatePercentile(v5, 0.05);
  *(double *)(a2 + 24) = calculatePercentile(v5, 0.25);
  *(double *)(a2 + 32) = calculatePercentile(v5, 0.5);
  *(double *)(a2 + 40) = calculatePercentile(v5, 0.75);
  *(double *)(a2 + 48) = calculatePercentile(v5, 0.9);
  *(double *)(a2 + 56) = calculatePercentile(v5, 0.95);
  *(double *)(a2 + 64) = calculatePercentile(v5, 0.99);
}

void PrintAggregateStats(double *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  bzero(v6, 0x400uLL);
  double v4 = *a1;
  id v5 = a2;
  __sprintf_chk(v6, 0, 0x400uLL, "Avg:\t%.2f", v4);
  v5[2](v5, v6);
  __sprintf_chk(v6, 0, 0x400uLL, "Avg w/o 0s:\t%.2f", a1[1]);
  v5[2](v5, v6);
  v5[2](v5, "");
  __sprintf_chk(v6, 0, 0x400uLL, "p05:\t%.2f", a1[2]);
  v5[2](v5, v6);
  __sprintf_chk(v6, 0, 0x400uLL, "p25:\t%.2f", a1[3]);
  v5[2](v5, v6);
  __sprintf_chk(v6, 0, 0x400uLL, "p50:\t%.2f", a1[4]);
  v5[2](v5, v6);
  __sprintf_chk(v6, 0, 0x400uLL, "p75:\t%.2f", a1[5]);
  v5[2](v5, v6);
  __sprintf_chk(v6, 0, 0x400uLL, "p90:\t%.2f", a1[6]);
  v5[2](v5, v6);
  __sprintf_chk(v6, 0, 0x400uLL, "p95:\t%.2f", a1[7]);
  v5[2](v5, v6);
  __sprintf_chk(v6, 0, 0x400uLL, "p99:\t%.2f", a1[8]);
  v5[2](v5, v6);
}

void sub_25E34CF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Block_object_dispose((const void *)(v33 - 144), 8);
  _Unwind_Resume(a1);
}

__CFCalendar *getCalendar()
{
  v0 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x263EFFB30], (CFCalendarIdentifier)*MEMORY[0x263EFFC90]);
  CFTimeZoneRef v1 = CFTimeZoneCopySystem();
  CFCalendarSetTimeZone(v0, v1);
  CFRelease(v1);
  return v0;
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

char *getDateString(__CFCalendar *a1, char *a2, size_t a3, CFAbsoluteTime a4)
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = 0;
  if (CFCalendarDecomposeAbsoluteTime(a1, a4, "yMdHms", (char *)&v9 + 4, &v9, (char *)&v8 + 4, &v8, (char *)&v7 + 4, &v7))
  {
    snprintf(a2, a3, "%04d-%02d-%02d %02d:%02d:%02d", HIDWORD(v9), v9, HIDWORD(v8), v8, HIDWORD(v7), v7);
  }
  return a2;
}

void sub_25E34D7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

double calculateAverage(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v12;
      double v6 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "doubleValue", (void)v11);
          double v6 = v6 + v8;
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v4);
    }
    else
    {
      double v6 = 0.0;
    }

    double v9 = v6 / (double)(unint64_t)[v2 count];
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

double calculatePercentile(void *a1, double a2)
{
  id v3 = a1;
  double v4 = 0.0;
  if ([v3 count])
  {
    unint64_t v5 = (unint64_t)((double)(unint64_t)([v3 count] - 1) * a2);
    if ([v3 count] > v5)
    {
      double v6 = [v3 objectAtIndexedSubscript:v5];
      [v6 doubleValue];
      double v4 = v7;
    }
  }

  return v4;
}

CFArrayRef getValueAtIndex(const __CFArray *result, CFIndex a2)
{
  if (result)
  {
    CFArrayRef v3 = result;
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      unint64_t result = (const __CFArray *)CFArrayGetValueAtIndex(v3, a2);
      if (result == (const __CFArray *)*MEMORY[0x263EFFD08]) {
        return 0;
      }
    }
  }
  return result;
}

CFDateRef copyDateValueForKey(CFDictionaryRef theDict, const void *a2)
{
  CFDateRef result = 0;
  value = 0;
  if (theDict && a2)
  {
    if (CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value)
      && value != (void *)*MEMORY[0x263EFFD08]
      && (CFTypeID v4 = CFGetTypeID(value), v4 == CFDateGetTypeID()))
    {
      CFAbsoluteTime v5 = MEMORY[0x2611D3A60](value);
      return CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFStringRef copyStringValueForKey(CFDictionaryRef theDict, const void *a2)
{
  CFStringRef result = 0;
  value = 0;
  if (theDict && a2)
  {
    if (CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value)
      && value != (void *)*MEMORY[0x263EFFD08]
      && (CFTypeID v4 = CFGetTypeID(value), v4 == CFStringGetTypeID()))
    {
      CFStringRef result = (CFStringRef)CFStringGetLength((CFStringRef)value);
      if (result) {
        return CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFStringRef)value);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__CFArray *copyArrayValueForKey(const __CFDictionary *a1, const void *a2)
{
  Mutable = 0;
  value = 0;
  if (a1 && a2)
  {
    if (CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value)
      && value != (void *)*MEMORY[0x263EFFD08]
      && (CFTypeID v3 = CFGetTypeID(value), v3 == CFArrayGetTypeID())
      && CFArrayGetCount((CFArrayRef)value)
      && (CFIndex Count = CFArrayGetCount((CFArrayRef)value)) != 0)
    {
      uint64_t v5 = Count;
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], Count, MEMORY[0x263EFFF70]);
      if (v5 >= 1)
      {
        for (CFIndex i = 0; i != v5; ++i)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)value, i);
          CFStringRef Copy = CFStringCreateCopy(v6, ValueAtIndex);
          if (Copy)
          {
            CFStringRef v10 = Copy;
            CFArrayAppendValue(Mutable, Copy);
            CFRelease(v10);
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return Mutable;
}

uint64_t SKGBundleIsCalendar(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.mobilecal"];
}

uint64_t SKGBundleIsReminders(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.reminders"];
}

uint64_t SKGBundleIsWallet(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.Passbook"];
}

uint64_t SKGBundleIsEvent(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.spotlight.events"];
}

uint64_t SKGBundleIsFileProvider(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.FileProvider.LocalStorage"];
}

uint64_t SKGBundleIsMail(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.mobilemail"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.email.SearchIndexer"];
  }

  return v2;
}

uint64_t SKGBundleIsMessages(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.MobileSMS"];
}

uint64_t SKGBundleIsPhotos(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.mobileslideshow"];
}

uint64_t SKGBundleIsSafari(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.mobilesafari"];
}

uint64_t SKGBundleIsPommesCtl(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.pommesctl"];
}

id unpackXPCDictRec(void *a1)
{
  id v1 = a1;
  if (MEMORY[0x2611D4150]() == MEMORY[0x263EF8708])
  {
    CFTypeID v3 = [MEMORY[0x263EFF9A0] dictionary];
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __unpackXPCDictRec_block_invoke;
    applier[3] = &unk_265521008;
    id v7 = v3;
    id v4 = v3;
    xpc_dictionary_apply(v1, applier);
    uint64_t v2 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t __unpackXPCDictRec_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  CFAllocatorRef v6 = [NSString stringWithUTF8String:a2];
  if (MEMORY[0x2611D4150](v5) == MEMORY[0x263EF8738])
  {
    uint64_t v8 = [NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
LABEL_8:
    id v7 = (void *)v8;
LABEL_9:
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
LABEL_10:

    goto LABEL_11;
  }
  if (MEMORY[0x2611D4150](v5) == MEMORY[0x263EF87A0])
  {
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_8;
  }
  if (MEMORY[0x2611D4150](v5) == MEMORY[0x263EF8708])
  {
    id v7 = unpackXPCDictRec(v5);
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_11:

  return 1;
}

uint64_t CSGetDiskVersionForContentURL(void *a1, void *a2, uint64_t a3, void *a4)
{
  v32[1] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  if (!v7)
  {
    uint64_t v16 = 0;
    if (!a4)
    {
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:v16];
    goto LABEL_13;
  }
  char v9 = [v7 isFileURL];
  if (!a3 || !v8 || (v9 & 1) == 0)
  {
    uint64_t v31 = *MEMORY[0x263F08590];
    v32[0] = v7;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v30 = 512;
  long long v28 = 0u;
  long long v29 = xmmword_25E35B040;
  long long v27 = 0u;
  id v10 = v7;
  if (getattrlist((const char *)[v10 fileSystemRepresentation], &v29, &v27, 0x20uLL, 0x20u) < 0)
  {
LABEL_18:
    if (!a4) {
      goto LABEL_14;
    }
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08438];
    uint64_t v21 = *__error();
    v22 = v19;
    uint64_t v23 = v20;
LABEL_24:
    [v22 errorWithDomain:v23 code:v21 userInfo:0];
    uint64_t v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  uint64_t v11 = *((void *)&v28 + 1);
  int v13 = DWORD2(v27);
  uint64_t v12 = HIDWORD(v27);
  *(void *)a3 = v28;
  *(void *)(a3 + 8) = v12;
  *(void *)(a3 + 16) = v11;
  *(unsigned char *)(a3 + 24) = (v13 & 0x40000000) != 0;
  if (![v8 conformsToType:*MEMORY[0x263F1DC10]])
  {
    if (DWORD1(v27) == 1) {
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (DWORD1(v27) != 2)
  {
LABEL_22:
    if (!a4) {
      goto LABEL_14;
    }
    v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08438];
    uint64_t v21 = 79;
    goto LABEL_24;
  }
  int v14 = open((const char *)[v10 fileSystemRepresentation], 2129924);
  if (v14 < 0) {
    goto LABEL_18;
  }
  int v15 = v14;
  long long v25 = 0u;
  int8x16_t v26 = 0u;
  uint64_t v24 = 1;
  if ((ffsctl(v14, 0xC0284A20uLL, &v24, 0) & 0x80000000) == 0)
  {
    *(int8x16_t *)(a3 + 8) = vextq_s8(v26, v26, 8uLL);
    close(v15);
LABEL_21:
    uint64_t v17 = 1;
    goto LABEL_15;
  }
  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  close(v15);
LABEL_14:
  uint64_t v17 = 0;
LABEL_15:

  return v17;
}

void sub_25E352D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

uint64_t languageIsCJK(void *a1)
{
  id v1 = a1;
  if (([v1 hasPrefix:@"ja"] & 1) != 0
    || ([v1 hasPrefix:@"zh"] & 1) != 0
    || ([v1 hasPrefix:@"yue"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 hasPrefix:@"ko"];
  }

  return v2;
}

CFLocaleRef currentSystemLocale()
{
  CFLocaleRef v0 = copyCurrentLocale();
  return v0;
}

CFLocaleRef copyCurrentLocale()
{
  CFArrayRef v0 = copyCurrentPreferredLanguages();
  if (!v0) {
    return 0;
  }
  CFArrayRef v1 = v0;
  if (CFArrayGetCount(v0))
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, 0);
    CFLocaleRef v3 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], ValueAtIndex);
  }
  else
  {
    CFLocaleRef v3 = 0;
  }
  CFRelease(v1);
  return v3;
}

CFArrayRef currentSystemPreferredLanguages()
{
  CFArrayRef v0 = copyCurrentPreferredLanguages();
  return v0;
}

CFArrayRef copyCurrentPreferredLanguages()
{
  CFArrayRef v0 = CFLocaleCopyPreferredLanguages();
  CFArrayRef v1 = copyNormalizedLanguagesForIdentifiers(v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

uint64_t localeChangeCallback(uint64_t a1, void *a2)
{
  if (a2) {
    return [a2 updateLocale];
  }
  return result;
}

void sub_25E353FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id localeKeyForLocale(void *a1)
{
  CFArrayRef v1 = [a1 localeIdentifier];
  uint64_t LanguageIDForIdentifier = SILanguagesGetLanguageIDForIdentifier();

  CFLocaleRef v3 = [NSNumber numberWithUnsignedInt:LanguageIDForIdentifier];
  id v4 = [v3 stringValue];

  return v4;
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

CFArrayRef copyNormalizedLanguagesForIdentifiers(const __CFArray *a1)
{
  if (a1)
  {
    CFIndex Count = CFArrayGetCount(a1);
    CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, i);
        CFLocaleRef v6 = copyNormalizedLocaleForIdentifier(ValueAtIndex);
        if (v6)
        {
          CFLocaleRef v7 = v6;
          id v8 = (const void *)MEMORY[0x2611D3AE0]();
          v20.length = CFArrayGetCount(Mutable);
          v20.location = 0;
          if (!CFArrayContainsValue(Mutable, v20, v8)) {
            CFArrayAppendValue(Mutable, v8);
          }
          CFRelease(v7);
        }
      }
    }
  }
  else
  {
    CFArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  }
  if (!CFArrayGetCount(Mutable))
  {
    CFLocaleRef v9 = CFLocaleCopyCurrent();
    if (v9)
    {
      CFLocaleRef v10 = v9;
      CFStringRef v11 = (const __CFString *)MEMORY[0x2611D3AE0]();
      CFLocaleRef v12 = copyNormalizedLocaleForIdentifier(v11);
      if (v12)
      {
        CFLocaleRef v13 = v12;
        int v14 = (const void *)MEMORY[0x2611D3AE0]();
        v21.length = CFArrayGetCount(Mutable);
        v21.location = 0;
        if (!CFArrayContainsValue(Mutable, v21, v14)) {
          CFArrayAppendValue(Mutable, v14);
        }
        CFRelease(v13);
      }
    }
    else
    {
      if (!CFLocaleGetSystem()
        || (CFStringRef v16 = (const __CFString *)MEMORY[0x2611D3AE0](), (v17 = copyNormalizedLocaleForIdentifier(v16)) == 0))
      {
LABEL_18:
        if (!CFArrayGetCount(Mutable)) {
          CFArrayAppendValue(Mutable, @"en-US");
        }
        return Mutable;
      }
      CFLocaleRef v10 = v17;
      uint64_t v18 = (const void *)MEMORY[0x2611D3AE0]();
      v22.length = CFArrayGetCount(Mutable);
      v22.location = 0;
      if (!CFArrayContainsValue(Mutable, v22, v18))
      {
        uint64_t v19 = (const void *)MEMORY[0x2611D3AE0](v10);
        CFArrayAppendValue(Mutable, v19);
      }
    }
    CFRelease(v10);
    goto LABEL_18;
  }
  return Mutable;
}

CFLocaleRef copyNormalizedLocaleForIdentifier(CFLocaleIdentifier localeIdentifier)
{
  if (localeIdentifier) {
    CFLocaleRef v1 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], localeIdentifier);
  }
  else {
    CFLocaleRef v1 = CFLocaleCopyCurrent();
  }
  CFLocaleRef v2 = v1;
  if (v1)
  {
    CFTypeRef Value = CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x263EFFCB0]);
    if (Value)
    {
      id v4 = Value;
      if (getValidRegions_onceToken != -1) {
        dispatch_once(&getValidRegions_onceToken, &__block_literal_global_202);
      }
      CFArrayRef v5 = (const __CFArray *)getValidRegions_gRegions;
      v13.length = CFArrayGetCount((CFArrayRef)getValidRegions_gRegions);
      v13.location = 0;
      if (CFArrayContainsValue(v5, v13, v4))
      {
        CFLocaleRef v6 = v2;
LABEL_19:
        CFRelease(v2);
        return v6;
      }
    }
    CFLocaleRef v6 = (const __CFLocale *)CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
    CFTypeRef v7 = CFLocaleGetValue(v2, (CFLocaleKey)*MEMORY[0x263EFFCF8]);
    if (v6) {
      BOOL v8 = v7 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (!v6) {
        goto LABEL_19;
      }
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@_US", v6);
    }
    else
    {
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@-%@_US", v6, v7);
    }
    CFStringRef v11 = v10;
    CFLocaleRef v6 = CFLocaleCreate(v9, v10);
    CFRelease(v11);
    goto LABEL_19;
  }
  return 0;
}

CFArrayRef __getValidRegions_block_invoke()
{
  v1[257] = *(const void **)MEMORY[0x263EF8340];
  memcpy(v1, off_265521118, 0x808uLL);
  CFArrayRef result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, 257, MEMORY[0x263EFFF70]);
  getValidRegions_gRegions = (uint64_t)result;
  return result;
}

id SKGLogAgentInit()
{
  if (SKGLogAgentInit_sOnceAgent != -1) {
    dispatch_once(&SKGLogAgentInit_sOnceAgent, &__block_literal_global_3);
  }
  CFArrayRef v0 = (void *)SKGLogAgentInit_sSKGAgentLog;
  return v0;
}

uint64_t __SKGLogAgentInit_block_invoke()
{
  SKGLogAgentInit_sSKGAgentLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeAgent");
  return MEMORY[0x270F9A758]();
}

id SKGLogGraphInit()
{
  if (SKGLogGraphInit_sOnceGraph != -1) {
    dispatch_once(&SKGLogGraphInit_sOnceGraph, &__block_literal_global_4);
  }
  CFArrayRef v0 = (void *)SKGLogGraphInit_sSKGGraphLog;
  return v0;
}

uint64_t __SKGLogGraphInit_block_invoke()
{
  SKGLogGraphInit_sSKGGraphLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeGraph");
  return MEMORY[0x270F9A758]();
}

id SKGLogUpdaterInit()
{
  if (SKGLogUpdaterInit_sOnceUpdater != -1) {
    dispatch_once(&SKGLogUpdaterInit_sOnceUpdater, &__block_literal_global_7);
  }
  CFArrayRef v0 = (void *)SKGLogUpdaterInit_sSKGUpdaterLog;
  return v0;
}

uint64_t __SKGLogUpdaterInit_block_invoke()
{
  SKGLogUpdaterInit_sSKGUpdaterLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeUpdater");
  return MEMORY[0x270F9A758]();
}

id SKGLogEventInit()
{
  if (SKGLogEventInit_sOnceEvent != -1) {
    dispatch_once(&SKGLogEventInit_sOnceEvent, &__block_literal_global_10);
  }
  CFArrayRef v0 = (void *)SKGLogEventInit_sSKGEventLog;
  return v0;
}

uint64_t __SKGLogEventInit_block_invoke()
{
  SKGLogEventInit_sSKGEventLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeEvent");
  return MEMORY[0x270F9A758]();
}

id SKGLogEmbedInit()
{
  if (SKGLogEmbedInit_sOnceEmbed != -1) {
    dispatch_once(&SKGLogEmbedInit_sOnceEmbed, &__block_literal_global_13);
  }
  CFArrayRef v0 = (void *)SKGLogEmbedInit_sSKGEmbedLog;
  return v0;
}

uint64_t __SKGLogEmbedInit_block_invoke()
{
  SKGLogEmbedInit_sSKGEmbedLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeEmbedding");
  return MEMORY[0x270F9A758]();
}

id SKGLogKeyphraseInit()
{
  if (SKGLogKeyphraseInit_sOnceKeyphrase != -1) {
    dispatch_once(&SKGLogKeyphraseInit_sOnceKeyphrase, &__block_literal_global_16);
  }
  CFArrayRef v0 = (void *)SKGLogKeyphraseInit_sSKGKeyphraseLog;
  return v0;
}

uint64_t __SKGLogKeyphraseInit_block_invoke()
{
  SKGLogKeyphraseInit_sSKGKeyphraseLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeKeyphrases");
  return MEMORY[0x270F9A758]();
}

id SKGLogSuggestedEventsInit()
{
  if (SKGLogSuggestedEventsInit_sOnceSuggestedEvents != -1) {
    dispatch_once(&SKGLogSuggestedEventsInit_sOnceSuggestedEvents, &__block_literal_global_19);
  }
  CFArrayRef v0 = (void *)SKGLogSuggestedEventsInit_sSKGSuggestedEventsLog;
  return v0;
}

uint64_t __SKGLogSuggestedEventsInit_block_invoke()
{
  SKGLogSuggestedEventsInit_sSKGSuggestedEventsLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeSuggestedEvents");
  return MEMORY[0x270F9A758]();
}

id SKGLogDocUnderstandingInit()
{
  if (SKGLogDocUnderstandingInit_sOnceDocUnderstanding != -1) {
    dispatch_once(&SKGLogDocUnderstandingInit_sOnceDocUnderstanding, &__block_literal_global_22);
  }
  CFArrayRef v0 = (void *)SKGLogDocUnderstandingInit_sSKGDocUnderstandingLog;
  return v0;
}

uint64_t __SKGLogDocUnderstandingInit_block_invoke()
{
  SKGLogDocUnderstandingInit_sSKGDocUnderstandingLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeDocUnderstanding");
  return MEMORY[0x270F9A758]();
}

id SKGLogJournalInit()
{
  if (SKGLogJournalInit_sOnceJournals != -1) {
    dispatch_once(&SKGLogJournalInit_sOnceJournals, &__block_literal_global_25);
  }
  CFArrayRef v0 = (void *)SKGLogJournalInit_sSKGJournalLog;
  return v0;
}

uint64_t __SKGLogJournalInit_block_invoke()
{
  SKGLogJournalInit_sSKGJournalLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledgeJournals");
  return MEMORY[0x270F9A758]();
}

id SKGLogInit()
{
  if (SKGLogInit_sOnce != -1) {
    dispatch_once(&SKGLogInit_sOnce, &__block_literal_global_28);
  }
  CFArrayRef v0 = (void *)SKGLogInit_sSKGLog;
  return v0;
}

uint64_t __SKGLogInit_block_invoke()
{
  SKGLogInit_sSKGLog = (uint64_t)os_log_create("com.apple.spotlightknowledge", "SpotlightKnowledge");
  return MEMORY[0x270F9A758]();
}

uint64_t stringComposedLengthForEmbeddingCheck(void *a1)
{
  id v1 = a1;
  uint64_t v6 = 0;
  CFTypeRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [v1 length];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __stringComposedLengthForEmbeddingCheck_block_invoke;
  v5[3] = &unk_265521950;
  v5[4] = &v6;
  objc_msgSend(v1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_25E3578BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25E3582D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

uint64_t __stringComposedLengthForEmbeddingCheck_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) >= 0x14uLL) {
    *a7 = 1;
  }
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x270EE46C8](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x270EE46D0](calendar, v3, at);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x270EE4A78]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale)
{
  return (CFLocaleRef)MEMORY[0x270EE4AA0](allocator, locale);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4AC0]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52E8]();
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

uint64_t SILanguagesGetLanguage()
{
  return MEMORY[0x270F76DD0]();
}

uint64_t SILanguagesGetLanguageID()
{
  return MEMORY[0x270F76DD8]();
}

uint64_t SILanguagesGetLanguageIDForIdentifier()
{
  return MEMORY[0x270F76DE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x270F4A730]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}