@interface CSDReportingController
+ (CSDReportingController)sharedInstance;
+ (id)sharedInstanceWithQueue:(id)a3;
- (CSDClientManager)clientManager;
- (CSDReportingController)initWithQueue:(id)a3;
- (NSArray)calls;
- (NSMutableArray)reporters;
- (NSMutableDictionary)reportingSessionByStreamToken;
- (NSMutableSet)conversationUUIDs;
- (OS_dispatch_queue)queue;
- (void)addReporter:(id)a3;
- (void)avcBlobRecoveryStartedForConversation:(id)a3;
- (void)avcBlobRecoveryTimedOutForConversation:(id)a3;
- (void)avcBlobRequestMessageRetryFailedForConversationGroupUUID:(id)a3;
- (void)avcBlobRequestMessageRetryStartedForConversationGroupUUID:(id)a3;
- (void)avcBlobRequestMessageRetrySucceededForConversationGroupUUID:(id)a3;
- (void)chatReceived:(id)a3;
- (void)connectionSetupReportReceived:(id)a3 eventType:(int64_t)a4 forConversation:(id)a5;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 addedActivatedLink:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)conversationsChangedForConversationManager:(id)a3;
- (void)createConversationReportingSession:(id)a3;
- (void)createOneToOneFTReportingSessionForCallWithUUID:(id)a3 withReportingHierarchyToken:(id)a4 withVideo:(BOOL)a5;
- (void)dealloc;
- (void)didCleanUpForStream:(int64_t)a3;
- (void)didCleanUpForStream:(int64_t)a3 reply:(id)a4;
- (void)didEndSession:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4;
- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5;
- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4;
- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5;
- (void)groupActivitiesReportsReceived:(id)a3 forConversation:(id)a4;
- (void)handleCallRecordingEnded:(id)a3;
- (void)handleCallStatusChanged:(id)a3;
- (void)handleScreeningChanged:(id)a3;
- (void)handoffReportReceived:(id)a3 forConversation:(id)a4;
- (void)idsReportsReceived:(id)a3 forConversation:(id)a4;
- (void)idsReportsReceived:(id)a3 forSessionWithUUID:(id)a4;
- (void)messageRetryFailedForConversationGroupUUID:(id)a3;
- (void)messageRetryStartedForConversationGroupUUID:(id)a3;
- (void)messageRetrySucceededForConversationGroupUUID:(id)a3;
- (void)momentsController:(id)a3 didCleanUpForStream:(int64_t)a4;
- (void)momentsController:(id)a3 didReceiveResultsForStream:(int64_t)a4 withTransactionID:(id)a5;
- (void)momentsController:(id)a3 didStartRequestForStream:(int64_t)a4 withTransactionID:(id)a5;
- (void)momentsController:(id)a3 registeredStream:(int64_t)a4 withAvailability:(int)a5;
- (void)momentsReportingSession:(id)a3 didGenerateUsageReport:(id)a4;
- (void)oneToOneModeSwitchFailureForConversation:(id)a3 isOneToOneMode:(BOOL)a4;
- (void)receivedLetMeInRequestForConversation:(id)a3;
- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4;
- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4 reply:(id)a5;
- (void)remoteMemberNotInMemberListForConversation:(id)a3;
- (void)reportAllCallsBackgrounded;
- (void)reportCallEnteredForeground:(id)a3;
- (void)reportJoinDurationLongerThanThreasholdForCallUUID:(id)a3 report:(id)a4;
- (void)reportProviderFailedWithAction:(id)a3 forCall:(id)a4;
- (void)reportRelayMessageReceived:(id)a3 fromPairedDevice:(BOOL)a4;
- (void)reportRouteWasPicked:(id)a3;
- (void)reportRouteWasPickedByAnyTrigger:(id)a3;
- (void)reportTimedOutPickingRoute:(id)a3;
- (void)reportTransactionGroupCompleted:(id)a3;
- (void)reportingController:(id)a3 letMeInRequestStateChangedForConversation:(id)a4;
- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4;
- (void)sentLetMeInRequestForConversation:(id)a3 isApproved:(BOOL)a4;
- (void)setReporters:(id)a3;
- (void)transitionAttemptForConversation:(id)a3;
- (void)voipAppBecameDisabledFromLaunching:(id)a3;
- (void)voipAppFailedToPostIncomingCall:(id)a3;
- (void)voipDOSCallIgnored:(id)a3;
- (void)voipPushDroppedOnTheFloor:(id)a3;
@end

