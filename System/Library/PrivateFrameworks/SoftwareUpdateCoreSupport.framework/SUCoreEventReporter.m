@interface SUCoreEventReporter
+ (id)_errorDomainAbbreviation:(id)a3;
+ (id)_nsURLSessionTaskNameForState:(int64_t)a3;
+ (id)_sharedReporter:(id)a3 withAccessControl:(int64_t)a4;
+ (id)accessControlSummary:(int64_t)a3;
+ (id)buildSplunkServerURLFromBase:(id)a3;
+ (id)initSharedReporterStoringToPath:(id)a3;
+ (id)sharedReporter;
+ (int64_t)eventForEventString:(id)a3;
+ (void)augmentEvent:(id)a3 withError:(id)a4;
- (BOOL)_sendFirstAwaitingRetry;
- (BOOL)_storeServerURLMetadata:(id)a3 toFileUUID:(id)a4;
- (BOOL)dropEventsOnSendFailure;
- (BOOL)eventExtensionsDetermined;
- (BOOL)sendEvent:(id)a3;
- (BOOL)sendEvent:(id)a3 returningFinalEventDictionary:(id *)a4;
- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4;
- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4 returningFinalEventDictionary:(id *)a5;
- (BOOL)splunkAccessCreated;
- (NSMutableArray)awaitingRetry;
- (NSMutableDictionary)eventExtensions;
- (NSOperationQueue)inProcessOperationQueue;
- (NSString)persistedStatePath;
- (NSString)storeToPath;
- (NSURL)splunkURL;
- (NSURLSession)inProcessSession;
- (NSURLSessionConfiguration)inProcessConfig;
- (OS_dispatch_queue)splunkStateQueue;
- (SUCoreEvent)lastErrorEvent;
- (SUCoreEventReporterDelegate)reporterDelegate;
- (SUCorePersistedState)activeEventsState;
- (id)_activeEventForFileUUID:(id)a3;
- (id)_alignPersistedStateWithExistingFileUUIDs:(id)a3;
- (id)_buildContextFromNVRAMBootArgs;
- (id)_copyEscapeStringsForEventData:(id)a3;
- (id)_getJSONDataFromPayload:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5;
- (id)_getSplunkRequestForURL:(id)a3;
- (id)_getSplunkServerURL:(id)a3;
- (id)_newExistingFileUUIDs;
- (id)_newScrubbedEvents:(id)a3;
- (id)_removeFileUUID:(id)a3 fromFilesToRetry:(id)a4;
- (id)_storeJSONData:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5;
- (id)_synchonizeDiscoveredCanceling:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)_synchonizeDiscoveredCompleted:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)_synchonizeDiscoveredRunning:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)_synchonizeDiscoveredSuspended:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)_synchonizeDiscoveredUnknown:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5;
- (id)initStoringToPath:(id)a3;
- (id)initStoringToPath:(id)a3 withAccessControl:(int64_t)a4;
- (id)onceIdleCompletion;
- (id)sendEventReturningAugmented:(id)a3 toServerURL:(id)a4;
- (int)activeSendTaskCount;
- (int64_t)accessControl;
- (int64_t)currentAccessControl;
- (void)_adoptLastErrorEvent:(id)a3;
- (void)_awaitRetryingFileUUID:(id)a3;
- (void)_checkWhetherIdle:(id)a3;
- (void)_decrementActiveSendCount;
- (void)_determineEventExtensions;
- (void)_incrementActiveSendCount:(id)a3;
- (void)_removeActiveEventForFileUUID:(id)a3;
- (void)_removeFileUUID:(id)a3 loggingError:(BOOL)a4 forReason:(id)a5;
- (void)_sendAllAwaitingRetry;
- (void)_sendCoreEvent:(id)a3;
- (void)_sendCoreEvents:(id)a3 secondEvent:(id)a4;
- (void)_sendInterruptedFromStorage:(id)a3;
- (void)_sendSplunkEvents:(id)a3 forEventUUID:(id)a4 toServerURL:(id)a5;
- (void)_splunkAccessSetup;
- (void)_synchronizeWithNSURLSessionExpecting:(id)a3;
- (void)_updateActiveEvent:(id)a3 forFileUUID:(id)a4;
- (void)_uploadFromFile:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5 toServerURL:(id)a6;
- (void)dropOnSendFailure:(BOOL)a3;
- (void)flushEvent;
- (void)handleSendFinishedInvalidFileUUID:(id)a3 withError:(id)a4;
- (void)handleSendFinishedWithFileUUID:(id)a3 sendSucceeded:(BOOL)a4 withStatusCode:(int64_t)a5 withError:(id)a6;
- (void)indicateOnceIdle:(id)a3;
- (void)setAccessControl:(int64_t)a3;
- (void)setActiveEventsState:(id)a3;
- (void)setActiveSendTaskCount:(int)a3;
- (void)setAwaitingRetry:(id)a3;
- (void)setDropEventsOnSendFailure:(BOOL)a3;
- (void)setEventExtensions:(id)a3;
- (void)setEventExtensionsDetermined:(BOOL)a3;
- (void)setInProcessConfig:(id)a3;
- (void)setInProcessOperationQueue:(id)a3;
- (void)setInProcessSession:(id)a3;
- (void)setLastErrorEvent:(id)a3;
- (void)setOnceIdleCompletion:(id)a3;
- (void)setPersistedStatePath:(id)a3;
- (void)setReporterDelegate:(id)a3;
- (void)setSplunkAccessCreated:(BOOL)a3;
- (void)setSplunkURL:(id)a3;
- (void)setStoreToPath:(id)a3;
@end

@implementation SUCoreEventReporter

+ (id)initSharedReporterStoringToPath:(id)a3
{
  return (id)[a1 _sharedReporter:a3 withAccessControl:1];
}

+ (id)sharedReporter
{
  return (id)[a1 _sharedReporter:0 withAccessControl:1];
}

+ (id)_sharedReporter:(id)a3 withAccessControl:(int64_t)a4
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SUCoreEventReporter__sharedReporter_withAccessControl___block_invoke;
  v10[3] = &unk_1E60B64F8;
  id v11 = v5;
  int64_t v12 = a4;
  uint64_t v6 = _sharedReporter_withAccessControl__reporterOnce;
  id v7 = v5;
  if (v6 != -1) {
    dispatch_once(&_sharedReporter_withAccessControl__reporterOnce, v10);
  }
  id v8 = (id)_sharedReporter_withAccessControl__reporter;

  return v8;
}

uint64_t __57__SUCoreEventReporter__sharedReporter_withAccessControl___block_invoke(uint64_t a1)
{
  _sharedReporter_withAccessControl__reporter = [[SUCoreEventReporter alloc] initStoringToPath:*(void *)(a1 + 32) withAccessControl:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)initStoringToPath:(id)a3
{
  id v4 = a3;
  id v5 = [[SUCoreEventReporter alloc] initStoringToPath:v4 withAccessControl:1];

  return v5;
}

- (id)initStoringToPath:(id)a3 withAccessControl:(int64_t)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SUCoreEventReporter;
  id v7 = [(SUCoreEventReporter *)&v52 init];
  id v8 = v7;
  if (!v7) {
    goto LABEL_13;
  }
  awaitingRetry = v7->_awaitingRetry;
  v7->_awaitingRetry = 0;

  splunkURL = v8->_splunkURL;
  v8->_splunkURL = 0;

  id v11 = [NSString alloc];
  int64_t v12 = +[SUCore sharedCore];
  v13 = [v12 commonDomain];
  id v14 = (id) [v11 initWithFormat:@"%@.%@", v13, @"core.splunk.state"];
  v15 = (const char *)[v14 UTF8String];
  v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
  splunkStateQueue = v8->_splunkStateQueue;
  v8->_splunkStateQueue = (OS_dispatch_queue *)v17;

  if (!v8->_splunkStateQueue)
  {
    v20 = +[SUCoreDiag sharedDiag];
    id v23 = [NSString alloc];
    v22 = +[SUCore sharedCore];
    v24 = [(NSString *)v22 commonDomain];
    v25 = (void *)[v23 initWithFormat:@"unable to create dispatch queue domain(%@.%@)", v24, @"core.splunk.state"];
    [v20 trackError:@"[EVENT_REPORTER] INIT" forReason:v25 withResult:8100 withError:0];

    goto LABEL_6;
  }
  v19 = +[SUCoreLog sharedLogger];
  v20 = [v19 oslog];

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = +[SUCore sharedCore];
    v22 = [v21 commonDomain];
    *(_DWORD *)buf = 138543618;
    v54 = v22;
    __int16 v55 = 2114;
    v56 = @"core.splunk.state";
    _os_log_impl(&dword_1B4EC2000, v20, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] DISPATCH | created dispatch queue domain(%{public}@.%{public}@)", buf, 0x16u);

LABEL_6:
  }

  inProcessConfig = v8->_inProcessConfig;
  v8->_inProcessConfig = 0;

  inProcessOperationQueue = v8->_inProcessOperationQueue;
  v8->_inProcessOperationQueue = 0;

  inProcessSession = v8->_inProcessSession;
  v8->_inProcessSession = 0;

  reporterDelegate = v8->_reporterDelegate;
  v8->_reporterDelegate = 0;

  if (v6)
  {
    uint64_t v30 = [v6 stringByAppendingPathComponent:@"/RecorderSplunkRecords"];
    storeToPath = v8->_storeToPath;
    v8->_storeToPath = (NSString *)v30;

    v8->_accessControl = a4;
    uint64_t v32 = [v6 stringByAppendingPathComponent:@"/EventReporterPersistedState"];
    persistedStatePath = v8->_persistedStatePath;
    v8->_persistedStatePath = (NSString *)v32;
  }
  else
  {
    v34 = +[SUCore sharedCore];
    v35 = [v34 commonFilesystemBaseDir];
    uint64_t v36 = [v35 stringByAppendingPathComponent:@"/RecorderSplunkRecords"];
    v37 = v8->_storeToPath;
    v8->_storeToPath = (NSString *)v36;

    v8->_accessControl = a4;
    persistedStatePath = +[SUCore sharedCore];
    v38 = [persistedStatePath commonFilesystemBaseDir];
    uint64_t v39 = [v38 stringByAppendingPathComponent:@"/EventReporterPersistedState"];
    v40 = v8->_persistedStatePath;
    v8->_persistedStatePath = (NSString *)v39;
  }
  v41 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v8->_persistedStatePath, @"SUCoreEventReporterState.state"];
  v42 = [[SUCorePersistedState alloc] initWithDispatchQueue:v8->_splunkStateQueue withPersistencePath:v41 forPolicyVersion:@"1.0"];
  activeEventsState = v8->_activeEventsState;
  v8->_activeEventsState = v42;

  lastErrorEvent = v8->_lastErrorEvent;
  v8->_lastErrorEvent = 0;

  *(_WORD *)&v8->_splunkAccessCreated = 0;
  eventExtensions = v8->_eventExtensions;
  v8->_eventExtensions = 0;

  v8->_activeSendTaskCount = 0;
  v8->_dropEventsOnSendFailure = 0;
  id onceIdleCompletion = v8->_onceIdleCompletion;
  v8->_id onceIdleCompletion = 0;

  v47 = +[SUCoreLog sharedLogger];
  v48 = [v47 oslog];

  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = v8->_storeToPath;
    v50 = +[SUCoreEventReporter accessControlSummary:v8->_accessControl];
    *(_DWORD *)buf = 138543618;
    v54 = v49;
    __int16 v55 = 2114;
    v56 = v50;
    _os_log_impl(&dword_1B4EC2000, v48, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] INIT(v1.0) | storing to path: %{public}@, access control: %{public}@", buf, 0x16u);
  }
