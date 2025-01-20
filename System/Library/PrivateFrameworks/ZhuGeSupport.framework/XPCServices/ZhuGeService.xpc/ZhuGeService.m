void sub_100004794(id a1)
{
  initPthreadRecursiveMutex(&stru_10001A050);
}

uint64_t sub_1000054B4(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke", 317, @"Connection to \"%@\" invalidated!", v2, v3, v4, @"com.apple.ZhuGeInternalService");
  [*(id *)(a1 + 32) setXpcProxy:0];
  v5 = (pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex];
  return pthread_mutex_unlock(v5);
}

uint64_t sub_10000553C(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke_2", 323, @"Connection to \"%@\" interrupted!", v2, v3, v4, @"com.apple.ZhuGeInternalService");
  [*(id *)(a1 + 32) setXpcProxy:0];
  v5 = (pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex];
  return pthread_mutex_unlock(v5);
}

uint64_t sub_1000055C4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  pthread_mutex_lock((pthread_mutex_t *)[v3 recursiveMutex]);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m", "+[ZhuGeInternalSupportAssistant getXpcProxyWithError:]_block_invoke_3", 333, @"Internal connection failed to provide a synchronized proxy, error : %@!", v5, v6, v7, (uint64_t)v4);

  [*(id *)(a1 + 32) setXpcProxy:0];
  v8 = (pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex];
  return pthread_mutex_unlock(v8);
}

void sub_1000057D0(id a1)
{
}

void ZhuGeLog(int a1, const char *a2, const char *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  kern_return_t (__cdecl **v23)(io_object_t);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __CFString **v37;
  FILE *v38;
  id v39;
  FILE *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  const char *v44;
  uint8_t buf[4];
  id v46;

  id v13 = a5;
  v18 = v13;
  if (a2) {
    v19 = a2;
  }
  else {
    v19 = "UnknownFile";
  }
  if (a3) {
    v20 = a3;
  }
  else {
    v20 = "UnknownFunc";
  }
  if (!v13)
  {
    if (qword_10001A128 != -1) {
      dispatch_once(&qword_10001A128, &stru_1000144C8);
    }
    if (byte_10001A120) {
      ZhuGePrintStderr("/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeLog.m", "ZhuGeLog", 183, @"Catch the NULL format pointer from: %s %s(%ld)", v14, v15, v16, v17, (uint64_t)v19);
    }
    goto LABEL_24;
  }
  if ((a1 & 0x40000) != 0 && !hasZhuGeLogConditionalPrint())
  {
LABEL_24:
    id v21 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    goto LABEL_50;
  }
  id v21 = objc_alloc_init((Class)NSMutableString);
  if ((isZhuGeInRestoreOS() & 1) != 0 || hasZhuGeLogPrefixPidTid())
  {
    if (qword_10001A100 != -1) {
      dispatch_once(&qword_10001A100, &stru_100014460);
    }
    [v21 appendFormat:@"%@", qword_10001A108];
  }
  if (qword_10001A128 != -1) {
    dispatch_once(&qword_10001A128, &stru_1000144C8);
  }
  v22 = &off_10001A000;
  v23 = &IOObjectRelease_ptr;
  if (byte_10001A120 && hasZhuGeLogPrefixFileFuncLine())
  {
    v24 = +[NSString stringWithUTF8String:v19];
    v25 = [v24 lastPathComponent];
    v26 = +[NSString stringWithUTF8String:v20];
    v27 = +[NSNumber numberWithLong:a4];
    v28 = +[NSString stringWithFormat:@"<%@ %@(%@)>", v25, v26, v27, 0];

    v23 = &IOObjectRelease_ptr;
    v22 = &off_10001A000;

    [v21 appendFormat:@"%@", v28];
  }
  else
  {
    v28 = 0;
  }
  objc_msgSend(v21, "appendFormat:", @"%s: ", (&off_100014480)[BYTE1(a1)]);
  v29 = [objc_alloc((Class)v23[108]) initWithFormat:v18 arguments:&a9];
  if ([v29 hasSuffix:@"\n"])
  {
    v31 = objc_msgSend(v29, "substringToIndex:", (char *)objc_msgSend(v29, "length") - 1);

    v29 = (id)v31;
  }
  v30 = [v23[108] stringWithFormat:@"%@%@", v21, v29];
  if (!isZhuGeInRestoreOS())
  {
    if ((a1 & 0x10000) != 0)
    {
      v37 = v22;
      v38 = __stdoutp;
      v39 = v29;
      v44 = (const char *)[v39 UTF8String];
      v40 = v38;
      v22 = v37;
      fprintf(v40, "%s\n", v44);
      if ((a1 & 0x20000) != 0)
      {
        v29 = v39;
        goto LABEL_50;
      }
    }
    if (qword_10001A110 != -1) {
      dispatch_once(&qword_10001A110, &stru_1000144A8);
    }
    if (qword_10001A128 != -1) {
      dispatch_once(&qword_10001A128, &stru_1000144C8);
    }
    if (*((unsigned char *)v22 + 288))
    {
      v41 = qword_10001A118;
      if (!os_log_type_enabled((os_log_t)qword_10001A118, (os_log_type_t)a1)) {
        goto LABEL_50;
      }
      *(_DWORD *)buf = 138543362;
      v46 = v30;
    }
    else
    {
      if ((a1 & 0x80410) == 0) {
        goto LABEL_50;
      }
      v41 = qword_10001A118;
      if (!os_log_type_enabled((os_log_t)qword_10001A118, (os_log_type_t)a1)) {
        goto LABEL_50;
      }
      *(_DWORD *)buf = 138543362;
      v46 = v30;
    }
    _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)a1, "%{public}@", buf, 0xCu);
    goto LABEL_50;
  }
  v30 = v30;
  if (isZhuGeInRestoreOS())
  {
    if (qword_10001A130 != -1) {
      dispatch_once(&qword_10001A130, &stru_1000144E8);
    }
    pthread_mutex_lock(&stru_10001A138);
    v32 = (void *)qword_10001A178;
    if (qword_10001A178) {
      goto LABEL_34;
    }
    v33 = +[ZhuGeSingletonService sharedInstance];
    v34 = [v33 xpcConnection];
    v35 = [v34 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014528];
    v36 = (void *)qword_10001A178;
    qword_10001A178 = v35;

    v32 = (void *)qword_10001A178;
    if (qword_10001A178)
    {
LABEL_34:
      [v32 printRemoteLog:v30];
    }
    else
    {
      v42 = objc_msgSend(v23[108], "stringWithFormat:", @"%s ERR: Failed to get a restore log proxy!", "[ZhuGe]");
      sub_100006290(v42);

      v43 = [v23[108] stringWithFormat:@"%s %@", "[ZhuGe]", v30];
      sub_100006290(v43);
    }
  }
  pthread_mutex_unlock(&stru_10001A138);

