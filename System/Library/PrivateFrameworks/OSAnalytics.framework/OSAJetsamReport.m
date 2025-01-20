@interface OSAJetsamReport
+ (int)instrumentEventsWithAudioAssertionState:(id)a3 visibliltyEndowmentState:(id)a4;
+ (int64_t)_daysSince1970;
+ (jetsam_snapshot)fetchSnapshotWithFlags:(unsigned int)a3 error:(id *)a4;
- (BOOL)alreadyDumpedSuspendedJetsamLogToday;
- (BOOL)isActionable;
- (BOOL)saveWithOptions:(id)a3;
- (OSAJetsamReport)initWithIncidentID:(id)a3 visibilityEndowmentState:(id)a4 audioAssertionState:(id)a5;
- (id)additionalIPSMetadata;
- (id)appleCareDetails;
- (id)problemType;
- (id)reportNamePrefix;
- (unint64_t)getEventPriority:(id)a3 terminationReason:(unint64_t)a4 priority:(int64_t)a5;
- (void)_setDumpedSuspendedJetsamLog;
- (void)acquireJetsamData;
- (void)acquireJetsamDataWithFlags:(unsigned int)a3;
- (void)dealloc;
- (void)fetchWiredMemoryInfo;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)instrumentEvents:(BOOL)a3;
- (void)updateLogLimitFor:(unint64_t)a3;
@end

@implementation OSAJetsamReport

- (OSAJetsamReport)initWithIncidentID:(id)a3 visibilityEndowmentState:(id)a4 audioAssertionState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)OSAJetsamReport;
  v12 = [(OSAReport *)&v22 init];
  v13 = v12;
  if (v12)
  {
    if (v9) {
      objc_storeStrong((id *)&v12->super._incidentID, a3);
    }
    if (v10) {
      v14 = (NSSet *)v10;
    }
    else {
      v14 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    visibilityEndowmentState = v13->_visibilityEndowmentState;
    v13->_visibilityEndowmentState = v14;

    if (v11) {
      v16 = (NSSet *)v11;
    }
    else {
      v16 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    }
    audioAssertionState = v13->_audioAssertionState;
    v13->_audioAssertionState = v16;

    largestActiveApp = v13->_largestActiveApp;
    v13->_largestActiveApp = (NSString *)&stru_1EFE17BD0;

    uint64_t v19 = objc_opt_new();
    killedActiveApps = v13->_killedActiveApps;
    v13->_killedActiveApps = (NSMutableArray *)v19;
  }
  return v13;
}

- (void)dealloc
{
  free(self->_snapshot);
  v3.receiver = self;
  v3.super_class = (Class)OSAJetsamReport;
  [(OSAJetsamReport *)&v3 dealloc];
}

- (id)problemType
{
  return @"298";
}

- (id)appleCareDetails
{
  v7[3] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_killedActiveApps count])
  {
    -[NSMutableArray componentsJoinedByString:](self->_killedActiveApps, "componentsJoinedByString:", @";",
    objc_super v3 = self->_largestActiveApp);
    v7[1] = v3;
    v4 = [NSNumber numberWithUnsignedLongLong:self->_wiredBytes];
    v7[2] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)reportNamePrefix
{
  return @"JetsamEvent";
}

- (id)additionalIPSMetadata
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7 = @"incident_id";
  objc_super v3 = [(OSAReport *)self incidentID];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = (void *)[v4 mutableCopy];

  if (self->_aleFlag) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"ale_flag"];
  }
  return v5;
}

- (BOOL)saveWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OSAJetsamReport;
  BOOL v4 = [(OSAReport *)&v6 saveWithOptions:a3];
  [(OSAJetsamReport *)self instrumentEvents:v4];
  return v4;
}

+ (jetsam_snapshot)fetchSnapshotWithFlags:(unsigned int)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = memorystatus_control();
  if ((v5 & 0x80000000) != 0)
  {
    v8 = NSString;
    id v9 = __error();
    objc_msgSend(v8, "stringWithFormat:", @"memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) failed: %s", strerror(*v9), v20);
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  if (!v5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"kernel returned (0) from memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) -- no jetsam data available", v19, v20);
    goto LABEL_13;
  }
  uint64_t v7 = v5;
  if (v5 >= 0xC9 && __ROR8__(0xAF8AF8AF8AF8AF8BLL * (v5 - 200), 3) >= 0xEA0EA0EA0EA0EBuLL)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"memorystatus_control gave snapshot size (%lu) not multiple of jetsam entry type (%lu)", v5 - 200, 280);
