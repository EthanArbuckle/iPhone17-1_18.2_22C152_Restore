@interface OSASystemWatchdogCrashReport
- (OSASystemWatchdogCrashReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7;
- (id)problemType;
@end

@implementation OSASystemWatchdogCrashReport

- (OSASystemWatchdogCrashReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)OSASystemWatchdogCrashReport;
  return [(OSACrackShotReport *)&v8 initWithPid:*(void *)&a3 procName:a4 bundleID:a5 exitSnapshot:a6 reason:a7];
}

- (id)problemType
{
  return @"409";
}

@end