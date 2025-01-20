@interface _XBMemoryMonitor
- (_XBMemoryMonitor)init;
- (id)_getProcessMemoryUsed;
- (void)_publishMemoryReportForPressureType:(id)a3;
- (void)_setupProcessMemoryPressureMonitor;
- (void)recordMemoryForBundleID:(id)a3;
@end

@implementation _XBMemoryMonitor

- (_XBMemoryMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)_XBMemoryMonitor;
  v2 = [(_XBMemoryMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:10];
    accessLock_memoryRecords = v3->_accessLock_memoryRecords;
    v3->_accessLock_memoryRecords = v4;

    [(_XBMemoryMonitor *)v3 _setupProcessMemoryPressureMonitor];
  }
  return v3;
}

- (void)recordMemoryForBundleID:(id)a3
{
  v5 = (__CFString *)a3;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  uint64_t v7 = (uint64_t)[(NSMutableArray *)self->_accessLock_memoryRecords count];
  if (v7 >= 11)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"XBLaunchImageProviderServer.m" lineNumber:365 description:@"memory record count should not be greater than the max allowed size"];
  }
  v8 = [(_XBMemoryMonitor *)self _getProcessMemoryUsed];
  if (v8)
  {
    if (v7 == 10) {
      [(NSMutableArray *)self->_accessLock_memoryRecords removeObjectAtIndex:0];
    }
    if (!v5) {
      v5 = @"<nil>";
    }
    v16[0] = @"bundleID";
    v16[1] = @"memory";
    v17[0] = v5;
    v17[1] = v8;
    v9 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    [(NSMutableArray *)self->_accessLock_memoryRecords addObject:v9];
    v10 = sub_100002564();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543618;
      v13 = v8;
      __int16 v14 = 2114;
      v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Recorded process memory: %{public}@ Bytes while processing bundleID: %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    v9 = sub_100002564();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100006FCC((uint64_t)v5, v9);
    }
  }

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_setupProcessMemoryPressureMonitor
{
  self->_memoryPressureStatus = 1;
  v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 0x31uLL, (dispatch_queue_t)&_dispatch_main_q);
  memoryPressureSource = self->_memoryPressureSource;
  self->_memoryPressureSource = v3;

  v5 = self->_memoryPressureSource;
  if (v5)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000068CC;
    handler[3] = &unk_10000C730;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    dispatch_resume((dispatch_object_t)self->_memoryPressureSource);
  }
}

- (void)_publishMemoryReportForPressureType:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SDRDiagnosticReporter);
  v6 = [v5 signatureWithDomain:@"SplashBoard" type:@"MemoryPressure" subType:v4 detectedProcess:@"splashboardd" triggerThresholdValues:0];
  uint64_t v15 = kSymptomDiagnosticActionGetNetworkInfo;
  v16 = &__kCFBooleanFalse;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  id v9 = [(NSMutableArray *)self->_accessLock_memoryRecords copy];
  os_unfair_lock_unlock(p_accessLock);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006B04;
  v12[3] = &unk_10000C7D0;
  id v13 = v4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v4;
  [v5 snapshotWithSignature:v6 duration:v10 events:0 payload:v7 actions:v12 reply:0.0];
}

- (id)_getProcessMemoryUsed
{
  int v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)task_info_out = 0u;
  long long v6 = 0u;
  mach_msg_type_number_t task_info_outCnt = 93;
  if (task_info(mach_task_self_, 0x16u, task_info_out, &task_info_outCnt))
  {
    v2 = 0;
  }
  else
  {
    v2 = +[NSNumber numberWithUnsignedLongLong:(void)v8];
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);

  objc_storeStrong((id *)&self->_accessLock_memoryRecords, 0);
}

@end