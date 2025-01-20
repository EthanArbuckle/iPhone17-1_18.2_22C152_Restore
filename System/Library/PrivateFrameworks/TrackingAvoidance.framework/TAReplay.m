@interface TAReplay
- (BOOL)activityStream:(id)a3 deviceUDID:(id)a4 deviceID:(id)a5 status:(int64_t)a6 error:(id)a7;
- (BOOL)activityStream:(id)a3 results:(id)a4;
- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5;
- (TAReplay)initWithLogArchive:(id)a3 outputPath:(id)a4 inputPersistencePath:(id)a5 settings:(id)a6;
- (TAReplay)replayWithStartDate:(id)a3 endDate:(id)a4;
- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4;
- (void)replaySingleEventLogString:(id)a3;
- (void)streamDidFail:(id)a3 error:(id)a4;
- (void)streamDidStart:(id)a3;
- (void)streamDidStop:(id)a3;
@end

@implementation TAReplay

- (TAReplay)initWithLogArchive:(id)a3 outputPath:(id)a4 inputPersistencePath:(id)a5 settings:(id)a6
{
  v47[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v45.receiver = self;
  v45.super_class = (Class)TAReplay;
  v14 = [(TAReplay *)&v45 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_outputPath, a4);
    objc_storeStrong((id *)&v15->_inputPersistencePath, a5);
    v16 = [[TATrackingAvoidanceService alloc] initWithSettings:v13];
    service = v15->_service;
    v15->_service = v16;

    v18 = [TAAnalyticsManager alloc];
    v19 = [[TAAnalyticsManagerSettings alloc] initWithEnableSubmissionOrDefault:&unk_26D6842A8 andSettingsVersion:1];
    uint64_t v20 = [(TAAnalyticsManager *)v18 initWithSettings:v19];
    analyticsManager = v15->_analyticsManager;
    v15->_analyticsManager = (TAAnalyticsManager *)v20;

    [(TATrackingAvoidanceService *)v15->_service addObserver:v15->_analyticsManager];
    v22 = (OSLogPersistence *)objc_alloc_init(MEMORY[0x263F52758]);
    persistence = v15->_persistence;
    v15->_persistence = v22;

    [(OSLogPersistence *)v15->_persistence setLogArchive:v10];
    [(OSLogPersistence *)v15->_persistence setOptions:3];
    [(OSLogPersistence *)v15->_persistence setDelegate:v15];
    id v44 = v10;
    v42 = [MEMORY[0x263F08A98] predicateWithFormat:@"process == 'locationd'"];
    v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"subsystem == 'com.apple.tracking-avoidance'"];
    v25 = [MEMORY[0x263F08A98] predicateWithFormat:@"category == 'Events'"];
    v26 = (void *)MEMORY[0x263F08730];
    v47[0] = v42;
    v47[1] = v24;
    v47[2] = v25;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:3];
    v27 = id v43 = v11;
    v28 = [v26 andPredicateWithSubpredicates:v27];
    [(OSLogPersistence *)v15->_persistence setPredicate:v28];

    v29 = (OSActivityStream *)objc_alloc_init(MEMORY[0x263F52728]);
    stream = v15->_stream;
    v15->_stream = v29;

    [(OSActivityStream *)v15->_stream setDelegate:v15];
    [(OSActivityStream *)v15->_stream setDeviceDelegate:v15];
    [(OSActivityStream *)v15->_stream setOptions:772];
    v31 = (void *)MEMORY[0x263F08A98];
    [MEMORY[0x263F08AB0] processInfo];
    id v32 = v13;
    v34 = id v33 = v12;
    v35 = objc_msgSend(v31, "predicateWithFormat:", @"processID == %d", objc_msgSend(v34, "processIdentifier"));

    v36 = [MEMORY[0x263F08A98] predicateWithFormat:@"subsystem == 'com.apple.tracking-avoidance'"];
    v37 = [MEMORY[0x263F08A98] predicateWithFormat:@"category == 'Status'"];
    v38 = (void *)MEMORY[0x263F08730];
    v46[0] = v35;
    v46[1] = v36;
    v46[2] = v37;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:3];
    v40 = [v38 andPredicateWithSubpredicates:v39];
    [(OSActivityStream *)v15->_stream setPredicate:v40];

    id v10 = v44;
    id v12 = v33;
    id v13 = v32;

    id v11 = v43;
  }

  return v15;
}

- (BOOL)activityStream:(id)a3 results:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  outputPath = self->_outputPath;
  if (outputPath)
  {
    id v37 = 0;
    id v10 = [MEMORY[0x263F08840] fileHandleForWritingToURL:outputPath error:&v37];
    id v11 = v37;
    if (v11)
    {
      id v12 = v11;
      NSLog(&cfstr_ErrorWritingRe.isa);

      BOOL v13 = 0;
      id v10 = v12;
    }
    else
    {
      id v28 = v6;
      [v10 seekToEndOfFile];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v19 = v8;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = [*(id *)(*((void *)&v33 + 1) + 8 * i) eventMessage];
            v25 = [v24 stringByAppendingString:@"\n"];
            v26 = [v25 dataUsingEncoding:4];
            [v10 writeData:v26];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v21);
      }

      [v10 closeFile];
      BOOL v13 = 1;
      id v6 = v28;
    }
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v14 = [v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v8);
          }
          id v18 = [*(id *)(*((void *)&v29 + 1) + 8 * j) eventMessage];
          NSLog(&cfstr_ReplaystatusS.isa, [v18 UTF8String]);
        }
        uint64_t v15 = [v8 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v15);
    }
    BOOL v13 = 1;
  }

  return v13;
}

