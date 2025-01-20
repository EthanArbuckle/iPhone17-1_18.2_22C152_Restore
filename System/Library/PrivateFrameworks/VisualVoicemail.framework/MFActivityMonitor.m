@interface MFActivityMonitor
+ (id)currentTracebleMonitor;
+ (int64_t)voicemailTaskTypeForTaskName:(id)a3;
- (int64_t)voicemailTaskType:(id)a3;
@end

@implementation MFActivityMonitor

+ (id)currentTracebleMonitor
{
  v2 = +[MFActivityMonitor currentMonitor];
  v3 = sub_1000295DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218242;
    v6 = v2;
    __int16 v7 = 2112;
    v8 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I [IVM] for monitor %p.%@", (uint8_t *)&v5, 0x16u);
  }

  return v2;
}

+ (int64_t)voicemailTaskTypeForTaskName:(id)a3
{
  id v3 = a3;
  if (!qword_1000E0890)
  {
    v9[0] = @"Synchronizing";
    v9[1] = @"Caching Bodies";
    v10[0] = &off_1000C84F8;
    v10[1] = &off_1000C84E0;
    v9[2] = @"Pushing Flags";
    v9[3] = @"Setting Default Greeting";
    v10[2] = &off_1000C8510;
    v10[3] = &off_1000C8528;
    v9[4] = @"Setting Custom Greeting";
    v9[5] = @"Retrieving Greeting";
    v10[4] = &off_1000C8528;
    v10[5] = &off_1000C8540;
    v9[6] = @"Changing PIN";
    v9[7] = @"Retrieving Body";
    v10[6] = &off_1000C8558;
    v10[7] = &off_1000C84E0;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:8];
    int v5 = (void *)qword_1000E0890;
    qword_1000E0890 = v4;
  }
  if (v3)
  {
    v6 = [(id)qword_1000E0890 objectForKey:v3];
    id v7 = [v6 integerValue];
  }
  else
  {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (int64_t)voicemailTaskType:(id)a3
{
  id v4 = a3;
  int v5 = +[NSValue valueWithPointer:self];
  v6 = [v4 objectForKey:v5];

  id v7 = sub_1000295DC();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v13 = 136315906;
      v14 = "???";
      __int16 v15 = 2080;
      v16 = " ";
      __int16 v17 = 2112;
      v18 = v6;
      __int16 v19 = 2048;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] voicemailTaskType '%@': found in map %p", (uint8_t *)&v13, 0x2Au);
    }

    int64_t v9 = +[MFActivityMonitor voicemailTaskTypeForTaskName:v6];
  }
  else
  {
    if (v8)
    {
      v10 = [(MFActivityMonitor *)self taskName];
      int v13 = 136315906;
      v14 = "???";
      __int16 v15 = 2080;
      v16 = " ";
      __int16 v17 = 2112;
      v18 = v10;
      __int16 v19 = 2048;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I %s%s[IVM] voicemailTaskType '%@': using from monitor %p", (uint8_t *)&v13, 0x2Au);
    }
    v11 = [(MFActivityMonitor *)self taskName];
    int64_t v9 = +[MFActivityMonitor voicemailTaskTypeForTaskName:v11];
  }
  return v9;
}

@end