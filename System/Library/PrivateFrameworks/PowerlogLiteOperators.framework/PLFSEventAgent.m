@interface PLFSEventAgent
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLFSEventAgent)init;
- (PLXPCResponderOperatorComposition)fileListResponder;
- (__FSEventStream)stream;
- (void)addLogFileNameEntry:(BOOL)a3 withType:(id)a4 withName:(id)a5;
- (void)dealloc;
- (void)initOperatorDependancies;
- (void)logLogFileName:(id)a3 withName:(id)a4;
- (void)registerforFSEventNotification;
- (void)setFileListResponder:(id)a3;
- (void)setStream:(__FSEventStream *)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation PLFSEventAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLFSEventAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v20 = @"LogFile";
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v16[0] = *MEMORY[0x1E4F92CD0];
  v16[1] = v2;
  v17[0] = &unk_1F29F0B50;
  v17[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v3;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"timestampEnd";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v15[0] = v5;
  v14[1] = @"FileType";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v15[1] = v7;
  v14[2] = @"FilePath";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v21[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLFSEventAgent)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLFSEventAgent;
    self = [(PLAgent *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)dealloc
{
  [(PLFSEventAgent *)self stopMonitoring];
  stream = self->_stream;
  if (stream) {
    CFRelease(stream);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLFSEventAgent;
  [(PLAgent *)&v4 dealloc];
}

- (void)stopMonitoring
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  FSEventStreamStop(self->_stream);
  stream = self->_stream;
  Current = CFRunLoopGetCurrent();
  FSEventStreamUnscheduleFromRunLoop(stream, Current, (CFStringRef)*MEMORY[0x1E4F1D418]);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __32__PLFSEventAgent_stopMonitoring__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD5C298 != -1) {
      dispatch_once(&qword_1EBD5C298, &block);
    }
    if (_MergedGlobals_97)
    {
      v6 = [NSString stringWithFormat:@"Stopped monitoring paths %@", &unk_1F29EE2A0, block, v13, v14, v15, v16];
      v7 = (void *)MEMORY[0x1E4F929B8];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLFSEventAgent stopMonitoring]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:133];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __32__PLFSEventAgent_stopMonitoring__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_97 = result;
  return result;
}

- (void)startMonitoring
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PLFSEventAgent_startMonitoring__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __33__PLFSEventAgent_startMonitoring__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLFSEventAgent_startMonitoring__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1EBD5C2A0 != -1) {
      dispatch_once(&qword_1EBD5C2A0, block);
    }
    if (byte_1EBD5C291)
    {
      v3 = [NSString stringWithFormat:@"StartMonitoring paths: %@", &unk_1F29EE2B8];
      objc_super v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLFSEventAgent startMonitoring]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:137];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([*(id *)(a1 + 32) stream])
  {
    v9 = (__FSEventStream *)[*(id *)(a1 + 32) stream];
    Current = CFRunLoopGetCurrent();
    FSEventStreamScheduleWithRunLoop(v9, Current, (CFStringRef)*MEMORY[0x1E4F1D418]);
    if (!FSEventStreamStart((FSEventStreamRef)[*(id *)(a1 + 32) stream]))
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v11 = objc_opt_class();
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        void v18[2] = __33__PLFSEventAgent_startMonitoring__block_invoke_45;
        v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v18[4] = v11;
        if (qword_1EBD5C2A8 != -1) {
          dispatch_once(&qword_1EBD5C2A8, v18);
        }
        if (byte_1EBD5C292)
        {
          v12 = [NSString stringWithFormat:@"Failed to start monitoring fsevents."];
          uint64_t v13 = (void *)MEMORY[0x1E4F929B8];
          v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m"];
          v15 = [v14 lastPathComponent];
          uint64_t v16 = [NSString stringWithUTF8String:"-[PLFSEventAgent startMonitoring]_block_invoke_2"];
          [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:141];

          v17 = PLLogCommon();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v12;
            _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
  }
}

uint64_t __33__PLFSEventAgent_startMonitoring__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C291 = result;
  return result;
}

uint64_t __33__PLFSEventAgent_startMonitoring__block_invoke_45(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C292 = result;
  return result;
}

- (void)registerforFSEventNotification
{
  context.version = 0;
  context.info = self;
  context.retain = (CFAllocatorRetainCallBack)MEMORY[0x1E4F1C280];
  context.release = (CFAllocatorReleaseCallBack)MEMORY[0x1E4F1C278];
  context.copyDescription = (CFAllocatorCopyDescriptionCallBack)MEMORY[0x1E4F1C220];
  v3 = FSEventStreamCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (FSEventStreamCallback)fsEventsHandler, &context, (CFArrayRef)&unk_1F29EE2D0, 0xFFFFFFFFFFFFFFFFLL, 1.0, 0x11u);
  self->_stream = v3;
  if (v3)
  {
    objc_super v4 = dispatch_get_global_queue(2, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__PLFSEventAgent_registerforFSEventNotification__block_invoke;
    v5[3] = &unk_1E692A250;
    v5[4] = self;
    dispatch_sync(v4, v5);
  }
}

uint64_t __48__PLFSEventAgent_registerforFSEventNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startMonitoring];
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA8]);
  objc_super v4 = dispatch_get_global_queue(-32768, 0);
  uint64_t v5 = (void *)[v3 initWithWorkQueue:v4 withRegistration:&unk_1F29EA0A8 withBlock:&__block_literal_global_30];
  [(PLFSEventAgent *)self setFileListResponder:v5];

  [(PLFSEventAgent *)self registerforFSEventNotification];
}

