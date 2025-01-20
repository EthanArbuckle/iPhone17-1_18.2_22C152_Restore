@interface PLScheduledWakeAgent
+ (id)accountingGroupDefinitions;
+ (id)defaults;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)railDefinitions;
+ (void)load;
- (NSMutableDictionary)previousScheduleWakeEvents;
- (PLEntryNotificationOperatorComposition)canSleepNotification;
- (PLScheduledWakeAgent)init;
- (PLSemaphore)canSleepSemaphore;
- (id)humanReadableScheduledWakeString:(id)a3;
- (void)initOperatorDependancies;
- (void)logEventForwardScheduledEvent;
- (void)setCanSleepNotification:(id)a3;
- (void)setCanSleepSemaphore:(id)a3;
- (void)setPreviousScheduleWakeEvents:(id)a3;
@end

@implementation PLScheduledWakeAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLScheduledWakeAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventForwardDefinitions
{
  v21[1] = *MEMORY[0x263EF8340];
  v20 = @"ScheduledEvent";
  v18[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F848];
  v16[0] = *MEMORY[0x263F5F880];
  v16[1] = v2;
  v17[0] = &unk_26E546730;
  v17[1] = &unk_26E546A58;
  v16[2] = *MEMORY[0x263F5F840];
  v17[2] = &unk_26E546A70;
  v3 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  v19[0] = v3;
  v18[1] = *MEMORY[0x263F5F870];
  v4 = objc_msgSend(MEMORY[0x263F5F650], "sharedInstance", @"EventTime");
  v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v15[0] = v5;
  v14[1] = @"Type";
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v15[1] = v7;
  v14[2] = @"AppName";
  v8 = [MEMORY[0x263F5F650] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[2] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  v19[1] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v21[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

  return v12;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

- (PLScheduledWakeAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLScheduledWakeAgent;
  uint64_t v2 = [(PLAgent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    previousScheduleWakeEvents = v2->_previousScheduleWakeEvents;
    v2->_previousScheduleWakeEvents = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)initOperatorDependancies
{
  uint64_t v3 = [MEMORY[0x263F5F670] sharedSemaphoreForKey:*MEMORY[0x263F5F818]];
  [(PLScheduledWakeAgent *)self setCanSleepSemaphore:v3];

  v4 = [(PLScheduledWakeAgent *)self canSleepSemaphore];
  [v4 signalInterestByObject:self];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__PLScheduledWakeAgent_initOperatorDependancies__block_invoke;
  v6[3] = &unk_264B99DD0;
  v6[4] = self;
  v5 = [MEMORY[0x263F5F658] canSleepEntryNotificationWithOperator:self withBlock:v6];
  [(PLScheduledWakeAgent *)self setCanSleepNotification:v5];
}

uint64_t __48__PLScheduledWakeAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) log];
}

- (void)logEventForwardScheduledEvent
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F8A0] andName:@"ScheduledEvent"];
  CFArrayRef v3 = IOPMCopyScheduledPowerEvents();
  v41 = (void *)v2;
  if ([MEMORY[0x263F5F640] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __53__PLScheduledWakeAgent_logEventForwardScheduledEvent__block_invoke;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v4;
    if (logEventForwardScheduledEvent_defaultOnce != -1) {
      dispatch_once(&logEventForwardScheduledEvent_defaultOnce, v55);
    }
    if (logEventForwardScheduledEvent_classDebugEnabled)
    {
      v5 = [NSString stringWithFormat:@"%@ signaling done", self];
      objc_super v6 = (void *)MEMORY[0x263F5F638];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLScheduledWakeAgent.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLScheduledWakeAgent logEventForwardScheduledEvent]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:120];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PLAWDNetworkUsage handleNameConnectionCallback:]((uint64_t)v5, v10);
      }

      uint64_t v2 = (uint64_t)v41;
    }
  }
  v11 = [(PLScheduledWakeAgent *)self canSleepSemaphore];
  [v11 signalDoneByObject:self];

  v43 = [MEMORY[0x263EFF980] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  CFArrayRef obj = v3;
  uint64_t v12 = [(__CFArray *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v51 + 1) + 8 * v15);
        v17 = [v16 objectForKey:@"time"];
        [v17 timeIntervalSinceNow];
        if (v18 >= 0.0)
        {
          v19 = [v16 objectForKey:@"scheduledby"];
          v20 = [(PLScheduledWakeAgent *)self previousScheduleWakeEvents];
          v21 = [v20 valueForKey:v19];

          if (v21 && [v21 isEqualToDate:v17])
          {
            if ([MEMORY[0x263F5F640] debugEnabled])
            {
              uint64_t v22 = objc_opt_class();
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __53__PLScheduledWakeAgent_logEventForwardScheduledEvent__block_invoke_48;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v22;
              if (logEventForwardScheduledEvent_defaultOnce_46 != -1) {
                dispatch_once(&logEventForwardScheduledEvent_defaultOnce_46, block);
              }
              if (logEventForwardScheduledEvent_classDebugEnabled_47)
              {
                v23 = [NSString stringWithFormat:@"Skip logging event %@", v16];
                v42 = (void *)MEMORY[0x263F5F638];
                v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLScheduledWakeAgent.m"];
                v25 = [v24 lastPathComponent];
                v26 = [NSString stringWithUTF8String:"-[PLScheduledWakeAgent logEventForwardScheduledEvent]"];
                [v42 logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:136];

                v27 = PLLogCommon();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v60 = v23;
                  _os_log_debug_impl(&dword_2309F8000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
                uint64_t v2 = (uint64_t)v41;
LABEL_24:
              }
            }

            goto LABEL_26;
          }
          v23 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v2];
          v28 = [v16 objectForKey:@"eventtype"];
          v27 = [(PLScheduledWakeAgent *)self humanReadableScheduledWakeString:v28];

          [v23 setObject:v17 forKeyedSubscript:@"EventTime"];
          [v23 setObject:v27 forKeyedSubscript:@"Type"];
          [v23 setObject:v19 forKeyedSubscript:@"AppName"];
          [v43 addObject:v23];
          goto LABEL_24;
        }
LABEL_26:

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(__CFArray *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    }
    while (v13);
  }

  v29 = [(PLScheduledWakeAgent *)self previousScheduleWakeEvents];
  [v29 removeAllObjects];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  CFArrayRef v30 = obj;
  uint64_t v31 = [(__CFArray *)v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v47 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v36 = [v35 objectForKey:@"time"];
        [v36 timeIntervalSinceNow];
        if (v37 >= 0.0)
        {
          v38 = [v35 objectForKey:@"scheduledby"];
          v39 = [(PLScheduledWakeAgent *)self previousScheduleWakeEvents];
          [v39 setValue:v36 forKey:v38];
        }
      }
      uint64_t v32 = [(__CFArray *)v30 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v32);
  }

  if ([v43 count])
  {
    v56 = v41;
    v57 = v43;
    v40 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    [(PLOperator *)self logEntries:v40 withGroupID:v41];
  }
  else
  {
    v40 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v41];
    [v40 setIsErrorEntry:1];
    [v40 setObject:@"No scheduled events" forKeyedSubscript:@"__PLEntryErrorString__"];
    [(PLOperator *)self logEntry:v40];
  }
}

