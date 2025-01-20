@interface PLIOKitOperatorComposition
+ (id)snapshotFromIOEntry:(unsigned int)a3;
+ (id)snapshotFromIOEntry:(unsigned int)a3 forKey:(id)a4;
+ (id)snapshotFromIOEntry:(unsigned int)a3 forKeys:(id)a4;
- (IONotificationPort)ioNotifyPort;
- (NSString)serviceClassName;
- (NSString)serviceName;
- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forDynamicServiceClass:(id)a4 forNotificationType:(char)a5[128] withMatchBlock:(id)a6;
- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forService:(id)a4;
- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forService:(id)a4 withBlock:(id)a5;
- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forServiceClass:(id)a4;
- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forServiceClass:(id)a4 withBlock:(id)a5;
- (PLOperator)operator;
- (id)matchBlock;
- (id)operatorBlock;
- (id)properties;
- (id)propertiesForKey:(id)a3;
- (id)propertiesForKeys:(id)a3;
- (id)propertiesFromIOEntry:(unsigned int)a3;
- (id)propertiesFromIOEntry:(unsigned int)a3 forKey:(id)a4;
- (unsigned)conn;
- (unsigned)iterator;
- (unsigned)notificationRef;
- (unsigned)service;
- (void)dealloc;
- (void)setConn:(unsigned int)a3;
- (void)setIoNotifyPort:(IONotificationPort *)a3;
- (void)setIterator:(unsigned int)a3;
- (void)setMatchBlock:(id)a3;
- (void)setNotificationRef:(unsigned int)a3;
- (void)setOperator:(id)a3;
- (void)setOperatorBlock:(id)a3;
- (void)setService:(unsigned int)a3;
- (void)setServiceClassName:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation PLIOKitOperatorComposition

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (PLOperator)operator
{
  return (PLOperator *)objc_getProperty(self, a2, 64, 1);
}

- (id)propertiesFromIOEntry:(unsigned int)a3
{
  return +[PLIOKitOperatorComposition snapshotFromIOEntry:*(void *)&a3];
}

- (id)properties
{
  uint64_t v3 = [(PLIOKitOperatorComposition *)self service];
  return [(PLIOKitOperatorComposition *)self propertiesFromIOEntry:v3];
}

- (unsigned)service
{
  return self->_service;
}

+ (id)snapshotFromIOEntry:(unsigned int)a3
{
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties(a3, &properties, 0, 0);
  CFMutableDictionaryRef v3 = properties;
  return v3;
}

+ (id)snapshotFromIOEntry:(unsigned int)a3 forKey:(id)a4
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, (CFStringRef)a4, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  return CFProperty;
}

+ (id)snapshotFromIOEntry:(unsigned int)a3 forKeys:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        CFStringRef v13 = *(const __CFString **)(*((void *)&v16 + 1) + 8 * i);
        CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, v13, v11, 0);
        if (CFProperty) {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", CFProperty, v13, (void)v16);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forService:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PLIOKitOperatorComposition;
  uint64_t v9 = [(PLIOKitOperatorComposition *)&v22 init];
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v9->_operator, a3);
  objc_storeStrong((id *)&v10->_serviceName, a4);
  mach_port_t v11 = *MEMORY[0x1E4F2EF00];
  v10->_ioNotifyPort = IONotificationPortCreate(*MEMORY[0x1E4F2EF00]);
  v12 = [(PLIOKitOperatorComposition *)v10 ioNotifyPort];
  CFStringRef v13 = [v7 workQueue];
  IONotificationPortSetDispatchQueue(v12, v13);

  if (![v8 caseInsensitiveCompare:@"MainDisplay"])
  {
    IOMobileFramebufferGetMainDisplay();
    goto LABEL_10;
  }
  if (!strcmp((const char *)[v8 UTF8String], "backlight-control"))
  {
    v25 = @"IOPropertyMatch";
    v23 = @"backlight-control";
    uint64_t v24 = *MEMORY[0x1E4F1CFD0];
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v26[0] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    mach_port_t v16 = v11;
    CFDictionaryRef v17 = (const __CFDictionary *)v19;
    goto LABEL_8;
  }
  id v14 = [(PLIOKitOperatorComposition *)v10 serviceName];
  CFMutableDictionaryRef v15 = IOServiceMatching((const char *)[v14 UTF8String]);

  if (!v15)
  {
LABEL_10:
    v20 = 0;
    goto LABEL_11;
  }
  mach_port_t v16 = v11;
  CFDictionaryRef v17 = v15;
LABEL_8:
  v10->_service = IOServiceGetMatchingService(v16, v17);
LABEL_9:
  v20 = v10;
LABEL_11:

  return v20;
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forServiceClass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLIOKitOperatorComposition;
  uint64_t v9 = [(PLIOKitOperatorComposition *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_operator, a3);
    objc_storeStrong((id *)&v10->_serviceClassName, a4);
    v10->_service = 0;
    v10->_ioNotifyPort = IONotificationPortCreate(*MEMORY[0x1E4F2EF00]);
    mach_port_t v11 = [(PLIOKitOperatorComposition *)v10 ioNotifyPort];
    v12 = [v7 workQueue];
    IONotificationPortSetDispatchQueue(v11, v12);
  }
  return v10;
}

