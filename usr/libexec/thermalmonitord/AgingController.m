@interface AgingController
+ (id)allocDefaults;
+ (id)log;
- (AgingController)initWithParams:(id)a3 currentWRa:(int)a4 currentUPOCount:(int)a5;
- (BOOL)shouldEnableAgeAwarenessForTableDrivenControllers;
- (NSUserDefaults)defaults;
- (id)currentBootSessionUUID;
- (int)UPOAgingMitigationsThreshold;
- (unint64_t)mitigationState;
- (void)dealloc;
- (void)migrateDefaultsPlist;
- (void)notifyPPMOfMitigationState:(unint64_t)a3;
- (void)setDefaults:(id)a3;
- (void)setMitigationState:(unint64_t)a3;
- (void)setUPOAgingMitigationsThreshold:(int)a3;
- (void)takeActionOnUPO:(int)a3 forWRa:(int)a4;
- (void)updateMitigationStateAndNotify:(unint64_t)a3;
- (void)xpcNotifyForMitigationsUI;
@end

@implementation AgingController

+ (id)log
{
  if (qword_1000AA070 != -1) {
    dispatch_once(&qword_1000AA070, &stru_100085B08);
  }
  return (id)qword_1000AA078;
}

+ (id)allocDefaults
{
  v2 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    CFStringRef v6 = @"/var/MobileSoftwareUpdate/Hardware/Battery";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Allocating defaults at %@", (uint8_t *)&v5, 0xCu);
  }
  id v3 = [objc_alloc((Class)NSUserDefaults) _initWithSuiteName:@"com.apple.thermalmonitor.agingcontroller" container:[NSURL URLWithString:@"/var/MobileSoftwareUpdate/Hardware/Battery"]];
  [v3 synchronize];
  return v3;
}

- (void)migrateDefaultsPlist
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.thermalmonitor.agingcontroller"];
  id v4 = [v3 dictionaryRepresentation];
  id v5 = [v4 allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", [v4 objectForKey:*(void *)(*((void *)&v10 + 1) + 8 * (void)v9)], *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"DataMigrated"];
}

