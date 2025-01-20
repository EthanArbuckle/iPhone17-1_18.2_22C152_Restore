void sub_100004AAC(uint64_t a1@<X8>)
{
  mach_port_t v2;
  mach_port_t v3;
  __uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  mach_port_t port;

  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v2 = mach_host_self();
  port = 0;
  v3 = mach_host_self();
  if (host_get_special_port(v3, -1, 2, &port))
  {
    if (mach_memory_info(v2, (mach_zone_name_array_t *)a1, (mach_msg_type_number_t *)(a1 + 8), (mach_zone_info_array_t *)(a1 + 16), (mach_msg_type_number_t *)(a1 + 24), (mach_memory_info_array_t *)(a1 + 32), (mach_msg_type_number_t *)(a1 + 40)))
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001B37C();
      }
    }
    else
    {
      v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
      if (v4 >= 0x3B9ACA00)
      {
        v5 = v4 / 0x3B9ACA00;
        v6 = -2;
        v7 = v4 / 0x3B9ACA00;
        do
        {
          ++v6;
          v8 = v7 > 9;
          v7 /= 0xAuLL;
        }
        while (v8);
        if ((unint64_t)(v6 + 1) >= 2)
        {
          v9 = v6;
          do
          {
            v5 /= 0xAuLL;
            --v9;
          }
          while (v9);
          do
          {
            v5 *= 10;
            --v6;
          }
          while (v6);
        }
      }
      else
      {
        v5 = 0;
      }
      *(void *)(a1 + 48) = v5;
      *(unsigned char *)(a1 + 56) = 1;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
  {
    sub_10001B348();
  }
}

uint64_t sub_100004C20(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 56))
  {
    vm_deallocate(mach_task_self_, *(void *)result, 8 * *(unsigned int *)(result + 8));
    vm_deallocate(mach_task_self_, *(void *)(v1 + 16), 8 * *(unsigned int *)(v1 + 24));
    result = vm_deallocate(mach_task_self_, *(void *)(v1 + 32), 8 * *(unsigned int *)(v1 + 40));
  }
  *(unsigned char *)(v1 + 56) = 0;
  return result;
}

xpc_object_t sub_100004C90(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 8) == *(_DWORD *)(a1 + 24))
  {
    xpc_object_t result = xpc_array_create_empty();
    if (*(_DWORD *)(a1 + 8))
    {
      xpc_object_t xarray = result;
      uint64_t v3 = 0;
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
        xpc_object_t v7 = xpc_int64_create((*(void *)(*(void *)(a1 + 16) + v3 + 24) * *(void *)(*(void *)(a1 + 16) + v3)) >> 10);
        xpc_object_t v8 = xpc_int64_create(*(void *)(*(void *)(a1 + 16) + v3));
        xpc_object_t v9 = xpc_string_create((const char *)(*(void *)a1 + v4));
        xpc_object_t v10 = xpc_int64_create(*(void *)(a1 + 48));
        xpc_object_t v11 = xpc_int64_create(*(void *)(*(void *)(a1 + 16) + v3 + 24));
        xpc_dictionary_set_value(v6, "estimated_size_kb", v7);
        xpc_dictionary_set_value(v6, "count", v8);
        xpc_dictionary_set_value(v6, "zone_elem_size_bytes", v11);
        xpc_dictionary_set_value(v6, "zone_name", v9);
        xpc_dictionary_set_value(v6, "clock_uptime_sec", v10);
        xpc_array_append_value(xarray, v6);
        if (v7) {
          xpc_release(v7);
        }
        if (v8) {
          xpc_release(v8);
        }
        if (v9) {
          xpc_release(v9);
        }
        if (v6) {
          xpc_release(v6);
        }
        if (v10) {
          xpc_release(v10);
        }
        if (v11) {
          xpc_release(v11);
        }
        ++v5;
        v4 += 80;
        v3 += 64;
      }
      while (v5 < *(unsigned int *)(a1 + 8));
      return xarray;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001B3B0();
    }
    return 0;
  }
  return result;
}

xpc_object_t sub_100004E7C(uint64_t a1)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001B3E4();
    }
    return 0;
  }
  CFDictionaryRef v3 = Mutable;
  CFDictionaryRef v4 = (const __CFDictionary *)OSKextCopyLoadedKextInfo();
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001B418();
    }
    return 0;
  }
  CFDictionaryRef v5 = v4;
  CFDictionaryRef theDict = v3;
  CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)sub_10000534C, v3);
  CFRelease(v5);
  CSSymbolicatorCreateWithMachKernel();
  if (CSIsNull())
  {
    xpc_object_t v6 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Symbolicator is null, not including VM_KERN_SITE_KERNEL regions", buf, 2u);
    }
  }
  xpc_object_t xarray = xpc_array_create_empty();
  if (*(_DWORD *)(a1 + 40))
  {
    uint64_t v7 = 0;
    for (unint64_t i = 0; i < *(unsigned int *)(a1 + 40); ++i)
    {
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_object_t v10 = xpc_int64_create(*(void *)(*(void *)(a1 + 32) + v7 + 16) >> 10);
      xpc_object_t v11 = xpc_int64_create(*(void *)(*(void *)(a1 + 32) + v7 + 56) >> 10);
      xpc_object_t v12 = xpc_int64_create(*(unsigned __int16 *)(*(void *)(a1 + 32) + v7 + 64));
      xpc_object_t v13 = xpc_int64_create(*(void *)(a1 + 48));
      xpc_dictionary_set_value(v9, "size_kb", v10);
      xpc_dictionary_set_value(v9, "peak_kb", v11);
      xpc_dictionary_set_value(v9, "vm_tag_id", v12);
      xpc_dictionary_set_value(v9, "clock_uptime_sec", v13);
      uint64_t v14 = *(void *)(a1 + 32);
      if ((*(void *)(v14 + v7) & 0x400) == 0)
      {
        switch(*(void *)(v14 + v7))
        {
          case 0u:
            xpc_object_t v15 = sub_10000539C(*(void *)(v14 + v7 + 8));
            goto LABEL_13;
          case 1u:
            CFNumberRef v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, (const void *)(v14 + v7 + 8));
            CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, v18);
            if (!Value) {
              goto LABEL_22;
            }
            CFStringRef v20 = (const __CFString *)CFDictionaryGetValue(Value, kCFBundleIdentifierKey);
            if (!v20)
            {
              if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
                sub_10001B478(&v29, v30);
              }
              goto LABEL_24;
            }
            CStringPtr = CFStringGetCStringPtr(v20, 0x8000100u);
            xpc_object_t v17 = xpc_string_create(CStringPtr);
            if (v17) {
              goto LABEL_14;
            }
            goto LABEL_22;
          case 2u:
            if (CSIsNull()) {
              goto LABEL_21;
            }
            CSSymbolicatorGetSymbolWithAddressAtTime();
            if (!CSIsNull())
            {
              Name = (const char *)CSSymbolGetName();
              goto LABEL_12;
            }
            if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
              sub_10001B4A4(&v27, v28);
            }
            xpc_object_t v17 = 0;
            if (!v10) {
              goto LABEL_28;
            }
            goto LABEL_27;
          case 3u:
            xpc_object_t v15 = sub_1000054E8(*(void *)(v14 + v7 + 8));
            goto LABEL_13;
          default:
LABEL_21:
            CFNumberRef v18 = 0;
            goto LABEL_22;
        }
      }
      Name = (const char *)(v14 + v7 + 96);
LABEL_12:
      xpc_object_t v15 = xpc_string_create(Name);
LABEL_13:
      xpc_object_t v17 = v15;
      CFNumberRef v18 = 0;
      if (v15)
      {
LABEL_14:
        xpc_dictionary_set_value(v9, "name", v17);
        xpc_array_append_value(xarray, v9);
        if (!v18) {
          goto LABEL_26;
        }
      }
      else
      {
LABEL_22:
        if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
          sub_10001B44C(&v25, v26);
        }
LABEL_24:
        xpc_object_t v17 = 0;
        if (!v18) {
          goto LABEL_26;
        }
      }
      CFRelease(v18);
LABEL_26:
      if (v10) {
LABEL_27:
      }
        xpc_release(v10);
LABEL_28:
      if (v11) {
        xpc_release(v11);
      }
      if (v12) {
        xpc_release(v12);
      }
      if (v13) {
        xpc_release(v13);
      }
      if (v17) {
        xpc_release(v17);
      }
      if (v9) {
        xpc_release(v9);
      }
      v7 += 176;
    }
  }
  CFRelease(theDict);
  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }
  return xarray;
}

void sub_10000534C(int a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  CFDictionaryRef Value = CFDictionaryGetValue(theDict, @"OSBundleLoadTag");

  CFDictionarySetValue(a3, Value, theDict);
}

xpc_object_t sub_10000539C(unint64_t a1)
{
  if (a1 <= 0x24) {
    return xpc_string_create_with_format("VM_KERN_MEMORY_%s");
  }
  if (a1 == 256)
  {
    CFDictionaryRef v3 = "VM_KERN_MEMORY_COUNT";
    goto LABEL_7;
  }
  if (a1 == 255)
  {
    CFDictionaryRef v3 = "VM_KERN_MEMORY_ANY";
LABEL_7:
    return xpc_string_create(v3);
  }
  CFDictionaryRef v4 = qword_100028F80;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v6 = a1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "unrecognized vm kern memory tag %lld", buf, 0xCu);
  }
  return xpc_string_create_with_format("VM_KERN_MEMORY_%lld");
}

xpc_object_t sub_1000054E8(unint64_t a1)
{
  if (a1 <= 0xD) {
    return xpc_string_create_with_format("VM_KERN_COUNT_%s");
  }
  CFDictionaryRef v3 = qword_100028F80;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v5 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "unrecognized vm kern count tag %lld", buf, 0xCu);
  }
  return xpc_string_create_with_format("VM_KERN_COUNT_%lld");
}

void sub_1000055C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

unsigned char *sub_1000055E8(unsigned char *result, unsigned char *a2)
{
  *xpc_object_t result = 0;
  *a2 = 0;
  return result;
}

void sub_1000055F8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void *sub_100005614()
{
  v0 = 0;
  unint64_t v1 = 0;
  int v2 = 5;
  while (1)
  {
    unsigned int v3 = memorystatus_control();
    if ((v3 & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
      {
        sub_10001B4D0();
        if (!v0) {
          return v0;
        }
        goto LABEL_27;
      }
LABEL_26:
      if (!v0) {
        return v0;
      }
      goto LABEL_27;
    }
    unsigned int v4 = v3;
    if (!v3)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
      {
        sub_10001B550();
        if (!v0) {
          return v0;
        }
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    if (v3 <= 0xC7)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
      {
        sub_10001B584();
        if (!v0) {
          return v0;
        }
        goto LABEL_27;
      }
      goto LABEL_26;
    }
    unint64_t v5 = v3;
    unint64_t v6 = v3 - 200;
    unint64_t v7 = v6 / 0x118;
    if (v6 % 0x118) {
      break;
    }
    if (v1 >= v3)
    {
      uint64_t v8 = v0[24];
      if (v7 == v8) {
        return v0;
      }
      uint64_t v9 = qword_100028F80;
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109632;
        unsigned int v12 = v4;
        __int16 v13 = 2048;
        unint64_t v14 = v7;
        __int16 v15 = 2048;
        uint64_t v16 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "memorystatus_control request for on demand snapshot returned snapshot size %d, which is %zd entries, and does not match entry_count of %zu", buf, 0x1Cu);
      }
      unint64_t v5 = v1;
    }
    else
    {
      if (v0) {
        free(v0);
      }
      v0 = malloc_type_malloc(v4, 0x9DB112B1uLL);
    }
    unint64_t v1 = v5;
    if (!--v2) {
      goto LABEL_26;
    }
  }
  if (!os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
    goto LABEL_26;
  }
  sub_10001B5EC();
  if (v0)
  {
LABEL_27:
    free(v0);
    return 0;
  }
  return v0;
}

vm_size_t sub_100005850()
{
  if (qword_100028F18 != -1) {
    dispatch_once(&qword_100028F18, &stru_100024AD8);
  }
  if (dword_1000281F8 < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001B688();
    }
    vm_size_t v1 = 0;
    v0 = 0;
  }
  else
  {
    v0 = malloc_type_malloc(48 * qword_100028F10, 0x2B762B35uLL);
    if ((ledger() & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001B654();
      }
      vm_size_t v1 = 0;
    }
    else
    {
      vm_size_t v1 = v0[6 * dword_1000281F8] / vm_page_size;
    }
  }
  free(v0);
  return v1;
}

void sub_100005978(id a1)
{
  getpid();
  if ((ledger() & 0x80000000) != 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001B6BC();
    }
    vm_size_t v1 = 0;
  }
  else
  {
    qword_100028F10 = v5;
    vm_size_t v1 = (char *)malloc_type_malloc(96 * v5, 0x411E0BF2uLL);
    if ((ledger() & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001B6BC();
      }
    }
    else
    {
      uint64_t v2 = qword_100028F10;
      if (qword_100028F10 >= 1)
      {
        uint64_t v3 = 0;
        unsigned int v4 = v1;
        while (strncmp("neural_nofootprint_total", v4, 0x18uLL))
        {
          ++v3;
          v4 += 96;
          if (v2 == v3) {
            goto LABEL_14;
          }
        }
        dword_1000281F8 = v3;
      }
    }
  }
LABEL_14:
  free(v1);
}

uint64_t sub_100005AE4(uint64_t a1)
{
  size_t v41 = 4;
  size_t v42 = 4;
  if (!a1) {
    return -1;
  }
  uint64_t v1 = a1;
  uint64_t v43 = 0;
  if (sysctlbyname("kern.memorystatus_level", (char *)&v43 + 4, &v42, 0, 0)
    || sysctlbyname("kern.memorystatus_available_pages", &v43, &v41, 0, 0))
  {
    return -1;
  }
  unsigned int v4 = v43;
  unint64_t v5 = *(void *)(v1 + 192);
  unint64_t v6 = v43 / HIDWORD(v43);
  if (v5)
  {
    unint64_t v29 = v43 / HIDWORD(v43);
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v31 = 0;
    uint64_t v9 = 0;
    unint64_t v5 = 0;
    uint64_t v38 = 0;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v10 = v1 + 204;
    xpc_object_t v11 = (void *)(v1 + 368);
    uint64_t v32 = v1;
    do
    {
      unint64_t v39 = v5;
      uint64_t v36 = v8;
      uint64_t v12 = *(v11 - 6) - *(v11 - 2) + *(v11 - 4);
      int v13 = *((_DWORD *)v11 - 31);
      uint64_t v14 = *(v11 - 7) - *(v11 - 3) + *(v11 - 1) + *(v11 - 5) + *v11;
      int64_t v15 = sub_100005850();
      int64_t v16 = v15;
      int v17 = *((_DWORD *)v11 - 32);
      if (v17 >= 101)
      {
        if ((v13 & 2) != 0) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = v12;
        }
      }
      else
      {
        v33 += v14;
        if ((v13 & 2) != 0) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = v12;
        }
        v34 += v18;
        if (v15 >= 1)
        {
          log = qword_100028F80;
          if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEBUG))
          {
            int v20 = *((_DWORD *)v11 - 42);
            *(_DWORD *)buf = 136315906;
            *(void *)v45 = v10;
            *(_WORD *)&v45[8] = 1024;
            *(_DWORD *)v46 = v20;
            *(_WORD *)&v46[4] = 1024;
            *(_DWORD *)&v46[6] = v17;
            *(_WORD *)v47 = 2048;
            *(void *)&v47[2] = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s pid(%d) jetsam priority(%d) | neural_nofootprint_pages = %llu", buf, 0x22u);
          }
          v31 += v16;
        }
      }
      v11 += 35;
      v9 += v16;
      v38 += v14;
      unint64_t v5 = v18 + v39;
      if ((v13 & 2) != 0) {
        uint64_t v19 = v12;
      }
      else {
        uint64_t v19 = 0;
      }
      uint64_t v8 = v19 + v36;
      ++v7;
      uint64_t v1 = v32;
      v10 += 280;
    }
    while (*(void *)(v32 + 192) > v7);
    unsigned int v4 = v43;
    unint64_t v6 = v29;
    uint64_t v22 = v33;
    uint64_t v21 = v34;
    uint64_t v23 = v31;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v21 = 0;
    uint64_t v38 = 0;
    uint64_t v9 = 0;
    uint64_t v23 = 0;
    uint64_t v8 = 0;
  }
  unint64_t v40 = v5;
  uint64_t v35 = v21;
  unint64_t v37 = v21 * (unint64_t)*(unsigned int *)(v1 + 60) / v5;
  unint64_t v24 = v23 + v22 + v37 + v4;
  unint64_t v2 = v24 / v6;
  char v25 = qword_100028F80;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(void *)v45 = v2 - (v24 - v23) / v6;
    *(_WORD *)&v45[8] = 2048;
    *(void *)v46 = v23;
    *(_WORD *)&v46[8] = 2048;
    *(void *)v47 = v9;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "neural reclaimable impact: %llu | neural reclaimable pages = %llu neural total pages = %llu", buf, 0x20u);
    char v25 = qword_100028F80;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = *(_DWORD *)(v1 + 56);
    int v27 = *(_DWORD *)(v1 + 60);
    uint64_t v28 = *(void *)(v1 + 80);
    *(_DWORD *)buf = 67112448;
    *(_DWORD *)v45 = v26;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v27;
    *(_WORD *)v46 = 2048;
    *(void *)&v46[2] = v28;
    *(_WORD *)v47 = 1024;
    *(_DWORD *)&v47[2] = HIDWORD(v43);
    *(_WORD *)&v47[6] = 1024;
    *(_DWORD *)&v47[8] = v43;
    __int16 v48 = 1024;
    int v49 = v6;
    __int16 v50 = 2048;
    uint64_t v51 = v22;
    __int16 v52 = 2048;
    uint64_t v53 = v35;
    __int16 v54 = 2048;
    uint64_t v55 = v38 - v22;
    __int16 v56 = 2048;
    uint64_t v57 = v40 - v35;
    __int16 v58 = 2048;
    uint64_t v59 = v8;
    __int16 v60 = 2048;
    unint64_t v61 = v37;
    __int16 v62 = 2048;
    unint64_t v63 = v24;
    __int16 v64 = 2048;
    unint64_t v65 = v24 / v6;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "pressure: vmstat anonymous %u compressor %u in_compressor %llu, jetsam level %u available %u p_p_l %u,\n<= FG uncompressed %llu compressed %llu, > FG uncompressed %llu compressed %llu, frozen %llu,\nest reclaimable %llu total_user %llu levels %lld", buf, 0x7Au);
  }
  return v2;
}

void sub_100005EE4(uint64_t a1)
{
  if (a1)
  {
    bzero(v15, 0x698uLL);
    uint64_t v2 = *(void *)(a1 + 192);
    if (v2)
    {
      uint64_t v3 = (void *)(a1 + 288);
      do
      {
        uint64_t v4 = *((unsigned int *)v3 - 12);
        if ((v4 - 100) <= 0x6E) {
          v15[v4] += *v3;
        }
        v3 += 35;
        --v2;
      }
      while (v2);
    }
    for (uint64_t i = 100; i != 211; ++i)
    {
      uint64_t v6 = v15[i];
      if (v6)
      {
        util::stringprintf((util *)"memory_usage.band%d", __p, i);
        unint64_t v7 = qword_100028F80;
        if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = __p;
          if (v10 < 0) {
            uint64_t v8 = (void **)__p[0];
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v12 = v8;
          __int16 v13 = 2048;
          vm_size_t v14 = vm_kernel_page_size * v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %lld", buf, 0x16u);
        }
        if (v10 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }
}

uint64_t sub_100006078()
{
  io_registry_entry_t v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v0)
  {
    uint64_t result = (uint64_t)IORegistryEntryCreateCFProperty(v0, @"stress-rack", 0, 0);
    if (!result) {
      return result;
    }
    CFRelease((CFTypeRef)result);
  }
  else
  {
    uint64_t v2 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NVRAM is not supported on this system", v3, 2u);
    }
  }
  return 1;
}

uint64_t sub_100006120()
{
  if (sub_100006078())
  {
    io_registry_entry_t v0 = qword_100028F80;
    BOOL v1 = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (v1)
    {
      LOWORD(buf.st_dev) = 0;
      uint64_t v3 = "Device is a stress rack device. Bailing out.";
      p_stat buf = (uint8_t *)&buf;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, v3, p_buf, 2u);
      return 0;
    }
    return result;
  }
  uint64_t result = stat("/tmp/mmaintenanced", &buf);
  if (!result) {
    return result;
  }
  if (*__error() != 2)
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10001B7E4();
      return 0;
    }
    return result;
  }
  if (stat("/private/var/mobile/Library/MemoryMaintenance/mmaintenanced", &buf))
  {
    if (*__error() != 2)
    {
      uint64_t result = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_10001B758();
        return 0;
      }
      return result;
    }
    return 1;
  }
  __darwin_time_t tv_sec = buf.st_mtimespec.tv_sec;
  if (gettimeofday(&v8, 0))
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10001B724();
      return 0;
    }
    return result;
  }
  if (v8.tv_sec < tv_sec)
  {
    uint64_t result = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_10001B6F0();
      return 0;
    }
    return result;
  }
  if (v8.tv_sec - tv_sec > 71999) {
    return 1;
  }
  io_registry_entry_t v0 = qword_100028F80;
  BOOL v6 = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v6)
  {
    __int16 v7 = 0;
    uint64_t v3 = "could not reboot because last reboot was < 20 hours";
    p_stat buf = (uint8_t *)&v7;
    goto LABEL_4;
  }
  return result;
}

BOOL sub_100006300()
{
  int v0 = open("/private/var/mobile/Library/MemoryMaintenance/sysstatuscheck_should_check", 513, 438);
  if (v0 == -1)
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_10001B870();
    return 0;
  }
  if (close(v0))
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    sub_10001B8A4();
    return 0;
  }
  return 1;
}

void sub_1000063A4()
{
  if (sub_100009A14())
  {
    *(_OWORD *)__int16 v7 = 0u;
    *(_OWORD *)timeval v8 = 0u;
    *(_OWORD *)value = 0u;
    int v0 = sub_100009AC4(value);
    if (sub_100009A9C((uint64_t)v0, v1))
    {
      int64_t v3 = value[1];
      int64_t v2 = v7[0];
      uint64_t v4 = qword_100028F80;
      if (__PAIR128__(v7[0], value[1]) == 0)
      {
        if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
          sub_10001B8D8();
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)stat buf = 134219264;
          int64_t v10 = value[0];
          __int16 v11 = 2048;
          int64_t v12 = v3;
          __int16 v13 = 2048;
          int64_t v14 = v2;
          __int16 v15 = 2048;
          int64_t v16 = v7[1];
          __int16 v17 = 2048;
          int64_t v18 = v8[0];
          __int16 v19 = 2048;
          int64_t v20 = v8[1];
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reporting system hwm state from previous reboot action: {did_user_space_reboot=%llu user_hwm_level=%llu user_hwm_limit=%llu did_kernel_reboot=%llu kernel_hwm_level=%llu kernel_hwm_limit=%llu}", buf, 0x3Eu);
        }
        xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v5, "did_user_space_reboot", value[0] != 0);
        xpc_dictionary_set_int64(v5, "user_hwm_level", value[1]);
        xpc_dictionary_set_int64(v5, "user_hwm_limit", v7[0]);
        if (v8[0] && v8[1])
        {
          xpc_dictionary_set_BOOL(v5, "did_kernel_reboot", v7[1] != 0);
          xpc_dictionary_set_int64(v5, "kernel_hwm_level", v8[0]);
          xpc_dictionary_set_int64(v5, "kernel_hwm_limit", v8[1]);
        }
        analytics_send_event();
        xpc_release(v5);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
    {
      sub_10001B90C();
    }
  }
}

uint64_t sub_1000065B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!sub_100006120()) {
    goto LABEL_12;
  }
  if (utimes("/private/var/mobile/Library/MemoryMaintenance/mmaintenanced", 0) && *__error() != 2)
  {
    timeval v8 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001BA5C(v8);
    }
    goto LABEL_12;
  }
  int v7 = open("/private/var/mobile/Library/MemoryMaintenance/mmaintenanced", 513, 438);
  if (v7 == -1)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001B98C();
    }
    goto LABEL_12;
  }
  if (close(v7))
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001B8A4();
    }
    goto LABEL_12;
  }
  int v11 = open("/tmp/mmaintenanced", 513, 438);
  if (v11 == -1)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001B9C0();
    }
    goto LABEL_12;
  }
  if (close(v11))
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001BA28();
    }
    goto LABEL_12;
  }
  if (!sub_1000069DC(1))
  {
LABEL_32:
    remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/MemoryMaintenance/mmaintenanced", v12);
LABEL_12:
    sub_100009C3C(0, a3, a4);
    return 0;
  }
  if (!sub_100006300())
  {
LABEL_31:
    sub_1000069DC(0);
    goto LABEL_32;
  }
  __p = 0;
  __int16 v15 = 0;
  uint64_t v16 = 0;
  sub_100008A20(&__p, 0xAuLL);
  if (a2) {
    operator new[]();
  }
  if ((WriteSystemMemoryResetReportWithPids() & 1) == 0
    && os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
  {
    sub_10001B9F4();
  }
  if (__p)
  {
    __int16 v15 = __p;
    operator delete(__p);
  }
  uint64_t v9 = 1;
  sub_100009C3C(1u, a3, a4);
  sync();
  if (reboot3())
  {
    remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/MemoryMaintenance/sysstatuscheck_should_check", v13);
    goto LABEL_31;
  }
  return v9;
}

void sub_1000069B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_1000069DC(int a1)
{
  int v3 = a1;
  int v1 = sysctlbyname("kern.darkboot", 0, 0, &v3, 4uLL);
  if (v1 && os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
    sub_10001BAEC();
  }
  return v1 == 0;
}

uint64_t sub_100006A5C(uint64_t a1)
{
  if (qword_100028F60 < 1)
  {
    int v7 = qword_100028F80;
    uint64_t v6 = 0;
    if (!os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT)) {
      return v6;
    }
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No user reclaimable limit defined", buf, 2u);
    return 0;
  }
  unint64_t v2 = sub_100005AE4(a1);
  unint64_t v3 = qword_100028F60;
  uint64_t v4 = qword_100028F80;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT);
  if (v2 >= v3)
  {
    if (v5)
    {
      *(_DWORD *)stat buf = 134218240;
      unint64_t v12 = v2;
      __int16 v13 = 2048;
      unint64_t v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User reclaimable limit not crossed; user reclaimable current: %llu%%. User reclaimable minimum: %llu%%",
        buf,
        0x16u);
      unint64_t v3 = qword_100028F60;
    }
    sub_100009C3C(0, v2, v3);
    return 0;
  }
  if (v5)
  {
    *(_DWORD *)stat buf = 134218240;
    unint64_t v12 = v2;
    __int16 v13 = 2048;
    unint64_t v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "User reclaimable memory dropped below the limit, userspace rebooting the device. User reclaimable current: %llu%%. User reclaimable minimum: %llu%%", buf, 0x16u);
    unint64_t v3 = qword_100028F60;
  }
  util::stringprintf((util *)"User reclaimable memory dropped below the limit. User reclaimable current: %llu%%. User reclaimable minimum: %llu%%", __p, v2, v3);
  uint64_t v6 = sub_1000065B4((uint64_t)__p, a1, v2, qword_100028F60);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  return v6;
}

