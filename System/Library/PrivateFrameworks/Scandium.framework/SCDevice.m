@interface SCDevice
- (NSMutableArray)featureReportQueue;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)inputReportQueue;
- (SCDevice)initWithDelegate:(id)a3 queue:(id)a4;
- (SCDevice)initWithIOHIDDevice:(__IOHIDDevice *)a3 delegate:(id)a4 queue:(id)a5;
- (SCDeviceDelegate)delegate;
- (SCRTPTimestampReference)latestRTPTimestampReference;
- (__IOHIDDevice)device;
- (int)setFeatureReport:(const char *)a3 ofLength:(unint64_t)a4;
- (void)attemptToDrainFeatureReportQueue;
- (void)dealloc;
- (void)enqueueFeatureReportAttempt:(id)a3;
- (void)inputReportBuffer;
- (void)reportBackgroundSessionOutcome:(BOOL)a3 forTimestamp:(unint64_t)a4;
- (void)setFeatureReportQueue:(id)a3;
- (void)setOperatingMode:(unsigned __int8)a3;
@end

@implementation SCDevice

- (SCDevice)initWithDelegate:(id)a3 queue:(id)a4
{
  v15[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 8u);
  if (v8)
  {
    v14[0] = @"DeviceUsagePage";
    v14[1] = @"DeviceUsage";
    v15[0] = &unk_270936CA0;
    v15[1] = &unk_270936CB8;
    CFDictionaryRef v9 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    IOHIDManagerSetDeviceMatching(v8, v9);
    CFSetRef v10 = IOHIDManagerCopyDevices(v8);
    CFRelease(v8);
    v11 = [(__CFSet *)v10 anyObject];
    v8 = v11;
    if (v11)
    {
      if (IOHIDDeviceOpen(v11, 0))
      {
        CFRelease(v8);
        v8 = 0;
      }
      else
      {
        v12 = [(SCDevice *)self initWithIOHIDDevice:v8 delegate:v6 queue:v7];
        CFRelease(v8);
        self = v12;
        v8 = (__IOHIDManager *)self;
      }
    }
  }
  return (SCDevice *)v8;
}

- (SCDevice)initWithIOHIDDevice:(__IOHIDDevice *)a3 delegate:(id)a4 queue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SCDevice;
  id v10 = [(SCDevice *)&v20 init];
  if (!v10) {
    goto LABEL_10;
  }
  CFRetain(a3);
  *((void *)v10 + 1) = a3;
  objc_storeWeak((id *)v10 + 2, v8);
  objc_storeStrong((id *)v10 + 3, a5);
  uint64_t v11 = objc_opt_new();
  v12 = (void *)*((void *)v10 + 6);
  *((void *)v10 + 6) = v11;

  if (*((void *)v10 + 6))
  {
    v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
    if (v13
      && (dispatch_queue_t v14 = dispatch_queue_create("com.apple.scandium.input_report", v13),
          v15 = (void *)*((void *)v10 + 4),
          *((void *)v10 + 4) = v14,
          v15,
          *((void *)v10 + 4)))
    {
      v16 = IOHIDDeviceGetProperty(*((IOHIDDeviceRef *)v10 + 1), @"MaxInputReportSize");
      v17 = v16;
      if (v16
        && [v16 integerValue] >= 1
        && [v17 unsignedIntValue] <= 0x1000)
      {
        v18 = (uint8_t *)malloc_type_malloc([v17 unsignedIntValue], 0x624FDBA9uLL);
        *((void *)v10 + 5) = v18;
        if (v18)
        {
          IOHIDDeviceRegisterInputReportCallback(*((IOHIDDeviceRef *)v10 + 1), v18, [v17 unsignedIntValue], (IOHIDReportCallback)input_report_callback, v10);
          IOHIDDeviceSetDispatchQueue(*((IOHIDDeviceRef *)v10 + 1), *((dispatch_queue_t *)v10 + 4));
          IOHIDDeviceActivate(*((IOHIDDeviceRef *)v10 + 1));
          v18 = (uint8_t *)v10;
        }
      }
      else
      {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
LABEL_10:
    v18 = 0;
  }

  return (SCDevice *)v18;
}

- (void)dealloc
{
  free(self->_inputReportBuffer);

  v3.receiver = self;
  v3.super_class = (Class)SCDevice;
  [(SCDevice *)&v3 dealloc];
}

- (int)setFeatureReport:(const char *)a3 ofLength:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    IOReturn v10 = -536870206;
    id v8 = sc_get_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[SCDevice setFeatureReport:ofLength:](v8);
    }
    goto LABEL_12;
  }
  id v7 = sc_get_log();
  id v8 = v7;
  if (!a4)
  {
    IOReturn v10 = -536870206;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[SCDevice setFeatureReport:ofLength:](v8);
    }
    goto LABEL_12;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(unsigned __int8 *)a3;
    v12[0] = 67109634;
    v12[1] = v9;
    __int16 v13 = 1040;
    int v14 = a4;
    __int16 v15 = 2098;
    v16 = a3;
    _os_log_impl(&dword_25BA34000, v8, OS_LOG_TYPE_DEFAULT, "IOHIDDeviceSetReport (0x%02x) : %{public}.*P", (uint8_t *)v12, 0x18u);
  }

  IOReturn v10 = IOHIDDeviceSetReport(self->_device, kIOHIDReportTypeFeature, *(unsigned __int8 *)a3, (const uint8_t *)a3, a4);
  if (v10)
  {
    id v8 = sc_get_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCDevice setFeatureReport:ofLength:]((unsigned __int8 *)a3, v10, v8);
    }