LABEL_50:
}

uint64_t ZhuGePrintStderr(char *a1, const char *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = a4;
  id v13 = v12;
  if (!a1) {
    a1 = "UnknownFile";
  }
  if (!a2) {
    a2 = "UnknownFunc";
  }
  if (v12)
  {
    if (qword_10001A128 != -1) {
      dispatch_once(&qword_10001A128, &stru_1000144C8);
    }
    if (byte_10001A120)
    {
      uint64_t v14 = strrchr(a1, 47);
      if (v14) {
        uint64_t v15 = v14 + 1;
      }
      else {
        uint64_t v15 = a1;
      }
      +[NSString stringWithFormat:@"%s <%s %s(%ld)> ERR: ", "[ZhuGe]", v15, a2, a3];
    }
    else
    {
      +[NSString stringWithFormat:@"%s ERR: ", "[ZhuGe]", v27, v28, v29];
    uint64_t v17 = };
    id v18 = [objc_alloc((Class)NSString) initWithFormat:v13 arguments:&a9];
    v19 = objc_msgSend(v18, "substringFromIndex:", (char *)objc_msgSend(v18, "length") - 1);
    unsigned int v20 = [v19 isEqualToString:@"\n"];

    if (v20)
    {
      uint64_t v21 = objc_msgSend(v18, "substringToIndex:", (char *)objc_msgSend(v18, "length") - 1);

      id v18 = (id)v21;
    }
    v22 = __stderrp;
    id v23 = v17;
    v24 = (const char *)[v23 UTF8String];
    id v25 = v18;
    uint64_t v16 = fprintf(v22, "%s%s\n", v24, (const char *)[v25 UTF8String]);
  }
  else
  {
    if (qword_10001A128 != -1) {
      dispatch_once(&qword_10001A128, &stru_1000144C8);
    }
    if (byte_10001A120) {
      fprintf(__stderrp, "%s <ZhuGeLog.m %s(%d)> ERR: Catched NULL format pointer from: %s %s(%ld)\n", "[ZhuGe]", "ZhuGePrintStderr", 309, a1, a2, a3);
    }
    uint64_t v16 = 0xFFFFFFFFLL;
  }

  return v16;
}