void sub_100006C34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100006C58(const char *a1)
{
  *(_OWORD *)unint64_t v12 = xmmword_10001E3B0;
  size_t size = 0;
  if (sysctl(v12, 4u, 0, &size, 0, 0) < 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001BB54();
    }
  }
  else if (size)
  {
    unint64_t v2 = (char *)malloc_type_malloc(size, 0x2A2AE461uLL);
    if (v2)
    {
      unint64_t v3 = v2;
      if (sysctl(v12, 4u, v2, &size, 0, 0) < 0)
      {
        if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
          sub_10001BC38();
        }
      }
      else if (size > 0x287)
      {
        size_t v7 = size / 0x288;
        timeval v8 = &v3[648 * (size / 0x288) - 1053];
        while (--v7)
        {
          uint64_t v9 = v8 - 648;
          char v10 = strcasestr(v8, a1);
          timeval v8 = v9;
          if (v10)
          {
            uint64_t v5 = *(unsigned int *)(v9 + 445);
            free(v3);
            return v5;
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
      {
        sub_10001BC6C();
      }
      free(v3);
    }
    else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
    {
      sub_10001BC04();
    }
  }
  else
  {
    uint64_t v4 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001BB88(v4);
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_100006E64()
{
  int v0 = sub_100006C58("SpringBoard");
  if (v0 == -1)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001BCA0();
    }
  }
  else
  {
    int v1 = v0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    if ((memorystatus_control() & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001BCD4();
      }
    }
    else if (sub_1000069DC(1))
    {
      int v10 = qword_100028F70;
      int v11 = 1;
      int v12 = qword_100028F70;
      int v13 = 1;
      int v2 = memorystatus_control();
      unint64_t v3 = qword_100028F80;
      if (v2 < 0 && os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
      {
        sub_10001BD70(v3, buf);
        unint64_t v3 = *(NSObject **)buf;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Set SpringBoard memory limit to its inactive limit", buf, 2u);
      }
      char v9 = 0;
      mach_port_t sp = 0;
      bootstrap_look_up(bootstrap_port, "com.apple.springboard.blockableservices", &sp);
      if (sp)
      {
        SBGetIsAlive();
        if (!v9)
        {
          uint64_t v4 = qword_100028F80;
          if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)stat buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SpringBoard is not alive", buf, 2u);
          }
        }
        mach_port_deallocate(mach_task_self_, sp);
      }
      else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
      {
        sub_10001BD3C();
      }
      int v5 = sub_100006C58("SpringBoard");
      uint64_t v6 = qword_100028F80;
      BOOL v7 = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT);
      if (v5 == v1)
      {
        if (v7)
        {
          *(_DWORD *)stat buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v1;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SpringBoard was not killed (pid=%d)", buf, 8u);
        }
        if ((memorystatus_control() & 0x80000000) != 0
          && os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
        {
          sub_10001BD08();
        }
        sub_1000069DC(0);
      }
      else if (v7)
      {
        *(_DWORD *)stat buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v1;
        __int16 v17 = 1024;
        int v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SpringBoard was killed (oldpid=%d newpid=%d)", buf, 0xEu);
      }
    }
  }
}

void sub_100007190(uint64_t a1)
{
  uint64_t v1 = sub_100005AE4(a1);
  int v2 = qword_100028F80;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    uint64_t v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Current UserReclaimable: %lld%%", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t sub_100007238()
{
  time_t v4 = 0;
  time(&v4);
  size_t v2 = 16;
  if (sysctlbyname("kern.boottime", &v3, &v2, 0, 0) == -1) {
    return -1;
  }
  time_t v0 = ((v4 - v3) / 3600) & 3;
  if ((v4 - v3) / -3600 >= 0) {
    time_t v0 = -(((v4 - v3) / -3600) & 3);
  }
  return (v4 - v3) / 3600 - v0;
}

void sub_1000072D0()
{
  kern_return_t v3;
  NSObject *v4;
  mach_port_t v5;
  kern_return_t v6;
  NSObject *v7;
  mach_msg_type_number_t host_info64_outCnt;
  uint8_t v9[4];
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;

  host_info64_outCnt = 38;
  uint64_t v0 = sub_100007238();
  uint64_t v1 = qword_100028F80;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 134217984;
    int v12 = v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Performing Compressor Sweep: %ld hr", buf, 0xCu);
  }
  mach_port_t v2 = mach_host_self();
  uint64_t v3 = host_statistics64(v2, 4, (host_info64_t)buf, &host_info64_outCnt);
  time_t v4 = qword_100028F80;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001BEC8();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v9 = 134217984;
      int v10 = v13;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "swapins (before sweep): %lld", v9, 0xCu);
      time_t v4 = qword_100028F80;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v9 = 134217984;
      int v10 = v14;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "swapouts (before sweep): %lld", v9, 0xCu);
      time_t v4 = qword_100028F80;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v9 = 67109120;
      LODWORD(v10) = v15;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "compressor_page_count (before sweep): %u", v9, 8u);
      time_t v4 = qword_100028F80;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v9 = 134217984;
      int v10 = v16;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "total_uncompressed_pages_in_compressor (before sweep): %lld", v9, 0xCu);
    }
  }
  if (pid_hibernate())
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001BE48();
    }
  }
  else
  {
    int v5 = mach_host_self();
    uint64_t v6 = host_statistics64(v5, 4, (host_info64_t)buf, &host_info64_outCnt);
    BOOL v7 = qword_100028F80;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001BE14();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v9 = 134217984;
        int v10 = v13;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "swapins (after sweep): %lld", v9, 0xCu);
        BOOL v7 = qword_100028F80;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v9 = 134217984;
        int v10 = v14;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "swapouts (after sweep): %lld", v9, 0xCu);
        BOOL v7 = qword_100028F80;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v9 = 67109120;
        LODWORD(v10) = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "compressor_page_count (after sweep): %u", v9, 8u);
        BOOL v7 = qword_100028F80;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v9 = 134217984;
        int v10 = v16;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "total_uncompressed_pages_in_compressor (after sweep): %lld", v9, 0xCu);
      }
    }
  }
}

void sub_100007678(int a1)
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  sub_100004AAC((uint64_t)&v21);
  if (BYTE8(v24))
  {
    v20[0] = v21;
    v20[1] = v22;
    v20[2] = v23;
    v20[3] = v24;
    xpc_object_t v2 = sub_100004C90((uint64_t)v20);
    v19[0] = v21;
    v19[1] = v22;
    v19[2] = v23;
    v19[3] = v24;
    xpc_object_t v3 = sub_100004E7C((uint64_t)v19);
    if (v2)
    {
      if (xpc_array_get_count(v2))
      {
        size_t v4 = 0;
        do
        {
          xpc_object_t value = xpc_array_get_value(v2, v4);
          if (a1)
          {
            analytics_send_event();
          }
          else
          {
            uint64_t v6 = xpc_copy_description(value);
            BOOL v7 = qword_100028F80;
            if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)stat buf = 136315138;
              size_t v26 = (size_t)v6;
              _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
            }
            free(v6);
          }
          ++v4;
        }
        while (xpc_array_get_count(v2) > v4);
      }
      timeval v8 = qword_100028F80;
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
      {
        size_t count = xpc_array_get_count(v2);
        int v10 = "os_log";
        if (a1) {
          int v10 = "Core Analytics";
        }
        *(_DWORD *)stat buf = 134218242;
        size_t v26 = count;
        __int16 v27 = 2080;
        uint64_t v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Send %zu zones to %s", buf, 0x16u);
      }
      xpc_release(v2);
      if (!v3) {
        goto LABEL_35;
      }
LABEL_21:
      if (xpc_array_get_count(v3))
      {
        size_t v11 = 0;
        do
        {
          xpc_object_t v12 = xpc_array_get_value(v3, v11);
          if (a1)
          {
            analytics_send_event();
          }
          else
          {
            int v13 = xpc_copy_description(v12);
            uint64_t v14 = qword_100028F80;
            if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)stat buf = 136315138;
              size_t v26 = (size_t)v13;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
            }
            free(v13);
          }
          ++v11;
        }
        while (xpc_array_get_count(v3) > v11);
      }
      uint64_t v15 = qword_100028F80;
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
      {
        size_t v16 = xpc_array_get_count(v3);
        __int16 v17 = "os_log";
        if (a1) {
          __int16 v17 = "Core Analytics";
        }
        *(_DWORD *)stat buf = 134218242;
        size_t v26 = v16;
        __int16 v27 = 2080;
        uint64_t v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Send %zu vm regions to %s", buf, 0x16u);
      }
      xpc_release(v3);
      goto LABEL_37;
    }
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
    {
      sub_10001BF64();
      if (v3) {
        goto LABEL_21;
      }
    }
    else if (v3)
    {
      goto LABEL_21;
    }
LABEL_35:
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001BF30();
    }
LABEL_37:
    v18[0] = v21;
    v18[1] = v22;
    v18[2] = v23;
    v18[3] = v24;
    sub_100004C20((uint64_t)v18);
    return;
  }
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
    sub_10001BEFC();
  }
}

uint64_t sub_100007A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a3 + 20);
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 67109120;
      int v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to log error, message not from kernel: audit_pid %d", buf, 8u);
    }
    return 5;
  }
  else
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    v6[0] = *(_OWORD *)a2;
    v6[1] = v5;
    uint64_t v7 = *(void *)(a2 + 32);
    return sub_100016674((uint64_t)v6, 0);
  }
}

uint64_t sub_100007B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 20))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001BF98();
    }
    return 5;
  }
  else
  {
    long long v4 = *(_OWORD *)(a2 + 16);
    v5[0] = *(_OWORD *)a2;
    v5[1] = v4;
    uint64_t v6 = *(void *)(a2 + 32);
    return sub_100017818((int *)v5);
  }
}

void *sub_100007B84()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100028E88, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100028E88))
  {
    sub_10001596C((uint64_t)&unk_100028200);
    __cxa_atexit((void (*)(void *))sub_1000160B0, &unk_100028200, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_100028E88);
  }
  return &unk_100028200;
}

void sub_100007C08(_Unwind_Exception *a1)
{
}

uint64_t sub_100007C20()
{
  mach_port_t sp = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initialiazing EccDatabase...", buf, 2u);
  }
  sub_100015C78(qword_100028F58);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initializing Memory Error MIG server...", buf, 2u);
  }
  task_get_special_port(mach_task_self_, 4, &bootstrap_port);
  uint64_t v0 = bootstrap_check_in(bootstrap_port, "com.apple.mmaintenanced.server", &sp);
  uint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, sp, 0, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100007D8C;
  handler[3] = &unk_100024AF8;
  mach_port_t v4 = sp;
  dispatch_source_set_event_handler(v1, handler);
  dispatch_activate(v1);
  return v0;
}

void sub_100007D8C(uint64_t a1)
{
  if (mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100017C74, 0x1000u, *(_DWORD *)(a1 + 32), 50331648))
  {
    sub_10001C008();
  }
}

uint64_t sub_100007DCC()
{
  memset(v2, 0, sizeof(v2));
  size_t v1 = 48;
  uint64_t result = sysctlbyname("kern.osreleasetype", v2, &v1, 0, 0);
  if (!result && !(*(void *)&v2[0] ^ 0x6C616E7265746E49 | BYTE8(v2[0]))) {
    byte_100028F88 = 1;
  }
  return result;
}

void start()
{
}

void sub_100008124(id a1)
{
}

void sub_100008138()
{
  if (access("/var/mobile/Library/Logs/khwm.log", 6) != -1)
  {
    stat("/var/mobile/Library/Logs/khwm.log", &v4);
    uint64_t v3 = 0;
    uint64_t v0 = fopen("/var/mobile/Library/Logs/khwm.log", "r");
    if (v0)
    {
      size_t v1 = v0;
      fscanf(v0, "Wired Memory Pages: %llu", &v3);
      util::stringprintf((util *)"Kernel memory has exceeded its limits.\n", &v2);
      fseek(v1, 0, 2);
      ftell(v1);
      rewind(v1);
      operator new[]();
    }
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C06C();
    }
  }
}

void sub_100008428(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100008448(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    uint64_t v3 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launched system high water mark activity", buf, 2u);
    }
    sub_100008138();
    sub_1000063A4();
    sub_1000173F4();
    stat v4 = sub_100005614();
    if (v4)
    {
      long long v5 = v4;
      sub_100007190((uint64_t)v4);
      sub_100005EE4((uint64_t)v5);
      if (xpc_activity_should_defer(a2))
      {
        uint64_t v6 = qword_100028F80;
        if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "XPC told us to defer. Deferring", v9, 2u);
        }
        if (!xpc_activity_set_state(a2, 3) && os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
          sub_10001C220();
        }
      }
      else if ((sub_100006A5C((uint64_t)v5) & 1) == 0)
      {
        sub_100006E64();
        uint64_t v7 = qword_100028F80;
        if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)timeval v8 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "System high water mark activity did not do anything", v8, 2u);
        }
        free(v5);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
    {
      sub_10001C1EC();
    }
  }
}

void sub_1000085E0(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    sub_1000173F4();
  }
}

void sub_10000861C(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if (qword_100028F30 != -1) {
      dispatch_once(&qword_100028F30, &stru_100024D38);
    }
    if (byte_100028F38)
    {
      std::string v2 = qword_100028F80;
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Refusing to run compressor sweep from compress XPC activity on swap-capable device", v3, 2u);
      }
      xpc_activity_unregister("com.apple.memory-maintenance.compress");
    }
    else
    {
      sub_1000072D0();
    }
  }
}

void sub_1000086F4(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    std::string v2 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking if device should be enrolled in experiments", v3, 2u);
    }
    KRExperimentsInit();
  }
}

void sub_100008770(id a1, void *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.trial.NamespaceUpdate.FREEZER_POLICIES"))
  {
    uint64_t v3 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device experiment state has been updated", buf, 2u);
    }
    if ((KRExperimentsHandleUpdate() & 1) == 0)
    {
      stat v4 = qword_100028F80;
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "New experiment state can not be applied. Scheduling deferred application.", v6, 2u);
      }
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 1);
      xpc_dictionary_set_BOOL(v5, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
      xpc_dictionary_set_int64(v5, XPC_ACTIVITY_DELAY, 0);
      xpc_dictionary_set_int64(v5, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_DAY);
      xpc_dictionary_set_string(v5, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_activity_register("com.apple.memory-maintenance.KRExperimentsDestructiveUpdate", v5, &stru_100024D78);
      xpc_release(v5);
    }
  }
}

void sub_100008914(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2)
  {
    if ((analytics_is_event_used() & 1) != 0 || analytics_is_event_used())
    {
      sub_100007678(1);
    }
    else
    {
      std::string v2 = qword_100028F80;
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "memorytools.stats events disabled, skipping analytics", v3, 2u);
      }
    }
  }
}

void sub_1000089D0(id a1, _xpc_activity_s *a2)
{
  if (xpc_activity_get_state(a2) == 2 && analytics_is_event_used())
  {
    sub_100016990(0);
  }
}

void sub_100008A20(void **a1, unint64_t a2)
{
  stat v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_100008AE8();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)sub_100008B90(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    int v9 = &v6[4 * v8];
    int v10 = (char *)*a1;
    size_t v11 = (char *)a1[1];
    xpc_object_t v12 = v7;
    if (v11 != *a1)
    {
      xpc_object_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t sub_100008AC8(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)a1 + 88);
  unint64_t v3 = *(void *)(*(void *)a2 + 88);
  BOOL v4 = v2 >= v3;
  if (v2 <= v3) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4) {
    return v5;
  }
  else {
    return 1;
  }
}

void sub_100008AE8()
{
}

void sub_100008B00(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100008B5C(exception, a1);
}

void sub_100008B48(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100008B5C(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100008B90(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100008BC8();
  }
  return operator new(4 * a2);
}

void sub_100008BC8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  size_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100008BFC(id a1)
{
  int v2 = 0;
  size_t v1 = 4;
  sysctlbyname("kern.memorystatus_swap_all_apps", &v2, &v1, 0, 0);
  byte_100028F38 = v2 != 0;
}

void sub_100008C54(id a1, _xpc_activity_s *a2)
{
}

void sub_100008C5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100008C78(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008CC4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void *sub_100008CE4()
{
  uint64_t result = sub_100007B84();
  qword_100028F58 = (uint64_t)result;
  return result;
}

void sub_100008D04()
{
  mach_service = xpc_connection_create_mach_service("com.apple.mmaintenanced", 0, 1uLL);
  qword_100028F40 = (uint64_t)mach_service;
  if (!mach_service)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C254();
    }
    exit(1);
  }
  xpc_connection_set_event_handler(mach_service, &stru_100024DB8);
  size_t v1 = (_xpc_connection_s *)qword_100028F40;

  xpc_connection_resume(v1);
}

void sub_100008D8C(id a1, void *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100008EF0;
    handler[3] = &unk_100024DD8;
    void handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      if (a2 == &_xpc_error_connection_invalid)
      {
        if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
          sub_10001C288();
        }
      }
      else
      {
        BOOL v4 = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR);
        if (a2 == &_xpc_error_termination_imminent)
        {
          if (v4) {
            sub_10001C318();
          }
        }
        else if (v4)
        {
          sub_10001C3A8(a2);
        }
      }
      exit(1);
    }
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C430();
    }
  }
}

void *sub_100008EF0(int a1, xpc_object_t object)
{
  uint64_t result = xpc_get_type(object);
  if (result != &_xpc_type_error)
  {
    uint64_t result = (void *)xpc_dictionary_get_uint64(object, "cmd");
    switch((unint64_t)result)
    {
      case 1uLL:
        xpc_object_t xdict = object;
        if (object) {
          xpc_retain(object);
        }
        message[0] = xpc_dictionary_create_reply(object);
        if (!message[0]) {
          goto LABEL_60;
        }
        goto LABEL_39;
      case 2uLL:
        xpc_object_t xdict = object;
        if (object) {
          xpc_retain(object);
        }
        message[0] = xpc_dictionary_create_reply(object);
        if (message[0])
        {
          BOOL v4 = sub_100005614();
          unsigned int v5 = v4;
          if (v4)
          {
            uint64_t v6 = sub_100005AE4((uint64_t)v4);
            xpc_dictionary_set_uint64(message[0], "UserReclaimableCurrent", v6);
            free(v5);
          }
          else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
          {
            sub_10001C498();
          }
          xpc_dictionary_set_uint64(message[0], "UserReclaimableLimit", qword_100028F60);
          LODWORD(original) = 0;
          if (sub_10000A024(&original)
            && os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
          {
            sub_10001C464();
          }
          xpc_dictionary_set_uint64(message[0], "KernelHWMCurrent", original);
          xpc_dictionary_set_uint64(message[0], "KernelHWMLimit", qword_100028F68);
          char v20 = sub_100006120();
          xpc_dictionary_set_BOOL(message[0], "IsEligibleForReboot", v20);
          char v21 = sub_100006078();
          xpc_dictionary_set_BOOL(message[0], "IsStressRack", v21);
          remote_connection = xpc_dictionary_get_remote_connection(xdict);
          xpc_connection_send_message(remote_connection, message[0]);
        }
        goto LABEL_60;
      case 3uLL:
        xpc_object_t xdict = object;
        if (object) {
          xpc_retain(object);
        }
        message[0] = xpc_dictionary_create_reply(object);
        if (message[0])
        {
          uint64_t v7 = xpc_dictionary_get_remote_connection(xdict);
          xpc_connection_send_message(v7, message[0]);
          xpc_connection_send_barrier(v7, &stru_100024E18);
        }
        goto LABEL_60;
      case 4uLL:
        xpc_object_t xdict = object;
        if (object) {
          xpc_retain(object);
        }
        uint64_t v8 = sub_100005614();
        uint64_t v9 = v8;
        if (v8)
        {
          char v10 = sub_100006A5C((uint64_t)v8);
          free(v9);
        }
        else
        {
          char v10 = 0;
        }
        message[0] = xpc_dictionary_create_reply(xdict);
        if (message[0])
        {
          int v18 = xpc_dictionary_get_remote_connection(xdict);
          xpc_dictionary_set_BOOL(message[0], "DeviceWillReboot", v10);
          xpc_connection_send_message(v18, message[0]);
        }
        goto LABEL_60;
      case 5uLL:
        xpc_object_t original = object;
        if (object) {
          xpc_retain(object);
        }
        size_t v11 = sub_100005614();
        if (v11)
        {
          sub_1000094DC(message, "memory_maintenance triggered reboot");
          char v12 = sub_1000065B4((uint64_t)message, (uint64_t)v11, 0, 0);
          if (v26 < 0) {
            operator delete(message[0]);
          }
          free(v11);
        }
        else
        {
          char v12 = 0;
        }
        xpc_object_t xdict = xpc_dictionary_create_reply(original);
        if (xdict)
        {
          __int16 v19 = xpc_dictionary_get_remote_connection(original);
          xpc_dictionary_set_BOOL(xdict, "DeviceWillReboot", v12);
          xpc_connection_send_message(v19, xdict);
        }
        sub_100009434(&xdict);
        p_xpc_object_t original = &original;
        goto LABEL_61;
      case 6uLL:
        xpc_object_t xdict = object;
        if (object) {
          xpc_retain(object);
        }
        sub_100006E64();
        message[0] = xpc_dictionary_create_reply(xdict);
        if (message[0]) {
          goto LABEL_39;
        }
        goto LABEL_60;
      case 7uLL:
        xpc_object_t xdict = object;
        if (object) {
          xpc_retain(object);
        }
        sub_1000072D0();
        message[0] = xpc_dictionary_create_reply(xdict);
        if (message[0]) {
          goto LABEL_39;
        }
        goto LABEL_60;
      case 8uLL:
        xpc_object_t xdict = object;
        if (object) {
          xpc_retain(object);
        }
        int v13 = sub_100005614();
        uint64_t v14 = v13;
        if (v13)
        {
          sub_100005EE4((uint64_t)v13);
          free(v14);
        }
        message[0] = xpc_dictionary_create_reply(xdict);
        if (message[0])
        {
LABEL_39:
          uint64_t v15 = xpc_dictionary_get_remote_connection(xdict);
          xpc_connection_send_message(v15, message[0]);
        }
LABEL_60:
        sub_100009434(message);
        p_xpc_object_t original = &xdict;
        goto LABEL_61;
      case 9uLL:
        message[0] = object;
        if (object) {
          xpc_retain(object);
        }
        BOOL v16 = xpc_dictionary_get_BOOL(object, "ca_enabled");
        sub_100007678(v16);
        goto LABEL_46;
      case 0xAuLL:
        message[0] = object;
        if (object) {
          xpc_retain(object);
        }
        sub_1000173F4();
LABEL_46:
        p_xpc_object_t original = message;
LABEL_61:
        uint64_t result = sub_100009434(p_original);
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_100009368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, void *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
}

void **sub_100009434(void **a1)
{
  int v2 = *a1;
  if (v2) {
    xpc_release(v2);
  }
  return a1;
}

void sub_100009468(void *a1)
{
}

void sub_10000947C(id a1)
{
  size_t v1 = qword_100028F80;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "shutting down at user request", v2, 2u);
  }
  exit(0);
}

void *sub_1000094DC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100009590();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_100009590()
{
}

uint64_t sub_1000095A8()
{
  if (access("/System/Library/LaunchDaemons/com.apple.jetsamproperties.NonUI.plist", 0))
  {
    LOBYTE(v23[0]) = 0;
    size_t v22 = 32;
    if (sysctlbyname("hw.targettype", v23, &v22, 0, 0))
    {
      sub_1000094DC(v16, "");
    }
    else
    {
      util::stringprintf((util *)"%s.%s.plist", __p, "/AppleInternal/Library/LaunchDaemons/com.apple.jetsamproperties", v23);
      if (v21 >= 0) {
        uint64_t v0 = __p;
      }
      else {
        uint64_t v0 = (void **)__p[0];
      }
      if (!access((const char *)v0, 0)) {
        goto LABEL_17;
      }
      util::stringprintf((util *)"%s.%s.plist", object, "/System/Library/LaunchDaemons/com.apple.jetsamproperties", v23);
      if (SHIBYTE(v21) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)__p = *(_OWORD *)object;
      uint64_t v21 = v19;
      size_t v1 = v19 >= 0 ? (const char *)__p : (const char *)object[0];
      if (access(v1, 0))
      {
        sub_1000094DC(v16, "");
        if (SHIBYTE(v21) < 0) {
          operator delete(__p[0]);
        }
      }
      else
      {
LABEL_17:
        *(_OWORD *)BOOL v16 = *(_OWORD *)__p;
        uint64_t v17 = v21;
      }
    }
  }
  else
  {
    sub_1000094DC(v16, "/System/Library/LaunchDaemons/com.apple.jetsamproperties.NonUI.plist");
  }
  if (v17 >= 0) {
    int v2 = v16;
  }
  else {
    int v2 = (void **)v16[0];
  }
  util::MappedFile::MappedFile((util::MappedFile *)v23, (const char *)v2);
  if (!v23[1] || v23[0])
  {
    size_t v4 = (void *)xpc_create_from_plist();
    __p[0] = v4;
    if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_object_t value = xpc_dictionary_get_value(__p[0], "Version4");
      size_t v22 = (size_t)value;
      if (value)
      {
        xpc_retain(value);
        uint64_t v6 = (void *)v22;
      }
      else
      {
        uint64_t v6 = 0;
      }
      object[0] = v6;
      size_t v22 = 0;
      sub_100009434((void **)&v22);
      if (object[0] && xpc_get_type(object[0]) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_object_t v7 = xpc_dictionary_get_value(object[0], "System");
        xpc_object_t xdict = v7;
        if (v7)
        {
          xpc_retain(v7);
          xpc_object_t v8 = xdict;
        }
        else
        {
          xpc_object_t v8 = 0;
        }
        size_t v22 = (size_t)v8;
        xpc_object_t xdict = 0;
        sub_100009434(&xdict);
        if (v22 && xpc_get_type((xpc_object_t)v22) == (xpc_type_t)&_xpc_type_dictionary)
        {
          xpc_object_t v9 = xpc_dictionary_get_value((xpc_object_t)v22, "Override");
          xpc_object_t v14 = v9;
          if (v9)
          {
            xpc_retain(v9);
            xpc_object_t v10 = v14;
          }
          else
          {
            xpc_object_t v10 = 0;
          }
          xpc_object_t v14 = 0;
          xpc_object_t xdict = v10;
          sub_100009434(&v14);
          if (xdict && xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
          {
            xpc_object_t v11 = xpc_dictionary_get_value(xdict, "Global");
            uint64_t v3 = (uint64_t)v11;
            int v13 = v11;
            if (v11)
            {
              xpc_retain(v11);
              int v13 = 0;
              xpc_object_t v14 = (xpc_object_t)v3;
              sub_100009434(&v13);
              if (xpc_get_type((xpc_object_t)v3) == (xpc_type_t)&_xpc_type_dictionary)
              {
                qword_100028F60 = xpc_dictionary_get_int64(v14, "UserReclaimableLimit");
                qword_100028F68 = xpc_dictionary_get_int64(v14, "KernelHighWaterMark");
                qword_100028F70 = xpc_dictionary_get_int64(v14, "DarkBootSystemUIHardLimit");
                uint64_t v3 = 1;
              }
              else
              {
                uint64_t v3 = 0;
              }
            }
            else
            {
              int v13 = 0;
              xpc_object_t v14 = 0;
              sub_100009434(&v13);
            }
            sub_100009434(&v14);
          }
          else
          {
            uint64_t v3 = 0;
          }
          sub_100009434(&xdict);
        }
        else
        {
          uint64_t v3 = 0;
        }
        sub_100009434((void **)&v22);
      }
      else
      {
        uint64_t v3 = 0;
      }
      sub_100009434(object);
    }
    else
    {
      uint64_t v3 = 0;
    }
    sub_100009434(__p);
  }
  else
  {
    uint64_t v3 = 0;
  }
  util::MappedFile::~MappedFile((util::MappedFile *)v23);
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
  return v3;
}

void sub_100009968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  sub_100009434(&a13);
  sub_100009434(&a14);
  sub_100009434((void **)(v29 - 64));
  sub_100009434(&a21);
  sub_100009434((void **)&a24);
  util::MappedFile::~MappedFile((util::MappedFile *)(v29 - 56));
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL sub_100009A14()
{
  sub_100009CB0(&__p, "/private/var/mobile/Library/MemoryMaintenance/system_hwm");
  std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&__p, 0);
  uint64_t v0 = v4;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v0) {
    BOOL v1 = v0 == 255;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

void sub_100009A80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_100009A9C(uint64_t a1, std::error_code *a2)
{
  return !remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/MemoryMaintenance/system_hwm", a2);
}

FILE *sub_100009AC4@<X0>(_OWORD *a1@<X8>)
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  uint64_t result = fopen("/private/var/mobile/Library/MemoryMaintenance/system_hwm", "r");
  if (result)
  {
    uint64_t v3 = result;
    fgets(v6, 256, result);
    int v4 = sscanf(v6, "perform_u_reboot=%llu uhwm_level=%llu uhwm_limit=%llu perform_k_reboot=%llu khwm_level=%llu khwm_limit=%llu\n", a1, (char *)a1 + 8, a1 + 1, (char *)a1 + 24, a1 + 2, (char *)a1 + 40);
    int v5 = ferror(v3);
    if (v4 != 6 || v5)
    {
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
    return (FILE *)fclose(v3);
  }
  return result;
}

FILE *sub_100009BB4(void *a1)
{
  uint64_t result = fopen("/private/var/mobile/Library/MemoryMaintenance/system_hwm", "w");
  if (result)
  {
    uint64_t v3 = result;
    fprintf(result, "perform_u_reboot=%llu uhwm_level=%llu uhwm_limit=%llu perform_k_reboot=%llu khwm_level=%llu khwm_limit=%llu\n", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
    int v4 = ferror(v3);
    fclose(v3);
    if (v4)
    {
      return 0;
    }
    else
    {
      sync();
      return (FILE *)1;
    }
  }
  return result;
}

FILE *sub_100009C3C(unsigned int a1, uint64_t a2, uint64_t a3)
{
  if (sub_100009A14() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10001C4CC();
  }
  v7[0] = a1;
  v7[1] = a2;
  int64_t v7[2] = a3;
  memset(&v7[3], 0, 24);
  return sub_100009BB4(v7);
}

std::string *sub_100009CB0(std::string *this, char *a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = a2 - 1;
  while (*++v3)
    ;
  sub_100009D0C(this, a2, v3);
  return this;
}

void sub_100009CF0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_100009D0C(std::string *this, char *a2, char *a3)
{
  int v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    xpc_object_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    xpc_object_t v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    xpc_object_t v14 = this;
    if ((v6 & 0x80) != 0) {
      xpc_object_t v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    for (uint64_t i = (char *)v14 + size; v4 != a3; ++i)
    {
      char v16 = *v4++;
      *uint64_t i = v16;
    }
    *uint64_t i = 0;
    std::string::size_type v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    sub_100009E84(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      char v12 = __p;
    }
    else {
      char v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_100009E68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100009E84(void *result, char *a2, char *a3, unint64_t a4)
{
  int v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100009590();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *int v4 = result;
    int v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)int v4 = v10;
    int v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)int v4 = 0;
  return result;
}

uint64_t sub_100009F2C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v4 = a2;
  for (uint64_t i = (const char *)(a1 + 96); ; i += 176)
  {
    size_t v6 = strlen(i);
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    char v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    unsigned __int8 v18 = 0;
    char v19 = 0;
    uint64_t v20 = 0;
    *(_OWORD *)std::string __p = 0u;
    memset(v12, 0, sizeof(v12));
    int v7 = sub_10000A56C(a3, (uint64_t)i, (uint64_t)&i[v6], (uint64_t)__p, 4160);
    int v8 = v18;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    int v9 = v8 ? 0 : v7;
    if (v9 == 1) {
      break;
    }
    if (!--v4) {
      return 0;
    }
  }
  return *((void *)i - 10);
}

void sub_10000A008(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A024(void *a1)
{
  size_t v11 = 4;
  if (sysctlbyname("kern.memorystatus_level", a1, &v11, 0, 0))
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C618();
    }
    return 1;
  }
  else
  {
    mach_zone_name_array_t names = 0;
    mach_msg_type_number_t namesCnt = 0;
    mach_zone_info_array_t info = 0;
    mach_msg_type_number_t infoCnt = 0;
    mach_memory_info_array_t memory_info = 0;
    mach_msg_type_number_t memory_infoCnt = 0;
    mach_port_t v2 = mach_host_self();
    if (!mach_memory_info(v2, &names, &namesCnt, &info, &infoCnt, &memory_info, &memory_infoCnt)) {
      sub_10000D54C(&v4, "com.apple.driver.AppleH[0-9]+CameraInterface.NonPersistent", 0);
    }
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C5E4();
    }
    return 0;
  }
}

