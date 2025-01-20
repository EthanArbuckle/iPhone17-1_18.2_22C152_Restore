@interface OSAStackShotReport
- (BOOL)dead_snapshot;
- (BOOL)includeSyslog;
- (BOOL)isActionable;
- (NSArray)frontmostPids;
- (OSAStackShotReport)initWithName:(id)a3 reason:(id)a4 exceptionCode:(int64_t *)a5 exceptionCodeCount:(unsigned int)a6;
- (const)ss_trace_buffer;
- (id)appleCareDetails;
- (id)exceptionCodesDescription;
- (id)getExtraData:(id)a3;
- (id)getStackshotData;
- (id)getVMStatistics;
- (id)initForPid:(int)a3 process:(id)a4 withReason:(id)a5 exceptionCode:(int64_t *)a6 exceptionCodeCount:(unsigned int)a7 stackshotFlags:(unsigned int)a8;
- (id)problemType;
- (id)reportNamePrefix;
- (id)resampleUUIDsForTask:(int)a3 usingCatalog:(id)a4;
- (int)jetsamLevel;
- (int)resampleTruncatedBacktracesForTask:(int)a3 forThreads:(id)a4 usingCatalog:(id)a5 in:(id)a6 usingSymbolicator:(_CSTypeRef)a7;
- (unint64_t)capture_absoluteTime;
- (unsigned)flags;
- (unsigned)ss_sequence;
- (unsigned)ss_trace_length;
- (void)acquireStackshot;
- (void)addCustomField:(const char *)a3 value:(id)a4 into:(id)a5;
- (void)addNotes:(id)a3;
- (void)dealloc;
- (void)decodeKCDataWithBlock:(id)a3 withTuning:(id)a4 usingCatalog:(id)a5;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)queryThermalData;
- (void)setAdditionalPayload:(id)a3;
- (void)setDead_snapshot:(BOOL)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setIncidentID:(id)a3;
- (void)setIncludeSyslog:(BOOL)a3;
- (void)setJetsamLevel:(int)a3;
- (void)setReason:(id)a3;
- (void)setSs_sequence:(unsigned int)a3;
- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8;
- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8 isSnapshotDead:(BOOL)a9;
- (void)useStackshotData:(id)a3 frontmostPids:(id)a4 atTime:(double)a5 machTime:(unint64_t)a6 sequence:(unsigned int)a7;
@end

@implementation OSAStackShotReport

- (id)initForPid:(int)a3 process:(id)a4 withReason:(id)a5 exceptionCode:(int64_t *)a6 exceptionCodeCount:(unsigned int)a7 stackshotFlags:(unsigned int)a8
{
  id v15 = a4;
  id v16 = a5;
  v27.receiver = self;
  v27.super_class = (Class)OSAStackShotReport;
  v17 = [(OSAReport *)&v27 init];
  v18 = v17;
  if (v17)
  {
    v17->_pid = a3;
    objc_storeStrong((id *)&v17->_appName, a4);
    [(OSAStackShotReport *)v18 setReason:v16];
    uint64_t v19 = objc_opt_new();
    frontmostPids = v18->_frontmostPids;
    v18->_frontmostPids = (NSMutableArray *)v19;

    v18->_ss_sequence = -1;
    v18->_exceptionCodeCount = a7;
    v21 = (int64_t *)malloc_type_calloc(8uLL, a7, 0xBCBEB230uLL);
    v18->_exceptionCodes = v21;
    memcpy(v21, a6, 8 * v18->_exceptionCodeCount);
    if ((a8 & 0x80000000) != 0) {
      [(NSMutableDictionary *)v18->super._logWritingOptions setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"override-limit"];
    }
    v18->_flags = a8 & 0x7FFFFFFF;
    v18->_jetsamLevel = -1;
    uint64_t v22 = objc_opt_new();
    extras = v18->_extras;
    v18->_extras = (NSMutableDictionary *)v22;

    v18->_capture_absoluteTime = mach_absolute_time();
    v18->super._capture_time = CFAbsoluteTimeGetCurrent();
    v24 = +[OSASystemConfiguration sharedInstance];
    int v25 = [v24 appleInternal];

    if (v25) {
      v18->_includeSyslog = 1;
    }
    if (initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags__onceToken != -1) {
      dispatch_once(&initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags__onceToken, &__block_literal_global);
    }
  }

  return v18;
}

void __100__OSAStackShotReport_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags___block_invoke()
{
  v0 = +[OSASystemConfiguration sharedInstance];
  uint64_t v1 = [v0 getTaskingKey:@"stackshot_tuning"];
  v2 = (void *)tasked_tuning;
  tasked_tuning = v1;

  if (tasked_tuning)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = (void *)tasked_tuning;
      tasked_tuning = 0;
    }
  }
}

- (OSAStackShotReport)initWithName:(id)a3 reason:(id)a4 exceptionCode:(int64_t *)a5 exceptionCodeCount:(unsigned int)a6
{
  return (OSAStackShotReport *)[(OSAStackShotReport *)self initForPid:0 process:a3 withReason:a4 exceptionCode:a5 exceptionCodeCount:*(void *)&a6 stackshotFlags:0];
}

- (void)dealloc
{
  if (self->_stackshot_config) {
    stackshot_config_dealloc();
  }
  free(self->_exceptionCodes);
  v3.receiver = self;
  v3.super_class = (Class)OSAStackShotReport;
  [(OSAStackShotReport *)&v3 dealloc];
}

- (id)problemType
{
  return @"288";
}

- (id)appleCareDetails
{
  v19[4] = *MEMORY[0x1E4F143B8];
  if (self->_pid)
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4FA8AB0]) initWithPid:self->_pid];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 userAppName];
      CFURLRef v6 = CFURLCreateWithFileSystemPath(0, v5, kCFURLPOSIXPathStyle, 1u);
      if (v6)
      {
        CFURLRef v7 = v6;
        CFURLRef v8 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
        if (v8)
        {
          CFURLRef v9 = v8;
          v10 = CFBundleCreate(0, v8);
          if (v10)
          {
            v11 = v10;
            CFBundleGetIdentifier(v10);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            CFRelease(v11);
          }
          else
          {
            v12 = 0;
          }
          CFRelease(v9);
        }
        else
        {
          v12 = 0;
        }
        CFRelease(v7);
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  appName = self->_appName;
  if (appName)
  {
    v19[0] = &unk_1EFE25460;
    v19[1] = appName;
    v14 = &stru_1EFE17BD0;
    if (v12) {
      id v15 = v12;
    }
    else {
      id v15 = &stru_1EFE17BD0;
    }
    v19[2] = v15;
    reason = self->_reason;
    if (reason)
    {
      v14 = [(NSString *)reason stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    }
    v19[3] = v14;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
    if (reason) {
  }
    }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)reportNamePrefix
{
  appName = self->_appName;
  if (appName)
  {
    v4 = [NSString stringWithFormat:@"stacks+%@", appName];
  }
  else
  {
    v4 = @"stacks";
  }
  if (self->_ss_sequence == -1)
  {
    v5 = &stru_1EFE17BD0;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"-%u", self->_ss_sequence);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  CFURLRef v6 = [(__CFString *)v4 stringByAppendingString:v5];

  return v6;
}

- (void)setIncidentID:(id)a3
{
}

- (void)setReason:(id)a3
{
}

- (id)getExtraData:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_extras objectForKey:a3];
}

- (void)queryThermalData
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&queryThermalData_queried > 30.0)
  {
    queryThermalData_queried = *(void *)&Current;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__OSAStackShotReport_queryThermalData__block_invoke;
    v4[3] = &unk_1E5D1F5F0;
    v4[4] = self;
    +[OSAReport executeWithTimeout:2000 Code:v4];
  }
}

uint64_t __38__OSAStackShotReport_queryThermalData__block_invoke(uint64_t a1)
{
  uint64_t result = OSThermalNotificationCurrentLevel();
  *(_DWORD *)(*(void *)(a1 + 32) + 120) = result;
  return result;
}

- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8
{
}

- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8 isSnapshotDead:(BOOL)a9
{
  id v16 = a5;
  if (self->_stackshot_config)
  {
    stackshot_config_dealloc();
    self->_stackshot_config = 0;
  }
  self->_ss_trace_buffer = a3;
  self->_ss_trace_length = a4;
  self->_ss_sequence = a8;
  if (!self->_pid) {
    self->_pid = -1;
  }
  [(NSMutableArray *)self->_frontmostPids removeAllObjects];
  [(NSMutableArray *)self->_frontmostPids addObjectsFromArray:v16];
  self->super._capture_time = a6;
  self->_capture_absoluteTime = a7;
  self->_dead_snapshot = a9;
}

- (void)useStackshotData:(id)a3 frontmostPids:(id)a4 atTime:(double)a5 machTime:(unint64_t)a6 sequence:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v16 = a4;
  id v13 = v12;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  [(OSAStackShotReport *)self useStackshotBuffer:v14 size:v15 frontmostPids:v16 atTime:a6 machTime:v7 sequence:a5];
}

- (void)acquireStackshot
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->super._notes removeAllObjects];
  if (self->_stackshot_config)
  {
    stackshot_config_dealloc();
    self->_stackshot_config = 0;
  }
  self->_ss_trace_uint64_t buffer = 0;
  self->_ss_trace_length = 0;
  self->_capture_absoluteTime = mach_absolute_time();
  self->super._capture_time = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = stackshot_config_create();
  if (v3)
  {
    v4 = (void *)v3;
    unsigned int flags = self->_flags;
    self->_unsigned int flags = flags | 0x10000;
    if ((flags & 0xFFFEFFFF) == 0)
    {
      self->_unsigned int flags = flags | 0x1200F;
      CFURLRef v6 = [(id)tasked_tuning objectForKeyedSubscript:@"uuid_faulting"];
      uint64_t v7 = v6;
      if (!v6 || [v6 BOOLValue]) {
        self->_flags |= 0x200000u;
      }
      CFURLRef v8 = [(id)tasked_tuning objectForKeyedSubscript:@"waitinfos"];
      CFURLRef v9 = v8;
      if (!v8 || [v8 BOOLValue]) {
        self->_flags |= 0x1000000u;
      }
      v10 = [(id)tasked_tuning objectForKeyedSubscript:@"shared_cache_layout"];
      v11 = v10;
      if (!v10 || [v10 BOOLValue]) {
        self->_flags |= 0x80000u;
      }
    }
    if (stackshot_config_set_flags())
    {
      notes = self->super._notes;
      id v13 = [NSString stringWithFormat:@"Failed to set flags for stackshot config"];
      [(NSMutableArray *)notes addObject:v13];

LABEL_17:
      stackshot_config_dealloc();
      goto LABEL_19;
    }
    uint64_t v29 = stackshot_capture_with_config();
    if (v29)
    {
      uint64_t v30 = v29;
      v31 = self->super._notes;
      v32 = NSString;
      uint64_t v33 = geteuid();
      v34 = objc_msgSend(v32, "stringWithFormat:", @"Stackshot syscall failed (from euid %d) with error %d: %s", v33, v30, strerror(v30));
      [(NSMutableArray *)v31 addObject:v34];

      if (v30 == 2 && (self->_flags & 0x8000) != 0) {
        [(NSMutableArray *)self->super._notes addObject:@"Stackshot key-combo received while a prior stackshot was still processing."];
      }
      goto LABEL_17;
    }
    self->_stackshot_config = v4;
    self->_ss_trace_uint64_t buffer = (const void *)stackshot_config_get_stackshot_buffer();
    self->_ss_trace_length = stackshot_config_get_stackshot_size();
    if ((self->_flags & 0x10000) == 0) {
      self->_jetsamLevel = memorystatus_control();
    }
  }
  else
  {
    uint64_t v14 = self->super._notes;
    uint64_t v15 = [NSString stringWithFormat:@"Failed to allocate memory for stackshot config"];
    [(NSMutableArray *)v14 addObject:v15];
  }
LABEL_19:
  [(NSMutableArray *)self->_frontmostPids removeAllObjects];
  int v16 = memorystatus_control();
  if (v16 < 1)
  {
    v28 = self->super._notes;
    objc_msgSend(NSString, "stringWithFormat:", @"No jetsam status list available (size query returned %d)", (2 * v16));
    v35 = LABEL_44:;
    [(NSMutableArray *)v28 addObject:v35];

    goto LABEL_47;
  }
  v17 = malloc_type_malloc((2 * v16), 0x66BA6F55uLL);
  if (!v17)
  {
    v28 = self->super._notes;
    objc_msgSend(NSString, "stringWithFormat:", @"Failed to allocate memory for jetsam status list", v38);
    goto LABEL_44;
  }
  v18 = v17;
  uint64_t v19 = memorystatus_control();
  if ((int)v19 >= 25)
  {
    unint64_t v20 = v19 / 0x18uLL;
    v21 = v18 + 1;
    while (1)
    {
      uint64_t v22 = *v21;
      uint64_t v23 = *((unsigned int *)v21 - 2);
      if (!proc_name(*((_DWORD *)v21 - 2), &buffer, 0x20u)
        || (buffer == 0x6F42676E69727053 ? (BOOL v24 = v40 == 6582881) : (BOOL v24 = 0), !v24))
      {
        if ((v22 & 0x100) != 0)
        {
          if (*((_DWORD *)v21 - 1) != 100 && (v22 & 1) == 0) {
            goto LABEL_36;
          }
        }
        else if ((v22 & 1) == 0)
        {
          goto LABEL_36;
        }
      }
      frontmostPids = self->_frontmostPids;
      objc_super v27 = [NSNumber numberWithInt:v23];
      [(NSMutableArray *)frontmostPids addObject:v27];

LABEL_36:
      v21 += 3;
      if (!--v20) {
        goto LABEL_46;
      }
    }
  }
  v36 = self->super._notes;
  v37 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to get jetsam status list (query returned %d)", v19);
  [(NSMutableArray *)v36 addObject:v37];

LABEL_46:
  free(v18);