LABEL_13:

  return v8;
}

+ (void)augmentEvent:(id)a3 withError:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 domain];
    uint64_t v9 = [a1 _errorDomainAbbreviation:v8];

    if (v9) {
      v10 = (__CFString *)v9;
    }
    else {
      v10 = @"NoDomain";
    }
    id v11 = (void *)[[NSString alloc] initWithFormat:@"%@ %ld", v10, objc_msgSend(v7, "code")];
    int64_t v12 = (void *)[[NSString alloc] initWithFormat:@"%@", v7];
    if (v11) {
      [v13 setSafeObject:v11 forKey:@"result"];
    }
    if (v12) {
      [v13 setSafeObject:v12 forKey:@"failureReason"];
    }
  }
  else
  {
    id v11 = 0;
    int64_t v12 = 0;
    v10 = 0;
  }
}

+ (id)buildSplunkServerURLFromBase:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"%@/%d/%@", v3, 2, @"psr_ota"];
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)accessControlSummary:(int64_t)a3
{
  char v3 = a3;
  id v4 = [NSString alloc];
  id v5 = @"Y";
  if ((v3 & 1) == 0) {
    id v5 = @"N";
  }
  id v6 = (void *)[v4 initWithFormat:@"|NVRAM Allowed:%@", v5];
  id v7 = [&stru_1F0D92C90 stringByAppendingString:v6];

  id v8 = [v7 stringByAppendingString:@"|"];

  return v8;
}

+ (int64_t)eventForEventString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"purge"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"preflightScan"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"preflightDownload"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"preflightPersonalize"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"preflightFDR"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"preflightWakeup"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"preflightPrerequisiteCheck"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"prepareStarted"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"prepareFinished"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"applyStarted"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"applyFinished"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"CryptegraftStarted"])
  {
    int64_t v4 = 11;
  }
  else if ([v3 isEqualToString:@"CryptegraftFinshed"])
  {
    int64_t v4 = 12;
  }
  else if ([v3 isEqualToString:@"updateFinished"])
  {
    int64_t v4 = 13;
  }
  else
  {
    int64_t v4 = 100;
  }

  return v4;
}

- (BOOL)sendEvent:(id)a3
{
  return [(SUCoreEventReporter *)self sendEvent:a3 toServerURL:0 returningFinalEventDictionary:0];
}

- (BOOL)sendEvent:(id)a3 returningFinalEventDictionary:(id *)a4
{
  return [(SUCoreEventReporter *)self sendEvent:a3 toServerURL:0 returningFinalEventDictionary:a4];
}

- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4
{
  return [(SUCoreEventReporter *)self sendEvent:a3 toServerURL:a4 returningFinalEventDictionary:0];
}

- (BOOL)sendEvent:(id)a3 toServerURL:(id)a4 returningFinalEventDictionary:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_not_V2(v10);

  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  id v26 = 0;
  id v11 = [(SUCoreEventReporter *)self splunkStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke;
  block[3] = &unk_1E60B6520;
  block[4] = self;
  id v12 = v8;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  v19 = &v27;
  v20 = &v21;
  dispatch_sync(v11, block);

  if (a5) {
    *a5 = (id) v22[5];
  }
  char v14 = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _determineEventExtensions];
  v2 = [SUCoreEvent alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  int64_t v4 = [*(id *)(a1 + 32) eventExtensions];
  id v5 = [(SUCoreEvent *)v2 initWithEventDictionary:v3 extendingWith:v4 reportingToServer:*(void *)(a1 + 48)];

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v6 = [(SUCoreEvent *)v5 allFields];
    uint64_t v7 = [v6 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v10 = [*(id *)(a1 + 32) splunkStateQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke_2;
    v12[3] = &unk_1E60B62D8;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v5;
    dispatch_async(v10, v12);
  }
  else
  {
    id v11 = +[SUCoreDiag sharedDiag];
    [v11 trackError:@"[EVENT_REPORTER] SEND" forReason:@"failed to create core event from provided event information" withResult:8100 withError:0];
  }
}

uint64_t __75__SUCoreEventReporter_sendEvent_toServerURL_returningFinalEventDictionary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCoreEvent:*(void *)(a1 + 40)];
}

- (id)sendEventReturningAugmented:(id)a3 toServerURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  id v23 = 0;
  id v9 = [(SUCoreEventReporter *)self splunkStateQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke;
  v14[3] = &unk_1E60B6548;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v17 = &v18;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, v14);

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _determineEventExtensions];
  v2 = [SUCoreEvent alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  int64_t v4 = [*(id *)(a1 + 32) eventExtensions];
  id v5 = [(SUCoreEvent *)v2 initWithEventDictionary:v3 extendingWith:v4 reportingToServer:*(void *)(a1 + 48)];

  if (v5)
  {
    uint64_t v6 = [(SUCoreEvent *)v5 getAugmentedEvent];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = [*(id *)(a1 + 32) splunkStateQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke_2;
    v11[3] = &unk_1E60B62D8;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    dispatch_async(v9, v11);
  }
  else
  {
    id v10 = +[SUCoreDiag sharedDiag];
    [v10 trackError:@"[EVENT_REPORTER] SEND_RETURNING_AUGMENTED" forReason:@"failed to create core event from provided event information" withResult:8100 withError:0];
  }
}

uint64_t __63__SUCoreEventReporter_sendEventReturningAugmented_toServerURL___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendCoreEvent:*(void *)(a1 + 40)];
}

- (void)dropOnSendFailure:(BOOL)a3
{
  id v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SUCoreEventReporter_dropOnSendFailure___block_invoke;
  v6[3] = &unk_1E60B6570;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

void __41__SUCoreEventReporter_dropOnSendFailure___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) dropEventsOnSendFailure];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setDropEventsOnSendFailure:v3 != 0];
    int64_t v4 = +[SUCoreLog sharedLogger];
    id v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) dropEventsOnSendFailure];
      BOOL v7 = @"NO";
      if (v6) {
        BOOL v7 = @"YES";
      }
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_1B4EC2000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] CONFIG | dropEventsOnSendFailure=%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)flushEvent
{
  int v3 = [(SUCoreEventReporter *)self splunkStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SUCoreEventReporter_flushEvent__block_invoke;
  block[3] = &unk_1E60B6300;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __33__SUCoreEventReporter_flushEvent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _splunkAccessSetup];
  uint64_t v2 = [*(id *)(a1 + 32) lastErrorEvent];
  if (v2
    && (int v3 = (void *)v2,
        [*(id *)(a1 + 32) lastErrorEvent],
        int64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 changedSinceReported],
        v4,
        v3,
        v5))
  {
    int v6 = +[SUCoreLog sharedLogger];
    BOOL v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v7, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] FLUSH | sending last error event", buf, 2u);
    }

    int v8 = *(void **)(a1 + 32);
    id v9 = [v8 lastErrorEvent];
    [v8 _sendCoreEvents:v9 secondEvent:0];
  }
  else
  {
    uint64_t v10 = +[SUCoreLog sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_1B4EC2000, v11, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] FLUSH | sending first awaiting retry", v13, 2u);
    }

    [*(id *)(a1 + 32) _sendFirstAwaitingRetry];
  }
  return [*(id *)(a1 + 32) setLastErrorEvent:0];
}

- (int64_t)currentAccessControl
{
  int v3 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  int64_t v4 = [(SUCoreEventReporter *)self splunkStateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SUCoreEventReporter_currentAccessControl__block_invoke;
  v7[3] = &unk_1E60B6328;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __43__SUCoreEventReporter_currentAccessControl__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) accessControl];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)indicateOnceIdle:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__SUCoreEventReporter_indicateOnceIdle___block_invoke;
  v7[3] = &unk_1E60B65C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __40__SUCoreEventReporter_indicateOnceIdle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) onceIdleCompletion];

  if (v2)
  {
    int v3 = +[SUCore sharedCore];
    id v4 = [v3 buildError:8117 underlying:0 description:@"indicateOnceIdle completion when older completion in place - issuing error to older completion"];

    int64_t v5 = [*(id *)(a1 + 32) onceIdleCompletion];
    [*(id *)(a1 + 32) setOnceIdleCompletion:0];
    id v6 = +[SUCore sharedCore];
    BOOL v7 = [v6 completionQueue];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __40__SUCoreEventReporter_indicateOnceIdle___block_invoke_2;
    char v14 = &unk_1E60B6598;
    id v15 = v4;
    id v16 = v5;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v7, &v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "setOnceIdleCompletion:", *(void *)(a1 + 40), v11, v12, v13, v14);
  return [*(id *)(a1 + 32) _checkWhetherIdle:@"indicate once idle"];
}

