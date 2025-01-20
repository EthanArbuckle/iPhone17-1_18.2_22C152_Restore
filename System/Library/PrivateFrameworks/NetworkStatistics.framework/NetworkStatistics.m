void sub_21C4BF5E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4BF8E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4C0C68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4C0D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL attributionReasonImpliesProcessName(int a1)
{
  return (a1 & 0xFFFFFFFD) == 4;
}

uint64_t attributionReasonImpliesBundleName(unsigned int a1)
{
  return (a1 < 6) & (0x2Eu >> a1);
}

void sub_21C4C32A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id pid_to_uuid(int a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v5 = 0;
  memset(v4, 0, sizeof(v4));
  int v1 = proc_pidinfo(a1, 17, 1uLL, v4, 56);
  v2 = 0;
  if (v1 == 56) {
    v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v4];
  }
  return v2;
}

void sub_21C4C532C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id pid_to_process_name(int a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long buffer = 0u;
  long long v6 = 0u;
  if (proc_pidinfo(a1, 13, 1uLL, &buffer, 64) == 64)
  {
    long long v3 = v6;
    char v4 = 0;
    int v1 = [NSString stringWithUTF8String:&v3];
  }
  else
  {
    int v1 = 0;
  }
  return v1;
}

id NStatGetLog()
{
  if (NStatGetLog_pred != -1) {
    dispatch_once(&NStatGetLog_pred, &__block_literal_global_418);
  }
  v0 = (void *)sNstatLogHandle;
  return v0;
}

void sub_21C4C614C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4C6BA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4C7054(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t NStatManagerQueryAllSourcesUpdate(void *a1, const char *a2)
{
  return [a1 queryAll:a2];
}

uint64_t printf_domain()
{
  if (printf_domain_once != -1) {
    dispatch_once(&printf_domain_once, &__block_literal_global);
  }
  return printf_domain_printfdomain;
}

_printf_domain *__printf_domain_block_invoke()
{
  result = new_printf_domain();
  printf_domain_printfdomain = (uint64_t)result;
  if (result)
  {
    register_printf_domain_render_std(result, "M");
    register_printf_domain_function((printf_domain_t)printf_domain_printfdomain, 78, (printf_function *)xprint_sockaddr, (printf_arginfo_function *)xprint_sockaddr_arginfo, 0);
    register_printf_domain_function((printf_domain_t)printf_domain_printfdomain, 64, (printf_function *)xprint_cfobject, (printf_arginfo_function *)xprint_cfobject_arginfo, 0);
    uint64_t v1 = (_printf_domain *)printf_domain_printfdomain;
    return (_printf_domain *)register_printf_domain_function(v1, 73, (printf_function *)xprint_ifindex, (printf_arginfo_function *)xprint_ifindex_arginfo, 0);
  }
  return result;
}

uint64_t xprint_sockaddr(FILE *a1, uint64_t a2, unsigned __int8 ***a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v4 = **a3;
  if (v4)
  {
    unint64_t v5 = *v4;
    if (v5 < 2) {
      return 0;
    }
    unsigned int v8 = v4[1];
    if (v8 > 0x11)
    {
      if (v8 == 18)
      {
        if (v5 >= 8)
        {
          uint64_t v11 = v4[5];
          if (v11 + v4[6] + (unint64_t)v4[7] + 8 <= v5)
          {
            if (v4[6])
            {
              unint64_t v12 = 0;
              LODWORD(v6) = 0;
              do
              {
                if (v12) {
                  int v13 = fprintf(a1, ":%x");
                }
                else {
                  int v13 = fprintf(a1, "%x");
                }
                uint64_t v6 = (v13 + v6);
                ++v12;
              }
              while (v12 < v4[6]);
              LODWORD(v11) = v4[5];
            }
            else
            {
              uint64_t v6 = 0;
            }
            if (v11)
            {
              int v14 = fprintf(a1, "%s%*s");
            }
            else
            {
              if (!*((_WORD *)v4 + 1)) {
                return v6;
              }
              if (v6) {
                int v14 = fprintf(a1, "%%%d");
              }
              else {
                int v14 = fprintf(a1, "%d");
              }
            }
            return (v14 + v6);
          }
        }
        return 0;
      }
      if (v8 != 30) {
        return fprintf(a1, "<unsupported af: %u>");
      }
      goto LABEL_14;
    }
    if (v8 != 1)
    {
      if (v8 != 2) {
        return fprintf(a1, "<unsupported af: %u>");
      }
LABEL_14:
      if (!getnameinfo((const sockaddr *)v4, v5, v16, 0x39u, v15, 6u, 10))
      {
        if (!*((_WORD *)v4 + 1)) {
          return fprintf(a1, "%s");
        }
        if (v4[1] == 2) {
          uint64_t v9 = "%s:%s";
        }
        else {
          uint64_t v9 = "%s.%s";
        }
        return fprintf(a1, v9, v16, v15);
      }
      return 0;
    }
    if (v5 < 3) {
      return 0;
    }
    return fprintf(a1, "%.*s");
  }
  else
  {
    return fprintf(a1, "<NULL>");
  }
}

uint64_t xprint_sockaddr_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2) {
    *a3 = 32;
  }
  return 1;
}

