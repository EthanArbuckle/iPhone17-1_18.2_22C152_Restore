@interface OSACrackShotReport
+ (id)getDisplayState;
+ (id)getThermalPressureLevel;
+ (void)getDisplayState;
+ (void)getThermalPressureLevel;
- (BOOL)isSnapshotDisabled;
- (BOOL)saveWithOptions:(id)a3;
- (NSDictionary)spindump;
- (OSACrackShotReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7;
- (id)additionalIPSMetadata;
- (id)decode_cpuType;
- (id)decode_reason:(exit_reason_snapshot *)a3 reason:(id)a4;
- (id)initForPid:(int)a3 exitSnapshot:(exit_reason_snapshot *)a4 reason:(id)a5;
- (id)problemType;
- (id)reportNamePrefix;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)setSpindump:(id)a3;
@end

@implementation OSACrackShotReport

- (OSACrackShotReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)OSACrackShotReport;
  v16 = [(OSAStackShotReport *)&v26 initForPid:v11 process:v13 withReason:0 exceptionCode:0 exceptionCodeCount:0 stackshotFlags:0];
  v17 = (OSACrackShotReport *)v16;
  if (v16)
  {
    objc_storeStrong(v16 + 10, a4);
    objc_storeStrong((id *)&v17->_bundleID, a5);
    uint64_t v18 = [(OSACrackShotReport *)v17 decode_reason:a6 reason:v15];
    termination_mach_timebase_info info = v17->_termination_info;
    v17->_termination_mach_timebase_info info = (NSDictionary *)v18;

    [(OSAStackShotReport *)v17 setReason:v15];
    v20 = +[OSASystemConfiguration sharedInstance];
    v21 = [v20 getTaskingKey:@"disableWatchdogStackshot"];
    v17->_isSnapshotDisabled = [v21 BOOLValue];

    v17->_isSystemWatchdog = 1;
    mach_timebase_info info = 0;
    if (!mach_timebase_info(&info))
    {
      if (info.denom)
      {
        LODWORD(v22) = info.numer;
        double v23 = (double)v22 * 0.000000001 / (double)info.denom;
        v17->_awakeSystemUptime = (unint64_t)(v23 * (double)mach_absolute_time());
      }
    }
  }

  return v17;
}

- (id)initForPid:(int)a3 exitSnapshot:(exit_reason_snapshot *)a4 reason:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  mach_port_name_t name = 0;
  v8 = (ipc_space_t *)MEMORY[0x1E4F14960];
  id v9 = a5;
  if (task_read_for_pid())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v22 = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failed task_read_for_pid", v22, 2u);
    }
    v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4FA8AB0]) initWithTask:name];
    v10 = v12;
    if (v12)
    {
      id v13 = [v12 name];
      uint64_t v11 = (void *)[v13 copy];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "failed to create VMUProcInfo", buf, 2u);
      }
      uint64_t v11 = 0;
    }
    mach_port_deallocate(*v8, name);
  }
  id v14 = [(OSACrackShotReport *)self initWithPid:v6 procName:v11 bundleID:0 exitSnapshot:a4 reason:v9];

  if (v14)
  {
    v14->_isSystemWatchdog = 0;
    if (v10)
    {
      *(&v14->_cpuType + 1) = [v10 cpuType];
      id v15 = [v10 userAppName];
      uint64_t v16 = [v15 copy];
      procPath = v14->_procPath;
      v14->_procPath = (NSString *)v16;

      if ([(NSString *)v14->_procPath length])
      {
        uint64_t v18 = +[OSAReport findBundleAtPath:v14->_procPath withKeys:&unk_1EFE25E38 bundleURL:0];
        uint64_t v19 = [v18 objectForKeyedSubscript:@"CFBundleIdentifier"];
        bundleID = v14->_bundleID;
        v14->_bundleID = (NSString *)v19;
      }
    }
  }

  return v14;
}

- (id)problemType
{
  if (self->_isSystemWatchdog) {
    return @"409";
  }
  else {
    return @"509";
  }
}

