@interface PTTraceConfig
+ (BOOL)resetConfig;
+ (BOOL)supportsSecureCoding;
+ (id)_defaultTraceRecordConfig;
+ (id)configWithDictionary:(id)a3;
+ (id)configWithTemplate:(unint64_t)a3;
+ (id)configWithTracePlanName:(id)a3;
+ (id)configWithTracePlanURL:(id)a3;
+ (id)getCurrentConfig;
- (BOOL)compressWhenFinished;
- (BOOL)enableSwiftUITracing;
- (BOOL)includeKernelStacks;
- (BOOL)includeOSLogs;
- (BOOL)includeOSSignposts;
- (BOOL)overrideIncludeOSLogs;
- (BOOL)overrideIncludeOSSignposts;
- (BOOL)overrideSymbolicate;
- (BOOL)skipNotification;
- (BOOL)storeConfig;
- (BOOL)symbolicate;
- (BOOL)useTraceRecord;
- (BOOL)validateConfig;
- (NSMutableArray)traceGroups;
- (NSString)ownerName;
- (NSString)planNameOrPath;
- (NSString)traceName;
- (NSURL)traceDirectoryURL;
- (NSXPCConnection)connection;
- (OS_os_transaction)tracingActiveTransaction;
- (PTTraceConfig)initWithCoder:(id)a3;
- (id)_getRemoteObjectProxy;
- (id)copyWithZone:(_NSZone *)a3;
- (int)ownerPID;
- (unint64_t)callstackSamplingRateMS;
- (unint64_t)kernelBufferDrainRateMS;
- (unint64_t)kernelBufferSizeMB;
- (unint64_t)source;
- (unint64_t)traceDurationSecs;
- (unint64_t)traceTimeoutS;
- (unint64_t)traceType;
- (unsigned)kernelBufferDrainQoS;
- (void)_initConnection;
- (void)_invalidateSession;
- (void)encodeWithCoder:(id)a3;
- (void)setCallstackSamplingRateMS:(unint64_t)a3;
- (void)setCompressWhenFinished:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setEnableSwiftUITracing:(BOOL)a3;
- (void)setIncludeKernelStacks:(BOOL)a3;
- (void)setIncludeOSLogs:(BOOL)a3;
- (void)setIncludeOSSignposts:(BOOL)a3;
- (void)setKernelBufferDrainQoS:(unsigned int)a3;
- (void)setKernelBufferDrainRateMS:(unint64_t)a3;
- (void)setKernelBufferSizeMB:(unint64_t)a3;
- (void)setOverrideIncludeOSLogs:(BOOL)a3;
- (void)setOverrideIncludeOSSignposts:(BOOL)a3;
- (void)setOverrideSymbolicate:(BOOL)a3;
- (void)setOwnerName:(id)a3;
- (void)setOwnerPID:(int)a3;
- (void)setPlanNameOrPath:(id)a3;
- (void)setSkipNotification:(BOOL)a3;
- (void)setSource:(unint64_t)a3;
- (void)setSymbolicate:(BOOL)a3;
- (void)setTraceDirectoryURL:(id)a3;
- (void)setTraceDurationSecs:(unint64_t)a3;
- (void)setTraceGroups:(id)a3;
- (void)setTraceName:(id)a3;
- (void)setTraceTimeoutS:(unint64_t)a3;
- (void)setTraceType:(unint64_t)a3;
- (void)setTracingActiveTransaction:(id)a3;
- (void)setUseTraceRecord:(BOOL)a3;
@end

@implementation PTTraceConfig