- (AgingController)initWithParams:(id)a3 currentWRa:(int)a4 currentUPOCount:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  v58.receiver = self;
  v58.super_class = (Class)AgingController;
  uint64_t v8 = [(AgingController *)&v58 init];
  if (!v8)
  {
    v21 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100055E04(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    return 0;
  }
  uint64_t v9 = sub_100038B60();
  id v10 = [a3 objectForKey:@"UPOMitigationsThresholdWRa"];
  id v11 = [v10 objectForKey:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9) stringValue]];
  if (!v11)
  {
    long long v12 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<Warning> No upo mitigations start threshold found. Falling back to default value\n", buf, 2u);
    }
    id v11 = [v10 objectForKey:[&off_10008D1F0 stringValue]];
    if (!v11)
    {
      v52 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_100055E7C();
      }

      return 0;
    }
  }
  v8->_int UPOAgingMitigationsThreshold = [v11 intValue];
  long long v13 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int UPOAgingMitigationsThreshold = v8->_UPOAgingMitigationsThreshold;
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = UPOAgingMitigationsThreshold;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s UpoAgingMitigationsThreshold %d\n", buf, 0x12u);
  }
  v15 = +[AgingController allocDefaults];
  v8->_defaults = v15;
  if (![(NSUserDefaults *)v15 BOOLForKey:@"DataMigrated"])
  {
    v16 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Need data migration to new persistent location. Initiating migration...\n", buf, 0xCu);
    }
    [(AgingController *)v8 migrateDefaultsPlist];
    v17 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Migration complete\n", buf, 0xCu);
    }
  }
  v18 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(NSUserDefaults *)v8->_defaults dictionaryRepresentation];
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Current defaults %@\n", buf, 0x16u);
  }
  NSInteger v20 = [(NSUserDefaults *)v8->_defaults integerForKey:@"MitigationState"];
  if (v20)
  {
    v8->_mitigationState = v20;
  }
  else
  {
    v8->_mitigationState = 2;
    v29 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s Unknown previous mitigation state. Disabling mitigations\n", buf, 0xCu);
    }
  }
  v30 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    sub_100055FA0((uint64_t *)&v8->_mitigationState, v30);
  }
  v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.agingcontrollerqueue", v31);
  v32 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8->_connQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.agingcontrollerConQueue", v32);
  v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8->_notifyQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.thermalmonitor.agingcontrollerNotifyQueue", v33);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  v64 = sub_100026214;
  v65 = sub_100026224;
  v66 = v8;
  v34 = (const char *)[@"com.apple.thermalmonitor.ageAwareMitigationsDisabled" UTF8String];
  queue = v8->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100026230;
  handler[3] = &unk_100085B30;
  handler[4] = buf;
  if (notify_register_dispatch(v34, &v8->_mitigationsDisabledToken, queue, handler))
  {
    v36 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100055F28(v36, v37, v38, v39, v40, v41, v42, v43);
    }
  }
  else
  {
    if (!notify_register_check((const char *)[@"com.apple.thermalmonitor.ageAwareMitigationState" UTF8String], &v8->_mitigationStateToken))
    {
      if ([(NSUserDefaults *)v8->_defaults stringForKey:@"BootUUID"])
      {
        [(AgingController *)v8 notifyPPMOfMitigationState:[(AgingController *)v8 mitigationState]];
      }
      else
      {
        [(NSUserDefaults *)v8->_defaults setInteger:(int)v5 forKey:@"UPOCount"];
        [(NSUserDefaults *)v8->_defaults setObject:[(AgingController *)v8 currentBootSessionUUID] forKey:@"BootUUID"];
        [(NSUserDefaults *)v8->_defaults setInteger:[(AgingController *)v8 mitigationState] forKey:@"MitigationState"];
      }
      notify_set_state(v8->_mitigationStateToken, [(AgingController *)v8 mitigationState]);
      notify_post((const char *)[@"com.apple.thermalmonitor.ageAwareMitigationState" UTF8String]);
      [(AgingController *)v8 takeActionOnUPO:v5 forWRa:v6];
      v54 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = (objc_class *)objc_opt_class();
        v56 = NSStringFromClass(v55);
        *(_DWORD *)v59 = 136315394;
        v60 = "-[AgingController initWithParams:currentWRa:currentUPOCount:]";
        __int16 v61 = 2112;
        v62 = v56;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%s %@ initialized successfully\n", v59, 0x16u);
      }
      goto LABEL_30;
    }
    v44 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_100055EB0(v44, v45, v46, v47, v48, v49, v50, v51);
    }
  }

  uint64_t v8 = 0;
LABEL_30:
  _Block_object_dispose(buf, 8);
  return v8;
}

- (void)dealloc
{
  id v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[AgingController dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Dealloc\n", buf, 0xCu);
  }

  io_object_t ppmService = self->_ppmService;
  if (ppmService) {
    IOObjectRelease(ppmService);
  }
  v5.receiver = self;
  v5.super_class = (Class)AgingController;
  [(AgingController *)&v5 dealloc];
}

- (void)takeActionOnUPO:(int)a3 forWRa:(int)a4
{
  id v7 = [(NSUserDefaults *)self->_defaults stringForKey:@"BootUUID"];
  id v8 = [(AgingController *)self currentBootSessionUUID];
  NSInteger v9 = [(NSUserDefaults *)self->_defaults integerForKey:@"UPOCount"];
  id v10 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 138413058;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 1024;
    int v30 = v9;
    __int16 v31 = 1024;
    int v32 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "savedBootUUID %@ currentBootUUID %@ savedUPOCount %d currentUPOCount %d\n", (uint8_t *)&v25, 0x22u);
  }
  if (a4 <= 0)
  {
    v18 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100056190(a4, v18);
    }
  }
  else
  {
    if ([v8 isEqualToString:v7])
    {
      id v11 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10005621C((uint64_t)v8, v11, v12, v13, v14, v15, v16, v17);
      }
      return;
    }
    [(NSUserDefaults *)self->_defaults setObject:v8 forKey:@"BootUUID"];
    if (v9 < a3)
    {
      [(NSUserDefaults *)self->_defaults setInteger:a3 forKey:@"UPOCount"];
      p_int UPOAgingMitigationsThreshold = &self->_UPOAgingMitigationsThreshold;
      NSInteger v20 = self;
      if (self->_UPOAgingMitigationsThreshold > a4)
      {
        v21 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          sub_100056288(p_UPOAgingMitigationsThreshold, a4, v21);
        }
        return;
      }
      uint64_t v24 = 1;