LABEL_13:
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  id v10 = (jetsam_snapshot *)malloc_type_malloc(v5, 0x3D3D2569uLL);
  if (v10)
  {
    uint64_t v11 = memorystatus_control();
    if (v11 != v6)
    {
      uint64_t v16 = v11;
      v17 = NSString;
      v18 = __error();
      objc_msgSend(v17, "stringWithFormat:", @"memorystatus_control returned unexpected value - %d: %s", v16, strerror(*v18));
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      free(v10);
LABEL_14:
      id v10 = 0;
      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
    unint64_t v12 = ((unint64_t)v6 - 200) / 0x118;
    unint64_t var4 = v10->var4;
    if (v12 >= var4)
    {
      id v14 = 0;
      goto LABEL_19;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Got fewer jetsam entries from the kernel; received %zu, expected %zu",
      (v7 - 200) / 0x118uLL,
      var4);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v10->unint64_t var4 = v12;
    if (!v14) {
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unable to allocate %d bytes for jetsam snapshot", v6);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14) {
      goto LABEL_19;
    }
  }
LABEL_15:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (a4)
  {
    id v14 = v14;
    *a4 = v14;
  }
LABEL_19:

  return v10;
}

- (unint64_t)getEventPriority:(id)a3 terminationReason:(unint64_t)a4 priority:(int64_t)a5
{
  if ([&unk_1EFE25DF0 containsObject:a3])
  {
    self->_aleFlag = 1;
    return 3;
  }
  else if (a4 <= 9 && ((1 << a4) & 0x284) != 0)
  {
    return 0;
  }
  else if (a5 <= 89)
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

- (void)updateLogLimitFor:(unint64_t)a3
{
  char v5 = 0;
  uint64_t v6 = &unk_1EFE254D8;
  uint64_t v7 = @"298_LOW_PRIORITY";
  switch(a3)
  {
    case 0uLL:
      goto LABEL_5;
    case 1uLL:
      uint64_t v6 = &unk_1EFE254F0;
      goto LABEL_6;
    case 2uLL:
      char v5 = 0;
      uint64_t v6 = &unk_1EFE254F0;
      uint64_t v7 = @"298_HIGH_PRIORITY";
      goto LABEL_5;
    case 3uLL:
      uint64_t v6 = 0;
      char v5 = 1;
      uint64_t v7 = @"298_ALE";
LABEL_5:
      [(NSMutableDictionary *)self->super._logWritingOptions setObject:v7 forKeyedSubscript:@"LogType"];
      if ((v5 & 1) == 0)
      {
LABEL_6:
        logWritingOptions = self->super._logWritingOptions;
        [(NSMutableDictionary *)logWritingOptions setObject:v6 forKeyedSubscript:@"set-log-limit"];
      }
      break;
    default:
      return;
  }
}

+ (int)instrumentEventsWithAudioAssertionState:(id)a3 visibliltyEndowmentState:(id)a4
{
  return 0;
}

- (void)instrumentEvents:(BOOL)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  snapshot = self->_snapshot;
  if (snapshot)
  {
    if (snapshot->var4)
    {
      BOOL v4 = self;
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      uint64_t v7 = &unk_1EFE25508;
      if (a3) {
        uint64_t v7 = &unk_1EFE254D8;
      }
      v37 = v7;
      do
      {
        v8 = (char *)snapshot + v5 * 280;
        if (snapshot->var5[v5].var8)
        {
          id v9 = (unsigned int *)(v8 + 200);
          uint64_t v10 = processName();
          uint64_t v11 = killDescription(*((void *)v8 + 35));
          mach_timebase_info info = 0;
          unint64_t v12 = 0;
          unint64_t v47 = v6;
          if (!mach_timebase_info(&info) && info.denom) {
            unint64_t v12 = (unint64_t)((double)((snapshot->var5[v5].var23 - snapshot->var5[v5].var22)
          }
                                            * info.numer
                                            / info.denom
                                            / 0xF4240)
                                   / 1000.0);
          audioAssertionState = v4->_audioAssertionState;
          id v14 = [NSNumber numberWithInt:*v9];
          uint64_t v15 = [(NSSet *)audioAssertionState containsObject:v14];

          visibilityEndowmentState = v4->_visibilityEndowmentState;
          v17 = [NSNumber numberWithInt:*v9];
          uint64_t v18 = [(NSSet *)visibilityEndowmentState containsObject:v17];

          memset(out, 0, 37);
          uint64_t v19 = (char *)snapshot + v5 * 280;
          uuid_unparse_lower(snapshot->var5[v5].var6, out);
          v51[0] = @"name";
          v51[1] = @"reason";
          v52[0] = v10;
          v52[1] = v11;
          v51[2] = @"priority";
          v46 = [NSNumber numberWithInt:snapshot->var5[v5].var2];
          v52[2] = v46;
          v51[3] = @"uptime";
          v45 = [NSNumber numberWithUnsignedLongLong:v12];
          v52[3] = v45;
          v51[4] = @"audio";
          v44 = [NSNumber numberWithBool:v15];
          v52[4] = v44;
          v51[5] = @"visible";
          v43 = [NSNumber numberWithBool:v18];
          v52[5] = v43;
          v51[6] = @"uuid";
          v42 = [NSString stringWithUTF8String:out];
          v52[6] = v42;
          v51[7] = @"max_pages";
          v41 = [NSNumber numberWithUnsignedLongLong:snapshot->var5[v5].var10];
          v52[7] = v41;
          v51[8] = @"suspended";
          v40 = [NSNumber numberWithBool:snapshot->var5[v5].var3 & 1];
          v52[8] = v40;
          v51[9] = @"frozen";
          v39 = [NSNumber numberWithBool:(snapshot->var5[v5].var3 >> 1) & 1];
          v52[9] = v39;
          v51[10] = @"thawed";
          uint64_t v20 = [NSNumber numberWithBool:(snapshot->var5[v5].var3 >> 2) & 1];
          v52[10] = v20;
          v51[11] = @"tracked";
          v21 = [NSNumber numberWithBool:(snapshot->var5[v5].var3 >> 3) & 1];
          v52[11] = v21;
          v51[12] = @"can_idle_exit";
          id v22 = [NSNumber numberWithBool:(snapshot->var5[v5].var3 >> 4) & 1];
          v52[12] = v22;
          v51[13] = @"dirty";
          uint64_t v23 = [NSNumber numberWithBool:(*((_DWORD *)v19 + 61) >> 5) & 1];
          v52[13] = v23;
          v51[14] = @"assertion";
          v24 = [NSNumber numberWithBool:(*((_DWORD *)v19 + 61) >> 6) & 1];
          v51[15] = @"logwritten";
          v52[14] = v24;
          v52[15] = v37;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:16];
          v25 = (__CFString *)v11;
          v27 = v26 = (__CFString *)v10;
          AnalyticsSendEvent();

          v28 = v26;
          v29 = v25;

          if (OSARTCIsProcessOfInterest(v28))
          {
            v49[0] = @"crk";
            v30 = +[OSASystemConfiguration sharedInstance];
            v31 = [v30 crashReporterKey];
            v50[0] = v31;
            v49[1] = @"dirty";
            uint64_t v32 = [NSNumber numberWithBool:(*((_DWORD *)v19 + 61) >> 5) & 1];
            v33 = (void *)v32;
            if (v28) {
              v34 = v28;
            }
            else {
              v34 = @"<unknown>";
            }
            v50[1] = v32;
            v50[2] = v34;
            v49[2] = @"name";
            v49[3] = @"reason";
            if (v29) {
              v35 = v29;
            }
            else {
              v35 = @"<unknown>";
            }
            v50[3] = v35;
            v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:4];
            rtcsc_send(2004, 2004, v36);
          }
          BOOL v4 = self;
          snapshot = self->_snapshot;
          unint64_t v6 = v47;
        }
        ++v6;
        ++v5;
      }
      while (snapshot->var4 > v6);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[OSAJetsamReport instrumentEvents:]();
  }
}

