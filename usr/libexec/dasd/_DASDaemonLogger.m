@interface _DASDaemonLogger
+ (id)defaultCategory;
+ (id)inferCarryStatusXPCCriteria;
+ (id)logForCategory:(id)a3;
+ (id)signpostForCategory:(id)a3;
+ (unint64_t)makeIDForString:(id)a3 forLog:(id)a4;
+ (unint64_t)removeIDForString:(id)a3;
+ (void)initialize;
@end

@implementation _DASDaemonLogger

+ (id)logForCategory:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001C43F8);
  v4 = [(id)qword_1001C43E0 objectForKeyedSubscript:v3];
  if (!v4) {
    v4 = os_log_create("com.apple.duetactivityscheduler", (const char *)[v3 UTF8String]);
  }
  [(id)qword_1001C43E0 setObject:v4 forKeyedSubscript:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001C43F8);

  return v4;
}

+ (id)defaultCategory
{
  return (id)qword_1001C43D8;
}

+ (void)initialize
{
  if (qword_1001C43D0 != -1) {
    dispatch_once(&qword_1001C43D0, &stru_1001780B8);
  }
}

+ (id)signpostForCategory:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001C43F8);
  v4 = [(id)qword_1001C43E8 objectForKeyedSubscript:v3];
  if (!v4) {
    v4 = os_log_create("com.apple.dasd.signpost", (const char *)[v3 UTF8String]);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001C43F8);

  return v4;
}

+ (unint64_t)makeIDForString:(id)a3 forLog:(id)a4
{
  id v5 = a3;
  os_signpost_id_t v6 = os_signpost_id_generate((os_log_t)a4);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001C43F8);
  v7 = +[NSNumber numberWithUnsignedLongLong:v6];
  [(id)qword_1001C43F0 setObject:v7 forKeyedSubscript:v5];

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001C43F8);
  return v6;
}

+ (unint64_t)removeIDForString:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&dword_1001C43F8);
  v4 = [(id)qword_1001C43F0 objectForKeyedSubscript:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 unsignedLongLongValue];
    [(id)qword_1001C43F0 removeObjectForKey:v3];
  }
  else
  {
    id v6 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1001C43F8);

  return (unint64_t)v6;
}

+ (id)inferCarryStatusXPCCriteria
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_GRACE_PERIOD, 1000);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);

  return v2;
}

@end