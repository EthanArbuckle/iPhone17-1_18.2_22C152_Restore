@interface ICNAController
+ (BOOL)audioSummaryEnabled;
+ (BOOL)audioTranscriptEnabled;
+ (BOOL)bioAuthEnabled;
+ (BOOL)handwritingAutoRefineEnabled;
+ (BOOL)localNotesEnabled;
+ (BOOL)mathHandwritingEnabled;
+ (BOOL)mathTextEnabled;
+ (NSString)deviceID;
+ (NSString)deviceModel;
+ (NSString)devicePlatform;
+ (NSString)osVersion;
+ (NSString)saltVersion;
+ (NSString)storeFrontID;
+ (NSString)userID;
+ (id)osBundleVersion;
+ (id)privateUserID;
+ (id)sharedController;
+ (int64_t)accountTypeEnumForHTMLAccount:(id)a3;
+ (int64_t)accountTypeEnumForModernAccount:(id)a3;
+ (unint64_t)startMonth;
+ (unint64_t)startYear;
- (AAAppSessionManager)appSessionManager;
- (AAClient)client;
- (AAFlushManager)flushManager;
- (AASessionManager)sessionManager;
- (AAUploadBatchEventConfig)uploadBatchEventConfig;
- (BOOL)killEndSessionBackgroundTaskIfNecessary;
- (BOOL)killEndSessionBackgroundTaskIfNecessaryForWindowScene:(id)a3;
- (ICNAController)init;
- (ICNAControllerAppDelegate)appDelegate;
- (ICNAMultiSceneSessionTracker)multiSceneSessionTracker;
- (ICNAServerEnvironment)serverEnvironment;
- (NSDate)sessionStartDate;
- (NSMutableDictionary)endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier;
- (NSMutableDictionary)sessionForWindowDict;
- (NSMutableDictionary)sessionTrackerForWindowDict;
- (NSNumber)endSessionBackgroundTaskIdentifier;
- (NSString)name;
- (NSString)privateSessionID;
- (NSString)referringApplication;
- (NSString)sharedContainerIdentifier;
- (NSString)startingSessionType;
- (NSURL)referringInboundURL;
- (NSURL)url;
- (OS_dispatch_queue)instrumentationQueue;
- (id)aaTrackerForWindowSceneIdentifier:(id)a3;
- (id)accountTypeSummary;
- (id)appData;
- (id)cellularRadioAccessTechnology;
- (id)createSessionManager;
- (id)debugData;
- (id)deviceData;
- (id)referralData;
- (id)sessionDataWithType:(int64_t)a3 isGlobalSession:(BOOL)a4;
- (id)sessionManagerForWindowSceneIdentifier:(id)a3;
- (id)sessionManagerForWindowSceneIdentifier:(id)a3 shouldCreate:(BOOL)a4;
- (id)sessionTrackerForWindowSceneIdentifier:(id)a3;
- (id)userData;
- (int64_t)deviceOrientationEnum;
- (int64_t)sessionState;
- (void)_immediatelySubmitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4 subTracker:(id)a5;
- (void)_immediatelySubmitEventOfType:(Class)a3 subTracker:(id)a4;
- (void)addReferralDataWithReferringInboundURL:(id)a3 referringApplication:(id)a4;
- (void)addSnapshotReferralDataToSessionLevel;
- (void)appSessionDidTerminate;
- (void)clearSessionForWindowSceneIdentifier:(id)a3;
- (void)dealloc;
- (void)endSessionSynchronously:(BOOL)a3 endReason:(int64_t)a4;
- (void)endSessionSynchronously:(BOOL)a3 forSessionType:(int64_t)a4 endReason:(int64_t)a5;
- (void)endSessionSynchronously:(BOOL)a3 forSessionType:(int64_t)a4 endReason:(int64_t)a5 successHandler:(id)a6;
- (void)endWindowSceneSessionSynchronously:(BOOL)a3 forSessionType:(int64_t)a4 endReason:(int64_t)a5 windowScene:(id)a6;
- (void)endWindowSceneSessionSynchronously:(BOOL)a3 forSessionType:(int64_t)a4 endReason:(int64_t)a5 windowScene:(id)a6 successHandler:(id)a7;
- (void)enterGroupWithSubtracker:(id)a3;
- (void)flushWithCompletionHandler:(id)a3;
- (void)generatePrivateSessionIDIfNecessary;
- (void)leaveGroupWithSubtracker:(id)a3;
- (void)leaveGroupWithSubtracker:(id)a3 completionHandler:(id)a4;
- (void)newAATrackerWithName:(id)a3 completionBlock:(id)a4;
- (void)newAATrackerWithName:(id)a3 parentAATracker:(id)a4 completionBlock:(id)a5;
- (void)newAATrackerWithName:(id)a3 parentTracker:(id)a4 completionBlock:(id)a5;
- (void)orientationDidChange:(id)a3;
- (void)performOnInstrumentationQueueWaitUntilDone:(BOOL)a3 block:(id)a4;
- (void)popDataObjectWithType:(Class)a3;
- (void)popDataObjectWithType:(Class)a3 subTracker:(id)a4;
- (void)popDataObjectsWithTypes:(id)a3;
- (void)popDataObjectsWithTypes:(id)a3 subTracker:(id)a4;
- (void)pushDataObject:(id)a3 unique:(BOOL)a4 onlyOnce:(BOOL)a5 subTracker:(id)a6;
- (void)pushDataObjects:(id)a3 unique:(BOOL)a4 onlyOnce:(BOOL)a5 subTracker:(id)a6;
- (void)pushLongLivedDataObjects:(id)a3;
- (void)pushLongLivedDataObjects:(id)a3 privateSessionIdentifier:(id)a4;
- (void)pushLongLivedOrientationData:(id)a3;
- (void)pushLongLivedPrivateDeviceData:(id)a3;
- (void)pushLongLivedPrivateEventData:(id)a3;
- (void)pushLongLivedPrivateEventData:(id)a3 privateSessionIdentifier:(id)a4;
- (void)pushLongLivedPrivateUserData:(id)a3;
- (void)pushLongLivedSessionSummaryData:(id)a3;
- (void)pushReferralDataToSessionManager:(id)a3;
- (void)pushSessionLevelDataIntoSessionManager:(id)a3 withSessionType:(int64_t)a4;
- (void)pushSessionLevelDataIntoSessionManager:(id)a3 withSessionType:(int64_t)a4 isGlobalSession:(BOOL)a5;
- (void)pushToSessionManager:(id)a3 data:(id)a4 forKey:(id)a5 traits:(id)a6;
- (void)pushToSessionManager:(id)a3 endReason:(int64_t)a4;
- (void)pushUniqueDataObject:(id)a3 tracker:(id)a4;
- (void)removePreSydneyDAnalyticsData;
- (void)setAppDelegate:(id)a3;
- (void)setAppSessionManager:(id)a3;
- (void)setClient:(id)a3;
- (void)setDeviceOrientationEnum:(int64_t)a3;
- (void)setEndSessionBackgroundTaskIdentifier:(id)a3;
- (void)setEndSessionBackgroundTaskIdentifiersByWindowSceneIdentifier:(id)a3;
- (void)setFlushManager:(id)a3;
- (void)setInstrumentationQueue:(id)a3;
- (void)setMultiSceneSessionTracker:(id)a3;
- (void)setPrivateSessionID:(id)a3;
- (void)setReferringApplication:(id)a3;
- (void)setReferringInboundURL:(id)a3;
- (void)setServerEnvironment:(id)a3;
- (void)setSessionForWindowDict:(id)a3;
- (void)setSessionManager:(id)a3;
- (void)setSessionStartDate:(id)a3;
- (void)setSessionState:(int64_t)a3;
- (void)setSessionTrackerForWindowDict:(id)a3;
- (void)setStartingSessionType:(id)a3;
- (void)setUploadBatchEventConfig:(id)a3;
- (void)startAppSession;
- (void)startSessionWithReferralURL:(id)a3 referralApplication:(id)a4;
- (void)startSessionWithReferralURL:(id)a3 referralApplication:(id)a4 startingSessionType:(int64_t)a5;
- (void)startSessionWithType:(int64_t)a3;
- (void)startWindowSceneSessionWithType:(int64_t)a3 windowScene:(id)a4 successHandler:(id)a5;
- (void)submitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4;
- (void)submitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4 subTracker:(id)a5;
- (void)submitEventOfType:(Class)a3 subTracker:(id)a4;
- (void)submitEventOfType:(Class)a3 subTracker:(id)a4 synchronousTaskBeforeSubmitting:(id)a5;
- (void)trackTimedEventType:(Class)a3 subTracker:(id)a4;
- (void)trackTimedEventType:(Class)a3 subTracker:(id)a4 synchronousTaskBeforeStarting:(id)a5;
@end

@implementation ICNAController

+ (id)sharedController
{
  if (s_onceToken_4 != -1) {
    dispatch_once(&s_onceToken_4, &__block_literal_global_8);
  }
  v2 = (void *)sharedController_s_instance_0;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_multiSceneSessionTracker, 0);
  objc_storeStrong((id *)&self->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_endSessionBackgroundTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_instrumentationQueue, 0);
  objc_storeStrong((id *)&self->_serverEnvironment, 0);
  objc_storeStrong((id *)&self->_sessionTrackerForWindowDict, 0);
  objc_storeStrong((id *)&self->_sessionForWindowDict, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_uploadBatchEventConfig, 0);
  objc_storeStrong((id *)&self->_flushManager, 0);
  objc_storeStrong((id *)&self->_appSessionManager, 0);
  objc_storeStrong((id *)&self->_privateSessionID, 0);
  objc_storeStrong((id *)&self->_startingSessionType, 0);
  objc_storeStrong((id *)&self->_referringApplication, 0);
  objc_storeStrong((id *)&self->_referringInboundURL, 0);
  objc_destroyWeak((id *)&self->_appDelegate);
}

uint64_t __34__ICNAController_sharedController__block_invoke()
{
  sharedController_s_instance_0 = objc_alloc_init(ICNAController);
  return MEMORY[0x1F41817F8]();
}

