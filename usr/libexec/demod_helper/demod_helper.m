void sub_1000044C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000044E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000044F4(uint64_t a1)
{
}

uint64_t sub_1000044FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_22:
    v14 = v10;
    [v9 addObject:v10];

    uint64_t v8 = 1;
    goto LABEL_23;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSData dataWithBytes:bytes_ptr length:length];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSDictionary dictionaryWithXPCDictionary:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    v13 = *(void **)(a1 + 32);
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = [v13 initWithXPCArray:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSDate dateWithTimeIntervalSince1970:(double)xpc_date_get_value(v5)];
    goto LABEL_22;
  }
  v7 = sub_100027250();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10002AD3C(a2, v7);
  }

  uint64_t v8 = 0;
LABEL_23:

  return v8;
}

void sub_1000048AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000048C4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = xpc_string_create((const char *)[v6 UTF8String]);
LABEL_5:
    id v10 = v8;
    xpc_array_append_value(v7, v8);

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    id v9 = v6;
    uint64_t v8 = xpc_data_create([v9 bytes], (size_t)[v9 length]);
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    if (!strcmp((const char *)[v11 objCType], "i")
      || (id v12 = v11, !strcmp((const char *)[v12 objCType], "s"))
      || (id v13 = v12, !strcmp((const char *)[v13 objCType], "q"))
      || (id v14 = v13, !strcmp((const char *)[v14 objCType], "q")))
    {
      v20 = *(void **)(a1 + 32);
      xpc_object_t v21 = xpc_int64_create((int64_t)[v11 longLongValue]);
    }
    else
    {
      id v15 = v14;
      if (!strcmp((const char *)[v15 objCType], "f")
        || (id v16 = v15, !strcmp((const char *)[v16 objCType], "d")))
      {
        v20 = *(void **)(a1 + 32);
        [v15 doubleValue];
        xpc_object_t v21 = xpc_double_create(v25);
      }
      else
      {
        id v17 = v16;
        if (strcmp((const char *)[v17 objCType], "B"))
        {
          id v18 = v17;
          if (strcmp((const char *)[v18 objCType], "c"))
          {
            v19 = sub_100027250();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_10002ADB4(v18, v19);
            }

            *a4 = 1;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
            goto LABEL_23;
          }
        }
        v20 = *(void **)(a1 + 32);
        xpc_object_t v21 = xpc_BOOL_create((BOOL)[v17 BOOLValue]);
      }
    }
    v22 = v21;
    xpc_array_append_value(v20, v21);

LABEL_23:
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 xpcArrayFromArray];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 createXPCDictionary];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = *(void **)(a1 + 32);
    [v6 timeIntervalSince1970];
    uint64_t v8 = xpc_date_create((uint64_t)v23);
    goto LABEL_5;
  }
  v24 = sub_100027250();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_10002AE44(v24);
  }

  *a4 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_6:
}

void sub_10000514C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100007E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_100007E28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007E38(uint64_t a1)
{
}

void sub_100007E40(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"/"] & 1) == 0)
  {
    id v9 = [*(id *)(a1 + 32) nonContainerizedContentRoots];
    unsigned int v10 = [v9 containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    if (v10)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void sub_100008E18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008E34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100008E78(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_100008E98(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

CFStringRef sub_10000924C(unsigned __int8 *a1)
{
  snprintf(__str, 0x64uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15],
    a1[16],
    a1[17],
    a1[18],
    a1[19]);
  return CFStringCreateWithCString(kCFAllocatorDefault, __str, 0x8000100u);
}

unsigned __int8 *sub_10000934C(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  uint64_t v4 = sub_1000093B0(a2);
  id v5 = v4;
  if (v4)
  {
    uint64_t v4 = sub_1000093B0(a3);
    if (v4)
    {
      for (uint64_t i = 0; i != 20; ++i)
        v5[i] ^= v4[i];
    }
  }
  free(v4);
  return v5;
}

unsigned __int8 *sub_1000093B0(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID())
  {
    v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x6A69C61BuLL);
    LOBYTE(c.h0) = CFBooleanGetValue((CFBooleanRef)a1);
    p_CC_SHA1_CTX c = &c;
    CC_LONG Length = 1;
LABEL_10:
    CC_SHA1(p_c, Length, v3);
    return v3;
  }
  if (v2 == CFStringGetTypeID())
  {
    v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x877E83E2uLL);
    size_t v6 = CFStringGetLength(a1) + 1;
    uint64_t v7 = (char *)malloc_type_calloc(1uLL, v6, 0x9DED1793uLL);
    CFStringGetCString(a1, v7, v6, 0x8000100u);
    CC_SHA1(v7, v6, v3);
    free(v7);
    return v3;
  }
  if (v2 == CFDateGetTypeID())
  {
    v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xEAF147E6uLL);
    *(void *)&c.h0 = CFDateGetAbsoluteTime((CFDateRef)a1);
    p_CC_SHA1_CTX c = &c;
    CC_LONG Length = 8;
    goto LABEL_10;
  }
  if (v2 == CFDataGetTypeID())
  {
    v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x1991A161uLL);
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    CC_LONG Length = CFDataGetLength((CFDataRef)a1);
    p_CC_SHA1_CTX c = (CC_SHA1_CTX *)BytePtr;
    goto LABEL_10;
  }
  if (v2 == CFArrayGetTypeID())
  {
    if (CFArrayGetCount((CFArrayRef)a1))
    {
      memset(&c, 0, sizeof(c));
      if (!sub_100009C64((const __CFArray *)a1))
      {
        v3 = (unsigned __int8 *)sub_1000093B0(@"array");
        CC_SHA1_Init(&c);
        if (CFArrayGetCount((CFArrayRef)a1) >= 1)
        {
          CFIndex v11 = 0;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v11);
            uint64_t v13 = (unsigned __int8 *)sub_1000093B0(ValueAtIndex);
            if (!v13) {
              break;
            }
            uint64_t v14 = v13;
            CC_SHA1_Update(&c, v13, 0x14u);
            CC_SHA1_Final(v14, &c);
            if (v3)
            {
              for (uint64_t i = 0; i != 20; ++i)
                v3[i] ^= v14[i];
            }
            free(v14);
            ++v11;
          }
          while (CFArrayGetCount((CFArrayRef)a1) > v11);
        }
        return v3;
      }
      uint64_t v9 = sub_100027250();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failing to hash due to duplicate array entries", v16, 2u);
      }
    }
    return 0;
  }
  if (v2 == CFDictionaryGetTypeID())
  {
    return (unsigned __int8 *)sub_100009A1C((const __CFDictionary *)a1);
  }
  if (v2 != CFNumberGetTypeID()) {
    return 0;
  }

  return sub_100009B9C((const __CFNumber *)a1);
}

CFDataRef sub_1000096BC(const __CFAllocator *a1, const __CFString *a2, CFStringRef theString1, uint64_t a4, void (*a5)(uint64_t, double, float), uint64_t a6)
{
  memset(&c, 0, sizeof(c));
  if (CFEqual(theString1, @"SHA-1"))
  {
    CFURLRef v20 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
    if (!v20)
    {
      CFIndex v11 = sub_100027250();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10002C1E0((uint64_t)a2, v11);
      }
      goto LABEL_4;
    }
    CFURLRef v21 = v20;
    v22 = CFReadStreamCreateWithFile(a1, v20);
    if (!v22)
    {
      v33 = sub_100027250();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_10002C258();
      }

      CFDataRef v19 = 0;
      goto LABEL_40;
    }
    double v23 = v22;
    if (CFReadStreamOpen(v22))
    {
      if (a5) {
        a5(a6, 0.0, -1.0);
      }
      CC_SHA1_Init(&c);
      v24 = (UInt8 *)malloc_type_calloc(1uLL, 0x10000uLL, 0x49093F70uLL);
      if (v24)
      {
        double v25 = v24;
        v52.tv_seCC_SHA1_CTX c = 0;
        *(void *)&v52.tv_useCC_SHA1_CTX c = 0;
        gettimeofday(&v52, 0);
        CFIndex v26 = CFReadStreamRead(v23, v25, 0x10000);
        if (v26 < 1)
        {
LABEL_18:
          CC_SHA1_Final(md, &c);
          CFDataRef v31 = CFDataCreate(a1, md, 20);
          if (v31)
          {
            CFDataRef v19 = v31;
            CFStringRef v32 = sub_10000924C(md);
            if (v32) {
              CFRelease(v32);
            }
            if (a5) {
              a5(a6, 1.0, -1.0);
            }
            goto LABEL_38;
          }
          v42 = sub_100027250();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_10002C360(v42, v43, v44, v45, v46, v47, v48, v49);
          }
        }
        else
        {
          CFIndex v27 = v26;
          uint64_t v28 = 0;
          while (1)
          {
            CC_SHA1_Update(&c, v25, v27);
            v28 += v27;
            v29.n128_u32[0] = -1.0;
            if (a4) {
              v29.n128_f32[0] = (float)v28 / (float)a4;
            }
            if (a5)
            {
              int v30 = ((uint64_t (*)(uint64_t, __n128, float))a5)(a6, v29, -1.0);
              if (v30) {
                break;
              }
            }
            CFIndex v27 = CFReadStreamRead(v23, v25, 0x10000);
            if (v27 <= 0) {
              goto LABEL_18;
            }
          }
          int v50 = v30;
          v42 = sub_100027250();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            sub_10002C398(v50, v42);
          }
        }

        CFDataRef v19 = 0;
LABEL_38:
        free(v25);
        goto LABEL_39;
      }
      v34 = sub_100027250();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10002C328(v34, v35, v36, v37, v38, v39, v40, v41);
      }
    }
    else
    {
      v34 = sub_100027250();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_10002C2C0();
      }
    }

    CFDataRef v19 = 0;
LABEL_39:
    CFReadStreamClose(v23);
    CFRelease(v23);
LABEL_40:
    CFRelease(v21);
    return v19;
  }
  CFIndex v11 = sub_100027250();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10002C410(v11, v12, v13, v14, v15, v16, v17, v18);
  }
LABEL_4:

  return 0;
}

uint64_t sub_100009A1C(const __CFDictionary *a1)
{
  if (!CFDictionaryGetCount(a1)) {
    return 0;
  }
  memset(&v12, 0, sizeof(v12));
  uint64_t v2 = sub_1000093B0(@"dictionary");
  int64_t Count = CFDictionaryGetCount(a1);
  uint64_t v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(a1, v4, 0);
  if (Count >= 1)
  {
    for (uint64_t i = 0; i != Count; ++i)
    {
      size_t v6 = (void *)sub_1000093B0(v4[i]);
      Value = CFDictionaryGetValue(a1, v4[i]);
      uint64_t v8 = (void *)sub_1000093B0(Value);
      CC_SHA1_Init(&v12);
      uint64_t v9 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0x663AA81CuLL);
      if (v6)
      {
        CC_SHA1_Update(&v12, v6, 0x14u);
        free(v6);
      }
      if (v8)
      {
        CC_SHA1_Update(&v12, v8, 0x14u);
        free(v8);
      }
      CC_SHA1_Final(v9, &v12);
      if (v2 && v9)
      {
        for (uint64_t j = 0; j != 20; ++j)
          *(unsigned char *)(v2 + j) ^= v9[j];
      }
      free(v9);
    }
  }
  free(v4);
  return v2;
}

unsigned __int8 *sub_100009B9C(const __CFNumber *a1)
{
  uint64_t v2 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x14uLL, 0xFF7F1A96uLL);
  uint64_t valuePtr = 0;
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  if ((unint64_t)(valuePtr + 1) >= 0xE) {
    size_t v3 = 8;
  }
  else {
    size_t v3 = 4;
  }
  if ((unint64_t)(valuePtr + 1) < 0xE) {
    CFNumberType v4 = kCFNumberSInt32Type;
  }
  else {
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  id v5 = malloc_type_calloc(1uLL, v3, 0xD98972E9uLL);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

uint64_t sub_100009C64(const __CFArray *a1)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
    v7.location = 0;
    v7.size_t length = v3;
    if (CFArrayGetCountOfValue(a1, v7, ValueAtIndex) >= 2) {
      break;
    }
    if (v3 == ++v4) {
      return 0;
    }
  }
  return 1;
}

void sub_100009CE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL sub_10000B47C(id a1, NSURL *a2, NSError *a3)
{
  CFIndex v3 = a3;
  CFIndex v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10002C77C(v3, v4);
  }

  return 1;
}

void sub_10000BF4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BF80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BF90(uint64_t a1)
{
}

