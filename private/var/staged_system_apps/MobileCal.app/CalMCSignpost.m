@interface CalMCSignpost
+ (id)calendarSignpostHandle;
+ (void)beginLaunch:(BOOL)a3;
+ (void)endLaunchToView:(int64_t)a3 extended:(BOOL)a4;
@end

@implementation CalMCSignpost

+ (void)beginLaunch:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [a1 calendarSignpostHandle];
  BOOL v5 = os_signpost_enabled(v4);
  if (v3)
  {
    if (v5)
    {
      __int16 v9 = 0;
      v6 = "ExtendedLaunch";
      v7 = (uint8_t *)&v9;
LABEL_6:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v6, " enableTelemetry=YES ", v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v8 = 0;
    v6 = "Launch";
    v7 = (uint8_t *)&v8;
    goto LABEL_6;
  }
}

+ (void)endLaunchToView:(int64_t)a3 extended:(BOOL)a4
{
  BOOL v4 = a4;
  if ((unint64_t)a3 > 4) {
    BOOL v5 = "unknown";
  }
  else {
    BOOL v5 = (&off_1001D5368)[a3];
  }
  v6 = [a1 calendarSignpostHandle];
  BOOL v7 = os_signpost_enabled(v6);
  if (v4)
  {
    if (v7)
    {
      int v9 = 136446210;
      v10 = v5;
      __int16 v8 = "ExtendedLaunch";
LABEL_9:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v8, " enableTelemetry=YES LaunchedView=%{public, signpost.telemetry:string1, Name=LaunchedView}s", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    int v9 = 136446210;
    v10 = v5;
    __int16 v8 = "Launch";
    goto LABEL_9;
  }
}

+ (id)calendarSignpostHandle
{
  if (qword_1002169A8 != -1) {
    dispatch_once(&qword_1002169A8, &stru_1001D5348);
  }
  v2 = (void *)qword_1002169A0;

  return v2;
}

@end