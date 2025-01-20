@interface PLABMClient
+ (id)sharedABMClient;
- (PLABMClient)init;
- (PLABMClientMessageDelegate)delegate;
- (id).cxx_construct;
- (id)getBasebandBootState;
- (id)getBasebandTimeAndLatency;
- (id)getLTESleepManagerStats;
- (void)addDeviceConfigWith:(id)a3 andConfigExtension:(id)a4;
- (void)addICEDeviceConfig;
- (void)addICEDeviceConfigDebug;
- (void)addMavDeviceConfig;
- (void)addMavDeviceConfigDebug;
- (void)regBBWakeListener;
- (void)regBootStateListener;
- (void)regMetricListener;
- (void)regTriggerListener;
- (void)removeDeviceConfig;
- (void)sendBootStateChangInfoToLoggerUsing:(id)a3;
- (void)sendMetricToLoggerUsing:(id)a3;
- (void)sendTriggerToLoggerUsing:(id)a3;
- (void)sendWakeInfoToLoggerUsing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startListening;
- (void)triggerPeriodicMetrics:(int)a3;
@end

@implementation PLABMClient

void __32__PLABMClient_regMetricListener__block_invoke(uint64_t a1)
{
  v2 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __32__PLABMClient_regMetricListener__block_invoke_cold_1();
  }
  uint64_t v3 = objc_opt_class();
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  v6 = __32__PLABMClient_regMetricListener__block_invoke_67;
  v7 = &__block_descriptor_40_e5_v8__0lu32l8;
  uint64_t v8 = v3;
  if (_ZZZ32__PLABMClient_regMetricListener_EUb1_E11defaultOnce != -1) {
    dispatch_once(&_ZZZ32__PLABMClient_regMetricListener_EUb1_E11defaultOnce, &block);
  }
  if (_ZZZ32__PLABMClient_regMetricListener_EUb1_E17classDebugEnabled) {
    NSLog(&cfstr_ReceivedEventM.isa, v2, block, v5, v6, v7, v8);
  }
  [*(id *)(a1 + 32) sendMetricToLoggerUsing:v2];
}

- (void)sendMetricToLoggerUsing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[PLABMClient sendMetricToLoggerUsing:]();
  }
  v6 = [v4 objectForKeyedSubscript:@"kKeyMetricID"];
  [v5 setObject:v6 forKeyedSubscript:@"metricId"];

  v7 = [v4 objectForKeyedSubscript:@"kKeyPayload"];
  [v5 setObject:v7 forKeyedSubscript:@"metricPayload"];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"kKeyTriggerRef"];
  [v5 setObject:v8 forKeyedSubscript:@"metricTriggerRef"];

  v9 = [v4 objectForKeyedSubscript:@"kKeyProfileID"];
  [v5 setObject:v9 forKeyedSubscript:@"metricProfileId"];

  v10 = [v4 objectForKeyedSubscript:@"kKeyAppID"];
  [v5 setObject:v10 forKeyedSubscript:@"appId"];

  v11 = [(PLABMClient *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(PLABMClient *)self delegate];
    [v13 metricMessage:v5];
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLABMClient_sendMetricToLoggerUsing___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (-[PLABMClient sendMetricToLoggerUsing:]::defaultOnce != -1) {
      dispatch_once(&-[PLABMClient sendMetricToLoggerUsing:]::defaultOnce, block);
    }
    if (-[PLABMClient sendMetricToLoggerUsing:]::classDebugEnabled) {
      NSLog(&cfstr_UnableToMetric.isa);
    }
    +[PLDefaults debugEnabled];
  }
}

- (PLABMClientMessageDelegate)delegate
{
  return (PLABMClientMessageDelegate *)objc_getProperty(self, a2, 32, 1);
}

+ (id)sharedABMClient
{
  if (+[PLABMClient sharedABMClient]::once != -1) {
    dispatch_once(&+[PLABMClient sharedABMClient]::once, &__block_literal_global_29);
  }
  v2 = (void *)+[PLABMClient sharedABMClient]::_sharedABMClient;
  return v2;
}

void __30__PLABMClient_sharedABMClient__block_invoke()
{
  if (!+[PLABMClient sharedABMClient]::_sharedABMClient)
  {
    +[PLABMClient sharedABMClient]::_sharedABMClient = objc_opt_new();
    MEMORY[0x1F41817F8]();
  }
}