void sub_10000A494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11)
{
}

void sub_10000A4B8(std::locale *this)
{
  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (locale) {
    sub_10000A4F8(locale);
  }

  std::locale::~locale(this);
}

void sub_10000A4F8(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t sub_10000A56C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  sub_10000A748(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_10000A7BC(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(void *)(a4 + 8) == *(void *)a4) {
      char v10 = (uint64_t *)(a4 + 24);
    }
    else {
      char v10 = *(uint64_t **)a4;
    }
LABEL_8:
    uint64_t v11 = *v10;
    *(void *)(a4 + 56) = *v10;
    *(unsigned char *)(a4 + 64) = *(void *)(a4 + 48) != v11;
    uint64_t v12 = v10[1];
    *(void *)(a4 + 72) = v12;
    *(unsigned char *)(a4 + 88) = v12 != *(void *)(a4 + 80);
    return 1;
  }
  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    int v14 = v9 | 0x80;
    uint64_t v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_10000A7DC((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), (long long *)(a4 + 24));
        int v16 = sub_10000A7BC(a1, v15, a3, (uint64_t *)a4, v14, 0);
        uint64_t v18 = *(void *)a4;
        uint64_t v17 = *(void *)(a4 + 8);
        if (v16) {
          break;
        }
        sub_10000A7DC((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (long long *)(a4 + 24));
        if (++v15 == a3) {
          goto LABEL_14;
        }
      }
      if (v17 == v18) {
        char v10 = (uint64_t *)(a4 + 24);
      }
      else {
        char v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
LABEL_14:
    sub_10000A7DC((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3), (long long *)(a4 + 24));
    if (sub_10000A7BC(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(void *)(a4 + 8) == *(void *)a4) {
        char v10 = (uint64_t *)(a4 + 24);
      }
      else {
        char v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
  }
  uint64_t result = 0;
  *(void *)(a4 + 8) = *(void *)a4;
  return result;
}

char *sub_10000A748(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(a1 + 24) = a4;
  int v8 = (_OWORD *)(a1 + 24);
  *(void *)(a1 + 32) = a4;
  *(unsigned char *)(a1 + 40) = 0;
  uint64_t result = sub_10000A7DC((char **)a1, a2, (long long *)(a1 + 24));
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = a3;
  *(unsigned char *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a1 + 40);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = a3;
  }
  *(unsigned char *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_10000A7BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return sub_10000A954(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return sub_10000B344(a1, a2, a3, a4, a5, a6);
  }
  return sub_10000ADA8(a1, a2, a3, a4, a5, a6);
}

char *sub_10000A7DC(char **a1, unint64_t a2, long long *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    uint64_t v15 = a1[1];
    unint64_t v16 = (v15 - result) / 24;
    if (v16 >= a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = (v15 - result) / 24;
    }
    if (v17)
    {
      uint64_t v18 = result;
      do
      {
        *(_OWORD *)uint64_t v18 = *a3;
        v18[16] = *((unsigned char *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      char v19 = &v15[24 * (a2 - v16)];
      uint64_t v20 = 24 * a2 - 24 * v16;
      do
      {
        long long v21 = *a3;
        *((void *)v15 + 2) = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100008AE8();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    uint64_t result = sub_10000C138(a1, v10);
    uint64_t v11 = a1[1];
    uint64_t v12 = &v11[24 * a2];
    uint64_t v13 = 24 * a2;
    do
    {
      long long v14 = *a3;
      *((void *)v11 + 2) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

uint64_t sub_10000A954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  v45 = 0;
  v46 = 0;
  unint64_t v47 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&long long v43 = a3;
    *((void *)&v43 + 1) = a3;
    char v44 = 0;
    *(_DWORD *)unint64_t v40 = 0;
    memset(&v40[8], 0, 48);
    *(_OWORD *)std::string __p = 0u;
    memset(v42, 0, 21);
    v46 = (_OWORD *)sub_10000BA4C((uint64_t *)&v45, (uint64_t)v40);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(void *)&v40[32])
    {
      *(void *)&v40[40] = *(void *)&v40[32];
      operator delete(*(void **)&v40[32]);
    }
    uint64_t v38 = a4;
    uint64_t v13 = v46;
    *((_DWORD *)v46 - 24) = 0;
    *((void *)v13 - 11) = a2;
    *((void *)v13 - 10) = a2;
    *((void *)v13 - 9) = a3;
    sub_10000B930((uint64_t)(v13 - 4), *(unsigned int *)(a1 + 28), &v43);
    sub_10000B96C((uint64_t)v46 - 40, *(unsigned int *)(a1 + 32));
    long long v14 = v46;
    *((void *)v46 - 2) = v6;
    uint64_t v39 = a3;
    signed int v15 = a3 - a2;
    *((_DWORD *)v14 - 2) = a5;
    *((unsigned char *)v14 - 4) = a6;
    unsigned int v16 = 1;
    while (2)
    {
      if ((v16 & 0xFFF) != 0 || (int)(v16 >> 12) < v15)
      {
        uint64_t v18 = v14 - 1;
        uint64_t v17 = *((void *)v14 - 2);
        char v19 = v14 - 6;
        if (v17) {
          (*(void (**)(uint64_t, _OWORD *))(*(void *)v17 + 16))(v17, v14 - 6);
        }
        switch(*(_DWORD *)v19)
        {
          case 0xFFFFFC18:
            uint64_t v20 = *((void *)v14 - 10);
            if ((a5 & 0x20) != 0 && v20 == a2 || (a5 & 0x1000) != 0 && v20 != v39) {
              goto LABEL_16;
            }
            uint64_t v29 = *v38;
            *(void *)uint64_t v29 = a2;
            *(void *)(v29 + 8) = v20;
            *(unsigned char *)(v29 + 16) = 1;
            uint64_t v30 = *((void *)v14 - 8);
            uint64_t v31 = *((void *)v14 - 7) - v30;
            if (v31)
            {
              unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * (v31 >> 3);
              uint64_t v33 = (unsigned char *)(v30 + 16);
              unsigned int v34 = 1;
              do
              {
                uint64_t v35 = v29 + 24 * v34;
                *(_OWORD *)uint64_t v35 = *((_OWORD *)v33 - 1);
                char v36 = *v33;
                v33 += 24;
                *(unsigned char *)(v35 + 16) = v36;
              }
              while (v32 > v34++);
            }
            uint64_t v27 = 1;
            goto LABEL_25;
          case 0xFFFFFC1D:
          case 0xFFFFFC1E:
          case 0xFFFFFC21:
            goto LABEL_23;
          case 0xFFFFFC1F:
LABEL_16:
            long long v21 = v46 - 6;
            sub_10000BCE8((void *)v46 - 12);
            v46 = v21;
            goto LABEL_23;
          case 0xFFFFFC20:
            long long v22 = *(v14 - 5);
            *(_OWORD *)unint64_t v40 = *v19;
            *(_OWORD *)&v40[16] = v22;
            memset(&v40[32], 0, 24);
            sub_10000C0B8(&v40[32], *((long long **)v14 - 8), *((long long **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
            __p[0] = 0;
            __p[1] = 0;
            v42[0] = 0;
            sub_10000C18C((char *)__p, *((long long **)v14 - 5), *((long long **)v14 - 4), (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
            uint64_t v23 = *v18;
            *(void *)((char *)&v42[1] + 5) = *(void *)((char *)v14 - 11);
            v42[1] = v23;
            (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v18 + 24))(*v18, 1, v14 - 6);
            (*(void (**)(void, void, unsigned char *))(*(void *)v42[1] + 24))(v42[1], 0, v40);
            long long v24 = v46;
            if ((unint64_t)v46 >= v47)
            {
              v46 = (_OWORD *)sub_10000BA4C((uint64_t *)&v45, (uint64_t)v40);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v25 = *(_OWORD *)&v40[16];
              _OWORD *v46 = *(_OWORD *)v40;
              v24[1] = v25;
              *((void *)v24 + 4) = 0;
              *((void *)v24 + 5) = 0;
              *((void *)v24 + 6) = 0;
              *((void *)v24 + 7) = 0;
              v24[2] = *(_OWORD *)&v40[32];
              *((void *)v24 + 6) = *(void *)&v40[48];
              memset(&v40[32], 0, 24);
              *((void *)v24 + 8) = 0;
              *((void *)v24 + 9) = 0;
              *(_OWORD *)((char *)v24 + 56) = *(_OWORD *)__p;
              *((void *)v24 + 9) = v42[0];
              __p[0] = 0;
              __p[1] = 0;
              v42[0] = 0;
              uint64_t v26 = v42[1];
              *(void *)((char *)v24 + 85) = *(void *)((char *)&v42[1] + 5);
              *((void *)v24 + 10) = v26;
              v46 = v24 + 6;
            }
            if (*(void *)&v40[32])
            {
              *(void *)&v40[40] = *(void *)&v40[32];
              operator delete(*(void **)&v40[32]);
            }
LABEL_23:
            long long v14 = v46;
            ++v16;
            if (v45 == v46) {
              goto LABEL_24;
            }
            continue;
          default:
            sub_10000B9F4();
        }
      }
      break;
    }
    sub_10000B99C();
  }
LABEL_24:
  uint64_t v27 = 0;
LABEL_25:
  *(void *)unint64_t v40 = &v45;
  sub_10000C244((void ***)v40);
  return v27;
}

void sub_10000AD28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  sub_10000B8EC(&a11);
  a11 = v16 - 112;
  sub_10000C244((void ***)&a11);
  _Unwind_Resume(a1);
}

uint64_t sub_10000ADA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)uint64_t v57 = 0;
    memset(&v57[8], 0, 32);
    long long v58 = 0uLL;
    *(_OWORD *)std::string __p = 0uLL;
    memset(v60, 0, 21);
    sub_10000C2C8(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    uint64_t v51 = a4;
    if (*(void *)&v57[32])
    {
      *(void *)&long long v58 = *(void *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    uint64_t v12 = *((void *)&v61 + 1);
    unint64_t v13 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_10000B96C(*(void *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    char v55 = 0;
    unsigned int v18 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = a2;
    uint64_t v19 = *((void *)&v63 + 1);
    uint64_t v20 = *((void *)&v61 + 1);
    unint64_t v21 = *((void *)&v63 + 1) + v63 - 1;
    unint64_t v22 = v21 / 0x2A;
    unint64_t v23 = 3 * (v21 % 0x2A);
    *(void *)(*(void *)(*((void *)&v61 + 1) + 8 * v22) + 32 * v23 + 80) = v6;
    uint64_t v24 = a3 - a2;
    uint64_t v25 = *(void *)(v20 + 8 * v22) + 32 * v23;
    *(_DWORD *)(v25 + 88) = a5;
    *(unsigned char *)(v25 + 92) = a6;
    uint64_t v52 = a3;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v24) {
        sub_10000B99C();
      }
      unint64_t v27 = v19 + v63 - 1;
      uint64_t v28 = *(void *)(*((void *)&v61 + 1) + 8 * (v27 / 0x2A));
      unint64_t v29 = v27 % 0x2A;
      uint64_t v30 = v28 + 96 * (v27 % 0x2A);
      unint64_t v32 = (void *)(v30 + 80);
      uint64_t v31 = *(void *)(v30 + 80);
      if (v31) {
        (*(void (**)(uint64_t, unint64_t))(*(void *)v31 + 16))(v31, v28 + 96 * v29);
      }
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          uint64_t v33 = *(void *)(v28 + 96 * v29 + 16);
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == v52;
          BOOL v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v53;
          if ((v55 & (v53 >= v37)) == 0) {
            uint64_t v38 = v37;
          }
          if (v38 != v24)
          {
            uint64_t v53 = v38;
            sub_10000C3CC(&v61);
            char v55 = 1;
            goto LABEL_38;
          }
          uint64_t v39 = (void **)*((void *)&v61 + 1);
          uint64_t v40 = v62;
          if ((void)v62 == *((void *)&v61 + 1))
          {
            uint64_t v40 = *((void *)&v61 + 1);
          }
          else
          {
            size_t v41 = (void *)(*((void *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            size_t v42 = (void *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * ((*((void *)&v63 + 1) + (void)v63) / 0x2AuLL))
                + 96 * ((*((void *)&v63 + 1) + (void)v63) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                sub_10000BCE8(v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  char v44 = (void *)v41[1];
                  ++v41;
                  size_t v42 = v44;
                }
              }
              while (v42 != (void *)v43);
              uint64_t v39 = (void **)*((void *)&v61 + 1);
              uint64_t v40 = v62;
            }
          }
          *((void *)&v63 + 1) = 0;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              uint64_t v39 = (void **)(*((void *)&v61 + 1) + 8);
              *((void *)&v61 + 1) = v39;
              unint64_t v47 = v62 - (void)v39;
            }
            while ((void)v62 - (void)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            uint64_t v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2) {
              goto LABEL_53;
            }
            uint64_t v48 = 42;
          }
          *(void *)&long long v63 = v48;
LABEL_53:
          char v55 = 1;
          uint64_t v53 = v24;
LABEL_38:
          uint64_t v19 = *((void *)&v63 + 1);
          if (*((void *)&v63 + 1)) {
            continue;
          }
          if (v55)
          {
            uint64_t v49 = *v51;
            *(void *)uint64_t v49 = v54;
            *(void *)(v49 + 8) = v54 + v53;
            uint64_t v6 = 1;
            *(unsigned char *)(v49 + 16) = 1;
          }
          else
          {
            uint64_t v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          sub_10000C454((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_10000C3CC(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          long long v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)uint64_t v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          long long v58 = 0uLL;
          *(void *)&v57[32] = 0;
          sub_10000C0B8(&v57[32], *(long long **)(v28 + 96 * v29 + 32), *(long long **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          sub_10000C18C((char *)__p, *(long long **)(v28 + 96 * v29 + 56), *(long long **)(v28 + 96 * v29 + 64), (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v60[1] + 5) = *(void *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(void, void, unsigned char *))(*(void *)v60[1] + 24))(v60[1], 0, v57);
          sub_10000C2C8(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(void *)&v57[32])
          {
            *(void *)&long long v58 = *(void *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          sub_10000B9F4();
      }
      break;
    }
  }
  sub_10000D098(&v61);
  return v6;
}

void sub_10000B2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
}

uint64_t sub_10000B344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  __int16 v56 = 0;
  uint64_t v57 = 0;
  unint64_t v58 = 0;
  *(_DWORD *)uint64_t v53 = 0;
  memset(&v53[8], 0, 32);
  long long v54 = 0u;
  memset(v55, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_43;
  }
  *(void *)&long long v51 = a3;
  *((void *)&v51 + 1) = a3;
  char v52 = 0;
  *(_DWORD *)uint64_t v48 = 0;
  memset(&v48[8], 0, 48);
  *(_OWORD *)std::string __p = 0uLL;
  memset(v50, 0, 21);
  uint64_t v57 = (_OWORD *)sub_10000BA4C((uint64_t *)&v56, (uint64_t)v48);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*(void *)&v48[32])
  {
    *(void *)&v48[40] = *(void *)&v48[32];
    operator delete(*(void **)&v48[32]);
  }
  char v44 = a4;
  uint64_t v12 = v57;
  *((_DWORD *)v57 - 24) = 0;
  *((void *)v12 - 11) = a2;
  *((void *)v12 - 10) = a2;
  *((void *)v12 - 9) = a3;
  sub_10000B930((uint64_t)(v12 - 4), *(unsigned int *)(a1 + 28), &v51);
  sub_10000B96C((uint64_t)v57 - 40, *(unsigned int *)(a1 + 32));
  uint64_t v45 = a3;
  uint64_t v46 = 0;
  char v13 = 0;
  unsigned int v14 = 0;
  uint64_t v15 = a3 - a2;
  unint64_t v16 = v57;
  *((void *)v57 - 2) = v6;
  *((_DWORD *)v16 - 2) = a5;
  *((unsigned char *)v16 - 4) = a6;
  do
  {
    BOOL v17 = (++v14 & 0xFFF) != 0 || (int)(v14 >> 12) < (int)v15;
    if (!v17) {
      sub_10000B99C();
    }
    uint64_t v19 = v16 - 1;
    uint64_t v18 = *((void *)v16 - 2);
    uint64_t v20 = v16 - 6;
    if (v18) {
      (*(void (**)(uint64_t, _OWORD *))(*(void *)v18 + 16))(v18, v16 - 6);
    }
    switch(*(_DWORD *)v20)
    {
      case 0xFFFFFC18:
        uint64_t v21 = *((void *)v16 - 10);
        if ((a5 & 0x20) != 0 && v21 == a2 || (a5 & 0x1000) != 0 && v21 != v45) {
          goto LABEL_19;
        }
        char v28 = v13;
        uint64_t v29 = v21 - *((void *)v16 - 11);
        uint64_t v30 = v46;
        if ((v28 & (v46 >= v29)) == 0)
        {
          long long v31 = *(v16 - 5);
          *(_OWORD *)uint64_t v53 = *(_OWORD *)v20;
          *(_OWORD *)&v53[16] = v31;
          if (v53 != v20)
          {
            sub_10000D244(&v53[32], *((long long **)v16 - 8), *((long long **)v16 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v16 - 7) - *((void *)v16 - 8)) >> 3));
            sub_10000D3FC(v55, *((uint64_t **)v16 - 5), *((uint64_t **)v16 - 4), (uint64_t)(*((void *)v16 - 4) - *((void *)v16 - 5)) >> 4);
          }
          unint64_t v32 = (void *)*v19;
          *(void **)((char *)&v55[3] + 5) = *(void **)((char *)v16 - 11);
          v55[3] = v32;
          uint64_t v30 = v29;
        }
        uint64_t v33 = v57;
        if (v30 == v15)
        {
          uint64_t v34 = (uint64_t)v56;
          while (v33 != (void *)v34)
          {
            v33 -= 12;
            sub_10000BCE8(v33);
          }
          uint64_t v57 = (_OWORD *)v34;
          char v13 = 1;
          uint64_t v46 = v15;
        }
        else
        {
          uint64_t v46 = v30;
          BOOL v35 = v57 - 6;
          sub_10000BCE8((void *)v57 - 12);
          uint64_t v57 = v35;
          char v13 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_19:
        unint64_t v22 = v57 - 6;
        sub_10000BCE8((void *)v57 - 12);
        uint64_t v57 = v22;
        break;
      case 0xFFFFFC20:
        long long v23 = *(v16 - 5);
        *(_OWORD *)uint64_t v48 = *(_OWORD *)v20;
        *(_OWORD *)&v48[16] = v23;
        memset(&v48[32], 0, 24);
        sub_10000C0B8(&v48[32], *((long long **)v16 - 8), *((long long **)v16 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v16 - 7) - *((void *)v16 - 8)) >> 3));
        __p[0] = 0;
        __p[1] = 0;
        v50[0] = 0;
        sub_10000C18C((char *)__p, *((long long **)v16 - 5), *((long long **)v16 - 4), (uint64_t)(*((void *)v16 - 4) - *((void *)v16 - 5)) >> 4);
        uint64_t v24 = (void *)*v19;
        *(void *)((char *)&v50[1] + 5) = *(void *)((char *)v16 - 11);
        v50[1] = v24;
        (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v19 + 24))(*v19, 1, v16 - 6);
        (*(void (**)(void, void, unsigned char *))(*(void *)v50[1] + 24))(v50[1], 0, v48);
        uint64_t v25 = v57;
        if ((unint64_t)v57 >= v58)
        {
          uint64_t v57 = (_OWORD *)sub_10000BA4C((uint64_t *)&v56, (uint64_t)v48);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v26 = *(_OWORD *)&v48[16];
          *uint64_t v57 = *(_OWORD *)v48;
          v25[1] = v26;
          *((void *)v25 + 4) = 0;
          *((void *)v25 + 5) = 0;
          *((void *)v25 + 6) = 0;
          *((void *)v25 + 7) = 0;
          v25[2] = *(_OWORD *)&v48[32];
          *((void *)v25 + 6) = *(void *)&v48[48];
          memset(&v48[32], 0, 24);
          *((void *)v25 + 8) = 0;
          *((void *)v25 + 9) = 0;
          *(_OWORD *)((char *)v25 + 56) = *(_OWORD *)__p;
          *((void *)v25 + 9) = v50[0];
          __p[0] = 0;
          __p[1] = 0;
          v50[0] = 0;
          uint64_t v27 = v50[1];
          *(void *)((char *)v25 + 85) = *(void *)((char *)&v50[1] + 5);
          *((void *)v25 + 10) = v27;
          uint64_t v57 = v25 + 6;
        }
        if (*(void *)&v48[32])
        {
          *(void *)&v48[40] = *(void *)&v48[32];
          operator delete(*(void **)&v48[32]);
        }
        break;
      default:
        sub_10000B9F4();
    }
    unint64_t v16 = v57;
  }
  while (v56 != v57);
  if (v13)
  {
    uint64_t v36 = *v44;
    *(void *)uint64_t v36 = a2;
    *(void *)(v36 + 8) = a2 + v46;
    *(unsigned char *)(v36 + 16) = 1;
    if ((void)v54 != *(void *)&v53[32])
    {
      unint64_t v37 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - *(void *)&v53[32]) >> 3);
      uint64_t v38 = (unsigned char *)(*(void *)&v53[32] + 16);
      unsigned int v39 = 1;
      do
      {
        uint64_t v40 = v36 + 24 * v39;
        *(_OWORD *)uint64_t v40 = *((_OWORD *)v38 - 1);
        char v41 = *v38;
        v38 += 24;
        *(unsigned char *)(v40 + 16) = v41;
        BOOL v17 = v37 > v39++;
      }
      while (v17);
    }
    uint64_t v42 = 1;
  }
  else
  {
LABEL_43:
    uint64_t v42 = 0;
  }
  if (v55[0])
  {
    v55[1] = v55[0];
    operator delete(v55[0]);
  }
  if (*(void *)&v53[32])
  {
    *(void *)&long long v54 = *(void *)&v53[32];
    operator delete(*(void **)&v53[32]);
  }
  *(void *)uint64_t v53 = &v56;
  sub_10000C244((void ***)v53);
  return v42;
}

void sub_10000B864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  sub_10000B8EC(&a17);
  sub_10000B8EC(&a33);
  a33 = v33 - 120;
  sub_10000C244((void ***)&a33);
  _Unwind_Resume(a1);
}

void *sub_10000B8EC(void *a1)
{
  mach_port_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_10000B930(uint64_t a1, unint64_t a2, long long *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v4 = a2 >= v3;
  unint64_t v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_10000BD90((void **)a1, v5, a3);
  }
  else if (!v4)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

void sub_10000B96C(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }
  else
  {
    sub_10000BF60((void **)a1, a2 - v2);
  }
}

void sub_10000B99C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_10000B9E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000B9F4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_10000BA38(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BA4C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_100008AE8();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_10000BC14(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  uint64_t v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((void *)v11 + 5) = 0;
  *((void *)v11 + 6) = 0;
  *((void *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v11 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *((void *)v11 + 7) = 0;
  *((void *)v11 + 8) = 0;
  *((void *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  sub_10000BB9C(a1, v16);
  uint64_t v14 = a1[1];
  sub_10000BD40((uint64_t)v16);
  return v14;
}

void sub_10000BB88(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_10000BD40((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10000BB9C(uint64_t *a1, void *a2)
{
  sub_10000BC5C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *sub_10000BC14(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    sub_100008BC8();
  }
  return operator new(96 * a2);
}

__n128 sub_10000BC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a7 + v7;
      uint64_t v9 = a3 + v7;
      long long v10 = *(_OWORD *)(a3 + v7 - 80);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(a3 + v7 - 96);
      *(_OWORD *)(v8 - 80) = v10;
      *(void *)(v8 - 56) = 0;
      *(void *)(v8 - 48) = 0;
      *(void *)(v8 - 64) = 0;
      *(_OWORD *)(v8 - 64) = *(_OWORD *)(a3 + v7 - 64);
      *(void *)(v8 - 48) = *(void *)(a3 + v7 - 48);
      *(void *)(v9 - 64) = 0;
      *(void *)(v9 - 56) = 0;
      *(void *)(v9 - 48) = 0;
      *(void *)(v8 - 40) = 0;
      *(void *)(v8 - 32) = 0;
      *(void *)(v8 - 24) = 0;
      __n128 result = *(__n128 *)(a3 + v7 - 40);
      *(__n128 *)(v8 - 40) = result;
      *(void *)(v8 - 24) = *(void *)(a3 + v7 - 24);
      *(void *)(v9 - 40) = 0;
      *(void *)(v9 - 32) = 0;
      *(void *)(v9 - 24) = 0;
      uint64_t v12 = *(void *)(a3 + v7 - 16);
      *(void *)(v8 - 11) = *(void *)(a3 + v7 - 11);
      *(void *)(v8 - 16) = v12;
      v7 -= 96;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void sub_10000BCE8(void *a1)
{
  unint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

uint64_t sub_10000BD40(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 96;
    sub_10000BCE8((void *)(i - 96));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000BD90(void **a1, unint64_t a2, long long *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(void **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (unsigned char *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      uint64_t v15 = &v9[3 * a2];
      uint64_t v16 = 24 * a2;
      do
      {
        long long v17 = *a3;
        v9[2] = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v9 = v17;
        v9 += 3;
        v16 -= 24;
      }
      while (v16);
      uint64_t v9 = v15;
    }
    a1[1] = v9;
  }
  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (unsigned char *)*a1) >> 3);
    unint64_t v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100008AE8();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (unsigned char *)*a1) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      uint64_t v14 = (char *)sub_10000BF18(v6, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v18 = &v14[24 * v10];
    uint64_t v19 = &v18[24 * a2];
    uint64_t v20 = 24 * a2;
    uint64_t v21 = v18;
    do
    {
      long long v22 = *a3;
      *((void *)v21 + 2) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v21 = v22;
      v21 += 24;
      v20 -= 24;
    }
    while (v20);
    long long v23 = &v14[24 * v13];
    uint64_t v25 = (char *)*a1;
    uint64_t v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        long long v26 = *(_OWORD *)(v24 - 24);
        *((void *)v18 - 1) = *((void *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      uint64_t v24 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24)
    {
      operator delete(v24);
    }
  }
}

void *sub_10000BF18(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100008BC8();
  }
  return operator new(24 * a2);
}

void sub_10000BF60(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      sub_100008AE8();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)sub_10000C080(v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    uint64_t v14 = &v13[16 * v10];
    uint64_t v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    uint64_t v16 = &v14[16 * a2];
    uint64_t v18 = (char *)*a1;
    long long v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      long long v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void *sub_10000C080(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100008BC8();
  }
  return operator new(16 * a2);
}

char *sub_10000C0B8(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = sub_10000C138(result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24;
      a2 = (long long *)((char *)a2 + 24);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_10000C11C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000C138(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_100008AE8();
  }
  __n128 result = (char *)sub_10000BF18((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

char *sub_10000C18C(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = sub_10000C200(result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_10000C1E4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000C200(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100008AE8();
  }
  __n128 result = (char *)sub_10000C080((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_10000C244(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_10000BCE8(v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

__n128 sub_10000C2C8(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_10000C548(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }
  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  long long v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 40) = 0;
  *(void *)(v8 + 48) = 0;
  *(void *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v8 + 56) = 0;
  *(void *)(v8 + 64) = 0;
  *(void *)(v8 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(void *)(v8 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(v8 + 85) = *(void *)(a2 + 85);
  *(void *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_10000C3CC(void *a1)
{
  unint64_t v2 = a1[5] + a1[4] - 1;
  sub_10000BCE8((void *)(*(void *)(a1[1] + 8 * (v2 / 0x2A)) + 96 * (v2 % 0x2A)));
  --a1[5];

  return sub_10000CD04(a1, 1);
}

int64x2_t sub_10000C454(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_10000CD7C((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x2A));
  uint64_t v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4032;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(void *)(v7 - 56) = 0;
  *(void *)(v7 - 48) = 0;
  *(void *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v7 - 40) = 0;
  *(void *)(v7 - 32) = 0;
  *(void *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_10001E3D0);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_10000C548(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)long long v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)sub_10000CCCC(v5, v33);
      BOOL v35 = &v34[8 * (v33 >> 2)];
      unint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        long long v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        char v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)char v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    long long v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0xFC0uLL);
      sub_10000C860(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0xFC0uLL);
    sub_10000C978((uint64_t)a1, &v54);
    char v44 = (void *)a1[1];
    long long v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)sub_10000CCCC((uint64_t)(a1 + 3), v46);
      BOOL v35 = &v34[8 * (v46 >> 2)];
      unint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      long long v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        long long v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        long long v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)long long v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      unint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        long long v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  __int16 v56 = a1 + 3;
  *(void *)&long long v54 = sub_10000CCCC((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0xFC0uLL);
  sub_10000CA98(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_10000CBB0((uint64_t)&v54, v27);
  }
  uint64_t v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_10000C814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_10000C860(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_10000CCCC(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

void sub_10000C978(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_10000CCCC(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_10000CA98(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_10000CCCC(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_10000CBB0(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_10000CCCC(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void *sub_10000CCCC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100008BC8();
  }
  return operator new(8 * a2);
}

uint64_t sub_10000CD04(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 42 * ((v2 - v3) >> 3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A) {
    a2 = 1;
  }
  if (v5 < 0x54) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void sub_10000CD7C(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x2A)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    uint64_t v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      unint64_t v46 = a1 + 3;
      std::string __p = sub_10000CCCC(v7, v11);
      unint64_t v43 = (char *)__p;
      char v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      char v41 = operator new(0xFC0uLL);
      sub_10000CA98(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      uint64_t v14 = v44;
      if (v13 == a1[2])
      {
        unint64_t v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              uint64_t v24 = (char *)sub_10000CCCC((uint64_t)v46, v23);
              uint64_t v26 = v43;
              uint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                uint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                uint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)uint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              long long v31 = __p;
              std::string __p = v24;
              unint64_t v43 = &v24[8 * (v23 >> 2)];
              char v44 = v14;
              uint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                uint64_t v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                uint64_t v14 = v43;
              }
              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              uint64_t v14 = &v20[v21];
              unint64_t v43 = v22;
              char v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)uint64_t v14 = v32;
          uint64_t v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        unint64_t v33 = (char *)a1[1];
      }
      uint64_t v36 = *a1;
      unint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      std::string __p = v36;
      unint64_t v43 = v33;
      uint64_t v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      char v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        char v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        std::string __p = operator new(0xFC0uLL);
        sub_10000C860(a1, &__p);
        uint64_t v34 = a1[2];
        std::string __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        std::string __p = operator new(0xFC0uLL);
      }
      sub_10000C978((uint64_t)a1, &__p);
      if ((unsigned char *)a1[2] - (unsigned char *)a1[1] == 8) {
        uint64_t v35 = 21;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    std::string __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    sub_10000C978((uint64_t)a1, &__p);
  }
}

void sub_10000D04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000D098(void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  if (v3 == v2)
  {
    unint64_t v4 = a1 + 5;
    uint64_t v3 = (void **)a1[1];
  }
  else
  {
    unint64_t v4 = a1 + 5;
    unint64_t v5 = a1[4];
    uint64_t v6 = &v2[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v2[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_10000BCE8(v7);
        v7 += 96;
        if (v7 - (unsigned char *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      uint64_t v2 = (void **)a1[1];
      uint64_t v3 = (void **)a1[2];
    }
  }
  *unint64_t v4 = 0;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    uint64_t v13 = *v2++;
    operator delete(v13);
  }

  return sub_10000D1F4((uint64_t)a1);
}

uint64_t sub_10000D1F4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

char *sub_10000D244(void *a1, long long *a2, long long *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    uint64_t v19 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v19;
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      uint64_t v25 = result;
      if (a2 != a3)
      {
        uint64_t v26 = result;
        do
        {
          *(_OWORD *)uint64_t v26 = *v6;
          v26[16] = *((unsigned char *)v6 + 16);
          v25 += 24;
          uint64_t v6 = (long long *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      int64_t v18 = v25 - result;
      uint64_t v13 = result;
    }
    else
    {
      int64_t v21 = (long long *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)int64x2_t result = *v6;
          result[16] = *((unsigned char *)v6 + 16);
          uint64_t v6 = (long long *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      uint64_t v22 = v13;
      if (v21 != a3)
      {
        unint64_t v23 = v13;
        do
        {
          long long v24 = *v21;
          *((void *)v23 + 2) = *((void *)v21 + 2);
          *(_OWORD *)unint64_t v23 = v24;
          v23 += 24;
          int64_t v21 = (long long *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      int64_t v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_100008AE8();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    int64x2_t result = sub_10000C138(a1, v12);
    int64_t v15 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v15;
    uint64_t v16 = v15;
    if (v6 != a3)
    {
      uint64_t v16 = v13;
      do
      {
        long long v17 = *v6;
        *((void *)v16 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v16 = v17;
        v16 += 24;
        uint64_t v6 = (long long *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    int64_t v18 = v16 - v13;
  }
  *uint64_t v14 = &v13[v18];
  return result;
}

char *sub_10000D3FC(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    int64_t v18 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      uint64_t v26 = result;
      if (a2 != a3)
      {
        uint64_t v27 = result;
        do
        {
          uint64_t v28 = *v6;
          uint64_t v29 = v6[1];
          v6 += 2;
          *(void *)uint64_t v27 = v28;
          *((void *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      long long v17 = (char *)(v26 - result);
      unint64_t v12 = result;
    }
    else
    {
      unint64_t v20 = (long long *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          uint64_t v21 = *v6;
          uint64_t v22 = v6[1];
          v6 += 2;
          *(void *)int64x2_t result = v21;
          *((void *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      unint64_t v23 = v12;
      if (v20 != (long long *)a3)
      {
        long long v24 = v12;
        do
        {
          long long v25 = *v20++;
          *(_OWORD *)long long v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (long long *)a3);
      }
      long long v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60) {
      sub_100008AE8();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v11 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = sub_10000C200(a1, v11);
    uint64_t v14 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v14;
    int64_t v15 = v14;
    if (v6 != a3)
    {
      int64_t v15 = v12;
      do
      {
        long long v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)int64_t v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    long long v17 = (char *)(v15 - v12);
  }
  *uint64_t v13 = &v17[(void)v12];
  return result;
}

void sub_10000D54C(std::locale *a1, const char *a2, int a3)
{
  unint64_t v5 = sub_10000D5E4(a1);
  LODWORD(v5[3].__locale_) = a3;
  *(_OWORD *)((char *)&v5[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[5].__locale_ + 4) = 0u;
  HIDWORD(v5[7].__locale_) = 0;
  strlen(a2);
  sub_10000D644();
}

void sub_10000D5C4(_Unwind_Exception *a1)
{
  locale = (std::__shared_weak_count *)v1[6].__locale_;
  if (locale) {
    sub_10000A4F8(locale);
  }
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::locale *sub_10000D5E4(std::locale *a1)
{
  uint64_t v2 = std::locale::locale(a1);
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, &std::ctype<char>::id);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, &std::collate<char>::id);
  return a1;
}

void sub_10000D630(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_10000D644()
{
}

void sub_10000D804(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_10000D838()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_10000D87C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000D890(uint64_t a1, uint64_t a2)
{
  sub_10000DEE0(&v2, a2);
}

char *sub_10000D8D8(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = a2;
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = sub_10000E36C(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  if (v7 == a2) {
    operator new();
  }
  if (v7 != (unsigned __int8 *)a3)
  {
    if (*v7 == 124)
    {
      uint64_t v8 = v7 + 1;
      uint64_t v9 = v7 + 1;
      do
      {
        uint64_t v10 = v9;
        uint64_t v9 = sub_10000E36C(a1, (char *)v9, a3);
      }
      while (v9 != v10);
      if (v10 == v8) {
        operator new();
      }
      sub_10000E264();
    }
    return (char *)v7;
  }
  return a3;
}

unsigned __int8 *sub_10000DA38(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  unint64_t v4 = a3;
  if (*a2 == 94) {
    sub_10000EB70();
  }
  if (a2 != a3)
  {
    do
    {
      uint64_t v6 = v3;
      uint64_t v3 = sub_100014CA4(a1, v3, v4);
    }
    while (v3 != v6);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36) {
        sub_10000EBF4();
      }
      sub_100014C4C();
    }
  }
  return v4;
}

unsigned __int8 *sub_10000DAE8(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = sub_100015340(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
LABEL_8:
  }
    sub_100014C4C();
  if (v6 != (unsigned __int8 *)v3)
  {
    if (*v6 == 124)
    {
      if (sub_100015340(a1, (char *)v6 + 1, v3) != v6 + 1) {
        sub_10000E264();
      }
      goto LABEL_8;
    }
    return v6;
  }
  return (unsigned __int8 *)v3;
}

unsigned __int8 *sub_10000DB8C(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 == __s) {
    operator new();
  }
  sub_10000DA38(a1, __s, v7);
  if (v7 == a3) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    uint64_t v8 = (unsigned __int8 *)memchr(v10, 10, a3 - v10);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_10000DA38(a1, v10, v9);
      sub_10000E264();
    }
    operator new();
  }
  return a3;
}

char *sub_10000DCF4(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = (char *)memchr(__s, 10, a3 - __s);
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = a3;
  }
  if (v7 == __s) {
    operator new();
  }
  sub_10000DAE8(a1, __s, v7);
  if (v7 == a3) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v7 + 1;
  }
  if (v10 != a3)
  {
    uint64_t v8 = (char *)memchr(v10, 10, a3 - v10);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = a3;
    }
    if (v9 != v10)
    {
      sub_10000DAE8(a1, v10, v9);
      sub_10000E264();
    }
    operator new();
  }
  return a3;
}

void sub_10000DE5C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_10000DEA0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000DEB8()
{
}

void sub_10000DECC(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_10000DEE0(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_10000DF48(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_10001C64C(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000DF64(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete();
}

uint64_t sub_10000DF9C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t sub_10000DFCC(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_10000E010(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *sub_10000E060(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000E0CC(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_10000E158(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_10000E16C(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000E1D8(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

void sub_10000E264()
{
}

unsigned __int8 *sub_10000E36C(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)sub_10000E414(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = sub_10000E624(a1, (unsigned __int8 *)a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
    if (v7 != (unsigned __int8 *)a2)
    {
      return sub_10000E86C(a1, v7, (unsigned __int8 *)a3);
    }
  }
  return result;
}

char *sub_10000E414(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v6 = *a2;
    if (v6 > 91)
    {
      if (v6 == 92)
      {
        if (a2 + 1 != a3)
        {
          int v13 = a2[1];
          if (v13 == 66 || v13 == 98) {
            sub_10000EC78();
          }
        }
      }
      else if (v6 == 94)
      {
        sub_10000EB70();
      }
    }
    else
    {
      if (v6 == 36) {
        sub_10000EBF4();
      }
      BOOL v8 = v6 == 40;
      uint64_t v7 = a2 + 1;
      BOOL v8 = !v8 || v7 == a3;
      if (!v8)
      {
        BOOL v8 = *v7 == 63;
        uint64_t v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          int v11 = *v9;
          if (v11 == 33)
          {
            sub_10000D5E4(v14);
            long long v15 = 0u;
            uint64_t v17 = 0;
            long long v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_10000D644(v14, a2 + 3, a3);
            sub_10000ED0C();
          }
          if (v11 == 61)
          {
            sub_10000D5E4(v14);
            long long v15 = 0u;
            uint64_t v17 = 0;
            long long v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_10000D644(v14, a2 + 3, a3);
            sub_10000ED0C();
          }
        }
      }
    }
  }
  return a2;
}

void sub_10000E604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

unsigned __int8 *sub_10000E624(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == (unsigned __int8 *)a3) {
    return v3;
  }
  int v6 = (char)*a2;
  if (v6 <= 62)
  {
    if (v6 != 40)
    {
      if (v6 == 46) {
        operator new();
      }
      if ((v6 - 42) >= 2) {
        goto LABEL_28;
      }
LABEL_34:
      sub_10000F92C();
    }
    if (a2 + 1 != (unsigned __int8 *)a3)
    {
      if (a2 + 2 != (unsigned __int8 *)a3 && a2[1] == 63 && a2[2] == 58)
      {
        BOOL v8 = (_DWORD *)(a1 + 36);
        ++*(_DWORD *)(a1 + 36);
        uint64_t v9 = (char *)sub_10000D8D8(a1, a2 + 3, a3);
        if (v9 == a3) {
          goto LABEL_35;
        }
        uint64_t v10 = v9;
        if (*v9 != 41) {
          goto LABEL_35;
        }
        goto LABEL_25;
      }
      sub_10000F82C(a1);
      BOOL v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      int v11 = (char *)sub_10000D8D8(a1, v3 + 1, a3);
      if (v11 != a3)
      {
        uint64_t v10 = v11;
        if (*v11 == 41)
        {
          sub_10000F8B0(a1);
LABEL_25:
          --*v8;
          return (unsigned __int8 *)(v10 + 1);
        }
      }
    }
LABEL_35:
    sub_10000EDB4();
  }
  if (v6 <= 91)
  {
    if (v6 == 91)
    {
      return sub_10000F718(a1, a2, a3);
    }
    if (v6 == 63) {
      goto LABEL_34;
    }
LABEL_28:
    return sub_10000F984(a1, a2, a3);
  }
  if (v6 != 92)
  {
    if (v6 == 123) {
      goto LABEL_34;
    }
    goto LABEL_28;
  }

  return sub_10000F674(a1, a2, (unsigned __int8 *)a3);
}

unsigned __int8 *sub_10000E86C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v5 = (char)*a2;
  if (v5 <= 62)
  {
    if (v5 == 42 || v5 == 43) {
LABEL_18:
    }
      sub_100014644();
    return a2;
  }
  if (v5 == 63) {
    goto LABEL_18;
  }
  if (v5 == 123)
  {
    int v6 = a2 + 1;
    uint64_t v7 = sub_1000147D4(a1, a2 + 1, a3, &v13);
    if (v7 == v6) {
      goto LABEL_23;
    }
    if (v7 != a3)
    {
      int v8 = (char)*v7;
      if (v8 != 44)
      {
        if (v8 == 125) {
          goto LABEL_18;
        }
LABEL_23:
        sub_100014874();
      }
      uint64_t v9 = v7 + 1;
      if (v7 + 1 == a3) {
        goto LABEL_23;
      }
      if (*v9 == 125) {
        goto LABEL_18;
      }
      int v12 = -1;
      int v11 = sub_1000147D4(a1, v9, a3, &v12);
      if (v11 != v9 && v11 != a3 && *v11 == 125)
      {
        if (v12 >= v13) {
          goto LABEL_18;
        }
        goto LABEL_23;
      }
    }
    sub_1000148CC();
  }
  return a2;
}

void sub_10000EB70()
{
}

void sub_10000EBF4()
{
}

void sub_10000EC78()
{
}

void sub_10000ED0C()
{
}

void sub_10000ED90()
{
}

void sub_10000EDB4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_10000EDF8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_10000EE0C(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000EE78(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_10000EF04(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(unsigned char *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }
  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 80) = v4;
  return result;
}

void *sub_10000EF64(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000EFD0(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_10000F05C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((int v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }
  else
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_10000F0AC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025050;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10000F138(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025050;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_10000F1E4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  int v11 = v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0;
    int v13 = -993;
  }
  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_10000F2F8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = off_100025098;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 40);
  *(void *)(a1 + 64) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 72) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(unsigned char *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_10000F388(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025098;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_10000A4F8(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }
  return a1;
}

void sub_10000F428(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025098;
  uint64_t v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale) {
    sub_10000A4F8(locale);
  }
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  BOOL v4 = a1[1].__locale_;
  if (v4) {
    (*(void (**)(std::locale::__imp *))(*(void *)v4 + 8))(v4);
  }

  operator delete();
}

void sub_10000F4E8(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  char v25 = 0;
  long long v26 = 0uLL;
  char v27 = 0;
  char v28 = 0;
  uint64_t v29 = 0;
  std::string __p = 0;
  unint64_t v19 = 0;
  unint64_t v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v20 = 0;
  *(void *)&long long v21 = v5;
  *((void *)&v21 + 1) = v5;
  char v22 = 0;
  sub_10000A7DC((char **)&__p, v4, &v21);
  uint64_t v23 = v6;
  uint64_t v24 = v6;
  char v25 = 0;
  long long v26 = v21;
  char v27 = v22;
  uint64_t v29 = v6;
  char v28 = 1;
  uint64_t v7 = *(void *)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v8 = v7 == *(void *)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_10000A954(a1 + 16, v7, *(void *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    int v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  int v10 = (char *)__p;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (unsigned char *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10) {
      return;
    }
    goto LABEL_14;
  }
  int v12 = 0;
  int v13 = *(_DWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 32);
  unint64_t v15 = 1;
  do
  {
    long long v16 = &v10[24 * v15];
    uint64_t v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v16;
    *(unsigned char *)(v17 + 16) = v16[16];
    unint64_t v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  unint64_t v19 = v10;
  operator delete(v10);
}

void sub_10000F654(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_10000F674(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_10000FAF0();
  }
  uint64_t result = sub_10000FB48(a1, a2 + 1, a3);
  if (result == v5)
  {
    uint64_t result = (unsigned __int8 *)sub_10000FC08(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      uint64_t result = sub_10000FCD8(a1, a2 + 1, a3, 0);
      if (result == v5) {
        return a2;
      }
    }
  }
  return result;
}

unsigned char *sub_10000F718(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3) {
      sub_100010EDC();
    }
    sub_10001226C();
  }
  return a2;
}

uint64_t sub_10000F82C(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

uint64_t sub_10000F8B0(uint64_t result)
{
  if ((*(unsigned char *)(result + 24) & 2) == 0) {
    operator new();
  }
  return result;
}

void sub_10000F92C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_10000F970(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned char *sub_10000F984(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3)
  {
    int v3 = (char)*a2;
    BOOL v4 = (v3 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v4 && (v3 - 123) >= 3) {
      sub_1000100E4(a1);
    }
  }
  return a2;
}

void *sub_10000F9F8(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_10000FA64(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

void sub_10000FAF0()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_10000FB34(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000FB48(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    unsigned int v5 = v4 - 48;
    if (v4 == 48) {
      sub_1000100E4(a1);
    }
    if ((v4 - 49) <= 8)
    {
      uint64_t v6 = a2 + 1;
      if (a2 + 1 == a3) {
        goto LABEL_12;
      }
      do
      {
        int v7 = *v6;
        if ((v7 - 48) > 9) {
          break;
        }
        if (v5 >= 0x19999999) {
          goto LABEL_14;
        }
        ++v6;
        unsigned int v5 = v7 + 10 * v5 - 48;
      }
      while (v6 != a3);
      if (v5)
      {
LABEL_12:
        if (v5 <= *(_DWORD *)(a1 + 28)) {
          sub_10001027C(a1);
        }
      }
LABEL_14:
      sub_100010224();
    }
  }
  return a2;
}

char *sub_10000FC08(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v3 = *a2;
  if (v3 > 99)
  {
    if (v3 == 119) {
      goto LABEL_12;
    }
    if (v3 == 115) {
LABEL_13:
    }
      sub_100010EDC();
    if (v3 != 100) {
      return a2;
    }
LABEL_10:
    sub_100010EDC();
  }
  switch(v3)
  {
    case 'D':
      goto LABEL_10;
    case 'S':
      goto LABEL_13;
    case 'W':
LABEL_12:
      sub_100010EDC();
  }
  return a2;
}

unsigned __int8 *sub_10000FCD8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  int v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  uint64_t v5 = *a2;
  if ((char)v5 > 109)
  {
    char v6 = 0;
    switch((char)v5)
    {
      case 'n':
        if (!a4) {
          goto LABEL_62;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 10;
        goto LABEL_74;
      case 'r':
        if (!a4) {
          goto LABEL_62;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 13;
        goto LABEL_74;
      case 't':
        if (!a4) {
          goto LABEL_62;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 9;
        goto LABEL_74;
      case 'u':
        if (a2 + 1 == a3) {
          goto LABEL_83;
        }
        int v7 = a2[1];
        if ((v7 & 0xF8) != 0x30 && (v7 & 0xFE) != 0x38 && (v7 | 0x20u) - 97 >= 6) {
          goto LABEL_83;
        }
        int v4 = a2 + 2;
        if (a2 + 2 == a3) {
          goto LABEL_83;
        }
        int v8 = *v4;
        char v9 = -48;
        if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38) {
          goto LABEL_28;
        }
        v8 |= 0x20u;
        if ((v8 - 97) >= 6) {
          goto LABEL_83;
        }
        char v9 = -87;
LABEL_28:
        char v6 = 16 * (v9 + v8);
LABEL_29:
        if (v4 + 1 == a3) {
          goto LABEL_83;
        }
        int v10 = v4[1];
        char v11 = -48;
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
          goto LABEL_34;
        }
        v10 |= 0x20u;
        if ((v10 - 97) >= 6) {
          goto LABEL_83;
        }
        char v11 = -87;
LABEL_34:
        if (v4 + 2 == a3) {
          goto LABEL_83;
        }
        int v12 = v4[2];
        char v13 = -48;
        if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
          goto LABEL_39;
        }
        v12 |= 0x20u;
        if ((v12 - 97) >= 6) {
          goto LABEL_83;
        }
        char v13 = -87;
LABEL_39:
        char v14 = v13 + v12 + 16 * (v11 + v10 + v6);
        if (!a4) {
          sub_1000100E4(a1);
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v14;
        *((unsigned char *)a4 + 1) = 0;
        v4 += 3;
        break;
      case 'v':
        if (!a4) {
          goto LABEL_62;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 11;
        goto LABEL_74;
      case 'x':
        goto LABEL_29;
      default:
        goto LABEL_53;
    }
    return v4;
  }
  if ((char)v5 == 48)
  {
    if (!a4) {
      goto LABEL_62;
    }
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((unsigned char *)a4 + 23) = 1;
    }
    *(_WORD *)a4 = 0;
    return a2 + 1;
  }
  if ((char)v5 != 99)
  {
    if ((char)v5 == 102)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v16 = 12;
LABEL_74:
        *(_WORD *)a4 = v16;
        return a2 + 1;
      }
LABEL_62:
      sub_1000100E4(a1);
    }
LABEL_53:
    if ((char)v5 != 95
      && ((char)v5 < 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16) + 4 * v5) & 0x500) == 0))
    {
      if (!a4) {
        goto LABEL_62;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_83:
    sub_10000FAF0();
  }
  if (a2 + 1 == a3) {
    goto LABEL_83;
  }
  unsigned __int8 v15 = a2[1];
  if (((v15 & 0xDF) - 65) > 0x19u) {
    goto LABEL_83;
  }
  if (!a4) {
    sub_1000100E4(a1);
  }
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((unsigned char *)a4 + 23) = 1;
  }
  *(unsigned char *)a4 = v15 & 0x1F;
  *((unsigned char *)a4 + 1) = 0;
  return a2 + 2;
}

void sub_1000100E4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

void sub_100010200()
{
}

void sub_100010224()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_100010268(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10001027C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

uint64_t sub_1000103AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = off_100025128;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 40) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3);
  return a1;
}

void sub_100010440(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  *int v1 = off_100024F90;
  uint64_t v4 = v1[1];
  if (v4) {
    sub_10001C64C(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_100010480(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025128;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_10001050C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025128;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_1000105B8(uint64_t result, uint64_t a2)
{
  int v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_10001064C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025170;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_1000106D8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025170;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_100010784(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void *sub_1000107CC(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100010838(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_1000108C4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_10001090C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025200;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100010998(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025200;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_100010A44(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)v3 + v8));
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_100010B5C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025248;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

void sub_100010BE8(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_100025248;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  operator delete();
}

uint64_t sub_100010C94(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v3 + 24 * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }
      int v9 = *(unsigned __int8 **)(a2 + 16);
      uint64_t v10 = v6;
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v9++;
        if (v11 != v13) {
          break;
        }
        if (!--v10) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 80) = v8;
  return result;
}

void *sub_100010D24(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100010D90(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

unsigned int *sub_100010E1C(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_100010224();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v10;
  return result;
}

void sub_100010EDC()
{
}

void sub_100010F54()
{
}

void sub_100010F78(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = (unint64_t *)(a1 + 40);
      unint64_t v7 = *(void *)(a1 + 40);
      int64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          int v12 = operator new(v11);
        }
        else {
          int v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        long long v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          char v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          unsigned int v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100008AE8();
    }
    goto LABEL_22;
  }
  uint64_t v6 = (unint64_t *)(a1 + 40);
  unsigned int v5 = *(unsigned char **)(a1 + 48);
  unint64_t v13 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      char v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        long long v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          long long v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *unsigned int v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  unsigned __int8 v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    int v12 = operator new(v18);
  }
  else {
    int v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  long long v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v19;
}

uint64_t sub_1000111C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)a1 = off_1000252D8;
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(unsigned char *)(a1 + 168) = a4;
  *(unsigned char *)(a1 + 169) = a5;
  *(unsigned char *)(a1 + 170) = a6;
  std::locale::locale(&v16, v11);
  std::locale::name(&v17, &v16);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size == 1)
  {
    unint64_t v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
    if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      unint64_t v13 = &v17;
    }
    BOOL v14 = v13->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = 1;
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
LABEL_9:
    }
      operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v16);
  *(unsigned char *)(a1 + 171) = v14;
  return a1;
}

void sub_10001130C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_100011BB0((void ***)&a10);
  unsigned __int8 v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  sub_100011C54((void ***)&a10);
  std::locale v16 = (void *)v10[8];
  if (v16)
  {
    v10[9] = v16;
    operator delete(v16);
  }
  std::string v17 = *v13;
  if (*v13)
  {
    v10[6] = v17;
    operator delete(v17);
  }
  std::locale::~locale(v12);
  *unint64_t v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  _Unwind_Resume(a1);
}

void sub_1000113A8(std::locale *a1)
{
  sub_100011D74(a1);

  operator delete();
}

void sub_1000113E0(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(signed __int8 **)(a2 + 16);
  unsigned int v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    uint64_t v18 = 0;
    int v16 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_155;
  }
  if (!*(unsigned char *)(a1 + 171) || v4 + 1 == v5) {
    goto LABEL_27;
  }
  signed __int8 v6 = *v4;
  unsigned __int8 v86 = *v4;
  signed __int8 v7 = v4[1];
  unsigned __int8 v87 = v7;
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v86 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v6);
    unsigned __int8 v87 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v7);
  }
  sub_100011F4C(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  if ((v85 & 0x80000000) == 0)
  {
    if (v85) {
      goto LABEL_8;
    }
LABEL_27:
    int v16 = 0;
    uint64_t v18 = 1;
    goto LABEL_28;
  }
  size_t v19 = v84;
  operator delete(__p);
  if (!v19) {
    goto LABEL_27;
  }
LABEL_8:
  uint64_t v8 = *(void *)(a1 + 112);
  uint64_t v9 = *(void *)(a1 + 120) - v8;
  if (v9)
  {
    uint64_t v10 = v9 >> 1;
    if ((unint64_t)(v9 >> 1) <= 1) {
      uint64_t v10 = 1;
    }
    uint64_t v11 = (unsigned char *)(v8 + 1);
    do
    {
      if (v86 == *(v11 - 1) && v87 == *v11) {
        goto LABEL_152;
      }
      v11 += 2;
      --v10;
    }
    while (v10);
  }
  if (!*(unsigned char *)(a1 + 170) || *(void *)(a1 + 88) == *(void *)(a1 + 96))
  {
    int v16 = 0;
  }
  else
  {
    sub_100011E5C(a1 + 16, (char *)&v86, (char *)&v88);
    uint64_t v13 = *(void *)(a1 + 88);
    if (*(void *)(a1 + 96) == v13)
    {
LABEL_24:
      int v16 = 0;
      int v17 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      while ((int)(sub_100011F14((void *)(v13 + v14), &__p) << 24) > 0xFFFFFF
           || (int)(sub_100011F14(&__p, (void **)(*(void *)(a1 + 88) + v14 + 24)) << 24) >= 0x1000000)
      {
        ++v15;
        uint64_t v13 = *(void *)(a1 + 88);
        v14 += 48;
        if (v15 >= 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 96) - v13) >> 4)) {
          goto LABEL_24;
        }
      }
      int v16 = 1;
      int v17 = 5;
    }
    if (v85 < 0) {
      operator delete(__p);
    }
    if (v16) {
      goto LABEL_129;
    }
  }
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_134;
  }
  sub_10001215C(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  uint64_t v54 = *(void *)(a1 + 136);
  uint64_t v55 = v85;
  uint64_t v56 = *(void *)(a1 + 144) - v54;
  if (v56)
  {
    uint64_t v57 = 0;
    unint64_t v58 = v56 / 24;
    __int16 v60 = __p;
    size_t v59 = v84;
    if (v85 >= 0) {
      size_t v61 = v85;
    }
    else {
      size_t v61 = v84;
    }
    if (v58 <= 1) {
      uint64_t v62 = 1;
    }
    else {
      uint64_t v62 = v56 / 24;
    }
    BOOL v63 = 1;
    while (1)
    {
      __int16 v64 = (unsigned __int8 **)(v54 + 24 * v57);
      unint64_t v65 = (unsigned __int8 *)*((unsigned __int8 *)v64 + 23);
      int v66 = (char)v65;
      if ((char)v65 < 0) {
        unint64_t v65 = v64[1];
      }
      if ((unsigned __int8 *)v61 == v65)
      {
        if (v66 >= 0) {
          v67 = (unsigned __int8 *)(v54 + 24 * v57);
        }
        else {
          v67 = *v64;
        }
        if ((v55 & 0x80) == 0)
        {
          if (v55)
          {
            p_p = &__p;
            uint64_t v69 = v55;
            do
            {
              if (*(unsigned __int8 *)p_p != *v67) {
                goto LABEL_122;
              }
              p_p = (void **)((char *)p_p + 1);
              ++v67;
              --v69;
            }
            while (v69);
            int v16 = 1;
            int v17 = 5;
            goto LABEL_126;
          }
          int v16 = 1;
          if (v63) {
            goto LABEL_154;
          }
LABEL_134:
          if ((char)v86 < 0)
          {
            int v74 = *(_DWORD *)(a1 + 164);
            goto LABEL_147;
          }
          int v71 = *(_DWORD *)(a1 + 160);
          uint64_t v72 = *(void *)(*(void *)(a1 + 24) + 16);
          int v73 = *(_DWORD *)(v72 + 4 * v86);
          if ((v73 & v71) == 0 && (v86 != 95 || (v71 & 0x80) == 0)
            || (char)v87 < 0
            || (*(_DWORD *)(v72 + 4 * v87) & v71) == 0 && ((v71 & 0x80) == 0 || v87 != 95))
          {
            int v74 = *(_DWORD *)(a1 + 164);
            if ((v73 & v74) != 0 || v86 == 95 && (v74 & 0x80) != 0)
            {
LABEL_151:
              int v75 = v16;
              goto LABEL_153;
            }
LABEL_147:
            if (((char)v87 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v87) & v74) != 0) {
                goto LABEL_151;
              }
              int v75 = 1;
              if (v87 == 95 && (v74 & 0x80) != 0) {
                goto LABEL_151;
              }
LABEL_153:
              int v16 = v75;
LABEL_154:
              uint64_t v18 = 2;
              goto LABEL_155;
            }
          }
LABEL_152:
          int v75 = 1;
          goto LABEL_153;
        }
        unint64_t v80 = v58;
        uint64_t v82 = v55;
        int v70 = memcmp(v60, v67, v59);
        unint64_t v58 = v80;
        uint64_t v55 = v82;
        if (!v70) {
          break;
        }
      }
LABEL_122:
      BOOL v63 = ++v57 < v58;
      if (v57 == v62) {
        goto LABEL_125;
      }
    }
    int v17 = 5;
    int v16 = 1;
    goto LABEL_127;
  }
  BOOL v63 = 0;
LABEL_125:
  int v17 = 0;
LABEL_126:
  if ((v55 & 0x80) != 0) {
LABEL_127:
  }
    operator delete(__p);
  if (!v63) {
    goto LABEL_134;
  }
LABEL_129:
  if (v17) {
    goto LABEL_154;
  }
  uint64_t v18 = 2;
LABEL_28:
  unsigned __int8 v20 = **(unsigned char **)(a2 + 16);
  unsigned __int8 v86 = v20;
  if (*(unsigned char *)(a1 + 169))
  {
    unsigned __int8 v20 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), (char)v20);
    unsigned __int8 v86 = v20;
  }
  long long v21 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v22 = *(void *)(a1 + 48) - (void)v21;
  if (v22)
  {
    if (v22 <= 1) {
      unint64_t v22 = 1;
    }
    while (1)
    {
      int v23 = *v21++;
      if (v23 == v20) {
        break;
      }
      if (!--v22) {
        goto LABEL_35;
      }
    }
LABEL_46:
    int v16 = 1;
    goto LABEL_155;
  }
LABEL_35:
  unsigned int v24 = *(_DWORD *)(a1 + 164);
  if (v24 || *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    if ((v20 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v20) & v24) == 0) {
      int v25 = (v20 == 95) & (v24 >> 7);
    }
    else {
      LOBYTE(v25) = 1;
    }
    unint64_t v26 = *(void **)(a1 + 72);
    unint64_t v27 = memchr(*(void **)(a1 + 64), (char)v20, (size_t)v26 - *(void *)(a1 + 64));
    size_t v28 = v27 ? v27 : v26;
    if ((v25 & 1) == 0 && v28 == v26) {
      goto LABEL_46;
    }
  }
  uint64_t v29 = *(void *)(a1 + 88);
  uint64_t v30 = *(void *)(a1 + 96);
  if (v29 != v30)
  {
    if (*(unsigned char *)(a1 + 170))
    {
      sub_100011E5C(a1 + 16, (char *)&v86, (char *)&v87);
      uint64_t v29 = *(void *)(a1 + 88);
      uint64_t v30 = *(void *)(a1 + 96);
    }
    else
    {
      char v85 = 1;
      LOWORD(__p) = v20;
    }
    if (v30 == v29)
    {
LABEL_57:
      char v33 = 0;
    }
    else
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      while ((int)(sub_100011F14((void *)(v29 + v31), &__p) << 24) > 0xFFFFFF
           || (int)(sub_100011F14(&__p, (void **)(*(void *)(a1 + 88) + v31 + 24)) << 24) >= 0x1000000)
      {
        ++v32;
        uint64_t v29 = *(void *)(a1 + 88);
        v31 += 48;
        if (v32 >= 0xAAAAAAAAAAAAAAABLL * ((*(void *)(a1 + 96) - v29) >> 4)) {
          goto LABEL_57;
        }
      }
      char v33 = 1;
      int v16 = 1;
    }
    if (v85 < 0) {
      operator delete(__p);
    }
    if (v33) {
      goto LABEL_155;
    }
  }
  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_90;
  }
  sub_10001215C(a1 + 16, (char *)&v86, (char *)&v87, (uint64_t)&__p);
  uint64_t v34 = *(void *)(a1 + 136);
  uint64_t v35 = v85;
  uint64_t v36 = *(void *)(a1 + 144) - v34;
  if (v36)
  {
    uint64_t v81 = v18;
    uint64_t v37 = 0;
    unint64_t v38 = v36 / 24;
    uint64_t v39 = __p;
    size_t v40 = v84;
    if (v85 >= 0) {
      size_t v41 = v85;
    }
    else {
      size_t v41 = v84;
    }
    if (v38 <= 1) {
      uint64_t v42 = 1;
    }
    else {
      uint64_t v42 = v36 / 24;
    }
    BOOL v43 = 1;
    while (1)
    {
      char v44 = (unsigned __int8 **)(v34 + 24 * v37);
      uint64_t v45 = (unsigned __int8 *)*((unsigned __int8 *)v44 + 23);
      int v46 = (char)v45;
      if ((char)v45 < 0) {
        uint64_t v45 = v44[1];
      }
      if ((unsigned __int8 *)v41 == v45)
      {
        if (v46 >= 0) {
          uint64_t v47 = (unsigned __int8 *)(v34 + 24 * v37);
        }
        else {
          uint64_t v47 = *v44;
        }
        if ((v35 & 0x80) != 0)
        {
          int v79 = v16;
          size_t v50 = v41;
          uint64_t v78 = v34;
          int v51 = memcmp(v39, v47, v40);
          uint64_t v34 = v78;
          size_t v41 = v50;
          int v16 = v79;
          if (!v51)
          {
            int v16 = 1;
            uint64_t v18 = v81;
            goto LABEL_88;
          }
        }
        else
        {
          if (!v35)
          {
            int v16 = 1;
            uint64_t v18 = v81;
            if (!v43) {
              goto LABEL_90;
            }
            goto LABEL_155;
          }
          uint64_t v48 = &__p;
          uint64_t v49 = v35;
          while (*(unsigned __int8 *)v48 == *v47)
          {
            uint64_t v48 = (void **)((char *)v48 + 1);
            ++v47;
            if (!--v49)
            {
              int v16 = 1;
              goto LABEL_85;
            }
          }
        }
      }
      BOOL v43 = ++v37 < v38;
      if (v37 == v42)
      {
LABEL_85:
        uint64_t v18 = v81;
        if ((v35 & 0x80) == 0) {
          goto LABEL_89;
        }
        goto LABEL_88;
      }
    }
  }
  BOOL v43 = 0;
  if (v85 < 0) {
LABEL_88:
  }
    operator delete(__p);
LABEL_89:
  if (!v43)
  {
LABEL_90:
    if ((char)v86 < 0) {
      goto LABEL_155;
    }
    unsigned int v52 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16) + 4 * v86) & v52) == 0)
    {
      int v53 = (v52 >> 7) & 1;
      if (v86 != 95) {
        int v53 = 0;
      }
      if (v53 != 1) {
        goto LABEL_155;
      }
    }
    goto LABEL_46;
  }
LABEL_155:
  if (v16 == *(unsigned __int8 *)(a1 + 168))
  {
    uint64_t v76 = 0;
    int v77 = -993;
  }
  else
  {
    *(void *)(a2 + 16) += v18;
    uint64_t v76 = *(void *)(a1 + 8);
    int v77 = -995;
  }
  *(_DWORD *)a2 = v77;
  *(void *)(a2 + 80) = v76;
}

void sub_100011BB0(void ***a1)
{
  char v2 = *a1;
  if (*v2)
  {
    sub_100011C04((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_100011C04(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void sub_100011C54(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_100011CD8(v4);
      }
      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_100011CD8(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t sub_100011D30(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

std::locale *sub_100011D74(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)off_1000252D8;
  signed __int8 v7 = a1 + 17;
  sub_100011BB0((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  signed __int8 v7 = a1 + 11;
  sub_100011C54((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  uint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100024F90;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

void sub_100011E5C(uint64_t a1, char *a2, char *a3)
{
  sub_100009E84(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unsigned int v5 = __p;
  }
  else {
    unsigned int v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100011EF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100011F14(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    unsigned int v5 = a2;
  }
  else {
    unsigned int v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return sub_1000120FC(a1, v2, v5, v6);
}

void sub_100011F4C(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100009E84(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_1000120C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000120FC(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

void sub_10001215C(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100009E84(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    size_t v7 = __p;
  }
  else {
    size_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a4;
      }
      else {
        uint64_t v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_100012250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001226C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_1000122B0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_1000122C4(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  int v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  unsigned int v9 = 0;
  uint64_t v10 = 0;
  long long v31 = 0uLL;
  uint64_t v32 = 0;
  if (a2 + 1 != a3 && v5 == 91)
  {
    int v11 = a2[1];
    switch(v11)
    {
      case '.':
        int v4 = (char *)sub_100012934(a1, a2 + 2, a3, (uint64_t)&v31);
        unsigned int v9 = HIBYTE(v32);
        uint64_t v10 = *((void *)&v31 + 1);
        break;
      case ':':
        uint64_t v12 = sub_100012878(a1, a2 + 2, a3, (uint64_t)a4);
        goto LABEL_11;
      case '=':
        uint64_t v12 = sub_100012698(a1, a2 + 2, a3, a4);
LABEL_11:
        uint64_t v6 = v12;
        char v13 = 0;
        goto LABEL_44;
      default:
        uint64_t v10 = 0;
        unsigned int v9 = 0;
        break;
    }
  }
  int v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if ((v9 & 0x80u) == 0) {
    uint64_t v10 = v9;
  }
  if (v10)
  {
    unint64_t v15 = v4;
    goto LABEL_28;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
  {
    int v16 = *v4;
    if (v16 == 92)
    {
      uint64_t v17 = v4 + 1;
      if (v14) {
        uint64_t v18 = sub_100012B9C(a1, v17, a3, (uint64_t *)&v31);
      }
      else {
        uint64_t v18 = (char *)sub_100012A24(a1, (unsigned __int8 *)v17, (unsigned __int8 *)a3, (uint64_t)&v31, v6);
      }
      unint64_t v15 = v18;
      goto LABEL_28;
    }
  }
  else
  {
    LOBYTE(v16) = *v4;
  }
  if ((v9 & 0x80) != 0)
  {
    size_t v19 = (long long *)v31;
    *((void *)&v31 + 1) = 1;
  }
  else
  {
    HIBYTE(v32) = 1;
    size_t v19 = &v31;
  }
  *(unsigned char *)size_t v19 = v16;
  *((unsigned char *)v19 + 1) = 0;
  unint64_t v15 = v4 + 1;
LABEL_28:
  if (v15 == a3
    || (int v20 = *v15, v20 == 93)
    || (long long v21 = v15 + 1, v15 + 1 == a3)
    || v20 != 45
    || *v21 == 93)
  {
    if (SHIBYTE(v32) < 0)
    {
      if (*((void *)&v31 + 1))
      {
        if (*((void *)&v31 + 1) != 1)
        {
          unint64_t v22 = (char *)v31;
LABEL_42:
          sub_1000132E0(v6, *v22, v22[1]);
          goto LABEL_43;
        }
        unint64_t v22 = (char *)v31;
        goto LABEL_40;
      }
    }
    else if (HIBYTE(v32))
    {
      unint64_t v22 = (char *)&v31;
      if (HIBYTE(v32) != 1) {
        goto LABEL_42;
      }
LABEL_40:
      sub_100010F78(v6, *v22);
    }
LABEL_43:
    char v13 = 1;
    int v4 = v15;
    goto LABEL_44;
  }
  v29[0] = 0;
  v29[1] = 0;
  uint64_t v30 = 0;
  int v4 = v15 + 2;
  if (v15 + 2 != a3 && *v21 == 91 && *v4 == 46)
  {
    uint64_t v24 = sub_100012934(a1, v15 + 3, a3, (uint64_t)v29);
LABEL_60:
    int v4 = (char *)v24;
    goto LABEL_61;
  }
  if ((v14 | 0x40) == 0x40)
  {
    LODWORD(v21) = *v21;
    if (v21 == 92)
    {
      if (v14) {
        uint64_t v24 = (uint64_t)sub_100012B9C(a1, v15 + 2, a3, (uint64_t *)v29);
      }
      else {
        uint64_t v24 = (uint64_t)sub_100012A24(a1, (unsigned __int8 *)v15 + 2, (unsigned __int8 *)a3, (uint64_t)v29, v6);
      }
      goto LABEL_60;
    }
  }
  else
  {
    LOBYTE(v21) = *v21;
  }
  HIBYTE(v30) = 1;
  LOWORD(v29[0]) = v21;
LABEL_61:
  *(_OWORD *)unint64_t v27 = v31;
  uint64_t v28 = v32;
  uint64_t v32 = 0;
  long long v31 = 0uLL;
  *(_OWORD *)std::string __p = *(_OWORD *)v29;
  uint64_t v26 = v30;
  v29[0] = 0;
  v29[1] = 0;
  uint64_t v30 = 0;
  sub_100012EB8(v6, (char *)v27, (char *)__p);
  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
  char v13 = 1;
LABEL_44:
  if (SHIBYTE(v32) < 0) {
    operator delete((void *)v31);
  }
  if (v13) {
    return v4;
  }
  return (char *)v6;
}

void sub_100012638(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 49) < 0) {
    operator delete(*(void **)(v28 - 72));
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100012698(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  for (uint64_t i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_33;
    }
  }
  if (&a2[i] == a3) {
LABEL_33:
  }
    sub_10001226C();
  sub_1000135D8(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    uint64_t v8 = v19;
    if (v19)
    {
      unsigned int v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    sub_10001353C();
  }
  uint64_t v8 = v18;
  if (!v18) {
    goto LABEL_34;
  }
  unsigned int v9 = (char *)v17;
LABEL_14:
  sub_100013788(a1, v9, &v9[v8], (uint64_t)__p);
  unint64_t v10 = v16;
  if ((v16 & 0x80u) != 0) {
    unint64_t v10 = (unint64_t)__p[1];
  }
  if (v10)
  {
    sub_100013594(a4, (long long *)__p);
  }
  else
  {
    uint64_t v11 = v19;
    if ((v19 & 0x80u) != 0) {
      uint64_t v11 = v18;
    }
    if (v11 == 2)
    {
      char v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        char v13 = (char *)v17;
      }
      sub_1000132E0((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1) {
        sub_10001353C();
      }
      uint64_t v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0) {
        uint64_t v12 = (char *)v17;
      }
      sub_100010F78((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0) {
    operator delete(__p[0]);
  }
  if ((char)v19 < 0) {
    operator delete(v17);
  }
  return (uint64_t)&a2[i + 2];
}

void sub_100012840(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100012878(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  for (uint64_t i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_11;
    }
  }
  if (&a2[i] == a3) {
LABEL_11:
  }
    sub_10001226C();
  int v7 = sub_100013D3C(a1, a2, &a2[i], *(unsigned char *)(a1 + 24) & 1);
  if (!v7) {
    sub_100013CE4();
  }
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_100012934(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }
  if (&a2[i] == a3) {
LABEL_15:
  }
    sub_10001226C();
  sub_1000135D8(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v10;
  unint64_t v7 = v11;
  *(void *)(a4 + 16) = v11;
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    sub_10001353C();
  }
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_100012A24(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    sub_10000FAF0();
  }
  int v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          goto LABEL_25;
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_100010F78(a5, 95);
        return a2 + 1;
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v6 != 100) {
        goto LABEL_25;
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v6 == 68)
    {
      int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_22:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    }
    goto LABEL_25;
  }
  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_22;
  }
  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_100013E10(a5, 95);
    return a2 + 1;
  }
LABEL_25:

  return sub_10000FCD8(a1, a2, a3, (uint64_t *)a4);
}

char *sub_100012B9C(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_78:
  }
    sub_10000FAF0();
  int v4 = *a2;
  char v5 = *a2;
  if (v4 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 10;
        goto LABEL_75;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 13;
        goto LABEL_75;
      case 't':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 9;
        goto LABEL_75;
      case 'v':
        if (!a4) {
          goto LABEL_60;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v11 = 11;
        goto LABEL_75;
      default:
        if (v4 == 98)
        {
          if (!a4) {
            goto LABEL_60;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v11 = 8;
        }
        else
        {
          if (v4 != 102) {
            goto LABEL_25;
          }
          if (!a4) {
            goto LABEL_60;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v11 = 12;
        }
        break;
    }
    goto LABEL_75;
  }
  if (v4 > 91)
  {
    if (v4 == 92) {
      goto LABEL_16;
    }
    if (v4 != 97) {
      goto LABEL_25;
    }
    if (!a4) {
      goto LABEL_60;
    }
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((unsigned char *)a4 + 23) = 1;
    }
    __int16 v11 = 7;
LABEL_75:
    *(_WORD *)a4 = v11;
    return a2 + 1;
  }
  if (v4 == 34 || v4 == 47)
  {
LABEL_16:
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v5;
      *((unsigned char *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_60:
    sub_1000100E4(a1);
  }
LABEL_25:
  if ((v5 & 0xF8) != 0x30) {
    goto LABEL_78;
  }
  char v6 = v4 - 48;
  int v7 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_48:
    int v7 = a3;
    goto LABEL_49;
  }
  if ((*v7 & 0xF8) == 0x30)
  {
    char v6 = *v7 + 8 * v6 - 48;
    if (a2 + 2 != a3)
    {
      char v8 = a2[2];
      int v9 = v8 & 0xF8;
      char v10 = v8 + 8 * v6 - 48;
      if (v9 == 48) {
        int v7 = a2 + 3;
      }
      else {
        int v7 = a2 + 2;
      }
      if (v9 == 48) {
        char v6 = v10;
      }
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  if (!a4) {
    sub_1000100E4(a1);
  }
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((unsigned char *)a4 + 23) = 1;
  }
  *(unsigned char *)a4 = v6;
  *((unsigned char *)a4 + 1) = 0;
  return v7;
}

void sub_100012EB8(uint64_t a1, char *a2, char *a3)
{
  size_t v3 = a3;
  int v4 = a2;
  if (*(unsigned char *)(a1 + 170))
  {
    if (*(unsigned char *)(a1 + 169))
    {
      for (unint64_t i = 0; ; ++i)
      {
        unint64_t v7 = v4[23] < 0 ? *((void *)v4 + 1) : v4[23];
        if (i >= v7) {
          break;
        }
        char v8 = v4;
        if (v4[23] < 0) {
          char v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v8[i]);
        char v10 = v4;
        if (v4[23] < 0) {
          char v10 = *(char **)v4;
        }
        v10[i] = v9;
      }
      for (unint64_t j = 0; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        char v13 = v3;
        if (v3[23] < 0) {
          char v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), v13[j]);
        unint64_t v15 = v3;
        if (v3[23] < 0) {
          unint64_t v15 = *(char **)v3;
        }
        v15[j] = v14;
      }
    }
    else
    {
      for (unint64_t k = 0; ; ++k)
      {
        unint64_t v18 = a2[23] < 0 ? *((void *)a2 + 1) : a2[23];
        if (k >= v18) {
          break;
        }
        unsigned __int8 v19 = a2;
        if (a2[23] < 0) {
          unsigned __int8 v19 = *(char **)a2;
        }
        int v20 = a2;
        if (a2[23] < 0) {
          int v20 = *(char **)a2;
        }
        v20[k] = v19[k];
      }
      for (unint64_t m = 0; ; ++m)
      {
        unint64_t v22 = a3[23] < 0 ? *((void *)a3 + 1) : a3[23];
        if (m >= v22) {
          break;
        }
        int v23 = a3;
        if (a3[23] < 0) {
          int v23 = *(char **)a3;
        }
        uint64_t v24 = a3;
        if (a3[23] < 0) {
          uint64_t v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      uint64_t v26 = v4;
      int v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }
    else
    {
      uint64_t v25 = v4[23];
    }
    sub_100014210(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      uint64_t v28 = v3;
      size_t v3 = *(char **)v3;
      uint64_t v27 = *((void *)v28 + 1);
    }
    else
    {
      uint64_t v27 = v3[23];
    }
    sub_100014210(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)size_t v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::string __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    sub_100014058((char **)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
  else
  {
    if (a2[23] < 0) {
      uint64_t v16 = *((void *)a2 + 1);
    }
    else {
      uint64_t v16 = a2[23];
    }
    if (v16 != 1 || (a3[23] < 0 ? (uint64_t v29 = *((void *)a3 + 1)) : (uint64_t v29 = a3[23]), v29 != 1)) {
      sub_1000142C8();
    }
    if (*(unsigned char *)(a1 + 169))
    {
      uint64_t v30 = a2;
      if (a2[23] < 0) {
        uint64_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v30);
      uint64_t v32 = v4;
      if (v4[23] < 0) {
        uint64_t v32 = *(unsigned char **)v4;
      }
      *uint64_t v32 = v31;
      char v33 = v3;
      if (v3[23] < 0) {
        char v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), *v33);
      uint64_t v35 = v3;
      if (v3[23] < 0) {
        uint64_t v35 = *(unsigned char **)v3;
      }
      *uint64_t v35 = v34;
    }
    *(_OWORD *)size_t v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0;
    *((void *)v4 + 2) = 0;
    *(void *)int v4 = 0;
    *(_OWORD *)std::string __p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)size_t v3 = 0;
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    sub_100014058((char **)(a1 + 88), (long long *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }
}

void sub_100013294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
}

void sub_1000132E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    char v10 = (char **)(a1 + 112);
    __int16 v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v9 = *(_WORD **)(a1 + 120);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        uint64_t v21 = v20 >> 1;
        unint64_t v22 = v19 - (void)*v10;
        if (v22 <= (v20 >> 1) + 1) {
          unint64_t v23 = v21 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24) {
          uint64_t v25 = (char *)sub_1000143B8(v18, v24);
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        uint64_t v26 = v27 + 2;
        long long v38 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v38) {
          goto LABEL_46;
        }
        do
        {
          __int16 v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19) {
        goto LABEL_24;
      }
      uint64_t v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        uint64_t v33 = v32 >> 1;
        unint64_t v34 = v19 - (void)*v10;
        if (v34 <= (v32 >> 1) + 1) {
          unint64_t v35 = v33 + 1;
        }
        else {
          unint64_t v35 = v34;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v36 = v35;
        }
        if (v36) {
          uint64_t v37 = (char *)sub_1000143B8(v18, v36);
        }
        else {
          uint64_t v37 = 0;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        uint64_t v26 = v27 + 2;
        size_t v40 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v40) {
          goto LABEL_46;
        }
        do
        {
          __int16 v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    sub_100008AE8();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *char v9 = v8;
    uint64_t v26 = v9 + 1;
    goto LABEL_48;
  }
  char v10 = (char **)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3) {
    goto LABEL_49;
  }
  uint64_t v13 = v12 >> 1;
  unint64_t v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1) {
    unint64_t v15 = v13 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16) {
    uint64_t v17 = (char *)sub_1000143B8(a1 + 128, v16);
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  uint64_t v26 = v27 + 2;
  uint64_t v30 = *(char **)(a1 + 112);
  uint64_t v29 = *(char **)(a1 + 120);
  if (v29 == v30) {
    goto LABEL_46;
  }
  do
  {
    __int16 v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  uint64_t v29 = *v10;
LABEL_46:
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 120) = v26;
  *(void *)(a1 + 128) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 120) = v26;
}

void sub_10001353C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_100013580(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100013594(uint64_t *a1, long long *a2)
{
  size_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = sub_1000138F8(v3, a2);
  }
  else
  {
    sub_100013898(v3, a2);
    uint64_t result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void sub_1000135D8(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100009E84(&__s, a2, a3, a3 - a2);
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a4 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a1 + 16) + 32))(&v11);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(std::string *)a4 = v11;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a4 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a4 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a4 = 0;
  *(void *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_100013754(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100013788(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  sub_100009E84(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a4;
      }
      else {
        uint64_t v10 = *(unsigned char **)a4;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a4 = 0;
      *(void *)(a4 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10001387C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100013898(void *result, long long *a2)
{
  size_t v2 = result;
  uint64_t v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t result = sub_100013A1C((unsigned char *)result[1], *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  v2[1] = v3 + 24;
  return result;
}

void sub_1000138F0(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1000138F8(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100008AE8();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_10000BF18(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::string v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  uint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_100013A1C(v11, *(void **)a2, *((void *)a2 + 1));
    std::string v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)std::string v11 = v12;
  }
  uint64_t v16 = v11 + 24;
  sub_100013ABC(a1, v15);
  uint64_t v13 = a1[1];
  sub_100013C54((uint64_t)v15);
  return v13;
}

void sub_100013A08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_100013C54((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_100013A1C(unsigned char *__dst, void *__src, unint64_t a3)
{
  unint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100009590();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    unint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    _OWORD v5[2] = v7 | 0x8000000000000000;
    *unint64_t v5 = v8;
    unint64_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_100013ABC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_100013B34((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_100013B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  sub_100013BD4((uint64_t)v12);
  return a6;
}

uint64_t sub_100013BD4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_100013C0C(a1);
  }
  return a1;
}

void sub_100013C0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

uint64_t sub_100013C54(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100013C8C(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_100013CE4()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_100013D28(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100013D3C(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  sub_100009E84(__p, a2, a3, a3 - a2);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
  return classname;
}

void sub_100013DF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100013E10(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    uint64_t v5 = *(unsigned char **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = (unint64_t *)(a1 + 64);
      unint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          unsigned __int8 v12 = operator new(v11);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v8[(void)v12];
        uint64_t v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (unsigned char *)v7)
        {
          unint64_t v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }
          while (v5 != (unsigned char *)v7);
LABEL_45:
          uint64_t v5 = (unsigned char *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100008AE8();
    }
    goto LABEL_22;
  }
  unint64_t v6 = (unint64_t *)(a1 + 64);
  uint64_t v5 = *(unsigned char **)(a1 + 72);
  unint64_t v13 = *(void *)(a1 + 80);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          unsigned __int8 v12 = operator new(v28);
        }
        else {
          unsigned __int8 v12 = 0;
        }
        uint64_t v20 = &v25[(void)v12];
        uint64_t v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (unsigned char *)v24)
        {
          __int16 v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }
          while (v5 != (unsigned char *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *uint64_t v5 = v2;
    uint64_t v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13) {
    goto LABEL_22;
  }
  unint64_t v14 = *v6;
  long long v15 = &v5[-*v6];
  unint64_t v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0) {
    goto LABEL_50;
  }
  unint64_t v17 = v13 - v14;
  if (2 * v17 > v16) {
    unint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v18 = v16;
  }
  if (v18) {
    unsigned __int8 v12 = operator new(v18);
  }
  else {
    unsigned __int8 v12 = 0;
  }
  uint64_t v20 = &v15[(void)v12];
  uint64_t v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  uint64_t v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (unsigned char *)v14)
  {
    uint64_t v29 = &v5[~v14];
    do
    {
      char v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }
    while (v5 != (unsigned char *)v14);
    goto LABEL_45;
  }
LABEL_46:
  unsigned __int8 v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

uint64_t sub_100014058(char **a1, long long *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(result - 8);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)*a1) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555) {
      sub_100008AE8();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)*a1) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555;
    }
    else {
      unint64_t v14 = v12;
    }
    uint64_t v29 = result;
    if (v14) {
      long long v15 = (char *)sub_100014320(result, v14);
    }
    else {
      long long v15 = 0;
    }
    unint64_t v16 = &v15[48 * v11];
    long long v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v16 = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v18 = *(long long *)((char *)a2 + 24);
    *((void *)v16 + 5) = *((void *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    uint64_t v20 = *a1;
    unint64_t v19 = (unint64_t)a1[1];
    if ((char *)v19 == *a1)
    {
      int64x2_t v24 = vdupq_n_s64(v19);
      uint64_t v21 = &v15[48 * v11];
    }
    else
    {
      uint64_t v21 = &v15[48 * v11];
      do
      {
        long long v22 = *(_OWORD *)(v19 - 48);
        *((void *)v21 - 4) = *(void *)(v19 - 32);
        *((_OWORD *)v21 - 3) = v22;
        *(void *)(v19 - 40) = 0;
        *(void *)(v19 - 32) = 0;
        *(void *)(v19 - 48) = 0;
        long long v23 = *(_OWORD *)(v19 - 24);
        *((void *)v21 - 1) = *(void *)(v19 - 8);
        *(_OWORD *)(v21 - 24) = v23;
        v21 -= 48;
        *(void *)(v19 - 16) = 0;
        *(void *)(v19 - 8) = 0;
        *(void *)(v19 - 24) = 0;
        v19 -= 48;
      }
      while ((char *)v19 != v20);
      int64x2_t v24 = *(int64x2_t *)a1;
    }
    unint64_t v10 = v16 + 48;
    *a1 = v21;
    a1[1] = v16 + 48;
    int64x2_t v27 = v24;
    uint64_t v25 = a1[2];
    a1[2] = &v15[48 * v14];
    size_t v28 = v25;
    uint64_t v26 = v24.i64[0];
    uint64_t result = sub_100014368((uint64_t)&v26);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v9 = *(long long *)((char *)a2 + 24);
    *(void *)(v7 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    unint64_t v10 = (char *)(v7 + 48);
  }
  a1[1] = v10;
  return result;
}

void sub_100014210(uint64_t a1, char *a2, char *a3)
{
  sub_100009E84(__p, a2, a3, a3 - a2);
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unint64_t v5 = __p;
  }
  else {
    unint64_t v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32))(*(void *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1000142AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000142C8()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_10001430C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_100014320(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_100008BC8();
  }
  return operator new(48 * a2);
}

uint64_t sub_100014368(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    sub_100011CD8(i - 48);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_1000143B8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_100008BC8();
  }
  return operator new(2 * a2);
}

void *sub_1000143EC(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100014458(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_1000144E4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_100014514(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100014580(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_10001460C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_100014644()
{
}

void sub_10001479C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1000147D4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      int v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          int v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38) {
            break;
          }
          if (v5 >= 214748364) {
            sub_100014874();
          }
          int v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3) {
            return a3;
          }
        }
      }
    }
  }
  return a2;
}

void sub_100014874()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_1000148B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1000148CC()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_100014910(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100014928(void *a1)
{
  sub_100014A80(a1);

  operator delete();
}

unsigned int *sub_100014960(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    *int v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return sub_100014B34(result, a2);
    }
    goto LABEL_23;
  }
  *int v4 = 0;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

unsigned int *sub_100014A14(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return sub_100014B34(result, a3);
  }
  return result;
}

void sub_100014A48(void *a1)
{
  sub_100014A80(a1);

  operator delete();
}

void *sub_100014A80(void *a1)
{
  *a1 = off_100025410;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  *a1 = off_100024F90;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  return a1;
}

unsigned int *sub_100014B34(unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16 * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(void *)(v7 - 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(unsigned char *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_100014B8C()
{
}

uint64_t sub_100014BA0(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_100014BB8(void *a1)
{
  sub_100014A80(a1);

  operator delete();
}

void sub_100014BF0(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_100014BFC(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

void sub_100014C24()
{
}

uint64_t sub_100014C38(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void sub_100014C4C()
{
  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_100014C90(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100014CA4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = sub_100014D40(a1, a2, a3);
  if (v6 == a2) {
    return a2;
  }

  return sub_100014E50(a1, v6, a3);
}

unsigned char *sub_100014D40(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v6 = sub_100014FF4(a1, a2, a3);
  uint64_t v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      int v8 = a2[1];
      if (v8 == 40)
      {
        uint64_t v9 = (uint64_t)(a2 + 2);
        sub_10000F82C(a1);
        do
        {
          uint64_t v10 = (unsigned char *)v9;
          uint64_t v9 = sub_100014CA4(a1, v9, a3);
        }
        while ((unsigned char *)v9 != v10);
        if (v10 == a3 || v10 + 1 == a3 || *v10 != 92 || v10[1] != 41) {
          sub_10000EDB4();
        }
        uint64_t v7 = v10 + 2;
        sub_10000F8B0(a1);
      }
      else
      {
        int v12 = sub_1000152E0(a1, v8);
        uint64_t v13 = 2;
        if (!v12) {
          uint64_t v13 = 0;
        }
        return &a2[v13];
      }
    }
  }
  return v7;
}

unsigned __int8 *sub_100014E50(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if (v4 == 42) {
      sub_100014644();
    }
    if (a2 + 1 != a3 && v4 == 92 && a2[1] == 123)
    {
      uint64_t v6 = a2 + 2;
      int v13 = 0;
      uint64_t v7 = sub_1000147D4(a1, a2 + 2, a3, &v13);
      if (v7 == v6) {
        goto LABEL_16;
      }
      if (v7 != a3)
      {
        int v8 = v7 + 1;
        int v9 = *v7;
        if (v9 == 44)
        {
          int v12 = -1;
          uint64_t v10 = sub_1000147D4(a1, v8, a3, &v12);
          if (v10 != a3 && v10 + 1 != a3 && *v10 == 92 && v10[1] == 125)
          {
            if (v12 != -1 && v12 < v13) {
LABEL_16:
            }
              sub_100014874();
LABEL_20:
            sub_100014644();
          }
        }
        else if (v8 != a3 && v9 == 92 && *v8 == 125)
        {
          goto LABEL_20;
        }
      }
      sub_1000148CC();
    }
  }
  return a2;
}

unsigned char *sub_100014FF4(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = sub_10001512C(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    goto LABEL_12;
  }
  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_1000100E4(a1);
  }
  uint64_t result = sub_10001512C(a1, a2, a3);
  if (result == a2)
  {
    if (*a2 == 46) {
      operator new();
    }
LABEL_12:
    return sub_10000F718(a1, a2, a3);
  }
  return result;
}

unsigned char *sub_10001512C(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  if (a2 != a3
    && a2 + 1 != a3
    && *a2 == 92
    && ((char)a2[1] - 36) <= 0x3A
    && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
  {
    sub_1000100E4(a1);
  }
  return a2;
}

void *sub_1000151A8(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  return a1;
}

void sub_100015214(void *a1)
{
  *a1 = off_100024F90;
  uint64_t v1 = a1[1];
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }

  operator delete();
}

uint64_t sub_1000152A0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_1000152E0(uint64_t a1, unsigned __int8 a2)
{
  if (((a2 & 0xF8) == 0x30 || (a2 & 0xFE) == 0x38) && a2 - 49 <= 8)
  {
    if (a2 - 48 <= *(_DWORD *)(a1 + 28)) {
      sub_10001027C(a1);
    }
    sub_100010224();
  }
  return 0;
}

unsigned __int8 *sub_100015340(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_1000153A0(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    sub_100014C4C();
  }
  do
  {
    uint64_t v7 = v6;
    int v6 = sub_1000153A0(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_1000153A0(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_1000154E4(a1, a2, a3);
  uint64_t v7 = (unsigned __int8 *)v6;
  if (v6 == a2 && v6 != a3)
  {
    int v8 = *a2;
    if (v8 == 36) {
      sub_10000EBF4();
    }
    if (v8 != 40)
    {
      if (v8 == 94) {
        sub_10000EB70();
      }
      return (unsigned __int8 *)a2;
    }
    sub_10000F82C(a1);
    ++*(_DWORD *)(a1 + 36);
    int v9 = (char *)sub_10000DAE8(a1, a2 + 1, a3);
    if (v9 == a3 || (uint64_t v10 = v9, *v9 != 41)) {
      sub_10000EDB4();
    }
    sub_10000F8B0(a1);
    --*(_DWORD *)(a1 + 36);
    uint64_t v7 = (unsigned __int8 *)(v10 + 1);
  }
  if (v7 == (unsigned __int8 *)a2) {
    return (unsigned __int8 *)a2;
  }

  return sub_10000E86C(a1, v7, (unsigned __int8 *)a3);
}

char *sub_1000154E4(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = sub_1000155CC(a1, a2, a3);
  if (result == a2)
  {
    uint64_t result = sub_100015658(a1, a2, a3);
    if (result == a2)
    {
      if (a2 != a3 && *a2 == 46) {
        operator new();
      }
      return sub_10000F718(a1, a2, a3);
    }
  }
  return result;
}

char *sub_1000155CC(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3)
  {
    int v3 = *a2;
    uint64_t v4 = (v3 - 36);
    if (v4 > 0x3A) {
      goto LABEL_8;
    }
    if (((1 << (v3 - 36)) & 0x5800000080004D1) != 0) {
      return a2;
    }
    if (v4 == 5)
    {
      if (*(_DWORD *)(a1 + 36)) {
        return a2;
      }
    }
    else
    {
LABEL_8:
      if ((v3 - 123) < 2) {
        return a2;
      }
    }
    sub_1000100E4(a1);
  }
  return a2;
}

char *sub_100015658(uint64_t a1, char *a2, char *a3)
{
  int v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  uint64_t v4 = (unsigned __int8 *)(a2 + 1);
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  int v5 = (char)*v4;
  BOOL v6 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v6 || (v5 - 123) < 3) {
    sub_1000100E4(a1);
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    int v8 = sub_1000152E0(a1, *v4);
    uint64_t v9 = 2;
    if (!v8) {
      uint64_t v9 = 0;
    }
    v3 += v9;
    return v3;
  }

  return sub_100012B9C(a1, (char *)v4, a3, 0);
}

BOOL sub_100015730(uint64_t a1)
{
  int v2 = sqlite3_exec(*(sqlite3 **)(a1 + 8), "PRAGMA quick_check", (int (__cdecl *)(void *, int, char **, char **))sub_1000157BC, 0, 0);
  if (v2)
  {
    int v3 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C670(a1, v3);
    }
  }
  return v2 == 0;
}

BOOL sub_1000157BC(uint64_t a1, int a2, const char **a3)
{
  return a2 < 1 || strcmp(*a3, "ok") != 0;
}

uint64_t sub_1000157FC(uint64_t a1)
{
  int v2 = (sqlite3 **)(a1 + 8);
  int v3 = sqlite3_close(*(sqlite3 **)(a1 + 8));
  if (v3)
  {
    int v5 = v3;
    BOOL v6 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C804(a1, v5, v6);
    }
    return 0;
  }
  uint64_t v7 = (const std::__fs::filesystem::path *)(a1 + 100);
  if (remove(v7, v4))
  {
    int v8 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C764((uint64_t)v7, v8);
    }
    return 0;
  }
  int v9 = sqlite3_open((const char *)v7, v2);
  uint64_t v10 = qword_100028F80;
  if (v9)
  {
    int v11 = v9;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C6EC(v11, v10);
    }
    return 0;
  }
  uint64_t v12 = 1;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    long long v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "recreated %s successfully", (uint8_t *)&v14, 0xCu);
  }
  return v12;
}

uint64_t sub_10001596C(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  memcpy((void *)(a1 + 100), "/var/db/mmaintenanced/memory_errors.db", 0x400uLL);
  memcpy((void *)(a1 + 1124), "/System/Volumes/iSCPreboot/dramecc/dramecc.db", 0x400uLL);
  memcpy((void *)(a1 + 2148), "/System/Volumes/iSCPreboot/dramecc/", 0x400uLL);
  *(void *)(a1 + 3176) = 0;
  *(void *)(a1 + 3192) = 0;
  *(void *)(a1 + 3184) = 0;
  return a1;
}

BOOL sub_1000159E0(uint64_t a1)
{
  uint64_t v1 = (sqlite3_stmt **)(a1 + 16);
  return !sqlite3_prepare_v2(*(sqlite3 **)(a1 + 8), "CREATE TABLE IF NOT EXISTS ecc_errors_v2 (ID INTEGER PRIMARY KEY,time INT NOT NULL,addr INT NOT NULL,row INT,column INT,bank INT,count INT NOT NULL,correctable INT NOT NULL);",
            -1,
            (sqlite3_stmt **)(a1 + 16),
            0)
      && sqlite3_step(*v1) == 101;
}

BOOL sub_100015A3C(sqlite3 **a1)
{
  int v2 = sqlite3_prepare_v2(a1[1], "INSERT INTO ecc_errors_v2('time','addr','row','column','bank','count','correctable') VALUES(?, ?, ?, ?, ?, ?, ?);",
         -1,
         a1 + 3,
         0);
  int v3 = sqlite3_prepare_v2(a1[1], "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = ?;", -1, a1 + 6, 0) | v2;
  int v4 = sqlite3_prepare_v2(a1[1], "SELECT DISTINCT addr FROM ecc_errors_v2 WHERE correctable = ?;", -1, a1 + 4, 0);
  int v5 = v3 | v4 | sqlite3_prepare_v2(a1[1], "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = ? AND time >= ?;",
                   -1,
                   a1 + 7,
                   0);
  int v6 = sqlite3_prepare_v2(a1[1], "SELECT DISTINCT addr FROM ecc_errors_v2 WHERE correctable = ? AND time >= ?;",
         -1,
         a1 + 5,
         0);
  int v7 = v6 | sqlite3_prepare_v2(a1[1], "SELECT COUNT(DISTINCT correctable) FROM ecc_errors_v2 WHERE addr = ?;",
              -1,
              a1 + 8,
              0);
  int v8 = v5 | v7 | sqlite3_prepare_v2(a1[1], "SELECT COUNT(*) FROM ecc_errors_v2 WHERE correctable = 0 AND (addr >> ?) = ?;",
                   -1,
                   a1 + 9,
                   0);
  int v9 = sqlite3_prepare_v2(a1[1], "SELECT (addr >> ?) as Page, MAX(time) as Time FROM ecc_errors_v2 WHERE correctable=0 GROUP BY Page ORDER BY Time DESC LIMIT ?;",
         -1,
         a1 + 10,
         0);
  int v10 = v8 | v9 | sqlite3_prepare_v2(a1[1], "DELETE FROM ecc_errors_v2 WHERE (addr >> ?) = ?;", -1, a1 + 11, 0);
  if (v10)
  {
    int v11 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C890(v10, v11);
    }
  }
  return v10 == 0;
}

uint64_t sub_100015BC8(void *a1)
{
  size_t v2 = 4;
  uint64_t result = sysctlbyname("vm.vm_ecc_max_db_pages", a1, &v2, 0, 0);
  if (result) {
    return *__error();
  }
  return result;
}

void sub_100015C14(uint64_t a1)
{
  uint64_t v1 = (_DWORD *)(a1 + 96);
  if (sub_100015BC8((void *)(a1 + 96)))
  {
    size_t v2 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C908(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (!*v1) {
    *uint64_t v1 = 1024;
  }
}

void sub_100015C78(uint64_t a1)
{
  uint64_t v2 = a1 + 100;
  int v3 = sqlite3_open((const char *)(a1 + 100), (sqlite3 **)(a1 + 8));
  if (v3)
  {
    int v4 = v3;
    uint64_t v5 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001C98C(v2, v4, v5);
    }
  }
  else if ((sub_100015730(a1) || sub_1000157FC(a1)) && sub_1000159E0(a1) && sub_100015A3C((sqlite3 **)a1))
  {
    sub_100015C14(a1);
    *(unsigned char *)a1 = 1;
  }
}

uint64_t sub_100015D2C(uint64_t a1, int a2, int a3, char a4, sqlite3_int64 a5, _DWORD *a6)
{
  uint64_t v12 = 32;
  if (a3) {
    uint64_t v12 = 40;
  }
  int v13 = *(sqlite3_stmt **)(a1 + v12);
  *a6 = 0;
  sqlite3_reset(v13);
  sqlite3_bind_int(v13, 1, a2);
  if (a3) {
    sqlite3_bind_int64(v13, 2, a5);
  }
  int v14 = sqlite3_step(v13);
  char v15 = a4 ^ 1 | a2;
  while (v14 == 100)
  {
    if (v15)
    {
      ++*a6;
    }
    else
    {
      sqlite3_int64 v16 = sqlite3_column_int64(v13, 0);
      sqlite3_reset(*(sqlite3_stmt **)(a1 + 64));
      sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 64), 1, v16);
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 64)) != 100)
      {
        if (!os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
          return 1;
        }
LABEL_21:
        sub_10001CA9C();
        return 1;
      }
      if (sqlite3_column_int(*(sqlite3_stmt **)(a1 + 64), 0) == 2) {
        ++*a6;
      }
      if (sqlite3_step(*(sqlite3_stmt **)(a1 + 64)) != 101)
      {
        if (!os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
          return 1;
        }
        goto LABEL_21;
      }
    }
    int v14 = sqlite3_step(v13);
  }
  if (v14 == 101) {
    return 0;
  }
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
    sub_10001CA28();
  }
  return 1;
}

uint64_t sub_100015F04(uint64_t a1, int a2, int a3, sqlite3_int64 a4, int *a5)
{
  uint64_t v9 = 48;
  if (a3) {
    uint64_t v9 = 56;
  }
  int v10 = *(sqlite3_stmt **)(a1 + v9);
  sqlite3_reset(v10);
  sqlite3_bind_int(v10, 1, a2);
  if (a3) {
    sqlite3_bind_int64(v10, 2, a4);
  }
  if (sqlite3_step(v10) == 100)
  {
    *a5 = sqlite3_column_int(v10, 0);
    int v11 = sqlite3_step(v10);
    uint64_t result = 0;
    if (v11 == 101) {
      return result;
    }
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
  {
LABEL_10:
    sub_10001CB10();
  }
  return 1;
}

uint64_t sub_100016018(uint64_t a1)
{
  if (*(unsigned char *)a1)
  {
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 16));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 24));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 32));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 40));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 48));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 56));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 64));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 72));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 80));
    sqlite3_finalize(*(sqlite3_stmt **)(a1 + 88));
    sqlite3_close(*(sqlite3 **)(a1 + 8));
  }
  uint64_t v2 = *(void **)(a1 + 3176);
  if (v2)
  {
    *(void *)(a1 + 3184) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_1000160B4(uint64_t a1, uint64_t a2)
{
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 24)) == 101) {
    return 0;
  }
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
    sub_10001CB84();
  }
  return 1;
}

uint64_t sub_100016190(uint64_t a1, unint64_t a2)
{
  sqlite3_int64 v3 = a2 >> vm_page_shift;
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 88));
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 88), 1, vm_page_shift);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 88), 2, v3);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 88)) == 101) {
    return 0;
  }
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
    sub_10001CBF8();
  }
  return 1;
}

BOOL sub_10001623C(uint64_t a1, unint64_t a2)
{
  sqlite3_int64 v3 = a2 >> vm_page_shift;
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 72));
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 72), 1, vm_page_shift);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 72), 2, v3);
  if (sqlite3_step(*(sqlite3_stmt **)(a1 + 72)) == 100) {
    return sqlite3_column_int(*(sqlite3_stmt **)(a1 + 72), 0) != 0;
  }
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
    sub_10001CC6C();
  }
  return 1;
}

void sub_1000162F8(uint64_t a1)
{
  uint64_t v2 = a1 + 1124;
  int v3 = open((const char *)(a1 + 1124), 1537, 384);
  int v4 = fdopen(v3, "w");
  if (v4)
  {
    uint64_t v5 = v4;
    sqlite3_reset(*(sqlite3_stmt **)(a1 + 80));
    sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 80), 1, vm_page_shift);
    sqlite3_bind_int(*(sqlite3_stmt **)(a1 + 80), 2, *(_DWORD *)(a1 + 96));
    int v6 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
    if (v6 == 100)
    {
      do
      {
        sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 80), 0) << vm_page_shift;
        fprintf(v5, "%llx\n", v7 & ~vm_page_mask);
        if (byte_100028F88)
        {
          uint64_t v8 = qword_100028F80;
          if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)stat buf = 134217984;
            sqlite3_int64 v12 = v7;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "wrote page %llu", buf, 0xCu);
          }
        }
        int v9 = sqlite3_step(*(sqlite3_stmt **)(a1 + 80));
      }
      while (v9 == 100);
      int v6 = v9;
    }
    fclose(v5);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 67109120;
      LODWORD(v12) = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "regenerated the retired page list, rc=%d", buf, 8u);
    }
  }
  else
  {
    int v10 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001CCE0(v2, v10);
    }
  }
}