LABEL_12:
  }
  return v10;
}

- (void)setOperatingMode:(unsigned __int8)a3
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__SCDevice_setOperatingMode___block_invoke;
  v6[3] = &unk_2654A04E0;
  unsigned __int8 v8 = a3;
  objc_copyWeak(&v7, &location);
  v5 = (void *)MEMORY[0x26116E820](v6);
  [(SCDevice *)self enqueueFeatureReportAttempt:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

BOOL __29__SCDevice_setOperatingMode___block_invoke(uint64_t a1)
{
  __int16 v4 = 0;
  HIBYTE(v4) = *(unsigned char *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = [WeakRetained setFeatureReport:&v4 ofLength:2];

  return v2 != -536870184;
}

- (void)reportBackgroundSessionOutcome:(BOOL)a3 forTimestamp:(unint64_t)a4
{
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  IOReturn v10 = __56__SCDevice_reportBackgroundSessionOutcome_forTimestamp___block_invoke;
  uint64_t v11 = &unk_2654A0508;
  BOOL v13 = a3;
  v12[1] = (id)a4;
  objc_copyWeak(v12, &location);
  id v7 = (void *)MEMORY[0x26116E820](&v8);
  -[SCDevice enqueueFeatureReportAttempt:](self, "enqueueFeatureReportAttempt:", v7, v8, v9, v10, v11);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

uint64_t __56__SCDevice_reportBackgroundSessionOutcome_forTimestamp___block_invoke(uint64_t a1)
{
  v3[0] = -109;
  v3[1] = *(unsigned char *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFeatureReport:v3 ofLength:10];

  return 1;
}

- (void)enqueueFeatureReportAttempt:(id)a3
{
  uint64_t v4 = (uint64_t (**)(void))a3;
  v5 = [(SCDevice *)self featureReportQueue];
  if ([v5 count])
  {
  }
  else
  {
    char v6 = v4[2](v4);

    if (v6) {
      goto LABEL_7;
    }
  }
  id v7 = [(SCDevice *)self delegateQueue];
  if (v7)
  {
    uint64_t v8 = [(SCDevice *)self featureReportQueue];
    uint64_t v9 = (void *)MEMORY[0x26116E820](v4);
    [v8 addObject:v9];

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__SCDevice_enqueueFeatureReportAttempt___block_invoke;
    v10[3] = &unk_2654A0530;
    objc_copyWeak(&v11, &location);
    dispatch_async(v7, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

LABEL_7:
}

void __40__SCDevice_enqueueFeatureReportAttempt___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained attemptToDrainFeatureReportQueue];
}

- (void)attemptToDrainFeatureReportQueue
{
  for (i = self; ; self = i)
  {
    objc_super v3 = [(SCDevice *)self featureReportQueue];
    uint64_t v4 = [v3 count];

    if (!v4) {
      break;
    }
    v5 = [(SCDevice *)i featureReportQueue];
    char v6 = [v5 firstObject];
    int v7 = v6[2]();

    if (!v7)
    {
      objc_initWeak(&location, i);
      uint64_t v9 = [(SCDevice *)i delegateQueue];
      if (v9)
      {
        dispatch_time_t v10 = dispatch_time(0, 125000000);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __44__SCDevice_attemptToDrainFeatureReportQueue__block_invoke;
        v11[3] = &unk_2654A0530;
        objc_copyWeak(&v12, &location);
        dispatch_after(v10, v9, v11);
        objc_destroyWeak(&v12);
      }

      objc_destroyWeak(&location);
      return;
    }
    uint64_t v8 = [(SCDevice *)i featureReportQueue];
    [v8 removeObjectAtIndex:0];
  }
}

void __44__SCDevice_attemptToDrainFeatureReportQueue__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained attemptToDrainFeatureReportQueue];
}

- (SCRTPTimestampReference)latestRTPTimestampReference
{
  *(_OWORD *)&retstr->cfAbsoluteTime = xmmword_25BA62C60;
  *(void *)&retstr->ticksPerSecond = 0x8000;
  while (1)
  {
    *(void *)&report[5] = 0;
    CFIndex pReportLength = 13;
    *(void *)report = 0;
    result = (SCRTPTimestampReference *)IOHIDDeviceGetReport(self->_device, kIOHIDReportTypeFeature, 214, report, &pReportLength);
    if (result) {
      break;
    }
    uint64_t v6 = *(void *)&report[1];
    unint64_t v7 = *(unsigned int *)&report[9];
    retstr->ticksPerSecond = *(_DWORD *)&report[9];
    retstr->cfAbsoluteTime = CFAbsoluteTimeGetCurrent();
    result = (SCRTPTimestampReference *)IOHIDDeviceGetReport(self->_device, kIOHIDReportTypeFeature, 214, report, &pReportLength);
    if (result) {
      break;
    }
    if (*(void *)&report[1] - v6 <= v7 >> 3)
    {
      retstr->rtpTimestamp = (unint64_t)(*(void *)&report[1] + v6) >> 1;
      return result;
    }
  }
  return result;
}

- (__IOHIDDevice)device
{
  return self->_device;
}

- (SCDeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCDeviceDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (OS_dispatch_queue)inputReportQueue
{
  return self->_inputReportQueue;
}

- (void)inputReportBuffer
{
  return self->_inputReportBuffer;
}

- (NSMutableArray)featureReportQueue
{
  return self->_featureReportQueue;
}

- (void)setFeatureReportQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureReportQueue, 0);
  objc_storeStrong((id *)&self->_inputReportQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setFeatureReport:(os_log_t)log ofLength:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_25BA34000, log, OS_LOG_TYPE_FAULT, "null report buffer", v1, 2u);
}

- (void)setFeatureReport:(os_log_t)log ofLength:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_25BA34000, log, OS_LOG_TYPE_FAULT, "length cannot be 0", v1, 2u);
}

- (void)setFeatureReport:(NSObject *)a3 ofLength:.cold.3(unsigned __int8 *a1, int a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = *a1;
  v6[0] = 67109634;
  v6[1] = v5;
  __int16 v7 = 2080;
  uint64_t v8 = ioreturn_string(a2);
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_error_impl(&dword_25BA34000, a3, OS_LOG_TYPE_ERROR, "IOHIDDeviceSetReport for report ID 0x%02x failed: %s (0x%x)", (uint8_t *)v6, 0x18u);
}

@end