- (ICNAController)init
{
  v36.receiver = self;
  v36.super_class = (Class)ICNAController;
  v2 = [(ICNAOptedInObject *)&v36 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("ICNAController.instrumentationQueue", v3, v4);
    instrumentationQueue = v2->_instrumentationQueue;
    v2->_instrumentationQueue = (OS_dispatch_queue *)v5;

    v7 = [MEMORY[0x1E4F4AC08] shared];
    if (+[ICNAOptedInObject isOptedInForAnalytics]) {
      [v7 allow];
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F4ABA8]) initWithTrackingConsent:v7];
    appSessionManager = v2->_appSessionManager;
    v2->_appSessionManager = (AAAppSessionManager *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F4ABB0]);
    v11 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v12 = [v10 initWithBundle:v11];
    client = v2->_client;
    v2->_client = (AAClient *)v12;

    v14 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    uint64_t v15 = [v14 BOOLForKey:@"analyticsEnableBatchDebugging"];

    v16 = [MEMORY[0x1E4F4AC10] default];
    uint64_t v17 = [v16 withDebuggingEnabled:v15];
    uploadBatchEventConfig = v2->_uploadBatchEventConfig;
    v2->_uploadBatchEventConfig = (AAUploadBatchEventConfig *)v17;

    v19 = objc_alloc_init(ICNAServerEnvironment);
    serverEnvironment = v2->_serverEnvironment;
    v2->_serverEnvironment = v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F4ABD0]) initWithAppSessionManager:v2->_appSessionManager client:v2->_client endpoint:v2 config:v2->_uploadBatchEventConfig];
    flushManager = v2->_flushManager;
    v2->_flushManager = (AAFlushManager *)v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionForWindowDict = v2->_sessionForWindowDict;
    v2->_sessionForWindowDict = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionTrackerForWindowDict = v2->_sessionTrackerForWindowDict;
    v2->_sessionTrackerForWindowDict = v25;

    uint64_t v27 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F43740]];
    endSessionBackgroundTaskIdentifier = v2->_endSessionBackgroundTaskIdentifier;
    v2->_endSessionBackgroundTaskIdentifier = (NSNumber *)v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier = v2->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier;
    v2->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier = v29;

    objc_storeStrong((id *)&v2->_privateSessionID, @"session_inactive");
    v2->_sessionState = 0;
    v31 = objc_alloc_init(ICNAMultiSceneSessionTracker);
    multiSceneSessionTracker = v2->_multiSceneSessionTracker;
    v2->_multiSceneSessionTracker = v31;

    v2->_deviceOrientationEnum = 0;
    performBlockOnMainThreadAndWait();
    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v2 selector:sel_orientationDidChange_ name:*MEMORY[0x1E4F437D8] object:0];

    id v34 = +[ICNAInlineDrawingRecognitionReporter sharedReporter];
    [(ICNAController *)v2 removePreSydneyDAnalyticsData];
    [(ICNAController *)v2 flushWithCompletionHandler:&__block_literal_global_83];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICNAController;
  [(ICNAController *)&v4 dealloc];
}

- (void)startSessionWithReferralURL:(id)a3 referralApplication:(id)a4
{
}

- (void)startSessionWithReferralURL:(id)a3 referralApplication:(id)a4 startingSessionType:(int64_t)a5
{
  id v14 = a3;
  uint64_t v8 = (__CFString *)a4;
  v9 = v8;
  if (v8)
  {
    id v10 = [(__CFString *)v8 lowercaseString];
    char v11 = [v10 hasPrefix:@"com.apple."];

    if ((v11 & 1) == 0)
    {

      v9 = @"other";
    }
  }
  uint64_t v12 = [(ICNAController *)self referringApplication];

  if (!v12) {
    [(ICNAController *)self setReferringApplication:v9];
  }
  v13 = [(ICNAController *)self referringInboundURL];

  if (!v13) {
    [(ICNAController *)self setReferringInboundURL:v14];
  }
  [(ICNAController *)self startSessionWithType:a5];
}

void __22__ICNAController_init__block_invoke()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  [v0 beginGeneratingDeviceOrientationNotifications];
}

void __22__ICNAController_init__block_invoke_2()
{
  id v0 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1C3EAD000, v0, OS_LOG_TYPE_INFO, "Completed flush of analytics data", v1, 2u);
  }
}

- (void)generatePrivateSessionIDIfNecessary
{
  uint64_t v3 = [(ICNAController *)self privateSessionID];
  if (!v3
    || (objc_super v4 = (void *)v3,
        [(ICNAController *)self privateSessionID],
        dispatch_queue_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [@"session_inactive" isEqualToString:v5],
        v5,
        v4,
        v6))
  {
    id v8 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v8 UUIDString];
    [(ICNAController *)self setPrivateSessionID:v7];
  }
}

- (void)startAppSession
{
  [(ICNAController *)self generatePrivateSessionIDIfNecessary];
  uint64_t v3 = [(ICNAController *)self instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__ICNAController_startAppSession__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_async(v3, block);
}

void __33__ICNAController_startAppSession__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appSessionManager];
  char v3 = objc_opt_respondsToSelector();

  objc_super v4 = [*(id *)(a1 + 32) appSessionManager];
  dispatch_queue_t v5 = v4;
  if (v3) {
    [v4 startAppSessionWithShouldCorrelateSceneSessions:0];
  }
  else {
    [v4 startAppSession];
  }

  int v6 = [*(id *)(a1 + 32) createSessionManager];
  [*(id *)(a1 + 32) setSessionManager:v6];

  [*(id *)(a1 + 32) orientationDidChange:0];
  v7 = *(void **)(a1 + 32);
  id v9 = [v7 sessionManager];
  id v8 = [v9 tracker];
  [v7 pushLongLivedDataObjects:v8];
}

- (void)appSessionDidTerminate
{
  char v3 = [(ICNAController *)self instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ICNAController_appSessionDidTerminate__block_invoke;
  block[3] = &unk_1E64B8A48;
  block[4] = self;
  dispatch_async(v3, block);
}

void __40__ICNAController_appSessionDidTerminate__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  char v3 = [v2 sessionManager];
  [v2 pushToSessionManager:v3 endReason:3];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v4 = objc_msgSend(*(id *)(a1 + 32), "sessionForWindowDict", 0);
  dispatch_queue_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) pushToSessionManager:*(void *)(*((void *)&v11 + 1) + 8 * i) endReason:3];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  id v10 = [*(id *)(a1 + 32) appSessionManager];
  [v10 appSessionDidTerminate];
}

- (id)sessionManagerForWindowSceneIdentifier:(id)a3 shouldCreate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(ICNAController *)v7 sessionForWindowDict];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9 && v4)
  {
    id v9 = [(ICNAController *)v7 createSessionManager];
    id v10 = [(ICNAController *)v7 sessionForWindowDict];
    [v10 setObject:v9 forKeyedSubscript:v6];
  }
  objc_sync_exit(v7);

  return v9;
}

- (id)sessionManagerForWindowSceneIdentifier:(id)a3
{
  return [(ICNAController *)self sessionManagerForWindowSceneIdentifier:a3 shouldCreate:0];
}

- (id)sessionTrackerForWindowSceneIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(ICNAController *)v5 sessionTrackerForWindowDict];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    uint64_t v7 = objc_alloc_init(ICNAMultiSceneSessionTracker);
    uint64_t v8 = [(ICNAController *)v5 sessionTrackerForWindowDict];
    [v8 setObject:v7 forKeyedSubscript:v4];
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)clearSessionForWindowSceneIdentifier:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  dispatch_queue_t v5 = [(ICNAController *)v4 sessionForWindowDict];
  [v5 setObject:0 forKeyedSubscript:v7];

  id v6 = [(ICNAController *)v4 sessionTrackerForWindowDict];
  [v6 setObject:0 forKeyedSubscript:v7];

  objc_sync_exit(v4);
}

- (id)aaTrackerForWindowSceneIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_queue_t v5 = self;
    objc_sync_enter(v5);
    id v6 = [(ICNAController *)v5 sessionManagerForWindowSceneIdentifier:v4];
    id v7 = [v6 tracker];

    objc_sync_exit(v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)createSessionManager
{
  char v3 = [(ICNAController *)self appSessionManager];
  id v4 = [v3 createSessionManager];

  dispatch_queue_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F4ABD8]) initWithFormat:2];
  id v6 = [v4 processorManager];
  [v6 addEventProcessor:v5];

  id v7 = objc_alloc(MEMORY[0x1E4F4AC18]);
  uint64_t v8 = [(ICNAController *)self client];
  id v9 = [(ICNAController *)self uploadBatchEventConfig];
  id v10 = (void *)[v7 initWithClient:v8 endpoint:self config:v9];

  long long v11 = [v4 processorManager];
  [v11 addEventProcessor:v10];

  return v4;
}

- (void)startSessionWithType:(int64_t)a3
{
  [(ICNAController *)self generatePrivateSessionIDIfNecessary];
  dispatch_queue_t v5 = [(ICNAController *)self instrumentationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__ICNAController_startSessionWithType___block_invoke;
  v6[3] = &unk_1E64B9A50;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __39__ICNAController_startSessionWithType___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) multiSceneSessionTracker];
  int v3 = [v2 isInvalidated];

  if (v3)
  {
    id v4 = objc_alloc_init(ICNAMultiSceneSessionTracker);
    [*(id *)(a1 + 32) setMultiSceneSessionTracker:v4];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  switch(v5)
  {
    case 1:
      id v6 = [*(id *)(a1 + 32) multiSceneSessionTracker];
      [v6 startPaperSession];
      goto LABEL_8;
    case 4:
      goto LABEL_12;
    case 2:
      id v6 = [*(id *)(a1 + 32) multiSceneSessionTracker];
      [v6 startNotesSession];
LABEL_8:

      goto LABEL_12;
  }
  id v7 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __39__ICNAController_startSessionWithType___block_invoke_cold_1();
  }

LABEL_12:
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [v8 sessionManager];
  id v10 = [v9 tracker];
  [v8 pushLongLivedPrivateEventData:v10];

  if ([*(id *)(a1 + 32) sessionState] == 1)
  {
    long long v11 = [*(id *)(a1 + 32) referringInboundURL];
    if (v11)
    {
    }
    else
    {
      v26 = [*(id *)(a1 + 32) referringApplication];

      if (!v26)
      {
LABEL_20:
        uint64_t v17 = os_log_create("com.apple.notes", "Analytics");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v29 = [*(id *)(a1 + 32) multiSceneSessionTracker];
          v30 = [v29 sessionDetailDescription];
          *(_DWORD *)buf = 138412290;
          v33 = v30;
          _os_log_impl(&dword_1C3EAD000, v17, OS_LOG_TYPE_INFO, "Not Starting AA Session as it already exists. Session Type Detail: %@", buf, 0xCu);
        }
        uint64_t v15 = v17;
        goto LABEL_23;
      }
    }
    uint64_t v27 = *(void **)(a1 + 32);
    v28 = [v27 sessionManager];
    [v27 pushReferralDataToSessionManager:v28];

    goto LABEL_20;
  }
  long long v12 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    long long v13 = [*(id *)(a1 + 32) multiSceneSessionTracker];
    long long v14 = [v13 sessionDetailDescription];
    *(_DWORD *)buf = 138412290;
    v33 = v14;
    _os_log_impl(&dword_1C3EAD000, v12, OS_LOG_TYPE_INFO, "Really Starting AA Session. Session Type Detail: %@", buf, 0xCu);
  }
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [MEMORY[0x1E4F4AC00] default];
  uint64_t v17 = [v16 withEnabled:1];

  v18 = [*(id *)(a1 + 32) sessionManager];
  v19 = [MEMORY[0x1E4F29128] UUID];
  v20 = [v19 UUIDString];
  [v18 startSessionForKind:0 withName:0 identifier:v20 startDate:v15 timestampJitter:v17];

  [*(id *)(a1 + 32) setSessionState:1];
  [*(id *)(a1 + 32) setSessionStartDate:v15];
  uint64_t v21 = [*(id *)(a1 + 32) sessionManager];
  v22 = [v21 tracker];

  [v22 submitEventType:objc_opt_class()];
  [v22 timeEventType:objc_opt_class()];
  v23 = +[ICNAIdentityManager sharedManager];
  [v23 loadIdentifiersAndRegenerateIfNecessary];

  v24 = [*(id *)(a1 + 32) instrumentationQueue];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __39__ICNAController_startSessionWithType___block_invoke_98;
  v31[3] = &unk_1E64B9A50;
  uint64_t v25 = *(void *)(a1 + 40);
  v31[4] = *(void *)(a1 + 32);
  v31[5] = v25;
  dispatch_async(v24, v31);