uint64_t sub_10001651C(const char *a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (v2)
  {
    io_registry_entry_t v3 = v2;
    CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
    if (v4)
    {
      CFStringRef v5 = v4;
      CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, v4, 0, 0);
      if (CFProperty)
      {
        CFDataRef v7 = CFProperty;
        if (CFDataGetLength(CFProperty) == 4)
        {
          uint64_t v8 = *(unsigned int *)CFDataGetBytePtr(v7);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
            sub_10001CE40();
          }
          uint64_t v8 = 0;
        }
        CFRelease(v7);
      }
      else
      {
        uint64_t v8 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001CE0C();
      }
      uint64_t v8 = 0;
    }
    IOObjectRelease(v3);
  }
  else
  {
    int v9 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001CD94((uint64_t)a1, v9);
    }
    return 0;
  }
  return v8;
}

uint64_t sub_100016674(uint64_t a1, time_t a2)
{
  int v3 = *(_DWORD *)(a1 + 4);
  if ((v3 & 4) != 0)
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    uint64_t result = 0;
    if (!v11) {
      return result;
    }
    uint64_t v13 = *(void *)(a1 + 8);
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received test event for addr %llx, ignoring", (uint8_t *)&buf, 0xCu);
    return 0;
  }
  uint64_t v4 = qword_100028F78;
  if (*(unsigned char *)qword_100028F78)
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    LOBYTE(v5) = v3;
    uint64_t v22 = 0;
    if (!a2)
    {
      v18[0] = 0;
      time(v18);
      a2 = v18[0];
      int v5 = *(_DWORD *)(a1 + 4);
      uint64_t v4 = qword_100028F78;
    }
    unint64_t v6 = *(void *)(a1 + 8);
    *(void *)&long long buf = a2;
    *((void *)&buf + 1) = v6;
    int v7 = v5 & 1;
    LOBYTE(v22) = v5 & 1;
    if (mkdir((const char *)(v4 + 2148), 0x180u) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001CEA8();
      }
      return 5;
    }
    if ((v3 & 2) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001CE74();
      }
    }
    else
    {
      uint64_t v8 = qword_100028F78;
      *(_DWORD *)(qword_100028F78 + 3200) = *(_DWORD *)(a1 + 20);
      if (!v7 && sub_10001623C(v8, v6)) {
        return 0;
      }
      if ((v3 & 0x10) != 0)
      {
        if (sub_100016190(qword_100028F78, v6))
        {
          if (!byte_100028F88) {
            return 5;
          }
          uint64_t v9 = qword_100028F80;
          if (!os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
            return 5;
          }
          LODWORD(v18[0]) = 134217984;
          *(time_t *)((char *)v18 + 4) = v6;
          int v10 = "Failed to remove address %llx from database";
LABEL_32:
          p_long long buf = (uint8_t *)v18;
          int v14 = v9;
          os_log_type_t v16 = OS_LOG_TYPE_ERROR;
          uint32_t v17 = 12;
          goto LABEL_19;
        }
      }
      else if (sub_1000160B4(qword_100028F78, (uint64_t)&buf))
      {
        if (!byte_100028F88) {
          return 5;
        }
        uint64_t v9 = qword_100028F80;
        if (!os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
          return 5;
        }
        LODWORD(v18[0]) = 134217984;
        *(time_t *)((char *)v18 + 4) = v6;
        int v10 = "Failed to insert error into database for addr %llx";
        goto LABEL_32;
      }
      if (v7) {
        return 0;
      }
    }
    sub_1000162F8(qword_100028F78);
    return 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    int v14 = &_os_log_default;
    int v10 = "Received a notification, but EccDatabase is not in a valid state";
    p_long long buf = (uint8_t *)&buf;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 2;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v14, v16, v10, p_buf, v17);
  }
  return 5;
}