+ (id)configWithTemplate:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = objc_alloc_init(PTTraceConfig);
  [(PTTraceConfig *)v4 setSymbolicate:1];
  [(PTTraceConfig *)v4 setCallstackSamplingRateMS:1];
  [(PTTraceConfig *)v4 setTraceType:1];
  v5 = [NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/"];
  [(PTTraceConfig *)v4 setTraceDirectoryURL:v5];

  [(PTTraceConfig *)v4 setTraceName:0];
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &unk_26D088D30, &unk_26D088D48, &unk_26D088D60, &unk_26D088D78, &unk_26D088D90, 0);
  [(PTTraceConfig *)v4 setTraceGroups:v6];

  [(PTTraceConfig *)v4 setCompressWhenFinished:1];
  [(PTTraceConfig *)v4 setIncludeOSLogs:1];
  [(PTTraceConfig *)v4 setIncludeOSSignposts:1];
  [(PTTraceConfig *)v4 setTraceTimeoutS:0];
  [(PTTraceConfig *)v4 setUseTraceRecord:0];
  [(PTTraceConfig *)v4 setTraceDurationSecs:0];
  [(PTTraceConfig *)v4 setSkipNotification:0];
  [(PTTraceConfig *)v4 setIncludeKernelStacks:1];
  [(PTTraceConfig *)v4 setEnableSwiftUITracing:0];
  [(PTTraceConfig *)v4 setKernelBufferSizeMB:sysconf(57) << 6];
  if ([(PTTraceConfig *)v4 kernelBufferSizeMB] <= 0x7F) {
    [(PTTraceConfig *)v4 setKernelBufferSizeMB:128];
  }
  if ([(PTTraceConfig *)v4 kernelBufferSizeMB] >= 0x401) {
    [(PTTraceConfig *)v4 setKernelBufferSizeMB:1024];
  }
  [(PTTraceConfig *)v4 setKernelBufferDrainQoS:25];
  [(PTTraceConfig *)v4 setKernelBufferDrainRateMS:500];
  if (a3 - 1 < 2)
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &unk_26D088D30, &unk_26D088D48, &unk_26D088D60, &unk_26D088D78, &unk_26D088D90, 0);
    v7 = LABEL_9:;
    [(PTTraceConfig *)v4 setTraceGroups:v7];

    goto LABEL_12;
  }
  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &unk_26D088DA8, &unk_26D088D48, &unk_26D088D90, 0, v20, v21);
    goto LABEL_9;
  }
  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v8) {
    +[PTTraceConfig configWithTemplate:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_12:
  [(PTTraceConfig *)v4 setOwnerPID:getpid()];
  proc_name([(PTTraceConfig *)v4 ownerPID], buffer, 0x21u);
  v16 = [NSString stringWithCString:buffer encoding:4];
  [(PTTraceConfig *)v4 setOwnerName:v16];

  v17 = [(PTTraceConfig *)v4 ownerName];

  if (!v17)
  {
    v18 = [NSString stringWithCString:buffer encoding:1];
    [(PTTraceConfig *)v4 setOwnerName:v18];
  }
  [(PTTraceConfig *)v4 setSource:4];
  return v4;
}

+ (id)configWithDictionary:(id)a3
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (uint64_t *)MEMORY[0x263EFF4A0];
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    [MEMORY[0x263EFF940] raise:*v4 format:@"traceConfigurationDictionary is not a valid dictionary."];
  }
  v5 = [v3 valueForKey:@"traceTemplate"];

  if (!v5)
  {
    uint64_t v10 = 1;
    goto LABEL_10;
  }
  v6 = [v3 valueForKey:@"traceTemplate"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*v4 format:@"traceTemplate is not a string."];
  }
  BOOL v8 = [v3 valueForKey:@"traceTemplate"];
  uint64_t v9 = traceConfigTemplateForString(v8);

  if (v9)
  {
    uint64_t v10 = v9;
LABEL_10:
    uint64_t v11 = +[PTTraceConfig configWithTemplate:v10];
    goto LABEL_12;
  }
  uint64_t v12 = (void *)MEMORY[0x263EFF940];
  uint64_t v13 = *v4;
  uint64_t v14 = [v3 valueForKey:@"traceTemplate"];
  [v12 raise:v13, @"%@ is not a valid trace template.", v14 format];

  uint64_t v11 = 0;