- (void)streamDidStop:(id)a3
{
  NSLog(&cfstr_LogStreamStopp.isa, a2, a3);
  streamWait = self->_streamWait;
  if (streamWait)
  {
    dispatch_semaphore_signal(streamWait);
  }
}

- (void)streamDidStart:(id)a3
{
  NSLog(&cfstr_LogStreamStart.isa, a2, a3);
  streamWait = self->_streamWait;
  if (streamWait)
  {
    dispatch_semaphore_signal(streamWait);
  }
}

- (void)streamDidFail:(id)a3 error:(id)a4
{
}

- (BOOL)activityStream:(id)a3 deviceUDID:(id)a4 deviceID:(id)a5 status:(int64_t)a6 error:(id)a7
{
  if (!a6) {
    objc_msgSend(a3, "setDevice:", a5, a4);
  }
  return 1;
}

- (TAReplay)replayWithStartDate:(id)a3 endDate:(id)a4
{
  v42[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF960] currentLocale];
  v9 = [v6 descriptionWithLocale:v8];
  id v10 = [MEMORY[0x263EFF960] currentLocale];
  id v11 = [v7 descriptionWithLocale:v10];
  NSLog(&cfstr_ReplayingWithS.isa, v9, v11);

  outputPath = self->_outputPath;
  if (outputPath)
  {
    BOOL v13 = [(NSURL *)outputPath absoluteString];
    NSLog(&cfstr_WritingOutputT.isa, v13);
  }
  uint64_t v14 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  streamWait = self->_streamWait;
  self->_streamWait = v14;

  [(OSActivityStream *)self->_stream start];
  uint64_t v16 = self->_streamWait;
  dispatch_time_t v17 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v16, v17))
  {
    NSLog(&cfstr_StreamStartTim.isa);
  }
  else
  {
    id v18 = self->_streamWait;
    self->_streamWait = 0;

    if (self->_inputPersistencePath)
    {
      id v19 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithContentsOfURL:");
      uint64_t v20 = (void *)MEMORY[0x263EFFA08];
      v42[0] = objc_opt_class();
      uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:1];
      uint64_t v22 = [v20 setWithArray:v21];

      id v41 = 0;
      v23 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v22 fromData:v19 error:&v41];
      id v24 = v41;
      v25 = v24;
      if (v24)
      {
        NSLog(&cfstr_ErrorFailedToD.isa, v24);
      }
      else
      {
        NSLog(&cfstr_BootstrappingO.isa);
        service = self->_service;
        v27 = [v23 visitState];
        [(TATrackingAvoidanceService *)service bootstrapVisitState:v27];

        id v28 = self->_service;
        long long v29 = [v23 deviceRecord];
        [(TATrackingAvoidanceService *)v28 bootstrapDeviceRecord:v29];
      }
    }
    long long v30 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    persistenceWait = self->_persistenceWait;
    self->_persistenceWait = v30;

    [(OSLogPersistence *)self->_persistence fetchFromStartDate:v6 toEndDate:v7];
    long long v32 = self->_persistenceWait;
    dispatch_time_t v33 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v32, v33)) {
      NSLog(&cfstr_ReplayTimeout.isa);
    }
    long long v34 = self->_persistenceWait;
    self->_persistenceWait = 0;

    [MEMORY[0x263F08B88] sleepForTimeInterval:1.0];
    long long v35 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    long long v36 = self->_streamWait;
    self->_streamWait = v35;

    [(OSActivityStream *)self->_stream stop];
    id v37 = self->_streamWait;
    dispatch_time_t v38 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v37, v38)) {
      NSLog(&cfstr_StreamStopTime.isa);
    }
    v39 = self->_streamWait;
    self->_streamWait = 0;
  }
  return result;
}

- (void)replaySingleEventLogString:(id)a3
{
  v15[14] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 stringByReplacingOccurrencesOfString:@"'" withString:&stru_26D677430];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_26D677430];

  id v7 = [MEMORY[0x263EFF8F8] dataWithHexString:v6];
  v8 = (void *)MEMORY[0x263EFFA08];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  v15[5] = objc_opt_class();
  v15[6] = objc_opt_class();
  v15[7] = objc_opt_class();
  v15[8] = objc_opt_class();
  v15[9] = objc_opt_class();
  v15[10] = objc_opt_class();
  v15[11] = objc_opt_class();
  v15[12] = objc_opt_class();
  v15[13] = objc_opt_class();
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:14];
  id v10 = [v8 setWithArray:v9];

  id v14 = 0;
  id v11 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v10 fromData:v7 error:&v14];
  id v12 = v14;
  BOOL v13 = v12;
  if (v12) {
    NSLog(&cfstr_ErrorDeseriali.isa, v12);
  }
  else {
    [(TATrackingAvoidanceService *)self->_service ingestTAEvent:v11];
  }
}

- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  NSLog(&cfstr_GotActivityEve.isa);
  if (v8)
  {
    NSLog(&cfstr_ErrorInReplayi.isa, v8);
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) eventMessage];
          [(TAReplay *)self replaySingleEventLogString:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  return v8 == 0;
}

- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4
{
  NSLog(&cfstr_FinishedFetchi.isa, a2, a3, a4);
  persistenceWait = self->_persistenceWait;
  if (persistenceWait)
  {
    dispatch_semaphore_signal(persistenceWait);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_inputPersistencePath, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_streamWait, 0);
  objc_storeStrong((id *)&self->_persistenceWait, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end