uint64_t xprint_cfobject(FILE *a1, uint64_t a2, CFTypeRef **a3)
{
  CFStringRef v4 = (const __CFString *)**a3;
  if (v4)
  {
    CFTypeID v5 = CFGetTypeID(**a3);
    if (v5 == CFDictionaryGetTypeID() || (CFTypeID v6 = CFGetTypeID(v4), v6 == CFArrayGetTypeID()))
    {
      int v7 = fprintf(a1, "\n");
      return xprint_cfobject_container(a1, 2, v4) + v7;
    }
    else
    {
      xprint_cfobject_leaf(a1, v4);
      return 0;
    }
  }
  else
  {
    return fprintf(a1, "<NULL>");
  }
}

uint64_t xprint_cfobject_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2) {
    *a3 = 32;
  }
  return 1;
}

uint64_t xprint_ifindex(FILE *a1, uint64_t a2, unsigned int **a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unsigned int v4 = **a3;
  v6[0] = 0;
  if_indextoname(v4, v6);
  if (!v6[0]) {
    return fprintf(a1, "%d");
  }
  v6[16] = 0;
  return fprintf(a1, "%s");
}

uint64_t xprint_ifindex_arginfo(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (a2) {
    *a3 = 1;
  }
  return 1;
}

void __NStatGetLog_block_invoke()
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  os_log_t v0 = os_log_create("com.apple.networkstatistics", "NetworkStatistics");
  uint64_t v1 = (void *)sNstatLogHandle;
  sNstatLogHandle = (uint64_t)v0;

  if (sNstatLogHandle)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:@"/Library/Preferences/com.apple.NetworkStatistics.plist"];
    if (v2)
    {
      long long v3 = [MEMORY[0x263F08AC0] propertyListWithData:v2 options:0 format:0 error:0];
      if (v3)
      {
        pid_t v4 = getpid();
        if (proc_name(v4, buffer, 0x64u))
        {
          v25 = v2;
          unint64_t v5 = 0x263F08000uLL;
          CFTypeID v6 = [NSString stringWithUTF8String:buffer];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v24 = v3;
          id v7 = v3;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v29;
            v26 = v6;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v29 != v10) {
                  objc_enumerationMutation(v7);
                }
                unint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                int v13 = [v7 valueForKey:v12];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if ([v12 isEqualToString:@"log_level"])
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 integerValue] >= 7) {
                      defaultMgrFlags |= 0x10u;
                    }
                  }
                  else if (([v12 isEqualToString:@"all"] & 1) != 0 {
                         || [v12 isEqualToString:v6])
                  }
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v27 = v6;
                      unint64_t v14 = v5;
                      id v15 = v13;
                      v16 = [v15 objectForKeyedSubscript:@"traceFilePrefix"];
                      uint64_t v17 = [v15 objectForKeyedSubscript:@"logVerbose"];
                      v18 = [v15 objectForKeyedSubscript:@"traceVerbose"];

                      unint64_t v5 = v14;
                      if (v16)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v19 = *(void **)(v14 + 2880);
                          uint64_t v23 = getpid();
                          v20 = v19;
                          unint64_t v5 = v14;
                          uint64_t v21 = [v20 stringWithFormat:@"%@.%@.%d", v16, v27, v23];
                          v22 = (void *)traceFilePrefix;
                          traceFilePrefix = v21;
                        }
                      }
                      if (v17) {
                        defaultMgrFlags |= 0x10u;
                      }
                      if (v18) {
                        defaultMgrFlags |= 0x80u;
                      }

                      CFTypeID v6 = v26;
                    }
                  }
                }
              }
              uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
            }
            while (v9);
          }

          long long v3 = v24;
          v2 = v25;
        }
      }
    }
  }
}

const char *msgTypeToString(int a1)
{
  if (a1 > 10000)
  {
    switch(a1)
    {
      case 10001:
        result = "src-added";
        break;
      case 10002:
        result = "src-removed";
        break;
      case 10003:
LABEL_9:
        result = "src-desc";
        break;
      case 10004:
        result = "src-counts";
        break;
      case 10005:
        result = "sysinfo-counts";
        break;
      case 10006:
        result = "src-update";
        break;
      default:
LABEL_21:
        result = "???";
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 1001:
        return "add-src";
      case 1002:
        return "add-all";
      case 1003:
        return "rem-src";
      case 1004:
        return "query-src";
      case 1005:
        goto LABEL_9;
      case 1006:
        return "set-filter";
      case 1007:
        return "get-update";
      case 1008:
        return "subscribe-sysinfo";
      default:
        if (a1)
        {
          if (a1 != 1) {
            goto LABEL_21;
          }
          result = "error";
        }
        else
        {
          result = "success";
        }
        break;
    }
  }
  return result;
}