uint64_t __40__SUCoreEventReporter_indicateOnceIdle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_splunkAccessSetup
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v3 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v3);

  if (![(SUCoreEventReporter *)self splunkAccessCreated])
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    int64_t v5 = [[SUCoreEventReporterDelegate alloc] initWithReporter:self];
    [(SUCoreEventReporter *)self setReporterDelegate:v5];

    id v6 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    [(SUCoreEventReporter *)self setInProcessConfig:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    [(SUCoreEventReporter *)self setInProcessOperationQueue:v7];

    id v8 = [(SUCoreEventReporter *)self inProcessOperationQueue];
    [v8 setMaxConcurrentOperationCount:1];

    id v9 = (void *)MEMORY[0x1E4F290E0];
    uint64_t v10 = [(SUCoreEventReporter *)self inProcessConfig];
    uint64_t v11 = [(SUCoreEventReporter *)self reporterDelegate];
    uint64_t v12 = [(SUCoreEventReporter *)self inProcessOperationQueue];
    id v13 = [v9 sessionWithConfiguration:v10 delegate:v11 delegateQueue:v12];
    [(SUCoreEventReporter *)self setInProcessSession:v13];

    char v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://xp.apple.com/report/2/psr_ota"];
    [(SUCoreEventReporter *)self setSplunkURL:v14];

    id v15 = +[SUCoreLog sharedLogger];
    id v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(SUCoreEventReporter *)self splunkURL];
      *(_DWORD *)buf = 138543362;
      v38 = v17;
      _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SETUP | default Splunk URL: %{public}@", buf, 0xCu);
    }
    uint64_t v18 = [(SUCoreEventReporter *)self storeToPath];
    id v36 = 0;
    char v19 = [v4 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v20 = v36;

    if ((v19 & 1) == 0 && (!v20 || [v20 code] != 17))
    {
      uint64_t v21 = +[SUCoreDiag sharedDiag];
      id v22 = [NSString alloc];
      id v23 = [(SUCoreEventReporter *)self storeToPath];
      v24 = (void *)[v22 initWithFormat:@"failed to create store-to directory: %@", v23];
      objc_msgSend(v21, "trackError:forReason:withResult:withError:", @"[EVENT_REPORTER] SETUP", v24, objc_msgSend(v20, "code"), v20);
    }
    v25 = [(SUCoreEventReporter *)self persistedStatePath];
    id v35 = 0;
    char v26 = [v4 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v35];
    id v27 = v35;

    if ((v26 & 1) == 0 && (!v27 || [v27 code] != 17))
    {
      v28 = +[SUCoreDiag sharedDiag];
      id v29 = [NSString alloc];
      char v30 = [(SUCoreEventReporter *)self persistedStatePath];
      v31 = (void *)[v29 initWithFormat:@"failed to create persisted-state directory: %@", v30];
      objc_msgSend(v28, "trackError:forReason:withResult:withError:", @"[EVENT_REPORTER] SETUP", v31, objc_msgSend(v27, "code"), v27);
    }
    uint64_t v32 = [(SUCoreEventReporter *)self activeEventsState];
    [v32 loadPersistedState];

    id v33 = [(SUCoreEventReporter *)self _newExistingFileUUIDs];
    v34 = [(SUCoreEventReporter *)self _alignPersistedStateWithExistingFileUUIDs:v33];

    [(SUCoreEventReporter *)self _synchronizeWithNSURLSessionExpecting:v34];
    [(SUCoreEventReporter *)self setSplunkAccessCreated:1];
  }
}

- (void)_determineEventExtensions
{
  int v3 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v3);

  if ([(SUCoreEventReporter *)self eventExtensionsDetermined]) {
    return;
  }
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.UpdateMetrics"];
  id v4 = [v9 stringForKey:@"Context"];
  if (v4)
  {
    int64_t v5 = 0;
    goto LABEL_4;
  }
  if ([(SUCoreEventReporter *)self accessControl])
  {
    int64_t v5 = [(SUCoreEventReporter *)self _buildContextFromNVRAMBootArgs];
    if (v5)
    {
LABEL_4:
      id v6 = (NSMutableDictionary *)objc_opt_new();
      eventExtensions = self->_eventExtensions;
      self->_eventExtensions = v6;

      if (v4) {
        id v8 = v4;
      }
      else {
        id v8 = v5;
      }
      [(NSMutableDictionary *)self->_eventExtensions setSafeObject:v8 forKey:@"context"];
    }
  }
  [(SUCoreEventReporter *)self setEventExtensionsDetermined:1];
}

- (id)_buildContextFromNVRAMBootArgs
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v2);

  io_registry_entry_t v3 = IORegistryEntryFromPath(*MEMORY[0x1E4F2EEF0], "IODeviceTree:/options");
  if (!v3)
  {
    id v7 = +[SUCoreDiag sharedDiag];
    [v7 trackAnomaly:@"[EVENT_REPORTER] BUILD" forReason:@"unable to read NVRAM variables - unable to get registry entry for IODeviceTree:/options" withResult:8104 withError:0];

    id v8 = 0;
    goto LABEL_27;
  }
  io_object_t v4 = v3;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, @"boot-args", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  IOObjectRelease(v4);
  if (!CFProperty) {
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (id)[[NSString alloc] initWithData:CFProperty encoding:4];
    if (!v6) {
      goto LABEL_23;
    }
LABEL_9:
    id v22 = v6;
    id v23 = CFProperty;
    id v9 = [v6 componentsSeparatedByString:@" "];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v8 = 0;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) componentsSeparatedByString:@"="];
          id v15 = v14;
          if (!v8)
          {
            if ([v14 count] == 2)
            {
              id v16 = [v15 objectAtIndexedSubscript:0];
              int v17 = [v16 isEqualToString:@"BATS_TESTPLAN_ID"];

              id v8 = 0;
              if (v17)
              {
                id v18 = [NSString alloc];
                char v19 = [v15 objectAtIndexedSubscript:1];
                id v8 = (void *)[v18 initWithFormat:@"BATS_TESTPLAN_ID_%@", v19];
              }
            }
            else
            {
              id v8 = 0;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }
    else
    {
      id v8 = 0;
    }

    CFProperty = v23;
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = CFProperty;
    goto LABEL_9;
  }
  id v20 = +[SUCoreDiag sharedDiag];
  [v20 trackAnomaly:@"[EVENT_REPORTER] BUILD" forReason:@"NVRAM boot-args exist but format unknown - ignored" withResult:8103 withError:0];

LABEL_23:
  id v8 = 0;
LABEL_26:

LABEL_27:
  return v8;
}

- (void)_adoptLastErrorEvent:(id)a3
{
  id v5 = a3;
  io_object_t v4 = [v5 allFields];
  [v4 setSafeObject:@"false" forKey:@"sameErrorSignature"];

  [(SUCoreEventReporter *)self setLastErrorEvent:v5];
}

- (void)_sendCoreEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v5);

  [(SUCoreEventReporter *)self _splunkAccessSetup];
  id v6 = [v4 allFields];
  id v7 = [v6 safeStringForKey:@"UUID"];

  if (v7)
  {
    id v8 = +[SUCoreDiag sharedDiag];
    [v8 trackLastReportedUUID:v7];
  }
  if ([v4 isSuccess])
  {
    id v9 = +[SUCoreLog sharedLogger];
    uint64_t v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v10, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | sending event [event indicating successful operation]", buf, 2u);
    }

    uint64_t v11 = [(SUCoreEventReporter *)self lastErrorEvent];
    int v12 = [v11 changedSinceReported];

    if (v12)
    {
      id v13 = [(SUCoreEventReporter *)self lastErrorEvent];
    }
    else
    {
      id v13 = 0;
    }
    [(SUCoreEventReporter *)self setLastErrorEvent:0];
    goto LABEL_25;
  }
  char v14 = [(SUCoreEventReporter *)self lastErrorEvent];

  if (!v14)
  {
    id v20 = +[SUCoreLog sharedLogger];
    uint64_t v21 = [v20 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1B4EC2000, v21, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | sending event [event indicating error when no last error]", v26, 2u);
    }

    [(SUCoreEventReporter *)self _adoptLastErrorEvent:v4];
    goto LABEL_18;
  }
  id v15 = [(SUCoreEventReporter *)self lastErrorEvent];
  int v16 = [v4 isEqualErrorEvent:v15];

  if (v16)
  {
    int v17 = [(SUCoreEventReporter *)self lastErrorEvent];
    [v17 incrementErrorCount];

    id v18 = +[SUCoreLog sharedLogger];
    char v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1B4EC2000, v19, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | not sending event [event indicating error matching last reported]", v28, 2u);
    }

    id v4 = 0;
LABEL_18:
    id v13 = 0;
    goto LABEL_25;
  }
  id v22 = +[SUCoreLog sharedLogger];
  id v23 = [v22 oslog];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v27 = 0;
    _os_log_impl(&dword_1B4EC2000, v23, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | sending event [event indicating error that is different than last reported]", v27, 2u);
  }

  long long v24 = [(SUCoreEventReporter *)self lastErrorEvent];
  int v25 = [v24 changedSinceReported];

  if (v25)
  {
    id v13 = [(SUCoreEventReporter *)self lastErrorEvent];
  }
  else
  {
    id v13 = 0;
  }
  [(SUCoreEventReporter *)self _adoptLastErrorEvent:v4];
LABEL_25:
  [(SUCoreEventReporter *)self _sendCoreEvents:v13 secondEvent:v4];
}

- (void)_sendCoreEvents:(id)a3 secondEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_opt_new();
  if (v6 && v7)
  {
    uint64_t v10 = [v6 reportedUUID];
    uint64_t v11 = [(SUCoreEventReporter *)self _getSplunkServerURL:v6];
    int v12 = [v7 reportedUUID];
    id v13 = [(SUCoreEventReporter *)self _getSplunkServerURL:v7];
    char v14 = [v6 allFields];
    [v9 addObject:v14];

    [(SUCoreEventReporter *)self _sendSplunkEvents:v9 forEventUUID:v10 toServerURL:v11];
    id v15 = objc_opt_new();

    int v16 = [v7 allFields];
    [v15 addObject:v16];

    [(SUCoreEventReporter *)self _sendSplunkEvents:v15 forEventUUID:v12 toServerURL:v13];
    id v9 = v15;
    goto LABEL_9;
  }
  if (v6)
  {
    int v17 = [(SUCoreEventReporter *)self _getSplunkServerURL:v6];
    id v18 = [v6 allFields];
    [v9 addObject:v18];

    char v19 = v6;
LABEL_8:
    uint64_t v21 = [v19 reportedUUID];
    [(SUCoreEventReporter *)self _sendSplunkEvents:v9 forEventUUID:v21 toServerURL:v17];

    goto LABEL_9;
  }
  if (v7)
  {
    int v17 = [(SUCoreEventReporter *)self _getSplunkServerURL:v7];
    id v20 = [v7 allFields];
    [v9 addObject:v20];

    char v19 = v7;
    goto LABEL_8;
  }
  id v22 = +[SUCoreLog sharedLogger];
  id v23 = [v22 oslog];

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v24 = 0;
    _os_log_impl(&dword_1B4EC2000, v23, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] STATUS | send events with nothing to send", v24, 2u);
  }

LABEL_9:
}