LABEL_47:
  [(OSAStackShotReport *)self queryThermalData];
}

- (id)getStackshotData
{
  if (self->_ss_trace_buffer && self->_ss_trace_length)
  {
    v2 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:");
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)addNotes:(id)a3
{
}

- (void)setAdditionalPayload:(id)a3
{
}

- (BOOL)isActionable
{
  return self->_ss_trace_buffer && self->_ss_trace_length || (self->_flags & 0x8000) == 0;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  v69[10] = *MEMORY[0x1E4F143B8];
  v5 = (void (**)(id, void *))a4;
  v68[0] = @"incident";
  v47 = [(OSAReport *)self incidentID];
  v69[0] = v47;
  v68[1] = @"crashReporterKey";
  v46 = +[OSASystemConfiguration sharedInstance];
  v45 = [v46 crashReporterKey];
  v69[1] = v45;
  v68[2] = @"product";
  v44 = +[OSASystemConfiguration sharedInstance];
  v43 = [v44 modelCode];
  v69[2] = v43;
  v68[3] = @"build";
  CFURLRef v6 = +[OSASystemConfiguration sharedInstance];
  uint64_t v7 = [v6 productNameVersionBuildString];
  v69[3] = v7;
  v68[4] = @"kernel";
  uint64_t v8 = [(id)objc_opt_class() kernelVersionDescription];
  CFURLRef v9 = (void *)v8;
  uint64_t v10 = tasked_tuning;
  if (!tasked_tuning) {
    uint64_t v10 = MEMORY[0x1E4F1CC08];
  }
  v69[4] = v8;
  v69[5] = v10;
  v68[5] = @"tuning";
  v68[6] = @"exception";
  uint64_t v11 = [(OSAStackShotReport *)self exceptionCodesDescription];
  id v12 = (void *)v11;
  reason = (__CFString *)self->_reason;
  if (!reason) {
    reason = &stru_1EFE17BD0;
  }
  v69[6] = v11;
  v69[7] = reason;
  v68[7] = @"reason";
  v68[8] = @"frontmostPids";
  v69[8] = self->_frontmostPids;
  v68[9] = @"codeSigningMonitor";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "codeSigningMonitor"));
  v69[9] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:10];
  v5[2](v5, v15);

  int v16 = [(OSAStackShotReport *)self problemType];
  v17 = +[OSALog commonFieldsForBody:v16];
  v5[2](v5, v17);

  if (self->_pid)
  {
    v66 = @"pid";
    v18 = objc_msgSend(NSNumber, "numberWithInt:");
    v67 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    v5[2](v5, v19);
  }
  additionalPayload = self->_additionalPayload;
  if (additionalPayload)
  {
    v64 = @"additionalPayload";
    v65 = additionalPayload;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    v5[2](v5, v21);
  }
  if (self->_thermalSensorValues)
  {
    v62 = @"thermalData";
    v60[0] = @"thermalLevel";
    uint64_t v22 = [NSNumber numberWithInt:self->_thermalNotificationCurrentLevel];
    v60[1] = @"sensors";
    v61[0] = v22;
    v61[1] = self->_thermalSensorValues;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
    v63 = v23;
    BOOL v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    v5[2](v5, v24);
  }
  int v25 = objc_alloc_init(OSABinaryImageCatalog);
  if (*self->_exceptionCodes == 3131746989) {
    v26 = &unk_1EFE25928;
  }
  else {
    v26 = (void *)tasked_tuning;
  }
  id v27 = v26;
  [(OSAStackShotReport *)self decodeKCDataWithBlock:v5 withTuning:v27 usingCatalog:v25];
  v58 = @"date";
  v28 = OSADateFormat(1u, self->super._capture_time);
  v59 = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  v5[2](v5, v29);

  v56 = @"absoluteTime";
  uint64_t v30 = [NSNumber numberWithUnsignedLongLong:self->_capture_absoluteTime];
  v57 = v30;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v5[2](v5, v31);

  v54 = @"binaryImages";
  v32 = [(OSABinaryImageCatalog *)v25 reportUsedImages];
  v55 = v32;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v5[2](v5, v33);

  [(OSABinaryImageCatalog *)v25 appendNotesTo:self->super._notes];
  if (self->_includeSyslog && includeSection((void *)tasked_tuning, @"syslog"))
  {
    v34 = [(OSAReport *)self getSyslogForPids:0 andOptionalSenders:0 additionalPredicates:0];
    v35 = v34;
    if (v34)
    {
      v52[0] = @"syslog";
      v36 = [v34 reverseObjectEnumerator];
      v37 = [v36 allObjects];
      v52[1] = &unk_1EFE25490;
      v53[0] = v37;
      v53[1] = &unk_1EFE25478;
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
      v5[2](v5, v38);
    }
    else
    {
      [(NSMutableArray *)self->super._notes addObject:@"Syslog query timed out"];
    }
  }
  if ([(NSMutableArray *)self->super._notes count])
  {
    notes = self->super._notes;
    v50 = @"notes";
    v51 = notes;
    int v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    v5[2](v5, v40);
  }
  if ([(NSMutableDictionary *)self->_extras count])
  {
    extras = self->_extras;
    v48 = @"additionalDetails";
    v49 = extras;
    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v5[2](v5, v42);
  }
}

- (id)exceptionCodesDescription
{
  if (self->_exceptionCodeCount)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    if (self->_exceptionCodeCount)
    {
      unint64_t v4 = 0;
      do
      {
        v5 = objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", self->_exceptionCodes[v4]);
        [v3 addObject:v5];

        ++v4;
      }
      while (v4 < self->_exceptionCodeCount);
    }
    CFURLRef v6 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    CFURLRef v6 = &stru_1EFE17BD0;
  }
  return v6;
}

- (id)getVMStatistics
{
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:22];
  uint64_t v39 = 0;
  long long v38 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  *(_OWORD *)host_info64_out = 0u;
  long long v31 = 0u;
  mach_msg_type_number_t host_info64_outCnt = 38;
  host_t v3 = MEMORY[0x1AD0D7EC0]();
  if (host_statistics64(v3, 4, host_info64_out, &host_info64_outCnt))
  {
    [v2 setObject:@"host_statistics64 failed" forKeyedSubscript:@"error"];
  }
  else
  {
    unint64_t v4 = [NSNumber numberWithUnsignedInt:host_info64_out[0]];
    [v2 setObject:v4 forKeyedSubscript:@"free_count"];

    v5 = [NSNumber numberWithUnsignedInt:host_info64_out[1]];
    [v2 setObject:v5 forKeyedSubscript:@"active_count"];

    CFURLRef v6 = [NSNumber numberWithUnsignedInt:host_info64_out[2]];
    [v2 setObject:v6 forKeyedSubscript:@"inactive_count"];

    uint64_t v7 = [NSNumber numberWithUnsignedInt:host_info64_out[3]];
    [v2 setObject:v7 forKeyedSubscript:@"wire_count"];

    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:(void)v31];
    [v2 setObject:v8 forKeyedSubscript:@"zero_fill_count"];

    CFURLRef v9 = [NSNumber numberWithUnsignedLongLong:*((void *)&v31 + 1)];
    [v2 setObject:v9 forKeyedSubscript:@"reactivations"];

    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:(void)v32];
    [v2 setObject:v10 forKeyedSubscript:@"pageins"];

    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:*((void *)&v32 + 1)];
    [v2 setObject:v11 forKeyedSubscript:@"pageouts"];

    id v12 = [NSNumber numberWithUnsignedLongLong:(void)v33];
    [v2 setObject:v12 forKeyedSubscript:@"faults"];

    id v13 = [NSNumber numberWithUnsignedLongLong:*((void *)&v33 + 1)];
    [v2 setObject:v13 forKeyedSubscript:@"cow_faults"];

    uint64_t v14 = [NSNumber numberWithUnsignedLongLong:(void)v34];
    [v2 setObject:v14 forKeyedSubscript:@"lookups"];

    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:*((void *)&v34 + 1)];
    [v2 setObject:v15 forKeyedSubscript:@"hits"];

    int v16 = [NSNumber numberWithUnsignedLongLong:(void)v35];
    [v2 setObject:v16 forKeyedSubscript:@"purges"];

    v17 = [NSNumber numberWithUnsignedInt:DWORD2(v35)];
    [v2 setObject:v17 forKeyedSubscript:@"purgeable_count"];

    v18 = [NSNumber numberWithUnsignedInt:HIDWORD(v35)];
    [v2 setObject:v18 forKeyedSubscript:@"speculative_count"];

    uint64_t v19 = [NSNumber numberWithUnsignedLongLong:(void)v36];
    [v2 setObject:v19 forKeyedSubscript:@"decompressions"];

    unint64_t v20 = [NSNumber numberWithUnsignedLongLong:*((void *)&v36 + 1)];
    [v2 setObject:v20 forKeyedSubscript:@"compressions"];

    v21 = [NSNumber numberWithUnsignedLongLong:(void)v37];
    [v2 setObject:v21 forKeyedSubscript:@"swapins"];

    uint64_t v22 = [NSNumber numberWithUnsignedLongLong:*((void *)&v37 + 1)];
    [v2 setObject:v22 forKeyedSubscript:@"swapouts"];

    uint64_t v23 = [NSNumber numberWithUnsignedInt:v38];
    [v2 setObject:v23 forKeyedSubscript:@"compressor_page_count"];

    BOOL v24 = [NSNumber numberWithUnsignedInt:DWORD1(v38)];
    [v2 setObject:v24 forKeyedSubscript:@"throttled_count"];

    int v25 = [NSNumber numberWithUnsignedInt:DWORD2(v38)];
    [v2 setObject:v25 forKeyedSubscript:@"external_page_count"];

    v26 = [NSNumber numberWithUnsignedInt:HIDWORD(v38)];
    [v2 setObject:v26 forKeyedSubscript:@"internal_page_count"];

    id v27 = [NSNumber numberWithUnsignedLongLong:v39];
    [v2 setObject:v27 forKeyedSubscript:@"total_uncompressed_pages_in_compressor"];
  }
  mach_port_deallocate(*MEMORY[0x1E4F14960], v3);
  return v2;
}

- (int)resampleTruncatedBacktracesForTask:(int)a3 forThreads:(id)a4 usingCatalog:(id)a5 in:(id)a6 usingSymbolicator:(_CSTypeRef)a7
{
  unint64_t var1 = a7.var1;
  unint64_t var0 = a7.var0;
  uint64_t v11 = *(void *)&a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ((CSIsNull() & 1) == 0 && getpid() != v11)
  {
    v17 = (void *)MEMORY[0x1AD0D8030]();
    mach_port_name_t v60 = 0;
    if (task_read_for_pid())
    {
      notes = self->super._notes;
      objc_msgSend(NSString, "stringWithFormat:", @"task_read_for_pid(%d) for resampling backtraces failed", v11);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      [(NSMutableArray *)notes addObject:v19];
      int v16 = 0;
LABEL_35:

      goto LABEL_36;
    }
    unint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4FA8AB8]) initWithPID:v11 options:64];
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "setSymbolicator:", var0, var1);
      thread_act_array_t act_list = 0;
      mach_msg_type_number_t act_listCnt = 0;
      if (!task_threads(v60, &act_list, &act_listCnt))
      {
        if (act_listCnt)
        {
          v46 = v17;
          v48 = v21;
          unint64_t v27 = 0;
          int v16 = 0;
          id v19 = 0;
          v26 = (ipc_space_t *)MEMORY[0x1E4F14960];
          id v47 = v13;
          do
          {
            uint64_t v28 = act_list[v27];
            *(void *)thread_info_out = 0;
            uint64_t v56 = 0;
            uint64_t v57 = 0;
            mach_msg_type_number_t thread_info_outCnt = 6;
            if (thread_info(v28, 4u, thread_info_out, &thread_info_outCnt)) {
              uint64_t v29 = -1;
            }
            else {
              uint64_t v29 = *(void *)thread_info_out;
            }
            uint64_t v30 = [NSNumber numberWithUnsignedLongLong:v29];
            long long v31 = [v13 objectForKeyedSubscript:v30];

            if (v31)
            {
              unint64_t v51 = v27;
              int v50 = v28;
              long long v32 = [v48 sampleThread:v28];
              long long v33 = (uint64_t *)[v32 backtrace];
              v49 = v32;
              uint64_t v34 = [v32 backtraceLength];
              objc_msgSend(NSString, "stringWithFormat:", @"Unmapped pages caused truncated backtrace; re-sampled %d frames",
              long long v35 = v34);
              v52 = v31;
              [v31 setObject:v35 forKeyedSubscript:@"notice"];

              if (v33) {
                BOOL v36 = v34 == 0;
              }
              else {
                BOOL v36 = 1;
              }
              if (!v36)
              {
                long long v37 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v34];
                do
                {
                  long long v38 = v19;
                  uint64_t v39 = *v33++;
                  id v53 = v19;
                  [v14 searchFrame:v39 in:v15 result:&v53];
                  id v40 = v15;
                  v42 = id v41 = v14;
                  id v19 = v53;

                  [v37 addObject:v42];
                  id v14 = v41;
                  id v15 = v40;
                  if (v39) {
                    BOOL v43 = v19 == 0;
                  }
                  else {
                    BOOL v43 = 0;
                  }
                  if (v43) {
                    ++v16;
                  }
                  LODWORD(v34) = v34 - 1;
                }
                while (v34);
                [v52 setObject:v37 forKeyedSubscript:@"resampledUserFrames"];

                id v13 = v47;
                v26 = (ipc_space_t *)MEMORY[0x1E4F14960];
              }

              unint64_t v27 = v51;
              long long v31 = v52;
              LODWORD(v28) = v50;
            }
            mach_port_deallocate(*v26, v28);

            ++v27;
          }
          while (v27 < act_listCnt);
          mach_vm_size_t v44 = 4 * act_listCnt;
          v21 = v48;
          v17 = v46;
        }
        else
        {
          id v19 = 0;
          int v16 = 0;
          mach_vm_size_t v44 = 0;
          v26 = (ipc_space_t *)MEMORY[0x1E4F14960];
        }
        mach_vm_deallocate(*v26, (mach_vm_address_t)act_list, v44);
        goto LABEL_34;
      }
      uint64_t v22 = v21;
      uint64_t v23 = self->super._notes;
      objc_msgSend(NSString, "stringWithFormat:", @"task_threads() for %d failed", v11);
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = self->super._notes;
      objc_msgSend(NSString, "stringWithFormat:", @"Unable to create VMUSampler for %d", v11);
    BOOL v24 = };
    int v25 = v23;
    v21 = v22;
    [(NSMutableArray *)v25 addObject:v24];

    id v19 = 0;
    int v16 = 0;
    v26 = (ipc_space_t *)MEMORY[0x1E4F14960];