void NStatMgrTraceF(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void NStatMgrVTraceF(void *a1, const char *a2, va_list a3)
{
  id v5 = a1;
  CFTypeID v6 = v5;
  if (v5 && ([v5 mgrflags] & 0x80) != 0)
  {
    id v7 = (void *)MEMORY[0x21D4A8280]();
    __ret = 0;
    if (printf_domain_once != -1) {
      dispatch_once(&printf_domain_once, &__block_literal_global);
    }
    vasxprintf(&__ret, (printf_domain_t)printf_domain_printfdomain, 0, a2, a3);
    if (__ret)
    {
      objc_msgSend(v6, "trace:");
      free(__ret);
    }
  }
}

void *NStatSourceCopyProperty(void *a1, uint64_t a2)
{
  long long v3 = [a1 currentSnapshot];
  pid_t v4 = [v3 traditionalDictionary];
  id v5 = [v4 objectForKeyedSubscript:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 UUIDString];

    id v5 = (void *)v6;
  }

  return v5;
}

uint64_t NStatSourceCopyProperties(void *a1)
{
  uint64_t v1 = [a1 currentSnapshot];
  uint64_t v2 = [v1 traditionalDictionary];

  return v2;
}

uint64_t NStatSourceCopyCounts(void *a1)
{
  uint64_t v1 = [a1 currentSnapshot];
  uint64_t v2 = [v1 traditionalDictionary];

  return v2;
}

void NStatSourceSetRemovedBlock(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  pid_t v4 = [v8 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
    [v8 setDelegate:v6];
  }
  id v7 = [v8 delegate];
  [v7 setRemovedBlock:v3];
}

void NStatSourceSetDescriptionBlock(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  pid_t v4 = [v8 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
    [v8 setDelegate:v6];
  }
  id v7 = [v8 delegate];
  [v7 setDescriptionBlock:v3];
}

void NStatSourceSetCountsBlock(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  pid_t v4 = [v8 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
    [v8 setDelegate:v6];
  }
  id v7 = [v8 delegate];
  [v7 setCountsBlock:v3];
}

void NStatSourceSetEventsBlock(void *a1, void *a2)
{
  id v8 = a1;
  id v3 = a2;
  pid_t v4 = [v8 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
    [v8 setDelegate:v6];
  }
  id v7 = [v8 delegate];
  [v7 setEventsBlock:v3];
}

void NStatSourceRemove(void *a1)
{
  id v1 = a1;
  id v2 = [v1 manager];
  [v2 removeSource:v1];
}

uint64_t NStatManagerQueryAllSources(void *a1, const char *a2)
{
  return [a1 queryAllCounts:a2];
}

uint64_t NStatManagerQueryAllSourcesDescriptions(void *a1, const char *a2)
{
  return [a1 queryAllDescriptions:a2];
}

uint64_t NStatManagerCreateRouteSource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = [NWStatisticsRouteSource alloc];
  return (uint64_t)[(NWStatisticsRouteSource *)v8 initWithManager:a1 destination:a2 mask:a3 interface:a4];
}

uint64_t NStatManagerCreateTCPSource()
{
  return 0;
}

uint64_t NStatManagerCreateUDPSource()
{
  return 0;
}

uint64_t NStatManagerCreateSysinfoSource()
{
  return 0;
}

uint64_t NStatManagerCreateInterfaceSource(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = [NWStatisticsInterfaceSource alloc];
  return (uint64_t)[(NWStatisticsInterfaceSource *)v6 initWithManager:a1 interface:a2 threshold:a3];
}

uint64_t NStatManagerAddAllTCP(void *a1, const char *a2)
{
  return [a1 addAllTCP:0 events:0 pid:0 uuid:0];
}

uint64_t NStatManagerAddAllTCPWithFilter(void *a1, const char *a2)
{
  return [a1 addAllTCP:a2 events:0 pid:0 uuid:0];
}

uint64_t NStatManagerAddAllTCPWithOptions(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 addAllTCP:a2 events:a3 pid:a4 uuid:a5];
}

uint64_t NStatManagerAddAllUDP(void *a1, const char *a2)
{
  return [a1 addAllUDP:0 events:0 pid:0 uuid:0];
}

uint64_t NStatManagerAddAllUDPWithFilter(void *a1, const char *a2)
{
  return [a1 addAllUDP:a2 events:0 pid:0 uuid:0];
}

uint64_t NStatManagerAddAllUDPWithOptions(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 addAllUDP:a2 events:a3 pid:a4 uuid:a5];
}

uint64_t NStatManagerAddAllRoutes(void *a1, const char *a2)
{
  return [a1 addAllRoute:0];
}

uint64_t NStatManagerAddAllRoutesWithFilter(void *a1, const char *a2)
{
  return [a1 addAllRoute:a2];
}

uint64_t NStatManagerDestroy(void *a1)
{
  [a1 invalidate];
  [a1 setDelegate:0];
  return [a1 setStrongDelegate:0];
}