LABEL_20:
      [(AgingController *)v20 updateMitigationStateAndNotify:v24];
      return;
    }
    uint64_t v22 = [(id)objc_opt_class() log];
    uint64_t v23 = v22;
    if (v9 != a3)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10005638C(v9, a3, v23);
      }
      [(NSUserDefaults *)self->_defaults setInteger:a3 forKey:@"UPOCount"];
      NSInteger v20 = self;
      uint64_t v24 = 2;
      goto LABEL_20;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_100056314(a3, v23);
    }
  }
}

- (BOOL)shouldEnableAgeAwarenessForTableDrivenControllers
{
  return (id)[(AgingController *)self mitigationState] == (id)1;
}

- (void)updateMitigationStateAndNotify:(unint64_t)a3
{
  unint64_t v5 = [(AgingController *)self mitigationState];
  uint64_t v6 = [(id)objc_opt_class() log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == a3)
  {
    if (v7) {
      sub_100056414(self);
    }
  }
  else
  {
    if (v7) {
      sub_100056518(self);
    }
    [(AgingController *)self setMitigationState:a3];
    [(NSUserDefaults *)self->_defaults setInteger:[(AgingController *)self mitigationState] forKey:@"MitigationState"];
    notify_set_state(self->_mitigationStateToken, [(AgingController *)self mitigationState]);
    notify_post((const char *)[@"com.apple.thermalmonitor.ageAwareMitigationState" UTF8String]);
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[AgingController updateMitigationStateAndNotify:]";
      __int16 v19 = 1024;
      unsigned int v20 = [(AgingController *)self mitigationState];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Notification posted for state %d\n", (uint8_t *)&v17, 0x12u);
    }
    [(AgingController *)self notifyPPMOfMitigationState:[(AgingController *)self mitigationState]];
    if ((id)[(AgingController *)self mitigationState] == (id)1)
    {
      NSInteger v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000564A0(v9, v10, v11, v12, v13, v14, v15, v16);
      }
      [(AgingController *)self xpcNotifyForMitigationsUI];
    }
  }
}

- (void)notifyPPMOfMitigationState:(unint64_t)a3
{
  kern_return_t v8;
  NSObject *v9;
  BOOL valuePtr;
  void block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026AA0;
  block[3] = &unk_100085248;
  block[4] = self;
  if (qword_1000AA080 != -1) {
    dispatch_once(&qword_1000AA080, block);
  }
  if (self->_ppmService)
  {
    valuePtr = a3 == 1;
    CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      BOOL v7 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100056618((int *)&valuePtr, v7);
      }
      id v8 = IORegistryEntrySetCFProperty(self->_ppmService, @"EnableBatteryAgingModel", v6);
      NSInteger v9 = [(id)objc_opt_class() log];
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1000565E4();
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        sub_1000565B0();
      }
      CFRelease(v6);
    }
  }
}

- (void)xpcNotifyForMitigationsUI
{
  notifyQueue = self->_notifyQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026B90;
  block[3] = &unk_100085248;
  block[4] = self;
  dispatch_async((dispatch_queue_t)notifyQueue, block);
}

- (id)currentBootSessionUUID
{
  size_t size = 0;
  v2 = 0;
  if (!sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0))
  {
    id v3 = (char *)malloc_type_malloc(size, 0x4FE7066EuLL);
    if (sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0))
    {
      v2 = 0;
    }
    else
    {
      v2 = (NSString *)strdup(v3);
      qword_1000AA088 = (uint64_t)v2;
      free(v3);
      if (v2)
      {
        v2 = +[NSString stringWithUTF8String:v2];
        id v3 = (char *)qword_1000AA088;
      }
      else
      {
        id v3 = 0;
      }
    }
    free(v3);
  }
  return v2;
}

- (int)UPOAgingMitigationsThreshold
{
  return self->_UPOAgingMitigationsThreshold;
}

- (void)setUPOAgingMitigationsThreshold:(int)a3
{
  self->_int UPOAgingMitigationsThreshold = a3;
}

- (unint64_t)mitigationState
{
  return self->_mitigationState;
}

- (void)setMitigationState:(unint64_t)a3
{
  self->_mitigationState = a3;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

@end