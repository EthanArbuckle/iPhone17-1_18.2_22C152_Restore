@interface CSDStatusBarResolver
- (BOOL)callProviderSupportsSystemControls;
- (BOOL)callStatusSupportsSystemControls;
- (BOOL)conversationStateSupportsSystemControls;
- (BOOL)shouldDisplayHandoffEligibleConversationControls;
- (BOOL)shouldDisplayLagunaPullConversationControls;
- (BOOL)shouldDisplaySystemCallControls;
- (BOOL)shouldRegisterForPillDatasource;
- (CSDCall)resolvedCall;
- (CSDCall)resolvedCallForActiveDescriptor;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDProcessObserverProtocol)inCallServiceProcessObserver;
- (CSDProcessObserverProtocol)springBoardProcessObserver;
- (CSDStatusBarResolver)init;
- (CSDStatusBarResolver)initWithCallCenterObserver:(id)a3 inCallServiceProcessObserver:(id)a4 springBoardProcessObserver:(id)a5 callCenter:(id)a6 featureFlags:(id)a7 queue:(id)a8;
- (CSDStatusBarResolver)initWithQueue:(id)a3;
- (CSDStatusBarResolverDelegate)delegate;
- (NSNumber)springBoardPID;
- (NSTimer)callDurationUpdateTimer;
- (OS_dispatch_queue)queue;
- (STCallingStatusDomainCallDescriptor)resolvedDescriptor;
- (TUCall)screenedCallToShow;
- (TUCallCenter)callCenter;
- (TUConversation)resolvedConversation;
- (TUFeatureFlags)featureFlags;
- (id)resolvedAVLessConversation;
- (id)resolvedCallForActiveDescriptor:(id)a3;
- (id)resolvedHandoffEligibleConversation;
- (int64_t)inCallServiceProcessState;
- (os_unfair_lock_s)durationUpdateTimerLock;
- (void)callsChangedForCallCenterObserver:(id)a3;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 handoffEligibilityChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 localVideoToggledForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)handleSpringBoardPIDChanged:(id)a3;
- (void)setCallDurationUpdateTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInCallServiceProcessState:(int64_t)a3;
- (void)setResolvedCallForActiveDescriptor:(id)a3;
- (void)setResolvedDescriptor:(id)a3;
- (void)setScreenedCallToShow:(id)a3;
- (void)setShouldRegisterForPillDatasource:(BOOL)a3;
- (void)setSpringBoardPID:(id)a3;
- (void)updateResolvedDescriptor;
@end

@implementation CSDStatusBarResolver

- (CSDStatusBarResolver)init
{
  return [(CSDStatusBarResolver *)self initWithQueue:&_dispatch_main_q];
}

- (CSDStatusBarResolver)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CSDCallCenterObserver);
  v6 = [[CSDProcessObserver alloc] initWithQueue:v4];
  v7 = [[CSDProcessObserver alloc] initWithQueue:v4];
  v8 = +[TUCallCenter sharedInstance];
  id v9 = objc_alloc_init((Class)TUFeatureFlags);
  v10 = [(CSDStatusBarResolver *)self initWithCallCenterObserver:v5 inCallServiceProcessObserver:v6 springBoardProcessObserver:v7 callCenter:v8 featureFlags:v9 queue:v4];

  return v10;
}

