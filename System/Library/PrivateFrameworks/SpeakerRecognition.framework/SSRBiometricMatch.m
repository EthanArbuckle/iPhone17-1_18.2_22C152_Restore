@interface SSRBiometricMatch
+ (id)sharedInstance;
- (BKDevice)biometricDevice;
- (BOOL)_getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4;
- (SSRBiometricMatch)init;
- (unint64_t)getLastBiometricMatchForVoiceTriggerTimeStamp:(unint64_t)a3;
- (void)setBiometricDevice:(id)a3;
@end

@implementation SSRBiometricMatch

- (void).cxx_destruct
{
}

- (void)setBiometricDevice:(id)a3
{
}

- (BKDevice)biometricDevice
{
  return self->_biometricDevice;
}

- (BOOL)_getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4
{
  *(void *)&v21[13] = *MEMORY[0x263EF8340];
  biometricDevice = self->_biometricDevice;
  if (!biometricDevice)
  {
    v15 = *MEMORY[0x263F38100];
    BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR);
    if (!v14) {
      return v14;
    }
    *(_DWORD *)buf = 136315138;
    v19 = "-[SSRBiometricMatch _getLastBiometricMatchEvent:atTime:]";
    _os_log_error_impl(&dword_21C8A5000, v15, OS_LOG_TYPE_ERROR, "%s ERR: Biometric device is nil - Bailing out", buf, 0xCu);
LABEL_15:
    LOBYTE(v14) = 0;
    return v14;
  }
  id v17 = 0;
  v7 = [(BKDevice *)biometricDevice lastMatchEventWithError:&v17];
  id v8 = v17;
  v9 = *MEMORY[0x263F38100];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SSRBiometricMatch _getLastBiometricMatchEvent:atTime:]";
      __int16 v20 = 2112;
      *(void *)v21 = v8;
      _os_log_impl(&dword_21C8A5000, v9, OS_LOG_TYPE_DEFAULT, "%s BiometricMatchEvents unavailable with error %@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  if (v10)
  {
    v11 = v9;
    int v12 = [v7 result];
    uint64_t v13 = [v7 timeStamp];
    *(_DWORD *)buf = 136315650;
    v19 = "-[SSRBiometricMatch _getLastBiometricMatchEvent:atTime:]";
    __int16 v20 = 1024;
    *(_DWORD *)v21 = v12;
    v21[2] = 2048;
    *(void *)&v21[3] = v13;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s BiometricMatchEvent: result = %u, timeStamp = %llu", buf, 0x1Cu);
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

- (unint64_t)getLastBiometricMatchForVoiceTriggerTimeStamp:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    BOOL v10 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[SSRBiometricMatch getLastBiometricMatchForVoiceTriggerTimeStamp:]";
      _os_log_error_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_ERROR, "%s triggerTimeStamp is nil - Bailing out", buf, 0xCu);
    }
    return 0;
  }
  unsigned __int8 v14 = 0;
  uint64_t v13 = 0;
  CSMachAbsoluteTimeToMachContinuousTime();
  if (![(SSRBiometricMatch *)self _getLastBiometricMatchEvent:&v14 atTime:&v13])
  {
    v11 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[SSRBiometricMatch getLastBiometricMatchForVoiceTriggerTimeStamp:]";
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s No biometric information available", buf, 0xCu);
    }
    return 0;
  }
  CSMachAbsoluteTimeGetTimeInterval();
  double v5 = v4;
  int v6 = v14;
  v7 = *MEMORY[0x263F38100];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT);
  if (v6 && v5 < 3.0)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[SSRBiometricMatch getLastBiometricMatchForVoiceTriggerTimeStamp:]";
      __int16 v17 = 2048;
      double v18 = v5;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Biometric match happened in last %f secs", buf, 0x16u);
    }
    return 1;
  }
  else
  {
    if (v8)
    {
      int v12 = @"MATCH";
      v16 = "-[SSRBiometricMatch getLastBiometricMatchForVoiceTriggerTimeStamp:]";
      *(_DWORD *)buf = 136315650;
      if (!v6) {
        int v12 = @"MIS-MATCH";
      }
      __int16 v17 = 2112;
      double v18 = *(double *)&v12;
      __int16 v19 = 2048;
      double v20 = v5;
      _os_log_impl(&dword_21C8A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Biometric match result: %@ happened in last %f secs", buf, 0x20u);
      int v6 = v14;
    }
    if (v6) {
      return 3;
    }
    else {
      return 2;
    }
  }
}

- (SSRBiometricMatch)init
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SSRBiometricMatch;
  v2 = [(SSRBiometricMatch *)&v15 init];
  if (v2)
  {
    uint64_t v16 = 0;
    __int16 v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v3 = (void *)getBKDeviceClass_softClass;
    uint64_t v19 = getBKDeviceClass_softClass;
    if (!getBKDeviceClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getBKDeviceClass_block_invoke;
      uint64_t v21 = &unk_26442A590;
      v22 = &v16;
      __getBKDeviceClass_block_invoke((uint64_t)buf);
      v3 = (void *)v17[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v16, 8);
    uint64_t v16 = 0;
    __int16 v17 = &v16;
    uint64_t v18 = 0x2050000000;
    double v5 = (void *)getBKDeviceManagerClass_softClass;
    uint64_t v19 = getBKDeviceManagerClass_softClass;
    if (!getBKDeviceManagerClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getBKDeviceManagerClass_block_invoke;
      uint64_t v21 = &unk_26442A590;
      v22 = &v16;
      __getBKDeviceManagerClass_block_invoke((uint64_t)buf);
      double v5 = (void *)v17[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v16, 8);
    v7 = [v6 availableDevices];
    BOOL v8 = [v7 firstObject];
    id v14 = 0;
    uint64_t v9 = [v4 deviceWithDescriptor:v8 error:&v14];
    id v10 = v14;
    biometricDevice = v2->_biometricDevice;
    v2->_biometricDevice = (BKDevice *)v9;

    if (v10 || !v2->_biometricDevice)
    {
      int v12 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[SSRBiometricMatch init]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        _os_log_error_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_ERROR, "%s Failed to create biometricdevice with error %@", buf, 0x16u);
      }
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (CSIsCommunalDevice() & 1) != 0 || ([MEMORY[0x263F380D0] isDarwinOS])
  {
    id v2 = 0;
  }
  else
  {
    if (sharedInstance_onceToken_8257 != -1) {
      dispatch_once(&sharedInstance_onceToken_8257, &__block_literal_global_8258);
    }
    id v2 = (id)sharedInstance_biometricMatchMonitor;
  }

  return v2;
}

uint64_t __35__SSRBiometricMatch_sharedInstance__block_invoke()
{
  sharedInstance_biometricMatchMonitor = objc_alloc_init(SSRBiometricMatch);

  return MEMORY[0x270F9A758]();
}

@end