NWStatisticsManager *NStatManagerCreate(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_alloc_init(NWStatisticsDelegateBlockWrapper);
  id v7 = v6;
  if (v6)
  {
    [(NWStatisticsDelegateBlockWrapper *)v6 setAddedBlock:v5];
    id v8 = [[NWStatisticsManager alloc] initWithQueue:v4];
    [(NWStatisticsManager *)v8 setStrongDelegate:v7];
    [(NWStatisticsManager *)v8 setDelegate:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void NStatSourceSetFilter(void *a1, uint64_t a2)
{
  id v3 = [a1 manager];
  [v3 setFilter:a2];
}

void NStatManagerSetQueuePriority()
{
  os_log_t v0 = NStatGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    NStatManagerSetQueuePriority_cold_1(v0);
  }
}

uint64_t NStatManagerSetFlags(void *a1, const char *a2)
{
  return [a1 setMgrflags:a2];
}

uint64_t NStatManagerSetInterfaceTraceFD(void *a1, const char *a2)
{
  return [a1 setInterfaceTraceFd:a2];
}

uint64_t NStatManagerSetInterfaceSourceFD(void *a1, const char *a2)
{
  return [a1 setInterfaceSourceFd:a2];
}

BOOL NStatRouteValuesForIPv4Host(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x21D4A8280]();
  int v7 = 1;
  if (a1 && a3)
  {
    id v8 = +[NWSSnapshotSource routeSnapshotForIPv4Host:a1 viaInterfaceIndex:a2];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 rttMinimum];
      *(void *)a3 = v10;
      [v9 rttAverage];
      *(void *)(a3 + 8) = v11;
      [v9 rttVariation];
      *(void *)(a3 + 16) = v12;
      *(_DWORD *)(a3 + 24) = [v9 connectAttempts];
      int v7 = 0;
      *(_DWORD *)(a3 + 28) = [v9 connectSuccesses];
    }
  }
  return v7 == 0;
}

BOOL NStatRouteValuesForIPv6Host(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)MEMORY[0x21D4A8280]();
  int v7 = 1;
  if (a1 && a3)
  {
    id v8 = +[NWSSnapshotSource routeSnapshotForIPv6Host:a1 viaInterfaceIndex:a2];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 rttMinimum];
      *(void *)a3 = v10;
      [v9 rttAverage];
      *(void *)(a3 + 8) = v11;
      [v9 rttVariation];
      *(void *)(a3 + 16) = v12;
      *(_DWORD *)(a3 + 24) = [v9 connectAttempts];
      int v7 = 0;
      *(_DWORD *)(a3 + 28) = [v9 connectSuccesses];
    }
  }
  return v7 == 0;
}

uint64_t xprint_cfobject_container(FILE *a1, int a2, CFTypeRef cf)
{
  context[0] = 0;
  int v13 = a1;
  context[1] = a2;
  uint64_t v14 = 0;
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    if (CFDictionaryGetCount((CFDictionaryRef)cf))
    {
      CFDictionaryApplyFunction((CFDictionaryRef)cf, (CFDictionaryApplierFunction)xprint_cfobject_dictionary, context);
      return v14;
    }
  }
  else
  {
    CFTypeID v7 = CFGetTypeID(cf);
    if (v7 != CFArrayGetTypeID()) {
      return v14;
    }
    CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
    if (Count)
    {
      v15.length = Count;
      v15.location = 0;
      CFArrayApplyFunction((CFArrayRef)cf, v15, (CFArrayApplierFunction)xprint_cfobject_array, context);
      return v14;
    }
  }
  if (a2 >= 80) {
    int v9 = 80;
  }
  else {
    int v9 = a2;
  }
  int v10 = fprintf(a1, "%.*s", v9, "                                                                                ");
  return (fprintf(a1, "<empty>") + v10);
}