void sub_1000060E0(id a1)
{
  __uint64_t v3 = 0;
  if (pthread_threadid_np(0, &v3)) {
    __uint64_t v3 = mach_thread_self();
  }
  uint64_t v1 = +[NSString stringWithFormat:@"{%d:0x%llx}", getpid(), v3];
  uint64_t v2 = (void *)qword_10001A108;
  qword_10001A108 = v1;
}

void sub_10000615C(id a1)
{
  qword_10001A118 = (uint64_t)os_log_create("com.apple.zhuge", "ZhuGeService");
  _objc_release_x1();
}

void sub_1000061A0(id a1)
{
  if ((isZhuGeInInternalBuild() & 1) != 0 || isZhuGeInFactoryBuild())
  {
    LOBYTE(v1) = islibtraceSimulatingCustomerBuild() ^ 1;
  }
  else
  {
    int v1 = isZhuGeInRestoreOS();
    if (v1) {
      LOBYTE(v1) = doesZhuGeDeemRestoreOSAsInternal();
    }
  }
  byte_10001A120 = v1;
}

void sub_1000061E4(id a1)
{
}

void sub_1000061F0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  pthread_mutex_lock(&stru_10001A138);
  __uint64_t v3 = +[NSString stringWithFormat:@"%s ERR: Restore log connection error: %@", "[ZhuGe]", v2];

  sub_100006290(v3);
  id v4 = (void *)qword_10001A178;
  qword_10001A178 = 0;

  pthread_mutex_unlock(&stru_10001A138);
}

void sub_100006290(void *a1)
{
  id v2 = a1;
  if (qword_10001A180 != -1) {
    dispatch_once(&qword_10001A180, &stru_100014548);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_10001A188, 0xFFFFFFFFFFFFFFFFLL);
  int v1 = (FILE *)qword_10001A190;
  if (qword_10001A190 || (int v1 = fopen("/dev/console", "w"), (qword_10001A190 = (uint64_t)v1) != 0))
  {
    [v2 UTF8String];
    fprintf(v1, "%s\n");
  }
  else
  {
    fprintf(__stderrp, "%s ERR: Cannot print serial log!\n");
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_10001A188);
}

void sub_100006388(id a1)
{
  qword_10001A188 = (uint64_t)dispatch_semaphore_create(1);
  _objc_release_x1();
}

uint64_t initPthreadRecursiveMutex(pthread_mutex_t *a1)
{
  v3.__sig = 0;
  *(void *)v3.__opaque = 0;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = pthread_mutexattr_init(&v3);
  if (!result)
  {
    uint64_t result = pthread_mutexattr_settype(&v3, 2);
    if (!result) {
      return pthread_mutex_init(a1, &v3);
    }
  }
  return result;
}

uint64_t isZhuGeInInternalBuild()
{
  if (qword_10001A1A0 != -1) {
    dispatch_once(&qword_10001A1A0, &stru_100014568);
  }
  return byte_10001A198;
}

void sub_100006BDC(id a1)
{
  byte_10001A198 = os_variant_has_internal_content();
}

uint64_t isZhuGeInFactoryBuild()
{
  if (qword_10001A1B0 != -1) {
    dispatch_once(&qword_10001A1B0, &stru_100014588);
  }
  return byte_10001A1A8;
}

void sub_100006C48(id a1)
{
  byte_10001A1A8 = os_variant_has_factory_content();
}

uint64_t islibtraceSimulatingCustomerBuild()
{
  if (qword_10001A1C0 != -1) {
    dispatch_once(&qword_10001A1C0, &stru_1000145A8);
  }
  return byte_10001A1B8;
}

void sub_100006CB4(id a1)
{
  if (os_parse_boot_arg_int()) {
    byte_10001A1B8 = 0;
  }
}

uint64_t getZhuGeDebugOption()
{
  unsigned int v6 = 0;
  uint64_t v5 = 0;
  v0 = sub_100006DEC(@"zhuge_debug");
  if (v0)
  {
    int v1 = +[NSScanner scannerWithString:v0];
    if [v1 scanInt:&v6] && (objc_msgSend(v1, "isAtEnd"))
    {
      id v2 = v1;
      goto LABEL_7;
    }
    id v2 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v0, 0);

    if ([v2 scanHexInt:&v6] && objc_msgSend(v2, "isAtEnd"))
    {
LABEL_7:
      uint64_t v3 = v6;
      uint64_t v5 = v6;
      if (v6) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v2 = 0;
  }
  if (os_parse_boot_arg_int()) {
    uint64_t v3 = v5;
  }
  else {
    uint64_t v3 = 0;
  }
LABEL_13:

  return v3;
}