LABEL_23:
}

void __39__ICNAController_startSessionWithType___block_invoke_98(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 sessionManager];
  [v2 pushSessionLevelDataIntoSessionManager:v3 withSessionType:*(void *)(a1 + 40) isGlobalSession:1];
}

- (void)startWindowSceneSessionWithType:(int64_t)a3 windowScene:(id)a4 successHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 session];
  long long v11 = [v10 persistentIdentifier];

  long long v12 = [(ICNAController *)self instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke;
  block[3] = &unk_1E64B9AA0;
  block[4] = self;
  id v17 = v11;
  id v19 = v9;
  int64_t v20 = a3;
  id v18 = v8;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  dispatch_async(v12, block);
}

void __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3EAD000, v2, OS_LOG_TYPE_INFO, "Really Starting AA Window Session.", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];

  id v6 = [MEMORY[0x1E4F29128] UUID];
  id v7 = [v6 UUIDString];

  id v8 = [MEMORY[0x1E4F4AC00] default];
  id v9 = [v8 withEnabled:1];

  id v10 = [*(id *)(a1 + 32) sessionManagerForWindowSceneIdentifier:*(void *)(a1 + 40) shouldCreate:1];
  [v10 startSessionForKind:0 withName:0 identifier:v5 startDate:v3 timestampJitter:v9];
  long long v11 = [*(id *)(a1 + 32) sessionTrackerForWindowSceneIdentifier:*(void *)(a1 + 40)];
  long long v12 = v11;
  uint64_t v13 = *(void *)(a1 + 64);
  if (v13 == 1)
  {
    [v11 startPaperSession];
  }
  else if (v13 == 2)
  {
    [v11 startNotesSession];
  }
  id v14 = [v10 tracker];
  [*(id *)(a1 + 32) pushLongLivedDataObjects:v14 privateSessionIdentifier:v7];
  [v14 submitEventType:objc_opt_class()];
  [v14 timeEventType:objc_opt_class()];
  id v15 = +[ICNAIdentityManager sharedManager];
  [v15 loadIdentifiersAndRegenerateIfNecessary];

  uint64_t v16 = [*(id *)(a1 + 32) instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_101;
  block[3] = &unk_1E64B9A78;
  block[4] = *(void *)(a1 + 32);
  id v17 = v10;
  uint64_t v18 = *(void *)(a1 + 64);
  id v30 = v17;
  uint64_t v31 = v18;
  dispatch_async(v16, block);

  id v19 = [*(id *)(a1 + 32) appDelegate];

  if (v19)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_2;
    v26 = &unk_1E64B8A70;
    uint64_t v27 = *(void *)(a1 + 32);
    id v28 = *(id *)(a1 + 48);
    performBlockOnMainThread();
  }
  int64_t v20 = [*(id *)(a1 + 32) instrumentationQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_3;
  v21[3] = &unk_1E64B91A0;
  id v22 = *(id *)(a1 + 56);
  dispatch_async(v20, v21);
}

uint64_t __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_101(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushSessionLevelDataIntoSessionManager:*(void *)(a1 + 40) withSessionType:*(void *)(a1 + 48)];
}

void __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appDelegate];
  [v2 sessionDidStartForWindowScene:*(void *)(a1 + 40)];
}

uint64_t __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)sessionState
{
  id v2 = self;
  objc_sync_enter(v2);
  int64_t sessionState = v2->_sessionState;
  objc_sync_exit(v2);

  return sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  [(ICNAController *)self assertInstrumentationQueue];
  obj = self;
  objc_sync_enter(obj);
  uint64_t v5 = obj;
  uint64_t sessionState = obj->_sessionState;
  if (sessionState != a3)
  {
    if (a3 < 1 || sessionState)
    {
      if (a3 || sessionState < 1) {
        goto LABEL_9;
      }
      [(ICNAController *)obj setPrivateSessionID:@"session_inactive"];
      id v7 = [(ICNAController *)obj sessionManager];
      id v8 = [v7 tracker];
      [(ICNAController *)obj pushLongLivedPrivateEventData:v8];
    }
    else
    {
      [(ICNAController *)obj generatePrivateSessionIDIfNecessary];
      id v7 = [(ICNAController *)obj sessionManager];
      id v8 = [v7 tracker];
      [(ICNAController *)obj pushLongLivedPrivateEventData:v8];
    }

    uint64_t v5 = obj;
LABEL_9:
    v5->_uint64_t sessionState = a3;
  }
  objc_sync_exit(v5);
}

- (BOOL)killEndSessionBackgroundTaskIfNecessary
{
  id v3 = [(ICNAController *)self appDelegate];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICNAController *)self endSessionBackgroundTaskIdentifier];
  objc_sync_enter(v4);
  uint64_t v5 = [(ICNAController *)self endSessionBackgroundTaskIdentifier];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = *MEMORY[0x1E4F43740];
  id v8 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F43740]];
  [(ICNAController *)self setEndSessionBackgroundTaskIdentifier:v8];

  objc_sync_exit(v4);
  if (v6 == v7) {
    return 0;
  }
  id v10 = [(ICNAController *)self appDelegate];
  [v10 endBackgroundTask:v6];

  return 1;
}

- (BOOL)killEndSessionBackgroundTaskIfNecessaryForWindowScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNAController *)self appDelegate];

  if (v5)
  {
    uint64_t v6 = [v4 session];
    uint64_t v7 = [v6 persistentIdentifier];

    id v8 = [(ICNAController *)self endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier];
    objc_sync_enter(v8);
    id v9 = [(ICNAController *)self endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier];
    id v10 = [v9 objectForKeyedSubscript:v7];
    uint64_t v11 = [v10 unsignedIntegerValue];

    uint64_t v12 = *MEMORY[0x1E4F43740];
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:*MEMORY[0x1E4F43740]];
    id v14 = [(ICNAController *)self endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier];
    [v14 setObject:v13 forKeyedSubscript:v7];

    objc_sync_exit(v8);
    BOOL v15 = v11 != v12;
    if (v11 != v12)
    {
      uint64_t v16 = [(ICNAController *)self appDelegate];
      [v16 endBackgroundTask:v11];
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)performOnInstrumentationQueueWaitUntilDone:(BOOL)a3 block:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(ICNAController *)self instrumentationQueue];
  id v8 = v7;
  if (v4) {
    dispatch_sync(v7, v6);
  }
  else {
    dispatch_async(v7, v6);
  }
}

- (void)endSessionSynchronously:(BOOL)a3 endReason:(int64_t)a4
{
}

- (void)endSessionSynchronously:(BOOL)a3 forSessionType:(int64_t)a4 endReason:(int64_t)a5
{
  BOOL v6 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke;
  v18[3] = &unk_1E64B9B18;
  BOOL v19 = a3;
  v18[4] = self;
  v18[5] = a5;
  id v8 = (void (**)(void))MEMORY[0x1C877ECD0](v18, a2);
  if (v6)
  {
    id v9 = [(ICNAController *)self multiSceneSessionTracker];
    [v9 endAllSessionsAndInvalidate];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_117;
    v17[3] = &unk_1E64B8A48;
    v17[4] = self;
    [(ICNAController *)self performOnInstrumentationQueueWaitUntilDone:1 block:v17];
    id v10 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [(ICNAController *)self multiSceneSessionTracker];
      uint64_t v12 = [v11 sessionDetailDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1C3EAD000, v10, OS_LOG_TYPE_INFO, "Synchronously ending AA Session. Session Type Detail: %@", buf, 0xCu);
    }
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    uint64_t v13 = [(ICNAController *)self instrumentationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_118;
    block[3] = &unk_1E64B9B40;
    int64_t v16 = a4;
    block[4] = self;
    BOOL v15 = v8;
    dispatch_async(v13, block);
  }
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(a1 + 32) appDelegate];

  if (v2)
  {
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_2;
    uint64_t v13 = &unk_1E64B8D48;
    objc_copyWeak(&v14, &location);
    performBlockOnMainThreadAndWait();
    objc_destroyWeak(&v14);
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICNASessionWillEndNotification" object:*(void *)(a1 + 32)];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"ICNASessionFlushTimedDataNotification" object:*(void *)(a1 + 32)];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_105;
  v7[3] = &unk_1E64B9AF0;
  v7[4] = v5;
  objc_copyWeak(v8, &location);
  char v9 = *(unsigned char *)(a1 + 48);
  v8[1] = *(id *)(a1 + 40);
  [v5 performOnInstrumentationQueueWaitUntilDone:v6 block:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained endSessionBackgroundTaskIdentifier];
    objc_sync_enter(v3);
    BOOL v4 = [v2 appDelegate];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_3;
    v7[3] = &unk_1E64B8A48;
    v7[4] = v2;
    uint64_t v5 = [v4 beginBackgroundTaskWithName:@"Finish end analytics session operation" expirationHandler:v7];

    uint64_t v6 = [NSNumber numberWithUnsignedInteger:v5];
    [v2 setEndSessionBackgroundTaskIdentifier:v6];

    objc_sync_exit(v3);
  }
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) killEndSessionBackgroundTaskIfNecessary])
  {
    v1 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_3_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_105(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 sessionManager];
  uint64_t v4 = [v3 tracker];
  [v2 pushLongLivedSessionSummaryData:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained sessionState])
    {
      [v6 setSessionState:2];
      uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v8 = [*(id *)(a1 + 32) sessionStartDate];
      if (v8)
      {
        char v9 = (void *)v8;
        uint64_t v10 = [*(id *)(a1 + 32) sessionStartDate];
        [v7 timeIntervalSinceDate:v10];
        double v12 = v11;

        if (v12 > 12000.0)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F28C00]);
          [v13 setZeroFormattingBehavior:1];
          [v13 setAllowedUnits:240];
          [v13 setUnitsStyle:1];
          id v14 = [v13 stringFromTimeInterval:v12];
          BOOL v15 = os_log_create("com.apple.notes", "Analytics");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_105_cold_1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);
          }
        }
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_107;
      v31[3] = &unk_1E64B9AC8;
      char v32 = *(unsigned char *)(a1 + 56);
      v31[4] = *(void *)(a1 + 32);
      v31[5] = v6;
      uint64_t v22 = (void (**)(void))MEMORY[0x1C877ECD0](v31);
      uint64_t v23 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        if (*(unsigned char *)(a1 + 56)) {
          uint64_t v24 = @"YES";
        }
        else {
          uint64_t v24 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v24;
        _os_log_impl(&dword_1C3EAD000, v23, OS_LOG_TYPE_INFO, "Triggering endSessionWithCompletion. isSync: %@", buf, 0xCu);
      }

      uint64_t v25 = *(void **)(a1 + 32);
      v26 = [v6 sessionManager];
      [v25 pushToSessionManager:v26 endReason:*(void *)(a1 + 48)];

      if (*(unsigned char *)(a1 + 56)
        && ([v6 sessionManager],
            uint64_t v27 = objc_claimAutoreleasedReturnValue(),
            char v28 = objc_opt_respondsToSelector(),
            v27,
            (v28 & 1) != 0))
      {
        v29 = [v6 sessionManager];
        [v29 endSync];

        v22[2](v22);
      }
      else
      {
        id v30 = [v6 sessionManager];
        [v30 endSessionWithCompletion:v22];
      }
    }
    else
    {
      [v6 killEndSessionBackgroundTaskIfNecessary];
    }
  }
}

