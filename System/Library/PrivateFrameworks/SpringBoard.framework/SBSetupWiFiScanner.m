@interface SBSetupWiFiScanner
- (NSThread)_scanningThread;
- (id)_completionHandler;
- (int64_t)_state;
- (void)_setCompletionHandler:(id)a3;
- (void)_setScanningThread:(id)a3;
- (void)_setState:(int64_t)a3;
- (void)_thread_callCompletionHandlerWithGuessedCountries:(id)a3;
- (void)_thread_cancelScanning;
- (void)_thread_closeWifiConnection;
- (void)_thread_wifiScanComplete:(__CFArray *)a3 error:(BOOL)a4;
- (void)_wifiScanningThread;
- (void)beginScanningWithCompletionHandler:(id)a3;
- (void)cancel;
- (void)dealloc;
@end

@implementation SBSetupWiFiScanner

- (void)dealloc
{
  [(SBSetupWiFiScanner *)self _thread_closeWifiConnection];
  v3.receiver = self;
  v3.super_class = (Class)SBSetupWiFiScanner;
  [(SBSetupWiFiScanner *)&v3 dealloc];
}

- (void)beginScanningWithCompletionHandler:(id)a3
{
  [(SBSetupWiFiScanner *)self _setCompletionHandler:a3];
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__wifiScanningThread object:0];
  [v4 setName:@"com.apple.SpringBoard.BuddyWiFiScanning"];
  [v4 setQualityOfService:17];
  [(SBSetupWiFiScanner *)self _setScanningThread:v4];
  [v4 start];
}

- (void)_wifiScanningThread
{
  Current = CFRunLoopGetCurrent();
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v5 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->_wifiManager = v5;
  if (!v5)
  {
LABEL_11:
    [(SBSetupWiFiScanner *)self _thread_callCompletionHandlerWithGuessedCountries:0];
    return;
  }
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D418];
  WiFiManagerClientScheduleWithRunLoop();
  CFArrayRef v7 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v7)
  {
    CFArrayRef v8 = v7;
    if ((CFArrayGetCount(v7) & 0x8000000000000000) == 0)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v8, 0);
      if (ValueAtIndex)
      {
        v10 = ValueAtIndex;
        CFTypeID v11 = CFGetTypeID(ValueAtIndex);
        if (v11 == WiFiDeviceClientGetTypeID()) {
          self->_wifiDevice = (__WiFiDeviceClient *)CFRetain(v10);
        }
      }
    }
    CFRelease(v8);
  }
  if (!self->_wifiDevice
    || (CFDictionaryRef v12 = CFDictionaryCreate(v4, 0, 0, 0, 0, 0), v13 = WiFiDeviceClientScanAsync(), CFRelease(v12), v13))
  {
    [(SBSetupWiFiScanner *)self _thread_closeWifiConnection];
    goto LABEL_11;
  }
  [(SBSetupWiFiScanner *)self _setState:1];
  CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
  v15 = CFRunLoopTimerCreate(v4, v14 + 1000000.0, 1.79769313e308, 0, 0, (CFRunLoopTimerCallBack)SetupWiFiScanTimerCallback, 0);
  CFRunLoopAddTimer(Current, v15, v6);
  while ([(SBSetupWiFiScanner *)self _state] != 2)
    CFRunLoopRunInMode(v6, 1.79769313e308, 1u);
  CFRunLoopTimerInvalidate(v15);
  CFRelease(v15);
}

- (void)_thread_wifiScanComplete:(__CFArray *)a3 error:(BOOL)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int64_t v7 = [(SBSetupWiFiScanner *)self _state];
  if (a3 && v7 != 2)
  {
    if (a4)
    {
      [(SBSetupWiFiScanner *)self _thread_callCompletionHandlerWithGuessedCountries:0];
LABEL_41:
      [(SBSetupWiFiScanner *)self _setState:2];
      [(SBSetupWiFiScanner *)self _thread_closeWifiConnection];
      return;
    }
    CFArrayRef v8 = (void *)MEMORY[0x1D948C4D0]();
    CFIndex Count = CFArrayGetCount(a3);
    if (Count < 1)
    {
      [(SBSetupWiFiScanner *)self _thread_callCompletionHandlerWithGuessedCountries:0];
LABEL_40:
      goto LABEL_41;
    }
    CFIndex v10 = Count;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    CFIndex v13 = 0;
    int v45 = 3;
    do
    {
      CFArrayGetValueAtIndex(a3, v13);
      if (WiFiNetworkGet11dCountryCodeFromIe())
      {
        CFAbsoluteTime v14 = (void *)[[NSString alloc] initWithBytes:v46 length:2 encoding:1];
        [v11 addObject:v14];
      }
      ++v13;
    }
    while (v10 != v13);
    v32 = v8;
    id v15 = v11;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          [v12 addObject:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v17);
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v20 = v12;
    v21 = (void *)[v20 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v21)
    {
      unint64_t v22 = 0;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          unint64_t v25 = [v20 countForObject:*(void *)(*((void *)&v37 + 1) + 8 * (void)j)];
          if (v25 > v22) {
            unint64_t v22 = v25;
          }
        }
        v21 = (void *)[v20 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }
      while (v21);

      if (!v22)
      {
        v21 = 0;
        goto LABEL_39;
      }
      v21 = [MEMORY[0x1E4F1CA48] array];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v26 = v20;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v47 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v34;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v34 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v33 + 1) + 8 * k);
            if ([v26 countForObject:v31] == v22) {
              [v21 addObject:v31];
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v47 count:16];
        }
        while (v28);
      }
    }

LABEL_39:
    CFArrayRef v8 = v32;
    [(SBSetupWiFiScanner *)self _thread_callCompletionHandlerWithGuessedCountries:v21];

    goto LABEL_40;
  }
}

- (void)_thread_closeWifiConnection
{
  if (self->_wifiManager)
  {
    CFRunLoopGetCurrent();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
  }
  if (self->_wifiDevice)
  {
    if ([(SBSetupWiFiScanner *)self _state] == 1)
    {
      [(SBSetupWiFiScanner *)self _setState:2];
      WiFiDeviceClientScanCancel();
    }
    CFRelease(self->_wifiDevice);
    self->_wifiDevice = 0;
  }
}

- (void)_thread_callCompletionHandlerWithGuessedCountries:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SBSetupWiFiScanner *)self _completionHandler];
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
    [(SBSetupWiFiScanner *)self _setCompletionHandler:0];
  }
}

- (void)cancel
{
  objc_super v3 = [(SBSetupWiFiScanner *)self _scanningThread];
  if (v3)
  {
    id v4 = v3;
    [v3 cancel];
    [(SBSetupWiFiScanner *)self performSelector:sel__thread_cancelScanning onThread:v4 withObject:0 waitUntilDone:0];
    objc_super v3 = v4;
  }
}

- (void)_thread_cancelScanning
{
  [(SBSetupWiFiScanner *)self _thread_closeWifiConnection];
  [(SBSetupWiFiScanner *)self _setState:2];
}

- (NSThread)_scanningThread
{
  return (NSThread *)objc_getProperty(self, a2, 24, 1);
}

- (void)_setScanningThread:(id)a3
{
}

- (id)_completionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)_setCompletionHandler:(id)a3
{
}

- (int64_t)_state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_scanningThread, 0);
}

@end