- (void)fetchWiredMemoryInfo
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a1 unsignedIntValue];
  OUTLINED_FUNCTION_0_0();
  int v7 = a2;
  __int16 v8 = v5;
  int v9 = a3;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "memorystatus_control for command %d returned unexpected valud of %d which does not match buffer size of %d", v6, 0x14u);
}

- (void)acquireJetsamDataWithFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  self->super._capture_time = CFAbsoluteTimeGetCurrent();
  id v33 = 0;
  __int16 v5 = +[OSAJetsamReport fetchSnapshotWithFlags:v3 error:&v33];
  id v6 = v33;
  self->_snapshot = v5;
  if (v6) {
    [(NSMutableArray *)self->super._notes addObject:v6];
  }
  int v7 = +[OSASystemConfiguration sharedInstance];
  if ([v7 appleInternal])
  {
    __int16 v8 = [(OSAJetsamReport *)self problemType];
    int v9 = [v8 isEqualToString:@"298"];

    if (v9) {
      [(OSAJetsamReport *)self fetchWiredMemoryInfo];
    }
  }
  else
  {
  }
  snapshot = self->_snapshot;
  if (snapshot)
  {
    id v31 = v6;
    self->_wiredBytes = *MEMORY[0x1E4F14B00] * snapshot->var3.var5;
    self->_isSuspendedOnlyJetsam = 1;
    if (snapshot->var4)
    {
      unint64_t v11 = 0;
      unint64_t v12 = 0;
      v13 = 0;
      unint64_t v32 = 0;
      uint64_t v14 = 288;
      do
      {
        uint64_t v15 = (char *)snapshot + v14;
        uint64_t v16 = *(void *)((char *)snapshot + v14 - 8);
        BOOL v17 = v16 == 2 || v16 == 7;
        if (v17
          || ((int v23 = *((_DWORD *)v15 - 11), v16) ? (v24 = (*((_DWORD *)v15 - 11) & 1) == 0) : (v24 = 0),
              v24
           && ((v23 & 0x10) == 0
            || (*(void *)((char *)snapshot + v14 - 16) & 0x12B1FLL) != 0
            || (int v25 = strcmp((const char *)snapshot + v14 - 84, "SpringBoard"), (v23 & 0x20) != 0)
            || !v25)))
        {
          self->_isSuspendedOnlyJetsam = 0;
        }
        if (!v12 || *(unint64_t *)((char *)&snapshot->var0 + v14) > *((void *)v12 + 11)) {
          unint64_t v12 = v15 - 88;
        }
        if ((*((unsigned char *)snapshot + v14 - 44) & 1) == 0
          && (!v13 || *(unint64_t *)((char *)&snapshot->var0 + v14) > *((void *)v13 + 11)))
        {
          v13 = v15 - 88;
        }
        if (v16)
        {
          ++self->_killed_or_suspended_count;
          uint64_t v18 = processName();
          if ((*((unsigned char *)snapshot + v14 - 44) & 1) == 0) {
            [(NSMutableArray *)self->_killedActiveApps addObject:v18];
          }
          unint64_t v19 = [(OSAJetsamReport *)self getEventPriority:v18 terminationReason:*((void *)v15 - 1) priority:*(int *)((char *)snapshot + v14 - 48)];
          unint64_t v20 = v32;
          if (v32 <= v19) {
            unint64_t v20 = v19;
          }
          unint64_t v32 = v20;
          v21 = killDescription(*((void *)v15 - 1));
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            int v22 = *((_DWORD *)v15 - 22);
            *(_DWORD *)buf = 138543874;
            v35 = v18;
            __int16 v36 = 1024;
            int v37 = v22;
            __int16 v38 = 2114;
            v39 = v21;
            _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Process %{public}@ [%d] killed by jetsam reason %{public}@", buf, 0x1Cu);
          }

          snapshot = self->_snapshot;
        }
        ++v11;
        v14 += 280;
      }
      while (snapshot->var4 > v11);
    }
    else
    {
      unint64_t v32 = 0;
      v13 = 0;
      unint64_t v12 = 0;
    }
    v26 = v13;
    v27 = [(OSAJetsamReport *)self problemType];
    char v28 = [v27 isEqualToString:@"298"];

    if (v28) {
      [(OSAJetsamReport *)self updateLogLimitFor:v32];
    }
    if (v12)
    {
      processName();
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = @"none";
    }
    id v6 = v31;
    objc_storeStrong((id *)&self->_largestProcess, v29);
    if (v12) {

    }
    if (v26)
    {
      processName();
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = @"none";
      v26 = 0;
    }
    objc_storeStrong((id *)&self->_largestActiveApp, v30);
    if (v26) {
  }
    }
}

