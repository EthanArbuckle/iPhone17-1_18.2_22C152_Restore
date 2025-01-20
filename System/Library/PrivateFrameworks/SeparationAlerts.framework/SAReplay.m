@interface SAReplay
- (BOOL)activityStream:(id)a3 deviceUDID:(id)a4 deviceID:(id)a5 status:(int64_t)a6 error:(id)a7;
- (BOOL)activityStream:(id)a3 results:(id)a4;
- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5;
- (NSMutableArray)eventOrder;
- (NSMutableDictionary)eventMessages;
- (SAReplay)initWithLogArchive:(id)a3 outputPath:(id)a4 inputPersistencePath:(id)a5;
- (SAReplay)replayWithStartDate:(id)a3 endDate:(id)a4;
- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4;
- (void)replaySingleEventLogString:(id)a3;
- (void)setEventMessages:(id)a3;
- (void)setEventOrder:(id)a3;
- (void)streamDidFail:(id)a3 error:(id)a4;
- (void)streamDidStart:(id)a3;
- (void)streamDidStop:(id)a3;
@end

@implementation SAReplay

- (SAReplay)initWithLogArchive:(id)a3 outputPath:(id)a4 inputPersistencePath:(id)a5
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)SAReplay;
  v11 = [(SAReplay *)&v44 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_outputPath, a4);
    objc_storeStrong((id *)&v12->_inputPersistencePath, a5);
    v13 = [SAAnalytics alloc];
    v14 = [[SAAnalyticsSettings alloc] initWithEnableSubmission:0];
    uint64_t v15 = [(SAAnalytics *)v13 initWithSettings:v14];
    analytics = v12->_analytics;
    v12->_analytics = (SAAnalytics *)v15;

    v17 = [[SAService alloc] initWithAnalytics:v12->_analytics isReplay:1 audioAccessoryManager:0];
    service = v12->_service;
    v12->_service = v17;

    v19 = (OSLogPersistence *)objc_alloc_init(MEMORY[0x1E4F730D0]);
    persistence = v12->_persistence;
    v12->_persistence = v19;

    [(OSLogPersistence *)v12->_persistence setLogArchive:v8];
    [(OSLogPersistence *)v12->_persistence setOptions:3];
    [(OSLogPersistence *)v12->_persistence setDelegate:v12];
    id v43 = v9;
    v21 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"process == 'locationd'"];
    v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"subsystem == 'com.apple.TrackingAvoidance'"];
    v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"category == 'SeparationAlertsEvents'"];
    v24 = (void *)MEMORY[0x1E4F28BA0];
    v46[0] = v21;
    v46[1] = v22;
    v46[2] = v23;
    id v42 = v10;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    v26 = [v24 andPredicateWithSubpredicates:v25];
    [(OSLogPersistence *)v12->_persistence setPredicate:v26];

    v27 = (OSActivityStream *)objc_alloc_init(MEMORY[0x1E4F73088]);
    stream = v12->_stream;
    v12->_stream = v27;

    [(OSActivityStream *)v12->_stream setDelegate:v12];
    [(OSActivityStream *)v12->_stream setDeviceDelegate:v12];
    [(OSActivityStream *)v12->_stream setOptions:772];
    v29 = (void *)MEMORY[0x1E4F28F60];
    v30 = [MEMORY[0x1E4F28F80] processInfo];
    v31 = objc_msgSend(v29, "predicateWithFormat:", @"processID == %d", objc_msgSend(v30, "processIdentifier"));

    v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"subsystem == 'com.apple.TrackingAvoidance'"];
    v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"category == 'SeparationAlerts'"];
    v34 = (void *)MEMORY[0x1E4F28BA0];
    v45[0] = v31;
    v45[1] = v32;
    v45[2] = v33;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
    v36 = [v34 andPredicateWithSubpredicates:v35];
    [(OSActivityStream *)v12->_stream setPredicate:v36];

    id v9 = v43;
    id v10 = v42;
    v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    eventOrder = v12->_eventOrder;
    v12->_eventOrder = v37;

    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    eventMessages = v12->_eventMessages;
    v12->_eventMessages = v39;
  }
  return v12;
}