- (void)_sendSplunkEvents:(id)a3 forEventUUID:(id)a4 toServerURL:(id)a5
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(SUCoreEventReporter *)self _newScrubbedEvents:v10];
  if (v8)
  {
    id v13 = v8;
  }
  else
  {
    char v14 = [MEMORY[0x1E4F29128] UUID];
    id v13 = [v14 UUIDString];
  }
  id v15 = [MEMORY[0x1E4F29128] UUID];
  int v16 = [v15 UUIDString];

  if (v9
    && v12
    && v13
    && v16
    && ([(SUCoreEventReporter *)self inProcessSession],
        int v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    v33[0] = @"clientId";
    v33[1] = @"events";
    v34[0] = v13;
    v34[1] = v12;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    char v19 = [(SUCoreEventReporter *)self _getJSONDataFromPayload:v18 withFileUUID:v16 forEventUUID:v13];
    if (v19)
    {
      uint64_t v20 = [(SUCoreEventReporter *)self _storeJSONData:v19 withFileUUID:v16 forEventUUID:v13];
      if (v20)
      {
        long long v26 = (void *)v20;
        uint64_t v21 = [v9 dataRepresentation];
        [(SUCoreEventReporter *)self _storeServerURLMetadata:v21 toFileUUID:v16];

        id v22 = +[SUCoreLog sharedLogger];
        id v23 = [v22 oslog];

        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v28 = v13;
          __int16 v29 = 2114;
          char v30 = v16;
          __int16 v31 = 2114;
          uint64_t v32 = v18;
          _os_log_impl(&dword_1B4EC2000, v23, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] UPLOADING | sending [UUID: %{public}@] file: %{public}@ payload: %{public}@", buf, 0x20u);
        }

        [(SUCoreEventReporter *)self _uploadFromFile:v26 withFileUUID:v16 forEventUUID:v13 toServerURL:v9];
        +[SUCoreSplunkHistory logEventUUID:v13];
      }
    }
  }
  else
  {
    long long v24 = +[SUCoreDiag sharedDiag];
    int v25 = (void *)[[NSString alloc] initWithFormat:@"missing required event resources [UUID: %@]", v13];
    [v24 trackAnomaly:@"[EVENT_REPORTER] SEND" forReason:v25 withResult:8101 withError:0];

    id v18 = 0;
    char v19 = 0;
  }
}

- (void)_uploadFromFile:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5 toServerURL:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  char v14 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v14);

  id v15 = v10;
  int v16 = +[SUCore getFileMetadata:forKey:](SUCore, "getFileMetadata:forKey:", [v15 fileSystemRepresentation], @"SUCoreEventReporterServerURL");
  int v17 = [(SUCoreEventReporter *)self _activeEventForFileUUID:v11];
  id v35 = v15;
  if (v17)
  {
    id v18 = v17;
    [(SUCoreEventReporterActive *)v17 setAttemptedSendCount:[(SUCoreEventReporterActive *)v17 attemptedSendCount] + 1];
    if ([(SUCoreEventReporterActive *)v18 attemptedSendCount] >= 9)
    {
      char v19 = +[SUCoreLog sharedLogger];
      uint64_t v20 = [v19 oslog];

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [(SUCoreEventReporterActive *)v18 summary];
        *(_DWORD *)buf = 138543618;
        id v37 = v11;
        __int16 v38 = 2114;
        uint64_t v39 = v21;
        _os_log_impl(&dword_1B4EC2000, v20, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] UPLOADING | dropping event with fileUUID:%{public}@ - too many send attempts | active:%{public}@", buf, 0x16u);
      }
      [(SUCoreEventReporter *)self _removeFileUUID:v11 loggingError:1 forReason:@"too many send attempts"];
      goto LABEL_20;
    }
  }
  else
  {
    id v18 = [[SUCoreEventReporterActive alloc] initWithServerURL:v13];
    [(SUCoreEventReporterActive *)v18 setAttemptedSendCount:[(SUCoreEventReporterActive *)v18 attemptedSendCount] + 1];
  }
  [(SUCoreEventReporter *)self _updateActiveEvent:v18 forFileUUID:v11];
  v34 = v16;
  if (v16)
  {
    id v22 = (void *)[[NSString alloc] initWithData:v16 encoding:4];
    if (v22)
    {
      id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v22];
      if (v23) {
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v22 = 0;
  }
  id v23 = v13;
LABEL_13:
  uint64_t v24 = [(SUCoreEventReporter *)self _getSplunkRequestForURL:v23];
  if (v24)
  {
    int v25 = (void *)v24;
    id v33 = v13;
    id v26 = v12;
    long long v27 = [(SUCoreEventReporter *)self inProcessSession];
    id v28 = [v27 uploadTaskWithRequest:v25 fromFile:v15];

    if (v28)
    {
      [(SUCoreEventReporter *)self _incrementActiveSendCount:@"uploading"];
      [v28 setTaskDescription:v11];
      [v28 resume];

      id v12 = v26;
    }
    else
    {
      __int16 v31 = +[SUCoreDiag sharedDiag];
      uint64_t v32 = (void *)[[NSString alloc] initWithFormat:@"unable to create NSURL session task [UUID: %@] file: %@", v26, v11];
      [v31 trackAnomaly:@"[EVENT_REPORTER] QUEUED" forReason:v32 withResult:8101 withError:0];

      id v12 = v26;
      [(SUCoreEventReporter *)self _awaitRetryingFileUUID:v11];
    }
    id v13 = v33;
  }
  else
  {
    __int16 v29 = +[SUCoreDiag sharedDiag];
    char v30 = (void *)[[NSString alloc] initWithFormat:@"unable to create request to reach server [UUID: %@] file: %@", v12, v11];
    [v29 trackAnomaly:@"[EVENT_REPORTER] QUEUED" forReason:v30 withResult:8101 withError:0];

    [(SUCoreEventReporter *)self _awaitRetryingFileUUID:v11];
  }
  int v16 = v34;
LABEL_20:
}

- (void)_sendInterruptedFromStorage:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          id v12 = (void *)MEMORY[0x1E4F1CB10];
          id v13 = [(SUCoreEventReporter *)self storeToPath];
          char v14 = [v13 stringByAppendingPathComponent:v11];
          id v15 = [v12 fileURLWithPath:v14];

          int v16 = [(SUCoreEventReporter *)self _activeEventForFileUUID:v11];
          int v17 = +[SUCoreLog sharedLogger];
          id v18 = [v17 oslog];

          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            char v19 = [v16 summary];
            *(_DWORD *)buf = 138543618;
            uint64_t v27 = v11;
            __int16 v28 = 2114;
            __int16 v29 = v19;
            _os_log_impl(&dword_1B4EC2000, v18, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | retrying (recovered from storage), re-sending fileUUID:%{public}@ | active:%{public}@", buf, 0x16u);
          }
          uint64_t v20 = [(SUCoreEventReporter *)self splunkURL];
          [(SUCoreEventReporter *)self _uploadFromFile:v15 withFileUUID:v11 forEventUUID:0 toServerURL:v20];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v8);
    }

    id v4 = v21;
  }
}

- (void)_sendAllAwaitingRetry
{
  io_registry_entry_t v3 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v3);

  while ([(SUCoreEventReporter *)self _sendFirstAwaitingRetry])
    ;
}

- (BOOL)_sendFirstAwaitingRetry
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v3 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SUCoreEventReporter *)self awaitingRetry];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(SUCoreEventReporter *)self awaitingRetry];
    uint64_t v7 = [v6 objectAtIndex:0];

    uint64_t v8 = [(SUCoreEventReporter *)self awaitingRetry];
    [v8 removeObjectAtIndex:0];

    uint64_t v9 = +[SUCoreLog sharedLogger];
    id v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(SUCoreEventReporter *)self activeSendTaskCount];
      id v12 = [(SUCoreEventReporter *)self awaitingRetry];
      int v23 = 67109376;
      *(_DWORD *)long long v24 = v11;
      *(_WORD *)&v24[4] = 2048;
      *(void *)&v24[6] = [v12 count];
      _os_log_impl(&dword_1B4EC2000, v10, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | sending first awaiting retry - activeSendTaskCount:%d, awaitingRetry:%lu", (uint8_t *)&v23, 0x12u);
    }
    if (v7)
    {
      id v13 = (void *)MEMORY[0x1E4F1CB10];
      char v14 = [(SUCoreEventReporter *)self storeToPath];
      id v15 = [v14 stringByAppendingPathComponent:v7];
      int v16 = [v13 fileURLWithPath:v15];

      int v17 = [(SUCoreEventReporter *)self _activeEventForFileUUID:v7];
      id v18 = +[SUCoreLog sharedLogger];
      char v19 = [v18 oslog];

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v17 summary];
        int v23 = 138543618;
        *(void *)long long v24 = v7;
        *(_WORD *)&v24[8] = 2114;
        *(void *)&v24[10] = v20;
        _os_log_impl(&dword_1B4EC2000, v19, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] UPLOADING | retrying, re-sending fileUUID:%{public}@ | active:%{public}@", (uint8_t *)&v23, 0x16u);
      }
      id v21 = [(SUCoreEventReporter *)self splunkURL];
      [(SUCoreEventReporter *)self _uploadFromFile:v16 withFileUUID:v7 forEventUUID:0 toServerURL:v21];
    }
    else
    {
      int v16 = +[SUCoreDiag sharedDiag];
      [v16 trackAnomaly:@"[EVENT_REPORTER] UPLOADING" forReason:@"unable to load fileUUID from awaiting retry array" withResult:8103 withError:0];
    }
  }
  return v5 != 0;
}

- (void)_awaitRetryingFileUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SUCoreEventReporter *)self awaitingRetry];

  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    [(SUCoreEventReporter *)self setAwaitingRetry:v7];
  }
  uint64_t v8 = [(SUCoreEventReporter *)self awaitingRetry];
  [v8 addObject:v4];

  uint64_t v9 = [(SUCoreEventReporter *)self awaitingRetry];
  unint64_t v10 = [v9 count];

  if (v10 >= 0x11)
  {
    do
    {
      int v11 = [(SUCoreEventReporter *)self awaitingRetry];
      id v12 = [v11 objectAtIndex:0];

      id v13 = [(SUCoreEventReporter *)self awaitingRetry];
      [v13 removeObjectAtIndex:0];

      if (v12)
      {
        char v14 = +[SUCoreDiag sharedDiag];
        id v15 = (void *)[[NSString alloc] initWithFormat:@"too many awaiting retry - not reporting file: %@", v12];
        [v14 trackError:@"[EVENT_REPORTER] DROP" forReason:v15 withResult:8108 withError:0];

        [(SUCoreEventReporter *)self _removeFileUUID:v12 loggingError:1 forReason:@"too many waiting retry"];
      }

      int v16 = [(SUCoreEventReporter *)self awaitingRetry];
      unint64_t v17 = [v16 count];
    }
    while (v17 > 0x10);
  }
  id v18 = +[SUCoreLog sharedLogger];
  char v19 = [v18 oslog];

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = [(SUCoreEventReporter *)self activeSendTaskCount];
    id v21 = [(SUCoreEventReporter *)self awaitingRetry];
    *(_DWORD *)buf = 67109376;
    int v23 = v20;
    __int16 v24 = 2048;
    uint64_t v25 = [v21 count];
    _os_log_impl(&dword_1B4EC2000, v19, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | awaiting retrying - activeSendTaskCount:%d, awaitingRetry:%lu", buf, 0x12u);
  }
}