- (void)acquireJetsamData
{
}

- (BOOL)alreadyDumpedSuspendedJetsamLogToday
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"lastSuspendedLogDumpedDaySince1970"];

  if (v3)
  {
    uint64_t v4 = [v3 integerValue];
    BOOL v5 = v4 == +[OSAJetsamReport _daysSince1970];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setDumpedSuspendedJetsamLog
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v2, "setInteger:forKey:", +[OSAJetsamReport _daysSince1970](OSAJetsamReport, "_daysSince1970"), @"lastSuspendedLogDumpedDaySince1970");
}

- (BOOL)isActionable
{
  if (self->_snapshot)
  {
    if (self->_killed_or_suspended_count)
    {
      if (!self->_isSuspendedOnlyJetsam
        || [(OSAReport *)self isAppleTV]
        || ![(OSAJetsamReport *)self alreadyDumpedSuspendedJetsamLogToday])
      {
        return 1;
      }
      notes = self->super._notes;
      uint64_t v4 = NSString;
      BOOL v5 = @"suspended-only jetsam log already dumped today";
    }
    else
    {
      notes = self->super._notes;
      uint64_t v4 = NSString;
      BOOL v5 = @"No processes were jettisoned (either killed or suspended)";
    }
    int v7 = [v4 stringWithFormat:v5];
    [(NSMutableArray *)notes addObject:v7];
  }
  return 0;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  v147[7] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void (**)(id, void *))a4;
  v146[0] = @"incident";
  v120 = [(OSAReport *)self incidentID];
  v147[0] = v120;
  v146[1] = @"crashReporterKey";
  v117 = +[OSASystemConfiguration sharedInstance];
  v114 = [v117 crashReporterKey];
  v147[1] = v114;
  v146[2] = @"product";
  v111 = +[OSASystemConfiguration sharedInstance];
  id v6 = [v111 modelCode];
  v147[2] = v6;
  v146[3] = @"build";
  int v7 = +[OSASystemConfiguration sharedInstance];
  __int16 v8 = [v7 productNameVersionBuildString];
  v147[3] = v8;
  v146[4] = @"kernel";
  int v9 = [(id)objc_opt_class() kernelVersionDescription];
  v147[4] = v9;
  v146[5] = @"date";
  uint64_t v10 = OSADateFormat(1u, self->super._capture_time);
  v147[5] = v10;
  v146[6] = @"codeSigningMonitor";
  unint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "codeSigningMonitor"));
  v147[6] = v11;
  unint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:7];
  v5[2](v5, v12);

  v13 = v5;
  uint64_t v14 = [(OSAJetsamReport *)self problemType];
  uint64_t v15 = +[OSALog commonFieldsForBody:v14];
  v5[2](v5, v15);

  if ([(NSString *)self->_event_reason length] | self->_event_code)
  {
    event_reason = (__CFString *)self->_event_reason;
    if (!event_reason) {
      event_reason = &stru_1EFE17BD0;
    }
    v145[0] = event_reason;
    v144[0] = @"eventReason";
    v144[1] = @"eventCode";
    BOOL v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    v144[2] = &unk_1EFE25568;
    v145[1] = v17;
    v145[2] = &unk_1EFE254D8;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v145 forKeys:v144 count:3];
    v5[2](v5, v18);
  }
  if (self->_snapshot)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    v99 = v5;
    if (info.denom) {
      unint64_t v19 = ((self->_snapshot->var1 - self->_snapshot->var0) * info.numer / info.denom + 500000) / 0xF4240;
    }
    else {
      unint64_t v19 = 0xFFFFFFFFLL;
    }
    v142[0] = @"timeDelta";
    v121 = [NSNumber numberWithInt:v19];
    v143[0] = v121;
    v142[1] = @"memoryStatus";
    v140[0] = @"memoryPages";
    v138[0] = @"free";
    v118 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var0];
    v139[0] = v118;
    v138[1] = @"active";
    v115 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var1];
    v139[1] = v115;
    v138[2] = @"inactive";
    v112 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var2];
    v139[2] = v112;
    v138[3] = @"purgeable";
    v109 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var4];
    v139[3] = v109;
    v138[4] = @"wired";
    v107 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var5];
    v139[4] = v107;
    v138[5] = @"speculative";
    v105 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var6];
    v139[5] = v105;
    v138[6] = @"throttled";
    v102 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var3];
    v139[6] = v102;
    v138[7] = @"fileBacked";
    v100 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var7];
    v139[7] = v100;
    v138[8] = @"anonymous";
    v98 = [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var8];
    v139[8] = v98;
    v97 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v139 forKeys:v138 count:9];
    v141[0] = v97;
    v140[1] = @"compressions";
    v96 = [NSNumber numberWithUnsignedLongLong:self->_snapshot->var3.var10];
    v141[1] = v96;
    v140[2] = @"decompressions";
    v95 = [NSNumber numberWithUnsignedLongLong:self->_snapshot->var3.var11];
    v141[2] = v95;
    v140[3] = @"compressorSize";
    [NSNumber numberWithUnsignedInt:self->_snapshot->var3.var9];
    unint64_t v20 = v104 = self;
    v141[3] = v20;
    v140[4] = @"uncompressed";
    v21 = [NSNumber numberWithUnsignedLongLong:v104->_snapshot->var3.var12];
    v141[4] = v21;
    v140[5] = @"zoneMapSize";
    int v22 = [NSNumber numberWithUnsignedLongLong:v104->_snapshot->var3.var13];
    v141[5] = v22;
    v140[6] = @"zoneMapCap";
    int v23 = [NSNumber numberWithUnsignedLongLong:v104->_snapshot->var3.var14];
    v141[6] = v23;
    v140[7] = @"largestZone";
    BOOL v24 = [NSString stringWithUTF8String:v104->_snapshot->var3.var16];
    v141[7] = v24;
    v140[8] = @"largestZoneSize";
    int v25 = [NSNumber numberWithUnsignedLongLong:v104->_snapshot->var3.var15];
    v141[8] = v25;
    v140[9] = @"pageSize";
    v26 = [NSNumber numberWithUnsignedLong:*MEMORY[0x1E4F14AE8]];
    v141[9] = v26;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:10];
    v143[1] = v27;
    v142[2] = @"genCounter";
    char v28 = [NSNumber numberWithUnsignedLongLong:v104->_snapshot->var2];
    largestProcess = v104->_largestProcess;
    v143[2] = v28;
    v143[3] = largestProcess;
    v142[3] = @"largestProcess";
    v142[4] = &unk_1EFE25568;
    v143[4] = &unk_1EFE254D8;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:5];
    v99[2](v99, v30);

    self = v104;
    v103 = [MEMORY[0x1E4F1CA48] array];
    id v31 = +[OSASystemConfiguration sharedInstance];
    int v101 = [v31 appleInternal];

    snapshot = v104->_snapshot;
    if (snapshot->var4)
    {
      uint64_t v33 = 0;
      uint64_t v34 = 472;
      do
      {
        uint64_t v122 = v33;
        v35 = (char *)snapshot + v34;
        memset(out, 0, 37);
        uuid_unparse_lower((const unsigned __int8 *)snapshot + v34 - 216, out);
        __int16 v36 = [MEMORY[0x1E4F1CA48] array];
        int v37 = v36;
        if (*((unsigned char *)snapshot + v34 - 228)) {
          [v36 addObject:@"suspended"];
        }
        uint64_t v38 = *((void *)v35 - 25);
        if (v38)
        {
          [v37 addObject:@"audio"];
          uint64_t v38 = *((void *)v35 - 25);
          if ((v38 & 4) == 0)
          {
LABEL_15:
            if ((v38 & 2) != 0) {
              goto LABEL_65;
            }
            goto LABEL_16;
          }
        }
        else if ((v38 & 4) == 0)
        {
          goto LABEL_15;
        }
        [v37 addObject:@"accessory"];
        uint64_t v38 = *((void *)v35 - 25);
        if ((v38 & 2) != 0)
        {
LABEL_65:
          [v37 addObject:@"location"];
          if ((*((void *)v35 - 25) & 0x10) == 0) {
            goto LABEL_18;
          }
LABEL_17:
          [v37 addObject:@"bluetooth"];
          goto LABEL_18;
        }
LABEL_16:
        if ((v38 & 0x10) != 0) {
          goto LABEL_17;
        }
LABEL_18:
        visibilityEndowmentState = self->_visibilityEndowmentState;
        uint64_t v40 = [NSNumber numberWithInt:*((unsigned int *)v35 - 68)];
        LOBYTE(visibilityEndowmentState) = [(NSSet *)visibilityEndowmentState containsObject:v40];

        v41 = @"frontmost";
        if ((visibilityEndowmentState & 1) != 0
          || (v41 = @"background", (*(v35 - 200) & 8) != 0))
        {
          [v37 addObject:v41];
        }
        uint64_t v42 = *((void *)v35 - 25);
        if ((v42 & 0x100) != 0)
        {
          [v37 addObject:@"resume"];
          uint64_t v42 = *((void *)v35 - 25);
          if ((v42 & 0x200) == 0)
          {
LABEL_23:
            if ((v42 & 0x800) == 0) {
              goto LABEL_24;
            }
            goto LABEL_69;
          }
        }
        else if ((v42 & 0x200) == 0)
        {
          goto LABEL_23;
        }
        [v37 addObject:@"suspending"];
        uint64_t v42 = *((void *)v35 - 25);
        if ((v42 & 0x800) == 0)
        {
LABEL_24:
          if ((v42 & 0x2000) == 0) {
            goto LABEL_26;
          }
LABEL_25:
          [v37 addObject:@"continuous"];
          goto LABEL_26;
        }
LABEL_69:
        [v37 addObject:@"periodic"];
        if ((*((void *)v35 - 25) & 0x2000) != 0) {
          goto LABEL_25;
        }
LABEL_26:
        if (!objc_msgSend(v37, "count", v41))
        {
          if (strcmp((const char *)snapshot + v34 - 268, "SpringBoard"))
          {
            v43 = @"background";
            if (*((void *)v35 - 25)
              || ([v37 addObject:@"daemon"],
                  v43 = @"idle",
                  (*((_DWORD *)v35 - 57) & 0x30) == 0x10))
            {
              [v37 addObject:v43];
            }
          }
        }
        v135[0] = @"name";
        v110 = processName();
        v136[0] = v110;
        v135[1] = @"pid";
        v108 = [NSNumber numberWithInt:*((unsigned int *)v35 - 68)];
        v136[1] = v108;
        v135[2] = @"uuid";
        v106 = [NSString stringWithUTF8String:out];
        v136[2] = v106;
        v135[3] = @"cpuTime";
        v116 = snapshot;
        uint64_t v119 = v34;
        v44 = (char *)snapshot + v34;
        v45 = [NSNumber numberWithDouble:(double)*(uint64_t *)((char *)snapshot + v34 - 40) / 1000000.0+ (double)*(uint64_t *)((char *)snapshot + v34 - 48)];
        v136[3] = v45;
        v135[4] = @"rpages";
        [NSNumber numberWithUnsignedLongLong:*((void *)v44 - 23)];
        unint64_t v47 = v46 = v37;
        v136[4] = v47;
        v135[5] = @"purgeable";
        v48 = [NSNumber numberWithUnsignedLongLong:*((void *)v44 - 21)];
        v136[5] = v48;
        v135[6] = @"lifetimeMax";
        v49 = [NSNumber numberWithUnsignedLongLong:*((void *)v44 - 22)];
        v136[6] = v49;
        v135[7] = @"fds";
        v50 = [NSNumber numberWithUnsignedInt:*((unsigned int *)v44 - 56)];
        v136[7] = v50;
        v136[8] = v46;
        v113 = v46;
        v135[8] = @"states";
        v135[9] = @"age";
        v51 = [NSNumber numberWithUnsignedLongLong:self->_snapshot->var0 - *((void *)v44 - 10)];
        v136[9] = v51;
        v135[10] = @"priority";
        v52 = [NSNumber numberWithInt:*((unsigned int *)v44 - 58)];
        v136[10] = v52;
        v135[11] = @"freeze_skip_reason:";
        int v53 = *((_DWORD *)v44 - 55);
        uint64_t v54 = @"(unknown-reason)";
        if (v53 <= 0xAu) {
          uint64_t v54 = off_1E5D1FAB8[(char)v53];
        }
        v136[11] = v54;
        v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:v135 count:12];
        v56 = (void *)[v55 mutableCopy];

        if (*((void *)v44 - 8))
        {
          v57 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          [v56 setObject:v57 forKeyedSubscript:@"idleDelta"];
        }
        uint64_t v58 = (uint64_t)v116 + v119;
        uint64_t v59 = *(void *)((char *)v116 + v119 - 72);
        self = v104;
        if (v59)
        {
          v60 = [NSNumber numberWithUnsignedLongLong:v59 - v104->_snapshot->var0];
          [v56 setObject:v60 forKeyedSubscript:@"killDelta"];

          v61 = [NSNumber numberWithUnsignedLongLong:*(void *)(v58 - 88)];
          [v56 setObject:v61 forKeyedSubscript:@"genCount"];
        }
        unint64_t v62 = *(void *)(v58 - 192);
        if (v62)
        {
          v63 = killDescription(v62);
          [v56 setObject:v63 forKeyedSubscript:@"reason"];
        }
        v64 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v65 = (uint64_t)v116 + v119;
        if (*(void *)((char *)v116 + v119 - 160) || *(void *)(v65 - 152))
        {
          v66 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          v134[0] = v66;
          v67 = [NSNumber numberWithUnsignedLongLong:*(void *)(v65 - 152)];
          v134[1] = v67;
          v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:2];
          [v64 setObject:v68 forKeyedSubscript:@"internal"];
        }
        if (*(void *)((char *)v116 + v119 - 24))
        {
          v69 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          [v64 setObject:v69 forKeyedSubscript:@"frozen_to_swap_pages"];
        }
        v70 = [NSNumber numberWithUnsignedLongLong:*(void *)((char *)v116 + v119 - 96)];
        [v56 setObject:v70 forKeyedSubscript:@"mem_regions"];

        if (v101)
        {
          uint64_t v71 = (uint64_t)v116 + v119;
          if (*(void *)((char *)v116 + v119 - 144) || *(void *)(v71 - 136))
          {
            v72 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
            v133[0] = v72;
            v73 = [NSNumber numberWithUnsignedLongLong:*(void *)(v71 - 136)];
            v133[1] = v73;
            v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:2];
            [v64 setObject:v74 forKeyedSubscript:@"purgeable_nv"];
          }
          uint64_t v75 = (uint64_t)v116 + v119;
          if (*(void *)((char *)v116 + v119 - 128) || *(void *)(v75 - 120))
          {
            v76 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
            v132[0] = v76;
            v77 = [NSNumber numberWithUnsignedLongLong:*(void *)(v75 - 120)];
            v132[1] = v77;
            v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:2];
            [v64 setObject:v78 forKeyedSubscript:@"alternate"];
          }
          if (*(void *)((char *)v116 + v119 - 112))
          {
            v79 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
            [v64 setObject:v79 forKeyedSubscript:@"iokit"];
          }
          if (*(void *)((char *)v116 + v119 - 104))
          {
            v80 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
            [v64 setObject:v80 forKeyedSubscript:@"table"];
          }
          if (*(unint64_t *)((char *)&v116->var0 + v119))
          {
            v81 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
            [v56 setObject:v81 forKeyedSubscript:@"neuralPages"];
          }
        }
        if ([v64 count]) {
          [v56 setObject:v64 forKeyedSubscript:@"physicalPages"];
        }
        uint64_t v82 = (uint64_t)v116 + v119;
        if (*(void *)((char *)v116 + v119 - 56))
        {
          v83 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
          [v56 setObject:v83 forKeyedSubscript:@"coalition"];
        }
        v84 = [NSNumber numberWithUnsignedLongLong:*(void *)(v82 - 16)];
        [v56 setObject:v84 forKeyedSubscript:@"csFlags"];

        v85 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v82 - 8)];
        [v56 setObject:v85 forKeyedSubscript:@"csTrustLevel"];

        [v103 addObject:v56];
        uint64_t v33 = v122 + 1;
        snapshot = v104->_snapshot;
        uint64_t v34 = v119 + 280;
      }
      while (snapshot->var4 > v122 + 1);
    }
    v130[0] = @"processes";
    v130[1] = &unk_1EFE25568;
    v131[0] = v103;
    v131[1] = &unk_1EFE254D8;
    v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v131 forKeys:v130 count:2];
    v13 = v99;
    v99[2](v99, v86);
  }
  v87 = +[OSASystemConfiguration sharedInstance];
  int v88 = [v87 appleInternal];

  if (v88)
  {
    if ([(NSMutableArray *)self->_zones count])
    {
      zones = self->_zones;
      v128 = @"zones";
      v129 = zones;
      v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
      v13[2](v13, v90);
    }
    if ([(NSMutableArray *)self->_tags count])
    {
      tags = self->_tags;
      v126 = @"tags";
      v127 = tags;
      v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v127 forKeys:&v126 count:1];
      v13[2](v13, v92);
    }
  }
  if ([(NSMutableArray *)self->super._notes count])
  {
    notes = self->super._notes;
    v124 = @"notes";
    v125 = notes;
    v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v125 forKeys:&v124 count:1];
    v13[2](v13, v94);
  }
  if (self->_isSuspendedOnlyJetsam) {
    [(OSAJetsamReport *)self _setDumpedSuspendedJetsamLog];
  }
}

+ (int64_t)_daysSince1970
{
  int64_t result = time(0);
  if (result >= 0) {
    return result / 0x15180uLL;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_audioAssertionState, 0);
  objc_storeStrong((id *)&self->_visibilityEndowmentState, 0);
  objc_storeStrong((id *)&self->_event_reason, 0);
  objc_storeStrong((id *)&self->_killedActiveApps, 0);
  objc_storeStrong((id *)&self->_largestActiveApp, 0);
  objc_storeStrong((id *)&self->_largestProcess, 0);
}

- (void)instrumentEvents:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Not sending Core Analytics events because snapshot is missing.", v0, 2u);
}

@end