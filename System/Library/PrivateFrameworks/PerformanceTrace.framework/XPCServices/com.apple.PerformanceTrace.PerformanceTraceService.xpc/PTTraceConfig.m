@interface PTTraceConfig
+ (BOOL)resetConfig;
+ (BOOL)supportsSecureCoding;
+ (PTTraceConfig)configWithDictionary:(id)a3;
+ (PTTraceConfig)configWithTemplate:(unint64_t)a3;
+ (PTTraceConfig)configWithTracePlanName:(id)a3;
+ (PTTraceConfig)configWithTracePlanURL:(id)a3;
+ (id)_defaultTraceRecordConfig;
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

+ (PTTraceConfig)configWithTemplate:(unint64_t)a3
{
  v4 = objc_alloc_init(PTTraceConfig);
  [(PTTraceConfig *)v4 setSymbolicate:1];
  [(PTTraceConfig *)v4 setCallstackSamplingRateMS:1];
  [(PTTraceConfig *)v4 setTraceType:1];
  v5 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/"];
  [(PTTraceConfig *)v4 setTraceDirectoryURL:v5];

  [(PTTraceConfig *)v4 setTraceName:0];
  v6 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_100016128, &off_100016140, &off_100016158, &off_100016170, &off_100016188, 0);
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
    +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_100016128, &off_100016140, &off_100016158, &off_100016170, &off_100016188, 0);
    v7 = LABEL_9:;
    [(PTTraceConfig *)v4 setTraceGroups:v7];

    goto LABEL_12;
  }
  if (a3 == 3)
  {
    +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", &off_1000161A0, &off_100016140, &off_100016188, 0, v20, v21);
    goto LABEL_9;
  }
  BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v8) {
    sub_10000D28C(v8, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_12:
  [(PTTraceConfig *)v4 setOwnerPID:getpid()];
  proc_name([(PTTraceConfig *)v4 ownerPID], buffer, 0x21u);
  v16 = +[NSString stringWithCString:buffer encoding:4];
  [(PTTraceConfig *)v4 setOwnerName:v16];

  v17 = [(PTTraceConfig *)v4 ownerName];

  if (!v17)
  {
    v18 = +[NSString stringWithCString:buffer encoding:1];
    [(PTTraceConfig *)v4 setOwnerName:v18];
  }
  [(PTTraceConfig *)v4 setSource:4];
  return v4;
}

+ (PTTraceConfig)configWithDictionary:(id)a3
{
  id v3 = a3;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    +[NSException raise:NSInvalidArgumentException format:@"traceConfigurationDictionary is not a valid dictionary."];
  }
  v4 = [v3 valueForKey:@"traceTemplate"];

  if (!v4)
  {
    uint64_t v9 = 1;
    goto LABEL_10;
  }
  v5 = [v3 valueForKey:@"traceTemplate"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException format:@"traceTemplate is not a string."];
  }
  v7 = [v3 valueForKey:@"traceTemplate"];
  uint64_t v8 = traceConfigTemplateForString(v7);

  if (v8)
  {
    uint64_t v9 = v8;
LABEL_10:
    uint64_t v10 = +[PTTraceConfig configWithTemplate:v9];
    goto LABEL_12;
  }
  uint64_t v11 = [v3 valueForKey:@"traceTemplate"];
  +[NSException raise:NSInvalidArgumentException, @"%@ is not a valid trace template.", v11 format];

  uint64_t v10 = 0;