id sub_100006DEC(void *a1)
{
  int v1 = a1;
  if (!v1 || (io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options")) == 0)
  {
    unsigned int v6 = 0;
    CFProperty = 0;
    goto LABEL_12;
  }
  io_object_t v3 = v2;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, v1, kCFAllocatorDefault, 0);
  if (!CFProperty) {
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = +[NSString stringFromData:CFProperty];
      goto LABEL_9;
    }
LABEL_10:
    unsigned int v6 = 0;
    goto LABEL_11;
  }
  id v5 = CFProperty;
LABEL_9:
  unsigned int v6 = v5;
LABEL_11:
  IOObjectRelease(v3);
LABEL_12:

  return v6;
}

uint64_t hasZhuGeLogConditionalPrint()
{
  if (qword_10001A1D0 != -1) {
    dispatch_once(&qword_10001A1D0, &stru_1000145C8);
  }
  return byte_10001A1C8;
}

void sub_100006F2C(id a1)
{
  byte_10001A1C8 = getZhuGeDebugOption() & 1;
}

uint64_t hasZhuGeLogPrefixFileFuncLine()
{
  if (qword_10001A1E0 != -1) {
    dispatch_once(&qword_10001A1E0, &stru_1000145E8);
  }
  return byte_10001A1D8;
}

void sub_100006F94(id a1)
{
  byte_10001A1D8 = (getZhuGeDebugOption() & 4) != 0;
}

uint64_t hasZhuGeLogPrefixPidTid()
{
  if (qword_10001A1F0 != -1) {
    dispatch_once(&qword_10001A1F0, &stru_100014608);
  }
  return byte_10001A1E8;
}

void sub_100006FFC(id a1)
{
  byte_10001A1E8 = (getZhuGeDebugOption() & 2) != 0;
}

uint64_t doesZhuGeDeemRestoreOSAsInternal()
{
  if (qword_10001A200 != -1) {
    dispatch_once(&qword_10001A200, &stru_100014628);
  }
  return byte_10001A1F8;
}

void sub_100007064(id a1)
{
  byte_10001A1F8 = (getZhuGeDebugOption() & 8) != 0;
}

uint64_t isZhuGeInRestoreOS()
{
  if (qword_10001A210 != -1) {
    dispatch_once(&qword_10001A210, &stru_100014648);
  }
  return byte_10001A208;
}

void sub_1000070CC(id a1)
{
  char v1 = os_parse_boot_arg_int();
  io_registry_entry_t v2 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
  if (v2)
  {
    id v5 = v2;
    io_object_t v3 = [v2 objectForKeyedSubscript:@"ReleaseType"];
    unsigned __int8 v4 = [v3 isEqualToString:@"Restore"];

    io_registry_entry_t v2 = v5;
  }
  else
  {
    unsigned __int8 v4 = 0;
  }
  byte_10001A208 = v1 & v4;
}

id isObjectNSStringAndZhuGeNull(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = [v1 isEqualToString:@"ZHUGE_NULL"];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t isObjectNilOrZhuGeNull(void *a1)
{
  if (a1) {
    return (uint64_t)isObjectNSStringAndZhuGeNull(a1);
  }
  else {
    return 1;
  }
}

id getZhuGeFDIPathsWithError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v91 = 0;
  if (!a1)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "getZhuGeFDIPathsWithError", 782, @"error p-pointer is nil!", a6, a7, a8, v82);
    id v16 = 0;