LABEL_34:
    mach_port_deallocate(*v26, v60);

    goto LABEL_35;
  }
  int v16 = 0;
LABEL_36:

  return v16;
}

- (id)resampleUUIDsForTask:(int)a3 usingCatalog:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  if (getpid() != v4)
  {
    uint64_t v8 = (void *)MEMORY[0x1AD0D8030]();
    CFURLRef v9 = (ipc_space_t *)MEMORY[0x1E4F14960];
    if (task_read_for_pid())
    {
      notes = self->super._notes;
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"task_read_for_pid(%d) for resampling UUIDs failed", v4);
      [(NSMutableArray *)notes addObject:v11];
    }
    else
    {
      if (_dyld_process_info_create())
      {
        id v15 = v6;
        id v16 = v7;
        _dyld_process_info_for_each_image();
        _dyld_process_info_release();
        [v16 sortByAddressAndSetInferredSizes];

        id v12 = v15;
      }
      else
      {
        id v13 = self->super._notes;
        id v12 = objc_msgSend(NSString, "stringWithFormat:", @"_dyld_process_info_create(%d) for resampling UUIDs failed with %d", v4, 0);
        [(NSMutableArray *)v13 addObject:v12];
      }

      mach_port_deallocate(*v9, 0);
    }
  }

  return v7;
}

uint64_t __56__OSAStackShotReport_resampleUUIDsForTask_usingCatalog___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) isAddressInTargetedCache:a2];
  if ((result & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    return [v7 addImage:a3 address:a2 size:0];
  }
  return result;
}

- (void)addCustomField:(const char *)a3 value:(id)a4 into:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  if (a3 && v13)
  {
    CFURLRef v9 = [NSString stringWithUTF8String:a3];
    if (v9)
    {
      if ([v8 count]
        && ([v8 top], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v11 = v10;
        id v12 = [v10 data];
        [v12 setObject:v13 forKeyedSubscript:v9];
      }
      else
      {
        [(NSMutableDictionary *)self->_extras setObject:v13 forKeyedSubscript:v9];
      }
    }
  }
}

- (void)decodeKCDataWithBlock:(id)a3 withTuning:(id)a4 usingCatalog:(id)a5
{
  v559[1] = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(void, void *))a3;
  id v9 = a4;
  id v10 = a5;
  ss_trace_uint64_t buffer = (char *)self->_ss_trace_buffer;
  if (!ss_trace_buffer || (uint64_t ss_trace_length = self->_ss_trace_length, !ss_trace_length))
  {
    notes = self->super._notes;
    id v16 = @"missing stackshot buffer or size";
    goto LABEL_7;
  }
  unint64_t v13 = (unint64_t)&ss_trace_buffer[ss_trace_length];
  id v14 = ss_trace_buffer + 16;
  if (ss_trace_buffer + 16 > &ss_trace_buffer[ss_trace_length]
    || (unint64_t)&v14[*((unsigned int *)ss_trace_buffer + 1)] > v13
    || *(_DWORD *)ss_trace_buffer != 1503811591)
  {
    notes = self->super._notes;
    id v16 = @"non-parseable kc snapshot buffer";
LABEL_7:
    [(NSMutableArray *)notes addObject:v16];
    goto LABEL_8;
  }
  v516 = [MEMORY[0x1E4F1CA48] array];
  v500 = [MEMORY[0x1E4F1CA48] array];
  v17 = [MEMORY[0x1E4F1CA48] array];
  if (self->_dead_snapshot) {
    int v471 = 0;
  }
  else {
    int v471 = excludeSection(v9, @"sampleTruncatedStacks") ^ 1;
  }
  v495 = v9;
  v497 = v8;
  v489 = [MEMORY[0x1E4F1CA48] array];
  v498 = [MEMORY[0x1E4F1CA48] array];
  v496 = objc_opt_new();
  v488 = [MEMORY[0x1E4F1CA48] array];
  v478 = [MEMORY[0x1E4F1CA48] array];
  v18 = +[OSASystemConfiguration sharedInstance];
  int v491 = [v18 appleInternal];

  CSSymbolicatorGetFlagsForNListOnlyData();
  uint64_t v19 = CSSymbolicatorCreateWithTaskFlagsAndNotification();
  uint64_t v473 = v20;
  uint64_t v474 = v19;
  if (CSIsNull())
  {
    v21 = MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]7();
    }
  }
  v494 = objc_alloc_init(OSAExclaveContainer);
  -[OSAExclaveContainer parseKCdata:](v494, "parseKCdata:", ss_trace_buffer, v13);
  v501 = 0;
  v502 = 0;
  unint64_t v492 = 0;
  unint64_t v493 = 0;
  uint64_t v476 = 0;
  uint64_t v477 = 0;
  uint64_t v487 = 0;
  uint64_t v490 = 0;
  uint64_t v469 = 0;
  uint64_t v470 = 0;
  uint64_t v475 = 0;
  v499 = 0;
  char v445 = 0;
  uint64_t v472 = 0;
  double v23 = *MEMORY[0x1E4F1CF78];
  char v468 = 1;
  unint64_t v24 = 0x1E4F28000uLL;
  v505 = v10;
  v506 = v17;
  v517 = self;
  while (1)
  {
    uint64_t v25 = *((unsigned int *)ss_trace_buffer + 1);
    if ((unint64_t)&v14[v25] > v13) {
LABEL_630:
    }
      -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]();
    unsigned int v26 = *(_DWORD *)ss_trace_buffer;
    if (*(_DWORD *)ss_trace_buffer == -242132755) {
      break;
    }
    if ((v26 & 0xFFFFFFF0) == 0x20) {
      uint64_t v27 = 17;
    }
    else {
      uint64_t v27 = v26;
    }
    if ((int)v27 > 2111)
    {
      switch((int)v27)
      {
        case 2305:
          if (includeSection(v495, @"ioStats"))
          {
            uint64_t v28 = [v17 top];
            if (!v28) {
              -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]1();
            }
            uint64_t v29 = v28;
            uint64_t v30 = [v28 data];

            if (v30)
            {
              long long v31 = v29;
              unint64_t v507 = v13;
              long long v32 = [MEMORY[0x1E4F1CA48] array];
              for (uint64_t i = 0; i != 32; i += 8)
              {
                uint64_t v34 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*(void *)&ss_trace_buffer[i + 48]];
                v536[0] = v34;
                long long v35 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*(void *)&ss_trace_buffer[i + 80]];
                v536[1] = v35;
                BOOL v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v536 count:2];
                [v32 addObject:v36];
              }
              v534[0] = @"reads";
              id v479 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
              v533[0] = v479;
              v464 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 3)];
              v533[1] = v464;
              v461 = [MEMORY[0x1E4F1C978] arrayWithObjects:v533 count:2];
              v535[0] = v461;
              v534[1] = @"writes";
              v458 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 4)];
              v532[0] = v458;
              v456 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 5)];
              v532[1] = v456;
              v454 = [MEMORY[0x1E4F1C978] arrayWithObjects:v532 count:2];
              v535[1] = v454;
              v534[2] = @"paging";
              v452 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 14)];
              v531[0] = v452;
              v450 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 15)];
              v531[1] = v450;
              v448 = [MEMORY[0x1E4F1C978] arrayWithObjects:v531 count:2];
              v535[2] = v448;
              v534[3] = @"nonpaging";
              v446 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 16)];
              v530[0] = v446;
              v441 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 17)];
              v530[1] = v441;
              v440 = [MEMORY[0x1E4F1C978] arrayWithObjects:v530 count:2];
              v535[3] = v440;
              v534[4] = @"data";
              v439 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 18)];
              v529[0] = v439;
              v438 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 19)];
              v529[1] = v438;
              v437 = [MEMORY[0x1E4F1C978] arrayWithObjects:v529 count:2];
              v535[4] = v437;
              v534[5] = @"metadata";
              long long v37 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 20)];
              v528[0] = v37;
              long long v38 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 21)];
              v528[1] = v38;
              uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v528 count:2];
              v534[6] = @"priorities";
              v535[5] = v39;
              v535[6] = v32;
              id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v535 forKeys:v534 count:7];
              id v41 = [v31 data];
              [v41 setObject:v40 forKeyedSubscript:@"ioStats"];

              uint64_t v29 = v31;
              id v10 = v505;
              v17 = v506;
              unint64_t v13 = v507;
            }

            self = v517;
          }
          goto LABEL_585;
        case 2306:
          unint64_t v510 = v13;
          v558 = @"memoryStatus";
          v556[0] = @"memoryPressure";
          id v482 = [*(id *)(v24 + 3792) numberWithBool:self->_jetsamLevel > 0];
          v557[0] = v482;
          v556[1] = @"memoryPages";
          v554[0] = @"free";
          v466 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 5)];
          v555[0] = v466;
          v554[1] = @"active";
          v462 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 6)];
          v555[1] = v462;
          v554[2] = @"inactive";
          v459 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 7)];
          v555[2] = v459;
          v554[3] = @"purgeable";
          v457 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 8)];
          v555[3] = v457;
          v554[4] = @"wired";
          v455 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 9)];
          v555[4] = v455;
          v554[5] = @"speculative";
          v453 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 10)];
          v555[5] = v453;
          v554[6] = @"throttled";
          v451 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 11)];
          v555[6] = v451;
          v554[7] = @"fileBacked";
          v449 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 12)];
          v555[7] = v449;
          v447 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v555 forKeys:v554 count:8];
          v557[1] = v447;
          v556[2] = @"compressions";
          v65 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 13)];
          v557[2] = v65;
          v556[3] = @"decompressions";
          v66 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 14)];
          v557[3] = v66;
          v556[4] = @"compressorSize";
          v67 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 15)];
          v557[4] = v67;
          v556[5] = @"busyBufferCount";
          v68 = [*(id *)(v24 + 3792) numberWithInt:*((unsigned int *)ss_trace_buffer + 16)];
          v557[5] = v68;
          v556[6] = @"memoryPressureDetails";
          unint64_t v69 = v24;
          int v70 = ss_trace_buffer[76];
          if (ss_trace_buffer[76])
          {
            v552[0] = @"pagesWanted";
            v444 = [*(id *)(v69 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 17)];
            v553[0] = v444;
            v552[1] = @"pagesReclaimed";
            v443 = [*(id *)(v69 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 18)];
            v553[1] = v443;
            v442 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v553 forKeys:v552 count:2];
            v71 = v442;
          }
          else
          {
            v71 = (void *)MEMORY[0x1E4F1CC08];
          }
          v557[6] = v71;
          v556[7] = @"pageSize";
          v206 = [*(id *)(v69 + 3792) numberWithUnsignedInt:HIDWORD(v477)];
          v557[7] = v206;
          v207 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v557 forKeys:v556 count:8];
          v559[0] = v207;
          v208 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v559 forKeys:&v558 count:1];
          v497[2](v497, v208);

          if (v70)
          {
          }
          id v10 = v505;
          v17 = v506;
          self = v517;
          unint64_t v13 = v510;
          unint64_t v24 = 0x1E4F28000;
          goto LABEL_585;
        case 2307:
        case 2308:
        case 2311:
        case 2314:
        case 2315:
        case 2316:
        case 2317:
        case 2322:
        case 2323:
        case 2324:
        case 2325:
        case 2326:
        case 2327:
        case 2328:
        case 2334:
        case 2335:
        case 2336:
        case 2339:
        case 2340:
        case 2341:
        case 2342:
        case 2343:
        case 2350:
        case 2351:
        case 2353:
        case 2354:
        case 2355:
        case 2356:
        case 2357:
        case 2358:
        case 2359:
        case 2361:
        case 2362:
        case 2363:
        case 2364:
        case 2365:
        case 2366:
        case 2367:
        case 2368:
        case 2369:
        case 2370:
        case 2375:
          goto LABEL_62;
        case 2309:
          unint64_t v511 = v13;
          v72 = [v17 top];
          if (!v72 || (v73 = v72, [v72 type] != 2307)) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]6();
          }
          uint64_t v74 = *((unsigned int *)ss_trace_buffer + 25);
          if (v74 == self->_pid) {
            goto LABEL_312;
          }
          if (v74) {
            goto LABEL_84;
          }
          if (!excludeSection(v495, @"kernel")) {
            goto LABEL_312;
          }
          uint64_t v74 = *((unsigned int *)ss_trace_buffer + 25);
LABEL_84:
          frontmostPids = self->_frontmostPids;
          v76 = [*(id *)(v24 + 3792) numberWithInt:v74];
          if ([(NSMutableArray *)frontmostPids containsObject:v76])
          {
          }
          else
          {
            if (!*((_DWORD *)ss_trace_buffer + 25))
            {

LABEL_479:
              v275 = [v506 top];
              [v275 omit];
              unint64_t v13 = v511;
              goto LABEL_449;
            }
            char v253 = excludeSection(v495, @"allPids");

            if (v253) {
              goto LABEL_479;
            }
          }