@implementation CSDReportingController

+ (CSDReportingController)sharedInstance
{
  return (CSDReportingController *)+[CSDReportingController sharedInstanceWithQueue:&_dispatch_main_q];
}

+ (id)sharedInstanceWithQueue:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BE320;
  block[3] = &unk_100504EC0;
  id v8 = a3;
  uint64_t v3 = qword_10058C590;
  id v4 = v8;
  if (v3 != -1) {
    dispatch_once(&qword_10058C590, block);
  }
  id v5 = (id)qword_10058C588;

  return v5;
}

- (CSDReportingController)initWithQueue:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CSDReportingController;
  v6 = [(CSDReportingController *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    id v8 = [[CSDClientManager alloc] initWithSerialQueue:v7->_queue];
    clientManager = v7->_clientManager;
    v7->_clientManager = v8;

    [(CSDClientManager *)v7->_clientManager setRequiredConnectionCapability:@"modify-reports"];
    v10 = +[TUReportingControllerXPCClient reportingControllerServerXPCInterface];
    [(CSDClientManager *)v7->_clientManager setExportedInterface:v10];

    [(CSDClientManager *)v7->_clientManager setExportedObject:v7];
    [(CSDClientManager *)v7->_clientManager setInterruptionHandler:&stru_100509FA0];
    [(CSDClientManager *)v7->_clientManager setInvalidationHandler:&stru_100509FC0];
    [(CSDClientManager *)v7->_clientManager startListeningOnMachServiceWithName:@"com.apple.telephonyutilities.callservicesdaemon.reportingcontroller"];
    uint64_t v11 = +[NSMutableArray array];
    reporters = v7->_reporters;
    v7->_reporters = (NSMutableArray *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    reportingSessionByStreamToken = v7->_reportingSessionByStreamToken;
    v7->_reportingSessionByStreamToken = (NSMutableDictionary *)v13;

    uint64_t v15 = +[NSMutableSet set];
    conversationUUIDs = v7->_conversationUUIDs;
    v7->_conversationUUIDs = (NSMutableSet *)v15;

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v7 selector:"handleCallStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v17 addObserver:v7 selector:"handleCallStatusChanged:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    [v17 addObserver:v7 selector:"handleScreeningChanged:" name:TUCallCenterIsScreeningChangedNotification object:0];
    v18 = +[CSDCallRecordingLaunchService CSDCallRecordingEndedNotification];
    [v17 addObserver:v7 selector:"handleCallRecordingEnded:" name:v18 object:0];

    queue = v7->_queue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001BE758;
    v21[3] = &unk_100504F10;
    v22 = v7;
    id v23 = v5;
    dispatch_async(queue, v21);
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDReportingController;
  [(CSDReportingController *)&v4 dealloc];
}

- (void)addReporter:(id)a3
{
  id v4 = a3;
  if (TUSimulatedModeEnabled())
  {
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not adding reporter %@ since simulated mode is enabled", (uint8_t *)&v7, 0xCu);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v4 setDataSource:self];
  }
  v6 = [(CSDReportingController *)self reporters];
  [v6 addObject:v4];
}

- (void)handleScreeningChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDReportingController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BE9D4;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleCallStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDReportingController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BEC14;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleCallRecordingEnded:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDReportingController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BEE78;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)reportJoinDurationLongerThanThreasholdForCallUUID:(id)a3 report:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "reportJoinDurationLongerThanThreashold for callUUID: %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = [(CSDReportingController *)self reporters];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 reportingController:self forCallUUID:v6 report:v7];
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)reportCallEnteredForeground:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "for call: %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self callEnteredForeground:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)reportAllCallsBackgrounded
{
  uint64_t v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(CSDReportingController *)self reporters];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 allCallsBackgroundedForReportingController:self];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)reportRelayMessageReceived:(id)a3 fromPairedDevice:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "for message: %@", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(CSDReportingController *)self reporters];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 reportingController:self relayMessageReceived:v6 fromPairedDevice:v4];
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)reportTransactionGroupCompleted:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "transactionGroup: %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self transactionGroupCompleted:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)reportProviderFailedWithAction:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "with action: %@ for call %@", buf, 0x16u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(CSDReportingController *)self reporters];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 reportingController:self providerFailedWithAction:v6 forCall:v7];
        }
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)reportRouteWasPicked:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "route: %@", buf, 0xCu);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(CSDReportingController *)self reporters];
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      long long v17 = "reportingController:pickedRoute:forCall:";
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = v7;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v12 = [(CSDReportingController *)self calls];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              long long v16 = 0;
              do
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                objc_msgSend(v10, "reportingController:pickedRoute:forCall:", self, v4, *(void *)(*((void *)&v19 + 1) + 8 * (void)v16), v17);
                long long v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v14);
          }

          id v7 = v11;
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)reportRouteWasPickedByAnyTrigger:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "picked route: %@", buf, 0xCu);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(CSDReportingController *)self reporters];
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      long long v17 = "reportingController:pickedRoute:updatedByAnyTriggerForCall:";
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = v7;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v12 = [(CSDReportingController *)self calls];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              long long v16 = 0;
              do
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                objc_msgSend(v10, "reportingController:pickedRoute:updatedByAnyTriggerForCall:", self, v4, *(void *)(*((void *)&v19 + 1) + 8 * (void)v16), v17);
                long long v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v14);
          }

          id v7 = v11;
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)reportTimedOutPickingRoute:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "route: %@", buf, 0xCu);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(CSDReportingController *)self reporters];
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      long long v17 = "reportingController:timedOutPickingRoute:forCall:";
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          id v11 = v7;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v12 = [(CSDReportingController *)self calls];
          id v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v20;
            do
            {
              long long v16 = 0;
              do
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v12);
                }
                objc_msgSend(v10, "reportingController:timedOutPickingRoute:forCall:", self, v4, *(void *)(*((void *)&v19 + 1) + 8 * (void)v16), v17);
                long long v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              id v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v14);
          }

          id v7 = v11;
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)createOneToOneFTReportingSessionForCallWithUUID:(id)a3 withReportingHierarchyToken:(id)a4 withVideo:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CSDReportingController *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001C0044;
  v13[3] = &unk_100506C18;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v9;
  BOOL v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)createConversationReportingSession:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDReportingController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001C02DC;
  v7[3] = &unk_100504F10;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)idsReportsReceived:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(CSDReportingController *)self reporters];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 reportingController:self receivedIDSReports:v6 forConversation:v7];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)idsReportsReceived:(id)a3 forSessionWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(CSDReportingController *)self reporters];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 reportingController:self receivedIDSReports:v6 forSessionWithUUID:v7];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)chatReceived:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "chat=%@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self receivedIDSChat:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)handoffReportReceived:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 UUID];
    *(_DWORD *)buf = 138412546;
    long long v22 = v9;
    __int16 v23 = 2112;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "handoffReportReceived for conversationUUID %@, %@", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [(CSDReportingController *)self reporters];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v14);
        if (objc_opt_respondsToSelector()) {
          [v15 reportingController:self receivedHandoffReport:v6 forConversation:v7];
        }
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)connectionSetupReportReceived:(id)a3 eventType:(int64_t)a4 forConversation:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[CSDRTCConnectionSetup eventTypeNameFrom:a4];
    id v12 = [v9 UUID];
    *(_DWORD *)buf = 138412546;
    long long v25 = v11;
    __int16 v26 = 2112;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "connectionSetupReport received eventType %@ for conversationUUID %@", buf, 0x16u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [(CSDReportingController *)self reporters];
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      long long v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v17);
        if (objc_opt_respondsToSelector()) {
          [v18 reportingController:self receivedConnectionSetupReport:v8 eventType:a4 forConversation:v9];
        }
        long long v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }
}