- (BOOL)activityStream:(id)a3 results:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  outputPath = self->_outputPath;
  if (outputPath)
  {
    id v37 = 0;
    id v10 = [MEMORY[0x1E4F28CB0] fileHandleForWritingToURL:outputPath error:&v37];
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

- (SAReplay)replayWithStartDate:(id)a3 endDate:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v8 = [v29 descriptionWithLocale:v7];
  id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = [v6 descriptionWithLocale:v9];
  NSLog(&cfstr_ReplayingWithS.isa, v8, v10);

  outputPath = self->_outputPath;
  if (outputPath)
  {
    id v12 = [(NSURL *)outputPath absoluteString];
    NSLog(&cfstr_WritingOutputT.isa, v12);
  }
  BOOL v13 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  streamWait = self->_streamWait;
  self->_streamWait = v13;

  [(OSActivityStream *)self->_stream start];
  uint64_t v15 = self->_streamWait;
  dispatch_time_t v16 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    NSLog(&cfstr_StreamStartTim.isa);
  }
  else
  {
    v17 = self->_streamWait;
    self->_streamWait = 0;

    id v18 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    persistenceWait = self->_persistenceWait;
    self->_persistenceWait = v18;

    [(OSLogPersistence *)self->_persistence fetchFromStartDate:v29 toEndDate:v6];
    uint64_t v20 = self->_persistenceWait;
    dispatch_time_t v21 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v20, v21)) {
      NSLog(&cfstr_ReplayTimeout.isa);
    }
    uint64_t v22 = self->_persistenceWait;
    self->_persistenceWait = 0;

    [MEMORY[0x1E4F29060] sleepForTimeInterval:1.0];
    v23 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v24 = self->_streamWait;
    self->_streamWait = v23;

    [(OSActivityStream *)self->_stream stop];
    v25 = self->_streamWait;
    dispatch_time_t v26 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v25, v26)) {
      NSLog(&cfstr_StreamStopTime.isa);
    }
    v27 = self->_streamWait;
    self->_streamWait = 0;
  }

  return result;
}

- (void)replaySingleEventLogString:(id)a3
{
  v15[19] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 stringByReplacingOccurrencesOfString:@"'" withString:&stru_1F27F45F0];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F27F45F0];

  id v7 = [MEMORY[0x1E4F1C9B8] dataWithHexString:v6];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
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
  v15[14] = objc_opt_class();
  v15[15] = objc_opt_class();
  v15[16] = objc_opt_class();
  v15[17] = objc_opt_class();
  v15[18] = objc_opt_class();
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:19];
  id v10 = [v8 setWithArray:v9];

  id v14 = 0;
  id v11 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v7 error:&v14];
  id v12 = v14;
  BOOL v13 = v12;
  if (v12) {
    NSLog(&cfstr_ErrorDeseriali.isa, v12);
  }
  else {
    [(SAService *)self->_service ingestTAEvent:v11];
  }
}

- (BOOL)persistence:(id)a3 results:(id)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  NSLog(&cfstr_GotActivityEve.isa);
  if (v8)
  {
    NSLog(&cfstr_ErrorInReplayi.isa, v8);
  }
  else
  {
    id v22 = v7;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          BOOL v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v14 = [v13 eventMessage];
          uint64_t v15 = +[SALoggingUtilities extractUniqueIdentifierFromMessage:v14];

          dispatch_time_t v16 = [(NSMutableDictionary *)self->_eventMessages objectForKey:v15];

          if (v16)
          {
            v17 = [(NSMutableDictionary *)self->_eventMessages objectForKey:v15];
            id v18 = [v13 eventMessage];
            [v17 addObject:v18];
          }
          else
          {
            [(NSMutableArray *)self->_eventOrder addObject:v15];
            eventMessages = self->_eventMessages;
            id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
            v17 = [v13 eventMessage];
            id v18 = objc_msgSend(v20, "initWithObjects:", v17, 0);
            [(NSMutableDictionary *)eventMessages setObject:v18 forKey:v15];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    id v8 = 0;
    id v7 = v22;
  }

  return v8 == 0;
}

- (void)persistenceDidFinishReadingForStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_FinishedFetchi.isa, a2, a3, a4);
  persistenceWait = self->_persistenceWait;
  if (persistenceWait) {
    dispatch_semaphore_signal(persistenceWait);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_eventOrder;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        NSLog(&cfstr_Replaying.isa, v11);
        id v12 = [(NSMutableDictionary *)self->_eventMessages objectForKey:v11];
        BOOL v13 = +[SALoggingUtilities extractEventFromMessages:v12];

        if (v13) {
          [(SAService *)self->_service ingestTAEvent:v13];
        }
        else {
          NSLog(&cfstr_CouldNotReplay.isa, v11);
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (NSMutableDictionary)eventMessages
{
  return self->_eventMessages;
}

- (void)setEventMessages:(id)a3
{
}

- (NSMutableArray)eventOrder
{
  return self->_eventOrder;
}

- (void)setEventOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventOrder, 0);
  objc_storeStrong((id *)&self->_eventMessages, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_inputPersistencePath, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_streamWait, 0);
  objc_storeStrong((id *)&self->_persistenceWait, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end