LABEL_312:
          [v73 setPid:*((unsigned int *)ss_trace_buffer + 25)];
          v254 = [MEMORY[0x1E4F1CA60] dictionary];
          v255 = [v73 data];
          [v255 setObject:v254 forKeyedSubscript:@"threadById"];

          v256 = [*(id *)(v24 + 3792) numberWithInt:*((unsigned int *)ss_trace_buffer + 25)];
          v257 = [v73 data];
          [v257 setObject:v256 forKeyedSubscript:@"pid"];

          v258 = [NSString stringWithUTF8String:ss_trace_buffer + 104];
          v259 = [v73 data];
          [v259 setObject:v258 forKeyedSubscript:@"procname"];

          v260 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 19)];
          v261 = [v73 data];
          [v261 setObject:v260 forKeyedSubscript:@"pageFaults"];

          v262 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 20)];
          v263 = [v73 data];
          [v263 setObject:v262 forKeyedSubscript:@"pageIns"];

          v264 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 21)];
          v265 = [v73 data];
          [v265 setObject:v264 forKeyedSubscript:@"copyOnWriteFaults"];

          v266 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 22)];
          v267 = [v73 data];
          [v267 setObject:v266 forKeyedSubscript:@"timesThrottled"];

          v268 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 23)];
          v269 = [v73 data];
          [v269 setObject:v268 forKeyedSubscript:@"timesDidThrottle"];

          v270 = objc_msgSend(NSString, "stringWithFormat:", @"0x%llX", *((void *)ss_trace_buffer + 3));
          v271 = [v73 data];
          [v271 setObject:v270 forKeyedSubscript:@"rawFlags"];

          if (*((_DWORD *)ss_trace_buffer + 18))
          {
            v272 = objc_msgSend(*(id *)(v24 + 3792), "numberWithUnsignedInt:");
            v273 = [v73 data];
            [v273 setObject:v272 forKeyedSubscript:@"suspendCount"];
          }
          v274 = [MEMORY[0x1E4F1CA48] array];
          v275 = v274;
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 4) != 0)
          {
            [v274 addObject:@"rsrcFlagged"];
            uint64_t v276 = *((void *)ss_trace_buffer + 3);
            if ((v276 & 8) == 0)
            {
LABEL_316:
              if ((v276 & 0x10) == 0) {
                goto LABEL_317;
              }
              goto LABEL_332;
            }
          }
          else if ((v276 & 8) == 0)
          {
            goto LABEL_316;
          }
          [v275 addObject:@"terminatedSnapshot"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x10) == 0)
          {
LABEL_317:
            if ((v276 & 0x20) == 0) {
              goto LABEL_318;
            }
            goto LABEL_333;
          }
LABEL_332:
          [v275 addObject:@"suspended"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x20) == 0)
          {
LABEL_318:
            if ((v276 & 0x40) == 0) {
              goto LABEL_319;
            }
            goto LABEL_334;
          }
LABEL_333:
          [v275 addObject:@"frozen"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x40) == 0)
          {
LABEL_319:
            if ((v276 & 0x80) == 0) {
              goto LABEL_320;
            }
            goto LABEL_335;
          }
LABEL_334:
          [v275 addObject:@"darwinBG"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x80) == 0)
          {
LABEL_320:
            if ((v276 & 0x100) == 0) {
              goto LABEL_321;
            }
            goto LABEL_336;
          }
LABEL_335:
          [v275 addObject:@"extDarwinBG"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x100) == 0)
          {
LABEL_321:
            if ((v276 & 0x200) == 0) {
              goto LABEL_322;
            }
            goto LABEL_337;
          }
LABEL_336:
          [v275 addObject:@"visVisible"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x200) == 0)
          {
LABEL_322:
            if ((v276 & 0x400) == 0) {
              goto LABEL_323;
            }
            goto LABEL_338;
          }
LABEL_337:
          [v275 addObject:@"visNonvisible"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x400) == 0)
          {
LABEL_323:
            if ((v276 & 0x800) == 0) {
              goto LABEL_324;
            }
            goto LABEL_339;
          }
LABEL_338:
          [v275 addObject:@"foreground"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x800) == 0)
          {
LABEL_324:
            if ((v276 & 0x1000) == 0) {
              goto LABEL_325;
            }
            goto LABEL_340;
          }
LABEL_339:
          [v275 addObject:@"boosted"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x1000) == 0)
          {
LABEL_325:
            if ((v276 & 0x4000) == 0) {
              goto LABEL_326;
            }
            goto LABEL_341;
          }
LABEL_340:
          [v275 addObject:@"suppressed"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x4000) == 0)
          {
LABEL_326:
            if ((v276 & 0x8000) == 0) {
              goto LABEL_327;
            }
            goto LABEL_342;
          }
LABEL_341:
          [v275 addObject:@"isImpDonor"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x8000) == 0)
          {
LABEL_327:
            if ((v276 & 0x10000) == 0) {
              goto LABEL_328;
            }
            goto LABEL_343;
          }
LABEL_342:
          [v275 addObject:@"isLiveImpDonor"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x10000) == 0)
          {
LABEL_328:
            if ((v276 & 0x80000) == 0) {
              goto LABEL_348;
            }
            goto LABEL_344;
          }
LABEL_343:
          [v275 addObject:@"dirty"];
          uint64_t v276 = *((void *)ss_trace_buffer + 3);
          if ((v276 & 0x80000) == 0) {
            goto LABEL_348;
          }
LABEL_344:
          if ((v276 & 0x20000) != 0)
          {
            [v275 addObject:@"exceededWQConstrainedLimit"];
            uint64_t v276 = *((void *)ss_trace_buffer + 3);
          }
          if ((v276 & 0x40000) != 0)
          {
            [v275 addObject:@"exceededWQTotalLimit"];
            uint64_t v276 = *((void *)ss_trace_buffer + 3);
          }
LABEL_348:
          if ((v276 & 0x700000) != 0)
          {
            v277 = objc_msgSend(NSString, "stringWithFormat:", @"uuidFaultFlags0x%08llX", v276 & 0x700000);
            [v275 addObject:v277];

            uint64_t v276 = *((void *)ss_trace_buffer + 3);
          }
          if ((v276 & 0x200000) != 0)
          {
            v278 = objc_msgSend(*(id *)(v24 + 3792), "numberWithInt:", objc_msgSend(v73, "pid"));
            [v498 addObject:v278];

            objc_msgSend(v73, "setInvalid_images:", objc_msgSend(v73, "invalid_images") + objc_msgSend(v500, "count"));
            if ((excludeSection(v495, @"uuidResampling") & 1) == 0 && !self->_dead_snapshot)
            {
              v279 = -[OSAStackShotReport resampleUUIDsForTask:usingCatalog:](self, "resampleUUIDsForTask:usingCatalog:", [v73 pid], v10);
              int v280 = [v279 count];
              uint64_t v281 = [v279 count];
              int v282 = objc_msgSend(v73, "invalid_images");
              v283 = @"resampledAllImages";
              if (v281 != v282)
              {
                unint64_t v284 = objc_msgSend(v279, "count", @"resampledAllImages");
                if (v284 <= (int)objc_msgSend(v73, "invalid_images")) {
                  v283 = @"resampleIncomplete";
                }
                else {
                  v283 = @"resampledExtraImages";
                }
              }
              [v275 addObject:v283];
              if ([v279 count])
              {
                v285 = [v279 valueForKey:@"details"];
                v286 = [v73 data];
                [v286 setObject:v285 forKeyedSubscript:@"resampled_images"];

                self = v517;
                [v516 addObjectsFromArray:v279];
              }
              uint64_t v469 = (v469 + v280);
            }
          }
          else if ([v500 count])
          {
            [v516 addObjectsFromArray:v500];
            [v516 sortByAddressAndSetInferredSizes];
          }
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x1000000) != 0)
          {
            [v275 addObject:@"TALEngaged"];
            uint64_t v287 = *((void *)ss_trace_buffer + 3);
            if ((v287 & 0x4000000) == 0)
            {
LABEL_364:
              if ((v287 & 0x8000000) == 0) {
                goto LABEL_365;
              }
              goto LABEL_385;
            }
          }
          else if ((v287 & 0x4000000) == 0)
          {
            goto LABEL_364;
          }
          [v275 addObject:@"isDirtyTracked"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x8000000) == 0)
          {
LABEL_365:
            if ((v287 & 0x10000000) == 0) {
              goto LABEL_366;
            }
            goto LABEL_386;
          }
LABEL_385:
          [v275 addObject:@"allowIdleExit"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x10000000) == 0)
          {
LABEL_366:
            if ((v287 & 0x20000000) == 0) {
              goto LABEL_367;
            }
            goto LABEL_387;
          }
LABEL_386:
          [v275 addObject:@"isTranslated"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x20000000) == 0)
          {
LABEL_367:
            if ((v287 & 0x40000000) == 0) {
              goto LABEL_368;
            }
            goto LABEL_388;
          }
LABEL_387:
          [v275 addObject:@"sharedRegionNone"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x40000000) == 0)
          {
LABEL_368:
            if ((v287 & 0x80000000) == 0) {
              goto LABEL_369;
            }
            goto LABEL_389;
          }
LABEL_388:
          [v275 addObject:@"sharedRegionSystem"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x80000000) == 0)
          {
LABEL_369:
            if ((v287 & 0x100000000) == 0) {
              goto LABEL_370;
            }
            goto LABEL_390;
          }
LABEL_389:
          [v275 addObject:@"sharedRegionOther"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x100000000) == 0)
          {
LABEL_370:
            if ((v287 & 0x200000000) == 0) {
              goto LABEL_371;
            }
            goto LABEL_391;
          }
LABEL_390:
          [v275 addObject:@"dyldCompactInfoNone"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x200000000) == 0)
          {
LABEL_371:
            if ((v287 & 0x400000000) == 0) {
              goto LABEL_372;
            }
            goto LABEL_392;
          }
LABEL_391:
          [v275 addObject:@"dyldCompactInfoTooBig"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x400000000) == 0)
          {
LABEL_372:
            if ((v287 & 0x800000000) == 0) {
              goto LABEL_373;
            }
            goto LABEL_393;
          }
LABEL_392:
          [v275 addObject:@"dyldCompactInfoFaultedIn"];
          uint64_t v287 = *((void *)ss_trace_buffer + 3);
          if ((v287 & 0x800000000) == 0)
          {
LABEL_373:
            if ((v287 & 0x1000000000) == 0) {
              goto LABEL_375;
            }
LABEL_374:
            [v275 addObject:@"dyldCompactInfoTriedFault"];
            goto LABEL_375;
          }
LABEL_393:
          [v275 addObject:@"dyldCompactInfoMissing"];
          if ((*((void *)ss_trace_buffer + 3) & 0x1000000000) != 0) {
            goto LABEL_374;
          }
LABEL_375:
          if ([v275 count])
          {
            v288 = [v73 data];
            [v288 setObject:v275 forKeyedSubscript:@"flags"];
          }
          if (*((void *)ss_trace_buffer + 7))
          {
            v289 = objc_msgSend(*(id *)(v24 + 3792), "numberWithUnsignedLongLong:");
            v290 = [v73 data];
            [v290 setObject:v289 forKeyedSubscript:@"residentMemoryBytes"];
          }
          v291 = self->_frontmostPids;
          v292 = [*(id *)(v24 + 3792) numberWithInt:*((unsigned int *)ss_trace_buffer + 25)];
          LODWORD(v291) = [(NSMutableArray *)v291 containsObject:v292];

          if (v291)
          {
            v293 = [v73 data];
            [v293 setObject:&unk_1EFE25478 forKeyedSubscript:@"frontmost"];
          }
          unint64_t v294 = *((void *)ss_trace_buffer + 4);
          unint64_t v492 = *((void *)ss_trace_buffer + 5);
          v295 = [(OSAStackShotReport *)self problemType];
          unint64_t v493 = v294;
          if ([v295 isEqualToString:@"409"])
          {
          }
          else
          {
            v296 = [(OSAStackShotReport *)self problemType];
            int v297 = [v296 isEqualToString:@"509"];

            if (!v297) {
              goto LABEL_397;
            }
          }
          v298 = [(id)objc_opt_class() reduceToTwoSigFigures:(unint64_t)(self->super._capture_time - ((double)*((unint64_t *)ss_trace_buffer + 6) - v23))];
          v299 = [v73 data];
          [v299 setObject:v298 forKeyedSubscript:@"processUptime"];

LABEL_397:
          v300 = v499;
          if (v502) {
            v300 = v502;
          }
          v301 = v300;
          v302 = v301;
          if (v301)
          {
            objc_msgSend(v10, "targetSharedCache:withSlide:atBaseAddress:", -[OSASharedCacheEntry original](v301, "original") + 8, -[OSASharedCacheEntry sharedCacheSlide](v301, "sharedCacheSlide"), (void)-[OSASharedCacheEntry original](v301, "original")[32]);
            if ([(OSASharedCacheEntry *)v302 layout])
            {
              if ([(OSASharedCacheEntry *)v302 isDefaultSharedCache])
              {
                if ((v445 & 1) == 0) {
                  objc_msgSend(v10, "setRootedCacheLibs:count:", -[OSASharedCacheEntry layout](v302, "layout"), -[OSASharedCacheEntry layoutImageCount](v302, "layoutImageCount"));
                }
                char v445 = 1;
              }
              else
              {
                objc_msgSend(v10, "setRootedCacheLibs:count:", -[OSASharedCacheEntry layout](v302, "layout"), -[OSASharedCacheEntry layoutImageCount](v302, "layoutImageCount"));
                char v445 = 0;
              }
              unint64_t v13 = v511;
            }
            else
            {
              unint64_t v13 = v511;
            }
          }
          else
          {
            unint64_t v13 = v511;
            if (v468) {
              [(NSMutableArray *)self->super._notes addObject:@"no shared cache available from the kernel snapshot -- this may impact symbolication"];
            }
            char v468 = 0;
          }