LABEL_12:
  uint64_t v15 = [v3 valueForKey:@"symbolicate"];

  if (v15)
  {
    v16 = [v3 valueForKey:@"symbolicate"];
    objc_opt_class();
    char v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"symbolicate" format];
    }
    v18 = [v3 valueForKey:@"symbolicate"];
    if ([v18 unsignedLongValue])
    {
      v19 = [v3 valueForKey:@"symbolicate"];
      uint64_t v20 = [v19 unsignedLongValue];

      if (v20 != 1) {
        [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"symbolicate" format];
      }
    }
    else
    {
    }
    uint64_t v21 = [v3 valueForKey:@"symbolicate"];
    objc_msgSend(v11, "setSymbolicate:", objc_msgSend(v21, "BOOLValue"));
  }
  v22 = [v3 valueForKey:@"callstackSamplingRateMS"];

  if (v22)
  {
    uint64_t v23 = [v3 valueForKey:@"callstackSamplingRateMS"];
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass();

    if ((v24 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not an unsigned long type.", @"callstackSamplingRateMS" format];
    }
    v25 = [v3 valueForKey:@"callstackSamplingRateMS"];
    objc_msgSend(v11, "setCallstackSamplingRateMS:", objc_msgSend(v25, "unsignedLongValue"));
  }
  v26 = [v3 valueForKey:@"traceName"];

  if (v26)
  {
    v27 = [v3 valueForKey:@"traceName"];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if ((v28 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a string type.", @"traceName" format];
    }
    v29 = [v3 valueForKey:@"traceName"];
    v30 = (void *)[v29 copy];
    [v11 setTraceName:v30];
  }
  v31 = [v3 valueForKey:@"compressWhenFinished"];

  if (v31)
  {
    v32 = [v3 valueForKey:@"compressWhenFinished"];
    objc_opt_class();
    char v33 = objc_opt_isKindOfClass();

    if ((v33 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"compressWhenFinished" format];
    }
    v34 = [v3 valueForKey:@"compressWhenFinished"];
    if ([v34 unsignedLongValue])
    {
      v35 = [v3 valueForKey:@"compressWhenFinished"];
      uint64_t v36 = [v35 unsignedLongValue];

      if (v36 != 1) {
        [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"compressWhenFinished" format];
      }
    }
    else
    {
    }
    v37 = [v3 valueForKey:@"compressWhenFinished"];
    objc_msgSend(v11, "setCompressWhenFinished:", objc_msgSend(v37, "BOOLValue"));
  }
  v38 = [v3 valueForKey:@"includeOSLogs"];

  if (v38)
  {
    v39 = [v3 valueForKey:@"includeOSLogs"];
    objc_opt_class();
    char v40 = objc_opt_isKindOfClass();

    if ((v40 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"includeOSLogs" format];
    }
    v41 = [v3 valueForKey:@"includeOSLogs"];
    if ([v41 unsignedLongValue])
    {
      v42 = [v3 valueForKey:@"includeOSLogs"];
      uint64_t v43 = [v42 unsignedLongValue];

      if (v43 != 1) {
        [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"includeOSLogs" format];
      }
    }
    else
    {
    }
    v44 = [v3 valueForKey:@"includeOSLogs"];
    objc_msgSend(v11, "setIncludeOSLogs:", objc_msgSend(v44, "BOOLValue"));
  }
  v45 = [v3 valueForKey:@"includeOSSignposts"];

  if (v45)
  {
    v46 = [v3 valueForKey:@"includeOSSignposts"];
    objc_opt_class();
    char v47 = objc_opt_isKindOfClass();

    if ((v47 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"includeOSSignposts" format];
    }
    v48 = [v3 valueForKey:@"includeOSSignposts"];
    if ([v48 unsignedLongValue])
    {
      v49 = [v3 valueForKey:@"includeOSSignposts"];
      uint64_t v50 = [v49 unsignedLongValue];

      if (v50 != 1) {
        [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"includeOSSignposts" format];
      }
    }
    else
    {
    }
    v51 = [v3 valueForKey:@"includeOSSignposts"];
    objc_msgSend(v11, "setIncludeOSSignposts:", objc_msgSend(v51, "BOOLValue"));
  }
  v52 = [v3 valueForKey:@"traceTimeoutS"];

  if (v52)
  {
    v53 = [v3 valueForKey:@"traceTimeoutS"];
    objc_opt_class();
    char v54 = objc_opt_isKindOfClass();

    if ((v54 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not an unsigned long type.", @"traceTimeoutS" format];
    }
    v55 = [v3 valueForKey:@"traceTimeoutS"];
    objc_msgSend(v11, "setTraceTimeoutS:", objc_msgSend(v55, "unsignedLongValue"));
  }
  v56 = [v3 valueForKey:@"useTraceRecord"];

  if (v56)
  {
    v57 = [v3 valueForKey:@"useTraceRecord"];
    objc_opt_class();
    char v58 = objc_opt_isKindOfClass();

    if ((v58 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"useTraceRecord" format];
    }
    v59 = [v3 valueForKey:@"useTraceRecord"];
    if ([v59 unsignedLongValue])
    {
      v60 = [v3 valueForKey:@"useTraceRecord"];
      uint64_t v61 = [v60 unsignedLongValue];

      if (v61 != 1) {
        [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"useTraceRecord" format];
      }
    }
    else
    {
    }
    v62 = [v3 valueForKey:@"useTraceRecord"];
    objc_msgSend(v11, "setUseTraceRecord:", objc_msgSend(v62, "BOOLValue"));
  }
  v63 = [v3 valueForKey:@"traceDurationSecs"];

  if (v63)
  {
    v64 = [v3 valueForKey:@"traceDurationSecs"];
    objc_opt_class();
    char v65 = objc_opt_isKindOfClass();

    if ((v65 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not an unsigned long type.", @"traceDurationSecs" format];
    }
    v66 = [v3 valueForKey:@"traceDurationSecs"];
    objc_msgSend(v11, "setTraceDurationSecs:", objc_msgSend(v66, "unsignedLongValue"));
  }
  v67 = [v3 valueForKey:@"skipNotification"];

  if (v67)
  {
    v68 = [v3 valueForKey:@"skipNotification"];
    objc_opt_class();
    char v69 = objc_opt_isKindOfClass();

    if ((v69 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"skipNotification" format];
    }
    v70 = [v3 valueForKey:@"skipNotification"];
    if ([v70 unsignedLongValue])
    {
      v71 = [v3 valueForKey:@"skipNotification"];
      uint64_t v72 = [v71 unsignedLongValue];

      if (v72 != 1) {
        [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"skipNotification" format];
      }
    }
    else
    {
    }
    v73 = [v3 valueForKey:@"skipNotification"];
    objc_msgSend(v11, "setSkipNotification:", objc_msgSend(v73, "BOOLValue"));
  }
  v74 = [v3 valueForKey:@"includeKernelStacks"];

  if (v74)
  {
    v75 = [v3 valueForKey:@"includeKernelStacks"];
    objc_opt_class();
    char v76 = objc_opt_isKindOfClass();

    if ((v76 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"includeKernelStacks" format];
    }
    v77 = [v3 valueForKey:@"includeKernelStacks"];
    if ([v77 unsignedLongValue])
    {
      v78 = [v3 valueForKey:@"includeKernelStacks"];
      uint64_t v79 = [v78 unsignedLongValue];

      if (v79 != 1) {
        [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"includeKernelStacks" format];
      }
    }
    else
    {
    }
    v80 = [v3 valueForKey:@"includeKernelStacks"];
    objc_msgSend(v11, "setIncludeKernelStacks:", objc_msgSend(v80, "BOOLValue"));
  }
  v81 = [v3 valueForKey:@"kernelBufferSizeMB"];

  if (v81)
  {
    v82 = [v3 valueForKey:@"kernelBufferSizeMB"];
    objc_opt_class();
    char v83 = objc_opt_isKindOfClass();

    if ((v83 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not an unsigned long type.", @"kernelBufferSizeMB" format];
    }
    v84 = [v3 valueForKey:@"kernelBufferSizeMB"];
    objc_msgSend(v11, "setKernelBufferSizeMB:", objc_msgSend(v84, "unsignedLongValue"));
  }
  v85 = [v3 valueForKey:@"kernelBufferDrainRateMS"];

  if (v85)
  {
    v86 = [v3 valueForKey:@"kernelBufferDrainRateMS"];
    objc_opt_class();
    char v87 = objc_opt_isKindOfClass();

    if ((v87 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not an unsigned long type.", @"kernelBufferDrainRateMS" format];
    }
    v88 = [v3 valueForKey:@"kernelBufferDrainRateMS"];
    objc_msgSend(v11, "setKernelBufferDrainRateMS:", objc_msgSend(v88, "unsignedLongValue"));
  }
  v89 = [v3 valueForKey:@"kernelBufferDrainQoS"];

  if (v89)
  {
    v90 = [v3 valueForKey:@"kernelBufferDrainQoS"];
    objc_opt_class();
    char v91 = objc_opt_isKindOfClass();

    if ((v91 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not an unsigned integer type.", @"kernelBufferDrainQoS" format];
    }
    v92 = [v3 valueForKey:@"kernelBufferDrainQoS"];
    objc_msgSend(v11, "setKernelBufferDrainQoS:", objc_msgSend(v92, "unsignedIntValue"));
  }
  v93 = [v3 valueForKey:@"enableSwiftUITracing"];

  if (v93)
  {
    v94 = [v3 valueForKey:@"enableSwiftUITracing"];
    objc_opt_class();
    char v95 = objc_opt_isKindOfClass();

    if ((v95 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"enableSwiftUITracing" format];
    }
    v96 = [v3 valueForKey:@"enableSwiftUITracing"];
    if ([v96 unsignedLongValue])
    {
      v97 = [v3 valueForKey:@"enableSwiftUITracing"];
      uint64_t v98 = [v97 unsignedLongValue];

      if (v98 != 1) {
        [MEMORY[0x263EFF940] raise:*v4, @"%@ is not a BOOLean type.", @"enableSwiftUITracing" format];
      }
    }
    else
    {
    }
    v99 = [v3 valueForKey:@"enableSwiftUITracing"];
    objc_msgSend(v11, "setEnableSwiftUITracing:", objc_msgSend(v99, "BOOLValue"));
  }
  v100 = [v3 valueForKey:@"traceDirectoryURL"];

  if (v100)
  {
    v101 = [v3 valueForKey:@"traceDirectoryURL"];
    objc_opt_class();
    char v102 = objc_opt_isKindOfClass();

    if ((v102 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4 format:@"traceDirectoryURL is not a string type."];
    }
    v103 = NSURL;
    v104 = [v3 valueForKey:@"traceDirectoryURL"];
    v105 = [v103 fileURLWithPath:v104];
    [v11 setTraceDirectoryURL:v105];
  }
  v106 = [v3 valueForKey:@"traceType"];

  if (v106)
  {
    v107 = [v3 valueForKey:@"traceType"];
    objc_opt_class();
    char v108 = objc_opt_isKindOfClass();

    if ((v108 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4 format:@"traceType is not a string type."];
    }
    v109 = [v3 valueForKey:@"traceType"];
    [v11 setTraceType:traceTypeForString(v109)];
  }
  v110 = [v3 valueForKey:@"traceGroups"];

  if (v110)
  {
    v111 = [v3 valueForKey:@"traceGroups"];
    objc_opt_class();
    char v112 = objc_opt_isKindOfClass();

    if ((v112 & 1) == 0) {
      [MEMORY[0x263EFF940] raise:*v4 format:@"traceGroups is not an NSArray type."];
    }
    v113 = [v3 valueForKey:@"traceGroups"];
    v114 = [MEMORY[0x263EFF980] array];
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    id v115 = v113;
    uint64_t v116 = [v115 countByEnumeratingWithState:&v124 objects:v128 count:16];
    if (v116)
    {
      uint64_t v117 = v116;
      uint64_t v118 = *(void *)v125;
      do
      {
        for (uint64_t i = 0; i != v117; ++i)
        {
          if (*(void *)v125 != v118) {
            objc_enumerationMutation(v115);
          }
          v120 = *(void **)(*((void *)&v124 + 1) + 8 * i);
          if (v120 && traceGroupForString(*(void **)(*((void *)&v124 + 1) + 8 * i)))
          {
            v121 = [NSNumber numberWithUnsignedInteger:traceGroupForString(v120)];
            [v114 addObject:v121];
          }
        }
        uint64_t v117 = [v115 countByEnumeratingWithState:&v124 objects:v128 count:16];
      }
      while (v117);
    }

    if ([v114 count]) {
      [v11 setTraceGroups:v114];
    }
  }
  [v11 setSource:4];
  id v122 = v11;

  return v122;
}

+ (id)_defaultTraceRecordConfig
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = objc_alloc_init(PTTraceConfig);
  [(PTTraceConfig *)v2 setUseTraceRecord:1];
  [(PTTraceConfig *)v2 setTraceType:1];
  id v3 = [NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/"];
  [(PTTraceConfig *)v2 setTraceDirectoryURL:v3];

  [(PTTraceConfig *)v2 setTraceName:0];
  [(PTTraceConfig *)v2 setSkipNotification:0];
  [(PTTraceConfig *)v2 setCompressWhenFinished:1];
  [(PTTraceConfig *)v2 setKernelBufferSizeMB:0];
  [(PTTraceConfig *)v2 setOverrideIncludeOSSignposts:0];
  [(PTTraceConfig *)v2 setOverrideIncludeOSLogs:0];
  [(PTTraceConfig *)v2 setOverrideSymbolicate:0];
  [(PTTraceConfig *)v2 setOwnerPID:getpid()];
  proc_name([(PTTraceConfig *)v2 ownerPID], buffer, 0x21u);
  v4 = [NSString stringWithCString:buffer encoding:4];
  [(PTTraceConfig *)v2 setOwnerName:v4];

  v5 = [(PTTraceConfig *)v2 ownerName];

  if (!v5)
  {
    v6 = [NSString stringWithCString:buffer encoding:1];
    [(PTTraceConfig *)v2 setOwnerName:v6];
  }
  return v2;
}

+ (id)configWithTracePlanName:(id)a3
{
  id v3 = a3;
  v4 = +[PTTraceConfig _defaultTraceRecordConfig];
  [v4 setPlanNameOrPath:v3];

  return v4;
}

+ (id)configWithTracePlanURL:(id)a3
{
  id v3 = a3;
  v4 = +[PTTraceConfig _defaultTraceRecordConfig];
  v5 = [v3 path];

  [v4 setPlanNameOrPath:v5];
  return v4;
}

+ (id)getCurrentConfig
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "Getting Current Config", buf, 2u);
  }
  *(void *)buf = 0;
  uint64_t v9 = buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  uint64_t v13 = objc_alloc_init(PTTraceConfig);
  id v3 = [*((id *)v9 + 5) connection];

  if (!v3) {
    [*((id *)v9 + 5) _initConnection];
  }
  v4 = [*((id *)v9 + 5) _getRemoteObjectProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__PTTraceConfig_getCurrentConfig__block_invoke;
  v7[3] = &unk_2644FBD48;
  v7[4] = buf;
  v7[5] = a1;
  [v4 getCurrentStoredConfig:v7];

  [*((id *)v9 + 5) _invalidateSession];
  id v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

void __33__PTTraceConfig_getCurrentConfig__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v11) {
      __33__PTTraceConfig_getCurrentConfig__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    uint64_t v19 = [*(id *)(a1 + 40) configWithTemplate:1];
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
  else
  {
    uint64_t v8 = [v6 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setSource:", objc_msgSend(v7, "source"));
  }
}

+ (BOOL)resetConfig
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "Resetting config", buf, 2u);
  }
  v2 = objc_alloc_init(PTTraceConfig);
  id v3 = [(PTTraceConfig *)v2 connection];

  if (!v3) {
    [(PTTraceConfig *)v2 _initConnection];
  }
  *(void *)buf = 0;
  uint64_t v8 = buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v4 = [(PTTraceConfig *)v2 _getRemoteObjectProxy];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __28__PTTraceConfig_resetConfig__block_invoke;
  v6[3] = &unk_2644FBD70;
  v6[4] = buf;
  [v4 resetConfig:v6];

  [(PTTraceConfig *)v2 _invalidateSession];
  LOBYTE(v4) = v8[24];
  _Block_object_dispose(buf, 8);

  return (char)v4;
}

void __28__PTTraceConfig_resetConfig__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v4) {
      __28__PTTraceConfig_resetConfig__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "Successfully reset config.", v12, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (BOOL)storeConfig
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "Storing config", buf, 2u);
  }
  id v3 = [(PTTraceConfig *)self connection];

  if (!v3) {
    [(PTTraceConfig *)self _initConnection];
  }
  *(void *)buf = 0;
  uint64_t v9 = buf;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  BOOL v4 = [(PTTraceConfig *)self _getRemoteObjectProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __28__PTTraceConfig_storeConfig__block_invoke;
  v7[3] = &unk_2644FBD70;
  v7[4] = buf;
  [v4 applyConfig:self withError:v7];

  [(PTTraceConfig *)self _invalidateSession];
  uint8_t v5 = v9[24];
  _Block_object_dispose(buf, 8);
  return v5;
}