void sub_10000BF98(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = a1 + 40;
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:a2];
  uint64_t v8 = *(void *)(*(void *)v6 + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  unsigned int v10 = sub_100027250();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)v6 + 8) + 40);
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
    __int16 v29 = 2112;
    uint64_t v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s - intermediatePath:  %@", buf, 0x16u);
  }

  if (([*(id *)(a1 + 32) fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) == 0)
  {
    CC_SHA1_CTX v12 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByAppendingPathComponent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v13 = *(void **)(a1 + 32);
    id v26 = 0;
    uint64_t v14 = [v13 attributesOfItemAtPath:v12 error:&v26];
    id v15 = v26;
    if (v14)
    {
      uint64_t v16 = [v14 fileType];
      unsigned int v17 = [v16 isEqualToString:NSFileTypeDirectory];

      if (v17)
      {
        uint64_t v18 = sub_100027250();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(*(void *)(*(void *)v6 + 8) + 40);
          *(_DWORD *)buf = 136315394;
          uint64_t v28 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
          __int16 v29 = 2112;
          uint64_t v30 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s - Creating directory:  %@", buf, 0x16u);
        }

        CFURLRef v20 = *(void **)(a1 + 32);
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v25 = v15;
        unsigned __int8 v22 = [v20 createDirectoryAtPath:v21 withIntermediateDirectories:0 attributes:v14 error:&v25];
        id v23 = v25;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v22;
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          goto LABEL_17;
        }
        v24 = sub_100027250();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10002CB88(v6, v23);
        }
        id v15 = v23;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        v24 = sub_100027250();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_10002CC44(v6, v24);
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      v24 = sub_100027250();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10002CAF0();
      }
    }

    id v23 = v15;
LABEL_17:
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

void sub_10000C3BC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10000C3E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000C430(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_10000C45C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10000C4BC(id a1)
{
  qword_100057DA0 = objc_alloc_init(MSDPlatform);

  _objc_release_x1();
}

void sub_10000C53C(id a1)
{
  byte_100057DB0 = NSClassFromString(@"MSDHubBundleManager") != 0;
}

void sub_100010F44(id a1)
{
  qword_100057DC8 = objc_alloc_init(MSDDemoManifestCheck);

  _objc_release_x1();
}

void sub_100012C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012CA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012CB4(uint64_t a1)
{
}

void sub_100012CBC(uint64_t a1, const __CFData *a2, uint64_t a3, unsigned char *a4)
{
  SecCertificateRef v6 = SecCertificateCreateWithData(kCFAllocatorDefault, a2);
  if (v6)
  {
    SecCertificateRef v17 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  else
  {
    uint64_t v7 = sub_100027250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002E850(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;

    *a4 = 1;
  }
}

void sub_100013538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001356C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([*(id *)(a1 + 32) containsObject:v7])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001367C;
    v11[3] = &unk_10004CD38;
    v11[4] = *(void *)(a1 + 40);
    id v9 = v7;
    uint64_t v10 = *(void *)(a1 + 72);
    id v12 = v9;
    uint64_t v16 = v10;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    uint64_t v17 = a4;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

void sub_10001367C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [*(id *)(a1 + 32) checkType];
  if (v9) {
    [*(id *)(a1 + 32) checkType];
  }
  else {
  uint64_t v10 = [v8 objectForKey:@"RigorousCheckType"];
  }

  uint64_t v11 = sub_100027250();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v23 = v7;
    __int16 v24 = 2114;
    id v25 = v12;
    __int16 v26 = 2114;
    CFIndex v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Name: %{public}@, Section Name: %{public}@, Check Type: %{public}@", buf, 0x20u);
  }

  id v13 = [*(id *)(a1 + 32) getComponentData:v8];
  if ([v10 isEqualToString:@"Skip"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else if ([v10 isEqualToString:@"Default"])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) runSecurityChecksForSection:v13 dataType:*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
  }
  else
  {
    if ([v10 isEqualToString:@"AppleISTCertCheck"])
    {
      id v14 = +[NSString stringWithFormat:@"%@.%@", *(void *)(a1 + 40), v7];
      id v15 = [*(id *)(a1 + 32) allowedISTSignedComponents];
      unsigned int v16 = [v15 containsObject:v14];

      if (v16)
      {
        if ([v7 isEqualToString:*(void *)(a1 + 56)]
          && [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 64)])
        {
          uint64_t v17 = sub_100027250();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v23 = (const char *)v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "About to run app layout checks for %{public}@", buf, 0xCu);
          }

          unsigned __int8 v18 = [*(id *)(a1 + 32) runAppLayoutSecurityCheck:v13];
        }
        else
        {
          unsigned __int8 v18 = [*(id *)(a1 + 32) runSecurityChecksForSection:v13 dataType:*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v18;
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        CFURLRef v20 = sub_100027250();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10002ECBC();
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v14 = sub_100027250();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        id v23 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
        __int16 v24 = 2114;
        id v25 = v10;
        __int16 v26 = 2114;
        CFIndex v27 = v7;
        __int16 v28 = 2114;
        uint64_t v29 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Unknown rigorous check type (%{public}@) for %{public}@ (from %{public}@).", buf, 0x2Au);
      }
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v21 = sub_100027250();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10002EC20((uint64_t)v7, a1, v21);
    }

    *a4 = 1;
    **(unsigned char **)(a1 + 80) = 1;
  }
}

void sub_10001511C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFIndex v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 name];
    SecCertificateRef v6 = [v3 userInfo];
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notification received for entitlement check for: %{public}@ %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [v3 userInfo];
  [*(id *)(a1 + 32) setItemBeingInstalled:v7];
}

void sub_100016EF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *sub_100016F10(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_1000187D8(id a1)
{
  qword_100057DD8 = objc_alloc_init(MSDHVolumeManager);

  _objc_release_x1();
}

void sub_1000190B4(id a1)
{
  io_iterator_t iterator = 0;
  bzero(&v22, 0x878uLL);
  if (statfs("/", &v22))
  {
    id v15 = sub_100027250();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002FE5C();
    }

    id v4 = 0;
    v1 = 0;
    goto LABEL_34;
  }
  v1 = +[NSString stringWithUTF8String:v22.f_mntfromname];
  uint64_t v2 = (char *)[v1 rangeOfString:@"/dev/"];
  if (v2 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v16 = sub_100027250();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002FD58();
    }

    id v4 = 0;
    goto LABEL_34;
  }
  id v4 = [v1 substringFromIndex:&v2[v3]];
  CFDictionaryRef v5 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v4 UTF8String]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  if (!MatchingService)
  {
    uint64_t v17 = sub_100027250();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10002FD8C();
    }

    goto LABEL_34;
  }
  io_object_t v7 = MatchingService;
  if (IORegistryEntryCreateIterator(MatchingService, "IOService", 3u, &iterator))
  {
    unsigned __int8 v18 = sub_100027250();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10002FDF4();
    }

    IOObjectRelease(v7);
LABEL_34:
    __int16 v10 = 0;
    goto LABEL_15;
  }
  io_object_t v8 = IOIteratorNext(iterator);
  if (v8)
  {
    while (!IOObjectConformsTo(v8, "AppleAPFSContainer"))
    {
      IOObjectRelease(v8);
      io_object_t v8 = IOIteratorNext(iterator);
      if (!v8) {
        goto LABEL_8;
      }
    }
    CFTypeRef v11 = IORegistryEntrySearchCFProperty(v8, "IOService", @"BSD Name", 0, 3u);
    if (v11)
    {
      __int16 v10 = (void *)v11;
      uint64_t v12 = [@"/dev/" stringByAppendingString:v11];
      id v13 = (void *)qword_100057DE8;
      qword_100057DE8 = v12;

      IOObjectRelease(v7);
LABEL_14:
      IOObjectRelease(v8);
      goto LABEL_15;
    }
  }
LABEL_8:
  id v9 = sub_100027250();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10002FDC0();
  }

  IOObjectRelease(v7);
  __int16 v10 = 0;
  if (v8) {
    goto LABEL_14;
  }
LABEL_15:
  if (iterator) {
    IOObjectRelease(iterator);
  }
  if (!qword_100057DE8)
  {
    qword_100057DE8 = @"/dev/disk0s1";
  }
  id v14 = sub_100027250();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = qword_100057DE8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current APFS boot container: %{public}@", buf, 0xCu);
  }
}

void sub_10001A3E0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_10001A400(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10001A41C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001A448(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10001A4BC(id a1)
{
  qword_100057DF8 = objc_alloc_init(MSDTestPreferences);

  _objc_release_x1();
}

uint64_t sub_10001BB70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

BOOL sub_10001C558(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  CFDictionaryRef v5 = a3;
  SecCertificateRef v6 = sub_100027250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    io_object_t v7 = [(NSURL *)v4 path];
    int v9 = 136315906;
    uint64_t v10 = "-[MSDManifest enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:]_block_invoke";
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v4;
    __int16 v15 = 2114;
    unsigned int v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Could not enumerate %{public}@, url=%{public}@, error=%{public}@", (uint8_t *)&v9, 0x2Au);
  }
  return 1;
}

void sub_10001CB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001CB60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001CB70(uint64_t a1)
{
}

uint64_t sub_10001CB78(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  SecCertificateRef v6 = +[NSString stringWithCString:a2 encoding:4];
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_22:
    __int16 v15 = v11;
    [v10 setObject:v11 forKey:v6];

    uint64_t v9 = 1;
    goto LABEL_23;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = [v12 initWithXPCDictionary:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSData dataWithBytes:bytes_ptr length:length];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSArray arrayWithXPCArray:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSDate dateWithTimeIntervalSince1970:(double)xpc_date_get_value(v5)];
    goto LABEL_22;
  }
  io_object_t v8 = sub_100027250();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000308BC((uint64_t)v6, v8);
  }

  uint64_t v9 = 0;
LABEL_23:

  return v9;
}

id sub_10001D774()
{
  if (qword_100057E10 != -1) {
    dispatch_once(&qword_100057E10, &stru_10004CEA0);
  }
  v0 = (void *)qword_100057E08;

  return v0;
}

void sub_10001D7C8(id a1)
{
  v1 = +[MSDPlatform sharedInstance];
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"/var/mobile/Demo.mov", @"/var/mobile/Demo.plist", @"/var/mobile/Media", @"/var/mobile/Library/AddressBook", @"/var/mobile/Library/Alarms", @"/var/mobile/Library/Calendar", @"/var/mobile/Library/CallHistoryDB", @"/var/mobile/Library/Carousel", @"/var/mobile/Library/Health", @"/var/mobile/Library/Maps", @"/var/mobile/Library/MapsHistory.plist", @"/var/mobile/Library/NanoMailKit", @"/var/mobile/Library/NanoMusicSync", @"/var/mobile/Library/NanoPasses", @"/var/mobile/Library/NanoPodcasts", @"/var/mobile/Library/NanoPhotos", @"/var/mobile/Library/NanoWeatherDemo",
      @"/var/mobile/Library/News",
      @"/var/mobile/Library/RetailDemo",
      @"/var/mobile/Library/Reminders",
      @"/var/mobile/Library/SMS",
      @"/var/mobile/Library/UserConfigurationProfiles",
      @"/var/mobile/Library/Preferences/.GlobalPreferences.plist",
      @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist",
      @"/var/mobile/Library/Preferences/com.apple.Accessibility.plist",
      @"/var/mobile/Library/Preferences/com.apple.ActivitySharing.plist",
      @"/var/mobile/Library/Preferences/com.apple.AppleMediaServices.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.backedup.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.nano.plist",
      @"/var/mobile/Library/Preferences/com.apple.assistant.support.plist",
      @"/var/mobile/Library/Preferences/com.apple.backboardd.plist",
      @"/var/mobile/Library/Preferences/com.apple.Carousel.plist",
      @"/var/mobile/Library/Preferences/com.apple.coremedia.plist",
      @"/var/mobile/Library/Preferences/com.apple.ControlCenter.plist",
      @"/var/mobile/Library/Preferences/com.apple.DeepBreathing.plist",
      @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist",
      @"/var/mobile/Library/Preferences/com.apple.findmy.plist",
      @"/var/mobile/Library/Preferences/com.apple.healthd.plist",
      @"/var/mobile/Library/Preferences/com.apple.ids.plist",
      @"/var/mobile/Library/Preferences/com.apple.locationd.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobileme.fmf1.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobilephone.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist",
      @"/var/mobile/Library/Preferences/com.apple.mobiletimer.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanobuddy.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.privacy.plist",
      @"/var/mobile/Library/Preferences/com.apple.NanoMediaUI.plist",
      @"/var/mobile/Library/Preferences/com.apple.NanoMusicSync.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanopassbook.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanophotos.plist",
      @"/var/mobile/Library/Preferences/com.apple.nanonews.sync.plist",
      @"/var/mobile/Library/Preferences/com.apple.Noise.plist",
      @"/var/mobile/Library/Preferences/com.apple.podcasts.plist",
      @"/var/mobile/Library/Preferences/com.apple.SessionTrackerApp.plist",
      @"/var/mobile/Library/Preferences/com.apple.stockholm.plist",
      @"/var/mobile/Library/Preferences/com.apple.system.prefs.plist",
      @"/var/mobile/Library/Preferences/com.apple.timed.plist",
      @"/var/mobile/Library/Preferences/com.apple.voicememod.plist",
      @"/var/mobile/Library/Preferences/group.com.apple.stocks.plist",
      @"/var/mobile/Library/Preferences/Avalon");
  }
  else
  {
    uint64_t v3 = +[MSDPlatform sharedInstance];
    unsigned int v4 = [v3 tvOS];

    if (!v4) {
      return;
    }
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"/var/mobile/Media/DCIM", @"/var/mobile/Media/PhotoData", @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist", @"/var/MobileDevice/ProvisioningProfiles", @"/var/mobile/Library/com.apple.HeadBoard/HBDemoModeAppOrder", @"/var/mobile/Library/com.apple.HeadBoard/AppOrder.plist", @"/var/mobile/Library/Preferences/.GlobalPreferences.plist", @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist", @"/var/mobile/Library/DemoLoop", 0, v5, v6, v7, v8, v9, v10, v11,
      v12,
      v13,
      v14,
      v15,
      v16,
      v17,
      v18,
      v19,
      v20,
      v21,
      v22,
      v23,
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38,
      v39,
      v40,
      v41,
      v42,
      v43,
      v44,
      v45,
      v46,
      v47,
      v48,
      v49,
      v50,
      v51,
      v52,
      v53,
      v54,
      v55);
  qword_100057E08 = };

  _objc_release_x1();
}

