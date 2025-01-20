@interface BIXPCAlarm
+ (id)getNameForEvent:(id)a3;
+ (void)deleteAlarmWithName:(id)a3;
+ (void)handleAlarmForEvent:(id)a3;
+ (void)setAlarmWithName:(id)a3 withClock:(int)a4 afterSeconds:(double)a5 wakeUpAP:(BOOL)a6;
@end

@implementation BIXPCAlarm

+ (void)setAlarmWithName:(id)a3 withClock:(int)a4 afterSeconds:(double)a5 wakeUpAP:(BOOL)a6
{
  id v9 = a3;
  if (!qword_1000396B0)
  {
    uint64_t v10 = sub_100016A74("BIXPCAlarm");
    v11 = (void *)qword_1000396B0;
    qword_1000396B0 = v10;
  }
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  v13 = v12;
  if (v12)
  {
    xpc_dictionary_set_BOOL(v12, "ShouldWake", a6);
    switch(a4)
    {
      case 0:
        int64_t v17 = (uint64_t)(((double)time(0) + a5) * 1000000000.0);
        xpc_dictionary_set_string(v13, "Type", "Walltime");
        xpc_dictionary_set_date(v13, "Date", v17);
LABEL_13:
        [v9 UTF8String];
        xpc_set_event();
        goto LABEL_16;
      case 8:
        uint64_t v14 = (unint64_t)((double)clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) + a5 * 1000000000.0);
        v15 = "Uptime";
        goto LABEL_12;
      case 4:
        uint64_t v14 = (unint64_t)((double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) + a5 * 1000000000.0);
        v15 = "Monotonic";
LABEL_12:
        xpc_dictionary_set_string(v13, "Type", v15);
        xpc_dictionary_set_uint64(v13, "Date", v14);
        goto LABEL_13;
    }
    v18 = qword_1000396B0;
    if (os_log_type_enabled((os_log_t)qword_1000396B0, OS_LOG_TYPE_ERROR)) {
      sub_1000217DC(v18);
    }
  }
  else
  {
    v16 = qword_1000396B0;
    if (os_log_type_enabled((os_log_t)qword_1000396B0, OS_LOG_TYPE_DEBUG)) {
      sub_100021798(v16);
    }
  }
LABEL_16:
}

+ (void)deleteAlarmWithName:(id)a3
{
  [a3 UTF8String];

  xpc_set_event();
}

+ (id)getNameForEvent:(id)a3
{
  string = xpc_dictionary_get_string(a3, _xpc_event_key_name);

  return +[NSString stringWithUTF8String:string];
}

+ (void)handleAlarmForEvent:(id)a3
{
  id v4 = a3;
  id v7 = [a1 getNameForEvent:v4];
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  xpc_dictionary_get_remote_connection(v4);
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  if (reply && v6) {
    xpc_connection_send_message(v6, reply);
  }
  [a1 deleteAlarmWithName:v7];
}

@end