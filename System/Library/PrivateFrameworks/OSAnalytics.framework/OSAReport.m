@interface OSAReport
+ (id)bootArgs;
+ (id)bootSessionUUID;
+ (id)findBundleAtPath:(id)a3 withKeys:(id)a4 bundleURL:(id *)a5;
+ (id)kernelVersionDescription;
+ (id)reduceToTwoSigFigures:(unint64_t)a3;
+ (id)systemIDWithDescription:(BOOL)a3;
+ (unsigned)codeSigningMonitor;
+ (unsigned)executeWithTimeout:(unsigned int)a3 Code:(id)a4;
+ (void)codeSigningMonitor;
- (BOOL)isActionable;
- (BOOL)isAppleTV;
- (BOOL)saveWithOptions:(id)a3;
- (NSArray)notes;
- (NSString)etlKey;
- (NSString)logfile;
- (NSString)oldLogFile;
- (OSAReport)init;
- (double)captureTime;
- (double)capture_time;
- (id)additionalIPSMetadata;
- (id)appleCareDetails;
- (id)getSyslogForPids:(id)a3 andOptionalSenders:(id)a4 additionalPredicates:(id)a5;
- (id)incidentID;
- (id)problemType;
- (id)reportNamePrefix;
- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4;
- (void)setEtlKey:(id)a3;
@end

@implementation OSAReport