BOOL sub_100016944()
{
  int v2 = 0;
  int v0 = sub_100015BC8(&v2);
  BOOL result = 0;
  if (v0 != 2) {
    return sub_10001651C("dram-ecc") != 0;
  }
  return result;
}

void sub_100016990(time_t a1)
{
  if (sub_100016944())
  {
    time_t v22 = 0;
    if (a1) {
      time_t v22 = a1;
    }
    else {
      time(&v22);
    }
    if (!*(_DWORD *)(qword_100028F78 + 3200)) {
      *(_DWORD *)(qword_100028F78 + 3200) = sub_10001651C("dram-vendor-id");
    }
    time_t v2 = v22;
    if (difftime(v22, qword_100028F48) >= 300.0)
    {
      int v3 = 0;
      qword_100028F48 = v2;
      sqlite3_int64 v4 = v2 - 86400;
      char v5 = 1;
      do
      {
        int v6 = 0;
        char v7 = v5;
        char v8 = 1;
        do
        {
          char v9 = v8;
          int v23 = 0;
          if (sub_100015F04(qword_100028F78, v3 & 1, v6 & 1, v4, &v23))
          {
            int v10 = qword_100028F80;
            if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v3;
              LOWORD(v25) = 1024;
              *(_DWORD *)((char *)&v25 + 2) = v6;
              _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get total count for correctable=%d epoch=%d ", buf, 0xEu);
            }
          }
          else
          {
            *(void *)long long buf = 0x400000000;
            buf[0] = v3 & 1;
            buf[2] = v6 & 1;
            LODWORD(v25) = *(_DWORD *)(qword_100028F78 + 3200);
            HIDWORD(v25) = v23;
            sub_100016C74(buf);
          }
          char v8 = 0;
          int v6 = 1;
        }
        while ((v9 & 1) != 0);
        char v5 = 0;
        int v3 = 1;
      }
      while ((v7 & 1) != 0);
      int v11 = 0;
      char v12 = 1;
      do
      {
        int v13 = 0;
        char v21 = v12;
        char v14 = 1;
        do
        {
          char v15 = 0;
          char v16 = v14;
          char v17 = 1;
          do
          {
            char v18 = v17;
            if (v11 & 1) != 0 && (v15) {
              break;
            }
            int v23 = 0;
            uint8_t v19 = v15 & 1;
            if (sub_100015D2C(qword_100028F78, v11 & 1, v13 & 1, v15 & 1, v4, &v23) == 1)
            {
              uint64_t v20 = qword_100028F80;
              if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v11;
                LOWORD(v25) = 1024;
                *(_DWORD *)((char *)&v25 + 2) = v13;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to get unique addr count for correctable=%d epoch=%d ", buf, 0xEu);
              }
            }
            else
            {
              *(void *)long long buf = v11 & 1;
              buf[1] = v19;
              *(_DWORD *)&buf[2] = v13 & 1;
              LODWORD(v25) = *(_DWORD *)(qword_100028F78 + 3200);
              HIDWORD(v25) = v23;
              sub_100016C74(buf);
            }
            char v17 = 0;
            char v15 = 1;
          }
          while ((v18 & 1) != 0);
          char v14 = 0;
          int v13 = 1;
        }
        while ((v16 & 1) != 0);
        char v12 = 0;
        int v11 = 1;
      }
      while ((v21 & 1) != 0);
    }
  }
}