LABEL_12:
  uint64_t v12 = [v3 valueForKey:@"symbolicate"];

  if (v12)
  {
    uint64_t v13 = [v3 valueForKey:@"symbolicate"];
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"symbolicate" format];
    }
    uint64_t v15 = [v3 valueForKey:@"symbolicate"];
    if ([v15 unsignedLongValue])
    {
      v16 = [v3 valueForKey:@"symbolicate"];
      id v17 = [v16 unsignedLongValue];

      if (v17 != (id)1) {
        +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"symbolicate" format];
      }
    }
    else
    {
    }
    v18 = [v3 valueForKey:@"symbolicate"];
    objc_msgSend(v10, "setSymbolicate:", objc_msgSend(v18, "BOOLValue"));
  }
  v19 = [v3 valueForKey:@"callstackSamplingRateMS"];

  if (v19)
  {
    uint64_t v20 = [v3 valueForKey:@"callstackSamplingRateMS"];
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    if ((v21 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not an unsigned long type.", @"callstackSamplingRateMS" format];
    }
    v22 = [v3 valueForKey:@"callstackSamplingRateMS"];
    objc_msgSend(v10, "setCallstackSamplingRateMS:", objc_msgSend(v22, "unsignedLongValue"));
  }
  v23 = [v3 valueForKey:@"traceName"];

  if (v23)
  {
    v24 = [v3 valueForKey:@"traceName"];
    objc_opt_class();
    char v25 = objc_opt_isKindOfClass();

    if ((v25 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a string type.", @"traceName" format];
    }
    v26 = [v3 valueForKey:@"traceName"];
    id v27 = [v26 copy];
    [v10 setTraceName:v27];
  }
  v28 = [v3 valueForKey:@"compressWhenFinished"];

  if (v28)
  {
    v29 = [v3 valueForKey:@"compressWhenFinished"];
    objc_opt_class();
    char v30 = objc_opt_isKindOfClass();

    if ((v30 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"compressWhenFinished" format];
    }
    v31 = [v3 valueForKey:@"compressWhenFinished"];
    if ([v31 unsignedLongValue])
    {
      v32 = [v3 valueForKey:@"compressWhenFinished"];
      id v33 = [v32 unsignedLongValue];

      if (v33 != (id)1) {
        +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"compressWhenFinished" format];
      }
    }
    else
    {
    }
    v34 = [v3 valueForKey:@"compressWhenFinished"];
    objc_msgSend(v10, "setCompressWhenFinished:", objc_msgSend(v34, "BOOLValue"));
  }
  v35 = [v3 valueForKey:@"includeOSLogs"];

  if (v35)
  {
    v36 = [v3 valueForKey:@"includeOSLogs"];
    objc_opt_class();
    char v37 = objc_opt_isKindOfClass();

    if ((v37 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"includeOSLogs" format];
    }
    v38 = [v3 valueForKey:@"includeOSLogs"];
    if ([v38 unsignedLongValue])
    {
      v39 = [v3 valueForKey:@"includeOSLogs"];
      id v40 = [v39 unsignedLongValue];

      if (v40 != (id)1) {
        +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"includeOSLogs" format];
      }
    }
    else
    {
    }
    v41 = [v3 valueForKey:@"includeOSLogs"];
    objc_msgSend(v10, "setIncludeOSLogs:", objc_msgSend(v41, "BOOLValue"));
  }
  v42 = [v3 valueForKey:@"includeOSSignposts"];

  if (v42)
  {
    v43 = [v3 valueForKey:@"includeOSSignposts"];
    objc_opt_class();
    char v44 = objc_opt_isKindOfClass();

    if ((v44 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"includeOSSignposts" format];
    }
    v45 = [v3 valueForKey:@"includeOSSignposts"];
    if ([v45 unsignedLongValue])
    {
      v46 = [v3 valueForKey:@"includeOSSignposts"];
      id v47 = [v46 unsignedLongValue];

      if (v47 != (id)1) {
        +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"includeOSSignposts" format];
      }
    }
    else
    {
    }
    v48 = [v3 valueForKey:@"includeOSSignposts"];
    objc_msgSend(v10, "setIncludeOSSignposts:", objc_msgSend(v48, "BOOLValue"));
  }
  v49 = [v3 valueForKey:@"traceTimeoutS"];

  if (v49)
  {
    v50 = [v3 valueForKey:@"traceTimeoutS"];
    objc_opt_class();
    char v51 = objc_opt_isKindOfClass();

    if ((v51 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not an unsigned long type.", @"traceTimeoutS" format];
    }
    v52 = [v3 valueForKey:@"traceTimeoutS"];
    objc_msgSend(v10, "setTraceTimeoutS:", objc_msgSend(v52, "unsignedLongValue"));
  }
  v53 = [v3 valueForKey:@"useTraceRecord"];

  if (v53)
  {
    v54 = [v3 valueForKey:@"useTraceRecord"];
    objc_opt_class();
    char v55 = objc_opt_isKindOfClass();

    if ((v55 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"useTraceRecord" format];
    }
    v56 = [v3 valueForKey:@"useTraceRecord"];
    if ([v56 unsignedLongValue])
    {
      v57 = [v3 valueForKey:@"useTraceRecord"];
      id v58 = [v57 unsignedLongValue];

      if (v58 != (id)1) {
        +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"useTraceRecord" format];
      }
    }
    else
    {
    }
    v59 = [v3 valueForKey:@"useTraceRecord"];
    objc_msgSend(v10, "setUseTraceRecord:", objc_msgSend(v59, "BOOLValue"));
  }
  v60 = [v3 valueForKey:@"traceDurationSecs"];

  if (v60)
  {
    v61 = [v3 valueForKey:@"traceDurationSecs"];
    objc_opt_class();
    char v62 = objc_opt_isKindOfClass();

    if ((v62 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not an unsigned long type.", @"traceDurationSecs" format];
    }
    v63 = [v3 valueForKey:@"traceDurationSecs"];
    objc_msgSend(v10, "setTraceDurationSecs:", objc_msgSend(v63, "unsignedLongValue"));
  }
  v64 = [v3 valueForKey:@"skipNotification"];

  if (v64)
  {
    v65 = [v3 valueForKey:@"skipNotification"];
    objc_opt_class();
    char v66 = objc_opt_isKindOfClass();

    if ((v66 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"skipNotification" format];
    }
    v67 = [v3 valueForKey:@"skipNotification"];
    if ([v67 unsignedLongValue])
    {
      v68 = [v3 valueForKey:@"skipNotification"];
      id v69 = [v68 unsignedLongValue];

      if (v69 != (id)1) {
        +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"skipNotification" format];
      }
    }
    else
    {
    }
    v70 = [v3 valueForKey:@"skipNotification"];
    objc_msgSend(v10, "setSkipNotification:", objc_msgSend(v70, "BOOLValue"));
  }
  v71 = [v3 valueForKey:@"includeKernelStacks"];

  if (v71)
  {
    v72 = [v3 valueForKey:@"includeKernelStacks"];
    objc_opt_class();
    char v73 = objc_opt_isKindOfClass();

    if ((v73 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"includeKernelStacks" format];
    }
    v74 = [v3 valueForKey:@"includeKernelStacks"];
    if ([v74 unsignedLongValue])
    {
      v75 = [v3 valueForKey:@"includeKernelStacks"];
      id v76 = [v75 unsignedLongValue];

      if (v76 != (id)1) {
        +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"includeKernelStacks" format];
      }
    }
    else
    {
    }
    v77 = [v3 valueForKey:@"includeKernelStacks"];
    objc_msgSend(v10, "setIncludeKernelStacks:", objc_msgSend(v77, "BOOLValue"));
  }
  v78 = [v3 valueForKey:@"kernelBufferSizeMB"];

  if (v78)
  {
    v79 = [v3 valueForKey:@"kernelBufferSizeMB"];
    objc_opt_class();
    char v80 = objc_opt_isKindOfClass();

    if ((v80 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not an unsigned long type.", @"kernelBufferSizeMB" format];
    }
    v81 = [v3 valueForKey:@"kernelBufferSizeMB"];
    objc_msgSend(v10, "setKernelBufferSizeMB:", objc_msgSend(v81, "unsignedLongValue"));
  }
  v82 = [v3 valueForKey:@"kernelBufferDrainRateMS"];

  if (v82)
  {
    v83 = [v3 valueForKey:@"kernelBufferDrainRateMS"];
    objc_opt_class();
    char v84 = objc_opt_isKindOfClass();

    if ((v84 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not an unsigned long type.", @"kernelBufferDrainRateMS" format];
    }
    v85 = [v3 valueForKey:@"kernelBufferDrainRateMS"];
    objc_msgSend(v10, "setKernelBufferDrainRateMS:", objc_msgSend(v85, "unsignedLongValue"));
  }
  v86 = [v3 valueForKey:@"kernelBufferDrainQoS"];

  if (v86)
  {
    v87 = [v3 valueForKey:@"kernelBufferDrainQoS"];
    objc_opt_class();
    char v88 = objc_opt_isKindOfClass();

    if ((v88 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not an unsigned integer type.", @"kernelBufferDrainQoS" format];
    }
    v89 = [v3 valueForKey:@"kernelBufferDrainQoS"];
    objc_msgSend(v10, "setKernelBufferDrainQoS:", objc_msgSend(v89, "unsignedIntValue"));
  }
  v90 = [v3 valueForKey:@"enableSwiftUITracing"];

  if (v90)
  {
    v91 = [v3 valueForKey:@"enableSwiftUITracing"];
    objc_opt_class();
    char v92 = objc_opt_isKindOfClass();

    if ((v92 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"enableSwiftUITracing" format];
    }
    v93 = [v3 valueForKey:@"enableSwiftUITracing"];
    if ([v93 unsignedLongValue])
    {
      v94 = [v3 valueForKey:@"enableSwiftUITracing"];
      id v95 = [v94 unsignedLongValue];

      if (v95 != (id)1) {
        +[NSException raise:NSInvalidArgumentException, @"%@ is not a BOOLean type.", @"enableSwiftUITracing" format];
      }
    }
    else
    {
    }
    v96 = [v3 valueForKey:@"enableSwiftUITracing"];
    objc_msgSend(v10, "setEnableSwiftUITracing:", objc_msgSend(v96, "BOOLValue"));
  }
  v97 = [v3 valueForKey:@"traceDirectoryURL"];

  if (v97)
  {
    v98 = [v3 valueForKey:@"traceDirectoryURL"];
    objc_opt_class();
    char v99 = objc_opt_isKindOfClass();

    if ((v99 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException format:@"traceDirectoryURL is not a string type."];
    }
    v100 = [v3 valueForKey:@"traceDirectoryURL"];
    v101 = +[NSURL fileURLWithPath:v100];
    [v10 setTraceDirectoryURL:v101];
  }
  v102 = [v3 valueForKey:@"traceType"];

  if (v102)
  {
    v103 = [v3 valueForKey:@"traceType"];
    objc_opt_class();
    char v104 = objc_opt_isKindOfClass();

    if ((v104 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException format:@"traceType is not a string type."];
    }
    v105 = [v3 valueForKey:@"traceType"];
    [v10 setTraceType:traceTypeForString(v105)];
  }
  v106 = [v3 valueForKey:@"traceGroups"];

  if (v106)
  {
    v107 = [v3 valueForKey:@"traceGroups"];
    objc_opt_class();
    char v108 = objc_opt_isKindOfClass();

    if ((v108 & 1) == 0) {
      +[NSException raise:NSInvalidArgumentException format:@"traceGroups is not an NSArray type."];
    }
    v109 = [v3 valueForKey:@"traceGroups"];
    v110 = +[NSMutableArray array];
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v111 = v109;
    id v112 = [v111 countByEnumeratingWithState:&v120 objects:v124 count:16];
    if (v112)
    {
      id v113 = v112;
      uint64_t v114 = *(void *)v121;
      do
      {
        for (i = 0; i != v113; i = (char *)i + 1)
        {
          if (*(void *)v121 != v114) {
            objc_enumerationMutation(v111);
          }
          v116 = *(void **)(*((void *)&v120 + 1) + 8 * i);
          if (v116 && traceGroupForString(*(void **)(*((void *)&v120 + 1) + 8 * i)))
          {
            v117 = +[NSNumber numberWithUnsignedInteger:traceGroupForString(v116)];
            [v110 addObject:v117];
          }
        }
        id v113 = [v111 countByEnumeratingWithState:&v120 objects:v124 count:16];
      }
      while (v113);
    }

    if ([v110 count]) {
      [v10 setTraceGroups:v110];
    }
  }
  [v10 setSource:4];
  v118 = v10;

  return v118;
}

+ (id)_defaultTraceRecordConfig
{
  v2 = objc_alloc_init(PTTraceConfig);
  [(PTTraceConfig *)v2 setUseTraceRecord:1];
  [(PTTraceConfig *)v2 setTraceType:1];
  id v3 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces/"];
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
  v4 = +[NSString stringWithCString:buffer encoding:4];
  [(PTTraceConfig *)v2 setOwnerName:v4];

  v5 = [(PTTraceConfig *)v2 ownerName];

  if (!v5)
  {
    v6 = +[NSString stringWithCString:buffer encoding:1];
    [(PTTraceConfig *)v2 setOwnerName:v6];
  }
  return v2;
}

+ (PTTraceConfig)configWithTracePlanName:(id)a3
{
  id v3 = a3;
  v4 = +[PTTraceConfig _defaultTraceRecordConfig];
  [v4 setPlanNameOrPath:v3];

  return (PTTraceConfig *)v4;
}

+ (PTTraceConfig)configWithTracePlanURL:(id)a3
{
  id v3 = a3;
  v4 = +[PTTraceConfig _defaultTraceRecordConfig];
  v5 = [v3 path];

  [v4 setPlanNameOrPath:v5];
  return (PTTraceConfig *)v4;
}

+ (id)getCurrentConfig
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Getting Current Config", buf, 2u);
  }
  *(void *)buf = 0;
  uint64_t v9 = buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_10000AF00;
  uint64_t v12 = sub_10000AF10;
  uint64_t v13 = objc_alloc_init(PTTraceConfig);
  id v3 = [*((id *)v9 + 5) connection];

  if (!v3) {
    [*((id *)v9 + 5) _initConnection];
  }
  v4 = [*((id *)v9 + 5) _getRemoteObjectProxy];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AF18;
  v7[3] = &unk_100014C10;
  v7[4] = buf;
  v7[5] = a1;
  [v4 getCurrentStoredConfig:v7];

  [*((id *)v9 + 5) _invalidateSession];
  id v5 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v5;
}

