uint64_t NEHelperIsOSFeatureEnabled()
{
  return MEMORY[0x270ED8070]("NetworkExtension", "DisableCheckBlockedHostnames");
}

void NEHelperTrackerFreeAppInfo(void *a1)
{
  if (a1) {
    free(a1);
  }
}

BOOL NEHelperTrackerAppInfoSetAuditToken(uint64_t a1, long long *a2, long long *a3)
{
  if (a1)
  {
    long long v3 = *a2;
    *(_OWORD *)(a1 + 24) = a2[1];
    *(_OWORD *)(a1 + 8) = v3;
    long long v4 = *a3;
    *(_OWORD *)(a1 + 88) = a3[1];
    *(_OWORD *)(a1 + 72) = v4;
  }
  return a1 != 0;
}

CFMutableDictionaryRef __NEHelperIsHostnameDesignatedTrackerExternal_block_invoke()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  pid_t v0 = getpid();
  xpc_object_t v1 = ne_copy_signing_identifier_for_pid_with_audit_token(v0, 0);
  if (v1 && (v2 = v1, MEMORY[0x2166885F0]() == MEMORY[0x263EF8798]))
  {
    string_ptr = xpc_string_get_string_ptr(v2);
    if (string_ptr)
    {
      NEHelperIsHostnameDesignatedTrackerExternal_skip_daemon = strcmp(string_ptr, "com.apple.cloudd") == 0;
    }
    else
    {
      v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7[0]) = 0;
        _os_log_error_impl(&dword_212970000, v5, OS_LOG_TYPE_ERROR, "Failed to get a string pointer from the current signing identifier", (uint8_t *)v7, 2u);
      }
    }
    xpc_release(v2);
  }
  else
  {
    long long v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = getpid();
      _os_log_error_impl(&dword_212970000, v3, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier for %d", (uint8_t *)v7, 8u);
    }
  }
  g_tracker_cache = 128;
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 128, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  qword_26AB0F880 = 0;
  *(void *)&algn_26AB0F86C[4] = result;
  *(_DWORD *)&algn_26AB0F86C[12] = 0;
  qword_26AB0F888 = (uint64_t)&qword_26AB0F880;
  return result;
}

double NEHelperTrackerGetAppInfo()
{
  pid_t v0 = malloc_type_malloc(0x80uLL, 0x1050040CA3BB8F4uLL);
  if (v0)
  {
    double result = 0.0;
    v0[6] = 0u;
    v0[7] = 0u;
    v0[4] = 0u;
    v0[5] = 0u;
    v0[2] = 0u;
    v0[3] = 0u;
    *pid_t v0 = 0u;
    v0[1] = 0u;
  }
  return result;
}

void NETrackerInsertTCCCache(char *a1, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)key = 0u;
  long long v10 = 0u;
  NETrackerGenerateTCCCacheKey(a1, key, 0x80uLL);
  if (a2) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = 2;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&g_tcc_cache_lock);
  uint64_t v4 = MEMORY[0x263EF8708];
  if (g_tcc_cache && MEMORY[0x2166885F0]() == v4)
  {
    if (!g_tcc_cache) {
      goto LABEL_12;
    }
  }
  else
  {
    g_tcc_cache = (uint64_t)xpc_dictionary_create(0, 0, 0);
    if (!g_tcc_cache) {
      goto LABEL_12;
    }
  }
  if (MEMORY[0x2166885F0]() == v4 && !xpc_dictionary_get_int64((xpc_object_t)g_tcc_cache, key)) {
    xpc_dictionary_set_int64((xpc_object_t)g_tcc_cache, key, v3);
  }
LABEL_12:
  os_unfair_lock_unlock((os_unfair_lock_t)&g_tcc_cache_lock);
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    __int16 v7 = 2080;
    uint64_t v8 = key;
    _os_log_debug_impl(&dword_212970000, v5, OS_LOG_TYPE_DEBUG, "NETrackerInsertTCCCache(): (%d) for bundle: (%s)", (uint8_t *)v6, 0x12u);
  }
}

uint64_t NEHelperIsTCCTrackingAllowed(uint64_t a1)
{
  int v2 = NETrackerCheckTCCCache((char *)a1);
  if (v2 == 1) {
    return 1;
  }
  if (v2 == 2) {
    return 0;
  }
  if (a1)
  {
    if (*(void *)(a1 + 8))
    {
      int v3 = TCCAccessPreflightWithAuditToken();
      goto LABEL_8;
    }
    NETrackerInsertTCCCache((char *)a1, 0);
    return 0;
  }
  int v3 = TCCAccessPreflight();
LABEL_8:
  BOOL v4 = v3 == 0;
  if (v3 != 2) {
    NETrackerInsertTCCCache((char *)a1, v3 == 0);
  }
  return v4;
}

uint64_t NETrackerCheckTCCCache(char *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)key = 0u;
  long long v9 = 0u;
  NETrackerGenerateTCCCacheKey(a1, key, 0x80uLL);
  os_unfair_lock_lock((os_unfair_lock_t)&g_tcc_cache_lock);
  if (g_tcc_cache && MEMORY[0x2166885F0]() == MEMORY[0x263EF8708]) {
    int64_t int64 = xpc_dictionary_get_int64((xpc_object_t)g_tcc_cache, key);
  }
  else {
    int64_t int64 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&g_tcc_cache_lock);
  int v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 134218242;
    int64_t v5 = int64;
    __int16 v6 = 2080;
    __int16 v7 = key;
    _os_log_debug_impl(&dword_212970000, v2, OS_LOG_TYPE_DEBUG, "NETrackerCheckTCCCache(): (%lld) for bundle: (%s)", (uint8_t *)&v4, 0x16u);
  }
  if ((unint64_t)(int64 - 1) >= 2) {
    return 0;
  }
  else {
    return int64;
  }
}

char *NETrackerGenerateTCCCacheKey(char *result, char *__dst, size_t __size)
{
  if (result)
  {
    int v3 = (_DWORD *)*((void *)result + 1);
    if (v3) {
      return (char *)snprintf(__dst, __size, "%x-%x-%x-%x-%x-%x-%x-%x", *v3, v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
    }
  }
  else
  {
    int64_t v5 = (const char *)TCC_CACHE_INTHEAPP_KEY;
    return strncpy(__dst, v5, __size);
  }
  return result;
}

__CFBundle *NEHelperIsHostnameDesignatedTracker(__CFBundle *result)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (result)
  {
    xpc_object_t v1 = (const char *)result;
    double result = CFBundleGetMainBundle();
    if (result)
    {
      double result = (__CFBundle *)CFBundleGetValueForInfoDictionaryKey(result, @"NSPrivacyTrackingDomains");
      if (result)
      {
        CFArrayRef v2 = result;
        CFIndex Count = CFArrayGetCount(result);
        if (Count < 1)
        {
          return 0;
        }
        else
        {
          CFIndex v4 = Count;
          CFIndex v5 = 0;
          while (1)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, v5);
            memset(v17, 0, 255);
            CFStringGetCString(ValueAtIndex, (char *)v17, 255, 0x8000100u);
            size_t v7 = strlen(v1);
            if (v7) {
              uint64_t v8 = v1[v7 - 1] == 46 ? v7 - 1 : v7;
            }
            else {
              uint64_t v8 = 0;
            }
            size_t v9 = strlen((const char *)v17);
            if (v9)
            {
              uint64_t v10 = *((unsigned char *)v17 + v9 - 1) == 46 ? v9 - 1 : v9;
              BOOL v11 = !v10 || v8 == 0;
              if (!v11 && v8 >= v10)
              {
                while (1)
                {
                  uint64_t v13 = v8 - 1;
                  if (v8 < 1) {
                    break;
                  }
                  uint64_t v14 = v10 - 1;
                  if (v10 < 1) {
                    break;
                  }
                  int v15 = v1[v8 - 1];
                  int v16 = *((unsigned __int8 *)v17 + v10 - 1);
                  --v8;
                  --v10;
                  if (v15 != v16)
                  {
                    uint64_t v8 = v13;
                    uint64_t v10 = v14;
                    if ((v16 ^ v15) != 0x20) {
                      goto LABEL_30;
                    }
                  }
                }
                if (v8 == v10 || v8 >= 1 && v1[v13] == 46) {
                  return (__CFBundle *)1;
                }
              }
            }
LABEL_30:
            if (++v5 == v4) {
              return 0;
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL NEHelperIsBundle()
{
  MainBundle = CFBundleGetMainBundle();
  return CFBundleGetIdentifier(MainBundle) != 0;
}

uint64_t NEHelperIsHostnameDesignatedTrackerExternal(const char *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v106 = *MEMORY[0x263EF8340];
  if (!a1 || !a2) {
    return v2;
  }
  if (NEHelperIsHostnameDesignatedTrackerExternal_onceToken != -1) {
    dispatch_once(&NEHelperIsHostnameDesignatedTrackerExternal_onceToken, &__block_literal_global_22);
  }
  if (NEHelperIsHostnameDesignatedTrackerExternal_skip_daemon)
  {
    CFIndex v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    *(_WORD *)buf = 0;
    __int16 v6 = "Skipping external tracker check from system daemon";
    size_t v7 = buf;
    goto LABEL_8;
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  *(_OWORD *)buf = 0u;
  long long v91 = 0u;
  uint64_t v10 = *(const char **)a2;
  if (!*(void *)a2)
  {
    CFStringRef v11 = (const __CFString *)NECopySigningIdentifierForPIDwithAuditToken(*(_DWORD *)(a2 + 24), *(void *)(a2 + 8));
    if (!v11)
    {
      CFIndex v5 = ne_log_obj();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        return 0;
      }
      *(_WORD *)buffer = 0;
      __int16 v6 = "NEHelperIsHostnameDesignatedTrackerExternal(): cannot obtain signing identifier. returning ne_tracker_status_none.";
      size_t v7 = (uint8_t *)buffer;
LABEL_8:
      uint64_t v8 = v5;
      uint32_t v9 = 2;
LABEL_9:
      _os_log_debug_impl(&dword_212970000, v8, OS_LOG_TYPE_DEBUG, v6, v7, v9);
      return 0;
    }
    CFStringRef v12 = v11;
    CFStringGetCString(v11, NEHelperIsHostnameDesignatedTrackerExternal_buffer, 254, 0x600u);
    CFRelease(v12);
    int v13 = *(_DWORD *)(a2 + 24);
    if (!v13)
    {
      uint64_t v14 = *(void *)(a2 + 8);
      if (v14) {
        int v13 = *(_DWORD *)(v14 + 20);
      }
      else {
        int v13 = 0;
      }
    }
    proc_name(v13, buf, 0x100u);
    uint64_t v10 = NEHelperIsHostnameDesignatedTrackerExternal_buffer;
  }
  int v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buffer = 136315138;
    *(void *)&buffer[4] = v10;
    _os_log_debug_impl(&dword_212970000, v15, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): obtained signing identifier: (%s)", (uint8_t *)buffer, 0xCu);
  }
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, 0x600u);
  uint64_t v18 = NEHelperTrackerCacheGet((os_unfair_lock_s *)&g_tracker_cache, v17);
  if (v18)
  {
    CFArrayRef v19 = (const __CFArray *)v18;
    CFIndex Count = CFArrayGetCount((CFArrayRef)v18);
    if (Count < 1)
    {
      int v34 = 0;
    }
    else
    {
      CFIndex v21 = Count;
      CFIndex v22 = 0;
      while (1)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v19, v22);
        long long v88 = 0u;
        memset(v89, 0, sizeof(v89));
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v77 = 0u;
        memset(buffer, 0, sizeof(buffer));
        CFStringGetCString(ValueAtIndex, buffer, 253, 0x8000100u);
        size_t v24 = strlen(a1);
        if (v24) {
          uint64_t v25 = a1[v24 - 1] == 46 ? v24 - 1 : v24;
        }
        else {
          uint64_t v25 = 0;
        }
        size_t v26 = strlen(buffer);
        if (v26)
        {
          uint64_t v27 = buffer[v26 - 1] == 46 ? v26 - 1 : v26;
          BOOL v28 = !v27 || v25 == 0;
          if (!v28 && v25 >= v27)
          {
            while (1)
            {
              uint64_t v30 = v25 - 1;
              if (v25 < 1) {
                break;
              }
              uint64_t v31 = v27 - 1;
              if (v27 < 1) {
                break;
              }
              int v32 = a1[v25 - 1];
              int v33 = buffer[v27 - 1];
              --v25;
              --v27;
              if (v32 != v33)
              {
                uint64_t v25 = v30;
                uint64_t v27 = v31;
                if ((v33 ^ v32) != 0x20) {
                  goto LABEL_48;
                }
              }
            }
            if (v25 == v27 || v25 >= 1 && a1[v30] == 46) {
              break;
            }
          }
        }
LABEL_48:
        if (++v22 == v21)
        {
          int v34 = 0;
          goto LABEL_93;
        }
      }
      v69 = ne_log_obj();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v72 = 136380931;
        v73 = a1;
        __int16 v74 = 2081;
        v75 = buffer;
        _os_log_debug_impl(&dword_212970000, v69, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): found subdomain in cache. (%{private}s) is a subdomain of tracker domain (%{private}s)", v72, 0x16u);
      }
      int v34 = 1;
    }
  }
  else
  {
    theArray = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
    AppTrackerDomains = (void *)NEHelperGetAppTrackerDomains();
    if (AppTrackerDomains)
    {
      v36 = AppTrackerDomains;
      v70 = v10;
      size_t v37 = xpc_array_get_count(AppTrackerDomains);
      if (v37)
      {
        size_t v38 = v37;
        size_t v39 = 0;
        char v40 = 0;
        do
        {
          xpc_object_t value = xpc_array_get_value(v36, v39);
          string_ptr = xpc_string_get_string_ptr(value);
          if (string_ptr)
          {
            v43 = string_ptr;
            if ((v40 & 1) == 0)
            {
              size_t v44 = strlen(a1);
              if (v44) {
                uint64_t v45 = a1[v44 - 1] == 46 ? v44 - 1 : v44;
              }
              else {
                uint64_t v45 = 0;
              }
              size_t v46 = strlen(v43);
              if (v46)
              {
                uint64_t v47 = v43[v46 - 1] == 46 ? v46 - 1 : v46;
                BOOL v48 = !v47 || v45 == 0;
                if (!v48 && v45 >= v47)
                {
                  while (1)
                  {
                    uint64_t v50 = v45 - 1;
                    if (v45 < 1) {
                      break;
                    }
                    uint64_t v51 = v47 - 1;
                    if (v47 < 1) {
                      break;
                    }
                    int v52 = a1[v45 - 1];
                    int v53 = v43[v47 - 1];
                    --v45;
                    --v47;
                    if (v52 != v53)
                    {
                      uint64_t v45 = v50;
                      uint64_t v47 = v51;
                      if ((v53 ^ v52) != 0x20) {
                        goto LABEL_82;
                      }
                    }
                  }
                  if (v45 == v47 || v45 >= 1 && a1[v50] == 46)
                  {
                    v54 = ne_log_obj();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buffer = 136380931;
                      *(void *)&buffer[4] = a1;
                      *(_WORD *)&buffer[12] = 2081;
                      *(void *)&buffer[14] = v43;
                      _os_log_debug_impl(&dword_212970000, v54, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): found subdomain. (%{private}s) is a subdomain of tracker domain (%{private}s)", (uint8_t *)buffer, 0x16u);
                    }
                    char v40 = 1;
                  }
                }
              }
            }
LABEL_82:
            CFStringRef v55 = CFStringCreateWithCString(v16, v43, 0x600u);
            if (v55)
            {
              CFStringRef v56 = v55;
              CFArrayAppendValue(theArray, v55);
              CFRelease(v56);
            }
            else
            {
              v57 = ne_log_obj();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buffer = 136315138;
                *(void *)&buffer[4] = v70;
                _os_log_debug_impl(&dword_212970000, v57, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): unable to cache domain for bundle (%s)", (uint8_t *)buffer, 0xCu);
              }
            }
          }
          ++v39;
        }
        while (v39 != v38);
      }
      else
      {
        char v40 = 0;
      }
      xpc_release(v36);
      uint64_t v10 = v70;
    }
    else
    {
      char v40 = 0;
    }
    NEHelperTrackerCachePut((uint64_t)&g_tracker_cache, v17, (uint64_t)theArray);
    int v34 = v40 & 1;
  }
LABEL_93:
  CFRelease(v17);
  int v58 = *(_DWORD *)(a2 + 28);
  if (v58 == 2)
  {
    v60 = ne_log_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buffer = 0;
      _os_log_debug_impl(&dword_212970000, v60, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): previous_tcc_check_result is ne_tcc_result_denied", (uint8_t *)buffer, 2u);
    }
    int IsTCCTrackingAllowed = 0;
    goto LABEL_108;
  }
  if (!v58)
  {
    if (*(void *)(a2 + 8))
    {
      if (v34) {
        int IsTCCTrackingAllowed = NEHelperIsTCCTrackingAllowed(a2);
      }
      else {
        int IsTCCTrackingAllowed = 1;
      }
      v62 = ne_log_obj();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buffer = 0;
        _os_log_debug_impl(&dword_212970000, v62, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): previous_tcc_check_result is ne_tcc_result_not_performed and audit_token is set", (uint8_t *)buffer, 2u);
      }
      goto LABEL_108;
    }
    goto LABEL_102;
  }
  if (!*(void *)(a2 + 8))
  {
LABEL_102:
    v61 = ne_log_obj();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buffer = 0;
      _os_log_debug_impl(&dword_212970000, v61, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): context->audit_token is not set.", (uint8_t *)buffer, 2u);
    }
  }
  int IsTCCTrackingAllowed = 1;
LABEL_108:
  v63 = ne_log_obj();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buffer = 67109376;
    *(_DWORD *)&buffer[4] = v34;
    *(_WORD *)&buffer[8] = 1024;
    *(_DWORD *)&buffer[10] = IsTCCTrackingAllowed;
    _os_log_debug_impl(&dword_212970000, v63, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): is_hostname_found: (%d), is_tcc_allowed: (%d)", (uint8_t *)buffer, 0xEu);
  }
  v64 = ne_log_obj();
  v65 = v64;
  if (!v34)
  {
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
      return 0;
    }
    *(_DWORD *)buffer = 136380675;
    *(void *)&buffer[4] = a1;
    __int16 v6 = "External check: hostname %{private}s is not a tracker. Returning: ne_tracker_status_none";
    size_t v7 = (uint8_t *)buffer;
    uint64_t v8 = v65;
    uint32_t v9 = 12;
    goto LABEL_9;
  }
  if (IsTCCTrackingAllowed)
  {
    uint64_t v2 = 2;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buffer = 136380675;
      *(void *)&buffer[4] = a1;
      _os_log_debug_impl(&dword_212970000, v65, OS_LOG_TYPE_DEBUG, "External check: Tracking is allowed by the user, hostname %{private}s is a declared tracker. Returning: ne_tracker_status_declared", (uint8_t *)buffer, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v67 = "";
      if (v10) {
        v67 = v10;
      }
      v68 = buf;
      if (!buf[0]) {
        v68 = (uint8_t *)v67;
      }
      *(_DWORD *)buffer = 136315394;
      *(void *)&buffer[4] = a1;
      *(_WORD *)&buffer[12] = 2080;
      *(void *)&buffer[14] = v68;
      _os_log_impl(&dword_212970000, v65, OS_LOG_TYPE_DEFAULT, "Denied access to %s because it matches a domain in the NSTrackingDomains of %s, which does not have permission to track.", (uint8_t *)buffer, 0x16u);
    }
    return 1;
  }
  return v2;
}

os_unfair_lock_s *NEHelperTrackerCacheGet(os_unfair_lock_s *a1, const void *a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    CFIndex v4 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)&v2[2]._os_unfair_lock_opaque, a2);
    if (Value && (BytePtr = CFDataGetBytePtr(Value), (size_t v7 = *(uint64_t **)BytePtr) != 0))
    {
      uint64_t v8 = *v7;
      uint32_t v9 = (void *)v7[1];
      if (*v7)
      {
        *(void *)(v8 + 8) = v9;
        uint32_t v9 = (void *)v7[1];
      }
      else
      {
        *(void *)&v2[8]._os_unfair_lock_opaque = v9;
      }
      *uint32_t v9 = v8;
      CFStringRef v11 = *(os_unfair_lock_s **)&v2[6]._os_unfair_lock_opaque;
      uint64_t v10 = v2 + 6;
      *size_t v7 = (uint64_t)v11;
      CFStringRef v12 = v11 + 2;
      if (v11) {
        int v13 = v12;
      }
      else {
        int v13 = v10 + 2;
      }
      *(void *)&v13->_os_unfair_lock_opaque = v7;
      *(void *)&v10->_os_unfair_lock_opaque = v7;
      v7[1] = (uint64_t)v10;
      uint64_t v2 = *(os_unfair_lock_s **)(*(void *)BytePtr + 24);
    }
    else
    {
      uint64_t v2 = 0;
    }
    os_unfair_lock_unlock(v4);
  }
  return v2;
}

uint64_t NEHelperTrackerGetDispositionRedactLogs(uint64_t a1, CFArrayRef theArray, void *a3, CFIndex *a4, int a5)
{
  if (theArray) {
    CFIndex Count = CFArrayGetCount(theArray);
  }
  else {
    CFIndex Count = 0;
  }
  char v15 = 0;
  if (!a1) {
    return 0;
  }
  CFStringRef v11 = (*(unsigned char *)(a1 + 124) & 1) != 0 ? NEHelperTrackerCheckMetadataForWeb : NEHelperTrackerCheckMetadataForApp;
  if (!Count) {
    return 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (!ne_tracker_build_cache() || Count < 1)
  {
LABEL_15:
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
    return 0;
  }
  CFIndex v12 = 0;
  while (1)
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v12);
    if (CFStringGetCString(ValueAtIndex, NEHelperTrackerGetDispositionRedactLogs_buffer, 254, 0x8000100u))
    {
      if (NEHelperTrackerMatchDomain((_DWORD *)a1, NEHelperTrackerGetDispositionRedactLogs_buffer, (uint64_t)v11, a3, &v15, a5))
      {
        break;
      }
    }
    if (Count == ++v12) {
      goto LABEL_15;
    }
  }
  if (a4) {
    *a4 = v12;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (v15) {
    return 1;
  }
  else {
    return 3;
  }
}

BOOL NEHelperTrackerMatchDomain(_DWORD *a1, char *__s, uint64_t a3, void *a4, unsigned char *a5, int a6)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (!__s) {
    return 0;
  }
  int v11 = strlen(__s);
  int v12 = v11;
  if (!v11)
  {
    CFArrayRef v19 = ne_log_obj();
    BOOL result = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    if (!a1 || (int v21 = a1[14]) == 0 && (int v21 = a1[7]) == 0 && (int v21 = a1[30]) == 0 && (int v21 = a1[23]) == 0) {
      int v21 = 0;
    }
LABEL_64:
    *(_DWORD *)buf = 136315650;
    size_t v39 = "NEHelperTrackerMatchDomain";
    __int16 v40 = 1024;
    *(_DWORD *)v41 = a1;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v21;
    _os_log_debug_impl(&dword_212970000, v19, OS_LOG_TYPE_DEBUG, "%s: Invalid lookup for zero-length domain (app info ref %X pid %d)", buf, 0x18u);
    return 0;
  }
  if (__s[v11 - 1] == 46)
  {
    int v12 = v11 - 1;
    if (v11 == 1)
    {
      CFArrayRef v19 = ne_log_obj();
      BOOL result = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      if (!a1 || (int v21 = a1[14]) == 0 && (int v21 = a1[7]) == 0 && (int v21 = a1[30]) == 0 && (int v21 = a1[23]) == 0) {
        int v21 = 0;
      }
      goto LABEL_64;
    }
  }
  if (v12 >= 1)
  {
    uint64_t v13 = v12;
    uint64_t v14 = __s;
    do
    {
      *uint64_t v14 = __tolower(*v14);
      ++v14;
      --v13;
    }
    while (v13);
  }
  __s[v12] = 0;
  char v15 = ne_log_obj();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (a6)
  {
    if (!v16) {
      goto LABEL_16;
    }
    CFStringRef v17 = "App";
    if (a1)
    {
      int v18 = a1[14];
      if (!v18)
      {
        int v18 = a1[7];
        if (!v18)
        {
          int v18 = a1[30];
          if (!v18) {
            int v18 = a1[23];
          }
        }
      }
      if (a1[31]) {
        CFStringRef v17 = "Web";
      }
    }
    else
    {
      int v18 = 0;
    }
    *(_DWORD *)buf = 136317187;
    size_t v39 = "NEHelperTrackerMatchDomain";
    __int16 v40 = 2160;
    *(void *)v41 = 1752392040;
    *(_WORD *)&v41[8] = 1040;
    *(_DWORD *)&v41[10] = v12;
    __int16 v42 = 2101;
    *(void *)v43 = __s;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)&v43[10] = a1;
    *(_WORD *)&v43[14] = 1024;
    *(_DWORD *)&v43[16] = v18;
    *(_WORD *)size_t v44 = 2080;
    *(void *)&v44[2] = "n/a";
    *(_WORD *)&v44[10] = 2080;
    *(void *)&v44[12] = "n/a";
    *(_WORD *)&v44[20] = 2080;
    *(void *)&v44[22] = v17;
    BOOL v28 = "%s domain lookup for%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
    v29 = v15;
    uint32_t v30 = 80;
  }
  else
  {
    if (!v16) {
      goto LABEL_16;
    }
    uint64_t v25 = "App";
    if (a1)
    {
      int v26 = a1[14];
      if (!v26)
      {
        int v26 = a1[7];
        if (!v26)
        {
          int v26 = a1[30];
          if (!v26) {
            int v26 = a1[23];
          }
        }
      }
      if (a1[31]) {
        uint64_t v25 = "Web";
      }
    }
    else
    {
      int v26 = 0;
    }
    *(_DWORD *)buf = 136316931;
    size_t v39 = "NEHelperTrackerMatchDomain";
    __int16 v40 = 1024;
    *(_DWORD *)v41 = v12;
    *(_WORD *)&v41[4] = 2081;
    *(void *)&v41[6] = __s;
    __int16 v42 = 1024;
    *(_DWORD *)v43 = a1;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v26;
    *(_WORD *)&v43[10] = 2080;
    *(void *)&v43[12] = "n/a";
    *(_WORD *)size_t v44 = 2080;
    *(void *)&v44[2] = "n/a";
    *(_WORD *)&v44[10] = 2080;
    *(void *)&v44[12] = v25;
    BOOL v28 = "%s: domain lookup for<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    v29 = v15;
    uint32_t v30 = 70;
  }
  _os_log_debug_impl(&dword_212970000, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);
LABEL_16:
  if (ne_trie_search() == 0xFFFF) {
    return 0;
  }
  CFIndex v22 = ne_log_obj();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (a6)
  {
    if (v23)
    {
      int v24 = strlen(__s);
      v36 = "App";
      if (a1)
      {
        int v37 = a1[14];
        if (!v37)
        {
          int v37 = a1[7];
          if (!v37)
          {
            int v37 = a1[30];
            if (!v37) {
              int v37 = a1[23];
            }
          }
        }
        if (a1[31]) {
          v36 = "Web";
        }
      }
      else
      {
        int v37 = 0;
      }
      *(_DWORD *)buf = 136318723;
      size_t v39 = "NEHelperTrackerMatchDomain";
      __int16 v40 = 2160;
      *(void *)v41 = 1752392040;
      *(_WORD *)&v41[8] = 1040;
      *(_DWORD *)&v41[10] = v24;
      __int16 v42 = 2101;
      *(void *)v43 = __s;
      *(_WORD *)&v43[8] = 2160;
      *(void *)&v43[10] = 1752392040;
      *(_WORD *)&v43[18] = 1040;
      *(_DWORD *)size_t v44 = 4;
      *(_WORD *)&v44[4] = 2101;
      *(void *)&v44[6] = "null";
      *(_WORD *)&v44[14] = 2160;
      *(void *)&v44[16] = 1752392040;
      *(_WORD *)&v44[24] = 1040;
      *(_DWORD *)&v44[26] = 4;
      *(_WORD *)&v44[30] = 2101;
      *(void *)uint64_t v45 = "null";
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)size_t v46 = a1;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v37;
      __int16 v47 = 2080;
      BOOL v48 = "n/a";
      __int16 v49 = 2080;
      uint64_t v50 = "n/a";
      __int16 v51 = 2080;
      int v52 = v36;
      int v33 = "%s: domain lookup result for%{sensitive, mask.hash, networkextension:string}.*P --> metadata %{sensitive, ma"
            "sk.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pi"
            "d %d %s) %s - %s";
      int v34 = v22;
      uint32_t v35 = 132;
LABEL_76:
      _os_log_debug_impl(&dword_212970000, v34, OS_LOG_TYPE_DEBUG, v33, buf, v35);
    }
  }
  else if (v23)
  {
    int v27 = strlen(__s);
    uint64_t v31 = "App";
    if (a1)
    {
      int v32 = a1[14];
      if (!v32)
      {
        int v32 = a1[7];
        if (!v32)
        {
          int v32 = a1[30];
          if (!v32) {
            int v32 = a1[23];
          }
        }
      }
      if (a1[31]) {
        uint64_t v31 = "Web";
      }
    }
    else
    {
      int v32 = 0;
    }
    *(_DWORD *)buf = 136317955;
    size_t v39 = "NEHelperTrackerMatchDomain";
    __int16 v40 = 1024;
    *(_DWORD *)v41 = v27;
    *(_WORD *)&v41[4] = 2081;
    *(void *)&v41[6] = __s;
    __int16 v42 = 1024;
    *(_DWORD *)v43 = 4;
    *(_WORD *)&v43[4] = 2081;
    *(void *)&v43[6] = "null";
    *(_WORD *)&v43[14] = 1024;
    *(_DWORD *)&v43[16] = 4;
    *(_WORD *)size_t v44 = 2081;
    *(void *)&v44[2] = "null";
    *(_WORD *)&v44[10] = 1024;
    *(_DWORD *)&v44[12] = a1;
    *(_WORD *)&v44[16] = 1024;
    *(_DWORD *)&v44[18] = v32;
    *(_WORD *)&v44[22] = 2080;
    *(void *)&v44[24] = "n/a";
    *(_WORD *)uint64_t v45 = 2080;
    *(void *)&v45[2] = "n/a";
    *(_WORD *)size_t v46 = 2080;
    *(void *)&v46[2] = v31;
    int v33 = "%s: domain lookup result for<%d : %{private}s> --> metadata <%d : %{private}s> <%d : %{private}s> (app info re"
          "f %X pid %d %s) %s - %s";
    int v34 = v22;
    uint32_t v35 = 102;
    goto LABEL_76;
  }
  NEHelperTrackerProcessMatch(__s, 0, (uint64_t)a1, a5, a6);
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

xpc_object_t NECopySigningIdentifierForPIDwithAuditToken(int a1, uint64_t a2)
{
  xpc_object_t result = ne_copy_signing_identifier_for_pid_with_audit_token(a1, a2);
  if (result)
  {
    int v3 = result;
    uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();
    xpc_release(v3);
    return (xpc_object_t)v4;
  }
  return result;
}

xpc_object_t ne_copy_signing_identifier_for_pid_with_audit_token(int a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  bzero(v17, 0x400uLL);
  unint64_t v4 = 1023;
  CFIndex v5 = v17;
  while (a2)
  {
    if (!csops_audittoken()) {
      goto LABEL_11;
    }
LABEL_6:
    __int16 v6 = __error();
    if (v5 != v17 || *v6 != 34)
    {
      uint32_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = __error();
        int v11 = strerror(*v10);
        int v15 = 67109378;
        LODWORD(v16[0]) = a1;
        WORD2(v16[0]) = 2080;
        *(void *)((char *)v16 + 6) = v11;
        _os_log_error_impl(&dword_212970000, v9, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier for %d: %s", (uint8_t *)&v15, 0x12u);
      }
      goto LABEL_18;
    }
    unint64_t v4 = bswap32(v18);
    if ((v4 - 1048577) <= 0xFFF00006)
    {
      int v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 134217984;
        v16[0] = v4;
        _os_log_error_impl(&dword_212970000, v12, OS_LOG_TYPE_ERROR, "signing identifier length is invalid: %lu", (uint8_t *)&v15, 0xCu);
      }
      CFIndex v5 = 0;
LABEL_18:
      xpc_object_t v8 = 0;
      BOOL v13 = v5 != 0;
      goto LABEL_21;
    }
    CFIndex v5 = malloc_type_malloc(v4 + 1, 0x100004077774924uLL);
    if (!v5) {
      goto LABEL_18;
    }
  }
  if (csops()) {
    goto LABEL_6;
  }
LABEL_11:
  unint64_t v7 = bswap32(*((_DWORD *)v5 + 1));
  if (v4 >= v7)
  {
    v5[v7] = 0;
    xpc_object_t v8 = xpc_string_create(v5 + 8);
  }
  else
  {
    xpc_object_t v8 = 0;
  }
  BOOL v13 = 1;
LABEL_21:
  if (v13 && v5 != v17) {
    free(v5);
  }
  return v8;
}

void NEHelperTrackerCachePut(uint64_t a1, const void *a2, uint64_t a3)
{
  if (a1 && a2 && a3)
  {
    __int16 v6 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    CFDictionaryRef v7 = *(const __CFDictionary **)(a1 + 8);
    if (v7)
    {
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v7, a2);
      if (Value)
      {
        BytePtr = CFDataGetBytePtr(Value);
        uint64_t v10 = *(uint64_t **)BytePtr;
        if (*(void *)BytePtr)
        {
          uint64_t v11 = *v10;
          int v12 = (void *)v10[1];
          if (*v10)
          {
            *(void *)(v11 + 8) = v12;
            int v12 = (void *)v10[1];
          }
          else
          {
            *(void *)(a1 + 32) = v12;
          }
          *int v12 = v11;
          uint64_t v22 = *(void *)(a1 + 24);
          int v21 = (uint64_t **)(a1 + 24);
          *uint64_t v10 = v22;
          BOOL v23 = (uint64_t **)(v22 + 8);
          if (v22) {
            int v24 = v23;
          }
          else {
            int v24 = v21 + 1;
          }
          *int v24 = v10;
          *int v21 = v10;
          v10[1] = (uint64_t)v21;
          *(void *)(*(void *)BytePtr + 24) = a3;
        }
      }
      else
      {
        if (*(_DWORD *)a1 <= CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8))) {
          dealloc_appdata_node(a1, **(uint64_t ***)(*(void *)(a1 + 32) + 8));
        }
        BOOL v13 = malloc_type_malloc(0x20uLL, 0xE0040B6E8BBF2uLL);
        if (v13)
        {
          v13[2] = a2;
          v13[3] = a3;
        }
        *(void *)bytes = v13;
        CFDataRef v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 8);
        if (v14)
        {
          CFDataRef v15 = v14;
          CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, v14);
          CFRelease(v15);
        }
        uint64_t v16 = *(void *)bytes;
        if (*(void *)bytes)
        {
          uint64_t v18 = *(void *)(a1 + 24);
          CFStringRef v17 = (void *)(a1 + 24);
          **(void **)bytes = v18;
          uint64_t v19 = (void *)(v18 + 8);
          if (v18) {
            v20 = v19;
          }
          else {
            v20 = v17 + 1;
          }
          void *v20 = v16;
          *CFStringRef v17 = v16;
          *(void *)(v16 + 8) = v17;
        }
      }
      os_unfair_lock_unlock(v6);
    }
    else
    {
      os_unfair_lock_unlock(v6);
    }
  }
}

BOOL NEHelperTrackerAppInfoSetUUID(uint64_t a1, const unsigned __int8 *a2, const unsigned __int8 *a3)
{
  if (a1)
  {
    uuid_copy((unsigned __int8 *)(a1 + 40), a2);
    uuid_copy((unsigned __int8 *)(a1 + 104), a3);
  }
  return a1 != 0;
}

uint64_t NEHelperPidFromAuditToken(_OWORD *a1)
{
  long long v1 = a1[1];
  *(_OWORD *)v3.val = *a1;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3);
}

uint64_t NEHelperTrackerCheckMetadataForApp(uint64_t result)
{
  if (result) {
    return ne_tracker_context_is_from_app_list();
  }
  return result;
}

uint64_t ne_get_configuration_generation()
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v0 = ne_get_configuration_generation_configuration_changed_token;
  if (ne_get_configuration_generation_configuration_changed_token < 0)
  {
    if (notify_register_check("com.apple.neconfigurationchanged", &ne_get_configuration_generation_configuration_changed_token))
    {
      ne_get_configuration_generation_configuration_changed_token = -1;
      return ne_get_configuration_generation_current_generation;
    }
    int v0 = ne_get_configuration_generation_configuration_changed_token;
    if (ne_get_configuration_generation_configuration_changed_token < 0) {
      return ne_get_configuration_generation_current_generation;
    }
  }
  int check = 0;
  uint32_t v1 = notify_check(v0, &check);
  if (!v1)
  {
    if (!check) {
      return ne_get_configuration_generation_current_generation;
    }
    uint64_t v8 = 0;
    uint32_t state = notify_get_state(ne_get_configuration_generation_configuration_changed_token, &v8);
    if (!state)
    {
      ne_get_configuration_generation_current_generation = v8 & 0x1FFFFFFFFFFFFFLL;
      return ne_get_configuration_generation_current_generation;
    }
    uint32_t v5 = state;
    audit_token_t v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "com.apple.neconfigurationchanged";
    __int16 v12 = 1024;
    int v13 = ne_get_configuration_generation_configuration_changed_token;
    __int16 v14 = 1024;
    uint32_t v15 = v5;
    __int16 v6 = "notify_get_state failed for %s, token = %d: %u";
    goto LABEL_16;
  }
  uint32_t v2 = v1;
  audit_token_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "com.apple.neconfigurationchanged";
    __int16 v12 = 1024;
    int v13 = ne_get_configuration_generation_configuration_changed_token;
    __int16 v14 = 1024;
    uint32_t v15 = v2;
    __int16 v6 = "notify_check failed for %s, token = %d: %u";
LABEL_16:
    _os_log_error_impl(&dword_212970000, v3, OS_LOG_TYPE_ERROR, v6, buf, 0x18u);
  }
LABEL_4:
  notify_cancel(ne_get_configuration_generation_configuration_changed_token);
  ne_get_configuration_generation_configuration_changed_token = -1;
  ne_get_configuration_generation_current_generation = 0;
  return ne_get_configuration_generation_current_generation;
}

uint64_t cLogInternalErrorTrackerFailedtoReadMMAPFile()
{
  return +[NEDiagnosticReport logInternalError:@"Tracker" subType:@"FailedtoReadMMAPFile" context:0];
}

uint64_t NEFlowGetTypeID()
{
  if (runtime_inited != -1) {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
  }
  return __kNEFlowTypeID;
}

uint64_t __NEFlowGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __kNEFlowTypeID = result;
  return result;
}

CFStringRef __NEFlowCopyDescription(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  *(_OWORD *)v20 = *(_OWORD *)"<none>";
  CFDataRef v2 = *(const __CFData **)(a1 + 48);
  if (v2)
  {
    BytePtr = CFDataGetBytePtr(v2);
    unint64_t v4 = NECreateAddressStringWithPort((uint64_t)BytePtr);
  }
  else
  {
    unint64_t v4 = @"<unknown>";
  }
  CFDataRef v5 = *(const __CFData **)(a1 + 56);
  if (v5)
  {
    __int16 v6 = CFDataGetBytePtr(v5);
    CFDictionaryRef v7 = NECreateAddressStringWithPort((uint64_t)v6);
  }
  else
  {
    CFDictionaryRef v7 = @"<unknown>";
  }
  memset(out, 0, 37);
  CFDataRef v8 = *(const __CFData **)(a1 + 392);
  if (v8)
  {
    uint32_t v9 = CFDataGetBytePtr(v8);
    uint64_t v10 = out;
    uuid_unparse(v9, out);
  }
  else
  {
    uint64_t v10 = 0;
  }
  unsigned int v11 = *(_DWORD *)(a1 + 400);
  if (v11) {
    if_indextoname(v11, v20);
  }
  __int16 v12 = "unknown";
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 == 2) {
    __int16 v12 = "datagram";
  }
  if (v13 == 1) {
    __int16 v12 = "stream";
  }
  __int16 v14 = *(__CFString **)(a1 + 80);
  uint32_t v15 = &stru_26C3C67C8;
  if (!v14) {
    __int16 v14 = &stru_26C3C67C8;
  }
  if (*(void *)(a1 + 64)) {
    uint32_t v15 = *(__CFString **)(a1 + 64);
  }
  uint64_t v16 = "";
  if (v10) {
    CFStringRef v17 = v10;
  }
  else {
    CFStringRef v17 = "";
  }
  if ((*(_DWORD *)(a1 + 344) & 8) != 0) {
    uint64_t v16 = "(bound)";
  }
  CFStringRef v18 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"NEFlow type = %s, app = %@, name = %@, %@ <-> %@, filter_id = %s, interface = %s%s", v12, v14, v15, v7, v4, v17, v20, v16);
  if (v4) {
    CFRelease(v4);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v18;
}

uint64_t __NEFlowHashCode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

BOOL __NEFlowEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

void __NEFlowDeallocate(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  CFDataRef v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 24);
    uint64_t v4 = *(void *)(a1 + 248);
    uint64_t v5 = *(void *)(a1 + 256);
    uint64_t v6 = *(void *)(a1 + 232);
    uint64_t v7 = *(void *)(a1 + 240);
    v30[0] = 67110144;
    v30[1] = v3;
    __int16 v31 = 2048;
    uint64_t v32 = v4;
    __int16 v33 = 2048;
    uint64_t v34 = v5;
    __int16 v35 = 2048;
    uint64_t v36 = v6;
    __int16 v37 = 2048;
    uint64_t v38 = v7;
    _os_log_impl(&dword_212970000, v2, OS_LOG_TYPE_DEFAULT, "(%u): Destroying, client tx %llu, client rx %llu, kernel rx %llu, kernel tx %llu", (uint8_t *)v30, 0x30u);
  }
  flow_cancel_bridged_connection(a1, 0);
  CFDataRef v8 = *(const void **)(a1 + 48);
  if (v8) {
    CFRelease(v8);
  }
  uint32_t v9 = *(const void **)(a1 + 56);
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = *(const void **)(a1 + 64);
  if (v10) {
    CFRelease(v10);
  }
  unsigned int v11 = *(const void **)(a1 + 72);
  if (v11) {
    CFRelease(v11);
  }
  __int16 v12 = *(const void **)(a1 + 80);
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v13 = *(const void **)(a1 + 88);
  if (v13) {
    CFRelease(v13);
  }
  __int16 v14 = *(const void **)(a1 + 32);
  if (v14) {
    CFRelease(v14);
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 112));
  uint32_t v15 = *(NSObject **)(a1 + 136);
  if (v15) {
    dispatch_release(v15);
  }
  uint64_t v16 = *(void **)(a1 + 200);
  CFStringRef v17 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (v16)
  {
    CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      *(void *)(a1 + 200) = v16[1];
      CFAllocatorDeallocate(v18, v16);
      uint64_t v16 = *(void **)(a1 + 200);
    }
    while (v16);
  }
  flow_clear_datagram_queue(*(void **)(a1 + 264), *(void **)(a1 + 272));
  *(void *)(a1 + 264) = 0;
  *(void *)(a1 + 272) = a1 + 264;
  uint64_t v19 = *(void **)(a1 + 296);
  if (v19)
  {
    v20 = v19[16];
    if (v20)
    {
      dispatch_release(v20);
      uint64_t v19 = *(void **)(a1 + 296);
    }
    CFAllocatorDeallocate(*v17, v19);
  }
  flow_handle_pending_write_requests(a1, 0);
  uint64_t v21 = 0;
  uint64_t v22 = a1 + 144;
  do
  {
    BOOL v23 = *(const void **)(v22 + v21);
    if (v23)
    {
      _Block_release(v23);
      *(void *)(v22 + v21) = 0;
    }
    v21 += 8;
  }
  while (v21 != 56);
  int v24 = *(const void **)(a1 + 352);
  if (v24) {
    CFRelease(v24);
  }
  uint64_t v25 = *(const void **)(a1 + 360);
  if (v25) {
    CFRelease(v25);
  }
  int v26 = *(const void **)(a1 + 368);
  if (v26) {
    CFRelease(v26);
  }
  int v27 = *(const void **)(a1 + 376);
  if (v27) {
    CFRelease(v27);
  }
  BOOL v28 = *(const void **)(a1 + 384);
  if (v28) {
    CFRelease(v28);
  }
  v29 = *(const void **)(a1 + 392);
  if (v29) {
    CFRelease(v29);
  }
}

void flow_cancel_bridged_connection(uint64_t a1, CFTypeRef cf)
{
  if (cf)
  {
    uint64_t v4 = *(const void **)(a1 + 32);
    if (v4) {
      CFRelease(v4);
    }
    *(void *)(a1 + 32) = CFRetain(cf);
  }
  flow_read_close(a1, 1);
  flow_write_close(a1, 1);
  if ((~*(_DWORD *)(a1 + 100) & 3) == 0 && !*(unsigned char *)(a1 + 320)) {
    flow_drop_director((void *)a1);
  }
  flow_cancel_connection_waiting_timer(a1);
  uint64_t v5 = *(NSObject **)(a1 + 408);
  if (v5)
  {
    nw_connection_cancel(v5);
    nw_release(*(void **)(a1 + 408));
    *(void *)(a1 + 408) = 0;
  }
  uint64_t v6 = *(NSObject **)(a1 + 416);
  if (v6)
  {
    nw_connection_group_cancel(v6);
    nw_release(*(void **)(a1 + 416));
    *(void *)(a1 + 416) = 0;
  }
  uint64_t v7 = *(void **)(a1 + 128);
  if (v7)
  {
    os_release(v7);
    *(void *)(a1 + 128) = 0;
  }
}

void flow_clear_datagram_queue(void *ptr, void *a2)
{
  uint64_t v6 = a2;
  if (ptr)
  {
    CFDataRef v2 = ptr;
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    do
    {
      uint64_t v5 = (void *)v2[18];
      if (!v5) {
        uint64_t v6 = &v5;
      }
      uint64_t v4 = v2[16];
      if (v4) {
        dispatch_release(v4);
      }
      CFAllocatorDeallocate(v3, v2);
      CFDataRef v2 = v5;
    }
    while (v5);
  }
}

void flow_handle_pending_write_requests(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  CFAllocatorRef v3 = *(void **)(a1 + 304);
  if (!v3) {
    goto LABEL_12;
  }
  uint64_t v5 = (void *)(a1 + 304);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    uint64_t v7 = v3;
    if (a2)
    {
      int v8 = (*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v3);
      uint64_t v7 = (void *)*v5;
      if (!v8) {
        break;
      }
    }
    uint64_t v9 = v7[20];
    void *v5 = v9;
    if (!v9) {
      *(void *)(a1 + 312) = v5;
    }
    uint64_t v10 = (const void *)v3[16];
    if (v10) {
      CFRelease(v10);
    }
    unsigned int v11 = (const void *)v3[19];
    if (v11) {
      _Block_release(v11);
    }
    CFAllocatorDeallocate(v6, v3);
    CFAllocatorRef v3 = (void *)*v5;
    if (!*v5) {
      goto LABEL_12;
    }
  }
  if (!v7)
  {
LABEL_12:
    if (*(unsigned char *)(a1 + 320))
    {
      __int16 v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v16 = *(_DWORD *)(a1 + 24);
        v17[0] = 67109378;
        v17[1] = v16;
        __int16 v18 = 2080;
        uint64_t v19 = "All data written to the kernel, sending close";
        _os_log_debug_impl(&dword_212970000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v17, 0x12u);
      }
      *(unsigned char *)(a1 + 320) = 0;
      uint64_t v13 = *(unsigned int *)(a1 + 24);
      uint64_t v14 = *(void *)(a1 + 40);
      CFIndex v15 = flow_error_to_errno(*(void *)(a1 + 32));
      flow_director_send_close(v14, v13, v15, 0, *(_DWORD *)(a1 + 100) & 4);
      if ((~*(_DWORD *)(a1 + 100) & 3) == 0 && !*(unsigned char *)(a1 + 320)) {
        flow_drop_director((void *)a1);
      }
    }
  }
}

CFIndex flow_error_to_errno(CFIndex result)
{
  if (result)
  {
    uint32_t v1 = (__CFError *)result;
    Domain = (__CFString *)CFErrorGetDomain((CFErrorRef)result);
    if (Domain == @"com.apple.VPNTunnel")
    {
      CFIndex Code = CFErrorGetCode(v1);
      if ((unint64_t)(Code - 1) < 7) {
        return dword_2129A01C0[Code - 1];
      }
    }
    else if (Domain == (__CFString *)*MEMORY[0x263EFFC60] || Domain == (__CFString *)*MEMORY[0x263F144D0])
    {
      return CFErrorGetCode(v1);
    }
    return 50;
  }
  return result;
}

void flow_director_send_close(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  unsigned int v9 = bswap32(a3);
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  unsigned int v11 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 26, 0);
  *(unsigned char *)unsigned int v11 = 4;
  v11[1] = bswap32(a2);
  *((unsigned char *)v11 + 8) = 5;
  *(_DWORD *)((char *)v11 + 9) = 0x4000000;
  *(_DWORD *)((char *)v11 + 13) = v9;
  *((unsigned char *)v11 + 17) = 7;
  *(_DWORD *)((char *)v11 + 18) = 0x4000000;
  *(_DWORD *)((char *)v11 + 22) = bswap32(a4);
  flow_director_msg_send(a1, (uint64_t)v11, 0x1AuLL, a5 == 0);

  CFAllocatorDeallocate(v10, v11);
}

void flow_drop_director(void *a1)
{
  uint64_t v1 = a1[5];
  if (v1)
  {
    CFRetain(a1);
    CFAllocatorRef v3 = *(NSObject **)(v1 + 16);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    v4[2] = __flow_drop_director_block_invoke;
    v4[3] = &__block_descriptor_tmp_135;
    v4[4] = a1;
    v4[5] = v1;
    dispatch_async(v3, v4);
  }
}

void __flow_drop_director_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    CFAllocatorRef v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 24);
      v6[0] = 67109378;
      v6[1] = v5;
      __int16 v7 = 2080;
      int v8 = "Dropping the director";
      _os_log_debug_impl(&dword_212970000, v3, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v6, 0x12u);
    }
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    uint64_t v4 = *(_DWORD **)(a1 + 32);
    if ((v4[25] & 0x10) != 0)
    {
      rb_tree_remove_node((rb_tree_t *)(*(void *)(a1 + 40) + 56), v4);
      uint64_t v4 = *(_DWORD **)(a1 + 32);
      v4[25] &= ~0x10u;
    }
    CFRelease(v4);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void *NEFlowTLVAdd(uint64_t a1, char a2, unsigned int a3, void *__src)
{
  uint64_t v4 = a3;
  unint64_t v5 = a3 + 5;
  if (*(void *)(a1 + 8) < v5) {
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  }
  **(unsigned char **)a1 = a2;
  __int16 v7 = *(unsigned char **)a1;
  *(_DWORD *)(v7 + 1) = bswap32(a3);
  *(void *)a1 = v7 + 5;
  uint64_t result = memcpy(v7 + 5, __src, a3);
  unint64_t v9 = *(void *)(a1 + 8) - v5;
  *(void *)a1 += v4;
  *(void *)(a1 + 8) = v9;
  return result;
}

void flow_director_msg_send(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if (a1)
  {
    if (a4 || (CFAllocatorRef v6 = *(NSObject **)(a1 + 40)) == 0)
    {
      unint64_t v5 = *(NSObject **)(a1 + 24);
      CFAllocatorRef v6 = v5;
    }
    else
    {
      unint64_t v5 = *(NSObject **)(a1 + 24);
    }
    if (v6 == v5) {
      __int16 v7 = "control";
    }
    else {
      __int16 v7 = "data";
    }
    if (flow_director_ctl_write(v6, a2, a3, 0, 0, (uint64_t)v7))
    {
      flow_director_abort(a1, 0);
    }
  }
}

uint64_t flow_director_ctl_write(NSObject *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v28[4] = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v28[0] = a2;
  v28[1] = a3;
  v28[2] = a4;
  v28[3] = a5;
  if (a4) {
    unsigned int v8 = 2;
  }
  else {
    unsigned int v8 = 1;
  }
  *(_OWORD *)&v19.msg_control = 0u;
  *(_OWORD *)&v19.msg_name = 0u;
  v19.msg_iov = (iovec *)v28;
  *(void *)&v19.msg_iovlen = v8;
  int handle = dispatch_source_get_handle(a1);
  unint64_t v10 = sendmsg(handle, &v19, 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    unint64_t v11 = v10;
    if (v10 < a3)
    {
      __int16 v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        int v21 = dword_267796AD8;
        __int16 v22 = 2080;
        uint64_t v23 = a6;
        __int16 v24 = 2048;
        uint64_t v25 = (char *)v11;
        __int16 v26 = 2048;
        unint64_t v27 = a3;
        _os_log_error_impl(&dword_212970000, v12, OS_LOG_TYPE_ERROR, "(%u): %s: failed to write an entire message (%zd < %zu)", buf, 0x26u);
      }
      return 40;
    }
    return 0;
  }
  uint64_t v13 = *__error();
  CFIndex v15 = ne_log_obj();
  int v16 = v15;
  if (v13 == 55)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v21 = dword_267796AD8;
      __int16 v22 = 2080;
      uint64_t v23 = a6;
      _os_log_impl(&dword_212970000, v16, OS_LOG_TYPE_DEFAULT, "(%u): %s: failed to write a message: no buffer space available", buf, 0x12u);
    }
    return 55;
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v17 = dword_267796AD8;
    __int16 v18 = strerror(v13);
    *(_DWORD *)buf = 67109634;
    int v21 = v17;
    __int16 v22 = 2080;
    uint64_t v23 = a6;
    __int16 v24 = 2080;
    uint64_t v25 = v18;
    _os_log_error_impl(&dword_212970000, v16, OS_LOG_TYPE_ERROR, "(%u): %s: write error: %s", buf, 0x1Cu);
  }
  return v13;
}

void flow_director_abort(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v8 = dword_267796AD8;
    _os_log_impl(&dword_212970000, v4, OS_LOG_TYPE_DEFAULT, "(%u): Aborting the director", buf, 8u);
  }
  unint64_t v5 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 0x40000000;
  _DWORD v6[2] = __flow_director_abort_block_invoke;
  v6[3] = &unk_264194CA8;
  v6[4] = a2;
  v6[5] = a1;
  dispatch_async(v5, v6);
}

uint64_t __flow_director_abort_block_invoke(uint64_t a1)
{
  while (1)
  {
    uint64_t v2 = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(*(void *)(a1 + 40) + 56), 0, 1u);
    if (!v2) {
      break;
    }
    uint64_t v3 = (uint64_t)v2;
    uint64_t v4 = v2 + 30;
    os_unfair_lock_lock(v2 + 30);
    flow_read_close(v3, 1);
    flow_write_close(v3, 1);
    *(void *)(v3 + 40) = 0;
    if ((*(unsigned char *)(v3 + 100) & 0x10) != 0)
    {
      rb_tree_remove_node((rb_tree_t *)(*(void *)(a1 + 40) + 56), (void *)v3);
      *(_DWORD *)(v3 + 100) &= ~0x10u;
    }
    os_unfair_lock_unlock(v4);
    CFRelease((CFTypeRef)v3);
  }
  unint64_t v5 = *(void **)(a1 + 40);
  CFAllocatorRef v6 = v5[3];
  if (v6)
  {
    dispatch_source_cancel(v6);
    *(void *)(*(void *)(a1 + 40) + 24) = 0;
    unint64_t v5 = *(void **)(a1 + 40);
  }
  __int16 v7 = v5[5];
  if (v7)
  {
    dispatch_source_cancel(v7);
    *(void *)(*(void *)(a1 + 40) + 40) = 0;
    unint64_t v5 = *(void **)(a1 + 40);
  }
  int v8 = (void *)v5[20];
  if (v8)
  {
    free(v8);
    *(void *)(*(void *)(a1 + 40) + 160) = 0;
    unint64_t v5 = *(void **)(a1 + 40);
  }
  uint64_t v9 = (void *)v5[21];
  if (v9)
  {
    free(v9);
    *(void *)(*(void *)(a1 + 40) + 168) = 0;
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    unint64_t v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

void flow_read_close(uint64_t a1, int a2)
{
  *(void *)&v26[5] = *MEMORY[0x263EF8340];
  if (!a1)
  {
    __int16 v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      int v25 = 136315138;
      *(void *)__int16 v26 = "flow_read_close";
      _os_log_fault_impl(&dword_212970000, v24, OS_LOG_TYPE_FAULT, "%s called with null flow", (uint8_t *)&v25, 0xCu);
    }
    return;
  }
  int v3 = *(_DWORD *)(a1 + 100);
  if ((v3 & 2) != 0) {
    return;
  }
  *(_DWORD *)(a1 + 100) = v3 | 2;
  if (!a2)
  {
    unint64_t v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = *(_DWORD *)(a1 + 24);
      int v25 = 67109120;
      v26[0] = v12;
      _os_log_impl(&dword_212970000, v11, OS_LOG_TYPE_DEFAULT, "(%u): Closing reads, not closed by plugin", (uint8_t *)&v25, 8u);
    }
    uint64_t v13 = *(__CFError **)(a1 + 32);
    if (v13) {
      CFIndex Code = CFErrorGetCode(v13);
    }
    else {
      CFIndex Code = 0;
    }
    int v21 = *(NSObject **)(a1 + 408);
    if (v21 && *(void *)(a1 + 16) != 2) {
      nw_connection_send(v21, 0, (nw_content_context_t)*MEMORY[0x263F14450], 1, (nw_connection_send_completion_t)*MEMORY[0x263F14438]);
    }
    flow_notify_client_of_closure(a1);
    uint64_t v22 = *(void *)(a1 + 16);
    if (v22 == 2)
    {
      flow_call_dgram_read_handler(a1, Code);
    }
    else if (v22 == 1)
    {
      flow_call_stream_read_handler(a1, Code);
    }
    return;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  if ((unint64_t)(v4 - 1) > 1)
  {
    CFIndex v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *(_DWORD *)(a1 + 24);
      int v25 = 67109120;
      v26[0] = v16;
      int v17 = "(%u): Closing reads (other), closed by plugin";
LABEL_17:
      _os_log_impl(&dword_212970000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, 8u);
    }
  }
  else
  {
    if ((v3 & 4) == 0 || v4 == 2 || flow_error_to_errno(*(void *)(a1 + 32)))
    {
      unint64_t v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(_DWORD *)(a1 + 24);
        int v7 = flow_error_to_errno(*(void *)(a1 + 32));
        int v25 = 67109376;
        v26[0] = v6;
        LOWORD(v26[1]) = 1024;
        *(_DWORD *)((char *)&v26[1] + 2) = v7;
        _os_log_impl(&dword_212970000, v5, OS_LOG_TYPE_DEFAULT, "(%u): Closing reads (sending SHUT_WR), closed by plugin (flow error: %d)", (uint8_t *)&v25, 0xEu);
      }
      unsigned int v8 = *(_DWORD *)(a1 + 24);
      uint64_t v9 = *(void *)(a1 + 40);
      unsigned int v10 = flow_error_to_errno(*(void *)(a1 + 32));
      flow_director_send_close(v9, v8, v10, 1u, *(_DWORD *)(a1 + 100) & 4);
      goto LABEL_18;
    }
    CFIndex v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = *(_DWORD *)(a1 + 24);
      int v25 = 67109120;
      v26[0] = v23;
      int v17 = "(%u): Closing reads (suppressing SHUT_WR), closed by plugin";
      goto LABEL_17;
    }
  }
LABEL_18:
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18 == 1)
  {
    msghdr v19 = *(const void **)(a1 + 328);
    if (!v19) {
      return;
    }
    _Block_release(v19);
    *(void *)(a1 + 328) = 0;
    uint64_t v18 = *(void *)(a1 + 16);
  }
  if (v18 == 2)
  {
    uint64_t v20 = *(const void **)(a1 + 336);
    if (v20)
    {
      _Block_release(v20);
      *(void *)(a1 + 336) = 0;
    }
  }
}

void flow_write_close(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v3 = *(_DWORD *)(a1 + 100);
    if (v3)
    {
      if (a2) {
        return;
      }
      CFIndex Code = 2;
    }
    else
    {
      *(_DWORD *)(a1 + 100) = v3 | 1;
      if (a2)
      {
        if ((unint64_t)(*(void *)(a1 + 16) - 1) > 1)
        {
          int v12 = ne_log_obj();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v13 = *(_DWORD *)(a1 + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v21) = v13;
            _os_log_impl(&dword_212970000, v12, OS_LOG_TYPE_DEFAULT, "(%u): Closing writes (other), sending close", buf, 8u);
          }
        }
        else
        {
          uint64_t v4 = *(void *)(a1 + 304);
          unint64_t v5 = ne_log_obj();
          BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          if (v4)
          {
            if (v6)
            {
              int v7 = *(_DWORD *)(a1 + 24);
              *(_DWORD *)buf = 67109120;
              LODWORD(v21) = v7;
              _os_log_impl(&dword_212970000, v5, OS_LOG_TYPE_DEFAULT, "(%u): writes are still pending, delaying sending close until all data is sent to the kernel", buf, 8u);
            }
            *(unsigned char *)(a1 + 320) = 1;
          }
          else
          {
            if (v6)
            {
              int v14 = *(_DWORD *)(a1 + 24);
              *(_DWORD *)buf = 67109120;
              LODWORD(v21) = v14;
              _os_log_impl(&dword_212970000, v5, OS_LOG_TYPE_DEFAULT, "(%u): Closing writes, sending SHUT_RD", buf, 8u);
            }
            uint64_t v15 = *(unsigned int *)(a1 + 24);
            uint64_t v16 = *(void *)(a1 + 40);
            CFIndex v17 = flow_error_to_errno(*(void *)(a1 + 32));
            flow_director_send_close(v16, v15, v17, 0, *(_DWORD *)(a1 + 100) & 4);
          }
        }
        return;
      }
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v10;
        _os_log_impl(&dword_212970000, v9, OS_LOG_TYPE_DEFAULT, "(%u): Closing writes, not sending close", buf, 8u);
      }
      unint64_t v11 = *(__CFError **)(a1 + 32);
      if (v11) {
        CFIndex Code = CFErrorGetCode(v11);
      }
      else {
        CFIndex Code = 2;
      }
      flow_notify_client_of_closure(a1);
    }
    *(unsigned char *)(a1 + 320) = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 0x40000000;
    v19[2] = __flow_write_close_block_invoke;
    v19[3] = &__block_descriptor_tmp_133;
    v19[4] = a1;
    v19[5] = Code;
    flow_handle_pending_write_requests(a1, (uint64_t)v19);
    return;
  }
  uint64_t v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v21 = "flow_write_close";
    _os_log_fault_impl(&dword_212970000, v18, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
  }
}

void flow_notify_client_of_closure(uint64_t a1)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  int v2 = *(_DWORD *)(a1 + 100);
  if ((v2 & 2) != 0 && !flow_has_bytes(a1))
  {
    flow_notify_client((void *)a1, 2);
    if ((*(_DWORD *)(a1 + 100) & 1) == 0) {
      return;
    }
  }
  else if ((v2 & 1) == 0)
  {
    return;
  }

  flow_notify_client((void *)a1, 3);
}

uint64_t __flow_write_close_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)(a2 + 152);
  if (v2) {
    flow_call_write_completion(*(void *)(a1 + 32), *(void *)(a1 + 40), v2);
  }
  return 1;
}

void flow_call_write_completion(uint64_t a1, uint64_t a2, void *aBlock)
{
  if (*(void *)(a1 + 136))
  {
    unint64_t v5 = _Block_copy(aBlock);
    BOOL v6 = *(NSObject **)(a1 + 136);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 0x40000000;
    _DWORD v7[2] = __flow_call_write_completion_block_invoke;
    v7[3] = &unk_264194B38;
    v7[4] = v5;
    v7[5] = a2;
    dispatch_async(v6, v7);
  }
}

void __flow_call_write_completion_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

BOOL flow_has_bytes(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1 == 2)
  {
    BOOL v2 = *(void *)(a1 + 264) == 0;
  }
  else
  {
    if (v1 != 1) {
      return 0;
    }
    BOOL v2 = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 112)) == 0;
  }
  return !v2;
}

void flow_notify_client(void *a1, uint64_t a2)
{
  if (a1[17] && a1[a2 + 18])
  {
    uint64_t v4 = (void *)a1[25];
    if (v4)
    {
      while (1)
      {
        unint64_t v5 = v4;
        if (*v4 == a2) {
          break;
        }
        uint64_t v4 = (void *)v4[1];
        if (!v4) {
          goto LABEL_8;
        }
      }
    }
    else
    {
      unint64_t v5 = 0;
LABEL_8:
      BOOL v6 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 16, 0);
      *BOOL v6 = a2;
      if (v5)
      {
        v6[1] = v5[1];
        v5[1] = v6;
      }
      else
      {
        v6[1] = a1[25];
        a1[25] = v6;
        if (a1[17])
        {
          CFRetain(a1);
          int v7 = a1[17];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = __flow_notify_client_block_invoke;
          block[3] = &__block_descriptor_tmp_123;
          block[4] = a1;
          dispatch_async(v7, block);
        }
      }
    }
  }
}

void __flow_notify_client_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  while (1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 120));
    uint64_t v4 = *(void **)(v2 + 200);
    if (!v4) {
      break;
    }
    uint64_t v5 = v4[1];
    *(void *)(v2 + 200) = v5;
    BOOL v6 = *(const void **)(v2 + 8 * *v4 + 144);
    if (v6)
    {
      int v7 = (void (**)(void *, void))_Block_copy(v6);
      uint64_t v8 = *(void *)(v2 + 200);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
      if (v7)
      {
        uint64_t v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v10 = "unknown";
          if (*v4 <= 6uLL) {
            int v10 = off_264194E60[*v4];
          }
          int v11 = *(_DWORD *)(v2 + 24);
          *(_DWORD *)buf = 67109378;
          int v13 = v11;
          __int16 v14 = 2080;
          uint64_t v15 = v10;
          _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "(%u): invoking %s event handler", buf, 0x12u);
        }
        v7[2](v7, 0);
        _Block_release(v7);
      }
      CFAllocatorDeallocate(v3, v4);
      if (!v8) {
        goto LABEL_15;
      }
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
      CFAllocatorDeallocate(v3, v4);
      if (!v5) {
        goto LABEL_15;
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
LABEL_15:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void flow_call_stream_read_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  if (*(void *)(a1 + 136))
  {
    uint64_t v4 = *(const void **)(a1 + 328);
    if (v4)
    {
      uint64_t v5 = _Block_copy(v4);
      BOOL v6 = *(NSObject **)(a1 + 112);
      if (v6)
      {
        size_t size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 112));
        dispatch_retain(v6);
      }
      else
      {
        size_t size = 0;
      }
      uint64_t v8 = *(NSObject **)(a1 + 136);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __flow_call_stream_read_handler_block_invoke;
      block[3] = &unk_264194AE8;
      block[4] = v5;
      void block[5] = v6;
      block[6] = a2;
      dispatch_async(v8, block);
      _Block_release(*(const void **)(a1 + 328));
      *(void *)(a1 + 328) = 0;
      if (size)
      {
        flow_director_send_read_notification(*(void *)(a1 + 40), *(_DWORD *)(a1 + 24), size);
        *(void *)(a1 + 256) += size;
        uint64_t v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          int v11 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)buf = 67109376;
          int v14 = v11;
          __int16 v15 = 2048;
          size_t v16 = size;
          _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "(%u): plugin read %lu bytes", buf, 0x12u);
        }
        int v10 = *(NSObject **)(a1 + 112);
        if (v10) {
          dispatch_release(v10);
        }
        *(void *)(a1 + 112) = MEMORY[0x263EF8388];
      }
    }
  }
}

void flow_call_dgram_read_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  if (*(void *)(a1 + 136))
  {
    uint64_t v4 = *(const void **)(a1 + 336);
    if (v4)
    {
      uint64_t v5 = _Block_copy(v4);
      long long v11 = *(_OWORD *)(a1 + 264);
      BOOL v6 = *(NSObject **)(a1 + 136);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 0x40000000;
      v10[2] = __flow_call_dgram_read_handler_block_invoke;
      v10[3] = &unk_264194B10;
      v10[4] = v5;
      uint64_t v12 = a2;
      dispatch_async(v6, v10);
      _Block_release(*(const void **)(a1 + 336));
      *(void *)(a1 + 336) = 0;
      flow_director_send_read_notification(*(void *)(a1 + 40), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 280));
      *(void *)(a1 + 256) += *(unsigned int *)(a1 + 280);
      int v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v8 = *(_DWORD *)(a1 + 24);
        int v9 = *(_DWORD *)(a1 + 280);
        *(_DWORD *)buf = 67109376;
        int v14 = v8;
        __int16 v15 = 1024;
        int v16 = v9;
        _os_log_debug_impl(&dword_212970000, v7, OS_LOG_TYPE_DEBUG, "(%u): plugin read %u bytes", buf, 0xEu);
      }
      *(void *)(a1 + 264) = 0;
      *(void *)(a1 + 272) = a1 + 264;
      *(_DWORD *)(a1 + 280) = 0;
    }
  }
}

void __flow_call_dgram_read_handler_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  CFAllocatorRef v3 = *(void **)(a1 + 48);

  flow_clear_datagram_queue(v2, v3);
}

void flow_director_send_read_notification(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v5 = bswap32(a3);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v7 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 17, 0);
  *(unsigned char *)int v7 = 5;
  v7[1] = bswap32(a2);
  *((unsigned char *)v7 + 8) = 8;
  *(_DWORD *)((char *)v7 + 9) = 0x4000000;
  *(_DWORD *)((char *)v7 + 13) = v5;
  flow_director_msg_send(a1, (uint64_t)v7, 0x11uLL, 0);

  CFAllocatorDeallocate(v6, v7);
}

void __flow_call_stream_read_handler_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_release(v2);
  }
}

void flow_cancel_connection_waiting_timer(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 424))
  {
    uint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      int v3 = *(_DWORD *)(a1 + 24);
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_debug_impl(&dword_212970000, v2, OS_LOG_TYPE_DEBUG, "(%u): Cancelling waiting timer", (uint8_t *)v4, 8u);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 424));
    *(void *)(a1 + 424) = 0;
  }
}

uint64_t NEFlowGetFlowType(void *cf)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 0;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!cf) {
      return 0;
    }
  }
  uint64_t v2 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) == v2) {
    return cf[2];
  }
  return 0;
}

uint64_t NEFlowOpen(os_unfair_lock_s *cf)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 0;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!cf) {
      return 0;
    }
  }
  uint64_t v2 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) == v2)
  {
    int v3 = cf + 30;
    os_unfair_lock_lock(cf + 30);
    uint64_t v4 = flow_open((uint64_t)cf);
    os_unfair_lock_unlock(v3);
    return v4;
  }
  return 0;
}

uint64_t flow_open(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  int v2 = *(_DWORD *)(a1 + 100);
  if ((v2 & 4) != 0)
  {
    uint64_t v4 = a1;
    CFIndex v5 = 4;
    goto LABEL_9;
  }
  if ((v2 & 3) != 0 || *(void *)(a1 + 40) == 0)
  {
    uint64_t v4 = a1;
    CFIndex v5 = 2;
LABEL_9:
    __NEFlowSetError(v4, v5);
    return 0;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)bytes = 0u;
  long long v19 = 0u;
  int v7 = *(_DWORD *)(a1 + 400);
  CFDataRef v8 = *(const __CFData **)(a1 + 56);
  if (!v8
    || (CFDataGetBytePtr(v8),
        CFDataGetLength(*(CFDataRef *)(a1 + 56)),
        __memcpy_chk(),
        CFRelease(*(CFTypeRef *)(a1 + 56)),
        bytes[1] != 30)
    && bytes[1] != 2
    || !*(_WORD *)&bytes[2])
  {
    unsigned int v9 = arc4random_uniform(0x3FFFu) - 0x4000;
    if (bytes[1] == 30 || bytes[1] == 2) {
      *(_WORD *)&bytes[2] = bswap32(v9) >> 16;
    }
  }
  *(void *)(a1 + 56) = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, bytes[0]);
  int v10 = *(_DWORD *)(a1 + 100);
  if ((v10 & 0x40) == 0)
  {
    if (bytes[1] == 30)
    {
      *(void *)&UInt8 bytes[8] = 0;
      *(void *)&long long v19 = 0;
    }
    else if (bytes[1] == 2)
    {
      *(_DWORD *)&bytes[4] = 0;
    }
  }
  *(_DWORD *)(a1 + 100) = v10 | 4;
  if ((unint64_t)(*(void *)(a1 + 16) - 1) <= 1)
  {
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109378;
      int v15 = v13;
      __int16 v16 = 2080;
      uint64_t v17 = "Open, sending successful connect result";
      _os_log_debug_impl(&dword_212970000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
    }
    flow_director_send_connect_result(*(void *)(a1 + 40), *(_DWORD *)(a1 + 24), 0, 0x40000u, *(_DWORD *)(*(void *)(a1 + 40) + 48), bytes, BytePtr, v7, *(CFDataRef *)(a1 + 352));
  }
  return 1;
}

CFErrorRef __NEFlowSetError(uint64_t a1, CFIndex code)
{
  uint64_t v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 32) = 0;
  }
  CFErrorRef result = CFErrorCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"com.apple.VPNTunnel", code, 0);
  *(void *)(a1 + 32) = result;
  return result;
}

void flow_director_send_connect_result(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned __int8 *a6, unsigned __int8 *a7, int a8, CFDataRef theData)
{
  if (a6)
  {
    uint64_t v14 = *a6 + 16;
    uint64_t v15 = 5;
  }
  else
  {
    uint64_t v15 = 4;
    uint64_t v14 = 16;
  }
  if (a7)
  {
    v14 += *a7;
    ++v15;
  }
  if (theData)
  {
    v14 += CFDataGetLength(theData);
    ++v15;
  }
  unint64_t v16 = 5 * v15 + v14;
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  unint64_t v18 = v16 + 8;
  long long v19 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v16 + 8, 0);
  *(unsigned char *)long long v19 = 2;
  v19[1] = bswap32(a2);
  if (v16 <= 8) {
    goto LABEL_27;
  }
  long long v20 = (char *)v19;
  *((unsigned char *)v19 + 8) = 5;
  *(_DWORD *)((char *)v19 + 9) = 0x4000000;
  *(_DWORD *)((char *)v19 + 13) = bswap32(a3);
  if (v16 - 9 <= 8) {
    goto LABEL_27;
  }
  *((unsigned char *)v19 + 17) = 9;
  *(_DWORD *)((char *)v19 + 18) = 0x4000000;
  *(_DWORD *)((char *)v19 + 22) = bswap32(a4);
  if (v16 - 18 <= 8) {
    goto LABEL_27;
  }
  *((unsigned char *)v19 + 26) = 10;
  *(_DWORD *)((char *)v19 + 27) = 0x4000000;
  *(_DWORD *)((char *)v19 + 31) = bswap32(a5);
  unint64_t v21 = v16 - 27;
  if (!a6)
  {
    long long v24 = (char *)v19 + 35;
    if (!a7) {
      goto LABEL_20;
    }
LABEL_17:
    size_t v25 = *a7;
    BOOL v23 = v21 >= v25 + 5;
    v21 -= v25 + 5;
    if (v23)
    {
      *long long v24 = 12;
      *(_DWORD *)(v24 + 1) = v25 << 24;
      uint64_t v26 = v24 + 5;
      memcpy(v26, a7, v25);
      long long v24 = &v26[v25];
      goto LABEL_20;
    }
LABEL_27:
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  }
  size_t v22 = *a6;
  BOOL v23 = v21 >= v22 + 5;
  v21 -= v22 + 5;
  if (!v23) {
    goto LABEL_27;
  }
  *((unsigned char *)v19 + 35) = 11;
  v19[9] = v22 << 24;
  memcpy(v19 + 10, a6, v22);
  long long v24 = &v20[v22 + 40];
  if (a7) {
    goto LABEL_17;
  }
LABEL_20:
  if (v21 <= 8) {
    goto LABEL_27;
  }
  *long long v24 = 13;
  *(_DWORD *)(v24 + 1) = 0x4000000;
  *(_DWORD *)(v24 + 5) = a8;
  if (theData)
  {
    unsigned int Length = CFDataGetLength(theData);
    BytePtr = CFDataGetBytePtr(theData);
    if (v21 - 9 < (unint64_t)Length + 5) {
      goto LABEL_27;
    }
    v24[9] = 31;
    *(_DWORD *)(v24 + 10) = bswap32(Length);
    memcpy(v24 + 14, BytePtr, Length);
  }
  flow_director_msg_send(a1, (uint64_t)v20, v18, 1);

  CFAllocatorDeallocate(v17, v20);
}

uint64_t NEFlowReadClose(os_unfair_lock_s *a1, const void *a2)
{
  return flow_close(a1, a2, 1);
}

uint64_t flow_close(os_unfair_lock_s *cf, const void *a2, int a3)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 0;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!cf) {
      return 0;
    }
  }
  uint64_t v6 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v6) {
    return 0;
  }
  if (a2)
  {
    CFTypeID TypeID = CFErrorGetTypeID();
    if (CFGetTypeID(a2) == TypeID)
    {
      CFDataRef v8 = cf + 30;
      os_unfair_lock_lock(cf + 30);
      unsigned int v9 = *(const void **)&cf[8]._os_unfair_lock_opaque;
      if (v9) {
        CFRelease(v9);
      }
      *(void *)&cf[8]._os_unfair_lock_opaque = CFRetain(a2);
      goto LABEL_10;
    }
    return 0;
  }
  CFDataRef v8 = cf + 30;
  os_unfair_lock_lock(cf + 30);
LABEL_10:
  if (a3) {
    flow_read_close((uint64_t)cf, 1);
  }
  else {
    flow_write_close((uint64_t)cf, 1);
  }
  if ((~cf[25]._os_unfair_lock_opaque & 3) == 0 && !LOBYTE(cf[80]._os_unfair_lock_opaque)) {
    flow_drop_director(cf);
  }
  os_unfair_lock_unlock(v8);
  return 1;
}

uint64_t NEFlowWriteClose(os_unfair_lock_s *a1, const void *a2)
{
  return flow_close(a1, a2, 0);
}

uint64_t NEFlowSetEventHandler(os_unfair_lock_s *cf, uint64_t a2, const void *a3)
{
  if (runtime_inited != -1)
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (cf) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!cf) {
    return 0;
  }
LABEL_3:
  uint64_t v6 = __kNEFlowTypeID;
  CFTypeID v7 = CFGetTypeID(cf);
  uint64_t result = 0;
  if (a2 <= 6 && v7 == v6)
  {
    os_unfair_lock_lock(cf + 30);
    unsigned int v9 = &cf[2 * a2];
    uint64_t v12 = *(const void **)&v9[36]._os_unfair_lock_opaque;
    long long v11 = (void **)&v9[36];
    int v10 = v12;
    if (v12)
    {
      _Block_release(v10);
      *long long v11 = 0;
    }
    if (a3) {
      *long long v11 = _Block_copy(a3);
    }
    os_unfair_lock_unlock(cf + 30);
    return 1;
  }
  return result;
}

uint64_t NEFlowSetDispatchQueue(os_unfair_lock_s *cf, NSObject *a2)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 0;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!cf) {
      return 0;
    }
  }
  uint64_t v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4) {
    return 0;
  }
  CFIndex v5 = cf + 30;
  os_unfair_lock_lock(cf + 30);
  uint64_t v6 = *(NSObject **)&cf[34]._os_unfair_lock_opaque;
  if (v6)
  {
    dispatch_release(v6);
    *(void *)&cf[34]._os_unfair_lock_opaque = 0;
  }
  if (a2)
  {
    *(void *)&cf[34]._os_unfair_lock_opaque = a2;
    dispatch_retain(a2);
  }
  else
  {
    CFTypeID v7 = cf + 36;
    do
    {
      CFDataRef v8 = *(Class *)((char *)&a2->isa + (void)v7);
      if (v8)
      {
        _Block_release(v8);
        *(Class *)((char *)&a2->isa + (void)v7) = 0;
      }
      ++a2;
    }
    while (a2 != 56);
  }
  os_unfair_lock_unlock(v5);
  return 1;
}

os_unfair_lock_s *NEFlowCopyError(os_unfair_lock_s *cf)
{
  uint64_t v1 = cf;
  if (runtime_inited == -1)
  {
    if (!cf) {
      return v1;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!v1) {
      return v1;
    }
  }
  uint64_t v2 = __kNEFlowTypeID;
  if (CFGetTypeID(v1) != v2) {
    return 0;
  }
  int v3 = v1 + 30;
  os_unfair_lock_lock(v1 + 30);
  uint64_t v4 = *(const void **)&v1[8]._os_unfair_lock_opaque;
  if (v4) {
    uint64_t v1 = (os_unfair_lock_s *)CFRetain(v4);
  }
  else {
    uint64_t v1 = 0;
  }
  os_unfair_lock_unlock(v3);
  return v1;
}

uint64_t NEFlowAsyncRead(os_unfair_lock_s *cf, const void *a2)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 4;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!cf) {
      return 4;
    }
  }
  uint64_t v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4) {
    return 4;
  }
  uint64_t v5 = 4;
  if (a2 && *(void *)&cf[4]._os_unfair_lock_opaque == 1)
  {
    os_unfair_lock_lock(cf + 30);
    if (*(void *)&cf[82]._os_unfair_lock_opaque)
    {
      uint64_t v5 = 101;
    }
    else
    {
      *(void *)&cf[82]._os_unfair_lock_opaque = _Block_copy(a2);
      if (flow_has_bytes((uint64_t)cf) || (cf[25]._os_unfair_lock_opaque & 2) != 0) {
        flow_call_stream_read_handler((uint64_t)cf, 0);
      }
      uint64_t v5 = 0;
    }
    os_unfair_lock_unlock(cf + 30);
  }
  return v5;
}

uint64_t NEFlowAsyncDatagramsCopyNext(os_unfair_lock_s *cf, const void *a2)
{
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 4;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!cf) {
      return 4;
    }
  }
  uint64_t v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4) {
    return 4;
  }
  uint64_t v5 = 4;
  if (a2 && *(void *)&cf[4]._os_unfair_lock_opaque == 2)
  {
    os_unfair_lock_lock(cf + 30);
    if (*(void *)&cf[84]._os_unfair_lock_opaque)
    {
      uint64_t v5 = 101;
    }
    else
    {
      *(void *)&cf[84]._os_unfair_lock_opaque = _Block_copy(a2);
      if (flow_has_bytes((uint64_t)cf) || (cf[25]._os_unfair_lock_opaque & 2) != 0) {
        flow_call_dgram_read_handler((uint64_t)cf, 0);
      }
      uint64_t v5 = 0;
    }
    os_unfair_lock_unlock(cf + 30);
  }
  return v5;
}

uint64_t NEFlowWrite(os_unfair_lock_s *cf, const void *a2, unsigned __int8 *a3, void *a4)
{
  *(void *)&v43[7] = *MEMORY[0x263EF8340];
  if (runtime_inited == -1)
  {
    if (!cf) {
      return 4;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!cf) {
      return 4;
    }
  }
  uint64_t v8 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v8) {
    return 4;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint32_t os_unfair_lock_opaque = cf[6]._os_unfair_lock_opaque;
      int v40 = 67109378;
      uint32_t v41 = os_unfair_lock_opaque;
      __int16 v42 = 2080;
      *(void *)v43 = "invalid data object";
      _os_log_debug_impl(&dword_212970000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)&v40, 0x12u);
    }
    return 4;
  }
  if (CFDataGetLength((CFDataRef)a2) <= 0)
  {
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint32_t v16 = cf[6]._os_unfair_lock_opaque;
      int v40 = 67109376;
      uint32_t v41 = v16;
      __int16 v42 = 2048;
      *(void *)v43 = CFDataGetLength((CFDataRef)a2);
      CFAllocatorRef v17 = "(%u): data length %ld <= 0";
      unint64_t v18 = v15;
      uint32_t v19 = 18;
LABEL_30:
      _os_log_error_impl(&dword_212970000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v40, v19);
    }
    return 4;
  }
  if (a3)
  {
    int v10 = a3[1];
    if (v10 == 2)
    {
      unsigned int v11 = *a3;
      if (v11 < 0x10) {
        goto LABEL_20;
      }
    }
    else
    {
      if (v10 != 30)
      {
        v29 = ne_log_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          uint32_t v30 = cf[6]._os_unfair_lock_opaque;
          int v31 = a3[1];
          int v40 = 67109376;
          uint32_t v41 = v30;
          __int16 v42 = 1024;
          *(_DWORD *)v43 = v31;
          CFAllocatorRef v17 = "(%u): address has an invalid family %d";
          unint64_t v18 = v29;
          uint32_t v19 = 14;
          goto LABEL_30;
        }
        return 4;
      }
      unsigned int v11 = *a3;
      if (v11 < 0x1C) {
        goto LABEL_20;
      }
    }
    if (v11 >= 0x1D)
    {
LABEL_20:
      long long v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint32_t v21 = cf[6]._os_unfair_lock_opaque;
        int v22 = a3[1];
        int v23 = *a3;
        int v40 = 67109632;
        uint32_t v41 = v21;
        __int16 v42 = 1024;
        *(_DWORD *)v43 = v22;
        v43[2] = 1024;
        *(_DWORD *)&v43[3] = v23;
        CFAllocatorRef v17 = "(%u): address with family %d has an invalid length %d";
        unint64_t v18 = v20;
        uint32_t v19 = 20;
        goto LABEL_30;
      }
      return 4;
    }
  }
  if (*(void *)&cf[4]._os_unfair_lock_opaque == 2
    && cf[72]._os_unfair_lock_opaque < CFDataGetLength((CFDataRef)a2))
  {
    return 100;
  }
  long long v24 = cf + 30;
  os_unfair_lock_lock(cf + 30);
  if (cf[25]._os_unfair_lock_opaque)
  {
    __int16 v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint32_t v38 = cf[6]._os_unfair_lock_opaque;
      int v40 = 67109376;
      uint32_t v41 = v38;
      __int16 v42 = 2048;
      *(void *)v43 = CFDataGetLength((CFDataRef)a2);
      _os_log_error_impl(&dword_212970000, v33, OS_LOG_TYPE_ERROR, "(%u): flow is closed for writes, cannot write %ld bytes of data", (uint8_t *)&v40, 0x12u);
    }
    uint64_t v13 = 1;
  }
  else
  {
    CFIndex Length = CFDataGetLength((CFDataRef)a2);
    CFIndex v26 = Length;
    if (*(void *)&cf[76]._os_unfair_lock_opaque)
    {
      uint64_t v27 = 0;
      uint64_t v28 = Length;
    }
    else
    {
      uint64_t v27 = flow_write_range_of_cfdata((uint64_t)cf, (const __CFData *)a2, 0, Length, a3);
      uint64_t v28 = v34;
    }
    if (v28 < 1)
    {
      if (a4) {
        flow_call_write_completion((uint64_t)cf, 0, a4);
      }
    }
    else
    {
      __int16 v35 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 168, 0);
      uint64_t v36 = v35;
      *(_OWORD *)__int16 v35 = 0u;
      *((_OWORD *)v35 + 1) = 0u;
      *((_OWORD *)v35 + 2) = 0u;
      *((_OWORD *)v35 + 3) = 0u;
      *((_OWORD *)v35 + 4) = 0u;
      *((_OWORD *)v35 + 5) = 0u;
      *((_OWORD *)v35 + 6) = 0u;
      *((_OWORD *)v35 + 7) = 0u;
      *((_OWORD *)v35 + 8) = 0u;
      *((_OWORD *)v35 + 9) = 0u;
      v35[20] = 0;
      if (a3) {
        memcpy(v35, a3, *a3);
      }
      v36[16] = CFRetain(a2);
      v36[17] = v27;
      v36[18] = v28;
      if (a4) {
        v36[19] = _Block_copy(a4);
      }
      v36[20] = 0;
      **(void **)&cf[78]._uint32_t os_unfair_lock_opaque = v36;
      *(void *)&cf[78]._uint32_t os_unfair_lock_opaque = v36 + 20;
    }
    __int16 v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      uint32_t v39 = cf[6]._os_unfair_lock_opaque;
      int v40 = 67109376;
      uint32_t v41 = v39;
      __int16 v42 = 2048;
      *(void *)v43 = v26;
      _os_log_debug_impl(&dword_212970000, v37, OS_LOG_TYPE_DEBUG, "(%u): plugin wrote %ld bytes", (uint8_t *)&v40, 0x12u);
    }
    uint64_t v13 = 0;
    *(void *)&cf[62]._os_unfair_lock_opaque += v26;
  }
  os_unfair_lock_unlock(v24);
  return v13;
}

uint64_t flow_write_range_of_cfdata(uint64_t a1, const __CFData *a2, uint64_t a3, uint64_t a4, unsigned __int8 *__src)
{
  uint64_t v5 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!a2) {
    return a3;
  }
  unint64_t v8 = *(unsigned int *)(a1 + 104);
  if (!*(_DWORD *)(a1 + 104) || a4 < 1) {
    return a3;
  }
  while (*(void *)(a1 + 16) == 2)
  {
    int v12 = flow_director_send_cfdata(*(void *)(a1 + 40), *(_DWORD *)(a1 + 24), a2, a3, v5, __src);
    uint64_t v13 = v5;
    if (v12) {
      goto LABEL_20;
    }
LABEL_15:
    *(void *)(a1 + 240) += v13;
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v16 = *(_DWORD *)(a1 + 24);
      CFAllocatorRef v17 = *(char **)(a1 + 240);
      *(_DWORD *)buf = 67109632;
      int v25 = v16;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      __int16 v28 = 2048;
      v29 = v17;
      _os_log_debug_impl(&dword_212970000, v15, OS_LOG_TYPE_DEBUG, "(%u): Wrote %ld bytes to the kernel (total bytes written = %llu)", buf, 0x1Cu);
    }
    a3 += v13;
    v5 -= v13;
    unint64_t v8 = *(unsigned int *)(a1 + 104);
    if (!v8 || v5 <= 0) {
      return a3;
    }
  }
  if (v8 >= v5) {
    unint64_t v8 = v5;
  }
  uint64_t v14 = *(void *)(a1 + 40);
  if (*(void *)(v14 + 184) >= (unint64_t)v8) {
    uint64_t v13 = v8;
  }
  else {
    uint64_t v13 = *(void *)(v14 + 184);
  }
  int v12 = flow_director_send_cfdata(v14, *(_DWORD *)(a1 + 24), a2, a3, v13, 0);
  if (!v12) {
    goto LABEL_15;
  }
LABEL_20:
  if (v12 == 55)
  {
    unint64_t v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109376;
      int v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      _os_log_impl(&dword_212970000, v18, OS_LOG_TYPE_DEFAULT, "(%u): app receive buffer is full, queueing %lu bytes", buf, 0x12u);
    }
  }
  else
  {
    long long v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v22 = *(_DWORD *)(a1 + 24);
      int v23 = strerror(v12);
      *(_DWORD *)buf = 67109634;
      int v25 = v22;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      __int16 v28 = 2080;
      v29 = v23;
      _os_log_error_impl(&dword_212970000, v20, OS_LOG_TYPE_ERROR, "(%u): Got an error when sending %lu bytes to the kernel: %s", buf, 0x1Cu);
    }
  }
  return a3;
}

uint64_t flow_director_send_cfdata(uint64_t a1, unsigned int a2, const __CFData *a3, uint64_t a4, uint64_t a5, unsigned __int8 *__src)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a1)
  {
    int v10 = *(NSObject **)(a1 + 40);
    if (!v10) {
      int v10 = *(NSObject **)(a1 + 24);
    }
    int v19 = 0;
    memset(v18, 0, sizeof(v18));
    LOBYTE(v18[0]) = 3;
    DWORD1(v18[0]) = bswap32(a2);
    if (__src)
    {
      size_t v11 = *__src;
      if (v11 >= 0x28) {
        __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
      }
      BYTE8(v18[0]) = 12;
      *(_DWORD *)((char *)v18 + 9) = v11 << 24;
      memcpy((void *)((unint64_t)v18 | 0xD), __src, v11);
      unint64_t v12 = v11 + 13;
    }
    else
    {
      unint64_t v12 = 8;
    }
    BytePtr = CFDataGetBytePtr(a3);
    uint64_t v16 = flow_director_ctl_write(v10, (uint64_t)v18, v12, (uint64_t)&BytePtr[a4], a5, (uint64_t)"data");
    uint64_t v14 = v16;
    if (v16 && v16 != 55) {
      flow_director_abort(a1, 0);
    }
  }
  else
  {
    uint64_t v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v18[0]) = 67109120;
      DWORD1(v18[0]) = dword_267796AD8;
      _os_log_impl(&dword_212970000, v13, OS_LOG_TYPE_DEFAULT, "(%u): Director is NULL, dropping data", (uint8_t *)v18, 8u);
    }
    return 22;
  }
  return v14;
}

os_unfair_lock_s *NEFlowCopyProperty(os_unfair_lock_s *cf, const void *a2)
{
  int v3 = cf;
  if (runtime_inited == -1)
  {
    if (!cf) {
      return v3;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!v3) {
      return v3;
    }
  }
  uint64_t v4 = __kNEFlowTypeID;
  if (CFGetTypeID(v3) == v4)
  {
    uint64_t v5 = v3 + 30;
    os_unfair_lock_lock(v3 + 30);
    if (CFEqual(a2, @"Type"))
    {
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFTypeID v7 = v3 + 4;
      CFNumberType v8 = kCFNumberCFIndexType;
LABEL_6:
      unsigned int v9 = (os_unfair_lock_s *)CFNumberCreate(v6, v8, v7);
LABEL_7:
      int v3 = v9;
LABEL_36:
      os_unfair_lock_unlock(v5);
      return v3;
    }
    if (CFEqual(a2, @"DestinationName"))
    {
      if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
      {
        int v10 = *(const void **)&v3[16]._os_unfair_lock_opaque;
        if (!v10) {
          goto LABEL_35;
        }
LABEL_16:
        unsigned int v9 = (os_unfair_lock_s *)CFRetain(v10);
        goto LABEL_7;
      }
    }
    else
    {
      if (CFEqual(a2, @"DestinationEndpoint"))
      {
        if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
        {
          int v10 = *(const void **)&v3[12]._os_unfair_lock_opaque;
          goto LABEL_16;
        }
        goto LABEL_34;
      }
      if (CFEqual(a2, @"AppRuleIdentifier"))
      {
        if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
        {
          int v10 = *(const void **)&v3[18]._os_unfair_lock_opaque;
          if (!v10)
          {
            int v10 = *(const void **)&v3[20]._os_unfair_lock_opaque;
            if (!v10) {
              goto LABEL_35;
            }
          }
          goto LABEL_16;
        }
        goto LABEL_34;
      }
      if (!CFEqual(a2, @"AppUnique"))
      {
        if (CFEqual(a2, @"ServiceType"))
        {
          if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1) > 1) {
            goto LABEL_34;
          }
          CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFTypeID v7 = v3 + 24;
        }
        else
        {
          if (CFEqual(a2, @"LocalEndpoint"))
          {
            if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
            {
              int v10 = *(const void **)&v3[14]._os_unfair_lock_opaque;
              if (!v10) {
                goto LABEL_35;
              }
              goto LABEL_16;
            }
            goto LABEL_34;
          }
          if (CFEqual(a2, @"Flags"))
          {
            CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            CFTypeID v7 = v3 + 86;
            CFNumberType v8 = kCFNumberSInt32Type;
            goto LABEL_6;
          }
          if (CFEqual(a2, @"AppData"))
          {
            int v10 = *(const void **)&v3[88]._os_unfair_lock_opaque;
            if (!v10) {
              goto LABEL_35;
            }
            goto LABEL_16;
          }
          if (CFEqual(a2, @"AppAuditToken"))
          {
            int v10 = *(const void **)&v3[90]._os_unfair_lock_opaque;
            if (!v10) {
              goto LABEL_35;
            }
            goto LABEL_16;
          }
          if (CFEqual(a2, @"FilterFlowID"))
          {
            int v10 = *(const void **)&v3[98]._os_unfair_lock_opaque;
            if (!v10) {
              goto LABEL_35;
            }
            goto LABEL_16;
          }
          if (!CFEqual(a2, @"OutboundInterfaceIndex") || !v3[100]._os_unfair_lock_opaque) {
            goto LABEL_35;
          }
          CFTypeID v7 = v3 + 100;
          CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
        }
        CFNumberType v8 = kCFNumberIntType;
        goto LABEL_6;
      }
      if ((unint64_t)(*(void *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
      {
        int v10 = *(const void **)&v3[22]._os_unfair_lock_opaque;
        if (!v10) {
          goto LABEL_35;
        }
        goto LABEL_16;
      }
    }
LABEL_34:
    __NEFlowSetError((uint64_t)v3, 4);
LABEL_35:
    int v3 = 0;
    goto LABEL_36;
  }
  return 0;
}

uint64_t NEFlowSetProperty(uint64_t cf, const void *a2, const __CFData *a3)
{
  uint64_t v5 = cf;
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (runtime_inited == -1)
  {
    if (!cf) {
      return v5;
    }
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_7);
    if (!v5) {
      return v5;
    }
  }
  uint64_t v6 = __kNEFlowTypeID;
  if (CFGetTypeID((CFTypeRef)v5) == v6)
  {
    CFTypeID v7 = (os_unfair_lock_s *)(v5 + 120);
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 120));
    if (CFEqual(a2, @"LocalEndpoint"))
    {
      CFTypeID TypeID = CFDataGetTypeID();
      if (a3 && CFGetTypeID(a3) == TypeID)
      {
        uint64_t v9 = NEFlowResetLocalEndpoint(v5, a3);
        if (v9)
        {
          CFIndex v10 = v9;
          uint64_t v11 = v5;
LABEL_28:
          __NEFlowSetError(v11, v10);
          goto LABEL_29;
        }
LABEL_26:
        uint64_t v5 = 1;
LABEL_30:
        os_unfair_lock_unlock(v7);
        return v5;
      }
    }
    else if (CFEqual(a2, @"AppData"))
    {
      CFTypeID v12 = CFDataGetTypeID();
      if (a3 && CFGetTypeID(a3) == v12)
      {
        uint64_t v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          int v19 = *(_DWORD *)(v5 + 24);
          *(_DWORD *)buf = 67109378;
          int v24 = v19;
          __int16 v25 = 2080;
          __int16 v26 = "Sending a properties update with app data";
          _os_log_debug_impl(&dword_212970000, v13, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
        }
        if ((*(unsigned char *)(v5 + 100) & 4) != 0) {
          flow_director_send_properties_update(*(void *)(v5 + 40), *(_DWORD *)(v5 + 24), 0, a3);
        }
        uint64_t v14 = *(const void **)(v5 + 352);
        if (v14)
        {
          CFRelease(v14);
          *(void *)(v5 + 352) = 0;
        }
        *(void *)(v5 + 352) = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a3);
        goto LABEL_26;
      }
    }
    else
    {
      if (!CFEqual(a2, @"OutboundInterfaceIndex"))
      {
LABEL_29:
        uint64_t v5 = 0;
        goto LABEL_30;
      }
      CFTypeID v15 = CFNumberGetTypeID();
      if (a3 && CFGetTypeID(a3) == v15)
      {
        unsigned int valuePtr = 0;
        CFNumberGetValue(a3, kCFNumberIntType, &valuePtr);
        unsigned int v16 = valuePtr;
        *(_DWORD *)(v5 + 400) = valuePtr;
        *(_OWORD *)int v22 = *(_OWORD *)"<none>";
        if_indextoname(v16, v22);
        CFAllocatorRef v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v20 = *(_DWORD *)(v5 + 24);
          *(_DWORD *)buf = 67109378;
          int v24 = v20;
          __int16 v25 = 2080;
          __int16 v26 = v22;
          _os_log_debug_impl(&dword_212970000, v17, OS_LOG_TYPE_DEBUG, "(%u): Setting outbound interface to %s", buf, 0x12u);
        }
        flow_director_send_properties_update(*(void *)(v5 + 40), *(_DWORD *)(v5 + 24), valuePtr, 0);
        goto LABEL_26;
      }
    }
    uint64_t v11 = v5;
    CFIndex v10 = 4;
    goto LABEL_28;
  }
  return 0;
}

uint64_t NEFlowResetLocalEndpoint(uint64_t a1, CFDataRef theData)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  BytePtr = (UInt8 *)CFDataGetBytePtr(theData);
  CFIndex length = 0;
  long long v31 = 0uLL;
  int v32 = 0;
  int v5 = *(_DWORD *)(a1 + 400);
  CFStringRef v6 = NECreateAddressString((CFStringRef)BytePtr);
  if (v6)
  {
    CFTypeID v7 = (const char *)v6;
    if (!NEIsWildcardAddress(BytePtr))
    {
      int v8 = NEGetInterfaceForAddress(BytePtr);
      if (v8) {
        goto LABEL_7;
      }
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v29 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)buf = 67109378;
        int v34 = v29;
        __int16 v35 = 2112;
        uint64_t v36 = v7;
        _os_log_error_impl(&dword_212970000, v9, OS_LOG_TYPE_ERROR, "(%u): No interface found for %@, not re-setting the interface", buf, 0x12u);
      }
    }
    int v8 = v5;
LABEL_7:
    CFRelease(v7);
    CFDataRef v10 = *(const __CFData **)(a1 + 56);
    if (v10)
    {
      uint64_t v11 = CFDataGetBytePtr(v10);
      CFTypeID v12 = v11;
      int v13 = BytePtr[1];
      if (v13 == 2)
      {
        LOWORD(length) = 528;
        WORD1(length) = *((_WORD *)BytePtr + 1);
        int v14 = v11[1];
        if (v14 == 2) {
          HIDWORD(length) = *((_DWORD *)v11 + 1);
        }
      }
      else
      {
        LOWORD(length) = 7708;
        WORD1(length) = *((_WORD *)BytePtr + 1);
        int v14 = v11[1];
        if (v14 == 30) {
          long long v31 = *(_OWORD *)(v11 + 8);
        }
      }
      BOOL v18 = NEIsWildcardAddress(BytePtr);
      if (v13 != v14 || v18)
      {
        int v20 = ne_log_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          int v28 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)buf = 67109378;
          int v34 = v28;
          __int16 v35 = 2080;
          uint64_t v36 = "New local address is unspecified or has a different address family, only re-setting the local port";
          _os_log_debug_impl(&dword_212970000, v20, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
        }
        CFRelease(*(CFTypeRef *)(a1 + 56));
        CFDataRef v21 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&length, length);
        uint64_t result = 0;
        *(void *)(a1 + 56) = v21;
        return result;
      }
      if (v13 == 30)
      {
        uint64_t v22 = *((void *)BytePtr + 1);
        uint64_t v23 = *((void *)BytePtr + 2);
        int v24 = (long long *)(BytePtr + 8);
        if (*((void *)v12 + 1) != v22 || *((void *)v12 + 2) != v23)
        {
          *(_DWORD *)(a1 + 100) |= 0x40u;
          long long v31 = *v24;
        }
      }
      else if (v13 == 2 && *((_DWORD *)v12 + 1) != *((_DWORD *)BytePtr + 1))
      {
        *(_DWORD *)(a1 + 100) |= 0x40u;
        HIDWORD(length) = *((_DWORD *)BytePtr + 1);
      }
      CFRelease(*(CFTypeRef *)(a1 + 56));
      CFAllocatorRef v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)&length, length);
    }
    else
    {
      CFAllocatorRef v17 = (void *)CFRetain(theData);
    }
    __int16 v26 = v17;
    uint64_t result = 0;
    *(void *)(a1 + 56) = v26;
    *(_DWORD *)(a1 + 400) = v8;
    return result;
  }
  CFTypeID v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v27 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)buf = 67109378;
    int v34 = v27;
    __int16 v35 = 2080;
    uint64_t v36 = "Cannot reset the local endpoint, given address is invalid";
    _os_log_error_impl(&dword_212970000, v15, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
  }
  return 4;
}

void flow_director_send_properties_update(uint64_t a1, unsigned int a2, int a3, const __CFData *a4)
{
  CFTypeID TypeID = CFDataGetTypeID();
  if (a4 && CFGetTypeID(a4) == TypeID)
  {
    CFIndex v9 = CFDataGetLength(a4) + 4;
    uint64_t v10 = 10;
  }
  else
  {
    uint64_t v10 = 5;
    CFIndex v9 = 4;
  }
  unint64_t v11 = v10 + v9;
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v13 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10 + v9 + 8, 0);
  *(unsigned char *)int v13 = 7;
  v13[1] = bswap32(a2);
  if (v11 <= 8) {
    goto LABEL_13;
  }
  uint64_t v14 = (uint64_t)v13;
  *((unsigned char *)v13 + 8) = 13;
  *(_DWORD *)((char *)v13 + 9) = 0x4000000;
  *(_DWORD *)((char *)v13 + 13) = a3;
  CFTypeID v15 = CFDataGetTypeID();
  if (a4 && CFGetTypeID(a4) == v15)
  {
    unsigned int Length = CFDataGetLength(a4);
    BytePtr = CFDataGetBytePtr(a4);
    if (v11 - 9 >= (unint64_t)Length + 5)
    {
      *(unsigned char *)(v14 + 17) = 31;
      *(_DWORD *)(v14 + 18) = bswap32(Length);
      memcpy((void *)(v14 + 22), BytePtr, Length);
      goto LABEL_10;
    }
LABEL_13:
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  }
LABEL_10:
  flow_director_msg_send(a1, v14, v11 + 8, 0);

  CFAllocatorDeallocate(v12, (void *)v14);
}

CFDictionaryRef NEFlowCopyStateDictionary(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  *(_OWORD *)v43 = xmmword_264194830;
  long long v44 = *(_OWORD *)&off_264194840;
  long long v45 = xmmword_264194850;
  long long v46 = *(_OWORD *)&off_264194860;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  *(_OWORD *)keys = xmmword_264194870;
  long long v37 = *(_OWORD *)&off_264194880;
  long long v38 = xmmword_264194890;
  long long v34 = 0u;
  long long v35 = 0u;
  *(_OWORD *)values = 0u;
  *(_OWORD *)uint64_t v30 = xmmword_2641948A0;
  long long v31 = *(_OWORD *)off_2641948B0;
  int v32 = @"SendBufferSize";
  CFNumberRef v29 = 0;
  *(_OWORD *)int v27 = 0u;
  long long v28 = 0u;
  CFDataRef v4 = *(const __CFData **)(a1 + 48);
  if (v4)
  {
    BytePtr = CFDataGetBytePtr(v4);
    CFStringRef v6 = NECreateAddressStringWithPort((uint64_t)BytePtr);
  }
  else
  {
    CFStringRef v6 = @"<unknown>";
  }
  CFDataRef v7 = *(const __CFData **)(a1 + 56);
  if (v7)
  {
    int v8 = CFDataGetBytePtr(v7);
    CFIndex v9 = NECreateAddressStringWithPort((uint64_t)v8);
  }
  else
  {
    CFIndex v9 = @"<unknown>";
  }
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberLongType, (const void *)(a1 + 24));
  CFAllocatorRef v12 = @"TCP";
  if (*(void *)(a1 + 16) == 2) {
    CFAllocatorRef v12 = @"UDP";
  }
  v39[0] = v11;
  v39[1] = v12;
  int v13 = *(const void **)(a1 + 80);
  if (v13) {
    uint64_t v14 = (__CFString *)CFRetain(v13);
  }
  else {
    uint64_t v14 = @"<unknown>";
  }
  *(void *)&long long v40 = v14;
  *((void *)&v40 + 1) = v6;
  *(void *)&long long v41 = v9;
  CFTypeID v15 = *(const void **)(a1 + 64);
  if (v15) {
    unsigned int v16 = (__CFString *)CFRetain(v15);
  }
  else {
    unsigned int v16 = @"<unknown>";
  }
  *((void *)&v41 + 1) = v16;
  uint64_t v17 = *(void *)(a1 + 16);
  uint64_t v18 = 328;
  if (v17 == 2) {
    uint64_t v18 = 336;
  }
  BOOL valuePtr = *(void *)(a1 + v18) != 0;
  if (v17 == 2)
  {
    size_t size = *(unsigned int *)(a1 + 280);
  }
  else
  {
    size_t size = *(void *)(a1 + 112);
    if (size) {
      size_t size = dispatch_data_get_size((dispatch_data_t)size);
    }
  }
  size_t v25 = size;
  values[0] = CFNumberCreate(v10, kCFNumberLongType, &v25);
  values[1] = CFNumberCreate(v10, kCFNumberIntType, &valuePtr);
  *(void *)&long long v34 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 232));
  *((void *)&v34 + 1) = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 240));
  *(void *)&long long v35 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 248));
  *((void *)&v35 + 1) = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 256));
  uint64_t v20 = 0;
  *(void *)&long long v42 = CFDictionaryCreate(v10, (const void **)keys, (const void **)values, 6, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  do
    CFRelease(values[v20++]);
  while (v20 != 6);
  v27[0] = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 8));
  v27[1] = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 16));
  *(void *)&long long v28 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 24));
  *((void *)&v28 + 1) = CFNumberCreate(v10, kCFNumberIntType, (const void *)(a2 + 32));
  CFNumberRef v29 = CFNumberCreate(v10, kCFNumberIntType, (const void *)(a2 + 36));
  uint64_t v21 = 0;
  *((void *)&v42 + 1) = CFDictionaryCreate(v10, (const void **)v30, (const void **)v27, 5, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  do
    CFRelease(v27[v21++]);
  while (v21 != 5);
  CFDictionaryRef v22 = CFDictionaryCreate(v10, (const void **)v43, (const void **)v39, 8, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  for (uint64_t i = 0; i != 8; ++i)
    CFRelease(v39[i]);
  return v22;
}

uint64_t NEFlowTLVNext(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 5) {
    return 0;
  }
  int v3 = *(unsigned char **)a1;
  *(unsigned char *)a2 = **(unsigned char **)a1;
  unsigned int v4 = *(_DWORD *)(v3 + 1);
  uint64_t v5 = bswap32(v4);
  *(_DWORD *)(a2 + 4) = v5;
  if (v4)
  {
    unint64_t v6 = v5 + 5;
    if (v6 > v2) {
      return 0;
    }
    int v8 = v3 + 5;
  }
  else
  {
    int v8 = 0;
    unint64_t v6 = 5;
  }
  *(void *)(a2 + 8) = v8;
  *(void *)a1 = &v3[v6];
  *(void *)(a1 + 8) = v2 - v6;
  return 1;
}

_DWORD *NEFlowTLVMsgCreate(unsigned int a1, char a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v10 = 5 * a3 + a4;
  uint64_t result = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10 + 8, 0);
  *(unsigned char *)uint64_t result = a2;
  result[1] = bswap32(a1);
  if (a6)
  {
    *a6 = result + 2;
    a6[1] = v10;
  }
  *a5 = v10 + 8;
  return result;
}

char *NEFlowDirectorCreateInternal(int a1, NSObject *a2, unint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a1 < 0)
  {
    CFTypeID v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_DWORD *)&buf[0].sa_len = 136315138;
    *(void *)&buf[0].sa_data[2] = "NEFlowDirectorCreateInternal";
    unsigned int v16 = "%s called with null (control_socket >= 0)";
LABEL_20:
    _os_log_fault_impl(&dword_212970000, v15, OS_LOG_TYPE_FAULT, v16, &buf[0].sa_len, 0xCu);
    return 0;
  }
  if (!((unint64_t)a2 | a3))
  {
    CFTypeID v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_DWORD *)&buf[0].sa_len = 136315138;
    *(void *)&buf[0].sa_data[2] = "NEFlowDirectorCreateInternal";
    unsigned int v16 = "%s called with null (callback_queue != ((void *)0) || bridge_context != ((void *)0))";
    goto LABEL_20;
  }
  if (NEFlowDirectorCreateInternal_init_predicate != -1) {
    dispatch_once(&NEFlowDirectorCreateInternal_init_predicate, &__block_literal_global_104);
  }
  unint64_t v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109378;
    *(_DWORD *)&buf[0].sa_data[2] = dword_267796AD8;
    *(_WORD *)&buf[0].sa_data[6] = 2080;
    *(void *)&buf[0].sa_data[8] = "Creating a new flow director";
    _os_log_impl(&dword_212970000, v6, OS_LOG_TYPE_DEFAULT, "(%u): %s", &buf[0].sa_len, 0x12u);
  }
  CFDataRef v7 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 200, 0);
  *(_OWORD *)CFDataRef v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((_OWORD *)v7 + 5) = 0u;
  *((_OWORD *)v7 + 6) = 0u;
  *((_OWORD *)v7 + 7) = 0u;
  *((_OWORD *)v7 + 8) = 0u;
  *((_OWORD *)v7 + 9) = 0u;
  *((_OWORD *)v7 + 10) = 0u;
  *((_OWORD *)v7 + 11) = 0u;
  *((void *)v7 + 24) = 0;
  rb_tree_init((rb_tree_t *)(v7 + 56), (const rb_tree_ops_t *)NEFlowDirectorCreateInternal_rb_ops);
  if (a2)
  {
    *((void *)v7 + 1) = a2;
    dispatch_retain(a2);
  }
  int v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(v8);
  uint64_t v10 = dispatch_queue_attr_make_with_qos_class(initially_inactive, QOS_CLASS_USER_INTERACTIVE, 0);
  CFNumberRef v11 = dispatch_queue_create("flow director queue", v10);
  *((void *)v7 + 2) = v11;
  if (a3)
  {
    nw_queue_context_target_dispatch_queue();
    *(void *)CFDataRef v7 = nw_retain((void *)a3);
    CFNumberRef v11 = *((void *)v7 + 2);
  }
  dispatch_set_context(v11, v7);
  dispatch_set_finalizer_f(*((dispatch_object_t *)v7 + 2), (dispatch_function_t)flow_director_deallocate);
  dispatch_activate(*((dispatch_object_t *)v7 + 2));
  *((void *)v7 + 3) = flow_director_create_io_handler((uint64_t)v7, a1);
  socklen_t v17 = 32;
  memset(buf, 0, sizeof(buf));
  int v12 = getpeername(a1, buf, &v17);
  int v13 = *(_DWORD *)&buf[0].sa_data[6];
  if (v12) {
    int v13 = 0;
  }
  *((_DWORD *)v7 + 8) = v13;
  flow_director_reset_default_interface_info((uint64_t)v7, "lo0");
  NEFlowDirectorSetMaxSendSize((uint64_t)v7, 0x100000uLL);
  NEFlowDirectorSetMaxReceiveSize((uint64_t)v7, 0x200000uLL);
  return v7;
}

NSObject *flow_director_create_io_handler(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v3 = *(NSObject **)(a1 + 16);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = __flow_director_create_io_handler_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_157;
  aBlock[4] = a1;
  unsigned int v4 = _Block_copy(aBlock);
  uint64_t v5 = dispatch_source_create(MEMORY[0x263EF83E8], a2, 0, v3);
  int v6 = fcntl(a2, 3);
  LODWORD(v7) = v6 | 4;
  if (v6 >= 0) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 4;
  }
  fcntl(a2, 4, v7);
  unint64_t v14 = v3 | 0xBAACCAAB00000000;
  int v8 = change_fdguard_np();
  if (v8)
  {
    int v9 = v8;
    uint64_t v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(handler) = 67109376;
      HIDWORD(handler) = a2;
      LOWORD(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 2) = v9;
      _os_log_error_impl(&dword_212970000, v10, OS_LOG_TYPE_ERROR, "Unable to guard control socket fd %d (%d)", (uint8_t *)&handler, 0xEu);
    }
  }
  dispatch_set_context(v5, v4);
  uint64_t handler = MEMORY[0x263EF8330];
  uint64_t v16 = 0x40000000;
  socklen_t v17 = __flow_director_create_ctl_source_block_invoke;
  uint64_t v18 = &__block_descriptor_tmp_158;
  int v21 = a2;
  uint64_t v19 = v5;
  unint64_t v20 = v14;
  dispatch_source_set_cancel_handler(v5, &handler);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 0x40000000;
  v13[2] = __flow_director_create_ctl_source_block_invoke_2;
  v13[3] = &__block_descriptor_tmp_159;
  v13[4] = v5;
  dispatch_source_set_event_handler(v5, v13);
  return v5;
}

uint64_t flow_director_reset_default_interface_info(uint64_t a1, const char *a2)
{
  CFStringRef v4 = (const __CFString *)NECopyInterfaceAddress(a2, 2);
  if (v4)
  {
    CFStringRef v5 = v4;
    int v6 = NECreateAddressStructFromString(v4, 0, 0);
    CFRelease(v5);
    uint64_t v7 = *(void **)(a1 + 160);
    if (v7) {
      free(v7);
    }
    *(void *)(a1 + 160) = v6;
  }
  CFStringRef v8 = (const __CFString *)NECopyInterfaceAddress(a2, 30);
  if (v8)
  {
    CFStringRef v9 = v8;
    uint64_t v10 = NECreateAddressStructFromString(v8, 0, 0);
    CFRelease(v9);
    CFNumberRef v11 = *(void **)(a1 + 168);
    if (v11) {
      free(v11);
    }
    *(void *)(a1 + 168) = v10;
  }
  uint64_t result = if_nametoindex(a2);
  *(_DWORD *)(a1 + 176) = result;
  return result;
}

void NEFlowDirectorSetMaxSendSize(uint64_t a1, unint64_t a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v18 = a2;
  unint64_t v3 = a2 - 8;
  if (a2 <= 8)
  {
    CFStringRef v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109632;
    int v20 = dword_267796AD8;
    __int16 v21 = 2048;
    unint64_t v22 = a2;
    __int16 v23 = 2048;
    uint64_t v24 = 8;
    CFStringRef v5 = "(%u): Cannot set the maximum send size (%lu) to less than %lu";
    int v6 = v4;
    uint32_t v7 = 28;
LABEL_10:
    _os_log_error_impl(&dword_212970000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
    return;
  }
  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 24));
  int v10 = handle;
  if (handle <= 0)
  {
    socklen_t v17 = ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109376;
    int v20 = dword_267796AD8;
    __int16 v21 = 1024;
    LODWORD(v22) = v10;
    CFStringRef v5 = "(%u): Did not get a valid control socket from the dispatch source: %d";
    int v6 = v17;
    uint32_t v7 = 14;
    goto LABEL_10;
  }
  int v11 = setsockopt(handle, 0xFFFF, 4097, &v18, 4u);
  int v12 = ne_log_obj();
  int v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v14 = dword_267796AD8;
    CFTypeID v15 = __error();
    uint64_t v16 = strerror(*v15);
    *(_DWORD *)buf = 67109378;
    int v20 = v14;
    __int16 v21 = 2080;
    unint64_t v22 = (unint64_t)v16;
    CFStringRef v5 = "(%u): Failed to set SO_SNDBUF on the control socket: %s";
    int v6 = v13;
    uint32_t v7 = 18;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v20 = dword_267796AD8;
    __int16 v21 = 2048;
    unint64_t v22 = a2;
    _os_log_impl(&dword_212970000, v13, OS_LOG_TYPE_DEFAULT, "(%u): Set SO_SNDBUF on the control socket to %lu", buf, 0x12u);
  }
  *(void *)(a1 + 184) = v3;
}

void NEFlowDirectorSetMaxReceiveSize(uint64_t a1, unint64_t a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int v18 = a2;
  unint64_t v3 = a2 - 8;
  if (a2 <= 8)
  {
    CFStringRef v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109632;
    int v20 = dword_267796AD8;
    __int16 v21 = 2048;
    unint64_t v22 = a2;
    __int16 v23 = 2048;
    uint64_t v24 = 8;
    CFStringRef v5 = "(%u): Cannot set the maximum receive size (%lu) to less than %lu";
    int v6 = v4;
    uint32_t v7 = 28;
LABEL_10:
    _os_log_error_impl(&dword_212970000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
    return;
  }
  int handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 24));
  int v10 = handle;
  if (handle <= 0)
  {
    socklen_t v17 = ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109376;
    int v20 = dword_267796AD8;
    __int16 v21 = 1024;
    LODWORD(v22) = v10;
    CFStringRef v5 = "(%u): Did not get a valid control socket from the dispatch source: %d";
    int v6 = v17;
    uint32_t v7 = 14;
    goto LABEL_10;
  }
  int v11 = setsockopt(handle, 0xFFFF, 4098, &v18, 4u);
  int v12 = ne_log_obj();
  int v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v14 = dword_267796AD8;
    CFTypeID v15 = __error();
    uint64_t v16 = strerror(*v15);
    *(_DWORD *)buf = 67109378;
    int v20 = v14;
    __int16 v21 = 2080;
    unint64_t v22 = (unint64_t)v16;
    CFStringRef v5 = "(%u): Failed to set SO_RCVBUF on the control socket: %s";
    int v6 = v13;
    uint32_t v7 = 18;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v20 = dword_267796AD8;
    __int16 v21 = 2048;
    unint64_t v22 = a2;
    _os_log_impl(&dword_212970000, v13, OS_LOG_TYPE_DEFAULT, "(%u): Set SO_RCVBUF on the control socket to %lu", buf, 0x12u);
  }
  *(void *)(a1 + 192) = v3;
}

void __flow_director_create_io_handler_block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4, unint64_t a5)
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  unsigned int v114 = 0;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 40) == a2) {
    uint32_t v7 = "data";
  }
  else {
    uint32_t v7 = "control";
  }
  if (!a4 || !a5)
  {
    int v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = dword_267796AD8;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v7;
      int v11 = "(%u): %s: aborting director due to EOF";
      int v12 = v14;
      uint32_t v13 = 18;
      goto LABEL_26;
    }
LABEL_10:
    flow_director_abort(*(void *)(a1 + 32), 0);
    return;
  }
  if (a3)
  {
    int v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = dword_267796AD8;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = v7;
      *(_WORD *)&buf[18] = 2080;
      *(void *)&buf[20] = strerror(a3);
      int v11 = "(%u): %s: aborting director due to read error: %s";
      int v12 = v10;
      uint32_t v13 = 28;
LABEL_26:
      _os_log_error_impl(&dword_212970000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (a5 <= 7)
  {
    CFTypeID v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = dword_267796AD8;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = a5;
    uint64_t v16 = "(%u): %s: received a message that is too short (%zu)";
    socklen_t v17 = v15;
    uint32_t v18 = 28;
    goto LABEL_15;
  }
  unsigned int v114 = bswap32(*((_DWORD *)a4 + 1));
  if (*a4 == 11)
  {
    uint64_t v20 = *(void *)(v6 + 152);
    *(void *)(v6 + 152) = 0;
    if (v20)
    {
      unint64_t v21 = a5 - 8;
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      if (v21 < 5)
      {
LABEL_19:
        __int16 v23 = *(NSObject **)(v6 + 8);
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 0x40000000;
        *(void *)&uint8_t buf[16] = __flow_director_handle_flow_states_block_invoke;
        *(void *)&buf[24] = &unk_264194BC0;
        *(void *)&buf[32] = v20;
        *(void *)&buf[40] = Mutable;
        dispatch_async(v23, buf);
        return;
      }
      long long v31 = a4 + 8;
      while (1)
      {
        int v32 = *v31;
        unsigned int v33 = *(_DWORD *)(v31 + 1);
        uint64_t v34 = bswap32(v33);
        if (v33)
        {
          uint64_t v35 = v34 + 5;
          if (v34 + 5 > v21) {
            goto LABEL_19;
          }
          uint64_t v36 = v31 + 5;
        }
        else
        {
          uint64_t v36 = 0;
          uint64_t v35 = 5;
        }
        if (v32 == 39)
        {
          memset(buf, 0, 40);
          if (v34 > 0x27)
          {
            long long v42 = *((_OWORD *)v36 + 1);
            *(_OWORD *)buf = *(_OWORD *)v36;
            *(_OWORD *)&uint8_t buf[16] = v42;
            *(void *)&buf[32] = *((void *)v36 + 4);
            node = rb_tree_find_node((rb_tree_t *)(v6 + 56), buf);
            if (node)
            {
              CFDictionaryRef v44 = NEFlowCopyStateDictionary((uint64_t)node, (uint64_t)buf);
              CFArrayAppendValue(Mutable, v44);
              CFRelease(v44);
              goto LABEL_47;
            }
            long long v45 = ne_log_obj();
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
              goto LABEL_47;
            }
            *(_DWORD *)bytes = 67109376;
            *(_DWORD *)&bytes[4] = dword_267796AD8;
            *(_WORD *)&UInt8 bytes[8] = 1024;
            *(_DWORD *)&bytes[10] = *(_DWORD *)buf;
            long long v38 = bytes;
            uint32_t v39 = v45;
            long long v40 = "(%u): Cannot find flow with ID from flow state (%u)";
            goto LABEL_43;
          }
          long long v37 = ne_log_obj();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)bytes = 67109376;
            *(_DWORD *)&bytes[4] = dword_267796AD8;
            *(_WORD *)&UInt8 bytes[8] = 1024;
            *(_DWORD *)&bytes[10] = v34;
            long long v38 = bytes;
            uint32_t v39 = v37;
            long long v40 = "(%u): Got a flow state TLV with an invalid length: %u";
LABEL_43:
            _os_log_error_impl(&dword_212970000, v39, OS_LOG_TYPE_ERROR, v40, v38, 0xEu);
          }
        }
        else
        {
          long long v41 = ne_log_obj();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = dword_267796AD8;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v32;
            long long v38 = buf;
            uint32_t v39 = v41;
            long long v40 = "(%u): Got a non-state TLV: %u";
            goto LABEL_43;
          }
        }
LABEL_47:
        v31 += v35;
        v21 -= v35;
        if (v21 <= 4) {
          goto LABEL_19;
        }
      }
    }
    uint64_t v30 = ne_log_obj();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = dword_267796AD8;
    uint64_t v16 = "(%u): Got flow states, but no callback is available";
    socklen_t v17 = v30;
    uint32_t v18 = 8;
LABEL_15:
    _os_log_error_impl(&dword_212970000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    return;
  }
  uint64_t v24 = (os_unfair_lock_s *)rb_tree_find_node((rb_tree_t *)(v6 + 56), &v114);
  uint64_t v25 = v24;
  int v26 = *a4;
  if (v26 != 1)
  {
    if (v24)
    {
      switch(*a4)
      {
        case 2u:
          flow_director_handle_connect_result(*(void *)(a1 + 32), (uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 3u:
          flow_director_handle_data(*(void *)(a1 + 32), (uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 4u:
          flow_director_handle_close((uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 5u:
          flow_director_handle_read_notification(v24);
          break;
        default:
          return;
      }
      return;
    }
    if ((v26 & 0xFE) != 2) {
      return;
    }
    v54 = ne_log_obj();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      return;
    }
    if (*a4 - 1 > 6) {
      CFStringRef v55 = "unknwon";
    }
    else {
      CFStringRef v55 = off_264194E98[(*a4 - 1)];
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&uint8_t buf[4] = dword_267796AD8;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2080;
    *(void *)&buf[20] = v55;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v114;
    uint64_t v16 = "(%u): %s: Recevied a %s message for flow %u, but the flow cannot be found";
    socklen_t v17 = v54;
    uint32_t v18 = 34;
    goto LABEL_15;
  }
  uint64_t v27 = *(void *)(a1 + 32);
  unsigned int v28 = v114;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v132 = 0u;
  memset(buf, 0, sizeof(buf));
  unsigned int v115 = 0;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v128 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v125 = 0u;
  memset(bytes, 0, sizeof(bytes));
  if (v24)
  {
    CFNumberRef v29 = ne_log_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint32_t os_unfair_lock_opaque = v25[6]._os_unfair_lock_opaque;
      long long v80 = strerror(37);
      *(_DWORD *)dst = 67109378;
      *(_DWORD *)&dst[4] = os_unfair_lock_opaque;
      *(_WORD *)v117 = 2080;
      *(void *)&v117[2] = v80;
      _os_log_error_impl(&dword_212970000, v29, OS_LOG_TYPE_ERROR, "(%u): Sending error connect result: %s", dst, 0x12u);
    }
    flow_director_send_connect_result(v27, v28, 0x25u, 0, 0, 0, 0, 0, 0);
    return;
  }
  unint64_t v46 = a5 - 8;
  long long v135 = 0uLL;
  long long v136 = 0uLL;
  long long v133 = 0uLL;
  long long v134 = 0uLL;
  long long v132 = 0uLL;
  memset(buf, 0, sizeof(buf));
  bytes[1] = 0;
  uint64_t v47 = ne_log_obj();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)dst = 67109376;
    *(_DWORD *)&dst[4] = dword_267796AD8;
    *(_WORD *)v117 = 1024;
    *(_DWORD *)&v117[2] = v28;
    _os_log_impl(&dword_212970000, v47, OS_LOG_TYPE_DEFAULT, "(%u): Flow %u is connecting", dst, 0xEu);
  }
  CFAllocatorRef v48 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (v46 < 5)
  {
    CFDataRef v109 = 0;
    CFDataRef v110 = 0;
    CFDataRef v49 = 0;
    CFStringRef v50 = 0;
    CFDataRef v51 = 0;
    CFDataRef cf = 0;
    int v102 = 0;
    CFStringRef v52 = 0;
    CFStringRef v53 = 0;
    int v104 = 0;
    unsigned __int16 v100 = 0;
    UInt8 v101 = 5;
    uint64_t v103 = 1;
    goto LABEL_130;
  }
  uint64_t v96 = v27;
  CFDataRef v98 = 0;
  CFDataRef v109 = 0;
  CFDataRef v110 = 0;
  CFStringRef v105 = 0;
  CFDataRef v107 = 0;
  CFDataRef cf = 0;
  int v102 = 0;
  CFStringRef v52 = 0;
  CFStringRef v53 = 0;
  CFDataRef v112 = 0;
  int v104 = 0;
  unsigned __int16 v100 = 0;
  CFStringRef v56 = a4 + 8;
  UInt8 v101 = 5;
  uint64_t v103 = 1;
  do
  {
    int v57 = *v56;
    unsigned int v58 = *(_DWORD *)(v56 + 1);
    size_t v59 = bswap32(v58);
    if (v58)
    {
      uint64_t v60 = v59 + 5;
      if (v59 + 5 > v46) {
        break;
      }
      v61 = v56 + 5;
    }
    else
    {
      v61 = 0;
      uint64_t v60 = 5;
    }
    BOOL v62 = v57 == 21 && v52 == 0;
    if (v62)
    {
      CFStringRef v52 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
      goto LABEL_73;
    }
    if (v57 == 11 || v57 == 23 || v57 == 22)
    {
      __memcpy_chk();
      goto LABEL_73;
    }
    if (v57 == 24 && !v112)
    {
      CFDataRef v112 = CFDataCreate(v48, v61, v59);
      goto LABEL_73;
    }
    if (v57 == 25 && !v53)
    {
      CFStringRef v53 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
      goto LABEL_73;
    }
    switch(*v56)
    {
      case 0x1Du:
        if (v58 == 0x4000000)
        {
          *(_DWORD *)dst = 0;
          __memcpy_chk();
          v102 |= *(_DWORD *)dst;
        }
        break;
      case 0x1Eu:
        if (v58 != 0x4000000) {
          break;
        }
        *(_DWORD *)dst = 0;
        __memcpy_chk();
        uint64_t v63 = *(unsigned int *)dst;
        if (*(_DWORD *)dst != 1)
        {
          if (*(_DWORD *)dst != 3) {
            break;
          }
          uint64_t v63 = 2;
        }
        uint64_t v103 = v63;
        break;
      case 0x1Fu:
        if (cf) {
          CFRelease(cf);
        }
        CFDataRef cf = CFDataCreate(v48, v61, v59);
        break;
      case 0x20u:
        if (v107) {
          CFRelease(v107);
        }
        if (v58 == 0x20000000)
        {
          CFDataRef v107 = CFDataCreate(v48, v61, 32);
        }
        else
        {
          v64 = ne_log_obj();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)dst = 67109376;
            *(_DWORD *)&dst[4] = MEMORY[0x18];
            *(_WORD *)v117 = 1024;
            *(_DWORD *)&v117[2] = v59;
            _os_log_error_impl(&dword_212970000, v64, OS_LOG_TYPE_ERROR, "(%u): Invalid App audit token tlv length: %d", dst, 0xEu);
          }
        }
        break;
      default:
        if (v57 == 20)
        {
          if (v58 == 0x1000000) {
            UInt8 v101 = *v61;
          }
        }
        else if (v57 == 14)
        {
          if (v58 == 0x2000000) {
            unsigned __int16 v100 = *(_WORD *)v61;
          }
        }
        else if (v57 != 33 || v105)
        {
          if (v57 != 34 || v98)
          {
            if (v57 != 35 || v110)
            {
              if (v57 != 36 || v109)
              {
                if (v57 == 13 && !v104 && v58 == 0x4000000) {
                  int v104 = *(_DWORD *)v61;
                }
              }
              else if (v59 > 0x10)
              {
                CFDataRef v109 = 0;
              }
              else
              {
                *(void *)dst = 0;
                *(void *)v117 = 0;
                if (v58 == 0x10000000)
                {
                  uuid_copy(dst, v61);
                }
                else
                {
                  uuid_copy(dst, g_cfil_flow_uuid_template);
                  memcpy(&dst[-v59 + 16], v61, v59);
                }
                CFDataRef v109 = CFDataCreate(v48, dst, 16);
              }
            }
            else if (v58 == 0x20000000)
            {
              CFDataRef v110 = CFDataCreate(v48, v61, 32);
            }
            else
            {
              v65 = ne_log_obj();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)dst = 67109376;
                *(_DWORD *)&dst[4] = MEMORY[0x18];
                *(_WORD *)v117 = 1024;
                *(_DWORD *)&v117[2] = v59;
                _os_log_error_impl(&dword_212970000, v65, OS_LOG_TYPE_ERROR, "(%u): Invalid real audit token tlv length: %d", dst, 0xEu);
              }
              CFDataRef v110 = 0;
            }
          }
          else
          {
            CFDataRef v98 = CFDataCreate(v48, v61, v59);
          }
        }
        else
        {
          CFStringRef v105 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
        }
        break;
    }
LABEL_73:
    v56 += v60;
    v46 -= v60;
  }
  while (v46 > 4);
  uint64_t v27 = v96;
  CFDataRef v49 = v98;
  CFStringRef v50 = v105;
  CFDataRef v51 = v107;
  CFDataRef v66 = v112;
  if (!v112) {
LABEL_130:
  }
    CFDataRef v66 = CFDataCreate(v48, 0, 0);
  CFDataRef v113 = v66;
  if (!v53) {
    CFStringRef v53 = &stru_26C3C67C8;
  }
  if (!v115
    || ((CFTypeID TypeID = CFStringGetTypeID(), !v52) ? (v68 = 0) : CFGetTypeID(v52) != TypeID ? (v68 = 0) : (v68 = v52),
        !v68 && !buf[1] || (CFTypeID v69 = CFStringGetTypeID(), CFGetTypeID(v53) != v69)))
  {
    v76 = ne_log_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)dst = 67110402;
      *(_DWORD *)&dst[4] = dword_267796AD8;
      *(_WORD *)v117 = 1024;
      *(_DWORD *)&v117[2] = v28;
      *(_WORD *)&v117[6] = 1024;
      *(_DWORD *)&v117[8] = v115;
      __int16 v118 = 2112;
      CFStringRef v119 = v52;
      __int16 v120 = 1024;
      int v121 = buf[1];
      __int16 v122 = 2112;
      CFStringRef v123 = v53;
      _os_log_error_impl(&dword_212970000, v76, OS_LOG_TYPE_ERROR, "(%u): Flow properties are incomplete for flow %u, port = %d, dest_name = %@, target_addr family = %d, app_signing_id = %@", dst, 0x2Eu);
    }
    flow_director_send_connect_result(v27, v28, 0x16u, 0, 0, 0, 0, 0, 0);
    CFDataRef v78 = v110;
    CFDataRef v77 = cf;
    goto LABEL_161;
  }
  CFStringRef v106 = v50;
  CFDataRef v70 = v49;
  if (!buf[1])
  {
    buf[1] = 2;
    unsigned int v71 = v115;
    if (*(unsigned char *)(v27 + 122)) {
      BOOL v81 = v115 == 53;
    }
    else {
      BOOL v81 = 0;
    }
    char v74 = v81 && v103 == 2;
LABEL_186:
    char v97 = v74;
    *(_WORD *)&sockaddr buf[2] = bswap32(v71) >> 16;
    unsigned int v75 = 16;
LABEL_187:
    buf[0] = v75;
    goto LABEL_189;
  }
  unsigned int v71 = v115;
  if (*(unsigned char *)(v27 + 122)) {
    BOOL v72 = v115 == 53;
  }
  else {
    BOOL v72 = 0;
  }
  char v74 = v72 && v103 == 2;
  if (buf[1] == 2) {
    goto LABEL_186;
  }
  char v97 = v74;
  if (buf[1] == 30)
  {
    *(_WORD *)&sockaddr buf[2] = bswap32(v115) >> 16;
    unsigned int v75 = 28;
    goto LABEL_187;
  }
  unsigned int v75 = buf[0];
LABEL_189:
  CFDataRef v83 = CFDataCreate(v48, buf, v75);
  int v84 = bytes[1];
  if (!bytes[1])
  {
    int v84 = buf[1];
    bytes[1] = buf[1];
    bytes[0] = buf[0];
  }
  CFDataRef v108 = v51;
  BOOL v85 = NEIsWildcardAddress(bytes);
  int v86 = 16;
  if (!v85)
  {
    if (v84)
    {
LABEL_199:
      CFDataRef v49 = v70;
      goto LABEL_200;
    }
LABEL_201:
    int v99 = 16;
    CFDataRef v88 = 0;
    CFDataRef v49 = v70;
    goto LABEL_202;
  }
  if (!v84) {
    goto LABEL_201;
  }
  if (v84 == 30)
  {
    uint64_t v95 = *(void *)(v27 + 168);
    if (v95)
    {
      *(_OWORD *)&UInt8 bytes[8] = *(_OWORD *)(v95 + 8);
      int v86 = 80;
    }
    else
    {
      int v86 = 16;
    }
    goto LABEL_199;
  }
  BOOL v62 = v84 == 2;
  CFDataRef v49 = v70;
  if (v62)
  {
    uint64_t v87 = *(void *)(v27 + 160);
    if (v87)
    {
      *(_DWORD *)&bytes[4] = *(_DWORD *)(v87 + 4);
      int v86 = 80;
    }
    else
    {
      int v86 = 16;
    }
  }
LABEL_200:
  int v99 = v86;
  CFDataRef v88 = CFDataCreate(v48, bytes, bytes[0]);
LABEL_202:
  if (v104)
  {
    CFDataRef v89 = v83;
    v90 = ne_log_obj();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)dst = 67109632;
      *(_DWORD *)&dst[4] = dword_267796AD8;
      *(_WORD *)v117 = 1024;
      *(_DWORD *)&v117[2] = v28;
      *(_WORD *)&v117[6] = 1024;
      *(_DWORD *)&v117[8] = v104;
      _os_log_debug_impl(&dword_212970000, v90, OS_LOG_TYPE_DEBUG, "(%u): Kernel set interface index for flow %u to %u", dst, 0x14u);
    }
    CFDataRef v83 = v89;
  }
  else
  {
    int v104 = *(_DWORD *)(v27 + 176);
  }
  if (runtime_inited != -1) {
    dispatch_once(&runtime_inited, &__block_literal_global_165);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v92 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = v103;
    *(_DWORD *)(Instance + 24) = v28;
    *(void *)(Instance + 40) = v27;
    *(void *)(Instance + 48) = v83;
    if (v83) {
      CFRetain(v83);
    }
    *(void *)(v92 + 64) = v52;
    if (v52) {
      CFRetain(v52);
    }
    *(void *)(v92 + 56) = v88;
    if (v88) {
      CFRetain(v88);
    }
    *(void *)(v92 + 280) = 0x4000000000000;
    *(void *)(v92 + 32) = 0;
    *(_DWORD *)(v92 + 100) = 0;
    *(_DWORD *)(v92 + 104) = 0;
    *(void *)(v92 + 112) = MEMORY[0x263EF8388];
    *(_DWORD *)(v92 + 120) = 0;
    *(void *)(v92 + 80) = v53;
    CFRetain(v53);
    *(void *)(v92 + 88) = v113;
    if (v113) {
      CFRetain(v113);
    }
    *(_OWORD *)(v92 + 176) = 0u;
    *(_OWORD *)(v92 + 192) = 0u;
    *(_OWORD *)(v92 + 144) = 0u;
    *(_OWORD *)(v92 + 160) = 0u;
    *(_DWORD *)(v92 + 96) = v100;
    *(unsigned char *)(v92 + 108) = v101;
    *(unsigned char *)(v92 + 320) = 0;
    *(void *)(v92 + 264) = 0;
    *(void *)(v92 + 272) = v92 + 264;
    *(void *)(v92 + 304) = 0;
    *(void *)(v92 + 312) = v92 + 304;
    *(_DWORD *)(v92 + 344) = v102;
    *(void *)(v92 + 352) = cf;
    if (cf) {
      CFRetain(cf);
    }
    *(void *)(v92 + 360) = v108;
    CFDataRef v49 = v70;
    if (v108) {
      CFRetain(v108);
    }
    *(void *)(v92 + 368) = v106;
    if (v106) {
      CFRetain(v106);
    }
    *(void *)(v92 + 376) = v70;
    if (v70) {
      CFRetain(v70);
    }
    *(void *)(v92 + 384) = v110;
    if (v110) {
      CFRetain(v110);
    }
    *(void *)(v92 + 392) = v109;
    if (v109) {
      CFRetain(v109);
    }
    *(_DWORD *)(v92 + 400) = v104;
    *(unsigned char *)(v92 + 432) = v97;
  }
  CFRelease(v83);
  if (v88) {
    CFRelease(v88);
  }
  CFDataRef v77 = cf;
  if (!v92) {
    __assert_rtn("flow_director_handle_connect", "NEFlow.c", 3014, "new_flow != NULL");
  }
  CFStringRef v50 = v106;
  if (rb_tree_insert_node((rb_tree_t *)(v27 + 56), (void *)v92) != (void *)v92) {
    __assert_rtn("flow_director_handle_connect", "NEFlow.c", 3015, "rb_tree_insert_node(&director->flow_tree, new_flow) == new_flow");
  }
  *(_DWORD *)(v92 + 100) = v99;
  long long v93 = ne_log_obj();
  CFDataRef v78 = v110;
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    int v94 = *(_DWORD *)(v92 + 24);
    *(_DWORD *)dst = 67109378;
    *(_DWORD *)&dst[4] = v94;
    *(_WORD *)v117 = 2112;
    *(void *)&v117[2] = v92;
    _os_log_impl(&dword_212970000, v93, OS_LOG_TYPE_DEFAULT, "(%u): New flow: %@", dst, 0x12u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v92 + 120));
  flow_startup(v92, v27, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(v92 + 120));
  CFDataRef v51 = v108;
LABEL_161:
  if (v52) {
    CFRelease(v52);
  }
  if (v113) {
    CFRelease(v113);
  }
  CFRelease(v53);
  if (v77) {
    CFRelease(v77);
  }
  if (v51) {
    CFRelease(v51);
  }
  if (v50) {
    CFRelease(v50);
  }
  if (v49) {
    CFRelease(v49);
  }
  if (v78) {
    CFRelease(v78);
  }
  if (v109) {
    CFRelease(v109);
  }
}

void __flow_director_create_ctl_source_block_invoke(uint64_t a1)
{
  context = dispatch_get_context(*(dispatch_object_t *)(a1 + 32));
  if (context)
  {
    _Block_release(context);
    dispatch_set_context(*(dispatch_object_t *)(a1 + 32), 0);
  }
  guarded_close_np();
  unint64_t v3 = *(NSObject **)(a1 + 32);

  dispatch_release(v3);
}

int *__flow_director_create_ctl_source_block_invoke_2()
{
  return flow_director_ctl_source_do_read();
}

int *flow_director_ctl_source_do_read()
{
  int v0 = MEMORY[0x270FA5388]();
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13[0] = v14;
  v13[1] = 66624;
  *(_OWORD *)&v8.msg_control = 0u;
  *(_OWORD *)&v8.msg_name = 0u;
  v8.msg_iov = (iovec *)v13;
  *(void *)&v8.msg_iovlen = 1;
  int handle = dispatch_source_get_handle(v0);
  context = dispatch_get_context(v0);
  if (!context) {
    __assert_rtn("flow_director_ctl_source_do_read", "NEFlow.c", 3438, "saved_handler != NULL");
  }
  for (uint64_t i = context; ; (*((void (**)(void *, NSObject *, void, unsigned char *, ssize_t))i + 2))(i, v0, 0, v14, v4))
  {
    bzero(v14, 0x10440uLL);
    ssize_t v4 = recvmsg(handle, &v8, 0);
    if (!v4)
    {
      uint64_t v5 = 0;
      return (int *)(*((uint64_t (**)(void *, NSObject *, uint64_t, void, void))i + 2))(i, v0, v5, 0, 0);
    }
    if (v4 < 0) {
      break;
    }
    if ((v8.msg_flags & 8) == 0)
    {
      uint32_t v7 = ne_log_obj();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_14:
        uint64_t v5 = 22;
        return (int *)(*((uint64_t (**)(void *, NSObject *, uint64_t, void, void))i + 2))(i, v0, v5, 0, 0);
      }
      *(_DWORD *)buf = 67109378;
      int v10 = dword_267796AD8;
      __int16 v11 = 2080;
      int v12 = "Failed to read an entire packet";
LABEL_18:
      _os_log_error_impl(&dword_212970000, v7, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
      goto LABEL_14;
    }
    if ((v8.msg_flags & 0x10) != 0)
    {
      uint32_t v7 = ne_log_obj();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 67109378;
      int v10 = dword_267796AD8;
      __int16 v11 = 2080;
      int v12 = "Message was too big for the read buffer";
      goto LABEL_18;
    }
  }
  uint64_t result = __error();
  if (*result == 35) {
    return result;
  }
  uint64_t v5 = *__error();
  return (int *)(*((uint64_t (**)(void *, NSObject *, uint64_t, void, void))i + 2))(i, v0, v5, 0, 0);
}

void __flow_director_handle_flow_states_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
  unint64_t v2 = *(const void **)(a1 + 32);

  _Block_release(v2);
}

void flow_startup(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v6 = (const os_unfair_lock *)(a1 + 120);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  if (a3) {
    goto LABEL_2;
  }
  if (!*(void *)a2)
  {
    if ((*(unsigned char *)(a1 + 100) & 0x20) != 0 || !*(void *)(a2 + 136))
    {
      CFRetain((CFTypeRef)a1);
      dispatch_retain(*(dispatch_object_t *)(a2 + 16));
      unint64_t v21 = *(NSObject **)(a2 + 8);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __flow_startup_block_invoke_191;
      block[3] = &__block_descriptor_tmp_198;
      block[4] = a2;
      void block[5] = a1;
      unint64_t v22 = block;
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 80);
      uint64_t v16 = *(const void **)(a1 + 360);
      if (!v15)
      {
        uint64_t v35 = ne_log_obj();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)state_changed_uint64_t handler = 134218240;
          *(void *)&state_changed_handler[4] = 0;
          *(_WORD *)&state_changed_handler[12] = 2048;
          *(void *)&state_changed_handler[14] = v16;
          uint64_t v34 = "Signing identifier (%p) and/or audit token (%p) not available, rejecting flow";
          p_receive_uint64_t handler = state_changed_handler;
          long long v37 = v35;
          uint32_t v38 = 22;
LABEL_62:
          _os_log_error_impl(&dword_212970000, v37, OS_LOG_TYPE_ERROR, v34, p_receive_handler, v38);
          goto LABEL_2;
        }
        goto LABEL_2;
      }
      int v17 = *(_DWORD *)(a1 + 24);
      uint32_t v18 = *(const void **)(a1 + 368);
      uint64_t v19 = *(const void **)(a1 + 384);
      CFRetain(*(CFTypeRef *)(a1 + 80));
      if (v16) {
        CFRetain(v16);
      }
      if (v18) {
        CFRetain(v18);
      }
      if (v19) {
        CFRetain(v19);
      }
      uint64_t v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        int v45 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)state_changed_uint64_t handler = 67109378;
        *(_DWORD *)&state_changed_handler[4] = v45;
        *(_WORD *)&state_changed_handler[8] = 2112;
        *(void *)&state_changed_handler[10] = v15;
        _os_log_debug_impl(&dword_212970000, v20, OS_LOG_TYPE_DEBUG, "(%u): Requesting rule matching for %@", state_changed_handler, 0x12u);
      }
      dispatch_retain(*(dispatch_object_t *)(a2 + 16));
      unint64_t v21 = *(NSObject **)(a2 + 8);
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 0x40000000;
      v47[2] = __flow_startup_block_invoke;
      v47[3] = &__block_descriptor_tmp_190;
      int v48 = v17;
      v47[4] = a2;
      v47[5] = v16;
      v47[6] = v15;
      v47[7] = v18;
      v47[8] = v19;
      unint64_t v22 = v47;
    }
    dispatch_async(v21, v22);
    return;
  }
  if (*(void *)(a1 + 16) != 2) {
    goto LABEL_8;
  }
  os_unfair_lock_assert_owner(v6);
  CFDataRef v7 = *(const __CFData **)(a1 + 48);
  if (!v7) {
    goto LABEL_36;
  }
  if (*(void *)(a1 + 64)) {
    goto LABEL_8;
  }
  BytePtr = CFDataGetBytePtr(v7);
  if (!BytePtr)
  {
LABEL_36:
    os_unfair_lock_assert_owner(v6);
    uint64_t v25 = *(void *)a2;
    int v26 = *(unsigned __int8 *)(a2 + 121);
    os_unfair_lock_assert_owner(v6);
    bridged_parameters = flow_create_bridged_parameters(a1, v25, v26);
    if (bridged_parameters)
    {
      unsigned int v28 = bridged_parameters;
      CFNumberRef v29 = nw_connection_group_create_with_parameters();
      nw_release(v28);
      if (v29)
      {
        *(void *)(a1 + 416) = v29;
        if (!*(void *)(a1 + 136))
        {
          uint64_t v30 = *(NSObject **)(a2 + 16);
          *(void *)(a1 + 136) = v30;
          dispatch_retain(v30);
        }
        nw_connection_group_set_queue(v29, *(dispatch_queue_t *)(a2 + 16));
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x2000000000;
        CFTypeRef v50 = 0;
        CFTypeRef v50 = CFRetain((CFTypeRef)a1);
        *(void *)state_changed_uint64_t handler = MEMORY[0x263EF8330];
        *(void *)&state_changed_handler[8] = 0x40000000;
        *(void *)&state_changed_handler[16] = __flow_setup_bridged_connection_group_block_invoke;
        unsigned int v58 = &unk_264194D50;
        size_t v59 = v49;
        uint64_t v60 = a1;
        uint64_t v61 = a2;
        nw_connection_group_set_state_changed_handler(v29, state_changed_handler);
        os_unfair_lock_assert_owner(v6);
        if ((*(unsigned char *)(a1 + 100) & 1) == 0)
        {
          long long v31 = *(NSObject **)(a1 + 416);
          if (v31)
          {
            receive_uint64_t handler = MEMORY[0x263EF8330];
            uint64_t v52 = 0x40000000;
            uint64_t v53 = (uint64_t)__flow_bridge_read_data_from_connection_group_block_invoke;
            CFTypeRef v54 = &__block_descriptor_tmp_207;
            uint64_t v55 = a1;
            CFStringRef v56 = v31;
            nw_connection_group_set_receive_handler(v31, 0xFFFFFFFF, 0, &receive_handler);
          }
        }
        nw_connection_group_start(v29);
        int v32 = v49;
        goto LABEL_56;
      }
    }
    unsigned int v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(receive_handler) = 0;
      uint64_t v34 = "Failed to create bridged connection group, rejecting flow";
LABEL_61:
      p_receive_uint64_t handler = (uint8_t *)&receive_handler;
      long long v37 = v33;
      uint32_t v38 = 2;
      goto LABEL_62;
    }
LABEL_2:
    flow_director_send_connect_result(a2, *(_DWORD *)(a1 + 24), 0x3Du, 0, 0, 0, 0, 0, 0);
    flow_drop_director((void *)a1);
    flow_cancel_bridged_connection(a1, 0);
    return;
  }
  int v24 = BytePtr[1];
  if (v24 == 30)
  {
    if (*((_DWORD *)BytePtr + 2) || *((_DWORD *)BytePtr + 3) || *((_DWORD *)BytePtr + 4) || *((_DWORD *)BytePtr + 5)) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
  if (v24 != 2 || !*((_DWORD *)BytePtr + 1)) {
    goto LABEL_36;
  }
LABEL_8:
  os_unfair_lock_assert_owner(v6);
  uint64_t v8 = *(void *)a2;
  int v9 = *(unsigned __int8 *)(a2 + 121);
  os_unfair_lock_assert_owner(v6);
  int v10 = flow_create_bridged_parameters(a1, v8, v9);
  if (!v10) {
    goto LABEL_59;
  }
  __int16 v11 = v10;
  os_unfair_lock_assert_owner(v6);
  CFDataRef v12 = *(const __CFData **)(a1 + 48);
  if (!v12) {
    goto LABEL_50;
  }
  uint32_t v13 = CFDataGetBytePtr(v12);
  if (!v13) {
    goto LABEL_50;
  }
  int v14 = v13[1];
  if (v14 != 30 && v14 != 2) {
    goto LABEL_50;
  }
  if (*(void *)(a1 + 64) && (*(void *)(a1 + 16) != 2 || *((_WORD *)v13 + 1) != 13568))
  {
    uint32_t v39 = NECreateCStringFromCFString(*(const __CFString **)(a1 + 64));
    if (v39)
    {
      long long v40 = v39;
      host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
      free(v40);
      goto LABEL_65;
    }
LABEL_50:
    host_with_numeric_port = 0;
LABEL_51:
    long long v42 = 0;
    goto LABEL_52;
  }
  if (*(unsigned char *)(a1 + 432)) {
    uint64_t address = nw_endpoint_create_host_with_numeric_port();
  }
  else {
    uint64_t address = (uint64_t)nw_endpoint_create_address((const sockaddr *)v13);
  }
  host_with_numeric_port = address;
LABEL_65:
  if (!host_with_numeric_port) {
    goto LABEL_51;
  }
  long long v42 = nw_connection_create(host_with_numeric_port, v11);
LABEL_52:
  nw_release(host_with_numeric_port);
  nw_release(v11);
  if (!v42)
  {
LABEL_59:
    unsigned int v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(receive_handler) = 0;
      uint64_t v34 = "Failed to create bridged connection, rejecting flow";
      goto LABEL_61;
    }
    goto LABEL_2;
  }
  *(void *)(a1 + 408) = v42;
  if (!*(void *)(a1 + 136))
  {
    v43 = *(NSObject **)(a2 + 16);
    *(void *)(a1 + 136) = v43;
    dispatch_retain(v43);
  }
  nw_connection_set_queue(v42, *(dispatch_queue_t *)(a2 + 16));
  receive_uint64_t handler = 0;
  uint64_t v52 = (uint64_t)&receive_handler;
  uint64_t v53 = 0x2000000000;
  CFTypeRef v54 = 0;
  CFTypeRef v54 = CFRetain((CFTypeRef)a1);
  *(void *)state_changed_uint64_t handler = MEMORY[0x263EF8330];
  *(void *)&state_changed_handler[8] = 0x40000000;
  *(void *)&state_changed_handler[16] = __flow_setup_bridged_connection_block_invoke;
  unsigned int v58 = &unk_264194E00;
  size_t v59 = &receive_handler;
  uint64_t v60 = a1;
  uint64_t v61 = a2;
  nw_connection_set_state_changed_handler(v42, state_changed_handler);
  nw_connection_start(v42);
  int v32 = &receive_handler;
LABEL_56:
  _Block_object_dispose(v32, 8);
  if (*(unsigned char *)(a2 + 121))
  {
    if (!*(void *)(a1 + 128)) {
      *(void *)(a1 + 128) = os_transaction_create();
    }
  }
}

void flow_director_handle_connect_result(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v23 = 0;
  memset(length, 0, sizeof(length));
  if (a3 >= 5)
  {
    for (unint64_t i = a3; i > 4; i -= v11)
    {
      int v8 = *a4;
      unsigned int v9 = *(_DWORD *)(a4 + 1);
      uint64_t v10 = bswap32(v9);
      if (v9)
      {
        uint64_t v11 = v10 + 5;
        if (v10 + 5 > i) {
          break;
        }
      }
      else
      {
        uint64_t v11 = 5;
      }
      if (v8 == 9)
      {
        __memcpy_chk();
        HIDWORD(v23) = bswap32(HIDWORD(v23));
      }
      else if (v8 == 11 && v10 <= 0x1C)
      {
        __memcpy_chk();
      }
      a4 += v11;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 120));
  uint32_t v13 = ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v21 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)buf = 67109376;
    int v25 = v21;
    __int16 v26 = 1024;
    LODWORD(v27) = HIDWORD(v23);
    _os_log_debug_impl(&dword_212970000, v13, OS_LOG_TYPE_DEBUG, "(%u): Got a connect result with window size %u", buf, 0xEu);
  }
  if ((*(unsigned char *)(a2 + 100) & 3) != 0)
  {
    int v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *(_DWORD *)(a2 + 24);
      *(_DWORD *)buf = 67109378;
      int v25 = v15;
      __int16 v26 = 2080;
      uint64_t v27 = "Flow is closed, sending close while handling connect result";
      _os_log_impl(&dword_212970000, v14, OS_LOG_TYPE_DEFAULT, "(%u): %s", buf, 0x12u);
    }
    unsigned int v16 = *(_DWORD *)(a2 + 24);
    unsigned int v17 = flow_error_to_errno(*(void *)(a2 + 32));
    flow_director_send_close(a1, v16, v17, 2u, *(_DWORD *)(a2 + 100) & 4);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a2 + 104))
  {
LABEL_22:
    os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 120));
    return;
  }
  int v18 = HIDWORD(v23);
  if (!HIDWORD(v23))
  {
    flow_read_close(a2, 0);
    flow_write_close(a2, 0);
    flow_drop_director((void *)a2);
    goto LABEL_22;
  }
  *(_DWORD *)(a2 + 104) = HIDWORD(v23);
  *(_DWORD *)(a2 + 288) = v18;
  if (BYTE1(length[0]))
  {
    CFDataRef v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)length, LOBYTE(length[0]));
    uint64_t v20 = *(const void **)(a2 + 56);
    if (v20) {
      CFRelease(v20);
    }
    *(void *)(a2 + 56) = v19;
  }
  flow_notify_client((void *)a2, 5);
  os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 120));
  flow_director_handle_read_notification((os_unfair_lock_s *)a2);
}

void flow_director_handle_data(uint64_t a1, uint64_t a2, size_t a3, unsigned __int8 *a4)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  int v8 = (os_unfair_lock_s *)(a2 + 120);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 120));
  if ((*(unsigned char *)(a2 + 100) & 2) != 0)
  {
    int v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *(_DWORD *)(a2 + 24);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "received bytes, but flow is closed";
      _os_log_impl(&dword_212970000, v18, OS_LOG_TYPE_DEFAULT, "(%u): %s", buf, 0x12u);
    }
    goto LABEL_70;
  }
  uint64_t v9 = *(void *)(a2 + 16);
  if (v9 != 2)
  {
    if (v9 == 1)
    {
      uint64_t v10 = dispatch_data_create(a4, a3, *(dispatch_queue_t *)(a1 + 16), 0);
      *(void *)(a2 + 232) += dispatch_data_get_size(v10);
      uint64_t v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v60 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v60;
        *(_WORD *)&buf[8] = 2048;
        *(void *)&buf[10] = dispatch_data_get_size(v10);
        _os_log_debug_impl(&dword_212970000, v11, OS_LOG_TYPE_DEBUG, "(%u): received %zu tcp bytes from app", buf, 0x12u);
      }
      CFDataRef v12 = *(NSObject **)(a2 + 112);
      if (dispatch_data_get_size(v12))
      {
        dispatch_data_t concat = dispatch_data_create_concat(v12, v10);
        dispatch_release(*(dispatch_object_t *)(a2 + 112));
        dispatch_release(v10);
        uint64_t v10 = concat;
      }
      *(void *)(a2 + 112) = v10;
      if (*(void *)(a2 + 408))
      {
        if (v10 && dispatch_data_get_size(v10))
        {
          *(void *)(a2 + 112) = MEMORY[0x263EF8388];
          size_t size = dispatch_data_get_size(v10);
          CFTypeRef v15 = CFRetain((CFTypeRef)a2);
          unsigned int v16 = *(NSObject **)(a2 + 408);
          unsigned int v17 = *MEMORY[0x263F14440];
          completion[0] = MEMORY[0x263EF8330];
          completion[1] = 0x40000000;
          completion[2] = __flow_director_handle_data_block_invoke;
          completion[3] = &__block_descriptor_tmp_168;
          completion[4] = a2;
          completion[5] = size;
          completion[6] = v15;
          nw_connection_send(v16, v10, v17, 1, completion);
          dispatch_release(v10);
        }
      }
      else
      {
        flow_call_stream_read_handler(a2, 0);
      }
    }
    goto LABEL_70;
  }
  uint64_t v20 = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  memset(buf, 0, sizeof(buf));
  v67 = 0;
  unsigned __int8 v66 = 0;
  buf[1] = 0;
  if (a3 < 5) {
    goto LABEL_15;
  }
  uint64_t v20 = 0;
  unint64_t v32 = a3;
  unsigned int v33 = a4;
  while (1)
  {
    int v34 = *v33;
    unsigned int v35 = *(_DWORD *)(v33 + 1);
    uint64_t v36 = bswap32(v35);
    if (v35)
    {
      uint64_t v37 = v36 + 5;
      if (v36 + 5 > v32) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v37 = 5;
    }
    if (*v33 > 0x1Au) {
      break;
    }
    if (v34 == 22)
    {
      if (v36 <= 0x80) {
        goto LABEL_33;
      }
      goto LABEL_34;
    }
    if (v34 == 23)
    {
      if (v36 <= 4) {
        goto LABEL_33;
      }
      goto LABEL_34;
    }
LABEL_35:
    v33 += v37;
    v32 -= v37;
    if (v32 <= 4) {
      goto LABEL_15;
    }
  }
  if (v34 == 27)
  {
    if (v36 <= 1) {
LABEL_33:
    }
      __memcpy_chk();
LABEL_34:
    v20 += v36 + 5;
    goto LABEL_35;
  }
  if (v34 != 37) {
    goto LABEL_35;
  }
  if (v36 <= 8) {
    __memcpy_chk();
  }
  v20 += v36 + 5;
LABEL_15:
  size_t v21 = a3 - v20;
  unint64_t v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v61 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)CFTypeID v69 = 67109888;
    int v70 = v61;
    __int16 v71 = 2048;
    BOOL v72 = (const char *)v21;
    __int16 v73 = 2048;
    char v74 = v67;
    __int16 v75 = 1024;
    int v76 = v66;
    _os_log_debug_impl(&dword_212970000, v22, OS_LOG_TYPE_DEBUG, "(%u): received %zu datagram bytes from app, total_size_t size = %lu, is_fragment = %d", v69, 0x22u);
  }
  CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  int v24 = (dispatch_data_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 152, 0);
  int v25 = v24;
  *((_OWORD *)v24 + 6) = 0u;
  *((_OWORD *)v24 + 7) = 0u;
  *((_OWORD *)v24 + 4) = 0u;
  *((_OWORD *)v24 + 5) = 0u;
  *((_OWORD *)v24 + 2) = 0u;
  *((_OWORD *)v24 + 3) = 0u;
  *(_OWORD *)int v24 = 0u;
  *((_OWORD *)v24 + 1) = 0u;
  *((_OWORD *)v24 + 8) = 0u;
  v24[18] = 0;
  if (buf[1])
  {
    long long v26 = *(_OWORD *)buf;
    long long v27 = *(_OWORD *)&buf[16];
    long long v28 = v79;
    *((_OWORD *)v24 + 2) = v78;
    *((_OWORD *)v24 + 3) = v28;
    *(_OWORD *)int v24 = v26;
    *((_OWORD *)v24 + 1) = v27;
    long long v29 = v80;
    long long v30 = v81;
    long long v31 = v83;
    *((_OWORD *)v24 + 6) = v82;
    *((_OWORD *)v24 + 7) = v31;
    *((_OWORD *)v24 + 4) = v29;
    *((_OWORD *)v24 + 5) = v30;
  }
  else
  {
    CFDataRef v38 = *(const __CFData **)(a2 + 48);
    if (v38)
    {
      BytePtr = CFDataGetBytePtr(v38);
      size_t Length = CFDataGetLength(*(CFDataRef *)(a2 + 48));
      memcpy(v25, BytePtr, Length);
    }
  }
  long long v41 = v67;
  if (v67)
  {
    v25[16] = (dispatch_data_t)MEMORY[0x263EF8388];
    v25[17] = v41;
    if (*(void *)(a2 + 296))
    {
      long long v42 = ne_log_obj();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        int v63 = *(_DWORD *)(a2 + 24);
        v64 = *(const char **)(*(void *)(a2 + 296) + 136);
        *(_DWORD *)CFTypeID v69 = 67109376;
        int v70 = v63;
        __int16 v71 = 2048;
        BOOL v72 = v64;
        _os_log_error_impl(&dword_212970000, v42, OS_LOG_TYPE_ERROR, "(%u): previous fragmented datagram was never completed (%lu bytes remaining), dropping it", v69, 0x12u);
      }
      dispatch_release(*(dispatch_object_t *)(*(void *)(a2 + 296) + 128));
      CFAllocatorDeallocate(v23, *(void **)(a2 + 296));
    }
    *(void *)(a2 + 296) = v25;
  }
  else
  {
    v25[16] = dispatch_data_create(&a4[v20], v21, 0, 0);
    v25[18] = 0;
    **(void **)(a2 + 272) = v25;
    *(void *)(a2 + 272) = v25 + 18;
    *(_DWORD *)(a2 + 280) += dispatch_data_get_size(v25[16]);
  }
  if (v66)
  {
    uint64_t v43 = *(void *)(a2 + 296);
    if (v43 && *(void *)(v43 + 128))
    {
      if (*(void *)(v43 + 136) >= v21)
      {
        int v57 = dispatch_data_create(&a4[v20], v21, 0, 0);
        unsigned int v58 = *(NSObject **)(v43 + 128);
        *(void *)(v43 + 128) = dispatch_data_create_concat(v58, v57);
        dispatch_release(v58);
        dispatch_release(v57);
        size_t v59 = *(void *)(v43 + 136) - v21;
        *(void *)(v43 + 136) = v59;
        if (!v59)
        {
          *(void *)(v43 + 144) = 0;
          **(void **)(a2 + 272) = v43;
          *(void *)(a2 + 272) = v43 + 144;
          *(_DWORD *)(a2 + 280) += dispatch_data_get_size(*(dispatch_data_t *)(v43 + 128));
          *(void *)(a2 + 296) = 0;
        }
      }
      else
      {
        CFDictionaryRef v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          int v45 = *(_DWORD *)(a2 + 24);
          unint64_t v46 = *(NSObject **)(v43 + 136);
          *(_DWORD *)CFTypeID v69 = 67109632;
          int v70 = v45;
          __int16 v71 = 2048;
          BOOL v72 = (const char *)v21;
          __int16 v73 = 2048;
          char v74 = v46;
          uint64_t v47 = "(%u): Received a datagram fragment with more data than expected (%lu vs. %lu)";
          int v48 = v44;
          uint32_t v49 = 28;
          goto LABEL_72;
        }
      }
    }
    else
    {
      CFTypeRef v50 = ne_log_obj();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        int v62 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)CFTypeID v69 = 67109378;
        int v70 = v62;
        __int16 v71 = 2080;
        BOOL v72 = "Received a datagram fragment but no previous datagram was found";
        uint64_t v47 = "(%u): %s";
        int v48 = v50;
        uint32_t v49 = 18;
LABEL_72:
        _os_log_error_impl(&dword_212970000, v48, OS_LOG_TYPE_ERROR, v47, v69, v49);
      }
    }
  }
  unsigned int v51 = *(_DWORD *)(a2 + 280);
  if (v51)
  {
    uint64_t v52 = *(NSObject **)(a2 + 408);
    if (v52)
    {
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 0x40000000;
      v65[2] = __flow_director_handle_data_block_invoke_170;
      v65[3] = &__block_descriptor_tmp_172;
      v65[4] = a2;
      nw_connection_batch(v52, v65);
    }
    else if (*(void *)(a2 + 416))
    {
      uint64_t v53 = *(void *)(a2 + 264);
      if (v53)
      {
        CFTypeRef v54 = *MEMORY[0x263F14440];
        do
        {
          uint64_t v55 = *(NSObject **)(v53 + 128);
          uint64_t address = nw_endpoint_create_address((const sockaddr *)v53);
          nw_connection_group_send_message(*(nw_connection_group_t *)(a2 + 416), v55, address, v54, &__block_literal_global_175);
          nw_release(address);
          uint64_t v53 = *(void *)(v53 + 144);
        }
        while (v53);
        unsigned int v51 = *(_DWORD *)(a2 + 280);
      }
      flow_director_send_read_notification(*(void *)(a2 + 40), *(_DWORD *)(a2 + 24), v51);
      flow_clear_datagram_queue(*(void **)(a2 + 264), *(void **)(a2 + 272));
      *(void *)(a2 + 264) = 0;
      *(void *)(a2 + 272) = a2 + 264;
    }
    else
    {
      flow_call_dgram_read_handler(a2, 0);
    }
  }
LABEL_70:
  os_unfair_lock_unlock(v8);
}

void flow_director_handle_close(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  while (a2 >= 5)
  {
    int v4 = *a3;
    unsigned int v5 = *(_DWORD *)(a3 + 1);
    uint64_t v6 = bswap32(v5);
    if (v5)
    {
      uint64_t v7 = v6 + 5;
      if (v6 + 5 > a2) {
        return;
      }
    }
    else
    {
      uint64_t v7 = 5;
    }
    a3 += v7;
    a2 -= v7;
    if (v4 == 7)
    {
      __memcpy_chk();
      unsigned int v9 = bswap32(0);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
      if (!v9 || (flow_read_close(a1, 0), v9 != 1)) {
        flow_write_close(a1, 0);
      }
      int v8 = *(_DWORD *)(a1 + 100);
      if ((v8 & 3) != 0)
      {
        flow_cancel_bridged_connection(a1, 0);
        int v8 = *(_DWORD *)(a1 + 100);
      }
      if ((~v8 & 3) == 0 && !*(unsigned char *)(a1 + 320)) {
        flow_drop_director((void *)a1);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
      return;
    }
  }
}

void flow_director_handle_read_notification(os_unfair_lock_s *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v2 = a1 + 30;
  os_unfair_lock_lock(a1 + 30);
  unint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint32_t os_unfair_lock_opaque = a1[6]._os_unfair_lock_opaque;
    *(_DWORD *)buf = 67109120;
    uint32_t v7 = os_unfair_lock_opaque;
    _os_log_debug_impl(&dword_212970000, v3, OS_LOG_TYPE_DEBUG, "(%u): Received a read notification", buf, 8u);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __flow_director_handle_read_notification_block_invoke;
  v5[3] = &__block_descriptor_tmp_177;
  v5[4] = a1;
  flow_handle_pending_write_requests((uint64_t)a1, (uint64_t)v5);
  os_unfair_lock_unlock(v2);
}

uint64_t __flow_director_handle_read_notification_block_invoke(uint64_t a1, void *__src)
{
  uint64_t v4 = flow_write_range_of_cfdata(*(void *)(a1 + 32), *((const __CFData **)__src + 16), *((void *)__src + 17), *((void *)__src + 18), (unsigned __int8 *)__src);
  if (v5 < 1)
  {
    uint64_t v8 = (void *)*((void *)__src + 19);
    if (v8) {
      flow_call_write_completion(*(void *)(a1 + 32), 0, v8);
    }
    return 1;
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t result = 0;
    *((void *)__src + 17) = v6;
    *((void *)__src + 18) = v5;
  }
  return result;
}

void __flow_director_handle_data_block_invoke(uint64_t a1, nw_error_t error)
{
  if (error)
  {
    CFErrorRef v3 = nw_error_copy_cf_error(error);
    flow_close(*(os_unfair_lock_s **)(a1 + 32), v3, 1);
    if (v3) {
      CFRelease(v3);
    }
  }
  else
  {
    flow_director_send_read_notification(*(void *)(*(void *)(a1 + 32) + 40), *(_DWORD *)(*(void *)(a1 + 32) + 24), *(_DWORD *)(a1 + 40));
  }
  uint64_t v4 = *(const void **)(a1 + 48);

  CFRelease(v4);
}

void __flow_director_handle_data_block_invoke_170(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 264);
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x263F14440];
    do
    {
      uint64_t v5 = *(NSObject **)(v3 + 128);
      CFTypeRef v6 = CFRetain(*(CFTypeRef *)(a1 + 32));
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(NSObject **)(v7 + 408);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 0x40000000;
      v9[2] = __flow_director_handle_data_block_invoke_2;
      v9[3] = &__block_descriptor_tmp_171;
      v9[4] = v7;
      v9[5] = v6;
      nw_connection_send(v8, v5, v4, 1, v9);
      uint64_t v3 = *(void *)(v3 + 144);
    }
    while (v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  flow_director_send_read_notification(*(void *)(v2 + 40), *(_DWORD *)(v2 + 24), *(_DWORD *)(v2 + 280));
  flow_clear_datagram_queue(*(void **)(*(void *)(a1 + 32) + 264), *(void **)(*(void *)(a1 + 32) + 272));
  *(void *)(*(void *)(a1 + 32) + 264) = 0;
  *(void *)(*(void *)(a1 + 32) + 272) = *(void *)(a1 + 32) + 264;
}

void __flow_director_handle_data_block_invoke_2(uint64_t a1, nw_error_t error)
{
  if (error)
  {
    CFErrorRef v3 = nw_error_copy_cf_error(error);
    flow_close(*(os_unfair_lock_s **)(a1 + 32), v3, 1);
    if (v3) {
      CFRelease(v3);
    }
  }
  uint64_t v4 = *(const void **)(a1 + 40);

  CFRelease(v4);
}

NSObject *flow_create_bridged_parameters(uint64_t a1, uint64_t a2, int a3)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5 == 2)
  {
    nw_parameters_t secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14478], (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14470]);
  }
  else
  {
    if (v5 != 1) {
      return 0;
    }
    nw_parameters_t secure_udp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14478], (nw_parameters_configure_protocol_block_t)*MEMORY[0x263F14470]);
  }
  uint64_t v7 = secure_udp;
  if ((*(unsigned char *)(a1 + 344) & 8) != 0)
  {
    if (*(_DWORD *)(a1 + 400))
    {
      uint64_t v8 = nw_interface_create_with_index();
      if (v8)
      {
        unsigned int v9 = v8;
        nw_parameters_require_interface(v7, v8);
        nw_release(v9);
      }
    }
  }
  if (*(_DWORD *)(a1 + 96)) {
    nw_parameters_set_traffic_class();
  }
  *(_OWORD *)buffer = 0u;
  long long v14 = 0u;
  CFDataRef v10 = *(const __CFData **)(a1 + 360);
  if (v10)
  {
    CFIndex Length = CFDataGetLength(v10);
    if (a3)
    {
      if (Length == 32)
      {
        v15.location = 0;
        v15.CFIndex length = 32;
        CFDataGetBytes(*(CFDataRef *)(a1 + 360), v15, buffer);
        nw_parameters_set_source_application();
      }
    }
  }
  nw_parameters_set_context();
  nw_parameters_set_indefinite();
  return v7;
}

void __flow_setup_bridged_connection_group_block_invoke(void *a1, int a2, NSObject *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!*(void *)(*(void *)(a1[4] + 8) + 24)) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 120));
  uint64_t v6 = a1[5];
  if (!*(void *)(v6 + 416))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
    goto LABEL_15;
  }
  if ((a2 - 3) < 2)
  {
    CFErrorRef v14 = nw_error_copy_cf_error(a3);
    flow_cancel_bridged_connection(a1[5], v14);
    if (v14) {
      CFRelease(v14);
    }
    flow_cancel_connection_waiting_timer(a1[5]);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120));
    if (a2 != 4) {
      return;
    }
LABEL_15:
    uint64_t v15 = *(void *)(a1[4] + 8);
    unsigned int v16 = *(const void **)(v15 + 24);
    if (v16)
    {
      CFRelease(v16);
      *(void *)(v15 + 24) = 0;
    }
    return;
  }
  if (a2 != 1)
  {
    if (a2 != 2)
    {
LABEL_25:
      flow_cancel_connection_waiting_timer(v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120));
      return;
    }
    unsigned int port = nw_connection_group_get_port();
    uint64_t v8 = a1[5];
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v8 + 120));
    CFDataRef v9 = *(const __CFData **)(v8 + 48);
    if (v9)
    {
      BytePtr = CFDataGetBytePtr(v9);
      if (BytePtr)
      {
        int v11 = BytePtr[1];
        if (v11 == 30)
        {
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v24 = 0;
          *(_WORD *)bytes = 7708;
          __int16 v21 = __rev16(port);
          CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFIndex v13 = 28;
LABEL_21:
          CFDataRef v18 = CFDataCreate(v12, bytes, v13);
          NEFlowResetLocalEndpoint(a1[5], v18);
          if (v18) {
            CFRelease(v18);
          }
          goto LABEL_23;
        }
        if (v11 == 2)
        {
          LODWORD(v23) = 0;
          uint64_t v22 = 0;
          *(_WORD *)bytes = 528;
          __int16 v21 = __rev16(port);
          CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFIndex v13 = 16;
          goto LABEL_21;
        }
      }
    }
LABEL_23:
    int v19 = flow_open(a1[5]);
    uint64_t v6 = a1[5];
    if (!v19)
    {
      flow_cancel_bridged_connection(v6, 0);
      uint64_t v6 = a1[5];
    }
    goto LABEL_25;
  }
  flow_start_connection_waiting_timer(v6, *(NSObject **)(a1[6] + 16));
  unsigned int v17 = (os_unfair_lock_s *)(a1[5] + 120);

  os_unfair_lock_unlock(v17);
}

void __flow_bridge_read_data_from_connection_group_block_invoke(uint64_t a1, const void *a2, NSObject *a3)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  uint64_t v6 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v6 + 100) & 1) == 0 && *(void *)(v6 + 416))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
    if (!a2) {
      return;
    }
    if (a3)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v7 + 432))
      {
        BytePtr = (sockaddr *)CFDataGetBytePtr(*(CFDataRef *)(v7 + 48));
        a3 = 0;
LABEL_14:
        CFDataRef v10 = *(os_unfair_lock_s **)(a1 + 32);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 0x40000000;
        v11[2] = __flow_bridge_read_data_from_connection_group_block_invoke_2;
        v11[3] = &__block_descriptor_tmp_205;
        v11[4] = v10;
        NEFlowWrite(v10, a2, &BytePtr->sa_len, v11);
        nw_release(a3);
        return;
      }
      CFDataRef v9 = nw_connection_group_copy_remote_endpoint_for_message(*(nw_connection_group_t *)(a1 + 40), a3);
      a3 = v9;
      if (v9 && nw_endpoint_get_type(v9) == nw_endpoint_type_address)
      {
        BytePtr = (sockaddr *)nw_endpoint_get_address(a3);
        goto LABEL_14;
      }
    }
    BytePtr = 0;
    goto LABEL_14;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
}

void __flow_setup_bridged_connection_block_invoke(void *a1, int a2, NSObject *a3)
{
  if (!*(void *)(*(void *)(a1[4] + 8) + 24)) {
    return;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 120));
  uint64_t v6 = a1[5];
  if (!*(void *)(v6 + 408))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
LABEL_21:
    uint64_t v18 = *(void *)(a1[4] + 8);
    int v19 = *(const void **)(v18 + 24);
    if (v19)
    {
      CFRelease(v19);
      *(void *)(v18 + 24) = 0;
    }
    return;
  }
  if ((a2 - 4) >= 2)
  {
    if (a2 == 1)
    {
      flow_start_connection_waiting_timer(v6, *(NSObject **)(a1[6] + 16));
    }
    else
    {
      if (a2 == 3)
      {
        uint64_t v7 = nw_connection_copy_connected_local_endpoint();
        if (v7)
        {
          uint64_t v8 = v7;
          if (nw_endpoint_get_type(v7) == nw_endpoint_type_address)
          {
            uint64_t address = nw_endpoint_get_address(v8);
            CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &address->sa_len, address->sa_len);
            NEFlowResetLocalEndpoint(a1[5], v10);
            if (v10) {
              CFRelease(v10);
            }
          }
          nw_release(v8);
        }
        uint64_t v11 = nw_connection_copy_connected_path();
        if (v11)
        {
          CFAllocatorRef v12 = (void *)v11;
          int interface_index = nw_path_get_interface_index();
          if (interface_index)
          {
            uint64_t v14 = a1[5];
            *(_DWORD *)(v14 + 400) = interface_index;
            flow_director_send_properties_update(*(void *)(v14 + 40), *(_DWORD *)(v14 + 24), interface_index, 0);
          }
          nw_release(v12);
        }
        int v15 = flow_open(a1[5]);
        uint64_t v16 = a1[5];
        if (v15) {
          flow_bridge_read_data_from_connection(v16);
        }
        else {
          flow_cancel_bridged_connection(v16, 0);
        }
      }
      flow_cancel_connection_waiting_timer(a1[5]);
    }
    uint64_t v20 = (os_unfair_lock_s *)(a1[5] + 120);
    os_unfair_lock_unlock(v20);
    return;
  }
  CFErrorRef v17 = nw_error_copy_cf_error(a3);
  flow_cancel_bridged_connection(a1[5], v17);
  if (v17) {
    CFRelease(v17);
  }
  flow_cancel_connection_waiting_timer(a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120));
  if (a2 == 5) {
    goto LABEL_21;
  }
}

void __flow_startup_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 136);
  if (v3)
  {
    (*(void (**)(uint64_t, void, void, void, void, void))(v3 + 16))(v3, *(unsigned int *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
  }
  else
  {
    int v4 = *(_DWORD *)(a1 + 72);
    uint64_t v5 = *(NSObject **)(v2 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __NEFlowDirectorHandleMatchRulesResult_block_invoke;
    block[3] = &__block_descriptor_tmp_116;
    int v10 = v4;
    block[4] = v2;
    void block[5] = 0;
    dispatch_async(v5, block);
  }
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  uint64_t v6 = *(const void **)(a1 + 40);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = *(const void **)(a1 + 56);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = *(const void **)(a1 + 64);
  if (v8) {
    CFRelease(v8);
  }
}

void __flow_startup_block_invoke_191(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 144);
  uint64_t v3 = ne_log_obj();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v11 = *(_DWORD *)(*(void *)(a1 + 40) + 24);
      *(_DWORD *)buf = 67109378;
      int v15 = v11;
      __int16 v16 = 2080;
      CFErrorRef v17 = "Delivering to client";
      _os_log_debug_impl(&dword_212970000, v4, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(v9 + 144);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 0x40000000;
    void v13[2] = __flow_startup_block_invoke_193;
    v13[3] = &__block_descriptor_tmp_196;
    v13[4] = v9;
    void v13[5] = v8;
    (*(void (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v8, v13, v5, v6, v7);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v12 = *(_DWORD *)(*(void *)(a1 + 40) + 24);
      *(_DWORD *)buf = 67109378;
      int v15 = v12;
      __int16 v16 = 2080;
      CFErrorRef v17 = "No new flow callback registered, dropping the flow";
      _os_log_error_impl(&dword_212970000, v4, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 120));
    flow_startup(*(void *)(a1 + 40), *(void *)(a1 + 32), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 120));
    CFRelease(*(CFTypeRef *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  }
}

void __flow_startup_block_invoke_193(int8x16_t *a1, char a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  int8x16_t v3 = vextq_s8(a1[2], a1[2], 8uLL);
  int v4 = *(NSObject **)(a1[2].i64[0] + 16);
  block[2] = __flow_startup_block_invoke_2;
  block[3] = &__block_descriptor_tmp_194;
  char v7 = a2;
  int8x16_t v6 = v3;
  dispatch_async(v4, block);
  dispatch_release(*(dispatch_object_t *)(a1[2].i64[0] + 16));
}

void __flow_startup_block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
    flow_startup(*(void *)(a1 + 32), *(void *)(a1 + 40), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  }
  uint64_t v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void __NEFlowDirectorHandleMatchRulesResult_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  node = (os_unfair_lock_s *)rb_tree_find_node((rb_tree_t *)(*(void *)(a1 + 32) + 56), (const void *)(a1 + 48));
  if (node)
  {
    int8x16_t v3 = node;
    int v4 = node + 30;
    os_unfair_lock_lock(node + 30);
    uint64_t v5 = *(const void **)(a1 + 40);
    if (!v5)
    {
      int v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint32_t os_unfair_lock_opaque = v3[6]._os_unfair_lock_opaque;
        v17[0] = 67109378;
        v17[1] = os_unfair_lock_opaque;
        __int16 v18 = 2080;
        int v19 = "Failed validation, aborting";
        _os_log_error_impl(&dword_212970000, v11, OS_LOG_TYPE_ERROR, "(%u): %s", (uint8_t *)v17, 0x12u);
      }
      goto LABEL_22;
    }
    *(void *)&v3[18]._uint32_t os_unfair_lock_opaque = CFRetain(v5);
    CFStringRef v6 = *(const __CFString **)&v3[92]._os_unfair_lock_opaque;
    if (v6)
    {
      if (CFEqual(v6, *(CFStringRef *)(a1 + 40)))
      {
        CFIndex v13 = *(const void **)&v3[20]._os_unfair_lock_opaque;
        if (v13) {
          CFRelease(v13);
        }
        *(void *)&v3[20]._uint32_t os_unfair_lock_opaque = *(void *)&v3[92]._os_unfair_lock_opaque;
        *(void *)&v3[92]._uint32_t os_unfair_lock_opaque = 0;
        uint64_t v14 = *(const void **)&v3[22]._os_unfair_lock_opaque;
        if (v14) {
          CFRelease(v14);
        }
        *(void *)&v3[22]._uint32_t os_unfair_lock_opaque = *(void *)&v3[94]._os_unfair_lock_opaque;
        *(void *)&v3[94]._uint32_t os_unfair_lock_opaque = 0;
        int v15 = *(const void **)&v3[90]._os_unfair_lock_opaque;
        if (v15) {
          CFRelease(v15);
        }
        uint64_t v10 = v3 + 96;
        *(void *)&v3[90]._uint32_t os_unfair_lock_opaque = *(void *)&v3[96]._os_unfair_lock_opaque;
        goto LABEL_20;
      }
      char v7 = *(const void **)&v3[92]._os_unfair_lock_opaque;
      if (v7)
      {
        CFRelease(v7);
        *(void *)&v3[92]._uint32_t os_unfair_lock_opaque = 0;
      }
    }
    uint64_t v8 = *(const void **)&v3[94]._os_unfair_lock_opaque;
    if (v8)
    {
      CFRelease(v8);
      *(void *)&v3[94]._uint32_t os_unfair_lock_opaque = 0;
    }
    uint64_t v9 = *(const void **)&v3[96]._os_unfair_lock_opaque;
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v10 = v3 + 96;
    CFRelease(v9);
LABEL_20:
    *(void *)&v10->_uint32_t os_unfair_lock_opaque = 0;
LABEL_21:
    v3[25]._os_unfair_lock_opaque |= 0x20u;
LABEL_22:
    flow_startup(v3, *(void *)(a1 + 32), (v3[25]._os_unfair_lock_opaque & 0x20) == 0);
    os_unfair_lock_unlock(v4);
    __int16 v16 = *(const void **)(a1 + 40);
    if (v16) {
      CFRelease(v16);
    }
  }
}

void flow_bridge_read_data_from_connection(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
    if ((*(unsigned char *)(a1 + 100) & 1) == 0)
    {
      uint64_t v2 = *(NSObject **)(a1 + 408);
      if (v2)
      {
        CFTypeRef v3 = CFRetain((CFTypeRef)a1);
        v5[0] = MEMORY[0x263EF8330];
        v5[1] = 0x40000000;
        v5[2] = __flow_bridge_read_data_from_connection_block_invoke;
        v5[3] = &__block_descriptor_tmp_213;
        v5[4] = a1;
        void v5[5] = v3;
        nw_connection_receive(v2, 0, 0xFFFFFFFF, v5);
      }
    }
  }
  else
  {
    int v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v7 = "flow_bridge_read_data_from_connection";
      _os_log_fault_impl(&dword_212970000, v4, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
    }
  }
}

void flow_start_connection_waiting_timer(uint64_t a1, NSObject *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  if (!*(void *)(a1 + 424) && (*(void *)(a1 + 408) || *(void *)(a1 + 416)))
  {
    int v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, a2);
    dispatch_time_t v5 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __flow_start_connection_waiting_timer_block_invoke;
    handler[3] = &__block_descriptor_tmp_201;
    handler[4] = a1;
    dispatch_source_set_event_handler(v4, handler);
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2000000000;
    CFTypeRef v10 = 0;
    CFTypeRef v10 = CFRetain((CFTypeRef)a1);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 0x40000000;
    v8[2] = __flow_start_connection_waiting_timer_block_invoke_202;
    v8[3] = &unk_264194D98;
    v8[4] = v9;
    dispatch_source_set_cancel_handler(v4, v8);
    dispatch_activate(v4);
    *(void *)(a1 + 424) = v4;
    CFStringRef v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109120;
      int v13 = v7;
      _os_log_debug_impl(&dword_212970000, v6, OS_LOG_TYPE_DEBUG, "(%u): Starting waiting timer", buf, 8u);
    }
    _Block_object_dispose(v9, 8);
  }
}

void __flow_start_connection_waiting_timer_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 424);
  CFTypeRef v3 = ne_log_obj();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 24);
      int v7 = 67109120;
      int v8 = v5;
      _os_log_debug_impl(&dword_212970000, v3, OS_LOG_TYPE_DEBUG, "(%u): Waiting timer fired, cancelling flow", (uint8_t *)&v7, 8u);
    }
    flow_cancel_bridged_connection(*(void *)(a1 + 32), 0);
  }
  else if (v4)
  {
    int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 24);
    int v7 = 67109120;
    int v8 = v6;
    _os_log_debug_impl(&dword_212970000, v3, OS_LOG_TYPE_DEBUG, "(%u): Waiting timer fired, ignoring stale event", (uint8_t *)&v7, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
}

void __flow_start_connection_waiting_timer_block_invoke_202(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(const void **)(v1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(v1 + 24) = 0;
  }
}

void __flow_bridge_read_data_from_connection_block_invoke(uint64_t a1, const void *a2, int a3, char a4, nw_error_t error)
{
  if (a2)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 16) == 2)
    {
      if (!*(unsigned char *)(v9 + 432))
      {
        int v15 = nw_connection_copy_endpoint(*(nw_connection_t *)(v9 + 408));
        int v11 = v15;
        if (v15 && nw_endpoint_get_type(v15) == nw_endpoint_type_address) {
          uint64_t address = (sockaddr *)nw_endpoint_get_address(v11);
        }
        else {
          uint64_t address = 0;
        }
        goto LABEL_7;
      }
      uint64_t address = (sockaddr *)CFDataGetBytePtr(*(CFDataRef *)(v9 + 48));
    }
    else
    {
      uint64_t address = 0;
    }
    int v11 = 0;
LABEL_7:
    int v12 = *(os_unfair_lock_s **)(a1 + 32);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 0x40000000;
    void v16[2] = __flow_bridge_read_data_from_connection_block_invoke_2;
    v16[3] = &__block_descriptor_tmp_211;
    v16[4] = v12;
    NEFlowWrite(v12, a2, &address->sa_len, v16);
    nw_release(v11);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (*(void *)(v13 + 16) == 1)
  {
    if (!error && (a4 & 1) == 0) {
      goto LABEL_16;
    }
    if (!error)
    {
      flow_close((os_unfair_lock_s *)v13, 0, 0);
      goto LABEL_16;
    }
  }
  else if (!error)
  {
    goto LABEL_16;
  }
  CFErrorRef v14 = nw_error_copy_cf_error(error);
  flow_close(*(os_unfair_lock_s **)(a1 + 32), v14, 0);
  if (v14) {
    CFRelease(v14);
  }
LABEL_16:
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __flow_bridge_read_data_from_connection_block_invoke_2(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    flow_cancel_bridged_connection(v4, 0);
  }
  else {
    flow_bridge_read_data_from_connection(v4);
  }
  int v5 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 120);

  os_unfair_lock_unlock(v5);
}

void __flow_bridge_read_data_from_connection_group_block_invoke_2(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 120));
  if (a2) {
    flow_cancel_bridged_connection(*(void *)(a1 + 32), 0);
  }
  uint64_t v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 120);

  os_unfair_lock_unlock(v4);
}

void flow_director_deallocate(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3[0] = 67109378;
    v3[1] = dword_267796AD8;
    __int16 v4 = 2080;
    int v5 = "Deallocated flow director";
    _os_log_debug_impl(&dword_212970000, v2, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v3, 0x12u);
  }
  CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x263EFFB08], a1);
}

uint64_t flow_divert_compare_id(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unsigned int v3 = bswap32(*(_DWORD *)(a2 + 24));
  unsigned int v4 = bswap32(*a3);
  BOOL v5 = v3 >= v4;
  BOOL v6 = v3 > v4;
  int v7 = !v5;
  return (v6 - v7);
}

uint64_t flow_divert_compare_flows(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = bswap32(*(_DWORD *)(a2 + 24));
  unsigned int v4 = bswap32(*(_DWORD *)(a3 + 24));
  BOOL v5 = v3 >= v4;
  BOOL v6 = v3 > v4;
  int v7 = !v5;
  return (v6 - v7);
}

double __NEFlowDirectorCreateInternal_block_invoke()
{
  qword_267796C70 = 0;
  double result = 0.0;
  xmmword_267796C50 = 0u;
  unk_267796C60 = 0u;
  xmmword_267796C30 = 0u;
  unk_267796C40 = 0u;
  xmmword_267796C10 = 0u;
  unk_267796C20 = 0u;
  xmmword_267796BF0 = 0u;
  unk_267796C00 = 0u;
  xmmword_267796BD0 = 0u;
  unk_267796BE0 = 0u;
  xmmword_267796BB0 = 0u;
  unk_267796BC0 = 0u;
  xmmword_267796B90 = 0u;
  unk_267796BA0 = 0u;
  xmmword_267796B70 = 0u;
  unk_267796B80 = 0u;
  xmmword_267796B50 = 0u;
  unk_267796B60 = 0u;
  xmmword_267796B30 = 0u;
  unk_267796B40 = 0u;
  xmmword_267796B10 = 0u;
  unk_267796B20 = 0u;
  xmmword_267796AF0 = 0u;
  unk_267796B00 = 0u;
  unk_267796AD0 = 0u;
  unk_267796AE0 = 0u;
  nil_flow = 0u;
  byte_267796B2C = 5;
  return result;
}

char *NEFlowDirectorCreate(int a1, NSObject *a2)
{
  return NEFlowDirectorCreateInternal(a1, a2, 0);
}

char *NEFlowDirectorCreateBridge(int a1, unint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a2)
  {
    Internal = NEFlowDirectorCreateInternal(a1, 0, a2);
    if (Internal)
    {
      arc4random_buf(__buf, 0x100uLL);
      int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      BOOL v6 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 284, 0);
      int v7 = v6;
      *BOOL v6 = 6;
      *((_DWORD *)v6 + 1) = 0;
      v6[8] = 17;
      *(_DWORD *)(v6 + 9) = 0x10000;
      long long v8 = __buf[2];
      long long v9 = __buf[3];
      long long v10 = __buf[1];
      *(_OWORD *)(v6 + 13) = __buf[0];
      *(_OWORD *)(v6 + 61) = v9;
      *(_OWORD *)(v6 + 45) = v8;
      *(_OWORD *)(v6 + 29) = v10;
      long long v11 = __buf[6];
      long long v12 = __buf[7];
      long long v13 = __buf[5];
      *(_OWORD *)(v6 + 77) = __buf[4];
      *(_OWORD *)(v6 + 125) = v12;
      *(_OWORD *)(v6 + 109) = v11;
      *(_OWORD *)(v6 + 93) = v13;
      long long v14 = __buf[10];
      long long v15 = __buf[11];
      long long v16 = __buf[9];
      *(_OWORD *)(v6 + 141) = __buf[8];
      *(_OWORD *)(v6 + 189) = v15;
      *(_OWORD *)(v6 + 173) = v14;
      *(_OWORD *)(v6 + 157) = v16;
      long long v17 = __buf[14];
      long long v18 = __buf[15];
      long long v19 = __buf[13];
      *(_OWORD *)(v6 + 205) = __buf[12];
      *(_OWORD *)(v6 + 253) = v18;
      *(_OWORD *)(v6 + 237) = v17;
      *(_OWORD *)(v6 + 221) = v19;
      if (is_debug_logging_enabled) {
        char v20 = 7;
      }
      else {
        char v20 = 5;
      }
      v6[269] = 20;
      *(_DWORD *)(v6 + 270) = 0x1000000;
      v6[274] = v20;
      v6[275] = 29;
      *(void *)(v6 + 276) = 0x104000000;
      ssize_t v21 = send(a1, v6, 0x11CuLL, 0);
      CFAllocatorDeallocate(v5, v7);
      if (v21 < 0)
      {
        uint64_t v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = __error();
          uint64_t v25 = strerror(*v24);
          int v27 = 136315138;
          long long v28 = v25;
          _os_log_error_impl(&dword_212970000, v22, OS_LOG_TYPE_ERROR, "Failed to send the FLOW_DIVERT_PKT_GROUP_INIT message: %s", (uint8_t *)&v27, 0xCu);
        }
      }
    }
  }
  else
  {
    long long v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      LODWORD(__buf[0]) = 136315138;
      *(void *)((char *)__buf + 4) = "NEFlowDirectorCreateBridge";
      _os_log_fault_impl(&dword_212970000, v26, OS_LOG_TYPE_FAULT, "%s called with null context", (uint8_t *)__buf, 0xCu);
    }
    return 0;
  }
  return Internal;
}

void NEFlowDirectorAllowProcessDelegation(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (a1)
  {
    *(unsigned char *)(a1 + 121) = 1;
  }
  else
  {
    uint64_t v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      int v2 = 136315138;
      unsigned int v3 = "NEFlowDirectorAllowProcessDelegation";
      _os_log_fault_impl(&dword_212970000, v1, OS_LOG_TYPE_FAULT, "%s called with null director", (uint8_t *)&v2, 0xCu);
    }
  }
}

void NEFlowDirectorRedirectDNSToLoopback(uint64_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1)
  {
    *(unsigned char *)(a1 + 122) = a2;
  }
  else
  {
    int v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      int v3 = 136315138;
      uint64_t v4 = "NEFlowDirectorRedirectDNSToLoopback";
      _os_log_fault_impl(&dword_212970000, v2, OS_LOG_TYPE_FAULT, "%s called with null director", (uint8_t *)&v3, 0xCu);
    }
  }
}

void NEFlowDirectorStart(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __NEFlowDirectorStart_block_invoke;
    block[3] = &__block_descriptor_tmp_108;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void __NEFlowDirectorStart_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    flow_director_ctl_source_do_read();
    int v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    dispatch_resume(v2);
  }
}

void NEFlowDirectorDestroy(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    int v7 = dword_267796AD8;
    __int16 v8 = 2080;
    long long v9 = "Destroying flow director";
    _os_log_debug_impl(&dword_212970000, v4, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __NEFlowDirectorDestroy_block_invoke;
  v5[3] = &unk_264194960;
  v5[4] = a2;
  void v5[5] = a1;
  flow_director_abort(a1, (uint64_t)v5);
}

void __NEFlowDirectorDestroy_block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 40);
  int v3 = (const void *)v2[16];
  if (v3)
  {
    _Block_release(v3);
    int v2 = *(void **)(a1 + 40);
  }
  uint64_t v4 = (const void *)v2[17];
  if (v4)
  {
    _Block_release(v4);
    int v2 = *(void **)(a1 + 40);
  }
  uint64_t v5 = (const void *)v2[18];
  if (v5)
  {
    _Block_release(v5);
    int v2 = *(void **)(a1 + 40);
  }
  BOOL v6 = (const void *)v2[19];
  if (v6)
  {
    _Block_release(v6);
    int v2 = *(void **)(a1 + 40);
  }
  *((_OWORD *)v2 + 8) = 0u;
  *((_OWORD *)v2 + 9) = 0u;
  uint64_t v7 = *(void *)(a1 + 40);
  if (!*(void *)(a1 + 32)) {
    goto LABEL_14;
  }
  __int16 v8 = *(NSObject **)(v7 + 8);
  if (v8)
  {
    dispatch_retain(*(dispatch_object_t *)(v7 + 8));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __NEFlowDirectorDestroy_block_invoke_2;
    block[3] = &unk_264194910;
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v8;
    dispatch_async(v8, block);
    uint64_t v7 = *(void *)(a1 + 40);
  }
  if (*(void *)v7)
  {
    nw_queue_context_async_if_needed();
    uint64_t v7 = *(void *)(a1 + 40);
LABEL_14:
    if (*(void *)v7)
    {
      nw_release(*(void **)v7);
      **(void **)(a1 + 40) = 0;
      uint64_t v7 = *(void *)(a1 + 40);
    }
  }
  long long v9 = *(NSObject **)(v7 + 8);
  if (v9)
  {
    dispatch_release(v9);
    *(void *)(*(void *)(a1 + 40) + 8) = 0;
    uint64_t v7 = *(void *)(a1 + 40);
  }
  dispatch_release(*(dispatch_object_t *)(v7 + 16));
}

void __NEFlowDirectorDestroy_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v2 = *(NSObject **)(a1 + 40);

  dispatch_release(v2);
}

uint64_t __NEFlowDirectorDestroy_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t NEFlowDirectorGetMaxSendSize(uint64_t a1)
{
  return *(void *)(a1 + 184);
}

void NEFlowDirectorHandleNewControlSocket(uint64_t a1, int a2)
{
  int v2 = *(NSObject **)(a1 + 16);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  _DWORD v3[2] = __NEFlowDirectorHandleNewControlSocket_block_invoke;
  v3[3] = &__block_descriptor_tmp_114;
  v3[4] = a1;
  int v4 = a2;
  dispatch_async(v2, v3);
}

os_unfair_lock_s *__NEFlowDirectorHandleNewControlSocket_block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 40)) {
    __assert_rtn("NEFlowDirectorHandleNewControlSocket_block_invoke", "NEFlow.c", 3866, "director->data_source == NULL");
  }
  int v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 0x80000000) == 0)
  {
    int v20 = 0x100000;
    if (setsockopt(v3, 0xFFFF, 4097, &v20, 4u))
    {
      int v4 = ne_log_obj();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      int v17 = dword_267796AD8;
      long long v18 = __error();
      long long v19 = strerror(*v18);
      *(_DWORD *)&v22[0].sa_len = 67109378;
      *(_DWORD *)&v22[0].sa_data[2] = v17;
      *(_WORD *)&v22[0].sa_data[6] = 2080;
      *(void *)&v22[0].sa_data[8] = v19;
      long long v16 = "(%u): Failed to set SO_SNDBUF on the data control socket: %s";
    }
    else
    {
      int v8 = *(_DWORD *)(a1 + 40);
      socklen_t v21 = 32;
      memset(v22, 0, sizeof(v22));
      int v9 = getpeername(v8, v22, &v21);
      int v10 = *(_DWORD *)&v22[0].sa_data[6];
      if (v9) {
        int v10 = 0;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)(v11 + 48) = v10;
      if (v10)
      {
        *(void *)(*(void *)(a1 + 32) + 40) = flow_director_create_io_handler(v11, *(_DWORD *)(a1 + 40));
        long long v12 = *(NSObject **)(*(void *)(a1 + 32) + 40);
        if (v12) {
          dispatch_resume(v12);
        }
        goto LABEL_6;
      }
      int v4 = ne_log_obj();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        close(*(_DWORD *)(a1 + 40));
LABEL_6:
        uint64_t v1 = *(void *)(a1 + 32);
        goto LABEL_7;
      }
      int v13 = dword_267796AD8;
      long long v14 = __error();
      long long v15 = strerror(*v14);
      *(_DWORD *)&v22[0].sa_len = 67109378;
      *(_DWORD *)&v22[0].sa_data[2] = v13;
      *(_WORD *)&v22[0].sa_data[6] = 2080;
      *(void *)&v22[0].sa_data[8] = v15;
      long long v16 = "(%u): getpeername failed on the data control socket: %s";
    }
    _os_log_error_impl(&dword_212970000, v4, OS_LOG_TYPE_ERROR, v16, &v22[0].sa_len, 0x12u);
    goto LABEL_5;
  }
LABEL_7:
  double result = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(v1 + 56), 0, 1u);
  if (result)
  {
    BOOL v6 = result;
    do
    {
      os_unfair_lock_lock(v6 + 30);
      uint32_t os_unfair_lock_opaque = v6[25]._os_unfair_lock_opaque;
      if ((os_unfair_lock_opaque & 8) != 0)
      {
        v6[25]._uint32_t os_unfair_lock_opaque = os_unfair_lock_opaque & 0xFFFFFFF7;
        flow_startup((uint64_t)v6, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 40) == 0);
      }
      os_unfair_lock_unlock(v6 + 30);
      double result = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(*(void *)(a1 + 32) + 56), v6, 1u);
      BOOL v6 = result;
    }
    while (result);
  }
  return result;
}

void NEFlowDirectorHandleMatchRulesResult(uint64_t a1, int a2, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  BOOL v6 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __NEFlowDirectorHandleMatchRulesResult_block_invoke;
  block[3] = &__block_descriptor_tmp_116;
  int v8 = a2;
  void block[4] = a1;
  void block[5] = cf;
  dispatch_async(v6, block);
}

void NEFlowDirectorSetDelegateInterface(uint64_t a1, int a2)
{
  int v2 = *(NSObject **)(a1 + 16);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  _DWORD v3[2] = __NEFlowDirectorSetDelegateInterface_block_invoke;
  v3[3] = &__block_descriptor_tmp_117;
  int v4 = a2;
  v3[4] = a1;
  dispatch_async(v2, v3);
}

char *__NEFlowDirectorSetDelegateInterface_block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  double result = if_indextoname(*(_DWORD *)(a1 + 40), v3);
  if (result) {
    return (char *)flow_director_reset_default_interface_info(*(void *)(a1 + 32), v3);
  }
  return result;
}

void NEFlowDirectorSetOpenControlSocketCallback(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    int v3 = _Block_copy(aBlock);
  }
  else {
    int v3 = 0;
  }
  uint64_t v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __NEFlowDirectorSetOpenControlSocketCallback_block_invoke;
  v5[3] = &unk_2641949E8;
  v5[4] = v3;
  void v5[5] = a1;
  dispatch_async(v4, v5);
}

void __NEFlowDirectorSetOpenControlSocketCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(const void **)(v2 + 128);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  *(void *)(v2 + 128) = *(void *)(a1 + 32);
}

void NEFlowDirectorSetMatchRulesCallback(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    int v3 = _Block_copy(aBlock);
  }
  else {
    int v3 = 0;
  }
  uint64_t v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __NEFlowDirectorSetMatchRulesCallback_block_invoke;
  v5[3] = &unk_264194A10;
  v5[4] = v3;
  void v5[5] = a1;
  dispatch_async(v4, v5);
}

void __NEFlowDirectorSetMatchRulesCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(const void **)(v2 + 136);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  *(void *)(v2 + 136) = *(void *)(a1 + 32);
}

void NEFlowDirectorSetNewFlowCallback(uint64_t a1, void *aBlock)
{
  if (aBlock) {
    int v3 = _Block_copy(aBlock);
  }
  else {
    int v3 = 0;
  }
  uint64_t v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __NEFlowDirectorSetNewFlowCallback_block_invoke;
  v5[3] = &unk_264194A38;
  v5[4] = v3;
  void v5[5] = a1;
  dispatch_async(v4, v5);
}

void __NEFlowDirectorSetNewFlowCallback_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = *(const void **)(v2 + 144);
  if (v3)
  {
    _Block_release(v3);
    uint64_t v2 = *(void *)(a1 + 40);
  }
  *(void *)(v2 + 144) = *(void *)(a1 + 32);
}

void NEFlowDirectorFetchFlowStates(uint64_t a1, void *aBlock)
{
  if (aBlock)
  {
    int v3 = _Block_copy(aBlock);
    uint64_t v4 = *(NSObject **)(a1 + 16);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = __NEFlowDirectorFetchFlowStates_block_invoke;
    v5[3] = &unk_264194A60;
    v5[4] = v3;
    void v5[5] = a1;
    dispatch_async(v4, v5);
  }
}

void __NEFlowDirectorFetchFlowStates_block_invoke(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  uint64_t v2 = *(const void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  if (*(void *)(v3 + 152))
  {
    _Block_release(v2);
  }
  else
  {
    *(void *)(v3 + 152) = v2;
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    BOOL v6 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x263EFFB08], 8, 0);
    *(unsigned char *)BOOL v6 = 10;
    v6[1] = 0;
    flow_director_msg_send(*(void *)(a1 + 40), (uint64_t)v6, 8uLL, 1);
    CFAllocatorDeallocate(v5, v6);
  }
}

uint64_t NEPunyCodeString(const char *a1, int32_t a2, char *a3, int32_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  pErrorCFIndex Code = U_ZERO_ERROR;
  UIDNAInfo v13 = (UIDNAInfo)xmmword_2129A01A0;
  int v8 = (const UIDNA *)MEMORY[0x216688240](34, &pErrorCode);
  uint64_t v9 = uidna_nameToASCII_UTF8(v8, a1, a2, a3, a4, &v13, &pErrorCode);
  uidna_close(v8);
  if (pErrorCode)
  {
    int v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v16 = a1;
      __int16 v17 = 1024;
      unsigned __int32 errors = pErrorCode;
      uint64_t v11 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed errorCode %d";
LABEL_9:
      _os_log_error_impl(&dword_212970000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
      return 0;
    }
    return 0;
  }
  if (v13.errors)
  {
    int v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v16 = a1;
      __int16 v17 = 1024;
      unsigned __int32 errors = v13.errors;
      uint64_t v11 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed info.errors 0x%08X";
      goto LABEL_9;
    }
    return 0;
  }
  return v9;
}

BOOL NEHelperTrackerAppInfoSetSigningIdentifier(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    *a1 = a2;
    a1[8] = a3;
  }
  return a1 != 0;
}

BOOL NEHelperTrackerAppInfoSetPID(uint64_t a1, int a2, int a3)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 56) = a2;
    *(_DWORD *)(a1 + 120) = a3;
  }
  return a1 != 0;
}

BOOL NEHelperTrackerAppInfoSetIsBrowser(uint64_t a1)
{
  if (a1) {
    *(_DWORD *)(a1 + 124) |= 1u;
  }
  return a1 != 0;
}

uint64_t NEHelperTrackerAppInfoIsBrowser(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 124) & 1;
  }
  return result;
}

uint64_t NEHelperTrackerGetAppUUID(uint64_t result, unsigned __int8 *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (const unsigned __int8 *)(result + 40);
    if (uuid_is_null((const unsigned __int8 *)(result + 40)))
    {
      int v5 = *(_DWORD *)(v3 + 56);
      if (v5)
      {
        uint64_t v13 = 0;
        long long v11 = 0u;
        long long v12 = 0u;
        long long v10 = 0u;
        if (proc_pidinfo(v5, 17, 1uLL, &v10, 56) == 56) {
          goto LABEL_12;
        }
      }
      int v6 = *(_DWORD *)(v3 + 28);
      if (v6)
      {
        uint64_t v13 = 0;
        long long v11 = 0u;
        long long v12 = 0u;
        long long v10 = 0u;
        if (proc_pidinfo(v6, 17, 1uLL, &v10, 56) == 56)
        {
LABEL_12:
          int v8 = (const unsigned __int8 *)&v10;
          uint64_t v9 = a2;
LABEL_14:
          uuid_copy(v9, v8);
          return 1;
        }
      }
      uint64_t v4 = (const unsigned __int8 *)(v3 + 104);
      if (uuid_is_null((const unsigned __int8 *)(v3 + 104)))
      {
        int v7 = *(_DWORD *)(v3 + 120);
        if (!v7 || (v13 = 0, v11 = 0u, v12 = 0u, long long v10 = 0u, proc_pidinfo(v7, 17, 1uLL, &v10, 56) != 56))
        {
          double result = *(unsigned int *)(v3 + 92);
          if (!result) {
            return result;
          }
          uint64_t v13 = 0;
          long long v11 = 0u;
          long long v12 = 0u;
          long long v10 = 0u;
          if (proc_pidinfo(result, 17, 1uLL, &v10, 56) != 56) {
            return 0;
          }
        }
        goto LABEL_12;
      }
    }
    uint64_t v9 = a2;
    int v8 = v4;
    goto LABEL_14;
  }
  return result;
}

uint64_t NEHelperTrackerAppInfoGetPID(unsigned int *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t result = a1[14];
  if (!result)
  {
    uint64_t result = a1[7];
    if (!result)
    {
      uint64_t result = a1[30];
      if (!result)
      {
        uint64_t result = a1[23];
        if (!result) {
          return 0;
        }
      }
    }
  }
  return result;
}

unint64_t NEHelperTrackerContextGetDomain(unint64_t a1)
{
  unint64_t domain = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_26AB0F7F8 == 2;
    if (v2
      && (qword_26AB0F810 <= domain
        ? (BOOL v3 = qword_26AB0F810 + (unint64_t)(unsigned __int16)word_26AB0F824 - 1 >= domain)
        : (BOOL v3 = 0),
          v3))
    {
      unint64_t domain = ne_tracker_context_get_domain();
    }
    else
    {
      unint64_t domain = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return domain;
}

unint64_t NEHelperTrackerContextGetDomainOwner(unint64_t a1)
{
  unint64_t domain_owner = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_26AB0F7F8 == 2;
    if (v2
      && (qword_26AB0F810 <= domain_owner
        ? (BOOL v3 = qword_26AB0F810 + (unint64_t)(unsigned __int16)word_26AB0F824 - 1 >= domain_owner)
        : (BOOL v3 = 0),
          v3))
    {
      unint64_t domain_owner = ne_tracker_context_get_domain_owner();
    }
    else
    {
      unint64_t domain_owner = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return domain_owner;
}

unint64_t NEHelperTrackerContextCanBlockRequest(unint64_t a1)
{
  unint64_t can_block_request = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_26AB0F7F8 == 2;
    if (v2
      && (qword_26AB0F810 <= can_block_request
        ? (BOOL v3 = qword_26AB0F810 + (unint64_t)(unsigned __int16)word_26AB0F824 - 1 >= can_block_request)
        : (BOOL v3 = 0),
          v3))
    {
      unint64_t can_block_request = ne_tracker_context_can_block_request();
    }
    else
    {
      unint64_t can_block_request = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return can_block_request;
}

unint64_t NEHelperTrackerContextCopyDomain(unint64_t a1, char *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v8 = ne_helper_tracker_trie == 0x5061747269636961 && unk_26AB0F7F8 == 2;
    if (v8
      && (qword_26AB0F810 <= v4
        ? (BOOL v9 = qword_26AB0F810 + (unint64_t)(unsigned __int16)word_26AB0F824 - 1 >= v4)
        : (BOOL v9 = 0),
          v9 && (unint64_t domain = (const char *)ne_tracker_context_get_domain()) != 0))
    {
      long long v11 = domain;
      unint64_t v12 = strlen(domain);
      unint64_t v13 = v12;
      unint64_t v4 = 0;
      if (a2 && v12 <= a3 - 1)
      {
        strncpy(a2, v11, v12);
        a2[v13] = 0;
        unint64_t v4 = (unint64_t)a2;
      }
      if (a4) {
        *a4 = v13;
      }
    }
    else
    {
      unint64_t v4 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return v4;
}

unint64_t NEHelperTrackerContextCopyDomainOwner(unint64_t a1, char *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v8 = ne_helper_tracker_trie == 0x5061747269636961 && unk_26AB0F7F8 == 2;
    if (v8
      && (qword_26AB0F810 <= v4
        ? (BOOL v9 = qword_26AB0F810 + (unint64_t)(unsigned __int16)word_26AB0F824 - 1 >= v4)
        : (BOOL v9 = 0),
          v9 && (unint64_t domain_owner = (const char *)ne_tracker_context_get_domain_owner()) != 0))
    {
      long long v11 = domain_owner;
      unint64_t v12 = strlen(domain_owner);
      unint64_t v13 = v12;
      unint64_t v4 = 0;
      if (a2 && v12 <= a3 - 1)
      {
        strncpy(a2, v11, v12);
        a2[v13] = 0;
        unint64_t v4 = (unint64_t)a2;
      }
      if (a4) {
        *a4 = v13;
      }
    }
    else
    {
      unint64_t v4 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return v4;
}

CFStringRef NEHelperTrackerContextDupDomain(const __CFString *a1)
{
  CFStringRef v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_26AB0F7F8 == 2;
    if (v2
      && (qword_26AB0F810 <= (unint64_t)v1
        ? (BOOL v3 = qword_26AB0F810 + (unint64_t)(unsigned __int16)word_26AB0F824 - 1 >= (unint64_t)v1)
        : (BOOL v3 = 0),
          v3 && (unint64_t domain = (const char *)ne_tracker_context_get_domain()) != 0))
    {
      CFStringRef v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], domain, 0x8000100u);
    }
    else
    {
      CFStringRef v1 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return v1;
}

CFStringRef NEHelperTrackerContextDupDomainOwner(const __CFString *a1)
{
  CFStringRef v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    BOOL v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_26AB0F7F8 == 2;
    if (v2
      && (qword_26AB0F810 <= (unint64_t)v1
        ? (BOOL v3 = qword_26AB0F810 + (unint64_t)(unsigned __int16)word_26AB0F824 - 1 >= (unint64_t)v1)
        : (BOOL v3 = 0),
          v3 && (unint64_t domain_owner = (const char *)ne_tracker_context_get_domain_owner()) != 0))
    {
      CFStringRef v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], domain_owner, 0x8000100u);
    }
    else
    {
      CFStringRef v1 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return v1;
}

void NEHelperTrackerProcessMatch(const char *a1, uint64_t a2, uint64_t a3, unsigned char *a4, int a5)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long buffer = 0u;
    long long v62 = 0u;
    if (!*a4)
    {
      int v10 = 0;
      goto LABEL_39;
    }
    goto LABEL_25;
  }
  int v10 = *(_DWORD *)(a3 + 56);
  if (v10
    || (int v10 = *(_DWORD *)(a3 + 28)) != 0
    || (int v10 = *(_DWORD *)(a3 + 120)) != 0
    || (int v10 = *(_DWORD *)(a3 + 92)) != 0)
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long buffer = 0u;
    long long v62 = 0u;
    proc_name(v10, &buffer, 0x100u);
    if (*a4) {
      goto LABEL_40;
    }
    int v11 = *(_DWORD *)(a3 + 56);
    if (!v11) {
      int v11 = *(_DWORD *)(a3 + 28);
    }
    unint64_t v12 = *(const char **)a3;
    if (*(void *)a3) {
      goto LABEL_10;
    }
    if (v11)
    {
      CFStringRef v16 = (const __CFString *)NECopySigningIdentifierForPIDwithAuditToken(v11, 0);
      if (!v16) {
        goto LABEL_39;
      }
      CFStringRef v17 = v16;
      unint64_t v12 = NEHelperTrackerDomainIsApproved_buffer;
      CFStringGetCString(v16, NEHelperTrackerDomainIsApproved_buffer, 254, 0x600u);
      CFRelease(v17);
      goto LABEL_10;
    }
LABEL_38:
    *(void *)uu = 0;
    long long v78 = 0;
    NEHelperTrackerGetAppUUID(a3, uu);
    if (uuid_is_null(uu)) {
      goto LABEL_39;
    }
    uint64_t v47 = (void *)NEHelperCacheCopySigningIdentifierMapping();
    if (!v47) {
      goto LABEL_39;
    }
    int v48 = v47;
    xpc_string_get_string_ptr(v47);
    unint64_t v12 = NEHelperTrackerDomainIsApproved_buffer;
    __strlcpy_chk();
    xpc_release(v48);
    goto LABEL_10;
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long buffer = 0u;
  long long v62 = 0u;
  if (*a4)
  {
LABEL_25:
    int v10 = 0;
    goto LABEL_40;
  }
  int v10 = 0;
  unint64_t v12 = *(const char **)a3;
  if (!*(void *)a3) {
    goto LABEL_38;
  }
LABEL_10:
  if (!ne_helper_skip_associated_domain_bundles
    || !xpc_dictionary_get_BOOL((xpc_object_t)ne_helper_skip_associated_domain_bundles, v12))
  {
    if (ne_helper_last_approved_bundle)
    {
      unint64_t v13 = (void *)ne_helper_last_approved_associated_domains;
      if (ne_helper_last_approved_associated_domains)
      {
        if (!strcmp((const char *)ne_helper_last_approved_bundle, v12)) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v14 = (void *)ne_tracker_lookup_app_domains();
    if (v14)
    {
      unint64_t v13 = v14;
      if (xpc_array_get_count(v14))
      {
        if (ne_helper_last_approved_bundle)
        {
          free((void *)ne_helper_last_approved_bundle);
          ne_helper_last_approved_bundle = 0;
        }
        if (ne_helper_last_approved_associated_domains) {
          xpc_release((xpc_object_t)ne_helper_last_approved_associated_domains);
        }
        ne_helper_last_approved_bundle = (uint64_t)strdup(v12);
        ne_helper_last_approved_associated_domains = (uint64_t)v13;
LABEL_22:
        *(void *)uu = 0;
        long long v78 = uu;
        uint64_t v79 = 0x2000000000;
        char v80 = 0;
        *(void *)uint32_t v49 = MEMORY[0x263EF8330];
        *(void *)&v49[8] = 0x40000000;
        *(void *)&v49[16] = __NEHelperTrackerDomainIsApproved_block_invoke;
        *(void *)&v49[24] = &unk_264194EF8;
        *(void *)&v49[32] = uu;
        *(void *)&v49[40] = a1;
        xpc_array_apply(v13, v49);
        int v15 = v78[24];
        _Block_object_dispose(uu, 8);
        if (v15) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      xpc_object_t v18 = (xpc_object_t)ne_helper_skip_associated_domain_bundles;
      if (!ne_helper_skip_associated_domain_bundles)
      {
        xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
        ne_helper_skip_associated_domain_bundles = (uint64_t)v18;
      }
      if (xpc_dictionary_get_count(v18) <= 0x7F) {
        xpc_dictionary_set_BOOL((xpc_object_t)ne_helper_skip_associated_domain_bundles, v12, 1);
      }
      xpc_release(v13);
    }
  }
LABEL_39:
  *a4 = 1;
LABEL_40:
  uint64_t v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = "";
    if (!*a4) {
      int v20 = ", approved domain";
    }
    socklen_t v21 = "App";
    if (a3 && (*(_DWORD *)(a3 + 124) & 1) != 0) {
      socklen_t v21 = "Web";
    }
    *(_DWORD *)uint32_t v49 = 136316162;
    *(void *)&v49[4] = "NEHelperTrackerProcessMatch";
    *(_WORD *)&v49[12] = 1024;
    *(_DWORD *)&v49[14] = v10;
    *(_WORD *)&v49[18] = 2080;
    *(void *)&v49[20] = &buffer;
    *(_WORD *)&v49[28] = 2080;
    *(void *)&v49[30] = v20;
    *(_WORD *)&v49[38] = 2080;
    *(void *)&v49[40] = v21;
    _os_log_impl(&dword_212970000, v19, OS_LOG_TYPE_DEFAULT, "%s: domain lookup - found match for tracker domain (pid %d %s)%s for %s", v49, 0x30u);
  }
  uint64_t v22 = ne_log_obj();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (a5)
  {
    if (v23)
    {
      int v24 = strlen(a1);
      if (a2)
      {
        unint64_t domain = (const char *)ne_tracker_context_get_domain();
        int v27 = strlen(domain);
        uint64_t v25 = (const char *)ne_tracker_context_get_domain();
        unint64_t domain_owner = (const char *)ne_tracker_context_get_domain_owner();
        int v26 = strlen(domain_owner);
        long long v28 = (const char *)ne_tracker_context_get_domain_owner();
      }
      else
      {
        uint64_t v25 = "null";
        int v26 = 4;
        int v27 = 4;
        long long v28 = "null";
      }
      if (a3)
      {
        int v36 = *(_DWORD *)(a3 + 56);
        if (!v36)
        {
          int v36 = *(_DWORD *)(a3 + 28);
          if (!v36)
          {
            int v36 = *(_DWORD *)(a3 + 120);
            if (!v36) {
              int v36 = *(_DWORD *)(a3 + 92);
            }
          }
        }
        uint64_t v37 = "";
        if (!*a4) {
          uint64_t v37 = ", approved domain";
        }
        if (*(_DWORD *)(a3 + 124)) {
          CFDataRef v38 = "Web";
        }
        else {
          CFDataRef v38 = "App";
        }
      }
      else
      {
        int v36 = 0;
        if (*a4) {
          uint64_t v37 = "";
        }
        else {
          uint64_t v37 = ", approved domain";
        }
        CFDataRef v38 = "App";
      }
      *(_DWORD *)uint32_t v49 = 136318723;
      *(void *)&v49[4] = "NEHelperTrackerProcessMatch";
      *(_WORD *)&v49[12] = 2160;
      *(void *)&v49[14] = 1752392040;
      *(_WORD *)&v49[22] = 1040;
      *(_DWORD *)&v49[24] = v24;
      *(_WORD *)&v49[28] = 2101;
      *(void *)&v49[30] = a1;
      *(_WORD *)&v49[38] = 2160;
      *(void *)&v49[40] = 1752392040;
      *(_WORD *)&v49[48] = 1040;
      LODWORD(v50) = v27;
      WORD2(v50) = 2101;
      *(void *)((char *)&v50 + 6) = v25;
      HIWORD(v50) = 2160;
      uint64_t v51 = 1752392040;
      LOWORD(v52) = 1040;
      *(_DWORD *)((char *)&v52 + 2) = v26;
      HIWORD(v52) = 2101;
      *(void *)uint64_t v53 = v28;
      *(_WORD *)&v53[8] = 1024;
      *(_DWORD *)CFTypeRef v54 = a3;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v36;
      __int16 v55 = 2080;
      p_long long buffer = &buffer;
      __int16 v57 = 2080;
      unsigned int v58 = v37;
      __int16 v59 = 2080;
      int v60 = v38;
      CFDictionaryRef v44 = "%s: domain lookup - found match for tracker%{sensitive, mask.hash, networkextension:string}.*P --> metadata "
            "%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:string}.*P (app"
            " info ref %X pid %d %s) %s - %s";
      int v45 = v22;
      uint32_t v46 = 132;
LABEL_87:
      _os_log_debug_impl(&dword_212970000, v45, OS_LOG_TYPE_DEBUG, v44, v49, v46);
    }
  }
  else if (v23)
  {
    int v29 = strlen(a1);
    if (a2)
    {
      uint32_t v39 = (const char *)ne_tracker_context_get_domain();
      int v32 = strlen(v39);
      uint64_t v30 = (const char *)ne_tracker_context_get_domain();
      long long v40 = (const char *)ne_tracker_context_get_domain_owner();
      int v31 = strlen(v40);
      unsigned int v33 = (const char *)ne_tracker_context_get_domain_owner();
    }
    else
    {
      uint64_t v30 = "null";
      int v31 = 4;
      int v32 = 4;
      unsigned int v33 = "null";
    }
    if (a3)
    {
      int v41 = *(_DWORD *)(a3 + 56);
      if (!v41)
      {
        int v41 = *(_DWORD *)(a3 + 28);
        if (!v41)
        {
          int v41 = *(_DWORD *)(a3 + 120);
          if (!v41) {
            int v41 = *(_DWORD *)(a3 + 92);
          }
        }
      }
      long long v42 = "";
      if (!*a4) {
        long long v42 = ", approved domain";
      }
      if (*(_DWORD *)(a3 + 124)) {
        uint64_t v43 = "Web";
      }
      else {
        uint64_t v43 = "App";
      }
    }
    else
    {
      int v41 = 0;
      if (*a4) {
        long long v42 = "";
      }
      else {
        long long v42 = ", approved domain";
      }
      uint64_t v43 = "App";
    }
    *(_DWORD *)uint32_t v49 = 136317955;
    *(void *)&v49[4] = "NEHelperTrackerProcessMatch";
    *(_WORD *)&v49[12] = 1024;
    *(_DWORD *)&v49[14] = v29;
    *(_WORD *)&v49[18] = 2081;
    *(void *)&v49[20] = a1;
    *(_WORD *)&v49[28] = 1024;
    *(_DWORD *)&v49[30] = v32;
    *(_WORD *)&v49[34] = 2081;
    *(void *)&v49[36] = v30;
    *(_WORD *)&v49[44] = 1024;
    *(_DWORD *)&v49[46] = v31;
    LOWORD(v50) = 2081;
    *(void *)((char *)&v50 + 2) = v33;
    WORD5(v50) = 1024;
    HIDWORD(v50) = a3;
    LOWORD(v51) = 1024;
    *(_DWORD *)((char *)&v51 + 2) = v41;
    HIWORD(v51) = 2080;
    uint64_t v52 = &buffer;
    *(_WORD *)uint64_t v53 = 2080;
    *(void *)&v53[2] = v42;
    *(_WORD *)CFTypeRef v54 = 2080;
    *(void *)&v54[2] = v43;
    CFDictionaryRef v44 = "%s: domain lookup - found match for tracker<%d : %{private}s> --> metadata <%d : %{private}s> <%d : %{private}"
          "s> (app info ref %X pid %d %s) %s - %s";
    int v45 = v22;
    uint32_t v46 = 102;
    goto LABEL_87;
  }
}

BOOL __NEHelperTrackerDomainIsApproved_block_invoke(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  int v5 = strcasecmp(*(const char **)(a1 + 40), string_ptr);
  if (!v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return v5 != 0;
}

uint64_t NEHelperTrackerCheckMetadataForWeb(uint64_t result)
{
  if (result) {
    return ne_tracker_context_is_from_web_list();
  }
  return result;
}

uint64_t NEHelperTrackerGetDisposition(uint64_t a1, const __CFArray *a2, void *a3, CFIndex *a4)
{
  return NEHelperTrackerGetDispositionRedactLogs(a1, a2, a3, a4, 0);
}

uint64_t NEHelperTrackerGetDispositionForDomain(_DWORD *a1, char *__s, void *a3, int a4)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  char v39 = 0;
  if (__s)
  {
    size_t v8 = strlen(__s);
    if (a1) {
      goto LABEL_3;
    }
LABEL_18:
    CFStringRef v17 = ne_log_obj();
    uint64_t result = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (a4)
    {
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136317187;
      int v41 = "NEHelperTrackerGetDispositionForDomain";
      __int16 v42 = 2160;
      if (__s) {
        xpc_object_t v18 = __s;
      }
      else {
        xpc_object_t v18 = "n/a";
      }
      *(void *)uint64_t v43 = 1752392040;
      *(_WORD *)&v43[8] = 1040;
      *(_DWORD *)&v43[10] = v8;
      __int16 v44 = 2101;
      *(void *)int v45 = v18;
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)uint32_t v46 = 0;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = 0;
      __int16 v47 = 2080;
      int v48 = "n/a";
      __int16 v49 = 2080;
      long long v50 = "n/a";
      __int16 v51 = 2080;
      uint64_t v52 = "App";
      int v15 = "%s Invalid app info for domain%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
      CFStringRef v16 = v17;
      goto LABEL_24;
    }
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136316931;
    int v41 = "NEHelperTrackerGetDispositionForDomain";
    __int16 v42 = 1024;
    if (__s) {
      int v27 = __s;
    }
    else {
      int v27 = "n/a";
    }
    *(_DWORD *)uint64_t v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(void *)&v43[6] = v27;
    __int16 v44 = 1024;
    *(_DWORD *)int v45 = 0;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = 0;
    *(_WORD *)uint32_t v46 = 2080;
    *(void *)&v46[2] = "n/a";
    __int16 v47 = 2080;
    int v48 = "n/a";
    __int16 v49 = 2080;
    long long v50 = "App";
    int v15 = "%s: Invalid app info for domain<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    CFStringRef v16 = v17;
LABEL_54:
    uint32_t v19 = 70;
    goto LABEL_55;
  }
  size_t v8 = 0;
  if (!a1) {
    goto LABEL_18;
  }
LABEL_3:
  BOOL v9 = ne_log_obj();
  uint64_t result = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8 - 254 <= 0xFFFFFFFFFFFFFF02)
  {
    if (a4)
    {
      if (!result) {
        return result;
      }
      if (__s) {
        int v11 = __s;
      }
      else {
        int v11 = "n/a";
      }
      int v12 = a1[14];
      if (!v12)
      {
        int v12 = a1[7];
        if (!v12)
        {
          int v12 = a1[30];
          if (!v12) {
            int v12 = a1[23];
          }
        }
      }
      char v13 = a1[31];
      int v41 = "NEHelperTrackerGetDispositionForDomain";
      *(_DWORD *)buf = 136317187;
      __int16 v42 = 2160;
      if (v13) {
        uint64_t v14 = "Web";
      }
      else {
        uint64_t v14 = "App";
      }
      *(void *)uint64_t v43 = 1752392040;
      *(_WORD *)&v43[8] = 1040;
      *(_DWORD *)&v43[10] = v8;
      __int16 v44 = 2101;
      *(void *)int v45 = v11;
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)uint32_t v46 = a1;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v12;
      __int16 v47 = 2080;
      int v48 = "n/a";
      __int16 v49 = 2080;
      long long v50 = "n/a";
      __int16 v51 = 2080;
      uint64_t v52 = v14;
      int v15 = "%s Invalid domain length%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
      CFStringRef v16 = v9;
LABEL_24:
      uint32_t v19 = 80;
LABEL_55:
      _os_log_debug_impl(&dword_212970000, v16, OS_LOG_TYPE_DEBUG, v15, buf, v19);
      return 0;
    }
    if (!result) {
      return result;
    }
    if (__s) {
      long long v28 = __s;
    }
    else {
      long long v28 = "n/a";
    }
    int v29 = a1[14];
    if (!v29)
    {
      int v29 = a1[7];
      if (!v29)
      {
        int v29 = a1[30];
        if (!v29) {
          int v29 = a1[23];
        }
      }
    }
    uint64_t v30 = "Web";
    char v31 = a1[31];
    int v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136316931;
    __int16 v42 = 1024;
    if ((v31 & 1) == 0) {
      uint64_t v30 = "App";
    }
    *(_DWORD *)uint64_t v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(void *)&v43[6] = v28;
    __int16 v44 = 1024;
    *(_DWORD *)int v45 = a1;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v29;
    *(_WORD *)uint32_t v46 = 2080;
    *(void *)&v46[2] = "n/a";
    __int16 v47 = 2080;
    int v48 = "n/a";
    __int16 v49 = 2080;
    long long v50 = v30;
    int v15 = "%s: Invalid domain length<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    CFStringRef v16 = v9;
    goto LABEL_54;
  }
  if (a4)
  {
    if (!result) {
      goto LABEL_57;
    }
    if (__s) {
      int v20 = __s;
    }
    else {
      int v20 = "n/a";
    }
    int v21 = a1[14];
    if (!v21)
    {
      int v21 = a1[7];
      if (!v21)
      {
        int v21 = a1[30];
        if (!v21) {
          int v21 = a1[23];
        }
      }
    }
    char v22 = a1[31];
    int v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136317187;
    __int16 v42 = 2160;
    if (v22) {
      BOOL v23 = "Web";
    }
    else {
      BOOL v23 = "App";
    }
    *(void *)uint64_t v43 = 1752392040;
    *(_WORD *)&v43[8] = 1040;
    *(_DWORD *)&v43[10] = v8;
    __int16 v44 = 2101;
    *(void *)int v45 = v20;
    *(_WORD *)&v45[8] = 1024;
    *(_DWORD *)uint32_t v46 = a1;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v21;
    __int16 v47 = 2080;
    int v48 = "n/a";
    __int16 v49 = 2080;
    long long v50 = "n/a";
    __int16 v51 = 2080;
    uint64_t v52 = v23;
    int v24 = "%s domain lookup for%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
    uint64_t v25 = v9;
    uint32_t v26 = 80;
  }
  else
  {
    if (!result) {
      goto LABEL_57;
    }
    if (__s) {
      unsigned int v35 = __s;
    }
    else {
      unsigned int v35 = "n/a";
    }
    int v36 = a1[14];
    if (!v36)
    {
      int v36 = a1[7];
      if (!v36)
      {
        int v36 = a1[30];
        if (!v36) {
          int v36 = a1[23];
        }
      }
    }
    uint64_t v37 = "Web";
    char v38 = a1[31];
    int v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136316931;
    __int16 v42 = 1024;
    if ((v38 & 1) == 0) {
      uint64_t v37 = "App";
    }
    *(_DWORD *)uint64_t v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(void *)&v43[6] = v35;
    __int16 v44 = 1024;
    *(_DWORD *)int v45 = a1;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v36;
    *(_WORD *)uint32_t v46 = 2080;
    *(void *)&v46[2] = "n/a";
    __int16 v47 = 2080;
    int v48 = "n/a";
    __int16 v49 = 2080;
    long long v50 = v37;
    int v24 = "%s: domain lookup for<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    uint64_t v25 = v9;
    uint32_t v26 = 70;
  }
  _os_log_debug_impl(&dword_212970000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
LABEL_57:
  if (a1[31]) {
    int v32 = NEHelperTrackerCheckMetadataForWeb;
  }
  else {
    int v32 = NEHelperTrackerCheckMetadataForApp;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
  buf[0] = 0;
  char v33 = ne_tracker_build_cache();
  if (buf[0]) {
    +[NEDiagnosticReport logInternalError:@"Tracker" subType:@"FailedtoReadMMAPFile" context:0];
  }
  if ((v33 & 1) == 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
    return 0;
  }
  strncpy(NEHelperTrackerGetDispositionForDomain_buffer, __s, 0xFDuLL);
  NEHelperTrackerGetDispositionForDomain_buffer[v8] = 0;
  BOOL matched = NEHelperTrackerMatchDomain(a1, NEHelperTrackerGetDispositionForDomain_buffer, (uint64_t)v32, a3, &v39, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (!matched) {
    return 0;
  }
  if (v39) {
    return 1;
  }
  else {
    return 3;
  }
}

void NEHelperTrackerClearCache()
{
  os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (qword_26AB0F818) {
    ne_tracker_clear_cache();
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
}

uint64_t NEHelperTrackerAppendTLV(uint64_t a1, char a2, size_t __n, void *__src)
{
  *(unsigned char *)a1 = a2;
  *(_DWORD *)(a1 + 1) = __n;
  if (__n)
  {
    uint64_t v5 = __n;
    memcpy((void *)(a1 + 5), __src, __n);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return a1 + v5 + 5;
}

unsigned char *NEHelperTrackerParseTLV(uint64_t a1, unsigned char *a2, _DWORD *a3, void *a4)
{
  uint64_t result = 0;
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a1 && a2 && a3 && a4)
  {
    *a2 = *(unsigned char *)a1;
    uint64_t v7 = *(unsigned int *)(a1 + 1);
    *a3 = v7;
    size_t v8 = (unsigned char *)(a1 + 5);
    *a4 = a1 + 5;
    int v9 = *a2;
    switch((int)v7)
    {
      case 0:
        int v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v18 = 136315650;
          uint32_t v19 = "NEHelperTrackerTLVLog";
          __int16 v20 = 1024;
          int v21 = v9;
          __int16 v22 = 1024;
          int v23 = 0;
          int v11 = "%s: Parsed TLV - type %d length %d";
          int v12 = v10;
          goto LABEL_19;
        }
        goto LABEL_24;
      case 1:
        unint64_t v13 = *v8;
        if (*v8) {
          goto LABEL_13;
        }
        goto LABEL_16;
      case 2:
        unint64_t v13 = *(unsigned __int16 *)v8;
        if (!*(_WORD *)v8) {
          goto LABEL_16;
        }
        goto LABEL_13;
      case 4:
        unint64_t v13 = *(unsigned int *)v8;
        if (*(_DWORD *)v8) {
          goto LABEL_13;
        }
        goto LABEL_16;
      case 8:
        unint64_t v13 = *(void *)v8;
        if (!*(void *)v8) {
          goto LABEL_16;
        }
LABEL_13:
        uint64_t v14 = ne_log_obj();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_24;
        }
        int v18 = 136315906;
        uint32_t v19 = "NEHelperTrackerTLVLog";
        __int16 v20 = 1024;
        int v21 = v9;
        __int16 v22 = 1024;
        int v23 = v7;
        __int16 v24 = 2048;
        uint64_t v25 = (unsigned char *)v13;
        int v11 = "%s: Parsed TLV - type %d length %d value %llu";
        goto LABEL_22;
      default:
LABEL_16:
        int v15 = v8[v7 - 1];
        uint64_t v14 = ne_log_obj();
        BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v15)
        {
          if (!v16) {
            goto LABEL_24;
          }
          int v18 = 136315650;
          uint32_t v19 = "NEHelperTrackerTLVLog";
          __int16 v20 = 1024;
          int v21 = v9;
          __int16 v22 = 1024;
          int v23 = v7;
          int v11 = "%s: Parsed TLV - type %d length %d";
          int v12 = v14;
LABEL_19:
          uint32_t v17 = 24;
        }
        else
        {
          if (!v16) {
            goto LABEL_24;
          }
          int v18 = 136315906;
          uint32_t v19 = "NEHelperTrackerTLVLog";
          __int16 v20 = 1024;
          int v21 = v9;
          __int16 v22 = 1024;
          int v23 = v7;
          __int16 v24 = 2080;
          uint64_t v25 = v8;
          int v11 = "%s: Parsed TLV - type %d length %d value <%s>";
LABEL_22:
          int v12 = v14;
          uint32_t v17 = 34;
        }
        _os_log_debug_impl(&dword_212970000, v12, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v18, v17);
LABEL_24:
        uint64_t result = &v8[*a3];
        break;
    }
  }
  return result;
}

uint64_t NEHelperTrackerCalculateParameterLen(int a1, int a2, unsigned __int8 *uu, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  if (a1) {
    int v13 = 6;
  }
  else {
    int v13 = 0;
  }
  int v14 = a2 + 5;
  if (!a2) {
    int v14 = 0;
  }
  int v15 = v14 + v13;
  int is_null = uuid_is_null(uu);
  int v17 = v15 + 21;
  if (is_null) {
    int v17 = v15;
  }
  if (a5) {
    BOOL v18 = a4 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  int v19 = a5 + 5;
  if (v18) {
    int v19 = 0;
  }
  if (a7) {
    BOOL v20 = a6 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  int v21 = a7 + 5;
  if (v20) {
    int v21 = 0;
  }
  unsigned int v22 = v21 + v19 + v17;
  if (a8) {
    return v22 + 9;
  }
  else {
    return v22;
  }
}

uint64_t NEHelperTrackerFillParameters(char *a1, size_t a2, int a3, unsigned char *a4, const unsigned __int8 *a5, const void *a6, uint64_t a7, const void *a8, uint64_t a9, int a10)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    bzero(a1, a2);
    BOOL v18 = a1;
    if (a3)
    {
      *a1 = 1;
      *(_DWORD *)(a1 + 1) = 1;
      a1[5] = a3;
      BOOL v18 = a1 + 6;
    }
    if (a4)
    {
      size_t v19 = *a4;
      if (*a4)
      {
        *BOOL v18 = 2;
        *(_DWORD *)(v18 + 1) = v19;
        BOOL v20 = v18 + 5;
        memcpy(v20, a4, v19);
        BOOL v18 = &v20[v19];
      }
    }
    if (!uuid_is_null(a5))
    {
      *BOOL v18 = 3;
      *(_DWORD *)(v18 + 1) = 16;
      *(_OWORD *)(v18 + 5) = *(_OWORD *)a5;
      v18 += 21;
    }
    if (a6 && a7)
    {
      *BOOL v18 = 4;
      *(_DWORD *)(v18 + 1) = a7;
      if (a7)
      {
        a7 = a7;
        memcpy(v18 + 5, a6, a7);
      }
      else
      {
        a7 = 0;
      }
      v18 += a7 + 5;
    }
    if (a8 && a9)
    {
      *BOOL v18 = 5;
      *(_DWORD *)(v18 + 1) = a9;
      if (a9)
      {
        uint64_t v21 = a9;
        memcpy(v18 + 5, a8, a9);
      }
      else
      {
        uint64_t v21 = 0;
      }
      v18 += v21 + 5;
    }
    if (a10)
    {
      *BOOL v18 = 6;
      *(_DWORD *)(v18 + 1) = 4;
      *(_DWORD *)(v18 + 5) = a10;
      LODWORD(v18) = v18 + 9;
    }
    return (v18 - a1);
  }
  return result;
}

BOOL NEHelperTrackerAddIPForAllFlowsRedactLogs(int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6, CFStringRef theString, int a8)
{
  int v9 = a3;
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v106 = 0;
  memset(v105, 0, sizeof(v105));
  memset(v104, 0, 254);
  memset(v103, 0, 254);
  memset(out, 0, 37);
  *(void *)uu = 0;
  uint64_t v101 = 0;
  if (!a3 || !a4)
  {
    uint64_t v21 = ne_log_obj();
    BOOL result = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    int v23 = "is not";
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    *(_DWORD *)buf = 136315650;
    if (!v9) {
      int v23 = "is";
    }
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = a4;
    __int16 v24 = "%s: Invalid parameters - addresses %s null, count %d";
    uint64_t v25 = v21;
    uint32_t v26 = 28;
    goto LABEL_47;
  }
  if (a2 != 2 && a2 != 30)
  {
    int v27 = ne_log_obj();
    BOOL result = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    __int16 v24 = "%s: Invalid parameters - address family must be IPv4 / IPv6 (%d)";
    uint64_t v25 = v27;
    uint32_t v26 = 18;
    goto LABEL_47;
  }
  if (!a5)
  {
    long long v28 = ne_log_obj();
    BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    __int16 v24 = "%s: Invalid parameters - app_info_ref is null";
    goto LABEL_46;
  }
  if (a1)
  {
    if (!a6)
    {
      long long v28 = ne_log_obj();
      BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      __int16 v24 = "%s: Invalid parameters - trackerDomainContextRef is null";
      goto LABEL_46;
    }
    int v15 = (const char *)NEHelperTrackerContextCopyDomain(a6, (char *)v104, 254, 0);
    __s = (char *)NEHelperTrackerContextCopyDomainOwner(a6, (char *)v103, 254, 0);
    if (!v15 || !__s)
    {
      long long v28 = ne_log_obj();
      BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      __int16 v24 = "%s: Failed to get domain/owner from context";
      goto LABEL_46;
    }
    size_t v16 = strlen(v15);
    if (v16 >= 2)
    {
      size_t v17 = v16 - 1;
      if (v15[v16 - 1] == 46)
      {
        __strncpy_chk();
        ne_session_trim_domain_domain_buffer[v17] = 0;
        int v15 = ne_session_trim_domain_domain_buffer;
      }
    }
    size_t v18 = strlen(v15);
    size_t v19 = strlen(__s) + 1;
    int v20 = (a1 == 3) | 2;
  }
  else
  {
    if (!theString
      || !CFStringGetCString(theString, NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer, 254, 0x8000100u))
    {
      long long v28 = ne_log_obj();
      BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!result) {
        return result;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      __int16 v24 = "%s: Invalid parameters - original domain NULL / invalid for NEHelperTrackerDispositionNotTracker";
      goto LABEL_46;
    }
    int v15 = NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer;
    size_t v29 = strlen(NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer);
    if (v29 >= 2)
    {
      size_t v30 = v29 - 1;
      if (NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer[v29 - 1] == 46)
      {
        int v15 = ne_session_trim_domain_domain_buffer;
        __strncpy_chk();
        ne_session_trim_domain_domain_buffer[v30] = 0;
      }
    }
    size_t v18 = strlen(v15);
    __s = 0;
    size_t v19 = 0;
    int v20 = 0;
  }
  uint64_t v68 = v18 + 1;
  uint64_t v69 = v19;
  if (v19 >= 0x40 || v18 + 1 >= 0x40) {
    int v32 = v20;
  }
  else {
    int v32 = v20 | 4;
  }
  if ((NEHelperTrackerGetAppUUID((uint64_t)a5, uu) & 1) == 0)
  {
    long long v28 = ne_log_obj();
    BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    __int16 v24 = "%s: Failed to get app UUID from app_info_ref";
    goto LABEL_46;
  }
  if (uuid_is_null(uu))
  {
    long long v28 = ne_log_obj();
    BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    __int16 v24 = "%s: NULL app UUID";
    goto LABEL_46;
  }
  if (a2 == 2) {
    int v33 = 16;
  }
  else {
    int v33 = 28;
  }
  int v34 = NEHelperTrackerCalculateParameterLen(a2, v33, uu, (uint64_t)v15, v68, (uint64_t)__s, v69, v32);
  if (v34)
  {
    int v67 = v34;
    if (v34 < 201)
    {
      long long v66 = v105;
    }
    else
    {
      long long v66 = malloc_type_malloc(v34, 0xD400DD07uLL);
      if (!v66)
      {
        long long v28 = ne_log_obj();
        BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        if (result)
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          __int16 v24 = "%s: Failed to allocate parameter buffer";
LABEL_46:
          uint64_t v25 = v28;
          uint32_t v26 = 12;
LABEL_47:
          _os_log_error_impl(&dword_212970000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
          return 0;
        }
        return result;
      }
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    memset(buf, 0, sizeof(buf));
    buf[1] = a2;
    if (a4 < 1)
    {
      int v35 = 0;
LABEL_115:
      uint64_t v37 = v66;
LABEL_116:
      if (v37 != v105) {
        free(v37);
      }
      return v35 == 0;
    }
    int v35 = 0;
    int v65 = v32;
    int v63 = v32 & 2;
    int v64 = v32 & 1;
    uint64_t v36 = a4;
    uint64_t v37 = v66;
    while (1)
    {
      if (a2 == 30)
      {
        buf[0] = 28;
        *(_OWORD *)&buf[8] = *(_OWORD *)*v9;
        uint64_t v38 = v69;
      }
      else
      {
        uint64_t v38 = v69;
        if (a2 != 2)
        {
          long long v62 = ne_log_obj();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long v71 = 136315394;
            long long v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
            __int16 v73 = 1024;
            *(_DWORD *)long long v74 = a2;
            _os_log_error_impl(&dword_212970000, v62, OS_LOG_TYPE_ERROR, "%s: Address with invalid family %d", v71, 0x12u);
          }
          int v35 = 0;
          goto LABEL_116;
        }
        buf[0] = 16;
        *(_DWORD *)&uint8_t buf[4] = **v9;
      }
      int v39 = NEHelperTrackerFillParameters((char *)v37, v67, a2, buf, uu, v15, v68, __s, v38, v65);
      if (v39 != v67)
      {
        int v60 = v39;
        int v61 = ne_log_obj();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v71 = 136315650;
          long long v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          __int16 v73 = 1024;
          *(_DWORD *)long long v74 = v67;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v60;
          _os_log_error_impl(&dword_212970000, v61, OS_LOG_TYPE_ERROR, "%s: Failed to fill parameters <calculated len %d result len %d>", v71, 0x18u);
        }
        goto LABEL_115;
      }
      int v35 = tracker_action(1, (char *)v37, v67);
      if (v35) {
        break;
      }
      if (nelog_is_debug_logging_enabled())
      {
        long long v91 = 0u;
        long long v92 = 0u;
        *(_OWORD *)CFDataRef v89 = 0u;
        long long v90 = 0u;
        if (a2 == 2)
        {
          int v42 = 2;
          uint64_t v43 = &buf[4];
        }
        else
        {
          int v42 = 30;
          uint64_t v43 = &buf[8];
        }
        inet_ntop(v42, v43, v89, 0x40u);
        uuid_unparse_lower(uu, out);
        __int16 v51 = ne_log_obj();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          int v52 = a5[14];
          if (!v52)
          {
            int v52 = a5[7];
            if (!v52)
            {
              int v52 = a5[30];
              if (!v52) {
                int v52 = a5[23];
              }
            }
          }
          *(_DWORD *)long long v71 = 136316162;
          long long v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          __int16 v73 = 1024;
          *(_DWORD *)long long v74 = v52;
          *(_WORD *)&v74[4] = 2080;
          *(void *)&v74[6] = out;
          __int16 v75 = 1024;
          *(_DWORD *)long long v76 = v64;
          *(_WORD *)&v76[4] = 1024;
          *(_DWORD *)&v76[6] = v63;
          _os_log_impl(&dword_212970000, v51, OS_LOG_TYPE_DEFAULT, "%s: completed for app <%d : %s> <app approved %d> <is_tracker %d>", v71, 0x28u);
        }
        uint64_t v53 = ne_log_obj();
        BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
        if (a8)
        {
          if (v54)
          {
            int v55 = a5[14];
            if (!v55)
            {
              int v55 = a5[7];
              if (!v55)
              {
                int v55 = a5[30];
                if (!v55) {
                  int v55 = a5[23];
                }
              }
            }
            *(_DWORD *)long long v71 = 136318723;
            long long v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
            __int16 v73 = 2160;
            *(void *)long long v74 = 1752392040;
            *(_WORD *)&v74[8] = 1040;
            *(_DWORD *)&v74[10] = v68;
            __int16 v75 = 2101;
            *(void *)long long v76 = v15;
            *(_WORD *)&v76[8] = 2160;
            *(void *)&v76[10] = 1752392040;
            *(_WORD *)&v76[18] = 1040;
            LODWORD(v77) = v69;
            WORD2(v77) = 2101;
            *(void *)((char *)&v77 + 6) = __s;
            HIWORD(v77) = 1024;
            LODWORD(v78) = v55;
            WORD2(v78) = 2080;
            *(void *)((char *)&v78 + 6) = out;
            HIWORD(v78) = 2160;
            uint64_t v79 = 1752392040;
            *(_WORD *)char v80 = 1040;
            *(_DWORD *)&v80[2] = 64;
            __int16 v81 = 2101;
            long long v82 = v89;
            __int16 v83 = 1024;
            int v84 = v64;
            __int16 v85 = 1024;
            int v86 = v63;
            __int16 v87 = 1024;
            int v88 = 0;
            CFStringRef v56 = v53;
            __int16 v57 = "%s: completed for%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkex"
                  "tension:string}.*P app <%d : %s> %{sensitive, mask.hash, networkextension:string}.*P <app approved %d>"
                  " <is_tracker %d> (error = %d)";
            uint32_t v58 = 124;
            goto LABEL_111;
          }
        }
        else if (v54)
        {
          int v59 = a5[14];
          if (!v59)
          {
            int v59 = a5[7];
            if (!v59)
            {
              int v59 = a5[30];
              if (!v59) {
                int v59 = a5[23];
              }
            }
          }
          *(_DWORD *)long long v71 = 136317955;
          long long v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          __int16 v73 = 1024;
          *(_DWORD *)long long v74 = v68;
          *(_WORD *)&v74[4] = 2081;
          *(void *)&v74[6] = v15;
          __int16 v75 = 1024;
          *(_DWORD *)long long v76 = v69;
          *(_WORD *)&v76[4] = 2081;
          *(void *)&v76[6] = __s;
          *(_WORD *)&v76[14] = 1024;
          *(_DWORD *)&v76[16] = v59;
          LOWORD(v77) = 2080;
          *(void *)((char *)&v77 + 2) = out;
          WORD5(v77) = 1024;
          HIDWORD(v77) = 64;
          LOWORD(v78) = 2081;
          *(void *)((char *)&v78 + 2) = v89;
          WORD5(v78) = 1024;
          HIDWORD(v78) = v64;
          LOWORD(v79) = 1024;
          *(_DWORD *)((char *)&v79 + 2) = v63;
          HIWORD(v79) = 1024;
          *(_DWORD *)char v80 = 0;
          CFStringRef v56 = v53;
          __int16 v57 = "%s: completed for<%d : %{private}s> <%d : %{private}s> app <%d : %s> <%d : %{private}s> <app approved %d"
                "> <is_tracker %d> (error = %d)";
          uint32_t v58 = 94;
LABEL_111:
          _os_log_debug_impl(&dword_212970000, v56, OS_LOG_TYPE_DEBUG, v57, v71, v58);
        }
LABEL_103:
        uint64_t v37 = v66;
      }
      ++v9;
      if (!--v36) {
        goto LABEL_116;
      }
    }
    long long v91 = 0u;
    long long v92 = 0u;
    *(_OWORD *)CFDataRef v89 = 0u;
    long long v90 = 0u;
    if (a2 == 2)
    {
      int v40 = 2;
      int v41 = &buf[4];
    }
    else
    {
      int v40 = 30;
      int v41 = &buf[8];
    }
    inet_ntop(v40, v41, v89, 0x40u);
    uuid_unparse_lower(uu, out);
    __int16 v44 = ne_log_obj();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (a8)
    {
      if (!v45) {
        goto LABEL_103;
      }
      int v46 = a5[14];
      if (!v46)
      {
        int v46 = a5[7];
        if (!v46)
        {
          int v46 = a5[30];
          if (!v46) {
            int v46 = a5[23];
          }
        }
      }
      *(_DWORD *)long long v71 = 136318723;
      long long v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      __int16 v73 = 2160;
      *(void *)long long v74 = 1752392040;
      *(_WORD *)&v74[8] = 1040;
      *(_DWORD *)&v74[10] = v68;
      __int16 v75 = 2101;
      *(void *)long long v76 = v15;
      *(_WORD *)&v76[8] = 2160;
      *(void *)&v76[10] = 1752392040;
      *(_WORD *)&v76[18] = 1040;
      LODWORD(v77) = v69;
      WORD2(v77) = 2101;
      *(void *)((char *)&v77 + 6) = __s;
      HIWORD(v77) = 1024;
      LODWORD(v78) = v46;
      WORD2(v78) = 2080;
      *(void *)((char *)&v78 + 6) = out;
      HIWORD(v78) = 2160;
      uint64_t v79 = 1752392040;
      *(_WORD *)char v80 = 1040;
      *(_DWORD *)&v80[2] = 64;
      __int16 v81 = 2101;
      long long v82 = v89;
      __int16 v83 = 1024;
      int v84 = v64;
      __int16 v85 = 1024;
      int v86 = v63;
      __int16 v87 = 1024;
      int v88 = v35;
      __int16 v47 = v44;
      int v48 = "%s: failed for%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:s"
            "tring}.*P app <%d : %s> %{sensitive, mask.hash, networkextension:string}.*P <app approved %d> <is_tracker %d> (error = %d)";
      uint32_t v49 = 124;
    }
    else
    {
      if (!v45) {
        goto LABEL_103;
      }
      int v50 = a5[14];
      if (!v50)
      {
        int v50 = a5[7];
        if (!v50)
        {
          int v50 = a5[30];
          if (!v50) {
            int v50 = a5[23];
          }
        }
      }
      *(_DWORD *)long long v71 = 136317955;
      long long v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      __int16 v73 = 1024;
      *(_DWORD *)long long v74 = v68;
      *(_WORD *)&v74[4] = 2081;
      *(void *)&v74[6] = v15;
      __int16 v75 = 1024;
      *(_DWORD *)long long v76 = v69;
      *(_WORD *)&v76[4] = 2081;
      *(void *)&v76[6] = __s;
      *(_WORD *)&v76[14] = 1024;
      *(_DWORD *)&v76[16] = v50;
      LOWORD(v77) = 2080;
      *(void *)((char *)&v77 + 2) = out;
      WORD5(v77) = 1024;
      HIDWORD(v77) = 64;
      LOWORD(v78) = 2081;
      *(void *)((char *)&v78 + 2) = v89;
      WORD5(v78) = 1024;
      HIDWORD(v78) = v64;
      LOWORD(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 2) = v63;
      HIWORD(v79) = 1024;
      *(_DWORD *)char v80 = v35;
      __int16 v47 = v44;
      int v48 = "%s: failed for<%d : %{private}s> <%d : %{private}s> app <%d : %s> <%d : %{private}s> <app approved %d> <is_t"
            "racker %d> (error = %d)";
      uint32_t v49 = 94;
    }
    _os_log_error_impl(&dword_212970000, v47, OS_LOG_TYPE_ERROR, v48, v71, v49);
    goto LABEL_103;
  }
  long long v28 = ne_log_obj();
  BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
  if (result)
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    __int16 v24 = "%s: Failed to get calculate parameter size";
    goto LABEL_46;
  }
  return result;
}

BOOL NEHelperTrackerAddIPForAllFlows(int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6, const __CFString *a7)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(a1, a2, a3, a4, a5, a6, a7, 0);
}

BOOL NEHelperTrackerAddIPWithDisposition(int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(a1, a2, a3, a4, a5, a6, 0, 0);
}

BOOL NEHelperTrackerAddIP(int a1, _DWORD **a2, int a3, _DWORD *a4, unint64_t a5)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(1, a1, a2, a3, a4, a5, 0, 0);
}

BOOL NEHelperTrackerDumpIPEntries(int a1, char *buffer, size_t buffer_size, char *a4, size_t a5)
{
  BOOL result = 0;
  uint64_t v66 = *MEMORY[0x263EF8340];
  char v53 = 0;
  unsigned int v52 = 0;
  __int16 v51 = 0;
  if (buffer)
  {
    if (buffer_size)
    {
      BOOL result = 0;
      if (a4)
      {
        if (a5 >= 0xFA)
        {
          int v11 = 0;
          memset(out, 0, 37);
          memset(uu, 0, sizeof(uu));
          int v12 = 3;
          if (a1 && (int)buffer_size >= 21)
          {
            int v13 = malloc_type_malloc(0x80uLL, 0x1050040CA3BB8F4uLL);
            if (v13)
            {
              int v14 = v13;
              void v13[6] = 0u;
              v13[7] = 0u;
              v13[4] = 0u;
              void v13[5] = 0u;
              void v13[2] = 0u;
              v13[3] = 0u;
              *int v13 = 0u;
              v13[1] = 0u;
              *((_DWORD *)v13 + 30) = a1;
              if (NEHelperTrackerGetAppUUID((uint64_t)v13, uu) && !uuid_is_null(uu))
              {
                *long long buffer = 3;
                *(_DWORD *)(buffer + 1) = 16;
                *(_OWORD *)(buffer + 5) = *(_OWORD *)uu;
                uuid_unparse_lower(uu, out);
                int v11 = snprintf(a4, a5, "\n* Filter by pid %d (%s)\n\n", a1, out);
                uuid_clear(uu);
                memset(out, 0, 37);
                int v12 = 2;
              }
              else
              {
                int v11 = 0;
              }
              free(v14);
            }
            else
            {
              int v11 = 0;
            }
          }
          int v15 = tracker_action(v12, buffer, buffer_size);
          if (v15)
          {
            int v16 = v15;
            size_t v17 = ne_log_obj();
            BOOL result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
            if (!result) {
              return result;
            }
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "NEHelperTrackerDumpIPEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v16;
            size_t v18 = "%s: Failed to dump tracker IP table entries <error %d>";
LABEL_16:
            size_t v19 = buf;
            goto LABEL_17;
          }
          uint64_t v22 = *(unsigned int *)buffer;
          int v23 = ne_log_obj();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "NEHelperTrackerDumpIPEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v22;
            _os_log_debug_impl(&dword_212970000, v23, OS_LOG_TYPE_DEBUG, "%s: received tlv buffer size is %d", buf, 0x12u);
          }
          int v24 = snprintf(&a4[v11], a5 - v11, "%5s %36s %6s %40s %11s %s\n%5s %36s %6s %40s %11s %s\n", "Count", "App UUID", "Family", "Address", "Flags", "Domain - Owner", "=====", "========", "======", "=======", "=====", "==============");
          if (v22)
          {
            uint8_t v25 = 0;
            int v49 = 0;
            int v50 = 0;
            int v26 = 0;
            int v27 = &buffer[v22 + 4];
            int v28 = v24 + v11;
            size_t v29 = buffer + 4;
            __int16 v47 = v27;
            uint64_t v46 = 0;
            do
            {
              size_t v30 = NEHelperTrackerParseTLV((uint64_t)v29, &v53, &v52, &v51);
              if (!v30) {
                break;
              }
              size_t v31 = a5 - v28;
              if (v31 <= 0xF9)
              {
                BOOL v45 = ne_log_obj();
                BOOL result = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
                if (!result) {
                  return result;
                }
                *(_DWORD *)buf = 136315138;
                *(void *)&uint8_t buf[4] = "NEHelperTrackerDumpIPEntries";
                size_t v18 = "%s: Failed to dump tracker IP table entries - exceeded dump_buffer_size size";
                size_t v19 = buf;
                int v20 = v45;
                uint32_t v21 = 12;
                goto LABEL_18;
              }
              size_t v29 = v30;
              if (v53 == 7)
              {
                int v32 = v51;
                int v33 = &v51[v52];
                int v48 = v26 + 1;
                int v34 = snprintf(&a4[v28], v31, "%5d ", v26 + 1) + v28;
                if (v32 < v33)
                {
                  while (1)
                  {
                    int v32 = NEHelperTrackerParseTLV((uint64_t)v32, &v53, &v52, &v51);
                    switch(v53)
                    {
                      case 1:
                        if (v52 != 1) {
                          goto LABEL_54;
                        }
                        uint8_t v25 = *v51;
                        int v35 = snprintf(&a4[v34], a5 - v34, "%6d ");
                        goto LABEL_53;
                      case 2:
                        long long v62 = 0u;
                        long long v63 = 0u;
                        long long v60 = 0u;
                        long long v61 = 0u;
                        long long v58 = 0u;
                        long long v59 = 0u;
                        memset(buf, 0, sizeof(buf));
                        buf[1] = v25;
                        if (v25 == 30)
                        {
                          if (v52 != 16)
                          {
                            size_t v17 = ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                              return 0;
                            }
LABEL_75:
                            *(_DWORD *)BOOL v54 = 136315394;
                            *(void *)&v54[4] = "NEHelperTrackerDumpIPEntries";
                            *(_WORD *)&v54[12] = 1024;
                            *(_DWORD *)&v54[14] = v52;
                            size_t v18 = "%s: IPv4 Address got invalid length %d";
LABEL_76:
                            size_t v19 = (uint8_t *)v54;
LABEL_17:
                            int v20 = v17;
                            uint32_t v21 = 18;
LABEL_18:
                            _os_log_error_impl(&dword_212970000, v20, OS_LOG_TYPE_ERROR, v18, v19, v21);
                            return 0;
                          }
                          buf[0] = 28;
                          uint64_t v37 = &buf[8];
                          *(_OWORD *)&buf[8] = *(_OWORD *)v51;
                          long long v55 = 0u;
                          long long v56 = 0u;
                          memset(v54, 0, sizeof(v54));
                          int v36 = 30;
                        }
                        else
                        {
                          if (v25 != 2)
                          {
                            size_t v17 = ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                              return 0;
                            }
                            *(_DWORD *)BOOL v54 = 136315394;
                            *(void *)&v54[4] = "NEHelperTrackerDumpIPEntries";
                            *(_WORD *)&v54[12] = 1024;
                            *(_DWORD *)&v54[14] = v25;
                            size_t v18 = "%s: Address with invalid family %d";
                            goto LABEL_76;
                          }
                          if (v52 != 4)
                          {
                            size_t v17 = ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
                              return 0;
                            }
                            goto LABEL_75;
                          }
                          buf[0] = 16;
                          *(_DWORD *)&uint8_t buf[4] = *(_DWORD *)v51;
                          long long v55 = 0uLL;
                          long long v56 = 0uLL;
                          memset(v54, 0, sizeof(v54));
                          int v36 = 2;
                          uint64_t v37 = &buf[4];
                        }
                        inet_ntop(v36, v37, v54, 0x40u);
                        int v35 = snprintf(&a4[v34], a5 - v34, "%40s ");
LABEL_53:
                        v34 += v35;
                        goto LABEL_54;
                      case 3:
                        if (v52 != 16) {
                          goto LABEL_54;
                        }
                        *(_OWORD *)uu = *(_OWORD *)v51;
                        uuid_unparse_lower(uu, out);
                        int v35 = snprintf(&a4[v34], a5 - v34, "%s ");
                        goto LABEL_53;
                      case 4:
                        if (v52 < 2 || v51[v52 - 1]) {
                          goto LABEL_54;
                        }
                        int v35 = snprintf(&a4[v34], a5 - v34, "%s%-20s ");
                        goto LABEL_53;
                      case 5:
                        if (v52 < 2 || v51[v52 - 1]) {
                          goto LABEL_54;
                        }
                        int v35 = snprintf(&a4[v34], a5 - v34, "- %s");
                        goto LABEL_53;
                      case 6:
                        if (v52 != 4)
                        {
                          size_t v17 = ne_log_obj();
                          BOOL result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
                          if (!result) {
                            return result;
                          }
                          *(_DWORD *)buf = 136315394;
                          *(void *)&uint8_t buf[4] = "NEHelperTrackerDumpIPEntries";
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = v52;
                          size_t v18 = "%s: Flags with invalid size %d";
                          goto LABEL_16;
                        }
                        int v38 = *(_DWORD *)v51;
                        uint64_t v39 = snprintf(&a4[v34], a5 - v34, "<%2X: ", *(_DWORD *)v51) + (uint64_t)v34;
                        int v40 = "S";
                        if ((v38 & 4) == 0) {
                          int v40 = " ";
                        }
                        v50 += (v38 & 4) >> 2;
                        int v41 = v39 + snprintf(&a4[v39], a5 - v39, "%s", v40);
                        int v42 = "|T";
                        if ((v38 & 2) == 0) {
                          int v42 = "| ";
                        }
                        v49 += (v38 & 2) >> 1;
                        int v43 = v41 + snprintf(&a4[v41], a5 - v41, "%s", v42);
                        __int16 v44 = "|A> ";
                        if ((v38 & 1) == 0) {
                          __int16 v44 = "| > ";
                        }
                        int v34 = v43 + snprintf(&a4[v43], a5 - v43, "%s", v44);
LABEL_54:
                        if (v32 >= v33) {
                          goto LABEL_55;
                        }
                        break;
                      default:
                        goto LABEL_54;
                    }
                  }
                }
LABEL_55:
                int v28 = snprintf(&a4[v34], a5 - v34, "\n") + v34;
                int v27 = v47;
                int v26 = v48;
              }
              else if (v53 == 8 && v52 == 8)
              {
                uint64_t v46 = *(void *)v51;
              }
            }
            while (v29 < v27);
            if (v26 >= 1) {
              snprintf(&a4[v28], a5 - v28, "\n* Total count %d (short count %d) (total memory used %zu) (trackers %d non-trackers %d) (S=short T=tracker A=app-approved)\n\n", v26, v50, v46, v49, v26 - v49);
            }
          }
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t NEHelperTrackerGetDispositionWrapper(uint64_t a1, char *__s, char **a3, unint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  memset(v16, 0, sizeof(v16));
  if (*(void *)a1) {
    *(void *)&v16[0] = *(void *)a1;
  }
  size_t v8 = *(long long **)(a1 + 8);
  if (v8)
  {
    long long v9 = *v8;
    *(_OWORD *)((char *)&v16[1] + 8) = v8[1];
    *(_OWORD *)((char *)v16 + 8) = v9;
    *(_OWORD *)((char *)&v16[4] + 8) = 0u;
    *(_OWORD *)((char *)&v16[5] + 8) = 0u;
  }
  int v10 = *(const unsigned __int8 **)(a1 + 16);
  if (v10)
  {
    uuid_copy((unsigned __int8 *)&v16[2] + 8, v10);
    uuid_copy((unsigned __int8 *)&v16[6] + 8, UUID_NULL);
  }
  if (*(unsigned char *)(a1 + 32)) {
    HIDWORD(v17) |= 1u;
  }
  unint64_t v14 = 0;
  int DispositionForDomain = NEHelperTrackerGetDispositionForDomain(v16, __s, &v14, 1);
  if ((unint64_t)a3 | a4 && v14)
  {
    if (a3)
    {
      int v12 = (const char *)NEHelperTrackerContextCopyDomainOwner(v14, v15, 254, 0);
      if (v12) {
        *a3 = strndup(v12, 0xFDuLL);
      }
    }
    if (a4) {
      *(unsigned char *)a4 = NEHelperTrackerContextCanBlockRequest(v14);
    }
  }
  return dword_2129A01B0[DispositionForDomain];
}

BOOL ne_session_manager_is_running()
{
  return get_current_notify_pid() != 0;
}

uint64_t get_current_notify_pid()
{
  if (get_current_notify_pid_sm_token < 0)
  {
    if (globals_init_sess_init != -1) {
      dispatch_once(&globals_init_sess_init, &__block_literal_global_175_109);
    }
    if (!notify_register_dispatch("com.apple.nesessionmanager", &get_current_notify_pid_sm_token, (dispatch_queue_t)g_queue, &__block_literal_global_170)&& notify_get_state(get_current_notify_pid_sm_token, &get_current_notify_pid_current_pid))
    {
      get_current_notify_pid_current_pid = 0;
    }
  }
  return get_current_notify_pid_current_pid;
}

void __get_current_notify_pid_block_invoke(int a1, int token)
{
  get_current_notify_pid_sm_token = token;
  if (notify_get_state(token, &get_current_notify_pid_current_pid))
  {
    get_current_notify_pid_current_pid = 0;
  }
  else if (get_current_notify_pid_current_pid)
  {
    update_all_session_clients();
  }
}

void update_all_session_clients()
{
  for (uint64_t i = g_sessions; i; uint64_t i = *(void *)(i + 48))
    fetch_status(i, 0, 0, 0);
}

void fetch_status(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  uint64_t connection = get_connection(a1);
  if (connection)
  {
    long long v9 = (_xpc_connection_s *)connection;
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    int v11 = *(_DWORD *)(a1 + 32);
    xpc_dictionary_set_int64(v10, "SessionCommandType", 1);
    if (a4) {
      a4 = _Block_copy(a4);
    }
    if (a3) {
      dispatch_retain(a3);
    }
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __fetch_status_block_invoke_2;
    handler[3] = &unk_264195420;
    int v13 = v11;
    handler[4] = a4;
    void handler[5] = a1;
    handler[6] = a2;
    handler[7] = a3;
    xpc_connection_send_message_with_reply(v9, v10, (dispatch_queue_t)g_queue, handler);
    xpc_release(v10);
  }
  else if (a3 && a4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __fetch_status_block_invoke;
    block[3] = &unk_2641953D0;
    void block[4] = a4;
    int v15 = 0;
    dispatch_async(a3, block);
  }
}

uint64_t get_connection(uint64_t a1)
{
  uint64_t result = 0;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v3 = g_sessions;
    if (g_sessions)
    {
      while (v3 != a1)
      {
        uint64_t v3 = *(void *)(v3 + 48);
        if (!v3) {
          return 0;
        }
      }
      if (*(unsigned char *)(a1 + 64)) {
        return 0;
      }
      uint64_t result = *(void *)(a1 + 40);
      if (!result)
      {
        xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
        getpid();
        uint64_t v5 = "com.apple.nesessionmanager";
        if (sandbox_check())
        {
          int v6 = ne_log_obj();
          uint64_t v5 = "com.apple.nesessionmanager.flow-divert-token";
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            xpc_object_t v10 = "com.apple.nesessionmanager.flow-divert-token";
            _os_log_impl(&dword_212970000, v6, OS_LOG_TYPE_INFO, "Falling back to %s", buf, 0xCu);
          }
        }
        mach_service = xpc_connection_create_mach_service(v5, (dispatch_queue_t)g_queue, 2uLL);
        *(void *)(a1 + 40) = mach_service;
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 0x40000000;
        handler[2] = __get_connection_block_invoke;
        handler[3] = &__block_descriptor_tmp_183;
        handler[4] = a1;
        xpc_connection_set_event_handler(mach_service, handler);
        xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
        xpc_dictionary_set_int64(v4, "SessionClientType", 1);
        xpc_dictionary_set_uuid(v4, "SessionIdentifier", (const unsigned __int8 *)a1);
        xpc_dictionary_set_int64(v4, "SessionConfigType", *(int *)(a1 + 16));
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v4);
        xpc_release(v4);
        return *(void *)(a1 + 40);
      }
    }
  }
  return result;
}

uint64_t __fetch_status_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void __fetch_status_block_invoke_2(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8708])
  {
    int64_t int64 = xpc_dictionary_get_int64(a2, "SessionStatus");
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = g_sessions;
      if (g_sessions)
      {
        while (v8 != v7)
        {
          uint64_t v8 = *(void *)(v8 + 48);
          if (!v8) {
            goto LABEL_4;
          }
        }
        if (!*(unsigned char *)(v7 + 64) && int64 != *(_DWORD *)(a1 + 64)) {
          set_status(v7, *(void *)(a1 + 48), int64);
        }
      }
    }
  }
  else
  {
    int64_t int64 = 1;
  }
LABEL_4:
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    int v6 = *(NSObject **)(a1 + 56);
    if (v6)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __fetch_status_block_invoke_3;
      block[3] = &unk_2641953F8;
      void block[4] = v5;
      void block[5] = int64;
      void block[6] = v6;
      dispatch_async(v6, block);
    }
  }
}

void set_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a1 + 32) != a3)
  {
    *(_DWORD *)(a1 + 32) = a3;
    for (uint64_t i = *(void *)(a1 + 24); i; uint64_t i = *(void *)(i + 8))
    {
      if (i != a2) {
        notify_client(i, 1);
      }
    }
  }
}

void __fetch_status_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  BOOL v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

void notify_client(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 24))
  {
    uint64_t v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 40), 1u, memory_order_relaxed);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __notify_client_block_invoke;
      block[3] = &__block_descriptor_tmp_188_117;
      int v5 = a2;
      void block[4] = a1;
      void block[5] = 0;
      dispatch_async(v3, block);
    }
  }
}

void __notify_client_block_invoke(uint64_t a1)
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3002000000;
  uint64_t v8 = __Block_byref_object_copy_;
  long long v9 = __Block_byref_object_dispose_;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  _DWORD v4[2] = __notify_client_block_invoke_186;
  v4[3] = &unk_264195468;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = &v5;
  v4[5] = v2;
  dispatch_sync((dispatch_queue_t)g_queue, v4);
  uint64_t v3 = v6[5];
  if (v3)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
    _Block_release((const void *)v6[5]);
  }
  ne_session_release(*(void *)(a1 + 32));
  _Block_object_dispose(&v5, 8);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void *__notify_client_block_invoke_186(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 40) + 24);
  if (result)
  {
    uint64_t result = _Block_copy(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

void ne_session_release(uint64_t a1)
{
  if (atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 40), 0xFFFFFFFF, memory_order_relaxed) == 1)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ne_session_release_block_invoke;
    block[3] = &__block_descriptor_tmp_8;
    void block[4] = a1;
    dispatch_sync((dispatch_queue_t)g_queue, block);
  }
}

void __ne_session_release_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  if (v2) {
    *(void *)(v2 + 16) = *(void *)(v1 + 16);
  }
  **(void **)(v1 + 16) = v2;
  uint64_t v3 = *(void **)v1;
  if (!*(void *)(*(void *)v1 + 24))
  {
    *((unsigned char *)v3 + 64) = 1;
    xpc_object_t v4 = (_xpc_connection_s *)*((void *)v3 + 5);
    if (v4)
    {
      xpc_connection_cancel(v4);
    }
    else
    {
      uint64_t v5 = *((void *)v3 + 6);
      if (v5) {
        *(void *)(v5 + 56) = *((void *)v3 + 7);
      }
      **((void **)v3 + 7) = v5;
      free(*(void **)v1);
      *(void *)uint64_t v1 = 0;
    }
  }
  ne_session_clear_event_handler(v1, 0);

  free((void *)v1);
}

void ne_session_clear_event_handler(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v3 = *(NSObject **)(a1 + 32);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  if (v3)
  {
    if (v4)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 0x40000000;
      block[2] = __ne_session_clear_event_handler_block_invoke;
      block[3] = &unk_2641953A8;
      char v6 = a2;
      void block[4] = v4;
      void block[5] = v3;
      dispatch_async(v3, block);
    }
    else
    {
      dispatch_release(v3);
    }
  }
}

void __ne_session_clear_event_handler_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  _Block_release(*(const void **)(a1 + 32));
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_release(v2);
}

void __get_connection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = g_sessions;
  if (v2) {
    BOOL v4 = g_sessions == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    while (v3 != v2)
    {
      uint64_t v3 = *(void *)(v3 + 48);
      if (!v3) {
        return;
      }
    }
    if (a2)
    {
      if (MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8720])
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (*(void *)(v7 + 40))
        {
          xpc_connection_cancel(*(xpc_connection_t *)(v7 + 40));
          xpc_release(*(xpc_object_t *)(*(void *)(a1 + 32) + 40));
          *(void *)(*(void *)(a1 + 32) + 40) = 0;
          uint64_t v7 = *(void *)(a1 + 32);
        }
        if (*(void *)(v7 + 24))
        {
          set_status(v7, 0, 1);
        }
        else
        {
          uint64_t v10 = *(void *)(v7 + 48);
          if (v10)
          {
            *(void *)(v10 + 56) = *(void *)(v7 + 56);
            uint64_t v7 = *(void *)(a1 + 32);
            uint64_t v10 = *(void *)(v7 + 48);
          }
          **(void **)(v7 + 56) = v10;
          uint64_t v11 = *(void **)(a1 + 32);
          free(v11);
        }
      }
      else if (MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8708])
      {
        int64_t int64 = xpc_dictionary_get_int64(a2, "SessionNotificationType");
        switch(int64)
        {
          case 3:
            for (uint64_t i = *(void *)(*(void *)(a1 + 32) + 24); i; uint64_t i = *(void *)(i + 8))
              notify_client(i, 3);
            break;
          case 2:
            for (uint64_t j = *(void *)(*(void *)(a1 + 32) + 24); j; uint64_t j = *(void *)(j + 8))
              notify_client(j, 1);
            break;
          case 1:
            uint64_t v9 = *(void *)(a1 + 32);
            fetch_status(v9, 0, 0, 0);
            break;
        }
      }
    }
  }
}

dispatch_queue_t __globals_init_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("ne_session queue", v0);
  g_queue = (uint64_t)result;
  g_sessions = 0;
  return result;
}

uint64_t ne_session_manager_get_pid()
{
  return get_current_notify_pid();
}

uint64_t ne_session_manager_has_active_sessions()
{
  int check = 0;
  int v0 = ne_session_manager_get_info_current_info_token;
  if (ne_session_manager_get_info_current_info_token < 0)
  {
    if (notify_register_check("com.apple.nesessionmanager.info", &ne_session_manager_get_info_current_info_token))
    {
      ne_session_manager_get_info_current_info_token = -1;
      return ne_session_manager_get_info_current_info & 1;
    }
    int v0 = ne_session_manager_get_info_current_info_token;
    if (ne_session_manager_get_info_current_info_token < 0) {
      return ne_session_manager_get_info_current_info & 1;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_manager_get_info_current_info_token, (uint64_t *)&ne_session_manager_get_info_current_info))
  {
    notify_cancel(ne_session_manager_get_info_current_info_token);
    ne_session_manager_get_info_current_info_token = -1;
    ne_session_manager_get_info_current_info = 0;
  }
  return ne_session_manager_get_info_current_info & 1;
}

BOOL ne_session_should_disable_nexus()
{
  int check = 0;
  int v0 = ne_session_should_disable_nexus_disable_nexus_token;
  if (ne_session_should_disable_nexus_disable_nexus_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.disable-nexus", &ne_session_should_disable_nexus_disable_nexus_token))
    {
      ne_session_should_disable_nexus_disable_nexus_token = -1;
      return ne_session_should_disable_nexus_current_state != 0;
    }
    int v0 = ne_session_should_disable_nexus_disable_nexus_token;
    if (ne_session_should_disable_nexus_disable_nexus_token < 0) {
      return ne_session_should_disable_nexus_current_state != 0;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_should_disable_nexus_disable_nexus_token, (uint64_t *)&ne_session_should_disable_nexus_current_state))
  {
    notify_cancel(ne_session_should_disable_nexus_disable_nexus_token);
    ne_session_should_disable_nexus_disable_nexus_token = -1;
    ne_session_should_disable_nexus_current_uint32_t state = 0;
  }
  return ne_session_should_disable_nexus_current_state != 0;
}

BOOL ne_session_disable_restrictions()
{
  int check = 0;
  int v0 = ne_session_disable_restrictions_disable_restrictions_token;
  if (ne_session_disable_restrictions_disable_restrictions_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.disable-restrictions", &ne_session_disable_restrictions_disable_restrictions_token))
    {
      ne_session_disable_restrictions_disable_restrictions_token = -1;
      return ne_session_disable_restrictions_current_state != 0;
    }
    int v0 = ne_session_disable_restrictions_disable_restrictions_token;
    if (ne_session_disable_restrictions_disable_restrictions_token < 0) {
      return ne_session_disable_restrictions_current_state != 0;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_disable_restrictions_disable_restrictions_token, (uint64_t *)&ne_session_disable_restrictions_current_state))
  {
    notify_cancel(ne_session_disable_restrictions_disable_restrictions_token);
    ne_session_disable_restrictions_disable_restrictions_token = -1;
    ne_session_disable_restrictions_current_uint32_t state = 0;
  }
  return ne_session_disable_restrictions_current_state != 0;
}

BOOL ne_session_fallback_advisory()
{
  int check = 0;
  int v0 = ne_session_fallback_advisory_fallback_advisory_token;
  if (ne_session_fallback_advisory_fallback_advisory_token < 0)
  {
    if (notify_register_check("com.apple.symptoms.hasAlternateAdvice", &ne_session_fallback_advisory_fallback_advisory_token))
    {
      ne_session_fallback_advisory_fallback_advisory_token = -1;
      return ne_session_fallback_advisory_current_state != 0;
    }
    int v0 = ne_session_fallback_advisory_fallback_advisory_token;
    if (ne_session_fallback_advisory_fallback_advisory_token < 0) {
      return ne_session_fallback_advisory_current_state != 0;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_fallback_advisory_fallback_advisory_token, (uint64_t *)&ne_session_fallback_advisory_current_state))
  {
    notify_cancel(ne_session_fallback_advisory_fallback_advisory_token);
    ne_session_fallback_advisory_fallback_advisory_token = -1;
    ne_session_fallback_advisory_current_uint32_t state = 0;
  }
  return ne_session_fallback_advisory_current_state != 0;
}

uint64_t ne_session_fallback_default()
{
  int check = 0;
  int v0 = ne_session_fallback_default_fallback_default_token;
  if (ne_session_fallback_default_fallback_default_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.fallback-default", &ne_session_fallback_default_fallback_default_token))
    {
      ne_session_fallback_default_fallback_default_token = -1;
      return ne_session_fallback_default_current_state;
    }
    int v0 = ne_session_fallback_default_fallback_default_token;
    if (ne_session_fallback_default_fallback_default_token < 0) {
      return ne_session_fallback_default_current_state;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_fallback_default_fallback_default_token, (uint64_t *)&ne_session_fallback_default_current_state))
  {
    notify_cancel(ne_session_fallback_default_fallback_default_token);
    ne_session_fallback_default_fallback_default_token = -1;
    ne_session_fallback_default_current_uint32_t state = 0;
  }
  return ne_session_fallback_default_current_state;
}

uint64_t ne_session_use_as_system_vpn()
{
  return 1;
}

unint64_t ne_session_on_demand_configs_present()
{
  return (unint64_t)get_current_config_state() >> 63;
}

uint64_t get_current_config_state()
{
  int check = 0;
  int v0 = get_current_config_state_config_token;
  if (get_current_config_state_config_token < 0)
  {
    if (notify_register_check("com.apple.neconfigurationchanged", &get_current_config_state_config_token))
    {
      get_current_config_state_config_token = -1;
      return get_current_config_state_current_state;
    }
    int v0 = get_current_config_state_config_token;
    if (get_current_config_state_config_token < 0) {
      return get_current_config_state_current_state;
    }
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(get_current_config_state_config_token, (uint64_t *)&get_current_config_state_current_state))
  {
    notify_cancel(get_current_config_state_config_token);
    get_current_config_state_config_token = -1;
    get_current_config_state_current_uint32_t state = 0;
  }
  return get_current_config_state_current_state;
}

unint64_t ne_session_vod_evaluate_connection_present()
{
  return ((unint64_t)get_current_config_state() >> 54) & 1;
}

unint64_t ne_session_app_vpn_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 62) & 1;
}

unint64_t ne_session_always_on_vpn_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 61) & 1;
}

uint64_t ne_session_always_on_vpn_configs_present_at_boot()
{
  if ((get_current_config_state() & 0x2000000000000000) != 0) {
    return 1;
  }
  int v0 = open("/Library/Preferences/com.apple.networkextension.necp.plist", 0);
  if (v0 == -1) {
    return 0;
  }
  int v1 = v0;
  memset(&v9, 0, sizeof(v9));
  if (fstat(v0, &v9)) {
    st_size_t size = 0;
  }
  else {
    st_size_t size = v9.st_size;
  }
  if ((unint64_t)(st_size - 1) <= 0x27FE && (uint64_t v3 = malloc_type_malloc(st_size, 0xB97863F2uLL)) != 0)
  {
    BOOL v4 = v3;
    if (pread(v1, v3, st_size, 0) == st_size && (uint64_t v5 = (void *)xpc_create_from_plist()) != 0)
    {
      char v6 = v5;
      BOOL v7 = xpc_dictionary_get_int64(v5, "drop_all_feature_always_on_vpn") != 0;
      xpc_release(v6);
    }
    else
    {
      BOOL v7 = 0;
    }
    free(v4);
  }
  else
  {
    BOOL v7 = 0;
  }
  close(v1);
  return v7;
}

uint64_t ne_session_is_always_on_vpn_enabled(NSObject *a1, const void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  ne_session_is_always_on_vpn_enabled_enabled = ne_session_always_on_vpn_configs_present_at_boot();
  BOOL v4 = ne_session_is_always_on_vpn_enabled_queue;
  if (ne_session_is_always_on_vpn_enabled_queue != a1
    || ne_session_is_always_on_vpn_enabled_handler != (void)a2)
  {
    if (ne_session_is_always_on_vpn_enabled_notify_token != -1)
    {
      notify_cancel(ne_session_is_always_on_vpn_enabled_notify_token);
      ne_session_is_always_on_vpn_enabled_notify_token = -1;
      BOOL v4 = ne_session_is_always_on_vpn_enabled_queue;
    }
    if (v4)
    {
      dispatch_release(v4);
      ne_session_is_always_on_vpn_enabled_queue = 0;
    }
    if (ne_session_is_always_on_vpn_enabled_handler)
    {
      _Block_release((const void *)ne_session_is_always_on_vpn_enabled_handler);
      ne_session_is_always_on_vpn_enabled_uint64_t handler = 0;
    }
  }
  if (a1)
  {
    if (a2)
    {
      ne_session_is_always_on_vpn_enabled_queue = (uint64_t)a1;
      dispatch_retain(a1);
      ne_session_is_always_on_vpn_enabled_uint64_t handler = (uint64_t)_Block_copy(a2);
      uint32_t v6 = notify_register_dispatch("com.apple.neconfigurationchanged", &ne_session_is_always_on_vpn_enabled_notify_token, (dispatch_queue_t)ne_session_is_always_on_vpn_enabled_queue, &__block_literal_global_140);
      if (v6)
      {
        uint32_t v7 = v6;
        uint64_t v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v10 = 136315394;
          uint64_t v11 = "com.apple.neconfigurationchanged";
          __int16 v12 = 1024;
          uint32_t v13 = v7;
          _os_log_error_impl(&dword_212970000, v8, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications in ne_session_is_always_on_vpn_enabled: %u", (uint8_t *)&v10, 0x12u);
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  return ne_session_is_always_on_vpn_enabled_enabled;
}

void __ne_session_is_always_on_vpn_enabled_block_invoke(uint64_t a1, int a2)
{
  current_config_uint32_t state = get_current_config_state();
  os_unfair_lock_lock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  if (ne_session_is_always_on_vpn_enabled_notify_token != a2
    || ((uint64_t v4 = current_config_state & 0x2000000000000000,
         ne_session_is_always_on_vpn_enabled_enabled != (current_config_state & 0x2000000000000000uLL) >> 61)
      ? (BOOL v5 = ne_session_is_always_on_vpn_enabled_handler == 0)
      : (BOOL v5 = 1),
        v5))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  }
  else
  {
    ne_session_is_always_on_vpn_enabled_enabled = (current_config_state & 0x2000000000000000uLL) >> 61;
    uint32_t v6 = (void (**)(void *, BOOL))_Block_copy((const void *)ne_session_is_always_on_vpn_enabled_handler);
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
    if (v6)
    {
      v6[2](v6, v4 != 0);
      _Block_release(v6);
    }
  }
}

unint64_t ne_session_vpn_include_all_networks_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 55) & 1;
}

unint64_t ne_session_content_filter_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 60) & 1;
}

unint64_t ne_session_dns_proxy_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 59) & 1;
}

unint64_t ne_session_path_controller_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 58) & 1;
}

unint64_t ne_session_dns_settings_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 57) & 1;
}

unint64_t ne_session_local_communication_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 56) & 1;
}

unint64_t ne_session_relay_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 53) & 1;
}

uint64_t ne_session_create(uint64_t a1, int a2)
{
  uint64_t v8 = 0;
  stat v9 = &v8;
  uint64_t v10 = 0x2000000000;
  uint64_t v11 = 0;
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_175_109);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_create_block_invoke;
  block[3] = &unk_264194F40;
  int v7 = a2;
  void block[4] = &v8;
  void block[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  uint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

void *__ne_session_create_block_invoke(uint64_t a1)
{
  uint64_t v2 = g_sessions;
  if (g_sessions)
  {
    while (uuid_compare(*(const unsigned __int8 **)(a1 + 40), (const unsigned __int8 *)v2)
         || *(_DWORD *)(v2 + 16) != *(_DWORD *)(a1 + 48)
         || *(unsigned char *)(v2 + 64))
    {
      uint64_t v2 = *(void *)(v2 + 48);
      if (!v2) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    dispatch_queue_t result = malloc_type_malloc(0x48uLL, 0x10A0040C4150745uLL);
    if (!result) {
      return result;
    }
    uint64_t v2 = (uint64_t)result;
    result[8] = 0;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *(_OWORD *)dispatch_queue_t result = 0u;
    *((_OWORD *)result + 3) = 0u;
    uint64_t v4 = result + 6;
    uuid_copy((unsigned __int8 *)result, *(const unsigned __int8 **)(a1 + 40));
    *(_DWORD *)(v2 + 16) = *(_DWORD *)(a1 + 48);
    *(void *)(v2 + 24) = 0;
    *(_DWORD *)(v2 + 32) = 1;
    uint64_t v5 = g_sessions;
    *uint64_t v4 = g_sessions;
    if (v5) {
      *(void *)(v5 + 56) = v4;
    }
    g_sessions = v2;
    *(void *)(v2 + 56) = &g_sessions;
  }
  dispatch_queue_t result = malloc_type_malloc(0x30uLL, 0x10A0040D517E767uLL);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  uint32_t v6 = *(_OWORD **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *uint32_t v6 = 0u;
  v6[1] = 0u;
  _DWORD v6[2] = 0u;
  **(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
  atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 40), 1u, memory_order_relaxed);
  uint64_t v9 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)(v2 + 24);
  uint64_t v7 = v9;
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 8) = v9;
  if (v9) {
    *(void *)(v7 + 16) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 8;
  }
  *uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 16) = v8;
  return result;
}

uint64_t ne_session_retain(uint64_t result)
{
  return result;
}

void ne_session_set_event_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_set_event_handler_block_invoke;
  block[3] = &unk_264194F88;
  void block[4] = a3;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_set_event_handler_block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  if (v1)
  {
    ne_session_clear_event_handler(a1[5], 0);
    uint64_t v3 = (void *)a1[4];
    if (v3) {
      uint64_t v3 = _Block_copy(v3);
    }
    *(void *)(v1 + 24) = v3;
    uint64_t v4 = a1[6];
    *(void *)(v1 + 32) = v4;
    if (v4) {
      dispatch_retain(v4);
    }
  }
  if (get_current_notify_pid())
  {
    update_all_session_clients();
  }
}

void ne_session_cancel(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_cancel_block_invoke;
  block[3] = &__block_descriptor_tmp_10;
  void block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_cancel_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    ne_session_clear_event_handler(v1, 1);
  }
}

void ne_session_get_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_status_block_invoke;
  block[3] = &unk_264195020;
  void block[5] = a1;
  void block[6] = a2;
  void block[4] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_get_status_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(a1 + 48));
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 32));
  atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 40) + 40), 1u, memory_order_relaxed);
  uint64_t v4 = *v2;
  uint64_t v5 = g_sessions;
  if (*v2) {
    BOOL v6 = g_sessions == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    goto LABEL_9;
  }
  while (v5 != v4)
  {
    uint64_t v5 = *(void *)(v5 + 48);
    if (!v5) {
      goto LABEL_9;
    }
  }
  if (*(unsigned char *)(v4 + 64) || !*(void *)(v4 + 40))
  {
LABEL_9:
    if (get_current_notify_pid())
    {
      uint64_t v7 = *v2;
      uint64_t v8 = *(NSObject **)(a1 + 48);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 0x40000000;
      void v13[2] = __ne_session_get_status_block_invoke_2;
      v13[3] = &unk_264194FD0;
      v13[4] = v3;
      void v13[5] = v8;
      void v13[6] = *(void *)(a1 + 40);
      fetch_status(v7, (uint64_t)v2, v8, v13);
      return;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = *(_DWORD *)(v4 + 32);
  }
  uint64_t v10 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_status_block_invoke_3;
  block[3] = &unk_264194FF8;
  int v12 = v9;
  void block[4] = v3;
  void block[5] = v10;
  void block[6] = *(void *)(a1 + 40);
  dispatch_async(v10, block);
}

void __ne_session_get_status_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_get_status_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

const char *ne_session_info_type_to_string(int a1)
{
  if ((a1 - 1) > 4) {
    return "unknown";
  }
  else {
    return off_264195878[a1 - 1];
  }
}

void ne_session_local_communication_send_info(uint64_t a1, int a2, uint64_t a3, dispatch_object_t object, const void *a5)
{
  dispatch_retain(object);
  uint64_t v10 = _Block_copy(a5);
  atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 40), 1u, memory_order_relaxed);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_local_communication_send_info_block_invoke;
  block[3] = &unk_2641950E8;
  void block[4] = v10;
  void block[5] = a1;
  int v12 = a2;
  void block[6] = object;
  void block[7] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_local_communication_send_info_block_invoke(uint64_t a1)
{
  if (!get_current_notify_pid())
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 0x40000000;
    v10[2] = __ne_session_local_communication_send_info_block_invoke_2_29;
    v10[3] = &unk_2641950C0;
    uint64_t v7 = *(void *)(a1 + 40);
    BOOL v6 = *(NSObject **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    void v10[5] = v6;
    v10[6] = v7;
    uint64_t v8 = v10;
LABEL_8:
    dispatch_async(v6, v8);
    return;
  }
  uint64_t connection = get_connection(**(void **)(a1 + 40));
  if (!connection)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ne_session_local_communication_send_info_block_invoke_2;
    block[3] = &unk_264195048;
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v6 = *(NSObject **)(a1 + 48);
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v6;
    void block[6] = v9;
    uint64_t v8 = block;
    goto LABEL_8;
  }
  uint64_t v3 = (_xpc_connection_s *)connection;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "SessionCommandType", 7);
  xpc_dictionary_set_int64(v4, "SessionInfoType", *(int *)(a1 + 64));
  uint64_t v5 = *(void **)(a1 + 56);
  if (v5) {
    xpc_dictionary_set_value(v4, "SessionAppPushCallInfo", v5);
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __ne_session_local_communication_send_info_block_invoke_3;
  handler[3] = &unk_264195098;
  int v13 = *(_DWORD *)(a1 + 64);
  handler[4] = *(void *)(a1 + 32);
  int8x16_t v12 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  xpc_connection_send_message_with_reply(v3, v4, (dispatch_queue_t)g_queue, handler);
  xpc_release(v4);
}

void __ne_session_local_communication_send_info_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_local_communication_send_info_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2 && (uint64_t v4 = MEMORY[0x2166885F0](a2), v5 = MEMORY[0x263EF8708], v4 == MEMORY[0x263EF8708]))
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "SessionAppPushSendMessageResult");
    uint64_t v7 = value;
    if (!value) {
      goto LABEL_6;
    }
    if (MEMORY[0x2166885F0](value) == v5)
    {
      xpc_retain(v7);
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(_DWORD *)(a1 + 56);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
      *(_DWORD *)buf = 67109378;
      int v13 = v9;
      __int16 v14 = 2080;
      int v15 = string;
      _os_log_error_impl(&dword_212970000, v6, OS_LOG_TYPE_ERROR, "Failed to send info with type %d: %s", buf, 0x12u);
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  v11[2] = __ne_session_local_communication_send_info_block_invoke_25;
  v11[3] = &unk_264195070;
  v11[4] = *(void *)(a1 + 32);
  void v11[5] = v7;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v11);
}

void __ne_session_local_communication_send_info_block_invoke_2_29(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_local_communication_send_info_block_invoke_25(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);

  ne_session_release(v3);
}

uint64_t ne_session_map_interface_to_provider_uuid(const char *a1, uuid_t uu)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uuid_clear(uu);
  if (a1)
  {
    getpid();
    uint64_t v4 = "com.apple.nesessionmanager";
    if (sandbox_check())
    {
      uint64_t v5 = ne_log_obj();
      uint64_t v4 = "com.apple.nesessionmanager.flow-divert-token";
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v17 = "com.apple.nesessionmanager.flow-divert-token";
        _os_log_impl(&dword_212970000, v5, OS_LOG_TYPE_INFO, "Falling back to %s", buf, 0xCu);
      }
    }
    mach_service = xpc_connection_create_mach_service(v4, (dispatch_queue_t)g_queue, 2uLL);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_37);
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_int64(empty, "SessionClientType", 3);
    xpc_dictionary_set_string(empty, "InterfaceMapInfo", a1);
    xpc_connection_resume(mach_service);
    xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(mach_service, empty);
    if (!v8)
    {
      uint64_t v11 = 0;
LABEL_19:
      xpc_release(empty);
      xpc_connection_cancel(mach_service);
      xpc_release(mach_service);
      return v11;
    }
    int v9 = v8;
    if (MEMORY[0x2166885F0](v8) == MEMORY[0x263EF8708])
    {
      uuid = xpc_dictionary_get_uuid(v9, "MachOUUID");
      if (uuid)
      {
        *(_OWORD *)uu = *(_OWORD *)uuid;
        int v13 = ne_log_obj();
        uint64_t v11 = 1;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          long long v17 = a1;
          __int16 v18 = 1040;
          int v19 = 16;
          __int16 v20 = 2096;
          unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v21 = uu;
          _os_log_impl(&dword_212970000, v13, OS_LOG_TYPE_INFO, "Mapped interface %s to provider UUID: %{uuid_t}.16P", buf, 0x1Cu);
        }
        goto LABEL_18;
      }
      __int16 v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_212970000, v14, OS_LOG_TYPE_DEBUG, "Error mapping interface to provider UUID: malformed response from nesessionmanager.", buf, 2u);
      }
    }
    else if (MEMORY[0x2166885F0](v9) == MEMORY[0x263EF8720])
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_212970000, v10, OS_LOG_TYPE_ERROR, "Error sending a map interface message to nesessionmanager.", buf, 2u);
      }
    }
    uint64_t v11 = 0;
LABEL_18:
    xpc_release(v9);
    goto LABEL_19;
  }
  return 0;
}

void __ne_session_map_interface_to_provider_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8720])
  {
    uint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_error_impl(&dword_212970000, v2, OS_LOG_TYPE_ERROR, "Error sending a map interface message to nesessionmanager.", v3, 2u);
    }
  }
}

uint64_t ne_session_set_device_communication_exception(BOOL a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  getpid();
  uint64_t v2 = "com.apple.nesessionmanager";
  if (sandbox_check())
  {
    uint64_t v3 = ne_log_obj();
    uint64_t v2 = "com.apple.nesessionmanager.flow-divert-token";
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "ne_session_set_device_communication_exception";
      __int16 v21 = 2080;
      uint64_t v22 = "com.apple.nesessionmanager.flow-divert-token";
      _os_log_impl(&dword_212970000, v3, OS_LOG_TYPE_INFO, "%s: Falling back to %s", buf, 0x16u);
    }
  }
  mach_service = xpc_connection_create_mach_service(v2, (dispatch_queue_t)g_queue, 2uLL);
  if (mach_service)
  {
    uint64_t v5 = mach_service;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __ne_session_set_device_communication_exception_block_invoke;
    handler[3] = &__block_descriptor_tmp_41;
    handler[4] = v2;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_int64(empty, "SessionClientType", 4);
    xpc_dictionary_set_BOOL(empty, "DeviceCommunicationExceptionEnable", a1);
    xpc_connection_resume(v5);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, empty);
    if (!v7)
    {
      uint64_t v11 = 0;
LABEL_25:
      xpc_release(empty);
      xpc_release(v5);
      return v11;
    }
    xpc_object_t v8 = v7;
    if (MEMORY[0x2166885F0](v7) == MEMORY[0x263EF8708])
    {
      BOOL v12 = xpc_dictionary_get_BOOL(v8, "DeviceCommunicationExceptionResult");
      int v13 = ne_log_obj();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          int v15 = "disabled";
          if (a1) {
            int v15 = "enabled";
          }
          *(_DWORD *)buf = 136315138;
          __int16 v20 = v15;
          uint64_t v11 = 1;
          _os_log_impl(&dword_212970000, v13, OS_LOG_TYPE_INFO, "DeviceCommunicationException succeeded: %s", buf, 0xCu);
        }
        else
        {
          uint64_t v11 = 1;
        }
        goto LABEL_24;
      }
      if (v14)
      {
        uint64_t v16 = "disabled";
        if (a1) {
          uint64_t v16 = "enabled";
        }
        *(_DWORD *)buf = 136315138;
        __int16 v20 = v16;
        _os_log_impl(&dword_212970000, v13, OS_LOG_TYPE_INFO, "DeviceCommunicationException failed: %s", buf, 0xCu);
      }
    }
    else if (MEMORY[0x2166885F0](v8) == MEMORY[0x263EF8720])
    {
      int v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v20 = v2;
        _os_log_error_impl(&dword_212970000, v9, OS_LOG_TYPE_ERROR, "Error sending a DeviceCommunicationException message to %s", buf, 0xCu);
      }
    }
    uint64_t v11 = 0;
LABEL_24:
    xpc_release(v8);
    goto LABEL_25;
  }
  uint64_t v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v20 = "ne_session_set_device_communication_exception";
    __int16 v21 = 2080;
    uint64_t v22 = v2;
    _os_log_error_impl(&dword_212970000, v10, OS_LOG_TYPE_ERROR, "%s: Error failed to create connection to %s", buf, 0x16u);
  }
  return 0;
}

void __ne_session_set_device_communication_exception_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a2 && MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8720])
  {
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315138;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_212970000, v3, OS_LOG_TYPE_ERROR, "XPC Event - Error sending a DeviceCommunicationException message to %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

void ne_session_get_info(uint64_t a1, int a2, dispatch_object_t object, const void *a4)
{
}

void ne_session_get_info_with_parameters(uint64_t a1, int a2, uint64_t a3, char a4, dispatch_object_t object, const void *a6)
{
  dispatch_retain(object);
  BOOL v12 = _Block_copy(a6);
  atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 40), 1u, memory_order_relaxed);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_info_with_parameters_block_invoke;
  block[3] = &unk_264195550;
  char v15 = a4;
  void block[4] = v12;
  void block[5] = a1;
  int v14 = a2;
  void block[6] = object;
  void block[7] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_get_info_with_parameters_block_invoke(uint64_t a1)
{
  if (!get_current_notify_pid() && !*(unsigned char *)(a1 + 68))
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 0x40000000;
    v10[2] = __ne_session_get_info_with_parameters_block_invoke_2_194;
    v10[3] = &unk_264195528;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v6 = *(NSObject **)(a1 + 48);
    v10[4] = *(void *)(a1 + 32);
    void v10[5] = v6;
    v10[6] = v9;
    xpc_object_t v8 = v10;
    goto LABEL_9;
  }
  uint64_t connection = get_connection(**(void **)(a1 + 40));
  if (!connection)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 0x40000000;
    v14[2] = __ne_session_get_info_with_parameters_block_invoke_2;
    v14[3] = &unk_2641954B0;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v6 = *(NSObject **)(a1 + 48);
    v14[4] = *(void *)(a1 + 32);
    v14[5] = v6;
    v14[6] = v7;
    xpc_object_t v8 = v14;
LABEL_9:
    dispatch_async(v6, v8);
    return;
  }
  uint64_t v3 = (_xpc_connection_s *)connection;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "SessionCommandType", 6);
  xpc_dictionary_set_int64(v4, "SessionInfoType", *(int *)(a1 + 64));
  int v5 = *(void **)(a1 + 56);
  if (v5) {
    xpc_dictionary_set_value(v4, "SessionOptions", v5);
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __ne_session_get_info_with_parameters_block_invoke_3;
  handler[3] = &unk_264195500;
  int v13 = *(_DWORD *)(a1 + 64);
  handler[4] = *(void *)(a1 + 32);
  int8x16_t v12 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  xpc_connection_send_message_with_reply(v3, v4, (dispatch_queue_t)g_queue, handler);
  xpc_release(v4);
}

void __ne_session_get_info_with_parameters_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_get_info_with_parameters_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a2 && (uint64_t v4 = MEMORY[0x2166885F0](a2), v5 = MEMORY[0x263EF8708], v4 == MEMORY[0x263EF8708]))
  {
    xpc_object_t value = xpc_dictionary_get_value(a2, "SessionInfo");
    uint64_t v7 = value;
    if (!value) {
      goto LABEL_6;
    }
    if (MEMORY[0x2166885F0](value) == v5)
    {
      xpc_retain(v7);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(_DWORD *)(a1 + 56);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
      *(_DWORD *)buf = 67109378;
      int v13 = v9;
      __int16 v14 = 2080;
      char v15 = string;
      _os_log_error_impl(&dword_212970000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch info with type %d: %s", buf, 0x12u);
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  v11[2] = __ne_session_get_info_with_parameters_block_invoke_191;
  v11[3] = &unk_2641954D8;
  v11[4] = *(void *)(a1 + 32);
  void v11[5] = v7;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v11);
}

void __ne_session_get_info_with_parameters_block_invoke_2_194(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_get_info_with_parameters_block_invoke_191(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    xpc_release(v2);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 56);

  ne_session_release(v3);
}

void ne_session_get_info2(uint64_t a1, int a2, char a3, dispatch_object_t object, const void *a5)
{
}

void ne_session_send_barrier(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_send_barrier_block_invoke;
  block[3] = &unk_264195150;
  void block[4] = &v6;
  void block[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  if (v7[3])
  {
    uint64_t v1 = dispatch_semaphore_create(0);
    dispatch_time_t v2 = dispatch_time(0, 1000000000);
    dispatch_retain(v1);
    uint64_t v3 = (_xpc_connection_s *)v7[3];
    barrier[0] = MEMORY[0x263EF8330];
    barrier[1] = 0x40000000;
    barrier[2] = __ne_session_send_barrier_block_invoke_2;
    barrier[3] = &__block_descriptor_tmp_47;
    barrier[4] = v1;
    xpc_connection_send_barrier(v3, barrier);
    dispatch_semaphore_wait(v1, v2);
    dispatch_release(v1);
    xpc_release((xpc_object_t)v7[3]);
  }
  _Block_object_dispose(&v6, 8);
}

xpc_object_t __ne_session_send_barrier_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = get_connection(**(void **)(a1 + 40));
  xpc_object_t result = *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    return xpc_retain(result);
  }
  return result;
}

void __ne_session_send_barrier_block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_time_t v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

void ne_session_start_on_behalf_of(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_start_on_behalf_of_block_invoke;
  block[3] = &__block_descriptor_tmp_54;
  int v8 = a3;
  int v9 = a4;
  int v10 = a6;
  int v11 = a5;
  int v12 = a7;
  void block[4] = a1;
  void block[5] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_start_on_behalf_of_block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = *(uint64_t **)(a1 + 32);
  uint64_t connection = get_connection(*v2);
  if (connection)
  {
    uint64_t v4 = (_xpc_connection_s *)connection;
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "SessionCommandType", 2);
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_int64(v5, "SessionGroupID", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_int64(v5, "SessionUserID", *(unsigned int *)(a1 + 60));
    xpc_dictionary_set_int64(v5, "SessionPID", *(int *)(a1 + 64));
    uint64_t v6 = *(void **)(a1 + 40);
    if (v6) {
      xpc_dictionary_set_value(v5, "SessionOptions", v6);
    }
    xpc_connection_send_message(v4, v5);
    xpc_release(v5);
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = *v2;

  set_status(v8, 0, v7);
}

void ne_session_start_with_options(uint64_t a1, uint64_t a2)
{
  int v4 = *MEMORY[0x263EF87F0];
  mach_port_name_t v5 = audit_session_self();
  uid_t v6 = geteuid();
  gid_t v7 = getegid();
  pid_t v8 = getpid();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_start_on_behalf_of_block_invoke;
  block[3] = &__block_descriptor_tmp_54;
  int v10 = v4;
  mach_port_name_t v11 = v5;
  gid_t v12 = v7;
  uid_t v13 = v6;
  pid_t v14 = v8;
  void block[4] = a1;
  void block[5] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void ne_session_start(uint64_t a1)
{
}

void ne_session_stop(uint64_t a1)
{
  v1[0] = MEMORY[0x263EF8330];
  v1[1] = 0x40000000;
  v1[2] = __ne_session_stop_with_reason_block_invoke;
  v1[3] = &__block_descriptor_tmp_198_174;
  v1[4] = a1;
  int v2 = 1;
  dispatch_sync((dispatch_queue_t)g_queue, v1);
}

void __ne_session_stop_with_reason_block_invoke(uint64_t a1)
{
  int v2 = *(uint64_t **)(a1 + 32);
  if (get_current_notify_pid())
  {
    uint64_t connection = get_connection(*v2);
    if (connection)
    {
      int v4 = (_xpc_connection_s *)connection;
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v5, "SessionCommandType", 3);
      xpc_dictionary_set_int64(v5, "SessionStopReason", *(int *)(a1 + 40));
      xpc_connection_send_message(v4, v5);
      xpc_release(v5);
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *v2;
    set_status(v7, 0, v6);
  }
}

void ne_session_get_configuration_id(const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a1, uuid_t dst)
{
}

void ne_session_establish_ipc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __ne_session_establish_ipc_block_invoke;
  block[3] = &unk_264195230;
  void block[4] = a3;
  void block[5] = a1;
  void block[6] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_establish_ipc_block_invoke(uint64_t a1)
{
  uint64_t connection = (_xpc_connection_s *)get_connection(**(void **)(a1 + 40));
  uint64_t v3 = _Block_copy(*(const void **)(a1 + 32));
  dispatch_retain(*(dispatch_object_t *)(a1 + 48));
  atomic_fetch_add_explicit((atomic_uint *volatile)(*(void *)(a1 + 40) + 40), 1u, memory_order_relaxed);
  if (connection)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "SessionCommandType", 4);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    _DWORD v6[2] = __ne_session_establish_ipc_block_invoke_3;
    v6[3] = &unk_264195208;
    v6[4] = v3;
    int8x16_t v7 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    xpc_connection_send_message_with_reply(connection, v4, (dispatch_queue_t)g_queue, v6);
    xpc_release(v4);
  }
  else
  {
    xpc_object_t v5 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ne_session_establish_ipc_block_invoke_2;
    block[3] = &unk_2641951B8;
    void block[4] = v3;
    void block[5] = v5;
    void block[6] = *(void *)(a1 + 40);
    dispatch_async(v5, block);
  }
}

void __ne_session_establish_ipc_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);

  ne_session_release(v2);
}

void __ne_session_establish_ipc_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    if (MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8708])
    {
      xpc_object_t value = xpc_dictionary_get_value(v2, "SessionPrimaryPluginEndpoint");
      uint64_t v2 = value;
      if (!value) {
        goto LABEL_4;
      }
      if (MEMORY[0x2166885F0](value) == MEMORY[0x263EF8718])
      {
        xpc_retain(v2);
        goto LABEL_4;
      }
    }
    uint64_t v2 = 0;
  }
LABEL_4:
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = __ne_session_establish_ipc_block_invoke_4;
  v5[3] = &unk_2641951E0;
  v5[4] = *(void *)(a1 + 32);
  void v5[5] = v2;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v5);
}

void __ne_session_establish_ipc_block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_212970000, v2, OS_LOG_TYPE_DEBUG, "Establish IPC returning primary = %p", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3) {
    xpc_release(v3);
  }
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  ne_session_release(*(void *)(a1 + 56));
}

uint64_t ne_session_add_necp_drop_dest_from_path(const char *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v20 = 0;
  memset(v19, 0, sizeof(v19));
  size_t v18 = 324;
  if (sysctlbyname("net.necp.drop_dest_level", 0, &v18, 0, 0))
  {
    uint64_t v2 = *__error();
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = strerror(v2);
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v4;
      int v5 = "%s: get len sysctlbyname(net.necp.drop_dest_level) failed %s";
LABEL_7:
      _os_log_error_impl(&dword_212970000, v3, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&buf, 0x16u);
    }
  }
  else if (sysctlbyname("net.necp.drop_dest_level", v19, &v18, 0, 0))
  {
    uint64_t v2 = *__error();
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = strerror(v2);
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v6;
      int v5 = "%s: get sysctlbyname(net.necp.drop_dest_level) failed %s";
      goto LABEL_7;
    }
  }
  else
  {
    int v7 = open(a1, 0);
    if (v7 == -1)
    {
      uint64_t v2 = *__error();
      pid_t v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        char v15 = strerror(v2);
        buf.st_dev = 136315650;
        *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)a1;
        HIWORD(buf.st_gid) = 2080;
        *(void *)&buf.st_rdev = v15;
        _os_log_error_impl(&dword_212970000, v14, OS_LOG_TYPE_ERROR, "%s: open(%s) failed %s", (uint8_t *)&buf, 0x20u);
      }
    }
    else
    {
      int v8 = v7;
      memset(&buf, 0, sizeof(buf));
      if (fstat(v7, &buf)) {
        st_size_t size = 0;
      }
      else {
        st_size_t size = buf.st_size;
      }
      if ((unint64_t)(st_size - 1) > 0x27FE)
      {
        if (st_size <= 0) {
          uint64_t v2 = 0;
        }
        else {
          uint64_t v2 = 27;
        }
      }
      else
      {
        int v10 = malloc_type_malloc(st_size, 0x936A0A78uLL);
        if (v10)
        {
          mach_port_name_t v11 = v10;
          if (pread(v8, v10, st_size, 0) == st_size)
          {
            uint64_t v12 = xpc_create_from_plist();
            if (v12)
            {
              uid_t v13 = (void *)v12;
              if (MEMORY[0x2166885F0]() == MEMORY[0x263EF86D8]) {
                uint64_t v2 = ne_session_parse_necp_drop_dest_array(v13, (uint64_t)v19);
              }
              else {
                uint64_t v2 = 22;
              }
              xpc_release(v13);
            }
            else
            {
              uint64_t v2 = 22;
            }
          }
          else
          {
            uint64_t v2 = 0;
          }
          free(v11);
        }
        else
        {
          uint64_t v2 = 55;
        }
      }
      close(v8);
    }
    if (!v2)
    {
      if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, v19, 0x144uLL)) {
        return 0;
      }
      uint64_t v2 = *__error();
      uint64_t v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = strerror(v2);
        buf.st_dev = 136315394;
        *(void *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v16;
        int v5 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
        goto LABEL_7;
      }
    }
  }
  return v2;
}

uint64_t ne_session_parse_necp_drop_dest_array(void *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (xpc_array_get_count(a1))
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v9 = 0x2000000000;
    char v10 = 1;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 0x40000000;
    _DWORD v7[2] = __ne_session_parse_necp_drop_dest_array_block_invoke;
    v7[3] = &unk_264195598;
    v7[4] = &buf;
    v7[5] = a2;
    xpc_array_apply(a1, v7);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 22;
    }
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    int v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array";
      _os_log_error_impl(&dword_212970000, v5, OS_LOG_TYPE_ERROR, "%s: empty array", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  return v4;
}

BOOL __ne_session_parse_necp_drop_dest_array_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  memset(v35, 0, 40);
  if (**(_DWORD **)(a1 + 40) == 8)
  {
    uint64_t v3 = ne_log_obj();
    BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (result)
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array_block_invoke";
      _os_log_error_impl(&dword_212970000, v3, OS_LOG_TYPE_ERROR, "%s: too many entries", (uint8_t *)&buf, 0xCu);
      return 0;
    }
    return result;
  }
  if (!a3 || MEMORY[0x2166885F0](a3) != MEMORY[0x263EF8708])
  {
    int v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v61 = 136315138;
      long long v62 = "ne_parse_necp_drop_dest_dictionary";
      _os_log_error_impl(&dword_212970000, v7, OS_LOG_TYPE_ERROR, "%s: item is not a dictionary", v61, 0xCu);
    }
    goto LABEL_47;
  }
  uint64_t v48 = 0;
  int v49 = &v48;
  uint64_t v50 = 0x2000000000;
  int v51 = -1;
  uint64_t v44 = 0;
  BOOL v45 = &v44;
  uint64_t v46 = 0x2000000000;
  uint64_t v47 = 0;
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2000000000;
  int v43 = -1;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2000000000;
  char v39 = 1;
  *(void *)&long long buf = MEMORY[0x263EF8330];
  *((void *)&buf + 1) = 0x40000000;
  BOOL v54 = __ne_parse_necp_drop_dest_dictionary_block_invoke;
  long long v55 = &unk_2641955C0;
  long long v59 = &v36;
  long long v60 = a3;
  long long v56 = &v48;
  __int16 v57 = &v44;
  long long v58 = &v40;
  xpc_dictionary_apply(a3, &buf);
  if (!*((unsigned char *)v37 + 24)) {
    goto LABEL_46;
  }
  unsigned int v8 = *((_DWORD *)v49 + 6);
  uint64_t v9 = (const char *)v45[3];
  int v10 = *((_DWORD *)v41 + 6);
  *(_OWORD *)unsigned int v52 = 0uLL;
  *(void *)&v52[21] = 0;
  *(void *)&v52[16] = 0;
  if (v9)
  {
    if (v8 > 0xB || ((1 << v8) & 0xC1A) == 0)
    {
      int v24 = ne_log_obj();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      *(_DWORD *)long long v61 = 136315394;
      long long v62 = "ne_parse_necp_drop_dest_entry";
      __int16 v63 = 1024;
      LODWORD(v64) = v8;
      char v15 = "%s: bad priority level %d";
LABEL_35:
      uint64_t v16 = v24;
      uint32_t v17 = 18;
      goto LABEL_36;
    }
    int v11 = inet_pton(30, v9, &v52[9]);
    if (v11 == 1)
    {
      __int16 v19 = 7708;
    }
    else
    {
      if (v11 == -1)
      {
        uint64_t v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uid_t v13 = __error();
          pid_t v14 = strerror(*v13);
          *(_DWORD *)long long v61 = 136315650;
          long long v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 2080;
          int v64 = v9;
          __int16 v65 = 2080;
          uint64_t v66 = v14;
          char v15 = "%s: inet_pton(AF_INET6, %s) failed %s";
          uint64_t v16 = v12;
          uint32_t v17 = 32;
LABEL_36:
          _os_log_error_impl(&dword_212970000, v16, OS_LOG_TYPE_ERROR, v15, v61, v17);
          goto LABEL_46;
        }
        goto LABEL_46;
      }
      int v20 = inet_pton(2, v9, &v52[5]);
      if (v20 != 1)
      {
        if (v20 != -1)
        {
          size_t v31 = ne_log_obj();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)long long v61 = 136315394;
          long long v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 2080;
          int v64 = v9;
          char v15 = "%s: bad address %s";
          uint64_t v16 = v31;
          uint32_t v17 = 22;
          goto LABEL_36;
        }
        __int16 v21 = ne_log_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = __error();
          uint64_t v23 = strerror(*v22);
          *(_DWORD *)long long v61 = 136315650;
          long long v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 2080;
          int v64 = v9;
          __int16 v65 = 2080;
          uint64_t v66 = v23;
          _os_log_error_impl(&dword_212970000, v21, OS_LOG_TYPE_ERROR, "%s: inet_pton(AF_INET, %s) failed %s", v61, 0x20u);
        }
LABEL_27:
        v52[0] = v10;
        if ((v10 - 129) <= 0xFFFFFF7F && v52[2] == 30)
        {
          int v24 = ne_log_obj();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)long long v61 = 136315394;
          long long v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 1024;
          LODWORD(v64) = v52[0];
          char v15 = "%s: bad IPv6 prefix %d";
          goto LABEL_35;
        }
        if ((v10 - 33) <= 0xFFFFFFDF && v52[2] == 2)
        {
          int v24 = ne_log_obj();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            goto LABEL_46;
          }
          *(_DWORD *)long long v61 = 136315394;
          long long v62 = "ne_parse_necp_drop_dest_entry";
          __int16 v63 = 1024;
          LODWORD(v64) = v52[0];
          char v15 = "%s: bad IPv4 prefix %d";
          goto LABEL_35;
        }
        LODWORD(v35[0]) = v8;
        *(_OWORD *)((char *)v35 + 8) = *(_OWORD *)v52;
        *(_OWORD *)((char *)&v35[1] + 5) = *(_OWORD *)&v52[13];
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
        uint8_t v25 = *(unsigned int **)(a1 + 40);
        unint64_t v26 = *v25;
        if (v26)
        {
          uint64_t v27 = 0;
          int v28 = BYTE8(v35[0]);
          size_t v29 = (unsigned __int8 *)v25 + 13;
          BOOL v30 = 1;
          do
          {
            if (*(_DWORD *)(v29 - 9) == v8
              && *(v29 - 1) == v28
              && !memcmp(v29, (const void *)((unint64_t)v35 | 9), *v29))
            {
              break;
            }
            BOOL v30 = ++v27 < v26;
            v29 += 40;
          }
          while (v26 != v27);
          if (v30) {
            return 1;
          }
        }
        else
        {
          LODWORD(v26) = 0;
        }
        int v33 = &v25[10 * v26];
        long long v34 = v35[1];
        *(_OWORD *)(v33 + 1) = v35[0];
        *(_OWORD *)(v33 + 5) = v34;
        *(void *)(v33 + 9) = *(void *)&v35[2];
        ++**(_DWORD **)(a1 + 40);
        return 1;
      }
      __int16 v19 = 528;
    }
    *(_WORD *)&v52[1] = v19;
    goto LABEL_27;
  }
  size_t v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long v61 = 136315138;
    long long v62 = "ne_parse_necp_drop_dest_entry";
    char v15 = "%s: address_str is NULL";
    uint64_t v16 = v18;
    uint32_t v17 = 12;
    goto LABEL_36;
  }
LABEL_46:
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
LABEL_47:
  int v32 = ne_log_obj();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array_block_invoke";
    _os_log_error_impl(&dword_212970000, v32, OS_LOG_TYPE_ERROR, "%s: not valid", (uint8_t *)&buf, 0xCu);
  }
  BOOL result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __ne_parse_necp_drop_dest_dictionary_block_invoke(uint64_t a1, char *__s1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!strcmp(__s1, "Level"))
  {
    xpc_object_t value = (char *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 64), "Level");
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = ne_session_get_necp_level_from_xpc_value(value);
    return 1;
  }
  if (!strcmp(__s1, "Address"))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 64), "Address");
    return 1;
  }
  if (!strcmp(__s1, "Prefix"))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 64), "Prefix");
    return 1;
  }
  uint64_t v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    unsigned int v8 = "ne_parse_necp_drop_dest_dictionary_block_invoke";
    __int16 v9 = 2080;
    int v10 = __s1;
    _os_log_error_impl(&dword_212970000, v4, OS_LOG_TYPE_ERROR, "%s: unexpected key %s", (uint8_t *)&v7, 0x16u);
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  return result;
}

char *ne_session_get_necp_level_from_xpc_value(char *result)
{
  if (result)
  {
    uint64_t v1 = result;
    string_ptr = (char *)xpc_string_get_string_ptr(result);
    if (!string_ptr)
    {
      unint64_t value = xpc_int64_get_value(v1);
      if (value > 0xA) {
        return 0;
      }
      string_ptr = ne_necp_legacy_level_to_string_mapping[value];
    }
    uint64_t v4 = &ne_necp_policy_string_to_level_mapping;
    uint64_t result = "Unknown";
    while (strcasecmp(result, string_ptr))
    {
      int v5 = v4[2];
      v4 += 2;
      uint64_t result = v5;
      if (!v5) {
        return result;
      }
    }
    return (char *)*((unsigned int *)v4 + 2);
  }
  return result;
}

uint64_t ne_session_add_necp_drop_dest_from_dest_list(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  int v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
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
  if (!a1
    || MEMORY[0x2166885F0](a1, a2, a3, a4, a5, a6, a7, a8, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1), v19, *((void *)&v19 + 1), v20, *((void *)&v20 + 1), v21, *((void *)&v21 + 1), v22,
         *((void *)&v22 + 1),
         v23,
         *((void *)&v23 + 1),
         v24,
         *((void *)&v24 + 1),
         v25,
         *((void *)&v25 + 1),
         v26,
         *((void *)&v26 + 1),
         v27,
         *((void *)&v27 + 1),
         v28,
         *((void *)&v28 + 1),
         v29,
         *((void *)&v29 + 1),
         v30,
         *((void *)&v30 + 1),
         v31,
         *((void *)&v31 + 1),
         v32,
         *((void *)&v32 + 1),
         v33) != MEMORY[0x263EF86D8])
  {
    uint64_t v9 = 22;
LABEL_4:
    int v10 = ne_log_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      return v9;
    }
    char v15 = __error();
    uint64_t v16 = strerror(*v15);
    *(_DWORD *)long long buf = 136315394;
    char v39 = "ne_session_add_necp_drop_dest_from_dest_list";
    __int16 v40 = 2080;
    int v41 = v16;
    pid_t v14 = "%s: failed %s";
LABEL_11:
    _os_log_error_impl(&dword_212970000, v10, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
    return v9;
  }
  uint64_t v9 = ne_session_parse_necp_drop_dest_array(a1, (uint64_t)&v17);
  if (v9) {
    goto LABEL_4;
  }
  if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, &v17, 0x144uLL)) {
    return 0;
  }
  uint64_t v9 = *__error();
  int v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = __error();
    uid_t v13 = strerror(*v12);
    *(_DWORD *)long long buf = 136315394;
    char v39 = "ne_session_add_necp_drop_dest_from_dest_list";
    __int16 v40 = 2080;
    int v41 = v13;
    pid_t v14 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
    goto LABEL_11;
  }
  return v9;
}

uint64_t ne_session_initialize_necp_drop_dest()
{
  uint64_t v0 = 0;
  uint64_t v41 = *MEMORY[0x263EF8340];
  LODWORD(v39) = 0;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
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
  uint64_t v1 = "/var/mobile/Library/terminus/com.apple.necp_drop_dest.plist";
  uint64_t v2 = &off_264195258;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = MEMORY[0x263EF86D8];
  do
  {
    int v4 = open(v1, 0, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
           v36,
           v37,
           v38,
           v39);
    if (v4 != -1)
    {
      int v5 = v4;
      memset(&v40, 0, sizeof(v40));
      if (fstat(v4, &v40)) {
        st_size_t size = 0;
      }
      else {
        st_size_t size = v40.st_size;
      }
      if ((unint64_t)(st_size - 1) > 0x27FE)
      {
        if (st_size <= 0) {
          uint64_t v0 = v0;
        }
        else {
          uint64_t v0 = 27;
        }
      }
      else
      {
        int v7 = malloc_type_malloc(st_size, 0x89CDE578uLL);
        if (v7)
        {
          unsigned int v8 = v7;
          if (pread(v5, v7, st_size, 0) == st_size)
          {
            uint64_t v9 = xpc_create_from_plist();
            if (v9)
            {
              int v10 = (void *)v9;
              if (MEMORY[0x2166885F0]() == v3) {
                uint64_t v0 = ne_session_parse_necp_drop_dest_array(v10, (uint64_t)&v19);
              }
              else {
                uint64_t v0 = 22;
              }
              xpc_release(v10);
            }
            else
            {
              uint64_t v0 = 22;
            }
          }
          free(v8);
        }
        else
        {
          uint64_t v0 = 55;
        }
      }
      close(v5);
    }
    uint64_t v11 = *v2++;
    uint64_t v1 = v11;
  }
  while (v11);
  if (v0)
  {
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uid_t v13 = __error();
      pid_t v14 = strerror(*v13);
      v40.st_dev = 136315394;
      *(void *)&v40.st_mode = "ne_session_initialize_necp_drop_dest";
      WORD2(v40.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v14;
      char v15 = "%s: failed %s";
LABEL_28:
      _os_log_error_impl(&dword_212970000, v12, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v40, 0x16u);
    }
  }
  else
  {
    if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, &v19, 0x144uLL)) {
      return 0;
    }
    uint64_t v0 = *__error();
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = __error();
      long long v17 = strerror(*v16);
      v40.st_dev = 136315394;
      *(void *)&v40.st_mode = "ne_session_initialize_necp_drop_dest";
      WORD2(v40.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v17;
      char v15 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
      goto LABEL_28;
    }
  }
  return v0;
}

void *necp_drop_dest_copy_dest_entry_list()
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v24 = 0;
  memset(v23, 0, sizeof(v23));
  size_t v22 = 0;
  if (sysctlbyname("net.necp.drop_dest_level", 0, &v22, 0, 0))
  {
    uint64_t v0 = ne_log_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    return 0;
  }
  size_t v22 = 324;
  if (!sysctlbyname("net.necp.drop_dest_level", v23, &v22, 0, 0))
  {
    xpc_object_t v3 = xpc_array_create(0, 0);
    if (!v3)
    {
      uint64_t v0 = ne_log_obj();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      {
        pid_t v14 = __error();
        char v15 = strerror(*v14);
        *(_DWORD *)string = 136315394;
        long long v32 = "necp_drop_dest_copy_dest_entry_list";
        __int16 v33 = 2080;
        long long v34 = v15;
        uint64_t v16 = "%s: xpc_array_create() failed %s";
LABEL_29:
        _os_log_error_impl(&dword_212970000, v0, OS_LOG_TYPE_ERROR, v16, (uint8_t *)string, 0x16u);
        return 0;
      }
      return 0;
    }
    uint64_t v1 = v3;
    uint64_t v4 = 0;
    while (1)
    {
      xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
      if (!v5)
      {
        long long v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          long long v20 = __error();
          long long v21 = strerror(*v20);
          *(_DWORD *)long long buf = 136315394;
          long long v26 = "necp_drop_dest_copy_dest_entry_list";
          __int16 v27 = 2080;
          *(void *)long long v28 = v21;
          _os_log_error_impl(&dword_212970000, v17, OS_LOG_TYPE_ERROR, "%s: xpc_dictionary_create() failed %s", buf, 0x16u);
        }
        xpc_release(v1);
        return 0;
      }
      uint64_t v6 = v5;
      int v7 = (char *)v23 + v4;
      int v8 = *((unsigned __int8 *)v23 + v4 + 14);
      if (v8 == 30)
      {
        if (v7[13] != 28) {
          goto LABEL_19;
        }
        inet_ntop(30, (char *)&v23[1] + v4 + 5, string, 0x2Eu);
        xpc_object_t xpc_string_from_necp_level = ne_session_create_xpc_string_from_necp_level(*((_DWORD *)v7 + 1));
        xpc_dictionary_set_value(v6, "Level", xpc_string_from_necp_level);
        xpc_release(xpc_string_from_necp_level);
        xpc_dictionary_set_int64(v6, "Prefix", v7[12]);
        xpc_dictionary_set_string(v6, "Address", string);
        int v10 = ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
      }
      else
      {
        if (v8 != 2) {
          goto LABEL_19;
        }
        if (v7[13] != 16) {
          goto LABEL_19;
        }
        inet_ntop(2, (char *)&v23[1] + v4 + 1, string, 0x2Eu);
        xpc_object_t v9 = ne_session_create_xpc_string_from_necp_level(*((_DWORD *)v7 + 1));
        xpc_dictionary_set_value(v6, "Level", v9);
        xpc_release(v9);
        xpc_dictionary_set_int64(v6, "Prefix", v7[12]);
        xpc_dictionary_set_string(v6, "Address", string);
        int v10 = ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
      }
      int v12 = *((_DWORD *)v7 + 1);
      int v13 = v7[12];
      *(_DWORD *)long long buf = 136315906;
      long long v26 = "necp_drop_dest_copy_dest_entry_list";
      __int16 v27 = 1024;
      *(_DWORD *)long long v28 = v12;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v13;
      __int16 v29 = 2080;
      long long v30 = string;
      _os_log_impl(&dword_212970000, v10, OS_LOG_TYPE_INFO, "%s: level %u prefix %u address %s", buf, 0x22u);
LABEL_19:
      if (xpc_dictionary_get_count(v6)) {
        xpc_array_append_value(v1, v6);
      }
      xpc_release(v6);
      v4 += 40;
      if (v4 == 320) {
        return v1;
      }
    }
  }
  uint64_t v0 = ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
LABEL_28:
    long long v18 = __error();
    long long v19 = strerror(*v18);
    *(_DWORD *)string = 136315394;
    long long v32 = "necp_drop_dest_copy_dest_entry_list";
    __int16 v33 = 2080;
    long long v34 = v19;
    uint64_t v16 = "%s: sysctlbyname(net.necp.drop_dest_level) failed %s";
    goto LABEL_29;
  }
  return 0;
}

xpc_object_t ne_session_create_xpc_string_from_necp_level(unsigned int a1)
{
  if (a1 > 0xB) {
    return xpc_string_create("Unknown");
  }
  if (LODWORD((&ne_necp_policy_string_to_level_mapping)[2 * a1 + 1]) != a1)
  {
    if (a1)
    {
      for (uint64_t i = &dword_2641955F8; ; i += 4)
      {
        uint64_t v1 = (const char *)*((void *)i - 1);
        if (!v1) {
          break;
        }
        int v4 = *i;
        if (v4 == a1) {
          return xpc_string_create(v1);
        }
      }
    }
    return xpc_string_create("Unknown");
  }
  uint64_t v1 = (&ne_necp_policy_string_to_level_mapping)[2 * a1];
  return xpc_string_create(v1);
}

BOOL check_alf_plist_if_enabled()
{
  int v0 = open("/Library/Preferences/com.apple.alf.plist", 0);
  if (v0 == -1) {
    return 0;
  }
  int v1 = v0;
  memset(&v11, 0, sizeof(v11));
  if (fstat(v0, &v11)) {
    st_size_t size = 0;
  }
  else {
    st_size_t size = v11.st_size;
  }
  if ((unint64_t)(st_size - 1) <= 0x18FFE && (xpc_object_t v3 = malloc_type_malloc(st_size, 0xDBEFE944uLL)) != 0)
  {
    int v4 = v3;
    if (pread(v1, v3, st_size, 0) == st_size && (xpc_object_t v5 = (void *)xpc_create_from_plist()) != 0)
    {
      uint64_t v6 = v5;
      xpc_object_t value = xpc_dictionary_get_value(v5, "enable_drop_all");
      BOOL v9 = value
        && xpc_int64_get_value(value)
        && (xpc_object_t v8 = xpc_dictionary_get_value(v6, "globalstate")) != 0
        && xpc_int64_get_value(v8) != 0;
      xpc_release(v6);
    }
    else
    {
      BOOL v9 = 0;
    }
    free(v4);
  }
  else
  {
    BOOL v9 = 0;
  }
  close(v1);
  return v9;
}

uint64_t ne_session_initialize_necp_drop_all()
{
  int v0 = open("/Library/Preferences/com.apple.networkextension.necp.plist", 0);
  if (v0 == -1) {
    return ne_session_initialize_necp_drop_dest();
  }
  int v1 = v0;
  memset(&v12, 0, sizeof(v12));
  if (fstat(v0, &v12)) {
    st_size_t size = 0;
  }
  else {
    st_size_t size = v12.st_size;
  }
  if ((unint64_t)(st_size - 1) > 0x27FE)
  {
    if (st_size <= 0) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 27;
    }
  }
  else
  {
    xpc_object_t v3 = malloc_type_malloc(st_size, 0x3029F0BBuLL);
    if (v3)
    {
      int v4 = v3;
      if (pread(v1, v3, st_size, 0) == st_size)
      {
        xpc_object_t v5 = (void *)xpc_create_from_plist();
        if (v5)
        {
          uint64_t v6 = v5;
          xpc_object_t value = (char *)xpc_dictionary_get_value(v5, "drop_all_level");
          if (value)
          {
            necp_level_from_xpc_xpc_object_t value = ne_session_get_necp_level_from_xpc_value(value);
            if (!necp_level_from_xpc_value) {
              necp_level_from_xpc_xpc_object_t value = check_alf_plist_if_enabled();
            }
            uint64_t v8 = sysctlbyname("net.necp.drop_all_level", 0, 0, &necp_level_from_xpc_value, 4uLL);
          }
          else
          {
            uint64_t v8 = 22;
          }
          xpc_release(v6);
        }
        else
        {
          uint64_t v8 = 22;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
      free(v4);
    }
    else
    {
      uint64_t v8 = 55;
    }
  }
  close(v1);
  uint64_t v9 = ne_session_initialize_necp_drop_dest();
  if (!v8) {
    return v9;
  }
  return v8;
}

unsigned __int8 *ne_session_copy_policy_match(const char *a1, char *__s, const char *a3, const unsigned __int8 *a4, _OWORD *a5, int a6, int a7, int a8, int a9)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (__s)
  {
    size_t v15 = strlen(__s) + 48;
    if (!a1) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  size_t v15 = 42;
  if (a1) {
LABEL_3:
  }
    v15 += strlen(a1) + 6;
LABEL_4:
  if (a3) {
    v15 += strlen(a3) + 6;
  }
  size_t v16 = v15 + 9;
  if (!a6) {
    size_t v16 = v15;
  }
  if (a7) {
    v16 += 9;
  }
  if (a8) {
    v16 += 7;
  }
  if (a9) {
    size_t v17 = v16 + 9;
  }
  else {
    size_t v17 = v16;
  }
  long long v18 = (char *)malloc_type_malloc(v17, 0x3578CCD1uLL);
  if (!v18) {
    return 0;
  }
  long long v19 = v18;
  bzero(v18, v17);
  *long long v19 = 1;
  *(_DWORD *)(v19 + 1) = 16;
  *(_OWORD *)(v19 + 5) = *(_OWORD *)a4;
  v19[21] = 2;
  *(_DWORD *)(v19 + 22) = 16;
  *(_OWORD *)(v19 + 26) = *a5;
  if (!__s)
  {
    uint64_t v22 = (uint64_t)(v19 + 42);
    if (!a1) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  int v20 = strlen(__s);
  v19[42] = 4;
  size_t v21 = (v20 + 1);
  *(_DWORD *)(v19 + 43) = v21;
  if (v20 == -1) {
    size_t v21 = 0;
  }
  else {
    memcpy(v19 + 47, __s, v21);
  }
  uint64_t v22 = (uint64_t)&v19[v21 + 47];
  if (a1)
  {
LABEL_25:
    int v23 = strlen(a1);
    *(unsigned char *)uint64_t v22 = 3;
    size_t v24 = (v23 + 1);
    *(_DWORD *)(v22 + 1) = v24;
    if (v23 == -1) {
      size_t v24 = 0;
    }
    else {
      memcpy((void *)(v22 + 5), a1, v24);
    }
    v22 += v24 + 5;
  }
LABEL_29:
  if (a3)
  {
    int v25 = strlen(a3);
    *(unsigned char *)uint64_t v22 = 9;
    size_t v26 = (v25 + 1);
    *(_DWORD *)(v22 + 1) = v26;
    if (v25 == -1) {
      size_t v26 = 0;
    }
    else {
      memcpy((void *)(v22 + 5), a3, v26);
    }
    v22 += v26 + 5;
  }
  if (a6)
  {
    *(unsigned char *)uint64_t v22 = 6;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a6;
    v22 += 9;
  }
  if (a7)
  {
    *(unsigned char *)uint64_t v22 = 7;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a7;
    v22 += 9;
  }
  if (a8)
  {
    *(unsigned char *)uint64_t v22 = 11;
    *(_DWORD *)(v22 + 1) = 2;
    *(_WORD *)(v22 + 5) = a8;
    v22 += 7;
  }
  if (a9)
  {
    *(unsigned char *)uint64_t v22 = 10;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a9;
  }
  __int16 v27 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x1CCuLL, 0x1000040E72E3491uLL);
  int matched = necp_match_policy();
  free(v19);
  if (matched || !*(_DWORD *)v27 && !*((_DWORD *)v27 + 2) && !*((_DWORD *)v27 + 4))
  {
    free(v27);
    nelog_is_info_logging_enabled();
    return 0;
  }
  if (nelog_is_info_logging_enabled())
  {
    if (*((_DWORD *)v27 + 10) == 2)
    {
      memset(uu, 0, sizeof(uu));
      memset(out, 0, 37);
      memset(v43, 0, 37);
      uuid_clear(uu);
      uuid_copy(uu, v27 + 20);
      uuid_unparse(uu, out);
      uuid_unparse(a4, v43);
      long long v30 = ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        long long v31 = "";
        *(_DWORD *)long long buf = 136315906;
        if (a1) {
          long long v32 = a1;
        }
        else {
          long long v32 = "";
        }
        long long v36 = v43;
        __int16 v37 = 2080;
        if (__s) {
          long long v31 = __s;
        }
        long long v38 = v32;
        __int16 v39 = 2080;
        stat v40 = v31;
        __int16 v41 = 2080;
        uint64_t v42 = out;
        _os_log_impl(&dword_212970000, v30, OS_LOG_TYPE_INFO, "App %s, domain=%s, account=%s matched policy for service %s", buf, 0x2Au);
      }
    }
  }
  return v27;
}

uint64_t ne_session_policy_match_get_service_type(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 40);
  }
  return result;
}

uint64_t ne_session_policy_match_get_service(uint64_t a1, uuid_t dst)
{
  if (a1) {
    BOOL v2 = dst == 0;
  }
  else {
    BOOL v2 = 1;
  }
  uint64_t v3 = !v2;
  if (!v2) {
    uuid_copy(dst, (const unsigned __int8 *)(a1 + 20));
  }
  return v3;
}

_DWORD *ne_session_policy_match_is_flow_divert(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result == 4);
  }
  return result;
}

_DWORD *ne_session_policy_match_get_flow_divert_unit(_DWORD *result)
{
  if (result)
  {
    if (*result == 4) {
      return (_DWORD *)result[1];
    }
    else {
      return 0;
    }
  }
  return result;
}

_DWORD *ne_session_policy_match_is_drop(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result == 3);
  }
  return result;
}

uint64_t ne_session_policy_match_get_filter_unit(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t ne_session_policy_match_get_service_action()
{
  return 0;
}

uint64_t ne_session_policy_match_service_is_registered(uint64_t result)
{
  if (result) {
    return *(unsigned char *)(result + 36) & 1;
  }
  return result;
}

_DWORD *ne_session_policy_match_get_scoped_interface_index(_DWORD *result)
{
  if (result)
  {
    if (*result == 12 || *result == 6) {
      return (_DWORD *)result[1];
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t nehelper_queue()
{
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_175_109);
  }
  return g_queue;
}

_xpc_connection_s *nehelper_copy_connection_for_delegate_class(unint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_175_109);
  }
  if (a1 < 0xF)
  {
    os_unfair_lock_lock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
    uint64_t v3 = (_xpc_connection_s *)nehelper_copy_connection_for_delegate_class_g_connection_cache[a1];
    int v4 = ne_log_obj();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)long long buf = 134217984;
        stat v11 = (const char *)a1;
        _os_log_debug_impl(&dword_212970000, v4, OS_LOG_TYPE_DEBUG, "Re-using existing nehelper connection for delegate class %llu", buf, 0xCu);
      }
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)long long buf = 134217984;
        stat v11 = (const char *)a1;
        _os_log_debug_impl(&dword_212970000, v4, OS_LOG_TYPE_DEBUG, "Creating a new nehelper connection for delegate class %llu", buf, 0xCu);
      }
      mach_service = xpc_connection_create_mach_service("com.apple.nehelper", (dispatch_queue_t)g_queue, 2uLL);
      if (!mach_service)
      {
        uint64_t v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          stat v11 = "com.apple.nehelper";
          __int16 v12 = 2048;
          unint64_t v13 = a1;
          _os_log_error_impl(&dword_212970000, v8, OS_LOG_TYPE_ERROR, "xpc_connection_create_mach_service(%s, XPC_CONNECTION_MACH_SERVICE_PRIVILEGED) failed for delegate class %llu", buf, 0x16u);
        }
        uint64_t v3 = 0;
        goto LABEL_15;
      }
      uint64_t v3 = mach_service;
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 0x40000000;
      v9[2] = __nehelper_copy_connection_for_delegate_class_block_invoke;
      void v9[3] = &__block_descriptor_tmp_72;
      v9[4] = a1;
      v9[5] = mach_service;
      xpc_connection_set_event_handler(mach_service, v9);
      xpc_connection_resume(v3);
      nehelper_copy_connection_for_delegate_class_g_connection_cache[a1] = v3;
    }
    xpc_retain(v3);
LABEL_15:
    os_unfair_lock_unlock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
    return v3;
  }
  BOOL v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 134217984;
    stat v11 = (const char *)a1;
    _os_log_error_impl(&dword_212970000, v2, OS_LOG_TYPE_ERROR, "Invalid delegate class id: %llu", buf, 0xCu);
  }
  return 0;
}

void __nehelper_copy_connection_for_delegate_class_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8720])
    {
      if (a2 == MEMORY[0x263EF86A0])
      {
        stat v11 = ne_log_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v14 = 134217984;
          uint64_t v15 = v12;
          _os_log_impl(&dword_212970000, v11, OS_LOG_TYPE_DEFAULT, "nehelper connection for delegate class %llu was interrupted", (uint8_t *)&v14, 0xCu);
        }
      }
      else
      {
        os_unfair_lock_lock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
        uint64_t v8 = (void *)nehelper_copy_connection_for_delegate_class_g_connection_cache[*(void *)(a1 + 32)];
        if (*(void **)(a1 + 40) == v8)
        {
          uint64_t v9 = ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void *)(a1 + 32);
            int v14 = 134217984;
            uint64_t v15 = v10;
            _os_log_impl(&dword_212970000, v9, OS_LOG_TYPE_DEFAULT, "nehelper connection for delegate class %llu received XPC_ERROR_CONNECTION_INVALID", (uint8_t *)&v14, 0xCu);
          }
          nehelper_copy_connection_for_delegate_class_g_connection_cache[*(void *)(a1 + 32)] = 0;
          xpc_release(v8);
        }
        os_unfair_lock_unlock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
      }
    }
    else
    {
      int v4 = (void *)MEMORY[0x216688420](a2);
      BOOL v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 134218242;
        uint64_t v15 = v13;
        __int16 v16 = 2080;
        size_t v17 = v4;
        _os_log_error_impl(&dword_212970000, v5, OS_LOG_TYPE_ERROR, "nehelper connection for delegate class %llu received unknown message: %s", (uint8_t *)&v14, 0x16u);
      }
      free(v4);
    }
  }
  else
  {
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v14 = 134217984;
      uint64_t v15 = v7;
      _os_log_error_impl(&dword_212970000, v6, OS_LOG_TYPE_ERROR, "nehelper connection for delegate class %llu received a NULL message", (uint8_t *)&v14, 0xCu);
    }
  }
}

uint64_t ne_session_address_matches_subnets(uint64_t a1, void *a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v5 = MEMORY[0x2166885F0](a2);
    uint64_t v6 = MEMORY[0x263EF8708];
    if (v5 != MEMORY[0x263EF8708]) {
      return 0;
    }
    int v7 = *(unsigned __int8 *)(a1 + 1);
    if (v7 == 2)
    {
      uint64_t v8 = "ipv4-subnets";
    }
    else
    {
      if (v7 != 30) {
        return 0;
      }
      uint64_t v8 = "ipv6-subnets";
    }
    uint64_t result = (uint64_t)xpc_dictionary_get_value(a2, v8);
    if (result)
    {
      uint64_t v9 = (void *)result;
      if (MEMORY[0x2166885F0]() != v6) {
        return 0;
      }
      xpc_object_t value = xpc_dictionary_get_value(v9, "subnet-addresses");
      xpc_object_t v11 = xpc_dictionary_get_value(v9, "subnet-masks");
      if (!value) {
        return 0;
      }
      uint64_t v12 = v11;
      uint64_t v13 = MEMORY[0x2166885F0](value);
      uint64_t v14 = MEMORY[0x263EF86D8];
      if (v13 != MEMORY[0x263EF86D8]) {
        return 0;
      }
      if (v12)
      {
        if (MEMORY[0x2166885F0](v12) != v14) {
          return 0;
        }
        size_t count = xpc_array_get_count(value);
        if (count != xpc_array_get_count(v12)) {
          return 0;
        }
      }
      else
      {
        size_t count = xpc_array_get_count(value);
      }
      if (!count) {
        return 0;
      }
      size_t v16 = 0;
      size_t v17 = (int8x16_t *)(a1 + 8);
      do
      {
        size_t length = 0;
        int v18 = *(unsigned __int8 *)(a1 + 1);
        if (v18 == 30)
        {
          data = (int8x16_t *)xpc_array_get_data(value, v16, &length);
          if (!data || length < 0x10) {
            goto LABEL_43;
          }
          int v23 = data;
          if (v12)
          {
            size_t v24 = (int8x16_t *)xpc_array_get_data(v12, v16, &length);
            if (!v24 || length <= 0xF) {
              goto LABEL_43;
            }
            int8x16_t v27 = vandq_s8(*v23, *v24);
            uint64_t v26 = v27.i64[1];
            uint64_t v25 = v27.i64[0];
            int8x16_t v30 = vandq_s8(*v17, *v24);
            uint64_t v29 = v30.i64[1];
            uint64_t v28 = v30.i64[0];
          }
          else
          {
            uint64_t v25 = data->i64[0];
            uint64_t v26 = data->i64[1];
            uint64_t v28 = v17->i64[0];
            uint64_t v29 = *(void *)(a1 + 16);
          }
          if (v25 == v28 && v26 == v29) {
            return 1;
          }
        }
        else if (v18 == 2)
        {
          long long v19 = xpc_array_get_data(value, v16, &length);
          if (v19)
          {
            if (length >= 4)
            {
              int v20 = v19;
              if (v12)
              {
                size_t v21 = xpc_array_get_data(v12, v16, &length);
                if (v21 && length >= 4 && ((*(_DWORD *)(a1 + 4) ^ *v20) & *v21) == 0) {
                  return 1;
                }
              }
              else if (*v19 == *(_DWORD *)(a1 + 4))
              {
                return 1;
              }
            }
          }
        }
LABEL_43:
        uint64_t result = 0;
        ++v16;
      }
      while (count != v16);
    }
  }
  return result;
}

BOOL ne_session_service_matches_address_for_interface(const unsigned __int8 *a1, int a2, uint64_t a3, const char *a4, char *a5, unsigned char *a6)
{
  if (a6) {
    *a6 = 0;
  }
  BOOL v12 = 0;
  if (a3 && a4)
  {
    int v13 = *(unsigned __int8 *)(a3 + 1);
    BOOL v14 = v13 == 30 || v13 == 2;
    if (v14 && (a2 - 3) >= 0xFFFFFFFE)
    {
      os_unfair_lock_lock(&_ne_session_cache_lock);
      xpc_object_t v15 = ne_session_copy_cached_values_locked();
      if (v15)
      {
        size_t v16 = v15;
        xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v15, a1, a2);
        domain_dict_from_session_dict = ne_session_get_domain_dict_from_session_dict(session_dict_from_cache, a5, a4);
        uint64_t v19 = MEMORY[0x263EF8708];
        if (domain_dict_from_session_dict
          && (int v20 = domain_dict_from_session_dict, MEMORY[0x2166885F0]() == v19)
          && xpc_dictionary_get_BOOL(v20, "service-probe-failed")
          || (xpc_object_t v21 = xpc_dictionary_get_value(v16, "redirected-addresses")) != 0
          && (uint64_t v22 = v21, MEMORY[0x2166885F0]() == v19)
          && (xpc_object_t v23 = xpc_dictionary_get_value(v22, a4), ne_session_address_matches_subnets(a3, v23)))
        {
          BOOL v12 = 1;
          if (a6) {
            *a6 = 1;
          }
        }
        else
        {
          BOOL v12 = 0;
          if (a2 == 1)
          {
            if (session_dict_from_cache)
            {
              if (MEMORY[0x2166885F0](session_dict_from_cache) == v19)
              {
                xpc_object_t value = xpc_dictionary_get_value(session_dict_from_cache, "included-routes");
                if (ne_session_address_matches_subnets(a3, value))
                {
                  xpc_object_t v25 = xpc_dictionary_get_value(session_dict_from_cache, "excluded-routes");
                  if (!ne_session_address_matches_subnets(a3, v25)) {
                    BOOL v12 = 1;
                  }
                }
              }
            }
          }
        }
        xpc_release(v16);
      }
      else
      {
        BOOL v12 = 0;
      }
      os_unfair_lock_unlock(&_ne_session_cache_lock);
    }
    else
    {
      return 0;
    }
  }
  return v12;
}

xpc_object_t ne_session_copy_cached_values_locked()
{
  if (globals_init_sess_init != -1) {
    dispatch_once(&globals_init_sess_init, &__block_literal_global_175_109);
  }
  os_unfair_lock_assert_owner(&_ne_session_cache_lock);
  if (_ne_session_cache_notify_token == -1) {
    notify_register_dispatch("com.apple.networkextension.ondemandcachechanged", &_ne_session_cache_notify_token, (dispatch_queue_t)g_queue, &__block_literal_global_219);
  }
  int v0 = (void *)_ne_session_master_cache;
  if (_ne_session_master_cache) {
    return xpc_retain(v0);
  }
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  uint64_t v3 = dispatch_semaphore_create(0);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  _DWORD v4[2] = __ne_session_copy_cached_values_locked_block_invoke_3;
  v4[3] = &__block_descriptor_tmp_223;
  v4[4] = v3;
  ne_session_update_cached_values((uint64_t)v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  os_unfair_lock_lock(&_ne_session_cache_lock);
  uint64_t v1 = 0;
  int v0 = (void *)_ne_session_master_cache;
  if (_ne_session_master_cache) {
    return xpc_retain(v0);
  }
  return (xpc_object_t)v1;
}

xpc_object_t ne_session_get_session_dict_from_cache(void *a1, const unsigned __int8 *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = MEMORY[0x2166885F0]();
  uint64_t v7 = MEMORY[0x263EF8708];
  if (v6 != MEMORY[0x263EF8708]) {
    return 0;
  }
  xpc_object_t result = xpc_dictionary_get_value(a1, "services");
  if (result)
  {
    uint64_t v9 = result;
    if (MEMORY[0x2166885F0]() != v7) {
      return 0;
    }
    memset(v13, 0, sizeof(v13));
    uuid_unparse(a2, v13);
    xpc_object_t value = xpc_dictionary_get_value(v9, v13);
    if (!value) {
      return 0;
    }
    xpc_object_t v11 = value;
    if (MEMORY[0x2166885F0]() != v7) {
      return 0;
    }
    if ((a3 - 1) >= 9) {
      BOOL v12 = "<unknown>";
    }
    else {
      BOOL v12 = off_2641958C8[a3 - 1];
    }
    return xpc_dictionary_get_value(v11, v12);
  }
  return result;
}

void *ne_session_get_domain_dict_from_session_dict(void *a1, char *a2, const char *a3)
{
  if (!a2) {
    return 0;
  }
  int v4 = 0;
  if (!a1 || !*a2) {
    return v4;
  }
  uint64_t v7 = MEMORY[0x2166885F0](a1);
  uint64_t v8 = MEMORY[0x263EF8708];
  if (v7 != MEMORY[0x263EF8708]) {
    return 0;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, a3);
  if (!value) {
    return 0;
  }
  xpc_object_t v11 = value;
  if (MEMORY[0x2166885F0]() != v8) {
    return 0;
  }
  xpc_object_t v12 = xpc_dictionary_get_value(v11, "service-domain-info");
  if (!v12) {
    return 0;
  }
  int v13 = v12;
  uint64_t v14 = MEMORY[0x2166885F0]();
  uint64_t v15 = MEMORY[0x263EF86D8];
  if (v14 != MEMORY[0x263EF86D8]) {
    return 0;
  }
  size_t count = xpc_array_get_count(v13);
  if (!count) {
    return 0;
  }
  size_t v17 = count;
  size_t v18 = 0;
  while (1)
  {
    xpc_object_t v19 = xpc_array_get_value(v13, v18);
    if (v19)
    {
      int v4 = v19;
      if (MEMORY[0x2166885F0]() == v8)
      {
        xpc_object_t v20 = xpc_dictionary_get_value(v4, "service-domains");
        if (v20)
        {
          xpc_object_t v21 = v20;
          if (MEMORY[0x2166885F0]() == v15)
          {
            size_t v22 = xpc_array_get_count(v21);
            if (v22) {
              break;
            }
          }
        }
      }
    }
LABEL_15:
    int v4 = 0;
    if (++v18 == v17) {
      return v4;
    }
  }
  size_t v23 = v22;
  size_t v24 = 0;
  while (1)
  {
    string = xpc_array_get_string(v21, v24);
    if (string)
    {
      if (strstr(a2, string)) {
        return v4;
      }
    }
    if (v23 == ++v24) {
      goto LABEL_15;
    }
  }
}

intptr_t __ne_session_copy_cached_values_locked_block_invoke_3(uint64_t a1, void *a2)
{
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }
  if (a2 && MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8708]) {
    _ne_session_master_cache = (uint64_t)xpc_retain(a2);
  }
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  int v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

void ne_session_update_cached_values(uint64_t a1)
{
  BOOL v2 = nehelper_copy_connection_for_delegate_class(1uLL);
  if (v2)
  {
    uint64_t v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      uint64_t v5 = v4;
      xpc_dictionary_set_uint64(v4, "delegate-class-id", 1uLL);
      xpc_dictionary_set_uint64(v5, "cache-command", 1uLL);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = __ne_session_update_cached_values_block_invoke;
      handler[3] = &unk_264195780;
      handler[4] = a1;
      xpc_connection_send_message_with_reply(v3, v5, (dispatch_queue_t)g_queue, handler);
      xpc_release(v5);
    }
    xpc_release(v3);
  }
}

uint64_t __ne_session_update_cached_values_block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8708]) {
    xpc_dictionary_get_value(a2, "result-data");
  }
  xpc_object_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __ne_session_copy_cached_values_locked_block_invoke(uint64_t a1, int a2)
{
  os_unfair_lock_lock(&_ne_session_cache_lock);
  int v3 = _ne_session_cache_notify_token;
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  if (v3 == a2)
  {
    ne_session_update_cached_values((uint64_t)&__block_literal_global_222);
  }
}

void __ne_session_copy_cached_values_locked_block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }
  if (a2 && MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8708]) {
    _ne_session_master_cache = (uint64_t)xpc_retain(a2);
  }

  os_unfair_lock_unlock(&_ne_session_cache_lock);
}

uint64_t ne_session_service_matches_address(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

int64_t ne_session_service_get_dns_service_id_for_interface(const unsigned __int8 *a1, int a2, char *a3, const char *a4)
{
  int64_t int64 = 0;
  if (a2 == 1 && a4)
  {
    os_unfair_lock_lock(&_ne_session_cache_lock);
    xpc_object_t v8 = ne_session_copy_cached_values_locked();
    if (v8)
    {
      uint64_t v9 = v8;
      xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v8, a1, 1);
      domain_dict_from_session_dict = ne_session_get_domain_dict_from_session_dict(session_dict_from_cache, a3, a4);
      if (domain_dict_from_session_dict
        && (xpc_object_t v12 = domain_dict_from_session_dict, MEMORY[0x2166885F0]() == MEMORY[0x263EF8708]))
      {
        int64_t int64 = xpc_dictionary_get_int64(v12, "service-dns-service");
      }
      else
      {
        int64_t int64 = 0;
      }
      os_unfair_lock_unlock(&_ne_session_cache_lock);
      xpc_release(v9);
    }
    else
    {
      os_unfair_lock_unlock(&_ne_session_cache_lock);
      return 0;
    }
  }
  return int64;
}

xpc_object_t ne_session_service_copy_cached_match_domains(const unsigned __int8 *a1, int a2)
{
  if (a2 != 1) {
    return 0;
  }
  os_unfair_lock_lock(&_ne_session_cache_lock);
  xpc_object_t v3 = ne_session_copy_cached_values_locked();
  if (!v3)
  {
    os_unfair_lock_unlock(&_ne_session_cache_lock);
    return 0;
  }
  xpc_object_t v4 = v3;
  xpc_object_t session_dict_from_cache = ne_session_get_session_dict_from_cache(v3, a1, 1);
  xpc_object_t v6 = session_dict_from_cache;
  if (session_dict_from_cache)
  {
    if (MEMORY[0x2166885F0](session_dict_from_cache) == MEMORY[0x263EF8708])
    {
      xpc_object_t value = xpc_dictionary_get_value(v6, "match-domains");
      xpc_object_t v6 = value;
      if (!value) {
        goto LABEL_6;
      }
      if (MEMORY[0x2166885F0](value) == MEMORY[0x263EF86D8])
      {
        xpc_object_t v6 = xpc_retain(v6);
        goto LABEL_6;
      }
    }
    xpc_object_t v6 = 0;
  }
LABEL_6:
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  xpc_release(v4);
  return v6;
}

uint64_t ne_session_service_get_dns_service_id()
{
  return 0;
}

uint64_t ne_session_set_socket_attributes(int a1, char *__s, const char *a3)
{
  if (a1 == -1) {
    return 0;
  }
  xpc_object_t v4 = __s;
  if (!((unint64_t)__s | (unint64_t)a3)) {
    return 1;
  }
  if (__s)
  {
    size_t v7 = strlen(__s) + 6;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  size_t v7 = 0;
  if (a3) {
LABEL_7:
  }
    v7 += strlen(a3) + 6;
LABEL_8:
  uint64_t result = (uint64_t)malloc_type_malloc(v7, 0xD44B12FFuLL);
  if (result)
  {
    xpc_object_t v8 = (char *)result;
    bzero((void *)result, v7);
    uint64_t v9 = (uint64_t)v8;
    if (v4)
    {
      size_t v10 = strlen(v4);
      if (v10 >= 2)
      {
        size_t v11 = v10 - 1;
        if (v4[v10 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_231[v11] = 0;
          xpc_object_t v4 = ne_session_trim_domain_domain_buffer_231;
        }
      }
      int v12 = strlen(v4);
      *xpc_object_t v8 = 7;
      size_t v13 = (v12 + 1);
      *(_DWORD *)(v8 + 1) = v13;
      if (v12 == -1) {
        size_t v13 = 0;
      }
      else {
        memcpy(v8 + 5, v4, v13);
      }
      uint64_t v9 = (uint64_t)&v8[v13 + 5];
    }
    if (a3)
    {
      int v14 = strlen(a3);
      *(unsigned char *)uint64_t v9 = 8;
      size_t v15 = (v14 + 1);
      *(_DWORD *)(v9 + 1) = v15;
      if (v14 != -1) {
        memcpy((void *)(v9 + 5), a3, v15);
      }
    }
    int v16 = setsockopt(a1, 0xFFFF, 4361, v8, v7);
    free(v8);
    return v16 == 0;
  }
  return result;
}

uint64_t ne_session_copy_socket_attributes(int a1, void **a2, void **a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  socklen_t v17 = 256;
  if (a1 == -1) {
    return 0;
  }
  if ((unint64_t)a2 | (unint64_t)a3)
  {
    if (!getsockopt(a1, 0xFFFF, 4361, v18, &v17))
    {
      if (a2 && v17)
      {
        uint64_t v7 = 0;
        int v8 = 0;
        while (1)
        {
          uint64_t v9 = &v18[v7];
          size_t v10 = *(unsigned int *)&v18[v7 + 1];
          if (v18[v7] == 7) {
            break;
          }
          uint64_t v7 = (v8 + v10 + 5);
          int v8 = v7;
          if (v7 >= v17) {
            goto LABEL_17;
          }
        }
        if (v10)
        {
          size_t v11 = malloc_type_calloc(v10 + 1, 1uLL, 0x100004077774924uLL);
          *a2 = v11;
          if (v11) {
            memcpy(v11, v9 + 5, v10);
          }
        }
        else
        {
          *a2 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_17:
      if (a3 && v17)
      {
        uint64_t v12 = 0;
        int v13 = 0;
        while (1)
        {
          int v14 = &v18[v12];
          size_t v15 = *(unsigned int *)&v18[v12 + 1];
          if (v18[v12] == 8) {
            break;
          }
          uint64_t v12 = (v13 + v15 + 5);
          uint64_t v5 = 1;
          int v13 = v12;
          if (v12 >= v17) {
            return v5;
          }
        }
        if (!v15)
        {
          uint64_t v5 = 1;
          *a3 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
          return v5;
        }
        int v16 = malloc_type_calloc(v15 + 1, 1uLL, 0x100004077774924uLL);
        *a3 = v16;
        if (!v16) {
          return 1;
        }
        memcpy(v16, v14 + 5, v15);
      }
      return 1;
    }
    return 0;
  }
  return 1;
}

const char *ne_session_status_to_string(int a1)
{
  if ((a1 - 1) > 4) {
    return "invalid";
  }
  else {
    return off_2641958A0[a1 - 1];
  }
}

const char *ne_session_type_to_string(int a1)
{
  if ((a1 - 1) > 8) {
    return "<unknown>";
  }
  else {
    return off_2641958C8[a1 - 1];
  }
}

uint64_t ne_session_copy_security_session_info(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000;
  uint64_t v16 = 0;
  *a2 = 0;
  *a3 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 0x40000000;
  v12[2] = __ne_session_copy_security_session_info_block_invoke;
  v12[3] = &unk_264195290;
  v12[4] = &v13;
  v12[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, v12);
  if (v14[3])
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "SessionCommandType", 5);
    xpc_object_t v6 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v14[3], v5);
    uint64_t v7 = v6;
    if (v6)
    {
      if (MEMORY[0x2166885F0](v6) == MEMORY[0x263EF8708])
      {
        *a2 = xpc_dictionary_copy_mach_send();
        *a3 = xpc_dictionary_copy_mach_send();
      }
      else if (MEMORY[0x2166885F0](v7) == MEMORY[0x263EF8720])
      {
        int v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          string = xpc_dictionary_get_string(v7, (const char *)*MEMORY[0x263EF86B0]);
          *(_DWORD *)long long buf = 136315138;
          size_t v18 = string;
          _os_log_error_impl(&dword_212970000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch security session info: %s", buf, 0xCu);
        }
        uint64_t v9 = 0;
        goto LABEL_11;
      }
    }
    uint64_t v9 = 1;
LABEL_11:
    xpc_release(v5);
    xpc_release(v7);
    xpc_release((xpc_object_t)v14[3]);
    goto LABEL_12;
  }
  uint64_t v9 = 0;
LABEL_12:
  _Block_object_dispose(&v13, 8);
  return v9;
}

xpc_object_t __ne_session_copy_security_session_info_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = get_connection(**(void **)(a1 + 40));
  xpc_object_t result = *(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (result)
  {
    xpc_object_t result = xpc_retain(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void ne_session_stop_all_with_plugin_type(int a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if (queue)
  {
    if (block) {
      dispatch_async(queue, block);
    }
  }
}

xpc_object_t ne_session_policy_copy_flow_divert_token(const unsigned __int8 *a1, unsigned int a2, xpc_object_t xdict, const char *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000;
  uint64_t v18 = 0;
  if (!a4 || uuid_is_null(a1))
  {
    xpc_object_t v8 = ne_session_policy_copy_flow_divert_token_with_key(a2, xdict, 0, 0);
    goto LABEL_4;
  }
  if (!ne_session_validate_flow_properties(xdict))
  {
LABEL_15:
    xpc_object_t v8 = 0;
    goto LABEL_4;
  }
  size_t v10 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 0x40000000;
  v14[2] = __ne_session_policy_copy_flow_divert_token_block_invoke;
  v14[3] = &unk_2641952B8;
  v14[4] = &v15;
  v14[5] = v10;
  uint64_t v11 = ne_session_create((uint64_t)a1, 2);
  uint64_t v20 = 0;
  xpc_object_t v21 = &v20;
  uint64_t v22 = 0x2000000000;
  char v23 = 0;
  if (get_flow_divert_token_from_session_manager_token_init != -1) {
    dispatch_once(&get_flow_divert_token_from_session_manager_token_init, &__block_literal_global_233);
  }
  *(void *)&long long block = MEMORY[0x263EF8330];
  *((void *)&block + 1) = 0x40000000;
  xpc_object_t v25 = __get_flow_divert_token_from_session_manager_block_invoke_2;
  uint64_t v26 = &unk_2641957C8;
  int8x16_t v27 = &v20;
  uint64_t v28 = v11;
  dispatch_sync((dispatch_queue_t)g_queue, &block);
  if (*((unsigned char *)v21 + 24))
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v11 + 40), 1u, memory_order_relaxed);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 0x40000000;
    v19[2] = __get_flow_divert_token_from_session_manager_block_invoke_3;
    v19[3] = &__block_descriptor_tmp_238;
    v19[4] = v11;
    out[0] = MEMORY[0x263EF8330];
    out[1] = 0x40000000;
    out[2] = __ne_session_set_event_handler_block_invoke;
    out[3] = &unk_264194F88;
    out[4] = v19;
    uint64_t v30 = v11;
    uint64_t v31 = get_flow_divert_token_from_session_manager_token_queue;
    dispatch_sync((dispatch_queue_t)g_queue, out);
  }
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "SessionFlowDivertTokenControlUnit", a2);
  if (xdict) {
    xpc_dictionary_set_value(v12, "SessionFlowDivertTokenProperties", xdict);
  }
  xpc_dictionary_set_string(v12, "SessionFlowDivertTokenSigningIdentifier", a4);
  out[0] = MEMORY[0x263EF8330];
  out[1] = 0x40000000;
  out[2] = __get_flow_divert_token_from_session_manager_block_invoke_242;
  out[3] = &unk_264195830;
  out[4] = v14;
  uint64_t v30 = v11;
  ne_session_get_info_with_parameters(v11, 4, (uint64_t)v12, 0, (dispatch_object_t)get_flow_divert_token_from_session_manager_token_queue, out);
  _Block_object_dispose(&v20, 8);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v10);
  xpc_object_t v8 = (xpc_object_t)v16[3];
  if (!v8)
  {
    memset(out, 0, 37);
    uuid_unparse(a1, (char *)out);
    uint64_t v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LODWORD(block) = 136315138;
      *(void *)((char *)&block + 4) = out;
      _os_log_error_impl(&dword_212970000, v13, OS_LOG_TYPE_ERROR, "Failed to obtain the flow divert token for configuration %s", (uint8_t *)&block, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_4:
  _Block_object_dispose(&v15, 8);
  return v8;
}

xpc_object_t ne_session_policy_copy_flow_divert_token_with_key(unsigned int a1, xpc_object_t xdict, const char *a3, void *a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  size_t length = 0;
  string = xpc_dictionary_get_string(xdict, "flow-host-name");
  data = xpc_dictionary_get_data(xdict, "flow-host-address", &length);
  int int64 = xpc_dictionary_get_int64(xdict, "flow-host-port");
  BOOL v11 = xpc_dictionary_get_BOOL(xdict, "flow-multipath-requested");
  size_t v57 = 0;
  xpc_object_t v12 = xpc_dictionary_get_data(xdict, "app-data", &v57);
  uint int64 = xpc_dictionary_get_uint64(xdict, "aggregate_unit");
  BOOL v14 = ne_session_validate_flow_properties(xdict);
  xpc_object_t v15 = 0;
  if (!v14) {
    return v15;
  }
  if (v11) {
    int v16 = 4;
  }
  else {
    int v16 = 0;
  }
  int v54 = v16;
  if (string) {
    size_t v17 = strlen(string) + 5;
  }
  else {
    size_t v17 = 0;
  }
  int v55 = int64;
  if (data && *data) {
    v17 += *data + 5;
  }
  uint64_t v18 = 61;
  if (!a4) {
    uint64_t v18 = 36;
  }
  size_t v19 = v17 + v18;
  if (a3) {
    v19 += strlen(a3) + 5;
  }
  if (v57) {
    BOOL v20 = v12 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  size_t v21 = v57 + 5;
  if (v20) {
    size_t v21 = 0;
  }
  size_t v22 = v21 + v19;
  unsigned int v56 = uint64;
  if (uint64) {
    size_t v23 = v22 + 9;
  }
  else {
    size_t v23 = v22;
  }
  size_t v24 = (char *)malloc_type_malloc(v23, 0x13056143uLL);
  xpc_object_t v25 = v24;
  if (string)
  {
    char v53 = a3;
    uint64_t v26 = v12;
    unsigned int v27 = a1;
    uint64_t v28 = a4;
    unsigned int v29 = strlen(string);
    uint64_t v30 = v29;
    unint64_t v31 = v29 + 5;
    unint64_t v32 = v23 - v31;
    if (v23 < v31) {
      goto LABEL_58;
    }
    *xpc_object_t v25 = 21;
    *(_DWORD *)(v25 + 1) = bswap32(v29);
    memcpy(v25 + 5, string, v29);
    __int16 v33 = &v25[v30 + 5];
    a4 = v28;
    a1 = v27;
    xpc_object_t v12 = v26;
    a3 = v53;
    if (!data) {
      goto LABEL_33;
    }
LABEL_29:
    size_t v34 = *data;
    if (*data)
    {
      BOOL v35 = v32 >= v34 + 5;
      v32 -= v34 + 5;
      if (!v35) {
        goto LABEL_58;
      }
      *__int16 v33 = 22;
      *(_DWORD *)(v33 + 1) = v34 << 24;
      long long v36 = v33 + 5;
      memcpy(v36, data, v34);
      __int16 v33 = &v36[v34];
    }
    goto LABEL_33;
  }
  unint64_t v32 = v23;
  __int16 v33 = v24;
  if (data) {
    goto LABEL_29;
  }
LABEL_33:
  if (v32 <= 8) {
    goto LABEL_58;
  }
  *__int16 v33 = 23;
  *(_DWORD *)(v33 + 1) = 0x4000000;
  *(_DWORD *)(v33 + 5) = v55;
  if (v32 - 9 <= 8) {
    goto LABEL_58;
  }
  __int16 v37 = a4;
  v33[9] = 10;
  *(_DWORD *)(v33 + 10) = 0x4000000;
  *(_DWORD *)(v33 + 14) = bswap32(a1);
  int is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  if (v32 - 18 <= 8) {
    goto LABEL_58;
  }
  int v39 = is_debug_logging_enabled ? 7 : 5;
  v33[18] = 20;
  *(_DWORD *)(v33 + 19) = 0x4000000;
  *(_DWORD *)(v33 + 23) = v39;
  if (v32 - 27 <= 8) {
LABEL_58:
  }
    __assert_rtn("ne_tlv_add", "ne_session.c", 2995, "tlv_iter->remaining >= add_size");
  v33[27] = 29;
  *((_DWORD *)v33 + 7) = 0x4000000;
  *((_DWORD *)v33 + 8) = v54;
  unint64_t v40 = v32 - 36;
  if (a3)
  {
    unsigned int v41 = strlen(a3);
    uint64_t v42 = v41;
    unint64_t v43 = v41 + 5;
    BOOL v35 = v40 >= v43;
    v40 -= v43;
    if (!v35) {
      goto LABEL_58;
    }
    v33[36] = 25;
    *(_DWORD *)(v33 + 37) = bswap32(v41);
    uint64_t v44 = v33 + 41;
    memcpy(v44, a3, v41);
    BOOL v45 = &v44[v42];
  }
  else
  {
    BOOL v45 = v33 + 36;
  }
  if (v12)
  {
    unsigned int v46 = v57;
    if (v57)
    {
      size_t v47 = v57;
      unint64_t v48 = v57 + 5;
      BOOL v35 = v40 >= v48;
      v40 -= v48;
      if (!v35) {
        goto LABEL_58;
      }
      *BOOL v45 = 31;
      *(_DWORD *)(v45 + 1) = bswap32(v46);
      memcpy(v45 + 5, v12, v47);
      v45 += v47 + 5;
    }
  }
  if (v56)
  {
    if (v40 <= 8) {
      goto LABEL_58;
    }
    *BOOL v45 = 26;
    *(_DWORD *)(v45 + 1) = 0x4000000;
    *(_DWORD *)(v45 + 5) = bswap32(v56);
    v45 += 9;
    v40 -= 9;
  }
  if (v37)
  {
    long long macOut = 0uLL;
    int v60 = 0;
    bytes_ptr = xpc_data_get_bytes_ptr(v37);
    size_t v50 = xpc_data_get_length(v37);
    CCHmac(0, bytes_ptr, v50, v25, v23 - v40, &macOut);
    if (v40 <= 0x18) {
      goto LABEL_58;
    }
    *BOOL v45 = 18;
    *(_DWORD *)(v45 + 1) = 335544320;
    long long v51 = macOut;
    *(_DWORD *)(v45 + 21) = v60;
    *(_OWORD *)(v45 + 5) = v51;
    v40 -= 25;
  }
  xpc_object_t v15 = xpc_data_create(v25, v23 - v40);
  free(v25);
  return v15;
}

BOOL ne_session_validate_flow_properties(void *a1)
{
  size_t length = 0;
  string = xpc_dictionary_get_string(a1, "flow-host-name");
  data = (unsigned __int8 *)xpc_dictionary_get_data(a1, "flow-host-address", &length);
  int int64 = xpc_dictionary_get_int64(a1, "flow-host-port");
  if (!string)
  {
    if (!data)
    {
      xpc_object_t v8 = ne_log_obj();
      BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!result) {
        return result;
      }
      LOWORD(v15[0]) = 0;
      uint64_t v9 = "Invalid flow properties: missing hostname and address";
      goto LABEL_31;
    }
    goto LABEL_6;
  }
  if (!*string)
  {
    xpc_object_t v8 = ne_log_obj();
    BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    LOWORD(v15[0]) = 0;
    uint64_t v9 = "Invalid flow properties: hostname is empty";
    goto LABEL_31;
  }
  if (data)
  {
LABEL_6:
    int v5 = data[1];
    if (v5 == 30)
    {
      size_t v11 = *data;
      if (v11 < 0x1C || length < v11) {
        goto LABEL_22;
      }
      v15[0] = 0;
      v15[1] = 0;
      if (*(_OWORD *)(data + 8) != 0) {
        goto LABEL_27;
      }
      xpc_object_t v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      __int16 v16 = 0;
      uint64_t v9 = "Invalid flow properties: address is IN6ADDR_ANY_INIT";
    }
    else
    {
      if (v5 != 2 || ((v6 = *data, v6 >= 0x10) ? (BOOL v7 = length >= v6) : (BOOL v7 = 0), !v7))
      {
LABEL_22:
        uint64_t v13 = ne_log_obj();
        BOOL result = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        if (!result) {
          return result;
        }
        LOWORD(v15[0]) = 0;
        _os_log_error_impl(&dword_212970000, v13, OS_LOG_TYPE_ERROR, "Invalid host address", (uint8_t *)v15, 2u);
        return 0;
      }
      LODWORD(v15[0]) = 0;
      if (*((_DWORD *)data + 1)) {
        goto LABEL_27;
      }
      xpc_object_t v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      __int16 v16 = 0;
      uint64_t v9 = "Invalid flow properties: address is INADDR_ANY";
    }
    BOOL v14 = (uint8_t *)&v16;
    goto LABEL_32;
  }
LABEL_27:
  if (int64) {
    return 1;
  }
  xpc_object_t v8 = ne_log_obj();
  BOOL result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (result)
  {
    LOWORD(v15[0]) = 0;
    uint64_t v9 = "Invalid flow properties: invalid port";
LABEL_31:
    BOOL v14 = (uint8_t *)v15;
LABEL_32:
    _os_log_impl(&dword_212970000, v8, OS_LOG_TYPE_INFO, v9, v14, 2u);
    return 0;
  }
  return result;
}

intptr_t __ne_session_policy_copy_flow_divert_token_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (object) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_retain(object);
  }
  xpc_object_t v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

uint64_t __get_flow_divert_token_from_session_manager_block_invoke_2(uint64_t result)
{
  char v1 = 0;
  BOOL v2 = (uint64_t *)(**(void **)(result + 40) + 24);
  do
  {
    char v3 = v1;
    uint64_t v4 = *v2;
    if (v1) {
      break;
    }
    BOOL v2 = (uint64_t *)(v4 + 8);
    char v1 = 1;
  }
  while (v4);
  if (v4 == 0 && (v3 & 1) != 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void __get_flow_divert_token_from_session_manager_block_invoke_3(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    ne_session_release(v3);
  }
  else if (a2 == 1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 0x40000000;
    _DWORD v4[2] = __get_flow_divert_token_from_session_manager_block_invoke_4;
    v4[3] = &__block_descriptor_tmp_236;
    v4[4] = v2;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = __ne_session_get_status_block_invoke;
    block[3] = &unk_264195020;
    void block[5] = v2;
    void block[6] = get_flow_divert_token_from_session_manager_token_queue;
    void block[4] = v4;
    dispatch_sync((dispatch_queue_t)g_queue, block);
  }
}

void __get_flow_divert_token_from_session_manager_block_invoke_242(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8708] && xpc_dictionary_get_value(a2, "SessionFlowDivertTokenKey")) {
    MEMORY[0x2166885F0]();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = *(void *)(a1 + 40);

  ne_session_release(v4);
}

void __get_flow_divert_token_from_session_manager_block_invoke_4(uint64_t a1, unsigned int a2)
{
  void v6[5] = *MEMORY[0x263EF8340];
  if (a2 <= 1)
  {
    uint64_t v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6[0]) = 67109120;
      HIDWORD(v6[0]) = a2;
      _os_log_impl(&dword_212970000, v4, OS_LOG_TYPE_INFO, "Flow divert token session status changed to %d, cleaning up", (uint8_t *)v6, 8u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 0x40000000;
    _DWORD v6[2] = __ne_session_cancel_block_invoke;
    v6[3] = &__block_descriptor_tmp_10;
    v6[4] = v5;
    dispatch_sync((dispatch_queue_t)g_queue, v6);
  }
}

dispatch_queue_t __get_flow_divert_token_from_session_manager_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("flow divert token queue", v0);
  get_flow_divert_token_from_session_manager_token_queue = (uint64_t)result;
  return result;
}

xpc_object_t ne_session_copy_app_data_from_flow_divert_socket(int a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  socklen_t v21 = 0;
  xpc_object_t v2 = 0;
  if (getsockopt(a1, 0xFFFF, 4358, 0, &v21)) {
    return v2;
  }
  if (!v21)
  {
    BOOL v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)long long buf = 0;
    xpc_object_t v8 = "flow divert token size is 0";
    uint64_t v9 = v7;
    uint32_t v10 = 2;
LABEL_24:
    _os_log_error_impl(&dword_212970000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    return 0;
  }
  uint64_t v3 = (unsigned __int8 *)malloc_type_malloc(v21, 0x100004077774924uLL);
  if (!v3)
  {
    size_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v23) = v21;
    xpc_object_t v8 = "Failed to allocate %u bytes for the flow divert token";
    uint64_t v9 = v11;
    uint32_t v10 = 8;
    goto LABEL_24;
  }
  uint64_t v4 = v3;
  if (getsockopt(a1, 0xFFFF, 4358, v3, &v21))
  {
    int v5 = *__error();
    size_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = strerror(v5);
      *(_DWORD *)long long buf = 136315138;
      size_t v23 = v20;
      _os_log_error_impl(&dword_212970000, v6, OS_LOG_TYPE_ERROR, "getsockopt(SO_FLOW_DIVERT_TOKEN) failed: %s", buf, 0xCu);
    }
    free(v4);
    return 0;
  }
  unint64_t v13 = v21;
  BOOL v14 = v4;
  while (v13 >= 5)
  {
    int v15 = *v14;
    unsigned int v16 = *(_DWORD *)(v14 + 1);
    size_t v17 = bswap32(v16);
    if (v16)
    {
      uint64_t v18 = v17 + 5;
      if (v17 + 5 > v13) {
        break;
      }
      size_t v19 = v14 + 5;
    }
    else
    {
      size_t v19 = 0;
      uint64_t v18 = 5;
    }
    v14 += v18;
    v13 -= v18;
    if (v15 == 31)
    {
      xpc_object_t v2 = xpc_data_create(v19, v17);
      goto LABEL_22;
    }
  }
  xpc_object_t v2 = 0;
LABEL_22:
  free(v4);
  return v2;
}

xpc_object_t ne_session_copy_app_data_from_flow_divert_token(void *a1)
{
  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(a1);
  size_t length = xpc_data_get_length(a1);
  do
  {
    if (length < 5) {
      return 0;
    }
    int v4 = *bytes_ptr;
    unsigned int v5 = *(_DWORD *)(bytes_ptr + 1);
    size_t v6 = bswap32(v5);
    if (v5)
    {
      uint64_t v7 = v6 + 5;
      if (v6 + 5 > length) {
        return 0;
      }
      xpc_object_t v8 = bytes_ptr + 5;
    }
    else
    {
      xpc_object_t v8 = 0;
      uint64_t v7 = 5;
    }
    bytes_ptr += v7;
    length -= v7;
  }
  while (v4 != 31);

  return xpc_data_create(v8, v6);
}

uint64_t ne_session_get_config_id_from_network_agent(uint64_t result, unsigned __int8 *a2, _DWORD *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension") && *(_DWORD *)(v5 + 212) == 40)
    {
      if (a2) {
        uuid_copy(a2, (const unsigned __int8 *)(v5 + 216));
      }
      if (a3) {
        *a3 = *(_DWORD *)(v5 + 232);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ne_session_agent_get_advisory_interface_index(uint64_t result, int a2, unsigned char *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension")
      && !strcmp((const char *)(v5 + 48), "PathController")
      && *(_DWORD *)(v5 + 212) == 140)
    {
      uint64_t v6 = 0;
      while (1)
      {
        int v7 = *(_DWORD *)(v5 + 272 + 4 * v6);
        if (!v7 || v7 == a2) {
          break;
        }
        dispatch_queue_t result = 0;
        if (++v6 == 4) {
          return result;
        }
      }
      if (a3) {
        *a3 = *(unsigned char *)(v5 + 288) & 1;
      }
      return *(unsigned int *)(v5 + 4 * v6 + 256);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ne_session_agent_get_advisory(uint64_t result, int a2, unsigned char *a3, BOOL *a4, BOOL *a5, BOOL *a6, _DWORD *a7, void *a8, void *a9)
{
  if (result)
  {
    uint64_t v16 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension")
      && !strcmp((const char *)(v16 + 48), "PathController")
      && *(_DWORD *)(v16 + 212) == 140)
    {
      uint64_t v17 = 0;
      while (1)
      {
        int v18 = *(_DWORD *)(v16 + 272 + 4 * v17);
        if (!v18 || v18 == a2) {
          break;
        }
        dispatch_queue_t result = 0;
        if (++v17 == 4) {
          return result;
        }
      }
      if (a3) {
        *a3 = *(unsigned char *)(v16 + 288) & 1;
      }
      if (a4) {
        *a4 = (*(unsigned char *)(v16 + 288) & 2) != 0;
      }
      if (a5) {
        *a5 = (*(unsigned char *)(v16 + 288) & 4) != 0;
      }
      if (a6) {
        *a6 = (*(unsigned char *)(v16 + 288) & 8) != 0;
      }
      if (a7) {
        *a7 = *(_DWORD *)(v16 + 4 * v17 + 256);
      }
      if (a8) {
        *a8 = v16 + 289;
      }
      if (a9) {
        *a9 = v16 + 321;
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const char *ne_session_stop_reason_to_string(int a1)
{
  if ((a1 - 1) > 0x28) {
    return "None";
  }
  else {
    return off_264195910[a1 - 1];
  }
}

xpc_object_t ne_copy_signing_identifier_for_pid(int a1)
{
  return ne_copy_signing_identifier_for_pid_with_audit_token(a1, 0);
}

void *ne_copy_signature_info_for_pid(int a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v2 = (unint64_t)ne_copy_signing_identifier_for_pid_with_audit_token(a1, 0);
  bytes[0] = 0;
  bytes[1] = 0;
  int v15 = 0;
  if (csops())
  {
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = __error();
      uint32_t v10 = strerror(*v9);
      v11[0] = 67109378;
      v11[1] = a1;
      __int16 v12 = 2080;
      unint64_t v13 = v10;
      _os_log_error_impl(&dword_212970000, v3, OS_LOG_TYPE_ERROR, "Failed to get the code directory hash for %d: %s", (uint8_t *)v11, 0x12u);
    }
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = (unint64_t)xpc_data_create(bytes, 0x14uLL);
  }
  if (!(v4 | v2)) {
    return 0;
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4) {
      xpc_dictionary_set_value(v5, "SourceAppUniqueIdentifier", (xpc_object_t)v4);
    }
    if (v2)
    {
      xpc_dictionary_set_value(v6, "SourceAppSigningIdentifier", (xpc_object_t)v2);
      if (!v4) {
        goto LABEL_17;
      }
LABEL_16:
      xpc_release((xpc_object_t)v4);
      goto LABEL_17;
    }
LABEL_15:
    if (!v4) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  int v7 = ne_log_obj();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    goto LABEL_15;
  }
  LOWORD(bytes[0]) = 0;
  _os_log_fault_impl(&dword_212970000, v7, OS_LOG_TYPE_FAULT, "xpc_dictionary_create failed", (uint8_t *)bytes, 2u);
  if (v4) {
    goto LABEL_16;
  }
LABEL_17:
  if (v2) {
    xpc_release((xpc_object_t)v2);
  }
  return v6;
}

void ne_force_reset_uuid_cache()
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  if (g_uuid_cache)
  {
    xpc_release((xpc_object_t)g_uuid_cache);
    g_uuid_cache = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
}

void *ne_copy_uuid_cache_locked()
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  getpid();
  if (!sandbox_check())
  {
    getpid();
    if (!sandbox_check())
    {
      int v3 = ne_uuid_cache_changed_cache_change_token;
      if (ne_uuid_cache_changed_cache_change_token == -1)
      {
        uint32_t v4 = notify_register_check("com.apple.networkextension.uuidcache", &ne_uuid_cache_changed_cache_change_token);
        if (v4)
        {
          uint32_t v5 = v4;
          ne_uuid_cache_changed_cache_change_token = -1;
          uint64_t v6 = ne_log_obj();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v5;
            _os_log_error_impl(&dword_212970000, v6, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", buf, 0x12u);
          }
        }
        int v3 = ne_uuid_cache_changed_cache_change_token;
      }
      uint64_t v7 = ne_uuid_cache_changed_cache_generation;
      *(void *)char v53 = ne_uuid_cache_changed_cache_generation;
      if (v3 < 0) {
        goto LABEL_17;
      }
      int check = 0;
      uint32_t v8 = notify_check(v3, &check);
      if (v8)
      {
        uint32_t v9 = v8;
        uint32_t v10 = ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
LABEL_15:
          notify_cancel(ne_uuid_cache_changed_cache_change_token);
          uint64_t v7 = 0;
          ne_uuid_cache_changed_cache_change_token = -1;
          *(void *)char v53 = 0;
          goto LABEL_16;
        }
        *(_DWORD *)long long buf = 136315650;
        *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = ne_uuid_cache_changed_cache_change_token;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v9;
        BOOL v20 = "Failed to check for changes to notification %s, token %d: %u";
LABEL_53:
        _os_log_error_impl(&dword_212970000, v10, OS_LOG_TYPE_ERROR, v20, buf, 0x18u);
        goto LABEL_15;
      }
      if (check)
      {
        uint32_t state = notify_get_state(ne_uuid_cache_changed_cache_change_token, (uint64_t *)v53);
        if (state)
        {
          uint32_t v19 = state;
          uint32_t v10 = ne_log_obj();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          *(_DWORD *)long long buf = 136315650;
          *(void *)&uint8_t buf[4] = "com.apple.networkextension.uuidcache";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = ne_uuid_cache_changed_cache_change_token;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v19;
          BOOL v20 = "Failed to get the state of notification %s, token %d: %u";
          goto LABEL_53;
        }
        uint64_t v7 = *(void *)v53;
      }
LABEL_16:
      if (v7 != ne_uuid_cache_changed_cache_generation)
      {
        size_t v11 = ne_log_obj();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
        uint64_t v13 = *(void *)v53;
        if (v12)
        {
          *(_DWORD *)long long buf = 134218240;
          *(void *)&uint8_t buf[4] = ne_uuid_cache_changed_cache_generation;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = *(void *)v53;
          _os_log_debug_impl(&dword_212970000, v11, OS_LOG_TYPE_DEBUG, "UUID cache generation changed from %llu to %llu", buf, 0x16u);
          uint64_t v13 = *(void *)v53;
        }
        ne_uuid_cache_changed_cache_generation = v13;
        g_ne_read_uuid_cache = 1;
        if (g_uuid_cache)
        {
          xpc_release((xpc_object_t)g_uuid_cache);
          g_uuid_cache = 0;
        }
        goto LABEL_23;
      }
LABEL_17:
      ne_uuid_cache_changed_cache_generation = v7;
      char v1 = (void *)g_uuid_cache;
      if (g_uuid_cache) {
        goto LABEL_51;
      }
      g_ne_read_uuid_cache = 1;
LABEL_23:
      int v14 = open("/Library/Preferences/com.apple.networkextension.uuidcache.plist", 0, "/Library/Preferences/com.apple.networkextension.uuidcache.plist");
      if (v14 < 0)
      {
        if (*__error() != 2 && *__error() != 1)
        {
          int v21 = *__error();
          if (strerror_r(v21, (char *)buf, 0x80uLL)) {
            buf[0] = 0;
          }
          size_t v22 = ne_log_obj();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)char v53 = 136315650;
            *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
            *(_WORD *)&v53[12] = 1024;
            *(_DWORD *)&v53[14] = v21;
            *(_WORD *)&v53[18] = 2080;
            *(void *)&v53[20] = buf;
            _os_log_fault_impl(&dword_212970000, v22, OS_LOG_TYPE_FAULT, "Failed to open %s: [%d] %s", v53, 0x1Cu);
          }
        }
LABEL_50:
        char v1 = (void *)g_uuid_cache;
        if (!g_uuid_cache) {
          return v1;
        }
LABEL_51:
        xpc_retain(v1);
        return v1;
      }
      int v15 = v14;
      memset(&v47, 0, sizeof(v47));
      if (fstat(v14, &v47))
      {
        int v16 = *__error();
        if (strerror_r(v16, (char *)buf, 0x80uLL)) {
          buf[0] = 0;
        }
        uint64_t v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)char v53 = 136315650;
          *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&v53[12] = 1024;
          *(_DWORD *)&v53[14] = v16;
          *(_WORD *)&v53[18] = 2080;
          *(void *)&v53[20] = buf;
          _os_log_fault_impl(&dword_212970000, v17, OS_LOG_TYPE_FAULT, "Failed to fstat %s: [%d] %s", v53, 0x1Cu);
        }
        goto LABEL_49;
      }
      st_size_t size = v47.st_size;
      if ((unint64_t)(v47.st_size - 131073) <= 0xFFFFFFFFFFFDFFFFLL)
      {
        uint64_t v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = st_size;
          xpc_object_t v25 = "%s size is 0 or is too big: %lu";
          uint64_t v26 = v24;
          uint32_t v27 = 22;
LABEL_67:
          _os_log_error_impl(&dword_212970000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
      uint64_t v28 = malloc_type_malloc(v47.st_size, 0x100004077774924uLL);
      if (!v28)
      {
        __int16 v33 = ne_log_obj();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)&uint8_t buf[4] = st_size;
          xpc_object_t v25 = "Failed to allocate %lu bytes";
          uint64_t v26 = v33;
          uint32_t v27 = 12;
          goto LABEL_67;
        }
LABEL_49:
        close(v15);
        goto LABEL_50;
      }
      unsigned int v29 = v28;
      ssize_t v30 = pread(v15, v28, st_size, 0);
      if (v30 != st_size)
      {
        ssize_t v34 = v30;
        int v35 = *__error();
        if (strerror_r(v35, (char *)buf, 0x80uLL)) {
          buf[0] = 0;
        }
        long long v36 = ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)char v53 = 136316162;
          *(void *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&v53[12] = 2048;
          *(void *)&v53[14] = v34;
          *(_WORD *)&v53[22] = 2048;
          *(void *)&v53[24] = st_size;
          *(_WORD *)&v53[32] = 1024;
          *(_DWORD *)&v53[34] = v35;
          __int16 v54 = 2080;
          int v55 = buf;
          _os_log_fault_impl(&dword_212970000, v36, OS_LOG_TYPE_FAULT, "Failed to read entire contents of %s, %ld != %lu: [%d] %s", v53, 0x30u);
        }
        goto LABEL_58;
      }
      uint64_t v31 = xpc_create_from_plist();
      if (!v31)
      {
LABEL_58:
        close(v15);
        free(v29);
        goto LABEL_50;
      }
      unint64_t v32 = (void *)v31;
      if (MEMORY[0x2166885F0]() != MEMORY[0x263EF8708])
      {
LABEL_46:
        xpc_release(v32);
        goto LABEL_58;
      }
      if (ne_copy_uuid_cache_locked_once_token != -1) {
        dispatch_once(&ne_copy_uuid_cache_locked_once_token, &__block_literal_global_157);
      }
      string = xpc_dictionary_get_string(v32, "os-version");
      if (string)
      {
        if (ne_copy_uuid_cache_locked_g_my_os_version)
        {
          long long v38 = string;
          if (strcmp(string, (const char *)ne_copy_uuid_cache_locked_g_my_os_version))
          {
            int v39 = ne_log_obj();
            if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_77;
            }
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = ne_copy_uuid_cache_locked_g_my_os_version;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = v38;
            unint64_t v40 = "Not using the UUID cache because the current OS version (%s) does not equal the cache OS version (%s)";
            p_int check = buf;
            uint64_t v42 = v39;
LABEL_76:
            _os_log_impl(&dword_212970000, v42, OS_LOG_TYPE_DEFAULT, v40, p_check, 0x16u);
LABEL_77:
            if (g_uuid_cache) {
              goto LABEL_58;
            }
            goto LABEL_46;
          }
        }
        else
        {
          unint64_t v43 = ne_log_obj();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_error_impl(&dword_212970000, v43, OS_LOG_TYPE_ERROR, "Failed to get the current OS version", buf, 2u);
          }
        }
      }
      memset(dst, 0, sizeof(dst));
      size_t length = 0;
      data = (const unsigned __int8 *)xpc_dictionary_get_data(v32, "boot-uuid", &length);
      if (length != 16
        || (uuid_copy(dst, data), uuid_is_null(ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
        || !uuid_compare(dst, ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
      {
        g_uuid_cache = (uint64_t)v32;
        goto LABEL_58;
      }
      memset(buf, 0, 37);
      memset(v53, 0, 37);
      uuid_unparse(ne_copy_uuid_cache_locked_g_my_boot_session_uuid, (char *)buf);
      uuid_unparse(dst, v53);
      BOOL v45 = ne_log_obj();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_77;
      }
      int check = 136315394;
      int v49 = buf;
      __int16 v50 = 2080;
      long long v51 = v53;
      unint64_t v40 = "Not using the UUID cache because the current boot session UUID (%s) does not equal the cache boot session UUID (%s)";
      p_int check = (uint8_t *)&check;
      uint64_t v42 = v45;
      goto LABEL_76;
    }
  }
  int v0 = ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_212970000, v0, OS_LOG_TYPE_DEFAULT, "UUID cache sandbox check failed", buf, 2u);
  }
  return 0;
}

void __ne_copy_uuid_cache_locked_block_invoke()
{
  ne_copy_uuid_cache_locked_g_my_os_version = (uint64_t)ne_session_copy_os_version_string();
  if (!ne_copy_uuid_cache_locked_g_my_os_version)
  {
    int v0 = ne_log_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_212970000, v0, OS_LOG_TYPE_FAULT, "Failed to get the current OS version", buf, 2u);
    }
  }
  if (!ne_session_get_boot_session_uuid(ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
  {
    char v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)unint64_t v2 = 0;
      _os_log_fault_impl(&dword_212970000, v1, OS_LOG_TYPE_FAULT, "Failed to get the boot session uuid", v2, 2u);
    }
  }
}

void *ne_session_copy_os_version_string()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  size_t v8 = 0;
  if (sysctlbyname("kern.osversion", 0, &v8, 0, 0))
  {
    int v0 = *__error();
    if (strerror_r(v0, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    char v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)uint32_t v10 = v0;
      *(_WORD *)&v10[4] = 2080;
      *(void *)&v10[6] = __strerrbuf;
      _os_log_fault_impl(&dword_212970000, v1, OS_LOG_TYPE_FAULT, "Failed to get the size of the kern.osversion sysctl value: [%d] %s", buf, 0x12u);
    }
  }
  else
  {
    uint32_t v4 = malloc_type_malloc(v8 + 1, 0xBD1E4F51uLL);
    if (v4)
    {
      unint64_t v2 = v4;
      bzero(v4, v8 + 1);
      if (!sysctlbyname("kern.osversion", v2, &v8, 0, 0)) {
        return v2;
      }
      int v5 = *__error();
      if (strerror_r(v5, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      uint64_t v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 134218498;
        *(void *)uint32_t v10 = v8;
        *(_WORD *)&v10[8] = 1024;
        *(_DWORD *)&v10[10] = v5;
        __int16 v11 = 2080;
        BOOL v12 = __strerrbuf;
        _os_log_fault_impl(&dword_212970000, v6, OS_LOG_TYPE_FAULT, "Failed to get the kern.osversion sysctl value (%lu bytes): [%d] %s", buf, 0x1Cu);
      }
      free(v2);
    }
    else
    {
      uint64_t v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrlong long buf = 134217984;
        size_t v14 = v8 + 1;
        _os_log_error_impl(&dword_212970000, v7, OS_LOG_TYPE_ERROR, "Failed to allocate %lu bytes for the version string", (uint8_t *)__strerrbuf, 0xCu);
      }
    }
  }
  return 0;
}

BOOL ne_session_get_boot_session_uuid(unsigned __int8 *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  memset(in, 0, sizeof(in));
  size_t v6 = 37;
  int v2 = sysctlbyname("kern.bootsessionuuid", in, &v6, 0, 0);
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    uint32_t v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 67109378;
      int v8 = v3;
      __int16 v9 = 2080;
      uint32_t v10 = __strerrbuf;
      _os_log_fault_impl(&dword_212970000, v4, OS_LOG_TYPE_FAULT, "Failed to get kern.bootsessionuuid: [%d] %s", buf, 0x12u);
    }
  }
  else
  {
    uuid_parse(in, a1);
  }
  return v2 == 0;
}

void *ne_copy_uuid_cache()
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  int v0 = ne_copy_uuid_cache_locked();
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  return v0;
}

xpc_object_t ne_copy_cached_uuids_for_bundle_identifier(const char *a1, int a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  g_ne_uuid_cache_hit = 0;
  uint32_t v4 = ne_copy_uuid_cache_locked();
  if (!v4)
  {
    xpc_object_t v8 = 0;
    goto LABEL_6;
  }
  int v5 = v4;
  uint64_t v6 = MEMORY[0x2166885F0]();
  uint64_t v7 = MEMORY[0x263EF8708];
  if (v6 != MEMORY[0x263EF8708]) {
    goto LABEL_3;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, "uuid-mappings");
  if (dictionary && (__int16 v11 = dictionary, MEMORY[0x2166885F0]() == v7))
  {
    xpc_object_t value = xpc_dictionary_get_value(v11, a1);
    if (value)
    {
      uint64_t v13 = value;
      uint64_t v14 = MEMORY[0x2166885F0]();
      uint64_t v15 = MEMORY[0x263EF86D8];
      if (v14 == MEMORY[0x263EF86D8])
      {
        if (!xpc_array_get_count(v13) && (a2 & 1) != 0) {
          goto LABEL_10;
        }
      }
      else if (a2)
      {
        goto LABEL_10;
      }
      if (MEMORY[0x2166885F0](v13) == v15)
      {
        xpc_object_t v8 = xpc_array_create(0, 0);
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 0x40000000;
        applier[2] = __ne_copy_cached_uuids_for_bundle_identifier_block_invoke;
        applier[3] = &__block_descriptor_tmp_162;
        applier[4] = v8;
        xpc_array_apply(v13, applier);
        g_ne_uuid_cache_hit = 1;
        goto LABEL_4;
      }
      goto LABEL_3;
    }
    if (a2) {
      goto LABEL_10;
    }
  }
  else if (a2)
  {
LABEL_10:
    xpc_object_t v8 = ne_copy_cached_synthesized_uuids_for_bundle_identifier_locked(a1, v5);
    goto LABEL_4;
  }
LABEL_3:
  xpc_object_t v8 = 0;
LABEL_4:
  xpc_release(v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  return v8;
}

xpc_object_t ne_copy_cached_synthesized_uuids_for_bundle_identifier_locked(const char *a1, void *a2)
{
  buffer[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = MEMORY[0x2166885F0](a2);
  uint64_t v5 = MEMORY[0x263EF8708];
  if (v4 == MEMORY[0x263EF8708])
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(a2, "synthesized-uuid-mappings");
    if (dictionary)
    {
      __int16 v9 = dictionary;
      if (MEMORY[0x2166885F0]() == v5)
      {
        xpc_object_t value = xpc_dictionary_get_value(v9, a1);
        xpc_object_t v6 = value;
        if (!value) {
          return v6;
        }
        if (MEMORY[0x2166885F0](value) == MEMORY[0x263EF86F8])
        {
          buffer[0] = 0;
          buffer[1] = 0;
          size_t bytes = xpc_data_get_bytes(v6, buffer, 0, 0x10uLL);
          size_t length = xpc_data_get_length(v6);
          xpc_object_t v6 = 0;
          if (bytes != length) {
            return v6;
          }
          xpc_object_t v13 = xpc_uuid_create((const unsigned __int8 *)buffer);
          if (v13)
          {
            uint64_t v14 = v13;
            xpc_object_t v6 = xpc_array_create(0, 0);
            xpc_array_append_value(v6, v14);
            xpc_release(v14);
            g_ne_uuid_cache_hit = 1;
            return v6;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t __ne_copy_cached_uuids_for_bundle_identifier_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  buffer[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (MEMORY[0x2166885F0](a3) == MEMORY[0x263EF86F8])
    {
      buffer[0] = 0;
      buffer[1] = 0;
      size_t bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL);
      if (bytes == xpc_data_get_length(a3))
      {
        xpc_object_t v6 = xpc_uuid_create((const unsigned __int8 *)buffer);
        if (v6)
        {
          uint64_t v7 = v6;
          xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v6);
          xpc_release(v7);
        }
      }
    }
  }
  return 1;
}

uint64_t ne_copy_cached_bundle_identifier_for_uuid(uint64_t a1)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000;
  uint64_t v17 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  g_ne_uuid_cache_hit = 0;
  int v2 = ne_copy_uuid_cache_locked();
  if (v2)
  {
    int v3 = v2;
    uint64_t v4 = MEMORY[0x2166885F0]();
    uint64_t v5 = MEMORY[0x263EF8708];
    if (v4 == MEMORY[0x263EF8708])
    {
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, "uuid-mappings");
      if (!dictionary) {
        goto LABEL_17;
      }
      uint64_t v7 = dictionary;
      if (MEMORY[0x2166885F0]() != v5
        || (v13[0] = MEMORY[0x263EF8330],
            v13[1] = 0x40000000,
            void v13[2] = __ne_copy_cached_bundle_identifier_for_uuid_block_invoke,
            v13[3] = &unk_264195340,
            v13[4] = &v14,
            void v13[5] = a1,
            xpc_dictionary_apply(v7, v13),
            !v15[3]))
      {
LABEL_17:
        if (MEMORY[0x2166885F0](v3) == v5
          && (xpc_object_t v11 = xpc_dictionary_get_dictionary(v3, "synthesized-uuid-mappings")) != 0
          && (BOOL v12 = v11, MEMORY[0x2166885F0]() == v5))
        {
          uint64_t v19 = 0;
          BOOL v20 = &v19;
          uint64_t v21 = 0x2000000000;
          uint64_t v22 = 0;
          applier[0] = MEMORY[0x263EF8330];
          applier[1] = 0x40000000;
          applier[2] = __ne_copy_cached_bundle_identifier_for_synthesized_uuid_locked_block_invoke;
          applier[3] = &unk_264195858;
          applier[4] = &v19;
          void applier[5] = a1;
          xpc_dictionary_apply(v12, applier);
          uint64_t v8 = v20[3];
          _Block_object_dispose(&v19, 8);
        }
        else
        {
          uint64_t v8 = 0;
        }
        v15[3] = v8;
      }
    }
    xpc_release(v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  uint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __ne_copy_cached_bundle_identifier_for_uuid_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  if (a3)
  {
    if (MEMORY[0x2166885F0](a3) == MEMORY[0x263EF86D8])
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 0x40000000;
      applier[2] = __ne_copy_cached_bundle_identifier_for_uuid_block_invoke_2;
      applier[3] = &__block_descriptor_tmp_163_304;
      applier[4] = *(void *)(a1 + 40);
      if (!xpc_array_apply(a3, applier))
      {
        xpc_object_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        if (!v6)
        {
LABEL_7:
          *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = xpc_string_create(a2);
          return 1;
        }
        size_t length = xpc_string_get_length(v6);
        if (strlen(a2) < length)
        {
          xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
          goto LABEL_7;
        }
      }
    }
  }
  return 1;
}

uint64_t __ne_copy_cached_bundle_identifier_for_synthesized_uuid_locked_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  buffer[2] = *MEMORY[0x263EF8340];
  if (!a3) {
    return 1;
  }
  if (MEMORY[0x2166885F0](a3) != MEMORY[0x263EF86F8]) {
    return 1;
  }
  buffer[0] = 0;
  buffer[1] = 0;
  size_t bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL);
  if (bytes != xpc_data_get_length(a3)
    || uuid_compare((const unsigned __int8 *)buffer, *(const unsigned __int8 **)(a1 + 40)))
  {
    return 1;
  }
  xpc_object_t v8 = xpc_string_create(a2);
  uint64_t result = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
  return result;
}

BOOL __ne_copy_cached_bundle_identifier_for_uuid_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  buffer[2] = *MEMORY[0x263EF8340];
  if (a3
    && MEMORY[0x2166885F0](a3) == MEMORY[0x263EF86F8]
    && (buffer[0] = 0,
        buffer[1] = 0,
        size_t bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL),
        bytes == xpc_data_get_length(a3)))
  {
    return uuid_compare((const unsigned __int8 *)buffer, *(const unsigned __int8 **)(a1 + 32)) != 0;
  }
  else
  {
    return 1;
  }
}

BOOL ne_session_is_safeboot()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  *(void *)uint64_t v4 = 0x4200000001;
  int v3 = 0;
  size_t v2 = 4;
  if (sysctl(v4, 2u, &v3, &v2, 0, 0)) {
    BOOL v0 = 1;
  }
  else {
    BOOL v0 = v3 == 0;
  }
  return !v0;
}

unsigned __int8 *ne_is_sockaddr_valid(unsigned __int8 *result, unint64_t a2)
{
  if (result)
  {
    int v2 = result[1];
    if (v2 == 30)
    {
      unint64_t v3 = *result;
      BOOL v4 = v3 > 0x1B;
    }
    else
    {
      if (v2 != 2) {
        return 0;
      }
      unint64_t v3 = *result;
      BOOL v4 = v3 > 0xF;
    }
    return (unsigned __int8 *)(v4 && v3 <= a2);
  }
  return result;
}

uint64_t ne_session_set_socket_tracker_attributes(int a1, char *__s, const char *a3, const char *a4)
{
  if (a1 == -1) {
    return 0;
  }
  BOOL v4 = a4;
  xpc_object_t v6 = __s;
  if (!__s && !a3 && !a4) {
    return 1;
  }
  if (!__s)
  {
    size_t v9 = 0;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  size_t v9 = strlen(__s) + 6;
  if (a3) {
LABEL_9:
  }
    v9 += strlen(a3) + 6;
LABEL_10:
  if (v4) {
    v9 += strlen(v4) + 6;
  }
  uint64_t result = (uint64_t)malloc_type_malloc(v9, 0x4CE0CA09uLL);
  if (result)
  {
    uint32_t v10 = (char *)result;
    bzero((void *)result, v9);
    uint64_t v11 = (uint64_t)v10;
    if (v6)
    {
      size_t v12 = strlen(v6);
      if (v12 >= 2)
      {
        size_t v13 = v12 - 1;
        if (v6[v12 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_231[v13] = 0;
          xpc_object_t v6 = ne_session_trim_domain_domain_buffer_231;
        }
      }
      int v14 = strlen(v6);
      *uint32_t v10 = 7;
      size_t v15 = (v14 + 1);
      *(_DWORD *)(v10 + 1) = v15;
      if (v14 == -1) {
        size_t v15 = 0;
      }
      else {
        memcpy(v10 + 5, v6, v15);
      }
      uint64_t v11 = (uint64_t)&v10[v15 + 5];
    }
    if (a3)
    {
      int v16 = strlen(a3);
      *(unsigned char *)uint64_t v11 = 11;
      size_t v17 = (v16 + 1);
      *(_DWORD *)(v11 + 1) = v17;
      if (v16 == -1) {
        size_t v17 = 0;
      }
      else {
        memcpy((void *)(v11 + 5), a3, v17);
      }
      v11 += v17 + 5;
    }
    if (v4)
    {
      size_t v18 = strlen(v4);
      if (v18 >= 2)
      {
        size_t v19 = v18 - 1;
        if (v4[v18 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_231[v19] = 0;
          BOOL v4 = ne_session_trim_domain_domain_buffer_231;
        }
      }
      int v20 = strlen(v4);
      *(unsigned char *)uint64_t v11 = 12;
      size_t v21 = (v20 + 1);
      *(_DWORD *)(v11 + 1) = v21;
      if (v20 != -1) {
        memcpy((void *)(v11 + 5), v4, v21);
      }
    }
    int v22 = setsockopt(a1, 0xFFFF, 4361, v10, v9);
    free(v10);
    return v22 == 0;
  }
  return result;
}

char *ne_session_set_socket_context_attribute(int a1, char *__s)
{
  if (a1 == -1) {
    return 0;
  }
  if (__s) {
    size_t v4 = strlen(__s) + 6;
  }
  else {
    size_t v4 = 5;
  }
  uint64_t result = (char *)malloc_type_malloc(v4, 0x5A28F707uLL);
  if (result)
  {
    xpc_object_t v6 = result;
    bzero(result, v4);
    if (__s)
    {
      int v7 = strlen(__s);
      *xpc_object_t v6 = 13;
      size_t v8 = (v7 + 1);
      *(_DWORD *)(v6 + 1) = v8;
      if (v7 != -1) {
        memcpy(v6 + 5, __s, v8);
      }
    }
    else
    {
      *xpc_object_t v6 = 13;
      *(_DWORD *)(v6 + 1) = 0;
    }
    int v9 = setsockopt(a1, 0xFFFF, 4361, v6, v4);
    free(v6);
    return (char *)(v9 == 0);
  }
  return result;
}

uint64_t ne_session_copy_socket_domain_attributes(int a1, void **a2, void **a3, void **a4, void **a5)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  bzero(v33, 0x300uLL);
  socklen_t v32 = 768;
  if (a1 == -1) {
    return 0;
  }
  if (a2 || a3 || a4)
  {
    if (!getsockopt(a1, 0xFFFF, 4361, v33, &v32))
    {
      if (a2 && v32)
      {
        uint64_t v12 = 0;
        int v13 = 0;
        while (1)
        {
          int v14 = &v33[v12];
          size_t v15 = *(unsigned int *)&v33[v12 + 1];
          if (v33[v12] == 7) {
            break;
          }
          uint64_t v12 = (v13 + v15 + 5);
          int v13 = v12;
          if (v12 >= v32) {
            goto LABEL_19;
          }
        }
        if (v15)
        {
          int v16 = malloc_type_calloc(v15 + 1, 1uLL, 0x100004077774924uLL);
          *a2 = v16;
          if (v16) {
            memcpy(v16, v14 + 5, v15);
          }
        }
        else
        {
          *a2 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_19:
      if (a3 && v32)
      {
        uint64_t v17 = 0;
        int v18 = 0;
        while (1)
        {
          size_t v19 = &v33[v17];
          size_t v20 = *(unsigned int *)&v33[v17 + 1];
          if (v33[v17] == 11) {
            break;
          }
          uint64_t v17 = (v18 + v20 + 5);
          int v18 = v17;
          if (v17 >= v32) {
            goto LABEL_29;
          }
        }
        if (v20)
        {
          size_t v21 = malloc_type_calloc(v20 + 1, 1uLL, 0x100004077774924uLL);
          *a3 = v21;
          if (v21) {
            memcpy(v21, v19 + 5, v20);
          }
        }
        else
        {
          *a3 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_29:
      if (a4 && v32)
      {
        uint64_t v22 = 0;
        int v23 = 0;
        while (1)
        {
          uint64_t v24 = &v33[v22];
          size_t v25 = *(unsigned int *)&v33[v22 + 1];
          if (v33[v22] == 12) {
            break;
          }
          uint64_t v22 = (v23 + v25 + 5);
          int v23 = v22;
          if (v22 >= v32) {
            goto LABEL_39;
          }
        }
        if (v25)
        {
          uint64_t v26 = malloc_type_calloc(v25 + 1, 1uLL, 0x100004077774924uLL);
          *a4 = v26;
          if (v26) {
            memcpy(v26, v24 + 5, v25);
          }
        }
        else
        {
          *a4 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_39:
      if (a5 && v32)
      {
        uint64_t v27 = 0;
        int v28 = 0;
        while (1)
        {
          unsigned int v29 = &v33[v27];
          size_t v30 = *(unsigned int *)&v33[v27 + 1];
          if (v33[v27] == 13) {
            break;
          }
          uint64_t v27 = (v28 + v30 + 5);
          uint64_t v10 = 1;
          int v28 = v27;
          if (v27 >= v32) {
            return v10;
          }
        }
        if (!v30)
        {
          uint64_t v10 = 1;
          *a5 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
          return v10;
        }
        uint64_t v31 = malloc_type_calloc(v30 + 1, 1uLL, 0x100004077774924uLL);
        *a5 = v31;
        if (!v31) {
          return 1;
        }
        memcpy(v31, v29 + 5, v30);
      }
      return 1;
    }
    return 0;
  }
  return 1;
}

void ne_session_clear_caches()
{
  ne_force_reset_uuid_cache();
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_cache_notify_token != -1)
  {
    notify_cancel(_ne_session_cache_notify_token);
    _ne_session_cache_notify_token = -1;
  }
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }

  os_unfair_lock_unlock(&_ne_session_cache_lock);
}

CFMutableDictionaryRef init_app_cache(CFMutableDictionaryRef result, CFIndex capacity)
{
  if (result)
  {
    CFMutableDictionaryRef v2 = result;
    *(_DWORD *)uint64_t result = capacity;
    uint64_t result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], capacity, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *((void *)v2 + 3) = 0;
    CFMutableDictionaryRef v2 = (CFMutableDictionaryRef)((char *)v2 + 24);
    *((void *)v2 - 2) = result;
    *((_DWORD *)v2 - 2) = 0;
    *((void *)v2 + 1) = v2;
  }
  return result;
}

void dealloc_app_cache(uint64_t a1)
{
  if (a1)
  {
    while (CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8)))
      dealloc_appdata_node(a1, **(uint64_t ***)(*(void *)(a1 + 32) + 8));
    CFMutableDictionaryRef v2 = *(const void **)(a1 + 8);
    CFRelease(v2);
  }
}

void dealloc_appdata_node(uint64_t a1, uint64_t *a2)
{
  if (a1 && a2)
  {
    uint64_t v3 = *a2;
    size_t v4 = (void *)a2[1];
    if (*a2)
    {
      *(void *)(v3 + 8) = v4;
      size_t v4 = (void *)a2[1];
    }
    else
    {
      *(void *)(a1 + 32) = v4;
    }
    *size_t v4 = v3;
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), (const void *)a2[2]);
    CFRelease((CFTypeRef)a2[3]);
    free(a2);
  }
}

void *add_appdata_node(void *result, void *a2)
{
  if (result && a2)
  {
    uint64_t v2 = result[3];
    result += 3;
    *a2 = v2;
    uint64_t v3 = (void *)(v2 + 8);
    if (v2) {
      size_t v4 = v3;
    }
    else {
      size_t v4 = result + 1;
    }
    *size_t v4 = a2;
    *uint64_t result = a2;
    a2[1] = result;
  }
  return result;
}

uint64_t remove_appdata_node(uint64_t result, uint64_t *a2)
{
  if (result && a2)
  {
    uint64_t v2 = *a2;
    uint64_t v3 = (void *)a2[1];
    if (*a2)
    {
      *(void *)(v2 + 8) = v3;
      uint64_t v3 = (void *)a2[1];
    }
    else
    {
      *(void *)(result + 32) = v3;
    }
    *uint64_t v3 = v2;
  }
  return result;
}

uint64_t **move_node_to_front(uint64_t **result, uint64_t *a2)
{
  if (result && a2)
  {
    uint64_t v2 = *a2;
    uint64_t v3 = (uint64_t *)a2[1];
    if (*a2)
    {
      *(void *)(v2 + 8) = v3;
      uint64_t v3 = (uint64_t *)a2[1];
    }
    else
    {
      result[4] = v3;
    }
    *uint64_t v3 = v2;
    size_t v4 = result[3];
    result += 3;
    *a2 = (uint64_t)v4;
    uint64_t v5 = (uint64_t **)(v4 + 1);
    if (v4) {
      xpc_object_t v6 = v5;
    }
    else {
      xpc_object_t v6 = result + 1;
    }
    *xpc_object_t v6 = a2;
    *uint64_t result = a2;
    a2[1] = (uint64_t)result;
  }
  return result;
}

void *alloc_appdata_node(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t result = malloc_type_malloc(0x20uLL, 0xE0040B6E8BBF2uLL);
    if (result)
    {
      result[2] = a1;
      result[3] = a2;
    }
  }
  return result;
}

void myCFRelease(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

CFTypeRef myCFRetain(CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  return cf;
}

void myCFReplace(CFTypeRef *a1, CFTypeRef cf)
{
  if (a1)
  {
    if (cf) {
      CFTypeRef v3 = CFRetain(cf);
    }
    else {
      CFTypeRef v3 = 0;
    }
    if (*a1) {
      CFRelease(*a1);
    }
    *a1 = v3;
  }
}

uint64_t myCFEqual(unint64_t cf1, unint64_t a2)
{
  if (!(cf1 | a2)) {
    return 1;
  }
  uint64_t result = 0;
  if (cf1)
  {
    if (a2) {
      return CFEqual((CFTypeRef)cf1, (CFTypeRef)a2);
    }
  }
  return result;
}

void myCFDataReleaseReset(CFDataRef *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(v2);
      if (MutableBytePtr)
      {
        size_t v4 = MutableBytePtr;
        rsize_t Length = CFDataGetLength(*a1);
        rsize_t v6 = CFDataGetLength(*a1);
        memset_s(v4, Length, 0, v6);
      }
      CFRelease(*a1);
      *a1 = 0;
    }
  }
}

__CFData *myCFDataCreateMutableCopy(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  CFTypeRef v3 = 0;
  if (a2)
  {
    if (a3)
    {
      Mutable = CFDataCreateMutable(a1, 0);
      CFTypeRef v3 = Mutable;
      if (Mutable) {
        CFDataAppendBytes(Mutable, a2, a3);
      }
    }
  }
  return v3;
}

CFDataRef myCFDataCreateMutableCopyOfData(const __CFData *theData)
{
  if (theData)
  {
    theData = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, theData);
    if (!theData)
    {
      char v1 = ne_log_obj();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v2 = 0;
        _os_log_fault_impl(&dword_212970000, v1, OS_LOG_TYPE_FAULT, "CFDataCreateMutableCopy failed", v2, 2u);
      }
      return 0;
    }
  }
  return theData;
}

void myCFDataResetReplace(CFDataRef *a1, CFDataRef theData)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFDataRef MutableCopyOfData = myCFDataCreateMutableCopyOfData(theData);
    myCFDataReleaseReset(a1);
    *a1 = MutableCopyOfData;
  }
  else
  {
    size_t v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      rsize_t v6 = "myCFDataResetReplace";
      _os_log_fault_impl(&dword_212970000, v4, OS_LOG_TYPE_FAULT, "%s called with null oldP", (uint8_t *)&v5, 0xCu);
    }
  }
}

__CFData *myCFDataCreateMutableFromString(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  if (!CFStringGetLength(a1)) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  size_t v4 = (char *)malloc_type_malloc(v3, 0xD053E110uLL);
  if (!v4) {
    return 0;
  }
  int v5 = (UInt8 *)v4;
  CFStringGetCString(a1, v4, v3, 0x8000100u);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFIndex v7 = CFStringGetLength(a1);
  MutableCopy = myCFDataCreateMutableCopy(v6, v5, v7);
  memset_s(v5, v3, 0, v3);
  free(v5);
  return MutableCopy;
}

void myCFDataResetReplaceFromString(CFDataRef *a1, CFStringRef theString)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a1)
  {
    CFStringRef MutableCopy = theString;
    if (theString)
    {
      if (CFStringGetLength(theString) >= 1)
      {
        CFIndex Length = CFStringGetLength(MutableCopy);
        CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
        CFAllocatorRef v6 = (char *)malloc_type_malloc(v5, 0x4DB6B145uLL);
        if (v6)
        {
          CFIndex v7 = (UInt8 *)v6;
          CFStringGetCString(MutableCopy, v6, v5, 0x8000100u);
          CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          CFIndex v9 = CFStringGetLength(MutableCopy);
          CFStringRef MutableCopy = (const __CFString *)myCFDataCreateMutableCopy(v8, v7, v9);
          memset_s(v7, v5, 0, v5);
          free(v7);
          goto LABEL_9;
        }
        uint64_t v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          int v12 = 67109120;
          LODWORD(v13) = v5;
          _os_log_fault_impl(&dword_212970000, v10, OS_LOG_TYPE_FAULT, "malloc(%u) failed", (uint8_t *)&v12, 8u);
        }
      }
      CFStringRef MutableCopy = 0;
    }
LABEL_9:
    myCFDataReleaseReset(a1);
    *a1 = (CFDataRef)MutableCopy;
    return;
  }
  uint64_t v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    int v12 = 136315138;
    int v13 = "myCFDataResetReplaceFromString";
    _os_log_fault_impl(&dword_212970000, v11, OS_LOG_TYPE_FAULT, "%s called with null oldP", (uint8_t *)&v12, 0xCu);
  }
}

const void *NEIsValidCFType(const void *result, uint64_t a2)
{
  if (result) {
    return (const void *)(CFGetTypeID(result) == a2);
  }
  return result;
}

const void *NEGetValueWithType(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFIndex v3 = 0;
  if (a1)
  {
    if (a2)
    {
      CFDataRef Value = CFDictionaryGetValue(a1, a2);
      if (!Value) {
        return 0;
      }
      CFIndex v3 = Value;
      if (CFGetTypeID(Value) != a3) {
        return 0;
      }
    }
  }
  return v3;
}

void NEInitCFTypes()
{
  if (NEInitCFTypes_onceToken != -1) {
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_321);
  }
}

CFTypeID __NEInitCFTypes_block_invoke()
{
  CFSTRING_TYPE = CFStringGetTypeID();
  CFNUMBER_TYPE = CFNumberGetTypeID();
  CFBOOLEAN_TYPE = CFBooleanGetTypeID();
  CFARRAY_TYPE = CFArrayGetTypeID();
  CFDICTIONARY_TYPE = CFDictionaryGetTypeID();
  CFTypeID result = CFDataGetTypeID();
  CFDATA_TYPE = result;
  return result;
}

void *NEMapIntegerToString(void *result, int a2)
{
  if (result)
  {
    uint64_t v2 = result;
    CFTypeID result = (void *)*result;
    if (result)
    {
      CFIndex v3 = v2 + 2;
      do
      {
        if (*((_DWORD *)v3 - 2) == a2) {
          break;
        }
        size_t v4 = (void *)*v3;
        v3 += 2;
        CFTypeID result = v4;
      }
      while (v4);
    }
  }
  return result;
}

const void **NEMapStringToInteger(const void **result, CFTypeRef cf1)
{
  if (result)
  {
    CFIndex v3 = result;
    size_t v4 = *result;
    if (*result)
    {
      while (!cf1 || !CFEqual(cf1, v4))
      {
        CFIndex v5 = v3[2];
        v3 += 2;
        size_t v4 = v5;
        if (!v5) {
          return 0;
        }
      }
      return (const void **)*((unsigned int *)v3 + 2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t NEInChecksum(unsigned __int16 *a1, int a2)
{
  if (a2 < 2)
  {
    unsigned int v2 = 0;
  }
  else
  {
    unsigned int v2 = 0;
    unsigned int v3 = a2;
    do
    {
      int v4 = *a1++;
      v2 += v4;
      a2 = v3 - 2;
      BOOL v5 = v3 > 3;
      v3 -= 2;
    }
    while (v5);
  }
  if (a2 == 1) {
    v2 += *(unsigned __int8 *)a1;
  }
  return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
}

void *NECreateAddressStructFromString(const __CFString *a1, uint64_t a2, uint64_t a3)
{
  int v16 = 0;
  if (!a1) {
    return 0;
  }
  CFIndex v6 = CFStringGetLength(a1) + 1;
  CFIndex v7 = (char *)malloc_type_malloc(v6, 0xEFF596B0uLL);
  CFStringGetCString(a1, v7, v6, 0x600u);
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (a2) {
    CFStringRef v9 = CFStringCreateWithFormat(v8, 0, @"%@", a2);
  }
  else {
    CFStringRef v9 = CFStringCreateWithFormat(v8, 0, @"%d", a3);
  }
  CFStringRef v11 = v9;
  CFIndex v12 = CFStringGetLength(v9) + 1;
  int v13 = (char *)malloc_type_malloc(v12, 0x3A484EECuLL);
  CFStringGetCString(v11, v13, v12, 0x600u);
  CFRelease(v11);
  memset(&v17, 0, sizeof(v17));
  v17.ai_socktype = 2;
  v17.ai_flags = 4;
  if (getaddrinfo(v7, v13, &v17, &v16))
  {
    uint64_t v10 = 0;
    if (!v7) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v10 = malloc_type_malloc(0x80uLL, 0x1000040AE2C30F4uLL);
    size_t v15 = v16;
    if (v10) {
      __memcpy_chk();
    }
    freeaddrinfo(v15);
    if (!v7) {
      goto LABEL_9;
    }
  }
  free(v7);
LABEL_9:
  if (v13) {
    free(v13);
  }
  return v10;
}

CFStringRef NEGetAddressFamilyFromString(CFStringRef theString)
{
  CFStringRef v1 = theString;
  uint64_t v16 = *MEMORY[0x263EF8340];
  CFIndex v6 = 0;
  if (theString)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
    CFIndex v2 = CFStringGetLength(theString) + 1;
    unsigned int v3 = (char *)malloc_type_malloc(v2, 0xD62D3ECEuLL);
    CFStringGetCString(v1, v3, v2, 0x600u);
    memset(&v7, 0, sizeof(v7));
    v7.ai_socktype = 2;
    v7.ai_flags = 4;
    if (!getaddrinfo(v3, 0, &v7, &v6))
    {
      BOOL v5 = v6;
      __memcpy_chk();
      freeaddrinfo(v5);
      CFStringRef v1 = (const __CFString *)BYTE1(v8);
      if (!v3) {
        return v1;
      }
      goto LABEL_4;
    }
    CFStringRef v1 = 0;
    if (v3) {
LABEL_4:
    }
      free(v3);
  }
  return v1;
}

CFDataRef NECreateAddressDataFromString(const __CFString *a1, const __CFString *a2, int *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v14 = 0;
  if (!a1) {
    return 0;
  }
  memset(v16, 0, sizeof(v16));
  CFIndex v6 = CFStringGetLength(a1) + 1;
  addrinfo v7 = (char *)malloc_type_malloc(v6, 0x3A9DCF8DuLL);
  CFStringGetCString(a1, v7, v6, 0x600u);
  if (a2)
  {
    CFIndex v8 = CFStringGetLength(a2) + 1;
    long long v9 = (char *)malloc_type_malloc(v8, 0x565B4E30uLL);
    CFStringGetCString(a2, v9, v8, 0x600u);
  }
  else
  {
    long long v9 = 0;
  }
  memset(&v15, 0, sizeof(v15));
  v15.ai_socktype = 2;
  v15.ai_flags = 4;
  if (getaddrinfo(v7, v9, &v15, &v14)) {
    goto LABEL_7;
  }
  long long v12 = v14;
  __memcpy_chk();
  freeaddrinfo(v12);
  if (BYTE1(v16[0]) == 30)
  {
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v16 + 8, 16);
    if (!a3) {
      goto LABEL_8;
    }
    int v13 = 30;
    goto LABEL_19;
  }
  if (BYTE1(v16[0]) == 2)
  {
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)v16 + 4, 4);
    if (!a3) {
      goto LABEL_8;
    }
    int v13 = 2;
LABEL_19:
    *a3 = v13;
    goto LABEL_8;
  }
LABEL_7:
  CFDataRef v10 = 0;
LABEL_8:
  if (v7) {
    free(v7);
  }
  if (v9) {
    free(v9);
  }
  return v10;
}

CFDataRef NECreateAddressStructDataFromString(const __CFString *a1, const __CFString *a2, int *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v14 = 0;
  if (!a1) {
    return 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)size_t bytes = 0u;
  CFIndex v6 = CFStringGetLength(a1) + 1;
  addrinfo v7 = (char *)malloc_type_malloc(v6, 0x967EDE5BuLL);
  CFStringGetCString(a1, v7, v6, 0x600u);
  if (a2)
  {
    CFIndex v8 = CFStringGetLength(a2) + 1;
    long long v9 = (char *)malloc_type_malloc(v8, 0xE155708FuLL);
    CFStringGetCString(a2, v9, v8, 0x600u);
  }
  else
  {
    long long v9 = 0;
  }
  memset(&v15, 0, sizeof(v15));
  v15.ai_socktype = 2;
  v15.ai_flags = 4;
  if (!getaddrinfo(v7, v9, &v15, &v14))
  {
    long long v11 = v14;
    __memcpy_chk();
    freeaddrinfo(v11);
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 128);
    int v12 = bytes[1];
    if (bytes[1] == 2)
    {
      if (!a3) {
        goto LABEL_14;
      }
      int v12 = 2;
    }
    else if (!a3 || bytes[1] != 30)
    {
      goto LABEL_14;
    }
    *a3 = v12;
    goto LABEL_14;
  }
  CFDataRef v10 = 0;
LABEL_14:
  if (v7) {
    free(v7);
  }
  if (v9) {
    free(v9);
  }
  return v10;
}

CFStringRef NECreateAddressString(CFStringRef result)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (result)
  {
    int v1 = BYTE1(result->isa);
    if (v1 == 30)
    {
      if (LOBYTE(result->isa) >= 0x1Cu)
      {
        p_info = &result->info;
        int v3 = 30;
        goto LABEL_8;
      }
    }
    else if (v1 == 2 && LOBYTE(result->isa) >= 0x10u)
    {
      p_info = (uint64_t *)((char *)&result->isa + 4);
      int v3 = 2;
LABEL_8:
      inet_ntop(v3, p_info, cStr, 0x40u);
      return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x600u);
    }
    return 0;
  }
  return result;
}

__CFString *NECreateAddressStringWithPort(uint64_t a1)
{
  CFStringRef v2 = NECreateAddressString((CFStringRef)a1);
  if (!v2) {
    return 0;
  }
  CFStringRef v3 = v2;
  CFStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, v2);
  CFRelease(v3);
  int v5 = *(unsigned __int8 *)(a1 + 1);
  if (v5 == 30)
  {
    CFStringRef v6 = @".%u";
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    CFStringRef v6 = @":%u";
LABEL_7:
    CFStringAppendFormat(MutableCopy, 0, v6, bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16);
  }
  return MutableCopy;
}

uint64_t NEGetPortFromAddress(uint64_t result)
{
  if (result)
  {
    int v1 = *(unsigned __int8 *)(result + 1);
    if (v1 == 30 || v1 == 2) {
      unsigned int v2 = *(unsigned __int16 *)(result + 2);
    }
    else {
      unsigned int v2 = 0;
    }
    return __rev16(v2);
  }
  return result;
}

CFStringRef NECreateAddressStringFromBuffer(CFStringRef result, unint64_t a2, int a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (result)
  {
    CFStringRef v3 = result;
    if (a2 >= 4 && a3 == 2)
    {
      int v4 = 2;
LABEL_8:
      inet_ntop(v4, v3, cStr, 0x40u);
      return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x600u);
    }
    CFTypeID result = 0;
    if (a2 >= 0x10 && a3 == 30)
    {
      int v4 = 30;
      goto LABEL_8;
    }
  }
  return result;
}

CFStringRef NECreateIPv4AddressMaskStringFromPrefix(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1 > 32) {
    return 0;
  }
  int __b = 0;
  if (a1 < 8)
  {
    size_t v3 = 0;
  }
  else
  {
    size_t v3 = (a1 >> 3) - 1 + 1;
    memset(&__b, 255, v3);
  }
  if (a1 <= 0) {
    int v4 = -(-a1 & 7);
  }
  else {
    int v4 = a1 & 7;
  }
  if (v4) {
    cStr[v3 - 4] = 0xFF00u >> v4;
  }
  inet_ntop(2, &__b, cStr, 0x40u);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x600u);
}

CFStringRef NECreateIPv6AddressMaskStringFromPrefix(int a1)
{
  size_t v2 = 0;
  uint64_t v7 = *MEMORY[0x263EF8340];
  __b[0] = 0;
  __b[1] = 0;
  if (a1 >= 8)
  {
    size_t v2 = (a1 >> 3) - 1 + 1;
    memset(__b, 255, v2);
  }
  if (a1 <= 0) {
    int v3 = -(-a1 & 7);
  }
  else {
    int v3 = a1 & 7;
  }
  if (v3) {
    *((unsigned char *)__b + v2) = 0xFF00u >> v3;
  }
  inet_ntop(30, __b, cStr, 0x40u);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x600u);
}

CFStringRef NECreateIPv6SubnetAddressWithPrefix(const __CFString *a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFStringRef v3 = NECreateIPv6AddressMaskStringFromPrefix(a2);
  int v4 = NECreateAddressStructFromString(v3, 0, 0);
  int v5 = NECreateAddressStructFromString(a1, 0, 0);
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    if (v4[1] == 30 && *((unsigned char *)v5 + 1) == 30)
    {
      uint64_t v7 = 0;
      v10[0] = 0;
      v10[1] = 0;
      do
      {
        *((unsigned char *)v10 + v7) = v4[v7 + 8] & *((unsigned char *)v5 + v7 + 8);
        ++v7;
      }
      while (v7 != 16);
      inet_ntop(30, v10, cStr, 0x40u);
      CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x600u);
    }
    else
    {
      CFStringRef v8 = 0;
    }
  }
  else
  {
    CFStringRef v8 = 0;
    if (!v4)
    {
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  free(v4);
  if (v6) {
LABEL_10:
  }
    free(v6);
LABEL_11:
  if (v3) {
    CFRelease(v3);
  }
  return v8;
}

void NESetValueIfPresent(const __CFDictionary *a1, __CFDictionary *a2, void *key)
{
  if (a1 && a2 && key && CFDictionaryContainsKey(a1, key))
  {
    CFDataRef Value = CFDictionaryGetValue(a1, key);
    CFDictionarySetValue(a2, key, Value);
  }
}

void NEAddDateToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (a1)
  {
    if (a2)
    {
      CFDateRef v5 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (double)a3 - *MEMORY[0x263EFFAF8]);
      if (v5)
      {
        CFDateRef v6 = v5;
        CFDictionaryAddValue(a1, a2, v5);
        CFRelease(v6);
      }
    }
  }
}

void NEAddIntToDictionary(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  if (a1 && a2)
  {
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionaryAddValue(a1, a2, v5);
      CFRelease(v6);
    }
  }
}

void NEAddInt64ToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  if (a1 && a2)
  {
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionaryAddValue(a1, a2, v5);
      CFRelease(v6);
    }
  }
}

void NEAddIntToArray(__CFArray *a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFArrayAppendValue(a1, v3);
      CFRelease(v4);
    }
  }
}

uint64_t NEGetIntFromDictionary(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int valuePtr = a3;
  if (a1)
  {
    if (a2)
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

uint64_t NEGetIntFromArray(const __CFArray *a1, CFIndex a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned int valuePtr = a3;
  if (a1)
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, a2);
    if (ValueAtIndex)
    {
      CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
  }
  return v3;
}

void NEAddAddressToDictionary(__CFDictionary *a1, const void *a2, unsigned __int8 *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1 && a2 && a3)
  {
    int v5 = a3[1];
    if (v5 == 30)
    {
      CFNumberRef v6 = a3 + 8;
      int v7 = 30;
    }
    else
    {
      if (v5 != 2) {
        return;
      }
      CFNumberRef v6 = a3 + 4;
      int v7 = 2;
    }
    inet_ntop(v7, v6, cStr, 0x40u);
    CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x600u);
    if (v8)
    {
      CFStringRef v9 = v8;
      CFDictionaryAddValue(a1, a2, v8);
      CFRelease(v9);
    }
  }
}

void NEAddPortToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        int v3 = *(unsigned __int8 *)(a3 + 1);
        if (v3 == 30 || v3 == 2) {
          NEAddIntToDictionary(a1, a2, bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16);
        }
      }
    }
  }
}

uint64_t NEGetPrefixForAddressRange(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1 || !a2) {
    return result;
  }
  int v4 = *(unsigned __int8 *)(a1 + 1);
  if (v4 != *(unsigned __int8 *)(a2 + 1)) {
    return 0xFFFFFFFFLL;
  }
  if (v4 == 30)
  {
    uint64_t v11 = 0;
    uint64_t v12 = (long long *)(a1 + 8);
    long long v13 = *(_OWORD *)(a1 + 8);
    long long v53 = *(_OWORD *)(a2 + 8);
    long long v54 = v13;
    uint64_t result = 32;
    while (1)
    {
      unsigned int v14 = *(_DWORD *)((char *)&v54 + v11);
      unsigned int v15 = *(_DWORD *)((char *)&v53 + v11);
      if (v14 != v15) {
        break;
      }
      v11 += 4;
      result += 32;
      if (v11 == 16)
      {
        uint64_t result = 128;
        goto LABEL_20;
      }
    }
    unsigned int v21 = bswap32(v15);
    unsigned int v22 = bswap32(v14);
    do
    {
      v22 >>= 1;
      BOOL v20 = v22 == v21 >> 1;
      v21 >>= 1;
      --result;
    }
    while (!v20);
LABEL_20:
    uint64_t v23 = 0;
    long long v24 = *v12;
    long long v53 = *(_OWORD *)(a2 + 8);
    long long v54 = v24;
    unint64_t v25 = 32 - result;
    for (unint64_t i = result; ; i -= 32)
    {
      if (!i)
      {
        if (*((_DWORD *)&v54 + v23) || *((_DWORD *)&v53 + v23) != -1) {
          return 0xFFFFFFFFLL;
        }
        return result;
      }
      if (i <= 0x1F) {
        break;
      }
      ++v23;
      v25 += 32;
      if (v23 == 4) {
        return result;
      }
    }
    if (v25 <= 1) {
      unint64_t v25 = 1;
    }
    uint64_t v27 = v25 - 1;
    unint64_t v28 = (v25 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    int64x2_t v29 = (int64x2_t)xmmword_2129A0160;
    int64x2_t v30 = (int64x2_t)xmmword_2129A0170;
    int32x4_t v31 = (int32x4_t)xmmword_2129A0180;
    int32x4_t v32 = 0uLL;
    v33.i64[0] = 0x100000001;
    v33.i64[1] = 0x100000001;
    int64x2_t v34 = vdupq_n_s64(4uLL);
    v35.i64[0] = 0x400000004;
    v35.i64[1] = 0x400000004;
    do
    {
      int8x16_t v36 = (int8x16_t)v32;
      uint64x2_t v37 = (uint64x2_t)v29;
      uint64x2_t v38 = (uint64x2_t)v30;
      int32x4_t v32 = vaddq_s32((int32x4_t)vshlq_u32(v33, (uint32x4_t)v31), v32);
      int64x2_t v29 = vaddq_s64(v29, v34);
      int64x2_t v30 = vaddq_s64(v30, v34);
      int32x4_t v31 = vaddq_s32(v31, v35);
      v28 -= 4;
    }
    while (v28);
    uint64x2_t v39 = (uint64x2_t)vdupq_lane_s64(v27, 0);
    int v40 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v38, v39), (int32x4_t)vcgtq_u64(v37, v39)), v36, (int8x16_t)v32));
    if ((bswap32(*((_DWORD *)&v54 + v23)) & v40) == 0
      && (v40 & ~bswap32(*((_DWORD *)&v53 + v23))) == 0)
    {
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  if (v4 != 2) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v5 = *(_DWORD *)(a1 + 4);
  unsigned int v6 = bswap32(v5);
  unsigned int v7 = *(_DWORD *)(a2 + 4);
  unsigned int v8 = bswap32(v7);
  if (v5 == v7)
  {
    int v9 = 0;
    unsigned int v10 = 32;
  }
  else
  {
    uint64_t v16 = -3;
    unsigned int v17 = v8;
    unsigned int v18 = v6;
    do
    {
      uint64_t v19 = v16;
      v18 >>= 1;
      BOOL v20 = v18 == v17 >> 1;
      v17 >>= 1;
      --v16;
    }
    while (!v20);
    unsigned int v10 = v19 + 34;
    if (v19 == -2)
    {
      int v9 = 0;
    }
    else
    {
      int64x2_t v41 = (int64x2_t)xmmword_2129A0160;
      int64x2_t v42 = (int64x2_t)xmmword_2129A0170;
      int32x4_t v43 = (int32x4_t)xmmword_2129A0180;
      unint64_t v44 = -v16 & 0xFFFFFFFFFFFFFFFCLL;
      int32x4_t v45 = 0uLL;
      v46.i64[0] = 0x100000001;
      v46.i64[1] = 0x100000001;
      int64x2_t v47 = vdupq_n_s64(4uLL);
      v48.i64[0] = 0x400000004;
      v48.i64[1] = 0x400000004;
      do
      {
        int8x16_t v49 = (int8x16_t)v45;
        uint64x2_t v50 = (uint64x2_t)v41;
        uint64x2_t v51 = (uint64x2_t)v42;
        int32x4_t v45 = vaddq_s32((int32x4_t)vshlq_u32(v46, (uint32x4_t)v43), v45);
        int64x2_t v41 = vaddq_s64(v41, v47);
        int64x2_t v42 = vaddq_s64(v42, v47);
        int32x4_t v43 = vaddq_s32(v43, v48);
        v44 -= 4;
      }
      while (v44);
      uint64x2_t v52 = (uint64x2_t)vdupq_lane_s64(-3 - v19, 0);
      int v9 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v51, v52), (int32x4_t)vcgtq_u64(v50, v52)), v49, (int8x16_t)v45));
    }
  }
  if (((v6 | ~v8) & v9) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v10;
  }
}

uint64_t NEGetPrefixForAddressRangeStrings(const __CFString *a1, const __CFString *a2)
{
  int v3 = NECreateAddressStructFromString(a1, 0, 0);
  int v4 = NECreateAddressStructFromString(a2, 0, 0);
  uint64_t v5 = NEGetPrefixForAddressRange((uint64_t)v3, (uint64_t)v4);
  if (v3) {
    free(v3);
  }
  if (v4) {
    free(v4);
  }
  return v5;
}

uint64_t NEGetPrefixForIPv4NetmaskString(const __CFString *a1)
{
  int v1 = NECreateAddressStructFromString(a1, 0, 0);
  size_t v2 = NECreateAddressStructFromString(@"255.255.255.255", 0, 0);
  uint64_t v3 = NEGetPrefixForAddressRange((uint64_t)v1, (uint64_t)v2);
  if (v1) {
    free(v1);
  }
  if (v2) {
    free(v2);
  }
  return v3;
}

uint64_t NEGetPrefixForIPv6NetmaskString(const __CFString *a1)
{
  int v1 = NECreateAddressStructFromString(a1, 0, 0);
  size_t v2 = NECreateAddressStructFromString(@"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 0, 0);
  uint64_t v3 = NEGetPrefixForAddressRange((uint64_t)v1, (uint64_t)v2);
  if (v1) {
    free(v1);
  }
  if (v2) {
    free(v2);
  }
  return v3;
}

uint64_t NECompareAddresses(const __CFString *a1, const __CFString *a2)
{
  uint64_t v2 = 4294967294;
  if (a1 && a2)
  {
    uint64_t v13 = 0;
    CFDataRef v4 = NECreateAddressDataFromString(a1, 0, (int *)&v13 + 1);
    CFDataRef v5 = v4;
    if (v4 && HIDWORD(v13))
    {
      CFDataRef v6 = NECreateAddressDataFromString(a2, 0, (int *)&v13);
      if (v6)
      {
        CFDataRef v7 = v6;
        if (v13 == HIDWORD(v13))
        {
          BytePtr = CFDataGetBytePtr(v5);
          int v9 = CFDataGetBytePtr(v7);
          size_t Length = CFDataGetLength(v5);
          int v11 = memcmp(BytePtr, v9, Length);
          if (v11 >= 0) {
            uint64_t v2 = v11 != 0;
          }
          else {
            uint64_t v2 = 0xFFFFFFFFLL;
          }
        }
        CFRelease(v5);
        CFDataRef v5 = v7;
      }
      goto LABEL_12;
    }
    if (v4) {
LABEL_12:
    }
      CFRelease(v5);
  }
  return v2;
}

BOOL NEAddressRangeIsContainedInAddressRange(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  int v6 = NECompareAddresses(a1, a3);
  unsigned int v7 = NECompareAddresses(a2, a4);
  return (v6 + 1) < 2 && v7 < 2;
}

void NEAddDataToDictionary(__CFDictionary *a1, const void *a2, UInt8 *bytes, int a4)
{
  if (a1)
  {
    if (a2)
    {
      if (bytes)
      {
        CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, a4);
        if (v6)
        {
          CFDataRef v7 = v6;
          CFDictionaryAddValue(a1, a2, v6);
          CFRelease(v7);
        }
      }
    }
  }
}

void NEAppendIntToArray(__CFArray *a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFArrayAppendValue(a1, v3);
      CFRelease(v4);
    }
  }
}

CFNumberRef NEGetValueFromIntArray(const __CFNumber *result, CFIndex a2)
{
  unsigned int valuePtr = 0;
  if (result)
  {
    CFArrayRef v3 = result;
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      uint64_t result = (const __CFNumber *)CFArrayGetValueAtIndex(v3, a2);
      if (result)
      {
        CFNumberGetValue(result, kCFNumberIntType, &valuePtr);
        return (const __CFNumber *)valuePtr;
      }
    }
  }
  return result;
}

CFDataRef NECreateDataFromString(const __CFString *a1, int a2)
{
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (!Length) {
    return 0;
  }
  CFIndex v5 = Length;
  CFIndex v6 = Length + 1;
  CFDataRef v7 = (char *)malloc_type_malloc(Length + 1, 0x970EF794uLL);
  if (!v7) {
    return 0;
  }
  unsigned int v8 = (UInt8 *)v7;
  if (CFStringGetCString(a1, v7, v6, 0x600u))
  {
    if (a2) {
      CFIndex v9 = v5 + 1;
    }
    else {
      CFIndex v9 = v5;
    }
    CFDataRef v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v8, v9);
  }
  else
  {
    CFDataRef v10 = 0;
  }
  free(v8);
  return v10;
}

CFStringRef NECreateStringFromData(CFStringRef result)
{
  if (result)
  {
    CFDataRef v1 = (const __CFData *)result;
    CFIndex Length = CFDataGetLength((CFDataRef)result);
    BytePtr = CFDataGetBytePtr(v1);
    UInt8 bytes = 0;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDataRef v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], &bytes, 1);
    if (!v5
      || (CFDataRef v6 = v5,
          v10.CFIndex location = 0,
          v10.size_t length = Length,
          CFIndex location = CFDataFind(v1, v5, v10, 0).location,
          CFRelease(v6),
          location == -1))
    {
      CFIndex v8 = CFDataGetLength(v1);
      return CFStringCreateWithBytes(v4, BytePtr, v8, 0x600u, 0);
    }
    else
    {
      return CFStringCreateWithCString(v4, (const char *)BytePtr, 0x600u);
    }
  }
  return result;
}

void *NECreateCStringFromCFString(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  if (!Length) {
    return 0;
  }
  CFIndex v3 = Length + 1;
  CFAllocatorRef v4 = malloc_type_calloc(1uLL, Length + 1, 0x85813EFEuLL);
  if (v4 && !CFStringGetCString(a1, (char *)v4, v3, 0x600u))
  {
    free(v4);
    return 0;
  }
  return v4;
}

void NEAddValueToIntKeyedDictionary(__CFDictionary *a1, int a2, const void *a3)
{
  int valuePtr = a2;
  if (a1 && a3)
  {
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionaryAddValue(a1, v5, a3);
      CFRelease(v6);
    }
  }
}

CFDictionaryRef NEGetValueFromIntKeyedDictionary(const __CFDictionary *a1, int a2)
{
  CFDictionaryRef Value = a1;
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Value, v3);
      CFRelease(v4);
    }
    else
    {
      return 0;
    }
  }
  return Value;
}

void NERemoveValueFromIntKeyedDictionary(__CFDictionary *a1, int a2)
{
  int valuePtr = a2;
  if (a1)
  {
    CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      CFNumberRef v4 = v3;
      CFDictionaryRemoveValue(a1, v3);
      CFRelease(v4);
    }
  }
}

NSObject *NERepeatingEventCreate(NSObject *a1, dispatch_time_t a2, uintptr_t a3, uint64_t a4, uint64_t a5, int a6, const void *a7, const void *a8)
{
  uint64_t v16 = malloc_type_calloc(1uLL, 0x20uLL, 0x1080040AA036A7FuLL);
  *(void *)uint64_t v16 = a4;
  void v16[2] = a6;
  if (a7) {
    *((void *)v16 + 2) = _Block_copy(a7);
  }
  if (a8) {
    *((void *)v16 + 3) = _Block_copy(a8);
  }
  v16[3] = 0;
  unsigned int v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, a3, a1);
  unsigned int v18 = v17;
  if (v17)
  {
    dispatch_set_context(v17, v16);
    dispatch_set_finalizer_f(v18, (dispatch_function_t)repeatingEventFinalizer);
    dispatch_source_set_timer(v18, a2, 1000000 * a4, 1000000 * a5);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __NERepeatingEventCreate_block_invoke;
    handler[3] = &__block_descriptor_tmp_17;
    handler[4] = v18;
    dispatch_source_set_event_handler(v18, handler);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 0x40000000;
    v20[2] = __NERepeatingEventCreate_block_invoke_2;
    v20[3] = &__block_descriptor_tmp_18;
    v20[4] = v18;
    dispatch_source_set_cancel_handler(v18, v20);
    dispatch_resume(v18);
  }
  else
  {
    free(v16);
  }
  return v18;
}

uint64_t __NERepeatingEventCreate_block_invoke(uint64_t a1)
{
  CFDataRef v1 = *(NSObject **)(a1 + 32);
  context = (uint64_t *)dispatch_get_context(v1);
  CFNumberRef v3 = context;
  int v5 = *((_DWORD *)context + 2);
  int v4 = *((_DWORD *)context + 3);
  *((_DWORD *)context + 3) = v4 + 1;
  if (v5) {
    BOOL v6 = v4 < v5;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    uint64_t result = context[2];
    if (!result) {
      return result;
    }
  }
  else
  {
    dispatch_source_cancel(v1);
    uint64_t result = v3[3];
    if (!result) {
      return result;
    }
  }
  CFIndex v8 = *(uint64_t (**)(void))(result + 16);

  return v8();
}

void __NERepeatingEventCreate_block_invoke_2(uint64_t a1)
{
  CFDataRef v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_release(v1);
  }
}

void repeatingEventFinalizer(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (const void *)a1[2];
    if (v2) {
      _Block_release(v2);
    }
    CFNumberRef v3 = (const void *)a1[3];
    if (v3) {
      _Block_release(v3);
    }
    free(a1);
  }
}

uint64_t NERepeatingEventGetTimesFired(NSObject *a1)
{
  if (a1) {
    return *((unsigned int *)dispatch_get_context(a1) + 3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

NSObject *NERepeatingEventGetIntervalInMilliseconds(NSObject *result)
{
  if (result) {
    return *(NSObject **)dispatch_get_context(result);
  }
  return result;
}

void NERepeatingEventRelease(NSObject *a1)
{
  if (a1 && !dispatch_source_testcancel(a1))
  {
    dispatch_source_cancel(a1);
  }
}

NSObject *NECreateTimerSource(dispatch_queue_t queue, uint64_t a2, void *a3)
{
  int v5 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, queue);
  if (v5)
  {
    dispatch_time_t v6 = dispatch_time(0, 1000000000 * a2);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(v5, a3);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __NECreateTimerSource_block_invoke;
    handler[3] = &__block_descriptor_tmp_19;
    handler[4] = v5;
    dispatch_source_set_cancel_handler(v5, handler);
    dispatch_resume(v5);
  }
  return v5;
}

void __NECreateTimerSource_block_invoke(uint64_t a1)
{
  CFDataRef v1 = *(NSObject **)(a1 + 32);
  if (v1) {
    dispatch_release(v1);
  }
}

CFDataRef NECreateDataWithEncodedCString(unsigned char *a1, int a2)
{
  LOBYTE(v2) = *a1;
  if (!*a1) {
    return 0;
  }
  unint64_t v5 = 0;
  uint64_t v6 = 1;
  uint64_t v7 = MEMORY[0x263EF8318];
  do
  {
    if ((v2 & 0x80) != 0)
    {
      if (!__maskrune((char)v2, 0x4000uLL)) {
        return 0;
      }
    }
    else
    {
      int v8 = *(_DWORD *)(v7 + 4 * (char)v2 + 60);
      if ((v8 & 0x10000) != 0)
      {
        ++v5;
      }
      else if ((v8 & 0x4000) == 0)
      {
        return 0;
      }
    }
    int v2 = a1[v6++];
  }
  while (v2);
  if (!v5) {
    return 0;
  }
  if (v5) {
    return 0;
  }
  CFIndex v9 = (UInt8 *)malloc_type_malloc(v5 >> 1, 0xFF0D70EEuLL);
  if (!v9) {
    return 0;
  }
  CFRange v10 = v9;
  unsigned int v11 = *a1;
  if (*a1)
  {
    CFIndex v12 = 0;
    int v13 = 0;
    unsigned int v14 = a1 + 1;
    unsigned int v15 = v9;
    do
    {
      if ((v11 & 0x80) == 0 && (*(_DWORD *)(v7 + 4 * v11 + 60) & 0x10000) != 0)
      {
        if (v13)
        {
          __str[1] = v11;
          __str[2] = 0;
          UInt8 v16 = strtol(__str, 0, a2);
          int v13 = 0;
          *v15++ = v16;
          ++v12;
        }
        else
        {
          __str[0] = v11;
          int v13 = 1;
        }
      }
      unsigned int v17 = *v14++;
      unsigned int v11 = v17;
    }
    while (v17);
  }
  else
  {
    CFIndex v12 = 0;
  }
  CFDataRef v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v10, v12);
  free(v10);
  return v19;
}

const char *NECertificateStatusToString(int a1)
{
  if ((a1 - 1) > 4) {
    return "Unknown";
  }
  else {
    return off_264195AD8[a1 - 1];
  }
}

uint64_t NECertificateDateIsValid(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 4;
  }
  SecCertificateNotValidBefore();
  CFAbsoluteTime v2 = v1;
  if (v1 == 0.0) {
    CFDateRef v3 = 0;
  }
  else {
    CFDateRef v3 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v1);
  }
  SecCertificateNotValidAfter();
  CFAbsoluteTime v6 = v5;
  if (v5 == 0.0) {
    CFDateRef v7 = 0;
  }
  else {
    CFDateRef v7 = CFDateCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v5);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current == 0.0)
  {
    CFDateRef v10 = 0;
    goto LABEL_19;
  }
  CFDateRef v9 = CFDateCreate(0, Current);
  CFDateRef v10 = v9;
  if (!v3 || !v9)
  {
LABEL_19:
    uint64_t v4 = 1;
    if (!v3)
    {
      if (!v7) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    goto LABEL_35;
  }
  if (CFDateCompare(v9, v3, 0) == kCFCompareLessThan)
  {
    int v13 = ne_log_obj();
    uint64_t v4 = 2;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_212970000, v13, OS_LOG_TYPE_DEBUG, "Current time before valid time", buf, 2u);
    }
  }
  else
  {
    if (!v7 || CFDateCompare(v10, v7, 0) != kCFCompareGreaterThan)
    {
      uint64_t v4 = 1;
      goto LABEL_35;
    }
    unsigned int v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_212970000, v11, OS_LOG_TYPE_DEBUG, "Current time after valid time", buf, 2u);
    }
    uint64_t v4 = 3;
  }
  if (nelog_is_info_logging_enabled())
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    int v18 = 0;
    unsigned int v14 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFCalendarIdentifier)*MEMORY[0x263EFFC90]);
    if (v14)
    {
      unsigned int v15 = v14;
      CFCalendarDecomposeAbsoluteTime(v14, v2, "yMdHm", (char *)&v20 + 4, &v20, (char *)&v19 + 4, &v19, &v18);
      UInt8 v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67110144;
        int v22 = HIDWORD(v20);
        __int16 v23 = 1024;
        int v24 = v20;
        __int16 v25 = 1024;
        int v26 = HIDWORD(v19);
        __int16 v27 = 1024;
        int v28 = v19;
        __int16 v29 = 1024;
        int v30 = v18;
        _os_log_impl(&dword_212970000, v16, OS_LOG_TYPE_INFO, "Certificate not valid before yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
      }
      CFCalendarDecomposeAbsoluteTime(v15, v6, "yMdHm", (char *)&v20 + 4, &v20, (char *)&v19 + 4, &v19, &v18);
      unsigned int v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67110144;
        int v22 = HIDWORD(v20);
        __int16 v23 = 1024;
        int v24 = v20;
        __int16 v25 = 1024;
        int v26 = HIDWORD(v19);
        __int16 v27 = 1024;
        int v28 = v19;
        __int16 v29 = 1024;
        int v30 = v18;
        _os_log_impl(&dword_212970000, v17, OS_LOG_TYPE_INFO, "Certificate not valid after yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
      }
      CFRelease(v15);
    }
  }
LABEL_35:
  CFRelease(v3);
  if (v7) {
LABEL_21:
  }
    CFRelease(v7);
LABEL_22:
  if (v10) {
    CFRelease(v10);
  }
  return v4;
}

BOOL NEIsInterfaceWIFI()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v0 = socket(2, 2, 0);
  if (v0 < 0)
  {
    CFAbsoluteTime v2 = ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    LODWORD(v7[0]) = 136315138;
    *(void *)((char *)v7 + 4) = "NEIsInterfaceWIFI";
    CFDateRef v3 = "%s: Failed to open socket";
    uint64_t v4 = (uint8_t *)v7;
LABEL_10:
    _os_log_error_impl(&dword_212970000, v2, OS_LOG_TYPE_ERROR, v3, v4, 0xCu);
    goto LABEL_7;
  }
  memset(v7, 0, 44);
  __strlcpy_chk();
  if (ioctl(v0, 0xC02C6938uLL, v7) != -1)
  {
    close(v0);
    return (v7[1] & 0xE0) == 128;
  }
  CFAbsoluteTime v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    CFAbsoluteTime v6 = "NEIsInterfaceWIFI";
    CFDateRef v3 = "%s: Failed to get media";
    uint64_t v4 = buf;
    goto LABEL_10;
  }
LABEL_7:
  close(v0);
  return 0;
}

ifaddrs *NEGetInterfaceType(const char *a1, unsigned char *a2, BOOL *a3)
{
  CFDateRef v10 = 0;
  *a2 = 0;
  *a3 = 0;
  CFAbsoluteTime v6 = 0;
  if (!getifaddrs(&v10))
  {
    CFDateRef v7 = v10;
    if (v10)
    {
      CFAbsoluteTime v6 = v10;
      while (1)
      {
        ifa_name = v6->ifa_name;
        if (ifa_name)
        {
          if (!strcmp(ifa_name, a1)) {
            break;
          }
        }
        CFAbsoluteTime v6 = v6->ifa_next;
        if (!v6) {
          goto LABEL_13;
        }
      }
      CFAbsoluteTime v6 = (ifaddrs *)v6->ifa_addr->sa_data[2];
      if (v6 == 255)
      {
        *a2 = 0;
      }
      else if (v6 == 6)
      {
        *a2 = 1;
        *a3 = NEIsInterfaceWIFI();
        CFDateRef v7 = v10;
      }
    }
    else
    {
      CFAbsoluteTime v6 = 0;
    }
LABEL_13:
    MEMORY[0x216687720](v7);
  }
  return v6;
}

BOOL NEIsInterfaceCellular(const char *a1)
{
  return NEGetInterfaceType(a1, &v3, &v2) == 255;
}

void *NECopyInterfaceAddress(const char *a1, int a2)
{
  int v13 = 0;
  p_ifa_next = 0;
  if (!getifaddrs(&v13))
  {
    p_ifa_next = &v13->ifa_next;
    if (v13)
    {
      while (1)
      {
        CFAbsoluteTime v5 = (const char *)p_ifa_next[1];
        if (v5)
        {
          if (!strcmp(v5, a1))
          {
            CFAbsoluteTime v6 = (unsigned __int8 *)p_ifa_next[3];
            if (v6[1] == a2)
            {
              if (a2 == 30)
              {
                unsigned int v10 = *v6;
                CFStringRef v8 = (const __CFString *)(v6 + 8);
                unint64_t v9 = v10;
                int v11 = 30;
                goto LABEL_13;
              }
              if (a2 == 2) {
                break;
              }
            }
          }
        }
        p_ifa_next = (void *)*p_ifa_next;
        if (!p_ifa_next) {
          goto LABEL_9;
        }
      }
      unsigned int v12 = *v6;
      CFStringRef v8 = (const __CFString *)(v6 + 4);
      unint64_t v9 = v12;
      int v11 = 2;
LABEL_13:
      p_ifa_next = NECreateAddressStringFromBuffer(v8, v9, v11);
    }
LABEL_9:
    MEMORY[0x216687720](v13);
  }
  return p_ifa_next;
}

uint64_t NEGetInterfaceForAddress(unsigned __int8 *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v2 = a1[1];
  if (v2 == 30)
  {
    if (*a1 > 0x1Bu) {
      goto LABEL_4;
    }
LABEL_21:
    unsigned int v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_212970000, v10, OS_LOG_TYPE_ERROR, "Address passed to NEGetInterfaceForAddress is too short", buf, 2u);
    }
    return 0;
  }
  if (v2 == 2 && *a1 < 0x10u) {
    goto LABEL_21;
  }
LABEL_4:
  unsigned int v17 = 0;
  if (getifaddrs(&v17) < 0)
  {
    int v11 = *__error();
    if (strerror_r(v11, (char *)buf, 0x80uLL)) {
      buf[0] = 0;
    }
    unsigned int v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)int v18 = 67109378;
      *(_DWORD *)uint64_t v19 = v11;
      *(_WORD *)&v19[4] = 2080;
      *(void *)&void v19[6] = buf;
      _os_log_fault_impl(&dword_212970000, v12, OS_LOG_TYPE_FAULT, "getifaddrs failed: [%d] %s", v18, 0x12u);
    }
    return 0;
  }
  char v3 = v17;
  if (!v17) {
    return 0;
  }
  int v4 = a1[1];
  while (1)
  {
    ifa_addr = v3->ifa_addr;
    if (v4 != ifa_addr->sa_family) {
      goto LABEL_16;
    }
    if (v4 == 30) {
      break;
    }
    if (v4 == 2 && *((_DWORD *)a1 + 1) == *(_DWORD *)&ifa_addr->sa_data[2]) {
      goto LABEL_29;
    }
LABEL_16:
    char v3 = v3->ifa_next;
    if (!v3) {
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(void *)&ifa_addr->sa_data[6];
  uint64_t v6 = *(void *)&ifa_addr[1].sa_len;
  if (*((void *)a1 + 1) != v7 || *((void *)a1 + 2) != v6) {
    goto LABEL_16;
  }
LABEL_29:
  uint64_t v9 = if_nametoindex(v3->ifa_name);
  if (!v9)
  {
    int v14 = *__error();
    if (strerror_r(v14, (char *)buf, 0x80uLL)) {
      buf[0] = 0;
    }
    unsigned int v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      ifa_name = v3->ifa_name;
      *(_DWORD *)int v18 = 136315650;
      *(void *)uint64_t v19 = ifa_name;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v14;
      __int16 v20 = 2080;
      unsigned int v21 = buf;
      _os_log_fault_impl(&dword_212970000, v15, OS_LOG_TYPE_FAULT, "Failed to get an interface index for interface %s: [%d] %s", v18, 0x1Cu);
    }
LABEL_17:
    uint64_t v9 = 0;
  }
  if (v17) {
    MEMORY[0x216687720]();
  }
  return v9;
}

uint64_t NEIsValidInterface(const char *a1)
{
  uint64_t v7 = 0;
  if (getifaddrs(&v7)) {
    return 0;
  }
  char v3 = v7;
  if (v7)
  {
    int v4 = v7;
    while (1)
    {
      ifa_name = v4->ifa_name;
      if (ifa_name)
      {
        if (!strcmp(ifa_name, a1)) {
          break;
        }
      }
      int v4 = v4->ifa_next;
      if (!v4) {
        goto LABEL_8;
      }
    }
    uint64_t v2 = 1;
  }
  else
  {
LABEL_8:
    uint64_t v2 = 0;
  }
  MEMORY[0x216687720](v3);
  return v2;
}

BOOL NEIsWildcardAddress(unsigned __int8 *a1)
{
  int v1 = a1[1];
  if (v1 == 30)
  {
    if (*a1 >= 0x1Cu && !*((_DWORD *)a1 + 2) && !*((_DWORD *)a1 + 3) && !*((_DWORD *)a1 + 4))
    {
      uint64_t v2 = a1 + 20;
      return *v2 == 0;
    }
  }
  else if (v1 == 2 && *a1 >= 0x10u)
  {
    uint64_t v2 = a1 + 4;
    return *v2 == 0;
  }
  return 0;
}

BOOL NEIsLoopbackAddress(unsigned __int8 *a1)
{
  int v1 = a1[1];
  if (v1 == 30)
  {
    if (*a1 >= 0x1Cu && !*((_DWORD *)a1 + 2) && !*((_DWORD *)a1 + 3) && !*((_DWORD *)a1 + 4))
    {
      uint64_t v2 = a1 + 20;
      int v3 = 0x1000000;
      return *v2 == v3;
    }
  }
  else if (v1 == 2 && *a1 >= 0x10u)
  {
    uint64_t v2 = a1 + 4;
    int v3 = 16777343;
    return *v2 == v3;
  }
  return 0;
}

uint64_t NEGetEntitlement(void *a1)
{
  if (a1)
  {
    if (MEMORY[0x2166885F0]() == MEMORY[0x263EF86D8])
    {
      size_t count = xpc_array_get_count(a1);
      if (count)
      {
        size_t v5 = count;
        size_t v6 = 0;
        uint64_t v2 = 0;
        while (1)
        {
          string = xpc_array_get_string(a1, v6);
          if (string)
          {
            CFStringRef v8 = string;
            size_t v9 = strlen(string);
            if (strncmp(v8, "packet-tunnel-provider", v9))
            {
              if (!strncmp(v8, "app-proxy-provider", v9)) {
                goto LABEL_22;
              }
              if (!strncmp(v8, "content-filter-provider", v9)) {
                goto LABEL_23;
              }
              if (!strncmp(v8, "dns-proxy", v9)) {
                goto LABEL_24;
              }
              if (!strncmp(v8, "dns-settings", v9))
              {
                uint64_t v2 = v2 | 0x40;
                goto LABEL_27;
              }
              if (!strncmp(v8, "relay", v9))
              {
                uint64_t v2 = v2 | 0x80;
                goto LABEL_27;
              }
              if (strncmp(v8, "packet-tunnel-provider-systemextension", v9))
              {
                if (strncmp(v8, "app-proxy-provider-systemextension", v9))
                {
                  if (strncmp(v8, "content-filter-provider-systemextension", v9))
                  {
                    if (strncmp(v8, "dns-proxy-systemextension", v9))
                    {
                      if (!strncmp(v8, "app-push-provider", v9)) {
                        uint64_t v2 = v2 | 0x20;
                      }
                      else {
                        uint64_t v2 = v2;
                      }
                      goto LABEL_27;
                    }
LABEL_24:
                    uint64_t v2 = v2 | 0x10;
                    goto LABEL_27;
                  }
LABEL_23:
                  uint64_t v2 = v2 | 4;
                  goto LABEL_27;
                }
LABEL_22:
                uint64_t v2 = v2 | 2;
                goto LABEL_27;
              }
            }
            uint64_t v2 = v2 | 1;
          }
LABEL_27:
          if (v5 == ++v6) {
            return v2;
          }
        }
      }
    }
  }
  return 0;
}

CFStringRef NECopySynthesizedIPv6Address(const __CFString *a1, int a2)
{
  int v13 = 0;
  CFStringRef v4 = 0;
  if (NEGetAddressFamilyFromString(a1) != 30)
  {
    int v12 = a2;
    int v5 = nw_nat64_copy_prefixes();
    if (v5 < 1)
    {
      CFStringRef v4 = 0;
      uint64_t v7 = 0;
    }
    else
    {
      unsigned int v6 = v5;
      uint64_t v7 = NECreateAddressStructFromString(a1, 0, 0);
      if (v7)
      {
        uint64_t v8 = 0;
        uint64_t v9 = 16 * v6;
        while (1)
        {
          *(_OWORD *)&v11.isa = xmmword_2129A0210;
          *(_OWORD *)((char *)&v11.info + 4) = *(long long *)((char *)&xmmword_2129A0210 + 12);
          if (nw_nat64_synthesize_v6()) {
            break;
          }
          v8 += 16;
          if (v9 == v8) {
            goto LABEL_7;
          }
        }
        CFStringRef v4 = NECreateAddressString(&v11);
      }
      else
      {
LABEL_7:
        CFStringRef v4 = 0;
      }
    }
    if (v13)
    {
      free(v13);
      int v13 = 0;
    }
    if (v7) {
      free(v7);
    }
  }
  return v4;
}

const char *inputNotification2String(int a1)
{
  if ((a1 - 1) > 5) {
    return "network changed";
  }
  else {
    return off_264195B00[a1 - 1];
  }
}

void ne_filter_request_connection(os_unfair_lock_s *a1, unsigned int a2, int a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (a2 < 8)
    {
      uint64_t v9 = a1 + 1;
      os_unfair_lock_lock(a1 + 1);
      unsigned int v10 = _Block_copy(a4);
      __CFString v11 = &a1[8 * a2];
      int v14 = *(NSObject **)&v11[6]._os_unfair_lock_opaque;
      int v13 = (NSObject **)&v11[6];
      int v12 = v14;
      if (v14)
      {
        atomic_fetch_add((atomic_uint *volatile)a1, 1u);
        dispatch_retain(v12);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 0x40000000;
        v24[2] = __ne_filter_request_connection_block_invoke;
        v24[3] = &unk_264195B38;
        v24[4] = v10;
        v24[5] = a1;
        v24[6] = v13 - 2;
        v24[7] = v12;
        unsigned int v15 = v24;
        UInt8 v16 = v12;
      }
      else
      {
        unsigned int v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        int v18 = dispatch_queue_create("Filter provider connection waiter queue", v17);
        *int v13 = v18;
        dispatch_suspend(v18);
        atomic_fetch_add((atomic_uint *volatile)a1, 1u);
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 0x40000000;
        v23[2] = __ne_filter_request_connection_block_invoke_2;
        v23[3] = &unk_264195B60;
        v23[5] = a1;
        v23[6] = v13 - 2;
        v23[4] = v10;
        if (ne_filter_connection_queue_onceToken != -1) {
          dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_387);
        }
        UInt8 v16 = ne_filter_connection_queue_filter_queue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 0x40000000;
        block[2] = __ne_filter_request_connection_block_invoke_3;
        block[3] = &unk_264195B88;
        unsigned int v21 = a2;
        int v22 = a3;
        void block[4] = v23;
        void block[5] = a1;
        unsigned int v15 = block;
      }
      dispatch_async(v16, v15);
      os_unfair_lock_unlock(v9);
    }
    else
    {
      unsigned int v6 = (void (*)(void *, void))a4[2];
      v6(a4, 0);
    }
  }
  else
  {
    uint64_t v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      int v26 = "ne_filter_request_connection";
      _os_log_fault_impl(&dword_212970000, v19, OS_LOG_TYPE_FAULT, "%s called with null completionHandler", buf, 0xCu);
    }
  }
}

void __ne_filter_request_connection_block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  if (atomic_fetch_add(*(atomic_uint *volatile *)(a1 + 40), 0xFFFFFFFF) == 1)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    free(v2);
  }
}

void __ne_filter_request_connection_block_invoke_2(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4));
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 48) + 16));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 48) + 16));
  *(void *)(*(void *)(a1 + 48) + 16) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  if (atomic_fetch_add(*(atomic_uint *volatile *)(a1 + 40), 0xFFFFFFFF) == 1)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    free(v2);
  }
}

void __ne_filter_request_connection_block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unsigned int v1 = *(_DWORD *)(a1 + 48);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v1 >= 8)
  {
    int v3 = (void (*)(uint64_t, void))v2[2];
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 0);
    return;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned int *)(a1 + 52);
  uint64_t v7 = (os_unfair_lock_s *)(v5 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 4));
  if (*(void *)(v5 + 264)) {
    goto LABEL_13;
  }
  if (get_current_notify_pid())
  {
    getpid();
    uint64_t v8 = "com.apple.nesessionmanager.content-filter";
    if (sandbox_check())
    {
      uint64_t v9 = ne_log_obj();
      uint64_t v8 = "com.apple.nesessionmanager";
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "com.apple.nesessionmanager";
        _os_log_impl(&dword_212970000, v9, OS_LOG_TYPE_INFO, "Filter falling back to Mach service %s", (uint8_t *)&buf, 0xCu);
      }
    }
    atomic_fetch_add((atomic_uint *volatile)v5, 1u);
    if (ne_filter_connection_queue_onceToken != -1) {
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_387);
    }
    mach_service = xpc_connection_create_mach_service(v8, (dispatch_queue_t)ne_filter_connection_queue_filter_queue, 2uLL);
    xpc_connection_set_context(mach_service, (void *)v5);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __ne_filter_request_xpc_connection_block_invoke;
    handler[3] = &__block_descriptor_tmp_20_394;
    handler[4] = mach_service;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
    *(void *)(v5 + 264) = mach_service;
LABEL_13:
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v11, "SessionClientType", 2);
    xpc_dictionary_set_int64(v11, "SessionConfigType", 4);
    xpc_dictionary_set_int64(v11, "command", 1);
    xpc_dictionary_set_uint64(v11, "control-unit", v6);
    int v12 = _Block_copy(v2);
    int v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v6;
      _os_log_debug_impl(&dword_212970000, v13, OS_LOG_TYPE_DEBUG, "Filter requesting xpc connection to control unit %u", (uint8_t *)&buf, 8u);
    }
    int v14 = *(_xpc_connection_s **)(v5 + 264);
    if (ne_filter_connection_queue_onceToken != -1) {
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_387);
    }
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 0x40000000;
    int v18 = __ne_filter_request_xpc_connection_block_invoke_24;
    uint64_t v19 = &unk_264195C50;
    int v22 = v6;
    unsigned int v23 = v1;
    __int16 v20 = v12;
    uint64_t v21 = v5;
    xpc_connection_send_message_with_reply(v14, v11, (dispatch_queue_t)ne_filter_connection_queue_filter_queue, &buf);
    xpc_release(v11);
    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 4));
    return;
  }
  unsigned int v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_212970000, v15, OS_LOG_TYPE_ERROR, "Session manager not running, cannot filter", (uint8_t *)&buf, 2u);
  }
  os_unfair_lock_unlock(v7);
  ((void (*)(void *, void))v2[2])(v2, 0);
}

void __ne_filter_request_xpc_connection_block_invoke(uint64_t a1, uint64_t a2)
{
  context = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
  if (a2)
  {
    uint64_t v5 = context;
    if (context)
    {
      if (MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8720])
      {
        xpc_connection_set_context(*(xpc_connection_t *)(a1 + 32), 0);
        os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
        uint64_t v6 = (_xpc_connection_s *)*((void *)v5 + 33);
        if (v6)
        {
          xpc_connection_cancel(v6);
          xpc_release(*((xpc_object_t *)v5 + 33));
          *((void *)v5 + 33) = 0;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v5 + 1);
        if (atomic_fetch_add((atomic_uint *volatile)v5, 0xFFFFFFFF) == 1)
        {
          free(v5);
        }
      }
    }
  }
}

void __ne_filter_request_xpc_connection_block_invoke_24(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  size_t length = 0;
  if (xdict && MEMORY[0x2166885F0](xdict) == MEMORY[0x263EF8720])
  {
    uint64_t v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v12 = *(_DWORD *)(a1 + 48);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x263EF86B0]);
    *(_DWORD *)long long buf = 67109378;
    int v26 = v12;
    __int16 v27 = 2080;
    int v28 = string;
    int v14 = "Filter got an error on the XPC connection when requesting endpoint to control unit %u: %s";
    goto LABEL_32;
  }
  xpc_object_t value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, "new-connection");
  if (!value)
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "error");
    uint64_t v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v10 = *(_DWORD *)(a1 + 48);
    if ((unint64_t)(int64 - 1) > 4) {
      xpc_object_t v11 = "None";
    }
    else {
      xpc_object_t v11 = off_264195C70[int64 - 1];
    }
    *(_DWORD *)long long buf = 67109378;
    int v26 = v10;
    __int16 v27 = 2080;
    int v28 = v11;
    int v14 = "Filter failed to get endpoint to control unit %u: %s";
LABEL_32:
    _os_log_error_impl(&dword_212970000, v9, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    goto LABEL_12;
  }
  xpc_connection_t v5 = xpc_connection_create_from_endpoint(value);
  if (v5)
  {
    uint64_t v6 = v5;
    data = (long long *)xpc_dictionary_get_data(xdict, "crypto-key", &length);
    goto LABEL_13;
  }
  int64_t v15 = xpc_dictionary_get_int64(xdict, "error");
  uint64_t v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v21 = *(_DWORD *)(a1 + 48);
    if ((unint64_t)(v15 - 1) > 4) {
      int v22 = "None";
    }
    else {
      int v22 = off_264195C70[v15 - 1];
    }
    *(_DWORD *)long long buf = 67109378;
    int v26 = v21;
    __int16 v27 = 2080;
    int v28 = v22;
    int v14 = "Filter failed to create connection to unit %u: %s";
    goto LABEL_32;
  }
LABEL_12:
  data = 0;
  uint64_t v6 = 0;
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4));
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = *(unsigned int *)(a1 + 52);
  *(void *)(v16 + 32 * v17 + 8) = v6;
  if (v6)
  {
    atomic_fetch_add(*(atomic_uint *volatile *)(a1 + 40), 1u);
    if (ne_filter_connection_queue_onceToken != -1) {
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_387);
    }
    xpc_connection_set_target_queue(v6, (dispatch_queue_t)ne_filter_connection_queue_filter_queue);
    xpc_connection_set_context(v6, *(void **)(a1 + 40));
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 0x40000000;
    handler[2] = __ne_filter_request_xpc_connection_block_invoke_28;
    handler[3] = &__block_descriptor_tmp_29;
    handler[4] = v6;
    void handler[5] = *(void *)(a1 + 48);
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(v6);
  }
  if (data && length == 32)
  {
    inited = ne_filter_crypto_init_client(data);
    *(void *)(v16 + 32 * v17 + 32) = inited;
    if (!inited)
    {
      uint64_t v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        __int16 v20 = "Filter failed to init client crypto";
LABEL_25:
        _os_log_error_impl(&dword_212970000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      __int16 v20 = "Filter failed to retrieve client crypto key";
      goto LABEL_25;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 4));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

void __ne_filter_request_xpc_connection_block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  context = (char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
  if (context)
  {
    xpc_connection_t v5 = context;
    if (a2 && MEMORY[0x2166885F0](a2) == MEMORY[0x263EF8720])
    {
      int v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v17 = *(_DWORD *)(a1 + 40);
        v18[0] = 67109120;
        v18[1] = v17;
        _os_log_error_impl(&dword_212970000, v10, OS_LOG_TYPE_ERROR, "Got an error on the Filter XPC connection to unit %u", (uint8_t *)v18, 8u);
      }
      xpc_connection_set_context(*(xpc_connection_t *)(a1 + 32), 0);
      os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
      xpc_object_t v11 = &v5[32 * *(unsigned int *)(a1 + 44)];
      int v13 = (xpc_object_t *)(v11 + 8);
      int v12 = (_xpc_connection_s *)*((void *)v11 + 1);
      if (v12)
      {
        xpc_connection_cancel(v12);
        xpc_release(*v13);
        *int v13 = 0;
      }
      uint64_t v16 = (void *)*((void *)v11 + 4);
      int64_t v15 = v11 + 32;
      int v14 = v16;
      if (v16)
      {
        free(v14);
        *int64_t v15 = 0;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v5 + 1);
      if (atomic_fetch_add((atomic_uint *volatile)v5, 0xFFFFFFFF) == 1) {
        free(v5);
      }
    }
    else
    {
      uuid = xpc_dictionary_get_uuid(a2, "flow-uuid");
      if (uuid)
      {
        uint64_t v7 = uuid;
        uint64_t v8 = (os_unfair_lock_s *)(v5 + 4);
        os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
        uint64_t v9 = *((void *)v5 + 34);
        if (v9)
        {
          while (uuid_compare(v7, (const unsigned __int8 *)v9))
          {
            uint64_t v9 = *(void *)(v9 + 184);
            if (!v9) {
              goto LABEL_8;
            }
          }
          ne_filter_protocol_retain(v9);
          os_unfair_lock_unlock(v8);
          ne_filter_protocol_handle_message(v9, a2);
          ne_filter_protocol_release(v9);
        }
        else
        {
LABEL_8:
          os_unfair_lock_unlock(v8);
        }
      }
    }
  }
}

dispatch_queue_t __ne_filter_connection_queue_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("ne.filter", v0);
  ne_filter_connection_queue_filter_queue = (uint64_t)result;
  return result;
}

uint64_t ne_filter_copy_connection(os_unfair_lock_s *a1, unsigned int a2)
{
  if (a2 > 7) {
    return 0;
  }
  xpc_connection_t v5 = a1 + 1;
  os_unfair_lock_lock(a1 + 1);
  uint64_t v6 = &a1[8 * a2];
  uint64_t v2 = *(void *)&v6[2]._os_unfair_lock_opaque;
  if (v2) {
    xpc_retain(*(xpc_object_t *)&v6[2]._os_unfair_lock_opaque);
  }
  os_unfair_lock_unlock(v5);
  return v2;
}

BOOL ne_filter_sign_data(os_unfair_lock_s *a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, _DWORD *a11)
{
  BOOL v11 = 0;
  if (a1 && a2 <= 7)
  {
    __int16 v20 = a1 + 1;
    os_unfair_lock_lock(a1 + 1);
    int v21 = *(uint64_t **)&a1[8 * a2 + 8]._os_unfair_lock_opaque;
    if (v21) {
      BOOL v11 = ne_filter_crypto_sign_data(v21, a3, a4, a5, a6, a7, a8, a9, a10, a11) == 0;
    }
    else {
      BOOL v11 = 1;
    }
    os_unfair_lock_unlock(v20);
  }
  return v11;
}

void ne_filter_send_message(os_unfair_lock_s *a1, unsigned int a2, void *a3, void *a4)
{
  uint64_t v6 = (_xpc_connection_s *)ne_filter_copy_connection(a1, a2);
  if (v6)
  {
    uint64_t v7 = v6;
    if (a4)
    {
      if (ne_filter_connection_queue_onceToken != -1) {
        dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_387);
      }
      xpc_connection_send_message_with_reply(v7, a3, (dispatch_queue_t)ne_filter_connection_queue_filter_queue, a4);
    }
    else
    {
      xpc_connection_send_message(v6, a3);
    }
    xpc_release(v7);
  }
}

uint64_t ne_filter_stats_init(uint64_t a1)
{
  *(_DWORD *)(a1 + 288) = 0;
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("Filter stats reporting queue", v2);
  *(void *)(a1 + 312) = 0;
  *(void *)(a1 + 320) = v3;
  *(void *)(a1 + 296) = 0;
  *(void *)(a1 + 304) = a1 + 296;
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  unint64_t v5 = 1000000;
  if (!result && info.numer && info.denom) {
    unint64_t v5 = (unint64_t)((1000000000
  }
                           * (unint64_t)info.denom
                           / info.numer
                           * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 7;
  *(void *)(a1 + 328) = v5;
  return result;
}

_OWORD *ne_filter_allocate_globals()
{
  int v0 = malloc_type_malloc(0x150uLL, 0x10A00403A9E6ACAuLL);
  unsigned int v1 = v0;
  if (v0)
  {
    v0[19] = 0u;
    v0[20] = 0u;
    v0[17] = 0u;
    v0[18] = 0u;
    v0[15] = 0u;
    v0[16] = 0u;
    v0[13] = 0u;
    v0[14] = 0u;
    v0[11] = 0u;
    v0[12] = 0u;
    v0[9] = 0u;
    v0[10] = 0u;
    v0[7] = 0u;
    v0[8] = 0u;
    v0[5] = 0u;
    v0[6] = 0u;
    v0[3] = 0u;
    v0[4] = 0u;
    v0[1] = 0u;
    v0[2] = 0u;
    *int v0 = 0u;
    atomic_fetch_add((atomic_uint *volatile)v0, 1u);
    *((void *)v0 + 34) = 0;
    *((void *)v0 + 35) = v0 + 17;
    ne_filter_stats_init((uint64_t)v0);
  }
  return v1;
}

void ne_filter_deallocate_globals(uint64_t a1, uint64_t a2)
{
  dispatch_queue_t v3 = (os_unfair_lock_s *)(a2 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 288));
  dispatch_release(*(dispatch_object_t *)(a2 + 320));
  uint64_t v4 = *(NSObject **)(a2 + 312);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*(dispatch_object_t *)(a2 + 312));
    *(void *)(a2 + 312) = 0;
  }
  os_unfair_lock_unlock(v3);
  if (atomic_fetch_add((atomic_uint *volatile)a2, 0xFFFFFFFF) == 1)
  {
    free((void *)a2);
  }
}

void *ne_filter_set_test_provider_factory(void *result)
{
  if (result)
  {
    uint64_t result = _Block_copy(result);
    g_testProviderFactory = (uint64_t)result;
  }
  return result;
}

void ne_filter_register_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
  uint64_t v5 = *(void *)(a1 + 272);
  *(void *)(v3 + 184) = v5;
  if (v5) {
    uint64_t v6 = (void *)(v5 + 192);
  }
  else {
    uint64_t v6 = (void *)(a1 + 280);
  }
  *uint64_t v6 = v3 + 184;
  *(void *)(a1 + 272) = v3;
  *(void *)(v3 + 192) = a1 + 272;
  *(_DWORD *)(v3 + 120) |= 0x10000u;

  os_unfair_lock_unlock(v4);
}

void ne_filter_unregister_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  if (*(unsigned char *)(v2 + 122))
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 4);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
    uint64_t v5 = *(void *)(v2 + 184);
    uint64_t v6 = *(void **)(v2 + 192);
    if (v5)
    {
      *(void *)(v5 + 192) = v6;
      uint64_t v6 = *(void **)(v2 + 192);
    }
    else
    {
      *(void *)(a1 + 280) = v6;
    }
    *uint64_t v6 = v5;
    *(_DWORD *)(v2 + 120) &= ~0x10000u;
    os_unfair_lock_unlock(v4);
  }
}

void ne_filter_stats_report(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  memset(v36, 0, sizeof(v36));
  uint64_t v2 = mach_absolute_time();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  uint64_t v3 = *(void *)(a1 + 296);
  if (!v3) {
    goto LABEL_29;
  }
  do
  {
    uint64_t v4 = *(void *)(v3 + 144);
    if (!v4) {
      goto LABEL_25;
    }
    while (1)
    {
      uint64_t v5 = atomic_load((unint64_t *)(v3 + 104));
      uint64_t v6 = atomic_load((unint64_t *)(v3 + 112));
      uint64_t v7 = *(unsigned int *)(v4 + 4);
      if (v7 > 7) {
        goto LABEL_20;
      }
      if (!*(void *)(v4 + 80)) {
        goto LABEL_20;
      }
      unint64_t v8 = (v2 - *(void *)(v4 + 136)) / *(void *)(a1 + 328);
      if (v8 <= (unint64_t)((double)*(unint64_t *)(v4 + 80) * 0.95)
        || *(void *)(v4 + 120) >= v5 && *(void *)(v4 + 128) >= v6)
      {
        goto LABEL_20;
      }
      if (!*((void *)v36 + v7)) {
        break;
      }
LABEL_11:
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      if (!v10)
      {
        int v17 = ne_log_obj();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        *(_WORD *)long long buf = 0;
        int v18 = v17;
        uint64_t v19 = "Stats Report - failed to create xpc dictionary for stats message";
        goto LABEL_28;
      }
      BOOL v11 = v10;
      xpc_dictionary_set_uuid(v10, "flow-uuid", (const unsigned __int8 *)v3);
      xpc_dictionary_set_uint64(v11, "byte-count-inbound", v5);
      xpc_dictionary_set_uint64(v11, "byte-count-outbound", v6);
      if ((*(_WORD *)(v4 + 144) & 0x100) == 0)
      {
        int v12 = *(NSObject **)(v3 + 64);
        if (v12)
        {
          if (nw_endpoint_get_type(v12) == nw_endpoint_type_address)
          {
            uint64_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(v3 + 64));
            if (address)
            {
              xpc_dictionary_set_data(v11, "local-addr", address, address->sa_len);
              *(_WORD *)(v4 + 144) |= 0x100u;
            }
          }
        }
      }
      xpc_array_append_value(*((xpc_object_t *)v36 + *(unsigned int *)(v4 + 4)), v11);
      xpc_release(v11);
      int v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v15 = *(_DWORD *)(v4 + 4);
        uint64_t v16 = *(void *)(v4 + 136);
        *(_DWORD *)long long buf = 67110144;
        int v27 = v15;
        __int16 v28 = 2048;
        uint64_t v29 = v5;
        __int16 v30 = 2048;
        uint64_t v31 = v6;
        __int16 v32 = 2048;
        uint64_t v33 = v16;
        __int16 v34 = 2048;
        unint64_t v35 = v8;
        _os_log_debug_impl(&dword_212970000, v14, OS_LOG_TYPE_DEBUG, "Stats Report collected (client %d) - in %llu out %llu (client ts %llu - elapsed msecs %llu)", buf, 0x30u);
      }
      *(void *)(v4 + 120) = v5;
      *(void *)(v4 + 128) = v6;
      *(void *)(v4 + 136) = mach_absolute_time();
LABEL_20:
      uint64_t v4 = *(void *)(v4 + 152);
      if (!v4) {
        goto LABEL_25;
      }
    }
    xpc_object_t v9 = xpc_array_create(0, 0);
    if (v9)
    {
      *((void *)v36 + *(unsigned int *)(v4 + 4)) = v9;
      goto LABEL_11;
    }
    __int16 v20 = ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)long long buf = 0;
    int v18 = v20;
    uint64_t v19 = "Stats Report - failed to create xpc array for stats message";
LABEL_28:
    _os_log_error_impl(&dword_212970000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
LABEL_25:
    uint64_t v3 = *(void *)(v3 + 200);
  }
  while (v3);
LABEL_29:
  for (uint64_t i = 0; i != 8; ++i)
  {
    int v22 = (void *)*((void *)v36 + i);
    if (v22)
    {
      xpc_object_t v23 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v23, "command", 12);
      xpc_dictionary_set_value(v23, "stats-report-statistics", v22);
      ne_filter_send_message((os_unfair_lock_s *)a1, i, v23, 0);
      uint64_t v24 = ne_log_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        size_t count = xpc_array_get_count(v22);
        *(_DWORD *)long long buf = 67109376;
        int v27 = i;
        __int16 v28 = 2048;
        uint64_t v29 = count;
        _os_log_debug_impl(&dword_212970000, v24, OS_LOG_TYPE_DEBUG, "Stats Report (client %d) - reported %zu stats", buf, 0x12u);
      }
      xpc_release(v23);
      xpc_release(v22);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
}

uint64_t ne_filter_stats_report_register(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  uint64_t v5 = *(void *)(a1 + 296);
  if (!v5) {
    goto LABEL_6;
  }
  char v6 = 0;
  do
  {
    v6 |= v5 == v3;
    uint64_t v5 = *(void *)(v5 + 200);
  }
  while (v5);
  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
LABEL_6:
    *(void *)(v3 + 200) = 0;
    unint64_t v8 = *(void **)(a1 + 304);
    *(void *)(v3 + 208) = v8;
    *unint64_t v8 = v3;
    *(void *)(a1 + 304) = v3 + 200;
    xpc_object_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "Stats toggle - INSERTED flow", buf, 2u);
    }
    uint64_t v7 = 1;
  }
  if (*(void *)(a1 + 296) && !*(void *)(a1 + 312))
  {
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 320));
    *(void *)(a1 + 312) = v10;
    if (v10)
    {
      atomic_fetch_add((atomic_uint *volatile)a1, 1u);
      BOOL v11 = *(NSObject **)(a1 + 312);
      dispatch_time_t v12 = dispatch_time(0, 200000000);
      dispatch_source_set_timer(v11, v12, 0xBEBC200uLL, 0);
      int v13 = *(NSObject **)(a1 + 312);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = __ne_filter_stats_report_register_block_invoke;
      handler[3] = &__block_descriptor_tmp_12_431;
      handler[4] = a1;
      dispatch_source_set_event_handler(v13, handler);
      int v14 = *(NSObject **)(a1 + 312);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 0x40000000;
      _DWORD v17[2] = __ne_filter_stats_report_register_block_invoke_2;
      v17[3] = &__block_descriptor_tmp_13_432;
      unsigned char v17[4] = a1;
      dispatch_source_set_cancel_handler(v14, v17);
      dispatch_activate(*(dispatch_object_t *)(a1 + 312));
    }
    else
    {
      int v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_212970000, v15, OS_LOG_TYPE_ERROR, "ne_filter_stats_report_register - dispatch_source_create failed", buf, 2u);
      }
    }
  }
  os_unfair_lock_unlock(v4);
  return v7;
}

void __ne_filter_stats_report_register_block_invoke(uint64_t a1)
{
}

void __ne_filter_stats_report_register_block_invoke_2(uint64_t a1)
{
  if (atomic_fetch_add(*(atomic_uint *volatile *)(a1 + 32), 0xFFFFFFFF) == 1) {
    free(*(void **)(a1 + 32));
  }
}

uint64_t ne_filter_stats_report_unregister(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 40);
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  uint64_t v5 = *(void *)(a1 + 296);
  if (v5)
  {
    char v6 = 0;
    do
    {
      v6 |= v5 == v3;
      uint64_t v5 = *(void *)(v5 + 200);
    }
    while (v5);
    if (v6)
    {
      uint64_t v7 = *(void *)(v3 + 200);
      unint64_t v8 = *(void **)(v3 + 208);
      if (v7)
      {
        *(void *)(v7 + 208) = v8;
        unint64_t v8 = *(void **)(v3 + 208);
      }
      else
      {
        *(void *)(a1 + 304) = v8;
      }
      *unint64_t v8 = v7;
      xpc_object_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)dispatch_time_t v12 = 0;
        _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "Stats toggle - REMOVED flow", v12, 2u);
      }
    }
    if (!*(void *)(a1 + 296))
    {
      dispatch_source_t v10 = *(NSObject **)(a1 + 312);
      if (v10)
      {
        dispatch_source_cancel(v10);
        dispatch_release(*(dispatch_object_t *)(a1 + 312));
        *(void *)(a1 + 312) = 0;
      }
    }
  }
  else
  {
    char v6 = 0;
  }
  os_unfair_lock_unlock(v4);
  return v6 & 1;
}

uint64_t ne_filter_get_definition()
{
  if (ne_filter_get_definition_onceToken != -1) {
    dispatch_once(&ne_filter_get_definition_onceToken, &__block_literal_global_435);
  }
  return ne_filter_get_definition_filter_definition;
}

uint64_t __ne_filter_get_definition_block_invoke()
{
  if (ne_filter_protocol_identifier_onceToken != -1) {
    dispatch_once(&ne_filter_protocol_identifier_onceToken, &__block_literal_global_3);
  }
  ne_filter_get_definition_filter_definition = nw_protocol_definition_create_with_identifier();

  return MEMORY[0x270EF8C10]();
}

uint64_t __ne_filter_protocol_identifier_block_invoke()
{
  ne_filter_protocol_identifier_g_hasNESMAccess = 1;
  g_filter_protocol_identifier = 0u;
  unk_26AB0F6A4 = 0u;
  qword_26AB0F6B4 = 0;
  g_filter_protocol_callbacks = 0u;
  *(_OWORD *)algn_267796EB8 = 0u;
  xmmword_267796EC8 = 0u;
  *(_OWORD *)&qword_267796ED8 = 0u;
  xmmword_267796EE8 = 0u;
  *(_OWORD *)&qword_267796EF8 = 0u;
  xmmword_267796F08 = 0u;
  unk_267796F18 = 0u;
  xmmword_267796F28 = 0u;
  unk_267796F38 = 0u;
  xmmword_267796F48 = 0u;
  unk_267796F58 = 0u;
  xmmword_267796F68 = 0u;
  unk_267796F78 = 0u;
  xmmword_267796F88 = 0u;
  unk_267796F98 = 0u;
  xmmword_267796FA8 = 0u;
  __strlcpy_chk();
  qword_26AB0F6B4 = 0x100000002;
  nw_protocol_set_default_one_to_one_callbacks();
  *(void *)&g_filter_protocol_callbacks = ne_filter_protocol_add_input_handler;
  *((void *)&g_filter_protocol_callbacks + 1) = ne_filter_protocol_remove_input_handler;
  qword_267796EF8 = (uint64_t)ne_filter_protocol_get_input_frames;
  qword_267796F00 = (uint64_t)ne_filter_protocol_get_output_frames;
  *(void *)&xmmword_267796F08 = ne_filter_protocol_finalize_output_frames;
  *(void *)&xmmword_267796EE8 = ne_filter_protocol_input_available;
  *((void *)&xmmword_267796EE8 + 1) = ne_filter_protocol_output_available;
  qword_267796F60 = (uint64_t)ne_filter_protocol_input_finished;
  *(void *)&xmmword_267796F68 = ne_filter_protocol_output_finished;
  qword_267796EC0 = (uint64_t)ne_filter_protocol_connect;
  *((void *)&xmmword_267796EC8 + 1) = ne_filter_protocol_connected;
  *(void *)&xmmword_267796EC8 = ne_filter_protocol_disconnect;
  qword_267796ED8 = (uint64_t)ne_filter_protocol_disconnected;
  *(void *)&xmmword_267796FA8 = nw_filter_protocol_reset;

  return MEMORY[0x270EF8FB8](&g_filter_protocol_identifier, ne_filter_protocol_create);
}

void ne_filter_protocol_create()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, 0xD8uLL, 0x10A0040BDFCEB50uLL))
  {
    int v0 = ne_log_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v6 = 216;
      _os_log_fault_impl(&dword_212970000, v0, OS_LOG_TYPE_FAULT, "posix_memalign(%zu) failed", buf, 0xCu);
    }
  }
  else
  {
    unsigned int v1 = memptr;
    *(_OWORD *)memptr = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    v1[3] = 0u;
    v1[4] = 0u;
    void v1[5] = 0u;
    v1[6] = 0u;
    v1[7] = 0u;
    v1[9] = 0u;
    v1[10] = 0u;
    v1[11] = 0u;
    v1[12] = 0u;
    v1[8] = 0u;
    *((void *)v1 + 26) = 0;
    *((void *)v1 + 2) = &g_filter_protocol_identifier;
    *((void *)v1 + 3) = &g_filter_protocol_callbacks;
    *((void *)v1 + 5) = v1;
    nw_frame_array_init();
    uint64_t v2 = (char *)memptr;
    *((void *)memptr + 18) = 0;
    v2 += 144;
    *((void *)v2 + 1) = v2;
    atomic_fetch_add((atomic_uint *volatile)v2 + 9, 1u);
    uint64_t v3 = (unint64_t *)memptr;
    atomic_store(0, (unint64_t *)memptr + 13);
    atomic_store(0, v3 + 14);
  }
}

uint64_t nw_filter_protocol_reset(uint64_t a1, uint64_t a2)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    int v14 = ne_log_obj();
    uint64_t result = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long v62 = 136315138;
    *(void *)&v62[4] = "nw_filter_protocol_reset";
    uint64_t v16 = "%s called with null protocol";
LABEL_14:
    _os_log_fault_impl(&dword_212970000, v14, OS_LOG_TYPE_FAULT, v16, v62, 0xCu);
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    int v14 = ne_log_obj();
    uint64_t result = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long v62 = 136315138;
    *(void *)&v62[4] = "nw_filter_protocol_reset";
    uint64_t v16 = "%s called with null filter";
    goto LABEL_14;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 180), 0)) {
    return 0;
  }
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, out);
  int v5 = *(_DWORD *)(v3 + 176);
  uint64_t v6 = ne_log_obj();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 3)
  {
    if (!v7) {
      goto LABEL_17;
    }
    uint64_t v8 = *(void *)(v3 + 80);
    if (v8) {
      LODWORD(v8) = nw_parameters_get_ip_protocol();
    }
    xpc_object_t v9 = *(void **)(v3 + 160);
    if (v9)
    {
      uint64_t v11 = v9[6];
      uint64_t v12 = v9[7];
      uint64_t v10 = v9[8];
      uint64_t v13 = v9[9];
    }
    else
    {
      uint64_t v10 = -1;
      uint64_t v11 = -1;
      uint64_t v12 = -1;
      uint64_t v13 = -1;
    }
    int32x4_t v43 = *(void **)(v3 + 168);
    if (v43)
    {
      uint64_t v45 = v43[6];
      uint64_t v46 = v43[7];
      uint64_t v44 = v43[8];
      uint64_t v47 = v43[9];
    }
    else
    {
      uint64_t v44 = -1;
      uint64_t v45 = -1;
      uint64_t v46 = -1;
      uint64_t v47 = -1;
    }
    *(_DWORD *)long long v62 = 136317442;
    *(void *)&v62[4] = out;
    *(_WORD *)&v62[12] = 1024;
    *(_DWORD *)&v62[14] = v8;
    *(_WORD *)&v62[18] = 2048;
    *(void *)&v62[20] = v11;
    *(_WORD *)&v62[28] = 2048;
    *(void *)&v62[30] = v12;
    *(_WORD *)&v62[38] = 2048;
    uint64_t v63 = v10;
    __int16 v64 = 2048;
    uint64_t v65 = v13;
    __int16 v66 = 2048;
    uint64_t v67 = v45;
    __int16 v68 = 2048;
    uint64_t v69 = v46;
    __int16 v70 = 2048;
    uint64_t v71 = v44;
    __int16 v72 = 2048;
    uint64_t v73 = v47;
    int32x4_t v48 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]connection reset";
    int8x16_t v49 = v6;
    uint32_t v50 = 98;
  }
  else
  {
    if (!v7) {
      goto LABEL_17;
    }
    uint64_t v40 = *(void *)(v3 + 80);
    if (v40) {
      LODWORD(v40) = nw_parameters_get_ip_protocol();
    }
    uint64_t v41 = *(unsigned int *)(v3 + 176);
    if (v41 > 3) {
      int64x2_t v42 = "unknown";
    }
    else {
      int64x2_t v42 = off_264195FA0[v41];
    }
    *(_DWORD *)long long v62 = 136315650;
    *(void *)&v62[4] = out;
    *(_WORD *)&v62[12] = 1024;
    *(_DWORD *)&v62[14] = v40;
    *(_WORD *)&v62[18] = 2080;
    *(void *)&v62[20] = v42;
    int32x4_t v48 = "[filter %s %d %s] connection reset";
    int8x16_t v49 = v6;
    uint32_t v50 = 28;
  }
  _os_log_debug_impl(&dword_212970000, v49, OS_LOG_TYPE_DEBUG, v48, v62, v50);
LABEL_17:
  uint64_t v17 = *(void *)(v3 + 144);
  if (v17)
  {
    do
    {
      ne_filter_data_protocol_send_finished(a1, v17, 0xBu);
      ne_filter_destroy_frames(*(void *)(a1 + 40));
      *(_DWORD *)(v17 + 40) = 0;
      *(_OWORD *)(v17 + 88) = 0u;
      *(_OWORD *)(v17 + 104) = 0u;
      *(_OWORD *)(v17 + 120) = 0u;
      *(void *)(v17 + 136) = 0;
      *(_WORD *)(v17 + 144) &= 0xFE00u;
      uint64_t v17 = *(void *)(v17 + 152);
    }
    while (v17);
    int v18 = 0;
  }
  else
  {
    int v18 = 1;
  }
  *(_DWORD *)(v3 + 176) = v18;
  if (!(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 112))(a2)
    || nw_parameters_get_data_mode() != 1)
  {
    goto LABEL_31;
  }
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, out);
  int v19 = *(_DWORD *)(v3 + 176);
  __int16 v20 = ne_log_obj();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19 == 3)
  {
    if (v21)
    {
      uint64_t v22 = *(void *)(v3 + 80);
      if (v22) {
        LODWORD(v22) = nw_parameters_get_ip_protocol();
      }
      xpc_object_t v23 = *(void **)(v3 + 160);
      if (v23)
      {
        uint64_t v25 = v23[6];
        uint64_t v26 = v23[7];
        uint64_t v24 = v23[8];
        uint64_t v27 = v23[9];
      }
      else
      {
        uint64_t v24 = -1;
        uint64_t v25 = -1;
        uint64_t v26 = -1;
        uint64_t v27 = -1;
      }
      long long v54 = *(void **)(v3 + 168);
      if (v54)
      {
        uint64_t v56 = v54[6];
        uint64_t v57 = v54[7];
        uint64_t v55 = v54[8];
        uint64_t v58 = v54[9];
      }
      else
      {
        uint64_t v55 = -1;
        uint64_t v56 = -1;
        uint64_t v57 = -1;
        uint64_t v58 = -1;
      }
      *(_DWORD *)long long v62 = 136317442;
      *(void *)&v62[4] = out;
      *(_WORD *)&v62[12] = 1024;
      *(_DWORD *)&v62[14] = v22;
      *(_WORD *)&v62[18] = 2048;
      *(void *)&v62[20] = v25;
      *(_WORD *)&v62[28] = 2048;
      *(void *)&v62[30] = v26;
      *(_WORD *)&v62[38] = 2048;
      uint64_t v63 = v24;
      __int16 v64 = 2048;
      uint64_t v65 = v27;
      __int16 v66 = 2048;
      uint64_t v67 = v56;
      __int16 v68 = 2048;
      uint64_t v69 = v57;
      __int16 v70 = 2048;
      uint64_t v71 = v55;
      __int16 v72 = 2048;
      uint64_t v73 = v58;
      long long v59 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]detected datagr"
            "am connection, frame fragmentation disabled";
      int v60 = v20;
      uint32_t v61 = 98;
LABEL_60:
      _os_log_debug_impl(&dword_212970000, v60, OS_LOG_TYPE_DEBUG, v59, v62, v61);
    }
  }
  else if (v21)
  {
    uint64_t v51 = *(void *)(v3 + 80);
    if (v51) {
      LODWORD(v51) = nw_parameters_get_ip_protocol();
    }
    uint64_t v52 = *(unsigned int *)(v3 + 176);
    if (v52 > 3) {
      long long v53 = "unknown";
    }
    else {
      long long v53 = off_264195FA0[v52];
    }
    *(_DWORD *)long long v62 = 136315650;
    *(void *)&v62[4] = out;
    *(_WORD *)&v62[12] = 1024;
    *(_DWORD *)&v62[14] = v51;
    *(_WORD *)&v62[18] = 2080;
    *(void *)&v62[20] = v53;
    long long v59 = "[filter %s %d %s] detected datagram connection, frame fragmentation disabled";
    int v60 = v20;
    uint32_t v61 = 28;
    goto LABEL_60;
  }
  *(_DWORD *)(v3 + 120) |= 0x8000u;
LABEL_31:
  nw_release(*(void **)(v3 + 64));
  __int16 v28 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 128))(a2);
  *(void *)(v3 + 64) = nw_retain(v28);
  nw_release(*(void **)(v3 + 72));
  uint64_t v29 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 136))(a2);
  *(void *)(v3 + 72) = nw_retain(v29);
  nw_release(*(void **)(v3 + 80));
  __int16 v30 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 112))(a2);
  *(void *)(v3 + 80) = nw_retain(v30);
  atomic_store(0, (unint64_t *)(v3 + 104));
  atomic_store(0, (unint64_t *)(v3 + 112));
  *(_DWORD *)(v3 + 120) &= 0xFFFFC003;
  ne_filter_unregister_flow(*(void *)(v3 + 96), a1);
  MEMORY[0x216688280](v3);
  ne_filter_register_flow(*(void *)(v3 + 96), a1);
  uint64_t v37 = *(void *)(a1 + 32);
  if (v37
    && (uint64_t v38 = *(void *)(v37 + 24)) != 0
    && (uint64x2_t v39 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))(v38 + 256)) != 0)
  {
    return v39(v37, a1, v31, v32, v33, v34, v35, v36, *(void *)v62, *(void *)&v62[8], *(void *)&v62[16], *(void *)&v62[24], *(void *)&v62[32]);
  }
  else
  {
    return 1;
  }
}

void ne_filter_data_protocol_send_finished(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(void *)&length[11] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 180), 0)) {
      return;
    }
    if (a3 == 9)
    {
      __int16 v9 = *(_WORD *)(a2 + 144);
      *(_WORD *)(a2 + 144) = v9 | 0x10;
      if ((v9 & 0x10) != 0) {
        return;
      }
    }
    else if (a3 == 10)
    {
      __int16 v7 = *(_WORD *)(a2 + 144);
      *(_WORD *)(a2 + 144) = v7 | 0x20;
      if ((v7 & 0x20) != 0) {
        return;
      }
    }
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v10, "command", a3);
    xpc_dictionary_set_uuid(v10, "flow-uuid", (const unsigned __int8 *)v3);
    if (a3 == 11)
    {
      uint64_t v11 = atomic_load((unint64_t *)(v3 + 104));
      xpc_dictionary_set_uint64(v10, "byte-count-inbound", v11);
      uint64_t v12 = atomic_load((unint64_t *)(v3 + 112));
      xpc_dictionary_set_uint64(v10, "byte-count-outbound", v12);
    }
    memset(length, 0, 36);
    if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v3, (uint64_t)&length[1], length, a3 == 11))
    {
      xpc_dictionary_set_data(v10, "crypto-signature", &length[1], length[0]);
    }
    else
    {
      uint64_t v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_212970000, v13, OS_LOG_TYPE_ERROR, "Failed to generate signature for finished message", buf, 2u);
      }
    }
    if (a3 == 11)
    {
      int v14 = *(os_unfair_lock_s **)(v3 + 96);
      unsigned int v15 = *(_DWORD *)(a2 + 4);
      uint64_t v16 = v10;
      uint64_t v17 = 0;
    }
    else
    {
      atomic_fetch_add((atomic_uint *volatile)(v3 + 180), 1u);
      int v14 = *(os_unfair_lock_s **)(v3 + 96);
      unsigned int v15 = *(_DWORD *)(a2 + 4);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 0x40000000;
      _DWORD v18[2] = __ne_filter_data_protocol_send_finished_block_invoke;
      _OWORD v18[3] = &__block_descriptor_tmp_42;
      uint8_t v18[4] = v3;
      v18[5] = a1;
      unsigned int v19 = a3;
      v18[6] = a2;
      uint64_t v17 = v18;
      uint64_t v16 = v10;
    }
    ne_filter_send_message(v14, v15, v16, v17);
    xpc_release(v10);
  }
  else
  {
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(length[1]) = 0;
      _os_log_impl(&dword_212970000, v8, OS_LOG_TYPE_INFO, "filter is null", (uint8_t *)&length[1], 2u);
    }
  }
}

uint64_t ne_filter_destroy_frames(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 144); i; uint64_t i = *(void *)(i + 152))
  {
    nw_frame_array_foreach();
    nw_frame_array_foreach();
  }
  return nw_frame_array_foreach();
}

uint64_t __ne_filter_destroy_frames_block_invoke()
{
  return 1;
}

uint64_t __ne_filter_destroy_frames_block_invoke_2()
{
  return 1;
}

uint64_t __ne_filter_destroy_frames_block_invoke_3()
{
  return 1;
}

BOOL ne_filter_generate_crypto_signature(unsigned int a1, uint64_t a2, uint64_t a3, _DWORD *a4, int a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v38 = 0;
  long long v37 = 0u;
  *(_OWORD *)uuid_t dst = 0u;
  memset(v36, 0, sizeof(v36));
  if (!a4) {
    return 0;
  }
  uuid_copy(dst, (const unsigned __int8 *)a2);
  DWORD2(v36[0]) = nw_parameters_get_server_mode() ^ 1;
  xpc_object_t v10 = *(NSObject **)(a2 + 64);
  if (!v10) {
    goto LABEL_10;
  }
  if (nw_endpoint_get_type(v10) != nw_endpoint_type_address) {
    goto LABEL_10;
  }
  uint64_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 64));
  if (!address) {
    goto LABEL_10;
  }
  int sa_family = address->sa_family;
  if (sa_family == 30)
  {
    sockaddr v13 = *address;
    *(sockaddr *)((char *)&v36[3] + 4) = *(sockaddr *)&address->sa_data[10];
    goto LABEL_9;
  }
  if (sa_family == 2)
  {
    sockaddr v13 = *address;
LABEL_9:
    *(sockaddr *)((char *)&v36[2] + 8) = v13;
  }
LABEL_10:
  int v14 = *(NSObject **)(a2 + 72);
  if (!v14) {
    goto LABEL_18;
  }
  nw_endpoint_type_t type = nw_endpoint_get_type(v14);
  uint64_t v16 = *(NSObject **)(a2 + 72);
  if (type == nw_endpoint_type_address)
  {
    uint64_t v17 = nw_endpoint_get_address(v16);
    if (v17)
    {
      int v18 = v17->sa_family;
      if (v18 == 30)
      {
        sockaddr v19 = *v17;
        *(sockaddr *)((char *)&v36[1] + 8) = *(sockaddr *)&v17->sa_data[10];
        goto LABEL_20;
      }
      if (v18 == 2)
      {
        sockaddr v19 = *v17;
LABEL_20:
        *(sockaddr *)((char *)v36 + 12) = v19;
      }
    }
    parent_endpoint_unint64_t domain = nw_endpoint_get_parent_endpoint_domain();
    goto LABEL_22;
  }
  if (nw_endpoint_get_type(v16) != nw_endpoint_type_host)
  {
LABEL_18:
    BOOL v21 = 0;
    goto LABEL_23;
  }
  ne_filter_create_wildcard_remote_sockaddr((uint64_t)buf, a2);
  *(_OWORD *)((char *)v36 + 12) = *(_OWORD *)buf;
  *(_OWORD *)((char *)&v36[1] + 8) = *(_OWORD *)&buf[12];
  parent_endpoint_unint64_t domain = (uint64_t)nw_endpoint_get_hostname(*(nw_endpoint_t *)(a2 + 72));
LABEL_22:
  BOOL v21 = (const char *)parent_endpoint_domain;
LABEL_23:
  DWORD1(v36[4]) = nw_parameters_get_ip_protocol();
  DWORD2(v36[4]) = getpid();
  HIDWORD(v36[4]) = nw_parameters_get_pid();
  nw_parameters_get_proc_uuid();
  nw_parameters_get_e_proc_uuid();
  if (a5)
  {
    unint64_t v22 = atomic_load((unint64_t *)(a2 + 104));
    unint64_t v23 = atomic_load((unint64_t *)(a2 + 112));
    *((void *)&v37 + 1) = v22;
    unint64_t v38 = v23;
  }
  effective_bundle_id = (const char *)nw_parameters_get_effective_bundle_id();
  uint64_t url = nw_parameters_get_url();
  uint64_t v26 = (const char *)url;
  *a4 = 32;
  uint64_t v27 = *(os_unfair_lock_s **)(a2 + 96);
  if (effective_bundle_id)
  {
    int v28 = strlen(effective_bundle_id);
    if (v26) {
      goto LABEL_27;
    }
LABEL_30:
    int v29 = 0;
    if (v21) {
      goto LABEL_28;
    }
    goto LABEL_31;
  }
  int v28 = 0;
  if (!url) {
    goto LABEL_30;
  }
LABEL_27:
  int v29 = strlen(v26);
  if (v21)
  {
LABEL_28:
    int v30 = strlen(v21);
    BOOL v31 = ne_filter_sign_data(v27, a1, (uint64_t)dst, (uint64_t)effective_bundle_id, v28, (uint64_t)v26, v29, (uint64_t)v21, v30, a3, a4);
    goto LABEL_32;
  }
LABEL_31:
  BOOL v31 = ne_filter_sign_data(v27, a1, (uint64_t)dst, (uint64_t)effective_bundle_id, v28, (uint64_t)v26, v29, 0, 0, a3, a4);
LABEL_32:
  if (!v31)
  {
    uint64_t v33 = ne_log_obj();
    BOOL result = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_212970000, v33, OS_LOG_TYPE_ERROR, "Failed to sign flow message", buf, 2u);
    return 0;
  }
  BOOL result = 1;
  if (*(void *)(a2 + 64)) {
    *(_DWORD *)(a2 + 124) = 1;
  }
  return result;
}

uint64_t __ne_filter_data_protocol_send_finished_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  memset(out, 0, 37);
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 176);
  int v5 = ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      __int16 v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        __int16 v7 = *(void **)(a1 + 32);
      }
      __int16 v9 = (void *)v7[20];
      if (v9)
      {
        uint64_t v11 = v9[6];
        uint64_t v12 = v9[7];
        uint64_t v10 = v9[8];
        uint64_t v13 = v9[9];
      }
      else
      {
        uint64_t v10 = -1;
        uint64_t v11 = -1;
        uint64_t v12 = -1;
        uint64_t v13 = -1;
      }
      sockaddr v19 = (void *)v7[21];
      if (v19)
      {
        uint64_t v21 = v19[6];
        uint64_t v22 = v19[7];
        uint64_t v20 = v19[8];
        uint64_t v23 = v19[9];
      }
      else
      {
        uint64_t v20 = -1;
        uint64_t v21 = -1;
        uint64_t v22 = -1;
        uint64_t v23 = -1;
      }
      *(_DWORD *)long long buf = 136317442;
      int v28 = out;
      __int16 v29 = 1024;
      int v30 = v8;
      __int16 v31 = 2048;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = v10;
      __int16 v37 = 2048;
      uint64_t v38 = v13;
      __int16 v39 = 2048;
      uint64_t v40 = v21;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 2048;
      uint64_t v44 = v20;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      uint64_t v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]received send-finish reply";
      uint64_t v25 = v5;
      uint32_t v26 = 98;
LABEL_20:
      _os_log_debug_impl(&dword_212970000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
    }
  }
  else if (v6)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      uint64_t v15 = *(void *)(a1 + 32);
    }
    uint64_t v17 = *(unsigned int *)(v15 + 176);
    if (v17 > 3) {
      int v18 = "unknown";
    }
    else {
      int v18 = off_264195FA0[v17];
    }
    *(_DWORD *)long long buf = 136315650;
    int v28 = out;
    __int16 v29 = 1024;
    int v30 = v16;
    __int16 v31 = 2080;
    uint64_t v32 = (uint64_t)v18;
    uint64_t v24 = "[filter %s %d %s] received send-finish reply";
    uint64_t v25 = v5;
    uint32_t v26 = 28;
    goto LABEL_20;
  }
  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_finished_block_invoke_40(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32)) {
    goto LABEL_5;
  }
  if (MEMORY[0x2166885F0]() == MEMORY[0x263EF8720])
  {
    BOOL v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x263EF86B0]);
    int v13 = 136315138;
    int v14 = string;
    uint64_t v3 = "Got an error on the XPC connection when sending a finished message: %s";
    int v4 = v6;
    uint32_t v5 = 12;
    goto LABEL_9;
  }
  if (!*(void *)(a1 + 32) || MEMORY[0x2166885F0]() != MEMORY[0x263EF8708])
  {
LABEL_5:
    uint64_t v2 = ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    LOWORD(v13) = 0;
    uint64_t v3 = "Got an invalid finished message reply";
    int v4 = v2;
    uint32_t v5 = 2;
LABEL_9:
    _os_log_error_impl(&dword_212970000, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v13, v5);
    goto LABEL_11;
  }
  ne_filter_process_verdict(*(void **)(a1 + 40), *(_DWORD *)(a1 + 56), *(void **)(a1 + 32), **(_DWORD **)(a1 + 48));
LABEL_11:
  xpc_release(*(xpc_object_t *)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v13) = 0;
    uint64_t v12 = "protocol is null";
LABEL_20:
    _os_log_impl(&dword_212970000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v13, 2u);
    return;
  }
  uint64_t v9 = *(void *)(v8 + 40);
  if (!v9)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v13) = 0;
    uint64_t v12 = "filter is null";
    goto LABEL_20;
  }
  uint64_t v10 = (atomic_uint *)(v9 + 180);
  if (atomic_fetch_or(v10, 0))
  {
    if (atomic_fetch_add(v10, 0xFFFFFFFF) == 1) {
      ne_filter_protocol_destroy(*(void *)(a1 + 40));
    }
  }
}

void ne_filter_process_verdict(void *a1, int a2, void *a3, int a4)
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v10 = ne_log_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v142) = 0;
    uint64_t v11 = "protocol is null";
LABEL_12:
    _os_log_impl(&dword_212970000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v142, 2u);
    return;
  }
  uint64_t v5 = a1[5];
  if (!v5)
  {
    uint64_t v10 = ne_log_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v142) = 0;
    uint64_t v11 = "filter is null";
    goto LABEL_12;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v5 + 180), 0)) {
    return;
  }
  if (a3 && MEMORY[0x2166885F0](a3) == MEMORY[0x263EF8708])
  {
    int int64 = xpc_dictionary_get_int64(a3, "verdict-value");
    if (!int64)
    {
      int64_t v13 = xpc_dictionary_get_int64(a3, "error");
      int v14 = (char *)v13;
      if (v13 != 6 && v13)
      {
        uint64_t v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v142 = 134218242;
          v143 = v14;
          __int16 v144 = 2080;
          *(void *)v145 = "";
          _os_log_error_impl(&dword_212970000, v17, OS_LOG_TYPE_ERROR, "Received error %llu from %s", (uint8_t *)&v142, 0x16u);
        }
        int int64 = 2;
      }
      else
      {
        uint64_t v15 = ne_log_obj();
        int int64 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
        if (int64)
        {
          uint64_t v16 = "system-internal";
          if (v14 == (char *)6) {
            uint64_t v16 = "gone-away";
          }
          int v142 = 136315394;
          v143 = (char *)v16;
          __int16 v144 = 2080;
          *(void *)v145 = "";
          _os_log_error_impl(&dword_212970000, v15, OS_LOG_TYPE_ERROR, "Received error %s from %s", (uint8_t *)&v142, 0x16u);
          int int64 = 0;
        }
      }
    }
    uint64_t v18 = *(void *)(v5 + 144);
    if (v18)
    {
      char v19 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      LOBYTE(v23) = 1;
      LOBYTE(v24) = 1;
      do
      {
        if (*(_DWORD *)v18 == a4)
        {
          if (!int64)
          {
            if (*(_DWORD *)(v18 + 40) == 3) {
              int int64 = 1;
            }
            else {
              int int64 = 2;
            }
          }
          *(_DWORD *)(v18 + 40) = int64;
          unsigned int v25 = int64;
          uint64_t v22 = v18;
        }
        else
        {
          unsigned int v25 = *(_DWORD *)(v18 + 40);
        }
        int v23 = (v25 != 0) & v23;
        int v24 = (v25 == 1) & v24;
        if (v21) {
          BOOL v26 = 0;
        }
        else {
          BOOL v26 = v25 == 3;
        }
        if (v26) {
          uint64_t v21 = v18;
        }
        if (v25 == 3) {
          uint64_t v20 = v18;
        }
        BOOL v27 = v25 > 3 || v25 == 2;
        v19 |= v27;
        uint64_t v18 = *(void *)(v18 + 152);
      }
      while (v18);
      if (v22)
      {
        if ((v24 & 1) == 0)
        {
          if ((v19 & 1) == 0)
          {
            int v28 = (_DWORD *)(v5 + 176);
            if (v23)
            {
              *int v28 = 3;
LABEL_54:
              *(void *)(v5 + 160) = v21;
              int v30 = (void *)(v5 + 160);
              int v28 = (_DWORD *)(v5 + 176);
              *(void *)(v5 + 168) = v20;
              __int16 v31 = (void *)(v5 + 168);
              goto LABEL_55;
            }
            *(void *)(v5 + 160) = v21;
            int v30 = (void *)(v5 + 160);
            int v64 = *(_DWORD *)(v5 + 176);
            *(void *)(v5 + 168) = v20;
            __int16 v31 = (void *)(v5 + 168);
            if (v64 != 2)
            {
LABEL_55:
              *(void *)(v22 + 48) = xpc_dictionary_get_uint64(a3, "input-pass-offset");
              *(void *)(v22 + 56) = xpc_dictionary_get_uint64(a3, "input-peek-offset");
              *(void *)(v22 + 64) = xpc_dictionary_get_uint64(a3, "output-pass-offset");
              *(void *)(v22 + 72) = xpc_dictionary_get_uint64(a3, "output-peek-offset");
              memset(out, 0, 37);
              uuid_unparse((const unsigned __int8 *)v5, out);
              int v32 = *(_DWORD *)(v5 + 176);
              __int16 v33 = ne_log_obj();
              BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
              if (v32 == 3)
              {
                if (!v34) {
                  goto LABEL_62;
                }
                uint64_t v35 = *(void *)(v5 + 80);
                if (v35) {
                  LODWORD(v35) = nw_parameters_get_ip_protocol();
                }
                uint64_t v36 = (void *)*v30;
                if (*v30)
                {
                  uint64_t v38 = v36[6];
                  uint64_t v39 = v36[7];
                  uint64_t v37 = v36[8];
                  uint64_t v40 = v36[9];
                }
                else
                {
                  uint64_t v37 = -1;
                  uint64_t v38 = -1;
                  uint64_t v39 = -1;
                  uint64_t v40 = -1;
                }
                long long v92 = (void *)*v31;
                if (*v31)
                {
                  uint64_t v94 = v92[6];
                  uint64_t v95 = v92[7];
                  uint64_t v93 = v92[8];
                  uint64_t v96 = v92[9];
                }
                else
                {
                  uint64_t v93 = -1;
                  uint64_t v94 = -1;
                  uint64_t v95 = -1;
                  uint64_t v96 = -1;
                }
                uint64_t v110 = *(unsigned int *)(v22 + 40);
                if (v110 > 3) {
                  v111 = "unknown";
                }
                else {
                  v111 = off_264195FA0[v110];
                }
                int v142 = 136317954;
                v143 = out;
                __int16 v144 = 1024;
                *(_DWORD *)v145 = v35;
                *(_WORD *)&v145[4] = 2048;
                *(void *)&v145[6] = v38;
                __int16 v146 = 2048;
                v147 = (const char *)v39;
                __int16 v148 = 2048;
                uint64_t v149 = v37;
                __int16 v150 = 2048;
                uint64_t v151 = v40;
                __int16 v152 = 2048;
                uint64_t v153 = v94;
                __int16 v154 = 2048;
                uint64_t v155 = v95;
                __int16 v156 = 2048;
                uint64_t v157 = v93;
                __int16 v158 = 2048;
                uint64_t v159 = v96;
                __int16 v160 = 2080;
                v161 = "";
                __int16 v162 = 2080;
                v163 = v111;
                CFDataRef v112 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]new "
                       "verdict from %s: %s";
                CFDataRef v113 = v33;
                uint32_t v114 = 118;
              }
              else
              {
                if (!v34) {
                  goto LABEL_62;
                }
                uint64_t v83 = *(void *)(v5 + 80);
                if (v83) {
                  LODWORD(v83) = nw_parameters_get_ip_protocol();
                }
                uint64_t v84 = *v28;
                if (v84 > 3) {
                  __int16 v85 = "unknown";
                }
                else {
                  __int16 v85 = off_264195FA0[v84];
                }
                uint64_t v105 = *(unsigned int *)(v22 + 40);
                if (v105 > 3) {
                  uint64_t v106 = "unknown";
                }
                else {
                  uint64_t v106 = off_264195FA0[v105];
                }
                int v142 = 136316162;
                v143 = out;
                __int16 v144 = 1024;
                *(_DWORD *)v145 = v83;
                *(_WORD *)&v145[4] = 2080;
                *(void *)&v145[6] = v85;
                __int16 v146 = 2080;
                v147 = "";
                __int16 v148 = 2080;
                uint64_t v149 = (uint64_t)v106;
                CFDataRef v112 = "[filter %s %d %s] new verdict from %s: %s";
                CFDataRef v113 = v33;
                uint32_t v114 = 48;
              }
              _os_log_debug_impl(&dword_212970000, v113, OS_LOG_TYPE_DEBUG, v112, (uint8_t *)&v142, v114);
LABEL_62:
              if ((a2 & 0xFFFFFFFD) == 9) {
                *(_WORD *)(v22 + 144) = *(_WORD *)(v22 + 144) & 0xFFAF | 0x40;
              }
              if ((a2 & 0xFFFFFFFE) == 0xA) {
                *(_WORD *)(v22 + 144) = *(_WORD *)(v22 + 144) & 0xFF5F | 0x80;
              }
              uint int64 = xpc_dictionary_get_uint64(a3, "stats-report-frequency");
              ne_filter_stats_toggle((uint64_t)a1, v22, uint64);
              if ((*(_WORD *)(v22 + 144) & 2) == 0)
              {
                if ((*v28 | 2) != 3) {
                  goto LABEL_127;
                }
                ne_filter_send_approved_frames(v5, 0);
                __int16 v42 = *(_WORD *)(v22 + 144);
                if ((v42 & 4) != 0)
                {
                  if (*(_DWORD *)(v22 + 40) == 3 && (v42 & 0x40) == 0 && *(void *)(v22 + 64) != -1)
                  {
LABEL_84:
                    int v52 = *(_DWORD *)(v5 + 120);
                    if ((v52 & 0x100) != 0)
                    {
                      if ((v52 & 0x400) != 0) {
                        goto LABEL_91;
                      }
                    }
                    else if ((*(_DWORD *)(v5 + 120) & 0x430) != 0x10)
                    {
                      goto LABEL_91;
                    }
                    if ((nw_frame_array_is_empty() & 1) != 0 || *(void *)(v22 + 104) >= *(void *)(v22 + 64)) {
                      ne_filter_handle_output_finished((uint64_t)a1);
                    }
LABEL_91:
                    ne_filter_read_approved_frames(v5, 0);
                    __int16 v53 = *(_WORD *)(v22 + 144);
                    if ((v53 & 8) != 0)
                    {
                      if (*(_DWORD *)(v22 + 40) == 3 && (v53 & 0x80) == 0 && *(void *)(v22 + 48) != -1)
                      {
LABEL_98:
                        int v54 = *(_DWORD *)(v5 + 120);
                        if ((v54 & 0x200) != 0)
                        {
                          if ((v54 & 0x800) != 0) {
                            goto LABEL_105;
                          }
                        }
                        else if ((*(_DWORD *)(v5 + 120) & 0x8C0) != 0x40)
                        {
                          goto LABEL_105;
                        }
                        if ((nw_frame_array_is_empty() & 1) != 0 || *(void *)(v22 + 88) >= *(void *)(v22 + 48)) {
                          ne_filter_handle_input_finished((uint64_t)a1, 0);
                        }
LABEL_105:
                        if ((*(unsigned char *)(v5 + 120) & 0x10) == 0 && (nw_frame_array_is_empty() & 1) == 0)
                        {
                          memset(out, 0, 37);
                          uuid_unparse((const unsigned __int8 *)v5, out);
                          int v55 = *(_DWORD *)(v5 + 176);
                          uint64_t v56 = ne_log_obj();
                          BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);
                          if (v55 == 3)
                          {
                            if (v57)
                            {
                              uint64_t v58 = *(void *)(v5 + 80);
                              if (v58) {
                                LODWORD(v58) = nw_parameters_get_ip_protocol();
                              }
                              long long v59 = (void *)*v30;
                              if (*v30)
                              {
                                uint64_t v61 = v59[6];
                                uint64_t v62 = v59[7];
                                uint64_t v60 = v59[8];
                                uint64_t v63 = v59[9];
                              }
                              else
                              {
                                uint64_t v60 = -1;
                                uint64_t v61 = -1;
                                uint64_t v62 = -1;
                                uint64_t v63 = -1;
                              }
                              long long v134 = (void *)*v31;
                              if (*v31)
                              {
                                uint64_t v136 = v134[6];
                                uint64_t v137 = v134[7];
                                uint64_t v135 = v134[8];
                                uint64_t v138 = v134[9];
                              }
                              else
                              {
                                uint64_t v135 = -1;
                                uint64_t v136 = -1;
                                uint64_t v137 = -1;
                                uint64_t v138 = -1;
                              }
                              int v142 = 136317442;
                              v143 = out;
                              __int16 v144 = 1024;
                              *(_DWORD *)v145 = v58;
                              *(_WORD *)&v145[4] = 2048;
                              *(void *)&v145[6] = v61;
                              __int16 v146 = 2048;
                              v147 = (const char *)v62;
                              __int16 v148 = 2048;
                              uint64_t v149 = v60;
                              __int16 v150 = 2048;
                              uint64_t v151 = v63;
                              __int16 v152 = 2048;
                              uint64_t v153 = v136;
                              __int16 v154 = 2048;
                              uint64_t v155 = v137;
                              __int16 v156 = 2048;
                              uint64_t v157 = v135;
                              __int16 v158 = 2048;
                              uint64_t v159 = v138;
                              v139 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %"
                                     "lld/%lld)]sending input available";
                              v140 = v56;
                              uint32_t v141 = 98;
LABEL_200:
                              _os_log_debug_impl(&dword_212970000, v140, OS_LOG_TYPE_DEBUG, v139, (uint8_t *)&v142, v141);
                            }
                          }
                          else if (v57)
                          {
                            uint64_t v131 = *(void *)(v5 + 80);
                            if (v131) {
                              LODWORD(v131) = nw_parameters_get_ip_protocol();
                            }
                            uint64_t v132 = *v28;
                            if (v132 > 3) {
                              long long v133 = "unknown";
                            }
                            else {
                              long long v133 = off_264195FA0[v132];
                            }
                            int v142 = 136315650;
                            v143 = out;
                            __int16 v144 = 1024;
                            *(_DWORD *)v145 = v131;
                            *(_WORD *)&v145[4] = 2080;
                            *(void *)&v145[6] = v133;
                            v139 = "[filter %s %d %s] sending input available";
                            v140 = v56;
                            uint32_t v141 = 28;
                            goto LABEL_200;
                          }
                          ne_filter_protocol_input_available(v5);
                        }
LABEL_127:
                        memset(out, 0, 37);
                        uuid_unparse((const unsigned __int8 *)v5, out);
                        int v74 = *(_DWORD *)(v5 + 176);
                        uint64_t v75 = ne_log_obj();
                        BOOL v76 = os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG);
                        if (v74 == 3)
                        {
                          if (v76)
                          {
                            uint64_t v77 = *(void *)(v5 + 80);
                            if (v77) {
                              LODWORD(v77) = nw_parameters_get_ip_protocol();
                            }
                            long long v78 = (void *)*v30;
                            if (*v30)
                            {
                              uint64_t v80 = v78[6];
                              uint64_t v81 = v78[7];
                              uint64_t v79 = v78[8];
                              uint64_t v82 = v78[9];
                            }
                            else
                            {
                              uint64_t v79 = -1;
                              uint64_t v80 = -1;
                              uint64_t v81 = -1;
                              uint64_t v82 = -1;
                            }
                            unsigned __int16 v100 = (void *)*v31;
                            if (*v31)
                            {
                              uint64_t v102 = v100[6];
                              uint64_t v103 = v100[7];
                              uint64_t v101 = v100[8];
                              uint64_t v104 = v100[9];
                            }
                            else
                            {
                              uint64_t v101 = -1;
                              uint64_t v102 = -1;
                              uint64_t v103 = -1;
                              uint64_t v104 = -1;
                            }
                            int v142 = 136317442;
                            v143 = out;
                            __int16 v144 = 1024;
                            *(_DWORD *)v145 = v77;
                            *(_WORD *)&v145[4] = 2048;
                            *(void *)&v145[6] = v80;
                            __int16 v146 = 2048;
                            v147 = (const char *)v81;
                            __int16 v148 = 2048;
                            uint64_t v149 = v79;
                            __int16 v150 = 2048;
                            uint64_t v151 = v82;
                            __int16 v152 = 2048;
                            uint64_t v153 = v102;
                            __int16 v154 = 2048;
                            uint64_t v155 = v103;
                            __int16 v156 = 2048;
                            uint64_t v157 = v101;
                            __int16 v158 = 2048;
                            uint64_t v159 = v104;
                            uint64_t v107 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %ll"
                                   "d/%lld)]finished processing new verdict";
                            CFDataRef v108 = v75;
                            uint32_t v109 = 98;
LABEL_167:
                            _os_log_debug_impl(&dword_212970000, v108, OS_LOG_TYPE_DEBUG, v107, (uint8_t *)&v142, v109);
                          }
                        }
                        else if (v76)
                        {
                          uint64_t v86 = *(void *)(v5 + 80);
                          if (v86) {
                            LODWORD(v86) = nw_parameters_get_ip_protocol();
                          }
                          uint64_t v87 = *v28;
                          if (v87 > 3) {
                            int v88 = "unknown";
                          }
                          else {
                            int v88 = off_264195FA0[v87];
                          }
                          int v142 = 136315650;
                          v143 = out;
                          __int16 v144 = 1024;
                          *(_DWORD *)v145 = v86;
                          *(_WORD *)&v145[4] = 2080;
                          *(void *)&v145[6] = v88;
                          uint64_t v107 = "[filter %s %d %s] finished processing new verdict";
                          CFDataRef v108 = v75;
                          uint32_t v109 = 28;
                          goto LABEL_167;
                        }
                        ne_filter_cleanup((uint64_t)a1);
                        return;
                      }
                    }
                    else if ((v53 & 0x80) == 0)
                    {
                      goto LABEL_98;
                    }
                    ne_filter_handle_input_finished((uint64_t)a1, 0);
                    goto LABEL_98;
                  }
                }
                else if ((v42 & 0x40) == 0)
                {
                  goto LABEL_84;
                }
                ne_filter_handle_output_finished((uint64_t)a1);
                goto LABEL_84;
              }
              memset(out, 0, 37);
              uuid_unparse((const unsigned __int8 *)v5, out);
              int v43 = *(_DWORD *)(v5 + 176);
              uint64_t v44 = ne_log_obj();
              BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG);
              if (v43 == 3)
              {
                if (!v45) {
                  goto LABEL_78;
                }
                uint64_t v46 = *(void *)(v5 + 80);
                if (v46) {
                  LODWORD(v46) = nw_parameters_get_ip_protocol();
                }
                uint64_t v47 = (void *)*v30;
                if (*v30)
                {
                  uint64_t v49 = v47[6];
                  uint64_t v50 = v47[7];
                  uint64_t v48 = v47[8];
                  uint64_t v51 = v47[9];
                }
                else
                {
                  uint64_t v48 = -1;
                  uint64_t v49 = -1;
                  uint64_t v50 = -1;
                  uint64_t v51 = -1;
                }
                CFStringRef v123 = (void *)*v31;
                if (*v31)
                {
                  uint64_t v125 = v123[6];
                  uint64_t v126 = v123[7];
                  uint64_t v124 = v123[8];
                  uint64_t v127 = v123[9];
                }
                else
                {
                  uint64_t v124 = -1;
                  uint64_t v125 = -1;
                  uint64_t v126 = -1;
                  uint64_t v127 = -1;
                }
                int v142 = 136317698;
                v143 = out;
                __int16 v144 = 1024;
                *(_DWORD *)v145 = v46;
                *(_WORD *)&v145[4] = 2048;
                *(void *)&v145[6] = v49;
                __int16 v146 = 2048;
                v147 = (const char *)v50;
                __int16 v148 = 2048;
                uint64_t v149 = v48;
                __int16 v150 = 2048;
                uint64_t v151 = v51;
                __int16 v152 = 2048;
                uint64_t v153 = v125;
                __int16 v154 = 2048;
                uint64_t v155 = v126;
                __int16 v156 = 2048;
                uint64_t v157 = v124;
                __int16 v158 = 2048;
                uint64_t v159 = v127;
                __int16 v160 = 2080;
                v161 = "";
                long long v128 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]rece"
                       "ived initial verdict from %s";
                long long v129 = v44;
                uint32_t v130 = 108;
              }
              else
              {
                if (!v45) {
                  goto LABEL_78;
                }
                uint64_t v97 = *(void *)(v5 + 80);
                if (v97) {
                  LODWORD(v97) = nw_parameters_get_ip_protocol();
                }
                uint64_t v98 = *v28;
                if (v98 > 3) {
                  long long v99 = "unknown";
                }
                else {
                  long long v99 = off_264195FA0[v98];
                }
                int v142 = 136315906;
                v143 = out;
                __int16 v144 = 1024;
                *(_DWORD *)v145 = v97;
                *(_WORD *)&v145[4] = 2080;
                *(void *)&v145[6] = v99;
                __int16 v146 = 2080;
                v147 = "";
                long long v128 = "[filter %s %d %s] received initial verdict from %s";
                long long v129 = v44;
                uint32_t v130 = 38;
              }
              _os_log_debug_impl(&dword_212970000, v129, OS_LOG_TYPE_DEBUG, v128, (uint8_t *)&v142, v130);
LABEL_78:
              *(_WORD *)(v22 + 144) &= ~2u;
              if (!ne_filter_protocol_connect((uint64_t)a1)) {
                ne_filter_protocol_drop_flow(a1);
              }
              goto LABEL_127;
            }
LABEL_117:
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)v5, out);
            int v65 = *(_DWORD *)(v5 + 176);
            __int16 v66 = ne_log_obj();
            BOOL v67 = os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG);
            if (v65 == 3)
            {
              if (v67)
              {
                uint64_t v68 = *(void *)(v5 + 80);
                if (v68) {
                  LODWORD(v68) = nw_parameters_get_ip_protocol();
                }
                uint64_t v69 = (void *)*v30;
                if (*v30)
                {
                  uint64_t v71 = v69[6];
                  uint64_t v72 = v69[7];
                  uint64_t v70 = v69[8];
                  uint64_t v73 = v69[9];
                }
                else
                {
                  uint64_t v70 = -1;
                  uint64_t v71 = -1;
                  uint64_t v72 = -1;
                  uint64_t v73 = -1;
                }
                unsigned int v115 = (void *)*v31;
                if (*v31)
                {
                  uint64_t v117 = v115[6];
                  uint64_t v118 = v115[7];
                  uint64_t v116 = v115[8];
                  uint64_t v119 = v115[9];
                }
                else
                {
                  uint64_t v116 = -1;
                  uint64_t v117 = -1;
                  uint64_t v118 = -1;
                  uint64_t v119 = -1;
                }
                int v142 = 136317442;
                v143 = out;
                __int16 v144 = 1024;
                *(_DWORD *)v145 = v68;
                *(_WORD *)&v145[4] = 2048;
                *(void *)&v145[6] = v71;
                __int16 v146 = 2048;
                v147 = (const char *)v72;
                __int16 v148 = 2048;
                uint64_t v149 = v70;
                __int16 v150 = 2048;
                uint64_t v151 = v73;
                __int16 v152 = 2048;
                uint64_t v153 = v117;
                __int16 v154 = 2048;
                uint64_t v155 = v118;
                __int16 v156 = 2048;
                uint64_t v157 = v116;
                __int16 v158 = 2048;
                uint64_t v159 = v119;
                __int16 v120 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]over"
                       "all verdict is drop, dropping the flow";
                int v121 = v66;
                uint32_t v122 = 98;
LABEL_180:
                _os_log_debug_impl(&dword_212970000, v121, OS_LOG_TYPE_DEBUG, v120, (uint8_t *)&v142, v122);
              }
            }
            else if (v67)
            {
              uint64_t v89 = *(void *)(v5 + 80);
              if (v89) {
                LODWORD(v89) = nw_parameters_get_ip_protocol();
              }
              uint64_t v90 = *v28;
              if (v90 > 3) {
                long long v91 = "unknown";
              }
              else {
                long long v91 = off_264195FA0[v90];
              }
              int v142 = 136315650;
              v143 = out;
              __int16 v144 = 1024;
              *(_DWORD *)v145 = v89;
              *(_WORD *)&v145[4] = 2080;
              *(void *)&v145[6] = v91;
              __int16 v120 = "[filter %s %d %s] overall verdict is drop, dropping the flow";
              int v121 = v66;
              uint32_t v122 = 28;
              goto LABEL_180;
            }
            ne_filter_protocol_drop_flow(a1);
            return;
          }
LABEL_116:
          *(_DWORD *)(v5 + 176) = 2;
          int v28 = (_DWORD *)(v5 + 176);
          *(void *)(v5 + 160) = v21;
          int v30 = (void *)(v5 + 160);
          *(void *)(v5 + 168) = v20;
          __int16 v31 = (void *)(v5 + 168);
          goto LABEL_117;
        }
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      int v24 = 1;
    }
    __int16 v29 = ne_log_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      int v142 = 136315138;
      v143 = "";
      _os_log_error_impl(&dword_212970000, v29, OS_LOG_TYPE_ERROR, "Failed to find the filter client for provider %s", (uint8_t *)&v142, 0xCu);
      if ((v24 & 1) == 0) {
        goto LABEL_116;
      }
    }
    else if (!v24)
    {
      goto LABEL_116;
    }
    uint64_t v22 = 0;
LABEL_53:
    *(_DWORD *)(v5 + 176) = 1;
    goto LABEL_54;
  }
  uint64_t v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v142 = 136315138;
    v143 = "";
    _os_log_error_impl(&dword_212970000, v9, OS_LOG_TYPE_ERROR, "Received invalid reply from %s, dropping", (uint8_t *)&v142, 0xCu);
  }
}

void ne_filter_protocol_destroy(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v2, out);
  int v3 = *(_DWORD *)(v2 + 176);
  int v4 = ne_log_obj();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == 3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(v2 + 80);
      if (v6) {
        LODWORD(v6) = nw_parameters_get_ip_protocol();
      }
      __int16 v7 = *(void **)(v2 + 160);
      if (v7)
      {
        uint64_t v9 = v7[6];
        uint64_t v10 = v7[7];
        uint64_t v8 = v7[8];
        uint64_t v11 = v7[9];
      }
      else
      {
        uint64_t v8 = -1;
        uint64_t v9 = -1;
        uint64_t v10 = -1;
        uint64_t v11 = -1;
      }
      uint64_t v18 = *(void **)(v2 + 168);
      if (v18)
      {
        uint64_t v20 = v18[6];
        uint64_t v21 = v18[7];
        uint64_t v19 = v18[8];
        uint64_t v22 = v18[9];
      }
      else
      {
        uint64_t v19 = -1;
        uint64_t v20 = -1;
        uint64_t v21 = -1;
        uint64_t v22 = -1;
      }
      int v26 = 136317442;
      BOOL v27 = out;
      __int16 v28 = 1024;
      int v29 = v6;
      __int16 v30 = 2048;
      uint64_t v31 = v9;
      __int16 v32 = 2048;
      uint64_t v33 = v10;
      __int16 v34 = 2048;
      uint64_t v35 = v8;
      __int16 v36 = 2048;
      uint64_t v37 = v11;
      __int16 v38 = 2048;
      uint64_t v39 = v20;
      __int16 v40 = 2048;
      uint64_t v41 = v21;
      __int16 v42 = 2048;
      uint64_t v43 = v19;
      __int16 v44 = 2048;
      uint64_t v45 = v22;
      int v23 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]destroying filter";
      int v24 = v4;
      uint32_t v25 = 98;
LABEL_26:
      _os_log_debug_impl(&dword_212970000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v26, v25);
    }
  }
  else if (v5)
  {
    uint64_t v15 = *(void *)(v2 + 80);
    if (v15) {
      LODWORD(v15) = nw_parameters_get_ip_protocol();
    }
    uint64_t v16 = *(unsigned int *)(v2 + 176);
    if (v16 > 3) {
      uint64_t v17 = "unknown";
    }
    else {
      uint64_t v17 = off_264195FA0[v16];
    }
    int v26 = 136315650;
    BOOL v27 = out;
    __int16 v28 = 1024;
    int v29 = v15;
    __int16 v30 = 2080;
    uint64_t v31 = (uint64_t)v17;
    int v23 = "[filter %s %d %s] destroying filter";
    int v24 = v4;
    uint32_t v25 = 28;
    goto LABEL_26;
  }
  *(void *)(a1 + 40) = 0;
  nw_release(*(void **)(v2 + 64));
  nw_release(*(void **)(v2 + 72));
  nw_release(*(void **)(v2 + 80));
  nw_release(*(void **)(v2 + 88));
  *(void *)(v2 + 96) = 0;
  *(void *)(v2 + 160) = 0;
  *(void *)(v2 + 168) = 0;
  while (1)
  {
    uint64_t v12 = *(void **)(v2 + 144);
    if (!v12) {
      break;
    }
    uint64_t v13 = v12[19];
    int v14 = (void *)v12[20];
    if (v13)
    {
      *(void *)(v13 + 160) = v14;
      int v14 = (void *)v12[20];
    }
    else
    {
      *(void *)(v2 + 152) = v14;
    }
    *int v14 = v13;
    free(v12);
  }
  ne_filter_stats_toggle(a1, 0, 0);
  memset_s((void *)v2, 0xD8uLL, 0, 0xD8uLL);
  free((void *)v2);
}

void ne_filter_stats_toggle(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v6 = *(void *)(a2 + 80);
    if (a3)
    {
      if (v6 == a3) {
        return;
      }
    }
    else if (!v6)
    {
      return;
    }
  }
  if (!a1)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v17) = 0;
    uint64_t v12 = "protocol is null";
    goto LABEL_22;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (!v7)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v17) = 0;
    uint64_t v12 = "filter is null";
    goto LABEL_22;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v7 + 180), 0)) {
    return;
  }
  uint64_t v8 = *(void *)(v7 + 96);
  if (!v8) {
    return;
  }
  uint64_t v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134218240;
    uint64_t v18 = a2;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "Stats toggle - client %lX frequency %llu", (uint8_t *)&v17, 0x16u);
    if (a3) {
      goto LABEL_12;
    }
  }
  else if (a3)
  {
LABEL_12:
    if (a2 && *(void *)(a2 + 80) != a3)
    {
      uint64_t v10 = 200;
      if (a3 > 0xC8) {
        uint64_t v10 = a3;
      }
      *(void *)(a2 + 80) = v10;
      *(void *)(a2 + 136) = mach_absolute_time();
      if (ne_filter_stats_report_register(v8, a1)) {
        atomic_fetch_add((atomic_uint *volatile)(v7 + 180), 1u);
      }
    }
    return;
  }
  if (!a2) {
    goto LABEL_41;
  }
  *(void *)(a2 + 80) = 0;
  uint64_t v13 = *(void *)(v7 + 144);
  if (!v13) {
    goto LABEL_41;
  }
  char v14 = 0;
  do
  {
    if (*(void *)(v13 + 80)) {
      char v14 = 1;
    }
    uint64_t v13 = *(void *)(v13 + 152);
  }
  while (v13);
  if ((v14 & 1) == 0)
  {
LABEL_41:
    if (ne_filter_stats_report_unregister(v8, a1))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      if (v15)
      {
        uint64_t v16 = (atomic_uint *)(v15 + 180);
        if (atomic_fetch_or(v16, 0) && atomic_fetch_add(v16, 0xFFFFFFFF) == 1) {
          ne_filter_protocol_destroy(a1);
        }
        return;
      }
      uint64_t v11 = ne_log_obj();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        return;
      }
      LOWORD(v17) = 0;
      uint64_t v12 = "filter is null";
LABEL_22:
      _os_log_impl(&dword_212970000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, 2u);
    }
  }
}

void ne_filter_protocol_drop_flow(void *a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v18 = ne_log_obj();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)__int16 v40 = 136315138;
    *(void *)&v40[4] = "ne_filter_protocol_drop_flow";
    __int16 v19 = "%s called with null protocol";
    goto LABEL_14;
  }
  uint64_t v2 = a1[5];
  if (!v2)
  {
    uint64_t v18 = ne_log_obj();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)__int16 v40 = 136315138;
    *(void *)&v40[4] = "ne_filter_protocol_drop_flow";
    __int16 v19 = "%s called with null filter";
LABEL_14:
    _os_log_fault_impl(&dword_212970000, v18, OS_LOG_TYPE_FAULT, v19, v40, 0xCu);
    return;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0)) {
    return;
  }
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v2, out);
  int v3 = *(_DWORD *)(v2 + 176);
  int v4 = ne_log_obj();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == 3)
  {
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v12 = *(void *)(v2 + 80);
    if (v12) {
      LODWORD(v12) = nw_parameters_get_ip_protocol();
    }
    uint64_t v13 = *(void **)(v2 + 160);
    if (v13)
    {
      uint64_t v15 = v13[6];
      uint64_t v16 = v13[7];
      uint64_t v14 = v13[8];
      uint64_t v17 = v13[9];
    }
    else
    {
      uint64_t v14 = -1;
      uint64_t v15 = -1;
      uint64_t v16 = -1;
      uint64_t v17 = -1;
    }
    __int16 v32 = *(void **)(v2 + 168);
    if (v32)
    {
      uint64_t v34 = v32[6];
      uint64_t v35 = v32[7];
      uint64_t v33 = v32[8];
      uint64_t v36 = v32[9];
    }
    else
    {
      uint64_t v33 = -1;
      uint64_t v34 = -1;
      uint64_t v35 = -1;
      uint64_t v36 = -1;
    }
    *(_DWORD *)__int16 v40 = 136317442;
    *(void *)&v40[4] = out;
    *(_WORD *)&v40[12] = 1024;
    *(_DWORD *)&v40[14] = v12;
    *(_WORD *)&v40[18] = 2048;
    *(void *)&v40[20] = v15;
    *(_WORD *)&v40[28] = 2048;
    *(void *)&v40[30] = v16;
    *(_WORD *)&v40[38] = 2048;
    uint64_t v41 = v14;
    __int16 v42 = 2048;
    uint64_t v43 = v17;
    __int16 v44 = 2048;
    uint64_t v45 = v34;
    __int16 v46 = 2048;
    uint64_t v47 = v35;
    __int16 v48 = 2048;
    uint64_t v49 = v33;
    __int16 v50 = 2048;
    uint64_t v51 = v36;
    uint64_t v37 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]drop flow";
    __int16 v38 = v4;
    uint32_t v39 = 98;
  }
  else
  {
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v29 = *(void *)(v2 + 80);
    if (v29) {
      LODWORD(v29) = nw_parameters_get_ip_protocol();
    }
    uint64_t v30 = *(unsigned int *)(v2 + 176);
    if (v30 > 3) {
      uint64_t v31 = "unknown";
    }
    else {
      uint64_t v31 = off_264195FA0[v30];
    }
    *(_DWORD *)__int16 v40 = 136315650;
    *(void *)&v40[4] = out;
    *(_WORD *)&v40[12] = 1024;
    *(_DWORD *)&v40[14] = v29;
    *(_WORD *)&v40[18] = 2080;
    *(void *)&v40[20] = v31;
    uint64_t v37 = "[filter %s %d %s] drop flow";
    __int16 v38 = v4;
    uint32_t v39 = 28;
  }
  _os_log_debug_impl(&dword_212970000, v38, OS_LOG_TYPE_DEBUG, v37, v40, v39);
LABEL_16:
  uint64_t v20 = a1[6];
  if (v20)
  {
    *(_DWORD *)(v2 + 176) = 2;
    for (uint64_t i = *(void *)(v2 + 144); i; uint64_t i = *(void *)(i + 152))
      *(_DWORD *)(i + 40) = 2;
    int v22 = *(_DWORD *)(v2 + 120);
    if ((v22 & 0x80) == 0)
    {
      *(_DWORD *)(v2 + 120) = v22 | 0x80;
      uint64_t v23 = *(void *)(v20 + 24);
      int v24 = *(void (**)(uint64_t, void *, uint64_t))(v23 + 56);
      if (v24)
      {
        v24(v20, a1, 57);
        uint64_t v23 = *(void *)(v20 + 24);
      }
      uint32_t v25 = *(void (**)(uint64_t, void *))(v23 + 48);
      if (v25) {
        v25(v20, a1);
      }
    }
    int v26 = *(_DWORD *)(v2 + 120);
    if ((v26 & 0x20) == 0)
    {
      *(_DWORD *)(v2 + 120) = v26 | 0x20;
      uint64_t v27 = a1[4];
      if (v27)
      {
        __int16 v28 = *(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))(*(void *)(v27 + 24) + 32);
        if (v28) {
          v28(v27, a1, v6, v7, v8, v9, v10, v11, *(void *)v40, *(void *)&v40[8], *(void *)&v40[16], *(void *)&v40[24], *(void *)&v40[32]);
        }
      }
    }
    ne_filter_cleanup((uint64_t)a1);
  }
}

BOOL ne_filter_protocol_connect(uint64_t a1)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v9 = ne_log_obj();
    BOOL result = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    int v70 = 136315138;
    uint64_t v71 = "ne_filter_protocol_connect";
    uint64_t v10 = "%s called with null protocol";
LABEL_18:
    _os_log_fault_impl(&dword_212970000, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v70, 0xCu);
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v9 = ne_log_obj();
    BOOL result = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    int v70 = 136315138;
    uint64_t v71 = "ne_filter_protocol_connect";
    uint64_t v10 = "%s called with null filter";
    goto LABEL_18;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0)) {
    return 0;
  }
  int v3 = *(_DWORD *)(v2 + 120);
  *(_DWORD *)(v2 + 120) = v3 | 4;
  if ((v3 & 2) != 0)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v11 = *(_DWORD *)(v2 + 176);
    uint64_t v12 = ne_log_obj();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11 == 3)
    {
      if (v13)
      {
        uint64_t v14 = *(void *)(v2 + 80);
        if (v14) {
          LODWORD(v14) = nw_parameters_get_ip_protocol();
        }
        uint64_t v15 = *(void **)(v2 + 160);
        if (v15)
        {
          uint64_t v17 = v15[6];
          uint64_t v18 = v15[7];
          uint64_t v16 = v15[8];
          uint64_t v19 = v15[9];
        }
        else
        {
          uint64_t v16 = -1;
          uint64_t v17 = -1;
          uint64_t v18 = -1;
          uint64_t v19 = -1;
        }
        uint64_t v45 = *(void **)(v2 + 168);
        if (v45)
        {
          uint64_t v47 = v45[6];
          uint64_t v48 = v45[7];
          uint64_t v46 = v45[8];
          uint64_t v49 = v45[9];
        }
        else
        {
          uint64_t v46 = -1;
          uint64_t v47 = -1;
          uint64_t v48 = -1;
          uint64_t v49 = -1;
        }
        int v70 = 136317442;
        uint64_t v71 = out;
        __int16 v72 = 1024;
        int v73 = v14;
        __int16 v74 = 2048;
        uint64_t v75 = v17;
        __int16 v76 = 2048;
        uint64_t v77 = v18;
        __int16 v78 = 2048;
        uint64_t v79 = v16;
        __int16 v80 = 2048;
        uint64_t v81 = v19;
        __int16 v82 = 2048;
        uint64_t v83 = v47;
        __int16 v84 = 2048;
        uint64_t v85 = v48;
        __int16 v86 = 2048;
        uint64_t v87 = v46;
        __int16 v88 = 2048;
        uint64_t v89 = v49;
        __int16 v50 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]waiting for xpc connection";
LABEL_67:
        uint64_t v51 = v12;
        uint32_t v52 = 98;
        goto LABEL_68;
      }
    }
    else if (v13)
    {
      uint64_t v39 = *(void *)(v2 + 80);
      if (v39) {
        LODWORD(v39) = nw_parameters_get_ip_protocol();
      }
      uint64_t v40 = *(unsigned int *)(v2 + 176);
      if (v40 > 3) {
        uint64_t v41 = "unknown";
      }
      else {
        uint64_t v41 = off_264195FA0[v40];
      }
      int v70 = 136315650;
      uint64_t v71 = out;
      __int16 v72 = 1024;
      int v73 = v39;
      __int16 v74 = 2080;
      uint64_t v75 = (uint64_t)v41;
      __int16 v50 = "[filter %s %d %s] waiting for xpc connection";
      goto LABEL_64;
    }
    return 1;
  }
  int v4 = *(_DWORD *)(v2 + 176);
  if (v4 != 3 && v4 != 1)
  {
    if (!v4)
    {
      uint64_t v20 = *(void *)(v2 + 144);
      if (v20)
      {
        BOOL result = 1;
        while (*(_DWORD *)(v20 + 40))
        {
          uint64_t v20 = *(void *)(v20 + 152);
          if (!v20) {
            return result;
          }
        }
        __int16 v30 = *(_WORD *)(v20 + 144);
        if ((v30 & 2) == 0)
        {
          *(_WORD *)(v20 + 144) = v30 | 2;
          ne_filter_data_protocol_send_new_flow(a1, v20);
          return 1;
        }
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v2, out);
        int v31 = *(_DWORD *)(v2 + 176);
        uint64_t v12 = ne_log_obj();
        BOOL v32 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
        if (v31 == 3)
        {
          if (!v32) {
            return 1;
          }
          uint64_t v33 = *(void *)(v2 + 80);
          if (v33) {
            LODWORD(v33) = nw_parameters_get_ip_protocol();
          }
          uint64_t v34 = *(void **)(v2 + 160);
          if (v34)
          {
            uint64_t v36 = v34[6];
            uint64_t v37 = v34[7];
            uint64_t v35 = v34[8];
            uint64_t v38 = v34[9];
          }
          else
          {
            uint64_t v35 = -1;
            uint64_t v36 = -1;
            uint64_t v37 = -1;
            uint64_t v38 = -1;
          }
          int v65 = *(void **)(v2 + 168);
          if (v65)
          {
            uint64_t v67 = v65[6];
            uint64_t v68 = v65[7];
            uint64_t v66 = v65[8];
            uint64_t v69 = v65[9];
          }
          else
          {
            uint64_t v66 = -1;
            uint64_t v67 = -1;
            uint64_t v68 = -1;
            uint64_t v69 = -1;
          }
          int v70 = 136317442;
          uint64_t v71 = out;
          __int16 v72 = 1024;
          int v73 = v33;
          __int16 v74 = 2048;
          uint64_t v75 = v36;
          __int16 v76 = 2048;
          uint64_t v77 = v37;
          __int16 v78 = 2048;
          uint64_t v79 = v35;
          __int16 v80 = 2048;
          uint64_t v81 = v38;
          __int16 v82 = 2048;
          uint64_t v83 = v67;
          __int16 v84 = 2048;
          uint64_t v85 = v68;
          __int16 v86 = 2048;
          uint64_t v87 = v66;
          __int16 v88 = 2048;
          uint64_t v89 = v69;
          __int16 v50 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]suppressing"
                " duplicate connect call while waiting for initial verdict";
          goto LABEL_67;
        }
        if (!v32) {
          return 1;
        }
        uint64_t v42 = *(void *)(v2 + 80);
        if (v42) {
          LODWORD(v42) = nw_parameters_get_ip_protocol();
        }
        uint64_t v43 = *(unsigned int *)(v2 + 176);
        if (v43 > 3) {
          __int16 v44 = "unknown";
        }
        else {
          __int16 v44 = off_264195FA0[v43];
        }
        int v70 = 136315650;
        uint64_t v71 = out;
        __int16 v72 = 1024;
        int v73 = v42;
        __int16 v74 = 2080;
        uint64_t v75 = (uint64_t)v44;
        __int16 v50 = "[filter %s %d %s] suppressing duplicate connect call while waiting for initial verdict";
LABEL_64:
        uint64_t v51 = v12;
        uint32_t v52 = 28;
LABEL_68:
        _os_log_debug_impl(&dword_212970000, v51, OS_LOG_TYPE_DEBUG, v50, (uint8_t *)&v70, v52);
        return 1;
      }
      return 1;
    }
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v21 = *(_DWORD *)(v2 + 176);
    int v22 = ne_log_obj();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    if (v21 == 3)
    {
      if (v23)
      {
        uint64_t v24 = *(void *)(v2 + 80);
        if (v24) {
          LODWORD(v24) = nw_parameters_get_ip_protocol();
        }
        uint32_t v25 = *(void **)(v2 + 160);
        if (v25)
        {
          uint64_t v27 = v25[6];
          uint64_t v28 = v25[7];
          uint64_t v26 = v25[8];
          uint64_t v29 = v25[9];
        }
        else
        {
          uint64_t v26 = -1;
          uint64_t v27 = -1;
          uint64_t v28 = -1;
          uint64_t v29 = -1;
        }
        int v55 = *(void **)(v2 + 168);
        if (v55)
        {
          uint64_t v57 = v55[6];
          uint64_t v58 = v55[7];
          uint64_t v56 = v55[8];
          uint64_t v59 = v55[9];
        }
        else
        {
          uint64_t v56 = -1;
          uint64_t v57 = -1;
          uint64_t v58 = -1;
          uint64_t v59 = -1;
        }
        uint64_t v60 = *(unsigned int *)(v2 + 176);
        if (v60 > 3) {
          uint64_t v61 = "unknown";
        }
        else {
          uint64_t v61 = off_264195FA0[v60];
        }
        int v70 = 136317698;
        uint64_t v71 = out;
        __int16 v72 = 1024;
        int v73 = v24;
        __int16 v74 = 2048;
        uint64_t v75 = v27;
        __int16 v76 = 2048;
        uint64_t v77 = v28;
        __int16 v78 = 2048;
        uint64_t v79 = v26;
        __int16 v80 = 2048;
        uint64_t v81 = v29;
        __int16 v82 = 2048;
        uint64_t v83 = v57;
        __int16 v84 = 2048;
        uint64_t v85 = v58;
        __int16 v86 = 2048;
        uint64_t v87 = v56;
        __int16 v88 = 2048;
        uint64_t v89 = v59;
        __int16 v90 = 2080;
        long long v91 = v61;
        uint64_t v62 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]failing call "
              "to connect because of verdict: %s";
        uint64_t v63 = v22;
        uint32_t v64 = 108;
LABEL_85:
        _os_log_debug_impl(&dword_212970000, v63, OS_LOG_TYPE_DEBUG, v62, (uint8_t *)&v70, v64);
      }
    }
    else if (v23)
    {
      uint64_t v53 = *(void *)(v2 + 80);
      if (v53) {
        LODWORD(v53) = nw_parameters_get_ip_protocol();
      }
      int v54 = "pass";
      switch(*(_DWORD *)(v2 + 176))
      {
        case 0:
          int v54 = "invalid";
          break;
        case 1:
          break;
        case 2:
          int v54 = "drop";
          break;
        case 3:
          int v54 = "more-data";
          break;
        default:
          int v54 = "unknown";
          break;
      }
      int v70 = 136315906;
      uint64_t v71 = out;
      __int16 v72 = 1024;
      int v73 = v53;
      __int16 v74 = 2080;
      uint64_t v75 = (uint64_t)v54;
      __int16 v76 = 2080;
      uint64_t v77 = (uint64_t)v54;
      uint64_t v62 = "[filter %s %d %s] failing call to connect because of verdict: %s";
      uint64_t v63 = v22;
      uint32_t v64 = 38;
      goto LABEL_85;
    }
    return 0;
  }
  BOOL result = 1;
  if ((v3 & 0x40) == 0)
  {
    uint64_t v7 = *(void *)(v2 + 32);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void, uint64_t))(*(void *)(v7 + 24) + 24);
      if (v8)
      {
        v8(*(void *)(v2 + 32), a1);
        return 1;
      }
    }
  }
  return result;
}

uint64_t ne_filter_send_approved_frames(uint64_t a1, uint64_t a2)
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a1, out);
  int v4 = *(_DWORD *)(a1 + 176);
  BOOL v5 = ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v7 = *(void *)(a1 + 80);
    if (v7) {
      LODWORD(v7) = nw_parameters_get_ip_protocol();
    }
    uint64_t v8 = *(void **)(a1 + 160);
    if (v8)
    {
      uint64_t v10 = v8[6];
      uint64_t v11 = v8[7];
      uint64_t v9 = v8[8];
      uint64_t v12 = v8[9];
    }
    else
    {
      uint64_t v9 = -1;
      uint64_t v10 = -1;
      uint64_t v11 = -1;
      uint64_t v12 = -1;
    }
    uint32_t v64 = *(void **)(a1 + 168);
    if (v64)
    {
      uint64_t v66 = v64[6];
      uint64_t v67 = v64[7];
      uint64_t v65 = v64[8];
      uint64_t v68 = v64[9];
    }
    else
    {
      uint64_t v65 = -1;
      uint64_t v66 = -1;
      uint64_t v67 = -1;
      uint64_t v68 = -1;
    }
    *(_DWORD *)long long buf = 136317442;
    *(void *)&uint8_t buf[4] = out;
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    __int16 v127 = 2048;
    uint64_t v128 = v10;
    __int16 v129 = 2048;
    uint64_t v130 = v11;
    __int16 v131 = 2048;
    uint64_t v132 = v9;
    __int16 v133 = 2048;
    uint64_t v134 = v12;
    __int16 v135 = 2048;
    uint64_t v136 = v66;
    __int16 v137 = 2048;
    uint64_t v138 = v67;
    __int16 v139 = 2048;
    uint64_t v140 = v65;
    __int16 v141 = 2048;
    uint64_t v142 = v68;
    uint64_t v69 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending approved frames";
    int v70 = v5;
    uint32_t v71 = 98;
  }
  else
  {
    if (!v6) {
      goto LABEL_8;
    }
    uint64_t v61 = *(void *)(a1 + 80);
    if (v61) {
      LODWORD(v61) = nw_parameters_get_ip_protocol();
    }
    uint64_t v62 = *(unsigned int *)(a1 + 176);
    if (v62 > 3) {
      uint64_t v63 = "unknown";
    }
    else {
      uint64_t v63 = off_264195FA0[v62];
    }
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = out;
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = v61;
    __int16 v127 = 2080;
    uint64_t v128 = (uint64_t)v63;
    uint64_t v69 = "[filter %s %d %s] sending approved frames";
    int v70 = v5;
    uint32_t v71 = 28;
  }
  _os_log_debug_impl(&dword_212970000, v70, OS_LOG_TYPE_DEBUG, v69, buf, v71);
LABEL_8:
  v125[0] = 0;
  v125[1] = 0;
  nw_frame_array_init();
  if (a2) {
    nw_frame_array_append_array();
  }
  uint64_t v13 = *(void *)(a1 + 144);
  if (v13)
  {
    uint64_t v14 = &dword_212970000;
    while (1)
    {
      if (*(_DWORD *)(v13 + 40) != 3 || *(void *)(v13 + 64) == -1) {
        goto LABEL_24;
      }
      if ((nw_frame_array_is_empty() & 1) == 0) {
        break;
      }
LABEL_21:
      if (ne_filter_data_protocol_send_data(a1, v13, 0) && (*(_WORD *)(v13 + 144) & 4) != 0)
      {
        ne_filter_data_protocol_send_finished(a1, v13, 9);
        *(_WORD *)(v13 + 144) &= ~4u;
      }
LABEL_24:
      if (*(void *)(v13 + 104) < *(void *)(v13 + 64) && (nw_frame_array_is_empty() & 1) == 0)
      {
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)a1, out);
        int v18 = *(_DWORD *)(a1 + 176);
        uint64_t v19 = ne_log_obj();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        if (v18 == 3)
        {
          if (v20)
          {
            if (*(void *)(a1 + 80)) {
              int ip_protocol = nw_parameters_get_ip_protocol();
            }
            else {
              int ip_protocol = 0;
            }
            uint64_t v24 = *(void **)(a1 + 160);
            if (v24)
            {
              uint64_t v114 = v24[7];
              uint64_t v116 = v24[6];
              uint64_t v33 = v24[8];
              uint64_t v25 = v24[9];
              uint64_t v118 = v33;
            }
            else
            {
              uint64_t v25 = -1;
              uint64_t v116 = -1;
              uint64_t v118 = -1;
              uint64_t v114 = -1;
            }
            uint64_t v112 = v25;
            uint64_t v34 = v14;
            uint64_t v35 = *(void **)(a1 + 168);
            if (v35)
            {
              uint64_t v107 = v35[7];
              uint64_t v108 = v35[6];
              uint64_t v36 = v35[9];
              uint64_t v110 = v35[8];
            }
            else
            {
              uint64_t v108 = -1;
              uint64_t v110 = -1;
              uint64_t v107 = -1;
              uint64_t v36 = -1;
            }
            int v37 = nw_frame_array_unclaimed_length();
            *(_DWORD *)long long buf = 136317698;
            *(void *)&uint8_t buf[4] = out;
            *(_WORD *)&uint8_t buf[12] = 1024;
            *(_DWORD *)&buf[14] = ip_protocol;
            __int16 v127 = 2048;
            uint64_t v128 = v116;
            __int16 v129 = 2048;
            uint64_t v130 = v114;
            __int16 v131 = 2048;
            uint64_t v132 = v118;
            __int16 v133 = 2048;
            uint64_t v134 = v112;
            __int16 v135 = 2048;
            uint64_t v136 = v108;
            __int16 v137 = 2048;
            uint64_t v138 = v107;
            __int16 v139 = 2048;
            uint64_t v140 = v110;
            __int16 v141 = 2048;
            uint64_t v142 = v36;
            __int16 v143 = 1024;
            int v144 = v37;
            uint64_t v14 = v34;
            uint64_t v29 = v34;
            __int16 v30 = v19;
            int v31 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]have %u p"
                  "ending output bytes";
            uint32_t v32 = 104;
            goto LABEL_53;
          }
        }
        else if (v20)
        {
          if (*(void *)(a1 + 80)) {
            int v21 = nw_parameters_get_ip_protocol();
          }
          else {
            int v21 = 0;
          }
          uint64_t v26 = *(unsigned int *)(a1 + 176);
          uint64_t v27 = "unknown";
          if (v26 <= 3) {
            uint64_t v27 = off_264195FA0[v26];
          }
          int v28 = nw_frame_array_unclaimed_length();
          *(_DWORD *)long long buf = 136315906;
          *(void *)&uint8_t buf[4] = out;
          *(_WORD *)&uint8_t buf[12] = 1024;
          *(_DWORD *)&buf[14] = v21;
          __int16 v127 = 2080;
          uint64_t v128 = (uint64_t)v27;
          __int16 v129 = 1024;
          LODWORD(v130) = v28;
          uint64_t v14 = &dword_212970000;
          uint64_t v29 = &dword_212970000;
          __int16 v30 = v19;
          int v31 = "[filter %s %d %s] have %u pending output bytes";
          uint32_t v32 = 34;
LABEL_53:
          _os_log_debug_impl(v29, v30, OS_LOG_TYPE_DEBUG, v31, buf, v32);
        }
        *(void *)long long buf = 0;
        *(void *)&buf[8] = 0;
        nw_frame_array_init();
        nw_frame_array_foreach();
        if ((nw_frame_array_is_empty() & 1) == 0) {
          nw_frame_array_prepend_array();
        }
      }
      if ((nw_frame_array_is_empty() & 1) == 0) {
        *(_DWORD *)(a1 + 120) |= 0x2000u;
      }
      uint64_t v13 = *(void *)(v13 + 152);
      if (!v13) {
        goto LABEL_67;
      }
    }
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)a1, out);
    int v15 = *(_DWORD *)(a1 + 176);
    uint64_t v16 = ne_log_obj();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15 == 3)
    {
      if (v17)
      {
        if (*(void *)(a1 + 80)) {
          int v120 = nw_parameters_get_ip_protocol();
        }
        else {
          int v120 = 0;
        }
        uint64_t v38 = *(void **)(a1 + 160);
        if (v38)
        {
          uint64_t v115 = v38[7];
          uint64_t v117 = v38[6];
          uint64_t v47 = v38[8];
          uint64_t v39 = v38[9];
          uint64_t v119 = v47;
        }
        else
        {
          uint64_t v39 = -1;
          uint64_t v117 = -1;
          uint64_t v119 = -1;
          uint64_t v115 = -1;
        }
        uint64_t v113 = v39;
        uint64_t v48 = v14;
        uint64_t v49 = *(void **)(a1 + 168);
        if (v49)
        {
          uint64_t v50 = v49[7];
          uint64_t v51 = v49[9];
          uint64_t v109 = v49[6];
          uint64_t v111 = v49[8];
        }
        else
        {
          uint64_t v109 = -1;
          uint64_t v111 = -1;
          uint64_t v50 = -1;
          uint64_t v51 = -1;
        }
        int v52 = nw_frame_array_unclaimed_length();
        *(_DWORD *)long long buf = 136317698;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)&buf[14] = v120;
        __int16 v127 = 2048;
        uint64_t v128 = v117;
        __int16 v129 = 2048;
        uint64_t v130 = v115;
        __int16 v131 = 2048;
        uint64_t v132 = v119;
        __int16 v133 = 2048;
        uint64_t v134 = v113;
        __int16 v135 = 2048;
        uint64_t v136 = v109;
        __int16 v137 = 2048;
        uint64_t v138 = v50;
        __int16 v139 = 2048;
        uint64_t v140 = v111;
        __int16 v141 = 2048;
        uint64_t v142 = v51;
        __int16 v143 = 1024;
        int v144 = v52;
        uint64_t v14 = v48;
        uint64_t v43 = v48;
        __int16 v44 = v16;
        uint64_t v45 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending %u by"
              "tes to the next filter";
        uint32_t v46 = 104;
LABEL_66:
        _os_log_debug_impl(v43, v44, OS_LOG_TYPE_DEBUG, v45, buf, v46);
      }
    }
    else if (v17)
    {
      int v22 = v14;
      if (*(void *)(a1 + 80)) {
        int v23 = nw_parameters_get_ip_protocol();
      }
      else {
        int v23 = 0;
      }
      uint64_t v40 = *(unsigned int *)(a1 + 176);
      uint64_t v41 = "unknown";
      if (v40 <= 3) {
        uint64_t v41 = off_264195FA0[v40];
      }
      int v42 = nw_frame_array_unclaimed_length();
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      __int16 v127 = 2080;
      uint64_t v128 = (uint64_t)v41;
      __int16 v129 = 1024;
      LODWORD(v130) = v42;
      uint64_t v14 = v22;
      uint64_t v43 = v22;
      __int16 v44 = v16;
      uint64_t v45 = "[filter %s %d %s] sending %u bytes to the next filter";
      uint32_t v46 = 34;
      goto LABEL_66;
    }
    nw_frame_array_append_array();
    goto LABEL_21;
  }
LABEL_67:
  uint64_t result = nw_frame_array_is_empty();
  if ((result & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 120) & 0x40) == 0)
    {
      uint64_t v54 = *(void *)(a1 + 32);
      if (v54)
      {
        if (*(void *)(*(void *)(v54 + 24) + 96))
        {
          memset(out, 0, 37);
          uuid_unparse((const unsigned __int8 *)a1, out);
          int v55 = *(_DWORD *)(a1 + 176);
          uint64_t v56 = ne_log_obj();
          BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);
          if (v55 == 3)
          {
            if (v57)
            {
              if (*(void *)(a1 + 80)) {
                int v123 = nw_parameters_get_ip_protocol();
              }
              else {
                int v123 = 0;
              }
              long long v91 = *(void **)(a1 + 160);
              if (v91)
              {
                uint64_t v92 = v91[6];
                uint64_t v93 = v91[7];
                uint64_t v94 = v91[9];
                uint64_t v122 = v91[8];
              }
              else
              {
                uint64_t v122 = -1;
                uint64_t v92 = -1;
                uint64_t v93 = -1;
                uint64_t v94 = -1;
              }
              uint64_t v97 = *(void **)(a1 + 168);
              if (v97)
              {
                uint64_t v99 = v97[6];
                uint64_t v100 = v97[7];
                uint64_t v98 = v97[8];
                uint64_t v101 = v97[9];
              }
              else
              {
                uint64_t v98 = -1;
                uint64_t v99 = -1;
                uint64_t v100 = -1;
                uint64_t v101 = -1;
              }
              int v106 = nw_frame_array_unclaimed_length();
              *(_DWORD *)long long buf = 136317698;
              *(void *)&uint8_t buf[4] = out;
              *(_WORD *)&uint8_t buf[12] = 1024;
              *(_DWORD *)&buf[14] = v123;
              __int16 v127 = 2048;
              uint64_t v128 = v92;
              __int16 v129 = 2048;
              uint64_t v130 = v93;
              __int16 v131 = 2048;
              uint64_t v132 = v122;
              __int16 v133 = 2048;
              uint64_t v134 = v94;
              __int16 v135 = 2048;
              uint64_t v136 = v99;
              __int16 v137 = 2048;
              uint64_t v138 = v100;
              __int16 v139 = 2048;
              uint64_t v140 = v98;
              __int16 v141 = 2048;
              uint64_t v142 = v101;
              __int16 v143 = 1024;
              int v144 = v106;
              uint64_t v103 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sendin"
                     "g %u bytes to the network";
              uint64_t v104 = v56;
              uint32_t v105 = 104;
LABEL_127:
              _os_log_debug_impl(&dword_212970000, v104, OS_LOG_TYPE_DEBUG, v103, buf, v105);
            }
          }
          else if (v57)
          {
            if (*(void *)(a1 + 80)) {
              int v90 = nw_parameters_get_ip_protocol();
            }
            else {
              int v90 = 0;
            }
            uint64_t v95 = *(unsigned int *)(a1 + 176);
            if (v95 > 3) {
              uint64_t v96 = "unknown";
            }
            else {
              uint64_t v96 = off_264195FA0[v95];
            }
            int v102 = nw_frame_array_unclaimed_length();
            *(_DWORD *)long long buf = 136315906;
            *(void *)&uint8_t buf[4] = out;
            *(_WORD *)&uint8_t buf[12] = 1024;
            *(_DWORD *)&buf[14] = v90;
            __int16 v127 = 2080;
            uint64_t v128 = (uint64_t)v96;
            __int16 v129 = 1024;
            LODWORD(v130) = v102;
            uint64_t v103 = "[filter %s %d %s] sending %u bytes to the network";
            uint64_t v104 = v56;
            uint32_t v105 = 34;
            goto LABEL_127;
          }
          return (*(uint64_t (**)(uint64_t, void *))(*(void *)(v54 + 24) + 96))(v54, v125);
        }
      }
    }
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)a1, out);
    int v58 = *(_DWORD *)(a1 + 176);
    uint64_t v59 = ne_log_obj();
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG);
    if (v58 == 3)
    {
      if (v60)
      {
        if (*(void *)(a1 + 80)) {
          int v124 = nw_parameters_get_ip_protocol();
        }
        else {
          int v124 = 0;
        }
        int v73 = *(void **)(a1 + 160);
        if (v73)
        {
          uint64_t v75 = v73[6];
          uint64_t v76 = v73[7];
          uint64_t v74 = v73[8];
          uint64_t v77 = v73[9];
        }
        else
        {
          uint64_t v74 = -1;
          uint64_t v75 = -1;
          uint64_t v76 = -1;
          uint64_t v77 = -1;
        }
        __int16 v80 = *(void **)(a1 + 168);
        if (v80)
        {
          uint64_t v82 = v80[6];
          uint64_t v83 = v80[7];
          uint64_t v81 = v80[8];
          uint64_t v84 = v80[9];
        }
        else
        {
          uint64_t v81 = -1;
          uint64_t v82 = -1;
          uint64_t v83 = -1;
          uint64_t v84 = -1;
        }
        int v89 = nw_frame_array_unclaimed_length();
        *(_DWORD *)long long buf = 136317698;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)&buf[14] = v124;
        __int16 v127 = 2048;
        uint64_t v128 = v75;
        __int16 v129 = 2048;
        uint64_t v130 = v76;
        __int16 v131 = 2048;
        uint64_t v132 = v74;
        __int16 v133 = 2048;
        uint64_t v134 = v77;
        __int16 v135 = 2048;
        uint64_t v136 = v82;
        __int16 v137 = 2048;
        uint64_t v138 = v83;
        __int16 v139 = 2048;
        uint64_t v140 = v81;
        __int16 v141 = 2048;
        uint64_t v142 = v84;
        __int16 v143 = 1024;
        int v144 = v89;
        __int16 v86 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output protoc"
              "ol is disconnected or does not exist, dropping %u outbound bytes";
        uint64_t v87 = v59;
        uint32_t v88 = 104;
LABEL_111:
        _os_log_debug_impl(&dword_212970000, v87, OS_LOG_TYPE_DEBUG, v86, buf, v88);
      }
    }
    else if (v60)
    {
      if (*(void *)(a1 + 80)) {
        int v72 = nw_parameters_get_ip_protocol();
      }
      else {
        int v72 = 0;
      }
      uint64_t v78 = *(unsigned int *)(a1 + 176);
      if (v78 > 3) {
        uint64_t v79 = "unknown";
      }
      else {
        uint64_t v79 = off_264195FA0[v78];
      }
      int v85 = nw_frame_array_unclaimed_length();
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v72;
      __int16 v127 = 2080;
      uint64_t v128 = (uint64_t)v79;
      __int16 v129 = 1024;
      LODWORD(v130) = v85;
      __int16 v86 = "[filter %s %d %s] output protocol is disconnected or does not exist, dropping %u outbound bytes";
      uint64_t v87 = v59;
      uint32_t v88 = 34;
      goto LABEL_111;
    }
    return nw_frame_array_foreach();
  }
  return result;
}

void ne_filter_handle_output_finished(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    int v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t v56 = 136315138;
      *(void *)&v56[4] = "ne_filter_handle_output_finished";
      _os_log_fault_impl(&dword_212970000, v21, OS_LOG_TYPE_FAULT, "%s called with null filter", v56, 0xCu);
    }
    return;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v1 + 180), 0)) {
    return;
  }
  int v3 = *(_DWORD *)(v1 + 120);
  if ((v3 & 0x400) != 0 || *(_DWORD *)(v1 + 176) != 3 || (uint64_t v4 = *(void *)(v1 + 144)) == 0)
  {
LABEL_10:
    *(_DWORD *)(v1 + 120) = v3 | 0x400;
    if ((v3 & 0x100) == 0) {
      goto LABEL_23;
    }
    *(_DWORD *)(v1 + 120) = v3 & 0xFFFFFAFF | 0x400;
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v1, out);
    int v6 = *(_DWORD *)(v1 + 176);
    uint64_t v7 = ne_log_obj();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6 == 3)
    {
      if (v8)
      {
        uint64_t v15 = *(void *)(v1 + 80);
        if (v15) {
          LODWORD(v15) = nw_parameters_get_ip_protocol();
        }
        uint64_t v16 = *(void **)(v1 + 160);
        if (v16)
        {
          uint64_t v18 = v16[6];
          uint64_t v19 = v16[7];
          uint64_t v17 = v16[8];
          uint64_t v20 = v16[9];
        }
        else
        {
          uint64_t v17 = -1;
          uint64_t v18 = -1;
          uint64_t v19 = -1;
          uint64_t v20 = -1;
        }
        uint64_t v40 = *(void **)(v1 + 168);
        if (v40)
        {
          uint64_t v42 = v40[6];
          uint64_t v43 = v40[7];
          uint64_t v41 = v40[8];
          uint64_t v44 = v40[9];
        }
        else
        {
          uint64_t v41 = -1;
          uint64_t v42 = -1;
          uint64_t v43 = -1;
          uint64_t v44 = -1;
        }
        *(_DWORD *)uint64_t v56 = 136317442;
        *(void *)&v56[4] = out;
        *(_WORD *)&v56[12] = 1024;
        *(_DWORD *)&v56[14] = v15;
        *(_WORD *)&v56[18] = 2048;
        *(void *)&v56[20] = v18;
        *(_WORD *)&v56[28] = 2048;
        *(void *)&v56[30] = v19;
        *(_WORD *)&v56[38] = 2048;
        uint64_t v57 = v17;
        __int16 v58 = 2048;
        uint64_t v59 = v20;
        __int16 v60 = 2048;
        uint64_t v61 = v42;
        __int16 v62 = 2048;
        uint64_t v63 = v43;
        __int16 v64 = 2048;
        uint64_t v65 = v41;
        __int16 v66 = 2048;
        uint64_t v67 = v44;
        uint64_t v50 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling outpu"
              "t_finished on output protocol";
        uint64_t v51 = v7;
        uint32_t v52 = 98;
LABEL_58:
        _os_log_debug_impl(&dword_212970000, v51, OS_LOG_TYPE_DEBUG, v50, v56, v52);
      }
    }
    else if (v8)
    {
      uint64_t v34 = *(void *)(v1 + 80);
      if (v34) {
        LODWORD(v34) = nw_parameters_get_ip_protocol();
      }
      uint64_t v35 = *(unsigned int *)(v1 + 176);
      if (v35 > 3) {
        uint64_t v36 = "unknown";
      }
      else {
        uint64_t v36 = off_264195FA0[v35];
      }
      *(_DWORD *)uint64_t v56 = 136315650;
      *(void *)&v56[4] = out;
      *(_WORD *)&v56[12] = 1024;
      *(_DWORD *)&v56[14] = v34;
      *(_WORD *)&v56[18] = 2080;
      *(void *)&v56[20] = v36;
      uint64_t v50 = "[filter %s %d %s] calling output_finished on output protocol";
      uint64_t v51 = v7;
      uint32_t v52 = 28;
      goto LABEL_58;
    }
    uint64_t v22 = *(void *)(v1 + 32);
    if (v22)
    {
      int v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))(*(void *)(v22 + 24) + 192);
      if (v23) {
        v23(v22, a1, v9, v10, v11, v12, v13, v14, *(void *)v56, *(void *)&v56[8], *(void *)&v56[16], *(void *)&v56[24], *(void *)&v56[32]);
      }
    }
LABEL_23:
    if ((*(_DWORD *)(v1 + 120) & 0x30) != 0x10) {
      return;
    }
    *(_DWORD *)(v1 + 120) |= 0x20u;
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v1, out);
    int v24 = *(_DWORD *)(v1 + 176);
    uint64_t v25 = ne_log_obj();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24 == 3)
    {
      if (!v26) {
        goto LABEL_31;
      }
      uint64_t v27 = *(void *)(v1 + 80);
      if (v27) {
        LODWORD(v27) = nw_parameters_get_ip_protocol();
      }
      int v28 = *(void **)(v1 + 160);
      if (v28)
      {
        uint64_t v30 = v28[6];
        uint64_t v31 = v28[7];
        uint64_t v29 = v28[8];
        uint64_t v32 = v28[9];
      }
      else
      {
        uint64_t v29 = -1;
        uint64_t v30 = -1;
        uint64_t v31 = -1;
        uint64_t v32 = -1;
      }
      uint64_t v45 = *(void **)(v1 + 168);
      if (v45)
      {
        uint64_t v47 = v45[6];
        uint64_t v48 = v45[7];
        uint64_t v46 = v45[8];
        uint64_t v49 = v45[9];
      }
      else
      {
        uint64_t v46 = -1;
        uint64_t v47 = -1;
        uint64_t v48 = -1;
        uint64_t v49 = -1;
      }
      *(_DWORD *)uint64_t v56 = 136317442;
      *(void *)&v56[4] = out;
      *(_WORD *)&v56[12] = 1024;
      *(_DWORD *)&v56[14] = v27;
      *(_WORD *)&v56[18] = 2048;
      *(void *)&v56[20] = v30;
      *(_WORD *)&v56[28] = 2048;
      *(void *)&v56[30] = v31;
      *(_WORD *)&v56[38] = 2048;
      uint64_t v57 = v29;
      __int16 v58 = 2048;
      uint64_t v59 = v32;
      __int16 v60 = 2048;
      uint64_t v61 = v47;
      __int16 v62 = 2048;
      uint64_t v63 = v48;
      __int16 v64 = 2048;
      uint64_t v65 = v46;
      __int16 v66 = 2048;
      uint64_t v67 = v49;
      uint64_t v53 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling disconn"
            "ect on output protocol";
      uint64_t v54 = v25;
      uint32_t v55 = 98;
    }
    else
    {
      if (!v26) {
        goto LABEL_31;
      }
      uint64_t v37 = *(void *)(v1 + 80);
      if (v37) {
        LODWORD(v37) = nw_parameters_get_ip_protocol();
      }
      uint64_t v38 = *(unsigned int *)(v1 + 176);
      if (v38 > 3) {
        uint64_t v39 = "unknown";
      }
      else {
        uint64_t v39 = off_264195FA0[v38];
      }
      *(_DWORD *)uint64_t v56 = 136315650;
      *(void *)&v56[4] = out;
      *(_WORD *)&v56[12] = 1024;
      *(_DWORD *)&v56[14] = v37;
      *(_WORD *)&v56[18] = 2080;
      *(void *)&v56[20] = v39;
      uint64_t v53 = "[filter %s %d %s] calling disconnect on output protocol";
      uint64_t v54 = v25;
      uint32_t v55 = 28;
    }
    _os_log_debug_impl(&dword_212970000, v54, OS_LOG_TYPE_DEBUG, v53, v56, v55);
LABEL_31:
    uint64_t v33 = *(void *)(v1 + 32);
    if (v33)
    {
      if (*(void *)(*(void *)(v33 + 24) + 32)) {
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 32))();
      }
    }
    return;
  }
  while (1)
  {
    if (*(_DWORD *)(v4 + 40) == 3 && *(void *)(v4 + 64) != -1)
    {
      __int16 v5 = *(_WORD *)(v4 + 144);
      if ((v5 & 0x40) == 0) {
        break;
      }
    }
    uint64_t v4 = *(void *)(v4 + 152);
    if (!v4) {
      goto LABEL_10;
    }
  }
  *(_WORD *)(v4 + 144) = v5 | 4;

  ne_filter_send_approved_frames(v1, 0);
}

uint64_t ne_filter_read_approved_frames(uint64_t a1, uint64_t a2)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  nw_frame_array_init();
  if (a2 && nw_frame_array_unclaimed_length()) {
    nw_frame_array_append_array();
  }
  for (uint64_t i = *(void *)(a1 + 144); i; uint64_t i = *(void *)(i + 152))
  {
    if (*(_DWORD *)(i + 40) == 3 && *(void *)(i + 48) != -1)
    {
      if ((nw_frame_array_is_empty() & 1) == 0)
      {
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)a1, (char *)out);
        int v5 = *(_DWORD *)(a1 + 176);
        int v6 = ne_log_obj();
        BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
        if (v5 == 3)
        {
          if (v7)
          {
            if (*(void *)(a1 + 80)) {
              int ip_protocol = nw_parameters_get_ip_protocol();
            }
            else {
              int ip_protocol = 0;
            }
            BOOL v26 = *(void **)(a1 + 160);
            if (v26)
            {
              uint64_t v27 = v26[7];
              uint64_t v28 = v26[9];
              uint64_t v62 = v26[6];
              uint64_t v64 = v26[8];
            }
            else
            {
              uint64_t v62 = -1;
              uint64_t v64 = -1;
              uint64_t v27 = -1;
              uint64_t v28 = -1;
            }
            uint64_t v32 = *(void **)(a1 + 168);
            if (v32)
            {
              uint64_t v34 = v32[6];
              uint64_t v35 = v32[7];
              uint64_t v33 = v32[8];
              uint64_t v36 = v32[9];
            }
            else
            {
              uint64_t v33 = -1;
              uint64_t v34 = -1;
              uint64_t v35 = -1;
              uint64_t v36 = -1;
            }
            int v37 = nw_frame_array_unclaimed_length();
            *(_DWORD *)long long buf = 136317698;
            *(void *)&uint8_t buf[4] = out;
            *(_WORD *)&uint8_t buf[12] = 1024;
            *(_DWORD *)&buf[14] = ip_protocol;
            __int16 v69 = 2048;
            uint64_t v70 = v62;
            __int16 v71 = 2048;
            uint64_t v72 = v27;
            __int16 v73 = 2048;
            uint64_t v74 = v64;
            __int16 v75 = 2048;
            uint64_t v76 = v28;
            __int16 v77 = 2048;
            uint64_t v78 = v34;
            __int16 v79 = 2048;
            uint64_t v80 = v35;
            __int16 v81 = 2048;
            uint64_t v82 = v33;
            __int16 v83 = 2048;
            uint64_t v84 = v36;
            __int16 v85 = 1024;
            int v86 = v37;
            _os_log_debug_impl(&dword_212970000, v6, OS_LOG_TYPE_DEBUG, "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending %u input bytes to the next filter", buf, 0x68u);
          }
        }
        else if (v7)
        {
          if (*(void *)(a1 + 80)) {
            int v14 = nw_parameters_get_ip_protocol();
          }
          else {
            int v14 = 0;
          }
          uint64_t v29 = *(unsigned int *)(a1 + 176);
          uint64_t v30 = "unknown";
          if (v29 <= 3) {
            uint64_t v30 = off_264195FA0[v29];
          }
          int v31 = nw_frame_array_unclaimed_length();
          *(_DWORD *)long long buf = 136315906;
          *(void *)&uint8_t buf[4] = out;
          *(_WORD *)&uint8_t buf[12] = 1024;
          *(_DWORD *)&buf[14] = v14;
          __int16 v69 = 2080;
          uint64_t v70 = (uint64_t)v30;
          __int16 v71 = 1024;
          LODWORD(v72) = v31;
          _os_log_debug_impl(&dword_212970000, v6, OS_LOG_TYPE_DEBUG, "[filter %s %d %s] sending %u input bytes to the next filter", buf, 0x22u);
        }
        nw_frame_array_append_array();
      }
      if (ne_filter_data_protocol_send_data(a1, i, 1) && (*(_WORD *)(i + 144) & 8) != 0)
      {
        ne_filter_data_protocol_send_finished(a1, i, 10);
        *(_WORD *)(i + 144) &= ~8u;
      }
    }
    if (*(void *)(i + 88) < *(void *)(i + 48) && (nw_frame_array_is_empty() & 1) == 0)
    {
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)a1, (char *)out);
      int v8 = *(_DWORD *)(a1 + 176);
      uint64_t v9 = ne_log_obj();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8 == 3)
      {
        if (v10)
        {
          if (*(void *)(a1 + 80)) {
            int v66 = nw_parameters_get_ip_protocol();
          }
          else {
            int v66 = 0;
          }
          uint64_t v15 = *(void **)(a1 + 160);
          if (v15)
          {
            uint64_t v60 = v15[7];
            uint64_t v61 = v15[6];
            uint64_t v16 = v15[9];
            uint64_t v63 = v15[8];
          }
          else
          {
            uint64_t v61 = -1;
            uint64_t v63 = -1;
            uint64_t v60 = -1;
            uint64_t v16 = -1;
          }
          uint64_t v20 = *(void **)(a1 + 168);
          if (v20)
          {
            uint64_t v22 = v20[6];
            uint64_t v23 = v20[7];
            uint64_t v21 = v20[8];
            uint64_t v24 = v20[9];
          }
          else
          {
            uint64_t v21 = -1;
            uint64_t v22 = -1;
            uint64_t v23 = -1;
            uint64_t v24 = -1;
          }
          int v25 = nw_frame_array_unclaimed_length();
          *(_DWORD *)long long buf = 136317698;
          *(void *)&uint8_t buf[4] = out;
          *(_WORD *)&uint8_t buf[12] = 1024;
          *(_DWORD *)&buf[14] = v66;
          __int16 v69 = 2048;
          uint64_t v70 = v61;
          __int16 v71 = 2048;
          uint64_t v72 = v60;
          __int16 v73 = 2048;
          uint64_t v74 = v63;
          __int16 v75 = 2048;
          uint64_t v76 = v16;
          __int16 v77 = 2048;
          uint64_t v78 = v22;
          __int16 v79 = 2048;
          uint64_t v80 = v23;
          __int16 v81 = 2048;
          uint64_t v82 = v21;
          __int16 v83 = 2048;
          uint64_t v84 = v24;
          __int16 v85 = 1024;
          int v86 = v25;
          _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]have %u pending input bytes", buf, 0x68u);
        }
      }
      else if (v10)
      {
        if (*(void *)(a1 + 80)) {
          int v13 = nw_parameters_get_ip_protocol();
        }
        else {
          int v13 = 0;
        }
        uint64_t v17 = *(unsigned int *)(a1 + 176);
        uint64_t v18 = "unknown";
        if (v17 <= 3) {
          uint64_t v18 = off_264195FA0[v17];
        }
        int v19 = nw_frame_array_unclaimed_length();
        *(_DWORD *)long long buf = 136315906;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        __int16 v69 = 2080;
        uint64_t v70 = (uint64_t)v18;
        __int16 v71 = 1024;
        LODWORD(v72) = v19;
        _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "[filter %s %d %s] have %u pending input bytes", buf, 0x22u);
      }
      *(void *)long long buf = 0;
      *(void *)&buf[8] = 0;
      nw_frame_array_init();
      int v11 = *(_DWORD *)(i + 48) - *(_DWORD *)(i + 88);
      out[0] = 0;
      int v12 = ne_filter_protocol_fulfill_frame_request(a1, i + 24, (uint64_t)buf, (*(_DWORD *)(a1 + 120) & 0x8000) == 0, v11, -1, out);
      *(void *)(i + 88) += out[0];
      if (v12) {
        nw_frame_array_prepend_array();
      }
    }
    if ((nw_frame_array_is_empty() & 1) == 0) {
      *(_DWORD *)(a1 + 120) |= 0x1000u;
    }
  }
  uint64_t result = nw_frame_array_is_empty();
  if ((result & 1) == 0)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)a1, (char *)out);
    int v39 = *(_DWORD *)(a1 + 176);
    uint64_t v40 = ne_log_obj();
    BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
    if (v39 == 3)
    {
      if (v41)
      {
        if (*(void *)(a1 + 80)) {
          int v67 = nw_parameters_get_ip_protocol();
        }
        else {
          int v67 = 0;
        }
        uint64_t v43 = *(void **)(a1 + 160);
        if (v43)
        {
          uint64_t v45 = v43[6];
          uint64_t v46 = v43[7];
          uint64_t v44 = v43[8];
          uint64_t v47 = v43[9];
        }
        else
        {
          uint64_t v44 = -1;
          uint64_t v45 = -1;
          uint64_t v46 = -1;
          uint64_t v47 = -1;
        }
        uint64_t v50 = *(void **)(a1 + 168);
        if (v50)
        {
          uint64_t v52 = v50[6];
          uint64_t v53 = v50[7];
          uint64_t v51 = v50[8];
          uint64_t v54 = v50[9];
        }
        else
        {
          uint64_t v51 = -1;
          uint64_t v52 = -1;
          uint64_t v53 = -1;
          uint64_t v54 = -1;
        }
        int v59 = nw_frame_array_unclaimed_length();
        *(_DWORD *)long long buf = 136317698;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)&buf[14] = v67;
        __int16 v69 = 2048;
        uint64_t v70 = v45;
        __int16 v71 = 2048;
        uint64_t v72 = v46;
        __int16 v73 = 2048;
        uint64_t v74 = v44;
        __int16 v75 = 2048;
        uint64_t v76 = v47;
        __int16 v77 = 2048;
        uint64_t v78 = v52;
        __int16 v79 = 2048;
        uint64_t v80 = v53;
        __int16 v81 = 2048;
        uint64_t v82 = v51;
        __int16 v83 = 2048;
        uint64_t v84 = v54;
        __int16 v85 = 1024;
        int v86 = v59;
        uint64_t v56 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]accepting %u input bytes";
        uint64_t v57 = v40;
        uint32_t v58 = 104;
LABEL_81:
        _os_log_debug_impl(&dword_212970000, v57, OS_LOG_TYPE_DEBUG, v56, buf, v58);
      }
    }
    else if (v41)
    {
      if (*(void *)(a1 + 80)) {
        int v42 = nw_parameters_get_ip_protocol();
      }
      else {
        int v42 = 0;
      }
      uint64_t v48 = *(unsigned int *)(a1 + 176);
      if (v48 > 3) {
        uint64_t v49 = "unknown";
      }
      else {
        uint64_t v49 = off_264195FA0[v48];
      }
      int v55 = nw_frame_array_unclaimed_length();
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v42;
      __int16 v69 = 2080;
      uint64_t v70 = (uint64_t)v49;
      __int16 v71 = 1024;
      LODWORD(v72) = v55;
      uint64_t v56 = "[filter %s %d %s] accepting %u input bytes";
      uint64_t v57 = v40;
      uint32_t v58 = 34;
      goto LABEL_81;
    }
    return nw_frame_array_append_array();
  }
  return result;
}

void ne_filter_handle_input_finished(uint64_t a1, uint64_t a2)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)uint64_t v63 = 136315138;
    *(void *)&v63[4] = "ne_filter_handle_input_finished";
    uint64_t v24 = "%s called with null protocol";
    goto LABEL_28;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)uint64_t v63 = 136315138;
    *(void *)&v63[4] = "ne_filter_handle_input_finished";
    uint64_t v24 = "%s called with null filter";
LABEL_28:
    _os_log_fault_impl(&dword_212970000, v23, OS_LOG_TYPE_FAULT, v24, v63, 0xCu);
    return;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 180), 0)) {
    return;
  }
  int v4 = *(_DWORD *)(v3 + 120);
  if ((v4 & 0x800) != 0 || *(_DWORD *)(v3 + 176) != 3 || (uint64_t v5 = *(void *)(v3 + 144)) == 0)
  {
LABEL_11:
    *(_DWORD *)(v3 + 120) = v4 | 0x800;
    if (a2 && (nw_frame_array_is_empty() & 1) == 0) {
      nw_frame_array_append_array();
    }
    int v7 = *(_DWORD *)(v3 + 120);
    if ((v7 & 0x10) == 0)
    {
      if (!nw_frame_array_is_empty())
      {
        ne_filter_protocol_input_available(a1);
        return;
      }
      int v7 = *(_DWORD *)(v3 + 120);
    }
    if ((v7 & 0x200) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)(v3 + 120) & 0xC0) != 0x40) {
        return;
      }
      *(_DWORD *)(v3 + 120) |= 0x80u;
      for (uint64_t i = *(void *)(v3 + 144); i; uint64_t i = *(void *)(i + 152))
        ne_filter_data_protocol_send_finished(a1, i, 11);
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)v3, out);
      int v29 = *(_DWORD *)(v3 + 176);
      uint64_t v30 = ne_log_obj();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
      if (v29 == 3)
      {
        if (v31)
        {
          uint64_t v32 = *(void *)(v3 + 80);
          if (v32) {
            LODWORD(v32) = nw_parameters_get_ip_protocol();
          }
          uint64_t v33 = *(void **)(v3 + 160);
          if (v33)
          {
            uint64_t v35 = v33[6];
            uint64_t v36 = v33[7];
            uint64_t v34 = v33[8];
            uint64_t v37 = v33[9];
          }
          else
          {
            uint64_t v34 = -1;
            uint64_t v35 = -1;
            uint64_t v36 = -1;
            uint64_t v37 = -1;
          }
          uint64_t v52 = *(void **)(v3 + 168);
          if (v52)
          {
            uint64_t v54 = v52[6];
            uint64_t v55 = v52[7];
            uint64_t v53 = v52[8];
            uint64_t v56 = v52[9];
          }
          else
          {
            uint64_t v53 = -1;
            uint64_t v54 = -1;
            uint64_t v55 = -1;
            uint64_t v56 = -1;
          }
          *(_DWORD *)uint64_t v63 = 136317442;
          *(void *)&v63[4] = out;
          *(_WORD *)&v63[12] = 1024;
          *(_DWORD *)&v63[14] = v32;
          *(_WORD *)&v63[18] = 2048;
          *(void *)&v63[20] = v35;
          *(_WORD *)&v63[28] = 2048;
          *(void *)&v63[30] = v36;
          *(_WORD *)&v63[38] = 2048;
          uint64_t v64 = v34;
          __int16 v65 = 2048;
          uint64_t v66 = v37;
          __int16 v67 = 2048;
          uint64_t v68 = v54;
          __int16 v69 = 2048;
          uint64_t v70 = v55;
          __int16 v71 = 2048;
          uint64_t v72 = v53;
          __int16 v73 = 2048;
          uint64_t v74 = v56;
          uint64_t v60 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling dis"
                "connected on input protocol";
          uint64_t v61 = v30;
          uint32_t v62 = 98;
LABEL_78:
          _os_log_debug_impl(&dword_212970000, v61, OS_LOG_TYPE_DEBUG, v60, v63, v62);
        }
      }
      else if (v31)
      {
        uint64_t v44 = *(void *)(v3 + 80);
        if (v44) {
          LODWORD(v44) = nw_parameters_get_ip_protocol();
        }
        uint64_t v45 = *(unsigned int *)(v3 + 176);
        if (v45 > 3) {
          uint64_t v46 = "unknown";
        }
        else {
          uint64_t v46 = off_264195FA0[v45];
        }
        *(_DWORD *)uint64_t v63 = 136315650;
        *(void *)&v63[4] = out;
        *(_WORD *)&v63[12] = 1024;
        *(_DWORD *)&v63[14] = v44;
        *(_WORD *)&v63[18] = 2080;
        *(void *)&v63[20] = v46;
        uint64_t v60 = "[filter %s %d %s] calling disconnected on input protocol";
        uint64_t v61 = v30;
        uint32_t v62 = 28;
        goto LABEL_78;
      }
      uint64_t v38 = *(void *)(v3 + 48);
      if (v38)
      {
        uint64_t v39 = *(void *)(v38 + 24);
        if (v39)
        {
          uint64_t v40 = *(void (**)(void))(v39 + 48);
          if (v40) {
            v40();
          }
        }
      }
      return;
    }
    *(_DWORD *)(v3 + 120) = v7 & 0xFFFFFDFF;
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, out);
    int v8 = *(_DWORD *)(v3 + 176);
    uint64_t v9 = ne_log_obj();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 == 3)
    {
      if (v10)
      {
        uint64_t v17 = *(void *)(v3 + 80);
        if (v17) {
          LODWORD(v17) = nw_parameters_get_ip_protocol();
        }
        uint64_t v18 = *(void **)(v3 + 160);
        if (v18)
        {
          uint64_t v20 = v18[6];
          uint64_t v21 = v18[7];
          uint64_t v19 = v18[8];
          uint64_t v22 = v18[9];
        }
        else
        {
          uint64_t v19 = -1;
          uint64_t v20 = -1;
          uint64_t v21 = -1;
          uint64_t v22 = -1;
        }
        uint64_t v47 = *(void **)(v3 + 168);
        if (v47)
        {
          uint64_t v49 = v47[6];
          uint64_t v50 = v47[7];
          uint64_t v48 = v47[8];
          uint64_t v51 = v47[9];
        }
        else
        {
          uint64_t v48 = -1;
          uint64_t v49 = -1;
          uint64_t v50 = -1;
          uint64_t v51 = -1;
        }
        *(_DWORD *)uint64_t v63 = 136317442;
        *(void *)&v63[4] = out;
        *(_WORD *)&v63[12] = 1024;
        *(_DWORD *)&v63[14] = v17;
        *(_WORD *)&v63[18] = 2048;
        *(void *)&v63[20] = v20;
        *(_WORD *)&v63[28] = 2048;
        *(void *)&v63[30] = v21;
        *(_WORD *)&v63[38] = 2048;
        uint64_t v64 = v19;
        __int16 v65 = 2048;
        uint64_t v66 = v22;
        __int16 v67 = 2048;
        uint64_t v68 = v49;
        __int16 v69 = 2048;
        uint64_t v70 = v50;
        __int16 v71 = 2048;
        uint64_t v72 = v48;
        __int16 v73 = 2048;
        uint64_t v74 = v51;
        uint64_t v57 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling input"
              "_finished on input protocol";
        uint32_t v58 = v9;
        uint32_t v59 = 98;
LABEL_75:
        _os_log_debug_impl(&dword_212970000, v58, OS_LOG_TYPE_DEBUG, v57, v63, v59);
      }
    }
    else if (v10)
    {
      uint64_t v41 = *(void *)(v3 + 80);
      if (v41) {
        LODWORD(v41) = nw_parameters_get_ip_protocol();
      }
      uint64_t v42 = *(unsigned int *)(v3 + 176);
      if (v42 > 3) {
        uint64_t v43 = "unknown";
      }
      else {
        uint64_t v43 = off_264195FA0[v42];
      }
      *(_DWORD *)uint64_t v63 = 136315650;
      *(void *)&v63[4] = out;
      *(_WORD *)&v63[12] = 1024;
      *(_DWORD *)&v63[14] = v41;
      *(_WORD *)&v63[18] = 2080;
      *(void *)&v63[20] = v43;
      uint64_t v57 = "[filter %s %d %s] calling input_finished on input protocol";
      uint32_t v58 = v9;
      uint32_t v59 = 28;
      goto LABEL_75;
    }
    uint64_t v25 = *(void *)(v3 + 48);
    if (v25)
    {
      uint64_t v26 = *(void *)(v25 + 24);
      if (v26)
      {
        uint64_t v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void))(v26 + 184);
        if (v27) {
          v27(v25, a1, v11, v12, v13, v14, v15, v16, *(void *)v63, *(void *)&v63[8], *(void *)&v63[16], *(void *)&v63[24], *(void *)&v63[32]);
        }
      }
    }
    goto LABEL_37;
  }
  while (1)
  {
    if (*(_DWORD *)(v5 + 40) == 3 && *(void *)(v5 + 48) != -1)
    {
      __int16 v6 = *(_WORD *)(v5 + 144);
      if ((v6 & 0x80) == 0) {
        break;
      }
    }
    uint64_t v5 = *(void *)(v5 + 152);
    if (!v5) {
      goto LABEL_11;
    }
  }
  *(_WORD *)(v5 + 144) = v6 | 8;

  ne_filter_read_approved_frames(v3, a2);
}

void ne_filter_protocol_input_available(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    int v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v10 = 136315138;
    uint64_t v11 = "ne_filter_protocol_input_available";
    int v8 = "%s called with null protocol";
LABEL_19:
    _os_log_fault_impl(&dword_212970000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    return;
  }
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    int v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v10 = 136315138;
    uint64_t v11 = "ne_filter_protocol_input_available";
    int v8 = "%s called with null filter";
    goto LABEL_19;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v1 + 180), 0))
  {
    int v2 = *(_DWORD *)(v1 + 176);
    if (v2 == 3 || v2 == 1)
    {
      uint64_t v4 = *(void *)(v1 + 48);
      if (v4)
      {
        uint64_t v5 = *(void *)(v4 + 24);
        if (v5)
        {
          __int16 v6 = *(void (**)(void))(v5 + 64);
          if (v6)
          {
            v6();
          }
        }
      }
    }
    else if (!v2)
    {
      uint64_t v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v10, 2u);
      }
    }
  }
}

void ne_filter_cleanup(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v31 = 136315138;
    uint64_t v32 = "ne_filter_cleanup";
    uint64_t v15 = "%s called with null protocol";
    goto LABEL_30;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v31 = 136315138;
    uint64_t v32 = "ne_filter_cleanup";
    uint64_t v15 = "%s called with null filter";
LABEL_30:
    _os_log_fault_impl(&dword_212970000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v31, 0xCu);
    return;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0)) {
    return;
  }
  if ((~*(_DWORD *)(v2 + 120) & 0x10001) != 0 || (*(_DWORD *)(v2 + 120) & 0x88) == 8) {
    return;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v5 = *(_DWORD *)(v2 + 176);
    __int16 v6 = ne_log_obj();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5 == 3)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(v2 + 80);
        if (v8) {
          LODWORD(v8) = nw_parameters_get_ip_protocol();
        }
        uint64_t v9 = *(void **)(v2 + 160);
        if (v9)
        {
          uint64_t v11 = v9[6];
          uint64_t v12 = v9[7];
          uint64_t v10 = v9[8];
          uint64_t v13 = v9[9];
        }
        else
        {
          uint64_t v10 = -1;
          uint64_t v11 = -1;
          uint64_t v12 = -1;
          uint64_t v13 = -1;
        }
        uint64_t v23 = *(void **)(v2 + 168);
        if (v23)
        {
          uint64_t v25 = v23[6];
          uint64_t v26 = v23[7];
          uint64_t v24 = v23[8];
          uint64_t v27 = v23[9];
        }
        else
        {
          uint64_t v24 = -1;
          uint64_t v25 = -1;
          uint64_t v26 = -1;
          uint64_t v27 = -1;
        }
        int v31 = 136317442;
        uint64_t v32 = out;
        __int16 v33 = 1024;
        int v34 = v8;
        __int16 v35 = 2048;
        uint64_t v36 = v11;
        __int16 v37 = 2048;
        uint64_t v38 = v12;
        __int16 v39 = 2048;
        uint64_t v40 = v10;
        __int16 v41 = 2048;
        uint64_t v42 = v13;
        __int16 v43 = 2048;
        uint64_t v44 = v25;
        __int16 v45 = 2048;
        uint64_t v46 = v26;
        __int16 v47 = 2048;
        uint64_t v48 = v24;
        __int16 v49 = 2048;
        uint64_t v50 = v27;
        uint64_t v28 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]tearing down output handler";
        int v29 = v6;
        uint32_t v30 = 98;
LABEL_42:
        _os_log_debug_impl(&dword_212970000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v31, v30);
      }
    }
    else if (v7)
    {
      uint64_t v20 = *(void *)(v2 + 80);
      if (v20) {
        LODWORD(v20) = nw_parameters_get_ip_protocol();
      }
      uint64_t v21 = *(unsigned int *)(v2 + 176);
      if (v21 > 3) {
        uint64_t v22 = "unknown";
      }
      else {
        uint64_t v22 = off_264195FA0[v21];
      }
      int v31 = 136315650;
      uint64_t v32 = out;
      __int16 v33 = 1024;
      int v34 = v20;
      __int16 v35 = 2080;
      uint64_t v36 = (uint64_t)v22;
      uint64_t v28 = "[filter %s %d %s] tearing down output handler";
      int v29 = v6;
      uint32_t v30 = 28;
      goto LABEL_42;
    }
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 + 24) + 8);
    if (v16) {
      v16(v4, a1, 1);
    }
    *(void *)(a1 + 32) = 0;
  }
  ne_filter_unregister_flow(*(void *)(v2 + 96), a1);
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17)
  {
    uint64_t v18 = (atomic_uint *)(v17 + 180);
    if (atomic_fetch_or(v18, 0))
    {
      if (atomic_fetch_add(v18, 0xFFFFFFFF) == 1) {
        ne_filter_protocol_destroy(a1);
      }
    }
  }
  else
  {
    uint64_t v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_212970000, v19, OS_LOG_TYPE_INFO, "filter is null", (uint8_t *)&v31, 2u);
    }
  }
}

BOOL ne_filter_data_protocol_send_data(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v321 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v28 = ne_log_obj();
    BOOL result = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_212970000, v28, OS_LOG_TYPE_INFO, "filter is null", buf, 2u);
    return 0;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 180), 0)) {
    return 0;
  }
  int v4 = a3;
  uint64_t v6 = a1;
  uint64_t v7 = 104;
  if (a3) {
    uint64_t v7 = 88;
  }
  unint64_t v8 = *(void *)(a2 + v7);
  uint64_t v9 = (uint64_t *)(a2 + 96);
  uint64_t v10 = (uint64_t *)(a2 + 112);
  uint64_t v11 = 112;
  if (a3)
  {
    uint64_t v11 = 96;
    uint64_t v12 = (void *)(a2 + 96);
  }
  else
  {
    uint64_t v12 = (void *)(a2 + 112);
  }
  size_t length = v12;
  unint64_t v13 = *(void *)(a2 + v11);
  unsigned int v14 = nw_frame_array_unclaimed_length();
  if (!v14)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v30 = *(_DWORD *)(v3 + 176);
    int v31 = ne_log_obj();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
    if (v30 == 3)
    {
      if (v32)
      {
        uint64_t v33 = *(void *)(v3 + 80);
        if (v33) {
          LODWORD(v33) = nw_parameters_get_ip_protocol();
        }
        int v34 = *(void **)(v3 + 160);
        if (v34)
        {
          uint64_t v36 = v34[6];
          uint64_t v37 = v34[7];
          uint64_t v35 = v34[8];
          uint64_t v38 = v34[9];
        }
        else
        {
          uint64_t v35 = -1;
          uint64_t v36 = -1;
          uint64_t v37 = -1;
          uint64_t v38 = -1;
        }
        v177 = *(void **)(v3 + 168);
        if (v177)
        {
          uint64_t v179 = v177[6];
          uint64_t v180 = v177[7];
          uint64_t v178 = v177[8];
          uint64_t v181 = v177[9];
        }
        else
        {
          uint64_t v178 = -1;
          uint64_t v179 = -1;
          uint64_t v180 = -1;
          uint64_t v181 = -1;
        }
        *(void *)&uint8_t buf[4] = out;
        v186 = "out";
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)long long buf = 136317698;
        if (v4) {
          v186 = "in";
        }
        *(_DWORD *)&buf[14] = v33;
        *(_WORD *)&unsigned char buf[18] = 2048;
        *(void *)&buf[20] = v36;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v37;
        __int16 v302 = 2048;
        unint64_t v303 = v35;
        __int16 v304 = 2048;
        uint64_t v305 = v38;
        __int16 v306 = 2048;
        uint64_t v307 = v179;
        __int16 v308 = 2048;
        uint64_t v309 = v180;
        __int16 v310 = 2048;
        uint64_t v311 = v178;
        __int16 v312 = 2048;
        uint64_t v313 = v181;
        __int16 v314 = 2080;
        size_t v315 = (size_t)v186;
        v183 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound p"
               "ending bytes to filter";
        v184 = v31;
        uint32_t v185 = 108;
        goto LABEL_240;
      }
    }
    else if (v32)
    {
      uint64_t v39 = *(void *)(v3 + 80);
      if (v39) {
        LODWORD(v39) = nw_parameters_get_ip_protocol();
      }
      uint64_t v40 = *(unsigned int *)(v3 + 176);
      if (v40 > 3) {
        __int16 v41 = "unknown";
      }
      else {
        __int16 v41 = off_264195FA0[v40];
      }
      v182 = "out";
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)long long buf = 136315906;
      if (v4) {
        v182 = "in";
      }
      *(_DWORD *)&buf[14] = v39;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v41;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v182;
      v183 = "[filter %s %d %s] no %sbound pending bytes to filter";
      v184 = v31;
      uint32_t v185 = 38;
      goto LABEL_240;
    }
    return 1;
  }
  v293 = v10;
  unsigned int v295 = v14;
  if (v13 >= v8)
  {
    unint64_t v18 = v13;
    goto LABEL_32;
  }
  uint64_t v15 = v6;
  uint64_t v16 = v9;
  int v17 = v4;
  unint64_t v18 = v8;
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  int v19 = *(_DWORD *)(v3 + 176);
  uint64_t v20 = ne_log_obj();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19 == 3)
  {
    int v4 = v17;
    uint64_t v9 = v16;
    uint64_t v6 = v15;
    if (!v21) {
      goto LABEL_32;
    }
    uint64_t v22 = *(void *)(v3 + 80);
    if (v22) {
      LODWORD(v22) = nw_parameters_get_ip_protocol();
    }
    uint64_t v23 = *(void **)(v3 + 160);
    if (v23)
    {
      uint64_t v25 = v23[6];
      uint64_t v26 = v23[7];
      uint64_t v24 = v23[8];
      uint64_t v27 = v23[9];
    }
    else
    {
      uint64_t v24 = -1;
      uint64_t v25 = -1;
      uint64_t v26 = -1;
      uint64_t v27 = -1;
    }
    v187 = *(void **)(v3 + 168);
    if (v187)
    {
      uint64_t v189 = v187[6];
      uint64_t v190 = v187[7];
      uint64_t v188 = v187[8];
      uint64_t v191 = v187[9];
    }
    else
    {
      uint64_t v188 = -1;
      uint64_t v189 = -1;
      uint64_t v190 = -1;
      uint64_t v191 = -1;
    }
    *(void *)&uint8_t buf[4] = out;
    v205 = "out";
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)long long buf = 136318210;
    if (v4) {
      v205 = "in";
    }
    *(_DWORD *)&buf[14] = v22;
    *(_WORD *)&unsigned char buf[18] = 2048;
    *(void *)&buf[20] = v25;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v26;
    __int16 v302 = 2048;
    unint64_t v303 = v24;
    __int16 v304 = 2048;
    uint64_t v305 = v27;
    __int16 v306 = 2048;
    uint64_t v307 = v189;
    __int16 v308 = 2048;
    uint64_t v309 = v190;
    __int16 v310 = 2048;
    uint64_t v311 = v188;
    __int16 v312 = 2048;
    uint64_t v313 = v191;
    __int16 v314 = 2080;
    size_t v315 = (size_t)v205;
    __int16 v316 = 2048;
    unint64_t v317 = v13;
    __int16 v318 = 2048;
    unint64_t v319 = v8;
    v202 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]%sbound sent off"
           "set less than start, adjusting from %llu to %llu";
    v203 = v20;
    uint32_t v204 = 128;
  }
  else
  {
    int v4 = v17;
    uint64_t v9 = v16;
    uint64_t v6 = v15;
    if (!v21) {
      goto LABEL_32;
    }
    uint64_t v138 = *(void *)(v3 + 80);
    if (v138) {
      LODWORD(v138) = nw_parameters_get_ip_protocol();
    }
    uint64_t v139 = *(unsigned int *)(v3 + 176);
    if (v139 > 3) {
      uint64_t v140 = "unknown";
    }
    else {
      uint64_t v140 = off_264195FA0[v139];
    }
    *(void *)&uint8_t buf[4] = out;
    v201 = "out";
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)long long buf = 136316418;
    if (v4) {
      v201 = "in";
    }
    *(_DWORD *)&buf[14] = v138;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = v140;
    *(_WORD *)&buf[28] = 2080;
    *(void *)&buf[30] = v201;
    __int16 v302 = 2048;
    unint64_t v303 = v13;
    __int16 v304 = 2048;
    uint64_t v305 = v8;
    v202 = "[filter %s %d %s] %sbound sent offset less than start, adjusting from %llu to %llu";
    v203 = v20;
    uint32_t v204 = 58;
  }
  _os_log_debug_impl(&dword_212970000, v203, OS_LOG_TYPE_DEBUG, v202, buf, v204);
LABEL_32:
  int v294 = v4;
  BOOL v42 = v4 == 0;
  uint64_t v43 = 64;
  if (v4) {
    uint64_t v43 = 48;
  }
  unint64_t v44 = *(void *)(a2 + v43);
  uint64_t v45 = 72;
  if (!v42) {
    uint64_t v45 = 56;
  }
  unint64_t v46 = *(void *)(a2 + v45);
  if (v46 <= v44)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v58 = *(_DWORD *)(v3 + 176);
    uint32_t v59 = ne_log_obj();
    BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG);
    if (v58 == 3)
    {
      if (v60)
      {
        uint64_t v61 = *(void *)(v3 + 80);
        if (v61) {
          LODWORD(v61) = nw_parameters_get_ip_protocol();
        }
        uint32_t v62 = *(void **)(v3 + 160);
        if (v62)
        {
          uint64_t v64 = v62[6];
          uint64_t v65 = v62[7];
          uint64_t v63 = v62[8];
          uint64_t v66 = v62[9];
        }
        else
        {
          uint64_t v63 = -1;
          uint64_t v64 = -1;
          uint64_t v65 = -1;
          uint64_t v66 = -1;
        }
        v192 = *(void **)(v3 + 168);
        if (v192)
        {
          uint64_t v194 = v192[6];
          uint64_t v195 = v192[7];
          uint64_t v193 = v192[8];
          uint64_t v196 = v192[9];
        }
        else
        {
          uint64_t v193 = -1;
          uint64_t v194 = -1;
          uint64_t v195 = -1;
          uint64_t v196 = -1;
        }
        *(void *)&uint8_t buf[4] = out;
        v206 = "out";
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)long long buf = 136318210;
        if (v294) {
          v206 = "in";
        }
        *(_DWORD *)&buf[14] = v61;
        *(_WORD *)&unsigned char buf[18] = 2048;
        *(void *)&buf[20] = v64;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v65;
        __int16 v302 = 2048;
        unint64_t v303 = v63;
        __int16 v304 = 2048;
        uint64_t v305 = v66;
        __int16 v306 = 2048;
        uint64_t v307 = v194;
        __int16 v308 = 2048;
        uint64_t v309 = v195;
        __int16 v310 = 2048;
        uint64_t v311 = v193;
        __int16 v312 = 2048;
        uint64_t v313 = v196;
        __int16 v314 = 2080;
        size_t v315 = (size_t)v206;
        __int16 v316 = 2048;
        unint64_t v317 = v46;
        __int16 v318 = 2048;
        unint64_t v319 = v44;
        v183 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound b"
               "ytes to peek (%llu < %llu)";
        v184 = v59;
        uint32_t v185 = 128;
        goto LABEL_240;
      }
    }
    else if (v60)
    {
      uint64_t v67 = *(void *)(v3 + 80);
      if (v67) {
        LODWORD(v67) = nw_parameters_get_ip_protocol();
      }
      uint64_t v68 = *(unsigned int *)(v3 + 176);
      if (v68 > 3) {
        __int16 v69 = "unknown";
      }
      else {
        __int16 v69 = off_264195FA0[v68];
      }
      *(void *)&uint8_t buf[4] = out;
      v197 = "out";
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)long long buf = 136316418;
      if (v294) {
        v197 = "in";
      }
      *(_DWORD *)&buf[14] = v67;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v69;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v197;
      __int16 v302 = 2048;
      unint64_t v303 = v46;
      __int16 v304 = 2048;
      uint64_t v305 = v44;
      v183 = "[filter %s %d %s] no %sbound bytes to peek (%llu < %llu)";
      v184 = v59;
      uint32_t v185 = 58;
      goto LABEL_240;
    }
    return 1;
  }
  unint64_t v47 = v18 - v8;
  unint64_t v48 = v44 - v18;
  if (v44 <= v18)
  {
    unint64_t v44 = v18;
    unsigned int v51 = v295;
    goto LABEL_58;
  }
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  int v49 = *(_DWORD *)(v3 + 176);
  UInt8 bytes = ne_log_obj();
  BOOL v50 = os_log_type_enabled(bytes, OS_LOG_TYPE_DEBUG);
  if (v49 == 3)
  {
    unsigned int v51 = v295;
    if (v50)
    {
      uint64_t v52 = *(void *)(v3 + 80);
      if (v52) {
        LODWORD(v52) = nw_parameters_get_ip_protocol();
      }
      uint64_t v53 = *(void **)(v3 + 160);
      if (v53)
      {
        uint64_t v55 = v53[6];
        uint64_t v56 = v53[7];
        uint64_t v54 = v53[8];
        uint64_t v57 = v53[9];
      }
      else
      {
        uint64_t v54 = -1;
        uint64_t v55 = -1;
        uint64_t v56 = -1;
        uint64_t v57 = -1;
      }
      v210 = *(void **)(v3 + 168);
      if (v210)
      {
        uint64_t v212 = v210[6];
        uint64_t v213 = v210[7];
        uint64_t v211 = v210[8];
        uint64_t v214 = v210[9];
      }
      else
      {
        uint64_t v211 = -1;
        uint64_t v212 = -1;
        uint64_t v213 = -1;
        uint64_t v214 = -1;
      }
      v225 = "out";
      *(_DWORD *)long long buf = 136318210;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      if (v294) {
        v225 = "in";
      }
      *(_DWORD *)&buf[14] = v52;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v55;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v56;
      __int16 v302 = 2048;
      unint64_t v303 = v54;
      __int16 v304 = 2048;
      uint64_t v305 = v57;
      __int16 v306 = 2048;
      uint64_t v307 = v212;
      __int16 v308 = 2048;
      uint64_t v309 = v213;
      __int16 v310 = 2048;
      uint64_t v311 = v211;
      __int16 v312 = 2048;
      uint64_t v313 = v214;
      __int16 v314 = 2080;
      size_t v315 = (size_t)v225;
      __int16 v316 = 2048;
      unint64_t v317 = v47;
      __int16 v318 = 2048;
      unint64_t v319 = v48 + v47;
      v222 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]already passed"
             " %sbound bytes, moving frameArrayStart offset from %llu to %llu";
      v223 = bytes;
      uint32_t v224 = 128;
LABEL_235:
      _os_log_debug_impl(&dword_212970000, v223, OS_LOG_TYPE_DEBUG, v222, buf, v224);
    }
  }
  else
  {
    unsigned int v51 = v295;
    if (v50)
    {
      uint64_t v198 = *(void *)(v3 + 80);
      if (v198) {
        LODWORD(v198) = nw_parameters_get_ip_protocol();
      }
      uint64_t v199 = *(unsigned int *)(v3 + 176);
      if (v199 > 3) {
        v200 = "unknown";
      }
      else {
        v200 = off_264195FA0[v199];
      }
      v221 = "out";
      *(_DWORD *)long long buf = 136316418;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      if (v294) {
        v221 = "in";
      }
      *(_DWORD *)&buf[14] = v198;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v200;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v221;
      __int16 v302 = 2048;
      unint64_t v303 = v47;
      __int16 v304 = 2048;
      uint64_t v305 = v48 + v47;
      v222 = "[filter %s %d %s] already passed %sbound bytes, moving frameArrayStart offset from %llu to %llu";
      v223 = bytes;
      uint32_t v224 = 58;
      goto LABEL_235;
    }
  }
  v47 += v48;
  *length += v48;
LABEL_58:
  if (v47 > v51)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v70 = *(_DWORD *)(v3 + 176);
    __int16 v71 = ne_log_obj();
    BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG);
    if (v70 == 3)
    {
      if (v72)
      {
        uint64_t v73 = *(void *)(v3 + 80);
        if (v73) {
          LODWORD(v73) = nw_parameters_get_ip_protocol();
        }
        uint64_t v74 = *(void **)(v3 + 160);
        if (v74)
        {
          uint64_t v76 = v74[6];
          uint64_t v77 = v74[7];
          uint64_t v75 = v74[8];
          uint64_t v78 = v74[9];
        }
        else
        {
          uint64_t v75 = -1;
          uint64_t v76 = -1;
          uint64_t v77 = -1;
          uint64_t v78 = -1;
        }
        v215 = *(void **)(v3 + 168);
        if (v215)
        {
          uint64_t v217 = v215[6];
          uint64_t v218 = v215[7];
          uint64_t v216 = v215[8];
          uint64_t v219 = v215[9];
        }
        else
        {
          uint64_t v216 = -1;
          uint64_t v217 = -1;
          uint64_t v218 = -1;
          uint64_t v219 = -1;
        }
        v226 = "out";
        *(_DWORD *)long long buf = 136318210;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&uint8_t buf[12] = 1024;
        if (v294) {
          v226 = "in";
        }
        *(_DWORD *)&buf[14] = v73;
        *(_WORD *)&unsigned char buf[18] = 2048;
        *(void *)&buf[20] = v76;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v77;
        __int16 v302 = 2048;
        unint64_t v303 = v75;
        __int16 v304 = 2048;
        uint64_t v305 = v78;
        __int16 v306 = 2048;
        uint64_t v307 = v217;
        __int16 v308 = 2048;
        uint64_t v309 = v218;
        __int16 v310 = 2048;
        uint64_t v311 = v216;
        __int16 v312 = 2048;
        uint64_t v313 = v219;
        __int16 v314 = 2080;
        size_t v315 = (size_t)v226;
        __int16 v316 = 2048;
        unint64_t v317 = v47;
        __int16 v318 = 1024;
        LODWORD(v319) = v51;
        v183 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]all %sbound "
               "pending bytes already passed (%llu > %u), not filtering";
        v184 = v71;
        uint32_t v185 = 124;
LABEL_240:
        _os_log_debug_impl(&dword_212970000, v184, OS_LOG_TYPE_DEBUG, v183, buf, v185);
      }
    }
    else if (v72)
    {
      uint64_t v83 = *(void *)(v3 + 80);
      if (v83) {
        LODWORD(v83) = nw_parameters_get_ip_protocol();
      }
      uint64_t v84 = *(unsigned int *)(v3 + 176);
      if (v84 > 3) {
        __int16 v85 = "unknown";
      }
      else {
        __int16 v85 = off_264195FA0[v84];
      }
      v220 = "out";
      *(_DWORD *)long long buf = 136316418;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      if (v294) {
        v220 = "in";
      }
      *(_DWORD *)&buf[14] = v83;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v85;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v220;
      __int16 v302 = 2048;
      unint64_t v303 = v47;
      __int16 v304 = 1024;
      LODWORD(v305) = v51;
      v183 = "[filter %s %d %s] all %sbound pending bytes already passed (%llu > %u), not filtering";
      v184 = v71;
      uint32_t v185 = 54;
      goto LABEL_240;
    }
    return 1;
  }
  if (v46 >= v44 + v51 - v47) {
    unint64_t v79 = v44 + v51 - v47;
  }
  else {
    unint64_t v79 = v46;
  }
  unint64_t v80 = v47 + v8;
  if (v79 <= v80)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v86 = *(_DWORD *)(v3 + 176);
    uint64_t v87 = ne_log_obj();
    BOOL v88 = os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG);
    if (v86 == 3)
    {
      if (!v88) {
        return 0;
      }
      uint64_t v89 = *(void *)(v3 + 80);
      if (v89) {
        LODWORD(v89) = nw_parameters_get_ip_protocol();
      }
      int v90 = *(void **)(v3 + 160);
      if (v90)
      {
        uint64_t v92 = v90[6];
        uint64_t v93 = v90[7];
        uint64_t v91 = v90[8];
        uint64_t v94 = v90[9];
      }
      else
      {
        uint64_t v91 = -1;
        uint64_t v92 = -1;
        uint64_t v93 = -1;
        uint64_t v94 = -1;
      }
      v227 = *(void **)(v3 + 168);
      if (v227)
      {
        uint64_t v229 = v227[6];
        uint64_t v230 = v227[7];
        uint64_t v228 = v227[8];
        uint64_t v231 = v227[9];
      }
      else
      {
        uint64_t v228 = -1;
        uint64_t v229 = -1;
        uint64_t v230 = -1;
        uint64_t v231 = -1;
      }
      *(void *)&uint8_t buf[4] = out;
      v236 = "out";
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)long long buf = 136318210;
      if (v294) {
        v236 = "in";
      }
      *(_DWORD *)&buf[14] = v89;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v92;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v93;
      __int16 v302 = 2048;
      unint64_t v303 = v91;
      __int16 v304 = 2048;
      uint64_t v305 = v94;
      __int16 v306 = 2048;
      uint64_t v307 = v229;
      __int16 v308 = 2048;
      uint64_t v309 = v230;
      __int16 v310 = 2048;
      uint64_t v311 = v228;
      __int16 v312 = 2048;
      uint64_t v313 = v231;
      __int16 v314 = 2080;
      size_t v315 = (size_t)v236;
      __int16 v316 = 2048;
      unint64_t v317 = v79;
      __int16 v318 = 2048;
      unint64_t v319 = v80;
      v233 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound byt"
             "es to filter (%llu <= %llu)";
      v234 = v87;
      uint32_t v235 = 128;
    }
    else
    {
      if (!v88) {
        return 0;
      }
      uint64_t v117 = *(void *)(v3 + 80);
      if (v117) {
        LODWORD(v117) = nw_parameters_get_ip_protocol();
      }
      uint64_t v118 = *(unsigned int *)(v3 + 176);
      if (v118 > 3) {
        uint64_t v119 = "unknown";
      }
      else {
        uint64_t v119 = off_264195FA0[v118];
      }
      *(void *)&uint8_t buf[4] = out;
      v232 = "out";
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)long long buf = 136316418;
      if (v294) {
        v232 = "in";
      }
      *(_DWORD *)&buf[14] = v117;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v119;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v232;
      __int16 v302 = 2048;
      unint64_t v303 = v79;
      __int16 v304 = 2048;
      uint64_t v305 = v80;
      v233 = "[filter %s %d %s] no %sbound bytes to filter (%llu <= %llu)";
      v234 = v87;
      uint32_t v235 = 58;
    }
LABEL_254:
    _os_log_debug_impl(&dword_212970000, v234, OS_LOG_TYPE_DEBUG, v233, buf, v235);
    return 0;
  }
  unint64_t v81 = v79 - v44;
  if ((v79 - v44) >> 32)
  {
    uint64_t v82 = ne_log_obj();
    BOOL result = os_log_type_enabled(v82, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 134217984;
    *(void *)&uint8_t buf[4] = v79 - v44;
    _os_log_fault_impl(&dword_212970000, v82, OS_LOG_TYPE_FAULT, "frameArraySendLength too big %llu", buf, 0xCu);
    return 0;
  }
  bytesa = (char *)malloc_type_malloc(v79 - v44, 0x62AA8D19uLL);
  if (!bytesa)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v120 = *(_DWORD *)(v3 + 176);
    int v121 = ne_log_obj();
    BOOL v122 = os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG);
    if (v120 == 3)
    {
      if (!v122) {
        return 0;
      }
      uint64_t v123 = *(void *)(v3 + 80);
      if (v123) {
        LODWORD(v123) = nw_parameters_get_ip_protocol();
      }
      int v124 = *(void **)(v3 + 160);
      if (v124)
      {
        uint64_t v126 = v124[6];
        uint64_t v127 = v124[7];
        uint64_t v125 = v124[8];
        uint64_t v128 = v124[9];
      }
      else
      {
        uint64_t v125 = -1;
        uint64_t v126 = -1;
        uint64_t v127 = -1;
        uint64_t v128 = -1;
      }
      v246 = *(void **)(v3 + 168);
      if (v246)
      {
        uint64_t v248 = v246[6];
        uint64_t v249 = v246[7];
        uint64_t v247 = v246[8];
        uint64_t v250 = v246[9];
      }
      else
      {
        uint64_t v247 = -1;
        uint64_t v248 = -1;
        uint64_t v249 = -1;
        uint64_t v250 = -1;
      }
      *(_DWORD *)long long buf = 136317698;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v123;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v126;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v127;
      __int16 v302 = 2048;
      unint64_t v303 = v125;
      __int16 v304 = 2048;
      uint64_t v305 = v128;
      __int16 v306 = 2048;
      uint64_t v307 = v248;
      __int16 v308 = 2048;
      uint64_t v309 = v249;
      __int16 v310 = 2048;
      uint64_t v311 = v247;
      __int16 v312 = 2048;
      uint64_t v313 = v250;
      __int16 v314 = 2048;
      size_t v315 = v79 - v44;
      v233 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]failed to malloc %zu bytes";
      v234 = v121;
      uint32_t v235 = 108;
    }
    else
    {
      if (!v122) {
        return 0;
      }
      uint64_t v141 = *(void *)(v3 + 80);
      if (v141) {
        LODWORD(v141) = nw_parameters_get_ip_protocol();
      }
      uint64_t v142 = *(unsigned int *)(v3 + 176);
      if (v142 > 3) {
        __int16 v143 = "unknown";
      }
      else {
        __int16 v143 = off_264195FA0[v142];
      }
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v141;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v143;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v79 - v44;
      v233 = "[filter %s %d %s] failed to malloc %zu bytes";
      v234 = v121;
      uint32_t v235 = 38;
    }
    goto LABEL_254;
  }
  uint64_t v95 = nw_frame_array_first();
  size_t lengtha = v79 - v44;
  unint64_t v96 = v81 + v47;
  if (v81 + v47 && v95 && v79 != v44)
  {
    unint64_t v97 = 0;
    size_t v98 = 0;
    do
    {
      *(_DWORD *)long long buf = 0;
      uint64_t v99 = nw_frame_unclaimed_bytes();
      if (v47 <= v97) {
        unsigned int v100 = 0;
      }
      else {
        unsigned int v100 = v47 - v97;
      }
      unsigned int v101 = *(_DWORD *)buf;
      if (*(_DWORD *)buf > v100)
      {
        if (v96 - (v97 + v100) >= *(_DWORD *)buf - v100) {
          size_t v102 = *(_DWORD *)buf - v100;
        }
        else {
          size_t v102 = v96 - (v97 + v100);
        }
        memcpy(&bytesa[v98], (const void *)(v99 + v100), v102);
        v98 += v102;
        unsigned int v101 = *(_DWORD *)buf;
      }
      v97 += v101;
      uint64_t v103 = nw_frame_array_next();
    }
    while (v97 < v96 && v103 != 0 && v98 < lengtha);
  }
  xpc_object_t v106 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uuid(v106, "flow-uuid", (const unsigned __int8 *)v3);
  unsigned int ip_protocol = nw_parameters_get_ip_protocol();
  xpc_dictionary_set_uint64(v106, "ip-protocol", ip_protocol);
  if (!v294)
  {
    xpc_dictionary_set_uint64(v106, "pending-data-start-offset", *v293);
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v129 = *(_DWORD *)(v3 + 176);
    uint64_t v130 = ne_log_obj();
    BOOL v131 = os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG);
    if (v129 == 3)
    {
      if (v131)
      {
        uint64_t v132 = *(void *)(v3 + 80);
        if (v132) {
          LODWORD(v132) = nw_parameters_get_ip_protocol();
        }
        __int16 v133 = *(void **)(v3 + 160);
        if (v133)
        {
          uint64_t v135 = v133[6];
          uint64_t v136 = v133[7];
          uint64_t v134 = v133[8];
          uint64_t v137 = v133[9];
        }
        else
        {
          uint64_t v134 = -1;
          uint64_t v135 = -1;
          uint64_t v136 = -1;
          uint64_t v137 = -1;
        }
        v256 = *(void **)(v3 + 168);
        if (v256)
        {
          uint64_t v258 = v256[6];
          uint64_t v259 = v256[7];
          uint64_t v257 = v256[8];
          uint64_t v260 = v256[9];
        }
        else
        {
          uint64_t v257 = -1;
          uint64_t v258 = -1;
          uint64_t v259 = -1;
          uint64_t v260 = -1;
        }
        uint64_t v288 = *v293;
        *(_DWORD *)long long buf = 136317954;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)&buf[14] = v132;
        *(_WORD *)&unsigned char buf[18] = 2048;
        *(void *)&buf[20] = v135;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v136;
        __int16 v302 = 2048;
        unint64_t v303 = v134;
        __int16 v304 = 2048;
        uint64_t v305 = v137;
        __int16 v306 = 2048;
        uint64_t v307 = v258;
        __int16 v308 = 2048;
        uint64_t v309 = v259;
        __int16 v310 = 2048;
        uint64_t v311 = v257;
        __int16 v312 = 2048;
        uint64_t v313 = v260;
        __int16 v314 = 2048;
        size_t v315 = lengtha;
        __int16 v316 = 2048;
        unint64_t v317 = v288;
        v280 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering %z"
               "u output bytes at offset %llu";
        v281 = v130;
        uint32_t v282 = 118;
LABEL_299:
        _os_log_debug_impl(&dword_212970000, v281, OS_LOG_TYPE_DEBUG, v280, buf, v282);
      }
    }
    else if (v131)
    {
      uint64_t v240 = *(void *)(v3 + 80);
      if (v240) {
        LODWORD(v240) = nw_parameters_get_ip_protocol();
      }
      uint64_t v241 = *(unsigned int *)(v3 + 176);
      if (v241 > 3) {
        v242 = "unknown";
      }
      else {
        v242 = off_264195FA0[v241];
      }
      uint64_t v279 = *v293;
      *(_DWORD *)long long buf = 136316162;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v240;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v242;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = lengtha;
      __int16 v302 = 2048;
      unint64_t v303 = v279;
      v280 = "[filter %s %d %s] filtering %zu output bytes at offset %llu";
      v281 = v130;
      uint32_t v282 = 48;
      goto LABEL_299;
    }
    unsigned int v144 = 7;
    goto LABEL_141;
  }
  xpc_dictionary_set_uint64(v106, "pending-data-start-offset", *v9);
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  int v108 = *(_DWORD *)(v3 + 176);
  uint64_t v109 = ne_log_obj();
  BOOL v110 = os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG);
  if (v108 == 3)
  {
    if (v110)
    {
      uint64_t v111 = *(void *)(v3 + 80);
      if (v111) {
        LODWORD(v111) = nw_parameters_get_ip_protocol();
      }
      uint64_t v112 = *(void **)(v3 + 160);
      if (v112)
      {
        uint64_t v114 = v112[6];
        uint64_t v115 = v112[7];
        uint64_t v113 = v112[8];
        uint64_t v116 = v112[9];
      }
      else
      {
        uint64_t v113 = -1;
        uint64_t v114 = -1;
        uint64_t v115 = -1;
        uint64_t v116 = -1;
      }
      v251 = *(void **)(v3 + 168);
      if (v251)
      {
        uint64_t v253 = v251[6];
        uint64_t v254 = v251[7];
        uint64_t v252 = v251[8];
        uint64_t v255 = v251[9];
      }
      else
      {
        uint64_t v252 = -1;
        uint64_t v253 = -1;
        uint64_t v254 = -1;
        uint64_t v255 = -1;
      }
      uint64_t v287 = *v9;
      *(_DWORD *)long long buf = 136317954;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v111;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v114;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v115;
      __int16 v302 = 2048;
      unint64_t v303 = v113;
      __int16 v304 = 2048;
      uint64_t v305 = v116;
      __int16 v306 = 2048;
      uint64_t v307 = v253;
      __int16 v308 = 2048;
      uint64_t v309 = v254;
      __int16 v310 = 2048;
      uint64_t v311 = v252;
      __int16 v312 = 2048;
      uint64_t v313 = v255;
      __int16 v314 = 2048;
      size_t v315 = lengtha;
      __int16 v316 = 2048;
      unint64_t v317 = v287;
      v276 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering %zu "
             "input bytes at offset %llu";
      v277 = v109;
      uint32_t v278 = 118;
LABEL_296:
      _os_log_debug_impl(&dword_212970000, v277, OS_LOG_TYPE_DEBUG, v276, buf, v278);
    }
  }
  else if (v110)
  {
    uint64_t v237 = *(void *)(v3 + 80);
    if (v237) {
      LODWORD(v237) = nw_parameters_get_ip_protocol();
    }
    uint64_t v238 = *(unsigned int *)(v3 + 176);
    if (v238 > 3) {
      v239 = "unknown";
    }
    else {
      v239 = off_264195FA0[v238];
    }
    uint64_t v275 = *v9;
    *(_DWORD *)long long buf = 136316162;
    *(void *)&uint8_t buf[4] = out;
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = v237;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = v239;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = lengtha;
    __int16 v302 = 2048;
    unint64_t v303 = v275;
    v276 = "[filter %s %d %s] filtering %zu input bytes at offset %llu";
    v277 = v109;
    uint32_t v278 = 48;
    goto LABEL_296;
  }
  unsigned int v144 = 8;
LABEL_141:
  xpc_dictionary_set_int64(v106, "command", v144);
  v145 = *(NSObject **)(v3 + 64);
  if (v145)
  {
    if (nw_endpoint_get_type(v145) == nw_endpoint_type_address)
    {
      uint64_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(v3 + 64));
      if (address) {
        xpc_dictionary_set_data(v106, "local-addr", address, address->sa_len);
      }
    }
  }
  v147 = *(NSObject **)(v3 + 72);
  if (v147)
  {
    nw_endpoint_type_t type = nw_endpoint_get_type(v147);
    uint64_t v149 = *(NSObject **)(v3 + 72);
    if (type == nw_endpoint_type_address)
    {
      __int16 v150 = nw_endpoint_get_address(v149);
      if (!v150) {
        goto LABEL_152;
      }
      uint64_t v151 = v150;
      size_t sa_len = v150->sa_len;
    }
    else
    {
      if (nw_endpoint_get_type(v149) != nw_endpoint_type_host) {
        goto LABEL_152;
      }
      memset(buf, 0, 28);
      ne_filter_create_wildcard_remote_sockaddr((uint64_t)buf, v3);
      size_t sa_len = buf[0];
      uint64_t v151 = (const sockaddr *)buf;
    }
    xpc_dictionary_set_data(v106, "remote-addr", v151, sa_len);
  }
LABEL_152:
  xpc_dictionary_set_data(v106, "data", bytesa, lengtha);
  free(bytesa);
  if (!v294)
  {
    uint64_t v153 = (_DWORD *)(a2 + 104);
    uint64_t *v293 = v96 + *(void *)(a2 + 104);
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    int v163 = *(_DWORD *)(v3 + 176);
    v164 = ne_log_obj();
    BOOL v165 = os_log_type_enabled(v164, OS_LOG_TYPE_DEBUG);
    if (v163 == 3)
    {
      if (v165)
      {
        uint64_t v166 = *(void *)(v3 + 80);
        if (v166) {
          LODWORD(v166) = nw_parameters_get_ip_protocol();
        }
        v167 = *(void **)(v3 + 160);
        if (v167)
        {
          uint64_t v169 = v167[6];
          uint64_t v170 = v167[7];
          uint64_t v168 = v167[8];
          uint64_t v171 = v167[9];
        }
        else
        {
          uint64_t v168 = -1;
          uint64_t v169 = -1;
          uint64_t v170 = -1;
          uint64_t v171 = -1;
        }
        v266 = *(void **)(v3 + 168);
        if (v266)
        {
          uint64_t v268 = v266[6];
          uint64_t v269 = v266[7];
          uint64_t v267 = v266[8];
          uint64_t v270 = v266[9];
        }
        else
        {
          uint64_t v267 = -1;
          uint64_t v268 = -1;
          uint64_t v269 = -1;
          uint64_t v270 = -1;
        }
        uint64_t v290 = *v293;
        *(_DWORD *)long long buf = 136317698;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)&buf[14] = v166;
        *(_WORD *)&unsigned char buf[18] = 2048;
        *(void *)&buf[20] = v169;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = v170;
        __int16 v302 = 2048;
        unint64_t v303 = v168;
        __int16 v304 = 2048;
        uint64_t v305 = v171;
        __int16 v306 = 2048;
        uint64_t v307 = v268;
        __int16 v308 = 2048;
        uint64_t v309 = v269;
        __int16 v310 = 2048;
        uint64_t v311 = v267;
        __int16 v312 = 2048;
        uint64_t v313 = v270;
        __int16 v314 = 2048;
        size_t v315 = v290;
        v284 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]outbound sen"
               "t offset is now %llu";
        v285 = v164;
        uint32_t v286 = 108;
LABEL_305:
        _os_log_debug_impl(&dword_212970000, v285, OS_LOG_TYPE_DEBUG, v284, buf, v286);
      }
    }
    else if (v165)
    {
      uint64_t v243 = *(void *)(v3 + 80);
      if (v243) {
        LODWORD(v243) = nw_parameters_get_ip_protocol();
      }
      uint64_t v244 = *(unsigned int *)(v3 + 176);
      if (v244 > 3) {
        v245 = "unknown";
      }
      else {
        v245 = off_264195FA0[v244];
      }
      uint64_t v283 = *v293;
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v243;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v245;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v283;
      v284 = "[filter %s %d %s] outbound sent offset is now %llu";
      v285 = v164;
      uint32_t v286 = 38;
      goto LABEL_305;
    }
    uint64_t v9 = v293;
    goto LABEL_172;
  }
  uint64_t v153 = (_DWORD *)(a2 + 88);
  *uint64_t v9 = v96 + *(void *)(a2 + 88);
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  int v154 = *(_DWORD *)(v3 + 176);
  uint64_t v155 = ne_log_obj();
  BOOL v156 = os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG);
  if (v154 == 3)
  {
    if (v156)
    {
      uint64_t v157 = *(void *)(v3 + 80);
      if (v157) {
        LODWORD(v157) = nw_parameters_get_ip_protocol();
      }
      __int16 v158 = *(void **)(v3 + 160);
      if (v158)
      {
        uint64_t v160 = v158[6];
        uint64_t v161 = v158[7];
        uint64_t v159 = v158[8];
        uint64_t v162 = v158[9];
      }
      else
      {
        uint64_t v159 = -1;
        uint64_t v160 = -1;
        uint64_t v161 = -1;
        uint64_t v162 = -1;
      }
      v261 = *(void **)(v3 + 168);
      if (v261)
      {
        uint64_t v263 = v261[6];
        uint64_t v264 = v261[7];
        uint64_t v262 = v261[8];
        uint64_t v265 = v261[9];
      }
      else
      {
        uint64_t v262 = -1;
        uint64_t v263 = -1;
        uint64_t v264 = -1;
        uint64_t v265 = -1;
      }
      uint64_t v289 = *v9;
      *(_DWORD *)long long buf = 136317698;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v157;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v160;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v161;
      __int16 v302 = 2048;
      unint64_t v303 = v159;
      __int16 v304 = 2048;
      uint64_t v305 = v162;
      __int16 v306 = 2048;
      uint64_t v307 = v263;
      __int16 v308 = 2048;
      uint64_t v309 = v264;
      __int16 v310 = 2048;
      uint64_t v311 = v262;
      __int16 v312 = 2048;
      uint64_t v313 = v265;
      __int16 v314 = 2048;
      size_t v315 = v289;
      v272 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]inbound sent o"
             "ffset is now %llu";
      v273 = v155;
      uint32_t v274 = 108;
LABEL_302:
      _os_log_debug_impl(&dword_212970000, v273, OS_LOG_TYPE_DEBUG, v272, buf, v274);
    }
  }
  else if (v156)
  {
    uint64_t v172 = *(void *)(v3 + 80);
    if (v172) {
      LODWORD(v172) = nw_parameters_get_ip_protocol();
    }
    uint64_t v173 = *(unsigned int *)(v3 + 176);
    if (v173 > 3) {
      v174 = "unknown";
    }
    else {
      v174 = off_264195FA0[v173];
    }
    uint64_t v271 = *v9;
    *(_DWORD *)long long buf = 136315906;
    *(void *)&uint8_t buf[4] = out;
    *(_WORD *)&uint8_t buf[12] = 1024;
    *(_DWORD *)&buf[14] = v172;
    *(_WORD *)&unsigned char buf[18] = 2080;
    *(void *)&buf[20] = v174;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v271;
    v272 = "[filter %s %d %s] inbound sent offset is now %llu";
    v273 = v155;
    uint32_t v274 = 38;
    goto LABEL_302;
  }
LABEL_172:
  int v175 = *(_DWORD *)v9 - *v153;
  size_t v176 = lengtha;
  if (!*(_DWORD *)(v3 + 124))
  {
    memset(buf, 0, 32);
    out[0] = 0;
    if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v3, (uint64_t)buf, out, 0))
    {
      xpc_dictionary_set_data(v106, "crypto-signature", buf, out[0]);
    }
    else
    {
      v207 = ne_log_obj();
      if (os_log_type_enabled(v207, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v300 = 0;
        _os_log_error_impl(&dword_212970000, v207, OS_LOG_TYPE_ERROR, "Failed to generate signature for data message", v300, 2u);
      }
    }
    size_t v176 = lengtha;
  }
  atomic_fetch_add((atomic_uint *volatile)(v3 + 180), 1u);
  v208 = *(os_unfair_lock_s **)(v3 + 96);
  unsigned int v209 = *(_DWORD *)(a2 + 4);
  v298[0] = MEMORY[0x263EF8330];
  v298[1] = 0x40000000;
  v298[2] = __ne_filter_data_protocol_send_data_block_invoke;
  v298[3] = &__block_descriptor_tmp_34;
  v298[4] = v3;
  v298[5] = v176;
  unsigned int v299 = v144;
  v298[6] = v6;
  v298[7] = a2;
  ne_filter_send_message(v208, v209, v106, v298);
  xpc_release(v106);
  return v295 == v175;
}

uint64_t ne_filter_protocol_fulfill_frame_request(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, _DWORD *a7)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    uint64_t v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "ne_filter_protocol_fulfill_frame_request";
    unint64_t v13 = "%s called with null source_array";
    goto LABEL_19;
  }
  if (!a3)
  {
    uint64_t v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "ne_filter_protocol_fulfill_frame_request";
    unint64_t v13 = "%s called with null destination_array";
LABEL_19:
    unsigned int v14 = v16;
    uint32_t v15 = 12;
    goto LABEL_14;
  }
  if (!a5 || !a6)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    LODWORD(buf) = 67109632;
    DWORD1(buf) = a5;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = 0;
    HIWORD(buf) = 1024;
    LODWORD(v23) = a6;
    unint64_t v13 = "invalid values for frame request, max %u, min %u, max frame %u";
    unsigned int v14 = v11;
    uint32_t v15 = 20;
LABEL_14:
    _os_log_fault_impl(&dword_212970000, v14, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&buf, v15);
    return 0;
  }
  long long v21 = 0uLL;
  nw_frame_array_init();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x2000000000;
  int v24 = 0;
  uint64_t v17 = 0;
  unint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  int v20 = 0;
  nw_frame_array_foreach();
  if (a7) {
    *a7 = *((_DWORD *)v18 + 6);
  }
  if ((nw_frame_array_is_empty() & 1) == 0) {
    nw_frame_array_foreach();
  }
  uint64_t v10 = *(unsigned int *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&buf, 8);
  return v10;
}

BOOL __ne_filter_protocol_fulfill_frame_request_block_invoke(uint64_t a1)
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  unsigned int v2 = nw_frame_unclaimed_length();
  if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 1) > *(_DWORD *)(a1 + 80)) {
    return 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v4 = *(_DWORD *)(v3 + 24);
  unsigned int v5 = *(_DWORD *)(a1 + 84);
  size_t v6 = v5 - v4;
  if (v5 <= v4) {
    return 0;
  }
  unsigned int v7 = v2;
  if (v6 >= v2)
  {
    *(_DWORD *)(v3 + 24) = v4 + v2;
    nw_frame_array_remove();
    memset(out, 0, 37);
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    int v15 = *(_DWORD *)(*(void *)(a1 + 48) + 176);
    uint64_t v16 = ne_log_obj();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15 == 3)
    {
      if (v17)
      {
        unint64_t v18 = *(void **)(a1 + 48);
        uint64_t v19 = v18[10];
        if (v19)
        {
          LODWORD(v19) = nw_parameters_get_ip_protocol();
          unint64_t v18 = *(void **)(a1 + 48);
        }
        int v20 = (void *)v18[20];
        if (v20)
        {
          uint64_t v22 = v20[6];
          uint64_t v23 = v20[7];
          uint64_t v21 = v20[8];
          uint64_t v24 = v20[9];
        }
        else
        {
          uint64_t v21 = -1;
          uint64_t v22 = -1;
          uint64_t v23 = -1;
          uint64_t v24 = -1;
        }
        unint64_t v46 = (void *)v18[21];
        if (v46)
        {
          uint64_t v48 = v46[6];
          uint64_t v49 = v46[7];
          uint64_t v47 = v46[8];
          uint64_t v50 = v46[9];
        }
        else
        {
          uint64_t v47 = -1;
          uint64_t v48 = -1;
          uint64_t v49 = -1;
          uint64_t v50 = -1;
        }
        *(_DWORD *)long long buf = 136317698;
        unint64_t v79 = out;
        __int16 v80 = 1024;
        int v81 = v19;
        __int16 v82 = 2048;
        uint64_t v83 = v22;
        __int16 v84 = 2048;
        *(void *)__int16 v85 = v23;
        *(_WORD *)&v85[8] = 2048;
        uint64_t v86 = v21;
        __int16 v87 = 2048;
        uint64_t v88 = v24;
        __int16 v89 = 2048;
        uint64_t v90 = v48;
        __int16 v91 = 2048;
        uint64_t v92 = v49;
        __int16 v93 = 2048;
        uint64_t v94 = v47;
        __int16 v95 = 2048;
        uint64_t v96 = v50;
        __int16 v97 = 1024;
        int v98 = v7;
        unsigned int v51 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]Moving entire"
              " frame (%u bytes)";
        uint64_t v52 = v16;
        uint32_t v53 = 104;
        goto LABEL_49;
      }
    }
    else if (v17)
    {
      uint64_t v25 = *(void *)(a1 + 48);
      uint64_t v26 = *(void *)(v25 + 80);
      if (v26)
      {
        LODWORD(v26) = nw_parameters_get_ip_protocol();
        uint64_t v25 = *(void *)(a1 + 48);
      }
      uint64_t v27 = *(unsigned int *)(v25 + 176);
      if (v27 > 3) {
        uint64_t v28 = "unknown";
      }
      else {
        uint64_t v28 = off_264195FA0[v27];
      }
      *(_DWORD *)long long buf = 136315906;
      unint64_t v79 = out;
      __int16 v80 = 1024;
      int v81 = v26;
      __int16 v82 = 2080;
      uint64_t v83 = (uint64_t)v28;
      __int16 v84 = 1024;
      *(_DWORD *)__int16 v85 = v7;
      unsigned int v51 = "[filter %s %d %s] Moving entire frame (%u bytes)";
      uint64_t v52 = v16;
      uint32_t v53 = 34;
      goto LABEL_49;
    }
    goto LABEL_41;
  }
  if (!*(unsigned char *)(a1 + 88))
  {
    memset(out, 0, 37);
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    int v29 = *(_DWORD *)(*(void *)(a1 + 48) + 176);
    int v30 = ne_log_obj();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
    if (v29 == 3)
    {
      if (!v31) {
        return 0;
      }
      BOOL v32 = *(void **)(a1 + 48);
      uint64_t v33 = v32[10];
      if (v33)
      {
        LODWORD(v33) = nw_parameters_get_ip_protocol();
        BOOL v32 = *(void **)(a1 + 48);
      }
      int v34 = (void *)v32[20];
      if (v34)
      {
        uint64_t v36 = v34[6];
        uint64_t v37 = v34[7];
        uint64_t v35 = v34[8];
        uint64_t v38 = v34[9];
      }
      else
      {
        uint64_t v35 = -1;
        uint64_t v36 = -1;
        uint64_t v37 = -1;
        uint64_t v38 = -1;
      }
      uint64_t v56 = (void *)v32[21];
      if (v56)
      {
        uint64_t v58 = v56[6];
        uint64_t v59 = v56[7];
        uint64_t v57 = v56[8];
        uint64_t v60 = v56[9];
      }
      else
      {
        uint64_t v57 = -1;
        uint64_t v58 = -1;
        uint64_t v59 = -1;
        uint64_t v60 = -1;
      }
      *(_DWORD *)long long buf = 136317442;
      unint64_t v79 = out;
      __int16 v80 = 1024;
      int v81 = v33;
      __int16 v82 = 2048;
      uint64_t v83 = v36;
      __int16 v84 = 2048;
      *(void *)__int16 v85 = v37;
      *(_WORD *)&v85[8] = 2048;
      uint64_t v86 = v35;
      __int16 v87 = 2048;
      uint64_t v88 = v38;
      __int16 v89 = 2048;
      uint64_t v90 = v58;
      __int16 v91 = 2048;
      uint64_t v92 = v59;
      __int16 v93 = 2048;
      uint64_t v94 = v57;
      __int16 v95 = 2048;
      uint64_t v96 = v60;
      uint64_t v61 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]skipping partia"
            "l frame, split frames not allowed";
      uint32_t v62 = v30;
      uint32_t v63 = 98;
    }
    else
    {
      if (!v31) {
        return 0;
      }
      uint64_t v41 = *(void *)(a1 + 48);
      uint64_t v42 = *(void *)(v41 + 80);
      if (v42)
      {
        LODWORD(v42) = nw_parameters_get_ip_protocol();
        uint64_t v41 = *(void *)(a1 + 48);
      }
      uint64_t v43 = *(unsigned int *)(v41 + 176);
      if (v43 > 3) {
        unint64_t v44 = "unknown";
      }
      else {
        unint64_t v44 = off_264195FA0[v43];
      }
      *(_DWORD *)long long buf = 136315650;
      unint64_t v79 = out;
      __int16 v80 = 1024;
      int v81 = v42;
      __int16 v82 = 2080;
      uint64_t v83 = (uint64_t)v44;
      uint64_t v61 = "[filter %s %d %s] skipping partial frame, split frames not allowed";
      uint32_t v62 = v30;
      uint32_t v63 = 28;
    }
    _os_log_debug_impl(&dword_212970000, v62, OS_LOG_TYPE_DEBUG, v61, buf, v63);
    return 0;
  }
  unint64_t v8 = malloc_type_calloc(1uLL, v5 - v4, 0x9CBCAAB6uLL);
  if (v8)
  {
    uint64_t v9 = v8;
    if (nw_frame_create())
    {
      uint64_t v10 = (const void *)nw_frame_unclaimed_bytes();
      memcpy(v9, v10, v6);
      nw_frame_claim();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v6;
      memset(out, 0, 37);
      uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
      int v11 = *(_DWORD *)(*(void *)(a1 + 48) + 176);
      uint64_t v12 = ne_log_obj();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11 == 3)
      {
        if (v13)
        {
          unsigned int v14 = *(void **)(a1 + 48);
          if (v14[10])
          {
            int ip_protocol = nw_parameters_get_ip_protocol();
            unsigned int v14 = *(void **)(a1 + 48);
          }
          else
          {
            int ip_protocol = 0;
          }
          uint64_t v64 = (void *)v14[20];
          if (v64)
          {
            uint64_t v74 = v64[7];
            uint64_t v75 = v64[6];
            uint64_t v68 = v64[8];
            uint64_t v65 = v64[9];
            uint64_t v76 = v68;
          }
          else
          {
            uint64_t v65 = -1;
            uint64_t v75 = -1;
            uint64_t v76 = -1;
            uint64_t v74 = -1;
          }
          __int16 v69 = (void *)v14[21];
          if (v69)
          {
            uint64_t v71 = v69[6];
            uint64_t v72 = v69[7];
            uint64_t v70 = v69[8];
            uint64_t v73 = v69[9];
          }
          else
          {
            uint64_t v70 = -1;
            uint64_t v71 = -1;
            uint64_t v72 = -1;
            uint64_t v73 = -1;
          }
          *(_DWORD *)long long buf = 136318210;
          unint64_t v79 = out;
          __int16 v80 = 1024;
          int v81 = ip_protocol;
          __int16 v82 = 2048;
          uint64_t v83 = v75;
          __int16 v84 = 2048;
          *(void *)__int16 v85 = v74;
          *(_WORD *)&v85[8] = 2048;
          uint64_t v86 = v76;
          __int16 v87 = 2048;
          uint64_t v88 = v65;
          __int16 v89 = 2048;
          uint64_t v90 = v71;
          __int16 v91 = 2048;
          uint64_t v92 = v72;
          __int16 v93 = 2048;
          uint64_t v94 = v70;
          __int16 v95 = 2048;
          uint64_t v96 = v73;
          __int16 v97 = 1024;
          int v98 = v6;
          __int16 v99 = 1024;
          unsigned int v100 = v7;
          __int16 v101 = 1024;
          int v102 = nw_frame_unclaimed_length();
          unsigned int v51 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]Moving part"
                "ial frame (%u bytes of %u, %u bytes remaining)";
          uint64_t v52 = v12;
          uint32_t v53 = 116;
LABEL_49:
          _os_log_debug_impl(&dword_212970000, v52, OS_LOG_TYPE_DEBUG, v51, buf, v53);
        }
      }
      else if (v13)
      {
        uint64_t v54 = *(void *)(a1 + 48);
        if (*(void *)(v54 + 80))
        {
          int v55 = nw_parameters_get_ip_protocol();
          uint64_t v54 = *(void *)(a1 + 48);
        }
        else
        {
          int v55 = 0;
        }
        uint64_t v66 = *(unsigned int *)(v54 + 176);
        if (v66 > 3) {
          uint64_t v67 = "unknown";
        }
        else {
          uint64_t v67 = off_264195FA0[v66];
        }
        *(_DWORD *)long long buf = 136316418;
        unint64_t v79 = out;
        __int16 v80 = 1024;
        int v81 = v55;
        __int16 v82 = 2080;
        uint64_t v83 = (uint64_t)v67;
        __int16 v84 = 1024;
        *(_DWORD *)__int16 v85 = v6;
        *(_WORD *)&v85[4] = 1024;
        *(_DWORD *)&v85[6] = v7;
        LOWORD(v86) = 1024;
        *(_DWORD *)((char *)&v86 + 2) = nw_frame_unclaimed_length();
        unsigned int v51 = "[filter %s %d %s] Moving partial frame (%u bytes of %u, %u bytes remaining)";
        uint64_t v52 = v12;
        uint32_t v53 = 46;
        goto LABEL_49;
      }
LABEL_41:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      nw_frame_array_append();
      return 1;
    }
    uint64_t v45 = ne_log_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_212970000, v45, OS_LOG_TYPE_FAULT, "nw_frame_create with partial data failed", buf, 2u);
    }
    free(v9);
  }
  else
  {
    uint64_t v39 = ne_log_obj();
    BOOL result = os_log_type_enabled(v39, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v79) = v6;
    _os_log_fault_impl(&dword_212970000, v39, OS_LOG_TYPE_FAULT, "calloc(%u) failed", buf, 8u);
  }
  return 0;
}

uint64_t __ne_filter_protocol_fulfill_frame_request_block_invoke_36(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }
  return 1;
}

void ne_filter_partial_input_frame_finalizer(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (a1)
  {
    long long buffer = (void *)nw_frame_get_buffer();
    free(buffer);
    nw_frame_reset();
    nw_release(a1);
  }
  else
  {
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      int v4 = 136315138;
      unsigned int v5 = "ne_filter_partial_input_frame_finalizer";
      _os_log_fault_impl(&dword_212970000, v3, OS_LOG_TYPE_FAULT, "%s called with null frame", (uint8_t *)&v4, 0xCu);
    }
  }
}

sockaddr *ne_filter_create_wildcard_remote_sockaddr(uint64_t a1, uint64_t a2)
{
  int v4 = *(NSObject **)(a2 + 72);
  if (v4) {
    __int16 v5 = __rev16(nw_endpoint_get_port(v4));
  }
  else {
    __int16 v5 = 0;
  }
  BOOL result = *(sockaddr **)(a2 + 64);
  if (!result
    || (BOOL result = (sockaddr *)nw_endpoint_get_type((nw_endpoint_t)result), result != 1)
    || (BOOL result = (sockaddr *)nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 64))) == 0)
  {
    *(void *)(a1 + 12) = 0;
    *(void *)(a1 + 4) = 0;
    *(void *)(a1 + 20) = 0;
    goto LABEL_10;
  }
  int sa_family = result->sa_family;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = 0;
  *(_DWORD *)(a1 + 24) = 0;
  if (sa_family != 2)
  {
LABEL_10:
    *(_WORD *)a1 = 7708;
    *(_OWORD *)(a1 + 8) = *MEMORY[0x263EF88F0];
    goto LABEL_11;
  }
  *(_WORD *)a1 = 528;
LABEL_11:
  *(_WORD *)(a1 + 2) = v5;
  return result;
}

uint64_t __ne_filter_data_protocol_send_data_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  memset(out, 0, 37);
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 176);
  __int16 v5 = ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      unsigned int v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        unsigned int v7 = *(void **)(a1 + 32);
      }
      uint64_t v9 = (void *)v7[20];
      if (v9)
      {
        uint64_t v11 = v9[6];
        uint64_t v12 = v9[7];
        uint64_t v10 = v9[8];
        uint64_t v13 = v9[9];
      }
      else
      {
        uint64_t v10 = -1;
        uint64_t v11 = -1;
        uint64_t v12 = -1;
        uint64_t v13 = -1;
      }
      uint64_t v19 = (void *)v7[21];
      if (v19)
      {
        uint64_t v21 = v19[6];
        uint64_t v22 = v19[7];
        uint64_t v20 = v19[8];
        uint64_t v23 = v19[9];
      }
      else
      {
        uint64_t v20 = -1;
        uint64_t v21 = -1;
        uint64_t v22 = -1;
        uint64_t v23 = -1;
      }
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 136317698;
      int v30 = out;
      __int16 v31 = 1024;
      int v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = v11;
      __int16 v35 = 2048;
      uint64_t v36 = v12;
      __int16 v37 = 2048;
      uint64_t v38 = v10;
      __int16 v39 = 2048;
      uint64_t v40 = v13;
      __int16 v41 = 2048;
      uint64_t v42 = v21;
      __int16 v43 = 2048;
      uint64_t v44 = v22;
      __int16 v45 = 2048;
      uint64_t v46 = v20;
      __int16 v47 = 2048;
      uint64_t v48 = v23;
      __int16 v49 = 2048;
      uint64_t v50 = v28;
      uint64_t v25 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]send-data reply"
            " received for %zu bytes";
      uint64_t v26 = v5;
      uint32_t v27 = 108;
LABEL_20:
      _os_log_debug_impl(&dword_212970000, v26, OS_LOG_TYPE_DEBUG, v25, buf, v27);
    }
  }
  else if (v6)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      uint64_t v15 = *(void *)(a1 + 32);
    }
    uint64_t v17 = *(unsigned int *)(v15 + 176);
    if (v17 > 3) {
      unint64_t v18 = "unknown";
    }
    else {
      unint64_t v18 = off_264195FA0[v17];
    }
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 136315906;
    int v30 = out;
    __int16 v31 = 1024;
    int v32 = v16;
    __int16 v33 = 2080;
    uint64_t v34 = (uint64_t)v18;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    uint64_t v25 = "[filter %s %d %s] send-data reply received for %zu bytes";
    uint64_t v26 = v5;
    uint32_t v27 = 38;
    goto LABEL_20;
  }
  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_data_block_invoke_31(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unsigned int v2 = *(void **)(a1 + 32);
  if (!v2) {
    goto LABEL_4;
  }
  if (MEMORY[0x2166885F0](*(void *)(a1 + 32)) != MEMORY[0x263EF8720])
  {
    if (MEMORY[0x2166885F0](v2) == MEMORY[0x263EF8708]) {
      goto LABEL_8;
    }
LABEL_4:
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      int v4 = "Got an invalid data message reply";
      __int16 v5 = v3;
      uint32_t v6 = 2;
LABEL_20:
      _os_log_error_impl(&dword_212970000, v5, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v14, v6);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  unsigned int v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x263EF86B0]);
    int v14 = 136315138;
    uint64_t v15 = string;
    int v4 = "Got an error on the XPC connection when sending a data message: %s";
    __int16 v5 = v7;
    uint32_t v6 = 12;
    goto LABEL_20;
  }
LABEL_7:
  unsigned int v2 = 0;
LABEL_8:
  ne_filter_process_verdict(*(void *)(a1 + 40), *(unsigned int *)(a1 + 56), v2, **(unsigned int **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v14) = 0;
    uint64_t v12 = "protocol is null";
LABEL_17:
    _os_log_impl(&dword_212970000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 2u);
    return;
  }
  uint64_t v9 = *(void *)(v8 + 40);
  if (!v9)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v14) = 0;
    uint64_t v12 = "filter is null";
    goto LABEL_17;
  }
  uint64_t v10 = (atomic_uint *)(v9 + 180);
  if (atomic_fetch_or(v10, 0))
  {
    if (atomic_fetch_add(v10, 0xFFFFFFFF) == 1) {
      ne_filter_protocol_destroy(*(void *)(a1 + 40));
    }
  }
}

BOOL __ne_filter_send_approved_frames_block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  unsigned int v2 = nw_frame_unclaimed_length();
  uint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 104) + v2;
  unint64_t v5 = *(void *)(v3 + 64);
  if (v4 <= v5)
  {
    unsigned int v6 = v2;
    uint64_t v7 = v2;
    nw_frame_array_remove();
    nw_frame_array_append();
    *(void *)(*(void *)(a1 + 32) + 104) += v7;
    memset(out, 0, 37);
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    LODWORD(v7) = *(_DWORD *)(*(void *)(a1 + 48) + 176);
    uint64_t v8 = ne_log_obj();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7 == 3)
    {
      if (v9)
      {
        uint64_t v10 = *(void **)(a1 + 48);
        uint64_t v11 = v10[10];
        if (v11)
        {
          LODWORD(v11) = nw_parameters_get_ip_protocol();
          uint64_t v10 = *(void **)(a1 + 48);
        }
        uint64_t v12 = (void *)v10[20];
        if (v12)
        {
          uint64_t v14 = v12[6];
          uint64_t v15 = v12[7];
          uint64_t v13 = v12[8];
          uint64_t v16 = v12[9];
        }
        else
        {
          uint64_t v13 = -1;
          uint64_t v14 = -1;
          uint64_t v15 = -1;
          uint64_t v16 = -1;
        }
        uint64_t v22 = (void *)v10[21];
        if (v22)
        {
          uint64_t v24 = v22[6];
          uint64_t v25 = v22[7];
          uint64_t v23 = v22[8];
          uint64_t v26 = v22[9];
        }
        else
        {
          uint64_t v23 = -1;
          uint64_t v24 = -1;
          uint64_t v25 = -1;
          uint64_t v26 = -1;
        }
        uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 104);
        int v32 = 136317954;
        __int16 v33 = out;
        __int16 v34 = 1024;
        int v35 = v11;
        __int16 v36 = 2048;
        uint64_t v37 = v14;
        __int16 v38 = 2048;
        *(void *)__int16 v39 = v15;
        *(_WORD *)&v39[8] = 2048;
        *(void *)&v39[10] = v13;
        __int16 v40 = 2048;
        uint64_t v41 = v16;
        __int16 v42 = 2048;
        uint64_t v43 = v24;
        __int16 v44 = 2048;
        uint64_t v45 = v25;
        __int16 v46 = 2048;
        uint64_t v47 = v23;
        __int16 v48 = 2048;
        uint64_t v49 = v26;
        __int16 v50 = 1024;
        unsigned int v51 = v6;
        __int16 v52 = 2048;
        uint64_t v53 = v31;
        uint64_t v28 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending frame"
              " with length %u, pendingOutputStartOffset is now %llu";
        int v29 = v8;
        uint32_t v30 = 114;
LABEL_21:
        _os_log_debug_impl(&dword_212970000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v32, v30);
      }
    }
    else if (v9)
    {
      uint64_t v18 = *(void *)(a1 + 48);
      uint64_t v19 = *(void *)(v18 + 80);
      if (v19)
      {
        LODWORD(v19) = nw_parameters_get_ip_protocol();
        uint64_t v18 = *(void *)(a1 + 48);
      }
      uint64_t v20 = *(unsigned int *)(v18 + 176);
      if (v20 > 3) {
        uint64_t v21 = "unknown";
      }
      else {
        uint64_t v21 = off_264195FA0[v20];
      }
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 104);
      int v32 = 136316162;
      __int16 v33 = out;
      __int16 v34 = 1024;
      int v35 = v19;
      __int16 v36 = 2080;
      uint64_t v37 = (uint64_t)v21;
      __int16 v38 = 1024;
      *(_DWORD *)__int16 v39 = v6;
      *(_WORD *)&v39[4] = 2048;
      *(void *)&v39[6] = v27;
      uint64_t v28 = "[filter %s %d %s] sending frame with length %u, pendingOutputStartOffset is now %llu";
      int v29 = v8;
      uint32_t v30 = 44;
      goto LABEL_21;
    }
  }
  return v4 <= v5;
}

uint64_t __ne_filter_send_approved_frames_block_invoke_49()
{
  return 1;
}

void ne_filter_data_protocol_send_new_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  *(void *)uuid = 0;
  uint64_t v66 = 0;
  *(void *)uuid_t uu = 0;
  uint64_t v64 = 0;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (!atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0)) {
      return;
    }
    int server_mode = nw_parameters_get_server_mode();
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "command", 6);
    xpc_dictionary_set_uuid(v6, "flow-uuid", (const unsigned __int8 *)v2);
    unsigned int ip_protocol = nw_parameters_get_ip_protocol();
    xpc_dictionary_set_uint64(v6, "ip-protocol", ip_protocol);
    pid_t v8 = getpid();
    xpc_dictionary_set_uint64(v6, "client-pid", v8);
    int pid = nw_parameters_get_pid();
    xpc_dictionary_set_uint64(v6, "client-e-pid", pid);
    xpc_dictionary_set_uint64(v6, "connection-direction", server_mode ^ 1u);
    nw_parameters_get_proc_uuid();
    xpc_dictionary_set_uuid(v6, "client-proc-uuid", uuid);
    nw_parameters_get_e_proc_uuid();
    xpc_dictionary_set_uuid(v6, "client-e-proc-uuid", uu);
    effective_bundle_id = (const char *)nw_parameters_get_effective_bundle_id();
    if (effective_bundle_id) {
      xpc_dictionary_set_string(v6, "source-app-bundle-id", effective_bundle_id);
    }
    memset(out, 0, 37);
    memset(v61, 0, 37);
    uuid_unparse(uuid, out);
    uuid_unparse(uu, v61);
    uint64_t v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      pid_t v33 = getpid();
      int v34 = nw_parameters_get_pid();
      *(_DWORD *)length_4 = 67110402;
      int v35 = "(no bundle id)";
      *(_DWORD *)&length_4[4] = v33;
      if (effective_bundle_id) {
        int v35 = effective_bundle_id;
      }
      *(_WORD *)&length_4[8] = 1024;
      __int16 v36 = "OUT";
      *(_DWORD *)&length_4[10] = v34;
      *(_WORD *)&length_4[14] = 2080;
      *(void *)&length_4[16] = out;
      if (server_mode) {
        __int16 v36 = "IN";
      }
      *(_WORD *)&length_4[24] = 2080;
      *(void *)&length_4[26] = v61;
      *(_WORD *)&length_4[34] = 2080;
      *(void *)&length_4[36] = v35;
      *(_WORD *)&length_4[44] = 2080;
      *(void *)&length_4[46] = v36;
      _os_log_debug_impl(&dword_212970000, v11, OS_LOG_TYPE_DEBUG, "FILTER PROTOCOL: New flow info:\n\t\t\t\tpid:\t%d\n\t\t\t\tepid:\t%d\n\t\t\t\tuuid:\t%s\n\t\t\t\teuuid:\t%s\n\t\t\t\tbundle id: %s\n\t\t\t\tconnection Dir: %s", length_4, 0x36u);
    }
    uint64_t url = (const char *)nw_parameters_get_url();
    if (url) {
      xpc_dictionary_set_string(v6, "url", url);
    }
    uint64_t v13 = *(NSObject **)(v2 + 64);
    if (v13)
    {
      if (nw_endpoint_get_type(v13) == nw_endpoint_type_address)
      {
        uint64_t address = nw_endpoint_get_address(*(nw_endpoint_t *)(v2 + 64));
        if (address) {
          xpc_dictionary_set_data(v6, "local-addr", address, address->sa_len);
        }
      }
    }
    uint64_t v15 = *(NSObject **)(v2 + 72);
    if (v15)
    {
      nw_endpoint_type_t type = nw_endpoint_get_type(v15);
      uint64_t v17 = *(NSObject **)(v2 + 72);
      if (type == nw_endpoint_type_address)
      {
        uint64_t v18 = nw_endpoint_get_address(v17);
        if (v18) {
          xpc_dictionary_set_data(v6, "remote-addr", v18, v18->sa_len);
        }
        parent_endpoint_unint64_t domain = (const char *)nw_endpoint_get_parent_endpoint_domain();
        if (!parent_endpoint_domain) {
          goto LABEL_23;
        }
      }
      else
      {
        if (nw_endpoint_get_type(v17) != nw_endpoint_type_host) {
          goto LABEL_23;
        }
        memset(length_4, 0, 28);
        ne_filter_create_wildcard_remote_sockaddr((uint64_t)length_4, v2);
        xpc_dictionary_set_data(v6, "remote-addr", length_4, length_4[0]);
        parent_endpoint_unint64_t domain = nw_endpoint_get_hostname(*(nw_endpoint_t *)(v2 + 72));
        if (!parent_endpoint_domain) {
          goto LABEL_23;
        }
      }
      xpc_dictionary_set_string(v6, "remote-hostname", parent_endpoint_domain);
    }
LABEL_23:
    memset(bytes, 0, sizeof(bytes));
    unsigned int length = 0;
    if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v2, (uint64_t)bytes, &length, 0))
    {
      xpc_dictionary_set_data(v6, "crypto-signature", bytes, length);
    }
    else
    {
      uint64_t v21 = ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)length_4 = 0;
        _os_log_error_impl(&dword_212970000, v21, OS_LOG_TYPE_ERROR, "Failed to generate signature for new flow message", length_4, 2u);
      }
    }
    memset(v59, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, v59);
    int v22 = *(_DWORD *)(v2 + 176);
    uint64_t v23 = ne_log_obj();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v22 == 3)
    {
      if (v24)
      {
        uint64_t v25 = *(void *)(v2 + 80);
        if (v25) {
          LODWORD(v25) = nw_parameters_get_ip_protocol();
        }
        uint64_t v26 = *(void **)(v2 + 160);
        if (v26)
        {
          uint64_t v28 = v26[6];
          uint64_t v29 = v26[7];
          uint64_t v27 = v26[8];
          uint64_t v30 = v26[9];
        }
        else
        {
          uint64_t v27 = -1;
          uint64_t v28 = -1;
          uint64_t v29 = -1;
          uint64_t v30 = -1;
        }
        __int16 v40 = *(void **)(v2 + 168);
        if (v40)
        {
          uint64_t v42 = v40[6];
          uint64_t v43 = v40[7];
          uint64_t v41 = v40[8];
          uint64_t v44 = v40[9];
        }
        else
        {
          uint64_t v41 = -1;
          uint64_t v42 = -1;
          uint64_t v43 = -1;
          uint64_t v44 = -1;
        }
        *(_DWORD *)length_4 = 136317442;
        *(void *)&length_4[4] = v59;
        *(_WORD *)&length_4[12] = 1024;
        *(_DWORD *)&length_4[14] = v25;
        *(_WORD *)&length_4[18] = 2048;
        *(void *)&length_4[20] = v28;
        *(_WORD *)&length_4[28] = 2048;
        *(void *)&length_4[30] = v29;
        *(_WORD *)&length_4[38] = 2048;
        *(void *)&length_4[40] = v27;
        *(_WORD *)&length_4[48] = 2048;
        *(void *)&length_4[50] = v30;
        __int16 v51 = 2048;
        uint64_t v52 = v42;
        __int16 v53 = 2048;
        uint64_t v54 = v43;
        __int16 v55 = 2048;
        uint64_t v56 = v41;
        __int16 v57 = 2048;
        uint64_t v58 = v44;
        uint64_t v45 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending new flow message";
        __int16 v46 = v23;
        uint32_t v47 = 98;
LABEL_52:
        _os_log_debug_impl(&dword_212970000, v46, OS_LOG_TYPE_DEBUG, v45, length_4, v47);
      }
    }
    else if (v24)
    {
      uint64_t v37 = *(void *)(v2 + 80);
      if (v37) {
        LODWORD(v37) = nw_parameters_get_ip_protocol();
      }
      uint64_t v38 = *(unsigned int *)(v2 + 176);
      if (v38 > 3) {
        __int16 v39 = "unknown";
      }
      else {
        __int16 v39 = off_264195FA0[v38];
      }
      *(_DWORD *)length_4 = 136315650;
      *(void *)&length_4[4] = v59;
      *(_WORD *)&length_4[12] = 1024;
      *(_DWORD *)&length_4[14] = v37;
      *(_WORD *)&length_4[18] = 2080;
      *(void *)&length_4[20] = v39;
      uint64_t v45 = "[filter %s %d %s] sending new flow message";
      __int16 v46 = v23;
      uint32_t v47 = 28;
      goto LABEL_52;
    }
    atomic_fetch_add((atomic_uint *volatile)(v2 + 180), 1u);
    uint64_t v31 = *(os_unfair_lock_s **)(v2 + 96);
    unsigned int v32 = *(_DWORD *)(a2 + 4);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 0x40000000;
    v48[2] = __ne_filter_data_protocol_send_new_flow_block_invoke;
    v48[3] = &__block_descriptor_tmp_64;
    v48[4] = v2;
    v48[5] = a1;
    v48[6] = a2;
    ne_filter_send_message(v31, v32, v6, v48);
    xpc_release(v6);
    return;
  }
  uint64_t v20 = ne_log_obj();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)length_4 = 0;
    _os_log_impl(&dword_212970000, v20, OS_LOG_TYPE_INFO, "filter is null", length_4, 2u);
  }
}

uint64_t __ne_filter_data_protocol_send_new_flow_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  memset(out, 0, 37);
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 176);
  unint64_t v5 = ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      uint64_t v7 = *(void **)(a1 + 32);
      uint64_t v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        uint64_t v7 = *(void **)(a1 + 32);
      }
      BOOL v9 = (void *)v7[20];
      if (v9)
      {
        uint64_t v11 = v9[6];
        uint64_t v12 = v9[7];
        uint64_t v10 = v9[8];
        uint64_t v13 = v9[9];
      }
      else
      {
        uint64_t v10 = -1;
        uint64_t v11 = -1;
        uint64_t v12 = -1;
        uint64_t v13 = -1;
      }
      uint64_t v19 = (void *)v7[21];
      if (v19)
      {
        uint64_t v21 = v19[6];
        uint64_t v22 = v19[7];
        uint64_t v20 = v19[8];
        uint64_t v23 = v19[9];
      }
      else
      {
        uint64_t v20 = -1;
        uint64_t v21 = -1;
        uint64_t v22 = -1;
        uint64_t v23 = -1;
      }
      *(_DWORD *)long long buf = 136317442;
      uint64_t v28 = out;
      __int16 v29 = 1024;
      int v30 = v8;
      __int16 v31 = 2048;
      uint64_t v32 = v11;
      __int16 v33 = 2048;
      uint64_t v34 = v12;
      __int16 v35 = 2048;
      uint64_t v36 = v10;
      __int16 v37 = 2048;
      uint64_t v38 = v13;
      __int16 v39 = 2048;
      uint64_t v40 = v21;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 2048;
      uint64_t v44 = v20;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      BOOL v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]received new flow xpc reply";
      uint64_t v25 = v5;
      uint32_t v26 = 98;
LABEL_20:
      _os_log_debug_impl(&dword_212970000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
    }
  }
  else if (v6)
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      uint64_t v15 = *(void *)(a1 + 32);
    }
    uint64_t v17 = *(unsigned int *)(v15 + 176);
    if (v17 > 3) {
      uint64_t v18 = "unknown";
    }
    else {
      uint64_t v18 = off_264195FA0[v17];
    }
    *(_DWORD *)long long buf = 136315650;
    uint64_t v28 = out;
    __int16 v29 = 1024;
    int v30 = v16;
    __int16 v31 = 2080;
    uint64_t v32 = (uint64_t)v18;
    BOOL v24 = "[filter %s %d %s] received new flow xpc reply";
    uint64_t v25 = v5;
    uint32_t v26 = 28;
    goto LABEL_20;
  }
  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_new_flow_block_invoke_62(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2) {
    goto LABEL_4;
  }
  if (MEMORY[0x2166885F0](*(void *)(a1 + 32)) != MEMORY[0x263EF8720])
  {
    if (MEMORY[0x2166885F0](v2) == MEMORY[0x263EF8708]) {
      goto LABEL_8;
    }
LABEL_4:
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      int v4 = "Got an invalid new flow message reply";
      unint64_t v5 = v3;
      uint32_t v6 = 2;
LABEL_20:
      _os_log_error_impl(&dword_212970000, v5, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v14, v6);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  uint64_t v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x263EF86B0]);
    int v14 = 136315138;
    uint64_t v15 = string;
    int v4 = "Got an error on the XPC connection when sending a new flow message: %s";
    unint64_t v5 = v7;
    uint32_t v6 = 12;
    goto LABEL_20;
  }
LABEL_7:
  uint64_t v2 = 0;
LABEL_8:
  ne_filter_process_verdict(*(void *)(a1 + 40), 6, v2, **(unsigned int **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v14) = 0;
    uint64_t v12 = "protocol is null";
LABEL_17:
    _os_log_impl(&dword_212970000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 2u);
    return;
  }
  uint64_t v9 = *(void *)(v8 + 40);
  if (!v9)
  {
    uint64_t v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v14) = 0;
    uint64_t v12 = "filter is null";
    goto LABEL_17;
  }
  uint64_t v10 = (atomic_uint *)(v9 + 180);
  if (atomic_fetch_or(v10, 0))
  {
    if (atomic_fetch_add(v10, 0xFFFFFFFF) == 1) {
      ne_filter_protocol_destroy(*(void *)(a1 + 40));
    }
  }
}

void ne_filter_protocol_disconnected(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v25 = 136315138;
    uint32_t v26 = "ne_filter_protocol_disconnected";
    uint64_t v13 = "%s called with null protocol";
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v25 = 136315138;
    uint32_t v26 = "ne_filter_protocol_disconnected";
    uint64_t v13 = "%s called with null filter";
LABEL_15:
    _os_log_fault_impl(&dword_212970000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v25, 0xCu);
    return;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0) && (*(unsigned char *)(v2 + 120) & 0x40) == 0)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v3 = *(_DWORD *)(v2 + 176);
    int v4 = ne_log_obj();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3 == 3)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(v2 + 80);
        if (v6) {
          LODWORD(v6) = nw_parameters_get_ip_protocol();
        }
        uint64_t v7 = *(void **)(v2 + 160);
        if (v7)
        {
          uint64_t v9 = v7[6];
          uint64_t v10 = v7[7];
          uint64_t v8 = v7[8];
          uint64_t v11 = v7[9];
        }
        else
        {
          uint64_t v8 = -1;
          uint64_t v9 = -1;
          uint64_t v10 = -1;
          uint64_t v11 = -1;
        }
        uint64_t v17 = *(void **)(v2 + 168);
        if (v17)
        {
          uint64_t v19 = v17[6];
          uint64_t v20 = v17[7];
          uint64_t v18 = v17[8];
          uint64_t v21 = v17[9];
        }
        else
        {
          uint64_t v18 = -1;
          uint64_t v19 = -1;
          uint64_t v20 = -1;
          uint64_t v21 = -1;
        }
        int v25 = 136317442;
        uint32_t v26 = out;
        __int16 v27 = 1024;
        int v28 = v6;
        __int16 v29 = 2048;
        uint64_t v30 = v9;
        __int16 v31 = 2048;
        uint64_t v32 = v10;
        __int16 v33 = 2048;
        uint64_t v34 = v8;
        __int16 v35 = 2048;
        uint64_t v36 = v11;
        __int16 v37 = 2048;
        uint64_t v38 = v19;
        __int16 v39 = 2048;
        uint64_t v40 = v20;
        __int16 v41 = 2048;
        uint64_t v42 = v18;
        __int16 v43 = 2048;
        uint64_t v44 = v21;
        uint64_t v22 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]disconnected";
        uint64_t v23 = v4;
        uint32_t v24 = 98;
LABEL_30:
        _os_log_debug_impl(&dword_212970000, v23, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v25, v24);
      }
    }
    else if (v5)
    {
      uint64_t v14 = *(void *)(v2 + 80);
      if (v14) {
        LODWORD(v14) = nw_parameters_get_ip_protocol();
      }
      uint64_t v15 = *(unsigned int *)(v2 + 176);
      if (v15 > 3) {
        uint64_t v16 = "unknown";
      }
      else {
        uint64_t v16 = off_264195FA0[v15];
      }
      int v25 = 136315650;
      uint32_t v26 = out;
      __int16 v27 = 1024;
      int v28 = v14;
      __int16 v29 = 2080;
      uint64_t v30 = (uint64_t)v16;
      uint64_t v22 = "[filter %s %d %s] disconnected";
      uint64_t v23 = v4;
      uint32_t v24 = 28;
      goto LABEL_30;
    }
    *(_DWORD *)(v2 + 120) |= 0x40u;
    ne_filter_handle_output_finished(a1);
    ne_filter_handle_input_finished(a1, 0);
    ne_filter_cleanup(a1);
  }
}

void ne_filter_protocol_disconnect(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v25 = 136315138;
    uint32_t v26 = "ne_filter_protocol_disconnect";
    uint64_t v13 = "%s called with null protocol";
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v25 = 136315138;
    uint32_t v26 = "ne_filter_protocol_disconnect";
    uint64_t v13 = "%s called with null filter";
LABEL_15:
    _os_log_fault_impl(&dword_212970000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v25, 0xCu);
    return;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0) && (*(unsigned char *)(v2 + 120) & 0x10) == 0)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    int v3 = *(_DWORD *)(v2 + 176);
    int v4 = ne_log_obj();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3 == 3)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(v2 + 80);
        if (v6) {
          LODWORD(v6) = nw_parameters_get_ip_protocol();
        }
        uint64_t v7 = *(void **)(v2 + 160);
        if (v7)
        {
          uint64_t v9 = v7[6];
          uint64_t v10 = v7[7];
          uint64_t v8 = v7[8];
          uint64_t v11 = v7[9];
        }
        else
        {
          uint64_t v8 = -1;
          uint64_t v9 = -1;
          uint64_t v10 = -1;
          uint64_t v11 = -1;
        }
        uint64_t v17 = *(void **)(v2 + 168);
        if (v17)
        {
          uint64_t v19 = v17[6];
          uint64_t v20 = v17[7];
          uint64_t v18 = v17[8];
          uint64_t v21 = v17[9];
        }
        else
        {
          uint64_t v18 = -1;
          uint64_t v19 = -1;
          uint64_t v20 = -1;
          uint64_t v21 = -1;
        }
        int v25 = 136317442;
        uint32_t v26 = out;
        __int16 v27 = 1024;
        int v28 = v6;
        __int16 v29 = 2048;
        uint64_t v30 = v9;
        __int16 v31 = 2048;
        uint64_t v32 = v10;
        __int16 v33 = 2048;
        uint64_t v34 = v8;
        __int16 v35 = 2048;
        uint64_t v36 = v11;
        __int16 v37 = 2048;
        uint64_t v38 = v19;
        __int16 v39 = 2048;
        uint64_t v40 = v20;
        __int16 v41 = 2048;
        uint64_t v42 = v18;
        __int16 v43 = 2048;
        uint64_t v44 = v21;
        uint64_t v22 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output finished - disconnect";
        uint64_t v23 = v4;
        uint32_t v24 = 98;
LABEL_30:
        _os_log_debug_impl(&dword_212970000, v23, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v25, v24);
      }
    }
    else if (v5)
    {
      uint64_t v14 = *(void *)(v2 + 80);
      if (v14) {
        LODWORD(v14) = nw_parameters_get_ip_protocol();
      }
      uint64_t v15 = *(unsigned int *)(v2 + 176);
      if (v15 > 3) {
        uint64_t v16 = "unknown";
      }
      else {
        uint64_t v16 = off_264195FA0[v15];
      }
      int v25 = 136315650;
      uint32_t v26 = out;
      __int16 v27 = 1024;
      int v28 = v14;
      __int16 v29 = 2080;
      uint64_t v30 = (uint64_t)v16;
      uint64_t v22 = "[filter %s %d %s] output finished - disconnect";
      uint64_t v23 = v4;
      uint32_t v24 = 28;
      goto LABEL_30;
    }
    *(_DWORD *)(v2 + 120) |= 0x10u;
    ne_filter_handle_output_finished(a1);
  }
}

void ne_filter_protocol_connected(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v10 = ne_log_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v13 = 136315138;
    uint64_t v14 = "ne_filter_protocol_connected";
    uint64_t v11 = "%s called with null protocol";
    goto LABEL_25;
  }
  uint64_t v3 = a1[5];
  if (!v3)
  {
    uint64_t v10 = ne_log_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v13 = 136315138;
    uint64_t v14 = "ne_filter_protocol_connected";
    uint64_t v11 = "%s called with null filter";
LABEL_25:
    _os_log_fault_impl(&dword_212970000, v10, OS_LOG_TYPE_FAULT, v11, (uint8_t *)&v13, 0xCu);
    return;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v3 + 180), 0))
  {
    uint64_t v5 = a1[6];
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6)
      {
        uint64_t v7 = *(void (**)(void, uint64_t))(v6 + 40);
        if (v7) {
          v7(a1[6], a2);
        }
      }
    }
    if (a1[4] == a2)
    {
      *(_DWORD *)(v3 + 120) |= 8u;
      if (!*(void *)(v3 + 64))
      {
        uint64_t v8 = (void *)(*(uint64_t (**)(void *))(a1[3] + 128))(a1);
        *(void *)(v3 + 64) = nw_retain(v8);
      }
      unsigned int v9 = *(_DWORD *)(v3 + 176);
      if (v9 >= 2)
      {
        if (!v5 || v9 != 3) {
          return;
        }
      }
      else if (!v5)
      {
        return;
      }
      uint64_t v12 = *(void (**)(uint64_t, void *))(*(void *)(v5 + 24) + 40);
      if (v12)
      {
        v12(v5, a1);
      }
    }
  }
}

void ne_filter_protocol_output_finished(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v26 = 136315138;
    __int16 v27 = "ne_filter_protocol_output_finished";
    int v13 = "%s called with null protocol";
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v26 = 136315138;
    __int16 v27 = "ne_filter_protocol_output_finished";
    int v13 = "%s called with null filter";
LABEL_14:
    _os_log_fault_impl(&dword_212970000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v26, 0xCu);
    return;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0)) {
    return;
  }
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v2, out);
  int v3 = *(_DWORD *)(v2 + 176);
  int v4 = ne_log_obj();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == 3)
  {
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v6 = *(void *)(v2 + 80);
    if (v6) {
      LODWORD(v6) = nw_parameters_get_ip_protocol();
    }
    uint64_t v7 = *(void **)(v2 + 160);
    if (v7)
    {
      uint64_t v9 = v7[6];
      uint64_t v10 = v7[7];
      uint64_t v8 = v7[8];
      uint64_t v11 = v7[9];
    }
    else
    {
      uint64_t v8 = -1;
      uint64_t v9 = -1;
      uint64_t v10 = -1;
      uint64_t v11 = -1;
    }
    uint64_t v18 = *(void **)(v2 + 168);
    if (v18)
    {
      uint64_t v20 = v18[6];
      uint64_t v21 = v18[7];
      uint64_t v19 = v18[8];
      uint64_t v22 = v18[9];
    }
    else
    {
      uint64_t v19 = -1;
      uint64_t v20 = -1;
      uint64_t v21 = -1;
      uint64_t v22 = -1;
    }
    int v26 = 136317442;
    __int16 v27 = out;
    __int16 v28 = 1024;
    int v29 = v6;
    __int16 v30 = 2048;
    uint64_t v31 = v9;
    __int16 v32 = 2048;
    uint64_t v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = v8;
    __int16 v36 = 2048;
    uint64_t v37 = v11;
    __int16 v38 = 2048;
    uint64_t v39 = v20;
    __int16 v40 = 2048;
    uint64_t v41 = v21;
    __int16 v42 = 2048;
    uint64_t v43 = v19;
    __int16 v44 = 2048;
    uint64_t v45 = v22;
    uint64_t v23 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output finished";
    uint32_t v24 = v4;
    uint32_t v25 = 98;
  }
  else
  {
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v15 = *(void *)(v2 + 80);
    if (v15) {
      LODWORD(v15) = nw_parameters_get_ip_protocol();
    }
    uint64_t v16 = *(unsigned int *)(v2 + 176);
    if (v16 > 3) {
      uint64_t v17 = "unknown";
    }
    else {
      uint64_t v17 = off_264195FA0[v16];
    }
    int v26 = 136315650;
    __int16 v27 = out;
    __int16 v28 = 1024;
    int v29 = v15;
    __int16 v30 = 2080;
    uint64_t v31 = (uint64_t)v17;
    uint64_t v23 = "[filter %s %d %s] output finished";
    uint32_t v24 = v4;
    uint32_t v25 = 28;
  }
  _os_log_debug_impl(&dword_212970000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v26, v25);
LABEL_16:
  if ((*(_DWORD *)(v2 + 176) | 2) == 3)
  {
    int v14 = *(_DWORD *)(v2 + 120);
    if ((v14 & 0x10) == 0)
    {
      *(_DWORD *)(v2 + 120) = v14 | 0x100;
      ne_filter_handle_output_finished(a1);
    }
  }
}

void ne_filter_protocol_input_finished(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)uint32_t v25 = 136315138;
    *(void *)&v25[4] = "ne_filter_protocol_input_finished";
    int v13 = "%s called with null protocol";
    goto LABEL_16;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)uint32_t v25 = 136315138;
    *(void *)&v25[4] = "ne_filter_protocol_input_finished";
    int v13 = "%s called with null filter";
LABEL_16:
    _os_log_fault_impl(&dword_212970000, v12, OS_LOG_TYPE_FAULT, v13, v25, 0xCu);
    return;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0)
    || (*(_DWORD *)(v2 + 176) | 2) != 3
    || (*(_WORD *)(v2 + 120) & 0x240) != 0)
  {
    return;
  }
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v2, out);
  int v3 = *(_DWORD *)(v2 + 176);
  int v4 = ne_log_obj();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == 3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(v2 + 80);
      if (v6) {
        LODWORD(v6) = nw_parameters_get_ip_protocol();
      }
      uint64_t v7 = *(void **)(v2 + 160);
      if (v7)
      {
        uint64_t v9 = v7[6];
        uint64_t v10 = v7[7];
        uint64_t v8 = v7[8];
        uint64_t v11 = v7[9];
      }
      else
      {
        uint64_t v8 = -1;
        uint64_t v9 = -1;
        uint64_t v10 = -1;
        uint64_t v11 = -1;
      }
      uint64_t v17 = *(void **)(v2 + 168);
      if (v17)
      {
        uint64_t v19 = v17[6];
        uint64_t v20 = v17[7];
        uint64_t v18 = v17[8];
        uint64_t v21 = v17[9];
      }
      else
      {
        uint64_t v18 = -1;
        uint64_t v19 = -1;
        uint64_t v20 = -1;
        uint64_t v21 = -1;
      }
      *(_DWORD *)uint32_t v25 = 136317442;
      *(void *)&v25[4] = out;
      *(_WORD *)&v25[12] = 1024;
      *(_DWORD *)&v25[14] = v6;
      __int16 v26 = 2048;
      uint64_t v27 = v9;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      __int16 v30 = 2048;
      uint64_t v31 = v8;
      __int16 v32 = 2048;
      uint64_t v33 = v11;
      __int16 v34 = 2048;
      uint64_t v35 = v19;
      __int16 v36 = 2048;
      uint64_t v37 = v20;
      __int16 v38 = 2048;
      uint64_t v39 = v18;
      __int16 v40 = 2048;
      uint64_t v41 = v21;
      uint64_t v22 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]input finished";
      uint64_t v23 = v4;
      uint32_t v24 = 98;
LABEL_33:
      _os_log_debug_impl(&dword_212970000, v23, OS_LOG_TYPE_DEBUG, v22, v25, v24);
    }
  }
  else if (v5)
  {
    uint64_t v14 = *(void *)(v2 + 80);
    if (v14) {
      LODWORD(v14) = nw_parameters_get_ip_protocol();
    }
    uint64_t v15 = *(unsigned int *)(v2 + 176);
    if (v15 > 3) {
      uint64_t v16 = "unknown";
    }
    else {
      uint64_t v16 = off_264195FA0[v15];
    }
    *(_DWORD *)uint32_t v25 = 136315650;
    *(void *)&v25[4] = out;
    *(_WORD *)&v25[12] = 1024;
    *(_DWORD *)&v25[14] = v14;
    __int16 v26 = 2080;
    uint64_t v27 = (uint64_t)v16;
    uint64_t v22 = "[filter %s %d %s] input finished";
    uint64_t v23 = v4;
    uint32_t v24 = 28;
    goto LABEL_33;
  }
  *(_DWORD *)(v2 + 120) |= 0x200u;
  *(void *)uint32_t v25 = 0;
  *(void *)&v25[8] = 0;
  nw_frame_array_init();
  if ((*(unsigned char *)(v2 + 121) & 0x40) == 0) {
    ne_filter_read_from_network(*(void *)(a1 + 40), (uint64_t)v25, 1);
  }
  ne_filter_handle_input_finished(a1, (uint64_t)v25);
}

void ne_filter_read_from_network(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (atomic_fetch_or((atomic_uint *volatile)(a1 + 180), 0))
    {
      if (a3) {
        goto LABEL_8;
      }
      uint64_t v4 = *(void *)(a1 + 144);
      if (!v4) {
        goto LABEL_8;
      }
      while (*(_DWORD *)(v4 + 40) != 3 || *(void *)(v4 + 48) == -1)
      {
        uint64_t v4 = *(void *)(v4 + 152);
        if (!v4) {
          goto LABEL_8;
        }
      }
      unint64_t v28 = *(void *)(v4 + 88) + nw_frame_array_unclaimed_length();
      unint64_t v29 = *(void *)(v4 + 56);
      if (v29 > v28 && v29 != v28)
      {
LABEL_8:
        nw_frame_array_init();
        uint64_t v5 = *(void *)(a1 + 32);
        if (v5)
        {
          uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 + 24) + 80);
          if (v6)
          {
            int v7 = v6(v5, a1);
            if (v7)
            {
              int v8 = v7;
              memset(out, 0, 37);
              uuid_unparse((const unsigned __int8 *)a1, out);
              int v9 = *(_DWORD *)(a1 + 176);
              uint64_t v10 = ne_log_obj();
              BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
              if (v9 == 3)
              {
                if (v11)
                {
                  uint64_t v12 = *(void *)(a1 + 80);
                  if (v12) {
                    LODWORD(v12) = nw_parameters_get_ip_protocol();
                  }
                  int v13 = *(void **)(a1 + 160);
                  if (v13)
                  {
                    uint64_t v15 = v13[6];
                    uint64_t v16 = v13[7];
                    uint64_t v14 = v13[8];
                    uint64_t v17 = v13[9];
                  }
                  else
                  {
                    uint64_t v14 = -1;
                    uint64_t v15 = -1;
                    uint64_t v16 = -1;
                    uint64_t v17 = -1;
                  }
                  uint64_t v37 = *(void **)(a1 + 168);
                  if (v37)
                  {
                    uint64_t v39 = v37[6];
                    uint64_t v40 = v37[7];
                    uint64_t v38 = v37[8];
                    uint64_t v41 = v37[9];
                  }
                  else
                  {
                    uint64_t v38 = -1;
                    uint64_t v39 = -1;
                    uint64_t v40 = -1;
                    uint64_t v41 = -1;
                  }
                  *(_DWORD *)long long buf = 136317698;
                  uint64_t v54 = out;
                  __int16 v55 = 1024;
                  int v56 = v12;
                  __int16 v57 = 2048;
                  uint64_t v58 = v15;
                  __int16 v59 = 2048;
                  uint64_t v60 = v16;
                  __int16 v61 = 2048;
                  uint64_t v62 = v14;
                  __int16 v63 = 2048;
                  uint64_t v64 = v17;
                  __int16 v65 = 2048;
                  uint64_t v66 = v39;
                  __int16 v67 = 2048;
                  uint64_t v68 = v40;
                  __int16 v69 = 2048;
                  uint64_t v70 = v38;
                  __int16 v71 = 2048;
                  uint64_t v72 = v41;
                  __int16 v73 = 1024;
                  int v74 = v8;
                  __int16 v42 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]rec"
                        "eived %u frames from output handler";
                  uint64_t v43 = v10;
                  uint32_t v44 = 104;
LABEL_50:
                  _os_log_debug_impl(&dword_212970000, v43, OS_LOG_TYPE_DEBUG, v42, buf, v44);
                }
              }
              else if (v11)
              {
                uint64_t v31 = *(void *)(a1 + 80);
                if (v31) {
                  LODWORD(v31) = nw_parameters_get_ip_protocol();
                }
                uint64_t v32 = *(unsigned int *)(a1 + 176);
                if (v32 > 3) {
                  uint64_t v33 = "unknown";
                }
                else {
                  uint64_t v33 = off_264195FA0[v32];
                }
                *(_DWORD *)long long buf = 136315906;
                uint64_t v54 = out;
                __int16 v55 = 1024;
                int v56 = v31;
                __int16 v57 = 2080;
                uint64_t v58 = (uint64_t)v33;
                __int16 v59 = 1024;
                LODWORD(v60) = v8;
                __int16 v42 = "[filter %s %d %s] received %u frames from output handler";
                uint64_t v43 = v10;
                uint32_t v44 = 34;
                goto LABEL_50;
              }
              nw_frame_array_append_array();
              return;
            }
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)a1, out);
            int v19 = *(_DWORD *)(a1 + 176);
            uint64_t v20 = ne_log_obj();
            BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
            if (v19 == 3)
            {
              if (v21)
              {
                uint64_t v22 = *(void *)(a1 + 80);
                if (v22) {
                  LODWORD(v22) = nw_parameters_get_ip_protocol();
                }
                uint64_t v23 = *(void **)(a1 + 160);
                if (v23)
                {
                  uint64_t v25 = v23[6];
                  uint64_t v26 = v23[7];
                  uint64_t v24 = v23[8];
                  uint64_t v27 = v23[9];
                }
                else
                {
                  uint64_t v24 = -1;
                  uint64_t v25 = -1;
                  uint64_t v26 = -1;
                  uint64_t v27 = -1;
                }
                uint64_t v45 = *(void **)(a1 + 168);
                if (v45)
                {
                  uint64_t v47 = v45[6];
                  uint64_t v48 = v45[7];
                  uint64_t v46 = v45[8];
                  uint64_t v49 = v45[9];
                }
                else
                {
                  uint64_t v46 = -1;
                  uint64_t v47 = -1;
                  uint64_t v48 = -1;
                  uint64_t v49 = -1;
                }
                *(_DWORD *)long long buf = 136317442;
                uint64_t v54 = out;
                __int16 v55 = 1024;
                int v56 = v22;
                __int16 v57 = 2048;
                uint64_t v58 = v25;
                __int16 v59 = 2048;
                uint64_t v60 = v26;
                __int16 v61 = 2048;
                uint64_t v62 = v24;
                __int16 v63 = 2048;
                uint64_t v64 = v27;
                __int16 v65 = 2048;
                uint64_t v66 = v47;
                __int16 v67 = 2048;
                uint64_t v68 = v48;
                __int16 v69 = 2048;
                uint64_t v70 = v46;
                __int16 v71 = 2048;
                uint64_t v72 = v49;
                __int16 v50 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no fr"
                      "ames returned from output handler";
                __int16 v51 = v20;
                uint32_t v52 = 98;
LABEL_58:
                _os_log_debug_impl(&dword_212970000, v51, OS_LOG_TYPE_DEBUG, v50, buf, v52);
              }
            }
            else if (v21)
            {
              uint64_t v34 = *(void *)(a1 + 80);
              if (v34) {
                LODWORD(v34) = nw_parameters_get_ip_protocol();
              }
              uint64_t v35 = *(unsigned int *)(a1 + 176);
              if (v35 > 3) {
                __int16 v36 = "unknown";
              }
              else {
                __int16 v36 = off_264195FA0[v35];
              }
              *(_DWORD *)long long buf = 136315650;
              uint64_t v54 = out;
              __int16 v55 = 1024;
              int v56 = v34;
              __int16 v57 = 2080;
              uint64_t v58 = (uint64_t)v36;
              __int16 v50 = "[filter %s %d %s] no frames returned from output handler";
              __int16 v51 = v20;
              uint32_t v52 = 28;
              goto LABEL_58;
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v54 = "ne_filter_read_from_network";
      _os_log_fault_impl(&dword_212970000, v18, OS_LOG_TYPE_FAULT, "%s called with null filter", buf, 0xCu);
    }
  }
}

void ne_filter_protocol_output_available(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    int v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v10 = 136315138;
    BOOL v11 = "ne_filter_protocol_output_available";
    int v8 = "%s called with null protocol";
LABEL_19:
    _os_log_fault_impl(&dword_212970000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    return;
  }
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    int v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v10 = 136315138;
    BOOL v11 = "ne_filter_protocol_output_available";
    int v8 = "%s called with null filter";
    goto LABEL_19;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v1 + 180), 0))
  {
    int v2 = *(_DWORD *)(v1 + 176);
    if (v2 == 3 || v2 == 1)
    {
      uint64_t v4 = *(void *)(v1 + 48);
      if (v4)
      {
        uint64_t v5 = *(void *)(v4 + 24);
        if (v5)
        {
          uint64_t v6 = *(void (**)(void))(v5 + 72);
          if (v6)
          {
            v6();
          }
        }
      }
    }
    else if (!v2)
    {
      int v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10) = 0;
        _os_log_debug_impl(&dword_212970000, v9, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v10, 2u);
      }
    }
  }
}

uint64_t ne_filter_protocol_finalize_output_frames(uint64_t a1, uint64_t a2)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v16 = ne_log_obj();
    uint64_t result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v72 = "ne_filter_protocol_finalize_output_frames";
    uint64_t v18 = "%s called with null protocol";
LABEL_22:
    _os_log_fault_impl(&dword_212970000, v16, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v16 = ne_log_obj();
    uint64_t result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 136315138;
    uint64_t v72 = "ne_filter_protocol_finalize_output_frames";
    uint64_t v18 = "%s called with null filter";
    goto LABEL_22;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0))
  {
    int v3 = *(_DWORD *)(v2 + 176);
    if (v3)
    {
      uint64_t v5 = *(void *)(v2 + 32);
      BOOL v6 = v3 == 2 || v5 == 0;
      if (!v6 && *(void *)(*(void *)(v5 + 24) + 96))
      {
        if (v3 == 1 && (*(unsigned char *)(v2 + 121) & 0x20) == 0)
        {
          memset(out, 0, 37);
          uuid_unparse((const unsigned __int8 *)v2, out);
          int v7 = *(_DWORD *)(v2 + 176);
          int v8 = ne_log_obj();
          BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
          if (v7 == 3)
          {
            if (v9)
            {
              uint64_t v10 = *(void *)(v2 + 80);
              if (v10) {
                LODWORD(v10) = nw_parameters_get_ip_protocol();
              }
              BOOL v11 = *(void **)(v2 + 160);
              if (v11)
              {
                uint64_t v13 = v11[6];
                uint64_t v14 = v11[7];
                uint64_t v12 = v11[8];
                uint64_t v15 = v11[9];
              }
              else
              {
                uint64_t v12 = -1;
                uint64_t v13 = -1;
                uint64_t v14 = -1;
                uint64_t v15 = -1;
              }
              uint64_t v60 = *(void **)(v2 + 168);
              if (v60)
              {
                uint64_t v62 = v60[6];
                uint64_t v63 = v60[7];
                uint64_t v61 = v60[8];
                uint64_t v64 = v60[9];
              }
              else
              {
                uint64_t v61 = -1;
                uint64_t v62 = -1;
                uint64_t v63 = -1;
                uint64_t v64 = -1;
              }
              *(_DWORD *)long long buf = 136317442;
              uint64_t v72 = out;
              __int16 v73 = 1024;
              int v74 = v10;
              __int16 v75 = 2048;
              uint64_t v76 = v13;
              __int16 v77 = 2048;
              uint64_t v78 = v14;
              __int16 v79 = 2048;
              uint64_t v80 = v12;
              __int16 v81 = 2048;
              uint64_t v82 = v15;
              __int16 v83 = 2048;
              uint64_t v84 = v62;
              __int16 v85 = 2048;
              uint64_t v86 = v63;
              __int16 v87 = 2048;
              uint64_t v88 = v61;
              __int16 v89 = 2048;
              uint64_t v90 = v64;
              __int16 v65 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]passing"
                    " finalize output frames";
              uint64_t v66 = v8;
              uint32_t v67 = 98;
LABEL_82:
              _os_log_debug_impl(&dword_212970000, v66, OS_LOG_TYPE_DEBUG, v65, buf, v67);
            }
          }
          else if (v9)
          {
            uint64_t v57 = *(void *)(v2 + 80);
            if (v57) {
              LODWORD(v57) = nw_parameters_get_ip_protocol();
            }
            uint64_t v58 = *(unsigned int *)(v2 + 176);
            if (v58 > 3) {
              __int16 v59 = "unknown";
            }
            else {
              __int16 v59 = off_264195FA0[v58];
            }
            *(_DWORD *)long long buf = 136315650;
            uint64_t v72 = out;
            __int16 v73 = 1024;
            int v74 = v57;
            __int16 v75 = 2080;
            uint64_t v76 = (uint64_t)v59;
            __int16 v65 = "[filter %s %d %s] passing finalize output frames";
            uint64_t v66 = v8;
            uint32_t v67 = 28;
            goto LABEL_82;
          }
          return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 + 24) + 96))(v5, a2);
        }
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v2, out);
        int v29 = *(_DWORD *)(v2 + 176);
        __int16 v30 = ne_log_obj();
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
        if (v29 == 3)
        {
          if (v31)
          {
            if (*(void *)(v2 + 80)) {
              int ip_protocol = nw_parameters_get_ip_protocol();
            }
            else {
              int ip_protocol = 0;
            }
            uint32_t v44 = *(void **)(v2 + 160);
            if (v44)
            {
              uint64_t v45 = v44[7];
              uint64_t v46 = v44[9];
              uint64_t v68 = v44[6];
              uint64_t v69 = v44[8];
            }
            else
            {
              uint64_t v68 = -1;
              uint64_t v69 = -1;
              uint64_t v45 = -1;
              uint64_t v46 = -1;
            }
            uint64_t v49 = *(void **)(v2 + 168);
            if (v49)
            {
              uint64_t v51 = v49[6];
              uint64_t v52 = v49[7];
              uint64_t v50 = v49[8];
              uint64_t v53 = v49[9];
            }
            else
            {
              uint64_t v50 = -1;
              uint64_t v51 = -1;
              uint64_t v52 = -1;
              uint64_t v53 = -1;
            }
            *(_DWORD *)long long buf = 136317698;
            uint64_t v72 = out;
            __int16 v73 = 1024;
            int v74 = ip_protocol;
            __int16 v75 = 2048;
            uint64_t v76 = v68;
            __int16 v77 = 2048;
            uint64_t v78 = v45;
            __int16 v79 = 2048;
            uint64_t v80 = v69;
            __int16 v81 = 2048;
            uint64_t v82 = v46;
            __int16 v83 = 2048;
            uint64_t v84 = v51;
            __int16 v85 = 2048;
            uint64_t v86 = v52;
            __int16 v87 = 2048;
            uint64_t v88 = v50;
            __int16 v89 = 2048;
            uint64_t v90 = v53;
            __int16 v91 = 1024;
            int v92 = nw_frame_array_unclaimed_length();
            uint64_t v54 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering"
                  " new output frames, length %u";
            __int16 v55 = v30;
            uint32_t v56 = 104;
LABEL_70:
            _os_log_debug_impl(&dword_212970000, v55, OS_LOG_TYPE_DEBUG, v54, buf, v56);
          }
        }
        else if (v31)
        {
          if (*(void *)(v2 + 80)) {
            int v43 = nw_parameters_get_ip_protocol();
          }
          else {
            int v43 = 0;
          }
          uint64_t v47 = *(unsigned int *)(v2 + 176);
          if (v47 > 3) {
            uint64_t v48 = "unknown";
          }
          else {
            uint64_t v48 = off_264195FA0[v47];
          }
          *(_DWORD *)long long buf = 136315906;
          uint64_t v72 = out;
          __int16 v73 = 1024;
          int v74 = v43;
          __int16 v75 = 2080;
          uint64_t v76 = (uint64_t)v48;
          __int16 v77 = 1024;
          LODWORD(v78) = nw_frame_array_unclaimed_length();
          uint64_t v54 = "[filter %s %d %s] filtering new output frames, length %u";
          __int16 v55 = v30;
          uint32_t v56 = 34;
          goto LABEL_70;
        }
        ne_filter_send_approved_frames(v2, a2);
        return 1;
      }
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)v2, out);
      int v19 = *(_DWORD *)(v2 + 176);
      uint64_t v20 = ne_log_obj();
      BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
      if (v19 == 3)
      {
        if (v21)
        {
          uint64_t v22 = *(void *)(v2 + 80);
          if (v22) {
            LODWORD(v22) = nw_parameters_get_ip_protocol();
          }
          uint64_t v23 = *(void **)(v2 + 160);
          if (v23)
          {
            uint64_t v25 = v23[6];
            uint64_t v26 = v23[7];
            uint64_t v24 = v23[8];
            uint64_t v27 = v23[9];
          }
          else
          {
            uint64_t v24 = -1;
            uint64_t v25 = -1;
            uint64_t v26 = -1;
            uint64_t v27 = -1;
          }
          uint64_t v35 = *(void **)(v2 + 168);
          if (v35)
          {
            uint64_t v37 = v35[6];
            uint64_t v38 = v35[7];
            uint64_t v36 = v35[8];
            uint64_t v39 = v35[9];
          }
          else
          {
            uint64_t v36 = -1;
            uint64_t v37 = -1;
            uint64_t v38 = -1;
            uint64_t v39 = -1;
          }
          *(_DWORD *)long long buf = 136317442;
          uint64_t v72 = out;
          __int16 v73 = 1024;
          int v74 = v22;
          __int16 v75 = 2048;
          uint64_t v76 = v25;
          __int16 v77 = 2048;
          uint64_t v78 = v26;
          __int16 v79 = 2048;
          uint64_t v80 = v24;
          __int16 v81 = 2048;
          uint64_t v82 = v27;
          __int16 v83 = 2048;
          uint64_t v84 = v37;
          __int16 v85 = 2048;
          uint64_t v86 = v38;
          __int16 v87 = 2048;
          uint64_t v88 = v36;
          __int16 v89 = 2048;
          uint64_t v90 = v39;
          uint64_t v40 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]dropping output frames";
          uint64_t v41 = v20;
          uint32_t v42 = 98;
LABEL_54:
          _os_log_debug_impl(&dword_212970000, v41, OS_LOG_TYPE_DEBUG, v40, buf, v42);
        }
      }
      else if (v21)
      {
        uint64_t v32 = *(void *)(v2 + 80);
        if (v32) {
          LODWORD(v32) = nw_parameters_get_ip_protocol();
        }
        uint64_t v33 = *(unsigned int *)(v2 + 176);
        if (v33 > 3) {
          uint64_t v34 = "unknown";
        }
        else {
          uint64_t v34 = off_264195FA0[v33];
        }
        *(_DWORD *)long long buf = 136315650;
        uint64_t v72 = out;
        __int16 v73 = 1024;
        int v74 = v32;
        __int16 v75 = 2080;
        uint64_t v76 = (uint64_t)v34;
        uint64_t v40 = "[filter %s %d %s] dropping output frames";
        uint64_t v41 = v20;
        uint32_t v42 = 28;
        goto LABEL_54;
      }
      nw_frame_array_foreach();
      return 0;
    }
    unint64_t v28 = ne_log_obj();
    uint64_t result = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_212970000, v28, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", buf, 2u);
  }
  return 0;
}

uint64_t __ne_filter_protocol_finalize_output_frames_block_invoke()
{
  return 1;
}

uint64_t ne_filter_protocol_get_output_frames(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    int v33 = 136315138;
    uint64_t v34 = "ne_filter_protocol_get_output_frames";
    uint64_t v5 = "%s called with null protocol";
LABEL_30:
    _os_log_fault_impl(&dword_212970000, v4, OS_LOG_TYPE_FAULT, v5, (uint8_t *)&v33, 0xCu);
    return 0;
  }
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    uint64_t v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    int v33 = 136315138;
    uint64_t v34 = "ne_filter_protocol_get_output_frames";
    uint64_t v5 = "%s called with null filter";
    goto LABEL_30;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v1 + 180), 0))
  {
    int v2 = *(_DWORD *)(v1 + 176);
    if (v2 != 2)
    {
      if (v2)
      {
        if ((*(_DWORD *)(v1 + 120) & 0x48) == 8)
        {
          uint64_t v8 = *(void *)(v1 + 32);
          if (v8 && (BOOL v9 = *(uint64_t (**)(void))(*(void *)(v8 + 24) + 88)) != 0) {
            uint64_t v6 = v9();
          }
          else {
            uint64_t v6 = 0;
          }
          unsigned int v10 = nw_frame_array_unclaimed_length();
          atomic_fetch_add((atomic_ullong *volatile)(v1 + 112), v10);
          memset(out, 0, 37);
          uuid_unparse((const unsigned __int8 *)v1, out);
          int v11 = *(_DWORD *)(v1 + 176);
          uint64_t v12 = ne_log_obj();
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
          if (v11 == 3)
          {
            if (!v13) {
              return v6;
            }
            uint64_t v14 = *(void *)(v1 + 80);
            if (v14) {
              LODWORD(v14) = nw_parameters_get_ip_protocol();
            }
            uint64_t v15 = *(void **)(v1 + 160);
            if (v15)
            {
              uint64_t v17 = v15[6];
              uint64_t v18 = v15[7];
              uint64_t v16 = v15[8];
              uint64_t v19 = v15[9];
            }
            else
            {
              uint64_t v16 = -1;
              uint64_t v17 = -1;
              uint64_t v18 = -1;
              uint64_t v19 = -1;
            }
            uint64_t v23 = *(void **)(v1 + 168);
            if (v23)
            {
              uint64_t v25 = v23[6];
              uint64_t v26 = v23[7];
              uint64_t v24 = v23[8];
              uint64_t v27 = v23[9];
            }
            else
            {
              uint64_t v24 = -1;
              uint64_t v25 = -1;
              uint64_t v26 = -1;
              uint64_t v27 = -1;
            }
            unint64_t v32 = atomic_load((unint64_t *)(v1 + 112));
            int v33 = 136318210;
            uint64_t v34 = out;
            __int16 v35 = 1024;
            int v36 = v14;
            __int16 v37 = 2048;
            uint64_t v38 = v17;
            __int16 v39 = 2048;
            *(void *)uint64_t v40 = v18;
            *(_WORD *)&v40[8] = 2048;
            *(void *)uint64_t v41 = v16;
            *(_WORD *)&v41[8] = 2048;
            uint64_t v42 = v19;
            __int16 v43 = 2048;
            uint64_t v44 = v25;
            __int16 v45 = 2048;
            uint64_t v46 = v26;
            __int16 v47 = 2048;
            uint64_t v48 = v24;
            __int16 v49 = 2048;
            uint64_t v50 = v27;
            __int16 v51 = 1024;
            unsigned int v52 = v10;
            __int16 v53 = 1024;
            int v54 = v6;
            __int16 v55 = 2048;
            unint64_t v56 = v32;
            int v29 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]OUTPUT: r"
                  "eturning %u bytes in %u framesu (total %llu)";
            __int16 v30 = v12;
            uint32_t v31 = 120;
          }
          else
          {
            if (!v13) {
              return v6;
            }
            uint64_t v20 = *(void *)(v1 + 80);
            if (v20) {
              LODWORD(v20) = nw_parameters_get_ip_protocol();
            }
            uint64_t v21 = *(unsigned int *)(v1 + 176);
            if (v21 > 3) {
              uint64_t v22 = "unknown";
            }
            else {
              uint64_t v22 = off_264195FA0[v21];
            }
            unint64_t v28 = atomic_load((unint64_t *)(v1 + 112));
            int v33 = 136316418;
            uint64_t v34 = out;
            __int16 v35 = 1024;
            int v36 = v20;
            __int16 v37 = 2080;
            uint64_t v38 = (uint64_t)v22;
            __int16 v39 = 1024;
            *(_DWORD *)uint64_t v40 = v10;
            *(_WORD *)&v40[4] = 1024;
            *(_DWORD *)&v40[6] = v6;
            *(_WORD *)uint64_t v41 = 2048;
            *(void *)&v41[2] = v28;
            int v29 = "[filter %s %d %s] OUTPUT: returning %u bytes in %u framesu (total %llu)";
            __int16 v30 = v12;
            uint32_t v31 = 50;
          }
          _os_log_debug_impl(&dword_212970000, v30, OS_LOG_TYPE_DEBUG, v29, (uint8_t *)&v33, v31);
          return v6;
        }
      }
      else
      {
        int v3 = ne_log_obj();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v33) = 0;
          _os_log_debug_impl(&dword_212970000, v3, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v33, 2u);
        }
      }
    }
  }
  return 0;
}

uint64_t ne_filter_protocol_get_input_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void out[5] = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "ne_filter_protocol_get_input_frames";
    uint64_t v15 = "%s called with null protocol";
LABEL_30:
    __int16 v37 = v14;
LABEL_31:
    _os_log_fault_impl(&dword_212970000, v37, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    return 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (!v7)
  {
    uint64_t v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "ne_filter_protocol_get_input_frames";
    uint64_t v15 = "%s called with null filter";
    goto LABEL_30;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v7 + 180), 0))
  {
    nw_frame_array_init();
    int v12 = *(_DWORD *)(v7 + 176);
    if (v12 != 2)
    {
      if (!v12)
      {
        BOOL v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_debug_impl(&dword_212970000, v13, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", buf, 2u);
        }
        return 0;
      }
      if ((*(unsigned char *)(v7 + 120) & 8) != 0)
      {
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v7, (char *)out);
        int v18 = *(_DWORD *)(v7 + 176);
        uint64_t v19 = ne_log_obj();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        if (v18 == 3)
        {
          if (v20)
          {
            uint64_t v21 = *(void *)(v7 + 80);
            if (v21) {
              LODWORD(v21) = nw_parameters_get_ip_protocol();
            }
            uint64_t v22 = *(void **)(v7 + 160);
            if (v22)
            {
              uint64_t v24 = v22[6];
              uint64_t v25 = v22[7];
              uint64_t v23 = v22[8];
              uint64_t v26 = v22[9];
            }
            else
            {
              uint64_t v23 = -1;
              uint64_t v24 = -1;
              uint64_t v25 = -1;
              uint64_t v26 = -1;
            }
            uint64_t v88 = *(void **)(v7 + 168);
            if (v88)
            {
              uint64_t v90 = v88[6];
              uint64_t v91 = v88[7];
              uint64_t v89 = v88[8];
              uint64_t v92 = v88[9];
            }
            else
            {
              uint64_t v89 = -1;
              uint64_t v90 = -1;
              uint64_t v91 = -1;
              uint64_t v92 = -1;
            }
            *(_DWORD *)long long buf = 136317442;
            *(void *)&uint8_t buf[4] = out;
            *(_WORD *)&uint8_t buf[12] = 1024;
            *(_DWORD *)&buf[14] = v21;
            __int16 v162 = 2048;
            uint64_t v163 = v24;
            __int16 v164 = 2048;
            *(void *)BOOL v165 = v25;
            *(_WORD *)&v165[8] = 2048;
            *(void *)uint64_t v166 = v23;
            *(_WORD *)&v166[8] = 2048;
            uint64_t v167 = v26;
            __int16 v168 = 2048;
            uint64_t v169 = v90;
            __int16 v170 = 2048;
            uint64_t v171 = v91;
            __int16 v172 = 2048;
            uint64_t v173 = v89;
            __int16 v174 = 2048;
            uint64_t v175 = v92;
            __int16 v95 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]start get input";
            uint64_t v96 = v19;
            uint32_t v97 = 98;
LABEL_116:
            _os_log_debug_impl(&dword_212970000, v96, OS_LOG_TYPE_DEBUG, v95, buf, v97);
          }
        }
        else if (v20)
        {
          uint64_t v85 = *(void *)(v7 + 80);
          if (v85) {
            LODWORD(v85) = nw_parameters_get_ip_protocol();
          }
          uint64_t v86 = *(unsigned int *)(v7 + 176);
          if (v86 > 3) {
            __int16 v87 = "unknown";
          }
          else {
            __int16 v87 = off_264195FA0[v86];
          }
          *(_DWORD *)long long buf = 136315650;
          *(void *)&uint8_t buf[4] = out;
          *(_WORD *)&uint8_t buf[12] = 1024;
          *(_DWORD *)&buf[14] = v85;
          __int16 v162 = 2080;
          uint64_t v163 = (uint64_t)v87;
          __int16 v95 = "[filter %s %d %s] start get input";
          uint64_t v96 = v19;
          uint32_t v97 = 28;
          goto LABEL_116;
        }
        if (nelog_is_debug_logging_enabled() && (nw_frame_array_is_empty() & 1) == 0)
        {
          unsigned int v27 = nw_frame_array_unclaimed_length();
          memset(out, 0, 37);
          uuid_unparse((const unsigned __int8 *)v7, (char *)out);
          int v28 = *(_DWORD *)(v7 + 176);
          int v29 = ne_log_obj();
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
          if (v28 == 3)
          {
            if (!v30) {
              goto LABEL_33;
            }
            uint64_t v31 = *(void *)(v7 + 80);
            if (v31) {
              LODWORD(v31) = nw_parameters_get_ip_protocol();
            }
            unint64_t v32 = *(void **)(v7 + 160);
            if (v32)
            {
              uint64_t v34 = v32[6];
              uint64_t v35 = v32[7];
              uint64_t v33 = v32[8];
              uint64_t v36 = v32[9];
            }
            else
            {
              uint64_t v33 = -1;
              uint64_t v34 = -1;
              uint64_t v35 = -1;
              uint64_t v36 = -1;
            }
            int v124 = *(void **)(v7 + 168);
            if (v124)
            {
              uint64_t v126 = v124[6];
              uint64_t v127 = v124[7];
              uint64_t v125 = v124[8];
              uint64_t v128 = v124[9];
            }
            else
            {
              uint64_t v125 = -1;
              uint64_t v126 = -1;
              uint64_t v127 = -1;
              uint64_t v128 = -1;
            }
            *(_DWORD *)long long buf = 136318210;
            *(void *)&uint8_t buf[4] = out;
            *(_WORD *)&uint8_t buf[12] = 1024;
            *(_DWORD *)&buf[14] = v31;
            __int16 v162 = 2048;
            uint64_t v163 = v34;
            __int16 v164 = 2048;
            *(void *)BOOL v165 = v35;
            *(_WORD *)&v165[8] = 2048;
            *(void *)uint64_t v166 = v33;
            *(_WORD *)&v166[8] = 2048;
            uint64_t v167 = v36;
            __int16 v168 = 2048;
            uint64_t v169 = v126;
            __int16 v170 = 2048;
            uint64_t v171 = v127;
            __int16 v172 = 2048;
            uint64_t v173 = v125;
            __int16 v174 = 2048;
            uint64_t v175 = v128;
            __int16 v176 = 1024;
            unsigned int v177 = v27;
            __int16 v178 = 1024;
            int v179 = a3;
            __int16 v180 = 1024;
            LODWORD(v181) = a4;
            int v129 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]already "
                   "has %u accepted, min %u max %u";
            uint64_t v130 = v29;
            uint32_t v131 = 116;
          }
          else
          {
            if (!v30) {
              goto LABEL_33;
            }
            uint64_t v118 = *(void *)(v7 + 80);
            if (v118) {
              LODWORD(v118) = nw_parameters_get_ip_protocol();
            }
            uint64_t v119 = *(unsigned int *)(v7 + 176);
            if (v119 > 3) {
              int v120 = "unknown";
            }
            else {
              int v120 = off_264195FA0[v119];
            }
            *(_DWORD *)long long buf = 136316418;
            *(void *)&uint8_t buf[4] = out;
            *(_WORD *)&uint8_t buf[12] = 1024;
            *(_DWORD *)&buf[14] = v118;
            __int16 v162 = 2080;
            uint64_t v163 = (uint64_t)v120;
            __int16 v164 = 1024;
            *(_DWORD *)BOOL v165 = v27;
            *(_WORD *)&v165[4] = 1024;
            *(_DWORD *)&v165[6] = a3;
            *(_WORD *)uint64_t v166 = 1024;
            *(_DWORD *)&v166[2] = a4;
            int v129 = "[filter %s %d %s] already has %u accepted, min %u max %u";
            uint64_t v130 = v29;
            uint32_t v131 = 46;
          }
          _os_log_debug_impl(&dword_212970000, v130, OS_LOG_TYPE_DEBUG, v129, buf, v131);
        }
LABEL_33:
        unsigned int v160 = 0;
        uint64_t v16 = ne_filter_protocol_fulfill_frame_request(v7, v7 + 128, a6, (*(_DWORD *)(v7 + 120) & 0x8000) == 0, a4, a5, &v160);
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v7, (char *)out);
        int v38 = *(_DWORD *)(v7 + 176);
        __int16 v39 = ne_log_obj();
        BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);
        if (v38 == 3)
        {
          if (!v40) {
            goto LABEL_38;
          }
          if (*(void *)(v7 + 80)) {
            int ip_protocol = nw_parameters_get_ip_protocol();
          }
          else {
            int ip_protocol = 0;
          }
          __int16 v93 = *(void **)(v7 + 160);
          if (v93)
          {
            uint64_t v155 = v93[7];
            uint64_t v156 = v93[6];
            uint64_t v100 = v93[8];
            uint64_t v94 = v93[9];
            uint64_t v157 = v100;
          }
          else
          {
            uint64_t v94 = -1;
            uint64_t v156 = -1;
            uint64_t v157 = -1;
            uint64_t v155 = -1;
          }
          uint64_t v154 = v94;
          __int16 v101 = *(void **)(v7 + 168);
          if (v101)
          {
            uint64_t v151 = v101[7];
            uint64_t v152 = v101[6];
            uint64_t v102 = v101[9];
            uint64_t v153 = v101[8];
          }
          else
          {
            uint64_t v152 = -1;
            uint64_t v153 = -1;
            uint64_t v151 = -1;
            uint64_t v102 = -1;
          }
          unsigned int v107 = nw_frame_array_unclaimed_length();
          *(_DWORD *)long long buf = 136317698;
          *(void *)&uint8_t buf[4] = out;
          *(_WORD *)&uint8_t buf[12] = 1024;
          *(_DWORD *)&buf[14] = ip_protocol;
          __int16 v162 = 2048;
          uint64_t v163 = v156;
          __int16 v164 = 2048;
          *(void *)BOOL v165 = v155;
          *(_WORD *)&v165[8] = 2048;
          *(void *)uint64_t v166 = v157;
          *(_WORD *)&v166[8] = 2048;
          uint64_t v167 = v154;
          __int16 v168 = 2048;
          uint64_t v169 = v152;
          __int16 v170 = 2048;
          uint64_t v171 = v151;
          __int16 v172 = 2048;
          uint64_t v173 = v153;
          __int16 v174 = 2048;
          uint64_t v175 = v102;
          __int16 v176 = 1024;
          unsigned int v177 = v107;
          uint64_t v104 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]return arr"
                 "ay has %u bytes from acceptedInputFrames";
          uint32_t v105 = v39;
          uint32_t v106 = 104;
        }
        else
        {
          if (!v40) {
            goto LABEL_38;
          }
          if (*(void *)(v7 + 80)) {
            int v159 = nw_parameters_get_ip_protocol();
          }
          else {
            int v159 = 0;
          }
          uint64_t v98 = *(unsigned int *)(v7 + 176);
          if (v98 > 3) {
            __int16 v99 = "unknown";
          }
          else {
            __int16 v99 = off_264195FA0[v98];
          }
          int v103 = nw_frame_array_unclaimed_length();
          *(_DWORD *)long long buf = 136315906;
          *(void *)&uint8_t buf[4] = out;
          *(_WORD *)&uint8_t buf[12] = 1024;
          *(_DWORD *)&buf[14] = v159;
          __int16 v162 = 2080;
          uint64_t v163 = (uint64_t)v99;
          __int16 v164 = 1024;
          *(_DWORD *)BOOL v165 = v103;
          uint64_t v104 = "[filter %s %d %s] return array has %u bytes from acceptedInputFrames";
          uint32_t v105 = v39;
          uint32_t v106 = 34;
        }
        _os_log_debug_impl(&dword_212970000, v105, OS_LOG_TYPE_DEBUG, v104, buf, v106);
LABEL_38:
        if (v160)
        {
          BOOL v41 = a4 >= v160;
          a4 = a4 - v160;
          if (a4 == 0 || !v41) {
            goto LABEL_83;
          }
          if (a3 >= v160) {
            uint64_t v42 = a3 - v160;
          }
          else {
            uint64_t v42 = 0;
          }
        }
        else
        {
          uint64_t v42 = a3;
        }
        if (v16)
        {
          BOOL v41 = a5 >= v16;
          a5 = (a5 - v16);
          if (a5 == 0 || !v41)
          {
LABEL_83:
            if ((*(unsigned char *)(v7 + 121) & 8) != 0 && nw_frame_array_is_empty())
            {
              atomic_fetch_add((atomic_uint *volatile)(v7 + 180), 1u);
              nw_queue_context_async();
            }
            unsigned int v72 = nw_frame_array_unclaimed_length();
            atomic_fetch_add((atomic_ullong *volatile)(v7 + 104), v72);
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)v7, (char *)out);
            int v73 = *(_DWORD *)(v7 + 176);
            int v74 = ne_log_obj();
            BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG);
            if (v73 == 3)
            {
              if (!v75) {
                return v16;
              }
              uint64_t v76 = *(void *)(v7 + 80);
              if (v76) {
                LODWORD(v76) = nw_parameters_get_ip_protocol();
              }
              __int16 v77 = *(void **)(v7 + 160);
              if (v77)
              {
                uint64_t v79 = v77[6];
                uint64_t v80 = v77[7];
                uint64_t v78 = v77[8];
                uint64_t v81 = v77[9];
              }
              else
              {
                uint64_t v78 = -1;
                uint64_t v79 = -1;
                uint64_t v80 = -1;
                uint64_t v81 = -1;
              }
              int v108 = *(void **)(v7 + 168);
              if (v108)
              {
                uint64_t v110 = v108[6];
                uint64_t v111 = v108[7];
                uint64_t v109 = v108[8];
                uint64_t v112 = v108[9];
              }
              else
              {
                uint64_t v109 = -1;
                uint64_t v110 = -1;
                uint64_t v111 = -1;
                uint64_t v112 = -1;
              }
              unint64_t v117 = atomic_load((unint64_t *)(v7 + 104));
              *(_DWORD *)long long buf = 136318210;
              *(void *)&uint8_t buf[4] = out;
              *(_WORD *)&uint8_t buf[12] = 1024;
              *(_DWORD *)&buf[14] = v76;
              __int16 v162 = 2048;
              uint64_t v163 = v79;
              __int16 v164 = 2048;
              *(void *)BOOL v165 = v80;
              *(_WORD *)&v165[8] = 2048;
              *(void *)uint64_t v166 = v78;
              *(_WORD *)&v166[8] = 2048;
              uint64_t v167 = v81;
              __int16 v168 = 2048;
              uint64_t v169 = v110;
              __int16 v170 = 2048;
              uint64_t v171 = v111;
              __int16 v172 = 2048;
              uint64_t v173 = v109;
              __int16 v174 = 2048;
              uint64_t v175 = v112;
              __int16 v176 = 1024;
              unsigned int v177 = v72;
              __int16 v178 = 1024;
              int v179 = v16;
              __int16 v180 = 2048;
              unint64_t v181 = v117;
              uint64_t v114 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]INPUT:"
                     " returning %u bytes in %u framesu (total %llu)";
              uint64_t v115 = v74;
              uint32_t v116 = 120;
            }
            else
            {
              if (!v75) {
                return v16;
              }
              uint64_t v82 = *(void *)(v7 + 80);
              if (v82) {
                LODWORD(v82) = nw_parameters_get_ip_protocol();
              }
              uint64_t v83 = *(unsigned int *)(v7 + 176);
              if (v83 > 3) {
                uint64_t v84 = "unknown";
              }
              else {
                uint64_t v84 = off_264195FA0[v83];
              }
              unint64_t v113 = atomic_load((unint64_t *)(v7 + 104));
              *(_DWORD *)long long buf = 136316418;
              *(void *)&uint8_t buf[4] = out;
              *(_WORD *)&uint8_t buf[12] = 1024;
              *(_DWORD *)&buf[14] = v82;
              __int16 v162 = 2080;
              uint64_t v163 = (uint64_t)v84;
              __int16 v164 = 1024;
              *(_DWORD *)BOOL v165 = v72;
              *(_WORD *)&v165[4] = 1024;
              *(_DWORD *)&v165[6] = v16;
              *(_WORD *)uint64_t v166 = 2048;
              *(void *)&v166[2] = v113;
              uint64_t v114 = "[filter %s %d %s] INPUT: returning %u bytes in %u framesu (total %llu)";
              uint64_t v115 = v74;
              uint32_t v116 = 50;
            }
            _os_log_debug_impl(&dword_212970000, v115, OS_LOG_TYPE_DEBUG, v114, buf, v116);
            return v16;
          }
        }
        int v43 = *(_DWORD *)(v7 + 176);
        if (v43 != 1)
        {
          if (v43 == 3)
          {
LABEL_59:
            *(void *)long long buf = 0;
            *(void *)&buf[8] = 0;
            nw_frame_array_init();
            ne_filter_read_from_network(*(void *)(a1 + 40), (uint64_t)buf, 0);
            ne_filter_read_approved_frames(v7, (uint64_t)buf);
            LODWORD(out[0]) = 0;
            int v52 = ne_filter_protocol_fulfill_frame_request(v7, v7 + 128, a6, (*(_DWORD *)(v7 + 120) & 0x8000) == 0, a4, a5, out);
            v160 += LODWORD(out[0]);
            uint64_t v16 = (v52 + v16);
            goto LABEL_71;
          }
          int v44 = *(_DWORD *)(v7 + 120);
LABEL_55:
          if ((v44 & 0x1000) == 0)
          {
            __int16 v49 = ne_log_obj();
            if (!os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
              return 0;
            }
            uint64_t v50 = *(unsigned int *)(v7 + 176);
            if (v50 > 3) {
              __int16 v51 = "unknown";
            }
            else {
              __int16 v51 = off_264195FA0[v50];
            }
            *(_DWORD *)long long buf = 136315138;
            *(void *)&uint8_t buf[4] = v51;
            uint64_t v15 = "reached end of get_input_frames with disallowed verdict type %s";
            __int16 v37 = v49;
            goto LABEL_31;
          }
          goto LABEL_59;
        }
        int v44 = *(_DWORD *)(v7 + 120);
        if ((v44 & 0x1000) != 0) {
          goto LABEL_55;
        }
        uint64_t v45 = *(void *)(v7 + 32);
        out[0] = 0;
        out[1] = out;
        out[2] = 0x2800000000;
        out[3] = 0;
        out[4] = 0;
        nw_frame_array_init();
        int v46 = *(_DWORD *)(v7 + 120) | 0x4000;
        *(_DWORD *)(v7 + 120) = v46;
        if (v45
          && (__int16 v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 + 24) + 80)) != 0)
        {
          int v48 = v47(v45, a1, v42, a4, a5, out[1] + 24);
          int v46 = *(_DWORD *)(v7 + 120);
        }
        else
        {
          int v48 = 0;
        }
        *(_DWORD *)(v7 + 120) = v46 & 0xFFFFBFFF;
        unsigned int v53 = nw_frame_array_unclaimed_length();
        memset(v182, 0, 37);
        uuid_unparse((const unsigned __int8 *)v7, v182);
        int v54 = *(_DWORD *)(v7 + 176);
        __int16 v55 = ne_log_obj();
        BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
        if (v54 == 3)
        {
          if (v56)
          {
            uint64_t v57 = *(void *)(v7 + 80);
            if (v57) {
              LODWORD(v57) = nw_parameters_get_ip_protocol();
            }
            uint64_t v58 = *(void **)(v7 + 160);
            if (v58)
            {
              uint64_t v60 = v58[6];
              uint64_t v61 = v58[7];
              uint64_t v59 = v58[8];
              uint64_t v62 = v58[9];
            }
            else
            {
              uint64_t v59 = -1;
              uint64_t v60 = -1;
              uint64_t v61 = -1;
              uint64_t v62 = -1;
            }
            __int16 v143 = *(void **)(v7 + 168);
            if (v143)
            {
              uint64_t v145 = v143[6];
              uint64_t v146 = v143[7];
              uint64_t v144 = v143[8];
              uint64_t v147 = v143[9];
            }
            else
            {
              uint64_t v144 = -1;
              uint64_t v145 = -1;
              uint64_t v146 = -1;
              uint64_t v147 = -1;
            }
            *(_DWORD *)long long buf = 136317954;
            *(void *)&uint8_t buf[4] = v182;
            *(_WORD *)&uint8_t buf[12] = 1024;
            *(_DWORD *)&buf[14] = v57;
            __int16 v162 = 2048;
            uint64_t v163 = v60;
            __int16 v164 = 2048;
            *(void *)BOOL v165 = v61;
            *(_WORD *)&v165[8] = 2048;
            *(void *)uint64_t v166 = v59;
            *(_WORD *)&v166[8] = 2048;
            uint64_t v167 = v62;
            __int16 v168 = 2048;
            uint64_t v169 = v145;
            __int16 v170 = 2048;
            uint64_t v171 = v146;
            __int16 v172 = 2048;
            uint64_t v173 = v144;
            __int16 v174 = 2048;
            uint64_t v175 = v147;
            __int16 v176 = 1024;
            unsigned int v177 = v53;
            __int16 v178 = 1024;
            int v179 = v48;
            __int16 v148 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]passing "
                   "through %u input bytes in %u frames";
            uint64_t v149 = v55;
            uint32_t v150 = 110;
            goto LABEL_170;
          }
        }
        else if (v56)
        {
          uint64_t v132 = *(void *)(v7 + 80);
          if (v132) {
            LODWORD(v132) = nw_parameters_get_ip_protocol();
          }
          uint64_t v133 = *(unsigned int *)(v7 + 176);
          if (v133 > 3) {
            uint64_t v134 = "unknown";
          }
          else {
            uint64_t v134 = off_264195FA0[v133];
          }
          *(_DWORD *)long long buf = 136316162;
          *(void *)&uint8_t buf[4] = v182;
          *(_WORD *)&uint8_t buf[12] = 1024;
          *(_DWORD *)&buf[14] = v132;
          __int16 v162 = 2080;
          uint64_t v163 = (uint64_t)v134;
          __int16 v164 = 1024;
          *(_DWORD *)BOOL v165 = v53;
          *(_WORD *)&v165[4] = 1024;
          *(_DWORD *)&v165[6] = v48;
          __int16 v148 = "[filter %s %d %s] passing through %u input bytes in %u frames";
          uint64_t v149 = v55;
          uint32_t v150 = 40;
LABEL_170:
          _os_log_debug_impl(&dword_212970000, v149, OS_LOG_TYPE_DEBUG, v148, buf, v150);
          if (!v48) {
            goto LABEL_70;
          }
          goto LABEL_69;
        }
        if (!v48)
        {
LABEL_70:
          _Block_object_dispose(out, 8);
LABEL_71:
          if ((nw_frame_array_is_empty() & 1) == 0)
          {
            nw_frame_array_last();
            if (nw_frame_is_metadata_complete() & 1) != 0 || (nw_frame_is_connection_complete()) {
              goto LABEL_83;
            }
          }
          if (v160 >= a3) {
            goto LABEL_83;
          }
          memset(out, 0, 37);
          uuid_unparse((const unsigned __int8 *)v7, (char *)out);
          int v63 = *(_DWORD *)(v7 + 176);
          uint64_t v64 = ne_log_obj();
          BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
          if (v63 == 3)
          {
            if (v65)
            {
              uint64_t v66 = *(void *)(v7 + 80);
              if (v66) {
                LODWORD(v66) = nw_parameters_get_ip_protocol();
              }
              uint32_t v67 = *(void **)(v7 + 160);
              if (v67)
              {
                uint64_t v69 = v67[6];
                uint64_t v70 = v67[7];
                uint64_t v68 = v67[8];
                uint64_t v71 = v67[9];
              }
              else
              {
                uint64_t v68 = -1;
                uint64_t v69 = -1;
                uint64_t v70 = -1;
                uint64_t v71 = -1;
              }
              uint64_t v135 = *(void **)(v7 + 168);
              if (v135)
              {
                uint64_t v137 = v135[6];
                uint64_t v138 = v135[7];
                uint64_t v136 = v135[8];
                uint64_t v139 = v135[9];
              }
              else
              {
                uint64_t v136 = -1;
                uint64_t v137 = -1;
                uint64_t v138 = -1;
                uint64_t v139 = -1;
              }
              *(_DWORD *)long long buf = 136317954;
              *(void *)&uint8_t buf[4] = out;
              *(_WORD *)&uint8_t buf[12] = 1024;
              *(_DWORD *)&buf[14] = v66;
              __int16 v162 = 2048;
              uint64_t v163 = v69;
              __int16 v164 = 2048;
              *(void *)BOOL v165 = v70;
              *(_WORD *)&v165[8] = 2048;
              *(void *)uint64_t v166 = v68;
              *(_WORD *)&v166[8] = 2048;
              uint64_t v167 = v71;
              __int16 v168 = 2048;
              uint64_t v169 = v137;
              __int16 v170 = 2048;
              uint64_t v171 = v138;
              __int16 v172 = 2048;
              uint64_t v173 = v136;
              __int16 v174 = 2048;
              uint64_t v175 = v139;
              __int16 v176 = 1024;
              unsigned int v177 = v160;
              __int16 v178 = 1024;
              int v179 = a3;
              uint64_t v140 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]pass t"
                     "hrough failed to fulfill minimum bytes requested (%u < %u), moving all to acceptedInputFrames";
              uint64_t v141 = v64;
              uint32_t v142 = 110;
LABEL_162:
              _os_log_debug_impl(&dword_212970000, v141, OS_LOG_TYPE_DEBUG, v140, buf, v142);
            }
          }
          else if (v65)
          {
            uint64_t v121 = *(void *)(v7 + 80);
            if (v121) {
              LODWORD(v121) = nw_parameters_get_ip_protocol();
            }
            uint64_t v122 = *(unsigned int *)(v7 + 176);
            if (v122 > 3) {
              uint64_t v123 = "unknown";
            }
            else {
              uint64_t v123 = off_264195FA0[v122];
            }
            *(_DWORD *)long long buf = 136316162;
            *(void *)&uint8_t buf[4] = out;
            *(_WORD *)&uint8_t buf[12] = 1024;
            *(_DWORD *)&buf[14] = v121;
            __int16 v162 = 2080;
            uint64_t v163 = (uint64_t)v123;
            __int16 v164 = 1024;
            *(_DWORD *)BOOL v165 = v160;
            *(_WORD *)&v165[4] = 1024;
            *(_DWORD *)&v165[6] = a3;
            uint64_t v140 = "[filter %s %d %s] pass through failed to fulfill minimum bytes requested (%u < %u), moving all to acc"
                   "eptedInputFrames";
            uint64_t v141 = v64;
            uint32_t v142 = 40;
            goto LABEL_162;
          }
          nw_frame_array_foreach();
          uint64_t v16 = 0;
          unsigned int v160 = 0;
          goto LABEL_83;
        }
LABEL_69:
        uint64_t v16 = (v48 + v16);
        v160 += v53;
        nw_frame_array_foreach();
        goto LABEL_70;
      }
    }
  }
  return 0;
}

uint64_t __ne_filter_protocol_get_input_frames_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }
  return 1;
}

uint64_t __ne_filter_protocol_get_input_frames_block_invoke_44(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }
  return 1;
}

void __ne_filter_protocol_get_input_frames_block_invoke_2(uint64_t a1)
{
  ne_filter_handle_input_finished(*(void *)(a1 + 32), 0);
  ne_filter_cleanup(*(void *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v10 = 0;
    uint64_t v7 = "protocol is null";
    uint64_t v8 = (uint8_t *)&v10;
LABEL_12:
    _os_log_impl(&dword_212970000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
    return;
  }
  uint64_t v3 = *(void *)(v2 + 40);
  if (!v3)
  {
    uint64_t v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v9 = 0;
    uint64_t v7 = "filter is null";
    uint64_t v8 = (uint8_t *)&v9;
    goto LABEL_12;
  }
  uint64_t v4 = (atomic_uint *)(v3 + 180);
  if (atomic_fetch_or(v4, 0) && atomic_fetch_add(v4, 0xFFFFFFFF) == 1)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    ne_filter_protocol_destroy(v5);
  }
}

BOOL ne_filter_protocol_remove_input_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v5 = ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    int v8 = 136315138;
    __int16 v9 = "ne_filter_protocol_remove_input_handler";
    uint64_t v6 = "%s called with null protocol";
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v5 = ne_log_obj();
    BOOL result = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    int v8 = 136315138;
    __int16 v9 = "ne_filter_protocol_remove_input_handler";
    uint64_t v6 = "%s called with null filter";
LABEL_10:
    _os_log_fault_impl(&dword_212970000, v5, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v8, 0xCu);
    return 0;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 180), 0)) {
    return 0;
  }
  *(void *)(a2 + 32) = 0;
  if (*(void *)(a1 + 48) != a2) {
    return 0;
  }
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(v3 + 120) |= 1u;
  ne_filter_stats_toggle(a1, 0, 0);
  ne_filter_destroy_frames(*(void *)(a1 + 40));
  int v7 = *(_DWORD *)(v3 + 120);
  if ((v7 & 0x40) == 0)
  {
    *(_DWORD *)(v3 + 120) = v7 | 0x40;
    ne_filter_handle_input_finished(a1, 0);
  }
  ne_filter_cleanup(a1);
  return 1;
}

BOOL ne_filter_protocol_add_input_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v14 = ne_log_obj();
    BOOL result = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "ne_filter_protocol_add_input_handler";
    uint64_t v16 = "%s called with null protocol";
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v3)
  {
    uint64_t v14 = ne_log_obj();
    BOOL result = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "ne_filter_protocol_add_input_handler";
    uint64_t v16 = "%s called with null filter";
LABEL_16:
    _os_log_fault_impl(&dword_212970000, v14, OS_LOG_TYPE_FAULT, v16, buf, 0xCu);
    return 0;
  }
  if (!atomic_fetch_or((atomic_uint *volatile)(v3 + 180), 0)) {
    return 0;
  }
  *(void *)(a1 + 48) = a2;
  uuid_copy((unsigned __int8 *)v3, (const unsigned __int8 *)a2);
  *(void *)(a2 + 32) = v3;
  if ((*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 112))(a2)
    && nw_parameters_get_data_mode() == 1)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, out);
    int v5 = *(_DWORD *)(v3 + 176);
    uint64_t v6 = ne_log_obj();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5 == 3)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(v3 + 80);
        if (v8) {
          LODWORD(v8) = nw_parameters_get_ip_protocol();
        }
        __int16 v9 = *(void **)(v3 + 160);
        if (v9)
        {
          uint64_t v11 = v9[6];
          uint64_t v12 = v9[7];
          uint64_t v10 = v9[8];
          uint64_t v13 = v9[9];
        }
        else
        {
          uint64_t v10 = -1;
          uint64_t v11 = -1;
          uint64_t v12 = -1;
          uint64_t v13 = -1;
        }
        int v44 = *(void **)(v3 + 168);
        if (v44)
        {
          uint64_t v46 = v44[6];
          uint64_t v47 = v44[7];
          uint64_t v45 = v44[8];
          uint64_t v48 = v44[9];
        }
        else
        {
          uint64_t v45 = -1;
          uint64_t v46 = -1;
          uint64_t v47 = -1;
          uint64_t v48 = -1;
        }
        *(_DWORD *)long long buf = 136317442;
        *(void *)&uint8_t buf[4] = out;
        *(_WORD *)&uint8_t buf[12] = 1024;
        *(_DWORD *)&buf[14] = v8;
        *(_WORD *)&unsigned char buf[18] = 2048;
        *(void *)&buf[20] = v11;
        __int16 v55 = 2048;
        uint64_t v56 = v12;
        __int16 v57 = 2048;
        uint64_t v58 = v10;
        __int16 v59 = 2048;
        uint64_t v60 = v13;
        __int16 v61 = 2048;
        uint64_t v62 = v46;
        __int16 v63 = 2048;
        uint64_t v64 = v47;
        __int16 v65 = 2048;
        uint64_t v66 = v45;
        __int16 v67 = 2048;
        uint64_t v68 = v48;
        __int16 v49 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]detected data"
              "gram connection, frame fragmentation disabled";
        uint64_t v50 = v6;
        uint32_t v51 = 98;
LABEL_67:
        _os_log_debug_impl(&dword_212970000, v50, OS_LOG_TYPE_DEBUG, v49, buf, v51);
      }
    }
    else if (v7)
    {
      uint64_t v41 = *(void *)(v3 + 80);
      if (v41) {
        LODWORD(v41) = nw_parameters_get_ip_protocol();
      }
      uint64_t v42 = *(unsigned int *)(v3 + 176);
      if (v42 > 3) {
        int v43 = "unknown";
      }
      else {
        int v43 = off_264195FA0[v42];
      }
      *(_DWORD *)long long buf = 136315650;
      *(void *)&uint8_t buf[4] = out;
      *(_WORD *)&uint8_t buf[12] = 1024;
      *(_DWORD *)&buf[14] = v41;
      *(_WORD *)&unsigned char buf[18] = 2080;
      *(void *)&buf[20] = v43;
      __int16 v49 = "[filter %s %d %s] detected datagram connection, frame fragmentation disabled";
      uint64_t v50 = v6;
      uint32_t v51 = 28;
      goto LABEL_67;
    }
    *(_DWORD *)(v3 + 120) |= 0x8000u;
  }
  uint64_t v17 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 128))(a2);
  *(void *)(v3 + 64) = nw_retain(v17);
  int v18 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 136))(a2);
  *(void *)(v3 + 72) = nw_retain(v18);
  uint64_t v19 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 112))(a2);
  *(void *)(v3 + 80) = nw_retain(v19);
  *(void *)(v3 + 88) = nw_parameters_copy_context();
  if (ne_filter_get_definition_onceToken != -1) {
    dispatch_once(&ne_filter_get_definition_onceToken, &__block_literal_global_435);
  }
  uint64_t globals_for_protocol = nw_context_get_globals_for_protocol();
  *(void *)(v3 + 96) = globals_for_protocol;
  if (globals_for_protocol)
  {
    (*(void (**)(uint64_t))(*(void *)(a2 + 24) + 120))(a2);
    int filter_unit = nw_path_get_filter_unit();
    if (!filter_unit)
    {
      *(_DWORD *)(v3 + 176) = 1;
LABEL_35:
      ne_filter_register_flow(*(void *)(v3 + 96), a1);
      BOOL result = 1;
      if (*(void *)(v3 + 144))
      {
        *(void *)long long buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x2000000000;
        buf[24] = 1;
        uint64_t v31 = dispatch_group_create();
        for (uint64_t i = *(void *)(v3 + 144); i; uint64_t i = *(void *)(i + 152))
        {
          uint64_t v33 = (void *)ne_filter_copy_connection(*(os_unfair_lock_s **)(v3 + 96), *(_DWORD *)(i + 4));
          if (v33)
          {
            xpc_release(v33);
          }
          else
          {
            *(_DWORD *)(v3 + 120) |= 2u;
            dispatch_group_enter(v31);
            uint64_t v34 = *(os_unfair_lock_s **)(v3 + 96);
            int v36 = *(_DWORD *)i;
            unsigned int v35 = *(_DWORD *)(i + 4);
            v53[0] = MEMORY[0x263EF8330];
            v53[1] = 0x40000000;
            v53[2] = __ne_filter_protocol_add_input_handler_block_invoke;
            v53[3] = &unk_264195D00;
            v53[4] = buf;
            v53[5] = v31;
            ne_filter_request_connection(v34, v35, v36, v53);
          }
        }
        if ((*(unsigned char *)(v3 + 120) & 2) != 0)
        {
          atomic_fetch_add((atomic_uint *volatile)(v3 + 180), 1u);
          __int16 v39 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          BOOL v40 = dispatch_queue_create("Filter establish connections queue", v39);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 0x40000000;
          block[2] = __ne_filter_protocol_add_input_handler_block_invoke_2;
          block[3] = &unk_264195D50;
          void block[4] = buf;
          void block[5] = v3;
          void block[6] = a1;
          void block[7] = v40;
          void block[8] = v31;
          dispatch_group_notify(v31, v40, block);
        }
        else
        {
          dispatch_release(v31);
        }
        _Block_object_dispose(buf, 8);
        return 1;
      }
      return result;
    }
    int v22 = filter_unit;
    int v23 = 0;
    while (1)
    {
      if (((1 << v23) & v22) != 0)
      {
        uint64_t v24 = (char *)malloc_type_malloc(0xA8uLL, 0x10A00400F97642BuLL);
        if (!v24)
        {
          __int16 v37 = ne_log_obj();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v23 + 1;
            _os_log_error_impl(&dword_212970000, v37, OS_LOG_TYPE_ERROR, "Failed to allocate a ne_filter_client_t for unit %u", buf, 8u);
          }
          *(_DWORD *)(v3 + 176) = 2;
          uint64_t v29 = *(void *)(a1 + 40);
          if (v29) {
            goto LABEL_46;
          }
          BOOL v30 = ne_log_obj();
          BOOL result = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
          if (result)
          {
            *(_WORD *)long long buf = 0;
LABEL_53:
            _os_log_impl(&dword_212970000, v30, OS_LOG_TYPE_INFO, "filter is null", buf, 2u);
            return 0;
          }
          return result;
        }
        uint64_t v25 = v24;
        *(_OWORD *)(v24 + 136) = 0u;
        *(_OWORD *)(v24 + 120) = 0u;
        *(_OWORD *)(v24 + 104) = 0u;
        *(_OWORD *)(v24 + 88) = 0u;
        *(_OWORD *)(v24 + 72) = 0u;
        *(_OWORD *)(v24 + 56) = 0u;
        *(_OWORD *)(v24 + 152) = 0u;
        uint64_t v26 = v24 + 152;
        *(_OWORD *)(v24 + 24) = 0u;
        *(_OWORD *)(v24 + 40) = 0u;
        *(_OWORD *)(v24 + 8) = 0u;
        *(_DWORD *)uint64_t v24 = 1 << v23;
        *((_DWORD *)v24 + 1) = v23;
        nw_frame_array_init();
        nw_frame_array_init();
        *uint64_t v26 = 0;
        unsigned int v27 = *(void **)(v3 + 152);
        *((void *)v25 + 20) = v27;
        *unsigned int v27 = v25;
        *(void *)(v3 + 152) = v26;
      }
      if (++v23 == 8) {
        goto LABEL_35;
      }
    }
  }
  int v28 = ne_log_obj();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_212970000, v28, OS_LOG_TYPE_ERROR, "Failed to get the ne_filter globals", buf, 2u);
  }
  uint64_t v29 = *(void *)(a1 + 40);
  if (v29)
  {
LABEL_46:
    int v38 = (atomic_uint *)(v29 + 180);
    if (atomic_fetch_or(v38, 0) && atomic_fetch_add(v38, 0xFFFFFFFF) == 1) {
      ne_filter_protocol_destroy(a1);
    }
    return 0;
  }
  BOOL v30 = ne_log_obj();
  BOOL result = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
  if (result)
  {
    *(_WORD *)long long buf = 0;
    goto LABEL_53;
  }
  return result;
}

void __ne_filter_protocol_add_input_handler_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __ne_filter_protocol_add_input_handler_block_invoke_2(uint64_t a1)
{
}

void __ne_filter_protocol_add_input_handler_block_invoke_3(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  memset(out, 0, 37);
  uuid_unparse(*(const unsigned __int8 **)(a1 + 40), out);
  int v2 = *(_DWORD *)(*(void *)(a1 + 40) + 176);
  uint64_t v3 = ne_log_obj();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2 == 3)
  {
    if (!v4) {
      goto LABEL_8;
    }
    int v5 = *(void **)(a1 + 40);
    uint64_t v6 = v5[10];
    if (v6)
    {
      LODWORD(v6) = nw_parameters_get_ip_protocol();
      int v5 = *(void **)(a1 + 40);
    }
    BOOL v7 = (void *)v5[20];
    if (v7)
    {
      uint64_t v9 = v7[6];
      uint64_t v10 = v7[7];
      uint64_t v8 = v7[8];
      uint64_t v11 = v7[9];
    }
    else
    {
      uint64_t v8 = -1;
      uint64_t v9 = -1;
      uint64_t v10 = -1;
      uint64_t v11 = -1;
    }
    uint64_t v24 = (void *)v5[21];
    if (v24)
    {
      uint64_t v26 = v24[6];
      uint64_t v27 = v24[7];
      uint64_t v25 = v24[8];
      uint64_t v28 = v24[9];
    }
    else
    {
      uint64_t v25 = -1;
      uint64_t v26 = -1;
      uint64_t v27 = -1;
      uint64_t v28 = -1;
    }
    int v33 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v34 = 136317698;
    unsigned int v35 = out;
    __int16 v36 = 1024;
    int v37 = v6;
    __int16 v38 = 2048;
    uint64_t v39 = v9;
    __int16 v40 = 2048;
    uint64_t v41 = v10;
    __int16 v42 = 2048;
    uint64_t v43 = v8;
    __int16 v44 = 2048;
    uint64_t v45 = v11;
    __int16 v46 = 2048;
    uint64_t v47 = v26;
    __int16 v48 = 2048;
    uint64_t v49 = v27;
    __int16 v50 = 2048;
    uint64_t v51 = v25;
    __int16 v52 = 2048;
    uint64_t v53 = v28;
    __int16 v54 = 1024;
    int v55 = v33;
    BOOL v30 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]all provider conn"
          "ection requests complete with success: %d";
    uint64_t v31 = v3;
    uint32_t v32 = 104;
  }
  else
  {
    if (!v4) {
      goto LABEL_8;
    }
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = *(void *)(v20 + 80);
    if (v21)
    {
      LODWORD(v21) = nw_parameters_get_ip_protocol();
      uint64_t v20 = *(void *)(a1 + 40);
    }
    uint64_t v22 = *(unsigned int *)(v20 + 176);
    if (v22 > 3) {
      int v23 = "unknown";
    }
    else {
      int v23 = off_264195FA0[v22];
    }
    int v29 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    int v34 = 136315906;
    unsigned int v35 = out;
    __int16 v36 = 1024;
    int v37 = v21;
    __int16 v38 = 2080;
    uint64_t v39 = (uint64_t)v23;
    __int16 v40 = 1024;
    LODWORD(v41) = v29;
    BOOL v30 = "[filter %s %d %s] all provider connection requests complete with success: %d";
    uint64_t v31 = v3;
    uint32_t v32 = 34;
  }
  _os_log_debug_impl(&dword_212970000, v31, OS_LOG_TYPE_DEBUG, v30, (uint8_t *)&v34, v32);
LABEL_8:
  uint64_t v12 = *(void *)(a1 + 40);
  int v13 = *(_DWORD *)(v12 + 120);
  if ((v13 & 1) == 0)
  {
    *(_DWORD *)(v12 + 120) = v13 & 0xFFFFFFFD;
    uint64_t v14 = *(void *)(a1 + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      if ((*(unsigned char *)(v14 + 120) & 4) != 0) {
        ne_filter_protocol_connect(v14);
      }
    }
    else
    {
      ne_filter_protocol_drop_flow((void *)v14);
    }
  }
  uint64_t v15 = *(void *)(a1 + 48);
  if (!v15)
  {
    int v18 = ne_log_obj();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v34) = 0;
    uint64_t v19 = "protocol is null";
LABEL_22:
    _os_log_impl(&dword_212970000, v18, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v34, 2u);
    return;
  }
  uint64_t v16 = *(void *)(v15 + 40);
  if (!v16)
  {
    int v18 = ne_log_obj();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
      return;
    }
    LOWORD(v34) = 0;
    uint64_t v19 = "filter is null";
    goto LABEL_22;
  }
  uint64_t v17 = (atomic_uint *)(v16 + 180);
  if (atomic_fetch_or(v17, 0))
  {
    if (atomic_fetch_add(v17, 0xFFFFFFFF) == 1) {
      ne_filter_protocol_destroy(*(void *)(a1 + 48));
    }
  }
}

long long *ne_filter_protocol_identifier()
{
  if (ne_filter_protocol_identifier_onceToken != -1) {
    dispatch_once(&ne_filter_protocol_identifier_onceToken, &__block_literal_global_3);
  }
  if (ne_filter_protocol_identifier_g_hasNESMAccess) {
    return &g_filter_protocol_identifier;
  }
  else {
    return 0;
  }
}

void ne_filter_protocol_retain(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v5 = 136315138;
    uint64_t v6 = "ne_filter_protocol_retain";
    BOOL v4 = "%s called with null protocol";
    goto LABEL_10;
  }
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    uint64_t v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      return;
    }
    int v5 = 136315138;
    uint64_t v6 = "ne_filter_protocol_retain";
    BOOL v4 = "%s called with null filter";
LABEL_10:
    _os_log_fault_impl(&dword_212970000, v3, OS_LOG_TYPE_FAULT, v4, (uint8_t *)&v5, 0xCu);
    return;
  }
  int v2 = (atomic_uint *)(v1 + 180);
  if (atomic_fetch_or(v2, 0)) {
    atomic_fetch_add(v2, 1u);
  }
}

void ne_filter_protocol_release(uint64_t a1)
{
  if (!a1)
  {
    uint64_t v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v7 = 0;
    BOOL v4 = "protocol is null";
    int v5 = (uint8_t *)&v7;
LABEL_12:
    _os_log_impl(&dword_212970000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
    return;
  }
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1)
  {
    uint64_t v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v6 = 0;
    BOOL v4 = "filter is null";
    int v5 = (uint8_t *)&v6;
    goto LABEL_12;
  }
  int v2 = (atomic_uint *)(v1 + 180);
  if (atomic_fetch_or(v2, 0) && atomic_fetch_add(v2, 0xFFFFFFFF) == 1)
  {
    ne_filter_protocol_destroy(a1);
  }
}

void ne_filter_protocol_handle_message(uint64_t a1, xpc_object_t object)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    uint64_t v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)long long buf = 136315138;
    __int16 v6 = "ne_filter_protocol_handle_message";
    BOOL v4 = "%s called with null protocol";
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (!v2)
  {
    uint64_t v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)long long buf = 136315138;
    __int16 v6 = "ne_filter_protocol_handle_message";
    BOOL v4 = "%s called with null filter";
LABEL_10:
    _os_log_fault_impl(&dword_212970000, v3, OS_LOG_TYPE_FAULT, v4, buf, 0xCu);
    return;
  }
  if (atomic_fetch_or((atomic_uint *volatile)(v2 + 180), 0))
  {
    atomic_fetch_add((atomic_uint *volatile)(v2 + 180), 1u);
    xpc_retain(object);
    nw_queue_context_async();
  }
}

void __ne_filter_protocol_handle_message_block_invoke(uint64_t a1)
{
  ne_filter_process_verdict(*(void **)(a1 + 32), 0, *(void **)(a1 + 40), *(_DWORD *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    __int16 v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v10 = 0;
    uint64_t v7 = "protocol is null";
    uint64_t v8 = (uint8_t *)&v10;
LABEL_12:
    _os_log_impl(&dword_212970000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
    return;
  }
  uint64_t v3 = *(void *)(v2 + 40);
  if (!v3)
  {
    __int16 v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v9 = 0;
    uint64_t v7 = "filter is null";
    uint64_t v8 = (uint8_t *)&v9;
    goto LABEL_12;
  }
  BOOL v4 = (atomic_uint *)(v3 + 180);
  if (atomic_fetch_or(v4, 0) && atomic_fetch_add(v4, 0xFFFFFFFF) == 1)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    ne_filter_protocol_destroy(v5);
  }
}

uint64_t NEPIDByName(const char *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  *(void *)uint64_t v19 = 0x600000001;
  int v14 = 0;
  size_t v13 = 4;
  if (sysctl(v19, 2u, &v14, &v13, 0, 0) < 0)
  {
    __int16 v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = __error();
      uint64_t v12 = strerror(*v11);
      int buffer = 136315394;
      uint64_t v16 = "NEKernMaxProc";
      __int16 v17 = 2080;
      int v18 = v12;
      _os_log_error_impl(&dword_212970000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to get max proc count (%s)", (uint8_t *)&buffer, 0x16u);
    }
    return 0;
  }
  if (!v14) {
    return 0;
  }
  int v2 = 4 * v14;
  uint64_t v3 = malloc_type_malloc(4 * v14, 0xF88153BEuLL);
  if (!v3) {
    return 0;
  }
  BOOL v4 = v3;
  int v5 = proc_listallpids(v3, v2);
  if (v5 < 1)
  {
LABEL_9:
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    while (!proc_name(v4[v6], &buffer, 0x64u) || strcmp((const char *)&buffer, a1))
    {
      if (v7 == ++v6) {
        goto LABEL_9;
      }
    }
    uint64_t v8 = v4[v6];
  }
  free(v4);
  return v8;
}

xpc_object_t NECopySigningIdentifierForPID(int a1)
{
  return NECopySigningIdentifierForPIDwithAuditToken(a1, 0);
}

CFStringRef NECopySigningIdentifierForXPCMessage(void *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a1 || MEMORY[0x2166885F0]() != MEMORY[0x263EF8708])
  {
    int v2 = ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "NECopySigningIdentifierForXPCMessage";
    __int16 v10 = "XPC object passed to %s is NULL or is not a dictionary";
    p_audit_token_t cf = buf;
    uint64_t v12 = v2;
    uint32_t v13 = 12;
LABEL_15:
    _os_log_error_impl(&dword_212970000, v12, OS_LOG_TYPE_ERROR, v10, p_cf, v13);
    return 0;
  }
  *(_OWORD *)long long buf = 0u;
  long long v20 = 0u;
  xpc_dictionary_get_audit_token();
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  memset(&cf, 0, sizeof(cf));
  uint64_t v6 = SecTaskCreateWithAuditToken(v5, &cf);
  if (!v6)
  {
    __int16 v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    LOWORD(cf.val[0]) = 0;
    __int16 v10 = "Failed to create a task from audit token";
    p_audit_token_t cf = (uint8_t *)&cf;
    uint64_t v12 = v9;
    uint32_t v13 = 2;
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  *(void *)cf.val = 0;
  CFStringRef v3 = SecTaskCopySigningIdentifier(v6, (CFErrorRef *)&cf);
  if (*(void *)cf.val)
  {
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      remote_uint64_t connection = xpc_dictionary_get_remote_connection(a1);
      pid_t pid = xpc_connection_get_pid(remote_connection);
      *(_DWORD *)__int16 v17 = 67109120;
      pid_t v18 = pid;
      _os_log_error_impl(&dword_212970000, v8, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier of process %d", v17, 8u);
    }
    CFRelease(*(CFTypeRef *)cf.val);
  }
  CFRelease(v7);
  return v3;
}

BOOL NEAuditTokenForPID(int pid, integer_t *a2)
{
  kern_return_t v4;
  mach_error_t v5;
  NSObject *v6;
  BOOL result;
  char *v8;
  const char *v9;
  kern_return_t v10;
  mach_error_t v11;
  char *v12;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t target_task;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  mach_error_t v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  uint64_t v21 = *MEMORY[0x263EF8340];
  task_info_outCnt = 8;
  target_task = 0;
  BOOL v4 = task_for_pid(*MEMORY[0x263EF8960], pid, &target_task);
  if (v4)
  {
    CFAllocatorRef v5 = v4;
    uint64_t v6 = ne_log_obj();
    BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    uint64_t v8 = mach_error_string(v5);
    *(_DWORD *)long long buf = 67109634;
    uint64_t v16 = pid;
    __int16 v17 = 1024;
    pid_t v18 = v5;
    uint64_t v19 = 2080;
    long long v20 = v8;
    __int16 v9 = "task_for_pid(mach_task_self(), %d, &task) => %d (%s)\n";
LABEL_7:
    _os_log_debug_impl(&dword_212970000, v6, OS_LOG_TYPE_DEBUG, v9, buf, 0x18u);
    return 0;
  }
  __int16 v10 = task_info(target_task, 0xFu, a2, &task_info_outCnt);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v6 = ne_log_obj();
    BOOL result = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    uint64_t v12 = mach_error_string(v11);
    *(_DWORD *)long long buf = 67109634;
    uint64_t v16 = pid;
    __int16 v17 = 1024;
    pid_t v18 = v11;
    uint64_t v19 = 2080;
    long long v20 = v12;
    __int16 v9 = "task_info(mach_task_self(), %d, TASK_AUDIT_TOKEN) => %d (%s)\n";
    goto LABEL_7;
  }
  return 1;
}

uint64_t NEGIDForAuditToken()
{
  return 0;
}

uint64_t NEUIDForAuditToken()
{
  return 0;
}

uint64_t NECopyBootstrapPortForPID()
{
  return 0;
}

uint64_t NECopyAuditPortForAuditToken()
{
  return 0;
}

uint64_t *ne_filter_crypto_init_master()
{
  int v0 = (uint64_t *)malloc_type_malloc(0x28uLL, 0x1060040A09B13B7uLL);
  uint64_t v1 = v0;
  if (v0)
  {
    arc4random_buf(v0 + 1, 0x20uLL);
    int v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4[0] = 0;
      _os_log_debug_impl(&dword_212970000, v2, OS_LOG_TYPE_DEBUG, "Generated master key", (uint8_t *)v4, 2u);
    }
    *uint64_t v1 = ccsha256_di();
  }
  return v1;
}

BOOL ne_filter_crypto_generate_client_key(uint64_t a1, int a2, uint64_t a3)
{
  BOOL result = 0;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 && a3)
  {
    ccsha256_di();
    int v5 = cchkdf();
    uint64_t v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67109120;
      int v9 = a2;
      _os_log_debug_impl(&dword_212970000, v6, OS_LOG_TYPE_DEBUG, "Generated client key for salt %u", buf, 8u);
    }
    return v5 == 0;
  }
  return result;
}

char *ne_filter_crypto_init_client(long long *a1)
{
  if (!a1) {
    return 0;
  }
  int v2 = (char *)malloc_type_malloc(0x28uLL, 0x1060040A09B13B7uLL);
  CFStringRef v3 = v2;
  if (v2)
  {
    long long v4 = *a1;
    *(_OWORD *)(v2 + 24) = a1[1];
    *(_OWORD *)(v2 + 8) = v4;
    *(void *)int v2 = ccsha256_di();
    int v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 0;
      _os_log_debug_impl(&dword_212970000, v5, OS_LOG_TYPE_DEBUG, "Inited client key", (uint8_t *)v7, 2u);
    }
  }
  return v3;
}

uint64_t ne_filter_crypto_sign_data(uint64_t *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8, uint64_t a9, _DWORD *a10)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a1 && (uint64_t v11 = (unint64_t *)*a1) != 0)
  {
    uint64_t result = 22;
    if (a2 && a9 && a10)
    {
      unint64_t v14 = *v11;
      if (*v11 <= 0x20 && v14 <= *a10)
      {
        v25[0] = *v11;
        v25[1] = v25;
        *a10 = v14;
        MEMORY[0x270FA5388](22);
        int v23 = (char *)v25 - v22;
        cchmac_init();
        ne_filter_crypto_update_context(*a1, (uint64_t)v23, a2, a3, a4, a5, a6, a7, a8);
        cchmac_final();
        ne_filter_crypto_print_data(a2, a3, a4, a5, a6, a7, a8, (uint64_t)"SIGN");
        uint64_t v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 68289282;
          int v27 = 32;
          __int16 v28 = 2098;
          uint64_t v29 = a9;
          __int16 v30 = 2048;
          uint64_t v31 = v25[0];
          _os_log_debug_impl(&dword_212970000, v24, OS_LOG_TYPE_DEBUG, "Sign data: sig = %{public,ne_filter_crypto_signature}.32P sig_len = %zu", buf, 0x1Cu);
        }
        return 0;
      }
      else
      {
        return 34;
      }
    }
  }
  else
  {
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_212970000, v15, OS_LOG_TYPE_ERROR, "Failed to sign data, no crypto state", buf, 2u);
    }
    return 22;
  }
  return result;
}

uint64_t ne_filter_crypto_update_context(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  cchmac_update();
  cchmac_update();
  cchmac_update();
  uint64_t result = cchmac_update();
  if (a4 && a5) {
    uint64_t result = cchmac_update();
  }
  if (a6 && a7) {
    uint64_t result = cchmac_update();
  }
  if (a8)
  {
    if (a9) {
      return cchmac_update();
    }
  }
  return result;
}

void ne_filter_crypto_print_data(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315138;
    uint64_t v35 = a8;
    _os_log_debug_impl(&dword_212970000, v16, OS_LOG_TYPE_DEBUG, "%s NE Filter crypto data:", (uint8_t *)&v34, 0xCu);
  }
  __int16 v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 16;
    __int16 v38 = 2098;
    uint64_t v39 = a1;
    _os_log_debug_impl(&dword_212970000, v17, OS_LOG_TYPE_DEBUG, "%s \tflow_id: %{public, u_int8_t}.16P", (uint8_t *)&v34, 0x1Cu);
  }
  pid_t v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 8;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 16;
    _os_log_debug_impl(&dword_212970000, v18, OS_LOG_TYPE_DEBUG, "%s \tsock_id: %{public,u_int8_t}.8P", (uint8_t *)&v34, 0x1Cu);
  }
  uint64_t v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 24;
    _os_log_debug_impl(&dword_212970000, v19, OS_LOG_TYPE_DEBUG, "%s \tdirection: %{public,u_int8_t}.4P", (uint8_t *)&v34, 0x1Cu);
  }
  long long v20 = ne_log_obj();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315906;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 28;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 28;
    __int16 v40 = 2048;
    uint64_t v41 = 28;
    _os_log_debug_impl(&dword_212970000, v20, OS_LOG_TYPE_DEBUG, "%s \tremote: %{public,u_int8_t}.28P (%lu)", (uint8_t *)&v34, 0x26u);
  }
  uint64_t v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315906;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 28;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 56;
    __int16 v40 = 2048;
    uint64_t v41 = 28;
    _os_log_debug_impl(&dword_212970000, v21, OS_LOG_TYPE_DEBUG, "%s \tlocal: %{public,u_int8_t}.28P (%lu)", (uint8_t *)&v34, 0x26u);
  }
  uint64_t v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 84;
    _os_log_debug_impl(&dword_212970000, v22, OS_LOG_TYPE_DEBUG, "%s \tsocketProtocol: %{public,u_int8_t}.4P", (uint8_t *)&v34, 0x1Cu);
  }
  int v23 = ne_log_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 88;
    _os_log_debug_impl(&dword_212970000, v23, OS_LOG_TYPE_DEBUG, "%s \tpid: %{public,u_int8_t}.4P", (uint8_t *)&v34, 0x1Cu);
  }
  uint64_t v24 = ne_log_obj();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 92;
    _os_log_debug_impl(&dword_212970000, v24, OS_LOG_TYPE_DEBUG, "%s \teffective_pid: %{public,u_int8_t}.4P", (uint8_t *)&v34, 0x1Cu);
  }
  uint64_t v25 = ne_log_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 16;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 100;
    _os_log_debug_impl(&dword_212970000, v25, OS_LOG_TYPE_DEBUG, "%s \tuuid: %{public,u_int8_t}.16P", (uint8_t *)&v34, 0x1Cu);
  }
  uint64_t v26 = ne_log_obj();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 16;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 116;
    _os_log_debug_impl(&dword_212970000, v26, OS_LOG_TYPE_DEBUG, "%s \teffective_uuid: %{public,u_int8_t}.16P", (uint8_t *)&v34, 0x1Cu);
  }
  int v27 = ne_log_obj();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 4;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 96;
    _os_log_debug_impl(&dword_212970000, v27, OS_LOG_TYPE_DEBUG, "%s \tresponsible_pid: %{public,u_int8_t}.4P", (uint8_t *)&v34, 0x1Cu);
  }
  __int16 v28 = ne_log_obj();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 16;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 132;
    _os_log_debug_impl(&dword_212970000, v28, OS_LOG_TYPE_DEBUG, "%s \tresponsible_uuid: %{public,u_int8_t}.16P", (uint8_t *)&v34, 0x1Cu);
  }
  uint64_t v29 = ne_log_obj();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 8;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 152;
    _os_log_debug_impl(&dword_212970000, v29, OS_LOG_TYPE_DEBUG, "%s \tbyte_count_in: %{public,u_int8_t}.8P", (uint8_t *)&v34, 0x1Cu);
  }
  __int16 v30 = ne_log_obj();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1042;
    int v37 = 8;
    __int16 v38 = 2098;
    uint64_t v39 = a1 + 160;
    _os_log_debug_impl(&dword_212970000, v30, OS_LOG_TYPE_DEBUG, "%s \tbyte_count_out: %{public,u_int8_t}.8P", (uint8_t *)&v34, 0x1Cu);
    if (!a2) {
      goto LABEL_33;
    }
  }
  else if (!a2)
  {
    goto LABEL_33;
  }
  uint64_t v31 = ne_log_obj();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1040;
    int v37 = a3;
    __int16 v38 = 2080;
    uint64_t v39 = a2;
    _os_log_debug_impl(&dword_212970000, v31, OS_LOG_TYPE_DEBUG, "%s \tbundle_id: %.*s", (uint8_t *)&v34, 0x1Cu);
  }
LABEL_33:
  if (a4 && (uint64_t v32 = ne_log_obj(), os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)))
  {
    int v34 = 136315394;
    uint64_t v35 = a8;
    __int16 v36 = 1024;
    int v37 = a5;
    _os_log_debug_impl(&dword_212970000, v32, OS_LOG_TYPE_DEBUG, "%s \turl: <%d characters>", (uint8_t *)&v34, 0x12u);
    if (!a6) {
      return;
    }
  }
  else if (!a6)
  {
    return;
  }
  int v33 = ne_log_obj();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    int v34 = 136315650;
    uint64_t v35 = a8;
    __int16 v36 = 1040;
    int v37 = a7;
    __int16 v38 = 2080;
    uint64_t v39 = a6;
    _os_log_debug_impl(&dword_212970000, v33, OS_LOG_TYPE_DEBUG, "%s \thostname: %.*s", (uint8_t *)&v34, 0x1Cu);
  }
}

BOOL ne_filter_crypto_validate_data(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a1 && (uint64_t v12 = (void *)*a1) != 0)
  {
    BOOL result = 0;
    if (a2 && a3 && a10 && a11)
    {
      if (*v12 > 0x20uLL || *v12 != a11) {
        return 0;
      }
      v25[1] = v25;
      memset(v34, 0, sizeof(v34));
      MEMORY[0x270FA5388](0);
      uint64_t v22 = (char *)v25 - v21;
      cchmac_init();
      ne_filter_crypto_update_context(*a1, (uint64_t)v22, a3, a4, a5, a6, a7, a8, a9);
      cchmac_final();
      ne_filter_crypto_print_data(a3, a4, a5, a6, a7, a8, a9, (uint64_t)"VALIDATE");
      int v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 68289538;
        int v27 = 32;
        __int16 v28 = 2098;
        uint64_t v29 = a10;
        __int16 v30 = 1042;
        int v31 = 32;
        __int16 v32 = 2098;
        int v33 = v34;
        _os_log_debug_impl(&dword_212970000, v23, OS_LOG_TYPE_DEBUG, "Validate data: sig1 = %{public,ne_filter_crypto_signature}.32P sig2 = %{public,ne_filter_crypto_signature}.32P", buf, 0x22u);
      }
      return cc_cmp_safe() == 0;
    }
  }
  else
  {
    uint64_t v24 = ne_log_obj();
    BOOL result = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_212970000, v24, OS_LOG_TYPE_ERROR, "Failed to valdate data, no crypto state", buf, 2u);
      return 0;
    }
  }
  return result;
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EE4610](bundle, key);
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

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x270EE47D0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

CFRange CFDataFind(CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions)
{
  CFIndex v4 = MEMORY[0x270EE4800](theData, dataToFind, searchRange.location, searchRange.length, compareOptions);
  result.unsigned int length = v5;
  result.CFIndex location = v4;
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x270EE4858](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x270EE49E0]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x270ED7C48]();
}

uint64_t NEHelperGetAppTrackerDomains()
{
  return MEMORY[0x270ED7C58]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x270EFD858]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x270EFD860]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x270EFDCA0](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x270F79600]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x270F79610]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x270ED7EF0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
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

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

mach_port_name_t audit_session_self(void)
{
  return MEMORY[0x270ED8710]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x270ED87D8]();
}

uint64_t cchkdf()
{
  return MEMORY[0x270ED8BA8]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x270ED8BC8]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x270ED8BD0]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x270ED8BD8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x270ED8EB0]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x270ED9150]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x270ED9158]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x270ED92E0](data1, data2);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x270ED9300](data);
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x270ED9308](object);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x270ED9528](source);
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

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x270ED9B98](a1, a2, a3, a4);
}

gid_t getegid(void)
{
  return MEMORY[0x270ED9BE0]();
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9CD0](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x270ED9D90](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x270ED9DF0]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x270ED9EC8](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

uint64_t ne_log_obj()
{
  return MEMORY[0x270EDA620]();
}

uint64_t ne_tracker_build_cache()
{
  return MEMORY[0x270EDA688]();
}

uint64_t ne_tracker_clear_cache()
{
  return MEMORY[0x270EDA690]();
}

uint64_t ne_tracker_context_can_block_request()
{
  return MEMORY[0x270EDA698]();
}

uint64_t ne_tracker_context_get_domain()
{
  return MEMORY[0x270EDA6A0]();
}

uint64_t ne_tracker_context_get_domain_owner()
{
  return MEMORY[0x270EDA6A8]();
}

uint64_t ne_tracker_context_is_from_app_list()
{
  return MEMORY[0x270EDA6B0]();
}

uint64_t ne_tracker_context_is_from_web_list()
{
  return MEMORY[0x270EDA6B8]();
}

uint64_t ne_tracker_lookup_app_domains()
{
  return MEMORY[0x270EDA6C0]();
}

uint64_t ne_tracker_validate_domain()
{
  return MEMORY[0x270EDA6C8]();
}

uint64_t ne_trie_search()
{
  return MEMORY[0x270EDA6D0]();
}

uint64_t necp_match_policy()
{
  return MEMORY[0x270EDA6E0]();
}

uint64_t nelog_is_debug_logging_enabled()
{
  return MEMORY[0x270EDA6F0]();
}

uint64_t nelog_is_info_logging_enabled()
{
  return MEMORY[0x270EDA6F8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDA740](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

void nw_connection_batch(nw_connection_t connection, dispatch_block_t batch_block)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_local_endpoint()
{
  return MEMORY[0x270EF7B58]();
}

uint64_t nw_connection_copy_connected_path()
{
  return MEMORY[0x270EF7B60]();
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x270EF7B80](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x270EF7BA8](endpoint, parameters);
}

void nw_connection_group_cancel(nw_connection_group_t group)
{
}

nw_endpoint_t nw_connection_group_copy_remote_endpoint_for_message(nw_connection_group_t group, nw_content_context_t context)
{
  return (nw_endpoint_t)MEMORY[0x270EF7C08](group, context);
}

uint64_t nw_connection_group_create_with_parameters()
{
  return MEMORY[0x270EF7C10]();
}

uint64_t nw_connection_group_get_port()
{
  return MEMORY[0x270EF7C18]();
}

void nw_connection_group_send_message(nw_connection_group_t group, dispatch_data_t content, nw_endpoint_t endpoint, nw_content_context_t context, nw_connection_group_send_completion_t completion)
{
}

void nw_connection_group_set_queue(nw_connection_group_t group, dispatch_queue_t queue)
{
}

void nw_connection_group_set_receive_handler(nw_connection_group_t group, uint32_t maximum_message_size, BOOL reject_oversized_messages, nw_connection_group_receive_handler_t receive_handler)
{
}

void nw_connection_group_set_state_changed_handler(nw_connection_group_t group, nw_connection_group_state_changed_handler_t state_changed_handler)
{
}

void nw_connection_group_start(nw_connection_group_t group)
{
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
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

uint64_t nw_context_get_globals_for_protocol()
{
  return MEMORY[0x270EF7DE8]();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x270EF7E80](address);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x270EF7EB8]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x270EF7EE8](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x270EF7F30](endpoint);
}

uint64_t nw_endpoint_get_parent_endpoint_domain()
{
  return MEMORY[0x270EF7F40]();
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F48](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x270EF7F68](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x270EF7FB8](error);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x270EF8030]();
}

uint64_t nw_frame_array_append_array()
{
  return MEMORY[0x270EF8038]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x270EF8040]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x270EF8048]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x270EF8050]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x270EF8058]();
}

uint64_t nw_frame_array_last()
{
  return MEMORY[0x270EF8060]();
}

uint64_t nw_frame_array_next()
{
  return MEMORY[0x270EF8068]();
}

uint64_t nw_frame_array_prepend_array()
{
  return MEMORY[0x270EF8078]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x270EF8080]();
}

uint64_t nw_frame_array_unclaimed_length()
{
  return MEMORY[0x270EF8088]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x270EF8098]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x270EF80A0]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x270EF80B0]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x270EF80B8]();
}

uint64_t nw_frame_is_connection_complete()
{
  return MEMORY[0x270EF80C8]();
}

uint64_t nw_frame_is_metadata_complete()
{
  return MEMORY[0x270EF80D0]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x270EF80E0]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x270EF80F8]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x270EF8100]();
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x270EF8340]();
}

uint64_t nw_nat64_copy_prefixes()
{
  return MEMORY[0x270EF84B0]();
}

uint64_t nw_nat64_synthesize_v6()
{
  return MEMORY[0x270EF84B8]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x270EF84E8]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x270EF8550](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x270EF8560](configure_dtls, configure_udp);
}

uint64_t nw_parameters_get_data_mode()
{
  return MEMORY[0x270EF8570]();
}

uint64_t nw_parameters_get_e_proc_uuid()
{
  return MEMORY[0x270EF8580]();
}

uint64_t nw_parameters_get_effective_bundle_id()
{
  return MEMORY[0x270EF8590]();
}

uint64_t nw_parameters_get_ip_protocol()
{
  return MEMORY[0x270EF85A0]();
}

uint64_t nw_parameters_get_pid()
{
  return MEMORY[0x270EF85B0]();
}

uint64_t nw_parameters_get_proc_uuid()
{
  return MEMORY[0x270EF85B8]();
}

uint64_t nw_parameters_get_server_mode()
{
  return MEMORY[0x270EF85C8]();
}

uint64_t nw_parameters_get_url()
{
  return MEMORY[0x270EF85D0]();
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x270EF8610]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x270EF8670]();
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x270EF8748]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x270EF8770]();
}

uint64_t nw_path_get_filter_unit()
{
  return MEMORY[0x270EF88E0]();
}

uint64_t nw_path_get_interface_index()
{
  return MEMORY[0x270EF88E8]();
}

uint64_t nw_protocol_definition_create_with_identifier()
{
  return MEMORY[0x270EF8BC0]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x270EF8FF0]();
}

uint64_t nw_queue_context_async()
{
  return MEMORY[0x270EF9098]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x270EF90A0]();
}

uint64_t nw_queue_context_target_dispatch_queue()
{
  return MEMORY[0x270EF90B0]();
}

void nw_release(void *obj)
{
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x270EF94A0](obj);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
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

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDAD10](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD48](buffer, *(void *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD78](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

void *__cdecl rb_tree_find_node(rb_tree_t *a1, const void *a2)
{
  return (void *)MEMORY[0x270EDB0F8](a1, a2);
}

void rb_tree_init(rb_tree_t *a1, const rb_tree_ops_t *a2)
{
}

void *__cdecl rb_tree_insert_node(rb_tree_t *a1, void *a2)
{
  return (void *)MEMORY[0x270EDB108](a1, a2);
}

void *__cdecl rb_tree_iterate(rb_tree_t *a1, void *a2, const unsigned int a3)
{
  return (void *)MEMORY[0x270EDB110](a1, a2, *(void *)&a3);
}

void rb_tree_remove_node(rb_tree_t *a1, void *a2)
{
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x270EDB1A0](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t sandbox_check()
{
  return MEMORY[0x270EDB290]();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x270EDB3B8](*(void *)&a1, a2, *(void *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x270EDB650](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x270EDB840](*(void *)&target_tport, *(void *)&pid, t);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x270EDB868](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int tracker_action(int action, char *buffer, size_t buffer_size)
{
  return MEMORY[0x270EDB970](*(void *)&action, buffer, buffer_size);
}

void uidna_close(UIDNA *idna)
{
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x270F99710](idna, name, *(void *)&length, dest, *(void *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x270F99718](*(void *)&options, pErrorCode);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x270EDBD48](xarray, index, length);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x270EDBE78](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
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

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x270EDBF70]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x270EDBFA0](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x270EDC000]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x270EDC048]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x270EDC0B8](xdict, key);
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

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x270EDC128]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
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

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x270EDC3F0](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x270EDC458](uuid);
}