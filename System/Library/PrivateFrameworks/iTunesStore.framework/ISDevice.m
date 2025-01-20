@interface ISDevice
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (BOOL)checkCapabilities:(id)a3 withMismatches:(id *)a4;
- (BOOL)releasePowerAssertion:(id)a3;
- (BOOL)takePowerAssertion:(id)a3;
- (ISDevice)init;
- (NSString)deviceName;
- (NSString)guid;
- (NSString)hardwareName;
- (NSString)serialNumber;
- (NSString)systemName;
- (id)copyProtocolConditionalContext;
- (id)supportedOfferDeviceForDevices:(id)a3;
- (int)_deviceClass;
- (int64_t)deviceBiometricStyle;
- (void)dealloc;
- (void)requestFreeSpace:(unint64_t)a3 atPath:(id)a4 withOptions:(id)a5 completionBlock:(id)a6;
- (void)resetLocationAndPrivacy;
@end

@implementation ISDevice

- (ISDevice)init
{
  __ISRecordSPIClassUsage(self);
  v6.receiver = self;
  v6.super_class = (Class)ISDevice;
  v3 = [(ISDevice *)&v6 init];
  v4 = v3;
  if (v3)
  {
    v3->_biometricStyle = 0;
    v3->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.iTunesStore.ISDevice", 0);
    v4->_lastFreeSpaceRequest = -1.79769313e308;
  }
  return v4;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_sync(dispatchQueue, &__block_literal_global);
    dispatch_release((dispatch_object_t)self->_dispatchQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)ISDevice;
  [(ISDevice *)&v4 dealloc];
}

+ (void)setSharedInstance:(id)a3
{
  pthread_mutex_lock(&__SharedInstanceLock);
  if ((id)__SharedInstance != a3)
  {

    __SharedInstance = (uint64_t)a3;
  }

  pthread_mutex_unlock(&__SharedInstanceLock);
}

+ (id)sharedInstance
{
  pthread_mutex_lock(&__SharedInstanceLock);
  v2 = (ISDevice *)__SharedInstance;
  if (!__SharedInstance)
  {
    v2 = objc_alloc_init(ISDevice);
    __SharedInstance = (uint64_t)v2;
  }
  v3 = v2;
  pthread_mutex_unlock(&__SharedInstanceLock);
  return v3;
}

- (BOOL)checkCapabilities:(id)a3 withMismatches:(id *)a4
{
  objc_super v6 = (uint64_t (*)(id, void))ISWeakLinkedSymbolForString("MobileInstallationCheckCapabilitiesMatch", (const void *)0x17);
  if (v6 && (CFDictionaryRef v7 = (const __CFDictionary *)v6(a3, 0)) != 0)
  {
    CFDictionaryRef v8 = v7;
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v7, @"CapabilitiesMatch");
    if (Value && CFBooleanGetValue(Value))
    {
      v10 = 0;
      BOOL v11 = 1;
    }
    else
    {
      v10 = (void *)CFDictionaryGetValue(v8, @"MismatchedCapabilities");
      id v12 = v10;
      BOOL v11 = 0;
    }
    CFRelease(v8);
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v11 = 0;
    v10 = 0;
    if (!a4)
    {
LABEL_10:

      return v11;
    }
  }
  *a4 = v10;
  return v11;
}

- (id)copyProtocolConditionalContext
{
  id v3 = objc_alloc_init(MEMORY[0x263F7B2C8]);
  objc_msgSend(v3, "setSystemVersion:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "productVersion"));
  int v4 = [(ISDevice *)self _deviceClass];
  v5 = (void *)MEMORY[0x263F7BBE0];
  objc_super v6 = (void *)MEMORY[0x263F7BBF0];
  if (v4 != 2) {
    objc_super v6 = (void *)MEMORY[0x263F7BBE8];
  }
  if (v4 != 3) {
    v5 = v6;
  }
  [v3 setPlatformName:*v5];
  return v3;
}

- (int64_t)deviceBiometricStyle
{
  if (!self->_biometricStyle)
  {
    id v3 = (const void *)MGCopyAnswer();
    int v4 = (const void *)*MEMORY[0x263EFFB40];
    if (v3 == (const void *)*MEMORY[0x263EFFB40])
    {
      v5 = 0;
      int64_t v6 = 3;
    }
    else
    {
      v5 = (const void *)MGCopyAnswer();
      int64_t v6 = 1;
      if (v5 == v4) {
        int64_t v6 = 2;
      }
    }
    self->_biometricStyle = v6;
    if (v3) {
      CFRelease(v3);
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  return self->_biometricStyle;
}

- (NSString)deviceName
{
  v2 = (void *)MGCopyAnswer();
  if (!v2) {
    return (NSString *)@"Unknown";
  }

  return (NSString *)v2;
}

- (NSString)guid
{
  uint64_t v6 = 0;
  CFDictionaryRef v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  uint64_t v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __16__ISDevice_guid__block_invoke;
  v5[3] = &unk_2642608E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __16__ISDevice_guid__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    *(void *)(*(void *)(a1 + 32) + 32) = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B1F0], "sharedInstance"), "copyDeviceGUID");
    v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id result = v2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)hardwareName
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (BOOL)releasePowerAssertion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v4) {
    int v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v11 = 138412546;
    uint64_t v12 = objc_opt_class();
    __int16 v13 = 2112;
    id v14 = a3;
    LODWORD(v10) = 22;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v11, v10);
      free(v8);
      SSFileLog();
    }
  }
  return CPSetPowerAssertionWithIdentifier();
}