uint64_t __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_107(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v3 = @"YES";
    }
    else {
      uint64_t v3 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1C3EAD000, v2, OS_LOG_TYPE_INFO, "Completed endSessionWithCompletion. isSync: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_114;
  v6[3] = &unk_1E64B8A48;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[4] = *(void *)(a1 + 40);
  return [v4 performOnInstrumentationQueueWaitUntilDone:0 block:v6];
}

uint64_t __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_114(uint64_t a1)
{
  if ([*(id *)(a1 + 32) sessionState] == 2) {
    [*(id *)(a1 + 32) setSessionState:0];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 killEndSessionBackgroundTaskIfNecessary];
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_117(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [v1 sessionManager];
  uint64_t v2 = [v3 tracker];
  [v1 pushLongLivedSessionSummaryData:v2];
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_118(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  switch(v2)
  {
    case 1:
      id v3 = [*(id *)(a1 + 32) multiSceneSessionTracker];
      [v3 endPaperSession];
      goto LABEL_6;
    case 4:
      goto LABEL_10;
    case 2:
      id v3 = [*(id *)(a1 + 32) multiSceneSessionTracker];
      [v3 endNotesSession];
LABEL_6:

      goto LABEL_10;
  }
  uint64_t v4 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_118_cold_1();
  }

LABEL_10:
  uint64_t v5 = [*(id *)(a1 + 32) multiSceneSessionTracker];
  char v6 = [v5 hasLiveTimers];

  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) multiSceneSessionTracker];
      uint64_t v9 = [v8 sessionDetailDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1C3EAD000, v7, OS_LOG_TYPE_INFO, "Not ending AA Session asynchronously. Session Type Detail: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) multiSceneSessionTracker];
    [v10 endAllSessionsAndInvalidate];

    double v11 = *(void **)(a1 + 32);
    double v12 = [v11 sessionManager];
    id v13 = [v12 tracker];
    [v11 pushLongLivedSessionSummaryData:v13];

    id v14 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = [*(id *)(a1 + 32) multiSceneSessionTracker];
      uint64_t v16 = [v15 sessionDetailDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v16;
      _os_log_impl(&dword_1C3EAD000, v14, OS_LOG_TYPE_INFO, "Ending AA Session asynchronously. Session Type Detail: %@", buf, 0xCu);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_119;
    block[3] = &unk_1E64B91A0;
    uint64_t v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v7 = v18;
  }
}

uint64_t __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_119(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)endSessionSynchronously:(BOOL)a3 forSessionType:(int64_t)a4 endReason:(int64_t)a5 successHandler:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  [(ICNAController *)self endSessionSynchronously:v8 forSessionType:a4 endReason:a5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__ICNAController_endSessionSynchronously_forSessionType_endReason_successHandler___block_invoke;
  v12[3] = &unk_1E64B91A0;
  id v13 = v10;
  id v11 = v10;
  [(ICNAController *)self performOnInstrumentationQueueWaitUntilDone:v8 block:v12];
}

uint64_t __82__ICNAController_endSessionSynchronously_forSessionType_endReason_successHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)endWindowSceneSessionSynchronously:(BOOL)a3 forSessionType:(int64_t)a4 endReason:(int64_t)a5 windowScene:(id)a6
{
  BOOL v7 = a3;
  id v9 = a6;
  id v10 = [v9 session];
  id v11 = [v10 persistentIdentifier];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke;
  v18[3] = &unk_1E64B9BE0;
  v18[4] = self;
  id v12 = v9;
  id v19 = v12;
  id v13 = v11;
  BOOL v22 = v7;
  id v20 = v13;
  int64_t v21 = a5;
  id v14 = (void (**)(void))MEMORY[0x1C877ECD0](v18);
  BOOL v15 = v14;
  if (v7)
  {
    if (v14) {
      v14[2](v14);
    }
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_126;
    v16[3] = &unk_1E64B91A0;
    uint64_t v17 = v14;
    dispatch_async(MEMORY[0x1E4F14428], v16);
  }
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [*(id *)(a1 + 32) appDelegate];

  if (v2)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_2;
    uint64_t v17 = &unk_1E64B9B68;
    objc_copyWeak(&v20, &location);
    id v18 = *(id *)(a1 + 40);
    id v19 = *(id *)(a1 + 48);
    performBlockOnMainThreadAndWait();

    objc_destroyWeak(&v20);
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"ICNASessionWillEndNotification" object:*(void *)(a1 + 40)];

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"ICNASessionFlushTimedDataNotification" object:*(void *)(a1 + 40)];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_123;
  v9[3] = &unk_1E64B9BB8;
  objc_copyWeak(v12, &location);
  id v7 = *(id *)(a1 + 48);
  BOOL v8 = *(void **)(a1 + 56);
  id v10 = v7;
  v12[1] = v8;
  char v13 = *(unsigned char *)(a1 + 64);
  id v11 = *(id *)(a1 + 40);
  [v5 performOnInstrumentationQueueWaitUntilDone:v6 block:v9];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier];
    objc_sync_enter(v4);
    uint64_t v5 = [v3 appDelegate];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_3;
    id v12 = &unk_1E64B8A70;
    char v13 = v3;
    id v14 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 beginBackgroundTaskWithName:@"Finish end analytics window scene session operation" expirationHandler:&v9];

    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v6, v9, v10, v11, v12, v13);
    BOOL v8 = [v3 endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier];
    [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];

    objc_sync_exit(v4);
  }
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) killEndSessionBackgroundTaskIfNecessaryForWindowScene:*(void *)(a1 + 40)])
  {
    v1 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_3_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_123(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained sessionManagerForWindowSceneIdentifier:*(void *)(a1 + 32)];
    uint64_t v5 = [v3 sessionTrackerForWindowSceneIdentifier:*(void *)(a1 + 32)];
    [v5 endAllSessionsAndInvalidate];
    uint64_t v6 = [v5 sessionSummaryData];
    uint64_t v7 = [v4 tracker];
    [v3 pushUniqueDataObject:v6 tracker:v7];

    [v3 pushToSessionManager:v4 endReason:*(void *)(a1 + 56)];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    char v13 = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_2_124;
    id v14 = &unk_1E64B9B90;
    char v18 = *(unsigned char *)(a1 + 64);
    uint64_t v15 = v3;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    uint64_t v8 = (void (**)(void))MEMORY[0x1C877ECD0](&v11);
    uint64_t v9 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 64)) {
        uint64_t v10 = @"YES";
      }
      else {
        uint64_t v10 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      id v20 = v10;
      _os_log_impl(&dword_1C3EAD000, v9, OS_LOG_TYPE_INFO, "Triggering endSessionWithCompletion. isSync: %@", buf, 0xCu);
    }

    if (*(unsigned char *)(a1 + 64))
    {
      objc_msgSend(v4, "endSession", v11, v12, v13, v14, v15, v16);
      if (v8) {
        v8[2](v8);
      }
    }
    else
    {
      objc_msgSend(v4, "endSessionWithCompletion:", v8, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_2_124(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v3 = @"YES";
    }
    else {
      uint64_t v3 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1C3EAD000, v2, OS_LOG_TYPE_INFO, "Completed endSessionWithCompletion. isSync: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) clearSessionForWindowSceneIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) killEndSessionBackgroundTaskIfNecessaryForWindowScene:*(void *)(a1 + 48)];
  id v4 = *(id *)(a1 + 48);
  dispatchMainAfterDelay();
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_125(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ICNASessionDidEndNotification" object:*(void *)(a1 + 32)];
}

uint64_t __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_126(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)endWindowSceneSessionSynchronously:(BOOL)a3 forSessionType:(int64_t)a4 endReason:(int64_t)a5 windowScene:(id)a6 successHandler:(id)a7
{
  BOOL v10 = a3;
  id v12 = a7;
  [(ICNAController *)self endWindowSceneSessionSynchronously:v10 forSessionType:a4 endReason:a5 windowScene:a6];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __105__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene_successHandler___block_invoke;
  v14[3] = &unk_1E64B91A0;
  id v15 = v12;
  id v13 = v12;
  [(ICNAController *)self performOnInstrumentationQueueWaitUntilDone:v10 block:v14];
}

uint64_t __105__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene_successHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pushLongLivedDataObjects:(id)a3
{
}

- (void)pushLongLivedDataObjects:(id)a3 privateSessionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICNAController *)self assertInstrumentationQueue];
  [(ICNAController *)self pushLongLivedPrivateUserData:v7];
  [(ICNAController *)self pushLongLivedPrivateDeviceData:v7];
  [(ICNAController *)self pushLongLivedPrivateEventData:v7 privateSessionIdentifier:v6];

  [(ICNAController *)self pushLongLivedOrientationData:v7];
}

- (void)pushUniqueDataObject:(id)a3 tracker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ICNAController *)self assertInstrumentationQueue];
  id v8 = objc_alloc_init(MEMORY[0x1E4F4ABB8]);
  [v8 setUnique:1];
  [v6 pushDataEvent:v7 traits:v8 file:@"/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m" line:958];
}

- (void)pushLongLivedOrientationData:(id)a3
{
  id v4 = a3;
  [(ICNAController *)self assertInstrumentationQueue];
  id v7 = [[ICASDeviceOrientation alloc] initWithDeviceOrientation:[(ICNAController *)self deviceOrientationEnum]];
  uint64_t v5 = [[ICASInterfaceOrientation alloc] initWithInterfaceOrientation:0];
  id v6 = [[ICASOrientationData alloc] initWithDeviceOrientation:v7 interfaceOrientation:v5];
  [(ICNAController *)self pushUniqueDataObject:v6 tracker:v4];
}

- (void)pushLongLivedSessionSummaryData:(id)a3
{
  id v4 = a3;
  [(ICNAController *)self assertInstrumentationQueue];
  id v6 = [(ICNAController *)self multiSceneSessionTracker];
  uint64_t v5 = [v6 sessionSummaryData];
  [(ICNAController *)self pushUniqueDataObject:v5 tracker:v4];
}