id sub_10001DC08()
{
  if (qword_100057E20 != -1) {
    dispatch_once(&qword_100057E20, &stru_10004CEC0);
  }
  v0 = (void *)qword_100057E18;

  return v0;
}

void sub_10001DC5C(id a1)
{
  v1 = +[MSDPlatform sharedInstance];
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = +[NSArray arrayWithObjects:@"/var/mobile/Library/Caches/sharedCaches/com.apple.WatchListKit.NSURLCache", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-shm", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-wal", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-wal", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-shm", @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/fsCachedData", 0];
  }
  else
  {
    unsigned int v4 = +[MSDPlatform sharedInstance];
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = +[NSArray array];
  }
  qword_100057E18 = v3;

  _objc_release_x1();
}

id sub_10001DD70()
{
  if (qword_100057E30 != -1) {
    dispatch_once(&qword_100057E30, &stru_10004CEE0);
  }
  v0 = (void *)qword_100057E28;

  return v0;
}

void sub_10001DDC4(id a1)
{
  v1 = +[MSDPlatform sharedInstance];
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = +[NSArray arrayWithObjects:@"systemgroup.com.apple.configurationprofiles", 0];
  }
  else
  {
    unsigned int v4 = +[MSDPlatform sharedInstance];
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = +[NSArray array];
  }
  qword_100057E28 = v3;

  _objc_release_x1();
}

id sub_10001DE94()
{
  if (qword_100057E40 != -1) {
    dispatch_once(&qword_100057E40, &stru_10004CF00);
  }
  v0 = (void *)qword_100057E38;

  return v0;
}

void sub_10001DEE8(id a1)
{
  qword_100057E38 = +[NSArray arrayWithObjects:@"/.com.apple.mobile_container_manager.metadata.plist", @"/Library/Caches", @"/Library/SyncedPreferences", @"/Library/Saved Application State", @"/SystemData/com.apple.AuthenticationServices", 0];

  _objc_release_x1();
}

id sub_10001DF64()
{
  if (qword_100057E50 != -1) {
    dispatch_once(&qword_100057E50, &stru_10004CF20);
  }
  v0 = (void *)qword_100057E48;

  return v0;
}

void sub_10001DFB8(id a1)
{
  qword_100057E48 = +[NSArray arrayWithObjects:@"/.com.apple.mobile_container_manager.metadata.plist", @"/Library/Caches", @"/Library/SyncedPreferences", @"/Library/Saved Application State", @"/SystemData/com.apple.AuthenticationServices", 0];

  _objc_release_x1();
}

id sub_10001E034()
{
  v4[0] = @"ContentRootDomain";
  v0 = sub_10001D774();
  v4[1] = @"SystemContainerDomain";
  v5[0] = v0;
  v1 = sub_10001DD70();
  v5[1] = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void sub_10001E480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001E4A8(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = [*(id *)(a1 + 32) objectAtIndex:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [*(id *)(a1 + 40) metadataForFile:v5];
    uint64_t v7 = [*(id *)(a1 + 48) stringByAppendingPathComponent:v5];
    uint64_t v8 = [*(id *)(a1 + 56) pathsToSkip];
    uint64_t v9 = [v7 lowercaseString];
    unsigned int v10 = [v8 containsObject:v9];

    if (v10)
    {
      uint64_t v11 = sub_100027250();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        uint64_t v13 = "-[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:]_block_invoke";
        __int16 v14 = 2114;
        uint64_t v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Skip file attributes restore for %{public}@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      if ([v6 restoreAttribuesToPath:v7]) {
        goto LABEL_9;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      uint64_t v11 = sub_100027250();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100030CC8();
      }
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v11 = sub_100027250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Got non-string value from array.", (uint8_t *)&v12, 2u);
    }
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }

LABEL_9:
}

void sub_10001EE24(id a1)
{
  qword_100057E58 = objc_alloc_init(MSDHOperations);

  _objc_release_x1();
}

void sub_100022618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002264C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002265C(uint64_t a1)
{
}

void sub_100022664(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [objc_alloc((Class)OSLogEventStream) initWithSource:v3];

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = +[NSPredicate predicateWithFormat:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setFilterPredicate:v7];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022808;
  v10[3] = &unk_10004CF90;
  uint64_t v12 = *(void *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInvalidationHandler:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022908;
  v9[3] = &unk_10004CFB8;
  v9[4] = *(void *)(a1 + 64);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setEventHandler:v9];
  uint64_t v8 = +[NSDate dateWithTimeIntervalSinceNow:-172800.0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) activateStreamFromDate:v8];
}

intptr_t sub_100022808(uint64_t a1, uint64_t a2)
{
  if (a2 == 5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  id v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      CFStringRef v5 = @"successful";
    }
    else {
      CFStringRef v5 = @"failed";
    }
    int v7 = 138543618;
    CFStringRef v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Log file creation %{public}@, OSLogEventStreamInvalidation: %lu", (uint8_t *)&v7, 0x16u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100022908(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = objc_alloc_init((Class)NSISO8601DateFormatter);
  id v4 = +[NSTimeZone systemTimeZone];
  [v12 setTimeZone:v4];

  CFStringRef v5 = [v3 date];
  uint64_t v6 = [v12 stringFromDate:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) seekToEndOfFile];
  int v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  CFStringRef v8 = [v3 process];
  __int16 v9 = [v3 composedMessage];

  uint64_t v10 = +[NSString stringWithFormat:@"%@: %@: %@\n", v6, v8, v9];
  id v11 = [v10 dataUsingEncoding:4];
  [v7 writeData:v11];
}

void sub_100023470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100023964(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100057E70)
  {
    v5[1] = _NSConcreteStackBlock;
    void v5[2] = 3221225472;
    v5[3] = sub_100023AA4;
    v5[4] = &unk_10004D040;
    v5[5] = v5;
    long long v6 = off_10004D028;
    uint64_t v7 = 0;
    qword_100057E70 = _sl_dlopen();
    id v3 = (void *)v5[0];
    unsigned int v2 = (void *)qword_100057E70;
    if (qword_100057E70)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  unsigned int v2 = (void *)qword_100057E70;
LABEL_5:
  result = dlsym(v2, "SFTerminateProcessNamed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100057E68 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100023AA4()
{
  uint64_t result = _sl_dlopen();
  qword_100057E70 = result;
  return result;
}

void sub_100023B18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_100023B4C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_100023B58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100023B74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

uint64_t sub_100023B8C()
{
  if (!qword_100057E78)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemodhelper", 0, 1uLL);
    v1 = (void *)qword_100057E78;
    qword_100057E78 = (uint64_t)mach_service;

    if (!qword_100057E78)
    {
      id v3 = sub_100027250();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Could not create XPC listener.", v4, 2u);
      }

      exit(1);
    }
    xpc_connection_set_event_handler((xpc_connection_t)qword_100057E78, &stru_10004D080);
    xpc_connection_resume((xpc_connection_t)qword_100057E78);
  }
  return 0;
}

void sub_100023C48(id a1, OS_xpc_object *a2)
{
  unsigned int v2 = a2;
  id v3 = (id)qword_100057E78;
  id v4 = v2;
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_connection)
  {
    if (v4 == (OS_xpc_object *)&_xpc_error_termination_imminent)
    {
      uint64_t v9 = sub_100027250();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      LOWORD(v12) = 0;
      uint64_t v10 = "XPC connection will be closed";
    }
    else
    {
      uint64_t v9 = sub_100027250();
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v4 != (OS_xpc_object *)&_xpc_error_connection_invalid)
      {
        if (v11)
        {
          LODWORD(v12) = 136446210;
          *(void *)((char *)&v12 + 4) = xpc_dictionary_get_string(v4, _xpc_error_key_description);
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got XPC error on listener connection: %{public}s", (uint8_t *)&v12, 0xCu);
        }

        xpc_connection_cancel((xpc_connection_t)qword_100057E78);
        exit(1);
      }
      if (!v11)
      {
LABEL_14:

        exit(0);
      }
      LOWORD(v12) = 0;
      uint64_t v10 = "No XPC connection, exiting";
    }
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 2u);
    goto LABEL_14;
  }
  uint64_t v5 = sub_100027250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100032B98();
  }

  long long v6 = v4;
  uint64_t v7 = sub_100027250();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start to deal with new connection", (uint8_t *)&v12, 2u);
  }

  *(void *)&long long v12 = _NSConcreteStackBlock;
  *((void *)&v12 + 1) = 3221225472;
  uint64_t v13 = sub_100023F88;
  __int16 v14 = &unk_10004D0A8;
  uint64_t v15 = v6;
  CFStringRef v8 = v6;
  xpc_connection_set_event_handler(v8, &v12);
  xpc_connection_resume(v8);
}

uint64_t start(uint64_t a1, uint64_t *a2)
{
  id v3 = sub_100027250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *a2;
    int v7 = 136446210;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s started", (uint8_t *)&v7, 0xCu);
  }

  sub_100023B8C();
  uint64_t v5 = +[NSRunLoop currentRunLoop];
  [v5 run];

  return 0;
}

void sub_100023F88(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  uint64_t v5 = sub_100027250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100032CC8();
  }

  long long v6 = sub_100027250();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (v7) {
      sub_100032C94();
    }

    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      sub_100032C68();
    }
    id v8 = *(id *)(a1 + 32);
    id v9 = v3;
    uint64_t v10 = sub_100027250();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100032C34();
    }

    BOOL v11 = +[MSDHMessageResponder sharedInstance];
    [v11 handleXPCMessage:v9 fromConnection:v8];

    long long v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100032C00();
    }
    goto LABEL_11;
  }
  if (v7) {
    sub_100032BCC();
  }

  if (v3 == &_xpc_error_connection_invalid)
  {
    long long v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v13 = "XPC disconnected by client";
      __int16 v14 = buf;
      goto LABEL_21;
    }
  }
  else
  {
    if (v3 != &_xpc_error_termination_imminent) {
      goto LABEL_12;
    }
    long long v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      uint64_t v13 = "XPC connection will be closed";
      __int16 v14 = (uint8_t *)&v15;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }
LABEL_11:

LABEL_12:
}

void sub_100024184(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000241F4(id a1)
{
  qword_100057E80 = objc_alloc_init(MSDXCTestSpawnWrapper);

  _objc_release_x1();
}

id sub_100027250()
{
  if (qword_100057E98 != -1) {
    dispatch_once(&qword_100057E98, &stru_10004D0E8);
  }
  v0 = (void *)qword_100057E90;

  return v0;
}

void sub_1000272A4(id a1)
{
  qword_100057E90 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "Default");

  _objc_release_x1();
}