void __28__PTTraceConfig_storeConfig__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __28__PTTraceConfig_storeConfig__block_invoke_cold_1((uint64_t)v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (BOOL)validateConfig
{
  return 1;
}

- (void)_initConnection
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.PerformanceTrace.PerformanceTraceService"];
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D08A930];
  [v5 setRemoteObjectInterface:v3];
  [v5 setInvalidationHandler:&__block_literal_global];
  [v5 setInterruptionHandler:&__block_literal_global_165];
  [(PTTraceConfig *)self setConnection:v5];
  BOOL v4 = [(PTTraceConfig *)self connection];
  [v4 resume];
}

void __32__PTTraceConfig__initConnection__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_INFO, "XPC connection invalidated.", v0, 2u);
  }
}

void __32__PTTraceConfig__initConnection__block_invoke_163()
{
  BOOL v0 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v0) {
    __32__PTTraceConfig__initConnection__block_invoke_163_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (id)_getRemoteObjectProxy
{
  uint64_t v2 = [(PTTraceConfig *)self connection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_167];

  return v3;
}

void __38__PTTraceConfig__getRemoteObjectProxy__block_invoke(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __38__PTTraceConfig__getRemoteObjectProxy__block_invoke_cold_1(a2);
  }
}

- (void)_invalidateSession
{
  uint64_t v3 = [(PTTraceConfig *)self connection];

  if (v3)
  {
    id v4 = [(PTTraceConfig *)self connection];
    [v4 invalidate];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PTTraceConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PTTraceConfig *)self init];
  if (v5)
  {
    -[PTTraceConfig setSymbolicate:](v5, "setSymbolicate:", [v4 decodeBoolForKey:@"symbolicate"]);
    -[PTTraceConfig setCallstackSamplingRateMS:](v5, "setCallstackSamplingRateMS:", (int)[v4 decodeIntForKey:@"callstackSamplingRateMS"]);
    uint64_t v6 = (void *)MEMORY[0x263EFF980];
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"traceGroups"];
    char v11 = [v6 arrayWithArray:v10];
    [(PTTraceConfig *)v5 setTraceGroups:v11];

    -[PTTraceConfig setTraceType:](v5, "setTraceType:", (int)[v4 decodeIntForKey:@"traceType"]);
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traceDirectoryURL"];
    [(PTTraceConfig *)v5 setTraceDirectoryURL:v12];

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traceName"];
    [(PTTraceConfig *)v5 setTraceName:v13];

    -[PTTraceConfig setCompressWhenFinished:](v5, "setCompressWhenFinished:", [v4 decodeBoolForKey:@"compressWhenFinished"]);
    -[PTTraceConfig setIncludeOSLogs:](v5, "setIncludeOSLogs:", [v4 decodeBoolForKey:@"includeOSLogs"]);
    -[PTTraceConfig setIncludeOSSignposts:](v5, "setIncludeOSSignposts:", [v4 decodeBoolForKey:@"includeOSSignposts"]);
    -[PTTraceConfig setTraceTimeoutS:](v5, "setTraceTimeoutS:", (int)[v4 decodeIntForKey:@"traceTimeoutS"]);
    -[PTTraceConfig setSkipNotification:](v5, "setSkipNotification:", [v4 decodeBoolForKey:@"skipNotification"]);
    -[PTTraceConfig setIncludeKernelStacks:](v5, "setIncludeKernelStacks:", [v4 decodeBoolForKey:@"includeKernelStacks"]);
    -[PTTraceConfig setKernelBufferSizeMB:](v5, "setKernelBufferSizeMB:", (int)[v4 decodeIntForKey:@"kernelBufferSizeMB"]);
    -[PTTraceConfig setKernelBufferDrainQoS:](v5, "setKernelBufferDrainQoS:", [v4 decodeIntForKey:@"kernelBufferDrainQoS"]);
    -[PTTraceConfig setKernelBufferDrainRateMS:](v5, "setKernelBufferDrainRateMS:", (int)[v4 decodeIntForKey:@"kernelBufferDrainRateMS"]);
    -[PTTraceConfig setOwnerPID:](v5, "setOwnerPID:", [v4 decodeIntForKey:@"ownerPID"]);
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerName"];
    [(PTTraceConfig *)v5 setOwnerName:v14];

    -[PTTraceConfig setSource:](v5, "setSource:", (int)[v4 decodeIntForKey:@"source"]);
    -[PTTraceConfig setTraceDurationSecs:](v5, "setTraceDurationSecs:", (int)[v4 decodeIntForKey:@"traceDurationSecs"]);
    -[PTTraceConfig setUseTraceRecord:](v5, "setUseTraceRecord:", [v4 decodeBoolForKey:@"useTraceRecord"]);
    -[PTTraceConfig setEnableSwiftUITracing:](v5, "setEnableSwiftUITracing:", [v4 decodeBoolForKey:@"enableSwiftUITracing"]);
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planNameOrPath"];
    [(PTTraceConfig *)v5 setPlanNameOrPath:v15];

    -[PTTraceConfig setOverrideSymbolicate:](v5, "setOverrideSymbolicate:", [v4 decodeBoolForKey:@"overrideSymbolicate"]);
    -[PTTraceConfig setOverrideIncludeOSSignposts:](v5, "setOverrideIncludeOSSignposts:", [v4 decodeBoolForKey:@"overrideIncludeOSSignposts"]);
    -[PTTraceConfig setOverrideIncludeOSLogs:](v5, "setOverrideIncludeOSLogs:", [v4 decodeBoolForKey:@"overrideIncludeOSLogs"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig symbolicate](self, "symbolicate"), @"symbolicate");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig callstackSamplingRateMS](self, "callstackSamplingRateMS"), @"callstackSamplingRateMS");
  id v4 = [(PTTraceConfig *)self traceGroups];
  [v9 encodeObject:v4 forKey:@"traceGroups"];

  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig traceType](self, "traceType"), @"traceType");
  uint64_t v5 = [(PTTraceConfig *)self traceDirectoryURL];
  [v9 encodeObject:v5 forKey:@"traceDirectoryURL"];

  uint64_t v6 = [(PTTraceConfig *)self traceName];
  [v9 encodeObject:v6 forKey:@"traceName"];

  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig compressWhenFinished](self, "compressWhenFinished"), @"compressWhenFinished");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig includeOSLogs](self, "includeOSLogs"), @"includeOSLogs");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig includeOSSignposts](self, "includeOSSignposts"), @"includeOSSignposts");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig traceTimeoutS](self, "traceTimeoutS"), @"traceTimeoutS");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig skipNotification](self, "skipNotification"), @"skipNotification");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig includeKernelStacks](self, "includeKernelStacks"), @"includeKernelStacks");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig kernelBufferSizeMB](self, "kernelBufferSizeMB"), @"kernelBufferSizeMB");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig kernelBufferDrainQoS](self, "kernelBufferDrainQoS"), @"kernelBufferDrainQoS");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig kernelBufferDrainRateMS](self, "kernelBufferDrainRateMS"), @"kernelBufferDrainRateMS");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig ownerPID](self, "ownerPID"), @"ownerPID");
  uint64_t v7 = [(PTTraceConfig *)self ownerName];
  [v9 encodeObject:v7 forKey:@"ownerName"];

  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig source](self, "source"), @"source");
  objc_msgSend(v9, "encodeInt:forKey:", -[PTTraceConfig traceDurationSecs](self, "traceDurationSecs"), @"traceDurationSecs");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig useTraceRecord](self, "useTraceRecord"), @"useTraceRecord");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig enableSwiftUITracing](self, "enableSwiftUITracing"), @"enableSwiftUITracing");
  uint64_t v8 = [(PTTraceConfig *)self planNameOrPath];
  [v9 encodeObject:v8 forKey:@"planNameOrPath"];

  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig overrideSymbolicate](self, "overrideSymbolicate"), @"overrideSymbolicate");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig overrideIncludeOSSignposts](self, "overrideIncludeOSSignposts"), @"overrideIncludeOSSignposts");
  objc_msgSend(v9, "encodeBool:forKey:", -[PTTraceConfig overrideIncludeOSLogs](self, "overrideIncludeOSLogs"), @"overrideIncludeOSLogs");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(PTTraceConfig);
  [(PTTraceConfig *)v4 setSymbolicate:[(PTTraceConfig *)self symbolicate]];
  [(PTTraceConfig *)v4 setCallstackSamplingRateMS:[(PTTraceConfig *)self callstackSamplingRateMS]];
  uint64_t v5 = [(PTTraceConfig *)self traceGroups];
  uint64_t v6 = (void *)[v5 copy];
  [(PTTraceConfig *)v4 setTraceGroups:v6];

  [(PTTraceConfig *)v4 setTraceType:[(PTTraceConfig *)self traceType]];
  uint64_t v7 = [(PTTraceConfig *)self traceDirectoryURL];
  uint64_t v8 = (void *)[v7 copy];
  [(PTTraceConfig *)v4 setTraceDirectoryURL:v8];

  id v9 = [(PTTraceConfig *)self traceName];
  uint64_t v10 = (void *)[v9 copy];
  [(PTTraceConfig *)v4 setTraceName:v10];

  [(PTTraceConfig *)v4 setCompressWhenFinished:[(PTTraceConfig *)self compressWhenFinished]];
  [(PTTraceConfig *)v4 setIncludeOSLogs:[(PTTraceConfig *)self includeOSLogs]];
  [(PTTraceConfig *)v4 setIncludeOSSignposts:[(PTTraceConfig *)self includeOSSignposts]];
  [(PTTraceConfig *)v4 setTraceTimeoutS:[(PTTraceConfig *)self traceTimeoutS]];
  [(PTTraceConfig *)v4 setSkipNotification:[(PTTraceConfig *)self skipNotification]];
  [(PTTraceConfig *)v4 setIncludeKernelStacks:[(PTTraceConfig *)self includeKernelStacks]];
  [(PTTraceConfig *)v4 setKernelBufferSizeMB:[(PTTraceConfig *)self kernelBufferSizeMB]];
  [(PTTraceConfig *)v4 setKernelBufferDrainQoS:[(PTTraceConfig *)self kernelBufferDrainQoS]];
  [(PTTraceConfig *)v4 setKernelBufferDrainRateMS:[(PTTraceConfig *)self kernelBufferDrainRateMS]];
  [(PTTraceConfig *)v4 setUseTraceRecord:[(PTTraceConfig *)self useTraceRecord]];
  [(PTTraceConfig *)v4 setEnableSwiftUITracing:[(PTTraceConfig *)self enableSwiftUITracing]];
  [(PTTraceConfig *)v4 setOwnerPID:getpid()];
  proc_name([(PTTraceConfig *)v4 ownerPID], buffer, 0x21u);
  char v11 = [NSString stringWithCString:buffer encoding:4];
  [(PTTraceConfig *)v4 setOwnerName:v11];

  uint64_t v12 = [(PTTraceConfig *)v4 ownerName];

  if (!v12)
  {
    uint64_t v13 = [NSString stringWithCString:buffer encoding:1];
    [(PTTraceConfig *)v4 setOwnerName:v13];
  }
  [(PTTraceConfig *)v4 setSource:4];
  return v4;
}

