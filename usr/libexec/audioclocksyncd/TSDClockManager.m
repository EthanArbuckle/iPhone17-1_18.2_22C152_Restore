@interface TSDClockManager
+ (id)clockManager;
+ (id)daemonClassNameForClockIdentifier:(unint64_t)a3;
+ (id)defaultClockPersonalities;
+ (id)diagnosticInfo;
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 daemonClassName:(id *)a4;
+ (id)sharedClockManager;
+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3;
+ (void)initialize;
+ (void)notifyWhenClockManagerIsAvailable:(id)a3;
+ (void)notifyWhenClockManagerIsUnavailable:(id)a3;
- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5;
- (BOOL)addTSNCaptureServicesWithError:(id *)a3;
- (BOOL)addgPTPServicesWithError:(id *)a3;
- (BOOL)getTimeSyncTimeClockID:(unint64_t *)a3 error:(id *)a4;
- (BOOL)getTimeSyncTimeIsMachAbsolute:(BOOL *)a3 error:(id *)a4;
- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4;
- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4;
- (BOOL)removeTSNCaptureServicesWithError:(id *)a3;
- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removegPTPServicesWithError:(id *)a3;
- (BOOL)timeSyncTimeIsMachAbsoluteTime;
- (TSDClockManager)init;
- (TSDClockManager)initWithPid:(int)a3;
- (TSDKernelClock)translationClock;
- (id)availableClockIdentifiers;
- (id)classNameForClockService:(id)a3;
- (id)clockWithClockIdentifier:(unint64_t)a3;
- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7;
- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3;
- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3;
- (unint64_t)timeSyncTimeClockIdentifier;
- (unint64_t)translationClockIdentifier;
@end

@implementation TSDClockManager

- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3
{
  uint64_t numer = self->_timebaseInfo.numer;
  if (numer != self->_timebaseInfo.denom)
  {
    *(void *)&long long v7 = sub_100007CAC(a3, numer);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.denom;
    v8[1] = 0;
    return sub_1000077D8(&v7, v8);
  }
  return a3;
}

+ (id)sharedClockManager
{
  if (qword_100047CD0 != -1) {
    dispatch_once(&qword_100047CD0, &stru_10003CEA8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007BBC;
  block[3] = &unk_10003C810;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100047CC8, block);
  v3 = (void *)qword_100047CC0;

  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(TSDKextNotifier);
    v3 = (void *)qword_100047CB8;
    qword_100047CB8 = (uint64_t)v2;

    uint64_t v4 = qword_100047CB8;
    uint64_t v5 = +[IOKService serviceMatching:@"IOTimeSyncClockManager"];
    LOBYTE(v4) = [(id)v4 startNotificationsWithMatchingDictionary:v5];

    if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136316418;
      long long v7 = "startedNotifier";
      __int16 v8 = 2048;
      uint64_t v9 = 0;
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      v13 = &unk_100030E47;
      __int16 v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v16 = 1024;
      int v17 = 60;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
}

+ (void)notifyWhenClockManagerIsAvailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_100047CB8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020334;
  v6[3] = &unk_10003CE88;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsAvailable:v6];
}

+ (void)notifyWhenClockManagerIsUnavailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_100047CB8;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000203F4;
  v6[3] = &unk_10003CE88;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsUnavailable:v6];
}

+ (id)timeSyncAudioClockDeviceUIDForClockIdentifier:(unint64_t)a3
{
  return +[NSString stringWithFormat:@"ATSAC:%016llx", a3];
}

+ (id)clockManager
{
  v2 = objc_alloc_init(TSDClockManager);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSDClockManager);
      if (v3 < 2) {
        break;
      }
      --v3;
    }
    while (!v2);
  }

  return v2;
}

+ (id)defaultClockPersonalities
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  v17[0] = @"IOClassName";
  v17[1] = @"ProbeScore";
  v18[0] = @"IOTimeSyncService";
  v18[1] = &off_10003F228;
  v17[2] = @"ClassName";
  unsigned int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v18[2] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  [v2 addObject:v5];

  v15[0] = @"IOClassName";
  v15[1] = @"ProbeScore";
  v16[0] = @"IOTimeSyncDomain";
  v16[1] = &off_10003F240;
  v15[2] = @"ClassName";
  int v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v16[2] = v7;
  __int16 v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  [v2 addObject:v8];

  v13[0] = @"IOClassName";
  v13[1] = @"ProbeScore";
  v14[0] = @"IOTimeSyncUserFilteredService";
  v14[1] = &off_10003F240;
  v13[2] = @"ClassName";
  uint64_t v9 = (objc_class *)objc_opt_class();
  __int16 v10 = NSStringFromClass(v9);
  v14[2] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  [v2 addObject:v11];

  return v2;
}

