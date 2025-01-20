@interface PLIOHIDOperatorComposition
- (NSArray)serviceClients;
- (NSString)serviceName;
- (PLIOHIDOperatorComposition)initWithOperator:(id)a3 forService:(id)a4;
- (PLIOHIDOperatorComposition)initWithOperator:(id)a3 forService:(id)a4 withBlock:(id)a5;
- (PLOperator)operator;
- (__IOHIDEventSystemClient)eventSystemClient;
- (double)doubleForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)operatorBlock;
- (void)dealloc;
- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3;
- (void)setOperator:(id)a3;
- (void)setOperatorBlock:(id)a3;
- (void)setServiceClients:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation PLIOHIDOperatorComposition

- (PLIOHIDOperatorComposition)initWithOperator:(id)a3 forService:(id)a4
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v53.receiver = self;
  v53.super_class = (Class)PLIOHIDOperatorComposition;
  v9 = [(PLIOHIDOperatorComposition *)&v53 init];
  if (!v9)
  {
LABEL_13:
    v31 = v9;
    goto LABEL_22;
  }
  if (initWithOperator_forService__onceToken != -1) {
    dispatch_once(&initWithOperator_forService__onceToken, &__block_literal_global_1);
  }
  objc_storeStrong((id *)&v9->_operator, a3);
  objc_storeStrong((id *)&v9->_serviceName, a4);
  v9->_eventSystemClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  v55[0] = &unk_1F15805B8;
  v54[0] = @"PrimaryUsagePage";
  v54[1] = @"PrimaryUsage";
  v10 = [(id)serviceIDs objectForKeyedSubscript:v8];
  v55[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];

  IOHIDEventSystemClientSetMatching();
  CFArrayRef v12 = IOHIDEventSystemClientCopyServices(v9->_eventSystemClient);
  serviceClients = v9->_serviceClients;
  v9->_serviceClients = (NSArray *)v12;

  uint64_t v14 = [(NSArray *)v9->_serviceClients count];
  BOOL v15 = +[PLDefaults debugEnabled];
  if (v14)
  {
    if (v15)
    {
      uint64_t v16 = objc_opt_class();
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v48 = 3221225472;
      v49 = __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke_36;
      v50 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v51 = v16;
      if (initWithOperator_forService__defaultOnce_34 != -1) {
        dispatch_once(&initWithOperator_forService__defaultOnce_34, &block);
      }
      if (initWithOperator_forService__classDebugEnabled_35)
      {
        v17 = NSString;
        v18 = [(PLOperator *)v9->_operator className];
        uint64_t v19 = [(NSArray *)v9->_serviceClients count];
        v20 = [v17 stringWithFormat:@"%@: %luu clients for %@", v18, v19, v8, block, v48, v49, v50, v51];

        v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOHIDOperatorComposition.m"];
        v22 = [v21 lastPathComponent];
        v23 = [NSString stringWithUTF8String:"-[PLIOHIDOperatorComposition initWithOperator:forService:]"];
        +[PLCoreStorage logMessage:v20 fromFile:v22 fromFunction:v23 fromLineNumber:52];

        v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          -[PLIOHIDOperatorComposition initWithOperator:forService:]((uint64_t)v20, v24, v25, v26, v27, v28, v29, v30);
        }
      }
    }

    goto LABEL_13;
  }
  if (v15)
  {
    uint64_t v32 = objc_opt_class();
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke_27;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v32;
    if (initWithOperator_forService__defaultOnce != -1) {
      dispatch_once(&initWithOperator_forService__defaultOnce, v52);
    }
    if (initWithOperator_forService__classDebugEnabled)
    {
      v33 = NSString;
      v34 = [(PLOperator *)v9->_operator className];
      v35 = [v33 stringWithFormat:@"%@: no clients for %@", v34, v8];

      v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOHIDOperatorComposition.m"];
      v37 = [v36 lastPathComponent];
      v38 = [NSString stringWithUTF8String:"-[PLIOHIDOperatorComposition initWithOperator:forService:]"];
      +[PLCoreStorage logMessage:v35 fromFile:v37 fromFunction:v38 fromLineNumber:49];

      v39 = PLLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[PLIOHIDOperatorComposition initWithOperator:forService:]((uint64_t)v35, v39, v40, v41, v42, v43, v44, v45);
      }
    }
  }

  v31 = 0;