id sub_1000272E8()
{
  if (qword_100057EA8 != -1) {
    dispatch_once(&qword_100057EA8, &stru_10004D108);
  }
  v0 = (void *)qword_100057EA0;

  return v0;
}

void sub_10002733C(id a1)
{
  qword_100057EA0 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");

  _objc_release_x1();
}

id sub_100027380()
{
  if (qword_100057EB8 != -1) {
    dispatch_once(&qword_100057EB8, &stru_10004D128);
  }
  v0 = (void *)qword_100057EB0;

  return v0;
}

void sub_1000273D4(id a1)
{
  qword_100057EB0 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "Message");

  _objc_release_x1();
}

id sub_100027418()
{
  if (qword_100057EC8 != -1) {
    dispatch_once(&qword_100057EC8, &stru_10004D148);
  }
  v0 = (void *)qword_100057EC0;

  return v0;
}

void sub_10002746C(id a1)
{
  if (os_variant_has_internal_content())
  {
    os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }
  else
  {
    os_log_t v1 = (os_log_t)&_os_log_disabled;
    id v2 = &_os_log_disabled;
  }
  id v3 = (void *)qword_100057EC0;
  qword_100057EC0 = (uint64_t)v1;
}

void sub_1000274DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  uint64_t v10 = +[MSDLogModel sharedInstance];
  [v10 logWithFormat:v9 andArgs:&a9];
}

void sub_100027590(id a1)
{
  qword_100057ED0 = objc_alloc_init(MSDLogModel);

  _objc_release_x1();
}

void sub_100027768(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100027B40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100027B50(uint64_t a1)
{
}

void sub_100027B58(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v14 = [*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2];
  long long v6 = [*(id *)(a1 + 40) description];
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = [*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1)
  {
    long long v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
    uint64_t v13 = [v12 description];
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }
  *a4 = 0;
}

void sub_100027E30(id a1)
{
  qword_100057EE0 = objc_alloc_init(MSDHMessageResponder);

  _objc_release_x1();
}

void sub_100028094(id a1)
{
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"updateSignedManifest", @"migratePreferencesFile:", @"stageDeviceForUpdateProcess:", @"clearStagedDeviceAfterUpdateProcess", @"prepareWorkDirectory:", @"removeWorkDirectory:", @"createDeviceManifest:", @"fileExistsAtPath:", @"readPlistFile:outContent:", @"touchFile:", @"cloneFile:", @"restoreBackupAttributes:", @"restoreAppDataAttributes:", @"deleteNvram:", @"writeNvram:", @"manageVolume:", @"disableLaunchdServicesForWatch:",
    @"moveStagingToFinal:",
    @"switchToBackupFolder:",
    @"reboot:",
    @"quitHelper:",
    @"collectDemoLogsToFolder:",
    @"preserveBluetoothFileToShelter:",
    @"restartBluetooth:",
    @"setComputerNameAndHostname:",
    @"executeTestScriptOfIdentifier:",
    @"preserveSecondPartyAppDataToShelter:outErrorDict:",
    @"setPreferences:",
  qword_100057EF0 = 0);

  _objc_release_x1();
}

id sub_1000282CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleXPCMessage:*(void *)(a1 + 40) fromConnection:*(void *)(a1 + 48)];
}

void sub_100029EBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10002ACBC(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSArray: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10002AD3C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "The value at index %lu in this xpcArray are of an unsupported type", (uint8_t *)&v2, 0xCu);
}

void sub_10002ADB4(void *a1, NSObject *a2)
{
  int v3 = 136315138;
  id v4 = [a1 objCType];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unsupported NSNumber type: %s for xpc dictionary encoding", (uint8_t *)&v3, 0xCu);
}

void sub_10002AE44(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The values in this NSArray are of an unsupported type", v1, 2u);
}

void sub_10002AE88()
{
  v0 = __error();
  strerror(*v0);
  sub_100005134();
  sub_10000514C((void *)&_mh_execute_header, v1, v2, "Cannot remove xattr for %{public}@ - %s", v3, v4, v5, v6, v7);
}

void sub_10002AF0C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not extract extended file attributes from %{public}@, returned %ld", (uint8_t *)&v3, 0x16u);
}

void sub_10002AF94()
{
  v0 = __error();
  strerror(*v0);
  sub_100005134();
  sub_10000514C((void *)&_mh_execute_header, v1, v2, "Coud not extract extended file attributes from %{public}@. File is expected to have extended attributes.  %s", v3, v4, v5, v6, v7);
}

void sub_10002B018(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = __error();
  uint8_t v7 = strerror(*v6);
  int v8 = 138543874;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  __int16 v12 = 2080;
  uint64_t v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to set xattr %{public}@ on %{public}@ - %s", (uint8_t *)&v8, 0x20u);
}

void sub_10002B0D4(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  unint64_t v4 = (unint64_t)[a1 length] >> 1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to malloc bytes of size: %lu", (uint8_t *)&v3, 0xCu);
}

void sub_10002B164(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "String should be all hex digits: %@ (bad digit around %ld)", (uint8_t *)&v3, 0x16u);
}

void sub_10002B1EC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Hex strings should have an even number of digits (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_10002B264(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B2DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B354(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B3CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B444(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B4BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "One or more components have an invalid platformType", v1, 2u);
}

void sub_10002B500(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315650;
  *(void *)&v3[4] = "-[MSDSignedManifestV7 initWithManifestData:]";
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2048;
  sub_100008E78((void *)&_mh_execute_header, a2, a3, "%s - InstallationOrder count (%lu) doesn't match number of components in manifest (%lu)", *(const char **)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10002B588(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B600(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B678(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B6F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B768(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B7E0()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing Info section for app:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002B854()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing both RealSize and Size values for app:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002B8C8()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - Missing Info section for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002B93C()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - ERROR - Missing both RealSize and Size values for package:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002B9B0()
{
  int v2 = 136315650;
  sub_100008E04();
  sub_100008E78((void *)&_mh_execute_header, v0, v1, "%s - Missing manifest data for section: %{public}@ for identifier: %{public}@", v2);
}

void sub_10002BA2C()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - Missing app object for app:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002BAA0()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - Missing version number for app:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002BB14()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - Missing package object for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002BB88()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - Missing version number for stand-alone package:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002BBFC()
{
  sub_100008E60();
  sub_100008E98((void *)&_mh_execute_header, v0, v1, "Info section is missing for item %{public}@ under component %{public}@.");
}

void sub_10002BC64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BCDC()
{
  sub_100008E60();
  sub_100008E98((void *)&_mh_execute_header, v0, v1, "Unrecognized container type: %{public}@ for component %{public}@");
}

void sub_10002BD44()
{
  sub_100008E50();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "No component %{public}@ under section %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002BDC8()
{
  sub_100008E50();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "No %{public}@ key in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002BE4C()
{
  sub_100008E50();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "No %{public}@ key in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002BED0()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - Failed to read manifest file:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002BF44(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  v4[0] = 136315394;
  sub_100008E04();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:  Failed to convert manifest file to property list.  Error:  %{public}@", (uint8_t *)v4, 0x16u);
}

void sub_10002BFE4()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s:  Missing Version number in manifest file:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002C058(void *a1, NSObject *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "+[MSDSignedManifestFactory readManifestFromFile:]";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 intValue];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:  Manifest version %d is not supported yet.", (uint8_t *)&v3, 0x12u);
}

void sub_10002C0F8()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s:  Manifest file is in wrong format:  %{public}@ - Must be NSDictionary.", v2, v3, v4, v5, 2u);
}

void sub_10002C16C()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s - Manifest file does not exist:  %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002C1E0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Can't create URL %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10002C258()
{
  sub_100008E60();
  sub_100008E98((void *)&_mh_execute_header, v0, v1, "Can't create read stream, %{public}@ %{public}@");
}

void sub_10002C2C0()
{
  sub_100008E60();
  sub_100008E98((void *)&_mh_execute_header, v0, v1, "Can't open read stream %{public}@ *** %{public}@");
}

void sub_10002C328(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C360(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C398(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Progress handler returned with status %d; failing verification",
    (uint8_t *)v2,
    8u);
}

void sub_10002C410(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C448(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping all items in current item domain due to insufficient free disk space.", buf, 2u);
}

void sub_10002C488(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a2, v4, "Failed to remove data shelter folder with error - %{public}@", v5);
}

void sub_10002C514(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  sub_10000C3E8((void *)&_mh_execute_header, a2, a3, "Failed to get system container path for powerlog %llu", (uint8_t *)&v4);
}

void sub_10002C588()
{
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, v0, v1, "Unexpected file type encountered for item %{public}@", v2);
}

void sub_10002C5F4()
{
  __error();
  sub_10000C400();
  sub_10000C430((void *)&_mh_execute_header, v0, v1, "Failed to dirstat item %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_10002C674()
{
  __error();
  sub_10000C400();
  sub_10000C430((void *)&_mh_execute_header, v0, v1, "Failed to stat item %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_10002C6F4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get answer for kMGQDiskUsage.", v1, 2u);
}

void sub_10002C738(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to extract disk space information.", v1, 2u);
}

void sub_10002C77C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a2, v4, "Enumeration error at (but will continue): %{public}@", v5);
}

void sub_10002C808()
{
  sub_10000C3DC();
  uint64_t v2 = [[(id)sub_10000C45C(v0, v1) localizedDescription];
  sub_10000C3A0();
  sub_10000C3BC((void *)&_mh_execute_header, v3, v4, "%s: Cannot find files/dirs under %@ - %@", v5, v6, v7, v8, 2u);
}

void sub_10002C8A0()
{
  sub_10000C3DC();
  uint64_t v1 = [v0 localizedDescription];
  sub_10000C418();
  sub_10000514C((void *)&_mh_execute_header, v2, v3, "Failed to remove:  %@ - Error:  %@", v4, v5, v6, v7, v8);
}

void sub_10002C930()
{
  sub_10000C3DC();
  uint64_t v1 = [v0 localizedDescription];
  sub_10000C418();
  sub_10000514C((void *)&_mh_execute_header, v2, v3, "Cannot remove %@ - %@", v4, v5, v6, v7, v8);
}

void sub_10002C9C0()
{
  sub_10000C3DC();
  uint64_t v2 = [[(id)sub_10000C45C(v0, v1) localizedDescription];
  sub_10000C3A0();
  sub_10000C3BC((void *)&_mh_execute_header, v3, v4, "%s: Cannot get attribute from %@ - %@", v5, v6, v7, v8, 2u);
}

void sub_10002CA58()
{
  sub_10000C3DC();
  uint64_t v2 = [[(id)sub_10000C45C(v0, v1) localizedDescription];
  sub_10000C3A0();
  sub_10000C3BC((void *)&_mh_execute_header, v3, v4, "%s: Cannot remove item: %@ - Error:  %@", v5, v6, v7, v8, 2u);
}

void sub_10002CAF0()
{
  sub_10000C3DC();
  uint64_t v2 = [[(id)sub_10000C45C(v0, v1) localizedDescription];
  sub_10000C3A0();
  sub_10000C3BC((void *)&_mh_execute_header, v3, v4, "%s - Failed to read attributes of folder:  %@ - Error:  %@", v5, v6, v7, v8, 2u);
}

void sub_10002CB88(uint64_t a1, void *a2)
{
  uint64_t v8 = [a2 localizedDescription];
  sub_10000C3BC((void *)&_mh_execute_header, v2, v3, "%s - Failed to create directory:  %@ - Error:  %@", v4, v5, v6, v7, 2u);
}

void sub_10002CC44(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 136315394;
  uint64_t v4 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Intermediate path:  %@ must be folder.", (uint8_t *)&v3, 0x16u);
}

void sub_10002CCDC()
{
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, v0, v1, "Cannot calculate original path for %@", v2);
}

void sub_10002CD48()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "File does not exist at %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002CDB0(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Get file attributes failed for %{public}@ with error - %{public}@", v5, v6, v7, v8, v9);
}

void sub_10002CE44()
{
  sub_10000F0C4();
  __error();
  sub_10000C400();
  sub_10000C430((void *)&_mh_execute_header, v0, v1, "Could not extract extended attributes from %{public}@.  Error:  %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_10002CEC0()
{
  sub_10000F0C4();
  __error();
  sub_10000C400();
  sub_10000C430((void *)&_mh_execute_header, v0, v1, "Could not extract extended attributes from %{public}@. File is expected to have extended attributes.  Error:  %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_10002CF3C()
{
  sub_10000F0C4();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000F0AC();
  sub_10000514C((void *)&_mh_execute_header, v1, v2, "Could not get ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_10002CFBC()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Could not allocate buffer for ACL.", v2, v3, v4, v5, v6);
}

void sub_10002CFF0()
{
  sub_10000F0C4();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000F0AC();
  sub_10000514C((void *)&_mh_execute_header, v1, v2, "Could not create ACL binary format for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_10002D070()
{
  sub_10000F0C4();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000F0AC();
  sub_10000514C((void *)&_mh_execute_header, v1, v2, "Could not validate ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_10002D0F0()
{
  sub_10000C450();
  sub_100008E98((void *)&_mh_execute_header, v0, v1, "Could not extract extended file attributes from %{public}@, returned %td");
}

void sub_10002D164()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Coud not extract extended file attributes from %{public}@. File is expected to have extended attributes.", v2, v3, v4, v5, v6);
}

void sub_10002D1CC()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Could not get attribute keys from file %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002D234(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Could not get destination of symbolic link %{public}@ with error - %{public}@", v5, v6, v7, v8, v9);
}

void sub_10002D2C8()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Cannot get file attribute for %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002D330()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Cannot get file extended attribute for %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002D398()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot allocate space.", v2, v3, v4, v5, v6);
}

void sub_10002D3CC()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Inconsistent return value from listxattr.", v2, v3, v4, v5, v6);
}

void sub_10002D400()
{
  sub_10000C450();
  sub_100008E98((void *)&_mh_execute_header, v0, v1, "Cannot remove extended attribte %{public}s from %{public}@.");
}

void sub_10002D474()
{
  sub_10000F0C4();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000F0AC();
  sub_10000514C((void *)&_mh_execute_header, v1, v2, "Could not create empty ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_10002D4F4()
{
  sub_10000F0C4();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000F0AC();
  sub_10000514C((void *)&_mh_execute_header, v1, v2, "Could not set ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_10002D574()
{
  sub_10000F0C4();
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000F0AC();
  sub_10000514C((void *)&_mh_execute_header, v1, v2, "Could not load ACL for %{public}@ with error - %{public}s", v3, v4, v5, v6, v7);
}

void sub_10002D5F4()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Could not set extended attributes on %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002D65C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Got non-data value", v2, v3, v4, v5, v6);
}

void sub_10002D690()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Got Non-string key", v2, v3, v4, v5, v6);
}

void sub_10002D6C4()
{
  sub_10000F0C4();
  __error();
  sub_10000C400();
  sub_10000C430((void *)&_mh_execute_header, v0, v1, "Could not set file permission on symlink %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_10002D740()
{
  sub_10000F0C4();
  __error();
  sub_10000C400();
  sub_10000C430((void *)&_mh_execute_header, v0, v1, "Could not set file ownership on symlink %{public}@ with error - %{public, errno}d", v2, v3, v4, v5, v6);
}

void sub_10002D7BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D834(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D8AC()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Could not initialize manifestVerifier", v2, v3, v4, v5, v6);
}

void sub_10002D8E0()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to parse bundle ID", v2, v3, v4, v5, v6);
}

void sub_10002D914()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "InstallationOrder failed the validation.", v2, v3, v4, v5, v6);
}

void sub_10002D948(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D9C0()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "InstallationOrder entry count does not match components listed in manifest.", v2, v3, v4, v5, v6);
}

void sub_10002D9F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DA6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DAE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DB5C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "getBackup is only for old manifest.", v2, v3, v4, v5, v6);
}

void sub_10002DB90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DC08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DC80()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Loading Domains.plist failed", v2, v3, v4, v5, v6);
}

void sub_10002DCB4()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "No certificates found in the manifest.", v2, v3, v4, v5, v6);
}

void sub_10002DCE8()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "rigorousTesting failed.", v2, v3, v4, v5, v6);
}

void sub_10002DD1C()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: No matching certificate for %{public}@.", v2, v3, v4, v5, 2u);
}

void sub_10002DD90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DE08()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Failed to parse payload for item: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002DE70()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: signature type for certificate %{public}@ does not exist", v2, v3, v4, v5, 2u);
}

void sub_10002DEE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DF5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002DFD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E04C()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Could not locate the file:%{public}@", v2, v3, v4, v5, v6);
}

void sub_10002E0B4(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s:There is unexpected invalid signature/entitlements:%08x", (uint8_t *)&v1, 0x12u);
}

void sub_10002E144()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s Could not find a data container for:%{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002E1B8()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: %{public}@ section is not a dictionary", v2, v3, v4, v5, 2u);
}

void sub_10002E22C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E2A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E31C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Can not load appleIST leaf certificate", v2, v3, v4, v5, v6);
}

void sub_10002E350()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Can not load appleIST intermediate certificate", v2, v3, v4, v5, v6);
}

void sub_10002E384(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E3FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E474(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E4E4()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "OU did not match for appleIST cert.:%{public}@\n", v2, v3, v4, v5, v6);
}

void sub_10002E54C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "appleIST certificate count is unexpected\n", v2, v3, v4, v5, v6);
}