+ (BOOL)resetConfig
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Resetting config", buf, 2u);
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
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B130;
  v6[3] = &unk_1000145E8;
  v6[4] = buf;
  [v4 resetConfig:v6];

  [(PTTraceConfig *)v2 _invalidateSession];
  LOBYTE(v4) = v8[24];
  _Block_object_dispose(buf, 8);

  return (char)v4;
}

- (BOOL)storeConfig
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Storing config", buf, 2u);
  }
  id v3 = [(PTTraceConfig *)self connection];

  if (!v3) {
    [(PTTraceConfig *)self _initConnection];
  }
  *(void *)buf = 0;
  uint64_t v9 = buf;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v4 = [(PTTraceConfig *)self _getRemoteObjectProxy];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B324;
  v7[3] = &unk_1000145E8;
  v7[4] = buf;
  [v4 applyConfig:self withError:v7];

  [(PTTraceConfig *)self _invalidateSession];
  uint8_t v5 = v9[24];
  _Block_object_dispose(buf, 8);
  return v5;
}

- (BOOL)validateConfig
{
  return 1;
}

- (void)_initConnection
{
  id v5 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.PerformanceTrace.PerformanceTraceService"];
  id v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___PTServiceInterface];
  [v5 setRemoteObjectInterface:v3];
  [v5 setInvalidationHandler:&stru_100014C50];
  [v5 setInterruptionHandler:&stru_100014C70];
  [(PTTraceConfig *)self setConnection:v5];
  v4 = [(PTTraceConfig *)self connection];
  [v4 resume];
}