- (TSDClockManager)init
{
  return [(TSDClockManager *)self initWithPid:0];
}

- (TSDClockManager)initWithPid:(int)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TSDClockManager;
  uint64_t v4 = [(TSDClockManager *)&v15 init];
  id v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    mach_timebase_info(&v4->_timebaseInfo);
    int v6 = +[IOKService serviceMatching:@"IOTimeSyncClockManager"];
    id v7 = +[IOKService matchingService:v6];

    if (v7)
    {
      __int16 v8 = [[IODConnection alloc] initWithService:v7 andType:42];
      connection = v5->_connection;
      v5->_connection = v8;

      if (v5->_connection)
      {
        [(TSDClockManager *)v5 getTimeSyncTimeClockID:&v5->_timeSyncTimeClockIdentifier error:0];
        v5->_translationClockIdentifier = v5->_timeSyncTimeClockIdentifier + 1;
        [(TSDClockManager *)v5 getTimeSyncTimeIsMachAbsolute:&v5->_timeSyncTimeIsMachAbsoluteTime error:0];
        __int16 v10 = [[TSDKernelClock alloc] initWithClockIdentifier:v5->_translationClockIdentifier];
        translationClock = v5->_translationClock;
        v5->_translationClock = v10;

        __int16 v12 = (NSMutableArray *)[(id)objc_opt_class() defaultClockPersonalities];
        clockPersonalities = v5->_clockPersonalities;
        v5->_clockPersonalities = v12;
LABEL_5:

        return v5;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        int v17 = "_connection != nil";
        __int16 v18 = 2048;
        uint64_t v19 = 0;
        __int16 v20 = 2048;
        uint64_t v21 = 0;
        __int16 v22 = 2080;
        v23 = &unk_100030E47;
        __int16 v24 = 2080;
        v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
        __int16 v26 = 1024;
        int v27 = 159;
        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v17 = "service != nil";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      __int16 v22 = 2080;
      v23 = &unk_100030E47;
      __int16 v24 = 2080;
      v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v26 = 1024;
      int v27 = 156;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    clockPersonalities = v5;
    id v5 = 0;
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)getTimeSyncTimeClockID:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  unint64_t v20 = 0;
  BOOL v5 = [(IODConnection *)self->_connection callMethodWithSelector:0 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    objc_super v15 = &unk_100030E47;
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 194;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)getTimeSyncTimeIsMachAbsolute:(BOOL *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  uint64_t v20 = 0;
  BOOL v5 = [(IODConnection *)self->_connection callMethodWithSelector:11 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    objc_super v15 = &unk_100030E47;
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 212;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20 != 0;
  return v5;
}

- (BOOL)nextAvailableDynamicClockID:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(IODConnection *)self->_connection callMethodWithSelector:1 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    objc_super v15 = &unk_100030E47;
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v18 = 1024;
    int v19 = 230;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)releaseDynamicClockID:(unint64_t)a3 error:(id *)a4
{
  int v6 = 0;
  unint64_t v19 = a3;
  BOOL v4 = [(IODConnection *)self->_connection callMethodWithSelector:2 scalarInputs:&v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E47;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 248;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addMappingFromClockID:(unint64_t)a3 toCoreAudioClockDomain:(unsigned int *)a4 error:(id *)a5
{
  unint64_t v9 = a3;
  if (!a3) {
    return 0;
  }
  int v8 = 1;
  BOOL v6 = [(IODConnection *)self->_connection callMethodWithSelector:3 scalarInputs:&v9 scalarInputCount:1 scalarOutputs:&v22 scalarOutputCount:&v8 error:a5];
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v11 = "result == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    __int16 v17 = &unk_100030E47;
    __int16 v18 = 2080;
    unint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v20 = 1024;
    int v21 = 263;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a4 = v22;
  return v6;
}

- (BOOL)removeMappingFromClockIDToCoreAudioClockDomainForClockID:(unint64_t)a3 error:(id *)a4
{
  int v6 = 0;
  unint64_t v19 = a3;
  BOOL v4 = [(IODConnection *)self->_connection callMethodWithSelector:4 scalarInputs:&v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E47;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 281;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addgPTPServicesWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:5 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 293;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)removegPTPServicesWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:6 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 305;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)addTSNCaptureServicesWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:9 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 317;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)removeTSNCaptureServicesWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:10 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v16 = 1024;
    int v17 = 329;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (id)availableClockIdentifiers
{
  BOOL v3 = +[NSMutableArray array];
  uint64_t v6 = 0;
  if ([(TSDClockManager *)self getTimeSyncTimeClockID:&v6 error:0])
  {
    BOOL v4 = +[TSDKernelClock availableKernelClockIdentifiers];
    [v3 addObjectsFromArray:v4];
  }

  return v3;
}

- (id)classNameForClockService:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obj = self->_clockPersonalities;
    int v5 = 0;
    id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v20;
      signed int v8 = -1;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          __int16 v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v11 = [v10 objectForKeyedSubscript:@"IOClassName"];
          unsigned int v12 = [v4 conformsToIOClassName:v11];

          if (v12)
          {
            if (v5)
            {
              __int16 v13 = [v10 objectForKeyedSubscript:@"ProbeScore"];
              signed int v14 = [v13 intValue];

              if (v14 > v8)
              {
                uint64_t v15 = [v10 objectForKeyedSubscript:@"ClassName"];

                int v5 = (void *)v15;
                signed int v8 = v14;
              }
            }
            else
            {
              __int16 v16 = [v10 objectForKeyedSubscript:@"ProbeScore"];
              signed int v8 = [v16 intValue];

              int v5 = [v10 objectForKeyedSubscript:@"ClassName"];
            }
          }
        }
        id v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v25 = "service != nil";
      __int16 v26 = 2048;
      uint64_t v27 = 0;
      __int16 v28 = 2048;
      uint64_t v29 = 0;
      __int16 v30 = 2080;
      v31 = &unk_100030E47;
      __int16 v32 = 2080;
      v33 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v34 = 1024;
      int v35 = 358;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    int v5 = 0;
  }

  return v5;
}

