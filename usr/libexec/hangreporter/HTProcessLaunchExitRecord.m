@interface HTProcessLaunchExitRecord
+ (BOOL)supportsSecureCoding;
+ (id)getProcessExitsAndLaunchesDuringHang:(unint64_t)a3 endTime:(unint64_t)a4;
+ (void)fetchProcessRecords;
- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4;
- (BOOL)isTimedOut;
- (HTProcessLaunchExitRecord)initWithCoder:(id)a3;
- (HTProcessLaunchExitRecord)initWithInfo:(id)a3 pid:(int)a4 spawnTimestamp:(unint64_t)a5 exitTimestamp:(unint64_t)a6 exitReasonCode:(unint64_t)a7 exitReasonNamespace:(unsigned __int8)a8 jetsam_priority:(unsigned __int16)a9;
- (NSString)exitReasonNamespaceString;
- (NSString)processName;
- (int)pid;
- (unint64_t)compareValue;
- (unint64_t)exitReasonCode;
- (unint64_t)exitTimestamp;
- (unint64_t)requestedToRenderTimestamp;
- (unint64_t)spawnTimestamp;
- (unsigned)exitReasonNamespace;
- (unsigned)jetsam_priority;
- (void)encodeWithCoder:(id)a3;
- (void)setRequestedToRenderTimestamp:(unint64_t)a3;
@end

@implementation HTProcessLaunchExitRecord

- (HTProcessLaunchExitRecord)initWithInfo:(id)a3 pid:(int)a4 spawnTimestamp:(unint64_t)a5 exitTimestamp:(unint64_t)a6 exitReasonCode:(unint64_t)a7 exitReasonNamespace:(unsigned __int8)a8 jetsam_priority:(unsigned __int16)a9
{
  id v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HTProcessLaunchExitRecord;
  v17 = [(HTProcessLaunchExitRecord *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_processName, a3);
    v18->_pid = a4;
    v18->_spawnTimestamp = a5;
    v18->_exitTimestamp = a6;
    v18->_exitReasonCode = a7;
    v18->_exitReasonNamespace = a8;
    v18->_jetsam_priority = a9;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  processName = self->_processName;
  id v5 = a3;
  [v5 encodeObject:processName forKey:@"processName"];
  [v5 encodeInt64:self->_pid forKey:@"pid"];
  [v5 encodeInt64:self->_spawnTimestamp forKey:@"spawnTimestamp"];
  [v5 encodeInt64:self->_exitTimestamp forKey:@"exitTimestamp"];
  [v5 encodeInt64:self->_exitReasonCode forKey:@"exitReasonCode"];
  [v5 encodeInt:self->_exitReasonNamespace forKey:@"exitReasonNamespace"];
  [v5 encodeInt:self->_jetsam_priority forKey:@"jetsamPriority"];
}

- (HTProcessLaunchExitRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"processName"];
  id v6 = [v4 decodeInt64ForKey:@"pid"];
  id v7 = [v4 decodeInt64ForKey:@"spawnTimestamp"];
  id v8 = [v4 decodeInt64ForKey:@"exitTimestamp"];
  id v9 = [v4 decodeInt64ForKey:@"exitReasonCode"];
  unsigned __int8 v10 = [v4 decodeIntForKey:@"exitReasonNamespace"];
  unsigned __int16 v11 = (unsigned __int16)[v4 decodeIntForKey:@"jetsamPriority"];

  LOWORD(v14) = v11;
  v12 = [(HTProcessLaunchExitRecord *)self initWithInfo:v5 pid:v6 spawnTimestamp:v7 exitTimestamp:v8 exitReasonCode:v9 exitReasonNamespace:v10 jetsam_priority:v14];

  return v12;
}