LABEL_44:
    v26 = 0;
    v77 = 0;
    v78 = 0;
    id v17 = 0;
    goto LABEL_45;
  }
  *a1 = 0;
  if (!sub_100007B34()
    || !sub_100007C04()
    || !sub_100007B34()
    || !sub_100007E14()
    || !sub_100007B34()
    || !sub_100007F54()
    || !sub_100007B34()
    || !sub_100008094())
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "getZhuGeFDIPathsWithError", 791, @"Failed to link mobile storage framework", v9, v10, v11, v82);
    +[NSError errorWithZhuGeErrorCode:13 underlyingError:0];
    id v16 = 0;
    v26 = 0;
    v77 = 0;
    v78 = 0;
    id v17 = 0;
    *a1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  id v12 = (uint64_t (*)(void, void **))sub_100007C04();
  if (!v12) {
    sub_10000CB3C();
  }
  id v16 = (id)v12(0, &v91);
  if (!v16)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "getZhuGeFDIPathsWithError", 801, @"Failed to lookup mobile storage devices", v13, v14, v15, v82);
    v81 = v91;
    *a1 = +[NSError errorWithZhuGeErrorCode:4 underlyingError:v91];

    goto LABEL_44;
  }
  id v17 = objc_alloc_init((Class)NSMutableArray);
  if ([v16 count])
  {
    v83 = v17;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v16 = v16;
    id v21 = [v16 countByEnumeratingWithState:&v87 objects:v92 count:16];
    if (!v21)
    {
      v26 = 0;
      v84 = 0;
      v85 = 0;
      goto LABEL_49;
    }
    id v25 = v21;
    v26 = 0;
    v84 = 0;
    v85 = 0;
    uint64_t v27 = *(void *)v88;
    uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m";
    uint64_t v29 = "getZhuGeFDIPathsWithError";
    while (1)
    {
      v30 = 0;
      id v86 = v25;
      do
      {
        if (*(void *)v88 != v27) {
          objc_enumerationMutation(v16);
        }
        v31 = *(void **)(*((void *)&v87 + 1) + 8 * (void)v30);
        ZhuGeLog(262400, v28, v29, 815, @"Checking entry %@", v22, v23, v24, (uint64_t)v31);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          ZhuGeLog(262656, v28, v29, 818, @"Entry %@ is not a dictionary", v32, v33, v34, (uint64_t)v31);
          goto LABEL_34;
        }
        v35 = (void *)sub_100007E14();
        if (!v35) {
          sub_10000CB3C();
        }
        v36 = v29;
        v37 = v28;
        v38 = (void *)*v35;
        v39 = [v31 objectForKeyedSubscript:*v35];

        if (!v39)
        {
          uint64_t v28 = v37;
          v71 = v37;
          uint64_t v29 = v36;
          ZhuGeLog(262656, v71, v36, 824, @"Entry %@ doesn't contain a valid device type", v40, v41, v42, (uint64_t)v31);
          v26 = 0;
          goto LABEL_34;
        }
        v43 = (void *)sub_100007F54();
        if (!v43) {
          sub_10000CB3C();
        }
        uint64_t v44 = v27;
        id v45 = v16;
        v46 = (void *)*v43;
        unsigned __int8 v47 = [v39 isEqualToString:*v43];

        if ((v47 & 1) == 0)
        {
          uint64_t v28 = v37;
          v72 = v37;
          uint64_t v29 = v36;
          ZhuGeLog(262656, v72, v36, 829, @"Device type in entry %@ is not disk image", v48, v49, v50, (uint64_t)v31);
          goto LABEL_32;
        }
        v51 = [v31 objectForKeyedSubscript:@"PersonalizedImageType"];

        if (!v51)
        {
          uint64_t v28 = v37;
          v73 = v37;
          uint64_t v29 = v36;
          ZhuGeLog(262656, v73, v36, 834, @"Entry %@ doesn't contain personalized image type", v52, v53, v54, (uint64_t)v31);
          goto LABEL_32;
        }
        v55 = [v31 objectForKeyedSubscript:@"PersonalizedImageType"];

        if (!v55)
        {
          uint64_t v28 = v37;
          v74 = v37;
          uint64_t v29 = v36;
          ZhuGeLog(262656, v74, v36, 840, @"Entry %@ doesn't contain a valid personalized image type", v56, v57, v58, (uint64_t)v31);
          v85 = 0;
LABEL_32:
          v26 = v39;
LABEL_33:
          id v16 = v45;
          uint64_t v27 = v44;
          id v25 = v86;
          goto LABEL_34;
        }
        uint64_t v28 = v37;
        if (([v55 isEqualToString:@"FactoryDiskImage"] & 1) == 0)
        {
          v75 = v37;
          uint64_t v29 = v36;
          ZhuGeLog(262656, v75, v36, 845, @"Entry %@ doesn't contain a correct personalized image type", v59, v60, v61, (uint64_t)v31);
          v26 = v39;
          v85 = v55;
          goto LABEL_33;
        }
        v62 = v37;
        uint64_t v29 = v36;
        ZhuGeLog(262400, v62, v36, 849, @"The entry %@ mounted personalized disk image with type %@", v59, v60, v61, (uint64_t)v31);
        v63 = (void *)sub_100007848();
        uint64_t v64 = [v31 objectForKeyedSubscript:v63];

        if (v64)
        {
          [v83 addObject:v64];
          ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", v29, 857, @"Added %@ to FDI paths array", v68, v69, v70, v64);
          v26 = v39;
          v84 = (void *)v64;
          v85 = v55;
          id v16 = v45;
          uint64_t v27 = v44;
          uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m";
        }
        else
        {
          uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m";
          ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", v29, 852, @"Entry %@ doesn't contain a valid personalized disk image path", v65, v66, v67, (uint64_t)v31);
          v84 = 0;
          v85 = v55;
          v26 = v39;
          id v16 = v45;
          uint64_t v27 = v44;
        }
        id v25 = v86;
LABEL_34:
        v30 = (char *)v30 + 1;
      }
      while (v25 != v30);
      id v76 = [v16 countByEnumeratingWithState:&v87 objects:v92 count:16];
      id v25 = v76;
      if (!v76)
      {
LABEL_49:

        id v17 = v83;
        v78 = v84;
        v77 = v85;
        goto LABEL_45;
      }
    }
  }
  ZhuGeLog(262656, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "getZhuGeFDIPathsWithError", 810, @"No mobile storage device is detected", v18, v19, v20, v82);
  v26 = 0;
  v77 = 0;
  v78 = 0;
