@interface VTBiometricMatchMonitor
+ (VTBiometricMatchMonitor)sharedInstance;
- (BKDevice)biometricDevice;
- (BOOL)getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4;
- (VTBiometricMatchMonitor)init;
- (VTBiometricMatchMonitorDelegate)delegate;
- (void)device:(id)a3 matchEventOccurred:(id)a4;
- (void)setBiometricDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startObserving;
@end

@implementation VTBiometricMatchMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricDevice, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setBiometricDevice:(id)a3
{
}

- (BKDevice)biometricDevice
{
  return self->_biometricDevice;
}

- (void)setDelegate:(id)a3
{
}

- (VTBiometricMatchMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VTBiometricMatchMonitorDelegate *)WeakRetained;
}

- (void)device:(id)a3 matchEventOccurred:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v14[0] = 67109376;
    v14[1] = [v7 result];
    __int16 v15 = 2048;
    uint64_t v16 = [v7 timeStamp];
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "BiometricMatchEventOccurred: result = %u, timeStamp = %llu", (uint8_t *)v14, 0x12u);
  }
  if (v7)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v13, "biometricMatchMonitorDidReceiveMatchAttempt:atTime:", objc_msgSend(v7, "result"), objc_msgSend(v7, "timeStamp"));
    }
  }
}

- (BOOL)getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4
{
  *(void *)&v19[5] = *MEMORY[0x263EF8340];
  biometricDevice = self->_biometricDevice;
  if (!biometricDevice)
  {
    __int16 v15 = VTLogContextFacilityVoiceTrigger;
    BOOL v14 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR);
    if (!v14) {
      return v14;
    }
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21844F000, v15, OS_LOG_TYPE_ERROR, "ERR: Biometric device is nil - Bailing out", buf, 2u);
LABEL_15:
    LOBYTE(v14) = 0;
    return v14;
  }
  id v17 = 0;
  id v7 = [(BKDevice *)biometricDevice lastMatchEventWithError:&v17];
  id v8 = v17;
  v9 = VTLogContextFacilityVoiceTrigger;
  BOOL v10 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v19 = v8;
      _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "BiometricMatchEvents unavailable with error %@", buf, 0xCu);
    }

    goto LABEL_15;
  }
  if (v10)
  {
    v11 = v9;
    int v12 = [v7 result];
    uint64_t v13 = [v7 timeStamp];
    *(_DWORD *)buf = 67109376;
    v19[0] = v12;
    LOWORD(v19[1]) = 2048;
    *(void *)((char *)&v19[1] + 2) = v13;
    _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "BiometricMatchEvent: result = %u, timeStamp = %llu", buf, 0x12u);
  }
  if (a3) {
    *a3 = [v7 result];
  }
  if (a4) {
    *a4 = [v7 timeStamp];
  }

  LOBYTE(v14) = 1;
  return v14;
}

- (void)startObserving
{
  biometricDevice = self->_biometricDevice;
  if (biometricDevice) {
    [(BKDevice *)biometricDevice setDelegate:self];
  }
}

- (VTBiometricMatchMonitor)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)VTBiometricMatchMonitor;
  v2 = [(VTEventMonitor *)&v15 init];
  if (v2)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v3 = (void *)getBKDeviceClass_softClass;
    uint64_t v19 = getBKDeviceClass_softClass;
    if (!getBKDeviceClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v21 = __getBKDeviceClass_block_invoke;
      v22 = &unk_264326190;
      v23 = &v16;
      __getBKDeviceClass_block_invoke((uint64_t)&buf);
      v3 = (void *)v17[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v16, 8);
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v5 = (void *)getBKDeviceManagerClass_softClass;
    uint64_t v19 = getBKDeviceManagerClass_softClass;
    if (!getBKDeviceManagerClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v21 = __getBKDeviceManagerClass_block_invoke;
      v22 = &unk_264326190;
      v23 = &v16;
      __getBKDeviceManagerClass_block_invoke((uint64_t)&buf);
      v5 = (void *)v17[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v16, 8);
    id v7 = [v6 availableDevices];
    id v8 = [v7 firstObject];
    id v14 = 0;
    uint64_t v9 = [v4 deviceWithDescriptor:v8 error:&v14];
    id v10 = v14;
    biometricDevice = v2->_biometricDevice;
    v2->_biometricDevice = (BKDevice *)v9;

    if (v10 || !v2->_biometricDevice)
    {
      int v12 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_error_impl(&dword_21844F000, v12, OS_LOG_TYPE_ERROR, "Failed to create biometricdevice with error %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  return v2;
}

+ (VTBiometricMatchMonitor)sharedInstance
{
  if (sharedInstance_onceToken_6818 != -1) {
    dispatch_once(&sharedInstance_onceToken_6818, &__block_literal_global_6819);
  }
  v2 = (void *)sharedInstance_biometricMatchMonitor;

  return (VTBiometricMatchMonitor *)v2;
}

uint64_t __41__VTBiometricMatchMonitor_sharedInstance__block_invoke()
{
  sharedInstance_biometricMatchMonitor = objc_alloc_init(VTBiometricMatchMonitor);

  return MEMORY[0x270F9A758]();
}

@end