- (id)clockWithClockIdentifier:(unint64_t)a3
{
  if ([(TSDClockManager *)self timeSyncTimeClockIdentifier] == a3)
  {
LABEL_13:
    id v6 = 0;
    goto LABEL_14;
  }
  if ([(TSDClockManager *)self translationClockIdentifier] == a3)
  {
    id v6 = [(TSDClockManager *)self translationClock];
    goto LABEL_14;
  }
  int v7 = 1;
  *(void *)&long long v5 = 67109120;
  long long v15 = v5;
  while (1)
  {
    signed int v8 = +[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:](TSDKernelClock, "iokitMatchingDictionaryForClockIdentifier:", a3, v15);
    uint64_t v9 = +[IOKService matchingService:v8];

    if (v9) {
      break;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v15;
      LODWORD(v17) = v7;
      unsigned int v12 = "TSDClockManager clockWithClockIdentifier unable to find service retry = %d\n";
      uint32_t v13 = 8;
      goto LABEL_11;
    }
LABEL_12:
    usleep(0x2710u);

    if (++v7 == 11) {
      goto LABEL_13;
    }
  }
  __int16 v10 = [(TSDClockManager *)self classNameForClockService:v9];
  uint64_t v11 = v10;
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v17 = a3;
      unsigned int v12 = "Could not find class match for clock identifier: 0x%016llx\n";
      uint32_t v13 = 12;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v6 = [objc_alloc(NSClassFromString(v10)) initWithClockIdentifier:a3 pid:self->_pid];

LABEL_14:

  return v6;
}

- (unint64_t)addUserFilteredClockWithMachInterval:(unint64_t)a3 domainInterval:(unint64_t)a4 usingFilterShift:(unsigned __int8)a5 isAdaptive:(BOOL)a6 error:(id *)a7
{
  int v9 = 1;
  v23[0] = a3;
  v23[1] = a4;
  v23[2] = a5;
  v23[3] = a6;
  unsigned int v7 = [(IODConnection *)self->_connection callMethodWithSelector:7 scalarInputs:v23 scalarInputCount:4 scalarOutputs:&v22 scalarOutputCount:&v9 error:a7];
  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v11 = "callResult == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    unint64_t v17 = &unk_100030E47;
    __int16 v18 = 2080;
    long long v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v20 = 1024;
    int v21 = 450;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7) {
    return v22;
  }
  else {
    return -1;
  }
}