- (void)dealloc
{
  ioNotifyPort = self->_ioNotifyPort;
  if (ioNotifyPort) {
    IONotificationPortDestroy(ioNotifyPort);
  }
  io_object_t service = self->_service;
  if (service) {
    IOObjectRelease(service);
  }
  v5.receiver = self;
  v5.super_class = (Class)PLIOKitOperatorComposition;
  [(PLIOKitOperatorComposition *)&v5 dealloc];
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forService:(id)a4 withBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(PLIOKitOperatorComposition *)self initWithOperator:a3 forService:a4];
  if (!v9)
  {
LABEL_18:
    v23 = v9;
    goto LABEL_19;
  }
  uint64_t v10 = MEMORY[0x1C1869370](v8);
  id operatorBlock = v9->_operatorBlock;
  v9->_id operatorBlock = (id)v10;

  v9->_notificationRef = 0;
  uint64_t v12 = IOServiceAddInterestNotification([(PLIOKitOperatorComposition *)v9 ioNotifyPort], [(PLIOKitOperatorComposition *)v9 service], "IOGeneralInterest", (IOServiceInterestCallback)ioCallBack, v9, &v9->_notificationRef);
  BOOL v13 = +[PLDefaults debugEnabled];
  if (!v12)
  {
    if (v13)
    {
      uint64_t v24 = objc_opt_class();
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __68__PLIOKitOperatorComposition_initWithOperator_forService_withBlock___block_invoke_34;
      v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v34[4] = v24;
      if (initWithOperator_forService_withBlock__defaultOnce_32 != -1) {
        dispatch_once(&initWithOperator_forService_withBlock__defaultOnce_32, v34);
      }
      if (initWithOperator_forService_withBlock__classDebugEnabled_33)
      {
        v25 = NSString;
        v26 = [(PLIOKitOperatorComposition *)v9 operator];
        v27 = [v26 className];
        v28 = [v25 stringWithFormat:@"%@: %@ is setup", v27, v9->_serviceName];

        v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOKitOperatorComposition.m"];
        v30 = [v29 lastPathComponent];
        v31 = [NSString stringWithUTF8String:"-[PLIOKitOperatorComposition initWithOperator:forService:withBlock:]"];
        +[PLCoreStorage logMessage:v28 fromFile:v30 fromFunction:v31 fromLineNumber:148];

        v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          [(PLSubmissionFileSP *)(uint64_t)v28 copyAndPrepareLog];
        }
      }
    }
    goto LABEL_18;
  }
  if (v13)
  {
    uint64_t v14 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__PLIOKitOperatorComposition_initWithOperator_forService_withBlock___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (initWithOperator_forService_withBlock__defaultOnce != -1) {
      dispatch_once(&initWithOperator_forService_withBlock__defaultOnce, block);
    }
    if (initWithOperator_forService_withBlock__classDebugEnabled)
    {
      CFMutableDictionaryRef v15 = NSString;
      mach_port_t v16 = [(PLIOKitOperatorComposition *)v9 operator];
      CFDictionaryRef v17 = [v16 className];
      long long v18 = [v15 stringWithFormat:@"%@: Error calling IOServiceAddInterestNotification (0x%08x) for service %@", v17, v12, v9->_serviceName];

      uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLIOKitOperatorComposition.m"];
      v20 = [v19 lastPathComponent];
      uint64_t v21 = [NSString stringWithUTF8String:"-[PLIOKitOperatorComposition initWithOperator:forService:withBlock:]"];
      +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:145];

      objc_super v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        [(PLSubmissionFileSP *)(uint64_t)v18 copyAndPrepareLog];
      }
    }
  }
  v23 = 0;
LABEL_19:

  return v23;
}

BOOL __68__PLIOKitOperatorComposition_initWithOperator_forService_withBlock___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  initWithOperator_forService_withBlock__classDebugEnabled = result;
  return result;
}

BOOL __68__PLIOKitOperatorComposition_initWithOperator_forService_withBlock___block_invoke_34(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  initWithOperator_forService_withBlock__classDebugEnabled_33 = result;
  return result;
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forServiceClass:(id)a4 withBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PLIOKitOperatorComposition *)self initWithOperator:a3 forServiceClass:v8];
  if (!v10)
  {
LABEL_9:
    v20 = v10;
    goto LABEL_10;
  }
  uint64_t v11 = MEMORY[0x1C1869370](v9);
  id operatorBlock = v10->_operatorBlock;
  v10->_id operatorBlock = (id)v11;

  v10->_notificationRef = 0;
  io_iterator_t notification = 0;
  ioNotifyPort = v10->_ioNotifyPort;
  CFDictionaryRef v14 = IOServiceMatching((const char *)[v8 UTF8String]);
  mach_error_t v15 = IOServiceAddMatchingNotification(ioNotifyPort, "IOServiceFirstPublish", v14, (IOServiceMatchingCallback)eventManagerMatching, v10->_ioNotifyPort, &notification);
  if (!v15)
  {
    mach_port_t v16 = "could not register for IOAccessoryManager interest: %s\n";
    while (1)
    {
      io_object_t v17 = IOIteratorNext(notification);
      v10->_io_object_t service = v17;
      if (!v17) {
        break;
      }
      mach_error_t v15 = IOServiceAddInterestNotification([(PLIOKitOperatorComposition *)v10 ioNotifyPort], [(PLIOKitOperatorComposition *)v10 service], "IOGeneralInterest", (IOServiceInterestCallback)ioCallBack, v10, &v10->_notificationRef);
      if (v15) {
        goto LABEL_7;
      }
    }
    IOObjectRelease(notification);
    goto LABEL_9;
  }
  mach_port_t v16 = "could not register for IOAccessoryManager matching: %s\n";