- (PLABMClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLABMClient;
  id v2 = [(PLABMClient *)&v11 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(17, 0);
    *((void *)v2 + 1) = dispatch_queue_create_with_target_V2("com.apple.powerlog.abm", v3, global_queue);
    std::string::basic_string[abi:ne180100]<0>(&__p, "Powerlog");
    abm::client::CreateManager();
    long long v5 = v10;
    long long v10 = 0uLL;
    v6 = (std::__shared_weak_count *)*((void *)v2 + 3);
    *((_OWORD *)v2 + 1) = v5;
    if (v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      if (*((void *)&v10 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v10 + 1));
      }
    }
    if (v9 < 0) {
      operator delete(__p);
    }
  }
  return (PLABMClient *)v2;
}

- (void)addDeviceConfigWith:(id)a3 andConfigExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v9 = [v8 pathForResource:v6 ofType:v7];

  uint64_t v10 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PLABMClient_addDeviceConfigWith_andConfigExtension___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v10;
  if (-[PLABMClient addDeviceConfigWith:andConfigExtension:]::defaultOnce != -1) {
    dispatch_once(&-[PLABMClient addDeviceConfigWith:andConfigExtension:]::defaultOnce, block);
  }
  if (-[PLABMClient addDeviceConfigWith:andConfigExtension:]::classDebugEnabled)
  {
    objc_super v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    NSLog(&cfstr_BundleForThisP.isa, v11);
  }
  BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v12) {
      -[PLABMClient addDeviceConfigWith:andConfigExtension:].cold.4();
    }
    id v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v9];
    xpc_object_t v21 = xpc_data_create((const void *)[v20 bytes], objc_msgSend(v20, "length"));
    if (!v21) {
      xpc_object_t v21 = xpc_null_create();
    }
    if (![v20 length] || MEMORY[0x1C1869B20](v21) == MEMORY[0x1E4F145D8])
    {
      v25 = 0;
      char v26 = 0;
LABEL_46:
      xpc_release(v21);

      if (v26 < 0) {
        operator delete(v25);
      }
      goto LABEL_48;
    }
    xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v23 = v22;
    uint64_t v24 = MEMORY[0x1E4F14590];
    if (v22)
    {
      xpc_object_t v55 = v22;
    }
    else
    {
      xpc_object_t v23 = xpc_null_create();
      xpc_object_t v55 = v23;
      if (!v23)
      {
        xpc_object_t v27 = xpc_null_create();
        xpc_object_t v23 = 0;
        goto LABEL_23;
      }
    }
    if (MEMORY[0x1C1869B20](v23) == v24)
    {
      xpc_retain(v23);
LABEL_24:
      xpc_release(v23);
      if (MEMORY[0x1C1869B20](v55) == v24)
      {
        xpc_object_t v53 = xpc_int64_create(1);
        if (!v53) {
          xpc_object_t v53 = xpc_null_create();
        }
        v28 = (void *)*MEMORY[0x1E4F4D300];
        v45 = &v55;
        v46 = v28;
        xpc::dict::object_proxy::operator=((uint64_t)&v45, &v53, &object);
        xpc_release(object);
        xpc_object_t object = 0;
        xpc_release(v53);
        xpc_object_t v53 = 0;
        xpc_object_t v51 = v21;
        if (v21) {
          xpc_retain(v21);
        }
        else {
          xpc_object_t v51 = xpc_null_create();
        }
        v29 = (void *)*MEMORY[0x1E4F4C0F0];
        v45 = &v55;
        v46 = v29;
        xpc::dict::object_proxy::operator=((uint64_t)&v45, &v51, &v52);
        xpc_release(v52);
        xpc_object_t v52 = 0;
        xpc_release(v51);
        xpc_object_t v51 = 0;
        xpc_object_t v49 = xpc_int64_create(0);
        if (!v49) {
          xpc_object_t v49 = xpc_null_create();
        }
        v30 = (void *)*MEMORY[0x1E4F4C248];
        v45 = &v55;
        v46 = v30;
        xpc::dict::object_proxy::operator=((uint64_t)&v45, &v49, &v50);
        xpc_release(v50);
        xpc_object_t v50 = 0;
        xpc_release(v49);
        xpc_object_t v48 = 0;
        xpc_object_t v49 = 0;
        xpc_object_t v48 = xpc_null_create();
        cntrl = self->abmPLClnt.__cntrl_;
        ptr = self->abmPLClnt.__ptr_;
        v44 = cntrl;
        if (cntrl) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
        }
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E4F4C9C0]);
        abm::client::PerformCommand();
        int v32 = (int)v45;
        v25 = v46;
        char v26 = v47;
        char v47 = 0;
        LOBYTE(v46) = 0;
        if (v42 < 0) {
          operator delete(__p);
        }
        if (v44) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v44);
        }
        BOOL v33 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
        if (v32)
        {
          if (v33) {
            -[PLABMClient addDeviceConfigWith:andConfigExtension:](v33, v34, v35, v36, v37, v38, v39, v40);
          }
          +[PLDefaults debugEnabled];
        }
        else if (v33)
        {
          -[PLABMClient addDeviceConfigWith:andConfigExtension:](v33, v34, v35, v36, v37, v38, v39, v40);
        }
      }
      else
      {
        v25 = 0;
        char v26 = 0;
      }
      xpc_release(v55);
      goto LABEL_46;
    }
    xpc_object_t v27 = xpc_null_create();