- (id)_newExistingFileUUIDs
{
  io_registry_entry_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(SUCoreEventReporter *)self storeToPath];
  id v11 = 0;
  uint64_t v5 = [v3 contentsOfDirectoryAtPath:v4 error:&v11];
  id v6 = v11;

  if (v6)
  {
    uint64_t v7 = +[SUCoreDiag sharedDiag];
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"failed to get existing files error: %@", v6];
    objc_msgSend(v7, "trackError:forReason:withResult:withError:", @"[EVENT_REPORTER] SYNC", v8, objc_msgSend(v6, "code"), v6);
  }
  else
  {
    uint64_t v9 = (void *)[v5 mutableCopy];
    if (v9) {
      goto LABEL_5;
    }
    uint64_t v7 = +[SUCoreDiag sharedDiag];
    [v7 trackError:@"[EVENT_REPORTER] SYNC" forReason:@"failed to copy existing files array" withResult:8105 withError:0];
  }

  uint64_t v9 = 0;
LABEL_5:

  return v9;
}

- (void)_synchronizeWithNSURLSessionExpecting:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[SUCoreLog sharedLogger];
  id v6 = [v5 oslog];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B4EC2000, v6, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | getAllTasksWithCompletionHandler... | synchronizing with NSURLSession to determine in-flight events", buf, 2u);
  }

  uint64_t v7 = [(SUCoreEventReporter *)self inProcessSession];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke;
  v9[3] = &unk_1E60B6610;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [v7 getAllTasksWithCompletionHandler:v9];
}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) splunkStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2;
  block[3] = &unk_1E60B65E8;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2(id *a1)
{
  v1 = a1;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (__CFString *)[a1[4] copy];
  id v3 = v1[5];
  id v4 = &off_1E60B6000;
  if (v3 && [v3 count])
  {
    id v5 = +[SUCoreLog sharedLogger];
    id v6 = [v5 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v1[5] count];
      uint64_t v8 = [v1[5] count];
      uint64_t v9 = @"s";
      if (v8 == 1) {
        uint64_t v9 = &stru_1F0D92C90;
      }
      *(_DWORD *)buf = 134218242;
      uint64_t v43 = v7;
      __int16 v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_1B4EC2000, v6, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | ...getAllTasksWithCompletionHandler | %lu in-flight event%@", buf, 0x16u);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v10 = v1[5];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v11)
    {
      uint64_t v13 = v11;
      uint64_t v14 = *(void *)v39;
      *(void *)&long long v12 = 138543618;
      long long v33 = v12;
      v34 = v10;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v10);
          }
          int v16 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          unint64_t v17 = objc_msgSend(v16, "taskDescription", v33);
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v18 = [v1[6] _activeEventForFileUUID:v17];
            if ([v1[4] containsObject:v17])
            {
              switch([v16 state])
              {
                case 0:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredRunning:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
                case 1:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredSuspended:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
                case 2:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredCanceling:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
                case 3:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredCompleted:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
                default:
                  uint64_t v19 = [v1[6] _synchonizeDiscoveredUnknown:v16 forActiveEvent:v18 withFileUUIDsToRetry:v2];
                  break;
              }
              long long v22 = v2;
              uint64_t v2 = (__CFString *)v19;
            }
            else
            {
              id v21 = v1;
              id v35 = v2;
              +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", [v16 state]);
              long long v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
              int v23 = v4;
              __int16 v24 = [v4[57] sharedLogger];
              uint64_t v25 = [v24 oslog];

              BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
              if (v18)
              {
                if (v26)
                {
                  uint64_t v27 = [v18 summary];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v43 = (uint64_t)v17;
                  __int16 v44 = 2114;
                  v45 = v22;
                  __int16 v46 = 2114;
                  v47 = v27;
                  _os_log_error_impl(&dword_1B4EC2000, v25, OS_LOG_TYPE_ERROR, "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task for fileUUID:%{public}@, state:%{public}@ - no longer on the filesystem | active:%{public}@", buf, 0x20u);
                }
                [v21[6] _removeActiveEventForFileUUID:v17];
              }
              else
              {
                if (v26)
                {
                  *(_DWORD *)buf = v33;
                  uint64_t v43 = (uint64_t)v17;
                  __int16 v44 = 2114;
                  v45 = v22;
                  _os_log_error_impl(&dword_1B4EC2000, v25, OS_LOG_TYPE_ERROR, "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task for fileUUID:%{public}@, state:%{public}@ - no longer on the filesystem", buf, 0x16u);
                }
              }
              id v4 = v23;
              v1 = v21;
              id v10 = v34;
              uint64_t v2 = v35;
            }
          }
          else
          {
            int v20 = [v4[57] sharedLogger];
            id v18 = [v20 oslog];

            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2_cold_1(&v36, v37, v18);
            }
          }
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v13);
    }
  }
  else
  {
    __int16 v28 = +[SUCoreLog sharedLogger];
    id v10 = [v28 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v10, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | ...getAllTasksWithCompletionHandler | no in-flight events", buf, 2u);
    }
  }

  if (v2 && [(__CFString *)v2 count])
  {
    __int16 v29 = [v4[57] sharedLogger];
    char v30 = [v29 oslog];

    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v30, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | retrying events discovered on the filesystem", buf, 2u);
    }

    [v1[6] _sendInterruptedFromStorage:v2];
  }
  else
  {
    uint64_t v31 = [v4[57] sharedLogger];
    uint64_t v32 = [v31 oslog];

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B4EC2000, v32, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | no events to retry", buf, 2u);
    }
  }
}

- (id)_synchonizeDiscoveredRunning:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v11);

  long long v12 = [v10 taskDescription];
  uint64_t v13 = [v10 state];

  uint64_t v14 = +[SUCoreEventReporter _nsURLSessionTaskNameForState:v13];
  id v15 = +[SUCoreLog sharedLogger];
  int v16 = [v15 oslog];

  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      id v18 = [v8 summary];
      int v21 = 138543874;
      long long v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      __int16 v25 = 2114;
      BOOL v26 = v18;
      _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - continuing | active:%{public}@", (uint8_t *)&v21, 0x20u);
    }
    objc_msgSend(v8, "setDiscoveredRunningCount:", objc_msgSend(v8, "discoveredRunningCount") + 1);
    [(SUCoreEventReporter *)self _updateActiveEvent:v8 forFileUUID:v12];
  }
  else
  {
    if (v17)
    {
      int v21 = 138543618;
      long long v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v21, 0x16u);
    }

    uint64_t v19 = [(SUCoreEventReporter *)self _removeFileUUID:v12 fromFilesToRetry:v9];

    id v9 = (id)v19;
  }

  return v9;
}

- (id)_synchonizeDiscoveredSuspended:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v11);

  long long v12 = [v8 taskDescription];
  uint64_t v13 = +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", [v8 state]);
  uint64_t v14 = +[SUCoreLog sharedLogger];
  id v15 = [v14 oslog];

  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v16)
    {
      BOOL v17 = [v9 summary];
      int v20 = 138543874;
      int v21 = v12;
      __int16 v22 = 2114;
      __int16 v23 = v13;
      __int16 v24 = 2114;
      __int16 v25 = v17;
      _os_log_impl(&dword_1B4EC2000, v15, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - resuming | active:%{public}@", (uint8_t *)&v20, 0x20u);
    }
    objc_msgSend(v9, "setDiscoveredSuspendedCount:", objc_msgSend(v9, "discoveredSuspendedCount") + 1);
    [v8 resume];
    [(SUCoreEventReporter *)self _updateActiveEvent:v9 forFileUUID:v12];
  }
  else
  {
    if (v16)
    {
      int v20 = 138543618;
      int v21 = v12;
      __int16 v22 = 2114;
      __int16 v23 = v13;
      _os_log_impl(&dword_1B4EC2000, v15, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v18 = [(SUCoreEventReporter *)self _removeFileUUID:v12 fromFilesToRetry:v10];

    id v10 = (id)v18;
  }

  return v10;
}

- (id)_synchonizeDiscoveredCanceling:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v11);

  long long v12 = [v10 taskDescription];
  uint64_t v13 = [v10 state];

  uint64_t v14 = +[SUCoreEventReporter _nsURLSessionTaskNameForState:v13];
  id v15 = +[SUCoreLog sharedLogger];
  BOOL v16 = [v15 oslog];

  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      uint64_t v18 = [v8 summary];
      int v21 = 138543874;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - awaiting didCompleteWithError | active:%{public}@", (uint8_t *)&v21, 0x20u);
    }
    objc_msgSend(v8, "setDiscoveredCancelingCount:", objc_msgSend(v8, "discoveredCancelingCount") + 1);
    [(SUCoreEventReporter *)self _updateActiveEvent:v8 forFileUUID:v12];
  }
  else
  {
    if (v17)
    {
      int v21 = 138543618;
      __int16 v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v21, 0x16u);
    }

    uint64_t v19 = [(SUCoreEventReporter *)self _removeFileUUID:v12 fromFilesToRetry:v9];

    id v9 = (id)v19;
  }

  return v9;
}