- (CSDStatusBarResolver)initWithCallCenterObserver:(id)a3 inCallServiceProcessObserver:(id)a4 springBoardProcessObserver:(id)a5 callCenter:(id)a6 featureFlags:(id)a7 queue:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v33 = a5;
  id v17 = a6;
  id obj = a7;
  id v32 = a7;
  id v18 = a8;
  v49.receiver = self;
  v49.super_class = (Class)CSDStatusBarResolver;
  v19 = [(CSDStatusBarResolver *)&v49 init];
  v20 = v19;
  if (v19)
  {
    id v29 = v16;
    id v30 = v15;
    objc_storeStrong((id *)&v19->_queue, a8);
    v20->_durationUpdateTimerLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_callCenter, a6);
    objc_storeStrong((id *)&v20->_callCenterObserver, a3);
    [(CSDCallCenterObserver *)v20->_callCenterObserver setTriggers:201326625];
    [(CSDCallCenterObserver *)v20->_callCenterObserver setTriggers:[(CSDCallCenterObserver *)v20->_callCenterObserver triggers] | 0x40000000];
    [(CSDCallCenterObserver *)v20->_callCenterObserver setDelegate:v20];
    objc_storeStrong((id *)&v20->_inCallServiceProcessObserver, a4);
    objc_storeStrong((id *)&v20->_springBoardProcessObserver, a5);
    objc_storeStrong((id *)&v20->_featureFlags, obj);
    queue = v20->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D4814;
    block[3] = &unk_100504FE0;
    id v46 = v17;
    v22 = v20;
    v47 = v22;
    id v48 = v18;
    dispatch_async(queue, block);
    objc_initWeak(&location, v22);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000D4868;
    v42[3] = &unk_100507080;
    objc_copyWeak(&v43, &location);
    [(CSDProcessObserverProtocol *)v20->_springBoardProcessObserver setProcessStateChanged:v42];
    springBoardProcessObserver = v20->_springBoardProcessObserver;
    uint64_t v24 = TUBundleIdentifierSpringBoardApplication;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000D4944;
    v40[3] = &unk_1005070A8;
    objc_copyWeak(&v41, &location);
    [(CSDProcessObserverProtocol *)springBoardProcessObserver processStatesForBundleIdentifier:v24 completion:v40];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000D49D4;
    v38[3] = &unk_100507080;
    objc_copyWeak(&v39, &location);
    [(CSDProcessObserverProtocol *)v20->_inCallServiceProcessObserver setProcessStateChanged:v38];
    inCallServiceProcessObserver = v20->_inCallServiceProcessObserver;
    uint64_t v26 = TUBundleIdentifierInCallServiceApplication;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000D4B74;
    v36[3] = &unk_1005070A8;
    objc_copyWeak(&v37, &location);
    [(CSDProcessObserverProtocol *)inCallServiceProcessObserver processStatesForBundleIdentifier:v26 completion:v36];
    [(CSDStatusBarResolver *)v22 queue];
    id v16 = v29;
    v27 = id v15 = v30;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000D4CE4;
    v34[3] = &unk_100504EC0;
    v35 = v22;
    dispatch_async(v27, v34);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
  }
  return v20;
}

- (void)dealloc
{
  p_durationUpdateTimerLock = &self->_durationUpdateTimerLock;
  os_unfair_lock_lock(&self->_durationUpdateTimerLock);
  [(NSTimer *)self->_callDurationUpdateTimer invalidate];
  callDurationUpdateTimer = self->_callDurationUpdateTimer;
  self->_callDurationUpdateTimer = 0;

  os_unfair_lock_unlock(p_durationUpdateTimerLock);
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidated callDurationUpdateTimer", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)CSDStatusBarResolver;
  [(CSDStatusBarResolver *)&v6 dealloc];
}