- (id)reportNamePrefix
{
  appName = self->super._appName;
  if (appName)
  {
    v3 = [NSString stringWithFormat:@"%@", appName];
  }
  else
  {
    v3 = @"unknown";
  }
  return v3;
}

- (id)additionalIPSMetadata
{
  v15[4] = *MEMORY[0x1E4F143B8];
  appName = (__CFString *)self->super._appName;
  if (!appName) {
    appName = @"Unknown";
  }
  v14[0] = @"name";
  v14[1] = @"app_name";
  v15[0] = appName;
  v15[1] = appName;
  v14[2] = @"share_with_app_devs";
  v4 = NSNumber;
  v5 = +[OSASystemConfiguration sharedInstance];
  uint64_t v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "optIn3rdParty"));
  v15[2] = v6;
  v14[3] = @"incident_id";
  v7 = [(OSAReport *)self incidentID];
  v15[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  id v9 = (void *)[v8 mutableCopy];

  v10 = [(OSAReport *)self etlKey];

  if (v10)
  {
    uint64_t v11 = [(OSAReport *)self etlKey];
    [v9 setObject:v11 forKeyedSubscript:@"etl_key"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v9 setObject:bundleID forKeyedSubscript:@"bundleID"];
  }
  return v9;
}

- (id)decode_reason:(exit_reason_snapshot *)a3 reason:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  if (a3)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:a3->ers_code];
    [v6 setObject:v7 forKeyedSubscript:@"code"];

    v8 = [NSNumber numberWithUnsignedLongLong:a3->ers_flags];
    [v6 setObject:v8 forKeyedSubscript:@"flags"];

    if (a3->ers_namespace == 20)
    {
      uint64_t v18 = &unk_1EFE255B0;
      v19[0] = @"monitoring timed out for service";
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      v10 = [NSNumber numberWithUnsignedLongLong:a3->ers_code];
      uint64_t v11 = [v9 objectForKeyedSubscript:v10];
      [v6 setObject:v11 forKeyedSubscript:@"indicator"];

      v12 = @"WATCHDOG";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<0x%X>", a3->ers_namespace);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = @"<NO_NS>";
  }
  [v6 setObject:v12 forKeyedSubscript:@"namespace"];
  if (v5)
  {
    id v13 = [v5 componentsSeparatedByString:@"\n"];
    id v14 = [v13 valueForKey:@"stringByTrimming"];
    id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != ''"];
    uint64_t v16 = [v14 filteredArrayUsingPredicate:v15];

    if ([v16 count]) {
      [v6 setObject:v16 forKeyedSubscript:@"details"];
    }
  }
  return v6;
}