LABEL_7:
  long long v18 = (FILE *)*MEMORY[0x1E4F143C8];
  uint64_t v19 = mach_error_string(v15);
  fprintf(v18, v16, v19);
  v20 = 0;
LABEL_10:

  return v20;
}

- (PLIOKitOperatorComposition)initWithOperator:(id)a3 forDynamicServiceClass:(id)a4 forNotificationType:(char)a5[128] withMatchBlock:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [(PLIOKitOperatorComposition *)self initWithOperator:a3 forServiceClass:v11];
  uint64_t v13 = MEMORY[0x1C1869370](v10);

  id matchBlock = v12->_matchBlock;
  v12->_id matchBlock = (id)v13;

  v12->_notificationRef = 0;
  id v15 = v11;
  CFMutableDictionaryRef v16 = IOServiceMatching((const char *)[v15 UTF8String]);
  LODWORD(v10) = [v15 isEqualToString:@"AFKEndpointInterface"];

  if (v10)
  {
    if (+[PLPlatform kPLDeviceClassIsOneOf:](PLPlatform, "kPLDeviceClassIsOneOf:", 302024, 302027, 302025, 302028, 0))
    {
      io_object_t v17 = &unk_1F1586E18;
    }
    else
    {
      io_object_t v17 = &unk_1F1586E40;
    }
    [(__CFDictionary *)v16 setObject:v17 forKeyedSubscript:@"IOPropertyMatch"];
    [(__CFDictionary *)v16 setObject:@"powerlog-service" forKeyedSubscript:@"IONameMatch"];
  }
  if (IOServiceAddMatchingNotification(v12->_ioNotifyPort, a5, v16, (IOServiceMatchingCallback)applyIOIterator, v12, &v12->_iterator))
  {
    _os_assumes_log();
  }
  else
  {
    long long v18 = [(PLIOKitOperatorComposition *)v12 operator];
    uint64_t v19 = [v18 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__PLIOKitOperatorComposition_initWithOperator_forDynamicServiceClass_forNotificationType_withMatchBlock___block_invoke;
    block[3] = &unk_1E62538C8;
    objc_super v22 = v12;
    dispatch_async(v19, block);
  }
  return v12;
}

void __105__PLIOKitOperatorComposition_initWithOperator_forDynamicServiceClass_forNotificationType_withMatchBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  io_iterator_t v2 = [v1 iterator];
  applyIOIterator(v1, v2);
}

- (id)propertiesFromIOEntry:(unsigned int)a3 forKey:(id)a4
{
  return +[PLIOKitOperatorComposition snapshotFromIOEntry:*(void *)&a3 forKey:a4];
}

- (id)propertiesForKeys:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[PLIOKitOperatorComposition snapshotFromIOEntry:[(PLIOKitOperatorComposition *)self service] forKeys:v4];

  return v5;
}

- (id)propertiesForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PLIOKitOperatorComposition *)self propertiesFromIOEntry:[(PLIOKitOperatorComposition *)self service] forKey:v4];

  return v5;
}

- (IONotificationPort)ioNotifyPort
{
  return self->_ioNotifyPort;
}

- (void)setIoNotifyPort:(IONotificationPort *)a3
{
  self->_ioNotifyPort = a3;
}

- (unsigned)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(unsigned int)a3
{
  self->_notificationRef = a3;
}

- (void)setService:(unsigned int)a3
{
  self->_io_object_t service = a3;
}

- (NSString)serviceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServiceName:(id)a3
{
}

- (NSString)serviceClassName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServiceClassName:(id)a3
{
}

- (unsigned)iterator
{
  return self->_iterator;
}

- (void)setIterator:(unsigned int)a3
{
  self->_iterator = a3;
}

- (unsigned)conn
{
  return self->_conn;
}

- (void)setConn:(unsigned int)a3
{
  self->_conn = a3;
}

- (void)setOperatorBlock:(id)a3
{
}

- (id)matchBlock
{
  return self->_matchBlock;
}

- (void)setMatchBlock:(id)a3
{
}

- (void)setOperator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operator, 0);
  objc_storeStrong(&self->_matchBlock, 0);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_serviceClassName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end