- (void)pushLongLivedPrivateUserData:(id)a3
{
  id v4 = a3;
  [(ICNAController *)self assertInstrumentationQueue];
  uint64_t v5 = [ICASPrivateUserData alloc];
  id v6 = [(id)objc_opt_class() privateUserID];
  id v7 = [(id)objc_opt_class() saltVersion];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "startMonth"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "startYear"));
  char v18 = [(ICASPrivateUserData *)v5 initWithPrivateUserID:v6 saltVersion:v7 userStartMonth:v8 userStartYear:v9];

  [(ICNAController *)self pushUniqueDataObject:v18 tracker:v4];
  BOOL v10 = +[ICNAIdentityManager sharedManager];
  uint64_t v11 = [(id)objc_opt_class() privateUserID];
  id v12 = [v10 saltedID:v11 forClass:objc_opt_class()];

  id v13 = [[ICASSyncHealthPrivateUserData alloc] initWithSyncHealthPrivateUserID:v12];
  [(ICNAController *)self pushUniqueDataObject:v13 tracker:v4];
  id v14 = +[ICNAIdentityManager sharedManager];
  id v15 = [(id)objc_opt_class() privateUserID];
  id v16 = [v14 saltedID:v15 forClass:objc_opt_class()];

  id v17 = [[ICASSnapshotHealthPrivateUserData alloc] initWithSnapshotHealthPrivateUserID:v16];
  [(ICNAController *)self pushUniqueDataObject:v17 tracker:v4];
}

- (void)pushLongLivedPrivateDeviceData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ICNAIdentityManager sharedManager];
  id v6 = [(id)objc_opt_class() deviceID];
  id v12 = [v5 saltedID:v6 forClass:objc_opt_class()];

  id v7 = [[ICASSyncHealthPrivateDeviceData alloc] initWithSyncHealthPrivateDeviceID:v12];
  [(ICNAController *)self pushUniqueDataObject:v7 tracker:v4];
  id v8 = +[ICNAIdentityManager sharedManager];
  uint64_t v9 = [(id)objc_opt_class() deviceID];
  BOOL v10 = [v8 saltedID:v9 forClass:objc_opt_class()];

  uint64_t v11 = [[ICASSnapshotHealthPrivateDeviceData alloc] initWithSnapshotHealthPrivateDeviceID:v10];
  [(ICNAController *)self pushUniqueDataObject:v11 tracker:v4];
}

- (void)pushLongLivedPrivateEventData:(id)a3
{
}

- (void)pushLongLivedPrivateEventData:(id)a3 privateSessionIdentifier:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  [(ICNAController *)self assertInstrumentationQueue];
  if (!v17)
  {
    id v17 = [(ICNAController *)self privateSessionID];
  }
  id v7 = [ICASSessionDetailType alloc];
  id v8 = [(ICNAController *)self multiSceneSessionTracker];
  uint64_t v9 = -[ICASSessionDetailType initWithSessionDetailType:](v7, "initWithSessionDetailType:", [v8 sessionDetailType]);

  BOOL v10 = [[ICASPrivateEventData alloc] initWithPrivateSessionID:v17 sessionDetailType:v9];
  [(ICNAController *)self pushUniqueDataObject:v10 tracker:v6];
  uint64_t v11 = +[ICNAIdentityManager sharedManager];
  id v12 = [v11 saltedID:v17 forClass:objc_opt_class()];

  id v13 = [[ICASSyncHealthPrivateEventData alloc] initWithSyncHealthPrivateSessionID:v12];
  [(ICNAController *)self pushUniqueDataObject:v13 tracker:v6];
  id v14 = +[ICNAIdentityManager sharedManager];
  id v15 = [v14 saltedID:v17 forClass:objc_opt_class()];

  id v16 = [[ICASSnapshotHealthPrivateEventData alloc] initWithSnapshotHealthPrivateSessionID:v15];
  [(ICNAController *)self pushUniqueDataObject:v16 tracker:v6];
}

- (void)orientationDidChange:(id)a3
{
}

void __39__ICNAController_orientationDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDeviceOrientationEnum:0];
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  unint64_t v3 = [v2 orientation];

  if (v3 <= 6) {
    [*(id *)(a1 + 32) setDeviceOrientationEnum:v3];
  }
  id v4 = [*(id *)(a1 + 32) instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__ICNAController_orientationDidChange___block_invoke_2;
  block[3] = &unk_1E64B8A48;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v4, block);
}

void __39__ICNAController_orientationDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = [v2 sessionManager];
  id v4 = [v3 tracker];
  [v2 pushLongLivedOrientationData:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "sessionForWindowDict", 0);
  id v6 = [v5 allValues];
  id v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(a1 + 32);
        id v13 = [*(id *)(*((void *)&v14 + 1) + 8 * i) tracker];
        [v12 pushLongLivedOrientationData:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (NSURL)url
{
  id v2 = [(ICNAController *)self serverEnvironment];
  unint64_t v3 = [v2 targetURL];

  return (NSURL *)v3;
}

- (NSString)name
{
  id v2 = [(ICNAController *)self serverEnvironment];
  unint64_t v3 = [v2 aaEndPointTypeName];

  return (NSString *)v3;
}

- (NSString)sharedContainerIdentifier
{
  return (NSString *)MEMORY[0x1F4139C78](self, a2);
}

- (void)addSnapshotReferralDataToSessionLevel
{
  id v3 = [MEMORY[0x1E4F83290] referralURLForSnapshotBackgroundTask];
  [(ICNAController *)self addReferralDataWithReferringInboundURL:v3 referringApplication:0];
}

- (void)addReferralDataWithReferringInboundURL:(id)a3 referringApplication:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(__CFString *)v7 lowercaseString];
    char v10 = [v9 hasPrefix:@"com.apple."];

    if ((v10 & 1) == 0)
    {

      uint64_t v8 = @"other";
    }
  }
  uint64_t v11 = [(ICNAController *)self instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__ICNAController_addReferralDataWithReferringInboundURL_referringApplication___block_invoke;
  block[3] = &unk_1E64B9C08;
  void block[4] = self;
  id v15 = v6;
  long long v16 = v8;
  id v12 = v8;
  id v13 = v6;
  dispatch_async(v11, block);
}

void __78__ICNAController_addReferralDataWithReferringInboundURL_referringApplication___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) referringInboundURL];

  if (!v2) {
    [*(id *)(a1 + 32) setReferringInboundURL:*(void *)(a1 + 40)];
  }
  id v3 = [*(id *)(a1 + 32) referringApplication];

  if (!v3) {
    [*(id *)(a1 + 32) setReferringApplication:*(void *)(a1 + 48)];
  }
  id v4 = [*(id *)(a1 + 32) referringInboundURL];
  if (v4)
  {
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) referringApplication];

    if (!v5) {
      return;
    }
  }
  id v6 = *(void **)(a1 + 32);
  id v7 = [v6 sessionManager];
  [v6 pushReferralDataToSessionManager:v7];
}

- (void)pushReferralDataToSessionManager:(id)a3
{
  id v6 = a3;
  [(ICNAController *)self assertInstrumentationQueue];
  id v4 = [(ICNAController *)self referralData];
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F4ABB8]);
    [v5 setOnlyOnce:1];
    [v5 setUnique:1];
    [(ICNAController *)self pushToSessionManager:v6 data:v4 forKey:@"referralData" traits:v5];
  }
}

- (void)pushSessionLevelDataIntoSessionManager:(id)a3 withSessionType:(int64_t)a4
{
}

- (void)pushSessionLevelDataIntoSessionManager:(id)a3 withSessionType:(int64_t)a4 isGlobalSession:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  [(ICNAController *)self assertInstrumentationQueue];
  uint64_t v8 = [(ICNAController *)self sessionDataWithType:a4 isGlobalSession:v5];
  [(ICNAController *)self pushToSessionManager:v13 data:v8 forKey:@"sessionData" traits:0];
  uint64_t v9 = [(ICNAController *)self appData];
  [(ICNAController *)self pushToSessionManager:v13 data:v9 forKey:@"appData" traits:0];
  char v10 = [(ICNAController *)self deviceData];
  [(ICNAController *)self pushToSessionManager:v13 data:v10 forKey:@"deviceData" traits:0];
  uint64_t v11 = [(ICNAController *)self userData];
  [(ICNAController *)self pushToSessionManager:v13 data:v11 forKey:@"userData" traits:0];
  [(ICNAController *)self pushReferralDataToSessionManager:v13];
  id v12 = [(ICNAController *)self debugData];
  if (v12) {
    [(ICNAController *)self pushToSessionManager:v13 data:v12 forKey:@"debugData" traits:0];
  }
}

- (void)pushToSessionManager:(id)a3 endReason:(int64_t)a4
{
  id v5 = a3;
  uint64_t v8 = [[ICASEndReason alloc] initWithEndReason:a4];
  id v6 = [[ICASSessionEndData alloc] initWithEndReason:v8];
  id v7 = [v5 tracker];

  [v7 pushDataEvent:v6 traits:0 file:@"/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m" line:1176];
}

- (void)pushToSessionManager:(id)a3 data:(id)a4 forKey:(id)a5 traits:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [(ICNAController *)self assertInstrumentationQueue];
  if (v10 && v11)
  {
    id v13 = v12;
    if (!v13) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F4ABB8]);
    }
    long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F4ABE0]) initWithKey:v11 data:v10];
    [v15 pushSessionData:v14 traits:v13];
  }
}

- (id)userData
{
  [(ICNAController *)self assertInstrumentationQueue];
  id v2 = [(id)objc_opt_class() storeFrontID];
  id v3 = [(id)objc_opt_class() userID];
  id v4 = [ICASUserData alloc];
  id v5 = [(id)objc_opt_class() saltVersion];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "startMonth"));
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "startYear"));
  uint64_t v8 = [(ICASUserData *)v4 initWithUserID:v3 userStorefrontID:v2 saltVersion:v5 userStartMonth:v6 userStartYear:v7];

  return v8;
}

- (id)sessionDataWithType:(int64_t)a3 isGlobalSession:(BOOL)a4
{
  BOOL v4 = a4;
  [(ICNAController *)self assertInstrumentationQueue];
  id v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v9 = [v7 secondsFromGMTForDate:v8];

  v29 = [NSNumber numberWithInteger:v9];
  id v10 = [MEMORY[0x1E4F1CA20] currentLocale];
  char v28 = [v10 countryCode];

  id v11 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v27 = [v11 languageCode];

  id v12 = [MEMORY[0x1E4F28B50] mainBundle];
  v26 = [v12 bundleIdentifier];

  id v13 = +[ICNAIdentityManager sharedManager];
  uint64_t v14 = [v13 identifierResetOccurred];

  if (v14)
  {
    id v15 = +[ICNAIdentityManager sharedManager];
    [v15 setIdentifierResetOccurred:0];
  }
  uint64_t v23 = [[ICASSessionType alloc] initWithSessionType:a3];
  uint64_t v25 = [(ICNAController *)self cellularRadioAccessTechnology];
  long long v16 = [ICASSessionData alloc];
  long long v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_opt_class(), "bioAuthEnabled"));
  char v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_opt_class(), "localNotesEnabled"));
  uint64_t v19 = [(ICNAController *)self accountTypeSummary];
  id v20 = [NSNumber numberWithBool:v14];
  uint64_t v21 = [NSNumber numberWithBool:v4];
  uint64_t v24 = [(ICASSessionData *)v16 initWithUtcOffset:v29 countryCode:v28 languageCode:v27 productType:v26 cellularRadioAccessTechnology:v25 bioAuthEnabled:v17 localNotesEnabled:v18 accountTypeSummary:v19 sessionType:v23 isSaltRegenerated:v20 isGlobalSession:v21];

  return v24;
}