void sub_100016C74(unsigned __int8 *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *a1;
    int v3 = a1[1];
    int v4 = a1[2];
    int v5 = *((_DWORD *)a1 + 1);
    int v6 = *((_DWORD *)a1 + 2);
    int v7 = *((_DWORD *)a1 + 3);
    *(_DWORD *)long long buf = 67110400;
    int v24 = v2;
    __int16 v25 = 1024;
    int v26 = v3;
    __int16 v27 = 1024;
    int v28 = v4;
    __int16 v29 = 1024;
    int v30 = v5;
    __int16 v31 = 1024;
    int v32 = v6;
    __int16 v33 = 1024;
    int v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notified CoreAnalytics of ECC error -> correctable: %u, preceded_by_correctable: %u, epoch: %u, uniqueness: %u, vendor: %u, count: %u", buf, 0x26u);
  }
  char v8 = (void *)qword_100028F78;
  if (*(unsigned char *)(qword_100028F78 + 1))
  {
    char v9 = *(_OWORD **)(qword_100028F78 + 3184);
    unint64_t v10 = *(void *)(qword_100028F78 + 3192);
    if ((unint64_t)v9 >= v10)
    {
      char v12 = (void **)(qword_100028F78 + 3176);
      uint64_t v13 = *(void *)(qword_100028F78 + 3176);
      uint64_t v14 = ((uint64_t)v9 - v13) >> 4;
      unint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 60) {
        sub_100008AE8();
      }
      uint64_t v16 = v10 - v13;
      if (v16 >> 3 > v15) {
        unint64_t v15 = v16 >> 3;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17) {
        char v18 = (char *)sub_10000C080(qword_100028F78 + 3192, v17);
      }
      else {
        char v18 = 0;
      }
      uint8_t v19 = &v18[16 * v14];
      uint64_t v20 = &v18[16 * v17];
      *(_OWORD *)uint8_t v19 = *(_OWORD *)a1;
      int v11 = v19 + 16;
      char v21 = (char *)v8[398];
      time_t v22 = (char *)v8[397];
      if (v21 != v22)
      {
        do
        {
          *((_OWORD *)v19 - 1) = *((_OWORD *)v21 - 1);
          v19 -= 16;
          v21 -= 16;
        }
        while (v21 != v22);
        char v21 = (char *)*v12;
      }
      v8[397] = v19;
      v8[398] = v11;
      v8[399] = v20;
      if (v21) {
        operator delete(v21);
      }
    }
    else
    {
      *char v9 = *(_OWORD *)a1;
      int v11 = v9 + 1;
    }
    v8[398] = v11;
  }
  else
  {
    analytics_send_event_lazy();
  }
}