LABEL_23:
    xpc_object_t v55 = v27;
    goto LABEL_24;
  }
  if (v12) {
    -[PLABMClient addDeviceConfigWith:andConfigExtension:](v12, v13, v14, v15, v16, v17, v18, v19);
  }
  +[PLDefaults debugEnabled];
LABEL_48:
}

BOOL __54__PLABMClient_addDeviceConfigWith_andConfigExtension___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient addDeviceConfigWith:andConfigExtension:]::classDebugEnabled = result;
  return result;
}

- (void)regBootStateListener
{
  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  id v6 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E4F4CEF8]);
  abm::client::RegisterEventHandler();
  if (v4 < 0) {
    operator delete(__p);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
}

void __35__PLABMClient_regBootStateListener__block_invoke(uint64_t a1)
{
  id v2 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __35__PLABMClient_regBootStateListener__block_invoke_cold_1();
  }
  uint64_t v3 = objc_opt_class();
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __35__PLABMClient_regBootStateListener__block_invoke_59;
  id v7 = &__block_descriptor_40_e5_v8__0lu32l8;
  uint64_t v8 = v3;
  if (_ZZZ35__PLABMClient_regBootStateListener_EUb_E11defaultOnce != -1) {
    dispatch_once(&_ZZZ35__PLABMClient_regBootStateListener_EUb_E11defaultOnce, &block);
  }
  if (_ZZZ35__PLABMClient_regBootStateListener_EUb_E17classDebugEnabled) {
    NSLog(&cfstr_ReceivedBootSt.isa, v2, block, v5, v6, v7, v8);
  }
  [*(id *)(a1 + 32) sendBootStateChangInfoToLoggerUsing:v2];
}

BOOL __35__PLABMClient_regBootStateListener__block_invoke_59(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  _ZZZ35__PLABMClient_regBootStateListener_EUb_E17classDebugEnabled = result;
  return result;
}

- (void)regTriggerListener
{
  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  id v6 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E4F4C148]);
  abm::client::RegisterEventHandler();
  if (v4 < 0) {
    operator delete(__p);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
}

void __33__PLABMClient_regTriggerListener__block_invoke(uint64_t a1)
{
  id v2 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  uint64_t v3 = objc_opt_class();
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __33__PLABMClient_regTriggerListener__block_invoke_2;
  id v7 = &__block_descriptor_40_e5_v8__0lu32l8;
  uint64_t v8 = v3;
  if (_ZZZ33__PLABMClient_regTriggerListener_EUb0_E11defaultOnce != -1) {
    dispatch_once(&_ZZZ33__PLABMClient_regTriggerListener_EUb0_E11defaultOnce, &block);
  }
  if (_ZZZ33__PLABMClient_regTriggerListener_EUb0_E17classDebugEnabled) {
    NSLog(&cfstr_ReceivedEventT.isa, v2, block, v5, v6, v7, v8);
  }
  [*(id *)(a1 + 32) sendTriggerToLoggerUsing:v2];
}

BOOL __33__PLABMClient_regTriggerListener__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  _ZZZ33__PLABMClient_regTriggerListener_EUb0_E17classDebugEnabled = result;
  return result;
}

- (void)regMetricListener
{
  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  id v6 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E4F4C128]);
  abm::client::RegisterEventHandler();
  if (v4 < 0) {
    operator delete(__p);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
}

BOOL __32__PLABMClient_regMetricListener__block_invoke_67(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  _ZZZ32__PLABMClient_regMetricListener_EUb1_E17classDebugEnabled = result;
  return result;
}

- (void)regBBWakeListener
{
  cntrl = self->abmPLClnt.__cntrl_;
  ptr = self->abmPLClnt.__ptr_;
  id v6 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E4F4CA10]);
  abm::client::RegisterEventHandler();
  if (v4 < 0) {
    operator delete(__p);
  }
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
}

void __32__PLABMClient_regBBWakeListener__block_invoke(uint64_t a1)
{
  id v2 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __32__PLABMClient_regBBWakeListener__block_invoke_cold_1();
  }
  uint64_t v3 = objc_opt_class();
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __32__PLABMClient_regBBWakeListener__block_invoke_71;
  id v7 = &__block_descriptor_40_e5_v8__0lu32l8;
  uint64_t v8 = v3;
  if (_ZZZ32__PLABMClient_regBBWakeListener_EUb2_E11defaultOnce != -1) {
    dispatch_once(&_ZZZ32__PLABMClient_regBBWakeListener_EUb2_E11defaultOnce, &block);
  }
  if (_ZZZ32__PLABMClient_regBBWakeListener_EUb2_E17classDebugEnabled) {
    NSLog(&cfstr_ReceivedBbWake.isa, v2, block, v5, v6, v7, v8);
  }
  [*(id *)(a1 + 32) sendWakeInfoToLoggerUsing:v2];
}

