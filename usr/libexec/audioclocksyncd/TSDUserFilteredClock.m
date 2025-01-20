@interface TSDUserFilteredClock
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- (BOOL)addTimestampWithMachAbsolute:(unint64_t)a3 andDomainTime:(unint64_t)a4 error:(id *)a5;
- (BOOL)isAdaptive;
- (BOOL)resetFilterToNominal:(BOOL)a3 error:(id *)a4;
- (BOOL)resetSyncServiceWithError:(id *)a3;
- (unint64_t)nominalDomainInterval;
- (unint64_t)nominalMachInterval;
- (unsigned)filterShift;
@end

@implementation TSDUserFilteredClock

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v9[0] = @"IOProviderClass";
  v9[1] = @"IOPropertyMatch";
  v10[0] = @"IOTimeSyncUserFilteredService";
  CFStringRef v7 = @"ClockIdentifier";
  v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  v8 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v5;
}

- (BOOL)addTimestampWithMachAbsolute:(unint64_t)a3 andDomainTime:(unint64_t)a4 error:(id *)a5
{
  int v9 = 0;
  v22[0] = a3;
  v22[1] = a4;
  v6 = [(TSDKernelClock *)self connection];
  unsigned __int8 v7 = [v6 callMethodWithSelector:18 scalarInputs:v22 scalarInputCount:2 scalarOutputs:0 scalarOutputCount:&v9 error:a5];

  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v11 = "result == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    v17 = &unk_100030E47;
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDUserFilteredClock.m";
    __int16 v20 = 1024;
    int v21 = 55;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (BOOL)resetSyncServiceWithError:(id *)a3
{
  int v7 = 0;
  v4 = [(TSDKernelClock *)self connection];
  unsigned __int8 v5 = [v4 callMethodWithSelector:19 scalarInputs:0 scalarInputCount:0 scalarOutputs:0 scalarOutputCount:&v7 error:a3];

  if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    int v9 = "result == YES";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    uint64_t v15 = &unk_100030E47;
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDUserFilteredClock.m";
    __int16 v18 = 1024;
    int v19 = 67;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v5;
}

- (BOOL)resetFilterToNominal:(BOOL)a3 error:(id *)a4
{
  BOOL v21 = a3;
  int v8 = 0;
  unsigned __int8 v5 = [(TSDKernelClock *)self connection];
  unsigned __int8 v6 = [v5 callMethodWithSelector:20 scalarInputs:&v21 scalarInputCount:1 scalarOutputs:0 scalarOutputCount:&v8 error:a4];

  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v10 = "result == YES";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    __int16 v16 = &unk_100030E47;
    __int16 v17 = 2080;
    __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDUserFilteredClock.m";
    __int16 v19 = 1024;
    int v20 = 80;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v6;
}

- (unint64_t)nominalMachInterval
{
  v2 = [(TSDKernelClock *)self service];
  v3 = [v2 iodPropertyForKey:@"NominalMachInterval"];

  if (v3) {
    id v4 = [v3 unsignedLongLongValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (unint64_t)nominalDomainInterval
{
  v2 = [(TSDKernelClock *)self service];
  v3 = [v2 iodPropertyForKey:@"NominalDomainInterval"];

  if (v3) {
    id v4 = [v3 unsignedLongLongValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (unsigned)filterShift
{
  v2 = [(TSDKernelClock *)self service];
  v3 = [v2 iodPropertyForKey:@"FilterShift"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isAdaptive
{
  v2 = [(TSDKernelClock *)self service];
  v3 = [v2 iodPropertyForKey:@"Adaptive"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

@end