- (id)_synchonizeDiscoveredCompleted:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v11);

  long long v12 = [v8 taskDescription];
  uint64_t v13 = +[SUCoreEventReporter _nsURLSessionTaskNameForState:](SUCoreEventReporter, "_nsURLSessionTaskNameForState:", [v8 state]);
  if (v9)
  {
    uint64_t v14 = [v8 error];
    if (v14)
    {
      objc_msgSend(v9, "setFailedSendCount:", objc_msgSend(v9, "failedSendCount") + 1);
      uint64_t v15 = [v9 failedSendCount];
      BOOL v16 = +[SUCoreLog sharedLogger];
      BOOL v17 = [v16 oslog];

      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v15 <= 7)
      {
        if (v18)
        {
          uint64_t v19 = [v9 summary];
          int v29 = 138543874;
          char v30 = v12;
          __int16 v31 = 2114;
          uint64_t v32 = v13;
          __int16 v33 = 2114;
          v34 = v19;
          _os_log_impl(&dword_1B4EC2000, v17, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [ERROR] - will retry | active:%{public}@", (uint8_t *)&v29, 0x20u);
        }
        [(SUCoreEventReporter *)self _updateActiveEvent:v9 forFileUUID:v12];
        goto LABEL_17;
      }
      if (v18)
      {
        uint64_t v26 = [v9 summary];
        int v29 = 138543874;
        char v30 = v12;
        __int16 v31 = 2114;
        uint64_t v32 = v13;
        __int16 v33 = 2114;
        v34 = v26;
        _os_log_impl(&dword_1B4EC2000, v17, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [ERROR] - dropping | active:%{public}@", (uint8_t *)&v29, 0x20u);
      }
      [(SUCoreEventReporter *)self _removeActiveEventForFileUUID:v12];
    }
    else
    {
      __int16 v23 = +[SUCoreLog sharedLogger];
      __int16 v24 = [v23 oslog];

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v25 = [v9 summary];
        int v29 = 138543874;
        char v30 = v12;
        __int16 v31 = 2114;
        uint64_t v32 = v13;
        __int16 v33 = 2114;
        v34 = v25;
        _os_log_impl(&dword_1B4EC2000, v24, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ [SUCCESS] - considering done | active:%{public}@", (uint8_t *)&v29, 0x20u);
      }
    }
    uint64_t v27 = [(SUCoreEventReporter *)self _removeFileUUID:v12 fromFilesToRetry:v10];

    id v10 = (id)v27;
LABEL_17:

    goto LABEL_18;
  }
  int v20 = +[SUCoreLog sharedLogger];
  int v21 = [v20 oslog];

  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138543618;
    char v30 = v12;
    __int16 v31 = 2114;
    uint64_t v32 = v13;
    _os_log_impl(&dword_1B4EC2000, v21, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v29, 0x16u);
  }

  uint64_t v22 = [(SUCoreEventReporter *)self _removeFileUUID:v12 fromFilesToRetry:v10];

  [(SUCoreEventReporter *)self _removeFileUUID:v12 loggingError:1 forReason:@"synchonize discovered Completed"];
  id v10 = (id)v22;
LABEL_18:

  return v10;
}

- (id)_synchonizeDiscoveredUnknown:(id)a3 forActiveEvent:(id)a4 withFileUUIDsToRetry:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v11);

  long long v12 = [v10 taskDescription];
  uint64_t v13 = [v10 state];

  uint64_t v14 = +[SUCoreEventReporter _nsURLSessionTaskNameForState:v13];
  uint64_t v15 = +[SUCoreLog sharedLogger];
  BOOL v16 = [v15 oslog];

  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v17)
    {
      BOOL v18 = [v8 summary];
      int v21 = 138543874;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      __int16 v25 = 2114;
      uint64_t v26 = v18;
      _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | tracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - dropping | active:%{public}@", (uint8_t *)&v21, 0x20u);
    }
    [(SUCoreEventReporter *)self _removeActiveEventForFileUUID:v12];
  }
  else
  {
    if (v17)
    {
      int v21 = 138543618;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      __int16 v24 = v14;
      _os_log_impl(&dword_1B4EC2000, v16, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | untracked NSURLSession task for fileUUID:%{public}@, state:%{public}@ - ignored", (uint8_t *)&v21, 0x16u);
    }
  }
  uint64_t v19 = [(SUCoreEventReporter *)self _removeFileUUID:v12 fromFilesToRetry:v9];

  return v19;
}

- (id)_alignPersistedStateWithExistingFileUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = v4;
  uint64_t v7 = [(SUCoreEventReporter *)self activeEventsState];
  id v8 = [v7 dictionaryForKey:@"ActiveEventsState"];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  BOOL v18 = __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke;
  uint64_t v19 = &unk_1E60B6638;
  id v10 = v6;
  id v20 = v10;
  id v21 = v9;
  id v11 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:&v16];
  long long v12 = [(SUCoreEventReporter *)self activeEventsState];
  [v12 persistDictionary:v11 forKey:@"ActiveEventsState"];

  uint64_t v13 = v21;
  id v14 = v10;

  return v14;
}

void __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v7 = v5;
    id v8 = [[SUCoreEventReporterActive alloc] initFromArchivedData:v6];
    int v9 = [*(id *)(a1 + 32) containsObject:v7];
    id v10 = +[SUCoreLog sharedLogger];
    id v11 = [v10 oslog];

    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        uint64_t v13 = [v8 summary];
        int v16 = 138543618;
        uint64_t v17 = v7;
        __int16 v18 = 2114;
        uint64_t v19 = v13;
        _os_log_impl(&dword_1B4EC2000, v11, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | aligning fileUUID:%{public}@ - on filesystem and persisted | active:%{public}@", (uint8_t *)&v16, 0x16u);
      }
      [*(id *)(a1 + 40) setSafeObject:v6 forKey:v7];
    }
    else
    {
      if (v12)
      {
        uint64_t v15 = [v8 summary];
        int v16 = 138543618;
        uint64_t v17 = v7;
        __int16 v18 = 2114;
        uint64_t v19 = v15;
        _os_log_impl(&dword_1B4EC2000, v11, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SYNCHRONIZING | aligning fileUUID:%{public}@ - no longer on filesystem, dropping | active:%{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    id v14 = +[SUCoreLog sharedLogger];
    uint64_t v7 = [v14 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke_cold_1(v7);
    }
  }
}

- (id)_removeFileUUID:(id)a3 fromFilesToRetry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = v7;
  id v10 = v9;
  if (v9 && [v9 count] && objc_msgSend(v10, "count"))
  {
    uint64_t v11 = 0;
    while (1)
    {
      BOOL v12 = [v10 objectAtIndex:v11];
      if (+[SUCore stringIsEqual:v6 to:v12]) {
        break;
      }

      if (++v11 >= (unint64_t)[v10 count]) {
        goto LABEL_9;
      }
    }
    [v10 removeObjectAtIndex:v11];
  }
LABEL_9:

  return v10;
}

- (id)_activeEventForFileUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SUCoreEventReporter *)self activeEventsState];
  id v7 = [v6 dictionaryForKey:@"ActiveEventsState"];

  if (v7
    && ([v7 safeObjectForKey:v4 ofClass:objc_opt_class()],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v9 = (void *)v8;
    id v10 = [[SUCoreEventReporterActive alloc] initFromArchivedData:v8];

    if (v10)
    {
      uint64_t v11 = +[SUCoreLog sharedLogger];
      BOOL v12 = [v11 oslog];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [v10 summary];
        int v15 = 138543618;
        id v16 = v4;
        __int16 v17 = 2114;
        __int16 v18 = v13;
        _os_log_impl(&dword_1B4EC2000, v12, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] ACTIVE | found active event for fileUUID:%{public}@ | activeEvent:%{public}@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_updateActiveEvent:(id)a3 forFileUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(SUCoreEventReporter *)self activeEventsState];
  id v10 = [v9 dictionaryForKey:@"ActiveEventsState"];
  id v11 = (id)[v10 mutableCopy];

  if (!v11) {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  BOOL v12 = [v6 toArchivedData];
  [v11 setSafeObject:v12 forKey:v7];

  uint64_t v13 = [(SUCoreEventReporter *)self activeEventsState];
  [v13 persistDictionary:v11 forKey:@"ActiveEventsState"];

  id v14 = +[SUCoreLog sharedLogger];
  int v15 = [v14 oslog];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v6 summary];
    int v17 = 138543618;
    id v18 = v7;
    __int16 v19 = 2114;
    uint64_t v20 = v16;
    _os_log_impl(&dword_1B4EC2000, v15, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] ACTIVE | updated active event for fileUUID:%{public}@ | activeEvent:%{public}@", (uint8_t *)&v17, 0x16u);
  }
}

- (void)_removeActiveEventForFileUUID:(id)a3
{
  id v9 = a3;
  id v4 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SUCoreEventReporter *)self activeEventsState];
  id v6 = [v5 dictionaryForKey:@"ActiveEventsState"];
  id v7 = (void *)[v6 mutableCopy];

  if (v7)
  {
    [v7 removeObjectForKey:v9];
    uint64_t v8 = [(SUCoreEventReporter *)self activeEventsState];
    [v8 persistDictionary:v7 forKey:@"ActiveEventsState"];
  }
}

- (id)_getSplunkServerURL:(id)a3
{
  id v4 = [a3 serverURL];
  if (!v4)
  {
    id v4 = [(SUCoreEventReporter *)self splunkURL];
  }
  return v4;
}

- (id)_getSplunkRequestForURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28E88] requestWithURL:v3];
    id v5 = v4;
    if (v4)
    {
      [v4 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
      [v5 setHTTPMethod:@"POST"];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_newScrubbedEvents:(id)a3
{
  id v4 = a3;
  if (v4 && (id v5 = objc_opt_new()) != 0)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__SUCoreEventReporter__newScrubbedEvents___block_invoke;
    v8[3] = &unk_1E60B6660;
    v8[4] = self;
    id v6 = v5;
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __42__SUCoreEventReporter__newScrubbedEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (id)[*(id *)(a1 + 32) _copyEscapeStringsForEventData:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_copyEscapeStringsForEventData:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28E58];
  id v4 = a3;
  id v5 = [v3 characterSetWithCharactersInString:@"%\\""];
  id v6 = [MEMORY[0x1E4F28B88] controlCharacterSet];
  [v5 formUnionWithCharacterSet:v6];

  id v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  [v5 formUnionWithCharacterSet:v7];

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28E58], "characterSetWithRange:", 0, 127);
  id v9 = [v5 invertedSet];
  [v8 formIntersectionWithCharacterSet:v9];

  id v10 = [v4 allKeys];
  id v11 = [MEMORY[0x1E4F1CA98] null];
  BOOL v12 = [v4 objectsForKeys:v10 notFoundMarker:v11];

  uint64_t v13 = (void *)[v12 mutableCopy];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __54__SUCoreEventReporter__copyEscapeStringsForEventData___block_invoke;
  uint64_t v22 = &unk_1E60B6688;
  id v23 = v13;
  id v24 = v8;
  id v14 = v8;
  id v15 = v13;
  [v15 enumerateObjectsUsingBlock:&v19];
  id v16 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  int v17 = objc_msgSend(v16, "initWithObjects:forKeys:", v15, v10, v19, v20, v21, v22);

  return v17;
}

void __54__SUCoreEventReporter__copyEscapeStringsForEventData___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  *a4 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v10 stringByReplacingOccurrencesOfString:@"=" withString:@":"];
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:*(void *)(a1 + 40)];
    [v8 replaceObjectAtIndex:a3 withObject:v9];
  }
}

+ (id)_errorDomainAbbreviation:(id)a3
{
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 isEqualToString:@"com.apple.softwareupdateservices.errors"])
  {
    id v4 = @"SUS";
  }
  else if ([(__CFString *)v3 isEqualToString:@"SUControllerError"])
  {
    id v4 = @"SUC";
  }
  else if ([(__CFString *)v3 isEqualToString:@"SUBError"])
  {
    id v4 = @"SUB";
  }
  else if ([(__CFString *)v3 isEqualToString:@"BridgeOSSoftwareUpdateError"])
  {
    id v4 = @"BSU";
  }
  else if ([(__CFString *)v3 isEqualToString:@"MobileSoftwareUpdateErrorDomain"])
  {
    id v4 = @"MSU";
  }
  else if ([(__CFString *)v3 isEqualToString:@"ASError"])
  {
    id v4 = @"AS";
  }
  else
  {
    id v4 = v3;
    if (![(__CFString *)v3 isEqualToString:@"MobileAssetError"]) {
      goto LABEL_16;
    }
    id v4 = @"MA";
  }