- (void)handleSpringBoardPIDChanged:(id)a3
{
  id v4 = a3;
  v5 = [(CSDStatusBarResolver *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D4E50;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateResolvedDescriptor
{
  v3 = [(CSDStatusBarResolver *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2020000000;
  char v57 = 1;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000D5604;
  v45[3] = &unk_1005070D0;
  v45[4] = &v54;
  v45[5] = &v46;
  v45[6] = &v50;
  id v4 = objc_retainBlock(v45);
  v5 = [(CSDStatusBarResolver *)self resolvedCall];
  uint64_t v6 = [(CSDStatusBarResolver *)self resolvedConversation];
  v7 = (void *)v6;
  if (v5)
  {
    uint64_t v8 = [v5 status] == 4;
    if ([v5 isVideo]) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = [v5 isThirdPartyVideo];
    }
    v47[3] = v9;
    if ([v5 isPTT])
    {
      uint64_t v8 = 2 * ([v5 status] != 1);
      v47[3] = 3;
    }
    if ([v5 isScreening]
      && [v5 screeningAnnouncementHasFinished])
    {
      uint64_t v8 = 4;
    }
    v14 = [(CSDStatusBarResolver *)self featureFlags];
    if (([v14 callRecordingEnabled] & 1) != 0
      && ([v5 recordingSession], (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v16 = [v5 recordingSession];
      unsigned int v17 = [v16 recordingState];

      if (v17 == 3) {
        uint64_t v8 = 6;
      }
    }
    else
    {
    }
    id v18 = [(CSDStatusBarResolver *)self callCenter];
    v19 = [v18 queue];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000D5904;
    v42[3] = &unk_1005070F8;
    v44 = v4;
    void v42[4] = self;
    id v43 = v5;
    dispatch_sync(v19, v42);

    if (*((unsigned char *)v55 + 24))
    {
      id v20 = objc_alloc((Class)STCallingStatusDomainCallDescriptor);
      id v21 = [v20 initWithCallType:v47[3] callState:v8 copresenceActivityType:v51[3]];
    }
    else
    {
      id v21 = 0;
    }
    v22 = (id *)&v44;
    v23 = v43;
    goto LABEL_41;
  }
  if (!v6)
  {
    id v21 = 0;
    goto LABEL_42;
  }
  v10 = [(CSDStatusBarResolver *)self callCenter];
  v11 = [v10 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D597C;
  block[3] = &unk_100507120;
  id v41 = v4;
  id v12 = v7;
  id v40 = v12;
  dispatch_sync(v11, block);

  if ([v12 state] == (id)2) {
    goto LABEL_6;
  }
  if (![v12 avMode])
  {
    uint64_t v24 = [v12 activeRemoteParticipants];
    if ([v24 count])
    {
    }
    else
    {
      uint64_t v25 = v51[3];

      if (!v25)
      {
LABEL_6:
        uint64_t v13 = 1;
        goto LABEL_37;
      }
    }
  }
  id v26 = [v12 state];
  if (v26 || ([v12 handoffEligibility], (v28 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    unsigned int v27 = [v12 isContinuitySession];
    if (v26) {
      goto LABEL_34;
    }
    v28 = 0;
  }
  else
  {
    unsigned int v27 = 1;
  }

LABEL_34:
  if (v27) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 0;
  }
LABEL_37:
  if (*((unsigned char *)v55 + 24))
  {
    id v29 = objc_alloc((Class)STCallingStatusDomainCallDescriptor);
    id v21 = [v29 initWithCallType:v47[3] callState:v13 copresenceActivityType:v51[3]];
  }
  else
  {
    id v21 = 0;
  }
  v22 = (id *)&v41;
  v23 = v40;
LABEL_41:

LABEL_42:
  id v30 = [(CSDStatusBarResolver *)self resolvedDescriptor];
  char v31 = TUObjectsAreEqualOrNil();

  if ((v31 & 1) == 0)
  {
    [(CSDStatusBarResolver *)self setResolvedDescriptor:v21];
    id v32 = [(CSDStatusBarResolver *)self delegate];
    [v32 resolutionChangedForResolver:self];
  }
  os_unfair_lock_lock(&self->_durationUpdateTimerLock);
  id v33 = [(CSDStatusBarResolver *)self resolvedDescriptor];

  if (!v33)
  {
    id v37 = [(CSDStatusBarResolver *)self callDurationUpdateTimer];
    [v37 invalidate];

    [(CSDStatusBarResolver *)self setCallDurationUpdateTimer:0];
    v36 = sub_100008DCC();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "invalidate callDurationUpdateTimer", v38, 2u);
    }
    goto LABEL_51;
  }
  v34 = [(CSDStatusBarResolver *)self callDurationUpdateTimer];

  if (!v34)
  {
    v35 = sub_100008DCC();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "set up new callDurationUpdateTimer", v38, 2u);
    }

    v36 = +[NSTimer scheduledTimerWithTimeInterval:self target:"updateResolvedDescriptor" selector:0 userInfo:1 repeats:1.0];
    [(CSDStatusBarResolver *)self setCallDurationUpdateTimer:v36];
LABEL_51:
  }
  os_unfair_lock_unlock(&self->_durationUpdateTimerLock);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
}

- (id)resolvedCallForActiveDescriptor:(id)a3
{
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v30 = a3;
  v3 = [v30 currentAudioAndVideoCalls];
  id v4 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v4)
  {
    uint64_t v6 = 0;
    v7 = 0;
    id v8 = 0;
    goto LABEL_25;
  }
  id v5 = v4;
  uint64_t v6 = 0;
  v7 = 0;
  id v8 = 0;
  uint64_t v9 = *(void *)v32;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v32 != v9) {
        objc_enumerationMutation(v3);
      }
      v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      id v12 = [v11 provider];
      if (![v12 supportsCurrentPlatform]) {
        goto LABEL_20;
      }
      unsigned int v13 = [v11 isEndpointOnCurrentDevice];

      if (v13)
      {
        if ([v11 status] == 1)
        {
          if (!v6 || ([v11 callDuration], double v15 = v14, objc_msgSend(v6, "callDuration"), v15 > v16))
          {
            id v17 = v11;

            uint64_t v6 = v17;
          }
        }
        if ([v11 status] == 3)
        {
          if (!v7 || ([v11 callDuration], double v19 = v18, objc_msgSend(v7, "callDuration"), v19 > v20))
          {
            id v21 = v11;

            v7 = v21;
          }
        }
        if ([v11 status] == 2)
        {
          if (!v8 || ([v11 callDuration], double v23 = v22, objc_msgSend(v8, "callDuration"), v23 > v24))
          {
            id v12 = v8;
            id v8 = v11;
LABEL_20:

            continue;
          }
        }
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v5);
LABEL_25:

  uint64_t v25 = [v30 frontmostBargeCall];
  id v26 = (void *)v25;
  if (v8) {
    unsigned int v27 = v8;
  }
  else {
    unsigned int v27 = (void *)v25;
  }
  if (v6) {
    unsigned int v27 = v6;
  }
  if (v7) {
    unsigned int v27 = v7;
  }
  id v28 = v27;

  return v28;
}

- (CSDCall)resolvedCall
{
  v3 = [(CSDStatusBarResolver *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1000D5D3C;
  unsigned int v13 = sub_1000D5D4C;
  id v14 = 0;
  id v4 = [(CSDStatusBarResolver *)self callCenter];
  id v5 = [v4 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D5D54;
  v8[3] = &unk_100506E98;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (CSDCall *)v6;
}

- (TUConversation)resolvedConversation
{
  v3 = [(CSDStatusBarResolver *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDStatusBarResolver *)self resolvedCall];

  if (v4)
  {
    id v5 = [(CSDStatusBarResolver *)self callCenterObserver];
    id v6 = [(CSDStatusBarResolver *)self resolvedCall];
    v7 = [v5 activeConversationForCall:v6];
  }
  else
  {
    id v8 = [(CSDStatusBarResolver *)self resolvedAVLessConversation];
    id v5 = v8;
    if (v8)
    {
      id v9 = v8;
      id v5 = v9;
    }
    else
    {
      id v9 = [(CSDStatusBarResolver *)self resolvedHandoffEligibleConversation];
    }
    v7 = v9;
  }

  return (TUConversation *)v7;
}

- (id)resolvedAVLessConversation
{
  v3 = [(CSDStatusBarResolver *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDStatusBarResolver *)self featureFlags];
  unsigned int v5 = [v4 avLessSharePlayEnabled];

  if (v5
    && ([(CSDStatusBarResolver *)self resolvedCall],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    uint64_t v12 = 0;
    unsigned int v13 = &v12;
    uint64_t v14 = 0x3032000000;
    double v15 = sub_1000D5D3C;
    double v16 = sub_1000D5D4C;
    id v17 = 0;
    id v9 = [(CSDStatusBarResolver *)self callCenter];
    v10 = [v9 queue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000D6494;
    v11[3] = &unk_100506E98;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    id v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)resolvedHandoffEligibleConversation
{
  v3 = [(CSDStatusBarResolver *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDStatusBarResolver *)self resolvedCall];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    unsigned int v13 = sub_1000D5D3C;
    uint64_t v14 = sub_1000D5D4C;
    id v15 = 0;
    id v6 = [(CSDStatusBarResolver *)self callCenter];
    id v7 = [v6 queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000D67B4;
    v9[3] = &unk_100505008;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(v7, v9);

    id v5 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }

  return v5;
}

- (BOOL)shouldDisplaySystemCallControls
{
  v3 = [(CSDStatusBarResolver *)self featureFlags];
  unsigned int v4 = [v3 expanseEnabled];

  if (!v4
    || ![(CSDStatusBarResolver *)self callProviderSupportsSystemControls]
    || ![(CSDStatusBarResolver *)self conversationStateSupportsSystemControls])
  {
    return 0;
  }

  return [(CSDStatusBarResolver *)self callStatusSupportsSystemControls];
}

- (BOOL)shouldDisplayHandoffEligibleConversationControls
{
  v3 = [(CSDStatusBarResolver *)self featureFlags];
  unsigned int v4 = [v3 conversationHandoffEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(CSDStatusBarResolver *)self resolvedCall];

  if (v5) {
    return 0;
  }
  id v7 = [(CSDStatusBarResolver *)self resolvedHandoffEligibleConversation];
  BOOL v6 = v7 != 0;

  return v6;
}

- (BOOL)shouldDisplayLagunaPullConversationControls
{
  v3 = [(CSDStatusBarResolver *)self featureFlags];
  unsigned int v4 = [v3 lagunaEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(CSDStatusBarResolver *)self featureFlags];
  unsigned int v6 = [v5 lagunaPullBackEnabled];

  if (!v6) {
    return 0;
  }
  id v7 = [(CSDStatusBarResolver *)self resolvedConversation];

  if (!v7) {
    return 0;
  }
  id v8 = [(CSDStatusBarResolver *)self callCenter];
  id v9 = [v8 neighborhoodActivityConduit];
  uint64_t v10 = [(CSDStatusBarResolver *)self resolvedConversation];
  unsigned __int8 v11 = [v9 canPullBackConversation:v10];

  return v11;
}

- (BOOL)callProviderSupportsSystemControls
{
  v3 = [(CSDStatusBarResolver *)self resolvedCall];
  unsigned int v4 = [v3 provider];
  if ([v4 isFaceTimeProvider])
  {
    BOOL v5 = 1;
  }
  else
  {
    unsigned int v6 = [(CSDStatusBarResolver *)self resolvedAVLessConversation];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)conversationStateSupportsSystemControls
{
  v3 = [(CSDStatusBarResolver *)self resolvedConversation];
  if ([v3 state] == (id)1)
  {
    unsigned int v4 = [(CSDStatusBarResolver *)self resolvedConversation];
    id v5 = [v4 avMode];

    if (v5 == (id)2)
    {
      LOBYTE(v6) = 0;
      return v6;
    }
  }
  else
  {
  }
  id v7 = [(CSDStatusBarResolver *)self resolvedAVLessConversation];

  if (v7)
  {
    id v8 = [(CSDStatusBarResolver *)self resolvedAVLessConversation];
    unsigned int v9 = [v8 isContinuitySession] ^ 1;
  }
  else
  {
    unsigned int v9 = 0;
  }
  uint64_t v10 = [(CSDStatusBarResolver *)self resolvedCall];
  if ([v10 isConversation])
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    unsigned __int8 v11 = [(CSDStatusBarResolver *)self resolvedCall];
    unsigned int v6 = [v11 isVideo] ^ 1 | v9;
  }
  return v6;
}

- (BOOL)callStatusSupportsSystemControls
{
  v3 = [(CSDStatusBarResolver *)self resolvedAVLessConversation];
  unsigned int v4 = [(CSDStatusBarResolver *)self callCenter];
  id v5 = [(CSDStatusBarResolver *)self resolvedCall];
  uint64_t v6 = [v4 activeConversationForCall:v5];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v3;
  }
  id v9 = v8;

  if ([v9 letMeInRequestState] == (id)2 && objc_msgSend(v9, "state") == (id)1
    || ([(CSDStatusBarResolver *)self resolvedCall],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 wantsHoldMusic],
        v10,
        (v11 & 1) != 0)
    || ([v9 isContinuitySession] & 1) != 0)
  {
    BOOL v12 = 0;
  }
  else
  {
    uint64_t v14 = [(CSDStatusBarResolver *)self resolvedCall];
    if ([v14 status] == 1)
    {
      BOOL v12 = 1;
    }
    else
    {
      id v15 = [(CSDStatusBarResolver *)self resolvedCall];
      BOOL v12 = [v15 status] == 3 || v3 != 0;
    }
  }

  return v12;
}

- (void)setShouldRegisterForPillDatasource:(BOOL)a3
{
  if (self->_shouldRegisterForPillDatasource != a3)
  {
    self->_shouldRegisterForPillDatasource = a3;
    id v4 = [(CSDStatusBarResolver *)self delegate];
    [v4 pillDataSourceRegistrationChangedForResolver:self];
  }
}

- (void)callsChangedForCallCenterObserver:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "callsChangedForCallCenterObserver", buf, 2u);
  }

  uint64_t v6 = [v4 callContainer];
  id v7 = [(CSDStatusBarResolver *)self resolvedCallForActiveDescriptor:v6];

  id v8 = [v4 callContainer];

  BOOL v9 = [v8 currentAudioAndVideoCallCount] != 0;
  uint64_t v10 = [(CSDStatusBarResolver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D6E68;
  block[3] = &unk_1005050D0;
  BOOL v14 = v9;
  void block[4] = self;
  id v13 = v7;
  id v11 = v7;
  dispatch_async(v10, block);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 UUID];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSDStatusBarResolver conversationManager:removedActiveConversation:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Updating status bar triggered by removedActiveConversation for conversation UUID %@", buf, 0x16u);
  }
  id v8 = [(CSDStatusBarResolver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D6FF4;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 UUID];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSDStatusBarResolver conversationManager:addedActiveConversation:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Updating status bar triggered by addedActiveConversation for conversation UUID %@", buf, 0x16u);
  }
  id v8 = [(CSDStatusBarResolver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7140;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 UUID];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSDStatusBarResolver conversationManager:stateChangedForConversation:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Updating status bar triggered by stateChangedForConversation for conversation UUID %@", buf, 0x16u);
  }
  id v8 = [(CSDStatusBarResolver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D728C;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 UUID];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSDStatusBarResolver conversationManager:activitySessionsChangedForConversation:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Updating status bar triggered by activitySessionsChangedForConversation for conversation UUID %@", buf, 0x16u);
  }
  id v8 = [(CSDStatusBarResolver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D73D8;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 UUID];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSDStatusBarResolver conversationManager:activeRemoteParticipantsChangedForConversation:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Updating status bar triggered by activeRemoteParticipantsChangedForConversation for conversation UUID %@", buf, 0x16u);
  }
  id v8 = [(CSDStatusBarResolver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7524;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)conversationManager:(id)a3 localVideoToggledForConversation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 UUID];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSDStatusBarResolver conversationManager:localVideoToggledForConversation:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Updating status bar triggered by localVideoToggledForConversation for conversation UUID %@", buf, 0x16u);
  }
  id v8 = [(CSDStatusBarResolver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7670;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (void)conversationManager:(id)a3 handoffEligibilityChangedForConversation:(id)a4
{
  id v5 = a4;
  uint64_t v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 UUID];
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSDStatusBarResolver conversationManager:handoffEligibilityChangedForConversation:]";
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Updating status bar triggered by handoffEligibilityChangedForConversation for conversation UUID %@", buf, 0x16u);
  }
  id v8 = [(CSDStatusBarResolver *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D77BC;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v8, block);
}

- (CSDStatusBarResolverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDStatusBarResolverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldRegisterForPillDatasource
{
  return self->_shouldRegisterForPillDatasource;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (os_unfair_lock_s)durationUpdateTimerLock
{
  return self->_durationUpdateTimerLock;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (CSDProcessObserverProtocol)inCallServiceProcessObserver
{
  return self->_inCallServiceProcessObserver;
}

- (CSDProcessObserverProtocol)springBoardProcessObserver
{
  return self->_springBoardProcessObserver;
}

- (NSTimer)callDurationUpdateTimer
{
  return self->_callDurationUpdateTimer;
}

- (void)setCallDurationUpdateTimer:(id)a3
{
}

- (STCallingStatusDomainCallDescriptor)resolvedDescriptor
{
  return self->_resolvedDescriptor;
}

- (void)setResolvedDescriptor:(id)a3
{
}

- (int64_t)inCallServiceProcessState
{
  return self->_inCallServiceProcessState;
}

- (void)setInCallServiceProcessState:(int64_t)a3
{
  self->_inCallServiceProcessState = a3;
}

- (NSNumber)springBoardPID
{
  return self->_springBoardPID;
}

- (void)setSpringBoardPID:(id)a3
{
  self->_springBoardPID = (NSNumber *)a3;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (TUCall)screenedCallToShow
{
  return self->_screenedCallToShow;
}

- (void)setScreenedCallToShow:(id)a3
{
}

- (CSDCall)resolvedCallForActiveDescriptor
{
  return self->_resolvedCallForActiveDescriptor;
}

- (void)setResolvedCallForActiveDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedCallForActiveDescriptor, 0);
  objc_storeStrong((id *)&self->_screenedCallToShow, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_resolvedDescriptor, 0);
  objc_storeStrong((id *)&self->_callDurationUpdateTimer, 0);
  objc_storeStrong((id *)&self->_springBoardProcessObserver, 0);
  objc_storeStrong((id *)&self->_inCallServiceProcessObserver, 0);
  objc_storeStrong((id *)&self->_callCenterObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end