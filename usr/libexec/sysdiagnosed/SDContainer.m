@interface SDContainer
- (BOOL)addSDUnits:(id)a3;
- (BOOL)evaluateCollectionFlags;
- (BOOL)evaluateCollectionFlagsWithOverlay:(unint64_t)a3 withName:(id)a4;
- (BOOL)execute;
- (BOOL)executeFromCallback;
- (NSMutableArray)units;
- (NSString)destination;
- (NSString)name;
- (OS_os_activity)executionActivity;
- (SDContainer)init;
- (SDContainer)initWithName:(id)a3 andDestination:(id)a4 withDelegate:(id)a5;
- (SDRuntimeFlagDelegate)runtimeFlagDelegate;
- (unint64_t)runtimeChecks;
- (void)applyContainerOverride:(id)a3;
- (void)setDestination:(id)a3;
- (void)setExecutionActivity:(id)a3;
- (void)setName:(id)a3;
- (void)setRuntimeChecks:(unint64_t)a3;
- (void)setRuntimeFlagDelegate:(id)a3;
- (void)setUnits:(id)a3;
- (void)updateContainerWithOverride;
@end

@implementation SDContainer

- (SDContainer)init
{
  return [(SDContainer *)self initWithName:@"none" andDestination:@"none" withDelegate:0];
}

- (SDContainer)initWithName:(id)a3 andDestination:(id)a4 withDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SDContainer;
  v11 = [(SDContainer *)&v18 init];
  v12 = v11;
  if (v11)
  {
    [(SDContainer *)v11 setName:v8];
    objc_storeStrong((id *)&v12->_destination, a4);
    uint64_t v13 = +[NSMutableArray array];
    units = v12->_units;
    v12->_units = (NSMutableArray *)v13;

    objc_storeWeak((id *)&v12->_runtimeFlagDelegate, v10);
    os_activity_t v15 = _os_activity_create((void *)&_mh_execute_header, "Container activity", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    executionActivity = v12->_executionActivity;
    v12->_executionActivity = (OS_os_activity *)v15;
  }
  return v12;
}

- (BOOL)addSDUnits:(id)a3
{
  id v4 = a3;
  v5 = [(SDContainer *)self units];
  [v5 addObjectsFromArray:v4];

  return 1;
}

- (BOOL)execute
{
}

- (BOOL)executeFromCallback
{
}

- (BOOL)evaluateCollectionFlags
{
  BOOL v3 = [(SDContainer *)self evaluateCollectionFlagsWithOverlay:[(SDContainer *)self runtimeChecks] withName:0];
  if (v3)
  {
    id v4 = sub_10002820C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(SDContainer *)self name];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Executing container: %@...", buf, 0xCu);
    }
    v6 = +[SDResourceManager sharedResourceManager];
    [v6 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];

    v7 = +[SDResourceManager sharedResourceManager];
    id v8 = [(SDContainer *)self name];
    [v7 stdoutWrite:@"Executing container: %@...", v8];

    id v9 = +[SDResourceManager sharedResourceManager];
    id v10 = [(SDContainer *)self name];
    [v9 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"Executing container: %@...", v10 category msg];
  }
  return v3;
}