- (void)groupActivitiesReportsReceived:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "groupActivitiesReports received for conversation %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [(CSDReportingController *)self reporters];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 reportingController:self receivedGroupActivitiesReports:v6 forConversation:v7];
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)avcBlobRecoveryStartedForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "blob recovery started for conversation %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self AVCBlobRecoveryStartedForConversation:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)remoteMemberNotInMemberListForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "remoteMemberNotInMemberList for conversation %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self remoteMemberNotInMemberListForConversation:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)transitionAttemptForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "attempted transition for conversation %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self transitionAttemptForConversation:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)avcBlobRecoveryTimedOutForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "blob recovery timed out for conversation %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self AVCBlobRecoveryTimedOutForConversation:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)oneToOneModeSwitchFailureForConversation:(id)a3 isOneToOneMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v4) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v21 = v8;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "report oneToOneSwitchFailure %@ for conversation %@", buf, 0x16u);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(CSDReportingController *)self reporters];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 reportingController:self oneToOneModeSwitchFailureForConversation:v6 isOneToOneMode:v4];
        }
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)messageRetryStartedForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "message retry started for conversationGroupUUID %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self messageRetryStartedForConversationGroupUUID:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)messageRetryFailedForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "message retry failed for conversationGroupUUID %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self messageRetryFailedForConversationGroupUUID:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)messageRetrySucceededForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "message retry succeeded for conversationGroupUUID %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self messageRetrySucceededForConversationGroupUUID:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)avcBlobRequestMessageRetryStartedForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "avc blob request message retry started for conversationGroupUUID %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self avcBlobRequestMessageRetryStartedForConversationGroupUUID:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)avcBlobRequestMessageRetryFailedForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "avc blob request message retry failed for conversationGroupUUID %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self avcBlobRequestMessageRetryFailedForConversationGroupUUID:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)avcBlobRequestMessageRetrySucceededForConversationGroupUUID:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "avc blob request message retry succeeded for conversationGroupUUID %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self avcBlobRequestMessageRetrySucceededForConversationGroupUUID:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)voipAppFailedToPostIncomingCall:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "VoIP app %@ failed to post incoming call", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self voipAppFailedToPostIncomingCall:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)voipAppBecameDisabledFromLaunching:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "VoIP app %@ no longer eligible to launch", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self voipAppBecameDisabledFromLaunching:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)voipPushDroppedOnTheFloor:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "VoIP push for app %@ dropped on the floor", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self voipPushDroppedOnTheFloor:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)voipDOSCallIgnored:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "VoIP DOS detected for %@, ignoring call", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self voipDOSCallIgnored:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)receivedLetMeInRequestForConversation:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "receivedLetMeInRequestForConversation: %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self receivedLetMeInRequestForConversation:v4];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)sentLetMeInRequestForConversation:(id)a3 isApproved:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sentLetMeInRequestForConversation: %@ isApproved: %d", buf, 0x12u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(CSDReportingController *)self reporters];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 reportingController:self sentLetMeInResponseForConversation:v6 isApproved:v4];
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v6;
    __int16 v21 = 1024;
    int v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Send User Score to RTCReporting with UUID:%@ and Score:%d", buf, 0x12u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(CSDReportingController *)self reporters];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector()) {
          [v13 reportingController:self callUUID:v6 withUserScore:v4];
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)didEndSession:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Send activity session ended with startDate %@ endDate%@ session %@", buf, 0x20u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = [(CSDReportingController *)self reporters];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v16);
        if (objc_opt_respondsToSelector()) {
          [v17 reportingController:self didEndSession:v8 startDate:v9 endDate:v10];
        }
        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v9 = [[CSDMomentsReportingSession alloc] initWithStreamToken:a3];
  [(CSDMomentsReportingSession *)v9 setDelegate:self];
  id v7 = [(CSDReportingController *)self reportingSessionByStreamToken];
  id v8 = +[NSNumber numberWithInteger:a3];
  [v7 setObject:v9 forKeyedSubscript:v8];

  [(CSDMomentsReportingSession *)v9 registeredStreamWithAvailability:v4];
}