- (void)setIncludeOSSignposts:(BOOL)a3
{
  self->_includeOSSignposts = a3;
  self->_overrideIncludeOSSignposts = 1;
}

- (void)setIncludeOSLogs:(BOOL)a3
{
  self->_includeOSLogs = a3;
  self->_overrideIncludeOSLogs = 1;
}

- (void)setSymbolicate:(BOOL)a3
{
  self->_symbolicate = a3;
  self->_overrideSymbolicate = 1;
}

- (BOOL)symbolicate
{
  return self->_symbolicate;
}

- (unint64_t)callstackSamplingRateMS
{
  return self->_callstackSamplingRateMS;
}

- (void)setCallstackSamplingRateMS:(unint64_t)a3
{
  self->_callstackSamplingRateMS = a3;
}

- (NSMutableArray)traceGroups
{
  return self->_traceGroups;
}

- (void)setTraceGroups:(id)a3
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)traceType
{
  return self->_traceType;
}

- (void)setTraceType:(unint64_t)a3
{
  self->_traceType = a3;
}

- (NSURL)traceDirectoryURL
{
  return self->_traceDirectoryURL;
}

- (void)setTraceDirectoryURL:(id)a3
{
}

- (NSString)traceName
{
  return self->_traceName;
}

- (void)setTraceName:(id)a3
{
}