LABEL_449:
          goto LABEL_450;
        case 2310:
          unint64_t v512 = v13;
          v77 = [v17 top];
          if (!v77 || (v78 = v77, [v77 type] != 2308)) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]8();
          }
          v79 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v80 = [v78 data];
          [v80 setObject:v79 forKeyedSubscript:@"id"];

          int v81 = *((_DWORD *)ss_trace_buffer + 26);
          v82 = [MEMORY[0x1E4F1CA48] array];
          v83 = v82;
          if (v81)
          {
            [v82 addObject:@"TH_WAIT"];
            if ((v81 & 2) == 0)
            {
LABEL_90:
              if ((v81 & 4) == 0) {
                goto LABEL_91;
              }
              goto LABEL_217;
            }
          }
          else if ((v81 & 2) == 0)
          {
            goto LABEL_90;
          }
          [v83 addObject:@"TH_SUSP"];
          if ((v81 & 4) == 0)
          {
LABEL_91:
            if ((v81 & 8) == 0) {
              goto LABEL_92;
            }
            goto LABEL_218;
          }
LABEL_217:
          [v83 addObject:@"TH_RUN"];
          if ((v81 & 8) == 0)
          {
LABEL_92:
            if ((v81 & 0x10) == 0) {
              goto LABEL_93;
            }
            goto LABEL_219;
          }
LABEL_218:
          [v83 addObject:@"TH_UNINT"];
          if ((v81 & 0x10) == 0)
          {
LABEL_93:
            if ((v81 & 0x20) == 0) {
              goto LABEL_94;
            }
            goto LABEL_220;
          }
LABEL_219:
          [v83 addObject:@"TH_TERMINATE"];
          if ((v81 & 0x20) == 0)
          {
LABEL_94:
            if ((v81 & 0x80) == 0) {
              goto LABEL_96;
            }
LABEL_95:
            [v83 addObject:@"TH_IDLE"];
            goto LABEL_96;
          }
LABEL_220:
          [v83 addObject:@"TH_TERMINATE2"];
          if ((v81 & 0x80) != 0) {
            goto LABEL_95;
          }
LABEL_96:
          v84 = [v78 data];
          [v84 setObject:v83 forKeyedSubscript:@"state"];

          uint64_t v85 = *((void *)ss_trace_buffer + 3);
          if (v85)
          {
            v86 = [v10 searchFrame:v85 in:v516 result:0];
            v87 = [v78 data];
            [v87 setObject:v86 forKeyedSubscript:@"waitEvent"];
          }
          v88 = [*(id *)(v24 + 3792) numberWithShort:*((__int16 *)ss_trace_buffer + 57)];
          v89 = [v78 data];
          [v89 setObject:v88 forKeyedSubscript:@"schedPriority"];

          v90 = [*(id *)(v24 + 3792) numberWithShort:*((__int16 *)ss_trace_buffer + 56)];
          v91 = [v78 data];
          [v91 setObject:v90 forKeyedSubscript:@"basePriority"];

          if (ss_trace_buffer[117])
          {
            v92 = DecodeQOS(ss_trace_buffer[117]);
            v93 = [v78 data];
            [v93 setObject:v92 forKeyedSubscript:@"qosRequested"];
          }
          if (ss_trace_buffer[118])
          {
            v94 = DecodeQOS(ss_trace_buffer[118]);
            v95 = [v78 data];
            [v95 setObject:v94 forKeyedSubscript:@"qosOverride"];
          }
          if (ss_trace_buffer[116])
          {
            v96 = DecodeQOS(ss_trace_buffer[116]);
            v97 = [v78 data];
            [v97 setObject:v96 forKeyedSubscript:@"qosEffective"];
          }
          unint64_t v98 = *((unsigned int *)ss_trace_buffer + 27);
          if (v98)
          {
            v99 = DecodeThreadFlags(v98, 0);
            v100 = [v78 data];
            [v100 setObject:v99 forKeyedSubscript:@"schedFlags"];
          }
          unint64_t v101 = *((void *)ss_trace_buffer + 10);
          if (v101)
          {
            v102 = DecodeThreadFlags(v101, 1);
            v103 = [v78 data];
            [v103 setObject:v102 forKeyedSubscript:@"snapshotFlags"];
          }
          uint64_t v104 = *((void *)ss_trace_buffer + 4);
          if (v104)
          {
            v105 = [v10 searchFrame:v104 in:v516 result:0];
            v106 = [v78 data];
            [v106 setObject:v105 forKeyedSubscript:@"continuation"];
          }
          if (ss_trace_buffer[80] < 0)
          {
            if (v471)
            {
              v107 = [v506 parent];
              v108 = [v78 data];
              v109 = objc_msgSend(v107, "truncated_threads");
              v110 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
              [v109 setObject:v108 forKeyedSubscript:v110];
            }
            else
            {
              v107 = [v78 data];
              [v107 setObject:@"Unmapped pages caused truncated backtrace (resampling disabled)" forKeyedSubscript:@"notice"];
            }
            uint64_t v487 = (v487 + 1);
          }
          uint64_t v239 = *((void *)ss_trace_buffer + 8);
          id v483 = (id)*((void *)ss_trace_buffer + 9);
          if (v501) {
            unint64_t v240 = v239 * (unint64_t)*v501 / v501[1];
          }
          else {
            unint64_t v240 = *((void *)ss_trace_buffer + 8);
          }
          v241 = [*(id *)(v24 + 3792) numberWithDouble:(double)v240 / 1000000000.0];
          v242 = [v78 data];
          [v242 setObject:v241 forKeyedSubscript:@"userTime"];

          unint64_t v243 = *((void *)ss_trace_buffer + 9);
          if (v501) {
            unint64_t v243 = v243 * *v501 / v501[1];
          }
          v244 = [*(id *)(v24 + 3792) numberWithDouble:(double)v243 / 1000000000.0];
          v245 = [v78 data];
          [v245 setObject:v244 forKeyedSubscript:@"systemTime"];

          unint64_t v246 = v517->_capture_absoluteTime - *((void *)ss_trace_buffer + 11);
          if (v501) {
            unint64_t v246 = v246 * *v501 / v501[1];
          }
          v247 = [*(id *)(v24 + 3792) numberWithDouble:(double)v246 / 1000000000.0];
          v248 = [v78 data];
          [v248 setObject:v247 forKeyedSubscript:@"lastRunTime"];

          uint64_t v249 = *((void *)ss_trace_buffer + 12);
          if (v249 != -1)
          {
            unint64_t v250 = v517->_capture_absoluteTime - v249;
            if (v501) {
              unint64_t v250 = v250 * *v501 / v501[1];
            }
            v251 = [*(id *)(v24 + 3792) numberWithDouble:(double)v250 / 1000000000.0];
            v252 = [v78 data];
            [v252 setObject:v251 forKeyedSubscript:@"lastMadeRunnableTime"];
          }
          uint64_t v490 = (v490 + 1);
          v493 += v239;
          v492 += (unint64_t)v483;

          id v10 = v505;
          v17 = v506;
          self = v517;
          unint64_t v13 = v512;
          goto LABEL_585;
        case 2312:
        case 2319:
        case 2331:
        case 2332:
        case 2333:
        case 2338:
        case 2345:
        case 2346:
        case 2347:
        case 2348:
        case 2349:
        case 2372:
          goto LABEL_585;
        case 2313:
          unint64_t v111 = v13;
          v112 = [v17 top];
          if ([v112 type] != 2308) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]9();
          }
          uint64_t v113 = [NSString stringWithUTF8String:ss_trace_buffer + 16];
          v114 = (void *)v113;
          if (v113) {
            v115 = (__CFString *)v113;
          }
          else {
            v115 = @"<unprintable>";
          }
          v116 = [v112 data];
          v117 = v116;
          v118 = v115;
          v119 = @"name";
          goto LABEL_147;
        case 2318:
          if (!v491) {
            goto LABEL_585;
          }
          v550 = @"bootArgs";
          v120 = [NSString stringWithUTF8String:ss_trace_buffer + 16];
          v551 = v120;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v551 forKeys:&v550 count:1];
          v122 = unint64_t v121 = v13;
          v497[2](v497, v122);

          unint64_t v13 = v121;
          goto LABEL_445;
        case 2320:
          HIDWORD(v477) = *((_DWORD *)ss_trace_buffer + 4);
          goto LABEL_585;
        case 2321:
          self->_jetsamLevel = *((_DWORD *)ss_trace_buffer + 4);
          goto LABEL_585;
        case 2329:
          v123 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          [(OSAStackShotReport *)self addCustomField:"user_usec" value:v123 into:v17];

          v120 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 3)];
          v124 = self;
          v125 = "system_usec";
          goto LABEL_419;
        case 2330:
          unint64_t v126 = *((void *)ss_trace_buffer + 2);
          if (v501) {
            unint64_t v126 = v126 * *v501 / v501[1];
          }
          v127 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:v126];
          [(OSAStackShotReport *)self addCustomField:"stackshot_duration_nsec" value:v127 into:v17];

          unint64_t v128 = *((void *)ss_trace_buffer + 3);
          if (v501) {
            unint64_t v128 = v128 * *v501 / v501[1];
          }
          v129 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:v128];
          [(OSAStackShotReport *)self addCustomField:"stackshot_duration_outer_nsec" value:v129 into:v17];

          int v130 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20) {
            int v130 = 17;
          }
          if (v130 <= 2309)
          {
            v131 = v501;
            if (v130 == 17 || v130 == 19)
            {
              unsigned int v132 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_415;
            }
LABEL_412:
            unsigned int v203 = *((_DWORD *)ss_trace_buffer + 1);
            goto LABEL_413;
          }
          if (v130 == 2310)
          {
            unsigned int v203 = *((_DWORD *)ss_trace_buffer + 1);
            v131 = v501;
            if (v203 == 112)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0) {
                goto LABEL_416;
              }
              unsigned int v203 = 112;
            }
          }
          else
          {
            v131 = v501;
            if (v130 != 2312) {
              goto LABEL_412;
            }
            unsigned int v203 = *((_DWORD *)ss_trace_buffer + 1);
            if (v203 == 32)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0) {
                goto LABEL_416;
              }
              unsigned int v203 = 32;
            }
          }
LABEL_413:
          BOOL v59 = v203 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
          unsigned int v132 = v203 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
          if (!v59) {
            unsigned int v132 = 0;
          }
LABEL_415:
          if (v132 < 0x11) {
            goto LABEL_585;
          }
LABEL_416:
          unint64_t v303 = *((void *)ss_trace_buffer + 4);
          if (v131) {
            unint64_t v303 = v303 * *v131 / v131[1];
          }
          v120 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:v303];
          v124 = self;
          v125 = "stackshot_duration_prior_nsec";
LABEL_419:
          [(OSAStackShotReport *)v124 addCustomField:v125 value:v120 into:v17];
          goto LABEL_445;
        case 2337:
          v133 = [v17 top];
          if (!v133
            || (v120 = v133, [v133 type] != 2307)
            && [v120 type] != 2353)
          {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]2();
          }
          int v134 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20) {
            int v134 = 17;
          }
          if (v134 <= 2309)
          {
            if (v134 == 17 || v134 == 19)
            {
              unsigned int v135 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_426;
            }
LABEL_423:
            unsigned int v204 = *((_DWORD *)ss_trace_buffer + 1);
            goto LABEL_424;
          }
          if (v134 == 2310)
          {
            unsigned int v204 = *((_DWORD *)ss_trace_buffer + 1);
            if (v204 == 112)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0) {
                goto LABEL_427;
              }
              unsigned int v204 = 112;
            }
          }
          else
          {
            if (v134 != 2312) {
              goto LABEL_423;
            }
            unsigned int v204 = *((_DWORD *)ss_trace_buffer + 1);
            if (v204 == 32)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0) {
                goto LABEL_427;
              }
              unsigned int v204 = 32;
            }
          }
LABEL_424:
          BOOL v59 = v204 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
          unsigned int v135 = v204 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
          if (!v59) {
            unsigned int v135 = 0;
          }
LABEL_426:
          if (v135 < 8) {
            goto LABEL_445;
          }
LABEL_427:
          [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v305 = unint64_t v304 = v13;
          v306 = [v120 data];
          v307 = v306;
          v308 = v305;
          v309 = @"jetsamCoalition";
LABEL_444:
          [v306 setObject:v308 forKeyedSubscript:v309];

          unint64_t v13 = v304;
          unint64_t v24 = 0x1E4F28000;
LABEL_445:

          goto LABEL_585;
        case 2344:
          unint64_t v111 = v13;
          v112 = [v17 top];
          if ([v112 type] != 2308) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]0();
          }
          uint64_t v136 = [NSString stringWithUTF8String:ss_trace_buffer + 16];
          v114 = (void *)v136;
          if (v136) {
            v137 = (__CFString *)v136;
          }
          else {
            v137 = @"<unknown>";
          }
          v116 = [v112 data];
          v117 = v116;
          v118 = v137;
          v119 = @"dispatch_queue_label";