uint64_t xprint_cfobject_leaf(FILE *a1, const __CFString *a2)
{
  if (a2)
  {
    CFTypeID v4 = CFGetTypeID(a2);
    if (v4 == CFStringGetTypeID())
    {
      CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
      if (CStringPtr) {
        return fprintf(a1, "%s", CStringPtr);
      }
      CFIndex Length = CFStringGetLength(a2);
      CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      int v13 = (char *)malloc_type_malloc(MaximumSizeForEncoding, 0x983C18ABuLL);
      if (v13)
      {
        uint64_t v14 = v13;
        if (CFStringGetCString(a2, v13, MaximumSizeForEncoding, 0x8000100u)) {
          uint64_t v15 = fprintf(a1, "%s", v14);
        }
        else {
          uint64_t v15 = 0;
        }
        free(v14);
        return v15;
      }
      return 0;
    }
    CFTypeID v8 = CFGetTypeID(a2);
    if (v8 == CFDataGetTypeID())
    {
      CFStringRef v9 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x263EFFB08], (CFDataRef)a2, 0x8000100u);
      if (!v9) {
        return 0;
      }
LABEL_23:
      CFStringRef v18 = v9;
      uint64_t v15 = xprint_cfobject_leaf(a1, v9);
      CFRelease(v18);
      return v15;
    }
    CFTypeID v10 = CFGetTypeID(a2);
    if (v10 != CFBooleanGetTypeID())
    {
      CFTypeID v16 = CFGetTypeID(a2);
      if (v16 == CFNumberGetTypeID())
      {
        switch(CFNumberGetType((CFNumberRef)a2))
        {
          case kCFNumberSInt8Type:
            LOBYTE(valuePtr) = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt8Type, &valuePtr);
            uint64_t v17 = fprintf(a1, "(SInt8) %hhd");
            break;
          case kCFNumberSInt16Type:
            LOWORD(valuePtr) = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt16Type, &valuePtr);
            uint64_t v17 = fprintf(a1, "(SInt16) %hd");
            break;
          case kCFNumberSInt32Type:
            LODWORD(valuePtr) = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr);
            uint64_t v17 = fprintf(a1, "(SInt32) %d");
            break;
          case kCFNumberSInt64Type:
            uint64_t valuePtr = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt64Type, &valuePtr);
            uint64_t v17 = fprintf(a1, "(SInt64) %lld");
            break;
          case kCFNumberFloat32Type:
            LODWORD(valuePtr) = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat32Type, &valuePtr);
            uint64_t v17 = fprintf(a1, "(Float32) %f");
            break;
          case kCFNumberFloat64Type:
            uint64_t valuePtr = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat64Type, &valuePtr);
            uint64_t v17 = fprintf(a1, "(Float64) %lf");
            break;
          case kCFNumberCharType:
            LOBYTE(valuePtr) = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberCharType, &valuePtr);
            uint64_t v17 = fprintf(a1, "(Char) %hhd");
            break;
          case kCFNumberShortType:
            LOWORD(valuePtr) = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberShortType, &valuePtr);
            uint64_t v17 = fprintf(a1, "(Short) %hd");
            break;
          case kCFNumberIntType:
            LODWORD(valuePtr) = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberIntType, &valuePtr);
            uint64_t v17 = fprintf(a1, "(Int) %d");
            break;
          case kCFNumberLongType:
            uint64_t valuePtr = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberLongType, &valuePtr);
            uint64_t v17 = fprintf(a1, "(Long) %ld");
            break;
          case kCFNumberLongLongType:
            uint64_t valuePtr = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberLongLongType, &valuePtr);
            uint64_t v17 = fprintf(a1, "(LongLong) %lld");
            break;
          case kCFNumberFloatType:
            LODWORD(valuePtr) = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberFloatType, &valuePtr);
            uint64_t v17 = fprintf(a1, "(Float) %f");
            break;
          case kCFNumberDoubleType:
            uint64_t valuePtr = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberDoubleType, &valuePtr);
            uint64_t v17 = fprintf(a1, "(Double) %lf");
            break;
          case kCFNumberCFIndexType:
            uint64_t valuePtr = 0;
            CFNumberGetValue((CFNumberRef)a2, kCFNumberCFIndexType, &valuePtr);
            uint64_t v17 = fprintf(a1, "(CFIndex) %ld");
            break;
          default:
            goto LABEL_22;
        }
        return v17;
      }
LABEL_22:
      CFStringRef v9 = CFCopyDescription(a2);
      if (!v9) {
        return 0;
      }
      goto LABEL_23;
    }
    if (CFBooleanGetValue((CFBooleanRef)a2)) {
      CFTypeID v7 = "True";
    }
    else {
      CFTypeID v7 = "False";
    }
  }
  else
  {
    CFTypeID v7 = "<NULL>";
  }
  return fprintf(a1, v7);
}

uint64_t xprint_cfobject_dictionary(const __CFString *cf, __CFString *a2, uint64_t a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFStringGetTypeID())
    {
      v21.length = CFStringGetLength(cf);
      v21.location = 0;
      if (CFStringFindWithOptions(cf, @"password", v21, 1uLL, 0)) {
        a2 = @"<hidden>";
      }
    }
  }
  int v7 = *(_DWORD *)(a3 + 4);
  if (v7 >= 80) {
    int v7 = 80;
  }
  *(void *)(a3 + 16) += 4
                        * fprintf(*(FILE **)(a3 + 8), "%.*s", v7, "                                                                                ");
  if (a2 && ((CFTypeID v8 = CFGetTypeID(a2), v8 == CFDictionaryGetTypeID()) || (v9 = CFGetTypeID(a2), v9 == CFArrayGetTypeID())))
  {
    int v10 = xprint_cfobject_leaf(*(FILE **)(a3 + 8), cf);
    uint64_t v11 = *(FILE **)(a3 + 8);
    *(void *)(a3 + 16) += 4 * v10;
    int v12 = fprintf(v11, "\n");
    uint64_t v13 = *(void *)(a3 + 8);
    *(void *)(a3 + 16) += 4 * v12;
    uint64_t result = xprint_cfobject_container(v13, *(_DWORD *)(a3 + 4) + 2, a2);
  }
  else
  {
    int v15 = xprint_cfobject_leaf(*(FILE **)(a3 + 8), cf);
    CFTypeID v16 = *(FILE **)(a3 + 8);
    *(void *)(a3 + 16) += 4 * v15;
    int v17 = fprintf(v16, " : ");
    CFStringRef v18 = *(FILE **)(a3 + 8);
    *(void *)(a3 + 16) += 4 * v17;
    int v19 = xprint_cfobject_leaf(v18, a2);
    v20 = *(FILE **)(a3 + 8);
    *(void *)(a3 + 16) += 4 * v19;
    uint64_t result = fprintf(v20, "\n");
  }
  *(void *)(a3 + 16) += 4 * (int)result;
  return result;
}