- (void)didCleanUpForStream:(int64_t)a3
{
  uint64_t v4 = [(CSDReportingController *)self reportingSessionByStreamToken];
  id v5 = +[NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  [v6 didCleanUp];
}

- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDReportingController *)self reportingSessionByStreamToken];
  id v8 = +[NSNumber numberWithInteger:a3];
  id v9 = [v7 objectForKeyedSubscript:v8];

  [v9 didStartRequestWithTransactionID:v6];
}

- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDReportingController *)self reportingSessionByStreamToken];
  id v8 = +[NSNumber numberWithInteger:a3];
  id v9 = [v7 objectForKeyedSubscript:v8];

  [v9 didReceiveResultsWithTransactionID:v6];
}

- (void)momentsController:(id)a3 registeredStream:(int64_t)a4 withAvailability:(int)a5
{
}

- (void)momentsController:(id)a3 didCleanUpForStream:(int64_t)a4
{
}

- (void)momentsController:(id)a3 didStartRequestForStream:(int64_t)a4 withTransactionID:(id)a5
{
}

- (void)momentsController:(id)a3 didReceiveResultsForStream:(int64_t)a4 withTransactionID:(id)a5
{
}

- (void)registeredStream:(int64_t)a3 withAvailability:(int)a4 reply:(id)a5
{
}