- (BOOL)evaluateCollectionFlagsWithOverlay:(unint64_t)a3 withName:(id)a4
{
  id v57 = a4;
  unint64_t v56 = [(SDContainer *)self runtimeChecks] | a3;
  uint64_t v6 = sub_100048604();
  int v7 = sub_100024904();
  uint64_t v8 = 2;
  if (!v7) {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v8 | v6;
  if (sub_100024970()) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 0;
  }
  int v11 = sub_100024A24();
  uint64_t v12 = 4096;
  if (!v11) {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v9 | v10 | v12;
  v55 = [(SDContainer *)self runtimeFlagDelegate];
  if ([v55 shouldRunLogCopyTasks]) {
    uint64_t v14 = 8;
  }
  else {
    uint64_t v14 = 0;
  }
  os_activity_t v15 = [(SDContainer *)self runtimeFlagDelegate];
  unsigned int v16 = [v15 shouldRunLogGenerationTasks];
  uint64_t v17 = 16;
  if (!v16) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v13 | v14 | v17;
  v19 = [(SDContainer *)self runtimeFlagDelegate];
  if ([v19 shouldRunTimeSensitiveTasks]) {
    uint64_t v20 = 32;
  }
  else {
    uint64_t v20 = 0;
  }
  v21 = [(SDContainer *)self runtimeFlagDelegate];
  unsigned int v22 = [v21 shouldRunOSLogArchive];
  uint64_t v23 = 64;
  if (!v22) {
    uint64_t v23 = 0;
  }
  uint64_t v24 = v20 | v23;
  v25 = [(SDContainer *)self runtimeFlagDelegate];
  unsigned int v26 = [v25 shouldRunIDSDump];
  uint64_t v27 = 128;
  if (!v26) {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v18 | v24 | v27;
  v29 = [(SDContainer *)self runtimeFlagDelegate];
  if ([v29 shouldPostProcess]) {
    uint64_t v30 = 256;
  }
  else {
    uint64_t v30 = 0;
  }
  v31 = [(SDContainer *)self runtimeFlagDelegate];
  unsigned int v32 = [v31 shouldGetFeedbackData];
  uint64_t v33 = 1024;
  if (!v32) {
    uint64_t v33 = 0;
  }
  uint64_t v34 = v30 | v33;
  int v35 = sub_1000247E8();
  uint64_t v36 = 0x2000;
  if (!v35) {
    uint64_t v36 = 0;
  }
  uint64_t v37 = v34 | v36;
  v38 = [(SDContainer *)self runtimeFlagDelegate];
  unsigned int v39 = [v38 isTestingMode];
  uint64_t v40 = 0x4000;
  if (!v39) {
    uint64_t v40 = 0;
  }
  uint64_t v41 = v28 | v37 | v40;
  v42 = [(SDContainer *)self runtimeFlagDelegate];
  v43 = [v42 providedPIDorProcess];
  unint64_t v44 = v41 | ((unint64_t)(v43 != 0) << 9);

  unint64_t v45 = v44;
  unint64_t v46 = v56 & ~v44;
  if (v46)
  {
    v47 = sub_10002820C();
    BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
    if (v57)
    {
      if (v48)
      {
        v49 = [(SDContainer *)self name];
        *(_DWORD *)buf = 138413058;
        v59 = v49;
        __int16 v60 = 2112;
        unint64_t v61 = (unint64_t)v57;
        __int16 v62 = 2048;
        unint64_t v63 = v56;
        __int16 v64 = 2048;
        unint64_t v65 = v45;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%@ (%@): Req - %04llX State - %04llX. Conditions did not pass.", buf, 0x2Au);
      }
      v50 = +[SDResourceManager sharedResourceManager];
      v51 = [(SDContainer *)self name];
      [v50 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ (%@): Req - %04llX State - %04llX. Conditions did not pass.", v51, v57, v56, v45 category msg];
    }
    else
    {
      if (v48)
      {
        v52 = [(SDContainer *)self name];
        *(_DWORD *)buf = 138412802;
        v59 = v52;
        __int16 v60 = 2048;
        unint64_t v61 = v56;
        __int16 v62 = 2048;
        unint64_t v63 = v45;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%@ : Req - %04llX State - %04llX. Conditions did not pass.", buf, 0x20u);
      }
      v50 = +[SDResourceManager sharedResourceManager];
      v51 = [(SDContainer *)self name];
      [v50 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ : Req - %04llX State - %04llX. Conditions did not pass.", v51, v56, v45, v54 category msg];
    }
  }
  return v46 == 0;
}

- (void)applyContainerOverride:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[SDContainer applyContainerOverride:]", "SDContainer.m", 92, "0 && \"Must use a concrete subclass\"");
}

- (void)updateContainerWithOverride
{
  uint64_t v3 = [(SDContainer *)self runtimeFlagDelegate];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(SDContainer *)self runtimeFlagDelegate];
    uint64_t v6 = [v5 capOverride];

    if (v6)
    {
      int v7 = [(SDContainer *)self runtimeFlagDelegate];
      uint64_t v8 = [v7 capOverride];
      uint64_t v9 = [(SDContainer *)self name];
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];

      if (v10) {
        goto LABEL_6;
      }
      int v11 = [(SDContainer *)self runtimeFlagDelegate];
      uint64_t v12 = [v11 capOverride];
      uint64_t v13 = [(SDContainer *)self name];
      uint64_t v14 = [v13 stringByReplacingOccurrencesOfString:@" task" withString:&stru_1000A1EA8];
      uint64_t v10 = [v12 objectForKeyedSubscript:v14];

      if (v10) {
        goto LABEL_6;
      }
      os_activity_t v15 = [(SDContainer *)self runtimeFlagDelegate];
      unsigned int v16 = [v15 capOverride];
      uint64_t v17 = [(SDContainer *)self name];
      uint64_t v18 = [v17 stringByReplacingOccurrencesOfString:@" collection" withString:&stru_1000A1EA8];
      uint64_t v10 = [v16 objectForKeyedSubscript:v18];

      if (v10)
      {
LABEL_6:
        if (([(SDContainer *)self runtimeChecks] & 0x800) != 0)
        {
          v19 = sub_10002820C();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v20 = [(SDContainer *)self name];
            *(_DWORD *)buf = 138412290;
            uint64_t v34 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ : ENABLED", buf, 0xCu);
          }
          v21 = +[SDResourceManager sharedResourceManager];
          [v21 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
            "com.apple.sysdiagnose",
            "containers");

          unsigned int v22 = +[SDResourceManager sharedResourceManager];
          uint64_t v23 = [(SDContainer *)self name];
          [v22 stdoutWrite:@"%@ : ENABLED", v23];

          uint64_t v24 = +[SDResourceManager sharedResourceManager];
          v25 = [(SDContainer *)self name];
          [v24 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ : ENABLED", v25 category msg];

          [(SDContainer *)self setRuntimeChecks:[(SDContainer *)self runtimeChecks] ^ 0x800];
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![v10 caseInsensitiveCompare:@"disable"])
        {
          [(SDContainer *)self setRuntimeChecks:2048];
          unsigned int v26 = sub_10002820C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = [(SDContainer *)self name];
            *(_DWORD *)buf = 138412290;
            uint64_t v34 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ : DISABLED", buf, 0xCu);
          }
          uint64_t v28 = +[SDResourceManager sharedResourceManager];
          [v28 stdoutWrite:@"Subsystem: %s; Category: %s; Log: "];
            "com.apple.sysdiagnose",
            "containers");

          v29 = +[SDResourceManager sharedResourceManager];
          uint64_t v30 = [(SDContainer *)self name];
          [v29 stdoutWrite:@"%@ : DISABLED", v30];

          v31 = +[SDResourceManager sharedResourceManager];
          unsigned int v32 = [(SDContainer *)self name];
          [v31 logWithSubsystem:"com.apple.sysdiagnose", "containers", @"%@ : DISABLED", v32 category msg];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(SDContainer *)self applyContainerOverride:v10];
          }
        }
      }
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (NSMutableArray)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
}

- (unint64_t)runtimeChecks
{
  return self->_runtimeChecks;
}

- (void)setRuntimeChecks:(unint64_t)a3
{
  self->_runtimeChecks = a3;
}

- (SDRuntimeFlagDelegate)runtimeFlagDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runtimeFlagDelegate);

  return (SDRuntimeFlagDelegate *)WeakRetained;
}

- (void)setRuntimeFlagDelegate:(id)a3
{
}

- (OS_os_activity)executionActivity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExecutionActivity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionActivity, 0);
  objc_destroyWeak((id *)&self->_runtimeFlagDelegate);
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end