BOOL __32__PLABMClient_regBBWakeListener__block_invoke_71(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  _ZZZ32__PLABMClient_regBBWakeListener_EUb2_E17classDebugEnabled = result;
  return result;
}

- (void)startListening
{
}

BOOL __29__PLABMClient_startListening__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient startListening]::classDebugEnabled = result;
  return result;
}

- (void)removeDeviceConfig
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v4 = v3;
  uint64_t v5 = MEMORY[0x1E4F14590];
  if (v3)
  {
    xpc_object_t v26 = v3;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v26 = v4;
    if (!v4)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v4 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C1869B20](v4) == v5)
  {
    xpc_retain(v4);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  xpc_object_t v26 = v6;
LABEL_9:
  xpc_release(v4);
  if (MEMORY[0x1C1869B20](v26) == v5)
  {
    xpc_object_t v24 = xpc_int64_create(1);
    if (!v24) {
      xpc_object_t v24 = xpc_null_create();
    }
    char v9 = (void *)*MEMORY[0x1E4F4D300];
    id v20 = &v26;
    xpc_object_t v21 = v9;
    xpc::dict::object_proxy::operator=((uint64_t)&v20, &v24, &v25);
    xpc_release(v25);
    xpc_object_t v25 = 0;
    xpc_release(v24);
    xpc_object_t v23 = 0;
    xpc_object_t v24 = 0;
    xpc_object_t v23 = xpc_null_create();
    cntrl = self->abmPLClnt.__cntrl_;
    ptr = self->abmPLClnt.__ptr_;
    uint64_t v19 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E4F4CC08]);
    abm::client::PerformCommand();
    int v11 = (int)v20;
    id v7 = v21;
    char v8 = v22;
    char v22 = 0;
    LOBYTE(v21) = 0;
    if (v17 < 0) {
      operator delete(__p);
    }
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v19);
    }
    if (v11)
    {
      uint64_t v12 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PLABMClient_removeDeviceConfig__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v12;
      if (-[PLABMClient removeDeviceConfig]::defaultOnce != -1) {
        dispatch_once(&-[PLABMClient removeDeviceConfig]::defaultOnce, block);
      }
      if (-[PLABMClient removeDeviceConfig]::classDebugEnabled) {
        NSLog(&cfstr_FailedToRemove.isa);
      }
    }
    else
    {
      uint64_t v13 = objc_opt_class();
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __33__PLABMClient_removeDeviceConfig__block_invoke;
      v15[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v15[4] = v13;
      if (-[PLABMClient removeDeviceConfig]::defaultOnce != -1) {
        dispatch_once(&-[PLABMClient removeDeviceConfig]::defaultOnce, v15);
      }
      if (-[PLABMClient removeDeviceConfig]::classDebugEnabled) {
        NSLog(&cfstr_SuccessfullyRe.isa);
      }
    }
  }
  else
  {
    id v7 = 0;
    char v8 = 0;
  }
  xpc_release(v26);
  if (v8 < 0) {
    operator delete(v7);
  }
}

BOOL __33__PLABMClient_removeDeviceConfig__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient removeDeviceConfig]::classDebugEnabled = result;
  return result;
}

BOOL __33__PLABMClient_removeDeviceConfig__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient removeDeviceConfig]::classDebugEnabled = result;
  return result;
}

- (void)triggerPeriodicMetrics:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v6 = v5;
  uint64_t v7 = MEMORY[0x1E4F14590];
  if (v5)
  {
    xpc_object_t v64 = v5;
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v64 = v6;
    if (!v6)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v6 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C1869B20](v6) == v7)
  {
    xpc_retain(v6);
    goto LABEL_9;
  }
  xpc_object_t v8 = xpc_null_create();
LABEL_8:
  xpc_object_t v64 = v8;