uint64_t xprint_cfobject_array(const __CFString *a1, int *a2)
{
  int v5 = *a2;
  int v4 = a2[1];
  ++*a2;
  if (v4 >= 80) {
    int v4 = 80;
  }
  *((void *)a2 + 2) += 4
                       * fprintf(*((FILE **)a2 + 1), "%.*s", v4, "                                                                                ");
  if (a1 && ((CFTypeID v6 = CFGetTypeID(a1), v6 == CFDictionaryGetTypeID()) || (v7 = CFGetTypeID(a1), v7 == CFArrayGetTypeID())))
  {
    int v8 = fprintf(*((FILE **)a2 + 1), "%d\n", v5);
    uint64_t v9 = *((void *)a2 + 1);
    *((void *)a2 + 2) += 4 * v8;
    uint64_t result = xprint_cfobject_container(v9, a2[1] + 2, a1);
  }
  else
  {
    int v11 = fprintf(*((FILE **)a2 + 1), "%d : ", v5);
    int v12 = (FILE *)*((void *)a2 + 1);
    *((void *)a2 + 2) += 4 * v11;
    int v13 = xprint_cfobject_leaf(v12, a1);
    uint64_t v14 = (FILE *)*((void *)a2 + 1);
    *((void *)a2 + 2) += 4 * v13;
    uint64_t result = fprintf(v14, "\n");
  }
  *((void *)a2 + 2) += 4 * (int)result;
  return result;
}

void sub_21C4CB0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
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

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_21C4CE9D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4CFAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C4CFF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C4D0828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21C4D0A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t maskLeadingBitsCount(unsigned __int8 *a1)
{
  int v1 = a1[1];
  if (v1 == 30)
  {
    id v2 = a1 + 8;
    uint64_t v3 = 16;
  }
  else
  {
    if (v1 != 2) {
      return 0;
    }
    id v2 = a1 + 4;
    uint64_t v3 = 4;
  }
  uint64_t result = 0;
  uint64_t v5 = 8 * v3;
  while (1)
  {
    int v7 = *v2++;
    int v6 = v7;
    if (v7 != 255) {
      break;
    }
    result += 8;
    if (v5 == result) {
      return result;
    }
  }
  if (v6 <= 239)
  {
    switch(v6)
    {
      case 128:
        ++result;
        break;
      case 192:
        result += 2;
        break;
      case 224:
        result += 3;
        break;
    }
  }
  else if (v6 > 251)
  {
    if (v6 == 254)
    {
      result += 7;
    }
    else if (v6 == 252)
    {
      result += 6;
    }
  }
  else if (v6 == 240)
  {
    result += 4;
  }
  else if (v6 == 248)
  {
    result += 5;
  }
  return result;
}

void sub_21C4D5868(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4D5DA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4D5E70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4D6694(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21C4D6744(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *attributionReasonString(unsigned int a1)
{
  if (a1 > 6) {
    return @"reason-unknown-type";
  }
  else {
    return *(&off_264405438 + (int)a1);
  }
}

__CFString *sockaddrForLogging(const sockaddr *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 && !getnameinfo(a1, a1->sa_len, v4, 0x39u, v3, 6u, 10))
  {
    v4[56] = 0;
    v3[5] = 0;
    int v1 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%s:%s", v4, v3);
  }
  else
  {
    int v1 = @"?";
  }
  return v1;
}

BOOL sockaddrsHavePortDiffOnly(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 != *(unsigned __int8 *)(a2 + 1)) {
    return 0;
  }
  if (v2 == 30)
  {
    if (*(void *)(a1 + 8) != *(void *)(a2 + 8) || *(void *)(a1 + 16) != *(void *)(a2 + 16)) {
      return 0;
    }
  }
  else if (v2 != 2 || *(_DWORD *)(a1 + 4) != *(_DWORD *)(a2 + 4))
  {
    return 0;
  }
  return *(unsigned __int16 *)(a1 + 2) != *(unsigned __int16 *)(a2 + 2);
}

id pid_to_uuid_string(int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  memset(buffer, 0, sizeof(buffer));
  int v1 = proc_pidinfo(a1, 17, 1uLL, buffer, 56);
  int v2 = 0;
  if (v1 == 56)
  {
    memset(v4, 0, 37);
    uuid_unparse_upper((const unsigned __int8 *)buffer, (char *)v4);
    int v2 = [NSString stringWithUTF8String:v4];
  }
  return v2;
}

BOOL pid_is_valid(int a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  memset(v2, 0, sizeof(v2));
  return proc_pidinfo(a1, 13, 1uLL, v2, 64) == 64;
}

uint64_t uuid_to_pid(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  *(void *)int v13 = 0x600000001;
  *(_DWORD *)count = 0;
  size_t v9 = 4;
  if (sysctl(v13, 2u, count, &v9, 0, 0) < 0)
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else
  {
    if (!*(_DWORD *)count
      || (*(_DWORD *)count & 0x80000000) != 0
      || (int v2 = malloc_type_calloc(*(int *)count, 4uLL, 0xF1748037uLL)) == 0)
    {
      __break(1u);
    }
    uint64_t v3 = v2;
    *(void *)uu2 = 0;
    uint64_t v12 = 0;
    [v1 getUUIDBytes:uu2];
    int v4 = proc_listallpids(v3, 4 * *(_DWORD *)count);
    if (v4 < 1)
    {
LABEL_10:
      uint64_t v7 = 0xFFFFFFFFLL;
    }
    else
    {
      uint64_t v5 = v4;
      uint64_t v6 = (int *)v3;
      while (1)
      {
        memset(&count[4], 0, 56);
        if (proc_pidinfo(*v6, 17, 1uLL, &count[4], 56) == 56 && !uuid_compare(&count[4], uu2)) {
          break;
        }
        ++v6;
        if (!--v5) {
          goto LABEL_10;
        }
      }
      uint64_t v7 = *v6;
    }
    free(v3);
  }

  return v7;
}

uint64_t pid_to_coalitionid(int a1)
{
  uint64_t v3 = 0;
  memset(v2, 0, sizeof(v2));
  if (proc_pidinfo(a1, 20, 1uLL, v2, 40) == 40) {
    return *(void *)&v2[0];
  }
  else {
    return 1;
  }
}

id pid_to_coalition_bundleid(int a1)
{
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  id v1 = 0;
  if (proc_pidinfo(a1, 20, 1uLL, v9, 40) == 40) {
    unint64_t v2 = *(void *)&v9[0];
  }
  else {
    unint64_t v2 = 1;
  }
  if (v2 >= 2)
  {
    uint64_t v3 = xpc_coalition_copy_info();
    int v4 = (void *)v3;
    if (v3 && MEMORY[0x21D4A87B0](v3) == MEMORY[0x263EF8708])
    {
      string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF8300]);
      if (string)
      {
        id v1 = [NSString stringWithUTF8String:string];
        goto LABEL_8;
      }
      uint64_t v7 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF8308]);
      if (v7)
      {
        int v8 = [NSString stringWithUTF8String:v7];
        id v1 = stringByRemovingTrailingUUIDsAndLaunchServicesStuff(v8);

        goto LABEL_8;
      }
    }
    id v1 = 0;