void sub_10002E580(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E5F8()
{
  sub_10001642C();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: certificate trust evaluation failed: %ld", v2, v3, v4, v5, 2u);
}

void sub_10002E670(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E6E8()
{
  sub_10001642C();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: Cannot evaluate trust: %ld", v2, v3, v4, v5, 2u);
}

void sub_10002E760()
{
  sub_10001642C();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: Cannot set anchor certificates: %ld", v2, v3, v4, v5, 2u);
}

void sub_10002E7D8()
{
  sub_10001642C();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: Cannot create secure trust object: %ld", v2, v3, v4, v5, 2u);
}

void sub_10002E850(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E8C8(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDDemoManifestCheck verifySignature:forData:withKey:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Failed in verifying signature(%d)", (uint8_t *)&v2, 0x12u);
}

void sub_10002E954()
{
  sub_10000F0E8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "verifySignature is called", v1, 2u);
}

void sub_10002E994(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EA0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EA84()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Apps signed by IS&T can only have Provisioning Profiles dependency.", v2, v3, v4, v5, v6);
}

void sub_10002EAB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EB30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EBA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EC20(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 136315650;
  uint64_t v5 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed rigorous check for:%{public}@ (from %{public}@)", (uint8_t *)&v4, 0x20u);
}

void sub_10002ECBC()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Apple IST certificate is used to sign %{public}@ unexpected component", v2, v3, v4, v5, v6);
}

void sub_10002ED24()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002ED98()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002EE0C()
{
  sub_100008E04();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%{public}@ key does not exist in component %{public}@", v2, v3, v4, v5, 2u);
}

void sub_10002EE80()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Component %{public}@ is not a Settings component", v2, v3, v4, v5, v6);
}

void sub_10002EEE8()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "File attributes are nil for %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002EF50()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Whitelist checker failed", v2, v3, v4, v5, v6);
}

void sub_10002EF84()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "System container check failed for file:%{public}@", v2, v3, v4, v5, v6);
}

void sub_10002EFEC()
{
  sub_10000C450();
  sub_100008E98((void *)&_mh_execute_header, v0, v1, "File permissions failed for file:%{public}@(%ld)");
}

void sub_10002F060()
{
  sub_10000C450();
  sub_100008E98((void *)&_mh_execute_header, v0, v1, "Not a valid fileType (%{public}@) for file: %{public}@");
}

void sub_10002F0D4()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "IS&T signed component in wrong format (no manifest) for %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002F13C()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "IS&T signed component in wrong format (symlink target) for %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002F1A4()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Failed to get path components for file: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002F20C()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Invalid data container file. %{public}@", v2, v3, v4, v5, v6);
}

void sub_10002F274()
{
  sub_10000F0E8();
  sub_100016EF8((void *)&_mh_execute_header, v0, v1, "Failed to set up directory traversal tree.", v2);
}

void sub_10002F2AC(unsigned char *a1, unsigned char *a2)
{
  sub_100016F10(a1, a2);
  sub_100016EF8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to get file descriptor.", v3);
}

void sub_10002F2DC(unsigned char *a1, unsigned char *a2)
{
  sub_100016F10(a1, a2);
  sub_100016EF8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to write data to disk", v3);
}

void sub_10002F30C(unsigned char *a1, unsigned char *a2)
{
  sub_100016F10(a1, a2);
  sub_100016EF8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to write metadata to disk.", v3);
}

void sub_10002F33C(unsigned char *a1, unsigned char *a2)
{
  sub_100016F10(a1, a2);
  sub_100016EF8((void *)&_mh_execute_header, v2, (uint64_t)v2, "Failed to read from disk.", v3);
}

void sub_10002F36C()
{
  sub_10000F0E8();
  sub_100016EF8((void *)&_mh_execute_header, v0, v1, "Fatal error occurred during tree traversal.", v2);
}

void sub_10002F3A4()
{
  sub_10000F0E8();
  sub_100016EF8((void *)&_mh_execute_header, v0, v1, "Failed to open dst file name.", v2);
}

void sub_10002F3DC()
{
  sub_10000F0E8();
  sub_100016EF8((void *)&_mh_execute_header, v0, v1, "Invalid src or dest path.", v2);
}

void sub_10002F414(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot load Domains.plist: %{public}@.", (uint8_t *)&v2, 0xCu);
}

void sub_10002F48C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find CameraRollDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_10002F4C0()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find HomeDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_10002F4F4()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find KeychainDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_10002F528()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find MediaDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_10002F55C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RootDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_10002F590()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find SystemPreferencesDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_10002F5C4()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find KeyboardDomain, or in wrong format.", v2, v3, v4, v5, v6);
}

void sub_10002F5F8()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under SystemPreferencesDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F62C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under RootDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F660()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToRemoveIfNotRestored under RootDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F694()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToRestore under RootDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F6C8()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under RootDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F6FC()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToBackupAndRestore under MediaDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F730()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F764()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F798()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F7CC()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToRestoreOnly under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F800()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Backup DoNotDisturb DB - Cannot find RelativePathsToOnlyBackupEncrypted under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F834()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToBackupAndRestore under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F868()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToRestoreOnly under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F89C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsToOnlyBackupEncrypted under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F8D0()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Backup SafariTabs.db - Cannot find RelativePathsNotToBackupToService under HomeDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F904()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F938()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackupToService under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F96C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackupInMegaBackup under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F9A0()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRestoreOnly under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_10002F9D4()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToOnlyBackupEncrypted under HomeKitDomain.", v2, v3, v4, v5, v6);
}

void sub_10002FA08()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsNotToBackup under CameraRollDomain.", v2, v3, v4, v5, v6);
}

void sub_10002FA3C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Cannot find RelativePathsToRemoveOnRestore under CameraRollDomain.", v2, v3, v4, v5, v6);
}