LABEL_45:
  id v79 = v17;

  return v79;
}

uint64_t sub_100007848()
{
  uint64_t v0 = sub_100008094();
  if (!v0) {
    sub_10000CB3C();
  }
  return *(void *)v0;
}

uint64_t isXPCConnectionEntitled(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v8 = v4;
  if (!v3)
  {
    id v12 = @"XPC connection is invalid!";
    uint64_t v13 = 971;
LABEL_8:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "isXPCConnectionEntitled", v13, v12, v5, v6, v7, v16);
    uint64_t v11 = 0;
    goto LABEL_9;
  }
  if (v4)
  {
    if ((isObjectNSStringAndZhuGeNull(v4) & 1) == 0)
    {
      uint64_t v9 = [v3 valueForEntitlement:v8];
      unsigned __int8 v10 = [v9 BOOLValue];

      if ((v10 & 1) == 0)
      {
        id v14 = [v3 processIdentifier];
        id v12 = @"Connection(pid %d) is missing entitlement!";
        uint64_t v16 = (uint64_t)v14;
        uint64_t v13 = 983;
        goto LABEL_8;
      }
    }
  }
  uint64_t v11 = 1;
LABEL_9:

  return v11;
}

id MGQuery(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v7 = v3;
  if (!a2)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "MGQuery", 1541, @"error p-pointer is nil!", v4, v5, v6, v20);
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  *a2 = 0;
  if (v3)
  {
    if (MGIsQuestionValid())
    {
      uint64_t v11 = (void *)MGCopyAnswerWithError();
      if (v11) {
        goto LABEL_11;
      }
      id v12 = +[NSNumber numberWithInt:0];
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "MGQuery", 1561, @"Failed to query MobileGestalt for \"%@\", MobileGestalt error code %@!", v13, v14, v15, (uint64_t)v7);

      uint64_t v16 = +[NSNumber numberWithInt:0];
      id v17 = +[NSString stringWithFormat:@"Failed to query MobileGestalt for \"%@\", MobileGestalt error code %@!", v7, v16];
      *a2 = +[NSError errorWithZhuGeErrorCode:4 underlyingError:v17];

      goto LABEL_7;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "MGQuery", 1554, @"\"%@\" is not a vaild MobileGestalt key!", v8, v9, v10, (uint64_t)v7);
    uint64_t v18 = 3;
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeUtils.m", "MGQuery", 1547, @"MGkey pointer is nil!", v4, v5, v6, v20);
    uint64_t v18 = 45;
  }
  +[NSError errorWithZhuGeErrorCode:v18 underlyingError:0];
  uint64_t v11 = 0;
  *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v11;
}

uint64_t sub_100007B34()
{
  if (!qword_10001A218) {
    qword_10001A218 = _sl_dlopen();
  }
  return qword_10001A218;
}

