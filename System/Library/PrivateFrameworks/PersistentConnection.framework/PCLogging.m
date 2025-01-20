@interface PCLogging
+ (id)logFileDirectory;
@end

@implementation PCLogging

+ (id)logFileDirectory
{
  if (logFileDirectory_pred != -1) {
    dispatch_once(&logFileDirectory_pred, &__block_literal_global_22);
  }
  v2 = (void *)logFileDirectory_directory;
  return v2;
}

void __29__PCLogging_logFileDirectory__block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  int Value = CFBooleanGetValue(v0);
  CFRelease(v0);
  if (Value) {
    v2 = @"Logs/PersistentConnection";
  }
  else {
    v2 = @"Logs/CrashReporter/PersistentConnection";
  }
  id v5 = [@"/var/mobile" stringByAppendingPathComponent:@"Library"];
  uint64_t v3 = [v5 stringByAppendingPathComponent:v2];
  v4 = (void *)logFileDirectory_directory;
  logFileDirectory_directory = v3;
}

@end