- (OSAReport)init
{
  v8.receiver = self;
  v8.super_class = (Class)OSAReport;
  v2 = [(OSAReport *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    logWritingOptions = v2->_logWritingOptions;
    v2->_logWritingOptions = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)problemType
{
}

- (id)getSyslogForPids:(id)a3 andOptionalSenders:(id)a4 additionalPredicates:(id)a5
{
  v80[5] = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v43 = a4;
  id v7 = a5;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = +[OSASystemConfiguration sharedInstance];
  if ([v9 appleInternal])
  {
  }
  else
  {
    v10 = +[OSASystemConfiguration sharedInstance];
    int v11 = [v10 carrierInstall];

    if (!v11) {
      goto LABEL_45;
    }
  }
  if (getSyslogForPids_andOptionalSenders_additionalPredicates__onceToken != -1) {
    dispatch_once(&getSyslogForPids_andOptionalSenders_additionalPredicates__onceToken, &__block_literal_global_5);
  }
  if (getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObj
    && getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObj)
  {
    if (!dispatch_semaphore_wait((dispatch_semaphore_t)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore, 0))
    {
      context = (void *)MEMORY[0x1AD0D8030]();
      v79[0] = &unk_1EFE25670;
      v79[1] = &unk_1EFE25688;
      v80[0] = @"default";
      v80[1] = @"   info";
      v79[2] = &unk_1EFE256A0;
      v79[3] = &unk_1EFE256B8;
      v80[2] = @"  debug";
      v80[3] = @"  error";
      v79[4] = &unk_1EFE256D0;
      v80[4] = @"  fault";
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:5];
      v41 = [(id)getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObj localStore];
      *(void *)buf = 0;
      v71 = buf;
      uint64_t v72 = 0x3032000000;
      v73 = __Block_byref_object_copy__5;
      v74 = __Block_byref_object_dispose__5;
      id v75 = 0;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_34;
      v69[3] = &unk_1E5D1FFA0;
      v69[4] = buf;
      [v41 prepareWithCompletionHandler:v69];
      v12 = (void *)*((void *)v71 + 5);
      if (v12)
      {
        [v12 setFlags:13];
        uint64_t v13 = MEMORY[0x1E4F14428];
        id v14 = MEMORY[0x1E4F14428];
        [*((id *)v71 + 5) setTarget:v13];

        uint64_t v66 = 0;
        v67[0] = &v66;
        v67[1] = 0x3032000000;
        v67[2] = __Block_byref_object_copy__5;
        v67[3] = __Block_byref_object_dispose__5;
        id v68 = 0;
        v15 = [MEMORY[0x1E4F1CA48] array];
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v16 = v44;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v62 objects:v78 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v63 != v18) {
                objc_enumerationMutation(v16);
              }
              v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"processID == %@", *(void *)(*((void *)&v62 + 1) + 8 * i)];
              [v15 addObject:v20];
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v62 objects:v78 count:16];
          }
          while (v17);
        }

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v21 = v43;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v77 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v59 != v23) {
                objc_enumerationMutation(v21);
              }
              v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"senderImagePath CONTAINS[cd] %@", *(void *)(*((void *)&v58 + 1) + 8 * j)];
              [v15 addObject:v25];
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v58 objects:v77 count:16];
          }
          while (v22);
        }

        if (v7) {
          [v15 addObjectsFromArray:v7];
        }
        if ([v15 count])
        {
          v26 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v15];
          [*((id *)v71 + 5) setFilterPredicate:v26];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
            -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:].cold.4((uint64_t)v26);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:]();
        }
        v27 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_capture_time + 0.5];
        v28 = [v27 dateByAddingTimeInterval:-300.0];
        objc_initWeak(&location, *((id *)v71 + 5));
        v55[0] = 0;
        v55[1] = v55;
        v55[2] = 0x2020000000;
        int v56 = 0;
        v53[0] = 0;
        v53[1] = v53;
        v53[2] = 0x3032000000;
        v53[3] = __Block_byref_object_copy__5;
        v53[4] = __Block_byref_object_dispose__5;
        id v54 = 0;
        v29 = (void *)*((void *)v71 + 5);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_45;
        v46[3] = &unk_1E5D1FFC8;
        v50 = v53;
        v51 = v55;
        id v30 = v28;
        id v47 = v30;
        id v48 = v40;
        id v8 = v8;
        id v49 = v8;
        objc_copyWeak(&v52, &location);
        [v29 setEventHandler:v46];
        v31 = (void *)*((void *)v71 + 5);
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_2;
        v45[3] = &unk_1E5D1FFF0;
        v45[4] = &v66;
        [v31 setInvalidationHandler:v45];
        double Current = CFAbsoluteTimeGetCurrent();
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:]((uint64_t)v30, (uint64_t)v27);
        }
        [*((id *)v71 + 5) activateStreamFromDate:v27];
        v33 = getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore;
        dispatch_time_t v34 = dispatch_time(0, 120000000000);
        if (dispatch_semaphore_wait(v33, v34))
        {

          id v8 = 0;
        }
        else
        {
          double v35 = CFAbsoluteTimeGetCurrent();
          v36 = MEMORY[0x1E4F14500];
          id v37 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:]((uint64_t)v67, v76, [v8 count], v35 - Current);
          }

          if ([v8 count]) {
            [v8 addObject:@"Timestamp                         Type Thread  Act Process[pid] (Sender)"];
          }
          dispatch_semaphore_signal((dispatch_semaphore_t)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore);
        }
        [*((id *)v71 + 5) invalidate];
        objc_destroyWeak(&v52);

        _Block_object_dispose(v53, 8);
        _Block_object_dispose(v55, 8);
        objc_destroyWeak(&location);

        _Block_object_dispose(&v66, 8);
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "OSLogEvent unsupported in this environment", buf, 2u);
  }
LABEL_45:

  return v8;
}

Class __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore;
  getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore = (uint64_t)v0;

  getSyslogForPids_andOptionalSenders_additionalPredicates__loggingSupport_dylib = (uint64_t)dlopen("/System/Library/PrivateFrameworks/LoggingSupport.framework/LoggingSupport", 4);
  getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStoreObuint64_t j = (uint64_t)objc_getClass("OSLogEventStore");
  Class result = objc_getClass("OSLogEventStream");
  getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObuint64_t j = (uint64_t)result;
  return result;
}

