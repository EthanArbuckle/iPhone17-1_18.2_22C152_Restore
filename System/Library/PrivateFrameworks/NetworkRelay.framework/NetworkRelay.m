uint64_t __nrCopyLogObj_block_invoke()
{
  uint64_t vars8;

  nrCopyLogObj_sNRLogObj = (uint64_t)os_log_create("com.apple.networkrelay", "");
  return MEMORY[0x270F9A758]();
}

id nrCopyLogObj()
{
  if (nrCopyLogObj_onceToken != -1) {
    dispatch_once(&nrCopyLogObj_onceToken, &__block_literal_global);
  }
  v0 = (void *)nrCopyLogObj_sNRLogObj;
  return v0;
}

__CFString *NRDataProtectionClassCreateString(unsigned int a1)
{
  if (a1 < 5 && ((0x1Bu >> a1) & 1) != 0) {
    return off_263FD0F70[a1];
  }
  else {
    return (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown[%lld]", a1);
  }
}

__CFString *createStringFromNRDeviceEndpointType(unsigned int a1)
{
  if ((a1 + 1) >= 9u) {
    return (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"unknown(%u)", a1);
  }
  else {
    return off_263FD0F28[(a1 + 1)];
  }
}

uint64_t __nrCopyLogObj_block_invoke_11()
{
  nrCopyLogObj_sNRLogObj_8 = (uint64_t)os_log_create("com.apple.networkrelay", "");
  return MEMORY[0x270F9A758]();
}

void sub_20A051EE0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_19()
{
  if (nrCopyLogObj_onceToken_7 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_7, &__block_literal_global_48);
  }
  v0 = (void *)nrCopyLogObj_sNRLogObj_8;
  return v0;
}

uint64_t scDynamicStoreCallout(uint64_t result, void *a2, uint64_t a3)
{
  if (a3)
  {
    if (*(void *)(a3 + 48) == result) {
      return -[NRLaunchEventMonitor processSCDUpdate:](a3, a2);
    }
  }
  return result;
}

void __NRLaunchEventMonitorCopyQueue_block_invoke()
{
  if (_NRShouldDebugAutoRelease_onceToken != -1) {
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_40);
  }
  if (_NRShouldDebugAutoRelease_debugAutoRelease)
  {
    v0 = 0;
  }
  else
  {
    v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  }
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.networkrelay.launchEventMonitor", v0);

  if (!v1)
  {
    uint64_t v3 = nrCopyLogObj_19();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      v4 = v3;
      BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (!v5)
      {
LABEL_15:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v12 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v12 = 136446466;
        *(void *)(v12 + 4) = "nr_dispatch_queue_create";
        *(_WORD *)(v12 + 12) = 2080;
        *(void *)(v12 + 14) = "com.apple.networkrelay.launchEventMonitor";
        id v13 = nrCopyLogObj_19();
        _NRLogAbortWithPack(v13);
      }
    }
    id v6 = nrCopyLogObj_19();
    _NRLogWithArgs((uint64_t)v6, 16, (uint64_t)"%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_15;
  }
  v2 = (void *)NRLaunchEventMonitorCopyQueue_queue;
  NRLaunchEventMonitorCopyQueue_queue = (uint64_t)v1;
}

uint64_t createStringFromNRLinkType(unsigned int a1)
{
  switch(a1)
  {
    case 0u:
      id v1 = [NSString alloc];
      v2 = "Invalid";
      goto LABEL_9;
    case 1u:
      id v1 = [NSString alloc];
      v2 = "Bluetooth";
      goto LABEL_9;
    case 2u:
      id v1 = [NSString alloc];
      v2 = "WiFi";
      goto LABEL_9;
    case 3u:
      id v1 = [NSString alloc];
      v2 = "Cellular";
      goto LABEL_9;
    case 4u:
      id v1 = [NSString alloc];
      v2 = "QuickRelay";
      goto LABEL_9;
    case 5u:
      id v1 = [NSString alloc];
      v2 = "Wired";
LABEL_9:
      uint64_t result = [v1 initWithUTF8String:v2];
      break;
    default:
      uint64_t result = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%lld)", a1);
      break;
  }
  return result;
}

uint64_t createStringFromNRLinkSubtype(unsigned int a1)
{
  switch(a1)
  {
    case 'e':
      id v1 = [NSString alloc];
      v2 = "WiFiInfra";
      goto LABEL_8;
    case 'f':
      id v1 = [NSString alloc];
      v2 = "WiFiP2PAWDL";
      goto LABEL_8;
    case 'g':
      id v1 = [NSString alloc];
      v2 = "WiFiP2PNAN";
      goto LABEL_8;
    case 'h':
      id v1 = [NSString alloc];
      v2 = "WiFiP2PInfraRelay";
      goto LABEL_8;
    default:
      if (a1) {
        return objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%lld)", a1);
      }
      id v1 = [NSString alloc];
      v2 = "None";
LABEL_8:
      return [v1 initWithUTF8String:v2];
  }
}

__CFString *createShortStringFromNRLinkType(char a1)
{
  if ((a1 - 1) >= 4u) {
    return (__CFString *)createStringFromNRLinkType(a1);
  }
  else {
    return off_263FD1010[(a1 - 1)];
  }
}

__CFString *createShortStringFromNRLinkSubtype(char a1)
{
  if ((a1 - 101) >= 4u) {
    return (__CFString *)createStringFromNRLinkSubtype(a1);
  }
  else {
    return off_263FD1030[(a1 - 101)];
  }
}

id nrCopyLogObj_64()
{
  if (nrCopyLogObj_onceToken_71 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_71, &__block_literal_global_55);
  }
  v0 = (void *)nrCopyLogObj_sNRLogObj_72;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_74()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_72;
  nrCopyLogObj_sNRLogObj_72 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void NRPreferP2PImmediatelySet(char a1)
{
  self;
  if (sharedInstanceForP2PImmediate_onceToken != -1) {
    dispatch_once(&sharedInstanceForP2PImmediate_onceToken, &__block_literal_global_4);
  }
  if (sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance)
  {
    v2 = *(NSObject **)(sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance + 16);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __30__NRPreferWiFi_submitRequest___block_invoke;
    v4[3] = &unk_263FD1150;
    v4[4] = sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance;
    char v5 = a1;
    id v3 = (id)sharedInstanceForP2PImmediate_gPreferP2PImmediatelyInstance;
    dispatch_async(v2, v4);
  }
}

void NRPreferP2PSet(char a1)
{
  self;
  if (sharedInstanceForP2P_onceToken != -1) {
    dispatch_once(&sharedInstanceForP2P_onceToken, &__block_literal_global_2);
  }
  if (sharedInstanceForP2P_gPreferP2PWiFiInstance)
  {
    v2 = *(NSObject **)(sharedInstanceForP2P_gPreferP2PWiFiInstance + 16);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __30__NRPreferWiFi_submitRequest___block_invoke;
    v4[3] = &unk_263FD1150;
    v4[4] = sharedInstanceForP2P_gPreferP2PWiFiInstance;
    char v5 = a1;
    id v3 = (id)sharedInstanceForP2P_gPreferP2PWiFiInstance;
    dispatch_async(v2, v4);
  }
}

void NRPreferWiFiSet(char a1)
{
  self;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_79);
  }
  if (sharedInstance_gPreferWiFiInstance)
  {
    v2 = *(NSObject **)(sharedInstance_gPreferWiFiInstance + 16);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __30__NRPreferWiFi_submitRequest___block_invoke;
    v4[3] = &unk_263FD1150;
    v4[4] = sharedInstance_gPreferWiFiInstance;
    char v5 = a1;
    id v3 = (id)sharedInstance_gPreferWiFiInstance;
    dispatch_async(v2, v4);
  }
}

__CFString *_NRCopyPolicyTrafficClassifiersDescription(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  if (v2)
  {
    if (v2 == 1)
    {
      id v3 = [v1 anyObject];
      if ([v3 isEqualToString:@"com.apple.ids.trafficclass.nanoregistry.check"])
      {
        v4 = @"Check";
      }
      else if ([v3 isEqualToString:@"com.apple.ids.trafficclass.nanoregistry.update"])
      {
        v4 = @"Update";
      }
      else if ([v3 isEqualToString:@"com.apple.ids.trafficclass.nanoregistry.configure"])
      {
        v4 = @"Configure";
      }
      else if ([v3 isEqualToString:@"com.apple.ids.trafficclass.all"])
      {
        v4 = @"All";
      }
      else
      {
        v4 = (__CFString *)[[NSString alloc] initWithFormat:@"\"%@\"", v3];
      }
    }
    else
    {
      char v5 = [v1 allObjects];
      id v6 = [v5 sortedArrayUsingSelector:sel_compare_];

      v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", @"{(");
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v3 = v6;
      uint64_t v7 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        unint64_t v8 = v7;
        uint64_t v9 = *(void *)v14;
        uint64_t v10 = "";
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v3);
          }
          [(__CFString *)v4 appendFormat:@"%s\"%@\"", v10, **((void **)&v13 + 1), (void)v13];
          if (v8 >= 2)
          {
            for (uint64_t i = 1; i != v8; ++i)
            {
              if (*(void *)v14 != v9) {
                objc_enumerationMutation(v3);
              }
              [(__CFString *)v4 appendFormat:@"%s\"%@\"", ", ", *(void *)(*((void *)&v13 + 1) + 8 * i)];
            }
          }
          unint64_t v8 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
          uint64_t v10 = ", ";
        }
        while (v8);
      }

      [(__CFString *)v4 appendString:@"}"]);
    }
  }
  else
  {
    v4 = @"Null";
  }

  return v4;
}

void sub_20A055224(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_109()
{
  if (nrCopyLogObj_onceToken_103 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_103, &__block_literal_global_104);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_105;
  return v0;
}

double __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(uint64_t a1, uint64_t a2)
{
  *(void *)&double result = 136446978;
  *(_DWORD *)a1 = 136446978;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = 0;
  *(_WORD *)(a1 + 22) = 2048;
  *(void *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 1024;
  *(_DWORD *)(a1 + 34) = 0;
  return result;
}

double __os_log_helper_1_2_3_8_34_8_0_4_0(uint64_t a1, uint64_t a2)
{
  *(void *)&double result = 136446722;
  *(_DWORD *)a1 = 136446722;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = 0;
  *(_WORD *)(a1 + 22) = 1024;
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

uint64_t __nrCopyLogObj_block_invoke_157()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_105;
  nrCopyLogObj_sNRLogObj_105 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_20A055F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __nrCopyLogObj_block_invoke_213()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_206;
  nrCopyLogObj_sNRLogObj_206 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_20A057BF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_214()
{
  if (nrCopyLogObj_onceToken_204 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_204, &__block_literal_global_205);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_206;
  return v0;
}

void sub_20A058280(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_20A05A7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A05B0FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_312()
{
  if (nrCopyLogObj_onceToken_321 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_321, &__block_literal_global_322);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_323;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_326()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_323;
  nrCopyLogObj_sNRLogObj_323 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void _NRLogSetCopyToStderr(char a1)
{
  os_unfair_lock_lock(&sNRLogLock);
  sNRCopyLogToStdErr = a1;
  os_unfair_lock_unlock(&sNRLogLock);
}

uint64_t _NRLogSetPacketLoggingState(uint64_t result)
{
  gNRPacketLoggingEnabled = result;
  return result;
}

BOOL _NRLogIsLevelEnabled(NSObject *a1, os_log_type_t a2)
{
  return sNRCopyLogToStdErr || os_log_type_enabled(a1, a2);
}

void _NRLogAbortWithPack(void *a1)
{
  id v1 = a1;
  qword_26760C960 = os_log_pack_compose();
  __break(1u);
}

__CFString *_NRCopyTimeStringForDate(void *a1)
{
  if (!a1) {
    return @"nil";
  }
  id v1 = (void *)MEMORY[0x263EFF8F0];
  id v2 = a1;
  id v3 = [v1 currentCalendar];
  v4 = [v3 components:224 fromDate:v2];
  [v2 timeIntervalSinceReferenceDate];
  double v6 = v5;

  double v7 = v6 - floor(v6) + (double)[v4 second];
  uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%02u:%02u:%07.4f", objc_msgSend(v4, "hour"), objc_msgSend(v4, "minute"), *(void *)&v7);

  return (__CFString *)v8;
}

__CFString *_NRCopyTimeString()
{
  os_log_t v0 = [MEMORY[0x263EFF910] date];
  id v1 = _NRCopyTimeStringForDate(v0);

  return v1;
}

void _NRLogRegisterSimCrashHook(void *a1)
{
  os_unfair_lock_lock(&sNRLogLock);
  sNRLogSimCrashHook = a1;
  os_unfair_lock_unlock(&sNRLogLock);
}

void _NRLogPackSend(void *a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v5 = a1;
  double v6 = v5;
  if (a3 == 17 || sNRCopyLogToStdErr)
  {
    if (os_log_type_enabled(v5, (os_log_type_t)a3))
    {
      uint64_t v7 = os_log_pack_send_and_compose();
    }
    else
    {
      mach_get_times();
      uint64_t v7 = os_log_pack_compose();
    }
    uint64_t v8 = (char *)v7;
    os_unfair_lock_lock(&sNRLogLock);
    if (sNRCopyLogToStdErr)
    {
      nrLogLevelToString();
      if ((_NRLogPackSend_sHasSetTZ & 1) == 0)
      {
        tzset();
        _NRLogPackSend_sHasSetTZ = 1;
      }
      memset(&v12, 0, sizeof(v12));
      uint64_t v9 = localtime_r((const time_t *)(a2 + 8), &v12);
      if (strftime(v13, 9uLL, "%T", v9))
      {
        v13[8] = 0;
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s %s.%04ld %s\n");
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s %s\n");
      }
    }
    uint64_t v10 = (void (*)(void))sNRLogSimCrashHook;
    os_unfair_lock_unlock(&sNRLogLock);
    if (a3 == 17 && v10)
    {
      uint64_t v11 = (void *)[[NSString alloc] initWithUTF8String:v8];
      v10();
    }
    if (v8 != &v14 && v8) {
      free(v8);
    }
  }
  else if (os_log_type_enabled(v5, (os_log_type_t)a3))
  {
    os_log_pack_send();
  }
}

const char *nrLogLevelToString()
{
  double result = "DEFLT";
  switch("DEFLT")
  {
    case 0u:
      return result;
    case 1u:
      double result = "INFO ";
      break;
    case 2u:
      double result = "DEBUG";
      break;
    case 0x10u:
      double result = "ERROR";
      break;
    case 0x11u:
      double result = "FAULT";
      break;
    default:
      double result = "?????";
      break;
  }
  return result;
}

void _NRAddEligibleNRUUIDForLogObject(void *a1)
{
  id v4 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  id v1 = (void *)sNRUUIDsEligibleForLogObject;
  if (!sNRUUIDsEligibleForLogObject)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F08760]);
    id v3 = (void *)sNRUUIDsEligibleForLogObject;
    sNRUUIDsEligibleForLogObject = (uint64_t)v2;

    id v1 = (void *)sNRUUIDsEligibleForLogObject;
  }
  [v1 addObject:v4];
  os_unfair_lock_unlock(&sNRLogLock);
}

void _NRRemoveEligibleNRUUIDForLogObject(void *a1)
{
  id v1 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  [(id)sNRUUIDsEligibleForLogObject removeObject:v1];

  os_unfair_lock_unlock(&sNRLogLock);
}

void _NRUpdateNRUUIDsEligibleForLogObjects(void *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v1 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  if ([(id)sNRUUIDToLogObject count])
  {
    id v2 = [(id)sNRUUIDToLogObject allKeys];
    id v3 = (void *)[v2 copy];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v32;
      *(void *)&long long v6 = 138412290;
      long long v25 = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          if ((objc_msgSend(v1, "containsObject:", v10, v25) & 1) == 0)
          {
            if (nrCopyLogObj_onceToken_376 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
            }
            uint64_t v11 = nrCopyLogObj_sNRLogObj_377;
            if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_377, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v25;
              uint64_t v37 = v10;
              _os_log_impl(&dword_20A04F000, v11, OS_LOG_TYPE_DEFAULT, "removing log object for %@", buf, 0xCu);
            }
            [(id)sNRUUIDToLogObject setObject:0 forKeyedSubscript:v10];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v7);
    }
  }
  if ([(id)sNRUUIDToEventLogObject count])
  {
    tm v12 = [(id)sNRUUIDToEventLogObject allKeys];
    long long v13 = (void *)[v12 copy];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v28;
      *(void *)&long long v16 = 138412290;
      long long v26 = v16;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          if ((objc_msgSend(v1, "containsObject:", v20, v26, (void)v27) & 1) == 0)
          {
            if (nrCopyLogObj_onceToken_376 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
            }
            v21 = nrCopyLogObj_sNRLogObj_377;
            if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_377, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v26;
              uint64_t v37 = v20;
              _os_log_impl(&dword_20A04F000, v21, OS_LOG_TYPE_DEFAULT, "removing event log object for %@", buf, 0xCu);
            }
            [(id)sNRUUIDToEventLogObject setObject:0 forKeyedSubscript:v20];
          }
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v17);
    }
  }
  v22 = (void *)sNRUUIDsEligibleForLogObject;
  if (!sNRUUIDsEligibleForLogObject)
  {
    id v23 = objc_alloc_init(MEMORY[0x263F08760]);
    v24 = (void *)sNRUUIDsEligibleForLogObject;
    sNRUUIDsEligibleForLogObject = (uint64_t)v23;

    v22 = (void *)sNRUUIDsEligibleForLogObject;
  }
  [v22 removeAllObjects];
  [(id)sNRUUIDsEligibleForLogObject addObjectsFromArray:v1];
  os_unfair_lock_unlock(&sNRLogLock);
}

uint64_t __nrCopyLogObj_block_invoke_379()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_377;
  nrCopyLogObj_sNRLogObj_377 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

os_log_t _NRCopyLogObjectForNRUUID(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  id v2 = (void *)sNRUUIDToLogObject;
  if (!sNRUUIDToLogObject)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = (void *)sNRUUIDToLogObject;
    sNRUUIDToLogObject = (uint64_t)v3;

    id v2 = (void *)sNRUUIDToLogObject;
  }
  uint64_t v5 = [v2 objectForKeyedSubscript:v1];
  if (v5)
  {
    os_log_t v6 = (os_log_t)v5;
    os_unfair_lock_unlock(&sNRLogLock);
    goto LABEL_5;
  }
  if (([(id)sNRUUIDsEligibleForLogObject containsObject:v1] & 1) == 0)
  {
    os_unfair_lock_unlock(&sNRLogLock);
LABEL_12:
    if (nrCopyLogObj_onceToken_376 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
    }
    os_log_t v6 = (os_log_t)(id)nrCopyLogObj_sNRLogObj_377;
    goto LABEL_5;
  }
  uint64_t v8 = [v1 UUIDString];
  uint64_t v9 = [v8 substringToIndex:13];

  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"%@", v9];
  os_log_t v6 = os_log_create("com.apple.networkrelay", (const char *)[v10 UTF8String]);
  uint64_t v11 = nrCopyLogObj_384();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v1;
    _os_log_impl(&dword_20A04F000, v11, OS_LOG_TYPE_DEFAULT, "adding log object for %@", buf, 0xCu);
  }

  [(id)sNRUUIDToLogObject setObject:v6 forKeyedSubscript:v1];
  os_unfair_lock_unlock(&sNRLogLock);
  if (!v6) {
    goto LABEL_12;
  }
LABEL_5:

  return v6;
}

id nrCopyLogObj_384()
{
  if (nrCopyLogObj_onceToken_376 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_377;
  return v0;
}

os_log_t _NRCopyEventLogObjectForNRUUID(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  os_unfair_lock_lock(&sNRLogLock);
  id v2 = (void *)sNRUUIDToEventLogObject;
  if (!sNRUUIDToEventLogObject)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = (void *)sNRUUIDToEventLogObject;
    sNRUUIDToEventLogObject = (uint64_t)v3;

    id v2 = (void *)sNRUUIDToEventLogObject;
  }
  uint64_t v5 = [v2 objectForKeyedSubscript:v1];
  if (v5)
  {
    os_log_t v6 = (os_log_t)v5;
    os_unfair_lock_unlock(&sNRLogLock);
    goto LABEL_5;
  }
  if (([(id)sNRUUIDsEligibleForLogObject containsObject:v1] & 1) == 0)
  {
    os_unfair_lock_unlock(&sNRLogLock);
LABEL_12:
    if (nrCopyEventLogObj_onceToken != -1) {
      dispatch_once(&nrCopyEventLogObj_onceToken, &__block_literal_global_60);
    }
    os_log_t v6 = (os_log_t)(id)nrCopyEventLogObj_sNREventLogObj;
    goto LABEL_5;
  }
  uint64_t v8 = [v1 UUIDString];
  uint64_t v9 = [v8 substringToIndex:13];

  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"%@.events", v9];
  os_log_t v6 = os_log_create("com.apple.networkrelay", (const char *)[v10 UTF8String]);
  uint64_t v11 = nrCopyLogObj_384();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v1;
    _os_log_impl(&dword_20A04F000, v11, OS_LOG_TYPE_DEFAULT, "adding event log object for %@", buf, 0xCu);
  }

  [(id)sNRUUIDToEventLogObject setObject:v6 forKeyedSubscript:v1];
  os_unfair_lock_unlock(&sNRLogLock);
  if (!v6) {
    goto LABEL_12;
  }
LABEL_5:

  return v6;
}

uint64_t __nrCopyEventLogObj_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "events");
  uint64_t v1 = nrCopyEventLogObj_sNREventLogObj;
  nrCopyEventLogObj_sNREventLogObuint64_t j = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void _NRLogWithArgs(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_log_with_args();
  if (a2 == 17 || sNRCopyLogToStdErr)
  {
    id v11 = [NSString alloc];
    tm v12 = (void *)[[NSString alloc] initWithUTF8String:a3];
    id v13 = (void *)[v11 initWithFormat:v12 arguments:&a9];

    os_unfair_lock_lock(&sNRLogLock);
    if (sNRCopyLogToStdErr)
    {
      uint64_t v14 = nrLogLevelToString();
      uint64_t v15 = _NRCopyTimeString();
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s %s %s\n", v14, (const char *)-[__CFString UTF8String](v15, "UTF8String"), (const char *)[v13 UTF8String]);
    }
    long long v16 = (void (*)(void *))sNRLogSimCrashHook;
    os_unfair_lock_unlock(&sNRLogLock);
    if (a2 == 17)
    {
      if (v16) {
        v16(v13);
      }
    }
  }
}

__CFString *_NRCreateMACAddressString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = (__CFString *)objc_alloc_init(MEMORY[0x263F089D8]);
    id v3 = (unsigned __int8 *)[v1 bytes];
    if ([v1 length])
    {
      [(__CFString *)v2 appendFormat:@"%02X", *v3];
      if ((unint64_t)[v1 length] >= 2)
      {
        unint64_t v4 = 1;
        do
          [(__CFString *)v2 appendFormat:@":%02X", v3[v4++]];
        while (v4 < [v1 length]);
      }
    }
  }
  else
  {
    id v2 = @"[nil]";
  }

  return v2;
}

__CFString *_NRCreateDataStringTruncated(void *a1, unsigned int a2)
{
  id v3 = a1;
  if (!v3)
  {
    unint64_t v4 = @"[nil]";
    goto LABEL_13;
  }
  unint64_t v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"[%llu:", objc_msgSend(v3, "length"));
  uint64_t v5 = (unsigned __int8 *)[v3 bytes];
  unint64_t v6 = [v3 length];
  unint64_t v7 = v6;
  if (a2)
  {
    if (v6 >= a2) {
      unint64_t v7 = a2;
    }
    BOOL v8 = v7 != [v3 length];
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL v8 = 0;
  if (v6)
  {
    do
    {
LABEL_9:
      unsigned int v9 = *v5++;
      [(__CFString *)v4 appendFormat:@"%02X", v9];
      --v7;
    }
    while (v7);
  }
LABEL_10:
  if (v8) {
    [(__CFString *)v4 appendString:@"..."];
  }
  [(__CFString *)v4 appendString:@"]"];
LABEL_13:

  return v4;
}

__CFString *_NRCreateDataString(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"[%llu:", objc_msgSend(v1, "length"));
    id v3 = (unsigned __int8 *)[v1 bytes];
    uint64_t v4 = [v1 length];
    if (v4)
    {
      uint64_t v5 = v4;
      do
      {
        unsigned int v6 = *v3++;
        [(__CFString *)v2 appendFormat:@"%02X", v6];
        --v5;
      }
      while (v5);
    }
    [(__CFString *)v2 appendString:@"]"];
  }
  else
  {
    id v2 = @"[nil]";
  }

  return v2;
}

uint64_t _NRIsAppleInternal()
{
  if (_NRIsAppleInternal_onceToken != -1) {
    dispatch_once(&_NRIsAppleInternal_onceToken, &__block_literal_global_407);
  }
  return _NRIsAppleInternal_internal;
}

uint64_t _NRShouldDebugAutoRelease()
{
  if (_NRShouldDebugAutoRelease_onceToken != -1) {
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_40);
  }
  return _NRShouldDebugAutoRelease_debugAutoRelease;
}

uint64_t _NRCopySerialQueueAttr()
{
  if (_NRShouldDebugAutoRelease_onceToken != -1) {
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_40);
  }
  if (_NRShouldDebugAutoRelease_debugAutoRelease) {
    return 0;
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  return objc_claimAutoreleasedReturnValue();
}

void NRTLVAddData(void *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  NRTLVAdd(v6, a2, (unsigned __int16)[v5 length], objc_msgSend(v5, "bytes"));
}

void NRTLVAdd(void *a1, char a2, unsigned int a3, uint64_t a4)
{
  id v7 = a1;
  BOOL v8 = v7;
  if (!v7)
  {
    long long v16 = nrCopyLogObj_384();
    uint64_t v17 = v16;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v18 = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);

      if (!v18) {
        goto LABEL_18;
      }
    }
    id v19 = nrCopyLogObj_384();
    _NRLogWithArgs((uint64_t)v19, 17, (uint64_t)"%s called with null tlvData", v20, v21, v22, v23, v24, (uint64_t)"NRTLVAdd");

    goto LABEL_18;
  }
  if ([v7 length] + (unint64_t)a3 < 0x10000)
  {
    if ((a3 || !a4) && (!a3 || a4))
    {
      char v26 = a2;
      __int16 v27 = __rev16(a3);
      [v8 appendBytes:&v26 length:3];
      if (a4) {
        [v8 appendBytes:a4 length:a3];
      }
    }
    else
    {
      if (nrCopyLogObj_onceToken_376 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_377, OS_LOG_TYPE_FAULT))
      {
        uint64_t v14 = nrCopyLogObj_sNRLogObj_377;
        uint64_t v15 = "invalid tlv length and value";
        goto LABEL_17;
      }
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_376 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_377, OS_LOG_TYPE_FAULT))
    {
      uint64_t v14 = nrCopyLogObj_sNRLogObj_377;
      uint64_t v15 = "tlv buffer full";
LABEL_17:
      _NRLogWithArgs(v14, 17, (uint64_t)v15, v9, v10, v11, v12, v13, v25);
    }
  }
LABEL_18:
}

BOOL NRTLVParse(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (uint64_t (**)(void, void))v4;
  if (!v3)
  {
    uint64_t v22 = nrCopyLogObj_384();
    uint64_t v23 = v22;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v26 = os_log_type_enabled(v22, OS_LOG_TYPE_FAULT);

      if (!v26) {
        goto LABEL_11;
      }
    }
    id v27 = nrCopyLogObj_384();
    _NRLogWithArgs((uint64_t)v27, 17, (uint64_t)"%s called with null tlvData", v28, v29, v30, v31, v32, (uint64_t)"NRTLVParse");
LABEL_38:

    goto LABEL_11;
  }
  if (!v4)
  {
    uint64_t v24 = nrCopyLogObj_384();
    uint64_t v25 = v24;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v33 = os_log_type_enabled(v24, OS_LOG_TYPE_FAULT);

      if (!v33) {
        goto LABEL_11;
      }
    }
    id v27 = nrCopyLogObj_384();
    _NRLogWithArgs((uint64_t)v27, 17, (uint64_t)"%s called with null block", v34, v35, v36, v37, v38, (uint64_t)"NRTLVParse");
    goto LABEL_38;
  }
  if ((unint64_t)[v3 length] < 0x10000)
  {
    uint64_t v14 = [v3 bytes];
    unsigned __int16 v15 = [v3 length];
    if (v15 >= 3uLL)
    {
      unsigned __int16 v18 = v15;
      unsigned __int16 v19 = 0;
      while (1)
      {
        BOOL v16 = v18 <= v19;
        if (v18 <= v19) {
          goto LABEL_12;
        }
        if ((unsigned __int16)(v18 - v19) <= 2u) {
          break;
        }
        unint64_t v20 = (bswap32(*(unsigned __int16 *)(v14 + 1)) >> 16) + 3;
        if (v20 > (unsigned __int16)(v18 - v19))
        {
          if (nrCopyLogObj_onceToken_376 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_377, OS_LOG_TYPE_ERROR))
          {
            uint64_t v11 = nrCopyLogObj_sNRLogObj_377;
            uint64_t v39 = "";
            uint64_t v12 = "%s%.30s:%-4d Invalid tlv buffer (%u < %zu + %u)";
            goto LABEL_29;
          }
          goto LABEL_11;
        }
        char v21 = v5[2](v5, v14);
        v14 += v20;
        v19 += v20;
        if ((v21 & 1) == 0) {
          goto LABEL_11;
        }
      }
      if (nrCopyLogObj_onceToken_376 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_377, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = nrCopyLogObj_sNRLogObj_377;
        uint64_t v39 = "";
        uint64_t v12 = "%s%.30s:%-4d Incomplete tlv buffer (%u < %zu)";
LABEL_29:
        int v13 = 16;
        goto LABEL_9;
      }
    }
  }
  else
  {
    if (nrCopyLogObj_onceToken_376 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_376, &__block_literal_global_58);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_377, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = nrCopyLogObj_sNRLogObj_377;
      uint64_t v12 = "tlv buffer larger than expected";
      int v13 = 17;
LABEL_9:
      _NRLogWithArgs(v11, v13, (uint64_t)v12, v6, v7, v8, v9, v10, (uint64_t)v39);
    }
  }
LABEL_11:
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

id nrCopyLogObj_433()
{
  if (nrCopyLogObj_onceToken_438 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_438, &__block_literal_global_439);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_440;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_443()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_440;
  nrCopyLogObj_sNRLogObj_440 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id NRLPCopyUInt64NSNumberFromXPCDict(void *a1, const char *a2)
{
  id v3 = a1;
  if (!a2)
  {
    uint64_t v9 = nrCopyLogObj_433();
    uint64_t v10 = v9;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11) {
        goto LABEL_14;
      }
    }
    id v12 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (xpcKey) != ((void *)0)", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_14;
  }
  id v4 = v3;
  uint64_t v5 = xpc_dictionary_get_value(v3, a2);
  uint64_t v6 = (void *)v5;
  if (!v5 || MEMORY[0x210512A10](v5) != MEMORY[0x263EF87A0])
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v6)];
  if (!v7)
  {
    unint64_t v20 = nrCopyLogObj_433();
    char v21 = v20;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v22)
      {
LABEL_14:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v18 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v18 = 136446210;
        *(void *)(v18 + 4) = "NRLPCopyUInt64NSNumberFromXPCDict";
        id v19 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v19);
      }
    }
    id v23 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v23, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (retNum) != ((void *)0)", v24, v25, v26, v27, v28, (uint64_t)"");

    goto LABEL_14;
  }
LABEL_6:

  return v7;
}

id checkAndCapValue(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 unsignedLongLongValue];
  if (!HIDWORD(v2))
  {
    id v3 = v1;
    goto LABEL_3;
  }
  uint64_t v5 = v2;
  uint64_t v6 = nrCopyLogObj_433();
  if (sNRCopyLogToStdErr)
  {

LABEL_9:
    id v9 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v9, 17, (uint64_t)"%llu > UINT32_MAX, capping", v10, v11, v12, v13, v14, v5);

    goto LABEL_10;
  }
  uint64_t v7 = v6;
  BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_FAULT);

  if (v8) {
    goto LABEL_9;
  }
LABEL_10:
  id v3 = &unk_26BE1D950;
LABEL_3:

  return v3;
}

void NRLPAddUint64ToXPCDict(void *a1, const char *a2, void *a3)
{
  id v26 = a1;
  id v5 = a3;
  if (!v26)
  {
    uint64_t v6 = nrCopyLogObj_433();
    uint64_t v7 = v6;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8) {
        goto LABEL_18;
      }
    }
    id v12 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v12, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (xpcDict) != ((void *)0)", v13, v14, v15, v16, v17, (uint64_t)"");

    goto LABEL_18;
  }
  if (!a2)
  {
    id v9 = nrCopyLogObj_433();
    uint64_t v10 = v9;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v11)
      {
LABEL_18:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v24 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v24 = 136446210;
        *(void *)(v24 + 4) = "NRLPAddUint64ToXPCDict";
        id v25 = nrCopyLogObj_433();
        _NRLogAbortWithPack(v25);
      }
    }
    id v18 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v18, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (xpcKey) != ((void *)0)", v19, v20, v21, v22, v23, (uint64_t)"");

    goto LABEL_18;
  }
  if (v5) {
    xpc_dictionary_set_uint64(v26, a2, [v5 unsignedLongLongValue]);
  }
}

id nrCopyLogObj_518()
{
  if (nrCopyLogObj_onceToken_521 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_521, &__block_literal_global_400);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_522;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_524()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_522;
  nrCopyLogObj_sNRLogObj_522 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

double __os_log_helper_1_2_3_8_34_8_0_8_0(uint64_t a1, uint64_t a2)
{
  *(void *)&double result = 136446722;
  *(_DWORD *)a1 = 136446722;
  *(void *)(a1 + 4) = "strict_calloc";
  *(_WORD *)(a1 + 12) = 2048;
  *(void *)(a1 + 14) = 1;
  *(_WORD *)(a1 + 22) = 2048;
  *(void *)(a1 + 24) = a2;
  return result;
}

void NRParserLinkWriteAvailable(uint64_t a1)
{
  uint64_t v1570 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v2 = (char *)*(id *)(a1 + 16);
    id v3 = v2;
    if (v2[8] == 4) {
      goto LABEL_1165;
    }
    v1558 = v2;
    unint64_t v4 = 0x26AB22000uLL;
    if (gNRPacketLoggingEnabled)
    {
      os_log_t v669 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
      os_log_t v670 = v669;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v677 = os_log_type_enabled(v669, OS_LOG_TYPE_INFO);

        unint64_t v4 = 0x26AB22000;
        if (!v677) {
          goto LABEL_4;
        }
      }
      os_log_t v678 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
      StringFromNRLinkChannelPriority = createStringFromNRLinkChannelPriority(*(unsigned __int8 *)(a1 + 83));
      _NRLogWithArgs((uint64_t)v678, 1, (uint64_t)"%s%.30s:%-4d Link output available - %@", v679, v680, v681, v682, v683, (uint64_t)"");

      unint64_t v4 = 0x26AB22000;
    }
LABEL_4:
    if ((*(unsigned char *)(a1 + 84) & 1) == 0) {
      goto LABEL_5;
    }
    *(unsigned char *)(a1 + 84) &= ~1u;
    switch(*(unsigned char *)(a1 + 83))
    {
      case 0:
        os_log_t v9 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
        os_log_t v10 = v9;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v641 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

          if (!v641)
          {
LABEL_5:
            unsigned int v5 = *(unsigned __int8 *)(a1 + 82);
            if (v5 >= 0xB)
            {
              unsigned int v5 = *(unsigned __int8 *)(a1 + 82)
                 - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(a1 + 82)) >> 32);
              *(unsigned char *)(a1 + 82) = v5;
            }
            *(_DWORD *)(a1 + 4 * v5 + 36) = 0x80000;
            unsigned int v6 = (117 * (*(unsigned char *)(a1 + 82) + 1)) >> 8;
            *(unsigned char *)(a1 + 82) = *(unsigned char *)(a1 + 82)
                                + 1
                                - 11 * ((v6 + (((*(unsigned char *)(a1 + 82) + 1 - v6) & 0xFE) >> 1)) >> 3);
            int v7 = *(unsigned __int8 *)(a1 + 83);
            id v3 = v1558;
            switch(v7)
            {
              case 1:
                int v8 = 2;
                goto LABEL_15;
              case 3:
                int v14 = 8;
                break;
              case 2:
                int v8 = 4;
LABEL_15:
                id v12 = v1558 + 10;
                int v11 = v1558[10];
                BOOL v13 = (v11 & v8) == 0;
LABEL_32:
                if ((v7 & 0xFE) == 2 && !v13)
                {
                  if (v1558[8] == 4) {
                    goto LABEL_646;
                  }
                  dispatch_assert_queue_V2(*((dispatch_queue_t *)v1558 + 7));
                  v1550 = (uint64_t *)*((void *)v1558 + 26);
                  id v26 = (void *)*((void *)v1558 + 30);
                  id v27 = *((id *)v1558 + 38);
                  unint64_t v28 = 0x26AB22000uLL;
                  if (gNRPacketLoggingEnabled)
                  {
                    os_log_t v684 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v685 = v684;
                    if (sNRCopyLogToStdErr)
                    {

                      id v3 = v1558;
                    }
                    else
                    {
                      BOOL v929 = os_log_type_enabled(v684, OS_LOG_TYPE_INFO);

                      id v3 = v1558;
                      unint64_t v28 = 0x26AB22000;
                      if (!v929) {
                        goto LABEL_36;
                      }
                    }
                    os_log_t v930 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                    _NRLogWithArgs((uint64_t)v930, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v931, v932, v933, v934, v935, (uint64_t)"");

                    unint64_t v28 = 0x26AB22000;
                  }
LABEL_36:
                  int v29 = *v12;
                  LODWORD(v1562) = v29;
                  if ((v29 & 8) != 0)
                  {
                    uint64_t v32 = v3 + 128;
                    uint64_t v35 = "Isochronous";
                    uint64_t v31 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                    int v34 = 3;
                    uint64_t v36 = (void *)*((void *)v3 + 16);
                    if (!v36) {
                      goto LABEL_584;
                    }
                    goto LABEL_399;
                  }
                  if ((v29 & 4) != 0)
                  {
                    uint64_t v32 = v3 + 112;
                    uint64_t v31 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                    goto LABEL_583;
                  }
                  uint64_t v30 = *((void *)v3 + 13);
                  if (!v30)
                  {
                    uint64_t v31 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                    goto LABEL_917;
                  }
                  if ((*(unsigned char *)(*(void *)v30 + 27) & 3) == 1 && !v3[12])
                  {

                    unint64_t v28 = 0x26AB22000;
                    char v33 = 0;
                    uint64_t v31 = 0;
                    id v27 = 0;
                    id v26 = 0;
                    v1550 = 0;
                    uint64_t v32 = v3 + 112;
                    if (!v3[12]) {
                      goto LABEL_43;
                    }
                  }
                  else
                  {
                    uint64_t v31 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                    uint64_t v32 = 0;
                    char v33 = 1;
                    if (!v3[12]) {
                      goto LABEL_43;
                    }
                  }
                  if (!*(unsigned char *)(v28 + 1313)) {
                    goto LABEL_43;
                  }
                  os_log_t v1221 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                  os_log_t v1222 = v1221;
                  if (sNRCopyLogToStdErr)
                  {

                    id v3 = v1558;
                  }
                  else
                  {
                    BOOL v1260 = os_log_type_enabled(v1221, OS_LOG_TYPE_INFO);

                    id v3 = v1558;
                    unint64_t v28 = 0x26AB22000;
                    if (!v1260) {
                      goto LABEL_43;
                    }
                  }
                  os_log_t v1261 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                  _NRLogWithArgs((uint64_t)v1261, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v1262, v1263, v1264, v1265, v1266, (uint64_t)"");

                  unint64_t v28 = 0x26AB22000;
LABEL_43:
                  if (v32)
                  {
                    if (v33)
                    {
                      int v34 = 0;
                      uint64_t v35 = "Invalid";
                      uint64_t v36 = (void *)*v32;
                      if (!*v32) {
                        goto LABEL_584;
                      }
                      goto LABEL_399;
                    }
LABEL_583:
                    uint64_t v35 = "High";
                    int v34 = 2;
                    uint64_t v36 = (void *)*v32;
                    if (!*v32) {
                      goto LABEL_584;
                    }
                    goto LABEL_399;
                  }
LABEL_917:
                  uint64_t v32 = v3 + 96;
                  uint64_t v35 = "Medium";
                  int v34 = 1;
                  uint64_t v36 = (void *)*((void *)v3 + 12);
                  if (!v36)
                  {
LABEL_584:
                    uint64_t v638 = (uint64_t)v35;
                    if (!*(unsigned char *)(v28 + 1313)) {
                      goto LABEL_585;
                    }
                    os_log_t v1487 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v1488 = v1487;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      BOOL v1493 = os_log_type_enabled(v1487, OS_LOG_TYPE_INFO);

                      if (!v1493) {
                        goto LABEL_585;
                      }
                    }
                    os_log_t v1494 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    _NRLogWithArgs((uint64_t)v1494, 1, (uint64_t)"%s%.30s:%-4d ", v1495, v1496, v1497, v1498, v1499, (uint64_t)"");

LABEL_585:
                    os_log_t v639 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v640 = v639;
                    if (sNRCopyLogToStdErr)
                    {

                      id v3 = v1558;
                    }
                    else
                    {
                      BOOL v922 = os_log_type_enabled(v639, OS_LOG_TYPE_FAULT);

                      id v3 = v1558;
                      if (!v922) {
                        goto LABEL_645;
                      }
                    }
                    os_log_t v923 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                    _NRLogWithArgs((uint64_t)v923, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v924, v925, v926, v927, v928, v638);

LABEL_645:
LABEL_646:
                    if (v3[8] == 4)
                    {
LABEL_1165:

                      return;
                    }
                    dispatch_assert_queue_V2(*((dispatch_queue_t *)v3 + 7));
                    v1552 = (void (*)(uint64_t))*((void *)v3 + 27);
                    v657 = (id *)v3;
                    uint64_t v658 = *((void *)v3 + 32);
                    v659 = (char *)v657[40];
                    unint64_t v660 = 0x26AB22000uLL;
                    if (gNRPacketLoggingEnabled)
                    {
                      os_log_t v686 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      os_log_t v687 = v686;
                      if (sNRCopyLogToStdErr)
                      {
                      }
                      else
                      {
                        BOOL v936 = os_log_type_enabled(v686, OS_LOG_TYPE_INFO);

                        unint64_t v660 = 0x26AB22000;
                        if (!v936) {
                          goto LABEL_648;
                        }
                      }
                      os_log_t v937 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      _NRLogWithArgs((uint64_t)v937, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v938, v939, v940, v941, v942, (uint64_t)"");

                      unint64_t v660 = 0x26AB22000;
                    }
LABEL_648:
                    if ((*v12 & 4) != 0)
                    {
                      os_log_t v1557 = (os_log_t)(v1558 + 112);
                      v663 = NRBluetoothPacketParserSuspendNexusVIInputSource;
LABEL_659:
                      v666 = "High";
                      int v665 = 2;
                      goto LABEL_681;
                    }
                    uint64_t v661 = *((void *)v1558 + 13);
                    if (!v661)
                    {
                      v663 = NRBluetoothPacketParserSuspendNexusVIInputSource;
                      goto LABEL_680;
                    }
                    if ((*(unsigned char *)(*(void *)v661 + 27) & 3) == 1 && (v662 = v1558, !v1558[12]))
                    {

                      unint64_t v660 = 0x26AB22000;
                      char v664 = 0;
                      v663 = 0;
                      v659 = 0;
                      uint64_t v658 = 0;
                      v1552 = 0;
                      os_log_t v1557 = v662 + 14;
                    }
                    else
                    {
                      v663 = NRBluetoothPacketParserSuspendNexusVIInputSource;
                      os_log_t v1557 = 0;
                      char v664 = 1;
                    }
                    if (v1558[12] && *(unsigned char *)(v660 + 1313))
                    {
                      os_log_t v957 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      os_log_t v958 = v957;
                      if (sNRCopyLogToStdErr)
                      {
                      }
                      else
                      {
                        BOOL v1240 = os_log_type_enabled(v957, OS_LOG_TYPE_INFO);

                        unint64_t v660 = 0x26AB22000;
                        if (!v1240) {
                          goto LABEL_655;
                        }
                      }
                      os_log_t v1241 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      _NRLogWithArgs((uint64_t)v1241, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v1242, v1243, v1244, v1245, v1246, (uint64_t)"");

                      unint64_t v660 = 0x26AB22000;
                    }
LABEL_655:
                    if (v1557)
                    {
                      if (v664)
                      {
                        int v665 = 0;
                        v666 = "Invalid";
                        goto LABEL_681;
                      }
                      goto LABEL_659;
                    }
LABEL_680:
                    os_log_t v1557 = (os_log_t)(v1558 + 96);
                    v666 = "Medium";
                    int v665 = 1;
LABEL_681:
                    if (v1557->isa)
                    {
                      uint64_t v692 = *((void *)v1557->isa + 3);
                      char v693 = *(unsigned char *)(v692 + 84);
                      v1553 = v663;
                      if ((v693 & 1) == 0)
                      {
                        LODWORD(v1548) = v665;
                        v1551 = v666;
                        v1549 = v659;
                        v1550 = &v1515;
                        int v694 = 0;
                        __int16 v695 = 0;
                        LODWORD(v1560) = 0;
                        v1547 = (dispatch_object_t *)(v1558 + 320);
                        uint64_t v696 = *(void *)(v692 + 8);
                        int v697 = *(unsigned __int8 *)(v692 + 83);
                        uint64_t v698 = 568;
                        if (v697 == 3) {
                          uint64_t v698 = 584;
                        }
                        BOOL v38 = v697 == 2;
                        uint64_t v699 = 600;
                        if (!v38) {
                          uint64_t v699 = v698;
                        }
                        uint64_t v1555 = v699;
                        uint64_t v1562 = (uint64_t)(v1558 + 688);
                        id v1563 = v1558 + 672;
                        int v700 = 9;
                        uint64_t v1554 = v696;
                        if (*(unsigned char *)(v660 + 1313))
                        {
LABEL_688:
                          os_log_t v701 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          os_log_t v702 = v701;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            BOOL v703 = os_log_type_enabled(v701, OS_LOG_TYPE_INFO);

                            unint64_t v660 = 0x26AB22000;
                            if (!v703) {
                              goto LABEL_692;
                            }
                          }
                          os_log_t v704 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          _NRLogWithArgs((uint64_t)v704, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v705, v706, v707, v708, v709, (uint64_t)"");

                          unint64_t v660 = 0x26AB22000uLL;
                        }
LABEL_692:
                        ESPSequenceNumberFromPacket = 0;
                        v710 = 0;
                        unint64_t v1556 = 0;
                        long long v1568 = 0u;
                        long long v1569 = 0u;
                        long long v1566 = 0u;
                        long long v1567 = 0u;
                        if (!*(unsigned char *)(v660 + 1313)) {
                          goto LABEL_697;
                        }
LABEL_693:
                        os_log_t v711 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                        os_log_t v712 = v711;
                        if (sNRCopyLogToStdErr)
                        {
                        }
                        else
                        {
                          BOOL v713 = os_log_type_enabled(v711, OS_LOG_TYPE_INFO);

                          unint64_t v660 = 0x26AB22000;
                          if (!v713) {
                            goto LABEL_697;
                          }
                        }
                        os_log_t v714 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                        _NRLogWithArgs((uint64_t)v714, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v715, v716, v717, v718, v719, (uint64_t)"");

                        unint64_t v660 = 0x26AB22000;
LABEL_697:
                        unsigned int v721 = *(_DWORD *)(v692 + 28);
                        uint64_t v720 = *(unsigned int *)(v692 + 32);
                        if (v721 <= v720)
                        {
                          int v728 = v700 | 0x10;
                          v729 = ESPSequenceNumberFromPacket;
                          if (!v658)
                          {
LABEL_709:
                            if (!v729)
                            {
                              v766 = 0;
                              goto LABEL_742;
                            }
                            while (1)
                            {
                              unsigned int v730 = 0x4000 - *(unsigned __int16 *)(v692 + 80);
                              if (v730 < nrMaxTLVLengthForPacket(v1567, WORD1(v1566)))
                              {
                                v728 |= 0x40u;
                                unint64_t v660 = 0x26AB22000uLL;
                                if (!gNRPacketLoggingEnabled)
                                {
                                  v766 = v729;
                                  goto LABEL_742;
                                }
                                os_log_t v814 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                os_log_t v815 = v814;
                                if (sNRCopyLogToStdErr)
                                {

                                  goto LABEL_803;
                                }
                                LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v814, OS_LOG_TYPE_INFO);

                                if (ESPSequenceNumberFromPacket)
                                {
LABEL_803:
                                  os_log_t v833 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  _NRLogWithArgs((uint64_t)v833, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v834, v835, v836, v837, v838, (uint64_t)"");
                                }
                                v766 = v729;
LABEL_741:
                                unint64_t v660 = 0x26AB22000uLL;
LABEL_742:
                                int v767 = *(unsigned __int16 *)(v692 + 80);
                                LODWORD(v1559) = *(_WORD *)(v692 + 80) != 0;
                                if (v767)
                                {
                                  ESPSequenceNumberFromPacket = v766;
                                  unint64_t v1564 = 0;
                                  uint64_t v768 = v660;
                                  if (!*(unsigned char *)(v660 + 1313)) {
                                    goto LABEL_744;
                                  }
                                  os_log_t v792 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  os_log_t v793 = v792;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    uint64_t v768 = 0x26AB22000;
                                    goto LABEL_787;
                                  }
                                  BOOL v800 = os_log_type_enabled(v792, OS_LOG_TYPE_INFO);

                                  uint64_t v768 = 0x26AB22000;
                                  if (v800)
                                  {
LABEL_787:
                                    os_log_t v801 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs((uint64_t)v801, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v802, v803, v804, v805, v806, (uint64_t)"");
                                  }
LABEL_744:
                                  char v769 = (*((uint64_t (**)(void, void, void, unint64_t *, void, void))v1557->isa
                                          + 1))(*(void *)v1557->isa, *(void *)v692, *(unsigned __int16 *)(v692 + 80), &v1564, 0, 0);
                                  unint64_t v660 = v768;
                                  if (*(unsigned char *)(v768 + 1313))
                                  {
                                    os_log_t v794 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    os_log_t v795 = v794;
                                    if (sNRCopyLogToStdErr)
                                    {
                                    }
                                    else
                                    {
                                      BOOL v807 = os_log_type_enabled(v794, OS_LOG_TYPE_INFO);

                                      unint64_t v660 = 0x26AB22000;
                                      if (!v807) {
                                        goto LABEL_745;
                                      }
                                    }
                                    os_log_t v808 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs((uint64_t)v808, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v809, v810, v811, v812, v813, (uint64_t)"");

                                    unint64_t v660 = 0x26AB22000;
                                  }
LABEL_745:
                                  if ((v769 & 1) == 0)
                                  {
                                    if (v1553)
                                    {
                                      v1553((uint64_t)v1558);
                                      unint64_t v660 = 0x26AB22000uLL;
                                    }
                                    *(unsigned char *)(v692 + 84) |= 1u;
                                    switch(*(unsigned char *)(v692 + 83))
                                    {
                                      case 0:
                                        os_log_t v772 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        os_log_t v773 = v772;
                                        if (sNRCopyLogToStdErr)
                                        {
                                        }
                                        else
                                        {
                                          BOOL v782 = os_log_type_enabled(v772, OS_LOG_TYPE_ERROR);

                                          unint64_t v660 = 0x26AB22000;
                                          if (!v782) {
                                            goto LABEL_765;
                                          }
                                        }
                                        os_log_t v783 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v783, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v784, v785, v786, v787, v788, (uint64_t)"");
                                        goto LABEL_764;
                                      case 1:
                                        v777 = v1558;
                                        uint64_t v778 = *((void *)v1558 + 17);
                                        ++*((void *)v1558 + 18);
                                        *((void *)v777 + 17) = v778 & 0xFFFFFFFFFFFFFFFELL | *(unsigned char *)(v692 + 84) & 1;
                                        if (!*(unsigned char *)(v660 + 1313)) {
                                          goto LABEL_760;
                                        }
                                        os_log_t v779 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        os_log_t v780 = v779;
                                        if (sNRCopyLogToStdErr)
                                        {
                                        }
                                        else
                                        {
                                          BOOL v861 = os_log_type_enabled(v779, OS_LOG_TYPE_INFO);

                                          unint64_t v660 = 0x26AB22000;
                                          if (!v861) {
                                            goto LABEL_765;
                                          }
                                        }
                                        os_log_t v783 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v783, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v862, v863, v864, v865, v866, (uint64_t)"");
                                        goto LABEL_764;
                                      case 2:
                                        v774 = v1558;
                                        ++*((void *)v1558 + 20);
                                        *((void *)v774 + 17) = *((void *)v774 + 17) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(unsigned char *)(v692 + 84) & 1));
                                        if (!*(unsigned char *)(v660 + 1313)) {
                                          goto LABEL_760;
                                        }
                                        os_log_t v775 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        os_log_t v776 = v775;
                                        if (sNRCopyLogToStdErr)
                                        {
                                        }
                                        else
                                        {
                                          BOOL v855 = os_log_type_enabled(v775, OS_LOG_TYPE_INFO);

                                          unint64_t v660 = 0x26AB22000;
                                          if (!v855) {
                                            goto LABEL_765;
                                          }
                                        }
                                        os_log_t v783 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v783, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v856, v857, v858, v859, v860, (uint64_t)"");
                                        goto LABEL_764;
                                      case 3:
                                        v781 = v1558;
                                        ++*((void *)v1558 + 22);
                                        *((void *)v781 + 17) = *((void *)v781 + 17) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(unsigned char *)(v692 + 84) & 1));
                                        if (!*(unsigned char *)(v660 + 1313))
                                        {
LABEL_760:
                                          int v770 = v728 | 0x1800;
                                          unint64_t v771 = v1564;
                                          if (v1564) {
                                            goto LABEL_767;
                                          }
                                          goto LABEL_773;
                                        }
                                        os_log_t v853 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        os_log_t v854 = v853;
                                        if (sNRCopyLogToStdErr)
                                        {
                                        }
                                        else
                                        {
                                          BOOL v867 = os_log_type_enabled(v853, OS_LOG_TYPE_INFO);

                                          unint64_t v660 = 0x26AB22000;
                                          if (!v867) {
                                            goto LABEL_765;
                                          }
                                        }
                                        os_log_t v783 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v783, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v868, v869, v870, v871, v872, (uint64_t)"");
LABEL_764:

                                        unint64_t v660 = 0x26AB22000uLL;
LABEL_765:
                                        int v770 = v728 | 0x1800;
                                        if (!*(unsigned char *)(v660 + 1313))
                                        {
                                          unint64_t v771 = v1564;
                                          if (!v1564) {
                                            goto LABEL_773;
                                          }
                                          goto LABEL_767;
                                        }
                                        os_log_t v798 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        os_log_t v799 = v798;
                                        if (sNRCopyLogToStdErr)
                                        {
                                        }
                                        else
                                        {
                                          BOOL v826 = os_log_type_enabled(v798, OS_LOG_TYPE_INFO);

                                          if (!v826) {
                                            goto LABEL_800;
                                          }
                                        }
                                        os_log_t v827 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v827, 1, (uint64_t)"%s%.30s:%-4d ", v828, v829, v830, v831, v832, (uint64_t)"");

LABEL_800:
                                        unint64_t v660 = 0x26AB22000;
                                        unint64_t v771 = v1564;
                                        if (v1564) {
                                          goto LABEL_767;
                                        }
                                        break;
                                      default:
                                        goto LABEL_765;
                                    }
                                    goto LABEL_773;
                                  }
                                  int v770 = v728 | 0x800;
                                  unint64_t v771 = v1564;
                                  if (!v1564)
                                  {
LABEL_773:
                                    LODWORD(v1560) = v1560 + 1;
                                    if (v769)
                                    {
                                      unsigned int v790 = *(unsigned __int8 *)(v692 + 82);
                                      if (v790 >= 0xB)
                                      {
                                        unsigned int v790 = *(unsigned __int8 *)(v692 + 82)
                                             - 11
                                             * ((390451573 * (unint64_t)*(unsigned __int8 *)(v692 + 82)) >> 32);
                                        *(unsigned char *)(v692 + 82) = v790;
                                      }
                                      int v700 = 0;
                                      *(_DWORD *)(v692 + 4 * v790 + 36) = v770;
                                      unsigned int v791 = (117 * (*(unsigned char *)(v692 + 82) + 1)) >> 8;
                                      *(unsigned char *)(v692 + 82) = *(unsigned char *)(v692 + 82)
                                                            + 1
                                                            - 11
                                                            * ((v791
                                                              + (((*(unsigned char *)(v692 + 82) + 1 - v791) & 0xFE) >> 1)) >> 3);
                                      if (!*(unsigned char *)(v660 + 1313)) {
                                        goto LABEL_697;
                                      }
                                      goto LABEL_693;
                                    }
LABEL_826:
                                    BOOL v874 = v767 == 0;
                                    LODWORD(v873) = v1559;
                                    if (!*(unsigned char *)(v660 + 1313))
                                    {
                                      int v875 = v770 | 0x8000;
                                      if (v710) {
                                        goto LABEL_828;
                                      }
LABEL_819:
                                      if (!v1558[13])
                                      {
LABEL_834:
                                        if ((v873 & v874) == 1)
                                        {
                                          unsigned int v886 = *(unsigned __int8 *)(v692 + 82);
                                          if (v886 >= 0xB)
                                          {
                                            unsigned int v886 = *(unsigned __int8 *)(v692 + 82)
                                                 - 11
                                                 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v692 + 82)) >> 32);
                                            *(unsigned char *)(v692 + 82) = v886;
                                          }
                                          *(_DWORD *)(v692 + 4 * v886 + 36) = v875;
                                          unsigned int v887 = (117 * (*(unsigned char *)(v692 + 82) + 1)) >> 8;
                                          *(unsigned char *)(v692 + 82) = *(unsigned char *)(v692 + 82)
                                                                + 1
                                                                - 11
                                                                * ((v887
                                                                  + (((*(unsigned char *)(v692 + 82) + 1 - v887) & 0xFE) >> 1)) >> 3);
                                          int v700 = 8;
                                          if (!*(unsigned char *)(v660 + 1313)) {
                                            goto LABEL_692;
                                          }
                                          goto LABEL_688;
                                        }
                                        if (*(unsigned char *)(v660 + 1313))
                                        {
                                          char v1230 = v873;
                                          os_log_t v1231 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                          uint64_t v873 = (uint64_t)v1231;
                                          if (sNRCopyLogToStdErr)
                                          {
                                          }
                                          else
                                          {
                                            BOOL v1267 = os_log_type_enabled(v1231, OS_LOG_TYPE_INFO);

                                            unint64_t v660 = 0x26AB22000;
                                            LOBYTE(v873) = v1230;
                                            if (!v1267) {
                                              goto LABEL_863;
                                            }
                                          }
                                          uint64_t v873 = (uint64_t)_NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                          _NRLogWithArgs(v873, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v1268, v1269, v1270, v1271, v1272, (uint64_t)"");

                                          LOBYTE(v873) = v1230;
                                          unint64_t v660 = 0x26AB22000;
                                        }
LABEL_863:
                                        v910 = v1558;
                                        if (v873) {
                                          goto LABEL_897;
                                        }
                                        if (v1548 != 1)
                                        {
                                          if (v1548 == 2)
                                          {
                                            uint64_t v911 = *((void *)v1558 + 17);
                                            if ((v911 & 8) != 0 && *((void *)v1558 + 38))
                                            {
                                              *((void *)v1558 + 17) = v911 & 0xFFFFFFFFFFFFFFF7;
                                              if (!*(unsigned char *)(v660 + 1313)) {
                                                goto LABEL_869;
                                              }
                                              os_log_t v1318 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                              os_log_t v1319 = v1318;
                                              if (sNRCopyLogToStdErr)
                                              {

                                                v910 = v1558;
                                                goto LABEL_1270;
                                              }
                                              BOOL v1405 = os_log_type_enabled(v1318, OS_LOG_TYPE_INFO);

                                              v910 = v1558;
                                              if (v1405)
                                              {
LABEL_1270:
                                                os_log_t v1406 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                                _NRLogWithArgs((uint64_t)v1406, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1407, v1408, v1409, v1410, v1411, (uint64_t)"");
                                              }
LABEL_869:
                                              dispatch_resume(*((dispatch_object_t *)v910 + 38));
                                              uint64_t v911 = *((void *)v910 + 17);
                                              unint64_t v660 = 0x26AB22000uLL;
                                            }
                                            if ((v911 & 0x10) != 0 && *v1547)
                                            {
                                              *((void *)v910 + 17) = v911 & 0xFFFFFFFFFFFFFFEFLL;
                                              if (*(unsigned char *)(v660 + 1313))
                                              {
                                                os_log_t v912 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                                os_log_t v913 = v912;
                                                if (sNRCopyLogToStdErr)
                                                {

                                                  goto LABEL_1267;
                                                }
                                                BOOL v1399 = os_log_type_enabled(v912, OS_LOG_TYPE_INFO);

                                                if (v1399)
                                                {
LABEL_1267:
                                                  os_log_t v1338 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                                  _NRLogWithArgs((uint64_t)v1338, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1400, v1401, v1402, v1403, v1404, (uint64_t)"");
LABEL_1268:
                                                }
                                              }
LABEL_896:
                                              dispatch_resume(*v1547);
                                              unint64_t v660 = 0x26AB22000uLL;
                                            }
                                            goto LABEL_897;
                                          }
                                          uint64_t v914 = *((void *)v1558 + 17);
LABEL_880:
                                          if ((v914 & 8) != 0 && *((void *)v1558 + 38))
                                          {
                                            *((void *)v1558 + 17) = v914 & 0xFFFFFFFFFFFFFFF7;
                                            if (!*(unsigned char *)(v660 + 1313)) {
                                              goto LABEL_883;
                                            }
                                            os_log_t v1306 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                            os_log_t v1307 = v1306;
                                            if (sNRCopyLogToStdErr)
                                            {

                                              v910 = v1558;
                                              goto LABEL_1253;
                                            }
                                            BOOL v1355 = os_log_type_enabled(v1306, OS_LOG_TYPE_INFO);

                                            v910 = v1558;
                                            if (v1355)
                                            {
LABEL_1253:
                                              os_log_t v1356 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                              _NRLogWithArgs((uint64_t)v1356, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1357, v1358, v1359, v1360, v1361, (uint64_t)"");
                                            }
LABEL_883:
                                            dispatch_resume(*((dispatch_object_t *)v910 + 38));
                                            uint64_t v914 = *((void *)v910 + 17);
                                          }
                                          if ((v914 & 0x10) != 0 && *v1547)
                                          {
                                            *((void *)v910 + 17) = v914 & 0xFFFFFFFFFFFFFFEFLL;
                                            if (!gNRPacketLoggingEnabled) {
                                              goto LABEL_887;
                                            }
                                            os_log_t v1308 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                            os_log_t v1309 = v1308;
                                            if (sNRCopyLogToStdErr)
                                            {

                                              v910 = v1558;
                                              goto LABEL_1255;
                                            }
                                            BOOL v1362 = os_log_type_enabled(v1308, OS_LOG_TYPE_INFO);

                                            v910 = v1558;
                                            if (v1362)
                                            {
LABEL_1255:
                                              os_log_t v1363 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                              _NRLogWithArgs((uint64_t)v1363, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1364, v1365, v1366, v1367, v1368, (uint64_t)"");
                                            }
LABEL_887:
                                            dispatch_resume(*((dispatch_object_t *)v910 + 40));
                                            uint64_t v914 = *((void *)v910 + 17);
                                          }
                                          if ((v914 & 0x20) != 0)
                                          {
                                            unint64_t v660 = 0x26AB22000uLL;
                                            if (*((void *)v910 + 42)) {
                                              goto LABEL_890;
                                            }
LABEL_893:
                                            if ((v914 & 0x40) != 0 && *((void *)v910 + 44))
                                            {
                                              v1547 = (dispatch_object_t *)(v910 + 352);
                                              *((void *)v910 + 17) = v914 & 0xFFFFFFFFFFFFFFBFLL;
                                              if (!*(unsigned char *)(v660 + 1313)) {
                                                goto LABEL_896;
                                              }
                                              os_log_t v1302 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                              os_log_t v1303 = v1302;
                                              if (sNRCopyLogToStdErr)
                                              {
                                              }
                                              else
                                              {
                                                BOOL v1337 = os_log_type_enabled(v1302, OS_LOG_TYPE_INFO);

                                                if (!v1337) {
                                                  goto LABEL_896;
                                                }
                                              }
                                              os_log_t v1338 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                              _NRLogWithArgs((uint64_t)v1338, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v1339, v1340, v1341, v1342, v1343, (uint64_t)"");
                                              goto LABEL_1268;
                                            }
LABEL_897:
                                            if (*(unsigned char *)(v660 + 1313))
                                            {
                                              os_log_t v1232 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                              os_log_t v1233 = v1232;
                                              if (sNRCopyLogToStdErr)
                                              {
                                              }
                                              else
                                              {
                                                BOOL v1273 = os_log_type_enabled(v1232, OS_LOG_TYPE_INFO);

                                                if (!v1273) {
                                                  goto LABEL_898;
                                                }
                                              }
                                              os_log_t v1274 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                              _NRLogWithArgs((uint64_t)v1274, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v1275, v1276, v1277, v1278, v1279, (uint64_t)"");
                                            }
LABEL_898:
                                            unsigned int v915 = *(unsigned __int8 *)(v692 + 82);
                                            v659 = (char *)v1549;
                                            if (v915 >= 0xB)
                                            {
                                              unsigned int v915 = *(unsigned __int8 *)(v692 + 82)
                                                   - 11
                                                   * ((390451573 * (unint64_t)*(unsigned __int8 *)(v692 + 82)) >> 32);
                                              *(unsigned char *)(v692 + 82) = v915;
                                            }
                                            *(_DWORD *)(v692 + 4 * v915 + 36) = v875 | 0x60000;
                                            unsigned int v916 = (117 * (*(unsigned char *)(v692 + 82) + 1)) >> 8;
                                            *(unsigned char *)(v692 + 82) = *(unsigned char *)(v692 + 82)
                                                                  + 1
                                                                  - 11
                                                                  * ((v916
                                                                    + (((*(unsigned char *)(v692 + 82)
                                                                                        + 1
                                                                                        - v916) & 0xFE) >> 1)) >> 3);
                                            id v3 = v1558;
                                            goto LABEL_901;
                                          }
LABEL_892:
                                          unint64_t v660 = 0x26AB22000uLL;
                                          goto LABEL_893;
                                        }
                                        uint64_t v914 = *((void *)v1558 + 17);
                                        if ((v1558[10] & 4) == 0) {
                                          goto LABEL_880;
                                        }
                                        if ((v914 & 0x20) == 0 || !*((void *)v1558 + 42)) {
                                          goto LABEL_893;
                                        }
LABEL_890:
                                        *((void *)v910 + 17) = v914 & 0xFFFFFFFFFFFFFFDFLL;
                                        if (!*(unsigned char *)(v660 + 1313))
                                        {
LABEL_891:
                                          dispatch_resume(*((dispatch_object_t *)v910 + 42));
                                          uint64_t v914 = *((void *)v910 + 17);
                                          goto LABEL_892;
                                        }
                                        os_log_t v1300 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                        os_log_t v1301 = v1300;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          v910 = v1558;
                                        }
                                        else
                                        {
                                          BOOL v1330 = os_log_type_enabled(v1300, OS_LOG_TYPE_INFO);

                                          v910 = v1558;
                                          if (!v1330) {
                                            goto LABEL_891;
                                          }
                                        }
                                        os_log_t v1331 = _NRCopyLogObjectForNRUUID(*((void **)v910 + 5));
                                        _NRLogWithArgs((uint64_t)v1331, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1332, v1333, v1334, v1335, v1336, (uint64_t)"");

                                        goto LABEL_891;
                                      }
LABEL_829:
                                      if (v1560 <= 8u)
                                      {
                                        if (!v658) {
                                          goto LABEL_834;
                                        }
                                        unsigned int v885 = os_channel_available_slot_count();
                                        unint64_t v660 = 0x26AB22000uLL;
                                        if (v885 > 1) {
                                          goto LABEL_834;
                                        }
                                      }
                                      if (!*(unsigned char *)(v660 + 1313))
                                      {
LABEL_833:
                                        int v875 = v770 | 0x18000;
                                        os_channel_sync();
                                        v1558[13] = 0;
                                        unint64_t v660 = 0x26AB22000uLL;
                                        goto LABEL_834;
                                      }
                                      LODWORD(v1559) = v873;
                                      os_log_t v891 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      uint64_t v873 = (uint64_t)v891;
                                      if (sNRCopyLogToStdErr)
                                      {
                                      }
                                      else
                                      {
                                        BOOL v899 = os_log_type_enabled(v891, OS_LOG_TYPE_INFO);

                                        LODWORD(v873) = v1559;
                                        if (!v899) {
                                          goto LABEL_833;
                                        }
                                      }
                                      uint64_t v873 = (uint64_t)_NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      _NRLogWithArgs(v873, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v900, v901, v902, v903, v904, (uint64_t)"");

                                      LODWORD(v873) = v1559;
                                      goto LABEL_833;
                                    }
                                    int v888 = (int)v1559;
                                    os_log_t v889 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    os_log_t v890 = v889;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      goto LABEL_844;
                                    }
                                    BOOL v892 = os_log_type_enabled(v889, OS_LOG_TYPE_INFO);

                                    if (v892)
                                    {
LABEL_844:
                                      os_log_t v893 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      _NRLogWithArgs((uint64_t)v893, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v894, v895, v896, v897, v898, (uint64_t)"");
                                    }
                                    unint64_t v660 = 0x26AB22000;
                                    LODWORD(v873) = v888;
                                    int v875 = v770 | 0x8000;
                                    if (!v710) {
                                      goto LABEL_819;
                                    }
LABEL_828:
                                    os_channel_advance_slot();
                                    unint64_t v660 = 0x26AB22000;
                                    v1558[13] = 1;
                                    goto LABEL_829;
                                  }
LABEL_767:
                                  if (v771 < *(unsigned __int16 *)(v692 + 80))
                                  {
                                    if (!*(unsigned char *)(v660 + 1313)) {
                                      goto LABEL_769;
                                    }
                                    os_log_t v816 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    os_log_t v817 = v816;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      goto LABEL_806;
                                    }
                                    BOOL v839 = os_log_type_enabled(v816, OS_LOG_TYPE_INFO);

                                    if (v839)
                                    {
LABEL_806:
                                      os_log_t v840 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      _NRLogWithArgs((uint64_t)v840, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v841, v842, v843, v844, v845, (uint64_t)"");
                                    }
LABEL_769:
                                    v770 |= 0x2000u;
                                    memmove(*(void **)v692, (const void *)(*(void *)v692 + v1564), *(unsigned __int16 *)(v692 + 80) - v1564);
                                    unint64_t v789 = v1564;
                                    *(_WORD *)(v692 + 80) -= v1564;
                                    unint64_t v1556 = (v1556 + 1);
                                    unint64_t v660 = 0x26AB22000;
LABEL_772:
                                    *(void *)&v1558[v1555] += v789;
                                    goto LABEL_773;
                                  }
                                  if (!*(unsigned char *)(v660 + 1313))
                                  {
LABEL_771:
                                    v770 |= 0x4000u;
                                    *(_WORD *)(v692 + 80) = 0;
                                    unint64_t v789 = v1564;
                                    goto LABEL_772;
                                  }
                                  os_log_t v818 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  os_log_t v819 = v818;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    BOOL v846 = os_log_type_enabled(v818, OS_LOG_TYPE_INFO);

                                    unint64_t v660 = 0x26AB22000;
                                    if (!v846) {
                                      goto LABEL_771;
                                    }
                                  }
                                  os_log_t v847 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  _NRLogWithArgs((uint64_t)v847, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v848, v849, v850, v851, v852, (uint64_t)"");

                                  unint64_t v660 = 0x26AB22000;
                                  goto LABEL_771;
                                }
                                int v770 = v728 | 0x400;
                                if (!*(unsigned char *)(v660 + 1313))
                                {
                                  LODWORD(v873) = 0;
                                  BOOL v874 = 1;
                                  int v875 = v770 | 0x8000;
                                  if (v710) {
                                    goto LABEL_828;
                                  }
                                  goto LABEL_819;
                                }
                                os_log_t v876 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                os_log_t v877 = v876;
                                if (sNRCopyLogToStdErr)
                                {

                                  goto LABEL_824;
                                }
                                BOOL v878 = os_log_type_enabled(v876, OS_LOG_TYPE_INFO);

                                if (v878)
                                {
LABEL_824:
                                  os_log_t v879 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  _NRLogWithArgs((uint64_t)v879, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v880, v881, v882, v883, v884, (uint64_t)"");
                                }
                                unint64_t v660 = 0x26AB22000uLL;
                                goto LABEL_826;
                              }
                              os_channel_slot_get_packet();
                              os_packet_get_next_buflet();
                              unsigned int data_offset = os_buflet_get_data_offset();
                              uint64_t object_address = os_buflet_get_object_address();
                              unsigned int data_length = os_buflet_get_data_length();
                              if (data_length >= 0x10000)
                              {
                                if (nrCopyLogObj_onceToken_521 != -1) {
                                  dispatch_once(&nrCopyLogObj_onceToken_521, &__block_literal_global_400);
                                }
                                v907 = (id)nrCopyLogObj_sNRLogObj_522;
                                v908 = v907;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  BOOL v909 = os_log_type_enabled(v907, OS_LOG_TYPE_ERROR);

                                  if (!v909) {
                                    goto LABEL_388;
                                  }
                                }
LABEL_580:
                                id v632 = nrCopyLogObj_518();
                                _NRLogWithArgs((uint64_t)v632, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v633, v634, v635, v636, v637, (uint64_t)"");

                                goto LABEL_388;
                              }
                              unsigned __int16 v734 = data_length;
                              if (!(_WORD)data_length && WORD1(v1566))
                              {
                                unint64_t v1564 = 0;
                                uint64_t v1565 = 0;
                                unint64_t v1564 = *(void *)v692 + *(unsigned __int16 *)(v692 + 80);
                                LODWORD(v1565) = v730;
                                int v735 = nrPacketToTLV((unsigned __int8 *)v1567, WORD1(v1566), (uint64_t)&v1564, 1u, (uint64_t)v1563, v1562);
                                if (!gNRPacketLoggingEnabled)
                                {
LABEL_715:
                                  v728 |= 0x80u;
                                  goto LABEL_721;
                                }
                                os_log_t v741 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                os_log_t v742 = v741;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  BOOL v747 = os_log_type_enabled(v741, OS_LOG_TYPE_INFO);

                                  if (!v747) {
                                    goto LABEL_715;
                                  }
                                }
                                os_log_t v748 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                getESPSequenceNumberFromPacket(v1567, WORD1(v1566));
                                getESPSPIFromPacket(v1567, WORD1(v1566));
                                _NRLogWithArgs((uint64_t)v748, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v749, v750, v751, v752, v753, (uint64_t)"");

                                goto LABEL_715;
                              }
                              if ((_WORD)data_length)
                              {
                                v736 = (unsigned __int8 *)(object_address + data_offset);
                                unint64_t v1564 = 0;
                                uint64_t v1565 = 0;
                                unint64_t v1564 = *(void *)v692 + *(unsigned __int16 *)(v692 + 80);
                                LODWORD(v1565) = v730;
                                int v735 = nrPacketToTLV(v736, (unsigned __int16)data_length, (uint64_t)&v1564, 1u, (uint64_t)v1563, v1562);
                                if (!gNRPacketLoggingEnabled)
                                {
LABEL_718:
                                  v728 |= 0x100u;
                                  goto LABEL_721;
                                }
                                os_log_t v743 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                os_log_t v744 = v743;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  LODWORD(ESPSequenceNumberFromPacket) = os_log_type_enabled(v743, OS_LOG_TYPE_INFO);

                                  if (!ESPSequenceNumberFromPacket) {
                                    goto LABEL_718;
                                  }
                                }
                                os_log_t v754 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                ESPSequenceNumberFromPacket = (unsigned char *)getESPSequenceNumberFromPacket((uint64_t)v736, v734);
                                getESPSPIFromPacket((uint64_t)v736, v734);
                                _NRLogWithArgs((uint64_t)v754, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v755, v756, v757, v758, v759, (uint64_t)"");

                                goto LABEL_718;
                              }
                              v728 |= 0x200u;
                              if (!gNRPacketLoggingEnabled) {
                                goto LABEL_720;
                              }
                              v745 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                              v746 = v745;
                              if (sNRCopyLogToStdErr) {
                                break;
                              }
                              int v735 = os_log_type_enabled(v745, OS_LOG_TYPE_INFO);

                              if (v735) {
                                goto LABEL_736;
                              }
LABEL_721:
                              *(_WORD *)(v692 + 80) += v735;
                              uint64_t next_slot = os_channel_get_next_slot();
                              ++v695;
                              v738 = v1558;
                              ++*((void *)v1558 + 56);
                              v738[15] = 1;
                              v694 += v735;
                              if (!next_slot)
                              {
                                v766 = 0;
                                v710 = v729;
                                goto LABEL_741;
                              }
                              unsigned int v739 = *(unsigned __int8 *)(v692 + 82);
                              if (v739 >= 0xB)
                              {
                                unsigned int v739 = *(unsigned __int8 *)(v692 + 82)
                                     - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v692 + 82)) >> 32);
                                *(unsigned char *)(v692 + 82) = v739;
                              }
                              *(_DWORD *)(v692 + 4 * v739 + 36) = v728;
                              unsigned int v740 = (117 * (*(unsigned char *)(v692 + 82) + 1)) >> 8;
                              *(unsigned char *)(v692 + 82) = *(unsigned char *)(v692 + 82)
                                                    + 1
                                                    - 11
                                                    * ((v740
                                                      + (((*(unsigned char *)(v692 + 82) + 1 - v740) & 0xFE) >> 1)) >> 3);
                              v710 = v729;
                              v729 = (unsigned char *)next_slot;
                              int v728 = 0;
                            }

LABEL_736:
                            os_log_t v760 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            _NRLogWithArgs((uint64_t)v760, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v761, v762, v763, v764, v765, (uint64_t)"");

LABEL_720:
                            int v735 = 0;
                            goto LABEL_721;
                          }
LABEL_708:
                          v729 = (unsigned char *)os_channel_get_next_slot();
                          unint64_t v660 = 0x26AB22000;
                          goto LABEL_709;
                        }
                        uint64_t v722 = *(unsigned __int16 *)(v692 + 80);
                        if ((unsigned __int16)(v721 - v720) >= (unsigned __int16)(0x4000 - v722)) {
                          size_t v723 = (unsigned __int16)(0x4000 - v722);
                        }
                        else {
                          size_t v723 = (unsigned __int16)(v721 - v720);
                        }
                        v724 = (char *)v1554;
                        memcpy((void *)(*(void *)v692 + v722), (const void *)(v1554 + v720), v723);
                        unsigned int v725 = *(_DWORD *)(v692 + 28);
                        unsigned int v726 = *(_DWORD *)(v692 + 32) + v723;
                        *(_DWORD *)(v692 + 32) = v726;
                        if (v725 <= v726)
                        {
                          int v727 = 0;
                        }
                        else
                        {
                          memmove(v724, &v724[v726], v725 - v726);
                          int v727 = *(_DWORD *)(v692 + 28) - *(_DWORD *)(v692 + 32);
                        }
                        unint64_t v660 = 0x26AB22000uLL;
                        *(_DWORD *)(v692 + 28) = v727;
                        *(_DWORD *)(v692 + 32) = 0;
                        *(_WORD *)(v692 + 80) += v723;
                        if (gNRPacketLoggingEnabled)
                        {
                          os_log_t v796 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          os_log_t v797 = v796;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v1559) = os_log_type_enabled(v796, OS_LOG_TYPE_INFO);

                            unint64_t v660 = 0x26AB22000;
                            if (!v1559) {
                              goto LABEL_707;
                            }
                          }
                          os_log_t v820 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          _NRLogWithArgs((uint64_t)v820, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v821, v822, v823, v824, v825, (uint64_t)"");

                          unint64_t v660 = 0x26AB22000;
                        }
LABEL_707:
                        int v728 = v700 | 0x30;
                        v694 += v723;
                        v729 = ESPSequenceNumberFromPacket;
                        if (!v658) {
                          goto LABEL_709;
                        }
                        goto LABEL_708;
                      }
                      if (!*(unsigned char *)(v660 + 1313))
                      {
LABEL_850:
                        id v3 = v1558;
                        if (v663) {
                          v663((uint64_t)v1558);
                        }
                        unsigned int v905 = *(unsigned __int8 *)(v692 + 82);
                        if (v905 >= 0xB)
                        {
                          unsigned int v905 = *(unsigned __int8 *)(v692 + 82)
                               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v692 + 82)) >> 32);
                          *(unsigned char *)(v692 + 82) = v905;
                        }
                        *(_DWORD *)(v692 + 4 * v905 + 36) = 3;
                        unsigned int v906 = (117 * (*(unsigned char *)(v692 + 82) + 1)) >> 8;
                        *(unsigned char *)(v692 + 82) = *(unsigned char *)(v692 + 82)
                                              + 1
                                              - 11
                                              * ((v906
                                                + (((*(unsigned char *)(v692 + 82) + 1 - v906) & 0xFE) >> 1)) >> 3);
                        goto LABEL_901;
                      }
                      os_log_t v920 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      os_log_t v921 = v920;
                      if (sNRCopyLogToStdErr)
                      {

                        v663 = v1553;
                      }
                      else
                      {
                        BOOL v1210 = os_log_type_enabled(v920, OS_LOG_TYPE_INFO);

                        v663 = v1553;
                        if (!v1210) {
                          goto LABEL_850;
                        }
                      }
                      os_log_t v1211 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      _NRLogWithArgs((uint64_t)v1211, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v1212, v1213, v1214, v1215, v1216, (uint64_t)"");

                      goto LABEL_850;
                    }
                    uint64_t v917 = (uint64_t)v666;
                    if (!*(unsigned char *)(v660 + 1313)) {
                      goto LABEL_904;
                    }
                    os_log_t v1489 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v1490 = v1489;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      BOOL v1500 = os_log_type_enabled(v1489, OS_LOG_TYPE_INFO);

                      if (!v1500) {
                        goto LABEL_904;
                      }
                    }
                    os_log_t v1501 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    _NRLogWithArgs((uint64_t)v1501, 1, (uint64_t)"%s%.30s:%-4d ", v1502, v1503, v1504, v1505, v1506, (uint64_t)"");

LABEL_904:
                    os_log_t v918 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v919 = v918;
                    if (sNRCopyLogToStdErr)
                    {

                      id v3 = v1558;
                    }
                    else
                    {
                      BOOL v943 = os_log_type_enabled(v918, OS_LOG_TYPE_FAULT);

                      id v3 = v1558;
                      if (!v943) {
                        goto LABEL_901;
                      }
                    }
                    os_log_t v944 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                    _NRLogWithArgs((uint64_t)v944, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v945, v946, v947, v948, v949, v917);

LABEL_901:
                    goto LABEL_1165;
                  }
LABEL_399:
                  v1553 = v31;
                  uint64_t v428 = v36[3];
                  if ((*(unsigned char *)(v428 + 84) & 1) == 0)
                  {
                    LODWORD(v1546) = v34;
                    unint64_t v1556 = (unint64_t)v32;
                    id v1563 = v26;
                    v1549 = v35;
                    id v1548 = v27;
                    v1547 = (dispatch_object_t *)&v1515;
                    v1533 = v12;
                    int v429 = 0;
                    __int16 v430 = 0;
                    LODWORD(v1559) = 0;
                    v1545 = (dispatch_object_t *)(v3 + 304);
                    v431 = *(void (**)(uint64_t))(v428 + 8);
                    int v432 = *(unsigned __int8 *)(v428 + 83);
                    uint64_t v433 = 568;
                    if (v432 == 3) {
                      uint64_t v433 = 584;
                    }
                    BOOL v38 = v432 == 2;
                    uint64_t v434 = 600;
                    if (!v38) {
                      uint64_t v434 = v433;
                    }
                    uint64_t v1554 = v434;
                    v1560 = v3 + 688;
                    ESPSequenceNumberFromPacket = v3 + 672;
                    int v435 = 9;
                    v1552 = v431;
                    if (*(unsigned char *)(v28 + 1313))
                    {
LABEL_405:
                      os_log_t v436 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      os_log_t v437 = v436;
                      if (sNRCopyLogToStdErr)
                      {
                      }
                      else
                      {
                        BOOL v438 = os_log_type_enabled(v436, OS_LOG_TYPE_INFO);

                        unint64_t v28 = 0x26AB22000;
                        if (!v438) {
                          goto LABEL_409;
                        }
                      }
                      os_log_t v439 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      _NRLogWithArgs((uint64_t)v439, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v440, v441, v442, v443, v444, (uint64_t)"");

                      unint64_t v28 = 0x26AB22000uLL;
                    }
LABEL_409:
                    uint64_t v445 = 0;
                    uint64_t v446 = 0;
                    uint64_t v1555 = 0;
                    long long v1568 = 0u;
                    long long v1569 = 0u;
                    long long v1566 = 0u;
                    long long v1567 = 0u;
                    if (*(unsigned char *)(v28 + 1313))
                    {
LABEL_410:
                      os_log_t v447 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      os_log_t v448 = v447;
                      if (sNRCopyLogToStdErr)
                      {

LABEL_413:
                        os_log_t v450 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                        _NRLogWithArgs((uint64_t)v450, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v451, v452, v453, v454, v455, (uint64_t)"");

                        unint64_t v28 = 0x26AB22000;
                        goto LABEL_414;
                      }
                      BOOL v449 = os_log_type_enabled(v447, OS_LOG_TYPE_INFO);

                      unint64_t v28 = 0x26AB22000;
                      if (v449) {
                        goto LABEL_413;
                      }
                    }
LABEL_414:
                    int v456 = v435 | 0x10;
                    if ((v1562 & 8) != 0) {
                      goto LABEL_424;
                    }
                    unsigned int v458 = *(_DWORD *)(v428 + 28);
                    uint64_t v457 = *(unsigned int *)(v428 + 32);
                    if (v458 <= v457) {
                      goto LABEL_424;
                    }
                    uint64_t v459 = *(unsigned __int16 *)(v428 + 80);
                    if ((unsigned __int16)(v458 - v457) >= (unsigned __int16)(0x4000 - v459)) {
                      size_t v460 = (unsigned __int16)(0x4000 - v459);
                    }
                    else {
                      size_t v460 = (unsigned __int16)(v458 - v457);
                    }
                    v461 = v1552;
                    memcpy((void *)(*(void *)v428 + v459), (char *)v1552 + v457, v460);
                    unsigned int v462 = *(_DWORD *)(v428 + 28);
                    unsigned int v463 = *(_DWORD *)(v428 + 32) + v460;
                    *(_DWORD *)(v428 + 32) = v463;
                    if (v462 <= v463)
                    {
                      int v464 = 0;
                    }
                    else
                    {
                      memmove(v461, (char *)v461 + v463, v462 - v463);
                      int v464 = *(_DWORD *)(v428 + 28) - *(_DWORD *)(v428 + 32);
                    }
                    unint64_t v28 = 0x26AB22000uLL;
                    *(_DWORD *)(v428 + 28) = v464;
                    *(_DWORD *)(v428 + 32) = 0;
                    *(_WORD *)(v428 + 80) += v460;
                    if (!gNRPacketLoggingEnabled)
                    {
LABEL_423:
                      int v456 = v435 | 0x30;
                      v429 += v460;
                      id v3 = v1558;
LABEL_424:
                      if (v1563)
                      {
                        uint64_t v445 = os_channel_get_next_slot();
                        unint64_t v28 = 0x26AB22000;
                      }
                      if (!v445) {
                        goto LABEL_462;
                      }
                      uint64_t v465 = v445;
                      while (1)
                      {
                        unsigned int v466 = 0x4000 - *(unsigned __int16 *)(v428 + 80);
                        if (v466 < nrMaxTLVLengthForPacket(v1567, WORD1(v1566)))
                        {
                          v456 |= 0x40u;
                          unint64_t v28 = 0x26AB22000uLL;
                          if (!gNRPacketLoggingEnabled)
                          {
                            uint64_t v445 = v465;
                            id v3 = v1558;
                            goto LABEL_462;
                          }
                          os_log_t v540 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          os_log_t v541 = v540;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_521;
                          }
                          BOOL v554 = os_log_type_enabled(v540, OS_LOG_TYPE_INFO);

                          if (v554)
                          {
LABEL_521:
                            v555 = v1558;
                            os_log_t v556 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            id v3 = v555;
                            _NRLogWithArgs((uint64_t)v556, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v557, v558, v559, v560, v561, (uint64_t)"");

                            uint64_t v445 = v465;
                          }
                          else
                          {
                            uint64_t v445 = v465;
                            id v3 = v1558;
                          }
LABEL_461:
                          unint64_t v28 = 0x26AB22000uLL;
LABEL_462:
                          int v501 = *(unsigned __int16 *)(v428 + 80);
                          LODWORD(v1557) = *(_WORD *)(v428 + 80) != 0;
                          if (v501)
                          {
                            unint64_t v1564 = 0;
                            uint64_t v502 = v28;
                            if (!*(unsigned char *)(v28 + 1313)) {
                              goto LABEL_464;
                            }
                            os_log_t v522 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                            os_log_t v523 = v522;
                            if (sNRCopyLogToStdErr)
                            {

                              uint64_t v502 = 0x26AB22000;
                              goto LABEL_505;
                            }
                            LODWORD(v1551) = os_log_type_enabled(v522, OS_LOG_TYPE_INFO);

                            uint64_t v502 = 0x26AB22000;
                            if (v1551)
                            {
LABEL_505:
                              os_log_t v528 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              _NRLogWithArgs((uint64_t)v528, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v529, v530, v531, v532, v533, (uint64_t)"");
                            }
LABEL_464:
                            char v503 = (*(uint64_t (**)(void, void, void, unint64_t *, void, void))(*(void *)v1556 + 8))(**(void **)v1556, *(void *)v428, *(unsigned __int16 *)(v428 + 80), &v1564, 0, 0);
                            unint64_t v28 = v502;
                            if (*(unsigned char *)(v502 + 1313))
                            {
                              os_log_t v524 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              os_log_t v525 = v524;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                LODWORD(v1551) = os_log_type_enabled(v524, OS_LOG_TYPE_INFO);

                                unint64_t v28 = 0x26AB22000;
                                if (!v1551) {
                                  goto LABEL_465;
                                }
                              }
                              os_log_t v534 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              _NRLogWithArgs((uint64_t)v534, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v535, v536, v537, v538, v539, (uint64_t)"");

                              unint64_t v28 = 0x26AB22000;
                            }
LABEL_465:
                            if ((v503 & 1) == 0)
                            {
                              if (v1553)
                              {
                                v1553((uint64_t)v3);
                                unint64_t v28 = 0x26AB22000uLL;
                              }
                              *(unsigned char *)(v428 + 84) |= 1u;
                              switch(*(unsigned char *)(v428 + 83))
                              {
                                case 0:
                                  os_log_t v506 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  os_log_t v507 = v506;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    LODWORD(v1551) = os_log_type_enabled(v506, OS_LOG_TYPE_ERROR);

                                    unint64_t v28 = 0x26AB22000;
                                    if (!v1551) {
                                      goto LABEL_485;
                                    }
                                  }
                                  os_log_t v513 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  _NRLogWithArgs((uint64_t)v513, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v514, v515, v516, v517, v518, (uint64_t)"");
                                  goto LABEL_484;
                                case 1:
                                  uint64_t v510 = *((void *)v3 + 17);
                                  ++*((void *)v3 + 18);
                                  *((void *)v3 + 17) = v510 & 0xFFFFFFFFFFFFFFFELL | *(unsigned char *)(v428 + 84) & 1;
                                  if (!*(unsigned char *)(v28 + 1313)) {
                                    goto LABEL_480;
                                  }
                                  os_log_t v511 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  os_log_t v512 = v511;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    LODWORD(v1551) = os_log_type_enabled(v511, OS_LOG_TYPE_INFO);

                                    unint64_t v28 = 0x26AB22000;
                                    if (!v1551) {
                                      goto LABEL_485;
                                    }
                                  }
                                  os_log_t v513 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  _NRLogWithArgs((uint64_t)v513, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v587, v588, v589, v590, v591, (uint64_t)"");
                                  goto LABEL_484;
                                case 2:
                                  ++*((void *)v3 + 20);
                                  *((void *)v3 + 17) = *((void *)v3 + 17) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(unsigned char *)(v428 + 84) & 1));
                                  if (!*(unsigned char *)(v28 + 1313)) {
                                    goto LABEL_480;
                                  }
                                  os_log_t v508 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  os_log_t v509 = v508;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    LODWORD(v1551) = os_log_type_enabled(v508, OS_LOG_TYPE_INFO);

                                    unint64_t v28 = 0x26AB22000;
                                    if (!v1551) {
                                      goto LABEL_485;
                                    }
                                  }
                                  os_log_t v513 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  _NRLogWithArgs((uint64_t)v513, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v582, v583, v584, v585, v586, (uint64_t)"");
                                  goto LABEL_484;
                                case 3:
                                  ++*((void *)v3 + 22);
                                  *((void *)v3 + 17) = *((void *)v3 + 17) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(unsigned char *)(v428 + 84) & 1));
                                  if (!*(unsigned char *)(v28 + 1313))
                                  {
LABEL_480:
                                    int v504 = v456 | 0x1800;
                                    unint64_t v505 = v1564;
                                    if (v1564) {
                                      goto LABEL_487;
                                    }
                                    goto LABEL_493;
                                  }
                                  os_log_t v574 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  os_log_t v575 = v574;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    LODWORD(v1551) = os_log_type_enabled(v574, OS_LOG_TYPE_INFO);

                                    unint64_t v28 = 0x26AB22000;
                                    if (!v1551) {
                                      goto LABEL_485;
                                    }
                                  }
                                  os_log_t v513 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  _NRLogWithArgs((uint64_t)v513, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v592, v593, v594, v595, v596, (uint64_t)"");
LABEL_484:

                                  unint64_t v28 = 0x26AB22000uLL;
LABEL_485:
                                  int v504 = v456 | 0x1800;
                                  if (!*(unsigned char *)(v28 + 1313))
                                  {
                                    unint64_t v505 = v1564;
                                    if (!v1564) {
                                      goto LABEL_493;
                                    }
                                    goto LABEL_487;
                                  }
                                  os_log_t v526 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  os_log_t v527 = v526;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    LODWORD(v1551) = os_log_type_enabled(v526, OS_LOG_TYPE_INFO);

                                    if (!v1551) {
                                      goto LABEL_518;
                                    }
                                  }
                                  os_log_t v548 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                  _NRLogWithArgs((uint64_t)v548, 1, (uint64_t)"%s%.30s:%-4d ", v549, v550, v551, v552, v553, (uint64_t)"");

LABEL_518:
                                  unint64_t v28 = 0x26AB22000;
                                  unint64_t v505 = v1564;
                                  if (v1564) {
                                    goto LABEL_487;
                                  }
                                  break;
                                default:
                                  goto LABEL_485;
                              }
                              goto LABEL_493;
                            }
                            int v504 = v456 | 0x800;
                            unint64_t v505 = v1564;
                            if (!v1564)
                            {
LABEL_493:
                              LODWORD(v1559) = v1559 + 1;
                              if (v503)
                              {
                                unsigned int v520 = *(unsigned __int8 *)(v428 + 82);
                                if (v520 >= 0xB)
                                {
                                  unsigned int v520 = *(unsigned __int8 *)(v428 + 82)
                                       - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v428 + 82)) >> 32);
                                  *(unsigned char *)(v428 + 82) = v520;
                                }
                                int v435 = 0;
                                *(_DWORD *)(v428 + 4 * v520 + 36) = v504;
                                unsigned int v521 = (117 * (*(unsigned char *)(v428 + 82) + 1)) >> 8;
                                *(unsigned char *)(v428 + 82) = *(unsigned char *)(v428 + 82)
                                                      + 1
                                                      - 11
                                                      * ((v521
                                                        + (((*(unsigned char *)(v428 + 82) + 1 - v521) & 0xFE) >> 1)) >> 3);
                                if (!*(unsigned char *)(v28 + 1313)) {
                                  goto LABEL_414;
                                }
                                goto LABEL_410;
                              }
LABEL_546:
                              BOOL v598 = v501 == 0;
                              LODWORD(v597) = v1557;
                              if (!*(unsigned char *)(v28 + 1313))
                              {
                                int v599 = v504 | 0x8000;
                                if (v446) {
                                  goto LABEL_548;
                                }
LABEL_539:
                                if (!v3[13])
                                {
LABEL_554:
                                  if ((v597 & v598) == 1)
                                  {
                                    unsigned int v610 = *(unsigned __int8 *)(v428 + 82);
                                    if (v610 >= 0xB)
                                    {
                                      unsigned int v610 = *(unsigned __int8 *)(v428 + 82)
                                           - 11
                                           * ((390451573 * (unint64_t)*(unsigned __int8 *)(v428 + 82)) >> 32);
                                      *(unsigned char *)(v428 + 82) = v610;
                                    }
                                    *(_DWORD *)(v428 + 4 * v610 + 36) = v599;
                                    unsigned int v611 = (117 * (*(unsigned char *)(v428 + 82) + 1)) >> 8;
                                    *(unsigned char *)(v428 + 82) = *(unsigned char *)(v428 + 82)
                                                          + 1
                                                          - 11
                                                          * ((v611
                                                            + (((*(unsigned char *)(v428 + 82) + 1 - v611) & 0xFE) >> 1)) >> 3);
                                    int v435 = 8;
                                    id v3 = v1558;
                                    if (!*(unsigned char *)(v28 + 1313)) {
                                      goto LABEL_409;
                                    }
                                    goto LABEL_405;
                                  }
                                  id v27 = v1548;
                                  if (*(unsigned char *)(v28 + 1313))
                                  {
                                    char v1217 = v597;
                                    os_log_t v1218 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    uint64_t v597 = (uint64_t)v1218;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      id v27 = v1548;
                                    }
                                    else
                                    {
                                      BOOL v1247 = os_log_type_enabled(v1218, OS_LOG_TYPE_INFO);

                                      unint64_t v28 = 0x26AB22000;
                                      id v27 = v1548;
                                      LOBYTE(v597) = v1217;
                                      if (!v1247) {
                                        goto LABEL_594;
                                      }
                                    }
                                    uint64_t v597 = (uint64_t)_NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs(v597, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v1248, v1249, v1250, v1251, v1252, (uint64_t)"");

                                    LOBYTE(v597) = v1217;
                                    unint64_t v28 = 0x26AB22000;
                                  }
LABEL_594:
                                  v648 = v1558;
                                  id v12 = v1533;
                                  if (v597) {
                                    goto LABEL_641;
                                  }
                                  if (v1546 != 1)
                                  {
                                    if (v1546 != 2)
                                    {
                                      if (v1546 == 3)
                                      {
                                        uint64_t v649 = *((void *)v1558 + 17);
                                        if ((v649 & 8) != 0 && *v1545)
                                        {
                                          *((void *)v1558 + 17) = v649 & 0xFFFFFFFFFFFFFFF7;
                                          if (!*(unsigned char *)(v28 + 1313)) {
                                            goto LABEL_601;
                                          }
                                          os_log_t v1320 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                          os_log_t v1321 = v1320;
                                          if (sNRCopyLogToStdErr)
                                          {

                                            goto LABEL_1274;
                                          }
                                          BOOL v1418 = os_log_type_enabled(v1320, OS_LOG_TYPE_INFO);

                                          if (v1418)
                                          {
LABEL_1274:
                                            os_log_t v1345 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                            _NRLogWithArgs((uint64_t)v1345, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1419, v1420, v1421, v1422, v1423, (uint64_t)"");
LABEL_1275:
                                          }
LABEL_1276:
                                          id v12 = v1533;
                                          id v27 = v1548;
LABEL_601:
                                          v650 = v1545;
                                          goto LABEL_640;
                                        }
                                        goto LABEL_641;
                                      }
                                      uint64_t v651 = *((void *)v1558 + 17);
LABEL_624:
                                      if ((v651 & 8) != 0 && *v1545)
                                      {
                                        *((void *)v1558 + 17) = v651 & 0xFFFFFFFFFFFFFFF7;
                                        if (!*(unsigned char *)(v28 + 1313)) {
                                          goto LABEL_627;
                                        }
                                        os_log_t v1310 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                        os_log_t v1311 = v1310;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          v648 = v1558;
                                          id v12 = v1533;
                                          id v27 = v1548;
                                          goto LABEL_1257;
                                        }
                                        BOOL v1369 = os_log_type_enabled(v1310, OS_LOG_TYPE_INFO);

                                        v648 = v1558;
                                        id v12 = v1533;
                                        id v27 = v1548;
                                        if (v1369)
                                        {
LABEL_1257:
                                          os_log_t v1370 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                          _NRLogWithArgs((uint64_t)v1370, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1371, v1372, v1373, v1374, v1375, (uint64_t)"");
                                        }
LABEL_627:
                                        dispatch_resume(*((dispatch_object_t *)v648 + 38));
                                        uint64_t v651 = *((void *)v648 + 17);
                                      }
                                      if ((v651 & 0x10) != 0 && *((void *)v648 + 40))
                                      {
                                        *((void *)v648 + 17) = v651 & 0xFFFFFFFFFFFFFFEFLL;
                                        if (!gNRPacketLoggingEnabled) {
                                          goto LABEL_631;
                                        }
                                        os_log_t v1312 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                        os_log_t v1313 = v1312;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          v648 = v1558;
                                          id v12 = v1533;
                                          id v27 = v1548;
                                          goto LABEL_1259;
                                        }
                                        BOOL v1376 = os_log_type_enabled(v1312, OS_LOG_TYPE_INFO);

                                        v648 = v1558;
                                        id v12 = v1533;
                                        id v27 = v1548;
                                        if (v1376)
                                        {
LABEL_1259:
                                          os_log_t v1377 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                          _NRLogWithArgs((uint64_t)v1377, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1378, v1379, v1380, v1381, v1382, (uint64_t)"");
                                        }
LABEL_631:
                                        dispatch_resume(*((dispatch_object_t *)v648 + 40));
                                        uint64_t v651 = *((void *)v648 + 17);
                                      }
                                      if ((v651 & 0x20) == 0) {
                                        goto LABEL_636;
                                      }
                                      unint64_t v28 = 0x26AB22000uLL;
                                      if (*((void *)v648 + 42))
                                      {
                                        *((void *)v648 + 17) = v651 & 0xFFFFFFFFFFFFFFDFLL;
                                        if (!gNRPacketLoggingEnabled) {
                                          goto LABEL_635;
                                        }
                                        os_log_t v1314 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                        os_log_t v1315 = v1314;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          v648 = v1558;
                                          id v12 = v1533;
                                          id v27 = v1548;
                                          goto LABEL_1261;
                                        }
                                        BOOL v1383 = os_log_type_enabled(v1314, OS_LOG_TYPE_INFO);

                                        v648 = v1558;
                                        id v12 = v1533;
                                        id v27 = v1548;
                                        if (v1383)
                                        {
LABEL_1261:
                                          os_log_t v1384 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                          _NRLogWithArgs((uint64_t)v1384, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1385, v1386, v1387, v1388, v1389, (uint64_t)"");
                                        }
LABEL_635:
                                        dispatch_resume(*((dispatch_object_t *)v648 + 42));
                                        uint64_t v651 = *((void *)v648 + 17);
LABEL_636:
                                        unint64_t v28 = 0x26AB22000uLL;
                                      }
                                      if ((v651 & 0x40) == 0 || !*((void *)v648 + 44)) {
                                        goto LABEL_641;
                                      }
LABEL_639:
                                      v650 = (dispatch_object_t *)(v648 + 352);
                                      *((void *)v648 + 17) = v651 & 0xFFFFFFFFFFFFFFBFLL;
                                      if (*(unsigned char *)(v28 + 1313))
                                      {
                                        v1545 = (dispatch_object_t *)(v648 + 352);
                                        os_log_t v1304 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                        os_log_t v1305 = v1304;
                                        if (sNRCopyLogToStdErr)
                                        {
                                        }
                                        else
                                        {
                                          BOOL v1344 = os_log_type_enabled(v1304, OS_LOG_TYPE_INFO);

                                          if (!v1344) {
                                            goto LABEL_1276;
                                          }
                                        }
                                        os_log_t v1345 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v1345, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v1346, v1347, v1348, v1349, v1350, (uint64_t)"");
                                        goto LABEL_1275;
                                      }
LABEL_640:
                                      dispatch_resume(*v650);
                                      unint64_t v28 = 0x26AB22000uLL;
LABEL_641:
                                      if (*(unsigned char *)(v28 + 1313))
                                      {
                                        os_log_t v1219 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        os_log_t v1220 = v1219;
                                        if (sNRCopyLogToStdErr)
                                        {

                                          id v12 = v1533;
                                          id v27 = v1548;
                                        }
                                        else
                                        {
                                          BOOL v1253 = os_log_type_enabled(v1219, OS_LOG_TYPE_INFO);

                                          id v12 = v1533;
                                          id v27 = v1548;
                                          if (!v1253) {
                                            goto LABEL_642;
                                          }
                                        }
                                        os_log_t v1254 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v1254, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v1255, v1256, v1257, v1258, v1259, (uint64_t)"");
                                      }
LABEL_642:
                                      unsigned int v655 = *(unsigned __int8 *)(v428 + 82);
                                      if (v655 >= 0xB)
                                      {
                                        unsigned int v655 = *(unsigned __int8 *)(v428 + 82)
                                             - 11
                                             * ((390451573 * (unint64_t)*(unsigned __int8 *)(v428 + 82)) >> 32);
                                        *(unsigned char *)(v428 + 82) = v655;
                                      }
                                      *(_DWORD *)(v428 + 4 * v655 + 36) = v599 | 0x60000;
                                      unsigned int v656 = (117 * (*(unsigned char *)(v428 + 82) + 1)) >> 8;
                                      *(unsigned char *)(v428 + 82) = *(unsigned char *)(v428 + 82)
                                                            + 1
                                                            - 11
                                                            * ((v656
                                                              + (((*(unsigned char *)(v428 + 82) + 1 - v656) & 0xFE) >> 1)) >> 3);
                                      id v3 = v1558;
                                      goto LABEL_645;
                                    }
                                    uint64_t v652 = *((void *)v1558 + 17);
                                    if ((v652 & 8) != 0 && *v1545)
                                    {
                                      *((void *)v1558 + 17) = v652 & 0xFFFFFFFFFFFFFFF7;
                                      if (!*(unsigned char *)(v28 + 1313)) {
                                        goto LABEL_617;
                                      }
                                      os_log_t v1322 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                      os_log_t v1323 = v1322;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        v648 = v1558;
                                        id v12 = v1533;
                                        id v27 = v1548;
                                        goto LABEL_1278;
                                      }
                                      BOOL v1424 = os_log_type_enabled(v1322, OS_LOG_TYPE_INFO);

                                      v648 = v1558;
                                      id v12 = v1533;
                                      id v27 = v1548;
                                      if (v1424)
                                      {
LABEL_1278:
                                        os_log_t v1425 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                        _NRLogWithArgs((uint64_t)v1425, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1426, v1427, v1428, v1429, v1430, (uint64_t)"");
                                      }
LABEL_617:
                                      dispatch_resume(*((dispatch_object_t *)v648 + 38));
                                      uint64_t v652 = *((void *)v648 + 17);
                                      unint64_t v28 = 0x26AB22000uLL;
                                    }
                                    if ((v652 & 0x10) != 0 && *((void *)v648 + 40))
                                    {
                                      v650 = (dispatch_object_t *)(v648 + 320);
                                      *((void *)v648 + 17) = v652 & 0xFFFFFFFFFFFFFFEFLL;
                                      if (*(unsigned char *)(v28 + 1313))
                                      {
                                        v1545 = (dispatch_object_t *)(v648 + 320);
                                        os_log_t v653 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                        os_log_t v654 = v653;
                                        if (sNRCopyLogToStdErr)
                                        {
                                        }
                                        else
                                        {
                                          BOOL v1412 = os_log_type_enabled(v653, OS_LOG_TYPE_INFO);

                                          if (!v1412) {
                                            goto LABEL_1276;
                                          }
                                        }
                                        os_log_t v1345 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v1345, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1413, v1414, v1415, v1416, v1417, (uint64_t)"");
                                        goto LABEL_1275;
                                      }
                                      goto LABEL_640;
                                    }
                                    goto LABEL_641;
                                  }
                                  uint64_t v651 = *((void *)v1558 + 17);
                                  if ((v1558[10] & 4) == 0) {
                                    goto LABEL_624;
                                  }
                                  if ((v651 & 0x20) != 0 && *((void *)v1558 + 42))
                                  {
                                    *((void *)v1558 + 17) = v651 & 0xFFFFFFFFFFFFFFDFLL;
                                    if (!*(unsigned char *)(v28 + 1313)) {
                                      goto LABEL_610;
                                    }
                                    os_log_t v1390 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                    os_log_t v1391 = v1390;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v648 = v1558;
                                      id v12 = v1533;
                                      id v27 = v1548;
                                      goto LABEL_1296;
                                    }
                                    BOOL v1473 = os_log_type_enabled(v1390, OS_LOG_TYPE_INFO);

                                    v648 = v1558;
                                    id v12 = v1533;
                                    id v27 = v1548;
                                    if (v1473)
                                    {
LABEL_1296:
                                      os_log_t v1474 = _NRCopyLogObjectForNRUUID(*((void **)v648 + 5));
                                      _NRLogWithArgs((uint64_t)v1474, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1475, v1476, v1477, v1478, v1479, (uint64_t)"");
                                    }
LABEL_610:
                                    dispatch_resume(*((dispatch_object_t *)v648 + 42));
                                    uint64_t v651 = *((void *)v648 + 17);
                                    unint64_t v28 = 0x26AB22000;
                                  }
                                  if ((v651 & 0x40) == 0 || !*((void *)v648 + 44)) {
                                    goto LABEL_641;
                                  }
                                  goto LABEL_639;
                                }
LABEL_549:
                                if (v1559 <= 8u)
                                {
                                  if (!v1563) {
                                    goto LABEL_554;
                                  }
                                  unsigned int v609 = os_channel_available_slot_count();
                                  unint64_t v28 = 0x26AB22000uLL;
                                  if (v609 > 1) {
                                    goto LABEL_554;
                                  }
                                }
                                if (!*(unsigned char *)(v28 + 1313))
                                {
LABEL_553:
                                  int v599 = v504 | 0x18000;
                                  os_channel_sync();
                                  v1558[13] = 0;
                                  unint64_t v28 = 0x26AB22000uLL;
                                  goto LABEL_554;
                                }
                                int v615 = v597;
                                os_log_t v616 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                uint64_t v597 = (uint64_t)v616;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  BOOL v624 = os_log_type_enabled(v616, OS_LOG_TYPE_INFO);

                                  LODWORD(v597) = v615;
                                  if (!v624) {
                                    goto LABEL_553;
                                  }
                                }
                                uint64_t v597 = (uint64_t)_NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                _NRLogWithArgs(v597, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v625, v626, v627, v628, v629, (uint64_t)"");

                                LODWORD(v597) = v615;
                                goto LABEL_553;
                              }
                              int v612 = (int)v1557;
                              os_log_t v613 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              os_log_t v614 = v613;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_564;
                              }
                              BOOL v617 = os_log_type_enabled(v613, OS_LOG_TYPE_INFO);

                              if (v617)
                              {
LABEL_564:
                                os_log_t v618 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                _NRLogWithArgs((uint64_t)v618, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v619, v620, v621, v622, v623, (uint64_t)"");
                              }
                              unint64_t v28 = 0x26AB22000;
                              LODWORD(v597) = v612;
                              int v599 = v504 | 0x8000;
                              if (!v446) {
                                goto LABEL_539;
                              }
LABEL_548:
                              os_channel_advance_slot();
                              unint64_t v28 = 0x26AB22000;
                              v3[13] = 1;
                              goto LABEL_549;
                            }
LABEL_487:
                            if (v505 < *(unsigned __int16 *)(v428 + 80))
                            {
                              if (!*(unsigned char *)(v28 + 1313)) {
                                goto LABEL_489;
                              }
                              os_log_t v542 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              os_log_t v543 = v542;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_523;
                              }
                              LODWORD(v1551) = os_log_type_enabled(v542, OS_LOG_TYPE_INFO);

                              if (v1551)
                              {
LABEL_523:
                                os_log_t v562 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                _NRLogWithArgs((uint64_t)v562, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v563, v564, v565, v566, v567, (uint64_t)"");
                              }
LABEL_489:
                              v504 |= 0x2000u;
                              memmove(*(void **)v428, (const void *)(*(void *)v428 + v1564), *(unsigned __int16 *)(v428 + 80) - v1564);
                              unint64_t v519 = v1564;
                              *(_WORD *)(v428 + 80) -= v1564;
                              uint64_t v1555 = (v1555 + 1);
                              unint64_t v28 = 0x26AB22000;
LABEL_492:
                              *(void *)&v3[v1554] += v519;
                              goto LABEL_493;
                            }
                            if (!*(unsigned char *)(v28 + 1313))
                            {
LABEL_491:
                              v504 |= 0x4000u;
                              *(_WORD *)(v428 + 80) = 0;
                              unint64_t v519 = v1564;
                              goto LABEL_492;
                            }
                            os_log_t v544 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                            os_log_t v545 = v544;
                            if (sNRCopyLogToStdErr)
                            {
                            }
                            else
                            {
                              LODWORD(v1551) = os_log_type_enabled(v544, OS_LOG_TYPE_INFO);

                              unint64_t v28 = 0x26AB22000;
                              if (!v1551) {
                                goto LABEL_491;
                              }
                            }
                            os_log_t v568 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                            _NRLogWithArgs((uint64_t)v568, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v569, v570, v571, v572, v573, (uint64_t)"");

                            unint64_t v28 = 0x26AB22000;
                            goto LABEL_491;
                          }
                          int v504 = v456 | 0x400;
                          if (!*(unsigned char *)(v28 + 1313))
                          {
                            LODWORD(v597) = 0;
                            BOOL v598 = 1;
                            int v599 = v456 | 0x8400;
                            if (v446) {
                              goto LABEL_548;
                            }
                            goto LABEL_539;
                          }
                          os_log_t v600 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                          os_log_t v601 = v600;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_544;
                          }
                          BOOL v602 = os_log_type_enabled(v600, OS_LOG_TYPE_INFO);

                          if (v602)
                          {
LABEL_544:
                            id v3 = v1558;
                            os_log_t v603 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            _NRLogWithArgs((uint64_t)v603, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v604, v605, v606, v607, v608, (uint64_t)"");
                          }
                          else
                          {
                            id v3 = v1558;
                          }
                          unint64_t v28 = 0x26AB22000uLL;
                          goto LABEL_546;
                        }
                        os_channel_slot_get_packet();
                        os_packet_get_next_buflet();
                        unsigned int v467 = os_buflet_get_data_offset();
                        uint64_t v468 = os_buflet_get_object_address();
                        unsigned int v469 = os_buflet_get_data_length();
                        if (v469 >= 0x10000)
                        {
                          if (nrCopyLogObj_onceToken_521 != -1) {
                            dispatch_once(&nrCopyLogObj_onceToken_521, &__block_literal_global_400);
                          }
                          if (sNRCopyLogToStdErr
                            || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_522, OS_LOG_TYPE_ERROR))
                          {
                            goto LABEL_580;
                          }
LABEL_388:
                          _os_log_pack_size();
                          MEMORY[0x270FA5388]();
                          __error();
                          uint64_t v416 = _os_log_pack_fill();
                          *(_DWORD *)uint64_t v416 = 136446210;
                          *(void *)(v416 + 4) = "NRBluetoothPacketParserNexusToLinkLoop";
                          id v417 = nrCopyLogObj_518();
                          _NRLogAbortWithPack(v417);
                        }
                        unsigned __int16 v470 = v469;
                        if (!(_WORD)v469 && WORD1(v1566))
                        {
                          unint64_t v1564 = 0;
                          uint64_t v1565 = 0;
                          unint64_t v1564 = *(void *)v428 + *(unsigned __int16 *)(v428 + 80);
                          LODWORD(v1565) = v466;
                          int v471 = nrPacketToTLV((unsigned __int8 *)v1567, WORD1(v1566), (uint64_t)&v1564, 1u, (uint64_t)ESPSequenceNumberFromPacket, (uint64_t)v1560);
                          id v3 = v1558;
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_433:
                            v456 |= 0x80u;
                            goto LABEL_439;
                          }
                          os_log_t v476 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          os_log_t v477 = v476;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            BOOL v482 = os_log_type_enabled(v476, OS_LOG_TYPE_INFO);

                            if (!v482) {
                              goto LABEL_433;
                            }
                          }
                          os_log_t v483 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                          getESPSequenceNumberFromPacket(v1567, WORD1(v1566));
                          getESPSPIFromPacket(v1567, WORD1(v1566));
                          _NRLogWithArgs((uint64_t)v483, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v484, v485, v486, v487, v488, (uint64_t)"");

                          goto LABEL_433;
                        }
                        if ((_WORD)v469)
                        {
                          v472 = (unsigned __int8 *)(v468 + v467);
                          unint64_t v1564 = 0;
                          uint64_t v1565 = 0;
                          unint64_t v1564 = *(void *)v428 + *(unsigned __int16 *)(v428 + 80);
                          LODWORD(v1565) = v466;
                          int v471 = nrPacketToTLV(v472, (unsigned __int16)v469, (uint64_t)&v1564, 1u, (uint64_t)ESPSequenceNumberFromPacket, (uint64_t)v1560);
                          id v3 = v1558;
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_436:
                            v456 |= 0x100u;
                            goto LABEL_439;
                          }
                          os_log_t v478 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          os_log_t v479 = v478;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v1557) = os_log_type_enabled(v478, OS_LOG_TYPE_INFO);

                            if (!v1557) {
                              goto LABEL_436;
                            }
                          }
                          os_log_t v1557 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                          getESPSequenceNumberFromPacket((uint64_t)v472, v470);
                          getESPSPIFromPacket((uint64_t)v472, v470);
                          os_log_t v489 = v1557;
                          _NRLogWithArgs((uint64_t)v1557, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v490, v491, v492, v493, v494, (uint64_t)"");

                          goto LABEL_436;
                        }
                        v456 |= 0x200u;
                        if (!gNRPacketLoggingEnabled)
                        {
                          int v471 = 0;
                          id v3 = v1558;
                          goto LABEL_439;
                        }
                        id v3 = v1558;
                        os_log_t v480 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                        os_log_t v481 = v480;
                        if (sNRCopyLogToStdErr)
                        {
                        }
                        else
                        {
                          int v471 = os_log_type_enabled(v480, OS_LOG_TYPE_INFO);

                          if (!v471) {
                            goto LABEL_439;
                          }
                        }
                        os_log_t v495 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                        _NRLogWithArgs((uint64_t)v495, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v496, v497, v498, v499, v500, (uint64_t)"");

                        int v471 = 0;
LABEL_439:
                        *(_WORD *)(v428 + 80) += v471;
                        if ((v1562 & 8) != 0) {
                          uint64_t v473 = 0;
                        }
                        else {
                          uint64_t v473 = os_channel_get_next_slot();
                        }
                        ++v430;
                        ++*((void *)v3 + 54);
                        v3[14] = 1;
                        v429 += v471;
                        if (!v473)
                        {
                          uint64_t v445 = 0;
                          uint64_t v446 = v465;
                          goto LABEL_461;
                        }
                        unsigned int v474 = *(unsigned __int8 *)(v428 + 82);
                        if (v474 >= 0xB)
                        {
                          unsigned int v474 = *(unsigned __int8 *)(v428 + 82)
                               - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v428 + 82)) >> 32);
                          *(unsigned char *)(v428 + 82) = v474;
                        }
                        *(_DWORD *)(v428 + 4 * v474 + 36) = v456;
                        unsigned int v475 = (117 * (*(unsigned char *)(v428 + 82) + 1)) >> 8;
                        *(unsigned char *)(v428 + 82) = *(unsigned char *)(v428 + 82)
                                              + 1
                                              - 11
                                              * ((v475
                                                + (((*(unsigned char *)(v428 + 82) + 1 - v475) & 0xFE) >> 1)) >> 3);
                        uint64_t v446 = v465;
                        uint64_t v465 = v473;
                        int v456 = 0;
                      }
                    }
                    os_log_t v546 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v547 = v546;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      LODWORD(v1557) = os_log_type_enabled(v546, OS_LOG_TYPE_INFO);

                      unint64_t v28 = 0x26AB22000;
                      if (!v1557) {
                        goto LABEL_423;
                      }
                    }
                    os_log_t v576 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    _NRLogWithArgs((uint64_t)v576, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v577, v578, v579, v580, v581, (uint64_t)"");

                    unint64_t v28 = 0x26AB22000;
                    goto LABEL_423;
                  }
                  if (!*(unsigned char *)(v28 + 1313))
                  {
LABEL_571:
                    if (v1553) {
                      v1553((uint64_t)v3);
                    }
                    unsigned int v630 = *(unsigned __int8 *)(v428 + 82);
                    if (v630 >= 0xB)
                    {
                      unsigned int v630 = *(unsigned __int8 *)(v428 + 82)
                           - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v428 + 82)) >> 32);
                      *(unsigned char *)(v428 + 82) = v630;
                    }
                    *(_DWORD *)(v428 + 4 * v630 + 36) = 3;
                    unsigned int v631 = (117 * (*(unsigned char *)(v428 + 82) + 1)) >> 8;
                    *(unsigned char *)(v428 + 82) = *(unsigned char *)(v428 + 82)
                                          + 1
                                          - 11
                                          * ((v631 + (((*(unsigned char *)(v428 + 82) + 1 - v631) & 0xFE) >> 1)) >> 3);
                    goto LABEL_645;
                  }
                  os_log_t v690 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                  os_log_t v691 = v690;
                  if (sNRCopyLogToStdErr)
                  {

                    id v3 = v1558;
                  }
                  else
                  {
                    BOOL v977 = os_log_type_enabled(v690, OS_LOG_TYPE_INFO);

                    id v3 = v1558;
                    if (!v977) {
                      goto LABEL_571;
                    }
                  }
                  os_log_t v978 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                  _NRLogWithArgs((uint64_t)v978, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v979, v980, v981, v982, v983, (uint64_t)"");

                  goto LABEL_571;
                }
                int v37 = 0;
                BOOL v38 = (v11 & 4) == 0;
                uint64_t v39 = 20;
                if (!v38) {
                  uint64_t v39 = 21;
                }
                v40 = (unsigned __int8 *)&NRParserLinkWriteAvailable_priorityArrayForMedium;
                if (v38)
                {
                  v40 = (unsigned __int8 *)&NRParserLinkWriteAvailable_priorityArrayFull;
                  int v41 = 4;
                }
                else
                {
                  int v41 = 2;
                }
                BOOL v42 = v7 == 1;
                if (v7 == 1)
                {
                  int v43 = v41;
                }
                else
                {
                  uint64_t v39 = 20;
                  int v43 = 4;
                }
                int v44 = v43 - 1;
                int v45 = (v43 - 1) & v1558[v39];
                uint64_t v1515 = v39;
                v1558[v39] = v45;
                if (v42) {
                  v46 = v40;
                }
                else {
                  v46 = (unsigned __int8 *)&NRParserLinkWriteAvailable_priorityArrayFull;
                }
                v1544 = v46;
                v1527 = (const char **)(v3 + 232);
                v1526 = (id *)(v3 + 288);
                v1531 = (id *)(v3 + 352);
                v1525 = v3 + 480;
                v1524 = v3 + 17;
                v1523 = (const char **)(v3 + 224);
                v1522 = (id *)(v3 + 272);
                v1528 = (id *)(v3 + 336);
                v1521 = v3 + 464;
                v1520 = v3 + 16;
                v1519 = (const char **)(v3 + 216);
                v1518 = (id *)(v3 + 256);
                v1530 = (id *)(v3 + 320);
                v1517 = v3 + 448;
                v1516 = v3 + 15;
                v1539 = (const char **)(v3 + 208);
                v1538 = (id *)(v3 + 240);
                v1541 = (id *)(v3 + 304);
                v1537 = v3 + 432;
                v1536 = v3 + 14;
                v1529 = v3 + 112;
                v1534 = v3 + 96;
                v1535 = v3 + 128;
                v1560 = v3 + 672;
                v1559 = v3 + 688;
                v1533 = v12;
                int v1543 = v43;
                int v1542 = v43 - 1;
                while (1)
                {
                  int v50 = v45 & v44;
                  if (v3[8] != 4) {
                    break;
                  }
LABEL_64:
                  int v45 = v50 + 1;
                  if (++v37 == v43)
                  {
                    ++v3[v1515];
                    goto LABEL_1165;
                  }
                }
                v1546 = &v1515;
                LODWORD(v1548) = v37;
                v1547 = (dispatch_object_t *)(v45 & v44);
                int v51 = v1544[(v45 & v44)];
                dispatch_assert_queue_V2(*((dispatch_queue_t *)v3 + 7));
                switch(v51)
                {
                  case 'd':
                    v52 = NRBluetoothPacketParserSuspendNexusVOInputSource;
                    int v53 = 1;
                    v54 = v1539;
                    v55 = v1538;
                    v56 = v1541;
                    ESPSequenceNumberFromPacket = v1536;
                    v57 = (id *)&v1568;
                    break;
                  case 'e':
                    v52 = NRBluetoothPacketParserSuspendNexusVIInputSource;
                    int v53 = 1;
                    v54 = v1519;
                    v55 = v1518;
                    v56 = v1530;
                    ESPSequenceNumberFromPacket = v1516;
                    v57 = (id *)&v1550;
                    break;
                  case 'g':
                    int v53 = 0;
                    v52 = NRBluetoothPacketParserSuspendNexusBKInputSource;
                    v54 = v1527;
                    v55 = v1526;
                    v56 = v1531;
                    ESPSequenceNumberFromPacket = v1524;
                    v57 = (id *)&v1558;
                    break;
                  case 'f':
                    int v53 = 0;
                    v52 = NRBluetoothPacketParserSuspendNexusBEInputSource;
                    v54 = v1523;
                    v55 = v1522;
                    v56 = v1528;
                    ESPSequenceNumberFromPacket = v1520;
                    v57 = (id *)&v1554;
                    break;
                  default:
                    ESPSequenceNumberFromPacket = 0;
                    v52 = 0;
                    int v53 = 0;
                    v58 = 0;
                    v49 = 0;
                    id v1563 = 0;
                    v1549 = 0;
LABEL_75:
                    unint64_t v59 = 0x26AB22000uLL;
                    if (!gNRPacketLoggingEnabled) {
                      goto LABEL_76;
                    }
                    v293 = v49;
                    os_log_t v294 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v295 = v294;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      BOOL v306 = os_log_type_enabled(v294, OS_LOG_TYPE_INFO);

                      unint64_t v59 = 0x26AB22000;
                      v49 = v293;
                      if (!v306) {
                        goto LABEL_76;
                      }
                    }
                    os_log_t v307 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    _NRLogWithArgs((uint64_t)v307, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v308, v309, v310, v311, v312, (uint64_t)"");

                    v49 = v293;
                    unint64_t v59 = 0x26AB22000;
LABEL_76:
                    unsigned int v60 = *v12;
                    int v61 = (v60 >> 3) & 1;
                    if (v51 != 100) {
                      int v61 = 0;
                    }
                    LODWORD(v1562) = v61;
                    if (v61)
                    {
                      int v62 = 3;
                      v63 = v1535;
                      v64 = "Isochronous";
                      goto LABEL_96;
                    }
                    if (!v53) {
                      goto LABEL_95;
                    }
                    if ((v60 & 4) != 0)
                    {
                      v63 = v1529;
LABEL_280:
                      id v3 = v1558;
                      int v62 = 2;
                      v64 = "High";
                      v67 = (void *)*v63;
                      if (*v63) {
                        goto LABEL_97;
                      }
                      goto LABEL_281;
                    }
                    id v3 = v1558;
                    uint64_t v65 = *((void *)v1558 + 13);
                    if (!v65)
                    {
                      int v62 = 1;
                      v63 = v1534;
                      v64 = "Medium";
                      v67 = (void *)*v1534;
                      if (*v1534)
                      {
LABEL_97:
                        v1545 = v49;
                        uint64_t v68 = v67[3];
                        if ((*(unsigned char *)(v68 + 84) & 1) == 0)
                        {
                          int v1532 = v62;
                          uint64_t v1555 = (uint64_t)v63;
                          v1552 = v52;
                          v1540 = v64;
                          int v69 = 0;
                          __int16 v70 = 0;
                          LODWORD(v1556) = 0;
                          v1551 = *(const char **)(v68 + 8);
                          int v71 = *(unsigned __int8 *)(v68 + 83);
                          uint64_t v72 = 568;
                          if (v71 == 3) {
                            uint64_t v72 = 584;
                          }
                          BOOL v38 = v71 == 2;
                          uint64_t v73 = 600;
                          if (!v38) {
                            uint64_t v73 = v72;
                          }
                          v1553 = (void (*)(uint64_t))v73;
                          int v74 = 9;
                          if (*(unsigned char *)(v59 + 1313))
                          {
LABEL_103:
                            os_log_t v75 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            os_log_t v76 = v75;
                            if (sNRCopyLogToStdErr)
                            {

                              goto LABEL_106;
                            }
                            BOOL v77 = os_log_type_enabled(v75, OS_LOG_TYPE_INFO);

                            unint64_t v59 = 0x26AB22000;
                            if (v77)
                            {
LABEL_106:
                              os_log_t v78 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                              _NRLogWithArgs((uint64_t)v78, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v79, v80, v81, v82, v83, (uint64_t)"");

                              unint64_t v59 = 0x26AB22000uLL;
                            }
                          }
LABEL_107:
                          os_log_t v1557 = 0;
                          os_log_t v84 = 0;
                          uint64_t v1554 = 0;
                          long long v1568 = 0u;
                          long long v1569 = 0u;
                          long long v1566 = 0u;
                          long long v1567 = 0u;
                          if (*(unsigned char *)(v59 + 1313))
                          {
LABEL_108:
                            os_log_t v85 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            os_log_t v86 = v85;
                            if (sNRCopyLogToStdErr)
                            {

                              goto LABEL_111;
                            }
                            BOOL v87 = os_log_type_enabled(v85, OS_LOG_TYPE_INFO);

                            unint64_t v59 = 0x26AB22000;
                            if (v87)
                            {
LABEL_111:
                              os_log_t v88 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                              _NRLogWithArgs((uint64_t)v88, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v89, v90, v91, v92, v93, (uint64_t)"");

                              unint64_t v59 = 0x26AB22000;
                            }
                          }
                          while (2)
                          {
                            int v94 = v74 | 0x10;
                            if ((v1562 & 1) == 0)
                            {
                              unsigned int v96 = *(_DWORD *)(v68 + 28);
                              uint64_t v95 = *(unsigned int *)(v68 + 32);
                              if (v96 > v95)
                              {
                                uint64_t v97 = *(unsigned __int16 *)(v68 + 80);
                                if ((unsigned __int16)(v96 - v95) >= (unsigned __int16)(0x4000 - v97)) {
                                  size_t v98 = (unsigned __int16)(0x4000 - v97);
                                }
                                else {
                                  size_t v98 = (unsigned __int16)(v96 - v95);
                                }
                                v99 = (char *)v1551;
                                memcpy((void *)(*(void *)v68 + v97), &v1551[v95], v98);
                                unsigned int v100 = *(_DWORD *)(v68 + 28);
                                unsigned int v101 = *(_DWORD *)(v68 + 32) + v98;
                                *(_DWORD *)(v68 + 32) = v101;
                                if (v100 <= v101)
                                {
                                  int v102 = 0;
                                }
                                else
                                {
                                  memmove(v99, &v99[v101], v100 - v101);
                                  int v102 = *(_DWORD *)(v68 + 28) - *(_DWORD *)(v68 + 32);
                                }
                                unint64_t v59 = 0x26AB22000uLL;
                                *(_DWORD *)(v68 + 28) = v102;
                                *(_DWORD *)(v68 + 32) = 0;
                                *(_WORD *)(v68 + 80) += v98;
                                if (gNRPacketLoggingEnabled)
                                {
                                  os_log_t v199 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  os_log_t v200 = v199;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    LODWORD(v1550) = os_log_type_enabled(v199, OS_LOG_TYPE_INFO);

                                    unint64_t v59 = 0x26AB22000;
                                    if (!v1550) {
                                      goto LABEL_121;
                                    }
                                  }
                                  os_log_t v227 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  _NRLogWithArgs((uint64_t)v227, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v228, v229, v230, v231, v232, (uint64_t)"");

                                  unint64_t v59 = 0x26AB22000;
                                }
LABEL_121:
                                int v94 = v74 | 0x30;
                                v69 += v98;
                              }
                            }
                            os_log_t v103 = v1557;
                            if (v1563)
                            {
                              os_log_t v103 = (os_log_t)os_channel_get_next_slot();
                              unint64_t v59 = 0x26AB22000;
                            }
                            if (!v103)
                            {
                              os_log_t v149 = 0;
                              goto LABEL_170;
                            }
LABEL_125:
                            unsigned int v104 = 0x4000 - *(unsigned __int16 *)(v68 + 80);
                            if (v104 < nrMaxTLVLengthForPacket(v1567, WORD1(v1566)))
                            {
                              v94 |= 0x40u;
                              unint64_t v59 = 0x26AB22000uLL;
                              if (!gNRPacketLoggingEnabled)
                              {
                                os_log_t v149 = v103;
                                goto LABEL_170;
                              }
                              os_log_t v193 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                              os_log_t v194 = v193;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_229;
                              }
                              LODWORD(v1557) = os_log_type_enabled(v193, OS_LOG_TYPE_INFO);

                              if (v1557)
                              {
LABEL_229:
                                os_log_t v207 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                _NRLogWithArgs((uint64_t)v207, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v208, v209, v210, v211, v212, (uint64_t)"");
                              }
                              os_log_t v149 = v103;
LABEL_169:
                              unint64_t v59 = 0x26AB22000uLL;
LABEL_170:
                              int v150 = *(unsigned __int16 *)(v68 + 80);
                              BOOL v151 = *(_WORD *)(v68 + 80) != 0;
                              if (*(_WORD *)(v68 + 80))
                              {
                                os_log_t v1557 = v149;
                                unint64_t v1564 = 0;
                                uint64_t v152 = v59;
                                if (!*(unsigned char *)(v59 + 1313)) {
                                  goto LABEL_172;
                                }
                                os_log_t v175 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                os_log_t v176 = v175;
                                if (sNRCopyLogToStdErr)
                                {

                                  uint64_t v152 = 0x26AB22000;
                                  goto LABEL_213;
                                }
                                LODWORD(v1550) = os_log_type_enabled(v175, OS_LOG_TYPE_INFO);

                                uint64_t v152 = 0x26AB22000;
                                if (v1550)
                                {
LABEL_213:
                                  os_log_t v181 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  _NRLogWithArgs((uint64_t)v181, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v182, v183, v184, v185, v186, (uint64_t)"");
                                }
LABEL_172:
                                char v153 = (*(uint64_t (**)(void, void, void, unint64_t *, void, void))(*(void *)v1555 + 8))(**(void **)v1555, *(void *)v68, *(unsigned __int16 *)(v68 + 80), &v1564, 0, 0);
                                unint64_t v59 = v152;
                                if (*(unsigned char *)(v152 + 1313))
                                {
                                  os_log_t v177 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  os_log_t v178 = v177;
                                  if (sNRCopyLogToStdErr)
                                  {
                                  }
                                  else
                                  {
                                    LODWORD(v1550) = os_log_type_enabled(v177, OS_LOG_TYPE_INFO);

                                    unint64_t v59 = 0x26AB22000;
                                    if (!v1550) {
                                      goto LABEL_173;
                                    }
                                  }
                                  os_log_t v187 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v188, v189, v190, v191, v192, (uint64_t)"");

                                  unint64_t v59 = 0x26AB22000;
                                }
LABEL_173:
                                if ((v153 & 1) == 0)
                                {
                                  if (v1552)
                                  {
                                    v1552((uint64_t)v1558);
                                    unint64_t v59 = 0x26AB22000uLL;
                                  }
                                  *(unsigned char *)(v68 + 84) |= 1u;
                                  switch(*(unsigned char *)(v68 + 83))
                                  {
                                    case 0:
                                      os_log_t v156 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      os_log_t v157 = v156;
                                      if (sNRCopyLogToStdErr)
                                      {
                                      }
                                      else
                                      {
                                        LODWORD(v1550) = os_log_type_enabled(v156, OS_LOG_TYPE_ERROR);

                                        unint64_t v59 = 0x26AB22000;
                                        if (!v1550) {
                                          goto LABEL_193;
                                        }
                                      }
                                      os_log_t v166 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      _NRLogWithArgs((uint64_t)v166, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v167, v168, v169, v170, v171, (uint64_t)"");
                                      goto LABEL_192;
                                    case 1:
                                      v164 = v1558;
                                      uint64_t v165 = *((void *)v1558 + 17);
                                      ++*((void *)v1558 + 18);
                                      *((void *)v164 + 17) = v165 & 0xFFFFFFFFFFFFFFFELL | *(unsigned char *)(v68 + 84) & 1;
                                      if (!*(unsigned char *)(v59 + 1313)) {
                                        goto LABEL_188;
                                      }
                                      os_log_t v225 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      os_log_t v226 = v225;
                                      if (sNRCopyLogToStdErr)
                                      {
                                      }
                                      else
                                      {
                                        LODWORD(v1550) = os_log_type_enabled(v225, OS_LOG_TYPE_INFO);

                                        unint64_t v59 = 0x26AB22000;
                                        if (!v1550) {
                                          goto LABEL_193;
                                        }
                                      }
                                      os_log_t v166 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      _NRLogWithArgs((uint64_t)v166, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v243, v244, v245, v246, v247, (uint64_t)"");
                                      goto LABEL_192;
                                    case 2:
                                      v158 = v1558;
                                      ++*((void *)v1558 + 20);
                                      *((void *)v158 + 17) = *((void *)v158 + 17) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(unsigned char *)(v68 + 84) & 1));
                                      if (!*(unsigned char *)(v59 + 1313)) {
                                        goto LABEL_188;
                                      }
                                      os_log_t v159 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      os_log_t v160 = v159;
                                      if (sNRCopyLogToStdErr)
                                      {
                                      }
                                      else
                                      {
                                        LODWORD(v1550) = os_log_type_enabled(v159, OS_LOG_TYPE_INFO);

                                        unint64_t v59 = 0x26AB22000;
                                        if (!v1550) {
                                          goto LABEL_193;
                                        }
                                      }
                                      os_log_t v166 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      _NRLogWithArgs((uint64_t)v166, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v233, v234, v235, v236, v237, (uint64_t)"");
                                      goto LABEL_192;
                                    case 3:
                                      v161 = v1558;
                                      ++*((void *)v1558 + 22);
                                      *((void *)v161 + 17) = *((void *)v161 + 17) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(unsigned char *)(v68 + 84) & 1));
                                      if (!*(unsigned char *)(v59 + 1313))
                                      {
LABEL_188:
                                        int v154 = v94 | 0x1800;
                                        unint64_t v155 = v1564;
                                        if (v1564) {
                                          goto LABEL_195;
                                        }
                                        goto LABEL_201;
                                      }
                                      os_log_t v162 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      os_log_t v163 = v162;
                                      if (sNRCopyLogToStdErr)
                                      {
                                      }
                                      else
                                      {
                                        LODWORD(v1550) = os_log_type_enabled(v162, OS_LOG_TYPE_INFO);

                                        unint64_t v59 = 0x26AB22000;
                                        if (!v1550) {
                                          goto LABEL_193;
                                        }
                                      }
                                      os_log_t v166 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      _NRLogWithArgs((uint64_t)v166, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v238, v239, v240, v241, v242, (uint64_t)"");
LABEL_192:

                                      unint64_t v59 = 0x26AB22000uLL;
LABEL_193:
                                      int v154 = v94 | 0x1800;
                                      if (!*(unsigned char *)(v59 + 1313))
                                      {
                                        unint64_t v155 = v1564;
                                        if (!v1564) {
                                          goto LABEL_201;
                                        }
                                        goto LABEL_195;
                                      }
                                      os_log_t v179 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      os_log_t v180 = v179;
                                      if (sNRCopyLogToStdErr)
                                      {
                                      }
                                      else
                                      {
                                        LODWORD(v1550) = os_log_type_enabled(v179, OS_LOG_TYPE_INFO);

                                        if (!v1550) {
                                          goto LABEL_226;
                                        }
                                      }
                                      os_log_t v201 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                      _NRLogWithArgs((uint64_t)v201, 1, (uint64_t)"%s%.30s:%-4d ", v202, v203, v204, v205, v206, (uint64_t)"");

LABEL_226:
                                      unint64_t v59 = 0x26AB22000;
                                      unint64_t v155 = v1564;
                                      if (v1564) {
                                        goto LABEL_195;
                                      }
                                      break;
                                    default:
                                      goto LABEL_193;
                                  }
                                  goto LABEL_201;
                                }
                                int v154 = v94 | 0x800;
                                unint64_t v155 = v1564;
                                if (!v1564)
                                {
LABEL_201:
                                  LODWORD(v1556) = v1556 + 1;
                                  if (v153)
                                  {
                                    unsigned int v173 = *(unsigned __int8 *)(v68 + 82);
                                    if (v173 >= 0xB)
                                    {
                                      unsigned int v173 = *(unsigned __int8 *)(v68 + 82)
                                           - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v68 + 82)) >> 32);
                                      *(unsigned char *)(v68 + 82) = v173;
                                    }
                                    int v74 = 0;
                                    *(_DWORD *)(v68 + 4 * v173 + 36) = v154;
                                    unsigned int v174 = (117 * (*(unsigned char *)(v68 + 82) + 1)) >> 8;
                                    *(unsigned char *)(v68 + 82) = *(unsigned char *)(v68 + 82)
                                                         + 1
                                                         - 11
                                                         * ((v174
                                                           + (((*(unsigned char *)(v68 + 82) + 1 - v174) & 0xFE) >> 1)) >> 3);
                                    if (!*(unsigned char *)(v59 + 1313)) {
                                      continue;
                                    }
                                    goto LABEL_108;
                                  }
LABEL_254:
                                  BOOL v248 = v150 == 0;
                                  if (!*(unsigned char *)(v59 + 1313))
                                  {
                                    int v249 = v154 | 0x8000;
                                    if (v84) {
                                      goto LABEL_256;
                                    }
LABEL_247:
                                    if (!v1558[13])
                                    {
LABEL_262:
                                      if (v151 && v248)
                                      {
                                        unsigned int v260 = *(unsigned __int8 *)(v68 + 82);
                                        if (v260 >= 0xB)
                                        {
                                          unsigned int v260 = *(unsigned __int8 *)(v68 + 82)
                                               - 11
                                               * ((390451573 * (unint64_t)*(unsigned __int8 *)(v68 + 82)) >> 32);
                                          *(unsigned char *)(v68 + 82) = v260;
                                        }
                                        *(_DWORD *)(v68 + 4 * v260 + 36) = v249;
                                        unsigned int v261 = (117 * (*(unsigned char *)(v68 + 82) + 1)) >> 8;
                                        *(unsigned char *)(v68 + 82) = *(unsigned char *)(v68 + 82)
                                                             + 1
                                                             - 11
                                                             * ((v261
                                                               + (((*(unsigned char *)(v68 + 82) + 1 - v261) & 0xFE) >> 1)) >> 3);
                                        int v74 = 8;
                                        if (!*(unsigned char *)(v59 + 1313)) {
                                          goto LABEL_107;
                                        }
                                        goto LABEL_103;
                                      }
                                      if (*(unsigned char *)(v59 + 1313))
                                      {
                                        os_log_t v320 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        os_log_t v321 = v320;
                                        if (sNRCopyLogToStdErr)
                                        {
                                        }
                                        else
                                        {
                                          BOOL v327 = os_log_type_enabled(v320, OS_LOG_TYPE_INFO);

                                          unint64_t v59 = 0x26AB22000;
                                          if (!v327) {
                                            goto LABEL_285;
                                          }
                                        }
                                        os_log_t v328 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v328, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v329, v330, v331, v332, v333, (uint64_t)"");

                                        unint64_t v59 = 0x26AB22000;
                                      }
LABEL_285:
                                      id v3 = v1558;
                                      if (v151) {
                                        goto LABEL_325;
                                      }
                                      if (v1532 != 1)
                                      {
                                        if (v1532 != 2)
                                        {
                                          if (v1532 == 3)
                                          {
                                            uint64_t v283 = *((void *)v1558 + 17);
                                            if ((v283 & 8) != 0 && *v1541)
                                            {
                                              *((void *)v1558 + 17) = v283 & 0xFFFFFFFFFFFFFFF7;
                                              v284 = (dispatch_object_t *)v1541;
                                              if (*(unsigned char *)(v59 + 1313))
                                              {
                                                os_log_t v285 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                                os_log_t v286 = v285;
                                                if (sNRCopyLogToStdErr)
                                                {

                                                  id v3 = v1558;
                                                  goto LABEL_372;
                                                }
                                                BOOL v387 = os_log_type_enabled(v285, OS_LOG_TYPE_INFO);

                                                v284 = (dispatch_object_t *)v1541;
                                                id v3 = v1558;
                                                if (v387)
                                                {
LABEL_372:
                                                  os_log_t v366 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                                  _NRLogWithArgs((uint64_t)v366, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v388, v389, v390, v391, v392, (uint64_t)"");
                                                  v372 = (id *)&v1570;
                                                  goto LABEL_375;
                                                }
                                              }
                                              goto LABEL_324;
                                            }
                                            goto LABEL_325;
                                          }
                                          uint64_t v287 = *((void *)v1558 + 17);
LABEL_308:
                                          if ((v287 & 8) != 0 && *v1541)
                                          {
                                            *((void *)v1558 + 17) = v287 & 0xFFFFFFFFFFFFFFF7;
                                            if (!*(unsigned char *)(v59 + 1313)) {
                                              goto LABEL_311;
                                            }
                                            os_log_t v352 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                            os_log_t v353 = v352;
                                            if (sNRCopyLogToStdErr)
                                            {

                                              id v3 = v1558;
                                              goto LABEL_368;
                                            }
                                            BOOL v373 = os_log_type_enabled(v352, OS_LOG_TYPE_INFO);

                                            id v3 = v1558;
                                            if (v373)
                                            {
LABEL_368:
                                              os_log_t v374 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                              _NRLogWithArgs((uint64_t)v374, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v375, v376, v377, v378, v379, (uint64_t)"");

                                              id v3 = v1558;
                                            }
LABEL_311:
                                            dispatch_resume(*((dispatch_object_t *)v3 + 38));
                                            uint64_t v287 = *((void *)v3 + 17);
                                          }
                                          if ((v287 & 0x10) != 0 && *v1530)
                                          {
                                            *((void *)v3 + 17) = v287 & 0xFFFFFFFFFFFFFFEFLL;
                                            if (!gNRPacketLoggingEnabled) {
                                              goto LABEL_315;
                                            }
                                            os_log_t v354 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                            os_log_t v355 = v354;
                                            if (sNRCopyLogToStdErr)
                                            {

                                              id v3 = v1558;
                                              goto LABEL_370;
                                            }
                                            BOOL v380 = os_log_type_enabled(v354, OS_LOG_TYPE_INFO);

                                            id v3 = v1558;
                                            if (v380)
                                            {
LABEL_370:
                                              os_log_t v381 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                              _NRLogWithArgs((uint64_t)v381, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v382, v383, v384, v385, v386, (uint64_t)"");

                                              id v3 = v1558;
                                            }
LABEL_315:
                                            dispatch_resume(*((dispatch_object_t *)v3 + 40));
                                            uint64_t v287 = *((void *)v3 + 17);
                                          }
                                          if ((v287 & 0x20) != 0)
                                          {
                                            unint64_t v59 = 0x26AB22000uLL;
                                            if (*v1528) {
                                              goto LABEL_318;
                                            }
LABEL_321:
                                            if ((v287 & 0x40) != 0 && *v1531)
                                            {
                                              *((void *)v3 + 17) = v287 & 0xFFFFFFFFFFFFFFBFLL;
                                              v284 = (dispatch_object_t *)v1531;
                                              if (!*(unsigned char *)(v59 + 1313)) {
                                                goto LABEL_324;
                                              }
                                              os_log_t v350 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                              os_log_t v351 = v350;
                                              if (sNRCopyLogToStdErr)
                                              {

                                                id v3 = v1558;
                                              }
                                              else
                                              {
                                                BOOL v365 = os_log_type_enabled(v350, OS_LOG_TYPE_INFO);

                                                v284 = (dispatch_object_t *)v1531;
                                                id v3 = v1558;
                                                if (!v365) {
                                                  goto LABEL_324;
                                                }
                                              }
                                              os_log_t v366 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                              _NRLogWithArgs((uint64_t)v366, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v367, v368, v369, v370, v371, (uint64_t)"");
                                              v372 = (id *)&v1564;
                                              goto LABEL_375;
                                            }
                                            goto LABEL_325;
                                          }
LABEL_320:
                                          unint64_t v59 = 0x26AB22000uLL;
                                          goto LABEL_321;
                                        }
                                        uint64_t v288 = *((void *)v1558 + 17);
                                        if ((v288 & 8) != 0 && *v1541)
                                        {
                                          *((void *)v1558 + 17) = v288 & 0xFFFFFFFFFFFFFFF7;
                                          if (!*(unsigned char *)(v59 + 1313)) {
                                            goto LABEL_301;
                                          }
                                          os_log_t v356 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                          os_log_t v357 = v356;
                                          if (sNRCopyLogToStdErr)
                                          {

                                            id v3 = v1558;
                                            goto LABEL_377;
                                          }
                                          BOOL v399 = os_log_type_enabled(v356, OS_LOG_TYPE_INFO);

                                          id v3 = v1558;
                                          if (v399)
                                          {
LABEL_377:
                                            os_log_t v400 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                            _NRLogWithArgs((uint64_t)v400, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v401, v402, v403, v404, v405, (uint64_t)"");

                                            id v3 = v1558;
                                          }
LABEL_301:
                                          dispatch_resume(*((dispatch_object_t *)v3 + 38));
                                          uint64_t v288 = *((void *)v3 + 17);
                                          unint64_t v59 = 0x26AB22000uLL;
                                        }
                                        if ((v288 & 0x10) != 0 && *v1530)
                                        {
                                          *((void *)v3 + 17) = v288 & 0xFFFFFFFFFFFFFFEFLL;
                                          v284 = (dispatch_object_t *)v1530;
                                          if (!*(unsigned char *)(v59 + 1313)) {
                                            goto LABEL_324;
                                          }
                                          os_log_t v289 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                          os_log_t v290 = v289;
                                          if (sNRCopyLogToStdErr)
                                          {

                                            id v3 = v1558;
                                          }
                                          else
                                          {
                                            BOOL v393 = os_log_type_enabled(v289, OS_LOG_TYPE_INFO);

                                            v284 = (dispatch_object_t *)v1530;
                                            id v3 = v1558;
                                            if (!v393) {
                                              goto LABEL_324;
                                            }
                                          }
                                          os_log_t v366 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                          _NRLogWithArgs((uint64_t)v366, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v394, v395, v396, v397, v398, (uint64_t)"");
                                          v372 = &v1563;
LABEL_375:
                                          v284 = (dispatch_object_t *)*(v372 - 32);

                                          id v3 = v1558;
LABEL_324:
                                          dispatch_resume(*v284);
                                          unint64_t v59 = 0x26AB22000uLL;
                                        }
LABEL_325:
                                        if (*(unsigned char *)(v59 + 1313))
                                        {
                                          os_log_t v322 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                          os_log_t v323 = v322;
                                          if (sNRCopyLogToStdErr)
                                          {

                                            id v3 = v1558;
                                          }
                                          else
                                          {
                                            BOOL v334 = os_log_type_enabled(v322, OS_LOG_TYPE_INFO);

                                            id v3 = v1558;
                                            if (!v334) {
                                              goto LABEL_326;
                                            }
                                          }
                                          os_log_t v335 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                          _NRLogWithArgs((uint64_t)v335, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v336, v337, v338, v339, v340, (uint64_t)"");

                                          id v3 = v1558;
                                        }
LABEL_326:
                                        unsigned int v291 = *(unsigned __int8 *)(v68 + 82);
                                        if (v291 >= 0xB)
                                        {
                                          unsigned int v291 = *(unsigned __int8 *)(v68 + 82)
                                               - 11
                                               * ((390451573 * (unint64_t)*(unsigned __int8 *)(v68 + 82)) >> 32);
                                          *(unsigned char *)(v68 + 82) = v291;
                                        }
                                        *(_DWORD *)(v68 + 4 * v291 + 36) = v249 | 0x60000;
                                        unsigned int v292 = (117 * (*(unsigned char *)(v68 + 82) + 1)) >> 8;
                                        *(unsigned char *)(v68 + 82) = *(unsigned char *)(v68 + 82)
                                                             + 1
                                                             - 11
                                                             * ((v292
                                                               + (((*(unsigned char *)(v68 + 82) + 1 - v292) & 0xFE) >> 1)) >> 3);
                                        id v12 = v1533;
LABEL_62:
                                        v49 = v1545;
                                        goto LABEL_63;
                                      }
                                      uint64_t v287 = *((void *)v1558 + 17);
                                      if ((v1558[10] & 4) == 0) {
                                        goto LABEL_308;
                                      }
                                      if ((v287 & 0x20) == 0 || !*v1528) {
                                        goto LABEL_321;
                                      }
LABEL_318:
                                      *((void *)v3 + 17) = v287 & 0xFFFFFFFFFFFFFFDFLL;
                                      if (!*(unsigned char *)(v59 + 1313))
                                      {
LABEL_319:
                                        dispatch_resume(*((dispatch_object_t *)v3 + 42));
                                        uint64_t v287 = *((void *)v3 + 17);
                                        goto LABEL_320;
                                      }
                                      os_log_t v348 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                      os_log_t v349 = v348;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        id v3 = v1558;
                                      }
                                      else
                                      {
                                        BOOL v358 = os_log_type_enabled(v348, OS_LOG_TYPE_INFO);

                                        id v3 = v1558;
                                        if (!v358) {
                                          goto LABEL_319;
                                        }
                                      }
                                      os_log_t v359 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                                      _NRLogWithArgs((uint64_t)v359, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v360, v361, v362, v363, v364, (uint64_t)"");

                                      id v3 = v1558;
                                      goto LABEL_319;
                                    }
LABEL_257:
                                    if (v1556 <= 8u)
                                    {
                                      if (!v1563) {
                                        goto LABEL_262;
                                      }
                                      unsigned int v259 = os_channel_available_slot_count();
                                      unint64_t v59 = 0x26AB22000uLL;
                                      if (v259 > 1) {
                                        goto LABEL_262;
                                      }
                                    }
                                    if (!*(unsigned char *)(v59 + 1313))
                                    {
LABEL_261:
                                      int v249 = v154 | 0x18000;
                                      os_channel_sync();
                                      v1558[13] = 0;
                                      unint64_t v59 = 0x26AB22000uLL;
                                      goto LABEL_262;
                                    }
                                    os_log_t v264 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    os_log_t v265 = v264;
                                    if (sNRCopyLogToStdErr)
                                    {
                                    }
                                    else
                                    {
                                      BOOL v273 = os_log_type_enabled(v264, OS_LOG_TYPE_INFO);

                                      if (!v273) {
                                        goto LABEL_261;
                                      }
                                    }
                                    os_log_t v274 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs((uint64_t)v274, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v275, v276, v277, v278, v279, (uint64_t)"");

                                    goto LABEL_261;
                                  }
                                  os_log_t v262 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  os_log_t v263 = v262;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    goto LABEL_272;
                                  }
                                  BOOL v266 = os_log_type_enabled(v262, OS_LOG_TYPE_INFO);

                                  if (v266)
                                  {
LABEL_272:
                                    os_log_t v267 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs((uint64_t)v267, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v268, v269, v270, v271, v272, (uint64_t)"");
                                  }
                                  unint64_t v59 = 0x26AB22000;
                                  int v249 = v154 | 0x8000;
                                  if (!v84) {
                                    goto LABEL_247;
                                  }
LABEL_256:
                                  os_channel_advance_slot();
                                  unint64_t v59 = 0x26AB22000;
                                  v1558[13] = 1;
                                  goto LABEL_257;
                                }
LABEL_195:
                                if (v155 < *(unsigned __int16 *)(v68 + 80))
                                {
                                  if (!*(unsigned char *)(v59 + 1313)) {
                                    goto LABEL_197;
                                  }
                                  os_log_t v195 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                  os_log_t v196 = v195;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    goto LABEL_232;
                                  }
                                  LODWORD(v1550) = os_log_type_enabled(v195, OS_LOG_TYPE_INFO);

                                  if (v1550)
                                  {
LABEL_232:
                                    os_log_t v213 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs((uint64_t)v213, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v214, v215, v216, v217, v218, (uint64_t)"");
                                  }
LABEL_197:
                                  v154 |= 0x2000u;
                                  memmove(*(void **)v68, (const void *)(*(void *)v68 + v1564), *(unsigned __int16 *)(v68 + 80) - v1564);
                                  unint64_t v172 = v1564;
                                  *(_WORD *)(v68 + 80) -= v1564;
                                  uint64_t v1554 = (v1554 + 1);
                                  unint64_t v59 = 0x26AB22000;
LABEL_200:
                                  *(void *)((char *)v1553 + (void)v1558) += v172;
                                  goto LABEL_201;
                                }
                                if (!*(unsigned char *)(v59 + 1313))
                                {
LABEL_199:
                                  v154 |= 0x4000u;
                                  *(_WORD *)(v68 + 80) = 0;
                                  unint64_t v172 = v1564;
                                  goto LABEL_200;
                                }
                                os_log_t v197 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                os_log_t v198 = v197;
                                if (sNRCopyLogToStdErr)
                                {
                                }
                                else
                                {
                                  LODWORD(v1550) = os_log_type_enabled(v197, OS_LOG_TYPE_INFO);

                                  unint64_t v59 = 0x26AB22000;
                                  if (!v1550) {
                                    goto LABEL_199;
                                  }
                                }
                                os_log_t v219 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                _NRLogWithArgs((uint64_t)v219, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v220, v221, v222, v223, v224, (uint64_t)"");

                                unint64_t v59 = 0x26AB22000;
                                goto LABEL_199;
                              }
                              int v154 = v94 | 0x400;
                              if (!*(unsigned char *)(v59 + 1313))
                              {
                                BOOL v151 = 0;
                                BOOL v248 = 1;
                                int v249 = v154 | 0x8000;
                                if (v84) {
                                  goto LABEL_256;
                                }
                                goto LABEL_247;
                              }
                              os_log_t v250 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                              os_log_t v251 = v250;
                              if (sNRCopyLogToStdErr)
                              {

                                goto LABEL_252;
                              }
                              BOOL v252 = os_log_type_enabled(v250, OS_LOG_TYPE_INFO);

                              if (v252)
                              {
LABEL_252:
                                os_log_t v253 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                _NRLogWithArgs((uint64_t)v253, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v254, v255, v256, v257, v258, (uint64_t)"");
                              }
                              unint64_t v59 = 0x26AB22000uLL;
                              goto LABEL_254;
                            }
                            break;
                          }
                          os_channel_slot_get_packet();
                          os_packet_get_next_buflet();
                          unsigned int v105 = os_buflet_get_data_offset();
                          uint64_t v106 = os_buflet_get_object_address();
                          unsigned int v107 = os_buflet_get_data_length();
                          if (v107 >= 0x10000)
                          {
                            if (nrCopyLogObj_onceToken_521 != -1) {
                              dispatch_once(&nrCopyLogObj_onceToken_521, &__block_literal_global_400);
                            }
                            if (!sNRCopyLogToStdErr
                              && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_522, OS_LOG_TYPE_ERROR))
                            {
                              goto LABEL_388;
                            }
                            uint64_t v415 = nrCopyLogObj_sNRLogObj_522;
                            goto LABEL_387;
                          }
                          unsigned __int16 v113 = v107;
                          if (!(_WORD)v107 && WORD1(v1566))
                          {
                            unint64_t v1564 = 0;
                            uint64_t v1565 = 0;
                            unint64_t v1564 = *(void *)v68 + *(unsigned __int16 *)(v68 + 80);
                            LODWORD(v1565) = v104;
                            int v114 = nrPacketToTLV((unsigned __int8 *)v1567, WORD1(v1566), (uint64_t)&v1564, 1u, (uint64_t)v1560, (uint64_t)v1559);
                            if (!gNRPacketLoggingEnabled) {
                              goto LABEL_130;
                            }
                            os_log_t v119 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            os_log_t v120 = v119;
                            if (sNRCopyLogToStdErr)
                            {

                              goto LABEL_150;
                            }
                            BOOL v125 = os_log_type_enabled(v119, OS_LOG_TYPE_INFO);

                            if (v125)
                            {
LABEL_150:
                              os_log_t v1557 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                              uint64_t v126 = v1567;
                              unsigned int v127 = WORD1(v1566);
                              if (isPacketValidIPv6((unsigned char *)v1567, WORD1(v1566))) {
                                isNextHeaderValidESP(v126, v127);
                              }
                              uint64_t v128 = v1567;
                              unsigned int v129 = WORD1(v1566);
                              if (isPacketValidIPv6((unsigned char *)v1567, WORD1(v1566))) {
                                isNextHeaderValidESP(v128, v129);
                              }
                              os_log_t v135 = v1557;
                              _NRLogWithArgs((uint64_t)v1557, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v130, v131, v132, v133, v134, (uint64_t)"");
                            }
LABEL_130:
                            v94 |= 0x80u;
LABEL_136:
                            *(_WORD *)(v68 + 80) += v114;
                            if (v1562) {
                              uint64_t v116 = 0;
                            }
                            else {
                              uint64_t v116 = os_channel_get_next_slot();
                            }
                            ++v70;
                            ++*v58;
                            unsigned char *ESPSequenceNumberFromPacket = 1;
                            v69 += v114;
                            if (!v116)
                            {
                              os_log_t v149 = 0;
                              os_log_t v84 = v103;
                              goto LABEL_169;
                            }
                            unsigned int v117 = *(unsigned __int8 *)(v68 + 82);
                            if (v117 >= 0xB)
                            {
                              unsigned int v117 = *(unsigned __int8 *)(v68 + 82)
                                   - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v68 + 82)) >> 32);
                              *(unsigned char *)(v68 + 82) = v117;
                            }
                            *(_DWORD *)(v68 + 4 * v117 + 36) = v94;
                            unsigned int v118 = (117 * (*(unsigned char *)(v68 + 82) + 1)) >> 8;
                            *(unsigned char *)(v68 + 82) = *(unsigned char *)(v68 + 82)
                                                 + 1
                                                 - 11
                                                 * ((v118
                                                   + (((*(unsigned char *)(v68 + 82) + 1 - v118) & 0xFE) >> 1)) >> 3);
                            os_log_t v84 = v103;
                            os_log_t v103 = (os_log_t)v116;
                            int v94 = 0;
                            goto LABEL_125;
                          }
                          if ((_WORD)v107)
                          {
                            uint64_t v115 = v106 + v105;
                            unint64_t v1564 = 0;
                            uint64_t v1565 = 0;
                            unint64_t v1564 = *(void *)v68 + *(unsigned __int16 *)(v68 + 80);
                            LODWORD(v1565) = v104;
                            int v114 = nrPacketToTLV((unsigned __int8 *)v115, (unsigned __int16)v107, (uint64_t)&v1564, 1u, (uint64_t)v1560, (uint64_t)v1559);
                            if (!gNRPacketLoggingEnabled)
                            {
LABEL_133:
                              v94 |= 0x100u;
                              goto LABEL_136;
                            }
                            os_log_t v121 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            os_log_t v122 = v121;
                            if (sNRCopyLogToStdErr)
                            {
                            }
                            else
                            {
                              LODWORD(v1557) = os_log_type_enabled(v121, OS_LOG_TYPE_INFO);

                              if (!v1557) {
                                goto LABEL_133;
                              }
                            }
                            os_log_t v1557 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            if (isPacketValidIPv6((unsigned char *)v115, v113) && isNextHeaderValidESP(v115, v113)) {
                              v1550 = (uint64_t *)bswap32(*(_DWORD *)(v115 + 44));
                            }
                            else {
                              v1550 = 0;
                            }
                            if (isPacketValidIPv6((unsigned char *)v115, v113)) {
                              isNextHeaderValidESP(v115, v113);
                            }
                            os_log_t v141 = v1557;
                            _NRLogWithArgs((uint64_t)v1557, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v136, v137, v138, v139, v140, (uint64_t)"");

                            goto LABEL_133;
                          }
                          v94 |= 0x200u;
                          if (!gNRPacketLoggingEnabled)
                          {
LABEL_135:
                            int v114 = 0;
                            goto LABEL_136;
                          }
                          os_log_t v123 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          os_log_t v124 = v123;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            BOOL v142 = os_log_type_enabled(v123, OS_LOG_TYPE_INFO);

                            if (!v142) {
                              goto LABEL_135;
                            }
                          }
                          os_log_t v143 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                          _NRLogWithArgs((uint64_t)v143, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v144, v145, v146, v147, v148, (uint64_t)"");

                          goto LABEL_135;
                        }
                        if (!*(unsigned char *)(v59 + 1313))
                        {
LABEL_278:
                          if (v52) {
                            v52((uint64_t)v3);
                          }
                          unsigned int v47 = *(unsigned __int8 *)(v68 + 82);
                          if (v47 >= 0xB)
                          {
                            unsigned int v47 = *(unsigned __int8 *)(v68 + 82)
                                - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v68 + 82)) >> 32);
                            *(unsigned char *)(v68 + 82) = v47;
                          }
                          *(_DWORD *)(v68 + 4 * v47 + 36) = 3;
                          unsigned int v48 = (117 * (*(unsigned char *)(v68 + 82) + 1)) >> 8;
                          *(unsigned char *)(v68 + 82) = *(unsigned char *)(v68 + 82)
                                               + 1
                                               - 11
                                               * ((v48
                                                 + (((*(unsigned char *)(v68 + 82) + 1 - v48) & 0xFE) >> 1)) >> 3);
                          goto LABEL_62;
                        }
                        v296 = v12;
                        os_log_t v297 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                        os_log_t v298 = v297;
                        if (sNRCopyLogToStdErr)
                        {

                          id v12 = v296;
                        }
                        else
                        {
                          BOOL v313 = os_log_type_enabled(v297, OS_LOG_TYPE_INFO);

                          id v12 = v296;
                          if (!v313) {
                            goto LABEL_278;
                          }
                        }
                        os_log_t v314 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                        _NRLogWithArgs((uint64_t)v314, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v315, v316, v317, v318, v319, (uint64_t)"");

                        goto LABEL_278;
                      }
LABEL_281:
                      uint64_t v280 = (uint64_t)v64;
                      if (!*(unsigned char *)(v59 + 1313)) {
                        goto LABEL_282;
                      }
                      os_log_t v406 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      os_log_t v407 = v406;
                      if (sNRCopyLogToStdErr)
                      {

                        id v3 = v1558;
                      }
                      else
                      {
                        BOOL v408 = os_log_type_enabled(v406, OS_LOG_TYPE_INFO);

                        id v3 = v1558;
                        if (!v408) {
                          goto LABEL_282;
                        }
                      }
                      os_log_t v409 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      _NRLogWithArgs((uint64_t)v409, 1, (uint64_t)"%s%.30s:%-4d ", v410, v411, v412, v413, v414, (uint64_t)"");

                      id v3 = v1558;
LABEL_282:
                      os_log_t v281 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      os_log_t v282 = v281;
                      if (sNRCopyLogToStdErr)
                      {

                        id v3 = v1558;
                      }
                      else
                      {
                        BOOL v299 = os_log_type_enabled(v281, OS_LOG_TYPE_FAULT);

                        id v3 = v1558;
                        if (!v299) {
                          goto LABEL_63;
                        }
                      }
                      os_log_t v300 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      _NRLogWithArgs((uint64_t)v300, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v301, v302, v303, v304, v305, v280);

                      id v3 = v1558;
LABEL_63:

                      int v37 = (int)v1548;
                      int v43 = v1543;
                      int v44 = v1542;
                      int v50 = (int)v1547;
                      goto LABEL_64;
                    }
                    if ((*(unsigned char *)(*(void *)v65 + 27) & 3) == 1)
                    {
                      if (v1558[12])
                      {
                        v63 = 0;
                        char v66 = 1;
                      }
                      else
                      {

                        unint64_t v59 = 0x26AB22000uLL;
                        char v66 = 0;
                        v52 = 0;
                        v49 = 0;
                        id v1563 = 0;
                        v1549 = 0;
                        v63 = v1529;
                        if (!v1558[12]) {
                          goto LABEL_92;
                        }
                      }
                    }
                    else
                    {
                      v63 = 0;
                      char v66 = 1;
                      if (!v1558[12]) {
                        goto LABEL_92;
                      }
                    }
                    if (!*(unsigned char *)(v59 + 1313)) {
                      goto LABEL_92;
                    }
                    v324 = v49;
                    os_log_t v325 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v326 = v325;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      BOOL v341 = os_log_type_enabled(v325, OS_LOG_TYPE_INFO);

                      unint64_t v59 = 0x26AB22000;
                      v49 = v324;
                      if (!v341) {
                        goto LABEL_92;
                      }
                    }
                    os_log_t v342 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    _NRLogWithArgs((uint64_t)v342, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v343, v344, v345, v346, v347, (uint64_t)"");

                    v49 = v324;
                    unint64_t v59 = 0x26AB22000;
LABEL_92:
                    if (v63)
                    {
                      if (v66)
                      {
                        int v62 = 0;
                        v64 = "Invalid";
                        goto LABEL_96;
                      }
                      goto LABEL_280;
                    }
LABEL_95:
                    int v62 = 1;
                    v63 = v1534;
                    v64 = "Medium";
LABEL_96:
                    id v3 = v1558;
                    v67 = (void *)*v63;
                    if (*v63) {
                      goto LABEL_97;
                    }
                    goto LABEL_281;
                }
                v58 = *(v57 - 32);
                v1549 = *v54;
                id v1563 = *v55;
                v49 = (dispatch_object_t *)*v56;
                goto LABEL_75;
              default:
                int v14 = 0;
                break;
            }
            id v12 = v1558 + 10;
            int v11 = v1558[10];
            char v15 = v11 & v14;
            BOOL v13 = (v11 & v14) == 0;
            if (v7 != 3 || !v15) {
              goto LABEL_32;
            }
            if (v1558[8] == 4) {
              goto LABEL_1165;
            }
            dispatch_assert_queue_V2(*((dispatch_queue_t *)v1558 + 7));
            v1550 = (uint64_t *)*((void *)v1558 + 26);
            uint64_t v16 = (void *)*((void *)v1558 + 30);
            id v17 = *((id *)v1558 + 38);
            unint64_t v18 = 0x26AB22000uLL;
            if (gNRPacketLoggingEnabled)
            {
              os_log_t v688 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
              os_log_t v689 = v688;
              if (sNRCopyLogToStdErr)
              {

                id v3 = v1558;
              }
              else
              {
                BOOL v950 = os_log_type_enabled(v688, OS_LOG_TYPE_INFO);

                id v3 = v1558;
                unint64_t v18 = 0x26AB22000;
                if (!v950) {
                  goto LABEL_22;
                }
              }
              os_log_t v951 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
              _NRLogWithArgs((uint64_t)v951, 1, (uint64_t)"%s%.30s:%-4d starting NtL fast-path for %u", v952, v953, v954, v955, v956, (uint64_t)"");

              unint64_t v18 = 0x26AB22000;
            }
LABEL_22:
            int v19 = *v12;
            if ((v19 & 8) != 0)
            {
              uint64_t v22 = v3 + 128;
              id v25 = "Isochronous";
              uint64_t v21 = NRBluetoothPacketParserSuspendNexusVOInputSource;
              int v24 = 3;
              goto LABEL_933;
            }
            if ((v19 & 4) != 0)
            {
              uint64_t v22 = v3 + 112;
              uint64_t v21 = NRBluetoothPacketParserSuspendNexusVOInputSource;
LABEL_592:
              id v25 = "High";
              int v24 = 2;
              goto LABEL_933;
            }
            uint64_t v20 = *((void *)v3 + 13);
            if (!v20)
            {
              uint64_t v21 = NRBluetoothPacketParserSuspendNexusVOInputSource;
              goto LABEL_932;
            }
            if ((*(unsigned char *)(*(void *)v20 + 27) & 3) == 1 && !v3[12])
            {

              unint64_t v18 = 0x26AB22000;
              char v23 = 0;
              uint64_t v21 = 0;
              id v17 = 0;
              uint64_t v16 = 0;
              v1550 = 0;
              uint64_t v22 = v3 + 112;
              if (!v3[12]) {
                goto LABEL_29;
              }
            }
            else
            {
              uint64_t v21 = NRBluetoothPacketParserSuspendNexusVOInputSource;
              uint64_t v22 = 0;
              char v23 = 1;
              if (!v3[12]) {
                goto LABEL_29;
              }
            }
            if (!*(unsigned char *)(v18 + 1313)) {
              goto LABEL_29;
            }
            os_log_t v1238 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
            os_log_t v1239 = v1238;
            if (sNRCopyLogToStdErr)
            {

              id v3 = v1558;
            }
            else
            {
              BOOL v1293 = os_log_type_enabled(v1238, OS_LOG_TYPE_INFO);

              id v3 = v1558;
              unint64_t v18 = 0x26AB22000;
              if (!v1293) {
                goto LABEL_29;
              }
            }
            os_log_t v1294 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
            _NRLogWithArgs((uint64_t)v1294, 1, (uint64_t)"%s%.30s:%-4d sending packets over medium pipe", v1295, v1296, v1297, v1298, v1299, (uint64_t)"");

            unint64_t v18 = 0x26AB22000;
LABEL_29:
            if (v22)
            {
              if (v23)
              {
                int v24 = 0;
                id v25 = "Invalid";
                goto LABEL_933;
              }
              goto LABEL_592;
            }
LABEL_932:
            uint64_t v22 = v3 + 96;
            id v25 = "Medium";
            int v24 = 1;
LABEL_933:
            v984 = (void *)*v22;
            if (*v22)
            {
              v1553 = v21;
              uint64_t v985 = v984[3];
              if ((*(unsigned char *)(v985 + 84) & 1) == 0)
              {
                LODWORD(v1546) = v24;
                unint64_t v1556 = (unint64_t)v22;
                LODWORD(v1562) = v19;
                id v1563 = v16;
                v1549 = v25;
                id v1548 = v17;
                v1547 = (dispatch_object_t *)&v1515;
                int v986 = 0;
                __int16 v987 = 0;
                LODWORD(v1559) = 0;
                v1545 = (dispatch_object_t *)(v3 + 304);
                v988 = *(void (**)(uint64_t))(v985 + 8);
                int v989 = *(unsigned __int8 *)(v985 + 83);
                uint64_t v990 = 568;
                if (v989 == 3) {
                  uint64_t v990 = 584;
                }
                BOOL v38 = v989 == 2;
                uint64_t v991 = 600;
                if (!v38) {
                  uint64_t v991 = v990;
                }
                uint64_t v1554 = v991;
                v1560 = v3 + 688;
                ESPSequenceNumberFromPacket = v3 + 672;
                int v992 = 9;
                v1552 = v988;
                if (*(unsigned char *)(v18 + 1313))
                {
LABEL_940:
                  os_log_t v993 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                  os_log_t v994 = v993;
                  if (sNRCopyLogToStdErr)
                  {
                  }
                  else
                  {
                    BOOL v995 = os_log_type_enabled(v993, OS_LOG_TYPE_INFO);

                    unint64_t v18 = 0x26AB22000;
                    if (!v995) {
                      goto LABEL_944;
                    }
                  }
                  os_log_t v996 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                  _NRLogWithArgs((uint64_t)v996, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL outer loop", v997, v998, v999, v1000, v1001, (uint64_t)"");

                  unint64_t v18 = 0x26AB22000uLL;
                }
LABEL_944:
                uint64_t v1002 = 0;
                uint64_t v1003 = 0;
                uint64_t v1555 = 0;
                long long v1568 = 0u;
                long long v1569 = 0u;
                long long v1566 = 0u;
                long long v1567 = 0u;
                if (*(unsigned char *)(v18 + 1313))
                {
LABEL_945:
                  os_log_t v1004 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                  os_log_t v1005 = v1004;
                  if (sNRCopyLogToStdErr)
                  {

LABEL_948:
                    os_log_t v1007 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                    _NRLogWithArgs((uint64_t)v1007, 1, (uint64_t)"%s%.30s:%-4d %s: starting NtL inner loop", v1008, v1009, v1010, v1011, v1012, (uint64_t)"");

                    unint64_t v18 = 0x26AB22000;
                    goto LABEL_949;
                  }
                  BOOL v1006 = os_log_type_enabled(v1004, OS_LOG_TYPE_INFO);

                  unint64_t v18 = 0x26AB22000;
                  if (v1006) {
                    goto LABEL_948;
                  }
                }
LABEL_949:
                int v1013 = v992 | 0x10;
                if ((v1562 & 8) != 0) {
                  goto LABEL_959;
                }
                unsigned int v1015 = *(_DWORD *)(v985 + 28);
                uint64_t v1014 = *(unsigned int *)(v985 + 32);
                if (v1015 <= v1014) {
                  goto LABEL_959;
                }
                uint64_t v1016 = *(unsigned __int16 *)(v985 + 80);
                if ((unsigned __int16)(v1015 - v1014) >= (unsigned __int16)(0x4000 - v1016)) {
                  size_t v1017 = (unsigned __int16)(0x4000 - v1016);
                }
                else {
                  size_t v1017 = (unsigned __int16)(v1015 - v1014);
                }
                v1018 = v1552;
                memcpy((void *)(*(void *)v985 + v1016), (char *)v1552 + v1014, v1017);
                unsigned int v1019 = *(_DWORD *)(v985 + 28);
                unsigned int v1020 = *(_DWORD *)(v985 + 32) + v1017;
                *(_DWORD *)(v985 + 32) = v1020;
                if (v1019 <= v1020)
                {
                  int v1021 = 0;
                }
                else
                {
                  memmove(v1018, (char *)v1018 + v1020, v1019 - v1020);
                  int v1021 = *(_DWORD *)(v985 + 28) - *(_DWORD *)(v985 + 32);
                }
                unint64_t v18 = 0x26AB22000uLL;
                *(_DWORD *)(v985 + 28) = v1021;
                *(_DWORD *)(v985 + 32) = 0;
                *(_WORD *)(v985 + 80) += v1017;
                if (!gNRPacketLoggingEnabled)
                {
LABEL_958:
                  int v1013 = v992 | 0x30;
                  v986 += v1017;
                  id v3 = v1558;
LABEL_959:
                  if (v1563)
                  {
                    uint64_t v1002 = os_channel_get_next_slot();
                    unint64_t v18 = 0x26AB22000;
                  }
                  if (!v1002) {
                    goto LABEL_997;
                  }
                  uint64_t v1022 = v1002;
                  while (1)
                  {
                    unsigned int v1023 = 0x4000 - *(unsigned __int16 *)(v985 + 80);
                    if (v1023 < nrMaxTLVLengthForPacket(v1567, WORD1(v1566)))
                    {
                      v1013 |= 0x40u;
                      unint64_t v18 = 0x26AB22000uLL;
                      if (!gNRPacketLoggingEnabled)
                      {
                        uint64_t v1002 = v1022;
                        id v3 = v1558;
                        goto LABEL_997;
                      }
                      os_log_t v1097 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      os_log_t v1098 = v1097;
                      if (sNRCopyLogToStdErr)
                      {

                        goto LABEL_1056;
                      }
                      BOOL v1111 = os_log_type_enabled(v1097, OS_LOG_TYPE_INFO);

                      if (v1111)
                      {
LABEL_1056:
                        v1112 = v1558;
                        os_log_t v1113 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                        id v3 = v1112;
                        _NRLogWithArgs((uint64_t)v1113, 1, (uint64_t)"%s%.30s:%-4d %s: not enough room %u to fit maxTLVLen %u", v1114, v1115, v1116, v1117, v1118, (uint64_t)"");

                        uint64_t v1002 = v1022;
                      }
                      else
                      {
                        uint64_t v1002 = v1022;
                        id v3 = v1558;
                      }
LABEL_996:
                      unint64_t v18 = 0x26AB22000uLL;
LABEL_997:
                      int v1058 = *(unsigned __int16 *)(v985 + 80);
                      LODWORD(v1557) = *(_WORD *)(v985 + 80) != 0;
                      if (v1058)
                      {
                        unint64_t v1564 = 0;
                        uint64_t v1059 = v18;
                        if (!*(unsigned char *)(v18 + 1313)) {
                          goto LABEL_999;
                        }
                        os_log_t v1079 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                        os_log_t v1080 = v1079;
                        if (sNRCopyLogToStdErr)
                        {

                          uint64_t v1059 = 0x26AB22000;
                          goto LABEL_1040;
                        }
                        LODWORD(v1551) = os_log_type_enabled(v1079, OS_LOG_TYPE_INFO);

                        uint64_t v1059 = 0x26AB22000;
                        if (v1551)
                        {
LABEL_1040:
                          os_log_t v1085 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                          _NRLogWithArgs((uint64_t)v1085, 1, (uint64_t)"%s%.30s:%-4d %s: invoking send callback w/ written %u", v1086, v1087, v1088, v1089, v1090, (uint64_t)"");
                        }
LABEL_999:
                        char v1060 = (*(uint64_t (**)(void, void, void, unint64_t *, void, void))(*(void *)v1556 + 8))(**(void **)v1556, *(void *)v985, *(unsigned __int16 *)(v985 + 80), &v1564, 0, 0);
                        unint64_t v18 = v1059;
                        if (*(unsigned char *)(v1059 + 1313))
                        {
                          os_log_t v1081 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                          os_log_t v1082 = v1081;
                          if (sNRCopyLogToStdErr)
                          {
                          }
                          else
                          {
                            LODWORD(v1551) = os_log_type_enabled(v1081, OS_LOG_TYPE_INFO);

                            unint64_t v18 = 0x26AB22000;
                            if (!v1551) {
                              goto LABEL_1000;
                            }
                          }
                          os_log_t v1091 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                          _NRLogWithArgs((uint64_t)v1091, 1, (uint64_t)"%s%.30s:%-4d %s: canWriteMore: %d bufferHandled=%zu/%u", v1092, v1093, v1094, v1095, v1096, (uint64_t)"");

                          unint64_t v18 = 0x26AB22000;
                        }
LABEL_1000:
                        if ((v1060 & 1) == 0)
                        {
                          if (v1553)
                          {
                            v1553((uint64_t)v3);
                            unint64_t v18 = 0x26AB22000uLL;
                          }
                          *(unsigned char *)(v985 + 84) |= 1u;
                          switch(*(unsigned char *)(v985 + 83))
                          {
                            case 0:
                              os_log_t v1063 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              os_log_t v1064 = v1063;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                LODWORD(v1551) = os_log_type_enabled(v1063, OS_LOG_TYPE_ERROR);

                                unint64_t v18 = 0x26AB22000;
                                if (!v1551) {
                                  goto LABEL_1020;
                                }
                              }
                              os_log_t v1070 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              _NRLogWithArgs((uint64_t)v1070, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v1071, v1072, v1073, v1074, v1075, (uint64_t)"");
                              goto LABEL_1019;
                            case 1:
                              uint64_t v1065 = *((void *)v3 + 17);
                              ++*((void *)v3 + 18);
                              *((void *)v3 + 17) = v1065 & 0xFFFFFFFFFFFFFFFELL | *(unsigned char *)(v985 + 84) & 1;
                              if (!*(unsigned char *)(v18 + 1313)) {
                                goto LABEL_1015;
                              }
                              os_log_t v1066 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              os_log_t v1067 = v1066;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                LODWORD(v1551) = os_log_type_enabled(v1066, OS_LOG_TYPE_INFO);

                                unint64_t v18 = 0x26AB22000;
                                if (!v1551) {
                                  goto LABEL_1020;
                                }
                              }
                              os_log_t v1070 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              _NRLogWithArgs((uint64_t)v1070, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v1139, v1140, v1141, v1142, v1143, (uint64_t)"");
                              goto LABEL_1019;
                            case 2:
                              ++*((void *)v3 + 20);
                              *((void *)v3 + 17) = *((void *)v3 + 17) & 0xFFFFFFFFFFFFFFFDLL | (2
                                                                                                  * (*(unsigned char *)(v985 + 84) & 1));
                              if (!*(unsigned char *)(v18 + 1313)) {
                                goto LABEL_1015;
                              }
                              os_log_t v1068 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              os_log_t v1069 = v1068;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                LODWORD(v1551) = os_log_type_enabled(v1068, OS_LOG_TYPE_INFO);

                                unint64_t v18 = 0x26AB22000;
                                if (!v1551) {
                                  goto LABEL_1020;
                                }
                              }
                              os_log_t v1070 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              _NRLogWithArgs((uint64_t)v1070, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v1144, v1145, v1146, v1147, v1148, (uint64_t)"");
                              goto LABEL_1019;
                            case 3:
                              ++*((void *)v3 + 22);
                              *((void *)v3 + 17) = *((void *)v3 + 17) & 0xFFFFFFFFFFFFFFFBLL | (4
                                                                                                  * (*(unsigned char *)(v985 + 84) & 1));
                              if (!*(unsigned char *)(v18 + 1313))
                              {
LABEL_1015:
                                int v1061 = v1013 | 0x1800;
                                unint64_t v1062 = v1564;
                                if (v1564) {
                                  goto LABEL_1022;
                                }
                                goto LABEL_1028;
                              }
                              os_log_t v1131 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              os_log_t v1132 = v1131;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                LODWORD(v1551) = os_log_type_enabled(v1131, OS_LOG_TYPE_INFO);

                                unint64_t v18 = 0x26AB22000;
                                if (!v1551) {
                                  goto LABEL_1020;
                                }
                              }
                              os_log_t v1070 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              _NRLogWithArgs((uint64_t)v1070, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v1149, v1150, v1151, v1152, v1153, (uint64_t)"");
LABEL_1019:

                              unint64_t v18 = 0x26AB22000uLL;
LABEL_1020:
                              int v1061 = v1013 | 0x1800;
                              if (!*(unsigned char *)(v18 + 1313))
                              {
                                unint64_t v1062 = v1564;
                                if (!v1564) {
                                  goto LABEL_1028;
                                }
                                goto LABEL_1022;
                              }
                              os_log_t v1083 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              os_log_t v1084 = v1083;
                              if (sNRCopyLogToStdErr)
                              {
                              }
                              else
                              {
                                LODWORD(v1551) = os_log_type_enabled(v1083, OS_LOG_TYPE_INFO);

                                if (!v1551) {
                                  goto LABEL_1053;
                                }
                              }
                              os_log_t v1105 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                              _NRLogWithArgs((uint64_t)v1105, 1, (uint64_t)"%s%.30s:%-4d ", v1106, v1107, v1108, v1109, v1110, (uint64_t)"");

LABEL_1053:
                              unint64_t v18 = 0x26AB22000;
                              unint64_t v1062 = v1564;
                              if (v1564) {
                                goto LABEL_1022;
                              }
                              break;
                            default:
                              goto LABEL_1020;
                          }
                          goto LABEL_1028;
                        }
                        int v1061 = v1013 | 0x800;
                        unint64_t v1062 = v1564;
                        if (!v1564)
                        {
LABEL_1028:
                          LODWORD(v1559) = v1559 + 1;
                          if (v1060)
                          {
                            unsigned int v1077 = *(unsigned __int8 *)(v985 + 82);
                            if (v1077 >= 0xB)
                            {
                              unsigned int v1077 = *(unsigned __int8 *)(v985 + 82)
                                    - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v985 + 82)) >> 32);
                              *(unsigned char *)(v985 + 82) = v1077;
                            }
                            int v992 = 0;
                            *(_DWORD *)(v985 + 4 * v1077 + 36) = v1061;
                            unsigned int v1078 = (117 * (*(unsigned char *)(v985 + 82) + 1)) >> 8;
                            *(unsigned char *)(v985 + 82) = *(unsigned char *)(v985 + 82)
                                                  + 1
                                                  - 11
                                                  * ((v1078
                                                    + (((*(unsigned char *)(v985 + 82) + 1 - v1078) & 0xFE) >> 1)) >> 3);
                            if (!*(unsigned char *)(v18 + 1313)) {
                              goto LABEL_949;
                            }
                            goto LABEL_945;
                          }
LABEL_1081:
                          BOOL v1155 = v1058 == 0;
                          LODWORD(v1154) = v1557;
                          if (!*(unsigned char *)(v18 + 1313))
                          {
                            int v1156 = v1061 | 0x8000;
                            if (v1003) {
                              goto LABEL_1083;
                            }
LABEL_1074:
                            if (!v3[13])
                            {
LABEL_1089:
                              if ((v1154 & v1155) == 1)
                              {
                                unsigned int v1167 = *(unsigned __int8 *)(v985 + 82);
                                if (v1167 >= 0xB)
                                {
                                  unsigned int v1167 = *(unsigned __int8 *)(v985 + 82)
                                        - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v985 + 82)) >> 32);
                                  *(unsigned char *)(v985 + 82) = v1167;
                                }
                                *(_DWORD *)(v985 + 4 * v1167 + 36) = v1156;
                                unsigned int v1168 = (117 * (*(unsigned char *)(v985 + 82) + 1)) >> 8;
                                *(unsigned char *)(v985 + 82) = *(unsigned char *)(v985 + 82)
                                                      + 1
                                                      - 11
                                                      * ((v1168
                                                        + (((*(unsigned char *)(v985 + 82) + 1 - v1168) & 0xFE) >> 1)) >> 3);
                                int v992 = 8;
                                id v3 = v1558;
                                if (!*(unsigned char *)(v18 + 1313)) {
                                  goto LABEL_944;
                                }
                                goto LABEL_940;
                              }
                              id v17 = v1548;
                              if (*(unsigned char *)(v18 + 1313))
                              {
                                char v1234 = v1154;
                                os_log_t v1235 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                uint64_t v1154 = (uint64_t)v1235;
                                if (sNRCopyLogToStdErr)
                                {

                                  id v17 = v1548;
                                }
                                else
                                {
                                  BOOL v1280 = os_log_type_enabled(v1235, OS_LOG_TYPE_INFO);

                                  unint64_t v18 = 0x26AB22000;
                                  id v17 = v1548;
                                  LOBYTE(v1154) = v1234;
                                  if (!v1280) {
                                    goto LABEL_1117;
                                  }
                                }
                                uint64_t v1154 = (uint64_t)_NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                _NRLogWithArgs(v1154, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL outer loop", v1281, v1282, v1283, v1284, v1285, (uint64_t)"");

                                LOBYTE(v1154) = v1234;
                                unint64_t v18 = 0x26AB22000;
                              }
LABEL_1117:
                              v1189 = v1558;
                              if (v1154) {
                                goto LABEL_1160;
                              }
                              if (v1546 != 1)
                              {
                                if (v1546 != 2)
                                {
                                  if (v1546 == 3)
                                  {
                                    uint64_t v1190 = *((void *)v1558 + 17);
                                    if ((v1190 & 8) != 0 && *v1545)
                                    {
                                      *((void *)v1558 + 17) = v1190 & 0xFFFFFFFFFFFFFFF7;
                                      if (!*(unsigned char *)(v18 + 1313)) {
                                        goto LABEL_1124;
                                      }
                                      os_log_t v1351 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                      os_log_t v1352 = v1351;
                                      if (sNRCopyLogToStdErr)
                                      {

                                        goto LABEL_1290;
                                      }
                                      BOOL v1460 = os_log_type_enabled(v1351, OS_LOG_TYPE_INFO);

                                      if (v1460)
                                      {
LABEL_1290:
                                        os_log_t v1393 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                        _NRLogWithArgs((uint64_t)v1393, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1461, v1462, v1463, v1464, v1465, (uint64_t)"");
LABEL_1291:
                                      }
LABEL_1292:
                                      id v17 = v1548;
LABEL_1124:
                                      v1191 = v1545;
                                      goto LABEL_1159;
                                    }
                                    goto LABEL_1160;
                                  }
                                  uint64_t v1192 = *((void *)v1558 + 17);
LABEL_1143:
                                  if ((v1192 & 8) != 0 && *v1545)
                                  {
                                    *((void *)v1558 + 17) = v1192 & 0xFFFFFFFFFFFFFFF7;
                                    if (!*(unsigned char *)(v18 + 1313)) {
                                      goto LABEL_1146;
                                    }
                                    os_log_t v1324 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                    os_log_t v1325 = v1324;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v1189 = v1558;
                                      id v17 = v1548;
                                      goto LABEL_1280;
                                    }
                                    BOOL v1431 = os_log_type_enabled(v1324, OS_LOG_TYPE_INFO);

                                    v1189 = v1558;
                                    id v17 = v1548;
                                    if (v1431)
                                    {
LABEL_1280:
                                      os_log_t v1432 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                      _NRLogWithArgs((uint64_t)v1432, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1433, v1434, v1435, v1436, v1437, (uint64_t)"");
                                    }
LABEL_1146:
                                    dispatch_resume(*((dispatch_object_t *)v1189 + 38));
                                    uint64_t v1192 = *((void *)v1189 + 17);
                                  }
                                  if ((v1192 & 0x10) != 0 && *((void *)v1189 + 40))
                                  {
                                    *((void *)v1189 + 17) = v1192 & 0xFFFFFFFFFFFFFFEFLL;
                                    if (!gNRPacketLoggingEnabled) {
                                      goto LABEL_1150;
                                    }
                                    os_log_t v1326 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                    os_log_t v1327 = v1326;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v1189 = v1558;
                                      id v17 = v1548;
                                      goto LABEL_1282;
                                    }
                                    BOOL v1438 = os_log_type_enabled(v1326, OS_LOG_TYPE_INFO);

                                    v1189 = v1558;
                                    id v17 = v1548;
                                    if (v1438)
                                    {
LABEL_1282:
                                      os_log_t v1439 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                      _NRLogWithArgs((uint64_t)v1439, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1440, v1441, v1442, v1443, v1444, (uint64_t)"");
                                    }
LABEL_1150:
                                    dispatch_resume(*((dispatch_object_t *)v1189 + 40));
                                    uint64_t v1192 = *((void *)v1189 + 17);
                                  }
                                  if ((v1192 & 0x20) == 0) {
                                    goto LABEL_1155;
                                  }
                                  unint64_t v18 = 0x26AB22000uLL;
                                  if (*((void *)v1189 + 42))
                                  {
                                    *((void *)v1189 + 17) = v1192 & 0xFFFFFFFFFFFFFFDFLL;
                                    if (!gNRPacketLoggingEnabled) {
                                      goto LABEL_1154;
                                    }
                                    os_log_t v1328 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                    os_log_t v1329 = v1328;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      v1189 = v1558;
                                      id v17 = v1548;
                                      goto LABEL_1284;
                                    }
                                    BOOL v1445 = os_log_type_enabled(v1328, OS_LOG_TYPE_INFO);

                                    v1189 = v1558;
                                    id v17 = v1548;
                                    if (v1445)
                                    {
LABEL_1284:
                                      os_log_t v1446 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                      _NRLogWithArgs((uint64_t)v1446, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1447, v1448, v1449, v1450, v1451, (uint64_t)"");
                                    }
LABEL_1154:
                                    dispatch_resume(*((dispatch_object_t *)v1189 + 42));
                                    uint64_t v1192 = *((void *)v1189 + 17);
LABEL_1155:
                                    unint64_t v18 = 0x26AB22000uLL;
                                  }
                                  if ((v1192 & 0x40) == 0 || !*((void *)v1189 + 44)) {
                                    goto LABEL_1160;
                                  }
LABEL_1158:
                                  v1191 = (dispatch_object_t *)(v1189 + 352);
                                  *((void *)v1189 + 17) = v1192 & 0xFFFFFFFFFFFFFFBFLL;
                                  if (*(unsigned char *)(v18 + 1313))
                                  {
                                    v1545 = (dispatch_object_t *)(v1189 + 352);
                                    os_log_t v1316 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                    os_log_t v1317 = v1316;
                                    if (sNRCopyLogToStdErr)
                                    {
                                    }
                                    else
                                    {
                                      BOOL v1392 = os_log_type_enabled(v1316, OS_LOG_TYPE_INFO);

                                      if (!v1392) {
                                        goto LABEL_1292;
                                      }
                                    }
                                    os_log_t v1393 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs((uint64_t)v1393, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBKInput", v1394, v1395, v1396, v1397, v1398, (uint64_t)"");
                                    goto LABEL_1291;
                                  }
LABEL_1159:
                                  dispatch_resume(*v1191);
                                  unint64_t v18 = 0x26AB22000uLL;
LABEL_1160:
                                  if (*(unsigned char *)(v18 + 1313))
                                  {
                                    os_log_t v1236 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    os_log_t v1237 = v1236;
                                    if (sNRCopyLogToStdErr)
                                    {

                                      id v17 = v1548;
                                    }
                                    else
                                    {
                                      BOOL v1286 = os_log_type_enabled(v1236, OS_LOG_TYPE_INFO);

                                      id v17 = v1548;
                                      if (!v1286) {
                                        goto LABEL_1161;
                                      }
                                    }
                                    os_log_t v1287 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs((uint64_t)v1287, 1, (uint64_t)"%s%.30s:%-4d %s: done with NtL fast-path", v1288, v1289, v1290, v1291, v1292, (uint64_t)"");
                                  }
LABEL_1161:
                                  unsigned int v1196 = *(unsigned __int8 *)(v985 + 82);
                                  if (v1196 >= 0xB)
                                  {
                                    unsigned int v1196 = *(unsigned __int8 *)(v985 + 82)
                                          - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v985 + 82)) >> 32);
                                    *(unsigned char *)(v985 + 82) = v1196;
                                  }
                                  *(_DWORD *)(v985 + 4 * v1196 + 36) = v1156 | 0x60000;
                                  unsigned int v1197 = (117 * (*(unsigned char *)(v985 + 82) + 1)) >> 8;
                                  *(unsigned char *)(v985 + 82) = *(unsigned char *)(v985 + 82)
                                                        + 1
                                                        - 11
                                                        * ((v1197
                                                          + (((*(unsigned char *)(v985 + 82) + 1 - v1197) & 0xFE) >> 1)) >> 3);
                                  id v3 = v1558;
                                  goto LABEL_1164;
                                }
                                uint64_t v1193 = *((void *)v1558 + 17);
                                if ((v1193 & 8) != 0 && *v1545)
                                {
                                  *((void *)v1558 + 17) = v1193 & 0xFFFFFFFFFFFFFFF7;
                                  if (!*(unsigned char *)(v18 + 1313)) {
                                    goto LABEL_1136;
                                  }
                                  os_log_t v1353 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                  os_log_t v1354 = v1353;
                                  if (sNRCopyLogToStdErr)
                                  {

                                    v1189 = v1558;
                                    id v17 = v1548;
                                    goto LABEL_1294;
                                  }
                                  BOOL v1466 = os_log_type_enabled(v1353, OS_LOG_TYPE_INFO);

                                  v1189 = v1558;
                                  id v17 = v1548;
                                  if (v1466)
                                  {
LABEL_1294:
                                    os_log_t v1467 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                    _NRLogWithArgs((uint64_t)v1467, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOInput", v1468, v1469, v1470, v1471, v1472, (uint64_t)"");
                                  }
LABEL_1136:
                                  dispatch_resume(*((dispatch_object_t *)v1189 + 38));
                                  uint64_t v1193 = *((void *)v1189 + 17);
                                  unint64_t v18 = 0x26AB22000uLL;
                                }
                                if ((v1193 & 0x10) != 0 && *((void *)v1189 + 40))
                                {
                                  v1191 = (dispatch_object_t *)(v1189 + 320);
                                  *((void *)v1189 + 17) = v1193 & 0xFFFFFFFFFFFFFFEFLL;
                                  if (*(unsigned char *)(v18 + 1313))
                                  {
                                    v1545 = (dispatch_object_t *)(v1189 + 320);
                                    os_log_t v1194 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                    os_log_t v1195 = v1194;
                                    if (sNRCopyLogToStdErr)
                                    {
                                    }
                                    else
                                    {
                                      BOOL v1454 = os_log_type_enabled(v1194, OS_LOG_TYPE_INFO);

                                      if (!v1454) {
                                        goto LABEL_1292;
                                      }
                                    }
                                    os_log_t v1393 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                                    _NRLogWithArgs((uint64_t)v1393, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIInput", v1455, v1456, v1457, v1458, v1459, (uint64_t)"");
                                    goto LABEL_1291;
                                  }
                                  goto LABEL_1159;
                                }
                                goto LABEL_1160;
                              }
                              uint64_t v1192 = *((void *)v1558 + 17);
                              if ((v1558[10] & 4) == 0) {
                                goto LABEL_1143;
                              }
                              if ((v1192 & 0x20) != 0 && *((void *)v1558 + 42))
                              {
                                *((void *)v1558 + 17) = v1192 & 0xFFFFFFFFFFFFFFDFLL;
                                if (!*(unsigned char *)(v18 + 1313)) {
                                  goto LABEL_1129;
                                }
                                os_log_t v1452 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                os_log_t v1453 = v1452;
                                if (sNRCopyLogToStdErr)
                                {

                                  v1189 = v1558;
                                  id v17 = v1548;
                                  goto LABEL_1298;
                                }
                                BOOL v1480 = os_log_type_enabled(v1452, OS_LOG_TYPE_INFO);

                                v1189 = v1558;
                                id v17 = v1548;
                                if (v1480)
                                {
LABEL_1298:
                                  os_log_t v1481 = _NRCopyLogObjectForNRUUID(*((void **)v1189 + 5));
                                  _NRLogWithArgs((uint64_t)v1481, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEInput", v1482, v1483, v1484, v1485, v1486, (uint64_t)"");
                                }
LABEL_1129:
                                dispatch_resume(*((dispatch_object_t *)v1189 + 42));
                                uint64_t v1192 = *((void *)v1189 + 17);
                                unint64_t v18 = 0x26AB22000;
                              }
                              if ((v1192 & 0x40) == 0 || !*((void *)v1189 + 44)) {
                                goto LABEL_1160;
                              }
                              goto LABEL_1158;
                            }
LABEL_1084:
                            if (v1559 <= 8u)
                            {
                              if (!v1563) {
                                goto LABEL_1089;
                              }
                              unsigned int v1166 = os_channel_available_slot_count();
                              unint64_t v18 = 0x26AB22000uLL;
                              if (v1166 > 1) {
                                goto LABEL_1089;
                              }
                            }
                            if (!*(unsigned char *)(v18 + 1313))
                            {
LABEL_1088:
                              int v1156 = v1061 | 0x18000;
                              os_channel_sync();
                              v1558[13] = 0;
                              unint64_t v18 = 0x26AB22000uLL;
                              goto LABEL_1089;
                            }
                            int v1172 = v1154;
                            os_log_t v1173 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            uint64_t v1154 = (uint64_t)v1173;
                            if (sNRCopyLogToStdErr)
                            {
                            }
                            else
                            {
                              BOOL v1181 = os_log_type_enabled(v1173, OS_LOG_TYPE_INFO);

                              LODWORD(v1154) = v1172;
                              if (!v1181) {
                                goto LABEL_1088;
                              }
                            }
                            uint64_t v1154 = (uint64_t)_NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                            _NRLogWithArgs(v1154, 1, (uint64_t)"%s%.30s:%-4d %s: performing RX sync (%u packets, %u bytes, %u pending, %0.2f msec, canWriteMore %d, memmove %u)", v1182, v1183, v1184, v1185, v1186, (uint64_t)"");

                            LODWORD(v1154) = v1172;
                            goto LABEL_1088;
                          }
                          int v1169 = (int)v1557;
                          os_log_t v1170 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                          os_log_t v1171 = v1170;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_1099;
                          }
                          BOOL v1174 = os_log_type_enabled(v1170, OS_LOG_TYPE_INFO);

                          if (v1174)
                          {
LABEL_1099:
                            os_log_t v1175 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                            _NRLogWithArgs((uint64_t)v1175, 1, (uint64_t)"%s%.30s:%-4d %s: out of NtL inner loop", v1176, v1177, v1178, v1179, v1180, (uint64_t)"");
                          }
                          unint64_t v18 = 0x26AB22000;
                          LODWORD(v1154) = v1169;
                          int v1156 = v1061 | 0x8000;
                          if (!v1003) {
                            goto LABEL_1074;
                          }
LABEL_1083:
                          os_channel_advance_slot();
                          unint64_t v18 = 0x26AB22000;
                          v3[13] = 1;
                          goto LABEL_1084;
                        }
LABEL_1022:
                        if (v1062 < *(unsigned __int16 *)(v985 + 80))
                        {
                          if (!*(unsigned char *)(v18 + 1313)) {
                            goto LABEL_1024;
                          }
                          os_log_t v1099 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                          os_log_t v1100 = v1099;
                          if (sNRCopyLogToStdErr)
                          {

                            goto LABEL_1058;
                          }
                          LODWORD(v1551) = os_log_type_enabled(v1099, OS_LOG_TYPE_INFO);

                          if (v1551)
                          {
LABEL_1058:
                            os_log_t v1119 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                            _NRLogWithArgs((uint64_t)v1119, 1, (uint64_t)"%s%.30s:%-4d %s: memmoving filledIn=%u, bufferHandled=%zu", v1120, v1121, v1122, v1123, v1124, (uint64_t)"");
                          }
LABEL_1024:
                          v1061 |= 0x2000u;
                          memmove(*(void **)v985, (const void *)(*(void *)v985 + v1564), *(unsigned __int16 *)(v985 + 80) - v1564);
                          unint64_t v1076 = v1564;
                          *(_WORD *)(v985 + 80) -= v1564;
                          uint64_t v1555 = (v1555 + 1);
                          unint64_t v18 = 0x26AB22000;
LABEL_1027:
                          *(void *)&v3[v1554] += v1076;
                          goto LABEL_1028;
                        }
                        if (!*(unsigned char *)(v18 + 1313))
                        {
LABEL_1026:
                          v1061 |= 0x4000u;
                          *(_WORD *)(v985 + 80) = 0;
                          unint64_t v1076 = v1564;
                          goto LABEL_1027;
                        }
                        os_log_t v1101 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                        os_log_t v1102 = v1101;
                        if (sNRCopyLogToStdErr)
                        {
                        }
                        else
                        {
                          LODWORD(v1551) = os_log_type_enabled(v1101, OS_LOG_TYPE_INFO);

                          unint64_t v18 = 0x26AB22000;
                          if (!v1551) {
                            goto LABEL_1026;
                          }
                        }
                        os_log_t v1125 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                        _NRLogWithArgs((uint64_t)v1125, 1, (uint64_t)"%s%.30s:%-4d %s: not memmoving filledIn=%u, bufferHandled=%zu", v1126, v1127, v1128, v1129, v1130, (uint64_t)"");

                        unint64_t v18 = 0x26AB22000;
                        goto LABEL_1026;
                      }
                      int v1061 = v1013 | 0x400;
                      if (!*(unsigned char *)(v18 + 1313))
                      {
                        LODWORD(v1154) = 0;
                        BOOL v1155 = 1;
                        int v1156 = v1013 | 0x8400;
                        if (v1003) {
                          goto LABEL_1083;
                        }
                        goto LABEL_1074;
                      }
                      os_log_t v1157 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      os_log_t v1158 = v1157;
                      if (sNRCopyLogToStdErr)
                      {

                        goto LABEL_1079;
                      }
                      BOOL v1159 = os_log_type_enabled(v1157, OS_LOG_TYPE_INFO);

                      if (v1159)
                      {
LABEL_1079:
                        id v3 = v1558;
                        os_log_t v1160 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                        _NRLogWithArgs((uint64_t)v1160, 1, (uint64_t)"%s%.30s:%-4d %s: nothing to read from nexus", v1161, v1162, v1163, v1164, v1165, (uint64_t)"");
                      }
                      else
                      {
                        id v3 = v1558;
                      }
                      unint64_t v18 = 0x26AB22000uLL;
                      goto LABEL_1081;
                    }
                    os_channel_slot_get_packet();
                    os_packet_get_next_buflet();
                    unsigned int v1024 = os_buflet_get_data_offset();
                    uint64_t v1025 = os_buflet_get_object_address();
                    unsigned int v1026 = os_buflet_get_data_length();
                    if (v1026 >= 0x10000)
                    {
                      if (nrCopyLogObj_onceToken_521 != -1) {
                        dispatch_once(&nrCopyLogObj_onceToken_521, &__block_literal_global_400);
                      }
                      if (!sNRCopyLogToStdErr
                        && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_522, OS_LOG_TYPE_ERROR))
                      {
                        goto LABEL_388;
                      }
                      uint64_t v415 = nrCopyLogObj_sNRLogObj_522;
LABEL_387:
                      _NRLogWithArgs(v415, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen <= 65535", v108, v109, v110, v111, v112, (uint64_t)"");
                      goto LABEL_388;
                    }
                    unsigned __int16 v1027 = v1026;
                    if (!(_WORD)v1026 && WORD1(v1566))
                    {
                      unint64_t v1564 = 0;
                      uint64_t v1565 = 0;
                      unint64_t v1564 = *(void *)v985 + *(unsigned __int16 *)(v985 + 80);
                      LODWORD(v1565) = v1023;
                      int v1028 = nrPacketToTLV((unsigned __int8 *)v1567, WORD1(v1566), (uint64_t)&v1564, 1u, (uint64_t)ESPSequenceNumberFromPacket, (uint64_t)v1560);
                      id v3 = v1558;
                      if (!gNRPacketLoggingEnabled)
                      {
LABEL_968:
                        v1013 |= 0x80u;
                        goto LABEL_974;
                      }
                      os_log_t v1033 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      os_log_t v1034 = v1033;
                      if (sNRCopyLogToStdErr)
                      {
                      }
                      else
                      {
                        BOOL v1039 = os_log_type_enabled(v1033, OS_LOG_TYPE_INFO);

                        if (!v1039) {
                          goto LABEL_968;
                        }
                      }
                      os_log_t v1040 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      getESPSequenceNumberFromPacket(v1567, WORD1(v1566));
                      getESPSPIFromPacket(v1567, WORD1(v1566));
                      _NRLogWithArgs((uint64_t)v1040, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v1041, v1042, v1043, v1044, v1045, (uint64_t)"");

                      goto LABEL_968;
                    }
                    if ((_WORD)v1026)
                    {
                      v1029 = (unsigned __int8 *)(v1025 + v1024);
                      unint64_t v1564 = 0;
                      uint64_t v1565 = 0;
                      unint64_t v1564 = *(void *)v985 + *(unsigned __int16 *)(v985 + 80);
                      LODWORD(v1565) = v1023;
                      int v1028 = nrPacketToTLV(v1029, (unsigned __int16)v1026, (uint64_t)&v1564, 1u, (uint64_t)ESPSequenceNumberFromPacket, (uint64_t)v1560);
                      id v3 = v1558;
                      if (!gNRPacketLoggingEnabled)
                      {
LABEL_971:
                        v1013 |= 0x100u;
                        goto LABEL_974;
                      }
                      os_log_t v1035 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                      os_log_t v1036 = v1035;
                      if (sNRCopyLogToStdErr)
                      {
                      }
                      else
                      {
                        LODWORD(v1557) = os_log_type_enabled(v1035, OS_LOG_TYPE_INFO);

                        if (!v1557) {
                          goto LABEL_971;
                        }
                      }
                      os_log_t v1557 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                      getESPSequenceNumberFromPacket((uint64_t)v1029, v1027);
                      getESPSPIFromPacket((uint64_t)v1029, v1027);
                      os_log_t v1046 = v1557;
                      _NRLogWithArgs((uint64_t)v1557, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u bytes from nexus for ESP seq: %u (spi: %u)", v1047, v1048, v1049, v1050, v1051, (uint64_t)"");

                      goto LABEL_971;
                    }
                    v1013 |= 0x200u;
                    if (!gNRPacketLoggingEnabled)
                    {
                      int v1028 = 0;
                      id v3 = v1558;
                      goto LABEL_974;
                    }
                    id v3 = v1558;
                    os_log_t v1037 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                    os_log_t v1038 = v1037;
                    if (sNRCopyLogToStdErr)
                    {
                    }
                    else
                    {
                      int v1028 = os_log_type_enabled(v1037, OS_LOG_TYPE_INFO);

                      if (!v1028) {
                        goto LABEL_974;
                      }
                    }
                    os_log_t v1052 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
                    _NRLogWithArgs((uint64_t)v1052, 1, (uint64_t)"%s%.30s:%-4d %s: No data to write", v1053, v1054, v1055, v1056, v1057, (uint64_t)"");

                    int v1028 = 0;
LABEL_974:
                    *(_WORD *)(v985 + 80) += v1028;
                    if ((v1562 & 8) != 0) {
                      uint64_t v1030 = 0;
                    }
                    else {
                      uint64_t v1030 = os_channel_get_next_slot();
                    }
                    ++v987;
                    ++*((void *)v3 + 54);
                    v3[14] = 1;
                    v986 += v1028;
                    if (!v1030)
                    {
                      uint64_t v1002 = 0;
                      uint64_t v1003 = v1022;
                      goto LABEL_996;
                    }
                    unsigned int v1031 = *(unsigned __int8 *)(v985 + 82);
                    if (v1031 >= 0xB)
                    {
                      unsigned int v1031 = *(unsigned __int8 *)(v985 + 82)
                            - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v985 + 82)) >> 32);
                      *(unsigned char *)(v985 + 82) = v1031;
                    }
                    *(_DWORD *)(v985 + 4 * v1031 + 36) = v1013;
                    unsigned int v1032 = (117 * (*(unsigned char *)(v985 + 82) + 1)) >> 8;
                    *(unsigned char *)(v985 + 82) = *(unsigned char *)(v985 + 82)
                                          + 1
                                          - 11
                                          * ((v1032
                                            + (((*(unsigned char *)(v985 + 82) + 1 - v1032) & 0xFE) >> 1)) >> 3);
                    uint64_t v1003 = v1022;
                    uint64_t v1022 = v1030;
                    int v1013 = 0;
                  }
                }
                os_log_t v1103 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                os_log_t v1104 = v1103;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  LODWORD(v1557) = os_log_type_enabled(v1103, OS_LOG_TYPE_INFO);

                  unint64_t v18 = 0x26AB22000;
                  if (!v1557) {
                    goto LABEL_958;
                  }
                }
                os_log_t v1133 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
                _NRLogWithArgs((uint64_t)v1133, 1, (uint64_t)"%s%.30s:%-4d %s: wrote %u (%u/%u) bytes from linkWriteBuffer", v1134, v1135, v1136, v1137, v1138, (uint64_t)"");

                unint64_t v18 = 0x26AB22000;
                goto LABEL_958;
              }
              if (!*(unsigned char *)(v18 + 1313))
              {
LABEL_1106:
                if (v1553) {
                  v1553((uint64_t)v3);
                }
                unsigned int v1187 = *(unsigned __int8 *)(v985 + 82);
                if (v1187 >= 0xB)
                {
                  unsigned int v1187 = *(unsigned __int8 *)(v985 + 82)
                        - 11 * ((390451573 * (unint64_t)*(unsigned __int8 *)(v985 + 82)) >> 32);
                  *(unsigned char *)(v985 + 82) = v1187;
                }
                *(_DWORD *)(v985 + 4 * v1187 + 36) = 3;
                unsigned int v1188 = (117 * (*(unsigned char *)(v985 + 82) + 1)) >> 8;
                *(unsigned char *)(v985 + 82) = *(unsigned char *)(v985 + 82)
                                      + 1
                                      - 11
                                      * ((v1188 + (((*(unsigned char *)(v985 + 82) + 1 - v1188) & 0xFE) >> 1)) >> 3);
                goto LABEL_1164;
              }
              os_log_t v1201 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
              os_log_t v1202 = v1201;
              if (sNRCopyLogToStdErr)
              {

                id v3 = v1558;
              }
              else
              {
                BOOL v1223 = os_log_type_enabled(v1201, OS_LOG_TYPE_INFO);

                id v3 = v1558;
                if (!v1223) {
                  goto LABEL_1106;
                }
              }
              os_log_t v1224 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
              _NRLogWithArgs((uint64_t)v1224, 1, (uint64_t)"%s%.30s:%-4d %s: ignoring NtL fast-path for %u, as waiting for link output available", v1225, v1226, v1227, v1228, v1229, (uint64_t)"");

              goto LABEL_1106;
            }
            uint64_t v1198 = (uint64_t)v25;
            if (*(unsigned char *)(v18 + 1313))
            {
              os_log_t v1491 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
              os_log_t v1492 = v1491;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v1507 = os_log_type_enabled(v1491, OS_LOG_TYPE_INFO);

                if (!v1507) {
                  goto LABEL_1168;
                }
              }
              os_log_t v1508 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
              _NRLogWithArgs((uint64_t)v1508, 1, (uint64_t)"%s%.30s:%-4d ", v1509, v1510, v1511, v1512, v1513, (uint64_t)"");
            }
LABEL_1168:
            os_log_t v1199 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
            os_log_t v1200 = v1199;
            if (sNRCopyLogToStdErr)
            {

              id v3 = v1558;
            }
            else
            {
              BOOL v1203 = os_log_type_enabled(v1199, OS_LOG_TYPE_FAULT);

              id v3 = v1558;
              if (!v1203) {
                goto LABEL_1164;
              }
            }
            os_log_t v1204 = _NRCopyLogObjectForNRUUID(*((void **)v3 + 5));
            _NRLogWithArgs((uint64_t)v1204, 17, (uint64_t)"%s: Invalid write context for nexus priority: %u", v1205, v1206, v1207, v1208, v1209, v1198);

LABEL_1164:
            goto LABEL_1165;
          }
        }
        os_log_t v642 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
        _NRLogWithArgs((uint64_t)v642, 16, (uint64_t)"%s%.30s:%-4d invalid link channel priority", v643, v644, v645, v646, v647, (uint64_t)"");
        goto LABEL_590;
      case 1:
        v418 = v1558;
        uint64_t v419 = *((void *)v1558 + 17);
        ++*((void *)v1558 + 18);
        *((void *)v418 + 17) = v419 & 0xFFFFFFFFFFFFFFFELL | *(unsigned char *)(a1 + 84) & 1;
        if (!*(unsigned char *)(v4 + 1313)) {
          goto LABEL_5;
        }
        os_log_t v420 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
        os_log_t v421 = v420;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v959 = os_log_type_enabled(v420, OS_LOG_TYPE_INFO);

          if (!v959) {
            goto LABEL_5;
          }
        }
        os_log_t v642 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
        _NRLogWithArgs((uint64_t)v642, 1, (uint64_t)"%s%.30s:%-4d source-%s: Medium", v960, v961, v962, v963, v964, (uint64_t)"");
        goto LABEL_590;
      case 2:
        v422 = v1558;
        ++*((void *)v1558 + 20);
        *((void *)v422 + 17) = *((void *)v422 + 17) & 0xFFFFFFFFFFFFFFFDLL | (2 * (*(unsigned char *)(a1 + 84) & 1));
        if (!*(unsigned char *)(v4 + 1313)) {
          goto LABEL_5;
        }
        os_log_t v423 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
        os_log_t v424 = v423;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v965 = os_log_type_enabled(v423, OS_LOG_TYPE_INFO);

          if (!v965) {
            goto LABEL_5;
          }
        }
        os_log_t v642 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
        _NRLogWithArgs((uint64_t)v642, 1, (uint64_t)"%s%.30s:%-4d source-%s: High", v966, v967, v968, v969, v970, (uint64_t)"");
        goto LABEL_590;
      case 3:
        v425 = v1558;
        ++*((void *)v1558 + 22);
        *((void *)v425 + 17) = *((void *)v425 + 17) & 0xFFFFFFFFFFFFFFFBLL | (4 * (*(unsigned char *)(a1 + 84) & 1));
        if (!*(unsigned char *)(v4 + 1313)) {
          goto LABEL_5;
        }
        os_log_t v426 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
        os_log_t v427 = v426;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v971 = os_log_type_enabled(v426, OS_LOG_TYPE_INFO);

          if (!v971) {
            goto LABEL_5;
          }
        }
        os_log_t v642 = _NRCopyLogObjectForNRUUID(*((void **)v1558 + 5));
        _NRLogWithArgs((uint64_t)v642, 1, (uint64_t)"%s%.30s:%-4d source-%s: Isochronous", v972, v973, v974, v975, v976, (uint64_t)"");
LABEL_590:

        goto LABEL_5;
      default:
        goto LABEL_5;
    }
  }
  v667 = nrCopyLogObj_518();
  v668 = v667;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v671 = os_log_type_enabled(v667, OS_LOG_TYPE_FAULT);

    if (!v671) {
      return;
    }
  }
  id v1563 = nrCopyLogObj_518();
  _NRLogWithArgs((uint64_t)v1563, 17, (uint64_t)"%s called with null linkWriteContext", v672, v673, v674, v675, v676, (uint64_t)"NRParserLinkWriteAvailable");
}

__CFString *createStringFromNRLinkChannelPriority(unsigned int a1)
{
  if (a1 >= 4) {
    return (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", a1);
  }
  else {
    return off_263FD11D0[a1];
  }
}

void NRBluetoothPacketParserSuspendNexusBKInputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x40) != 0 || !*(void *)(a1 + 352)) {
    return;
  }
  *(void *)(a1 + 136) = v1 | 0x40;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusBKInput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 352);
  dispatch_suspend(v3);
}

void NRBluetoothPacketParserSuspendNexusBEInputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x20) != 0 || !*(void *)(a1 + 336)) {
    return;
  }
  *(void *)(a1 + 136) = v1 | 0x20;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusBEInput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 336);
  dispatch_suspend(v3);
}

void NRBluetoothPacketParserSuspendNexusVIInputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x10) != 0 || !*(void *)(a1 + 320)) {
    return;
  }
  *(void *)(a1 + 136) = v1 | 0x10;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusVIInput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 320);
  dispatch_suspend(v3);
}

void NRBluetoothPacketParserSuspendNexusVOInputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 8) != 0 || !*(void *)(a1 + 304)) {
    return;
  }
  *(void *)(a1 + 136) = v1 | 8;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusVOInput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 304);
  dispatch_suspend(v3);
}

uint64_t NRBluetoothParserReadInputCallback(uint64_t a1, __CFString *a2, unint64_t a3, unint64_t *a4, char a5)
{
  if (!a2)
  {
    uint64_t v31 = nrCopyLogObj_518();
    uint64_t v32 = v31;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v35 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

      if (!v35) {
        return 0;
      }
    }
    uint64_t v11 = (void **)nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null buffer", v36, v37, v38, v39, v40, (uint64_t)"NRBluetoothParserReadInputCallback");
LABEL_35:
    uint64_t v12 = 0;
    goto LABEL_26;
  }
  if (!a4)
  {
    char v33 = nrCopyLogObj_518();
    int v34 = v33;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v41 = os_log_type_enabled(v33, OS_LOG_TYPE_FAULT);

      if (!v41) {
        return 0;
      }
    }
    uint64_t v11 = (void **)nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null handledBufferLength", v42, v43, v44, v45, v46, (uint64_t)"NRBluetoothParserReadInputCallback");
    goto LABEL_35;
  }
  if (!a1) {
    return 0;
  }
  uint64_t v10 = (void **)*(id *)(a1 + 8);
  uint64_t v11 = v10;
  if (*((unsigned char *)v10 + 8) != 4)
  {
    if (!gNRPacketLoggingEnabled) {
      goto LABEL_7;
    }
    os_log_t v48 = _NRCopyLogObjectForNRUUID(v10[5]);
    os_log_t v49 = v48;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v50 = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);

      if (!v50) {
        goto LABEL_7;
      }
    }
    os_log_t v51 = _NRCopyLogObjectForNRUUID(v11[5]);
    StringFromNRLinkChannelPriority = createStringFromNRLinkChannelPriority(*(unsigned __int8 *)(a1 + 26));
    _NRLogWithArgs((uint64_t)v51, 1, (uint64_t)"%s%.30s:%-4d Link input available - %@", v52, v53, v54, v55, v56, (uint64_t)"");

LABEL_7:
    int v13 = *(unsigned __int8 *)(a1 + 26);
    uint64_t v14 = 560;
    if (v13 == 3) {
      uint64_t v14 = 576;
    }
    BOOL v15 = v13 == 2;
    uint64_t v16 = 592;
    if (!v15) {
      uint64_t v16 = v14;
    }
    *(void **)((char *)v11 + v16) = *(char **)((char *)v11 + v16) + a3;
    if ((*(unsigned char *)(a1 + 27) & 1) == 0)
    {
      os_log_t v17 = _NRCopyLogObjectForNRUUID(v11[5]);
      os_log_t v18 = v17;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v23 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

        if (!v23)
        {
LABEL_21:
          uint64_t v12 = 0;
          *a4 = 0;
          goto LABEL_26;
        }
      }
      os_log_t v24 = _NRCopyLogObjectForNRUUID(v11[5]);
      _NRLogWithArgs((uint64_t)v24, 0, (uint64_t)"%s%.30s:%-4d not ready to accept data", v25, v26, v27, v28, v29, (uint64_t)"");

      goto LABEL_21;
    }
    if ((*(unsigned char *)(a1 + 27) & 2) != 0)
    {
      uint64_t v12 = NRBluetoothPacketParserLinkToNexusLoopFastPath((uint64_t)v11, a1, a2, a3, a4, a5);
      goto LABEL_26;
    }
    if (*((unsigned char *)v11 + 8) == 4)
    {
LABEL_25:
      *a4 = a3;
      uint64_t v12 = 1;
      goto LABEL_26;
    }
    uint64_t v19 = *(void *)a1;
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (*(unsigned __int8 *)(a1 + 26) - 1 > 2) {
      uint64_t v22 = &unk_26BE1D9F8;
    }
    else {
      uint64_t v22 = (void *)qword_263FD11F0[(*(unsigned char *)(a1 + 26) - 1)];
    }
    memcpy((void *)(v19 + *(unsigned int *)(a1 + 16)), a2, a3);
    *(_DWORD *)(a1 + 16) += a3;
    if (!gNRPacketLoggingEnabled)
    {
LABEL_24:
      uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a2 length:a3];
      [v21 setObject:v22 forKeyedSubscript:@"channel-id"];
      [v21 setObject:v30 forKeyedSubscript:@"message-data"];
      [v21 setObject:&unk_26BE1DA10 forKeyedSubscript:@"message-pre-act"];
      [v20 setObject:v21 forKeyedSubscript:@"message"];
      [v11[50] sendXPCCommDictionary:v20];

      goto LABEL_25;
    }
    os_log_t v57 = _NRCopyLogObjectForNRUUID(v11[5]);
    os_log_t v58 = v57;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v59 = os_log_type_enabled(v57, OS_LOG_TYPE_INFO);

      if (!v59) {
        goto LABEL_24;
      }
    }
    os_log_t v60 = _NRCopyLogObjectForNRUUID(v11[5]);
    _NRLogWithArgs((uint64_t)v60, 1, (uint64_t)"%s%.30s:%-4d Reading link input, setting filledIn=%u (linkChannelPriority=%u)", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_24;
  }
  uint64_t v12 = 0;
LABEL_26:

  return v12;
}

uint64_t NRBluetoothPacketParserLinkToNexusLoopFastPath(uint64_t a1, uint64_t a2, __CFString *a3, unint64_t a4, unint64_t *a5, char a6)
{
  uint64_t v801 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 8) == 4)
  {
    char v6 = 0;
    return v6 & 1;
  }
  uint64_t v11 = a1;
  int v767 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  os_log_t v18 = *(unsigned char **)a2;
  char v19 = *(unsigned char *)(a2 + 27);
  if ((v19 & 4) == 0 && (a6 & 1) == 0) {
    char v20 = 0;
  }
  else {
    char v20 = 4;
  }
  *(unsigned char *)(a2 + 27) = v20 | v19 & 0xFB;
  BOOL v21 = (v19 & 4) != 0 || (a6 & 1) != 0 || *(unsigned char *)(v11 + 19) != 0;
  BOOL v766 = v21;
  unsigned int v22 = *(unsigned __int8 *)(a2 + 26) - 1;
  if (v22 > 2)
  {
    uint64_t v759 = 0;
    os_log_t v760 = 0;
    uint64_t v775 = 0;
    id v773 = 0;
    uint64_t v757 = 0;
    uint64_t v761 = 0;
  }
  else
  {
    uint64_t v23 = (*(unsigned char *)(a2 + 26) - 1);
    os_log_t v24 = (void *)(v11 - 16 * v22);
    uint64_t v757 = off_26BE15140[v23];
    uint64_t v761 = off_26BE15158[v23];
    uint64_t v25 = (void *)v24[43];
    uint64_t v775 = v24[35];
    id v773 = v25;
    uint64_t v759 = (unsigned char *)(v11 - v23 + 16);
    os_log_t v760 = v24 + 59;
  }
  unint64_t v26 = 0x26AB22000uLL;
  if (!gNRPacketLoggingEnabled) {
    goto LABEL_13;
  }
  os_log_t v459 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
  os_log_t v460 = v459;
  if (sNRCopyLogToStdErr)
  {

LABEL_484:
    os_log_t v462 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v462, 1, (uint64_t)"%s%.30s:%-4d start LtN fast path outer loop", v463, v464, v465, v466, v467, (uint64_t)"");

    unint64_t v26 = 0x26AB22000;
    goto LABEL_13;
  }
  BOOL v461 = os_log_type_enabled(v459, OS_LOG_TYPE_INFO);

  unint64_t v26 = 0x26AB22000;
  if (v461) {
    goto LABEL_484;
  }
LABEL_13:
  uint64_t next_slot = 0;
  os_log_t v772 = 0;
  unint64_t v27 = 0;
  uint64_t v765 = 0;
  uint64_t v762 = (_OWORD *)(v11 + 672);
  uint64_t v763 = (_OWORD *)(v11 + 688);
  uint64_t v769 = 0;
  int v770 = (char *)&v785 + 8;
  char v6 = 1;
  uint64_t v776 = v11;
  v777 = a3;
  unint64_t v778 = a4;
  while (1)
  {
    if (!*(unsigned char *)(v26 + 1313)) {
      goto LABEL_15;
    }
    os_log_t v102 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    os_log_t v103 = v102;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v110 = os_log_type_enabled(v102, OS_LOG_TYPE_INFO);

      unint64_t v26 = 0x26AB22000;
      if (!v110) {
        goto LABEL_15;
      }
    }
    os_log_t v111 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v111, 1, (uint64_t)"%s%.30s:%-4d start LtN fast path inner loop", v112, v113, v114, v115, v116, (uint64_t)"");

    unint64_t v26 = 0x26AB22000;
LABEL_15:
    if (a4 == 0 || (v6 & 1) == 0) {
      goto LABEL_412;
    }
    if (v27 && v27 >= a4)
    {
      char v6 = 1;
LABEL_412:
      if (v27 < a4)
      {
        int v403 = 0;
        if (*(unsigned char *)(v26 + 1313)) {
          goto LABEL_436;
        }
        goto LABEL_440;
      }
      if (v27 != a4)
      {
        -[NRBluetoothPacketParser handleInternalError:](v11, @"curLinkInputSlotPartialBytesAlreadyRead != linkInputBufferLength (%zu != %zu)", v12, v13, v14, v15, v16, v17, v27);
        goto LABEL_453;
      }
      if (*(unsigned char *)(v26 + 1313))
      {
        os_log_t v639 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        os_log_t v640 = v639;
        if (sNRCopyLogToStdErr)
        {

          uint64_t v11 = v776;
          a4 = v778;
        }
        else
        {
          BOOL v696 = os_log_type_enabled(v639, OS_LOG_TYPE_INFO);

          uint64_t v11 = v776;
          a4 = v778;
          unint64_t v26 = 0x26AB22000;
          if (!v696) {
            goto LABEL_418;
          }
        }
        os_log_t v697 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        _NRLogWithArgs((uint64_t)v697, 1, (uint64_t)"%s%.30s:%-4d read all of len=%zu alreadyRead=%zu nexusOutputAvailable=%d", v698, v699, v700, v701, v702, (uint64_t)"");

        unint64_t v26 = 0x26AB22000;
      }
LABEL_418:
      ((void (*)(uint64_t))v757)(v11);
      int v403 = 0;
      unint64_t v27 = a4;
      if (*(unsigned char *)(v26 + 1313)) {
        goto LABEL_436;
      }
      goto LABEL_440;
    }
    if (!v27 || !*(unsigned char *)(v26 + 1313))
    {
      if (!*(unsigned char *)(v26 + 1313)) {
        goto LABEL_21;
      }
      goto LABEL_153;
    }
    os_log_t v104 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    os_log_t v105 = v104;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v124 = os_log_type_enabled(v104, OS_LOG_TYPE_INFO);

      if (!v124) {
        goto LABEL_152;
      }
    }
    os_log_t v125 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v125, 1, (uint64_t)"%s%.30s:%-4d reusing existing len=%zu alreadyRead=%zu", v126, v127, v128, v129, v130, (uint64_t)"");

LABEL_152:
    unint64_t v26 = 0x26AB22000uLL;
    if (!gNRPacketLoggingEnabled) {
      goto LABEL_21;
    }
LABEL_153:
    os_log_t v131 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    os_log_t v132 = v131;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v133 = os_log_type_enabled(v131, OS_LOG_TYPE_INFO);

      unint64_t v26 = 0x26AB22000;
      if (!v133) {
        goto LABEL_21;
      }
    }
    os_log_t v134 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v134, 1, (uint64_t)"%s%.30s:%-4d Reading from buf=%p len=%zu alreadyRead=%zu handled=%u filledIn=%u", v135, v136, v137, v138, v139, (uint64_t)"");

    unint64_t v26 = 0x26AB22000;
LABEL_21:
    LODWORD(v28) = *(_DWORD *)(a2 + 16);
    uint64_t v29 = *(unsigned int *)(a2 + 20);
    if (v28 <= v29) {
      break;
    }
    unint64_t v30 = v18[v29];
    if (v18[v29])
    {
LABEL_40:
      int v49 = v29 + 2;
      if (v28 > (int)v29 + 2)
      {
        unsigned int v50 = bswap32(*(unsigned __int16 *)&v18[(v29 + 1)]);
        unsigned int v51 = BYTE2(v50);
        unsigned int v52 = HIBYTE(v50);
        if (!*(unsigned char *)(v26 + 1313))
        {
LABEL_42:
          BOOL v53 = 1;
          a4 = v778;
          goto LABEL_43;
        }
        LODWORD(v758) = BYTE2(v50);
        LODWORD(v764) = HIBYTE(v50);
        os_log_t v117 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        os_log_t v118 = v117;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v53 = 1;
          BOOL v156 = os_log_type_enabled(v117, OS_LOG_TYPE_INFO);

          if (!v156)
          {
            a4 = v778;
            goto LABEL_360;
          }
        }
        os_log_t v157 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        StringFromNRTLVType = createStringFromNRTLVType(v30);
        BOOL v53 = 1;
        _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o1 %@ len=%u handled=%u filledIn=%u", v159, v160, v161, v162, v163, (uint64_t)"");
        goto LABEL_358;
      }
      int v61 = v29 + 1;
      if (v28 != v49)
      {
        if (v28 == v61) {
          unint64_t v67 = v27;
        }
        else {
          unint64_t v67 = v27 + 1;
        }
        if (v67 + 2 < a4)
        {
          unsigned int v68 = bswap32(*(unsigned __int16 *)((char *)&a3->isa + v67));
          unsigned int v51 = BYTE2(v68);
          unsigned int v52 = HIBYTE(v68);
          if (!*(unsigned char *)(v26 + 1313)) {
            goto LABEL_42;
          }
          LODWORD(v758) = BYTE2(v68);
          LODWORD(v764) = HIBYTE(v68);
          os_log_t v69 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          os_log_t v70 = v69;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v53 = 1;
            BOOL v303 = os_log_type_enabled(v69, OS_LOG_TYPE_INFO);

            if (!v303) {
              goto LABEL_382;
            }
          }
          uint64_t v11 = v776;
          os_log_t v157 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          StringFromNRTLVType = createStringFromNRTLVType(v30);
          a4 = v778;
          BOOL v53 = 1;
          _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o4 %@ len=%u handled=%u filledIn=%u slotLen=%zu", v304, v305, v306, v307, v308, (uint64_t)"");
LABEL_359:

          goto LABEL_360;
        }
        if (!*(unsigned char *)(v26 + 1313))
        {
          BOOL v53 = 0;
          unsigned int v51 = 0;
          unsigned int v52 = 0;
          goto LABEL_43;
        }
        os_log_t v184 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        os_log_t v185 = v184;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v53 = os_log_type_enabled(v184, OS_LOG_TYPE_INFO);

          if (!v53)
          {
            LODWORD(v764) = 0;
            goto LABEL_381;
          }
        }
        uint64_t v11 = v776;
        os_log_t v157 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        StringFromNRTLVType = createStringFromNRTLVType(v30);
        _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o5 %@", v320, v321, v322, v323, v324, (uint64_t)"");
        LODWORD(v764) = 0;
        goto LABEL_357;
      }
      unsigned int v52 = v18[v61];
      if (a4 <= v27)
      {
        if (!*(unsigned char *)(v26 + 1313))
        {
          BOOL v53 = 0;
          unsigned int v51 = 0;
          goto LABEL_43;
        }
        LODWORD(v764) = v18[v61];
        os_log_t v182 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        os_log_t v183 = v182;
        if (sNRCopyLogToStdErr)
        {

LABEL_354:
          uint64_t v11 = v776;
          os_log_t v157 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          StringFromNRTLVType = createStringFromNRTLVType(v30);
          _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o3 %@", v315, v316, v317, v318, v319, (uint64_t)"");
LABEL_357:
          LODWORD(v758) = 0;
          BOOL v53 = 0;
LABEL_358:
          a4 = v778;
          goto LABEL_359;
        }
        BOOL v53 = os_log_type_enabled(v182, OS_LOG_TYPE_INFO);

        if (v53) {
          goto LABEL_354;
        }
LABEL_381:
        LODWORD(v758) = 0;
        goto LABEL_382;
      }
      unsigned int v51 = *((unsigned __int8 *)&a3->isa + v27);
      if (!*(unsigned char *)(v26 + 1313))
      {
        BOOL v53 = 1;
        goto LABEL_43;
      }
      LODWORD(v758) = *((unsigned __int8 *)&a3->isa + v27);
      LODWORD(v764) = v52;
      os_log_t v180 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      os_log_t v181 = v180;
      if (sNRCopyLogToStdErr)
      {

LABEL_352:
        uint64_t v11 = v776;
        os_log_t v157 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        StringFromNRTLVType = createStringFromNRTLVType(v30);
        a4 = v778;
        BOOL v53 = 1;
        _NRLogWithArgs((uint64_t)v157, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV o2 %@ len=%u handled=%u filledIn=%u slotLen=%zu alreadyRead=%zu", v310, v311, v312, v313, v314, (uint64_t)"");
        goto LABEL_359;
      }
      BOOL v53 = 1;
      BOOL v309 = os_log_type_enabled(v180, OS_LOG_TYPE_INFO);

      if (v309) {
        goto LABEL_352;
      }
LABEL_382:
      uint64_t v11 = v776;
      a4 = v778;
LABEL_360:
      if (gNRPacketLoggingEnabled)
      {
        os_log_t v325 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        os_log_t v326 = v325;
        if (sNRCopyLogToStdErr)
        {

LABEL_364:
          os_log_t v328 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          uint64_t v329 = createStringFromNRTLVType(v30);
          unsigned int v330 = v758;
          _NRLogWithArgs((uint64_t)v328, 1, (uint64_t)"%s%.30s:%-4d Looking into incoming TLV %@ len=%u%s", v331, v332, v333, v334, v335, (uint64_t)"");

          unsigned int v51 = v330;
          unsigned int v52 = v764;
          unint64_t v26 = 0x26AB22000;
          goto LABEL_43;
        }
        BOOL v327 = os_log_type_enabled(v325, OS_LOG_TYPE_INFO);

        if (v327) {
          goto LABEL_364;
        }
      }
      unint64_t v26 = 0x26AB22000;
      unsigned int v52 = v764;
      unsigned int v51 = v758;
LABEL_43:
      long long v799 = 0u;
      long long v800 = 0u;
      long long v797 = 0u;
      long long v798 = 0u;
      long long v795 = 0u;
      long long v796 = 0u;
      long long v793 = 0u;
      long long v794 = 0u;
      long long v791 = 0u;
      long long v792 = 0u;
      long long v789 = 0u;
      long long v790 = 0u;
      long long v787 = 0u;
      long long v788 = 0u;
      long long v785 = 0u;
      long long v786 = 0u;
      uint64_t v54 = *(unsigned int *)(a2 + 16);
      uint64_t v55 = (uint64_t *)*(unsigned int *)(a2 + 20);
      if (v54 <= v55)
      {
        uint64_t v58 = 0;
        unsigned int v57 = 0;
        int v59 = a4 - v27;
        if (a4 <= v27) {
          goto LABEL_50;
        }
        goto LABEL_57;
      }
      *(void *)&long long v785 = (char *)v55 + (void)v18;
      uint64_t v56 = v51 | (v52 << 8);
      if (v56 + 5 >= (unint64_t)(v54 - v55)) {
        unsigned int v57 = v54 - v55;
      }
      else {
        unsigned int v57 = v56 + 5;
      }
      if (!v57)
      {
        -[NRBluetoothPacketParser handleInternalError:](v776, @"lrbIOVecLen=0 tlvLen=%u filledInLinkReadBufferBytes=%u handledLinkReadBufferBytes=%u", v12, v13, v14, v15, v16, v17, v51 | (v52 << 8));
        goto LABEL_424;
      }
      DWORD2(v785) = v57;
      if (!*(unsigned char *)(v26 + 1313))
      {
        uint64_t v58 = 1;
        int v59 = a4 - v27;
        if (a4 <= v27) {
          goto LABEL_50;
        }
        goto LABEL_57;
      }
      LODWORD(v758) = v51;
      LODWORD(v764) = v52;
      PacketString = v55;
      uint64_t v756 = v54;
      os_log_t v119 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
      os_log_t v120 = v119;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        uint64_t v58 = 1;
        LODWORD(v771) = os_log_type_enabled(v119, OS_LOG_TYPE_INFO);

        if (!v771) {
          goto LABEL_167;
        }
      }
      uint64_t v58 = 1;
      os_log_t v164 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
      _NRLogWithArgs((uint64_t)v164, 1, (uint64_t)"%s%.30s:%-4d Placing linkReadBuffer handled=%u filledIn=%u in ioVec[%u] buf=%p len=%u", v165, v166, v167, v168, v169, (uint64_t)"");

LABEL_167:
      uint64_t v54 = v756;
      uint64_t v55 = PacketString;
      unsigned int v52 = v764;
      unsigned int v51 = v758;
      int v59 = a4 - v27;
      if (a4 <= v27)
      {
LABEL_50:
        if (!v53)
        {
          LODWORD(v60) = v58;
          unint64_t v26 = 0x26AB22000;
          goto LABEL_115;
        }
        goto LABEL_66;
      }
LABEL_57:
      if (v53 && (v51 | ((unint64_t)v52 << 8)) + 5 <= v57)
      {
LABEL_66:
        int v66 = 0;
        uint64_t v60 = v58;
LABEL_99:
        unint64_t v26 = 0x26AB22000uLL;
LABEL_100:
        unsigned int v80 = v30 - 100;
        if ((v30 - 100) >= 6 && (v30 - 2) >= 4)
        {
          if (v30 != 1)
          {
            uint64_t v82 = v51 | (v52 << 8);
            goto LABEL_104;
          }
          unsigned int v81 = 255;
        }
        else
        {
          unsigned int v81 = 2000;
        }
        uint64_t v82 = v51 | (v52 << 8);
        if (v82 > v81)
        {
          unint64_t v755 = v51 | (v52 << 8);
          unsigned int v404 = v60;
          if (*(unsigned char *)(a2 + 26) != 3)
          {
            os_log_t v409 = createStringFromNRTLVType(v30);
            IOVecStringWithContents = createIOVecStringWithContents((uint64_t)&v785, v404);
            -[NRBluetoothPacketParser handleInternalError:](v776, @"Received invalid TLV len %u for %@ (max=%u) %@", v411, v412, v413, v414, v415, v416, v755);
            goto LABEL_570;
          }
          uint64_t v11 = v776;
          os_log_t v405 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v406 = v405;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            LODWORD(v777) = os_log_type_enabled(v405, OS_LOG_TYPE_INFO);

            if (!v777) {
              goto LABEL_434;
            }
          }
          os_log_t v425 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          v777 = createStringFromNRTLVType(v30);
          v745 = createIOVecStringWithContents((uint64_t)&v785, v404);
          v431 = v777;
          _NRLogWithArgs((uint64_t)v425, 1, (uint64_t)"%s%.30s:%-4d Received invalid TLV len %u for %@ (max=%u) %@", v432, v433, v434, v435, v436, (uint64_t)"");

LABEL_433:
LABEL_434:
          int v403 = 1;
          char v6 = 1;
          goto LABEL_435;
        }
LABEL_104:
        if ((unint64_t)v82 + 5 > v57) {
          goto LABEL_115;
        }
        int v83 = *(unsigned __int8 *)(v26 + 1313);
        size_t v758 = v82;
        LODWORD(v764) = v30 - 100;
        LODWORD(v771) = v60;
        PacketString = v55;
        unint64_t v755 = v82;
        if (v83)
        {
          uint64_t v756 = v54;
          os_log_t v122 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v123 = v122;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v186 = os_log_type_enabled(v122, OS_LOG_TYPE_INFO);

            if (!v186) {
              goto LABEL_183;
            }
          }
          uint64_t v754 = (uint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v187 = createStringFromNRTLVType(v30);
          IOVecString = createIOVecString((uint64_t)&v785, v771);
          _NRLogWithArgs(v754, 1, (uint64_t)"%s%.30s:%-4d Ready to handle %@ len %u in %@ ioVecContentLen=%u alreadyRead=%zu", v188, v189, v190, v191, v192, (uint64_t)"");

LABEL_183:
          int v83 = gNRPacketLoggingEnabled;
          uint64_t v60 = v771;
          LODWORD(v82) = v755;
          uint64_t v54 = v756;
          LODWORD(v55) = PacketString;
          unsigned int v80 = v764;
          if (v66) {
            goto LABEL_107;
          }
          goto LABEL_184;
        }
        if (v66)
        {
LABEL_107:
          if (!v83) {
            goto LABEL_185;
          }
          int v84 = (int)v55;
          uint64_t v756 = v54;
          uint64_t v85 = v60;
          os_log_t v86 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v87 = v86;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            LODWORD(v754) = os_log_type_enabled(v86, OS_LOG_TYPE_INFO);

            uint64_t v60 = v85;
            LODWORD(v82) = v755;
            uint64_t v54 = v756;
            LODWORD(v55) = v84;
            unsigned int v80 = v764;
            if (!v754) {
              goto LABEL_185;
            }
          }
          os_log_t v270 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          _NRLogWithArgs((uint64_t)v270, 1, (uint64_t)"%s%.30s:%-4d Marking as completed", v271, v272, v273, v274, v275, (uint64_t)"");
          goto LABEL_341;
        }
LABEL_184:
        if (!v83) {
          goto LABEL_185;
        }
        int v84 = (int)v55;
        uint64_t v756 = v54;
        uint64_t v85 = v60;
        os_log_t v248 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        os_log_t v249 = v248;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          LODWORD(v754) = os_log_type_enabled(v248, OS_LOG_TYPE_INFO);

          uint64_t v60 = v85;
          LODWORD(v82) = v755;
          uint64_t v54 = v756;
          LODWORD(v55) = v84;
          unsigned int v80 = v764;
          if (!v754) {
            goto LABEL_185;
          }
        }
        os_log_t v270 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        _NRLogWithArgs((uint64_t)v270, 1, (uint64_t)"%s%.30s:%-4d Not marking as completed (all in linkReadBuffer)", v276, v277, v278, v279, v280, (uint64_t)"");
LABEL_341:

        uint64_t v60 = v85;
        LODWORD(v82) = v755;
        uint64_t v54 = v756;
        LODWORD(v55) = v84;
        unsigned int v80 = v764;
LABEL_185:
        if ((char)v30 < 100)
        {
          uint64_t v756 = v54;
          if (!v60)
          {
            os_log_t v477 = nrCopyLogObj_518();
            os_log_t v478 = v477;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v479 = os_log_type_enabled(v477, OS_LOG_TYPE_ERROR);

              if (!v479)
              {
LABEL_513:
                _os_log_pack_size();
                MEMORY[0x270FA5388]();
                __error();
                uint64_t v510 = _os_log_pack_fill();
                *(_DWORD *)uint64_t v510 = 136446210;
                os_log_t v511 = "nrChecksumIOVecInner";
                goto LABEL_587;
              }
            }
            id v512 = nrCopyLogObj_518();
            _NRLogWithArgs((uint64_t)v512, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v513, v514, v515, v516, v517, (uint64_t)"");

            goto LABEL_513;
          }
          uint64_t v754 = (uint64_t)&v751;
          unsigned int v196 = v82 + 3;
          unsigned int v197 = DWORD2(v785);
          if (DWORD2(v785) >= (v82 + 3)) {
            uint64_t v198 = v196;
          }
          else {
            uint64_t v198 = DWORD2(v785);
          }
          if (!v198)
          {
LABEL_487:
            unsigned __int16 v470 = nrCopyLogObj_518();
            int v471 = v470;
            v472 = "nrChecksumUpdate";
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v473 = os_log_type_enabled(v470, OS_LOG_TYPE_ERROR);

              if (!v473) {
                goto LABEL_519;
              }
            }
            id v489 = nrCopyLogObj_518();
            _NRLogWithArgs((uint64_t)v489, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen > 0", v490, v491, v492, v493, v494, (uint64_t)"");

            goto LABEL_519;
          }
          uint64_t v12 = MEMORY[0x2105126A0](v785, v198, 0);
          if (v196 <= v197 && v198 < DWORD2(v785))
          {
            unsigned int v199 = 0;
            unsigned int v200 = v198;
            goto LABEL_197;
          }
          if (v771 == 1)
          {
            unsigned int v200 = v198;
            a4 = v778;
          }
          else
          {
            if (v196 <= v197)
            {
              unsigned int v200 = 0;
              unsigned int v199 = 1;
LABEL_197:
              a4 = v778;
              if (v198 != v196) {
                goto LABEL_499;
              }
              goto LABEL_208;
            }
            if (DWORD2(v786) >= v196 - v198) {
              uint64_t v211 = v196 - v198;
            }
            else {
              uint64_t v211 = DWORD2(v786);
            }
            a4 = v778;
            if (!v211) {
              goto LABEL_487;
            }
            uint64_t v753 = &v751;
            if (v198)
            {
              LOWORD(v779) = 0;
              uint64_t v752 = v786;
              LOWORD(v779) = *(unsigned __int8 *)v786 << 8;
              uint64_t v12 = MEMORY[0x2105126A0](&v779, 2, v12);
              if (v211 >= 2) {
                uint64_t v12 = MEMORY[0x2105126A0](v752 + 1, (v211 - 1), v12);
              }
              a4 = v778;
            }
            else
            {
              uint64_t v12 = MEMORY[0x2105126A0](v786, v211, v12);
            }
            LODWORD(v198) = v211 + v198;
            unsigned int v200 = v211;
            if (v198 >= v196 && v211 < DWORD2(v786))
            {
              unsigned int v199 = 1;
              if (v198 != v196)
              {
LABEL_499:
                uint64_t v486 = nrCopyLogObj_518();
                uint64_t v487 = v486;
                v472 = "nrChecksumIOVecInner";
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v488 = os_log_type_enabled(v486, OS_LOG_TYPE_ERROR);

                  if (!v488)
                  {
LABEL_519:
                    _os_log_pack_size();
                    MEMORY[0x270FA5388]();
                    __error();
                    uint64_t v533 = _os_log_pack_fill();
                    *(_DWORD *)uint64_t v533 = 136446210;
                    *(void *)(v533 + 4) = v472;
                    goto LABEL_595;
                  }
                }
                id v527 = nrCopyLogObj_518();
                _NRLogWithArgs((uint64_t)v527, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: computedBytes == writtenLength", v528, v529, v530, v531, v532, (uint64_t)"");

                goto LABEL_519;
              }
LABEL_208:
              int v204 = ~(_BYTE)v12;
              int v205 = ((unsigned __int16)~(_WORD)v12 >> 8);
              uint64_t v206 = &v785 + v199;
              unsigned int v207 = *((_DWORD *)v206 + 2);
              if (v207 >= v200 + 2)
              {
                uint64_t v208 = (unsigned __int8 *)(*(void *)v206 + v200);
                uint64_t v60 = v771;
                LODWORD(v54) = v756;
                LODWORD(v55) = PacketString;
                unsigned int v80 = v764;
                if (*v208 != v204 || v208[1] != v205)
                {
                  v777 = (__CFString *)~v12;
                  uint64_t v539 = nrCopyLogObj_518();
                  if (sNRCopyLogToStdErr)
                  {

                    goto LABEL_560;
                  }
                  uint64_t v597 = v539;
                  LODWORD(next_slot) = os_log_type_enabled(v539, OS_LOG_TYPE_ERROR);

                  if (next_slot)
                  {
LABEL_560:
                    id v598 = nrCopyLogObj_518();
                    uint64_t v604 = "%s%.30s:%-4d checksum failed same IOVec received 0x%02x%02x != computed 0x%02x%02x";
                    goto LABEL_563;
                  }
                  goto LABEL_564;
                }
              }
              else
              {
                LODWORD(v54) = v756;
                LODWORD(v55) = PacketString;
                unsigned int v80 = v764;
                if (v207 < v200 + 1)
                {
                  int v534 = v199;
                  int v535 = v200;
                  uint64_t v536 = nrCopyLogObj_518();
                  uint64_t v537 = v536;
                  if (sNRCopyLogToStdErr)
                  {
                  }
                  else
                  {
                    BOOL v538 = os_log_type_enabled(v536, OS_LOG_TYPE_ERROR);

                    if (!v538) {
                      goto LABEL_554;
                    }
                  }
                  id v569 = nrCopyLogObj_518();
                  unsigned int v740 = createIOVecString((uint64_t)&v785, v771);
                  _NRLogWithArgs((uint64_t)v569, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex].len >= bytesToCheckThisIOVec + 1; %@, iovecIndex=%u bytesToCheckThisIOVec=%u",
                    v570,
                    v571,
                    v572,
                    v573,
                    v574,
                    (uint64_t)"");

LABEL_554:
                  _os_log_pack_size();
                  MEMORY[0x270FA5388]();
                  __error();
                  uint64_t v587 = _os_log_pack_fill();
                  uint64_t v588 = createIOVecString((uint64_t)&v785, v771);
                  __os_log_helper_1_2_4_8_34_8_64_4_0_4_0(v587, (uint64_t)"nrChecksumIOVecInner", (uint64_t)v588, v534, v535);
                  goto LABEL_555;
                }
                uint64_t v60 = v771;
                if (v199 + 1 >= v771)
                {
                  int v534 = v199;
                  int v535 = v200;
                  os_log_t v540 = nrCopyLogObj_518();
                  os_log_t v541 = v540;
                  if (sNRCopyLogToStdErr)
                  {
                  }
                  else
                  {
                    BOOL v542 = os_log_type_enabled(v540, OS_LOG_TYPE_ERROR);

                    if (!v542) {
                      goto LABEL_554;
                    }
                  }
                  id v575 = nrCopyLogObj_518();
                  os_log_t v741 = createIOVecString((uint64_t)&v785, v771);
                  _NRLogWithArgs((uint64_t)v575, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecIndex + 1 < numIOVecs; %@, iovecIndex=%u byte"
                             "sToCheckThisIOVec=%u",
                    v576,
                    v577,
                    v578,
                    v579,
                    v580,
                    (uint64_t)"");

                  goto LABEL_554;
                }
                if (!DWORD2(v786))
                {
                  int v534 = v199;
                  int v535 = v200;
                  os_log_t v543 = nrCopyLogObj_518();
                  os_log_t v544 = v543;
                  if (sNRCopyLogToStdErr)
                  {
                  }
                  else
                  {
                    BOOL v545 = os_log_type_enabled(v543, OS_LOG_TYPE_ERROR);

                    if (!v545) {
                      goto LABEL_554;
                    }
                  }
                  id v581 = nrCopyLogObj_518();
                  os_log_t v742 = createIOVecString((uint64_t)&v785, v771);
                  _NRLogWithArgs((uint64_t)v581, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex + 1].len >= 1; %@, iovecIndex=%u"
                             " bytesToCheckThisIOVec=%u",
                    v582,
                    v583,
                    v584,
                    v585,
                    v586,
                    (uint64_t)"");

                  goto LABEL_554;
                }
                if (*(unsigned __int8 *)(*(void *)v206 + v200) != v204 || *(unsigned __int8 *)v786 != v205)
                {
                  v777 = (__CFString *)~v12;
                  os_log_t v546 = nrCopyLogObj_518();
                  if (sNRCopyLogToStdErr)
                  {
                  }
                  else
                  {
                    uint64_t v605 = v546;
                    LODWORD(next_slot) = os_log_type_enabled(v546, OS_LOG_TYPE_ERROR);

                    if (!next_slot) {
                      goto LABEL_564;
                    }
                  }
                  id v598 = nrCopyLogObj_518();
                  uint64_t v604 = "%s%.30s:%-4d checksum failed disjoint IOVec received 0x%02x%02x != computed 0x%02x%02x";
LABEL_563:
                  uint64_t v606 = v598;
                  _NRLogWithArgs((uint64_t)v598, 16, (uint64_t)v604, v599, v600, v601, v602, v603, (uint64_t)"");

LABEL_564:
                  a4 = v778;
                  LODWORD(v60) = v771;
LABEL_565:
                  unsigned int v607 = v60;
                  os_log_t v409 = @"Invalid";
                  switch(*(unsigned char *)(a2 + 26))
                  {
                    case 0:
                      goto LABEL_569;
                    case 1:
                      os_log_t v409 = @"Medium";
                      goto LABEL_569;
                    case 2:
                      os_log_t v409 = @"High";
                      goto LABEL_569;
                    case 3:
                      os_log_t v614 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                      os_log_t v615 = v614;
                      if (sNRCopyLogToStdErr)
                      {
                      }
                      else
                      {
                        BOOL v616 = os_log_type_enabled(v614, OS_LOG_TYPE_INFO);

                        if (!v616)
                        {
                          uint64_t v11 = v776;
                          goto LABEL_434;
                        }
                      }
                      uint64_t v617 = v776;
                      os_log_t v425 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                      uint64_t v11 = v617;
                      _NRLogWithArgs((uint64_t)v425, 1, (uint64_t)"%s%.30s:%-4d Invalid checksum detected in Isoch loop len %u filledIn=%u handled=%u ioVecContentLen=%u alreadyRead=%zu ", v618, v619, v620, v621, v622, (uint64_t)"");
                      goto LABEL_433;
                    default:
                      os_log_t v409 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", *(unsigned __int8 *)(a2 + 26));
LABEL_569:
                      IOVecStringWithContents = createStringFromNRTLVType(v30);
                      os_log_t v743 = createIOVecString((uint64_t)&v785, v607);
                      -[NRBluetoothPacketParser handleInternalError:](v776, @"Invalid checksum detected in loop (%@) on read type %@ len %u filledIn=%u handled=%u in %@ ioVecContentLen=%u alreadyRead=%zu ", v608, v609, v610, v611, v612, v613, (uint64_t)v409);

                      goto LABEL_570;
                  }
                }
              }
              goto LABEL_240;
            }
          }
          unsigned int v199 = v771;
          if (v198 != v196) {
            goto LABEL_499;
          }
          goto LABEL_208;
        }
        LOWORD(v779) = 0;
        if (!v60)
        {
          unsigned int v474 = nrCopyLogObj_518();
          unsigned int v475 = v474;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v476 = os_log_type_enabled(v474, OS_LOG_TYPE_ERROR);

            if (!v476) {
              goto LABEL_510;
            }
          }
          id v504 = nrCopyLogObj_518();
          _NRLogWithArgs((uint64_t)v504, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v505, v506, v507, v508, v509, (uint64_t)"");

LABEL_510:
          _os_log_pack_size();
          MEMORY[0x270FA5388]();
          __error();
          uint64_t v510 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v510 = 136446210;
          os_log_t v511 = "nrWriteIOVecToBuffer";
LABEL_587:
          *(void *)(v510 + 4) = v511;
          goto LABEL_595;
        }
        unsigned int v193 = v82 + 3;
        unsigned int v194 = v82 + 3 - DWORD2(v785);
        if ((v82 + 3) > DWORD2(v785))
        {
          uint64_t v195 = 0;
LABEL_219:
          if (v60 != 1 && (!v194 || DWORD2(v786) > v194))
          {
            if (DWORD2(v786) - v194 >= 2 - (int)v195) {
              size_t v209 = (2 - v195);
            }
            else {
              size_t v209 = DWORD2(v786) - v194;
            }
            uint64_t v756 = v54;
            uint64_t v754 = v195;
            unsigned int v210 = v193;
            memcpy((char *)&v779 + v195, (const void *)(v786 + v194), v209);
            unsigned int v193 = v210;
            unsigned int v80 = v764;
            LODWORD(v55) = PacketString;
            LODWORD(v54) = v756;
            uint64_t v60 = v771;
            LODWORD(v195) = v209 + v754;
          }
          goto LABEL_238;
        }
        if (v193 >= DWORD2(v785))
        {
          uint64_t v195 = 0;
          unsigned int v194 = 0;
          goto LABEL_219;
        }
        uint64_t v756 = v54;
        unsigned int v201 = DWORD2(v785) - v193;
        if (DWORD2(v785) - v193 >= 2) {
          size_t v202 = 2;
        }
        else {
          size_t v202 = v201;
        }
        uint64_t v754 = (v82 + 3);
        size_t v203 = v202;
        memcpy(&v779, (const void *)(v785 + v193), v202);
        if (v201 <= 1)
        {
          unsigned int v194 = 0;
          uint64_t v60 = v771;
          uint64_t v54 = v756;
          LODWORD(v55) = PacketString;
          unsigned int v80 = v764;
          unsigned int v193 = v754;
          uint64_t v195 = v203;
          goto LABEL_219;
        }
        uint64_t v60 = v771;
        LODWORD(v54) = v756;
        LODWORD(v55) = PacketString;
        unsigned int v80 = v764;
        unsigned int v193 = v754;
        LODWORD(v195) = v203;
LABEL_238:
        if (v195 != 2)
        {
          int v480 = v195;
          int v481 = v193;
          unsigned int v482 = v60;
          os_log_t v483 = nrCopyLogObj_518();
          uint64_t v484 = v483;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v485 = os_log_type_enabled(v483, OS_LOG_TYPE_ERROR);

            if (!v485)
            {
LABEL_516:
              _os_log_pack_size();
              MEMORY[0x270FA5388]();
              __error();
              uint64_t v524 = _os_log_pack_fill();
              os_log_t v525 = createIOVecString((uint64_t)&v785, v482);
              __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v524, (uint64_t)"nrWriteIOVecToBuffer", v480, 2, v481, (uint64_t)v525);

              id v526 = nrCopyLogObj_518();
              _NRLogAbortWithPack(v526);
            }
          }
          id v518 = nrCopyLogObj_518();
          v746 = createIOVecString((uint64_t)&v785, v482);
          _NRLogWithArgs((uint64_t)v518, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%u), "
                     "offset: %u, ioVec: %@",
            v519,
            v520,
            v521,
            v522,
            v523,
            (uint64_t)"");

          goto LABEL_516;
        }
        unsigned int v212 = bswap32(v758);
        if ((unsigned __int16)v779 != (unsigned __int16)(((v30 >> 4) ^ BYTE2(v212)) | (unsigned __int16)(((unsigned __int16)(16 * v30) ^ HIBYTE(v212)) << 8))) {
          goto LABEL_565;
        }
LABEL_240:
        long long v781 = 0u;
        long long v782 = 0u;
        long long v779 = 0u;
        long long v780 = 0u;
        uint64_t v11 = v776;
        unint64_t v26 = 0x26AB22000uLL;
        a3 = v777;
        if (!v775) {
          goto LABEL_244;
        }
        unsigned int v213 = v54;
        uint64_t next_slot = os_channel_get_next_slot();
        if (next_slot)
        {
          if (gNRPacketLoggingEnabled)
          {
            os_log_t v250 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
            os_log_t v251 = v250;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v336 = os_log_type_enabled(v250, OS_LOG_TYPE_INFO);

              if (!v336)
              {
                uint64_t v11 = v776;
                goto LABEL_368;
              }
            }
            uint64_t v11 = v776;
            os_log_t v337 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            _NRLogWithArgs((uint64_t)v337, 1, (uint64_t)"%s%.30s:%-4d Using new nexusOutputSlot=%p", v338, v339, v340, v341, v342, (uint64_t)"");

LABEL_368:
            a3 = v777;
            a4 = v778;
            unint64_t v26 = 0x26AB22000;
          }
          uint64_t v60 = v771;
          LODWORD(v54) = v213;
          LODWORD(v55) = PacketString;
          unsigned int v80 = v764;
LABEL_244:
          if (v54 > v55)
          {
            if (!*(unsigned char *)(v26 + 1313))
            {
LABEL_246:
              *(_DWORD *)(a2 + 20) += DWORD2(v785);
              goto LABEL_247;
            }
            uint64_t v252 = v60;
            os_log_t v253 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
            os_log_t v254 = v253;
            if (sNRCopyLogToStdErr)
            {

              uint64_t v11 = v776;
              a3 = v777;
              a4 = v778;
            }
            else
            {
              LODWORD(PacketString) = os_log_type_enabled(v253, OS_LOG_TYPE_INFO);

              uint64_t v11 = v776;
              a3 = v777;
              a4 = v778;
              unint64_t v26 = 0x26AB22000;
              uint64_t v60 = v252;
              unsigned int v80 = v764;
              if (!PacketString) {
                goto LABEL_246;
              }
            }
            os_log_t v343 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
            _NRLogWithArgs((uint64_t)v343, 1, (uint64_t)"%s%.30s:%-4d Advancing linkReadBuffer handled by %u handled=%u filledIn=%u", v344, v345, v346, v347, v348, (uint64_t)"");

            unsigned int v80 = v764;
            uint64_t v60 = v252;
            unint64_t v26 = 0x26AB22000;
            goto LABEL_246;
          }
LABEL_247:
          if ((int)v30 > 99)
          {
            if (v80 >= 6) {
              goto LABEL_317;
            }
            goto LABEL_257;
          }
          if ((v30 - 2) < 2)
          {
LABEL_257:
            if (next_slot)
            {
              uint64_t v220 = v780;
              os_log_t v771 = (os_log_t)WORD1(v779);
              uint64_t v221 = nrTLVToPacket((uint64_t)&v785, v60, (_OWORD *)v30, v758, v780, WORD1(v779), v763, v762);
              int v222 = *(unsigned __int8 *)(v26 + 1313);
              if (v221)
              {
                uint64_t v223 = v221;
                if (!v222)
                {
LABEL_260:
                  uint64_t v783 = 0;
                  uint64_t v784 = 0;
                  if (v766)
                  {
                    LOBYTE(v783) = 1;
                    WORD1(v779) = v223;
                    if (os_channel_slot_get_packet()) {
                      os_packet_set_flow_uuid();
                    }
                    os_channel_set_slot_properties();
                    if (isPacketValidIPv6((unsigned char *)v220, v223) && isNextHeaderValidESP(v220, v223)) {
                      uint64_t v224 = bswap32(*(_DWORD *)(v220 + 44));
                    }
                    else {
                      uint64_t v224 = 0;
                    }
                    if (isPacketValidIPv6((unsigned char *)v220, v223) && isNextHeaderValidESP(v220, v223)) {
                      uint64_t v240 = bswap32(*(_DWORD *)(v220 + 40));
                    }
                    else {
                      uint64_t v240 = 0;
                    }
                    -[NRBluetoothPacketParser handleIncomingWakePacket:spi:](v11, v224, v240);
                    os_log_t v239 = (os_log_t)next_slot;
                  }
                  else
                  {
                    WORD1(v779) = v223;
                    os_log_t v239 = (os_log_t)next_slot;
                    os_channel_slot_get_packet();
                    os_packet_clear_flow_uuid();
                    os_channel_set_slot_properties();
                  }
                  BOOL v766 = 0;
                  *(unsigned char *)(a2 + 27) &= ~4u;
                  *(unsigned char *)(v11 + 19) = 0;
                  ++*v760;
                  *uint64_t v759 = 1;
                  ++v769;
                  v765 += v223;
                  os_log_t v772 = v239;
LABEL_316:
                  unint64_t v26 = 0x26AB22000uLL;
LABEL_317:
                  if (!*(unsigned char *)(v26 + 1313)) {
                    goto LABEL_318;
                  }
LABEL_400:
                  os_log_t v395 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                  os_log_t v396 = v395;
                  if (sNRCopyLogToStdErr)
                  {

LABEL_403:
                    uint64_t v11 = v776;
                    os_log_t v360 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                    a4 = v778;
                    char v6 = 1;
                    _NRLogWithArgs((uint64_t)v360, 1, (uint64_t)"%s%.30s:%-4d end of LtN inner loop alreadyRead=%zu splen=%zu", v398, v399, v400, v401, v402, (uint64_t)"");
LABEL_404:

                    goto LABEL_405;
                  }
                  char v6 = 1;
                  BOOL v397 = os_log_type_enabled(v395, OS_LOG_TYPE_INFO);

                  if (v397) {
                    goto LABEL_403;
                  }
                  goto LABEL_406;
                }
                os_log_t v266 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                os_log_t v267 = v266;
                if (sNRCopyLogToStdErr)
                {

                  uint64_t v11 = v776;
                  a3 = v777;
                  a4 = v778;
                }
                else
                {
                  LODWORD(v772) = os_log_type_enabled(v266, OS_LOG_TYPE_INFO);

                  uint64_t v11 = v776;
                  a3 = v777;
                  a4 = v778;
                  if (!v772) {
                    goto LABEL_260;
                  }
                }
                os_log_t v772 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                uint64_t v764 = createStringFromNRTLVType(v30);
                PacketString = (uint64_t *)createPacketString((unsigned __int8 *)v220, v223);
                os_log_t v366 = v772;
                _NRLogWithArgs((uint64_t)v772, 1, (uint64_t)"%s%.30s:%-4d Reinjecting %@ packet len %u to nexusOutputSlot=%p buf=%p len=%u: %@, buflet: %d", v367, v368, v369, v370, v371, (uint64_t)"");

                goto LABEL_260;
              }
              if (*(unsigned char *)(v26 + 1313))
              {
                os_log_t v349 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                os_log_t v350 = v349;
                if (sNRCopyLogToStdErr)
                {

LABEL_393:
                  uint64_t v11 = v776;
                  os_log_t v373 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                  os_log_t v374 = createStringFromNRTLVType(v30);
                  _NRLogWithArgs((uint64_t)v373, 1, (uint64_t)"%s%.30s:%-4d failed to reinject %@ tlvLen=%u slotLen=%u", v383, v384, v385, v386, v387, (uint64_t)"");
LABEL_394:

                  goto LABEL_399;
                }
                BOOL v382 = os_log_type_enabled(v349, OS_LOG_TYPE_INFO);

                if (v382) {
                  goto LABEL_393;
                }
                goto LABEL_398;
              }
              char v6 = 1;
            }
            else
            {
              if (*(unsigned char *)(v26 + 1313))
              {
                os_log_t v268 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                os_log_t v269 = v268;
                if (sNRCopyLogToStdErr)
                {

LABEL_384:
                  uint64_t v11 = v776;
                  os_log_t v373 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                  os_log_t v374 = createStringFromNRTLVType(v30);
                  _NRLogWithArgs((uint64_t)v373, 1, (uint64_t)"%s%.30s:%-4d no curNexusOutputSlot, dropping %@ tlvLen=%u slotLen=%u", v375, v376, v377, v378, v379, (uint64_t)"");
                  goto LABEL_394;
                }
                BOOL v372 = os_log_type_enabled(v268, OS_LOG_TYPE_INFO);

                if (v372) {
                  goto LABEL_384;
                }
                goto LABEL_398;
              }
              uint64_t next_slot = 0;
              char v6 = 1;
            }
          }
          else
          {
            if (v30 != 1)
            {
              if (v30 != 4) {
                goto LABEL_317;
              }
              if (!v758)
              {
                id v246 = objc_alloc_init(MEMORY[0x263EFF8F8]);
LABEL_313:
                uint64_t v247 = v246;
                uint64_t v11 = v776;
                -[NRBluetoothPacketParser handleIncomingIKEData:linkPriority:](v776, v246, *(unsigned __int8 *)(a2 + 26));
                a3 = v777;
                if (v766) {
                  -[NRBluetoothPacketParser handleIncomingWakePacket:spi:](v11, 0, 0);
                }
                *(unsigned char *)(v11 + 19) = 0;
                *(unsigned char *)(a2 + 27) &= ~4u;

                BOOL v766 = 0;
                goto LABEL_316;
              }
              uint64_t v214 = (char *)malloc_type_malloc(v758, 0xA172743EuLL);
              if (v214)
              {
                uint64_t v215 = v214;
                int v216 = (int)v771;
                if (DWORD2(v785) > 2)
                {
                  unsigned int v241 = DWORD2(v785) - 3;
                  int v219 = v755;
                  if (DWORD2(v785) == 3)
                  {
                    LODWORD(v217) = 0;
                    unsigned int v218 = 0;
                    a4 = v778;
                  }
                  else
                  {
                    if (v241 >= v755) {
                      size_t v217 = v755;
                    }
                    else {
                      size_t v217 = v241;
                    }
                    unsigned int v242 = v755;
                    memcpy(v214, (const void *)(v785 + 3), v217);
                    int v219 = v242;
                    if (v241 >= v242)
                    {
                      a4 = v778;
LABEL_311:
                      if (v217 != v219)
                      {
                        int v665 = v219;
                        v666 = nrCopyLogObj_518();
                        v667 = v666;
                        if (sNRCopyLogToStdErr)
                        {
                        }
                        else
                        {
                          BOOL v668 = os_log_type_enabled(v666, OS_LOG_TYPE_ERROR);

                          if (!v668)
                          {
LABEL_609:
                            _os_log_pack_size();
                            MEMORY[0x270FA5388]();
                            __error();
                            uint64_t v689 = _os_log_pack_fill();
                            uint64_t v588 = createIOVecString((uint64_t)&v785, v771);
                            __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v689, (uint64_t)"nrWriteIOVecToBuffer", v217, v665, 3, (uint64_t)v588);
LABEL_555:

                            id v589 = nrCopyLogObj_518();
                            _NRLogAbortWithPack(v589);
                          }
                        }
                        id v683 = nrCopyLogObj_518();
                        BOOL v747 = createIOVecString((uint64_t)&v785, v771);
                        _NRLogWithArgs((uint64_t)v683, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) !="
                                   " length (%u), offset: %u, ioVec: %@",
                          v684,
                          v685,
                          v686,
                          v687,
                          v688,
                          (uint64_t)"");

                        goto LABEL_609;
                      }
                      id v245 = objc_alloc(MEMORY[0x263EFF8F8]);
                      id v246 = (id)[v245 initWithBytesNoCopy:v215 length:v758 freeWhenDone:1];
                      goto LABEL_313;
                    }
                    unsigned int v218 = 0;
                    a4 = v778;
                    int v216 = (int)v771;
                  }
                }
                else
                {
                  LODWORD(v217) = 0;
                  unsigned int v218 = 3 - DWORD2(v785);
                  int v219 = v755;
                }
                if (v216 != 1 && (!v218 || DWORD2(v786) > v218))
                {
                  PacketString = &v751;
                  int v243 = v219;
                  if (DWORD2(v786) - v218 >= v219 - (int)v217) {
                    size_t v244 = (v219 - v217);
                  }
                  else {
                    size_t v244 = DWORD2(v786) - v218;
                  }
                  memcpy(&v215[v217], (const void *)(v786 + v218), v244);
                  int v219 = v243;
                  LODWORD(v217) = v244 + v217;
                }
                goto LABEL_311;
              }
              v662 = nrCopyLogObj_518();
              v663 = v662;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v664 = os_log_type_enabled(v662, OS_LOG_TYPE_ERROR);

                if (!v664) {
                  goto LABEL_606;
                }
              }
              id v676 = nrCopyLogObj_518();
              _NRLogWithArgs((uint64_t)v676, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v677, v678, v679, v680, v681, (uint64_t)"");

LABEL_606:
              _os_log_pack_size();
              MEMORY[0x270FA5388]();
              __error();
              uint64_t v682 = _os_log_pack_fill();
              *(_DWORD *)uint64_t v682 = 136446466;
              *(void *)(v682 + 4) = "strict_malloc";
              *(_WORD *)(v682 + 12) = 2048;
              *(void *)(v682 + 14) = v758;
LABEL_595:
              id v661 = nrCopyLogObj_518();
              _NRLogAbortWithPack(v661);
            }
            if (*(unsigned char *)(v26 + 1313))
            {
              os_log_t v380 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
              os_log_t v381 = v380;
              if (sNRCopyLogToStdErr)
              {

LABEL_397:
                uint64_t v11 = v776;
                os_log_t v389 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                _NRLogWithArgs((uint64_t)v389, 1, (uint64_t)"%s%.30s:%-4d Handling PadN %u", v390, v391, v392, v393, v394, (uint64_t)"");

                goto LABEL_399;
              }
              BOOL v388 = os_log_type_enabled(v380, OS_LOG_TYPE_INFO);

              if (v388) {
                goto LABEL_397;
              }
LABEL_398:
              uint64_t v11 = v776;
LABEL_399:
              a3 = v777;
              a4 = v778;
              unint64_t v26 = 0x26AB22000uLL;
              if (gNRPacketLoggingEnabled) {
                goto LABEL_400;
              }
LABEL_318:
              char v6 = 1;
            }
            else
            {
              char v6 = 1;
            }
          }
        }
        else
        {
          ((void (*)(uint64_t))v761)(v11);
          if (!gNRPacketLoggingEnabled) {
            goto LABEL_267;
          }
          os_log_t v262 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v263 = v262;
          if (sNRCopyLogToStdErr)
          {

            a4 = v778;
          }
          else
          {
            BOOL v351 = os_log_type_enabled(v262, OS_LOG_TYPE_INFO);

            a4 = v778;
            unint64_t v26 = 0x26AB22000;
            if (!v351) {
              goto LABEL_267;
            }
          }
          os_log_t v352 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v353 = createIOVecString((uint64_t)&v785, v771);
          _NRLogWithArgs((uint64_t)v352, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot highestSlot=%p %@ filledIn=%u handled=%u", v354, v355, v356, v357, v358, (uint64_t)"");

          unint64_t v26 = 0x26AB22000;
LABEL_267:
          if (v771 > (v213 > PacketString))
          {
            uint64_t v225 = v213 > PacketString;
            uint64_t v226 = v771;
            os_log_t v227 = (const void **)&v770[16 * v225];
            do
            {
              if (!*(unsigned char *)(v26 + 1313)) {
                goto LABEL_270;
              }
              os_log_t v231 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              os_log_t v232 = v231;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                LODWORD(next_slot) = os_log_type_enabled(v231, OS_LOG_TYPE_INFO);

                unint64_t v26 = 0x26AB22000;
                if (!next_slot) {
                  goto LABEL_270;
                }
              }
              os_log_t v233 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              _NRLogWithArgs((uint64_t)v233, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot - consolidating %u bytes from linkInputSlot ioVecs[%u].buf=%p to linkReadBuffer filledIn=%u handled=%u", v234, v235, v236, v237, v238, (uint64_t)"");

              unint64_t v26 = 0x26AB22000;
LABEL_270:
              uint64_t v228 = *(unsigned int *)(a2 + 16);
              size_t v229 = *(unsigned int *)v227;
              if ((v229 + v228) >= 0xFFFF)
              {
                if (*(unsigned char *)(v26 + 1313))
                {
                  os_log_t v457 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                  os_log_t v458 = v457;
                  if (sNRCopyLogToStdErr)
                  {

                    goto LABEL_624;
                  }
                  BOOL v721 = os_log_type_enabled(v457, OS_LOG_TYPE_INFO);

                  if (v721)
                  {
LABEL_624:
                    os_log_t v409 = (__CFString *)_NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                    IOVecStringWithContents = createIOVecString((uint64_t)&v785, v771);
                    _NRLogWithArgs((uint64_t)v409, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot and linkReadBuffer is full %@ filledIn=%u handled=%u", v722, v723, v724, v725, v726, (uint64_t)"");
LABEL_570:

                    char v6 = 0;
                    goto LABEL_467;
                  }
                }
LABEL_424:
                char v6 = 0;
                goto LABEL_467;
              }
              memcpy(&v18[v228], *(v227 - 1), v229);
              int v230 = *(_DWORD *)v227;
              v227 += 2;
              *(_DWORD *)(a2 + 16) += v230;
              ++v225;
            }
            while (v226 != v225);
          }
          if (v213 > PacketString && v771 == 1)
          {
            uint64_t v455 = v777;
            if (!*(unsigned char *)(v26 + 1313)) {
              goto LABEL_470;
            }
            os_log_t v703 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            os_log_t v704 = v703;
            if (sNRCopyLogToStdErr)
            {

              uint64_t v455 = v777;
              a4 = v778;
              goto LABEL_618;
            }
            BOOL v705 = os_log_type_enabled(v703, OS_LOG_TYPE_INFO);

            uint64_t v455 = v777;
            a4 = v778;
            unint64_t v26 = 0x26AB22000;
            if (v705)
            {
LABEL_618:
              os_log_t v706 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              _NRLogWithArgs((uint64_t)v706, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot and everything in linkReadBuffer alreadyRead=%zu", v707, v708, v709, v710, v711, (uint64_t)"");

              unint64_t v26 = 0x26AB22000;
            }
LABEL_470:
            uint64_t v11 = v776;
            if (v27)
            {
              size_t v456 = a4 - v27;
              if (a4 > v27)
              {
                if (!gNRPacketLoggingEnabled) {
                  goto LABEL_473;
                }
                os_log_t v712 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                os_log_t v713 = v712;
                if (sNRCopyLogToStdErr)
                {

                  uint64_t v11 = v776;
                  uint64_t v455 = v777;
                  a4 = v778;
                  goto LABEL_622;
                }
                BOOL v714 = os_log_type_enabled(v712, OS_LOG_TYPE_INFO);

                uint64_t v11 = v776;
                uint64_t v455 = v777;
                a4 = v778;
                if (v714)
                {
LABEL_622:
                  os_log_t v715 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
                  _NRLogWithArgs((uint64_t)v715, 1, (uint64_t)"%s%.30s:%-4d no nexusOutputSlot - tail consolidating %zu bytes from linkInputSlot to linkReadBuffer filledIn=%u handled=%u and marking as completed", v716, v717, v718, v719, v720, (uint64_t)"");
                }
LABEL_473:
                memcpy(&v18[*(unsigned int *)(a2 + 16)], (char *)v455 + v27, v456);
                *(_DWORD *)(a2 + 16) += v456;
                unint64_t v27 = a4;
              }
              unint64_t v26 = 0x26AB22000uLL;
            }
            int v403 = 0;
            char v6 = 0;
            if (*(unsigned char *)(v26 + 1313)) {
              goto LABEL_436;
            }
            goto LABEL_440;
          }
          a3 = v777;
          if (*(unsigned char *)(v26 + 1313))
          {
            os_log_t v264 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            os_log_t v265 = v264;
            if (sNRCopyLogToStdErr)
            {

LABEL_377:
              uint64_t v11 = v776;
              os_log_t v360 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              _NRLogWithArgs((uint64_t)v360, 1, (uint64_t)"%s%.30s:%-4d Marking as completed (no nexusOutputSlot) alreadyRead=%zu", v361, v362, v363, v364, v365, (uint64_t)"");
              uint64_t next_slot = 0;
              char v6 = 0;
              a4 = v778;
              goto LABEL_404;
            }
            BOOL v359 = os_log_type_enabled(v264, OS_LOG_TYPE_INFO);

            if (v359) {
              goto LABEL_377;
            }
            uint64_t next_slot = 0;
            char v6 = 0;
LABEL_406:
            uint64_t v11 = v776;
            a4 = v778;
LABEL_405:
            unint64_t v26 = 0x26AB22000;
            a3 = v777;
          }
          else
          {
            uint64_t next_slot = 0;
            char v6 = 0;
            uint64_t v11 = v776;
          }
        }
      }
      else
      {
        unint64_t v62 = (unint64_t)(&v785 + v58);
        *(void *)unint64_t v62 = (char *)v777 + v27;
        uint64_t v63 = (_DWORD *)(v62 | 8);
        *(_DWORD *)(v62 + 8) = v59;
        if (!gNRPacketLoggingEnabled) {
          goto LABEL_60;
        }
        unint64_t v755 = v62 | 8;
        uint64_t v756 = v54;
        LODWORD(v758) = v51;
        LODWORD(v764) = v52;
        PacketString = v55;
        os_log_t v121 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          os_log_t v771 = v121;
          LODWORD(v754) = os_log_type_enabled(v121, OS_LOG_TYPE_INFO);

          uint64_t v63 = (_DWORD *)v755;
          uint64_t v54 = v756;
          uint64_t v55 = PacketString;
          unsigned int v52 = v764;
          unsigned int v51 = v758;
          if (!v754) {
            goto LABEL_60;
          }
        }
        os_log_t v170 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
        _NRLogWithArgs((uint64_t)v170, 1, (uint64_t)"%s%.30s:%-4d Placing in ioVec[%u] buf=%p len=%u alreadyRead=%zu += %zu", v171, v172, v173, v174, v175, (uint64_t)"");

        uint64_t v63 = (_DWORD *)v755;
        uint64_t v54 = v756;
        unsigned int v51 = v758;
        unsigned int v52 = v764;
        uint64_t v55 = PacketString;
LABEL_60:
        v57 += v59;
        uint64_t v60 = (v58 + 1);
        char v64 = v57 < 3 || v53;
        if (v64)
        {
          int v65 = gNRPacketLoggingEnabled;
          if (!v53)
          {
            char v75 = 0;
            a4 = v778;
            goto LABEL_111;
          }
          a4 = v778;
        }
        else
        {
          if (DWORD2(v785) < 3)
          {
            if (DWORD2(v785) == 2)
            {
              a4 = v778;
              if (v54 <= v55)
              {
                uint64_t v558 = nrCopyLogObj_518();
                uint64_t v559 = v558;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v560 = os_log_type_enabled(v558, OS_LOG_TYPE_ERROR);

                  if (!v560) {
                    goto LABEL_586;
                  }
                }
                id v641 = nrCopyLogObj_518();
                _NRLogWithArgs((uint64_t)v641, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 1", v642, v643, v644, v645, v646, (uint64_t)"");

LABEL_586:
                _os_log_pack_size();
                MEMORY[0x270FA5388]();
                __error();
                uint64_t v510 = _os_log_pack_fill();
                *(_DWORD *)uint64_t v510 = 136446210;
                os_log_t v511 = "nrReadTLVLenHBOFromIOVec";
                goto LABEL_587;
              }
              int v71 = *(unsigned __int8 *)(v785 + 1);
              int v72 = *(unsigned __int8 *)v786;
            }
            else
            {
              a4 = v778;
              if (DWORD2(v785) != 1)
              {
                unsigned int v561 = v58 + 1;
                os_log_t v562 = nrCopyLogObj_518();
                uint64_t v563 = v562;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v564 = os_log_type_enabled(v562, OS_LOG_TYPE_ERROR);

                  if (!v564) {
                    goto LABEL_590;
                  }
                }
                id v647 = nrCopyLogObj_518();
                os_log_t v748 = createIOVecString((uint64_t)&v785, v561);
                _NRLogWithArgs((uint64_t)v647, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: ioVecs[0].len == 1; %@",
                  v648,
                  v649,
                  v650,
                  v651,
                  v652,
                  (uint64_t)"");

LABEL_590:
                _os_log_pack_size();
                MEMORY[0x270FA5388]();
                __error();
                uint64_t v653 = _os_log_pack_fill();
                os_log_t v654 = createIOVecString((uint64_t)&v785, v561);
                *(_DWORD *)uint64_t v653 = 136446466;
                *(void *)(v653 + 4) = "nrReadTLVLenHBOFromIOVec";
LABEL_594:
                *(_WORD *)(v653 + 12) = 2112;
                *(void *)(v653 + 14) = v654;
                goto LABEL_595;
              }
              if (DWORD2(v786) < 2)
              {
                unsigned int v565 = v58 + 1;
                int v727 = nrCopyLogObj_518();
                int v728 = v727;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v729 = os_log_type_enabled(v727, OS_LOG_TYPE_ERROR);

                  if (!v729)
                  {
LABEL_593:
                    _os_log_pack_size();
                    MEMORY[0x270FA5388]();
                    __error();
                    uint64_t v653 = _os_log_pack_fill();
                    os_log_t v654 = createIOVecString((uint64_t)&v785, v565);
                    *(_DWORD *)uint64_t v653 = 136446466;
                    *(void *)(v653 + 4) = "nrReadTLVLenHBOFromIOVec";
                    goto LABEL_594;
                  }
                }
                id v730 = nrCopyLogObj_518();
                uint64_t v750 = createIOVecString((uint64_t)&v785, v565);
                _NRLogWithArgs((uint64_t)v730, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 2; %@",
                  v731,
                  v732,
                  v733,
                  v734,
                  v735,
                  (uint64_t)"");

                goto LABEL_593;
              }
              if (v54 <= v55)
              {
                unsigned int v565 = v58 + 1;
                uint64_t v566 = nrCopyLogObj_518();
                uint64_t v567 = v566;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v568 = os_log_type_enabled(v566, OS_LOG_TYPE_ERROR);

                  if (!v568) {
                    goto LABEL_593;
                  }
                }
                id v655 = nrCopyLogObj_518();
                uint64_t v749 = createIOVecString((uint64_t)&v785, v565);
                _NRLogWithArgs((uint64_t)v655, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 1; %@",
                  v656,
                  v657,
                  v658,
                  v659,
                  v660,
                  (uint64_t)"");

                goto LABEL_593;
              }
              int v71 = *(_WORD *)v786;
              int v72 = HIBYTE(*(unsigned __int16 *)v786);
            }
          }
          else
          {
            int v71 = *(_WORD *)(v785 + 1);
            int v72 = HIBYTE(*(unsigned __int16 *)(v785 + 1));
            a4 = v778;
          }
          unsigned int v76 = bswap32(v71 | (v72 << 8));
          unsigned int v51 = BYTE2(v76);
          unsigned int v52 = HIBYTE(v76);
          int v65 = gNRPacketLoggingEnabled;
        }
        unint64_t v77 = (v51 | ((unint64_t)v52 << 8)) + 5;
        if (v77 < v57)
        {
          unint64_t v78 = v57 - v77;
          if (!v65) {
            goto LABEL_96;
          }
          uint64_t v754 = v57 - v77;
          unint64_t v755 = (unint64_t)v63;
          LODWORD(v758) = v51;
          LODWORD(v764) = v52;
          PacketString = v55;
          uint64_t v756 = v54;
          LODWORD(v771) = v58 + 1;
          os_log_t v176 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v177 = v176;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v288 = os_log_type_enabled(v176, OS_LOG_TYPE_INFO);

            uint64_t v60 = v771;
            uint64_t v63 = (_DWORD *)v755;
            uint64_t v54 = v756;
            uint64_t v55 = PacketString;
            unsigned int v52 = v764;
            unsigned int v51 = v758;
            unint64_t v78 = v754;
            if (!v288) {
              goto LABEL_96;
            }
          }
          os_log_t v289 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          v738 = createIOVecString((uint64_t)&v785, v771);
          _NRLogWithArgs((uint64_t)v289, 1, (uint64_t)"%s%.30s:%-4d Shrinking ioVecs[%u] down by %u - %@ ioVecContentLen=%u alreadyRead=%zu", v290, v291, v292, v293, v294, (uint64_t)"");

          unint64_t v78 = v754;
          uint64_t v63 = (_DWORD *)v755;
          unsigned int v51 = v758;
          unsigned int v52 = v764;
          uint64_t v55 = PacketString;
          uint64_t v54 = v756;
          uint64_t v60 = v771;
LABEL_96:
          BOOL v79 = *v63 == v78;
          *v63 -= v78;
          if (v79)
          {
            v736 = createIOVecString((uint64_t)&v785, v60);
            -[NRBluetoothPacketParser handleInternalError:](v776, @"Shrunk ioVecs[%u] down by %u to 0 - %@ ioVecContentLen=%u alreadyRead=%zu", v417, v418, v419, v420, v421, v422, v58);

            char v6 = 0;
            goto LABEL_467;
          }
          unint64_t v27 = a4 - v78;
          if (!gNRPacketLoggingEnabled)
          {
            int v66 = 1;
            unsigned int v57 = v77;
            goto LABEL_99;
          }
          uint64_t v754 = v78;
          LODWORD(v758) = v51;
          LODWORD(v764) = v52;
          PacketString = v55;
          uint64_t v756 = v54;
          LODWORD(v771) = v60;
          os_log_t v178 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v179 = v178;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            int v66 = 1;
            BOOL v295 = os_log_type_enabled(v178, OS_LOG_TYPE_INFO);

            if (!v295)
            {
              unsigned int v57 = v77;
              a4 = v778;
              unint64_t v26 = 0x26AB22000;
              uint64_t v60 = v771;
              goto LABEL_348;
            }
          }
          unint64_t v755 = (unint64_t)_NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          uint64_t v296 = v771;
          unsigned int v739 = createIOVecString((uint64_t)&v785, v771);
          int v66 = 1;
          os_log_t v297 = (void *)v755;
          _NRLogWithArgs(v755, 1, (uint64_t)"%s%.30s:%-4d Shrunk ioVecs[%u] down by %u - %@ ioVecContentLen=%u alreadyRead=%zu", v298, v299, v300, v301, v302, (uint64_t)"");

          uint64_t v60 = v296;
          unsigned int v57 = v77;
          a4 = v778;
          unint64_t v26 = 0x26AB22000;
LABEL_348:
          uint64_t v54 = v756;
          uint64_t v55 = PacketString;
          unsigned int v52 = v764;
          unsigned int v51 = v758;
          goto LABEL_100;
        }
        char v75 = 1;
LABEL_111:
        unint64_t v26 = 0x26AB22000uLL;
        if (v65)
        {
          LODWORD(v758) = v51;
          unsigned int v153 = v52;
          PacketString = v55;
          uint64_t v756 = v54;
          LODWORD(v771) = v60;
          os_log_t v154 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v155 = v154;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v255 = os_log_type_enabled(v154, OS_LOG_TYPE_INFO);

            unint64_t v26 = 0x26AB22000;
            uint64_t v60 = v771;
            uint64_t v54 = v756;
            uint64_t v55 = PacketString;
            unsigned int v52 = v153;
            unsigned int v51 = v758;
            if (!v255) {
              goto LABEL_112;
            }
          }
          os_log_t v256 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          int v66 = 1;
          _NRLogWithArgs((uint64_t)v256, 1, (uint64_t)"%s%.30s:%-4d not shrinking len %u%s ioVecContentLen=%u alreadyRead=%zu", v257, v258, v259, v260, v261, (uint64_t)"");

          unsigned int v51 = v758;
          unsigned int v52 = v153;
          uint64_t v55 = PacketString;
          uint64_t v54 = v756;
          uint64_t v60 = v771;
          unint64_t v26 = 0x26AB22000;
          unint64_t v27 = a4;
          if (v75) {
            goto LABEL_100;
          }
          goto LABEL_115;
        }
LABEL_112:
        if (v75)
        {
          int v66 = 1;
          unint64_t v27 = a4;
          goto LABEL_100;
        }
        unint64_t v27 = a4;
LABEL_115:
        unsigned int v88 = v51;
        unsigned int v89 = v52;
        a3 = v777;
        if (*(unsigned char *)(v26 + 1313))
        {
          PacketString = v55;
          uint64_t v756 = v54;
          LODWORD(v771) = v60;
          os_log_t v106 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v107 = v106;
          if (sNRCopyLogToStdErr)
          {

LABEL_158:
            os_log_t v140 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            os_log_t v744 = createStringFromNRTLVType(v30);
            _NRLogWithArgs((uint64_t)v140, 1, (uint64_t)"%s%.30s:%-4d LtN not enough input bytes from linkInputSlot %u to fit %@ tlvLen %u", v141, v142, v143, v144, v145, (uint64_t)"");

            LODWORD(v55) = PacketString;
            LODWORD(v54) = v756;
            LODWORD(v60) = v771;
            unint64_t v26 = 0x26AB22000;
            goto LABEL_116;
          }
          LODWORD(v764) = os_log_type_enabled(v106, OS_LOG_TYPE_INFO);

          unint64_t v26 = 0x26AB22000;
          LODWORD(v60) = v771;
          LODWORD(v54) = v756;
          LODWORD(v55) = PacketString;
          if (v764) {
            goto LABEL_158;
          }
        }
LABEL_116:
        if (*(unsigned char *)(a2 + 26) == 3 && (v88 | ((unint64_t)v89 << 8)) + 5 > v57)
        {
          os_log_t v407 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v408 = v407;
          if (sNRCopyLogToStdErr)
          {

            goto LABEL_430;
          }
          BOOL v423 = os_log_type_enabled(v407, OS_LOG_TYPE_INFO);

          if (v423)
          {
LABEL_430:
            uint64_t v424 = v776;
            os_log_t v425 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
            uint64_t v11 = v424;
            _NRLogWithArgs((uint64_t)v425, 1, (uint64_t)"%s%.30s:%-4d truncated packet received %u != %lu", v426, v427, v428, v429, v430, (uint64_t)"");
            a4 = v778;
            goto LABEL_433;
          }
          uint64_t v11 = v776;
          a4 = v778;
          goto LABEL_434;
        }
        if (v60 > (v54 > v55))
        {
          unint64_t v90 = v60 - (unint64_t)(v54 > v55);
          uint64_t v91 = (const void **)&v770[16 * (v54 > v55)];
          do
          {
            if (*(unsigned char *)(v26 + 1313))
            {
              os_log_t v93 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
              os_log_t v94 = v93;
              if (sNRCopyLogToStdErr)
              {

LABEL_126:
                os_log_t v96 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
                _NRLogWithArgs((uint64_t)v96, 1, (uint64_t)"%s%.30s:%-4d partial TLV - consolidating %u bytes from linkInputSlot buf %p to linkReadBuffer filledIn=%u handled=%u", v97, v98, v99, v100, v101, (uint64_t)"");

                unint64_t v26 = 0x26AB22000;
                goto LABEL_121;
              }
              BOOL v95 = os_log_type_enabled(v93, OS_LOG_TYPE_INFO);

              unint64_t v26 = 0x26AB22000;
              if (v95) {
                goto LABEL_126;
              }
            }
LABEL_121:
            memcpy(&v18[*(unsigned int *)(a2 + 16)], *(v91 - 1), *(unsigned int *)v91);
            int v92 = *(_DWORD *)v91;
            v91 += 2;
            *(_DWORD *)(a2 + 16) += v92;
            --v90;
          }
          while (v90);
        }
        uint64_t v11 = v776;
        a4 = v778;
        if (*(unsigned char *)(v26 + 1313))
        {
          os_log_t v108 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
          os_log_t v109 = v108;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v146 = os_log_type_enabled(v108, OS_LOG_TYPE_INFO);

            unint64_t v26 = 0x26AB22000;
            if (!v146) {
              goto LABEL_128;
            }
          }
          os_log_t v147 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          _NRLogWithArgs((uint64_t)v147, 1, (uint64_t)"%s%.30s:%-4d Marking as completed (not enough input bytes) alreadyRead=%zu", v148, v149, v150, v151, v152, (uint64_t)"");

          unint64_t v26 = 0x26AB22000;
        }
LABEL_128:
        char v6 = 1;
      }
    }
    else
    {
      while (1)
      {
        if (*(unsigned char *)(v26 + 1313))
        {
          os_log_t v40 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          os_log_t v41 = v40;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v42 = os_log_type_enabled(v40, OS_LOG_TYPE_INFO);

            unint64_t v26 = 0x26AB22000;
            if (!v42) {
              goto LABEL_38;
            }
          }
          os_log_t v43 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          _NRLogWithArgs((uint64_t)v43, 1, (uint64_t)"%s%.30s:%-4d Handling Pad0 in linkReadBuffer", v44, v45, v46, v47, v48, (uint64_t)"");

          unint64_t v26 = 0x26AB22000;
        }
LABEL_38:
        uint64_t v28 = *(unsigned int *)(a2 + 16);
        LODWORD(v29) = *(_DWORD *)(a2 + 20) + 1;
        *(_DWORD *)(a2 + 20) = v29;
        if (v28 <= v29) {
          break;
        }
        unint64_t v30 = v18[v29];
        if (v18[v29]) {
          goto LABEL_40;
        }
      }
      if (v28 != v29)
      {
        -[NRBluetoothPacketParser handleInternalError:](v11, @"*filledInBytes != *handledBytes (%u != %u)", v12, v13, v14, v15, v16, v17, v28);
LABEL_453:
        char v6 = 0;
        goto LABEL_467;
      }
      char v6 = 1;
      if (*(unsigned char *)(v26 + 1313))
      {
        os_log_t v73 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
        os_log_t v74 = v73;
        if (sNRCopyLogToStdErr)
        {

          goto LABEL_343;
        }
        char v6 = 1;
        BOOL v281 = os_log_type_enabled(v73, OS_LOG_TYPE_INFO);

        unint64_t v26 = 0x26AB22000;
        if (v281)
        {
LABEL_343:
          os_log_t v282 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
          char v6 = 1;
          _NRLogWithArgs((uint64_t)v282, 1, (uint64_t)"%s%.30s:%-4d Ended linkReadBuffer on a Pad0 handled=%u filledIn=%u", v283, v284, v285, v286, v287, (uint64_t)"");

          unint64_t v26 = 0x26AB22000;
        }
      }
    }
  }
  do
  {
    unint64_t v30 = *((unsigned __int8 *)&a3->isa + v27);
    if (*((unsigned char *)&a3->isa + v27))
    {
      LODWORD(v28) = *(_DWORD *)(a2 + 16);
      LODWORD(v29) = *(_DWORD *)(a2 + 20);
      goto LABEL_40;
    }
    if (*(unsigned char *)(v26 + 1313))
    {
      os_log_t v31 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      os_log_t v32 = v31;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v33 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

        unint64_t v26 = 0x26AB22000;
        if (!v33) {
          goto LABEL_26;
        }
      }
      os_log_t v34 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v34, 1, (uint64_t)"%s%.30s:%-4d Handling Pad0 in linkInputSlot alreadyRead=%zu", v35, v36, v37, v38, v39, (uint64_t)"");

      unint64_t v26 = 0x26AB22000;
    }
LABEL_26:
    ++v27;
  }
  while (v27 < a4);
  if (v27 != a4)
  {
    -[NRBluetoothPacketParser handleInternalError:](v11, @"curLinkInputSlotPartialBytesAlreadyRead != linkInputBufferLength (%u != %u)", v12, v13, v14, v15, v16, v17, v27);
    goto LABEL_453;
  }
  if (!*(unsigned char *)(v26 + 1313))
  {
    int v403 = 0;
    char v6 = 1;
    unint64_t v27 = a4;
    goto LABEL_441;
  }
  os_log_t v468 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
  os_log_t v469 = v468;
  if (sNRCopyLogToStdErr)
  {

    goto LABEL_538;
  }
  char v6 = 1;
  BOOL v551 = os_log_type_enabled(v468, OS_LOG_TYPE_INFO);

  if (v551)
  {
LABEL_538:
    uint64_t v11 = v776;
    os_log_t v552 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
    char v6 = 1;
    _NRLogWithArgs((uint64_t)v552, 1, (uint64_t)"%s%.30s:%-4d Ended linkInputSlot on a Pad0 handled=%u filledIn=%u", v553, v554, v555, v556, v557, (uint64_t)"");

    int v403 = 0;
    a4 = v778;
    unint64_t v27 = v778;
  }
  else
  {
    int v403 = 0;
    a4 = v778;
    unint64_t v27 = v778;
    uint64_t v11 = v776;
  }
LABEL_435:
  if (gNRPacketLoggingEnabled)
  {
LABEL_436:
    os_log_t v437 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    os_log_t v438 = v437;
    if (sNRCopyLogToStdErr)
    {

      goto LABEL_439;
    }
    BOOL v439 = os_log_type_enabled(v437, OS_LOG_TYPE_INFO);

    if (v439)
    {
LABEL_439:
      os_log_t v440 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v440, 1, (uint64_t)"%s%.30s:%-4d out of LtN fast path inner loop", v441, v442, v443, v444, v445, (uint64_t)"");
    }
  }
LABEL_440:
  unint64_t v26 = 0x26AB22000uLL;
LABEL_441:
  unsigned int v447 = *(_DWORD *)(a2 + 16);
  unsigned int v446 = *(_DWORD *)(a2 + 20);
  if (v447 <= v446)
  {
    if (v446 != v447)
    {
      -[NRBluetoothPacketParser handleInternalError:](v11, @"mismatch handled/filled bytes (%u != %u)", v12, v13, v14, v15, v16, v17, *(unsigned int *)(a2 + 20));
      goto LABEL_453;
    }
    if (!*(unsigned char *)(v26 + 1313)) {
      goto LABEL_447;
    }
    os_log_t v549 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    os_log_t v550 = v549;
    if (sNRCopyLogToStdErr)
    {

      uint64_t v11 = v776;
      a4 = v778;
    }
    else
    {
      BOOL v632 = os_log_type_enabled(v549, OS_LOG_TYPE_INFO);

      uint64_t v11 = v776;
      a4 = v778;
      unint64_t v26 = 0x26AB22000;
      if (!v632)
      {
LABEL_447:
        *(void *)(a2 + 16) = 0;
        goto LABEL_455;
      }
    }
    os_log_t v633 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v633, 1, (uint64_t)"%s%.30s:%-4d resetting the linkReadBuffer (filledIn=%u)", v634, v635, v636, v637, v638, (uint64_t)"");

    unint64_t v26 = 0x26AB22000;
    goto LABEL_447;
  }
  if (v446 <= 0x8000)
  {
    if (v446)
    {
      if (!*(unsigned char *)(v26 + 1313)) {
        goto LABEL_455;
      }
      os_log_t v448 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      os_log_t v449 = v448;
      if (sNRCopyLogToStdErr)
      {

        uint64_t v11 = v776;
        a4 = v778;
      }
      else
      {
        BOOL v669 = os_log_type_enabled(v448, OS_LOG_TYPE_INFO);

        uint64_t v11 = v776;
        a4 = v778;
        unint64_t v26 = 0x26AB22000;
        if (!v669) {
          goto LABEL_455;
        }
      }
      os_log_t v670 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v670, 1, (uint64_t)"%s%.30s:%-4d not memmoving the linkReadBuffer thresh handled=%u filledIn=%u thresh=%u", v671, v672, v673, v674, v675, (uint64_t)"");
    }
    else
    {
      if (!*(unsigned char *)(v26 + 1313)) {
        goto LABEL_455;
      }
      os_log_t v623 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      os_log_t v624 = v623;
      if (sNRCopyLogToStdErr)
      {

        uint64_t v11 = v776;
        a4 = v778;
      }
      else
      {
        BOOL v690 = os_log_type_enabled(v623, OS_LOG_TYPE_INFO);

        uint64_t v11 = v776;
        a4 = v778;
        unint64_t v26 = 0x26AB22000;
        if (!v690) {
          goto LABEL_455;
        }
      }
      os_log_t v670 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v670, 1, (uint64_t)"%s%.30s:%-4d not memmoving the linkReadBuffer zero handled=%u filledIn=%u thresh=%u", v691, v692, v693, v694, v695, (uint64_t)"");
    }

    unint64_t v26 = 0x26AB22000;
  }
  else
  {
    if (!*(unsigned char *)(v26 + 1313)) {
      goto LABEL_444;
    }
    os_log_t v547 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    os_log_t v548 = v547;
    if (sNRCopyLogToStdErr)
    {

      uint64_t v11 = v776;
      a4 = v778;
      goto LABEL_579;
    }
    BOOL v625 = os_log_type_enabled(v547, OS_LOG_TYPE_INFO);

    uint64_t v11 = v776;
    a4 = v778;
    unint64_t v26 = 0x26AB22000;
    if (v625)
    {
LABEL_579:
      os_log_t v626 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
      _NRLogWithArgs((uint64_t)v626, 1, (uint64_t)"%s%.30s:%-4d memmoving the linkReadBuffer by handled=%u (filledIn=%u) thresh=%u", v627, v628, v629, v630, v631, (uint64_t)"");

      unint64_t v26 = 0x26AB22000;
    }
LABEL_444:
    memmove(v18, &v18[*(unsigned int *)(a2 + 20)], (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a2 + 20)));
    *(void *)(a2 + 16) = (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a2 + 20));
  }
LABEL_455:
  if (v767)
  {
    if (v403) {
      unint64_t v450 = a4;
    }
    else {
      unint64_t v450 = v27;
    }
    *int v767 = v450;
  }
  if (!v772)
  {
    if (!*(unsigned char *)(v26 + 1313))
    {
      *(_WORD *)(a2 + 24) += v769;
      goto LABEL_467;
    }
    os_log_t v502 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    os_log_t v503 = v502;
    if (sNRCopyLogToStdErr)
    {

      uint64_t v11 = v776;
    }
    else
    {
      BOOL v590 = os_log_type_enabled(v502, OS_LOG_TYPE_INFO);

      uint64_t v11 = v776;
      unint64_t v26 = 0x26AB22000;
      if (!v590) {
        goto LABEL_462;
      }
    }
    os_log_t v591 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
    _NRLogWithArgs((uint64_t)v591, 1, (uint64_t)"%s%.30s:%-4d highestNexusOutputSlotWrittenTo is NULL", v592, v593, v594, v595, v596, (uint64_t)"");

    unint64_t v26 = 0x26AB22000;
    goto LABEL_462;
  }
  os_channel_advance_slot();
LABEL_462:
  int v451 = *(unsigned __int8 *)(v26 + 1313);
  *(_WORD *)(a2 + 24) += v769;
  if (!v451) {
    goto LABEL_467;
  }
  os_log_t v452 = _NRCopyLogObjectForNRUUID(*(void **)(v11 + 40));
  os_log_t v453 = v452;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v495 = os_log_type_enabled(v452, OS_LOG_TYPE_INFO);

    if (!v495) {
      goto LABEL_467;
    }
  }
  os_log_t v496 = _NRCopyLogObjectForNRUUID(*(void **)(v776 + 40));
  _NRLogWithArgs((uint64_t)v496, 1, (uint64_t)"%s%.30s:%-4d out of LtN fast path loop (%llu/%llu bytes)", v497, v498, v499, v500, v501, (uint64_t)"");

LABEL_467:
  return v6 & 1;
}

double __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6)
{
  *(void *)&double result = 136447234;
  *(_DWORD *)a1 = 136447234;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 1024;
  *(_DWORD *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 18) = 1024;
  *(_DWORD *)(a1 + 20) = a4;
  *(_WORD *)(a1 + 24) = 1024;
  *(_DWORD *)(a1 + 26) = a5;
  *(_WORD *)(a1 + 30) = 2112;
  *(void *)(a1 + 32) = a6;
  return result;
}

double __os_log_helper_1_2_4_8_34_8_64_4_0_4_0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(void *)&double result = 136446978;
  *(_DWORD *)a1 = 136446978;
  *(void *)(a1 + 4) = a2;
  *(_WORD *)(a1 + 12) = 2112;
  *(void *)(a1 + 14) = a3;
  *(_WORD *)(a1 + 22) = 1024;
  *(_DWORD *)(a1 + 24) = a4;
  *(_WORD *)(a1 + 28) = 1024;
  *(_DWORD *)(a1 + 30) = a5;
  return result;
}

void NRBluetoothPacketParserResumeNexusVOOutputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x80) == 0 || !*(void *)(a1 + 312)) {
    return;
  }
  *(void *)(a1 + 136) = v1 & 0xFFFFFFFFFFFFFF7FLL;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVOOutput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 312);
  dispatch_resume(v3);
}

void NRBluetoothPacketParserResumeNexusVIOutputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x100) == 0 || !*(void *)(a1 + 328)) {
    return;
  }
  *(void *)(a1 + 136) = v1 & 0xFFFFFFFFFFFFFEFFLL;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusVIOutput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 328);
  dispatch_resume(v3);
}

void NRBluetoothPacketParserResumeNexusBEOutputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x200) == 0 || !*(void *)(a1 + 344)) {
    return;
  }
  *(void *)(a1 + 136) = v1 & 0xFFFFFFFFFFFFFDFFLL;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-resume: NexusBEOutput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 344);
  dispatch_resume(v3);
}

void NRBluetoothPacketParserSuspendNexusVOOutputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x80) != 0 || !*(void *)(a1 + 312)) {
    return;
  }
  *(void *)(a1 + 136) = v1 | 0x80;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusVOOutput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 312);
  dispatch_suspend(v3);
}

void NRBluetoothPacketParserSuspendNexusVIOutputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x100) != 0 || !*(void *)(a1 + 328)) {
    return;
  }
  *(void *)(a1 + 136) = v1 | 0x100;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusVIOutput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 328);
  dispatch_suspend(v3);
}

void NRBluetoothPacketParserSuspendNexusBEOutputSource(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 136);
  if ((v1 & 0x200) != 0 || !*(void *)(a1 + 344)) {
    return;
  }
  *(void *)(a1 + 136) = v1 | 0x200;
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v4 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      os_log_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

      if (!v6) {
        goto LABEL_4;
      }
    }
    os_log_t v7 = _NRCopyLogObjectForNRUUID(*(void **)(a1 + 40));
    _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d source-suspend: NexusBEOutput", v8, v9, v10, v11, v12, (uint64_t)"");
  }
LABEL_4:
  id v3 = *(NSObject **)(a1 + 344);
  dispatch_suspend(v3);
}

void NRBluetoothParserReadFlushCallback(uint64_t a1)
{
  if (!a1) {
    return;
  }
  unint64_t v2 = (void **)*(id *)(a1 + 8);
  if (*((unsigned char *)v2 + 8) != 4)
  {
    if (*(unsigned __int8 *)(a1 + 26) - 1 > 2)
    {
      if (*(_WORD *)(a1 + 24))
      {
LABEL_11:
        if (!gNRPacketLoggingEnabled) {
          goto LABEL_15;
        }
        uint64_t v29 = v2;
        os_log_t v3 = _NRCopyLogObjectForNRUUID(v2[5]);
        os_log_t v4 = v3;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v16 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);

          unint64_t v2 = v29;
          if (!v16) {
            goto LABEL_15;
          }
        }
        os_log_t v10 = _NRCopyLogObjectForNRUUID(v29[5]);
        _NRLogWithArgs((uint64_t)v10, 1, (uint64_t)"%s%.30s:%-4d Tried to sync nexus output but _nexusOutputRing is NULL", v17, v18, v19, v20, v21, (uint64_t)"");
        goto LABEL_26;
      }
    }
    else if (*(_WORD *)(a1 + 24))
    {
      if (v2[-2 * (*(unsigned char *)(a1 + 26) - 1) + 35])
      {
        uint64_t v29 = v2;
        if (!gNRPacketLoggingEnabled)
        {
LABEL_7:
          os_channel_sync();
          *(_WORD *)(a1 + 24) = 0;
LABEL_8:
          unint64_t v2 = v29;
          goto LABEL_15;
        }
        os_log_t v7 = _NRCopyLogObjectForNRUUID(v2[5]);
        os_log_t v8 = v7;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v22 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

          if (!v22) {
            goto LABEL_7;
          }
        }
        os_log_t v23 = _NRCopyLogObjectForNRUUID(v29[5]);
        _NRLogWithArgs((uint64_t)v23, 1, (uint64_t)"%s%.30s:%-4d syncing nexus output (%u packets)", v24, v25, v26, v27, v28, (uint64_t)"");

        goto LABEL_7;
      }
      goto LABEL_11;
    }
    if (!gNRPacketLoggingEnabled) {
      goto LABEL_15;
    }
    uint64_t v29 = v2;
    os_log_t v5 = _NRCopyLogObjectForNRUUID(v2[5]);
    os_log_t v6 = v5;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

      unint64_t v2 = v29;
      if (!v9) {
        goto LABEL_15;
      }
    }
    os_log_t v10 = _NRCopyLogObjectForNRUUID(v29[5]);
    _NRLogWithArgs((uint64_t)v10, 1, (uint64_t)"%s%.30s:%-4d highestNexusOutputSlotWrittenTo is NULL", v11, v12, v13, v14, v15, (uint64_t)"");
LABEL_26:

    goto LABEL_8;
  }
LABEL_15:
}

void sub_20A06F688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *createStringForNRNexusChannelPriority(unsigned int a1)
{
  switch(a1)
  {
    case 'd':
      double result = @"Voice";
      break;
    case 'e':
      double result = @"Video";
      break;
    case 'f':
      double result = @"BestEffort";
      break;
    case 'g':
      double result = @"Background";
      break;
    default:
      if (a1) {
        double result = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%d)", a1);
      }
      else {
        double result = @"Invalid";
      }
      break;
  }
  return result;
}

unsigned __int8 *NRBluetoothPacketParserCreate(const unsigned __int8 *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (uuid_is_null(a1))
    {
      if (nrCopyLogObj_onceToken_521 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_521, &__block_literal_global_400);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_522, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_522, 17, (uint64_t)"invalid bluetooth UUID", v4, v5, v6, v7, v8, v57);
      }
      goto LABEL_8;
    }
    os_log_t v10 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a1];
    if (!v10)
    {
      uint64_t v29 = nrCopyLogObj_518();
      unint64_t v30 = v29;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v44 = os_log_type_enabled(v29, OS_LOG_TYPE_FAULT);

        if (!v44)
        {
          BOOL v9 = 0;
          goto LABEL_18;
        }
      }
      id v12 = nrCopyLogObj_518();
      _NRLogWithArgs((uint64_t)v12, 17, (uint64_t)"%s called with null btUUID", v45, v46, v47, v48, v49, (uint64_t)"NRBluetoothPacketParserCreate");
      BOOL v9 = 0;
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    uint64_t v11 = [[NRBluetoothPacketParser alloc] initWithBluetoothUUID:v10 queue:v3];
    if (v11)
    {
      id v12 = v11;
      self;
      if (copySharedManager_onceToken != -1) {
        dispatch_once(&copySharedManager_onceToken, &__block_literal_global_602);
      }
      uint64_t v13 = (void *)copySharedManager_manager;
      if (copySharedManager_manager)
      {
        uint64_t v14 = (os_unfair_lock_s *)(copySharedManager_manager + 8);
        id v15 = v12;
        id v16 = v10;
        uint64_t v17 = v13;
        os_unfair_lock_lock(v14);
        [v17[2] setObject:v15 forKeyedSubscript:v16];

        os_unfair_lock_unlock(v14);
      }
      uint64_t v18 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x10uLL, 0xF1748037uLL);
      if (v18)
      {
        BOOL v9 = v18;
        uuid_copy(v18, a1);
        goto LABEL_17;
      }
      BOOL v33 = nrCopyLogObj_518();
      os_log_t v34 = v33;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v35 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);

        if (!v35)
        {
LABEL_33:
          _os_log_pack_size();
          MEMORY[0x270FA5388]();
          __error();
          uint64_t v42 = _os_log_pack_fill();
          __os_log_helper_1_2_3_8_34_8_0_8_0(v42, 16);
          id v43 = nrCopyLogObj_518();
          _NRLogAbortWithPack(v43);
        }
      }
      id v36 = nrCopyLogObj_518();
      _NRLogWithArgs((uint64_t)v36, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_calloc(%zu, %zu) failed", v37, v38, v39, v40, v41, (uint64_t)"");

      goto LABEL_33;
    }
    os_log_t v31 = nrCopyLogObj_518();
    os_log_t v32 = v31;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v50 = os_log_type_enabled(v31, OS_LOG_TYPE_FAULT);

      if (!v50)
      {
LABEL_38:
        id v12 = 0;
        BOOL v9 = 0;
        goto LABEL_17;
      }
    }
    id v51 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v51, 17, (uint64_t)"%s called with null parser", v52, v53, v54, v55, v56, (uint64_t)"NRBluetoothPacketParserCreate");

    goto LABEL_38;
  }
  uint64_t v20 = nrCopyLogObj_518();
  uint64_t v21 = v20;
  if (sNRCopyLogToStdErr)
  {

LABEL_23:
    id v23 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)"%s called with null queue", v24, v25, v26, v27, v28, (uint64_t)"NRBluetoothPacketParserCreate");

    goto LABEL_8;
  }
  BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_FAULT);

  if (v22) {
    goto LABEL_23;
  }
LABEL_8:
  BOOL v9 = 0;
LABEL_19:

  return v9;
}

void NRBluetoothPacketParserStart(uint64_t a1)
{
  if (a1)
  {
    id v22 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a1];
    if (v22)
    {
      self;
      if (copySharedManager_onceToken != -1) {
        dispatch_once(&copySharedManager_onceToken, &__block_literal_global_602);
      }
      uint64_t v1 = (char *)(id)copySharedManager_manager;
      if (v1)
      {
        unint64_t v2 = (id *)v1;
        id v3 = (os_unfair_lock_s *)(v1 + 8);
        id v4 = v22;
        os_unfair_lock_lock(v3);
        uint64_t v5 = [v2[2] objectForKeyedSubscript:v4];

        os_unfair_lock_unlock(v3);
        if (v5 && *(unsigned char *)(v5 + 8) != 4)
        {
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
          [(id)v5 start];
        }
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v8 = nrCopyLogObj_518();
      BOOL v9 = v8;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v16 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);

        if (!v16)
        {
          id v22 = 0;
          goto LABEL_10;
        }
      }
      uint64_t v5 = (uint64_t)nrCopyLogObj_518();
      _NRLogWithArgs(v5, 17, (uint64_t)"%s called with null btUUID", v17, v18, v19, v20, v21, (uint64_t)"NRBluetoothPacketParserStart");
    }
  }
  else
  {
    uint64_t v6 = nrCopyLogObj_518();
    uint64_t v7 = v6;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_FAULT);

      if (!v10) {
        return;
      }
    }
    id v22 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v22, 17, (uint64_t)"%s called with null parserRef", v11, v12, v13, v14, v15, (uint64_t)"NRBluetoothPacketParserStart");
  }
LABEL_10:
}

void NRBluetoothPacketParserCancel(uint64_t a1)
{
  if (a1)
  {
    id v26 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a1];
    if (!v26)
    {
      uint64_t v12 = nrCopyLogObj_518();
      uint64_t v13 = v12;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v20 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);

        if (!v20)
        {
          id v26 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = (uint64_t)nrCopyLogObj_518();
      _NRLogWithArgs(v5, 17, (uint64_t)"%s called with null btUUID", v21, v22, v23, v24, v25, (uint64_t)"NRBluetoothPacketParserCancel");
      goto LABEL_11;
    }
    self;
    if (copySharedManager_onceToken != -1) {
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_602);
    }
    uint64_t v1 = (char *)(id)copySharedManager_manager;
    if (!v1)
    {
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    unint64_t v2 = (id *)v1;
    id v3 = (os_unfair_lock_s *)(v1 + 8);
    id v4 = v26;
    os_unfair_lock_lock(v3);
    uint64_t v5 = [v2[2] objectForKeyedSubscript:v4];

    os_unfair_lock_unlock(v3);
    if (!v5 || *(unsigned char *)(v5 + 8) == 4) {
      goto LABEL_11;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
    [(id)v5 resetContextForPriority:3];
    [(id)v5 resetContextForPriority:2];
    [(id)v5 resetContextForPriority:1];
    [(id)v5 cancel];
    self;
    if (copySharedManager_onceToken == -1)
    {
      uint64_t v6 = (os_unfair_lock_s *)copySharedManager_manager;
      if (!copySharedManager_manager)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_602);
      uint64_t v6 = (os_unfair_lock_s *)copySharedManager_manager;
      if (!copySharedManager_manager) {
        goto LABEL_11;
      }
    }
    uint64_t v7 = v6 + 2;
    id v8 = v4;
    BOOL v9 = v6;
    os_unfair_lock_lock(v7);
    [v9[2] setObject:0 forKeyedSubscript:v8];

    os_unfair_lock_unlock(v7);
    goto LABEL_11;
  }
  BOOL v10 = nrCopyLogObj_518();
  uint64_t v11 = v10;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v14 = os_log_type_enabled(v10, OS_LOG_TYPE_FAULT);

    if (!v14) {
      return;
    }
  }
  id v26 = nrCopyLogObj_518();
  _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)"%s called with null parserRef", v15, v16, v17, v18, v19, (uint64_t)"NRBluetoothPacketParserCancel");
LABEL_12:
}

uint64_t NRBluetoothPacketParserCreateReadContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1)
  {
    uint64_t v15 = nrCopyLogObj_518();
    uint64_t v16 = v15;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v21 = os_log_type_enabled(v15, OS_LOG_TYPE_FAULT);

      if (!v21) {
        return 0;
      }
    }
    id v7 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null parserRef", v22, v23, v24, v25, v26, (uint64_t)"NRBluetoothPacketParserCreateReadContext");
LABEL_24:
    uint64_t v13 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    uint64_t v17 = nrCopyLogObj_518();
    uint64_t v18 = v17;
    if (sNRCopyLogToStdErr)
    {

LABEL_23:
      id v7 = nrCopyLogObj_518();
      _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null readAvailableCallback", v28, v29, v30, v31, v32, (uint64_t)"NRBluetoothPacketParserCreateReadContext");
      goto LABEL_24;
    }
    BOOL v27 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);

    if (v27) {
      goto LABEL_23;
    }
    return 0;
  }
  id v7 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a1];
  if (v7)
  {
    self;
    if (copySharedManager_onceToken != -1) {
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_602);
    }
    id v8 = (char *)(id)copySharedManager_manager;
    if (v8)
    {
      BOOL v9 = (id *)v8;
      BOOL v10 = (os_unfair_lock_s *)(v8 + 8);
      id v11 = v7;
      os_unfair_lock_lock(v10);
      uint64_t v12 = [v9[2] objectForKeyedSubscript:v11];

      os_unfair_lock_unlock(v10);
      if (v12 && *(unsigned char *)(v12 + 8) != 4)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
        uint64_t v13 = [(id)v12 createReadContextForPriority:a2 readAvailableCallback:a3 readAvailableContext:a4];
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v19 = nrCopyLogObj_518();
    BOOL v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v33 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

      if (!v33)
      {
        id v7 = 0;
        uint64_t v13 = 0;
        goto LABEL_12;
      }
    }
    uint64_t v12 = (uint64_t)nrCopyLogObj_518();
    _NRLogWithArgs(v12, 17, (uint64_t)"%s called with null btUUID", v34, v35, v36, v37, v38, (uint64_t)"NRBluetoothPacketParserCreateReadContext");
    uint64_t v13 = 0;
  }

LABEL_12:
  return v13;
}

uint64_t NRBluetoothPacketParserCreateWriteContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1)
  {
    uint64_t v15 = nrCopyLogObj_518();
    uint64_t v16 = v15;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v21 = os_log_type_enabled(v15, OS_LOG_TYPE_FAULT);

      if (!v21) {
        return 0;
      }
    }
    id v7 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null parserRef", v22, v23, v24, v25, v26, (uint64_t)"NRBluetoothPacketParserCreateWriteContext");
LABEL_24:
    uint64_t v13 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
    uint64_t v17 = nrCopyLogObj_518();
    uint64_t v18 = v17;
    if (sNRCopyLogToStdErr)
    {

LABEL_23:
      id v7 = nrCopyLogObj_518();
      _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null writeOutputCallback", v28, v29, v30, v31, v32, (uint64_t)"NRBluetoothPacketParserCreateWriteContext");
      goto LABEL_24;
    }
    BOOL v27 = os_log_type_enabled(v17, OS_LOG_TYPE_FAULT);

    if (v27) {
      goto LABEL_23;
    }
    return 0;
  }
  id v7 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a1];
  if (v7)
  {
    self;
    if (copySharedManager_onceToken != -1) {
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_602);
    }
    id v8 = (char *)(id)copySharedManager_manager;
    if (v8)
    {
      BOOL v9 = (id *)v8;
      BOOL v10 = (os_unfair_lock_s *)(v8 + 8);
      id v11 = v7;
      os_unfair_lock_lock(v10);
      uint64_t v12 = [v9[2] objectForKeyedSubscript:v11];

      os_unfair_lock_unlock(v10);
      if (v12 && *(unsigned char *)(v12 + 8) != 4)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
        uint64_t v13 = [(id)v12 createWriteContextForPriority:a2 writeOutputCallback:a3 writeOutputContext:a4];
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v19 = nrCopyLogObj_518();
    BOOL v20 = v19;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v33 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);

      if (!v33)
      {
        id v7 = 0;
        uint64_t v13 = 0;
        goto LABEL_12;
      }
    }
    uint64_t v12 = (uint64_t)nrCopyLogObj_518();
    _NRLogWithArgs(v12, 17, (uint64_t)"%s called with null btUUID", v34, v35, v36, v37, v38, (uint64_t)"NRBluetoothPacketParserCreateWriteContext");
    uint64_t v13 = 0;
  }

LABEL_12:
  return v13;
}

void NRBluetoothPacketParserResetContext(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    id v28 = (id)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a1];
    if (!v28)
    {
      BOOL v14 = nrCopyLogObj_518();
      uint64_t v15 = v14;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v22 = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);

        if (!v22)
        {
          id v28 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v7 = (uint64_t)nrCopyLogObj_518();
      _NRLogWithArgs(v7, 17, (uint64_t)"%s called with null btUUID", v23, v24, v25, v26, v27, (uint64_t)"NRBluetoothPacketParserResetContext");
      goto LABEL_13;
    }
    self;
    if (copySharedManager_onceToken != -1) {
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_602);
    }
    id v3 = (char *)(id)copySharedManager_manager;
    if (!v3)
    {
      uint64_t v7 = 0;
      goto LABEL_13;
    }
    id v4 = (id *)v3;
    uint64_t v5 = (os_unfair_lock_s *)(v3 + 8);
    id v6 = v28;
    os_unfair_lock_lock(v5);
    uint64_t v7 = [v4[2] objectForKeyedSubscript:v6];

    os_unfair_lock_unlock(v5);
    if (!v7) {
      goto LABEL_13;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 56));
    [(id)v7 resetContextForPriority:a2];
    if (a2 == 1) {
      [(id)v7 cancel];
    }
    if (*(void *)(v7 + 664)) {
      goto LABEL_13;
    }
    [(id)v7 cancel];
    self;
    if (copySharedManager_onceToken == -1)
    {
      id v8 = (os_unfair_lock_s *)copySharedManager_manager;
      if (!copySharedManager_manager)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      dispatch_once(&copySharedManager_onceToken, &__block_literal_global_602);
      id v8 = (os_unfair_lock_s *)copySharedManager_manager;
      if (!copySharedManager_manager) {
        goto LABEL_13;
      }
    }
    BOOL v9 = v8 + 2;
    id v10 = v6;
    id v11 = v8;
    os_unfair_lock_lock(v9);
    [v11[2] setObject:0 forKeyedSubscript:v10];

    os_unfair_lock_unlock(v9);
    goto LABEL_13;
  }
  uint64_t v12 = nrCopyLogObj_518();
  uint64_t v13 = v12;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v16 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);

    if (!v16) {
      return;
    }
  }
  id v28 = nrCopyLogObj_518();
  _NRLogWithArgs((uint64_t)v28, 17, (uint64_t)"%s called with null parserRef", v17, v18, v19, v20, v21, (uint64_t)"NRBluetoothPacketParserResetContext");
LABEL_14:
}

void NRBluetoothPacketParserGetSlotCount(uint64_t a1, uint64_t a2, _WORD *a3, _WORD *a4)
{
  if (a1)
  {
    if (a3) {
      *a3 = 64;
    }
    if (a4) {
      *a4 = 16;
    }
  }
  else
  {
    id v4 = nrCopyLogObj_518();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      uint64_t v5 = v4;
      BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);

      if (!v6) {
        return;
      }
    }
    id v12 = nrCopyLogObj_518();
    _NRLogWithArgs((uint64_t)v12, 17, (uint64_t)"%s called with null parserRef", v7, v8, v9, v10, v11, (uint64_t)"NRBluetoothPacketParserGetSlotCount");
  }
}

id nrCopyLogObj_612()
{
  if (nrCopyLogObj_onceToken_614 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_614, &__block_literal_global_615);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_616;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_619()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_616;
  nrCopyLogObj_sNRLogObj_616 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_20A07B84C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_20A07CAE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 104), 8);
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

uint64_t __nrCopyLogObj_block_invoke_771()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_763;
  nrCopyLogObj_sNRLogObj_763 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

id nrCopyLogObj_776()
{
  if (nrCopyLogObj_onceToken_761 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_761, &__block_literal_global_762);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_763;
  return v0;
}

BOOL _NRIsUUIDNonZero(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    unint64_t v2 = nrCopyLogObj_776();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      id v3 = v2;
      BOOL v4 = os_log_type_enabled(v2, OS_LOG_TYPE_FAULT);

      if (!v4) {
        return 0;
      }
    }
    id v5 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v5, 17, (uint64_t)"%s called with null nsUUID", v6, v7, v8, v9, v10, (uint64_t)"_NRIsUUIDNonZero");

    return 0;
  }
  *(void *)uu = 0;
  uint64_t v12 = 0;
  [a1 getUUIDBytes:uu];
  return uuid_is_null(uu) == 0;
}

uint64_t __nrCopyLogObj_block_invoke_860()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_854;
  nrCopyLogObj_sNRLogObj_854 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_20A07F09C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id nrCopyLogObj_872()
{
  if (nrCopyLogObj_onceToken_852 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_852, &__block_literal_global_853);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_854;
  return v0;
}

void sub_20A0804A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __nrCopyLogObj_block_invoke_933()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_926;
  nrCopyLogObj_sNRLogObj_926 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void __NRIdentityReferencesMonitorCacheLocked_block_invoke_2(uint64_t a1, int a2)
{
  if (NRIdentityReferencesMonitorCacheLocked_sIdentityReferencesChangeToken == a2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&gNRSecKeyProxyCacheLock);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    os_unfair_lock_unlock((os_unfair_lock_t)&gNRSecKeyProxyCacheLock);
  }
}

uint64_t __Block_byref_object_copy__939(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__940(uint64_t a1)
{
}

uint64_t __NRIPCFetchReferencesLocked_block_invoke(uint64_t a1)
{
  unint64_t v2 = nrXPCCopyIdentityReferences();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

id nrCopyLogObj_941()
{
  if (nrCopyLogObj_onceToken_924 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_924, &__block_literal_global_925);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_926;
  return v0;
}

void __NRIPCCopyQueue_block_invoke()
{
  if (_NRShouldDebugAutoRelease_onceToken != -1) {
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_40);
  }
  if (_NRShouldDebugAutoRelease_debugAutoRelease)
  {
    os_log_t v0 = 0;
  }
  else
  {
    os_log_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  }
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  if (!v1)
  {
    id v5 = nrCopyLogObj_941();
    uint64_t v6 = v5;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

      if (!v7)
      {
LABEL_19:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v17 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v17 = 136446466;
        *(void *)(v17 + 4) = "nr_dispatch_queue_create_with_qos";
        *(_WORD *)(v17 + 12) = 1024;
        *(_DWORD *)(v17 + 14) = 25;
        id v18 = nrCopyLogObj_941();
        _NRLogAbortWithPack(v18);
      }
    }
    id v11 = nrCopyLogObj_941();
    _NRLogWithArgs((uint64_t)v11, 16, (uint64_t)"%s%.30s:%-4d ABORTING: dispatch_queue_attr_make_with_qos_class(%u) failed", v12, v13, v14, v15, v16, (uint64_t)"");

    goto LABEL_19;
  }
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.networkrelay.queue.identity-proxy-client", v1);
  if (!v2)
  {
    uint64_t v8 = nrCopyLogObj_941();
    uint64_t v9 = v8;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (!v10)
      {
LABEL_22:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v25 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v25 = 136446466;
        *(void *)(v25 + 4) = "nr_dispatch_queue_create_with_qos";
        *(_WORD *)(v25 + 12) = 2080;
        *(void *)(v25 + 14) = "com.apple.networkrelay.queue.identity-proxy-client";
        id v26 = nrCopyLogObj_941();
        _NRLogAbortWithPack(v26);
      }
    }
    id v19 = nrCopyLogObj_941();
    _NRLogWithArgs((uint64_t)v19, 16, (uint64_t)"%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", v20, v21, v22, v23, v24, (uint64_t)"");

    goto LABEL_22;
  }
  uint64_t v3 = (uint64_t)v2;

  uint64_t v4 = (void *)NRIPCCopyQueue_queue;
  NRIPCCopyQueue_queue = v3;
}

void __NRIdentityReferencesMonitorCacheLocked_block_invoke()
{
  os_log_t v0 = (void *)gNRSecKeyProxies;
  gNRSecKeyProxies = 0;

  uint64_t v1 = (void *)gNRIdentityReferencesCache;
  gNRIdentityReferencesCache = 0;
}

id nrCopyLogObj_1005()
{
  if (nrCopyLogObj_onceToken_1009 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1009, &__block_literal_global_420);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_1010;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_1012()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_1010;
  nrCopyLogObj_sNRLogObj_1010 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

__CFString *_NRKeyCreateLogString(void *a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v9 = @"[nil]";
    goto LABEL_39;
  }
  if (_NRIsAppleInternal_onceToken != -1) {
    dispatch_once(&_NRIsAppleInternal_onceToken, &__block_literal_global_407);
  }
  if (_NRIsAppleInternal_internal
    && [v1 length]
    && (unint64_t)[v1 length] <= 0xFFFFFFE4)
  {
    int v2 = [v1 length];
    uint64_t v3 = (v2 + 26);
    if (v2 != -26)
    {
      uint64_t v4 = malloc_type_malloc((v2 + 26), 0xA172743EuLL);
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = v4;
        if (v3 >= 2)
        {
          unsigned char *v4 = 78;
          uint64_t v6 = v4 + 1;
          if (v3 != 2)
          {
            BOOL v7 = &aNetworkrelayke[v3 - 2];
            v4[1] = 101;
            if (v7 == "etworkRelayKeyLogHashSalt")
            {
              uint64_t v6 = v4 + 2;
            }
            else
            {
              v4[2] = 116;
              if (v7 == "tworkRelayKeyLogHashSalt")
              {
                uint64_t v6 = v4 + 3;
              }
              else
              {
                v4[3] = 119;
                if (v7 == "workRelayKeyLogHashSalt")
                {
                  uint64_t v6 = v4 + 4;
                }
                else
                {
                  v4[4] = 111;
                  if (v7 == "orkRelayKeyLogHashSalt")
                  {
                    uint64_t v6 = v4 + 5;
                  }
                  else
                  {
                    void v4[5] = 114;
                    if (v7 == "rkRelayKeyLogHashSalt")
                    {
                      uint64_t v6 = v4 + 6;
                    }
                    else
                    {
                      v4[6] = 107;
                      if (v7 == "kRelayKeyLogHashSalt")
                      {
                        uint64_t v6 = v4 + 7;
                      }
                      else
                      {
                        v4[7] = 82;
                        if (v7 == "RelayKeyLogHashSalt")
                        {
                          uint64_t v6 = v4 + 8;
                        }
                        else
                        {
                          v4[8] = 101;
                          if (v7 == "elayKeyLogHashSalt")
                          {
                            uint64_t v6 = v4 + 9;
                          }
                          else
                          {
                            v4[9] = 108;
                            if (v7 == "layKeyLogHashSalt")
                            {
                              uint64_t v6 = v4 + 10;
                            }
                            else
                            {
                              v4[10] = 97;
                              if (v7 == "ayKeyLogHashSalt")
                              {
                                uint64_t v6 = v4 + 11;
                              }
                              else
                              {
                                v4[11] = 121;
                                if (v7 == "yKeyLogHashSalt")
                                {
                                  uint64_t v6 = v4 + 12;
                                }
                                else
                                {
                                  v4[12] = 75;
                                  if (v7 == "KeyLogHashSalt")
                                  {
                                    uint64_t v6 = v4 + 13;
                                  }
                                  else
                                  {
                                    v4[13] = 101;
                                    if (v7 == "eyLogHashSalt")
                                    {
                                      uint64_t v6 = v4 + 14;
                                    }
                                    else
                                    {
                                      v4[14] = 121;
                                      if (v7 == "yLogHashSalt")
                                      {
                                        uint64_t v6 = v4 + 15;
                                      }
                                      else
                                      {
                                        v4[15] = 76;
                                        if (v7 == "LogHashSalt")
                                        {
                                          uint64_t v6 = v4 + 16;
                                        }
                                        else
                                        {
                                          v4[16] = 111;
                                          if (v7 == "ogHashSalt")
                                          {
                                            uint64_t v6 = v4 + 17;
                                          }
                                          else
                                          {
                                            v4[17] = 103;
                                            if (v7 == "gHashSalt")
                                            {
                                              uint64_t v6 = v4 + 18;
                                            }
                                            else
                                            {
                                              v4[18] = 72;
                                              if (v7 == "HashSalt")
                                              {
                                                uint64_t v6 = v4 + 19;
                                              }
                                              else
                                              {
                                                v4[19] = 97;
                                                if (v7 == "ashSalt")
                                                {
                                                  uint64_t v6 = v4 + 20;
                                                }
                                                else
                                                {
                                                  v4[20] = 115;
                                                  if (v7 == "shSalt")
                                                  {
                                                    uint64_t v6 = v4 + 21;
                                                  }
                                                  else
                                                  {
                                                    v4[21] = 104;
                                                    if (v7 == "hSalt")
                                                    {
                                                      uint64_t v6 = v4 + 22;
                                                    }
                                                    else
                                                    {
                                                      v4[22] = 83;
                                                      if (v7 == "Salt")
                                                      {
                                                        uint64_t v6 = v4 + 23;
                                                      }
                                                      else
                                                      {
                                                        v4[23] = 97;
                                                        if (v7 == "alt")
                                                        {
                                                          uint64_t v6 = v4 + 24;
                                                        }
                                                        else
                                                        {
                                                          v4[24] = 108;
                                                          if (v7 == "lt")
                                                          {
                                                            uint64_t v6 = v4 + 25;
                                                          }
                                                          else
                                                          {
                                                            v4[25] = 116;
                                                            uint64_t v6 = v4 + 26;
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
                    }
                  }
                }
              }
            }
          }
        }
        *uint64_t v6 = 0;
        [v1 getBytes:v4 + 26 length:v3 - 26];
        long long v39 = 0u;
        long long v40 = 0u;
        *(_OWORD *)md = 0u;
        long long v38 = 0u;
        CC_SHA512(v5, v3, md);
        cc_clear();
        free(v5);
        BOOL v33 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:md length:64];
        uint64_t v34 = [v33 base64EncodedStringWithOptions:0];
        id v35 = [NSString alloc];
        uint64_t v36 = [v34 substringToIndex:6];
        uint64_t v8 = (__CFString *)[v35 initWithFormat:@":%@", v36];

        goto LABEL_37;
      }
      uint64_t v14 = nrCopyLogObj_1005();
      uint64_t v15 = v14;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

        if (!v16)
        {
LABEL_65:
          _os_log_pack_size();
          MEMORY[0x270FA5388]();
          __error();
          uint64_t v31 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v31 = 136446466;
          *(void *)(v31 + 4) = "strict_malloc";
          *(_WORD *)(v31 + 12) = 2048;
          *(void *)(v31 + 14) = v3;
          id v32 = nrCopyLogObj_1005();
          _NRLogAbortWithPack(v32);
        }
      }
      id v25 = nrCopyLogObj_1005();
      _NRLogWithArgs((uint64_t)v25, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v26, v27, v28, v29, v30, (uint64_t)"");

      goto LABEL_65;
    }
    id v11 = nrCopyLogObj_1005();
    uint64_t v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

      if (!v13)
      {
LABEL_62:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v23 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v23 = 136446210;
        *(void *)(v23 + 4) = "strict_malloc";
        id v24 = nrCopyLogObj_1005();
        _NRLogAbortWithPack(v24);
      }
    }
    id v17 = nrCopyLogObj_1005();
    _NRLogWithArgs((uint64_t)v17, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc called with size 0", v18, v19, v20, v21, v22, (uint64_t)"");

    goto LABEL_62;
  }
  uint64_t v8 = &stru_26BE156B0;
LABEL_37:
  uint64_t v9 = (__CFString *)[[NSString alloc] initWithFormat:@"[%llu%@]", objc_msgSend(v1, "length"), v8];

LABEL_39:
  return v9;
}

id nrCopyLogObj_1256()
{
  if (nrCopyLogObj_onceToken_1261 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1261, &__block_literal_global_1262);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_1263;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_1266()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_1263;
  nrCopyLogObj_sNRLogObj_1263 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_20A085D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A0860B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A086A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A0873C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20A087738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A087C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20A088194(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20A089458(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_1449()
{
  if (nrCopyLogObj_onceToken_1460 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1460, &__block_literal_global_1461);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_1462;
  return v0;
}

void sub_20A08AA8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

uint64_t __nrCopyLogObj_block_invoke_1466()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_1462;
  nrCopyLogObj_sNRLogObj_1462 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_20A08B8D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_20A08D0F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_20A08D9E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_20A08E2BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_20A08F0BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_20A08F998(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

id nrCopyLogObj_1612()
{
  if (nrCopyLogObj_onceToken_1616 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1616, &__block_literal_global_70);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_1617;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_1621()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_1617;
  nrCopyLogObj_sNRLogObj_1617 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

double __os_log_helper_1_2_3_8_34_8_32_8_0(uint64_t a1, uint64_t a2)
{
  *(void *)&double result = 136446722;
  *(_DWORD *)a1 = 136446722;
  *(void *)(a1 + 4) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
  *(_WORD *)(a1 + 12) = 2080;
  *(void *)(a1 + 14) = "-[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:]";
  *(_WORD *)(a1 + 22) = 2048;
  *(void *)(a1 + 24) = a2;
  return result;
}

uint64_t __Block_byref_object_copy__1681(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1682(uint64_t a1)
{
}

uint64_t NRCompanionLinkIsEnabled(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (nrCopyLogObj_onceToken_1692 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1692, &__block_literal_global_1693);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1694, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1694, 0, (uint64_t)"%s%.30s:%-4d Querying whether companion link is enabled", a4, a5, a6, a7, a8, (uint64_t)"");
  }
  uint64_t IsEnabled = nrXPCCompanionLinkIsEnabled();
  if (nrCopyLogObj_onceToken_1692 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_9:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1694, 0, (uint64_t)"%s%.30s:%-4d Returning that companion link is %sabled", v8, v9, v10, v11, v12, (uint64_t)"");
      return IsEnabled;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_1692, &__block_literal_global_1693);
    if (sNRCopyLogToStdErr) {
      goto LABEL_9;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1694, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_9;
  }
  return IsEnabled;
}

uint64_t __nrCopyLogObj_block_invoke_1702()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_1694;
  nrCopyLogObj_sNRLogObj_1694 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t NRDeviceSupportsIDSRestrictedPorts(void *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a1;
  if (nrCopyLogObj_onceToken_1692 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1692, &__block_literal_global_1693);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1694, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1694, 0, (uint64_t)"%s%.30s:%-4d Querying whether device supports restricted ports", v1, v2, v3, v4, v5, (uint64_t)"");
  }
  if (!v6)
  {
    uint64_t v20 = nrCopyLogObj_1705();
    uint64_t v21 = v20;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_FAULT);

      if (!v22) {
        goto LABEL_12;
      }
    }
    id v23 = nrCopyLogObj_1705();
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)"%s called with null device", v24, v25, v26, v27, v28, (uint64_t)"NRDeviceSupportsIDSRestrictedPorts");

    goto LABEL_12;
  }
  *(void *)uu = 0;
  uint64_t v31 = 0;
  BOOL v7 = [v6 nrDeviceIdentifier];
  [v7 getUUIDBytes:uu];

  if (!uuid_is_null(uu))
  {
    uint64_t v13 = nrXPCSupportsRestrictedPorts(uu);
    if (nrCopyLogObj_onceToken_1692 == -1)
    {
      if (sNRCopyLogToStdErr) {
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_1692, &__block_literal_global_1693);
      if (sNRCopyLogToStdErr) {
        goto LABEL_16;
      }
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1694, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
LABEL_16:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1694, 0, (uint64_t)"%s%.30s:%-4d Device supports restricted ports: %s", v14, v15, v16, v17, v18, (uint64_t)"");
    goto LABEL_17;
  }
  if (nrCopyLogObj_onceToken_1692 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_11:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1694, 17, (uint64_t)"null nrUUID", v8, v9, v10, v11, v12, v29);
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_1692, &__block_literal_global_1693);
    if (sNRCopyLogToStdErr) {
      goto LABEL_11;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1694, OS_LOG_TYPE_FAULT)) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v13 = 0;
LABEL_17:

  return v13;
}

id nrCopyLogObj_1705()
{
  if (nrCopyLogObj_onceToken_1692 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1692, &__block_literal_global_1693);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_1694;
  return v0;
}

__CFString *createIPv6AddrString(_DWORD *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1) {
    return @"<NULL>";
  }
  uint64_t v1 = a1;
  if (*a1)
  {
    int v2 = 30;
  }
  else
  {
    int v4 = a1[1];
    int v2 = 30;
    if (!v4)
    {
      int v2 = v1[2] == -65536 ? 2 : 30;
      if (v1[2] == -65536) {
        v1 += 3;
      }
    }
  }
  if (inet_ntop(v2, v1, v11, 0x2Eu)) {
    return (__CFString *)[[NSString alloc] initWithUTF8String:v11];
  }
  if (nrCopyLogObj_onceToken_1713 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1713, &__block_literal_global_1714);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1715, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_1715, 17, (uint64_t)"inet_ntop failed", v5, v6, v7, v8, v9, v10);
  }
  return @"<ERROR>";
}

uint64_t __nrCopyLogObj_block_invoke_1725()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_1715;
  nrCopyLogObj_sNRLogObj_1715 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

__CFString *createIPv6AddrStringFromData(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1)
  {
    v6[0] = 0;
    v6[1] = 0;
    if ([v1 length] == 16)
    {
      [v2 getBytes:v6 length:16];
      IPv6AddrString = createIPv6AddrString(v6);
    }
    else
    {
      IPv6AddrString = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"<bad length %llu>", objc_msgSend(v2, "length"));
    }
    int v4 = IPv6AddrString;
  }
  else
  {
    int v4 = @"<nil>";
  }

  return v4;
}

__CFString *createSockaddrString(sockaddr *a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t sa_len = a1->sa_len;
    if (a1->sa_len)
    {
      uint64_t sa_family = a1->sa_family;
      if (sa_len != 1)
      {
        switch(a1->sa_family)
        {
          case 1u:
            if (sa_len < 3) {
              return @"<invalid_un>";
            }
            snprintf(__str, 7uLL, "%%.%lus", sa_len - 2);
            __str[6] = 0;
            id v7 = [NSString alloc];
            uint64_t v8 = (void *)[[NSString alloc] initWithUTF8String:__str];
            int v4 = (__CFString *)objc_msgSend(v7, "initWithFormat:", v8, a1->sa_data);

            return v4;
          case 2u:
          case 0x1Eu:
            if (getnameinfo(a1, sa_len, __str, 0x39u, v21, 6u, 10)) {
              return @"<getnameinfo_fail>";
            }
            int v9 = *(unsigned __int16 *)v21;
            id v10 = [NSString alloc];
            if (v9 == 48)
            {
              uint64_t v5 = [v10 initWithUTF8String:__str];
            }
            else
            {
              if (a1->sa_family == 2) {
                uint64_t v11 = @"%s:%s";
              }
              else {
                uint64_t v11 = @"%s.%s";
              }
              uint64_t v5 = objc_msgSend(v10, "initWithFormat:", v11, __str, v21);
            }
            break;
          case 0x12u:
            if (sa_len < 8
              || a1->sa_data[3]
               + (unint64_t)a1->sa_data[4]
               + a1->sa_data[5]
               + 8 > sa_len)
            {
              return @"<invalid_dl>";
            }
            uint64_t v12 = [MEMORY[0x263F089D8] string];
            uint64_t v13 = v12;
            uint64_t v14 = a1->sa_data[3];
            if (a1->sa_data[4])
            {
              uint64_t v15 = &a1->sa_len + v14;
              objc_msgSend(v12, "appendFormat:", @"%x", a1->sa_data[v14 + 6]);
              if (a1->sa_data[4] >= 2u)
              {
                uint64_t v16 = 9;
                do
                {
                  objc_msgSend(v13, "appendFormat:", @":%x", v15[v16]);
                  unint64_t v17 = v16 - 7;
                  ++v16;
                }
                while (v17 < a1->sa_data[4]);
              }
              LODWORD(v14) = a1->sa_data[3];
            }
            if (v14)
            {
              if ([v13 length]) {
                snprintf(__str, 8uLL, "%%%%%%.%us");
              }
              else {
                snprintf(__str, 8uLL, "%%.%us");
              }
              __str[7] = 0;
              uint64_t v18 = (void *)[[NSString alloc] initWithUTF8String:__str];
              objc_msgSend(v13, "appendFormat:", v18, &a1->sa_data[6]);
            }
            else if (*(_WORD *)a1->sa_data)
            {
              if ([v13 length]) {
                uint64_t v19 = @"%%%d";
              }
              else {
                uint64_t v19 = @"%d";
              }
              objc_msgSend(v13, "appendFormat:", v19, *(unsigned __int16 *)a1->sa_data);
            }
            if ([v13 length]) {
              int v4 = v13;
            }
            else {
              int v4 = @"<invalid_dl2>";
            }

            return v4;
          default:
            objc_msgSend(NSString, "stringWithFormat:", @"<unsupported af: %u>", a1->sa_family, v20);
            return (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        return (__CFString *)v5;
      }
    }
    else
    {
      uint64_t sa_family = a1->sa_family;
      if (!a1->sa_family) {
        return @"<EMPTY>";
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid_%d_%d>", sa_family, sa_len);
    return (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return @"<NULL>";
}

__CFString *createSockaddrStringFromData(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 length];
    if (v3)
    {
      unint64_t v4 = v3;
      uint64_t v5 = (sockaddr *)[v2 bytes];
      if (v4 >= v5->sa_len) {
        SockaddrString = createSockaddrString(v5);
      }
      else {
        SockaddrString = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"<bad sa_len %hhu length %llu>", v5->sa_len, v4);
      }
    }
    else
    {
      SockaddrString = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"<bad length %llu>", 0);
    }
    id v7 = SockaddrString;
  }
  else
  {
    id v7 = @"<nil>";
  }

  return v7;
}

__CFString *createStringFromNRTLVType(unsigned int a1)
{
  uint64_t v1 = a1;
  double result = @"Pad0";
  switch(a1)
  {
    case 0u:
      return result;
    case 1u:
      double result = @"PadN";
      break;
    case 2u:
      double result = @"UncompressedIP";
      break;
    case 3u:
      double result = @"Encapsulated6LoWPAN";
      break;
    case 4u:
      double result = @"IKEv2PointToPoint";
      break;
    case 5u:
      double result = @"ControlMessage";
      break;
    case 0x64u:
      double result = @"KnownIPv6Hdr_ESP";
      break;
    case 0x65u:
      double result = @"KnownIPv6Hdr_ESP_ECT0";
      break;
    case 0x66u:
      double result = @"KnownIPv6Hdr_TCP";
      break;
    case 0x67u:
      double result = @"KnownIPv6Hdr_TCP_ECT0";
      break;
    case 0x68u:
      double result = @"KnownIPv6Hdr_ESP_ClassC";
      break;
    case 0x69u:
      double result = @"KnownIPv6Hdr_ESP_ClassC_ECT0";
      break;
    default:
      double result = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%lld)", v1);
      break;
  }
  return result;
}

__CFString *createIPProtoString(unsigned int a1)
{
  uint64_t v1 = a1;
  double result = @"HOPOPTS";
  switch(a1)
  {
    case 0u:
      return result;
    case 1u:
      double result = @"ICMP";
      break;
    case 2u:
      double result = @"IGMP";
      break;
    case 3u:
      double result = @"GGP";
      break;
    case 4u:
      double result = @"IPV4";
      break;
    case 6u:
      double result = @"TCP";
      break;
    case 7u:
      double result = @"ST";
      break;
    case 8u:
      double result = @"EGP";
      break;
    case 9u:
      double result = @"PIGP";
      break;
    case 0xAu:
      double result = @"RCCMON";
      break;
    case 0xBu:
      double result = @"NVPII";
      break;
    case 0xCu:
      double result = @"PUP";
      break;
    case 0xDu:
      double result = @"ARGUS";
      break;
    case 0xEu:
      double result = @"EMCON";
      break;
    case 0xFu:
      double result = @"XNET";
      break;
    case 0x10u:
      double result = @"CHAOS";
      break;
    case 0x11u:
      double result = @"UDP";
      break;
    case 0x12u:
      double result = @"MUX";
      break;
    case 0x13u:
      double result = @"MEAS";
      break;
    case 0x14u:
      double result = @"HMP";
      break;
    case 0x15u:
      double result = @"PRM";
      break;
    case 0x16u:
      double result = @"IDP";
      break;
    case 0x17u:
      double result = @"TRUNK1";
      break;
    case 0x18u:
      double result = @"TRUNK2";
      break;
    case 0x19u:
      double result = @"LEAF1";
      break;
    case 0x1Au:
      double result = @"LEAF2";
      break;
    case 0x1Bu:
      double result = @"RDP";
      break;
    case 0x1Cu:
      double result = @"IRTP";
      break;
    case 0x1Du:
      double result = @"TP";
      break;
    case 0x1Eu:
      double result = @"BLT";
      break;
    case 0x1Fu:
      double result = @"NSP";
      break;
    case 0x20u:
      double result = @"INP";
      break;
    case 0x21u:
      double result = @"SEP";
      break;
    case 0x22u:
      double result = @"3PC";
      break;
    case 0x23u:
      double result = @"IDPR";
      break;
    case 0x24u:
      double result = @"XTP";
      break;
    case 0x25u:
      double result = @"DDP";
      break;
    case 0x26u:
      double result = @"CMTP";
      break;
    case 0x27u:
      double result = @"TPXX";
      break;
    case 0x28u:
      double result = @"IL";
      break;
    case 0x29u:
      double result = @"IPV6";
      break;
    case 0x2Au:
      double result = @"SDRP";
      break;
    case 0x2Bu:
      double result = @"ROUTING";
      break;
    case 0x2Cu:
      double result = @"FRAGMENT";
      break;
    case 0x2Du:
      double result = @"IDRP";
      break;
    case 0x2Eu:
      double result = @"RSVP";
      break;
    case 0x2Fu:
      double result = @"GRE";
      break;
    case 0x30u:
      double result = @"MHRP";
      break;
    case 0x31u:
      double result = @"BHA";
      break;
    case 0x32u:
      double result = @"ESP";
      break;
    case 0x33u:
      double result = @"AH";
      break;
    case 0x34u:
      double result = @"INLSP";
      break;
    case 0x35u:
      double result = @"SWIPE";
      break;
    case 0x36u:
      double result = @"NHRP";
      break;
    case 0x3Au:
      double result = @"ICMPV6";
      break;
    case 0x3Bu:
      double result = @"NONE";
      break;
    case 0x3Cu:
      double result = @"DSTOPTS";
      break;
    case 0x3Du:
      double result = @"AHIP";
      break;
    case 0x3Eu:
      double result = @"CFTP";
      break;
    case 0x3Fu:
      double result = @"HELLO";
      break;
    case 0x40u:
      double result = @"SATEXPAK";
      break;
    case 0x41u:
      double result = @"KRYPTOLAN";
      break;
    case 0x42u:
      double result = @"RVD";
      break;
    case 0x43u:
      double result = @"IPPC";
      break;
    case 0x44u:
      double result = @"ADFS";
      break;
    case 0x45u:
      double result = @"SATMON";
      break;
    case 0x46u:
      double result = @"VISA";
      break;
    case 0x47u:
      double result = @"IPCV";
      break;
    case 0x48u:
      double result = @"CPNX";
      break;
    case 0x49u:
      double result = @"CPHB";
      break;
    case 0x4Au:
      double result = @"WSN";
      break;
    case 0x4Bu:
      double result = @"PVP";
      break;
    case 0x4Cu:
      double result = @"BRSATMON";
      break;
    case 0x4Du:
      double result = @"ND";
      break;
    case 0x4Eu:
      double result = @"WBMON";
      break;
    case 0x4Fu:
      double result = @"WBEXPAK";
      break;
    case 0x50u:
      double result = @"EON";
      break;
    case 0x51u:
      double result = @"VMTP";
      break;
    case 0x52u:
      double result = @"SVMTP";
      break;
    case 0x53u:
      double result = @"VINES";
      break;
    case 0x54u:
      double result = @"TTP";
      break;
    case 0x55u:
      double result = @"IGP";
      break;
    case 0x56u:
      double result = @"DGP";
      break;
    case 0x57u:
      double result = @"TCF";
      break;
    case 0x58u:
      double result = @"IGRP";
      break;
    case 0x59u:
      double result = @"OSPFIGP";
      break;
    case 0x5Au:
      double result = @"SRPC";
      break;
    case 0x5Bu:
      double result = @"LARP";
      break;
    case 0x5Cu:
      double result = @"MTP";
      break;
    case 0x5Du:
      double result = @"AX25";
      break;
    case 0x5Eu:
      double result = @"IPEIP";
      break;
    case 0x5Fu:
      double result = @"MICP";
      break;
    case 0x60u:
      double result = @"SCCSP";
      break;
    case 0x61u:
      double result = @"ETHERIP";
      break;
    case 0x62u:
      double result = @"ENCAP";
      break;
    case 0x63u:
      double result = @"APES";
      break;
    case 0x64u:
      double result = @"GMTP";
      break;
    case 0x67u:
      double result = @"PIM";
      break;
    case 0x6Cu:
      double result = @"IPCOMP";
      break;
    case 0x71u:
      double result = @"PGM";
      break;
    case 0x84u:
      double result = @"SCTP";
      break;
    default:
      double result = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"IPProto(%u)", v1);
      break;
  }
  return result;
}

void *createIOVecString(uint64_t a1, unsigned int a2)
{
  uint64_t v4 = a2;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"ioVec[%u]{", a2);
  if (a2)
  {
    uint64_t v6 = (_DWORD *)(a1 + 8);
    do
    {
      id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
      uint64_t v8 = *((void *)v6 - 1);
      unsigned int v9 = *v6;
      v6 += 4;
      [v5 appendFormat:@"%p:%@%u;", v8, v7, v9];

      --v4;
    }
    while (v4);
  }
  [v5 appendString:@"}"];
  return v5;
}

void *createIOVecStringWithContents(uint64_t a1, unsigned int a2)
{
  uint64_t v14 = a2;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithFormat:", @"ioVec[%u]{", a2);
  if (a2)
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
      objc_msgSend(v6, "appendFormat:", @"(");
      id v7 = (unsigned __int8 **)(a1 + 16 * v5);
      unsigned int v9 = (unsigned int *)(v7 + 1);
      unsigned int v8 = *((_DWORD *)v7 + 2);
      if (v8 >= 4) {
        unsigned int v8 = 4;
      }
      if (v8)
      {
        objc_msgSend(v6, "appendFormat:", @"%s%02x", "", **v7);
        unsigned int v10 = *v9;
        if (*v9 >= 4) {
          unsigned int v10 = 4;
        }
        if (v10 >= 2)
        {
          uint64_t v11 = 1;
          do
          {
            objc_msgSend(v6, "appendFormat:", @"%s%02x", " ", (*v7)[v11++]);
            unsigned int v12 = *v9;
            if (*v9 >= 4) {
              unsigned int v12 = 4;
            }
          }
          while (v12 > v11);
        }
      }
      [v6 appendFormat:@":"]);
      [v4 appendFormat:@"%p:%@%u;", *(void *)(a1 + 16 * v5), v6, *v9];

      ++v5;
    }
    while (v5 != v14);
  }
  [v4 appendString:@"}"];
  return v4;
}

BOOL isPacketValidIPv6(unsigned char *a1, unsigned int a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    if (a2 <= 0x27)
    {
      if (!gNRPacketLoggingEnabled) {
        return 0;
      }
      uint64_t v4 = nrCopyLogObj_1930();
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        uint64_t v5 = v4;
        BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

        if (!v6) {
          return 0;
        }
      }
      id v7 = nrCopyLogObj_1930();
      _NRLogWithArgs((uint64_t)v7, 1, (uint64_t)"%s%.30s:%-4d Packet too short for determining address family", v8, v9, v10, v11, v12, (uint64_t)"");

      return 0;
    }
    return (*a1 & 0xF0) == 96;
  }
  return result;
}

id nrCopyLogObj_1930()
{
  if (nrCopyLogObj_onceToken_1713 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_1713, &__block_literal_global_1714);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_1715;
  return v0;
}

uint64_t getDSCPFromPacket(unsigned char *a1, unsigned int a2)
{
  uint64_t result = isPacketValidIPv6(a1, a2);
  if (result) {
    return (bswap32(*(_DWORD *)a1) >> 22) & 0x3F;
  }
  return result;
}

uint64_t getESPSPIFromPacket(uint64_t a1, unsigned int a2)
{
  if (isPacketValidIPv6((unsigned char *)a1, a2) && isNextHeaderValidESP(a1, a2)) {
    return bswap32(*(_DWORD *)(a1 + 40));
  }
  else {
    return 0;
  }
}

BOOL isNextHeaderValidESP(uint64_t a1, unsigned int a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    if (a2 <= 0x28)
    {
      if (!gNRPacketLoggingEnabled) {
        return 0;
      }
      uint64_t v5 = nrCopyLogObj_1930();
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v6 = v5;
        BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

        if (!v7) {
          return 0;
        }
      }
      id v8 = nrCopyLogObj_1930();
      _NRLogWithArgs((uint64_t)v8, 1, (uint64_t)"%s%.30s:%-4d Packet too short for determining next header", v9, v10, v11, v12, v13, (uint64_t)"");

      return 0;
    }
    return *(unsigned char *)(a1 + 6) == 50 && a2 > 0x2F;
  }
  return result;
}

uint64_t getESPSequenceNumberFromPacket(uint64_t a1, unsigned int a2)
{
  if (isPacketValidIPv6((unsigned char *)a1, a2) && isNextHeaderValidESP(a1, a2)) {
    return bswap32(*(_DWORD *)(a1 + 44));
  }
  else {
    return 0;
  }
}

uint64_t createPacketString(unsigned __int8 *a1, uint64_t a2)
{
  int v2 = @"nil";
  if (a1)
  {
    __int16 v3 = a2;
    if (a2)
    {
      if (a2 <= 0x27) {
        return objc_msgSend([NSString alloc], "initWithFormat:", @"IPv%u too short %u", *a1 >> 4, a2);
      }
      id v6 = objc_alloc(MEMORY[0x263F089D8]);
      uint64_t v7 = *a1 >> 4;
      if (v7 == 6)
      {
        unsigned int v8 = *(_DWORD *)a1;
        uint64_t v9 = (bswap32(*(_DWORD *)a1) >> 22) & 0x3F;
        uint64_t v10 = &stru_26BE156B0;
        if (v9)
        {
          uint64_t v23 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"DSCP:0x%02x ", v9);
          unsigned int v8 = *(_DWORD *)a1;
        }
        else
        {
          uint64_t v23 = &stru_26BE156B0;
        }
        uint64_t v12 = @"CE ";
        if ((v8 & 0x1000) != 0)
        {
          uint64_t v13 = @"ECT(1) ";
        }
        else
        {
          uint64_t v12 = @"ECT(0) ";
          uint64_t v13 = &stru_26BE156B0;
        }
        if ((v8 & 0x2000) != 0) {
          uint64_t v14 = v12;
        }
        else {
          uint64_t v14 = v13;
        }
        unsigned int v15 = v8 & 0xFFFF0F00;
        id v22 = v6;
        if (v15) {
          uint64_t v10 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"FlowLabel:0x%03x ", bswap32(v15));
        }
        id v16 = [NSString alloc];
        IPv6AddrString = createIPv6AddrString((_DWORD *)a1 + 2);
        uint64_t v18 = createIPv6AddrString((_DWORD *)a1 + 6);
        uint64_t v19 = a1[7];
        uint64_t v20 = bswap32(*((unsigned __int16 *)a1 + 2)) >> 16;
        IPProtoString = createIPProtoString(a1[6]);
        uint64_t v11 = (void *)[v16 initWithFormat:@"%@ -> %@ hlim %u %@%@%@len %u %@", IPv6AddrString, v18, v19, v23, v14, v10, v20, IPProtoString];

        id v6 = v22;
      }
      else
      {
        uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"IPv%u", v7);
      }
      int v2 = (__CFString *)[v6 initWithString:v11];

      if ((v3 & 0xFFF8) != 0x28 && a1[6] == 50) {
        [(__CFString *)v2 appendFormat:@" SPI 0x%08x seq %u", bswap32(*((_DWORD *)a1 + 10)), bswap32(*((_DWORD *)a1 + 11))];
      }
    }
  }
  return (uint64_t)v2;
}

uint64_t nrTLVToPacket(uint64_t a1, uint64_t a2, _OWORD *a3, unsigned int a4, uint64_t a5, uint64_t a6, _OWORD *a7, _OWORD *a8)
{
  unsigned int v9 = a4;
  unsigned int v10 = a2;
  uint64_t v292 = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    if (a6 < a4)
    {
      LOWORD(v9) = 0;
      return (unsigned __int16)v9;
    }
    if (!a4) {
      return (unsigned __int16)v9;
    }
    if (a1)
    {
      if (a2)
      {
        if (a5)
        {
          uint64_t v14 = 0;
          unsigned int v15 = 0;
          uint64_t v16 = 16 * a2;
          unsigned int v17 = 3;
          while (1)
          {
            unsigned int v18 = *(_DWORD *)(a1 + v14 + 8);
            if (!v17) {
              goto LABEL_23;
            }
            if (v17 <= v18) {
              break;
            }
            v17 -= v18;
LABEL_19:
            v14 += 16;
            if (v16 == v14) {
              goto LABEL_28;
            }
          }
          if (v17 < v18)
          {
LABEL_23:
            unsigned int v19 = v18 - v17;
            if (v19 >= v9 - v15) {
              size_t v20 = v9 - v15;
            }
            else {
              size_t v20 = v19;
            }
            memcpy((void *)(a5 + v15), (const void *)(*(void *)(a1 + v14) + v17), v20);
            v15 += v20;
            if (v15 >= v9)
            {
LABEL_28:
              if (v15 == v9) {
                return (unsigned __int16)v9;
              }
              uint64_t v142 = nrCopyLogObj_1930();
              uint64_t v143 = v142;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v144 = os_log_type_enabled(v142, OS_LOG_TYPE_ERROR);

                if (!v144)
                {
LABEL_222:
                  _os_log_pack_size();
                  MEMORY[0x270FA5388]();
                  __error();
                  uint64_t v235 = _os_log_pack_fill();
                  IOVecString = createIOVecString(a1, v10);
                  __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v235, (uint64_t)"nrWriteIOVecToBuffer", v15, v9, 3, (uint64_t)IOVecString);
                  id v237 = nrCopyLogObj_1930();
                  _NRLogAbortWithPack(v237);
                }
              }
              id v229 = nrCopyLogObj_1930();
              uint64_t v280 = createIOVecString(a1, v10);
              _NRLogWithArgs((uint64_t)v229, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%"
                         "u), offset: %u, ioVec: %@",
                v230,
                v231,
                v232,
                v233,
                v234,
                (uint64_t)"");

              goto LABEL_222;
            }
          }
          unsigned int v17 = 0;
          goto LABEL_19;
        }
        BOOL v133 = nrCopyLogObj_1930();
        os_log_t v134 = v133;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v135 = os_log_type_enabled(v133, OS_LOG_TYPE_ERROR);

          if (!v135) {
            goto LABEL_219;
          }
        }
        id v223 = nrCopyLogObj_1930();
        _NRLogWithArgs((uint64_t)v223, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (outBuffer) != ((void *)0)", v224, v225, v226, v227, v228, (uint64_t)"");
      }
      else
      {
        BOOL v124 = nrCopyLogObj_1930();
        os_log_t v125 = v124;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v126 = os_log_type_enabled(v124, OS_LOG_TYPE_ERROR);

          if (!v126) {
            goto LABEL_219;
          }
        }
        id v217 = nrCopyLogObj_1930();
        _NRLogWithArgs((uint64_t)v217, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v218, v219, v220, v221, v222, (uint64_t)"");
      }
    }
    else
    {
      uint64_t v115 = nrCopyLogObj_1930();
      uint64_t v116 = v115;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v117 = os_log_type_enabled(v115, OS_LOG_TYPE_ERROR);

        if (!v117) {
          goto LABEL_219;
        }
      }
      id v211 = nrCopyLogObj_1930();
      _NRLogWithArgs((uint64_t)v211, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (ioVecs) != ((void *)0)", v212, v213, v214, v215, v216, (uint64_t)"");
    }
LABEL_219:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v163 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v163 = 136446210;
    os_log_t v164 = "nrWriteIOVecToBuffer";
LABEL_184:
    *(void *)(v163 + 4) = v164;
    id v165 = nrCopyLogObj_1930();
    _NRLogAbortWithPack(v165);
  }
  if (!a1)
  {
    unint64_t v67 = nrCopyLogObj_1930();
    unsigned int v68 = v67;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v69 = os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);

      if (!v69) {
        goto LABEL_183;
      }
    }
    id v109 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v109, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (ioVecs) != ((void *)0)", v110, v111, v112, v113, v114, (uint64_t)"");

LABEL_183:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v163 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v163 = 136446210;
    os_log_t v164 = "nr6LoWPANTLVToPacket";
    goto LABEL_184;
  }
  if (!a2)
  {
    os_log_t v70 = nrCopyLogObj_1930();
    int v71 = v70;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v72 = os_log_type_enabled(v70, OS_LOG_TYPE_ERROR);

      if (!v72) {
        goto LABEL_183;
      }
    }
    id v118 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v118, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v119, v120, v121, v122, v123, (uint64_t)"");

    goto LABEL_183;
  }
  if (!a4)
  {
    os_log_t v73 = nrCopyLogObj_1930();
    os_log_t v74 = v73;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v75 = os_log_type_enabled(v73, OS_LOG_TYPE_ERROR);

      if (!v75) {
        goto LABEL_183;
      }
    }
    id v127 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v127, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: tlvLen > 0", v128, v129, v130, v131, v132, (uint64_t)"");

    goto LABEL_183;
  }
  if (!a5)
  {
    unsigned int v76 = nrCopyLogObj_1930();
    unint64_t v77 = v76;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v78 = os_log_type_enabled(v76, OS_LOG_TYPE_ERROR);

      if (!v78) {
        goto LABEL_183;
      }
    }
    id v136 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v136, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (packetBuffer) != ((void *)0)", v137, v138, v139, v140, v141, (uint64_t)"");

    goto LABEL_183;
  }
  if (a6 <= 0x27)
  {
    BOOL v79 = nrCopyLogObj_1930();
    unsigned int v80 = v79;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v81 = os_log_type_enabled(v79, OS_LOG_TYPE_ERROR);

      if (!v81) {
        goto LABEL_183;
      }
    }
    id v145 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v145, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: packetLength >= sizeof(NRIPv6Hdr_s)", v146, v147, v148, v149, v150, (uint64_t)"");

    goto LABEL_183;
  }
  if (!a7)
  {
    uint64_t v82 = nrCopyLogObj_1930();
    int v83 = v82;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v84 = os_log_type_enabled(v82, OS_LOG_TYPE_ERROR);

      if (!v84) {
        goto LABEL_183;
      }
    }
    id v151 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v151, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (srcAddr) != ((void *)0)", v152, v153, v154, v155, v156, (uint64_t)"");

    goto LABEL_183;
  }
  if (!a8)
  {
    uint64_t v85 = nrCopyLogObj_1930();
    os_log_t v86 = v85;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v87 = os_log_type_enabled(v85, OS_LOG_TYPE_ERROR);

      if (!v87) {
        goto LABEL_183;
      }
    }
    id v157 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v157, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (dstAddr) != ((void *)0)", v158, v159, v160, v161, v162, (uint64_t)"");

    goto LABEL_183;
  }
  uint64_t v12 = a3;
  uint64_t v289 = a2;
  uint64_t v286 = a6;
  uint64_t v287 = &v282;
  switch((int)a3)
  {
    case 'd':
      uint64_t v13 = &nrKnownIPv6HdrESP;
      goto LABEL_66;
    case 'e':
      uint64_t v13 = &nrKnownIPv6HdrESP_ECT0;
      goto LABEL_66;
    case 'f':
      uint64_t v13 = &nrKnownIPv6HdrTCP;
      goto LABEL_66;
    case 'g':
      uint64_t v13 = &nrKnownIPv6HdrTCP_ECT0;
      goto LABEL_66;
    case 'h':
      uint64_t v13 = &nrKnownIPv6HdrESP_ClassC;
      goto LABEL_66;
    case 'i':
      uint64_t v13 = &nrKnownIPv6HdrESP_ClassC_ECT0;
      goto LABEL_66;
    default:
      if (a3 != 3)
      {
        if (nrCopyLogObj_onceToken_1713 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1713, &__block_literal_global_1714);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1715, OS_LOG_TYPE_FAULT))
        {
          id v28 = (id)nrCopyLogObj_sNRLogObj_1715;
          StringFromNRTLVType = createStringFromNRTLVType(v12);
          _NRLogWithArgs((uint64_t)v28, 17, (uint64_t)"unexpected tlvType %@", v30, v31, v32, v33, v34, (uint64_t)StringFromNRTLVType);

          unsigned __int16 v27 = 0;
          goto LABEL_102;
        }
        goto LABEL_210;
      }
      if (a4 <= 1)
      {
        if (nrCopyLogObj_onceToken_1713 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_1713, &__block_literal_global_1714);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_1715, OS_LOG_TYPE_ERROR))
        {
          id v21 = nrCopyLogObj_1930();
          _NRLogWithArgs((uint64_t)v21, 16, (uint64_t)"%s%.30s:%-4d received 6LoWPAN TLV too short %u", v22, v23, v24, v25, v26, (uint64_t)"");
LABEL_37:

          unsigned __int16 v27 = 0;
          goto LABEL_102;
        }
LABEL_210:
        unsigned __int16 v27 = 0;
        goto LABEL_102;
      }
      uint64_t v286 = a6;
      uint64_t v287 = &v282;
      uint64_t v285 = &v282;
      uint64_t v35 = 0;
      unsigned int v36 = 0;
      if (a4 >= 0x2A) {
        unsigned int v37 = 42;
      }
      else {
        unsigned int v37 = a4;
      }
      uint64_t v288 = 16 * a2;
      unsigned int v38 = 3;
      break;
  }
  while (1)
  {
    unsigned int v39 = *(_DWORD *)(a1 + v35 + 8);
    if (!v38) {
      break;
    }
    if (v38 <= v39)
    {
      if (v38 >= v39)
      {
        unsigned int v38 = 0;
        goto LABEL_53;
      }
      break;
    }
    v38 -= v39;
LABEL_53:
    v35 += 16;
    if (v288 == v35) {
      goto LABEL_64;
    }
  }
  long long v40 = a7;
  uint64_t v41 = v12;
  uint64_t v12 = a8;
  unsigned int v42 = v39 - v38;
  if (v42 >= v37 - v36) {
    size_t v43 = v37 - v36;
  }
  else {
    size_t v43 = v42;
  }
  memcpy(&v291[v36], (const void *)(*(void *)(a1 + v35) + v38), v43);
  v36 += v43;
  if (v36 < v37)
  {
    unsigned int v38 = 0;
    a8 = v12;
    uint64_t v12 = v41;
    a7 = v40;
    goto LABEL_53;
  }
  a8 = v12;
  LODWORD(v12) = v41;
  a7 = v40;
LABEL_64:
  if (v36 != v37)
  {
    BOOL v255 = nrCopyLogObj_1930();
    os_log_t v256 = v255;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v257 = os_log_type_enabled(v255, OS_LOG_TYPE_ERROR);

      if (!v257) {
        goto LABEL_252;
      }
    }
    id v263 = nrCopyLogObj_1930();
    BOOL v281 = createIOVecString(a1, v289);
    _NRLogWithArgs((uint64_t)v263, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%u), offset: %u, ioVec: %@",
      v264,
      v265,
      v266,
      v267,
      v268,
      (uint64_t)"");

LABEL_252:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v269 = _os_log_pack_fill();
    os_log_t v179 = createIOVecString(a1, v289);
    uint64_t v180 = v269;
    int v181 = v36;
    int v182 = v37;
    int v183 = 3;
LABEL_203:
    __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v180, (uint64_t)"nrWriteIOVecToBuffer", v181, v182, v183, (uint64_t)v179);
    id v184 = nrCopyLogObj_1930();
    _NRLogAbortWithPack(v184);
  }
  uint64_t v13 = v291;
LABEL_66:
  uint64_t v290 = v13;
  if ((*v13 & 0xE0) != 0x60)
  {
    unsigned int v88 = nrCopyLogObj_1930();
    unsigned int v89 = v88;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v185 = os_log_type_enabled(v88, OS_LOG_TYPE_ERROR);

      if (!v185) {
        goto LABEL_249;
      }
    }
    id v186 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v186, 16, (uint64_t)"%s%.30s:%-4d received unknown 6LoWPAN dispatch %u", v187, v188, v189, v190, v191, (uint64_t)"");
    goto LABEL_248;
  }
  if (v13[1] < 0) {
    unsigned int v44 = 3;
  }
  else {
    unsigned int v44 = 2;
  }
  uint64_t v45 = &v13[v44];
  *(_DWORD *)a5 = 96;
  int v46 = (*v13 >> 3) & 3;
  switch(v46)
  {
    case 3:
      unsigned int v47 = 0;
      break;
    case 0:
      __int16 v90 = *(_WORD *)(v45 + 1);
      *(unsigned char *)(a5 + 3) = v45[3];
      *(_WORD *)(a5 + 1) = v90;
      unsigned int v47 = 4;
      goto LABEL_224;
    case 1:
      __int16 v166 = *(_WORD *)v45;
      *(unsigned char *)(a5 + 3) = v45[2];
      *(_WORD *)(a5 + 1) = v166;
      if (*v45 < 0)
      {
        *(_DWORD *)a5 |= 0x2000u;
        unsigned int v47 = 3;
        if ((*v45 & 0x40) != 0) {
          goto LABEL_242;
        }
      }
      else
      {
        unsigned int v47 = 3;
        if ((*v45 & 0x40) != 0)
        {
LABEL_242:
          unsigned int v238 = 4096;
          goto LABEL_225;
        }
      }
      break;
    default:
      unsigned int v47 = 1;
LABEL_224:
      unsigned int v238 = bswap32(*v45 << 20);
LABEL_225:
      *(_DWORD *)a5 |= v238;
      break;
  }
  char v48 = *v13;
  if ((*v13 & 4) != 0)
  {
    uint64_t v91 = nrCopyLogObj_1930();
    int v92 = v91;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v192 = os_log_type_enabled(v91, OS_LOG_TYPE_ERROR);

      if (!v192) {
        goto LABEL_210;
      }
    }
    id v21 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v21, 16, (uint64_t)"%s%.30s:%-4d can't handle NH=1 yet", v193, v194, v195, v196, v197, (uint64_t)"");
    goto LABEL_37;
  }
  *(unsigned char *)(a5 + 6) = v45[v47];
  uint64_t v288 = v47 + 1;
  int v49 = v48 & 3;
  if (v49 == 2)
  {
    char v50 = 64;
    goto LABEL_74;
  }
  if (v49)
  {
    if (v49 == 1) {
      char v50 = 1;
    }
    else {
      char v50 = -1;
    }
LABEL_74:
    *(unsigned char *)(a5 + 7) = v50;
  }
  else
  {
    *(unsigned char *)(a5 + 7) = v45[v288];
    uint64_t v288 = v47 + 2;
  }
  unsigned int v51 = v13[1];
  int v52 = (v51 >> 4) & 3;
  if ((v51 & 0x40) != 0)
  {
    if (v52 == 3)
    {
LABEL_77:
      *(_OWORD *)(a5 + 8) = *a7;
      goto LABEL_78;
    }
    if (!v52)
    {
      *(void *)(a5 + 8) = 0;
      *(void *)(a5 + 16) = 0;
      goto LABEL_78;
    }
    if (v52 != 1)
    {
      *(_OWORD *)(a5 + 8) = *a7;
      int v239 = v288;
      *(_WORD *)(a5 + 16) = *(_WORD *)&v45[v288];
      goto LABEL_228;
    }
    *(void *)(a5 + 8) = *(void *)a7;
LABEL_196:
    int v169 = v288;
    *(void *)(a5 + 16) = *(void *)&v45[v288];
    uint64_t v170 = (v169 + 8);
  }
  else
  {
    switch(v52)
    {
      case 3:
        goto LABEL_77;
      case 0:
        int v97 = v288;
        *(_OWORD *)(a5 + 8) = *(_OWORD *)&v45[v288];
        uint64_t v288 = v97 | 0x10u;
        goto LABEL_78;
      case 1:
        *(_WORD *)(a5 + 8) = -32514;
        *(_DWORD *)(a5 + 10) = 0;
        *(_WORD *)(a5 + 14) = 0;
        goto LABEL_196;
    }
    *(_WORD *)(a5 + 8) = -32514;
    *(void *)(a5 + 10) = 0;
    *(_WORD *)(a5 + 19) = -257;
    *(unsigned char *)(a5 + 21) = 0;
    int v239 = v288;
    *(_WORD *)(a5 + 22) = *(_WORD *)&v45[v288];
LABEL_228:
    uint64_t v170 = (v239 + 2);
  }
  uint64_t v288 = v170;
LABEL_78:
  int v53 = v13[1] & 3;
  if ((v13[1] & 8) != 0)
  {
    if ((v13[1] & 4) == 0)
    {
      if (v53 == 2)
      {
        *(unsigned char *)(a5 + 24) = -1;
        int v247 = v288;
        os_log_t v248 = (unsigned __int8 *)&v45[v288];
        *(unsigned char *)(a5 + 25) = *v248;
        *(void *)(a5 + 26) = 0;
        *(_DWORD *)(a5 + 33) = 0;
        __int16 v249 = *(_WORD *)(v248 + 1);
        *(unsigned char *)(a5 + 39) = v248[3];
        *(_WORD *)(a5 + 37) = v249;
        uint64_t v250 = (v247 + 4);
      }
      else
      {
        if (v53 != 1)
        {
          if ((v13[1] & 3) != 0)
          {
            *(void *)(a5 + 31) = 0;
            *(void *)(a5 + 24) = 767;
            int v254 = v288;
            *(unsigned char *)(a5 + 39) = v45[v288];
            uint64_t v94 = (v254 + 1);
          }
          else
          {
            int v93 = v288;
            *(_OWORD *)(a5 + 24) = *(_OWORD *)&v45[v288];
            uint64_t v94 = (v93 + 16);
          }
          uint64_t v288 = v94;
          uint64_t v54 = v286;
          goto LABEL_82;
        }
        *(unsigned char *)(a5 + 24) = -1;
        int v251 = v288;
        uint64_t v252 = (unsigned __int8 *)&v45[v288];
        *(unsigned char *)(a5 + 25) = *v252;
        *(void *)(a5 + 26) = 0;
        *(unsigned char *)(a5 + 34) = 0;
        int v253 = *(_DWORD *)(v252 + 1);
        *(unsigned char *)(a5 + 39) = v252[5];
        *(_DWORD *)(a5 + 35) = v253;
        uint64_t v250 = (v251 + 6);
      }
      uint64_t v288 = v250;
      uint64_t v54 = v286;
      goto LABEL_82;
    }
    uint64_t v167 = nrCopyLogObj_1930();
    uint64_t v168 = v167;
    if (sNRCopyLogToStdErr)
    {

      if (!v53) {
        goto LABEL_247;
      }
    }
    else
    {
      BOOL v241 = os_log_type_enabled(v167, OS_LOG_TYPE_ERROR);

      if (!v53)
      {
        if (!v241) {
          goto LABEL_249;
        }
LABEL_247:
        id v186 = nrCopyLogObj_1930();
        _NRLogWithArgs((uint64_t)v186, 16, (uint64_t)"%s%.30s:%-4d can't handle M=1 DAC=1 DAM=00 yet", v258, v259, v260, v261, v262, (uint64_t)"");
        goto LABEL_248;
      }
      if (!v241) {
        goto LABEL_249;
      }
    }
    id v186 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v186, 16, (uint64_t)"%s%.30s:%-4d M=1 DAC=1 DAM!=00 is reserved", v242, v243, v244, v245, v246, (uint64_t)"");
    goto LABEL_248;
  }
  uint64_t v54 = v286;
  if ((v13[1] & 4) == 0)
  {
    if (v53 == 3) {
      goto LABEL_81;
    }
    if ((v13[1] & 3) == 0)
    {
      int v100 = v288;
      *(_OWORD *)(a5 + 24) = *(_OWORD *)&v45[v288];
      uint64_t v101 = (v100 + 16);
      goto LABEL_232;
    }
    if (v53 == 1)
    {
      *(_WORD *)(a5 + 24) = -32514;
      *(_DWORD *)(a5 + 26) = 0;
      *(_WORD *)(a5 + 30) = 0;
      goto LABEL_199;
    }
    *(_WORD *)(a5 + 24) = -32514;
    *(void *)(a5 + 26) = 0;
    *(_WORD *)(a5 + 35) = -257;
    *(unsigned char *)(a5 + 37) = 0;
    int v240 = v288;
    *(_WORD *)(a5 + 38) = *(_WORD *)&v45[v288];
LABEL_231:
    uint64_t v101 = (v240 + 2);
    goto LABEL_232;
  }
  if (v53 == 3)
  {
LABEL_81:
    *(_OWORD *)(a5 + 24) = *a8;
  }
  else
  {
    if ((v13[1] & 3) == 0)
    {
      uint64_t v98 = nrCopyLogObj_1930();
      uint64_t v99 = v98;
      if (sNRCopyLogToStdErr)
      {

        goto LABEL_260;
      }
      BOOL v270 = os_log_type_enabled(v98, OS_LOG_TYPE_ERROR);

      if (v270)
      {
LABEL_260:
        id v186 = nrCopyLogObj_1930();
        _NRLogWithArgs((uint64_t)v186, 16, (uint64_t)"%s%.30s:%-4d M=0 DAC=1 DAM=00 is reserved", v271, v272, v273, v274, v275, (uint64_t)"");
LABEL_248:
      }
LABEL_249:
      unsigned __int16 v27 = 0;
      goto LABEL_102;
    }
    if (v53 != 1)
    {
      *(_OWORD *)(a5 + 24) = *a8;
      int v240 = v288;
      *(_WORD *)(a5 + 32) = *(_WORD *)&v45[v288];
      goto LABEL_231;
    }
    *(void *)(a5 + 24) = *(void *)a8;
LABEL_199:
    int v171 = v288;
    *(void *)(a5 + 32) = *(void *)&v45[v288];
    uint64_t v101 = (v171 + 8);
LABEL_232:
    uint64_t v288 = v101;
  }
LABEL_82:
  int v55 = v44 + v288;
  if (v12 != 3) {
    int v55 = 0;
  }
  *(_WORD *)(a5 + 4) = bswap32(v9 - v55) >> 16;
  unsigned __int16 v27 = v9 - v55 + 40;
  if (v27 > v54)
  {
    BOOL v95 = nrCopyLogObj_1930();
    os_log_t v96 = v95;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v198 = os_log_type_enabled(v95, OS_LOG_TYPE_ERROR);

      if (!v198) {
        goto LABEL_210;
      }
    }
    id v21 = nrCopyLogObj_1930();
    uint64_t v276 = createStringFromNRTLVType(v12);
    _NRLogWithArgs((uint64_t)v21, 16, (uint64_t)"%s%.30s:%-4d packet too big %@ tlvLen=%u payloadLength=%u packetLength=%u", v199, v200, v201, v202, v203, (uint64_t)"");

    goto LABEL_37;
  }
  uint64_t v284 = (unsigned __int16)(v9 - v55 + 40);
  if (v55 == v9) {
    goto LABEL_101;
  }
  uint64_t v285 = &v282;
  LODWORD(v286) = v9 - v55 + 40;
  uint64_t v56 = 0;
  unsigned int v57 = 0;
  uint64_t v58 = (v55 + 3);
  unsigned int v59 = (unsigned __int16)(v9 - v55);
  if (v289 <= 1) {
    unsigned int v60 = 1;
  }
  else {
    unsigned int v60 = v289;
  }
  uint64_t v61 = 16 * v60;
  uint64_t v283 = v58;
  unsigned int v62 = v58;
  while (2)
  {
    unsigned int v63 = *(_DWORD *)(a1 + v56 + 8);
    if (v62)
    {
      if (v62 > v63)
      {
        v62 -= v63;
      }
      else
      {
        if (v62 < v63) {
          break;
        }
LABEL_99:
        unsigned int v62 = 0;
      }
      v56 += 16;
      if (v61 == v56) {
        goto LABEL_100;
      }
      continue;
    }
    break;
  }
  unsigned int v64 = v63 - v62;
  if (v64 >= v59 - v57) {
    size_t v65 = v59 - v57;
  }
  else {
    size_t v65 = v64;
  }
  memcpy((void *)(a5 + 40 + v57), (const void *)(*(void *)(a1 + v56) + v62), v65);
  v57 += v65;
  if (v57 < v59) {
    goto LABEL_99;
  }
LABEL_100:
  unsigned __int16 v27 = v286;
  if (v57 != v59)
  {
    os_log_t v102 = nrCopyLogObj_1930();
    os_log_t v103 = v102;
    if (sNRCopyLogToStdErr)
    {

      unsigned int v105 = v289;
      int v106 = v283;
    }
    else
    {
      BOOL v104 = os_log_type_enabled(v102, OS_LOG_TYPE_ERROR);

      unsigned int v105 = v289;
      int v106 = v283;
      if (!v104) {
        goto LABEL_202;
      }
    }
    id v172 = nrCopyLogObj_1930();
    uint64_t v278 = createIOVecString(a1, v105);
    _NRLogWithArgs((uint64_t)v172, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%u), offset: %u, ioVec: %@",
      v173,
      v174,
      v175,
      v176,
      v177,
      (uint64_t)"");

LABEL_202:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v178 = _os_log_pack_fill();
    os_log_t v179 = createIOVecString(a1, v105);
    uint64_t v180 = v178;
    int v181 = v57;
    int v182 = v59;
    int v183 = v106;
    goto LABEL_203;
  }
LABEL_101:
  if (!gNRPacketLoggingEnabled) {
    goto LABEL_102;
  }
  os_log_t v107 = nrCopyLogObj_1930();
  os_log_t v108 = v107;
  if (sNRCopyLogToStdErr)
  {

    goto LABEL_212;
  }
  BOOL v204 = os_log_type_enabled(v107, OS_LOG_TYPE_INFO);

  if (v204)
  {
LABEL_212:
    id v205 = nrCopyLogObj_1930();
    uint64_t v277 = NRDCreateIPHCString((unsigned __int16 *)&v290, (int)v288 + 2);
    PacketString = (void *)createPacketString((unsigned __int8 *)a5, v54);
    _NRLogWithArgs((uint64_t)v205, 1, (uint64_t)"%s%.30s:%-4d Decompressed 6LoWPAN data from %u to %u, %@ to %@", v206, v207, v208, v209, v210, (uint64_t)"");
  }
LABEL_102:
  LOWORD(v9) = v27;
  return (unsigned __int16)v9;
}

__CFString *NRDCreateIPHCString(unsigned __int16 *a1, unsigned int a2)
{
  if (!a1) {
    return @"nil";
  }
  int v4 = bswap32(*a1);
  id v5 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v6 = 48;
  if ((v4 & 0x20000) != 0) {
    uint64_t v7 = 49;
  }
  else {
    uint64_t v7 = 48;
  }
  uint64_t v38 = v7;
  if ((v4 & 0x40000) != 0) {
    uint64_t v8 = 49;
  }
  else {
    uint64_t v8 = 48;
  }
  if ((v4 & 0x80000) != 0) {
    uint64_t v9 = 49;
  }
  else {
    uint64_t v9 = 48;
  }
  uint64_t v36 = v9;
  uint64_t v37 = v8;
  if ((v4 & 0x100000) != 0) {
    uint64_t v10 = 49;
  }
  else {
    uint64_t v10 = 48;
  }
  if ((v4 & 0x200000) != 0) {
    uint64_t v11 = 49;
  }
  else {
    uint64_t v11 = 48;
  }
  uint64_t v34 = v11;
  uint64_t v35 = v10;
  if ((v4 & 0x400000) != 0) {
    uint64_t v12 = 49;
  }
  else {
    uint64_t v12 = 48;
  }
  if ((v4 & 0x800000) != 0) {
    uint64_t v13 = 49;
  }
  else {
    uint64_t v13 = 48;
  }
  uint64_t v32 = v13;
  uint64_t v33 = v12;
  if ((v4 & 0x1000000) != 0) {
    uint64_t v14 = 49;
  }
  else {
    uint64_t v14 = 48;
  }
  if ((v4 & 0x2000000) != 0) {
    uint64_t v15 = 49;
  }
  else {
    uint64_t v15 = 48;
  }
  uint64_t v30 = v15;
  uint64_t v31 = v14;
  if ((v4 & 0x4000000) != 0) {
    uint64_t v16 = 49;
  }
  else {
    uint64_t v16 = 48;
  }
  if ((v4 & 0x8000000) != 0) {
    uint64_t v17 = 49;
  }
  else {
    uint64_t v17 = 48;
  }
  uint64_t v28 = v17;
  uint64_t v29 = v16;
  if ((v4 & 0x10000000) != 0) {
    uint64_t v18 = 49;
  }
  else {
    uint64_t v18 = 48;
  }
  if ((v4 & 0x20000000) != 0) {
    uint64_t v19 = 49;
  }
  else {
    uint64_t v19 = 48;
  }
  uint64_t v27 = v18;
  if ((v4 & 0x40000000) != 0) {
    uint64_t v20 = 49;
  }
  else {
    uint64_t v20 = 48;
  }
  if (v4 >> 16 < 0) {
    uint64_t v6 = 49;
  }
  id v21 = objc_msgSend(v5, "initWithFormat:", @"[D%c%c%cTF%c%cNH%cHLIM%c%cCID%cSAC%cSAM%c%cM%cDAC%cDAM%c%c", v6, v20, v19, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, HIWORD(v4) & 1 | 0x30);
  uint64_t v22 = v21;
  if (a2 >= 3)
  {
    [v21 appendString:@" "];
    uint64_t v23 = a2 - 2;
    uint64_t v24 = (unsigned __int8 *)(a1 + 1);
    do
    {
      unsigned int v25 = *v24++;
      objc_msgSend(v22, "appendFormat:", @"%02x", v25);
      --v23;
    }
    while (v23);
  }
  [v22 appendString:@"]"];
  return (__CFString *)v22;
}

uint64_t nrMaxTLVLengthForPacket(uint64_t a1, int a2)
{
  if (!a1)
  {
    __int16 v3 = nrCopyLogObj_1930();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      int v4 = v3;
      BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (!v5) {
        goto LABEL_14;
      }
    }
    id v9 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (packetBuffer) != ((void *)0)", v10, v11, v12, v13, v14, (uint64_t)"");

    goto LABEL_14;
  }
  if (!a2)
  {
    uint64_t v6 = nrCopyLogObj_1930();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      uint64_t v7 = v6;
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_14:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v21 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v21 = 136446210;
        *(void *)(v21 + 4) = "nrMaxTLVLengthForPacket";
        id v22 = nrCopyLogObj_1930();
        _NRLogAbortWithPack(v22);
      }
    }
    id v15 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v15, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: packetLength > 0", v16, v17, v18, v19, v20, (uint64_t)"");

    goto LABEL_14;
  }
  return (a2 + 5);
}

uint64_t nrMaxPacketLengthForTLV(uint64_t a1, int a2)
{
  if (!a2)
  {
    __int16 v3 = nrCopyLogObj_1930();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      int v4 = v3;
      BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (!v5)
      {
LABEL_8:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v12 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v12 = 136446210;
        *(void *)(v12 + 4) = "nrMaxPacketLengthForTLV";
        id v13 = nrCopyLogObj_1930();
        _NRLogAbortWithPack(v13);
      }
    }
    id v6 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v6, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: tlvLen > 0", v7, v8, v9, v10, v11, (uint64_t)"");

    goto LABEL_8;
  }
  return (unsigned __int16)(a2 + 40);
}

uint64_t nrPacketToTLV(unsigned __int8 *a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v458 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    os_log_t v103 = nrCopyLogObj_1930();
    BOOL v104 = v103;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v105 = os_log_type_enabled(v103, OS_LOG_TYPE_ERROR);

      if (!v105) {
        goto LABEL_221;
      }
    }
    id v136 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v136, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (packetBuffer) != ((void *)0)", v137, v138, v139, v140, v141, (uint64_t)"");

LABEL_221:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v154 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v154 = 136446210;
    uint64_t v155 = "nrPacketToTLV";
    goto LABEL_341;
  }
  if (!a2)
  {
    int v106 = nrCopyLogObj_1930();
    os_log_t v107 = v106;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v108 = os_log_type_enabled(v106, OS_LOG_TYPE_ERROR);

      if (!v108) {
        goto LABEL_221;
      }
    }
    id v142 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v142, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: packetLength > 0", v143, v144, v145, v146, v147, (uint64_t)"");

    goto LABEL_221;
  }
  uint64_t v6 = a3;
  if (!a3)
  {
    id v109 = nrCopyLogObj_1930();
    uint64_t v110 = v109;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v111 = os_log_type_enabled(v109, OS_LOG_TYPE_ERROR);

      if (!v111) {
        goto LABEL_221;
      }
    }
    id v148 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v148, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (ioVecs) != ((void *)0)", v149, v150, v151, v152, v153, (uint64_t)"");

    goto LABEL_221;
  }
  if (!a4)
  {
    uint64_t v112 = nrCopyLogObj_1930();
    uint64_t v113 = v112;
    uint64_t v94 = "nrPacketToTLV";
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v114 = os_log_type_enabled(v112, OS_LOG_TYPE_ERROR);

      if (!v114) {
        goto LABEL_224;
      }
    }
    id v156 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v156, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 0", v157, v158, v159, v160, v161, (uint64_t)"");

LABEL_224:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    goto LABEL_167;
  }
  if (!a5)
  {
    uint64_t v115 = nrCopyLogObj_1930();
    uint64_t v116 = v115;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v117 = os_log_type_enabled(v115, OS_LOG_TYPE_ERROR);

      if (!v117) {
        goto LABEL_229;
      }
    }
    id v162 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v162, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (srcAddr) != ((void *)0)", v163, v164, v165, v166, v167, (uint64_t)"");

LABEL_229:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v154 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v154 = 136446210;
    uint64_t v155 = "nrPacketTo6LoWPANTLV";
    goto LABEL_341;
  }
  if (!a6)
  {
    id v118 = nrCopyLogObj_1930();
    uint64_t v119 = v118;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v120 = os_log_type_enabled(v118, OS_LOG_TYPE_ERROR);

      if (!v120) {
        goto LABEL_229;
      }
    }
    id v168 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v168, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (dstAddr) != ((void *)0)", v169, v170, v171, v172, v173, (uint64_t)"");

    goto LABEL_229;
  }
  uint64_t v10 = a1;
  uint64_t v446 = a2;
  if (a2 <= 0x27)
  {
    uint64_t v121 = nrCopyLogObj_1930();
    uint64_t v122 = v121;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v186 = os_log_type_enabled(v121, OS_LOG_TYPE_INFO);

      if (!v186) {
        goto LABEL_294;
      }
    }
    id v187 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d no 6lo compression - too short %u", v188, v189, v190, v191, v192, (uint64_t)"");
    goto LABEL_293;
  }
  int v11 = *a1 >> 4;
  if (v11 != 6)
  {
    if (v11 == 4)
    {
      uint64_t v123 = nrCopyLogObj_1930();
      BOOL v124 = v123;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v240 = os_log_type_enabled(v123, OS_LOG_TYPE_INFO);

        if (!v240) {
          goto LABEL_294;
        }
      }
      id v187 = nrCopyLogObj_1930();
      IPProtoString = createIPProtoString(v10[9]);
      _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d no 6lo compression - IPv4 - %@", v241, v242, v243, v244, v245, (uint64_t)"");
    }
    else
    {
      uint64_t v174 = nrCopyLogObj_1930();
      uint64_t v175 = v174;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v246 = os_log_type_enabled(v174, OS_LOG_TYPE_INFO);

        if (!v246) {
          goto LABEL_294;
        }
      }
      id v187 = nrCopyLogObj_1930();
      _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d no 6lo compression - not IPv6 - v=%u", v247, v248, v249, v250, v251, (uint64_t)"");
    }
LABEL_293:

LABEL_294:
    **(unsigned char **)uint64_t v6 = 2;
    unsigned int v252 = *(_DWORD *)(v6 + 8);
    if (v252 > 2)
    {
      unsigned int v253 = v446;
      *(_WORD *)(*(void *)v6 + 1) = __rev16(v446);
      goto LABEL_296;
    }
    if (v252 == 2)
    {
      unsigned int v253 = v446;
      *(unsigned char *)(*(void *)v6 + 1) = BYTE1(v446);
      uint64_t v368 = *(unsigned char **)(v6 + 16);
    }
    else
    {
      uint64_t v381 = *(void *)(v6 + 16);
      if (*(_DWORD *)(v6 + 24) >= 2u)
      {
        unsigned int v253 = v446;
        *(_WORD *)uint64_t v381 = __rev16(v446);
LABEL_422:
        uint64_t v10 = a1;
LABEL_296:
        unsigned int v254 = 0;
        BOOL v255 = (unsigned int *)(v6 + 8);
        unsigned int v256 = 3;
        uint64_t v257 = a4;
        while (1)
        {
          unsigned int v258 = *v255;
          if (!v256) {
            goto LABEL_302;
          }
          if (v256 <= v258) {
            break;
          }
          v256 -= v258;
LABEL_298:
          v255 += 4;
          if (!--v257) {
            goto LABEL_307;
          }
        }
        if (v256 >= v258)
        {
LABEL_306:
          unsigned int v256 = 0;
          goto LABEL_298;
        }
LABEL_302:
        unsigned int v259 = v258 - v256;
        if (v259 >= v253 - v254) {
          size_t v260 = v253 - v254;
        }
        else {
          size_t v260 = v259;
        }
        memcpy((void *)(*((void *)v255 - 1) + v256), &v10[v254], v260);
        v254 += v260;
        if (v254 < v253) {
          goto LABEL_306;
        }
LABEL_307:
        if (v254 != v253) {
          goto LABEL_325;
        }
        uint64_t v261 = 0;
        unsigned int v262 = 0;
        uint64_t v263 = 0;
        int v264 = 0;
        unsigned int v265 = v253 + 3;
        uint64_t v266 = (unsigned int *)(v6 + 8);
        while (1)
        {
          unsigned int v267 = v265 - v262;
          if (v265 <= v262)
          {
            LODWORD(v268) = 0;
            goto LABEL_330;
          }
          if (*v266 >= v267) {
            uint64_t v268 = v267;
          }
          else {
            uint64_t v268 = *v266;
          }
          if (!v268)
          {
            BOOL v359 = nrCopyLogObj_1930();
            os_log_t v360 = v359;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v361 = os_log_type_enabled(v359, OS_LOG_TYPE_ERROR);

              if (!v361) {
                goto LABEL_386;
              }
            }
            id v362 = nrCopyLogObj_1930();
            _NRLogWithArgs((uint64_t)v362, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen > 0", v363, v364, v365, v366, v367, (uint64_t)"");

LABEL_386:
            _os_log_pack_size();
            MEMORY[0x270FA5388]();
            __error();
            uint64_t v154 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v154 = 136446210;
            uint64_t v155 = "nrChecksumUpdate";
            goto LABEL_341;
          }
          uint64_t v269 = (unsigned __int8 *)*((void *)v266 - 1);
          if (v264)
          {
            LOWORD(v457[0]) = 0;
            LOWORD(v457[0]) = *v269 << 8;
            uint64_t v263 = MEMORY[0x2105126A0](v457, 2, v263);
            if (v268 < 2) {
              goto LABEL_318;
            }
            BOOL v270 = v269 + 1;
            uint64_t v271 = (v268 - 1);
          }
          else
          {
            BOOL v270 = (unsigned __int8 *)*((void *)v266 - 1);
            uint64_t v271 = v268;
          }
          uint64_t v263 = MEMORY[0x2105126A0](v270, v271, v263);
LABEL_318:
          if (v268) {
            v264 ^= 1u;
          }
          v262 += v268;
          if (v262 >= v265 && v268 < *v266) {
            goto LABEL_330;
          }
          ++v261;
          v266 += 4;
          if (a4 == v261)
          {
            LOWORD(v261) = a4;
LABEL_330:
            if (v262 == v265)
            {
              int v275 = (unsigned __int16)v261;
              __int16 v276 = ~(_WORD)v263;
              uint64_t v277 = v6 + 16 * (unsigned __int16)v261;
              unsigned int v278 = *(_DWORD *)(v277 + 8);
              int v90 = v446;
              if (v278 >= (int)v268 + 2)
              {
                *(unsigned char *)(*(void *)v277 + v268) = v276;
                uint64_t v280 = (unsigned char *)(*(void *)v277 + v268 + 1);
                goto LABEL_337;
              }
              if (v278 < (int)v268 + 1)
              {
                BOOL v372 = nrCopyLogObj_1930();
                os_log_t v373 = v372;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v374 = os_log_type_enabled(v372, OS_LOG_TYPE_ERROR);

                  if (!v374) {
                    goto LABEL_419;
                  }
                }
                id v394 = nrCopyLogObj_1930();
                IOVecString = createIOVecString(v6, a4);
                _NRLogWithArgs((uint64_t)v394, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex].len >= bytesToCheckThisIOVec + 1;"
                           " %@, iovecIndex=%u bytesToCheckThisIOVec=%u",
                  v395,
                  v396,
                  v397,
                  v398,
                  v399,
                  (uint64_t)"");

                goto LABEL_419;
              }
              uint64_t v279 = (unsigned __int16)v261 + 1;
              if (v279 < a4)
              {
                if (*(_DWORD *)(v6 + 16 * v279 + 8))
                {
                  *(unsigned char *)(*(void *)v277 + v268) = v276;
                  uint64_t v280 = *(unsigned char **)(v6 + 16 * v279);
LABEL_337:
                  *uint64_t v280 = HIBYTE(v276);
                  return (v90 + 5);
                }
                uint64_t v378 = nrCopyLogObj_1930();
                uint64_t v379 = v378;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v380 = os_log_type_enabled(v378, OS_LOG_TYPE_ERROR);

                  if (!v380)
                  {
LABEL_419:
                    _os_log_pack_size();
                    MEMORY[0x270FA5388]();
                    __error();
                    uint64_t v412 = _os_log_pack_fill();
                    uint64_t v413 = createIOVecString(v6, a4);
                    __os_log_helper_1_2_4_8_34_8_64_4_0_4_0(v412, (uint64_t)"nrChecksumIOVecInner", (uint64_t)v413, v275, v268);
                    id v414 = nrCopyLogObj_1930();
                    _NRLogAbortWithPack(v414);
                  }
                }
                id v406 = nrCopyLogObj_1930();
                uint64_t v436 = createIOVecString(v6, a4);
                _NRLogWithArgs((uint64_t)v406, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex + 1].len >= 1; %@, iovecIndex=%u b"
                           "ytesToCheckThisIOVec=%u",
                  v407,
                  v408,
                  v409,
                  v410,
                  v411,
                  (uint64_t)"");

                goto LABEL_419;
              }
              uint64_t v375 = nrCopyLogObj_1930();
              uint64_t v376 = v375;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v377 = os_log_type_enabled(v375, OS_LOG_TYPE_ERROR);

                if (!v377) {
                  goto LABEL_419;
                }
              }
              id v400 = nrCopyLogObj_1930();
              uint64_t v435 = createIOVecString(v6, a4);
              _NRLogWithArgs((uint64_t)v400, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecIndex + 1 < numIOVecs; %@, iovecIndex=%u bytesToC"
                         "heckThisIOVec=%u",
                v401,
                v402,
                v403,
                v404,
                v405,
                (uint64_t)"");

              goto LABEL_419;
            }
            uint64_t v369 = nrCopyLogObj_1930();
            uint64_t v370 = v369;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v371 = os_log_type_enabled(v369, OS_LOG_TYPE_ERROR);

              if (!v371) {
                goto LABEL_405;
              }
            }
            id v382 = nrCopyLogObj_1930();
            _NRLogWithArgs((uint64_t)v382, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: computedBytes == writtenLength", v383, v384, v385, v386, v387, (uint64_t)"");

LABEL_405:
            _os_log_pack_size();
            MEMORY[0x270FA5388]();
            __error();
            uint64_t v154 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v154 = 136446210;
            uint64_t v155 = "nrChecksumIOVecInner";
            goto LABEL_341;
          }
        }
      }
      unsigned int v253 = v446;
      *(unsigned char *)(v381 + 1) = BYTE1(v446);
      uint64_t v368 = *(unsigned char **)(v6 + 32);
    }
    *uint64_t v368 = v253;
    goto LABEL_422;
  }
  if (!gNRPacketLoggingEnabled) {
    goto LABEL_10;
  }
  os_log_t v125 = nrCopyLogObj_1930();
  BOOL v126 = v125;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v193 = os_log_type_enabled(v125, OS_LOG_TYPE_INFO);

    LOWORD(a2) = v446;
    if (!v193) {
      goto LABEL_10;
    }
  }
  id v194 = nrCopyLogObj_1930();
  PacketString = (void *)createPacketString(a1, v446);
  _NRLogWithArgs((uint64_t)v194, 1, (uint64_t)"%s%.30s:%-4d Got [%@] total len %u", v195, v196, v197, v198, v199, (uint64_t)"");

  LOWORD(a2) = v446;
LABEL_10:
  unsigned int v12 = (unsigned __int16)(a2 - 40);
  uint64_t v10 = a1;
  if (v12 != bswap32(*((unsigned __int16 *)a1 + 2)) >> 16)
  {
    id v127 = nrCopyLogObj_1930();
    uint64_t v128 = v127;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v200 = os_log_type_enabled(v127, OS_LOG_TYPE_INFO);

      if (!v200) {
        goto LABEL_294;
      }
    }
    id v187 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v187, 1, (uint64_t)"%s%.30s:%-4d Avoiding compression of strange length payload %u expected %u", v201, v202, v203, v204, v205, (uint64_t)"");
    goto LABEL_293;
  }
  id v13 = a1 + 8;
  BOOL v15 = *((void *)a1 + 1) != *(void *)a5 || *((void *)a1 + 2) != *(void *)(a5 + 8);
  uint64_t v16 = a1 + 24;
  BOOL v18 = *((void *)a1 + 3) != *(void *)a6 || *((void *)a1 + 4) != *(void *)(a6 + 8);
  memset((char *)&v457[4] + 1, 0, 27);
  *(_OWORD *)((char *)v457 + 1) = 0u;
  uint64_t v456 = 0;
  memset(v455, 0, sizeof(v455));
  unsigned int v19 = bswap32(*(_DWORD *)a1);
  if ((v19 & 0xFF00000) != 0)
  {
    LOBYTE(v455[0]) = v19 >> 20;
    unsigned int v20 = 1;
    char v21 = 112;
  }
  else
  {
    unsigned int v20 = 0;
    char v21 = 120;
  }
  LOBYTE(v457[0]) = v21;
  *(unsigned char *)((unint64_t)v455 | v20) = a1[6];
  uint64_t v22 = v20 + 1;
  int v23 = a1[7];
  switch(v23)
  {
    case 64:
      char v24 = v21 | 2;
      break;
    case 255:
      char v24 = v21 | 3;
      break;
    case 1:
      char v24 = v21 | 1;
      break;
    default:
      *(unsigned char *)((unint64_t)v455 | v22) = v23;
      LODWORD(v22) = v20 | 2;
      if (!v15) {
        goto LABEL_29;
      }
      goto LABEL_267;
  }
  LOBYTE(v457[0]) = v24;
  if (!v15)
  {
LABEL_29:
    char v25 = 48;
    BYTE1(v457[0]) = 48;
    goto LABEL_30;
  }
LABEL_267:
  if (*(void *)v13 == *(void *)a5
    && (*(_DWORD *)(a1 + 18) == *(_DWORD *)(a5 + 10)
      ? (BOOL v224 = *((unsigned __int16 *)a1 + 11) == *(unsigned __int16 *)(a5 + 14))
      : (BOOL v224 = 0),
        v224))
  {
    char v25 = 96;
    BYTE1(v457[0]) = 96;
    *(_WORD *)((unint64_t)v455 | v22) = *((_WORD *)a1 + 8);
    LODWORD(v22) = v22 + 2;
  }
  else if (*v13 == 254 && (a1[9] & 0xC0) == 0x80)
  {
    char v25 = 16;
    BYTE1(v457[0]) = 16;
    *(void *)((unint64_t)v455 | v22) = *((void *)a1 + 2);
    LODWORD(v22) = v22 | 8;
  }
  else
  {
    char v25 = 0;
    *(_OWORD *)((unint64_t)v455 | v22) = *(_OWORD *)v13;
    LODWORD(v22) = v22 | 0x10;
  }
LABEL_30:
  int v26 = *v16;
  if (v26 == 255)
  {
    if (*(void *)v16 ^ 0x2FFLL | *(void *)(a1 + 31))
    {
      BYTE1(v457[0]) = v25 | 8;
LABEL_209:
      *(_OWORD *)((char *)v455 + v22) = *(_OWORD *)v16;
      LODWORD(v22) = v22 + 16;
      goto LABEL_33;
    }
    BYTE1(v457[0]) = v25 | 0xB;
    *((unsigned char *)v455 + v22) = a1[39];
    LODWORD(v22) = v22 + 1;
  }
  else
  {
    if (!v18)
    {
      BYTE1(v457[0]) = v25 | 3;
      goto LABEL_33;
    }
    if (*(void *)v16 != *(void *)a6
      || (*(_DWORD *)(a1 + 34) == *(_DWORD *)(a6 + 10)
        ? (BOOL v130 = *((unsigned __int16 *)a1 + 19) == *(unsigned __int16 *)(a6 + 14))
        : (BOOL v130 = 0),
          !v130))
    {
      if (v26 == 254 && (a1[25] & 0xC0) == 0x80)
      {
        BYTE1(v457[0]) = v25 | 1;
        *(void *)((char *)v455 + v22) = *((void *)a1 + 4);
        LODWORD(v22) = v22 + 8;
        goto LABEL_33;
      }
      goto LABEL_209;
    }
    BYTE1(v457[0]) = v25 | 6;
    *(_WORD *)((char *)v455 + v22) = *((_WORD *)a1 + 16);
    LODWORD(v22) = v22 + 2;
  }
LABEL_33:
  __memcpy_chk();
  switch((int)v22)
  {
    case 1:
      if (LOWORD(v457[0]) == 13178 && BYTE2(v457[0]) == 50)
      {
        int v34 = 0;
        int v28 = 0;
        LODWORD(v22) = 1;
        int v35 = 100;
      }
      else
      {
        if (bswap32(LOWORD(v457[0])) >> 16 != 31283)
        {
          LODWORD(v22) = 1;
          goto LABEL_40;
        }
        LODWORD(v22) = 1;
        if (BYTE2(v457[0]) != 6)
        {
LABEL_40:
          int v28 = 3;
          goto LABEL_55;
        }
        int v34 = 0;
        int v28 = 0;
        int v35 = 102;
      }
LABEL_56:
      unsigned int v36 = v12 + v28;
      **(unsigned char **)uint64_t v6 = v35;
      unsigned int v37 = *(_DWORD *)(v6 + 8);
      unsigned __int16 v450 = v12 + v28;
      unsigned int v445 = v35;
      if (v37 >= 3)
      {
        *(_WORD *)(*(void *)v6 + 1) = bswap32(v36) >> 16;
        goto LABEL_58;
      }
      if (v37 == 2)
      {
        *(unsigned char *)(*(void *)v6 + 1) = BYTE1(v36);
        uint64_t v129 = *(unsigned char **)(v6 + 16);
      }
      else
      {
        uint64_t v176 = *(void *)(v6 + 16);
        if (*(_DWORD *)(v6 + 24) >= 2u)
        {
          *(_WORD *)uint64_t v176 = bswap32(v36) >> 16;
          goto LABEL_58;
        }
        *(unsigned char *)(v176 + 1) = BYTE1(v36);
        uint64_t v129 = *(unsigned char **)(v6 + 32);
      }
      *uint64_t v129 = v36;
LABEL_58:
      uint64_t v453 = a4;
      if (!v34) {
        goto LABEL_85;
      }
      int v444 = v34;
      unsigned int v38 = 0;
      uint64_t v447 = v6;
      unsigned int v39 = (unsigned int *)(v6 + 8);
      unsigned int v40 = 3;
      uint64_t v41 = v453;
      break;
    case 2:
      if (v457[0] == 839005042)
      {
        int v34 = 0;
        int v28 = 0;
        LODWORD(v22) = 2;
        int v35 = 101;
      }
      else
      {
        unsigned int v29 = bswap32(v457[0]);
        BOOL v30 = v29 >= 0x72330206;
        int v31 = v29 > 0x72330206;
        int v32 = !v30;
        LODWORD(v22) = 2;
        if (v31 == v32)
        {
          int v34 = 0;
          int v28 = 0;
          int v35 = 103;
        }
        else
        {
          int v28 = 4;
LABEL_55:
          int v34 = 1;
          int v35 = 3;
        }
      }
      goto LABEL_56;
    case 5:
      if (v457[0] != 3303034 || *(_DWORD *)((char *)v457 + 3) != 201329664) {
        goto LABEL_54;
      }
      int v34 = 0;
      int v28 = 0;
      LODWORD(v22) = 5;
      int v35 = 104;
      goto LABEL_56;
    case 6:
      if (*(void *)v457 != 0xC000C0032026672) {
        goto LABEL_54;
      }
      int v34 = 0;
      int v28 = 0;
      LODWORD(v22) = 6;
      int v35 = 105;
      goto LABEL_56;
    default:
LABEL_54:
      int v28 = v22 + 2;
      goto LABEL_55;
  }
  while (1)
  {
    unsigned int v42 = *v39;
    if (!v40) {
      goto LABEL_65;
    }
    if (v40 <= v42) {
      break;
    }
    v40 -= v42;
LABEL_61:
    v39 += 4;
    if (!--v41) {
      goto LABEL_70;
    }
  }
  if (v40 >= v42)
  {
LABEL_69:
    unsigned int v40 = 0;
    goto LABEL_61;
  }
LABEL_65:
  unsigned int v43 = v42 - v40;
  if (v43 >= 2 - v38) {
    size_t v44 = 2 - v38;
  }
  else {
    size_t v44 = v43;
  }
  memcpy((void *)(*((void *)v39 - 1) + v40), (char *)v457 + v38, v44);
  v38 += v44;
  if (v38 <= 1) {
    goto LABEL_69;
  }
LABEL_70:
  if (v38 != 2) {
    goto LABEL_325;
  }
  uint64_t v10 = a1;
  if (!v22) {
    goto LABEL_84;
  }
  unsigned int v45 = 0;
  int v46 = (unsigned int *)(v447 + 8);
  unsigned int v47 = 5;
  uint64_t v48 = v453;
  while (2)
  {
    unsigned int v49 = *v46;
    if (v47)
    {
      if (v47 > v49)
      {
        v47 -= v49;
      }
      else
      {
        if (v47 < v49) {
          break;
        }
LABEL_82:
        unsigned int v47 = 0;
      }
      v46 += 4;
      if (!--v48) {
        goto LABEL_83;
      }
      continue;
    }
    break;
  }
  unsigned int v50 = v49 - v47;
  if (v50 >= v22 - v45) {
    size_t v51 = v22 - v45;
  }
  else {
    size_t v51 = v50;
  }
  memcpy((void *)(*((void *)v46 - 1) + v47), (char *)v455 + v45, v51);
  v45 += v51;
  if (v45 < v22) {
    goto LABEL_82;
  }
LABEL_83:
  if (v45 != v22) {
    goto LABEL_325;
  }
LABEL_84:
  uint64_t v6 = v447;
  int v34 = v444;
LABEL_85:
  if (!v12) {
    goto LABEL_98;
  }
  unsigned int v52 = 0;
  unsigned int v53 = v28 + 3;
  uint64_t v54 = (unsigned int *)(v6 + 8);
  uint64_t v55 = v453;
  while (2)
  {
    unsigned int v56 = *v54;
    if (v53)
    {
      if (v53 > v56)
      {
        v53 -= v56;
      }
      else
      {
        if (v53 < v56) {
          break;
        }
LABEL_96:
        unsigned int v53 = 0;
      }
      v54 += 4;
      if (!--v55) {
        goto LABEL_97;
      }
      continue;
    }
    break;
  }
  unsigned int v57 = v56 - v53;
  if (v57 >= v12 - v52) {
    size_t v58 = v12 - v52;
  }
  else {
    size_t v58 = v57;
  }
  memcpy((void *)(*((void *)v54 - 1) + v53), &v10[v52 + 40], v58);
  v52 += v58;
  if (v52 < v12) {
    goto LABEL_96;
  }
LABEL_97:
  if (v52 != v12)
  {
    uint64_t v131 = nrCopyLogObj_1930();
    uint64_t v132 = v131;
    uint64_t v94 = "nrWriteBufferToIOVec";
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v133 = os_log_type_enabled(v131, OS_LOG_TYPE_ERROR);

      if (!v133) {
        goto LABEL_238;
      }
    }
    id v177 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v177, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length", v178, v179, v180, v181, v182, (uint64_t)"");

LABEL_238:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    goto LABEL_167;
  }
LABEL_98:
  if (!v34)
  {
    unsigned int v71 = *(_DWORD *)(v6 + 8);
    if (v71 >= 3)
    {
      unsigned int v72 = *(unsigned __int16 *)(*(void *)v6 + 1);
      unsigned int v73 = v72 >> 8;
LABEL_144:
      unsigned int v82 = 0;
      int v83 = (unsigned int *)(v6 + 8);
      unsigned __int8 v84 = **(unsigned char **)v6;
      LOBYTE(v454) = v72 ^ (v84 >> 4);
      HIBYTE(v454) = v73 ^ (16 * v84);
      unsigned int v85 = __rev16(v72 | (v73 << 8)) + 3;
      uint64_t v86 = v453;
      while (1)
      {
        unsigned int v87 = *v83;
        if (!v85) {
          goto LABEL_150;
        }
        if (v85 <= v87) {
          break;
        }
        v85 -= v87;
LABEL_146:
        v83 += 4;
        if (!--v86) {
          goto LABEL_155;
        }
      }
      if (v85 < v87)
      {
LABEL_150:
        unsigned int v88 = v87 - v85;
        if (v88 >= 2 - v82) {
          size_t v89 = 2 - v82;
        }
        else {
          size_t v89 = v88;
        }
        memcpy((void *)(*((void *)v83 - 1) + v85), (char *)&v454 + v82, v89);
        v82 += v89;
        if (v82 > 1)
        {
LABEL_155:
          if (v82 == 2)
          {
            BOOL v78 = a1;
            goto LABEL_157;
          }
LABEL_325:
          uint64_t v272 = nrCopyLogObj_1930();
          uint64_t v273 = v272;
          if (sNRCopyLogToStdErr)
          {

            goto LABEL_339;
          }
          BOOL v274 = os_log_type_enabled(v272, OS_LOG_TYPE_ERROR);

          if (v274)
          {
LABEL_339:
            id v281 = nrCopyLogObj_1930();
            _NRLogWithArgs((uint64_t)v281, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length", v282, v283, v284, v285, v286, (uint64_t)"");
          }
          _os_log_pack_size();
          MEMORY[0x270FA5388]();
          __error();
          uint64_t v154 = _os_log_pack_fill();
          *(_DWORD *)uint64_t v154 = 136446210;
          uint64_t v155 = "nrWriteBufferToIOVec";
LABEL_341:
          *(void *)(v154 + 4) = v155;
LABEL_342:
          id v287 = nrCopyLogObj_1930();
          _NRLogAbortWithPack(v287);
        }
      }
      unsigned int v85 = 0;
      goto LABEL_146;
    }
    if (v71 == 2)
    {
      if (a4 > 1)
      {
        LOBYTE(v72) = *(unsigned char *)(*(void *)v6 + 1);
        os_log_t v74 = *(unsigned __int8 **)(v6 + 16);
LABEL_143:
        unsigned int v73 = *v74;
        goto LABEL_144;
      }
      uint64_t v288 = nrCopyLogObj_1930();
      uint64_t v289 = v288;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v290 = os_log_type_enabled(v288, OS_LOG_TYPE_ERROR);

        if (!v290) {
          goto LABEL_360;
        }
      }
      id v314 = nrCopyLogObj_1930();
      _NRLogWithArgs((uint64_t)v314, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 1", v315, v316, v317, v318, v319, (uint64_t)"");

LABEL_360:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
      uint64_t v154 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v154 = 136446210;
      uint64_t v155 = "nrReadTLVLenHBOFromIOVec";
      goto LABEL_341;
    }
    if (v71 == 1)
    {
      unsigned int v81 = *(_DWORD *)(v6 + 24);
      if (v81 >= 2)
      {
        if (a4 > 1)
        {
          unsigned int v72 = **(unsigned __int16 **)(v6 + 16);
          unsigned int v73 = v72 >> 8;
          goto LABEL_144;
        }
        os_log_t v326 = nrCopyLogObj_1930();
        BOOL v327 = v326;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v328 = os_log_type_enabled(v326, OS_LOG_TYPE_ERROR);

          if (!v328)
          {
LABEL_374:
            _os_log_pack_size();
            MEMORY[0x270FA5388]();
            __error();
            uint64_t v341 = _os_log_pack_fill();
            uint64_t v342 = createIOVecString(v6, 1u);
            *(_DWORD *)uint64_t v341 = 136446466;
            *(void *)(v341 + 4) = "nrReadTLVLenHBOFromIOVec";
            *(_WORD *)(v341 + 12) = 2112;
            *(void *)(v341 + 14) = v342;
            id v343 = nrCopyLogObj_1930();
            _NRLogAbortWithPack(v343);
          }
        }
        id v335 = nrCopyLogObj_1930();
        uint64_t v441 = createIOVecString(v6, 1u);
        _NRLogWithArgs((uint64_t)v335, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 1; %@",
          v336,
          v337,
          v338,
          v339,
          v340,
          (uint64_t)"");

        goto LABEL_374;
      }
      if (a4 <= 2)
      {
        uint64_t v329 = nrCopyLogObj_1930();
        unsigned int v330 = v329;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v331 = os_log_type_enabled(v329, OS_LOG_TYPE_ERROR);

          if (!v331) {
            goto LABEL_379;
          }
        }
        id v344 = nrCopyLogObj_1930();
        uint64_t v442 = createIOVecString(v6, a4);
        _NRLogWithArgs((uint64_t)v344, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: numIOVecs > 2; %@",
          v345,
          v346,
          v347,
          v348,
          v349,
          (uint64_t)"");
      }
      else
      {
        if (v81 == 1)
        {
          LOBYTE(v72) = **(unsigned char **)(v6 + 16);
          os_log_t v74 = *(unsigned __int8 **)(v6 + 32);
          goto LABEL_143;
        }
        uint64_t v332 = nrCopyLogObj_1930();
        uint64_t v333 = v332;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v334 = os_log_type_enabled(v332, OS_LOG_TYPE_ERROR);

          if (!v334) {
            goto LABEL_379;
          }
        }
        id v350 = nrCopyLogObj_1930();
        uint64_t v443 = createIOVecString(v6, a4);
        _NRLogWithArgs((uint64_t)v350, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: ioVecs[1].len == 1; %@",
          v351,
          v352,
          v353,
          v354,
          v355,
          (uint64_t)"");
      }
    }
    else
    {
      uint64_t v291 = nrCopyLogObj_1930();
      uint64_t v292 = v291;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v293 = os_log_type_enabled(v291, OS_LOG_TYPE_ERROR);

        if (!v293) {
          goto LABEL_379;
        }
      }
      id v320 = nrCopyLogObj_1930();
      os_log_t v440 = createIOVecString(v6, a4);
      _NRLogWithArgs((uint64_t)v320, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: ioVecs[0].len == 1; %@",
        v321,
        v322,
        v323,
        v324,
        v325,
        (uint64_t)"");
    }
LABEL_379:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v356 = _os_log_pack_fill();
    uint64_t v357 = createIOVecString(v6, a4);
    *(_DWORD *)uint64_t v356 = 136446466;
    *(void *)(v356 + 4) = "nrReadTLVLenHBOFromIOVec";
    *(_WORD *)(v356 + 12) = 2112;
    *(void *)(v356 + 14) = v357;
    goto LABEL_380;
  }
  uint64_t v59 = 0;
  unsigned int v60 = 0;
  int v61 = 0;
  uint64_t v62 = 0;
  unsigned int v63 = v450 + 3;
  uint64_t v64 = v6;
  size_t v65 = (unsigned int *)(v6 + 8);
  do
  {
    unsigned int v66 = v63 - v60;
    if (v63 <= v60)
    {
      LODWORD(v67) = 0;
      goto LABEL_123;
    }
    if (*v65 >= v66) {
      uint64_t v67 = v66;
    }
    else {
      uint64_t v67 = *v65;
    }
    if (!v67)
    {
      int v92 = nrCopyLogObj_1930();
      int v93 = v92;
      uint64_t v94 = "nrChecksumUpdate";
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v95 = os_log_type_enabled(v92, OS_LOG_TYPE_ERROR);

        if (!v95) {
          goto LABEL_166;
        }
      }
      id v96 = nrCopyLogObj_1930();
      _NRLogWithArgs((uint64_t)v96, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: dataLen > 0", v97, v98, v99, v100, v101, (uint64_t)"");

LABEL_166:
      _os_log_pack_size();
      MEMORY[0x270FA5388]();
      __error();
LABEL_167:
      uint64_t v102 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v102 = 136446210;
      *(void *)(v102 + 4) = v94;
      goto LABEL_342;
    }
    unsigned int v68 = (unsigned __int8 *)*((void *)v65 - 1);
    if (!v61)
    {
      BOOL v69 = (unsigned __int8 *)*((void *)v65 - 1);
      uint64_t v70 = v67;
LABEL_108:
      uint64_t v62 = MEMORY[0x2105126A0](v69, v70, v62);
      goto LABEL_109;
    }
    __int16 v454 = 0;
    __int16 v454 = *v68 << 8;
    uint64_t v62 = MEMORY[0x2105126A0](&v454, 2, v62);
    if (v67 >= 2)
    {
      BOOL v69 = v68 + 1;
      uint64_t v70 = (v67 - 1);
      goto LABEL_108;
    }
LABEL_109:
    if (v67) {
      v61 ^= 1u;
    }
    v60 += v67;
    if (v60 >= v63 && v67 < *v65) {
      goto LABEL_123;
    }
    ++v59;
    v65 += 4;
  }
  while (v453 != v59);
  LOWORD(v59) = a4;
LABEL_123:
  if (v60 != v63)
  {
    int v183 = nrCopyLogObj_1930();
    id v184 = v183;
    uint64_t v94 = "nrChecksumIOVecInner";
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v185 = os_log_type_enabled(v183, OS_LOG_TYPE_ERROR);

      if (!v185) {
        goto LABEL_166;
      }
    }
    id v225 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v225, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: computedBytes == writtenLength", v226, v227, v228, v229, v230, (uint64_t)"");

    goto LABEL_166;
  }
  uint64_t v6 = v64;
  __int16 v75 = ~(_WORD)v62;
  uint64_t v76 = v64 + 16 * (unsigned __int16)v59;
  unsigned int v77 = *(_DWORD *)(v76 + 8);
  if (v77 < (int)v67 + 2)
  {
    BOOL v78 = a1;
    if (v77 < (int)v67 + 1)
    {
      uint64_t v231 = nrCopyLogObj_1930();
      uint64_t v232 = v231;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v233 = os_log_type_enabled(v231, OS_LOG_TYPE_ERROR);

        if (!v233) {
          goto LABEL_357;
        }
      }
      id v294 = nrCopyLogObj_1930();
      v431 = createIOVecString(v64, a4);
      _NRLogWithArgs((uint64_t)v294, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex].len >= bytesToCheckThisIOVec + 1; %@, iovec"
                 "Index=%u bytesToCheckThisIOVec=%u",
        v295,
        v296,
        v297,
        v298,
        v299,
        (uint64_t)"");
    }
    else
    {
      uint64_t v79 = (unsigned __int16)v59 + 1;
      if (v79 >= a4)
      {
        uint64_t v234 = nrCopyLogObj_1930();
        uint64_t v235 = v234;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v236 = os_log_type_enabled(v234, OS_LOG_TYPE_ERROR);

          if (!v236) {
            goto LABEL_357;
          }
        }
        id v300 = nrCopyLogObj_1930();
        uint64_t v432 = createIOVecString(v64, a4);
        _NRLogWithArgs((uint64_t)v300, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecIndex + 1 < numIOVecs; %@, iovecIndex=%u bytesToCheckThisIOVec=%u",
          v301,
          v302,
          v303,
          v304,
          v305,
          (uint64_t)"");
      }
      else
      {
        if (*(_DWORD *)(v64 + 16 * v79 + 8))
        {
          *(unsigned char *)(*(void *)v76 + v67) = v75;
          unsigned int v80 = *(unsigned char **)(v64 + 16 * v79);
          goto LABEL_130;
        }
        id v237 = nrCopyLogObj_1930();
        unsigned int v238 = v237;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v239 = os_log_type_enabled(v237, OS_LOG_TYPE_ERROR);

          if (!v239) {
            goto LABEL_357;
          }
        }
        id v306 = nrCopyLogObj_1930();
        uint64_t v433 = createIOVecString(v64, a4);
        _NRLogWithArgs((uint64_t)v306, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: iovecs[iovecIndex + 1].len >= 1; %@, iovecIndex=%u bytesToCheckThisIOVec=%u",
          v307,
          v308,
          v309,
          v310,
          v311,
          (uint64_t)"");
      }
    }
LABEL_357:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v312 = _os_log_pack_fill();
    uint64_t v313 = createIOVecString(v64, a4);
    __os_log_helper_1_2_4_8_34_8_64_4_0_4_0(v312, (uint64_t)"nrChecksumIOVecInner", (uint64_t)v313, (unsigned __int16)v59, v67);
    goto LABEL_380;
  }
  *(unsigned char *)(*(void *)v76 + v67) = v75;
  unsigned int v80 = (unsigned char *)(*(void *)v76 + v67 + 1);
  BOOL v78 = a1;
LABEL_130:
  *unsigned int v80 = HIBYTE(v75);
LABEL_157:
  if (gNRPacketLoggingEnabled)
  {
    os_log_t v134 = nrCopyLogObj_1930();
    BOOL v135 = v134;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v206 = os_log_type_enabled(v134, OS_LOG_TYPE_INFO);

      if (!v206) {
        goto LABEL_158;
      }
    }
    id v207 = nrCopyLogObj_1930();
    StringFromNRTLVType = createStringFromNRTLVType(v445);
    os_log_t v448 = (void *)createPacketString(v78, v446);
    uint64_t v208 = NRDCreateIPHCString((unsigned __int16 *)v457, 2u);
    if (!v450)
    {
      id v217 = objc_alloc_init(MEMORY[0x263EFF8F8]);
LABEL_265:
      uint64_t v218 = v217;
      os_log_t v437 = _NRCreateDataString(v217);
      _NRLogWithArgs((uint64_t)v207, 1, (uint64_t)"%s%.30s:%-4d Used 6LowPAN IPHC to compress %@, %u to %u - %@ %@ %@", v219, v220, v221, v222, v223, (uint64_t)"");

      goto LABEL_158;
    }
    uint64_t v209 = (char *)malloc_type_malloc(v450, 0xA172743EuLL);
    if (v209)
    {
      uint64_t v210 = v209;
      unsigned int v211 = 0;
      uint64_t v212 = (unsigned int *)(v6 + 8);
      unsigned int v213 = 3;
      while (1)
      {
        unsigned int v214 = *v212;
        if (!v213) {
          goto LABEL_258;
        }
        if (v213 <= v214) {
          break;
        }
        v213 -= v214;
LABEL_254:
        v212 += 4;
        if (!--v453) {
          goto LABEL_263;
        }
      }
      if (v213 < v214)
      {
LABEL_258:
        unsigned int v215 = v214 - v213;
        if (v215 >= v450 - v211) {
          size_t v216 = v450 - v211;
        }
        else {
          size_t v216 = v215;
        }
        memcpy(&v210[v211], (const void *)(*((void *)v212 - 1) + v213), v216);
        v211 += v216;
        if (v211 >= v450)
        {
LABEL_263:
          if (v211 == v450)
          {
            id v217 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v210 length:v450 freeWhenDone:1];
            goto LABEL_265;
          }
          uint64_t v391 = nrCopyLogObj_1930();
          uint64_t v392 = v391;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v393 = os_log_type_enabled(v391, OS_LOG_TYPE_ERROR);

            if (!v393)
            {
LABEL_428:
              _os_log_pack_size();
              MEMORY[0x270FA5388]();
              __error();
              uint64_t v428 = _os_log_pack_fill();
              uint64_t v429 = createIOVecString(v6, a4);
              __os_log_helper_1_2_5_8_34_4_0_4_0_4_0_8_64(v428, (uint64_t)"nrWriteIOVecToBuffer", v211, v450, 3, (uint64_t)v429);

LABEL_380:
              id v358 = nrCopyLogObj_1930();
              _NRLogAbortWithPack(v358);
            }
          }
          id v422 = nrCopyLogObj_1930();
          os_log_t v438 = createIOVecString(v6, a4);
          _NRLogWithArgs((uint64_t)v422, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: bytesWritten == length; bytesWritten (%u) != length (%u), "
                     "offset: %u, ioVec: %@",
            v423,
            v424,
            v425,
            v426,
            v427,
            (uint64_t)"");

          goto LABEL_428;
        }
      }
      unsigned int v213 = 0;
      goto LABEL_254;
    }
    BOOL v388 = nrCopyLogObj_1930();
    os_log_t v389 = v388;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v390 = os_log_type_enabled(v388, OS_LOG_TYPE_ERROR);

      if (!v390) {
        goto LABEL_425;
      }
    }
    id v415 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v415, 16, (uint64_t)"%s%.30s:%-4d ABORTING: strict_malloc(%zu) failed", v416, v417, v418, v419, v420, (uint64_t)"");

LABEL_425:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v421 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v421 = 136446466;
    *(void *)(v421 + 4) = "strict_malloc";
    *(_WORD *)(v421 + 12) = 2048;
    *(void *)(v421 + 14) = v450;
    goto LABEL_342;
  }
LABEL_158:
  int v90 = v450;
  return (v90 + 5);
}

void *createIKEv2PacketString(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (!v1)
  {
    int v11 = nrCopyLogObj_1930();
    unsigned int v12 = v11;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);

      if (!v13)
      {
LABEL_21:
        __int16 v3 = 0;
        goto LABEL_16;
      }
    }
    id v14 = nrCopyLogObj_1930();
    _NRLogWithArgs((uint64_t)v14, 17, (uint64_t)"%s called with null data", v15, v16, v17, v18, v19, (uint64_t)"createIKEv2PacketString");

    goto LABEL_21;
  }
  if ((unint64_t)[v1 length] > 0x1B)
  {
    __int16 v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"["];
    int v4 = (unsigned __int8 *)[v2 bytes];
    if (v4[18] - 34 >= 5) {
      BOOL v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"UNKNOWN_MSG_TYPE(%u)", v4[18]);
    }
    else {
      BOOL v5 = (void *)*((void *)&off_263FD1630 + (v4[18] - 34));
    }
    [v3 appendString:v5];
    if (v4[17] != 32) {
      objc_msgSend(v3, "appendFormat:", @" vers %02X", v4[17]);
    }
    HIDWORD(v7) = v4[19];
    LODWORD(v7) = HIDWORD(v7);
    unsigned int v6 = v7 >> 3;
    if (v6 < 6 && ((0x33u >> v6) & 1) != 0) {
      uint64_t v8 = (void *)*((void *)&off_263FD1658 + v6);
    }
    else {
      uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown Flags(%u)", v4[19]);
    }
    [v3 appendFormat:@" %@", v8];
    objc_msgSend(v3, "appendFormat:", @" id %u", bswap32(*((_DWORD *)v4 + 5)));
    uint64_t v9 = bswap32(*((_DWORD *)v4 + 6));
    if (v9 != [v2 length]) {
      objc_msgSend(v3, "appendFormat:", @" len %u", v9);
    }
    [v3 appendString:@" "];
    objc_msgSend(v3, "appendFormat:", @"%02X", *v4);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[1]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[2]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[3]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[4]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[5]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[6]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[7]);
    [v3 appendString:@"-"];
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[8]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[9]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[10]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[11]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[12]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[13]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[14]);
    objc_msgSend(v3, "appendFormat:", @"%02X", v4[15]);
    [v3 appendString:@"]"];
  }
  else
  {
    __int16 v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"[Invalid len %u]", objc_msgSend(v2, "length"));
  }
LABEL_16:

  return v3;
}

__CFString *createStringFromThermalPressureLevel(uint64_t a1)
{
  int v2 = a1;
  BOOL result = @"Nominal";
  switch(v2)
  {
    case 0:
      return result;
    case 10:
      BOOL result = @"Light";
      break;
    case 20:
      BOOL result = @"Moderate";
      break;
    case 30:
      BOOL result = @"Heavy";
      break;
    case 40:
      BOOL result = @"Trapping";
      break;
    case 50:
      BOOL result = @"Sleeping";
      break;
    default:
      BOOL result = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"unknown(%d)", a1);
      break;
  }
  return result;
}

__CFString *createStringFromNRXPCType(unint64_t a1)
{
  if (a1 < 0x35 && ((0x1FFFFFFFFFFCFFuLL >> a1) & 1) != 0) {
    return off_263FD1AB0[a1];
  }
  else {
    return (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%lld)", a1);
  }
}

__CFString *createStringFromNRXPCRes(uint64_t a1)
{
  if (a1 <= -2020)
  {
    switch(a1)
    {
      case -3004:
        BOOL result = @"FailureOperationTimedOut";
        break;
      case -3003:
        BOOL result = @"FailureOperationAlreadyInProgress";
        break;
      case -3002:
        BOOL result = @"FailureOperationFailed";
        break;
      case -3001:
        BOOL result = @"FailureInvalidState";
        break;
      default:
        if (a1 == -9999) {
          BOOL result = @"FailureUnimplemented";
        }
        else {
LABEL_32:
        }
          BOOL result = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%lld)", a1);
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case -2019:
        BOOL result = @"FailureXPCError";
        break;
      case -2018:
        BOOL result = @"FailureCopyIDSDeviceIDFailed";
        break;
      case -2017:
        BOOL result = @"FailurePairingClientFailed";
        break;
      case -2016:
        BOOL result = @"FailurePairingAttemptFixedInterfaceMode";
        break;
      case -2015:
        BOOL result = @"FailureBabelRoutes";
        break;
      case -2014:
        BOOL result = @"FailureInvalidOperationOnUnregisteredDevice";
        break;
      case -2013:
        BOOL result = @"FailureIKEPairingDidNotConnect";
        break;
      case -2012:
        BOOL result = @"FailureFileWriteFailed";
        break;
      case -2011:
        BOOL result = @"FailureNoBestTestingDevice";
        break;
      case -2010:
        BOOL result = @"FailureMonitorConnectionLost";
        break;
      case -2009:
        BOOL result = @"FailureCopyDeviceListFailed";
        break;
      case -2008:
        BOOL result = @"FailureNRUUIDIsUnknown";
        break;
      case -2007:
        BOOL result = @"FailureAsyncBadXPCResponse";
        break;
      case -2006:
        BOOL result = @"FailureResolveNoLink";
        break;
      case -2005:
        BOOL result = @"FailureInvalidInput";
        break;
      case -2004:
        BOOL result = @"FailureLinkStatus";
        break;
      case -2003:
        BOOL result = @"FailureInvalidType";
        break;
      case -2002:
        BOOL result = @"FailureMissingEntitlement";
        break;
      case -2001:
        BOOL result = @"FailureUnknown";
        break;
      case -2000:
        BOOL result = @"AsyncInProgress";
        break;
      default:
        if (a1) {
          goto LABEL_32;
        }
        BOOL result = @"Success";
        break;
    }
  }
  return result;
}

void __nrXPCCopyQueue_block_invoke()
{
  if (_NRShouldDebugAutoRelease_onceToken != -1) {
    dispatch_once(&_NRShouldDebugAutoRelease_onceToken, &__block_literal_global_40);
  }
  if (_NRShouldDebugAutoRelease_debugAutoRelease)
  {
    os_log_t v0 = 0;
  }
  else
  {
    os_log_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  }
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.networkrelay.xpc", v0);

  if (!v1)
  {
    __int16 v3 = nrCopyLogObj_2279();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      int v4 = v3;
      BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

      if (!v5)
      {
LABEL_17:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v15 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v15 = 136446466;
        *(void *)(v15 + 4) = "nr_dispatch_queue_create";
        *(_WORD *)(v15 + 12) = 2080;
        *(void *)(v15 + 14) = "com.apple.networkrelay.xpc";
        id v16 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v16);
      }
    }
    id v9 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: dispatch_queue_create(%s) failed", v10, v11, v12, v13, v14, (uint64_t)"");

    goto LABEL_17;
  }
  int v2 = (void *)nrXPCCopyQueue_nrXPCQueue;
  nrXPCCopyQueue_nrXPCQueue = (uint64_t)v1;

  if (!nrXPCCopyQueue_nrXPCQueue)
  {
    unsigned int v6 = nrCopyLogObj_2279();
    unint64_t v7 = v6;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_20:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v23 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v23 = 136446210;
        *(void *)(v23 + 4) = "nrXPCCopyQueue_block_invoke";
        id v24 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v24);
      }
    }
    id v17 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v17, 16, (uint64_t)"%s%.30s:%-4d ABORTING: Assertion Failed: (nrXPCQueue) != ((void *)0)", v18, v19, v20, v21, v22, (uint64_t)"");

    goto LABEL_20;
  }
}

id nrCopyLogObj_2279()
{
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  os_log_t v0 = (void *)nrCopyLogObj_sNRLogObj_2286;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_2288()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_2286;
  nrCopyLogObj_sNRLogObj_2286 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

char *nrXPCSendPingCopyResponse()
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    unsigned int v53 = nrCopyLogObj_2279();
    uint64_t v54 = v53;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        id v65 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v65);
      }
    }
    id v58 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_80;
  }
  uint64_t v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 1uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCSendPingCopyResponse", v1);
  __int16 v3 = v2;
  if (!v2)
  {
    unsigned int v56 = nrCopyLogObj_2279();
    unsigned int v57 = v56;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    id v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    uint64_t v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          string = (char *)xpc_dictionary_get_string(v3, "PingMessage");
          if (string) {
            string = (char *)[[NSString alloc] initWithUTF8String:string];
          }
          goto LABEL_35;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            size_t v44 = nrCopyLogObj_2279();
            unsigned int v45 = v44;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46) {
                goto LABEL_33;
              }
            }
            id v47 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          unsigned int v68 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      id v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      id v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    string = (char *)MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)string);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    id v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  string = (char *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)string);
  }
LABEL_10:
  if (string)
  {
    free(string);
LABEL_34:
    string = 0;
  }
LABEL_35:

  return string;
}

xpc_object_t nrXPCSendSyncInner(uint64_t a1, void *a2)
{
  id v2 = a2;
  __int16 v3 = (_xpc_connection_s *)nrXPCCopyConnection();
  uint64_t v4 = v3;
  if (!v3)
  {
    xpc_object_t v5 = 0;
    goto LABEL_3;
  }
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v3, v2);
  xpc_object_t v6 = (xpc_object_t)MEMORY[0x263EF86A0];
  if (v5 == (xpc_object_t)MEMORY[0x263EF86A0])
  {
    uint64_t v8 = nrCopyLogObj_2279();
    uint64_t v9 = v8;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

      if (!v10) {
        goto LABEL_9;
      }
    }
    id v11 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v11, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v12, v13, v14, v15, v16, (uint64_t)"");

LABEL_9:
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v2);

    if (v5 != v6) {
      goto LABEL_3;
    }
    uint64_t v17 = nrCopyLogObj_2279();
    uint64_t v18 = v17;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (!v19) {
        goto LABEL_14;
      }
    }
    id v20 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v20, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v21, v22, v23, v24, v25, (uint64_t)"");

LABEL_14:
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v2);

    if (v5 != v6) {
      goto LABEL_3;
    }
    uint64_t v26 = nrCopyLogObj_2279();
    uint64_t v27 = v26;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v28 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

      if (!v28) {
        goto LABEL_19;
      }
    }
    id v29 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v29, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v30, v31, v32, v33, v34, (uint64_t)"");

LABEL_19:
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v2);

    if (v5 != v6) {
      goto LABEL_3;
    }
    uint64_t v35 = nrCopyLogObj_2279();
    uint64_t v36 = v35;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v37 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);

      if (!v37) {
        goto LABEL_24;
      }
    }
    id v38 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v38, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v39, v40, v41, v42, v43, (uint64_t)"");

LABEL_24:
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v4, v2);

    if (v5 != v6) {
      goto LABEL_3;
    }
    size_t v44 = nrCopyLogObj_2279();
    unsigned int v45 = v44;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

      if (!v46)
      {
LABEL_29:
        xpc_object_t v5 = (xpc_object_t)MEMORY[0x263EF86A0];
        goto LABEL_3;
      }
    }
    id v47 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v48, v49, v50, v51, v52, (uint64_t)"");

    goto LABEL_29;
  }
LABEL_3:

  return v5;
}

id nrXPCCopyConnection()
{
  if (nrXPCCopyQueue_onceToken != -1) {
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
  }
  id v0 = (id)nrXPCCopyQueue_nrXPCQueue;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__2298;
  id v11 = __Block_byref_object_dispose__2299;
  id v12 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __nrXPCCopyConnection_block_invoke;
  v4[3] = &unk_263FD1A40;
  id v5 = v0;
  xpc_object_t v6 = &v7;
  uint64_t v1 = v0;
  dispatch_sync(v1, v4);
  id v2 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v2;
}

uint64_t __Block_byref_object_copy__2298(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2299(uint64_t a1)
{
}

void __nrXPCCopyConnection_block_invoke(uint64_t a1)
{
  id v2 = (void *)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection;
  if (nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection) {
    goto LABEL_2;
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.terminusd", *(dispatch_queue_t *)(a1 + 32), 2uLL);
  uint64_t v4 = (void *)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection;
  nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection = (uint64_t)mach_service;

  if (nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection)
  {
    uint64_t v5 = MEMORY[0x210512A10]();
    xpc_object_t v6 = (void *)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection;
    if (v5 == MEMORY[0x263EF86F0])
    {
      id v7 = (id)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection;
      uint64_t v8 = (_xpc_connection_s *)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __nrXPCCopyConnection_block_invoke_2;
      handler[3] = &unk_263FD1A18;
      id v11 = v7;
      id v9 = v7;
      xpc_connection_set_event_handler(v8, handler);
      xpc_connection_activate((xpc_connection_t)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection);

      id v2 = (void *)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection;
      if (!nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection) {
        return;
      }
      goto LABEL_2;
    }
    if (nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection)
    {
      nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection = 0;

      id v2 = (void *)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection;
      if (nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection) {
LABEL_2:
      }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
    }
  }
}

uint64_t __nrXPCCopyConnection_block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = MEMORY[0x210512A10]();
  if (v13 != (id)MEMORY[0x263EF86A0])
  {
    BOOL v4 = v3 != MEMORY[0x263EF8720] || nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection == 0;
    if (!v4 && *(void *)(a1 + 32) == nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection)
    {
      xpc_connection_cancel((xpc_connection_t)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection);
      id v11 = (void *)nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection;
      nrXPCEntitlementIdentityProxy_block_invoke_sNRXPCConnection = 0;
    }
    else if (v3 == MEMORY[0x263EF8708])
    {
      BOOL v10 = (void *)MEMORY[0x2105128B0](v13);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"unexpected message from %s: %s", v5, v6, v7, v8, v9, (uint64_t)"com.apple.terminusd");
      }
      if (v10) {
        free(v10);
      }
    }
  }
  return MEMORY[0x270F9A758]();
}

uint64_t nrXPCTestNRLinkDirectorMessage()
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    unsigned int v53 = nrCopyLogObj_2279();
    uint64_t v54 = v53;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        id v65 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v65);
      }
    }
    id v58 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_79;
  }
  uint64_t v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x22uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCTestNRLinkDirectorMessage", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    unsigned int v56 = nrCopyLogObj_2279();
    unsigned int v57 = v56;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    uint64_t v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          uint64_t v15 = xpc_dictionary_get_BOOL(v3, "TestNRLinkDirectorMessage");
          goto LABEL_35;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            size_t v44 = nrCopyLogObj_2279();
            unsigned int v45 = v44;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46) {
                goto LABEL_33;
              }
            }
            id v47 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          unsigned int v68 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    uint64_t v15 = MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64_t v15 = MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, v15);
  }
LABEL_10:
  if (v15)
  {
    free((void *)v15);
LABEL_34:
    uint64_t v15 = 0;
  }
LABEL_35:

  return v15;
}

BOOL nrXPCCompanionLinkDefault()
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v61 = nrCopyLogObj_2279();
    uint64_t v62 = v61;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        id v73 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v73);
      }
    }
    id v66 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x19uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkDefault", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v64 = nrCopyLogObj_2279();
    id v65 = v64;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        BOOL v45 = 0;
        goto LABEL_63;
      }
    }
    id v75 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v17 = xpc_dictionary_get_value(v3, "Result");
    id v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x210512A10](v17) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v23);
        if (!value)
        {
          int v16 = 0;
          goto LABEL_36;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v52 = nrCopyLogObj_2279();
            unsigned int v53 = v52;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54) {
                goto LABEL_35;
              }
            }
            id v55 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          unsigned int v82 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        int v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x263EF8720])
  {
    if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v39 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        int v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      }
      if (v15) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v16 = 1;
    goto LABEL_62;
  }
  uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  }
  if (!v15) {
    goto LABEL_61;
  }
LABEL_11:
  free(v15);
  int v16 = 1;
LABEL_62:
  BOOL v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionLinkEnable()
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v61 = nrCopyLogObj_2279();
    uint64_t v62 = v61;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        id v73 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v73);
      }
    }
    id v66 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 2uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkEnable", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v64 = nrCopyLogObj_2279();
    id v65 = v64;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        BOOL v45 = 0;
        goto LABEL_63;
      }
    }
    id v75 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v17 = xpc_dictionary_get_value(v3, "Result");
    id v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x210512A10](v17) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v23);
        if (!value)
        {
          int v16 = 0;
          goto LABEL_36;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v52 = nrCopyLogObj_2279();
            unsigned int v53 = v52;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54) {
                goto LABEL_35;
              }
            }
            id v55 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          unsigned int v82 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        int v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x263EF8720])
  {
    if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v39 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        int v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      }
      if (v15) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v16 = 1;
    goto LABEL_62;
  }
  uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  }
  if (!v15) {
    goto LABEL_61;
  }
LABEL_11:
  free(v15);
  int v16 = 1;
LABEL_62:
  BOOL v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionLinkDisable()
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v61 = nrCopyLogObj_2279();
    uint64_t v62 = v61;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        id v73 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v73);
      }
    }
    id v66 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 3uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkDisable", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v64 = nrCopyLogObj_2279();
    id v65 = v64;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        BOOL v45 = 0;
        goto LABEL_63;
      }
    }
    id v75 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v17 = xpc_dictionary_get_value(v3, "Result");
    id v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x210512A10](v17) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v23);
        if (!value)
        {
          int v16 = 0;
          goto LABEL_36;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v52 = nrCopyLogObj_2279();
            unsigned int v53 = v52;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54) {
                goto LABEL_35;
              }
            }
            id v55 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          unsigned int v82 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        int v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x263EF8720])
  {
    if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v39 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        int v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      }
      if (v15) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v16 = 1;
    goto LABEL_62;
  }
  uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  }
  if (!v15) {
    goto LABEL_61;
  }
LABEL_11:
  free(v15);
  int v16 = 1;
LABEL_62:
  BOOL v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionEnableBluetoothPacketParser(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x2AuLL);
  xpc_dictionary_set_BOOL(v3, "EnableBluetoothPacketParser", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionEnableBluetoothPacketParser", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

uint64_t nrXPCCompanionLinkIsEnabled()
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v53 = nrCopyLogObj_2279();
    BOOL v54 = v53;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        id v65 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v65);
      }
    }
    id v58 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_79;
  }
  uint64_t v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0xCuLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkIsEnabled", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    BOOL v56 = nrCopyLogObj_2279();
    id v57 = v56;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    uint64_t v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          uint64_t v15 = xpc_dictionary_get_BOOL(v3, "CompanionLinkIsEnabled");
          goto LABEL_35;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v44 = nrCopyLogObj_2279();
            uint64_t v45 = v44;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46) {
                goto LABEL_33;
              }
            }
            id v47 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          id v68 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    uint64_t v15 = MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64_t v15 = MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, v15);
  }
LABEL_10:
  if (v15)
  {
    free((void *)v15);
LABEL_34:
    uint64_t v15 = 0;
  }
LABEL_35:

  return v15;
}

uint64_t nrXPCSupportsRestrictedPorts(const unsigned __int8 *a1)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v55 = nrCopyLogObj_2279();
    BOOL v56 = v55;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

      if (!v57)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v66 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v66, (uint64_t)"nr_xpc_dictionary_create");
        id v67 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v67);
      }
    }
    id v60 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v60, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_79;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x23uLL);
  xpc_dictionary_set_uuid(v3, "DeviceIdentifier", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCSupportsRestrictedPorts", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v58 = nrCopyLogObj_2279();
    uint64_t v59 = v58;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v68 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);

      if (!v68) {
        goto LABEL_34;
      }
    }
    id v25 = nrCopyLogObj_2279();
    uint64_t v24 = v25;
    uint64_t v26 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v18 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v24 = (void *)v18;
    if (v18)
    {
      if (MEMORY[0x210512A10](v18) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v24);
        if (!value)
        {

          uint64_t v17 = xpc_dictionary_get_BOOL(v5, "SupportsRestrictedPorts");
          goto LABEL_35;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v46 = nrCopyLogObj_2279();
            id v47 = v46;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v48 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

              if (!v48) {
                goto LABEL_33;
              }
            }
            id v49 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v49, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v35 = nrCopyLogObj_2279();
          uint64_t v70 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v41, v42, v43, v44, v45, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v25 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v26 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v25 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v26 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v25, 17, (uint64_t)v26, v19, v20, v21, v22, v23, v71);
    goto LABEL_33;
  }
  if (v6 != MEMORY[0x263EF8720])
  {
    uint64_t v17 = MEMORY[0x2105128B0](v5);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_10;
  }
  if (v5 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v71);
    }
    goto LABEL_34;
  }
  if (v5 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v5 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v25 = nrCopyLogObj_2279();
    uint64_t v24 = v25;
    uint64_t v26 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64_t v17 = MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v27, v28, v29, v30, v31, v17);
  }
LABEL_10:
  if (v17)
  {
    free((void *)v17);
LABEL_34:
    uint64_t v17 = 0;
  }
LABEL_35:

  return v17;
}

void nrXPCRefreshCompanionProxyAgent()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v6 = nrCopyLogObj_2279();
    uint64_t v7 = v6;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (!v8)
      {
LABEL_13:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v15 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v15, (uint64_t)"nr_xpc_dictionary_create");
        id v16 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v16);
      }
    }
    id v9 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v9, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v10, v11, v12, v13, v14, (uint64_t)"");

    goto LABEL_13;
  }
  uint64_t v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x24uLL);
  if (nrXPCCopyQueue_onceToken != -1) {
    dispatch_once(&nrXPCCopyQueue_onceToken, &__block_literal_global_2277);
  }
  xpc_object_t v2 = (id)nrXPCCopyQueue_nrXPCQueue;
  id v3 = v1;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
  v17[3] = &unk_263FD1A68;
  id v18 = &__block_literal_global_383;
  xpc_object_t v4 = v17;
  id v5 = nrXPCCopyConnection();
  if (v5)
  {
    nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v5, v3, v2, v4, 1u);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __nrXPCSendAsyncInner_block_invoke;
    block[3] = &unk_263FD19F0;
    uint64_t v20 = v4;
    dispatch_async(v2, block);
  }
}

void __nrXPCSendAsyncOnlyResultCode_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v3 = a2;
  xpc_object_t v4 = v3;
  if (!v3)
  {
    BOOL v68 = nrCopyLogObj_2279();
    uint64_t v69 = v68;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v70 = os_log_type_enabled(v68, OS_LOG_TYPE_FAULT);

      if (!v70)
      {
LABEL_108:
        id v35 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        goto LABEL_73;
      }
    }
    id v71 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v71, 17, (uint64_t)"received nil response", v72, v73, v74, v75, v76, v77);

    goto LABEL_108;
  }
  uint64_t v5 = MEMORY[0x210512A10](v3);
  uint64_t v11 = MEMORY[0x263EF8708];
  if (v5 == MEMORY[0x263EF8708])
  {
    uint64_t v20 = xpc_dictionary_get_value(v4, "Result");
    uint64_t v26 = (void *)v20;
    if (!v20)
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        uint64_t v27 = nrCopyLogObj_sNRLogObj_2286;
        uint64_t v28 = "received response without result code";
        goto LABEL_36;
      }
LABEL_37:
      if (v4 != (void *)MEMORY[0x263EF86A0])
      {
        if (v4 != (void *)MEMORY[0x263EF86A8])
        {
          if (v4 != (void *)MEMORY[0x263EF86C0])
          {
            if (MEMORY[0x210512A10](v4) == v11)
            {
              string = xpc_dictionary_get_string(v4, "ErrorDescription");
              xpc_dictionary_get_int64(v4, "Result");
              if (string) {
                uint64_t v34 = (__CFString *)[[NSString alloc] initWithUTF8String:string];
              }
              else {
                uint64_t v34 = @"Received bad XPC response";
              }
              goto LABEL_42;
            }
LABEL_41:
            uint64_t v34 = @"Received bad XPC response";
LABEL_42:
            (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_101:
            goto LABEL_102;
          }
LABEL_99:
          id v67 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
          goto LABEL_100;
        }
LABEL_98:
        id v67 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        goto LABEL_100;
      }
      goto LABEL_97;
    }
    if (MEMORY[0x210512A10](v20) != MEMORY[0x263EF8738])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        uint64_t v27 = nrCopyLogObj_sNRLogObj_2286;
        uint64_t v28 = "received invalid result type";
LABEL_36:
        _NRLogWithArgs(v27, 17, (uint64_t)v28, v21, v22, v23, v24, v25, v77);
        goto LABEL_37;
      }
      goto LABEL_37;
    }
    unint64_t value = xpc_int64_get_value(v26);
    if (!value)
    {

      id v35 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_73;
    }
    uint64_t v37 = value;
    if (!(value >> 31))
    {
      if (strerror_r(value, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v38 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v38, 17, (uint64_t)"received failure result code: [%d] %s", v39, v40, v41, v42, v43, v37);
LABEL_90:
      }
LABEL_91:
      if (v4 != (void *)MEMORY[0x263EF86A0])
      {
        if (v4 != (void *)MEMORY[0x263EF86A8])
        {
          if (v4 != (void *)MEMORY[0x263EF86C0])
          {
            if (MEMORY[0x210512A10](v4) == v11)
            {
              uint64_t v66 = xpc_dictionary_get_string(v4, "ErrorDescription");
              xpc_dictionary_get_int64(v4, "Result");
              if (v66) {
                uint64_t v34 = (__CFString *)[[NSString alloc] initWithUTF8String:v66];
              }
              else {
                uint64_t v34 = @"Received bad XPC response";
              }
              goto LABEL_42;
            }
            goto LABEL_41;
          }
          goto LABEL_99;
        }
        goto LABEL_98;
      }
LABEL_97:
      id v67 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_100:
      v67();
      goto LABEL_101;
    }
    if ((value | 2) == 0xFFFFF822)
    {
      uint64_t v51 = nrCopyLogObj_2279();
      uint64_t v52 = v51;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v60 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);

        if (!v60) {
          goto LABEL_91;
        }
      }
      id v38 = nrCopyLogObj_2279();
      StringFromNRXPCRes = createStringFromNRXPCRes(v37);
      _NRLogWithArgs((uint64_t)v38, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v61, v62, v63, v64, v65, (uint64_t)"");
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_91;
      }
      id v38 = nrCopyLogObj_2279();
      StringFromNRXPCRes = createStringFromNRXPCRes(v37);
      _NRLogWithArgs((uint64_t)v38, 17, (uint64_t)"received internal failure result code: [%lld] %@", v55, v56, v57, v58, v59, v37);
    }

    goto LABEL_90;
  }
  uint64_t v12 = (void *)MEMORY[0x263EF86A0];
  if (v5 != MEMORY[0x263EF8720])
  {
    id v18 = (void *)MEMORY[0x2105128B0](v4);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v13, v14, v15, v16, v17, (uint64_t)v18);
    }
LABEL_9:
    if (v18) {
      free(v18);
    }
    goto LABEL_11;
  }
  if (v4 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v6, v7, v8, v9, v10, v77);
    }
    goto LABEL_58;
  }
  if (v4 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v6, v7, v8, v9, v10, (uint64_t)"");
    }
  }
  else
  {
    if (v4 != (void *)MEMORY[0x263EF86C0])
    {
      id v18 = (void *)MEMORY[0x2105128B0](v4);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v29, v30, v31, v32, v33, (uint64_t)v18);
      }
      goto LABEL_9;
    }
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
    {
      id v45 = nrCopyLogObj_2279();
      _NRLogWithArgs((uint64_t)v45, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v46, v47, v48, v49, v50, v77);
    }
  }
LABEL_11:
  if (v4 == v12)
  {
LABEL_58:
    id v35 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_73;
  }
  if (v4 == (void *)MEMORY[0x263EF86A8])
  {
    id v35 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_73:
    v35();
    goto LABEL_102;
  }
  if (v4 == (void *)MEMORY[0x263EF86C0])
  {
    id v35 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_73;
  }
  if (MEMORY[0x210512A10](v4) == v11)
  {
    uint64_t v44 = xpc_dictionary_get_string(v4, "ErrorDescription");
    xpc_dictionary_get_int64(v4, "Result");
    if (v44) {
      uint64_t v19 = (__CFString *)[[NSString alloc] initWithUTF8String:v44];
    }
    else {
      uint64_t v19 = @"Received bad XPC response";
    }
  }
  else
  {
    uint64_t v19 = @"Received bad XPC response";
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

LABEL_102:
}

uint64_t __nrXPCSendAsyncInner_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void nrXPCSendAsyncInnerRec(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = v14;
  if (a6 >= 6)
  {
    (*((void (**)(id, void))v14 + 2))(v14, MEMORY[0x263EF86A0]);
  }
  else
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __nrXPCSendAsyncInnerRec_block_invoke;
    v16[3] = &unk_263FD1A90;
    id v20 = v14;
    uint64_t v21 = a1;
    unsigned int v22 = a6;
    uint64_t v17 = (_xpc_connection_s *)v11;
    id v18 = v12;
    dispatch_queue_t v19 = (dispatch_queue_t)v13;
    xpc_connection_send_message_with_reply(v17, v18, v19, v16);
  }
}

uint64_t __nrXPCSendAsyncInnerRec_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != MEMORY[0x263EF86A0])
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v3();
  }
  uint64_t v5 = nrCopyLogObj_2279();
  if (sNRCopyLogToStdErr)
  {

LABEL_8:
    id v8 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d %s received XPC_ERROR_CONNECTION_INTERRUPTED, retrying (%u)", v9, v10, v11, v12, v13, (uint64_t)"");

    goto LABEL_9;
  }
  uint64_t v6 = v5;
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v7) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = (*(_DWORD *)(a1 + 72) + 1);
  return nrXPCSendAsyncInnerRec(v14, v16, v17, v18, v15, v19);
}

uint64_t __nrXPCRefreshCompanionProxyAgent_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr
    || (BOOL v8 = os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT), v9 = v11, v8))
  {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Refresh generation response %lld (%@)", v3, v4, v5, v6, v7, (uint64_t)"");
    id v9 = v11;
  }
  return MEMORY[0x270F9A758](v8, v9);
}

char *nrXPCCompanionLinkCopyStatus()
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v53 = nrCopyLogObj_2279();
    uint64_t v54 = v53;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        id v65 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v65);
      }
    }
    id v58 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_80;
  }
  uint64_t v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 4uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkCopyStatus", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v56 = nrCopyLogObj_2279();
    uint64_t v57 = v56;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    unsigned int v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    unsigned int v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          string = (char *)xpc_dictionary_get_string(v3, "CompanionLinkStatusMessage");
          if (string) {
            string = (char *)[[NSString alloc] initWithUTF8String:string];
          }
          goto LABEL_35;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v44 = nrCopyLogObj_2279();
            id v45 = v44;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46) {
                goto LABEL_33;
              }
            }
            id v47 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          BOOL v68 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    string = (char *)MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)string);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    unsigned int v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  string = (char *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)string);
  }
LABEL_10:
  if (string)
  {
    free(string);
LABEL_34:
    string = 0;
  }
LABEL_35:

  return string;
}

BOOL NRDiagnosticSaveNetworkRelayStatusToDirectory(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v15 = nrCopyLogObj_2279();
    uint64_t v16 = v15;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v17) {
        goto LABEL_38;
      }
    }
    id v24 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v24, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL directoryPath", v25, v26, v27, v28, v29, (uint64_t)"");

    goto LABEL_38;
  }
  xpc_object_t v2 = v1;
  if (![v1 length])
  {
    uint64_t v18 = nrCopyLogObj_2279();
    uint64_t v19 = v18;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v20 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (!v20) {
        goto LABEL_38;
      }
    }
    id v30 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v30, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL directoryPath.length", v31, v32, v33, v34, v35, (uint64_t)"");

    goto LABEL_38;
  }
  if (![v2 UTF8String])
  {
    uint64_t v21 = nrCopyLogObj_2279();
    unsigned int v22 = v21;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v23 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v23)
      {
LABEL_38:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v42 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v42 = 136446466;
        *(void *)(v42 + 4) = "NRDiagnosticSaveNetworkRelayStatusToDirectory";
        *(_WORD *)(v42 + 12) = 2080;
        *(void *)(v42 + 14) = "NRDiagnosticSaveNetworkRelayStatusToDirectory";
        id v43 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v43);
      }
    }
    id v36 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v36, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL directoryPathC", v37, v38, v39, v40, v41, (uint64_t)"");

    goto LABEL_38;
  }
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Saving diagnostic status to directory \"%s\"", v3, v4, v5, v6, v7, (uint64_t)"");
  }
  uint64_t v13 = nrSaveNetworkRelayStatusToDirectory(v2);
  if (!v13)
  {
    if (nrCopyLogObj_onceToken_2285 == -1)
    {
      if (sNRCopyLogToStdErr) {
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      if (sNRCopyLogToStdErr) {
        goto LABEL_19;
      }
    }
    if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
LABEL_19:
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Failed to save diagnostic status to directory \"%s\"", v8, v9, v10, v11, v12, (uint64_t)"");
    goto LABEL_20;
  }
  if (nrCopyLogObj_onceToken_2285 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_14:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Saved diagnostic status to directory \"%s\"", v8, v9, v10, v11, v12, (uint64_t)"");
      goto LABEL_20;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    if (sNRCopyLogToStdErr) {
      goto LABEL_14;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_14;
  }
LABEL_20:

  return v13 != 0;
}

id nrSaveNetworkRelayStatusToDirectory(void *a1)
{
  id v1 = a1;
  xpc_object_t v2 = [MEMORY[0x263F08850] defaultManager];
  char v18 = 0;
  if ([v2 fileExistsAtPath:v1 isDirectory:&v18]) {
    BOOL v8 = v18 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
LABEL_20:
    uint64_t v15 = [v1 stringByAppendingPathComponent:@"companion_link_status_phone.txt"];
    if (nrSaveNetworkRelayStatusToFile(v15)) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Creating temporary directory at \"%@\"", v3, v4, v5, v6, v7, (uint64_t)"");
  }
  id v17 = 0;
  [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v17];
  id v9 = v17;
  if (!v9)
  {
    if (nrCopyLogObj_onceToken_2285 == -1)
    {
      if (!sNRCopyLogToStdErr) {
        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      if (!sNRCopyLogToStdErr)
      {
LABEL_18:
        if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_20;
        }
      }
    }
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Created temporary directory at \"%@\"", v10, v11, v12, v13, v14, (uint64_t)"");
    goto LABEL_20;
  }
  uint64_t v15 = v9;
  if (nrCopyLogObj_onceToken_2285 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_15:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d Failed to create directory at \"%@\": %@", v10, v11, v12, v13, v14, (uint64_t)"");
      goto LABEL_21;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    if (sNRCopyLogToStdErr) {
      goto LABEL_15;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
LABEL_21:

  uint64_t v15 = 0;
LABEL_22:

  return v15;
}

BOOL nrSaveNetworkRelayStatusToFile(void *a1)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v1 = a1;
  xpc_object_t v2 = (const char *)[v1 UTF8String];
  if (!v2)
  {
    uint64_t v81 = nrCopyLogObj_2279();
    uint64_t v82 = v81;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v83 = os_log_type_enabled(v81, OS_LOG_TYPE_ERROR);

      if (!v83) {
        goto LABEL_94;
      }
    }
    id v89 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v89, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL filePathC", v90, v91, v92, v93, v94, (uint64_t)"");

LABEL_94:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v95 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v95 = 136446466;
    *(void *)(v95 + 4) = "nrSaveNetworkRelayStatusToFile";
    *(_WORD *)(v95 + 12) = 2080;
    *(void *)(v95 + 14) = "nrSaveNetworkRelayStatusToFile";
    goto LABEL_98;
  }
  uint64_t v3 = v2;
  int v4 = open(v2, 1793, 420);
  if ((v4 & 0x80000000) == 0)
  {
    int v10 = v4;
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    if (v11)
    {
      uint64_t v12 = v11;
      xpc_dictionary_set_uint64(v11, "Type", 0x21uLL);
      xpc_dictionary_set_fd(v12, "CompanionLinkStatusDumpToFileDescriptor", v10);
      xpc_dictionary_set_string(v12, "CompanionLinkStatusDumpToFilePath", v3);
      xpc_object_t v13 = nrXPCSendSyncInner((uint64_t)"nrSaveNetworkRelayStatusToFile", v12);
      close(v10);
      if (v13)
      {
        uint64_t v14 = MEMORY[0x210512A10](v13);
        if (v14 != MEMORY[0x263EF8708])
        {
          if (v14 != MEMORY[0x263EF8720])
          {
            uint64_t v25 = (void *)MEMORY[0x2105128B0](v13);
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v20, v21, v22, v23, v24, (uint64_t)v25);
            }
            if (v25)
            {
LABEL_13:
              free(v25);
              int v26 = 1;
LABEL_68:
              BOOL v27 = v26 == 0;
LABEL_69:

              goto LABEL_70;
            }
LABEL_67:
            int v26 = 1;
            goto LABEL_68;
          }
          if (v13 == (xpc_object_t)MEMORY[0x263EF86A0])
          {
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
            {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v15, v16, v17, v18, v19, v113);
              int v26 = 1;
              goto LABEL_68;
            }
            goto LABEL_67;
          }
          if (v13 == (xpc_object_t)MEMORY[0x263EF86A8])
          {
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
              goto LABEL_67;
            }
            id v47 = nrCopyLogObj_2279();
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v48, v49, v50, v51, v52, (uint64_t)"");
          }
          else
          {
            if (v13 != (xpc_object_t)MEMORY[0x263EF86C0])
            {
              uint64_t v25 = (void *)MEMORY[0x2105128B0](v13);
              if (nrCopyLogObj_onceToken_2285 != -1) {
                dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
              }
              if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
              {
                id v37 = nrCopyLogObj_2279();
                _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received returned unknown XPC error %s", v38, v39, v40, v41, v42, (uint64_t)v25);
              }
              if (v25) {
                goto LABEL_13;
              }
              goto LABEL_67;
            }
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              goto LABEL_67;
            }
            id v47 = nrCopyLogObj_2279();
            _NRLogWithArgs((uint64_t)v47, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v53, v54, v55, v56, v57, v113);
          }

          int v26 = 1;
          goto LABEL_68;
        }
        uint64_t v28 = xpc_dictionary_get_value(v13, "Result");
        uint64_t v34 = (void *)v28;
        if (v28)
        {
          if (MEMORY[0x210512A10](v28) == MEMORY[0x263EF8738])
          {
            unint64_t value = xpc_int64_get_value(v34);
            if (!value)
            {
              int v26 = 0;
              goto LABEL_43;
            }
            uint64_t v44 = value;
            if (value >> 31)
            {
              uint64_t v59 = nrCopyLogObj_2279();
              uint64_t v60 = v59;
              if (!v44)
              {
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v74 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);

                  if (!v74) {
                    goto LABEL_42;
                  }
                }
                id v75 = nrCopyLogObj_2279();
                StringFromNRXPCRes = createStringFromNRXPCRes(v44);
                _NRLogWithArgs((uint64_t)v75, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v76, v77, v78, v79, v80, (uint64_t)"");

                goto LABEL_42;
              }
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v68 = os_log_type_enabled(v59, OS_LOG_TYPE_FAULT);

                if (!v68) {
                  goto LABEL_42;
                }
              }
              id v62 = nrCopyLogObj_2279();
              uint64_t v112 = createStringFromNRXPCRes(v44);
              _NRLogWithArgs((uint64_t)v62, 17, (uint64_t)"received internal failure result code: [%lld] %@", v69, v70, v71, v72, v73, v44);
            }
            else
            {
              if (strerror_r(value, __strerrbuf, 0x80uLL)) {
                __strerrbuf[0] = 0;
              }
              id v45 = nrCopyLogObj_2279();
              BOOL v46 = v45;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v61 = os_log_type_enabled(v45, OS_LOG_TYPE_FAULT);

                if (!v61) {
                  goto LABEL_42;
                }
              }
              id v62 = nrCopyLogObj_2279();
              _NRLogWithArgs((uint64_t)v62, 17, (uint64_t)"received failure result code: [%d] %s", v63, v64, v65, v66, v67, v44);
            }

            goto LABEL_42;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_42;
          }
          uint64_t v35 = nrCopyLogObj_sNRLogObj_2286;
          id v36 = "received invalid result type";
        }
        else
        {
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_42;
          }
          uint64_t v35 = nrCopyLogObj_sNRLogObj_2286;
          id v36 = "received response without result code";
        }
        _NRLogWithArgs(v35, 17, (uint64_t)v36, v29, v30, v31, v32, v33, v113);
LABEL_42:
        int v26 = 1;
LABEL_43:

        goto LABEL_68;
      }
      uint64_t v87 = nrCopyLogObj_2279();
      unsigned int v88 = v87;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v104 = os_log_type_enabled(v87, OS_LOG_TYPE_FAULT);

        if (!v104)
        {
LABEL_101:
          BOOL v27 = 0;
          goto LABEL_69;
        }
      }
      id v105 = nrCopyLogObj_2279();
      _NRLogWithArgs((uint64_t)v105, 17, (uint64_t)"received nil response", v106, v107, v108, v109, v110, v113);

      goto LABEL_101;
    }
    unsigned __int8 v84 = nrCopyLogObj_2279();
    uint64_t v85 = v84;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v86 = os_log_type_enabled(v84, OS_LOG_TYPE_ERROR);

      if (!v86) {
        goto LABEL_97;
      }
    }
    id v96 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v96, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v97, v98, v99, v100, v101, (uint64_t)"");

LABEL_97:
    _os_log_pack_size();
    MEMORY[0x270FA5388]();
    __error();
    uint64_t v102 = _os_log_pack_fill();
    __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v102, (uint64_t)"nr_xpc_dictionary_create");
LABEL_98:
    id v103 = nrCopyLogObj_2279();
    _NRLogAbortWithPack(v103);
  }
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
  {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"Failed to open \"%s\"", v5, v6, v7, v8, v9, (uint64_t)v3);
    BOOL v27 = 0;
  }
  else
  {
    BOOL v27 = 0;
  }
LABEL_70:

  return v27;
}

id NRDiagnosticSaveNetworkRelayStatusToTempDirectory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Saving diagnostic status to temp directory", a4, a5, a6, a7, a8, (uint64_t)"");
  }
  id v8 = [NSString alloc];
  uint64_t v9 = [MEMORY[0x263F08C38] UUID];
  int v10 = [v9 UUIDString];
  xpc_object_t v11 = (void *)[v8 initWithFormat:@"/tmp/terminusd/%@", v10];

  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  char v29 = 0;
  if ([v12 fileExistsAtPath:v11 isDirectory:&v29] && v29) {
    goto LABEL_21;
  }
  if (nrCopyLogObj_onceToken_2285 == -1)
  {
    if (!sNRCopyLogToStdErr) {
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    if (!sNRCopyLogToStdErr)
    {
LABEL_10:
      if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
    }
  }
  _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Creating temporary directory at \"%@\"", v13, v14, v15, v16, v17, (uint64_t)"");
LABEL_12:
  id v28 = 0;
  [v12 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v28];
  id v18 = v28;
  if (!v18)
  {
    if (nrCopyLogObj_onceToken_2285 == -1)
    {
      if (!sNRCopyLogToStdErr) {
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      if (!sNRCopyLogToStdErr)
      {
LABEL_19:
        if (!os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
      }
    }
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Created temporary directory at \"%@\"", v19, v20, v21, v22, v23, (uint64_t)"");
LABEL_21:
    uint64_t v24 = nrSaveNetworkRelayStatusToDirectory(v11);
    id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v25 = v26;
    if (v24) {
      [v26 addObject:v24];
    }
    goto LABEL_23;
  }
  uint64_t v24 = v18;
  if (nrCopyLogObj_onceToken_2285 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_16:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d Failed to create directory at \"%@\": %@", v19, v20, v21, v22, v23, (uint64_t)"");
      uint64_t v25 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    if (sNRCopyLogToStdErr) {
      goto LABEL_16;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
    goto LABEL_16;
  }
  uint64_t v25 = 0;
LABEL_23:

  return v25;
}

BOOL NRDiagnosticSaveNetworkRelayStatusToFile(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    uint64_t v15 = nrCopyLogObj_2279();
    uint64_t v16 = v15;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v17 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (!v17) {
        goto LABEL_31;
      }
    }
    id v24 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v24, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL filePath", v25, v26, v27, v28, v29, (uint64_t)"");

    goto LABEL_31;
  }
  xpc_object_t v2 = v1;
  if (![v1 length])
  {
    id v18 = nrCopyLogObj_2279();
    uint64_t v19 = v18;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v20 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

      if (!v20) {
        goto LABEL_31;
      }
    }
    id v30 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v30, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL filePath.length", v31, v32, v33, v34, v35, (uint64_t)"");

    goto LABEL_31;
  }
  if (![v2 UTF8String])
  {
    uint64_t v21 = nrCopyLogObj_2279();
    uint64_t v22 = v21;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v23 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (!v23)
      {
LABEL_31:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v42 = _os_log_pack_fill();
        *(_DWORD *)uint64_t v42 = 136446466;
        *(void *)(v42 + 4) = "NRDiagnosticSaveNetworkRelayStatusToFile";
        *(_WORD *)(v42 + 12) = 2080;
        *(void *)(v42 + 14) = "NRDiagnosticSaveNetworkRelayStatusToFile";
        id v43 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v43);
      }
    }
    id v36 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v36, 16, (uint64_t)"%s%.30s:%-4d ABORTING: BUG IN CLIENT OF NetworkRelay: %s called with NULL filePathC", v37, v38, v39, v40, v41, (uint64_t)"");

    goto LABEL_31;
  }
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Saving diagnostic status to file \"%s\"", v3, v4, v5, v6, v7, (uint64_t)"");
  }
  BOOL v13 = nrSaveNetworkRelayStatusToFile(v2);
  if (nrCopyLogObj_onceToken_2285 == -1)
  {
    if (sNRCopyLogToStdErr)
    {
LABEL_12:
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 0, (uint64_t)"%s%.30s:%-4d Saved diagnostic status to file \"%s\"", v8, v9, v10, v11, v12, (uint64_t)"");
      goto LABEL_13;
    }
  }
  else
  {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    if (sNRCopyLogToStdErr) {
      goto LABEL_12;
    }
  }
  if (os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_12;
  }
LABEL_13:

  return v13;
}

void *nrXPCCompanionLinkCancel()
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v53 = nrCopyLogObj_2279();
    uint64_t v54 = v53;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        id v65 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v65);
      }
    }
    id v58 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_79;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 5uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkCancel", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v56 = nrCopyLogObj_2279();
    uint64_t v57 = v56;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    id v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    uint64_t v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          uint64 = (void *)xpc_dictionary_get_uint64(v3, "CompanionLinkCount");
          goto LABEL_35;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v44 = nrCopyLogObj_2279();
            id v45 = v44;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46) {
                goto LABEL_33;
              }
            }
            id v47 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          BOOL v68 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      id v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      id v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    uint64 = (void *)MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)uint64);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    id v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)uint64);
  }
LABEL_10:
  if (uint64)
  {
    free(uint64);
LABEL_34:
    uint64 = 0;
  }
LABEL_35:

  return uint64;
}

BOOL nrXPCCompanionFlushBTPipe()
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v61 = nrCopyLogObj_2279();
    uint64_t v62 = v61;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        id v73 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v73);
      }
    }
    id v66 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x30uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionFlushBTPipe", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v64 = nrCopyLogObj_2279();
    id v65 = v64;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        BOOL v45 = 0;
        goto LABEL_63;
      }
    }
    id v75 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v17 = xpc_dictionary_get_value(v3, "Result");
    id v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x210512A10](v17) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v23);
        if (!value)
        {
          int v16 = 0;
          goto LABEL_36;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v52 = nrCopyLogObj_2279();
            uint64_t v53 = v52;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54) {
                goto LABEL_35;
              }
            }
            id v55 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          uint64_t v82 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        int v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x263EF8720])
  {
    if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v39 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        int v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      }
      if (v15) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v16 = 1;
    goto LABEL_62;
  }
  uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  }
  if (!v15) {
    goto LABEL_61;
  }
LABEL_11:
  free(v15);
  int v16 = 1;
LABEL_62:
  BOOL v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionEnableCloudLink()
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v61 = nrCopyLogObj_2279();
    uint64_t v62 = v61;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        id v73 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v73);
      }
    }
    id v66 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x17uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionEnableCloudLink", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v64 = nrCopyLogObj_2279();
    id v65 = v64;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        BOOL v45 = 0;
        goto LABEL_63;
      }
    }
    id v75 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v17 = xpc_dictionary_get_value(v3, "Result");
    id v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x210512A10](v17) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v23);
        if (!value)
        {
          int v16 = 0;
          goto LABEL_36;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v52 = nrCopyLogObj_2279();
            uint64_t v53 = v52;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54) {
                goto LABEL_35;
              }
            }
            id v55 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          uint64_t v82 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        int v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x263EF8720])
  {
    if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v39 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        int v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      }
      if (v15) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v16 = 1;
    goto LABEL_62;
  }
  uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  }
  if (!v15) {
    goto LABEL_61;
  }
LABEL_11:
  free(v15);
  int v16 = 1;
LABEL_62:
  BOOL v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionDisableCloudLink()
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v61 = nrCopyLogObj_2279();
    uint64_t v62 = v61;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        id v73 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v73);
      }
    }
    id v66 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_83;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x18uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionDisableCloudLink", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    uint64_t v64 = nrCopyLogObj_2279();
    id v65 = v64;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v74 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v74)
      {
LABEL_86:
        BOOL v45 = 0;
        goto LABEL_63;
      }
    }
    id v75 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"received nil response", v76, v77, v78, v79, v80, v83);

    goto LABEL_86;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v17 = xpc_dictionary_get_value(v3, "Result");
    id v23 = (void *)v17;
    if (v17)
    {
      if (MEMORY[0x210512A10](v17) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v23);
        if (!value)
        {
          int v16 = 0;
          goto LABEL_36;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v52 = nrCopyLogObj_2279();
            uint64_t v53 = v52;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v54 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);

              if (!v54) {
                goto LABEL_35;
              }
            }
            id v55 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v55, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v56, v57, v58, v59, v60, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          uint64_t v82 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v47, v48, v49, v50, v51, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_35:
        int v16 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v24 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v25 = "received response without result code";
    }
    _NRLogWithArgs(v24, 17, (uint64_t)v25, v18, v19, v20, v21, v22, v83);
    goto LABEL_35;
  }
  if (v4 == MEMORY[0x263EF8720])
  {
    if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v83);
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
        int v16 = 1;
        goto LABEL_62;
      }
    }
    else if (v3 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v39 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v39, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v40, v41, v42, v43, v44, v83);

        int v16 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v26, v27, v28, v29, v30, (uint64_t)v15);
      }
      if (v15) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v16 = 1;
    goto LABEL_62;
  }
  uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
  }
  if (!v15) {
    goto LABEL_61;
  }
LABEL_11:
  free(v15);
  int v16 = 1;
LABEL_62:
  BOOL v45 = v16 == 0;
LABEL_63:

  return v45;
}

BOOL nrXPCCompanionSetWatchRoleSwitchAllowed(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x26uLL);
  xpc_dictionary_set_BOOL(v3, "WatchRoleSwitchAllowed", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetWatchRoleSwitchAllowed", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSetSimulateAltAccount(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x25uLL);
  xpc_dictionary_set_BOOL(v3, "SimulateAltAccount", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetSimulateAltAccount", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSetRangeExtensionAllowed(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x1DuLL);
  xpc_dictionary_set_BOOL(v3, "WiFiRangeExtensionAllowed", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetRangeExtensionAllowed", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSetTetheringBundleIDs(void *a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v1 = a1;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_85:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_85;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x33uLL);
  if (v1) {
    xpc_dictionary_set_string(v3, "TetheringBundleIDs", (const char *)[v1 UTF8String]);
  }
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetTetheringBundleIDs", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_88:
        BOOL v47 = 0;
        goto LABEL_65;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_88;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_38;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_37;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_37;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_37;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_37;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_37:
        int v18 = 1;
LABEL_38:

        goto LABEL_64;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_37;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_37;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_37;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_64;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_64;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_64;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_13;
      }
    }
LABEL_63:
    int v18 = 1;
    goto LABEL_64;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_63;
  }
LABEL_13:
  free(v17);
  int v18 = 1;
LABEL_64:
  BOOL v47 = v18 == 0;
LABEL_65:

  return v47;
}

BOOL nrXPCCompanionSetPreferWiFiAllowed(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x1EuLL);
  xpc_dictionary_set_BOOL(v3, "PreferWiFiAllowed", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetPreferWiFiAllowed", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionBlockSHOESTraffic(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x27uLL);
  xpc_dictionary_set_BOOL(v3, "BlockSHOESTraffic", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionBlockSHOESTraffic", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionBlockIDSTraffic(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x28uLL);
  xpc_dictionary_set_BOOL(v3, "BlockIDSTraffic", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionBlockIDSTraffic", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSimulateWakePacket(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    BOOL v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x2BuLL);
  xpc_dictionary_set_BOOL(v3, "SimulateWakePacket", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSimulateWakePacket", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    id v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            BOOL v54 = nrCopyLogObj_2279();
            id v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          unsigned __int8 v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCCompanionSetFixedInterfaceMode(BOOL a1, void *a2, void *a3, void *a4)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (!v10)
  {
    uint64_t v71 = nrCopyLogObj_2279();
    uint64_t v72 = v71;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v73 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);

      if (!v73)
      {
LABEL_89:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v82 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v82, (uint64_t)"nr_xpc_dictionary_create");
        id v83 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v83);
      }
    }
    id v76 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v76, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v77, v78, v79, v80, v81, (uint64_t)"");

    goto LABEL_89;
  }
  uint64_t v11 = v10;
  xpc_dictionary_set_uint64(v10, "Type", 0x20uLL);
  xpc_dictionary_set_BOOL(v11, "FixedInterfaceModeSetEnabled", a1);
  if (v7) {
    xpc_dictionary_set_string(v11, "FixedInterfaceModeInterfaceName", (const char *)[v7 UTF8String]);
  }
  if (v8) {
    xpc_dictionary_set_string(v11, "FixedInterfaceModePeerAddress", (const char *)[v8 UTF8String]);
  }
  if (v9) {
    xpc_dictionary_set_string(v11, "IDSDeviceID", (const char *)[v9 UTF8String]);
  }
  xpc_object_t v12 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionSetFixedInterfaceMode", v11);
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v74 = nrCopyLogObj_2279();
    id v75 = v74;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v84 = os_log_type_enabled(v74, OS_LOG_TYPE_FAULT);

      if (!v84)
      {
LABEL_92:
        BOOL v55 = 0;
        goto LABEL_69;
      }
    }
    id v85 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v85, 17, (uint64_t)"received nil response", v86, v87, v88, v89, v90, v93);

    goto LABEL_92;
  }
  uint64_t v14 = MEMORY[0x210512A10](v12);
  if (v14 == MEMORY[0x263EF8708])
  {
    uint64_t v27 = xpc_dictionary_get_value(v13, "Result");
    id v33 = (void *)v27;
    if (v27)
    {
      if (MEMORY[0x210512A10](v27) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v33);
        if (!value)
        {
          int v26 = 0;
          goto LABEL_42;
        }
        uint64_t v42 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v62 = nrCopyLogObj_2279();
            BOOL v63 = v62;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v64 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);

              if (!v64) {
                goto LABEL_41;
              }
            }
            id v65 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v42);
            _NRLogWithArgs((uint64_t)v65, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v66, v67, v68, v69, v70, (uint64_t)"");

            goto LABEL_41;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_41;
          }
          id v43 = nrCopyLogObj_2279();
          uint64_t v92 = createStringFromNRXPCRes(v42);
          _NRLogWithArgs((uint64_t)v43, 17, (uint64_t)"received internal failure result code: [%lld] %@", v57, v58, v59, v60, v61, v42);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_41;
          }
          id v43 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v43, 17, (uint64_t)"received failure result code: [%d] %s", v44, v45, v46, v47, v48, v42);
        }

LABEL_41:
        int v26 = 1;
LABEL_42:

        goto LABEL_68;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_41;
      }
      uint64_t v34 = nrCopyLogObj_sNRLogObj_2286;
      id v35 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_41;
      }
      uint64_t v34 = nrCopyLogObj_sNRLogObj_2286;
      id v35 = "received response without result code";
    }
    _NRLogWithArgs(v34, 17, (uint64_t)v35, v28, v29, v30, v31, v32, v93);
    goto LABEL_41;
  }
  if (v14 == MEMORY[0x263EF8720])
  {
    if (v13 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v15, v16, v17, v18, v19, v93);
        int v26 = 1;
        goto LABEL_68;
      }
    }
    else if (v13 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v15, v16, v17, v18, v19, (uint64_t)"");
        int v26 = 1;
        goto LABEL_68;
      }
    }
    else if (v13 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v49 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v49, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v50, v51, v52, v53, v54, v93);

        int v26 = 1;
        goto LABEL_68;
      }
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x2105128B0](v13);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v36, v37, v38, v39, v40, (uint64_t)v25);
      }
      if (v25) {
        goto LABEL_17;
      }
    }
LABEL_67:
    int v26 = 1;
    goto LABEL_68;
  }
  uint64_t v25 = (void *)MEMORY[0x2105128B0](v13);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v20, v21, v22, v23, v24, (uint64_t)v25);
  }
  if (!v25) {
    goto LABEL_67;
  }
LABEL_17:
  free(v25);
  int v26 = 1;
LABEL_68:
  BOOL v55 = v26 == 0;
LABEL_69:

  return v55;
}

BOOL nrXPCCompanionLinkSubmitTestBTLinkRecommendation(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestBTLinkRecommendation", a2);
}

BOOL nrXPCCompanionLinkSubmitTestLinkRecommendation(const unsigned __int8 *a1, const char *a2, int a3)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (!v6)
  {
    uint64_t v68 = nrCopyLogObj_2279();
    uint64_t v69 = v68;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v70 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);

      if (!v70)
      {
LABEL_86:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v79 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v79, (uint64_t)"nr_xpc_dictionary_create");
        id v80 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v80);
      }
    }
    id v73 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v73, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v74, v75, v76, v77, v78, (uint64_t)"");

    goto LABEL_86;
  }
  id v7 = v6;
  xpc_dictionary_set_uint64(v6, "Type", 0x1AuLL);
  xpc_dictionary_set_uuid(v7, "DeviceIdentifier", a1);
  if (a3) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  xpc_dictionary_set_uint64(v7, a2, v8);
  xpc_object_t v9 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkSubmitTestLinkRecommendation", v7);
  xpc_object_t v10 = v9;
  if (!v9)
  {
    uint64_t v71 = nrCopyLogObj_2279();
    uint64_t v72 = v71;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v81 = os_log_type_enabled(v71, OS_LOG_TYPE_FAULT);

      if (!v81)
      {
LABEL_89:
        BOOL v52 = 0;
        goto LABEL_66;
      }
    }
    id v82 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v82, 17, (uint64_t)"received nil response", v83, v84, v85, v86, v87, v90);

    goto LABEL_89;
  }
  uint64_t v11 = MEMORY[0x210512A10](v9);
  if (v11 == MEMORY[0x263EF8708])
  {
    uint64_t v24 = xpc_dictionary_get_value(v10, "Result");
    uint64_t v30 = (void *)v24;
    if (v24)
    {
      if (MEMORY[0x210512A10](v24) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v30);
        if (!value)
        {
          int v23 = 0;
          goto LABEL_39;
        }
        uint64_t v39 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v59 = nrCopyLogObj_2279();
            uint64_t v60 = v59;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v61 = os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);

              if (!v61) {
                goto LABEL_38;
              }
            }
            id v62 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v39);
            _NRLogWithArgs((uint64_t)v62, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v63, v64, v65, v66, v67, (uint64_t)"");

            goto LABEL_38;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_38;
          }
          id v40 = nrCopyLogObj_2279();
          uint64_t v89 = createStringFromNRXPCRes(v39);
          _NRLogWithArgs((uint64_t)v40, 17, (uint64_t)"received internal failure result code: [%lld] %@", v54, v55, v56, v57, v58, v39);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_38;
          }
          id v40 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v40, 17, (uint64_t)"received failure result code: [%d] %s", v41, v42, v43, v44, v45, v39);
        }

LABEL_38:
        int v23 = 1;
LABEL_39:

        goto LABEL_65;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_38;
      }
      uint64_t v31 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v32 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_38;
      }
      uint64_t v31 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v32 = "received response without result code";
    }
    _NRLogWithArgs(v31, 17, (uint64_t)v32, v25, v26, v27, v28, v29, v90);
    goto LABEL_38;
  }
  if (v11 == MEMORY[0x263EF8720])
  {
    if (v10 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v12, v13, v14, v15, v16, v90);
        int v23 = 1;
        goto LABEL_65;
      }
    }
    else if (v10 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v12, v13, v14, v15, v16, (uint64_t)"");
        int v23 = 1;
        goto LABEL_65;
      }
    }
    else if (v10 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v46 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v46, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v47, v48, v49, v50, v51, v90);

        int v23 = 1;
        goto LABEL_65;
      }
    }
    else
    {
      uint64_t v22 = (void *)MEMORY[0x2105128B0](v10);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v33, v34, v35, v36, v37, (uint64_t)v22);
      }
      if (v22) {
        goto LABEL_14;
      }
    }
LABEL_64:
    int v23 = 1;
    goto LABEL_65;
  }
  uint64_t v22 = (void *)MEMORY[0x2105128B0](v10);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v17, v18, v19, v20, v21, (uint64_t)v22);
  }
  if (!v22) {
    goto LABEL_64;
  }
LABEL_14:
  free(v22);
  int v23 = 1;
LABEL_65:
  BOOL v52 = v23 == 0;
LABEL_66:

  return v52;
}

BOOL nrXPCCompanionLinkSubmitTestCompanionWiFiLinkRecommendation(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestCompanionWiFiLinkRecommendation", a2);
}

BOOL nrXPCCompanionLinkSubmitTestDirectWiFiLinkRecommendation(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestDirectWiFiLinkRecommendation", a2);
}

BOOL nrXPCCompanionLinkSubmitTestALUAdviceWiFi(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestALUAdviceWiFi", a2);
}

BOOL nrXPCCompanionLinkSubmitTestALUAdviceBluetooth(const unsigned __int8 *a1, int a2)
{
  return nrXPCCompanionLinkSubmitTestLinkRecommendation(a1, "TestALUAdviceBluetooth", a2);
}

BOOL nrXPCCompanionLinkSetEncryptionType(unsigned int a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    uint64_t v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  uint64_t v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x2CuLL);
  xpc_dictionary_set_uint64(v3, "CompanionLinkEncryptionType", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCCompanionLinkSetEncryptionType", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v54 = nrCopyLogObj_2279();
            uint64_t v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          uint64_t v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

char *nrXPCTestCopyBabelRoutes()
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v53 = nrCopyLogObj_2279();
    uint64_t v54 = v53;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v55 = os_log_type_enabled(v53, OS_LOG_TYPE_ERROR);

      if (!v55)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v64 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v64, (uint64_t)"nr_xpc_dictionary_create");
        id v65 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v65);
      }
    }
    id v58 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v59, v60, v61, v62, v63, (uint64_t)"");

    goto LABEL_80;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x1BuLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCTestCopyBabelRoutes", v1);
  uint64_t v3 = v2;
  if (!v2)
  {
    BOOL v56 = nrCopyLogObj_2279();
    id v57 = v56;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v66 = os_log_type_enabled(v56, OS_LOG_TYPE_FAULT);

      if (!v66) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    uint64_t v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          string = (char *)xpc_dictionary_get_string(v3, "BabelRoutes");
          if (string) {
            string = (char *)[[NSString alloc] initWithUTF8String:string];
          }
          goto LABEL_35;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v44 = nrCopyLogObj_2279();
            uint64_t v45 = v44;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v46 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

              if (!v46) {
                goto LABEL_33;
              }
            }
            id v47 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v47, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v48, v49, v50, v51, v52, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          id v68 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v39, v40, v41, v42, v43, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v69);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    string = (char *)MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)string);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v69);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  string = (char *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)string);
  }
LABEL_10:
  if (string)
  {
    free(string);
LABEL_34:
    string = 0;
  }
LABEL_35:

  return string;
}

void *nrXPCCopyResolvedEndpoint(void *a1, uint64_t a2)
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (v3)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      uint64_t v5 = v4;
      xpc_dictionary_set_uint64(v4, "Type", 6uLL);
      *(void *)uuid = 0;
      uint64_t v111 = 0;
      [v3 getUUIDBytes:uuid];
      xpc_dictionary_set_uuid(v5, "NRUUID", uuid);
      xpc_dictionary_set_uint64(v5, "DataProtectionClass", a2);
      xpc_object_t v6 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyResolvedEndpoint", v5);
      uint64_t v7 = v6;
      if (!v6)
      {
        uint64_t v87 = nrCopyLogObj_2279();
        uint64_t v88 = v87;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v104 = os_log_type_enabled(v87, OS_LOG_TYPE_FAULT);

          if (!v104) {
            goto LABEL_35;
          }
        }
        id v43 = nrCopyLogObj_2279();
        uint64_t v49 = v43;
        uint64_t v50 = "received nil response";
        goto LABEL_62;
      }
      uint64_t v8 = MEMORY[0x210512A10](v6);
      if (v8 != MEMORY[0x263EF8708])
      {
        if (v8 != MEMORY[0x263EF8720])
        {
          uint64_t v19 = (void *)MEMORY[0x2105128B0](v7);
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v14, v15, v16, v17, v18, (uint64_t)v19);
          }
LABEL_11:
          if (!v19)
          {
LABEL_36:

            goto LABEL_37;
          }
          free(v19);
LABEL_35:
          uint64_t v19 = 0;
          goto LABEL_36;
        }
        if (v7 == (void *)MEMORY[0x263EF86A0])
        {
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v9, v10, v11, v12, v13, v107);
          }
          goto LABEL_35;
        }
        if (v7 == (void *)MEMORY[0x263EF86A8])
        {
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v9, v10, v11, v12, v13, (uint64_t)"");
          }
          goto LABEL_35;
        }
        if (v7 != (void *)MEMORY[0x263EF86C0])
        {
          uint64_t v19 = (void *)MEMORY[0x2105128B0](v7);
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v29, v30, v31, v32, v33, (uint64_t)v19);
          }
          goto LABEL_11;
        }
        if (nrCopyLogObj_onceToken_2285 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
          goto LABEL_35;
        }
        id v43 = nrCopyLogObj_2279();
        uint64_t v49 = v43;
        uint64_t v50 = "received XPC_ERROR_TERMINATION_IMMINENT";
LABEL_62:
        _NRLogWithArgs((uint64_t)v43, 17, (uint64_t)v50, v44, v45, v46, v47, v48, v107);

        goto LABEL_35;
      }
      uint64_t v20 = xpc_dictionary_get_value(v7, "Result");
      uint64_t v26 = (void *)v20;
      if (!v20)
      {
        if (nrCopyLogObj_onceToken_2285 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
          goto LABEL_34;
        }
        uint64_t v27 = nrCopyLogObj_sNRLogObj_2286;
        uint64_t v28 = "received response without result code";
LABEL_33:
        _NRLogWithArgs(v27, 17, (uint64_t)v28, v21, v22, v23, v24, v25, v107);
        goto LABEL_34;
      }
      if (MEMORY[0x210512A10](v20) != MEMORY[0x263EF8738])
      {
        if (nrCopyLogObj_onceToken_2285 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
        }
        if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
          goto LABEL_34;
        }
        uint64_t v27 = nrCopyLogObj_sNRLogObj_2286;
        uint64_t v28 = "received invalid result type";
        goto LABEL_33;
      }
      unint64_t value = xpc_int64_get_value(v26);
      if (value)
      {
        uint64_t v36 = value;
        if (value >> 31)
        {
          if (!value)
          {
            id v68 = nrCopyLogObj_2279();
            uint64_t v69 = v68;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v75 = os_log_type_enabled(v68, OS_LOG_TYPE_ERROR);

              if (!v75) {
                goto LABEL_34;
              }
            }
            id v76 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v36);
            _NRLogWithArgs((uint64_t)v76, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v77, v78, v79, v80, v81, (uint64_t)"");

            goto LABEL_34;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_34;
          }
          id v37 = nrCopyLogObj_2279();
          uint64_t v106 = createStringFromNRXPCRes(v36);
          _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received internal failure result code: [%lld] %@", v63, v64, v65, v66, v67, v36);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_34;
          }
          id v37 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received failure result code: [%d] %s", v38, v39, v40, v41, v42, v36);
        }

LABEL_34:
        goto LABEL_35;
      }

      uint64_t v51 = xpc_dictionary_get_value(v7, "IPv6Address");
      id v57 = (void *)v51;
      if (v51)
      {
        if (MEMORY[0x210512A10](v51) == MEMORY[0x263EF86F8])
        {
          *(void *)__strerrbuf = 0;
          uint64_t v109 = 0;
          if (xpc_data_get_bytes(v57, __strerrbuf, 0, 0x10uLL) == 16)
          {
            uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:__strerrbuf length:16];
LABEL_94:

            goto LABEL_36;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d Response of invalid length %zu", v70, v71, v72, v73, v74, (uint64_t)"");
          }
        }
        else
        {
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
            _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d Response of invalid type", v58, v59, v60, v61, v62, (uint64_t)"");
          }
        }
      }
      else
      {
        if (nrCopyLogObj_onceToken_2285 != -1) {
          dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
        }
        if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
          _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d Missing address", v52, v53, v54, v55, v56, (uint64_t)"");
        }
      }
      uint64_t v19 = 0;
      goto LABEL_94;
    }
    uint64_t v84 = nrCopyLogObj_2279();
    uint64_t v85 = v84;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v86 = os_log_type_enabled(v84, OS_LOG_TYPE_ERROR);

      if (!v86)
      {
LABEL_104:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v95 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v95, (uint64_t)"nr_xpc_dictionary_create");
        id v96 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v96);
      }
    }
    id v89 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v89, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v90, v91, v92, v93, v94, (uint64_t)"");

    goto LABEL_104;
  }
  uint64_t v82 = nrCopyLogObj_2279();
  uint64_t v83 = v82;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v97 = os_log_type_enabled(v82, OS_LOG_TYPE_FAULT);

    if (!v97)
    {
      uint64_t v19 = 0;
      goto LABEL_37;
    }
  }
  id v98 = nrCopyLogObj_2279();
  _NRLogWithArgs((uint64_t)v98, 17, (uint64_t)"%s called with null nrUUID", v99, v100, v101, v102, v103, (uint64_t)"nrXPCCopyResolvedEndpoint");

  uint64_t v19 = 0;
LABEL_37:

  return v19;
}

BOOL nrXPCSetPacketLogging(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    uint64_t v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  id v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 7uLL);
  xpc_dictionary_set_BOOL(v3, "PacketLoggingVal", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCSetPacketLogging", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v54 = nrCopyLogObj_2279();
            uint64_t v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          uint64_t v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

BOOL nrXPCSetMPKLLogging(BOOL a1)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    uint64_t v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v65 = os_log_type_enabled(v63, OS_LOG_TYPE_ERROR);

      if (!v65)
      {
LABEL_83:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v74 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v74, (uint64_t)"nr_xpc_dictionary_create");
        id v75 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v75);
      }
    }
    id v68 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v68, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v69, v70, v71, v72, v73, (uint64_t)"");

    goto LABEL_83;
  }
  id v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x1FuLL);
  xpc_dictionary_set_BOOL(v3, "MPKLLoggingVal", a1);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCSetMPKLLogging", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v66 = nrCopyLogObj_2279();
    uint64_t v67 = v66;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v76 = os_log_type_enabled(v66, OS_LOG_TYPE_FAULT);

      if (!v76)
      {
LABEL_86:
        BOOL v47 = 0;
        goto LABEL_63;
      }
    }
    id v77 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v77, 17, (uint64_t)"received nil response", v78, v79, v80, v81, v82, v85);

    goto LABEL_86;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {
          int v18 = 0;
          goto LABEL_36;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v54 = nrCopyLogObj_2279();
            uint64_t v55 = v54;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

              if (!v56) {
                goto LABEL_35;
              }
            }
            id v57 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          uint64_t v84 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_35:
        int v18 = 1;
LABEL_36:

        goto LABEL_62;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      uint64_t v26 = nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
    _NRLogWithArgs(v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v85);
    goto LABEL_35;
  }
  if (v6 == MEMORY[0x263EF8720])
  {
    if (v5 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v85);
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
      {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
        int v18 = 1;
        goto LABEL_62;
      }
    }
    else if (v5 == (void *)MEMORY[0x263EF86C0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
      {
        id v41 = nrCopyLogObj_2279();
        _NRLogWithArgs((uint64_t)v41, 17, (uint64_t)"received XPC_ERROR_TERMINATION_IMMINENT", v42, v43, v44, v45, v46, v85);

        int v18 = 1;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v17);
      }
      if (v17) {
        goto LABEL_11;
      }
    }
LABEL_61:
    int v18 = 1;
    goto LABEL_62;
  }
  uint64_t v17 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)v17);
  }
  if (!v17) {
    goto LABEL_61;
  }
LABEL_11:
  free(v17);
  int v18 = 1;
LABEL_62:
  BOOL v47 = v18 == 0;
LABEL_63:

  return v47;
}

uint64_t nrXPCGetNetworkRelayVersion()
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v54 = nrCopyLogObj_2279();
    uint64_t v55 = v54;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

      if (!v56)
      {
LABEL_81:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v65 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v65, (uint64_t)"nr_xpc_dictionary_create");
        id v66 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v66);
      }
    }
    id v59 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v59, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v60, v61, v62, v63, v64, (uint64_t)"");

    goto LABEL_81;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x2DuLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCGetNetworkRelayVersion", v1);
  id v3 = v2;
  if (!v2)
  {
    id v57 = nrCopyLogObj_2279();
    uint64_t v58 = v57;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v67 = os_log_type_enabled(v57, OS_LOG_TYPE_FAULT);

      if (!v67) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    uint64_t v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          uint64_t uint64 = xpc_dictionary_get_uint64(v3, "NetworkRelayVersion");
          if (uint64 >> 16) {
            LOWORD(v15) = 0;
          }
          else {
            LOWORD(v15) = uint64;
          }
          goto LABEL_35;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v45 = nrCopyLogObj_2279();
            uint64_t v46 = v45;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v47 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);

              if (!v47) {
                goto LABEL_33;
              }
            }
            id v48 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v48, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          uint64_t v69 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v40, v41, v42, v43, v44, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v70);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v70);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    uint64_t v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
  }
LABEL_10:
  if (v15)
  {
    free(v15);
LABEL_34:
    LOWORD(v15) = 0;
  }
LABEL_35:

  return (unsigned __int16)v15;
}

void *nrXPCCopyNRUUIDForBluetoothUUID(void *a1)
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v1 = a1;
  xpc_object_t v2 = v1;
  if (!v1)
  {
    uint64_t v63 = nrCopyLogObj_776();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v78 = os_log_type_enabled(v63, OS_LOG_TYPE_FAULT);

      if (!v78) {
        goto LABEL_94;
      }
    }
    id v79 = nrCopyLogObj_776();
    _NRLogWithArgs((uint64_t)v79, 17, (uint64_t)"%s called with null nsUUID", v80, v81, v82, v83, v84, (uint64_t)"_NRIsUUIDNonZero");

    goto LABEL_94;
  }
  *(void *)uu = 0;
  uint64_t v107 = 0;
  [v1 getUUIDBytes:uu];
  if (!uuid_is_null(uu))
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      xpc_dictionary_set_uint64(v3, "Type", 0xDuLL);
      *(void *)uuid = 0;
      uint64_t v109 = 0;
      [v2 getUUIDBytes:uuid];
      xpc_dictionary_set_uuid(v4, "BluetoothUUID", uuid);
      xpc_object_t v5 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyNRUUIDForBluetoothUUID", v4);
      uint64_t v6 = v5;
      if (v5)
      {
        uint64_t v7 = MEMORY[0x210512A10](v5);
        if (v7 == MEMORY[0x263EF8708])
        {
          uint64_t v19 = xpc_dictionary_get_value(v6, "Result");
          id v25 = (id)v19;
          if (v19)
          {
            if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
            {
              unint64_t value = xpc_int64_get_value(v25);
              if (!value)
              {

                uint64_t v42 = xpc_dictionary_get_uuid(v6, "NRUUID");
                if (v42)
                {
                  uint64_t v43 = v42;
                  if (!uuid_is_null(v42))
                  {
                    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v43];
                    goto LABEL_37;
                  }
                  if (nrCopyLogObj_onceToken_2285 != -1) {
                    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
                  }
                  if (sNRCopyLogToStdErr
                    || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR))
                  {
                    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d All-zero nrUUID in response from daemon", v44, v45, v46, v47, v48, (uint64_t)"");
                  }
                  goto LABEL_36;
                }
                uint64_t v95 = nrCopyLogObj_2279();
                id v96 = v95;
                if (sNRCopyLogToStdErr)
                {
                }
                else
                {
                  BOOL v97 = os_log_type_enabled(v95, OS_LOG_TYPE_ERROR);

                  if (!v97) {
                    goto LABEL_36;
                  }
                }
                id v25 = nrCopyLogObj_2279();
                _NRLogWithArgs((uint64_t)v25, 16, (uint64_t)"%s%.30s:%-4d Missing nrUUID in response from daemon", v98, v99, v100, v101, v102, (uint64_t)"");
                goto LABEL_35;
              }
              uint64_t v35 = value;
              if (value >> 31)
              {
                if (!value)
                {
                  uint64_t v54 = nrCopyLogObj_2279();
                  uint64_t v55 = v54;
                  if (sNRCopyLogToStdErr)
                  {
                  }
                  else
                  {
                    BOOL v56 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);

                    if (!v56) {
                      goto LABEL_35;
                    }
                  }
                  id v57 = nrCopyLogObj_2279();
                  StringFromNRXPCRes = createStringFromNRXPCRes(v35);
                  _NRLogWithArgs((uint64_t)v57, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v58, v59, v60, v61, v62, (uint64_t)"");

                  goto LABEL_35;
                }
                if (nrCopyLogObj_onceToken_2285 != -1) {
                  dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
                }
                if (!sNRCopyLogToStdErr
                  && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
                {
                  goto LABEL_35;
                }
                id v36 = nrCopyLogObj_2279();
                BOOL v104 = createStringFromNRXPCRes(v35);
                _NRLogWithArgs((uint64_t)v36, 17, (uint64_t)"received internal failure result code: [%lld] %@", v49, v50, v51, v52, v53, v35);
              }
              else
              {
                if (strerror_r(value, (char *)uu, 0x80uLL)) {
                  uu[0] = 0;
                }
                if (nrCopyLogObj_onceToken_2285 != -1) {
                  dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
                }
                if (!sNRCopyLogToStdErr
                  && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT))
                {
                  goto LABEL_35;
                }
                id v36 = nrCopyLogObj_2279();
                _NRLogWithArgs((uint64_t)v36, 17, (uint64_t)"received failure result code: [%d] %s", v37, v38, v39, v40, v41, v35);
              }

LABEL_35:
              goto LABEL_36;
            }
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              goto LABEL_35;
            }
            id v26 = (id)nrCopyLogObj_sNRLogObj_2286;
            uint64_t v27 = "received invalid result type";
          }
          else
          {
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              goto LABEL_35;
            }
            id v26 = (id)nrCopyLogObj_sNRLogObj_2286;
            uint64_t v27 = "received response without result code";
          }
        }
        else
        {
          if (v7 != MEMORY[0x263EF8720])
          {
            uint64_t v18 = (void *)MEMORY[0x2105128B0](v6);
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v13, v14, v15, v16, v17, (uint64_t)v18);
            }
LABEL_12:
            if (!v18)
            {
LABEL_37:

              goto LABEL_38;
            }
            free(v18);
LABEL_36:
            uint64_t v18 = 0;
            goto LABEL_37;
          }
          if (v6 == (void *)MEMORY[0x263EF86A0])
          {
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v8, v9, v10, v11, v12, v105);
            }
            goto LABEL_36;
          }
          if (v6 == (void *)MEMORY[0x263EF86A8])
          {
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v8, v9, v10, v11, v12, (uint64_t)"");
            }
            goto LABEL_36;
          }
          if (v6 != (void *)MEMORY[0x263EF86C0])
          {
            uint64_t v18 = (void *)MEMORY[0x2105128B0](v6);
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v18);
            }
            goto LABEL_12;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_36;
          }
          id v26 = nrCopyLogObj_2279();
          id v25 = v26;
          uint64_t v27 = "received XPC_ERROR_TERMINATION_IMMINENT";
        }
      }
      else
      {
        id v68 = nrCopyLogObj_2279();
        uint64_t v69 = v68;
        if (sNRCopyLogToStdErr)
        {
        }
        else
        {
          BOOL v94 = os_log_type_enabled(v68, OS_LOG_TYPE_FAULT);

          if (!v94) {
            goto LABEL_36;
          }
        }
        id v26 = nrCopyLogObj_2279();
        id v25 = v26;
        uint64_t v27 = "received nil response";
      }
      _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v105);
      goto LABEL_35;
    }
    uint64_t v65 = nrCopyLogObj_2279();
    id v66 = v65;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v67 = os_log_type_enabled(v65, OS_LOG_TYPE_ERROR);

      if (!v67)
      {
LABEL_91:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v76 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v76, (uint64_t)"nr_xpc_dictionary_create");
        id v77 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v77);
      }
    }
    id v70 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v70, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v71, v72, v73, v74, v75, (uint64_t)"");

    goto LABEL_91;
  }
LABEL_94:
  uint64_t v85 = nrCopyLogObj_2279();
  BOOL v86 = v85;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v87 = os_log_type_enabled(v85, OS_LOG_TYPE_FAULT);

    if (!v87)
    {
      uint64_t v18 = 0;
      goto LABEL_38;
    }
  }
  id v88 = nrCopyLogObj_2279();
  _NRLogWithArgs((uint64_t)v88, 17, (uint64_t)"called with all-zero bluetoothUUID", v89, v90, v91, v92, v93, v105);

  uint64_t v18 = 0;
LABEL_38:

  return v18;
}

unsigned __int8 *nrXPCCopyBluetoothUUIDForNRUUID(void *a1)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v1 = a1;
  xpc_object_t v2 = v1;
  if (!v1)
  {
    id v57 = nrCopyLogObj_2279();
    uint64_t v58 = v57;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v74 = os_log_type_enabled(v57, OS_LOG_TYPE_FAULT);

      if (!v74) {
        goto LABEL_94;
      }
    }
    id v75 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"%s called with null nrUUID", v76, v77, v78, v79, v80, (uint64_t)"nrXPCCopyBluetoothUUIDForNRUUID");
LABEL_93:

    uint64_t v18 = 0;
    goto LABEL_38;
  }
  *(void *)uu = 0;
  uint64_t v92 = 0;
  [v1 getUUIDBytes:uu];
  if (uuid_is_null(uu))
  {
    uint64_t v59 = nrCopyLogObj_2279();
    uint64_t v60 = v59;
    if (sNRCopyLogToStdErr)
    {

LABEL_92:
      id v75 = nrCopyLogObj_2279();
      _NRLogWithArgs((uint64_t)v75, 17, (uint64_t)"called with all-zero nrUUID", v82, v83, v84, v85, v86, v90);
      goto LABEL_93;
    }
    BOOL v81 = os_log_type_enabled(v59, OS_LOG_TYPE_FAULT);

    if (v81) {
      goto LABEL_92;
    }
LABEL_94:
    uint64_t v18 = 0;
    goto LABEL_38;
  }
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    uint64_t v61 = nrCopyLogObj_2279();
    uint64_t v62 = v61;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v63 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);

      if (!v63)
      {
LABEL_88:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v72 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v72, (uint64_t)"nr_xpc_dictionary_create");
        id v73 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v73);
      }
    }
    id v66 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v66, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v67, v68, v69, v70, v71, (uint64_t)"");

    goto LABEL_88;
  }
  uint64_t v4 = v3;
  xpc_dictionary_set_uint64(v3, "Type", 0x32uLL);
  *(void *)uuid = 0;
  uint64_t v94 = 0;
  [v2 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v4, "NRUUID", uuid);
  xpc_object_t v5 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyBluetoothUUIDForNRUUID", v4);
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v64 = nrCopyLogObj_2279();
    uint64_t v65 = v64;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v87 = os_log_type_enabled(v64, OS_LOG_TYPE_FAULT);

      if (!v87) {
        goto LABEL_36;
      }
    }
    id v26 = nrCopyLogObj_2279();
    id v25 = v26;
    uint64_t v27 = "received nil response";
    goto LABEL_34;
  }
  uint64_t v7 = MEMORY[0x210512A10](v5);
  if (v7 == MEMORY[0x263EF8708])
  {
    uint64_t v19 = xpc_dictionary_get_value(v6, "Result");
    id v25 = (void *)v19;
    if (v19)
    {
      if (MEMORY[0x210512A10](v19) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v25);
        if (!value)
        {

          uint64_t v42 = xpc_dictionary_get_uuid(v6, "BluetoothUUID");
          uint64_t v18 = (unsigned __int8 *)v42;
          if (!v42) {
            goto LABEL_37;
          }
          if (!uuid_is_null(v42))
          {
            uint64_t v18 = (unsigned __int8 *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v18];
            goto LABEL_37;
          }
          goto LABEL_36;
        }
        uint64_t v35 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v48 = nrCopyLogObj_2279();
            uint64_t v49 = v48;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v50 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);

              if (!v50) {
                goto LABEL_35;
              }
            }
            id v51 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v35);
            _NRLogWithArgs((uint64_t)v51, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v52, v53, v54, v55, v56, (uint64_t)"");

            goto LABEL_35;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v36 = nrCopyLogObj_2279();
          uint64_t v89 = createStringFromNRXPCRes(v35);
          _NRLogWithArgs((uint64_t)v36, 17, (uint64_t)"received internal failure result code: [%lld] %@", v43, v44, v45, v46, v47, v35);
        }
        else
        {
          if (strerror_r(value, (char *)uu, 0x80uLL)) {
            uu[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_35;
          }
          id v36 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v36, 17, (uint64_t)"received failure result code: [%d] %s", v37, v38, v39, v40, v41, v35);
        }

LABEL_35:
        goto LABEL_36;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      id v26 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_35;
      }
      id v26 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v27 = "received response without result code";
    }
LABEL_34:
    _NRLogWithArgs((uint64_t)v26, 17, (uint64_t)v27, v20, v21, v22, v23, v24, v90);
    goto LABEL_35;
  }
  if (v7 != MEMORY[0x263EF8720])
  {
    uint64_t v18 = (unsigned __int8 *)MEMORY[0x2105128B0](v6);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v13, v14, v15, v16, v17, (uint64_t)v18);
    }
    goto LABEL_12;
  }
  if (v6 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v8, v9, v10, v11, v12, v90);
    }
    goto LABEL_36;
  }
  if (v6 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v8, v9, v10, v11, v12, (uint64_t)"");
    }
    goto LABEL_36;
  }
  if (v6 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_36;
    }
    id v26 = nrCopyLogObj_2279();
    id v25 = v26;
    uint64_t v27 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_34;
  }
  uint64_t v18 = (unsigned __int8 *)MEMORY[0x2105128B0](v6);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v28, v29, v30, v31, v32, (uint64_t)v18);
  }
LABEL_12:
  if (v18)
  {
    free(v18);
LABEL_36:
    uint64_t v18 = 0;
  }
LABEL_37:

LABEL_38:
  return v18;
}

void *nrXPCCopyNRUUIDForIDSDeviceID(void *a1, BOOL a2)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v3 = a1;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (!v4)
  {
    uint64_t v64 = nrCopyLogObj_2279();
    uint64_t v65 = v64;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v66 = os_log_type_enabled(v64, OS_LOG_TYPE_ERROR);

      if (!v66)
      {
LABEL_86:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v75 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v75, (uint64_t)"nr_xpc_dictionary_create");
        id v76 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v76);
      }
    }
    id v69 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v69, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v70, v71, v72, v73, v74, (uint64_t)"");

    goto LABEL_86;
  }
  xpc_object_t v5 = v4;
  xpc_dictionary_set_uint64(v4, "Type", 0x2EuLL);
  xpc_dictionary_set_string(v5, "IDSDeviceID", (const char *)[v3 UTF8String]);
  xpc_dictionary_set_BOOL(v5, "ShouldCreateDevice", a2);
  xpc_object_t v6 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyNRUUIDForIDSDeviceID", v5);
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v67 = nrCopyLogObj_2279();
    uint64_t v68 = v67;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v77 = os_log_type_enabled(v67, OS_LOG_TYPE_FAULT);

      if (!v77) {
        goto LABEL_34;
      }
    }
    id v27 = nrCopyLogObj_2279();
    id v26 = v27;
    uint64_t v28 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v8 = MEMORY[0x210512A10](v6);
  if (v8 == MEMORY[0x263EF8708])
  {
    uint64_t v20 = xpc_dictionary_get_value(v7, "Result");
    id v26 = (id)v20;
    if (v20)
    {
      if (MEMORY[0x210512A10](v20) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v26);
        if (value)
        {
          uint64_t v36 = value;
          if (value >> 31)
          {
            if (!value)
            {
              uint64_t v55 = nrCopyLogObj_2279();
              uint64_t v56 = v55;
              if (sNRCopyLogToStdErr)
              {
              }
              else
              {
                BOOL v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

                if (!v57) {
                  goto LABEL_33;
                }
              }
              id v58 = nrCopyLogObj_2279();
              StringFromNRXPCRes = createStringFromNRXPCRes(v36);
              _NRLogWithArgs((uint64_t)v58, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v59, v60, v61, v62, v63, (uint64_t)"");

              goto LABEL_33;
            }
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              goto LABEL_33;
            }
            id v37 = nrCopyLogObj_2279();
            BOOL v87 = createStringFromNRXPCRes(v36);
            _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, v36);
          }
          else
          {
            if (strerror_r(value, __strerrbuf, 0x80uLL)) {
              __strerrbuf[0] = 0;
            }
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
              goto LABEL_33;
            }
            id v37 = nrCopyLogObj_2279();
            _NRLogWithArgs((uint64_t)v37, 17, (uint64_t)"received failure result code: [%d] %s", v38, v39, v40, v41, v42, v36);
          }
        }
        else
        {

          uuid = xpc_dictionary_get_uuid(v7, "NRUUID");
          if (uuid)
          {
            uint64_t v44 = uuid;
            if (!uuid_is_null(uuid))
            {
              uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v44];
              goto LABEL_35;
            }
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d All-zero nrUUID in response from daemon", v45, v46, v47, v48, v49, (uint64_t)"");
            }
            goto LABEL_34;
          }
          if (!a2)
          {
LABEL_34:
            uint64_t v19 = 0;
            goto LABEL_35;
          }
          uint64_t v78 = nrCopyLogObj_2279();
          uint64_t v79 = v78;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v80 = os_log_type_enabled(v78, OS_LOG_TYPE_ERROR);

            if (!v80) {
              goto LABEL_34;
            }
          }
          id v26 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v26, 16, (uint64_t)"%s%.30s:%-4d Missing nrUUID in response from daemon", v81, v82, v83, v84, v85, (uint64_t)"");
        }
LABEL_33:

        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v27 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v28 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v27 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v28 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v27, 17, (uint64_t)v28, v21, v22, v23, v24, v25, v88);
    goto LABEL_33;
  }
  if (v8 != MEMORY[0x263EF8720])
  {
    uint64_t v19 = (void *)MEMORY[0x2105128B0](v7);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v14, v15, v16, v17, v18, (uint64_t)v19);
    }
    goto LABEL_10;
  }
  if (v7 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v9, v10, v11, v12, v13, v88);
    }
    goto LABEL_34;
  }
  if (v7 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v9, v10, v11, v12, v13, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v7 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v27 = nrCopyLogObj_2279();
    id v26 = v27;
    uint64_t v28 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64_t v19 = (void *)MEMORY[0x2105128B0](v7);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v29, v30, v31, v32, v33, (uint64_t)v19);
  }
LABEL_10:
  if (v19)
  {
    free(v19);
    goto LABEL_34;
  }
LABEL_35:

  return v19;
}

void *nrXPCCopyBestTestingNRUUID()
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v60 = nrCopyLogObj_2279();
    uint64_t v61 = v60;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v62 = os_log_type_enabled(v60, OS_LOG_TYPE_ERROR);

      if (!v62)
      {
LABEL_86:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v71 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v71, (uint64_t)"nr_xpc_dictionary_create");
        id v72 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v72);
      }
    }
    id v65 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v65, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v66, v67, v68, v69, v70, (uint64_t)"");

    goto LABEL_86;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x14uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyBestTestingNRUUID", v1);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v63 = nrCopyLogObj_2279();
    uint64_t v64 = v63;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v73 = os_log_type_enabled(v63, OS_LOG_TYPE_FAULT);

      if (!v73) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    id v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    id v22 = (id)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          uuid = xpc_dictionary_get_uuid(v3, "NRUUID");
          if (uuid)
          {
            uint64_t v40 = uuid;
            if (!uuid_is_null(uuid))
            {
              uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:v40];
              goto LABEL_35;
            }
            if (nrCopyLogObj_onceToken_2285 != -1) {
              dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
            }
            if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
              _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d All-zero nrUUID in response from daemon", v41, v42, v43, v44, v45, (uint64_t)"");
            }
            goto LABEL_34;
          }
          uint64_t v74 = nrCopyLogObj_2279();
          uint64_t v75 = v74;
          if (sNRCopyLogToStdErr)
          {
          }
          else
          {
            BOOL v76 = os_log_type_enabled(v74, OS_LOG_TYPE_ERROR);

            if (!v76) {
              goto LABEL_34;
            }
          }
          id v22 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v22, 16, (uint64_t)"%s%.30s:%-4d Missing nrUUID in response from daemon", v77, v78, v79, v80, v81, (uint64_t)"");
          goto LABEL_33;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v51 = nrCopyLogObj_2279();
            uint64_t v52 = v51;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v53 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);

              if (!v53) {
                goto LABEL_33;
              }
            }
            id v54 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v54, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v55, v56, v57, v58, v59, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          uint64_t v83 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v46, v47, v48, v49, v50, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v84);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v84);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    id v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64_t v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
  }
LABEL_10:
  if (v15)
  {
    free(v15);
LABEL_34:
    uint64_t v15 = 0;
  }
LABEL_35:

  return v15;
}

void nrXPCRegisterDeviceByNRUUID(void *a1, int64_t a2, unsigned int a3, BOOL a4, void *a5, BOOL a6, BOOL a7, void *a8, void *a9, void *a10, void *a11, BOOL a12, void *a13, void *a14)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v18 = a1;
  id v19 = a5;
  id v20 = a8;
  uint64_t v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v79 = a13;
  id v24 = a14;
  uint64_t v30 = v24;
  if (!v18)
  {
    id v44 = v22;
    uint64_t v45 = nrCopyLogObj_2279();
    uint64_t v46 = v45;
    if (sNRCopyLogToStdErr)
    {

      uint64_t v31 = v20;
    }
    else
    {
      BOOL v49 = os_log_type_enabled(v45, OS_LOG_TYPE_FAULT);

      uint64_t v31 = v20;
      id v22 = v44;
      if (!v49) {
        goto LABEL_42;
      }
    }
    id v50 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v50, 17, (uint64_t)"%s called with null nrUUID", v51, v52, v53, v54, v55, (uint64_t)"nrXPCRegisterDeviceByNRUUID");
LABEL_51:

    id v22 = v44;
    goto LABEL_42;
  }
  if (!v24)
  {
    id v44 = v22;
    uint64_t v47 = nrCopyLogObj_2279();
    uint64_t v48 = v47;
    uint64_t v31 = v20;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v56 = os_log_type_enabled(v47, OS_LOG_TYPE_FAULT);

      id v22 = v44;
      if (!v56) {
        goto LABEL_42;
      }
    }
    id v50 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v50, 17, (uint64_t)"%s called with null completionBlock", v57, v58, v59, v60, v61, (uint64_t)"nrXPCRegisterDeviceByNRUUID");
    goto LABEL_51;
  }
  uint64_t v31 = v20;
  if (!v19 && !a4)
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"outOfBandKey was nil and !wasInitiallySetupUsingIDSPairing", v25, v26, v27, v28, v29, v73);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __nrXPCRegisterDeviceByNRUUID_block_invoke;
    block[3] = &unk_263FD19F0;
    id v86 = v30;
    dispatch_async(v21, block);

    goto LABEL_42;
  }
  if (!v20 && a6)
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"bluetoothMACAddress was nil and pairWithSPPLink", v25, v26, v27, v28, v29, v73);
    }
    v83[0] = MEMORY[0x263EF8330];
    v83[1] = 3221225472;
    v83[2] = __nrXPCRegisterDeviceByNRUUID_block_invoke_2;
    v83[3] = &unk_263FD19F0;
    id v84 = v30;
    dispatch_async(v21, v83);
    uint64_t v32 = v84;
LABEL_41:

    goto LABEL_42;
  }
  if (!v22 || ![v22 length])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"Invalid operational properties data %@", v25, v26, v27, v28, v29, (uint64_t)v22);
    }
    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __nrXPCRegisterDeviceByNRUUID_block_invoke_3;
    v81[3] = &unk_263FD19F0;
    id v82 = v30;
    dispatch_async(v21, v81);
    uint64_t v32 = v82;
    goto LABEL_41;
  }
  id v75 = v23;
  uint64_t v74 = v22;
  xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
  if (!v33)
  {
    BOOL v62 = nrCopyLogObj_2279();
    uint64_t v63 = v62;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v64 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);

      if (!v64)
      {
LABEL_58:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v71 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v71, (uint64_t)"nr_xpc_dictionary_create");
        id v72 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v72);
      }
    }
    id v65 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v65, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v66, v67, v68, v69, v70, (uint64_t)"");

    goto LABEL_58;
  }
  uint64_t v34 = v33;
  xpc_dictionary_set_uint64(v33, "Type", 0xEuLL);
  xpc_dictionary_set_int64(v34, "PairingProtocolVersion", a2);
  xpc_dictionary_set_uint64(v34, "PeerNetworkRelayVersion", a3);
  xpc_dictionary_set_BOOL(v34, "WasInitiallySetupUsingIDSPairing", a4);
  if (v19)
  {
    id v35 = v19;
    xpc_dictionary_set_data(v34, "OutOfBandKey", (const void *)[v35 bytes], objc_msgSend(v35, "length"));
  }
  xpc_dictionary_set_BOOL(v34, "PairWithSPPLink", a6);
  xpc_dictionary_set_BOOL(v34, "IsAltAccountPairing", a7);
  uint64_t v31 = v20;
  if (v20)
  {
    id v36 = v20;
    xpc_dictionary_set_data(v34, "RemoteDeviceMACAddress", (const void *)[v36 bytes], objc_msgSend(v36, "length"));
  }
  *(void *)uuid = 0;
  uint64_t v92 = 0;
  [v18 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v34, "NRUUID", uuid);
  xpc_dictionary_set_data(v34, "OperationalPropData", (const void *)[v74 bytes], objc_msgSend(v74, "length"));
  if (v75)
  {
    uint64_t v80 = 0;
    uint64_t v37 = [MEMORY[0x263F08910] archivedDataWithRootObject:v75 requiringSecureCoding:1 error:&v80];
    uint64_t v38 = v37;
    if (!v80) {
      xpc_dictionary_set_data(v34, "PeerIPAddressData", (const void *)[v37 bytes], objc_msgSend(v37, "length"));
    }
  }
  if (v79) {
    xpc_dictionary_set_string(v34, "CandidateService", (const char *)[v79 UTF8String]);
  }
  xpc_dictionary_set_BOOL(v34, "IsEphemeral", a12);
  id v39 = v34;
  uint64_t v40 = v21;
  id v41 = v30;
  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
  v87[3] = &unk_263FD1A68;
  id v88 = v41;
  uint64_t v42 = v87;
  id v43 = nrXPCCopyConnection();
  if (v43)
  {
    nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v43, v39, v40, v42, 1u);
  }
  else
  {
    v89[0] = MEMORY[0x263EF8330];
    v89[1] = 3221225472;
    v89[2] = __nrXPCSendAsyncInner_block_invoke;
    v89[3] = &unk_263FD19F0;
    uint64_t v90 = v42;
    dispatch_async(v40, v89);
  }
  id v23 = v75;

  id v22 = v74;
LABEL_42:
}

uint64_t __nrXPCRegisterDeviceByNRUUID_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __nrXPCRegisterDeviceByNRUUID_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __nrXPCRegisterDeviceByNRUUID_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void nrXPCUnregisterDeviceByNRUUID(void *a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v5)
  {
    if (!v7)
    {
      id v18 = nrCopyLogObj_2279();
      id v19 = v18;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v37 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);

        if (!v37) {
          goto LABEL_8;
        }
      }
      id v11 = nrCopyLogObj_2279();
      _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null completionBlock", v38, v39, v40, v41, v42, (uint64_t)"nrXPCUnregisterDeviceByNRUUID");
      goto LABEL_7;
    }
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    if (v9)
    {
      uint64_t v10 = v9;
      xpc_dictionary_set_uint64(v9, "Type", 0xFuLL);
      *(void *)uuid = 0;
      uint64_t v48 = 0;
      [v5 getUUIDBytes:uuid];
      xpc_dictionary_set_uuid(v10, "NRUUID", uuid);
      id v11 = v10;
      uint64_t v12 = v6;
      id v13 = v8;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
      v43[3] = &unk_263FD1A68;
      id v44 = v13;
      uint64_t v14 = v43;
      id v15 = nrXPCCopyConnection();
      if (v15)
      {
        nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v15, v11, v12, v14, 1u);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __nrXPCSendAsyncInner_block_invoke;
        block[3] = &unk_263FD19F0;
        uint64_t v46 = v14;
        dispatch_async(v12, block);
      }
      goto LABEL_7;
    }
    id v20 = nrCopyLogObj_2279();
    uint64_t v21 = v20;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v22)
      {
LABEL_19:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v29 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v29, (uint64_t)"nr_xpc_dictionary_create");
        id v30 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v30);
      }
    }
    id v23 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v23, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v24, v25, v26, v27, v28, (uint64_t)"");

    goto LABEL_19;
  }
  uint64_t v16 = nrCopyLogObj_2279();
  uint64_t v17 = v16;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v31 = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);

    if (!v31) {
      goto LABEL_8;
    }
  }
  id v11 = nrCopyLogObj_2279();
  _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null nrUUID", v32, v33, v34, v35, v36, (uint64_t)"nrXPCUnregisterDeviceByNRUUID");
LABEL_7:

LABEL_8:
}

void nrXPCUnregisterAllDevices(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if (v4)
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      id v6 = v5;
      xpc_dictionary_set_uint64(v5, "Type", 0x13uLL);
      id v7 = v6;
      uint64_t v8 = v3;
      id v9 = v4;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
      v31[3] = &unk_263FD1A68;
      id v32 = v9;
      uint64_t v10 = v31;
      id v11 = nrXPCCopyConnection();
      if (v11)
      {
        nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v11, v7, v8, v10, 1u);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __nrXPCSendAsyncInner_block_invoke;
        block[3] = &unk_263FD19F0;
        uint64_t v34 = v10;
        dispatch_async(v8, block);
      }
      goto LABEL_6;
    }
    uint64_t v14 = nrCopyLogObj_2279();
    id v15 = v14;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

      if (!v16)
      {
LABEL_16:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v23 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v23, (uint64_t)"nr_xpc_dictionary_create");
        id v24 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v24);
      }
    }
    id v17 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v17, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v18, v19, v20, v21, v22, (uint64_t)"");

    goto LABEL_16;
  }
  uint64_t v12 = nrCopyLogObj_2279();
  id v13 = v12;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v25 = os_log_type_enabled(v12, OS_LOG_TYPE_FAULT);

    if (!v25) {
      goto LABEL_7;
    }
  }
  id v7 = nrCopyLogObj_2279();
  _NRLogWithArgs((uint64_t)v7, 17, (uint64_t)"%s called with null completionBlock", v26, v27, v28, v29, v30, (uint64_t)"nrXPCUnregisterAllDevices");
LABEL_6:

LABEL_7:
}

void nrXPCEnableDeviceByNRUUID(void *a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v5)
  {
    if (!v7)
    {
      uint64_t v18 = nrCopyLogObj_2279();
      uint64_t v19 = v18;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v37 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);

        if (!v37) {
          goto LABEL_8;
        }
      }
      id v11 = nrCopyLogObj_2279();
      _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null completionBlock", v38, v39, v40, v41, v42, (uint64_t)"nrXPCEnableDeviceByNRUUID");
      goto LABEL_7;
    }
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    if (v9)
    {
      uint64_t v10 = v9;
      xpc_dictionary_set_uint64(v9, "Type", 0x10uLL);
      *(void *)uuid = 0;
      uint64_t v48 = 0;
      [v5 getUUIDBytes:uuid];
      xpc_dictionary_set_uuid(v10, "NRUUID", uuid);
      id v11 = v10;
      uint64_t v12 = v6;
      id v13 = v8;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
      v43[3] = &unk_263FD1A68;
      id v44 = v13;
      uint64_t v14 = v43;
      id v15 = nrXPCCopyConnection();
      if (v15)
      {
        nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v15, v11, v12, v14, 1u);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __nrXPCSendAsyncInner_block_invoke;
        block[3] = &unk_263FD19F0;
        uint64_t v46 = v14;
        dispatch_async(v12, block);
      }
      goto LABEL_7;
    }
    uint64_t v20 = nrCopyLogObj_2279();
    uint64_t v21 = v20;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v22)
      {
LABEL_19:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v29 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v29, (uint64_t)"nr_xpc_dictionary_create");
        id v30 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v30);
      }
    }
    id v23 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v23, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v24, v25, v26, v27, v28, (uint64_t)"");

    goto LABEL_19;
  }
  BOOL v16 = nrCopyLogObj_2279();
  id v17 = v16;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v31 = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);

    if (!v31) {
      goto LABEL_8;
    }
  }
  id v11 = nrCopyLogObj_2279();
  _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null nrUUID", v32, v33, v34, v35, v36, (uint64_t)"nrXPCEnableDeviceByNRUUID");
LABEL_7:

LABEL_8:
}

void nrXPCDisableDeviceByNRUUID(void *a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = v7;
  if (v5)
  {
    if (!v7)
    {
      uint64_t v18 = nrCopyLogObj_2279();
      uint64_t v19 = v18;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v37 = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);

        if (!v37) {
          goto LABEL_8;
        }
      }
      id v11 = nrCopyLogObj_2279();
      _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null completionBlock", v38, v39, v40, v41, v42, (uint64_t)"nrXPCDisableDeviceByNRUUID");
      goto LABEL_7;
    }
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    if (v9)
    {
      uint64_t v10 = v9;
      xpc_dictionary_set_uint64(v9, "Type", 0x11uLL);
      *(void *)uuid = 0;
      uint64_t v48 = 0;
      [v5 getUUIDBytes:uuid];
      xpc_dictionary_set_uuid(v10, "NRUUID", uuid);
      id v11 = v10;
      uint64_t v12 = v6;
      id v13 = v8;
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __nrXPCSendAsyncOnlyResultCode_block_invoke;
      v43[3] = &unk_263FD1A68;
      id v44 = v13;
      uint64_t v14 = v43;
      id v15 = nrXPCCopyConnection();
      if (v15)
      {
        nrXPCSendAsyncInnerRec((uint64_t)"nrXPCSendAsyncOnlyResultCode", v15, v11, v12, v14, 1u);
      }
      else
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __nrXPCSendAsyncInner_block_invoke;
        block[3] = &unk_263FD19F0;
        uint64_t v46 = v14;
        dispatch_async(v12, block);
      }
      goto LABEL_7;
    }
    uint64_t v20 = nrCopyLogObj_2279();
    uint64_t v21 = v20;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v22 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v22)
      {
LABEL_19:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v29 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v29, (uint64_t)"nr_xpc_dictionary_create");
        id v30 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v30);
      }
    }
    id v23 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v23, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v24, v25, v26, v27, v28, (uint64_t)"");

    goto LABEL_19;
  }
  BOOL v16 = nrCopyLogObj_2279();
  id v17 = v16;
  if (sNRCopyLogToStdErr)
  {
  }
  else
  {
    BOOL v31 = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);

    if (!v31) {
      goto LABEL_8;
    }
  }
  id v11 = nrCopyLogObj_2279();
  _NRLogWithArgs((uint64_t)v11, 17, (uint64_t)"%s called with null nrUUID", v32, v33, v34, v35, v36, (uint64_t)"nrXPCDisableDeviceByNRUUID");
LABEL_7:

LABEL_8:
}

__CFString *nrXPCCopyDeviceListString()
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v55 = nrCopyLogObj_2279();
    BOOL v56 = v55;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

      if (!v57)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v66 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v66, (uint64_t)"nr_xpc_dictionary_create");
        id v67 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v67);
      }
    }
    id v60 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v60, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_80;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x12uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyDeviceListString", v1);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v58 = nrCopyLogObj_2279();
    uint64_t v59 = v58;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v68 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);

      if (!v68) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    BOOL v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 != MEMORY[0x263EF8708])
  {
    if (v4 != MEMORY[0x263EF8720])
    {
      id v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
      }
LABEL_10:
      if (v15) {
        free(v15);
      }
      goto LABEL_34;
    }
    if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v74);
      }
      goto LABEL_34;
    }
    if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
      }
      goto LABEL_34;
    }
    if (v3 != (void *)MEMORY[0x263EF86C0])
    {
      id v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
      }
      goto LABEL_10;
    }
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    BOOL v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v74);
    goto LABEL_33;
  }
  uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
  BOOL v22 = (void *)v16;
  if (!v16)
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
    uint64_t v24 = "received response without result code";
    goto LABEL_32;
  }
  if (MEMORY[0x210512A10](v16) != MEMORY[0x263EF8738])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
    uint64_t v24 = "received invalid result type";
    goto LABEL_32;
  }
  unint64_t value = xpc_int64_get_value(v22);
  if (!value)
  {

    string = xpc_dictionary_get_string(v3, "DeviceListString");
    if (string)
    {
      id v30 = (__CFString *)[[NSString alloc] initWithUTF8String:string];
      goto LABEL_35;
    }
    uint64_t v69 = nrCopyLogObj_2279();
    uint64_t v70 = v69;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v71 = os_log_type_enabled(v69, OS_LOG_TYPE_FAULT);

      if (!v71) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    BOOL v22 = v23;
    uint64_t v24 = "Missing device list string in XPC response";
    goto LABEL_32;
  }
  uint64_t v33 = value;
  if (value >> 31)
  {
    if (!value)
    {
      uint64_t v46 = nrCopyLogObj_2279();
      uint64_t v47 = v46;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v48 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

        if (!v48) {
          goto LABEL_33;
        }
      }
      id v49 = nrCopyLogObj_2279();
      StringFromNRXPCRes = createStringFromNRXPCRes(v33);
      _NRLogWithArgs((uint64_t)v49, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, (uint64_t)"");

      goto LABEL_33;
    }
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    id v34 = nrCopyLogObj_2279();
    uint64_t v73 = createStringFromNRXPCRes(v33);
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)"received internal failure result code: [%lld] %@", v41, v42, v43, v44, v45, v33);
  }
  else
  {
    if (strerror_r(value, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    id v34 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)"received failure result code: [%d] %s", v35, v36, v37, v38, v39, v33);
  }

LABEL_33:
LABEL_34:
  id v30 = @"ERROR";
LABEL_35:

  return v30;
}

void *nrXPCCopyIdentityReferences()
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    BOOL v56 = nrCopyLogObj_2279();
    BOOL v57 = v56;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v58 = os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);

      if (!v58)
      {
LABEL_85:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v67 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v67, (uint64_t)"nr_xpc_dictionary_create");
        id v68 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v68);
      }
    }
    id v61 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v61, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v62, v63, v64, v65, v66, (uint64_t)"");

    goto LABEL_85;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x34uLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyIdentityReferences", v1);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v59 = nrCopyLogObj_2279();
    id v60 = v59;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v69 = os_log_type_enabled(v59, OS_LOG_TYPE_FAULT);

      if (!v69) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    BOOL v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
    BOOL v22 = (void *)v16;
    if (v16)
    {
      if (MEMORY[0x210512A10](v16) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v22);
        if (!value)
        {

          uint64_t v39 = xpc_dictionary_get_value(v3, "IdentityProxyReferences");
          if (v39)
          {
            uint64_t v40 = (void *)_CFXPCCreateCFObjectFromXPCObject();
            id v15 = v40;
            if (v40)
            {
              CFTypeID v41 = CFGetTypeID(v40);
              if (v41 != CFDictionaryGetTypeID()) {
                id v15 = 0;
              }
            }
          }
          else
          {
            id v15 = 0;
          }

          goto LABEL_35;
        }
        uint64_t v32 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v47 = nrCopyLogObj_2279();
            BOOL v48 = v47;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v49 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);

              if (!v49) {
                goto LABEL_33;
              }
            }
            id v50 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v32);
            _NRLogWithArgs((uint64_t)v50, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v51, v52, v53, v54, v55, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          BOOL v71 = createStringFromNRXPCRes(v32);
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received internal failure result code: [%lld] %@", v42, v43, v44, v45, v46, v32);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v33 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v33, 17, (uint64_t)"received failure result code: [%d] %s", v34, v35, v36, v37, v38, v32);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v24 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v72);
    goto LABEL_33;
  }
  if (v4 != MEMORY[0x263EF8720])
  {
    id v15 = (void *)MEMORY[0x2105128B0](v3);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
    }
    goto LABEL_10;
  }
  if (v3 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v72);
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v3 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    BOOL v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  id v15 = (void *)MEMORY[0x2105128B0](v3);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
  }
LABEL_10:
  if (v15)
  {
    free(v15);
LABEL_34:
    id v15 = 0;
  }
LABEL_35:

  return v15;
}

__CFString *nrXPCCopyIDSDeviceID()
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  if (!v0)
  {
    uint64_t v55 = nrCopyLogObj_2279();
    BOOL v56 = v55;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

      if (!v57)
      {
LABEL_80:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v66 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v66, (uint64_t)"nr_xpc_dictionary_create");
        id v67 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v67);
      }
    }
    id v60 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v60, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_80;
  }
  id v1 = v0;
  xpc_dictionary_set_uint64(v0, "Type", 0x2FuLL);
  xpc_object_t v2 = nrXPCSendSyncInner((uint64_t)"nrXPCCopyIDSDeviceID", v1);
  id v3 = v2;
  if (!v2)
  {
    BOOL v58 = nrCopyLogObj_2279();
    uint64_t v59 = v58;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v68 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);

      if (!v68) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    BOOL v22 = v23;
    uint64_t v24 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v4 = MEMORY[0x210512A10](v2);
  if (v4 != MEMORY[0x263EF8708])
  {
    if (v4 != MEMORY[0x263EF8720])
    {
      id v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v10, v11, v12, v13, v14, (uint64_t)v15);
      }
LABEL_10:
      if (v15) {
        free(v15);
      }
      goto LABEL_34;
    }
    if (v3 == (void *)MEMORY[0x263EF86A0])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v5, v6, v7, v8, v9, v74);
      }
      goto LABEL_34;
    }
    if (v3 == (void *)MEMORY[0x263EF86A8])
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v5, v6, v7, v8, v9, (uint64_t)"");
      }
      goto LABEL_34;
    }
    if (v3 != (void *)MEMORY[0x263EF86C0])
    {
      id v15 = (void *)MEMORY[0x2105128B0](v3);
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v25, v26, v27, v28, v29, (uint64_t)v15);
      }
      goto LABEL_10;
    }
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v23 = nrCopyLogObj_2279();
    BOOL v22 = v23;
    uint64_t v24 = "received XPC_ERROR_TERMINATION_IMMINENT";
LABEL_32:
    _NRLogWithArgs((uint64_t)v23, 17, (uint64_t)v24, v17, v18, v19, v20, v21, v74);
    goto LABEL_33;
  }
  uint64_t v16 = xpc_dictionary_get_value(v3, "Result");
  BOOL v22 = (void *)v16;
  if (!v16)
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
    uint64_t v24 = "received response without result code";
    goto LABEL_32;
  }
  if (MEMORY[0x210512A10](v16) != MEMORY[0x263EF8738])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    id v23 = (id)nrCopyLogObj_sNRLogObj_2286;
    uint64_t v24 = "received invalid result type";
    goto LABEL_32;
  }
  unint64_t value = xpc_int64_get_value(v22);
  if (!value)
  {

    string = xpc_dictionary_get_string(v3, "IDSDeviceID");
    if (string)
    {
      id v30 = (__CFString *)[[NSString alloc] initWithUTF8String:string];
      goto LABEL_35;
    }
    BOOL v69 = nrCopyLogObj_2279();
    uint64_t v70 = v69;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v71 = os_log_type_enabled(v69, OS_LOG_TYPE_FAULT);

      if (!v71) {
        goto LABEL_34;
      }
    }
    id v23 = nrCopyLogObj_2279();
    BOOL v22 = v23;
    uint64_t v24 = "Missing device list string in XPC response";
    goto LABEL_32;
  }
  uint64_t v33 = value;
  if (value >> 31)
  {
    if (!value)
    {
      uint64_t v46 = nrCopyLogObj_2279();
      uint64_t v47 = v46;
      if (sNRCopyLogToStdErr)
      {
      }
      else
      {
        BOOL v48 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

        if (!v48) {
          goto LABEL_33;
        }
      }
      id v49 = nrCopyLogObj_2279();
      StringFromNRXPCRes = createStringFromNRXPCRes(v33);
      _NRLogWithArgs((uint64_t)v49, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, (uint64_t)"");

      goto LABEL_33;
    }
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    id v34 = nrCopyLogObj_2279();
    uint64_t v73 = createStringFromNRXPCRes(v33);
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)"received internal failure result code: [%lld] %@", v41, v42, v43, v44, v45, v33);
  }
  else
  {
    if (strerror_r(value, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_33;
    }
    id v34 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v34, 17, (uint64_t)"received failure result code: [%d] %s", v35, v36, v37, v38, v39, v33);
  }

LABEL_33:
LABEL_34:
  id v30 = @"ERROR";
LABEL_35:

  return v30;
}

void *nrXPCMeasureBTLatency(void *a1)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v1 = a1;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (!v2)
  {
    uint64_t v55 = nrCopyLogObj_2279();
    BOOL v56 = v55;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v57 = os_log_type_enabled(v55, OS_LOG_TYPE_ERROR);

      if (!v57)
      {
LABEL_79:
        _os_log_pack_size();
        MEMORY[0x270FA5388]();
        __error();
        uint64_t v66 = _os_log_pack_fill();
        __os_log_helper_1_2_4_8_34_8_0_8_0_4_0(v66, (uint64_t)"nr_xpc_dictionary_create");
        id v67 = nrCopyLogObj_2279();
        _NRLogAbortWithPack(v67);
      }
    }
    id v60 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v60, 16, (uint64_t)"%s%.30s:%-4d ABORTING: xpc_dictionary_create(%p, %p, %u) failed", v61, v62, v63, v64, v65, (uint64_t)"");

    goto LABEL_79;
  }
  id v3 = v2;
  xpc_dictionary_set_uint64(v2, "Type", 0x1CuLL);
  *(void *)uuid = 0;
  uint64_t v74 = 0;
  [v1 getUUIDBytes:uuid];
  xpc_dictionary_set_uuid(v3, "NRUUID", uuid);
  xpc_object_t v4 = nrXPCSendSyncInner((uint64_t)"nrXPCMeasureBTLatency", v3);
  uint64_t v5 = v4;
  if (!v4)
  {
    BOOL v58 = nrCopyLogObj_2279();
    uint64_t v59 = v58;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v68 = os_log_type_enabled(v58, OS_LOG_TYPE_FAULT);

      if (!v68) {
        goto LABEL_34;
      }
    }
    id v25 = nrCopyLogObj_2279();
    uint64_t v24 = v25;
    uint64_t v26 = "received nil response";
    goto LABEL_32;
  }
  uint64_t v6 = MEMORY[0x210512A10](v4);
  if (v6 == MEMORY[0x263EF8708])
  {
    uint64_t v18 = xpc_dictionary_get_value(v5, "Result");
    uint64_t v24 = (void *)v18;
    if (v18)
    {
      if (MEMORY[0x210512A10](v18) == MEMORY[0x263EF8738])
      {
        unint64_t value = xpc_int64_get_value(v24);
        if (!value)
        {

          uint64_t uint64 = (void *)xpc_dictionary_get_uint64(v5, "BTLatency");
          goto LABEL_35;
        }
        uint64_t v34 = value;
        if (value >> 31)
        {
          if (!value)
          {
            uint64_t v46 = nrCopyLogObj_2279();
            uint64_t v47 = v46;
            if (sNRCopyLogToStdErr)
            {
            }
            else
            {
              BOOL v48 = os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);

              if (!v48) {
                goto LABEL_33;
              }
            }
            id v49 = nrCopyLogObj_2279();
            StringFromNRXPCRes = createStringFromNRXPCRes(v34);
            _NRLogWithArgs((uint64_t)v49, 16, (uint64_t)"%s%.30s:%-4d received internal failure result code: [%lld] %@", v50, v51, v52, v53, v54, (uint64_t)"");

            goto LABEL_33;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v35 = nrCopyLogObj_2279();
          uint64_t v70 = createStringFromNRXPCRes(v34);
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received internal failure result code: [%lld] %@", v41, v42, v43, v44, v45, v34);
        }
        else
        {
          if (strerror_r(value, __strerrbuf, 0x80uLL)) {
            __strerrbuf[0] = 0;
          }
          if (nrCopyLogObj_onceToken_2285 != -1) {
            dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
          }
          if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
            goto LABEL_33;
          }
          id v35 = nrCopyLogObj_2279();
          _NRLogWithArgs((uint64_t)v35, 17, (uint64_t)"received failure result code: [%d] %s", v36, v37, v38, v39, v40, v34);
        }

LABEL_33:
        goto LABEL_34;
      }
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v25 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v26 = "received invalid result type";
    }
    else
    {
      if (nrCopyLogObj_onceToken_2285 != -1) {
        dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
      }
      if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
        goto LABEL_33;
      }
      id v25 = (id)nrCopyLogObj_sNRLogObj_2286;
      uint64_t v26 = "received response without result code";
    }
LABEL_32:
    _NRLogWithArgs((uint64_t)v25, 17, (uint64_t)v26, v19, v20, v21, v22, v23, v71);
    goto LABEL_33;
  }
  if (v6 != MEMORY[0x263EF8720])
  {
    uint64_t uint64 = (void *)MEMORY[0x2105128B0](v5);
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received unknown type XPC %s", v12, v13, v14, v15, v16, (uint64_t)uint64);
    }
    goto LABEL_10;
  }
  if (v5 == (void *)MEMORY[0x263EF86A0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received XPC_ERROR_CONNECTION_INTERRUPTED", v7, v8, v9, v10, v11, v71);
    }
    goto LABEL_34;
  }
  if (v5 == (void *)MEMORY[0x263EF86A8])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_ERROR)) {
      _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 16, (uint64_t)"%s%.30s:%-4d received XPC_ERROR_CONNECTION_INVALID", v7, v8, v9, v10, v11, (uint64_t)"");
    }
    goto LABEL_34;
  }
  if (v5 == (void *)MEMORY[0x263EF86C0])
  {
    if (nrCopyLogObj_onceToken_2285 != -1) {
      dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
    }
    if (!sNRCopyLogToStdErr && !os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    id v25 = nrCopyLogObj_2279();
    uint64_t v24 = v25;
    uint64_t v26 = "received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
  uint64_t uint64 = (void *)MEMORY[0x2105128B0](v5);
  if (nrCopyLogObj_onceToken_2285 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2285, &__block_literal_global_478);
  }
  if (sNRCopyLogToStdErr || os_log_type_enabled((os_log_t)nrCopyLogObj_sNRLogObj_2286, OS_LOG_TYPE_FAULT)) {
    _NRLogWithArgs(nrCopyLogObj_sNRLogObj_2286, 17, (uint64_t)"received returned unknown XPC error %s", v27, v28, v29, v30, v31, (uint64_t)uint64);
  }
LABEL_10:
  if (uint64)
  {
    free(uint64);
LABEL_34:
    uint64_t uint64 = 0;
  }
LABEL_35:

  return uint64;
}

id nrCopyAccountIdentifierForNRUUID(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
    id v3 = [v1 UUIDString];
    objc_msgSend(v2, "appendFormat:", @"NRD/%s", objc_msgSend(v3, "UTF8String"));
  }
  else
  {
    uint64_t v5 = nrCopyLogObj_2279();
    uint64_t v6 = v5;
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);

      if (!v7)
      {
        id v2 = 0;
        goto LABEL_4;
      }
    }
    id v3 = nrCopyLogObj_2279();
    _NRLogWithArgs((uint64_t)v3, 17, (uint64_t)"%s called with null nrUUID", v8, v9, v10, v11, v12, (uint64_t)"nrCopyAccountIdentifierForNRUUID");
    id v2 = 0;
  }

LABEL_4:
  return v2;
}

uint64_t nrSupportsPHSProxy()
{
  if (nrSupportsPHSProxy_onceToken != -1) {
    dispatch_once(&nrSupportsPHSProxy_onceToken, &__block_literal_global_469);
  }
  return nrSupportsPHSProxy_supported;
}

uint64_t __nrSupportsPHSProxy_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  nrSupportsPHSProxy_supported = result;
  return result;
}

uint64_t nrSupportsPHSProxyClient()
{
  if (nrSupportsPHSProxyClient_onceToken != -1) {
    dispatch_once(&nrSupportsPHSProxyClient_onceToken, &__block_literal_global_473);
  }
  return nrSupportsPHSProxyClient_supported;
}

uint64_t __nrSupportsPHSProxyClient_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  nrSupportsPHSProxyClient_supported = result;
  return result;
}

id nrCopyLogObj_2421()
{
  if (nrCopyLogObj_onceToken_2425 != -1) {
    dispatch_once(&nrCopyLogObj_onceToken_2425, &__block_literal_global_2426);
  }
  xpc_object_t v0 = (void *)nrCopyLogObj_sNRLogObj_2427;
  return v0;
}

uint64_t __nrCopyLogObj_block_invoke_2430()
{
  os_log_t v0 = os_log_create("com.apple.networkrelay", "");
  uint64_t v1 = nrCopyLogObj_sNRLogObj_2427;
  nrCopyLogObj_sNRLogObj_2427 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

__CFString *createStringFromNRServiceClass(unsigned int a1)
{
  if (a1 >= 6) {
    uint64_t v1 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown(%u)", a1);
  }
  else {
    uint64_t v1 = off_263FD1C88[a1];
  }
  return v1;
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B68](data, *(void *)&len, md);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x270F054F8](store, keys, patterns);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05538](allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x270F05558](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_pack_fill()
{
  return MEMORY[0x270ED80A0]();
}

uint64_t _os_log_pack_size()
{
  return MEMORY[0x270ED80A8]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x270ED87D0]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_resume(dispatch_object_t object)
{
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
  return MEMORY[0x270ED95A8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x270ED9CA8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x270ED9EC0](*(void *)&a1, a2, a3, *(void *)&a4);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return (nw_parameters_t)MEMORY[0x270EF84D8](parameters);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x270EF84F8](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x270EF8518]();
}

uint64_t nw_parameters_create_legacy_tcp_socket()
{
  return MEMORY[0x270EF8538]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x270EF8620]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x270EF8670]();
}

uint64_t nw_parameters_set_local_address()
{
  return MEMORY[0x270EF8690]();
}

uint64_t nw_parameters_set_no_proxy()
{
  return MEMORY[0x270EF86C0]();
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x270EF8728]();
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
}

void nw_parameters_set_service_class(nw_parameters_t parameters, nw_service_class_t service_class)
{
}

uint64_t nw_path_assert_agent()
{
  return MEMORY[0x270EF8788]();
}

uint64_t nw_path_copy_netagent_dictionary()
{
  return MEMORY[0x270EF87C8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x270EF87E8]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x270EF8808]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x270EF8810]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x270EF8840]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

void nw_protocol_stack_set_transport_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

nw_protocol_options_t nw_udp_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x270EF9608]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

uint64_t os_buflet_get_data_length()
{
  return MEMORY[0x270EDA890]();
}

uint64_t os_buflet_get_data_offset()
{
  return MEMORY[0x270EDA898]();
}

uint64_t os_buflet_get_object_address()
{
  return MEMORY[0x270EDA8A0]();
}

uint64_t os_channel_advance_slot()
{
  return MEMORY[0x270EDA8A8]();
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x270EDA8B0]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x270EDA8B8]();
}

uint64_t os_channel_attr_set()
{
  return MEMORY[0x270EDA8C0]();
}

uint64_t os_channel_available_slot_count()
{
  return MEMORY[0x270EDA8C8]();
}

uint64_t os_channel_create_extended()
{
  return MEMORY[0x270EDA8D0]();
}

uint64_t os_channel_destroy()
{
  return MEMORY[0x270EDA8D8]();
}

uint64_t os_channel_get_fd()
{
  return MEMORY[0x270EDA8E0]();
}

uint64_t os_channel_get_next_slot()
{
  return MEMORY[0x270EDA8E8]();
}

uint64_t os_channel_ring_id()
{
  return MEMORY[0x270EDA8F0]();
}

uint64_t os_channel_rx_ring()
{
  return MEMORY[0x270EDA8F8]();
}

uint64_t os_channel_set_slot_properties()
{
  return MEMORY[0x270EDA900]();
}

uint64_t os_channel_slot_get_packet()
{
  return MEMORY[0x270EDA908]();
}

uint64_t os_channel_sync()
{
  return MEMORY[0x270EDA910]();
}

uint64_t os_channel_tx_ring()
{
  return MEMORY[0x270EDA918]();
}

uint64_t os_inet_checksum()
{
  return MEMORY[0x270EDA998]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

uint64_t os_log_pack_compose()
{
  return MEMORY[0x270EDA9A8]();
}

uint64_t os_log_pack_send()
{
  return MEMORY[0x270EDA9B0]();
}

uint64_t os_log_pack_send_and_compose()
{
  return MEMORY[0x270EDA9B8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_log_with_args()
{
  return MEMORY[0x270EDA9E0]();
}

uint64_t os_packet_clear_flow_uuid()
{
  return MEMORY[0x270EDAA10]();
}

uint64_t os_packet_get_next_buflet()
{
  return MEMORY[0x270EDAA18]();
}

uint64_t os_packet_set_flow_uuid()
{
  return MEMORY[0x270EDAA20]();
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
  return MEMORY[0x270EDAB40]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x270EDB158](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x270EDB5E8](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

void tzset(void)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
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

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
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

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
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

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}