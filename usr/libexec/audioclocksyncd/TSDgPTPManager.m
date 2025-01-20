@interface TSDgPTPManager
+ (id)diagnosticInfo;
+ (id)gPTPManager;
+ (id)sharedgPTPManager;
+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3;
+ (void)initialize;
+ (void)notifyWhengPTPManagerIsAvailable:(id)a3;
+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3;
- (BOOL)addAVBDomainIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5;
- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5;
- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addDomain:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4;
- (BOOL)logInterfaceStatisticsWithError:(id *)a3;
- (BOOL)removeAVBDomainWithIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4;
- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3;
- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3;
- (BOOL)removeDomainWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4;
- (TSDgPTPClock)systemDomain;
- (TSDgPTPManager)init;
- (unint64_t)airPlayPTPInstanceClockIdentifier;
- (unint64_t)avbPTPInstance0ClockIdentifier;
- (unint64_t)avbPTPInstance1ClockIdentifier;
- (unint64_t)avbPTPInstance2ClockIdentifier;
- (unint64_t)avbPTPInstance3ClockIdentifier;
- (unint64_t)copresencePTPInstanceClockIdentifier;
- (unint64_t)systemDomainClockIdentifier;
- (void)dealloc;
@end

@implementation TSDgPTPManager

- (BOOL)logInterfaceStatisticsWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:9 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    v13 = &unk_100030E47;
    __int16 v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 431;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

+ (id)sharedgPTPManager
{
  if (qword_100047CB0 != -1) {
    dispatch_once(&qword_100047CB0, &stru_10003CE30);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007C24;
  block[3] = &unk_10003C810;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100047CA8, block);
  BOOL v3 = (void *)qword_100047CA0;

  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(TSDKextNotifier);
    BOOL v3 = (void *)qword_100047C98;
    qword_100047C98 = (uint64_t)v2;

    uint64_t v4 = qword_100047C98;
    int v5 = +[IOKService serviceMatching:@"IOTimeSyncgPTPManager"];
    LOBYTE(v4) = [(id)v4 startNotificationsWithMatchingDictionary:v5];

    if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136316418;
      v7 = "startedNotifier";
      __int16 v8 = 2048;
      uint64_t v9 = 0;
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      v13 = &unk_100030E47;
      __int16 v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v16 = 1024;
      int v17 = 54;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
}

+ (void)notifyWhengPTPManagerIsAvailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_100047C98;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E78C;
  v6[3] = &unk_10003CE10;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsAvailable:v6];
}

+ (void)notifyWhengPTPManagerIsUnavailable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)qword_100047C98;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001E834;
  v6[3] = &unk_10003CE10;
  id v7 = v3;
  id v5 = v3;
  [v4 notifyWhenServiceIsUnavailable:v6];
}

+ (id)sharedgPTPManagerSyncWithTimeout:(unint64_t)a3
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001E9E4;
  v10[3] = &unk_10003C4B0;
  id v5 = dispatch_semaphore_create(0);
  uint64_t v11 = v5;
  [a1 notifyWhengPTPManagerIsAvailable:v10];
  dispatch_time_t v6 = dispatch_time(0, 1000000 * a3);
  if (dispatch_semaphore_wait(v5, v6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to find gPTP manager within the timeout period.\n", v9, 2u);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = [a1 sharedgPTPManager];
  }

  return v7;
}

+ (id)gPTPManager
{
  v2 = objc_alloc_init(TSDgPTPManager);
  if (!v2)
  {
    unsigned int v3 = 10;
    do
    {
      usleep(0x2710u);
      v2 = objc_alloc_init(TSDgPTPManager);
      if (v3 < 2) {
        break;
      }
      --v3;
    }
    while (!v2);
  }

  return v2;
}