LABEL_8:
  }
  return v1;
}

id stringByRemovingTrailingUUIDsAndLaunchServicesStuff(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1;
  if (!v1 || (uint64_t v3 = [v1 length]) == 0)
  {
    id v9 = 0;
    goto LABEL_19;
  }
  unint64_t v4 = v3;
  int v5 = [v2 characterAtIndex:v3 - 1];
  unint64_t v6 = [@"com.apple.xpc.launchd.oneshot" length];
  if (((v5 << 24) - 788529153) < 0xAFFFFFF || ((v5 << 24) - 1073741825) <= 0x6FFFFFE)
  {
    if (stringByRemovingTrailingUUIDsAndLaunchServicesStuff_pred != -1) {
      dispatch_once(&stringByRemovingTrailingUUIDsAndLaunchServicesStuff_pred, &__block_literal_global_3);
    }
    objc_msgSend((id)stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex, "stringByReplacingMatchesInString:options:range:withTemplate:", v2, 0, 0, objc_msgSend(v2, "length"), &stru_26CCA59A8);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v4 <= v6
    || [v2 characterAtIndex:v6 - 1] != 116
    || ![v2 hasPrefix:@"com.apple.xpc.launchd.oneshot"])
  {
    id v8 = v2;
LABEL_18:
    id v9 = v8;
    goto LABEL_19;
  }
  uint64_t v10 = [v2 componentsSeparatedByString:@"."];
  if ([v10 count] == 7
    && ([v10 objectAtIndexedSubscript:5],
        int v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 hasPrefix:@"0x"],
        v11,
        v12))
  {
    int v13 = (void *)[v10 mutableCopy];
    [v13 removeObjectAtIndex:5];
    id v9 = [v13 componentsJoinedByString:@"."];
  }
  else
  {
    id v9 = v2;
  }

LABEL_19:
  return v9;
}

void __stringByRemovingTrailingUUIDsAndLaunchServicesStuff_block_invoke()
{
  id v3 = 0;
  uint64_t v0 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(\\.[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}\\Z|\\.[0-9]+\\Z|\\A\\[0x[a-fA-F0-9]+-0x[a-fA-F0-9]+\\]\\.)" options:0 error:&v3];
  id v1 = v3;
  unint64_t v2 = (void *)stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex;
  stringByRemovingTrailingUUIDsAndLaunchServicesStuff_regex = v0;
}

id pid_to_coalitionID(int a1)
{
  if (pid_to_coalitionID_onceToken != -1) {
    dispatch_once(&pid_to_coalitionID_onceToken, &__block_literal_global_17);
  }
  unint64_t v2 = pid_to_coalition_bundleid(a1);
  if (!v2) {
    goto LABEL_6;
  }
  id v3 = [(id)sLSPlugInKitProxyClass pluginKitProxyForIdentifier:v2];
  if (!v3
    || (unint64_t v4 = v3,
        [v3 containingBundle],
        int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 bundleIdentifier],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v6))
  {
LABEL_6:
    id v6 = v2;
  }

  return v6;
}