LABEL_9:
  xpc_release(v6);
  if (MEMORY[0x1C1869B20](v64) == v7)
  {
    xpc_object_t v62 = xpc_int64_create(1);
    if (!v62) {
      xpc_object_t v62 = xpc_null_create();
    }
    int v11 = (void *)*MEMORY[0x1E4F4D300];
    xpc_object_t v48 = &v64;
    xpc_object_t v49 = v11;
    xpc::dict::object_proxy::operator=((uint64_t)&v48, &v62, &v63);
    xpc_release(v63);
    xpc_object_t v63 = 0;
    xpc_release(v62);
    xpc_object_t v62 = 0;
    xpc_object_t v60 = xpc_int64_create(0);
    if (!v60) {
      xpc_object_t v60 = xpc_null_create();
    }
    uint64_t v12 = (void *)*MEMORY[0x1E4F4C1F0];
    xpc_object_t v48 = &v64;
    xpc_object_t v49 = v12;
    xpc::dict::object_proxy::operator=((uint64_t)&v48, &v60, &v61);
    xpc_release(v61);
    xpc_object_t v61 = 0;
    xpc_release(v60);
    xpc_object_t v60 = 0;
    xpc_object_t v58 = xpc_int64_create(0);
    if (!v58) {
      xpc_object_t v58 = xpc_null_create();
    }
    uint64_t v13 = (void *)*MEMORY[0x1E4F4C278];
    xpc_object_t v48 = &v64;
    xpc_object_t v49 = v13;
    xpc::dict::object_proxy::operator=((uint64_t)&v48, &v58, &v59);
    xpc_release(v59);
    xpc_object_t v59 = 0;
    xpc_release(v58);
    xpc_object_t v58 = 0;
    xpc_object_t v56 = xpc_int64_create((int)v3);
    if (!v56) {
      xpc_object_t v56 = xpc_null_create();
    }
    uint64_t v14 = (void *)*MEMORY[0x1E4F4C1A8];
    xpc_object_t v48 = &v64;
    xpc_object_t v49 = v14;
    xpc::dict::object_proxy::operator=((uint64_t)&v48, &v56, &v57);
    xpc_release(v57);
    xpc_object_t v57 = 0;
    xpc_release(v56);
    xpc_object_t v56 = 0;
    xpc_object_t v54 = xpc_int64_create(0);
    if (!v54) {
      xpc_object_t v54 = xpc_null_create();
    }
    uint64_t v15 = (void *)*MEMORY[0x1E4F4C178];
    xpc_object_t v48 = &v64;
    xpc_object_t v49 = v15;
    xpc::dict::object_proxy::operator=((uint64_t)&v48, &v54, &v55);
    xpc_release(v55);
    xpc_object_t v55 = 0;
    xpc_release(v54);
    xpc_object_t v54 = 0;
    xpc_object_t v52 = xpc_int64_create(0);
    if (!v52) {
      xpc_object_t v52 = xpc_null_create();
    }
    uint64_t v16 = (void *)*MEMORY[0x1E4F4C130];
    xpc_object_t v48 = &v64;
    xpc_object_t v49 = v16;
    xpc::dict::object_proxy::operator=((uint64_t)&v48, &v52, &v53);
    xpc_release(v53);
    xpc_object_t v53 = 0;
    xpc_release(v52);
    xpc_object_t v52 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[PLABMClient triggerPeriodicMetrics:](v3, v17, v18, v19, v20, v21, v22, v23);
    }
    xpc_object_t v51 = 0;
    xpc_object_t v51 = xpc_null_create();
    cntrl = self->abmPLClnt.__cntrl_;
    ptr = self->abmPLClnt.__ptr_;
    char v47 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)*MEMORY[0x1E4F4C468]);
    abm::client::PerformCommand();
    int v25 = (int)v48;
    char v9 = v49;
    char v10 = v50;
    char v50 = 0;
    LOBYTE(v49) = 0;
    if (v45 < 0) {
      operator delete(__p);
    }
    if (v47) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v47);
    }
    if (v25)
    {
      uint64_t v26 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__PLABMClient_triggerPeriodicMetrics___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v26;
      if (-[PLABMClient triggerPeriodicMetrics:]::defaultOnce != -1) {
        dispatch_once(&-[PLABMClient triggerPeriodicMetrics:]::defaultOnce, block);
      }
      if (-[PLABMClient triggerPeriodicMetrics:]::classDebugEnabled) {
        NSLog(&cfstr_FailedQueryCom.isa);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[PLABMClient triggerPeriodicMetrics:](v3, v27, v28, v29, v30, v31, v32, v33);
      }
      +[PLDefaults debugEnabled];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[PLABMClient triggerPeriodicMetrics:](v3, v34, v35, v36, v37, v38, v39, v40);
      }
      uint64_t v41 = objc_opt_class();
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __38__PLABMClient_triggerPeriodicMetrics___block_invoke;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v41;
      if (-[PLABMClient triggerPeriodicMetrics:]::defaultOnce != -1) {
        dispatch_once(&-[PLABMClient triggerPeriodicMetrics:]::defaultOnce, v43);
      }
      if (-[PLABMClient triggerPeriodicMetrics:]::classDebugEnabled) {
        NSLog(&cfstr_SuccessfullyEx.isa);
      }
    }
  }
  else
  {
    char v9 = 0;
    char v10 = 0;
  }
  xpc_release(v64);
  if (v10 < 0) {
    operator delete(v9);
  }
}

