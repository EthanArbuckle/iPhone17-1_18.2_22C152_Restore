@interface JSAOSLog
+ (void)logFault:(id)a3;
@end

@implementation JSAOSLog

+ (void)logFault:(id)a3
{
  id v3 = a3;
  v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    sub_84528((uint64_t)v3, v4);
  }
}

@end