void __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_34(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v5 = (objc_class *)getSyslogForPids_andOptionalSenders_additionalPredicates__OSLogEventStreamObj;
    id v6 = a2;
    uint64_t v7 = [[v5 alloc] initWithSource:v6];

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_45(uint64_t a1, void *a2)
{
  id v35 = a2;
  BOOL v3 = [v35 type] == 1024;
  v4 = v35;
  if (v3)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v5 = [v35 bootUUID];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    int v9 = *(_DWORD *)(v8 + 24);
    *(_DWORD *)(v8 + 24) = v9 + 1;
    if (v9 <= 126)
    {
      v10 = *(void **)(a1 + 32);
      int v11 = [v35 date];
      if ([v10 compare:v11] == -1)
      {
        v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        uint64_t v13 = [v35 bootUUID];
        LODWORD(v12) = [v12 isEqual:v13];

        if (v12)
        {
          id v14 = *(void **)(a1 + 40);
          v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v35, "logType"));
          WeakRetained = [v14 objectForKeyedSubscript:v15];

          uint64_t v17 = [v35 composedMessage];
          uint64_t v34 = [v17 length];
          if (v34 < 1025) {
            goto LABEL_17;
          }
          for (uint64_t i = [v17 substringToIndex:1024];
          {
            v19 = (void *)i;

            uint64_t v17 = v19;
LABEL_17:
            uint64_t v20 = [v17 rangeOfString:@"\n"];
            if (v20) {
              break;
            }
            [v17 substringFromIndex:1];
          }
          uint64_t v21 = v20;
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v22 = [v17 substringToIndex:v20];

            uint64_t v17 = (void *)v22;
          }
          v33 = NSString;
          uint64_t v23 = objc_msgSend(v35, "date", v21);
          v24 = OSANSDateFormat(2u, v23);
          uint64_t v25 = [v35 threadIdentifier];
          uint64_t v26 = [v35 activityIdentifier];
          v27 = [v35 process];
          uint64_t v28 = [v35 processIdentifier];
          v29 = [v35 sender];
          uint64_t v30 = [v17 length];
          v31 = @"...";
          if (v30 == v34) {
            v31 = &stru_1EFE17BD0;
          }
          v32 = [v33 stringWithFormat:@"%@ %@ 0x%05llx 0x%llx %@[%d] (%@): %@%@", v24, WeakRetained, v25, v26, v27, v28, v29, v17, v31];

          if ([v32 length]) {
            [*(id *)(a1 + 48) addObject:v32];
          }

          goto LABEL_12;
        }
      }
      else
      {
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained invalidate];
LABEL_12:

    v4 = v35;
  }
}

intptr_t __70__OSAReport_getSyslogForPids_andOptionalSenders_additionalPredicates___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"<%lu>", a2);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  switch(a2)
  {
    case 3:
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      int v9 = @"invalid position";
      goto LABEL_7;
    case 2:
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      int v9 = @"backlog";
      goto LABEL_7;
    case 1:
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      int v9 = @"disconnected";
LABEL_7:
      *(void *)(v7 + 40) = v9;
      goto LABEL_9;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
LABEL_9:

  int v11 = getSyslogForPids_andOptionalSenders_additionalPredicates__log_semaphore;
  return dispatch_semaphore_signal(v11);
}

+ (unsigned)executeWithTimeout:(unsigned int)a3 Code:(id)a4
{
  id v5 = a4;
  uint64_t v6 = dispatch_get_global_queue(0, 0);
  uint64_t v7 = dispatch_group_create();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__OSAReport_executeWithTimeout_Code___block_invoke;
  block[3] = &unk_1E5D20018;
  id v12 = v5;
  id v8 = v5;
  dispatch_group_async(v7, v6, block);
  dispatch_time_t v9 = dispatch_time(0, 1000000 * a3);
  LOBYTE(a3) = dispatch_group_wait(v7, v9) != 0;

  return a3;
}