- (int)ownerPID
{
  return self->_ownerPID;
}

- (void)setOwnerPID:(int)a3
{
  self->_ownerPID = a3;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
}

- (BOOL)compressWhenFinished
{
  return self->_compressWhenFinished;
}

- (void)setCompressWhenFinished:(BOOL)a3
{
  self->_compressWhenFinished = a3;
}

- (BOOL)includeOSLogs
{
  return self->_includeOSLogs;
}

- (BOOL)includeOSSignposts
{
  return self->_includeOSSignposts;
}

- (unint64_t)traceTimeoutS
{
  return self->_traceTimeoutS;
}

- (void)setTraceTimeoutS:(unint64_t)a3
{
  self->_traceTimeoutS = a3;
}

- (unint64_t)traceDurationSecs
{
  return self->_traceDurationSecs;
}

- (void)setTraceDurationSecs:(unint64_t)a3
{
  self->_traceDurationSecs = a3;
}

- (BOOL)skipNotification
{
  return self->_skipNotification;
}

- (void)setSkipNotification:(BOOL)a3
{
  self->_skipNotification = a3;
}

- (BOOL)useTraceRecord
{
  return self->_useTraceRecord;
}

- (void)setUseTraceRecord:(BOOL)a3
{
  self->_useTraceRecord = a3;
}