- (void)didCleanUpForStream:(int64_t)a3 reply:(id)a4
{
}

- (void)didStartRequestForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5
{
}

- (void)didReceiveResultsForStream:(int64_t)a3 withTransactionID:(id)a4 reply:(id)a5
{
}

- (void)momentsReportingSession:(id)a3 didGenerateUsageReport:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Reporting %@", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(CSDReportingController *)self reporters];
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 reportingController:self capturedMomentsUsageReport:v7];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(CSDReportingController *)self reportingSessionByStreamToken];
  long long v16 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v6 streamToken]);
  [v15 setObject:0 forKeyedSubscript:v16];
}

- (NSArray)calls
{
  v2 = +[TUCallCenter sharedInstance];
  uint64_t v3 = [v2 currentAudioAndVideoCalls];

  return (NSArray *)v3;
}

- (void)conversationsChangedForConversationManager:(id)a3
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [a3 activeConversations];
  id v4 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v30;
    uint64_t v22 = *(void *)v30;
    do
    {
      id v7 = 0;
      id v23 = v5;
      do
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v7);
        id v9 = [(CSDReportingController *)self conversationUUIDs];
        id v10 = [v8 UUID];
        id v11 = [v10 UUIDString];
        unsigned __int8 v12 = [v9 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          id v13 = [(CSDReportingController *)self conversationUUIDs];
          id v14 = [v8 UUID];
          uint64_t v15 = [v14 UUIDString];
          [v13 addObject:v15];

          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v16 = [(CSDReportingController *)self reporters];
          id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v26;
            do
            {
              long long v20 = 0;
              do
              {
                if (*(void *)v26 != v19) {
                  objc_enumerationMutation(v16);
                }
                long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v20);
                if (objc_opt_respondsToSelector()) {
                  [v21 reportingController:self addedActiveConversation:v8];
                }
                long long v20 = (char *)v20 + 1;
              }
              while (v18 != v20);
              id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v18);
          }

          uint64_t v6 = v22;
          id v5 = v23;
        }
        id v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      id v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self activeRemoteParticipantsChangedForConversation:v5];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self remoteMembersChangedForConversation:v5];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self stateChangedForConversation:v5];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)reportingController:(id)a3 letMeInRequestStateChangedForConversation:(id)a4
{
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self letMeInRequestStateChangedForConversation:v5];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(CSDReportingController *)self reporters];
  id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
        id v11 = [(CSDReportingController *)self conversationUUIDs];
        long long v12 = [v5 UUID];
        long long v13 = [v12 UUIDString];
        [v11 removeObject:v13];

        if (objc_opt_respondsToSelector()) {
          [v10 reportingController:self removedActiveConversation:v5];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)conversationManager:(id)a3 addedActivatedLink:(id)a4
{
  id v5 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CSDReportingController *)self reporters];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 reportingController:self addedActivatedLink:v5];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (NSMutableArray)reporters
{
  return self->_reporters;
}

- (void)setReporters:(id)a3
{
}

- (NSMutableDictionary)reportingSessionByStreamToken
{
  return self->_reportingSessionByStreamToken;
}

- (NSMutableSet)conversationUUIDs
{
  return self->_conversationUUIDs;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_conversationUUIDs, 0);
  objc_storeStrong((id *)&self->_reportingSessionByStreamToken, 0);

  objc_storeStrong((id *)&self->_reporters, 0);
}

@end