uint64_t __37__OSAReport_executeWithTimeout_Code___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isAppleTV
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  size_t v6 = 128;
  if (!sysctlbyname("hw.machine", v7, &v6, 0, 0)) {
    return v7[0] == 1819308097 && *(_DWORD *)((char *)v7 + 3) == 1448371564;
  }
  BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v2)
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unable to run sysctl hw.machine", v5, 2u);
    return 0;
  }
  return result;
}

- (id)incidentID
{
  incidentID = self->_incidentID;
  if (!incidentID)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFUUIDRef v5 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
    size_t v6 = (__CFString *)CFUUIDCreateString(v4, v5);
    uint64_t v7 = self->_incidentID;
    self->_incidentID = &v6->isa;

    CFRelease(v5);
    incidentID = self->_incidentID;
  }
  if (incidentID) {
    uint64_t v8 = (__CFString *)incidentID;
  }
  else {
    uint64_t v8 = @"<incident x>";
  }
  return v8;
}

- (double)captureTime
{
  return self->_capture_time;
}

+ (id)systemIDWithDescription:(BOOL)a3
{
  BOOL v3 = a3;
  CFAllocatorRef v4 = +[OSASystemConfiguration sharedInstance];
  int v5 = [v4 appleInternal];

  if (v5)
  {
    size_t v6 = (__CFString *)MGCopyAnswer();
    if (v6)
    {
      uint64_t v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 != CFStringGetTypeID())
      {
        CFRelease(v7);
        uint64_t v7 = @"ERROR UDID was not a string";
      }
    }
    else
    {
      uint64_t v7 = @"UDID was null";
    }
    if (v3) {
      uint64_t v10 = @"UDID:                %@\n";
    }
    else {
      uint64_t v10 = @"%@";
    }
    objc_msgSend(NSString, "stringWithFormat:", v10, v7);
    dispatch_time_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);
  }
  else
  {
    dispatch_time_t v9 = &stru_1EFE17BD0;
  }
  return v9;
}

+ (id)kernelVersionDescription
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  bzero(v6, 0x400uLL);
  size_t v5 = 1023;
  uint64_t v2 = sysctlbyname("kern.version", v6, &v5, 0, 0);
  if (v2) {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown (error %d)>", v2);
  }
  else {
  BOOL v3 = [NSString stringWithUTF8String:v6];
  }
  return v3;
}

+ (id)bootArgs
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  size_t v5 = 1023;
  int v2 = sysctlbyname("kern.bootargs", v6, &v5, 0, 0);
  BOOL v3 = 0;
  if (!v2)
  {
    BOOL v3 = [NSString stringWithUTF8String:v6];
  }
  return v3;
}

+ (unsigned)codeSigningMonitor
{
  unsigned int v4 = 0;
  size_t v3 = 4;
  if (!sysctlbyname("security.codesigning.monitor", &v4, &v3, 0, 0)) {
    return v4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[OSAReport codeSigningMonitor]();
  }
  return -1;
}

+ (id)bootSessionUUID
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(v6, 0, sizeof(v6));
  size_t v5 = 37;
  int v2 = sysctlbyname("kern.bootsessionuuid", v6, &v5, 0, 0);
  size_t v3 = 0;
  if (!v2)
  {
    size_t v3 = [NSString stringWithUTF8String:v6];
  }
  return v3;
}

- (id)appleCareDetails
{
}

- (id)reportNamePrefix
{
}

- (BOOL)isActionable
{
  return 1;
}

- (id)additionalIPSMetadata
{
  v6[1] = *MEMORY[0x1E4F143B8];
  size_t v5 = @"incident_id";
  int v2 = [(OSAReport *)self incidentID];
  v6[0] = v2;
  size_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  id v4 = a4;
  __assert_rtn("-[OSAReport generateLogAtLevel:withBlock:]", "OSAReport.m", 355, "0");
}