- (BOOL)includeKernelStacks
{
  return self->_includeKernelStacks;
}

- (void)setIncludeKernelStacks:(BOOL)a3
{
  self->_includeKernelStacks = a3;
}

- (unint64_t)kernelBufferSizeMB
{
  return self->_kernelBufferSizeMB;
}

- (void)setKernelBufferSizeMB:(unint64_t)a3
{
  self->_kernelBufferSizeMB = a3;
}

- (unsigned)kernelBufferDrainQoS
{
  return self->_kernelBufferDrainQoS;
}

- (void)setKernelBufferDrainQoS:(unsigned int)a3
{
  self->_kernelBufferDrainQoS = a3;
}

- (unint64_t)kernelBufferDrainRateMS
{
  return self->_kernelBufferDrainRateMS;
}

- (void)setKernelBufferDrainRateMS:(unint64_t)a3
{
  self->_kernelBufferDrainRateMS = a3;
}

- (BOOL)enableSwiftUITracing
{
  return self->_enableSwiftUITracing;
}

- (void)setEnableSwiftUITracing:(BOOL)a3
{
  self->_enableSwiftUITracing = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)planNameOrPath
{
  return self->_planNameOrPath;
}

- (void)setPlanNameOrPath:(id)a3
{
}

- (BOOL)overrideIncludeOSSignposts
{
  return self->_overrideIncludeOSSignposts;
}