LABEL_16:
  return v4;
}

- (id)_getJSONDataFromPayload:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v7])
  {
    id v18 = 0;
    id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:&v18];
    id v11 = v18;
    if (!v10)
    {
      BOOL v12 = +[SUCoreDiag sharedDiag];
      uint64_t v13 = (void *)[[NSString alloc] initWithFormat:@"unable to serialize data into JSON [UUID: %@] file: %@", v9, v8];
      if (v11) {
        uint64_t v14 = [v11 code];
      }
      else {
        uint64_t v14 = 8106;
      }
      [v12 trackError:@"[EVENT_REPORTER] DROP" forReason:v13 withResult:v14 withError:v11];
    }
  }
  else
  {
    id v15 = +[SUCoreDiag sharedDiag];
    id v16 = (void *)[[NSString alloc] initWithFormat:@"encountered invalid JSON payload [UUID: %@] file: %@", v9, v8];
    [v15 trackError:@"[EVENT_REPORTER] DROP" forReason:v16 withResult:8107 withError:0];

    id v10 = 0;
  }

  return v10;
}

- (id)_storeJSONData:(id)a3 withFileUUID:(id)a4 forEventUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v11);

  BOOL v12 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v13 = [(SUCoreEventReporter *)self storeToPath];
  uint64_t v14 = [v13 stringByAppendingPathComponent:v9];
  id v15 = [v12 fileURLWithPath:v14];

  if (v15)
  {
    id v25 = 0;
    int v16 = [v8 writeToURL:v15 options:1 error:&v25];
    id v17 = v25;
    id v18 = v17;
    if (!v16 || v17)
    {
      uint64_t v19 = +[SUCoreDiag sharedDiag];
      uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"failed to write JSON data to file [UUID: %@] file: %@", v10, v9];
      if (v18) {
        uint64_t v21 = [v18 code];
      }
      else {
        uint64_t v21 = 8109;
      }
      [v19 trackError:@"[EVENT_REPORTER] DROP" forReason:v20 withResult:v21 withError:v18];

      [(SUCoreEventReporter *)self _removeFileUUID:v9 loggingError:0 forReason:@"failed to write JSON data"];
      id v15 = 0;
    }
  }
  else
  {
    uint64_t v22 = +[SUCoreDiag sharedDiag];
    id v23 = (void *)[[NSString alloc] initWithFormat:@"failed to form JSON data file [UUID: %@] file: %@", v10, v9];
    [v22 trackAnomaly:@"[EVENT_REPORTER] DROP" forReason:v23 withResult:8100 withError:0];

    id v15 = 0;
  }

  return v15;
}

- (BOOL)_storeServerURLMetadata:(id)a3 toFileUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x1E4F1CB10];
  id v10 = [(SUCoreEventReporter *)self storeToPath];
  id v11 = [v10 stringByAppendingPathComponent:v7];
  BOOL v12 = [v9 fileURLWithPath:v11];

  if (!v12)
  {
    uint64_t v14 = +[SUCoreDiag sharedDiag];
    id v15 = (void *)[[NSString alloc] initWithFormat:@"failed to create file: %@ for attaching of serverURL metadata", v7];
    [v14 trackAnomaly:@"[EVENT_REPORTER] DROP" forReason:v15 withResult:8100 withError:0];
    BOOL v13 = 0;
    goto LABEL_5;
  }
  BOOL v13 = +[SUCore setFileMetadata:forKey:value:](SUCore, "setFileMetadata:forKey:value:", [v12 fileSystemRepresentation], @"SUCoreEventReporterServerURL", v6);
  if (!v13)
  {
    uint64_t v14 = +[SUCoreDiag sharedDiag];
    id v15 = (void *)[[NSString alloc] initWithFormat:@"failed to add serverURL metadata to file: %@", v7];
    [v14 trackError:@"[EVENT_REPORTER] DROP" forReason:v15 withResult:8109 withError:0];
LABEL_5:
  }
  return v13;
}

- (void)_removeFileUUID:(id)a3 loggingError:(BOOL)a4 forReason:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(SUCoreEventReporter *)self storeToPath];
  BOOL v12 = [v11 stringByAppendingPathComponent:v8];

  BOOL v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  char v14 = [v13 removeItemAtPath:v12 error:&v19];
  id v15 = v19;

  if ((v14 & 1) == 0 && v6)
  {
    int v16 = +[SUCoreDiag sharedDiag];
    id v17 = (void *)[[NSString alloc] initWithFormat:@"%@ - could not remove event file: %@", v9, v12];
    if (v15) {
      uint64_t v18 = [v15 code];
    }
    else {
      uint64_t v18 = 8110;
    }
    [v16 trackAnomaly:@"[EVENT_REPORTER] REMOVE" forReason:v17 withResult:v18 withError:v15];
  }
  [(SUCoreEventReporter *)self _removeActiveEventForFileUUID:v8];
}

- (void)_incrementActiveSendCount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v5);

  if ([(SUCoreEventReporter *)self activeSendTaskCount] <= 127)
  {
    [(SUCoreEventReporter *)self setActiveSendTaskCount:[(SUCoreEventReporter *)self activeSendTaskCount] + 1];
    BOOL v6 = +[SUCoreLog sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [(SUCoreEventReporter *)self activeSendTaskCount];
      id v9 = [(SUCoreEventReporter *)self awaitingRetry];
      int v10 = 138543874;
      id v11 = v4;
      __int16 v12 = 1024;
      int v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = [v9 count];
      _os_log_impl(&dword_1B4EC2000, v7, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | %{public}@ - activeSendTaskCount:%d, awaitingRetry:%lu", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)_decrementActiveSendCount
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v3);

  if ([(SUCoreEventReporter *)self activeSendTaskCount] >= 1)
  {
    [(SUCoreEventReporter *)self setActiveSendTaskCount:[(SUCoreEventReporter *)self activeSendTaskCount] - 1];
    id v4 = +[SUCoreLog sharedLogger];
    id v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(SUCoreEventReporter *)self activeSendTaskCount];
      id v7 = [(SUCoreEventReporter *)self awaitingRetry];
      v8[0] = 67109376;
      v8[1] = v6;
      __int16 v9 = 2048;
      uint64_t v10 = [v7 count];
      _os_log_impl(&dword_1B4EC2000, v5, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | decrement active - activeSendTaskCount:%d, awaitingRetry:%lu", (uint8_t *)v8, 0x12u);
    }
  }
}

- (void)_checkWhetherIdle:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SUCoreEventReporter *)self splunkStateQueue];
  dispatch_assert_queue_V2(v5);

  if (![(SUCoreEventReporter *)self activeSendTaskCount])
  {
    int v6 = [(SUCoreEventReporter *)self awaitingRetry];
    if ([v6 count])
    {
    }
    else
    {
      __int16 v12 = [(SUCoreEventReporter *)self onceIdleCompletion];

      if (v12)
      {
        int v13 = +[SUCoreLog sharedLogger];
        __int16 v14 = [v13 oslog];

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = [(SUCoreEventReporter *)self activeSendTaskCount];
          uint64_t v16 = [(SUCoreEventReporter *)self awaitingRetry];
          *(_DWORD *)buf = 138543874;
          id v23 = v4;
          __int16 v24 = 1024;
          int v25 = v15;
          __int16 v26 = 2048;
          uint64_t v27 = [v16 count];
          _os_log_impl(&dword_1B4EC2000, v14, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | now idle (%{public}@) - activeSendTaskCount:%d, awaitingRetry:%lu", buf, 0x1Cu);
        }
        id v17 = [(SUCoreEventReporter *)self onceIdleCompletion];
        [(SUCoreEventReporter *)self setOnceIdleCompletion:0];
        uint64_t v18 = +[SUCore sharedCore];
        id v19 = [v18 completionQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__SUCoreEventReporter__checkWhetherIdle___block_invoke;
        block[3] = &unk_1E60B66B0;
        id v21 = v17;
        __int16 v9 = v17;
        dispatch_async(v19, block);

        goto LABEL_11;
      }
    }
  }
  id v7 = [(SUCoreEventReporter *)self onceIdleCompletion];

  if (v7)
  {
    int v8 = +[SUCoreLog sharedLogger];
    __int16 v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(SUCoreEventReporter *)self activeSendTaskCount];
      uint64_t v11 = [(SUCoreEventReporter *)self awaitingRetry];
      *(_DWORD *)buf = 138543874;
      id v23 = v4;
      __int16 v24 = 1024;
      int v25 = v10;
      __int16 v26 = 2048;
      uint64_t v27 = [v11 count];
      _os_log_impl(&dword_1B4EC2000, v9, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] IDLE_TRACK | not idle (%{public}@) - activeSendTaskCount:%d, awaitingRetry:%lu", buf, 0x1Cu);
    }
LABEL_11:
  }
}