void *sub_100016EA4(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  int v3 = v2;
  if (**(unsigned char **)(a1 + 32)) {
    int v4 = "CE";
  }
  else {
    int v4 = "UE";
  }
  xpc_dictionary_set_string(v2, "CEorUE", v4);
  xpc_dictionary_set_BOOL(v3, "PrecededByCE", *(unsigned char *)(*(void *)(a1 + 32) + 1));
  if (*(unsigned char *)(*(void *)(a1 + 32) + 2)) {
    int v5 = "Epoch";
  }
  else {
    int v5 = "Accumulated";
  }
  xpc_dictionary_set_string(v3, "TimePeriod", v5);
  int v6 = 0;
  uint64_t v7 = *(unsigned int *)(*(void *)(a1 + 32) + 4);
  if ((int)v7 <= 4) {
    int v6 = off_100025570[v7];
  }
  xpc_dictionary_set_string(v3, "CountType", v6);
  xpc_dictionary_set_uint64(v3, "Vendor", *(unsigned int *)(*(void *)(a1 + 32) + 8));
  xpc_dictionary_set_uint64(v3, "ErrorCount", *(unsigned int *)(*(void *)(a1 + 32) + 12));
  return v3;
}

void sub_100016FC4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void *sub_100016FE0()
{
  BOOL result = sub_100007B84();
  qword_100028F78 = (uint64_t)result;
  return result;
}

uint64_t sub_100017000()
{
  long long v3 = 0u;
  memset(v2, 0, sizeof(v2));
  sub_100004AAC((uint64_t)v2);
  if (BYTE8(v3)) {
    sub_10000D54C(&v1, "com.apple.driver.AppleH[0-9]+ANEInterface[.DMA]*.ane[0-9]*", 0);
  }
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
    sub_10001CEDC();
  }
  return 0;
}

void sub_1000170F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
}

void sub_100017108(BOOL a1, BOOL a2, uint64_t a3, uint64_t a4, BOOL a5)
{
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v10, "killed_modelmanagerd", a1);
  xpc_dictionary_set_BOOL(v10, "kill_resolved_abandonment", a2);
  xpc_dictionary_set_int64(v10, "memory_usage_over_threshold", a3 - 1073741825);
  xpc_dictionary_set_int64(v10, "final_memory_usage_over_threshold", a4 - 1073741825);
  xpc_dictionary_set_BOOL(v10, "ended_in_maintenance_error", a5);
  analytics_send_event();

  xpc_release(v10);
}

uint64_t sub_1000171E4()
{
  int v0 = dispatch_semaphore_create(0);
  dispatch_retain(v0);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  int64_t v7[2] = sub_10001737C;
  v7[3] = &unk_1000255A0;
  v7[4] = &v8;
  v7[5] = v0;
  mm_swift_are_models_loaded(v7);
  dispatch_time_t v1 = dispatch_time(0, 3000000000);
  int v2 = dispatch_semaphore_wait(v0, v1);
  dispatch_release(v0);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
      sub_10001CF44();
    }
    uint64_t v3 = 1;
    sub_100017108(0, 0, 0, 0, 1);
  }
  else if (*((unsigned char *)v9 + 24))
  {
    int v4 = qword_100028F80;
    if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "models loaded, skipping ane abandonment check", v6, 2u);
    }
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v3;
}

void sub_100017360(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_10001737C(uint64_t a1, int a2)
{
  int v4 = qword_100028F80;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEBUG)) {
    sub_10001CF78(a2, v4);
  }
  int v5 = *(NSObject **)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 != 0;
  dispatch_semaphore_signal(v5);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void sub_1000173F4()
{
  if ((sub_1000171E4() & 1) == 0)
  {
    uint64_t v0 = sub_100017000();
    uint64_t v1 = qword_100028F80;
    BOOL v2 = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT);
    if (v0 > 1073741825)
    {
      if (v2)
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v7 = v0 - 1073741825;
        _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "ANE memory usage speculated to be over threshold by %lld bytes", buf, 0xCu);
      }
      if ((sub_1000171E4() & 1) == 0)
      {
        uint64_t v3 = dispatch_semaphore_create(0);
        dispatch_retain(v3);
        v5[0] = _NSConcreteStackBlock;
        v5[1] = 0x40000000;
        _OWORD v5[2] = sub_1000175C0;
        v5[3] = &unk_1000255C0;
        v5[4] = v3;
        mm_swift_run_with_memory_maintenance_assertion(v5);
        dispatch_time_t v4 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(v3, v4))
        {
          if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
            sub_10001CFF0();
          }
          sub_100017108(0, 0, 0, 0, 1);
        }
        dispatch_release(v3);
      }
    }
    else if (v2)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "ANE memory clearly not abandonded, skipping further checks", buf, 2u);
    }
  }
}

void sub_1000175C0(uint64_t a1)
{
  uint64_t v2 = sub_100017000();
  if (v2 >= 1073741826)
  {
    if (byte_100028F88 && sub_100017D1C()) {
      sub_100018968();
    }
    int v9 = sub_100006C58("modelmanagerd");
    uint64_t v10 = qword_100028F80;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR);
    if (v9 == -1)
    {
      if (v11) {
        sub_10001D024();
      }
    }
    else
    {
      if (v11) {
        sub_10001D178(v2, v9, v10);
      }
      int v12 = terminate_with_reason();
      if (!v12)
      {
        sleep(6u);
        uint64_t v15 = sub_100017000();
        uint64_t v16 = qword_100028F80;
        if (v15 >= 1073741826)
        {
          if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
            sub_10001D058(v15, v16);
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ANE memory usage dropped below threshold after modelmanagerd kill", (uint8_t *)&v17, 2u);
        }
        BOOL v5 = v15 < 1073741826;
        BOOL v4 = 1;
        uint64_t v6 = v2;
        uint64_t v7 = v15;
        goto LABEL_5;
      }
      int v13 = v12;
      uint64_t v14 = qword_100028F80;
      if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_ERROR)) {
        sub_10001D0D8(v13, v14);
      }
    }
    BOOL v4 = 0;
    BOOL v5 = 0;
    uint64_t v6 = v2;
    uint64_t v7 = 0;
    BOOL v8 = 1;
    goto LABEL_18;
  }
  uint64_t v3 = qword_100028F80;
  if (os_log_type_enabled((os_log_t)qword_100028F80, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    uint64_t v18 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ANE memory usage below threshold while no model loaded: size in bytes = %lld", (uint8_t *)&v17, 0xCu);
  }
  BOOL v4 = 0;
  BOOL v5 = 0;
  uint64_t v6 = v2;
  uint64_t v7 = 0;
LABEL_5:
  BOOL v8 = 0;
LABEL_18:
  sub_100017108(v4, v5, v6, v7, v8);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t sub_100017818(int *a1)
{
  int v2 = *a1;
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v2 < 1)
  {
    if (v3)
    {
      int v5 = a1[3];
      int v6 = a1[4];
      int v7 = a1[5];
      int v8 = a1[6];
      int v9 = a1[7];
      int v10 = a1[8];
      int v11 = a1[9];
      unsigned int v13 = a1[1];
      int v12 = a1[2];
      *(_DWORD *)long long buf = 67111424;
      int v15 = v12;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 1024;
      int v21 = v7;
      __int16 v22 = 1024;
      int v23 = v8;
      __int16 v24 = 1024;
      int v25 = v9;
      __int16 v26 = 1024;
      int v27 = v10;
      __int16 v28 = 1024;
      int v29 = v11;
      __int16 v30 = 1024;
      int v31 = v13 & 1;
      __int16 v32 = 1024;
      int v33 = (v13 >> 1) & 1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notified CoreAnalytics of MCC error: status(%x) amcc(%x) plane(%x) bank(%x) way(%x) index(%x) bit_off_cl(%x) bit_off_within_hcl(%x) single_bit(%u) multi_bit(%u)", buf, 0x3Eu);
    }
    analytics_send_event_lazy();
    return 0;
  }
  else
  {
    if (v3)
    {
      *(_DWORD *)long long buf = 67109120;
      int v15 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown ECC event version %u\n", buf, 8u);
    }
    return 5;
  }
}

xpc_object_t sub_1000179DC(_DWORD *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", a1[10]);
  xpc_dictionary_set_uint64(v2, "amcc", a1[11]);
  xpc_dictionary_set_uint64(v2, "plane", a1[12]);
  xpc_dictionary_set_uint64(v2, "bank", a1[13]);
  xpc_dictionary_set_uint64(v2, "way", a1[14]);
  xpc_dictionary_set_uint64(v2, "index", a1[15]);
  xpc_dictionary_set_uint64(v2, "bit_off_cl", a1[16]);
  xpc_dictionary_set_uint64(v2, "bit_off_within_hcl", a1[17]);
  xpc_dictionary_set_uint64(v2, "single_bit", a1[9] & 1);
  xpc_dictionary_set_uint64(v2, "multi_bit", ((unint64_t)a1[9] >> 1) & 1);
  return v2;
}

uint64_t sub_100017AE0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 5902) >= 0xFFFFFFFE) {
    return (uint64_t)*(&off_100025600 + 5 * (v1 - 5900) + 5);
  }
  else {
    return 0;
  }
}

uint64_t sub_100017B1C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 72)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 72) && *(_DWORD *)(result + 76) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      long long v5 = *(_OWORD *)(result + 48);
      v8[0] = *(_OWORD *)(result + 32);
      v8[1] = v5;
      uint64_t v9 = *(void *)(result + 64);
      long long v6 = *(_OWORD *)(result + 108);
      v7[0] = *(_OWORD *)(result + 92);
      v7[1] = v6;
      BOOL result = sub_100007A50(v4, (uint64_t)v8, (uint64_t)v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100017BC8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 72)
  {
    int v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 72) && *(_DWORD *)(result + 76) > 0x1Fu)
    {
      uint64_t v4 = *(unsigned int *)(result + 12);
      long long v5 = *(_OWORD *)(result + 48);
      v8[0] = *(_OWORD *)(result + 32);
      v8[1] = v5;
      uint64_t v9 = *(void *)(result + 64);
      long long v6 = *(_OWORD *)(result + 108);
      v7[0] = *(_OWORD *)(result + 92);
      v7[1] = v6;
      BOOL result = sub_100007B18(v4, (uint64_t)v8, (uint64_t)v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    int v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100017C74(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 5902) >= 0xFFFFFFFE
    && (long long v5 = (void (*)(void))*(&off_100025600 + 5 * (v4 - 5900) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100017D08()
{
  qword_100028F90 = 0x40F5180000000000;
}

uint64_t sub_100017D1C()
{
  return sub_100017D38() & 1;
}

uint64_t sub_100017D38()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  int v3 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init(subsystem:category:)();
  id v4 = [self defaultManager];
  NSString v5 = String._bridgeToObjectiveC()();
  double v57 = 0.0;
  id v6 = [v4 attributesOfItemAtPath:v5 error:&v57];

  double v7 = v57;
  if (v6)
  {
    int v53 = v3;
    uint64_t v54 = v1;
    uint64_t v55 = v0;
    uint64_t v8 = type metadata accessor for Date();
    int v51 = &v48;
    uint64_t v9 = *(void *)(v8 - 8);
    uint64_t v10 = *(void *)(v9 + 64);
    ((void (*)(void))__chkstk_darwin)();
    unint64_t v11 = (v10 + 15) & 0xFFFFFFFFFFFFFFF0;
    id v12 = *(id *)&v7;
    id v52 = v6;
    id v13 = [v6 fileModificationDate];
    sub_100018654(&qword_100028EA8);
    uint64_t v14 = ((uint64_t (*)(void))__chkstk_darwin)();
    __int16 v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v13)
    {
      size_t v50 = (char *)&v48 - v11;
      __chkstk_darwin(v14);
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      int v17 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v17(v16, (char *)&v48 - v11, v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v16, 0, 1, v8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v16, 1, v8) != 1)
      {
        __int16 v18 = v50;
        v17(v50, v16, v8);
        int v19 = v18;
        uint64_t v20 = Date.timeIntervalSinceNow.getter();
        if (qword_100028F50 != -1)
        {
          double v49 = v21;
          uint64_t v20 = swift_once();
          double v21 = v49;
        }
        uint64_t v22 = v54;
        id v23 = v52;
        if (v21 < -*(double *)&qword_100028F90)
        {

          (*(void (**)(char *, uint64_t))(v9 + 8))(v19, v8);
          (*(void (**)(char *, uint64_t))(v22 + 8))(v53, v55);
          return 1;
        }
        __chkstk_darwin(v20);
        size_t v40 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v40, v19, v8);
        __int16 v41 = Logger.logObject.getter();
        os_log_type_t v42 = static os_log_type_t.default.getter();
        int v43 = v42;
        if (os_log_type_enabled(v41, v42))
        {
          LODWORD(v49) = v43;
          char v44 = (uint8_t *)swift_slowAlloc();
          uint64_t v48 = (uint64_t)&v48;
          uint64_t v45 = v44;
          *(_DWORD *)char v44 = 134217984;
          Date.timeIntervalSinceNow.getter();
          double v57 = v46 / 60.0 / 60.0;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          uint64_t v47 = *(void (**)(char *, uint64_t))(v9 + 8);
          v47(v40, v8);
          _os_log_impl((void *)&_mh_execute_header, v41, LOBYTE(v49), "Time since last TTR less than 24 hours. Last TTR %f hours ago", v45, 0xCu);
          swift_slowDealloc();
        }
        else
        {

          uint64_t v47 = *(void (**)(char *, uint64_t))(v9 + 8);
          v47(v40, v8);
        }
        v47(v19, v8);
        (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v55);
        return 0;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v16, 1, 1, v8);
    }
    sub_100019A0C((uint64_t)v16, &qword_100028EA8);
    uint64_t v36 = v53;
    uint64_t v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      __int16 v39 = (uint8_t *)swift_slowAlloc();
      double v57 = COERCE_DOUBLE(swift_slowAlloc());
      *(_DWORD *)__int16 v39 = 136315138;
      id v56 = (id)sub_1000191E4(0xD000000000000041, 0x80000001000227D0, (uint64_t *)&v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Failed to get modification date of %s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v36, v55);
  }
  else
  {
    id v25 = *(id *)&v57;
    double v26 = COERCE_DOUBLE(_convertNSErrorToError(_:)());

    swift_willThrow();
    double v57 = v26;
    swift_errorRetain();
    sub_100018654(&qword_100028E90);
    sub_100018698();
    if (swift_dynamicCast())
    {
      id v27 = v56;
      id v28 = [v56 code];

      if (v28 == (id)260)
      {
        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        swift_errorRelease();
        swift_errorRelease();
        return 1;
      }
    }
    swift_errorRelease();
    swift_errorRetain();
    swift_errorRetain();
    int v29 = Logger.logObject.getter();
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      int v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = swift_slowAlloc();
      uint64_t v55 = v0;
      int v33 = (double *)v32;
      *(_DWORD *)int v31 = 138412290;
      swift_errorRetain();
      int v34 = v3;
      double v35 = COERCE_DOUBLE(_swift_stdlib_bridgeErrorToNSError());
      double v57 = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *int v33 = v35;
      int v3 = v34;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Failed to get file attributes for last ttr time record with err: %@", v31, 0xCu);
      sub_100018654(&qword_100028EA0);
      swift_arrayDestroy();
      uint64_t v0 = v55;
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return 0;
}

uint64_t sub_100018654(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100018698()
{
  unint64_t result = qword_100028E98;
  if (!qword_100028E98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100028E98);
  }
  return result;
}

uint64_t sub_1000186D8()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  int v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init(subsystem:category:)();
  if (utimes("/private/var/mobile/Library/MemoryMaintenance/ane_abandonment_ttr", 0)
    && errno.getter() != 2)
  {
    double v7 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v15))
    {
      __int16 v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)__int16 v16 = 67109120;
      v18[3] = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v10 = "Update last Tap-To-Radar file failed with errno %d";
      unint64_t v11 = v7;
      os_log_type_t v12 = v15;
      id v13 = v16;
      uint32_t v14 = 8;
      goto LABEL_8;
    }