BOOL __38__PLABMClient_triggerPeriodicMetrics___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient triggerPeriodicMetrics:]::classDebugEnabled = result;
  return result;
}

BOOL __38__PLABMClient_triggerPeriodicMetrics___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient triggerPeriodicMetrics:]::classDebugEnabled = result;
  return result;
}

- (void)sendTriggerToLoggerUsing:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = objc_opt_new();
  xpc_object_t v6 = [v4 objectForKeyedSubscript:@"kKeyTriggerID"];
  [v5 setObject:v6 forKeyedSubscript:@"triggerId"];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"kKeyTriggerRef"];
  [v5 setObject:v7 forKeyedSubscript:@"triggerRef"];

  xpc_object_t v8 = [v4 objectForKeyedSubscript:@"kKeyTriggerType"];
  [v5 setObject:v8 forKeyedSubscript:@"triggerType"];

  char v9 = [v4 objectForKeyedSubscript:@"kKeyTriggerTime"];
  [v5 setObject:v9 forKeyedSubscript:@"triggerTime"];

  char v10 = [v4 objectForKeyedSubscript:@"kKeyAppID"];
  [v5 setObject:v10 forKeyedSubscript:@"appId"];

  int v11 = [(PLABMClient *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(PLABMClient *)self delegate];
    [v13 triggerMessage:v5];
  }
  else
  {
    uint64_t v14 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLABMClient_sendTriggerToLoggerUsing___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (-[PLABMClient sendTriggerToLoggerUsing:]::defaultOnce != -1) {
      dispatch_once(&-[PLABMClient sendTriggerToLoggerUsing:]::defaultOnce, block);
    }
    if (-[PLABMClient sendTriggerToLoggerUsing:]::classDebugEnabled) {
      NSLog(&cfstr_UnableToSendTr.isa);
    }
    +[PLDefaults debugEnabled];
  }
}

BOOL __40__PLABMClient_sendTriggerToLoggerUsing___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient sendTriggerToLoggerUsing:]::classDebugEnabled = result;
  return result;
}

BOOL __39__PLABMClient_sendMetricToLoggerUsing___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient sendMetricToLoggerUsing:]::classDebugEnabled = result;
  return result;
}

- (void)sendWakeInfoToLoggerUsing:(id)a3
{
  id v4 = (void *)[a3 copy];
  if (v4
    && ([(PLABMClient *)self delegate],
        xpc_object_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    uint64_t v7 = [(PLABMClient *)self delegate];
    [v7 wakeMessage:v4];
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLABMClient_sendWakeInfoToLoggerUsing___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (-[PLABMClient sendWakeInfoToLoggerUsing:]::defaultOnce != -1) {
      dispatch_once(&-[PLABMClient sendWakeInfoToLoggerUsing:]::defaultOnce, block);
    }
    if (-[PLABMClient sendWakeInfoToLoggerUsing:]::classDebugEnabled) {
      NSLog(&cfstr_UnableToSendWa.isa);
    }
    +[PLDefaults debugEnabled];
  }
}

BOOL __41__PLABMClient_sendWakeInfoToLoggerUsing___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient sendWakeInfoToLoggerUsing:]::classDebugEnabled = result;
  return result;
}

- (void)sendBootStateChangInfoToLoggerUsing:(id)a3
{
  id v4 = (void *)[a3 copy];
  if (v4
    && ([(PLABMClient *)self delegate],
        xpc_object_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    uint64_t v7 = [(PLABMClient *)self delegate];
    [v7 bootStateChange:v4];
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLABMClient_sendBootStateChangInfoToLoggerUsing___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (-[PLABMClient sendBootStateChangInfoToLoggerUsing:]::defaultOnce != -1) {
      dispatch_once(&-[PLABMClient sendBootStateChangInfoToLoggerUsing:]::defaultOnce, block);
    }
    if (-[PLABMClient sendBootStateChangInfoToLoggerUsing:]::classDebugEnabled) {
      NSLog(&cfstr_UnableToSendBo.isa);
    }
    +[PLDefaults debugEnabled];
  }
}

BOOL __51__PLABMClient_sendBootStateChangInfoToLoggerUsing___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient sendBootStateChangInfoToLoggerUsing:]::classDebugEnabled = result;
  return result;
}