+ (void)fetchProcessRecords
{
  if (qword_1000801D8 != -1) {
    dispatch_once(&qword_1000801D8, &stru_100075CC8);
  }
  int v2 = _launch_service_stats_copy_impl();
  if (v2)
  {
    v3 = sub_10001B6E0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v21 = v2;
      *(_WORD *)&v21[4] = 2080;
      *(void *)&v21[6] = strerror(v2);
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Failed to fetch launch_service_stats(%d):%s", buf, 0x12u);
    }
  }
  else
  {
    id v4 = sub_10001B6E0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "launch_service_stats_copy() returned %u records", buf, 8u);
    }

    uint64_t v5 = mach_absolute_time();
    v3 = +[NSMutableIndexSet indexSet];
    for (unint64_t i = 0; i < (unint64_t)[(id)qword_1000801E0 count]; ++i)
    {
      id v7 = [(id)qword_1000801E0 objectAtIndex:i];
      id v8 = [v7 exitTimestamp];

      id v9 = +[HTPrefs sharedPrefs];
      unint64_t v10 = v5 - (void)v8;
      LODWORD(v8) = sub_100003C98((unint64_t)[v9 runloopHangTimeoutDurationMSec] + 30000) < (double)(v5 - (unint64_t)v8);

      if (v8)
      {
        unsigned __int16 v11 = sub_10001B6E0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          double v12 = sub_100003BDC(v10);
          v13 = +[HTPrefs sharedPrefs];
          uint64_t v14 = (char *)[v13 runloopHangTimeoutDurationMSec];
          v15 = [(id)qword_1000801E0 getDescription:i];
          *(_DWORD *)buf = 134218498;
          *(double *)v21 = v12;
          *(_WORD *)&v21[8] = 2048;
          *(void *)&v21[10] = v14 + 30000;
          __int16 v22 = 2112;
          v23 = v15;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "discarding stale record, time since exit %.0fms, HT_STALE_RECORD_THRESHOLD_IN_MSEC %llums, %@", buf, 0x20u);
        }
        [v3 addIndex:i];
      }
    }
    [(id)qword_1000801E0 removeObjectsAtIndexes:v3];
    id v16 = (void *)os_transaction_create();
    [(id)qword_1000801E0 setTransaction:v16];

    v17 = +[HTPrefs sharedPrefs];
    dispatch_time_t v18 = dispatch_time(0, 1000000 * (void)[v17 runloopHangTimeoutDurationMSec] + 30000000000);

    v19 = [(id)qword_1000801E0 timer];
    dispatch_source_set_timer(v19, v18, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
  }
}