void sub_10002FA70()
{
  sub_10000F0C4();
  __error();
  sub_10001A3C8();
  sub_10001A3E0((void *)&_mh_execute_header, v0, v1, "Cannot open volume(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10002FAEC()
{
  sub_10000F0C4();
  __error();
  sub_10001A3C8();
  sub_10001A3E0((void *)&_mh_execute_header, v0, v1, "Cannot revert snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10002FB68()
{
  sub_10000F0C4();
  __error();
  sub_10001A3C8();
  sub_10001A3E0((void *)&_mh_execute_header, v0, v1, "Cannot delete snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10002FBE4()
{
  sub_10000F0C4();
  __error();
  sub_10001A3C8();
  sub_10001A3E0((void *)&_mh_execute_header, v0, v1, "Cannot create snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10002FC60()
{
  sub_10000F0C4();
  __error();
  sub_10001A3C8();
  sub_10001A3E0((void *)&_mh_execute_header, v0, v1, "Cannot mount snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10002FCDC()
{
  sub_10000F0C4();
  __error();
  sub_10001A3C8();
  sub_10001A3E0((void *)&_mh_execute_header, v0, v1, "Cannot unmount snapshot(%d).  Errno:  %{errno}d", v2, v3, v4, v5, v6);
}

void sub_10002FD58()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to locate keyword '/dev/'.", v2, v3, v4, v5, v6);
}

void sub_10002FD8C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to find volume IO service.", v2, v3, v4, v5, v6);
}

void sub_10002FDC0()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to find container BSD name.", v2, v3, v4, v5, v6);
}

void sub_10002FDF4()
{
  sub_10001A43C();
  sub_10001A400((void *)&_mh_execute_header, v0, v1, "Failed to create IO iterator with error - %d", v2, v3, v4, v5, v6);
}

void sub_10002FE5C()
{
  __error();
  sub_10001A448((void *)&_mh_execute_header, v0, v1, "Failed to statfs '/' with error - %{public, errno}d", v2, v3, v4, v5, 0);
}

void sub_10002FEDC()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Invalid FSIndex for APFS volume.", v2, v3, v4, v5, v6);
}

void sub_10002FF10()
{
  sub_10001A43C();
  sub_10001A400((void *)&_mh_execute_header, v0, v1, "Failed to create APFS volume. error - %d", v2, v3, v4, v5, v6);
}

void sub_10002FF78()
{
  sub_10001A43C();
  sub_10001A400((void *)&_mh_execute_header, v0, v1, "Failed to delete APFS volume. error - %d", v2, v3, v4, v5, v6);
}

void sub_10002FFE0(void *a1, unint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1 >> 20;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  unint64_t v7 = a2 >> 20;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Free space left: %llu MB but needed: %lld MB", (uint8_t *)&v4, 0x16u);
}

void sub_100030074()
{
  sub_10001A43C();
  sub_10001A400((void *)&_mh_execute_header, v0, v1, "Failed to get space info. error - %d", v2, v3, v4, v5, v6);
}

void sub_1000300DC()
{
  sub_10001A43C();
  sub_10001A400((void *)&_mh_execute_header, v0, v1, "Failed to scan IO Registry. error - %d", v2, v3, v4, v5, v6);
}

void sub_100030144()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10001A41C((void *)&_mh_execute_header, v1, v2, "Failed to get mounted filesystem info - %{public}s", v3, v4, v5, v6, 2u);
}

void sub_1000301C8(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10001A41C((void *)&_mh_execute_header, v2, v3, "Failed to set file attributes on mount point - %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100030250()
{
  __error();
  sub_10001A448((void *)&_mh_execute_header, v0, v1, "Failed to get file stat - %{errno}d", v2, v3, v4, v5, 0);
}

void sub_1000302D0(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to create mount point at '%{public}@' - %{public}@", v5, v6, v7, v8, v9);
}

void sub_100030364()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Volume is already mounted.", v2, v3, v4, v5, v6);
}

void sub_100030398(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to remove mount point at '%{public}@' -  %{public}@", v5, v6, v7, v8, v9);
}

void sub_10003042C()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10001A41C((void *)&_mh_execute_header, v1, v2, "Failed to unmount APFS volume - %{public}s", v3, v4, v5, v6, 2u);
}

void sub_1000304B0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to synchronize with CFPreferences.", v1, 2u);
}

void sub_1000304F4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDManifest addFilesUsingSourceManifest:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Root path must be the same between source and device manifest.", (uint8_t *)&v1, 0xCu);
}

void sub_100030578(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 path];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Couldn't get meta data for %{public}@", a1, 0xCu);
}

void sub_1000305F0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 path];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Couldn't run handler against %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_100030688(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "rootPath already specified. Could not add more files.", v1, 2u);
}

void sub_1000306CC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 absoluteString];
  int v4 = [v3 stringByRemovingPercentEncoding];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot read file %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_10003077C(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = [a1 absoluteString];
  uint64_t v6 = [v5 stringByRemovingPercentEncoding];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Cannot read data from %{public}@ - %{public}@.", (uint8_t *)&v7, 0x16u);
}

void sub_10003083C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSDictionary: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_1000308BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "The value for key %{public}@ has a type that is not supported yet", (uint8_t *)&v2, 0xCu);
}