- (BOOL)saveWithOptions:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(OSAReport *)self isActionable])
  {
    if ([(NSMutableArray *)self->_notes count])
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v25 = self->_notes;
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v33;
        uint64_t v28 = MEMORY[0x1E4F14500];
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v33 != v27) {
              objc_enumerationMutation(v25);
            }
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v30 = *(void *)(*((void *)&v32 + 1) + 8 * i);
              *(_DWORD *)buf = 138412290;
              uint64_t v41 = v30;
              _os_log_impl(&dword_1A7C6D000, v28, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
            }
          }
          uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v26);
      }
    }
    else
    {
      BOOL v12 = 0;
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "report not saved because it is non-actionable (ie: extension hangs or internal-only)", buf, 2u);
    }
    BOOL v12 = 0;
    goto LABEL_27;
  }
  [(NSMutableDictionary *)self->_logWritingOptions addEntriesFromDictionary:v4];
  size_t v5 = [(OSAReport *)self reportNamePrefix];
  [(NSMutableDictionary *)self->_logWritingOptions setObject:v5 forKeyedSubscript:@"override-filePrefix"];

  size_t v6 = [(OSAReport *)self problemType];
  uint64_t v7 = [(OSAReport *)self additionalIPSMetadata];
  logWritingOptions = self->_logWritingOptions;
  v36[4] = self;
  id v37 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __29__OSAReport_saveWithOptions___block_invoke;
  v36[3] = &unk_1E5D20068;
  dispatch_time_t v9 = +[OSALog createForSubmission:v6 metadata:v7 options:logWritingOptions error:&v37 writing:v36];
  id v10 = v37;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  BOOL v12 = v11;
  uint64_t v13 = [v9 filepath];
  logfile = self->_logfile;
  self->_logfile = v13;

  v15 = [v9 oldFilePath];
  oldLogFile = self->_oldLogFile;
  self->_oldLogFile = v15;

  uint64_t v17 = [v4 objectForKeyedSubscript:@"override-filePath"];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    v19 = [(OSAReport *)self appleCareDetails];
    if (v19)
    {
      double capture_time = self->_capture_time;
      uint64_t v21 = [(OSAReport *)self problemType];
      v39[0] = v21;
      uint64_t v22 = [(OSAReport *)self incidentID];
      v39[1] = v22;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
      v24 = [v23 arrayByAddingObjectsFromArray:v19];
      logForAppleCare(v24, capture_time);
    }
  }

LABEL_27:
  return v12;
}

void __29__OSAReport_saveWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __29__OSAReport_saveWithOptions___block_invoke_2;
  v6[3] = &unk_1E5D20040;
  id v7 = v3;
  id v5 = v3;
  [v4 streamContentAtLevel:1 withBlock:v6];
}