id __42__PLFSEventAgent_initOperatorDependancies__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = NSString;
  id v8 = a5;
  v9 = [v7 stringWithFormat:@"Received log files request from %d, %@", a2, a3];
  v10 = (void *)MEMORY[0x1E4F929B8];
  uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m"];
  v12 = [v11 lastPathComponent];
  uint64_t v13 = [NSString stringWithUTF8String:"-[PLFSEventAgent initOperatorDependancies]_block_invoke"];
  [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:168];

  v14 = PLLogCommon();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v15 = [MEMORY[0x1E4F92A68] sharedInstance];
  uint64_t v16 = [v15 generateMSSSubmissionWithPayload:v8];

  return v16;
}

- (void)addLogFileNameEntry:(BOOL)a3 withType:(id)a4 withName:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = *MEMORY[0x1E4F92D38];
  id v9 = a5;
  id v10 = a4;
  id v15 = +[PLOperator entryKeyForType:v8 andName:@"LogFile"];
  id v11 = objc_alloc(MEMORY[0x1E4F929D0]);
  if (v6)
  {
    v12 = (void *)[v11 initWithEntryKey:v15];
    [v12 setObject:0 forKeyedSubscript:@"timestampEnd"];
  }
  else
  {
    uint64_t v13 = (void *)[v11 initWithEntryKey:v15 withDate:0];
    v14 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v13 setObject:v14 forKeyedSubscript:@"timestampEnd"];

    v12 = 0;
  }
  [v12 setObject:v10 forKeyedSubscript:@"FileType"];

  [v12 setObject:v9 forKeyedSubscript:@"FilePath"];
  [(PLOperator *)self logEntry:v12];
}

- (void)logLogFileName:(id)a3 withName:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLFSEventAgent_logLogFileName_withName___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (qword_1EBD5C2B0 != -1) {
        dispatch_once(&qword_1EBD5C2B0, block);
      }
      if (byte_1EBD5C293)
      {
        id v10 = [NSString stringWithFormat:@"logLogFileName(%@, %@)\n", v6, v8];
        id v11 = (void *)MEMORY[0x1E4F929B8];
        v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLFSEventAgent.m"];
        uint64_t v13 = [v12 lastPathComponent];
        v14 = [NSString stringWithUTF8String:"-[PLFSEventAgent logLogFileName:withName:]"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:197];

        id v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v10;
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v16 = [v8 componentsSeparatedByString:@"."];
    if ([v16 count] == 4)
    {
      v17 = [v16 objectAtIndexedSubscript:2];
      uint64_t v18 = [v17 isEqualToString:@"XXXXXX"];
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v19 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"LogFile"];
    uint64_t v20 = [NSString stringWithFormat:@"%@=\"%@\", @"FileType"", v6];
    v21 = [(PLOperator *)self storage];
    v48 = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    v23 = [v21 lastEntryForKey:v19 withFilters:v22];

    if (!v23)
    {
      [(PLFSEventAgent *)self addLogFileNameEntry:v18 withType:v6 withName:v8];
      v25 = v16;
LABEL_27:

      goto LABEL_28;
    }
    v24 = [v23 objectForKeyedSubscript:@"FilePath"];
    v25 = [v24 componentsSeparatedByString:@"."];

    v39 = v19;
    if ([v25 count] == 4)
    {
      v26 = [v25 objectAtIndexedSubscript:2];
      int v27 = [v26 isEqualToString:@"XXXXXX"];
    }
    else
    {
      int v27 = 0;
    }
    v28 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if (v27)
    {
      if (v18)
      {
        v29 = [v23 objectForKeyedSubscript:@"FilePath"];
        int v30 = [v8 isEqualToString:v29];

        if (v30)
        {
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __42__PLFSEventAgent_logLogFileName_withName___block_invoke_83;
          v44[3] = &unk_1E692B128;
          v31 = &v45;
          id v32 = v23;
          v33 = &v46;
          id v45 = v32;
          v46 = v28;
          id v34 = v28;
          [(PLOperator *)self updateEntry:v32 withBlock:v44];
LABEL_24:

LABEL_26:
          uint64_t v19 = v39;
          goto LABEL_27;
        }
      }
      else
      {
        v35 = [v23 entryDate];
        uint64_t v36 = [v28 compare:v35];

        if (v36 == 1)
        {
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = __42__PLFSEventAgent_logLogFileName_withName___block_invoke_2;
          v40[3] = &unk_1E692D388;
          v31 = &v41;
          id v37 = v23;
          v33 = &v42;
          id v41 = v37;
          v42 = v28;
          id v43 = v8;
          id v38 = v28;
          [(PLOperator *)self updateEntry:v37 withBlock:v40];

          goto LABEL_24;
        }
      }
    }
    [(PLFSEventAgent *)self addLogFileNameEntry:v18 withType:v6 withName:v8];
    goto LABEL_26;
  }
LABEL_28:
}

uint64_t __42__PLFSEventAgent_logLogFileName_withName___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C293 = result;
  return result;
}

uint64_t __42__PLFSEventAgent_logLogFileName_withName___block_invoke_83(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEntryDate:*(void *)(a1 + 40)];
}

uint64_t __42__PLFSEventAgent_logLogFileName_withName___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"timestampEnd"];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  return [v3 setObject:v2 forKeyedSubscript:@"FilePath"];
}

- (PLXPCResponderOperatorComposition)fileListResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFileListResponder:(id)a3
{
}

- (__FSEventStream)stream
{
  return self->_stream;
}

- (void)setStream:(__FSEventStream *)a3
{
  self->_stream = a3;
}

- (void).cxx_destruct
{
}

@end