uint64_t __53__PLScheduledWakeAgent_logEventForwardScheduledEvent__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardScheduledEvent_classDebugEnabled = result;
  return result;
}

uint64_t __53__PLScheduledWakeAgent_logEventForwardScheduledEvent__block_invoke_48(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardScheduledEvent_classDebugEnabled_47 = result;
  return result;
}

- (id)humanReadableScheduledWakeString:(id)a3
{
  CFArrayRef v3 = (__CFString *)a3;
  if (CFStringCompare(v3, @"wake", 0))
  {
    if (CFStringCompare(v3, @"wakepoweron", 0))
    {
      if (CFStringCompare(v3, @"poweron", 0))
      {
        if (CFStringCompare(v3, @"sleep", 0))
        {
          if (CFStringCompare(v3, @"shutdown", 0))
          {
            if (CFStringCompare(v3, @"restart", 0)) {
              uint64_t v4 = v3;
            }
            else {
              uint64_t v4 = @"Scheduled Restart";
            }
          }
          else
          {
            uint64_t v4 = @"Scheduled Shutdown";
          }
        }
        else
        {
          uint64_t v4 = @"Scheduled Sleep";
        }
      }
      else
      {
        uint64_t v4 = @"Power On from Off state";
      }
    }
    else
    {
      uint64_t v4 = @"Scheduled Wake or Power On";
    }
  }
  else
  {
    uint64_t v4 = @"Scheduled Wake";
  }

  return v4;
}

- (PLEntryNotificationOperatorComposition)canSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCanSleepNotification:(id)a3
{
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
}

- (NSMutableDictionary)previousScheduleWakeEvents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreviousScheduleWakeEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousScheduleWakeEvents, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);

  objc_storeStrong((id *)&self->_canSleepNotification, 0);
}

@end