uint64_t __29__OSAReport_saveWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (int)streamContentAtLevel:(BOOL)a3 withBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __44__OSAReport_streamContentAtLevel_withBlock___block_invoke;
  BOOL v18 = &unk_1E5D200B8;
  uint64_t v21 = &v25;
  id v8 = v7;
  id v19 = v8;
  uint64_t v22 = v23;
  id v9 = v6;
  id v20 = v9;
  [(OSAReport *)self generateLogAtLevel:v4 withBlock:&v15];
  int v10 = *((_DWORD *)v26 + 6);
  if (!v10)
  {
    if (objc_msgSend(v8, "count", v15, v16, v17, v18, v19) != 1) {
      __assert_rtn("-[OSAReport streamContentAtLevel:withBlock:]", "OSAReport.m", 499, "[section_stack count] == 1");
    }
    BOOL v11 = objc_msgSend(v8, "section_pop");
    BOOL v12 = [v11 dataUsingEncoding:4 allowLossyConversion:1];
    int v13 = (*((uint64_t (**)(id, void *))v9 + 2))(v9, v12);
    *((_DWORD *)v26 + 6) = v13;

    int v10 = *((_DWORD *)v26 + 6);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  return v10;
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && !*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    uint64_t v25 = __Block_byref_object_copy__5;
    uint64_t v26 = __Block_byref_object_dispose__5;
    id v27 = 0;
    if ([*(id *)(a1 + 32) count])
    {
      BOOL v4 = [MEMORY[0x1E4F1CA58] data];
      id v5 = [v3 objectForKey:&unk_1EFE256E8];
      uint64_t v6 = [v5 BOOLValue];

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_116;
      v15[3] = &unk_1E5D20090;
      id v16 = *(id *)(a1 + 32);
      id v7 = v4;
      uint64_t v8 = *(void *)(a1 + 56);
      id v17 = v7;
      uint64_t v18 = v8;
      id v19 = &v22;
      uint64_t v20 = v6;
      [v3 enumerateKeysAndObjectsUsingBlock:v15];
      id v9 = v17;
      id v10 = v7;

      BOOL v11 = v10;
    }
    else
    {
      BOOL v12 = (id *)(v23 + 5);
      obuint64_t j = (id)v23[5];
      id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:1 error:&obj];
      objc_storeStrong(v12, obj);
      BOOL v11 = objc_msgSend(v10, "subdataWithRange:", 0, objc_msgSend(v10, "length") - 2);
      objc_msgSend(*(id *)(a1 + 32), "section_push:", @"\n}\n");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 count] != 0;
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11, v13, v14);
    _Block_object_dispose(&v22, 8);
  }
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 isEqual:&unk_1EFE25700])
  {
    if (![*(id *)(a1 + 32) count]) {
      __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_116_cold_1();
    }
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = objc_msgSend(@"\n", "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(*(id *)(a1 + 32), "count") - 1, @" ", 0);
    char v9 = 1;
    id v10 = [v8 dataUsingEncoding:4 allowLossyConversion:1];
    [v7 appendData:v10];

    BOOL v11 = *(void **)(a1 + 40);
    BOOL v12 = objc_msgSend(*(id *)(a1 + 32), "section_pop");
    uint64_t v13 = [v12 dataUsingEncoding:4 allowLossyConversion:1];
    [v11 appendData:v13];

    uint64_t v14 = a1 + 48;
    goto LABEL_12;
  }
  if (([v5 isEqual:&unk_1EFE256E8] & 1) == 0)
  {
    uint64_t v14 = a1 + 48;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v15 = *(void **)(a1 + 40);
      id v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"," length:1];
      [v15 appendData:v16];
    }
    id v17 = *(void **)(a1 + 40);
    uint64_t v18 = objc_msgSend(@"\n", "stringByPaddingToLength:withString:startingAtIndex:", (2 * objc_msgSend(*(id *)(a1 + 32), "count")) | 1, @" ", 0);
    id v19 = [v18 dataUsingEncoding:4 allowLossyConversion:1];
    [v17 appendData:v19];

    if ([v5 isEqual:&unk_1EFE25718])
    {
      uint64_t v20 = *(void **)(a1 + 40);
      uint64_t v21 = [NSString stringWithFormat:@"\"%@\" : {", v6];
      uint64_t v22 = [v21 dataUsingEncoding:4 allowLossyConversion:1];
      [v20 appendData:v22];

      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = @"}";
    }
    else
    {
      if (![v5 isEqual:&unk_1EFE25730])
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_116_cold_2();
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v28 = *(void **)(a1 + 40);
          v29 = NSString;
          id v30 = v6;
          if (v30)
          {
            v31 = (void *)MEMORY[0x1AD0D8030]();
            long long v32 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v30 options:4 error:0];
            if (v32)
            {
              long long v33 = (void *)[[NSString alloc] initWithData:v32 encoding:4];
              long long v34 = objc_msgSend(v33, "substringWithRange:", 1, objc_msgSend(v33, "length") - 2);
            }
            else
            {
              long long v34 = 0;
            }
          }
          else
          {
            long long v34 = 0;
          }

          v45 = [v29 stringWithFormat:@"\"%@\" : \"%@\"", v5, v34];
          char v9 = 1;
          v46 = [v45 dataUsingEncoding:4 allowLossyConversion:1];
          [v28 appendData:v46];
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          v36 = *(void **)(a1 + 40);
          if (isKindOfClass)
          {
            id v37 = [NSString stringWithFormat:@"\"%@\" : %@", v5, v6];
            char v9 = 1;
            v38 = [v37 dataUsingEncoding:4 allowLossyConversion:1];
            [v36 appendData:v38];
          }
          else
          {
            v39 = [NSString stringWithFormat:@"\"%@\" : ", v5];
            char v9 = 1;
            v40 = [v39 dataUsingEncoding:4 allowLossyConversion:1];
            [v36 appendData:v40];

            uint64_t v41 = *(void **)(a1 + 40);
            uint64_t v42 = *(void *)(a1 + 64);
            uint64_t v43 = *(void *)(*(void *)(a1 + 56) + 8);
            obuint64_t j = *(id *)(v43 + 40);
            id v44 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:v42 error:&obj];
            objc_storeStrong((id *)(v43 + 40), obj);
            [v41 appendData:v44];
          }
        }
        goto LABEL_12;
      }
      uint64_t v25 = *(void **)(a1 + 40);
      uint64_t v26 = [NSString stringWithFormat:@"\"%@\" : [", v6];
      id v27 = [v26 dataUsingEncoding:4 allowLossyConversion:1];
      [v25 appendData:v27];

      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v24 = @"]";
    }
    objc_msgSend(v23, "section_push:", v24);
    char v9 = 0;