- (TSDgPTPManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)TSDgPTPManager;
  v2 = [(TSDgPTPManager *)&v14 init];
  if (v2)
  {
    unsigned int v3 = +[IOKService serviceMatching:@"IOTimeSyncgPTPManager"];
    uint64_t v4 = +[IOKService matchingService:v3];
    service = v2->_service;
    v2->_service = (IOKService *)v4;

    if (v2->_service)
    {
      dispatch_time_t v6 = [[IODConnection alloc] initWithService:v2->_service andType:42];
      connection = v2->_connection;
      v2->_connection = v6;

      if (v2->_connection)
      {
        __int16 v8 = [(IOKService *)v2->_service iodPropertyForKey:@"SystemDomainIdentifier"];
        uint64_t v9 = v8;
        if (v8) {
          uint64_t v10 = (uint64_t)[(TSDgPTPManager *)v8 unsignedLongLongValue];
        }
        else {
          uint64_t v10 = -1;
        }
        v2->_systemDomainClockIdentifier = v10;
        dispatch_queue_t v11 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.systemDomain", 0);
        systemDomainQueue = v2->_systemDomainQueue;
        v2->_systemDomainQueue = (OS_dispatch_queue *)v11;

        goto LABEL_8;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v16 = "_connection != nil";
        __int16 v17 = 2048;
        uint64_t v18 = 0;
        __int16 v19 = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        v22 = &unk_100030E47;
        __int16 v23 = 2080;
        v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
        __int16 v25 = 1024;
        int v26 = 147;
        goto LABEL_14;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v16 = "_service != nil";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      v22 = &unk_100030E47;
      __int16 v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v25 = 1024;
      int v26 = 144;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    uint64_t v9 = v2;
    v2 = 0;
LABEL_8:
  }
  return v2;
}

- (TSDgPTPClock)systemDomain
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10001EDC0;
  uint64_t v10 = sub_10001EDD0;
  id v11 = 0;
  systemDomainQueue = self->_systemDomainQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001EDD8;
  v5[3] = &unk_10003CE58;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)systemDomainQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TSDgPTPClock *)v3;
}

- (BOOL)addDomain:(unint64_t *)a3 error:(id *)a4
{
  return [(TSDgPTPManager *)self addPTPInstance:a3 error:a4];
}

- (BOOL)addPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
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
    v15 = &unk_100030E47;
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 196;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)addTimeOfDayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(IODConnection *)self->_connection callMethodWithSelector:6 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    v15 = &unk_100030E47;
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 214;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)removeDomainWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  return [(TSDgPTPManager *)self removePTPInstanceWithIdentifier:a3 error:a4];
}

- (BOOL)removePTPInstanceWithIdentifier:(unint64_t)a3 error:(id *)a4
{
  int v6 = 0;
  unint64_t v19 = a3;
  BOOL v4 = [(IODConnection *)self->_connection callMethodWithSelector:1 scalarInputs:&v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = &unk_100030E47;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v17 = 1024;
    int v18 = 237;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (BOOL)addAVBDomainIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  return [(TSDgPTPManager *)self addAVBPTPInstanceIndex:a3 identifier:a4 error:a5];
}

- (BOOL)addAVBPTPInstanceIndex:(unsigned __int16)a3 identifier:(unint64_t *)a4 error:(id *)a5
{
  if (!a4) {
    return 0;
  }
  uint64_t v22 = a3;
  int v8 = 1;
  BOOL v6 = [(IODConnection *)self->_connection callMethodWithSelector:2 scalarInputs:&v22 scalarInputCount:1 scalarOutputs:&v21 scalarOutputCount:&v8 error:a5];
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v10 = "result == YES";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    __int16 v16 = &unk_100030E47;
    __int16 v17 = 2080;
    int v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v19 = 1024;
    int v20 = 258;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a4 = v21;
  return v6;
}

- (BOOL)removeAVBDomainWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  return [(TSDgPTPManager *)self removeAVBPTPInstanceWithIndex:a3 error:a4];
}

- (BOOL)removeAVBPTPInstanceWithIndex:(unsigned __int16)a3 error:(id *)a4
{
  int v6 = 0;
  uint64_t v19 = a3;
  BOOL v4 = [(IODConnection *)self->_connection callMethodWithSelector:3 scalarInputs:&v19 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v6 error:a4];
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v8 = "result == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    uint64_t v14 = &unk_100030E47;
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v17 = 1024;
    int v18 = 281;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v4;
}