LABEL_22:

  return v31;
}

void __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AmbientLightSensor";
  v2[1] = @"AmbientLightSensorLevel";
  v3[0] = &unk_1F1580588;
  v3[1] = &unk_1F15805A0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)serviceIDs;
  serviceIDs = v0;
}

BOOL __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke_27(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  initWithOperator_forService__classDebugEnabled = result;
  return result;
}

BOOL __58__PLIOHIDOperatorComposition_initWithOperator_forService___block_invoke_36(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  initWithOperator_forService__classDebugEnabled_35 = result;
  return result;
}

- (PLIOHIDOperatorComposition)initWithOperator:(id)a3 forService:(id)a4 withBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PLIOHIDOperatorComposition;
  CFArrayRef v12 = [(PLIOHIDOperatorComposition *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operator, a3);
    objc_storeStrong((id *)&v13->_serviceName, a4);
    uint64_t v14 = MEMORY[0x1C1869370](v11);
    id operatorBlock = v13->_operatorBlock;
    v13->_id operatorBlock = (id)v14;

    uint64_t v16 = IOHIDEventSystemClientCreate();
    v13->_eventSystemClient = (__IOHIDEventSystemClient *)v16;
    if (v16)
    {
      v17 = [v9 workQueue];
      IOHIDEventSystemClientScheduleWithDispatchQueue();

      IOHIDEventSystemClientRegisterPropertyChangedCallback();
    }
  }

  return v13;
}

- (double)doubleForKey:(id)a3
{
  id v4 = a3;
  v5 = [(PLIOHIDOperatorComposition *)self serviceName];
  [v5 caseInsensitiveCompare:@"AmbientLightSensor"];

  v6 = [(PLIOHIDOperatorComposition *)self serviceClients];
  id v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = (const void *)IOHIDServiceClientCopyEvent();

  if (v8)
  {
    id v9 = [(id)serviceIDs objectForKeyedSubscript:v4];
    [v9 intValue];
    IOHIDEventGetFloatValue();
    double v11 = v10;

    CFRelease(v8);
  }
  else
  {
    double v11 = -1.0;
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__PLIOHIDOperatorComposition_doubleForKey___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v12;
      if (doubleForKey__defaultOnce != -1) {
        dispatch_once(&doubleForKey__defaultOnce, block);
      }
      if (doubleForKey__classDebugEnabled)
      {
        v13 = [NSString stringWithFormat:@"we have no event"];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOHIDOperatorComposition.m"];
        BOOL v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"-[PLIOHIDOperatorComposition doubleForKey:]"];
        +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:88];

        v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLIOHIDOperatorComposition initWithOperator:forService:]((uint64_t)v13, v17, v18, v19, v20, v21, v22, v23);
        }
      }
    }
  }

  return v11;
}

BOOL __43__PLIOHIDOperatorComposition_doubleForKey___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  doubleForKey__classDebugEnabled = result;
  return result;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = (__CFString *)a3;
  v5 = (void *)IOHIDEventSystemClientCopyProperty([(PLIOHIDOperatorComposition *)self eventSystemClient], v4);

  if (v5)
  {
    CFTypeID v6 = CFGetTypeID(v5);
    if (v6 != CFDictionaryGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  eventSystemClient = self->_eventSystemClient;
  if (eventSystemClient) {
    CFRelease(eventSystemClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLIOHIDOperatorComposition;
  [(PLIOHIDOperatorComposition *)&v4 dealloc];
}

- (__IOHIDEventSystemClient)eventSystemClient
{
  return self->_eventSystemClient;
}

- (void)setEventSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_eventSystemClient = a3;
}

- (NSArray)serviceClients
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceClients:(id)a3
{
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceName:(id)a3
{
}

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (void)setOperatorBlock:(id)a3
{
}

- (PLOperator)operator
{
  return (PLOperator *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOperator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceClients, 0);
}

- (void)initWithOperator:(uint64_t)a3 forService:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end