- (id)accountTypeSummary
{
  [(ICNAController *)self assertInstrumentationQueue];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4;
  uint64_t v34 = __Block_byref_object_dispose__4;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__4;
  v28[4] = __Block_byref_object_dispose__4;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = [MEMORY[0x1E4F83428] sharedContext];
  BOOL v4 = [v3 workerManagedObjectContext];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __36__ICNAController_accountTypeSummary__block_invoke;
  v23[3] = &unk_1E64B9C30;
  id v5 = v4;
  id v24 = v5;
  uint64_t v25 = self;
  v26 = &v30;
  uint64_t v27 = v28;
  [v5 performBlockAndWait:v23];
  id v6 = ICNewLegacyContext();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__ICNAController_accountTypeSummary__block_invoke_2;
  v18[3] = &unk_1E64B9C30;
  id v7 = v6;
  id v19 = v7;
  id v20 = self;
  uint64_t v21 = &v30;
  BOOL v22 = v28;
  [v7 performBlockAndWait:v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__4;
  long long v16 = __Block_byref_object_dispose__4;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = (void *)v31[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__ICNAController_accountTypeSummary__block_invoke_3;
  v11[3] = &unk_1E64B9C58;
  v11[4] = v28;
  v11[5] = &v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  return v9;
}

void __36__ICNAController_accountTypeSummary__block_invoke(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C877EAC0]();
  [MEMORY[0x1E4F83278] allAccountsInContext:a1[4]];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v6 didChooseToMigrate])
        {
          uint64_t v7 = [(id)objc_opt_class() accountTypeEnumForModernAccount:v6];
          uint64_t v8 = *(void **)(*(void *)(a1[6] + 8) + 40);
          id v9 = [NSNumber numberWithInteger:v7];
          id v10 = [v8 objectForKeyedSubscript:v9];
          uint64_t v11 = [v10 unsignedIntegerValue];

          uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11 + 1];
          id v13 = *(void **)(*(void *)(a1[6] + 8) + 40);
          uint64_t v14 = [NSNumber numberWithInteger:v7];
          [v13 setObject:v12 forKeyedSubscript:v14];

          id v15 = *(void **)(*(void *)(a1[7] + 8) + 40);
          long long v16 = [NSNumber numberWithInteger:v7];
          id v17 = [v15 objectForKeyedSubscript:v16];
          uint64_t v18 = [v17 unsignedIntegerValue];

          id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "visibleNotesCount") + v18);
          id v20 = *(void **)(*(void *)(a1[7] + 8) + 40);
          uint64_t v21 = [NSNumber numberWithInteger:v7];
          [v20 setObject:v19 forKeyedSubscript:v21];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v3);
  }
}

void __36__ICNAController_accountTypeSummary__block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1C877EAC0]();
  uint64_t v2 = [*(id *)(a1 + 32) allAccounts];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    long long v24 = v2;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v7 isDeleted] & 1) == 0 && (objc_msgSend(v7, "didChooseToMigrate") & 1) == 0)
        {
          uint64_t v8 = [(id)objc_opt_class() accountTypeEnumForHTMLAccount:v7];
          id v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          id v10 = [NSNumber numberWithInteger:v8];
          uint64_t v11 = [v9 objectForKeyedSubscript:v10];
          uint64_t v12 = [v11 unsignedIntegerValue];

          id v13 = [NSNumber numberWithUnsignedInteger:v12 + 1];
          uint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          id v15 = [NSNumber numberWithInteger:v8];
          [v14 setObject:v13 forKeyedSubscript:v15];

          long long v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          id v17 = [NSNumber numberWithInteger:v8];
          uint64_t v18 = [v16 objectForKeyedSubscript:v17];
          uint64_t v19 = [v18 unsignedIntegerValue];

          id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "countOfVisibleNotesForAccount:", v7) + v19);
          uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
          BOOL v22 = [NSNumber numberWithInteger:v8];
          [v21 setObject:v20 forKeyedSubscript:v22];

          uint64_t v2 = v24;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }
}

void __36__ICNAController_accountTypeSummary__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 unsignedIntegerValue];

  id v10 = [ICASAccountTypeItemData alloc];
  uint64_t v11 = [ICASAccountType alloc];
  uint64_t v12 = [v7 integerValue];

  id v13 = [(ICASAccountType *)v11 initWithAccountType:v12];
  uint64_t v14 = NSNumber;
  uint64_t v15 = [v6 integerValue];

  long long v16 = [v14 numberWithInteger:ICNARoundTo2SigFigsInt(v15)];
  id v17 = [NSNumber numberWithInteger:ICNARoundTo2SigFigsInt(v9)];
  uint64_t v18 = [(ICASAccountTypeItemData *)v10 initWithAccountType:v13 countOfAccounts:v16 countOfNotes:v17];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v18];
}

+ (int64_t)accountTypeEnumForModernAccount:(id)a3
{
  id v3 = a3;
  if ([v3 accountType] == 3)
  {
    int64_t v4 = 10;
  }
  else if ([v3 accountType] == 1)
  {
    int64_t v4 = 1;
  }
  else
  {
    int64_t v4 = 12;
  }

  return v4;
}

+ (int64_t)accountTypeEnumForHTMLAccount:(id)a3
{
  id v3 = a3;
  if ([v3 didChooseToMigrate])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isIMAPAccount])
  {
    uint64_t v5 = [MEMORY[0x1E4F836D8] sharedInstance];
    id v6 = [v5 accountStore];

    id v7 = [v3 accountIdentifier];
    uint64_t v8 = [v6 accountWithIdentifier:v7];

    uint64_t v9 = [v8 parentAccount];
    id v10 = v9;
    if (!v9) {
      uint64_t v9 = v8;
    }
    uint64_t v11 = [v9 accountType];
    uint64_t v12 = [v11 identifier];

    if ([v12 isEqualToString:*MEMORY[0x1E4F177C0]])
    {
      int64_t v4 = 5;
    }
    else if ([v12 isEqualToString:*MEMORY[0x1E4F17878]])
    {
      int64_t v4 = 6;
    }
    else if ([v12 isEqualToString:*MEMORY[0x1E4F17740]])
    {
      int64_t v4 = 7;
    }
    else if ([v12 isEqualToString:*MEMORY[0x1E4F17798]])
    {
      int64_t v4 = 8;
    }
    else if ([v12 isEqualToString:*MEMORY[0x1E4F17750]])
    {
      int64_t v4 = 2;
    }
    else
    {
      int64_t v4 = 4;
    }
  }
  else if ([v3 isExchangeAccount])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isLocalAccount])
  {
    int64_t v4 = 11;
  }
  else
  {
    int64_t v4 = 13;
  }

  return v4;
}

- (id)cellularRadioAccessTechnology
{
  uint64_t v2 = [MEMORY[0x1E4F837B0] reachabilityForInternetConnection];
  unint64_t v3 = [v2 currentReachabilityStatus];
  if (v3 > 2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1C3F183D8[v3];
  }
  uint64_t v5 = [[ICASCellularRadioAccessTechnology alloc] initWithCellularRadioAccessTechnology:v4];

  return v5;
}

- (id)appData
{
  [(ICNAController *)self assertInstrumentationQueue];
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  unint64_t v3 = [v2 infoDictionary];
  uint64_t v4 = [v3 objectForKey:@"CFBundleShortVersionString"];

  uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 infoDictionary];
  id v7 = [v6 objectForKey:@"CFBundleVersion"];

  uint64_t v8 = [[ICASAppData alloc] initWithAppVersion:v4 appBuild:v7];
  return v8;
}

- (id)deviceData
{
  [(ICNAController *)self assertInstrumentationQueue];
  if ([MEMORY[0x1E4F837F8] isInternalInstall]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }
  unint64_t v3 = [[ICASOsInstallVariant alloc] initWithOsInstallVariant:v2];
  uint64_t v4 = [ICASDeviceData alloc];
  uint64_t v5 = [(id)objc_opt_class() deviceModel];
  id v6 = [(id)objc_opt_class() devicePlatform];
  id v7 = [(id)objc_opt_class() osVersion];
  uint64_t v8 = [(id)objc_opt_class() osBundleVersion];
  uint64_t v9 = [(ICASDeviceData *)v4 initWithDeviceModel:v5 devicePlatform:v6 osInstallVariant:v3 osVersion:v7 osBundleVersion:v8];

  return v9;
}

- (id)debugData
{
  [(ICNAController *)self assertInstrumentationQueue];
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unint64_t v3 = [v2 stringForKey:@"analyticsDebugDataName"];

  if (v3) {
    uint64_t v4 = [[ICASDebugData alloc] initWithName:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)referralData
{
  [(ICNAController *)self assertInstrumentationQueue];
  unint64_t v3 = [(ICNAController *)self referringInboundURL];
  if (v3)
  {
  }
  else
  {
    uint64_t v4 = [(ICNAController *)self referringApplication];

    if (!v4) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = [(ICNAController *)self referringInboundURL];
  id v6 = +[ICNAReferringInboundURLFilter filterReferringInboundURL:v5];

  id v7 = [ICASReferralData alloc];
  uint64_t v8 = [(ICNAController *)self referringApplication];
  uint64_t v4 = [(ICASReferralData *)v7 initWithReferringApplication:v8 referringInboundUrl:v6];

  [(ICNAController *)self setReferringApplication:0];
  [(ICNAController *)self setReferringInboundURL:0];

LABEL_5:
  return v4;
}

- (void)newAATrackerWithName:(id)a3 completionBlock:(id)a4
{
}

- (void)newAATrackerWithName:(id)a3 parentTracker:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 aaTracker];
  [(ICNAController *)self newAATrackerWithName:v9 parentAATracker:v10 completionBlock:v8];
}

- (void)newAATrackerWithName:(id)a3 parentAATracker:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = [(ICNAController *)self sessionManager];
    id v11 = [v12 tracker];
  }
  long long v16 = v11;
  id v17 = v8;
  uint64_t v18 = v10;
  id v13 = v10;
  id v14 = v8;
  id v15 = v11;
  performBlockOnMainThreadAndWait();
}

uint64_t __71__ICNAController_newAATrackerWithName_parentAATracker_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) chainWithName:*(void *)(a1 + 40)];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

- (void)trackTimedEventType:(Class)a3 subTracker:(id)a4
{
}

- (void)trackTimedEventType:(Class)a3 subTracker:(id)a4 synchronousTaskBeforeStarting:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICNAController *)self instrumentationQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__ICNAController_trackTimedEventType_subTracker_synchronousTaskBeforeStarting___block_invoke;
  v13[3] = &unk_1E64B9CA8;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  Class v17 = a3;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __79__ICNAController_trackTimedEventType_subTracker_synchronousTaskBeforeStarting___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  unint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = [v3 aaTracker];
    if (v4)
    {
LABEL_5:
      [v4 timeEventType:objc_opt_class()];
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) sessionManager];
    uint64_t v4 = [v5 tracker];

    if (v4) {
      goto LABEL_5;
    }
  }
  id v6 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __79__ICNAController_trackTimedEventType_subTracker_synchronousTaskBeforeStarting___block_invoke_cold_1();
  }