LABEL_147:
          [v116 setObject:v118 forKeyedSubscript:v119];

          self = v517;
          goto LABEL_435;
        case 2352:
          unint64_t v138 = v13;
          v139 = [v17 top];
          if (!v139 || (v140 = v139, [v139 type] != 2353)) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]7();
          }
          [v140 setPid:*((unsigned int *)ss_trace_buffer + 10)];
          v141 = [MEMORY[0x1E4F1CA60] dictionary];
          v142 = [v140 data];
          [v142 setObject:v141 forKeyedSubscript:@"threadById"];

          v143 = [NSNumber numberWithInt:*((unsigned int *)ss_trace_buffer + 10)];
          v144 = [v140 data];
          [v144 setObject:v143 forKeyedSubscript:@"pid"];

          v145 = [NSString stringWithUTF8String:ss_trace_buffer + 44];
          v146 = [v140 data];
          [v146 setObject:v145 forKeyedSubscript:@"procname"];

          v147 = self->super._notes;
          v148 = NSString;
          v149 = [v140 data];
          v150 = [v149 objectForKeyedSubscript:@"pid"];
          v151 = [NSNumber numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 4)];
          v152 = [v148 stringWithFormat:@"Process %@ is in transition type %@", v150, v151];
          [(NSMutableArray *)v147 addObject:v152];

          self = v517;
          id v10 = v505;
          v17 = v506;
          goto LABEL_179;
        case 2360:
          v153 = [v17 top];
          if (!v153 || (v120 = v153, [v153 type] != 2307)) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]6();
          }
          unint64_t v154 = *((void *)ss_trace_buffer + 2);
          if (v154
            && *((void *)ss_trace_buffer + 3)
            && *((void *)ss_trace_buffer + 5)
            && *((void *)ss_trace_buffer + 4))
          {
            unint64_t v513 = v13;
            if (v501) {
              unint64_t v154 = v154 * *v501 / v501[1];
            }
            v155 = [NSNumber numberWithDouble:(double)v154 / 1000000000.0];
            v156 = [v120 data];
            [v156 setObject:v155 forKeyedSubscript:@"suspensionLastStart"];

            unint64_t v157 = *((void *)ss_trace_buffer + 3);
            if (v501) {
              unint64_t v157 = v157 * *v501 / v501[1];
            }
            v158 = [NSNumber numberWithDouble:(double)v157 / 1000000000.0];
            v159 = [v120 data];
            [v159 setObject:v158 forKeyedSubscript:@"suspensionLastEnd"];

            unint64_t v160 = *((void *)ss_trace_buffer + 5);
            if (v501) {
              unint64_t v160 = v160 * *v501 / v501[1];
            }
            v161 = [NSNumber numberWithDouble:(double)v160 / 1000000000.0];
            v162 = [v120 data];
            [v162 setObject:v161 forKeyedSubscript:@"suspensionDuration"];

            v163 = [NSNumber numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 4)];
            v164 = [v120 data];
            [v164 setObject:v163 forKeyedSubscript:@"suspensionCount"];

            unint64_t v13 = v513;
            unint64_t v24 = 0x1E4F28000uLL;
          }
          goto LABEL_445;
        case 2371:
          unint64_t v111 = v13;
          if ([v17 count])
          {
            v165 = [v17 top];
          }
          else
          {
            v165 = 0;
          }
          v209 = objc_alloc_init(OSASharedCacheEntry);
          [(OSASharedCacheEntry *)v209 setSharedCacheInfo:ss_trace_buffer + 16];
          v210 = [NSNumber numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 14)];
          if ([v165 type] == 2370) {
            [v165 setPid:*((unsigned int *)ss_trace_buffer + 14)];
          }
          [v496 setObject:v209 forKeyedSubscript:v210];
          if ([(OSASharedCacheEntry *)v209 isDefaultSharedCache])
          {
            v211 = v209;

            v499 = v211;
            self = v517;
          }

          goto LABEL_435;
        case 2373:
          unint64_t v166 = v24;
          unint64_t v111 = v13;
          v167 = [*(id *)(v166 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 4)];
          v168 = [v496 objectForKeyedSubscript:v167];
          v169 = objc_msgSend(*(id *)(v166 + 3792), "numberWithUnsignedInt:", objc_msgSend(v168, "sharedCacheID"));
          int v170 = [v169 isEqual:v167];

          if (v170)
          {
            v171 = v168;

            if ([v17 count])
            {
              v172 = [v17 top];
              int v173 = v491;
              if (!v172) {
                int v173 = 0;
              }
              if (v173 == 1)
              {
                memset(out, 0, sizeof(out));
                uuid_unparse((const unsigned __int8 *)([(OSASharedCacheEntry *)v171 original] + 8), out);
                v547[0] = @"uuid";
                id v503 = [NSString stringWithUTF8String:out];
                v548[0] = v503;
                v547[1] = @"slide";
                v174 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[OSASharedCacheEntry original](v171, "original")[32]);
                v548[1] = v174;
                v175 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v548 forKeys:v547 count:2];
                v176 = [v172 data];
                [v176 setObject:v175 forKeyedSubscript:@"taskSpecificSharedCache"];

                v17 = v506;
                id v10 = v505;
              }
            }
            else
            {
              v172 = 0;
            }
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:](buf, (uint64_t)v167, &v546);
            }
            v171 = v502;
          }
          self = v517;

          v502 = v171;
LABEL_435:
          unint64_t v13 = v111;
          unint64_t v24 = 0x1E4F28000;
          goto LABEL_585;
        case 2374:
          unint64_t v138 = v13;
          v177 = [v17 top];
          if (!v177 || (v178 = v177, [v177 type] != 2307)) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]3();
          }
          v179 = [NSNumber numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v180 = [v178 data];
          [v180 setObject:v179 forKeyedSubscript:@"csFlags"];

          v181 = [NSNumber numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 6)];
          v182 = [v178 data];
          [v182 setObject:v181 forKeyedSubscript:@"csTrustLevel"];

          goto LABEL_178;
        case 2376:
          unint64_t v138 = v13;
          v183 = [v17 top];
          if (!v183 || (v178 = v183, [v183 type] != 2308)) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]4();
          }
          v184 = [NSNumber numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v185 = [v178 data];
          [v185 setObject:v184 forKeyedSubscript:@"exclaveScid"];

          uint64_t v472 = *((unsigned int *)ss_trace_buffer + 6);
LABEL_178:

LABEL_179:
          unint64_t v13 = v138;
          unint64_t v24 = 0x1E4F28000uLL;
          goto LABEL_585;
        default:
          if (v27 != 2112)
          {
            if (v27 == 1503811591) {
              goto LABEL_585;
            }
LABEL_62:
            BOOL v59 = v25 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
            LODWORD(v25) = v25 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
            if (v59) {
              uint64_t v25 = v25;
            }
            else {
              uint64_t v25 = 0;
            }
            NSLog(&cfstr_UnknownKcdataX.isa, v27, v25, v27);
            goto LABEL_585;
          }
          v186 = [v17 top];
          if (!v186 || (v120 = v186, [v186 type] != 2307)) {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]5();
          }
          int v187 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20) {
            int v187 = 17;
          }
          if (v187 <= 2309)
          {
            if (v187 == 17 || v187 == 19)
            {
              unsigned int v188 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_442;
            }
            goto LABEL_439;
          }
          if (v187 == 2310)
          {
            unsigned int v205 = *((_DWORD *)ss_trace_buffer + 1);
            if (v205 != 112) {
              goto LABEL_440;
            }
            if ((ss_trace_buffer[8] & 0x8F) != 0)
            {
              unsigned int v205 = 112;
              goto LABEL_440;
            }
          }
          else
          {
            if (v187 != 2312)
            {
LABEL_439:
              unsigned int v205 = *((_DWORD *)ss_trace_buffer + 1);
LABEL_440:
              BOOL v59 = v205 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
              unsigned int v188 = v205 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
              if (!v59) {
                unsigned int v188 = 0;
              }
LABEL_442:
              if (v188 < 0x10) {
                goto LABEL_445;
              }
              goto LABEL_443;
            }
            unsigned int v205 = *((_DWORD *)ss_trace_buffer + 1);
            if (v205 != 32) {
              goto LABEL_440;
            }
            if ((ss_trace_buffer[8] & 0x8F) != 0)
            {
              unsigned int v205 = 32;
              goto LABEL_440;
            }
          }
LABEL_443:
          [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 2)];
          v310 = unint64_t v304 = v13;
          v311 = [v120 data];
          [v311 setObject:v310 forKeyedSubscript:@"jitStartAddress"];

          v305 = [NSNumber numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 3)];
          v306 = [v120 data];
          v307 = v306;
          v308 = v305;
          v309 = @"jitEndAddress";
          goto LABEL_444;
      }
    }
    if ((int)v27 > 18)
    {
      if ((int)v27 > 49)
      {
        switch(v27)
        {
          case '2':
            v501 = (unsigned int *)(ss_trace_buffer + 16);
            break;
          case '3':
            self->_capture_absoluteTime = *((void *)ss_trace_buffer + 2);
            break;
          case '5':
            self->super._capture_time = (double)*((unint64_t *)ss_trace_buffer + 2) / 1000000.0 - v23;
            break;
          default:
            goto LABEL_62;
        }
        goto LABEL_585;
      }
      if (v27 != 19)
      {
        if (v27 != 20) {
          goto LABEL_62;
        }
        mach_vm_size_t v44 = [v17 pop];
        uint64_t v45 = *((void *)ss_trace_buffer + 1);
        if (v45 != [v44 tag]) {
          -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]5();
        }
        if ([v44 type] != 2308)
        {
          if ([v44 type] == 2307 || objc_msgSend(v44, "type") == 2353)
          {
            v189 = [v44 data];

            if (v189)
            {
              unint64_t v514 = v13;
              unint64_t v190 = v493;
              if (v501) {
                unint64_t v190 = v493 * *v501 / v501[1];
              }
              v191 = [*(id *)(v24 + 3792) numberWithDouble:(double)v190 / 1000000000.0];
              v192 = [v44 data];
              [v192 setObject:v191 forKeyedSubscript:@"userTimeTask"];

              unint64_t v193 = v492;
              if (v501) {
                unint64_t v193 = v492 * *v501 / v501[1];
              }
              v194 = [*(id *)(v24 + 3792) numberWithDouble:(double)v193 / 1000000000.0];
              v195 = [v44 data];
              [v195 setObject:v194 forKeyedSubscript:@"systemTimeTask"];

              if (objc_msgSend(v44, "unindexed_frames"))
              {
                v196 = objc_msgSend(*(id *)(v24 + 3792), "numberWithInt:", objc_msgSend(v44, "unindexed_frames"));
                v197 = [v44 data];
                [v197 setObject:v196 forKeyedSubscript:@"unindexed_frames"];

                uint64_t v476 = objc_msgSend(v44, "unindexed_frames") + v476;
                v198 = objc_msgSend(*(id *)(v24 + 3792), "numberWithInt:", objc_msgSend(v44, "pid"));
                [v488 addObject:v198];
              }
              v199 = objc_msgSend(v44, "truncated_threads");
              uint64_t v200 = [v199 count];

              if (v200
                && (objc_msgSend(*(id *)(v24 + 3792), "numberWithInt:", objc_msgSend(v44, "pid")),
                    v201 = objc_claimAutoreleasedReturnValue(),
                    [v489 addObject:v201],
                    v201,
                    (excludeSection(v495, @"stackResampling") & 1) == 0))
              {
                uint64_t v318 = [v44 pid];
                v319 = objc_msgSend(v44, "truncated_threads");
                uint64_t v202 = -[OSAStackShotReport resampleTruncatedBacktracesForTask:forThreads:usingCatalog:in:usingSymbolicator:](self, "resampleTruncatedBacktracesForTask:forThreads:usingCatalog:in:usingSymbolicator:", v318, v319, v10, v516, v474, v473);

                if (v202)
                {
                  v320 = [*(id *)(v24 + 3792) numberWithInt:v202];
                  v321 = [v44 data];
                  [v321 setObject:v320 forKeyedSubscript:@"unindexed_rs_frames"];

                  uint64_t v475 = (v202 + v475);
                  uint64_t v202 = objc_msgSend(*(id *)(v24 + 3792), "numberWithInt:", objc_msgSend(v44, "pid"));
                  [v478 addObject:v202];

                  LODWORD(v202) = 1;
                }
              }
              else
              {
                LODWORD(v202) = 0;
              }
              if (v491 && ((objc_msgSend(v44, "unindexed_frames") == 0) & ~v202) == 0)
              {
                v322 = [v516 valueForKey:@"details"];
                v323 = [v44 data];
                [v323 setObject:v322 forKeyedSubscript:@"process_images"];
              }
              if (objc_msgSend(v44, "invalid_images"))
              {
                v324 = objc_msgSend(*(id *)(v24 + 3792), "numberWithInt:", objc_msgSend(v44, "invalid_images"));
                v325 = [v44 data];
                [v325 setObject:v324 forKeyedSubscript:@"invalid_images"];

                uint64_t v470 = objc_msgSend(v44, "invalid_images") + v470;
              }
              if ((v477 & 1) == 0)
              {
                v539 = &unk_1EFE254A8;
                v540 = @"processByPid";
                v326 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v540 forKeys:&v539 count:1];
                v497[2](v497, v326);
              }
              v327 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v44, "pid"));
              v537[0] = v327;
              v328 = [v44 data];
              v538[0] = v328;
              v537[1] = &unk_1EFE25490;
              v329 = *(void **)(v24 + 3792);
              unint64_t v330 = v24;
              int pid = v517->_pid;
              int v332 = [v44 pid];
              if (pid == v332)
              {
                uint64_t v333 = 1;
              }
              else
              {
                v334 = v517->_frontmostPids;
                v436 = objc_msgSend(*(id *)(v330 + 3792), "numberWithInt:", objc_msgSend(v44, "pid"));
                uint64_t v333 = -[NSMutableArray containsObject:](v334, "containsObject:");
              }
              v335 = [v329 numberWithInt:v333];
              v538[1] = v335;
              v336 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v538 forKeys:v537 count:2];
              v497[2](v497, v336);

              if (pid != v332) {
              LOBYTE(v477) = 1;
              }
              id v10 = v505;
              self = v517;
              unint64_t v13 = v514;
              unint64_t v24 = 0x1E4F28000;
            }
          }
          else
          {
            v312 = MEMORY[0x1E4F14500];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              int v313 = [v44 type];
              *(_DWORD *)uuid_string_t out = 67109120;
              *(_DWORD *)&out[4] = v313;
              _os_log_impl(&dword_1A7C6D000, v312, OS_LOG_TYPE_DEFAULT, "Unknown KCDATA CONTAINER %X", (uint8_t *)out, 8u);
            }
          }
          goto LABEL_584;
        }
        if (![v506 count]) {
          -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]4();
        }
        unint64_t v508 = v13;
        v46 = [v44 data];
        id v47 = [v46 objectForKeyedSubscript:@"id"];

        v48 = [v44 data];
        v49 = [v48 objectForKeyedSubscript:@"exclaveScid"];

        if (!v49) {
          goto LABEL_581;
        }
        int v50 = objc_msgSend(NSString, "stringWithFormat:", @"0x%llX", objc_msgSend(v49, "unsignedLongLongValue"));
        unint64_t v51 = [v44 data];
        [v51 setObject:v50 forKeyedSubscript:@"exclaveScid"];

        [(OSAExclaveContainer *)v494 setThreadId:v47 withScId:v49];
        v52 = [(OSAExclaveContainer *)v494 getFramesForThread:v47 usingCatalog:v10];
        if (![v52 count]) {
          goto LABEL_580;
        }
        id v53 = [v44 data];
        v54 = [v53 objectForKeyedSubscript:@"kernelFrames"];

        v55 = [MEMORY[0x1E4F1CA48] array];
        v465 = v47;
        if ([v54 count] < (unint64_t)v472)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v403 = [v47 unsignedLongLongValue];
            *(_DWORD *)uuid_string_t out = 67109376;
            *(_DWORD *)&out[4] = v472;
            *(_WORD *)&out[8] = 2048;
            *(void *)&out[10] = v403;
            _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exclave frames offset of %d for thread %llu is invalid", (uint8_t *)out, 0x12u);
          }
          v480 = v517->super._notes;
          uint64_t v56 = objc_msgSend(NSString, "stringWithFormat:", @"Thread %llu with %lu kernel frames has exclave frames but invalid exclave frame offset of %d. Skipping adding exclave frames into kernel frames ", objc_msgSend(v47, "unsignedLongLongValue"), objc_msgSend(v54, "count"), v472);
          [(NSMutableArray *)v480 addObject:v56];