uint64_t __41__SUCoreEventReporter__checkWhetherIdle___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleSendFinishedWithFileUUID:(id)a3 sendSucceeded:(BOOL)a4 withStatusCode:(int64_t)a5 withError:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  __int16 v12 = [(SUCoreEventReporter *)self splunkStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SUCoreEventReporter_handleSendFinishedWithFileUUID_sendSucceeded_withStatusCode_withError___block_invoke;
  block[3] = &unk_1E60B66D8;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

uint64_t __93__SUCoreEventReporter_handleSendFinishedWithFileUUID_sendSucceeded_withStatusCode_withError___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _decrementActiveSendCount];
  if (!*(void *)(a1 + 40))
  {
    id v7 = +[SUCoreDiag sharedDiag];
    id v8 = [NSString alloc];
    __int16 v9 = @"succeeded";
    if (!*(unsigned char *)(a1 + 64)) {
      __int16 v9 = @"failed";
    }
    id v10 = (void *)[v8 initWithFormat:@"callback [send %@ (status=%ld)] without file UUID - event file may be left on filesystem", v9, *(void *)(a1 + 56)];
    id v11 = *(void **)(a1 + 48);
    if (v11)
    {
      uint64_t v12 = [v11 code];
      uint64_t v13 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v12 = *(void *)(a1 + 56);
    }
    [v7 trackError:@"[EVENT_REPORTER] SEND_FINISHED" forReason:v10 withResult:v12 withError:v13];

    goto LABEL_35;
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(a1 + 64))
  {
    id v14 = +[SUCoreDiag sharedDiag];
    int v15 = (void *)[[NSString alloc] initWithFormat:@"failed to send event (status=%ld) validated file: %@", *(void *)(a1 + 56), *(void *)(a1 + 40)];
    if (v2)
    {
      uint64_t v16 = [*(id *)(a1 + 48) code];
      uint64_t v17 = *(void *)(a1 + 48);
      int64_t v18 = v14;
      BOOL v19 = v15;
    }
    else
    {
      int64_t v18 = v14;
      BOOL v19 = v15;
      uint64_t v16 = 8202;
      uint64_t v17 = 0;
    }
    [v18 trackError:@"[EVENT_REPORTER] SEND_FINISHED" forReason:v19 withResult:v16 withError:v17];

    id v7 = [*(id *)(a1 + 32) _activeEventForFileUUID:*(void *)(a1 + 40)];
    if ([*(id *)(a1 + 32) dropEventsOnSendFailure])
    {
      uint64_t v28 = +[SUCoreLog sharedLogger];
      int v29 = [v28 oslog];

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *(void *)(a1 + 40);
        __int16 v31 = [v7 summary];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v30;
        __int16 v46 = 2114;
        v47 = v31;
        _os_log_impl(&dword_1B4EC2000, v29, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (dropped) | active:%{public}@", buf, 0x16u);
      }
      uint64_t v32 = *(void **)(a1 + 32);
      uint64_t v33 = *(void *)(a1 + 40);
      v34 = @"dropping on failed send";
    }
    else
    {
      objc_msgSend(v7, "setFailedSendCount:", objc_msgSend(v7, "failedSendCount") + 1);
      uint64_t v35 = [v7 failedSendCount];
      uint8_t v36 = +[SUCoreLog sharedLogger];
      id v37 = [v36 oslog];

      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v35 <= 7)
      {
        if (v38)
        {
          uint64_t v39 = *(void *)(a1 + 40);
          long long v40 = [v7 summary];
          *(_DWORD *)buf = 138543618;
          uint64_t v45 = v39;
          __int16 v46 = 2114;
          v47 = v40;
          _os_log_impl(&dword_1B4EC2000, v37, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (will retry) | active:%{public}@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) _updateActiveEvent:v7 forFileUUID:*(void *)(a1 + 40)];
        [*(id *)(a1 + 32) _awaitRetryingFileUUID:*(void *)(a1 + 40)];
        goto LABEL_35;
      }
      if (v38)
      {
        uint64_t v41 = *(void *)(a1 + 40);
        v42 = [v7 summary];
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v41;
        __int16 v46 = 2114;
        v47 = v42;
        _os_log_impl(&dword_1B4EC2000, v37, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | FAILURE | event for fileUUID:%{public}@ failed to be sent (max retries) | active:%{public}@", buf, 0x16u);
      }
      uint64_t v32 = *(void **)(a1 + 32);
      uint64_t v33 = *(void *)(a1 + 40);
      v34 = @"dropping on failed send (max retries)";
    }
    [v32 _removeFileUUID:v33 loggingError:1 forReason:v34];
    [*(id *)(a1 + 32) _sendFirstAwaitingRetry];
LABEL_35:

    return [*(id *)(a1 + 32) _checkWhetherIdle:@"send finished"];
  }
  if (!v2 && *(void *)(a1 + 56) == 200) {
    goto LABEL_19;
  }
  id v3 = +[SUCoreDiag sharedDiag];
  id v4 = *(void **)(a1 + 48);
  if (v4)
  {
    uint64_t v5 = [v4 code];
    uint64_t v6 = *(void *)(a1 + 48);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = *(void *)(a1 + 56);
  }
  [v3 trackAnomaly:@"[EVENT_REPORTER] SEND_FINISHED" forReason:@"callback where send considered successful yet may not have been [completely sent]" withResult:v5 withError:v6];

  if (*(void *)(a1 + 48))
  {
    uint64_t v20 = +[SUCoreLog sharedLogger];
    id v21 = [v20 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 56);
      id v23 = *(void **)(a1 + 40);
      __int16 v24 = [*(id *)(a1 + 48) checkedDescription];
      *(_DWORD *)buf = 134218498;
      uint64_t v45 = v22;
      __int16 v46 = 2114;
      v47 = v23;
      __int16 v48 = 2114;
      uint64_t v49 = v24;
      _os_log_impl(&dword_1B4EC2000, v21, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | SUCCESS (with error) | sent event (status=%ld) validated file: %{public}@, error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
LABEL_19:
    int v25 = +[SUCoreLog sharedLogger];
    id v21 = [v25 oslog];

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(void *)(a1 + 56);
      uint64_t v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v45 = v26;
      __int16 v46 = 2114;
      v47 = v27;
      _os_log_impl(&dword_1B4EC2000, v21, OS_LOG_TYPE_DEFAULT, "[EVENT_REPORTER] SEND_FINISHED | SUCCESS | sent event (status=%ld) validated file: %{public}@", buf, 0x16u);
    }
  }

  [*(id *)(a1 + 32) _removeFileUUID:*(void *)(a1 + 40) loggingError:1 forReason:@"send finished"];
  [*(id *)(a1 + 32) _sendAllAwaitingRetry];
  return [*(id *)(a1 + 32) _checkWhetherIdle:@"send finished"];
}

- (void)handleSendFinishedInvalidFileUUID:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreEventReporter *)self splunkStateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__SUCoreEventReporter_handleSendFinishedInvalidFileUUID_withError___block_invoke;
  block[3] = &unk_1E60B65E8;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __67__SUCoreEventReporter_handleSendFinishedInvalidFileUUID_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[SUCoreDiag sharedDiag];
  id v3 = (void *)[[NSString alloc] initWithFormat:@"send callback fileUUID invalid (%@) - event file may be left on filesystem", *(void *)(a1 + 32)];
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    uint64_t v5 = [v4 code];
    uint64_t v6 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v5 = 8204;
  }
  [v2 trackError:@"[EVENT_REPORTER] SEND_FINISHED" forReason:v3 withResult:v5 withError:v6];

  [*(id *)(a1 + 48) _decrementActiveSendCount];
  id v7 = *(void **)(a1 + 48);
  return [v7 _checkWhetherIdle:@"send finished with invalid file UUID"];
}

+ (id)_nsURLSessionTaskNameForState:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"NSURLSessionTaskState(%d)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E60B66F8[a3];
  }
  return v3;
}

- (NSMutableArray)awaitingRetry
{
  return self->_awaitingRetry;
}

- (void)setAwaitingRetry:(id)a3
{
}

- (NSURL)splunkURL
{
  return self->_splunkURL;
}

- (void)setSplunkURL:(id)a3
{
}

- (OS_dispatch_queue)splunkStateQueue
{
  return self->_splunkStateQueue;
}

- (NSURLSessionConfiguration)inProcessConfig
{
  return self->_inProcessConfig;
}

- (void)setInProcessConfig:(id)a3
{
}

- (NSOperationQueue)inProcessOperationQueue
{
  return self->_inProcessOperationQueue;
}

- (void)setInProcessOperationQueue:(id)a3
{
}

- (NSURLSession)inProcessSession
{
  return self->_inProcessSession;
}

- (void)setInProcessSession:(id)a3
{
}

- (SUCoreEventReporterDelegate)reporterDelegate
{
  return self->_reporterDelegate;
}

- (void)setReporterDelegate:(id)a3
{
}

- (NSString)storeToPath
{
  return self->_storeToPath;
}

- (void)setStoreToPath:(id)a3
{
}

- (NSString)persistedStatePath
{
  return self->_persistedStatePath;
}

- (void)setPersistedStatePath:(id)a3
{
}

- (int64_t)accessControl
{
  return self->_accessControl;
}

- (void)setAccessControl:(int64_t)a3
{
  self->_accessControl = a3;
}

- (SUCorePersistedState)activeEventsState
{
  return self->_activeEventsState;
}

- (void)setActiveEventsState:(id)a3
{
}

- (SUCoreEvent)lastErrorEvent
{
  return self->_lastErrorEvent;
}

- (void)setLastErrorEvent:(id)a3
{
}

- (BOOL)splunkAccessCreated
{
  return self->_splunkAccessCreated;
}

- (void)setSplunkAccessCreated:(BOOL)a3
{
  self->_splunkAccessCreated = a3;
}

- (BOOL)eventExtensionsDetermined
{
  return self->_eventExtensionsDetermined;
}

- (void)setEventExtensionsDetermined:(BOOL)a3
{
  self->_eventExtensionsDetermined = a3;
}

- (NSMutableDictionary)eventExtensions
{
  return self->_eventExtensions;
}

- (void)setEventExtensions:(id)a3
{
}

- (int)activeSendTaskCount
{
  return self->_activeSendTaskCount;
}

- (void)setActiveSendTaskCount:(int)a3
{
  self->_activeSendTaskCount = a3;
}

- (BOOL)dropEventsOnSendFailure
{
  return self->_dropEventsOnSendFailure;
}

- (void)setDropEventsOnSendFailure:(BOOL)a3
{
  self->_dropEventsOnSendFailure = a3;
}

- (id)onceIdleCompletion
{
  return self->_onceIdleCompletion;
}

- (void)setOnceIdleCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onceIdleCompletion, 0);
  objc_storeStrong((id *)&self->_eventExtensions, 0);
  objc_storeStrong((id *)&self->_lastErrorEvent, 0);
  objc_storeStrong((id *)&self->_activeEventsState, 0);
  objc_storeStrong((id *)&self->_persistedStatePath, 0);
  objc_storeStrong((id *)&self->_storeToPath, 0);
  objc_storeStrong((id *)&self->_reporterDelegate, 0);
  objc_storeStrong((id *)&self->_inProcessSession, 0);
  objc_storeStrong((id *)&self->_inProcessOperationQueue, 0);
  objc_storeStrong((id *)&self->_inProcessConfig, 0);
  objc_storeStrong((id *)&self->_splunkStateQueue, 0);
  objc_storeStrong((id *)&self->_splunkURL, 0);
  objc_storeStrong((id *)&self->_awaitingRetry, 0);
}

void __61__SUCoreEventReporter__synchronizeWithNSURLSessionExpecting___block_invoke_2_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1B4EC2000, log, OS_LOG_TYPE_ERROR, "[EVENT_REPORTER] SYNCHRONIZING | ignoring NSURLSession task without appropriate description", buf, 2u);
}

void __65__SUCoreEventReporter__alignPersistedStateWithExistingFileUUIDs___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4EC2000, log, OS_LOG_TYPE_ERROR, "[EVENT_REPORTER] SYNCHRONIZING | aligning encountered invalid key=value, dropped", v1, 2u);
}

@end