- (id)getLTESleepManagerStats
{
  uint64_t v3 = objc_opt_new();
  id v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4C8E0]];
  [v3 setObject:&unk_1F1580B88 forKey:v4];

  xpc_object_t v5 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4CE20]];
  [v3 setObject:&unk_1F1580B88 forKey:v5];

  char v6 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4D0A0]];
  [v3 setObject:&unk_1F1580B88 forKey:v6];

  uint64_t v7 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4D108]];
  [v3 setObject:&unk_1F1580B88 forKey:v7];

  uint64_t v8 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4C360]];
  [v3 setObject:&unk_1F1580B88 forKey:v8];

  char v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  cntrl = self->abmPLClnt.__cntrl_;
  uint64_t v14 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  id v11 = v3;
  abm::client::GetBasebandLTEStatistics();
  if (v16 < 0) {
    operator delete(__p);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  dispatch_time_t v12 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v9, v12);
  dispatch_release(v9);

  return v11;
}

void __38__PLABMClient_getLTESleepManagerStats__block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();
  id v31 = (id)v4;
  if (*a2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    char v6 = *(void **)(a1 + 32);
    uint64_t v7 = *MEMORY[0x1E4F4C8E0];
    uint64_t v8 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4C8E0]];
    char v9 = [v31 objectForKeyedSubscript:v8];
    char v10 = [NSString stringWithUTF8String:v7];
    [v6 setObject:v9 forKey:v10];

    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = *MEMORY[0x1E4F4CE20];
    uint64_t v13 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4CE20]];
    uint64_t v14 = [v31 objectForKeyedSubscript:v13];
    uint64_t v15 = [NSString stringWithUTF8String:v12];
    [v11 setObject:v14 forKey:v15];

    char v16 = *(void **)(a1 + 32);
    uint64_t v17 = *MEMORY[0x1E4F4D0A0];
    uint64_t v18 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4D0A0]];
    uint64_t v19 = [v31 objectForKeyedSubscript:v18];
    uint64_t v20 = [NSString stringWithUTF8String:v17];
    [v16 setObject:v19 forKey:v20];

    uint64_t v21 = *(void **)(a1 + 32);
    uint64_t v22 = *MEMORY[0x1E4F4D108];
    uint64_t v23 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4D108]];
    xpc_object_t v24 = [v31 objectForKeyedSubscript:v23];
    int v25 = [NSString stringWithUTF8String:v22];
    [v21 setObject:v24 forKey:v25];

    uint64_t v26 = *(void **)(a1 + 32);
    uint64_t v27 = *MEMORY[0x1E4F4C360];
    uint64_t v28 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4C360]];
    uint64_t v29 = [v31 objectForKeyedSubscript:v28];
    uint64_t v30 = [NSString stringWithUTF8String:v27];
    [v26 setObject:v29 forKey:v30];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)getBasebandTimeAndLatency
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v20 = 0;
  uint64_t v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  cntrl = self->abmPLClnt.__cntrl_;
  uint64_t v13 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  abm::client::GetBasebandTime();
  if (v15 < 0) {
    operator delete(__p);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v4, v6))
  {
    dispatch_release(v4);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v21[3]];
    char v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v17[3]];
    [v9 timeIntervalSinceDate:v3];
    double v11 = v10;
    dispatch_release(v4);
    uint64_t v7 = [[TimeAndLatencyAbm alloc] initWithTime:v8 andLatency:v11];
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v7;
}