LABEL_579:

          id v47 = v465;
LABEL_580:

          id v10 = v505;
LABEL_581:
          v396 = [v506 top];
          v397 = [v396 data];

          if (v397)
          {
            v398 = [v396 data];
            [v398 objectForKeyedSubscript:@"threadById"];
            id v486 = v49;
            v400 = v399 = v47;

            v401 = [v44 data];
            v402 = [NSString stringWithFormat:@"%@", v399];
            [v400 setObject:v401 forKeyedSubscript:v402];

            id v10 = v505;
            id v47 = v399;
            v49 = v486;
          }

          self = v517;
          unint64_t v13 = v508;
LABEL_584:

          v17 = v506;
          goto LABEL_585;
        }
        if (v54)
        {
          if ([v54 count])
          {
            unint64_t v314 = 0;
            do
            {
              if (v472 == v314) {
                [v55 addObjectsFromArray:v52];
              }
              v315 = [v54 objectAtIndexedSubscript:v314];
              [v55 addObject:v315];

              ++v314;
            }
            while ([v54 count] > v314);
          }
          if ([v54 count] == v472) {
            [v55 addObjectsFromArray:v52];
          }
          unint64_t v24 = 0x1E4F28000;
          if (!v472)
          {
            v316 = v517->super._notes;
            v317 = objc_msgSend(NSString, "stringWithFormat:", @"Thread %llu has an incorrect exclave frame offset %d", objc_msgSend(v465, "unsignedLongLongValue"), 0);
            [(NSMutableArray *)v316 addObject:v317];
            goto LABEL_577;
          }
        }
        else
        {
          id v485 = v52;

          v395 = v517->super._notes;
          v317 = objc_msgSend(NSString, "stringWithFormat:", @"Thread %llu has exclave frames but no kernel frames", objc_msgSend(v47, "unsignedLongLongValue"));
          [(NSMutableArray *)v395 addObject:v317];
          v55 = v485;
LABEL_577:
        }
        uint64_t v56 = [v44 data];
        [v56 setObject:v55 forKeyedSubscript:@"kernelFrames"];
        goto LABEL_579;
      }
      mach_port_name_t v60 = -[KCContainer initWithKCData:]([KCContainer alloc], "initWithKCData:", ss_trace_buffer, v13);
      [v17 push:v60];

      if (*((_DWORD *)ss_trace_buffer + 4) != 2307) {
        goto LABEL_585;
      }
      id v481 = (id)*((unsigned int *)ss_trace_buffer + 2);

      [v516 removeAllObjects];
      [v500 removeAllObjects];
      v61 = &v14[*((unsigned int *)ss_trace_buffer + 1)];
      v62 = v61 + 16;
      if ((unint64_t)(v61 + 16) > v13)
      {
        v502 = 0;
        id v10 = v505;
        v17 = v506;
        goto LABEL_585;
      }
      v502 = 0;
      int v212 = 1;
      unint64_t v515 = v13;
      while (2)
      {
        if ((unint64_t)&v62[*((unsigned int *)v61 + 1)] > v13
          || (int v213 = *(_DWORD *)v61, *(_DWORD *)v61 == -242132755))
        {
LABEL_295:
          id v10 = v505;
LABEL_450:
          v17 = v506;
          goto LABEL_585;
        }
        if ((v213 & 0xFFFFFFF0) == 0x20) {
          int v213 = 17;
        }
        if (v213 > 19)
        {
          switch(v213)
          {
            case 20:
              if (!--v212) {
                goto LABEL_295;
              }
              break;
            case 2332:
              [v505 setKernelCache:v61 + 24 address:*((void *)v61 + 2) size:0];
              break;
            case 2373:
              unint64_t v214 = v24;
              unint64_t v215 = v13;
              v216 = [*(id *)(v214 + 3792) numberWithUnsignedInt:*((unsigned int *)v61 + 4)];
              v217 = [v496 objectForKeyedSubscript:v216];
              v218 = v217;
              if (v217
                && (objc_msgSend(*(id *)(v214 + 3792), "numberWithUnsignedInt:", objc_msgSend(v217, "sharedCacheID")),
                    v219 = objc_claimAutoreleasedReturnValue(),
                    int v220 = [v219 isEqual:v216],
                    v219,
                    v220))
              {
                v221 = v218;

                v222 = (void *)[v506 count];
                if (v222)
                {
                  v222 = [v506 top];
                  int v223 = v491;
                  if (!v222) {
                    int v223 = 0;
                  }
                  if (v223 == 1)
                  {
                    memset(out, 0, sizeof(out));
                    id v504 = v222;
                    uuid_unparse((const unsigned __int8 *)([(OSASharedCacheEntry *)v221 original] + 8), out);
                    v541[0] = @"uuid";
                    v463 = [NSString stringWithUTF8String:out];
                    v542[0] = v463;
                    v541[1] = @"slide";
                    v460 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", (void)-[OSASharedCacheEntry original](v221, "original")[32]);
                    v542[1] = v460;
                    v467 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v542 forKeys:v541 count:2];
                    v224 = [v504 data];
                    [v224 setObject:v467 forKeyedSubscript:@"taskSpecificSharedCache"];

                    v222 = v504;
                  }
                }
                self = v517;
              }
              else
              {
                v235 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uuid_string_t out = 138412290;
                  *(void *)&out[4] = v216;
                  _os_log_impl(&dword_1A7C6D000, v235, OS_LOG_TYPE_DEFAULT, "Expected a task specific shared cache with id %@ but none was found", (uint8_t *)out, 0xCu);
                }
                v221 = v502;
                self = v517;
              }

              v502 = v221;
              unint64_t v13 = v215;
              unint64_t v24 = 0x1E4F28000;
              break;
          }
LABEL_294:
          v61 = &v62[*((unsigned int *)v61 + 1)];
          v62 = v61 + 16;
          if ((unint64_t)(v61 + 16) > v13) {
            goto LABEL_295;
          }
          continue;
        }
        break;
      }
      if (v213 != 17)
      {
        if (v213 == 19)
        {
          ++v212;
          if (*((_DWORD *)v61 + 4) == 2356)
          {
            v225 = [v506 top];
            [v225 data];
            v227 = unint64_t v226 = v13;
            objc_msgSend(v227, "parsePortLabelContainer:", v61, v226);

            unint64_t v13 = v226;
          }
        }
        goto LABEL_294;
      }
      unint64_t v228 = *((void *)v61 + 1);
      unint64_t v229 = HIDWORD(v228);
      if (HIDWORD(v228) != 48)
      {
        if (HIDWORD(v228) == 2350 || HIDWORD(v228) == 49)
        {
          v230 = [v506 top];
          if (v228)
          {
            uint64_t v231 = v228;
            v232 = (const unsigned __int8 *)(v61 + 24);
            do
            {
              if (uuid_is_null(v232))
              {
                if (!*((void *)v232 - 1))
                {
                  objc_msgSend(v230, "setInvalid_images:", objc_msgSend(v230, "invalid_images") + 1);
                  goto LABEL_272;
                }
                v233 = v500;
              }
              else
              {
                v233 = v516;
              }
              objc_msgSend(v233, "addImage:address:size:", v232);
LABEL_272:
              v232 += 24;
              --v231;
            }
            while (v231);
          }
          [v516 sortByAddressAndSetInferredSizes];
          self = v517;
          if (!v481)
          {
            if (v229 == 2350)
            {
              v234 = v516;
              [v505 setKernelTextExecImages:v516];
              goto LABEL_291;
            }
LABEL_290:
            v234 = v516;
            [v505 setKernelImages:v516];
LABEL_291:
            [v234 removeAllObjects];
          }
LABEL_292:
        }
        unint64_t v13 = v515;
        goto LABEL_294;
      }
      v230 = [v506 top];
      if (!v228)
      {
LABEL_289:
        [v516 sortByAddressAndSetInferredSizes];
        if (!v481) {
          goto LABEL_290;
        }
        goto LABEL_292;
      }
      uint64_t v236 = v228;
      v237 = (const unsigned __int8 *)(v61 + 20);
      while (2)
      {
        if (uuid_is_null(v237))
        {
          if (*((_DWORD *)v237 - 1))
          {
            v238 = v500;
            goto LABEL_286;
          }
          objc_msgSend(v230, "setInvalid_images:", objc_msgSend(v230, "invalid_images") + 1);
        }
        else
        {
          v238 = v516;
LABEL_286:
          objc_msgSend(v238, "addImage:address:size:", v237);
        }
        v237 += 20;
        if (!--v236) {
          goto LABEL_289;
        }
        continue;
      }
    }
    if ((int)v27 > 2)
    {
      if (v27 != 3)
      {
        if (v27 != 17) {
          goto LABEL_62;
        }
        unint64_t v509 = v13;
        unint64_t v57 = *((void *)ss_trace_buffer + 1);
        if (v26 == 17)
        {
          if (SHIDWORD(v57) > 2310)
          {
            switch(HIDWORD(v57))
            {
              case 0x907:
                uint64_t v58 = 4;
                break;
              case 0x908:
              case 0x909:
                goto LABEL_482;
              case 0x90A:
              case 0x90C:
                goto LABEL_431;
              case 0x90B:
              case 0x90D:
                uint64_t v58 = 16;
                break;
              default:
                if (HIDWORD(v57) != 2369) {
                  goto LABEL_482;
                }
                uint64_t v58 = 48;
                break;
            }
LABEL_483:
            v337 = (void *)[v17 count];
            if (v337)
            {
              v337 = [v17 top];
            }
            id v484 = v337;
            if (SHIDWORD(v57) <= 2342)
            {
              switch(HIDWORD(v57))
              {
                case 0x913:
                  if (!v337 || (v338 = v337, [v337 type] != 2308)) {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.7();
                  }
                  v339 = [MEMORY[0x1E4F1CA48] array];
                  v340 = [v338 data];
                  [v340 setObject:v339 forKeyedSubscript:@"kernelFrames"];

                  if (v57)
                  {
                    v341 = (unsigned int *)(ss_trace_buffer + 16);
                    uint64_t v342 = v57;
                    do
                    {
                      unsigned int v343 = *v341++;
                      v344 = [v10 searchFrame:v343 in:v516 result:0];
                      [v339 addObject:v344];

                      --v342;
                    }
                    while (v342);
                  }
                  goto LABEL_538;
                case 0x914:
                  if (!v337 || (v366 = v337, [v337 type] != 2308)) {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.6();
                  }
                  v339 = [MEMORY[0x1E4F1CA48] array];
                  v367 = [v366 data];
                  [v367 setObject:v339 forKeyedSubscript:@"kernelFrames"];

                  if (v57)
                  {
                    v368 = (uint64_t *)(ss_trace_buffer + 16);
                    uint64_t v369 = v57;
                    do
                    {
                      uint64_t v370 = *v368++;
                      v371 = [v10 searchFrame:v370 in:v516 result:0];
                      [v339 addObject:v371];

                      --v369;
                    }
                    while (v369);
                  }
LABEL_538:

                  v17 = v506;
                  goto LABEL_539;
                case 0x915:
                  if (!v337 || (v372 = v337, [v337 type] != 2308)) {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.9();
                  }
                  v373 = [v17 parent];
                  v374 = [MEMORY[0x1E4F1CA48] array];
                  v375 = [v372 data];
                  [v375 setObject:v374 forKeyedSubscript:@"userFrames"];

                  if (!v57) {
                    goto LABEL_558;
                  }
                  id v376 = 0;
                  v377 = ss_trace_buffer + 16;
                  uint64_t v378 = v57;
                  do
                  {
                    v379 = v376;
                    uint64_t v380 = *v377;
                    id v518 = v376;
                    v381 = [v505 searchFrame:v380 in:v516 result:&v518];
                    id v376 = v518;

                    [v374 addObject:v381];
                    if (!v376 && *v377) {
                      objc_msgSend(v373, "setUnindexed_frames:", objc_msgSend(v373, "unindexed_frames") + 1);
                    }
                    ++v377;
                    --v378;
                  }
                  while (v378);
                  goto LABEL_557;
                case 0x916:
                  if (!v337 || (v382 = v337, [v337 type] != 2308)) {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.8();
                  }
                  v373 = [v17 parent];
                  v374 = [MEMORY[0x1E4F1CA48] array];
                  v383 = [v382 data];
                  [v383 setObject:v374 forKeyedSubscript:@"userFrames"];

                  if (!v57) {
                    goto LABEL_558;
                  }
                  id v376 = 0;
                  v384 = (uint64_t *)(ss_trace_buffer + 16);
                  uint64_t v385 = v57;
                  do
                  {
                    v386 = v376;
                    uint64_t v387 = *v384;
                    id v519 = v376;
                    v388 = [v505 searchFrame:v387 in:v516 result:&v519];
                    id v376 = v519;

                    [v374 addObject:v388];
                    if (!v376 && *v384) {
                      objc_msgSend(v373, "setUnindexed_frames:", objc_msgSend(v373, "unindexed_frames") + 1);
                    }
                    ++v384;
                    --v385;
                  }
                  while (v385);
LABEL_557:

                  self = v517;
LABEL_558:

                  id v10 = v505;
                  unint64_t v24 = 0x1E4F28000;
                  goto LABEL_565;
                case 0x917:
                case 0x918:
                case 0x919:
                case 0x91A:
                case 0x91B:
                case 0x91C:
                  goto LABEL_532;
                case 0x91D:
                  if (!v337
                    || [v337 type] != 2307
                    && [v484 type] != 2353)
                  {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]1();
                  }
                  v389 = [v484 data];

                  v337 = v484;
                  if (!v389) {
                    goto LABEL_566;
                  }
                  v346 = [v484 data];
                  [v346 addWaitInfoDesc:ss_trace_buffer + 16 count:v57 elSize:v58];
                  goto LABEL_564;
                default:
                  if ((HIDWORD(v57) - 48) < 2) {
                    goto LABEL_528;
                  }
                  if (HIDWORD(v57) != 2311) {
                    goto LABEL_532;
                  }
                  if (!v337
                    || [v337 type] != 2307
                    && [v484 type] != 2353)
                  {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]0();
                  }
                  v347 = [v484 data];

                  v337 = v484;
                  if (!v347) {
                    goto LABEL_566;
                  }
                  v348 = [MEMORY[0x1E4F1CA48] array];
                  v349 = [v484 data];
                  [v349 setObject:v348 forKeyedSubscript:@"donatingPids"];

                  if (v57)
                  {
                    v350 = (unsigned int *)(ss_trace_buffer + 16);
                    uint64_t v351 = v57;
                    do
                    {
                      unsigned int v352 = *v350++;
                      v353 = [*(id *)(v24 + 3792) numberWithInt:v352];
                      [v348 addObject:v353];

                      --v351;
                    }
                    while (v351);
                  }

LABEL_539:
                  self = v517;
                  break;
              }
              goto LABEL_565;
            }
            if (SHIDWORD(v57) > 2349)
            {
              if (HIDWORD(v57) == 2350)
              {
LABEL_528:
                if (!v337
                  || (BOOL v364 = [v337 type] == 2307, v337 = v484, !v364)
                  && (BOOL v364 = [v484 type] == 2353, v337 = v484, !v364))
                {
                  -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.5();
                }
                goto LABEL_566;
              }
              if (HIDWORD(v57) != 2361) {
                goto LABEL_532;
              }
              if (!v337 || [v337 type] != 2307) {
                -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]3();
              }
              v354 = [MEMORY[0x1E4F1CA48] array];
              if (v57)
              {
                uint64_t v355 = v57;
                v356 = ss_trace_buffer + 36;
                do
                {
                  if (*(void *)(v356 - 12) && *((_DWORD *)v356 - 1) && *v356 && *(void *)(v356 - 20))
                  {
                    v357 = [MEMORY[0x1E4F1CA60] dictionary];
                    v358 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*(void *)(v356 - 12)];
                    [v357 setObject:v358 forKeyedSubscript:@"suspensionThreadID"];

                    v359 = [*(id *)(v24 + 3792) numberWithInt:*((unsigned int *)v356 - 1)];
                    [v357 setObject:v359 forKeyedSubscript:@"suspensionProcID"];

                    v360 = [NSString stringWithUTF8String:v356];
                    [v357 setObject:v360 forKeyedSubscript:@"suspensionProcName"];

                    unint64_t v361 = *(void *)(v356 - 20);
                    if (v501) {
                      unint64_t v361 = v361 * *v501 / v501[1];
                    }
                    v362 = [*(id *)(v24 + 3792) numberWithDouble:(double)v361 / 1000000000.0];
                    [v357 setObject:v362 forKeyedSubscript:@"suspensionTime"];

                    [v354 addObject:v357];
                    self = v517;
                  }
                  v356 += 85;
                  --v355;
                }
                while (v355);
              }
              if ([v354 count])
              {
                v363 = [v484 data];
                [v363 setObject:v354 forKeyedSubscript:@"suspensionSources"];
              }
              id v10 = v505;
            }
            else
            {
              if (HIDWORD(v57) != 2343)
              {
                if (HIDWORD(v57) == 2345)
                {
                  if (!v337
                    || [v337 type] != 2307
                    && [v484 type] != 2353)
                  {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]2();
                  }
                  v345 = [v484 data];

                  v337 = v484;
                  if (v345)
                  {
                    v346 = [v484 data];
                    [v346 addTurnstileInfoDesc:ss_trace_buffer + 16 count:v57 elSize:v58];
LABEL_564:

                    goto LABEL_565;
                  }
LABEL_566:

                  unint64_t v13 = v509;
                  goto LABEL_585;
                }
LABEL_532:
                uint64_t v365 = kcdata_iter_size((uint64_t)ss_trace_buffer);
                NSLog(&cfstr_UnknownKcdataA.isa, HIDWORD(v57), v57, v365, *((void *)ss_trace_buffer + 1));
                goto LABEL_565;
              }
              if (!v337) {
                goto LABEL_566;
              }
              BOOL v364 = [v337 type] == 2370;
              v337 = v484;
              if (!v364) {
                goto LABEL_566;
              }
              v390 = objc_msgSend(*(id *)(v24 + 3792), "numberWithInt:", objc_msgSend(v484, "pid"));
              v391 = [v496 objectForKeyedSubscript:v390];
              v392 = v391;
              if (v391
                && (objc_msgSend(*(id *)(v24 + 3792), "numberWithUnsignedInt:", objc_msgSend(v391, "sharedCacheID")),
                    v393 = objc_claimAutoreleasedReturnValue(),
                    int v394 = [v393 isEqual:v390],
                    v393,
                    v394))
              {
                [v392 setSharedCacheLayout:ss_trace_buffer + 16 andCount:v57];
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:](v543, (uint64_t)v390, &v544);
              }

              self = v517;
            }