- (id)_getRemoteObjectProxy
{
  v2 = [(PTTraceConfig *)self connection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014C90];

  return v3;
}

- (void)_invalidateSession
{
  id v3 = [(PTTraceConfig *)self connection];

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
  id v5 = [(PTTraceConfig *)self init];
  if (v5)
  {
    -[PTTraceConfig setSymbolicate:](v5, "setSymbolicate:", [v4 decodeBoolForKey:@"symbolicate"]);
    -[PTTraceConfig setCallstackSamplingRateMS:](v5, "setCallstackSamplingRateMS:", (int)[v4 decodeIntForKey:@"callstackSamplingRateMS"]);
    uint64_t v6 = objc_opt_class();
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"traceGroups"];
    uint64_t v9 = +[NSMutableArray arrayWithArray:v8];
    [(PTTraceConfig *)v5 setTraceGroups:v9];

    -[PTTraceConfig setTraceType:](v5, "setTraceType:", (int)[v4 decodeIntForKey:@"traceType"]);
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traceDirectoryURL"];
    [(PTTraceConfig *)v5 setTraceDirectoryURL:v10];

    char v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traceName"];
    [(PTTraceConfig *)v5 setTraceName:v11];

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
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerName"];
    [(PTTraceConfig *)v5 setOwnerName:v12];

    -[PTTraceConfig setSource:](v5, "setSource:", (int)[v4 decodeIntForKey:@"source"]);
    -[PTTraceConfig setTraceDurationSecs:](v5, "setTraceDurationSecs:", (int)[v4 decodeIntForKey:@"traceDurationSecs"]);
    -[PTTraceConfig setUseTraceRecord:](v5, "setUseTraceRecord:", [v4 decodeBoolForKey:@"useTraceRecord"]);
    -[PTTraceConfig setEnableSwiftUITracing:](v5, "setEnableSwiftUITracing:", [v4 decodeBoolForKey:@"enableSwiftUITracing"]);
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planNameOrPath"];
    [(PTTraceConfig *)v5 setPlanNameOrPath:v13];

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
  id v5 = [(PTTraceConfig *)self traceDirectoryURL];
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
  v7 = [(PTTraceConfig *)self ownerName];
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
  id v4 = objc_alloc_init(PTTraceConfig);
  [(PTTraceConfig *)v4 setSymbolicate:[(PTTraceConfig *)self symbolicate]];
  [(PTTraceConfig *)v4 setCallstackSamplingRateMS:[(PTTraceConfig *)self callstackSamplingRateMS]];
  id v5 = [(PTTraceConfig *)self traceGroups];
  id v6 = [v5 copy];
  [(PTTraceConfig *)v4 setTraceGroups:v6];

  [(PTTraceConfig *)v4 setTraceType:[(PTTraceConfig *)self traceType]];
  v7 = [(PTTraceConfig *)self traceDirectoryURL];
  id v8 = [v7 copy];
  [(PTTraceConfig *)v4 setTraceDirectoryURL:v8];

  id v9 = [(PTTraceConfig *)self traceName];
  id v10 = [v9 copy];
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
  char v11 = +[NSString stringWithCString:buffer encoding:4];
  [(PTTraceConfig *)v4 setOwnerName:v11];

  uint64_t v12 = [(PTTraceConfig *)v4 ownerName];

  if (!v12)
  {
    uint64_t v13 = +[NSString stringWithCString:buffer encoding:1];
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

@end