- (BOOL)removeUserFilteredClockWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  int v6 = 0;
  unint64_t v19 = a3;
  BOOL v4 = [(IODConnection *)self->_connection callMethodWithSelector:8 scalarInputs:&v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    signed int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E47;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v17 = 1024;
    int v18 = 469;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3
{
  uint64_t denom = self->_timebaseInfo.denom;
  if (self->_timebaseInfo.numer != denom)
  {
    *(void *)&long long v7 = sub_100007CAC(a3, denom);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.numer;
    v8[1] = 0;
    return sub_1000077D8(&v7, v8);
  }
  return a3;
}

+ (id)diagnosticInfo
{
  id v2 = +[IOKService serviceMatching:@"IOTimeSyncClockManager"];
  BOOL v3 = +[IOKService matchingService:v2];

  if (v3)
  {
    if ([v3 conformsToIOClassName:@"IOTimeSyncClockManager"])
    {
      BOOL v4 = +[NSMutableDictionary dictionary];
      uint64_t v5 = [v3 ioClassName];
      [v4 setObject:v5 forKeyedSubscript:@"ClassName"];

      int v6 = [v3 iodPropertyForKey:@"TimeSyncTimeClockID"];
      [v4 setObject:v6 forKeyedSubscript:@"TimeSyncTimeClockID"];

      long long v7 = [v3 iodPropertyForKey:@"TranslationClockID"];
      [v4 setObject:v7 forKeyedSubscript:@"TranslationClockID"];

      signed int v8 = [v3 iodPropertyForKey:@"TimeSyncTimeCoreAudioClockDomain"];
      [v4 setObject:v8 forKeyedSubscript:@"TimeSyncTimeCoreAudioClockDomain"];

      goto LABEL_4;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      __int16 v11 = "[service conformsToIOClassName:@kIOTimeSyncClockManagerClass]";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      __int16 v17 = &unk_100030E47;
      __int16 v18 = 2080;
      unint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v20 = 1024;
      int v21 = 522;
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136316418;
    __int16 v11 = "service != nil";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    __int16 v17 = &unk_100030E47;
    __int16 v18 = 2080;
    unint64_t v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
    __int16 v20 = 1024;
    int v21 = 521;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v10, 0x3Au);
  }
  BOOL v4 = 0;
LABEL_4:

  return v4;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 daemonClassName:(id *)a4
{
  int v6 = +[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:a3];
  long long v7 = +[IOKService matchingService:v6];

  if (v7)
  {
    signed int v8 = [a1 sharedClockManager];
    __int16 v9 = [v8 classNameForClockService:v7];

    if (v9)
    {
      int v10 = [NSClassFromString(v9) diagnosticInfoForService:v7];
      if (!a4) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
    int v10 = 0;
    if (a4)
    {
LABEL_6:
      __int16 v9 = v9;
      *a4 = v9;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136316418;
      __int16 v14 = "service != nil";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = &unk_100030E47;
      __int16 v21 = 2080;
      unint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v23 = 1024;
      int v24 = 542;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v13, 0x3Au);
    }
    __int16 v9 = 0;
    int v10 = 0;
  }
LABEL_7:
  id v11 = v10;

  return v11;
}

+ (id)daemonClassNameForClockIdentifier:(unint64_t)a3
{
  BOOL v4 = +[TSDKernelClock iokitMatchingDictionaryForClockIdentifier:a3];
  uint64_t v5 = +[IOKService matchingService:v4];

  if (v5)
  {
    int v6 = [a1 sharedClockManager];
    long long v7 = [v6 classNameForClockService:v5];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      int v10 = "service != nil";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      uint64_t v16 = &unk_100030E47;
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDClockManager.mm";
      __int16 v19 = 1024;
      int v20 = 565;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    long long v7 = 0;
  }

  return v7;
}

- (unint64_t)timeSyncTimeClockIdentifier
{
  return self->_timeSyncTimeClockIdentifier;
}

- (unint64_t)translationClockIdentifier
{
  return self->_translationClockIdentifier;
}

- (BOOL)timeSyncTimeIsMachAbsoluteTime
{
  return self->_timeSyncTimeIsMachAbsoluteTime;
}

- (TSDKernelClock)translationClock
{
  return self->_translationClock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_clockPersonalities, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end