LABEL_9:

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  id v4 = [self defaultManager];
  NSString v5 = String._bridgeToObjectiveC()();
  unsigned __int8 v6 = [v4 createFileAtPath:v5 contents:0 attributes:0];

  if ((v6 & 1) == 0)
  {
    double v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      uint64_t v10 = "Failed to update last Tap-To-Radar file, could not create file";
      unint64_t v11 = v7;
      os_log_type_t v12 = v8;
      id v13 = v9;
      uint32_t v14 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, v13, v14);
      swift_slowDealloc();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001896C()
{
  uint64_t v0 = sub_100018654(&qword_100028EB0);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for TaskPriority();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_100019A0C((uint64_t)v2, &qword_100028EB0);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (*(void *)(v5 + 16))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v7 = v8;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
  }
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = &unk_100028EC0;
  *(void *)(v9 + 24) = v5;
  if (v7 | v6)
  {
    v11[0] = 0;
    v11[1] = 0;
    v11[2] = v6;
    v11[3] = v7;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_100018B98()
{
  return _swift_task_switch(sub_100018BB4, 0, 0);
}

uint64_t sub_100018BB4()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = swift_task_alloc();
  Logger.init(subsystem:category:)();
  uint64_t result = _CFCopySystemVersionDictionaryValue();
  if (result)
  {
    uint64_t v5 = (void *)result;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;

    if (&class metadata base offset for TapToRadarService) {
      BOOL v9 = &type metadata accessor for TapToRadarService == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9 || &type metadata for TapToRadarService == 0 || &nominal type descriptor for TapToRadarService == 0)
    {
      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v27 = v0;
      id v12 = [objc_allocWithZone((Class)RadarDraft) init];
      id v13 = objc_allocWithZone((Class)RadarComponent);
      NSString v14 = String._bridgeToObjectiveC()();
      NSString v15 = String._bridgeToObjectiveC()();
      id v16 = [v13 initWithName:v14 version:v15 identifier:1017196];

      [v12 setComponent:v16];
      _StringGuts.grow(_:)(54);
      v17._countAndFlagsBits = 91;
      v17._object = (void *)0xE100000000000000;
      String.append(_:)(v17);
      v18._countAndFlagsBits = v6;
      v18._object = v8;
      String.append(_:)(v18);
      swift_bridgeObjectRelease();
      v19._countAndFlagsBits = 0xD000000000000033;
      v19._object = (void *)0x8000000100022860;
      String.append(_:)(v19);
      NSString v20 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v12 setTitle:v20];

      [v12 setClassification:6];
      [v12 setReproducibility:5];
      NSString v21 = String._bridgeToObjectiveC()();
      [v12 setProblemDescription:v21];

      type metadata accessor for TapToRadarService();
      uint64_t v22 = (void *)static TapToRadarService.shared.getter();
      uint64_t v23 = swift_task_alloc();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v23, v3, v1);
      unint64_t v24 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
      uint64_t v25 = swift_allocObject();
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v25 + v24, v23, v1);
      TapToRadarService.createDraft(_:processName:displayReason:completion:)();

      swift_release();
      swift_task_dealloc();
      sub_1000186D8();

      uint64_t v0 = v27;
      (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v1);
    }
    swift_task_dealloc();
    double v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100019010(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000190EC;
  return v6(a1);
}

uint64_t sub_1000190EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000191E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000192B8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100019EC4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100019EC4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100019E74((uint64_t)v12);
  return v7;
}

uint64_t sub_1000192B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100019474(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_100019474(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001950C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000196EC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000196EC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001950C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_100019684(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100019684(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100018654(&qword_100028ED8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000196EC(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100018654(&qword_100028ED8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10001983C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100019874()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100019918;
  return _swift_task_switch(sub_100018BB4, 0, 0);
}

uint64_t sub_100019918()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100019A0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100018654(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100019A68()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100019AA0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  size_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *size_t v5 = v2;
  v5[1] = sub_100019918;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100028EC8 + dword_100028EC8);
  return v6(a1, v4);
}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

uint64_t sub_100019B68()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100019BF8(uint64_t a1)
{
  type metadata accessor for Logger();
  if (a1)
  {
    swift_errorRetain();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 138412290;
      swift_errorRetain();
      uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v5 = v9;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to launch Tap-To-Radar with error: %@", v4, 0xCu);
      sub_100018654(&qword_100028EA0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();

      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    oslog = Logger.logObject.getter();
    uint64_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, (os_log_type_t)v6))
    {
      int64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, (os_log_type_t)v6, "Successfully started Tap-To-Radar", v7, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100019E74(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100019EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void mm_swift_are_models_loaded(const void *a1)
{
}

uint64_t areModelsLoaded(callback:)(const void *a1)
{
  return sub_10001A644(a1, (uint64_t)&unk_1000257A8, (uint64_t)&unk_1000257D0, (uint64_t)&unk_100028EE8);
}

uint64_t sub_100019F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for Logger();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Query();
  v4[6] = v6;
  v4[7] = *(void *)(v6 - 8);
  v4[8] = swift_task_alloc();
  return _swift_task_switch(sub_10001A094, 0, 0);
}

uint64_t sub_10001A094()
{
  Query.init()();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10001A130;
  return Query.loadedAssets.getter();
}

uint64_t sub_10001A130(uint64_t a1)
{
  uint64_t v4 = (void *)*v2;
  v4[10] = v1;
  swift_task_dealloc();
  uint64_t v5 = v4[8];
  uint64_t v6 = v4[7];
  uint64_t v7 = v4[6];
  if (v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v8 = sub_10001A34C;
  }
  else
  {
    v4[11] = a1;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    uint64_t v8 = sub_10001A2B8;
  }
  return _swift_task_switch(v8, 0, 0);
}

uint64_t sub_10001A2B8()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = *(void *)(v0[11] + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10001A34C()
{
  Logger.init(subsystem:category:)();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to connect to modelmanagerd", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v7 = v0[2];
  uint64_t v6 = v0[3];

  (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10001A4B8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10001B1F0;
  return sub_100019F78((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_10001A54C(uint64_t a1)
{
  uint64_t v2 = sub_100018654(&qword_100028EB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void mm_swift_run_with_memory_maintenance_assertion(const void *a1)
{
}

void sub_10001A5C4(const void *a1, void (*a2)(void))
{
  uint64_t v3 = _Block_copy(a1);
  a2();

  _Block_release(v3);
}

uint64_t runWithMemoryMaintenanceAssertion(block:)(const void *a1)
{
  return sub_10001A644(a1, (uint64_t)&unk_1000257F8, (uint64_t)&unk_100025820, (uint64_t)&unk_100028F00);
}

uint64_t sub_10001A644(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100018654(&qword_100028EB0);
  __chkstk_darwin();
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a1);
  uint64_t v9 = type metadata accessor for TaskPriority();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v7, 1, 1, v9);
  size_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  void v11[4] = v8;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) == 1)
  {
    sub_10001A54C((uint64_t)v7);
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    if (v11[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v13 = v14;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
  }
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a4;
  *(void *)(v15 + 24) = v11;
  if (v13 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v17[2] = v12;
    v17[3] = v13;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_10001A870(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a4;
  uint64_t v5 = type metadata accessor for Logger();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_10001A930, 0, 0);
}

uint64_t sub_10001A930()
{
  Logger.init(subsystem:category:)();
  type metadata accessor for Assertion();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10001AA34;
  return Assertion.__allocating_init(policy:description:)(0xD000000000000011, 0x8000000100022C20, 0xD000000000000031, 0x8000000100022C40);
}

uint64_t sub_10001AA34(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 96) = a1;
  *(void *)(v3 + 104) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10001ADF4;
  }
  else {
    uint64_t v4 = sub_10001AB48;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10001AB48()
{
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Acquired MemoryMaintenance assertion in modelmanagerd", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = *(void *)(v0 + 56);

  (*(void (**)(uint64_t))(v4 + 16))(v4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_10001AC68;
  return Assertion.invalidate()();
}

uint64_t sub_10001AC68()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10001AD64, 0, 0);
}

uint64_t sub_10001AD64()
{
  uint64_t v2 = v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = v0[8];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10001ADF4()
{
  uint64_t v15 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v11 = v0[9];
    uint64_t v12 = v0[8];
    uint64_t v13 = v0[10];
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_getErrorValue();
    uint64_t v4 = Error.localizedDescription.getter();
    v0[6] = sub_1000191E4(v4, v5, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to acquire MemoryMaintenance assertion in modelmanagerd: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v12);
  }
  else
  {
    uint64_t v7 = v0[9];
    uint64_t v6 = v0[10];
    uint64_t v8 = v0[8];
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  }
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10001B028(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10001B1F0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100028EC8 + dword_100028EC8);
  return v6(a1, v4);
}

uint64_t sub_10001B0E4()
{
  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001B124()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_100019918;
  return sub_10001A870((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_10001B1B8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

util::MappedFile *util::MappedFile::MappedFile(util::MappedFile *this, const char *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  int v3 = open(a2, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = v3;
    if (!fstat(v3, &v10))
    {
      st_std::string::size_type size = v10.st_size;
      if ((v10.st_mode & 0xF000) == 0x8000 && v10.st_size > 0)
      {
        *((void *)this + 1) = v10.st_size;
        uint64_t v7 = mmap(0, st_size, 1, 1, v4, 0);
        if (v7 == (void *)-1) {
          uint64_t v8 = 0;
        }
        else {
          uint64_t v8 = v7;
        }
        *(void *)this = v8;
      }
    }
    close(v4);
  }
  return this;
}

void util::MappedFile::~MappedFile(util::MappedFile *this)
{
  uint64_t v2 = *(void **)this;
  if (v2) {
    munmap(v2, *((void *)this + 1));
  }
}

void *util::stringprintf@<X0>(util *this@<X0>, void *a2@<X8>, ...)
{
  va_start(va, a2);
  vsnprintf(__str, 0x400uLL, (const char *)this, va);
  return sub_1000094DC(a2, __str);
}

void sub_10001B348()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error: failed (kr != KERN_SUCCESS)", v2, v3, v4, v5, v6);
}

void sub_10001B37C()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error: failed (kr == KERN_SUCCESS)", v2, v3, v4, v5, v6);
}

void sub_10001B3B0()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error: failed (info.zone_names_count == info.zone_info_count)", v2, v3, v4, v5, v6);
}

void sub_10001B3E4()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error: failed (tag_to_bundle_info != NULL)", v2, v3, v4, v5, v6);
}

void sub_10001B418()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error: failed (kext_info != NULL)", v2, v3, v4, v5, v6);
}

void sub_10001B44C(unsigned char *a1, unsigned char *a2)
{
  sub_1000055E8(a1, a2);
  sub_1000055F8((void *)&_mh_execute_header, v2, v3, "Error: failed (vm_name != NULL)", v4);
}

void sub_10001B478(unsigned char *a1, unsigned char *a2)
{
  sub_1000055E8(a1, a2);
  sub_1000055F8((void *)&_mh_execute_header, v2, v3, "Error: failed (bundle_id != NULL)", v4);
}

void sub_10001B4A4(unsigned char *a1, unsigned char *a2)
{
  sub_1000055E8(a1, a2);
  sub_1000055F8((void *)&_mh_execute_header, v2, v3, "Error: failed (! CSIsNull(symbol))", v4);
}

void sub_10001B4D0()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100008CA4();
  sub_100008C78((void *)&_mh_execute_header, v1, v2, "memorystatus_control request for on demand snapshot failed: %s", v3, v4, v5, v6, v7);
}

void sub_10001B550()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "memorystatus_control request for on demand snapshot returned snapshot size of 0", v2, v3, v4, v5, v6);
}

void sub_10001B584()
{
  sub_100008C98();
  sub_100008C5C((void *)&_mh_execute_header, v0, v1, "memorystatus_control request for on demand snapshot returned snapshot size %d, which is too small to be valid", v2, v3, v4, v5, v6);
}

void sub_10001B5EC()
{
  sub_100008C98();
  sub_100008C5C((void *)&_mh_execute_header, v0, v1, "memorystatus_control request for on demand snapshot returned snapshot size %d, which is not a valid struct size multiple", v2, v3, v4, v5, v6);
}

void sub_10001B654()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error: failed (ret >= 0)", v2, v3, v4, v5, v6);
}

void sub_10001B688()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error: failed (neural_ledger_index > -1)", v2, v3, v4, v5, v6);
}

void sub_10001B6BC()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error: failed (dispatch_ret >= 0)", v2, v3, v4, v5, v6);
}

void sub_10001B6F0()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "current time got back in time", v2, v3, v4, v5, v6);
}

void sub_10001B724()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "gettimeofday failed", v2, v3, v4, v5, v6);
}

void sub_10001B758()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100008CB0();
  sub_100008CC4((void *)&_mh_execute_header, v1, v2, "stat on %s returned %s", v3, v4, v5, v6, 2u);
}

void sub_10001B7E4()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100008CB0();
  sub_100008CC4((void *)&_mh_execute_header, v1, v2, "stat on %s returned %s\n", v3, v4, v5, v6, 2u);
}

void sub_10001B870()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "could not open or create sysstatus should check file", v2, v3, v4, v5, v6);
}

void sub_10001B8A4()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "could not close reboot time file", v2, v3, v4, v5, v6);
}

void sub_10001B8D8()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Corrupt system hwm state file", v2, v3, v4, v5, v6);
}

void sub_10001B90C()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100008CA4();
  sub_100008C78((void *)&_mh_execute_header, v1, v2, "Failed to remove system hwm state file: %s", v3, v4, v5, v6, v7);
}

void sub_10001B98C()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "could not open reboot time file", v2, v3, v4, v5, v6);
}

void sub_10001B9C0()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "could not create reboot log once per boot file", v2, v3, v4, v5, v6);
}

void sub_10001B9F4()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Failed to write SystemMemoryReset report", v2, v3, v4, v5, v6);
}

void sub_10001BA28()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "could not close reboot log once per boot file", v2, v3, v4, v5, v6);
}

void sub_10001BA5C(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "utimes returned %d", (uint8_t *)v3, 8u);
}

void sub_10001BAEC()
{
  sub_100008C98();
  sub_100008C5C((void *)&_mh_execute_header, v0, v1, "Failed to set kern.darkboot: %d", v2, v3, v4, v5, v6);
}

void sub_10001BB54()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Unable to retrieve processes size for retrieving SpringBoard PID", v2, v3, v4, v5, v6);
}

void sub_10001BB88(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "sysctl for retrieving all processes returned a size of %ld", (uint8_t *)&v1, 0xCu);
}

void sub_10001BC04()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "could not allocate memory for the processes buffer", v2, v3, v4, v5, v6);
}

void sub_10001BC38()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Unable to retrieve processes list", v2, v3, v4, v5, v6);
}

void sub_10001BC6C()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Got empty process list", v2, v3, v4, v5, v6);
}

void sub_10001BCA0()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Could not find Springboard. Bailing out", v2, v3, v4, v5, v6);
}

void sub_10001BCD4()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Unable to get SpringBoard memlimit properties", v2, v3, v4, v5, v6);
}

void sub_10001BD08()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Unable to restore SpringBoard's original memory limits", v2, v3, v4, v5, v6);
}

void sub_10001BD3C()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Could not find SpringBoard watchdog port", v2, v3, v4, v5, v6);
}

void sub_10001BD70(NSObject *a1, void *a2)
{
  uint64_t v4 = __error();
  strerror(*v4);
  sub_100008CA4();
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Unable to set temp hard memory limits on SpringBoard: %s", v5, 0xCu);
  *a2 = qword_100028F80;
}

void sub_10001BE14()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Unable to retrieve vm statistics after compressor sweep", v2, v3, v4, v5, v6);
}

void sub_10001BE48()
{
  uint64_t v0 = __error();
  strerror(*v0);
  sub_100008CA4();
  sub_100008C78((void *)&_mh_execute_header, v1, v2, "Unable to perform compressor sweep: %s", v3, v4, v5, v6, v7);
}

void sub_10001BEC8()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Unable to retrieve vm statistics before compressor sweep", v2, v3, v4, v5, v6);
}

void sub_10001BEFC()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error calling mach_memory_info", v2, v3, v4, v5, v6);
}

void sub_10001BF30()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error collecting vm region information", v2, v3, v4, v5, v6);
}

void sub_10001BF64()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Error collecting zone information", v2, v3, v4, v5, v6);
}

void sub_10001BF98()
{
  sub_100008C98();
  sub_100008C5C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to log error, message not from kernel: audit_pid %d", v1, v2, v3, v4, v5);
}

void sub_10001C008()
{
  _os_assumes_log();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v0 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set context for inbound notifications on the mach port", v0, 2u);
  }
}

void sub_10001C06C()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Could not open reboot log file", v2, v3, v4, v5, v6);
}

void sub_10001C0A0()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Failed to write SystemMemoryReset report for KHWM reboot", v2, v3, v4, v5, v6);
}

void sub_10001C0D4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Read KHWM reboot file, wired_memory_pages=%llu", (uint8_t *)&v3, 0xCu);
}

void sub_10001C150()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Could not write reboot count", v2, v3, v4, v5, v6);
}

void sub_10001C184()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Failed to remove /var/mobile/Library/Logs/khwm.log", v2, v3, v4, v5, v6);
}

void sub_10001C1B8()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Failed to read from reboot log file", v2, v3, v4, v5, v6);
}

void sub_10001C1EC()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Could not get a jetsam snapshot", v2, v3, v4, v5, v6);
}

void sub_10001C220()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Could not set the status to DEFER", v2, v3, v4, v5, v6);
}

void sub_10001C254()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Unable to acquire mach service port, exiting", v2, v3, v4, v5, v6);
}

void sub_10001C288()
{
  xpc_dictionary_get_string(&_xpc_error_connection_invalid, _xpc_error_key_description);
  sub_100008C78((void *)&_mh_execute_header, v0, v1, "Top level listener XPC_ERROR_CONNECTION_INVALID: %s", v2, v3, v4, v5, 2u);
}

void sub_10001C318()
{
  xpc_dictionary_get_string(&_xpc_error_termination_imminent, _xpc_error_key_description);
  sub_100008C78((void *)&_mh_execute_header, v0, v1, "Top level listener XPC_ERROR_TERMINATION_IMMINENT: %s", v2, v3, v4, v5, 2u);
}

void sub_10001C3A8(void *a1)
{
  xpc_dictionary_get_string(a1, _xpc_error_key_description);
  sub_100008C78((void *)&_mh_execute_header, v1, v2, "Top level listener error: %s", v3, v4, v5, v6, 2u);
}

void sub_10001C430()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Top level event: Unhandled xpc type", v2, v3, v4, v5, v6);
}

void sub_10001C464()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Could not get current pressure level", v2, v3, v4, v5, v6);
}

void sub_10001C498()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Could not get current jetsam snapshot", v2, v3, v4, v5, v6);
}

void sub_10001C4CC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Warning: writing user hwm state while a system hwm state file exists", v0, 2u);
}

void sub_10001C514()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "pressure: could not retrieve memory size", v2, v3, v4, v5, v6);
}

void sub_10001C548()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "no kext info", v2, v3, v4, v5, v6);
}

void sub_10001C57C()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "kext not found", v2, v3, v4, v5, v6);
}

void sub_10001C5B0()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "pressure: could not retrieve collectable bytes", v2, v3, v4, v5, v6);
}

void sub_10001C5E4()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "pressure: could not retrieve zone memory info", v2, v3, v4, v5, v6);
}

void sub_10001C618()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "pressure: could not retrieve memory level", v2, v3, v4, v5, v6);
}

uint64_t sub_10001C64C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void sub_10001C670(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1 + 100;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "database %s is corrupted", (uint8_t *)&v2, 0xCu);
}

void sub_10001C6EC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to recreate database file after deletion, rc: %d", (uint8_t *)v2, 8u);
}

void sub_10001C764(uint64_t a1, NSObject *a2)
{
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to remove %s, errno: %d", (uint8_t *)&v5, 0x12u);
}

void sub_10001C804(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1 + 100;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to close connection to %s, rc: %d", (uint8_t *)&v3, 0x12u);
}

void sub_10001C890(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "One of the prepared statement preparations failed, combined rc: %d", (uint8_t *)v2, 8u);
}

void sub_10001C908(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001C98C(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "initialize";
  __int16 v5 = 2080;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: failed to open database %s, rc: %d", (uint8_t *)&v3, 0x1Cu);
}

void sub_10001CA28()
{
  sub_100016FB0();
  sub_100016FC4((void *)&_mh_execute_header, v0, v1, "%s: failed with rc=%d", v2, v3, v4, v5, 2u);
}

void sub_10001CA9C()
{
  sub_100016FB0();
  sub_100016FC4((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step(stmt_ue_preceded_by_ce_count) returned %d", v2, v3, v4, v5, 2u);
}

void sub_10001CB10()
{
  sub_100016FB0();
  sub_100016FC4((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
}

void sub_10001CB84()
{
  sub_100016FB0();
  sub_100016FC4((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
}

void sub_10001CBF8()
{
  sub_100016FB0();
  sub_100016FC4((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
}

void sub_10001CC6C()
{
  sub_100016FB0();
  sub_100016FC4((void *)&_mh_execute_header, v0, v1, "%s: sqlite3_step returned %d", v2, v3, v4, v5, 2u);
}

void sub_10001CCE0(uint64_t a1, NSObject *a2)
{
  int v4 = *__error();
  int v5 = 136315650;
  uint64_t v6 = "regenerate_retired_pages";
  __int16 v7 = 2080;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Cannot open database file %s, errno %d", (uint8_t *)&v5, 0x1Cu);
}

void sub_10001CD94(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to open iodevicetree to read %s", (uint8_t *)&v2, 0xCu);
}

void sub_10001CE0C()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "CFStringCreateWithCString failed", v2, v3, v4, v5, v6);
}

void sub_10001CE40()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Incorrect valueRef's length", v2, v3, v4, v5, v6);
}

void sub_10001CE74()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Retired database is corrupt. Regenerating it.", v2, v3, v4, v5, v6);
}

void sub_10001CEA8()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "Database directory doesn't exist.", v2, v3, v4, v5, v6);
}

void sub_10001CEDC()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "error calling mach_memory_info", v2, v3, v4, v5, v6);
}

void sub_10001CF10()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "No ANE tag found", v2, v3, v4, v5, v6);
}

void sub_10001CF44()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "modelmanagerd model count query timeout, skipping ane abandonment check", v2, v3, v4, v5, v6);
}

void sub_10001CF78(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "is_model_loaded callback recieved %d", (uint8_t *)v2, 8u);
}

void sub_10001CFF0()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "modelmanagerd timeout in aquiring assertion, skipping ane abandonment check", v2, v3, v4, v5, v6);
}

void sub_10001D024()
{
  sub_1000055DC();
  sub_1000055C0((void *)&_mh_execute_header, v0, v1, "failed to lookup pid of modelmanagerd", v2, v3, v4, v5, v6);
}

void sub_10001D058(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1 - 1073741825;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ANE memory usage remained over threshold by %lld bytes", (uint8_t *)&v2, 0xCu);
}

void sub_10001D0D8(int a1, NSObject *a2)
{
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "terminate_with_reason failed with status = %d and errno %d", (uint8_t *)v5, 0xEu);
}

void sub_10001D178(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1 - 1073741825;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ANE memory usage above abandonment threshold by %lld bytes, killing modelmanagerd (%d)", (uint8_t *)&v3, 0x12u);
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t TapToRadarService.createDraft(_:processName:displayReason:completion:)()
{
  return TapToRadarService.createDraft(_:processName:displayReason:completion:)();
}

uint64_t static TapToRadarService.shared.getter()
{
  return static TapToRadarService.shared.getter();
}

uint64_t type metadata accessor for TapToRadarService()
{
  return type metadata accessor for TapToRadarService();
}

uint64_t Query.init()()
{
  return Query.init()();
}

uint64_t type metadata accessor for Query()
{
  return type metadata accessor for Query();
}

uint64_t type metadata accessor for Assertion()
{
  return type metadata accessor for Assertion();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t errno.getter()
{
  return errno.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

uint64_t CSIsNull()
{
  return _CSIsNull();
}

uint64_t CSRelease()
{
  return _CSRelease();
}

uint64_t CSSymbolGetName()
{
  return _CSSymbolGetName();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return _CSSymbolicatorCreateWithMachKernel();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return _CSSymbolicatorGetSymbolWithAddressAtTime();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

uint64_t KRExperimentsHandleUpdate()
{
  return _KRExperimentsHandleUpdate();
}

uint64_t KRExperimentsInit()
{
  return _KRExperimentsInit();
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return _OSKextCopyLoadedKextInfo();
}

uint64_t SBGetIsAlive()
{
  return _SBGetIsAlive();
}

uint64_t WriteSystemMemoryResetReport()
{
  return _WriteSystemMemoryResetReport();
}

uint64_t WriteSystemMemoryResetReportWithPids()
{
  return _WriteSystemMemoryResetReportWithPids();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return __CFCopySystemVersionDictionaryValue();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return std::locale::name(retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return std::regex_error::regex_error(this, __ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return std::__get_classname(__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return std::__get_collation_name(retstr, __s);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return std::__fs::filesystem::__status(a1, __ec);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return std::locale::locale(this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return std::locale::locale(this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

uint64_t analytics_is_event_used()
{
  return _analytics_is_event_used();
}

uint64_t analytics_send_event()
{
  return _analytics_send_event();
}

uint64_t analytics_send_event_lazy()
{
  return _analytics_send_event_lazy();
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

double difftime(time_t a1, time_t a2)
{
  return _difftime(a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return _fdopen(a1, a2);
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return _fgets(a1, a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return _fscanf(a1, a2);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return _ftell(a1);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

kern_return_t host_get_special_port(host_priv_t host_priv, int node, int which, mach_port_t *port)
{
  return _host_get_special_port(host_priv, node, which, port);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return _host_statistics64(host_priv, flavor, host_info64_out, host_info64_outCnt);
}

uint64_t ledger()
{
  return _ledger();
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

kern_return_t mach_memory_info(mach_port_t host, mach_zone_name_array_t *names, mach_msg_type_number_t *namesCnt, mach_zone_info_array_t *info, mach_msg_type_number_t *infoCnt, mach_memory_info_array_t *memory_info, mach_msg_type_number_t *memory_infoCnt)
{
  return _mach_memory_info(host, names, namesCnt, info, infoCnt, memory_info, memory_infoCnt);
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server_once(a1, a2, a3, a4);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t pid_hibernate()
{
  return _pid_hibernate();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t reboot3()
{
  return _reboot3();
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

void rewind(FILE *a1)
{
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return _sqlite3_bind_null(a1, a2);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return _sqlite3_reset(pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

void sync(void)
{
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return _task_get_special_port(task, which_port, special_port);
}

uint64_t terminate_with_reason()
{
  return _terminate_with_reason();
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return _utimes(a1, a2);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

uint64_t vproc_swap_integer()
{
  return _vproc_swap_integer();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_create_from_plist()
{
  return _xpc_create_from_plist();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

xpc_object_t xpc_string_create_with_format(const char *fmt, ...)
{
  return _xpc_string_create_with_format(fmt);
}