void __40__PLABMClient_getBasebandTimeAndLatency__block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = _CFXPCCreateCFObjectFromXPCObject();
  id v13 = (id)v4;
  if (*a2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5)
  {
    dispatch_time_t v6 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4C908]];
    uint64_t v7 = [v13 objectForKeyedSubscript:v6];

    uint64_t v8 = [NSString stringWithUTF8String:*MEMORY[0x1E4F4CE28]];
    char v9 = [v13 objectForKeyedSubscript:v8];

    unint64_t v10 = [v7 unsignedIntegerValue];
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (double)(unint64_t)[v9 unsignedIntegerValue]/ 1000000.0+ (double)v10;
    double v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSince1970];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)getBasebandBootState
{
  v28[0] = 0;
  v28[1] = 0;
  uint64_t v29 = 0;
  cntrl = self->abmPLClnt.__cntrl_;
  void block[5] = self->abmPLClnt.__ptr_;
  xpc_object_t v24 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  abm::client::GetBasebandBootState();
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v24);
  }
  uint64_t v3 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PLABMClient_getBasebandBootState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v3;
  if (-[PLABMClient getBasebandBootState]::defaultOnce != -1) {
    dispatch_once(&-[PLABMClient getBasebandBootState]::defaultOnce, block);
  }
  if (-[PLABMClient getBasebandBootState]::classDebugEnabled)
  {
    uint64_t v4 = NSString;
    TelephonyXPC::Result::describe((uint64_t *)__p, (TelephonyXPC::Result *)&v25);
    int v5 = v22;
    dispatch_time_t v6 = (void **)__p[0];
    uint64_t v7 = [NSString defaultCStringEncoding];
    if (v5 >= 0) {
      uint64_t v8 = __p;
    }
    else {
      uint64_t v8 = v6;
    }
    char v9 = [v4 stringWithCString:v8 encoding:v7];
    if (v22 < 0) {
      operator delete(__p[0]);
    }
    NSLog(&cfstr_BbBootStateRes.isa, v9);
  }
  if (v25)
  {
    uint64_t v10 = objc_opt_class();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __35__PLABMClient_getBasebandBootState__block_invoke_3;
    v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v19[4] = v10;
    if (-[PLABMClient getBasebandBootState]::defaultOnce != -1) {
      dispatch_once(&-[PLABMClient getBasebandBootState]::defaultOnce, v19);
    }
    if (-[PLABMClient getBasebandBootState]::classDebugEnabled) {
      NSLog(&cfstr_FailedQueryBas.isa);
    }
    double v11 = @"ABM Client: Server is not running.";
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __35__PLABMClient_getBasebandBootState__block_invoke_2;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v12;
    if (-[PLABMClient getBasebandBootState]::defaultOnce != -1) {
      dispatch_once(&-[PLABMClient getBasebandBootState]::defaultOnce, v20);
    }
    if (-[PLABMClient getBasebandBootState]::classDebugEnabled) {
      NSLog(&cfstr_SuccessfullyQu.isa);
    }
    id v13 = NSString;
    int v14 = SHIBYTE(v29);
    char v15 = (void **)v28[0];
    uint64_t v16 = [NSString defaultCStringEncoding];
    if (v14 >= 0) {
      uint64_t v17 = v28;
    }
    else {
      uint64_t v17 = v15;
    }
    double v11 = [v13 stringWithCString:v17 encoding:v16];
  }
  if (v27 < 0) {
    operator delete(v26);
  }
  if (SHIBYTE(v29) < 0) {
    operator delete(v28[0]);
  }
  return v11;
}

BOOL __35__PLABMClient_getBasebandBootState__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient getBasebandBootState]::classDebugEnabled = result;
  return result;
}

BOOL __35__PLABMClient_getBasebandBootState__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient getBasebandBootState]::classDebugEnabled = result;
  return result;
}

BOOL __35__PLABMClient_getBasebandBootState__block_invoke_3(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  -[PLABMClient getBasebandBootState]::classDebugEnabled = result;
  return result;
}

- (void)addICEDeviceConfig
{
}

- (void)addICEDeviceConfigDebug
{
}

- (void)addMavDeviceConfig
{
  if (+[PLDefaults fullMode]) {
    uint64_t v3 = @"Cellular_Power_Log_full_300s";
  }
  else {
    uint64_t v3 = @"Cellular_Power_Log_lite_300s";
  }
  [(PLABMClient *)self addDeviceConfigWith:v3 andConfigExtension:@"config"];
}

- (void)addMavDeviceConfigDebug
{
  if (+[PLDefaults fullMode]) {
    uint64_t v3 = @"Cellular_Power_Log_full_30s";
  }
  else {
    uint64_t v3 = @"Cellular_Power_Log_lite_30s";
  }
  [(PLABMClient *)self addDeviceConfigWith:v3 andConfigExtension:@"config"];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  cntrl = self->abmPLClnt.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void)addDeviceConfigWith:(uint64_t)a3 andConfigExtension:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addDeviceConfigWith:(uint64_t)a3 andConfigExtension:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addDeviceConfigWith:(uint64_t)a3 andConfigExtension:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addDeviceConfigWith:andConfigExtension:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, MEMORY[0x1E4F14500], v0, "Found device config file at: %@", v1, v2, v3, v4, v5);
}

void __35__PLABMClient_regBootStateListener__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, MEMORY[0x1E4F14500], v0, "Received boot state change: \n %@", v1, v2, v3, v4, v5);
}

void __32__PLABMClient_regMetricListener__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, MEMORY[0x1E4F14500], v0, "BBAgent: Received event metric: \n %@", v1, v2, v3, v4, v5);
}

void __32__PLABMClient_regBBWakeListener__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, MEMORY[0x1E4F14500], v0, "BBAgent: Received BB Wake info: \n %@", v1, v2, v3, v4, v5);
}

- (void)triggerPeriodicMetrics:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)triggerPeriodicMetrics:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)triggerPeriodicMetrics:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendMetricToLoggerUsing:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, MEMORY[0x1E4F14500], v0, "BB Agent: sendMetricToLoggerUsing %@", v1, v2, v3, v4, v5);
}

@end