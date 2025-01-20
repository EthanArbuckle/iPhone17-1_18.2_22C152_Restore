@interface _DASUtils
+ (id)processNameFromPID:(int)a3;
@end

@implementation _DASUtils

+ (id)processNameFromPID:(int)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long buffer = 0u;
  long long v9 = 0u;
  if (proc_pidinfo(a3, 13, 1uLL, &buffer, 64) != 64
    || (long long v6 = v9,
        char v7 = 0,
        +[NSString stringWithUTF8String:&v6],
        (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = +[_DASDaemonLogger logForCategory:@"dasUtils"];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100100AC0(v4);
    }

    v3 = 0;
  }

  return v3;
}

@end