+ (id)getProcessExitsAndLaunchesDuringHang:(unint64_t)a3 endTime:(unint64_t)a4
{
  id v30 = objc_alloc_init((Class)NSMutableArray);
  id v28 = objc_alloc_init((Class)NSMutableArray);
  id v29 = objc_alloc_init((Class)NSMutableArray);
  id v4 = sub_10001B6E0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double v48 = sub_100003BDC(a3);
    __int16 v49 = 2048;
    double v50 = sub_100003BDC(a4);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "getProcessExitsAndLaunchesDuringHang: called with windown [%.0f - %.0f]ms", buf, 0x16u);
  }

  +[HTProcessLaunchExitRecord fetchProcessRecords];
  v33 = +[NSDate now];
  uint64_t v31 = mach_absolute_time();
  if ([(id)qword_1000801E0 count])
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      id v7 = [(id)qword_1000801E0 objectAtIndex:v5];
      v45[0] = @"processName";
      v42 = [v7 processName];
      v46[0] = v42;
      v45[1] = @"processID";
      v41 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 pid]);
      v46[1] = v41;
      v45[2] = @"spawnTimestamp";
      v40 = [(id)qword_1000801E0 dateFormatter];
      v39 = sub_100003ADC((uint64_t)[v7 spawnTimestamp], v33, v31);
      v38 = [v40 stringFromDate:v39];
      v46[2] = v38;
      v45[3] = @"exitTimestamp";
      v37 = [(id)qword_1000801E0 dateFormatter];
      v36 = sub_100003ADC((uint64_t)[v7 exitTimestamp], v33, v31);
      v35 = [v37 stringFromDate:v36];
      v46[3] = v35;
      v45[4] = @"relativeSpawnTimeToHangStart";
      id v8 = [v7 spawnTimestamp];
      id v9 = [v7 spawnTimestamp];
      if ((unint64_t)v8 <= a3) {
        unint64_t v10 = a3 - (void)v9;
      }
      else {
        unint64_t v10 = (unint64_t)v9 - a3;
      }
      if ((unint64_t)v8 <= a3) {
        CFStringRef v11 = @"-%.3lfs";
      }
      else {
        CFStringRef v11 = @"%.3lfs";
      }
      double v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, sub_100003C34(v10));
      v46[4] = v12;
      v45[5] = @"relativeExitTimeToHangStart";
      id v13 = [v7 exitTimestamp];
      id v14 = [v7 exitTimestamp];
      if ((unint64_t)v13 <= a3) {
        unint64_t v15 = a3 - (void)v14;
      }
      else {
        unint64_t v15 = (unint64_t)v14 - a3;
      }
      if ((unint64_t)v13 <= a3) {
        CFStringRef v16 = @"-%.3lfs";
      }
      else {
        CFStringRef v16 = @"%.3lfs";
      }
      v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, sub_100003C34(v15));
      v46[5] = v17;
      v45[6] = @"processUptime";
      dispatch_time_t v18 = +[NSString stringWithFormat:](NSString, @"%.3lfs", sub_100003C34((unsigned char *)[v7 exitTimestamp] - (unsigned char *)objc_msgSend(v7, "spawnTimestamp")));
      v46[6] = v18;
      v45[7] = @"exitReasonCode";
      v19 = sub_100015A94([v7 exitReasonNamespace], [v7 exitReasonCode]);
      v46[7] = v19;
      v45[8] = @"exitReasonNamespace";
      objc_super v20 = sub_100014E94([v7 exitReasonNamespace]);
      v46[8] = v20;
      v45[9] = @"jetsamPriority";
      v21 = [NSNumber numberWithUnsignedShort:[v7 jetsam_priority]];
      v46[9] = v21;
      __int16 v22 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:10];

      if ((unint64_t)[v7 exitTimestamp] < a3
        || (id v23 = [v7 exitTimestamp], v24 = v28, (unint64_t)v23 >= a4))
      {
        if ((unint64_t)[v7 exitTimestamp] >= a4) {
          v24 = v29;
        }
        else {
          v24 = v30;
        }
      }
      [v24 addObject:v22];

      uint64_t v5 = v6;
    }
    while ((unint64_t)[(id)qword_1000801E0 count] > v6++);
  }
  v43[0] = @"exitedDuringHang";
  v43[1] = @"exitedBeforeHang";
  v44[0] = v28;
  v44[1] = v30;
  v43[2] = @"exitedAfterHang";
  v44[2] = v29;
  v26 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];

  return v26;
}

- (BOOL)isCurrent:(unint64_t)a3 withHUDUpdateInterval:(double)a4
{
  return sub_100003BDC(a3 - self->_requestedToRenderTimestamp) < 200.0;
}

- (BOOL)isTimedOut
{
  return 0;
}

- (unint64_t)compareValue
{
  return self->_exitTimestamp;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)spawnTimestamp
{
  return self->_spawnTimestamp;
}

- (unint64_t)exitTimestamp
{
  return self->_exitTimestamp;
}

- (unint64_t)requestedToRenderTimestamp
{
  return self->_requestedToRenderTimestamp;
}

- (void)setRequestedToRenderTimestamp:(unint64_t)a3
{
  self->_requestedToRenderTimestamp = a3;
}

- (unint64_t)exitReasonCode
{
  return self->_exitReasonCode;
}

- (int)pid
{
  return self->_pid;
}

- (unsigned)exitReasonNamespace
{
  return self->_exitReasonNamespace;
}

- (NSString)exitReasonNamespaceString
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)jetsam_priority
{
  return self->_jetsam_priority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitReasonNamespaceString, 0);

  objc_storeStrong((id *)&self->_processName, 0);
}

@end