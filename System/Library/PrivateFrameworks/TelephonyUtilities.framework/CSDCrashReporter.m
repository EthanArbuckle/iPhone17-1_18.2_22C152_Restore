@interface CSDCrashReporter
+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5;
+ (void)simulateCrashReportWithFormat:(id)a3;
+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5;
@end

@implementation CSDCrashReporter

+ (void)simulateCrashReportWithReason:(id)a3 pid:(int)a4 code:(unsigned int)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  if (qword_10058C1B8 != -1) {
    dispatch_once(&qword_10058C1B8, &stru_100504F50);
  }
  char v8 = off_10058C1B0(v6, a5, v7);
  v9 = sub_100008DCC();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003A65C0((uint64_t)v7, v10);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    sub_1003A6638((uint64_t)v7, v10);
  }
}

+ (void)simulateCrashReportFromPID:(int)a3 withKillCode:(unsigned int)a4 usingReasonWithFormat:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = [objc_alloc((Class)NSString) initWithFormat:v8 arguments:&v10];

  [a1 simulateCrashReportWithReason:v9 pid:v6 code:v5];
}

+ (void)simulateCrashReportWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v6];

  [a1 simulateCrashReportWithReason:v5 pid:getpid() code:14593455];
}

@end