LABEL_12:
    *(unsigned char *)(*(void *)(*(void *)v14 + 8) + 24) = v9;
  }
}

+ (id)findBundleAtPath:(id)a3 withKeys:(id)a4 bundleURL:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__5;
  id v30 = __Block_byref_object_dispose__5;
  id v31 = (id)objc_opt_new();
  char v9 = objc_opt_new();
  id v10 = (void *)MEMORY[0x1AD0D8030]();
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__5;
  uint64_t v24 = __Block_byref_object_dispose__5;
  id v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  if (findBundleAtPath_withKeys_bundleURL__onceToken != -1) {
    dispatch_once(&findBundleAtPath_withKeys_bundleURL__onceToken, &__block_literal_global_156);
  }
  if (v21[5])
  {
    BOOL v11 = findBundleAtPath_withKeys_bundleURL__bundle_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2;
    block[3] = &unk_1E5D200E0;
    uint64_t v18 = &v20;
    id v17 = v8;
    id v19 = &v26;
    dispatch_sync(v11, block);
    BOOL v12 = [(id)v21[5] path];
    [v9 setString:v12];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v33 = v7;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "no URL for '%{private}@'", buf, 0xCu);
  }
  _Block_object_dispose(&v20, 8);

  if (a5)
  {
    *a5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9];
  }
  if ([(id)v27[5] count]) {
    uint64_t v13 = (void *)v27[5];
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  _Block_object_dispose(&v26, 8);
  return v14;
}

uint64_t __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke()
{
  findBundleAtPath_withKeys_bundleURL__bundle_queue = (uint64_t)dispatch_queue_create("com.apple.osanalytics.bundlereader.serialqueue", 0);
  return MEMORY[0x1F41817F8]();
}