LABEL_10:
}

- (void)pushDataObject:(id)a3 unique:(BOOL)a4 onlyOnce:(BOOL)a5 subTracker:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(ICNAController *)self instrumentationQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__ICNAController_pushDataObject_unique_onlyOnce_subTracker___block_invoke;
  v15[3] = &unk_1E64B9CD0;
  id v16 = v11;
  Class v17 = self;
  BOOL v19 = a4;
  BOOL v20 = a5;
  id v18 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, v15);
}

void __60__ICNAController_pushDataObject_unique_onlyOnce_subTracker___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unint64_t v3 = [v2 aaTracker];
    if (v3) {
      goto LABEL_3;
    }
LABEL_7:
    uint64_t v4 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__ICNAController_pushDataObject_unique_onlyOnce_subTracker___block_invoke_cold_1();
    }
    goto LABEL_9;
  }
  uint64_t v5 = [*(id *)(a1 + 40) sessionManager];
  unint64_t v3 = [v5 tracker];

  if (!v3) {
    goto LABEL_7;
  }
LABEL_3:
  if (!*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57))
  {
    [v3 pushDataEvent:*(void *)(a1 + 48) traits:0 file:@"/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m" line:1479];
    goto LABEL_10;
  }
  uint64_t v4 = objc_alloc_init(MEMORY[0x1E4F4ABB8]);
  [v4 setUnique:*(unsigned __int8 *)(a1 + 56)];
  [v4 setOnlyOnce:*(unsigned __int8 *)(a1 + 57)];
  [v3 pushDataEvent:*(void *)(a1 + 48) traits:v4 file:@"/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m" line:1476];
LABEL_9:

LABEL_10:
}

- (void)pushDataObjects:(id)a3 unique:(BOOL)a4 onlyOnce:(BOOL)a5 subTracker:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(ICNAController *)self instrumentationQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__ICNAController_pushDataObjects_unique_onlyOnce_subTracker___block_invoke;
  v15[3] = &unk_1E64B9CD0;
  id v16 = v11;
  Class v17 = self;
  BOOL v19 = a4;
  BOOL v20 = a5;
  id v18 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(v12, v15);
}

void __61__ICNAController_pushDataObjects_unique_onlyOnce_subTracker___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unint64_t v3 = [v2 aaTracker];
    if (v3)
    {
LABEL_3:
      if (*(unsigned char *)(a1 + 56) || *(unsigned char *)(a1 + 57))
      {
        os_log_t v4 = (os_log_t)objc_alloc_init(MEMORY[0x1E4F4ABB8]);
        [v4 setUnique:*(unsigned __int8 *)(a1 + 56)];
        [v4 setOnlyOnce:*(unsigned __int8 *)(a1 + 57)];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v5 = *(id *)(a1 + 48);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v20 != v8) {
                objc_enumerationMutation(v5);
              }
              [v3 pushDataEvent:*(void *)(*((void *)&v19 + 1) + 8 * i) traits:v4 file:@"/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m" line:1498];
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
          }
          while (v7);
        }
      }
      else
      {
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        os_log_t v4 = (os_log_t)*(id *)(a1 + 48);
        uint64_t v11 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v4);
              }
              objc_msgSend(v3, "pushDataEvent:traits:file:line:", *(void *)(*((void *)&v15 + 1) + 8 * j), 0, @"/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m", 1503, (void)v15);
            }
            uint64_t v12 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) sessionManager];
    unint64_t v3 = [v10 tracker];

    if (v3) {
      goto LABEL_3;
    }
  }
  os_log_t v4 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__ICNAController_pushDataObjects_unique_onlyOnce_subTracker___block_invoke_cold_1();
  }
LABEL_16:
}

- (void)popDataObjectWithType:(Class)a3
{
}

- (void)popDataObjectWithType:(Class)a3 subTracker:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ICNAController *)self instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ICNAController_popDataObjectWithType_subTracker___block_invoke;
  block[3] = &unk_1E64B9CF8;
  id v10 = v6;
  uint64_t v11 = self;
  Class v12 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __51__ICNAController_popDataObjectWithType_subTracker___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unint64_t v3 = [v2 aaTracker];
    if (v3)
    {
LABEL_3:
      [v3 popDataEventType:objc_opt_class()];
      goto LABEL_8;
    }
  }
  else
  {
    os_log_t v4 = [*(id *)(a1 + 40) sessionManager];
    unint64_t v3 = [v4 tracker];

    if (v3) {
      goto LABEL_3;
    }
  }
  id v5 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __51__ICNAController_popDataObjectWithType_subTracker___block_invoke_cold_1();
  }

LABEL_8:
}

- (void)popDataObjectsWithTypes:(id)a3
{
}

- (void)popDataObjectsWithTypes:(id)a3 subTracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICNAController *)self instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__ICNAController_popDataObjectsWithTypes_subTracker___block_invoke;
  block[3] = &unk_1E64B9C08;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __53__ICNAController_popDataObjectsWithTypes_subTracker___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    unint64_t v3 = [v2 aaTracker];
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) sessionManager];
    unint64_t v3 = [v9 tracker];

    if (v3)
    {
LABEL_3:
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      os_log_t v4 = (os_log_t)*(id *)(a1 + 48);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            objc_msgSend(v3, "popDataEventType:", objc_opt_class(), v10);
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
      goto LABEL_14;
    }
  }
  os_log_t v4 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__ICNAController_popDataObjectsWithTypes_subTracker___block_invoke_cold_1();
  }
LABEL_14:
}

- (void)submitEventOfType:(Class)a3 subTracker:(id)a4
{
}

- (void)submitEventOfType:(Class)a3 subTracker:(id)a4 synchronousTaskBeforeSubmitting:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v10 = [(ICNAController *)self instrumentationQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__ICNAController_submitEventOfType_subTracker_synchronousTaskBeforeSubmitting___block_invoke;
  v13[3] = &unk_1E64B9D20;
  id v15 = v9;
  Class v16 = a3;
  void v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __79__ICNAController_submitEventOfType_subTracker_synchronousTaskBeforeSubmitting___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  if (v2 && !(*(unsigned int (**)(void))(v2 + 16))())
  {
    uint64_t v6 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __79__ICNAController_submitEventOfType_subTracker_synchronousTaskBeforeSubmitting___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v3 = a1[7];
    os_log_t v4 = (void *)a1[4];
    uint64_t v5 = a1[5];
    [v4 _immediatelySubmitEventOfType:v3 subTracker:v5];
  }
}

- (void)_immediatelySubmitEventOfType:(Class)a3 subTracker:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 aaTracker];
    if (v8)
    {
LABEL_3:
      [v8 submitEventType:objc_opt_class()];
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = [(ICNAController *)self sessionManager];
    id v8 = [v9 tracker];

    if (v8) {
      goto LABEL_3;
    }
  }
  long long v10 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[ICNAController _immediatelySubmitEventOfType:subTracker:]((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
  }

LABEL_8:
}

- (void)submitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4
{
}

- (void)submitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4 subTracker:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v10 = [(ICNAController *)self instrumentationQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__ICNAController_submitEventOfType_pushThenPopDataObjects_subTracker___block_invoke;
  v13[3] = &unk_1E64B9D48;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  Class v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __70__ICNAController_submitEventOfType_pushThenPopDataObjects_subTracker___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _immediatelySubmitEventOfType:*(void *)(a1 + 56) pushThenPopDataObjects:*(void *)(a1 + 40) subTracker:*(void *)(a1 + 48)];
}

- (void)_immediatelySubmitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4 subTracker:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v10 = v9;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__4;
  uint64_t v25 = __Block_byref_object_dispose__4;
  if (v9)
  {
    id v26 = [v9 aaTracker];
  }
  else
  {
    id v11 = [(ICNAController *)self sessionManager];
    id v26 = [v11 tracker];
  }
  if (v22[5])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __82__ICNAController__immediatelySubmitEventOfType_pushThenPopDataObjects_subTracker___block_invoke;
    v20[3] = &unk_1E64B9D70;
    v20[4] = &v21;
    [v8 enumerateObjectsUsingBlock:v20];
    [(id)v22[5] submitEventType:objc_opt_class()];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__ICNAController__immediatelySubmitEventOfType_pushThenPopDataObjects_subTracker___block_invoke_2;
    v19[3] = &unk_1E64B9D70;
    v19[4] = &v21;
    [v8 enumerateObjectsWithOptions:2 usingBlock:v19];
  }
  else
  {
    id v12 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ICNAController _immediatelySubmitEventOfType:pushThenPopDataObjects:subTracker:]((uint64_t)a3, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __82__ICNAController__immediatelySubmitEventOfType_pushThenPopDataObjects_subTracker___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) pushDataEvent:a2 traits:0 file:@"/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m" line:1602];
}

uint64_t __82__ICNAController__immediatelySubmitEventOfType_pushThenPopDataObjects_subTracker___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_opt_class();
  uint64_t v2 = objc_opt_class();
  return [v1 popDataEventType:v2];
}

- (void)enterGroupWithSubtracker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICNAController *)self instrumentationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ICNAController_enterGroupWithSubtracker___block_invoke;
  block[3] = &unk_1E64B8A48;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __43__ICNAController_enterGroupWithSubtracker___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) aaTracker];
  [v1 enterGroup];
}

- (void)leaveGroupWithSubtracker:(id)a3
{
}

- (void)leaveGroupWithSubtracker:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICNAController *)self instrumentationQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__ICNAController_leaveGroupWithSubtracker_completionHandler___block_invoke;
  v11[3] = &unk_1E64B91C8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

uint64_t __61__ICNAController_leaveGroupWithSubtracker_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) aaTracker];
  [v2 leaveGroup];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)removePreSydneyDAnalyticsData
{
  uint64_t v2 = [(ICNAController *)self instrumentationQueue];
  dispatch_async(v2, &__block_literal_global_182);
}