- (void)setOverrideIncludeOSSignposts:(BOOL)a3
{
  self->_overrideIncludeOSSignposts = a3;
}

- (BOOL)overrideIncludeOSLogs
{
  return self->_overrideIncludeOSLogs;
}

- (void)setOverrideIncludeOSLogs:(BOOL)a3
{
  self->_overrideIncludeOSLogs = a3;
}

- (BOOL)overrideSymbolicate
{
  return self->_overrideSymbolicate;
}

- (void)setOverrideSymbolicate:(BOOL)a3
{
  self->_overrideSymbolicate = a3;
}

- (OS_os_transaction)tracingActiveTransaction
{
  return self->_tracingActiveTransaction;
}

- (void)setTracingActiveTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracingActiveTransaction, 0);
  objc_storeStrong((id *)&self->_planNameOrPath, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_traceName, 0);
  objc_storeStrong((id *)&self->_traceDirectoryURL, 0);
  objc_storeStrong((id *)&self->_traceGroups, 0);
}

+ (void)configWithTemplate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__PTTraceConfig_getCurrentConfig__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __28__PTTraceConfig_resetConfig__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __28__PTTraceConfig_storeConfig__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_ERROR, "An error occurred storing config: %{public}@", (uint8_t *)&v1, 0xCu);
}

void __32__PTTraceConfig__initConnection__block_invoke_163_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__PTTraceConfig__getRemoteObjectProxy__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_21EF00000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to connect to the service protocol: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end