- (unint64_t)avbPTPInstance0ClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AVB0ClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)avbPTPInstance1ClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AVB1ClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)avbPTPInstance2ClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AVB2ClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)avbPTPInstance3ClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AVB3ClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)airPlayPTPInstanceClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"AirPlayClockID"];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (BOOL)addAirPlayPTPInstance:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(IODConnection *)self->_connection callMethodWithSelector:4 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = &unk_100030E47;
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 361;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)removeAirPlayPTPInstanceWithError:(id *)a3
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
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 376;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (unint64_t)copresencePTPInstanceClockIdentifier
{
  v2 = [(IOKService *)self->_service iodPropertyForKey:@"CopresenceClockID"];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (BOOL)addCopresencePTPInstance:(unint64_t *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  int v7 = 1;
  BOOL v5 = [(IODConnection *)self->_connection callMethodWithSelector:7 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v20 scalarOutputCount:&v7 error:a4];
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    __int16 v15 = &unk_100030E47;
    __int16 v16 = 2080;
    int v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v18 = 1024;
    int v19 = 404;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  *a3 = v20;
  return v5;
}

- (BOOL)removeCopresencePTPInstanceWithError:(id *)a3
{
  int v5 = 0;
  BOOL v3 = [(IODConnection *)self->_connection callMethodWithSelector:8 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v5 error:a3];
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v7 = "result == YES";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = &unk_100030E47;
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
    __int16 v16 = 1024;
    int v17 = 419;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (void)dealloc
{
  BOOL v3 = +[TSDClockManager sharedClockManager];
  [v3 removegPTPServicesWithError:0];

  v4.receiver = self;
  v4.super_class = (Class)TSDgPTPManager;
  [(TSDgPTPManager *)&v4 dealloc];
}

+ (id)diagnosticInfo
{
  v2 = +[IOKService serviceMatching:@"IOTimeSyncgPTPManager"];
  BOOL v3 = +[IOKService matchingService:v2];

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v20 = "service != nil";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2080;
      int v26 = &unk_100030E47;
      __int16 v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v29 = 1024;
      int v30 = 446;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_28:
    objc_super v4 = 0;
    goto LABEL_20;
  }
  if (([v3 conformsToIOClassName:@"IOTimeSyncgPTPManager"] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v20 = "[service conformsToIOClassName:@kIOTimeSyncgPTPManagerClass]";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2080;
      int v26 = &unk_100030E47;
      __int16 v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPManager.m";
      __int16 v29 = 1024;
      int v30 = 447;
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  objc_super v4 = +[NSMutableDictionary dictionary];
  int v5 = [v3 ioClassName];
  [v4 setObject:v5 forKeyedSubscript:@"ClassName"];

  int v6 = [v3 iodPropertyForKey:@"SystemDomainIdentifier"];
  if (v6) {
    [v4 setObject:v6 forKeyedSubscript:@"SystemDomainIdentifier"];
  }
  int v7 = [v3 iodPropertyForKey:@"AVB0ClockID"];

  if (v7) {
    [v4 setObject:v7 forKeyedSubscript:@"AVB0ClockID"];
  }
  __int16 v8 = [v3 iodPropertyForKey:@"AVB1ClockID"];

  if (v8) {
    [v4 setObject:v8 forKeyedSubscript:@"AVB1ClockID"];
  }
  uint64_t v9 = [v3 iodPropertyForKey:@"AVB2ClockID"];

  if (v9) {
    [v4 setObject:v9 forKeyedSubscript:@"AVB2ClockID"];
  }
  __int16 v10 = [v3 iodPropertyForKey:@"AVB3ClockID"];

  if (v10) {
    [v4 setObject:v10 forKeyedSubscript:@"AVB3ClockID"];
  }
  uint64_t v11 = [v3 iodPropertyForKey:@"AirPlayClockID"];

  if (v11) {
    [v4 setObject:v11 forKeyedSubscript:@"AirPlayClockID"];
  }
  __int16 v12 = [v3 iodPropertyForKey:@"CopresenceClockID"];

  if (v12) {
    [v4 setObject:v12 forKeyedSubscript:@"CopresenceClockID"];
  }
  uint64_t v13 = +[NSMutableArray array];
  __int16 v14 = [v3 childIteratorInServicePlaneWithError:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100020010;
  v17[3] = &unk_10003C768;
  id v15 = v13;
  id v18 = v15;
  [v14 enumerateWithBlock:v17];
  if ([v15 count]) {
    [v4 setObject:v15 forKeyedSubscript:@"PTPInstances"];
  }

LABEL_20:

  return v4;
}

- (unint64_t)systemDomainClockIdentifier
{
  return self->_systemDomainClockIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemDomainQueue, 0);
  objc_storeStrong((id *)&self->_systemDomain, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end