- (NSString)serialNumber
{
  v2 = (void *)MGCopyAnswer();

  return (NSString *)v2;
}

- (NSString)systemName
{
  v2 = (void *)_CFCopySystemVersionDictionary();
  id v3 = (NSString *)(id)[v2 objectForKey:*MEMORY[0x263EFFAB8]];

  return v3;
}

- (BOOL)takePowerAssertion:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v4) {
    int v4 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v11 = 138412546;
    uint64_t v12 = objc_opt_class();
    __int16 v13 = 2112;
    id v14 = a3;
    LODWORD(v10) = 22;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      objc_msgSend(NSString, "stringWithCString:encoding:", v7, 4, &v11, v10);
      free(v8);
      SSFileLog();
    }
  }
  return CPSetPowerAssertionWithIdentifier();
}

- (void)requestFreeSpace:(unint64_t)a3 atPath:(id)a4 withOptions:(id)a5 completionBlock:(id)a6
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  int v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__ISDevice_requestFreeSpace_atPath_withOptions_completionBlock___block_invoke;
  block[3] = &unk_264260908;
  block[5] = self;
  block[6] = &v8;
  block[4] = a5;
  dispatch_sync(dispatchQueue, block);
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();

  _Block_object_dispose(&v8, 8);
}

void *__64__ISDevice_requestFreeSpace_atPath_withOptions_completionBlock___block_invoke(void *a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = Current;
  int v4 = (void *)a1[4];
  if (v4)
  {
    id v5 = v4;
LABEL_5:
    *(void *)(*(void *)(a1[6] + 8) + 40) = v5;
    goto LABEL_6;
  }
  if (Current - *(double *)(a1[5] + 40) < 300.0)
  {
    id v6 = objc_alloc(NSDictionary);
    uint64_t v7 = [NSNumber numberWithInteger:0];
    id v5 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", v7, *MEMORY[0x263F255E0], 0);
    goto LABEL_5;
  }
LABEL_6:
  id result = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!result
    || (id result = objc_msgSend((id)objc_msgSend(result, "objectForKey:", *MEMORY[0x263F255E0]), "integerValue")) != 0)
  {
    *(double *)(a1[5] + 40) = v3;
  }
  return result;
}

- (void)resetLocationAndPrivacy
{
  v2 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v2) {
    v2 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  if (os_log_type_enabled((os_log_t)[v2 OSLogObject], OS_LOG_TYPE_INFO)) {
    int v5 = v4;
  }
  else {
    int v5 = v4 & 2;
  }
  if (v5)
  {
    v12[0] = 0;
    LODWORD(v11) = 2;
    uint64_t v10 = v12;
    uint64_t v6 = _os_log_send_and_compose_impl();
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v6, 4, v12, v11);
      free(v7);
      uint64_t v10 = (_WORD *)v8;
      SSFileLog();
    }
  }
  v9 = objc_msgSend(MEMORY[0x263F7B380], "sharedStorage", v10);
  objc_msgSend(v9, "removeCookiesWithProperties:", objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"xp_ci", *MEMORY[0x263F08128]));
}

- (id)supportedOfferDeviceForDevices:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v4 = [(ISDevice *)self _deviceClass];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (2)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(a3);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    switch([v9 deviceIdentifier])
    {
      case 1:
        return v9;
      case 2:
        if (v4 != 1) {
          goto LABEL_12;
        }
        break;
      case 3:
      case 4:
        if (v4 != 2) {
          goto LABEL_12;
        }
        break;
      case 9:
        if (v4 != 3) {
          goto LABEL_12;
        }
        break;
      default:
LABEL_12:
        if (v6 != ++v8) {
          continue;
        }
        uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (!v6) {
          return 0;
        }
        goto LABEL_3;
    }
    return v9;
  }
}

- (int)_deviceClass
{
  v2 = (void *)MGCopyAnswer();
  int v3 = [v2 integerValue];

  return v3;
}

@end