- (id)decode_cpuType
{
  return OSACPUTypeToString(*((unsigned int *)&self->_cpuType + 1));
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  v97[10] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a4;
  v96[0] = @"incident";
  v61 = [(OSAReport *)self incidentID];
  v97[0] = v61;
  v96[1] = @"crashReporterKey";
  v60 = +[OSASystemConfiguration sharedInstance];
  v58 = [v60 crashReporterKey];
  v97[1] = v58;
  v96[2] = @"modelCode";
  v59 = +[OSASystemConfiguration sharedInstance];
  v57 = [v59 modelCode];
  v97[2] = v57;
  v96[3] = @"pid";
  v56 = [NSNumber numberWithInt:self->super._pid];
  v97[3] = v56;
  v96[4] = @"cpuType";
  v55 = [(OSACrackShotReport *)self decode_cpuType];
  v97[4] = v55;
  v96[5] = @"osVersion";
  v94[0] = @"train";
  v54 = +[OSASystemConfiguration sharedInstance];
  v53 = [v54 osTrain];
  v95[0] = v53;
  v94[1] = @"build";
  uint64_t v6 = +[OSASystemConfiguration sharedInstance];
  v7 = [v6 buildVersion];
  v95[1] = v7;
  v94[2] = @"releaseType";
  v8 = +[OSASystemConfiguration sharedInstance];
  id v9 = [v8 releaseType];
  v95[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:3];
  v97[5] = v10;
  v96[6] = @"captureTime";
  uint64_t v11 = OSADateFormat(2u, self->super.super._capture_time);
  v97[6] = v11;
  v97[7] = &unk_1EFE255C8;
  v96[7] = @"deployVersion";
  v96[8] = @"variant";
  v96[9] = @"variantVersion";
  v97[8] = @"stackshot";
  v97[9] = &unk_1EFE255E0;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v97 forKeys:v96 count:10];
  v5[2](v5, v12);

  id v13 = [(OSACrackShotReport *)self problemType];
  id v14 = +[OSALog commonFieldsForBody:v13];
  v5[2](v5, v14);

  id v15 = +[OSASystemConfiguration sharedInstance];
  LODWORD(v13) = [v15 appleInternal];

  if (v13)
  {
    uint64_t v16 = (void *)MGCopyAnswer();
    v92 = @"codeName";
    v93 = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    v5[2](v5, v17);
  }
  if ([(NSString *)self->super._appName length])
  {
    appName = self->super._appName;
    v90 = @"procName";
    v91 = appName;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
    v5[2](v5, v19);
  }
  if ([(NSString *)self->_procPath length])
  {
    procPath = self->_procPath;
    v88 = @"procPath";
    v89 = procPath;
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v22 = procPath;
    double v23 = [v21 dictionaryWithObjects:&v89 forKeys:&v88 count:1];

    v5[2](v5, v23);
  }
  if (self->_bundleID)
  {
    bundleID = self->_bundleID;
    v86 = @"bundleInfo";
    v84 = @"CFBundleIdentifier";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&bundleID forKeys:&v84 count:1];
    v87 = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    v5[2](v5, v25);
  }
  if ([(NSDictionary *)self->_termination_info count])
  {
    termination_mach_timebase_info info = self->_termination_info;
    v82 = @"termination";
    v83 = termination_info;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    v5[2](v5, v27);
  }
  uint64_t v28 = [(id)objc_opt_class() bootSessionUUID];
  v29 = (void *)v28;
  if (v28)
  {
    v80 = @"bootSessionUUID";
    uint64_t v81 = v28;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    v5[2](v5, v30);
  }
  v78 = @"uptime";
  v31 = [(id)objc_opt_class() reduceToTwoSigFigures:self->_awakeSystemUptime];
  v79 = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
  v5[2](v5, v32);

  uint64_t v33 = +[OSACrackShotReport getThermalPressureLevel];
  v34 = (void *)v33;
  if (v33)
  {
    v76 = @"thermalPressureLevel";
    uint64_t v77 = v33;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    v5[2](v5, v35);
  }
  v36 = [MEMORY[0x1E4F28F80] processInfo];
  int v37 = [v36 isLowPowerModeEnabled];

  if (v37) {
    v5[2](v5, &unk_1EFE25A40);
  }
  uint64_t v38 = +[OSACrackShotReport getDisplayState];
  v39 = (void *)v38;
  if (v38)
  {
    v74 = @"displayState";
    uint64_t v75 = v38;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    v5[2](v5, v40);
  }
  if (![(OSACrackShotReport *)self isSnapshotDisabled])
  {
    if (self->super._ss_trace_buffer)
    {
      v72 = &unk_1EFE255F8;
      v73 = @"stackshot";
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      v5[2](v5, v41);

      v42 = objc_alloc_init(OSABinaryImageCatalog);
      [(OSAStackShotReport *)self decodeKCDataWithBlock:v5 withTuning:&unk_1EFE25A68 usingCatalog:v42];
      v70 = @"binaryImages";
      v43 = [(OSABinaryImageCatalog *)v42 reportUsedImages];
      v71 = v43;
      v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v5[2](v5, v44);

      [(OSABinaryImageCatalog *)v42 appendNotesTo:self->super.super._notes];
      v68 = &unk_1EFE25610;
      v69 = &stru_1EFE17BD0;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      v5[2](v5, v45);
    }
    v46 = [(OSACrackShotReport *)self spindump];

    if (v46)
    {
      v66 = @"spindump";
      v47 = [(OSACrackShotReport *)self spindump];
      v67 = v47;
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      v5[2](v5, v48);
    }
  }
  additionalPayload = self->super._additionalPayload;
  if (additionalPayload)
  {
    v64 = @"additionalPayload";
    v65 = additionalPayload;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    v5[2](v5, v50);
  }
  [(NSMutableArray *)self->super.super._notes addObject:@"This is a watchdog-triggered termination event, and not expected to be well-represented in the legacy crash format"];
  if (self->_isSnapshotDisabled) {
    [(NSMutableArray *)self->super.super._notes addObject:@"stackshot inclusion disabled"];
  }
  if ([(NSMutableArray *)self->super.super._notes count])
  {
    notes = self->super.super._notes;
    v62[0] = @"reportNotes";
    v62[1] = &unk_1EFE25628;
    v63[0] = notes;
    v63[1] = &unk_1EFE255B0;
    v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
    v5[2](v5, v52);
  }
}