void __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v2 = (__CFBundle *)_CFBundleCreateWithExecutableURLIfLooksLikeBundle();
  if (v2)
  {
    id v3 = v2;
    BOOL v4 = CFBundleCopyBundleURL(v2);
    if (v4 && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:v4] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v34 = v5;
        __int16 v35 = 2112;
        v36 = v4;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "CFBundle URL refined %@ to %@", buf, 0x16u);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          CFStringRef v11 = *(const __CFString **)(*((void *)&v27 + 1) + 8 * i);
          BOOL v12 = CFBundleGetValueForInfoDictionaryKey(v3, v11);
          if (v12) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }

    CFRelease(v3);
  }
  else
  {
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleWithURL:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "*** found alternate bundle", buf, 2u);
      }
      uint64_t v13 = [v4 bundleURL];
      if (v13 && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:v13] & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v34 = v14;
          __int16 v35 = 2112;
          v36 = v13;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "NSBundle URL refined %@ to %@", buf, 0x16u);
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v13);
      }
      uint64_t v15 = [v4 infoDictionary];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v16 = *(id *)(a1 + 32);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v24;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * j);
            uint64_t v22 = objc_msgSend(v15, "objectForKeyedSubscript:", v21, (void)v23);
            if (v22) {
              [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v22 forKeyedSubscript:v21];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v18);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2_cold_1();
    }
  }
}

+ (id)reduceToTwoSigFigures:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    unsigned int v4 = log10((double)a3);
    if (v4 + 1 >= 3)
    {
      double v5 = __exp10((double)(v4 - 1));
      unint64_t v3 = v3 / (unint64_t)v5 * (unint64_t)v5;
    }
  }
  id v6 = NSNumber;
  return (id)[v6 numberWithUnsignedLongLong:v3];
}

- (double)capture_time
{
  return self->_capture_time;
}

- (NSArray)notes
{
  return &self->_notes->super;
}

- (NSString)logfile
{
  return self->_logfile;
}

- (NSString)etlKey
{
  return self->_etlKey;
}

- (void)setEtlKey:(id)a3
{
}

- (NSString)oldLogFile
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldLogFile, 0);
  objc_storeStrong((id *)&self->_etlKey, 0);
  objc_storeStrong((id *)&self->_logfile, 0);
  objc_storeStrong((id *)&self->_logWritingOptions, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_logType, 0);
  objc_storeStrong((id *)&self->_incidentID, 0);
}

- (void)getSyslogForPids:(uint64_t)a3 andOptionalSenders:(double)a4 additionalPredicates:.cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, double a4)
{
  uint64_t v4 = *(void *)(*(void *)a1 + 40);
  *(_DWORD *)buf = 134218498;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  *((_WORD *)buf + 11) = 2112;
  *((void *)buf + 3) = v4;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "OSLogEventStream found %lu lines after %.1f secs (invalidation: %@)", buf, 0x20u);
}

- (void)getSyslogForPids:(uint64_t)a1 andOptionalSenders:(uint64_t)a2 additionalPredicates:.cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "OSLogEventStream enumerate from %@ to %@", (uint8_t *)&v2, 0x16u);
}

- (void)getSyslogForPids:andOptionalSenders:additionalPredicates:.cold.3()
{
  *(_WORD *)dispatch_semaphore_t v0 = 0;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "OSLogEventStream query ALL", v0, 2u);
}

- (void)getSyslogForPids:(uint64_t)a1 andOptionalSenders:additionalPredicates:.cold.4(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "OSLogEventStream query '%@'", (uint8_t *)&v1, 0xCu);
}

+ (void)codeSigningMonitor
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v0 = *__error();
  int v1 = __error();
  uint64_t v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2082;
  uint64_t v5 = v2;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error getting security.codesigning.monitor: %d %{public}s", (uint8_t *)v3, 0x12u);
}

- (void)saveWithOptions:(void *)a1 .cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error while writing report payload: %{public}@", buf, 0xCu);
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_116_cold_1()
{
}

void __44__OSAReport_streamContentAtLevel_withBlock___block_invoke_116_cold_2()
{
}

void __49__OSAReport_findBundleAtPath_withKeys_bundleURL___block_invoke_2_cold_1()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "no bundle found", v0, 2u);
}

@end