uint64_t sub_100007C04()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_10001A220;
  uint64_t v6 = qword_10001A220;
  if (!qword_10001A220)
  {
    id v1 = (void *)sub_100007DB8();
    v4[3] = (uint64_t)dlsym(v1, "MobileStorageCopyDevicesWithError");
    qword_10001A220 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100007CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007CF4()
{
  uint64_t result = _sl_dlopen();
  qword_10001A218 = result;
  return result;
}

void *sub_100007D68(uint64_t a1)
{
  id v2 = (void *)sub_100007DB8();
  uint64_t result = dlsym(v2, "MobileStorageCopyDevicesWithError");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10001A220 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100007DB8()
{
  uint64_t v0 = sub_100007B34();
  if (!v0)
  {
    id v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t sub_100007E14()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_10001A228;
  uint64_t v6 = qword_10001A228;
  if (!qword_10001A228)
  {
    id v1 = (void *)sub_100007DB8();
    v4[3] = (uint64_t)dlsym(v1, "kMobileStorageDeviceTypeKey");
    qword_10001A228 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100007EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100007F04(uint64_t a1)
{
  id v2 = (void *)sub_100007DB8();
  uint64_t result = dlsym(v2, "kMobileStorageDeviceTypeKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10001A228 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100007F54()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_10001A230;
  uint64_t v6 = qword_10001A230;
  if (!qword_10001A230)
  {
    id v1 = (void *)sub_100007DB8();
    v4[3] = (uint64_t)dlsym(v1, "kMobileStorageDeviceTypeDiskImage");
    qword_10001A230 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000802C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100008044(uint64_t a1)
{
  id v2 = (void *)sub_100007DB8();
  uint64_t result = dlsym(v2, "kMobileStorageDeviceTypeDiskImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10001A230 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100008094()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_10001A238;
  uint64_t v6 = qword_10001A238;
  if (!qword_10001A238)
  {
    id v1 = (void *)sub_100007DB8();
    v4[3] = (uint64_t)dlsym(v1, "kMobileStorageMountPathKey");
    qword_10001A238 = v4[3];
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000816C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100008184(uint64_t a1)
{
  id v2 = (void *)sub_100007DB8();
  uint64_t result = dlsym(v2, "kMobileStorageMountPathKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10001A238 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100008A20(id a1)
{
  qword_10001A250 = (uint64_t)dlopen((const char *)[@"/System/Library/PrivateFrameworks/ZhuGeSupport.framework/libZhuGeArmory.dylib" UTF8String], 1);
  if (!qword_10001A250)
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getDylibHandlerWithError:]_block_invoke", 69, @"Failed to dlopen ZhuGe armory dylib!", v1, v2, v3, vars0);
    qword_10001A248 = +[NSError errorWithZhuGeErrorCode:13 underlyingError:0];
    _objc_release_x1();
  }
}

void sub_100009330(id a1)
{
}

uint64_t sub_10000933C(uint64_t a1)
{
  pthread_mutex_lock(&stru_10001A260);
  uint64_t v2 = [*(id *)(a1 + 32) serviceXpcName];
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getXpcProxyWithError:]_block_invoke_2", 235, @"Connection to \"%@\" invalidated!", v3, v4, v5, (uint64_t)v2);

  uint64_t v6 = (void *)qword_10001A2A0;
  qword_10001A2A0 = 0;

  return pthread_mutex_unlock(&stru_10001A260);
}

uint64_t sub_1000093D4(uint64_t a1)
{
  pthread_mutex_lock(&stru_10001A260);
  uint64_t v2 = [*(id *)(a1 + 32) serviceXpcName];
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getXpcProxyWithError:]_block_invoke_3", 241, @"Connection to \"%@\" interrupted!", v3, v4, v5, (uint64_t)v2);

  uint64_t v6 = (void *)qword_10001A2A0;
  qword_10001A2A0 = 0;

  return pthread_mutex_unlock(&stru_10001A260);
}

void sub_10000946C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  pthread_mutex_lock(&stru_10001A260);
  ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeSupportAssistant.m", "+[ZhuGeSupportAssistant getXpcProxyWithError:]_block_invoke_4", 251, @"Connection failed to provide a synchronized proxy, error : %@!", v3, v4, v5, (uint64_t)v2);

  uint64_t v6 = (void *)qword_10001A2A0;
  qword_10001A2A0 = 0;

  pthread_mutex_unlock(&stru_10001A260);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 activate];

  return 0;
}

void sub_10000A484(uint64_t a1)
{
  uint64_t v2 = +[ZhuGeSingletonService sharedInstance];
  uint64_t v3 = [v2 xpcConnection];
  uint64_t v4 = [*(id *)(a1 + 32) baseEntitlement];
  int v5 = isXPCConnectionEntitled(v3, v4);

  if (v5)
  {
    uint64_t v6 = +[ZhuGeSingletonService sharedInstance];
    uint64_t v7 = [v6 xpcConnection];
    uint64_t v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 processIdentifier]);
    ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService assertCallerEntitledForService]_block_invoke", 81, @"ZhuGe service connected for pid %@", v9, v10, v11, (uint64_t)v8);

    byte_10001A2B0 = 1;
  }
}

void sub_10000A90C(id a1)
{
  uint64_t v1 = [[ZhuGeCache alloc] initWithName:@"iCEK" andCapacity:&off_100017738 andCacheType:objc_opt_class()];
  uint64_t v2 = (void *)qword_10001A2C0;
  qword_10001A2C0 = (uint64_t)v1;

  uint64_t v3 = qword_10001A2C0;
  +[ZhuGeInternalSupportAssistant registerCacheRefresh:v3];
}

void sub_10000AAAC(id a1)
{
  uint64_t v1 = +[ZhuGeSingletonService sharedInstance];
  uint64_t v2 = [v1 xpcConnection];
  int v3 = isXPCConnectionEntitled(v2, @"com.apple.private.ZhuGeInternalSupport.CopyValue");

  if (v3)
  {
    uint64_t v4 = +[ZhuGeSingletonService sharedInstance];
    int v5 = [v4 xpcConnection];
    uint64_t v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 processIdentifier]);
    ZhuGeLog(524544, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeSupport/ZhuGeService/ZhuGeService.m", "-[ZhuGeService assertCallerEntitledForInternalService]_block_invoke", 164, @"ZhuGe service bridge-connected for pid %@", v7, v8, v9, (uint64_t)v6);

    byte_10001A2D8 = 1;
  }
}

void sub_10000AEE8(id a1)
{
  uint64_t v1 = [[ZhuGeCache alloc] initWithName:@"iCEIK" andCapacity:&off_100017738 andCacheType:objc_opt_class()];
  uint64_t v2 = (void *)qword_10001A2E8;
  qword_10001A2E8 = (uint64_t)v1;

  uint64_t v3 = qword_10001A2E8;
  +[ZhuGeInternalSupportAssistant registerCacheRefresh:v3];
}

void sub_10000B678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t sub_10000B6A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B6B4(uint64_t a1)
{
}

void sub_10000B6BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000BA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000BA60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000BD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000BDB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000C390(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10000C3BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000C6BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000C9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000CA0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_10000CB3C()
{
  dlerror();
  io_object_t v0 = abort_report_np();
  IOObjectRelease(v0);
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

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGIsQuestionValid()
{
  return _MGIsQuestionValid();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

mach_port_t mach_thread_self(void)
{
  return _mach_thread_self();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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
  return _objc_msgSendSuper2(a1, a2);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

uint64_t os_variant_has_factory_content()
{
  return _os_variant_has_factory_content();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return _pthread_threadid_np(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

uint64_t xpc_add_bundle()
{
  return _xpc_add_bundle();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_armoryClassName(void *a1, const char *a2, ...)
{
  return [a1 armoryClassName];
}

id objc_msgSend_assertCallerEntitledForInternalService(void *a1, const char *a2, ...)
{
  return [a1 assertCallerEntitledForInternalService];
}

id objc_msgSend_assertCallerEntitledForService(void *a1, const char *a2, ...)
{
  return [a1 assertCallerEntitledForService];
}

id objc_msgSend_baseEntitlement(void *a1, const char *a2, ...)
{
  return [a1 baseEntitlement];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDict(void *a1, const char *a2, ...)
{
  return [a1 cacheDict];
}

id objc_msgSend_cacheList(void *a1, const char *a2, ...)
{
  return [a1 cacheList];
}

id objc_msgSend_cacheType(void *a1, const char *a2, ...)
{
  return [a1 cacheType];
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return [a1 capacity];
}

id objc_msgSend_classList(void *a1, const char *a2, ...)
{
  return [a1 classList];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return [a1 clearCache];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainString(void *a1, const char *a2, ...)
{
  return [a1 domainString];
}

id objc_msgSend_dylibHandler(void *a1, const char *a2, ...)
{
  return [a1 dylibHandler];
}

id objc_msgSend_executeCacheRefresh(void *a1, const char *a2, ...)
{
  return [a1 executeCacheRefresh];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getInternalSupportPath(void *a1, const char *a2, ...)
{
  return [a1 getInternalSupportPath];
}

id objc_msgSend_helper(void *a1, const char *a2, ...)
{
  return [a1 helper];
}

id objc_msgSend_initData(void *a1, const char *a2, ...)
{
  return [a1 initData];
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

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isInternalAssistant(void *a1, const char *a2, ...)
{
  return [a1 isInternalAssistant];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_recursiveMutex(void *a1, const char *a2, ...)
{
  return [a1 recursiveMutex];
}

id objc_msgSend_remoteObjectInterface(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectInterface];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_serviceXpcName(void *a1, const char *a2, ...)
{
  return [a1 serviceXpcName];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_supportAssistantClass(void *a1, const char *a2, ...)
{
  return [a1 supportAssistantClass];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}

id objc_msgSend_xpcProxy(void *a1, const char *a2, ...)
{
  return [a1 xpcProxy];
}