void sub_100030934(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_opt_class();
  int v7 = 138543618;
  uint64_t v8 = a1;
  sub_10001D764();
  id v6 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "The value for key %{public}@ has unsupported type %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_1000309D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030A5C(void *a1)
{
  int v2 = [a1 localizedDescription];
  [a1 code];
  sub_10001D740();
  sub_10000C3BC((void *)&_mh_execute_header, v3, v4, "Failed to deserialize JSON object with error - %{public}@(0x%tx). Target: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100030AF8()
{
  sub_10001D764();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100030B70(void *a1)
{
  uint64_t v2 = [a1 localizedDescription];
  [a1 code];
  sub_10001D740();
  sub_10000C3BC((void *)&_mh_execute_header, v3, v4, "Failed to serialize JSON object - %{public}@(0x%tx). Target: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100030C0C()
{
  sub_10001D764();
  sub_100008E34((void *)&_mh_execute_header, v0, v1, "%s: Not a valid JSON object: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_100030C84(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create manifest from manifest data.", v1, 2u);
}

void sub_100030CC8()
{
  v1[0] = 136315394;
  sub_100008E04();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed metadata attribute restore for %{public}@!", (uint8_t *)v1, 0x16u);
}

void sub_100030D48(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 deviceUID];
  int v4 = *__error();
  uint64_t v5 = __error();
  uint64_t v6 = strerror(*v5);
  int v7 = 136315906;
  uint64_t v8 = "-[MSDHFileMetadataRestore _gatherDeviceDemoUserAccountInfo]";
  __int16 v9 = 2114;
  uint64_t v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 2082;
  id v14 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s - Failed to get password entry for UID:  %{public}@ - errno:  %d - %{public}s", (uint8_t *)&v7, 0x26u);
}

void sub_100030E28(void *a1, _DWORD *a2, NSObject *a3)
{
  uint64_t v5 = [a1 deviceUID];
  LODWORD(a2) = *a2;
  int v6 = *__error();
  int v7 = __error();
  uint64_t v8 = strerror(*v7);
  int v9 = 136316162;
  uint64_t v10 = "-[MSDHFileMetadataRestore _gatherDeviceDemoUserAccountInfo]";
  __int16 v11 = 2114;
  int v12 = v5;
  __int16 v13 = 1024;
  int v14 = (int)a2;
  __int16 v15 = 1024;
  int v16 = v6;
  __int16 v17 = 2082;
  uint64_t v18 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s - Failed to get group entry for UID:  %{public}@ with group ID:  %d - errno:  %d - %{public}s", (uint8_t *)&v9, 0x2Cu);
}

void sub_100030F18()
{
  v1[0] = 136315394;
  sub_100008E04();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s - Failed to update file attributes for file:  %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_100030F98(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "File %{public}@ belong to UID: %{public}@; file metadata does not need to be updated",
    (uint8_t *)&v3,
    0x16u);
}

void sub_100031020(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "-[MSDHOperations updateSignedManifest]";
  __int16 v5 = 2114;
  CFStringRef v6 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist";
  sub_100023B18((void *)&_mh_execute_header, a1, a3, "%s - Cannot load manifest:  %{public}@", (uint8_t *)&v3);
}

void sub_1000310B0(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "-[MSDHOperations updateSignedManifest]";
  __int16 v5 = 2114;
  CFStringRef v6 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist";
  sub_100023B18((void *)&_mh_execute_header, a1, a3, "%s - Manifest file does not exist:  %{public}@", (uint8_t *)&v3);
}

void sub_100031140()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Couldn't change ownership for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000311A8()
{
  sub_100008E60();
  sub_100023B18((void *)&_mh_execute_header, v0, (uint64_t)v0, "Couldn't move %{public}@ to %{public}@", v1);
}

void sub_100031218()
{
  sub_10000C3DC();
  uint64_t v1 = [v0 localizedDescription];
  sub_100023B30();
  sub_10000C3BC((void *)&_mh_execute_header, v2, v3, "%s: Cannot get attribute from %{public}@ - %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000312B4()
{
  sub_10000C3DC();
  uint64_t v1 = [v0 localizedDescription];
  sub_100023B30();
  sub_10000C3BC((void *)&_mh_execute_header, v2, v3, "%s: Cannot set attribute for %{public}@ - %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100031350()
{
  sub_10000C3DC();
  uint64_t v1 = [v0 localizedDescription];
  sub_100023B30();
  sub_10000C3BC((void *)&_mh_execute_header, v2, v3, "%s: Cannot create direcotry at %{public}@ - %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000313EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031464()
{
  int v3 = 136315650;
  uint64_t v4 = "-[MSDHOperations createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
  sub_10001D764();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: No manifest data found for component: %{public}@ of type: %{public}@", (uint8_t *)&v3, 0x20u);
}

void sub_1000314F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003156C(void *a1, NSObject *a2)
{
  int v3 = [a1 localizedDescription];
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a2, v4, "Cannot write device manifest with error - %{public}@", v5);
}

void sub_1000315F8()
{
  sub_10000C3DC();
  os_log_t v2 = [sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to read plist file at %{public}@ - %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031684()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "No file path specified for touch.", v2, v3, v4, v5, v6);
}

void sub_1000316B8()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Failed to touch file path: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100031720()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Couldn't locate options node in IODeviceTree", v2, v3, v4, v5, v6);
}

void sub_100031754()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Couldn't force sync new nvram to device", v2, v3, v4, v5, v6);
}

void sub_100031788()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Couldn't locate bootstrap_port mach port", v2, v3, v4, v5, v6);
}

void sub_1000317BC()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Couldn't write nvram", v2, v3, v4, v5, v6);
}

void sub_1000317F0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10001D764();
  sub_10000514C((void *)&_mh_execute_header, v2, v3, "Failed to create folder at: %{public}@ error: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100031884(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10001D764();
  sub_10000514C((void *)&_mh_execute_header, v2, v3, "Failed to remove folder at: %{public}@ error: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_100031918()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "No user name provided for user volume.", v2, v3, v4, v5, v6);
}

void sub_10003194C()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Cannot locate home path for user %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000319B4()
{
  sub_10000C3DC();
  uint64_t v2 = [[sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to create folder: %{public}@ error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031A40()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Failed to delete folder: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100031AA8()
{
  sub_10000C3DC();
  uint64_t v2 = [[(id)sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to get file attributes of %{public}@ - %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031B34()
{
  sub_10000C3DC();
  uint64_t v2 = [[(id)sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Cannot get destination path for %{public}@ - %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031BC0()
{
  sub_10000C3DC();
  uint64_t v2 = [[(id)sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Cannot remove symlink %{public}@ - %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031C4C()
{
  sub_10000C3DC();
  uint64_t v2 = [[sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Could not remove %{public}@ with error - %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031CD8()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Staging path %{public}@ does not exist.", v2, v3, v4, v5, v6);
}

void sub_100031D40()
{
  sub_10000C3DC();
  uint64_t v2 = [[sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to read destination of symbolic link at: %{public}@ error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031DCC()
{
  sub_10000C3DC();
  uint64_t v2 = [[sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to remove symbolic link at %{public}@: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031E58(NSObject *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_100023B74((void *)&_mh_execute_header, a1, v3, "Failed to rename temporary user backup folder to the real user backup folder: %{errno}d", (uint8_t *)v4);
}

void sub_100031EE0()
{
  sub_10000C3DC();
  int v2 = [[(id)sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to create directory at: %{public}@ error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100031F6C(NSObject *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_100023B74((void *)&_mh_execute_header, a1, v3, "Failed to rename temporary backup folder to the real backup folder: %{errno}d", (uint8_t *)v4);
}

void sub_100031FF4(int a1, NSObject *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_100023B74((void *)&_mh_execute_header, a2, a3, "Failed to reboot device with error - %d", (uint8_t *)v3);
}

void sub_100032064()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Faild to initialize MSDHFileMetadataRestore", v2, v3, v4, v5, v6);
}

void sub_100032098(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032110()
{
  sub_10000C450();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_100023B18((void *)&_mh_execute_header, v1, (uint64_t)v1, "Couldn't load manifest dict for backup range location = %lu; size_t length = %lu",
    v2);
}

void sub_10003218C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "MSDHFileMetadataRestore uninitialized", v2, v3, v4, v5, v6);
}

void sub_1000321C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032238()
{
  sub_100008E60();
  sub_100023B18((void *)&_mh_execute_header, v0, (uint64_t)v0, "Couldn't load manifest dict for %{public}@/%{public}@", v1);
}

void sub_1000322A8()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to get answer for kMGQDiskUsage.", v2, v3, v4, v5, v6);
}

void sub_1000322DC(void *a1, NSObject *a2)
{
  [a1 longLongValue];
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a2, v3, "Not enough disk space to collect logs. Available: %lld", v4);
}

void sub_10003235C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to create zip file.", v2, v3, v4, v5, v6);
}

void sub_100032390()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to copy finish_demo_restore logs.", v2, v3, v4, v5, v6);
}

void sub_1000323C4()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to generate DemoLoop logs", v2, v3, v4, v5, v6);
}

void sub_1000323F8()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to generate demod logs", v2, v3, v4, v5, v6);
}

void sub_10003242C()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to create tmp log directory.", v2, v3, v4, v5, v6);
}

void sub_100032460()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to remove log directory.", v2, v3, v4, v5, v6);
}

void sub_100032494()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "Failed to remove compressed log stream file.", v2, v3, v4, v5, v6);
}

void sub_1000324C8()
{
  sub_10000C3DC();
  uint64_t v2 = [[(id)sub_100023B4C(v0, v1) localizedDescription];
  sub_10000F0D0();
  sub_10000514C((void *)&_mh_execute_header, v3, v4, "Failed to create parent folder %{public}@ with error - %{public}@", v5, v6, v7, v8, v9);
}

void sub_100032554()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "The following file doesnt exist: %{public}@. Skipping the copy.", v2, v3, v4, v5, v6);
}

void sub_1000325BC()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void sub_100032624()
{
  sub_10000C450();
  sub_100023B58((void *)&_mh_execute_header, v0, v1, "Final dataShelterSize:  %llu", v2, v3, v4, v5, v6);
}

void sub_10003268C()
{
  sub_10000C450();
  sub_100023B58((void *)&_mh_execute_header, v0, v1, "Current dataShelterSize:  %llu", v2, v3, v4, v5, v6);
}

void sub_1000326F4()
{
  sub_10000C450();
  sub_100023B58((void *)&_mh_execute_header, v0, v1, "sourceDataSize:  %llu", v2, v3, v4, v5, v6);
}

uint64_t sub_10003275C()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_100032780(v0);
}

void sub_100032780(int a1, NSObject *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_100023B74((void *)&_mh_execute_header, a2, a3, "Failed to restart bluetoothd: %d", (uint8_t *)v3);
}

void sub_1000327F0(NSObject *a1)
{
  int v2 = SCError();
  SCErrorString(v2);
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a1, v3, "SCPreferencesCreate failed - Error:  %{public}s", v4);
}

void sub_100032874(NSObject *a1)
{
  int v2 = SCError();
  SCErrorString(v2);
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a1, v3, "SCPreferencesSetComputerName failed - Error:  %{public}s", v4);
}

void sub_1000328F8()
{
  sub_10000F0E8();
  sub_100009CE0((void *)&_mh_execute_header, v0, v1, "_CSCopyLocalHostnameForComputerName failed.", v2, v3, v4, v5, v6);
}

void sub_10003292C(NSObject *a1)
{
  int v2 = SCError();
  SCErrorString(v2);
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a1, v3, "SCPreferencesSetLocalHostName failed - Error:  %{public}s", v4);
}

void sub_1000329B0(NSObject *a1)
{
  int v2 = SCError();
  SCErrorString(v2);
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a1, v3, "SCPreferencesCommitChanges failed - Error:  %{public}s", v4);
}

void sub_100032A34(NSObject *a1)
{
  int v2 = SCError();
  SCErrorString(v2);
  sub_10000C450();
  sub_10000C3E8((void *)&_mh_execute_header, a1, v3, "SCPreferencesApplyChanges failed - Error:  %{public}s", v4);
}

void sub_100032AB8()
{
  sub_10000C450();
  sub_100023B58((void *)&_mh_execute_header, v0, v1, "hostName:  %{public}@", v2, v3, v4, v5, v6);
}

void sub_100032B20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100032B98()
{
  sub_10000F0E8();
  sub_100024184((void *)&_mh_execute_header, v0, v1, "It's an XPC_TYPE_CONNECTION", v2, v3, v4, v5, v6);
}

void sub_100032BCC()
{
  sub_10000F0E8();
  sub_100024184((void *)&_mh_execute_header, v0, v1, "It's an XPC_TYPE_ERROR", v2, v3, v4, v5, v6);
}

void sub_100032C00()
{
  sub_10000F0E8();
  sub_100024184((void *)&_mh_execute_header, v0, v1, "Message handled", v2, v3, v4, v5, v6);
}

void sub_100032C34()
{
  sub_10000F0E8();
  sub_100024184((void *)&_mh_execute_header, v0, v1, "MSDH: Received a XPC request", v2, v3, v4, v5, v6);
}

void sub_100032C68()
{
  __assert_rtn("MSDH_handle_connection_block_invoke", "demod_helper.m", 56, "type == XPC_TYPE_DICTIONARY");
}

void sub_100032C94()
{
  sub_10000F0E8();
  sub_100024184((void *)&_mh_execute_header, v0, v1, "Received an XPC request?", v2, v3, v4, v5, v6);
}

void sub_100032CC8()
{
  sub_10000F0E8();
  sub_100024184((void *)&_mh_execute_header, v0, v1, "Checking the type", v2, v3, v4, v5, v6);
}

void sub_100032CFC(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000C450();
  sub_10001A41C((void *)&_mh_execute_header, v2, v3, "Failed to load JSON data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100032D80(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000C450();
  sub_10001A41C((void *)&_mh_execute_header, v2, v3, "Failed to deserialize JSON data: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100032E04(uint64_t a1, int a2, os_log_t log)
{
  v3[0] = 67240450;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to run xctspawn: %{public, errno}d stdout: %{public}@", (uint8_t *)v3, 0x12u);
}

void sub_100032E8C(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000C450();
  sub_10001A41C((void *)&_mh_execute_header, v2, v3, "Failed to locate xctspawn tool: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100032F10(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10000C450();
  sub_10001A41C((void *)&_mh_execute_header, v2, v3, "Failed to get file last modified date: %{public}@", v4, v5, v6, v7, v8);
}

void sub_100032F94(int a1, NSObject *a2)
{
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to run xctspawn: %{public, errno}d", (uint8_t *)v2, 8u);
}

void sub_10003300C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No test plan found.", v1, 2u);
}

void sub_100033050(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No test target found.", v1, 2u);
}

void sub_100033094()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000C450();
  sub_10001A41C((void *)&_mh_execute_header, v1, v2, "ip address - inet_ntop failed - %s", v3, v4, v5, v6, v7);
}

void sub_100033114()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000C450();
  sub_10001A41C((void *)&_mh_execute_header, v1, v2, "net mask - inet_ntop failed - %s", v3, v4, v5, v6, v7);
}

void sub_100033194()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000C450();
  sub_10001A41C((void *)&_mh_execute_header, v1, v2, "broadcast addr - inet_ntop failed - %s", v3, v4, v5, v6, v7);
}

void sub_100033214(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing interface name", buf, 2u);
}

void sub_100033254()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_10000C450();
  sub_10001A41C((void *)&_mh_execute_header, v1, v2, "getifaddrs failed - %s", v3, v4, v5, v6, v7);
}

void sub_1000332D4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint8_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to remove file from %{public}@ - %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100033388(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to set file attributes: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100033400(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6 = *__error();
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to clonefile from %{public}@ to %{public}@ - %{errno}d", (uint8_t *)&v7, 0x1Cu);
}

void sub_1000334B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cannot load domains.plist from %{public}@.", (uint8_t *)&v2, 0xCu);
}

void sub_100033530(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot find domains.", v1, 2u);
}

void sub_100033574(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot generate custom domains.", v1, 2u);
}

void sub_1000335B8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Manifest file path %{public}@ is not same as real path: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_100033640(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[WhitelistChecker handleSystemContainerFiles:withMetadata:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:Container check failed for %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_1000336CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033744(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000337BC()
{
  v1[0] = 136315394;
  sub_100008E04();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: format not correct: %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_10003383C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033874()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "failed to create directory at %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000338DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033914(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003398C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033A04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033A7C()
{
  v1[0] = 136315394;
  sub_100008E04();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Entering %s with parameter: %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_100033AFC()
{
  sub_10000C450();
  __int16 v3 = 1026;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "INFO - computerName:  %{public}@ - encoding:  0x%{public}x", v2, 0x12u);
}

void sub_100033B80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100033BF8()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "selector is nil for command: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100033C60(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [(id)objc_opt_class() description];
  sub_10000C450();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ does not respond to %{public}@.", v6, 0x16u);
}

void sub_100033D10()
{
  sub_10000C450();
  sub_100008E18((void *)&_mh_execute_header, v0, v1, "Command not allowed: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100033D78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t APFSContainerGetSpaceInfo()
{
  return _APFSContainerGetSpaceInfo();
}

uint64_t APFSVolumeCreate()
{
  return _APFSVolumeCreate();
}

uint64_t APFSVolumeDelete()
{
  return _APFSVolumeDelete();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayGetCountOfValue(theArray, range, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return _CFDateGetAbsoluteTime(theDate);
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return _CFReadStreamRead(stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MISValidateSignatureAndCopyInfo()
{
  return _MISValidateSignatureAndCopyInfo();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

Boolean SCPreferencesSetComputerName(SCPreferencesRef prefs, CFStringRef name, CFStringEncoding nameEncoding)
{
  return _SCPreferencesSetComputerName(prefs, name, nameEncoding);
}

Boolean SCPreferencesSetLocalHostName(SCPreferencesRef prefs, CFStringRef name)
{
  return _SCPreferencesSetLocalHostName(prefs, name);
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return _SecCertificateCopyCommonName(certificate, commonName);
}

uint64_t SecCertificateCopyOrganizationalUnit()
{
  return _SecCertificateCopyOrganizationalUnit();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
}

OSStatus SecKeyRawVerify(SecKeyRef key, SecPadding padding, const uint8_t *signedData, size_t signedDataLen, const uint8_t *sig, size_t sigLen)
{
  return _SecKeyRawVerify(key, padding, signedData, signedDataLen, sig, sigLen);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return _SecKeyVerifySignature(key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateDemoDigitalCatalogSigning()
{
  return _SecPolicyCreateDemoDigitalCatalogSigning();
}

uint64_t SecPolicyCreateMobileStoreSigner()
{
  return _SecPolicyCreateMobileStoreSigner();
}

uint64_t SecPolicyCreateTestMobileStoreSigner()
{
  return _SecPolicyCreateTestMobileStoreSigner();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return _SecTrustCopyPublicKey(trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return _SecTrustCreateWithCertificates(certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustEvaluate(trust, result);
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return _SecTrustSetAnchorCertificates(trust, anchorCertificates);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CSCopyLocalHostnameForComputerName()
{
  return __CSCopyLocalHostnameForComputerName();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

ssize_t acl_copy_ext(void *buf_p, acl_t acl, ssize_t size)
{
  return _acl_copy_ext(buf_p, acl, size);
}

acl_t acl_copy_int(const void *buf_p)
{
  return _acl_copy_int(buf_p);
}

int acl_free(void *obj_p)
{
  return _acl_free(obj_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return _acl_get_file(path_p, type);
}

acl_t acl_init(int count)
{
  return _acl_init(count);
}

int acl_set_file(const char *path_p, acl_type_t type, acl_t acl)
{
  return _acl_set_file(path_p, type, acl);
}

ssize_t acl_size(acl_t acl)
{
  return _acl_size(acl);
}

int acl_valid(acl_t acl)
{
  return _acl_valid(acl);
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_read_disk_entry_from_file()
{
  return _archive_read_disk_entry_from_file();
}

uint64_t archive_read_disk_new()
{
  return _archive_read_disk_new();
}

uint64_t archive_read_disk_set_standard_lookup()
{
  return _archive_read_disk_set_standard_lookup();
}

uint64_t archive_read_free()
{
  return _archive_read_free();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_filename()
{
  return _archive_write_open_filename();
}

uint64_t archive_write_set_format_zip()
{
  return _archive_write_set_format_zip();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return _container_create_or_lookup_path_for_current_user();
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

uint64_t dirstat_np()
{
  return _dirstat_np();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fs_snapshot_create(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_create(a1, a2, a3);
}

int fs_snapshot_delete(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_delete(a1, a2, a3);
}

int fs_snapshot_mount(int a1, const char *a2, const char *a3, uint32_t a4)
{
  return _fs_snapshot_mount(a1, a2, a3, a4);
}

int fs_snapshot_revert(int a1, const char *a2, uint32_t a3)
{
  return _fs_snapshot_revert(a1, a2, a3);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

group *__cdecl getgrgid(gid_t a1)
{
  return _getgrgid(a1);
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return _getmntinfo_r_np(a1, a2);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

uint64_t launch_get_service_enabled()
{
  return _launch_get_service_enabled();
}

uint64_t launch_set_service_enabled()
{
  return _launch_set_service_enabled();
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return _listxattr(path, namebuff, size, options);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int mount(const char *a1, const char *a2, int a3, void *a4)
{
  return _mount(a1, a2, a3, a4);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t reboot3()
{
  return _reboot3();
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return _xpc_data_create_with_dispatch_data(ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return _xpc_date_create(interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return _xpc_date_get_value(xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
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

xpc_object_t xpc_double_create(double value)
{
  return _xpc_double_create(value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return [a1 _createDispatchData];
}

id objc_msgSend__gatherDeviceDemoUserAccountInfo(void *a1, const char *a2, ...)
{
  return [a1 _gatherDeviceDemoUserAccountInfo];
}

id objc_msgSend__testProductsPath(void *a1, const char *a2, ...)
{
  return [a1 _testProductsPath];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowedISTSignedComponents(void *a1, const char *a2, ...)
{
  return [a1 allowedISTSignedComponents];
}

id objc_msgSend_allowedSymLinks(void *a1, const char *a2, ...)
{
  return [a1 allowedSymLinks];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_blackListedPaths(void *a1, const char *a2, ...)
{
  return [a1 blackListedPaths];
}

id objc_msgSend_blocklistedItems(void *a1, const char *a2, ...)
{
  return [a1 blocklistedItems];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_checkPlatformTypeForAllComponents(void *a1, const char *a2, ...)
{
  return [a1 checkPlatformTypeForAllComponents];
}

id objc_msgSend_checkType(void *a1, const char *a2, ...)
{
  return [a1 checkType];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_composedMessage(void *a1, const char *a2, ...)
{
  return [a1 composedMessage];
}

id objc_msgSend_convertToNSData(void *a1, const char *a2, ...)
{
  return [a1 convertToNSData];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createXPCDictionary(void *a1, const char *a2, ...)
{
  return [a1 createXPCDictionary];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteDemoVolume(void *a1, const char *a2, ...)
{
  return [a1 deleteDemoVolume];
}

id objc_msgSend_demoVolumeDev(void *a1, const char *a2, ...)
{
  return [a1 demoVolumeDev];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destroyWorkContainerInUserHome(void *a1, const char *a2, ...)
{
  return [a1 destroyWorkContainerInUserHome];
}

id objc_msgSend_deviceGID(void *a1, const char *a2, ...)
{
  return [a1 deviceGID];
}

id objc_msgSend_deviceGroupName(void *a1, const char *a2, ...)
{
  return [a1 deviceGroupName];
}

id objc_msgSend_deviceUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUID];
}

id objc_msgSend_deviceUserName(void *a1, const char *a2, ...)
{
  return [a1 deviceUserName];
}

id objc_msgSend_dict(void *a1, const char *a2, ...)
{
  return [a1 dict];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableLaunchdServicesForWatch(void *a1, const char *a2, ...)
{
  return [a1 disableLaunchdServicesForWatch];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_domainsPlistFilePath(void *a1, const char *a2, ...)
{
  return [a1 domainsPlistFilePath];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileGroupOwnerAccountID(void *a1, const char *a2, ...)
{
  return [a1 fileGroupOwnerAccountID];
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReading];
}

id objc_msgSend_fileHash(void *a1, const char *a2, ...)
{
  return [a1 fileHash];
}

id objc_msgSend_fileOwnerAccountID(void *a1, const char *a2, ...)
{
  return [a1 fileOwnerAccountID];
}

id objc_msgSend_filePosixPermissions(void *a1, const char *a2, ...)
{
  return [a1 filePosixPermissions];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_generateItemDomainsToBeSheltered(void *a1, const char *a2, ...)
{
  return [a1 generateItemDomainsToBeSheltered];
}

id objc_msgSend_getAPFSBootContainerDeviceNode(void *a1, const char *a2, ...)
{
  return [a1 getAPFSBootContainerDeviceNode];
}

id objc_msgSend_getAccessControlList(void *a1, const char *a2, ...)
{
  return [a1 getAccessControlList];
}

id objc_msgSend_getAllowedSymLinks(void *a1, const char *a2, ...)
{
  return [a1 getAllowedSymLinks];
}

id objc_msgSend_getAppList(void *a1, const char *a2, ...)
{
  return [a1 getAppList];
}

id objc_msgSend_getBackup(void *a1, const char *a2, ...)
{
  return [a1 getBackup];
}

id objc_msgSend_getBackupList(void *a1, const char *a2, ...)
{
  return [a1 getBackupList];
}

id objc_msgSend_getBackupSectionName(void *a1, const char *a2, ...)
{
  return [a1 getBackupSectionName];
}

id objc_msgSend_getDataSectionKeys(void *a1, const char *a2, ...)
{
  return [a1 getDataSectionKeys];
}

id objc_msgSend_getExtendedAttributes(void *a1, const char *a2, ...)
{
  return [a1 getExtendedAttributes];
}

id objc_msgSend_getFileAttributes(void *a1, const char *a2, ...)
{
  return [a1 getFileAttributes];
}

id objc_msgSend_getFileType(void *a1, const char *a2, ...)
{
  return [a1 getFileType];
}

id objc_msgSend_getHash(void *a1, const char *a2, ...)
{
  return [a1 getHash];
}

id objc_msgSend_getInstallationOrder(void *a1, const char *a2, ...)
{
  return [a1 getInstallationOrder];
}

id objc_msgSend_getSecurityCheckSectionNames(void *a1, const char *a2, ...)
{
  return [a1 getSecurityCheckSectionNames];
}

id objc_msgSend_getSettingsComponentNames(void *a1, const char *a2, ...)
{
  return [a1 getSettingsComponentNames];
}

id objc_msgSend_getStandAlonePackageList(void *a1, const char *a2, ...)
{
  return [a1 getStandAlonePackageList];
}

id objc_msgSend_getSystemAppDataList(void *a1, const char *a2, ...)
{
  return [a1 getSystemAppDataList];
}

id objc_msgSend_getSystemContainerKeyword(void *a1, const char *a2, ...)
{
  return [a1 getSystemContainerKeyword];
}

id objc_msgSend_getTargetFile(void *a1, const char *a2, ...)
{
  return [a1 getTargetFile];
}

id objc_msgSend_getVersion(void *a1, const char *a2, ...)
{
  return [a1 getVersion];
}

id objc_msgSend_getappIconLayoutBackupName(void *a1, const char *a2, ...)
{
  return [a1 getappIconLayoutBackupName];
}

id objc_msgSend_iOS(void *a1, const char *a2, ...)
{
  return [a1 iOS];
}

id objc_msgSend_iOSHub(void *a1, const char *a2, ...)
{
  return [a1 iOSHub];
}

id objc_msgSend_installationOrder(void *a1, const char *a2, ...)
{
  return [a1 installationOrder];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isSystemContainerPath(void *a1, const char *a2, ...)
{
  return [a1 isSystemContainerPath];
}

id objc_msgSend_isSystemContainerShared(void *a1, const char *a2, ...)
{
  return [a1 isSystemContainerShared];
}

id objc_msgSend_itemBeingInstalled(void *a1, const char *a2, ...)
{
  return [a1 itemBeingInstalled];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return [a1 launch];
}

id objc_msgSend_launchPath(void *a1, const char *a2, ...)
{
  return [a1 launchPath];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return [a1 localStore];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logFP(void *a1, const char *a2, ...)
{
  return [a1 logFP];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lookupSystemContainerPathUUID(void *a1, const char *a2, ...)
{
  return [a1 lookupSystemContainerPathUUID];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_macOS(void *a1, const char *a2, ...)
{
  return [a1 macOS];
}

id objc_msgSend_manifestUID(void *a1, const char *a2, ...)
{
  return [a1 manifestUID];
}

id objc_msgSend_manifestVerifier(void *a1, const char *a2, ...)
{
  return [a1 manifestVerifier];
}

id objc_msgSend_manifestVersion(void *a1, const char *a2, ...)
{
  return [a1 manifestVersion];
}

id objc_msgSend_messageHandlerQueue(void *a1, const char *a2, ...)
{
  return [a1 messageHandlerQueue];
}

id objc_msgSend_methods(void *a1, const char *a2, ...)
{
  return [a1 methods];
}

id objc_msgSend_migratePreferencesFile(void *a1, const char *a2, ...)
{
  return [a1 migratePreferencesFile];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_moveBluetoothFilesToDataShelter(void *a1, const char *a2, ...)
{
  return [a1 moveBluetoothFilesToDataShelter];
}

id objc_msgSend_moveSecondPartyAppFilesToDataShelter(void *a1, const char *a2, ...)
{
  return [a1 moveSecondPartyAppFilesToDataShelter];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nonContainerizedContentRoots(void *a1, const char *a2, ...)
{
  return [a1 nonContainerizedContentRoots];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_parseInstallationOrder(void *a1, const char *a2, ...)
{
  return [a1 parseInstallationOrder];
}

id objc_msgSend_parseLocaleCode(void *a1, const char *a2, ...)
{
  return [a1 parseLocaleCode];
}

id objc_msgSend_parseNonContainerizedContentRootSet(void *a1, const char *a2, ...)
{
  return [a1 parseNonContainerizedContentRootSet];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pathSet(void *a1, const char *a2, ...)
{
  return [a1 pathSet];
}

id objc_msgSend_pathsToSkip(void *a1, const char *a2, ...)
{
  return [a1 pathsToSkip];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return [a1 pipe];
}

id objc_msgSend_platformType(void *a1, const char *a2, ...)
{
  return [a1 platformType];
}

id objc_msgSend_pressDemoTestTarget(void *a1, const char *a2, ...)
{
  return [a1 pressDemoTestTarget];
}

id objc_msgSend_pressDemoXCTestProductsPath(void *a1, const char *a2, ...)
{
  return [a1 pressDemoXCTestProductsPath];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_quitHelper(void *a1, const char *a2, ...)
{
  return [a1 quitHelper];
}

id objc_msgSend_rOS(void *a1, const char *a2, ...)
{
  return [a1 rOS];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return [a1 rangeValue];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 readDataToEndOfFile];
}

id objc_msgSend_reboot(void *a1, const char *a2, ...)
{
  return [a1 reboot];
}

id objc_msgSend_registerEntitlementNotificationHandler(void *a1, const char *a2, ...)
{
  return [a1 registerEntitlementNotificationHandler];
}

id objc_msgSend_rescueDataToShelterFromSnapshottedVolumes(void *a1, const char *a2, ...)
{
  return [a1 rescueDataToShelterFromSnapshottedVolumes];
}

id objc_msgSend_restartBluetooth(void *a1, const char *a2, ...)
{
  return [a1 restartBluetooth];
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return [a1 rootPath];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_segmentedManifestWithRigorousFlag(void *a1, const char *a2, ...)
{
  return [a1 segmentedManifestWithRigorousFlag];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settingsComponentNames(void *a1, const char *a2, ...)
{
  return [a1 settingsComponentNames];
}

id objc_msgSend_setupDemoVolume(void *a1, const char *a2, ...)
{
  return [a1 setupDemoVolume];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldRunManifestRigorousTest(void *a1, const char *a2, ...)
{
  return [a1 shouldRunManifestRigorousTest];
}

id objc_msgSend_signedManifest(void *a1, const char *a2, ...)
{
  return [a1 signedManifest];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return [a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_switchToBackupFolder(void *a1, const char *a2, ...)
{
  return [a1 switchToBackupFolder];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return [a1 terminationStatus];
}

id objc_msgSend_testScripts(void *a1, const char *a2, ...)
{
  return [a1 testScripts];
}

id objc_msgSend_testScriptsLastModified(void *a1, const char *a2, ...)
{
  return [a1 testScriptsLastModified];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_tvOS(void *a1, const char *a2, ...)
{
  return [a1 tvOS];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateSignedManifest(void *a1, const char *a2, ...)
{
  return [a1 updateSignedManifest];
}

id objc_msgSend_userHomePath(void *a1, const char *a2, ...)
{
  return [a1 userHomePath];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validateInstallationOrder(void *a1, const char *a2, ...)
{
  return [a1 validateInstallationOrder];
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return [a1 waitUntilExit];
}

id objc_msgSend_watchOS(void *a1, const char *a2, ...)
{
  return [a1 watchOS];
}

id objc_msgSend_whitelistChecker(void *a1, const char *a2, ...)
{
  return [a1 whitelistChecker];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_xpcArrayFromArray(void *a1, const char *a2, ...)
{
  return [a1 xpcArrayFromArray];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}