- (BOOL)saveWithOptions:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OSACrackShotReport;
  BOOL v4 = [(OSAReport *)&v8 saveWithOptions:a3];
  if (self->_isSystemWatchdog) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 4;
  }
  uint64_t v6 = [(OSAReport *)self logfile];
  +[OSADiagnosticsReporterSupport handleDiagnosticLog:v5 logPath:v6 completion:0];

  return v4;
}

+ (id)getThermalPressureLevel
{
  int out_token = 0;
  if (!notify_register_check((const char *)*MEMORY[0x1E4F14918], &out_token))
  {
    uint64_t state64 = 0;
    if (notify_get_state(out_token, &state64))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[OSACrackShotReport getThermalPressureLevel]();
      }
      v2 = 0;
      goto LABEL_24;
    }
    v3 = NSString;
    if ((int)state64 > 29)
    {
      switch(state64)
      {
        case 0x1E:
          BOOL v4 = @"ThermalPressureLevelHeavy";
          goto LABEL_23;
        case 0x28:
          BOOL v4 = @"ThermalPressureLevelTrapping";
          goto LABEL_23;
        case 0x32:
          BOOL v4 = @"ThermalPressureLevelSleeping";
          goto LABEL_23;
      }
    }
    else
    {
      switch(state64)
      {
        case 0:
          BOOL v4 = @"ThermalPressureLevelNominal";
          goto LABEL_23;
        case 0xA:
          BOOL v4 = @"ThermalPressureLevelLight";
          goto LABEL_23;
        case 0x14:
          BOOL v4 = @"ThermalPressureLevelModerate";
LABEL_23:
          uint64_t v5 = [NSNumber numberWithUnsignedLongLong:state64];
          uint64_t v6 = [v5 stringValue];
          v2 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

LABEL_24:
          notify_cancel(out_token);
          goto LABEL_25;
      }
    }
    BOOL v4 = @"unknown";
    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[OSACrackShotReport getThermalPressureLevel]();
  }
  v2 = 0;
LABEL_25:
  return v2;
}

+ (id)getDisplayState
{
  int out_token = 0;
  if (notify_register_check("com.apple.iokit.hid.displayStatus", &out_token))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[OSACrackShotReport getDisplayState]();
    }
    return 0;
  }
  uint64_t v3 = 0;
  if (notify_get_state(out_token, &v3))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[OSACrackShotReport getDisplayState]();
    }
    return 0;
  }
  if (v3) {
    return @"ON";
  }
  else {
    return @"OFF";
  }
}

- (NSDictionary)spindump
{
  return self->_spindump;
}

- (void)setSpindump:(id)a3
{
}

- (BOOL)isSnapshotDisabled
{
  return self->_isSnapshotDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spindump, 0);
  objc_storeStrong((id *)&self->_termination_info, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_procPath, 0);
}

+ (void)getThermalPressureLevel
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A7C6D000, MEMORY[0x1E4F14500], v0, "failed to create registration token for pressure level: %d", v1, v2, v3, v4, v5);
}

+ (void)getDisplayState
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1A7C6D000, MEMORY[0x1E4F14500], v0, "failed to create registration token for display state: %d", v1, v2, v3, v4, v5);
}

@end