void __47__ICNAController_removePreSydneyDAnalyticsData__block_invoke()
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v0 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  char v1 = [v0 BOOLForKey:@"analyticsRemovedPreviousVersionData"];

  if ((v1 & 1) == 0)
  {
    uint64_t v2 = [MEMORY[0x1E4F837A0] applicationDataContainerURL];
    uint64_t v3 = [v2 URLByAppendingPathComponent:@"Documents" isDirectory:1];
    if (v3)
    {
      objc_super v36 = v2;
      id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v42 = *MEMORY[0x1E4F1C628];
      v60[0] = *MEMORY[0x1E4F1C628];
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
      id v35 = v3;
      id v6 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v5 options:5 errorHandler:0];

      long long v53 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v50 = 0u;
      os_log_t v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v50 objects:v59 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v51;
        uint64_t v37 = *(void *)v51;
        v38 = v7;
        do
        {
          uint64_t v11 = 0;
          uint64_t v39 = v9;
          do
          {
            if (*(void *)v51 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
            id v13 = [v12 lastPathComponent];
            id v49 = 0;
            [v12 getResourceValue:&v49 forKey:v42 error:0];
            id v43 = v49;
            if ([v43 BOOLValue]
              && [v13 hasPrefix:@"com.apple.app-analytics."]
              && (([v13 hasSuffix:@".upload-dropbox"] & 1) != 0
               || [v13 hasSuffix:@".upload-dropbox.debugging"]))
            {
              v40 = v13;
              uint64_t v41 = v11;
              uint64_t v14 = os_log_create("com.apple.notes", "Analytics");
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                uint64_t v15 = [v12 lastPathComponent];
                *(_DWORD *)buf = 138412290;
                v55 = v15;
                _os_log_impl(&dword_1C3EAD000, v14, OS_LOG_TYPE_INFO, "Removing old analytics data at %@", buf, 0xCu);
              }
              uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
              uint64_t v17 = [v16 enumeratorAtURL:v12 includingPropertiesForKeys:0 options:1 errorHandler:0];

              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id v18 = v17;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v58 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v46;
                do
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v46 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                    long long v24 = [MEMORY[0x1E4F28CB8] defaultManager];
                    id v44 = 0;
                    [v24 removeItemAtURL:v23 error:&v44];
                    id v25 = v44;

                    if (v25)
                    {
                      id v26 = os_log_create("com.apple.notes", "Analytics");
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v55 = v23;
                        __int16 v56 = 2112;
                        id v57 = v25;
                        _os_log_error_impl(&dword_1C3EAD000, v26, OS_LOG_TYPE_ERROR, "Error deleting item: %@, error: %@", buf, 0x16u);
                      }
                    }
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v45 objects:v58 count:16];
                }
                while (v20);
              }

              os_log_t v7 = v38;
              uint64_t v9 = v39;
              uint64_t v10 = v37;
              id v13 = v40;
              uint64_t v11 = v41;
            }

            ++v11;
          }
          while (v11 != v9);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v50 objects:v59 count:16];
        }
        while (v9);
      }

      long long v27 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
      [v27 setBool:1 forKey:@"analyticsRemovedPreviousVersionData"];

      uint64_t v3 = v35;
      uint64_t v2 = v36;
    }
    else
    {
      os_log_t v7 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __47__ICNAController_removePreSydneyDAnalyticsData__block_invoke_cold_1(v7, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }
}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3EAD000, v5, OS_LOG_TYPE_INFO, "flushWithCompletionHandler started", buf, 2u);
  }

  id v6 = [(ICNAController *)self instrumentationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __45__ICNAController_flushWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E64B91C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __45__ICNAController_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) flushManager];
  [v2 flushWithCompletion:*(void *)(a1 + 40)];
}

+ (NSString)userID
{
  id v2 = +[ICNAIdentityManager sharedManager];
  uint64_t v3 = [v2 userID];

  return (NSString *)v3;
}

+ (id)privateUserID
{
  id v2 = +[ICNAIdentityManager sharedManager];
  uint64_t v3 = [v2 privateUserID];

  return v3;
}

+ (NSString)saltVersion
{
  id v2 = +[ICNAIdentityManager sharedManager];
  uint64_t v3 = [v2 identityTimestampYYYYMM];

  return (NSString *)v3;
}

+ (unint64_t)startYear
{
  id v2 = +[ICNAIdentityManager sharedManager];
  unint64_t v3 = [v2 startYear];

  return v3;
}

+ (unint64_t)startMonth
{
  id v2 = +[ICNAIdentityManager sharedManager];
  unint64_t v3 = [v2 startMonth];

  return v3;
}

+ (NSString)deviceModel
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(&v4, 0, 512);
  uname(&v4);
  id v2 = [NSString stringWithCString:v4.machine encoding:4];
  return (NSString *)v2;
}

+ (NSString)devicePlatform
{
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  unint64_t v3 = [v2 systemName];

  return (NSString *)v3;
}

+ (BOOL)audioTranscriptEnabled
{
  id v2 = [MEMORY[0x1E4F83780] sharedInstance];
  char v3 = [v2 supportsGeneralASR];

  return v3;
}

+ (BOOL)audioSummaryEnabled
{
  id v2 = [MEMORY[0x1E4F83780] sharedInstance];
  char v3 = [v2 supportsGreymatter];

  return v3;
}

+ (BOOL)bioAuthEnabled
{
  return [MEMORY[0x1E4F833F0] biometricsEnrolled];
}

+ (BOOL)handwritingAutoRefineEnabled
{
  return [MEMORY[0x1E4F38E48] autoRefineEnabled];
}

+ (BOOL)localNotesEnabled
{
  id v2 = [MEMORY[0x1E4F837D0] objectForKey:@"LocalNotes"];
  char v3 = [v2 BOOLValue];

  return v3;
}

+ (BOOL)mathTextEnabled
{
  return MEMORY[0x1F4139CF8](a1, a2);
}

+ (BOOL)mathHandwritingEnabled
{
  return MEMORY[0x1F4139D10](a1, a2);
}

+ (NSString)osVersion
{
  if (osVersion_onceToken != -1) {
    dispatch_once(&osVersion_onceToken, &__block_literal_global_207);
  }
  id v2 = (void *)osVersion_osVersion;
  return (NSString *)v2;
}

void __27__ICNAController_osVersion__block_invoke()
{
  id v2 = (id)_CFCopySupplementalVersionDictionary();
  uint64_t v0 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CD30]];
  char v1 = (void *)osVersion_osVersion;
  osVersion_osVersion = v0;
}

+ (id)osBundleVersion
{
  if (osBundleVersion_onceToken != -1) {
    dispatch_once(&osBundleVersion_onceToken, &__block_literal_global_209);
  }
  id v2 = (void *)osBundleVersion_buildVersion;
  return v2;
}

void __33__ICNAController_osBundleVersion__block_invoke()
{
  id v2 = (id)_CFCopySupplementalVersionDictionary();
  uint64_t v0 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
  char v1 = (void *)osBundleVersion_buildVersion;
  osBundleVersion_buildVersion = v0;
}

+ (NSString)deviceID
{
  id v2 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
  char v3 = [v2 stringForKey:@"analytics_device_id"];

  if (!v3)
  {
    utsname v4 = [MEMORY[0x1E4F29128] UUID];
    char v3 = [v4 UUIDString];

    uint64_t v5 = [MEMORY[0x1E4F836E0] sharedAppGroupDefaults];
    [v5 setObject:v3 forKey:@"analytics_device_id"];
  }
  return (NSString *)v3;
}

+ (NSString)storeFrontID
{
  id v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  char v3 = objc_msgSend(v2, "ams_activeiTunesAccount");
  utsname v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    objc_msgSend(v6, "ams_localiTunesAccount");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = objc_msgSend(v5, "ams_storefront");

  return (NSString *)v7;
}

- (ICNAControllerAppDelegate)appDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appDelegate);
  return (ICNAControllerAppDelegate *)WeakRetained;
}

- (void)setAppDelegate:(id)a3
{
}

- (NSURL)referringInboundURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReferringInboundURL:(id)a3
{
}

- (NSString)referringApplication
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReferringApplication:(id)a3
{
}

- (NSString)startingSessionType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStartingSessionType:(id)a3
{
}

- (NSString)privateSessionID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPrivateSessionID:(id)a3
{
}

- (AAAppSessionManager)appSessionManager
{
  return self->_appSessionManager;
}

- (void)setAppSessionManager:(id)a3
{
}

- (AAFlushManager)flushManager
{
  return self->_flushManager;
}

- (void)setFlushManager:(id)a3
{
}

- (AAUploadBatchEventConfig)uploadBatchEventConfig
{
  return self->_uploadBatchEventConfig;
}

- (void)setUploadBatchEventConfig:(id)a3
{
}

- (AAClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (AASessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
}

- (NSMutableDictionary)sessionForWindowDict
{
  return self->_sessionForWindowDict;
}

- (void)setSessionForWindowDict:(id)a3
{
}

- (NSMutableDictionary)sessionTrackerForWindowDict
{
  return self->_sessionTrackerForWindowDict;
}

- (void)setSessionTrackerForWindowDict:(id)a3
{
}

- (ICNAServerEnvironment)serverEnvironment
{
  return self->_serverEnvironment;
}

- (void)setServerEnvironment:(id)a3
{
}

- (int64_t)deviceOrientationEnum
{
  return self->_deviceOrientationEnum;
}

- (void)setDeviceOrientationEnum:(int64_t)a3
{
  self->_deviceOrientationEnum = a3;
}

- (OS_dispatch_queue)instrumentationQueue
{
  return self->_instrumentationQueue;
}

- (void)setInstrumentationQueue:(id)a3
{
}

- (NSNumber)endSessionBackgroundTaskIdentifier
{
  return self->_endSessionBackgroundTaskIdentifier;
}

- (void)setEndSessionBackgroundTaskIdentifier:(id)a3
{
}

- (NSMutableDictionary)endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier
{
  return self->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier;
}

- (void)setEndSessionBackgroundTaskIdentifiersByWindowSceneIdentifier:(id)a3
{
}

- (ICNAMultiSceneSessionTracker)multiSceneSessionTracker
{
  return self->_multiSceneSessionTracker;
}

- (void)setMultiSceneSessionTracker:(id)a3
{
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void)setSessionStartDate:(id)a3
{
}

void __39__ICNAController_startSessionWithType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C3EAD000, v0, v1, "Attempting to start a session with an unknown type: %ld", v2, v3, v4, v5, v6);
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_105_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_118_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C3EAD000, v0, v1, "Attempting to end a session with an unknown type: %ld", v2, v3, v4, v5, v6);
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __79__ICNAController_trackTimedEventType_subTracker_synchronousTaskBeforeStarting___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C3EAD000, v0, v1, "No tracker is found when tracking timed event type: %@", v2, v3, v4, v5, v6);
}

void __60__ICNAController_pushDataObject_unique_onlyOnce_subTracker___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C3EAD000, v0, v1, "No tracker is found when pushing data object: %@", v2, v3, v4, v5, v6);
}

void __61__ICNAController_pushDataObjects_unique_onlyOnce_subTracker___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C3EAD000, v0, v1, "No tracker is found when pushing data objects: %@", v2, v3, v4, v5, v6);
}

void __51__ICNAController_popDataObjectWithType_subTracker___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C3EAD000, v0, v1, "No tracker is found when popping data object type: %@", v2, v3, v4, v5, v6);
}

void __53__ICNAController_popDataObjectsWithTypes_subTracker___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1C3EAD000, v0, v1, "No tracker is found when popping data object types: %@", v2, v3, v4, v5, v6);
}

void __79__ICNAController_submitEventOfType_subTracker_synchronousTaskBeforeSubmitting___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1C3EAD000, v0, OS_LOG_TYPE_DEBUG, "Ignoring event submission. It should have already been submitted as synchronous task block returned NO: %@", v1, 0xCu);
}

- (void)_immediatelySubmitEventOfType:(uint64_t)a3 subTracker:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_immediatelySubmitEventOfType:(uint64_t)a3 pushThenPopDataObjects:(uint64_t)a4 subTracker:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__ICNAController_removePreSydneyDAnalyticsData__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end