void __pid_to_coalitionID_block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  sCoreServicesDylibHandle = (uint64_t)dlopen((const char *)gCoreServicesFrameworkPath, 4);
  if (!sCoreServicesDylibHandle
    || ((Class Class = objc_getClass("LSPlugInKitProxy"), sLSPlugInKitProxyClass Class = (uint64_t)Class, sCoreServicesDylibHandle)
      ? (BOOL v1 = Class == 0)
      : (BOOL v1 = 1),
        v1))
  {
    unint64_t v2 = NStatGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      int v3 = 134218240;
      uint64_t v4 = sCoreServicesDylibHandle;
      __int16 v5 = 2048;
      uint64_t v6 = sLSPlugInKitProxyClass;
      _os_log_impl(&dword_21C4BC000, v2, OS_LOG_TYPE_FAULT, "procinfo utils plugin mMapping dylib lookup failure handle %p plugin proxy class %p", (uint8_t *)&v3, 0x16u);
    }
  }
}

id dateStringMillisecondsFromTimeInterval(long double a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *(void *)__src = 0;
  uint64_t v15 = 0;
  __int16 v17 = 0;
  uint64_t v16 = 0;
  time_t v10 = (uint64_t)a1;
  if ((uint64_t)a1 <= 0)
  {
    time(&v10);
    a1 = 0.0;
  }
  double __y = 0.0;
  double v1 = modf(a1, &__y);
  unint64_t v2 = localtime(&v10);
  int v3 = (void *)strftime(__src, 0x1AuLL, "%Y-%m-%d %H:%M:%S %z", v2);
  if (v3)
  {
    __int16 v8 = 0;
    *(_DWORD *)__str = 0;
    if (snprintf(__str, 6uLL, "%.3f", v1))
    {
      *(void *)__dst = 0;
      uint64_t v12 = 0;
      memset(v13, 0, sizeof(v13));
      uint64_t v4 = stpncpy(__dst, __src, 0x13uLL);
      __int16 v5 = stpncpy(v4, &__str[1], 4uLL);
      stpncpy(v5, (const char *)&v16 + 3, 6uLL);
      HIBYTE(v13[6]) = 0;
      int v3 = (void *)[[NSString alloc] initWithCString:__dst encoding:1];
    }
    else
    {
      int v3 = 0;
    }
  }
  return v3;
}

id dateStringMillisecondsFromReferenceInterval(double a1)
{
  return dateStringMillisecondsFromTimeInterval(a1 + 978307200.0);
}

id timeStringMillisecondsFromTimeInterval(long double a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(__src, 0, 15);
  double __y = 0.0;
  time_t v10 = (uint64_t)a1;
  double v1 = modf(a1, &__y);
  unint64_t v2 = localtime(&v10);
  int v3 = (void *)strftime(__src, 0xFuLL, "%H:%M:%S %z", v2);
  if (v3)
  {
    __int16 v8 = 0;
    *(_DWORD *)__str = 0;
    if (snprintf(__str, 6uLL, "%.3f", v1))
    {
      *(void *)__dst = 0;
      memset(v12, 0, 11);
      uint64_t v4 = stpncpy(__dst, __src, 8uLL);
      __int16 v5 = stpncpy(v4, &__str[1], 4uLL);
      stpncpy(v5, &__src[8], 6uLL);
      BYTE2(v12[1]) = 0;
      int v3 = (void *)[[NSString alloc] initWithCString:__dst encoding:1];
    }
    else
    {
      int v3 = 0;
    }
  }
  return v3;
}

id timeStringMillisecondsFromReferenceInterval(double a1)
{
  return timeStringMillisecondsFromTimeInterval(a1 + 978307200.0);
}

void NStatManagerSetQueuePriority_cold_1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_error_impl(&dword_21C4BC000, log, OS_LOG_TYPE_ERROR, "Attempt to use obsolete NStatManagerSetQueuePriority() function", v1, 2u);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
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

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50A8](alloc, data, *(void *)&encoding);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
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

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x270ED7EA8](a1, a2, *(void *)&a3, a4, a5);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

int asxprintf(char **__ret, printf_domain_t __domain, locale_t __loc, const char *__format, ...)
{
  return MEMORY[0x270ED8698](__ret, __domain, __loc, __format);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x270ED9478](queue, relative_priority_ptr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x270ED9CA8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
}

uint64_t ne_session_map_interface_to_provider_uuid()
{
  return MEMORY[0x270EDA648]();
}

printf_domain_t new_printf_domain(void)
{
  return (printf_domain_t)MEMORY[0x270EDA700]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

int register_printf_domain_function(printf_domain_t __domain, int __spec, printf_function *__render, printf_arginfo_function *__arginfo, void *__context)
{
  return MEMORY[0x270EDB1C8](__domain, *(void *)&__spec, __render, __arginfo, __context);
}

int register_printf_domain_render_std(printf_domain_t __domain, const char *__specs)
{
  return MEMORY[0x270EDB1D0](__domain, __specs);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
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

char *__cdecl stpncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB588](__dst, __src, __n);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vasxprintf(char **__ret, printf_domain_t __domain, locale_t __loc, const char *__format, va_list __ap)
{
  return MEMORY[0x270EDBA60](__ret, __domain, __loc, __format, __ap);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x270EDBE10]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}