LABEL_565:
            v337 = v484;
            goto LABEL_566;
          }
          switch(HIDWORD(v57))
          {
            case 0x30:
              uint64_t v58 = 20;
              goto LABEL_483;
            case 0x31:
              uint64_t v58 = 24;
              goto LABEL_483;
            case 0x81A:
LABEL_431:
              uint64_t v58 = 8;
              goto LABEL_483;
          }
        }
        else if (v57)
        {
          uint64_t v58 = (v25 - (*(_DWORD *)ss_trace_buffer & 0xF)) / v57;
          goto LABEL_483;
        }
LABEL_482:
        uint64_t v58 = 0;
        goto LABEL_483;
      }
      v42 = ss_trace_buffer + 16;
      if (ss_trace_buffer != (char *)-48)
      {
        uint64_t v43 = [*(id *)(v24 + 3792) numberWithUnsignedLongLong:*((void *)ss_trace_buffer + 6)];
        goto LABEL_75;
      }
    }
    else if (v27 == 1)
    {
      if (ss_trace_buffer != (char *)-48)
      {
        v42 = ss_trace_buffer + 16;
        uint64_t v43 = [NSString stringWithUTF8String:ss_trace_buffer + 48];
        goto LABEL_75;
      }
    }
    else
    {
      if (v27 != 2) {
        goto LABEL_62;
      }
      v42 = ss_trace_buffer + 16;
      if (ss_trace_buffer != (char *)-48)
      {
        uint64_t v43 = [*(id *)(v24 + 3792) numberWithUnsignedInt:*((unsigned int *)ss_trace_buffer + 12)];
LABEL_75:
        unint64_t v63 = v13;
        v64 = (void *)v43;
        [(OSAStackShotReport *)self addCustomField:v42 value:v43 into:v17];

        unint64_t v13 = v63;
      }
    }
LABEL_585:
    ss_trace_uint64_t buffer = &v14[*((unsigned int *)ss_trace_buffer + 1)];
    id v14 = ss_trace_buffer + 16;
    if ((unint64_t)(ss_trace_buffer + 16) > v13) {
      goto LABEL_630;
    }
  }
  if ([v17 count]) {
    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]();
  }
  [(OSAExclaveContainer *)v494 appendNotesTo:self->super._notes];
  id v8 = v497;
  if (v477)
  {
    v526 = &unk_1EFE254C0;
    v527 = &stru_1EFE17BD0;
    v404 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v527 forKeys:&v526 count:1];
    v497[2](v497, v404);
  }
  if (v499) {
    int v405 = v491;
  }
  else {
    int v405 = 0;
  }
  if (v405 == 1)
  {
    memset(out, 0, sizeof(out));
    uuid_unparse((const unsigned __int8 *)([(OSASharedCacheEntry *)v499 original] + 8), out);
    v524 = @"systemDefaultSharedCache";
    v522[0] = @"uuid";
    v406 = [NSString stringWithUTF8String:out];
    v523[0] = v406;
    v522[1] = @"slide";
    v407 = objc_msgSend(*(id *)(v24 + 3792), "numberWithUnsignedLongLong:", (void)-[OSASharedCacheEntry original](v499, "original")[32]);
    v523[1] = v407;
    v408 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v523 forKeys:v522 count:2];
    v525 = v408;
    v409 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v525 forKeys:&v524 count:1];
    v497[2](v497, v409);

    self = v517;
  }
  if (v487)
  {
    v410 = self->super._notes;
    v411 = NSString;
    uint64_t v412 = [v489 count];
    v413 = [v489 sortedPids];
    v414 = [v411 stringWithFormat:@"resampled %d of %d threads with truncated backtraces from %d pids: %@", v487, v490, v412, v413];
    [(NSMutableArray *)v410 addObject:v414];

    self = v517;
    if (v471)
    {
      v520 = @"postSampleVMStats";
      v415 = [(OSAStackShotReport *)v517 getVMStatistics];
      v521 = v415;
      v416 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v521 forKeys:&v520 count:1];
      v497[2](v497, v416);
    }
  }
  v417 = v498;
  id v9 = v495;
  if ([v498 count])
  {
    v418 = self->super._notes;
    v419 = NSString;
    uint64_t v420 = [v498 count];
    v421 = [v498 sortedPids];
    uint64_t v435 = v420;
    v417 = v498;
    v422 = [v419 stringWithFormat:@"resampled %d of %d images missing from %d pids: %@", v469, v470, v435, v421];
    [(NSMutableArray *)v418 addObject:v422];

    self = v517;
  }
  if (v476)
  {
    v423 = self->super._notes;
    v424 = NSString;
    uint64_t v425 = [v488 count];
    v426 = [v488 sortedPids];
    uint64_t v433 = v425;
    v417 = v498;
    v427 = [v424 stringWithFormat:@"%d unindexed user-stack frames from %d pids: %@", v476, v433, v426];
    [(NSMutableArray *)v423 addObject:v427];

    self = v517;
  }
  if (v475)
  {
    v428 = self->super._notes;
    v429 = NSString;
    uint64_t v430 = [v478 count];
    v431 = [v478 sortedPids];
    uint64_t v434 = v430;
    v417 = v498;
    v432 = [v429 stringWithFormat:@"%d unindexed re-sampled frames from %d pids: %@", v475, v434, v431];
    [(NSMutableArray *)v428 addObject:v432];
  }
  if ((CSIsNull() & 1) == 0) {
    CSRelease();
  }

LABEL_8:
}

- (BOOL)includeSyslog
{
  return self->_includeSyslog;
}

- (void)setIncludeSyslog:(BOOL)a3
{
  self->_includeSyslog = a3;
}

- (NSArray)frontmostPids
{
  return &self->_frontmostPids->super;
}

- (unint64_t)capture_absoluteTime
{
  return self->_capture_absoluteTime;
}

- (const)ss_trace_buffer
{
  return self->_ss_trace_buffer;
}

- (unsigned)ss_trace_length
{
  return self->_ss_trace_length;
}

- (int)jetsamLevel
{
  return self->_jetsamLevel;
}

- (void)setJetsamLevel:(int)a3
{
  self->_jetsamLevel = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_unsigned int flags = a3;
}

- (BOOL)dead_snapshot
{
  return self->_dead_snapshot;
}

- (void)setDead_snapshot:(BOOL)a3
{
  self->_dead_snapshot = a3;
}

- (unsigned)ss_sequence
{
  return self->_ss_sequence;
}

- (void)setSs_sequence:(unsigned int)a3
{
  self->_ss_sequence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extras, 0);
  objc_storeStrong((id *)&self->_frontmostPids, 0);
  objc_storeStrong((id *)&self->_thermalSensorValues, 0);
  objc_storeStrong((id *)&self->_additionalPayload, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.1()
{
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.2()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 2018, "[kc_stack count] == 0");
}

- (void)decodeKCDataWithBlock:(uint8_t *)buf withTuning:(uint64_t)a2 usingCatalog:(void *)a3 .cold.3(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a2;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Expected a task specific shared cache with ID %{public}@ but none was found", buf, 0xCu);
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.5()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1270, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.6()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1275, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.7()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1285, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.8()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1297, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.9()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1315, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.10()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1330, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.11()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1342, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.12()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1349, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.13()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1357, "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.14()
{
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.15()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1523, "kcdata_iter_container_id(kcData) == end.tag");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.16()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1633, "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.17()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1835, "container && (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.18()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1846, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.19()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1902, "container.type == STACKSHOT_KCCONTAINER_THREAD");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.20()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1912, "container.type == STACKSHOT_KCCONTAINER_THREAD");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.21()
{
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.22()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1944, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.23()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1954, "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.24()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1963, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.25()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1972, "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.26()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1983, "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.27()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create symbolicator", v0, 2u);
}

@end