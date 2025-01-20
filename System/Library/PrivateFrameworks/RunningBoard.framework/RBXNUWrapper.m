@interface RBXNUWrapper
+ (id)sharedWrapper;
- (RBXNUWrapper)init;
- (int64_t)_setBallastOffset:(unint64_t)a3;
- (int64_t)setBallastDrained:(BOOL)a3;
- (unint64_t)ballastOffsetMB;
- (void)init;
- (void)setGPURole:(unsigned __int8)a3 forPid:(int)a4;
@end

@implementation RBXNUWrapper

- (void)setGPURole:(unsigned __int8)a3 forPid:(int)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (MEMORY[0x263F4B118])
  {
    if (self->_gpuDevice)
    {
      if (a3 == 3) {
        int v10 = 1;
      }
      else {
        int v10 = 2;
      }
      if (a3 == 4) {
        int v11 = 0;
      }
      else {
        int v11 = v10;
      }
      int v12 = IOGPUDeviceSetAppGPURole();
      if (v12 == -536870208)
      {
        v4 = rbs_process_log();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        int v14 = 67109376;
        int v15 = a4;
        __int16 v16 = 1024;
        int v17 = v11;
        v5 = "%d setGPURole role to %d (no effect for this process)";
      }
      else
      {
        int v13 = v12;
        if (v12)
        {
          v4 = rbs_general_log();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            -[RBXNUWrapper setGPURole:forPid:](a4, v13, v4);
          }
          goto LABEL_23;
        }
        v4 = rbs_process_log();
        if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
          goto LABEL_23;
        }
        int v14 = 67109376;
        int v15 = a4;
        __int16 v16 = 1024;
        int v17 = v11;
        v5 = "%d setGPURole role to %d";
      }
      v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_INFO;
      uint32_t v8 = 14;
      goto LABEL_20;
    }
    v4 = rbs_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[RBXNUWrapper setGPURole:forPid:]();
    }
  }
  else
  {
    v4 = rbs_general_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v5 = "Setting GPU Role not avaible on this mastering";
      v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 2;
LABEL_20:
      _os_log_impl(&dword_226AB3000, v6, v7, v5, (uint8_t *)&v14, v8);
    }
  }
LABEL_23:
}

+ (id)sharedWrapper
{
  if (sharedWrapper_onceToken != -1) {
    dispatch_once(&sharedWrapper_onceToken, &__block_literal_global_20);
  }
  v2 = (void *)sharedWrapper_result;
  return v2;
}

uint64_t __29__RBXNUWrapper_sharedWrapper__block_invoke()
{
  sharedWrapper_result = objc_alloc_init(RBXNUWrapper);
  return MEMORY[0x270F9A758]();
}

- (RBXNUWrapper)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)RBXNUWrapper;
  v2 = [(RBXNUWrapper *)&v21 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F80E20] clientWithIdentifier:227];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;

    v5 = [(TRIClient *)v2->_trialClient levelForFactor:@"BallastOffset" withNamespaceName:@"COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS"];
    v6 = rbs_process_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 longValue];
      *(_DWORD *)buf = 134217984;
      uint64_t v23 = v7;
      _os_log_impl(&dword_226AB3000, v6, OS_LOG_TYPE_DEFAULT, "Setting ballast offset to %lld", buf, 0xCu);
    }

    if (-[RBXNUWrapper _setBallastOffset:](v2, "_setBallastOffset:", [v5 longValue]) < 0)
    {
      uint32_t v8 = rbs_process_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[RBXNUWrapper init]();
      }
    }
    objc_initWeak((id *)buf, v2);
    v9 = v2->_trialClient;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __20__RBXNUWrapper_init__block_invoke;
    v19[3] = &unk_2647C8DD8;
    objc_copyWeak(&v20, (id *)buf);
    id v10 = (id)[(TRIClient *)v9 addUpdateHandlerForNamespaceName:@"COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS" usingBlock:v19];
    if ([v5 longValue]) {
      [(RBXNUWrapper *)v2 setBallastDrained:1];
    }
    if (MEMORY[0x263F4B110]) {
      BOOL v11 = MEMORY[0x263F0EC20] == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      int v12 = rbs_general_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        int v13 = "IOGPU not present";
LABEL_21:
        _os_log_impl(&dword_226AB3000, v12, OS_LOG_TYPE_DEFAULT, v13, v18, 2u);
      }
    }
    else
    {
      CFDictionaryRef v14 = IOServiceMatching("IOGPU");
      if (!IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v14))
      {
        int v12 = rbs_general_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[RBXNUWrapper init]();
        }
        goto LABEL_26;
      }
      uint64_t v15 = IOGPUDeviceCreate();
      v2->_gpuDevice = (__IOGPUDevice *)v15;
      if (!v15)
      {
        int v12 = rbs_general_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          -[RBXNUWrapper init]();
        }
        goto LABEL_26;
      }
      int v12 = rbs_general_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        int v13 = "_gpuDevice initialized";
        goto LABEL_21;
      }
    }
LABEL_26:

    __int16 v16 = v2;
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

void __20__RBXNUWrapper_init__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[3] refresh];
  v2 = [WeakRetained[3] levelForFactor:@"BallastOffset" withNamespaceName:@"COREOS_GMPOWER_VM_TUNING_PAGE_SHORTAGE_THRESHOLDS"];
  uint64_t v3 = rbs_process_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = [v2 longValue];
    _os_log_impl(&dword_226AB3000, v3, OS_LOG_TYPE_DEFAULT, "Trial Update Received: Setting ballast offset to %lld", (uint8_t *)&v5, 0xCu);
  }

  if (objc_msgSend(WeakRetained, "_setBallastOffset:", objc_msgSend(v2, "longValue")) < 0)
  {
    v4 = rbs_process_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[RBXNUWrapper init]();
    }
  }
}

- (int64_t)setBallastDrained:(BOOL)a3
{
  BOOL v4 = a3;
  return sysctlbyname("kern.memorystatus.ballast_drained", 0, 0, &v4, 4uLL);
}

- (unint64_t)ballastOffsetMB
{
  return self->_ballastOffsetMB;
}

- (int64_t)_setBallastOffset:(unint64_t)a3
{
  self->_ballastOffsetMB = a3;
  int v4 = a3;
  return sysctlbyname("kern.memorystatus.ballast_offset_mb", 0, 0, &v4, 4uLL);
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "Error setting ballast offset", v2, v3, v4, v5, v6);
}

- (void)setGPURole:forPid:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_226AB3000, v0, v1, "setGPURole:pid: failed due to nil IOGPU device ref", v2, v3, v4, v5, v6);
}

- (void)setGPURole:(os_log_t)log forPid:.cold.2(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_226AB3000, log, OS_LOG_TYPE_ERROR, "%d setGPURole failed with result = %x", (uint8_t *)v3, 0xEu);
}

@end